
/* --PEKPQ*/

 create or replace package body PEKPQ as

procedure PEKPQ_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKPQ'
then
declare cursor child_PEKPQ_DEF is select PEKPQ_DEF.PEKPQ_DEFid ID from PEKPQ_DEF where  PEKPQ_DEF.InstanceID = ainstanceid;
row_PEKPQ_DEF  child_PEKPQ_DEF%ROWTYPE;
begin
--open child_PEKPQ_DEF;
for row_PEKPQ_DEF in child_PEKPQ_DEF loop
 PEKPQ_DEF_DELETE (acursession,row_PEKPQ_DEF.id,aInstanceID);
end loop;
--close child_PEKPQ_DEF;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKPQ_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKPQ'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKPQ_DEF is select PEKPQ_DEF.PEKPQ_DEFid ID from PEKPQ_DEF where  PEKPQ_DEF.InstanceID = arowid;
ROW_PEKPQ_DEF  lch_PEKPQ_DEF%ROWTYPE;
begin
--open lch_PEKPQ_DEF;
for row_PEKPQ_DEF in lch_PEKPQ_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKPQ_DEF where PEKPQ_DEFid=row_PEKPQ_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKPQ_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKPQ_DEF;
     return;
   end if; 
 end if; 
 PEKPQ_DEF_HCL (acursession,ROW_PEKPQ_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKPQ_DEF;
   return;
 end if;
 end loop;
--close lch_PEKPQ_DEF;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKPQ_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKPQ'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKPQ_DEF is select PEKPQ_DEF.PEKPQ_DEFid id from PEKPQ_DEF where  PEKPQ_DEF.InstanceID = arowid;
row_PEKPQ_DEF  pch_PEKPQ_DEF%ROWTYPE;
begin
--open pch_PEKPQ_DEF;
for row_PEKPQ_DEF in  pch_PEKPQ_DEF loop
 PEKPQ_DEF_SINIT( acursession,row_PEKPQ_DEF.id,assid);
 PEKPQ_DEF_propagate( acursession,row_PEKPQ_DEF.id);
end loop;
--close pch_PEKPQ_DEF;
end;
 end if; 
end;



procedure PEKPQ_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKPQ_DEFid CHAR,
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
if aPEKPQ_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKPQ_DEF where PEKPQ_DEFID=aPEKPQ_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKPQ_DEF where PEKPQ_DEFid=aPEKPQ_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKPQ_DEF');
    return;
  end if;
  aBRIEF:=func.PEKPQ_DEF_BRIEF_F(aPEKPQ_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKPQ_DEF_DELETE /*Описание требования на оплату*/ (
 aCURSESSION CHAR,
 aPEKPQ_DEFid CHAR,
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
select count(*) into existsCnt from PEKPQ_DEF where PEKPQ_DEFID=aPEKPQ_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKPQ_DEF where PEKPQ_DEFid=aPEKPQ_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKPQ_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKPQ_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKPQ_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKPQ_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKPQ_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKPQ_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKPQ_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKPQ_DEF is select  instanceid ID from instance where OwnerPartName ='PEKPQ_DEF' and OwnerRowID=aPEKPQ_DEFid;
row_PEKPQ_DEF  chld_PEKPQ_DEF%ROWTYPE;
begin
--open chld_PEKPQ_DEF;
for row_PEKPQ_DEF in chld_PEKPQ_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKPQ_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKPQ_DEF.id);
end loop;
--close chld_PEKPQ_DEF;
end ;
  delete from  PEKPQ_DEF 
  where  PEKPQ_DEFID = aPEKPQ_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Требование*/
procedure PEKPQ_DEF_SAVE /*Описание требования на оплату*/ (
 aCURSESSION CHAR,
 aPEKPQ_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR := null /* Организация *//* Организация */
,asequence
 NUMBER/* № *//* № */
,aTheDate
 DATE/* Дата требования *//* Дата требования */
,aTheDept CHAR/* Подразделение *//* Подразделение */
,aTheComment VARCHAR2/* Назначение платежа *//* Назначение платежа */
,aTheSumm
 NUMBER/* Сума платежа *//* Сума платежа */
,aToSuplier CHAR/* Контрагент *//* Контрагент */
,aTheDescription VARCHAR2 := null /* Примечание *//* Примечание */
,aTheDogovor CHAR := null /* Договор *//* Договор */
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
select count(*) into existsCnt from PEKPQ_DEF where PEKPQ_DEFID=aPEKPQ_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKPQ_DEF where PEKPQ_DEFid=aPEKPQ_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKPQ_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKPQ_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKPQ_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKPQ_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKPQ_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKPQ_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKPQ_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKPQ_DEF set ChangeStamp=sysdate
,
  ORG=aORG
,
  sequence=asequence
,
  TheDate=aTheDate
,
  TheDept=aTheDept
,
  TheComment=aTheComment
,
  TheSumm=aTheSumm
,
  ToSuplier=aToSuplier
,
  TheDescription=aTheDescription
,
  TheDogovor=aTheDogovor
,
  Code1C=aCode1C
  where  PEKPQ_DEFID = aPEKPQ_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKPQ_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKPQ_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKPQ_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKPQ_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKPQ_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKPQ_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKPQ_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKPQ_DEF
 (  PEKPQ_DEFID 
,InstanceID
,ORG

,sequence

,TheDate

,TheDept

,TheComment

,TheSumm

,ToSuplier

,TheDescription

,TheDogovor

,Code1C

 ) values ( aPEKPQ_DEFID 
,aInstanceID
,aORG

,asequence

,aTheDate

,aTheDept

,aTheComment

,aTheSumm

,aToSuplier

,aTheDescription

,aTheDogovor

,aCode1C

 ); 
 PEKPQ_DEF_SINIT( aCURSESSION,aPEKPQ_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKPQ_DEF_PARENT /*Описание требования на оплату*/ (
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
  select  INSTANCEID into aParentID from PEKPQ_DEF where  PEKPQ_DEFid=aRowID;
 end; 


procedure PEKPQ_DEF_ISLOCKED /*Описание требования на оплату*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKPQ_DEF where PEKPQ_DEFid=aRowID;
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
  PEKPQ_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKPQ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKPQ_DEF_LOCK /*Описание требования на оплату*/ (
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
 PEKPQ_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKPQ_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKPQ_DEF where PEKPQ_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKPQ_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKPQ_DEF set LockUserID =auserID ,LockSessionID =null where PEKPQ_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKPQ_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKPQ_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKPQ_DEF_HCL /*Описание требования на оплату*/ (
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


procedure PEKPQ_DEF_UNLOCK /*Описание требования на оплату*/ (
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
 PEKPQ_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKPQ_DEF set LockUserID =null  where PEKPQ_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKPQ_DEF set LockSessionID =null  where PEKPQ_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKPQ_DEF_SINIT /*Описание требования на оплату*/ (
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
 select  SecurityStyleID into atmpID from PEKPQ_DEF where PEKPQ_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKPQ_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKPQ_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKPQ_DEF set securitystyleid =aStyleID where PEKPQ_DEFid = aRowID;
else 
 update PEKPQ_DEF set securitystyleid =aSecurityStyleID where PEKPQ_DEFid = aRowID;
end if; 
end ; 


procedure PEKPQ_DEF_propagate /*Описание требования на оплату*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKPQ_DEF where PEKPQ_DEFid=aRowid;
end;


end PEKPQ;

/



