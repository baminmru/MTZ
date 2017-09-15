
/* --VRC*/

 create or replace package body VRC as

procedure VRC_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='VRC'
then
declare cursor child_VRCSeeAlso is select VRCSeeAlso.VRCSeeAlsoid ID from VRCSeeAlso where  VRCSeeAlso.InstanceID = ainstanceid;
row_VRCSeeAlso  child_VRCSeeAlso%ROWTYPE;
begin
--open child_VRCSeeAlso;
for row_VRCSeeAlso in child_VRCSeeAlso loop
 VRCSeeAlso_DELETE (acursession,row_VRCSeeAlso.id,aInstanceID);
end loop;
--close child_VRCSeeAlso;
end;
declare cursor child_VRCAccounts is select VRCAccounts.VRCAccountsid ID from VRCAccounts where  VRCAccounts.InstanceID = ainstanceid;
row_VRCAccounts  child_VRCAccounts%ROWTYPE;
begin
--open child_VRCAccounts;
for row_VRCAccounts in child_VRCAccounts loop
 VRCAccounts_DELETE (acursession,row_VRCAccounts.id,aInstanceID);
end loop;
--close child_VRCAccounts;
end;
declare cursor child_VRCPayIn is select VRCPayIn.VRCPayInid ID from VRCPayIn where  VRCPayIn.InstanceID = ainstanceid;
row_VRCPayIn  child_VRCPayIn%ROWTYPE;
begin
--open child_VRCPayIn;
for row_VRCPayIn in child_VRCPayIn loop
 VRCPayIn_DELETE (acursession,row_VRCPayIn.id,aInstanceID);
end loop;
--close child_VRCPayIn;
end;
declare cursor child_VRCOwnership is select VRCOwnership.VRCOwnershipid ID from VRCOwnership where  VRCOwnership.InstanceID = ainstanceid;
row_VRCOwnership  child_VRCOwnership%ROWTYPE;
begin
--open child_VRCOwnership;
for row_VRCOwnership in child_VRCOwnership loop
 VRCOwnership_DELETE (acursession,row_VRCOwnership.id,aInstanceID);
end loop;
--close child_VRCOwnership;
end;
declare cursor child_VRCGlossary is select VRCGlossary.VRCGlossaryid ID from VRCGlossary where  VRCGlossary.InstanceID = ainstanceid;
row_VRCGlossary  child_VRCGlossary%ROWTYPE;
begin
--open child_VRCGlossary;
for row_VRCGlossary in child_VRCGlossary loop
 VRCGlossary_DELETE (acursession,row_VRCGlossary.id,aInstanceID);
end loop;
--close child_VRCGlossary;
end;
declare cursor child_VRCProgress is select VRCProgress.VRCProgressid ID from VRCProgress where  VRCProgress.InstanceID = ainstanceid;
row_VRCProgress  child_VRCProgress%ROWTYPE;
begin
--open child_VRCProgress;
for row_VRCProgress in child_VRCProgress loop
 VRCProgress_DELETE (acursession,row_VRCProgress.id,aInstanceID);
end loop;
--close child_VRCProgress;
end;
declare cursor child_VRCLifeSupport is select VRCLifeSupport.VRCLifeSupportid ID from VRCLifeSupport where  VRCLifeSupport.InstanceID = ainstanceid;
row_VRCLifeSupport  child_VRCLifeSupport%ROWTYPE;
begin
--open child_VRCLifeSupport;
for row_VRCLifeSupport in child_VRCLifeSupport loop
 VRCLifeSupport_DELETE (acursession,row_VRCLifeSupport.id,aInstanceID);
end loop;
--close child_VRCLifeSupport;
end;
declare cursor child_VRCTorg is select VRCTorg.VRCTorgid ID from VRCTorg where  VRCTorg.InstanceID = ainstanceid;
row_VRCTorg  child_VRCTorg%ROWTYPE;
begin
--open child_VRCTorg;
for row_VRCTorg in child_VRCTorg loop
 VRCTorg_DELETE (acursession,row_VRCTorg.id,aInstanceID);
end loop;
--close child_VRCTorg;
end;
declare cursor child_VRCZayavki is select VRCZayavki.VRCZayavkiid ID from VRCZayavki where  VRCZayavki.InstanceID = ainstanceid;
row_VRCZayavki  child_VRCZayavki%ROWTYPE;
begin
--open child_VRCZayavki;
for row_VRCZayavki in child_VRCZayavki loop
 VRCZayavki_DELETE (acursession,row_VRCZayavki.id,aInstanceID);
end loop;
--close child_VRCZayavki;
end;
declare cursor child_VRCAutomatizations is select VRCAutomatizations.VRCAutomatizationsid ID from VRCAutomatizations where  VRCAutomatizations.InstanceID = ainstanceid;
row_VRCAutomatizations  child_VRCAutomatizations%ROWTYPE;
begin
--open child_VRCAutomatizations;
for row_VRCAutomatizations in child_VRCAutomatizations loop
 VRCAutomatizations_DELETE (acursession,row_VRCAutomatizations.id,aInstanceID);
end loop;
--close child_VRCAutomatizations;
end;
declare cursor child_VRCReport is select VRCReport.VRCReportid ID from VRCReport where  VRCReport.InstanceID = ainstanceid;
row_VRCReport  child_VRCReport%ROWTYPE;
begin
--open child_VRCReport;
for row_VRCReport in child_VRCReport loop
 VRCReport_DELETE (acursession,row_VRCReport.id,aInstanceID);
end loop;
--close child_VRCReport;
end;
declare cursor child_VRCAditional is select VRCAditional.VRCAditionalid ID from VRCAditional where  VRCAditional.InstanceID = ainstanceid;
row_VRCAditional  child_VRCAditional%ROWTYPE;
begin
--open child_VRCAditional;
for row_VRCAditional in child_VRCAditional loop
 VRCAditional_DELETE (acursession,row_VRCAditional.id,aInstanceID);
end loop;
--close child_VRCAditional;
end;
declare cursor child_VRCPayOut is select VRCPayOut.VRCPayOutid ID from VRCPayOut where  VRCPayOut.InstanceID = ainstanceid;
row_VRCPayOut  child_VRCPayOut%ROWTYPE;
begin
--open child_VRCPayOut;
for row_VRCPayOut in child_VRCPayOut loop
 VRCPayOut_DELETE (acursession,row_VRCPayOut.id,aInstanceID);
end loop;
--close child_VRCPayOut;
end;
declare cursor child_VCContract is select VCContract.VCContractid ID from VCContract where  VCContract.InstanceID = ainstanceid;
row_VCContract  child_VCContract%ROWTYPE;
begin
--open child_VCContract;
for row_VCContract in child_VCContract loop
 VCContract_DELETE (acursession,row_VCContract.id,aInstanceID);
end loop;
--close child_VCContract;
end;
declare cursor child_VRCOrgStruct is select VRCOrgStruct.VRCOrgStructid ID from VRCOrgStruct where  VRCOrgStruct.InstanceID = ainstanceid;
row_VRCOrgStruct  child_VRCOrgStruct%ROWTYPE;
begin
--open child_VRCOrgStruct;
for row_VRCOrgStruct in child_VRCOrgStruct loop
 VRCOrgStruct_DELETE (acursession,row_VRCOrgStruct.id,aInstanceID);
end loop;
--close child_VRCOrgStruct;
end;
declare cursor child_VRCCommonInfo is select VRCCommonInfo.VRCCommonInfoid ID from VRCCommonInfo where  VRCCommonInfo.InstanceID = ainstanceid;
row_VRCCommonInfo  child_VRCCommonInfo%ROWTYPE;
begin
--open child_VRCCommonInfo;
for row_VRCCommonInfo in child_VRCCommonInfo loop
 VRCCommonInfo_DELETE (acursession,row_VRCCommonInfo.id,aInstanceID);
end loop;
--close child_VRCCommonInfo;
end;
declare cursor child_VRCPerson is select VRCPerson.VRCPersonid ID from VRCPerson where  VRCPerson.InstanceID = ainstanceid;
row_VRCPerson  child_VRCPerson%ROWTYPE;
begin
--open child_VRCPerson;
for row_VRCPerson in child_VRCPerson loop
 VRCPerson_DELETE (acursession,row_VRCPerson.id,aInstanceID);
end loop;
--close child_VRCPerson;
end;
return;
<<del_error>>
return;
end if;
end;
procedure VRC_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'VRC'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_VRCSeeAlso is select VRCSeeAlso.VRCSeeAlsoid ID from VRCSeeAlso where  VRCSeeAlso.InstanceID = arowid;
ROW_VRCSeeAlso  lch_VRCSeeAlso%ROWTYPE;
begin
--open lch_VRCSeeAlso;
for row_VRCSeeAlso in lch_VRCSeeAlso loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCSeeAlso where VRCSeeAlsoid=row_VRCSeeAlso.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCSeeAlso;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCSeeAlso;
     return;
   end if; 
 end if; 
 VRCSeeAlso_HCL (acursession,ROW_VRCSeeAlso.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCSeeAlso;
   return;
 end if;
 end loop;
--close lch_VRCSeeAlso;
end;
declare cursor lch_VRCAccounts is select VRCAccounts.VRCAccountsid ID from VRCAccounts where  VRCAccounts.InstanceID = arowid;
ROW_VRCAccounts  lch_VRCAccounts%ROWTYPE;
begin
--open lch_VRCAccounts;
for row_VRCAccounts in lch_VRCAccounts loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCAccounts where VRCAccountsid=row_VRCAccounts.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCAccounts;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCAccounts;
     return;
   end if; 
 end if; 
 VRCAccounts_HCL (acursession,ROW_VRCAccounts.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCAccounts;
   return;
 end if;
 end loop;
--close lch_VRCAccounts;
end;
declare cursor lch_VRCPayIn is select VRCPayIn.VRCPayInid ID from VRCPayIn where  VRCPayIn.InstanceID = arowid;
ROW_VRCPayIn  lch_VRCPayIn%ROWTYPE;
begin
--open lch_VRCPayIn;
for row_VRCPayIn in lch_VRCPayIn loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPayIn where VRCPayInid=row_VRCPayIn.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPayIn;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPayIn;
     return;
   end if; 
 end if; 
 VRCPayIn_HCL (acursession,ROW_VRCPayIn.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPayIn;
   return;
 end if;
 end loop;
--close lch_VRCPayIn;
end;
declare cursor lch_VRCOwnership is select VRCOwnership.VRCOwnershipid ID from VRCOwnership where  VRCOwnership.InstanceID = arowid;
ROW_VRCOwnership  lch_VRCOwnership%ROWTYPE;
begin
--open lch_VRCOwnership;
for row_VRCOwnership in lch_VRCOwnership loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCOwnership where VRCOwnershipid=row_VRCOwnership.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCOwnership;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCOwnership;
     return;
   end if; 
 end if; 
 VRCOwnership_HCL (acursession,ROW_VRCOwnership.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCOwnership;
   return;
 end if;
 end loop;
--close lch_VRCOwnership;
end;
declare cursor lch_VRCGlossary is select VRCGlossary.VRCGlossaryid ID from VRCGlossary where  VRCGlossary.InstanceID = arowid;
ROW_VRCGlossary  lch_VRCGlossary%ROWTYPE;
begin
--open lch_VRCGlossary;
for row_VRCGlossary in lch_VRCGlossary loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCGlossary where VRCGlossaryid=row_VRCGlossary.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCGlossary;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCGlossary;
     return;
   end if; 
 end if; 
 VRCGlossary_HCL (acursession,ROW_VRCGlossary.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCGlossary;
   return;
 end if;
 end loop;
--close lch_VRCGlossary;
end;
declare cursor lch_VRCProgress is select VRCProgress.VRCProgressid ID from VRCProgress where  VRCProgress.InstanceID = arowid;
ROW_VRCProgress  lch_VRCProgress%ROWTYPE;
begin
--open lch_VRCProgress;
for row_VRCProgress in lch_VRCProgress loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCProgress where VRCProgressid=row_VRCProgress.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCProgress;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCProgress;
     return;
   end if; 
 end if; 
 VRCProgress_HCL (acursession,ROW_VRCProgress.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCProgress;
   return;
 end if;
 end loop;
--close lch_VRCProgress;
end;
declare cursor lch_VRCLifeSupport is select VRCLifeSupport.VRCLifeSupportid ID from VRCLifeSupport where  VRCLifeSupport.InstanceID = arowid;
ROW_VRCLifeSupport  lch_VRCLifeSupport%ROWTYPE;
begin
--open lch_VRCLifeSupport;
for row_VRCLifeSupport in lch_VRCLifeSupport loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCLifeSupport where VRCLifeSupportid=row_VRCLifeSupport.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCLifeSupport;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCLifeSupport;
     return;
   end if; 
 end if; 
 VRCLifeSupport_HCL (acursession,ROW_VRCLifeSupport.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCLifeSupport;
   return;
 end if;
 end loop;
--close lch_VRCLifeSupport;
end;
declare cursor lch_VRCTorg is select VRCTorg.VRCTorgid ID from VRCTorg where  VRCTorg.InstanceID = arowid;
ROW_VRCTorg  lch_VRCTorg%ROWTYPE;
begin
--open lch_VRCTorg;
for row_VRCTorg in lch_VRCTorg loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCTorg where VRCTorgid=row_VRCTorg.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCTorg;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCTorg;
     return;
   end if; 
 end if; 
 VRCTorg_HCL (acursession,ROW_VRCTorg.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCTorg;
   return;
 end if;
 end loop;
--close lch_VRCTorg;
end;
declare cursor lch_VRCZayavki is select VRCZayavki.VRCZayavkiid ID from VRCZayavki where  VRCZayavki.InstanceID = arowid;
ROW_VRCZayavki  lch_VRCZayavki%ROWTYPE;
begin
--open lch_VRCZayavki;
for row_VRCZayavki in lch_VRCZayavki loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCZayavki where VRCZayavkiid=row_VRCZayavki.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCZayavki;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCZayavki;
     return;
   end if; 
 end if; 
 VRCZayavki_HCL (acursession,ROW_VRCZayavki.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCZayavki;
   return;
 end if;
 end loop;
--close lch_VRCZayavki;
end;
declare cursor lch_VRCAutomatizations is select VRCAutomatizations.VRCAutomatizationsid ID from VRCAutomatizations where  VRCAutomatizations.InstanceID = arowid;
ROW_VRCAutomatizations  lch_VRCAutomatizations%ROWTYPE;
begin
--open lch_VRCAutomatizations;
for row_VRCAutomatizations in lch_VRCAutomatizations loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCAutomatizations where VRCAutomatizationsid=row_VRCAutomatizations.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCAutomatizations;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCAutomatizations;
     return;
   end if; 
 end if; 
 VRCAutomatizations_HCL (acursession,ROW_VRCAutomatizations.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCAutomatizations;
   return;
 end if;
 end loop;
--close lch_VRCAutomatizations;
end;
declare cursor lch_VRCReport is select VRCReport.VRCReportid ID from VRCReport where  VRCReport.InstanceID = arowid;
ROW_VRCReport  lch_VRCReport%ROWTYPE;
begin
--open lch_VRCReport;
for row_VRCReport in lch_VRCReport loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCReport where VRCReportid=row_VRCReport.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCReport;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCReport;
     return;
   end if; 
 end if; 
 VRCReport_HCL (acursession,ROW_VRCReport.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCReport;
   return;
 end if;
 end loop;
--close lch_VRCReport;
end;
declare cursor lch_VRCAditional is select VRCAditional.VRCAditionalid ID from VRCAditional where  VRCAditional.InstanceID = arowid;
ROW_VRCAditional  lch_VRCAditional%ROWTYPE;
begin
--open lch_VRCAditional;
for row_VRCAditional in lch_VRCAditional loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCAditional where VRCAditionalid=row_VRCAditional.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCAditional;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCAditional;
     return;
   end if; 
 end if; 
 VRCAditional_HCL (acursession,ROW_VRCAditional.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCAditional;
   return;
 end if;
 end loop;
--close lch_VRCAditional;
end;
declare cursor lch_VRCPayOut is select VRCPayOut.VRCPayOutid ID from VRCPayOut where  VRCPayOut.InstanceID = arowid;
ROW_VRCPayOut  lch_VRCPayOut%ROWTYPE;
begin
--open lch_VRCPayOut;
for row_VRCPayOut in lch_VRCPayOut loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPayOut where VRCPayOutid=row_VRCPayOut.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPayOut;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPayOut;
     return;
   end if; 
 end if; 
 VRCPayOut_HCL (acursession,ROW_VRCPayOut.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPayOut;
   return;
 end if;
 end loop;
--close lch_VRCPayOut;
end;
declare cursor lch_VCContract is select VCContract.VCContractid ID from VCContract where  VCContract.InstanceID = arowid;
ROW_VCContract  lch_VCContract%ROWTYPE;
begin
--open lch_VCContract;
for row_VCContract in lch_VCContract loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VCContract where VCContractid=row_VCContract.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VCContract;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VCContract;
     return;
   end if; 
 end if; 
 VCContract_HCL (acursession,ROW_VCContract.id,aisLocked);
 if aisLocked >2 then
   close lch_VCContract;
   return;
 end if;
 end loop;
--close lch_VCContract;
end;
declare cursor lch_VRCOrgStruct is select VRCOrgStruct.VRCOrgStructid ID from VRCOrgStruct where  VRCOrgStruct.InstanceID = arowid;
ROW_VRCOrgStruct  lch_VRCOrgStruct%ROWTYPE;
begin
--open lch_VRCOrgStruct;
for row_VRCOrgStruct in lch_VRCOrgStruct loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCOrgStruct where VRCOrgStructid=row_VRCOrgStruct.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCOrgStruct;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCOrgStruct;
     return;
   end if; 
 end if; 
 VRCOrgStruct_HCL (acursession,ROW_VRCOrgStruct.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCOrgStruct;
   return;
 end if;
 end loop;
--close lch_VRCOrgStruct;
end;
declare cursor lch_VRCCommonInfo is select VRCCommonInfo.VRCCommonInfoid ID from VRCCommonInfo where  VRCCommonInfo.InstanceID = arowid;
ROW_VRCCommonInfo  lch_VRCCommonInfo%ROWTYPE;
begin
--open lch_VRCCommonInfo;
for row_VRCCommonInfo in lch_VRCCommonInfo loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCCommonInfo where VRCCommonInfoid=row_VRCCommonInfo.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCCommonInfo;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCCommonInfo;
     return;
   end if; 
 end if; 
 VRCCommonInfo_HCL (acursession,ROW_VRCCommonInfo.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCCommonInfo;
   return;
 end if;
 end loop;
--close lch_VRCCommonInfo;
end;
declare cursor lch_VRCPerson is select VRCPerson.VRCPersonid ID from VRCPerson where  VRCPerson.InstanceID = arowid;
ROW_VRCPerson  lch_VRCPerson%ROWTYPE;
begin
--open lch_VRCPerson;
for row_VRCPerson in lch_VRCPerson loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPerson where VRCPersonid=row_VRCPerson.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPerson;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPerson;
     return;
   end if; 
 end if; 
 VRCPerson_HCL (acursession,ROW_VRCPerson.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPerson;
   return;
 end if;
 end loop;
--close lch_VRCPerson;
end;
 end if;
aIsLocked:=0;
end;
procedure VRC_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'VRC'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_VRCSeeAlso is select VRCSeeAlso.VRCSeeAlsoid id from VRCSeeAlso where  VRCSeeAlso.InstanceID = arowid;
row_VRCSeeAlso  pch_VRCSeeAlso%ROWTYPE;
begin
--open pch_VRCSeeAlso;
for row_VRCSeeAlso in  pch_VRCSeeAlso loop
 VRCSeeAlso_SINIT( acursession,row_VRCSeeAlso.id,assid);
 VRCSeeAlso_propagate( acursession,row_VRCSeeAlso.id);
end loop;
--close pch_VRCSeeAlso;
end;
declare cursor pch_VRCAccounts is select VRCAccounts.VRCAccountsid id from VRCAccounts where  VRCAccounts.InstanceID = arowid;
row_VRCAccounts  pch_VRCAccounts%ROWTYPE;
begin
--open pch_VRCAccounts;
for row_VRCAccounts in  pch_VRCAccounts loop
 VRCAccounts_SINIT( acursession,row_VRCAccounts.id,assid);
 VRCAccounts_propagate( acursession,row_VRCAccounts.id);
end loop;
--close pch_VRCAccounts;
end;
declare cursor pch_VRCPayIn is select VRCPayIn.VRCPayInid id from VRCPayIn where  VRCPayIn.InstanceID = arowid;
row_VRCPayIn  pch_VRCPayIn%ROWTYPE;
begin
--open pch_VRCPayIn;
for row_VRCPayIn in  pch_VRCPayIn loop
 VRCPayIn_SINIT( acursession,row_VRCPayIn.id,assid);
 VRCPayIn_propagate( acursession,row_VRCPayIn.id);
end loop;
--close pch_VRCPayIn;
end;
declare cursor pch_VRCOwnership is select VRCOwnership.VRCOwnershipid id from VRCOwnership where  VRCOwnership.InstanceID = arowid;
row_VRCOwnership  pch_VRCOwnership%ROWTYPE;
begin
--open pch_VRCOwnership;
for row_VRCOwnership in  pch_VRCOwnership loop
 VRCOwnership_SINIT( acursession,row_VRCOwnership.id,assid);
 VRCOwnership_propagate( acursession,row_VRCOwnership.id);
end loop;
--close pch_VRCOwnership;
end;
declare cursor pch_VRCGlossary is select VRCGlossary.VRCGlossaryid id from VRCGlossary where  VRCGlossary.InstanceID = arowid;
row_VRCGlossary  pch_VRCGlossary%ROWTYPE;
begin
--open pch_VRCGlossary;
for row_VRCGlossary in  pch_VRCGlossary loop
 VRCGlossary_SINIT( acursession,row_VRCGlossary.id,assid);
 VRCGlossary_propagate( acursession,row_VRCGlossary.id);
end loop;
--close pch_VRCGlossary;
end;
declare cursor pch_VRCProgress is select VRCProgress.VRCProgressid id from VRCProgress where  VRCProgress.InstanceID = arowid;
row_VRCProgress  pch_VRCProgress%ROWTYPE;
begin
--open pch_VRCProgress;
for row_VRCProgress in  pch_VRCProgress loop
 VRCProgress_SINIT( acursession,row_VRCProgress.id,assid);
 VRCProgress_propagate( acursession,row_VRCProgress.id);
end loop;
--close pch_VRCProgress;
end;
declare cursor pch_VRCLifeSupport is select VRCLifeSupport.VRCLifeSupportid id from VRCLifeSupport where  VRCLifeSupport.InstanceID = arowid;
row_VRCLifeSupport  pch_VRCLifeSupport%ROWTYPE;
begin
--open pch_VRCLifeSupport;
for row_VRCLifeSupport in  pch_VRCLifeSupport loop
 VRCLifeSupport_SINIT( acursession,row_VRCLifeSupport.id,assid);
 VRCLifeSupport_propagate( acursession,row_VRCLifeSupport.id);
end loop;
--close pch_VRCLifeSupport;
end;
declare cursor pch_VRCTorg is select VRCTorg.VRCTorgid id from VRCTorg where  VRCTorg.InstanceID = arowid;
row_VRCTorg  pch_VRCTorg%ROWTYPE;
begin
--open pch_VRCTorg;
for row_VRCTorg in  pch_VRCTorg loop
 VRCTorg_SINIT( acursession,row_VRCTorg.id,assid);
 VRCTorg_propagate( acursession,row_VRCTorg.id);
end loop;
--close pch_VRCTorg;
end;
declare cursor pch_VRCZayavki is select VRCZayavki.VRCZayavkiid id from VRCZayavki where  VRCZayavki.InstanceID = arowid;
row_VRCZayavki  pch_VRCZayavki%ROWTYPE;
begin
--open pch_VRCZayavki;
for row_VRCZayavki in  pch_VRCZayavki loop
 VRCZayavki_SINIT( acursession,row_VRCZayavki.id,assid);
 VRCZayavki_propagate( acursession,row_VRCZayavki.id);
end loop;
--close pch_VRCZayavki;
end;
declare cursor pch_VRCAutomatizations is select VRCAutomatizations.VRCAutomatizationsid id from VRCAutomatizations where  VRCAutomatizations.InstanceID = arowid;
row_VRCAutomatizations  pch_VRCAutomatizations%ROWTYPE;
begin
--open pch_VRCAutomatizations;
for row_VRCAutomatizations in  pch_VRCAutomatizations loop
 VRCAutomatizations_SINIT( acursession,row_VRCAutomatizations.id,assid);
 VRCAutomatizations_propagate( acursession,row_VRCAutomatizations.id);
end loop;
--close pch_VRCAutomatizations;
end;
declare cursor pch_VRCReport is select VRCReport.VRCReportid id from VRCReport where  VRCReport.InstanceID = arowid;
row_VRCReport  pch_VRCReport%ROWTYPE;
begin
--open pch_VRCReport;
for row_VRCReport in  pch_VRCReport loop
 VRCReport_SINIT( acursession,row_VRCReport.id,assid);
 VRCReport_propagate( acursession,row_VRCReport.id);
end loop;
--close pch_VRCReport;
end;
declare cursor pch_VRCAditional is select VRCAditional.VRCAditionalid id from VRCAditional where  VRCAditional.InstanceID = arowid;
row_VRCAditional  pch_VRCAditional%ROWTYPE;
begin
--open pch_VRCAditional;
for row_VRCAditional in  pch_VRCAditional loop
 VRCAditional_SINIT( acursession,row_VRCAditional.id,assid);
 VRCAditional_propagate( acursession,row_VRCAditional.id);
end loop;
--close pch_VRCAditional;
end;
declare cursor pch_VRCPayOut is select VRCPayOut.VRCPayOutid id from VRCPayOut where  VRCPayOut.InstanceID = arowid;
row_VRCPayOut  pch_VRCPayOut%ROWTYPE;
begin
--open pch_VRCPayOut;
for row_VRCPayOut in  pch_VRCPayOut loop
 VRCPayOut_SINIT( acursession,row_VRCPayOut.id,assid);
 VRCPayOut_propagate( acursession,row_VRCPayOut.id);
end loop;
--close pch_VRCPayOut;
end;
declare cursor pch_VCContract is select VCContract.VCContractid id from VCContract where  VCContract.InstanceID = arowid;
row_VCContract  pch_VCContract%ROWTYPE;
begin
--open pch_VCContract;
for row_VCContract in  pch_VCContract loop
 VCContract_SINIT( acursession,row_VCContract.id,assid);
 VCContract_propagate( acursession,row_VCContract.id);
end loop;
--close pch_VCContract;
end;
declare cursor pch_VRCOrgStruct is select VRCOrgStruct.VRCOrgStructid id from VRCOrgStruct where  VRCOrgStruct.InstanceID = arowid;
row_VRCOrgStruct  pch_VRCOrgStruct%ROWTYPE;
begin
--open pch_VRCOrgStruct;
for row_VRCOrgStruct in  pch_VRCOrgStruct loop
 VRCOrgStruct_SINIT( acursession,row_VRCOrgStruct.id,assid);
 VRCOrgStruct_propagate( acursession,row_VRCOrgStruct.id);
end loop;
--close pch_VRCOrgStruct;
end;
declare cursor pch_VRCCommonInfo is select VRCCommonInfo.VRCCommonInfoid id from VRCCommonInfo where  VRCCommonInfo.InstanceID = arowid;
row_VRCCommonInfo  pch_VRCCommonInfo%ROWTYPE;
begin
--open pch_VRCCommonInfo;
for row_VRCCommonInfo in  pch_VRCCommonInfo loop
 VRCCommonInfo_SINIT( acursession,row_VRCCommonInfo.id,assid);
 VRCCommonInfo_propagate( acursession,row_VRCCommonInfo.id);
end loop;
--close pch_VRCCommonInfo;
end;
declare cursor pch_VRCPerson is select VRCPerson.VRCPersonid id from VRCPerson where  VRCPerson.InstanceID = arowid;
row_VRCPerson  pch_VRCPerson%ROWTYPE;
begin
--open pch_VRCPerson;
for row_VRCPerson in  pch_VRCPerson loop
 VRCPerson_SINIT( acursession,row_VRCPerson.id,assid);
 VRCPerson_propagate( acursession,row_VRCPerson.id);
end loop;
--close pch_VRCPerson;
end;
 end if; 
end;



procedure VRCSeeAlso_BRIEF  (
 aCURSESSION CHAR,
 aVRCSeeAlsoid CHAR,
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
if aVRCSeeAlsoid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCSeeAlso where VRCSeeAlsoID=aVRCSeeAlsoID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCSeeAlso where VRCSeeAlsoid=aVRCSeeAlsoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCSeeAlso');
    return;
  end if;
  aBRIEF:=func.VRCSeeAlso_BRIEF_F(aVRCSeeAlsoid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCSeeAlso_DELETE /*Смотри также*/ (
 aCURSESSION CHAR,
 aVRCSeeAlsoid CHAR,
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
select count(*) into existsCnt from VRCSeeAlso where VRCSeeAlsoID=aVRCSeeAlsoID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCSeeAlso where VRCSeeAlsoid=aVRCSeeAlsoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCSeeAlso',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCSeeAlso');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCSeeAlso_ISLOCKED( acursession=>acursession,aROWID=>aVRCSeeAlsoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCSeeAlso');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCSeeAlso',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCSeeAlsoid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCSeeAlso is select  instanceid ID from instance where OwnerPartName ='VRCSeeAlso' and OwnerRowID=aVRCSeeAlsoid;
row_VRCSeeAlso  chld_VRCSeeAlso%ROWTYPE;
begin
--open chld_VRCSeeAlso;
for row_VRCSeeAlso in chld_VRCSeeAlso loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCSeeAlso.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCSeeAlso.id);
end loop;
--close chld_VRCSeeAlso;
end ;
  delete from  VRCSeeAlso 
  where  VRCSeeAlsoID = aVRCSeeAlsoID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Смотри также*/
procedure VRCSeeAlso_SAVE /*Смотри также*/ (
 aCURSESSION CHAR,
 aVRCSeeAlsoid CHAR,
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
select count(*) into existsCnt from VRCSeeAlso where VRCSeeAlsoID=aVRCSeeAlsoID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCSeeAlso where VRCSeeAlsoid=aVRCSeeAlsoID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCSeeAlso',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCSeeAlso');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCSeeAlso_ISLOCKED( acursession=>acursession,aROWID=>aVRCSeeAlsoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCSeeAlso');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCSeeAlso',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCSeeAlsoid,aLogInstanceID=>aInstanceID);
 update  VRCSeeAlso set ChangeStamp=sysdate
,
  Document=aDocument
,
  the_Comment=athe_Comment
  where  VRCSeeAlsoID = aVRCSeeAlsoID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCSeeAlso',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCSeeAlso');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCSeeAlso');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCSeeAlso',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCSeeAlsoid,aLogInstanceID=>aInstanceID);
 insert into   VRCSeeAlso
 (  VRCSeeAlsoID 
,InstanceID
,Document

,the_Comment

 ) values ( aVRCSeeAlsoID 
,aInstanceID
,aDocument

,athe_Comment

 ); 
 VRCSeeAlso_SINIT( aCURSESSION,aVRCSeeAlsoid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCSeeAlso_PARENT /*Смотри также*/ (
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
  select  INSTANCEID into aParentID from VRCSeeAlso where  VRCSeeAlsoid=aRowID;
 end; 


procedure VRCSeeAlso_ISLOCKED /*Смотри также*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCSeeAlso where VRCSeeAlsoid=aRowID;
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
  VRCSeeAlso_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCSeeAlso_LOCK /*Смотри также*/ (
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
 VRCSeeAlso_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCSeeAlso_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCSeeAlso where VRCSeeAlsoid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCSeeAlso');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCSeeAlso set LockUserID =auserID ,LockSessionID =null where VRCSeeAlsoid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCSeeAlso set LockUserID =null,LockSessionID =aCURSESSION  where VRCSeeAlsoid=aRowID;
     return;
   end if;
 end ;


procedure VRCSeeAlso_HCL /*Смотри также*/ (
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


procedure VRCSeeAlso_UNLOCK /*Смотри также*/ (
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
 VRCSeeAlso_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCSeeAlso set LockUserID =null  where VRCSeeAlsoid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCSeeAlso set LockSessionID =null  where VRCSeeAlsoid=aRowID;
     return;
   end if;
 end; 


procedure VRCSeeAlso_SINIT /*Смотри также*/ (
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
 select  SecurityStyleID into atmpID from VRCSeeAlso where VRCSeeAlsoid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCSeeAlso');
    return;
  end if;
if aSecurityStyleID is null then
 VRCSeeAlso_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCSeeAlso set securitystyleid =aStyleID where VRCSeeAlsoid = aRowID;
else 
 update VRCSeeAlso set securitystyleid =aSecurityStyleID where VRCSeeAlsoid = aRowID;
end if; 
end ; 


procedure VRCSeeAlso_propagate /*Смотри также*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCSeeAlso where VRCSeeAlsoid=aRowid;
end;



procedure VRCAccounts_BRIEF  (
 aCURSESSION CHAR,
 aVRCAccountsid CHAR,
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
if aVRCAccountsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCAccounts where VRCAccountsID=aVRCAccountsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCAccounts where VRCAccountsid=aVRCAccountsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCAccounts');
    return;
  end if;
  aBRIEF:=func.VRCAccounts_BRIEF_F(aVRCAccountsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCAccounts_DELETE /*Банковские реквизиты*/ (
 aCURSESSION CHAR,
 aVRCAccountsid CHAR,
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
select count(*) into existsCnt from VRCAccounts where VRCAccountsID=aVRCAccountsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCAccounts where VRCAccountsid=aVRCAccountsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCAccounts',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCAccounts');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCAccounts_ISLOCKED( acursession=>acursession,aROWID=>aVRCAccountsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCAccounts');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCAccounts',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCAccountsid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCAccounts is select  instanceid ID from instance where OwnerPartName ='VRCAccounts' and OwnerRowID=aVRCAccountsid;
row_VRCAccounts  chld_VRCAccounts%ROWTYPE;
begin
--open chld_VRCAccounts;
for row_VRCAccounts in chld_VRCAccounts loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCAccounts.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCAccounts.id);
end loop;
--close chld_VRCAccounts;
end ;
  delete from  VRCAccounts 
  where  VRCAccountsID = aVRCAccountsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Банковские реквизиты*/
procedure VRCAccounts_SAVE /*Банковские реквизиты*/ (
 aCURSESSION CHAR,
 aVRCAccountsid CHAR,
aInstanceID CHAR 
,aBANK CHAR/* Банк *//* Банк */
,aacc
 VARCHAR2/* № счета *//* № счета */
,afillial VARCHAR2 := null /* Название филиала *//* Название филиала */
,aDefaultAccount
 NUMBER/* Основной счет для расчетов *//* Основной счет для расчетов */
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
select count(*) into existsCnt from VRCAccounts where VRCAccountsID=aVRCAccountsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCAccounts where VRCAccountsid=aVRCAccountsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCAccounts',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCAccounts');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCAccounts_ISLOCKED( acursession=>acursession,aROWID=>aVRCAccountsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCAccounts');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCAccounts',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCAccountsid,aLogInstanceID=>aInstanceID);
 update  VRCAccounts set ChangeStamp=sysdate
,
  BANK=aBANK
,
  acc=aacc
,
  fillial=afillial
,
  DefaultAccount=aDefaultAccount
,
  Code1C=aCode1C
  where  VRCAccountsID = aVRCAccountsID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCAccounts',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCAccounts');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCAccounts');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCAccounts',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCAccountsid,aLogInstanceID=>aInstanceID);
 insert into   VRCAccounts
 (  VRCAccountsID 
,InstanceID
,BANK

,acc

,fillial

,DefaultAccount

,Code1C

 ) values ( aVRCAccountsID 
,aInstanceID
,aBANK

,aacc

,afillial

,aDefaultAccount

,aCode1C

 ); 
 VRCAccounts_SINIT( aCURSESSION,aVRCAccountsid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCAccounts_PARENT /*Банковские реквизиты*/ (
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
  select  INSTANCEID into aParentID from VRCAccounts where  VRCAccountsid=aRowID;
 end; 


procedure VRCAccounts_ISLOCKED /*Банковские реквизиты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCAccounts where VRCAccountsid=aRowID;
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
  VRCAccounts_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCAccounts_LOCK /*Банковские реквизиты*/ (
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
 VRCAccounts_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCAccounts_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCAccounts where VRCAccountsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCAccounts');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCAccounts set LockUserID =auserID ,LockSessionID =null where VRCAccountsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCAccounts set LockUserID =null,LockSessionID =aCURSESSION  where VRCAccountsid=aRowID;
     return;
   end if;
 end ;


procedure VRCAccounts_HCL /*Банковские реквизиты*/ (
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


procedure VRCAccounts_UNLOCK /*Банковские реквизиты*/ (
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
 VRCAccounts_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCAccounts set LockUserID =null  where VRCAccountsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCAccounts set LockSessionID =null  where VRCAccountsid=aRowID;
     return;
   end if;
 end; 


procedure VRCAccounts_SINIT /*Банковские реквизиты*/ (
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
 select  SecurityStyleID into atmpID from VRCAccounts where VRCAccountsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCAccounts');
    return;
  end if;
if aSecurityStyleID is null then
 VRCAccounts_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCAccounts set securitystyleid =aStyleID where VRCAccountsid = aRowID;
else 
 update VRCAccounts set securitystyleid =aSecurityStyleID where VRCAccountsid = aRowID;
end if; 
end ; 


procedure VRCAccounts_propagate /*Банковские реквизиты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCAccounts where VRCAccountsid=aRowid;
end;



procedure VRCPayIn_BRIEF  (
 aCURSESSION CHAR,
 aVRCPayInid CHAR,
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
if aVRCPayInid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPayIn where VRCPayInID=aVRCPayInID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPayIn where VRCPayInid=aVRCPayInID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPayIn');
    return;
  end if;
  aBRIEF:=func.VRCPayIn_BRIEF_F(aVRCPayInid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPayIn_DELETE /*Оплаты*/ (
 aCURSESSION CHAR,
 aVRCPayInid CHAR,
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
select count(*) into existsCnt from VRCPayIn where VRCPayInID=aVRCPayInID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPayIn where VRCPayInid=aVRCPayInID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPayIn',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPayIn');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPayIn_ISLOCKED( acursession=>acursession,aROWID=>aVRCPayInid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPayIn');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPayIn',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPayInid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPayIn is select  instanceid ID from instance where OwnerPartName ='VRCPayIn' and OwnerRowID=aVRCPayInid;
row_VRCPayIn  chld_VRCPayIn%ROWTYPE;
begin
--open chld_VRCPayIn;
for row_VRCPayIn in chld_VRCPayIn loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPayIn.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPayIn.id);
end loop;
--close chld_VRCPayIn;
end ;
  delete from  VRCPayIn 
  where  VRCPayInID = aVRCPayInID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Оплаты*/
procedure VRCPayIn_SAVE /*Оплаты*/ (
 aCURSESSION CHAR,
 aVRCPayInid CHAR,
aInstanceID CHAR 
,aTheDocument CHAR/* Оплаты *//* Оплаты */
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
select count(*) into existsCnt from VRCPayIn where VRCPayInID=aVRCPayInID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPayIn where VRCPayInid=aVRCPayInID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPayIn',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPayIn');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPayIn_ISLOCKED( acursession=>acursession,aROWID=>aVRCPayInid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPayIn');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPayIn',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPayInid,aLogInstanceID=>aInstanceID);
 update  VRCPayIn set ChangeStamp=sysdate
,
  TheDocument=aTheDocument
  where  VRCPayInID = aVRCPayInID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPayIn',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPayIn');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPayIn');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPayIn',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPayInid,aLogInstanceID=>aInstanceID);
 insert into   VRCPayIn
 (  VRCPayInID 
,InstanceID
,TheDocument

 ) values ( aVRCPayInID 
,aInstanceID
,aTheDocument

 ); 
 VRCPayIn_SINIT( aCURSESSION,aVRCPayInid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPayIn_PARENT /*Оплаты*/ (
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
  select  INSTANCEID into aParentID from VRCPayIn where  VRCPayInid=aRowID;
 end; 


procedure VRCPayIn_ISLOCKED /*Оплаты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPayIn where VRCPayInid=aRowID;
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
  VRCPayIn_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPayIn_LOCK /*Оплаты*/ (
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
 VRCPayIn_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPayIn_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPayIn where VRCPayInid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPayIn');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPayIn set LockUserID =auserID ,LockSessionID =null where VRCPayInid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPayIn set LockUserID =null,LockSessionID =aCURSESSION  where VRCPayInid=aRowID;
     return;
   end if;
 end ;


procedure VRCPayIn_HCL /*Оплаты*/ (
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


procedure VRCPayIn_UNLOCK /*Оплаты*/ (
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
 VRCPayIn_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPayIn set LockUserID =null  where VRCPayInid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPayIn set LockSessionID =null  where VRCPayInid=aRowID;
     return;
   end if;
 end; 


procedure VRCPayIn_SINIT /*Оплаты*/ (
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
 select  SecurityStyleID into atmpID from VRCPayIn where VRCPayInid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPayIn');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPayIn_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPayIn set securitystyleid =aStyleID where VRCPayInid = aRowID;
else 
 update VRCPayIn set securitystyleid =aSecurityStyleID where VRCPayInid = aRowID;
end if; 
end ; 


procedure VRCPayIn_propagate /*Оплаты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPayIn where VRCPayInid=aRowid;
end;



procedure VRCOwnership_BRIEF  (
 aCURSESSION CHAR,
 aVRCOwnershipid CHAR,
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
if aVRCOwnershipid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCOwnership where VRCOwnershipID=aVRCOwnershipID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCOwnership where VRCOwnershipid=aVRCOwnershipID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCOwnership');
    return;
  end if;
  aBRIEF:=func.VRCOwnership_BRIEF_F(aVRCOwnershipid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCOwnership_DELETE /*Собсвенность*/ (
 aCURSESSION CHAR,
 aVRCOwnershipid CHAR,
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
select count(*) into existsCnt from VRCOwnership where VRCOwnershipID=aVRCOwnershipID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCOwnership where VRCOwnershipid=aVRCOwnershipID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCOwnership',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCOwnership');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCOwnership_ISLOCKED( acursession=>acursession,aROWID=>aVRCOwnershipid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCOwnership');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCOwnership',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCOwnershipid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCOwnership is select  instanceid ID from instance where OwnerPartName ='VRCOwnership' and OwnerRowID=aVRCOwnershipid;
row_VRCOwnership  chld_VRCOwnership%ROWTYPE;
begin
--open chld_VRCOwnership;
for row_VRCOwnership in chld_VRCOwnership loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCOwnership.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCOwnership.id);
end loop;
--close chld_VRCOwnership;
end ;
  delete from  VRCOwnership 
  where  VRCOwnershipID = aVRCOwnershipID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Собсвенность*/
procedure VRCOwnership_SAVE /*Собсвенность*/ (
 aCURSESSION CHAR,
 aVRCOwnershipid CHAR,
aInstanceID CHAR 
,aOwnedObject VARCHAR2/* Объект *//* Объект */
,aInfoSrc VARCHAR2 := null /* Источник *//* Источник */
,aTheFile VARCHAR2 := null /* Файл */
,aTheFile_EXT varchar2 /* Файл */
,aURL VARCHAR2 := null /* Ссылка *//* Ссылка */
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
select count(*) into existsCnt from VRCOwnership where VRCOwnershipID=aVRCOwnershipID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCOwnership where VRCOwnershipid=aVRCOwnershipID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCOwnership',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCOwnership');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCOwnership_ISLOCKED( acursession=>acursession,aROWID=>aVRCOwnershipid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCOwnership');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCOwnership',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCOwnershipid,aLogInstanceID=>aInstanceID);
 update  VRCOwnership set ChangeStamp=sysdate
,
  OwnedObject=aOwnedObject
,
  InfoSrc=aInfoSrc
,
  TheFile=aTheFile
,TheFile_EXT=
aTheFile_EXT 
,
  URL=aURL
  where  VRCOwnershipID = aVRCOwnershipID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCOwnership',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCOwnership');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCOwnership');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCOwnership',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCOwnershipid,aLogInstanceID=>aInstanceID);
 insert into   VRCOwnership
 (  VRCOwnershipID 
,InstanceID
,OwnedObject

,InfoSrc

,TheFile

,TheFile_EXT
,URL

 ) values ( aVRCOwnershipID 
,aInstanceID
,aOwnedObject

,aInfoSrc

,aTheFile

,aTheFile_EXT
,aURL

 ); 
 VRCOwnership_SINIT( aCURSESSION,aVRCOwnershipid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCOwnership_PARENT /*Собсвенность*/ (
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
  select  INSTANCEID into aParentID from VRCOwnership where  VRCOwnershipid=aRowID;
 end; 


procedure VRCOwnership_ISLOCKED /*Собсвенность*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCOwnership where VRCOwnershipid=aRowID;
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
  VRCOwnership_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCOwnership_LOCK /*Собсвенность*/ (
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
 VRCOwnership_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCOwnership_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCOwnership where VRCOwnershipid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCOwnership');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCOwnership set LockUserID =auserID ,LockSessionID =null where VRCOwnershipid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCOwnership set LockUserID =null,LockSessionID =aCURSESSION  where VRCOwnershipid=aRowID;
     return;
   end if;
 end ;


procedure VRCOwnership_HCL /*Собсвенность*/ (
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


procedure VRCOwnership_UNLOCK /*Собсвенность*/ (
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
 VRCOwnership_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCOwnership set LockUserID =null  where VRCOwnershipid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCOwnership set LockSessionID =null  where VRCOwnershipid=aRowID;
     return;
   end if;
 end; 


procedure VRCOwnership_SINIT /*Собсвенность*/ (
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
 select  SecurityStyleID into atmpID from VRCOwnership where VRCOwnershipid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCOwnership');
    return;
  end if;
if aSecurityStyleID is null then
 VRCOwnership_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCOwnership set securitystyleid =aStyleID where VRCOwnershipid = aRowID;
else 
 update VRCOwnership set securitystyleid =aSecurityStyleID where VRCOwnershipid = aRowID;
end if; 
end ; 


procedure VRCOwnership_propagate /*Собсвенность*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCOwnership where VRCOwnershipid=aRowid;
end;



procedure VRCGlossary_BRIEF  (
 aCURSESSION CHAR,
 aVRCGlossaryid CHAR,
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
if aVRCGlossaryid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCGlossary where VRCGlossaryID=aVRCGlossaryID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCGlossary where VRCGlossaryid=aVRCGlossaryID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCGlossary');
    return;
  end if;
  aBRIEF:=func.VRCGlossary_BRIEF_F(aVRCGlossaryid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCGlossary_DELETE /*Глоссарий*/ (
 aCURSESSION CHAR,
 aVRCGlossaryid CHAR,
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
select count(*) into existsCnt from VRCGlossary where VRCGlossaryID=aVRCGlossaryID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCGlossary where VRCGlossaryid=aVRCGlossaryID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCGlossary',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCGlossary');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCGlossary_ISLOCKED( acursession=>acursession,aROWID=>aVRCGlossaryid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCGlossary');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCGlossary',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCGlossaryid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCGlossary is select  instanceid ID from instance where OwnerPartName ='VRCGlossary' and OwnerRowID=aVRCGlossaryid;
row_VRCGlossary  chld_VRCGlossary%ROWTYPE;
begin
--open chld_VRCGlossary;
for row_VRCGlossary in chld_VRCGlossary loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCGlossary.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCGlossary.id);
end loop;
--close chld_VRCGlossary;
end ;
  delete from  VRCGlossary 
  where  VRCGlossaryID = aVRCGlossaryID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Глоссарий*/
procedure VRCGlossary_SAVE /*Глоссарий*/ (
 aCURSESSION CHAR,
 aVRCGlossaryid CHAR,
aInstanceID CHAR 
,aTerm
 VARCHAR2/* Термин *//* Термин */
,athe_Comment VARCHAR2/* Описание *//* Описание */
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
select count(*) into existsCnt from VRCGlossary where VRCGlossaryID=aVRCGlossaryID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCGlossary where VRCGlossaryid=aVRCGlossaryID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCGlossary',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCGlossary');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCGlossary_ISLOCKED( acursession=>acursession,aROWID=>aVRCGlossaryid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCGlossary');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCGlossary',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCGlossaryid,aLogInstanceID=>aInstanceID);
 update  VRCGlossary set ChangeStamp=sysdate
,
  Term=aTerm
,
  the_Comment=athe_Comment
  where  VRCGlossaryID = aVRCGlossaryID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCGlossary',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCGlossary');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCGlossary');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCGlossary',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCGlossaryid,aLogInstanceID=>aInstanceID);
 insert into   VRCGlossary
 (  VRCGlossaryID 
,InstanceID
,Term

,the_Comment

 ) values ( aVRCGlossaryID 
,aInstanceID
,aTerm

,athe_Comment

 ); 
 VRCGlossary_SINIT( aCURSESSION,aVRCGlossaryid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCGlossary_PARENT /*Глоссарий*/ (
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
  select  INSTANCEID into aParentID from VRCGlossary where  VRCGlossaryid=aRowID;
 end; 


procedure VRCGlossary_ISLOCKED /*Глоссарий*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCGlossary where VRCGlossaryid=aRowID;
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
  VRCGlossary_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCGlossary_LOCK /*Глоссарий*/ (
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
 VRCGlossary_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCGlossary_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCGlossary where VRCGlossaryid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCGlossary');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCGlossary set LockUserID =auserID ,LockSessionID =null where VRCGlossaryid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCGlossary set LockUserID =null,LockSessionID =aCURSESSION  where VRCGlossaryid=aRowID;
     return;
   end if;
 end ;


procedure VRCGlossary_HCL /*Глоссарий*/ (
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


procedure VRCGlossary_UNLOCK /*Глоссарий*/ (
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
 VRCGlossary_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCGlossary set LockUserID =null  where VRCGlossaryid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCGlossary set LockSessionID =null  where VRCGlossaryid=aRowID;
     return;
   end if;
 end; 


procedure VRCGlossary_SINIT /*Глоссарий*/ (
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
 select  SecurityStyleID into atmpID from VRCGlossary where VRCGlossaryid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCGlossary');
    return;
  end if;
if aSecurityStyleID is null then
 VRCGlossary_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCGlossary set securitystyleid =aStyleID where VRCGlossaryid = aRowID;
else 
 update VRCGlossary set securitystyleid =aSecurityStyleID where VRCGlossaryid = aRowID;
end if; 
end ; 


procedure VRCGlossary_propagate /*Глоссарий*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCGlossary where VRCGlossaryid=aRowid;
end;



procedure VRCProgress_BRIEF  (
 aCURSESSION CHAR,
 aVRCProgressid CHAR,
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
if aVRCProgressid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCProgress where VRCProgressID=aVRCProgressID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCProgress where VRCProgressid=aVRCProgressID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCProgress');
    return;
  end if;
  aBRIEF:=func.VRCProgress_BRIEF_F(aVRCProgressid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCProgress_DELETE /*Развитие компании*/ (
 aCURSESSION CHAR,
 aVRCProgressid CHAR,
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
select count(*) into existsCnt from VRCProgress where VRCProgressID=aVRCProgressID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCProgress where VRCProgressid=aVRCProgressID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCProgress',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCProgress');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCProgress_ISLOCKED( acursession=>acursession,aROWID=>aVRCProgressid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCProgress');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCProgress',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCProgressid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCProgress is select  instanceid ID from instance where OwnerPartName ='VRCProgress' and OwnerRowID=aVRCProgressid;
row_VRCProgress  chld_VRCProgress%ROWTYPE;
begin
--open chld_VRCProgress;
for row_VRCProgress in chld_VRCProgress loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCProgress.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCProgress.id);
end loop;
--close chld_VRCProgress;
end ;
  delete from  VRCProgress 
  where  VRCProgressID = aVRCProgressID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Развитие компании*/
procedure VRCProgress_SAVE /*Развитие компании*/ (
 aCURSESSION CHAR,
 aVRCProgressid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* Дата *//* Дата */
,aInfoSrc
 VARCHAR2 := null /* Источник *//* Источник */
,aInfo VARCHAR2/* Информация *//* Информация */
,aTheFile VARCHAR2 := null /* Файл */
,aTheFile_EXT varchar2 /* Файл */
,aURL VARCHAR2 := null /* Ссылка *//* Ссылка */
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
select count(*) into existsCnt from VRCProgress where VRCProgressID=aVRCProgressID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCProgress where VRCProgressid=aVRCProgressID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCProgress',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCProgress');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCProgress_ISLOCKED( acursession=>acursession,aROWID=>aVRCProgressid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCProgress');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCProgress',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCProgressid,aLogInstanceID=>aInstanceID);
 update  VRCProgress set ChangeStamp=sysdate
,
  DateOf=aDateOf
,
  InfoSrc=aInfoSrc
,
  Info=aInfo
,
  TheFile=aTheFile
,TheFile_EXT=
aTheFile_EXT 
,
  URL=aURL
  where  VRCProgressID = aVRCProgressID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCProgress',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCProgress');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCProgress');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCProgress',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCProgressid,aLogInstanceID=>aInstanceID);
 insert into   VRCProgress
 (  VRCProgressID 
,InstanceID
,DateOf

,InfoSrc

,Info

,TheFile

,TheFile_EXT
,URL

 ) values ( aVRCProgressID 
,aInstanceID
,aDateOf

,aInfoSrc

,aInfo

,aTheFile

,aTheFile_EXT
,aURL

 ); 
 VRCProgress_SINIT( aCURSESSION,aVRCProgressid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCProgress_PARENT /*Развитие компании*/ (
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
  select  INSTANCEID into aParentID from VRCProgress where  VRCProgressid=aRowID;
 end; 


procedure VRCProgress_ISLOCKED /*Развитие компании*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCProgress where VRCProgressid=aRowID;
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
  VRCProgress_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCProgress_LOCK /*Развитие компании*/ (
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
 VRCProgress_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCProgress_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCProgress where VRCProgressid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCProgress');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCProgress set LockUserID =auserID ,LockSessionID =null where VRCProgressid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCProgress set LockUserID =null,LockSessionID =aCURSESSION  where VRCProgressid=aRowID;
     return;
   end if;
 end ;


procedure VRCProgress_HCL /*Развитие компании*/ (
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


procedure VRCProgress_UNLOCK /*Развитие компании*/ (
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
 VRCProgress_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCProgress set LockUserID =null  where VRCProgressid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCProgress set LockSessionID =null  where VRCProgressid=aRowID;
     return;
   end if;
 end; 


procedure VRCProgress_SINIT /*Развитие компании*/ (
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
 select  SecurityStyleID into atmpID from VRCProgress where VRCProgressid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCProgress');
    return;
  end if;
if aSecurityStyleID is null then
 VRCProgress_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCProgress set securitystyleid =aStyleID where VRCProgressid = aRowID;
else 
 update VRCProgress set securitystyleid =aSecurityStyleID where VRCProgressid = aRowID;
end if; 
end ; 


procedure VRCProgress_propagate /*Развитие компании*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCProgress where VRCProgressid=aRowid;
end;



procedure VRCLifeSupport_BRIEF  (
 aCURSESSION CHAR,
 aVRCLifeSupportid CHAR,
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
if aVRCLifeSupportid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCLifeSupport where VRCLifeSupportID=aVRCLifeSupportID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCLifeSupport where VRCLifeSupportid=aVRCLifeSupportID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCLifeSupport');
    return;
  end if;
  aBRIEF:=func.VRCLifeSupport_BRIEF_F(aVRCLifeSupportid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCLifeSupport_DELETE /*Системы жизнеобеспечения*/ (
 aCURSESSION CHAR,
 aVRCLifeSupportid CHAR,
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
select count(*) into existsCnt from VRCLifeSupport where VRCLifeSupportID=aVRCLifeSupportID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCLifeSupport where VRCLifeSupportid=aVRCLifeSupportID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCLifeSupport',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCLifeSupport');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCLifeSupport_ISLOCKED( acursession=>acursession,aROWID=>aVRCLifeSupportid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCLifeSupport');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCLifeSupport',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCLifeSupportid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCLifeSupport is select  instanceid ID from instance where OwnerPartName ='VRCLifeSupport' and OwnerRowID=aVRCLifeSupportid;
row_VRCLifeSupport  chld_VRCLifeSupport%ROWTYPE;
begin
--open chld_VRCLifeSupport;
for row_VRCLifeSupport in chld_VRCLifeSupport loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCLifeSupport.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCLifeSupport.id);
end loop;
--close chld_VRCLifeSupport;
end ;
  delete from  VRCLifeSupport 
  where  VRCLifeSupportID = aVRCLifeSupportID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Системы жизнеобеспечения*/
procedure VRCLifeSupport_SAVE /*Системы жизнеобеспечения*/ (
 aCURSESSION CHAR,
 aVRCLifeSupportid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* Дата *//* Дата */
,aInfo VARCHAR2/* Информация *//* Информация */
,aTheFile VARCHAR2 := null /* Файл */
,aTheFile_EXT varchar2 /* Файл */
,aInfoSrc VARCHAR2 := null /* Источник *//* Источник */
,aURL VARCHAR2 := null /* Ссылка *//* Ссылка */
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
select count(*) into existsCnt from VRCLifeSupport where VRCLifeSupportID=aVRCLifeSupportID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCLifeSupport where VRCLifeSupportid=aVRCLifeSupportID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCLifeSupport',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCLifeSupport');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCLifeSupport_ISLOCKED( acursession=>acursession,aROWID=>aVRCLifeSupportid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCLifeSupport');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCLifeSupport',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCLifeSupportid,aLogInstanceID=>aInstanceID);
 update  VRCLifeSupport set ChangeStamp=sysdate
,
  DateOf=aDateOf
,
  Info=aInfo
,
  TheFile=aTheFile
,TheFile_EXT=
aTheFile_EXT 
,
  InfoSrc=aInfoSrc
,
  URL=aURL
  where  VRCLifeSupportID = aVRCLifeSupportID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCLifeSupport',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCLifeSupport');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCLifeSupport');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCLifeSupport',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCLifeSupportid,aLogInstanceID=>aInstanceID);
 insert into   VRCLifeSupport
 (  VRCLifeSupportID 
,InstanceID
,DateOf

,Info

,TheFile

,TheFile_EXT
,InfoSrc

,URL

 ) values ( aVRCLifeSupportID 
,aInstanceID
,aDateOf

,aInfo

,aTheFile

,aTheFile_EXT
,aInfoSrc

,aURL

 ); 
 VRCLifeSupport_SINIT( aCURSESSION,aVRCLifeSupportid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCLifeSupport_PARENT /*Системы жизнеобеспечения*/ (
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
  select  INSTANCEID into aParentID from VRCLifeSupport where  VRCLifeSupportid=aRowID;
 end; 


procedure VRCLifeSupport_ISLOCKED /*Системы жизнеобеспечения*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCLifeSupport where VRCLifeSupportid=aRowID;
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
  VRCLifeSupport_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCLifeSupport_LOCK /*Системы жизнеобеспечения*/ (
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
 VRCLifeSupport_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCLifeSupport_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCLifeSupport where VRCLifeSupportid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCLifeSupport');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCLifeSupport set LockUserID =auserID ,LockSessionID =null where VRCLifeSupportid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCLifeSupport set LockUserID =null,LockSessionID =aCURSESSION  where VRCLifeSupportid=aRowID;
     return;
   end if;
 end ;


procedure VRCLifeSupport_HCL /*Системы жизнеобеспечения*/ (
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


procedure VRCLifeSupport_UNLOCK /*Системы жизнеобеспечения*/ (
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
 VRCLifeSupport_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCLifeSupport set LockUserID =null  where VRCLifeSupportid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCLifeSupport set LockSessionID =null  where VRCLifeSupportid=aRowID;
     return;
   end if;
 end; 


procedure VRCLifeSupport_SINIT /*Системы жизнеобеспечения*/ (
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
 select  SecurityStyleID into atmpID from VRCLifeSupport where VRCLifeSupportid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCLifeSupport');
    return;
  end if;
if aSecurityStyleID is null then
 VRCLifeSupport_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCLifeSupport set securitystyleid =aStyleID where VRCLifeSupportid = aRowID;
else 
 update VRCLifeSupport set securitystyleid =aSecurityStyleID where VRCLifeSupportid = aRowID;
end if; 
end ; 


procedure VRCLifeSupport_propagate /*Системы жизнеобеспечения*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCLifeSupport where VRCLifeSupportid=aRowid;
end;



procedure VRCTorg_BRIEF  (
 aCURSESSION CHAR,
 aVRCTorgid CHAR,
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
if aVRCTorgid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCTorg where VRCTorgID=aVRCTorgID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCTorg where VRCTorgid=aVRCTorgID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCTorg');
    return;
  end if;
  aBRIEF:=func.VRCTorg_BRIEF_F(aVRCTorgid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCTorg_DELETE /*Точки доставки*/ (
 aCURSESSION CHAR,
 aVRCTorgid CHAR,
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
select count(*) into existsCnt from VRCTorg where VRCTorgID=aVRCTorgID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCTorg where VRCTorgid=aVRCTorgID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCTorg',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCTorg');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCTorg_ISLOCKED( acursession=>acursession,aROWID=>aVRCTorgid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCTorg');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCTorg',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCTorgid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCTorg is select  instanceid ID from instance where OwnerPartName ='VRCTorg' and OwnerRowID=aVRCTorgid;
row_VRCTorg  chld_VRCTorg%ROWTYPE;
begin
--open chld_VRCTorg;
for row_VRCTorg in chld_VRCTorg loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCTorg.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCTorg.id);
end loop;
--close chld_VRCTorg;
end ;
  delete from  VRCTorg 
  where  VRCTorgID = aVRCTorgID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Точки доставки*/
procedure VRCTorg_SAVE /*Точки доставки*/ (
 aCURSESSION CHAR,
 aVRCTorgid CHAR,
aInstanceID CHAR 
,aAddress VARCHAR2/* Адрес *//* Адрес */
,aname
 VARCHAR2/* Название *//* Название */
,aReg CHAR := null /* Район доставки *//* Район доставки */
,aTown CHAR := null /* Город *//* Город */
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
select count(*) into existsCnt from VRCTorg where VRCTorgID=aVRCTorgID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCTorg where VRCTorgid=aVRCTorgID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCTorg',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCTorg');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCTorg_ISLOCKED( acursession=>acursession,aROWID=>aVRCTorgid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCTorg');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCTorg',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCTorgid,aLogInstanceID=>aInstanceID);
 update  VRCTorg set ChangeStamp=sysdate
,
  Address=aAddress
,
  name=aname
,
  Reg=aReg
,
  Town=aTown
  where  VRCTorgID = aVRCTorgID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCTorg',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCTorg');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCTorg');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCTorg',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCTorgid,aLogInstanceID=>aInstanceID);
 insert into   VRCTorg
 (  VRCTorgID 
,InstanceID
,Address

,name

,Reg

,Town

 ) values ( aVRCTorgID 
,aInstanceID
,aAddress

,aname

,aReg

,aTown

 ); 
 VRCTorg_SINIT( aCURSESSION,aVRCTorgid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCTorg_PARENT /*Точки доставки*/ (
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
  select  INSTANCEID into aParentID from VRCTorg where  VRCTorgid=aRowID;
 end; 


procedure VRCTorg_ISLOCKED /*Точки доставки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCTorg where VRCTorgid=aRowID;
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
  VRCTorg_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCTorg_LOCK /*Точки доставки*/ (
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
 VRCTorg_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCTorg_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCTorg where VRCTorgid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCTorg');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCTorg set LockUserID =auserID ,LockSessionID =null where VRCTorgid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCTorg set LockUserID =null,LockSessionID =aCURSESSION  where VRCTorgid=aRowID;
     return;
   end if;
 end ;


procedure VRCTorg_HCL /*Точки доставки*/ (
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


procedure VRCTorg_UNLOCK /*Точки доставки*/ (
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
 VRCTorg_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCTorg set LockUserID =null  where VRCTorgid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCTorg set LockSessionID =null  where VRCTorgid=aRowID;
     return;
   end if;
 end; 


procedure VRCTorg_SINIT /*Точки доставки*/ (
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
 select  SecurityStyleID into atmpID from VRCTorg where VRCTorgid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCTorg');
    return;
  end if;
if aSecurityStyleID is null then
 VRCTorg_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCTorg set securitystyleid =aStyleID where VRCTorgid = aRowID;
else 
 update VRCTorg set securitystyleid =aSecurityStyleID where VRCTorgid = aRowID;
end if; 
end ; 


procedure VRCTorg_propagate /*Точки доставки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCTorg where VRCTorgid=aRowid;
end;



procedure VRCZayavki_BRIEF  (
 aCURSESSION CHAR,
 aVRCZayavkiid CHAR,
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
if aVRCZayavkiid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCZayavki where VRCZayavkiID=aVRCZayavkiID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCZayavki where VRCZayavkiid=aVRCZayavkiID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCZayavki');
    return;
  end if;
  aBRIEF:=func.VRCZayavki_BRIEF_F(aVRCZayavkiid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCZayavki_DELETE /*Заявки*/ (
 aCURSESSION CHAR,
 aVRCZayavkiid CHAR,
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
select count(*) into existsCnt from VRCZayavki where VRCZayavkiID=aVRCZayavkiID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCZayavki where VRCZayavkiid=aVRCZayavkiID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCZayavki',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCZayavki');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCZayavki_ISLOCKED( acursession=>acursession,aROWID=>aVRCZayavkiid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCZayavki');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCZayavki',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCZayavkiid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCZayavki is select  instanceid ID from instance where OwnerPartName ='VRCZayavki' and OwnerRowID=aVRCZayavkiid;
row_VRCZayavki  chld_VRCZayavki%ROWTYPE;
begin
--open chld_VRCZayavki;
for row_VRCZayavki in chld_VRCZayavki loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCZayavki.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCZayavki.id);
end loop;
--close chld_VRCZayavki;
end ;
  delete from  VRCZayavki 
  where  VRCZayavkiID = aVRCZayavkiID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Заявки*/
procedure VRCZayavki_SAVE /*Заявки*/ (
 aCURSESSION CHAR,
 aVRCZayavkiid CHAR,
aInstanceID CHAR 
,aTheDocument CHAR/* Заявка *//* Заявка */
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
select count(*) into existsCnt from VRCZayavki where VRCZayavkiID=aVRCZayavkiID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCZayavki where VRCZayavkiid=aVRCZayavkiID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCZayavki',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCZayavki');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCZayavki_ISLOCKED( acursession=>acursession,aROWID=>aVRCZayavkiid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCZayavki');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCZayavki',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCZayavkiid,aLogInstanceID=>aInstanceID);
 update  VRCZayavki set ChangeStamp=sysdate
,
  TheDocument=aTheDocument
  where  VRCZayavkiID = aVRCZayavkiID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCZayavki',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCZayavki');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCZayavki');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCZayavki',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCZayavkiid,aLogInstanceID=>aInstanceID);
 insert into   VRCZayavki
 (  VRCZayavkiID 
,InstanceID
,TheDocument

 ) values ( aVRCZayavkiID 
,aInstanceID
,aTheDocument

 ); 
 VRCZayavki_SINIT( aCURSESSION,aVRCZayavkiid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCZayavki_PARENT /*Заявки*/ (
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
  select  INSTANCEID into aParentID from VRCZayavki where  VRCZayavkiid=aRowID;
 end; 


procedure VRCZayavki_ISLOCKED /*Заявки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCZayavki where VRCZayavkiid=aRowID;
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
  VRCZayavki_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCZayavki_LOCK /*Заявки*/ (
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
 VRCZayavki_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCZayavki_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCZayavki where VRCZayavkiid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCZayavki');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCZayavki set LockUserID =auserID ,LockSessionID =null where VRCZayavkiid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCZayavki set LockUserID =null,LockSessionID =aCURSESSION  where VRCZayavkiid=aRowID;
     return;
   end if;
 end ;


procedure VRCZayavki_HCL /*Заявки*/ (
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


procedure VRCZayavki_UNLOCK /*Заявки*/ (
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
 VRCZayavki_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCZayavki set LockUserID =null  where VRCZayavkiid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCZayavki set LockSessionID =null  where VRCZayavkiid=aRowID;
     return;
   end if;
 end; 


procedure VRCZayavki_SINIT /*Заявки*/ (
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
 select  SecurityStyleID into atmpID from VRCZayavki where VRCZayavkiid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCZayavki');
    return;
  end if;
if aSecurityStyleID is null then
 VRCZayavki_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCZayavki set securitystyleid =aStyleID where VRCZayavkiid = aRowID;
else 
 update VRCZayavki set securitystyleid =aSecurityStyleID where VRCZayavkiid = aRowID;
end if; 
end ; 


procedure VRCZayavki_propagate /*Заявки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCZayavki where VRCZayavkiid=aRowid;
end;



procedure VRCAutomatizations_BRIEF  (
 aCURSESSION CHAR,
 aVRCAutomatizationsid CHAR,
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
if aVRCAutomatizationsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCAutomatizations where VRCAutomatizationsID=aVRCAutomatizationsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCAutomatizations where VRCAutomatizationsid=aVRCAutomatizationsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCAutomatizations');
    return;
  end if;
  aBRIEF:=func.VRCAutomatizations_BRIEF_F(aVRCAutomatizationsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCAutomatizations_DELETE /*Автоматизация*/ (
 aCURSESSION CHAR,
 aVRCAutomatizationsid CHAR,
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
select count(*) into existsCnt from VRCAutomatizations where VRCAutomatizationsID=aVRCAutomatizationsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCAutomatizations where VRCAutomatizationsid=aVRCAutomatizationsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCAutomatizations',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCAutomatizations');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCAutomatizations_ISLOCKED( acursession=>acursession,aROWID=>aVRCAutomatizationsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCAutomatizations');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCAutomatizations',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCAutomatizationsid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCAutomatizations is select  instanceid ID from instance where OwnerPartName ='VRCAutomatizations' and OwnerRowID=aVRCAutomatizationsid;
row_VRCAutomatizations  chld_VRCAutomatizations%ROWTYPE;
begin
--open chld_VRCAutomatizations;
for row_VRCAutomatizations in chld_VRCAutomatizations loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCAutomatizations.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCAutomatizations.id);
end loop;
--close chld_VRCAutomatizations;
end ;
  delete from  VRCAutomatizations 
  where  VRCAutomatizationsID = aVRCAutomatizationsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Автоматизация*/
procedure VRCAutomatizations_SAVE /*Автоматизация*/ (
 aCURSESSION CHAR,
 aVRCAutomatizationsid CHAR,
aInstanceID CHAR 
,aRecDate
 DATE/* Дата *//* Дата */
,aInfo VARCHAR2 := null /* Информация *//* Информация */
,aTheFile VARCHAR2 := null /* Файл */
,aTheFile_EXT varchar2 /* Файл */
,aInfoSrc VARCHAR2 := null /* Источник *//* Источник */
,aInfoUrl VARCHAR2 := null /* Ссылка *//* Ссылка */
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
select count(*) into existsCnt from VRCAutomatizations where VRCAutomatizationsID=aVRCAutomatizationsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCAutomatizations where VRCAutomatizationsid=aVRCAutomatizationsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCAutomatizations',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCAutomatizations');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCAutomatizations_ISLOCKED( acursession=>acursession,aROWID=>aVRCAutomatizationsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCAutomatizations');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCAutomatizations',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCAutomatizationsid,aLogInstanceID=>aInstanceID);
 update  VRCAutomatizations set ChangeStamp=sysdate
,
  RecDate=aRecDate
,
  Info=aInfo
,
  TheFile=aTheFile
,TheFile_EXT=
aTheFile_EXT 
,
  InfoSrc=aInfoSrc
,
  InfoUrl=aInfoUrl
  where  VRCAutomatizationsID = aVRCAutomatizationsID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCAutomatizations',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCAutomatizations');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCAutomatizations');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCAutomatizations',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCAutomatizationsid,aLogInstanceID=>aInstanceID);
 insert into   VRCAutomatizations
 (  VRCAutomatizationsID 
,InstanceID
,RecDate

,Info

,TheFile

,TheFile_EXT
,InfoSrc

,InfoUrl

 ) values ( aVRCAutomatizationsID 
,aInstanceID
,aRecDate

,aInfo

,aTheFile

,aTheFile_EXT
,aInfoSrc

,aInfoUrl

 ); 
 VRCAutomatizations_SINIT( aCURSESSION,aVRCAutomatizationsid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCAutomatizations_PARENT /*Автоматизация*/ (
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
  select  INSTANCEID into aParentID from VRCAutomatizations where  VRCAutomatizationsid=aRowID;
 end; 


procedure VRCAutomatizations_ISLOCKED /*Автоматизация*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCAutomatizations where VRCAutomatizationsid=aRowID;
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
  VRCAutomatizations_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCAutomatizations_LOCK /*Автоматизация*/ (
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
 VRCAutomatizations_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCAutomatizations_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCAutomatizations where VRCAutomatizationsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCAutomatizations');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCAutomatizations set LockUserID =auserID ,LockSessionID =null where VRCAutomatizationsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCAutomatizations set LockUserID =null,LockSessionID =aCURSESSION  where VRCAutomatizationsid=aRowID;
     return;
   end if;
 end ;


procedure VRCAutomatizations_HCL /*Автоматизация*/ (
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


procedure VRCAutomatizations_UNLOCK /*Автоматизация*/ (
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
 VRCAutomatizations_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCAutomatizations set LockUserID =null  where VRCAutomatizationsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCAutomatizations set LockSessionID =null  where VRCAutomatizationsid=aRowID;
     return;
   end if;
 end; 


procedure VRCAutomatizations_SINIT /*Автоматизация*/ (
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
 select  SecurityStyleID into atmpID from VRCAutomatizations where VRCAutomatizationsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCAutomatizations');
    return;
  end if;
if aSecurityStyleID is null then
 VRCAutomatizations_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCAutomatizations set securitystyleid =aStyleID where VRCAutomatizationsid = aRowID;
else 
 update VRCAutomatizations set securitystyleid =aSecurityStyleID where VRCAutomatizationsid = aRowID;
end if; 
end ; 


procedure VRCAutomatizations_propagate /*Автоматизация*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCAutomatizations where VRCAutomatizationsid=aRowid;
end;



procedure VRCReport_BRIEF  (
 aCURSESSION CHAR,
 aVRCReportid CHAR,
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
if aVRCReportid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCReport where VRCReportID=aVRCReportID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCReport where VRCReportid=aVRCReportID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCReport');
    return;
  end if;
  aBRIEF:=func.VRCReport_BRIEF_F(aVRCReportid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCReport_DELETE /*Отчеты*/ (
 aCURSESSION CHAR,
 aVRCReportid CHAR,
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
select count(*) into existsCnt from VRCReport where VRCReportID=aVRCReportID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCReport where VRCReportid=aVRCReportID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCReport',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCReport');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCReport_ISLOCKED( acursession=>acursession,aROWID=>aVRCReportid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCReport');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCReport',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCReportid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCReport is select  instanceid ID from instance where OwnerPartName ='VRCReport' and OwnerRowID=aVRCReportid;
row_VRCReport  chld_VRCReport%ROWTYPE;
begin
--open chld_VRCReport;
for row_VRCReport in chld_VRCReport loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCReport.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCReport.id);
end loop;
--close chld_VRCReport;
end ;
  delete from  VRCReport 
  where  VRCReportID = aVRCReportID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Отчеты*/
procedure VRCReport_SAVE /*Отчеты*/ (
 aCURSESSION CHAR,
 aVRCReportid CHAR,
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
select count(*) into existsCnt from VRCReport where VRCReportID=aVRCReportID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCReport where VRCReportid=aVRCReportID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCReport',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCReport');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCReport_ISLOCKED( acursession=>acursession,aROWID=>aVRCReportid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCReport');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCReport',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCReportid,aLogInstanceID=>aInstanceID);
 update  VRCReport set ChangeStamp=sysdate
,
  Report=aReport
  where  VRCReportID = aVRCReportID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCReport',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCReport');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCReport');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCReport',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCReportid,aLogInstanceID=>aInstanceID);
 insert into   VRCReport
 (  VRCReportID 
,InstanceID
,Report

 ) values ( aVRCReportID 
,aInstanceID
,aReport

 ); 
 VRCReport_SINIT( aCURSESSION,aVRCReportid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCReport_PARENT /*Отчеты*/ (
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
  select  INSTANCEID into aParentID from VRCReport where  VRCReportid=aRowID;
 end; 


procedure VRCReport_ISLOCKED /*Отчеты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCReport where VRCReportid=aRowID;
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
  VRCReport_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCReport_LOCK /*Отчеты*/ (
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
 VRCReport_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCReport_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCReport where VRCReportid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCReport');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCReport set LockUserID =auserID ,LockSessionID =null where VRCReportid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCReport set LockUserID =null,LockSessionID =aCURSESSION  where VRCReportid=aRowID;
     return;
   end if;
 end ;


procedure VRCReport_HCL /*Отчеты*/ (
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


procedure VRCReport_UNLOCK /*Отчеты*/ (
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
 VRCReport_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCReport set LockUserID =null  where VRCReportid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCReport set LockSessionID =null  where VRCReportid=aRowID;
     return;
   end if;
 end; 


procedure VRCReport_SINIT /*Отчеты*/ (
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
 select  SecurityStyleID into atmpID from VRCReport where VRCReportid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCReport');
    return;
  end if;
if aSecurityStyleID is null then
 VRCReport_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCReport set securitystyleid =aStyleID where VRCReportid = aRowID;
else 
 update VRCReport set securitystyleid =aSecurityStyleID where VRCReportid = aRowID;
end if; 
end ; 


procedure VRCReport_propagate /*Отчеты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCReport where VRCReportid=aRowid;
end;



procedure VRCAditional_BRIEF  (
 aCURSESSION CHAR,
 aVRCAditionalid CHAR,
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
if aVRCAditionalid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCAditional where VRCAditionalID=aVRCAditionalID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCAditional where VRCAditionalid=aVRCAditionalID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCAditional');
    return;
  end if;
  aBRIEF:=func.VRCAditional_BRIEF_F(aVRCAditionalid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCAditional_DELETE /*Доп. информация*/ (
 aCURSESSION CHAR,
 aVRCAditionalid CHAR,
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
select count(*) into existsCnt from VRCAditional where VRCAditionalID=aVRCAditionalID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCAditional where VRCAditionalid=aVRCAditionalID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCAditional',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCAditional');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCAditional_ISLOCKED( acursession=>acursession,aROWID=>aVRCAditionalid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCAditional');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCAditional',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCAditionalid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCAditional is select  instanceid ID from instance where OwnerPartName ='VRCAditional' and OwnerRowID=aVRCAditionalid;
row_VRCAditional  chld_VRCAditional%ROWTYPE;
begin
--open chld_VRCAditional;
for row_VRCAditional in chld_VRCAditional loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCAditional.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCAditional.id);
end loop;
--close chld_VRCAditional;
end ;
  delete from  VRCAditional 
  where  VRCAditionalID = aVRCAditionalID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Доп. информация*/
procedure VRCAditional_SAVE /*Доп. информация*/ (
 aCURSESSION CHAR,
 aVRCAditionalid CHAR,
aInstanceID CHAR 
,aKPP
 VARCHAR2 := null /* КПП *//* КПП */
,aCountry CHAR := null /* Страна *//* Страна */
,atown CHAR := null /* Город *//* Город */
,adistrict
 VARCHAR2 := null /* Район *//* Район */
,auraddr VARCHAR2 := null /* Юридический адрес *//* Юридический адрес */
,aurphone
 VARCHAR2 := null /* Телефон по юр. адресу *//* Телефон по юр. адресу */
,aregdate
 DATE := null /* Дата регистрации *//* Дата регистрации */
,aregby CHAR := null /* Кем зарегистрирован *//* Кем зарегистрирован */
,aclitype CHAR := null /* Тип клиента *//* Тип клиента */
,aStream CHAR := null /* Направление деяельности *//* Направление деяельности */
,aWEBSite VARCHAR2 := null /* WEB узел *//* WEB узел */
,acreditlimit
 NUMBER := null /* Лимит кредита *//* Лимит кредита */
,amaxcreditlen
 NUMBER := null /* Длительность кредита *//* Длительность кредита */
,avop CHAR := null /* Основной вид оплаты *//* Основной вид оплаты */
,atownphonecode
 VARCHAR2 := null /* Телефонный код  *//* Телефонный код  */
,aPOSTINDEX
 VARCHAR2 := null /* Почтовый индекс *//* Почтовый индекс */
,aphone2
 VARCHAR2 := null /* Телефон 2 *//* Телефон 2 */
,aOKONH
 VARCHAR2 := null /* ОКОНХ *//* ОКОНХ */
,aOKPO
 VARCHAR2 := null /* ОКПО *//* ОКПО */
,aregsved
 VARCHAR2 := null /* Номер свидетельства орегистрации *//* Номер свидетельства орегистрации */
,aprtype CHAR := null /* Тип производства *//* Тип производства */
,aConcurent
 NUMBER := null /* Конкурент *//* Конкурент */
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
select count(*) into existsCnt from VRCAditional where VRCAditionalID=aVRCAditionalID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCAditional where VRCAditionalid=aVRCAditionalID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCAditional',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCAditional');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCAditional_ISLOCKED( acursession=>acursession,aROWID=>aVRCAditionalid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCAditional');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCAditional',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCAditionalid,aLogInstanceID=>aInstanceID);
 update  VRCAditional set ChangeStamp=sysdate
,
  KPP=aKPP
,
  Country=aCountry
,
  town=atown
,
  district=adistrict
,
  uraddr=auraddr
,
  urphone=aurphone
,
  regdate=aregdate
,
  regby=aregby
,
  clitype=aclitype
,
  Stream=aStream
,
  WEBSite=aWEBSite
,
  creditlimit=acreditlimit
,
  maxcreditlen=amaxcreditlen
,
  vop=avop
,
  townphonecode=atownphonecode
,
  POSTINDEX=aPOSTINDEX
,
  phone2=aphone2
,
  OKONH=aOKONH
,
  OKPO=aOKPO
,
  regsved=aregsved
,
  prtype=aprtype
,
  Concurent=aConcurent
  where  VRCAditionalID = aVRCAditionalID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCAditional',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCAditional');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCAditional');
    return;
  end if;
select Count(*) into existsCnt from VRCAditional where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <VRCAditional>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCAditional',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCAditionalid,aLogInstanceID=>aInstanceID);
 insert into   VRCAditional
 (  VRCAditionalID 
,InstanceID
,KPP

,Country

,town

,district

,uraddr

,urphone

,regdate

,regby

,clitype

,Stream

,WEBSite

,creditlimit

,maxcreditlen

,vop

,townphonecode

,POSTINDEX

,phone2

,OKONH

,OKPO

,regsved

,prtype

,Concurent

 ) values ( aVRCAditionalID 
,aInstanceID
,aKPP

,aCountry

,atown

,adistrict

,auraddr

,aurphone

,aregdate

,aregby

,aclitype

,aStream

,aWEBSite

,acreditlimit

,amaxcreditlen

,avop

,atownphonecode

,aPOSTINDEX

,aphone2

,aOKONH

,aOKPO

,aregsved

,aprtype

,aConcurent

 ); 
 VRCAditional_SINIT( aCURSESSION,aVRCAditionalid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCAditional_PARENT /*Доп. информация*/ (
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
  select  INSTANCEID into aParentID from VRCAditional where  VRCAditionalid=aRowID;
 end; 


procedure VRCAditional_ISLOCKED /*Доп. информация*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCAditional where VRCAditionalid=aRowID;
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
  VRCAditional_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCAditional_LOCK /*Доп. информация*/ (
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
 VRCAditional_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCAditional_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCAditional where VRCAditionalid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCAditional');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCAditional set LockUserID =auserID ,LockSessionID =null where VRCAditionalid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCAditional set LockUserID =null,LockSessionID =aCURSESSION  where VRCAditionalid=aRowID;
     return;
   end if;
 end ;


procedure VRCAditional_HCL /*Доп. информация*/ (
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


procedure VRCAditional_UNLOCK /*Доп. информация*/ (
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
 VRCAditional_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCAditional set LockUserID =null  where VRCAditionalid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCAditional set LockSessionID =null  where VRCAditionalid=aRowID;
     return;
   end if;
 end; 


procedure VRCAditional_SINIT /*Доп. информация*/ (
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
 select  SecurityStyleID into atmpID from VRCAditional where VRCAditionalid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCAditional');
    return;
  end if;
if aSecurityStyleID is null then
 VRCAditional_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCAditional set securitystyleid =aStyleID where VRCAditionalid = aRowID;
else 
 update VRCAditional set securitystyleid =aSecurityStyleID where VRCAditionalid = aRowID;
end if; 
end ; 


procedure VRCAditional_propagate /*Доп. информация*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCAditional where VRCAditionalid=aRowid;
end;



procedure VRCPayOut_BRIEF  (
 aCURSESSION CHAR,
 aVRCPayOutid CHAR,
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
if aVRCPayOutid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPayOut where VRCPayOutID=aVRCPayOutID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPayOut where VRCPayOutid=aVRCPayOutID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPayOut');
    return;
  end if;
  aBRIEF:=func.VRCPayOut_BRIEF_F(aVRCPayOutid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPayOut_DELETE /*Платежи*/ (
 aCURSESSION CHAR,
 aVRCPayOutid CHAR,
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
select count(*) into existsCnt from VRCPayOut where VRCPayOutID=aVRCPayOutID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPayOut where VRCPayOutid=aVRCPayOutID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPayOut',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPayOut');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPayOut_ISLOCKED( acursession=>acursession,aROWID=>aVRCPayOutid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPayOut');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPayOut',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPayOutid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPayOut is select  instanceid ID from instance where OwnerPartName ='VRCPayOut' and OwnerRowID=aVRCPayOutid;
row_VRCPayOut  chld_VRCPayOut%ROWTYPE;
begin
--open chld_VRCPayOut;
for row_VRCPayOut in chld_VRCPayOut loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPayOut.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPayOut.id);
end loop;
--close chld_VRCPayOut;
end ;
  delete from  VRCPayOut 
  where  VRCPayOutID = aVRCPayOutID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Платежи*/
procedure VRCPayOut_SAVE /*Платежи*/ (
 aCURSESSION CHAR,
 aVRCPayOutid CHAR,
aInstanceID CHAR 
,aTheDocument CHAR/* Платеж *//* Платеж */
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
select count(*) into existsCnt from VRCPayOut where VRCPayOutID=aVRCPayOutID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPayOut where VRCPayOutid=aVRCPayOutID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPayOut',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPayOut');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPayOut_ISLOCKED( acursession=>acursession,aROWID=>aVRCPayOutid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPayOut');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPayOut',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPayOutid,aLogInstanceID=>aInstanceID);
 update  VRCPayOut set ChangeStamp=sysdate
,
  TheDocument=aTheDocument
  where  VRCPayOutID = aVRCPayOutID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPayOut',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPayOut');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPayOut');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPayOut',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPayOutid,aLogInstanceID=>aInstanceID);
 insert into   VRCPayOut
 (  VRCPayOutID 
,InstanceID
,TheDocument

 ) values ( aVRCPayOutID 
,aInstanceID
,aTheDocument

 ); 
 VRCPayOut_SINIT( aCURSESSION,aVRCPayOutid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPayOut_PARENT /*Платежи*/ (
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
  select  INSTANCEID into aParentID from VRCPayOut where  VRCPayOutid=aRowID;
 end; 


procedure VRCPayOut_ISLOCKED /*Платежи*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPayOut where VRCPayOutid=aRowID;
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
  VRCPayOut_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPayOut_LOCK /*Платежи*/ (
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
 VRCPayOut_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPayOut_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPayOut where VRCPayOutid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPayOut');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPayOut set LockUserID =auserID ,LockSessionID =null where VRCPayOutid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPayOut set LockUserID =null,LockSessionID =aCURSESSION  where VRCPayOutid=aRowID;
     return;
   end if;
 end ;


procedure VRCPayOut_HCL /*Платежи*/ (
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


procedure VRCPayOut_UNLOCK /*Платежи*/ (
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
 VRCPayOut_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPayOut set LockUserID =null  where VRCPayOutid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPayOut set LockSessionID =null  where VRCPayOutid=aRowID;
     return;
   end if;
 end; 


procedure VRCPayOut_SINIT /*Платежи*/ (
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
 select  SecurityStyleID into atmpID from VRCPayOut where VRCPayOutid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPayOut');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPayOut_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPayOut set securitystyleid =aStyleID where VRCPayOutid = aRowID;
else 
 update VRCPayOut set securitystyleid =aSecurityStyleID where VRCPayOutid = aRowID;
end if; 
end ; 


procedure VRCPayOut_propagate /*Платежи*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPayOut where VRCPayOutid=aRowid;
end;



procedure VCContract_BRIEF  (
 aCURSESSION CHAR,
 aVCContractid CHAR,
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
if aVCContractid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VCContract where VCContractID=aVCContractID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VCContract where VCContractid=aVCContractID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VCContract');
    return;
  end if;
  aBRIEF:=func.VCContract_BRIEF_F(aVCContractid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VCContract_DELETE /*Договор*/ (
 aCURSESSION CHAR,
 aVCContractid CHAR,
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
select count(*) into existsCnt from VCContract where VCContractID=aVCContractID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VCContract where VCContractid=aVCContractID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VCContract',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VCContract');
      return;
    end if;
  end if;
 --  verify lock  --
 VCContract_ISLOCKED( acursession=>acursession,aROWID=>aVCContractid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VCContract');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VCContract',
 aVERB=>'DELETEROW',  aThe_Resource=>aVCContractid, aLogInstanceID=>aInstanceID);
declare cursor chld_VCContract is select  instanceid ID from instance where OwnerPartName ='VCContract' and OwnerRowID=aVCContractid;
row_VCContract  chld_VCContract%ROWTYPE;
begin
--open chld_VCContract;
for row_VCContract in chld_VCContract loop
 Kernel.INSTANCE_OWNER (acursession,row_VCContract.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VCContract.id);
end loop;
--close chld_VCContract;
end ;
  delete from  VCContract 
  where  VCContractID = aVCContractID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Договор*/
procedure VCContract_SAVE /*Договор*/ (
 aCURSESSION CHAR,
 aVCContractid CHAR,
aInstanceID CHAR 
,aContract CHAR/* Договор *//* Договор */
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
select count(*) into existsCnt from VCContract where VCContractID=aVCContractID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VCContract where VCContractid=aVCContractID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VCContract',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VCContract');
      return;
    end if;
  end if;
 --  verify lock  --
 VCContract_ISLOCKED( acursession=>acursession,aROWID=>aVCContractid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VCContract');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VCContract',
 aVERB=>'EDITROW',  aThe_Resource=>aVCContractid,aLogInstanceID=>aInstanceID);
 update  VCContract set ChangeStamp=sysdate
,
  Contract=aContract
  where  VCContractID = aVCContractID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VCContract',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VCContract');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VCContract');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VCContract',
 aVERB=>'CREATEROW',  aThe_Resource=>aVCContractid,aLogInstanceID=>aInstanceID);
 insert into   VCContract
 (  VCContractID 
,InstanceID
,Contract

 ) values ( aVCContractID 
,aInstanceID
,aContract

 ); 
 VCContract_SINIT( aCURSESSION,aVCContractid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VCContract_PARENT /*Договор*/ (
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
  select  INSTANCEID into aParentID from VCContract where  VCContractid=aRowID;
 end; 


procedure VCContract_ISLOCKED /*Договор*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VCContract where VCContractid=aRowID;
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
  VCContract_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VCContract_LOCK /*Договор*/ (
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
 VCContract_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VCContract_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VCContract where VCContractid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VCContract');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VCContract set LockUserID =auserID ,LockSessionID =null where VCContractid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VCContract set LockUserID =null,LockSessionID =aCURSESSION  where VCContractid=aRowID;
     return;
   end if;
 end ;


procedure VCContract_HCL /*Договор*/ (
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


procedure VCContract_UNLOCK /*Договор*/ (
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
 VCContract_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VCContract set LockUserID =null  where VCContractid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VCContract set LockSessionID =null  where VCContractid=aRowID;
     return;
   end if;
 end; 


procedure VCContract_SINIT /*Договор*/ (
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
 select  SecurityStyleID into atmpID from VCContract where VCContractid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VCContract');
    return;
  end if;
if aSecurityStyleID is null then
 VCContract_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VCContract set securitystyleid =aStyleID where VCContractid = aRowID;
else 
 update VCContract set securitystyleid =aSecurityStyleID where VCContractid = aRowID;
end if; 
end ; 


procedure VCContract_propagate /*Договор*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VCContract where VCContractid=aRowid;
end;



procedure VRCOrgStruct_BRIEF  (
 aCURSESSION CHAR,
 aVRCOrgStructid CHAR,
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
if aVRCOrgStructid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCOrgStruct where VRCOrgStructID=aVRCOrgStructID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCOrgStruct where VRCOrgStructid=aVRCOrgStructID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCOrgStruct');
    return;
  end if;
  aBRIEF:=func.VRCOrgStruct_BRIEF_F(aVRCOrgStructid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCOrgStruct_DELETE /*Структура компании*/ (
 aCURSESSION CHAR,
 aVRCOrgStructid CHAR,
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
select count(*) into existsCnt from VRCOrgStruct where VRCOrgStructID=aVRCOrgStructID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCOrgStruct where VRCOrgStructid=aVRCOrgStructID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCOrgStruct',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCOrgStruct');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCOrgStruct_ISLOCKED( acursession=>acursession,aROWID=>aVRCOrgStructid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCOrgStruct');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCOrgStruct',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCOrgStructid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCOrgStruct is select  instanceid ID from instance where OwnerPartName ='VRCOrgStruct' and OwnerRowID=aVRCOrgStructid;
row_VRCOrgStruct  chld_VRCOrgStruct%ROWTYPE;
begin
--open chld_VRCOrgStruct;
for row_VRCOrgStruct in chld_VRCOrgStruct loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCOrgStruct.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCOrgStruct.id);
end loop;
--close chld_VRCOrgStruct;
end ;
  delete from  VRCOrgStruct 
  where  VRCOrgStructID = aVRCOrgStructID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Структура компании*/
procedure VRCOrgStruct_SAVE /*Структура компании*/ (
 aCURSESSION CHAR,
 aVRCOrgStructid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aVRCDepartment
 VARCHAR2/* Подразделение *//* Подразделение */
,aDepChief CHAR := null /* Начальник *//* Начальник */
,aPhone
 VARCHAR2 := null /* Телефон *//* Телефон */
,athe_comment VARCHAR2 := null /* Примечание *//* Примечание */
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
select count(*) into existsCnt from VRCOrgStruct where VRCOrgStructID=aVRCOrgStructID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCOrgStruct where VRCOrgStructid=aVRCOrgStructID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCOrgStruct',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCOrgStruct');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCOrgStruct_ISLOCKED( acursession=>acursession,aROWID=>aVRCOrgStructid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCOrgStruct');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCOrgStruct',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCOrgStructid,aLogInstanceID=>aInstanceID);
 update  VRCOrgStruct set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  VRCDepartment=aVRCDepartment
,
  DepChief=aDepChief
,
  Phone=aPhone
,
  the_comment=athe_comment
  where  VRCOrgStructID = aVRCOrgStructID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCOrgStruct',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCOrgStruct');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCOrgStruct');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCOrgStruct',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCOrgStructid,aLogInstanceID=>aInstanceID);
 insert into   VRCOrgStruct
 (  VRCOrgStructID 
,ParentRowid
,InstanceID
,VRCDepartment

,DepChief

,Phone

,the_comment

 ) values ( aVRCOrgStructID 
,aParentRowid
,aInstanceID
,aVRCDepartment

,aDepChief

,aPhone

,athe_comment

 ); 
 VRCOrgStruct_SINIT( aCURSESSION,aVRCOrgStructid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCOrgStruct_PARENT /*Структура компании*/ (
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
  select  INSTANCEID into aParentID from VRCOrgStruct where  VRCOrgStructid=aRowID;
 end; 


procedure VRCOrgStruct_ISLOCKED /*Структура компании*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCOrgStruct where VRCOrgStructid=aRowID;
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
  VRCOrgStruct_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCOrgStruct_LOCK /*Структура компании*/ (
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
 VRCOrgStruct_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCOrgStruct_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCOrgStruct where VRCOrgStructid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCOrgStruct');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCOrgStruct set LockUserID =auserID ,LockSessionID =null where VRCOrgStructid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCOrgStruct set LockUserID =null,LockSessionID =aCURSESSION  where VRCOrgStructid=aRowID;
     return;
   end if;
 end ;


procedure VRCOrgStruct_HCL /*Структура компании*/ (
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


procedure VRCOrgStruct_UNLOCK /*Структура компании*/ (
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
 VRCOrgStruct_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCOrgStruct set LockUserID =null  where VRCOrgStructid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCOrgStruct set LockSessionID =null  where VRCOrgStructid=aRowID;
     return;
   end if;
 end; 


procedure VRCOrgStruct_SINIT /*Структура компании*/ (
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
 select  SecurityStyleID into atmpID from VRCOrgStruct where VRCOrgStructid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCOrgStruct');
    return;
  end if;
if aSecurityStyleID is null then
 VRCOrgStruct_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCOrgStruct set securitystyleid =aStyleID where VRCOrgStructid = aRowID;
else 
 update VRCOrgStruct set securitystyleid =aSecurityStyleID where VRCOrgStructid = aRowID;
end if; 
end ; 


procedure VRCOrgStruct_propagate /*Структура компании*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCOrgStruct where VRCOrgStructid=aRowid;
end;



procedure VRCCommonInfo_BRIEF  (
 aCURSESSION CHAR,
 aVRCCommonInfoid CHAR,
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
if aVRCCommonInfoid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCCommonInfo where VRCCommonInfoID=aVRCCommonInfoID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCCommonInfo where VRCCommonInfoid=aVRCCommonInfoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCCommonInfo');
    return;
  end if;
  aBRIEF:=func.VRCCommonInfo_BRIEF_F(aVRCCommonInfoid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCCommonInfo_DELETE /*Общая информация*/ (
 aCURSESSION CHAR,
 aVRCCommonInfoid CHAR,
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
select count(*) into existsCnt from VRCCommonInfo where VRCCommonInfoID=aVRCCommonInfoID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCCommonInfo where VRCCommonInfoid=aVRCCommonInfoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCCommonInfo',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCCommonInfo');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCCommonInfo_ISLOCKED( acursession=>acursession,aROWID=>aVRCCommonInfoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCCommonInfo');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCCommonInfo',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCCommonInfoid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCCommonInfo is select  instanceid ID from instance where OwnerPartName ='VRCCommonInfo' and OwnerRowID=aVRCCommonInfoid;
row_VRCCommonInfo  chld_VRCCommonInfo%ROWTYPE;
begin
--open chld_VRCCommonInfo;
for row_VRCCommonInfo in chld_VRCCommonInfo loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCCommonInfo.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCCommonInfo.id);
end loop;
--close chld_VRCCommonInfo;
end ;
  delete from  VRCCommonInfo 
  where  VRCCommonInfoID = aVRCCommonInfoID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Общая информация*/
procedure VRCCommonInfo_SAVE /*Общая информация*/ (
 aCURSESSION CHAR,
 aVRCCommonInfoid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* Наша организация *//* Наша организация */
,aIsPhizical
 NUMBER/* Физическое лицо *//* Физическое лицо */
,acode
 VARCHAR2 := null /* Код клиента *//* Код клиента */
,aName
 VARCHAR2/* Название *//* Название */
,afullname VARCHAR2 := null /* Полное наименование *//* Полное наименование */
,aAddress
 VARCHAR2 := null /* Почтовый адрес *//* Почтовый адрес */
,afax
 VARCHAR2 := null /* Факс *//* Факс */
,aPhone
 VARCHAR2 := null /* Телефон *//* Телефон */
,athe_Comment VARCHAR2 := null /* Примечание *//* Примечание */
,aTRFTYPE CHAR := null /* Тип тарифа *//* Тип тарифа */
,aINN
 VARCHAR2 := null /* ИНН *//* ИНН */
,aCurator CHAR := null /* Ответственный *//* Ответственный */
,aInterest CHAR := null /* Заинтересованность *//* Заинтересованность */
,aTransporter
 NUMBER := null /* Поставщик тр. услуг *//* Поставщик тр. услуг */
,aPassportInfo VARCHAR2 := null /* Паспортные данные *//* Паспортные данные */
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
select count(*) into existsCnt from VRCCommonInfo where VRCCommonInfoID=aVRCCommonInfoID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCCommonInfo where VRCCommonInfoid=aVRCCommonInfoID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCCommonInfo',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCCommonInfo');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCCommonInfo_ISLOCKED( acursession=>acursession,aROWID=>aVRCCommonInfoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCCommonInfo');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCCommonInfo',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCCommonInfoid,aLogInstanceID=>aInstanceID);
 update  VRCCommonInfo set ChangeStamp=sysdate
,
  Org=aOrg
,
  IsPhizical=aIsPhizical
,
  code=acode
,
  Name=aName
,
  fullname=afullname
,
  Address=aAddress
,
  fax=afax
,
  Phone=aPhone
,
  the_Comment=athe_Comment
,
  TRFTYPE=aTRFTYPE
,
  INN=aINN
,
  Curator=aCurator
,
  Interest=aInterest
,
  Transporter=aTransporter
,
  PassportInfo=aPassportInfo
,
  Code1C=aCode1C
  where  VRCCommonInfoID = aVRCCommonInfoID; 
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from VRCCommonInfo where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=VRCCommonInfo');
 return;
end if;

 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCCommonInfo',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCCommonInfo');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCCommonInfo');
    return;
  end if;
select Count(*) into existsCnt from VRCCommonInfo where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <VRCCommonInfo>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCCommonInfo',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCCommonInfoid,aLogInstanceID=>aInstanceID);
 insert into   VRCCommonInfo
 (  VRCCommonInfoID 
,InstanceID
,Org

,IsPhizical

,code

,Name

,fullname

,Address

,fax

,Phone

,the_Comment

,TRFTYPE

,INN

,Curator

,Interest

,Transporter

,PassportInfo

,Code1C

 ) values ( aVRCCommonInfoID 
,aInstanceID
,aOrg

,aIsPhizical

,acode

,aName

,afullname

,aAddress

,afax

,aPhone

,athe_Comment

,aTRFTYPE

,aINN

,aCurator

,aInterest

,aTransporter

,aPassportInfo

,aCode1C

 ); 
 VRCCommonInfo_SINIT( aCURSESSION,aVRCCommonInfoid,atmpid);
 -- checking unique constraints  --

select Count(*) into aUniqueRowCount from VRCCommonInfo where 1=1  
 and Name=aName;
if aUniqueRowCount>=2
then
 raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=VRCCommonInfo');
 return;
end if;

 end if;
 -- close transaction --
 end; 


procedure VRCCommonInfo_PARENT /*Общая информация*/ (
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
  select  INSTANCEID into aParentID from VRCCommonInfo where  VRCCommonInfoid=aRowID;
 end; 


procedure VRCCommonInfo_ISLOCKED /*Общая информация*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCCommonInfo where VRCCommonInfoid=aRowID;
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
  VRCCommonInfo_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCCommonInfo_LOCK /*Общая информация*/ (
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
 VRCCommonInfo_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCCommonInfo_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCCommonInfo where VRCCommonInfoid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCCommonInfo');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCCommonInfo set LockUserID =auserID ,LockSessionID =null where VRCCommonInfoid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCCommonInfo set LockUserID =null,LockSessionID =aCURSESSION  where VRCCommonInfoid=aRowID;
     return;
   end if;
 end ;


procedure VRCCommonInfo_HCL /*Общая информация*/ (
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


procedure VRCCommonInfo_UNLOCK /*Общая информация*/ (
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
 VRCCommonInfo_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCCommonInfo set LockUserID =null  where VRCCommonInfoid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCCommonInfo set LockSessionID =null  where VRCCommonInfoid=aRowID;
     return;
   end if;
 end; 


procedure VRCCommonInfo_SINIT /*Общая информация*/ (
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
 select  SecurityStyleID into atmpID from VRCCommonInfo where VRCCommonInfoid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCCommonInfo');
    return;
  end if;
if aSecurityStyleID is null then
 VRCCommonInfo_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCCommonInfo set securitystyleid =aStyleID where VRCCommonInfoid = aRowID;
else 
 update VRCCommonInfo set securitystyleid =aSecurityStyleID where VRCCommonInfoid = aRowID;
end if; 
end ; 


procedure VRCCommonInfo_propagate /*Общая информация*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCCommonInfo where VRCCommonInfoid=aRowid;
end;



procedure VRCPerson_BRIEF  (
 aCURSESSION CHAR,
 aVRCPersonid CHAR,
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
if aVRCPersonid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPerson where VRCPersonID=aVRCPersonID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPerson where VRCPersonid=aVRCPersonID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPerson');
    return;
  end if;
  aBRIEF:=func.VRCPerson_BRIEF_F(aVRCPersonid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPerson_DELETE /*Контактные лица*/ (
 aCURSESSION CHAR,
 aVRCPersonid CHAR,
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
select count(*) into existsCnt from VRCPerson where VRCPersonID=aVRCPersonID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPerson where VRCPersonid=aVRCPersonID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPerson',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPerson');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPerson_ISLOCKED( acursession=>acursession,aROWID=>aVRCPersonid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPerson');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPerson',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPersonid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPerson is select  instanceid ID from instance where OwnerPartName ='VRCPerson' and OwnerRowID=aVRCPersonid;
row_VRCPerson  chld_VRCPerson%ROWTYPE;
begin
--open chld_VRCPerson;
for row_VRCPerson in chld_VRCPerson loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPerson.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPerson.id);
end loop;
--close chld_VRCPerson;
end ;
  delete from  VRCPerson 
  where  VRCPersonID = aVRCPersonID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Контактные лица*/
procedure VRCPerson_SAVE /*Контактные лица*/ (
 aCURSESSION CHAR,
 aVRCPersonid CHAR,
aInstanceID CHAR 
,aPerson CHAR/* Контактное лицо *//* Контактное лицо */
,aPosition
 VARCHAR2 := null /* Должность *//* Должность */
,aphone
 VARCHAR2 := null /* Телефон *//* Телефон */
,amobile
 VARCHAR2 := null /* Мобильный телефон *//* Мобильный телефон */
,aUseInDogovor
 NUMBER/* Использовать в договоре *//* Использовать в договоре */
,aDocReason
 VARCHAR2 := null /* Действует на основании *//* Действует на основании */
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
select count(*) into existsCnt from VRCPerson where VRCPersonID=aVRCPersonID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPerson where VRCPersonid=aVRCPersonID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPerson',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPerson');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPerson_ISLOCKED( acursession=>acursession,aROWID=>aVRCPersonid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPerson');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPerson',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPersonid,aLogInstanceID=>aInstanceID);
 update  VRCPerson set ChangeStamp=sysdate
,
  Person=aPerson
,
  Position=aPosition
,
  phone=aphone
,
  mobile=amobile
,
  UseInDogovor=aUseInDogovor
,
  DocReason=aDocReason
  where  VRCPersonID = aVRCPersonID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPerson',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPerson');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPerson');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPerson',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPersonid,aLogInstanceID=>aInstanceID);
 insert into   VRCPerson
 (  VRCPersonID 
,InstanceID
,Person

,Position

,phone

,mobile

,UseInDogovor

,DocReason

 ) values ( aVRCPersonID 
,aInstanceID
,aPerson

,aPosition

,aphone

,amobile

,aUseInDogovor

,aDocReason

 ); 
 VRCPerson_SINIT( aCURSESSION,aVRCPersonid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPerson_PARENT /*Контактные лица*/ (
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
  select  INSTANCEID into aParentID from VRCPerson where  VRCPersonid=aRowID;
 end; 


procedure VRCPerson_ISLOCKED /*Контактные лица*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPerson where VRCPersonid=aRowID;
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
  VRCPerson_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPerson_LOCK /*Контактные лица*/ (
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
 VRCPerson_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPerson_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPerson where VRCPersonid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPerson');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPerson set LockUserID =auserID ,LockSessionID =null where VRCPersonid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPerson set LockUserID =null,LockSessionID =aCURSESSION  where VRCPersonid=aRowID;
     return;
   end if;
 end ;


procedure VRCPerson_HCL /*Контактные лица*/ (
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


procedure VRCPerson_UNLOCK /*Контактные лица*/ (
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
 VRCPerson_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPerson set LockUserID =null  where VRCPersonid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPerson set LockSessionID =null  where VRCPersonid=aRowID;
     return;
   end if;
 end; 


procedure VRCPerson_SINIT /*Контактные лица*/ (
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
 select  SecurityStyleID into atmpID from VRCPerson where VRCPersonid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPerson');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPerson_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPerson set securitystyleid =aStyleID where VRCPersonid = aRowID;
else 
 update VRCPerson set securitystyleid =aSecurityStyleID where VRCPersonid = aRowID;
end if; 
end ; 


procedure VRCPerson_propagate /*Контактные лица*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPerson where VRCPersonid=aRowid;
end;


end VRC;

/



