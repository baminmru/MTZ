
/* --MTZ2JOB*/

 create or replace package body MTZ2JOB as

procedure MTZ2JOB_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='MTZ2JOB'
then
declare cursor child_MTZ2JOB_DEF is select MTZ2JOB_DEF.MTZ2JOB_DEFid ID from MTZ2JOB_DEF where  MTZ2JOB_DEF.InstanceID = ainstanceid;
row_MTZ2JOB_DEF  child_MTZ2JOB_DEF%ROWTYPE;
begin
--open child_MTZ2JOB_DEF;
for row_MTZ2JOB_DEF in child_MTZ2JOB_DEF loop
 MTZ2JOB_DEF_DELETE (acursession,row_MTZ2JOB_DEF.id,aInstanceID);
end loop;
--close child_MTZ2JOB_DEF;
end;
return;
<<del_error>>
return;
end if;
end;
procedure MTZ2JOB_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'MTZ2JOB'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_MTZ2JOB_DEF is select MTZ2JOB_DEF.MTZ2JOB_DEFid ID from MTZ2JOB_DEF where  MTZ2JOB_DEF.InstanceID = arowid;
ROW_MTZ2JOB_DEF  lch_MTZ2JOB_DEF%ROWTYPE;
begin
--open lch_MTZ2JOB_DEF;
for row_MTZ2JOB_DEF in lch_MTZ2JOB_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from MTZ2JOB_DEF where MTZ2JOB_DEFid=row_MTZ2JOB_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_MTZ2JOB_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_MTZ2JOB_DEF;
     return;
   end if; 
 end if; 
 MTZ2JOB_DEF_HCL (acursession,ROW_MTZ2JOB_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_MTZ2JOB_DEF;
   return;
 end if;
 end loop;
--close lch_MTZ2JOB_DEF;
end;
 end if;
aIsLocked:=0;
end;
procedure MTZ2JOB_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'MTZ2JOB'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_MTZ2JOB_DEF is select MTZ2JOB_DEF.MTZ2JOB_DEFid id from MTZ2JOB_DEF where  MTZ2JOB_DEF.InstanceID = arowid;
row_MTZ2JOB_DEF  pch_MTZ2JOB_DEF%ROWTYPE;
begin
--open pch_MTZ2JOB_DEF;
for row_MTZ2JOB_DEF in  pch_MTZ2JOB_DEF loop
 MTZ2JOB_DEF_SINIT( acursession,row_MTZ2JOB_DEF.id,assid);
 MTZ2JOB_DEF_propagate( acursession,row_MTZ2JOB_DEF.id);
end loop;
--close pch_MTZ2JOB_DEF;
end;
 end if; 
end;



procedure MTZ2JOB_DEF_BRIEF  (
 aCURSESSION CHAR,
 aMTZ2JOB_DEFid CHAR,
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
if aMTZ2JOB_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from MTZ2JOB_DEF where MTZ2JOB_DEFID=aMTZ2JOB_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from MTZ2JOB_DEF where MTZ2JOB_DEFid=aMTZ2JOB_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=MTZ2JOB_DEF');
    return;
  end if;
  aBRIEF:=func.MTZ2JOB_DEF_BRIEF_F(aMTZ2JOB_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure MTZ2JOB_DEF_DELETE /*Описание отложенного события*/ (
 aCURSESSION CHAR,
 aMTZ2JOB_DEFid CHAR,
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
select count(*) into existsCnt from MTZ2JOB_DEF where MTZ2JOB_DEFID=aMTZ2JOB_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from MTZ2JOB_DEF where MTZ2JOB_DEFid=aMTZ2JOB_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:MTZ2JOB_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=MTZ2JOB_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 MTZ2JOB_DEF_ISLOCKED( acursession=>acursession,aROWID=>aMTZ2JOB_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=MTZ2JOB_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'MTZ2JOB_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aMTZ2JOB_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_MTZ2JOB_DEF is select  instanceid ID from instance where OwnerPartName ='MTZ2JOB_DEF' and OwnerRowID=aMTZ2JOB_DEFid;
row_MTZ2JOB_DEF  chld_MTZ2JOB_DEF%ROWTYPE;
begin
--open chld_MTZ2JOB_DEF;
for row_MTZ2JOB_DEF in chld_MTZ2JOB_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_MTZ2JOB_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_MTZ2JOB_DEF.id);
end loop;
--close chld_MTZ2JOB_DEF;
end ;
  delete from  MTZ2JOB_DEF 
  where  MTZ2JOB_DEFID = aMTZ2JOB_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Отложенное событие*/
procedure MTZ2JOB_DEF_SAVE /*Описание отложенного события*/ (
 aCURSESSION CHAR,
 aMTZ2JOB_DEFid CHAR,
aInstanceID CHAR 
,aEventDate
 DATE/* Отложено до *//* Отложено до */
,aEvenType
 VARCHAR2/* Тип события *//* Тип события */
,aThruObject CHAR/* Объект - причина события *//* Объект - причина события */
,aThruState CHAR := null /* Состояние - причина *//* Состояние - причина */
,aNextState CHAR := null /* Состояние после обработки *//* Состояние после обработки */
,aProcessDate
 DATE := null /* Момент обработки *//* Момент обработки */
,aProcessed
 NUMBER/* Обработан *//* Обработан */
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
select count(*) into existsCnt from MTZ2JOB_DEF where MTZ2JOB_DEFID=aMTZ2JOB_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from MTZ2JOB_DEF where MTZ2JOB_DEFid=aMTZ2JOB_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:MTZ2JOB_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=MTZ2JOB_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 MTZ2JOB_DEF_ISLOCKED( acursession=>acursession,aROWID=>aMTZ2JOB_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=MTZ2JOB_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'MTZ2JOB_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aMTZ2JOB_DEFid,aLogInstanceID=>aInstanceID);
 update  MTZ2JOB_DEF set ChangeStamp=sysdate
,
  EventDate=aEventDate
,
  EvenType=aEvenType
,
  ThruObject=aThruObject
,
  ThruState=aThruState
,
  NextState=aNextState
,
  ProcessDate=aProcessDate
,
  Processed=aProcessed
  where  MTZ2JOB_DEFID = aMTZ2JOB_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:MTZ2JOB_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=MTZ2JOB_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=MTZ2JOB_DEF');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'MTZ2JOB_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aMTZ2JOB_DEFid,aLogInstanceID=>aInstanceID);
 insert into   MTZ2JOB_DEF
 (  MTZ2JOB_DEFID 
,InstanceID
,EventDate

,EvenType

,ThruObject

,ThruState

,NextState

,ProcessDate

,Processed

 ) values ( aMTZ2JOB_DEFID 
,aInstanceID
,aEventDate

,aEvenType

,aThruObject

,aThruState

,aNextState

,aProcessDate

,aProcessed

 ); 
 MTZ2JOB_DEF_SINIT( aCURSESSION,aMTZ2JOB_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure MTZ2JOB_DEF_PARENT /*Описание отложенного события*/ (
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
  select  INSTANCEID into aParentID from MTZ2JOB_DEF where  MTZ2JOB_DEFid=aRowID;
 end; 


procedure MTZ2JOB_DEF_ISLOCKED /*Описание отложенного события*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from MTZ2JOB_DEF where MTZ2JOB_DEFid=aRowID;
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
  MTZ2JOB_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin MTZ2JOB.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure MTZ2JOB_DEF_LOCK /*Описание отложенного события*/ (
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
 MTZ2JOB_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  MTZ2JOB_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from MTZ2JOB_DEF where MTZ2JOB_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=MTZ2JOB_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update MTZ2JOB_DEF set LockUserID =auserID ,LockSessionID =null where MTZ2JOB_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update MTZ2JOB_DEF set LockUserID =null,LockSessionID =aCURSESSION  where MTZ2JOB_DEFid=aRowID;
     return;
   end if;
 end ;


procedure MTZ2JOB_DEF_HCL /*Описание отложенного события*/ (
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


procedure MTZ2JOB_DEF_UNLOCK /*Описание отложенного события*/ (
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
 MTZ2JOB_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update MTZ2JOB_DEF set LockUserID =null  where MTZ2JOB_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update MTZ2JOB_DEF set LockSessionID =null  where MTZ2JOB_DEFid=aRowID;
     return;
   end if;
 end; 


procedure MTZ2JOB_DEF_SINIT /*Описание отложенного события*/ (
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
 select  SecurityStyleID into atmpID from MTZ2JOB_DEF where MTZ2JOB_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =MTZ2JOB_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 MTZ2JOB_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update MTZ2JOB_DEF set securitystyleid =aStyleID where MTZ2JOB_DEFid = aRowID;
else 
 update MTZ2JOB_DEF set securitystyleid =aSecurityStyleID where MTZ2JOB_DEFid = aRowID;
end if; 
end ; 


procedure MTZ2JOB_DEF_propagate /*Описание отложенного события*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from MTZ2JOB_DEF where MTZ2JOB_DEFid=aRowid;
end;


end MTZ2JOB;

/



