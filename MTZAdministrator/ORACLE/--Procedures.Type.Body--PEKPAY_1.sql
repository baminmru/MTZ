
/* --PEKPAY*/

 create or replace package body PEKPAY as

procedure PEKPAY_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKPAY'
then
declare cursor child_PEKPAY_DEF is select PEKPAY_DEF.PEKPAY_DEFid ID from PEKPAY_DEF where  PEKPAY_DEF.InstanceID = ainstanceid;
row_PEKPAY_DEF  child_PEKPAY_DEF%ROWTYPE;
begin
--open child_PEKPAY_DEF;
for row_PEKPAY_DEF in child_PEKPAY_DEF loop
 PEKPAY_DEF_DELETE (acursession,row_PEKPAY_DEF.id,aInstanceID);
end loop;
--close child_PEKPAY_DEF;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKPAY_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKPAY'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKPAY_DEF is select PEKPAY_DEF.PEKPAY_DEFid ID from PEKPAY_DEF where  PEKPAY_DEF.InstanceID = arowid;
ROW_PEKPAY_DEF  lch_PEKPAY_DEF%ROWTYPE;
begin
--open lch_PEKPAY_DEF;
for row_PEKPAY_DEF in lch_PEKPAY_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKPAY_DEF where PEKPAY_DEFid=row_PEKPAY_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKPAY_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKPAY_DEF;
     return;
   end if; 
 end if; 
 PEKPAY_DEF_HCL (acursession,ROW_PEKPAY_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKPAY_DEF;
   return;
 end if;
 end loop;
--close lch_PEKPAY_DEF;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKPAY_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKPAY'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKPAY_DEF is select PEKPAY_DEF.PEKPAY_DEFid id from PEKPAY_DEF where  PEKPAY_DEF.InstanceID = arowid;
row_PEKPAY_DEF  pch_PEKPAY_DEF%ROWTYPE;
begin
--open pch_PEKPAY_DEF;
for row_PEKPAY_DEF in  pch_PEKPAY_DEF loop
 PEKPAY_DEF_SINIT( acursession,row_PEKPAY_DEF.id,assid);
 PEKPAY_DEF_propagate( acursession,row_PEKPAY_DEF.id);
end loop;
--close pch_PEKPAY_DEF;
end;
 end if; 
end;



procedure PEKPAY_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKPAY_DEFid CHAR,
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
if aPEKPAY_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKPAY_DEF where PEKPAY_DEFID=aPEKPAY_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKPAY_DEF where PEKPAY_DEFid=aPEKPAY_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKPAY_DEF');
    return;
  end if;
  aBRIEF:=func.PEKPAY_DEF_BRIEF_F(aPEKPAY_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKPAY_DEF_DELETE /*Докумен для учета внутренних затрат*/ (
 aCURSESSION CHAR,
 aPEKPAY_DEFid CHAR,
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
select count(*) into existsCnt from PEKPAY_DEF where PEKPAY_DEFID=aPEKPAY_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKPAY_DEF where PEKPAY_DEFid=aPEKPAY_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKPAY_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKPAY_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKPAY_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKPAY_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKPAY_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKPAY_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKPAY_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKPAY_DEF is select  instanceid ID from instance where OwnerPartName ='PEKPAY_DEF' and OwnerRowID=aPEKPAY_DEFid;
row_PEKPAY_DEF  chld_PEKPAY_DEF%ROWTYPE;
begin
--open chld_PEKPAY_DEF;
for row_PEKPAY_DEF in chld_PEKPAY_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKPAY_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKPAY_DEF.id);
end loop;
--close chld_PEKPAY_DEF;
end ;
  delete from  PEKPAY_DEF 
  where  PEKPAY_DEFID = aPEKPAY_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание*/
procedure PEKPAY_DEF_SAVE /*Докумен для учета внутренних затрат*/ (
 aCURSESSION CHAR,
 aPEKPAY_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* Организация *//* Организация */
,aToClient CHAR := null /* Поставщик *//* Поставщик */
,aPLPNUM
 VARCHAR2/* № документа *//* № документа */
,aPLPDate
 DATE/* Дата документа *//* Дата документа */
,aPLPSumm
 NUMBER/* Сумма *//* Сумма */
,aStatya CHAR := null /* Статья расходов *//* Статья расходов */
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
select count(*) into existsCnt from PEKPAY_DEF where PEKPAY_DEFID=aPEKPAY_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKPAY_DEF where PEKPAY_DEFid=aPEKPAY_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKPAY_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKPAY_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKPAY_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKPAY_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKPAY_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKPAY_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKPAY_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKPAY_DEF set ChangeStamp=sysdate
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
  Statya=aStatya
,
  TheDept=aTheDept
,
  TheComment=aTheComment
,
  Code1C=aCode1C
  where  PEKPAY_DEFID = aPEKPAY_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKPAY_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKPAY_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKPAY_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKPAY_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKPAY_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKPAY_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKPAY_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKPAY_DEF
 (  PEKPAY_DEFID 
,InstanceID
,ORG

,ToClient

,PLPNUM

,PLPDate

,PLPSumm

,Statya

,TheDept

,TheComment

,Code1C

 ) values ( aPEKPAY_DEFID 
,aInstanceID
,aORG

,aToClient

,aPLPNUM

,aPLPDate

,aPLPSumm

,aStatya

,aTheDept

,aTheComment

,aCode1C

 ); 
 PEKPAY_DEF_SINIT( aCURSESSION,aPEKPAY_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKPAY_DEF_PARENT /*Докумен для учета внутренних затрат*/ (
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
  select  INSTANCEID into aParentID from PEKPAY_DEF where  PEKPAY_DEFid=aRowID;
 end; 


procedure PEKPAY_DEF_ISLOCKED /*Докумен для учета внутренних затрат*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKPAY_DEF where PEKPAY_DEFid=aRowID;
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
  PEKPAY_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKPAY.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKPAY_DEF_LOCK /*Докумен для учета внутренних затрат*/ (
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
 PEKPAY_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKPAY_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKPAY_DEF where PEKPAY_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKPAY_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKPAY_DEF set LockUserID =auserID ,LockSessionID =null where PEKPAY_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKPAY_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKPAY_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKPAY_DEF_HCL /*Докумен для учета внутренних затрат*/ (
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


procedure PEKPAY_DEF_UNLOCK /*Докумен для учета внутренних затрат*/ (
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
 PEKPAY_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKPAY_DEF set LockUserID =null  where PEKPAY_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKPAY_DEF set LockSessionID =null  where PEKPAY_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKPAY_DEF_SINIT /*Докумен для учета внутренних затрат*/ (
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
 select  SecurityStyleID into atmpID from PEKPAY_DEF where PEKPAY_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKPAY_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKPAY_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKPAY_DEF set securitystyleid =aStyleID where PEKPAY_DEFid = aRowID;
else 
 update PEKPAY_DEF set securitystyleid =aSecurityStyleID where PEKPAY_DEFid = aRowID;
end if; 
end ; 


procedure PEKPAY_DEF_propagate /*Докумен для учета внутренних затрат*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKPAY_DEF where PEKPAY_DEFid=aRowid;
end;


end PEKPAY;

/



