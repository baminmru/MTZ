
/* --PEKL*/

 create or replace package body PEKL as

procedure PEKL_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKL'
then
declare cursor child_PEKL_DEF is select PEKL_DEF.PEKL_DEFid ID from PEKL_DEF where  PEKL_DEF.InstanceID = ainstanceid;
row_PEKL_DEF  child_PEKL_DEF%ROWTYPE;
begin
--open child_PEKL_DEF;
for row_PEKL_DEF in child_PEKL_DEF loop
 PEKL_DEF_DELETE (acursession,row_PEKL_DEF.id,aInstanceID);
end loop;
--close child_PEKL_DEF;
end;
declare cursor child_PEKL_WDAY is select PEKL_WDAY.PEKL_WDAYid ID from PEKL_WDAY where  PEKL_WDAY.InstanceID = ainstanceid;
row_PEKL_WDAY  child_PEKL_WDAY%ROWTYPE;
begin
--open child_PEKL_WDAY;
for row_PEKL_WDAY in child_PEKL_WDAY loop
 PEKL_WDAY_DELETE (acursession,row_PEKL_WDAY.id,aInstanceID);
end loop;
--close child_PEKL_WDAY;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKL_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKL'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKL_DEF is select PEKL_DEF.PEKL_DEFid ID from PEKL_DEF where  PEKL_DEF.InstanceID = arowid;
ROW_PEKL_DEF  lch_PEKL_DEF%ROWTYPE;
begin
--open lch_PEKL_DEF;
for row_PEKL_DEF in lch_PEKL_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKL_DEF where PEKL_DEFid=row_PEKL_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKL_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKL_DEF;
     return;
   end if; 
 end if; 
 PEKL_DEF_HCL (acursession,ROW_PEKL_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKL_DEF;
   return;
 end if;
 end loop;
--close lch_PEKL_DEF;
end;
declare cursor lch_PEKL_WDAY is select PEKL_WDAY.PEKL_WDAYid ID from PEKL_WDAY where  PEKL_WDAY.InstanceID = arowid;
ROW_PEKL_WDAY  lch_PEKL_WDAY%ROWTYPE;
begin
--open lch_PEKL_WDAY;
for row_PEKL_WDAY in lch_PEKL_WDAY loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKL_WDAY where PEKL_WDAYid=row_PEKL_WDAY.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKL_WDAY;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKL_WDAY;
     return;
   end if; 
 end if; 
 PEKL_WDAY_HCL (acursession,ROW_PEKL_WDAY.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKL_WDAY;
   return;
 end if;
 end loop;
--close lch_PEKL_WDAY;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKL_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKL'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKL_DEF is select PEKL_DEF.PEKL_DEFid id from PEKL_DEF where  PEKL_DEF.InstanceID = arowid;
row_PEKL_DEF  pch_PEKL_DEF%ROWTYPE;
begin
--open pch_PEKL_DEF;
for row_PEKL_DEF in  pch_PEKL_DEF loop
 PEKL_DEF_SINIT( acursession,row_PEKL_DEF.id,assid);
 PEKL_DEF_propagate( acursession,row_PEKL_DEF.id);
end loop;
--close pch_PEKL_DEF;
end;
declare cursor pch_PEKL_WDAY is select PEKL_WDAY.PEKL_WDAYid id from PEKL_WDAY where  PEKL_WDAY.InstanceID = arowid;
row_PEKL_WDAY  pch_PEKL_WDAY%ROWTYPE;
begin
--open pch_PEKL_WDAY;
for row_PEKL_WDAY in  pch_PEKL_WDAY loop
 PEKL_WDAY_SINIT( acursession,row_PEKL_WDAY.id,assid);
 PEKL_WDAY_propagate( acursession,row_PEKL_WDAY.id);
end loop;
--close pch_PEKL_WDAY;
end;
 end if; 
end;



procedure PEKL_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKL_DEFid CHAR,
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
if aPEKL_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKL_DEF where PEKL_DEFID=aPEKL_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKL_DEF where PEKL_DEFid=aPEKL_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKL_DEF');
    return;
  end if;
  aBRIEF:=func.PEKL_DEF_BRIEF_F(aPEKL_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKL_DEF_DELETE /*Описание лимитов*/ (
 aCURSESSION CHAR,
 aPEKL_DEFid CHAR,
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
select count(*) into existsCnt from PEKL_DEF where PEKL_DEFID=aPEKL_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKL_DEF where PEKL_DEFid=aPEKL_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKL_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKL_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKL_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKL_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKL_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKL_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKL_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKL_DEF is select  instanceid ID from instance where OwnerPartName ='PEKL_DEF' and OwnerRowID=aPEKL_DEFid;
row_PEKL_DEF  chld_PEKL_DEF%ROWTYPE;
begin
--open chld_PEKL_DEF;
for row_PEKL_DEF in chld_PEKL_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKL_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKL_DEF.id);
end loop;
--close chld_PEKL_DEF;
end ;
  delete from  PEKL_DEF 
  where  PEKL_DEFID = aPEKL_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание лимитов*/
procedure PEKL_DEF_SAVE /*Описание лимитов*/ (
 aCURSESSION CHAR,
 aPEKL_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* Организация *//* Организация */
,aTheDep CHAR/* Филиал *//* Филиал */
,aFromDate
 DATE/* Начало действия *//* Начало действия */
,aToDate
 DATE := null /* Окончание действия *//* Окончание действия */
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
select count(*) into existsCnt from PEKL_DEF where PEKL_DEFID=aPEKL_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKL_DEF where PEKL_DEFid=aPEKL_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKL_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKL_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKL_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKL_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKL_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKL_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKL_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKL_DEF set ChangeStamp=sysdate
,
  ORG=aORG
,
  TheDep=aTheDep
,
  FromDate=aFromDate
,
  ToDate=aToDate
  where  PEKL_DEFID = aPEKL_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKL_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKL_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKL_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKL_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKL_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKL_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKL_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKL_DEF
 (  PEKL_DEFID 
,InstanceID
,ORG

,TheDep

,FromDate

,ToDate

 ) values ( aPEKL_DEFID 
,aInstanceID
,aORG

,aTheDep

,aFromDate

,aToDate

 ); 
 PEKL_DEF_SINIT( aCURSESSION,aPEKL_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKL_DEF_PARENT /*Описание лимитов*/ (
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
  select  INSTANCEID into aParentID from PEKL_DEF where  PEKL_DEFid=aRowID;
 end; 


procedure PEKL_DEF_ISLOCKED /*Описание лимитов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKL_DEF where PEKL_DEFid=aRowID;
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
  PEKL_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKL.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKL_DEF_LOCK /*Описание лимитов*/ (
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
 PEKL_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKL_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKL_DEF where PEKL_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKL_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKL_DEF set LockUserID =auserID ,LockSessionID =null where PEKL_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKL_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKL_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKL_DEF_HCL /*Описание лимитов*/ (
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


procedure PEKL_DEF_UNLOCK /*Описание лимитов*/ (
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
 PEKL_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKL_DEF set LockUserID =null  where PEKL_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKL_DEF set LockSessionID =null  where PEKL_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKL_DEF_SINIT /*Описание лимитов*/ (
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
 select  SecurityStyleID into atmpID from PEKL_DEF where PEKL_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKL_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKL_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKL_DEF set securitystyleid =aStyleID where PEKL_DEFid = aRowID;
else 
 update PEKL_DEF set securitystyleid =aSecurityStyleID where PEKL_DEFid = aRowID;
end if; 
end ; 


procedure PEKL_DEF_propagate /*Описание лимитов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKL_DEF where PEKL_DEFid=aRowid;
end;



procedure PEKL_WDAY_BRIEF  (
 aCURSESSION CHAR,
 aPEKL_WDAYid CHAR,
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
if aPEKL_WDAYid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKL_WDAY where PEKL_WDAYID=aPEKL_WDAYID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKL_WDAY where PEKL_WDAYid=aPEKL_WDAYID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKL_WDAY');
    return;
  end if;
  aBRIEF:=func.PEKL_WDAY_BRIEF_F(aPEKL_WDAYid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKL_WDAY_DELETE /*Стандартные лимиты*/ (
 aCURSESSION CHAR,
 aPEKL_WDAYid CHAR,
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
select count(*) into existsCnt from PEKL_WDAY where PEKL_WDAYID=aPEKL_WDAYID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKL_WDAY where PEKL_WDAYid=aPEKL_WDAYID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKL_WDAY',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKL_WDAY');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKL_WDAY_ISLOCKED( acursession=>acursession,aROWID=>aPEKL_WDAYid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKL_WDAY');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKL_WDAY',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKL_WDAYid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKL_WDAY is select  instanceid ID from instance where OwnerPartName ='PEKL_WDAY' and OwnerRowID=aPEKL_WDAYid;
row_PEKL_WDAY  chld_PEKL_WDAY%ROWTYPE;
begin
--open chld_PEKL_WDAY;
for row_PEKL_WDAY in chld_PEKL_WDAY loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKL_WDAY.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKL_WDAY.id);
end loop;
--close chld_PEKL_WDAY;
end ;
  delete from  PEKL_WDAY 
  where  PEKL_WDAYID = aPEKL_WDAYID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Стандартные лимиты*/
procedure PEKL_WDAY_SAVE /*Стандартные лимиты*/ (
 aCURSESSION CHAR,
 aPEKL_WDAYid CHAR,
aInstanceID CHAR 
,aTrain CHAR/* Поезд *//* Поезд */
,aGOTYPE CHAR := null /* Тип СГО *//* Тип СГО */
,aTheValue
 NUMBER := null /* Объем *//* Объем */
,aTheValueEDIZM CHAR := null /* Ед. изм. Объема *//* Ед. изм. Объема */
,aWeightValue
 NUMBER := null /* Вес *//* Вес */
,aWeightEDIZM CHAR := null /* Ед. изм. веса *//* Ед. изм. веса */
,athe_Description VARCHAR2 := null /* Описание *//* Описание */
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
select count(*) into existsCnt from PEKL_WDAY where PEKL_WDAYID=aPEKL_WDAYID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKL_WDAY where PEKL_WDAYid=aPEKL_WDAYID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKL_WDAY',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKL_WDAY');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKL_WDAY_ISLOCKED( acursession=>acursession,aROWID=>aPEKL_WDAYid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKL_WDAY');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKL_WDAY',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKL_WDAYid,aLogInstanceID=>aInstanceID);
 update  PEKL_WDAY set ChangeStamp=sysdate
,
  Train=aTrain
,
  GOTYPE=aGOTYPE
,
  TheValue=aTheValue
,
  TheValueEDIZM=aTheValueEDIZM
,
  WeightValue=aWeightValue
,
  WeightEDIZM=aWeightEDIZM
,
  the_Description=athe_Description
  where  PEKL_WDAYID = aPEKL_WDAYID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKL_WDAY',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKL_WDAY');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKL_WDAY');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKL_WDAY',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKL_WDAYid,aLogInstanceID=>aInstanceID);
 insert into   PEKL_WDAY
 (  PEKL_WDAYID 
,InstanceID
,Train

,GOTYPE

,TheValue

,TheValueEDIZM

,WeightValue

,WeightEDIZM

,the_Description

 ) values ( aPEKL_WDAYID 
,aInstanceID
,aTrain

,aGOTYPE

,aTheValue

,aTheValueEDIZM

,aWeightValue

,aWeightEDIZM

,athe_Description

 ); 
 PEKL_WDAY_SINIT( aCURSESSION,aPEKL_WDAYid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKL_WDAY_PARENT /*Стандартные лимиты*/ (
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
  select  INSTANCEID into aParentID from PEKL_WDAY where  PEKL_WDAYid=aRowID;
 end; 


procedure PEKL_WDAY_ISLOCKED /*Стандартные лимиты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKL_WDAY where PEKL_WDAYid=aRowID;
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
  PEKL_WDAY_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKL.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKL_WDAY_LOCK /*Стандартные лимиты*/ (
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
 PEKL_WDAY_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKL_WDAY_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKL_WDAY where PEKL_WDAYid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKL_WDAY');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKL_WDAY set LockUserID =auserID ,LockSessionID =null where PEKL_WDAYid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKL_WDAY set LockUserID =null,LockSessionID =aCURSESSION  where PEKL_WDAYid=aRowID;
     return;
   end if;
 end ;


procedure PEKL_WDAY_HCL /*Стандартные лимиты*/ (
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


procedure PEKL_WDAY_UNLOCK /*Стандартные лимиты*/ (
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
 PEKL_WDAY_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKL_WDAY set LockUserID =null  where PEKL_WDAYid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKL_WDAY set LockSessionID =null  where PEKL_WDAYid=aRowID;
     return;
   end if;
 end; 


procedure PEKL_WDAY_SINIT /*Стандартные лимиты*/ (
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
 select  SecurityStyleID into atmpID from PEKL_WDAY where PEKL_WDAYid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKL_WDAY');
    return;
  end if;
if aSecurityStyleID is null then
 PEKL_WDAY_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKL_WDAY set securitystyleid =aStyleID where PEKL_WDAYid = aRowID;
else 
 update PEKL_WDAY set securitystyleid =aSecurityStyleID where PEKL_WDAYid = aRowID;
end if; 
end ; 


procedure PEKL_WDAY_propagate /*Стандартные лимиты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKL_WDAY where PEKL_WDAYid=aRowid;
end;


end PEKL;

/



