
/* --REPD*/

 create or replace package body REPD as

procedure REPD_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='REPD'
then
declare cursor child_REPD_LOCKED is select REPD_LOCKED.REPD_LOCKEDid ID from REPD_LOCKED where  REPD_LOCKED.InstanceID = ainstanceid;
row_REPD_LOCKED  child_REPD_LOCKED%ROWTYPE;
begin
--open child_REPD_LOCKED;
for row_REPD_LOCKED in child_REPD_LOCKED loop
 REPD_LOCKED_DELETE (acursession,row_REPD_LOCKED.id,aInstanceID);
end loop;
--close child_REPD_LOCKED;
end;
declare cursor child_REPD_RequestQuery is select REPD_RequestQuery.REPD_RequestQueryid ID from REPD_RequestQuery where  REPD_RequestQuery.InstanceID = ainstanceid;
row_REPD_RequestQuery  child_REPD_RequestQuery%ROWTYPE;
begin
--open child_REPD_RequestQuery;
for row_REPD_RequestQuery in child_REPD_RequestQuery loop
 REPD_RequestQuery_DELETE (acursession,row_REPD_RequestQuery.id,aInstanceID);
end loop;
--close child_REPD_RequestQuery;
end;
declare cursor child_REPD_PROV is select REPD_PROV.REPD_PROVid ID from REPD_PROV where  REPD_PROV.InstanceID = ainstanceid;
row_REPD_PROV  child_REPD_PROV%ROWTYPE;
begin
--open child_REPD_PROV;
for row_REPD_PROV in child_REPD_PROV loop
 REPD_PROV_DELETE (acursession,row_REPD_PROV.id,aInstanceID);
end loop;
--close child_REPD_PROV;
end;
declare cursor child_REPD_SRV is select REPD_SRV.REPD_SRVid ID from REPD_SRV where  REPD_SRV.InstanceID = ainstanceid;
row_REPD_SRV  child_REPD_SRV%ROWTYPE;
begin
--open child_REPD_SRV;
for row_REPD_SRV in child_REPD_SRV loop
 REPD_SRV_DELETE (acursession,row_REPD_SRV.id,aInstanceID);
end loop;
--close child_REPD_SRV;
end;
declare cursor child_REPD_SendQ is select REPD_SendQ.REPD_SendQid ID from REPD_SendQ where  REPD_SendQ.InstanceID = ainstanceid;
row_REPD_SendQ  child_REPD_SendQ%ROWTYPE;
begin
--open child_REPD_SendQ;
for row_REPD_SendQ in child_REPD_SendQ loop
 REPD_SendQ_DELETE (acursession,row_REPD_SendQ.id,aInstanceID);
end loop;
--close child_REPD_SendQ;
end;
declare cursor child_REPD_RecvQ is select REPD_RecvQ.REPD_RecvQid ID from REPD_RecvQ where  REPD_RecvQ.InstanceID = ainstanceid;
row_REPD_RecvQ  child_REPD_RecvQ%ROWTYPE;
begin
--open child_REPD_RecvQ;
for row_REPD_RecvQ in child_REPD_RecvQ loop
 REPD_RecvQ_DELETE (acursession,row_REPD_RecvQ.id,aInstanceID);
end loop;
--close child_REPD_RecvQ;
end;
return;
<<del_error>>
return;
end if;
end;
procedure REPD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'REPD'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_REPD_LOCKED is select REPD_LOCKED.REPD_LOCKEDid ID from REPD_LOCKED where  REPD_LOCKED.InstanceID = arowid;
ROW_REPD_LOCKED  lch_REPD_LOCKED%ROWTYPE;
begin
--open lch_REPD_LOCKED;
for row_REPD_LOCKED in lch_REPD_LOCKED loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from REPD_LOCKED where REPD_LOCKEDid=row_REPD_LOCKED.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPD_LOCKED;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_REPD_LOCKED;
     return;
   end if; 
 end if; 
 REPD_LOCKED_HCL (acursession,ROW_REPD_LOCKED.id,aisLocked);
 if aisLocked >2 then
   close lch_REPD_LOCKED;
   return;
 end if;
 end loop;
--close lch_REPD_LOCKED;
end;
declare cursor lch_REPD_RequestQuery is select REPD_RequestQuery.REPD_RequestQueryid ID from REPD_RequestQuery where  REPD_RequestQuery.InstanceID = arowid;
ROW_REPD_RequestQuery  lch_REPD_RequestQuery%ROWTYPE;
begin
--open lch_REPD_RequestQuery;
for row_REPD_RequestQuery in lch_REPD_RequestQuery loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from REPD_RequestQuery where REPD_RequestQueryid=row_REPD_RequestQuery.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPD_RequestQuery;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_REPD_RequestQuery;
     return;
   end if; 
 end if; 
 REPD_RequestQuery_HCL (acursession,ROW_REPD_RequestQuery.id,aisLocked);
 if aisLocked >2 then
   close lch_REPD_RequestQuery;
   return;
 end if;
 end loop;
--close lch_REPD_RequestQuery;
end;
declare cursor lch_REPD_PROV is select REPD_PROV.REPD_PROVid ID from REPD_PROV where  REPD_PROV.InstanceID = arowid;
ROW_REPD_PROV  lch_REPD_PROV%ROWTYPE;
begin
--open lch_REPD_PROV;
for row_REPD_PROV in lch_REPD_PROV loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from REPD_PROV where REPD_PROVid=row_REPD_PROV.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPD_PROV;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_REPD_PROV;
     return;
   end if; 
 end if; 
 REPD_PROV_HCL (acursession,ROW_REPD_PROV.id,aisLocked);
 if aisLocked >2 then
   close lch_REPD_PROV;
   return;
 end if;
 end loop;
--close lch_REPD_PROV;
end;
declare cursor lch_REPD_SRV is select REPD_SRV.REPD_SRVid ID from REPD_SRV where  REPD_SRV.InstanceID = arowid;
ROW_REPD_SRV  lch_REPD_SRV%ROWTYPE;
begin
--open lch_REPD_SRV;
for row_REPD_SRV in lch_REPD_SRV loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from REPD_SRV where REPD_SRVid=row_REPD_SRV.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPD_SRV;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_REPD_SRV;
     return;
   end if; 
 end if; 
 REPD_SRV_HCL (acursession,ROW_REPD_SRV.id,aisLocked);
 if aisLocked >2 then
   close lch_REPD_SRV;
   return;
 end if;
 end loop;
--close lch_REPD_SRV;
end;
declare cursor lch_REPD_SendQ is select REPD_SendQ.REPD_SendQid ID from REPD_SendQ where  REPD_SendQ.InstanceID = arowid;
ROW_REPD_SendQ  lch_REPD_SendQ%ROWTYPE;
begin
--open lch_REPD_SendQ;
for row_REPD_SendQ in lch_REPD_SendQ loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from REPD_SendQ where REPD_SendQid=row_REPD_SendQ.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPD_SendQ;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_REPD_SendQ;
     return;
   end if; 
 end if; 
 REPD_SendQ_HCL (acursession,ROW_REPD_SendQ.id,aisLocked);
 if aisLocked >2 then
   close lch_REPD_SendQ;
   return;
 end if;
 end loop;
--close lch_REPD_SendQ;
end;
declare cursor lch_REPD_RecvQ is select REPD_RecvQ.REPD_RecvQid ID from REPD_RecvQ where  REPD_RecvQ.InstanceID = arowid;
ROW_REPD_RecvQ  lch_REPD_RecvQ%ROWTYPE;
begin
--open lch_REPD_RecvQ;
for row_REPD_RecvQ in lch_REPD_RecvQ loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from REPD_RecvQ where REPD_RecvQid=row_REPD_RecvQ.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPD_RecvQ;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_REPD_RecvQ;
     return;
   end if; 
 end if; 
 REPD_RecvQ_HCL (acursession,ROW_REPD_RecvQ.id,aisLocked);
 if aisLocked >2 then
   close lch_REPD_RecvQ;
   return;
 end if;
 end loop;
--close lch_REPD_RecvQ;
end;
 end if;
aIsLocked:=0;
end;
procedure REPD_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'REPD'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_REPD_LOCKED is select REPD_LOCKED.REPD_LOCKEDid id from REPD_LOCKED where  REPD_LOCKED.InstanceID = arowid;
row_REPD_LOCKED  pch_REPD_LOCKED%ROWTYPE;
begin
--open pch_REPD_LOCKED;
for row_REPD_LOCKED in  pch_REPD_LOCKED loop
 REPD_LOCKED_SINIT( acursession,row_REPD_LOCKED.id,assid);
 REPD_LOCKED_propagate( acursession,row_REPD_LOCKED.id);
end loop;
--close pch_REPD_LOCKED;
end;
declare cursor pch_REPD_RequestQuery is select REPD_RequestQuery.REPD_RequestQueryid id from REPD_RequestQuery where  REPD_RequestQuery.InstanceID = arowid;
row_REPD_RequestQuery  pch_REPD_RequestQuery%ROWTYPE;
begin
--open pch_REPD_RequestQuery;
for row_REPD_RequestQuery in  pch_REPD_RequestQuery loop
 REPD_RequestQuery_SINIT( acursession,row_REPD_RequestQuery.id,assid);
 REPD_RequestQuery_propagate( acursession,row_REPD_RequestQuery.id);
end loop;
--close pch_REPD_RequestQuery;
end;
declare cursor pch_REPD_PROV is select REPD_PROV.REPD_PROVid id from REPD_PROV where  REPD_PROV.InstanceID = arowid;
row_REPD_PROV  pch_REPD_PROV%ROWTYPE;
begin
--open pch_REPD_PROV;
for row_REPD_PROV in  pch_REPD_PROV loop
 REPD_PROV_SINIT( acursession,row_REPD_PROV.id,assid);
 REPD_PROV_propagate( acursession,row_REPD_PROV.id);
end loop;
--close pch_REPD_PROV;
end;
declare cursor pch_REPD_SRV is select REPD_SRV.REPD_SRVid id from REPD_SRV where  REPD_SRV.InstanceID = arowid;
row_REPD_SRV  pch_REPD_SRV%ROWTYPE;
begin
--open pch_REPD_SRV;
for row_REPD_SRV in  pch_REPD_SRV loop
 REPD_SRV_SINIT( acursession,row_REPD_SRV.id,assid);
 REPD_SRV_propagate( acursession,row_REPD_SRV.id);
end loop;
--close pch_REPD_SRV;
end;
declare cursor pch_REPD_SendQ is select REPD_SendQ.REPD_SendQid id from REPD_SendQ where  REPD_SendQ.InstanceID = arowid;
row_REPD_SendQ  pch_REPD_SendQ%ROWTYPE;
begin
--open pch_REPD_SendQ;
for row_REPD_SendQ in  pch_REPD_SendQ loop
 REPD_SendQ_SINIT( acursession,row_REPD_SendQ.id,assid);
 REPD_SendQ_propagate( acursession,row_REPD_SendQ.id);
end loop;
--close pch_REPD_SendQ;
end;
declare cursor pch_REPD_RecvQ is select REPD_RecvQ.REPD_RecvQid id from REPD_RecvQ where  REPD_RecvQ.InstanceID = arowid;
row_REPD_RecvQ  pch_REPD_RecvQ%ROWTYPE;
begin
--open pch_REPD_RecvQ;
for row_REPD_RecvQ in  pch_REPD_RecvQ loop
 REPD_RecvQ_SINIT( acursession,row_REPD_RecvQ.id,assid);
 REPD_RecvQ_propagate( acursession,row_REPD_RecvQ.id);
end loop;
--close pch_REPD_RecvQ;
end;
 end if; 
end;



procedure REPD_LOCKED_BRIEF  (
 aCURSESSION CHAR,
 aREPD_LOCKEDid CHAR,
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
if aREPD_LOCKEDid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPD_LOCKED where REPD_LOCKEDID=aREPD_LOCKEDID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPD_LOCKED where REPD_LOCKEDid=aREPD_LOCKEDID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPD_LOCKED');
    return;
  end if;
  aBRIEF:=func.REPD_LOCKED_BRIEF_F(aREPD_LOCKEDid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPD_LOCKED_DELETE /*Очередь заблокированных объектов*/ (
 aCURSESSION CHAR,
 aREPD_LOCKEDid CHAR,
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
select count(*) into existsCnt from REPD_LOCKED where REPD_LOCKEDID=aREPD_LOCKEDID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPD_LOCKED where REPD_LOCKEDid=aREPD_LOCKEDID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPD_LOCKED',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPD_LOCKED');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_LOCKED_ISLOCKED( acursession=>acursession,aROWID=>aREPD_LOCKEDid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPD_LOCKED');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPD_LOCKED',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPD_LOCKEDid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPD_LOCKED is select  instanceid ID from instance where OwnerPartName ='REPD_LOCKED' and OwnerRowID=aREPD_LOCKEDid;
row_REPD_LOCKED  chld_REPD_LOCKED%ROWTYPE;
begin
--open chld_REPD_LOCKED;
for row_REPD_LOCKED in chld_REPD_LOCKED loop
 Kernel.INSTANCE_OWNER (acursession,row_REPD_LOCKED.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPD_LOCKED.id);
end loop;
--close chld_REPD_LOCKED;
end ;
  delete from  REPD_LOCKED 
  where  REPD_LOCKEDID = aREPD_LOCKEDID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Очередь заблокированных объектов*/
procedure REPD_LOCKED_SAVE /*Очередь заблокированных объектов*/ (
 aCURSESSION CHAR,
 aREPD_LOCKEDid CHAR,
aInstanceID CHAR 
,aLastTry
 DATE/* Последняя разработка *//* Последняя разработка */
,aSourceFile
 VARCHAR2/* Файл данных *//* Файл данных */
,aReplicaRowID CHAR/* Идентификатор строки реплики *//* Идентификатор строки реплики */
,aFirstTry
 DATE/* Первая обработка *//* Первая обработка */
,aStructType
 VARCHAR2 := null /* Тип строки *//* Тип строки */
,aObjectType
 VARCHAR2/* Тип объекта *//* Тип объекта */
,aThe_RowID CHAR := null /* Идетнификатор строки *//* Идетнификатор строки */
,aThe_InstanceID CHAR/* Объект *//* Объект */
,aReplicaPackID CHAR/* ReplicaPackID *//* ReplicaPackID */
,aPartCount
 NUMBER := null /* PartCount *//* PartCount */
,aPartNumber
 NUMBER := null /* PartNumber *//* PartNumber */
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
select count(*) into existsCnt from REPD_LOCKED where REPD_LOCKEDID=aREPD_LOCKEDID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPD_LOCKED where REPD_LOCKEDid=aREPD_LOCKEDID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPD_LOCKED',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPD_LOCKED');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_LOCKED_ISLOCKED( acursession=>acursession,aROWID=>aREPD_LOCKEDid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_LOCKED');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_LOCKED',
 aVERB=>'EDITROW',  aThe_Resource=>aREPD_LOCKEDid,aLogInstanceID=>aInstanceID);
 update  REPD_LOCKED set ChangeStamp=sysdate
,
  LastTry=aLastTry
,
  SourceFile=aSourceFile
,
  ReplicaRowID=aReplicaRowID
,
  FirstTry=aFirstTry
,
  StructType=aStructType
,
  ObjectType=aObjectType
,
  The_RowID=aThe_RowID
,
  The_InstanceID=aThe_InstanceID
,
  ReplicaPackID=aReplicaPackID
,
  PartCount=aPartCount
,
  PartNumber=aPartNumber
  where  REPD_LOCKEDID = aREPD_LOCKEDID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPD_LOCKED',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPD_LOCKED');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_LOCKED');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_LOCKED',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPD_LOCKEDid,aLogInstanceID=>aInstanceID);
 insert into   REPD_LOCKED
 (  REPD_LOCKEDID 
,InstanceID
,LastTry

,SourceFile

,ReplicaRowID

,FirstTry

,StructType

,ObjectType

,The_RowID

,The_InstanceID

,ReplicaPackID

,PartCount

,PartNumber

 ) values ( aREPD_LOCKEDID 
,aInstanceID
,aLastTry

,aSourceFile

,aReplicaRowID

,aFirstTry

,aStructType

,aObjectType

,aThe_RowID

,aThe_InstanceID

,aReplicaPackID

,aPartCount

,aPartNumber

 ); 
 REPD_LOCKED_SINIT( aCURSESSION,aREPD_LOCKEDid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPD_LOCKED_PARENT /*Очередь заблокированных объектов*/ (
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
  select  INSTANCEID into aParentID from REPD_LOCKED where  REPD_LOCKEDid=aRowID;
 end; 


procedure REPD_LOCKED_ISLOCKED /*Очередь заблокированных объектов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPD_LOCKED where REPD_LOCKEDid=aRowID;
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
  REPD_LOCKED_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPD_LOCKED_LOCK /*Очередь заблокированных объектов*/ (
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
 REPD_LOCKED_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPD_LOCKED_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPD_LOCKED where REPD_LOCKEDid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPD_LOCKED');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPD_LOCKED set LockUserID =auserID ,LockSessionID =null where REPD_LOCKEDid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPD_LOCKED set LockUserID =null,LockSessionID =aCURSESSION  where REPD_LOCKEDid=aRowID;
     return;
   end if;
 end ;


procedure REPD_LOCKED_HCL /*Очередь заблокированных объектов*/ (
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


procedure REPD_LOCKED_UNLOCK /*Очередь заблокированных объектов*/ (
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
 REPD_LOCKED_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPD_LOCKED set LockUserID =null  where REPD_LOCKEDid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPD_LOCKED set LockSessionID =null  where REPD_LOCKEDid=aRowID;
     return;
   end if;
 end; 


procedure REPD_LOCKED_SINIT /*Очередь заблокированных объектов*/ (
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
 select  SecurityStyleID into atmpID from REPD_LOCKED where REPD_LOCKEDid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPD_LOCKED');
    return;
  end if;
if aSecurityStyleID is null then
 REPD_LOCKED_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPD_LOCKED set securitystyleid =aStyleID where REPD_LOCKEDid = aRowID;
else 
 update REPD_LOCKED set securitystyleid =aSecurityStyleID where REPD_LOCKEDid = aRowID;
end if; 
end ; 


procedure REPD_LOCKED_propagate /*Очередь заблокированных объектов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPD_LOCKED where REPD_LOCKEDid=aRowid;
end;



procedure REPD_RequestQuery_BRIEF  (
 aCURSESSION CHAR,
 aREPD_RequestQueryid CHAR,
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
if aREPD_RequestQueryid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPD_RequestQuery where REPD_RequestQueryID=aREPD_RequestQueryID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPD_RequestQuery where REPD_RequestQueryid=aREPD_RequestQueryID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPD_RequestQuery');
    return;
  end if;
  aBRIEF:=func.REPD_RequestQuery_BRIEF_F(aREPD_RequestQueryid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPD_RequestQuery_DELETE /*Запрос данных на объект\ строку*/ (
 aCURSESSION CHAR,
 aREPD_RequestQueryid CHAR,
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
select count(*) into existsCnt from REPD_RequestQuery where REPD_RequestQueryID=aREPD_RequestQueryID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPD_RequestQuery where REPD_RequestQueryid=aREPD_RequestQueryID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPD_RequestQuery',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPD_RequestQuery');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_RequestQuery_ISLOCKED( acursession=>acursession,aROWID=>aREPD_RequestQueryid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPD_RequestQuery');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_REPD_ResQueryRcv is select REPD_ResQueryRcv.REPD_ResQueryRcvid ID from REPD_ResQueryRcv where  REPD_ResQueryRcv.ParentStructRowID = aREPD_RequestQueryid;
    child_REPD_ResQueryRcv_rec  child_REPD_ResQueryRcv%ROWTYPE;
    begin
    --open child_REPD_ResQueryRcv;
      for child_REPD_ResQueryRcv_rec in child_REPD_ResQueryRcv loop
      REPD_ResQueryRcv_DELETE (acursession,child_REPD_ResQueryRcv_rec.id,aInstanceid);
      end loop;
      --close child_REPD_ResQueryRcv;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPD_RequestQuery',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPD_RequestQueryid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPD_RequestQuery is select  instanceid ID from instance where OwnerPartName ='REPD_RequestQuery' and OwnerRowID=aREPD_RequestQueryid;
row_REPD_RequestQuery  chld_REPD_RequestQuery%ROWTYPE;
begin
--open chld_REPD_RequestQuery;
for row_REPD_RequestQuery in chld_REPD_RequestQuery loop
 Kernel.INSTANCE_OWNER (acursession,row_REPD_RequestQuery.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPD_RequestQuery.id);
end loop;
--close chld_REPD_RequestQuery;
end ;
  delete from  REPD_RequestQuery 
  where  REPD_RequestQueryID = aREPD_RequestQueryID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Запрос данных на объект\ строку*/
procedure REPD_RequestQuery_SAVE /*Запрос данных на объект\ строку*/ (
 aCURSESSION CHAR,
 aREPD_RequestQueryid CHAR,
aInstanceID CHAR 
,aTheRowID CHAR := null /* TheRowID *//* TheRowID */
,aReqPartName
 VARCHAR2 := null /* ReqPartName *//* ReqPartName */
,aObjectID CHAR := null /* ObjectID *//* ObjectID */
,aSourceSrv CHAR/* SourceSrv *//* SourceSrv */
,aSendRecord CHAR := null /* SendRecord *//* SendRecord */
,aDestSrv CHAR := null /* DestSrv *//* DestSrv */
,aProvider CHAR/* Provider *//* Provider */
,aReqTypeName
 VARCHAR2 := null /* ReqTypeName *//* ReqTypeName */
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
select count(*) into existsCnt from REPD_RequestQuery where REPD_RequestQueryID=aREPD_RequestQueryID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPD_RequestQuery where REPD_RequestQueryid=aREPD_RequestQueryID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPD_RequestQuery',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPD_RequestQuery');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_RequestQuery_ISLOCKED( acursession=>acursession,aROWID=>aREPD_RequestQueryid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_RequestQuery');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_RequestQuery',
 aVERB=>'EDITROW',  aThe_Resource=>aREPD_RequestQueryid,aLogInstanceID=>aInstanceID);
 update  REPD_RequestQuery set ChangeStamp=sysdate
,
  TheRowID=aTheRowID
,
  ReqPartName=aReqPartName
,
  ObjectID=aObjectID
,
  SourceSrv=aSourceSrv
,
  SendRecord=aSendRecord
,
  DestSrv=aDestSrv
,
  Provider=aProvider
,
  ReqTypeName=aReqTypeName
  where  REPD_RequestQueryID = aREPD_RequestQueryID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPD_RequestQuery',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPD_RequestQuery');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_RequestQuery');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_RequestQuery',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPD_RequestQueryid,aLogInstanceID=>aInstanceID);
 insert into   REPD_RequestQuery
 (  REPD_RequestQueryID 
,InstanceID
,TheRowID

,ReqPartName

,ObjectID

,SourceSrv

,SendRecord

,DestSrv

,Provider

,ReqTypeName

 ) values ( aREPD_RequestQueryID 
,aInstanceID
,aTheRowID

,aReqPartName

,aObjectID

,aSourceSrv

,aSendRecord

,aDestSrv

,aProvider

,aReqTypeName

 ); 
 REPD_RequestQuery_SINIT( aCURSESSION,aREPD_RequestQueryid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPD_RequestQuery_PARENT /*Запрос данных на объект\ строку*/ (
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
  select  INSTANCEID into aParentID from REPD_RequestQuery where  REPD_RequestQueryid=aRowID;
 end; 


procedure REPD_RequestQuery_ISLOCKED /*Запрос данных на объект\ строку*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPD_RequestQuery where REPD_RequestQueryid=aRowID;
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
  REPD_RequestQuery_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPD_RequestQuery_LOCK /*Запрос данных на объект\ строку*/ (
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
 REPD_RequestQuery_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPD_RequestQuery_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPD_RequestQuery where REPD_RequestQueryid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPD_RequestQuery');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPD_RequestQuery set LockUserID =auserID ,LockSessionID =null where REPD_RequestQueryid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPD_RequestQuery set LockUserID =null,LockSessionID =aCURSESSION  where REPD_RequestQueryid=aRowID;
     return;
   end if;
 end ;


procedure REPD_RequestQuery_HCL /*Запрос данных на объект\ строку*/ (
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
declare cursor lch_REPD_ResQueryRcv is select REPD_ResQueryRcv.REPD_ResQueryRcvid ID from REPD_ResQueryRcv where  REPD_ResQueryRcv.ParentStructRowID = aRowid;
row_REPD_ResQueryRcv lch_REPD_ResQueryRcv%ROWTYPE;
begin  
--open lch_REPD_ResQueryRcv;
for row_REPD_ResQueryRcv in lch_REPD_ResQueryRcv
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from REPD_ResQueryRcv where REPD_ResQueryRcvid=row_REPD_ResQueryRcv.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPD_ResQueryRcv;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_REPD_ResQueryRcv;
     return;
   end if; 
 end if;  
 REPD_ResQueryRcv_HCL (acursession,row_REPD_ResQueryRcv.id,aisLocked);
 if aisLocked >2 then
   close lch_REPD_ResQueryRcv;
   return;
 end if;
end loop;
--close lch_REPD_ResQueryRcv;
end;
aIsLocked :=0;
end;


procedure REPD_RequestQuery_UNLOCK /*Запрос данных на объект\ строку*/ (
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
 REPD_RequestQuery_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPD_RequestQuery set LockUserID =null  where REPD_RequestQueryid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPD_RequestQuery set LockSessionID =null  where REPD_RequestQueryid=aRowID;
     return;
   end if;
 end; 


procedure REPD_RequestQuery_SINIT /*Запрос данных на объект\ строку*/ (
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
 select  SecurityStyleID into atmpID from REPD_RequestQuery where REPD_RequestQueryid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPD_RequestQuery');
    return;
  end if;
if aSecurityStyleID is null then
 REPD_RequestQuery_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPD_RequestQuery set securitystyleid =aStyleID where REPD_RequestQueryid = aRowID;
else 
 update REPD_RequestQuery set securitystyleid =aSecurityStyleID where REPD_RequestQueryid = aRowID;
end if; 
end ; 


procedure REPD_RequestQuery_propagate /*Запрос данных на объект\ строку*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPD_RequestQuery where REPD_RequestQueryid=aRowid;
declare cursor pch_REPD_ResQueryRcv  is select REPD_ResQueryRcv.REPD_ResQueryRcvid ID from REPD_ResQueryRcv where  REPD_ResQueryRcv.ParentStructRowID = aRowid;
row_REPD_ResQueryRcv  pch_REPD_ResQueryRcv%ROWTYPE;
begin
--open pch_REPD_ResQueryRcv;
for row_REPD_ResQueryRcv in pch_REPD_ResQueryRcv loop
   REPD_ResQueryRcv_SINIT( acursession,row_REPD_ResQueryRcv.id,assid);
   REPD_ResQueryRcv_propagate( acursession,row_REPD_ResQueryRcv.id);
end loop;
--close pch_REPD_ResQueryRcv;
end;
end;



procedure REPD_ResQueryRcv_BRIEF  (
 aCURSESSION CHAR,
 aREPD_ResQueryRcvid CHAR,
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
if aREPD_ResQueryRcvid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPD_ResQueryRcv where REPD_ResQueryRcvID=aREPD_ResQueryRcvID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPD_ResQueryRcv where REPD_ResQueryRcvid=aREPD_ResQueryRcvID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPD_ResQueryRcv');
    return;
  end if;
  aBRIEF:=func.REPD_ResQueryRcv_BRIEF_F(aREPD_ResQueryRcvid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPD_ResQueryRcv_DELETE /*Результат запроса*/ (
 aCURSESSION CHAR,
 aREPD_ResQueryRcvid CHAR,
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
select count(*) into existsCnt from REPD_ResQueryRcv where REPD_ResQueryRcvID=aREPD_ResQueryRcvID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPD_ResQueryRcv where REPD_ResQueryRcvid=aREPD_ResQueryRcvID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPD_ResQueryRcv',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPD_ResQueryRcv');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_ResQueryRcv_ISLOCKED( acursession=>acursession,aROWID=>aREPD_ResQueryRcvid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPD_ResQueryRcv');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPD_ResQueryRcv',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPD_ResQueryRcvid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPD_ResQueryRcv is select  instanceid ID from instance where OwnerPartName ='REPD_ResQueryRcv' and OwnerRowID=aREPD_ResQueryRcvid;
row_REPD_ResQueryRcv  chld_REPD_ResQueryRcv%ROWTYPE;
begin
--open chld_REPD_ResQueryRcv;
for row_REPD_ResQueryRcv in chld_REPD_ResQueryRcv loop
 Kernel.INSTANCE_OWNER (acursession,row_REPD_ResQueryRcv.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPD_ResQueryRcv.id);
end loop;
--close chld_REPD_ResQueryRcv;
end ;
  delete from  REPD_ResQueryRcv 
  where  REPD_ResQueryRcvID = aREPD_ResQueryRcvID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Результат запроса*/
procedure REPD_ResQueryRcv_SAVE /*Результат запроса*/ (
 aCURSESSION CHAR,
 aREPD_ResQueryRcvid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aReceiveRec CHAR/* ReceiveRec *//* ReceiveRec */
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
select count(*) into existsCnt from REPD_ResQueryRcv where REPD_ResQueryRcvID=aREPD_ResQueryRcvID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPD_ResQueryRcv where REPD_ResQueryRcvid=aREPD_ResQueryRcvID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPD_ResQueryRcv',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPD_ResQueryRcv');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_ResQueryRcv_ISLOCKED( acursession=>acursession,aROWID=>aREPD_ResQueryRcvid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_ResQueryRcv');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_ResQueryRcv',
 aVERB=>'EDITROW',  aThe_Resource=>aREPD_ResQueryRcvid,aLogInstanceID=>aInstanceID);
 update  REPD_ResQueryRcv set ChangeStamp=sysdate
,
  ReceiveRec=aReceiveRec
  where  REPD_ResQueryRcvID = aREPD_ResQueryRcvID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from REPD_RequestQuery where REPD_RequestQueryid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPD_ResQueryRcv',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPD_ResQueryRcv');
      return;
    end if;
 end if;
 REPD_RequestQuery_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_ResQueryRcv');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_ResQueryRcv',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPD_ResQueryRcvid,aLogInstanceID=>aInstanceID);
 insert into   REPD_ResQueryRcv
 (  REPD_ResQueryRcvID 
,ParentStructRowID
,ReceiveRec

 ) values ( aREPD_ResQueryRcvID 
,aParentStructRowID
,aReceiveRec

 ); 
 REPD_ResQueryRcv_SINIT( aCURSESSION,aREPD_ResQueryRcvid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPD_ResQueryRcv_PARENT /*Результат запроса*/ (
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
  select ParentStructRowID into aParentID  from REPD_ResQueryRcv where  REPD_ResQueryRcvid=aRowID;
  aParentTable := 'REPD_RequestQuery';
 end; 


procedure REPD_ResQueryRcv_ISLOCKED /*Результат запроса*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPD_ResQueryRcv where REPD_ResQueryRcvid=aRowID;
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
  REPD_ResQueryRcv_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPD_ResQueryRcv_LOCK /*Результат запроса*/ (
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
 REPD_ResQueryRcv_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPD_ResQueryRcv_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPD_ResQueryRcv where REPD_ResQueryRcvid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPD_ResQueryRcv');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPD_ResQueryRcv set LockUserID =auserID ,LockSessionID =null where REPD_ResQueryRcvid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPD_ResQueryRcv set LockUserID =null,LockSessionID =aCURSESSION  where REPD_ResQueryRcvid=aRowID;
     return;
   end if;
 end ;


procedure REPD_ResQueryRcv_HCL /*Результат запроса*/ (
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


procedure REPD_ResQueryRcv_UNLOCK /*Результат запроса*/ (
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
 REPD_ResQueryRcv_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPD_ResQueryRcv set LockUserID =null  where REPD_ResQueryRcvid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPD_ResQueryRcv set LockSessionID =null  where REPD_ResQueryRcvid=aRowID;
     return;
   end if;
 end; 


procedure REPD_ResQueryRcv_SINIT /*Результат запроса*/ (
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
 select  SecurityStyleID into atmpID from REPD_ResQueryRcv where REPD_ResQueryRcvid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPD_ResQueryRcv');
    return;
  end if;
if aSecurityStyleID is null then
 REPD_ResQueryRcv_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPD_ResQueryRcv set securitystyleid =aStyleID where REPD_ResQueryRcvid = aRowID;
else 
 update REPD_ResQueryRcv set securitystyleid =aSecurityStyleID where REPD_ResQueryRcvid = aRowID;
end if; 
end ; 


procedure REPD_ResQueryRcv_propagate /*Результат запроса*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPD_ResQueryRcv where REPD_ResQueryRcvid=aRowid;
end;



procedure REPD_PROV_BRIEF  (
 aCURSESSION CHAR,
 aREPD_PROVid CHAR,
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
if aREPD_PROVid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPD_PROV where REPD_PROVID=aREPD_PROVID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPD_PROV where REPD_PROVid=aREPD_PROVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPD_PROV');
    return;
  end if;
  aBRIEF:=func.REPD_PROV_BRIEF_F(aREPD_PROVid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPD_PROV_DELETE /*Провайдер репликациии*/ (
 aCURSESSION CHAR,
 aREPD_PROVid CHAR,
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
select count(*) into existsCnt from REPD_PROV where REPD_PROVID=aREPD_PROVID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPD_PROV where REPD_PROVid=aREPD_PROVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPD_PROV',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPD_PROV');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_PROV_ISLOCKED( acursession=>acursession,aROWID=>aREPD_PROVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPD_PROV');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPD_PROV',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPD_PROVid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPD_PROV is select  instanceid ID from instance where OwnerPartName ='REPD_PROV' and OwnerRowID=aREPD_PROVid;
row_REPD_PROV  chld_REPD_PROV%ROWTYPE;
begin
--open chld_REPD_PROV;
for row_REPD_PROV in chld_REPD_PROV loop
 Kernel.INSTANCE_OWNER (acursession,row_REPD_PROV.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPD_PROV.id);
end loop;
--close chld_REPD_PROV;
end ;
  delete from  REPD_PROV 
  where  REPD_PROVID = aREPD_PROVID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Провайдер репликациии*/
procedure REPD_PROV_SAVE /*Провайдер репликациии*/ (
 aCURSESSION CHAR,
 aREPD_PROVid CHAR,
aInstanceID CHAR 
,aAssemblyName
 VARCHAR2/* AssemblyName *//* AssemblyName */
,aClassName
 VARCHAR2/* ClassName *//* ClassName */
,aName
 VARCHAR2/* Name *//* Name */
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
select count(*) into existsCnt from REPD_PROV where REPD_PROVID=aREPD_PROVID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPD_PROV where REPD_PROVid=aREPD_PROVID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPD_PROV',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPD_PROV');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_PROV_ISLOCKED( acursession=>acursession,aROWID=>aREPD_PROVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_PROV');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_PROV',
 aVERB=>'EDITROW',  aThe_Resource=>aREPD_PROVid,aLogInstanceID=>aInstanceID);
 update  REPD_PROV set ChangeStamp=sysdate
,
  AssemblyName=aAssemblyName
,
  ClassName=aClassName
,
  Name=aName
  where  REPD_PROVID = aREPD_PROVID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPD_PROV',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPD_PROV');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_PROV');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_PROV',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPD_PROVid,aLogInstanceID=>aInstanceID);
 insert into   REPD_PROV
 (  REPD_PROVID 
,InstanceID
,AssemblyName

,ClassName

,Name

 ) values ( aREPD_PROVID 
,aInstanceID
,aAssemblyName

,aClassName

,aName

 ); 
 REPD_PROV_SINIT( aCURSESSION,aREPD_PROVid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPD_PROV_PARENT /*Провайдер репликациии*/ (
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
  select  INSTANCEID into aParentID from REPD_PROV where  REPD_PROVid=aRowID;
 end; 


procedure REPD_PROV_ISLOCKED /*Провайдер репликациии*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPD_PROV where REPD_PROVid=aRowID;
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
  REPD_PROV_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPD_PROV_LOCK /*Провайдер репликациии*/ (
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
 REPD_PROV_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPD_PROV_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPD_PROV where REPD_PROVid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPD_PROV');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPD_PROV set LockUserID =auserID ,LockSessionID =null where REPD_PROVid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPD_PROV set LockUserID =null,LockSessionID =aCURSESSION  where REPD_PROVid=aRowID;
     return;
   end if;
 end ;


procedure REPD_PROV_HCL /*Провайдер репликациии*/ (
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


procedure REPD_PROV_UNLOCK /*Провайдер репликациии*/ (
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
 REPD_PROV_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPD_PROV set LockUserID =null  where REPD_PROVid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPD_PROV set LockSessionID =null  where REPD_PROVid=aRowID;
     return;
   end if;
 end; 


procedure REPD_PROV_SINIT /*Провайдер репликациии*/ (
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
 select  SecurityStyleID into atmpID from REPD_PROV where REPD_PROVid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPD_PROV');
    return;
  end if;
if aSecurityStyleID is null then
 REPD_PROV_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPD_PROV set securitystyleid =aStyleID where REPD_PROVid = aRowID;
else 
 update REPD_PROV set securitystyleid =aSecurityStyleID where REPD_PROVid = aRowID;
end if; 
end ; 


procedure REPD_PROV_propagate /*Провайдер репликациии*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPD_PROV where REPD_PROVid=aRowid;
end;



procedure REPD_SRV_BRIEF  (
 aCURSESSION CHAR,
 aREPD_SRVid CHAR,
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
if aREPD_SRVid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPD_SRV where REPD_SRVID=aREPD_SRVID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPD_SRV where REPD_SRVid=aREPD_SRVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPD_SRV');
    return;
  end if;
  aBRIEF:=func.REPD_SRV_BRIEF_F(aREPD_SRVid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPD_SRV_DELETE /*Узлы репликации*/ (
 aCURSESSION CHAR,
 aREPD_SRVid CHAR,
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
select count(*) into existsCnt from REPD_SRV where REPD_SRVID=aREPD_SRVID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPD_SRV where REPD_SRVid=aREPD_SRVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPD_SRV',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPD_SRV');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_SRV_ISLOCKED( acursession=>acursession,aROWID=>aREPD_SRVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPD_SRV');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_REPD_SNDTO is select REPD_SNDTO.REPD_SNDTOid ID from REPD_SNDTO where  REPD_SNDTO.ParentStructRowID = aREPD_SRVid;
    child_REPD_SNDTO_rec  child_REPD_SNDTO%ROWTYPE;
    begin
    --open child_REPD_SNDTO;
      for child_REPD_SNDTO_rec in child_REPD_SNDTO loop
      REPD_SNDTO_DELETE (acursession,child_REPD_SNDTO_rec.id,aInstanceid);
      end loop;
      --close child_REPD_SNDTO;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPD_SRV',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPD_SRVid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPD_SRV is select  instanceid ID from instance where OwnerPartName ='REPD_SRV' and OwnerRowID=aREPD_SRVid;
row_REPD_SRV  chld_REPD_SRV%ROWTYPE;
begin
--open chld_REPD_SRV;
for row_REPD_SRV in chld_REPD_SRV loop
 Kernel.INSTANCE_OWNER (acursession,row_REPD_SRV.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPD_SRV.id);
end loop;
--close chld_REPD_SRV;
end ;
  delete from  REPD_SRV 
  where  REPD_SRVID = aREPD_SRVID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Узлы репликации*/
procedure REPD_SRV_SAVE /*Узлы репликации*/ (
 aCURSESSION CHAR,
 aREPD_SRVid CHAR,
aInstanceID CHAR 
,aObj3 CHAR := null /* Obj3 *//* Obj3 */
,aname
 VARCHAR2/* Название *//* Название */
,aObj2 CHAR := null /* Obj2 *//* Obj2 */
,aObj1 CHAR := null /* Obj1 *//* Obj1 */
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
select count(*) into existsCnt from REPD_SRV where REPD_SRVID=aREPD_SRVID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPD_SRV where REPD_SRVid=aREPD_SRVID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPD_SRV',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPD_SRV');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_SRV_ISLOCKED( acursession=>acursession,aROWID=>aREPD_SRVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_SRV');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_SRV',
 aVERB=>'EDITROW',  aThe_Resource=>aREPD_SRVid,aLogInstanceID=>aInstanceID);
 update  REPD_SRV set ChangeStamp=sysdate
,
  Obj3=aObj3
,
  name=aname
,
  Obj2=aObj2
,
  Obj1=aObj1
  where  REPD_SRVID = aREPD_SRVID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPD_SRV',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPD_SRV');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_SRV');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_SRV',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPD_SRVid,aLogInstanceID=>aInstanceID);
 insert into   REPD_SRV
 (  REPD_SRVID 
,InstanceID
,Obj3

,name

,Obj2

,Obj1

 ) values ( aREPD_SRVID 
,aInstanceID
,aObj3

,aname

,aObj2

,aObj1

 ); 
 REPD_SRV_SINIT( aCURSESSION,aREPD_SRVid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPD_SRV_PARENT /*Узлы репликации*/ (
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
  select  INSTANCEID into aParentID from REPD_SRV where  REPD_SRVid=aRowID;
 end; 


procedure REPD_SRV_ISLOCKED /*Узлы репликации*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPD_SRV where REPD_SRVid=aRowID;
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
  REPD_SRV_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPD_SRV_LOCK /*Узлы репликации*/ (
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
 REPD_SRV_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPD_SRV_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPD_SRV where REPD_SRVid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPD_SRV');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPD_SRV set LockUserID =auserID ,LockSessionID =null where REPD_SRVid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPD_SRV set LockUserID =null,LockSessionID =aCURSESSION  where REPD_SRVid=aRowID;
     return;
   end if;
 end ;


procedure REPD_SRV_HCL /*Узлы репликации*/ (
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
declare cursor lch_REPD_SNDTO is select REPD_SNDTO.REPD_SNDTOid ID from REPD_SNDTO where  REPD_SNDTO.ParentStructRowID = aRowid;
row_REPD_SNDTO lch_REPD_SNDTO%ROWTYPE;
begin  
--open lch_REPD_SNDTO;
for row_REPD_SNDTO in lch_REPD_SNDTO
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from REPD_SNDTO where REPD_SNDTOid=row_REPD_SNDTO.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_REPD_SNDTO;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_REPD_SNDTO;
     return;
   end if; 
 end if;  
 REPD_SNDTO_HCL (acursession,row_REPD_SNDTO.id,aisLocked);
 if aisLocked >2 then
   close lch_REPD_SNDTO;
   return;
 end if;
end loop;
--close lch_REPD_SNDTO;
end;
aIsLocked :=0;
end;


procedure REPD_SRV_UNLOCK /*Узлы репликации*/ (
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
 REPD_SRV_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPD_SRV set LockUserID =null  where REPD_SRVid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPD_SRV set LockSessionID =null  where REPD_SRVid=aRowID;
     return;
   end if;
 end; 


procedure REPD_SRV_SINIT /*Узлы репликации*/ (
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
 select  SecurityStyleID into atmpID from REPD_SRV where REPD_SRVid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPD_SRV');
    return;
  end if;
if aSecurityStyleID is null then
 REPD_SRV_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPD_SRV set securitystyleid =aStyleID where REPD_SRVid = aRowID;
else 
 update REPD_SRV set securitystyleid =aSecurityStyleID where REPD_SRVid = aRowID;
end if; 
end ; 


procedure REPD_SRV_propagate /*Узлы репликации*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPD_SRV where REPD_SRVid=aRowid;
declare cursor pch_REPD_SNDTO  is select REPD_SNDTO.REPD_SNDTOid ID from REPD_SNDTO where  REPD_SNDTO.ParentStructRowID = aRowid;
row_REPD_SNDTO  pch_REPD_SNDTO%ROWTYPE;
begin
--open pch_REPD_SNDTO;
for row_REPD_SNDTO in pch_REPD_SNDTO loop
   REPD_SNDTO_SINIT( acursession,row_REPD_SNDTO.id,assid);
   REPD_SNDTO_propagate( acursession,row_REPD_SNDTO.id);
end loop;
--close pch_REPD_SNDTO;
end;
end;



procedure REPD_SNDTO_BRIEF  (
 aCURSESSION CHAR,
 aREPD_SNDTOid CHAR,
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
if aREPD_SNDTOid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPD_SNDTO where REPD_SNDTOID=aREPD_SNDTOID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPD_SNDTO where REPD_SNDTOid=aREPD_SNDTOID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPD_SNDTO');
    return;
  end if;
  aBRIEF:=func.REPD_SNDTO_BRIEF_F(aREPD_SNDTOid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPD_SNDTO_DELETE /*Получатели реплик*/ (
 aCURSESSION CHAR,
 aREPD_SNDTOid CHAR,
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
select count(*) into existsCnt from REPD_SNDTO where REPD_SNDTOID=aREPD_SNDTOID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPD_SNDTO where REPD_SNDTOid=aREPD_SNDTOID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPD_SNDTO',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPD_SNDTO');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_SNDTO_ISLOCKED( acursession=>acursession,aROWID=>aREPD_SNDTOid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPD_SNDTO');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPD_SNDTO',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPD_SNDTOid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPD_SNDTO is select  instanceid ID from instance where OwnerPartName ='REPD_SNDTO' and OwnerRowID=aREPD_SNDTOid;
row_REPD_SNDTO  chld_REPD_SNDTO%ROWTYPE;
begin
--open chld_REPD_SNDTO;
for row_REPD_SNDTO in chld_REPD_SNDTO loop
 Kernel.INSTANCE_OWNER (acursession,row_REPD_SNDTO.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPD_SNDTO.id);
end loop;
--close chld_REPD_SNDTO;
end ;
  delete from  REPD_SNDTO 
  where  REPD_SNDTOID = aREPD_SNDTOID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Получатели реплик*/
procedure REPD_SNDTO_SAVE /*Получатели реплик*/ (
 aCURSESSION CHAR,
 aREPD_SNDTOid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aDestSrv CHAR/* DestSrv *//* DestSrv */
,aLastScan
 DATE := null /* Last scan *//* Last scan */
,aConfig VARCHAR2 := null /* Config *//* Config */
,aLastReceive
 DATE := null /* Last Receive *//* Last Receive */
,aProvider CHAR/* Provider *//* Provider */
,aWork_Start
 DATE := null /* Начало работы (время) *//* Начало работы (время) */
,aWork_End
 DATE := null /* Окончание работы (время) *//* Окончание работы (время) */
,aThe_Interval
 NUMBER := null /* Интервал *//* Интервал */
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
select count(*) into existsCnt from REPD_SNDTO where REPD_SNDTOID=aREPD_SNDTOID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPD_SNDTO where REPD_SNDTOid=aREPD_SNDTOID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPD_SNDTO',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPD_SNDTO');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_SNDTO_ISLOCKED( acursession=>acursession,aROWID=>aREPD_SNDTOid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_SNDTO');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_SNDTO',
 aVERB=>'EDITROW',  aThe_Resource=>aREPD_SNDTOid,aLogInstanceID=>aInstanceID);
 update  REPD_SNDTO set ChangeStamp=sysdate
,
  DestSrv=aDestSrv
,
  LastScan=aLastScan
,
  Config=aConfig
,
  LastReceive=aLastReceive
,
  Provider=aProvider
,
  Work_Start=aWork_Start
,
  Work_End=aWork_End
,
  The_Interval=aThe_Interval
  where  REPD_SNDTOID = aREPD_SNDTOID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from REPD_SRV where REPD_SRVid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPD_SNDTO',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPD_SNDTO');
      return;
    end if;
 end if;
 REPD_SRV_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_SNDTO');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_SNDTO',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPD_SNDTOid,aLogInstanceID=>aInstanceID);
 insert into   REPD_SNDTO
 (  REPD_SNDTOID 
,ParentStructRowID
,DestSrv

,LastScan

,Config

,LastReceive

,Provider

,Work_Start

,Work_End

,The_Interval

 ) values ( aREPD_SNDTOID 
,aParentStructRowID
,aDestSrv

,aLastScan

,aConfig

,aLastReceive

,aProvider

,aWork_Start

,aWork_End

,aThe_Interval

 ); 
 REPD_SNDTO_SINIT( aCURSESSION,aREPD_SNDTOid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPD_SNDTO_PARENT /*Получатели реплик*/ (
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
  select ParentStructRowID into aParentID  from REPD_SNDTO where  REPD_SNDTOid=aRowID;
  aParentTable := 'REPD_SRV';
 end; 


procedure REPD_SNDTO_ISLOCKED /*Получатели реплик*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPD_SNDTO where REPD_SNDTOid=aRowID;
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
  REPD_SNDTO_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPD_SNDTO_LOCK /*Получатели реплик*/ (
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
 REPD_SNDTO_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPD_SNDTO_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPD_SNDTO where REPD_SNDTOid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPD_SNDTO');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPD_SNDTO set LockUserID =auserID ,LockSessionID =null where REPD_SNDTOid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPD_SNDTO set LockUserID =null,LockSessionID =aCURSESSION  where REPD_SNDTOid=aRowID;
     return;
   end if;
 end ;


procedure REPD_SNDTO_HCL /*Получатели реплик*/ (
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


procedure REPD_SNDTO_UNLOCK /*Получатели реплик*/ (
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
 REPD_SNDTO_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPD_SNDTO set LockUserID =null  where REPD_SNDTOid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPD_SNDTO set LockSessionID =null  where REPD_SNDTOid=aRowID;
     return;
   end if;
 end; 


procedure REPD_SNDTO_SINIT /*Получатели реплик*/ (
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
 select  SecurityStyleID into atmpID from REPD_SNDTO where REPD_SNDTOid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPD_SNDTO');
    return;
  end if;
if aSecurityStyleID is null then
 REPD_SNDTO_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPD_SNDTO set securitystyleid =aStyleID where REPD_SNDTOid = aRowID;
else 
 update REPD_SNDTO set securitystyleid =aSecurityStyleID where REPD_SNDTOid = aRowID;
end if; 
end ; 


procedure REPD_SNDTO_propagate /*Получатели реплик*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPD_SNDTO where REPD_SNDTOid=aRowid;
end;



procedure REPD_SendQ_BRIEF  (
 aCURSESSION CHAR,
 aREPD_SendQid CHAR,
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
if aREPD_SendQid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPD_SendQ where REPD_SendQID=aREPD_SendQID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPD_SendQ where REPD_SendQid=aREPD_SendQID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPD_SendQ');
    return;
  end if;
  aBRIEF:=func.REPD_SendQ_BRIEF_F(aREPD_SendQid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPD_SendQ_DELETE /*Очередь отсылки*/ (
 aCURSESSION CHAR,
 aREPD_SendQid CHAR,
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
select count(*) into existsCnt from REPD_SendQ where REPD_SendQID=aREPD_SendQID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPD_SendQ where REPD_SendQid=aREPD_SendQID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPD_SendQ',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPD_SendQ');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_SendQ_ISLOCKED( acursession=>acursession,aROWID=>aREPD_SendQid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPD_SendQ');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPD_SendQ',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPD_SendQid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPD_SendQ is select  instanceid ID from instance where OwnerPartName ='REPD_SendQ' and OwnerRowID=aREPD_SendQid;
row_REPD_SendQ  chld_REPD_SendQ%ROWTYPE;
begin
--open chld_REPD_SendQ;
for row_REPD_SendQ in chld_REPD_SendQ loop
 Kernel.INSTANCE_OWNER (acursession,row_REPD_SendQ.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPD_SendQ.id);
end loop;
--close chld_REPD_SendQ;
end ;
  delete from  REPD_SendQ 
  where  REPD_SendQID = aREPD_SendQID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Очередь отсылки*/
procedure REPD_SendQ_SAVE /*Очередь отсылки*/ (
 aCURSESSION CHAR,
 aREPD_SendQid CHAR,
aInstanceID CHAR 
,aSourceSrv CHAR := null /* SourceSrv *//* SourceSrv */
,aConfig VARCHAR2 := null /* Config *//* Config */
,aSentDate
 DATE := null /* SentDate *//* SentDate */
,aDestSrv CHAR/* DestSrv *//* DestSrv */
,aProvider CHAR/* Provider *//* Provider */
,aAcknowelge
 NUMBER/* Acknowelge *//* Acknowelge */
,aSendSize
 NUMBER := null /* SendSize *//* SendSize */
,aCheckDate
 DATE/* CheckDate *//* CheckDate */
,aReplicaPackID CHAR/* ReplicaPackID *//* ReplicaPackID */
,aFileName
 VARCHAR2 := null /* FileName *//* FileName */
,aPartCount
 NUMBER := null /* Количество частей *//* Количество частей */
,aPartNumber
 NUMBER := null /* Часть *//* Часть */
,aSent
 NUMBER := null /* Sent *//* Sent */
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
select count(*) into existsCnt from REPD_SendQ where REPD_SendQID=aREPD_SendQID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPD_SendQ where REPD_SendQid=aREPD_SendQID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPD_SendQ',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPD_SendQ');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_SendQ_ISLOCKED( acursession=>acursession,aROWID=>aREPD_SendQid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_SendQ');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_SendQ',
 aVERB=>'EDITROW',  aThe_Resource=>aREPD_SendQid,aLogInstanceID=>aInstanceID);
 update  REPD_SendQ set ChangeStamp=sysdate
,
  SourceSrv=aSourceSrv
,
  Config=aConfig
,
  SentDate=aSentDate
,
  DestSrv=aDestSrv
,
  Provider=aProvider
,
  Acknowelge=aAcknowelge
,
  SendSize=aSendSize
,
  CheckDate=aCheckDate
,
  ReplicaPackID=aReplicaPackID
,
  FileName=aFileName
,
  PartCount=aPartCount
,
  PartNumber=aPartNumber
,
  Sent=aSent
  where  REPD_SendQID = aREPD_SendQID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPD_SendQ',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPD_SendQ');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_SendQ');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_SendQ',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPD_SendQid,aLogInstanceID=>aInstanceID);
 insert into   REPD_SendQ
 (  REPD_SendQID 
,InstanceID
,SourceSrv

,Config

,SentDate

,DestSrv

,Provider

,Acknowelge

,SendSize

,CheckDate

,ReplicaPackID

,FileName

,PartCount

,PartNumber

,Sent

 ) values ( aREPD_SendQID 
,aInstanceID
,aSourceSrv

,aConfig

,aSentDate

,aDestSrv

,aProvider

,aAcknowelge

,aSendSize

,aCheckDate

,aReplicaPackID

,aFileName

,aPartCount

,aPartNumber

,aSent

 ); 
 REPD_SendQ_SINIT( aCURSESSION,aREPD_SendQid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPD_SendQ_PARENT /*Очередь отсылки*/ (
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
  select  INSTANCEID into aParentID from REPD_SendQ where  REPD_SendQid=aRowID;
 end; 


procedure REPD_SendQ_ISLOCKED /*Очередь отсылки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPD_SendQ where REPD_SendQid=aRowID;
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
  REPD_SendQ_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPD_SendQ_LOCK /*Очередь отсылки*/ (
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
 REPD_SendQ_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPD_SendQ_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPD_SendQ where REPD_SendQid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPD_SendQ');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPD_SendQ set LockUserID =auserID ,LockSessionID =null where REPD_SendQid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPD_SendQ set LockUserID =null,LockSessionID =aCURSESSION  where REPD_SendQid=aRowID;
     return;
   end if;
 end ;


procedure REPD_SendQ_HCL /*Очередь отсылки*/ (
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


procedure REPD_SendQ_UNLOCK /*Очередь отсылки*/ (
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
 REPD_SendQ_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPD_SendQ set LockUserID =null  where REPD_SendQid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPD_SendQ set LockSessionID =null  where REPD_SendQid=aRowID;
     return;
   end if;
 end; 


procedure REPD_SendQ_SINIT /*Очередь отсылки*/ (
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
 select  SecurityStyleID into atmpID from REPD_SendQ where REPD_SendQid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPD_SendQ');
    return;
  end if;
if aSecurityStyleID is null then
 REPD_SendQ_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPD_SendQ set securitystyleid =aStyleID where REPD_SendQid = aRowID;
else 
 update REPD_SendQ set securitystyleid =aSecurityStyleID where REPD_SendQid = aRowID;
end if; 
end ; 


procedure REPD_SendQ_propagate /*Очередь отсылки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPD_SendQ where REPD_SendQid=aRowid;
end;



procedure REPD_RecvQ_BRIEF  (
 aCURSESSION CHAR,
 aREPD_RecvQid CHAR,
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
if aREPD_RecvQid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from REPD_RecvQ where REPD_RecvQID=aREPD_RecvQID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from REPD_RecvQ where REPD_RecvQid=aREPD_RecvQID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=REPD_RecvQ');
    return;
  end if;
  aBRIEF:=func.REPD_RecvQ_BRIEF_F(aREPD_RecvQid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure REPD_RecvQ_DELETE /*Очередь полученых реплик*/ (
 aCURSESSION CHAR,
 aREPD_RecvQid CHAR,
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
select count(*) into existsCnt from REPD_RecvQ where REPD_RecvQID=aREPD_RecvQID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from REPD_RecvQ where REPD_RecvQid=aREPD_RecvQID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:REPD_RecvQ',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=REPD_RecvQ');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_RecvQ_ISLOCKED( acursession=>acursession,aROWID=>aREPD_RecvQid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=REPD_RecvQ');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'REPD_RecvQ',
 aVERB=>'DELETEROW',  aThe_Resource=>aREPD_RecvQid, aLogInstanceID=>aInstanceID);
declare cursor chld_REPD_RecvQ is select  instanceid ID from instance where OwnerPartName ='REPD_RecvQ' and OwnerRowID=aREPD_RecvQid;
row_REPD_RecvQ  chld_REPD_RecvQ%ROWTYPE;
begin
--open chld_REPD_RecvQ;
for row_REPD_RecvQ in chld_REPD_RecvQ loop
 Kernel.INSTANCE_OWNER (acursession,row_REPD_RecvQ.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_REPD_RecvQ.id);
end loop;
--close chld_REPD_RecvQ;
end ;
  delete from  REPD_RecvQ 
  where  REPD_RecvQID = aREPD_RecvQID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Очередь полученых реплик*/
procedure REPD_RecvQ_SAVE /*Очередь полученых реплик*/ (
 aCURSESSION CHAR,
 aREPD_RecvQid CHAR,
aInstanceID CHAR 
,aTheRowID CHAR := null /* TheRowID *//* TheRowID */
,aReceived
 DATE/* Received *//* Received */
,aProvider CHAR/* Provider *//* Provider */
,aRecvSize
 NUMBER := null /* RecvSize *//* RecvSize */
,aSourceSrv CHAR/* SourceSrv *//* SourceSrv */
,aDestSrv CHAR := null /* DestSrv *//* DestSrv */
,aAcknowelge
 NUMBER/* Acknowelge *//* Acknowelge */
,aReplicaPackID CHAR := null /* ReplicaPackID *//* ReplicaPackID */
,aPartCount
 NUMBER := null /* Количество частей *//* Количество частей */
,aPartNumber
 NUMBER := null /* Часть *//* Часть */
,aFileName
 VARCHAR2/* FileName *//* FileName */
,aCompleted
 NUMBER := null /* Completed *//* Completed */
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
select count(*) into existsCnt from REPD_RecvQ where REPD_RecvQID=aREPD_RecvQID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from REPD_RecvQ where REPD_RecvQid=aREPD_RecvQID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:REPD_RecvQ',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=REPD_RecvQ');
      return;
    end if;
  end if;
 --  verify lock  --
 REPD_RecvQ_ISLOCKED( acursession=>acursession,aROWID=>aREPD_RecvQid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_RecvQ');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_RecvQ',
 aVERB=>'EDITROW',  aThe_Resource=>aREPD_RecvQid,aLogInstanceID=>aInstanceID);
 update  REPD_RecvQ set ChangeStamp=sysdate
,
  TheRowID=aTheRowID
,
  Received=aReceived
,
  Provider=aProvider
,
  RecvSize=aRecvSize
,
  SourceSrv=aSourceSrv
,
  DestSrv=aDestSrv
,
  Acknowelge=aAcknowelge
,
  ReplicaPackID=aReplicaPackID
,
  PartCount=aPartCount
,
  PartNumber=aPartNumber
,
  FileName=aFileName
,
  Completed=aCompleted
  where  REPD_RecvQID = aREPD_RecvQID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:REPD_RecvQ',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=REPD_RecvQ');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=REPD_RecvQ');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'REPD_RecvQ',
 aVERB=>'CREATEROW',  aThe_Resource=>aREPD_RecvQid,aLogInstanceID=>aInstanceID);
 insert into   REPD_RecvQ
 (  REPD_RecvQID 
,InstanceID
,TheRowID

,Received

,Provider

,RecvSize

,SourceSrv

,DestSrv

,Acknowelge

,ReplicaPackID

,PartCount

,PartNumber

,FileName

,Completed

 ) values ( aREPD_RecvQID 
,aInstanceID
,aTheRowID

,aReceived

,aProvider

,aRecvSize

,aSourceSrv

,aDestSrv

,aAcknowelge

,aReplicaPackID

,aPartCount

,aPartNumber

,aFileName

,aCompleted

 ); 
 REPD_RecvQ_SINIT( aCURSESSION,aREPD_RecvQid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure REPD_RecvQ_PARENT /*Очередь полученых реплик*/ (
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
  select  INSTANCEID into aParentID from REPD_RecvQ where  REPD_RecvQid=aRowID;
 end; 


procedure REPD_RecvQ_ISLOCKED /*Очередь полученых реплик*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from REPD_RecvQ where REPD_RecvQid=aRowID;
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
  REPD_RecvQ_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin REPD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure REPD_RecvQ_LOCK /*Очередь полученых реплик*/ (
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
 REPD_RecvQ_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  REPD_RecvQ_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from REPD_RecvQ where REPD_RecvQid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=REPD_RecvQ');
    return;
  end if;
   if  aLockMode =2  
   then   
    update REPD_RecvQ set LockUserID =auserID ,LockSessionID =null where REPD_RecvQid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update REPD_RecvQ set LockUserID =null,LockSessionID =aCURSESSION  where REPD_RecvQid=aRowID;
     return;
   end if;
 end ;


procedure REPD_RecvQ_HCL /*Очередь полученых реплик*/ (
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


procedure REPD_RecvQ_UNLOCK /*Очередь полученых реплик*/ (
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
 REPD_RecvQ_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update REPD_RecvQ set LockUserID =null  where REPD_RecvQid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update REPD_RecvQ set LockSessionID =null  where REPD_RecvQid=aRowID;
     return;
   end if;
 end; 


procedure REPD_RecvQ_SINIT /*Очередь полученых реплик*/ (
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
 select  SecurityStyleID into atmpID from REPD_RecvQ where REPD_RecvQid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =REPD_RecvQ');
    return;
  end if;
if aSecurityStyleID is null then
 REPD_RecvQ_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update REPD_RecvQ set securitystyleid =aStyleID where REPD_RecvQid = aRowID;
else 
 update REPD_RecvQ set securitystyleid =aSecurityStyleID where REPD_RecvQid = aRowID;
end if; 
end ; 


procedure REPD_RecvQ_propagate /*Очередь полученых реплик*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from REPD_RecvQ where REPD_RecvQid=aRowid;
end;


end REPD;

/



