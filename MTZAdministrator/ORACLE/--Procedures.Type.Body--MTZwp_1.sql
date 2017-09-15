
/* --MTZwp*/

 create or replace package body MTZwp as

procedure MTZwp_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZwp'
then
declare cursor child_WorkPlace is select WorkPlace.WorkPlaceid ID from WorkPlace where  WorkPlace.InstanceID = ainstanceid;
row_WorkPlace  child_WorkPlace%ROWTYPE;
begin
--open child_WorkPlace;
for row_WorkPlace in child_WorkPlace loop
 WorkPlace_DELETE (acursession,row_WorkPlace.id,aInstanceID);
end loop;
--close child_WorkPlace;
end;
declare cursor child_EntryPoints is select EntryPoints.EntryPointsid ID from EntryPoints where  EntryPoints.InstanceID = ainstanceid;
row_EntryPoints  child_EntryPoints%ROWTYPE;
begin
--open child_EntryPoints;
for row_EntryPoints in child_EntryPoints loop
 EntryPoints_DELETE (acursession,row_EntryPoints.id,aInstanceID);
end loop;
--close child_EntryPoints;
end;
declare cursor child_ARMTypes is select ARMTypes.ARMTypesid ID from ARMTypes where  ARMTypes.InstanceID = ainstanceid;
row_ARMTypes  child_ARMTypes%ROWTYPE;
begin
--open child_ARMTypes;
for row_ARMTypes in child_ARMTypes loop
 ARMTypes_DELETE (acursession,row_ARMTypes.id,aInstanceID);
end loop;
--close child_ARMTypes;
end;
declare cursor child_ARMJournal is select ARMJournal.ARMJournalid ID from ARMJournal where  ARMJournal.InstanceID = ainstanceid;
row_ARMJournal  child_ARMJournal%ROWTYPE;
begin
--open child_ARMJournal;
for row_ARMJournal in child_ARMJournal loop
 ARMJournal_DELETE (acursession,row_ARMJournal.id,aInstanceID);
end loop;
--close child_ARMJournal;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZwp_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZwp'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_WorkPlace is select WorkPlace.WorkPlaceid ID from WorkPlace where  WorkPlace.InstanceID = arowid;
ROW_WorkPlace  lch_WorkPlace%ROWTYPE;
begin
--open lch_WorkPlace;
for row_WorkPlace in lch_WorkPlace loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WorkPlace where WorkPlaceid=row_WorkPlace.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WorkPlace;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WorkPlace;
     return;
   end if; 
 end if; 
 WorkPlace_HCL (acursession,ROW_WorkPlace.id,aisLocked);
 if aisLocked >2 then
   close lch_WorkPlace;
   return;
 end if;
 end loop;
--close lch_WorkPlace;
end;
declare cursor lch_EntryPoints is select EntryPoints.EntryPointsid ID from EntryPoints where  EntryPoints.InstanceID = arowid;
ROW_EntryPoints  lch_EntryPoints%ROWTYPE;
begin
--open lch_EntryPoints;
for row_EntryPoints in lch_EntryPoints loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from EntryPoints where EntryPointsid=row_EntryPoints.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_EntryPoints;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_EntryPoints;
     return;
   end if; 
 end if; 
 EntryPoints_HCL (acursession,ROW_EntryPoints.id,aisLocked);
 if aisLocked >2 then
   close lch_EntryPoints;
   return;
 end if;
 end loop;
--close lch_EntryPoints;
end;
declare cursor lch_ARMTypes is select ARMTypes.ARMTypesid ID from ARMTypes where  ARMTypes.InstanceID = arowid;
ROW_ARMTypes  lch_ARMTypes%ROWTYPE;
begin
--open lch_ARMTypes;
for row_ARMTypes in lch_ARMTypes loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ARMTypes where ARMTypesid=row_ARMTypes.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ARMTypes;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ARMTypes;
     return;
   end if; 
 end if; 
 ARMTypes_HCL (acursession,ROW_ARMTypes.id,aisLocked);
 if aisLocked >2 then
   close lch_ARMTypes;
   return;
 end if;
 end loop;
--close lch_ARMTypes;
end;
declare cursor lch_ARMJournal is select ARMJournal.ARMJournalid ID from ARMJournal where  ARMJournal.InstanceID = arowid;
ROW_ARMJournal  lch_ARMJournal%ROWTYPE;
begin
--open lch_ARMJournal;
for row_ARMJournal in lch_ARMJournal loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ARMJournal where ARMJournalid=row_ARMJournal.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ARMJournal;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ARMJournal;
     return;
   end if; 
 end if; 
 ARMJournal_HCL (acursession,ROW_ARMJournal.id,aisLocked);
 if aisLocked >2 then
   close lch_ARMJournal;
   return;
 end if;
 end loop;
--close lch_ARMJournal;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZwp_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZwp'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_WorkPlace is select WorkPlace.WorkPlaceid id from WorkPlace where  WorkPlace.InstanceID = arowid;
row_WorkPlace  pch_WorkPlace%ROWTYPE;
begin
--open pch_WorkPlace;
for row_WorkPlace in  pch_WorkPlace loop
 WorkPlace_SINIT( acursession,row_WorkPlace.id,assid);
 WorkPlace_propagate( acursession,row_WorkPlace.id);
end loop;
--close pch_WorkPlace;
end;
declare cursor pch_EntryPoints is select EntryPoints.EntryPointsid id from EntryPoints where  EntryPoints.InstanceID = arowid;
row_EntryPoints  pch_EntryPoints%ROWTYPE;
begin
--open pch_EntryPoints;
for row_EntryPoints in  pch_EntryPoints loop
 EntryPoints_SINIT( acursession,row_EntryPoints.id,assid);
 EntryPoints_propagate( acursession,row_EntryPoints.id);
end loop;
--close pch_EntryPoints;
end;
declare cursor pch_ARMTypes is select ARMTypes.ARMTypesid id from ARMTypes where  ARMTypes.InstanceID = arowid;
row_ARMTypes  pch_ARMTypes%ROWTYPE;
begin
--open pch_ARMTypes;
for row_ARMTypes in  pch_ARMTypes loop
 ARMTypes_SINIT( acursession,row_ARMTypes.id,assid);
 ARMTypes_propagate( acursession,row_ARMTypes.id);
end loop;
--close pch_ARMTypes;
end;
declare cursor pch_ARMJournal is select ARMJournal.ARMJournalid id from ARMJournal where  ARMJournal.InstanceID = arowid;
row_ARMJournal  pch_ARMJournal%ROWTYPE;
begin
--open pch_ARMJournal;
for row_ARMJournal in  pch_ARMJournal loop
 ARMJournal_SINIT( acursession,row_ARMJournal.id,assid);
 ARMJournal_propagate( acursession,row_ARMJournal.id);
end loop;
--close pch_ARMJournal;
end;
 end if; 
end;



procedure WorkPlace_BRIEF  (
 aCURSESSION CHAR,
 aWorkPlaceid CHAR,
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
if aWorkPlaceid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WorkPlace where WorkPlaceID=aWorkPlaceID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WorkPlace where WorkPlaceid=aWorkPlaceID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WorkPlace');
    return;
  end if;
  aBRIEF:=func.WorkPlace_BRIEF_F(aWorkPlaceid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WorkPlace_DELETE /*Арм*/ (
 aCURSESSION CHAR,
 aWorkPlaceid CHAR,
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
select count(*) into existsCnt from WorkPlace where WorkPlaceID=aWorkPlaceID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WorkPlace where WorkPlaceid=aWorkPlaceID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WorkPlace',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WorkPlace');
      return;
    end if;
  end if;
 --  verify lock  --
 WorkPlace_ISLOCKED( acursession=>acursession,aROWID=>aWorkPlaceid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WorkPlace');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WorkPlace',
 aVERB=>'DELETEROW',  aThe_Resource=>aWorkPlaceid, aLogInstanceID=>aInstanceID);
declare cursor chld_WorkPlace is select  instanceid ID from instance where OwnerPartName ='WorkPlace' and OwnerRowID=aWorkPlaceid;
row_WorkPlace  chld_WorkPlace%ROWTYPE;
begin
--open chld_WorkPlace;
for row_WorkPlace in chld_WorkPlace loop
 Kernel.INSTANCE_OWNER (acursession,row_WorkPlace.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WorkPlace.id);
end loop;
--close chld_WorkPlace;
end ;
  delete from  WorkPlace 
  where  WorkPlaceID = aWorkPlaceID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Арм*/
procedure WorkPlace_SAVE /*Арм*/ (
 aCURSESSION CHAR,
 aWorkPlaceid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aCaption
 VARCHAR2/* Заголовок *//* Заголовок */
,aTheVersion
 VARCHAR2 := null /* Версия *//* Версия */
,aThePlatform
 NUMBER := null /* Платформа реализации *//* Платформа реализации */
,aTheComment VARCHAR2 := null /* Примечание *//* Примечание */
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
select count(*) into existsCnt from WorkPlace where WorkPlaceID=aWorkPlaceID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WorkPlace where WorkPlaceid=aWorkPlaceID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WorkPlace',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WorkPlace');
      return;
    end if;
  end if;
 --  verify lock  --
 WorkPlace_ISLOCKED( acursession=>acursession,aROWID=>aWorkPlaceid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WorkPlace');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WorkPlace',
 aVERB=>'EDITROW',  aThe_Resource=>aWorkPlaceid,aLogInstanceID=>aInstanceID);
 update  WorkPlace set ChangeStamp=sysdate
,
  Name=aName
,
  Caption=aCaption
,
  TheVersion=aTheVersion
,
  ThePlatform=aThePlatform
,
  TheComment=aTheComment
  where  WorkPlaceID = aWorkPlaceID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WorkPlace',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WorkPlace');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WorkPlace');
    return;
  end if;
select Count(*) into existsCnt from WorkPlace where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <WorkPlace>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WorkPlace',
 aVERB=>'CREATEROW',  aThe_Resource=>aWorkPlaceid,aLogInstanceID=>aInstanceID);
 insert into   WorkPlace
 (  WorkPlaceID 
,InstanceID
,Name

,Caption

,TheVersion

,ThePlatform

,TheComment

 ) values ( aWorkPlaceID 
,aInstanceID
,aName

,aCaption

,aTheVersion

,aThePlatform

,aTheComment

 ); 
 WorkPlace_SINIT( aCURSESSION,aWorkPlaceid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WorkPlace_PARENT /*Арм*/ (
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
  select  INSTANCEID into aParentID from WorkPlace where  WorkPlaceid=aRowID;
 end; 


procedure WorkPlace_ISLOCKED /*Арм*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WorkPlace where WorkPlaceid=aRowID;
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
  WorkPlace_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZwp.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WorkPlace_LOCK /*Арм*/ (
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
 WorkPlace_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WorkPlace_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WorkPlace where WorkPlaceid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WorkPlace');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WorkPlace set LockUserID =auserID ,LockSessionID =null where WorkPlaceid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WorkPlace set LockUserID =null,LockSessionID =aCURSESSION  where WorkPlaceid=aRowID;
     return;
   end if;
 end ;


procedure WorkPlace_HCL /*Арм*/ (
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


procedure WorkPlace_UNLOCK /*Арм*/ (
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
 WorkPlace_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WorkPlace set LockUserID =null  where WorkPlaceid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WorkPlace set LockSessionID =null  where WorkPlaceid=aRowID;
     return;
   end if;
 end; 


procedure WorkPlace_SINIT /*Арм*/ (
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
 select  SecurityStyleID into atmpID from WorkPlace where WorkPlaceid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WorkPlace');
    return;
  end if;
if aSecurityStyleID is null then
 WorkPlace_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WorkPlace set securitystyleid =aStyleID where WorkPlaceid = aRowID;
else 
 update WorkPlace set securitystyleid =aSecurityStyleID where WorkPlaceid = aRowID;
end if; 
end ; 


procedure WorkPlace_propagate /*Арм*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WorkPlace where WorkPlaceid=aRowid;
end;



procedure EntryPoints_BRIEF  (
 aCURSESSION CHAR,
 aEntryPointsid CHAR,
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
if aEntryPointsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from EntryPoints where EntryPointsID=aEntryPointsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from EntryPoints where EntryPointsid=aEntryPointsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=EntryPoints');
    return;
  end if;
  aBRIEF:=func.EntryPoints_BRIEF_F(aEntryPointsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure EntryPoints_DELETE /*Меню*/ (
 aCURSESSION CHAR,
 aEntryPointsid CHAR,
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
select count(*) into existsCnt from EntryPoints where EntryPointsID=aEntryPointsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from EntryPoints where EntryPointsid=aEntryPointsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:EntryPoints',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=EntryPoints');
      return;
    end if;
  end if;
 --  verify lock  --
 EntryPoints_ISLOCKED( acursession=>acursession,aROWID=>aEntryPointsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=EntryPoints');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_EPFilterLink is select EPFilterLink.EPFilterLinkid ID from EPFilterLink where  EPFilterLink.ParentStructRowID = aEntryPointsid;
    child_EPFilterLink_rec  child_EPFilterLink%ROWTYPE;
    begin
    --open child_EPFilterLink;
      for child_EPFilterLink_rec in child_EPFilterLink loop
      EPFilterLink_DELETE (acursession,child_EPFilterLink_rec.id,aInstanceid);
      end loop;
      --close child_EPFilterLink;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'EntryPoints',
 aVERB=>'DELETEROW',  aThe_Resource=>aEntryPointsid, aLogInstanceID=>aInstanceID);
declare cursor chld_EntryPoints is select  instanceid ID from instance where OwnerPartName ='EntryPoints' and OwnerRowID=aEntryPointsid;
row_EntryPoints  chld_EntryPoints%ROWTYPE;
begin
--open chld_EntryPoints;
for row_EntryPoints in chld_EntryPoints loop
 Kernel.INSTANCE_OWNER (acursession,row_EntryPoints.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_EntryPoints.id);
end loop;
--close chld_EntryPoints;
end ;
  delete from  EntryPoints 
  where  EntryPointsID = aEntryPointsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Меню*/
procedure EntryPoints_SAVE /*Меню*/ (
 aCURSESSION CHAR,
 aEntryPointsid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,asequence
 NUMBER/* Последовательность *//* Последовательность */
,aName
 VARCHAR2/* Название *//* Название */
,aCaption
 VARCHAR2/* Заголовок *//* Заголовок */
,aAsToolbarItem
 NUMBER/* Включить в тулбар *//* Включить в тулбар */
,aActionType
 NUMBER/* Вариант действия *//* Вариант действия */
,aTheFilter CHAR := null /* Фильтр *//* Фильтр */
,aJournal CHAR := null /* Журнал *//* Журнал */
,aReport CHAR := null /* Отчет *//* Отчет */
,aDocument CHAR := null /* Документ *//* Документ */
,aMethod CHAR := null /* Метод *//* Метод */
,aIconFile
 VARCHAR2 := null /* Файл картинки *//* Файл картинки */
,aTheExtention CHAR := null /* Расширение *//* Расширение */
,aARM CHAR := null /* АРМ *//* АРМ */
,aTheComment VARCHAR2 := null /* Примечание *//* Примечание */
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
select count(*) into existsCnt from EntryPoints where EntryPointsID=aEntryPointsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from EntryPoints where EntryPointsid=aEntryPointsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:EntryPoints',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=EntryPoints');
      return;
    end if;
  end if;
 --  verify lock  --
 EntryPoints_ISLOCKED( acursession=>acursession,aROWID=>aEntryPointsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=EntryPoints');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'EntryPoints',
 aVERB=>'EDITROW',  aThe_Resource=>aEntryPointsid,aLogInstanceID=>aInstanceID);
 update  EntryPoints set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  sequence=asequence
,
  Name=aName
,
  Caption=aCaption
,
  AsToolbarItem=aAsToolbarItem
,
  ActionType=aActionType
,
  TheFilter=aTheFilter
,
  Journal=aJournal
,
  Report=aReport
,
  Document=aDocument
,
  Method=aMethod
,
  IconFile=aIconFile
,
  TheExtention=aTheExtention
,
  ARM=aARM
,
  TheComment=aTheComment
  where  EntryPointsID = aEntryPointsID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:EntryPoints',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=EntryPoints');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=EntryPoints');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'EntryPoints',
 aVERB=>'CREATEROW',  aThe_Resource=>aEntryPointsid,aLogInstanceID=>aInstanceID);
 insert into   EntryPoints
 (  EntryPointsID 
,ParentRowid
,InstanceID
,sequence

,Name

,Caption

,AsToolbarItem

,ActionType

,TheFilter

,Journal

,Report

,Document

,Method

,IconFile

,TheExtention

,ARM

,TheComment

 ) values ( aEntryPointsID 
,aParentRowid
,aInstanceID
,asequence

,aName

,aCaption

,aAsToolbarItem

,aActionType

,aTheFilter

,aJournal

,aReport

,aDocument

,aMethod

,aIconFile

,aTheExtention

,aARM

,aTheComment

 ); 
 EntryPoints_SINIT( aCURSESSION,aEntryPointsid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure EntryPoints_PARENT /*Меню*/ (
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
  select  INSTANCEID into aParentID from EntryPoints where  EntryPointsid=aRowID;
 end; 


procedure EntryPoints_ISLOCKED /*Меню*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from EntryPoints where EntryPointsid=aRowID;
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
  EntryPoints_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZwp.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure EntryPoints_LOCK /*Меню*/ (
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
 EntryPoints_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  EntryPoints_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from EntryPoints where EntryPointsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=EntryPoints');
    return;
  end if;
   if  aLockMode =2  
   then   
    update EntryPoints set LockUserID =auserID ,LockSessionID =null where EntryPointsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update EntryPoints set LockUserID =null,LockSessionID =aCURSESSION  where EntryPointsid=aRowID;
     return;
   end if;
 end ;


procedure EntryPoints_HCL /*Меню*/ (
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
declare cursor lch_EPFilterLink is select EPFilterLink.EPFilterLinkid ID from EPFilterLink where  EPFilterLink.ParentStructRowID = aRowid;
row_EPFilterLink lch_EPFilterLink%ROWTYPE;
begin  
--open lch_EPFilterLink;
for row_EPFilterLink in lch_EPFilterLink
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from EPFilterLink where EPFilterLinkid=row_EPFilterLink.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_EPFilterLink;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_EPFilterLink;
     return;
   end if; 
 end if;  
 EPFilterLink_HCL (acursession,row_EPFilterLink.id,aisLocked);
 if aisLocked >2 then
   close lch_EPFilterLink;
   return;
 end if;
end loop;
--close lch_EPFilterLink;
end;
aIsLocked :=0;
end;


procedure EntryPoints_UNLOCK /*Меню*/ (
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
 EntryPoints_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update EntryPoints set LockUserID =null  where EntryPointsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update EntryPoints set LockSessionID =null  where EntryPointsid=aRowID;
     return;
   end if;
 end; 


procedure EntryPoints_SINIT /*Меню*/ (
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
 select  SecurityStyleID into atmpID from EntryPoints where EntryPointsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =EntryPoints');
    return;
  end if;
if aSecurityStyleID is null then
 EntryPoints_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update EntryPoints set securitystyleid =aStyleID where EntryPointsid = aRowID;
else 
 update EntryPoints set securitystyleid =aSecurityStyleID where EntryPointsid = aRowID;
end if; 
end ; 


procedure EntryPoints_propagate /*Меню*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from EntryPoints where EntryPointsid=aRowid;
declare cursor pch_EPFilterLink  is select EPFilterLink.EPFilterLinkid ID from EPFilterLink where  EPFilterLink.ParentStructRowID = aRowid;
row_EPFilterLink  pch_EPFilterLink%ROWTYPE;
begin
--open pch_EPFilterLink;
for row_EPFilterLink in pch_EPFilterLink loop
   EPFilterLink_SINIT( acursession,row_EPFilterLink.id,assid);
   EPFilterLink_propagate( acursession,row_EPFilterLink.id);
end loop;
--close pch_EPFilterLink;
end;
end;



procedure EPFilterLink_BRIEF  (
 aCURSESSION CHAR,
 aEPFilterLinkid CHAR,
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
if aEPFilterLinkid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from EPFilterLink where EPFilterLinkID=aEPFilterLinkID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from EPFilterLink where EPFilterLinkid=aEPFilterLinkID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=EPFilterLink');
    return;
  end if;
  aBRIEF:=func.EPFilterLink_BRIEF_F(aEPFilterLinkid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure EPFilterLink_DELETE /*Привязка фильтра к журналу*/ (
 aCURSESSION CHAR,
 aEPFilterLinkid CHAR,
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
select count(*) into existsCnt from EPFilterLink where EPFilterLinkID=aEPFilterLinkID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from EPFilterLink where EPFilterLinkid=aEPFilterLinkID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:EPFilterLink',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=EPFilterLink');
      return;
    end if;
  end if;
 --  verify lock  --
 EPFilterLink_ISLOCKED( acursession=>acursession,aROWID=>aEPFilterLinkid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=EPFilterLink');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'EPFilterLink',
 aVERB=>'DELETEROW',  aThe_Resource=>aEPFilterLinkid, aLogInstanceID=>aInstanceID);
declare cursor chld_EPFilterLink is select  instanceid ID from instance where OwnerPartName ='EPFilterLink' and OwnerRowID=aEPFilterLinkid;
row_EPFilterLink  chld_EPFilterLink%ROWTYPE;
begin
--open chld_EPFilterLink;
for row_EPFilterLink in chld_EPFilterLink loop
 Kernel.INSTANCE_OWNER (acursession,row_EPFilterLink.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_EPFilterLink.id);
end loop;
--close chld_EPFilterLink;
end ;
  delete from  EPFilterLink 
  where  EPFilterLinkID = aEPFilterLinkID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Привязка фильтра*/
procedure EPFilterLink_SAVE /*Привязка фильтра к журналу*/ (
 aCURSESSION CHAR,
 aEPFilterLinkid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aRowSource
 VARCHAR2/* Источник *//* Источник */
,aTheExpression VARCHAR2/* Выражение *//* Выражение */
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
select count(*) into existsCnt from EPFilterLink where EPFilterLinkID=aEPFilterLinkID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from EPFilterLink where EPFilterLinkid=aEPFilterLinkID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:EPFilterLink',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=EPFilterLink');
      return;
    end if;
  end if;
 --  verify lock  --
 EPFilterLink_ISLOCKED( acursession=>acursession,aROWID=>aEPFilterLinkid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=EPFilterLink');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'EPFilterLink',
 aVERB=>'EDITROW',  aThe_Resource=>aEPFilterLinkid,aLogInstanceID=>aInstanceID);
 update  EPFilterLink set ChangeStamp=sysdate
,
  RowSource=aRowSource
,
  TheExpression=aTheExpression
  where  EPFilterLinkID = aEPFilterLinkID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from EntryPoints where EntryPointsid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:EPFilterLink',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=EPFilterLink');
      return;
    end if;
 end if;
 EntryPoints_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=EPFilterLink');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'EPFilterLink',
 aVERB=>'CREATEROW',  aThe_Resource=>aEPFilterLinkid,aLogInstanceID=>aInstanceID);
 insert into   EPFilterLink
 (  EPFilterLinkID 
,ParentStructRowID
,RowSource

,TheExpression

 ) values ( aEPFilterLinkID 
,aParentStructRowID
,aRowSource

,aTheExpression

 ); 
 EPFilterLink_SINIT( aCURSESSION,aEPFilterLinkid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure EPFilterLink_PARENT /*Привязка фильтра к журналу*/ (
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
  select ParentStructRowID into aParentID  from EPFilterLink where  EPFilterLinkid=aRowID;
  aParentTable := 'EntryPoints';
 end; 


procedure EPFilterLink_ISLOCKED /*Привязка фильтра к журналу*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from EPFilterLink where EPFilterLinkid=aRowID;
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
  EPFilterLink_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZwp.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure EPFilterLink_LOCK /*Привязка фильтра к журналу*/ (
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
 EPFilterLink_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  EPFilterLink_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from EPFilterLink where EPFilterLinkid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=EPFilterLink');
    return;
  end if;
   if  aLockMode =2  
   then   
    update EPFilterLink set LockUserID =auserID ,LockSessionID =null where EPFilterLinkid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update EPFilterLink set LockUserID =null,LockSessionID =aCURSESSION  where EPFilterLinkid=aRowID;
     return;
   end if;
 end ;


procedure EPFilterLink_HCL /*Привязка фильтра к журналу*/ (
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


procedure EPFilterLink_UNLOCK /*Привязка фильтра к журналу*/ (
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
 EPFilterLink_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update EPFilterLink set LockUserID =null  where EPFilterLinkid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update EPFilterLink set LockSessionID =null  where EPFilterLinkid=aRowID;
     return;
   end if;
 end; 


procedure EPFilterLink_SINIT /*Привязка фильтра к журналу*/ (
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
 select  SecurityStyleID into atmpID from EPFilterLink where EPFilterLinkid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =EPFilterLink');
    return;
  end if;
if aSecurityStyleID is null then
 EPFilterLink_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update EPFilterLink set securitystyleid =aStyleID where EPFilterLinkid = aRowID;
else 
 update EPFilterLink set securitystyleid =aSecurityStyleID where EPFilterLinkid = aRowID;
end if; 
end ; 


procedure EPFilterLink_propagate /*Привязка фильтра к журналу*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from EPFilterLink where EPFilterLinkid=aRowid;
end;



procedure ARMTypes_BRIEF  (
 aCURSESSION CHAR,
 aARMTypesid CHAR,
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
if aARMTypesid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ARMTypes where ARMTypesID=aARMTypesID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ARMTypes where ARMTypesid=aARMTypesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ARMTypes');
    return;
  end if;
  aBRIEF:=func.ARMTypes_BRIEF_F(aARMTypesid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ARMTypes_DELETE /*Типы документов, которые подключаются в MDI режиме*/ (
 aCURSESSION CHAR,
 aARMTypesid CHAR,
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
select count(*) into existsCnt from ARMTypes where ARMTypesID=aARMTypesID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ARMTypes where ARMTypesid=aARMTypesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ARMTypes',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ARMTypes');
      return;
    end if;
  end if;
 --  verify lock  --
 ARMTypes_ISLOCKED( acursession=>acursession,aROWID=>aARMTypesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ARMTypes');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ARMTypes',
 aVERB=>'DELETEROW',  aThe_Resource=>aARMTypesid, aLogInstanceID=>aInstanceID);
declare cursor chld_ARMTypes is select  instanceid ID from instance where OwnerPartName ='ARMTypes' and OwnerRowID=aARMTypesid;
row_ARMTypes  chld_ARMTypes%ROWTYPE;
begin
--open chld_ARMTypes;
for row_ARMTypes in chld_ARMTypes loop
 Kernel.INSTANCE_OWNER (acursession,row_ARMTypes.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ARMTypes.id);
end loop;
--close chld_ARMTypes;
end ;
  delete from  ARMTypes 
  where  ARMTypesID = aARMTypesID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Список типов*/
procedure ARMTypes_SAVE /*Типы документов, которые подключаются в MDI режиме*/ (
 aCURSESSION CHAR,
 aARMTypesid CHAR,
aInstanceID CHAR 
,aTheDocumentType CHAR/* Тип документа *//* Тип документа */
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
select count(*) into existsCnt from ARMTypes where ARMTypesID=aARMTypesID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ARMTypes where ARMTypesid=aARMTypesID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ARMTypes',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ARMTypes');
      return;
    end if;
  end if;
 --  verify lock  --
 ARMTypes_ISLOCKED( acursession=>acursession,aROWID=>aARMTypesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ARMTypes');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ARMTypes',
 aVERB=>'EDITROW',  aThe_Resource=>aARMTypesid,aLogInstanceID=>aInstanceID);
 update  ARMTypes set ChangeStamp=sysdate
,
  TheDocumentType=aTheDocumentType
  where  ARMTypesID = aARMTypesID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ARMTypes',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ARMTypes');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ARMTypes');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ARMTypes',
 aVERB=>'CREATEROW',  aThe_Resource=>aARMTypesid,aLogInstanceID=>aInstanceID);
 insert into   ARMTypes
 (  ARMTypesID 
,InstanceID
,TheDocumentType

 ) values ( aARMTypesID 
,aInstanceID
,aTheDocumentType

 ); 
 ARMTypes_SINIT( aCURSESSION,aARMTypesid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ARMTypes_PARENT /*Типы документов, которые подключаются в MDI режиме*/ (
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
  select  INSTANCEID into aParentID from ARMTypes where  ARMTypesid=aRowID;
 end; 


procedure ARMTypes_ISLOCKED /*Типы документов, которые подключаются в MDI режиме*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ARMTypes where ARMTypesid=aRowID;
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
  ARMTypes_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZwp.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ARMTypes_LOCK /*Типы документов, которые подключаются в MDI режиме*/ (
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
 ARMTypes_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ARMTypes_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ARMTypes where ARMTypesid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ARMTypes');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ARMTypes set LockUserID =auserID ,LockSessionID =null where ARMTypesid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ARMTypes set LockUserID =null,LockSessionID =aCURSESSION  where ARMTypesid=aRowID;
     return;
   end if;
 end ;


procedure ARMTypes_HCL /*Типы документов, которые подключаются в MDI режиме*/ (
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


procedure ARMTypes_UNLOCK /*Типы документов, которые подключаются в MDI режиме*/ (
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
 ARMTypes_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ARMTypes set LockUserID =null  where ARMTypesid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ARMTypes set LockSessionID =null  where ARMTypesid=aRowID;
     return;
   end if;
 end; 


procedure ARMTypes_SINIT /*Типы документов, которые подключаются в MDI режиме*/ (
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
 select  SecurityStyleID into atmpID from ARMTypes where ARMTypesid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ARMTypes');
    return;
  end if;
if aSecurityStyleID is null then
 ARMTypes_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ARMTypes set securitystyleid =aStyleID where ARMTypesid = aRowID;
else 
 update ARMTypes set securitystyleid =aSecurityStyleID where ARMTypesid = aRowID;
end if; 
end ; 


procedure ARMTypes_propagate /*Типы документов, которые подключаются в MDI режиме*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ARMTypes where ARMTypesid=aRowid;
end;



procedure ARMJournal_BRIEF  (
 aCURSESSION CHAR,
 aARMJournalid CHAR,
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
if aARMJournalid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ARMJournal where ARMJournalID=aARMJournalID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ARMJournal where ARMJournalid=aARMJournalID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ARMJournal');
    return;
  end if;
  aBRIEF:=func.ARMJournal_BRIEF_F(aARMJournalid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ARMJournal_DELETE /*Описание действий журанлов*/ (
 aCURSESSION CHAR,
 aARMJournalid CHAR,
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
select count(*) into existsCnt from ARMJournal where ARMJournalID=aARMJournalID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ARMJournal where ARMJournalid=aARMJournalID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ARMJournal',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ARMJournal');
      return;
    end if;
  end if;
 --  verify lock  --
 ARMJournal_ISLOCKED( acursession=>acursession,aROWID=>aARMJournalid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ARMJournal');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_ARMJRNLADD is select ARMJRNLADD.ARMJRNLADDid ID from ARMJRNLADD where  ARMJRNLADD.ParentStructRowID = aARMJournalid;
    child_ARMJRNLADD_rec  child_ARMJRNLADD%ROWTYPE;
    begin
    --open child_ARMJRNLADD;
      for child_ARMJRNLADD_rec in child_ARMJRNLADD loop
      ARMJRNLADD_DELETE (acursession,child_ARMJRNLADD_rec.id,aInstanceid);
      end loop;
      --close child_ARMJRNLADD;
    end ;
    declare cursor child_ARMJRNLREP is select ARMJRNLREP.ARMJRNLREPid ID from ARMJRNLREP where  ARMJRNLREP.ParentStructRowID = aARMJournalid;
    child_ARMJRNLREP_rec  child_ARMJRNLREP%ROWTYPE;
    begin
    --open child_ARMJRNLREP;
      for child_ARMJRNLREP_rec in child_ARMJRNLREP loop
      ARMJRNLREP_DELETE (acursession,child_ARMJRNLREP_rec.id,aInstanceid);
      end loop;
      --close child_ARMJRNLREP;
    end ;
    declare cursor child_ARMJRNLRUN is select ARMJRNLRUN.ARMJRNLRUNid ID from ARMJRNLRUN where  ARMJRNLRUN.ParentStructRowID = aARMJournalid;
    child_ARMJRNLRUN_rec  child_ARMJRNLRUN%ROWTYPE;
    begin
    --open child_ARMJRNLRUN;
      for child_ARMJRNLRUN_rec in child_ARMJRNLRUN loop
      ARMJRNLRUN_DELETE (acursession,child_ARMJRNLRUN_rec.id,aInstanceid);
      end loop;
      --close child_ARMJRNLRUN;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ARMJournal',
 aVERB=>'DELETEROW',  aThe_Resource=>aARMJournalid, aLogInstanceID=>aInstanceID);
declare cursor chld_ARMJournal is select  instanceid ID from instance where OwnerPartName ='ARMJournal' and OwnerRowID=aARMJournalid;
row_ARMJournal  chld_ARMJournal%ROWTYPE;
begin
--open chld_ARMJournal;
for row_ARMJournal in chld_ARMJournal loop
 Kernel.INSTANCE_OWNER (acursession,row_ARMJournal.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ARMJournal.id);
end loop;
--close chld_ARMJournal;
end ;
  delete from  ARMJournal 
  where  ARMJournalID = aARMJournalID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Поведение журналов*/
procedure ARMJournal_SAVE /*Описание действий журанлов*/ (
 aCURSESSION CHAR,
 aARMJournalid CHAR,
aInstanceID CHAR 
,aTheJournal CHAR/* Журнал *//* Журнал */
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
select count(*) into existsCnt from ARMJournal where ARMJournalID=aARMJournalID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ARMJournal where ARMJournalid=aARMJournalID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ARMJournal',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ARMJournal');
      return;
    end if;
  end if;
 --  verify lock  --
 ARMJournal_ISLOCKED( acursession=>acursession,aROWID=>aARMJournalid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ARMJournal');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ARMJournal',
 aVERB=>'EDITROW',  aThe_Resource=>aARMJournalid,aLogInstanceID=>aInstanceID);
 update  ARMJournal set ChangeStamp=sysdate
,
  TheJournal=aTheJournal
  where  ARMJournalID = aARMJournalID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ARMJournal',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ARMJournal');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ARMJournal');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ARMJournal',
 aVERB=>'CREATEROW',  aThe_Resource=>aARMJournalid,aLogInstanceID=>aInstanceID);
 insert into   ARMJournal
 (  ARMJournalID 
,InstanceID
,TheJournal

 ) values ( aARMJournalID 
,aInstanceID
,aTheJournal

 ); 
 ARMJournal_SINIT( aCURSESSION,aARMJournalid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ARMJournal_PARENT /*Описание действий журанлов*/ (
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
  select  INSTANCEID into aParentID from ARMJournal where  ARMJournalid=aRowID;
 end; 


procedure ARMJournal_ISLOCKED /*Описание действий журанлов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ARMJournal where ARMJournalid=aRowID;
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
  ARMJournal_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZwp.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ARMJournal_LOCK /*Описание действий журанлов*/ (
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
 ARMJournal_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ARMJournal_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ARMJournal where ARMJournalid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ARMJournal');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ARMJournal set LockUserID =auserID ,LockSessionID =null where ARMJournalid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ARMJournal set LockUserID =null,LockSessionID =aCURSESSION  where ARMJournalid=aRowID;
     return;
   end if;
 end ;


procedure ARMJournal_HCL /*Описание действий журанлов*/ (
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
declare cursor lch_ARMJRNLADD is select ARMJRNLADD.ARMJRNLADDid ID from ARMJRNLADD where  ARMJRNLADD.ParentStructRowID = aRowid;
row_ARMJRNLADD lch_ARMJRNLADD%ROWTYPE;
begin  
--open lch_ARMJRNLADD;
for row_ARMJRNLADD in lch_ARMJRNLADD
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ARMJRNLADD where ARMJRNLADDid=row_ARMJRNLADD.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ARMJRNLADD;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ARMJRNLADD;
     return;
   end if; 
 end if;  
 ARMJRNLADD_HCL (acursession,row_ARMJRNLADD.id,aisLocked);
 if aisLocked >2 then
   close lch_ARMJRNLADD;
   return;
 end if;
end loop;
--close lch_ARMJRNLADD;
end;
declare cursor lch_ARMJRNLREP is select ARMJRNLREP.ARMJRNLREPid ID from ARMJRNLREP where  ARMJRNLREP.ParentStructRowID = aRowid;
row_ARMJRNLREP lch_ARMJRNLREP%ROWTYPE;
begin  
--open lch_ARMJRNLREP;
for row_ARMJRNLREP in lch_ARMJRNLREP
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ARMJRNLREP where ARMJRNLREPid=row_ARMJRNLREP.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ARMJRNLREP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ARMJRNLREP;
     return;
   end if; 
 end if;  
 ARMJRNLREP_HCL (acursession,row_ARMJRNLREP.id,aisLocked);
 if aisLocked >2 then
   close lch_ARMJRNLREP;
   return;
 end if;
end loop;
--close lch_ARMJRNLREP;
end;
declare cursor lch_ARMJRNLRUN is select ARMJRNLRUN.ARMJRNLRUNid ID from ARMJRNLRUN where  ARMJRNLRUN.ParentStructRowID = aRowid;
row_ARMJRNLRUN lch_ARMJRNLRUN%ROWTYPE;
begin  
--open lch_ARMJRNLRUN;
for row_ARMJRNLRUN in lch_ARMJRNLRUN
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ARMJRNLRUN where ARMJRNLRUNid=row_ARMJRNLRUN.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ARMJRNLRUN;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ARMJRNLRUN;
     return;
   end if; 
 end if;  
 ARMJRNLRUN_HCL (acursession,row_ARMJRNLRUN.id,aisLocked);
 if aisLocked >2 then
   close lch_ARMJRNLRUN;
   return;
 end if;
end loop;
--close lch_ARMJRNLRUN;
end;
aIsLocked :=0;
end;


procedure ARMJournal_UNLOCK /*Описание действий журанлов*/ (
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
 ARMJournal_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ARMJournal set LockUserID =null  where ARMJournalid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ARMJournal set LockSessionID =null  where ARMJournalid=aRowID;
     return;
   end if;
 end; 


procedure ARMJournal_SINIT /*Описание действий журанлов*/ (
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
 select  SecurityStyleID into atmpID from ARMJournal where ARMJournalid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ARMJournal');
    return;
  end if;
if aSecurityStyleID is null then
 ARMJournal_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ARMJournal set securitystyleid =aStyleID where ARMJournalid = aRowID;
else 
 update ARMJournal set securitystyleid =aSecurityStyleID where ARMJournalid = aRowID;
end if; 
end ; 


procedure ARMJournal_propagate /*Описание действий журанлов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ARMJournal where ARMJournalid=aRowid;
declare cursor pch_ARMJRNLADD  is select ARMJRNLADD.ARMJRNLADDid ID from ARMJRNLADD where  ARMJRNLADD.ParentStructRowID = aRowid;
row_ARMJRNLADD  pch_ARMJRNLADD%ROWTYPE;
begin
--open pch_ARMJRNLADD;
for row_ARMJRNLADD in pch_ARMJRNLADD loop
   ARMJRNLADD_SINIT( acursession,row_ARMJRNLADD.id,assid);
   ARMJRNLADD_propagate( acursession,row_ARMJRNLADD.id);
end loop;
--close pch_ARMJRNLADD;
end;
declare cursor pch_ARMJRNLREP  is select ARMJRNLREP.ARMJRNLREPid ID from ARMJRNLREP where  ARMJRNLREP.ParentStructRowID = aRowid;
row_ARMJRNLREP  pch_ARMJRNLREP%ROWTYPE;
begin
--open pch_ARMJRNLREP;
for row_ARMJRNLREP in pch_ARMJRNLREP loop
   ARMJRNLREP_SINIT( acursession,row_ARMJRNLREP.id,assid);
   ARMJRNLREP_propagate( acursession,row_ARMJRNLREP.id);
end loop;
--close pch_ARMJRNLREP;
end;
declare cursor pch_ARMJRNLRUN  is select ARMJRNLRUN.ARMJRNLRUNid ID from ARMJRNLRUN where  ARMJRNLRUN.ParentStructRowID = aRowid;
row_ARMJRNLRUN  pch_ARMJRNLRUN%ROWTYPE;
begin
--open pch_ARMJRNLRUN;
for row_ARMJRNLRUN in pch_ARMJRNLRUN loop
   ARMJRNLRUN_SINIT( acursession,row_ARMJRNLRUN.id,assid);
   ARMJRNLRUN_propagate( acursession,row_ARMJRNLRUN.id);
end loop;
--close pch_ARMJRNLRUN;
end;
end;



procedure ARMJRNLADD_BRIEF  (
 aCURSESSION CHAR,
 aARMJRNLADDid CHAR,
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
if aARMJRNLADDid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ARMJRNLADD where ARMJRNLADDID=aARMJRNLADDID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ARMJRNLADD where ARMJRNLADDid=aARMJRNLADDID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ARMJRNLADD');
    return;
  end if;
  aBRIEF:=func.ARMJRNLADD_BRIEF_F(aARMJRNLADDid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ARMJRNLADD_DELETE /*Варианты обработки добавления*/ (
 aCURSESSION CHAR,
 aARMJRNLADDid CHAR,
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
select count(*) into existsCnt from ARMJRNLADD where ARMJRNLADDID=aARMJRNLADDID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ARMJRNLADD where ARMJRNLADDid=aARMJRNLADDID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ARMJRNLADD',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ARMJRNLADD');
      return;
    end if;
  end if;
 --  verify lock  --
 ARMJRNLADD_ISLOCKED( acursession=>acursession,aROWID=>aARMJRNLADDid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ARMJRNLADD');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ARMJRNLADD',
 aVERB=>'DELETEROW',  aThe_Resource=>aARMJRNLADDid, aLogInstanceID=>aInstanceID);
declare cursor chld_ARMJRNLADD is select  instanceid ID from instance where OwnerPartName ='ARMJRNLADD' and OwnerRowID=aARMJRNLADDid;
row_ARMJRNLADD  chld_ARMJRNLADD%ROWTYPE;
begin
--open chld_ARMJRNLADD;
for row_ARMJRNLADD in chld_ARMJRNLADD loop
 Kernel.INSTANCE_OWNER (acursession,row_ARMJRNLADD.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ARMJRNLADD.id);
end loop;
--close chld_ARMJRNLADD;
end ;
  delete from  ARMJRNLADD 
  where  ARMJRNLADDID = aARMJRNLADDID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Добавление*/
procedure ARMJRNLADD_SAVE /*Варианты обработки добавления*/ (
 aCURSESSION CHAR,
 aARMJRNLADDid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aTheExtention CHAR/* Расширение *//* Расширение */
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
select count(*) into existsCnt from ARMJRNLADD where ARMJRNLADDID=aARMJRNLADDID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ARMJRNLADD where ARMJRNLADDid=aARMJRNLADDID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ARMJRNLADD',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ARMJRNLADD');
      return;
    end if;
  end if;
 --  verify lock  --
 ARMJRNLADD_ISLOCKED( acursession=>acursession,aROWID=>aARMJRNLADDid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ARMJRNLADD');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ARMJRNLADD',
 aVERB=>'EDITROW',  aThe_Resource=>aARMJRNLADDid,aLogInstanceID=>aInstanceID);
 update  ARMJRNLADD set ChangeStamp=sysdate
,
  Name=aName
,
  TheExtention=aTheExtention
  where  ARMJRNLADDID = aARMJRNLADDID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from ARMJournal where ARMJournalid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ARMJRNLADD',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ARMJRNLADD');
      return;
    end if;
 end if;
 ARMJournal_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ARMJRNLADD');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ARMJRNLADD',
 aVERB=>'CREATEROW',  aThe_Resource=>aARMJRNLADDid,aLogInstanceID=>aInstanceID);
 insert into   ARMJRNLADD
 (  ARMJRNLADDID 
,ParentStructRowID
,Name

,TheExtention

 ) values ( aARMJRNLADDID 
,aParentStructRowID
,aName

,aTheExtention

 ); 
 ARMJRNLADD_SINIT( aCURSESSION,aARMJRNLADDid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ARMJRNLADD_PARENT /*Варианты обработки добавления*/ (
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
  select ParentStructRowID into aParentID  from ARMJRNLADD where  ARMJRNLADDid=aRowID;
  aParentTable := 'ARMJournal';
 end; 


procedure ARMJRNLADD_ISLOCKED /*Варианты обработки добавления*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ARMJRNLADD where ARMJRNLADDid=aRowID;
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
  ARMJRNLADD_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZwp.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ARMJRNLADD_LOCK /*Варианты обработки добавления*/ (
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
 ARMJRNLADD_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ARMJRNLADD_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ARMJRNLADD where ARMJRNLADDid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ARMJRNLADD');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ARMJRNLADD set LockUserID =auserID ,LockSessionID =null where ARMJRNLADDid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ARMJRNLADD set LockUserID =null,LockSessionID =aCURSESSION  where ARMJRNLADDid=aRowID;
     return;
   end if;
 end ;


procedure ARMJRNLADD_HCL /*Варианты обработки добавления*/ (
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


procedure ARMJRNLADD_UNLOCK /*Варианты обработки добавления*/ (
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
 ARMJRNLADD_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ARMJRNLADD set LockUserID =null  where ARMJRNLADDid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ARMJRNLADD set LockSessionID =null  where ARMJRNLADDid=aRowID;
     return;
   end if;
 end; 


procedure ARMJRNLADD_SINIT /*Варианты обработки добавления*/ (
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
 select  SecurityStyleID into atmpID from ARMJRNLADD where ARMJRNLADDid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ARMJRNLADD');
    return;
  end if;
if aSecurityStyleID is null then
 ARMJRNLADD_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ARMJRNLADD set securitystyleid =aStyleID where ARMJRNLADDid = aRowID;
else 
 update ARMJRNLADD set securitystyleid =aSecurityStyleID where ARMJRNLADDid = aRowID;
end if; 
end ; 


procedure ARMJRNLADD_propagate /*Варианты обработки добавления*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ARMJRNLADD where ARMJRNLADDid=aRowid;
end;



procedure ARMJRNLREP_BRIEF  (
 aCURSESSION CHAR,
 aARMJRNLREPid CHAR,
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
if aARMJRNLREPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ARMJRNLREP where ARMJRNLREPID=aARMJRNLREPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ARMJRNLREP where ARMJRNLREPid=aARMJRNLREPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ARMJRNLREP');
    return;
  end if;
  aBRIEF:=func.ARMJRNLREP_BRIEF_F(aARMJRNLREPid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ARMJRNLREP_DELETE /*Отчеты из журнала*/ (
 aCURSESSION CHAR,
 aARMJRNLREPid CHAR,
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
select count(*) into existsCnt from ARMJRNLREP where ARMJRNLREPID=aARMJRNLREPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ARMJRNLREP where ARMJRNLREPid=aARMJRNLREPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ARMJRNLREP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ARMJRNLREP');
      return;
    end if;
  end if;
 --  verify lock  --
 ARMJRNLREP_ISLOCKED( acursession=>acursession,aROWID=>aARMJRNLREPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ARMJRNLREP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ARMJRNLREP',
 aVERB=>'DELETEROW',  aThe_Resource=>aARMJRNLREPid, aLogInstanceID=>aInstanceID);
declare cursor chld_ARMJRNLREP is select  instanceid ID from instance where OwnerPartName ='ARMJRNLREP' and OwnerRowID=aARMJRNLREPid;
row_ARMJRNLREP  chld_ARMJRNLREP%ROWTYPE;
begin
--open chld_ARMJRNLREP;
for row_ARMJRNLREP in chld_ARMJRNLREP loop
 Kernel.INSTANCE_OWNER (acursession,row_ARMJRNLREP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ARMJRNLREP.id);
end loop;
--close chld_ARMJRNLREP;
end ;
  delete from  ARMJRNLREP 
  where  ARMJRNLREPID = aARMJRNLREPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Отчеты*/
procedure ARMJRNLREP_SAVE /*Отчеты из журнала*/ (
 aCURSESSION CHAR,
 aARMJRNLREPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,arepname
 VARCHAR2/* Название отчета *//* Название отчета */
,aTheReport CHAR/* Отчет *//* Отчет */
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
select count(*) into existsCnt from ARMJRNLREP where ARMJRNLREPID=aARMJRNLREPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ARMJRNLREP where ARMJRNLREPid=aARMJRNLREPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ARMJRNLREP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ARMJRNLREP');
      return;
    end if;
  end if;
 --  verify lock  --
 ARMJRNLREP_ISLOCKED( acursession=>acursession,aROWID=>aARMJRNLREPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ARMJRNLREP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ARMJRNLREP',
 aVERB=>'EDITROW',  aThe_Resource=>aARMJRNLREPid,aLogInstanceID=>aInstanceID);
 update  ARMJRNLREP set ChangeStamp=sysdate
,
  repname=arepname
,
  TheReport=aTheReport
  where  ARMJRNLREPID = aARMJRNLREPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from ARMJournal where ARMJournalid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ARMJRNLREP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ARMJRNLREP');
      return;
    end if;
 end if;
 ARMJournal_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ARMJRNLREP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ARMJRNLREP',
 aVERB=>'CREATEROW',  aThe_Resource=>aARMJRNLREPid,aLogInstanceID=>aInstanceID);
 insert into   ARMJRNLREP
 (  ARMJRNLREPID 
,ParentStructRowID
,repname

,TheReport

 ) values ( aARMJRNLREPID 
,aParentStructRowID
,arepname

,aTheReport

 ); 
 ARMJRNLREP_SINIT( aCURSESSION,aARMJRNLREPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ARMJRNLREP_PARENT /*Отчеты из журнала*/ (
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
  select ParentStructRowID into aParentID  from ARMJRNLREP where  ARMJRNLREPid=aRowID;
  aParentTable := 'ARMJournal';
 end; 


procedure ARMJRNLREP_ISLOCKED /*Отчеты из журнала*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ARMJRNLREP where ARMJRNLREPid=aRowID;
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
  ARMJRNLREP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZwp.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ARMJRNLREP_LOCK /*Отчеты из журнала*/ (
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
 ARMJRNLREP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ARMJRNLREP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ARMJRNLREP where ARMJRNLREPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ARMJRNLREP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ARMJRNLREP set LockUserID =auserID ,LockSessionID =null where ARMJRNLREPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ARMJRNLREP set LockUserID =null,LockSessionID =aCURSESSION  where ARMJRNLREPid=aRowID;
     return;
   end if;
 end ;


procedure ARMJRNLREP_HCL /*Отчеты из журнала*/ (
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


procedure ARMJRNLREP_UNLOCK /*Отчеты из журнала*/ (
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
 ARMJRNLREP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ARMJRNLREP set LockUserID =null  where ARMJRNLREPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ARMJRNLREP set LockSessionID =null  where ARMJRNLREPid=aRowID;
     return;
   end if;
 end; 


procedure ARMJRNLREP_SINIT /*Отчеты из журнала*/ (
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
 select  SecurityStyleID into atmpID from ARMJRNLREP where ARMJRNLREPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ARMJRNLREP');
    return;
  end if;
if aSecurityStyleID is null then
 ARMJRNLREP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ARMJRNLREP set securitystyleid =aStyleID where ARMJRNLREPid = aRowID;
else 
 update ARMJRNLREP set securitystyleid =aSecurityStyleID where ARMJRNLREPid = aRowID;
end if; 
end ; 


procedure ARMJRNLREP_propagate /*Отчеты из журнала*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ARMJRNLREP where ARMJRNLREPid=aRowid;
end;



procedure ARMJRNLRUN_BRIEF  (
 aCURSESSION CHAR,
 aARMJRNLRUNid CHAR,
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
if aARMJRNLRUNid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ARMJRNLRUN where ARMJRNLRUNID=aARMJRNLRUNID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ARMJRNLRUN where ARMJRNLRUNid=aARMJRNLRUNID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ARMJRNLRUN');
    return;
  end if;
  aBRIEF:=func.ARMJRNLRUN_BRIEF_F(aARMJRNLRUNid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ARMJRNLRUN_DELETE /*Дополнительные действия в журнале*/ (
 aCURSESSION CHAR,
 aARMJRNLRUNid CHAR,
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
select count(*) into existsCnt from ARMJRNLRUN where ARMJRNLRUNID=aARMJRNLRUNID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ARMJRNLRUN where ARMJRNLRUNid=aARMJRNLRUNID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ARMJRNLRUN',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ARMJRNLRUN');
      return;
    end if;
  end if;
 --  verify lock  --
 ARMJRNLRUN_ISLOCKED( acursession=>acursession,aROWID=>aARMJRNLRUNid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ARMJRNLRUN');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ARMJRNLRUN',
 aVERB=>'DELETEROW',  aThe_Resource=>aARMJRNLRUNid, aLogInstanceID=>aInstanceID);
declare cursor chld_ARMJRNLRUN is select  instanceid ID from instance where OwnerPartName ='ARMJRNLRUN' and OwnerRowID=aARMJRNLRUNid;
row_ARMJRNLRUN  chld_ARMJRNLRUN%ROWTYPE;
begin
--open chld_ARMJRNLRUN;
for row_ARMJRNLRUN in chld_ARMJRNLRUN loop
 Kernel.INSTANCE_OWNER (acursession,row_ARMJRNLRUN.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ARMJRNLRUN.id);
end loop;
--close chld_ARMJRNLRUN;
end ;
  delete from  ARMJRNLRUN 
  where  ARMJRNLRUNID = aARMJRNLRUNID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Действия*/
procedure ARMJRNLRUN_SAVE /*Дополнительные действия в журнале*/ (
 aCURSESSION CHAR,
 aARMJRNLRUNid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aTheExtention CHAR/* Расширение *//* Расширение */
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
select count(*) into existsCnt from ARMJRNLRUN where ARMJRNLRUNID=aARMJRNLRUNID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ARMJRNLRUN where ARMJRNLRUNid=aARMJRNLRUNID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ARMJRNLRUN',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ARMJRNLRUN');
      return;
    end if;
  end if;
 --  verify lock  --
 ARMJRNLRUN_ISLOCKED( acursession=>acursession,aROWID=>aARMJRNLRUNid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ARMJRNLRUN');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ARMJRNLRUN',
 aVERB=>'EDITROW',  aThe_Resource=>aARMJRNLRUNid,aLogInstanceID=>aInstanceID);
 update  ARMJRNLRUN set ChangeStamp=sysdate
,
  Name=aName
,
  TheExtention=aTheExtention
  where  ARMJRNLRUNID = aARMJRNLRUNID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from ARMJournal where ARMJournalid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ARMJRNLRUN',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ARMJRNLRUN');
      return;
    end if;
 end if;
 ARMJournal_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ARMJRNLRUN');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ARMJRNLRUN',
 aVERB=>'CREATEROW',  aThe_Resource=>aARMJRNLRUNid,aLogInstanceID=>aInstanceID);
 insert into   ARMJRNLRUN
 (  ARMJRNLRUNID 
,ParentStructRowID
,Name

,TheExtention

 ) values ( aARMJRNLRUNID 
,aParentStructRowID
,aName

,aTheExtention

 ); 
 ARMJRNLRUN_SINIT( aCURSESSION,aARMJRNLRUNid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ARMJRNLRUN_PARENT /*Дополнительные действия в журнале*/ (
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
  select ParentStructRowID into aParentID  from ARMJRNLRUN where  ARMJRNLRUNid=aRowID;
  aParentTable := 'ARMJournal';
 end; 


procedure ARMJRNLRUN_ISLOCKED /*Дополнительные действия в журнале*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ARMJRNLRUN where ARMJRNLRUNid=aRowID;
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
  ARMJRNLRUN_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZwp.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ARMJRNLRUN_LOCK /*Дополнительные действия в журнале*/ (
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
 ARMJRNLRUN_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ARMJRNLRUN_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ARMJRNLRUN where ARMJRNLRUNid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ARMJRNLRUN');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ARMJRNLRUN set LockUserID =auserID ,LockSessionID =null where ARMJRNLRUNid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ARMJRNLRUN set LockUserID =null,LockSessionID =aCURSESSION  where ARMJRNLRUNid=aRowID;
     return;
   end if;
 end ;


procedure ARMJRNLRUN_HCL /*Дополнительные действия в журнале*/ (
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


procedure ARMJRNLRUN_UNLOCK /*Дополнительные действия в журнале*/ (
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
 ARMJRNLRUN_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ARMJRNLRUN set LockUserID =null  where ARMJRNLRUNid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ARMJRNLRUN set LockSessionID =null  where ARMJRNLRUNid=aRowID;
     return;
   end if;
 end; 


procedure ARMJRNLRUN_SINIT /*Дополнительные действия в журнале*/ (
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
 select  SecurityStyleID into atmpID from ARMJRNLRUN where ARMJRNLRUNid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ARMJRNLRUN');
    return;
  end if;
if aSecurityStyleID is null then
 ARMJRNLRUN_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ARMJRNLRUN set securitystyleid =aStyleID where ARMJRNLRUNid = aRowID;
else 
 update ARMJRNLRUN set securitystyleid =aSecurityStyleID where ARMJRNLRUNid = aRowID;
end if; 
end ; 


procedure ARMJRNLRUN_propagate /*Дополнительные действия в журнале*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ARMJRNLRUN where ARMJRNLRUNid=aRowid;
end;


end MTZwp;

/



