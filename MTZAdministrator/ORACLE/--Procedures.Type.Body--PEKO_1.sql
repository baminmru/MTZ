
/* --PEKO*/

 create or replace package body PEKO as

procedure PEKO_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKO'
then
declare cursor child_PEKO_DEF is select PEKO_DEF.PEKO_DEFid ID from PEKO_DEF where  PEKO_DEF.InstanceID = ainstanceid;
row_PEKO_DEF  child_PEKO_DEF%ROWTYPE;
begin
--open child_PEKO_DEF;
for row_PEKO_DEF in child_PEKO_DEF loop
 PEKO_DEF_DELETE (acursession,row_PEKO_DEF.id,aInstanceID);
end loop;
--close child_PEKO_DEF;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKO_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKO'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKO_DEF is select PEKO_DEF.PEKO_DEFid ID from PEKO_DEF where  PEKO_DEF.InstanceID = arowid;
ROW_PEKO_DEF  lch_PEKO_DEF%ROWTYPE;
begin
--open lch_PEKO_DEF;
for row_PEKO_DEF in lch_PEKO_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKO_DEF where PEKO_DEFid=row_PEKO_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKO_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKO_DEF;
     return;
   end if; 
 end if; 
 PEKO_DEF_HCL (acursession,ROW_PEKO_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKO_DEF;
   return;
 end if;
 end loop;
--close lch_PEKO_DEF;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKO_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKO'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKO_DEF is select PEKO_DEF.PEKO_DEFid id from PEKO_DEF where  PEKO_DEF.InstanceID = arowid;
row_PEKO_DEF  pch_PEKO_DEF%ROWTYPE;
begin
--open pch_PEKO_DEF;
for row_PEKO_DEF in  pch_PEKO_DEF loop
 PEKO_DEF_SINIT( acursession,row_PEKO_DEF.id,assid);
 PEKO_DEF_propagate( acursession,row_PEKO_DEF.id);
end loop;
--close pch_PEKO_DEF;
end;
 end if; 
end;



procedure PEKO_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKO_DEFid CHAR,
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
if aPEKO_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKO_DEF where PEKO_DEFID=aPEKO_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKO_DEF where PEKO_DEFid=aPEKO_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKO_DEF');
    return;
  end if;
  aBRIEF:=func.PEKO_DEF_BRIEF_F(aPEKO_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKO_DEF_DELETE /*Описание*/ (
 aCURSESSION CHAR,
 aPEKO_DEFid CHAR,
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
select count(*) into existsCnt from PEKO_DEF where PEKO_DEFID=aPEKO_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKO_DEF where PEKO_DEFid=aPEKO_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKO_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKO_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKO_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKO_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKO_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKO_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKO_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKO_DEF is select  instanceid ID from instance where OwnerPartName ='PEKO_DEF' and OwnerRowID=aPEKO_DEFid;
row_PEKO_DEF  chld_PEKO_DEF%ROWTYPE;
begin
--open chld_PEKO_DEF;
for row_PEKO_DEF in chld_PEKO_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKO_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKO_DEF.id);
end loop;
--close chld_PEKO_DEF;
end ;
  delete from  PEKO_DEF 
  where  PEKO_DEFID = aPEKO_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание*/
procedure PEKO_DEF_SAVE /*Описание*/ (
 aCURSESSION CHAR,
 aPEKO_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* Организация *//* Организация */
,aToClient CHAR/* Поставщик *//* Поставщик */
,aPLPNUM
 VARCHAR2/* № документа *//* № документа */
,aPLPDate
 DATE := null /* Дата документа *//* Дата документа */
,aPLPSumm
 NUMBER := null /* Сумма *//* Сумма */
,aVOP CHAR := null /* Вид оплаты *//* Вид оплаты */
,aVP CHAR := null /* Вид платежа *//* Вид платежа */
,aTheDept CHAR := null /* В счет филиала *//* В счет филиала */
,aTheComment VARCHAR2 := null /* Назначеие платежа *//* Назначеие платежа */
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
select count(*) into existsCnt from PEKO_DEF where PEKO_DEFID=aPEKO_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKO_DEF where PEKO_DEFid=aPEKO_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKO_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKO_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKO_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKO_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKO_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKO_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKO_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKO_DEF set ChangeStamp=sysdate
,
  ORG=aORG
,
  ToClient=aToClient
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
  TheDept=aTheDept
,
  TheComment=aTheComment
,
  Code1C=aCode1C
  where  PEKO_DEFID = aPEKO_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKO_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKO_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKO_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKO_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKO_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKO_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKO_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKO_DEF
 (  PEKO_DEFID 
,InstanceID
,ORG

,ToClient

,PLPNUM

,PLPDate

,PLPSumm

,VOP

,VP

,TheDept

,TheComment

,Code1C

 ) values ( aPEKO_DEFID 
,aInstanceID
,aORG

,aToClient

,aPLPNUM

,aPLPDate

,aPLPSumm

,aVOP

,aVP

,aTheDept

,aTheComment

,aCode1C

 ); 
 PEKO_DEF_SINIT( aCURSESSION,aPEKO_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKO_DEF_PARENT /*Описание*/ (
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
  select  INSTANCEID into aParentID from PEKO_DEF where  PEKO_DEFid=aRowID;
 end; 


procedure PEKO_DEF_ISLOCKED /*Описание*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKO_DEF where PEKO_DEFid=aRowID;
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
  PEKO_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKO.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKO_DEF_LOCK /*Описание*/ (
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
 PEKO_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKO_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKO_DEF where PEKO_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKO_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKO_DEF set LockUserID =auserID ,LockSessionID =null where PEKO_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKO_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKO_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKO_DEF_HCL /*Описание*/ (
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


procedure PEKO_DEF_UNLOCK /*Описание*/ (
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
 PEKO_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKO_DEF set LockUserID =null  where PEKO_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKO_DEF set LockSessionID =null  where PEKO_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKO_DEF_SINIT /*Описание*/ (
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
 select  SecurityStyleID into atmpID from PEKO_DEF where PEKO_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKO_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKO_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKO_DEF set securitystyleid =aStyleID where PEKO_DEFid = aRowID;
else 
 update PEKO_DEF set securitystyleid =aSecurityStyleID where PEKO_DEFid = aRowID;
end if; 
end ; 


procedure PEKO_DEF_propagate /*Описание*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKO_DEF where PEKO_DEFid=aRowid;
end;


end PEKO;

/



