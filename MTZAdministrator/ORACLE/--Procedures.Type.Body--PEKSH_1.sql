
/* --PEKSH*/

 create or replace package body PEKSH as

procedure PEKSH_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKSH'
then
declare cursor child_PEKSH_DATA is select PEKSH_DATA.PEKSH_DATAid ID from PEKSH_DATA where  PEKSH_DATA.InstanceID = ainstanceid;
row_PEKSH_DATA  child_PEKSH_DATA%ROWTYPE;
begin
--open child_PEKSH_DATA;
for row_PEKSH_DATA in child_PEKSH_DATA loop
 PEKSH_DATA_DELETE (acursession,row_PEKSH_DATA.id,aInstanceID);
end loop;
--close child_PEKSH_DATA;
end;
declare cursor child_PEKSH_DEF is select PEKSH_DEF.PEKSH_DEFid ID from PEKSH_DEF where  PEKSH_DEF.InstanceID = ainstanceid;
row_PEKSH_DEF  child_PEKSH_DEF%ROWTYPE;
begin
--open child_PEKSH_DEF;
for row_PEKSH_DEF in child_PEKSH_DEF loop
 PEKSH_DEF_DELETE (acursession,row_PEKSH_DEF.id,aInstanceID);
end loop;
--close child_PEKSH_DEF;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKSH_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKSH'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKSH_DATA is select PEKSH_DATA.PEKSH_DATAid ID from PEKSH_DATA where  PEKSH_DATA.InstanceID = arowid;
ROW_PEKSH_DATA  lch_PEKSH_DATA%ROWTYPE;
begin
--open lch_PEKSH_DATA;
for row_PEKSH_DATA in lch_PEKSH_DATA loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKSH_DATA where PEKSH_DATAid=row_PEKSH_DATA.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKSH_DATA;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKSH_DATA;
     return;
   end if; 
 end if; 
 PEKSH_DATA_HCL (acursession,ROW_PEKSH_DATA.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKSH_DATA;
   return;
 end if;
 end loop;
--close lch_PEKSH_DATA;
end;
declare cursor lch_PEKSH_DEF is select PEKSH_DEF.PEKSH_DEFid ID from PEKSH_DEF where  PEKSH_DEF.InstanceID = arowid;
ROW_PEKSH_DEF  lch_PEKSH_DEF%ROWTYPE;
begin
--open lch_PEKSH_DEF;
for row_PEKSH_DEF in lch_PEKSH_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKSH_DEF where PEKSH_DEFid=row_PEKSH_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKSH_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKSH_DEF;
     return;
   end if; 
 end if; 
 PEKSH_DEF_HCL (acursession,ROW_PEKSH_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKSH_DEF;
   return;
 end if;
 end loop;
--close lch_PEKSH_DEF;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKSH_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKSH'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKSH_DATA is select PEKSH_DATA.PEKSH_DATAid id from PEKSH_DATA where  PEKSH_DATA.InstanceID = arowid;
row_PEKSH_DATA  pch_PEKSH_DATA%ROWTYPE;
begin
--open pch_PEKSH_DATA;
for row_PEKSH_DATA in  pch_PEKSH_DATA loop
 PEKSH_DATA_SINIT( acursession,row_PEKSH_DATA.id,assid);
 PEKSH_DATA_propagate( acursession,row_PEKSH_DATA.id);
end loop;
--close pch_PEKSH_DATA;
end;
declare cursor pch_PEKSH_DEF is select PEKSH_DEF.PEKSH_DEFid id from PEKSH_DEF where  PEKSH_DEF.InstanceID = arowid;
row_PEKSH_DEF  pch_PEKSH_DEF%ROWTYPE;
begin
--open pch_PEKSH_DEF;
for row_PEKSH_DEF in  pch_PEKSH_DEF loop
 PEKSH_DEF_SINIT( acursession,row_PEKSH_DEF.id,assid);
 PEKSH_DEF_propagate( acursession,row_PEKSH_DEF.id);
end loop;
--close pch_PEKSH_DEF;
end;
 end if; 
end;



procedure PEKSH_DATA_BRIEF  (
 aCURSESSION CHAR,
 aPEKSH_DATAid CHAR,
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
if aPEKSH_DATAid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKSH_DATA where PEKSH_DATAID=aPEKSH_DATAID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKSH_DATA where PEKSH_DATAid=aPEKSH_DATAID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKSH_DATA');
    return;
  end if;
  aBRIEF:=func.PEKSH_DATA_BRIEF_F(aPEKSH_DATAid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKSH_DATA_DELETE /*Поезд*/ (
 aCURSESSION CHAR,
 aPEKSH_DATAid CHAR,
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
select count(*) into existsCnt from PEKSH_DATA where PEKSH_DATAID=aPEKSH_DATAID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKSH_DATA where PEKSH_DATAid=aPEKSH_DATAID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKSH_DATA',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKSH_DATA');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKSH_DATA_ISLOCKED( acursession=>acursession,aROWID=>aPEKSH_DATAid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKSH_DATA');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PEKSH_START is select PEKSH_START.PEKSH_STARTid ID from PEKSH_START where  PEKSH_START.ParentStructRowID = aPEKSH_DATAid;
    child_PEKSH_START_rec  child_PEKSH_START%ROWTYPE;
    begin
    --open child_PEKSH_START;
      for child_PEKSH_START_rec in child_PEKSH_START loop
      PEKSH_START_DELETE (acursession,child_PEKSH_START_rec.id,aInstanceid);
      end loop;
      --close child_PEKSH_START;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKSH_DATA',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKSH_DATAid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKSH_DATA is select  instanceid ID from instance where OwnerPartName ='PEKSH_DATA' and OwnerRowID=aPEKSH_DATAid;
row_PEKSH_DATA  chld_PEKSH_DATA%ROWTYPE;
begin
--open chld_PEKSH_DATA;
for row_PEKSH_DATA in chld_PEKSH_DATA loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKSH_DATA.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKSH_DATA.id);
end loop;
--close chld_PEKSH_DATA;
end ;
  delete from  PEKSH_DATA 
  where  PEKSH_DATAID = aPEKSH_DATAID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Поезд*/
procedure PEKSH_DATA_SAVE /*Поезд*/ (
 aCURSESSION CHAR,
 aPEKSH_DATAid CHAR,
aInstanceID CHAR 
,aTrain CHAR/* Поезд *//* Поезд */
,aStartTime
 DATE := null /* Время отправления *//* Время отправления */
,aDuration
 NUMBER := null /* Время доставки *//* Время доставки */
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
select count(*) into existsCnt from PEKSH_DATA where PEKSH_DATAID=aPEKSH_DATAID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKSH_DATA where PEKSH_DATAid=aPEKSH_DATAID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKSH_DATA',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKSH_DATA');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKSH_DATA_ISLOCKED( acursession=>acursession,aROWID=>aPEKSH_DATAid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKSH_DATA');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKSH_DATA',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKSH_DATAid,aLogInstanceID=>aInstanceID);
 update  PEKSH_DATA set ChangeStamp=sysdate
,
  Train=aTrain
,
  StartTime=aStartTime
,
  Duration=aDuration
  where  PEKSH_DATAID = aPEKSH_DATAID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKSH_DATA',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKSH_DATA');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKSH_DATA');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKSH_DATA',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKSH_DATAid,aLogInstanceID=>aInstanceID);
 insert into   PEKSH_DATA
 (  PEKSH_DATAID 
,InstanceID
,Train

,StartTime

,Duration

 ) values ( aPEKSH_DATAID 
,aInstanceID
,aTrain

,aStartTime

,aDuration

 ); 
 PEKSH_DATA_SINIT( aCURSESSION,aPEKSH_DATAid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKSH_DATA_PARENT /*Поезд*/ (
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
  select  INSTANCEID into aParentID from PEKSH_DATA where  PEKSH_DATAid=aRowID;
 end; 


procedure PEKSH_DATA_ISLOCKED /*Поезд*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKSH_DATA where PEKSH_DATAid=aRowID;
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
  PEKSH_DATA_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKSH.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKSH_DATA_LOCK /*Поезд*/ (
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
 PEKSH_DATA_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKSH_DATA_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKSH_DATA where PEKSH_DATAid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKSH_DATA');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKSH_DATA set LockUserID =auserID ,LockSessionID =null where PEKSH_DATAid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKSH_DATA set LockUserID =null,LockSessionID =aCURSESSION  where PEKSH_DATAid=aRowID;
     return;
   end if;
 end ;


procedure PEKSH_DATA_HCL /*Поезд*/ (
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
declare cursor lch_PEKSH_START is select PEKSH_START.PEKSH_STARTid ID from PEKSH_START where  PEKSH_START.ParentStructRowID = aRowid;
row_PEKSH_START lch_PEKSH_START%ROWTYPE;
begin  
--open lch_PEKSH_START;
for row_PEKSH_START in lch_PEKSH_START
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKSH_START where PEKSH_STARTid=row_PEKSH_START.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKSH_START;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKSH_START;
     return;
   end if; 
 end if;  
 PEKSH_START_HCL (acursession,row_PEKSH_START.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKSH_START;
   return;
 end if;
end loop;
--close lch_PEKSH_START;
end;
aIsLocked :=0;
end;


procedure PEKSH_DATA_UNLOCK /*Поезд*/ (
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
 PEKSH_DATA_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKSH_DATA set LockUserID =null  where PEKSH_DATAid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKSH_DATA set LockSessionID =null  where PEKSH_DATAid=aRowID;
     return;
   end if;
 end; 


procedure PEKSH_DATA_SINIT /*Поезд*/ (
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
 select  SecurityStyleID into atmpID from PEKSH_DATA where PEKSH_DATAid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKSH_DATA');
    return;
  end if;
if aSecurityStyleID is null then
 PEKSH_DATA_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKSH_DATA set securitystyleid =aStyleID where PEKSH_DATAid = aRowID;
else 
 update PEKSH_DATA set securitystyleid =aSecurityStyleID where PEKSH_DATAid = aRowID;
end if; 
end ; 


procedure PEKSH_DATA_propagate /*Поезд*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKSH_DATA where PEKSH_DATAid=aRowid;
declare cursor pch_PEKSH_START  is select PEKSH_START.PEKSH_STARTid ID from PEKSH_START where  PEKSH_START.ParentStructRowID = aRowid;
row_PEKSH_START  pch_PEKSH_START%ROWTYPE;
begin
--open pch_PEKSH_START;
for row_PEKSH_START in pch_PEKSH_START loop
   PEKSH_START_SINIT( acursession,row_PEKSH_START.id,assid);
   PEKSH_START_propagate( acursession,row_PEKSH_START.id);
end loop;
--close pch_PEKSH_START;
end;
end;



procedure PEKSH_START_BRIEF  (
 aCURSESSION CHAR,
 aPEKSH_STARTid CHAR,
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
if aPEKSH_STARTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKSH_START where PEKSH_STARTID=aPEKSH_STARTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKSH_START where PEKSH_STARTid=aPEKSH_STARTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKSH_START');
    return;
  end if;
  aBRIEF:=func.PEKSH_START_BRIEF_F(aPEKSH_STARTid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKSH_START_DELETE /*День и время отправления*/ (
 aCURSESSION CHAR,
 aPEKSH_STARTid CHAR,
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
select count(*) into existsCnt from PEKSH_START where PEKSH_STARTID=aPEKSH_STARTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKSH_START where PEKSH_STARTid=aPEKSH_STARTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKSH_START',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKSH_START');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKSH_START_ISLOCKED( acursession=>acursession,aROWID=>aPEKSH_STARTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKSH_START');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKSH_START',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKSH_STARTid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKSH_START is select  instanceid ID from instance where OwnerPartName ='PEKSH_START' and OwnerRowID=aPEKSH_STARTid;
row_PEKSH_START  chld_PEKSH_START%ROWTYPE;
begin
--open chld_PEKSH_START;
for row_PEKSH_START in chld_PEKSH_START loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKSH_START.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKSH_START.id);
end loop;
--close chld_PEKSH_START;
end ;
  delete from  PEKSH_START 
  where  PEKSH_STARTID = aPEKSH_STARTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*День и время отправления*/
procedure PEKSH_START_SAVE /*День и время отправления*/ (
 aCURSESSION CHAR,
 aPEKSH_STARTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aDayInYear
 NUMBER/* Номер дня в году *//* Номер дня в году */
,aStartTime
 DATE := null /* Время отправления *//* Время отправления */
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
select count(*) into existsCnt from PEKSH_START where PEKSH_STARTID=aPEKSH_STARTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKSH_START where PEKSH_STARTid=aPEKSH_STARTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKSH_START',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKSH_START');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKSH_START_ISLOCKED( acursession=>acursession,aROWID=>aPEKSH_STARTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKSH_START');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKSH_START',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKSH_STARTid,aLogInstanceID=>aInstanceID);
 update  PEKSH_START set ChangeStamp=sysdate
,
  DayInYear=aDayInYear
,
  StartTime=aStartTime
  where  PEKSH_STARTID = aPEKSH_STARTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PEKSH_DATA where PEKSH_DATAid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKSH_START',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKSH_START');
      return;
    end if;
 end if;
 PEKSH_DATA_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKSH_START');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKSH_START',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKSH_STARTid,aLogInstanceID=>aInstanceID);
 insert into   PEKSH_START
 (  PEKSH_STARTID 
,ParentStructRowID
,DayInYear

,StartTime

 ) values ( aPEKSH_STARTID 
,aParentStructRowID
,aDayInYear

,aStartTime

 ); 
 PEKSH_START_SINIT( aCURSESSION,aPEKSH_STARTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKSH_START_PARENT /*День и время отправления*/ (
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
  select ParentStructRowID into aParentID  from PEKSH_START where  PEKSH_STARTid=aRowID;
  aParentTable := 'PEKSH_DATA';
 end; 


procedure PEKSH_START_ISLOCKED /*День и время отправления*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKSH_START where PEKSH_STARTid=aRowID;
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
  PEKSH_START_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKSH.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKSH_START_LOCK /*День и время отправления*/ (
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
 PEKSH_START_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKSH_START_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKSH_START where PEKSH_STARTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKSH_START');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKSH_START set LockUserID =auserID ,LockSessionID =null where PEKSH_STARTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKSH_START set LockUserID =null,LockSessionID =aCURSESSION  where PEKSH_STARTid=aRowID;
     return;
   end if;
 end ;


procedure PEKSH_START_HCL /*День и время отправления*/ (
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


procedure PEKSH_START_UNLOCK /*День и время отправления*/ (
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
 PEKSH_START_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKSH_START set LockUserID =null  where PEKSH_STARTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKSH_START set LockSessionID =null  where PEKSH_STARTid=aRowID;
     return;
   end if;
 end; 


procedure PEKSH_START_SINIT /*День и время отправления*/ (
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
 select  SecurityStyleID into atmpID from PEKSH_START where PEKSH_STARTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKSH_START');
    return;
  end if;
if aSecurityStyleID is null then
 PEKSH_START_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKSH_START set securitystyleid =aStyleID where PEKSH_STARTid = aRowID;
else 
 update PEKSH_START set securitystyleid =aSecurityStyleID where PEKSH_STARTid = aRowID;
end if; 
end ; 


procedure PEKSH_START_propagate /*День и время отправления*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKSH_START where PEKSH_STARTid=aRowid;
end;



procedure PEKSH_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKSH_DEFid CHAR,
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
if aPEKSH_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKSH_DEF where PEKSH_DEFID=aPEKSH_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKSH_DEF where PEKSH_DEFid=aPEKSH_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKSH_DEF');
    return;
  end if;
  aBRIEF:=func.PEKSH_DEF_BRIEF_F(aPEKSH_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKSH_DEF_DELETE /*Описание расписания*/ (
 aCURSESSION CHAR,
 aPEKSH_DEFid CHAR,
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
select count(*) into existsCnt from PEKSH_DEF where PEKSH_DEFID=aPEKSH_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKSH_DEF where PEKSH_DEFid=aPEKSH_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKSH_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKSH_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKSH_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKSH_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKSH_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKSH_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKSH_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKSH_DEF is select  instanceid ID from instance where OwnerPartName ='PEKSH_DEF' and OwnerRowID=aPEKSH_DEFid;
row_PEKSH_DEF  chld_PEKSH_DEF%ROWTYPE;
begin
--open chld_PEKSH_DEF;
for row_PEKSH_DEF in chld_PEKSH_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKSH_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKSH_DEF.id);
end loop;
--close chld_PEKSH_DEF;
end ;
  delete from  PEKSH_DEF 
  where  PEKSH_DEFID = aPEKSH_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание расписания*/
procedure PEKSH_DEF_SAVE /*Описание расписания*/ (
 aCURSESSION CHAR,
 aPEKSH_DEFid CHAR,
aInstanceID CHAR 
,aDIRECTION CHAR/* Направление *//* Направление */
,aTheYear
 NUMBER/* Год *//* Год */
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
select count(*) into existsCnt from PEKSH_DEF where PEKSH_DEFID=aPEKSH_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKSH_DEF where PEKSH_DEFid=aPEKSH_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKSH_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKSH_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKSH_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKSH_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKSH_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKSH_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKSH_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKSH_DEF set ChangeStamp=sysdate
,
  DIRECTION=aDIRECTION
,
  TheYear=aTheYear
  where  PEKSH_DEFID = aPEKSH_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKSH_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKSH_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKSH_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKSH_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKSH_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKSH_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKSH_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKSH_DEF
 (  PEKSH_DEFID 
,InstanceID
,DIRECTION

,TheYear

 ) values ( aPEKSH_DEFID 
,aInstanceID
,aDIRECTION

,aTheYear

 ); 
 PEKSH_DEF_SINIT( aCURSESSION,aPEKSH_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKSH_DEF_PARENT /*Описание расписания*/ (
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
  select  INSTANCEID into aParentID from PEKSH_DEF where  PEKSH_DEFid=aRowID;
 end; 


procedure PEKSH_DEF_ISLOCKED /*Описание расписания*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKSH_DEF where PEKSH_DEFid=aRowID;
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
  PEKSH_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKSH.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKSH_DEF_LOCK /*Описание расписания*/ (
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
 PEKSH_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKSH_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKSH_DEF where PEKSH_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKSH_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKSH_DEF set LockUserID =auserID ,LockSessionID =null where PEKSH_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKSH_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKSH_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKSH_DEF_HCL /*Описание расписания*/ (
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


procedure PEKSH_DEF_UNLOCK /*Описание расписания*/ (
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
 PEKSH_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKSH_DEF set LockUserID =null  where PEKSH_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKSH_DEF set LockSessionID =null  where PEKSH_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKSH_DEF_SINIT /*Описание расписания*/ (
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
 select  SecurityStyleID into atmpID from PEKSH_DEF where PEKSH_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKSH_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKSH_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKSH_DEF set securitystyleid =aStyleID where PEKSH_DEFid = aRowID;
else 
 update PEKSH_DEF set securitystyleid =aSecurityStyleID where PEKSH_DEFid = aRowID;
end if; 
end ; 


procedure PEKSH_DEF_propagate /*Описание расписания*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKSH_DEF where PEKSH_DEFid=aRowid;
end;


end PEKSH;

/



