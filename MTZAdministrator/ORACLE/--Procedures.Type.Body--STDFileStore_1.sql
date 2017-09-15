
/* --STDFileStore*/

 create or replace package body STDFileStore as

procedure STDFileStore_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='STDFileStore'
then
declare cursor child_FileDef is select FileDef.FileDefid ID from FileDef where  FileDef.InstanceID = ainstanceid;
row_FileDef  child_FileDef%ROWTYPE;
begin
--open child_FileDef;
for row_FileDef in child_FileDef loop
 FileDef_DELETE (acursession,row_FileDef.id,aInstanceID);
end loop;
--close child_FileDef;
end;
declare cursor child_FileVersion is select FileVersion.FileVersionid ID from FileVersion where  FileVersion.InstanceID = ainstanceid;
row_FileVersion  child_FileVersion%ROWTYPE;
begin
--open child_FileVersion;
for row_FileVersion in child_FileVersion loop
 FileVersion_DELETE (acursession,row_FileVersion.id,aInstanceID);
end loop;
--close child_FileVersion;
end;
return;
<<del_error>>
return;
end if;
end;
procedure STDFileStore_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'STDFileStore'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_FileDef is select FileDef.FileDefid ID from FileDef where  FileDef.InstanceID = arowid;
ROW_FileDef  lch_FileDef%ROWTYPE;
begin
--open lch_FileDef;
for row_FileDef in lch_FileDef loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from FileDef where FileDefid=row_FileDef.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FileDef;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_FileDef;
     return;
   end if; 
 end if; 
 FileDef_HCL (acursession,ROW_FileDef.id,aisLocked);
 if aisLocked >2 then
   close lch_FileDef;
   return;
 end if;
 end loop;
--close lch_FileDef;
end;
declare cursor lch_FileVersion is select FileVersion.FileVersionid ID from FileVersion where  FileVersion.InstanceID = arowid;
ROW_FileVersion  lch_FileVersion%ROWTYPE;
begin
--open lch_FileVersion;
for row_FileVersion in lch_FileVersion loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from FileVersion where FileVersionid=row_FileVersion.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FileVersion;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_FileVersion;
     return;
   end if; 
 end if; 
 FileVersion_HCL (acursession,ROW_FileVersion.id,aisLocked);
 if aisLocked >2 then
   close lch_FileVersion;
   return;
 end if;
 end loop;
--close lch_FileVersion;
end;
 end if;
aIsLocked:=0;
end;
procedure STDFileStore_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'STDFileStore'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_FileDef is select FileDef.FileDefid id from FileDef where  FileDef.InstanceID = arowid;
row_FileDef  pch_FileDef%ROWTYPE;
begin
--open pch_FileDef;
for row_FileDef in  pch_FileDef loop
 FileDef_SINIT( acursession,row_FileDef.id,assid);
 FileDef_propagate( acursession,row_FileDef.id);
end loop;
--close pch_FileDef;
end;
declare cursor pch_FileVersion is select FileVersion.FileVersionid id from FileVersion where  FileVersion.InstanceID = arowid;
row_FileVersion  pch_FileVersion%ROWTYPE;
begin
--open pch_FileVersion;
for row_FileVersion in  pch_FileVersion loop
 FileVersion_SINIT( acursession,row_FileVersion.id,assid);
 FileVersion_propagate( acursession,row_FileVersion.id);
end loop;
--close pch_FileVersion;
end;
 end if; 
end;



procedure FileDef_BRIEF  (
 aCURSESSION CHAR,
 aFileDefid CHAR,
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
if aFileDefid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FileDef where FileDefID=aFileDefID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FileDef where FileDefid=aFileDefID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FileDef');
    return;
  end if;
  aBRIEF:=func.FileDef_BRIEF_F(aFileDefid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FileDef_DELETE /*Файл*/ (
 aCURSESSION CHAR,
 aFileDefid CHAR,
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
select count(*) into existsCnt from FileDef where FileDefID=aFileDefID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FileDef where FileDefid=aFileDefID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FileDef',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=FileDef');
      return;
    end if;
  end if;
 --  verify lock  --
 FileDef_ISLOCKED( acursession=>acursession,aROWID=>aFileDefid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=FileDef');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FileDef',
 aVERB=>'DELETEROW',  aThe_Resource=>aFileDefid, aLogInstanceID=>aInstanceID);
declare cursor chld_FileDef is select  instanceid ID from instance where OwnerPartName ='FileDef' and OwnerRowID=aFileDefid;
row_FileDef  chld_FileDef%ROWTYPE;
begin
--open chld_FileDef;
for row_FileDef in chld_FileDef loop
 Kernel.INSTANCE_OWNER (acursession,row_FileDef.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FileDef.id);
end loop;
--close chld_FileDef;
end ;
  delete from  FileDef 
  where  FileDefID = aFileDefID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Файл*/
procedure FileDef_SAVE /*Файл*/ (
 aCURSESSION CHAR,
 aFileDefid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,athe_Comment VARCHAR2 := null /* Пояснение *//* Пояснение */
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
select count(*) into existsCnt from FileDef where FileDefID=aFileDefID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FileDef where FileDefid=aFileDefID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FileDef',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=FileDef');
      return;
    end if;
  end if;
 --  verify lock  --
 FileDef_ISLOCKED( acursession=>acursession,aROWID=>aFileDefid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=FileDef');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FileDef',
 aVERB=>'EDITROW',  aThe_Resource=>aFileDefid,aLogInstanceID=>aInstanceID);
 update  FileDef set ChangeStamp=sysdate
,
  Name=aName
,
  the_Comment=athe_Comment
  where  FileDefID = aFileDefID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FileDef',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=FileDef');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=FileDef');
    return;
  end if;
select Count(*) into existsCnt from FileDef where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <FileDef>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FileDef',
 aVERB=>'CREATEROW',  aThe_Resource=>aFileDefid,aLogInstanceID=>aInstanceID);
 insert into   FileDef
 (  FileDefID 
,InstanceID
,Name

,the_Comment

 ) values ( aFileDefID 
,aInstanceID
,aName

,athe_Comment

 ); 
 FileDef_SINIT( aCURSESSION,aFileDefid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure FileDef_PARENT /*Файл*/ (
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
  select  INSTANCEID into aParentID from FileDef where  FileDefid=aRowID;
 end; 


procedure FileDef_ISLOCKED /*Файл*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FileDef where FileDefid=aRowID;
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
  FileDef_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDFileStore.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FileDef_LOCK /*Файл*/ (
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
 FileDef_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  FileDef_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FileDef where FileDefid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=FileDef');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FileDef set LockUserID =auserID ,LockSessionID =null where FileDefid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FileDef set LockUserID =null,LockSessionID =aCURSESSION  where FileDefid=aRowID;
     return;
   end if;
 end ;


procedure FileDef_HCL /*Файл*/ (
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


procedure FileDef_UNLOCK /*Файл*/ (
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
 FileDef_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FileDef set LockUserID =null  where FileDefid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FileDef set LockSessionID =null  where FileDefid=aRowID;
     return;
   end if;
 end; 


procedure FileDef_SINIT /*Файл*/ (
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
 select  SecurityStyleID into atmpID from FileDef where FileDefid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =FileDef');
    return;
  end if;
if aSecurityStyleID is null then
 FileDef_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FileDef set securitystyleid =aStyleID where FileDefid = aRowID;
else 
 update FileDef set securitystyleid =aSecurityStyleID where FileDefid = aRowID;
end if; 
end ; 


procedure FileDef_propagate /*Файл*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FileDef where FileDefid=aRowid;
end;



procedure FileVersion_BRIEF  (
 aCURSESSION CHAR,
 aFileVersionid CHAR,
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
if aFileVersionid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FileVersion where FileVersionID=aFileVersionID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FileVersion where FileVersionid=aFileVersionID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FileVersion');
    return;
  end if;
  aBRIEF:=func.FileVersion_BRIEF_F(aFileVersionid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FileVersion_DELETE /*Версии файла*/ (
 aCURSESSION CHAR,
 aFileVersionid CHAR,
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
select count(*) into existsCnt from FileVersion where FileVersionID=aFileVersionID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FileVersion where FileVersionid=aFileVersionID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FileVersion',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=FileVersion');
      return;
    end if;
  end if;
 --  verify lock  --
 FileVersion_ISLOCKED( acursession=>acursession,aROWID=>aFileVersionid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=FileVersion');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FileVersion',
 aVERB=>'DELETEROW',  aThe_Resource=>aFileVersionid, aLogInstanceID=>aInstanceID);
declare cursor chld_FileVersion is select  instanceid ID from instance where OwnerPartName ='FileVersion' and OwnerRowID=aFileVersionid;
row_FileVersion  chld_FileVersion%ROWTYPE;
begin
--open chld_FileVersion;
for row_FileVersion in chld_FileVersion loop
 Kernel.INSTANCE_OWNER (acursession,row_FileVersion.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FileVersion.id);
end loop;
--close chld_FileVersion;
end ;
  delete from  FileVersion 
  where  FileVersionID = aFileVersionID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Версии*/
procedure FileVersion_SAVE /*Версии файла*/ (
 aCURSESSION CHAR,
 aFileVersionid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aVersion
 VARCHAR2 := null /* Номер версии *//* Номер версии */
,aExt
 VARCHAR2/* Расширение *//* Расширение */
,aCurrentVersion
 NUMBER/* Текущая версия *//* Текущая версия */
,athe_Comment VARCHAR2 := null /* Пояснение *//* Пояснение */
,aFileData VARCHAR2/* Данные */
,aFileData_EXT varchar2 /* Данные */
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
select count(*) into existsCnt from FileVersion where FileVersionID=aFileVersionID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FileVersion where FileVersionid=aFileVersionID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FileVersion',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=FileVersion');
      return;
    end if;
  end if;
 --  verify lock  --
 FileVersion_ISLOCKED( acursession=>acursession,aROWID=>aFileVersionid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=FileVersion');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FileVersion',
 aVERB=>'EDITROW',  aThe_Resource=>aFileVersionid,aLogInstanceID=>aInstanceID);
 update  FileVersion set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  Version=aVersion
,
  Ext=aExt
,
  CurrentVersion=aCurrentVersion
,
  the_Comment=athe_Comment
,
  FileData=aFileData
,FileData_EXT=
aFileData_EXT 
  where  FileVersionID = aFileVersionID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FileVersion',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=FileVersion');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=FileVersion');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FileVersion',
 aVERB=>'CREATEROW',  aThe_Resource=>aFileVersionid,aLogInstanceID=>aInstanceID);
 insert into   FileVersion
 (  FileVersionID 
,ParentRowid
,InstanceID
,Version

,Ext

,CurrentVersion

,the_Comment

,FileData

,FileData_EXT
 ) values ( aFileVersionID 
,aParentRowid
,aInstanceID
,aVersion

,aExt

,aCurrentVersion

,athe_Comment

,aFileData

,aFileData_EXT
 ); 
 FileVersion_SINIT( aCURSESSION,aFileVersionid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure FileVersion_PARENT /*Версии файла*/ (
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
  select  INSTANCEID into aParentID from FileVersion where  FileVersionid=aRowID;
 end; 


procedure FileVersion_ISLOCKED /*Версии файла*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FileVersion where FileVersionid=aRowID;
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
  FileVersion_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDFileStore.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FileVersion_LOCK /*Версии файла*/ (
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
 FileVersion_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  FileVersion_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FileVersion where FileVersionid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=FileVersion');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FileVersion set LockUserID =auserID ,LockSessionID =null where FileVersionid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FileVersion set LockUserID =null,LockSessionID =aCURSESSION  where FileVersionid=aRowID;
     return;
   end if;
 end ;


procedure FileVersion_HCL /*Версии файла*/ (
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


procedure FileVersion_UNLOCK /*Версии файла*/ (
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
 FileVersion_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FileVersion set LockUserID =null  where FileVersionid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FileVersion set LockSessionID =null  where FileVersionid=aRowID;
     return;
   end if;
 end; 


procedure FileVersion_SINIT /*Версии файла*/ (
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
 select  SecurityStyleID into atmpID from FileVersion where FileVersionid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =FileVersion');
    return;
  end if;
if aSecurityStyleID is null then
 FileVersion_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FileVersion set securitystyleid =aStyleID where FileVersionid = aRowID;
else 
 update FileVersion set securitystyleid =aSecurityStyleID where FileVersionid = aRowID;
end if; 
end ; 


procedure FileVersion_propagate /*Версии файла*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FileVersion where FileVersionid=aRowid;
end;


end STDFileStore;

/



