
/* --PEKP*/

 create or replace package body PEKP as

procedure PEKP_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKP'
then
declare cursor child_PEKP_DEF is select PEKP_DEF.PEKP_DEFid ID from PEKP_DEF where  PEKP_DEF.InstanceID = ainstanceid;
row_PEKP_DEF  child_PEKP_DEF%ROWTYPE;
begin
--open child_PEKP_DEF;
for row_PEKP_DEF in child_PEKP_DEF loop
 PEKP_DEF_DELETE (acursession,row_PEKP_DEF.id,aInstanceID);
end loop;
--close child_PEKP_DEF;
end;
declare cursor child_PEKP_PZ is select PEKP_PZ.PEKP_PZid ID from PEKP_PZ where  PEKP_PZ.InstanceID = ainstanceid;
row_PEKP_PZ  child_PEKP_PZ%ROWTYPE;
begin
--open child_PEKP_PZ;
for row_PEKP_PZ in child_PEKP_PZ loop
 PEKP_PZ_DELETE (acursession,row_PEKP_PZ.id,aInstanceID);
end loop;
--close child_PEKP_PZ;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKP_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKP'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKP_DEF is select PEKP_DEF.PEKP_DEFid ID from PEKP_DEF where  PEKP_DEF.InstanceID = arowid;
ROW_PEKP_DEF  lch_PEKP_DEF%ROWTYPE;
begin
--open lch_PEKP_DEF;
for row_PEKP_DEF in lch_PEKP_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKP_DEF where PEKP_DEFid=row_PEKP_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKP_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKP_DEF;
     return;
   end if; 
 end if; 
 PEKP_DEF_HCL (acursession,ROW_PEKP_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKP_DEF;
   return;
 end if;
 end loop;
--close lch_PEKP_DEF;
end;
declare cursor lch_PEKP_PZ is select PEKP_PZ.PEKP_PZid ID from PEKP_PZ where  PEKP_PZ.InstanceID = arowid;
ROW_PEKP_PZ  lch_PEKP_PZ%ROWTYPE;
begin
--open lch_PEKP_PZ;
for row_PEKP_PZ in lch_PEKP_PZ loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKP_PZ where PEKP_PZid=row_PEKP_PZ.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKP_PZ;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKP_PZ;
     return;
   end if; 
 end if; 
 PEKP_PZ_HCL (acursession,ROW_PEKP_PZ.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKP_PZ;
   return;
 end if;
 end loop;
--close lch_PEKP_PZ;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKP_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKP'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKP_DEF is select PEKP_DEF.PEKP_DEFid id from PEKP_DEF where  PEKP_DEF.InstanceID = arowid;
row_PEKP_DEF  pch_PEKP_DEF%ROWTYPE;
begin
--open pch_PEKP_DEF;
for row_PEKP_DEF in  pch_PEKP_DEF loop
 PEKP_DEF_SINIT( acursession,row_PEKP_DEF.id,assid);
 PEKP_DEF_propagate( acursession,row_PEKP_DEF.id);
end loop;
--close pch_PEKP_DEF;
end;
declare cursor pch_PEKP_PZ is select PEKP_PZ.PEKP_PZid id from PEKP_PZ where  PEKP_PZ.InstanceID = arowid;
row_PEKP_PZ  pch_PEKP_PZ%ROWTYPE;
begin
--open pch_PEKP_PZ;
for row_PEKP_PZ in  pch_PEKP_PZ loop
 PEKP_PZ_SINIT( acursession,row_PEKP_PZ.id,assid);
 PEKP_PZ_propagate( acursession,row_PEKP_PZ.id);
end loop;
--close pch_PEKP_PZ;
end;
 end if; 
end;



procedure PEKP_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKP_DEFid CHAR,
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
if aPEKP_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKP_DEF where PEKP_DEFID=aPEKP_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKP_DEF where PEKP_DEFid=aPEKP_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKP_DEF');
    return;
  end if;
  aBRIEF:=func.PEKP_DEF_BRIEF_F(aPEKP_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKP_DEF_DELETE /*Описание платежа*/ (
 aCURSESSION CHAR,
 aPEKP_DEFid CHAR,
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
select count(*) into existsCnt from PEKP_DEF where PEKP_DEFID=aPEKP_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKP_DEF where PEKP_DEFid=aPEKP_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKP_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKP_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKP_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKP_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKP_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKP_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKP_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKP_DEF is select  instanceid ID from instance where OwnerPartName ='PEKP_DEF' and OwnerRowID=aPEKP_DEFid;
row_PEKP_DEF  chld_PEKP_DEF%ROWTYPE;
begin
--open chld_PEKP_DEF;
for row_PEKP_DEF in chld_PEKP_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKP_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKP_DEF.id);
end loop;
--close chld_PEKP_DEF;
end ;
  delete from  PEKP_DEF 
  where  PEKP_DEFID = aPEKP_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание платежа*/
procedure PEKP_DEF_SAVE /*Описание платежа*/ (
 aCURSESSION CHAR,
 aPEKP_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* Организация *//* Организация */
,aFromClient CHAR/* Клиент *//* Клиент */
,aPLPNUM
 VARCHAR2/* № документа *//* № документа */
,aPLPDate
 DATE := null /* Дата документа *//* Дата документа */
,aPLPSumm
 NUMBER := null /* Сумма *//* Сумма */
,aVOP CHAR := null /* Вид оплаты *//* Вид оплаты */
,aVP CHAR := null /* Вид платежа *//* Вид платежа */
,aTheCurrncy CHAR := null /* Валюта *//* Валюта */
,aTheComment VARCHAR2 := null /* Назначение платежа *//* Назначение платежа */
,aTheDogovor CHAR := null /* К договору *//* К договору */
,aTheDept CHAR := null /* Подразделение *//* Подразделение */
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
select count(*) into existsCnt from PEKP_DEF where PEKP_DEFID=aPEKP_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKP_DEF where PEKP_DEFid=aPEKP_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKP_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKP_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKP_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKP_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKP_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKP_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKP_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKP_DEF set ChangeStamp=sysdate
,
  ORG=aORG
,
  FromClient=aFromClient
,
  PLPNUM=aPLPNUM
,
  PLPDate=aPLPDate
,
  PLPSumm=aPLPSumm
,
  VOP=aVOP
,
  VP=aVP
,
  TheCurrncy=aTheCurrncy
,
  TheComment=aTheComment
,
  TheDogovor=aTheDogovor
,
  TheDept=aTheDept
,
  Code1C=aCode1C
  where  PEKP_DEFID = aPEKP_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKP_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKP_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKP_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKP_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKP_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKP_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKP_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKP_DEF
 (  PEKP_DEFID 
,InstanceID
,ORG

,FromClient

,PLPNUM

,PLPDate

,PLPSumm

,VOP

,VP

,TheCurrncy

,TheComment

,TheDogovor

,TheDept

,Code1C

 ) values ( aPEKP_DEFID 
,aInstanceID
,aORG

,aFromClient

,aPLPNUM

,aPLPDate

,aPLPSumm

,aVOP

,aVP

,aTheCurrncy

,aTheComment

,aTheDogovor

,aTheDept

,aCode1C

 ); 
 PEKP_DEF_SINIT( aCURSESSION,aPEKP_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKP_DEF_PARENT /*Описание платежа*/ (
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
  select  INSTANCEID into aParentID from PEKP_DEF where  PEKP_DEFid=aRowID;
 end; 


procedure PEKP_DEF_ISLOCKED /*Описание платежа*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKP_DEF where PEKP_DEFid=aRowID;
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
  PEKP_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKP.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKP_DEF_LOCK /*Описание платежа*/ (
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
 PEKP_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKP_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKP_DEF where PEKP_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKP_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKP_DEF set LockUserID =auserID ,LockSessionID =null where PEKP_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKP_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKP_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKP_DEF_HCL /*Описание платежа*/ (
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


procedure PEKP_DEF_UNLOCK /*Описание платежа*/ (
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
 PEKP_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKP_DEF set LockUserID =null  where PEKP_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKP_DEF set LockSessionID =null  where PEKP_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKP_DEF_SINIT /*Описание платежа*/ (
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
 select  SecurityStyleID into atmpID from PEKP_DEF where PEKP_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKP_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKP_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKP_DEF set securitystyleid =aStyleID where PEKP_DEFid = aRowID;
else 
 update PEKP_DEF set securitystyleid =aSecurityStyleID where PEKP_DEFid = aRowID;
end if; 
end ; 


procedure PEKP_DEF_propagate /*Описание платежа*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKP_DEF where PEKP_DEFid=aRowid;
end;



procedure PEKP_PZ_BRIEF  (
 aCURSESSION CHAR,
 aPEKP_PZid CHAR,
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
if aPEKP_PZid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKP_PZ where PEKP_PZID=aPEKP_PZID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKP_PZ where PEKP_PZid=aPEKP_PZID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKP_PZ');
    return;
  end if;
  aBRIEF:=func.PEKP_PZ_BRIEF_F(aPEKP_PZid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKP_PZ_DELETE /*привязка заявок к платежному поручению*/ (
 aCURSESSION CHAR,
 aPEKP_PZid CHAR,
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
select count(*) into existsCnt from PEKP_PZ where PEKP_PZID=aPEKP_PZID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKP_PZ where PEKP_PZid=aPEKP_PZID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKP_PZ',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKP_PZ');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKP_PZ_ISLOCKED( acursession=>acursession,aROWID=>aPEKP_PZid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKP_PZ');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKP_PZ',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKP_PZid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKP_PZ is select  instanceid ID from instance where OwnerPartName ='PEKP_PZ' and OwnerRowID=aPEKP_PZid;
row_PEKP_PZ  chld_PEKP_PZ%ROWTYPE;
begin
--open chld_PEKP_PZ;
for row_PEKP_PZ in chld_PEKP_PZ loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKP_PZ.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKP_PZ.id);
end loop;
--close chld_PEKP_PZ;
end ;
  delete from  PEKP_PZ 
  where  PEKP_PZID = aPEKP_PZID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Заявки к платежному поручению*/
procedure PEKP_PZ_SAVE /*привязка заявок к платежному поручению*/ (
 aCURSESSION CHAR,
 aPEKP_PZid CHAR,
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
select count(*) into existsCnt from PEKP_PZ where PEKP_PZID=aPEKP_PZID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKP_PZ where PEKP_PZid=aPEKP_PZID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKP_PZ',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKP_PZ');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKP_PZ_ISLOCKED( acursession=>acursession,aROWID=>aPEKP_PZid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKP_PZ');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKP_PZ',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKP_PZid,aLogInstanceID=>aInstanceID);
 update  PEKP_PZ set ChangeStamp=sysdate
,
  PZ=aPZ
,
  TheSumm=aTheSumm
  where  PEKP_PZID = aPEKP_PZID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKP_PZ',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKP_PZ');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKP_PZ');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKP_PZ',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKP_PZid,aLogInstanceID=>aInstanceID);
 insert into   PEKP_PZ
 (  PEKP_PZID 
,InstanceID
,PZ

,TheSumm

 ) values ( aPEKP_PZID 
,aInstanceID
,aPZ

,aTheSumm

 ); 
 PEKP_PZ_SINIT( aCURSESSION,aPEKP_PZid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKP_PZ_PARENT /*привязка заявок к платежному поручению*/ (
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
  select  INSTANCEID into aParentID from PEKP_PZ where  PEKP_PZid=aRowID;
 end; 


procedure PEKP_PZ_ISLOCKED /*привязка заявок к платежному поручению*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKP_PZ where PEKP_PZid=aRowID;
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
  PEKP_PZ_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKP.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKP_PZ_LOCK /*привязка заявок к платежному поручению*/ (
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
 PEKP_PZ_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKP_PZ_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKP_PZ where PEKP_PZid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKP_PZ');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKP_PZ set LockUserID =auserID ,LockSessionID =null where PEKP_PZid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKP_PZ set LockUserID =null,LockSessionID =aCURSESSION  where PEKP_PZid=aRowID;
     return;
   end if;
 end ;


procedure PEKP_PZ_HCL /*привязка заявок к платежному поручению*/ (
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


procedure PEKP_PZ_UNLOCK /*привязка заявок к платежному поручению*/ (
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
 PEKP_PZ_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKP_PZ set LockUserID =null  where PEKP_PZid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKP_PZ set LockSessionID =null  where PEKP_PZid=aRowID;
     return;
   end if;
 end; 


procedure PEKP_PZ_SINIT /*привязка заявок к платежному поручению*/ (
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
 select  SecurityStyleID into atmpID from PEKP_PZ where PEKP_PZid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKP_PZ');
    return;
  end if;
if aSecurityStyleID is null then
 PEKP_PZ_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKP_PZ set securitystyleid =aStyleID where PEKP_PZid = aRowID;
else 
 update PEKP_PZ set securitystyleid =aSecurityStyleID where PEKP_PZid = aRowID;
end if; 
end ; 


procedure PEKP_PZ_propagate /*привязка заявок к платежному поручению*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKP_PZ where PEKP_PZid=aRowid;
end;


end PEKP;

/



