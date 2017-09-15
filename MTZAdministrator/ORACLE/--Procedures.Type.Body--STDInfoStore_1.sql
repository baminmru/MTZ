
/* --STDInfoStore*/

 create or replace package body STDInfoStore as

procedure STDInfoStore_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='STDInfoStore'
then
declare cursor child_InfoStoreDef is select InfoStoreDef.InfoStoreDefid ID from InfoStoreDef where  InfoStoreDef.InstanceID = ainstanceid;
row_InfoStoreDef  child_InfoStoreDef%ROWTYPE;
begin
--open child_InfoStoreDef;
for row_InfoStoreDef in child_InfoStoreDef loop
 InfoStoreDef_DELETE (acursession,row_InfoStoreDef.id,aInstanceID);
end loop;
--close child_InfoStoreDef;
end;
declare cursor child_Folder is select Folder.Folderid ID from Folder where  Folder.InstanceID = ainstanceid;
row_Folder  child_Folder%ROWTYPE;
begin
--open child_Folder;
for row_Folder in child_Folder loop
 Folder_DELETE (acursession,row_Folder.id,aInstanceID);
end loop;
--close child_Folder;
end;
return;
<<del_error>>
return;
end if;
end;
procedure STDInfoStore_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'STDInfoStore'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_InfoStoreDef is select InfoStoreDef.InfoStoreDefid ID from InfoStoreDef where  InfoStoreDef.InstanceID = arowid;
ROW_InfoStoreDef  lch_InfoStoreDef%ROWTYPE;
begin
--open lch_InfoStoreDef;
for row_InfoStoreDef in lch_InfoStoreDef loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from InfoStoreDef where InfoStoreDefid=row_InfoStoreDef.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_InfoStoreDef;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_InfoStoreDef;
     return;
   end if; 
 end if; 
 InfoStoreDef_HCL (acursession,ROW_InfoStoreDef.id,aisLocked);
 if aisLocked >2 then
   close lch_InfoStoreDef;
   return;
 end if;
 end loop;
--close lch_InfoStoreDef;
end;
declare cursor lch_Folder is select Folder.Folderid ID from Folder where  Folder.InstanceID = arowid;
ROW_Folder  lch_Folder%ROWTYPE;
begin
--open lch_Folder;
for row_Folder in lch_Folder loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from Folder where Folderid=row_Folder.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Folder;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_Folder;
     return;
   end if; 
 end if; 
 Folder_HCL (acursession,ROW_Folder.id,aisLocked);
 if aisLocked >2 then
   close lch_Folder;
   return;
 end if;
 end loop;
--close lch_Folder;
end;
 end if;
aIsLocked:=0;
end;
procedure STDInfoStore_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'STDInfoStore'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_InfoStoreDef is select InfoStoreDef.InfoStoreDefid id from InfoStoreDef where  InfoStoreDef.InstanceID = arowid;
row_InfoStoreDef  pch_InfoStoreDef%ROWTYPE;
begin
--open pch_InfoStoreDef;
for row_InfoStoreDef in  pch_InfoStoreDef loop
 InfoStoreDef_SINIT( acursession,row_InfoStoreDef.id,assid);
 InfoStoreDef_propagate( acursession,row_InfoStoreDef.id);
end loop;
--close pch_InfoStoreDef;
end;
declare cursor pch_Folder is select Folder.Folderid id from Folder where  Folder.InstanceID = arowid;
row_Folder  pch_Folder%ROWTYPE;
begin
--open pch_Folder;
for row_Folder in  pch_Folder loop
 Folder_SINIT( acursession,row_Folder.id,assid);
 Folder_propagate( acursession,row_Folder.id);
end loop;
--close pch_Folder;
end;
 end if; 
end;



procedure InfoStoreDef_BRIEF  (
 aCURSESSION CHAR,
 aInfoStoreDefid CHAR,
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
if aInfoStoreDefid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from InfoStoreDef where InfoStoreDefID=aInfoStoreDefID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from InfoStoreDef where InfoStoreDefid=aInfoStoreDefID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=InfoStoreDef');
    return;
  end if;
  aBRIEF:=func.InfoStoreDef_BRIEF_F(aInfoStoreDefid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure InfoStoreDef_DELETE /*Описание каталога*/ (
 aCURSESSION CHAR,
 aInfoStoreDefid CHAR,
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
select count(*) into existsCnt from InfoStoreDef where InfoStoreDefID=aInfoStoreDefID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from InfoStoreDef where InfoStoreDefid=aInfoStoreDefID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:InfoStoreDef',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=InfoStoreDef');
      return;
    end if;
  end if;
 --  verify lock  --
 InfoStoreDef_ISLOCKED( acursession=>acursession,aROWID=>aInfoStoreDefid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=InfoStoreDef');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'InfoStoreDef',
 aVERB=>'DELETEROW',  aThe_Resource=>aInfoStoreDefid, aLogInstanceID=>aInstanceID);
declare cursor chld_InfoStoreDef is select  instanceid ID from instance where OwnerPartName ='InfoStoreDef' and OwnerRowID=aInfoStoreDefid;
row_InfoStoreDef  chld_InfoStoreDef%ROWTYPE;
begin
--open chld_InfoStoreDef;
for row_InfoStoreDef in chld_InfoStoreDef loop
 Kernel.INSTANCE_OWNER (acursession,row_InfoStoreDef.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_InfoStoreDef.id);
end loop;
--close chld_InfoStoreDef;
end ;
  delete from  InfoStoreDef 
  where  InfoStoreDefID = aInfoStoreDefID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание*/
procedure InfoStoreDef_SAVE /*Описание каталога*/ (
 aCURSESSION CHAR,
 aInfoStoreDefid CHAR,
aInstanceID CHAR 
,aTheGroup CHAR := null /* Группа *//* Группа */
,aName
 VARCHAR2/* Название *//* Название */
,aInfoStoreType
 NUMBER/* Тип каталога *//* Тип каталога */
,aTheUser CHAR := null /* Пользователь *//* Пользователь */
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
select count(*) into existsCnt from InfoStoreDef where InfoStoreDefID=aInfoStoreDefID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from InfoStoreDef where InfoStoreDefid=aInfoStoreDefID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:InfoStoreDef',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=InfoStoreDef');
      return;
    end if;
  end if;
 --  verify lock  --
 InfoStoreDef_ISLOCKED( acursession=>acursession,aROWID=>aInfoStoreDefid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=InfoStoreDef');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'InfoStoreDef',
 aVERB=>'EDITROW',  aThe_Resource=>aInfoStoreDefid,aLogInstanceID=>aInstanceID);
 update  InfoStoreDef set ChangeStamp=sysdate
,
  TheGroup=aTheGroup
,
  Name=aName
,
  InfoStoreType=aInfoStoreType
,
  TheUser=aTheUser
  where  InfoStoreDefID = aInfoStoreDefID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:InfoStoreDef',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=InfoStoreDef');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=InfoStoreDef');
    return;
  end if;
select Count(*) into existsCnt from InfoStoreDef where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <InfoStoreDef>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'InfoStoreDef',
 aVERB=>'CREATEROW',  aThe_Resource=>aInfoStoreDefid,aLogInstanceID=>aInstanceID);
 insert into   InfoStoreDef
 (  InfoStoreDefID 
,InstanceID
,TheGroup

,Name

,InfoStoreType

,TheUser

 ) values ( aInfoStoreDefID 
,aInstanceID
,aTheGroup

,aName

,aInfoStoreType

,aTheUser

 ); 
 InfoStoreDef_SINIT( aCURSESSION,aInfoStoreDefid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure InfoStoreDef_PARENT /*Описание каталога*/ (
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
  select  INSTANCEID into aParentID from InfoStoreDef where  InfoStoreDefid=aRowID;
 end; 


procedure InfoStoreDef_ISLOCKED /*Описание каталога*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from InfoStoreDef where InfoStoreDefid=aRowID;
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
  InfoStoreDef_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDInfoStore.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure InfoStoreDef_LOCK /*Описание каталога*/ (
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
 InfoStoreDef_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  InfoStoreDef_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from InfoStoreDef where InfoStoreDefid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=InfoStoreDef');
    return;
  end if;
   if  aLockMode =2  
   then   
    update InfoStoreDef set LockUserID =auserID ,LockSessionID =null where InfoStoreDefid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update InfoStoreDef set LockUserID =null,LockSessionID =aCURSESSION  where InfoStoreDefid=aRowID;
     return;
   end if;
 end ;


procedure InfoStoreDef_HCL /*Описание каталога*/ (
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


procedure InfoStoreDef_UNLOCK /*Описание каталога*/ (
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
 InfoStoreDef_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update InfoStoreDef set LockUserID =null  where InfoStoreDefid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update InfoStoreDef set LockSessionID =null  where InfoStoreDefid=aRowID;
     return;
   end if;
 end; 


procedure InfoStoreDef_SINIT /*Описание каталога*/ (
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
 select  SecurityStyleID into atmpID from InfoStoreDef where InfoStoreDefid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =InfoStoreDef');
    return;
  end if;
if aSecurityStyleID is null then
 InfoStoreDef_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update InfoStoreDef set securitystyleid =aStyleID where InfoStoreDefid = aRowID;
else 
 update InfoStoreDef set securitystyleid =aSecurityStyleID where InfoStoreDefid = aRowID;
end if; 
end ; 


procedure InfoStoreDef_propagate /*Описание каталога*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from InfoStoreDef where InfoStoreDefid=aRowid;
end;



procedure Folder_BRIEF  (
 aCURSESSION CHAR,
 aFolderid CHAR,
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
if aFolderid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Folder where FolderID=aFolderID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Folder where Folderid=aFolderID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Folder');
    return;
  end if;
  aBRIEF:=func.Folder_BRIEF_F(aFolderid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Folder_DELETE /*Папка каталога*/ (
 aCURSESSION CHAR,
 aFolderid CHAR,
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
select count(*) into existsCnt from Folder where FolderID=aFolderID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Folder where Folderid=aFolderID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Folder',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Folder');
      return;
    end if;
  end if;
 --  verify lock  --
 Folder_ISLOCKED( acursession=>acursession,aROWID=>aFolderid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Folder');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_Shortcut is select Shortcut.Shortcutid ID from Shortcut where  Shortcut.ParentStructRowID = aFolderid;
    child_Shortcut_rec  child_Shortcut%ROWTYPE;
    begin
    --open child_Shortcut;
      for child_Shortcut_rec in child_Shortcut loop
      Shortcut_DELETE (acursession,child_Shortcut_rec.id,aInstanceid);
      end loop;
      --close child_Shortcut;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'Folder',
 aVERB=>'DELETEROW',  aThe_Resource=>aFolderid, aLogInstanceID=>aInstanceID);
declare cursor chld_Folder is select  instanceid ID from instance where OwnerPartName ='Folder' and OwnerRowID=aFolderid;
row_Folder  chld_Folder%ROWTYPE;
begin
--open chld_Folder;
for row_Folder in chld_Folder loop
 Kernel.INSTANCE_OWNER (acursession,row_Folder.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Folder.id);
end loop;
--close chld_Folder;
end ;
  delete from  Folder 
  where  FolderID = aFolderID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Папка*/
procedure Folder_SAVE /*Папка каталога*/ (
 aCURSESSION CHAR,
 aFolderid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aName
 VARCHAR2/* Название *//* Название */
,aFolderType
 NUMBER/* Тип папки *//* Тип папки */
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
select count(*) into existsCnt from Folder where FolderID=aFolderID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Folder where Folderid=aFolderID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Folder',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Folder');
      return;
    end if;
  end if;
 --  verify lock  --
 Folder_ISLOCKED( acursession=>acursession,aROWID=>aFolderid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Folder');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Folder',
 aVERB=>'EDITROW',  aThe_Resource=>aFolderid,aLogInstanceID=>aInstanceID);
 update  Folder set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  Name=aName
,
  FolderType=aFolderType
  where  FolderID = aFolderID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Folder',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Folder');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Folder');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Folder',
 aVERB=>'CREATEROW',  aThe_Resource=>aFolderid,aLogInstanceID=>aInstanceID);
 insert into   Folder
 (  FolderID 
,ParentRowid
,InstanceID
,Name

,FolderType

 ) values ( aFolderID 
,aParentRowid
,aInstanceID
,aName

,aFolderType

 ); 
 Folder_SINIT( aCURSESSION,aFolderid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure Folder_PARENT /*Папка каталога*/ (
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
  select  INSTANCEID into aParentID from Folder where  Folderid=aRowID;
 end; 


procedure Folder_ISLOCKED /*Папка каталога*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Folder where Folderid=aRowID;
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
  Folder_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDInfoStore.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Folder_LOCK /*Папка каталога*/ (
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
 Folder_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Folder_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Folder where Folderid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Folder');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Folder set LockUserID =auserID ,LockSessionID =null where Folderid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Folder set LockUserID =null,LockSessionID =aCURSESSION  where Folderid=aRowID;
     return;
   end if;
 end ;


procedure Folder_HCL /*Папка каталога*/ (
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
declare cursor lch_Shortcut is select Shortcut.Shortcutid ID from Shortcut where  Shortcut.ParentStructRowID = aRowid;
row_Shortcut lch_Shortcut%ROWTYPE;
begin  
--open lch_Shortcut;
for row_Shortcut in lch_Shortcut
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from Shortcut where Shortcutid=row_Shortcut.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Shortcut;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_Shortcut;
     return;
   end if; 
 end if;  
 Shortcut_HCL (acursession,row_Shortcut.id,aisLocked);
 if aisLocked >2 then
   close lch_Shortcut;
   return;
 end if;
end loop;
--close lch_Shortcut;
end;
aIsLocked :=0;
end;


procedure Folder_UNLOCK /*Папка каталога*/ (
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
 Folder_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Folder set LockUserID =null  where Folderid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Folder set LockSessionID =null  where Folderid=aRowID;
     return;
   end if;
 end; 


procedure Folder_SINIT /*Папка каталога*/ (
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
 select  SecurityStyleID into atmpID from Folder where Folderid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Folder');
    return;
  end if;
if aSecurityStyleID is null then
 Folder_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Folder set securitystyleid =aStyleID where Folderid = aRowID;
else 
 update Folder set securitystyleid =aSecurityStyleID where Folderid = aRowID;
end if; 
end ; 


procedure Folder_propagate /*Папка каталога*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Folder where Folderid=aRowid;
declare cursor pch_Shortcut  is select Shortcut.Shortcutid ID from Shortcut where  Shortcut.ParentStructRowID = aRowid;
row_Shortcut  pch_Shortcut%ROWTYPE;
begin
--open pch_Shortcut;
for row_Shortcut in pch_Shortcut loop
   Shortcut_SINIT( acursession,row_Shortcut.id,assid);
   Shortcut_propagate( acursession,row_Shortcut.id);
end loop;
--close pch_Shortcut;
end;
end;



procedure Shortcut_BRIEF  (
 aCURSESSION CHAR,
 aShortcutid CHAR,
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
if aShortcutid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Shortcut where ShortcutID=aShortcutID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Shortcut where Shortcutid=aShortcutID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Shortcut');
    return;
  end if;
  aBRIEF:=func.Shortcut_BRIEF_F(aShortcutid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Shortcut_DELETE /*Ярлыки документов*/ (
 aCURSESSION CHAR,
 aShortcutid CHAR,
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
select count(*) into existsCnt from Shortcut where ShortcutID=aShortcutID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Shortcut where Shortcutid=aShortcutID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Shortcut',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Shortcut');
      return;
    end if;
  end if;
 --  verify lock  --
 Shortcut_ISLOCKED( acursession=>acursession,aROWID=>aShortcutid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Shortcut');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'Shortcut',
 aVERB=>'DELETEROW',  aThe_Resource=>aShortcutid, aLogInstanceID=>aInstanceID);
declare cursor chld_Shortcut is select  instanceid ID from instance where OwnerPartName ='Shortcut' and OwnerRowID=aShortcutid;
row_Shortcut  chld_Shortcut%ROWTYPE;
begin
--open chld_Shortcut;
for row_Shortcut in chld_Shortcut loop
 Kernel.INSTANCE_OWNER (acursession,row_Shortcut.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Shortcut.id);
end loop;
--close chld_Shortcut;
end ;
  delete from  Shortcut 
  where  ShortcutID = aShortcutID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Документы*/
procedure Shortcut_SAVE /*Ярлыки документов*/ (
 aCURSESSION CHAR,
 aShortcutid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aDocItem CHAR/* Документ *//* Документ */
,aStartMode
 VARCHAR2 := null /* Режим *//* Режим */
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
select count(*) into existsCnt from Shortcut where ShortcutID=aShortcutID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Shortcut where Shortcutid=aShortcutID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Shortcut',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Shortcut');
      return;
    end if;
  end if;
 --  verify lock  --
 Shortcut_ISLOCKED( acursession=>acursession,aROWID=>aShortcutid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Shortcut');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Shortcut',
 aVERB=>'EDITROW',  aThe_Resource=>aShortcutid,aLogInstanceID=>aInstanceID);
 update  Shortcut set ChangeStamp=sysdate
,
  DocItem=aDocItem
,
  StartMode=aStartMode
  where  ShortcutID = aShortcutID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from Folder where Folderid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Shortcut',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Shortcut');
      return;
    end if;
 end if;
 Folder_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Shortcut');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'Shortcut',
 aVERB=>'CREATEROW',  aThe_Resource=>aShortcutid,aLogInstanceID=>aInstanceID);
 insert into   Shortcut
 (  ShortcutID 
,ParentStructRowID
,DocItem

,StartMode

 ) values ( aShortcutID 
,aParentStructRowID
,aDocItem

,aStartMode

 ); 
 Shortcut_SINIT( aCURSESSION,aShortcutid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure Shortcut_PARENT /*Ярлыки документов*/ (
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
  select ParentStructRowID into aParentID  from Shortcut where  Shortcutid=aRowID;
  aParentTable := 'Folder';
 end; 


procedure Shortcut_ISLOCKED /*Ярлыки документов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Shortcut where Shortcutid=aRowID;
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
  Shortcut_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDInfoStore.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Shortcut_LOCK /*Ярлыки документов*/ (
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
 Shortcut_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Shortcut_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Shortcut where Shortcutid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Shortcut');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Shortcut set LockUserID =auserID ,LockSessionID =null where Shortcutid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Shortcut set LockUserID =null,LockSessionID =aCURSESSION  where Shortcutid=aRowID;
     return;
   end if;
 end ;


procedure Shortcut_HCL /*Ярлыки документов*/ (
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


procedure Shortcut_UNLOCK /*Ярлыки документов*/ (
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
 Shortcut_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Shortcut set LockUserID =null  where Shortcutid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Shortcut set LockSessionID =null  where Shortcutid=aRowID;
     return;
   end if;
 end; 


procedure Shortcut_SINIT /*Ярлыки документов*/ (
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
 select  SecurityStyleID into atmpID from Shortcut where Shortcutid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Shortcut');
    return;
  end if;
if aSecurityStyleID is null then
 Shortcut_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Shortcut set securitystyleid =aStyleID where Shortcutid = aRowID;
else 
 update Shortcut set securitystyleid =aSecurityStyleID where Shortcutid = aRowID;
end if; 
end ; 


procedure Shortcut_propagate /*Ярлыки документов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Shortcut where Shortcutid=aRowid;
end;


end STDInfoStore;

/



