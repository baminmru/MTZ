
/* --ROLES*/

 create or replace package body ROLES as

procedure ROLES_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='ROLES'
then
declare cursor child_ROLES_USER is select ROLES_USER.ROLES_USERid ID from ROLES_USER where  ROLES_USER.InstanceID = ainstanceid;
row_ROLES_USER  child_ROLES_USER%ROWTYPE;
begin
--open child_ROLES_USER;
for row_ROLES_USER in child_ROLES_USER loop
 ROLES_USER_DELETE (acursession,row_ROLES_USER.id,aInstanceID);
end loop;
--close child_ROLES_USER;
end;
declare cursor child_ROLES_MAP is select ROLES_MAP.ROLES_MAPid ID from ROLES_MAP where  ROLES_MAP.InstanceID = ainstanceid;
row_ROLES_MAP  child_ROLES_MAP%ROWTYPE;
begin
--open child_ROLES_MAP;
for row_ROLES_MAP in child_ROLES_MAP loop
 ROLES_MAP_DELETE (acursession,row_ROLES_MAP.id,aInstanceID);
end loop;
--close child_ROLES_MAP;
end;
declare cursor child_ROLES_DOC is select ROLES_DOC.ROLES_DOCid ID from ROLES_DOC where  ROLES_DOC.InstanceID = ainstanceid;
row_ROLES_DOC  child_ROLES_DOC%ROWTYPE;
begin
--open child_ROLES_DOC;
for row_ROLES_DOC in child_ROLES_DOC loop
 ROLES_DOC_DELETE (acursession,row_ROLES_DOC.id,aInstanceID);
end loop;
--close child_ROLES_DOC;
end;
declare cursor child_ROLES_DEF is select ROLES_DEF.ROLES_DEFid ID from ROLES_DEF where  ROLES_DEF.InstanceID = ainstanceid;
row_ROLES_DEF  child_ROLES_DEF%ROWTYPE;
begin
--open child_ROLES_DEF;
for row_ROLES_DEF in child_ROLES_DEF loop
 ROLES_DEF_DELETE (acursession,row_ROLES_DEF.id,aInstanceID);
end loop;
--close child_ROLES_DEF;
end;
declare cursor child_ROLES_REPORTS is select ROLES_REPORTS.ROLES_REPORTSid ID from ROLES_REPORTS where  ROLES_REPORTS.InstanceID = ainstanceid;
row_ROLES_REPORTS  child_ROLES_REPORTS%ROWTYPE;
begin
--open child_ROLES_REPORTS;
for row_ROLES_REPORTS in child_ROLES_REPORTS loop
 ROLES_REPORTS_DELETE (acursession,row_ROLES_REPORTS.id,aInstanceID);
end loop;
--close child_ROLES_REPORTS;
end;
declare cursor child_ROLES_WP is select ROLES_WP.ROLES_WPid ID from ROLES_WP where  ROLES_WP.InstanceID = ainstanceid;
row_ROLES_WP  child_ROLES_WP%ROWTYPE;
begin
--open child_ROLES_WP;
for row_ROLES_WP in child_ROLES_WP loop
 ROLES_WP_DELETE (acursession,row_ROLES_WP.id,aInstanceID);
end loop;
--close child_ROLES_WP;
end;
return;
<<del_error>>
return;
end if;
end;
procedure ROLES_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'ROLES'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_ROLES_USER is select ROLES_USER.ROLES_USERid ID from ROLES_USER where  ROLES_USER.InstanceID = arowid;
ROW_ROLES_USER  lch_ROLES_USER%ROWTYPE;
begin
--open lch_ROLES_USER;
for row_ROLES_USER in lch_ROLES_USER loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ROLES_USER where ROLES_USERid=row_ROLES_USER.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ROLES_USER;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ROLES_USER;
     return;
   end if; 
 end if; 
 ROLES_USER_HCL (acursession,ROW_ROLES_USER.id,aisLocked);
 if aisLocked >2 then
   close lch_ROLES_USER;
   return;
 end if;
 end loop;
--close lch_ROLES_USER;
end;
declare cursor lch_ROLES_MAP is select ROLES_MAP.ROLES_MAPid ID from ROLES_MAP where  ROLES_MAP.InstanceID = arowid;
ROW_ROLES_MAP  lch_ROLES_MAP%ROWTYPE;
begin
--open lch_ROLES_MAP;
for row_ROLES_MAP in lch_ROLES_MAP loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ROLES_MAP where ROLES_MAPid=row_ROLES_MAP.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ROLES_MAP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ROLES_MAP;
     return;
   end if; 
 end if; 
 ROLES_MAP_HCL (acursession,ROW_ROLES_MAP.id,aisLocked);
 if aisLocked >2 then
   close lch_ROLES_MAP;
   return;
 end if;
 end loop;
--close lch_ROLES_MAP;
end;
declare cursor lch_ROLES_DOC is select ROLES_DOC.ROLES_DOCid ID from ROLES_DOC where  ROLES_DOC.InstanceID = arowid;
ROW_ROLES_DOC  lch_ROLES_DOC%ROWTYPE;
begin
--open lch_ROLES_DOC;
for row_ROLES_DOC in lch_ROLES_DOC loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ROLES_DOC where ROLES_DOCid=row_ROLES_DOC.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ROLES_DOC;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ROLES_DOC;
     return;
   end if; 
 end if; 
 ROLES_DOC_HCL (acursession,ROW_ROLES_DOC.id,aisLocked);
 if aisLocked >2 then
   close lch_ROLES_DOC;
   return;
 end if;
 end loop;
--close lch_ROLES_DOC;
end;
declare cursor lch_ROLES_DEF is select ROLES_DEF.ROLES_DEFid ID from ROLES_DEF where  ROLES_DEF.InstanceID = arowid;
ROW_ROLES_DEF  lch_ROLES_DEF%ROWTYPE;
begin
--open lch_ROLES_DEF;
for row_ROLES_DEF in lch_ROLES_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ROLES_DEF where ROLES_DEFid=row_ROLES_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ROLES_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ROLES_DEF;
     return;
   end if; 
 end if; 
 ROLES_DEF_HCL (acursession,ROW_ROLES_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_ROLES_DEF;
   return;
 end if;
 end loop;
--close lch_ROLES_DEF;
end;
declare cursor lch_ROLES_REPORTS is select ROLES_REPORTS.ROLES_REPORTSid ID from ROLES_REPORTS where  ROLES_REPORTS.InstanceID = arowid;
ROW_ROLES_REPORTS  lch_ROLES_REPORTS%ROWTYPE;
begin
--open lch_ROLES_REPORTS;
for row_ROLES_REPORTS in lch_ROLES_REPORTS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ROLES_REPORTS where ROLES_REPORTSid=row_ROLES_REPORTS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ROLES_REPORTS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ROLES_REPORTS;
     return;
   end if; 
 end if; 
 ROLES_REPORTS_HCL (acursession,ROW_ROLES_REPORTS.id,aisLocked);
 if aisLocked >2 then
   close lch_ROLES_REPORTS;
   return;
 end if;
 end loop;
--close lch_ROLES_REPORTS;
end;
declare cursor lch_ROLES_WP is select ROLES_WP.ROLES_WPid ID from ROLES_WP where  ROLES_WP.InstanceID = arowid;
ROW_ROLES_WP  lch_ROLES_WP%ROWTYPE;
begin
--open lch_ROLES_WP;
for row_ROLES_WP in lch_ROLES_WP loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ROLES_WP where ROLES_WPid=row_ROLES_WP.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ROLES_WP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ROLES_WP;
     return;
   end if; 
 end if; 
 ROLES_WP_HCL (acursession,ROW_ROLES_WP.id,aisLocked);
 if aisLocked >2 then
   close lch_ROLES_WP;
   return;
 end if;
 end loop;
--close lch_ROLES_WP;
end;
 end if;
aIsLocked:=0;
end;
procedure ROLES_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'ROLES'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_ROLES_USER is select ROLES_USER.ROLES_USERid id from ROLES_USER where  ROLES_USER.InstanceID = arowid;
row_ROLES_USER  pch_ROLES_USER%ROWTYPE;
begin
--open pch_ROLES_USER;
for row_ROLES_USER in  pch_ROLES_USER loop
 ROLES_USER_SINIT( acursession,row_ROLES_USER.id,assid);
 ROLES_USER_propagate( acursession,row_ROLES_USER.id);
end loop;
--close pch_ROLES_USER;
end;
declare cursor pch_ROLES_MAP is select ROLES_MAP.ROLES_MAPid id from ROLES_MAP where  ROLES_MAP.InstanceID = arowid;
row_ROLES_MAP  pch_ROLES_MAP%ROWTYPE;
begin
--open pch_ROLES_MAP;
for row_ROLES_MAP in  pch_ROLES_MAP loop
 ROLES_MAP_SINIT( acursession,row_ROLES_MAP.id,assid);
 ROLES_MAP_propagate( acursession,row_ROLES_MAP.id);
end loop;
--close pch_ROLES_MAP;
end;
declare cursor pch_ROLES_DOC is select ROLES_DOC.ROLES_DOCid id from ROLES_DOC where  ROLES_DOC.InstanceID = arowid;
row_ROLES_DOC  pch_ROLES_DOC%ROWTYPE;
begin
--open pch_ROLES_DOC;
for row_ROLES_DOC in  pch_ROLES_DOC loop
 ROLES_DOC_SINIT( acursession,row_ROLES_DOC.id,assid);
 ROLES_DOC_propagate( acursession,row_ROLES_DOC.id);
end loop;
--close pch_ROLES_DOC;
end;
declare cursor pch_ROLES_DEF is select ROLES_DEF.ROLES_DEFid id from ROLES_DEF where  ROLES_DEF.InstanceID = arowid;
row_ROLES_DEF  pch_ROLES_DEF%ROWTYPE;
begin
--open pch_ROLES_DEF;
for row_ROLES_DEF in  pch_ROLES_DEF loop
 ROLES_DEF_SINIT( acursession,row_ROLES_DEF.id,assid);
 ROLES_DEF_propagate( acursession,row_ROLES_DEF.id);
end loop;
--close pch_ROLES_DEF;
end;
declare cursor pch_ROLES_REPORTS is select ROLES_REPORTS.ROLES_REPORTSid id from ROLES_REPORTS where  ROLES_REPORTS.InstanceID = arowid;
row_ROLES_REPORTS  pch_ROLES_REPORTS%ROWTYPE;
begin
--open pch_ROLES_REPORTS;
for row_ROLES_REPORTS in  pch_ROLES_REPORTS loop
 ROLES_REPORTS_SINIT( acursession,row_ROLES_REPORTS.id,assid);
 ROLES_REPORTS_propagate( acursession,row_ROLES_REPORTS.id);
end loop;
--close pch_ROLES_REPORTS;
end;
declare cursor pch_ROLES_WP is select ROLES_WP.ROLES_WPid id from ROLES_WP where  ROLES_WP.InstanceID = arowid;
row_ROLES_WP  pch_ROLES_WP%ROWTYPE;
begin
--open pch_ROLES_WP;
for row_ROLES_WP in  pch_ROLES_WP loop
 ROLES_WP_SINIT( acursession,row_ROLES_WP.id,assid);
 ROLES_WP_propagate( acursession,row_ROLES_WP.id);
end loop;
--close pch_ROLES_WP;
end;
 end if; 
end;



procedure ROLES_USER_BRIEF  (
 aCURSESSION CHAR,
 aROLES_USERid CHAR,
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
if aROLES_USERid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ROLES_USER where ROLES_USERID=aROLES_USERID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ROLES_USER where ROLES_USERid=aROLES_USERID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ROLES_USER');
    return;
  end if;
  aBRIEF:=func.ROLES_USER_BRIEF_F(aROLES_USERid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ROLES_USER_DELETE /*Пользователи*/ (
 aCURSESSION CHAR,
 aROLES_USERid CHAR,
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
select count(*) into existsCnt from ROLES_USER where ROLES_USERID=aROLES_USERID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ROLES_USER where ROLES_USERid=aROLES_USERID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ROLES_USER',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ROLES_USER');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_USER_ISLOCKED( acursession=>acursession,aROWID=>aROLES_USERid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ROLES_USER');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_USER',
 aVERB=>'DELETEROW',  aThe_Resource=>aROLES_USERid, aLogInstanceID=>aInstanceID);
declare cursor chld_ROLES_USER is select  instanceid ID from instance where OwnerPartName ='ROLES_USER' and OwnerRowID=aROLES_USERid;
row_ROLES_USER  chld_ROLES_USER%ROWTYPE;
begin
--open chld_ROLES_USER;
for row_ROLES_USER in chld_ROLES_USER loop
 Kernel.INSTANCE_OWNER (acursession,row_ROLES_USER.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ROLES_USER.id);
end loop;
--close chld_ROLES_USER;
end ;
  delete from  ROLES_USER 
  where  ROLES_USERID = aROLES_USERID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Пользователи*/
procedure ROLES_USER_SAVE /*Пользователи*/ (
 aCURSESSION CHAR,
 aROLES_USERid CHAR,
aInstanceID CHAR 
,aTheUser CHAR/* Пользователь *//* Пользователь */
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
select count(*) into existsCnt from ROLES_USER where ROLES_USERID=aROLES_USERID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ROLES_USER where ROLES_USERid=aROLES_USERID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ROLES_USER',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ROLES_USER');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_USER_ISLOCKED( acursession=>acursession,aROWID=>aROLES_USERid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_USER');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_USER',
 aVERB=>'EDITROW',  aThe_Resource=>aROLES_USERid,aLogInstanceID=>aInstanceID);
 update  ROLES_USER set ChangeStamp=sysdate
,
  TheUser=aTheUser
  where  ROLES_USERID = aROLES_USERID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ROLES_USER',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ROLES_USER');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_USER');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_USER',
 aVERB=>'CREATEROW',  aThe_Resource=>aROLES_USERid,aLogInstanceID=>aInstanceID);
 insert into   ROLES_USER
 (  ROLES_USERID 
,InstanceID
,TheUser

 ) values ( aROLES_USERID 
,aInstanceID
,aTheUser

 ); 
 ROLES_USER_SINIT( aCURSESSION,aROLES_USERid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ROLES_USER_PARENT /*Пользователи*/ (
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
  select  INSTANCEID into aParentID from ROLES_USER where  ROLES_USERid=aRowID;
 end; 


procedure ROLES_USER_ISLOCKED /*Пользователи*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ROLES_USER where ROLES_USERid=aRowID;
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
  ROLES_USER_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ROLES.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ROLES_USER_LOCK /*Пользователи*/ (
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
 ROLES_USER_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ROLES_USER_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ROLES_USER where ROLES_USERid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ROLES_USER');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ROLES_USER set LockUserID =auserID ,LockSessionID =null where ROLES_USERid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ROLES_USER set LockUserID =null,LockSessionID =aCURSESSION  where ROLES_USERid=aRowID;
     return;
   end if;
 end ;


procedure ROLES_USER_HCL /*Пользователи*/ (
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


procedure ROLES_USER_UNLOCK /*Пользователи*/ (
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
 ROLES_USER_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ROLES_USER set LockUserID =null  where ROLES_USERid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ROLES_USER set LockSessionID =null  where ROLES_USERid=aRowID;
     return;
   end if;
 end; 


procedure ROLES_USER_SINIT /*Пользователи*/ (
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
 select  SecurityStyleID into atmpID from ROLES_USER where ROLES_USERid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ROLES_USER');
    return;
  end if;
if aSecurityStyleID is null then
 ROLES_USER_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ROLES_USER set securitystyleid =aStyleID where ROLES_USERid = aRowID;
else 
 update ROLES_USER set securitystyleid =aSecurityStyleID where ROLES_USERid = aRowID;
end if; 
end ; 


procedure ROLES_USER_propagate /*Пользователи*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ROLES_USER where ROLES_USERid=aRowid;
end;



procedure ROLES_MAP_BRIEF  (
 aCURSESSION CHAR,
 aROLES_MAPid CHAR,
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
if aROLES_MAPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ROLES_MAP where ROLES_MAPID=aROLES_MAPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ROLES_MAP where ROLES_MAPid=aROLES_MAPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ROLES_MAP');
    return;
  end if;
  aBRIEF:=func.ROLES_MAP_BRIEF_F(aROLES_MAPid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ROLES_MAP_DELETE /*Отображение на группы защиты*/ (
 aCURSESSION CHAR,
 aROLES_MAPid CHAR,
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
select count(*) into existsCnt from ROLES_MAP where ROLES_MAPID=aROLES_MAPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ROLES_MAP where ROLES_MAPid=aROLES_MAPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ROLES_MAP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ROLES_MAP');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_MAP_ISLOCKED( acursession=>acursession,aROWID=>aROLES_MAPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ROLES_MAP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_MAP',
 aVERB=>'DELETEROW',  aThe_Resource=>aROLES_MAPid, aLogInstanceID=>aInstanceID);
declare cursor chld_ROLES_MAP is select  instanceid ID from instance where OwnerPartName ='ROLES_MAP' and OwnerRowID=aROLES_MAPid;
row_ROLES_MAP  chld_ROLES_MAP%ROWTYPE;
begin
--open chld_ROLES_MAP;
for row_ROLES_MAP in chld_ROLES_MAP loop
 Kernel.INSTANCE_OWNER (acursession,row_ROLES_MAP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ROLES_MAP.id);
end loop;
--close chld_ROLES_MAP;
end ;
  delete from  ROLES_MAP 
  where  ROLES_MAPID = aROLES_MAPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Отображение на группы защиты*/
procedure ROLES_MAP_SAVE /*Отображение на группы защиты*/ (
 aCURSESSION CHAR,
 aROLES_MAPid CHAR,
aInstanceID CHAR 
,aTheGroup CHAR/* Группа *//* Группа */
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
select count(*) into existsCnt from ROLES_MAP where ROLES_MAPID=aROLES_MAPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ROLES_MAP where ROLES_MAPid=aROLES_MAPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ROLES_MAP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ROLES_MAP');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_MAP_ISLOCKED( acursession=>acursession,aROWID=>aROLES_MAPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_MAP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_MAP',
 aVERB=>'EDITROW',  aThe_Resource=>aROLES_MAPid,aLogInstanceID=>aInstanceID);
 update  ROLES_MAP set ChangeStamp=sysdate
,
  TheGroup=aTheGroup
  where  ROLES_MAPID = aROLES_MAPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ROLES_MAP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ROLES_MAP');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_MAP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_MAP',
 aVERB=>'CREATEROW',  aThe_Resource=>aROLES_MAPid,aLogInstanceID=>aInstanceID);
 insert into   ROLES_MAP
 (  ROLES_MAPID 
,InstanceID
,TheGroup

 ) values ( aROLES_MAPID 
,aInstanceID
,aTheGroup

 ); 
 ROLES_MAP_SINIT( aCURSESSION,aROLES_MAPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ROLES_MAP_PARENT /*Отображение на группы защиты*/ (
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
  select  INSTANCEID into aParentID from ROLES_MAP where  ROLES_MAPid=aRowID;
 end; 


procedure ROLES_MAP_ISLOCKED /*Отображение на группы защиты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ROLES_MAP where ROLES_MAPid=aRowID;
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
  ROLES_MAP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ROLES.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ROLES_MAP_LOCK /*Отображение на группы защиты*/ (
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
 ROLES_MAP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ROLES_MAP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ROLES_MAP where ROLES_MAPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ROLES_MAP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ROLES_MAP set LockUserID =auserID ,LockSessionID =null where ROLES_MAPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ROLES_MAP set LockUserID =null,LockSessionID =aCURSESSION  where ROLES_MAPid=aRowID;
     return;
   end if;
 end ;


procedure ROLES_MAP_HCL /*Отображение на группы защиты*/ (
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


procedure ROLES_MAP_UNLOCK /*Отображение на группы защиты*/ (
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
 ROLES_MAP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ROLES_MAP set LockUserID =null  where ROLES_MAPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ROLES_MAP set LockSessionID =null  where ROLES_MAPid=aRowID;
     return;
   end if;
 end; 


procedure ROLES_MAP_SINIT /*Отображение на группы защиты*/ (
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
 select  SecurityStyleID into atmpID from ROLES_MAP where ROLES_MAPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ROLES_MAP');
    return;
  end if;
if aSecurityStyleID is null then
 ROLES_MAP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ROLES_MAP set securitystyleid =aStyleID where ROLES_MAPid = aRowID;
else 
 update ROLES_MAP set securitystyleid =aSecurityStyleID where ROLES_MAPid = aRowID;
end if; 
end ; 


procedure ROLES_MAP_propagate /*Отображение на группы защиты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ROLES_MAP where ROLES_MAPid=aRowid;
end;



procedure ROLES_DOC_BRIEF  (
 aCURSESSION CHAR,
 aROLES_DOCid CHAR,
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
if aROLES_DOCid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ROLES_DOC where ROLES_DOCID=aROLES_DOCID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ROLES_DOC where ROLES_DOCid=aROLES_DOCID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ROLES_DOC');
    return;
  end if;
  aBRIEF:=func.ROLES_DOC_BRIEF_F(aROLES_DOCid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ROLES_DOC_DELETE /**/ (
 aCURSESSION CHAR,
 aROLES_DOCid CHAR,
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
select count(*) into existsCnt from ROLES_DOC where ROLES_DOCID=aROLES_DOCID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ROLES_DOC where ROLES_DOCid=aROLES_DOCID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ROLES_DOC',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ROLES_DOC');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_DOC_ISLOCKED( acursession=>acursession,aROWID=>aROLES_DOCid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ROLES_DOC');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_ROLES_DOC_STATE is select ROLES_DOC_STATE.ROLES_DOC_STATEid ID from ROLES_DOC_STATE where  ROLES_DOC_STATE.ParentStructRowID = aROLES_DOCid;
    child_ROLES_DOC_STATE_rec  child_ROLES_DOC_STATE%ROWTYPE;
    begin
    --open child_ROLES_DOC_STATE;
      for child_ROLES_DOC_STATE_rec in child_ROLES_DOC_STATE loop
      ROLES_DOC_STATE_DELETE (acursession,child_ROLES_DOC_STATE_rec.id,aInstanceid);
      end loop;
      --close child_ROLES_DOC_STATE;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_DOC',
 aVERB=>'DELETEROW',  aThe_Resource=>aROLES_DOCid, aLogInstanceID=>aInstanceID);
declare cursor chld_ROLES_DOC is select  instanceid ID from instance where OwnerPartName ='ROLES_DOC' and OwnerRowID=aROLES_DOCid;
row_ROLES_DOC  chld_ROLES_DOC%ROWTYPE;
begin
--open chld_ROLES_DOC;
for row_ROLES_DOC in chld_ROLES_DOC loop
 Kernel.INSTANCE_OWNER (acursession,row_ROLES_DOC.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ROLES_DOC.id);
end loop;
--close chld_ROLES_DOC;
end ;
  delete from  ROLES_DOC 
  where  ROLES_DOCID = aROLES_DOCID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Доступные документы*/
procedure ROLES_DOC_SAVE /**/ (
 aCURSESSION CHAR,
 aROLES_DOCid CHAR,
aInstanceID CHAR 
,aThe_Document CHAR/* Тип документа *//* Тип документа */
,aThe_Denied
 NUMBER := null /* Запрещен *//* Запрещен */
,aAllowDeleteDoc
 NUMBER := null /* Разрешено удаление *//* Разрешено удаление */
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
select count(*) into existsCnt from ROLES_DOC where ROLES_DOCID=aROLES_DOCID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ROLES_DOC where ROLES_DOCid=aROLES_DOCID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ROLES_DOC',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ROLES_DOC');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_DOC_ISLOCKED( acursession=>acursession,aROWID=>aROLES_DOCid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_DOC');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_DOC',
 aVERB=>'EDITROW',  aThe_Resource=>aROLES_DOCid,aLogInstanceID=>aInstanceID);
 update  ROLES_DOC set ChangeStamp=sysdate
,
  The_Document=aThe_Document
,
  The_Denied=aThe_Denied
,
  AllowDeleteDoc=aAllowDeleteDoc
  where  ROLES_DOCID = aROLES_DOCID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ROLES_DOC',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ROLES_DOC');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_DOC');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_DOC',
 aVERB=>'CREATEROW',  aThe_Resource=>aROLES_DOCid,aLogInstanceID=>aInstanceID);
 insert into   ROLES_DOC
 (  ROLES_DOCID 
,InstanceID
,The_Document

,The_Denied

,AllowDeleteDoc

 ) values ( aROLES_DOCID 
,aInstanceID
,aThe_Document

,aThe_Denied

,aAllowDeleteDoc

 ); 
 ROLES_DOC_SINIT( aCURSESSION,aROLES_DOCid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ROLES_DOC_PARENT /**/ (
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
  select  INSTANCEID into aParentID from ROLES_DOC where  ROLES_DOCid=aRowID;
 end; 


procedure ROLES_DOC_ISLOCKED /**/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ROLES_DOC where ROLES_DOCid=aRowID;
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
  ROLES_DOC_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ROLES.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ROLES_DOC_LOCK /**/ (
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
 ROLES_DOC_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ROLES_DOC_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ROLES_DOC where ROLES_DOCid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ROLES_DOC');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ROLES_DOC set LockUserID =auserID ,LockSessionID =null where ROLES_DOCid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ROLES_DOC set LockUserID =null,LockSessionID =aCURSESSION  where ROLES_DOCid=aRowID;
     return;
   end if;
 end ;


procedure ROLES_DOC_HCL /**/ (
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
declare cursor lch_ROLES_DOC_STATE is select ROLES_DOC_STATE.ROLES_DOC_STATEid ID from ROLES_DOC_STATE where  ROLES_DOC_STATE.ParentStructRowID = aRowid;
row_ROLES_DOC_STATE lch_ROLES_DOC_STATE%ROWTYPE;
begin  
--open lch_ROLES_DOC_STATE;
for row_ROLES_DOC_STATE in lch_ROLES_DOC_STATE
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ROLES_DOC_STATE where ROLES_DOC_STATEid=row_ROLES_DOC_STATE.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ROLES_DOC_STATE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ROLES_DOC_STATE;
     return;
   end if; 
 end if;  
 ROLES_DOC_STATE_HCL (acursession,row_ROLES_DOC_STATE.id,aisLocked);
 if aisLocked >2 then
   close lch_ROLES_DOC_STATE;
   return;
 end if;
end loop;
--close lch_ROLES_DOC_STATE;
end;
aIsLocked :=0;
end;


procedure ROLES_DOC_UNLOCK /**/ (
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
 ROLES_DOC_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ROLES_DOC set LockUserID =null  where ROLES_DOCid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ROLES_DOC set LockSessionID =null  where ROLES_DOCid=aRowID;
     return;
   end if;
 end; 


procedure ROLES_DOC_SINIT /**/ (
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
 select  SecurityStyleID into atmpID from ROLES_DOC where ROLES_DOCid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ROLES_DOC');
    return;
  end if;
if aSecurityStyleID is null then
 ROLES_DOC_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ROLES_DOC set securitystyleid =aStyleID where ROLES_DOCid = aRowID;
else 
 update ROLES_DOC set securitystyleid =aSecurityStyleID where ROLES_DOCid = aRowID;
end if; 
end ; 


procedure ROLES_DOC_propagate /**/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ROLES_DOC where ROLES_DOCid=aRowid;
declare cursor pch_ROLES_DOC_STATE  is select ROLES_DOC_STATE.ROLES_DOC_STATEid ID from ROLES_DOC_STATE where  ROLES_DOC_STATE.ParentStructRowID = aRowid;
row_ROLES_DOC_STATE  pch_ROLES_DOC_STATE%ROWTYPE;
begin
--open pch_ROLES_DOC_STATE;
for row_ROLES_DOC_STATE in pch_ROLES_DOC_STATE loop
   ROLES_DOC_STATE_SINIT( acursession,row_ROLES_DOC_STATE.id,assid);
   ROLES_DOC_STATE_propagate( acursession,row_ROLES_DOC_STATE.id);
end loop;
--close pch_ROLES_DOC_STATE;
end;
end;



procedure ROLES_DOC_STATE_BRIEF  (
 aCURSESSION CHAR,
 aROLES_DOC_STATEid CHAR,
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
if aROLES_DOC_STATEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ROLES_DOC_STATE where ROLES_DOC_STATEID=aROLES_DOC_STATEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ROLES_DOC_STATE where ROLES_DOC_STATEid=aROLES_DOC_STATEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ROLES_DOC_STATE');
    return;
  end if;
  aBRIEF:=func.ROLES_DOC_STATE_BRIEF_F(aROLES_DOC_STATEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ROLES_DOC_STATE_DELETE /**/ (
 aCURSESSION CHAR,
 aROLES_DOC_STATEid CHAR,
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
select count(*) into existsCnt from ROLES_DOC_STATE where ROLES_DOC_STATEID=aROLES_DOC_STATEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ROLES_DOC_STATE where ROLES_DOC_STATEid=aROLES_DOC_STATEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ROLES_DOC_STATE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ROLES_DOC_STATE');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_DOC_STATE_ISLOCKED( acursession=>acursession,aROWID=>aROLES_DOC_STATEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ROLES_DOC_STATE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_DOC_STATE',
 aVERB=>'DELETEROW',  aThe_Resource=>aROLES_DOC_STATEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ROLES_DOC_STATE is select  instanceid ID from instance where OwnerPartName ='ROLES_DOC_STATE' and OwnerRowID=aROLES_DOC_STATEid;
row_ROLES_DOC_STATE  chld_ROLES_DOC_STATE%ROWTYPE;
begin
--open chld_ROLES_DOC_STATE;
for row_ROLES_DOC_STATE in chld_ROLES_DOC_STATE loop
 Kernel.INSTANCE_OWNER (acursession,row_ROLES_DOC_STATE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ROLES_DOC_STATE.id);
end loop;
--close chld_ROLES_DOC_STATE;
end ;
  delete from  ROLES_DOC_STATE 
  where  ROLES_DOC_STATEID = aROLES_DOC_STATEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Доступные состояния*/
procedure ROLES_DOC_STATE_SAVE /**/ (
 aCURSESSION CHAR,
 aROLES_DOC_STATEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aThe_State CHAR := null /* Состояние *//* Состояние */
,aThe_Mode CHAR := null /* Режим *//* Режим */
,aAllowDelete
 NUMBER := null /* Можно удалять *//* Можно удалять */
,aStateChangeDisabled
 NUMBER := null /* Запрещена смена состояния *//* Запрещена смена состояния */
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
select count(*) into existsCnt from ROLES_DOC_STATE where ROLES_DOC_STATEID=aROLES_DOC_STATEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ROLES_DOC_STATE where ROLES_DOC_STATEid=aROLES_DOC_STATEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ROLES_DOC_STATE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ROLES_DOC_STATE');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_DOC_STATE_ISLOCKED( acursession=>acursession,aROWID=>aROLES_DOC_STATEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_DOC_STATE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_DOC_STATE',
 aVERB=>'EDITROW',  aThe_Resource=>aROLES_DOC_STATEid,aLogInstanceID=>aInstanceID);
 update  ROLES_DOC_STATE set ChangeStamp=sysdate
,
  The_State=aThe_State
,
  The_Mode=aThe_Mode
,
  AllowDelete=aAllowDelete
,
  StateChangeDisabled=aStateChangeDisabled
  where  ROLES_DOC_STATEID = aROLES_DOC_STATEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from ROLES_DOC where ROLES_DOCid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ROLES_DOC_STATE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ROLES_DOC_STATE');
      return;
    end if;
 end if;
 ROLES_DOC_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_DOC_STATE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_DOC_STATE',
 aVERB=>'CREATEROW',  aThe_Resource=>aROLES_DOC_STATEid,aLogInstanceID=>aInstanceID);
 insert into   ROLES_DOC_STATE
 (  ROLES_DOC_STATEID 
,ParentStructRowID
,The_State

,The_Mode

,AllowDelete

,StateChangeDisabled

 ) values ( aROLES_DOC_STATEID 
,aParentStructRowID
,aThe_State

,aThe_Mode

,aAllowDelete

,aStateChangeDisabled

 ); 
 ROLES_DOC_STATE_SINIT( aCURSESSION,aROLES_DOC_STATEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ROLES_DOC_STATE_PARENT /**/ (
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
  select ParentStructRowID into aParentID  from ROLES_DOC_STATE where  ROLES_DOC_STATEid=aRowID;
  aParentTable := 'ROLES_DOC';
 end; 


procedure ROLES_DOC_STATE_ISLOCKED /**/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ROLES_DOC_STATE where ROLES_DOC_STATEid=aRowID;
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
  ROLES_DOC_STATE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ROLES.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ROLES_DOC_STATE_LOCK /**/ (
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
 ROLES_DOC_STATE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ROLES_DOC_STATE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ROLES_DOC_STATE where ROLES_DOC_STATEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ROLES_DOC_STATE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ROLES_DOC_STATE set LockUserID =auserID ,LockSessionID =null where ROLES_DOC_STATEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ROLES_DOC_STATE set LockUserID =null,LockSessionID =aCURSESSION  where ROLES_DOC_STATEid=aRowID;
     return;
   end if;
 end ;


procedure ROLES_DOC_STATE_HCL /**/ (
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


procedure ROLES_DOC_STATE_UNLOCK /**/ (
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
 ROLES_DOC_STATE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ROLES_DOC_STATE set LockUserID =null  where ROLES_DOC_STATEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ROLES_DOC_STATE set LockSessionID =null  where ROLES_DOC_STATEid=aRowID;
     return;
   end if;
 end; 


procedure ROLES_DOC_STATE_SINIT /**/ (
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
 select  SecurityStyleID into atmpID from ROLES_DOC_STATE where ROLES_DOC_STATEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ROLES_DOC_STATE');
    return;
  end if;
if aSecurityStyleID is null then
 ROLES_DOC_STATE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ROLES_DOC_STATE set securitystyleid =aStyleID where ROLES_DOC_STATEid = aRowID;
else 
 update ROLES_DOC_STATE set securitystyleid =aSecurityStyleID where ROLES_DOC_STATEid = aRowID;
end if; 
end ; 


procedure ROLES_DOC_STATE_propagate /**/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ROLES_DOC_STATE where ROLES_DOC_STATEid=aRowid;
end;



procedure ROLES_DEF_BRIEF  (
 aCURSESSION CHAR,
 aROLES_DEFid CHAR,
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
if aROLES_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ROLES_DEF where ROLES_DEFID=aROLES_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ROLES_DEF where ROLES_DEFid=aROLES_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ROLES_DEF');
    return;
  end if;
  aBRIEF:=func.ROLES_DEF_BRIEF_F(aROLES_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ROLES_DEF_DELETE /*Определение роли*/ (
 aCURSESSION CHAR,
 aROLES_DEFid CHAR,
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
select count(*) into existsCnt from ROLES_DEF where ROLES_DEFID=aROLES_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ROLES_DEF where ROLES_DEFid=aROLES_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ROLES_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ROLES_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_DEF_ISLOCKED( acursession=>acursession,aROWID=>aROLES_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ROLES_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aROLES_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_ROLES_DEF is select  instanceid ID from instance where OwnerPartName ='ROLES_DEF' and OwnerRowID=aROLES_DEFid;
row_ROLES_DEF  chld_ROLES_DEF%ROWTYPE;
begin
--open chld_ROLES_DEF;
for row_ROLES_DEF in chld_ROLES_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_ROLES_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ROLES_DEF.id);
end loop;
--close chld_ROLES_DEF;
end ;
  delete from  ROLES_DEF 
  where  ROLES_DEFID = aROLES_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Определение роли*/
procedure ROLES_DEF_SAVE /*Определение роли*/ (
 aCURSESSION CHAR,
 aROLES_DEFid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
,aRightsSet_Denied
 NUMBER := null /* Настройка прав запрещена *//* Настройка прав запрещена */
,aFormCFG_Denied
 NUMBER := null /* Настройки форм запрещены *//* Настройки форм запрещены */
,aListCFG_Denied
 NUMBER := null /* Настройка журналов запрещена *//* Настройка журналов запрещена */
,aFileExch_Denied
 NUMBER := null /* Файловый обмен запрещен *//* Файловый обмен запрещен */
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
select count(*) into existsCnt from ROLES_DEF where ROLES_DEFID=aROLES_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ROLES_DEF where ROLES_DEFid=aROLES_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ROLES_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ROLES_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_DEF_ISLOCKED( acursession=>acursession,aROWID=>aROLES_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aROLES_DEFid,aLogInstanceID=>aInstanceID);
 update  ROLES_DEF set ChangeStamp=sysdate
,
  name=aname
,
  TheComment=aTheComment
,
  RightsSet_Denied=aRightsSet_Denied
,
  FormCFG_Denied=aFormCFG_Denied
,
  ListCFG_Denied=aListCFG_Denied
,
  FileExch_Denied=aFileExch_Denied
  where  ROLES_DEFID = aROLES_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ROLES_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ROLES_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_DEF');
    return;
  end if;
select Count(*) into existsCnt from ROLES_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <ROLES_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aROLES_DEFid,aLogInstanceID=>aInstanceID);
 insert into   ROLES_DEF
 (  ROLES_DEFID 
,InstanceID
,name

,TheComment

,RightsSet_Denied

,FormCFG_Denied

,ListCFG_Denied

,FileExch_Denied

 ) values ( aROLES_DEFID 
,aInstanceID
,aname

,aTheComment

,aRightsSet_Denied

,aFormCFG_Denied

,aListCFG_Denied

,aFileExch_Denied

 ); 
 ROLES_DEF_SINIT( aCURSESSION,aROLES_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ROLES_DEF_PARENT /*Определение роли*/ (
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
  select  INSTANCEID into aParentID from ROLES_DEF where  ROLES_DEFid=aRowID;
 end; 


procedure ROLES_DEF_ISLOCKED /*Определение роли*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ROLES_DEF where ROLES_DEFid=aRowID;
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
  ROLES_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ROLES.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ROLES_DEF_LOCK /*Определение роли*/ (
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
 ROLES_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ROLES_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ROLES_DEF where ROLES_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ROLES_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ROLES_DEF set LockUserID =auserID ,LockSessionID =null where ROLES_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ROLES_DEF set LockUserID =null,LockSessionID =aCURSESSION  where ROLES_DEFid=aRowID;
     return;
   end if;
 end ;


procedure ROLES_DEF_HCL /*Определение роли*/ (
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


procedure ROLES_DEF_UNLOCK /*Определение роли*/ (
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
 ROLES_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ROLES_DEF set LockUserID =null  where ROLES_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ROLES_DEF set LockSessionID =null  where ROLES_DEFid=aRowID;
     return;
   end if;
 end; 


procedure ROLES_DEF_SINIT /*Определение роли*/ (
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
 select  SecurityStyleID into atmpID from ROLES_DEF where ROLES_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ROLES_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 ROLES_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ROLES_DEF set securitystyleid =aStyleID where ROLES_DEFid = aRowID;
else 
 update ROLES_DEF set securitystyleid =aSecurityStyleID where ROLES_DEFid = aRowID;
end if; 
end ; 


procedure ROLES_DEF_propagate /*Определение роли*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ROLES_DEF where ROLES_DEFid=aRowid;
end;



procedure ROLES_REPORTS_BRIEF  (
 aCURSESSION CHAR,
 aROLES_REPORTSid CHAR,
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
if aROLES_REPORTSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ROLES_REPORTS where ROLES_REPORTSID=aROLES_REPORTSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ROLES_REPORTS where ROLES_REPORTSid=aROLES_REPORTSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ROLES_REPORTS');
    return;
  end if;
  aBRIEF:=func.ROLES_REPORTS_BRIEF_F(aROLES_REPORTSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ROLES_REPORTS_DELETE /**/ (
 aCURSESSION CHAR,
 aROLES_REPORTSid CHAR,
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
select count(*) into existsCnt from ROLES_REPORTS where ROLES_REPORTSID=aROLES_REPORTSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ROLES_REPORTS where ROLES_REPORTSid=aROLES_REPORTSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ROLES_REPORTS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ROLES_REPORTS');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_REPORTS_ISLOCKED( acursession=>acursession,aROWID=>aROLES_REPORTSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ROLES_REPORTS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_REPORTS',
 aVERB=>'DELETEROW',  aThe_Resource=>aROLES_REPORTSid, aLogInstanceID=>aInstanceID);
declare cursor chld_ROLES_REPORTS is select  instanceid ID from instance where OwnerPartName ='ROLES_REPORTS' and OwnerRowID=aROLES_REPORTSid;
row_ROLES_REPORTS  chld_ROLES_REPORTS%ROWTYPE;
begin
--open chld_ROLES_REPORTS;
for row_ROLES_REPORTS in chld_ROLES_REPORTS loop
 Kernel.INSTANCE_OWNER (acursession,row_ROLES_REPORTS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ROLES_REPORTS.id);
end loop;
--close chld_ROLES_REPORTS;
end ;
  delete from  ROLES_REPORTS 
  where  ROLES_REPORTSID = aROLES_REPORTSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Отчёты*/
procedure ROLES_REPORTS_SAVE /**/ (
 aCURSESSION CHAR,
 aROLES_REPORTSid CHAR,
aInstanceID CHAR 
,aThe_Report CHAR/* Отчёт *//* Отчёт */
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
select count(*) into existsCnt from ROLES_REPORTS where ROLES_REPORTSID=aROLES_REPORTSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ROLES_REPORTS where ROLES_REPORTSid=aROLES_REPORTSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ROLES_REPORTS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ROLES_REPORTS');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_REPORTS_ISLOCKED( acursession=>acursession,aROWID=>aROLES_REPORTSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_REPORTS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_REPORTS',
 aVERB=>'EDITROW',  aThe_Resource=>aROLES_REPORTSid,aLogInstanceID=>aInstanceID);
 update  ROLES_REPORTS set ChangeStamp=sysdate
,
  The_Report=aThe_Report
  where  ROLES_REPORTSID = aROLES_REPORTSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ROLES_REPORTS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ROLES_REPORTS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_REPORTS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_REPORTS',
 aVERB=>'CREATEROW',  aThe_Resource=>aROLES_REPORTSid,aLogInstanceID=>aInstanceID);
 insert into   ROLES_REPORTS
 (  ROLES_REPORTSID 
,InstanceID
,The_Report

 ) values ( aROLES_REPORTSID 
,aInstanceID
,aThe_Report

 ); 
 ROLES_REPORTS_SINIT( aCURSESSION,aROLES_REPORTSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ROLES_REPORTS_PARENT /**/ (
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
  select  INSTANCEID into aParentID from ROLES_REPORTS where  ROLES_REPORTSid=aRowID;
 end; 


procedure ROLES_REPORTS_ISLOCKED /**/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ROLES_REPORTS where ROLES_REPORTSid=aRowID;
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
  ROLES_REPORTS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ROLES.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ROLES_REPORTS_LOCK /**/ (
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
 ROLES_REPORTS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ROLES_REPORTS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ROLES_REPORTS where ROLES_REPORTSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ROLES_REPORTS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ROLES_REPORTS set LockUserID =auserID ,LockSessionID =null where ROLES_REPORTSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ROLES_REPORTS set LockUserID =null,LockSessionID =aCURSESSION  where ROLES_REPORTSid=aRowID;
     return;
   end if;
 end ;


procedure ROLES_REPORTS_HCL /**/ (
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


procedure ROLES_REPORTS_UNLOCK /**/ (
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
 ROLES_REPORTS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ROLES_REPORTS set LockUserID =null  where ROLES_REPORTSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ROLES_REPORTS set LockSessionID =null  where ROLES_REPORTSid=aRowID;
     return;
   end if;
 end; 


procedure ROLES_REPORTS_SINIT /**/ (
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
 select  SecurityStyleID into atmpID from ROLES_REPORTS where ROLES_REPORTSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ROLES_REPORTS');
    return;
  end if;
if aSecurityStyleID is null then
 ROLES_REPORTS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ROLES_REPORTS set securitystyleid =aStyleID where ROLES_REPORTSid = aRowID;
else 
 update ROLES_REPORTS set securitystyleid =aSecurityStyleID where ROLES_REPORTSid = aRowID;
end if; 
end ; 


procedure ROLES_REPORTS_propagate /**/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ROLES_REPORTS where ROLES_REPORTSid=aRowid;
end;



procedure ROLES_WP_BRIEF  (
 aCURSESSION CHAR,
 aROLES_WPid CHAR,
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
if aROLES_WPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ROLES_WP where ROLES_WPID=aROLES_WPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ROLES_WP where ROLES_WPid=aROLES_WPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ROLES_WP');
    return;
  end if;
  aBRIEF:=func.ROLES_WP_BRIEF_F(aROLES_WPid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ROLES_WP_DELETE /*Доступные приложения*/ (
 aCURSESSION CHAR,
 aROLES_WPid CHAR,
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
select count(*) into existsCnt from ROLES_WP where ROLES_WPID=aROLES_WPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ROLES_WP where ROLES_WPid=aROLES_WPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ROLES_WP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ROLES_WP');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_WP_ISLOCKED( acursession=>acursession,aROWID=>aROLES_WPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ROLES_WP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_ROLES_ACT is select ROLES_ACT.ROLES_ACTid ID from ROLES_ACT where  ROLES_ACT.ParentStructRowID = aROLES_WPid;
    child_ROLES_ACT_rec  child_ROLES_ACT%ROWTYPE;
    begin
    --open child_ROLES_ACT;
      for child_ROLES_ACT_rec in child_ROLES_ACT loop
      ROLES_ACT_DELETE (acursession,child_ROLES_ACT_rec.id,aInstanceid);
      end loop;
      --close child_ROLES_ACT;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_WP',
 aVERB=>'DELETEROW',  aThe_Resource=>aROLES_WPid, aLogInstanceID=>aInstanceID);
declare cursor chld_ROLES_WP is select  instanceid ID from instance where OwnerPartName ='ROLES_WP' and OwnerRowID=aROLES_WPid;
row_ROLES_WP  chld_ROLES_WP%ROWTYPE;
begin
--open chld_ROLES_WP;
for row_ROLES_WP in chld_ROLES_WP loop
 Kernel.INSTANCE_OWNER (acursession,row_ROLES_WP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ROLES_WP.id);
end loop;
--close chld_ROLES_WP;
end ;
  delete from  ROLES_WP 
  where  ROLES_WPID = aROLES_WPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Доступные приложения*/
procedure ROLES_WP_SAVE /*Доступные приложения*/ (
 aCURSESSION CHAR,
 aROLES_WPid CHAR,
aInstanceID CHAR 
,aWP CHAR/* Приложение *//* Приложение */
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
select count(*) into existsCnt from ROLES_WP where ROLES_WPID=aROLES_WPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ROLES_WP where ROLES_WPid=aROLES_WPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ROLES_WP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ROLES_WP');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_WP_ISLOCKED( acursession=>acursession,aROWID=>aROLES_WPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_WP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_WP',
 aVERB=>'EDITROW',  aThe_Resource=>aROLES_WPid,aLogInstanceID=>aInstanceID);
 update  ROLES_WP set ChangeStamp=sysdate
,
  WP=aWP
  where  ROLES_WPID = aROLES_WPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ROLES_WP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ROLES_WP');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_WP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_WP',
 aVERB=>'CREATEROW',  aThe_Resource=>aROLES_WPid,aLogInstanceID=>aInstanceID);
 insert into   ROLES_WP
 (  ROLES_WPID 
,InstanceID
,WP

 ) values ( aROLES_WPID 
,aInstanceID
,aWP

 ); 
 ROLES_WP_SINIT( aCURSESSION,aROLES_WPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ROLES_WP_PARENT /*Доступные приложения*/ (
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
  select  INSTANCEID into aParentID from ROLES_WP where  ROLES_WPid=aRowID;
 end; 


procedure ROLES_WP_ISLOCKED /*Доступные приложения*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ROLES_WP where ROLES_WPid=aRowID;
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
  ROLES_WP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ROLES.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ROLES_WP_LOCK /*Доступные приложения*/ (
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
 ROLES_WP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ROLES_WP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ROLES_WP where ROLES_WPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ROLES_WP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ROLES_WP set LockUserID =auserID ,LockSessionID =null where ROLES_WPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ROLES_WP set LockUserID =null,LockSessionID =aCURSESSION  where ROLES_WPid=aRowID;
     return;
   end if;
 end ;


procedure ROLES_WP_HCL /*Доступные приложения*/ (
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
declare cursor lch_ROLES_ACT is select ROLES_ACT.ROLES_ACTid ID from ROLES_ACT where  ROLES_ACT.ParentStructRowID = aRowid;
row_ROLES_ACT lch_ROLES_ACT%ROWTYPE;
begin  
--open lch_ROLES_ACT;
for row_ROLES_ACT in lch_ROLES_ACT
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ROLES_ACT where ROLES_ACTid=row_ROLES_ACT.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ROLES_ACT;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ROLES_ACT;
     return;
   end if; 
 end if;  
 ROLES_ACT_HCL (acursession,row_ROLES_ACT.id,aisLocked);
 if aisLocked >2 then
   close lch_ROLES_ACT;
   return;
 end if;
end loop;
--close lch_ROLES_ACT;
end;
aIsLocked :=0;
end;


procedure ROLES_WP_UNLOCK /*Доступные приложения*/ (
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
 ROLES_WP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ROLES_WP set LockUserID =null  where ROLES_WPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ROLES_WP set LockSessionID =null  where ROLES_WPid=aRowID;
     return;
   end if;
 end; 


procedure ROLES_WP_SINIT /*Доступные приложения*/ (
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
 select  SecurityStyleID into atmpID from ROLES_WP where ROLES_WPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ROLES_WP');
    return;
  end if;
if aSecurityStyleID is null then
 ROLES_WP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ROLES_WP set securitystyleid =aStyleID where ROLES_WPid = aRowID;
else 
 update ROLES_WP set securitystyleid =aSecurityStyleID where ROLES_WPid = aRowID;
end if; 
end ; 


procedure ROLES_WP_propagate /*Доступные приложения*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ROLES_WP where ROLES_WPid=aRowid;
declare cursor pch_ROLES_ACT  is select ROLES_ACT.ROLES_ACTid ID from ROLES_ACT where  ROLES_ACT.ParentStructRowID = aRowid;
row_ROLES_ACT  pch_ROLES_ACT%ROWTYPE;
begin
--open pch_ROLES_ACT;
for row_ROLES_ACT in pch_ROLES_ACT loop
   ROLES_ACT_SINIT( acursession,row_ROLES_ACT.id,assid);
   ROLES_ACT_propagate( acursession,row_ROLES_ACT.id);
end loop;
--close pch_ROLES_ACT;
end;
end;



procedure ROLES_ACT_BRIEF  (
 aCURSESSION CHAR,
 aROLES_ACTid CHAR,
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
if aROLES_ACTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ROLES_ACT where ROLES_ACTID=aROLES_ACTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ROLES_ACT where ROLES_ACTid=aROLES_ACTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ROLES_ACT');
    return;
  end if;
  aBRIEF:=func.ROLES_ACT_BRIEF_F(aROLES_ACTid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ROLES_ACT_DELETE /*Допустимые действия*/ (
 aCURSESSION CHAR,
 aROLES_ACTid CHAR,
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
select count(*) into existsCnt from ROLES_ACT where ROLES_ACTID=aROLES_ACTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ROLES_ACT where ROLES_ACTid=aROLES_ACTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ROLES_ACT',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ROLES_ACT');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_ACT_ISLOCKED( acursession=>acursession,aROWID=>aROLES_ACTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ROLES_ACT');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_ACT',
 aVERB=>'DELETEROW',  aThe_Resource=>aROLES_ACTid, aLogInstanceID=>aInstanceID);
declare cursor chld_ROLES_ACT is select  instanceid ID from instance where OwnerPartName ='ROLES_ACT' and OwnerRowID=aROLES_ACTid;
row_ROLES_ACT  chld_ROLES_ACT%ROWTYPE;
begin
--open chld_ROLES_ACT;
for row_ROLES_ACT in chld_ROLES_ACT loop
 Kernel.INSTANCE_OWNER (acursession,row_ROLES_ACT.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ROLES_ACT.id);
end loop;
--close chld_ROLES_ACT;
end ;
  delete from  ROLES_ACT 
  where  ROLES_ACTID = aROLES_ACTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Допустимые действия*/
procedure ROLES_ACT_SAVE /*Допустимые действия*/ (
 aCURSESSION CHAR,
 aROLES_ACTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
, aParentRowid CHAR :=null
,aAccesible
 NUMBER := null /* Доступность *//* Доступность */
,aEntryPoints CHAR/* Доступные действия *//* Доступные действия */
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
select count(*) into existsCnt from ROLES_ACT where ROLES_ACTID=aROLES_ACTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ROLES_ACT where ROLES_ACTid=aROLES_ACTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ROLES_ACT',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ROLES_ACT');
      return;
    end if;
  end if;
 --  verify lock  --
 ROLES_ACT_ISLOCKED( acursession=>acursession,aROWID=>aROLES_ACTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_ACT');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_ACT',
 aVERB=>'EDITROW',  aThe_Resource=>aROLES_ACTid,aLogInstanceID=>aInstanceID);
 update  ROLES_ACT set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  Accesible=aAccesible
,
  EntryPoints=aEntryPoints
  where  ROLES_ACTID = aROLES_ACTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from ROLES_WP where ROLES_WPid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ROLES_ACT',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ROLES_ACT');
      return;
    end if;
 end if;
 ROLES_WP_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ROLES_ACT');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ROLES_ACT',
 aVERB=>'CREATEROW',  aThe_Resource=>aROLES_ACTid,aLogInstanceID=>aInstanceID);
 insert into   ROLES_ACT
 (  ROLES_ACTID 
,ParentRowid
,ParentStructRowID
,Accesible

,EntryPoints

 ) values ( aROLES_ACTID 
,aParentRowid
,aParentStructRowID
,aAccesible

,aEntryPoints

 ); 
 ROLES_ACT_SINIT( aCURSESSION,aROLES_ACTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ROLES_ACT_PARENT /*Допустимые действия*/ (
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
  select ParentStructRowID into aParentID  from ROLES_ACT where  ROLES_ACTid=aRowID;
  aParentTable := 'ROLES_WP';
 end; 


procedure ROLES_ACT_ISLOCKED /*Допустимые действия*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ROLES_ACT where ROLES_ACTid=aRowID;
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
  ROLES_ACT_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ROLES.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ROLES_ACT_LOCK /*Допустимые действия*/ (
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
 ROLES_ACT_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ROLES_ACT_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ROLES_ACT where ROLES_ACTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ROLES_ACT');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ROLES_ACT set LockUserID =auserID ,LockSessionID =null where ROLES_ACTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ROLES_ACT set LockUserID =null,LockSessionID =aCURSESSION  where ROLES_ACTid=aRowID;
     return;
   end if;
 end ;


procedure ROLES_ACT_HCL /*Допустимые действия*/ (
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


procedure ROLES_ACT_UNLOCK /*Допустимые действия*/ (
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
 ROLES_ACT_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ROLES_ACT set LockUserID =null  where ROLES_ACTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ROLES_ACT set LockSessionID =null  where ROLES_ACTid=aRowID;
     return;
   end if;
 end; 


procedure ROLES_ACT_SINIT /*Допустимые действия*/ (
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
 select  SecurityStyleID into atmpID from ROLES_ACT where ROLES_ACTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ROLES_ACT');
    return;
  end if;
if aSecurityStyleID is null then
 ROLES_ACT_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ROLES_ACT set securitystyleid =aStyleID where ROLES_ACTid = aRowID;
else 
 update ROLES_ACT set securitystyleid =aSecurityStyleID where ROLES_ACTid = aRowID;
end if; 
end ; 


procedure ROLES_ACT_propagate /*Допустимые действия*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ROLES_ACT where ROLES_ACTid=aRowid;
end;


end ROLES;

/



