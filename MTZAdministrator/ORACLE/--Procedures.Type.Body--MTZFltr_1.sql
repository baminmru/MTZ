
/* --MTZFltr*/

 create or replace package body MTZFltr as

procedure MTZFltr_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZFltr'
then
declare cursor child_FilterFieldGroup is select FilterFieldGroup.FilterFieldGroupid ID from FilterFieldGroup where  FilterFieldGroup.InstanceID = ainstanceid;
row_FilterFieldGroup  child_FilterFieldGroup%ROWTYPE;
begin
--open child_FilterFieldGroup;
for row_FilterFieldGroup in child_FilterFieldGroup loop
 FilterFieldGroup_DELETE (acursession,row_FilterFieldGroup.id,aInstanceID);
end loop;
--close child_FilterFieldGroup;
end;
declare cursor child_Filters is select Filters.Filtersid ID from Filters where  Filters.InstanceID = ainstanceid;
row_Filters  child_Filters%ROWTYPE;
begin
--open child_Filters;
for row_Filters in child_Filters loop
 Filters_DELETE (acursession,row_Filters.id,aInstanceID);
end loop;
--close child_Filters;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZFltr_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZFltr'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_FilterFieldGroup is select FilterFieldGroup.FilterFieldGroupid ID from FilterFieldGroup where  FilterFieldGroup.InstanceID = arowid;
ROW_FilterFieldGroup  lch_FilterFieldGroup%ROWTYPE;
begin
--open lch_FilterFieldGroup;
for row_FilterFieldGroup in lch_FilterFieldGroup loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from FilterFieldGroup where FilterFieldGroupid=row_FilterFieldGroup.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FilterFieldGroup;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_FilterFieldGroup;
     return;
   end if; 
 end if; 
 FilterFieldGroup_HCL (acursession,ROW_FilterFieldGroup.id,aisLocked);
 if aisLocked >2 then
   close lch_FilterFieldGroup;
   return;
 end if;
 end loop;
--close lch_FilterFieldGroup;
end;
declare cursor lch_Filters is select Filters.Filtersid ID from Filters where  Filters.InstanceID = arowid;
ROW_Filters  lch_Filters%ROWTYPE;
begin
--open lch_Filters;
for row_Filters in lch_Filters loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from Filters where Filtersid=row_Filters.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_Filters;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_Filters;
     return;
   end if; 
 end if; 
 Filters_HCL (acursession,ROW_Filters.id,aisLocked);
 if aisLocked >2 then
   close lch_Filters;
   return;
 end if;
 end loop;
--close lch_Filters;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZFltr_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZFltr'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_FilterFieldGroup is select FilterFieldGroup.FilterFieldGroupid id from FilterFieldGroup where  FilterFieldGroup.InstanceID = arowid;
row_FilterFieldGroup  pch_FilterFieldGroup%ROWTYPE;
begin
--open pch_FilterFieldGroup;
for row_FilterFieldGroup in  pch_FilterFieldGroup loop
 FilterFieldGroup_SINIT( acursession,row_FilterFieldGroup.id,assid);
 FilterFieldGroup_propagate( acursession,row_FilterFieldGroup.id);
end loop;
--close pch_FilterFieldGroup;
end;
declare cursor pch_Filters is select Filters.Filtersid id from Filters where  Filters.InstanceID = arowid;
row_Filters  pch_Filters%ROWTYPE;
begin
--open pch_Filters;
for row_Filters in  pch_Filters loop
 Filters_SINIT( acursession,row_Filters.id,assid);
 Filters_propagate( acursession,row_Filters.id);
end loop;
--close pch_Filters;
end;
 end if; 
end;



procedure FilterFieldGroup_BRIEF  (
 aCURSESSION CHAR,
 aFilterFieldGroupid CHAR,
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
if aFilterFieldGroupid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FilterFieldGroup where FilterFieldGroupID=aFilterFieldGroupID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FilterFieldGroup where FilterFieldGroupid=aFilterFieldGroupID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FilterFieldGroup');
    return;
  end if;
  aBRIEF:=func.FilterFieldGroup_BRIEF_F(aFilterFieldGroupid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FilterFieldGroup_DELETE /*Группа полей фильтра*/ (
 aCURSESSION CHAR,
 aFilterFieldGroupid CHAR,
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
select count(*) into existsCnt from FilterFieldGroup where FilterFieldGroupID=aFilterFieldGroupID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FilterFieldGroup where FilterFieldGroupid=aFilterFieldGroupID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FilterFieldGroup',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=FilterFieldGroup');
      return;
    end if;
  end if;
 --  verify lock  --
 FilterFieldGroup_ISLOCKED( acursession=>acursession,aROWID=>aFilterFieldGroupid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=FilterFieldGroup');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_FileterField is select FileterField.FileterFieldid ID from FileterField where  FileterField.ParentStructRowID = aFilterFieldGroupid;
    child_FileterField_rec  child_FileterField%ROWTYPE;
    begin
    --open child_FileterField;
      for child_FileterField_rec in child_FileterField loop
      FileterField_DELETE (acursession,child_FileterField_rec.id,aInstanceid);
      end loop;
      --close child_FileterField;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FilterFieldGroup',
 aVERB=>'DELETEROW',  aThe_Resource=>aFilterFieldGroupid, aLogInstanceID=>aInstanceID);
declare cursor chld_FilterFieldGroup is select  instanceid ID from instance where OwnerPartName ='FilterFieldGroup' and OwnerRowID=aFilterFieldGroupid;
row_FilterFieldGroup  chld_FilterFieldGroup%ROWTYPE;
begin
--open chld_FilterFieldGroup;
for row_FilterFieldGroup in chld_FilterFieldGroup loop
 Kernel.INSTANCE_OWNER (acursession,row_FilterFieldGroup.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FilterFieldGroup.id);
end loop;
--close chld_FilterFieldGroup;
end ;
  delete from  FilterFieldGroup 
  where  FilterFieldGroupID = aFilterFieldGroupID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Группа полей фильтра*/
procedure FilterFieldGroup_SAVE /*Группа полей фильтра*/ (
 aCURSESSION CHAR,
 aFilterFieldGroupid CHAR,
aInstanceID CHAR 
,asequence
 NUMBER/* Последовательность *//* Последовательность */
,aName
 VARCHAR2/* Название *//* Название */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
,aAllowIgnore
 NUMBER/* Можно отключать *//* Можно отключать */
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
select count(*) into existsCnt from FilterFieldGroup where FilterFieldGroupID=aFilterFieldGroupID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FilterFieldGroup where FilterFieldGroupid=aFilterFieldGroupID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FilterFieldGroup',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=FilterFieldGroup');
      return;
    end if;
  end if;
 --  verify lock  --
 FilterFieldGroup_ISLOCKED( acursession=>acursession,aROWID=>aFilterFieldGroupid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=FilterFieldGroup');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FilterFieldGroup',
 aVERB=>'EDITROW',  aThe_Resource=>aFilterFieldGroupid,aLogInstanceID=>aInstanceID);
 update  FilterFieldGroup set ChangeStamp=sysdate
,
  sequence=asequence
,
  Name=aName
,
  Caption=aCaption
,
  AllowIgnore=aAllowIgnore
  where  FilterFieldGroupID = aFilterFieldGroupID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FilterFieldGroup',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=FilterFieldGroup');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=FilterFieldGroup');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FilterFieldGroup',
 aVERB=>'CREATEROW',  aThe_Resource=>aFilterFieldGroupid,aLogInstanceID=>aInstanceID);
 insert into   FilterFieldGroup
 (  FilterFieldGroupID 
,InstanceID
,sequence

,Name

,Caption

,AllowIgnore

 ) values ( aFilterFieldGroupID 
,aInstanceID
,asequence

,aName

,aCaption

,aAllowIgnore

 ); 
 FilterFieldGroup_SINIT( aCURSESSION,aFilterFieldGroupid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure FilterFieldGroup_PARENT /*Группа полей фильтра*/ (
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
  select  INSTANCEID into aParentID from FilterFieldGroup where  FilterFieldGroupid=aRowID;
 end; 


procedure FilterFieldGroup_ISLOCKED /*Группа полей фильтра*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FilterFieldGroup where FilterFieldGroupid=aRowID;
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
  FilterFieldGroup_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZFltr.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FilterFieldGroup_LOCK /*Группа полей фильтра*/ (
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
 FilterFieldGroup_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  FilterFieldGroup_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FilterFieldGroup where FilterFieldGroupid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=FilterFieldGroup');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FilterFieldGroup set LockUserID =auserID ,LockSessionID =null where FilterFieldGroupid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FilterFieldGroup set LockUserID =null,LockSessionID =aCURSESSION  where FilterFieldGroupid=aRowID;
     return;
   end if;
 end ;


procedure FilterFieldGroup_HCL /*Группа полей фильтра*/ (
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
declare cursor lch_FileterField is select FileterField.FileterFieldid ID from FileterField where  FileterField.ParentStructRowID = aRowid;
row_FileterField lch_FileterField%ROWTYPE;
begin  
--open lch_FileterField;
for row_FileterField in lch_FileterField
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from FileterField where FileterFieldid=row_FileterField.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_FileterField;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_FileterField;
     return;
   end if; 
 end if;  
 FileterField_HCL (acursession,row_FileterField.id,aisLocked);
 if aisLocked >2 then
   close lch_FileterField;
   return;
 end if;
end loop;
--close lch_FileterField;
end;
aIsLocked :=0;
end;


procedure FilterFieldGroup_UNLOCK /*Группа полей фильтра*/ (
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
 FilterFieldGroup_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FilterFieldGroup set LockUserID =null  where FilterFieldGroupid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FilterFieldGroup set LockSessionID =null  where FilterFieldGroupid=aRowID;
     return;
   end if;
 end; 


procedure FilterFieldGroup_SINIT /*Группа полей фильтра*/ (
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
 select  SecurityStyleID into atmpID from FilterFieldGroup where FilterFieldGroupid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =FilterFieldGroup');
    return;
  end if;
if aSecurityStyleID is null then
 FilterFieldGroup_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FilterFieldGroup set securitystyleid =aStyleID where FilterFieldGroupid = aRowID;
else 
 update FilterFieldGroup set securitystyleid =aSecurityStyleID where FilterFieldGroupid = aRowID;
end if; 
end ; 


procedure FilterFieldGroup_propagate /*Группа полей фильтра*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FilterFieldGroup where FilterFieldGroupid=aRowid;
declare cursor pch_FileterField  is select FileterField.FileterFieldid ID from FileterField where  FileterField.ParentStructRowID = aRowid;
row_FileterField  pch_FileterField%ROWTYPE;
begin
--open pch_FileterField;
for row_FileterField in pch_FileterField loop
   FileterField_SINIT( acursession,row_FileterField.id,assid);
   FileterField_propagate( acursession,row_FileterField.id);
end loop;
--close pch_FileterField;
end;
end;



procedure FileterField_BRIEF  (
 aCURSESSION CHAR,
 aFileterFieldid CHAR,
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
if aFileterFieldid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from FileterField where FileterFieldID=aFileterFieldID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from FileterField where FileterFieldid=aFileterFieldID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=FileterField');
    return;
  end if;
  aBRIEF:=func.FileterField_BRIEF_F(aFileterFieldid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure FileterField_DELETE /*Поле фильтра*/ (
 aCURSESSION CHAR,
 aFileterFieldid CHAR,
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
select count(*) into existsCnt from FileterField where FileterFieldID=aFileterFieldID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from FileterField where FileterFieldid=aFileterFieldID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:FileterField',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=FileterField');
      return;
    end if;
  end if;
 --  verify lock  --
 FileterField_ISLOCKED( acursession=>acursession,aROWID=>aFileterFieldid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=FileterField');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'FileterField',
 aVERB=>'DELETEROW',  aThe_Resource=>aFileterFieldid, aLogInstanceID=>aInstanceID);
declare cursor chld_FileterField is select  instanceid ID from instance where OwnerPartName ='FileterField' and OwnerRowID=aFileterFieldid;
row_FileterField  chld_FileterField%ROWTYPE;
begin
--open chld_FileterField;
for row_FileterField in chld_FileterField loop
 Kernel.INSTANCE_OWNER (acursession,row_FileterField.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_FileterField.id);
end loop;
--close chld_FileterField;
end ;
  delete from  FileterField 
  where  FileterFieldID = aFileterFieldID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Поле фильтра*/
procedure FileterField_SAVE /*Поле фильтра*/ (
 aCURSESSION CHAR,
 aFileterFieldid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,asequence
 NUMBER/* Последовательность *//* Последовательность */
,aName
 VARCHAR2/* Название *//* Название */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
,aFieldType CHAR/* Тип поля *//* Тип поля */
,aFieldSize
 NUMBER := null /* Размер *//* Размер */
,aRefType
 NUMBER := null /* Тип ссылки *//* Тип ссылки */
,aRefToType CHAR := null /* Тип, куда ссылаемся *//* Тип, куда ссылаемся */
,aRefToPart CHAR := null /* Раздел, куда ссылаемся *//* Раздел, куда ссылаемся */
,aValueArray
 NUMBER := null /* Массив значений *//* Массив значений */
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
select count(*) into existsCnt from FileterField where FileterFieldID=aFileterFieldID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from FileterField where FileterFieldid=aFileterFieldID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:FileterField',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=FileterField');
      return;
    end if;
  end if;
 --  verify lock  --
 FileterField_ISLOCKED( acursession=>acursession,aROWID=>aFileterFieldid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=FileterField');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FileterField',
 aVERB=>'EDITROW',  aThe_Resource=>aFileterFieldid,aLogInstanceID=>aInstanceID);
 update  FileterField set ChangeStamp=sysdate
,
  sequence=asequence
,
  Name=aName
,
  Caption=aCaption
,
  FieldType=aFieldType
,
  FieldSize=aFieldSize
,
  RefType=aRefType
,
  RefToType=aRefToType
,
  RefToPart=aRefToPart
,
  ValueArray=aValueArray
  where  FileterFieldID = aFileterFieldID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from FilterFieldGroup where FilterFieldGroupid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:FileterField',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=FileterField');
      return;
    end if;
 end if;
 FilterFieldGroup_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=FileterField');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'FileterField',
 aVERB=>'CREATEROW',  aThe_Resource=>aFileterFieldid,aLogInstanceID=>aInstanceID);
 insert into   FileterField
 (  FileterFieldID 
,ParentStructRowID
,sequence

,Name

,Caption

,FieldType

,FieldSize

,RefType

,RefToType

,RefToPart

,ValueArray

 ) values ( aFileterFieldID 
,aParentStructRowID
,asequence

,aName

,aCaption

,aFieldType

,aFieldSize

,aRefType

,aRefToType

,aRefToPart

,aValueArray

 ); 
 FileterField_SINIT( aCURSESSION,aFileterFieldid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure FileterField_PARENT /*Поле фильтра*/ (
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
  select ParentStructRowID into aParentID  from FileterField where  FileterFieldid=aRowID;
  aParentTable := 'FilterFieldGroup';
 end; 


procedure FileterField_ISLOCKED /*Поле фильтра*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from FileterField where FileterFieldid=aRowID;
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
  FileterField_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZFltr.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure FileterField_LOCK /*Поле фильтра*/ (
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
 FileterField_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  FileterField_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from FileterField where FileterFieldid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=FileterField');
    return;
  end if;
   if  aLockMode =2  
   then   
    update FileterField set LockUserID =auserID ,LockSessionID =null where FileterFieldid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update FileterField set LockUserID =null,LockSessionID =aCURSESSION  where FileterFieldid=aRowID;
     return;
   end if;
 end ;


procedure FileterField_HCL /*Поле фильтра*/ (
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


procedure FileterField_UNLOCK /*Поле фильтра*/ (
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
 FileterField_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update FileterField set LockUserID =null  where FileterFieldid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update FileterField set LockSessionID =null  where FileterFieldid=aRowID;
     return;
   end if;
 end; 


procedure FileterField_SINIT /*Поле фильтра*/ (
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
 select  SecurityStyleID into atmpID from FileterField where FileterFieldid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =FileterField');
    return;
  end if;
if aSecurityStyleID is null then
 FileterField_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update FileterField set securitystyleid =aStyleID where FileterFieldid = aRowID;
else 
 update FileterField set securitystyleid =aSecurityStyleID where FileterFieldid = aRowID;
end if; 
end ; 


procedure FileterField_propagate /*Поле фильтра*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from FileterField where FileterFieldid=aRowid;
end;



procedure Filters_BRIEF  (
 aCURSESSION CHAR,
 aFiltersid CHAR,
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
if aFiltersid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from Filters where FiltersID=aFiltersID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from Filters where Filtersid=aFiltersID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=Filters');
    return;
  end if;
  aBRIEF:=func.Filters_BRIEF_F(aFiltersid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure Filters_DELETE /*Фильтр*/ (
 aCURSESSION CHAR,
 aFiltersid CHAR,
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
select count(*) into existsCnt from Filters where FiltersID=aFiltersID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from Filters where Filtersid=aFiltersID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:Filters',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=Filters');
      return;
    end if;
  end if;
 --  verify lock  --
 Filters_ISLOCKED( acursession=>acursession,aROWID=>aFiltersid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=Filters');
    return;
  end if;
  --begin tran--  
 -- erase child items --
declare cursor chld_Filters is select  instanceid ID from instance where OwnerPartName ='Filters' and OwnerRowID=aFiltersid;
row_Filters  chld_Filters%ROWTYPE;
begin
--open chld_Filters;
for row_Filters in chld_Filters loop
 Kernel.INSTANCE_OWNER (acursession,row_Filters.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_Filters.id);
end loop;
--close chld_Filters;
end ;
  delete from  Filters 
  where  FiltersID = aFiltersID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Фильтр*/
procedure Filters_SAVE /*Фильтр*/ (
 aCURSESSION CHAR,
 aFiltersid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aTheCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
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
select count(*) into existsCnt from Filters where FiltersID=aFiltersID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from Filters where Filtersid=aFiltersID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:Filters',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=Filters');
      return;
    end if;
  end if;
 --  verify lock  --
 Filters_ISLOCKED( acursession=>acursession,aROWID=>aFiltersid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Filters');
    return;
  end if;
 -- update row  --
 update  Filters set ChangeStamp=sysdate
,
  Name=aName
,
  TheCaption=aTheCaption
,
  TheComment=aTheComment
  where  FiltersID = aFiltersID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:Filters',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=Filters');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=Filters');
    return;
  end if;
select Count(*) into existsCnt from Filters where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <Filters>');
    return;
 End if;
 insert into   Filters
 (  FiltersID 
,InstanceID
,Name

,TheCaption

,TheComment

 ) values ( aFiltersID 
,aInstanceID
,aName

,aTheCaption

,aTheComment

 ); 
 Filters_SINIT( aCURSESSION,aFiltersid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure Filters_PARENT /*Фильтр*/ (
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
  select  INSTANCEID into aParentID from Filters where  Filtersid=aRowID;
 end; 


procedure Filters_ISLOCKED /*Фильтр*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from Filters where Filtersid=aRowID;
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
  Filters_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZFltr.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure Filters_LOCK /*Фильтр*/ (
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
 Filters_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  Filters_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from Filters where Filtersid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=Filters');
    return;
  end if;
   if  aLockMode =2  
   then   
    update Filters set LockUserID =auserID ,LockSessionID =null where Filtersid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update Filters set LockUserID =null,LockSessionID =aCURSESSION  where Filtersid=aRowID;
     return;
   end if;
 end ;


procedure Filters_HCL /*Фильтр*/ (
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


procedure Filters_UNLOCK /*Фильтр*/ (
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
 Filters_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update Filters set LockUserID =null  where Filtersid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update Filters set LockSessionID =null  where Filtersid=aRowID;
     return;
   end if;
 end; 


procedure Filters_SINIT /*Фильтр*/ (
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
 select  SecurityStyleID into atmpID from Filters where Filtersid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =Filters');
    return;
  end if;
if aSecurityStyleID is null then
 Filters_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update Filters set securitystyleid =aStyleID where Filtersid = aRowID;
else 
 update Filters set securitystyleid =aSecurityStyleID where Filtersid = aRowID;
end if; 
end ; 


procedure Filters_propagate /*Фильтр*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from Filters where Filtersid=aRowid;
end;


end MTZFltr;

/



