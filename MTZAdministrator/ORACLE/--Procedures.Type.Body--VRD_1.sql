
/* --VRD*/

 create or replace package body VRD as

procedure VRD_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='VRD'
then
declare cursor child_VRDContractStage is select VRDContractStage.VRDContractStageid ID from VRDContractStage where  VRDContractStage.InstanceID = ainstanceid;
row_VRDContractStage  child_VRDContractStage%ROWTYPE;
begin
--open child_VRDContractStage;
for row_VRDContractStage in child_VRDContractStage loop
 VRDContractStage_DELETE (acursession,row_VRDContractStage.id,aInstanceID);
end loop;
--close child_VRDContractStage;
end;
declare cursor child_VRDRreportType is select VRDRreportType.VRDRreportTypeid ID from VRDRreportType where  VRDRreportType.InstanceID = ainstanceid;
row_VRDRreportType  child_VRDRreportType%ROWTYPE;
begin
--open child_VRDRreportType;
for row_VRDRreportType in child_VRDRreportType loop
 VRDRreportType_DELETE (acursession,row_VRDRreportType.id,aInstanceID);
end loop;
--close child_VRDRreportType;
end;
declare cursor child_VRDPrjType is select VRDPrjType.VRDPrjTypeid ID from VRDPrjType where  VRDPrjType.InstanceID = ainstanceid;
row_VRDPrjType  child_VRDPrjType%ROWTYPE;
begin
--open child_VRDPrjType;
for row_VRDPrjType in child_VRDPrjType loop
 VRDPrjType_DELETE (acursession,row_VRDPrjType.id,aInstanceID);
end loop;
--close child_VRDPrjType;
end;
declare cursor child_VRDStream is select VRDStream.VRDStreamid ID from VRDStream where  VRDStream.InstanceID = ainstanceid;
row_VRDStream  child_VRDStream%ROWTYPE;
begin
--open child_VRDStream;
for row_VRDStream in child_VRDStream loop
 VRDStream_DELETE (acursession,row_VRDStream.id,aInstanceID);
end loop;
--close child_VRDStream;
end;
declare cursor child_VRDInterest is select VRDInterest.VRDInterestid ID from VRDInterest where  VRDInterest.InstanceID = ainstanceid;
row_VRDInterest  child_VRDInterest%ROWTYPE;
begin
--open child_VRDInterest;
for row_VRDInterest in child_VRDInterest loop
 VRDInterest_DELETE (acursession,row_VRDInterest.id,aInstanceID);
end loop;
--close child_VRDInterest;
end;
declare cursor child_VRDDocType is select VRDDocType.VRDDocTypeid ID from VRDDocType where  VRDDocType.InstanceID = ainstanceid;
row_VRDDocType  child_VRDDocType%ROWTYPE;
begin
--open child_VRDDocType;
for row_VRDDocType in child_VRDDocType loop
 VRDDocType_DELETE (acursession,row_VRDDocType.id,aInstanceID);
end loop;
--close child_VRDDocType;
end;
declare cursor child_VRDLoyalty is select VRDLoyalty.VRDLoyaltyid ID from VRDLoyalty where  VRDLoyalty.InstanceID = ainstanceid;
row_VRDLoyalty  child_VRDLoyalty%ROWTYPE;
begin
--open child_VRDLoyalty;
for row_VRDLoyalty in child_VRDLoyalty loop
 VRDLoyalty_DELETE (acursession,row_VRDLoyalty.id,aInstanceID);
end loop;
--close child_VRDLoyalty;
end;
declare cursor child_VRDMarket is select VRDMarket.VRDMarketid ID from VRDMarket where  VRDMarket.InstanceID = ainstanceid;
row_VRDMarket  child_VRDMarket%ROWTYPE;
begin
--open child_VRDMarket;
for row_VRDMarket in child_VRDMarket loop
 VRDMarket_DELETE (acursession,row_VRDMarket.id,aInstanceID);
end loop;
--close child_VRDMarket;
end;
return;
<<del_error>>
return;
end if;
end;
procedure VRD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'VRD'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_VRDContractStage is select VRDContractStage.VRDContractStageid ID from VRDContractStage where  VRDContractStage.InstanceID = arowid;
ROW_VRDContractStage  lch_VRDContractStage%ROWTYPE;
begin
--open lch_VRDContractStage;
for row_VRDContractStage in lch_VRDContractStage loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDContractStage where VRDContractStageid=row_VRDContractStage.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDContractStage;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDContractStage;
     return;
   end if; 
 end if; 
 VRDContractStage_HCL (acursession,ROW_VRDContractStage.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDContractStage;
   return;
 end if;
 end loop;
--close lch_VRDContractStage;
end;
declare cursor lch_VRDRreportType is select VRDRreportType.VRDRreportTypeid ID from VRDRreportType where  VRDRreportType.InstanceID = arowid;
ROW_VRDRreportType  lch_VRDRreportType%ROWTYPE;
begin
--open lch_VRDRreportType;
for row_VRDRreportType in lch_VRDRreportType loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDRreportType where VRDRreportTypeid=row_VRDRreportType.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDRreportType;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDRreportType;
     return;
   end if; 
 end if; 
 VRDRreportType_HCL (acursession,ROW_VRDRreportType.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDRreportType;
   return;
 end if;
 end loop;
--close lch_VRDRreportType;
end;
declare cursor lch_VRDPrjType is select VRDPrjType.VRDPrjTypeid ID from VRDPrjType where  VRDPrjType.InstanceID = arowid;
ROW_VRDPrjType  lch_VRDPrjType%ROWTYPE;
begin
--open lch_VRDPrjType;
for row_VRDPrjType in lch_VRDPrjType loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDPrjType where VRDPrjTypeid=row_VRDPrjType.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDPrjType;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDPrjType;
     return;
   end if; 
 end if; 
 VRDPrjType_HCL (acursession,ROW_VRDPrjType.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDPrjType;
   return;
 end if;
 end loop;
--close lch_VRDPrjType;
end;
declare cursor lch_VRDStream is select VRDStream.VRDStreamid ID from VRDStream where  VRDStream.InstanceID = arowid;
ROW_VRDStream  lch_VRDStream%ROWTYPE;
begin
--open lch_VRDStream;
for row_VRDStream in lch_VRDStream loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDStream where VRDStreamid=row_VRDStream.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDStream;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDStream;
     return;
   end if; 
 end if; 
 VRDStream_HCL (acursession,ROW_VRDStream.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDStream;
   return;
 end if;
 end loop;
--close lch_VRDStream;
end;
declare cursor lch_VRDInterest is select VRDInterest.VRDInterestid ID from VRDInterest where  VRDInterest.InstanceID = arowid;
ROW_VRDInterest  lch_VRDInterest%ROWTYPE;
begin
--open lch_VRDInterest;
for row_VRDInterest in lch_VRDInterest loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDInterest where VRDInterestid=row_VRDInterest.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDInterest;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDInterest;
     return;
   end if; 
 end if; 
 VRDInterest_HCL (acursession,ROW_VRDInterest.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDInterest;
   return;
 end if;
 end loop;
--close lch_VRDInterest;
end;
declare cursor lch_VRDDocType is select VRDDocType.VRDDocTypeid ID from VRDDocType where  VRDDocType.InstanceID = arowid;
ROW_VRDDocType  lch_VRDDocType%ROWTYPE;
begin
--open lch_VRDDocType;
for row_VRDDocType in lch_VRDDocType loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDDocType where VRDDocTypeid=row_VRDDocType.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDDocType;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDDocType;
     return;
   end if; 
 end if; 
 VRDDocType_HCL (acursession,ROW_VRDDocType.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDDocType;
   return;
 end if;
 end loop;
--close lch_VRDDocType;
end;
declare cursor lch_VRDLoyalty is select VRDLoyalty.VRDLoyaltyid ID from VRDLoyalty where  VRDLoyalty.InstanceID = arowid;
ROW_VRDLoyalty  lch_VRDLoyalty%ROWTYPE;
begin
--open lch_VRDLoyalty;
for row_VRDLoyalty in lch_VRDLoyalty loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDLoyalty where VRDLoyaltyid=row_VRDLoyalty.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDLoyalty;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDLoyalty;
     return;
   end if; 
 end if; 
 VRDLoyalty_HCL (acursession,ROW_VRDLoyalty.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDLoyalty;
   return;
 end if;
 end loop;
--close lch_VRDLoyalty;
end;
declare cursor lch_VRDMarket is select VRDMarket.VRDMarketid ID from VRDMarket where  VRDMarket.InstanceID = arowid;
ROW_VRDMarket  lch_VRDMarket%ROWTYPE;
begin
--open lch_VRDMarket;
for row_VRDMarket in lch_VRDMarket loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRDMarket where VRDMarketid=row_VRDMarket.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRDMarket;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRDMarket;
     return;
   end if; 
 end if; 
 VRDMarket_HCL (acursession,ROW_VRDMarket.id,aisLocked);
 if aisLocked >2 then
   close lch_VRDMarket;
   return;
 end if;
 end loop;
--close lch_VRDMarket;
end;
 end if;
aIsLocked:=0;
end;
procedure VRD_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'VRD'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_VRDContractStage is select VRDContractStage.VRDContractStageid id from VRDContractStage where  VRDContractStage.InstanceID = arowid;
row_VRDContractStage  pch_VRDContractStage%ROWTYPE;
begin
--open pch_VRDContractStage;
for row_VRDContractStage in  pch_VRDContractStage loop
 VRDContractStage_SINIT( acursession,row_VRDContractStage.id,assid);
 VRDContractStage_propagate( acursession,row_VRDContractStage.id);
end loop;
--close pch_VRDContractStage;
end;
declare cursor pch_VRDRreportType is select VRDRreportType.VRDRreportTypeid id from VRDRreportType where  VRDRreportType.InstanceID = arowid;
row_VRDRreportType  pch_VRDRreportType%ROWTYPE;
begin
--open pch_VRDRreportType;
for row_VRDRreportType in  pch_VRDRreportType loop
 VRDRreportType_SINIT( acursession,row_VRDRreportType.id,assid);
 VRDRreportType_propagate( acursession,row_VRDRreportType.id);
end loop;
--close pch_VRDRreportType;
end;
declare cursor pch_VRDPrjType is select VRDPrjType.VRDPrjTypeid id from VRDPrjType where  VRDPrjType.InstanceID = arowid;
row_VRDPrjType  pch_VRDPrjType%ROWTYPE;
begin
--open pch_VRDPrjType;
for row_VRDPrjType in  pch_VRDPrjType loop
 VRDPrjType_SINIT( acursession,row_VRDPrjType.id,assid);
 VRDPrjType_propagate( acursession,row_VRDPrjType.id);
end loop;
--close pch_VRDPrjType;
end;
declare cursor pch_VRDStream is select VRDStream.VRDStreamid id from VRDStream where  VRDStream.InstanceID = arowid;
row_VRDStream  pch_VRDStream%ROWTYPE;
begin
--open pch_VRDStream;
for row_VRDStream in  pch_VRDStream loop
 VRDStream_SINIT( acursession,row_VRDStream.id,assid);
 VRDStream_propagate( acursession,row_VRDStream.id);
end loop;
--close pch_VRDStream;
end;
declare cursor pch_VRDInterest is select VRDInterest.VRDInterestid id from VRDInterest where  VRDInterest.InstanceID = arowid;
row_VRDInterest  pch_VRDInterest%ROWTYPE;
begin
--open pch_VRDInterest;
for row_VRDInterest in  pch_VRDInterest loop
 VRDInterest_SINIT( acursession,row_VRDInterest.id,assid);
 VRDInterest_propagate( acursession,row_VRDInterest.id);
end loop;
--close pch_VRDInterest;
end;
declare cursor pch_VRDDocType is select VRDDocType.VRDDocTypeid id from VRDDocType where  VRDDocType.InstanceID = arowid;
row_VRDDocType  pch_VRDDocType%ROWTYPE;
begin
--open pch_VRDDocType;
for row_VRDDocType in  pch_VRDDocType loop
 VRDDocType_SINIT( acursession,row_VRDDocType.id,assid);
 VRDDocType_propagate( acursession,row_VRDDocType.id);
end loop;
--close pch_VRDDocType;
end;
declare cursor pch_VRDLoyalty is select VRDLoyalty.VRDLoyaltyid id from VRDLoyalty where  VRDLoyalty.InstanceID = arowid;
row_VRDLoyalty  pch_VRDLoyalty%ROWTYPE;
begin
--open pch_VRDLoyalty;
for row_VRDLoyalty in  pch_VRDLoyalty loop
 VRDLoyalty_SINIT( acursession,row_VRDLoyalty.id,assid);
 VRDLoyalty_propagate( acursession,row_VRDLoyalty.id);
end loop;
--close pch_VRDLoyalty;
end;
declare cursor pch_VRDMarket is select VRDMarket.VRDMarketid id from VRDMarket where  VRDMarket.InstanceID = arowid;
row_VRDMarket  pch_VRDMarket%ROWTYPE;
begin
--open pch_VRDMarket;
for row_VRDMarket in  pch_VRDMarket loop
 VRDMarket_SINIT( acursession,row_VRDMarket.id,assid);
 VRDMarket_propagate( acursession,row_VRDMarket.id);
end loop;
--close pch_VRDMarket;
end;
 end if; 
end;



procedure VRDContractStage_BRIEF  (
 aCURSESSION CHAR,
 aVRDContractStageid CHAR,
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
if aVRDContractStageid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDContractStage where VRDContractStageID=aVRDContractStageID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDContractStage where VRDContractStageid=aVRDContractStageID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDContractStage');
    return;
  end if;
  aBRIEF:=func.VRDContractStage_BRIEF_F(aVRDContractStageid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDContractStage_DELETE /*Стадия договора*/ (
 aCURSESSION CHAR,
 aVRDContractStageid CHAR,
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
select count(*) into existsCnt from VRDContractStage where VRDContractStageID=aVRDContractStageID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDContractStage where VRDContractStageid=aVRDContractStageID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDContractStage',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDContractStage');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDContractStage_ISLOCKED( acursession=>acursession,aROWID=>aVRDContractStageid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDContractStage');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDContractStage',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDContractStageid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDContractStage is select  instanceid ID from instance where OwnerPartName ='VRDContractStage' and OwnerRowID=aVRDContractStageid;
row_VRDContractStage  chld_VRDContractStage%ROWTYPE;
begin
--open chld_VRDContractStage;
for row_VRDContractStage in chld_VRDContractStage loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDContractStage.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDContractStage.id);
end loop;
--close chld_VRDContractStage;
end ;
  delete from  VRDContractStage 
  where  VRDContractStageID = aVRDContractStageID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Стадия договора*/
procedure VRDContractStage_SAVE /*Стадия договора*/ (
 aCURSESSION CHAR,
 aVRDContractStageid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
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
select count(*) into existsCnt from VRDContractStage where VRDContractStageID=aVRDContractStageID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDContractStage where VRDContractStageid=aVRDContractStageID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDContractStage',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDContractStage');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDContractStage_ISLOCKED( acursession=>acursession,aROWID=>aVRDContractStageid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDContractStage');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDContractStage',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDContractStageid,aLogInstanceID=>aInstanceID);
 update  VRDContractStage set ChangeStamp=sysdate
,
  Name=aName
  where  VRDContractStageID = aVRDContractStageID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDContractStage',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDContractStage');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDContractStage');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDContractStage',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDContractStageid,aLogInstanceID=>aInstanceID);
 insert into   VRDContractStage
 (  VRDContractStageID 
,InstanceID
,Name

 ) values ( aVRDContractStageID 
,aInstanceID
,aName

 ); 
 VRDContractStage_SINIT( aCURSESSION,aVRDContractStageid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDContractStage_PARENT /*Стадия договора*/ (
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
  select  INSTANCEID into aParentID from VRDContractStage where  VRDContractStageid=aRowID;
 end; 


procedure VRDContractStage_ISLOCKED /*Стадия договора*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDContractStage where VRDContractStageid=aRowID;
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
  VRDContractStage_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDContractStage_LOCK /*Стадия договора*/ (
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
 VRDContractStage_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDContractStage_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDContractStage where VRDContractStageid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDContractStage');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDContractStage set LockUserID =auserID ,LockSessionID =null where VRDContractStageid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDContractStage set LockUserID =null,LockSessionID =aCURSESSION  where VRDContractStageid=aRowID;
     return;
   end if;
 end ;


procedure VRDContractStage_HCL /*Стадия договора*/ (
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


procedure VRDContractStage_UNLOCK /*Стадия договора*/ (
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
 VRDContractStage_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDContractStage set LockUserID =null  where VRDContractStageid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDContractStage set LockSessionID =null  where VRDContractStageid=aRowID;
     return;
   end if;
 end; 


procedure VRDContractStage_SINIT /*Стадия договора*/ (
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
 select  SecurityStyleID into atmpID from VRDContractStage where VRDContractStageid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDContractStage');
    return;
  end if;
if aSecurityStyleID is null then
 VRDContractStage_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDContractStage set securitystyleid =aStyleID where VRDContractStageid = aRowID;
else 
 update VRDContractStage set securitystyleid =aSecurityStyleID where VRDContractStageid = aRowID;
end if; 
end ; 


procedure VRDContractStage_propagate /*Стадия договора*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDContractStage where VRDContractStageid=aRowid;
end;



procedure VRDRreportType_BRIEF  (
 aCURSESSION CHAR,
 aVRDRreportTypeid CHAR,
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
if aVRDRreportTypeid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDRreportType where VRDRreportTypeID=aVRDRreportTypeID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDRreportType where VRDRreportTypeid=aVRDRreportTypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDRreportType');
    return;
  end if;
  aBRIEF:=func.VRDRreportType_BRIEF_F(aVRDRreportTypeid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDRreportType_DELETE /*Тип отчета*/ (
 aCURSESSION CHAR,
 aVRDRreportTypeid CHAR,
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
select count(*) into existsCnt from VRDRreportType where VRDRreportTypeID=aVRDRreportTypeID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDRreportType where VRDRreportTypeid=aVRDRreportTypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDRreportType',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDRreportType');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDRreportType_ISLOCKED( acursession=>acursession,aROWID=>aVRDRreportTypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDRreportType');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDRreportType',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDRreportTypeid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDRreportType is select  instanceid ID from instance where OwnerPartName ='VRDRreportType' and OwnerRowID=aVRDRreportTypeid;
row_VRDRreportType  chld_VRDRreportType%ROWTYPE;
begin
--open chld_VRDRreportType;
for row_VRDRreportType in chld_VRDRreportType loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDRreportType.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDRreportType.id);
end loop;
--close chld_VRDRreportType;
end ;
  delete from  VRDRreportType 
  where  VRDRreportTypeID = aVRDRreportTypeID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип отчета*/
procedure VRDRreportType_SAVE /*Тип отчета*/ (
 aCURSESSION CHAR,
 aVRDRreportTypeid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
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
select count(*) into existsCnt from VRDRreportType where VRDRreportTypeID=aVRDRreportTypeID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDRreportType where VRDRreportTypeid=aVRDRreportTypeID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDRreportType',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDRreportType');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDRreportType_ISLOCKED( acursession=>acursession,aROWID=>aVRDRreportTypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDRreportType');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDRreportType',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDRreportTypeid,aLogInstanceID=>aInstanceID);
 update  VRDRreportType set ChangeStamp=sysdate
,
  Name=aName
  where  VRDRreportTypeID = aVRDRreportTypeID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDRreportType',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDRreportType');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDRreportType');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDRreportType',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDRreportTypeid,aLogInstanceID=>aInstanceID);
 insert into   VRDRreportType
 (  VRDRreportTypeID 
,InstanceID
,Name

 ) values ( aVRDRreportTypeID 
,aInstanceID
,aName

 ); 
 VRDRreportType_SINIT( aCURSESSION,aVRDRreportTypeid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDRreportType_PARENT /*Тип отчета*/ (
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
  select  INSTANCEID into aParentID from VRDRreportType where  VRDRreportTypeid=aRowID;
 end; 


procedure VRDRreportType_ISLOCKED /*Тип отчета*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDRreportType where VRDRreportTypeid=aRowID;
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
  VRDRreportType_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDRreportType_LOCK /*Тип отчета*/ (
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
 VRDRreportType_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDRreportType_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDRreportType where VRDRreportTypeid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDRreportType');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDRreportType set LockUserID =auserID ,LockSessionID =null where VRDRreportTypeid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDRreportType set LockUserID =null,LockSessionID =aCURSESSION  where VRDRreportTypeid=aRowID;
     return;
   end if;
 end ;


procedure VRDRreportType_HCL /*Тип отчета*/ (
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


procedure VRDRreportType_UNLOCK /*Тип отчета*/ (
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
 VRDRreportType_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDRreportType set LockUserID =null  where VRDRreportTypeid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDRreportType set LockSessionID =null  where VRDRreportTypeid=aRowID;
     return;
   end if;
 end; 


procedure VRDRreportType_SINIT /*Тип отчета*/ (
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
 select  SecurityStyleID into atmpID from VRDRreportType where VRDRreportTypeid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDRreportType');
    return;
  end if;
if aSecurityStyleID is null then
 VRDRreportType_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDRreportType set securitystyleid =aStyleID where VRDRreportTypeid = aRowID;
else 
 update VRDRreportType set securitystyleid =aSecurityStyleID where VRDRreportTypeid = aRowID;
end if; 
end ; 


procedure VRDRreportType_propagate /*Тип отчета*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDRreportType where VRDRreportTypeid=aRowid;
end;



procedure VRDPrjType_BRIEF  (
 aCURSESSION CHAR,
 aVRDPrjTypeid CHAR,
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
if aVRDPrjTypeid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDPrjType where VRDPrjTypeID=aVRDPrjTypeID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDPrjType where VRDPrjTypeid=aVRDPrjTypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDPrjType');
    return;
  end if;
  aBRIEF:=func.VRDPrjType_BRIEF_F(aVRDPrjTypeid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDPrjType_DELETE /*Типы проектов*/ (
 aCURSESSION CHAR,
 aVRDPrjTypeid CHAR,
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
select count(*) into existsCnt from VRDPrjType where VRDPrjTypeID=aVRDPrjTypeID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDPrjType where VRDPrjTypeid=aVRDPrjTypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDPrjType',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDPrjType');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDPrjType_ISLOCKED( acursession=>acursession,aROWID=>aVRDPrjTypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDPrjType');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDPrjType',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDPrjTypeid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDPrjType is select  instanceid ID from instance where OwnerPartName ='VRDPrjType' and OwnerRowID=aVRDPrjTypeid;
row_VRDPrjType  chld_VRDPrjType%ROWTYPE;
begin
--open chld_VRDPrjType;
for row_VRDPrjType in chld_VRDPrjType loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDPrjType.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDPrjType.id);
end loop;
--close chld_VRDPrjType;
end ;
  delete from  VRDPrjType 
  where  VRDPrjTypeID = aVRDPrjTypeID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Типы проектов*/
procedure VRDPrjType_SAVE /*Типы проектов*/ (
 aCURSESSION CHAR,
 aVRDPrjTypeid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
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
select count(*) into existsCnt from VRDPrjType where VRDPrjTypeID=aVRDPrjTypeID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDPrjType where VRDPrjTypeid=aVRDPrjTypeID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDPrjType',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDPrjType');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDPrjType_ISLOCKED( acursession=>acursession,aROWID=>aVRDPrjTypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDPrjType');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDPrjType',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDPrjTypeid,aLogInstanceID=>aInstanceID);
 update  VRDPrjType set ChangeStamp=sysdate
,
  Name=aName
  where  VRDPrjTypeID = aVRDPrjTypeID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDPrjType',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDPrjType');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDPrjType');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDPrjType',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDPrjTypeid,aLogInstanceID=>aInstanceID);
 insert into   VRDPrjType
 (  VRDPrjTypeID 
,InstanceID
,Name

 ) values ( aVRDPrjTypeID 
,aInstanceID
,aName

 ); 
 VRDPrjType_SINIT( aCURSESSION,aVRDPrjTypeid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDPrjType_PARENT /*Типы проектов*/ (
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
  select  INSTANCEID into aParentID from VRDPrjType where  VRDPrjTypeid=aRowID;
 end; 


procedure VRDPrjType_ISLOCKED /*Типы проектов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDPrjType where VRDPrjTypeid=aRowID;
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
  VRDPrjType_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDPrjType_LOCK /*Типы проектов*/ (
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
 VRDPrjType_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDPrjType_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDPrjType where VRDPrjTypeid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDPrjType');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDPrjType set LockUserID =auserID ,LockSessionID =null where VRDPrjTypeid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDPrjType set LockUserID =null,LockSessionID =aCURSESSION  where VRDPrjTypeid=aRowID;
     return;
   end if;
 end ;


procedure VRDPrjType_HCL /*Типы проектов*/ (
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


procedure VRDPrjType_UNLOCK /*Типы проектов*/ (
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
 VRDPrjType_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDPrjType set LockUserID =null  where VRDPrjTypeid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDPrjType set LockSessionID =null  where VRDPrjTypeid=aRowID;
     return;
   end if;
 end; 


procedure VRDPrjType_SINIT /*Типы проектов*/ (
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
 select  SecurityStyleID into atmpID from VRDPrjType where VRDPrjTypeid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDPrjType');
    return;
  end if;
if aSecurityStyleID is null then
 VRDPrjType_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDPrjType set securitystyleid =aStyleID where VRDPrjTypeid = aRowID;
else 
 update VRDPrjType set securitystyleid =aSecurityStyleID where VRDPrjTypeid = aRowID;
end if; 
end ; 


procedure VRDPrjType_propagate /*Типы проектов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDPrjType where VRDPrjTypeid=aRowid;
end;



procedure VRDStream_BRIEF  (
 aCURSESSION CHAR,
 aVRDStreamid CHAR,
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
if aVRDStreamid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDStream where VRDStreamID=aVRDStreamID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDStream where VRDStreamid=aVRDStreamID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDStream');
    return;
  end if;
  aBRIEF:=func.VRDStream_BRIEF_F(aVRDStreamid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDStream_DELETE /*Направление деятельности*/ (
 aCURSESSION CHAR,
 aVRDStreamid CHAR,
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
select count(*) into existsCnt from VRDStream where VRDStreamID=aVRDStreamID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDStream where VRDStreamid=aVRDStreamID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDStream',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDStream');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDStream_ISLOCKED( acursession=>acursession,aROWID=>aVRDStreamid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDStream');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDStream',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDStreamid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDStream is select  instanceid ID from instance where OwnerPartName ='VRDStream' and OwnerRowID=aVRDStreamid;
row_VRDStream  chld_VRDStream%ROWTYPE;
begin
--open chld_VRDStream;
for row_VRDStream in chld_VRDStream loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDStream.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDStream.id);
end loop;
--close chld_VRDStream;
end ;
  delete from  VRDStream 
  where  VRDStreamID = aVRDStreamID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Направление деятельности*/
procedure VRDStream_SAVE /*Направление деятельности*/ (
 aCURSESSION CHAR,
 aVRDStreamid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Назввание *//* Назввание */
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
select count(*) into existsCnt from VRDStream where VRDStreamID=aVRDStreamID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDStream where VRDStreamid=aVRDStreamID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDStream',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDStream');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDStream_ISLOCKED( acursession=>acursession,aROWID=>aVRDStreamid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDStream');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDStream',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDStreamid,aLogInstanceID=>aInstanceID);
 update  VRDStream set ChangeStamp=sysdate
,
  Name=aName
  where  VRDStreamID = aVRDStreamID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDStream',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDStream');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDStream');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDStream',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDStreamid,aLogInstanceID=>aInstanceID);
 insert into   VRDStream
 (  VRDStreamID 
,InstanceID
,Name

 ) values ( aVRDStreamID 
,aInstanceID
,aName

 ); 
 VRDStream_SINIT( aCURSESSION,aVRDStreamid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDStream_PARENT /*Направление деятельности*/ (
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
  select  INSTANCEID into aParentID from VRDStream where  VRDStreamid=aRowID;
 end; 


procedure VRDStream_ISLOCKED /*Направление деятельности*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDStream where VRDStreamid=aRowID;
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
  VRDStream_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDStream_LOCK /*Направление деятельности*/ (
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
 VRDStream_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDStream_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDStream where VRDStreamid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDStream');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDStream set LockUserID =auserID ,LockSessionID =null where VRDStreamid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDStream set LockUserID =null,LockSessionID =aCURSESSION  where VRDStreamid=aRowID;
     return;
   end if;
 end ;


procedure VRDStream_HCL /*Направление деятельности*/ (
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


procedure VRDStream_UNLOCK /*Направление деятельности*/ (
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
 VRDStream_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDStream set LockUserID =null  where VRDStreamid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDStream set LockSessionID =null  where VRDStreamid=aRowID;
     return;
   end if;
 end; 


procedure VRDStream_SINIT /*Направление деятельности*/ (
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
 select  SecurityStyleID into atmpID from VRDStream where VRDStreamid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDStream');
    return;
  end if;
if aSecurityStyleID is null then
 VRDStream_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDStream set securitystyleid =aStyleID where VRDStreamid = aRowID;
else 
 update VRDStream set securitystyleid =aSecurityStyleID where VRDStreamid = aRowID;
end if; 
end ; 


procedure VRDStream_propagate /*Направление деятельности*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDStream where VRDStreamid=aRowid;
end;



procedure VRDInterest_BRIEF  (
 aCURSESSION CHAR,
 aVRDInterestid CHAR,
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
if aVRDInterestid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDInterest where VRDInterestID=aVRDInterestID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDInterest where VRDInterestid=aVRDInterestID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDInterest');
    return;
  end if;
  aBRIEF:=func.VRDInterest_BRIEF_F(aVRDInterestid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDInterest_DELETE /*Заинтересованность*/ (
 aCURSESSION CHAR,
 aVRDInterestid CHAR,
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
select count(*) into existsCnt from VRDInterest where VRDInterestID=aVRDInterestID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDInterest where VRDInterestid=aVRDInterestID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDInterest',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDInterest');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDInterest_ISLOCKED( acursession=>acursession,aROWID=>aVRDInterestid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDInterest');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDInterest',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDInterestid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDInterest is select  instanceid ID from instance where OwnerPartName ='VRDInterest' and OwnerRowID=aVRDInterestid;
row_VRDInterest  chld_VRDInterest%ROWTYPE;
begin
--open chld_VRDInterest;
for row_VRDInterest in chld_VRDInterest loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDInterest.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDInterest.id);
end loop;
--close chld_VRDInterest;
end ;
  delete from  VRDInterest 
  where  VRDInterestID = aVRDInterestID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Заинтересованность*/
procedure VRDInterest_SAVE /*Заинтересованность*/ (
 aCURSESSION CHAR,
 aVRDInterestid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
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
select count(*) into existsCnt from VRDInterest where VRDInterestID=aVRDInterestID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDInterest where VRDInterestid=aVRDInterestID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDInterest',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDInterest');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDInterest_ISLOCKED( acursession=>acursession,aROWID=>aVRDInterestid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDInterest');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDInterest',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDInterestid,aLogInstanceID=>aInstanceID);
 update  VRDInterest set ChangeStamp=sysdate
,
  Name=aName
  where  VRDInterestID = aVRDInterestID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDInterest',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDInterest');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDInterest');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDInterest',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDInterestid,aLogInstanceID=>aInstanceID);
 insert into   VRDInterest
 (  VRDInterestID 
,InstanceID
,Name

 ) values ( aVRDInterestID 
,aInstanceID
,aName

 ); 
 VRDInterest_SINIT( aCURSESSION,aVRDInterestid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDInterest_PARENT /*Заинтересованность*/ (
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
  select  INSTANCEID into aParentID from VRDInterest where  VRDInterestid=aRowID;
 end; 


procedure VRDInterest_ISLOCKED /*Заинтересованность*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDInterest where VRDInterestid=aRowID;
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
  VRDInterest_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDInterest_LOCK /*Заинтересованность*/ (
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
 VRDInterest_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDInterest_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDInterest where VRDInterestid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDInterest');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDInterest set LockUserID =auserID ,LockSessionID =null where VRDInterestid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDInterest set LockUserID =null,LockSessionID =aCURSESSION  where VRDInterestid=aRowID;
     return;
   end if;
 end ;


procedure VRDInterest_HCL /*Заинтересованность*/ (
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


procedure VRDInterest_UNLOCK /*Заинтересованность*/ (
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
 VRDInterest_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDInterest set LockUserID =null  where VRDInterestid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDInterest set LockSessionID =null  where VRDInterestid=aRowID;
     return;
   end if;
 end; 


procedure VRDInterest_SINIT /*Заинтересованность*/ (
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
 select  SecurityStyleID into atmpID from VRDInterest where VRDInterestid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDInterest');
    return;
  end if;
if aSecurityStyleID is null then
 VRDInterest_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDInterest set securitystyleid =aStyleID where VRDInterestid = aRowID;
else 
 update VRDInterest set securitystyleid =aSecurityStyleID where VRDInterestid = aRowID;
end if; 
end ; 


procedure VRDInterest_propagate /*Заинтересованность*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDInterest where VRDInterestid=aRowid;
end;



procedure VRDDocType_BRIEF  (
 aCURSESSION CHAR,
 aVRDDocTypeid CHAR,
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
if aVRDDocTypeid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDDocType where VRDDocTypeID=aVRDDocTypeID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDDocType where VRDDocTypeid=aVRDDocTypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDDocType');
    return;
  end if;
  aBRIEF:=func.VRDDocType_BRIEF_F(aVRDDocTypeid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDDocType_DELETE /*Тип документа*/ (
 aCURSESSION CHAR,
 aVRDDocTypeid CHAR,
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
select count(*) into existsCnt from VRDDocType where VRDDocTypeID=aVRDDocTypeID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDDocType where VRDDocTypeid=aVRDDocTypeID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDDocType',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDDocType');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDDocType_ISLOCKED( acursession=>acursession,aROWID=>aVRDDocTypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDDocType');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDDocType',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDDocTypeid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDDocType is select  instanceid ID from instance where OwnerPartName ='VRDDocType' and OwnerRowID=aVRDDocTypeid;
row_VRDDocType  chld_VRDDocType%ROWTYPE;
begin
--open chld_VRDDocType;
for row_VRDDocType in chld_VRDDocType loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDDocType.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDDocType.id);
end loop;
--close chld_VRDDocType;
end ;
  delete from  VRDDocType 
  where  VRDDocTypeID = aVRDDocTypeID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип документа*/
procedure VRDDocType_SAVE /*Тип документа*/ (
 aCURSESSION CHAR,
 aVRDDocTypeid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
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
select count(*) into existsCnt from VRDDocType where VRDDocTypeID=aVRDDocTypeID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDDocType where VRDDocTypeid=aVRDDocTypeID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDDocType',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDDocType');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDDocType_ISLOCKED( acursession=>acursession,aROWID=>aVRDDocTypeid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDDocType');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDDocType',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDDocTypeid,aLogInstanceID=>aInstanceID);
 update  VRDDocType set ChangeStamp=sysdate
,
  Name=aName
  where  VRDDocTypeID = aVRDDocTypeID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from VRDDocType where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=VRDDocType');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDDocType',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDDocType');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDDocType');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDDocType',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDDocTypeid,aLogInstanceID=>aInstanceID);
 insert into   VRDDocType
 (  VRDDocTypeID 
,InstanceID
,Name

 ) values ( aVRDDocTypeID 
,aInstanceID
,aName

 ); 
 VRDDocType_SINIT( aCURSESSION,aVRDDocTypeid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from VRDDocType where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=VRDDocType');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure VRDDocType_PARENT /*Тип документа*/ (
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
  select  INSTANCEID into aParentID from VRDDocType where  VRDDocTypeid=aRowID;
 end; 


procedure VRDDocType_ISLOCKED /*Тип документа*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDDocType where VRDDocTypeid=aRowID;
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
  VRDDocType_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDDocType_LOCK /*Тип документа*/ (
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
 VRDDocType_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDDocType_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDDocType where VRDDocTypeid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDDocType');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDDocType set LockUserID =auserID ,LockSessionID =null where VRDDocTypeid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDDocType set LockUserID =null,LockSessionID =aCURSESSION  where VRDDocTypeid=aRowID;
     return;
   end if;
 end ;


procedure VRDDocType_HCL /*Тип документа*/ (
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


procedure VRDDocType_UNLOCK /*Тип документа*/ (
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
 VRDDocType_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDDocType set LockUserID =null  where VRDDocTypeid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDDocType set LockSessionID =null  where VRDDocTypeid=aRowID;
     return;
   end if;
 end; 


procedure VRDDocType_SINIT /*Тип документа*/ (
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
 select  SecurityStyleID into atmpID from VRDDocType where VRDDocTypeid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDDocType');
    return;
  end if;
if aSecurityStyleID is null then
 VRDDocType_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDDocType set securitystyleid =aStyleID where VRDDocTypeid = aRowID;
else 
 update VRDDocType set securitystyleid =aSecurityStyleID where VRDDocTypeid = aRowID;
end if; 
end ; 


procedure VRDDocType_propagate /*Тип документа*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDDocType where VRDDocTypeid=aRowid;
end;



procedure VRDLoyalty_BRIEF  (
 aCURSESSION CHAR,
 aVRDLoyaltyid CHAR,
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
if aVRDLoyaltyid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDLoyalty where VRDLoyaltyID=aVRDLoyaltyID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDLoyalty where VRDLoyaltyid=aVRDLoyaltyID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDLoyalty');
    return;
  end if;
  aBRIEF:=func.VRDLoyalty_BRIEF_F(aVRDLoyaltyid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDLoyalty_DELETE /*Лояльность*/ (
 aCURSESSION CHAR,
 aVRDLoyaltyid CHAR,
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
select count(*) into existsCnt from VRDLoyalty where VRDLoyaltyID=aVRDLoyaltyID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDLoyalty where VRDLoyaltyid=aVRDLoyaltyID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDLoyalty',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDLoyalty');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDLoyalty_ISLOCKED( acursession=>acursession,aROWID=>aVRDLoyaltyid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDLoyalty');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDLoyalty',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDLoyaltyid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDLoyalty is select  instanceid ID from instance where OwnerPartName ='VRDLoyalty' and OwnerRowID=aVRDLoyaltyid;
row_VRDLoyalty  chld_VRDLoyalty%ROWTYPE;
begin
--open chld_VRDLoyalty;
for row_VRDLoyalty in chld_VRDLoyalty loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDLoyalty.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDLoyalty.id);
end loop;
--close chld_VRDLoyalty;
end ;
  delete from  VRDLoyalty 
  where  VRDLoyaltyID = aVRDLoyaltyID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Лояльность*/
procedure VRDLoyalty_SAVE /*Лояльность*/ (
 aCURSESSION CHAR,
 aVRDLoyaltyid CHAR,
aInstanceID CHAR 
,athe_Level
 VARCHAR2/* Степень *//* Степень */
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
select count(*) into existsCnt from VRDLoyalty where VRDLoyaltyID=aVRDLoyaltyID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDLoyalty where VRDLoyaltyid=aVRDLoyaltyID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDLoyalty',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDLoyalty');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDLoyalty_ISLOCKED( acursession=>acursession,aROWID=>aVRDLoyaltyid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDLoyalty');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDLoyalty',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDLoyaltyid,aLogInstanceID=>aInstanceID);
 update  VRDLoyalty set ChangeStamp=sysdate
,
  the_Level=athe_Level
  where  VRDLoyaltyID = aVRDLoyaltyID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDLoyalty',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDLoyalty');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDLoyalty');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDLoyalty',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDLoyaltyid,aLogInstanceID=>aInstanceID);
 insert into   VRDLoyalty
 (  VRDLoyaltyID 
,InstanceID
,the_Level

 ) values ( aVRDLoyaltyID 
,aInstanceID
,athe_Level

 ); 
 VRDLoyalty_SINIT( aCURSESSION,aVRDLoyaltyid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDLoyalty_PARENT /*Лояльность*/ (
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
  select  INSTANCEID into aParentID from VRDLoyalty where  VRDLoyaltyid=aRowID;
 end; 


procedure VRDLoyalty_ISLOCKED /*Лояльность*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDLoyalty where VRDLoyaltyid=aRowID;
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
  VRDLoyalty_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDLoyalty_LOCK /*Лояльность*/ (
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
 VRDLoyalty_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDLoyalty_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDLoyalty where VRDLoyaltyid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDLoyalty');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDLoyalty set LockUserID =auserID ,LockSessionID =null where VRDLoyaltyid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDLoyalty set LockUserID =null,LockSessionID =aCURSESSION  where VRDLoyaltyid=aRowID;
     return;
   end if;
 end ;


procedure VRDLoyalty_HCL /*Лояльность*/ (
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


procedure VRDLoyalty_UNLOCK /*Лояльность*/ (
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
 VRDLoyalty_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDLoyalty set LockUserID =null  where VRDLoyaltyid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDLoyalty set LockSessionID =null  where VRDLoyaltyid=aRowID;
     return;
   end if;
 end; 


procedure VRDLoyalty_SINIT /*Лояльность*/ (
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
 select  SecurityStyleID into atmpID from VRDLoyalty where VRDLoyaltyid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDLoyalty');
    return;
  end if;
if aSecurityStyleID is null then
 VRDLoyalty_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDLoyalty set securitystyleid =aStyleID where VRDLoyaltyid = aRowID;
else 
 update VRDLoyalty set securitystyleid =aSecurityStyleID where VRDLoyaltyid = aRowID;
end if; 
end ; 


procedure VRDLoyalty_propagate /*Лояльность*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDLoyalty where VRDLoyaltyid=aRowid;
end;



procedure VRDMarket_BRIEF  (
 aCURSESSION CHAR,
 aVRDMarketid CHAR,
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
if aVRDMarketid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRDMarket where VRDMarketID=aVRDMarketID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRDMarket where VRDMarketid=aVRDMarketID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRDMarket');
    return;
  end if;
  aBRIEF:=func.VRDMarket_BRIEF_F(aVRDMarketid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRDMarket_DELETE /*Рынки*/ (
 aCURSESSION CHAR,
 aVRDMarketid CHAR,
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
select count(*) into existsCnt from VRDMarket where VRDMarketID=aVRDMarketID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRDMarket where VRDMarketid=aVRDMarketID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRDMarket',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRDMarket');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDMarket_ISLOCKED( acursession=>acursession,aROWID=>aVRDMarketid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRDMarket');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRDMarket',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRDMarketid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRDMarket is select  instanceid ID from instance where OwnerPartName ='VRDMarket' and OwnerRowID=aVRDMarketid;
row_VRDMarket  chld_VRDMarket%ROWTYPE;
begin
--open chld_VRDMarket;
for row_VRDMarket in chld_VRDMarket loop
 Kernel.INSTANCE_OWNER (acursession,row_VRDMarket.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRDMarket.id);
end loop;
--close chld_VRDMarket;
end ;
  delete from  VRDMarket 
  where  VRDMarketID = aVRDMarketID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Рынки*/
procedure VRDMarket_SAVE /*Рынки*/ (
 aCURSESSION CHAR,
 aVRDMarketid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aName
 VARCHAR2/* Название *//* Название */
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
select count(*) into existsCnt from VRDMarket where VRDMarketID=aVRDMarketID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRDMarket where VRDMarketid=aVRDMarketID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRDMarket',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRDMarket');
      return;
    end if;
  end if;
 --  verify lock  --
 VRDMarket_ISLOCKED( acursession=>acursession,aROWID=>aVRDMarketid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDMarket');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDMarket',
 aVERB=>'EDITROW',  aThe_Resource=>aVRDMarketid,aLogInstanceID=>aInstanceID);
 update  VRDMarket set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  Name=aName
  where  VRDMarketID = aVRDMarketID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRDMarket',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRDMarket');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRDMarket');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRDMarket',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRDMarketid,aLogInstanceID=>aInstanceID);
 insert into   VRDMarket
 (  VRDMarketID 
,ParentRowid
,InstanceID
,Name

 ) values ( aVRDMarketID 
,aParentRowid
,aInstanceID
,aName

 ); 
 VRDMarket_SINIT( aCURSESSION,aVRDMarketid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRDMarket_PARENT /*Рынки*/ (
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
  select  INSTANCEID into aParentID from VRDMarket where  VRDMarketid=aRowID;
 end; 


procedure VRDMarket_ISLOCKED /*Рынки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRDMarket where VRDMarketid=aRowID;
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
  VRDMarket_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRDMarket_LOCK /*Рынки*/ (
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
 VRDMarket_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRDMarket_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRDMarket where VRDMarketid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRDMarket');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRDMarket set LockUserID =auserID ,LockSessionID =null where VRDMarketid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRDMarket set LockUserID =null,LockSessionID =aCURSESSION  where VRDMarketid=aRowID;
     return;
   end if;
 end ;


procedure VRDMarket_HCL /*Рынки*/ (
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


procedure VRDMarket_UNLOCK /*Рынки*/ (
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
 VRDMarket_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRDMarket set LockUserID =null  where VRDMarketid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRDMarket set LockSessionID =null  where VRDMarketid=aRowID;
     return;
   end if;
 end; 


procedure VRDMarket_SINIT /*Рынки*/ (
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
 select  SecurityStyleID into atmpID from VRDMarket where VRDMarketid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRDMarket');
    return;
  end if;
if aSecurityStyleID is null then
 VRDMarket_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRDMarket set securitystyleid =aStyleID where VRDMarketid = aRowID;
else 
 update VRDMarket set securitystyleid =aSecurityStyleID where VRDMarketid = aRowID;
end if; 
end ; 


procedure VRDMarket_propagate /*Рынки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRDMarket where VRDMarketid=aRowid;
end;


end VRD;

/



