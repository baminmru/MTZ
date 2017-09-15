
/* --VRDG*/

 create or replace package body VRDG as

procedure VRDG_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='VRDG'
then
declare cursor child_VRDGCommon is select VRDGCommon.VRDGCommonid ID from VRDGCommon where  VRDGCommon.InstanceID = ainstanceid;
row_VRDGCommon  child_VRDGCommon%ROWTYPE;
begin
--open child_VRDGCommon;
for row_VRDGCommon in child_VRDGCommon loop
 VRDGCommon_DELETE (acursession,row_VRDGCommon.id,aInstanceID);
end loop;
--close child_VRDGCommon;
end;
declare cursor child_VRDGReport is select VRDGReport.VRDGReportid ID from VRDGReport where  VRDGReport.InstanceID = ainstanceid;
row_VRDGReport  child_VRDGReport%ROWTYPE;
begin
--open child_VRDGReport;
for row_VRDGReport in child_VRDGReport loop
 VRDGReport_DELETE (acursession,row_VRDGReport.id,aInstanceID);
end loop;
--close child_VRDGReport;
end;
declare cursor child_VRDGPayment is select VRDGPayment.VRDGPaymentid ID from VRDGPayment where  VRDGPayment.InstanceID = ainstanceid;
row_VRDGPayment  child_VRDGPayment%ROWTYPE;
begin
--open child_VRDGPayment;
for row_VRDGPayment in child_VRDGPayment loop
 VRDGPayment_DELETE (acursession,row_VRDGPayment.id,aInstanceID);
end loop;
--close child_VRDGPayment;
end;
declare cursor child_VRDGContractChanges is select VRDGContractChanges.VRDGContractChangesid ID from VRDGContractChanges where  VRDGContractChanges.InstanceID = ainstanceid;
row_VRDGContractChanges  child_VRDGContractChanges%ROWTYPE;
begin
--open child_VRDGContractChanges;
for row_VRDGContractChanges in child_VRDGContractChanges loop
 VRDGContractChanges_DELETE (acursession,row_VRDGContractChanges.id,aInstanceID);
end loop;
--close child_VRDGContractChanges;
end;
declare cursor child_VRDGSeeAlso is select VRDGSeeAlso.VRDGSeeAlsoid ID from VRDGSeeAlso where  VRDGSeeAlso.InstanceID = ainstanceid;
row_VRDGSeeAlso  child_VRDGSeeAlso%ROWTYPE;
begin
--open child_VRDGSeeAlso;
for row_VRDGSeeAlso in child_VRDGSeeAlso loop
 VRDGSeeAlso_DELETE (acursession,row_VRDGSeeAlso.id,aInstanceID);
end loop;
--close child_VRDGSeeAlso;
end;
declare cursor child_VRDGContractVersion is select VRDGContractVersion.VRDGContractVersionid ID from VRDGContractVersion where  VRDGContractVersion.InstanceID = ainstanceid;
row_VRDGContractVersion  child_VRDGContractVersion%ROWTYPE;
begin
--open child_VRDGContractVersion;
for row_VRDGContractVersion in child_VRDGContractVersion loop
 VRDGContractVersion_DELETE (acursession,row_VRDGContractVersion.id,aInstanceID);
end loop;
--close child_VRDGContractVersion;
end;
declare cursor child_VRDGContractSpesial is select VRDGContractSpesial.VRDGContractSpesialid ID from VRDGContractSpesial where  VRDGContractSpesial.InstanceID = ainstanceid;
row_VRDGContractSpesial  child_VRDGContractSpesial%ROWTYPE;
begin
--open child_VRDGContractSpesial;
for row_VRDGContractSpesial in child_VRDGContractSpesial loop
 VRDGContractSpesial_DELETE (acursession,row_VRDGContractSpesial.id,aInstanceID);
end loop;
--close child_VRDGContractSpesial;
end;
return;
<<del_error>>
return;
end if;
end;
procedure VRDG_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'VRDG'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_VRDGCommon is select VRDGCommon.VRDGCommonid ID from VRDGCommon where  VRDGCommon.InstanceID = arowid;
ROW_VRDGCommon  lch_VRDGCommon%ROWTYPE;
begin
--open lch_VRDGCommon;
for row_VRDGCommon in lch_VRDGCommon loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDGCommon where VRDGCommonid=row_VRDGCommon.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDGCommon;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDGCommon;
     return;
   end if; 
 end if; 
 VRDGCommon_HCL (acursession,ROW_VRDGCommon.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDGCommon;
   return;
 end if;
 end loop;
--close lch_VRDGCommon;
end;
declare cursor lch_VRDGReport is select VRDGReport.VRDGReportid ID from VRDGReport where  VRDGReport.InstanceID = arowid;
ROW_VRDGReport  lch_VRDGReport%ROWTYPE;
begin
--open lch_VRDGReport;
for row_VRDGReport in lch_VRDGReport loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDGReport where VRDGReportid=row_VRDGReport.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDGReport;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDGReport;
     return;
   end if; 
 end if; 
 VRDGReport_HCL (acursession,ROW_VRDGReport.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDGReport;
   return;
 end if;
 end loop;
--close lch_VRDGReport;
end;
declare cursor lch_VRDGPayment is select VRDGPayment.VRDGPaymentid ID from VRDGPayment where  VRDGPayment.InstanceID = arowid;
ROW_VRDGPayment  lch_VRDGPayment%ROWTYPE;
begin
--open lch_VRDGPayment;
for row_VRDGPayment in lch_VRDGPayment loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDGPayment where VRDGPaymentid=row_VRDGPayment.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDGPayment;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDGPayment;
     return;
   end if; 
 end if; 
 VRDGPayment_HCL (acursession,ROW_VRDGPayment.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDGPayment;
   return;
 end if;
 end loop;
--close lch_VRDGPayment;
end;
declare cursor lch_VRDGContractChanges is select VRDGContractChanges.VRDGContractChangesid ID from VRDGContractChanges where  VRDGContractChanges.InstanceID = arowid;
ROW_VRDGContractChanges  lch_VRDGContractChanges%ROWTYPE;
begin
--open lch_VRDGContractChanges;
for row_VRDGContractChanges in lch_VRDGContractChanges loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDGContractChanges where VRDGContractChangesid=row_VRDGContractChanges.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDGContractChanges;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDGContractChanges;
     return;
   end if; 
 end if; 
 VRDGContractChanges_HCL (acursession,ROW_VRDGContractChanges.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDGContractChanges;
   return;
 end if;
 end loop;
--close lch_VRDGContractChanges;
end;
declare cursor lch_VRDGSeeAlso is select VRDGSeeAlso.VRDGSeeAlsoid ID from VRDGSeeAlso where  VRDGSeeAlso.InstanceID = arowid;
ROW_VRDGSeeAlso  lch_VRDGSeeAlso%ROWTYPE;
begin
--open lch_VRDGSeeAlso;
for row_VRDGSeeAlso in lch_VRDGSeeAlso loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDGSeeAlso where VRDGSeeAlsoid=row_VRDGSeeAlso.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDGSeeAlso;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDGSeeAlso;
     return;
   end if; 
 end if; 
 VRDGSeeAlso_HCL (acursession,ROW_VRDGSeeAlso.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDGSeeAlso;
   return;
 end if;
 end loop;
--close lch_VRDGSeeAlso;
end;
declare cursor lch_VRDGContractVersion is select VRDGContractVersion.VRDGContractVersionid ID from VRDGContractVersion where  VRDGContractVersion.InstanceID = arowid;
ROW_VRDGContractVersion  lch_VRDGContractVersion%ROWTYPE;
begin
--open lch_VRDGContractVersion;
for row_VRDGContractVersion in lch_VRDGContractVersion loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDGContractVersion where VRDGContractVersionid=row_VRDGContractVersion.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDGContractVersion;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDGContractVersion;
     return;
   end if; 
 end if; 
 VRDGContractVersion_HCL (acursession,ROW_VRDGContractVersion.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDGContractVersion;
   return;
 end if;
 end loop;
--close lch_VRDGContractVersion;
end;
declare cursor lch_VRDGContractSpesial is select VRDGContractSpesial.VRDGContractSpesialid ID from VRDGContractSpesial where  VRDGContractSpesial.InstanceID = arowid;
ROW_VRDGContractSpesial  lch_VRDGContractSpesial%ROWTYPE;
begin
--open lch_VRDGContractSpesial;
for row_VRDGContractSpesial in lch_VRDGContractSpesial loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDGContractSpesial where VRDGContractSpesialid=row_VRDGContractSpesial.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDGContractSpesial;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDGContractSpesial;
     return;
   end if; 
 end if; 
 VRDGContractSpesial_HCL (acursession,ROW_VRDGContractSpesial.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDGContractSpesial;
   return;
 end if;
 end loop;
--close lch_VRDGContractSpesial;
end;
 end if;
aIsLocked:=0;
end;
procedure VRDG_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'VRDG'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_VRDGCommon is select VRDGCommon.VRDGCommonid id from VRDGCommon where  VRDGCommon.InstanceID = arowid;
row_VRDGCommon  pch_VRDGCommon%ROWTYPE;
begin
--open pch_VRDGCommon;
for row_VRDGCommon in  pch_VRDGCommon loop
 VRDGCommon_SINIT( acursession,row_VRDGCommon.id,assid);
 VRDGCommon_propagate( acursession,row_VRDGCommon.id);
end loop;
--close pch_VRDGCommon;
end;
declare cursor pch_VRDGReport is select VRDGReport.VRDGReportid id from VRDGReport where  VRDGReport.InstanceID = arowid;
row_VRDGReport  pch_VRDGReport%ROWTYPE;
begin
--open pch_VRDGReport;
for row_VRDGReport in  pch_VRDGReport loop
 VRDGReport_SINIT( acursession,row_VRDGReport.id,assid);
 VRDGReport_propagate( acursession,row_VRDGReport.id);
end loop;
--close pch_VRDGReport;
end;
declare cursor pch_VRDGPayment is select VRDGPayment.VRDGPaymentid id from VRDGPayment where  VRDGPayment.InstanceID = arowid;
row_VRDGPayment  pch_VRDGPayment%ROWTYPE;
begin
--open pch_VRDGPayment;
for row_VRDGPayment in  pch_VRDGPayment loop
 VRDGPayment_SINIT( acursession,row_VRDGPayment.id,assid);
 VRDGPayment_propagate( acursession,row_VRDGPayment.id);
end loop;
--close pch_VRDGPayment;
end;
declare cursor pch_VRDGContractChanges is select VRDGContractChanges.VRDGContractChangesid id from VRDGContractChanges where  VRDGContractChanges.InstanceID = arowid;
row_VRDGContractChanges  pch_VRDGContractChanges%ROWTYPE;
begin
--open pch_VRDGContractChanges;
for row_VRDGContractChanges in  pch_VRDGContractChanges loop
 VRDGContractChanges_SINIT( acursession,row_VRDGContractChanges.id,assid);
 VRDGContractChanges_propagate( acursession,row_VRDGContractChanges.id);
end loop;
--close pch_VRDGContractChanges;
end;
declare cursor pch_VRDGSeeAlso is select VRDGSeeAlso.VRDGSeeAlsoid id from VRDGSeeAlso where  VRDGSeeAlso.InstanceID = arowid;
row_VRDGSeeAlso  pch_VRDGSeeAlso%ROWTYPE;
begin
--open pch_VRDGSeeAlso;
for row_VRDGSeeAlso in  pch_VRDGSeeAlso loop
 VRDGSeeAlso_SINIT( acursession,row_VRDGSeeAlso.id,assid);
 VRDGSeeAlso_propagate( acursession,row_VRDGSeeAlso.id);
end loop;
--close pch_VRDGSeeAlso;
end;
declare cursor pch_VRDGContractVersion is select VRDGContractVersion.VRDGContractVersionid id from VRDGContractVersion where  VRDGContractVersion.InstanceID = arowid;
row_VRDGContractVersion  pch_VRDGContractVersion%ROWTYPE;
begin
--open pch_VRDGContractVersion;
for row_VRDGContractVersion in  pch_VRDGContractVersion loop
 VRDGContractVersion_SINIT( acursession,row_VRDGContractVersion.id,assid);
 VRDGContractVersion_propagate( acursession,row_VRDGContractVersion.id);
end loop;
--close pch_VRDGContractVersion;
end;
declare cursor pch_VRDGContractSpesial is select VRDGContractSpesial.VRDGContractSpesialid id from VRDGContractSpesial where  VRDGContractSpesial.InstanceID = arowid;
row_VRDGContractSpesial  pch_VRDGContractSpesial%ROWTYPE;
begin
--open pch_VRDGContractSpesial;
for row_VRDGContractSpesial in  pch_VRDGContractSpesial loop
 VRDGContractSpesial_SINIT( acursession,row_VRDGContractSpesial.id,assid);
 VRDGContractSpesial_propagate( acursession,row_VRDGContractSpesial.id);
end loop;
--close pch_VRDGContractSpesial;
end;
 end if; 
end;



procedure VRDGCommon_BRIEF  (
 aCURSESSION CHAR,
 aVRDGCommonid CHAR,
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
if aVRDGCommonid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDGCommon where VRDGCommonID=aVRDGCommonID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDGCommon where VRDGCommonid=aVRDGCommonID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDGCommon');
    return;
  end if;
  aBRIEF:=func.VRDGCommon_BRIEF_F(aVRDGCommonid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDGCommon_DELETE /*Общая информация*/ (
 aCURSESSION CHAR,
 aVRDGCommonid CHAR,
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
select count(*) into existsCnt from VRDGCommon where VRDGCommonID=aVRDGCommonID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDGCommon where VRDGCommonid=aVRDGCommonID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDGCommon',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDGCommon');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGCommon_ISLOCKED( acursession=>acursession,aROWID=>aVRDGCommonid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDGCommon');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDGCommon',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDGCommonid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDGCommon is select  instanceid ID from instance where OwnerPartName ='VRDGCommon' and OwnerRowID=aVRDGCommonid;
row_VRDGCommon  chld_VRDGCommon%ROWTYPE;
begin
--open chld_VRDGCommon;
for row_VRDGCommon in chld_VRDGCommon loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDGCommon.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDGCommon.id);
end loop;
--close chld_VRDGCommon;
end ;
  delete from  VRDGCommon 
  where  VRDGCommonID = aVRDGCommonID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Общая информация*/
procedure VRDGCommon_SAVE /*Общая информация*/ (
 aCURSESSION CHAR,
 aVRDGCommonid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* Наша организация *//* Наша организация */
,aDogNum
 VARCHAR2/* Номер договора *//* Номер договора */
,aDogDate
 DATE/* Дата договора *//* Дата договора */
,aName
 VARCHAR2 := null /* Название *//* Название */
,aCurator CHAR := null /* Ответственный *//* Ответственный */
,aInfo VARCHAR2 := null /* Примечание *//* Примечание */
,aClient CHAR := null /* Контрагент *//* Контрагент */
,aDogType CHAR := null /* Тип договора *//* Тип договора */
,aPZDog
 NUMBER := null /* Договор к разовой заявке *//* Договор к разовой заявке */
,aStartDate
 DATE := null /* Начало действия *//* Начало действия */
,aEndDate
 DATE := null /* Окончание действия договора *//* Окончание действия договора */
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
select count(*) into existsCnt from VRDGCommon where VRDGCommonID=aVRDGCommonID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDGCommon where VRDGCommonid=aVRDGCommonID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDGCommon',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDGCommon');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGCommon_ISLOCKED( acursession=>acursession,aROWID=>aVRDGCommonid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGCommon');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGCommon',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDGCommonid,aLogInstanceID=>aInstanceID);
 update  VRDGCommon set ChangeStamp=sysdate
,
  Org=aOrg
,
  DogNum=aDogNum
,
  DogDate=aDogDate
,
  Name=aName
,
  Curator=aCurator
,
  Info=aInfo
,
  Client=aClient
,
  DogType=aDogType
,
  PZDog=aPZDog
,
  StartDate=aStartDate
,
  EndDate=aEndDate
,
  Code1C=aCode1C
  where  VRDGCommonID = aVRDGCommonID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDGCommon',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDGCommon');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGCommon');
    return;
  end if;
select Count(*) into existsCnt from VRDGCommon where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <VRDGCommon>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGCommon',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDGCommonid,aLogInstanceID=>aInstanceID);
 insert into   VRDGCommon
 (  VRDGCommonID 
,InstanceID
,Org

,DogNum

,DogDate

,Name

,Curator

,Info

,Client

,DogType

,PZDog

,StartDate

,EndDate

,Code1C

 ) values ( aVRDGCommonID 
,aInstanceID
,aOrg

,aDogNum

,aDogDate

,aName

,aCurator

,aInfo

,aClient

,aDogType

,aPZDog

,aStartDate

,aEndDate

,aCode1C

 ); 
 VRDGCommon_SINIT( aCURSESSION,aVRDGCommonid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDGCommon_PARENT /*Общая информация*/ (
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
  select  INSTANCEID into aParentID from VRDGCommon where  VRDGCommonid=aRowID;
 end; 


procedure VRDGCommon_ISLOCKED /*Общая информация*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDGCommon where VRDGCommonid=aRowID;
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
  VRDGCommon_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRDG.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDGCommon_LOCK /*Общая информация*/ (
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
 VRDGCommon_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDGCommon_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDGCommon where VRDGCommonid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDGCommon');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDGCommon set LockUserID =auserID ,LockSessionID =null where VRDGCommonid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDGCommon set LockUserID =null,LockSessionID =aCURSESSION  where VRDGCommonid=aRowID;
     return;
   end if;
 end ;


procedure VRDGCommon_HCL /*Общая информация*/ (
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


procedure VRDGCommon_UNLOCK /*Общая информация*/ (
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
 VRDGCommon_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDGCommon set LockUserID =null  where VRDGCommonid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDGCommon set LockSessionID =null  where VRDGCommonid=aRowID;
     return;
   end if;
 end; 


procedure VRDGCommon_SINIT /*Общая информация*/ (
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
 select  SecurityStyleID into atmpID from VRDGCommon where VRDGCommonid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDGCommon');
    return;
  end if;
if aSecurityStyleID is null then
 VRDGCommon_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDGCommon set securitystyleid =aStyleID where VRDGCommonid = aRowID;
else 
 update VRDGCommon set securitystyleid =aSecurityStyleID where VRDGCommonid = aRowID;
end if; 
end ; 


procedure VRDGCommon_propagate /*Общая информация*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDGCommon where VRDGCommonid=aRowid;
end;



procedure VRDGReport_BRIEF  (
 aCURSESSION CHAR,
 aVRDGReportid CHAR,
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
if aVRDGReportid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDGReport where VRDGReportID=aVRDGReportID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDGReport where VRDGReportid=aVRDGReportID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDGReport');
    return;
  end if;
  aBRIEF:=func.VRDGReport_BRIEF_F(aVRDGReportid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDGReport_DELETE /*Отчеты*/ (
 aCURSESSION CHAR,
 aVRDGReportid CHAR,
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
select count(*) into existsCnt from VRDGReport where VRDGReportID=aVRDGReportID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDGReport where VRDGReportid=aVRDGReportID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDGReport',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDGReport');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGReport_ISLOCKED( acursession=>acursession,aROWID=>aVRDGReportid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDGReport');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDGReport',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDGReportid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDGReport is select  instanceid ID from instance where OwnerPartName ='VRDGReport' and OwnerRowID=aVRDGReportid;
row_VRDGReport  chld_VRDGReport%ROWTYPE;
begin
--open chld_VRDGReport;
for row_VRDGReport in chld_VRDGReport loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDGReport.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDGReport.id);
end loop;
--close chld_VRDGReport;
end ;
  delete from  VRDGReport 
  where  VRDGReportID = aVRDGReportID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Отчеты*/
procedure VRDGReport_SAVE /*Отчеты*/ (
 aCURSESSION CHAR,
 aVRDGReportid CHAR,
aInstanceID CHAR 
,aReport CHAR/* Отчет *//* Отчет */
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
select count(*) into existsCnt from VRDGReport where VRDGReportID=aVRDGReportID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDGReport where VRDGReportid=aVRDGReportID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDGReport',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDGReport');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGReport_ISLOCKED( acursession=>acursession,aROWID=>aVRDGReportid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGReport');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGReport',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDGReportid,aLogInstanceID=>aInstanceID);
 update  VRDGReport set ChangeStamp=sysdate
,
  Report=aReport
  where  VRDGReportID = aVRDGReportID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDGReport',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDGReport');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGReport');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGReport',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDGReportid,aLogInstanceID=>aInstanceID);
 insert into   VRDGReport
 (  VRDGReportID 
,InstanceID
,Report

 ) values ( aVRDGReportID 
,aInstanceID
,aReport

 ); 
 VRDGReport_SINIT( aCURSESSION,aVRDGReportid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDGReport_PARENT /*Отчеты*/ (
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
  select  INSTANCEID into aParentID from VRDGReport where  VRDGReportid=aRowID;
 end; 


procedure VRDGReport_ISLOCKED /*Отчеты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDGReport where VRDGReportid=aRowID;
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
  VRDGReport_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRDG.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDGReport_LOCK /*Отчеты*/ (
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
 VRDGReport_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDGReport_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDGReport where VRDGReportid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDGReport');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDGReport set LockUserID =auserID ,LockSessionID =null where VRDGReportid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDGReport set LockUserID =null,LockSessionID =aCURSESSION  where VRDGReportid=aRowID;
     return;
   end if;
 end ;


procedure VRDGReport_HCL /*Отчеты*/ (
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


procedure VRDGReport_UNLOCK /*Отчеты*/ (
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
 VRDGReport_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDGReport set LockUserID =null  where VRDGReportid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDGReport set LockSessionID =null  where VRDGReportid=aRowID;
     return;
   end if;
 end; 


procedure VRDGReport_SINIT /*Отчеты*/ (
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
 select  SecurityStyleID into atmpID from VRDGReport where VRDGReportid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDGReport');
    return;
  end if;
if aSecurityStyleID is null then
 VRDGReport_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDGReport set securitystyleid =aStyleID where VRDGReportid = aRowID;
else 
 update VRDGReport set securitystyleid =aSecurityStyleID where VRDGReportid = aRowID;
end if; 
end ; 


procedure VRDGReport_propagate /*Отчеты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDGReport where VRDGReportid=aRowid;
end;



procedure VRDGPayment_BRIEF  (
 aCURSESSION CHAR,
 aVRDGPaymentid CHAR,
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
if aVRDGPaymentid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDGPayment where VRDGPaymentID=aVRDGPaymentID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDGPayment where VRDGPaymentid=aVRDGPaymentID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDGPayment');
    return;
  end if;
  aBRIEF:=func.VRDGPayment_BRIEF_F(aVRDGPaymentid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDGPayment_DELETE /*Оплаты*/ (
 aCURSESSION CHAR,
 aVRDGPaymentid CHAR,
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
select count(*) into existsCnt from VRDGPayment where VRDGPaymentID=aVRDGPaymentID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDGPayment where VRDGPaymentid=aVRDGPaymentID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDGPayment',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDGPayment');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGPayment_ISLOCKED( acursession=>acursession,aROWID=>aVRDGPaymentid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDGPayment');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDGPayment',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDGPaymentid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDGPayment is select  instanceid ID from instance where OwnerPartName ='VRDGPayment' and OwnerRowID=aVRDGPaymentid;
row_VRDGPayment  chld_VRDGPayment%ROWTYPE;
begin
--open chld_VRDGPayment;
for row_VRDGPayment in chld_VRDGPayment loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDGPayment.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDGPayment.id);
end loop;
--close chld_VRDGPayment;
end ;
  delete from  VRDGPayment 
  where  VRDGPaymentID = aVRDGPaymentID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Оплаты*/
procedure VRDGPayment_SAVE /*Оплаты*/ (
 aCURSESSION CHAR,
 aVRDGPaymentid CHAR,
aInstanceID CHAR 
,aCreateDate
 DATE := null /* Дата выписки счета *//* Дата выписки счета */
,aDateOF
 DATE/* Дата оплаты *//* Дата оплаты */
,atheSumm
 NUMBER/* Сумма *//* Сумма */
,aCash
 NUMBER := null /* Наличная оплата *//* Наличная оплата */
,aPaymentForm
 VARCHAR2 := null /* № Счета *//* № Счета */
,aInfo VARCHAR2 := null /* Предмет счета *//* Предмет счета */
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
select count(*) into existsCnt from VRDGPayment where VRDGPaymentID=aVRDGPaymentID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDGPayment where VRDGPaymentid=aVRDGPaymentID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDGPayment',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDGPayment');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGPayment_ISLOCKED( acursession=>acursession,aROWID=>aVRDGPaymentid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGPayment');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGPayment',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDGPaymentid,aLogInstanceID=>aInstanceID);
 update  VRDGPayment set ChangeStamp=sysdate
,
  CreateDate=aCreateDate
,
  DateOF=aDateOF
,
  theSumm=atheSumm
,
  Cash=aCash
,
  PaymentForm=aPaymentForm
,
  Info=aInfo
  where  VRDGPaymentID = aVRDGPaymentID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDGPayment',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDGPayment');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGPayment');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGPayment',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDGPaymentid,aLogInstanceID=>aInstanceID);
 insert into   VRDGPayment
 (  VRDGPaymentID 
,InstanceID
,CreateDate

,DateOF

,theSumm

,Cash

,PaymentForm

,Info

 ) values ( aVRDGPaymentID 
,aInstanceID
,aCreateDate

,aDateOF

,atheSumm

,aCash

,aPaymentForm

,aInfo

 ); 
 VRDGPayment_SINIT( aCURSESSION,aVRDGPaymentid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDGPayment_PARENT /*Оплаты*/ (
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
  select  INSTANCEID into aParentID from VRDGPayment where  VRDGPaymentid=aRowID;
 end; 


procedure VRDGPayment_ISLOCKED /*Оплаты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDGPayment where VRDGPaymentid=aRowID;
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
  VRDGPayment_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRDG.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDGPayment_LOCK /*Оплаты*/ (
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
 VRDGPayment_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDGPayment_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDGPayment where VRDGPaymentid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDGPayment');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDGPayment set LockUserID =auserID ,LockSessionID =null where VRDGPaymentid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDGPayment set LockUserID =null,LockSessionID =aCURSESSION  where VRDGPaymentid=aRowID;
     return;
   end if;
 end ;


procedure VRDGPayment_HCL /*Оплаты*/ (
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


procedure VRDGPayment_UNLOCK /*Оплаты*/ (
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
 VRDGPayment_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDGPayment set LockUserID =null  where VRDGPaymentid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDGPayment set LockSessionID =null  where VRDGPaymentid=aRowID;
     return;
   end if;
 end; 


procedure VRDGPayment_SINIT /*Оплаты*/ (
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
 select  SecurityStyleID into atmpID from VRDGPayment where VRDGPaymentid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDGPayment');
    return;
  end if;
if aSecurityStyleID is null then
 VRDGPayment_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDGPayment set securitystyleid =aStyleID where VRDGPaymentid = aRowID;
else 
 update VRDGPayment set securitystyleid =aSecurityStyleID where VRDGPaymentid = aRowID;
end if; 
end ; 


procedure VRDGPayment_propagate /*Оплаты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDGPayment where VRDGPaymentid=aRowid;
end;



procedure VRDGContractChanges_BRIEF  (
 aCURSESSION CHAR,
 aVRDGContractChangesid CHAR,
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
if aVRDGContractChangesid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDGContractChanges where VRDGContractChangesID=aVRDGContractChangesID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDGContractChanges where VRDGContractChangesid=aVRDGContractChangesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDGContractChanges');
    return;
  end if;
  aBRIEF:=func.VRDGContractChanges_BRIEF_F(aVRDGContractChangesid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDGContractChanges_DELETE /*Дополнительные соглашения*/ (
 aCURSESSION CHAR,
 aVRDGContractChangesid CHAR,
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
select count(*) into existsCnt from VRDGContractChanges where VRDGContractChangesID=aVRDGContractChangesID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDGContractChanges where VRDGContractChangesid=aVRDGContractChangesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDGContractChanges',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDGContractChanges');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGContractChanges_ISLOCKED( acursession=>acursession,aROWID=>aVRDGContractChangesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDGContractChanges');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDGContractChanges',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDGContractChangesid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDGContractChanges is select  instanceid ID from instance where OwnerPartName ='VRDGContractChanges' and OwnerRowID=aVRDGContractChangesid;
row_VRDGContractChanges  chld_VRDGContractChanges%ROWTYPE;
begin
--open chld_VRDGContractChanges;
for row_VRDGContractChanges in chld_VRDGContractChanges loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDGContractChanges.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDGContractChanges.id);
end loop;
--close chld_VRDGContractChanges;
end ;
  delete from  VRDGContractChanges 
  where  VRDGContractChangesID = aVRDGContractChangesID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Дополнительные соглашения*/
procedure VRDGContractChanges_SAVE /*Дополнительные соглашения*/ (
 aCURSESSION CHAR,
 aVRDGContractChangesid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Номер соглашения *//* Номер соглашения */
,aDateOf
 DATE/* Дата соглашения *//* Дата соглашения */
,atheFile VARCHAR2 := null /* Файл соглашения */
,atheFile_EXT varchar2 /* Файл соглашения */
,athe_Comment VARCHAR2 := null /* Примечание *//* Примечание */
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
select count(*) into existsCnt from VRDGContractChanges where VRDGContractChangesID=aVRDGContractChangesID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDGContractChanges where VRDGContractChangesid=aVRDGContractChangesID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDGContractChanges',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDGContractChanges');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGContractChanges_ISLOCKED( acursession=>acursession,aROWID=>aVRDGContractChangesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGContractChanges');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGContractChanges',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDGContractChangesid,aLogInstanceID=>aInstanceID);
 update  VRDGContractChanges set ChangeStamp=sysdate
,
  Code=aCode
,
  DateOf=aDateOf
,
  theFile=atheFile
,theFile_EXT=
atheFile_EXT 
,
  the_Comment=athe_Comment
  where  VRDGContractChangesID = aVRDGContractChangesID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDGContractChanges',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDGContractChanges');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGContractChanges');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGContractChanges',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDGContractChangesid,aLogInstanceID=>aInstanceID);
 insert into   VRDGContractChanges
 (  VRDGContractChangesID 
,InstanceID
,Code

,DateOf

,theFile

,theFile_EXT
,the_Comment

 ) values ( aVRDGContractChangesID 
,aInstanceID
,aCode

,aDateOf

,atheFile

,atheFile_EXT
,athe_Comment

 ); 
 VRDGContractChanges_SINIT( aCURSESSION,aVRDGContractChangesid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDGContractChanges_PARENT /*Дополнительные соглашения*/ (
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
  select  INSTANCEID into aParentID from VRDGContractChanges where  VRDGContractChangesid=aRowID;
 end; 


procedure VRDGContractChanges_ISLOCKED /*Дополнительные соглашения*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDGContractChanges where VRDGContractChangesid=aRowID;
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
  VRDGContractChanges_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRDG.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDGContractChanges_LOCK /*Дополнительные соглашения*/ (
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
 VRDGContractChanges_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDGContractChanges_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDGContractChanges where VRDGContractChangesid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDGContractChanges');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDGContractChanges set LockUserID =auserID ,LockSessionID =null where VRDGContractChangesid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDGContractChanges set LockUserID =null,LockSessionID =aCURSESSION  where VRDGContractChangesid=aRowID;
     return;
   end if;
 end ;


procedure VRDGContractChanges_HCL /*Дополнительные соглашения*/ (
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


procedure VRDGContractChanges_UNLOCK /*Дополнительные соглашения*/ (
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
 VRDGContractChanges_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDGContractChanges set LockUserID =null  where VRDGContractChangesid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDGContractChanges set LockSessionID =null  where VRDGContractChangesid=aRowID;
     return;
   end if;
 end; 


procedure VRDGContractChanges_SINIT /*Дополнительные соглашения*/ (
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
 select  SecurityStyleID into atmpID from VRDGContractChanges where VRDGContractChangesid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDGContractChanges');
    return;
  end if;
if aSecurityStyleID is null then
 VRDGContractChanges_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDGContractChanges set securitystyleid =aStyleID where VRDGContractChangesid = aRowID;
else 
 update VRDGContractChanges set securitystyleid =aSecurityStyleID where VRDGContractChangesid = aRowID;
end if; 
end ; 


procedure VRDGContractChanges_propagate /*Дополнительные соглашения*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDGContractChanges where VRDGContractChangesid=aRowid;
end;



procedure VRDGSeeAlso_BRIEF  (
 aCURSESSION CHAR,
 aVRDGSeeAlsoid CHAR,
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
if aVRDGSeeAlsoid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDGSeeAlso where VRDGSeeAlsoID=aVRDGSeeAlsoID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDGSeeAlso where VRDGSeeAlsoid=aVRDGSeeAlsoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDGSeeAlso');
    return;
  end if;
  aBRIEF:=func.VRDGSeeAlso_BRIEF_F(aVRDGSeeAlsoid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDGSeeAlso_DELETE /*Смотри также*/ (
 aCURSESSION CHAR,
 aVRDGSeeAlsoid CHAR,
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
select count(*) into existsCnt from VRDGSeeAlso where VRDGSeeAlsoID=aVRDGSeeAlsoID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDGSeeAlso where VRDGSeeAlsoid=aVRDGSeeAlsoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDGSeeAlso',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDGSeeAlso');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGSeeAlso_ISLOCKED( acursession=>acursession,aROWID=>aVRDGSeeAlsoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDGSeeAlso');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDGSeeAlso',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDGSeeAlsoid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDGSeeAlso is select  instanceid ID from instance where OwnerPartName ='VRDGSeeAlso' and OwnerRowID=aVRDGSeeAlsoid;
row_VRDGSeeAlso  chld_VRDGSeeAlso%ROWTYPE;
begin
--open chld_VRDGSeeAlso;
for row_VRDGSeeAlso in chld_VRDGSeeAlso loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDGSeeAlso.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDGSeeAlso.id);
end loop;
--close chld_VRDGSeeAlso;
end ;
  delete from  VRDGSeeAlso 
  where  VRDGSeeAlsoID = aVRDGSeeAlsoID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Смотри также*/
procedure VRDGSeeAlso_SAVE /*Смотри также*/ (
 aCURSESSION CHAR,
 aVRDGSeeAlsoid CHAR,
aInstanceID CHAR 
,aDocument CHAR/* Документ *//* Документ */
,athe_Comment VARCHAR2 := null /* Примечание *//* Примечание */
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
select count(*) into existsCnt from VRDGSeeAlso where VRDGSeeAlsoID=aVRDGSeeAlsoID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDGSeeAlso where VRDGSeeAlsoid=aVRDGSeeAlsoID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDGSeeAlso',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDGSeeAlso');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGSeeAlso_ISLOCKED( acursession=>acursession,aROWID=>aVRDGSeeAlsoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGSeeAlso');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGSeeAlso',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDGSeeAlsoid,aLogInstanceID=>aInstanceID);
 update  VRDGSeeAlso set ChangeStamp=sysdate
,
  Document=aDocument
,
  the_Comment=athe_Comment
  where  VRDGSeeAlsoID = aVRDGSeeAlsoID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDGSeeAlso',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDGSeeAlso');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGSeeAlso');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGSeeAlso',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDGSeeAlsoid,aLogInstanceID=>aInstanceID);
 insert into   VRDGSeeAlso
 (  VRDGSeeAlsoID 
,InstanceID
,Document

,the_Comment

 ) values ( aVRDGSeeAlsoID 
,aInstanceID
,aDocument

,athe_Comment

 ); 
 VRDGSeeAlso_SINIT( aCURSESSION,aVRDGSeeAlsoid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDGSeeAlso_PARENT /*Смотри также*/ (
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
  select  INSTANCEID into aParentID from VRDGSeeAlso where  VRDGSeeAlsoid=aRowID;
 end; 


procedure VRDGSeeAlso_ISLOCKED /*Смотри также*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDGSeeAlso where VRDGSeeAlsoid=aRowID;
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
  VRDGSeeAlso_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRDG.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDGSeeAlso_LOCK /*Смотри также*/ (
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
 VRDGSeeAlso_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDGSeeAlso_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDGSeeAlso where VRDGSeeAlsoid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDGSeeAlso');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDGSeeAlso set LockUserID =auserID ,LockSessionID =null where VRDGSeeAlsoid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDGSeeAlso set LockUserID =null,LockSessionID =aCURSESSION  where VRDGSeeAlsoid=aRowID;
     return;
   end if;
 end ;


procedure VRDGSeeAlso_HCL /*Смотри также*/ (
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


procedure VRDGSeeAlso_UNLOCK /*Смотри также*/ (
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
 VRDGSeeAlso_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDGSeeAlso set LockUserID =null  where VRDGSeeAlsoid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDGSeeAlso set LockSessionID =null  where VRDGSeeAlsoid=aRowID;
     return;
   end if;
 end; 


procedure VRDGSeeAlso_SINIT /*Смотри также*/ (
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
 select  SecurityStyleID into atmpID from VRDGSeeAlso where VRDGSeeAlsoid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDGSeeAlso');
    return;
  end if;
if aSecurityStyleID is null then
 VRDGSeeAlso_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDGSeeAlso set securitystyleid =aStyleID where VRDGSeeAlsoid = aRowID;
else 
 update VRDGSeeAlso set securitystyleid =aSecurityStyleID where VRDGSeeAlsoid = aRowID;
end if; 
end ; 


procedure VRDGSeeAlso_propagate /*Смотри также*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDGSeeAlso where VRDGSeeAlsoid=aRowid;
end;



procedure VRDGContractVersion_BRIEF  (
 aCURSESSION CHAR,
 aVRDGContractVersionid CHAR,
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
if aVRDGContractVersionid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDGContractVersion where VRDGContractVersionID=aVRDGContractVersionID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDGContractVersion where VRDGContractVersionid=aVRDGContractVersionID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDGContractVersion');
    return;
  end if;
  aBRIEF:=func.VRDGContractVersion_BRIEF_F(aVRDGContractVersionid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDGContractVersion_DELETE /*Версия договора*/ (
 aCURSESSION CHAR,
 aVRDGContractVersionid CHAR,
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
select count(*) into existsCnt from VRDGContractVersion where VRDGContractVersionID=aVRDGContractVersionID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDGContractVersion where VRDGContractVersionid=aVRDGContractVersionID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDGContractVersion',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDGContractVersion');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGContractVersion_ISLOCKED( acursession=>acursession,aROWID=>aVRDGContractVersionid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDGContractVersion');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDGContractVersion',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDGContractVersionid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDGContractVersion is select  instanceid ID from instance where OwnerPartName ='VRDGContractVersion' and OwnerRowID=aVRDGContractVersionid;
row_VRDGContractVersion  chld_VRDGContractVersion%ROWTYPE;
begin
--open chld_VRDGContractVersion;
for row_VRDGContractVersion in chld_VRDGContractVersion loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDGContractVersion.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDGContractVersion.id);
end loop;
--close chld_VRDGContractVersion;
end ;
  delete from  VRDGContractVersion 
  where  VRDGContractVersionID = aVRDGContractVersionID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Версия договора*/
procedure VRDGContractVersion_SAVE /*Версия договора*/ (
 aCURSESSION CHAR,
 aVRDGContractVersionid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* Дата версии *//* Дата версии */
,atheFile VARCHAR2/* Файл */
,atheFile_EXT varchar2 /* Файл */
,aActual
 NUMBER/* Актуальная версия *//* Актуальная версия */
,athe_Comment VARCHAR2/* Примечание *//* Примечание */
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
select count(*) into existsCnt from VRDGContractVersion where VRDGContractVersionID=aVRDGContractVersionID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDGContractVersion where VRDGContractVersionid=aVRDGContractVersionID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDGContractVersion',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDGContractVersion');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGContractVersion_ISLOCKED( acursession=>acursession,aROWID=>aVRDGContractVersionid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGContractVersion');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGContractVersion',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDGContractVersionid,aLogInstanceID=>aInstanceID);
 update  VRDGContractVersion set ChangeStamp=sysdate
,
  DateOf=aDateOf
,
  theFile=atheFile
,theFile_EXT=
atheFile_EXT 
,
  Actual=aActual
,
  the_Comment=athe_Comment
  where  VRDGContractVersionID = aVRDGContractVersionID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDGContractVersion',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDGContractVersion');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGContractVersion');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGContractVersion',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDGContractVersionid,aLogInstanceID=>aInstanceID);
 insert into   VRDGContractVersion
 (  VRDGContractVersionID 
,InstanceID
,DateOf

,theFile

,theFile_EXT
,Actual

,the_Comment

 ) values ( aVRDGContractVersionID 
,aInstanceID
,aDateOf

,atheFile

,atheFile_EXT
,aActual

,athe_Comment

 ); 
 VRDGContractVersion_SINIT( aCURSESSION,aVRDGContractVersionid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDGContractVersion_PARENT /*Версия договора*/ (
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
  select  INSTANCEID into aParentID from VRDGContractVersion where  VRDGContractVersionid=aRowID;
 end; 


procedure VRDGContractVersion_ISLOCKED /*Версия договора*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDGContractVersion where VRDGContractVersionid=aRowID;
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
  VRDGContractVersion_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRDG.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDGContractVersion_LOCK /*Версия договора*/ (
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
 VRDGContractVersion_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDGContractVersion_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDGContractVersion where VRDGContractVersionid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDGContractVersion');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDGContractVersion set LockUserID =auserID ,LockSessionID =null where VRDGContractVersionid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDGContractVersion set LockUserID =null,LockSessionID =aCURSESSION  where VRDGContractVersionid=aRowID;
     return;
   end if;
 end ;


procedure VRDGContractVersion_HCL /*Версия договора*/ (
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


procedure VRDGContractVersion_UNLOCK /*Версия договора*/ (
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
 VRDGContractVersion_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDGContractVersion set LockUserID =null  where VRDGContractVersionid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDGContractVersion set LockSessionID =null  where VRDGContractVersionid=aRowID;
     return;
   end if;
 end; 


procedure VRDGContractVersion_SINIT /*Версия договора*/ (
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
 select  SecurityStyleID into atmpID from VRDGContractVersion where VRDGContractVersionid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDGContractVersion');
    return;
  end if;
if aSecurityStyleID is null then
 VRDGContractVersion_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDGContractVersion set securitystyleid =aStyleID where VRDGContractVersionid = aRowID;
else 
 update VRDGContractVersion set securitystyleid =aSecurityStyleID where VRDGContractVersionid = aRowID;
end if; 
end ; 


procedure VRDGContractVersion_propagate /*Версия договора*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDGContractVersion where VRDGContractVersionid=aRowid;
end;



procedure VRDGContractSpesial_BRIEF  (
 aCURSESSION CHAR,
 aVRDGContractSpesialid CHAR,
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
if aVRDGContractSpesialid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDGContractSpesial where VRDGContractSpesialID=aVRDGContractSpesialID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDGContractSpesial where VRDGContractSpesialid=aVRDGContractSpesialID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDGContractSpesial');
    return;
  end if;
  aBRIEF:=func.VRDGContractSpesial_BRIEF_F(aVRDGContractSpesialid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDGContractSpesial_DELETE /*Специальные условие*/ (
 aCURSESSION CHAR,
 aVRDGContractSpesialid CHAR,
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
select count(*) into existsCnt from VRDGContractSpesial where VRDGContractSpesialID=aVRDGContractSpesialID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDGContractSpesial where VRDGContractSpesialid=aVRDGContractSpesialID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDGContractSpesial',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDGContractSpesial');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGContractSpesial_ISLOCKED( acursession=>acursession,aROWID=>aVRDGContractSpesialid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDGContractSpesial');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDGContractSpesial',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDGContractSpesialid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDGContractSpesial is select  instanceid ID from instance where OwnerPartName ='VRDGContractSpesial' and OwnerRowID=aVRDGContractSpesialid;
row_VRDGContractSpesial  chld_VRDGContractSpesial%ROWTYPE;
begin
--open chld_VRDGContractSpesial;
for row_VRDGContractSpesial in chld_VRDGContractSpesial loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDGContractSpesial.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDGContractSpesial.id);
end loop;
--close chld_VRDGContractSpesial;
end ;
  delete from  VRDGContractSpesial 
  where  VRDGContractSpesialID = aVRDGContractSpesialID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Специальные условие*/
procedure VRDGContractSpesial_SAVE /*Специальные условие*/ (
 aCURSESSION CHAR,
 aVRDGContractSpesialid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* Дата *//* Дата */
,aIsDone
 NUMBER/* Исполнено *//* Исполнено */
,athe_Comment VARCHAR2/* Суть условия *//* Суть условия */
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
select count(*) into existsCnt from VRDGContractSpesial where VRDGContractSpesialID=aVRDGContractSpesialID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDGContractSpesial where VRDGContractSpesialid=aVRDGContractSpesialID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDGContractSpesial',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDGContractSpesial');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDGContractSpesial_ISLOCKED( acursession=>acursession,aROWID=>aVRDGContractSpesialid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGContractSpesial');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGContractSpesial',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDGContractSpesialid,aLogInstanceID=>aInstanceID);
 update  VRDGContractSpesial set ChangeStamp=sysdate
,
  DateOf=aDateOf
,
  IsDone=aIsDone
,
  the_Comment=athe_Comment
  where  VRDGContractSpesialID = aVRDGContractSpesialID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDGContractSpesial',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDGContractSpesial');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDGContractSpesial');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDGContractSpesial',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDGContractSpesialid,aLogInstanceID=>aInstanceID);
 insert into   VRDGContractSpesial
 (  VRDGContractSpesialID 
,InstanceID
,DateOf

,IsDone

,the_Comment

 ) values ( aVRDGContractSpesialID 
,aInstanceID
,aDateOf

,aIsDone

,athe_Comment

 ); 
 VRDGContractSpesial_SINIT( aCURSESSION,aVRDGContractSpesialid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDGContractSpesial_PARENT /*Специальные условие*/ (
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
  select  INSTANCEID into aParentID from VRDGContractSpesial where  VRDGContractSpesialid=aRowID;
 end; 


procedure VRDGContractSpesial_ISLOCKED /*Специальные условие*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDGContractSpesial where VRDGContractSpesialid=aRowID;
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
  VRDGContractSpesial_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRDG.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDGContractSpesial_LOCK /*Специальные условие*/ (
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
 VRDGContractSpesial_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDGContractSpesial_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDGContractSpesial where VRDGContractSpesialid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDGContractSpesial');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDGContractSpesial set LockUserID =auserID ,LockSessionID =null where VRDGContractSpesialid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDGContractSpesial set LockUserID =null,LockSessionID =aCURSESSION  where VRDGContractSpesialid=aRowID;
     return;
   end if;
 end ;


procedure VRDGContractSpesial_HCL /*Специальные условие*/ (
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


procedure VRDGContractSpesial_UNLOCK /*Специальные условие*/ (
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
 VRDGContractSpesial_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDGContractSpesial set LockUserID =null  where VRDGContractSpesialid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDGContractSpesial set LockSessionID =null  where VRDGContractSpesialid=aRowID;
     return;
   end if;
 end; 


procedure VRDGContractSpesial_SINIT /*Специальные условие*/ (
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
 select  SecurityStyleID into atmpID from VRDGContractSpesial where VRDGContractSpesialid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDGContractSpesial');
    return;
  end if;
if aSecurityStyleID is null then
 VRDGContractSpesial_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDGContractSpesial set securitystyleid =aStyleID where VRDGContractSpesialid = aRowID;
else 
 update VRDGContractSpesial set securitystyleid =aSecurityStyleID where VRDGContractSpesialid = aRowID;
end if; 
end ; 


procedure VRDGContractSpesial_propagate /*Специальные условие*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDGContractSpesial where VRDGContractSpesialid=aRowid;
end;


end VRDG;

/



