
/* --MTZStateSrv*/

 create or replace package body MTZStateSrv as

procedure MTZStateSrv_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZStateSrv'
then
declare cursor child_StateAction is select StateAction.StateActionid ID from StateAction where  StateAction.InstanceID = ainstanceid;
row_StateAction  child_StateAction%ROWTYPE;
begin
--open child_StateAction;
for row_StateAction in child_StateAction loop
 StateAction_DELETE (acursession,row_StateAction.id,aInstanceID);
end loop;
--close child_StateAction;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZStateSrv_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZStateSrv'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_StateAction is select StateAction.StateActionid ID from StateAction where  StateAction.InstanceID = arowid;
ROW_StateAction  lch_StateAction%ROWTYPE;
begin
--open lch_StateAction;
for row_StateAction in lch_StateAction loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from StateAction where StateActionid=row_StateAction.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_StateAction;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_StateAction;
     return;
   end if; 
 end if; 
 StateAction_HCL (acursession,ROW_StateAction.id,aisLocked);
 if aisLocked >2 then
   close lch_StateAction;
   return;
 end if;
 end loop;
--close lch_StateAction;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZStateSrv_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZStateSrv'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_StateAction is select StateAction.StateActionid id from StateAction where  StateAction.InstanceID = arowid;
row_StateAction  pch_StateAction%ROWTYPE;
begin
--open pch_StateAction;
for row_StateAction in  pch_StateAction loop
 StateAction_SINIT( acursession,row_StateAction.id,assid);
 StateAction_propagate( acursession,row_StateAction.id);
end loop;
--close pch_StateAction;
end;
 end if; 
end;



procedure StateAction_BRIEF  (
 aCURSESSION CHAR,
 aStateActionid CHAR,
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
if aStateActionid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from StateAction where StateActionID=aStateActionID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from StateAction where StateActionid=aStateActionID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=StateAction');
    return;
  end if;
  aBRIEF:=func.StateAction_BRIEF_F(aStateActionid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure StateAction_DELETE /*Дейсвие при смене*/ (
 aCURSESSION CHAR,
 aStateActionid CHAR,
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
select count(*) into existsCnt from StateAction where StateActionID=aStateActionID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from StateAction where StateActionid=aStateActionID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:StateAction',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=StateAction');
      return;
    end if;
  end if;
 --  verify lock  --
 StateAction_ISLOCKED( acursession=>acursession,aROWID=>aStateActionid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=StateAction');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'StateAction',
 aVERB=>'DELETEROW',  aThe_Resource=>aStateActionid, aLogInstanceID=>aInstanceID);
declare cursor chld_StateAction is select  instanceid ID from instance where OwnerPartName ='StateAction' and OwnerRowID=aStateActionid;
row_StateAction  chld_StateAction%ROWTYPE;
begin
--open chld_StateAction;
for row_StateAction in chld_StateAction loop
 Kernel.INSTANCE_OWNER (acursession,row_StateAction.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_StateAction.id);
end loop;
--close chld_StateAction;
end ;
  delete from  StateAction 
  where  StateActionID = aStateActionID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Дейсвие при смене*/
procedure StateAction_SAVE /*Дейсвие при смене*/ (
 aCURSESSION CHAR,
 aStateActionid CHAR,
aInstanceID CHAR 
,aOnDocStatus CHAR/* При входе в состояие *//* При входе в состояие */
,aNewSecurityStyle CHAR := null /* Установить стиль защиты *//* Установить стиль защиты */
,aClearSecurity
 NUMBER/* Сбросить стиль защиты *//* Сбросить стиль защиты */
,aLibraryFile
 VARCHAR2 := null /* Библиотека-обработчик *//* Библиотека-обработчик */
,aActionClass
 VARCHAR2 := null /* Класс для обработки *//* Класс для обработки */
,aActionScript VARCHAR2 := null /* Скрипт для исполнения *//* Скрипт для исполнения */
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
select count(*) into existsCnt from StateAction where StateActionID=aStateActionID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from StateAction where StateActionid=aStateActionID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:StateAction',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=StateAction');
      return;
    end if;
  end if;
 --  verify lock  --
 StateAction_ISLOCKED( acursession=>acursession,aROWID=>aStateActionid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=StateAction');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'StateAction',
 aVERB=>'EDITROW',  aThe_Resource=>aStateActionid,aLogInstanceID=>aInstanceID);
 update  StateAction set ChangeStamp=sysdate
,
  OnDocStatus=aOnDocStatus
,
  NewSecurityStyle=aNewSecurityStyle
,
  ClearSecurity=aClearSecurity
,
  LibraryFile=aLibraryFile
,
  ActionClass=aActionClass
,
  ActionScript=aActionScript
  where  StateActionID = aStateActionID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from StateAction where 1=1  
 and OnDocStatus=aOnDocStatus;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=StateAction');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:StateAction',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=StateAction');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=StateAction');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'StateAction',
 aVERB=>'CREATEROW',  aThe_Resource=>aStateActionid,aLogInstanceID=>aInstanceID);
 insert into   StateAction
 (  StateActionID 
,InstanceID
,OnDocStatus

,NewSecurityStyle

,ClearSecurity

,LibraryFile

,ActionClass

,ActionScript

 ) values ( aStateActionID 
,aInstanceID
,aOnDocStatus

,aNewSecurityStyle

,aClearSecurity

,aLibraryFile

,aActionClass

,aActionScript

 ); 
 StateAction_SINIT( aCURSESSION,aStateActionid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from StateAction where 1=1  
 and OnDocStatus=aOnDocStatus;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=StateAction');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure StateAction_PARENT /*Дейсвие при смене*/ (
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
  select  INSTANCEID into aParentID from StateAction where  StateActionid=aRowID;
 end; 


procedure StateAction_ISLOCKED /*Дейсвие при смене*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from StateAction where StateActionid=aRowID;
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
  StateAction_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZStateSrv.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure StateAction_LOCK /*Дейсвие при смене*/ (
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
 StateAction_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  StateAction_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from StateAction where StateActionid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=StateAction');
    return;
  end if;
   if  aLockMode =2  
   then   
    update StateAction set LockUserID =auserID ,LockSessionID =null where StateActionid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update StateAction set LockUserID =null,LockSessionID =aCURSESSION  where StateActionid=aRowID;
     return;
   end if;
 end ;


procedure StateAction_HCL /*Дейсвие при смене*/ (
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


procedure StateAction_UNLOCK /*Дейсвие при смене*/ (
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
 StateAction_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update StateAction set LockUserID =null  where StateActionid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update StateAction set LockSessionID =null  where StateActionid=aRowID;
     return;
   end if;
 end; 


procedure StateAction_SINIT /*Дейсвие при смене*/ (
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
 select  SecurityStyleID into atmpID from StateAction where StateActionid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =StateAction');
    return;
  end if;
if aSecurityStyleID is null then
 StateAction_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update StateAction set securitystyleid =aStyleID where StateActionid = aRowID;
else 
 update StateAction set securitystyleid =aSecurityStyleID where StateActionid = aRowID;
end if; 
end ; 


procedure StateAction_propagate /*Дейсвие при смене*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from StateAction where StateActionid=aRowid;
end;


end MTZStateSrv;

/



