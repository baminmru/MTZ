
/* --VRCAT*/

 create or replace package body VRCAT as

procedure VRCAT_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='VRCAT'
then
declare cursor child_VRCATCatalog is select VRCATCatalog.VRCATCatalogid ID from VRCATCatalog where  VRCATCatalog.InstanceID = ainstanceid;
row_VRCATCatalog  child_VRCATCatalog%ROWTYPE;
begin
--open child_VRCATCatalog;
for row_VRCATCatalog in child_VRCATCatalog loop
 VRCATCatalog_DELETE (acursession,row_VRCATCatalog.id,aInstanceID);
end loop;
--close child_VRCATCatalog;
end;
return;
<<del_error>>
return;
end if;
end;
procedure VRCAT_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'VRCAT'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_VRCATCatalog is select VRCATCatalog.VRCATCatalogid ID from VRCATCatalog where  VRCATCatalog.InstanceID = arowid;
ROW_VRCATCatalog  lch_VRCATCatalog%ROWTYPE;
begin
--open lch_VRCATCatalog;
for row_VRCATCatalog in lch_VRCATCatalog loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCATCatalog where VRCATCatalogid=row_VRCATCatalog.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCATCatalog;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCATCatalog;
     return;
   end if; 
 end if; 
 VRCATCatalog_HCL (acursession,ROW_VRCATCatalog.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCATCatalog;
   return;
 end if;
 end loop;
--close lch_VRCATCatalog;
end;
 end if;
aIsLocked:=0;
end;
procedure VRCAT_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'VRCAT'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_VRCATCatalog is select VRCATCatalog.VRCATCatalogid id from VRCATCatalog where  VRCATCatalog.InstanceID = arowid;
row_VRCATCatalog  pch_VRCATCatalog%ROWTYPE;
begin
--open pch_VRCATCatalog;
for row_VRCATCatalog in  pch_VRCATCatalog loop
 VRCATCatalog_SINIT( acursession,row_VRCATCatalog.id,assid);
 VRCATCatalog_propagate( acursession,row_VRCATCatalog.id);
end loop;
--close pch_VRCATCatalog;
end;
 end if; 
end;



procedure VRCATCatalog_BRIEF  (
 aCURSESSION CHAR,
 aVRCATCatalogid CHAR,
 aBRIEF out varchar2
) as 
 aaccess integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 existsCnt integer;
begin
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
if aVRCATCatalogid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCATCatalog where VRCATCatalogID=aVRCATCatalogID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCATCatalog where VRCATCatalogid=aVRCATCatalogID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCATCatalog');
    return;
  end if;
  aBRIEF:=func.VRCATCatalog_BRIEF_F(aVRCATCatalogid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCATCatalog_DELETE /*Каталог клиентов*/ (
 aCURSESSION CHAR,
 aVRCATCatalogid CHAR,
 ainstanceid char
) as 
 aSysLogID CHAR(38);
 aaccess integer;
 aSysInstID CHAR(38);
 atmpID CHAR(38);
 existsCnt integer;
 aChildListid CHAR(38);
  begin  
 select  Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0 then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from VRCATCatalog where VRCATCatalogID=aVRCATCatalogID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCATCatalog where VRCATCatalogid=aVRCATCatalogID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCATCatalog',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCATCatalog');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCATCatalog_ISLOCKED( acursession=>acursession,aROWID=>aVRCATCatalogid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCATCatalog');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_VRCATClients is select VRCATClients.VRCATClientsid ID from VRCATClients where  VRCATClients.ParentStructRowID = aVRCATCatalogid;
    child_VRCATClients_rec  child_VRCATClients%ROWTYPE;
    begin
    --open child_VRCATClients;
      for child_VRCATClients_rec in child_VRCATClients loop
      VRCATClients_DELETE (acursession,child_VRCATClients_rec.id,aInstanceid);
      end loop;
      --close child_VRCATClients;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCATCatalog',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCATCatalogid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCATCatalog is select  instanceid ID from instance where OwnerPartName ='VRCATCatalog' and OwnerRowID=aVRCATCatalogid;
row_VRCATCatalog  chld_VRCATCatalog%ROWTYPE;
begin
--open chld_VRCATCatalog;
for row_VRCATCatalog in chld_VRCATCatalog loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCATCatalog.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCATCatalog.id);
end loop;
--close chld_VRCATCatalog;
end ;
  delete from  VRCATCatalog 
  where  VRCATCatalogID = aVRCATCatalogID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Каталог клиентов*/
procedure VRCATCatalog_SAVE /*Каталог клиентов*/ (
 aCURSESSION CHAR,
 aVRCATCatalogid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aName
 VARCHAR2 := null /* Название *//* Название */
,aMarket CHAR := null /* Рынок *//* Рынок */
,aAccessLevel CHAR := null /* Доступ *//* Доступ */
) as 
aSysLogid CHAR(38);
 aUniqueRowCount integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 aaccess int;
 aSysInstID CHAR(38);
 existsCnt integer;
 begin  
 select Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt =0 
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from VRCATCatalog where VRCATCatalogID=aVRCATCatalogID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCATCatalog where VRCATCatalogid=aVRCATCatalogID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCATCatalog',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCATCatalog');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCATCatalog_ISLOCKED( acursession=>acursession,aROWID=>aVRCATCatalogid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCATCatalog');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCATCatalog',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCATCatalogid,aLogInstanceID=>aInstanceID);
 update  VRCATCatalog set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  Name=aName
,
  Market=aMarket
,
  AccessLevel=aAccessLevel
  where  VRCATCatalogID = aVRCATCatalogID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCATCatalog',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCATCatalog');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCATCatalog');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCATCatalog',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCATCatalogid,aLogInstanceID=>aInstanceID);
 insert into   VRCATCatalog
 (  VRCATCatalogID 
,ParentRowid
,InstanceID
,Name

,Market

,AccessLevel

 ) values ( aVRCATCatalogID 
,aParentRowid
,aInstanceID
,aName

,aMarket

,aAccessLevel

 ); 
 VRCATCatalog_SINIT( aCURSESSION,aVRCATCatalogid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCATCatalog_PARENT /*Каталог клиентов*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR ,
 aParentTable out varchar2
) as 
existsCnt integer;
 begin  
 -- checking the_session  --
select count(*)into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from VRCATCatalog where  VRCATCatalogid=aRowID;
 end; 


procedure VRCATCatalog_ISLOCKED /*Каталог клиентов*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 aParentTable varchar2(255); 
 existsCnt integer; 
  astr varchar2(4000);
begin
 aisLocked := 0;
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCATCatalog where VRCATCatalogid=aRowID;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     return;
   else 
     aisLocked := 2; /* CheckOut by caller */
     return;
   end  if; 
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     return;
   else 
     aisLocked := 1; /* Locked by caller */
     return;
   end if;  
 end if;  
 aisLocked := 0; 
  VRCATCatalog_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRCAT.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCATCatalog_LOCK /*Каталог клиентов*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 atmpID CHAR(38);
 aaccess integer;
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer; 
 begin  
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
 -- checking the_session  --
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 VRCATCatalog_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCATCatalog_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCATCatalog where VRCATCatalogid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCATCatalog');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCATCatalog set LockUserID =auserID ,LockSessionID =null where VRCATCatalogid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCATCatalog set LockUserID =null,LockSessionID =aCURSESSION  where VRCATCatalogid=aRowID;
     return;
   end if;
 end ;


procedure VRCATCatalog_HCL /*Каталог клиентов*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
achildlistid CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin  
 select usersid into auserID from the_session where the_sessionid=acursession;
-- verify child locks
declare cursor lch_VRCATClients is select VRCATClients.VRCATClientsid ID from VRCATClients where  VRCATClients.ParentStructRowID = aRowid;
row_VRCATClients lch_VRCATClients%ROWTYPE;
begin  
--open lch_VRCATClients;
for row_VRCATClients in lch_VRCATClients
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from VRCATClients where VRCATClientsid=row_VRCATClients.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCATClients;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_VRCATClients;
     return;
   end if; 
 end if;  
 VRCATClients_HCL (acursession,row_VRCATClients.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCATClients;
   return;
 end if;
end loop;
--close lch_VRCATClients;
end;
aIsLocked :=0;
end;


procedure VRCATCatalog_UNLOCK /*Каталог клиентов*/ (
 aCURSESSION CHAR,
 aRowID CHAR 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer;
 begin  
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if  existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 VRCATCatalog_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCATCatalog set LockUserID =null  where VRCATCatalogid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCATCatalog set LockSessionID =null  where VRCATCatalogid=aRowID;
     return;
   end if;
 end; 


procedure VRCATCatalog_SINIT /*Каталог клиентов*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
) as 
 aParentID CHAR(38);
 aParentTable varchar2(255); 
 aStr varchar2(4000);
 aStyleID CHAR(38);
 atmpID CHAR(38);
 aaccess integer; 
begin
 select  SecurityStyleID into atmpID from VRCATCatalog where VRCATCatalogid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCATCatalog');
    return;
  end if;
if aSecurityStyleID is null then
 VRCATCatalog_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCATCatalog set securitystyleid =aStyleID where VRCATCatalogid = aRowID;
else 
 update VRCATCatalog set securitystyleid =aSecurityStyleID where VRCATCatalogid = aRowID;
end if; 
end ; 


procedure VRCATCatalog_propagate /*Каталог клиентов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCATCatalog where VRCATCatalogid=aRowid;
declare cursor pch_VRCATClients  is select VRCATClients.VRCATClientsid ID from VRCATClients where  VRCATClients.ParentStructRowID = aRowid;
row_VRCATClients  pch_VRCATClients%ROWTYPE;
begin
--open pch_VRCATClients;
for row_VRCATClients in pch_VRCATClients loop
   VRCATClients_SINIT( acursession,row_VRCATClients.id,assid);
   VRCATClients_propagate( acursession,row_VRCATClients.id);
end loop;
--close pch_VRCATClients;
end;
end;



procedure VRCATClients_BRIEF  (
 aCURSESSION CHAR,
 aVRCATClientsid CHAR,
 aBRIEF out varchar2
) as 
 aaccess integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 existsCnt integer;
begin
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
if aVRCATClientsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCATClients where VRCATClientsID=aVRCATClientsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCATClients where VRCATClientsid=aVRCATClientsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCATClients');
    return;
  end if;
  aBRIEF:=func.VRCATClients_BRIEF_F(aVRCATClientsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCATClients_DELETE /*Клиенты*/ (
 aCURSESSION CHAR,
 aVRCATClientsid CHAR,
 ainstanceid char
) as 
 aSysLogID CHAR(38);
 aaccess integer;
 aSysInstID CHAR(38);
 atmpID CHAR(38);
 existsCnt integer;
 aChildListid CHAR(38);
  begin  
 select  Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0 then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from VRCATClients where VRCATClientsID=aVRCATClientsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCATClients where VRCATClientsid=aVRCATClientsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCATClients',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCATClients');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCATClients_ISLOCKED( acursession=>acursession,aROWID=>aVRCATClientsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCATClients');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCATClients',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCATClientsid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCATClients is select  instanceid ID from instance where OwnerPartName ='VRCATClients' and OwnerRowID=aVRCATClientsid;
row_VRCATClients  chld_VRCATClients%ROWTYPE;
begin
--open chld_VRCATClients;
for row_VRCATClients in chld_VRCATClients loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCATClients.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCATClients.id);
end loop;
--close chld_VRCATClients;
end ;
  delete from  VRCATClients 
  where  VRCATClientsID = aVRCATClientsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Клиенты*/
procedure VRCATClients_SAVE /*Клиенты*/ (
 aCURSESSION CHAR,
 aVRCATClientsid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aClient CHAR/* Клиент *//* Клиент */
,aInterest CHAR := null /* Заинтересованность *//* Заинтересованность */
) as 
aSysLogid CHAR(38);
 aUniqueRowCount integer;
 atmpStr varchar2(255);
 atmpID CHAR(38);
 aaccess int;
 aSysInstID CHAR(38);
 existsCnt integer;
 begin  
 select Instanceid into aSysInstID from instance where objtype='MTZSYSTEM';
 -- checking the_session  --
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt =0 
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from VRCATClients where VRCATClientsID=aVRCATClientsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCATClients where VRCATClientsid=aVRCATClientsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCATClients',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCATClients');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCATClients_ISLOCKED( acursession=>acursession,aROWID=>aVRCATClientsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCATClients');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCATClients',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCATClientsid,aLogInstanceID=>aInstanceID);
 update  VRCATClients set ChangeStamp=sysdate
,
  Client=aClient
,
  Interest=aInterest
  where  VRCATClientsID = aVRCATClientsID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from VRCATCatalog where VRCATCatalogid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCATClients',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCATClients');
      return;
    end if;
 end if;
 VRCATCatalog_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCATClients');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCATClients',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCATClientsid,aLogInstanceID=>aInstanceID);
 insert into   VRCATClients
 (  VRCATClientsID 
,ParentStructRowID
,Client

,Interest

 ) values ( aVRCATClientsID 
,aParentStructRowID
,aClient

,aInterest

 ); 
 VRCATClients_SINIT( aCURSESSION,aVRCATClientsid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCATClients_PARENT /*Клиенты*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR ,
 aParentTable out varchar2
) as 
existsCnt integer;
 begin  
 -- checking the_session  --
select count(*)into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
  select ParentStructRowID into aParentID  from VRCATClients where  VRCATClientsid=aRowID;
  aParentTable := 'VRCATCatalog';
 end; 


procedure VRCATClients_ISLOCKED /*Клиенты*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 aParentTable varchar2(255); 
 existsCnt integer; 
  astr varchar2(4000);
begin
 aisLocked := 0;
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCATClients where VRCATClientsid=aRowID;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     return;
   else 
     aisLocked := 2; /* CheckOut by caller */
     return;
   end  if; 
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     return;
   else 
     aisLocked := 1; /* Locked by caller */
     return;
   end if;  
 end if;  
 aisLocked := 0; 
  VRCATClients_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRCAT.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCATClients_LOCK /*Клиенты*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 atmpID CHAR(38);
 aaccess integer;
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer; 
 begin  
 select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0;
 -- checking the_session  --
if existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 VRCATClients_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCATClients_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCATClients where VRCATClientsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCATClients');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCATClients set LockUserID =auserID ,LockSessionID =null where VRCATClientsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCATClients set LockUserID =null,LockSessionID =aCURSESSION  where VRCATClientsid=aRowID;
     return;
   end if;
 end ;


procedure VRCATClients_HCL /*Клиенты*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) as 
achildlistid CHAR(38);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin  
 select usersid into auserID from the_session where the_sessionid=acursession;
aIsLocked :=0;
end;


procedure VRCATClients_UNLOCK /*Клиенты*/ (
 aCURSESSION CHAR,
 aRowID CHAR 
) as 
 aParentID CHAR(38);
 aUserID CHAR(38);
 aIsLocked integer;
 aParentTable varchar2(255); 
 existsCnt integer;
 begin  
 -- checking the_session  --
select count(*) into existsCnt from the_session where the_sessionid=acursession and closed=0 ;
if  existsCnt=0
  then
    raise_application_error(-20000,'Сессия уже завершена.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 VRCATClients_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCATClients set LockUserID =null  where VRCATClientsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCATClients set LockSessionID =null  where VRCATClientsid=aRowID;
     return;
   end if;
 end; 


procedure VRCATClients_SINIT /*Клиенты*/ (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
) as 
 aParentID CHAR(38);
 aParentTable varchar2(255); 
 aStr varchar2(4000);
 aStyleID CHAR(38);
 atmpID CHAR(38);
 aaccess integer; 
begin
 select  SecurityStyleID into atmpID from VRCATClients where VRCATClientsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCATClients');
    return;
  end if;
if aSecurityStyleID is null then
 VRCATClients_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCATClients set securitystyleid =aStyleID where VRCATClientsid = aRowID;
else 
 update VRCATClients set securitystyleid =aSecurityStyleID where VRCATClientsid = aRowID;
end if; 
end ; 


procedure VRCATClients_propagate /*Клиенты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCATClients where VRCATClientsid=aRowid;
end;


end VRCAT;

/



