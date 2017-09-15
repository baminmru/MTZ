
/* --WFDic*/

 create or replace package body WFDic as

procedure WFDic_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='WFDic'
then
declare cursor child_WFDic_func is select WFDic_func.WFDic_funcid ID from WFDic_func where  WFDic_func.InstanceID = ainstanceid;
row_WFDic_func  child_WFDic_func%ROWTYPE;
begin
--open child_WFDic_func;
for row_WFDic_func in child_WFDic_func loop
 WFDic_func_DELETE (acursession,row_WFDic_func.id,aInstanceID);
end loop;
--close child_WFDic_func;
end;
return;
<<del_error>>
return;
end if;
end;
procedure WFDic_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'WFDic'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_WFDic_func is select WFDic_func.WFDic_funcid ID from WFDic_func where  WFDic_func.InstanceID = arowid;
ROW_WFDic_func  lch_WFDic_func%ROWTYPE;
begin
--open lch_WFDic_func;
for row_WFDic_func in lch_WFDic_func loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WFDic_func where WFDic_funcid=row_WFDic_func.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFDic_func;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WFDic_func;
     return;
   end if; 
 end if; 
 WFDic_func_HCL (acursession,ROW_WFDic_func.id,aisLocked);
 if aisLocked >2 then
   close lch_WFDic_func;
   return;
 end if;
 end loop;
--close lch_WFDic_func;
end;
 end if;
aIsLocked:=0;
end;
procedure WFDic_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'WFDic'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_WFDic_func is select WFDic_func.WFDic_funcid id from WFDic_func where  WFDic_func.InstanceID = arowid;
row_WFDic_func  pch_WFDic_func%ROWTYPE;
begin
--open pch_WFDic_func;
for row_WFDic_func in  pch_WFDic_func loop
 WFDic_func_SINIT( acursession,row_WFDic_func.id,assid);
 WFDic_func_propagate( acursession,row_WFDic_func.id);
end loop;
--close pch_WFDic_func;
end;
 end if; 
end;



procedure WFDic_func_BRIEF  (
 aCURSESSION CHAR,
 aWFDic_funcid CHAR,
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
if aWFDic_funcid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFDic_func where WFDic_funcID=aWFDic_funcID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFDic_func where WFDic_funcid=aWFDic_funcID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFDic_func');
    return;
  end if;
  aBRIEF:=func.WFDic_func_BRIEF_F(aWFDic_funcid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFDic_func_DELETE /*Описание функций, которые могут быть использованы 
при построении процесса*/ (
 aCURSESSION CHAR,
 aWFDic_funcid CHAR,
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
select count(*) into existsCnt from WFDic_func where WFDic_funcID=aWFDic_funcID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFDic_func where WFDic_funcid=aWFDic_funcID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFDic_func',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFDic_func');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDic_func_ISLOCKED( acursession=>acursession,aROWID=>aWFDic_funcid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFDic_func');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_WFDic_presets is select WFDic_presets.WFDic_presetsid ID from WFDic_presets where  WFDic_presets.ParentStructRowID = aWFDic_funcid;
    child_WFDic_presets_rec  child_WFDic_presets%ROWTYPE;
    begin
    --open child_WFDic_presets;
      for child_WFDic_presets_rec in child_WFDic_presets loop
      WFDic_presets_DELETE (acursession,child_WFDic_presets_rec.id,aInstanceid);
      end loop;
      --close child_WFDic_presets;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFDic_func',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFDic_funcid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFDic_func is select  instanceid ID from instance where OwnerPartName ='WFDic_func' and OwnerRowID=aWFDic_funcid;
row_WFDic_func  chld_WFDic_func%ROWTYPE;
begin
--open chld_WFDic_func;
for row_WFDic_func in chld_WFDic_func loop
 Kernel.INSTANCE_OWNER (acursession,row_WFDic_func.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFDic_func.id);
end loop;
--close chld_WFDic_func;
end ;
  delete from  WFDic_func 
  where  WFDic_funcID = aWFDic_funcID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Типы функций*/
procedure WFDic_func_SAVE /*Описание функций, которые могут быть использованы 
при построении процесса*/ (
 aCURSESSION CHAR,
 aWFDic_funcid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aStepClass
 NUMBER/* Тип *//* Тип */
,aIconName
 VARCHAR2/* Название иконки *//* Название иконки */
,aProgID
 VARCHAR2 := null /* COM класс *//* COM класс */
,aEdtMode
 VARCHAR2 := null /* Режим запуска *//* Режим запуска */
,aRTMProgID
 VARCHAR2 := null /* Класс режима исполнения *//* Класс режима исполнения */
,aIsMailStone
 NUMBER := null /* Это веха процесса *//* Это веха процесса */
,athe_Comment VARCHAR2 := null /* Примечание *//* Примечание */
,aIntegrationData1
 VARCHAR2 := null /* Даные для интеграции 1 *//* Даные для интеграции 1 */
,aIntegrationData2
 VARCHAR2 := null /* Даные для интеграции 2 *//* Даные для интеграции 2 */
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
select count(*) into existsCnt from WFDic_func where WFDic_funcID=aWFDic_funcID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFDic_func where WFDic_funcid=aWFDic_funcID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFDic_func',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFDic_func');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDic_func_ISLOCKED( acursession=>acursession,aROWID=>aWFDic_funcid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDic_func');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDic_func',
 aVERB=>'EDITROW',  aThe_Resource=>aWFDic_funcid,aLogInstanceID=>aInstanceID);
 update  WFDic_func set ChangeStamp=sysdate
,
  Name=aName
,
  StepClass=aStepClass
,
  IconName=aIconName
,
  ProgID=aProgID
,
  EdtMode=aEdtMode
,
  RTMProgID=aRTMProgID
,
  IsMailStone=aIsMailStone
,
  the_Comment=athe_Comment
,
  IntegrationData1=aIntegrationData1
,
  IntegrationData2=aIntegrationData2
  where  WFDic_funcID = aWFDic_funcID; 
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from WFDic_func where InstanceID=aInstanceID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=WFDic_func');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFDic_func',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFDic_func');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDic_func');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDic_func',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFDic_funcid,aLogInstanceID=>aInstanceID);
 insert into   WFDic_func
 (  WFDic_funcID 
,InstanceID
,Name

,StepClass

,IconName

,ProgID

,EdtMode

,RTMProgID

,IsMailStone

,the_Comment

,IntegrationData1

,IntegrationData2

 ) values ( aWFDic_funcID 
,aInstanceID
,aName

,aStepClass

,aIconName

,aProgID

,aEdtMode

,aRTMProgID

,aIsMailStone

,athe_Comment

,aIntegrationData1

,aIntegrationData2

 ); 
 WFDic_func_SINIT( aCURSESSION,aWFDic_funcid,atmpid);
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from WFDic_func where InstanceID=aInstanceID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=WFDic_func');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure WFDic_func_PARENT /*Описание функций, которые могут быть использованы 
при построении процесса*/ (
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
  select  INSTANCEID into aParentID from WFDic_func where  WFDic_funcid=aRowID;
 end; 


procedure WFDic_func_ISLOCKED /*Описание функций, которые могут быть использованы 
при построении процесса*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFDic_func where WFDic_funcid=aRowID;
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
  WFDic_func_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFDic.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFDic_func_LOCK /*Описание функций, которые могут быть использованы 
при построении процесса*/ (
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
 WFDic_func_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFDic_func_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFDic_func where WFDic_funcid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFDic_func');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFDic_func set LockUserID =auserID ,LockSessionID =null where WFDic_funcid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFDic_func set LockUserID =null,LockSessionID =aCURSESSION  where WFDic_funcid=aRowID;
     return;
   end if;
 end ;


procedure WFDic_func_HCL /*Описание функций, которые могут быть использованы 
при построении процесса*/ (
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
declare cursor lch_WFDic_presets is select WFDic_presets.WFDic_presetsid ID from WFDic_presets where  WFDic_presets.ParentStructRowID = aRowid;
row_WFDic_presets lch_WFDic_presets%ROWTYPE;
begin  
--open lch_WFDic_presets;
for row_WFDic_presets in lch_WFDic_presets
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from WFDic_presets where WFDic_presetsid=row_WFDic_presets.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WFDic_presets;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_WFDic_presets;
     return;
   end if; 
 end if;  
 WFDic_presets_HCL (acursession,row_WFDic_presets.id,aisLocked);
 if aisLocked >2 then
   close lch_WFDic_presets;
   return;
 end if;
end loop;
--close lch_WFDic_presets;
end;
aIsLocked :=0;
end;


procedure WFDic_func_UNLOCK /*Описание функций, которые могут быть использованы 
при построении процесса*/ (
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
 WFDic_func_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFDic_func set LockUserID =null  where WFDic_funcid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFDic_func set LockSessionID =null  where WFDic_funcid=aRowID;
     return;
   end if;
 end; 


procedure WFDic_func_SINIT /*Описание функций, которые могут быть использованы 
при построении процесса*/ (
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
 select  SecurityStyleID into atmpID from WFDic_func where WFDic_funcid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFDic_func');
    return;
  end if;
if aSecurityStyleID is null then
 WFDic_func_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFDic_func set securitystyleid =aStyleID where WFDic_funcid = aRowID;
else 
 update WFDic_func set securitystyleid =aSecurityStyleID where WFDic_funcid = aRowID;
end if; 
end ; 


procedure WFDic_func_propagate /*Описание функций, которые могут быть использованы 
при построении процесса*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFDic_func where WFDic_funcid=aRowid;
declare cursor pch_WFDic_presets  is select WFDic_presets.WFDic_presetsid ID from WFDic_presets where  WFDic_presets.ParentStructRowID = aRowid;
row_WFDic_presets  pch_WFDic_presets%ROWTYPE;
begin
--open pch_WFDic_presets;
for row_WFDic_presets in pch_WFDic_presets loop
   WFDic_presets_SINIT( acursession,row_WFDic_presets.id,assid);
   WFDic_presets_propagate( acursession,row_WFDic_presets.id);
end loop;
--close pch_WFDic_presets;
end;
end;



procedure WFDic_presets_BRIEF  (
 aCURSESSION CHAR,
 aWFDic_presetsid CHAR,
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
if aWFDic_presetsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WFDic_presets where WFDic_presetsID=aWFDic_presetsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WFDic_presets where WFDic_presetsid=aWFDic_presetsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WFDic_presets');
    return;
  end if;
  aBRIEF:=func.WFDic_presets_BRIEF_F(aWFDic_presetsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WFDic_presets_DELETE /*Значения некоторых атрибутов  
могут быть зафиксированы*/ (
 aCURSESSION CHAR,
 aWFDic_presetsid CHAR,
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
select count(*) into existsCnt from WFDic_presets where WFDic_presetsID=aWFDic_presetsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WFDic_presets where WFDic_presetsid=aWFDic_presetsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WFDic_presets',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WFDic_presets');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDic_presets_ISLOCKED( acursession=>acursession,aROWID=>aWFDic_presetsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WFDic_presets');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WFDic_presets',
 aVERB=>'DELETEROW',  aThe_Resource=>aWFDic_presetsid, aLogInstanceID=>aInstanceID);
declare cursor chld_WFDic_presets is select  instanceid ID from instance where OwnerPartName ='WFDic_presets' and OwnerRowID=aWFDic_presetsid;
row_WFDic_presets  chld_WFDic_presets%ROWTYPE;
begin
--open chld_WFDic_presets;
for row_WFDic_presets in chld_WFDic_presets loop
 Kernel.INSTANCE_OWNER (acursession,row_WFDic_presets.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WFDic_presets.id);
end loop;
--close chld_WFDic_presets;
end ;
  delete from  WFDic_presets 
  where  WFDic_presetsID = aWFDic_presetsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Значения атрибутов по умолчанию*/
procedure WFDic_presets_SAVE /*Значения некоторых атрибутов  
могут быть зафиксированы*/ (
 aCURSESSION CHAR,
 aWFDic_presetsid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Имя атрибута *//* Имя атрибута */
,athe_Value
 VARCHAR2/* Значение *//* Значение */
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
select count(*) into existsCnt from WFDic_presets where WFDic_presetsID=aWFDic_presetsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WFDic_presets where WFDic_presetsid=aWFDic_presetsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WFDic_presets',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WFDic_presets');
      return;
    end if;
  end if;
 --  verify lock  --
 WFDic_presets_ISLOCKED( acursession=>acursession,aROWID=>aWFDic_presetsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDic_presets');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDic_presets',
 aVERB=>'EDITROW',  aThe_Resource=>aWFDic_presetsid,aLogInstanceID=>aInstanceID);
 update  WFDic_presets set ChangeStamp=sysdate
,
  Name=aName
,
  the_Value=athe_Value
  where  WFDic_presetsID = aWFDic_presetsID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from WFDic_presets where ParentStructRowID=aParentStructRowID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=WFDic_presets');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from WFDic_func where WFDic_funcid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WFDic_presets',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WFDic_presets');
      return;
    end if;
 end if;
 WFDic_func_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WFDic_presets');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WFDic_presets',
 aVERB=>'CREATEROW',  aThe_Resource=>aWFDic_presetsid,aLogInstanceID=>aInstanceID);
 insert into   WFDic_presets
 (  WFDic_presetsID 
,ParentStructRowID
,Name

,the_Value

 ) values ( aWFDic_presetsID 
,aParentStructRowID
,aName

,athe_Value

 ); 
 WFDic_presets_SINIT( aCURSESSION,aWFDic_presetsid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from WFDic_presets where ParentStructRowID=aParentStructRowID 
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=WFDic_presets');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure WFDic_presets_PARENT /*Значения некоторых атрибутов  
могут быть зафиксированы*/ (
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
  select ParentStructRowID into aParentID  from WFDic_presets where  WFDic_presetsid=aRowID;
  aParentTable := 'WFDic_func';
 end; 


procedure WFDic_presets_ISLOCKED /*Значения некоторых атрибутов  
могут быть зафиксированы*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WFDic_presets where WFDic_presetsid=aRowID;
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
  WFDic_presets_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WFDic.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WFDic_presets_LOCK /*Значения некоторых атрибутов  
могут быть зафиксированы*/ (
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
 WFDic_presets_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WFDic_presets_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WFDic_presets where WFDic_presetsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WFDic_presets');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WFDic_presets set LockUserID =auserID ,LockSessionID =null where WFDic_presetsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WFDic_presets set LockUserID =null,LockSessionID =aCURSESSION  where WFDic_presetsid=aRowID;
     return;
   end if;
 end ;


procedure WFDic_presets_HCL /*Значения некоторых атрибутов  
могут быть зафиксированы*/ (
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


procedure WFDic_presets_UNLOCK /*Значения некоторых атрибутов  
могут быть зафиксированы*/ (
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
 WFDic_presets_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WFDic_presets set LockUserID =null  where WFDic_presetsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WFDic_presets set LockSessionID =null  where WFDic_presetsid=aRowID;
     return;
   end if;
 end; 


procedure WFDic_presets_SINIT /*Значения некоторых атрибутов  
могут быть зафиксированы*/ (
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
 select  SecurityStyleID into atmpID from WFDic_presets where WFDic_presetsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WFDic_presets');
    return;
  end if;
if aSecurityStyleID is null then
 WFDic_presets_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WFDic_presets set securitystyleid =aStyleID where WFDic_presetsid = aRowID;
else 
 update WFDic_presets set securitystyleid =aSecurityStyleID where WFDic_presetsid = aRowID;
end if; 
end ; 


procedure WFDic_presets_propagate /*Значения некоторых атрибутов  
могут быть зафиксированы*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WFDic_presets where WFDic_presetsid=aRowid;
end;


end WFDic;

/



