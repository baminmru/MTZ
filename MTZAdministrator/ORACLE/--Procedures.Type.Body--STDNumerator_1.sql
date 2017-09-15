
/* --STDNumerator*/

 create or replace package body STDNumerator as

procedure STDNumerator_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='STDNumerator'
then
declare cursor child_Num_zones is select Num_zones.Num_zonesid ID from Num_zones where  Num_zones.InstanceID = ainstanceid;
row_Num_zones  child_Num_zones%ROWTYPE;
begin
--open child_Num_zones;
for row_Num_zones in child_Num_zones loop
 Num_zones_DELETE (acursession,row_Num_zones.id,aInstanceID);
end loop;
--close child_Num_zones;
end;
declare cursor child_Num_head is select Num_head.Num_headid ID from Num_head where  Num_head.InstanceID = ainstanceid;
row_Num_head  child_Num_head%ROWTYPE;
begin
--open child_Num_head;
for row_Num_head in child_Num_head loop
 Num_head_DELETE (acursession,row_Num_head.id,aInstanceID);
end loop;
--close child_Num_head;
end;
return;
<<del_error>>
return;
end if;
end;
procedure STDNumerator_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'STDNumerator'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_Num_zones is select Num_zones.Num_zonesid ID from Num_zones where  Num_zones.InstanceID = arowid;
ROW_Num_zones  lch_Num_zones%ROWTYPE;
begin
--open lch_Num_zones;
for row_Num_zones in lch_Num_zones loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from Num_zones where Num_zonesid=row_Num_zones.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Num_zones;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_Num_zones;
     return;
   end if; 
 end if; 
 Num_zones_HCL (acursession,ROW_Num_zones.id,aisLocked);
 if aisLocked >2 then
   close lch_Num_zones;
   return;
 end if;
 end loop;
--close lch_Num_zones;
end;
declare cursor lch_Num_head is select Num_head.Num_headid ID from Num_head where  Num_head.InstanceID = arowid;
ROW_Num_head  lch_Num_head%ROWTYPE;
begin
--open lch_Num_head;
for row_Num_head in lch_Num_head loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from Num_head where Num_headid=row_Num_head.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Num_head;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_Num_head;
     return;
   end if; 
 end if; 
 Num_head_HCL (acursession,ROW_Num_head.id,aisLocked);
 if aisLocked >2 then
   close lch_Num_head;
   return;
 end if;
 end loop;
--close lch_Num_head;
end;
 end if;
aIsLocked:=0;
end;
procedure STDNumerator_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'STDNumerator'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_Num_zones is select Num_zones.Num_zonesid id from Num_zones where  Num_zones.InstanceID = arowid;
row_Num_zones  pch_Num_zones%ROWTYPE;
begin
--open pch_Num_zones;
for row_Num_zones in  pch_Num_zones loop
 Num_zones_SINIT( acursession,row_Num_zones.id,assid);
 Num_zones_propagate( acursession,row_Num_zones.id);
end loop;
--close pch_Num_zones;
end;
declare cursor pch_Num_head is select Num_head.Num_headid id from Num_head where  Num_head.InstanceID = arowid;
row_Num_head  pch_Num_head%ROWTYPE;
begin
--open pch_Num_head;
for row_Num_head in  pch_Num_head loop
 Num_head_SINIT( acursession,row_Num_head.id,assid);
 Num_head_propagate( acursession,row_Num_head.id);
end loop;
--close pch_Num_head;
end;
 end if; 
end;



procedure Num_zones_BRIEF  (
 aCURSESSION CHAR,
 aNum_zonesid CHAR,
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
if aNum_zonesid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Num_zones where Num_zonesID=aNum_zonesID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Num_zones where Num_zonesid=aNum_zonesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Num_zones');
    return;
  end if;
  aBRIEF:=func.Num_zones_BRIEF_F(aNum_zonesid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Num_zones_DELETE /*Зоны уникальных нумеров*/ (
 aCURSESSION CHAR,
 aNum_zonesid CHAR,
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
select count(*) into existsCnt from Num_zones where Num_zonesID=aNum_zonesID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Num_zones where Num_zonesid=aNum_zonesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Num_zones',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Num_zones');
      return;
    end if;
  end if;
 --  verify lock  --
 Num_zones_ISLOCKED( acursession=>acursession,aROWID=>aNum_zonesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Num_zones');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_Num_Values is select Num_Values.Num_Valuesid ID from Num_Values where  Num_Values.ParentStructRowID = aNum_zonesid;
    child_Num_Values_rec  child_Num_Values%ROWTYPE;
    begin
    --open child_Num_Values;
      for child_Num_Values_rec in child_Num_Values loop
      Num_Values_DELETE (acursession,child_Num_Values_rec.id,aInstanceid);
      end loop;
      --close child_Num_Values;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'Num_zones',
 aVERB=>'DELETEROW',  aThe_Resource=>aNum_zonesid, aLogInstanceID=>aInstanceID);
declare cursor chld_Num_zones is select  instanceid ID from instance where OwnerPartName ='Num_zones' and OwnerRowID=aNum_zonesid;
row_Num_zones  chld_Num_zones%ROWTYPE;
begin
--open chld_Num_zones;
for row_Num_zones in chld_Num_zones loop
 Kernel.INSTANCE_OWNER (acursession,row_Num_zones.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Num_zones.id);
end loop;
--close chld_Num_zones;
end ;
  delete from  Num_zones 
  where  Num_zonesID = aNum_zonesID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Зоны*/
procedure Num_zones_SAVE /*Зоны уникальных нумеров*/ (
 aCURSESSION CHAR,
 aNum_zonesid CHAR,
aInstanceID CHAR 
,aZoneMask
 VARCHAR2/* Маска зоны *//* Маска зоны */
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
select count(*) into existsCnt from Num_zones where Num_zonesID=aNum_zonesID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Num_zones where Num_zonesid=aNum_zonesID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Num_zones',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Num_zones');
      return;
    end if;
  end if;
 --  verify lock  --
 Num_zones_ISLOCKED( acursession=>acursession,aROWID=>aNum_zonesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Num_zones');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Num_zones',
 aVERB=>'EDITROW',  aThe_Resource=>aNum_zonesid,aLogInstanceID=>aInstanceID);
 update  Num_zones set ChangeStamp=sysdate
,
  ZoneMask=aZoneMask
  where  Num_zonesID = aNum_zonesID; 
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from Num_zones where InstanceID=aInstanceID 
 and ZoneMask=aZoneMask;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Num_zones');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Num_zones',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Num_zones');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Num_zones');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Num_zones',
 aVERB=>'CREATEROW',  aThe_Resource=>aNum_zonesid,aLogInstanceID=>aInstanceID);
 insert into   Num_zones
 (  Num_zonesID 
,InstanceID
,ZoneMask

 ) values ( aNum_zonesID 
,aInstanceID
,aZoneMask

 ); 
 Num_zones_SINIT( aCURSESSION,aNum_zonesid,atmpid);
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from Num_zones where InstanceID=aInstanceID 
 and ZoneMask=aZoneMask;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Num_zones');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure Num_zones_PARENT /*Зоны уникальных нумеров*/ (
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
  select  INSTANCEID into aParentID from Num_zones where  Num_zonesid=aRowID;
 end; 


procedure Num_zones_ISLOCKED /*Зоны уникальных нумеров*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Num_zones where Num_zonesid=aRowID;
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
  Num_zones_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDNumerator.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Num_zones_LOCK /*Зоны уникальных нумеров*/ (
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
 Num_zones_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Num_zones_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Num_zones where Num_zonesid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Num_zones');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Num_zones set LockUserID =auserID ,LockSessionID =null where Num_zonesid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Num_zones set LockUserID =null,LockSessionID =aCURSESSION  where Num_zonesid=aRowID;
     return;
   end if;
 end ;


procedure Num_zones_HCL /*Зоны уникальных нумеров*/ (
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
declare cursor lch_Num_Values is select Num_Values.Num_Valuesid ID from Num_Values where  Num_Values.ParentStructRowID = aRowid;
row_Num_Values lch_Num_Values%ROWTYPE;
begin  
--open lch_Num_Values;
for row_Num_Values in lch_Num_Values
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from Num_Values where Num_Valuesid=row_Num_Values.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Num_Values;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_Num_Values;
     return;
   end if; 
 end if;  
 Num_Values_HCL (acursession,row_Num_Values.id,aisLocked);
 if aisLocked >2 then
   close lch_Num_Values;
   return;
 end if;
end loop;
--close lch_Num_Values;
end;
aIsLocked :=0;
end;


procedure Num_zones_UNLOCK /*Зоны уникальных нумеров*/ (
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
 Num_zones_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Num_zones set LockUserID =null  where Num_zonesid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Num_zones set LockSessionID =null  where Num_zonesid=aRowID;
     return;
   end if;
 end; 


procedure Num_zones_SINIT /*Зоны уникальных нумеров*/ (
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
 select  SecurityStyleID into atmpID from Num_zones where Num_zonesid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Num_zones');
    return;
  end if;
if aSecurityStyleID is null then
 Num_zones_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Num_zones set securitystyleid =aStyleID where Num_zonesid = aRowID;
else 
 update Num_zones set securitystyleid =aSecurityStyleID where Num_zonesid = aRowID;
end if; 
end ; 


procedure Num_zones_propagate /*Зоны уникальных нумеров*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Num_zones where Num_zonesid=aRowid;
declare cursor pch_Num_Values  is select Num_Values.Num_Valuesid ID from Num_Values where  Num_Values.ParentStructRowID = aRowid;
row_Num_Values  pch_Num_Values%ROWTYPE;
begin
--open pch_Num_Values;
for row_Num_Values in pch_Num_Values loop
   Num_Values_SINIT( acursession,row_Num_Values.id,assid);
   Num_Values_propagate( acursession,row_Num_Values.id);
end loop;
--close pch_Num_Values;
end;
end;



procedure Num_Values_BRIEF  (
 aCURSESSION CHAR,
 aNum_Valuesid CHAR,
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
if aNum_Valuesid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Num_Values where Num_ValuesID=aNum_ValuesID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Num_Values where Num_Valuesid=aNum_ValuesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Num_Values');
    return;
  end if;
  aBRIEF:=func.Num_Values_BRIEF_F(aNum_Valuesid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Num_Values_DELETE /*уникальные номера*/ (
 aCURSESSION CHAR,
 aNum_Valuesid CHAR,
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
select count(*) into existsCnt from Num_Values where Num_ValuesID=aNum_ValuesID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Num_Values where Num_Valuesid=aNum_ValuesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Num_Values',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Num_Values');
      return;
    end if;
  end if;
 --  verify lock  --
 Num_Values_ISLOCKED( acursession=>acursession,aROWID=>aNum_Valuesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Num_Values');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'Num_Values',
 aVERB=>'DELETEROW',  aThe_Resource=>aNum_Valuesid, aLogInstanceID=>aInstanceID);
declare cursor chld_Num_Values is select  instanceid ID from instance where OwnerPartName ='Num_Values' and OwnerRowID=aNum_Valuesid;
row_Num_Values  chld_Num_Values%ROWTYPE;
begin
--open chld_Num_Values;
for row_Num_Values in chld_Num_Values loop
 Kernel.INSTANCE_OWNER (acursession,row_Num_Values.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Num_Values.id);
end loop;
--close chld_Num_Values;
end ;
  delete from  Num_Values 
  where  Num_ValuesID = aNum_ValuesID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Номера*/
procedure Num_Values_SAVE /*уникальные номера*/ (
 aCURSESSION CHAR,
 aNum_Valuesid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,athe_Value
 NUMBER/* Значение *//* Значение */
,aOwnerPartName
 VARCHAR2 := null /* Раздел *//* Раздел */
,aOwnerRowID CHAR := null /* Идентификатор строки *//* Идентификатор строки */
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
select count(*) into existsCnt from Num_Values where Num_ValuesID=aNum_ValuesID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Num_Values where Num_Valuesid=aNum_ValuesID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Num_Values',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Num_Values');
      return;
    end if;
  end if;
 --  verify lock  --
 Num_Values_ISLOCKED( acursession=>acursession,aROWID=>aNum_Valuesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Num_Values');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Num_Values',
 aVERB=>'EDITROW',  aThe_Resource=>aNum_Valuesid,aLogInstanceID=>aInstanceID);
 update  Num_Values set ChangeStamp=sysdate
,
  the_Value=athe_Value
,
  OwnerPartName=aOwnerPartName
,
  OwnerRowID=aOwnerRowID
  where  Num_ValuesID = aNum_ValuesID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from Num_Values where ParentStructRowID=aParentStructRowID 
 and the_Value=athe_Value;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Num_Values');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from Num_zones where Num_zonesid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Num_Values',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Num_Values');
      return;
    end if;
 end if;
 Num_zones_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Num_Values');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Num_Values',
 aVERB=>'CREATEROW',  aThe_Resource=>aNum_Valuesid,aLogInstanceID=>aInstanceID);
 insert into   Num_Values
 (  Num_ValuesID 
,ParentStructRowID
,the_Value

,OwnerPartName

,OwnerRowID

 ) values ( aNum_ValuesID 
,aParentStructRowID
,athe_Value

,aOwnerPartName

,aOwnerRowID

 ); 
 Num_Values_SINIT( aCURSESSION,aNum_Valuesid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from Num_Values where ParentStructRowID=aParentStructRowID 
 and the_Value=athe_Value;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Num_Values');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure Num_Values_PARENT /*уникальные номера*/ (
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
  select ParentStructRowID into aParentID  from Num_Values where  Num_Valuesid=aRowID;
  aParentTable := 'Num_zones';
 end; 


procedure Num_Values_ISLOCKED /*уникальные номера*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Num_Values where Num_Valuesid=aRowID;
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
  Num_Values_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDNumerator.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Num_Values_LOCK /*уникальные номера*/ (
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
 Num_Values_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Num_Values_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Num_Values where Num_Valuesid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Num_Values');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Num_Values set LockUserID =auserID ,LockSessionID =null where Num_Valuesid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Num_Values set LockUserID =null,LockSessionID =aCURSESSION  where Num_Valuesid=aRowID;
     return;
   end if;
 end ;


procedure Num_Values_HCL /*уникальные номера*/ (
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


procedure Num_Values_UNLOCK /*уникальные номера*/ (
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
 Num_Values_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Num_Values set LockUserID =null  where Num_Valuesid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Num_Values set LockSessionID =null  where Num_Valuesid=aRowID;
     return;
   end if;
 end; 


procedure Num_Values_SINIT /*уникальные номера*/ (
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
 select  SecurityStyleID into atmpID from Num_Values where Num_Valuesid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Num_Values');
    return;
  end if;
if aSecurityStyleID is null then
 Num_Values_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Num_Values set securitystyleid =aStyleID where Num_Valuesid = aRowID;
else 
 update Num_Values set securitystyleid =aSecurityStyleID where Num_Valuesid = aRowID;
end if; 
end ; 


procedure Num_Values_propagate /*уникальные номера*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Num_Values where Num_Valuesid=aRowid;
end;



procedure Num_head_BRIEF  (
 aCURSESSION CHAR,
 aNum_headid CHAR,
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
if aNum_headid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Num_head where Num_headID=aNum_headID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Num_head where Num_headid=aNum_headID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Num_head');
    return;
  end if;
  aBRIEF:=func.Num_head_BRIEF_F(aNum_headid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Num_head_DELETE /*Описание нумератора*/ (
 aCURSESSION CHAR,
 aNum_headid CHAR,
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
select count(*) into existsCnt from Num_head where Num_headID=aNum_headID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Num_head where Num_headid=aNum_headID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Num_head',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Num_head');
      return;
    end if;
  end if;
 --  verify lock  --
 Num_head_ISLOCKED( acursession=>acursession,aROWID=>aNum_headid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Num_head');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'Num_head',
 aVERB=>'DELETEROW',  aThe_Resource=>aNum_headid, aLogInstanceID=>aInstanceID);
declare cursor chld_Num_head is select  instanceid ID from instance where OwnerPartName ='Num_head' and OwnerRowID=aNum_headid;
row_Num_head  chld_Num_head%ROWTYPE;
begin
--open chld_Num_head;
for row_Num_head in chld_Num_head loop
 Kernel.INSTANCE_OWNER (acursession,row_Num_head.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Num_head.id);
end loop;
--close chld_Num_head;
end ;
  delete from  Num_head 
  where  Num_headID = aNum_headID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание*/
procedure Num_head_SAVE /*Описание нумератора*/ (
 aCURSESSION CHAR,
 aNum_headid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aShema
 NUMBER/* Схема нумерации *//* Схема нумерации */
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
select count(*) into existsCnt from Num_head where Num_headID=aNum_headID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Num_head where Num_headid=aNum_headID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Num_head',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Num_head');
      return;
    end if;
  end if;
 --  verify lock  --
 Num_head_ISLOCKED( acursession=>acursession,aROWID=>aNum_headid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Num_head');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Num_head',
 aVERB=>'EDITROW',  aThe_Resource=>aNum_headid,aLogInstanceID=>aInstanceID);
 update  Num_head set ChangeStamp=sysdate
,
  Name=aName
,
  Shema=aShema
  where  Num_headID = aNum_headID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Num_head',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Num_head');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Num_head');
    return;
  end if;
select Count(*) into existsCnt from Num_head where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <Num_head>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Num_head',
 aVERB=>'CREATEROW',  aThe_Resource=>aNum_headid,aLogInstanceID=>aInstanceID);
 insert into   Num_head
 (  Num_headID 
,InstanceID
,Name

,Shema

 ) values ( aNum_headID 
,aInstanceID
,aName

,aShema

 ); 
 Num_head_SINIT( aCURSESSION,aNum_headid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure Num_head_PARENT /*Описание нумератора*/ (
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
  select  INSTANCEID into aParentID from Num_head where  Num_headid=aRowID;
 end; 


procedure Num_head_ISLOCKED /*Описание нумератора*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Num_head where Num_headid=aRowID;
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
  Num_head_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDNumerator.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Num_head_LOCK /*Описание нумератора*/ (
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
 Num_head_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Num_head_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Num_head where Num_headid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Num_head');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Num_head set LockUserID =auserID ,LockSessionID =null where Num_headid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Num_head set LockUserID =null,LockSessionID =aCURSESSION  where Num_headid=aRowID;
     return;
   end if;
 end ;


procedure Num_head_HCL /*Описание нумератора*/ (
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


procedure Num_head_UNLOCK /*Описание нумератора*/ (
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
 Num_head_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Num_head set LockUserID =null  where Num_headid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Num_head set LockSessionID =null  where Num_headid=aRowID;
     return;
   end if;
 end; 


procedure Num_head_SINIT /*Описание нумератора*/ (
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
 select  SecurityStyleID into atmpID from Num_head where Num_headid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Num_head');
    return;
  end if;
if aSecurityStyleID is null then
 Num_head_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Num_head set securitystyleid =aStyleID where Num_headid = aRowID;
else 
 update Num_head set securitystyleid =aSecurityStyleID where Num_headid = aRowID;
end if; 
end ; 


procedure Num_head_propagate /*Описание нумератора*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Num_head where Num_headid=aRowid;
end;


end STDNumerator;

/



