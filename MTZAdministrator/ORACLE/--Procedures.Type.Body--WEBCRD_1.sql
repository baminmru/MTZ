
/* --WEBCRD*/

 create or replace package body WEBCRD as

procedure WEBCRD_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='WEBCRD'
then
declare cursor child_WEBCRD_NUM is select WEBCRD_NUM.WEBCRD_NUMid ID from WEBCRD_NUM where  WEBCRD_NUM.InstanceID = ainstanceid;
row_WEBCRD_NUM  child_WEBCRD_NUM%ROWTYPE;
begin
--open child_WEBCRD_NUM;
for row_WEBCRD_NUM in child_WEBCRD_NUM loop
 WEBCRD_NUM_DELETE (acursession,row_WEBCRD_NUM.id,aInstanceID);
end loop;
--close child_WEBCRD_NUM;
end;
declare cursor child_WBCRD_DEF is select WBCRD_DEF.WBCRD_DEFid ID from WBCRD_DEF where  WBCRD_DEF.InstanceID = ainstanceid;
row_WBCRD_DEF  child_WBCRD_DEF%ROWTYPE;
begin
--open child_WBCRD_DEF;
for row_WBCRD_DEF in child_WBCRD_DEF loop
 WBCRD_DEF_DELETE (acursession,row_WBCRD_DEF.id,aInstanceID);
end loop;
--close child_WBCRD_DEF;
end;
return;
<<del_error>>
return;
end if;
end;
procedure WEBCRD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'WEBCRD'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_WEBCRD_NUM is select WEBCRD_NUM.WEBCRD_NUMid ID from WEBCRD_NUM where  WEBCRD_NUM.InstanceID = arowid;
ROW_WEBCRD_NUM  lch_WEBCRD_NUM%ROWTYPE;
begin
--open lch_WEBCRD_NUM;
for row_WEBCRD_NUM in lch_WEBCRD_NUM loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WEBCRD_NUM where WEBCRD_NUMid=row_WEBCRD_NUM.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WEBCRD_NUM;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WEBCRD_NUM;
     return;
   end if; 
 end if; 
 WEBCRD_NUM_HCL (acursession,ROW_WEBCRD_NUM.id,aisLocked);
 if aisLocked >2 then
   close lch_WEBCRD_NUM;
   return;
 end if;
 end loop;
--close lch_WEBCRD_NUM;
end;
declare cursor lch_WBCRD_DEF is select WBCRD_DEF.WBCRD_DEFid ID from WBCRD_DEF where  WBCRD_DEF.InstanceID = arowid;
ROW_WBCRD_DEF  lch_WBCRD_DEF%ROWTYPE;
begin
--open lch_WBCRD_DEF;
for row_WBCRD_DEF in lch_WBCRD_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from WBCRD_DEF where WBCRD_DEFid=row_WBCRD_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_WBCRD_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_WBCRD_DEF;
     return;
   end if; 
 end if; 
 WBCRD_DEF_HCL (acursession,ROW_WBCRD_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_WBCRD_DEF;
   return;
 end if;
 end loop;
--close lch_WBCRD_DEF;
end;
 end if;
aIsLocked:=0;
end;
procedure WEBCRD_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'WEBCRD'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_WEBCRD_NUM is select WEBCRD_NUM.WEBCRD_NUMid id from WEBCRD_NUM where  WEBCRD_NUM.InstanceID = arowid;
row_WEBCRD_NUM  pch_WEBCRD_NUM%ROWTYPE;
begin
--open pch_WEBCRD_NUM;
for row_WEBCRD_NUM in  pch_WEBCRD_NUM loop
 WEBCRD_NUM_SINIT( acursession,row_WEBCRD_NUM.id,assid);
 WEBCRD_NUM_propagate( acursession,row_WEBCRD_NUM.id);
end loop;
--close pch_WEBCRD_NUM;
end;
declare cursor pch_WBCRD_DEF is select WBCRD_DEF.WBCRD_DEFid id from WBCRD_DEF where  WBCRD_DEF.InstanceID = arowid;
row_WBCRD_DEF  pch_WBCRD_DEF%ROWTYPE;
begin
--open pch_WBCRD_DEF;
for row_WBCRD_DEF in  pch_WBCRD_DEF loop
 WBCRD_DEF_SINIT( acursession,row_WBCRD_DEF.id,assid);
 WBCRD_DEF_propagate( acursession,row_WBCRD_DEF.id);
end loop;
--close pch_WBCRD_DEF;
end;
 end if; 
end;



procedure WEBCRD_NUM_BRIEF  (
 aCURSESSION CHAR,
 aWEBCRD_NUMid CHAR,
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
if aWEBCRD_NUMid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WEBCRD_NUM where WEBCRD_NUMID=aWEBCRD_NUMID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WEBCRD_NUM where WEBCRD_NUMid=aWEBCRD_NUMID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WEBCRD_NUM');
    return;
  end if;
  aBRIEF:=func.WEBCRD_NUM_BRIEF_F(aWEBCRD_NUMid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WEBCRD_NUM_DELETE /*Карточки*/ (
 aCURSESSION CHAR,
 aWEBCRD_NUMid CHAR,
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
select count(*) into existsCnt from WEBCRD_NUM where WEBCRD_NUMID=aWEBCRD_NUMID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WEBCRD_NUM where WEBCRD_NUMid=aWEBCRD_NUMID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WEBCRD_NUM',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WEBCRD_NUM');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBCRD_NUM_ISLOCKED( acursession=>acursession,aROWID=>aWEBCRD_NUMid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WEBCRD_NUM');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WEBCRD_NUM',
 aVERB=>'DELETEROW',  aThe_Resource=>aWEBCRD_NUMid, aLogInstanceID=>aInstanceID);
declare cursor chld_WEBCRD_NUM is select  instanceid ID from instance where OwnerPartName ='WEBCRD_NUM' and OwnerRowID=aWEBCRD_NUMid;
row_WEBCRD_NUM  chld_WEBCRD_NUM%ROWTYPE;
begin
--open chld_WEBCRD_NUM;
for row_WEBCRD_NUM in chld_WEBCRD_NUM loop
 Kernel.INSTANCE_OWNER (acursession,row_WEBCRD_NUM.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WEBCRD_NUM.id);
end loop;
--close chld_WEBCRD_NUM;
end ;
  delete from  WEBCRD_NUM 
  where  WEBCRD_NUMID = aWEBCRD_NUMID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Карточки*/
procedure WEBCRD_NUM_SAVE /*Карточки*/ (
 aCURSESSION CHAR,
 aWEBCRD_NUMid CHAR,
aInstanceID CHAR 
,aTheNumber
 VARCHAR2/* Номер карточки *//* Номер карточки */
,aActivationTime
 DATE := null /* Когда активирована *//* Когда активирована */
,aActivatedBy CHAR := null /* Кем активирована *//* Кем активирована */
,aActivated
 NUMBER := null /* Активирована *//* Активирована */
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
select count(*) into existsCnt from WEBCRD_NUM where WEBCRD_NUMID=aWEBCRD_NUMID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WEBCRD_NUM where WEBCRD_NUMid=aWEBCRD_NUMID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WEBCRD_NUM',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WEBCRD_NUM');
      return;
    end if;
  end if;
 --  verify lock  --
 WEBCRD_NUM_ISLOCKED( acursession=>acursession,aROWID=>aWEBCRD_NUMid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBCRD_NUM');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBCRD_NUM',
 aVERB=>'EDITROW',  aThe_Resource=>aWEBCRD_NUMid,aLogInstanceID=>aInstanceID);
 update  WEBCRD_NUM set ChangeStamp=sysdate
,
  TheNumber=aTheNumber
,
  ActivationTime=aActivationTime
,
  ActivatedBy=aActivatedBy
,
  Activated=aActivated
  where  WEBCRD_NUMID = aWEBCRD_NUMID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WEBCRD_NUM',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WEBCRD_NUM');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WEBCRD_NUM');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WEBCRD_NUM',
 aVERB=>'CREATEROW',  aThe_Resource=>aWEBCRD_NUMid,aLogInstanceID=>aInstanceID);
 insert into   WEBCRD_NUM
 (  WEBCRD_NUMID 
,InstanceID
,TheNumber

,ActivationTime

,ActivatedBy

,Activated

 ) values ( aWEBCRD_NUMID 
,aInstanceID
,aTheNumber

,aActivationTime

,aActivatedBy

,aActivated

 ); 
 WEBCRD_NUM_SINIT( aCURSESSION,aWEBCRD_NUMid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WEBCRD_NUM_PARENT /*Карточки*/ (
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
  select  INSTANCEID into aParentID from WEBCRD_NUM where  WEBCRD_NUMid=aRowID;
 end; 


procedure WEBCRD_NUM_ISLOCKED /*Карточки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WEBCRD_NUM where WEBCRD_NUMid=aRowID;
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
  WEBCRD_NUM_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WEBCRD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WEBCRD_NUM_LOCK /*Карточки*/ (
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
 WEBCRD_NUM_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WEBCRD_NUM_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WEBCRD_NUM where WEBCRD_NUMid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WEBCRD_NUM');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WEBCRD_NUM set LockUserID =auserID ,LockSessionID =null where WEBCRD_NUMid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WEBCRD_NUM set LockUserID =null,LockSessionID =aCURSESSION  where WEBCRD_NUMid=aRowID;
     return;
   end if;
 end ;


procedure WEBCRD_NUM_HCL /*Карточки*/ (
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


procedure WEBCRD_NUM_UNLOCK /*Карточки*/ (
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
 WEBCRD_NUM_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WEBCRD_NUM set LockUserID =null  where WEBCRD_NUMid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WEBCRD_NUM set LockSessionID =null  where WEBCRD_NUMid=aRowID;
     return;
   end if;
 end; 


procedure WEBCRD_NUM_SINIT /*Карточки*/ (
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
 select  SecurityStyleID into atmpID from WEBCRD_NUM where WEBCRD_NUMid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WEBCRD_NUM');
    return;
  end if;
if aSecurityStyleID is null then
 WEBCRD_NUM_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WEBCRD_NUM set securitystyleid =aStyleID where WEBCRD_NUMid = aRowID;
else 
 update WEBCRD_NUM set securitystyleid =aSecurityStyleID where WEBCRD_NUMid = aRowID;
end if; 
end ; 


procedure WEBCRD_NUM_propagate /*Карточки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WEBCRD_NUM where WEBCRD_NUMid=aRowid;
end;



procedure WBCRD_DEF_BRIEF  (
 aCURSESSION CHAR,
 aWBCRD_DEFid CHAR,
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
if aWBCRD_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from WBCRD_DEF where WBCRD_DEFID=aWBCRD_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from WBCRD_DEF where WBCRD_DEFid=aWBCRD_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=WBCRD_DEF');
    return;
  end if;
  aBRIEF:=func.WBCRD_DEF_BRIEF_F(aWBCRD_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure WBCRD_DEF_DELETE /*Описание серии*/ (
 aCURSESSION CHAR,
 aWBCRD_DEFid CHAR,
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
select count(*) into existsCnt from WBCRD_DEF where WBCRD_DEFID=aWBCRD_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from WBCRD_DEF where WBCRD_DEFid=aWBCRD_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:WBCRD_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=WBCRD_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 WBCRD_DEF_ISLOCKED( acursession=>acursession,aROWID=>aWBCRD_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=WBCRD_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'WBCRD_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aWBCRD_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_WBCRD_DEF is select  instanceid ID from instance where OwnerPartName ='WBCRD_DEF' and OwnerRowID=aWBCRD_DEFid;
row_WBCRD_DEF  chld_WBCRD_DEF%ROWTYPE;
begin
--open chld_WBCRD_DEF;
for row_WBCRD_DEF in chld_WBCRD_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_WBCRD_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_WBCRD_DEF.id);
end loop;
--close chld_WBCRD_DEF;
end ;
  delete from  WBCRD_DEF 
  where  WBCRD_DEFID = aWBCRD_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Описание серии*/
procedure WBCRD_DEF_SAVE /*Описание серии*/ (
 aCURSESSION CHAR,
 aWBCRD_DEFid CHAR,
aInstanceID CHAR 
,aTheDate
 DATE/* Дата выпуска сериии *//* Дата выпуска сериии */
,aExpDate
 DATE/* Конец действия серии *//* Конец действия серии */
,aCardSumm
 NUMBER/* Сумма на карточке *//* Сумма на карточке */
,aTheCurrency CHAR/* Валюта *//* Валюта */
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
select count(*) into existsCnt from WBCRD_DEF where WBCRD_DEFID=aWBCRD_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from WBCRD_DEF where WBCRD_DEFid=aWBCRD_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:WBCRD_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=WBCRD_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 WBCRD_DEF_ISLOCKED( acursession=>acursession,aROWID=>aWBCRD_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WBCRD_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WBCRD_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aWBCRD_DEFid,aLogInstanceID=>aInstanceID);
 update  WBCRD_DEF set ChangeStamp=sysdate
,
  TheDate=aTheDate
,
  ExpDate=aExpDate
,
  CardSumm=aCardSumm
,
  TheCurrency=aTheCurrency
  where  WBCRD_DEFID = aWBCRD_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:WBCRD_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=WBCRD_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=WBCRD_DEF');
    return;
  end if;
select Count(*) into existsCnt from WBCRD_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <WBCRD_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'WBCRD_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aWBCRD_DEFid,aLogInstanceID=>aInstanceID);
 insert into   WBCRD_DEF
 (  WBCRD_DEFID 
,InstanceID
,TheDate

,ExpDate

,CardSumm

,TheCurrency

 ) values ( aWBCRD_DEFID 
,aInstanceID
,aTheDate

,aExpDate

,aCardSumm

,aTheCurrency

 ); 
 WBCRD_DEF_SINIT( aCURSESSION,aWBCRD_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure WBCRD_DEF_PARENT /*Описание серии*/ (
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
  select  INSTANCEID into aParentID from WBCRD_DEF where  WBCRD_DEFid=aRowID;
 end; 


procedure WBCRD_DEF_ISLOCKED /*Описание серии*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from WBCRD_DEF where WBCRD_DEFid=aRowID;
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
  WBCRD_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin WEBCRD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure WBCRD_DEF_LOCK /*Описание серии*/ (
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
 WBCRD_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  WBCRD_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from WBCRD_DEF where WBCRD_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=WBCRD_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update WBCRD_DEF set LockUserID =auserID ,LockSessionID =null where WBCRD_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update WBCRD_DEF set LockUserID =null,LockSessionID =aCURSESSION  where WBCRD_DEFid=aRowID;
     return;
   end if;
 end ;


procedure WBCRD_DEF_HCL /*Описание серии*/ (
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


procedure WBCRD_DEF_UNLOCK /*Описание серии*/ (
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
 WBCRD_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update WBCRD_DEF set LockUserID =null  where WBCRD_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update WBCRD_DEF set LockSessionID =null  where WBCRD_DEFid=aRowID;
     return;
   end if;
 end; 


procedure WBCRD_DEF_SINIT /*Описание серии*/ (
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
 select  SecurityStyleID into atmpID from WBCRD_DEF where WBCRD_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =WBCRD_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 WBCRD_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update WBCRD_DEF set securitystyleid =aStyleID where WBCRD_DEFid = aRowID;
else 
 update WBCRD_DEF set securitystyleid =aSecurityStyleID where WBCRD_DEFid = aRowID;
end if; 
end ; 


procedure WBCRD_DEF_propagate /*Описание серии*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from WBCRD_DEF where WBCRD_DEFid=aRowid;
end;


end WEBCRD;

/



