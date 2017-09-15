
/* --PEKN*/

 create or replace package body PEKN as

procedure PEKN_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKN'
then
declare cursor child_PEKD_NZONE is select PEKD_NZONE.PEKD_NZONEid ID from PEKD_NZONE where  PEKD_NZONE.InstanceID = ainstanceid;
row_PEKD_NZONE  child_PEKD_NZONE%ROWTYPE;
begin
--open child_PEKD_NZONE;
for row_PEKD_NZONE in child_PEKD_NZONE loop
 PEKD_NZONE_DELETE (acursession,row_PEKD_NZONE.id,aInstanceID);
end loop;
--close child_PEKD_NZONE;
end;
declare cursor child_PEKD_USEDNUM is select PEKD_USEDNUM.PEKD_USEDNUMid ID from PEKD_USEDNUM where  PEKD_USEDNUM.InstanceID = ainstanceid;
row_PEKD_USEDNUM  child_PEKD_USEDNUM%ROWTYPE;
begin
--open child_PEKD_USEDNUM;
for row_PEKD_USEDNUM in child_PEKD_USEDNUM loop
 PEKD_USEDNUM_DELETE (acursession,row_PEKD_USEDNUM.id,aInstanceID);
end loop;
--close child_PEKD_USEDNUM;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKN_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKN'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKD_NZONE is select PEKD_NZONE.PEKD_NZONEid ID from PEKD_NZONE where  PEKD_NZONE.InstanceID = arowid;
ROW_PEKD_NZONE  lch_PEKD_NZONE%ROWTYPE;
begin
--open lch_PEKD_NZONE;
for row_PEKD_NZONE in lch_PEKD_NZONE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_NZONE where PEKD_NZONEid=row_PEKD_NZONE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_NZONE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_NZONE;
     return;
   end if; 
 end if; 
 PEKD_NZONE_HCL (acursession,ROW_PEKD_NZONE.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_NZONE;
   return;
 end if;
 end loop;
--close lch_PEKD_NZONE;
end;
declare cursor lch_PEKD_USEDNUM is select PEKD_USEDNUM.PEKD_USEDNUMid ID from PEKD_USEDNUM where  PEKD_USEDNUM.InstanceID = arowid;
ROW_PEKD_USEDNUM  lch_PEKD_USEDNUM%ROWTYPE;
begin
--open lch_PEKD_USEDNUM;
for row_PEKD_USEDNUM in lch_PEKD_USEDNUM loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_USEDNUM where PEKD_USEDNUMid=row_PEKD_USEDNUM.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_USEDNUM;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_USEDNUM;
     return;
   end if; 
 end if; 
 PEKD_USEDNUM_HCL (acursession,ROW_PEKD_USEDNUM.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_USEDNUM;
   return;
 end if;
 end loop;
--close lch_PEKD_USEDNUM;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKN_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKN'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKD_NZONE is select PEKD_NZONE.PEKD_NZONEid id from PEKD_NZONE where  PEKD_NZONE.InstanceID = arowid;
row_PEKD_NZONE  pch_PEKD_NZONE%ROWTYPE;
begin
--open pch_PEKD_NZONE;
for row_PEKD_NZONE in  pch_PEKD_NZONE loop
 PEKD_NZONE_SINIT( acursession,row_PEKD_NZONE.id,assid);
 PEKD_NZONE_propagate( acursession,row_PEKD_NZONE.id);
end loop;
--close pch_PEKD_NZONE;
end;
declare cursor pch_PEKD_USEDNUM is select PEKD_USEDNUM.PEKD_USEDNUMid id from PEKD_USEDNUM where  PEKD_USEDNUM.InstanceID = arowid;
row_PEKD_USEDNUM  pch_PEKD_USEDNUM%ROWTYPE;
begin
--open pch_PEKD_USEDNUM;
for row_PEKD_USEDNUM in  pch_PEKD_USEDNUM loop
 PEKD_USEDNUM_SINIT( acursession,row_PEKD_USEDNUM.id,assid);
 PEKD_USEDNUM_propagate( acursession,row_PEKD_USEDNUM.id);
end loop;
--close pch_PEKD_USEDNUM;
end;
 end if; 
end;



procedure PEKD_NZONE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_NZONEid CHAR,
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
if aPEKD_NZONEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_NZONE where PEKD_NZONEID=aPEKD_NZONEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_NZONE where PEKD_NZONEid=aPEKD_NZONEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_NZONE');
    return;
  end if;
  aBRIEF:=func.PEKD_NZONE_BRIEF_F(aPEKD_NZONEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_NZONE_DELETE /*Зоны номеров ППО*/ (
 aCURSESSION CHAR,
 aPEKD_NZONEid CHAR,
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
select count(*) into existsCnt from PEKD_NZONE where PEKD_NZONEID=aPEKD_NZONEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_NZONE where PEKD_NZONEid=aPEKD_NZONEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_NZONE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_NZONE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_NZONE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_NZONEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_NZONE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_NZONE',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_NZONEid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_NZONE is select  instanceid ID from instance where OwnerPartName ='PEKD_NZONE' and OwnerRowID=aPEKD_NZONEid;
row_PEKD_NZONE  chld_PEKD_NZONE%ROWTYPE;
begin
--open chld_PEKD_NZONE;
for row_PEKD_NZONE in chld_PEKD_NZONE loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_NZONE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_NZONE.id);
end loop;
--close chld_PEKD_NZONE;
end ;
  delete from  PEKD_NZONE 
  where  PEKD_NZONEID = aPEKD_NZONEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Зоны номеров ППО*/
procedure PEKD_NZONE_SAVE /*Зоны номеров ППО*/ (
 aCURSESSION CHAR,
 aPEKD_NZONEid CHAR,
aInstanceID CHAR 
,aDept CHAR/* Филиал *//* Филиал */
,aTheYear
 NUMBER/* Год *//* Год */
,aTheMonth
 NUMBER/* Месяц *//* Месяц */
,aFromPPOIDX
 NUMBER/* Начиная с *//* Начиная с */
,aToPPOIdx
 NUMBER/* По *//* По */
,aPOIDX
 VARCHAR2/* Индекс отделения *//* Индекс отделения */
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
select count(*) into existsCnt from PEKD_NZONE where PEKD_NZONEID=aPEKD_NZONEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_NZONE where PEKD_NZONEid=aPEKD_NZONEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_NZONE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_NZONE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_NZONE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_NZONEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_NZONE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_NZONE',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_NZONEid,aLogInstanceID=>aInstanceID);
 update  PEKD_NZONE set ChangeStamp=sysdate
,
  Dept=aDept
,
  TheYear=aTheYear
,
  TheMonth=aTheMonth
,
  FromPPOIDX=aFromPPOIDX
,
  ToPPOIdx=aToPPOIdx
,
  POIDX=aPOIDX
  where  PEKD_NZONEID = aPEKD_NZONEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_NZONE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_NZONE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_NZONE');
    return;
  end if;
select Count(*) into existsCnt from PEKD_NZONE where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKD_NZONE>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_NZONE',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_NZONEid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_NZONE
 (  PEKD_NZONEID 
,InstanceID
,Dept

,TheYear

,TheMonth

,FromPPOIDX

,ToPPOIdx

,POIDX

 ) values ( aPEKD_NZONEID 
,aInstanceID
,aDept

,aTheYear

,aTheMonth

,aFromPPOIDX

,aToPPOIdx

,aPOIDX

 ); 
 PEKD_NZONE_SINIT( aCURSESSION,aPEKD_NZONEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_NZONE_PARENT /*Зоны номеров ППО*/ (
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
  select  INSTANCEID into aParentID from PEKD_NZONE where  PEKD_NZONEid=aRowID;
 end; 


procedure PEKD_NZONE_ISLOCKED /*Зоны номеров ППО*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_NZONE where PEKD_NZONEid=aRowID;
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
  PEKD_NZONE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKN.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_NZONE_LOCK /*Зоны номеров ППО*/ (
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
 PEKD_NZONE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_NZONE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_NZONE where PEKD_NZONEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_NZONE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_NZONE set LockUserID =auserID ,LockSessionID =null where PEKD_NZONEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_NZONE set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_NZONEid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_NZONE_HCL /*Зоны номеров ППО*/ (
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


procedure PEKD_NZONE_UNLOCK /*Зоны номеров ППО*/ (
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
 PEKD_NZONE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_NZONE set LockUserID =null  where PEKD_NZONEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_NZONE set LockSessionID =null  where PEKD_NZONEid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_NZONE_SINIT /*Зоны номеров ППО*/ (
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
 select  SecurityStyleID into atmpID from PEKD_NZONE where PEKD_NZONEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_NZONE');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_NZONE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_NZONE set securitystyleid =aStyleID where PEKD_NZONEid = aRowID;
else 
 update PEKD_NZONE set securitystyleid =aSecurityStyleID where PEKD_NZONEid = aRowID;
end if; 
end ; 


procedure PEKD_NZONE_propagate /*Зоны номеров ППО*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_NZONE where PEKD_NZONEid=aRowid;
end;



procedure PEKD_USEDNUM_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_USEDNUMid CHAR,
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
if aPEKD_USEDNUMid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_USEDNUM where PEKD_USEDNUMID=aPEKD_USEDNUMID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_USEDNUM where PEKD_USEDNUMid=aPEKD_USEDNUMID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_USEDNUM');
    return;
  end if;
  aBRIEF:=func.PEKD_USEDNUM_BRIEF_F(aPEKD_USEDNUMid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_USEDNUM_DELETE /*Занятые номера*/ (
 aCURSESSION CHAR,
 aPEKD_USEDNUMid CHAR,
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
select count(*) into existsCnt from PEKD_USEDNUM where PEKD_USEDNUMID=aPEKD_USEDNUMID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_USEDNUM where PEKD_USEDNUMid=aPEKD_USEDNUMID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_USEDNUM',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_USEDNUM');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_USEDNUM_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_USEDNUMid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_USEDNUM');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_USEDNUM',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_USEDNUMid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_USEDNUM is select  instanceid ID from instance where OwnerPartName ='PEKD_USEDNUM' and OwnerRowID=aPEKD_USEDNUMid;
row_PEKD_USEDNUM  chld_PEKD_USEDNUM%ROWTYPE;
begin
--open chld_PEKD_USEDNUM;
for row_PEKD_USEDNUM in chld_PEKD_USEDNUM loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_USEDNUM.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_USEDNUM.id);
end loop;
--close chld_PEKD_USEDNUM;
end ;
  delete from  PEKD_USEDNUM 
  where  PEKD_USEDNUMID = aPEKD_USEDNUMID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Занятые номера*/
procedure PEKD_USEDNUM_SAVE /*Занятые номера*/ (
 aCURSESSION CHAR,
 aPEKD_USEDNUMid CHAR,
aInstanceID CHAR 
,aUsedNumber
 NUMBER/* Номер *//* Номер */
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
select count(*) into existsCnt from PEKD_USEDNUM where PEKD_USEDNUMID=aPEKD_USEDNUMID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_USEDNUM where PEKD_USEDNUMid=aPEKD_USEDNUMID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_USEDNUM',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_USEDNUM');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_USEDNUM_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_USEDNUMid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_USEDNUM');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_USEDNUM',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_USEDNUMid,aLogInstanceID=>aInstanceID);
 update  PEKD_USEDNUM set ChangeStamp=sysdate
,
  UsedNumber=aUsedNumber
  where  PEKD_USEDNUMID = aPEKD_USEDNUMID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_USEDNUM',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_USEDNUM');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_USEDNUM');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_USEDNUM',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_USEDNUMid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_USEDNUM
 (  PEKD_USEDNUMID 
,InstanceID
,UsedNumber

 ) values ( aPEKD_USEDNUMID 
,aInstanceID
,aUsedNumber

 ); 
 PEKD_USEDNUM_SINIT( aCURSESSION,aPEKD_USEDNUMid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_USEDNUM_PARENT /*Занятые номера*/ (
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
  select  INSTANCEID into aParentID from PEKD_USEDNUM where  PEKD_USEDNUMid=aRowID;
 end; 


procedure PEKD_USEDNUM_ISLOCKED /*Занятые номера*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_USEDNUM where PEKD_USEDNUMid=aRowID;
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
  PEKD_USEDNUM_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKN.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_USEDNUM_LOCK /*Занятые номера*/ (
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
 PEKD_USEDNUM_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_USEDNUM_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_USEDNUM where PEKD_USEDNUMid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_USEDNUM');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_USEDNUM set LockUserID =auserID ,LockSessionID =null where PEKD_USEDNUMid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_USEDNUM set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_USEDNUMid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_USEDNUM_HCL /*Занятые номера*/ (
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


procedure PEKD_USEDNUM_UNLOCK /*Занятые номера*/ (
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
 PEKD_USEDNUM_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_USEDNUM set LockUserID =null  where PEKD_USEDNUMid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_USEDNUM set LockSessionID =null  where PEKD_USEDNUMid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_USEDNUM_SINIT /*Занятые номера*/ (
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
 select  SecurityStyleID into atmpID from PEKD_USEDNUM where PEKD_USEDNUMid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_USEDNUM');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_USEDNUM_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_USEDNUM set securitystyleid =aStyleID where PEKD_USEDNUMid = aRowID;
else 
 update PEKD_USEDNUM set securitystyleid =aSecurityStyleID where PEKD_USEDNUMid = aRowID;
end if; 
end ; 


procedure PEKD_USEDNUM_propagate /*Занятые номера*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_USEDNUM where PEKD_USEDNUMid=aRowid;
end;


end PEKN;

/



