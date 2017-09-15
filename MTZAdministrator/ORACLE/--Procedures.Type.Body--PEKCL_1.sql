
/* --PEKCL*/

 create or replace package body PEKCL as

procedure PEKCL_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKCL'
then
declare cursor child_PEKCL_DEF is select PEKCL_DEF.PEKCL_DEFid ID from PEKCL_DEF where  PEKCL_DEF.InstanceID = ainstanceid;
row_PEKCL_DEF  child_PEKCL_DEF%ROWTYPE;
begin
--open child_PEKCL_DEF;
for row_PEKCL_DEF in child_PEKCL_DEF loop
 PEKCL_DEF_DELETE (acursession,row_PEKCL_DEF.id,aInstanceID);
end loop;
--close child_PEKCL_DEF;
end;
declare cursor child_PEKCL_DAYLY is select PEKCL_DAYLY.PEKCL_DAYLYid ID from PEKCL_DAYLY where  PEKCL_DAYLY.InstanceID = ainstanceid;
row_PEKCL_DAYLY  child_PEKCL_DAYLY%ROWTYPE;
begin
--open child_PEKCL_DAYLY;
for row_PEKCL_DAYLY in child_PEKCL_DAYLY loop
 PEKCL_DAYLY_DELETE (acursession,row_PEKCL_DAYLY.id,aInstanceID);
end loop;
--close child_PEKCL_DAYLY;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKCL_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKCL'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKCL_DEF is select PEKCL_DEF.PEKCL_DEFid ID from PEKCL_DEF where  PEKCL_DEF.InstanceID = arowid;
ROW_PEKCL_DEF  lch_PEKCL_DEF%ROWTYPE;
begin
--open lch_PEKCL_DEF;
for row_PEKCL_DEF in lch_PEKCL_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKCL_DEF where PEKCL_DEFid=row_PEKCL_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKCL_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKCL_DEF;
     return;
   end if; 
 end if; 
 PEKCL_DEF_HCL (acursession,ROW_PEKCL_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKCL_DEF;
   return;
 end if;
 end loop;
--close lch_PEKCL_DEF;
end;
declare cursor lch_PEKCL_DAYLY is select PEKCL_DAYLY.PEKCL_DAYLYid ID from PEKCL_DAYLY where  PEKCL_DAYLY.InstanceID = arowid;
ROW_PEKCL_DAYLY  lch_PEKCL_DAYLY%ROWTYPE;
begin
--open lch_PEKCL_DAYLY;
for row_PEKCL_DAYLY in lch_PEKCL_DAYLY loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKCL_DAYLY where PEKCL_DAYLYid=row_PEKCL_DAYLY.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKCL_DAYLY;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKCL_DAYLY;
     return;
   end if; 
 end if; 
 PEKCL_DAYLY_HCL (acursession,ROW_PEKCL_DAYLY.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKCL_DAYLY;
   return;
 end if;
 end loop;
--close lch_PEKCL_DAYLY;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKCL_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKCL'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKCL_DEF is select PEKCL_DEF.PEKCL_DEFid id from PEKCL_DEF where  PEKCL_DEF.InstanceID = arowid;
row_PEKCL_DEF  pch_PEKCL_DEF%ROWTYPE;
begin
--open pch_PEKCL_DEF;
for row_PEKCL_DEF in  pch_PEKCL_DEF loop
 PEKCL_DEF_SINIT( acursession,row_PEKCL_DEF.id,assid);
 PEKCL_DEF_propagate( acursession,row_PEKCL_DEF.id);
end loop;
--close pch_PEKCL_DEF;
end;
declare cursor pch_PEKCL_DAYLY is select PEKCL_DAYLY.PEKCL_DAYLYid id from PEKCL_DAYLY where  PEKCL_DAYLY.InstanceID = arowid;
row_PEKCL_DAYLY  pch_PEKCL_DAYLY%ROWTYPE;
begin
--open pch_PEKCL_DAYLY;
for row_PEKCL_DAYLY in  pch_PEKCL_DAYLY loop
 PEKCL_DAYLY_SINIT( acursession,row_PEKCL_DAYLY.id,assid);
 PEKCL_DAYLY_propagate( acursession,row_PEKCL_DAYLY.id);
end loop;
--close pch_PEKCL_DAYLY;
end;
 end if; 
end;



procedure PEKCL_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKCL_DEFid CHAR,
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
if aPEKCL_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKCL_DEF where PEKCL_DEFID=aPEKCL_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKCL_DEF where PEKCL_DEFid=aPEKCL_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKCL_DEF');
    return;
  end if;
  aBRIEF:=func.PEKCL_DEF_BRIEF_F(aPEKCL_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKCL_DEF_DELETE /*Описание лимита*/ (
 aCURSESSION CHAR,
 aPEKCL_DEFid CHAR,
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
select count(*) into existsCnt from PEKCL_DEF where PEKCL_DEFID=aPEKCL_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKCL_DEF where PEKCL_DEFid=aPEKCL_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKCL_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKCL_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKCL_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKCL_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKCL_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKCL_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKCL_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKCL_DEF is select  instanceid ID from instance where OwnerPartName ='PEKCL_DEF' and OwnerRowID=aPEKCL_DEFid;
row_PEKCL_DEF  chld_PEKCL_DEF%ROWTYPE;
begin
--open chld_PEKCL_DEF;
for row_PEKCL_DEF in chld_PEKCL_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKCL_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKCL_DEF.id);
end loop;
--close chld_PEKCL_DEF;
end ;
  delete from  PEKCL_DEF 
  where  PEKCL_DEFID = aPEKCL_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание лимита*/
procedure PEKCL_DEF_SAVE /*Описание лимита*/ (
 aCURSESSION CHAR,
 aPEKCL_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* Организация *//* Организация */
,aTheDep CHAR/* Филиал *//* Филиал */
,aLimDate
 DATE/* Дата *//* Дата */
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
select count(*) into existsCnt from PEKCL_DEF where PEKCL_DEFID=aPEKCL_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKCL_DEF where PEKCL_DEFid=aPEKCL_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKCL_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKCL_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKCL_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKCL_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKCL_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKCL_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKCL_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKCL_DEF set ChangeStamp=sysdate
,
  ORG=aORG
,
  TheDep=aTheDep
,
  LimDate=aLimDate
  where  PEKCL_DEFID = aPEKCL_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKCL_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKCL_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKCL_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKCL_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKCL_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKCL_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKCL_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKCL_DEF
 (  PEKCL_DEFID 
,InstanceID
,ORG

,TheDep

,LimDate

 ) values ( aPEKCL_DEFID 
,aInstanceID
,aORG

,aTheDep

,aLimDate

 ); 
 PEKCL_DEF_SINIT( aCURSESSION,aPEKCL_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKCL_DEF_PARENT /*Описание лимита*/ (
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
  select  INSTANCEID into aParentID from PEKCL_DEF where  PEKCL_DEFid=aRowID;
 end; 


procedure PEKCL_DEF_ISLOCKED /*Описание лимита*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKCL_DEF where PEKCL_DEFid=aRowID;
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
  PEKCL_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKCL.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKCL_DEF_LOCK /*Описание лимита*/ (
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
 PEKCL_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKCL_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKCL_DEF where PEKCL_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKCL_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKCL_DEF set LockUserID =auserID ,LockSessionID =null where PEKCL_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKCL_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKCL_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKCL_DEF_HCL /*Описание лимита*/ (
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


procedure PEKCL_DEF_UNLOCK /*Описание лимита*/ (
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
 PEKCL_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKCL_DEF set LockUserID =null  where PEKCL_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKCL_DEF set LockSessionID =null  where PEKCL_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKCL_DEF_SINIT /*Описание лимита*/ (
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
 select  SecurityStyleID into atmpID from PEKCL_DEF where PEKCL_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKCL_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKCL_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKCL_DEF set securitystyleid =aStyleID where PEKCL_DEFid = aRowID;
else 
 update PEKCL_DEF set securitystyleid =aSecurityStyleID where PEKCL_DEFid = aRowID;
end if; 
end ; 


procedure PEKCL_DEF_propagate /*Описание лимита*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKCL_DEF where PEKCL_DEFid=aRowid;
end;



procedure PEKCL_DAYLY_BRIEF  (
 aCURSESSION CHAR,
 aPEKCL_DAYLYid CHAR,
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
if aPEKCL_DAYLYid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKCL_DAYLY where PEKCL_DAYLYID=aPEKCL_DAYLYID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKCL_DAYLY where PEKCL_DAYLYid=aPEKCL_DAYLYID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKCL_DAYLY');
    return;
  end if;
  aBRIEF:=func.PEKCL_DAYLY_BRIEF_F(aPEKCL_DAYLYid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKCL_DAYLY_DELETE /*Текущие лимиты*/ (
 aCURSESSION CHAR,
 aPEKCL_DAYLYid CHAR,
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
select count(*) into existsCnt from PEKCL_DAYLY where PEKCL_DAYLYID=aPEKCL_DAYLYID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKCL_DAYLY where PEKCL_DAYLYid=aPEKCL_DAYLYID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKCL_DAYLY',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKCL_DAYLY');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKCL_DAYLY_ISLOCKED( acursession=>acursession,aROWID=>aPEKCL_DAYLYid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKCL_DAYLY');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PEKL_TOLOAD is select PEKL_TOLOAD.PEKL_TOLOADid ID from PEKL_TOLOAD where  PEKL_TOLOAD.ParentStructRowID = aPEKCL_DAYLYid;
    child_PEKL_TOLOAD_rec  child_PEKL_TOLOAD%ROWTYPE;
    begin
    --open child_PEKL_TOLOAD;
      for child_PEKL_TOLOAD_rec in child_PEKL_TOLOAD loop
      PEKL_TOLOAD_DELETE (acursession,child_PEKL_TOLOAD_rec.id,aInstanceid);
      end loop;
      --close child_PEKL_TOLOAD;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKCL_DAYLY',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKCL_DAYLYid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKCL_DAYLY is select  instanceid ID from instance where OwnerPartName ='PEKCL_DAYLY' and OwnerRowID=aPEKCL_DAYLYid;
row_PEKCL_DAYLY  chld_PEKCL_DAYLY%ROWTYPE;
begin
--open chld_PEKCL_DAYLY;
for row_PEKCL_DAYLY in chld_PEKCL_DAYLY loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKCL_DAYLY.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKCL_DAYLY.id);
end loop;
--close chld_PEKCL_DAYLY;
end ;
  delete from  PEKCL_DAYLY 
  where  PEKCL_DAYLYID = aPEKCL_DAYLYID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Текущие лимиты*/
procedure PEKCL_DAYLY_SAVE /*Текущие лимиты*/ (
 aCURSESSION CHAR,
 aPEKCL_DAYLYid CHAR,
aInstanceID CHAR 
,aTrain CHAR/* Поезд *//* Поезд */
,aGOTYPE CHAR := null /* Тип СГО *//* Тип СГО */
,aTheValue
 NUMBER := null /* Объем *//* Объем */
,aValueEDIZM CHAR := null /* Ед. изм. объема *//* Ед. изм. объема */
,aWeightValue
 NUMBER := null /* Вес *//* Вес */
,aWeightEDIZM CHAR := null /* Ед. изм.веса *//* Ед. изм.веса */
,athe_Description VARCHAR2 := null /* Описание *//* Описание */
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
select count(*) into existsCnt from PEKCL_DAYLY where PEKCL_DAYLYID=aPEKCL_DAYLYID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKCL_DAYLY where PEKCL_DAYLYid=aPEKCL_DAYLYID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKCL_DAYLY',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKCL_DAYLY');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKCL_DAYLY_ISLOCKED( acursession=>acursession,aROWID=>aPEKCL_DAYLYid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKCL_DAYLY');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKCL_DAYLY',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKCL_DAYLYid,aLogInstanceID=>aInstanceID);
 update  PEKCL_DAYLY set ChangeStamp=sysdate
,
  Train=aTrain
,
  GOTYPE=aGOTYPE
,
  TheValue=aTheValue
,
  ValueEDIZM=aValueEDIZM
,
  WeightValue=aWeightValue
,
  WeightEDIZM=aWeightEDIZM
,
  the_Description=athe_Description
  where  PEKCL_DAYLYID = aPEKCL_DAYLYID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKCL_DAYLY',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKCL_DAYLY');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKCL_DAYLY');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKCL_DAYLY',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKCL_DAYLYid,aLogInstanceID=>aInstanceID);
 insert into   PEKCL_DAYLY
 (  PEKCL_DAYLYID 
,InstanceID
,Train

,GOTYPE

,TheValue

,ValueEDIZM

,WeightValue

,WeightEDIZM

,the_Description

 ) values ( aPEKCL_DAYLYID 
,aInstanceID
,aTrain

,aGOTYPE

,aTheValue

,aValueEDIZM

,aWeightValue

,aWeightEDIZM

,athe_Description

 ); 
 PEKCL_DAYLY_SINIT( aCURSESSION,aPEKCL_DAYLYid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKCL_DAYLY_PARENT /*Текущие лимиты*/ (
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
  select  INSTANCEID into aParentID from PEKCL_DAYLY where  PEKCL_DAYLYid=aRowID;
 end; 


procedure PEKCL_DAYLY_ISLOCKED /*Текущие лимиты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKCL_DAYLY where PEKCL_DAYLYid=aRowID;
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
  PEKCL_DAYLY_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKCL.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKCL_DAYLY_LOCK /*Текущие лимиты*/ (
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
 PEKCL_DAYLY_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKCL_DAYLY_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKCL_DAYLY where PEKCL_DAYLYid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKCL_DAYLY');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKCL_DAYLY set LockUserID =auserID ,LockSessionID =null where PEKCL_DAYLYid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKCL_DAYLY set LockUserID =null,LockSessionID =aCURSESSION  where PEKCL_DAYLYid=aRowID;
     return;
   end if;
 end ;


procedure PEKCL_DAYLY_HCL /*Текущие лимиты*/ (
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
declare cursor lch_PEKL_TOLOAD is select PEKL_TOLOAD.PEKL_TOLOADid ID from PEKL_TOLOAD where  PEKL_TOLOAD.ParentStructRowID = aRowid;
row_PEKL_TOLOAD lch_PEKL_TOLOAD%ROWTYPE;
begin  
--open lch_PEKL_TOLOAD;
for row_PEKL_TOLOAD in lch_PEKL_TOLOAD
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKL_TOLOAD where PEKL_TOLOADid=row_PEKL_TOLOAD.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKL_TOLOAD;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKL_TOLOAD;
     return;
   end if; 
 end if;  
 PEKL_TOLOAD_HCL (acursession,row_PEKL_TOLOAD.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKL_TOLOAD;
   return;
 end if;
end loop;
--close lch_PEKL_TOLOAD;
end;
aIsLocked :=0;
end;


procedure PEKCL_DAYLY_UNLOCK /*Текущие лимиты*/ (
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
 PEKCL_DAYLY_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKCL_DAYLY set LockUserID =null  where PEKCL_DAYLYid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKCL_DAYLY set LockSessionID =null  where PEKCL_DAYLYid=aRowID;
     return;
   end if;
 end; 


procedure PEKCL_DAYLY_SINIT /*Текущие лимиты*/ (
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
 select  SecurityStyleID into atmpID from PEKCL_DAYLY where PEKCL_DAYLYid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKCL_DAYLY');
    return;
  end if;
if aSecurityStyleID is null then
 PEKCL_DAYLY_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKCL_DAYLY set securitystyleid =aStyleID where PEKCL_DAYLYid = aRowID;
else 
 update PEKCL_DAYLY set securitystyleid =aSecurityStyleID where PEKCL_DAYLYid = aRowID;
end if; 
end ; 


procedure PEKCL_DAYLY_propagate /*Текущие лимиты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKCL_DAYLY where PEKCL_DAYLYid=aRowid;
declare cursor pch_PEKL_TOLOAD  is select PEKL_TOLOAD.PEKL_TOLOADid ID from PEKL_TOLOAD where  PEKL_TOLOAD.ParentStructRowID = aRowid;
row_PEKL_TOLOAD  pch_PEKL_TOLOAD%ROWTYPE;
begin
--open pch_PEKL_TOLOAD;
for row_PEKL_TOLOAD in pch_PEKL_TOLOAD loop
   PEKL_TOLOAD_SINIT( acursession,row_PEKL_TOLOAD.id,assid);
   PEKL_TOLOAD_propagate( acursession,row_PEKL_TOLOAD.id);
end loop;
--close pch_PEKL_TOLOAD;
end;
end;



procedure PEKL_TOLOAD_BRIEF  (
 aCURSESSION CHAR,
 aPEKL_TOLOADid CHAR,
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
if aPEKL_TOLOADid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKL_TOLOAD where PEKL_TOLOADID=aPEKL_TOLOADID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKL_TOLOAD where PEKL_TOLOADid=aPEKL_TOLOADID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKL_TOLOAD');
    return;
  end if;
  aBRIEF:=func.PEKL_TOLOAD_BRIEF_F(aPEKL_TOLOADid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKL_TOLOAD_DELETE /*Обемы под загрузку*/ (
 aCURSESSION CHAR,
 aPEKL_TOLOADid CHAR,
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
select count(*) into existsCnt from PEKL_TOLOAD where PEKL_TOLOADID=aPEKL_TOLOADID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKL_TOLOAD where PEKL_TOLOADid=aPEKL_TOLOADID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKL_TOLOAD',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKL_TOLOAD');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKL_TOLOAD_ISLOCKED( acursession=>acursession,aROWID=>aPEKL_TOLOADid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKL_TOLOAD');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKL_TOLOAD',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKL_TOLOADid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKL_TOLOAD is select  instanceid ID from instance where OwnerPartName ='PEKL_TOLOAD' and OwnerRowID=aPEKL_TOLOADid;
row_PEKL_TOLOAD  chld_PEKL_TOLOAD%ROWTYPE;
begin
--open chld_PEKL_TOLOAD;
for row_PEKL_TOLOAD in chld_PEKL_TOLOAD loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKL_TOLOAD.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKL_TOLOAD.id);
end loop;
--close chld_PEKL_TOLOAD;
end ;
  delete from  PEKL_TOLOAD 
  where  PEKL_TOLOADID = aPEKL_TOLOADID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Обемы под загрузку*/
procedure PEKL_TOLOAD_SAVE /*Обемы под загрузку*/ (
 aCURSESSION CHAR,
 aPEKL_TOLOADid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSRCPekZ CHAR/* По заявке *//* По заявке */
,aTheValue
 NUMBER := null /* Объем *//* Объем */
,aValueEDIZM CHAR := null /* Ед. изм. объема *//* Ед. изм. объема */
,aWeightValue
 NUMBER := null /* Вес *//* Вес */
,aWeightEDIZM CHAR := null /* Ед. изм.веса *//* Ед. изм.веса */
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
select count(*) into existsCnt from PEKL_TOLOAD where PEKL_TOLOADID=aPEKL_TOLOADID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKL_TOLOAD where PEKL_TOLOADid=aPEKL_TOLOADID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKL_TOLOAD',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKL_TOLOAD');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKL_TOLOAD_ISLOCKED( acursession=>acursession,aROWID=>aPEKL_TOLOADid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKL_TOLOAD');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKL_TOLOAD',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKL_TOLOADid,aLogInstanceID=>aInstanceID);
 update  PEKL_TOLOAD set ChangeStamp=sysdate
,
  SRCPekZ=aSRCPekZ
,
  TheValue=aTheValue
,
  ValueEDIZM=aValueEDIZM
,
  WeightValue=aWeightValue
,
  WeightEDIZM=aWeightEDIZM
  where  PEKL_TOLOADID = aPEKL_TOLOADID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PEKCL_DAYLY where PEKCL_DAYLYid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKL_TOLOAD',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKL_TOLOAD');
      return;
    end if;
 end if;
 PEKCL_DAYLY_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKL_TOLOAD');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKL_TOLOAD',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKL_TOLOADid,aLogInstanceID=>aInstanceID);
 insert into   PEKL_TOLOAD
 (  PEKL_TOLOADID 
,ParentStructRowID
,SRCPekZ

,TheValue

,ValueEDIZM

,WeightValue

,WeightEDIZM

 ) values ( aPEKL_TOLOADID 
,aParentStructRowID
,aSRCPekZ

,aTheValue

,aValueEDIZM

,aWeightValue

,aWeightEDIZM

 ); 
 PEKL_TOLOAD_SINIT( aCURSESSION,aPEKL_TOLOADid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKL_TOLOAD_PARENT /*Обемы под загрузку*/ (
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
  select ParentStructRowID into aParentID  from PEKL_TOLOAD where  PEKL_TOLOADid=aRowID;
  aParentTable := 'PEKCL_DAYLY';
 end; 


procedure PEKL_TOLOAD_ISLOCKED /*Обемы под загрузку*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKL_TOLOAD where PEKL_TOLOADid=aRowID;
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
  PEKL_TOLOAD_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKCL.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKL_TOLOAD_LOCK /*Обемы под загрузку*/ (
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
 PEKL_TOLOAD_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKL_TOLOAD_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKL_TOLOAD where PEKL_TOLOADid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKL_TOLOAD');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKL_TOLOAD set LockUserID =auserID ,LockSessionID =null where PEKL_TOLOADid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKL_TOLOAD set LockUserID =null,LockSessionID =aCURSESSION  where PEKL_TOLOADid=aRowID;
     return;
   end if;
 end ;


procedure PEKL_TOLOAD_HCL /*Обемы под загрузку*/ (
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


procedure PEKL_TOLOAD_UNLOCK /*Обемы под загрузку*/ (
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
 PEKL_TOLOAD_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKL_TOLOAD set LockUserID =null  where PEKL_TOLOADid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKL_TOLOAD set LockSessionID =null  where PEKL_TOLOADid=aRowID;
     return;
   end if;
 end; 


procedure PEKL_TOLOAD_SINIT /*Обемы под загрузку*/ (
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
 select  SecurityStyleID into atmpID from PEKL_TOLOAD where PEKL_TOLOADid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKL_TOLOAD');
    return;
  end if;
if aSecurityStyleID is null then
 PEKL_TOLOAD_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKL_TOLOAD set securitystyleid =aStyleID where PEKL_TOLOADid = aRowID;
else 
 update PEKL_TOLOAD set securitystyleid =aSecurityStyleID where PEKL_TOLOADid = aRowID;
end if; 
end ; 


procedure PEKL_TOLOAD_propagate /*Обемы под загрузку*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKL_TOLOAD where PEKL_TOLOADid=aRowid;
end;


end PEKCL;

/



