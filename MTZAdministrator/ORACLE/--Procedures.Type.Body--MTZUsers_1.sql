
/* --MTZUsers*/

 create or replace package body MTZUsers as

procedure MTZUsers_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZUsers'
then
declare cursor child_Users is select Users.Usersid ID from Users where  Users.InstanceID = ainstanceid;
row_Users  child_Users%ROWTYPE;
begin
--open child_Users;
for row_Users in child_Users loop
 Users_DELETE (acursession,row_Users.id,aInstanceID);
end loop;
--close child_Users;
end;
declare cursor child_Groups is select Groups.Groupsid ID from Groups where  Groups.InstanceID = ainstanceid;
row_Groups  child_Groups%ROWTYPE;
begin
--open child_Groups;
for row_Groups in child_Groups loop
 Groups_DELETE (acursession,row_Groups.id,aInstanceID);
end loop;
--close child_Groups;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZUsers_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZUsers'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_Users is select Users.Usersid ID from Users where  Users.InstanceID = arowid;
ROW_Users  lch_Users%ROWTYPE;
begin
--open lch_Users;
for row_Users in lch_Users loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from Users where Usersid=row_Users.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Users;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_Users;
     return;
   end if; 
 end if; 
 Users_HCL (acursession,ROW_Users.id,aisLocked);
 if aisLocked >2 then
   close lch_Users;
   return;
 end if;
 end loop;
--close lch_Users;
end;
declare cursor lch_Groups is select Groups.Groupsid ID from Groups where  Groups.InstanceID = arowid;
ROW_Groups  lch_Groups%ROWTYPE;
begin
--open lch_Groups;
for row_Groups in lch_Groups loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from Groups where Groupsid=row_Groups.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Groups;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_Groups;
     return;
   end if; 
 end if; 
 Groups_HCL (acursession,ROW_Groups.id,aisLocked);
 if aisLocked >2 then
   close lch_Groups;
   return;
 end if;
 end loop;
--close lch_Groups;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZUsers_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZUsers'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_Users is select Users.Usersid id from Users where  Users.InstanceID = arowid;
row_Users  pch_Users%ROWTYPE;
begin
--open pch_Users;
for row_Users in  pch_Users loop
 Users_SINIT( acursession,row_Users.id,assid);
 Users_propagate( acursession,row_Users.id);
end loop;
--close pch_Users;
end;
declare cursor pch_Groups is select Groups.Groupsid id from Groups where  Groups.InstanceID = arowid;
row_Groups  pch_Groups%ROWTYPE;
begin
--open pch_Groups;
for row_Groups in  pch_Groups loop
 Groups_SINIT( acursession,row_Groups.id,assid);
 Groups_propagate( acursession,row_Groups.id);
end loop;
--close pch_Groups;
end;
 end if; 
end;



procedure Users_BRIEF  (
 aCURSESSION CHAR,
 aUsersid CHAR,
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
if aUsersid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Users where UsersID=aUsersID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Users where Usersid=aUsersID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Users');
    return;
  end if;
  aBRIEF:=func.Users_BRIEF_F(aUsersid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Users_DELETE /*Пользователи*/ (
 aCURSESSION CHAR,
 aUsersid CHAR,
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
select count(*) into existsCnt from Users where UsersID=aUsersID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Users where Usersid=aUsersID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Users',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Users');
      return;
    end if;
  end if;
 --  verify lock  --
 Users_ISLOCKED( acursession=>acursession,aROWID=>aUsersid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Users');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'Users',
 aVERB=>'DELETEROW',  aThe_Resource=>aUsersid, aLogInstanceID=>aInstanceID);
declare cursor chld_Users is select  instanceid ID from instance where OwnerPartName ='Users' and OwnerRowID=aUsersid;
row_Users  chld_Users%ROWTYPE;
begin
--open chld_Users;
for row_Users in chld_Users loop
 Kernel.INSTANCE_OWNER (acursession,row_Users.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Users.id);
end loop;
--close chld_Users;
end ;
  delete from  Users 
  where  UsersID = aUsersID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Пользователи*/
procedure Users_SAVE /*Пользователи*/ (
 aCURSESSION CHAR,
 aUsersid CHAR,
aInstanceID CHAR 
,aFamily
 VARCHAR2 := null /* Фамилия *//* Фамилия */
,aName
 VARCHAR2 := null /* Имя *//* Имя */
,aSurName
 VARCHAR2 := null /* Отчество *//* Отчество */
,aLogin
 VARCHAR2/* Имя для входа *//* Имя для входа */
,aPassword VARCHAR2 := null /* Пароль *//* Пароль */
,aDomaiName
 VARCHAR2 := null /* Доменное имя *//* Доменное имя */
,aEMail VARCHAR2 := null /* e-mail *//* e-mail */
,aPhone
 VARCHAR2 := null /* Телефон *//* Телефон */
,aLocalPhone
 VARCHAR2 := null /* Местный телефон *//* Местный телефон */
,aMobilePhone
 VARCHAR2 := null /* Мобильный телефон *//* Мобильный телефон */
,aPhoto VARCHAR2 := null /* Фото *//* Фото */
,aBirthDay
 DATE := null /* Дата рождения *//* Дата рождения */
,aActivity CHAR := null /* Журнал активности *//* Журнал активности */
,aCertificateID
 VARCHAR2 := null /* CertificateID *//* CertificateID */
,aCertData VARCHAR2 := null /* CertData *//* CertData */
,aClientDef CHAR := null /* Ассоциация с клиентом *//* Ассоциация с клиентом */
,aPersonaData CHAR := null /* PersonaData *//* PersonaData */
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
select count(*) into existsCnt from Users where UsersID=aUsersID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Users where Usersid=aUsersID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Users',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Users');
      return;
    end if;
  end if;
 --  verify lock  --
 Users_ISLOCKED( acursession=>acursession,aROWID=>aUsersid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Users');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Users',
 aVERB=>'EDITROW',  aThe_Resource=>aUsersid,aLogInstanceID=>aInstanceID);
 update  Users set ChangeStamp=sysdate
,
  Family=aFamily
,
  Name=aName
,
  SurName=aSurName
,
  Login=aLogin
,
  Password=aPassword
,
  DomaiName=aDomaiName
,
  EMail=aEMail
,
  Phone=aPhone
,
  LocalPhone=aLocalPhone
,
  MobilePhone=aMobilePhone
,
  Photo=aPhoto
,
  BirthDay=aBirthDay
,
  Activity=aActivity
,
  CertificateID=aCertificateID
,
  CertData=aCertData
,
  ClientDef=aClientDef
,
  PersonaData=aPersonaData
  where  UsersID = aUsersID; 
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from Users where InstanceID=aInstanceID 
 and Login=aLogin;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Users');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Users',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Users');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Users');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Users',
 aVERB=>'CREATEROW',  aThe_Resource=>aUsersid,aLogInstanceID=>aInstanceID);
 insert into   Users
 (  UsersID 
,InstanceID
,Family

,Name

,SurName

,Login

,Password

,DomaiName

,EMail

,Phone

,LocalPhone

,MobilePhone

,Photo

,BirthDay

,Activity

,CertificateID

,CertData

,ClientDef

,PersonaData

 ) values ( aUsersID 
,aInstanceID
,aFamily

,aName

,aSurName

,aLogin

,aPassword

,aDomaiName

,aEMail

,aPhone

,aLocalPhone

,aMobilePhone

,aPhoto

,aBirthDay

,aActivity

,aCertificateID

,aCertData

,aClientDef

,aPersonaData

 ); 
 Users_SINIT( aCURSESSION,aUsersid,atmpid);
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from Users where InstanceID=aInstanceID 
 and Login=aLogin;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Users');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure Users_PARENT /*Пользователи*/ (
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
  select  INSTANCEID into aParentID from Users where  Usersid=aRowID;
 end; 


procedure Users_ISLOCKED /*Пользователи*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Users where Usersid=aRowID;
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
  Users_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZUsers.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Users_LOCK /*Пользователи*/ (
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
 Users_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Users_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Users where Usersid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Users');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Users set LockUserID =auserID ,LockSessionID =null where Usersid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Users set LockUserID =null,LockSessionID =aCURSESSION  where Usersid=aRowID;
     return;
   end if;
 end ;


procedure Users_HCL /*Пользователи*/ (
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


procedure Users_UNLOCK /*Пользователи*/ (
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
 Users_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Users set LockUserID =null  where Usersid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Users set LockSessionID =null  where Usersid=aRowID;
     return;
   end if;
 end; 


procedure Users_SINIT /*Пользователи*/ (
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
 select  SecurityStyleID into atmpID from Users where Usersid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Users');
    return;
  end if;
if aSecurityStyleID is null then
 Users_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Users set securitystyleid =aStyleID where Usersid = aRowID;
else 
 update Users set securitystyleid =aSecurityStyleID where Usersid = aRowID;
end if; 
end ; 


procedure Users_propagate /*Пользователи*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Users where Usersid=aRowid;
end;



procedure Groups_BRIEF  (
 aCURSESSION CHAR,
 aGroupsid CHAR,
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
if aGroupsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Groups where GroupsID=aGroupsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Groups where Groupsid=aGroupsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Groups');
    return;
  end if;
  aBRIEF:=func.Groups_BRIEF_F(aGroupsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Groups_DELETE /*Группы*/ (
 aCURSESSION CHAR,
 aGroupsid CHAR,
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
select count(*) into existsCnt from Groups where GroupsID=aGroupsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Groups where Groupsid=aGroupsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Groups',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Groups');
      return;
    end if;
  end if;
 --  verify lock  --
 Groups_ISLOCKED( acursession=>acursession,aROWID=>aGroupsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Groups');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_GroupUser is select GroupUser.GroupUserid ID from GroupUser where  GroupUser.ParentStructRowID = aGroupsid;
    child_GroupUser_rec  child_GroupUser%ROWTYPE;
    begin
    --open child_GroupUser;
      for child_GroupUser_rec in child_GroupUser loop
      GroupUser_DELETE (acursession,child_GroupUser_rec.id,aInstanceid);
      end loop;
      --close child_GroupUser;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'Groups',
 aVERB=>'DELETEROW',  aThe_Resource=>aGroupsid, aLogInstanceID=>aInstanceID);
declare cursor chld_Groups is select  instanceid ID from instance where OwnerPartName ='Groups' and OwnerRowID=aGroupsid;
row_Groups  chld_Groups%ROWTYPE;
begin
--open chld_Groups;
for row_Groups in chld_Groups loop
 Kernel.INSTANCE_OWNER (acursession,row_Groups.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Groups.id);
end loop;
--close chld_Groups;
end ;
  delete from  Groups 
  where  GroupsID = aGroupsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Группы*/
procedure Groups_SAVE /*Группы*/ (
 aCURSESSION CHAR,
 aGroupsid CHAR,
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
select count(*) into existsCnt from Groups where GroupsID=aGroupsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Groups where Groupsid=aGroupsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Groups',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Groups');
      return;
    end if;
  end if;
 --  verify lock  --
 Groups_ISLOCKED( acursession=>acursession,aROWID=>aGroupsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Groups');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Groups',
 aVERB=>'EDITROW',  aThe_Resource=>aGroupsid,aLogInstanceID=>aInstanceID);
 update  Groups set ChangeStamp=sysdate
,
  Name=aName
  where  GroupsID = aGroupsID; 
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from Groups where InstanceID=aInstanceID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Groups');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Groups',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Groups');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Groups');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Groups',
 aVERB=>'CREATEROW',  aThe_Resource=>aGroupsid,aLogInstanceID=>aInstanceID);
 insert into   Groups
 (  GroupsID 
,InstanceID
,Name

 ) values ( aGroupsID 
,aInstanceID
,aName

 ); 
 Groups_SINIT( aCURSESSION,aGroupsid,atmpid);
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from Groups where InstanceID=aInstanceID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=Groups');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure Groups_PARENT /*Группы*/ (
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
  select  INSTANCEID into aParentID from Groups where  Groupsid=aRowID;
 end; 


procedure Groups_ISLOCKED /*Группы*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Groups where Groupsid=aRowID;
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
  Groups_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZUsers.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Groups_LOCK /*Группы*/ (
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
 Groups_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Groups_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Groups where Groupsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Groups');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Groups set LockUserID =auserID ,LockSessionID =null where Groupsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Groups set LockUserID =null,LockSessionID =aCURSESSION  where Groupsid=aRowID;
     return;
   end if;
 end ;


procedure Groups_HCL /*Группы*/ (
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
declare cursor lch_GroupUser is select GroupUser.GroupUserid ID from GroupUser where  GroupUser.ParentStructRowID = aRowid;
row_GroupUser lch_GroupUser%ROWTYPE;
begin  
--open lch_GroupUser;
for row_GroupUser in lch_GroupUser
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from GroupUser where GroupUserid=row_GroupUser.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_GroupUser;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_GroupUser;
     return;
   end if; 
 end if;  
 GroupUser_HCL (acursession,row_GroupUser.id,aisLocked);
 if aisLocked >2 then
   close lch_GroupUser;
   return;
 end if;
end loop;
--close lch_GroupUser;
end;
aIsLocked :=0;
end;


procedure Groups_UNLOCK /*Группы*/ (
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
 Groups_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Groups set LockUserID =null  where Groupsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Groups set LockSessionID =null  where Groupsid=aRowID;
     return;
   end if;
 end; 


procedure Groups_SINIT /*Группы*/ (
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
 select  SecurityStyleID into atmpID from Groups where Groupsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Groups');
    return;
  end if;
if aSecurityStyleID is null then
 Groups_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Groups set securitystyleid =aStyleID where Groupsid = aRowID;
else 
 update Groups set securitystyleid =aSecurityStyleID where Groupsid = aRowID;
end if; 
end ; 


procedure Groups_propagate /*Группы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Groups where Groupsid=aRowid;
declare cursor pch_GroupUser  is select GroupUser.GroupUserid ID from GroupUser where  GroupUser.ParentStructRowID = aRowid;
row_GroupUser  pch_GroupUser%ROWTYPE;
begin
--open pch_GroupUser;
for row_GroupUser in pch_GroupUser loop
   GroupUser_SINIT( acursession,row_GroupUser.id,assid);
   GroupUser_propagate( acursession,row_GroupUser.id);
end loop;
--close pch_GroupUser;
end;
end;



procedure GroupUser_BRIEF  (
 aCURSESSION CHAR,
 aGroupUserid CHAR,
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
if aGroupUserid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from GroupUser where GroupUserID=aGroupUserID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from GroupUser where GroupUserid=aGroupUserID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=GroupUser');
    return;
  end if;
  aBRIEF:=func.GroupUser_BRIEF_F(aGroupUserid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure GroupUser_DELETE /*Состав группы*/ (
 aCURSESSION CHAR,
 aGroupUserid CHAR,
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
select count(*) into existsCnt from GroupUser where GroupUserID=aGroupUserID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from GroupUser where GroupUserid=aGroupUserID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:GroupUser',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=GroupUser');
      return;
    end if;
  end if;
 --  verify lock  --
 GroupUser_ISLOCKED( acursession=>acursession,aROWID=>aGroupUserid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=GroupUser');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'GroupUser',
 aVERB=>'DELETEROW',  aThe_Resource=>aGroupUserid, aLogInstanceID=>aInstanceID);
declare cursor chld_GroupUser is select  instanceid ID from instance where OwnerPartName ='GroupUser' and OwnerRowID=aGroupUserid;
row_GroupUser  chld_GroupUser%ROWTYPE;
begin
--open chld_GroupUser;
for row_GroupUser in chld_GroupUser loop
 Kernel.INSTANCE_OWNER (acursession,row_GroupUser.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_GroupUser.id);
end loop;
--close chld_GroupUser;
end ;
  delete from  GroupUser 
  where  GroupUserID = aGroupUserID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Состав группы*/
procedure GroupUser_SAVE /*Состав группы*/ (
 aCURSESSION CHAR,
 aGroupUserid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
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
select count(*) into existsCnt from GroupUser where GroupUserID=aGroupUserID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from GroupUser where GroupUserid=aGroupUserID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:GroupUser',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=GroupUser');
      return;
    end if;
  end if;
 --  verify lock  --
 GroupUser_ISLOCKED( acursession=>acursession,aROWID=>aGroupUserid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=GroupUser');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GroupUser',
 aVERB=>'EDITROW',  aThe_Resource=>aGroupUserid,aLogInstanceID=>aInstanceID);
 update  GroupUser set ChangeStamp=sysdate
,
  TheUser=aTheUser
  where  GroupUserID = aGroupUserID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from GroupUser where ParentStructRowID=aParentStructRowID 
 and TheUser=aTheUser;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=GroupUser');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from Groups where Groupsid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:GroupUser',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=GroupUser');
      return;
    end if;
 end if;
 Groups_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=GroupUser');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'GroupUser',
 aVERB=>'CREATEROW',  aThe_Resource=>aGroupUserid,aLogInstanceID=>aInstanceID);
 insert into   GroupUser
 (  GroupUserID 
,ParentStructRowID
,TheUser

 ) values ( aGroupUserID 
,aParentStructRowID
,aTheUser

 ); 
 GroupUser_SINIT( aCURSESSION,aGroupUserid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from GroupUser where ParentStructRowID=aParentStructRowID 
 and TheUser=aTheUser;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=GroupUser');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure GroupUser_PARENT /*Состав группы*/ (
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
  select ParentStructRowID into aParentID  from GroupUser where  GroupUserid=aRowID;
  aParentTable := 'Groups';
 end; 


procedure GroupUser_ISLOCKED /*Состав группы*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from GroupUser where GroupUserid=aRowID;
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
  GroupUser_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZUsers.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure GroupUser_LOCK /*Состав группы*/ (
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
 GroupUser_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  GroupUser_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from GroupUser where GroupUserid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=GroupUser');
    return;
  end if;
   if  aLockMode =2  
   then   
    update GroupUser set LockUserID =auserID ,LockSessionID =null where GroupUserid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update GroupUser set LockUserID =null,LockSessionID =aCURSESSION  where GroupUserid=aRowID;
     return;
   end if;
 end ;


procedure GroupUser_HCL /*Состав группы*/ (
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


procedure GroupUser_UNLOCK /*Состав группы*/ (
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
 GroupUser_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update GroupUser set LockUserID =null  where GroupUserid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update GroupUser set LockSessionID =null  where GroupUserid=aRowID;
     return;
   end if;
 end; 


procedure GroupUser_SINIT /*Состав группы*/ (
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
 select  SecurityStyleID into atmpID from GroupUser where GroupUserid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =GroupUser');
    return;
  end if;
if aSecurityStyleID is null then
 GroupUser_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update GroupUser set securitystyleid =aStyleID where GroupUserid = aRowID;
else 
 update GroupUser set securitystyleid =aSecurityStyleID where GroupUserid = aRowID;
end if; 
end ; 


procedure GroupUser_propagate /*Состав группы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from GroupUser where GroupUserid=aRowid;
end;


end MTZUsers;

/



