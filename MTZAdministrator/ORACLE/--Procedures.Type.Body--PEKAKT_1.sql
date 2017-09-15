
/* --PEKAKT*/

 create or replace package body PEKAKT as

procedure PEKAKT_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKAKT'
then
declare cursor child_PEKACT_DEF is select PEKACT_DEF.PEKACT_DEFid ID from PEKACT_DEF where  PEKACT_DEF.InstanceID = ainstanceid;
row_PEKACT_DEF  child_PEKACT_DEF%ROWTYPE;
begin
--open child_PEKACT_DEF;
for row_PEKACT_DEF in child_PEKACT_DEF loop
 PEKACT_DEF_DELETE (acursession,row_PEKACT_DEF.id,aInstanceID);
end loop;
--close child_PEKACT_DEF;
end;
declare cursor child_PEKACT_ITOG is select PEKACT_ITOG.PEKACT_ITOGid ID from PEKACT_ITOG where  PEKACT_ITOG.InstanceID = ainstanceid;
row_PEKACT_ITOG  child_PEKACT_ITOG%ROWTYPE;
begin
--open child_PEKACT_ITOG;
for row_PEKACT_ITOG in child_PEKACT_ITOG loop
 PEKACT_ITOG_DELETE (acursession,row_PEKACT_ITOG.id,aInstanceID);
end loop;
--close child_PEKACT_ITOG;
end;
declare cursor child_PEKACT_LINES is select PEKACT_LINES.PEKACT_LINESid ID from PEKACT_LINES where  PEKACT_LINES.InstanceID = ainstanceid;
row_PEKACT_LINES  child_PEKACT_LINES%ROWTYPE;
begin
--open child_PEKACT_LINES;
for row_PEKACT_LINES in child_PEKACT_LINES loop
 PEKACT_LINES_DELETE (acursession,row_PEKACT_LINES.id,aInstanceID);
end loop;
--close child_PEKACT_LINES;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKAKT_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKAKT'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKACT_DEF is select PEKACT_DEF.PEKACT_DEFid ID from PEKACT_DEF where  PEKACT_DEF.InstanceID = arowid;
ROW_PEKACT_DEF  lch_PEKACT_DEF%ROWTYPE;
begin
--open lch_PEKACT_DEF;
for row_PEKACT_DEF in lch_PEKACT_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKACT_DEF where PEKACT_DEFid=row_PEKACT_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKACT_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKACT_DEF;
     return;
   end if; 
 end if; 
 PEKACT_DEF_HCL (acursession,ROW_PEKACT_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKACT_DEF;
   return;
 end if;
 end loop;
--close lch_PEKACT_DEF;
end;
declare cursor lch_PEKACT_ITOG is select PEKACT_ITOG.PEKACT_ITOGid ID from PEKACT_ITOG where  PEKACT_ITOG.InstanceID = arowid;
ROW_PEKACT_ITOG  lch_PEKACT_ITOG%ROWTYPE;
begin
--open lch_PEKACT_ITOG;
for row_PEKACT_ITOG in lch_PEKACT_ITOG loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKACT_ITOG where PEKACT_ITOGid=row_PEKACT_ITOG.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKACT_ITOG;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKACT_ITOG;
     return;
   end if; 
 end if; 
 PEKACT_ITOG_HCL (acursession,ROW_PEKACT_ITOG.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKACT_ITOG;
   return;
 end if;
 end loop;
--close lch_PEKACT_ITOG;
end;
declare cursor lch_PEKACT_LINES is select PEKACT_LINES.PEKACT_LINESid ID from PEKACT_LINES where  PEKACT_LINES.InstanceID = arowid;
ROW_PEKACT_LINES  lch_PEKACT_LINES%ROWTYPE;
begin
--open lch_PEKACT_LINES;
for row_PEKACT_LINES in lch_PEKACT_LINES loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKACT_LINES where PEKACT_LINESid=row_PEKACT_LINES.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKACT_LINES;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKACT_LINES;
     return;
   end if; 
 end if; 
 PEKACT_LINES_HCL (acursession,ROW_PEKACT_LINES.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKACT_LINES;
   return;
 end if;
 end loop;
--close lch_PEKACT_LINES;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKAKT_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKAKT'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKACT_DEF is select PEKACT_DEF.PEKACT_DEFid id from PEKACT_DEF where  PEKACT_DEF.InstanceID = arowid;
row_PEKACT_DEF  pch_PEKACT_DEF%ROWTYPE;
begin
--open pch_PEKACT_DEF;
for row_PEKACT_DEF in  pch_PEKACT_DEF loop
 PEKACT_DEF_SINIT( acursession,row_PEKACT_DEF.id,assid);
 PEKACT_DEF_propagate( acursession,row_PEKACT_DEF.id);
end loop;
--close pch_PEKACT_DEF;
end;
declare cursor pch_PEKACT_ITOG is select PEKACT_ITOG.PEKACT_ITOGid id from PEKACT_ITOG where  PEKACT_ITOG.InstanceID = arowid;
row_PEKACT_ITOG  pch_PEKACT_ITOG%ROWTYPE;
begin
--open pch_PEKACT_ITOG;
for row_PEKACT_ITOG in  pch_PEKACT_ITOG loop
 PEKACT_ITOG_SINIT( acursession,row_PEKACT_ITOG.id,assid);
 PEKACT_ITOG_propagate( acursession,row_PEKACT_ITOG.id);
end loop;
--close pch_PEKACT_ITOG;
end;
declare cursor pch_PEKACT_LINES is select PEKACT_LINES.PEKACT_LINESid id from PEKACT_LINES where  PEKACT_LINES.InstanceID = arowid;
row_PEKACT_LINES  pch_PEKACT_LINES%ROWTYPE;
begin
--open pch_PEKACT_LINES;
for row_PEKACT_LINES in  pch_PEKACT_LINES loop
 PEKACT_LINES_SINIT( acursession,row_PEKACT_LINES.id,assid);
 PEKACT_LINES_propagate( acursession,row_PEKACT_LINES.id);
end loop;
--close pch_PEKACT_LINES;
end;
 end if; 
end;



procedure PEKACT_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKACT_DEFid CHAR,
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
if aPEKACT_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKACT_DEF where PEKACT_DEFID=aPEKACT_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKACT_DEF where PEKACT_DEFid=aPEKACT_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKACT_DEF');
    return;
  end if;
  aBRIEF:=func.PEKACT_DEF_BRIEF_F(aPEKACT_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKACT_DEF_DELETE /*Акт сверки*/ (
 aCURSESSION CHAR,
 aPEKACT_DEFid CHAR,
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
select count(*) into existsCnt from PEKACT_DEF where PEKACT_DEFID=aPEKACT_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKACT_DEF where PEKACT_DEFid=aPEKACT_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKACT_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKACT_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKACT_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKACT_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKACT_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKACT_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKACT_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKACT_DEF is select  instanceid ID from instance where OwnerPartName ='PEKACT_DEF' and OwnerRowID=aPEKACT_DEFid;
row_PEKACT_DEF  chld_PEKACT_DEF%ROWTYPE;
begin
--open chld_PEKACT_DEF;
for row_PEKACT_DEF in chld_PEKACT_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKACT_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKACT_DEF.id);
end loop;
--close chld_PEKACT_DEF;
end ;
  delete from  PEKACT_DEF 
  where  PEKACT_DEFID = aPEKACT_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание акта*/
procedure PEKACT_DEF_SAVE /*Акт сверки*/ (
 aCURSESSION CHAR,
 aPEKACT_DEFid CHAR,
aInstanceID CHAR 
,aPodrazdelenie CHAR := null /* Подразделение *//* Подразделение */
,aClient CHAR/* Клиент *//* Клиент */
,aNumber_of_akt
 NUMBER/* Номер_акта *//* Номер_акта */
,aDate_FROM
 DATE := null /* Дата С *//* Дата С */
,aDate_TO
 DATE := null /* Дата ПО *//* Дата ПО */
,aTheDgovor CHAR := null /* Договор *//* Договор */
,aCode1C
 VARCHAR2 := null /* Код 1С *//* Код 1С */
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
select count(*) into existsCnt from PEKACT_DEF where PEKACT_DEFID=aPEKACT_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKACT_DEF where PEKACT_DEFid=aPEKACT_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKACT_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKACT_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKACT_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKACT_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKACT_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKACT_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKACT_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKACT_DEF set ChangeStamp=sysdate
,
  Podrazdelenie=aPodrazdelenie
,
  Client=aClient
,
  Number_of_akt=aNumber_of_akt
,
  Date_FROM=aDate_FROM
,
  Date_TO=aDate_TO
,
  TheDgovor=aTheDgovor
,
  Code1C=aCode1C
  where  PEKACT_DEFID = aPEKACT_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKACT_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKACT_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKACT_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKACT_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKACT_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKACT_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKACT_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKACT_DEF
 (  PEKACT_DEFID 
,InstanceID
,Podrazdelenie

,Client

,Number_of_akt

,Date_FROM

,Date_TO

,TheDgovor

,Code1C

 ) values ( aPEKACT_DEFID 
,aInstanceID
,aPodrazdelenie

,aClient

,aNumber_of_akt

,aDate_FROM

,aDate_TO

,aTheDgovor

,aCode1C

 ); 
 PEKACT_DEF_SINIT( aCURSESSION,aPEKACT_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKACT_DEF_PARENT /*Акт сверки*/ (
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
  select  INSTANCEID into aParentID from PEKACT_DEF where  PEKACT_DEFid=aRowID;
 end; 


procedure PEKACT_DEF_ISLOCKED /*Акт сверки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKACT_DEF where PEKACT_DEFid=aRowID;
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
  PEKACT_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKAKT.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKACT_DEF_LOCK /*Акт сверки*/ (
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
 PEKACT_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKACT_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKACT_DEF where PEKACT_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKACT_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKACT_DEF set LockUserID =auserID ,LockSessionID =null where PEKACT_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKACT_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKACT_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKACT_DEF_HCL /*Акт сверки*/ (
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


procedure PEKACT_DEF_UNLOCK /*Акт сверки*/ (
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
 PEKACT_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKACT_DEF set LockUserID =null  where PEKACT_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKACT_DEF set LockSessionID =null  where PEKACT_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKACT_DEF_SINIT /*Акт сверки*/ (
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
 select  SecurityStyleID into atmpID from PEKACT_DEF where PEKACT_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKACT_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKACT_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKACT_DEF set securitystyleid =aStyleID where PEKACT_DEFid = aRowID;
else 
 update PEKACT_DEF set securitystyleid =aSecurityStyleID where PEKACT_DEFid = aRowID;
end if; 
end ; 


procedure PEKACT_DEF_propagate /*Акт сверки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKACT_DEF where PEKACT_DEFid=aRowid;
end;



procedure PEKACT_ITOG_BRIEF  (
 aCURSESSION CHAR,
 aPEKACT_ITOGid CHAR,
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
if aPEKACT_ITOGid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKACT_ITOG where PEKACT_ITOGID=aPEKACT_ITOGID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKACT_ITOG where PEKACT_ITOGid=aPEKACT_ITOGID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKACT_ITOG');
    return;
  end if;
  aBRIEF:=func.PEKACT_ITOG_BRIEF_F(aPEKACT_ITOGid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKACT_ITOG_DELETE /*Подводятся итоги по акту в разрезе услуг*/ (
 aCURSESSION CHAR,
 aPEKACT_ITOGid CHAR,
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
select count(*) into existsCnt from PEKACT_ITOG where PEKACT_ITOGID=aPEKACT_ITOGID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKACT_ITOG where PEKACT_ITOGid=aPEKACT_ITOGID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKACT_ITOG',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKACT_ITOG');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKACT_ITOG_ISLOCKED( acursession=>acursession,aROWID=>aPEKACT_ITOGid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKACT_ITOG');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKACT_ITOG',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKACT_ITOGid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKACT_ITOG is select  instanceid ID from instance where OwnerPartName ='PEKACT_ITOG' and OwnerRowID=aPEKACT_ITOGid;
row_PEKACT_ITOG  chld_PEKACT_ITOG%ROWTYPE;
begin
--open chld_PEKACT_ITOG;
for row_PEKACT_ITOG in chld_PEKACT_ITOG loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKACT_ITOG.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKACT_ITOG.id);
end loop;
--close chld_PEKACT_ITOG;
end ;
  delete from  PEKACT_ITOG 
  where  PEKACT_ITOGID = aPEKACT_ITOGID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Итоги по акту*/
procedure PEKACT_ITOG_SAVE /*Подводятся итоги по акту в разрезе услуг*/ (
 aCURSESSION CHAR,
 aPEKACT_ITOGid CHAR,
aInstanceID CHAR 
,aSRV CHAR := null /* Услуга *//* Услуга */
,aSumm
 NUMBER := null /* Сумма *//* Сумма */
,aSummNDS
 NUMBER := null /* Сумма с НДС *//* Сумма с НДС */
,aSupSUMM
 NUMBER := null /* Сумма поставщику *//* Сумма поставщику */
,aSupSummNDS
 NUMBER := null /* Сумма поставщику с НДС *//* Сумма поставщику с НДС */
,aQuantity
 NUMBER := null /* Количество *//* Количество */
,aedizm CHAR := null /* Единица измерения *//* Единица измерения */
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
select count(*) into existsCnt from PEKACT_ITOG where PEKACT_ITOGID=aPEKACT_ITOGID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKACT_ITOG where PEKACT_ITOGid=aPEKACT_ITOGID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKACT_ITOG',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKACT_ITOG');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKACT_ITOG_ISLOCKED( acursession=>acursession,aROWID=>aPEKACT_ITOGid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKACT_ITOG');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKACT_ITOG',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKACT_ITOGid,aLogInstanceID=>aInstanceID);
 update  PEKACT_ITOG set ChangeStamp=sysdate
,
  SRV=aSRV
,
  Summ=aSumm
,
  SummNDS=aSummNDS
,
  SupSUMM=aSupSUMM
,
  SupSummNDS=aSupSummNDS
,
  Quantity=aQuantity
,
  edizm=aedizm
  where  PEKACT_ITOGID = aPEKACT_ITOGID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKACT_ITOG',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKACT_ITOG');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKACT_ITOG');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKACT_ITOG',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKACT_ITOGid,aLogInstanceID=>aInstanceID);
 insert into   PEKACT_ITOG
 (  PEKACT_ITOGID 
,InstanceID
,SRV

,Summ

,SummNDS

,SupSUMM

,SupSummNDS

,Quantity

,edizm

 ) values ( aPEKACT_ITOGID 
,aInstanceID
,aSRV

,aSumm

,aSummNDS

,aSupSUMM

,aSupSummNDS

,aQuantity

,aedizm

 ); 
 PEKACT_ITOG_SINIT( aCURSESSION,aPEKACT_ITOGid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKACT_ITOG_PARENT /*Подводятся итоги по акту в разрезе услуг*/ (
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
  select  INSTANCEID into aParentID from PEKACT_ITOG where  PEKACT_ITOGid=aRowID;
 end; 


procedure PEKACT_ITOG_ISLOCKED /*Подводятся итоги по акту в разрезе услуг*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKACT_ITOG where PEKACT_ITOGid=aRowID;
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
  PEKACT_ITOG_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKAKT.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKACT_ITOG_LOCK /*Подводятся итоги по акту в разрезе услуг*/ (
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
 PEKACT_ITOG_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKACT_ITOG_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKACT_ITOG where PEKACT_ITOGid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKACT_ITOG');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKACT_ITOG set LockUserID =auserID ,LockSessionID =null where PEKACT_ITOGid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKACT_ITOG set LockUserID =null,LockSessionID =aCURSESSION  where PEKACT_ITOGid=aRowID;
     return;
   end if;
 end ;


procedure PEKACT_ITOG_HCL /*Подводятся итоги по акту в разрезе услуг*/ (
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


procedure PEKACT_ITOG_UNLOCK /*Подводятся итоги по акту в разрезе услуг*/ (
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
 PEKACT_ITOG_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKACT_ITOG set LockUserID =null  where PEKACT_ITOGid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKACT_ITOG set LockSessionID =null  where PEKACT_ITOGid=aRowID;
     return;
   end if;
 end; 


procedure PEKACT_ITOG_SINIT /*Подводятся итоги по акту в разрезе услуг*/ (
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
 select  SecurityStyleID into atmpID from PEKACT_ITOG where PEKACT_ITOGid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKACT_ITOG');
    return;
  end if;
if aSecurityStyleID is null then
 PEKACT_ITOG_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKACT_ITOG set securitystyleid =aStyleID where PEKACT_ITOGid = aRowID;
else 
 update PEKACT_ITOG set securitystyleid =aSecurityStyleID where PEKACT_ITOGid = aRowID;
end if; 
end ; 


procedure PEKACT_ITOG_propagate /*Подводятся итоги по акту в разрезе услуг*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKACT_ITOG where PEKACT_ITOGid=aRowid;
end;



procedure PEKACT_LINES_BRIEF  (
 aCURSESSION CHAR,
 aPEKACT_LINESid CHAR,
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
if aPEKACT_LINESid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKACT_LINES where PEKACT_LINESID=aPEKACT_LINESID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKACT_LINES where PEKACT_LINESid=aPEKACT_LINESID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKACT_LINES');
    return;
  end if;
  aBRIEF:=func.PEKACT_LINES_BRIEF_F(aPEKACT_LINESid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKACT_LINES_DELETE /*Строки акта сверки */ (
 aCURSESSION CHAR,
 aPEKACT_LINESid CHAR,
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
select count(*) into existsCnt from PEKACT_LINES where PEKACT_LINESID=aPEKACT_LINESID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKACT_LINES where PEKACT_LINESid=aPEKACT_LINESID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKACT_LINES',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKACT_LINES');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKACT_LINES_ISLOCKED( acursession=>acursession,aROWID=>aPEKACT_LINESid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKACT_LINES');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKACT_LINES',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKACT_LINESid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKACT_LINES is select  instanceid ID from instance where OwnerPartName ='PEKACT_LINES' and OwnerRowID=aPEKACT_LINESid;
row_PEKACT_LINES  chld_PEKACT_LINES%ROWTYPE;
begin
--open chld_PEKACT_LINES;
for row_PEKACT_LINES in chld_PEKACT_LINES loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKACT_LINES.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKACT_LINES.id);
end loop;
--close chld_PEKACT_LINES;
end ;
  delete from  PEKACT_LINES 
  where  PEKACT_LINESID = aPEKACT_LINESID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Строки акта*/
procedure PEKACT_LINES_SAVE /*Строки акта сверки */ (
 aCURSESSION CHAR,
 aPEKACT_LINESid CHAR,
aInstanceID CHAR 
,aZayavka CHAR := null /* Заявка *//* Заявка */
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
select count(*) into existsCnt from PEKACT_LINES where PEKACT_LINESID=aPEKACT_LINESID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKACT_LINES where PEKACT_LINESid=aPEKACT_LINESID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKACT_LINES',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKACT_LINES');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKACT_LINES_ISLOCKED( acursession=>acursession,aROWID=>aPEKACT_LINESid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKACT_LINES');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKACT_LINES',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKACT_LINESid,aLogInstanceID=>aInstanceID);
 update  PEKACT_LINES set ChangeStamp=sysdate
,
  Zayavka=aZayavka
  where  PEKACT_LINESID = aPEKACT_LINESID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKACT_LINES',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKACT_LINES');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKACT_LINES');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKACT_LINES',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKACT_LINESid,aLogInstanceID=>aInstanceID);
 insert into   PEKACT_LINES
 (  PEKACT_LINESID 
,InstanceID
,Zayavka

 ) values ( aPEKACT_LINESID 
,aInstanceID
,aZayavka

 ); 
 PEKACT_LINES_SINIT( aCURSESSION,aPEKACT_LINESid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKACT_LINES_PARENT /*Строки акта сверки */ (
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
  select  INSTANCEID into aParentID from PEKACT_LINES where  PEKACT_LINESid=aRowID;
 end; 


procedure PEKACT_LINES_ISLOCKED /*Строки акта сверки */ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKACT_LINES where PEKACT_LINESid=aRowID;
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
  PEKACT_LINES_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKAKT.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKACT_LINES_LOCK /*Строки акта сверки */ (
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
 PEKACT_LINES_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKACT_LINES_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKACT_LINES where PEKACT_LINESid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKACT_LINES');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKACT_LINES set LockUserID =auserID ,LockSessionID =null where PEKACT_LINESid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKACT_LINES set LockUserID =null,LockSessionID =aCURSESSION  where PEKACT_LINESid=aRowID;
     return;
   end if;
 end ;


procedure PEKACT_LINES_HCL /*Строки акта сверки */ (
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


procedure PEKACT_LINES_UNLOCK /*Строки акта сверки */ (
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
 PEKACT_LINES_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKACT_LINES set LockUserID =null  where PEKACT_LINESid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKACT_LINES set LockSessionID =null  where PEKACT_LINESid=aRowID;
     return;
   end if;
 end; 


procedure PEKACT_LINES_SINIT /*Строки акта сверки */ (
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
 select  SecurityStyleID into atmpID from PEKACT_LINES where PEKACT_LINESid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKACT_LINES');
    return;
  end if;
if aSecurityStyleID is null then
 PEKACT_LINES_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKACT_LINES set securitystyleid =aStyleID where PEKACT_LINESid = aRowID;
else 
 update PEKACT_LINES set securitystyleid =aSecurityStyleID where PEKACT_LINESid = aRowID;
end if; 
end ; 


procedure PEKACT_LINES_propagate /*Строки акта сверки */ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKACT_LINES where PEKACT_LINESid=aRowid;
end;


end PEKAKT;

/



