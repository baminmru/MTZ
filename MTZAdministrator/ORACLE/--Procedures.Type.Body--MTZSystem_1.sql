
/* --MTZSystem*/

 create or replace package body MTZSystem as

procedure MTZSystem_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZSystem'
then
declare cursor child_SysLog is select SysLog.SysLogid ID from SysLog where  SysLog.InstanceID = ainstanceid;
row_SysLog  child_SysLog%ROWTYPE;
begin
--open child_SysLog;
for row_SysLog in child_SysLog loop
 SysLog_DELETE (acursession,row_SysLog.id,aInstanceID);
end loop;
--close child_SysLog;
end;
declare cursor child_the_Session is select the_Session.the_Sessionid ID from the_Session where  the_Session.InstanceID = ainstanceid;
row_the_Session  child_the_Session%ROWTYPE;
begin
--open child_the_Session;
for row_the_Session in child_the_Session loop
 the_Session_DELETE (acursession,row_the_Session.id,aInstanceID);
end loop;
--close child_the_Session;
end;
declare cursor child_LogReader is select LogReader.LogReaderid ID from LogReader where  LogReader.InstanceID = ainstanceid;
row_LogReader  child_LogReader%ROWTYPE;
begin
--open child_LogReader;
for row_LogReader in child_LogReader loop
 LogReader_DELETE (acursession,row_LogReader.id,aInstanceID);
end loop;
--close child_LogReader;
end;
declare cursor child_Verb is select Verb.Verbid ID from Verb where  Verb.InstanceID = ainstanceid;
row_Verb  child_Verb%ROWTYPE;
begin
--open child_Verb;
for row_Verb in child_Verb loop
 Verb_DELETE (acursession,row_Verb.id,aInstanceID);
end loop;
--close child_Verb;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZSystem_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZSystem'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_SysLog is select SysLog.SysLogid ID from SysLog where  SysLog.InstanceID = arowid;
ROW_SysLog  lch_SysLog%ROWTYPE;
begin
--open lch_SysLog;
for row_SysLog in lch_SysLog loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from SysLog where SysLogid=row_SysLog.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_SysLog;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_SysLog;
     return;
   end if; 
 end if; 
 SysLog_HCL (acursession,ROW_SysLog.id,aisLocked);
 if aisLocked >2 then
   close lch_SysLog;
   return;
 end if;
 end loop;
--close lch_SysLog;
end;
declare cursor lch_the_Session is select the_Session.the_Sessionid ID from the_Session where  the_Session.InstanceID = arowid;
ROW_the_Session  lch_the_Session%ROWTYPE;
begin
--open lch_the_Session;
for row_the_Session in lch_the_Session loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from the_Session where the_Sessionid=row_the_Session.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_the_Session;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_the_Session;
     return;
   end if; 
 end if; 
 the_Session_HCL (acursession,ROW_the_Session.id,aisLocked);
 if aisLocked >2 then
   close lch_the_Session;
   return;
 end if;
 end loop;
--close lch_the_Session;
end;
declare cursor lch_LogReader is select LogReader.LogReaderid ID from LogReader where  LogReader.InstanceID = arowid;
ROW_LogReader  lch_LogReader%ROWTYPE;
begin
--open lch_LogReader;
for row_LogReader in lch_LogReader loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from LogReader where LogReaderid=row_LogReader.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_LogReader;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_LogReader;
     return;
   end if; 
 end if; 
 LogReader_HCL (acursession,ROW_LogReader.id,aisLocked);
 if aisLocked >2 then
   close lch_LogReader;
   return;
 end if;
 end loop;
--close lch_LogReader;
end;
declare cursor lch_Verb is select Verb.Verbid ID from Verb where  Verb.InstanceID = arowid;
ROW_Verb  lch_Verb%ROWTYPE;
begin
--open lch_Verb;
for row_Verb in lch_Verb loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from Verb where Verbid=row_Verb.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Verb;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_Verb;
     return;
   end if; 
 end if; 
 Verb_HCL (acursession,ROW_Verb.id,aisLocked);
 if aisLocked >2 then
   close lch_Verb;
   return;
 end if;
 end loop;
--close lch_Verb;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZSystem_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZSystem'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_SysLog is select SysLog.SysLogid id from SysLog where  SysLog.InstanceID = arowid;
row_SysLog  pch_SysLog%ROWTYPE;
begin
--open pch_SysLog;
for row_SysLog in  pch_SysLog loop
 SysLog_SINIT( acursession,row_SysLog.id,assid);
 SysLog_propagate( acursession,row_SysLog.id);
end loop;
--close pch_SysLog;
end;
declare cursor pch_the_Session is select the_Session.the_Sessionid id from the_Session where  the_Session.InstanceID = arowid;
row_the_Session  pch_the_Session%ROWTYPE;
begin
--open pch_the_Session;
for row_the_Session in  pch_the_Session loop
 the_Session_SINIT( acursession,row_the_Session.id,assid);
 the_Session_propagate( acursession,row_the_Session.id);
end loop;
--close pch_the_Session;
end;
declare cursor pch_LogReader is select LogReader.LogReaderid id from LogReader where  LogReader.InstanceID = arowid;
row_LogReader  pch_LogReader%ROWTYPE;
begin
--open pch_LogReader;
for row_LogReader in  pch_LogReader loop
 LogReader_SINIT( acursession,row_LogReader.id,assid);
 LogReader_propagate( acursession,row_LogReader.id);
end loop;
--close pch_LogReader;
end;
declare cursor pch_Verb is select Verb.Verbid id from Verb where  Verb.InstanceID = arowid;
row_Verb  pch_Verb%ROWTYPE;
begin
--open pch_Verb;
for row_Verb in  pch_Verb loop
 Verb_SINIT( acursession,row_Verb.id,assid);
 Verb_propagate( acursession,row_Verb.id);
end loop;
--close pch_Verb;
end;
 end if; 
end;



procedure SysLog_BRIEF  (
 aCURSESSION CHAR,
 aSysLogid CHAR,
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
if aSysLogid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from SysLog where SysLogID=aSysLogID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from SysLog where SysLogid=aSysLogID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=SysLog');
    return;
  end if;
  aBRIEF:=func.SysLog_BRIEF_F(aSysLogid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure SysLog_DELETE /*Журнал событий, которые произошли в системе*/ (
 aCURSESSION CHAR,
 aSysLogid CHAR,
 ainstanceid char
) as 
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
select count(*) into existsCnt from SysLog where SysLogID=aSysLogID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from SysLog where SysLogid=aSysLogID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:SysLog',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=SysLog');
      return;
    end if;
  end if;
 --  verify lock  --
 SysLog_ISLOCKED( acursession=>acursession,aROWID=>aSysLogid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=SysLog');
    return;
  end if;
  --begin tran--  
 -- erase child items --
declare cursor chld_SysLog is select  instanceid ID from instance where OwnerPartName ='SysLog' and OwnerRowID=aSysLogid;
row_SysLog  chld_SysLog%ROWTYPE;
begin
--open chld_SysLog;
for row_SysLog in chld_SysLog loop
 Kernel.INSTANCE_OWNER (acursession,row_SysLog.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_SysLog.id);
end loop;
--close chld_SysLog;
end ;
  delete from  SysLog 
  where  SysLogID = aSysLogID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Журнал событий*/
procedure SysLog_SAVE /*Журнал событий, которые произошли в системе*/ (
 aCURSESSION CHAR,
 aSysLogid CHAR,
aInstanceID CHAR 
,aTheSession CHAR/* Сессия *//* Сессия */
,athe_Resource
 VARCHAR2/* Ресурс *//* Ресурс */
,aLogStructID
 VARCHAR2 := null /* Раздел с которым происхоит действие *//* Раздел с которым происхоит действие */
,aVERB
 VARCHAR2/* Действие *//* Действие */
,aLogInstanceID CHAR := null /* Идентификатор документа *//* Идентификатор документа */
) as 
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
select count(*) into existsCnt from SysLog where SysLogID=aSysLogID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from SysLog where SysLogid=aSysLogID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:SysLog',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=SysLog');
      return;
    end if;
  end if;
 --  verify lock  --
 SysLog_ISLOCKED( acursession=>acursession,aROWID=>aSysLogid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=SysLog');
    return;
  end if;
 -- update row  --
 update  SysLog set ChangeStamp=sysdate
,
  TheSession=aTheSession
,
  the_Resource=athe_Resource
,
  LogStructID=aLogStructID
,
  VERB=aVERB
,
  LogInstanceID=aLogInstanceID
  where  SysLogID = aSysLogID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:SysLog',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=SysLog');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=SysLog');
    return;
  end if;
 insert into   SysLog
 (  SysLogID 
,InstanceID
,TheSession

,the_Resource

,LogStructID

,VERB

,LogInstanceID

 ) values ( aSysLogID 
,aInstanceID
,aTheSession

,athe_Resource

,aLogStructID

,aVERB

,aLogInstanceID

 ); 
 SysLog_SINIT( aCURSESSION,aSysLogid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure SysLog_PARENT /*Журнал событий, которые произошли в системе*/ (
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
  select  INSTANCEID into aParentID from SysLog where  SysLogid=aRowID;
 end; 


procedure SysLog_ISLOCKED /*Журнал событий, которые произошли в системе*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from SysLog where SysLogid=aRowID;
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
  SysLog_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZSystem.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure SysLog_LOCK /*Журнал событий, которые произошли в системе*/ (
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
 SysLog_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  SysLog_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from SysLog where SysLogid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=SysLog');
    return;
  end if;
   if  aLockMode =2  
   then   
    update SysLog set LockUserID =auserID ,LockSessionID =null where SysLogid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update SysLog set LockUserID =null,LockSessionID =aCURSESSION  where SysLogid=aRowID;
     return;
   end if;
 end ;


procedure SysLog_HCL /*Журнал событий, которые произошли в системе*/ (
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


procedure SysLog_UNLOCK /*Журнал событий, которые произошли в системе*/ (
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
 SysLog_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update SysLog set LockUserID =null  where SysLogid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update SysLog set LockSessionID =null  where SysLogid=aRowID;
     return;
   end if;
 end; 


procedure SysLog_SINIT /*Журнал событий, которые произошли в системе*/ (
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
 select  SecurityStyleID into atmpID from SysLog where SysLogid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =SysLog');
    return;
  end if;
if aSecurityStyleID is null then
 SysLog_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update SysLog set securitystyleid =aStyleID where SysLogid = aRowID;
else 
 update SysLog set securitystyleid =aSecurityStyleID where SysLogid = aRowID;
end if; 
end ; 


procedure SysLog_propagate /*Журнал событий, которые произошли в системе*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from SysLog where SysLogid=aRowid;
end;



procedure the_Session_BRIEF  (
 aCURSESSION CHAR,
 athe_Sessionid CHAR,
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
if athe_Sessionid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from the_Session where the_SessionID=athe_SessionID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from the_Session where the_Sessionid=athe_SessionID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=the_Session');
    return;
  end if;
  aBRIEF:=func.the_Session_BRIEF_F(athe_Sessionid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure the_Session_DELETE /*Зарегистрированные сессии пользователей*/ (
 aCURSESSION CHAR,
 athe_Sessionid CHAR,
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
select count(*) into existsCnt from the_Session where the_SessionID=athe_SessionID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from the_Session where the_Sessionid=athe_SessionID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:the_Session',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=the_Session');
      return;
    end if;
  end if;
 --  verify lock  --
 the_Session_ISLOCKED( acursession=>acursession,aROWID=>athe_Sessionid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=the_Session');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'the_Session',
 aVERB=>'DELETEROW',  aThe_Resource=>athe_Sessionid, aLogInstanceID=>aInstanceID);
declare cursor chld_the_Session is select  instanceid ID from instance where OwnerPartName ='the_Session' and OwnerRowID=athe_Sessionid;
row_the_Session  chld_the_Session%ROWTYPE;
begin
--open chld_the_Session;
for row_the_Session in chld_the_Session loop
 Kernel.INSTANCE_OWNER (acursession,row_the_Session.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_the_Session.id);
end loop;
--close chld_the_Session;
end ;
  delete from  the_Session 
  where  the_SessionID = athe_SessionID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Сессия пользователя*/
procedure the_Session_SAVE /*Зарегистрированные сессии пользователей*/ (
 aCURSESSION CHAR,
 athe_Sessionid CHAR,
aInstanceID CHAR 
,aUserRole CHAR := null /* Текущая роль пользователя *//* Текущая роль пользователя */
,aClosedAt
 DATE := null /* Момент закрытия *//* Момент закрытия */
,aClosed
 NUMBER/* Закрыта *//* Закрыта */
,aUsersid CHAR/* Пользователь *//* Пользователь */
,aLastAccess
 DATE := null /* Последнее подтверждение *//* Последнее подтверждение */
,aStartAt
 DATE/* Момент открытия *//* Момент открытия */
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
select count(*) into existsCnt from the_Session where the_SessionID=athe_SessionID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from the_Session where the_Sessionid=athe_SessionID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:the_Session',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=the_Session');
      return;
    end if;
  end if;
 --  verify lock  --
 the_Session_ISLOCKED( acursession=>acursession,aROWID=>athe_Sessionid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=the_Session');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'the_Session',
 aVERB=>'EDITROW',  aThe_Resource=>athe_Sessionid,aLogInstanceID=>aInstanceID);
 update  the_Session set ChangeStamp=sysdate
,
  UserRole=aUserRole
,
  ClosedAt=aClosedAt
,
  Closed=aClosed
,
  Usersid=aUsersid
,
  LastAccess=aLastAccess
,
  StartAt=aStartAt
  where  the_SessionID = athe_SessionID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:the_Session',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=the_Session');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=the_Session');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'the_Session',
 aVERB=>'CREATEROW',  aThe_Resource=>athe_Sessionid,aLogInstanceID=>aInstanceID);
 insert into   the_Session
 (  the_SessionID 
,InstanceID
,UserRole

,ClosedAt

,Closed

,Usersid

,LastAccess

,StartAt

 ) values ( athe_SessionID 
,aInstanceID
,aUserRole

,aClosedAt

,aClosed

,aUsersid

,aLastAccess

,aStartAt

 ); 
 the_Session_SINIT( aCURSESSION,athe_Sessionid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure the_Session_PARENT /*Зарегистрированные сессии пользователей*/ (
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
  select  INSTANCEID into aParentID from the_Session where  the_Sessionid=aRowID;
 end; 


procedure the_Session_ISLOCKED /*Зарегистрированные сессии пользователей*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from the_Session where the_Sessionid=aRowID;
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
  the_Session_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZSystem.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure the_Session_LOCK /*Зарегистрированные сессии пользователей*/ (
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
 the_Session_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  the_Session_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from the_Session where the_Sessionid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=the_Session');
    return;
  end if;
   if  aLockMode =2  
   then   
    update the_Session set LockUserID =auserID ,LockSessionID =null where the_Sessionid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update the_Session set LockUserID =null,LockSessionID =aCURSESSION  where the_Sessionid=aRowID;
     return;
   end if;
 end ;


procedure the_Session_HCL /*Зарегистрированные сессии пользователей*/ (
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


procedure the_Session_UNLOCK /*Зарегистрированные сессии пользователей*/ (
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
 the_Session_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update the_Session set LockUserID =null  where the_Sessionid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update the_Session set LockSessionID =null  where the_Sessionid=aRowID;
     return;
   end if;
 end; 


procedure the_Session_SINIT /*Зарегистрированные сессии пользователей*/ (
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
 select  SecurityStyleID into atmpID from the_Session where the_Sessionid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =the_Session');
    return;
  end if;
if aSecurityStyleID is null then
 the_Session_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update the_Session set securitystyleid =aStyleID where the_Sessionid = aRowID;
else 
 update the_Session set securitystyleid =aSecurityStyleID where the_Sessionid = aRowID;
end if; 
end ; 


procedure the_Session_propagate /*Зарегистрированные сессии пользователей*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from the_Session where the_Sessionid=aRowid;
end;



procedure LogReader_BRIEF  (
 aCURSESSION CHAR,
 aLogReaderid CHAR,
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
if aLogReaderid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from LogReader where LogReaderID=aLogReaderID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from LogReader where LogReaderid=aLogReaderID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=LogReader');
    return;
  end if;
  aBRIEF:=func.LogReader_BRIEF_F(aLogReaderid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure LogReader_DELETE /*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
 aCURSESSION CHAR,
 aLogReaderid CHAR,
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
select count(*) into existsCnt from LogReader where LogReaderID=aLogReaderID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from LogReader where LogReaderid=aLogReaderID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:LogReader',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=LogReader');
      return;
    end if;
  end if;
 --  verify lock  --
 LogReader_ISLOCKED( acursession=>acursession,aROWID=>aLogReaderid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=LogReader');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'LogReader',
 aVERB=>'DELETEROW',  aThe_Resource=>aLogReaderid, aLogInstanceID=>aInstanceID);
declare cursor chld_LogReader is select  instanceid ID from instance where OwnerPartName ='LogReader' and OwnerRowID=aLogReaderid;
row_LogReader  chld_LogReader%ROWTYPE;
begin
--open chld_LogReader;
for row_LogReader in chld_LogReader loop
 Kernel.INSTANCE_OWNER (acursession,row_LogReader.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_LogReader.id);
end loop;
--close chld_LogReader;
end ;
  delete from  LogReader 
  where  LogReaderID = aLogReaderID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Роботы журнала событий*/
procedure LogReader_SAVE /*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
 aCURSESSION CHAR,
 aLogReaderid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aAutoStart
 NUMBER/* Автоматизированный запуск *//* Автоматизированный запуск */
,aAutoProgid
 VARCHAR2 := null /* Класс для автоматического запуска *//* Класс для автоматического запуска */
,aReadMarker
 DATE/* Дата последней прочитанной записи *//* Дата последней прочитанной записи */
,aStartInterval
 NUMBER := null /* Интервал запуска (мин) *//* Интервал запуска (мин) */
,aLastStart
 DATE := null /* Дата последнего запуска *//* Дата последнего запуска */
,aLastStop
 DATE := null /* Дата последне останвки *//* Дата последне останвки */
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
select count(*) into existsCnt from LogReader where LogReaderID=aLogReaderID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from LogReader where LogReaderid=aLogReaderID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:LogReader',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=LogReader');
      return;
    end if;
  end if;
 --  verify lock  --
 LogReader_ISLOCKED( acursession=>acursession,aROWID=>aLogReaderid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=LogReader');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'LogReader',
 aVERB=>'EDITROW',  aThe_Resource=>aLogReaderid,aLogInstanceID=>aInstanceID);
 update  LogReader set ChangeStamp=sysdate
,
  Name=aName
,
  AutoStart=aAutoStart
,
  AutoProgid=aAutoProgid
,
  ReadMarker=aReadMarker
,
  StartInterval=aStartInterval
,
  LastStart=aLastStart
,
  LastStop=aLastStop
  where  LogReaderID = aLogReaderID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:LogReader',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=LogReader');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=LogReader');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'LogReader',
 aVERB=>'CREATEROW',  aThe_Resource=>aLogReaderid,aLogInstanceID=>aInstanceID);
 insert into   LogReader
 (  LogReaderID 
,InstanceID
,Name

,AutoStart

,AutoProgid

,ReadMarker

,StartInterval

,LastStart

,LastStop

 ) values ( aLogReaderID 
,aInstanceID
,aName

,aAutoStart

,aAutoProgid

,aReadMarker

,aStartInterval

,aLastStart

,aLastStop

 ); 
 LogReader_SINIT( aCURSESSION,aLogReaderid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure LogReader_PARENT /*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
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
  select  INSTANCEID into aParentID from LogReader where  LogReaderid=aRowID;
 end; 


procedure LogReader_ISLOCKED /*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from LogReader where LogReaderid=aRowID;
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
  LogReader_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZSystem.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure LogReader_LOCK /*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
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
 LogReader_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  LogReader_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from LogReader where LogReaderid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=LogReader');
    return;
  end if;
   if  aLockMode =2  
   then   
    update LogReader set LockUserID =auserID ,LockSessionID =null where LogReaderid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update LogReader set LockUserID =null,LockSessionID =aCURSESSION  where LogReaderid=aRowID;
     return;
   end if;
 end ;


procedure LogReader_HCL /*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
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


procedure LogReader_UNLOCK /*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
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
 LogReader_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update LogReader set LockUserID =null  where LogReaderid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update LogReader set LockSessionID =null  where LogReaderid=aRowID;
     return;
   end if;
 end; 


procedure LogReader_SINIT /*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
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
 select  SecurityStyleID into atmpID from LogReader where LogReaderid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =LogReader');
    return;
  end if;
if aSecurityStyleID is null then
 LogReader_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update LogReader set securitystyleid =aStyleID where LogReaderid = aRowID;
else 
 update LogReader set securitystyleid =aSecurityStyleID where LogReaderid = aRowID;
end if; 
end ; 


procedure LogReader_propagate /*Программы, которые регистрируют себя как 
обработчики лога событий.*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from LogReader where LogReaderid=aRowid;
end;



procedure Verb_BRIEF  (
 aCURSESSION CHAR,
 aVerbid CHAR,
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
if aVerbid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Verb where VerbID=aVerbID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Verb where Verbid=aVerbID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Verb');
    return;
  end if;
  aBRIEF:=func.Verb_BRIEF_F(aVerbid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Verb_DELETE /*Защищаемые системой дейсвия*/ (
 aCURSESSION CHAR,
 aVerbid CHAR,
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
select count(*) into existsCnt from Verb where VerbID=aVerbID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Verb where Verbid=aVerbID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Verb',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Verb');
      return;
    end if;
  end if;
 --  verify lock  --
 Verb_ISLOCKED( acursession=>acursession,aROWID=>aVerbid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Verb');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'Verb',
 aVERB=>'DELETEROW',  aThe_Resource=>aVerbid, aLogInstanceID=>aInstanceID);
declare cursor chld_Verb is select  instanceid ID from instance where OwnerPartName ='Verb' and OwnerRowID=aVerbid;
row_Verb  chld_Verb%ROWTYPE;
begin
--open chld_Verb;
for row_Verb in chld_Verb loop
 Kernel.INSTANCE_OWNER (acursession,row_Verb.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Verb.id);
end loop;
--close chld_Verb;
end ;
  delete from  Verb 
  where  VerbID = aVerbID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Действия*/
procedure Verb_SAVE /*Защищаемые системой дейсвия*/ (
 aCURSESSION CHAR,
 aVerbid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
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
select count(*) into existsCnt from Verb where VerbID=aVerbID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Verb where Verbid=aVerbID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Verb',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Verb');
      return;
    end if;
  end if;
 --  verify lock  --
 Verb_ISLOCKED( acursession=>acursession,aROWID=>aVerbid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Verb');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Verb',
 aVERB=>'EDITROW',  aThe_Resource=>aVerbid,aLogInstanceID=>aInstanceID);
 update  Verb set ChangeStamp=sysdate
,
  Name=aName
  where  VerbID = aVerbID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Verb',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Verb');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Verb');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Verb',
 aVERB=>'CREATEROW',  aThe_Resource=>aVerbid,aLogInstanceID=>aInstanceID);
 insert into   Verb
 (  VerbID 
,InstanceID
,Name

 ) values ( aVerbID 
,aInstanceID
,aName

 ); 
 Verb_SINIT( aCURSESSION,aVerbid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure Verb_PARENT /*Защищаемые системой дейсвия*/ (
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
  select  INSTANCEID into aParentID from Verb where  Verbid=aRowID;
 end; 


procedure Verb_ISLOCKED /*Защищаемые системой дейсвия*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Verb where Verbid=aRowID;
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
  Verb_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZSystem.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Verb_LOCK /*Защищаемые системой дейсвия*/ (
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
 Verb_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Verb_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Verb where Verbid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Verb');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Verb set LockUserID =auserID ,LockSessionID =null where Verbid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Verb set LockUserID =null,LockSessionID =aCURSESSION  where Verbid=aRowID;
     return;
   end if;
 end ;


procedure Verb_HCL /*Защищаемые системой дейсвия*/ (
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


procedure Verb_UNLOCK /*Защищаемые системой дейсвия*/ (
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
 Verb_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Verb set LockUserID =null  where Verbid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Verb set LockSessionID =null  where Verbid=aRowID;
     return;
   end if;
 end; 


procedure Verb_SINIT /*Защищаемые системой дейсвия*/ (
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
 select  SecurityStyleID into atmpID from Verb where Verbid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Verb');
    return;
  end if;
if aSecurityStyleID is null then
 Verb_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Verb set securitystyleid =aStyleID where Verbid = aRowID;
else 
 update Verb set securitystyleid =aSecurityStyleID where Verbid = aRowID;
end if; 
end ; 


procedure Verb_propagate /*Защищаемые системой дейсвия*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Verb where Verbid=aRowid;
end;


end MTZSystem;

/



