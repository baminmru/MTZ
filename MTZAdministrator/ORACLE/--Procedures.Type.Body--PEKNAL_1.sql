
/* --PEKNAL*/

 create or replace package body PEKNAL as

procedure PEKNAL_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKNAL'
then
declare cursor child_PEKNAL_DEF is select PEKNAL_DEF.PEKNAL_DEFid ID from PEKNAL_DEF where  PEKNAL_DEF.InstanceID = ainstanceid;
row_PEKNAL_DEF  child_PEKNAL_DEF%ROWTYPE;
begin
--open child_PEKNAL_DEF;
for row_PEKNAL_DEF in child_PEKNAL_DEF loop
 PEKNAL_DEF_DELETE (acursession,row_PEKNAL_DEF.id,aInstanceID);
end loop;
--close child_PEKNAL_DEF;
end;
declare cursor child_PEKNAL_PZ is select PEKNAL_PZ.PEKNAL_PZid ID from PEKNAL_PZ where  PEKNAL_PZ.InstanceID = ainstanceid;
row_PEKNAL_PZ  child_PEKNAL_PZ%ROWTYPE;
begin
--open child_PEKNAL_PZ;
for row_PEKNAL_PZ in child_PEKNAL_PZ loop
 PEKNAL_PZ_DELETE (acursession,row_PEKNAL_PZ.id,aInstanceID);
end loop;
--close child_PEKNAL_PZ;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKNAL_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKNAL'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKNAL_DEF is select PEKNAL_DEF.PEKNAL_DEFid ID from PEKNAL_DEF where  PEKNAL_DEF.InstanceID = arowid;
ROW_PEKNAL_DEF  lch_PEKNAL_DEF%ROWTYPE;
begin
--open lch_PEKNAL_DEF;
for row_PEKNAL_DEF in lch_PEKNAL_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKNAL_DEF where PEKNAL_DEFid=row_PEKNAL_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKNAL_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKNAL_DEF;
     return;
   end if; 
 end if; 
 PEKNAL_DEF_HCL (acursession,ROW_PEKNAL_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKNAL_DEF;
   return;
 end if;
 end loop;
--close lch_PEKNAL_DEF;
end;
declare cursor lch_PEKNAL_PZ is select PEKNAL_PZ.PEKNAL_PZid ID from PEKNAL_PZ where  PEKNAL_PZ.InstanceID = arowid;
ROW_PEKNAL_PZ  lch_PEKNAL_PZ%ROWTYPE;
begin
--open lch_PEKNAL_PZ;
for row_PEKNAL_PZ in lch_PEKNAL_PZ loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKNAL_PZ where PEKNAL_PZid=row_PEKNAL_PZ.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKNAL_PZ;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKNAL_PZ;
     return;
   end if; 
 end if; 
 PEKNAL_PZ_HCL (acursession,ROW_PEKNAL_PZ.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKNAL_PZ;
   return;
 end if;
 end loop;
--close lch_PEKNAL_PZ;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKNAL_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKNAL'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKNAL_DEF is select PEKNAL_DEF.PEKNAL_DEFid id from PEKNAL_DEF where  PEKNAL_DEF.InstanceID = arowid;
row_PEKNAL_DEF  pch_PEKNAL_DEF%ROWTYPE;
begin
--open pch_PEKNAL_DEF;
for row_PEKNAL_DEF in  pch_PEKNAL_DEF loop
 PEKNAL_DEF_SINIT( acursession,row_PEKNAL_DEF.id,assid);
 PEKNAL_DEF_propagate( acursession,row_PEKNAL_DEF.id);
end loop;
--close pch_PEKNAL_DEF;
end;
declare cursor pch_PEKNAL_PZ is select PEKNAL_PZ.PEKNAL_PZid id from PEKNAL_PZ where  PEKNAL_PZ.InstanceID = arowid;
row_PEKNAL_PZ  pch_PEKNAL_PZ%ROWTYPE;
begin
--open pch_PEKNAL_PZ;
for row_PEKNAL_PZ in  pch_PEKNAL_PZ loop
 PEKNAL_PZ_SINIT( acursession,row_PEKNAL_PZ.id,assid);
 PEKNAL_PZ_propagate( acursession,row_PEKNAL_PZ.id);
end loop;
--close pch_PEKNAL_PZ;
end;
 end if; 
end;



procedure PEKNAL_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKNAL_DEFid CHAR,
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
if aPEKNAL_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKNAL_DEF where PEKNAL_DEFID=aPEKNAL_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKNAL_DEF where PEKNAL_DEFid=aPEKNAL_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKNAL_DEF');
    return;
  end if;
  aBRIEF:=func.PEKNAL_DEF_BRIEF_F(aPEKNAL_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKNAL_DEF_DELETE /*Раздел описывает факт наличной оплаты*/ (
 aCURSESSION CHAR,
 aPEKNAL_DEFid CHAR,
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
select count(*) into existsCnt from PEKNAL_DEF where PEKNAL_DEFID=aPEKNAL_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKNAL_DEF where PEKNAL_DEFid=aPEKNAL_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKNAL_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKNAL_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKNAL_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKNAL_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKNAL_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKNAL_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKNAL_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKNAL_DEF is select  instanceid ID from instance where OwnerPartName ='PEKNAL_DEF' and OwnerRowID=aPEKNAL_DEFid;
row_PEKNAL_DEF  chld_PEKNAL_DEF%ROWTYPE;
begin
--open chld_PEKNAL_DEF;
for row_PEKNAL_DEF in chld_PEKNAL_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKNAL_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKNAL_DEF.id);
end loop;
--close chld_PEKNAL_DEF;
end ;
  delete from  PEKNAL_DEF 
  where  PEKNAL_DEFID = aPEKNAL_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание*/
procedure PEKNAL_DEF_SAVE /*Раздел описывает факт наличной оплаты*/ (
 aCURSESSION CHAR,
 aPEKNAL_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR := null /* Организация *//* Организация */
,aTheNumber
 VARCHAR2 := null /* Номер *//* Номер */
,aTheDate
 DATE/* Дата оплаты *//* Дата оплаты */
,aTheSumm
 NUMBER/* Сумма оплаты *//* Сумма оплаты */
,aThePEKZ CHAR := null /* Заявка *//* Заявка */
,aTheDept CHAR/* Из подразделения *//* Из подразделения */
,aFromClient CHAR := null /* От клиента *//* От клиента */
,aTheComment VARCHAR2 := null /* Назнаение платежа *//* Назнаение платежа */
,aRceivedBy CHAR := null /* Кто получил *//* Кто получил */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
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
select count(*) into existsCnt from PEKNAL_DEF where PEKNAL_DEFID=aPEKNAL_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKNAL_DEF where PEKNAL_DEFid=aPEKNAL_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKNAL_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKNAL_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKNAL_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKNAL_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKNAL_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKNAL_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKNAL_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKNAL_DEF set ChangeStamp=sysdate
,
  ORG=aORG
,
  TheNumber=aTheNumber
,
  TheDate=aTheDate
,
  TheSumm=aTheSumm
,
  ThePEKZ=aThePEKZ
,
  TheDept=aTheDept
,
  FromClient=aFromClient
,
  TheComment=aTheComment
,
  RceivedBy=aRceivedBy
,
  Code1C=aCode1C
  where  PEKNAL_DEFID = aPEKNAL_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKNAL_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKNAL_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKNAL_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKNAL_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKNAL_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKNAL_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKNAL_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKNAL_DEF
 (  PEKNAL_DEFID 
,InstanceID
,ORG

,TheNumber

,TheDate

,TheSumm

,ThePEKZ

,TheDept

,FromClient

,TheComment

,RceivedBy

,Code1C

 ) values ( aPEKNAL_DEFID 
,aInstanceID
,aORG

,aTheNumber

,aTheDate

,aTheSumm

,aThePEKZ

,aTheDept

,aFromClient

,aTheComment

,aRceivedBy

,aCode1C

 ); 
 PEKNAL_DEF_SINIT( aCURSESSION,aPEKNAL_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKNAL_DEF_PARENT /*Раздел описывает факт наличной оплаты*/ (
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
  select  INSTANCEID into aParentID from PEKNAL_DEF where  PEKNAL_DEFid=aRowID;
 end; 


procedure PEKNAL_DEF_ISLOCKED /*Раздел описывает факт наличной оплаты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKNAL_DEF where PEKNAL_DEFid=aRowID;
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
  PEKNAL_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKNAL.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKNAL_DEF_LOCK /*Раздел описывает факт наличной оплаты*/ (
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
 PEKNAL_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKNAL_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKNAL_DEF where PEKNAL_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKNAL_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKNAL_DEF set LockUserID =auserID ,LockSessionID =null where PEKNAL_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKNAL_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKNAL_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKNAL_DEF_HCL /*Раздел описывает факт наличной оплаты*/ (
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


procedure PEKNAL_DEF_UNLOCK /*Раздел описывает факт наличной оплаты*/ (
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
 PEKNAL_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKNAL_DEF set LockUserID =null  where PEKNAL_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKNAL_DEF set LockSessionID =null  where PEKNAL_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKNAL_DEF_SINIT /*Раздел описывает факт наличной оплаты*/ (
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
 select  SecurityStyleID into atmpID from PEKNAL_DEF where PEKNAL_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKNAL_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKNAL_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKNAL_DEF set securitystyleid =aStyleID where PEKNAL_DEFid = aRowID;
else 
 update PEKNAL_DEF set securitystyleid =aSecurityStyleID where PEKNAL_DEFid = aRowID;
end if; 
end ; 


procedure PEKNAL_DEF_propagate /*Раздел описывает факт наличной оплаты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKNAL_DEF where PEKNAL_DEFid=aRowid;
end;



procedure PEKNAL_PZ_BRIEF  (
 aCURSESSION CHAR,
 aPEKNAL_PZid CHAR,
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
if aPEKNAL_PZid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKNAL_PZ where PEKNAL_PZID=aPEKNAL_PZID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKNAL_PZ where PEKNAL_PZid=aPEKNAL_PZID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKNAL_PZ');
    return;
  end if;
  aBRIEF:=func.PEKNAL_PZ_BRIEF_F(aPEKNAL_PZid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKNAL_PZ_DELETE /*Привязка оплаты к заявкам*/ (
 aCURSESSION CHAR,
 aPEKNAL_PZid CHAR,
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
select count(*) into existsCnt from PEKNAL_PZ where PEKNAL_PZID=aPEKNAL_PZID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKNAL_PZ where PEKNAL_PZid=aPEKNAL_PZID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKNAL_PZ',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKNAL_PZ');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKNAL_PZ_ISLOCKED( acursession=>acursession,aROWID=>aPEKNAL_PZid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKNAL_PZ');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKNAL_PZ',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKNAL_PZid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKNAL_PZ is select  instanceid ID from instance where OwnerPartName ='PEKNAL_PZ' and OwnerRowID=aPEKNAL_PZid;
row_PEKNAL_PZ  chld_PEKNAL_PZ%ROWTYPE;
begin
--open chld_PEKNAL_PZ;
for row_PEKNAL_PZ in chld_PEKNAL_PZ loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKNAL_PZ.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKNAL_PZ.id);
end loop;
--close chld_PEKNAL_PZ;
end ;
  delete from  PEKNAL_PZ 
  where  PEKNAL_PZID = aPEKNAL_PZID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Привязка к заявкам*/
procedure PEKNAL_PZ_SAVE /*Привязка оплаты к заявкам*/ (
 aCURSESSION CHAR,
 aPEKNAL_PZid CHAR,
aInstanceID CHAR 
,aPZ CHAR/* Заявка *//* Заявка */
,aTheSumm
 NUMBER/* Сумма *//* Сумма */
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
select count(*) into existsCnt from PEKNAL_PZ where PEKNAL_PZID=aPEKNAL_PZID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKNAL_PZ where PEKNAL_PZid=aPEKNAL_PZID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKNAL_PZ',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKNAL_PZ');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKNAL_PZ_ISLOCKED( acursession=>acursession,aROWID=>aPEKNAL_PZid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKNAL_PZ');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKNAL_PZ',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKNAL_PZid,aLogInstanceID=>aInstanceID);
 update  PEKNAL_PZ set ChangeStamp=sysdate
,
  PZ=aPZ
,
  TheSumm=aTheSumm
  where  PEKNAL_PZID = aPEKNAL_PZID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKNAL_PZ',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKNAL_PZ');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKNAL_PZ');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKNAL_PZ',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKNAL_PZid,aLogInstanceID=>aInstanceID);
 insert into   PEKNAL_PZ
 (  PEKNAL_PZID 
,InstanceID
,PZ

,TheSumm

 ) values ( aPEKNAL_PZID 
,aInstanceID
,aPZ

,aTheSumm

 ); 
 PEKNAL_PZ_SINIT( aCURSESSION,aPEKNAL_PZid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKNAL_PZ_PARENT /*Привязка оплаты к заявкам*/ (
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
  select  INSTANCEID into aParentID from PEKNAL_PZ where  PEKNAL_PZid=aRowID;
 end; 


procedure PEKNAL_PZ_ISLOCKED /*Привязка оплаты к заявкам*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKNAL_PZ where PEKNAL_PZid=aRowID;
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
  PEKNAL_PZ_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKNAL.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKNAL_PZ_LOCK /*Привязка оплаты к заявкам*/ (
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
 PEKNAL_PZ_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKNAL_PZ_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKNAL_PZ where PEKNAL_PZid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKNAL_PZ');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKNAL_PZ set LockUserID =auserID ,LockSessionID =null where PEKNAL_PZid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKNAL_PZ set LockUserID =null,LockSessionID =aCURSESSION  where PEKNAL_PZid=aRowID;
     return;
   end if;
 end ;


procedure PEKNAL_PZ_HCL /*Привязка оплаты к заявкам*/ (
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


procedure PEKNAL_PZ_UNLOCK /*Привязка оплаты к заявкам*/ (
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
 PEKNAL_PZ_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKNAL_PZ set LockUserID =null  where PEKNAL_PZid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKNAL_PZ set LockSessionID =null  where PEKNAL_PZid=aRowID;
     return;
   end if;
 end; 


procedure PEKNAL_PZ_SINIT /*Привязка оплаты к заявкам*/ (
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
 select  SecurityStyleID into atmpID from PEKNAL_PZ where PEKNAL_PZid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKNAL_PZ');
    return;
  end if;
if aSecurityStyleID is null then
 PEKNAL_PZ_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKNAL_PZ set securitystyleid =aStyleID where PEKNAL_PZid = aRowID;
else 
 update PEKNAL_PZ set securitystyleid =aSecurityStyleID where PEKNAL_PZid = aRowID;
end if; 
end ; 


procedure PEKNAL_PZ_propagate /*Привязка оплаты к заявкам*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKNAL_PZ where PEKNAL_PZid=aRowid;
end;


end PEKNAL;

/



