
/* --PEKTRF*/

 create or replace package body PEKTRF as

procedure PEKTRF_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKTRF'
then
declare cursor child_PEKTRF_REGALL is select PEKTRF_REGALL.PEKTRF_REGALLid ID from PEKTRF_REGALL where  PEKTRF_REGALL.InstanceID = ainstanceid;
row_PEKTRF_REGALL  child_PEKTRF_REGALL%ROWTYPE;
begin
--open child_PEKTRF_REGALL;
for row_PEKTRF_REGALL in child_PEKTRF_REGALL loop
 PEKTRF_REGALL_DELETE (acursession,row_PEKTRF_REGALL.id,aInstanceID);
end loop;
--close child_PEKTRF_REGALL;
end;
declare cursor child_PEKTRF_DECR is select PEKTRF_DECR.PEKTRF_DECRid ID from PEKTRF_DECR where  PEKTRF_DECR.InstanceID = ainstanceid;
row_PEKTRF_DECR  child_PEKTRF_DECR%ROWTYPE;
begin
--open child_PEKTRF_DECR;
for row_PEKTRF_DECR in child_PEKTRF_DECR loop
 PEKTRF_DECR_DELETE (acursession,row_PEKTRF_DECR.id,aInstanceID);
end loop;
--close child_PEKTRF_DECR;
end;
declare cursor child_PEKTRF_ADDS is select PEKTRF_ADDS.PEKTRF_ADDSid ID from PEKTRF_ADDS where  PEKTRF_ADDS.InstanceID = ainstanceid;
row_PEKTRF_ADDS  child_PEKTRF_ADDS%ROWTYPE;
begin
--open child_PEKTRF_ADDS;
for row_PEKTRF_ADDS in child_PEKTRF_ADDS loop
 PEKTRF_ADDS_DELETE (acursession,row_PEKTRF_ADDS.id,aInstanceID);
end loop;
--close child_PEKTRF_ADDS;
end;
declare cursor child_PEKTRF_DEF is select PEKTRF_DEF.PEKTRF_DEFid ID from PEKTRF_DEF where  PEKTRF_DEF.InstanceID = ainstanceid;
row_PEKTRF_DEF  child_PEKTRF_DEF%ROWTYPE;
begin
--open child_PEKTRF_DEF;
for row_PEKTRF_DEF in child_PEKTRF_DEF loop
 PEKTRF_DEF_DELETE (acursession,row_PEKTRF_DEF.id,aInstanceID);
end loop;
--close child_PEKTRF_DEF;
end;
declare cursor child_PEKTRF_SRV is select PEKTRF_SRV.PEKTRF_SRVid ID from PEKTRF_SRV where  PEKTRF_SRV.InstanceID = ainstanceid;
row_PEKTRF_SRV  child_PEKTRF_SRV%ROWTYPE;
begin
--open child_PEKTRF_SRV;
for row_PEKTRF_SRV in child_PEKTRF_SRV loop
 PEKTRF_SRV_DELETE (acursession,row_PEKTRF_SRV.id,aInstanceID);
end loop;
--close child_PEKTRF_SRV;
end;
declare cursor child_PEKTRF_TR is select PEKTRF_TR.PEKTRF_TRid ID from PEKTRF_TR where  PEKTRF_TR.InstanceID = ainstanceid;
row_PEKTRF_TR  child_PEKTRF_TR%ROWTYPE;
begin
--open child_PEKTRF_TR;
for row_PEKTRF_TR in child_PEKTRF_TR loop
 PEKTRF_TR_DELETE (acursession,row_PEKTRF_TR.id,aInstanceID);
end loop;
--close child_PEKTRF_TR;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKTRF_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKTRF'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKTRF_REGALL is select PEKTRF_REGALL.PEKTRF_REGALLid ID from PEKTRF_REGALL where  PEKTRF_REGALL.InstanceID = arowid;
ROW_PEKTRF_REGALL  lch_PEKTRF_REGALL%ROWTYPE;
begin
--open lch_PEKTRF_REGALL;
for row_PEKTRF_REGALL in lch_PEKTRF_REGALL loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKTRF_REGALL where PEKTRF_REGALLid=row_PEKTRF_REGALL.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKTRF_REGALL;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKTRF_REGALL;
     return;
   end if; 
 end if; 
 PEKTRF_REGALL_HCL (acursession,ROW_PEKTRF_REGALL.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKTRF_REGALL;
   return;
 end if;
 end loop;
--close lch_PEKTRF_REGALL;
end;
declare cursor lch_PEKTRF_DECR is select PEKTRF_DECR.PEKTRF_DECRid ID from PEKTRF_DECR where  PEKTRF_DECR.InstanceID = arowid;
ROW_PEKTRF_DECR  lch_PEKTRF_DECR%ROWTYPE;
begin
--open lch_PEKTRF_DECR;
for row_PEKTRF_DECR in lch_PEKTRF_DECR loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKTRF_DECR where PEKTRF_DECRid=row_PEKTRF_DECR.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKTRF_DECR;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKTRF_DECR;
     return;
   end if; 
 end if; 
 PEKTRF_DECR_HCL (acursession,ROW_PEKTRF_DECR.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKTRF_DECR;
   return;
 end if;
 end loop;
--close lch_PEKTRF_DECR;
end;
declare cursor lch_PEKTRF_ADDS is select PEKTRF_ADDS.PEKTRF_ADDSid ID from PEKTRF_ADDS where  PEKTRF_ADDS.InstanceID = arowid;
ROW_PEKTRF_ADDS  lch_PEKTRF_ADDS%ROWTYPE;
begin
--open lch_PEKTRF_ADDS;
for row_PEKTRF_ADDS in lch_PEKTRF_ADDS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKTRF_ADDS where PEKTRF_ADDSid=row_PEKTRF_ADDS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKTRF_ADDS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKTRF_ADDS;
     return;
   end if; 
 end if; 
 PEKTRF_ADDS_HCL (acursession,ROW_PEKTRF_ADDS.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKTRF_ADDS;
   return;
 end if;
 end loop;
--close lch_PEKTRF_ADDS;
end;
declare cursor lch_PEKTRF_DEF is select PEKTRF_DEF.PEKTRF_DEFid ID from PEKTRF_DEF where  PEKTRF_DEF.InstanceID = arowid;
ROW_PEKTRF_DEF  lch_PEKTRF_DEF%ROWTYPE;
begin
--open lch_PEKTRF_DEF;
for row_PEKTRF_DEF in lch_PEKTRF_DEF loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKTRF_DEF where PEKTRF_DEFid=row_PEKTRF_DEF.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKTRF_DEF;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKTRF_DEF;
     return;
   end if; 
 end if; 
 PEKTRF_DEF_HCL (acursession,ROW_PEKTRF_DEF.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKTRF_DEF;
   return;
 end if;
 end loop;
--close lch_PEKTRF_DEF;
end;
declare cursor lch_PEKTRF_SRV is select PEKTRF_SRV.PEKTRF_SRVid ID from PEKTRF_SRV where  PEKTRF_SRV.InstanceID = arowid;
ROW_PEKTRF_SRV  lch_PEKTRF_SRV%ROWTYPE;
begin
--open lch_PEKTRF_SRV;
for row_PEKTRF_SRV in lch_PEKTRF_SRV loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKTRF_SRV where PEKTRF_SRVid=row_PEKTRF_SRV.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKTRF_SRV;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKTRF_SRV;
     return;
   end if; 
 end if; 
 PEKTRF_SRV_HCL (acursession,ROW_PEKTRF_SRV.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKTRF_SRV;
   return;
 end if;
 end loop;
--close lch_PEKTRF_SRV;
end;
declare cursor lch_PEKTRF_TR is select PEKTRF_TR.PEKTRF_TRid ID from PEKTRF_TR where  PEKTRF_TR.InstanceID = arowid;
ROW_PEKTRF_TR  lch_PEKTRF_TR%ROWTYPE;
begin
--open lch_PEKTRF_TR;
for row_PEKTRF_TR in lch_PEKTRF_TR loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKTRF_TR where PEKTRF_TRid=row_PEKTRF_TR.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKTRF_TR;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKTRF_TR;
     return;
   end if; 
 end if; 
 PEKTRF_TR_HCL (acursession,ROW_PEKTRF_TR.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKTRF_TR;
   return;
 end if;
 end loop;
--close lch_PEKTRF_TR;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKTRF_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKTRF'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKTRF_REGALL is select PEKTRF_REGALL.PEKTRF_REGALLid id from PEKTRF_REGALL where  PEKTRF_REGALL.InstanceID = arowid;
row_PEKTRF_REGALL  pch_PEKTRF_REGALL%ROWTYPE;
begin
--open pch_PEKTRF_REGALL;
for row_PEKTRF_REGALL in  pch_PEKTRF_REGALL loop
 PEKTRF_REGALL_SINIT( acursession,row_PEKTRF_REGALL.id,assid);
 PEKTRF_REGALL_propagate( acursession,row_PEKTRF_REGALL.id);
end loop;
--close pch_PEKTRF_REGALL;
end;
declare cursor pch_PEKTRF_DECR is select PEKTRF_DECR.PEKTRF_DECRid id from PEKTRF_DECR where  PEKTRF_DECR.InstanceID = arowid;
row_PEKTRF_DECR  pch_PEKTRF_DECR%ROWTYPE;
begin
--open pch_PEKTRF_DECR;
for row_PEKTRF_DECR in  pch_PEKTRF_DECR loop
 PEKTRF_DECR_SINIT( acursession,row_PEKTRF_DECR.id,assid);
 PEKTRF_DECR_propagate( acursession,row_PEKTRF_DECR.id);
end loop;
--close pch_PEKTRF_DECR;
end;
declare cursor pch_PEKTRF_ADDS is select PEKTRF_ADDS.PEKTRF_ADDSid id from PEKTRF_ADDS where  PEKTRF_ADDS.InstanceID = arowid;
row_PEKTRF_ADDS  pch_PEKTRF_ADDS%ROWTYPE;
begin
--open pch_PEKTRF_ADDS;
for row_PEKTRF_ADDS in  pch_PEKTRF_ADDS loop
 PEKTRF_ADDS_SINIT( acursession,row_PEKTRF_ADDS.id,assid);
 PEKTRF_ADDS_propagate( acursession,row_PEKTRF_ADDS.id);
end loop;
--close pch_PEKTRF_ADDS;
end;
declare cursor pch_PEKTRF_DEF is select PEKTRF_DEF.PEKTRF_DEFid id from PEKTRF_DEF where  PEKTRF_DEF.InstanceID = arowid;
row_PEKTRF_DEF  pch_PEKTRF_DEF%ROWTYPE;
begin
--open pch_PEKTRF_DEF;
for row_PEKTRF_DEF in  pch_PEKTRF_DEF loop
 PEKTRF_DEF_SINIT( acursession,row_PEKTRF_DEF.id,assid);
 PEKTRF_DEF_propagate( acursession,row_PEKTRF_DEF.id);
end loop;
--close pch_PEKTRF_DEF;
end;
declare cursor pch_PEKTRF_SRV is select PEKTRF_SRV.PEKTRF_SRVid id from PEKTRF_SRV where  PEKTRF_SRV.InstanceID = arowid;
row_PEKTRF_SRV  pch_PEKTRF_SRV%ROWTYPE;
begin
--open pch_PEKTRF_SRV;
for row_PEKTRF_SRV in  pch_PEKTRF_SRV loop
 PEKTRF_SRV_SINIT( acursession,row_PEKTRF_SRV.id,assid);
 PEKTRF_SRV_propagate( acursession,row_PEKTRF_SRV.id);
end loop;
--close pch_PEKTRF_SRV;
end;
declare cursor pch_PEKTRF_TR is select PEKTRF_TR.PEKTRF_TRid id from PEKTRF_TR where  PEKTRF_TR.InstanceID = arowid;
row_PEKTRF_TR  pch_PEKTRF_TR%ROWTYPE;
begin
--open pch_PEKTRF_TR;
for row_PEKTRF_TR in  pch_PEKTRF_TR loop
 PEKTRF_TR_SINIT( acursession,row_PEKTRF_TR.id,assid);
 PEKTRF_TR_propagate( acursession,row_PEKTRF_TR.id);
end loop;
--close pch_PEKTRF_TR;
end;
 end if; 
end;



procedure PEKTRF_REGALL_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_REGALLid CHAR,
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
if aPEKTRF_REGALLid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKTRF_REGALL where PEKTRF_REGALLID=aPEKTRF_REGALLID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKTRF_REGALL where PEKTRF_REGALLid=aPEKTRF_REGALLID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKTRF_REGALL');
    return;
  end if;
  aBRIEF:=func.PEKTRF_REGALL_BRIEF_F(aPEKTRF_REGALLid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKTRF_REGALL_DELETE /*Регресс по общему весу*/ (
 aCURSESSION CHAR,
 aPEKTRF_REGALLid CHAR,
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
select count(*) into existsCnt from PEKTRF_REGALL where PEKTRF_REGALLID=aPEKTRF_REGALLID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKTRF_REGALL where PEKTRF_REGALLid=aPEKTRF_REGALLID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKTRF_REGALL',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKTRF_REGALL');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_REGALL_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_REGALLid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKTRF_REGALL');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_REGALL',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKTRF_REGALLid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKTRF_REGALL is select  instanceid ID from instance where OwnerPartName ='PEKTRF_REGALL' and OwnerRowID=aPEKTRF_REGALLid;
row_PEKTRF_REGALL  chld_PEKTRF_REGALL%ROWTYPE;
begin
--open chld_PEKTRF_REGALL;
for row_PEKTRF_REGALL in chld_PEKTRF_REGALL loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKTRF_REGALL.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKTRF_REGALL.id);
end loop;
--close chld_PEKTRF_REGALL;
end ;
  delete from  PEKTRF_REGALL 
  where  PEKTRF_REGALLID = aPEKTRF_REGALLID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Регресс по общему весу*/
procedure PEKTRF_REGALL_SAVE /*Регресс по общему весу*/ (
 aCURSESSION CHAR,
 aPEKTRF_REGALLid CHAR,
aInstanceID CHAR 
,aWeightFrom
 NUMBER/* Суммарный вес от *//* Суммарный вес от */
,aWeightTo
 NUMBER/* Суммарный вес по *//* Суммарный вес по */
,aWeightEDIZM CHAR := null /* Ед. изм. веса *//* Ед. изм. веса */
,aPricePercent
 NUMBER := null /* Процент от тарифа *//* Процент от тарифа */
,aFixedPrice
 NUMBER := null /* Фиксированная цена *//* Фиксированная цена */
,aPriceCurrency CHAR := null /* Валюта фиксированной цены *//* Валюта фиксированной цены */
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
select count(*) into existsCnt from PEKTRF_REGALL where PEKTRF_REGALLID=aPEKTRF_REGALLID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKTRF_REGALL where PEKTRF_REGALLid=aPEKTRF_REGALLID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKTRF_REGALL',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKTRF_REGALL');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_REGALL_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_REGALLid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_REGALL');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_REGALL',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKTRF_REGALLid,aLogInstanceID=>aInstanceID);
 update  PEKTRF_REGALL set ChangeStamp=sysdate
,
  WeightFrom=aWeightFrom
,
  WeightTo=aWeightTo
,
  WeightEDIZM=aWeightEDIZM
,
  PricePercent=aPricePercent
,
  FixedPrice=aFixedPrice
,
  PriceCurrency=aPriceCurrency
  where  PEKTRF_REGALLID = aPEKTRF_REGALLID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKTRF_REGALL',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKTRF_REGALL');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_REGALL');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_REGALL',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKTRF_REGALLid,aLogInstanceID=>aInstanceID);
 insert into   PEKTRF_REGALL
 (  PEKTRF_REGALLID 
,InstanceID
,WeightFrom

,WeightTo

,WeightEDIZM

,PricePercent

,FixedPrice

,PriceCurrency

 ) values ( aPEKTRF_REGALLID 
,aInstanceID
,aWeightFrom

,aWeightTo

,aWeightEDIZM

,aPricePercent

,aFixedPrice

,aPriceCurrency

 ); 
 PEKTRF_REGALL_SINIT( aCURSESSION,aPEKTRF_REGALLid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKTRF_REGALL_PARENT /*Регресс по общему весу*/ (
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
  select  INSTANCEID into aParentID from PEKTRF_REGALL where  PEKTRF_REGALLid=aRowID;
 end; 


procedure PEKTRF_REGALL_ISLOCKED /*Регресс по общему весу*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKTRF_REGALL where PEKTRF_REGALLid=aRowID;
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
  PEKTRF_REGALL_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKTRF.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKTRF_REGALL_LOCK /*Регресс по общему весу*/ (
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
 PEKTRF_REGALL_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKTRF_REGALL_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKTRF_REGALL where PEKTRF_REGALLid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKTRF_REGALL');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKTRF_REGALL set LockUserID =auserID ,LockSessionID =null where PEKTRF_REGALLid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKTRF_REGALL set LockUserID =null,LockSessionID =aCURSESSION  where PEKTRF_REGALLid=aRowID;
     return;
   end if;
 end ;


procedure PEKTRF_REGALL_HCL /*Регресс по общему весу*/ (
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


procedure PEKTRF_REGALL_UNLOCK /*Регресс по общему весу*/ (
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
 PEKTRF_REGALL_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKTRF_REGALL set LockUserID =null  where PEKTRF_REGALLid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKTRF_REGALL set LockSessionID =null  where PEKTRF_REGALLid=aRowID;
     return;
   end if;
 end; 


procedure PEKTRF_REGALL_SINIT /*Регресс по общему весу*/ (
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
 select  SecurityStyleID into atmpID from PEKTRF_REGALL where PEKTRF_REGALLid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKTRF_REGALL');
    return;
  end if;
if aSecurityStyleID is null then
 PEKTRF_REGALL_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKTRF_REGALL set securitystyleid =aStyleID where PEKTRF_REGALLid = aRowID;
else 
 update PEKTRF_REGALL set securitystyleid =aSecurityStyleID where PEKTRF_REGALLid = aRowID;
end if; 
end ; 


procedure PEKTRF_REGALL_propagate /*Регресс по общему весу*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKTRF_REGALL where PEKTRF_REGALLid=aRowid;
end;



procedure PEKTRF_DECR_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_DECRid CHAR,
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
if aPEKTRF_DECRid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKTRF_DECR where PEKTRF_DECRID=aPEKTRF_DECRID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKTRF_DECR where PEKTRF_DECRid=aPEKTRF_DECRID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKTRF_DECR');
    return;
  end if;
  aBRIEF:=func.PEKTRF_DECR_BRIEF_F(aPEKTRF_DECRid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKTRF_DECR_DELETE /*Скидки*/ (
 aCURSESSION CHAR,
 aPEKTRF_DECRid CHAR,
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
select count(*) into existsCnt from PEKTRF_DECR where PEKTRF_DECRID=aPEKTRF_DECRID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKTRF_DECR where PEKTRF_DECRid=aPEKTRF_DECRID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKTRF_DECR',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKTRF_DECR');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_DECR_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_DECRid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKTRF_DECR');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_DECR',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKTRF_DECRid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKTRF_DECR is select  instanceid ID from instance where OwnerPartName ='PEKTRF_DECR' and OwnerRowID=aPEKTRF_DECRid;
row_PEKTRF_DECR  chld_PEKTRF_DECR%ROWTYPE;
begin
--open chld_PEKTRF_DECR;
for row_PEKTRF_DECR in chld_PEKTRF_DECR loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKTRF_DECR.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKTRF_DECR.id);
end loop;
--close chld_PEKTRF_DECR;
end ;
  delete from  PEKTRF_DECR 
  where  PEKTRF_DECRID = aPEKTRF_DECRID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Скидки*/
procedure PEKTRF_DECR_SAVE /*Скидки*/ (
 aCURSESSION CHAR,
 aPEKTRF_DECRid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название скидки *//* Название скидки */
,aDecrPercent
 NUMBER/* Процент к тарифу *//* Процент к тарифу */
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
select count(*) into existsCnt from PEKTRF_DECR where PEKTRF_DECRID=aPEKTRF_DECRID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKTRF_DECR where PEKTRF_DECRid=aPEKTRF_DECRID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKTRF_DECR',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKTRF_DECR');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_DECR_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_DECRid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_DECR');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_DECR',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKTRF_DECRid,aLogInstanceID=>aInstanceID);
 update  PEKTRF_DECR set ChangeStamp=sysdate
,
  Name=aName
,
  DecrPercent=aDecrPercent
  where  PEKTRF_DECRID = aPEKTRF_DECRID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKTRF_DECR',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKTRF_DECR');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_DECR');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_DECR',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKTRF_DECRid,aLogInstanceID=>aInstanceID);
 insert into   PEKTRF_DECR
 (  PEKTRF_DECRID 
,InstanceID
,Name

,DecrPercent

 ) values ( aPEKTRF_DECRID 
,aInstanceID
,aName

,aDecrPercent

 ); 
 PEKTRF_DECR_SINIT( aCURSESSION,aPEKTRF_DECRid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKTRF_DECR_PARENT /*Скидки*/ (
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
  select  INSTANCEID into aParentID from PEKTRF_DECR where  PEKTRF_DECRid=aRowID;
 end; 


procedure PEKTRF_DECR_ISLOCKED /*Скидки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKTRF_DECR where PEKTRF_DECRid=aRowID;
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
  PEKTRF_DECR_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKTRF.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKTRF_DECR_LOCK /*Скидки*/ (
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
 PEKTRF_DECR_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKTRF_DECR_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKTRF_DECR where PEKTRF_DECRid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKTRF_DECR');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKTRF_DECR set LockUserID =auserID ,LockSessionID =null where PEKTRF_DECRid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKTRF_DECR set LockUserID =null,LockSessionID =aCURSESSION  where PEKTRF_DECRid=aRowID;
     return;
   end if;
 end ;


procedure PEKTRF_DECR_HCL /*Скидки*/ (
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


procedure PEKTRF_DECR_UNLOCK /*Скидки*/ (
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
 PEKTRF_DECR_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKTRF_DECR set LockUserID =null  where PEKTRF_DECRid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKTRF_DECR set LockSessionID =null  where PEKTRF_DECRid=aRowID;
     return;
   end if;
 end; 


procedure PEKTRF_DECR_SINIT /*Скидки*/ (
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
 select  SecurityStyleID into atmpID from PEKTRF_DECR where PEKTRF_DECRid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKTRF_DECR');
    return;
  end if;
if aSecurityStyleID is null then
 PEKTRF_DECR_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKTRF_DECR set securitystyleid =aStyleID where PEKTRF_DECRid = aRowID;
else 
 update PEKTRF_DECR set securitystyleid =aSecurityStyleID where PEKTRF_DECRid = aRowID;
end if; 
end ; 


procedure PEKTRF_DECR_propagate /*Скидки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKTRF_DECR where PEKTRF_DECRid=aRowid;
end;



procedure PEKTRF_ADDS_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_ADDSid CHAR,
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
if aPEKTRF_ADDSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKTRF_ADDS where PEKTRF_ADDSID=aPEKTRF_ADDSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKTRF_ADDS where PEKTRF_ADDSid=aPEKTRF_ADDSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKTRF_ADDS');
    return;
  end if;
  aBRIEF:=func.PEKTRF_ADDS_BRIEF_F(aPEKTRF_ADDSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKTRF_ADDS_DELETE /*Надбавки*/ (
 aCURSESSION CHAR,
 aPEKTRF_ADDSid CHAR,
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
select count(*) into existsCnt from PEKTRF_ADDS where PEKTRF_ADDSID=aPEKTRF_ADDSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKTRF_ADDS where PEKTRF_ADDSid=aPEKTRF_ADDSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKTRF_ADDS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKTRF_ADDS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_ADDS_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_ADDSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKTRF_ADDS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_ADDS',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKTRF_ADDSid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKTRF_ADDS is select  instanceid ID from instance where OwnerPartName ='PEKTRF_ADDS' and OwnerRowID=aPEKTRF_ADDSid;
row_PEKTRF_ADDS  chld_PEKTRF_ADDS%ROWTYPE;
begin
--open chld_PEKTRF_ADDS;
for row_PEKTRF_ADDS in chld_PEKTRF_ADDS loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKTRF_ADDS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKTRF_ADDS.id);
end loop;
--close chld_PEKTRF_ADDS;
end ;
  delete from  PEKTRF_ADDS 
  where  PEKTRF_ADDSID = aPEKTRF_ADDSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Надбавки*/
procedure PEKTRF_ADDS_SAVE /*Надбавки*/ (
 aCURSESSION CHAR,
 aPEKTRF_ADDSid CHAR,
aInstanceID CHAR 
,aName CHAR/* Название надбавки *//* Название надбавки */
,aAddPercent
 NUMBER/* Процент к тарифной ставке *//* Процент к тарифной ставке */
,aMinValue
 NUMBER := null /* Минимальное значение *//* Минимальное значение */
,aMaxValue
 NUMBER := null /* Максимальное значение *//* Максимальное значение */
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
select count(*) into existsCnt from PEKTRF_ADDS where PEKTRF_ADDSID=aPEKTRF_ADDSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKTRF_ADDS where PEKTRF_ADDSid=aPEKTRF_ADDSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKTRF_ADDS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKTRF_ADDS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_ADDS_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_ADDSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_ADDS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_ADDS',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKTRF_ADDSid,aLogInstanceID=>aInstanceID);
 update  PEKTRF_ADDS set ChangeStamp=sysdate
,
  Name=aName
,
  AddPercent=aAddPercent
,
  MinValue=aMinValue
,
  MaxValue=aMaxValue
  where  PEKTRF_ADDSID = aPEKTRF_ADDSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKTRF_ADDS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKTRF_ADDS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_ADDS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_ADDS',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKTRF_ADDSid,aLogInstanceID=>aInstanceID);
 insert into   PEKTRF_ADDS
 (  PEKTRF_ADDSID 
,InstanceID
,Name

,AddPercent

,MinValue

,MaxValue

 ) values ( aPEKTRF_ADDSID 
,aInstanceID
,aName

,aAddPercent

,aMinValue

,aMaxValue

 ); 
 PEKTRF_ADDS_SINIT( aCURSESSION,aPEKTRF_ADDSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKTRF_ADDS_PARENT /*Надбавки*/ (
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
  select  INSTANCEID into aParentID from PEKTRF_ADDS where  PEKTRF_ADDSid=aRowID;
 end; 


procedure PEKTRF_ADDS_ISLOCKED /*Надбавки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKTRF_ADDS where PEKTRF_ADDSid=aRowID;
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
  PEKTRF_ADDS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKTRF.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKTRF_ADDS_LOCK /*Надбавки*/ (
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
 PEKTRF_ADDS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKTRF_ADDS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKTRF_ADDS where PEKTRF_ADDSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKTRF_ADDS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKTRF_ADDS set LockUserID =auserID ,LockSessionID =null where PEKTRF_ADDSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKTRF_ADDS set LockUserID =null,LockSessionID =aCURSESSION  where PEKTRF_ADDSid=aRowID;
     return;
   end if;
 end ;


procedure PEKTRF_ADDS_HCL /*Надбавки*/ (
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


procedure PEKTRF_ADDS_UNLOCK /*Надбавки*/ (
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
 PEKTRF_ADDS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKTRF_ADDS set LockUserID =null  where PEKTRF_ADDSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKTRF_ADDS set LockSessionID =null  where PEKTRF_ADDSid=aRowID;
     return;
   end if;
 end; 


procedure PEKTRF_ADDS_SINIT /*Надбавки*/ (
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
 select  SecurityStyleID into atmpID from PEKTRF_ADDS where PEKTRF_ADDSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKTRF_ADDS');
    return;
  end if;
if aSecurityStyleID is null then
 PEKTRF_ADDS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKTRF_ADDS set securitystyleid =aStyleID where PEKTRF_ADDSid = aRowID;
else 
 update PEKTRF_ADDS set securitystyleid =aSecurityStyleID where PEKTRF_ADDSid = aRowID;
end if; 
end ; 


procedure PEKTRF_ADDS_propagate /*Надбавки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKTRF_ADDS where PEKTRF_ADDSid=aRowid;
end;



procedure PEKTRF_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_DEFid CHAR,
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
if aPEKTRF_DEFid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKTRF_DEF where PEKTRF_DEFID=aPEKTRF_DEFID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKTRF_DEF where PEKTRF_DEFid=aPEKTRF_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKTRF_DEF');
    return;
  end if;
  aBRIEF:=func.PEKTRF_DEF_BRIEF_F(aPEKTRF_DEFid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKTRF_DEF_DELETE /*Общее описание*/ (
 aCURSESSION CHAR,
 aPEKTRF_DEFid CHAR,
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
select count(*) into existsCnt from PEKTRF_DEF where PEKTRF_DEFID=aPEKTRF_DEFID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKTRF_DEF where PEKTRF_DEFid=aPEKTRF_DEFID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKTRF_DEF',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKTRF_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKTRF_DEF');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_DEF',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKTRF_DEFid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKTRF_DEF is select  instanceid ID from instance where OwnerPartName ='PEKTRF_DEF' and OwnerRowID=aPEKTRF_DEFid;
row_PEKTRF_DEF  chld_PEKTRF_DEF%ROWTYPE;
begin
--open chld_PEKTRF_DEF;
for row_PEKTRF_DEF in chld_PEKTRF_DEF loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKTRF_DEF.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKTRF_DEF.id);
end loop;
--close chld_PEKTRF_DEF;
end ;
  delete from  PEKTRF_DEF 
  where  PEKTRF_DEFID = aPEKTRF_DEFID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Общее описание*/
procedure PEKTRF_DEF_SAVE /*Общее описание*/ (
 aCURSESSION CHAR,
 aPEKTRF_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* Организация *//* Организация */
,aStartDate
 DATE/* Начало действия *//* Начало действия */
,aTType CHAR/* Тип тарифа *//* Тип тарифа */
,aTRType CHAR/* Тип доставки *//* Тип доставки */
,aIncludeNDS
 NUMBER/* Цены с НДС *//* Цены с НДС */
,aMinPPOWeight
 NUMBER := null /* Минимальный расчетный вес *//* Минимальный расчетный вес */
,aSupplierTarif
 NUMBER/* Тариф поставщика *//* Тариф поставщика */
,aSupplier CHAR := null /* Поставщик *//* Поставщик */
,aEndDate
 DATE := null /* Конец действия тарифа *//* Конец действия тарифа */
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
select count(*) into existsCnt from PEKTRF_DEF where PEKTRF_DEFID=aPEKTRF_DEFID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKTRF_DEF where PEKTRF_DEFid=aPEKTRF_DEFID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKTRF_DEF',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKTRF_DEF');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_DEF_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_DEFid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_DEF');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_DEF',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKTRF_DEFid,aLogInstanceID=>aInstanceID);
 update  PEKTRF_DEF set ChangeStamp=sysdate
,
  ORG=aORG
,
  StartDate=aStartDate
,
  TType=aTType
,
  TRType=aTRType
,
  IncludeNDS=aIncludeNDS
,
  MinPPOWeight=aMinPPOWeight
,
  SupplierTarif=aSupplierTarif
,
  Supplier=aSupplier
,
  EndDate=aEndDate
  where  PEKTRF_DEFID = aPEKTRF_DEFID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKTRF_DEF',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKTRF_DEF');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_DEF');
    return;
  end if;
select Count(*) into existsCnt from PEKTRF_DEF where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <PEKTRF_DEF>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_DEF',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKTRF_DEFid,aLogInstanceID=>aInstanceID);
 insert into   PEKTRF_DEF
 (  PEKTRF_DEFID 
,InstanceID
,ORG

,StartDate

,TType

,TRType

,IncludeNDS

,MinPPOWeight

,SupplierTarif

,Supplier

,EndDate

 ) values ( aPEKTRF_DEFID 
,aInstanceID
,aORG

,aStartDate

,aTType

,aTRType

,aIncludeNDS

,aMinPPOWeight

,aSupplierTarif

,aSupplier

,aEndDate

 ); 
 PEKTRF_DEF_SINIT( aCURSESSION,aPEKTRF_DEFid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKTRF_DEF_PARENT /*Общее описание*/ (
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
  select  INSTANCEID into aParentID from PEKTRF_DEF where  PEKTRF_DEFid=aRowID;
 end; 


procedure PEKTRF_DEF_ISLOCKED /*Общее описание*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKTRF_DEF where PEKTRF_DEFid=aRowID;
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
  PEKTRF_DEF_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKTRF.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKTRF_DEF_LOCK /*Общее описание*/ (
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
 PEKTRF_DEF_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKTRF_DEF_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKTRF_DEF where PEKTRF_DEFid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKTRF_DEF');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKTRF_DEF set LockUserID =auserID ,LockSessionID =null where PEKTRF_DEFid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKTRF_DEF set LockUserID =null,LockSessionID =aCURSESSION  where PEKTRF_DEFid=aRowID;
     return;
   end if;
 end ;


procedure PEKTRF_DEF_HCL /*Общее описание*/ (
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


procedure PEKTRF_DEF_UNLOCK /*Общее описание*/ (
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
 PEKTRF_DEF_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKTRF_DEF set LockUserID =null  where PEKTRF_DEFid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKTRF_DEF set LockSessionID =null  where PEKTRF_DEFid=aRowID;
     return;
   end if;
 end; 


procedure PEKTRF_DEF_SINIT /*Общее описание*/ (
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
 select  SecurityStyleID into atmpID from PEKTRF_DEF where PEKTRF_DEFid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKTRF_DEF');
    return;
  end if;
if aSecurityStyleID is null then
 PEKTRF_DEF_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKTRF_DEF set securitystyleid =aStyleID where PEKTRF_DEFid = aRowID;
else 
 update PEKTRF_DEF set securitystyleid =aSecurityStyleID where PEKTRF_DEFid = aRowID;
end if; 
end ; 


procedure PEKTRF_DEF_propagate /*Общее описание*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKTRF_DEF where PEKTRF_DEFid=aRowid;
end;



procedure PEKTRF_SRV_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_SRVid CHAR,
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
if aPEKTRF_SRVid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKTRF_SRV where PEKTRF_SRVID=aPEKTRF_SRVID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKTRF_SRV where PEKTRF_SRVid=aPEKTRF_SRVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKTRF_SRV');
    return;
  end if;
  aBRIEF:=func.PEKTRF_SRV_BRIEF_F(aPEKTRF_SRVid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKTRF_SRV_DELETE /*Тарифы на услуги*/ (
 aCURSESSION CHAR,
 aPEKTRF_SRVid CHAR,
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
select count(*) into existsCnt from PEKTRF_SRV where PEKTRF_SRVID=aPEKTRF_SRVID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKTRF_SRV where PEKTRF_SRVid=aPEKTRF_SRVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKTRF_SRV',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKTRF_SRV');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_SRV_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_SRVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKTRF_SRV');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_SRV',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKTRF_SRVid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKTRF_SRV is select  instanceid ID from instance where OwnerPartName ='PEKTRF_SRV' and OwnerRowID=aPEKTRF_SRVid;
row_PEKTRF_SRV  chld_PEKTRF_SRV%ROWTYPE;
begin
--open chld_PEKTRF_SRV;
for row_PEKTRF_SRV in chld_PEKTRF_SRV loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKTRF_SRV.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKTRF_SRV.id);
end loop;
--close chld_PEKTRF_SRV;
end ;
  delete from  PEKTRF_SRV 
  where  PEKTRF_SRVID = aPEKTRF_SRVID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тарифы на услуги*/
procedure PEKTRF_SRV_SAVE /*Тарифы на услуги*/ (
 aCURSESSION CHAR,
 aPEKTRF_SRVid CHAR,
aInstanceID CHAR 
,aSrvTYPE CHAR/* Услуга *//* Услуга */
,aPrice
 NUMBER/* Цена *//* Цена */
,aTheCurrency CHAR/* Валюта *//* Валюта */
,aEDIZM CHAR/* Ед. изм. *//* Ед. изм. */
,aQuant
 NUMBER/* Количество *//* Количество */
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
select count(*) into existsCnt from PEKTRF_SRV where PEKTRF_SRVID=aPEKTRF_SRVID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKTRF_SRV where PEKTRF_SRVid=aPEKTRF_SRVID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKTRF_SRV',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKTRF_SRV');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_SRV_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_SRVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_SRV');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_SRV',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKTRF_SRVid,aLogInstanceID=>aInstanceID);
 update  PEKTRF_SRV set ChangeStamp=sysdate
,
  SrvTYPE=aSrvTYPE
,
  Price=aPrice
,
  TheCurrency=aTheCurrency
,
  EDIZM=aEDIZM
,
  Quant=aQuant
  where  PEKTRF_SRVID = aPEKTRF_SRVID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKTRF_SRV',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKTRF_SRV');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_SRV');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_SRV',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKTRF_SRVid,aLogInstanceID=>aInstanceID);
 insert into   PEKTRF_SRV
 (  PEKTRF_SRVID 
,InstanceID
,SrvTYPE

,Price

,TheCurrency

,EDIZM

,Quant

 ) values ( aPEKTRF_SRVID 
,aInstanceID
,aSrvTYPE

,aPrice

,aTheCurrency

,aEDIZM

,aQuant

 ); 
 PEKTRF_SRV_SINIT( aCURSESSION,aPEKTRF_SRVid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKTRF_SRV_PARENT /*Тарифы на услуги*/ (
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
  select  INSTANCEID into aParentID from PEKTRF_SRV where  PEKTRF_SRVid=aRowID;
 end; 


procedure PEKTRF_SRV_ISLOCKED /*Тарифы на услуги*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKTRF_SRV where PEKTRF_SRVid=aRowID;
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
  PEKTRF_SRV_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKTRF.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKTRF_SRV_LOCK /*Тарифы на услуги*/ (
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
 PEKTRF_SRV_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKTRF_SRV_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKTRF_SRV where PEKTRF_SRVid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKTRF_SRV');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKTRF_SRV set LockUserID =auserID ,LockSessionID =null where PEKTRF_SRVid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKTRF_SRV set LockUserID =null,LockSessionID =aCURSESSION  where PEKTRF_SRVid=aRowID;
     return;
   end if;
 end ;


procedure PEKTRF_SRV_HCL /*Тарифы на услуги*/ (
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


procedure PEKTRF_SRV_UNLOCK /*Тарифы на услуги*/ (
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
 PEKTRF_SRV_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKTRF_SRV set LockUserID =null  where PEKTRF_SRVid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKTRF_SRV set LockSessionID =null  where PEKTRF_SRVid=aRowID;
     return;
   end if;
 end; 


procedure PEKTRF_SRV_SINIT /*Тарифы на услуги*/ (
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
 select  SecurityStyleID into atmpID from PEKTRF_SRV where PEKTRF_SRVid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKTRF_SRV');
    return;
  end if;
if aSecurityStyleID is null then
 PEKTRF_SRV_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKTRF_SRV set securitystyleid =aStyleID where PEKTRF_SRVid = aRowID;
else 
 update PEKTRF_SRV set securitystyleid =aSecurityStyleID where PEKTRF_SRVid = aRowID;
end if; 
end ; 


procedure PEKTRF_SRV_propagate /*Тарифы на услуги*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKTRF_SRV where PEKTRF_SRVid=aRowid;
end;



procedure PEKTRF_TR_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_TRid CHAR,
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
if aPEKTRF_TRid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKTRF_TR where PEKTRF_TRID=aPEKTRF_TRID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKTRF_TR where PEKTRF_TRid=aPEKTRF_TRID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKTRF_TR');
    return;
  end if;
  aBRIEF:=func.PEKTRF_TR_BRIEF_F(aPEKTRF_TRid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKTRF_TR_DELETE /*Транспортировка*/ (
 aCURSESSION CHAR,
 aPEKTRF_TRid CHAR,
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
select count(*) into existsCnt from PEKTRF_TR where PEKTRF_TRID=aPEKTRF_TRID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKTRF_TR where PEKTRF_TRid=aPEKTRF_TRID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKTRF_TR',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKTRF_TR');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_TR_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_TRid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKTRF_TR');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PEKTRF_REGRTR is select PEKTRF_REGRTR.PEKTRF_REGRTRid ID from PEKTRF_REGRTR where  PEKTRF_REGRTR.ParentStructRowID = aPEKTRF_TRid;
    child_PEKTRF_REGRTR_rec  child_PEKTRF_REGRTR%ROWTYPE;
    begin
    --open child_PEKTRF_REGRTR;
      for child_PEKTRF_REGRTR_rec in child_PEKTRF_REGRTR loop
      PEKTRF_REGRTR_DELETE (acursession,child_PEKTRF_REGRTR_rec.id,aInstanceid);
      end loop;
      --close child_PEKTRF_REGRTR;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_TR',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKTRF_TRid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKTRF_TR is select  instanceid ID from instance where OwnerPartName ='PEKTRF_TR' and OwnerRowID=aPEKTRF_TRid;
row_PEKTRF_TR  chld_PEKTRF_TR%ROWTYPE;
begin
--open chld_PEKTRF_TR;
for row_PEKTRF_TR in chld_PEKTRF_TR loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKTRF_TR.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKTRF_TR.id);
end loop;
--close chld_PEKTRF_TR;
end ;
  delete from  PEKTRF_TR 
  where  PEKTRF_TRID = aPEKTRF_TRID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Транспортировка*/
procedure PEKTRF_TR_SAVE /*Транспортировка*/ (
 aCURSESSION CHAR,
 aPEKTRF_TRid CHAR,
aInstanceID CHAR 
,aTrain CHAR/* Направление *//* Направление */
,aToST CHAR/* До станции *//* До станции */
,aPrice
 NUMBER/* Цена *//* Цена */
,aTheCurrency CHAR := null /* Ваюта *//* Ваюта */
,aTheQuantity
 NUMBER := null /* Количество *//* Количество */
,aEDIZM CHAR := null /* Единица измерения *//* Единица измерения */
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
select count(*) into existsCnt from PEKTRF_TR where PEKTRF_TRID=aPEKTRF_TRID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKTRF_TR where PEKTRF_TRid=aPEKTRF_TRID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKTRF_TR',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKTRF_TR');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_TR_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_TRid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_TR');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_TR',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKTRF_TRid,aLogInstanceID=>aInstanceID);
 update  PEKTRF_TR set ChangeStamp=sysdate
,
  Train=aTrain
,
  ToST=aToST
,
  Price=aPrice
,
  TheCurrency=aTheCurrency
,
  TheQuantity=aTheQuantity
,
  EDIZM=aEDIZM
  where  PEKTRF_TRID = aPEKTRF_TRID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKTRF_TR',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKTRF_TR');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_TR');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_TR',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKTRF_TRid,aLogInstanceID=>aInstanceID);
 insert into   PEKTRF_TR
 (  PEKTRF_TRID 
,InstanceID
,Train

,ToST

,Price

,TheCurrency

,TheQuantity

,EDIZM

 ) values ( aPEKTRF_TRID 
,aInstanceID
,aTrain

,aToST

,aPrice

,aTheCurrency

,aTheQuantity

,aEDIZM

 ); 
 PEKTRF_TR_SINIT( aCURSESSION,aPEKTRF_TRid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKTRF_TR_PARENT /*Транспортировка*/ (
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
  select  INSTANCEID into aParentID from PEKTRF_TR where  PEKTRF_TRid=aRowID;
 end; 


procedure PEKTRF_TR_ISLOCKED /*Транспортировка*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKTRF_TR where PEKTRF_TRid=aRowID;
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
  PEKTRF_TR_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKTRF.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKTRF_TR_LOCK /*Транспортировка*/ (
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
 PEKTRF_TR_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKTRF_TR_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKTRF_TR where PEKTRF_TRid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKTRF_TR');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKTRF_TR set LockUserID =auserID ,LockSessionID =null where PEKTRF_TRid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKTRF_TR set LockUserID =null,LockSessionID =aCURSESSION  where PEKTRF_TRid=aRowID;
     return;
   end if;
 end ;


procedure PEKTRF_TR_HCL /*Транспортировка*/ (
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
declare cursor lch_PEKTRF_REGRTR is select PEKTRF_REGRTR.PEKTRF_REGRTRid ID from PEKTRF_REGRTR where  PEKTRF_REGRTR.ParentStructRowID = aRowid;
row_PEKTRF_REGRTR lch_PEKTRF_REGRTR%ROWTYPE;
begin  
--open lch_PEKTRF_REGRTR;
for row_PEKTRF_REGRTR in lch_PEKTRF_REGRTR
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKTRF_REGRTR where PEKTRF_REGRTRid=row_PEKTRF_REGRTR.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKTRF_REGRTR;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKTRF_REGRTR;
     return;
   end if; 
 end if;  
 PEKTRF_REGRTR_HCL (acursession,row_PEKTRF_REGRTR.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKTRF_REGRTR;
   return;
 end if;
end loop;
--close lch_PEKTRF_REGRTR;
end;
aIsLocked :=0;
end;


procedure PEKTRF_TR_UNLOCK /*Транспортировка*/ (
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
 PEKTRF_TR_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKTRF_TR set LockUserID =null  where PEKTRF_TRid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKTRF_TR set LockSessionID =null  where PEKTRF_TRid=aRowID;
     return;
   end if;
 end; 


procedure PEKTRF_TR_SINIT /*Транспортировка*/ (
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
 select  SecurityStyleID into atmpID from PEKTRF_TR where PEKTRF_TRid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKTRF_TR');
    return;
  end if;
if aSecurityStyleID is null then
 PEKTRF_TR_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKTRF_TR set securitystyleid =aStyleID where PEKTRF_TRid = aRowID;
else 
 update PEKTRF_TR set securitystyleid =aSecurityStyleID where PEKTRF_TRid = aRowID;
end if; 
end ; 


procedure PEKTRF_TR_propagate /*Транспортировка*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKTRF_TR where PEKTRF_TRid=aRowid;
declare cursor pch_PEKTRF_REGRTR  is select PEKTRF_REGRTR.PEKTRF_REGRTRid ID from PEKTRF_REGRTR where  PEKTRF_REGRTR.ParentStructRowID = aRowid;
row_PEKTRF_REGRTR  pch_PEKTRF_REGRTR%ROWTYPE;
begin
--open pch_PEKTRF_REGRTR;
for row_PEKTRF_REGRTR in pch_PEKTRF_REGRTR loop
   PEKTRF_REGRTR_SINIT( acursession,row_PEKTRF_REGRTR.id,assid);
   PEKTRF_REGRTR_propagate( acursession,row_PEKTRF_REGRTR.id);
end loop;
--close pch_PEKTRF_REGRTR;
end;
end;



procedure PEKTRF_REGRTR_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_REGRTRid CHAR,
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
if aPEKTRF_REGRTRid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKTRF_REGRTR where PEKTRF_REGRTRID=aPEKTRF_REGRTRID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKTRF_REGRTR where PEKTRF_REGRTRid=aPEKTRF_REGRTRID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKTRF_REGRTR');
    return;
  end if;
  aBRIEF:=func.PEKTRF_REGRTR_BRIEF_F(aPEKTRF_REGRTRid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKTRF_REGRTR_DELETE /*Регресс по весу*/ (
 aCURSESSION CHAR,
 aPEKTRF_REGRTRid CHAR,
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
select count(*) into existsCnt from PEKTRF_REGRTR where PEKTRF_REGRTRID=aPEKTRF_REGRTRID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKTRF_REGRTR where PEKTRF_REGRTRid=aPEKTRF_REGRTRID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKTRF_REGRTR',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKTRF_REGRTR');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_REGRTR_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_REGRTRid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKTRF_REGRTR');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_REGRTR',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKTRF_REGRTRid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKTRF_REGRTR is select  instanceid ID from instance where OwnerPartName ='PEKTRF_REGRTR' and OwnerRowID=aPEKTRF_REGRTRid;
row_PEKTRF_REGRTR  chld_PEKTRF_REGRTR%ROWTYPE;
begin
--open chld_PEKTRF_REGRTR;
for row_PEKTRF_REGRTR in chld_PEKTRF_REGRTR loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKTRF_REGRTR.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKTRF_REGRTR.id);
end loop;
--close chld_PEKTRF_REGRTR;
end ;
  delete from  PEKTRF_REGRTR 
  where  PEKTRF_REGRTRID = aPEKTRF_REGRTRID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Регресс по весу*/
procedure PEKTRF_REGRTR_SAVE /*Регресс по весу*/ (
 aCURSESSION CHAR,
 aPEKTRF_REGRTRid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aWeightFrom
 NUMBER/* Суммарный вес от *//* Суммарный вес от */
,aWeightTo
 NUMBER/* Суммарный вес по *//* Суммарный вес по */
,aWeightEDIZM CHAR := null /* Ед. изм. веса *//* Ед. изм. веса */
,aPricePercent
 NUMBER := null /* Процент от тарифа *//* Процент от тарифа */
,aFixedPrice
 NUMBER := null /* Фиксированная цена *//* Фиксированная цена */
,aPriceCurrency CHAR := null /* Валюта фиксированной цены *//* Валюта фиксированной цены */
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
select count(*) into existsCnt from PEKTRF_REGRTR where PEKTRF_REGRTRID=aPEKTRF_REGRTRID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKTRF_REGRTR where PEKTRF_REGRTRid=aPEKTRF_REGRTRID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKTRF_REGRTR',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKTRF_REGRTR');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKTRF_REGRTR_ISLOCKED( acursession=>acursession,aROWID=>aPEKTRF_REGRTRid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_REGRTR');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_REGRTR',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKTRF_REGRTRid,aLogInstanceID=>aInstanceID);
 update  PEKTRF_REGRTR set ChangeStamp=sysdate
,
  WeightFrom=aWeightFrom
,
  WeightTo=aWeightTo
,
  WeightEDIZM=aWeightEDIZM
,
  PricePercent=aPricePercent
,
  FixedPrice=aFixedPrice
,
  PriceCurrency=aPriceCurrency
  where  PEKTRF_REGRTRID = aPEKTRF_REGRTRID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PEKTRF_TR where PEKTRF_TRid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKTRF_REGRTR',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKTRF_REGRTR');
      return;
    end if;
 end if;
 PEKTRF_TR_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKTRF_REGRTR');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKTRF_REGRTR',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKTRF_REGRTRid,aLogInstanceID=>aInstanceID);
 insert into   PEKTRF_REGRTR
 (  PEKTRF_REGRTRID 
,ParentStructRowID
,WeightFrom

,WeightTo

,WeightEDIZM

,PricePercent

,FixedPrice

,PriceCurrency

 ) values ( aPEKTRF_REGRTRID 
,aParentStructRowID
,aWeightFrom

,aWeightTo

,aWeightEDIZM

,aPricePercent

,aFixedPrice

,aPriceCurrency

 ); 
 PEKTRF_REGRTR_SINIT( aCURSESSION,aPEKTRF_REGRTRid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKTRF_REGRTR_PARENT /*Регресс по весу*/ (
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
  select ParentStructRowID into aParentID  from PEKTRF_REGRTR where  PEKTRF_REGRTRid=aRowID;
  aParentTable := 'PEKTRF_TR';
 end; 


procedure PEKTRF_REGRTR_ISLOCKED /*Регресс по весу*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKTRF_REGRTR where PEKTRF_REGRTRid=aRowID;
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
  PEKTRF_REGRTR_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKTRF.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKTRF_REGRTR_LOCK /*Регресс по весу*/ (
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
 PEKTRF_REGRTR_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKTRF_REGRTR_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKTRF_REGRTR where PEKTRF_REGRTRid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKTRF_REGRTR');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKTRF_REGRTR set LockUserID =auserID ,LockSessionID =null where PEKTRF_REGRTRid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKTRF_REGRTR set LockUserID =null,LockSessionID =aCURSESSION  where PEKTRF_REGRTRid=aRowID;
     return;
   end if;
 end ;


procedure PEKTRF_REGRTR_HCL /*Регресс по весу*/ (
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


procedure PEKTRF_REGRTR_UNLOCK /*Регресс по весу*/ (
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
 PEKTRF_REGRTR_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKTRF_REGRTR set LockUserID =null  where PEKTRF_REGRTRid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKTRF_REGRTR set LockSessionID =null  where PEKTRF_REGRTRid=aRowID;
     return;
   end if;
 end; 


procedure PEKTRF_REGRTR_SINIT /*Регресс по весу*/ (
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
 select  SecurityStyleID into atmpID from PEKTRF_REGRTR where PEKTRF_REGRTRid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKTRF_REGRTR');
    return;
  end if;
if aSecurityStyleID is null then
 PEKTRF_REGRTR_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKTRF_REGRTR set securitystyleid =aStyleID where PEKTRF_REGRTRid = aRowID;
else 
 update PEKTRF_REGRTR set securitystyleid =aSecurityStyleID where PEKTRF_REGRTRid = aRowID;
end if; 
end ; 


procedure PEKTRF_REGRTR_propagate /*Регресс по весу*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKTRF_REGRTR where PEKTRF_REGRTRid=aRowid;
end;


end PEKTRF;

/



