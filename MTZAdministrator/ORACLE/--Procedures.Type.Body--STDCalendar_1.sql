
/* --STDCalendar*/

 create or replace package body STDCalendar as

procedure STDCalendar_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='STDCalendar'
then
declare cursor child_CAL_DAYS is select CAL_DAYS.CAL_DAYSid ID from CAL_DAYS where  CAL_DAYS.InstanceID = ainstanceid;
row_CAL_DAYS  child_CAL_DAYS%ROWTYPE;
begin
--open child_CAL_DAYS;
for row_CAL_DAYS in child_CAL_DAYS loop
 CAL_DAYS_DELETE (acursession,row_CAL_DAYS.id,aInstanceID);
end loop;
--close child_CAL_DAYS;
end;
declare cursor child_CAL_HEAD is select CAL_HEAD.CAL_HEADid ID from CAL_HEAD where  CAL_HEAD.InstanceID = ainstanceid;
row_CAL_HEAD  child_CAL_HEAD%ROWTYPE;
begin
--open child_CAL_HEAD;
for row_CAL_HEAD in child_CAL_HEAD loop
 CAL_HEAD_DELETE (acursession,row_CAL_HEAD.id,aInstanceID);
end loop;
--close child_CAL_HEAD;
end;
return;
<<del_error>>
return;
end if;
end;
procedure STDCalendar_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'STDCalendar'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_CAL_DAYS is select CAL_DAYS.CAL_DAYSid ID from CAL_DAYS where  CAL_DAYS.InstanceID = arowid;
ROW_CAL_DAYS  lch_CAL_DAYS%ROWTYPE;
begin
--open lch_CAL_DAYS;
for row_CAL_DAYS in lch_CAL_DAYS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from CAL_DAYS where CAL_DAYSid=row_CAL_DAYS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_CAL_DAYS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_CAL_DAYS;
     return;
   end if; 
 end if; 
 CAL_DAYS_HCL (acursession,ROW_CAL_DAYS.id,aisLocked);
 if aisLocked >2 then
   close lch_CAL_DAYS;
   return;
 end if;
 end loop;
--close lch_CAL_DAYS;
end;
declare cursor lch_CAL_HEAD is select CAL_HEAD.CAL_HEADid ID from CAL_HEAD where  CAL_HEAD.InstanceID = arowid;
ROW_CAL_HEAD  lch_CAL_HEAD%ROWTYPE;
begin
--open lch_CAL_HEAD;
for row_CAL_HEAD in lch_CAL_HEAD loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from CAL_HEAD where CAL_HEADid=row_CAL_HEAD.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_CAL_HEAD;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_CAL_HEAD;
     return;
   end if; 
 end if; 
 CAL_HEAD_HCL (acursession,ROW_CAL_HEAD.id,aisLocked);
 if aisLocked >2 then
   close lch_CAL_HEAD;
   return;
 end if;
 end loop;
--close lch_CAL_HEAD;
end;
 end if;
aIsLocked:=0;
end;
procedure STDCalendar_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'STDCalendar'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_CAL_DAYS is select CAL_DAYS.CAL_DAYSid id from CAL_DAYS where  CAL_DAYS.InstanceID = arowid;
row_CAL_DAYS  pch_CAL_DAYS%ROWTYPE;
begin
--open pch_CAL_DAYS;
for row_CAL_DAYS in  pch_CAL_DAYS loop
 CAL_DAYS_SINIT( acursession,row_CAL_DAYS.id,assid);
 CAL_DAYS_propagate( acursession,row_CAL_DAYS.id);
end loop;
--close pch_CAL_DAYS;
end;
declare cursor pch_CAL_HEAD is select CAL_HEAD.CAL_HEADid id from CAL_HEAD where  CAL_HEAD.InstanceID = arowid;
row_CAL_HEAD  pch_CAL_HEAD%ROWTYPE;
begin
--open pch_CAL_HEAD;
for row_CAL_HEAD in  pch_CAL_HEAD loop
 CAL_HEAD_SINIT( acursession,row_CAL_HEAD.id,assid);
 CAL_HEAD_propagate( acursession,row_CAL_HEAD.id);
end loop;
--close pch_CAL_HEAD;
end;
 end if; 
end;



procedure CAL_DAYS_BRIEF  (
 aCURSESSION CHAR,
 aCAL_DAYSid CHAR,
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
if aCAL_DAYSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from CAL_DAYS where CAL_DAYSID=aCAL_DAYSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from CAL_DAYS where CAL_DAYSid=aCAL_DAYSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=CAL_DAYS');
    return;
  end if;
  aBRIEF:=func.CAL_DAYS_BRIEF_F(aCAL_DAYSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure CAL_DAYS_DELETE /*День календаря*/ (
 aCURSESSION CHAR,
 aCAL_DAYSid CHAR,
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
select count(*) into existsCnt from CAL_DAYS where CAL_DAYSID=aCAL_DAYSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from CAL_DAYS where CAL_DAYSid=aCAL_DAYSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:CAL_DAYS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=CAL_DAYS');
      return;
    end if;
  end if;
 --  verify lock  --
 CAL_DAYS_ISLOCKED( acursession=>acursession,aROWID=>aCAL_DAYSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=CAL_DAYS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_CAL_TIME is select CAL_TIME.CAL_TIMEid ID from CAL_TIME where  CAL_TIME.ParentStructRowID = aCAL_DAYSid;
    child_CAL_TIME_rec  child_CAL_TIME%ROWTYPE;
    begin
    --open child_CAL_TIME;
      for child_CAL_TIME_rec in child_CAL_TIME loop
      CAL_TIME_DELETE (acursession,child_CAL_TIME_rec.id,aInstanceid);
      end loop;
      --close child_CAL_TIME;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'CAL_DAYS',
 aVERB=>'DELETEROW',  aThe_Resource=>aCAL_DAYSid, aLogInstanceID=>aInstanceID);
declare cursor chld_CAL_DAYS is select  instanceid ID from instance where OwnerPartName ='CAL_DAYS' and OwnerRowID=aCAL_DAYSid;
row_CAL_DAYS  chld_CAL_DAYS%ROWTYPE;
begin
--open chld_CAL_DAYS;
for row_CAL_DAYS in chld_CAL_DAYS loop
 Kernel.INSTANCE_OWNER (acursession,row_CAL_DAYS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_CAL_DAYS.id);
end loop;
--close chld_CAL_DAYS;
end ;
  delete from  CAL_DAYS 
  where  CAL_DAYSID = aCAL_DAYSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Дни*/
procedure CAL_DAYS_SAVE /*День календаря*/ (
 aCURSESSION CHAR,
 aCAL_DAYSid CHAR,
aInstanceID CHAR 
,aTheDate
 DATE/* Дата *//* Дата */
,aIsHoliday
 NUMBER/* Выходной *//* Выходной */
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
select count(*) into existsCnt from CAL_DAYS where CAL_DAYSID=aCAL_DAYSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from CAL_DAYS where CAL_DAYSid=aCAL_DAYSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:CAL_DAYS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=CAL_DAYS');
      return;
    end if;
  end if;
 --  verify lock  --
 CAL_DAYS_ISLOCKED( acursession=>acursession,aROWID=>aCAL_DAYSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=CAL_DAYS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'CAL_DAYS',
 aVERB=>'EDITROW',  aThe_Resource=>aCAL_DAYSid,aLogInstanceID=>aInstanceID);
 update  CAL_DAYS set ChangeStamp=sysdate
,
  TheDate=aTheDate
,
  IsHoliday=aIsHoliday
  where  CAL_DAYSID = aCAL_DAYSID; 
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from CAL_DAYS where InstanceID=aInstanceID 
 and TheDate=aTheDate;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=CAL_DAYS');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:CAL_DAYS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=CAL_DAYS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=CAL_DAYS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'CAL_DAYS',
 aVERB=>'CREATEROW',  aThe_Resource=>aCAL_DAYSid,aLogInstanceID=>aInstanceID);
 insert into   CAL_DAYS
 (  CAL_DAYSID 
,InstanceID
,TheDate

,IsHoliday

 ) values ( aCAL_DAYSID 
,aInstanceID
,aTheDate

,aIsHoliday

 ); 
 CAL_DAYS_SINIT( aCURSESSION,aCAL_DAYSid,atmpid);
 -- checking unique constraints  --

 select Count(*) into aUniqueRowCount from CAL_DAYS where InstanceID=aInstanceID 
 and TheDate=aTheDate;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=CAL_DAYS');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure CAL_DAYS_PARENT /*День календаря*/ (
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
  select  INSTANCEID into aParentID from CAL_DAYS where  CAL_DAYSid=aRowID;
 end; 


procedure CAL_DAYS_ISLOCKED /*День календаря*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from CAL_DAYS where CAL_DAYSid=aRowID;
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
  CAL_DAYS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDCalendar.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure CAL_DAYS_LOCK /*День календаря*/ (
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
 CAL_DAYS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  CAL_DAYS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from CAL_DAYS where CAL_DAYSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=CAL_DAYS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update CAL_DAYS set LockUserID =auserID ,LockSessionID =null where CAL_DAYSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update CAL_DAYS set LockUserID =null,LockSessionID =aCURSESSION  where CAL_DAYSid=aRowID;
     return;
   end if;
 end ;


procedure CAL_DAYS_HCL /*День календаря*/ (
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
declare cursor lch_CAL_TIME is select CAL_TIME.CAL_TIMEid ID from CAL_TIME where  CAL_TIME.ParentStructRowID = aRowid;
row_CAL_TIME lch_CAL_TIME%ROWTYPE;
begin  
--open lch_CAL_TIME;
for row_CAL_TIME in lch_CAL_TIME
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from CAL_TIME where CAL_TIMEid=row_CAL_TIME.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_CAL_TIME;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_CAL_TIME;
     return;
   end if; 
 end if;  
 CAL_TIME_HCL (acursession,row_CAL_TIME.id,aisLocked);
 if aisLocked >2 then
   close lch_CAL_TIME;
   return;
 end if;
end loop;
--close lch_CAL_TIME;
end;
aIsLocked :=0;
end;


procedure CAL_DAYS_UNLOCK /*День календаря*/ (
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
 CAL_DAYS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update CAL_DAYS set LockUserID =null  where CAL_DAYSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update CAL_DAYS set LockSessionID =null  where CAL_DAYSid=aRowID;
     return;
   end if;
 end; 


procedure CAL_DAYS_SINIT /*День календаря*/ (
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
 select  SecurityStyleID into atmpID from CAL_DAYS where CAL_DAYSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =CAL_DAYS');
    return;
  end if;
if aSecurityStyleID is null then
 CAL_DAYS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update CAL_DAYS set securitystyleid =aStyleID where CAL_DAYSid = aRowID;
else 
 update CAL_DAYS set securitystyleid =aSecurityStyleID where CAL_DAYSid = aRowID;
end if; 
end ; 


procedure CAL_DAYS_propagate /*День календаря*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from CAL_DAYS where CAL_DAYSid=aRowid;
declare cursor pch_CAL_TIME  is select CAL_TIME.CAL_TIMEid ID from CAL_TIME where  CAL_TIME.ParentStructRowID = aRowid;
row_CAL_TIME  pch_CAL_TIME%ROWTYPE;
begin
--open pch_CAL_TIME;
for row_CAL_TIME in pch_CAL_TIME loop
   CAL_TIME_SINIT( acursession,row_CAL_TIME.id,assid);
   CAL_TIME_propagate( acursession,row_CAL_TIME.id);
end loop;
--close pch_CAL_TIME;
end;
end;



procedure CAL_TIME_BRIEF  (
 aCURSESSION CHAR,
 aCAL_TIMEid CHAR,
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
if aCAL_TIMEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from CAL_TIME where CAL_TIMEID=aCAL_TIMEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from CAL_TIME where CAL_TIMEid=aCAL_TIMEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=CAL_TIME');
    return;
  end if;
  aBRIEF:=func.CAL_TIME_BRIEF_F(aCAL_TIMEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure CAL_TIME_DELETE /*Рабочее время в пределах дня*/ (
 aCURSESSION CHAR,
 aCAL_TIMEid CHAR,
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
select count(*) into existsCnt from CAL_TIME where CAL_TIMEID=aCAL_TIMEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from CAL_TIME where CAL_TIMEid=aCAL_TIMEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:CAL_TIME',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=CAL_TIME');
      return;
    end if;
  end if;
 --  verify lock  --
 CAL_TIME_ISLOCKED( acursession=>acursession,aROWID=>aCAL_TIMEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=CAL_TIME');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'CAL_TIME',
 aVERB=>'DELETEROW',  aThe_Resource=>aCAL_TIMEid, aLogInstanceID=>aInstanceID);
declare cursor chld_CAL_TIME is select  instanceid ID from instance where OwnerPartName ='CAL_TIME' and OwnerRowID=aCAL_TIMEid;
row_CAL_TIME  chld_CAL_TIME%ROWTYPE;
begin
--open chld_CAL_TIME;
for row_CAL_TIME in chld_CAL_TIME loop
 Kernel.INSTANCE_OWNER (acursession,row_CAL_TIME.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_CAL_TIME.id);
end loop;
--close chld_CAL_TIME;
end ;
  delete from  CAL_TIME 
  where  CAL_TIMEID = aCAL_TIMEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Рабочие часы*/
procedure CAL_TIME_SAVE /*Рабочее время в пределах дня*/ (
 aCURSESSION CHAR,
 aCAL_TIMEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aFromTime
 DATE/* Начало периода *//* Начало периода */
,aToTime
 DATE/* Конец периода *//* Конец периода */
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
select count(*) into existsCnt from CAL_TIME where CAL_TIMEID=aCAL_TIMEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from CAL_TIME where CAL_TIMEid=aCAL_TIMEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:CAL_TIME',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=CAL_TIME');
      return;
    end if;
  end if;
 --  verify lock  --
 CAL_TIME_ISLOCKED( acursession=>acursession,aROWID=>aCAL_TIMEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=CAL_TIME');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'CAL_TIME',
 aVERB=>'EDITROW',  aThe_Resource=>aCAL_TIMEid,aLogInstanceID=>aInstanceID);
 update  CAL_TIME set ChangeStamp=sysdate
,
  FromTime=aFromTime
,
  ToTime=aToTime
  where  CAL_TIMEID = aCAL_TIMEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from CAL_DAYS where CAL_DAYSid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:CAL_TIME',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=CAL_TIME');
      return;
    end if;
 end if;
 CAL_DAYS_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=CAL_TIME');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'CAL_TIME',
 aVERB=>'CREATEROW',  aThe_Resource=>aCAL_TIMEid,aLogInstanceID=>aInstanceID);
 insert into   CAL_TIME
 (  CAL_TIMEID 
,ParentStructRowID
,FromTime

,ToTime

 ) values ( aCAL_TIMEID 
,aParentStructRowID
,aFromTime

,aToTime

 ); 
 CAL_TIME_SINIT( aCURSESSION,aCAL_TIMEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure CAL_TIME_PARENT /*Рабочее время в пределах дня*/ (
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
  select ParentStructRowID into aParentID  from CAL_TIME where  CAL_TIMEid=aRowID;
  aParentTable := 'CAL_DAYS';
 end; 


procedure CAL_TIME_ISLOCKED /*Рабочее время в пределах дня*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from CAL_TIME where CAL_TIMEid=aRowID;
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
  CAL_TIME_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDCalendar.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure CAL_TIME_LOCK /*Рабочее время в пределах дня*/ (
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
 CAL_TIME_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  CAL_TIME_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from CAL_TIME where CAL_TIMEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=CAL_TIME');
    return;
  end if;
   if  aLockMode =2  
   then   
    update CAL_TIME set LockUserID =auserID ,LockSessionID =null where CAL_TIMEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update CAL_TIME set LockUserID =null,LockSessionID =aCURSESSION  where CAL_TIMEid=aRowID;
     return;
   end if;
 end ;


procedure CAL_TIME_HCL /*Рабочее время в пределах дня*/ (
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


procedure CAL_TIME_UNLOCK /*Рабочее время в пределах дня*/ (
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
 CAL_TIME_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update CAL_TIME set LockUserID =null  where CAL_TIMEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update CAL_TIME set LockSessionID =null  where CAL_TIMEid=aRowID;
     return;
   end if;
 end; 


procedure CAL_TIME_SINIT /*Рабочее время в пределах дня*/ (
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
 select  SecurityStyleID into atmpID from CAL_TIME where CAL_TIMEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =CAL_TIME');
    return;
  end if;
if aSecurityStyleID is null then
 CAL_TIME_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update CAL_TIME set securitystyleid =aStyleID where CAL_TIMEid = aRowID;
else 
 update CAL_TIME set securitystyleid =aSecurityStyleID where CAL_TIMEid = aRowID;
end if; 
end ; 


procedure CAL_TIME_propagate /*Рабочее время в пределах дня*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from CAL_TIME where CAL_TIMEid=aRowid;
end;



procedure CAL_HEAD_BRIEF  (
 aCURSESSION CHAR,
 aCAL_HEADid CHAR,
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
if aCAL_HEADid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from CAL_HEAD where CAL_HEADID=aCAL_HEADID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from CAL_HEAD where CAL_HEADid=aCAL_HEADID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=CAL_HEAD');
    return;
  end if;
  aBRIEF:=func.CAL_HEAD_BRIEF_F(aCAL_HEADid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure CAL_HEAD_DELETE /*Описание календаря*/ (
 aCURSESSION CHAR,
 aCAL_HEADid CHAR,
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
select count(*) into existsCnt from CAL_HEAD where CAL_HEADID=aCAL_HEADID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from CAL_HEAD where CAL_HEADid=aCAL_HEADID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:CAL_HEAD',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=CAL_HEAD');
      return;
    end if;
  end if;
 --  verify lock  --
 CAL_HEAD_ISLOCKED( acursession=>acursession,aROWID=>aCAL_HEADid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=CAL_HEAD');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'CAL_HEAD',
 aVERB=>'DELETEROW',  aThe_Resource=>aCAL_HEADid, aLogInstanceID=>aInstanceID);
declare cursor chld_CAL_HEAD is select  instanceid ID from instance where OwnerPartName ='CAL_HEAD' and OwnerRowID=aCAL_HEADid;
row_CAL_HEAD  chld_CAL_HEAD%ROWTYPE;
begin
--open chld_CAL_HEAD;
for row_CAL_HEAD in chld_CAL_HEAD loop
 Kernel.INSTANCE_OWNER (acursession,row_CAL_HEAD.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_CAL_HEAD.id);
end loop;
--close chld_CAL_HEAD;
end ;
  delete from  CAL_HEAD 
  where  CAL_HEADID = aCAL_HEADID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание*/
procedure CAL_HEAD_SAVE /*Описание календаря*/ (
 aCURSESSION CHAR,
 aCAL_HEADid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aFillStyle
 VARCHAR2 := null /* Вариант заполнения *//* Вариант заполнения */
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
select count(*) into existsCnt from CAL_HEAD where CAL_HEADID=aCAL_HEADID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from CAL_HEAD where CAL_HEADid=aCAL_HEADID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:CAL_HEAD',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=CAL_HEAD');
      return;
    end if;
  end if;
 --  verify lock  --
 CAL_HEAD_ISLOCKED( acursession=>acursession,aROWID=>aCAL_HEADid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=CAL_HEAD');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'CAL_HEAD',
 aVERB=>'EDITROW',  aThe_Resource=>aCAL_HEADid,aLogInstanceID=>aInstanceID);
 update  CAL_HEAD set ChangeStamp=sysdate
,
  Name=aName
,
  FillStyle=aFillStyle
  where  CAL_HEADID = aCAL_HEADID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:CAL_HEAD',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=CAL_HEAD');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=CAL_HEAD');
    return;
  end if;
select Count(*) into existsCnt from CAL_HEAD where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <CAL_HEAD>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'CAL_HEAD',
 aVERB=>'CREATEROW',  aThe_Resource=>aCAL_HEADid,aLogInstanceID=>aInstanceID);
 insert into   CAL_HEAD
 (  CAL_HEADID 
,InstanceID
,Name

,FillStyle

 ) values ( aCAL_HEADID 
,aInstanceID
,aName

,aFillStyle

 ); 
 CAL_HEAD_SINIT( aCURSESSION,aCAL_HEADid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure CAL_HEAD_PARENT /*Описание календаря*/ (
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
  select  INSTANCEID into aParentID from CAL_HEAD where  CAL_HEADid=aRowID;
 end; 


procedure CAL_HEAD_ISLOCKED /*Описание календаря*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from CAL_HEAD where CAL_HEADid=aRowID;
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
  CAL_HEAD_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin STDCalendar.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure CAL_HEAD_LOCK /*Описание календаря*/ (
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
 CAL_HEAD_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  CAL_HEAD_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from CAL_HEAD where CAL_HEADid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=CAL_HEAD');
    return;
  end if;
   if  aLockMode =2  
   then   
    update CAL_HEAD set LockUserID =auserID ,LockSessionID =null where CAL_HEADid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update CAL_HEAD set LockUserID =null,LockSessionID =aCURSESSION  where CAL_HEADid=aRowID;
     return;
   end if;
 end ;


procedure CAL_HEAD_HCL /*Описание календаря*/ (
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


procedure CAL_HEAD_UNLOCK /*Описание календаря*/ (
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
 CAL_HEAD_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update CAL_HEAD set LockUserID =null  where CAL_HEADid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update CAL_HEAD set LockSessionID =null  where CAL_HEADid=aRowID;
     return;
   end if;
 end; 


procedure CAL_HEAD_SINIT /*Описание календаря*/ (
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
 select  SecurityStyleID into atmpID from CAL_HEAD where CAL_HEADid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =CAL_HEAD');
    return;
  end if;
if aSecurityStyleID is null then
 CAL_HEAD_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update CAL_HEAD set securitystyleid =aStyleID where CAL_HEADid = aRowID;
else 
 update CAL_HEAD set securitystyleid =aSecurityStyleID where CAL_HEADid = aRowID;
end if; 
end ; 


procedure CAL_HEAD_propagate /*Описание календаря*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from CAL_HEAD where CAL_HEADid=aRowid;
end;


end STDCalendar;

/



