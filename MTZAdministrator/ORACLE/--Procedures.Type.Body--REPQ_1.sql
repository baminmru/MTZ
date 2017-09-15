
/* --REPQ*/

 create or replace package body REPQ as

procedure REPQ_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='REPQ'
then
declare cursor child_REPQ_RCV is select REPQ_RCV.REPQ_RCVid ID from REPQ_RCV where  REPQ_RCV.InstanceID = ainstanceid;
row_REPQ_RCV  child_REPQ_RCV%ROWTYPE;
begin
--open child_REPQ_RCV;
for row_REPQ_RCV in child_REPQ_RCV loop
 REPQ_RCV_DELETE (acursession,row_REPQ_RCV.id,aInstanceID);
end loop;
--close child_REPQ_RCV;
end;
declare cursor child_REPQ_SND is select REPQ_SND.REPQ_SNDid ID from REPQ_SND where  REPQ_SND.InstanceID = ainstanceid;
row_REPQ_SND  child_REPQ_SND%ROWTYPE;
begin
--open child_REPQ_SND;
for row_REPQ_SND in child_REPQ_SND loop
 REPQ_SND_DELETE (acursession,row_REPQ_SND.id,aInstanceID);
end loop;
--close child_REPQ_SND;
end;
declare cursor child_REPQ_DATA is select REPQ_DATA.REPQ_DATAid ID from REPQ_DATA where  REPQ_DATA.InstanceID = ainstanceid;
row_REPQ_DATA  child_REPQ_DATA%ROWTYPE;
begin
--open child_REPQ_DATA;
for row_REPQ_DATA in child_REPQ_DATA loop
 REPQ_DATA_DELETE (acursession,row_REPQ_DATA.id,aInstanceID);
end loop;
--close child_REPQ_DATA;
end;
return;
<<del_error>>
return;
end if;
end;
procedure REPQ_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'REPQ'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_REPQ_RCV is select REPQ_RCV.REPQ_RCVid ID from REPQ_RCV where  REPQ_RCV.InstanceID = arowid;
ROW_REPQ_RCV  lch_REPQ_RCV%ROWTYPE;
begin
--open lch_REPQ_RCV;
for row_REPQ_RCV in lch_REPQ_RCV loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from REPQ_RCV where REPQ_RCVid=row_REPQ_RCV.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPQ_RCV;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_REPQ_RCV;
     return;
   end if; 
 end if; 
 REPQ_RCV_HCL (acursession,ROW_REPQ_RCV.id,aisLocked);
 if aisLocked >2 then
   close lch_REPQ_RCV;
   return;
 end if;
 end loop;
--close lch_REPQ_RCV;
end;
declare cursor lch_REPQ_SND is select REPQ_SND.REPQ_SNDid ID from REPQ_SND where  REPQ_SND.InstanceID = arowid;
ROW_REPQ_SND  lch_REPQ_SND%ROWTYPE;
begin
--open lch_REPQ_SND;
for row_REPQ_SND in lch_REPQ_SND loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from REPQ_SND where REPQ_SNDid=row_REPQ_SND.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPQ_SND;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_REPQ_SND;
     return;
   end if; 
 end if; 
 REPQ_SND_HCL (acursession,ROW_REPQ_SND.id,aisLocked);
 if aisLocked >2 then
   close lch_REPQ_SND;
   return;
 end if;
 end loop;
--close lch_REPQ_SND;
end;
declare cursor lch_REPQ_DATA is select REPQ_DATA.REPQ_DATAid ID from REPQ_DATA where  REPQ_DATA.InstanceID = arowid;
ROW_REPQ_DATA  lch_REPQ_DATA%ROWTYPE;
begin
--open lch_REPQ_DATA;
for row_REPQ_DATA in lch_REPQ_DATA loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from REPQ_DATA where REPQ_DATAid=row_REPQ_DATA.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPQ_DATA;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_REPQ_DATA;
     return;
   end if; 
 end if; 
 REPQ_DATA_HCL (acursession,ROW_REPQ_DATA.id,aisLocked);
 if aisLocked >2 then
   close lch_REPQ_DATA;
   return;
 end if;
 end loop;
--close lch_REPQ_DATA;
end;
 end if;
aIsLocked:=0;
end;
procedure REPQ_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'REPQ'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_REPQ_RCV is select REPQ_RCV.REPQ_RCVid id from REPQ_RCV where  REPQ_RCV.InstanceID = arowid;
row_REPQ_RCV  pch_REPQ_RCV%ROWTYPE;
begin
--open pch_REPQ_RCV;
for row_REPQ_RCV in  pch_REPQ_RCV loop
 REPQ_RCV_SINIT( acursession,row_REPQ_RCV.id,assid);
 REPQ_RCV_propagate( acursession,row_REPQ_RCV.id);
end loop;
--close pch_REPQ_RCV;
end;
declare cursor pch_REPQ_SND is select REPQ_SND.REPQ_SNDid id from REPQ_SND where  REPQ_SND.InstanceID = arowid;
row_REPQ_SND  pch_REPQ_SND%ROWTYPE;
begin
--open pch_REPQ_SND;
for row_REPQ_SND in  pch_REPQ_SND loop
 REPQ_SND_SINIT( acursession,row_REPQ_SND.id,assid);
 REPQ_SND_propagate( acursession,row_REPQ_SND.id);
end loop;
--close pch_REPQ_SND;
end;
declare cursor pch_REPQ_DATA is select REPQ_DATA.REPQ_DATAid id from REPQ_DATA where  REPQ_DATA.InstanceID = arowid;
row_REPQ_DATA  pch_REPQ_DATA%ROWTYPE;
begin
--open pch_REPQ_DATA;
for row_REPQ_DATA in  pch_REPQ_DATA loop
 REPQ_DATA_SINIT( acursession,row_REPQ_DATA.id,assid);
 REPQ_DATA_propagate( acursession,row_REPQ_DATA.id);
end loop;
--close pch_REPQ_DATA;
end;
 end if; 
end;



procedure REPQ_RCV_BRIEF  (
 aCURSESSION CHAR,
 aREPQ_RCVid CHAR,
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
if aREPQ_RCVid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPQ_RCV where REPQ_RCVID=aREPQ_RCVID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPQ_RCV where REPQ_RCVid=aREPQ_RCVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPQ_RCV');
    return;
  end if;
  aBRIEF:=func.REPQ_RCV_BRIEF_F(aREPQ_RCVid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPQ_RCV_DELETE /*Очередь приема*/ (
 aCURSESSION CHAR,
 aREPQ_RCVid CHAR,
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
select count(*) into existsCnt from REPQ_RCV where REPQ_RCVID=aREPQ_RCVID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPQ_RCV where REPQ_RCVid=aREPQ_RCVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPQ_RCV',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPQ_RCV');
      return;
    end if;
  end if;
 --  verify lock  --
 REPQ_RCV_ISLOCKED( acursession=>acursession,aROWID=>aREPQ_RCVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPQ_RCV');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPQ_RCV',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPQ_RCVid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPQ_RCV is select  instanceid ID from instance where OwnerPartName ='REPQ_RCV' and OwnerRowID=aREPQ_RCVid;
row_REPQ_RCV  chld_REPQ_RCV%ROWTYPE;
begin
--open chld_REPQ_RCV;
for row_REPQ_RCV in chld_REPQ_RCV loop
 Kernel.INSTANCE_OWNER (acursession,row_REPQ_RCV.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPQ_RCV.id);
end loop;
--close chld_REPQ_RCV;
end ;
  delete from  REPQ_RCV 
  where  REPQ_RCVID = aREPQ_RCVID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Очередь приема*/
procedure REPQ_RCV_SAVE /*Очередь приема*/ (
 aCURSESSION CHAR,
 aREPQ_RCVid CHAR,
aInstanceID CHAR 
,aPEKF CHAR/* Филиал *//* Филиал */
,aIDX
 NUMBER/* Индекс *//* Индекс */
,aDATA VARCHAR2/* Данные *//* Данные */
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
select count(*) into existsCnt from REPQ_RCV where REPQ_RCVID=aREPQ_RCVID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPQ_RCV where REPQ_RCVid=aREPQ_RCVID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPQ_RCV',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPQ_RCV');
      return;
    end if;
  end if;
 --  verify lock  --
 REPQ_RCV_ISLOCKED( acursession=>acursession,aROWID=>aREPQ_RCVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPQ_RCV');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPQ_RCV',
 aVERB=>'EDITROW',  aThe_Resource=>aREPQ_RCVid,aLogInstanceID=>aInstanceID);
 update  REPQ_RCV set ChangeStamp=sysdate
,
  PEKF=aPEKF
,
  IDX=aIDX
,
  DATA=aDATA
  where  REPQ_RCVID = aREPQ_RCVID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPQ_RCV',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPQ_RCV');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPQ_RCV');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPQ_RCV',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPQ_RCVid,aLogInstanceID=>aInstanceID);
 insert into   REPQ_RCV
 (  REPQ_RCVID 
,InstanceID
,PEKF

,IDX

,DATA

 ) values ( aREPQ_RCVID 
,aInstanceID
,aPEKF

,aIDX

,aDATA

 ); 
 REPQ_RCV_SINIT( aCURSESSION,aREPQ_RCVid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPQ_RCV_PARENT /*Очередь приема*/ (
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
  select  INSTANCEID into aParentID from REPQ_RCV where  REPQ_RCVid=aRowID;
 end; 


procedure REPQ_RCV_ISLOCKED /*Очередь приема*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPQ_RCV where REPQ_RCVid=aRowID;
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
  REPQ_RCV_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPQ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPQ_RCV_LOCK /*Очередь приема*/ (
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
 REPQ_RCV_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPQ_RCV_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPQ_RCV where REPQ_RCVid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPQ_RCV');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPQ_RCV set LockUserID =auserID ,LockSessionID =null where REPQ_RCVid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPQ_RCV set LockUserID =null,LockSessionID =aCURSESSION  where REPQ_RCVid=aRowID;
     return;
   end if;
 end ;


procedure REPQ_RCV_HCL /*Очередь приема*/ (
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


procedure REPQ_RCV_UNLOCK /*Очередь приема*/ (
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
 REPQ_RCV_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPQ_RCV set LockUserID =null  where REPQ_RCVid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPQ_RCV set LockSessionID =null  where REPQ_RCVid=aRowID;
     return;
   end if;
 end; 


procedure REPQ_RCV_SINIT /*Очередь приема*/ (
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
 select  SecurityStyleID into atmpID from REPQ_RCV where REPQ_RCVid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPQ_RCV');
    return;
  end if;
if aSecurityStyleID is null then
 REPQ_RCV_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPQ_RCV set securitystyleid =aStyleID where REPQ_RCVid = aRowID;
else 
 update REPQ_RCV set securitystyleid =aSecurityStyleID where REPQ_RCVid = aRowID;
end if; 
end ; 


procedure REPQ_RCV_propagate /*Очередь приема*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPQ_RCV where REPQ_RCVid=aRowid;
end;



procedure REPQ_SND_BRIEF  (
 aCURSESSION CHAR,
 aREPQ_SNDid CHAR,
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
if aREPQ_SNDid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPQ_SND where REPQ_SNDID=aREPQ_SNDID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPQ_SND where REPQ_SNDid=aREPQ_SNDID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPQ_SND');
    return;
  end if;
  aBRIEF:=func.REPQ_SND_BRIEF_F(aREPQ_SNDid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPQ_SND_DELETE /*Очередь отсылки*/ (
 aCURSESSION CHAR,
 aREPQ_SNDid CHAR,
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
select count(*) into existsCnt from REPQ_SND where REPQ_SNDID=aREPQ_SNDID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPQ_SND where REPQ_SNDid=aREPQ_SNDID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPQ_SND',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPQ_SND');
      return;
    end if;
  end if;
 --  verify lock  --
 REPQ_SND_ISLOCKED( acursession=>acursession,aROWID=>aREPQ_SNDid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPQ_SND');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPQ_SND',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPQ_SNDid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPQ_SND is select  instanceid ID from instance where OwnerPartName ='REPQ_SND' and OwnerRowID=aREPQ_SNDid;
row_REPQ_SND  chld_REPQ_SND%ROWTYPE;
begin
--open chld_REPQ_SND;
for row_REPQ_SND in chld_REPQ_SND loop
 Kernel.INSTANCE_OWNER (acursession,row_REPQ_SND.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPQ_SND.id);
end loop;
--close chld_REPQ_SND;
end ;
  delete from  REPQ_SND 
  where  REPQ_SNDID = aREPQ_SNDID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Очередь отсылки*/
procedure REPQ_SND_SAVE /*Очередь отсылки*/ (
 aCURSESSION CHAR,
 aREPQ_SNDid CHAR,
aInstanceID CHAR 
,aPEKF CHAR/* Филиал *//* Филиал */
,aIDX
 NUMBER/* Индекс *//* Индекс */
,aDATA VARCHAR2/* Данные *//* Данные */
,aACCEPTED
 NUMBER/* ACCEPTED *//* ACCEPTED */
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
select count(*) into existsCnt from REPQ_SND where REPQ_SNDID=aREPQ_SNDID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPQ_SND where REPQ_SNDid=aREPQ_SNDID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPQ_SND',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPQ_SND');
      return;
    end if;
  end if;
 --  verify lock  --
 REPQ_SND_ISLOCKED( acursession=>acursession,aROWID=>aREPQ_SNDid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPQ_SND');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPQ_SND',
 aVERB=>'EDITROW',  aThe_Resource=>aREPQ_SNDid,aLogInstanceID=>aInstanceID);
 update  REPQ_SND set ChangeStamp=sysdate
,
  PEKF=aPEKF
,
  IDX=aIDX
,
  DATA=aDATA
,
  ACCEPTED=aACCEPTED
  where  REPQ_SNDID = aREPQ_SNDID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPQ_SND',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPQ_SND');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPQ_SND');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPQ_SND',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPQ_SNDid,aLogInstanceID=>aInstanceID);
 insert into   REPQ_SND
 (  REPQ_SNDID 
,InstanceID
,PEKF

,IDX

,DATA

,ACCEPTED

 ) values ( aREPQ_SNDID 
,aInstanceID
,aPEKF

,aIDX

,aDATA

,aACCEPTED

 ); 
 REPQ_SND_SINIT( aCURSESSION,aREPQ_SNDid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPQ_SND_PARENT /*Очередь отсылки*/ (
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
  select  INSTANCEID into aParentID from REPQ_SND where  REPQ_SNDid=aRowID;
 end; 


procedure REPQ_SND_ISLOCKED /*Очередь отсылки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPQ_SND where REPQ_SNDid=aRowID;
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
  REPQ_SND_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPQ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPQ_SND_LOCK /*Очередь отсылки*/ (
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
 REPQ_SND_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPQ_SND_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPQ_SND where REPQ_SNDid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPQ_SND');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPQ_SND set LockUserID =auserID ,LockSessionID =null where REPQ_SNDid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPQ_SND set LockUserID =null,LockSessionID =aCURSESSION  where REPQ_SNDid=aRowID;
     return;
   end if;
 end ;


procedure REPQ_SND_HCL /*Очередь отсылки*/ (
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


procedure REPQ_SND_UNLOCK /*Очередь отсылки*/ (
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
 REPQ_SND_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPQ_SND set LockUserID =null  where REPQ_SNDid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPQ_SND set LockSessionID =null  where REPQ_SNDid=aRowID;
     return;
   end if;
 end; 


procedure REPQ_SND_SINIT /*Очередь отсылки*/ (
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
 select  SecurityStyleID into atmpID from REPQ_SND where REPQ_SNDid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPQ_SND');
    return;
  end if;
if aSecurityStyleID is null then
 REPQ_SND_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPQ_SND set securitystyleid =aStyleID where REPQ_SNDid = aRowID;
else 
 update REPQ_SND set securitystyleid =aSecurityStyleID where REPQ_SNDid = aRowID;
end if; 
end ; 


procedure REPQ_SND_propagate /*Очередь отсылки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPQ_SND where REPQ_SNDid=aRowid;
end;



procedure REPQ_DATA_BRIEF  (
 aCURSESSION CHAR,
 aREPQ_DATAid CHAR,
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
if aREPQ_DATAid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPQ_DATA where REPQ_DATAID=aREPQ_DATAID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPQ_DATA where REPQ_DATAid=aREPQ_DATAID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPQ_DATA');
    return;
  end if;
  aBRIEF:=func.REPQ_DATA_BRIEF_F(aREPQ_DATAid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPQ_DATA_DELETE /*REPQ_DATA*/ (
 aCURSESSION CHAR,
 aREPQ_DATAid CHAR,
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
select count(*) into existsCnt from REPQ_DATA where REPQ_DATAID=aREPQ_DATAID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPQ_DATA where REPQ_DATAid=aREPQ_DATAID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPQ_DATA',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPQ_DATA');
      return;
    end if;
  end if;
 --  verify lock  --
 REPQ_DATA_ISLOCKED( acursession=>acursession,aROWID=>aREPQ_DATAid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPQ_DATA');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPQ_DATA',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPQ_DATAid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPQ_DATA is select  instanceid ID from instance where OwnerPartName ='REPQ_DATA' and OwnerRowID=aREPQ_DATAid;
row_REPQ_DATA  chld_REPQ_DATA%ROWTYPE;
begin
--open chld_REPQ_DATA;
for row_REPQ_DATA in chld_REPQ_DATA loop
 Kernel.INSTANCE_OWNER (acursession,row_REPQ_DATA.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPQ_DATA.id);
end loop;
--close chld_REPQ_DATA;
end ;
  delete from  REPQ_DATA 
  where  REPQ_DATAID = aREPQ_DATAID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*REPQ_DATA*/
procedure REPQ_DATA_SAVE /*REPQ_DATA*/ (
 aCURSESSION CHAR,
 aREPQ_DATAid CHAR,
aInstanceID CHAR 
,aData VARCHAR2/* Data *//* Data */
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
select count(*) into existsCnt from REPQ_DATA where REPQ_DATAID=aREPQ_DATAID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPQ_DATA where REPQ_DATAid=aREPQ_DATAID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPQ_DATA',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPQ_DATA');
      return;
    end if;
  end if;
 --  verify lock  --
 REPQ_DATA_ISLOCKED( acursession=>acursession,aROWID=>aREPQ_DATAid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPQ_DATA');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPQ_DATA',
 aVERB=>'EDITROW',  aThe_Resource=>aREPQ_DATAid,aLogInstanceID=>aInstanceID);
 update  REPQ_DATA set ChangeStamp=sysdate
,
  Data=aData
  where  REPQ_DATAID = aREPQ_DATAID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPQ_DATA',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPQ_DATA');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPQ_DATA');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPQ_DATA',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPQ_DATAid,aLogInstanceID=>aInstanceID);
 insert into   REPQ_DATA
 (  REPQ_DATAID 
,InstanceID
,Data

 ) values ( aREPQ_DATAID 
,aInstanceID
,aData

 ); 
 REPQ_DATA_SINIT( aCURSESSION,aREPQ_DATAid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPQ_DATA_PARENT /*REPQ_DATA*/ (
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
  select  INSTANCEID into aParentID from REPQ_DATA where  REPQ_DATAid=aRowID;
 end; 


procedure REPQ_DATA_ISLOCKED /*REPQ_DATA*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPQ_DATA where REPQ_DATAid=aRowID;
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
  REPQ_DATA_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPQ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPQ_DATA_LOCK /*REPQ_DATA*/ (
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
 REPQ_DATA_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPQ_DATA_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPQ_DATA where REPQ_DATAid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPQ_DATA');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPQ_DATA set LockUserID =auserID ,LockSessionID =null where REPQ_DATAid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPQ_DATA set LockUserID =null,LockSessionID =aCURSESSION  where REPQ_DATAid=aRowID;
     return;
   end if;
 end ;


procedure REPQ_DATA_HCL /*REPQ_DATA*/ (
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


procedure REPQ_DATA_UNLOCK /*REPQ_DATA*/ (
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
 REPQ_DATA_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPQ_DATA set LockUserID =null  where REPQ_DATAid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPQ_DATA set LockSessionID =null  where REPQ_DATAid=aRowID;
     return;
   end if;
 end; 


procedure REPQ_DATA_SINIT /*REPQ_DATA*/ (
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
 select  SecurityStyleID into atmpID from REPQ_DATA where REPQ_DATAid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPQ_DATA');
    return;
  end if;
if aSecurityStyleID is null then
 REPQ_DATA_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPQ_DATA set securitystyleid =aStyleID where REPQ_DATAid = aRowID;
else 
 update REPQ_DATA set securitystyleid =aSecurityStyleID where REPQ_DATAid = aRowID;
end if; 
end ; 


procedure REPQ_DATA_propagate /*REPQ_DATA*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPQ_DATA where REPQ_DATAid=aRowid;
end;


end REPQ;

/



