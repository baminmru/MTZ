
/* --ENTDIC*/

 create or replace package body ENTDIC as

procedure ENTDIC_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='ENTDIC'
then
declare cursor child_ENTDIC_BANK is select ENTDIC_BANK.ENTDIC_BANKid ID from ENTDIC_BANK where  ENTDIC_BANK.InstanceID = ainstanceid;
row_ENTDIC_BANK  child_ENTDIC_BANK%ROWTYPE;
begin
--open child_ENTDIC_BANK;
for row_ENTDIC_BANK in child_ENTDIC_BANK loop
 ENTDIC_BANK_DELETE (acursession,row_ENTDIC_BANK.id,aInstanceID);
end loop;
--close child_ENTDIC_BANK;
end;
declare cursor child_ENTDIC_MTYPE is select ENTDIC_MTYPE.ENTDIC_MTYPEid ID from ENTDIC_MTYPE where  ENTDIC_MTYPE.InstanceID = ainstanceid;
row_ENTDIC_MTYPE  child_ENTDIC_MTYPE%ROWTYPE;
begin
--open child_ENTDIC_MTYPE;
for row_ENTDIC_MTYPE in child_ENTDIC_MTYPE loop
 ENTDIC_MTYPE_DELETE (acursession,row_ENTDIC_MTYPE.id,aInstanceID);
end loop;
--close child_ENTDIC_MTYPE;
end;
declare cursor child_ENTDIC_DOST is select ENTDIC_DOST.ENTDIC_DOSTid ID from ENTDIC_DOST where  ENTDIC_DOST.InstanceID = ainstanceid;
row_ENTDIC_DOST  child_ENTDIC_DOST%ROWTYPE;
begin
--open child_ENTDIC_DOST;
for row_ENTDIC_DOST in child_ENTDIC_DOST loop
 ENTDIC_DOST_DELETE (acursession,row_ENTDIC_DOST.id,aInstanceID);
end loop;
--close child_ENTDIC_DOST;
end;
declare cursor child_ENTDIC_TOWN is select ENTDIC_TOWN.ENTDIC_TOWNid ID from ENTDIC_TOWN where  ENTDIC_TOWN.InstanceID = ainstanceid;
row_ENTDIC_TOWN  child_ENTDIC_TOWN%ROWTYPE;
begin
--open child_ENTDIC_TOWN;
for row_ENTDIC_TOWN in child_ENTDIC_TOWN loop
 ENTDIC_TOWN_DELETE (acursession,row_ENTDIC_TOWN.id,aInstanceID);
end loop;
--close child_ENTDIC_TOWN;
end;
declare cursor child_ENTDIC_ANALIZ is select ENTDIC_ANALIZ.ENTDIC_ANALIZid ID from ENTDIC_ANALIZ where  ENTDIC_ANALIZ.InstanceID = ainstanceid;
row_ENTDIC_ANALIZ  child_ENTDIC_ANALIZ%ROWTYPE;
begin
--open child_ENTDIC_ANALIZ;
for row_ENTDIC_ANALIZ in child_ENTDIC_ANALIZ loop
 ENTDIC_ANALIZ_DELETE (acursession,row_ENTDIC_ANALIZ.id,aInstanceID);
end loop;
--close child_ENTDIC_ANALIZ;
end;
declare cursor child_ENTDIC_NTYPE is select ENTDIC_NTYPE.ENTDIC_NTYPEid ID from ENTDIC_NTYPE where  ENTDIC_NTYPE.InstanceID = ainstanceid;
row_ENTDIC_NTYPE  child_ENTDIC_NTYPE%ROWTYPE;
begin
--open child_ENTDIC_NTYPE;
for row_ENTDIC_NTYPE in child_ENTDIC_NTYPE loop
 ENTDIC_NTYPE_DELETE (acursession,row_ENTDIC_NTYPE.id,aInstanceID);
end loop;
--close child_ENTDIC_NTYPE;
end;
declare cursor child_ENTDIC_DEPTYPE is select ENTDIC_DEPTYPE.ENTDIC_DEPTYPEid ID from ENTDIC_DEPTYPE where  ENTDIC_DEPTYPE.InstanceID = ainstanceid;
row_ENTDIC_DEPTYPE  child_ENTDIC_DEPTYPE%ROWTYPE;
begin
--open child_ENTDIC_DEPTYPE;
for row_ENTDIC_DEPTYPE in child_ENTDIC_DEPTYPE loop
 ENTDIC_DEPTYPE_DELETE (acursession,row_ENTDIC_DEPTYPE.id,aInstanceID);
end loop;
--close child_ENTDIC_DEPTYPE;
end;
declare cursor child_ENTDIC_URTYPE is select ENTDIC_URTYPE.ENTDIC_URTYPEid ID from ENTDIC_URTYPE where  ENTDIC_URTYPE.InstanceID = ainstanceid;
row_ENTDIC_URTYPE  child_ENTDIC_URTYPE%ROWTYPE;
begin
--open child_ENTDIC_URTYPE;
for row_ENTDIC_URTYPE in child_ENTDIC_URTYPE loop
 ENTDIC_URTYPE_DELETE (acursession,row_ENTDIC_URTYPE.id,aInstanceID);
end loop;
--close child_ENTDIC_URTYPE;
end;
declare cursor child_ENTDIC_VOP is select ENTDIC_VOP.ENTDIC_VOPid ID from ENTDIC_VOP where  ENTDIC_VOP.InstanceID = ainstanceid;
row_ENTDIC_VOP  child_ENTDIC_VOP%ROWTYPE;
begin
--open child_ENTDIC_VOP;
for row_ENTDIC_VOP in child_ENTDIC_VOP loop
 ENTDIC_VOP_DELETE (acursession,row_ENTDIC_VOP.id,aInstanceID);
end loop;
--close child_ENTDIC_VOP;
end;
declare cursor child_ENTDIC_VP is select ENTDIC_VP.ENTDIC_VPid ID from ENTDIC_VP where  ENTDIC_VP.InstanceID = ainstanceid;
row_ENTDIC_VP  child_ENTDIC_VP%ROWTYPE;
begin
--open child_ENTDIC_VP;
for row_ENTDIC_VP in child_ENTDIC_VP loop
 ENTDIC_VP_DELETE (acursession,row_ENTDIC_VP.id,aInstanceID);
end loop;
--close child_ENTDIC_VP;
end;
declare cursor child_ENTDIC_EDIZM is select ENTDIC_EDIZM.ENTDIC_EDIZMid ID from ENTDIC_EDIZM where  ENTDIC_EDIZM.InstanceID = ainstanceid;
row_ENTDIC_EDIZM  child_ENTDIC_EDIZM%ROWTYPE;
begin
--open child_ENTDIC_EDIZM;
for row_ENTDIC_EDIZM in child_ENTDIC_EDIZM loop
 ENTDIC_EDIZM_DELETE (acursession,row_ENTDIC_EDIZM.id,aInstanceID);
end loop;
--close child_ENTDIC_EDIZM;
end;
declare cursor child_ENTDIC_RWSRV is select ENTDIC_RWSRV.ENTDIC_RWSRVid ID from ENTDIC_RWSRV where  ENTDIC_RWSRV.InstanceID = ainstanceid;
row_ENTDIC_RWSRV  child_ENTDIC_RWSRV%ROWTYPE;
begin
--open child_ENTDIC_RWSRV;
for row_ENTDIC_RWSRV in child_ENTDIC_RWSRV loop
 ENTDIC_RWSRV_DELETE (acursession,row_ENTDIC_RWSRV.id,aInstanceID);
end loop;
--close child_ENTDIC_RWSRV;
end;
declare cursor child_ENTDIC_RW is select ENTDIC_RW.ENTDIC_RWid ID from ENTDIC_RW where  ENTDIC_RW.InstanceID = ainstanceid;
row_ENTDIC_RW  child_ENTDIC_RW%ROWTYPE;
begin
--open child_ENTDIC_RW;
for row_ENTDIC_RW in child_ENTDIC_RW loop
 ENTDIC_RW_DELETE (acursession,row_ENTDIC_RW.id,aInstanceID);
end loop;
--close child_ENTDIC_RW;
end;
declare cursor child_ENTDIC_IZMAP is select ENTDIC_IZMAP.ENTDIC_IZMAPid ID from ENTDIC_IZMAP where  ENTDIC_IZMAP.InstanceID = ainstanceid;
row_ENTDIC_IZMAP  child_ENTDIC_IZMAP%ROWTYPE;
begin
--open child_ENTDIC_IZMAP;
for row_ENTDIC_IZMAP in child_ENTDIC_IZMAP loop
 ENTDIC_IZMAP_DELETE (acursession,row_ENTDIC_IZMAP.id,aInstanceID);
end loop;
--close child_ENTDIC_IZMAP;
end;
declare cursor child_ENTDIC_CURRENCY is select ENTDIC_CURRENCY.ENTDIC_CURRENCYid ID from ENTDIC_CURRENCY where  ENTDIC_CURRENCY.InstanceID = ainstanceid;
row_ENTDIC_CURRENCY  child_ENTDIC_CURRENCY%ROWTYPE;
begin
--open child_ENTDIC_CURRENCY;
for row_ENTDIC_CURRENCY in child_ENTDIC_CURRENCY loop
 ENTDIC_CURRENCY_DELETE (acursession,row_ENTDIC_CURRENCY.id,aInstanceID);
end loop;
--close child_ENTDIC_CURRENCY;
end;
declare cursor child_ENTDIC_TRREG is select ENTDIC_TRREG.ENTDIC_TRREGid ID from ENTDIC_TRREG where  ENTDIC_TRREG.InstanceID = ainstanceid;
row_ENTDIC_TRREG  child_ENTDIC_TRREG%ROWTYPE;
begin
--open child_ENTDIC_TRREG;
for row_ENTDIC_TRREG in child_ENTDIC_TRREG loop
 ENTDIC_TRREG_DELETE (acursession,row_ENTDIC_TRREG.id,aInstanceID);
end loop;
--close child_ENTDIC_TRREG;
end;
declare cursor child_ENTDIC_STORETYPE is select ENTDIC_STORETYPE.ENTDIC_STORETYPEid ID from ENTDIC_STORETYPE where  ENTDIC_STORETYPE.InstanceID = ainstanceid;
row_ENTDIC_STORETYPE  child_ENTDIC_STORETYPE%ROWTYPE;
begin
--open child_ENTDIC_STORETYPE;
for row_ENTDIC_STORETYPE in child_ENTDIC_STORETYPE loop
 ENTDIC_STORETYPE_DELETE (acursession,row_ENTDIC_STORETYPE.id,aInstanceID);
end loop;
--close child_ENTDIC_STORETYPE;
end;
declare cursor child_ENTDIC_MACHINES is select ENTDIC_MACHINES.ENTDIC_MACHINESid ID from ENTDIC_MACHINES where  ENTDIC_MACHINES.InstanceID = ainstanceid;
row_ENTDIC_MACHINES  child_ENTDIC_MACHINES%ROWTYPE;
begin
--open child_ENTDIC_MACHINES;
for row_ENTDIC_MACHINES in child_ENTDIC_MACHINES loop
 ENTDIC_MACHINES_DELETE (acursession,row_ENTDIC_MACHINES.id,aInstanceID);
end loop;
--close child_ENTDIC_MACHINES;
end;
declare cursor child_ENTDIC_CLITYPE is select ENTDIC_CLITYPE.ENTDIC_CLITYPEid ID from ENTDIC_CLITYPE where  ENTDIC_CLITYPE.InstanceID = ainstanceid;
row_ENTDIC_CLITYPE  child_ENTDIC_CLITYPE%ROWTYPE;
begin
--open child_ENTDIC_CLITYPE;
for row_ENTDIC_CLITYPE in child_ENTDIC_CLITYPE loop
 ENTDIC_CLITYPE_DELETE (acursession,row_ENTDIC_CLITYPE.id,aInstanceID);
end loop;
--close child_ENTDIC_CLITYPE;
end;
declare cursor child_ENTDIC_COUNTRY is select ENTDIC_COUNTRY.ENTDIC_COUNTRYid ID from ENTDIC_COUNTRY where  ENTDIC_COUNTRY.InstanceID = ainstanceid;
row_ENTDIC_COUNTRY  child_ENTDIC_COUNTRY%ROWTYPE;
begin
--open child_ENTDIC_COUNTRY;
for row_ENTDIC_COUNTRY in child_ENTDIC_COUNTRY loop
 ENTDIC_COUNTRY_DELETE (acursession,row_ENTDIC_COUNTRY.id,aInstanceID);
end loop;
--close child_ENTDIC_COUNTRY;
end;
declare cursor child_ENTDIC_PACKAGE is select ENTDIC_PACKAGE.ENTDIC_PACKAGEid ID from ENTDIC_PACKAGE where  ENTDIC_PACKAGE.InstanceID = ainstanceid;
row_ENTDIC_PACKAGE  child_ENTDIC_PACKAGE%ROWTYPE;
begin
--open child_ENTDIC_PACKAGE;
for row_ENTDIC_PACKAGE in child_ENTDIC_PACKAGE loop
 ENTDIC_PACKAGE_DELETE (acursession,row_ENTDIC_PACKAGE.id,aInstanceID);
end loop;
--close child_ENTDIC_PACKAGE;
end;
declare cursor child_ENTDIC_SRV is select ENTDIC_SRV.ENTDIC_SRVid ID from ENTDIC_SRV where  ENTDIC_SRV.InstanceID = ainstanceid;
row_ENTDIC_SRV  child_ENTDIC_SRV%ROWTYPE;
begin
--open child_ENTDIC_SRV;
for row_ENTDIC_SRV in child_ENTDIC_SRV loop
 ENTDIC_SRV_DELETE (acursession,row_ENTDIC_SRV.id,aInstanceID);
end loop;
--close child_ENTDIC_SRV;
end;
declare cursor child_ENTDiC_RETTYPE is select ENTDiC_RETTYPE.ENTDiC_RETTYPEid ID from ENTDiC_RETTYPE where  ENTDiC_RETTYPE.InstanceID = ainstanceid;
row_ENTDiC_RETTYPE  child_ENTDiC_RETTYPE%ROWTYPE;
begin
--open child_ENTDiC_RETTYPE;
for row_ENTDiC_RETTYPE in child_ENTDiC_RETTYPE loop
 ENTDiC_RETTYPE_DELETE (acursession,row_ENTDiC_RETTYPE.id,aInstanceID);
end loop;
--close child_ENTDiC_RETTYPE;
end;
declare cursor child_ENTDIC_REGION is select ENTDIC_REGION.ENTDIC_REGIONid ID from ENTDIC_REGION where  ENTDIC_REGION.InstanceID = ainstanceid;
row_ENTDIC_REGION  child_ENTDIC_REGION%ROWTYPE;
begin
--open child_ENTDIC_REGION;
for row_ENTDIC_REGION in child_ENTDIC_REGION loop
 ENTDIC_REGION_DELETE (acursession,row_ENTDIC_REGION.id,aInstanceID);
end loop;
--close child_ENTDIC_REGION;
end;
declare cursor child_ENTDIC_VOT is select ENTDIC_VOT.ENTDIC_VOTid ID from ENTDIC_VOT where  ENTDIC_VOT.InstanceID = ainstanceid;
row_ENTDIC_VOT  child_ENTDIC_VOT%ROWTYPE;
begin
--open child_ENTDIC_VOT;
for row_ENTDIC_VOT in child_ENTDIC_VOT loop
 ENTDIC_VOT_DELETE (acursession,row_ENTDIC_VOT.id,aInstanceID);
end loop;
--close child_ENTDIC_VOT;
end;
declare cursor child_ENTDIC_PRTYPE is select ENTDIC_PRTYPE.ENTDIC_PRTYPEid ID from ENTDIC_PRTYPE where  ENTDIC_PRTYPE.InstanceID = ainstanceid;
row_ENTDIC_PRTYPE  child_ENTDIC_PRTYPE%ROWTYPE;
begin
--open child_ENTDIC_PRTYPE;
for row_ENTDIC_PRTYPE in child_ENTDIC_PRTYPE loop
 ENTDIC_PRTYPE_DELETE (acursession,row_ENTDIC_PRTYPE.id,aInstanceID);
end loop;
--close child_ENTDIC_PRTYPE;
end;
declare cursor child_ENTDIC_NALOGI is select ENTDIC_NALOGI.ENTDIC_NALOGIid ID from ENTDIC_NALOGI where  ENTDIC_NALOGI.InstanceID = ainstanceid;
row_ENTDIC_NALOGI  child_ENTDIC_NALOGI%ROWTYPE;
begin
--open child_ENTDIC_NALOGI;
for row_ENTDIC_NALOGI in child_ENTDIC_NALOGI loop
 ENTDIC_NALOGI_DELETE (acursession,row_ENTDIC_NALOGI.id,aInstanceID);
end loop;
--close child_ENTDIC_NALOGI;
end;
return;
<<del_error>>
return;
end if;
end;
procedure ENTDIC_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'ENTDIC'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_ENTDIC_BANK is select ENTDIC_BANK.ENTDIC_BANKid ID from ENTDIC_BANK where  ENTDIC_BANK.InstanceID = arowid;
ROW_ENTDIC_BANK  lch_ENTDIC_BANK%ROWTYPE;
begin
--open lch_ENTDIC_BANK;
for row_ENTDIC_BANK in lch_ENTDIC_BANK loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_BANK where ENTDIC_BANKid=row_ENTDIC_BANK.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_BANK;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_BANK;
     return;
   end if; 
 end if; 
 ENTDIC_BANK_HCL (acursession,ROW_ENTDIC_BANK.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_BANK;
   return;
 end if;
 end loop;
--close lch_ENTDIC_BANK;
end;
declare cursor lch_ENTDIC_MTYPE is select ENTDIC_MTYPE.ENTDIC_MTYPEid ID from ENTDIC_MTYPE where  ENTDIC_MTYPE.InstanceID = arowid;
ROW_ENTDIC_MTYPE  lch_ENTDIC_MTYPE%ROWTYPE;
begin
--open lch_ENTDIC_MTYPE;
for row_ENTDIC_MTYPE in lch_ENTDIC_MTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_MTYPE where ENTDIC_MTYPEid=row_ENTDIC_MTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_MTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_MTYPE;
     return;
   end if; 
 end if; 
 ENTDIC_MTYPE_HCL (acursession,ROW_ENTDIC_MTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_MTYPE;
   return;
 end if;
 end loop;
--close lch_ENTDIC_MTYPE;
end;
declare cursor lch_ENTDIC_DOST is select ENTDIC_DOST.ENTDIC_DOSTid ID from ENTDIC_DOST where  ENTDIC_DOST.InstanceID = arowid;
ROW_ENTDIC_DOST  lch_ENTDIC_DOST%ROWTYPE;
begin
--open lch_ENTDIC_DOST;
for row_ENTDIC_DOST in lch_ENTDIC_DOST loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_DOST where ENTDIC_DOSTid=row_ENTDIC_DOST.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_DOST;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_DOST;
     return;
   end if; 
 end if; 
 ENTDIC_DOST_HCL (acursession,ROW_ENTDIC_DOST.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_DOST;
   return;
 end if;
 end loop;
--close lch_ENTDIC_DOST;
end;
declare cursor lch_ENTDIC_TOWN is select ENTDIC_TOWN.ENTDIC_TOWNid ID from ENTDIC_TOWN where  ENTDIC_TOWN.InstanceID = arowid;
ROW_ENTDIC_TOWN  lch_ENTDIC_TOWN%ROWTYPE;
begin
--open lch_ENTDIC_TOWN;
for row_ENTDIC_TOWN in lch_ENTDIC_TOWN loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_TOWN where ENTDIC_TOWNid=row_ENTDIC_TOWN.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_TOWN;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_TOWN;
     return;
   end if; 
 end if; 
 ENTDIC_TOWN_HCL (acursession,ROW_ENTDIC_TOWN.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_TOWN;
   return;
 end if;
 end loop;
--close lch_ENTDIC_TOWN;
end;
declare cursor lch_ENTDIC_ANALIZ is select ENTDIC_ANALIZ.ENTDIC_ANALIZid ID from ENTDIC_ANALIZ where  ENTDIC_ANALIZ.InstanceID = arowid;
ROW_ENTDIC_ANALIZ  lch_ENTDIC_ANALIZ%ROWTYPE;
begin
--open lch_ENTDIC_ANALIZ;
for row_ENTDIC_ANALIZ in lch_ENTDIC_ANALIZ loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_ANALIZ where ENTDIC_ANALIZid=row_ENTDIC_ANALIZ.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_ANALIZ;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_ANALIZ;
     return;
   end if; 
 end if; 
 ENTDIC_ANALIZ_HCL (acursession,ROW_ENTDIC_ANALIZ.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_ANALIZ;
   return;
 end if;
 end loop;
--close lch_ENTDIC_ANALIZ;
end;
declare cursor lch_ENTDIC_NTYPE is select ENTDIC_NTYPE.ENTDIC_NTYPEid ID from ENTDIC_NTYPE where  ENTDIC_NTYPE.InstanceID = arowid;
ROW_ENTDIC_NTYPE  lch_ENTDIC_NTYPE%ROWTYPE;
begin
--open lch_ENTDIC_NTYPE;
for row_ENTDIC_NTYPE in lch_ENTDIC_NTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_NTYPE where ENTDIC_NTYPEid=row_ENTDIC_NTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_NTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_NTYPE;
     return;
   end if; 
 end if; 
 ENTDIC_NTYPE_HCL (acursession,ROW_ENTDIC_NTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_NTYPE;
   return;
 end if;
 end loop;
--close lch_ENTDIC_NTYPE;
end;
declare cursor lch_ENTDIC_DEPTYPE is select ENTDIC_DEPTYPE.ENTDIC_DEPTYPEid ID from ENTDIC_DEPTYPE where  ENTDIC_DEPTYPE.InstanceID = arowid;
ROW_ENTDIC_DEPTYPE  lch_ENTDIC_DEPTYPE%ROWTYPE;
begin
--open lch_ENTDIC_DEPTYPE;
for row_ENTDIC_DEPTYPE in lch_ENTDIC_DEPTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEid=row_ENTDIC_DEPTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_DEPTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_DEPTYPE;
     return;
   end if; 
 end if; 
 ENTDIC_DEPTYPE_HCL (acursession,ROW_ENTDIC_DEPTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_DEPTYPE;
   return;
 end if;
 end loop;
--close lch_ENTDIC_DEPTYPE;
end;
declare cursor lch_ENTDIC_URTYPE is select ENTDIC_URTYPE.ENTDIC_URTYPEid ID from ENTDIC_URTYPE where  ENTDIC_URTYPE.InstanceID = arowid;
ROW_ENTDIC_URTYPE  lch_ENTDIC_URTYPE%ROWTYPE;
begin
--open lch_ENTDIC_URTYPE;
for row_ENTDIC_URTYPE in lch_ENTDIC_URTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_URTYPE where ENTDIC_URTYPEid=row_ENTDIC_URTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_URTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_URTYPE;
     return;
   end if; 
 end if; 
 ENTDIC_URTYPE_HCL (acursession,ROW_ENTDIC_URTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_URTYPE;
   return;
 end if;
 end loop;
--close lch_ENTDIC_URTYPE;
end;
declare cursor lch_ENTDIC_VOP is select ENTDIC_VOP.ENTDIC_VOPid ID from ENTDIC_VOP where  ENTDIC_VOP.InstanceID = arowid;
ROW_ENTDIC_VOP  lch_ENTDIC_VOP%ROWTYPE;
begin
--open lch_ENTDIC_VOP;
for row_ENTDIC_VOP in lch_ENTDIC_VOP loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_VOP where ENTDIC_VOPid=row_ENTDIC_VOP.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_VOP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_VOP;
     return;
   end if; 
 end if; 
 ENTDIC_VOP_HCL (acursession,ROW_ENTDIC_VOP.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_VOP;
   return;
 end if;
 end loop;
--close lch_ENTDIC_VOP;
end;
declare cursor lch_ENTDIC_VP is select ENTDIC_VP.ENTDIC_VPid ID from ENTDIC_VP where  ENTDIC_VP.InstanceID = arowid;
ROW_ENTDIC_VP  lch_ENTDIC_VP%ROWTYPE;
begin
--open lch_ENTDIC_VP;
for row_ENTDIC_VP in lch_ENTDIC_VP loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_VP where ENTDIC_VPid=row_ENTDIC_VP.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_VP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_VP;
     return;
   end if; 
 end if; 
 ENTDIC_VP_HCL (acursession,ROW_ENTDIC_VP.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_VP;
   return;
 end if;
 end loop;
--close lch_ENTDIC_VP;
end;
declare cursor lch_ENTDIC_EDIZM is select ENTDIC_EDIZM.ENTDIC_EDIZMid ID from ENTDIC_EDIZM where  ENTDIC_EDIZM.InstanceID = arowid;
ROW_ENTDIC_EDIZM  lch_ENTDIC_EDIZM%ROWTYPE;
begin
--open lch_ENTDIC_EDIZM;
for row_ENTDIC_EDIZM in lch_ENTDIC_EDIZM loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_EDIZM where ENTDIC_EDIZMid=row_ENTDIC_EDIZM.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_EDIZM;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_EDIZM;
     return;
   end if; 
 end if; 
 ENTDIC_EDIZM_HCL (acursession,ROW_ENTDIC_EDIZM.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_EDIZM;
   return;
 end if;
 end loop;
--close lch_ENTDIC_EDIZM;
end;
declare cursor lch_ENTDIC_RWSRV is select ENTDIC_RWSRV.ENTDIC_RWSRVid ID from ENTDIC_RWSRV where  ENTDIC_RWSRV.InstanceID = arowid;
ROW_ENTDIC_RWSRV  lch_ENTDIC_RWSRV%ROWTYPE;
begin
--open lch_ENTDIC_RWSRV;
for row_ENTDIC_RWSRV in lch_ENTDIC_RWSRV loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_RWSRV where ENTDIC_RWSRVid=row_ENTDIC_RWSRV.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_RWSRV;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_RWSRV;
     return;
   end if; 
 end if; 
 ENTDIC_RWSRV_HCL (acursession,ROW_ENTDIC_RWSRV.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_RWSRV;
   return;
 end if;
 end loop;
--close lch_ENTDIC_RWSRV;
end;
declare cursor lch_ENTDIC_RW is select ENTDIC_RW.ENTDIC_RWid ID from ENTDIC_RW where  ENTDIC_RW.InstanceID = arowid;
ROW_ENTDIC_RW  lch_ENTDIC_RW%ROWTYPE;
begin
--open lch_ENTDIC_RW;
for row_ENTDIC_RW in lch_ENTDIC_RW loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_RW where ENTDIC_RWid=row_ENTDIC_RW.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_RW;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_RW;
     return;
   end if; 
 end if; 
 ENTDIC_RW_HCL (acursession,ROW_ENTDIC_RW.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_RW;
   return;
 end if;
 end loop;
--close lch_ENTDIC_RW;
end;
declare cursor lch_ENTDIC_IZMAP is select ENTDIC_IZMAP.ENTDIC_IZMAPid ID from ENTDIC_IZMAP where  ENTDIC_IZMAP.InstanceID = arowid;
ROW_ENTDIC_IZMAP  lch_ENTDIC_IZMAP%ROWTYPE;
begin
--open lch_ENTDIC_IZMAP;
for row_ENTDIC_IZMAP in lch_ENTDIC_IZMAP loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_IZMAP where ENTDIC_IZMAPid=row_ENTDIC_IZMAP.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_IZMAP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_IZMAP;
     return;
   end if; 
 end if; 
 ENTDIC_IZMAP_HCL (acursession,ROW_ENTDIC_IZMAP.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_IZMAP;
   return;
 end if;
 end loop;
--close lch_ENTDIC_IZMAP;
end;
declare cursor lch_ENTDIC_CURRENCY is select ENTDIC_CURRENCY.ENTDIC_CURRENCYid ID from ENTDIC_CURRENCY where  ENTDIC_CURRENCY.InstanceID = arowid;
ROW_ENTDIC_CURRENCY  lch_ENTDIC_CURRENCY%ROWTYPE;
begin
--open lch_ENTDIC_CURRENCY;
for row_ENTDIC_CURRENCY in lch_ENTDIC_CURRENCY loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_CURRENCY where ENTDIC_CURRENCYid=row_ENTDIC_CURRENCY.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_CURRENCY;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_CURRENCY;
     return;
   end if; 
 end if; 
 ENTDIC_CURRENCY_HCL (acursession,ROW_ENTDIC_CURRENCY.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_CURRENCY;
   return;
 end if;
 end loop;
--close lch_ENTDIC_CURRENCY;
end;
declare cursor lch_ENTDIC_TRREG is select ENTDIC_TRREG.ENTDIC_TRREGid ID from ENTDIC_TRREG where  ENTDIC_TRREG.InstanceID = arowid;
ROW_ENTDIC_TRREG  lch_ENTDIC_TRREG%ROWTYPE;
begin
--open lch_ENTDIC_TRREG;
for row_ENTDIC_TRREG in lch_ENTDIC_TRREG loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_TRREG where ENTDIC_TRREGid=row_ENTDIC_TRREG.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_TRREG;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_TRREG;
     return;
   end if; 
 end if; 
 ENTDIC_TRREG_HCL (acursession,ROW_ENTDIC_TRREG.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_TRREG;
   return;
 end if;
 end loop;
--close lch_ENTDIC_TRREG;
end;
declare cursor lch_ENTDIC_STORETYPE is select ENTDIC_STORETYPE.ENTDIC_STORETYPEid ID from ENTDIC_STORETYPE where  ENTDIC_STORETYPE.InstanceID = arowid;
ROW_ENTDIC_STORETYPE  lch_ENTDIC_STORETYPE%ROWTYPE;
begin
--open lch_ENTDIC_STORETYPE;
for row_ENTDIC_STORETYPE in lch_ENTDIC_STORETYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_STORETYPE where ENTDIC_STORETYPEid=row_ENTDIC_STORETYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_STORETYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_STORETYPE;
     return;
   end if; 
 end if; 
 ENTDIC_STORETYPE_HCL (acursession,ROW_ENTDIC_STORETYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_STORETYPE;
   return;
 end if;
 end loop;
--close lch_ENTDIC_STORETYPE;
end;
declare cursor lch_ENTDIC_MACHINES is select ENTDIC_MACHINES.ENTDIC_MACHINESid ID from ENTDIC_MACHINES where  ENTDIC_MACHINES.InstanceID = arowid;
ROW_ENTDIC_MACHINES  lch_ENTDIC_MACHINES%ROWTYPE;
begin
--open lch_ENTDIC_MACHINES;
for row_ENTDIC_MACHINES in lch_ENTDIC_MACHINES loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_MACHINES where ENTDIC_MACHINESid=row_ENTDIC_MACHINES.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_MACHINES;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_MACHINES;
     return;
   end if; 
 end if; 
 ENTDIC_MACHINES_HCL (acursession,ROW_ENTDIC_MACHINES.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_MACHINES;
   return;
 end if;
 end loop;
--close lch_ENTDIC_MACHINES;
end;
declare cursor lch_ENTDIC_CLITYPE is select ENTDIC_CLITYPE.ENTDIC_CLITYPEid ID from ENTDIC_CLITYPE where  ENTDIC_CLITYPE.InstanceID = arowid;
ROW_ENTDIC_CLITYPE  lch_ENTDIC_CLITYPE%ROWTYPE;
begin
--open lch_ENTDIC_CLITYPE;
for row_ENTDIC_CLITYPE in lch_ENTDIC_CLITYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_CLITYPE where ENTDIC_CLITYPEid=row_ENTDIC_CLITYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_CLITYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_CLITYPE;
     return;
   end if; 
 end if; 
 ENTDIC_CLITYPE_HCL (acursession,ROW_ENTDIC_CLITYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_CLITYPE;
   return;
 end if;
 end loop;
--close lch_ENTDIC_CLITYPE;
end;
declare cursor lch_ENTDIC_COUNTRY is select ENTDIC_COUNTRY.ENTDIC_COUNTRYid ID from ENTDIC_COUNTRY where  ENTDIC_COUNTRY.InstanceID = arowid;
ROW_ENTDIC_COUNTRY  lch_ENTDIC_COUNTRY%ROWTYPE;
begin
--open lch_ENTDIC_COUNTRY;
for row_ENTDIC_COUNTRY in lch_ENTDIC_COUNTRY loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_COUNTRY where ENTDIC_COUNTRYid=row_ENTDIC_COUNTRY.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_COUNTRY;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_COUNTRY;
     return;
   end if; 
 end if; 
 ENTDIC_COUNTRY_HCL (acursession,ROW_ENTDIC_COUNTRY.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_COUNTRY;
   return;
 end if;
 end loop;
--close lch_ENTDIC_COUNTRY;
end;
declare cursor lch_ENTDIC_PACKAGE is select ENTDIC_PACKAGE.ENTDIC_PACKAGEid ID from ENTDIC_PACKAGE where  ENTDIC_PACKAGE.InstanceID = arowid;
ROW_ENTDIC_PACKAGE  lch_ENTDIC_PACKAGE%ROWTYPE;
begin
--open lch_ENTDIC_PACKAGE;
for row_ENTDIC_PACKAGE in lch_ENTDIC_PACKAGE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_PACKAGE where ENTDIC_PACKAGEid=row_ENTDIC_PACKAGE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_PACKAGE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_PACKAGE;
     return;
   end if; 
 end if; 
 ENTDIC_PACKAGE_HCL (acursession,ROW_ENTDIC_PACKAGE.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_PACKAGE;
   return;
 end if;
 end loop;
--close lch_ENTDIC_PACKAGE;
end;
declare cursor lch_ENTDIC_SRV is select ENTDIC_SRV.ENTDIC_SRVid ID from ENTDIC_SRV where  ENTDIC_SRV.InstanceID = arowid;
ROW_ENTDIC_SRV  lch_ENTDIC_SRV%ROWTYPE;
begin
--open lch_ENTDIC_SRV;
for row_ENTDIC_SRV in lch_ENTDIC_SRV loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_SRV where ENTDIC_SRVid=row_ENTDIC_SRV.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_SRV;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_SRV;
     return;
   end if; 
 end if; 
 ENTDIC_SRV_HCL (acursession,ROW_ENTDIC_SRV.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_SRV;
   return;
 end if;
 end loop;
--close lch_ENTDIC_SRV;
end;
declare cursor lch_ENTDiC_RETTYPE is select ENTDiC_RETTYPE.ENTDiC_RETTYPEid ID from ENTDiC_RETTYPE where  ENTDiC_RETTYPE.InstanceID = arowid;
ROW_ENTDiC_RETTYPE  lch_ENTDiC_RETTYPE%ROWTYPE;
begin
--open lch_ENTDiC_RETTYPE;
for row_ENTDiC_RETTYPE in lch_ENTDiC_RETTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDiC_RETTYPE where ENTDiC_RETTYPEid=row_ENTDiC_RETTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDiC_RETTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDiC_RETTYPE;
     return;
   end if; 
 end if; 
 ENTDiC_RETTYPE_HCL (acursession,ROW_ENTDiC_RETTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDiC_RETTYPE;
   return;
 end if;
 end loop;
--close lch_ENTDiC_RETTYPE;
end;
declare cursor lch_ENTDIC_REGION is select ENTDIC_REGION.ENTDIC_REGIONid ID from ENTDIC_REGION where  ENTDIC_REGION.InstanceID = arowid;
ROW_ENTDIC_REGION  lch_ENTDIC_REGION%ROWTYPE;
begin
--open lch_ENTDIC_REGION;
for row_ENTDIC_REGION in lch_ENTDIC_REGION loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_REGION where ENTDIC_REGIONid=row_ENTDIC_REGION.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_REGION;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_REGION;
     return;
   end if; 
 end if; 
 ENTDIC_REGION_HCL (acursession,ROW_ENTDIC_REGION.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_REGION;
   return;
 end if;
 end loop;
--close lch_ENTDIC_REGION;
end;
declare cursor lch_ENTDIC_VOT is select ENTDIC_VOT.ENTDIC_VOTid ID from ENTDIC_VOT where  ENTDIC_VOT.InstanceID = arowid;
ROW_ENTDIC_VOT  lch_ENTDIC_VOT%ROWTYPE;
begin
--open lch_ENTDIC_VOT;
for row_ENTDIC_VOT in lch_ENTDIC_VOT loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_VOT where ENTDIC_VOTid=row_ENTDIC_VOT.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_VOT;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_VOT;
     return;
   end if; 
 end if; 
 ENTDIC_VOT_HCL (acursession,ROW_ENTDIC_VOT.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_VOT;
   return;
 end if;
 end loop;
--close lch_ENTDIC_VOT;
end;
declare cursor lch_ENTDIC_PRTYPE is select ENTDIC_PRTYPE.ENTDIC_PRTYPEid ID from ENTDIC_PRTYPE where  ENTDIC_PRTYPE.InstanceID = arowid;
ROW_ENTDIC_PRTYPE  lch_ENTDIC_PRTYPE%ROWTYPE;
begin
--open lch_ENTDIC_PRTYPE;
for row_ENTDIC_PRTYPE in lch_ENTDIC_PRTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_PRTYPE where ENTDIC_PRTYPEid=row_ENTDIC_PRTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_PRTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_PRTYPE;
     return;
   end if; 
 end if; 
 ENTDIC_PRTYPE_HCL (acursession,ROW_ENTDIC_PRTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_PRTYPE;
   return;
 end if;
 end loop;
--close lch_ENTDIC_PRTYPE;
end;
declare cursor lch_ENTDIC_NALOGI is select ENTDIC_NALOGI.ENTDIC_NALOGIid ID from ENTDIC_NALOGI where  ENTDIC_NALOGI.InstanceID = arowid;
ROW_ENTDIC_NALOGI  lch_ENTDIC_NALOGI%ROWTYPE;
begin
--open lch_ENTDIC_NALOGI;
for row_ENTDIC_NALOGI in lch_ENTDIC_NALOGI loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from ENTDIC_NALOGI where ENTDIC_NALOGIid=row_ENTDIC_NALOGI.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_NALOGI;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_ENTDIC_NALOGI;
     return;
   end if; 
 end if; 
 ENTDIC_NALOGI_HCL (acursession,ROW_ENTDIC_NALOGI.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_NALOGI;
   return;
 end if;
 end loop;
--close lch_ENTDIC_NALOGI;
end;
 end if;
aIsLocked:=0;
end;
procedure ENTDIC_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'ENTDIC'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_ENTDIC_BANK is select ENTDIC_BANK.ENTDIC_BANKid id from ENTDIC_BANK where  ENTDIC_BANK.InstanceID = arowid;
row_ENTDIC_BANK  pch_ENTDIC_BANK%ROWTYPE;
begin
--open pch_ENTDIC_BANK;
for row_ENTDIC_BANK in  pch_ENTDIC_BANK loop
 ENTDIC_BANK_SINIT( acursession,row_ENTDIC_BANK.id,assid);
 ENTDIC_BANK_propagate( acursession,row_ENTDIC_BANK.id);
end loop;
--close pch_ENTDIC_BANK;
end;
declare cursor pch_ENTDIC_MTYPE is select ENTDIC_MTYPE.ENTDIC_MTYPEid id from ENTDIC_MTYPE where  ENTDIC_MTYPE.InstanceID = arowid;
row_ENTDIC_MTYPE  pch_ENTDIC_MTYPE%ROWTYPE;
begin
--open pch_ENTDIC_MTYPE;
for row_ENTDIC_MTYPE in  pch_ENTDIC_MTYPE loop
 ENTDIC_MTYPE_SINIT( acursession,row_ENTDIC_MTYPE.id,assid);
 ENTDIC_MTYPE_propagate( acursession,row_ENTDIC_MTYPE.id);
end loop;
--close pch_ENTDIC_MTYPE;
end;
declare cursor pch_ENTDIC_DOST is select ENTDIC_DOST.ENTDIC_DOSTid id from ENTDIC_DOST where  ENTDIC_DOST.InstanceID = arowid;
row_ENTDIC_DOST  pch_ENTDIC_DOST%ROWTYPE;
begin
--open pch_ENTDIC_DOST;
for row_ENTDIC_DOST in  pch_ENTDIC_DOST loop
 ENTDIC_DOST_SINIT( acursession,row_ENTDIC_DOST.id,assid);
 ENTDIC_DOST_propagate( acursession,row_ENTDIC_DOST.id);
end loop;
--close pch_ENTDIC_DOST;
end;
declare cursor pch_ENTDIC_TOWN is select ENTDIC_TOWN.ENTDIC_TOWNid id from ENTDIC_TOWN where  ENTDIC_TOWN.InstanceID = arowid;
row_ENTDIC_TOWN  pch_ENTDIC_TOWN%ROWTYPE;
begin
--open pch_ENTDIC_TOWN;
for row_ENTDIC_TOWN in  pch_ENTDIC_TOWN loop
 ENTDIC_TOWN_SINIT( acursession,row_ENTDIC_TOWN.id,assid);
 ENTDIC_TOWN_propagate( acursession,row_ENTDIC_TOWN.id);
end loop;
--close pch_ENTDIC_TOWN;
end;
declare cursor pch_ENTDIC_ANALIZ is select ENTDIC_ANALIZ.ENTDIC_ANALIZid id from ENTDIC_ANALIZ where  ENTDIC_ANALIZ.InstanceID = arowid;
row_ENTDIC_ANALIZ  pch_ENTDIC_ANALIZ%ROWTYPE;
begin
--open pch_ENTDIC_ANALIZ;
for row_ENTDIC_ANALIZ in  pch_ENTDIC_ANALIZ loop
 ENTDIC_ANALIZ_SINIT( acursession,row_ENTDIC_ANALIZ.id,assid);
 ENTDIC_ANALIZ_propagate( acursession,row_ENTDIC_ANALIZ.id);
end loop;
--close pch_ENTDIC_ANALIZ;
end;
declare cursor pch_ENTDIC_NTYPE is select ENTDIC_NTYPE.ENTDIC_NTYPEid id from ENTDIC_NTYPE where  ENTDIC_NTYPE.InstanceID = arowid;
row_ENTDIC_NTYPE  pch_ENTDIC_NTYPE%ROWTYPE;
begin
--open pch_ENTDIC_NTYPE;
for row_ENTDIC_NTYPE in  pch_ENTDIC_NTYPE loop
 ENTDIC_NTYPE_SINIT( acursession,row_ENTDIC_NTYPE.id,assid);
 ENTDIC_NTYPE_propagate( acursession,row_ENTDIC_NTYPE.id);
end loop;
--close pch_ENTDIC_NTYPE;
end;
declare cursor pch_ENTDIC_DEPTYPE is select ENTDIC_DEPTYPE.ENTDIC_DEPTYPEid id from ENTDIC_DEPTYPE where  ENTDIC_DEPTYPE.InstanceID = arowid;
row_ENTDIC_DEPTYPE  pch_ENTDIC_DEPTYPE%ROWTYPE;
begin
--open pch_ENTDIC_DEPTYPE;
for row_ENTDIC_DEPTYPE in  pch_ENTDIC_DEPTYPE loop
 ENTDIC_DEPTYPE_SINIT( acursession,row_ENTDIC_DEPTYPE.id,assid);
 ENTDIC_DEPTYPE_propagate( acursession,row_ENTDIC_DEPTYPE.id);
end loop;
--close pch_ENTDIC_DEPTYPE;
end;
declare cursor pch_ENTDIC_URTYPE is select ENTDIC_URTYPE.ENTDIC_URTYPEid id from ENTDIC_URTYPE where  ENTDIC_URTYPE.InstanceID = arowid;
row_ENTDIC_URTYPE  pch_ENTDIC_URTYPE%ROWTYPE;
begin
--open pch_ENTDIC_URTYPE;
for row_ENTDIC_URTYPE in  pch_ENTDIC_URTYPE loop
 ENTDIC_URTYPE_SINIT( acursession,row_ENTDIC_URTYPE.id,assid);
 ENTDIC_URTYPE_propagate( acursession,row_ENTDIC_URTYPE.id);
end loop;
--close pch_ENTDIC_URTYPE;
end;
declare cursor pch_ENTDIC_VOP is select ENTDIC_VOP.ENTDIC_VOPid id from ENTDIC_VOP where  ENTDIC_VOP.InstanceID = arowid;
row_ENTDIC_VOP  pch_ENTDIC_VOP%ROWTYPE;
begin
--open pch_ENTDIC_VOP;
for row_ENTDIC_VOP in  pch_ENTDIC_VOP loop
 ENTDIC_VOP_SINIT( acursession,row_ENTDIC_VOP.id,assid);
 ENTDIC_VOP_propagate( acursession,row_ENTDIC_VOP.id);
end loop;
--close pch_ENTDIC_VOP;
end;
declare cursor pch_ENTDIC_VP is select ENTDIC_VP.ENTDIC_VPid id from ENTDIC_VP where  ENTDIC_VP.InstanceID = arowid;
row_ENTDIC_VP  pch_ENTDIC_VP%ROWTYPE;
begin
--open pch_ENTDIC_VP;
for row_ENTDIC_VP in  pch_ENTDIC_VP loop
 ENTDIC_VP_SINIT( acursession,row_ENTDIC_VP.id,assid);
 ENTDIC_VP_propagate( acursession,row_ENTDIC_VP.id);
end loop;
--close pch_ENTDIC_VP;
end;
declare cursor pch_ENTDIC_EDIZM is select ENTDIC_EDIZM.ENTDIC_EDIZMid id from ENTDIC_EDIZM where  ENTDIC_EDIZM.InstanceID = arowid;
row_ENTDIC_EDIZM  pch_ENTDIC_EDIZM%ROWTYPE;
begin
--open pch_ENTDIC_EDIZM;
for row_ENTDIC_EDIZM in  pch_ENTDIC_EDIZM loop
 ENTDIC_EDIZM_SINIT( acursession,row_ENTDIC_EDIZM.id,assid);
 ENTDIC_EDIZM_propagate( acursession,row_ENTDIC_EDIZM.id);
end loop;
--close pch_ENTDIC_EDIZM;
end;
declare cursor pch_ENTDIC_RWSRV is select ENTDIC_RWSRV.ENTDIC_RWSRVid id from ENTDIC_RWSRV where  ENTDIC_RWSRV.InstanceID = arowid;
row_ENTDIC_RWSRV  pch_ENTDIC_RWSRV%ROWTYPE;
begin
--open pch_ENTDIC_RWSRV;
for row_ENTDIC_RWSRV in  pch_ENTDIC_RWSRV loop
 ENTDIC_RWSRV_SINIT( acursession,row_ENTDIC_RWSRV.id,assid);
 ENTDIC_RWSRV_propagate( acursession,row_ENTDIC_RWSRV.id);
end loop;
--close pch_ENTDIC_RWSRV;
end;
declare cursor pch_ENTDIC_RW is select ENTDIC_RW.ENTDIC_RWid id from ENTDIC_RW where  ENTDIC_RW.InstanceID = arowid;
row_ENTDIC_RW  pch_ENTDIC_RW%ROWTYPE;
begin
--open pch_ENTDIC_RW;
for row_ENTDIC_RW in  pch_ENTDIC_RW loop
 ENTDIC_RW_SINIT( acursession,row_ENTDIC_RW.id,assid);
 ENTDIC_RW_propagate( acursession,row_ENTDIC_RW.id);
end loop;
--close pch_ENTDIC_RW;
end;
declare cursor pch_ENTDIC_IZMAP is select ENTDIC_IZMAP.ENTDIC_IZMAPid id from ENTDIC_IZMAP where  ENTDIC_IZMAP.InstanceID = arowid;
row_ENTDIC_IZMAP  pch_ENTDIC_IZMAP%ROWTYPE;
begin
--open pch_ENTDIC_IZMAP;
for row_ENTDIC_IZMAP in  pch_ENTDIC_IZMAP loop
 ENTDIC_IZMAP_SINIT( acursession,row_ENTDIC_IZMAP.id,assid);
 ENTDIC_IZMAP_propagate( acursession,row_ENTDIC_IZMAP.id);
end loop;
--close pch_ENTDIC_IZMAP;
end;
declare cursor pch_ENTDIC_CURRENCY is select ENTDIC_CURRENCY.ENTDIC_CURRENCYid id from ENTDIC_CURRENCY where  ENTDIC_CURRENCY.InstanceID = arowid;
row_ENTDIC_CURRENCY  pch_ENTDIC_CURRENCY%ROWTYPE;
begin
--open pch_ENTDIC_CURRENCY;
for row_ENTDIC_CURRENCY in  pch_ENTDIC_CURRENCY loop
 ENTDIC_CURRENCY_SINIT( acursession,row_ENTDIC_CURRENCY.id,assid);
 ENTDIC_CURRENCY_propagate( acursession,row_ENTDIC_CURRENCY.id);
end loop;
--close pch_ENTDIC_CURRENCY;
end;
declare cursor pch_ENTDIC_TRREG is select ENTDIC_TRREG.ENTDIC_TRREGid id from ENTDIC_TRREG where  ENTDIC_TRREG.InstanceID = arowid;
row_ENTDIC_TRREG  pch_ENTDIC_TRREG%ROWTYPE;
begin
--open pch_ENTDIC_TRREG;
for row_ENTDIC_TRREG in  pch_ENTDIC_TRREG loop
 ENTDIC_TRREG_SINIT( acursession,row_ENTDIC_TRREG.id,assid);
 ENTDIC_TRREG_propagate( acursession,row_ENTDIC_TRREG.id);
end loop;
--close pch_ENTDIC_TRREG;
end;
declare cursor pch_ENTDIC_STORETYPE is select ENTDIC_STORETYPE.ENTDIC_STORETYPEid id from ENTDIC_STORETYPE where  ENTDIC_STORETYPE.InstanceID = arowid;
row_ENTDIC_STORETYPE  pch_ENTDIC_STORETYPE%ROWTYPE;
begin
--open pch_ENTDIC_STORETYPE;
for row_ENTDIC_STORETYPE in  pch_ENTDIC_STORETYPE loop
 ENTDIC_STORETYPE_SINIT( acursession,row_ENTDIC_STORETYPE.id,assid);
 ENTDIC_STORETYPE_propagate( acursession,row_ENTDIC_STORETYPE.id);
end loop;
--close pch_ENTDIC_STORETYPE;
end;
declare cursor pch_ENTDIC_MACHINES is select ENTDIC_MACHINES.ENTDIC_MACHINESid id from ENTDIC_MACHINES where  ENTDIC_MACHINES.InstanceID = arowid;
row_ENTDIC_MACHINES  pch_ENTDIC_MACHINES%ROWTYPE;
begin
--open pch_ENTDIC_MACHINES;
for row_ENTDIC_MACHINES in  pch_ENTDIC_MACHINES loop
 ENTDIC_MACHINES_SINIT( acursession,row_ENTDIC_MACHINES.id,assid);
 ENTDIC_MACHINES_propagate( acursession,row_ENTDIC_MACHINES.id);
end loop;
--close pch_ENTDIC_MACHINES;
end;
declare cursor pch_ENTDIC_CLITYPE is select ENTDIC_CLITYPE.ENTDIC_CLITYPEid id from ENTDIC_CLITYPE where  ENTDIC_CLITYPE.InstanceID = arowid;
row_ENTDIC_CLITYPE  pch_ENTDIC_CLITYPE%ROWTYPE;
begin
--open pch_ENTDIC_CLITYPE;
for row_ENTDIC_CLITYPE in  pch_ENTDIC_CLITYPE loop
 ENTDIC_CLITYPE_SINIT( acursession,row_ENTDIC_CLITYPE.id,assid);
 ENTDIC_CLITYPE_propagate( acursession,row_ENTDIC_CLITYPE.id);
end loop;
--close pch_ENTDIC_CLITYPE;
end;
declare cursor pch_ENTDIC_COUNTRY is select ENTDIC_COUNTRY.ENTDIC_COUNTRYid id from ENTDIC_COUNTRY where  ENTDIC_COUNTRY.InstanceID = arowid;
row_ENTDIC_COUNTRY  pch_ENTDIC_COUNTRY%ROWTYPE;
begin
--open pch_ENTDIC_COUNTRY;
for row_ENTDIC_COUNTRY in  pch_ENTDIC_COUNTRY loop
 ENTDIC_COUNTRY_SINIT( acursession,row_ENTDIC_COUNTRY.id,assid);
 ENTDIC_COUNTRY_propagate( acursession,row_ENTDIC_COUNTRY.id);
end loop;
--close pch_ENTDIC_COUNTRY;
end;
declare cursor pch_ENTDIC_PACKAGE is select ENTDIC_PACKAGE.ENTDIC_PACKAGEid id from ENTDIC_PACKAGE where  ENTDIC_PACKAGE.InstanceID = arowid;
row_ENTDIC_PACKAGE  pch_ENTDIC_PACKAGE%ROWTYPE;
begin
--open pch_ENTDIC_PACKAGE;
for row_ENTDIC_PACKAGE in  pch_ENTDIC_PACKAGE loop
 ENTDIC_PACKAGE_SINIT( acursession,row_ENTDIC_PACKAGE.id,assid);
 ENTDIC_PACKAGE_propagate( acursession,row_ENTDIC_PACKAGE.id);
end loop;
--close pch_ENTDIC_PACKAGE;
end;
declare cursor pch_ENTDIC_SRV is select ENTDIC_SRV.ENTDIC_SRVid id from ENTDIC_SRV where  ENTDIC_SRV.InstanceID = arowid;
row_ENTDIC_SRV  pch_ENTDIC_SRV%ROWTYPE;
begin
--open pch_ENTDIC_SRV;
for row_ENTDIC_SRV in  pch_ENTDIC_SRV loop
 ENTDIC_SRV_SINIT( acursession,row_ENTDIC_SRV.id,assid);
 ENTDIC_SRV_propagate( acursession,row_ENTDIC_SRV.id);
end loop;
--close pch_ENTDIC_SRV;
end;
declare cursor pch_ENTDiC_RETTYPE is select ENTDiC_RETTYPE.ENTDiC_RETTYPEid id from ENTDiC_RETTYPE where  ENTDiC_RETTYPE.InstanceID = arowid;
row_ENTDiC_RETTYPE  pch_ENTDiC_RETTYPE%ROWTYPE;
begin
--open pch_ENTDiC_RETTYPE;
for row_ENTDiC_RETTYPE in  pch_ENTDiC_RETTYPE loop
 ENTDiC_RETTYPE_SINIT( acursession,row_ENTDiC_RETTYPE.id,assid);
 ENTDiC_RETTYPE_propagate( acursession,row_ENTDiC_RETTYPE.id);
end loop;
--close pch_ENTDiC_RETTYPE;
end;
declare cursor pch_ENTDIC_REGION is select ENTDIC_REGION.ENTDIC_REGIONid id from ENTDIC_REGION where  ENTDIC_REGION.InstanceID = arowid;
row_ENTDIC_REGION  pch_ENTDIC_REGION%ROWTYPE;
begin
--open pch_ENTDIC_REGION;
for row_ENTDIC_REGION in  pch_ENTDIC_REGION loop
 ENTDIC_REGION_SINIT( acursession,row_ENTDIC_REGION.id,assid);
 ENTDIC_REGION_propagate( acursession,row_ENTDIC_REGION.id);
end loop;
--close pch_ENTDIC_REGION;
end;
declare cursor pch_ENTDIC_VOT is select ENTDIC_VOT.ENTDIC_VOTid id from ENTDIC_VOT where  ENTDIC_VOT.InstanceID = arowid;
row_ENTDIC_VOT  pch_ENTDIC_VOT%ROWTYPE;
begin
--open pch_ENTDIC_VOT;
for row_ENTDIC_VOT in  pch_ENTDIC_VOT loop
 ENTDIC_VOT_SINIT( acursession,row_ENTDIC_VOT.id,assid);
 ENTDIC_VOT_propagate( acursession,row_ENTDIC_VOT.id);
end loop;
--close pch_ENTDIC_VOT;
end;
declare cursor pch_ENTDIC_PRTYPE is select ENTDIC_PRTYPE.ENTDIC_PRTYPEid id from ENTDIC_PRTYPE where  ENTDIC_PRTYPE.InstanceID = arowid;
row_ENTDIC_PRTYPE  pch_ENTDIC_PRTYPE%ROWTYPE;
begin
--open pch_ENTDIC_PRTYPE;
for row_ENTDIC_PRTYPE in  pch_ENTDIC_PRTYPE loop
 ENTDIC_PRTYPE_SINIT( acursession,row_ENTDIC_PRTYPE.id,assid);
 ENTDIC_PRTYPE_propagate( acursession,row_ENTDIC_PRTYPE.id);
end loop;
--close pch_ENTDIC_PRTYPE;
end;
declare cursor pch_ENTDIC_NALOGI is select ENTDIC_NALOGI.ENTDIC_NALOGIid id from ENTDIC_NALOGI where  ENTDIC_NALOGI.InstanceID = arowid;
row_ENTDIC_NALOGI  pch_ENTDIC_NALOGI%ROWTYPE;
begin
--open pch_ENTDIC_NALOGI;
for row_ENTDIC_NALOGI in  pch_ENTDIC_NALOGI loop
 ENTDIC_NALOGI_SINIT( acursession,row_ENTDIC_NALOGI.id,assid);
 ENTDIC_NALOGI_propagate( acursession,row_ENTDIC_NALOGI.id);
end loop;
--close pch_ENTDIC_NALOGI;
end;
 end if; 
end;



procedure ENTDIC_BANK_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_BANKid CHAR,
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
if aENTDIC_BANKid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_BANK where ENTDIC_BANKID=aENTDIC_BANKID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_BANK where ENTDIC_BANKid=aENTDIC_BANKID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_BANK');
    return;
  end if;
  aBRIEF:=func.ENTDIC_BANK_BRIEF_F(aENTDIC_BANKid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_BANK_DELETE /*Банки*/ (
 aCURSESSION CHAR,
 aENTDIC_BANKid CHAR,
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
select count(*) into existsCnt from ENTDIC_BANK where ENTDIC_BANKID=aENTDIC_BANKID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_BANK where ENTDIC_BANKid=aENTDIC_BANKID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_BANK',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_BANK');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_BANK_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_BANKid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_BANK');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_BANK',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_BANKid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_BANK is select  instanceid ID from instance where OwnerPartName ='ENTDIC_BANK' and OwnerRowID=aENTDIC_BANKid;
row_ENTDIC_BANK  chld_ENTDIC_BANK%ROWTYPE;
begin
--open chld_ENTDIC_BANK;
for row_ENTDIC_BANK in chld_ENTDIC_BANK loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_BANK.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_BANK.id);
end loop;
--close chld_ENTDIC_BANK;
end ;
  delete from  ENTDIC_BANK 
  where  ENTDIC_BANKID = aENTDIC_BANKID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Банки*/
procedure ENTDIC_BANK_SAVE /*Банки*/ (
 aCURSESSION CHAR,
 aENTDIC_BANKid CHAR,
aInstanceID CHAR 
,aBIC
 VARCHAR2/* БИК *//* БИК */
,aRKC
 VARCHAR2/* РКЦ *//* РКЦ */
,aACC
 VARCHAR2 := null /* Счет *//* Счет */
,aKORACC
 VARCHAR2 := null /* Кор. счет *//* Кор. счет */
,aSUBKORACC
 VARCHAR2 := null /* Суб кор счет *//* Суб кор счет */
,aname
 VARCHAR2/* Название *//* Название */
,aAddr
 VARCHAR2 := null /* Адрес *//* Адрес */
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
select count(*) into existsCnt from ENTDIC_BANK where ENTDIC_BANKID=aENTDIC_BANKID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_BANK where ENTDIC_BANKid=aENTDIC_BANKID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_BANK',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_BANK');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_BANK_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_BANKid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_BANK');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_BANK',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_BANKid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_BANK set ChangeStamp=sysdate
,
  BIC=aBIC
,
  RKC=aRKC
,
  ACC=aACC
,
  KORACC=aKORACC
,
  SUBKORACC=aSUBKORACC
,
  name=aname
,
  Addr=aAddr
,
  Code1C=aCode1C
  where  ENTDIC_BANKID = aENTDIC_BANKID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_BANK',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_BANK');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_BANK');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_BANK',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_BANKid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_BANK
 (  ENTDIC_BANKID 
,InstanceID
,BIC

,RKC

,ACC

,KORACC

,SUBKORACC

,name

,Addr

,Code1C

 ) values ( aENTDIC_BANKID 
,aInstanceID
,aBIC

,aRKC

,aACC

,aKORACC

,aSUBKORACC

,aname

,aAddr

,aCode1C

 ); 
 ENTDIC_BANK_SINIT( aCURSESSION,aENTDIC_BANKid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_BANK_PARENT /*Банки*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_BANK where  ENTDIC_BANKid=aRowID;
 end; 


procedure ENTDIC_BANK_ISLOCKED /*Банки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_BANK where ENTDIC_BANKid=aRowID;
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
  ENTDIC_BANK_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_BANK_LOCK /*Банки*/ (
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
 ENTDIC_BANK_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_BANK_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_BANK where ENTDIC_BANKid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_BANK');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_BANK set LockUserID =auserID ,LockSessionID =null where ENTDIC_BANKid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_BANK set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_BANKid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_BANK_HCL /*Банки*/ (
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


procedure ENTDIC_BANK_UNLOCK /*Банки*/ (
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
 ENTDIC_BANK_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_BANK set LockUserID =null  where ENTDIC_BANKid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_BANK set LockSessionID =null  where ENTDIC_BANKid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_BANK_SINIT /*Банки*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_BANK where ENTDIC_BANKid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_BANK');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_BANK_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_BANK set securitystyleid =aStyleID where ENTDIC_BANKid = aRowID;
else 
 update ENTDIC_BANK set securitystyleid =aSecurityStyleID where ENTDIC_BANKid = aRowID;
end if; 
end ; 


procedure ENTDIC_BANK_propagate /*Банки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_BANK where ENTDIC_BANKid=aRowid;
end;



procedure ENTDIC_MTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_MTYPEid CHAR,
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
if aENTDIC_MTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_MTYPE where ENTDIC_MTYPEID=aENTDIC_MTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_MTYPE where ENTDIC_MTYPEid=aENTDIC_MTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_MTYPE');
    return;
  end if;
  aBRIEF:=func.ENTDIC_MTYPE_BRIEF_F(aENTDIC_MTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_MTYPE_DELETE /*Тип материала*/ (
 aCURSESSION CHAR,
 aENTDIC_MTYPEid CHAR,
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
select count(*) into existsCnt from ENTDIC_MTYPE where ENTDIC_MTYPEID=aENTDIC_MTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_MTYPE where ENTDIC_MTYPEid=aENTDIC_MTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_MTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_MTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_MTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_MTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_MTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_MTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_MTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_MTYPE is select  instanceid ID from instance where OwnerPartName ='ENTDIC_MTYPE' and OwnerRowID=aENTDIC_MTYPEid;
row_ENTDIC_MTYPE  chld_ENTDIC_MTYPE%ROWTYPE;
begin
--open chld_ENTDIC_MTYPE;
for row_ENTDIC_MTYPE in chld_ENTDIC_MTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_MTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_MTYPE.id);
end loop;
--close chld_ENTDIC_MTYPE;
end ;
  delete from  ENTDIC_MTYPE 
  where  ENTDIC_MTYPEID = aENTDIC_MTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип материала*/
procedure ENTDIC_MTYPE_SAVE /*Тип материала*/ (
 aCURSESSION CHAR,
 aENTDIC_MTYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_MTYPE where ENTDIC_MTYPEID=aENTDIC_MTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_MTYPE where ENTDIC_MTYPEid=aENTDIC_MTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_MTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_MTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_MTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_MTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_MTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_MTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_MTYPEid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_MTYPE set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_MTYPEID = aENTDIC_MTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_MTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_MTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_MTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_MTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_MTYPEid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_MTYPE
 (  ENTDIC_MTYPEID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_MTYPEID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_MTYPE_SINIT( aCURSESSION,aENTDIC_MTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_MTYPE_PARENT /*Тип материала*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_MTYPE where  ENTDIC_MTYPEid=aRowID;
 end; 


procedure ENTDIC_MTYPE_ISLOCKED /*Тип материала*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_MTYPE where ENTDIC_MTYPEid=aRowID;
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
  ENTDIC_MTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_MTYPE_LOCK /*Тип материала*/ (
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
 ENTDIC_MTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_MTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_MTYPE where ENTDIC_MTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_MTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_MTYPE set LockUserID =auserID ,LockSessionID =null where ENTDIC_MTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_MTYPE set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_MTYPEid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_MTYPE_HCL /*Тип материала*/ (
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


procedure ENTDIC_MTYPE_UNLOCK /*Тип материала*/ (
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
 ENTDIC_MTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_MTYPE set LockUserID =null  where ENTDIC_MTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_MTYPE set LockSessionID =null  where ENTDIC_MTYPEid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_MTYPE_SINIT /*Тип материала*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_MTYPE where ENTDIC_MTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_MTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_MTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_MTYPE set securitystyleid =aStyleID where ENTDIC_MTYPEid = aRowID;
else 
 update ENTDIC_MTYPE set securitystyleid =aSecurityStyleID where ENTDIC_MTYPEid = aRowID;
end if; 
end ; 


procedure ENTDIC_MTYPE_propagate /*Тип материала*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_MTYPE where ENTDIC_MTYPEid=aRowid;
end;



procedure ENTDIC_DOST_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_DOSTid CHAR,
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
if aENTDIC_DOSTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_DOST where ENTDIC_DOSTID=aENTDIC_DOSTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_DOST where ENTDIC_DOSTid=aENTDIC_DOSTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_DOST');
    return;
  end if;
  aBRIEF:=func.ENTDIC_DOST_BRIEF_F(aENTDIC_DOSTid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_DOST_DELETE /*Тип доставки*/ (
 aCURSESSION CHAR,
 aENTDIC_DOSTid CHAR,
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
select count(*) into existsCnt from ENTDIC_DOST where ENTDIC_DOSTID=aENTDIC_DOSTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_DOST where ENTDIC_DOSTid=aENTDIC_DOSTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_DOST',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_DOST');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_DOST_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_DOSTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_DOST');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_DOST',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_DOSTid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_DOST is select  instanceid ID from instance where OwnerPartName ='ENTDIC_DOST' and OwnerRowID=aENTDIC_DOSTid;
row_ENTDIC_DOST  chld_ENTDIC_DOST%ROWTYPE;
begin
--open chld_ENTDIC_DOST;
for row_ENTDIC_DOST in chld_ENTDIC_DOST loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_DOST.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_DOST.id);
end loop;
--close chld_ENTDIC_DOST;
end ;
  delete from  ENTDIC_DOST 
  where  ENTDIC_DOSTID = aENTDIC_DOSTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип доставки*/
procedure ENTDIC_DOST_SAVE /*Тип доставки*/ (
 aCURSESSION CHAR,
 aENTDIC_DOSTid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_DOST where ENTDIC_DOSTID=aENTDIC_DOSTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_DOST where ENTDIC_DOSTid=aENTDIC_DOSTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_DOST',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_DOST');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_DOST_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_DOSTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_DOST');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_DOST',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_DOSTid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_DOST set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_DOSTID = aENTDIC_DOSTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_DOST',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_DOST');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_DOST');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_DOST',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_DOSTid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_DOST
 (  ENTDIC_DOSTID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_DOSTID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_DOST_SINIT( aCURSESSION,aENTDIC_DOSTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_DOST_PARENT /*Тип доставки*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_DOST where  ENTDIC_DOSTid=aRowID;
 end; 


procedure ENTDIC_DOST_ISLOCKED /*Тип доставки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_DOST where ENTDIC_DOSTid=aRowID;
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
  ENTDIC_DOST_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_DOST_LOCK /*Тип доставки*/ (
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
 ENTDIC_DOST_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_DOST_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_DOST where ENTDIC_DOSTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_DOST');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_DOST set LockUserID =auserID ,LockSessionID =null where ENTDIC_DOSTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_DOST set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_DOSTid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_DOST_HCL /*Тип доставки*/ (
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


procedure ENTDIC_DOST_UNLOCK /*Тип доставки*/ (
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
 ENTDIC_DOST_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_DOST set LockUserID =null  where ENTDIC_DOSTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_DOST set LockSessionID =null  where ENTDIC_DOSTid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_DOST_SINIT /*Тип доставки*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_DOST where ENTDIC_DOSTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_DOST');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_DOST_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_DOST set securitystyleid =aStyleID where ENTDIC_DOSTid = aRowID;
else 
 update ENTDIC_DOST set securitystyleid =aSecurityStyleID where ENTDIC_DOSTid = aRowID;
end if; 
end ; 


procedure ENTDIC_DOST_propagate /*Тип доставки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_DOST where ENTDIC_DOSTid=aRowid;
end;



procedure ENTDIC_TOWN_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_TOWNid CHAR,
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
if aENTDIC_TOWNid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_TOWN where ENTDIC_TOWNID=aENTDIC_TOWNID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_TOWN where ENTDIC_TOWNid=aENTDIC_TOWNID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_TOWN');
    return;
  end if;
  aBRIEF:=func.ENTDIC_TOWN_BRIEF_F(aENTDIC_TOWNid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_TOWN_DELETE /*Города*/ (
 aCURSESSION CHAR,
 aENTDIC_TOWNid CHAR,
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
select count(*) into existsCnt from ENTDIC_TOWN where ENTDIC_TOWNID=aENTDIC_TOWNID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_TOWN where ENTDIC_TOWNid=aENTDIC_TOWNID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_TOWN',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_TOWN');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_TOWN_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_TOWNid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_TOWN');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_TOWN',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_TOWNid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_TOWN is select  instanceid ID from instance where OwnerPartName ='ENTDIC_TOWN' and OwnerRowID=aENTDIC_TOWNid;
row_ENTDIC_TOWN  chld_ENTDIC_TOWN%ROWTYPE;
begin
--open chld_ENTDIC_TOWN;
for row_ENTDIC_TOWN in chld_ENTDIC_TOWN loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_TOWN.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_TOWN.id);
end loop;
--close chld_ENTDIC_TOWN;
end ;
  delete from  ENTDIC_TOWN 
  where  ENTDIC_TOWNID = aENTDIC_TOWNID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Города*/
procedure ENTDIC_TOWN_SAVE /*Города*/ (
 aCURSESSION CHAR,
 aENTDIC_TOWNid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,acountry CHAR/* Страна *//* Страна */
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
select count(*) into existsCnt from ENTDIC_TOWN where ENTDIC_TOWNID=aENTDIC_TOWNID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_TOWN where ENTDIC_TOWNid=aENTDIC_TOWNID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_TOWN',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_TOWN');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_TOWN_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_TOWNid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_TOWN');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_TOWN',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_TOWNid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_TOWN set ChangeStamp=sysdate
,
  name=aname
,
  country=acountry
  where  ENTDIC_TOWNID = aENTDIC_TOWNID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_TOWN',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_TOWN');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_TOWN');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_TOWN',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_TOWNid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_TOWN
 (  ENTDIC_TOWNID 
,InstanceID
,name

,country

 ) values ( aENTDIC_TOWNID 
,aInstanceID
,aname

,acountry

 ); 
 ENTDIC_TOWN_SINIT( aCURSESSION,aENTDIC_TOWNid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_TOWN_PARENT /*Города*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_TOWN where  ENTDIC_TOWNid=aRowID;
 end; 


procedure ENTDIC_TOWN_ISLOCKED /*Города*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_TOWN where ENTDIC_TOWNid=aRowID;
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
  ENTDIC_TOWN_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_TOWN_LOCK /*Города*/ (
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
 ENTDIC_TOWN_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_TOWN_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_TOWN where ENTDIC_TOWNid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_TOWN');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_TOWN set LockUserID =auserID ,LockSessionID =null where ENTDIC_TOWNid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_TOWN set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_TOWNid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_TOWN_HCL /*Города*/ (
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


procedure ENTDIC_TOWN_UNLOCK /*Города*/ (
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
 ENTDIC_TOWN_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_TOWN set LockUserID =null  where ENTDIC_TOWNid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_TOWN set LockSessionID =null  where ENTDIC_TOWNid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_TOWN_SINIT /*Города*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_TOWN where ENTDIC_TOWNid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_TOWN');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_TOWN_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_TOWN set securitystyleid =aStyleID where ENTDIC_TOWNid = aRowID;
else 
 update ENTDIC_TOWN set securitystyleid =aSecurityStyleID where ENTDIC_TOWNid = aRowID;
end if; 
end ; 


procedure ENTDIC_TOWN_propagate /*Города*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_TOWN where ENTDIC_TOWNid=aRowid;
end;



procedure ENTDIC_ANALIZ_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_ANALIZid CHAR,
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
if aENTDIC_ANALIZid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_ANALIZ where ENTDIC_ANALIZID=aENTDIC_ANALIZID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_ANALIZ where ENTDIC_ANALIZid=aENTDIC_ANALIZID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_ANALIZ');
    return;
  end if;
  aBRIEF:=func.ENTDIC_ANALIZ_BRIEF_F(aENTDIC_ANALIZid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_ANALIZ_DELETE /*Тип лабороторного исследования*/ (
 aCURSESSION CHAR,
 aENTDIC_ANALIZid CHAR,
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
select count(*) into existsCnt from ENTDIC_ANALIZ where ENTDIC_ANALIZID=aENTDIC_ANALIZID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_ANALIZ where ENTDIC_ANALIZid=aENTDIC_ANALIZID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_ANALIZ',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_ANALIZ');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_ANALIZ_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_ANALIZid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_ANALIZ');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_ANALIZ',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_ANALIZid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_ANALIZ is select  instanceid ID from instance where OwnerPartName ='ENTDIC_ANALIZ' and OwnerRowID=aENTDIC_ANALIZid;
row_ENTDIC_ANALIZ  chld_ENTDIC_ANALIZ%ROWTYPE;
begin
--open chld_ENTDIC_ANALIZ;
for row_ENTDIC_ANALIZ in chld_ENTDIC_ANALIZ loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_ANALIZ.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_ANALIZ.id);
end loop;
--close chld_ENTDIC_ANALIZ;
end ;
  delete from  ENTDIC_ANALIZ 
  where  ENTDIC_ANALIZID = aENTDIC_ANALIZID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип лабороторного исследования*/
procedure ENTDIC_ANALIZ_SAVE /*Тип лабороторного исследования*/ (
 aCURSESSION CHAR,
 aENTDIC_ANALIZid CHAR,
aInstanceID CHAR 
,acode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_ANALIZ where ENTDIC_ANALIZID=aENTDIC_ANALIZID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_ANALIZ where ENTDIC_ANALIZid=aENTDIC_ANALIZID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_ANALIZ',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_ANALIZ');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_ANALIZ_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_ANALIZid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_ANALIZ');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_ANALIZ',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_ANALIZid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_ANALIZ set ChangeStamp=sysdate
,
  code=acode
,
  name=aname
  where  ENTDIC_ANALIZID = aENTDIC_ANALIZID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_ANALIZ',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_ANALIZ');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_ANALIZ');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_ANALIZ',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_ANALIZid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_ANALIZ
 (  ENTDIC_ANALIZID 
,InstanceID
,code

,name

 ) values ( aENTDIC_ANALIZID 
,aInstanceID
,acode

,aname

 ); 
 ENTDIC_ANALIZ_SINIT( aCURSESSION,aENTDIC_ANALIZid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_ANALIZ_PARENT /*Тип лабороторного исследования*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_ANALIZ where  ENTDIC_ANALIZid=aRowID;
 end; 


procedure ENTDIC_ANALIZ_ISLOCKED /*Тип лабороторного исследования*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_ANALIZ where ENTDIC_ANALIZid=aRowID;
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
  ENTDIC_ANALIZ_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_ANALIZ_LOCK /*Тип лабороторного исследования*/ (
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
 ENTDIC_ANALIZ_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_ANALIZ_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_ANALIZ where ENTDIC_ANALIZid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_ANALIZ');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_ANALIZ set LockUserID =auserID ,LockSessionID =null where ENTDIC_ANALIZid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_ANALIZ set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_ANALIZid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_ANALIZ_HCL /*Тип лабороторного исследования*/ (
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


procedure ENTDIC_ANALIZ_UNLOCK /*Тип лабороторного исследования*/ (
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
 ENTDIC_ANALIZ_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_ANALIZ set LockUserID =null  where ENTDIC_ANALIZid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_ANALIZ set LockSessionID =null  where ENTDIC_ANALIZid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_ANALIZ_SINIT /*Тип лабороторного исследования*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_ANALIZ where ENTDIC_ANALIZid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_ANALIZ');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_ANALIZ_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_ANALIZ set securitystyleid =aStyleID where ENTDIC_ANALIZid = aRowID;
else 
 update ENTDIC_ANALIZ set securitystyleid =aSecurityStyleID where ENTDIC_ANALIZid = aRowID;
end if; 
end ; 


procedure ENTDIC_ANALIZ_propagate /*Тип лабороторного исследования*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_ANALIZ where ENTDIC_ANALIZid=aRowid;
end;



procedure ENTDIC_NTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_NTYPEid CHAR,
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
if aENTDIC_NTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_NTYPE where ENTDIC_NTYPEID=aENTDIC_NTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_NTYPE where ENTDIC_NTYPEid=aENTDIC_NTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_NTYPE');
    return;
  end if;
  aBRIEF:=func.ENTDIC_NTYPE_BRIEF_F(aENTDIC_NTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_NTYPE_DELETE /*Тип налога*/ (
 aCURSESSION CHAR,
 aENTDIC_NTYPEid CHAR,
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
select count(*) into existsCnt from ENTDIC_NTYPE where ENTDIC_NTYPEID=aENTDIC_NTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_NTYPE where ENTDIC_NTYPEid=aENTDIC_NTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_NTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_NTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_NTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_NTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_NTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_NTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_NTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_NTYPE is select  instanceid ID from instance where OwnerPartName ='ENTDIC_NTYPE' and OwnerRowID=aENTDIC_NTYPEid;
row_ENTDIC_NTYPE  chld_ENTDIC_NTYPE%ROWTYPE;
begin
--open chld_ENTDIC_NTYPE;
for row_ENTDIC_NTYPE in chld_ENTDIC_NTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_NTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_NTYPE.id);
end loop;
--close chld_ENTDIC_NTYPE;
end ;
  delete from  ENTDIC_NTYPE 
  where  ENTDIC_NTYPEID = aENTDIC_NTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип налога*/
procedure ENTDIC_NTYPE_SAVE /*Тип налога*/ (
 aCURSESSION CHAR,
 aENTDIC_NTYPEid CHAR,
aInstanceID CHAR 
,acode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_NTYPE where ENTDIC_NTYPEID=aENTDIC_NTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_NTYPE where ENTDIC_NTYPEid=aENTDIC_NTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_NTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_NTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_NTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_NTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_NTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_NTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_NTYPEid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_NTYPE set ChangeStamp=sysdate
,
  code=acode
,
  name=aname
  where  ENTDIC_NTYPEID = aENTDIC_NTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_NTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_NTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_NTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_NTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_NTYPEid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_NTYPE
 (  ENTDIC_NTYPEID 
,InstanceID
,code

,name

 ) values ( aENTDIC_NTYPEID 
,aInstanceID
,acode

,aname

 ); 
 ENTDIC_NTYPE_SINIT( aCURSESSION,aENTDIC_NTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_NTYPE_PARENT /*Тип налога*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_NTYPE where  ENTDIC_NTYPEid=aRowID;
 end; 


procedure ENTDIC_NTYPE_ISLOCKED /*Тип налога*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_NTYPE where ENTDIC_NTYPEid=aRowID;
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
  ENTDIC_NTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_NTYPE_LOCK /*Тип налога*/ (
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
 ENTDIC_NTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_NTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_NTYPE where ENTDIC_NTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_NTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_NTYPE set LockUserID =auserID ,LockSessionID =null where ENTDIC_NTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_NTYPE set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_NTYPEid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_NTYPE_HCL /*Тип налога*/ (
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


procedure ENTDIC_NTYPE_UNLOCK /*Тип налога*/ (
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
 ENTDIC_NTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_NTYPE set LockUserID =null  where ENTDIC_NTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_NTYPE set LockSessionID =null  where ENTDIC_NTYPEid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_NTYPE_SINIT /*Тип налога*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_NTYPE where ENTDIC_NTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_NTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_NTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_NTYPE set securitystyleid =aStyleID where ENTDIC_NTYPEid = aRowID;
else 
 update ENTDIC_NTYPE set securitystyleid =aSecurityStyleID where ENTDIC_NTYPEid = aRowID;
end if; 
end ; 


procedure ENTDIC_NTYPE_propagate /*Тип налога*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_NTYPE where ENTDIC_NTYPEid=aRowid;
end;



procedure ENTDIC_DEPTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_DEPTYPEid CHAR,
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
if aENTDIC_DEPTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEID=aENTDIC_DEPTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEid=aENTDIC_DEPTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_DEPTYPE');
    return;
  end if;
  aBRIEF:=func.ENTDIC_DEPTYPE_BRIEF_F(aENTDIC_DEPTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_DEPTYPE_DELETE /*Тип подразделения*/ (
 aCURSESSION CHAR,
 aENTDIC_DEPTYPEid CHAR,
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
select count(*) into existsCnt from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEID=aENTDIC_DEPTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEid=aENTDIC_DEPTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_DEPTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_DEPTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_DEPTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_DEPTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_DEPTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_DEPTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_DEPTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_DEPTYPE is select  instanceid ID from instance where OwnerPartName ='ENTDIC_DEPTYPE' and OwnerRowID=aENTDIC_DEPTYPEid;
row_ENTDIC_DEPTYPE  chld_ENTDIC_DEPTYPE%ROWTYPE;
begin
--open chld_ENTDIC_DEPTYPE;
for row_ENTDIC_DEPTYPE in chld_ENTDIC_DEPTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_DEPTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_DEPTYPE.id);
end loop;
--close chld_ENTDIC_DEPTYPE;
end ;
  delete from  ENTDIC_DEPTYPE 
  where  ENTDIC_DEPTYPEID = aENTDIC_DEPTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип подразделения*/
procedure ENTDIC_DEPTYPE_SAVE /*Тип подразделения*/ (
 aCURSESSION CHAR,
 aENTDIC_DEPTYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEID=aENTDIC_DEPTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEid=aENTDIC_DEPTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_DEPTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_DEPTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_DEPTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_DEPTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_DEPTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_DEPTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_DEPTYPEid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_DEPTYPE set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_DEPTYPEID = aENTDIC_DEPTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_DEPTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_DEPTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_DEPTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_DEPTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_DEPTYPEid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_DEPTYPE
 (  ENTDIC_DEPTYPEID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_DEPTYPEID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_DEPTYPE_SINIT( aCURSESSION,aENTDIC_DEPTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_DEPTYPE_PARENT /*Тип подразделения*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_DEPTYPE where  ENTDIC_DEPTYPEid=aRowID;
 end; 


procedure ENTDIC_DEPTYPE_ISLOCKED /*Тип подразделения*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEid=aRowID;
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
  ENTDIC_DEPTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_DEPTYPE_LOCK /*Тип подразделения*/ (
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
 ENTDIC_DEPTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_DEPTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_DEPTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_DEPTYPE set LockUserID =auserID ,LockSessionID =null where ENTDIC_DEPTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_DEPTYPE set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_DEPTYPEid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_DEPTYPE_HCL /*Тип подразделения*/ (
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


procedure ENTDIC_DEPTYPE_UNLOCK /*Тип подразделения*/ (
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
 ENTDIC_DEPTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_DEPTYPE set LockUserID =null  where ENTDIC_DEPTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_DEPTYPE set LockSessionID =null  where ENTDIC_DEPTYPEid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_DEPTYPE_SINIT /*Тип подразделения*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_DEPTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_DEPTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_DEPTYPE set securitystyleid =aStyleID where ENTDIC_DEPTYPEid = aRowID;
else 
 update ENTDIC_DEPTYPE set securitystyleid =aSecurityStyleID where ENTDIC_DEPTYPEid = aRowID;
end if; 
end ; 


procedure ENTDIC_DEPTYPE_propagate /*Тип подразделения*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_DEPTYPE where ENTDIC_DEPTYPEid=aRowid;
end;



procedure ENTDIC_URTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_URTYPEid CHAR,
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
if aENTDIC_URTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_URTYPE where ENTDIC_URTYPEID=aENTDIC_URTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_URTYPE where ENTDIC_URTYPEid=aENTDIC_URTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_URTYPE');
    return;
  end if;
  aBRIEF:=func.ENTDIC_URTYPE_BRIEF_F(aENTDIC_URTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_URTYPE_DELETE /*Тип юридического лица*/ (
 aCURSESSION CHAR,
 aENTDIC_URTYPEid CHAR,
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
select count(*) into existsCnt from ENTDIC_URTYPE where ENTDIC_URTYPEID=aENTDIC_URTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_URTYPE where ENTDIC_URTYPEid=aENTDIC_URTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_URTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_URTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_URTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_URTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_URTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_URTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_URTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_URTYPE is select  instanceid ID from instance where OwnerPartName ='ENTDIC_URTYPE' and OwnerRowID=aENTDIC_URTYPEid;
row_ENTDIC_URTYPE  chld_ENTDIC_URTYPE%ROWTYPE;
begin
--open chld_ENTDIC_URTYPE;
for row_ENTDIC_URTYPE in chld_ENTDIC_URTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_URTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_URTYPE.id);
end loop;
--close chld_ENTDIC_URTYPE;
end ;
  delete from  ENTDIC_URTYPE 
  where  ENTDIC_URTYPEID = aENTDIC_URTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип юридического лица*/
procedure ENTDIC_URTYPE_SAVE /*Тип юридического лица*/ (
 aCURSESSION CHAR,
 aENTDIC_URTYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_URTYPE where ENTDIC_URTYPEID=aENTDIC_URTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_URTYPE where ENTDIC_URTYPEid=aENTDIC_URTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_URTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_URTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_URTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_URTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_URTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_URTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_URTYPEid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_URTYPE set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_URTYPEID = aENTDIC_URTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_URTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_URTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_URTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_URTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_URTYPEid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_URTYPE
 (  ENTDIC_URTYPEID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_URTYPEID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_URTYPE_SINIT( aCURSESSION,aENTDIC_URTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_URTYPE_PARENT /*Тип юридического лица*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_URTYPE where  ENTDIC_URTYPEid=aRowID;
 end; 


procedure ENTDIC_URTYPE_ISLOCKED /*Тип юридического лица*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_URTYPE where ENTDIC_URTYPEid=aRowID;
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
  ENTDIC_URTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_URTYPE_LOCK /*Тип юридического лица*/ (
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
 ENTDIC_URTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_URTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_URTYPE where ENTDIC_URTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_URTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_URTYPE set LockUserID =auserID ,LockSessionID =null where ENTDIC_URTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_URTYPE set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_URTYPEid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_URTYPE_HCL /*Тип юридического лица*/ (
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


procedure ENTDIC_URTYPE_UNLOCK /*Тип юридического лица*/ (
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
 ENTDIC_URTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_URTYPE set LockUserID =null  where ENTDIC_URTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_URTYPE set LockSessionID =null  where ENTDIC_URTYPEid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_URTYPE_SINIT /*Тип юридического лица*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_URTYPE where ENTDIC_URTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_URTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_URTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_URTYPE set securitystyleid =aStyleID where ENTDIC_URTYPEid = aRowID;
else 
 update ENTDIC_URTYPE set securitystyleid =aSecurityStyleID where ENTDIC_URTYPEid = aRowID;
end if; 
end ; 


procedure ENTDIC_URTYPE_propagate /*Тип юридического лица*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_URTYPE where ENTDIC_URTYPEid=aRowid;
end;



procedure ENTDIC_VOP_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_VOPid CHAR,
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
if aENTDIC_VOPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_VOP where ENTDIC_VOPID=aENTDIC_VOPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_VOP where ENTDIC_VOPid=aENTDIC_VOPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_VOP');
    return;
  end if;
  aBRIEF:=func.ENTDIC_VOP_BRIEF_F(aENTDIC_VOPid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_VOP_DELETE /*Виды оплаты*/ (
 aCURSESSION CHAR,
 aENTDIC_VOPid CHAR,
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
select count(*) into existsCnt from ENTDIC_VOP where ENTDIC_VOPID=aENTDIC_VOPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_VOP where ENTDIC_VOPid=aENTDIC_VOPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_VOP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_VOP');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_VOP_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_VOPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_VOP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_VOP',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_VOPid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_VOP is select  instanceid ID from instance where OwnerPartName ='ENTDIC_VOP' and OwnerRowID=aENTDIC_VOPid;
row_ENTDIC_VOP  chld_ENTDIC_VOP%ROWTYPE;
begin
--open chld_ENTDIC_VOP;
for row_ENTDIC_VOP in chld_ENTDIC_VOP loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_VOP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_VOP.id);
end loop;
--close chld_ENTDIC_VOP;
end ;
  delete from  ENTDIC_VOP 
  where  ENTDIC_VOPID = aENTDIC_VOPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Виды оплаты*/
procedure ENTDIC_VOP_SAVE /*Виды оплаты*/ (
 aCURSESSION CHAR,
 aENTDIC_VOPid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_VOP where ENTDIC_VOPID=aENTDIC_VOPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_VOP where ENTDIC_VOPid=aENTDIC_VOPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_VOP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_VOP');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_VOP_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_VOPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_VOP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_VOP',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_VOPid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_VOP set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_VOPID = aENTDIC_VOPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_VOP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_VOP');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_VOP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_VOP',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_VOPid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_VOP
 (  ENTDIC_VOPID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_VOPID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_VOP_SINIT( aCURSESSION,aENTDIC_VOPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_VOP_PARENT /*Виды оплаты*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_VOP where  ENTDIC_VOPid=aRowID;
 end; 


procedure ENTDIC_VOP_ISLOCKED /*Виды оплаты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_VOP where ENTDIC_VOPid=aRowID;
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
  ENTDIC_VOP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_VOP_LOCK /*Виды оплаты*/ (
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
 ENTDIC_VOP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_VOP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_VOP where ENTDIC_VOPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_VOP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_VOP set LockUserID =auserID ,LockSessionID =null where ENTDIC_VOPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_VOP set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_VOPid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_VOP_HCL /*Виды оплаты*/ (
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


procedure ENTDIC_VOP_UNLOCK /*Виды оплаты*/ (
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
 ENTDIC_VOP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_VOP set LockUserID =null  where ENTDIC_VOPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_VOP set LockSessionID =null  where ENTDIC_VOPid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_VOP_SINIT /*Виды оплаты*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_VOP where ENTDIC_VOPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_VOP');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_VOP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_VOP set securitystyleid =aStyleID where ENTDIC_VOPid = aRowID;
else 
 update ENTDIC_VOP set securitystyleid =aSecurityStyleID where ENTDIC_VOPid = aRowID;
end if; 
end ; 


procedure ENTDIC_VOP_propagate /*Виды оплаты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_VOP where ENTDIC_VOPid=aRowid;
end;



procedure ENTDIC_VP_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_VPid CHAR,
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
if aENTDIC_VPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_VP where ENTDIC_VPID=aENTDIC_VPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_VP where ENTDIC_VPid=aENTDIC_VPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_VP');
    return;
  end if;
  aBRIEF:=func.ENTDIC_VP_BRIEF_F(aENTDIC_VPid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_VP_DELETE /*Вид платежа*/ (
 aCURSESSION CHAR,
 aENTDIC_VPid CHAR,
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
select count(*) into existsCnt from ENTDIC_VP where ENTDIC_VPID=aENTDIC_VPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_VP where ENTDIC_VPid=aENTDIC_VPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_VP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_VP');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_VP_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_VPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_VP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_VP',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_VPid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_VP is select  instanceid ID from instance where OwnerPartName ='ENTDIC_VP' and OwnerRowID=aENTDIC_VPid;
row_ENTDIC_VP  chld_ENTDIC_VP%ROWTYPE;
begin
--open chld_ENTDIC_VP;
for row_ENTDIC_VP in chld_ENTDIC_VP loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_VP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_VP.id);
end loop;
--close chld_ENTDIC_VP;
end ;
  delete from  ENTDIC_VP 
  where  ENTDIC_VPID = aENTDIC_VPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Вид платежа*/
procedure ENTDIC_VP_SAVE /*Вид платежа*/ (
 aCURSESSION CHAR,
 aENTDIC_VPid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,acode
 VARCHAR2/* Код *//* Код */
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
select count(*) into existsCnt from ENTDIC_VP where ENTDIC_VPID=aENTDIC_VPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_VP where ENTDIC_VPid=aENTDIC_VPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_VP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_VP');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_VP_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_VPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_VP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_VP',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_VPid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_VP set ChangeStamp=sysdate
,
  name=aname
,
  code=acode
  where  ENTDIC_VPID = aENTDIC_VPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_VP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_VP');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_VP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_VP',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_VPid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_VP
 (  ENTDIC_VPID 
,InstanceID
,name

,code

 ) values ( aENTDIC_VPID 
,aInstanceID
,aname

,acode

 ); 
 ENTDIC_VP_SINIT( aCURSESSION,aENTDIC_VPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_VP_PARENT /*Вид платежа*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_VP where  ENTDIC_VPid=aRowID;
 end; 


procedure ENTDIC_VP_ISLOCKED /*Вид платежа*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_VP where ENTDIC_VPid=aRowID;
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
  ENTDIC_VP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_VP_LOCK /*Вид платежа*/ (
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
 ENTDIC_VP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_VP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_VP where ENTDIC_VPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_VP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_VP set LockUserID =auserID ,LockSessionID =null where ENTDIC_VPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_VP set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_VPid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_VP_HCL /*Вид платежа*/ (
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


procedure ENTDIC_VP_UNLOCK /*Вид платежа*/ (
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
 ENTDIC_VP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_VP set LockUserID =null  where ENTDIC_VPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_VP set LockSessionID =null  where ENTDIC_VPid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_VP_SINIT /*Вид платежа*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_VP where ENTDIC_VPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_VP');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_VP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_VP set securitystyleid =aStyleID where ENTDIC_VPid = aRowID;
else 
 update ENTDIC_VP set securitystyleid =aSecurityStyleID where ENTDIC_VPid = aRowID;
end if; 
end ; 


procedure ENTDIC_VP_propagate /*Вид платежа*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_VP where ENTDIC_VPid=aRowid;
end;



procedure ENTDIC_EDIZM_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_EDIZMid CHAR,
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
if aENTDIC_EDIZMid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_EDIZM where ENTDIC_EDIZMID=aENTDIC_EDIZMID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_EDIZM where ENTDIC_EDIZMid=aENTDIC_EDIZMID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_EDIZM');
    return;
  end if;
  aBRIEF:=func.ENTDIC_EDIZM_BRIEF_F(aENTDIC_EDIZMid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_EDIZM_DELETE /*Единицы измерения*/ (
 aCURSESSION CHAR,
 aENTDIC_EDIZMid CHAR,
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
select count(*) into existsCnt from ENTDIC_EDIZM where ENTDIC_EDIZMID=aENTDIC_EDIZMID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_EDIZM where ENTDIC_EDIZMid=aENTDIC_EDIZMID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_EDIZM',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_EDIZM');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_EDIZM_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_EDIZMid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_EDIZM');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_EDIZM',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_EDIZMid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_EDIZM is select  instanceid ID from instance where OwnerPartName ='ENTDIC_EDIZM' and OwnerRowID=aENTDIC_EDIZMid;
row_ENTDIC_EDIZM  chld_ENTDIC_EDIZM%ROWTYPE;
begin
--open chld_ENTDIC_EDIZM;
for row_ENTDIC_EDIZM in chld_ENTDIC_EDIZM loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_EDIZM.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_EDIZM.id);
end loop;
--close chld_ENTDIC_EDIZM;
end ;
  delete from  ENTDIC_EDIZM 
  where  ENTDIC_EDIZMID = aENTDIC_EDIZMID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Единицы измерения*/
procedure ENTDIC_EDIZM_SAVE /*Единицы измерения*/ (
 aCURSESSION CHAR,
 aENTDIC_EDIZMid CHAR,
aInstanceID CHAR 
,acode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2 := null /* Название *//* Название */
,aNetto
 NUMBER := null /* Базовых единиц *//* Базовых единиц */
,abaseEDIZM CHAR := null /* Базовая единица изм. *//* Базовая единица изм. */
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
select count(*) into existsCnt from ENTDIC_EDIZM where ENTDIC_EDIZMID=aENTDIC_EDIZMID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_EDIZM where ENTDIC_EDIZMid=aENTDIC_EDIZMID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_EDIZM',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_EDIZM');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_EDIZM_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_EDIZMid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_EDIZM');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_EDIZM',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_EDIZMid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_EDIZM set ChangeStamp=sysdate
,
  code=acode
,
  name=aname
,
  Netto=aNetto
,
  baseEDIZM=abaseEDIZM
  where  ENTDIC_EDIZMID = aENTDIC_EDIZMID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_EDIZM',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_EDIZM');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_EDIZM');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_EDIZM',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_EDIZMid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_EDIZM
 (  ENTDIC_EDIZMID 
,InstanceID
,code

,name

,Netto

,baseEDIZM

 ) values ( aENTDIC_EDIZMID 
,aInstanceID
,acode

,aname

,aNetto

,abaseEDIZM

 ); 
 ENTDIC_EDIZM_SINIT( aCURSESSION,aENTDIC_EDIZMid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_EDIZM_PARENT /*Единицы измерения*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_EDIZM where  ENTDIC_EDIZMid=aRowID;
 end; 


procedure ENTDIC_EDIZM_ISLOCKED /*Единицы измерения*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_EDIZM where ENTDIC_EDIZMid=aRowID;
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
  ENTDIC_EDIZM_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_EDIZM_LOCK /*Единицы измерения*/ (
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
 ENTDIC_EDIZM_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_EDIZM_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_EDIZM where ENTDIC_EDIZMid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_EDIZM');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_EDIZM set LockUserID =auserID ,LockSessionID =null where ENTDIC_EDIZMid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_EDIZM set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_EDIZMid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_EDIZM_HCL /*Единицы измерения*/ (
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


procedure ENTDIC_EDIZM_UNLOCK /*Единицы измерения*/ (
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
 ENTDIC_EDIZM_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_EDIZM set LockUserID =null  where ENTDIC_EDIZMid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_EDIZM set LockSessionID =null  where ENTDIC_EDIZMid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_EDIZM_SINIT /*Единицы измерения*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_EDIZM where ENTDIC_EDIZMid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_EDIZM');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_EDIZM_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_EDIZM set securitystyleid =aStyleID where ENTDIC_EDIZMid = aRowID;
else 
 update ENTDIC_EDIZM set securitystyleid =aSecurityStyleID where ENTDIC_EDIZMid = aRowID;
end if; 
end ; 


procedure ENTDIC_EDIZM_propagate /*Единицы измерения*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_EDIZM where ENTDIC_EDIZMid=aRowid;
end;



procedure ENTDIC_RWSRV_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_RWSRVid CHAR,
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
if aENTDIC_RWSRVid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_RWSRV where ENTDIC_RWSRVID=aENTDIC_RWSRVID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_RWSRV where ENTDIC_RWSRVid=aENTDIC_RWSRVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_RWSRV');
    return;
  end if;
  aBRIEF:=func.ENTDIC_RWSRV_BRIEF_F(aENTDIC_RWSRVid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_RWSRV_DELETE /*Виды ж/д услуг*/ (
 aCURSESSION CHAR,
 aENTDIC_RWSRVid CHAR,
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
select count(*) into existsCnt from ENTDIC_RWSRV where ENTDIC_RWSRVID=aENTDIC_RWSRVID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_RWSRV where ENTDIC_RWSRVid=aENTDIC_RWSRVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_RWSRV',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_RWSRV');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_RWSRV_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_RWSRVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_RWSRV');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RWSRV',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_RWSRVid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_RWSRV is select  instanceid ID from instance where OwnerPartName ='ENTDIC_RWSRV' and OwnerRowID=aENTDIC_RWSRVid;
row_ENTDIC_RWSRV  chld_ENTDIC_RWSRV%ROWTYPE;
begin
--open chld_ENTDIC_RWSRV;
for row_ENTDIC_RWSRV in chld_ENTDIC_RWSRV loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_RWSRV.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_RWSRV.id);
end loop;
--close chld_ENTDIC_RWSRV;
end ;
  delete from  ENTDIC_RWSRV 
  where  ENTDIC_RWSRVID = aENTDIC_RWSRVID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Виды ж/д услуг*/
procedure ENTDIC_RWSRV_SAVE /*Виды ж/д услуг*/ (
 aCURSESSION CHAR,
 aENTDIC_RWSRVid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_RWSRV where ENTDIC_RWSRVID=aENTDIC_RWSRVID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_RWSRV where ENTDIC_RWSRVid=aENTDIC_RWSRVID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_RWSRV',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_RWSRV');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_RWSRV_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_RWSRVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_RWSRV');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RWSRV',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_RWSRVid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_RWSRV set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_RWSRVID = aENTDIC_RWSRVID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_RWSRV',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_RWSRV');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_RWSRV');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RWSRV',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_RWSRVid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_RWSRV
 (  ENTDIC_RWSRVID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_RWSRVID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_RWSRV_SINIT( aCURSESSION,aENTDIC_RWSRVid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_RWSRV_PARENT /*Виды ж/д услуг*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_RWSRV where  ENTDIC_RWSRVid=aRowID;
 end; 


procedure ENTDIC_RWSRV_ISLOCKED /*Виды ж/д услуг*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_RWSRV where ENTDIC_RWSRVid=aRowID;
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
  ENTDIC_RWSRV_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_RWSRV_LOCK /*Виды ж/д услуг*/ (
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
 ENTDIC_RWSRV_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_RWSRV_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_RWSRV where ENTDIC_RWSRVid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_RWSRV');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_RWSRV set LockUserID =auserID ,LockSessionID =null where ENTDIC_RWSRVid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_RWSRV set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_RWSRVid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_RWSRV_HCL /*Виды ж/д услуг*/ (
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


procedure ENTDIC_RWSRV_UNLOCK /*Виды ж/д услуг*/ (
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
 ENTDIC_RWSRV_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_RWSRV set LockUserID =null  where ENTDIC_RWSRVid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_RWSRV set LockSessionID =null  where ENTDIC_RWSRVid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_RWSRV_SINIT /*Виды ж/д услуг*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_RWSRV where ENTDIC_RWSRVid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_RWSRV');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_RWSRV_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_RWSRV set securitystyleid =aStyleID where ENTDIC_RWSRVid = aRowID;
else 
 update ENTDIC_RWSRV set securitystyleid =aSecurityStyleID where ENTDIC_RWSRVid = aRowID;
end if; 
end ; 


procedure ENTDIC_RWSRV_propagate /*Виды ж/д услуг*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_RWSRV where ENTDIC_RWSRVid=aRowid;
end;



procedure ENTDIC_RW_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_RWid CHAR,
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
if aENTDIC_RWid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_RW where ENTDIC_RWID=aENTDIC_RWID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_RW where ENTDIC_RWid=aENTDIC_RWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_RW');
    return;
  end if;
  aBRIEF:=func.ENTDIC_RW_BRIEF_F(aENTDIC_RWid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_RW_DELETE /*Железные дороги*/ (
 aCURSESSION CHAR,
 aENTDIC_RWid CHAR,
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
select count(*) into existsCnt from ENTDIC_RW where ENTDIC_RWID=aENTDIC_RWID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_RW where ENTDIC_RWid=aENTDIC_RWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_RW',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_RW');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_RW_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_RWid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_RW');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_ENTDIC_RWDIV is select ENTDIC_RWDIV.ENTDIC_RWDIVid ID from ENTDIC_RWDIV where  ENTDIC_RWDIV.ParentStructRowID = aENTDIC_RWid;
    child_ENTDIC_RWDIV_rec  child_ENTDIC_RWDIV%ROWTYPE;
    begin
    --open child_ENTDIC_RWDIV;
      for child_ENTDIC_RWDIV_rec in child_ENTDIC_RWDIV loop
      ENTDIC_RWDIV_DELETE (acursession,child_ENTDIC_RWDIV_rec.id,aInstanceid);
      end loop;
      --close child_ENTDIC_RWDIV;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RW',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_RWid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_RW is select  instanceid ID from instance where OwnerPartName ='ENTDIC_RW' and OwnerRowID=aENTDIC_RWid;
row_ENTDIC_RW  chld_ENTDIC_RW%ROWTYPE;
begin
--open chld_ENTDIC_RW;
for row_ENTDIC_RW in chld_ENTDIC_RW loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_RW.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_RW.id);
end loop;
--close chld_ENTDIC_RW;
end ;
  delete from  ENTDIC_RW 
  where  ENTDIC_RWID = aENTDIC_RWID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Железные дороги*/
procedure ENTDIC_RW_SAVE /*Железные дороги*/ (
 aCURSESSION CHAR,
 aENTDIC_RWid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,acode
 VARCHAR2/* Код *//* Код */
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
select count(*) into existsCnt from ENTDIC_RW where ENTDIC_RWID=aENTDIC_RWID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_RW where ENTDIC_RWid=aENTDIC_RWID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_RW',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_RW');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_RW_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_RWid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_RW');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RW',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_RWid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_RW set ChangeStamp=sysdate
,
  name=aname
,
  code=acode
  where  ENTDIC_RWID = aENTDIC_RWID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_RW',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_RW');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_RW');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RW',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_RWid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_RW
 (  ENTDIC_RWID 
,InstanceID
,name

,code

 ) values ( aENTDIC_RWID 
,aInstanceID
,aname

,acode

 ); 
 ENTDIC_RW_SINIT( aCURSESSION,aENTDIC_RWid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_RW_PARENT /*Железные дороги*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_RW where  ENTDIC_RWid=aRowID;
 end; 


procedure ENTDIC_RW_ISLOCKED /*Железные дороги*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_RW where ENTDIC_RWid=aRowID;
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
  ENTDIC_RW_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_RW_LOCK /*Железные дороги*/ (
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
 ENTDIC_RW_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_RW_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_RW where ENTDIC_RWid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_RW');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_RW set LockUserID =auserID ,LockSessionID =null where ENTDIC_RWid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_RW set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_RWid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_RW_HCL /*Железные дороги*/ (
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
declare cursor lch_ENTDIC_RWDIV is select ENTDIC_RWDIV.ENTDIC_RWDIVid ID from ENTDIC_RWDIV where  ENTDIC_RWDIV.ParentStructRowID = aRowid;
row_ENTDIC_RWDIV lch_ENTDIC_RWDIV%ROWTYPE;
begin  
--open lch_ENTDIC_RWDIV;
for row_ENTDIC_RWDIV in lch_ENTDIC_RWDIV
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ENTDIC_RWDIV where ENTDIC_RWDIVid=row_ENTDIC_RWDIV.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_RWDIV;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ENTDIC_RWDIV;
     return;
   end if; 
 end if;  
 ENTDIC_RWDIV_HCL (acursession,row_ENTDIC_RWDIV.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_RWDIV;
   return;
 end if;
end loop;
--close lch_ENTDIC_RWDIV;
end;
aIsLocked :=0;
end;


procedure ENTDIC_RW_UNLOCK /*Железные дороги*/ (
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
 ENTDIC_RW_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_RW set LockUserID =null  where ENTDIC_RWid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_RW set LockSessionID =null  where ENTDIC_RWid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_RW_SINIT /*Железные дороги*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_RW where ENTDIC_RWid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_RW');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_RW_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_RW set securitystyleid =aStyleID where ENTDIC_RWid = aRowID;
else 
 update ENTDIC_RW set securitystyleid =aSecurityStyleID where ENTDIC_RWid = aRowID;
end if; 
end ; 


procedure ENTDIC_RW_propagate /*Железные дороги*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_RW where ENTDIC_RWid=aRowid;
declare cursor pch_ENTDIC_RWDIV  is select ENTDIC_RWDIV.ENTDIC_RWDIVid ID from ENTDIC_RWDIV where  ENTDIC_RWDIV.ParentStructRowID = aRowid;
row_ENTDIC_RWDIV  pch_ENTDIC_RWDIV%ROWTYPE;
begin
--open pch_ENTDIC_RWDIV;
for row_ENTDIC_RWDIV in pch_ENTDIC_RWDIV loop
   ENTDIC_RWDIV_SINIT( acursession,row_ENTDIC_RWDIV.id,assid);
   ENTDIC_RWDIV_propagate( acursession,row_ENTDIC_RWDIV.id);
end loop;
--close pch_ENTDIC_RWDIV;
end;
end;



procedure ENTDIC_RWDIV_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_RWDIVid CHAR,
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
if aENTDIC_RWDIVid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_RWDIV where ENTDIC_RWDIVID=aENTDIC_RWDIVID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_RWDIV where ENTDIC_RWDIVid=aENTDIC_RWDIVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_RWDIV');
    return;
  end if;
  aBRIEF:=func.ENTDIC_RWDIV_BRIEF_F(aENTDIC_RWDIVid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_RWDIV_DELETE /*Направления*/ (
 aCURSESSION CHAR,
 aENTDIC_RWDIVid CHAR,
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
select count(*) into existsCnt from ENTDIC_RWDIV where ENTDIC_RWDIVID=aENTDIC_RWDIVID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_RWDIV where ENTDIC_RWDIVid=aENTDIC_RWDIVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_RWDIV',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_RWDIV');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_RWDIV_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_RWDIVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_RWDIV');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_ENTDIC_RWSTATION is select ENTDIC_RWSTATION.ENTDIC_RWSTATIONid ID from ENTDIC_RWSTATION where  ENTDIC_RWSTATION.ParentStructRowID = aENTDIC_RWDIVid;
    child_ENTDIC_RWSTATION_rec  child_ENTDIC_RWSTATION%ROWTYPE;
    begin
    --open child_ENTDIC_RWSTATION;
      for child_ENTDIC_RWSTATION_rec in child_ENTDIC_RWSTATION loop
      ENTDIC_RWSTATION_DELETE (acursession,child_ENTDIC_RWSTATION_rec.id,aInstanceid);
      end loop;
      --close child_ENTDIC_RWSTATION;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RWDIV',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_RWDIVid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_RWDIV is select  instanceid ID from instance where OwnerPartName ='ENTDIC_RWDIV' and OwnerRowID=aENTDIC_RWDIVid;
row_ENTDIC_RWDIV  chld_ENTDIC_RWDIV%ROWTYPE;
begin
--open chld_ENTDIC_RWDIV;
for row_ENTDIC_RWDIV in chld_ENTDIC_RWDIV loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_RWDIV.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_RWDIV.id);
end loop;
--close chld_ENTDIC_RWDIV;
end ;
  delete from  ENTDIC_RWDIV 
  where  ENTDIC_RWDIVID = aENTDIC_RWDIVID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Направления*/
procedure ENTDIC_RWDIV_SAVE /*Направления*/ (
 aCURSESSION CHAR,
 aENTDIC_RWDIVid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aname
 VARCHAR2/* Направление *//* Направление */
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
select count(*) into existsCnt from ENTDIC_RWDIV where ENTDIC_RWDIVID=aENTDIC_RWDIVID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_RWDIV where ENTDIC_RWDIVid=aENTDIC_RWDIVID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_RWDIV',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_RWDIV');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_RWDIV_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_RWDIVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_RWDIV');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RWDIV',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_RWDIVid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_RWDIV set ChangeStamp=sysdate
,
  name=aname
  where  ENTDIC_RWDIVID = aENTDIC_RWDIVID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from ENTDIC_RW where ENTDIC_RWid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_RWDIV',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_RWDIV');
      return;
    end if;
 end if;
 ENTDIC_RW_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_RWDIV');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RWDIV',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_RWDIVid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_RWDIV
 (  ENTDIC_RWDIVID 
,ParentStructRowID
,name

 ) values ( aENTDIC_RWDIVID 
,aParentStructRowID
,aname

 ); 
 ENTDIC_RWDIV_SINIT( aCURSESSION,aENTDIC_RWDIVid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_RWDIV_PARENT /*Направления*/ (
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
  select ParentStructRowID into aParentID  from ENTDIC_RWDIV where  ENTDIC_RWDIVid=aRowID;
  aParentTable := 'ENTDIC_RW';
 end; 


procedure ENTDIC_RWDIV_ISLOCKED /*Направления*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_RWDIV where ENTDIC_RWDIVid=aRowID;
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
  ENTDIC_RWDIV_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_RWDIV_LOCK /*Направления*/ (
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
 ENTDIC_RWDIV_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_RWDIV_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_RWDIV where ENTDIC_RWDIVid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_RWDIV');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_RWDIV set LockUserID =auserID ,LockSessionID =null where ENTDIC_RWDIVid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_RWDIV set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_RWDIVid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_RWDIV_HCL /*Направления*/ (
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
declare cursor lch_ENTDIC_RWSTATION is select ENTDIC_RWSTATION.ENTDIC_RWSTATIONid ID from ENTDIC_RWSTATION where  ENTDIC_RWSTATION.ParentStructRowID = aRowid;
row_ENTDIC_RWSTATION lch_ENTDIC_RWSTATION%ROWTYPE;
begin  
--open lch_ENTDIC_RWSTATION;
for row_ENTDIC_RWSTATION in lch_ENTDIC_RWSTATION
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ENTDIC_RWSTATION where ENTDIC_RWSTATIONid=row_ENTDIC_RWSTATION.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_RWSTATION;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ENTDIC_RWSTATION;
     return;
   end if; 
 end if;  
 ENTDIC_RWSTATION_HCL (acursession,row_ENTDIC_RWSTATION.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_RWSTATION;
   return;
 end if;
end loop;
--close lch_ENTDIC_RWSTATION;
end;
aIsLocked :=0;
end;


procedure ENTDIC_RWDIV_UNLOCK /*Направления*/ (
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
 ENTDIC_RWDIV_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_RWDIV set LockUserID =null  where ENTDIC_RWDIVid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_RWDIV set LockSessionID =null  where ENTDIC_RWDIVid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_RWDIV_SINIT /*Направления*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_RWDIV where ENTDIC_RWDIVid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_RWDIV');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_RWDIV_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_RWDIV set securitystyleid =aStyleID where ENTDIC_RWDIVid = aRowID;
else 
 update ENTDIC_RWDIV set securitystyleid =aSecurityStyleID where ENTDIC_RWDIVid = aRowID;
end if; 
end ; 


procedure ENTDIC_RWDIV_propagate /*Направления*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_RWDIV where ENTDIC_RWDIVid=aRowid;
declare cursor pch_ENTDIC_RWSTATION  is select ENTDIC_RWSTATION.ENTDIC_RWSTATIONid ID from ENTDIC_RWSTATION where  ENTDIC_RWSTATION.ParentStructRowID = aRowid;
row_ENTDIC_RWSTATION  pch_ENTDIC_RWSTATION%ROWTYPE;
begin
--open pch_ENTDIC_RWSTATION;
for row_ENTDIC_RWSTATION in pch_ENTDIC_RWSTATION loop
   ENTDIC_RWSTATION_SINIT( acursession,row_ENTDIC_RWSTATION.id,assid);
   ENTDIC_RWSTATION_propagate( acursession,row_ENTDIC_RWSTATION.id);
end loop;
--close pch_ENTDIC_RWSTATION;
end;
end;



procedure ENTDIC_RWSTATION_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_RWSTATIONid CHAR,
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
if aENTDIC_RWSTATIONid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_RWSTATION where ENTDIC_RWSTATIONID=aENTDIC_RWSTATIONID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_RWSTATION where ENTDIC_RWSTATIONid=aENTDIC_RWSTATIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_RWSTATION');
    return;
  end if;
  aBRIEF:=func.ENTDIC_RWSTATION_BRIEF_F(aENTDIC_RWSTATIONid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_RWSTATION_DELETE /*Ж/д станции*/ (
 aCURSESSION CHAR,
 aENTDIC_RWSTATIONid CHAR,
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
select count(*) into existsCnt from ENTDIC_RWSTATION where ENTDIC_RWSTATIONID=aENTDIC_RWSTATIONID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_RWSTATION where ENTDIC_RWSTATIONid=aENTDIC_RWSTATIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_RWSTATION',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_RWSTATION');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_RWSTATION_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_RWSTATIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_RWSTATION');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RWSTATION',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_RWSTATIONid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_RWSTATION is select  instanceid ID from instance where OwnerPartName ='ENTDIC_RWSTATION' and OwnerRowID=aENTDIC_RWSTATIONid;
row_ENTDIC_RWSTATION  chld_ENTDIC_RWSTATION%ROWTYPE;
begin
--open chld_ENTDIC_RWSTATION;
for row_ENTDIC_RWSTATION in chld_ENTDIC_RWSTATION loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_RWSTATION.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_RWSTATION.id);
end loop;
--close chld_ENTDIC_RWSTATION;
end ;
  delete from  ENTDIC_RWSTATION 
  where  ENTDIC_RWSTATIONID = aENTDIC_RWSTATIONID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Ж/д станции*/
procedure ENTDIC_RWSTATION_SAVE /*Ж/д станции*/ (
 aCURSESSION CHAR,
 aENTDIC_RWSTATIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,asname
 VARCHAR2 := null /* Краткое название *//* Краткое название */
,aPostNode
 NUMBER/* Почтовый узел *//* Почтовый узел */
,aPGDPIdx
 VARCHAR2 := null /* Индекс *//* Индекс */
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
select count(*) into existsCnt from ENTDIC_RWSTATION where ENTDIC_RWSTATIONID=aENTDIC_RWSTATIONID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_RWSTATION where ENTDIC_RWSTATIONid=aENTDIC_RWSTATIONID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_RWSTATION',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_RWSTATION');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_RWSTATION_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_RWSTATIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_RWSTATION');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RWSTATION',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_RWSTATIONid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_RWSTATION set ChangeStamp=sysdate
,
  name=aname
,
  sname=asname
,
  PostNode=aPostNode
,
  PGDPIdx=aPGDPIdx
  where  ENTDIC_RWSTATIONID = aENTDIC_RWSTATIONID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from ENTDIC_RWDIV where ENTDIC_RWDIVid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_RWSTATION',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_RWSTATION');
      return;
    end if;
 end if;
 ENTDIC_RWDIV_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_RWSTATION');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_RWSTATION',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_RWSTATIONid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_RWSTATION
 (  ENTDIC_RWSTATIONID 
,ParentStructRowID
,name

,sname

,PostNode

,PGDPIdx

 ) values ( aENTDIC_RWSTATIONID 
,aParentStructRowID
,aname

,asname

,aPostNode

,aPGDPIdx

 ); 
 ENTDIC_RWSTATION_SINIT( aCURSESSION,aENTDIC_RWSTATIONid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_RWSTATION_PARENT /*Ж/д станции*/ (
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
  select ParentStructRowID into aParentID  from ENTDIC_RWSTATION where  ENTDIC_RWSTATIONid=aRowID;
  aParentTable := 'ENTDIC_RWDIV';
 end; 


procedure ENTDIC_RWSTATION_ISLOCKED /*Ж/д станции*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_RWSTATION where ENTDIC_RWSTATIONid=aRowID;
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
  ENTDIC_RWSTATION_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_RWSTATION_LOCK /*Ж/д станции*/ (
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
 ENTDIC_RWSTATION_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_RWSTATION_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_RWSTATION where ENTDIC_RWSTATIONid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_RWSTATION');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_RWSTATION set LockUserID =auserID ,LockSessionID =null where ENTDIC_RWSTATIONid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_RWSTATION set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_RWSTATIONid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_RWSTATION_HCL /*Ж/д станции*/ (
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


procedure ENTDIC_RWSTATION_UNLOCK /*Ж/д станции*/ (
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
 ENTDIC_RWSTATION_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_RWSTATION set LockUserID =null  where ENTDIC_RWSTATIONid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_RWSTATION set LockSessionID =null  where ENTDIC_RWSTATIONid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_RWSTATION_SINIT /*Ж/д станции*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_RWSTATION where ENTDIC_RWSTATIONid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_RWSTATION');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_RWSTATION_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_RWSTATION set securitystyleid =aStyleID where ENTDIC_RWSTATIONid = aRowID;
else 
 update ENTDIC_RWSTATION set securitystyleid =aSecurityStyleID where ENTDIC_RWSTATIONid = aRowID;
end if; 
end ; 


procedure ENTDIC_RWSTATION_propagate /*Ж/д станции*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_RWSTATION where ENTDIC_RWSTATIONid=aRowid;
end;



procedure ENTDIC_IZMAP_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_IZMAPid CHAR,
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
if aENTDIC_IZMAPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_IZMAP where ENTDIC_IZMAPID=aENTDIC_IZMAPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_IZMAP where ENTDIC_IZMAPid=aENTDIC_IZMAPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_IZMAP');
    return;
  end if;
  aBRIEF:=func.ENTDIC_IZMAP_BRIEF_F(aENTDIC_IZMAPid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_IZMAP_DELETE /*Преобразование единиц*/ (
 aCURSESSION CHAR,
 aENTDIC_IZMAPid CHAR,
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
select count(*) into existsCnt from ENTDIC_IZMAP where ENTDIC_IZMAPID=aENTDIC_IZMAPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_IZMAP where ENTDIC_IZMAPid=aENTDIC_IZMAPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_IZMAP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_IZMAP');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_IZMAP_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_IZMAPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_IZMAP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_IZMAP',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_IZMAPid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_IZMAP is select  instanceid ID from instance where OwnerPartName ='ENTDIC_IZMAP' and OwnerRowID=aENTDIC_IZMAPid;
row_ENTDIC_IZMAP  chld_ENTDIC_IZMAP%ROWTYPE;
begin
--open chld_ENTDIC_IZMAP;
for row_ENTDIC_IZMAP in chld_ENTDIC_IZMAP loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_IZMAP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_IZMAP.id);
end loop;
--close chld_ENTDIC_IZMAP;
end ;
  delete from  ENTDIC_IZMAP 
  where  ENTDIC_IZMAPID = aENTDIC_IZMAPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Преобразование единиц*/
procedure ENTDIC_IZMAP_SAVE /*Преобразование единиц*/ (
 aCURSESSION CHAR,
 aENTDIC_IZMAPid CHAR,
aInstanceID CHAR 
,aFromEDIZM CHAR/* Из измерения *//* Из измерения */
,aIZMultiplicator
 NUMBER/* Множитель *//* Множитель */
,aToEDIZM CHAR/* К измерению *//* К измерению */
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
select count(*) into existsCnt from ENTDIC_IZMAP where ENTDIC_IZMAPID=aENTDIC_IZMAPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_IZMAP where ENTDIC_IZMAPid=aENTDIC_IZMAPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_IZMAP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_IZMAP');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_IZMAP_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_IZMAPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_IZMAP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_IZMAP',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_IZMAPid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_IZMAP set ChangeStamp=sysdate
,
  FromEDIZM=aFromEDIZM
,
  IZMultiplicator=aIZMultiplicator
,
  ToEDIZM=aToEDIZM
  where  ENTDIC_IZMAPID = aENTDIC_IZMAPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_IZMAP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_IZMAP');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_IZMAP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_IZMAP',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_IZMAPid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_IZMAP
 (  ENTDIC_IZMAPID 
,InstanceID
,FromEDIZM

,IZMultiplicator

,ToEDIZM

 ) values ( aENTDIC_IZMAPID 
,aInstanceID
,aFromEDIZM

,aIZMultiplicator

,aToEDIZM

 ); 
 ENTDIC_IZMAP_SINIT( aCURSESSION,aENTDIC_IZMAPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_IZMAP_PARENT /*Преобразование единиц*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_IZMAP where  ENTDIC_IZMAPid=aRowID;
 end; 


procedure ENTDIC_IZMAP_ISLOCKED /*Преобразование единиц*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_IZMAP where ENTDIC_IZMAPid=aRowID;
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
  ENTDIC_IZMAP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_IZMAP_LOCK /*Преобразование единиц*/ (
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
 ENTDIC_IZMAP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_IZMAP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_IZMAP where ENTDIC_IZMAPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_IZMAP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_IZMAP set LockUserID =auserID ,LockSessionID =null where ENTDIC_IZMAPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_IZMAP set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_IZMAPid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_IZMAP_HCL /*Преобразование единиц*/ (
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


procedure ENTDIC_IZMAP_UNLOCK /*Преобразование единиц*/ (
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
 ENTDIC_IZMAP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_IZMAP set LockUserID =null  where ENTDIC_IZMAPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_IZMAP set LockSessionID =null  where ENTDIC_IZMAPid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_IZMAP_SINIT /*Преобразование единиц*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_IZMAP where ENTDIC_IZMAPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_IZMAP');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_IZMAP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_IZMAP set securitystyleid =aStyleID where ENTDIC_IZMAPid = aRowID;
else 
 update ENTDIC_IZMAP set securitystyleid =aSecurityStyleID where ENTDIC_IZMAPid = aRowID;
end if; 
end ; 


procedure ENTDIC_IZMAP_propagate /*Преобразование единиц*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_IZMAP where ENTDIC_IZMAPid=aRowid;
end;



procedure ENTDIC_CURRENCY_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_CURRENCYid CHAR,
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
if aENTDIC_CURRENCYid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_CURRENCY where ENTDIC_CURRENCYID=aENTDIC_CURRENCYID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_CURRENCY where ENTDIC_CURRENCYid=aENTDIC_CURRENCYID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_CURRENCY');
    return;
  end if;
  aBRIEF:=func.ENTDIC_CURRENCY_BRIEF_F(aENTDIC_CURRENCYid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_CURRENCY_DELETE /*Валюта*/ (
 aCURSESSION CHAR,
 aENTDIC_CURRENCYid CHAR,
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
select count(*) into existsCnt from ENTDIC_CURRENCY where ENTDIC_CURRENCYID=aENTDIC_CURRENCYID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_CURRENCY where ENTDIC_CURRENCYid=aENTDIC_CURRENCYID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_CURRENCY',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_CURRENCY');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_CURRENCY_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_CURRENCYid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_CURRENCY');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_ENTDIC_CURCOURCE is select ENTDIC_CURCOURCE.ENTDIC_CURCOURCEid ID from ENTDIC_CURCOURCE where  ENTDIC_CURCOURCE.ParentStructRowID = aENTDIC_CURRENCYid;
    child_ENTDIC_CURCOURCE_rec  child_ENTDIC_CURCOURCE%ROWTYPE;
    begin
    --open child_ENTDIC_CURCOURCE;
      for child_ENTDIC_CURCOURCE_rec in child_ENTDIC_CURCOURCE loop
      ENTDIC_CURCOURCE_DELETE (acursession,child_ENTDIC_CURCOURCE_rec.id,aInstanceid);
      end loop;
      --close child_ENTDIC_CURCOURCE;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_CURRENCY',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_CURRENCYid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_CURRENCY is select  instanceid ID from instance where OwnerPartName ='ENTDIC_CURRENCY' and OwnerRowID=aENTDIC_CURRENCYid;
row_ENTDIC_CURRENCY  chld_ENTDIC_CURRENCY%ROWTYPE;
begin
--open chld_ENTDIC_CURRENCY;
for row_ENTDIC_CURRENCY in chld_ENTDIC_CURRENCY loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_CURRENCY.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_CURRENCY.id);
end loop;
--close chld_ENTDIC_CURRENCY;
end ;
  delete from  ENTDIC_CURRENCY 
  where  ENTDIC_CURRENCYID = aENTDIC_CURRENCYID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Валюта*/
procedure ENTDIC_CURRENCY_SAVE /*Валюта*/ (
 aCURSESSION CHAR,
 aENTDIC_CURRENCYid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aCode
 VARCHAR2/* Код *//* Код */
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
select count(*) into existsCnt from ENTDIC_CURRENCY where ENTDIC_CURRENCYID=aENTDIC_CURRENCYID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_CURRENCY where ENTDIC_CURRENCYid=aENTDIC_CURRENCYID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_CURRENCY',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_CURRENCY');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_CURRENCY_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_CURRENCYid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_CURRENCY');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_CURRENCY',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_CURRENCYid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_CURRENCY set ChangeStamp=sysdate
,
  name=aname
,
  Code=aCode
  where  ENTDIC_CURRENCYID = aENTDIC_CURRENCYID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_CURRENCY',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_CURRENCY');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_CURRENCY');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_CURRENCY',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_CURRENCYid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_CURRENCY
 (  ENTDIC_CURRENCYID 
,InstanceID
,name

,Code

 ) values ( aENTDIC_CURRENCYID 
,aInstanceID
,aname

,aCode

 ); 
 ENTDIC_CURRENCY_SINIT( aCURSESSION,aENTDIC_CURRENCYid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_CURRENCY_PARENT /*Валюта*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_CURRENCY where  ENTDIC_CURRENCYid=aRowID;
 end; 


procedure ENTDIC_CURRENCY_ISLOCKED /*Валюта*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_CURRENCY where ENTDIC_CURRENCYid=aRowID;
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
  ENTDIC_CURRENCY_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_CURRENCY_LOCK /*Валюта*/ (
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
 ENTDIC_CURRENCY_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_CURRENCY_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_CURRENCY where ENTDIC_CURRENCYid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_CURRENCY');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_CURRENCY set LockUserID =auserID ,LockSessionID =null where ENTDIC_CURRENCYid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_CURRENCY set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_CURRENCYid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_CURRENCY_HCL /*Валюта*/ (
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
declare cursor lch_ENTDIC_CURCOURCE is select ENTDIC_CURCOURCE.ENTDIC_CURCOURCEid ID from ENTDIC_CURCOURCE where  ENTDIC_CURCOURCE.ParentStructRowID = aRowid;
row_ENTDIC_CURCOURCE lch_ENTDIC_CURCOURCE%ROWTYPE;
begin  
--open lch_ENTDIC_CURCOURCE;
for row_ENTDIC_CURCOURCE in lch_ENTDIC_CURCOURCE
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEid=row_ENTDIC_CURCOURCE.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_ENTDIC_CURCOURCE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_ENTDIC_CURCOURCE;
     return;
   end if; 
 end if;  
 ENTDIC_CURCOURCE_HCL (acursession,row_ENTDIC_CURCOURCE.id,aisLocked);
 if aisLocked >2 then
   close lch_ENTDIC_CURCOURCE;
   return;
 end if;
end loop;
--close lch_ENTDIC_CURCOURCE;
end;
aIsLocked :=0;
end;


procedure ENTDIC_CURRENCY_UNLOCK /*Валюта*/ (
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
 ENTDIC_CURRENCY_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_CURRENCY set LockUserID =null  where ENTDIC_CURRENCYid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_CURRENCY set LockSessionID =null  where ENTDIC_CURRENCYid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_CURRENCY_SINIT /*Валюта*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_CURRENCY where ENTDIC_CURRENCYid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_CURRENCY');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_CURRENCY_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_CURRENCY set securitystyleid =aStyleID where ENTDIC_CURRENCYid = aRowID;
else 
 update ENTDIC_CURRENCY set securitystyleid =aSecurityStyleID where ENTDIC_CURRENCYid = aRowID;
end if; 
end ; 


procedure ENTDIC_CURRENCY_propagate /*Валюта*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_CURRENCY where ENTDIC_CURRENCYid=aRowid;
declare cursor pch_ENTDIC_CURCOURCE  is select ENTDIC_CURCOURCE.ENTDIC_CURCOURCEid ID from ENTDIC_CURCOURCE where  ENTDIC_CURCOURCE.ParentStructRowID = aRowid;
row_ENTDIC_CURCOURCE  pch_ENTDIC_CURCOURCE%ROWTYPE;
begin
--open pch_ENTDIC_CURCOURCE;
for row_ENTDIC_CURCOURCE in pch_ENTDIC_CURCOURCE loop
   ENTDIC_CURCOURCE_SINIT( acursession,row_ENTDIC_CURCOURCE.id,assid);
   ENTDIC_CURCOURCE_propagate( acursession,row_ENTDIC_CURCOURCE.id);
end loop;
--close pch_ENTDIC_CURCOURCE;
end;
end;



procedure ENTDIC_CURCOURCE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_CURCOURCEid CHAR,
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
if aENTDIC_CURCOURCEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEID=aENTDIC_CURCOURCEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEid=aENTDIC_CURCOURCEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_CURCOURCE');
    return;
  end if;
  aBRIEF:=func.ENTDIC_CURCOURCE_BRIEF_F(aENTDIC_CURCOURCEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_CURCOURCE_DELETE /*Курс валюты*/ (
 aCURSESSION CHAR,
 aENTDIC_CURCOURCEid CHAR,
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
select count(*) into existsCnt from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEID=aENTDIC_CURCOURCEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEid=aENTDIC_CURCOURCEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_CURCOURCE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_CURCOURCE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_CURCOURCE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_CURCOURCEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_CURCOURCE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_CURCOURCE',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_CURCOURCEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_CURCOURCE is select  instanceid ID from instance where OwnerPartName ='ENTDIC_CURCOURCE' and OwnerRowID=aENTDIC_CURCOURCEid;
row_ENTDIC_CURCOURCE  chld_ENTDIC_CURCOURCE%ROWTYPE;
begin
--open chld_ENTDIC_CURCOURCE;
for row_ENTDIC_CURCOURCE in chld_ENTDIC_CURCOURCE loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_CURCOURCE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_CURCOURCE.id);
end loop;
--close chld_ENTDIC_CURCOURCE;
end ;
  delete from  ENTDIC_CURCOURCE 
  where  ENTDIC_CURCOURCEID = aENTDIC_CURCOURCEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Курс валюты*/
procedure ENTDIC_CURCOURCE_SAVE /*Курс валюты*/ (
 aCURSESSION CHAR,
 aENTDIC_CURCOURCEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aCourceDate
 DATE/* Дата *//* Дата */
,athe_Value
 NUMBER/* Курс *//* Курс */
,aQuantity
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
select count(*) into existsCnt from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEID=aENTDIC_CURCOURCEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEid=aENTDIC_CURCOURCEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_CURCOURCE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_CURCOURCE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_CURCOURCE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_CURCOURCEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_CURCOURCE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_CURCOURCE',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_CURCOURCEid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_CURCOURCE set ChangeStamp=sysdate
,
  CourceDate=aCourceDate
,
  the_Value=athe_Value
,
  Quantity=aQuantity
  where  ENTDIC_CURCOURCEID = aENTDIC_CURCOURCEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from ENTDIC_CURRENCY where ENTDIC_CURRENCYid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_CURCOURCE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_CURCOURCE');
      return;
    end if;
 end if;
 ENTDIC_CURRENCY_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_CURCOURCE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_CURCOURCE',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_CURCOURCEid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_CURCOURCE
 (  ENTDIC_CURCOURCEID 
,ParentStructRowID
,CourceDate

,the_Value

,Quantity

 ) values ( aENTDIC_CURCOURCEID 
,aParentStructRowID
,aCourceDate

,athe_Value

,aQuantity

 ); 
 ENTDIC_CURCOURCE_SINIT( aCURSESSION,aENTDIC_CURCOURCEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_CURCOURCE_PARENT /*Курс валюты*/ (
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
  select ParentStructRowID into aParentID  from ENTDIC_CURCOURCE where  ENTDIC_CURCOURCEid=aRowID;
  aParentTable := 'ENTDIC_CURRENCY';
 end; 


procedure ENTDIC_CURCOURCE_ISLOCKED /*Курс валюты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEid=aRowID;
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
  ENTDIC_CURCOURCE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_CURCOURCE_LOCK /*Курс валюты*/ (
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
 ENTDIC_CURCOURCE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_CURCOURCE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_CURCOURCE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_CURCOURCE set LockUserID =auserID ,LockSessionID =null where ENTDIC_CURCOURCEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_CURCOURCE set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_CURCOURCEid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_CURCOURCE_HCL /*Курс валюты*/ (
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


procedure ENTDIC_CURCOURCE_UNLOCK /*Курс валюты*/ (
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
 ENTDIC_CURCOURCE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_CURCOURCE set LockUserID =null  where ENTDIC_CURCOURCEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_CURCOURCE set LockSessionID =null  where ENTDIC_CURCOURCEid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_CURCOURCE_SINIT /*Курс валюты*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_CURCOURCE');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_CURCOURCE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_CURCOURCE set securitystyleid =aStyleID where ENTDIC_CURCOURCEid = aRowID;
else 
 update ENTDIC_CURCOURCE set securitystyleid =aSecurityStyleID where ENTDIC_CURCOURCEid = aRowID;
end if; 
end ; 


procedure ENTDIC_CURCOURCE_propagate /*Курс валюты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEid=aRowid;
end;



procedure ENTDIC_TRREG_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_TRREGid CHAR,
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
if aENTDIC_TRREGid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_TRREG where ENTDIC_TRREGID=aENTDIC_TRREGID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_TRREG where ENTDIC_TRREGid=aENTDIC_TRREGID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_TRREG');
    return;
  end if;
  aBRIEF:=func.ENTDIC_TRREG_BRIEF_F(aENTDIC_TRREGid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_TRREG_DELETE /*Районы доставки*/ (
 aCURSESSION CHAR,
 aENTDIC_TRREGid CHAR,
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
select count(*) into existsCnt from ENTDIC_TRREG where ENTDIC_TRREGID=aENTDIC_TRREGID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_TRREG where ENTDIC_TRREGid=aENTDIC_TRREGID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_TRREG',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_TRREG');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_TRREG_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_TRREGid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_TRREG');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_TRREG',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_TRREGid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_TRREG is select  instanceid ID from instance where OwnerPartName ='ENTDIC_TRREG' and OwnerRowID=aENTDIC_TRREGid;
row_ENTDIC_TRREG  chld_ENTDIC_TRREG%ROWTYPE;
begin
--open chld_ENTDIC_TRREG;
for row_ENTDIC_TRREG in chld_ENTDIC_TRREG loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_TRREG.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_TRREG.id);
end loop;
--close chld_ENTDIC_TRREG;
end ;
  delete from  ENTDIC_TRREG 
  where  ENTDIC_TRREGID = aENTDIC_TRREGID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Районы доставки*/
procedure ENTDIC_TRREG_SAVE /*Районы доставки*/ (
 aCURSESSION CHAR,
 aENTDIC_TRREGid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
,amapIndex
 NUMBER := null /* mapIndex *//* mapIndex */
,amapLayer
 VARCHAR2 := null /* mapLayer *//* mapLayer */
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
select count(*) into existsCnt from ENTDIC_TRREG where ENTDIC_TRREGID=aENTDIC_TRREGID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_TRREG where ENTDIC_TRREGid=aENTDIC_TRREGID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_TRREG',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_TRREG');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_TRREG_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_TRREGid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_TRREG');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_TRREG',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_TRREGid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_TRREG set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
,
  mapIndex=amapIndex
,
  mapLayer=amapLayer
  where  ENTDIC_TRREGID = aENTDIC_TRREGID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_TRREG',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_TRREG');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_TRREG');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_TRREG',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_TRREGid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_TRREG
 (  ENTDIC_TRREGID 
,InstanceID
,Code

,name

,mapIndex

,mapLayer

 ) values ( aENTDIC_TRREGID 
,aInstanceID
,aCode

,aname

,amapIndex

,amapLayer

 ); 
 ENTDIC_TRREG_SINIT( aCURSESSION,aENTDIC_TRREGid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_TRREG_PARENT /*Районы доставки*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_TRREG where  ENTDIC_TRREGid=aRowID;
 end; 


procedure ENTDIC_TRREG_ISLOCKED /*Районы доставки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_TRREG where ENTDIC_TRREGid=aRowID;
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
  ENTDIC_TRREG_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_TRREG_LOCK /*Районы доставки*/ (
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
 ENTDIC_TRREG_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_TRREG_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_TRREG where ENTDIC_TRREGid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_TRREG');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_TRREG set LockUserID =auserID ,LockSessionID =null where ENTDIC_TRREGid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_TRREG set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_TRREGid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_TRREG_HCL /*Районы доставки*/ (
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


procedure ENTDIC_TRREG_UNLOCK /*Районы доставки*/ (
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
 ENTDIC_TRREG_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_TRREG set LockUserID =null  where ENTDIC_TRREGid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_TRREG set LockSessionID =null  where ENTDIC_TRREGid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_TRREG_SINIT /*Районы доставки*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_TRREG where ENTDIC_TRREGid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_TRREG');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_TRREG_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_TRREG set securitystyleid =aStyleID where ENTDIC_TRREGid = aRowID;
else 
 update ENTDIC_TRREG set securitystyleid =aSecurityStyleID where ENTDIC_TRREGid = aRowID;
end if; 
end ; 


procedure ENTDIC_TRREG_propagate /*Районы доставки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_TRREG where ENTDIC_TRREGid=aRowid;
end;



procedure ENTDIC_STORETYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_STORETYPEid CHAR,
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
if aENTDIC_STORETYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_STORETYPE where ENTDIC_STORETYPEID=aENTDIC_STORETYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_STORETYPE where ENTDIC_STORETYPEid=aENTDIC_STORETYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_STORETYPE');
    return;
  end if;
  aBRIEF:=func.ENTDIC_STORETYPE_BRIEF_F(aENTDIC_STORETYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_STORETYPE_DELETE /*Тип склада*/ (
 aCURSESSION CHAR,
 aENTDIC_STORETYPEid CHAR,
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
select count(*) into existsCnt from ENTDIC_STORETYPE where ENTDIC_STORETYPEID=aENTDIC_STORETYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_STORETYPE where ENTDIC_STORETYPEid=aENTDIC_STORETYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_STORETYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_STORETYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_STORETYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_STORETYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_STORETYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_STORETYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_STORETYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_STORETYPE is select  instanceid ID from instance where OwnerPartName ='ENTDIC_STORETYPE' and OwnerRowID=aENTDIC_STORETYPEid;
row_ENTDIC_STORETYPE  chld_ENTDIC_STORETYPE%ROWTYPE;
begin
--open chld_ENTDIC_STORETYPE;
for row_ENTDIC_STORETYPE in chld_ENTDIC_STORETYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_STORETYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_STORETYPE.id);
end loop;
--close chld_ENTDIC_STORETYPE;
end ;
  delete from  ENTDIC_STORETYPE 
  where  ENTDIC_STORETYPEID = aENTDIC_STORETYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип склада*/
procedure ENTDIC_STORETYPE_SAVE /*Тип склада*/ (
 aCURSESSION CHAR,
 aENTDIC_STORETYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_STORETYPE where ENTDIC_STORETYPEID=aENTDIC_STORETYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_STORETYPE where ENTDIC_STORETYPEid=aENTDIC_STORETYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_STORETYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_STORETYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_STORETYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_STORETYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_STORETYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_STORETYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_STORETYPEid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_STORETYPE set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_STORETYPEID = aENTDIC_STORETYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_STORETYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_STORETYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_STORETYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_STORETYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_STORETYPEid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_STORETYPE
 (  ENTDIC_STORETYPEID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_STORETYPEID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_STORETYPE_SINIT( aCURSESSION,aENTDIC_STORETYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_STORETYPE_PARENT /*Тип склада*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_STORETYPE where  ENTDIC_STORETYPEid=aRowID;
 end; 


procedure ENTDIC_STORETYPE_ISLOCKED /*Тип склада*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_STORETYPE where ENTDIC_STORETYPEid=aRowID;
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
  ENTDIC_STORETYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_STORETYPE_LOCK /*Тип склада*/ (
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
 ENTDIC_STORETYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_STORETYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_STORETYPE where ENTDIC_STORETYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_STORETYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_STORETYPE set LockUserID =auserID ,LockSessionID =null where ENTDIC_STORETYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_STORETYPE set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_STORETYPEid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_STORETYPE_HCL /*Тип склада*/ (
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


procedure ENTDIC_STORETYPE_UNLOCK /*Тип склада*/ (
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
 ENTDIC_STORETYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_STORETYPE set LockUserID =null  where ENTDIC_STORETYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_STORETYPE set LockSessionID =null  where ENTDIC_STORETYPEid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_STORETYPE_SINIT /*Тип склада*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_STORETYPE where ENTDIC_STORETYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_STORETYPE');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_STORETYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_STORETYPE set securitystyleid =aStyleID where ENTDIC_STORETYPEid = aRowID;
else 
 update ENTDIC_STORETYPE set securitystyleid =aSecurityStyleID where ENTDIC_STORETYPEid = aRowID;
end if; 
end ; 


procedure ENTDIC_STORETYPE_propagate /*Тип склада*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_STORETYPE where ENTDIC_STORETYPEid=aRowid;
end;



procedure ENTDIC_MACHINES_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_MACHINESid CHAR,
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
if aENTDIC_MACHINESid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_MACHINES where ENTDIC_MACHINESID=aENTDIC_MACHINESID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_MACHINES where ENTDIC_MACHINESid=aENTDIC_MACHINESID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_MACHINES');
    return;
  end if;
  aBRIEF:=func.ENTDIC_MACHINES_BRIEF_F(aENTDIC_MACHINESid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_MACHINES_DELETE /*Тип производственного оборудования*/ (
 aCURSESSION CHAR,
 aENTDIC_MACHINESid CHAR,
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
select count(*) into existsCnt from ENTDIC_MACHINES where ENTDIC_MACHINESID=aENTDIC_MACHINESID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_MACHINES where ENTDIC_MACHINESid=aENTDIC_MACHINESID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_MACHINES',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_MACHINES');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_MACHINES_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_MACHINESid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_MACHINES');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_MACHINES',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_MACHINESid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_MACHINES is select  instanceid ID from instance where OwnerPartName ='ENTDIC_MACHINES' and OwnerRowID=aENTDIC_MACHINESid;
row_ENTDIC_MACHINES  chld_ENTDIC_MACHINES%ROWTYPE;
begin
--open chld_ENTDIC_MACHINES;
for row_ENTDIC_MACHINES in chld_ENTDIC_MACHINES loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_MACHINES.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_MACHINES.id);
end loop;
--close chld_ENTDIC_MACHINES;
end ;
  delete from  ENTDIC_MACHINES 
  where  ENTDIC_MACHINESID = aENTDIC_MACHINESID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип производственного оборудования*/
procedure ENTDIC_MACHINES_SAVE /*Тип производственного оборудования*/ (
 aCURSESSION CHAR,
 aENTDIC_MACHINESid CHAR,
aInstanceID CHAR 
,aname
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
select count(*) into existsCnt from ENTDIC_MACHINES where ENTDIC_MACHINESID=aENTDIC_MACHINESID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_MACHINES where ENTDIC_MACHINESid=aENTDIC_MACHINESID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_MACHINES',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_MACHINES');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_MACHINES_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_MACHINESid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_MACHINES');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_MACHINES',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_MACHINESid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_MACHINES set ChangeStamp=sysdate
,
  name=aname
  where  ENTDIC_MACHINESID = aENTDIC_MACHINESID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_MACHINES',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_MACHINES');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_MACHINES');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_MACHINES',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_MACHINESid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_MACHINES
 (  ENTDIC_MACHINESID 
,InstanceID
,name

 ) values ( aENTDIC_MACHINESID 
,aInstanceID
,aname

 ); 
 ENTDIC_MACHINES_SINIT( aCURSESSION,aENTDIC_MACHINESid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_MACHINES_PARENT /*Тип производственного оборудования*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_MACHINES where  ENTDIC_MACHINESid=aRowID;
 end; 


procedure ENTDIC_MACHINES_ISLOCKED /*Тип производственного оборудования*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_MACHINES where ENTDIC_MACHINESid=aRowID;
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
  ENTDIC_MACHINES_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_MACHINES_LOCK /*Тип производственного оборудования*/ (
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
 ENTDIC_MACHINES_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_MACHINES_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_MACHINES where ENTDIC_MACHINESid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_MACHINES');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_MACHINES set LockUserID =auserID ,LockSessionID =null where ENTDIC_MACHINESid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_MACHINES set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_MACHINESid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_MACHINES_HCL /*Тип производственного оборудования*/ (
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


procedure ENTDIC_MACHINES_UNLOCK /*Тип производственного оборудования*/ (
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
 ENTDIC_MACHINES_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_MACHINES set LockUserID =null  where ENTDIC_MACHINESid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_MACHINES set LockSessionID =null  where ENTDIC_MACHINESid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_MACHINES_SINIT /*Тип производственного оборудования*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_MACHINES where ENTDIC_MACHINESid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_MACHINES');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_MACHINES_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_MACHINES set securitystyleid =aStyleID where ENTDIC_MACHINESid = aRowID;
else 
 update ENTDIC_MACHINES set securitystyleid =aSecurityStyleID where ENTDIC_MACHINESid = aRowID;
end if; 
end ; 


procedure ENTDIC_MACHINES_propagate /*Тип производственного оборудования*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_MACHINES where ENTDIC_MACHINESid=aRowid;
end;



procedure ENTDIC_CLITYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_CLITYPEid CHAR,
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
if aENTDIC_CLITYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_CLITYPE where ENTDIC_CLITYPEID=aENTDIC_CLITYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_CLITYPE where ENTDIC_CLITYPEid=aENTDIC_CLITYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_CLITYPE');
    return;
  end if;
  aBRIEF:=func.ENTDIC_CLITYPE_BRIEF_F(aENTDIC_CLITYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_CLITYPE_DELETE /*Тип клиента*/ (
 aCURSESSION CHAR,
 aENTDIC_CLITYPEid CHAR,
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
select count(*) into existsCnt from ENTDIC_CLITYPE where ENTDIC_CLITYPEID=aENTDIC_CLITYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_CLITYPE where ENTDIC_CLITYPEid=aENTDIC_CLITYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_CLITYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_CLITYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_CLITYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_CLITYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_CLITYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_CLITYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_CLITYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_CLITYPE is select  instanceid ID from instance where OwnerPartName ='ENTDIC_CLITYPE' and OwnerRowID=aENTDIC_CLITYPEid;
row_ENTDIC_CLITYPE  chld_ENTDIC_CLITYPE%ROWTYPE;
begin
--open chld_ENTDIC_CLITYPE;
for row_ENTDIC_CLITYPE in chld_ENTDIC_CLITYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_CLITYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_CLITYPE.id);
end loop;
--close chld_ENTDIC_CLITYPE;
end ;
  delete from  ENTDIC_CLITYPE 
  where  ENTDIC_CLITYPEID = aENTDIC_CLITYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип клиента*/
procedure ENTDIC_CLITYPE_SAVE /*Тип клиента*/ (
 aCURSESSION CHAR,
 aENTDIC_CLITYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_CLITYPE where ENTDIC_CLITYPEID=aENTDIC_CLITYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_CLITYPE where ENTDIC_CLITYPEid=aENTDIC_CLITYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_CLITYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_CLITYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_CLITYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_CLITYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_CLITYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_CLITYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_CLITYPEid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_CLITYPE set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_CLITYPEID = aENTDIC_CLITYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_CLITYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_CLITYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_CLITYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_CLITYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_CLITYPEid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_CLITYPE
 (  ENTDIC_CLITYPEID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_CLITYPEID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_CLITYPE_SINIT( aCURSESSION,aENTDIC_CLITYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_CLITYPE_PARENT /*Тип клиента*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_CLITYPE where  ENTDIC_CLITYPEid=aRowID;
 end; 


procedure ENTDIC_CLITYPE_ISLOCKED /*Тип клиента*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_CLITYPE where ENTDIC_CLITYPEid=aRowID;
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
  ENTDIC_CLITYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_CLITYPE_LOCK /*Тип клиента*/ (
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
 ENTDIC_CLITYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_CLITYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_CLITYPE where ENTDIC_CLITYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_CLITYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_CLITYPE set LockUserID =auserID ,LockSessionID =null where ENTDIC_CLITYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_CLITYPE set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_CLITYPEid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_CLITYPE_HCL /*Тип клиента*/ (
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


procedure ENTDIC_CLITYPE_UNLOCK /*Тип клиента*/ (
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
 ENTDIC_CLITYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_CLITYPE set LockUserID =null  where ENTDIC_CLITYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_CLITYPE set LockSessionID =null  where ENTDIC_CLITYPEid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_CLITYPE_SINIT /*Тип клиента*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_CLITYPE where ENTDIC_CLITYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_CLITYPE');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_CLITYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_CLITYPE set securitystyleid =aStyleID where ENTDIC_CLITYPEid = aRowID;
else 
 update ENTDIC_CLITYPE set securitystyleid =aSecurityStyleID where ENTDIC_CLITYPEid = aRowID;
end if; 
end ; 


procedure ENTDIC_CLITYPE_propagate /*Тип клиента*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_CLITYPE where ENTDIC_CLITYPEid=aRowid;
end;



procedure ENTDIC_COUNTRY_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_COUNTRYid CHAR,
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
if aENTDIC_COUNTRYid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_COUNTRY where ENTDIC_COUNTRYID=aENTDIC_COUNTRYID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_COUNTRY where ENTDIC_COUNTRYid=aENTDIC_COUNTRYID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_COUNTRY');
    return;
  end if;
  aBRIEF:=func.ENTDIC_COUNTRY_BRIEF_F(aENTDIC_COUNTRYid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_COUNTRY_DELETE /*Страны*/ (
 aCURSESSION CHAR,
 aENTDIC_COUNTRYid CHAR,
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
select count(*) into existsCnt from ENTDIC_COUNTRY where ENTDIC_COUNTRYID=aENTDIC_COUNTRYID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_COUNTRY where ENTDIC_COUNTRYid=aENTDIC_COUNTRYID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_COUNTRY',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_COUNTRY');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_COUNTRY_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_COUNTRYid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_COUNTRY');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_COUNTRY',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_COUNTRYid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_COUNTRY is select  instanceid ID from instance where OwnerPartName ='ENTDIC_COUNTRY' and OwnerRowID=aENTDIC_COUNTRYid;
row_ENTDIC_COUNTRY  chld_ENTDIC_COUNTRY%ROWTYPE;
begin
--open chld_ENTDIC_COUNTRY;
for row_ENTDIC_COUNTRY in chld_ENTDIC_COUNTRY loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_COUNTRY.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_COUNTRY.id);
end loop;
--close chld_ENTDIC_COUNTRY;
end ;
  delete from  ENTDIC_COUNTRY 
  where  ENTDIC_COUNTRYID = aENTDIC_COUNTRYID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Страны*/
procedure ENTDIC_COUNTRY_SAVE /*Страны*/ (
 aCURSESSION CHAR,
 aENTDIC_COUNTRYid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_COUNTRY where ENTDIC_COUNTRYID=aENTDIC_COUNTRYID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_COUNTRY where ENTDIC_COUNTRYid=aENTDIC_COUNTRYID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_COUNTRY',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_COUNTRY');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_COUNTRY_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_COUNTRYid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_COUNTRY');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_COUNTRY',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_COUNTRYid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_COUNTRY set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_COUNTRYID = aENTDIC_COUNTRYID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_COUNTRY',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_COUNTRY');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_COUNTRY');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_COUNTRY',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_COUNTRYid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_COUNTRY
 (  ENTDIC_COUNTRYID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_COUNTRYID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_COUNTRY_SINIT( aCURSESSION,aENTDIC_COUNTRYid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_COUNTRY_PARENT /*Страны*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_COUNTRY where  ENTDIC_COUNTRYid=aRowID;
 end; 


procedure ENTDIC_COUNTRY_ISLOCKED /*Страны*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_COUNTRY where ENTDIC_COUNTRYid=aRowID;
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
  ENTDIC_COUNTRY_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_COUNTRY_LOCK /*Страны*/ (
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
 ENTDIC_COUNTRY_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_COUNTRY_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_COUNTRY where ENTDIC_COUNTRYid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_COUNTRY');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_COUNTRY set LockUserID =auserID ,LockSessionID =null where ENTDIC_COUNTRYid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_COUNTRY set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_COUNTRYid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_COUNTRY_HCL /*Страны*/ (
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


procedure ENTDIC_COUNTRY_UNLOCK /*Страны*/ (
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
 ENTDIC_COUNTRY_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_COUNTRY set LockUserID =null  where ENTDIC_COUNTRYid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_COUNTRY set LockSessionID =null  where ENTDIC_COUNTRYid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_COUNTRY_SINIT /*Страны*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_COUNTRY where ENTDIC_COUNTRYid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_COUNTRY');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_COUNTRY_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_COUNTRY set securitystyleid =aStyleID where ENTDIC_COUNTRYid = aRowID;
else 
 update ENTDIC_COUNTRY set securitystyleid =aSecurityStyleID where ENTDIC_COUNTRYid = aRowID;
end if; 
end ; 


procedure ENTDIC_COUNTRY_propagate /*Страны*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_COUNTRY where ENTDIC_COUNTRYid=aRowid;
end;



procedure ENTDIC_PACKAGE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_PACKAGEid CHAR,
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
if aENTDIC_PACKAGEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_PACKAGE where ENTDIC_PACKAGEID=aENTDIC_PACKAGEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_PACKAGE where ENTDIC_PACKAGEid=aENTDIC_PACKAGEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_PACKAGE');
    return;
  end if;
  aBRIEF:=func.ENTDIC_PACKAGE_BRIEF_F(aENTDIC_PACKAGEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_PACKAGE_DELETE /*Упаковка*/ (
 aCURSESSION CHAR,
 aENTDIC_PACKAGEid CHAR,
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
select count(*) into existsCnt from ENTDIC_PACKAGE where ENTDIC_PACKAGEID=aENTDIC_PACKAGEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_PACKAGE where ENTDIC_PACKAGEid=aENTDIC_PACKAGEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_PACKAGE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_PACKAGE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_PACKAGE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_PACKAGEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_PACKAGE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_PACKAGE',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_PACKAGEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_PACKAGE is select  instanceid ID from instance where OwnerPartName ='ENTDIC_PACKAGE' and OwnerRowID=aENTDIC_PACKAGEid;
row_ENTDIC_PACKAGE  chld_ENTDIC_PACKAGE%ROWTYPE;
begin
--open chld_ENTDIC_PACKAGE;
for row_ENTDIC_PACKAGE in chld_ENTDIC_PACKAGE loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_PACKAGE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_PACKAGE.id);
end loop;
--close chld_ENTDIC_PACKAGE;
end ;
  delete from  ENTDIC_PACKAGE 
  where  ENTDIC_PACKAGEID = aENTDIC_PACKAGEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Упаковка*/
procedure ENTDIC_PACKAGE_SAVE /*Упаковка*/ (
 aCURSESSION CHAR,
 aENTDIC_PACKAGEid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aWieght
 NUMBER/* Вес *//* Вес */
,aPLenght
 NUMBER/* Длина *//* Длина */
,aPHeight
 NUMBER/* Высота *//* Высота */
,aPWidth
 NUMBER/* Ширина *//* Ширина */
,aNetto
 NUMBER/* Внутренний объем *//* Внутренний объем */
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
select count(*) into existsCnt from ENTDIC_PACKAGE where ENTDIC_PACKAGEID=aENTDIC_PACKAGEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_PACKAGE where ENTDIC_PACKAGEid=aENTDIC_PACKAGEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_PACKAGE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_PACKAGE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_PACKAGE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_PACKAGEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_PACKAGE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_PACKAGE',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_PACKAGEid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_PACKAGE set ChangeStamp=sysdate
,
  name=aname
,
  Wieght=aWieght
,
  PLenght=aPLenght
,
  PHeight=aPHeight
,
  PWidth=aPWidth
,
  Netto=aNetto
  where  ENTDIC_PACKAGEID = aENTDIC_PACKAGEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_PACKAGE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_PACKAGE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_PACKAGE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_PACKAGE',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_PACKAGEid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_PACKAGE
 (  ENTDIC_PACKAGEID 
,InstanceID
,name

,Wieght

,PLenght

,PHeight

,PWidth

,Netto

 ) values ( aENTDIC_PACKAGEID 
,aInstanceID
,aname

,aWieght

,aPLenght

,aPHeight

,aPWidth

,aNetto

 ); 
 ENTDIC_PACKAGE_SINIT( aCURSESSION,aENTDIC_PACKAGEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_PACKAGE_PARENT /*Упаковка*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_PACKAGE where  ENTDIC_PACKAGEid=aRowID;
 end; 


procedure ENTDIC_PACKAGE_ISLOCKED /*Упаковка*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_PACKAGE where ENTDIC_PACKAGEid=aRowID;
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
  ENTDIC_PACKAGE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_PACKAGE_LOCK /*Упаковка*/ (
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
 ENTDIC_PACKAGE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_PACKAGE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_PACKAGE where ENTDIC_PACKAGEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_PACKAGE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_PACKAGE set LockUserID =auserID ,LockSessionID =null where ENTDIC_PACKAGEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_PACKAGE set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_PACKAGEid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_PACKAGE_HCL /*Упаковка*/ (
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


procedure ENTDIC_PACKAGE_UNLOCK /*Упаковка*/ (
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
 ENTDIC_PACKAGE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_PACKAGE set LockUserID =null  where ENTDIC_PACKAGEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_PACKAGE set LockSessionID =null  where ENTDIC_PACKAGEid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_PACKAGE_SINIT /*Упаковка*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_PACKAGE where ENTDIC_PACKAGEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_PACKAGE');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_PACKAGE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_PACKAGE set securitystyleid =aStyleID where ENTDIC_PACKAGEid = aRowID;
else 
 update ENTDIC_PACKAGE set securitystyleid =aSecurityStyleID where ENTDIC_PACKAGEid = aRowID;
end if; 
end ; 


procedure ENTDIC_PACKAGE_propagate /*Упаковка*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_PACKAGE where ENTDIC_PACKAGEid=aRowid;
end;



procedure ENTDIC_SRV_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_SRVid CHAR,
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
if aENTDIC_SRVid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_SRV where ENTDIC_SRVID=aENTDIC_SRVID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_SRV where ENTDIC_SRVid=aENTDIC_SRVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_SRV');
    return;
  end if;
  aBRIEF:=func.ENTDIC_SRV_BRIEF_F(aENTDIC_SRVid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_SRV_DELETE /*Услуги*/ (
 aCURSESSION CHAR,
 aENTDIC_SRVid CHAR,
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
select count(*) into existsCnt from ENTDIC_SRV where ENTDIC_SRVID=aENTDIC_SRVID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_SRV where ENTDIC_SRVid=aENTDIC_SRVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_SRV',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_SRV');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_SRV_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_SRVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_SRV');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_SRV',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_SRVid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_SRV is select  instanceid ID from instance where OwnerPartName ='ENTDIC_SRV' and OwnerRowID=aENTDIC_SRVid;
row_ENTDIC_SRV  chld_ENTDIC_SRV%ROWTYPE;
begin
--open chld_ENTDIC_SRV;
for row_ENTDIC_SRV in chld_ENTDIC_SRV loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_SRV.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_SRV.id);
end loop;
--close chld_ENTDIC_SRV;
end ;
  delete from  ENTDIC_SRV 
  where  ENTDIC_SRVID = aENTDIC_SRVID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Услуги*/
procedure ENTDIC_SRV_SAVE /*Услуги*/ (
 aCURSESSION CHAR,
 aENTDIC_SRVid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_SRV where ENTDIC_SRVID=aENTDIC_SRVID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_SRV where ENTDIC_SRVid=aENTDIC_SRVID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_SRV',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_SRV');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_SRV_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_SRVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_SRV');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_SRV',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_SRVid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_SRV set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_SRVID = aENTDIC_SRVID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_SRV',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_SRV');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_SRV');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_SRV',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_SRVid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_SRV
 (  ENTDIC_SRVID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_SRVID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_SRV_SINIT( aCURSESSION,aENTDIC_SRVid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_SRV_PARENT /*Услуги*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_SRV where  ENTDIC_SRVid=aRowID;
 end; 


procedure ENTDIC_SRV_ISLOCKED /*Услуги*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_SRV where ENTDIC_SRVid=aRowID;
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
  ENTDIC_SRV_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_SRV_LOCK /*Услуги*/ (
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
 ENTDIC_SRV_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_SRV_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_SRV where ENTDIC_SRVid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_SRV');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_SRV set LockUserID =auserID ,LockSessionID =null where ENTDIC_SRVid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_SRV set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_SRVid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_SRV_HCL /*Услуги*/ (
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


procedure ENTDIC_SRV_UNLOCK /*Услуги*/ (
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
 ENTDIC_SRV_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_SRV set LockUserID =null  where ENTDIC_SRVid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_SRV set LockSessionID =null  where ENTDIC_SRVid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_SRV_SINIT /*Услуги*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_SRV where ENTDIC_SRVid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_SRV');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_SRV_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_SRV set securitystyleid =aStyleID where ENTDIC_SRVid = aRowID;
else 
 update ENTDIC_SRV set securitystyleid =aSecurityStyleID where ENTDIC_SRVid = aRowID;
end if; 
end ; 


procedure ENTDIC_SRV_propagate /*Услуги*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_SRV where ENTDIC_SRVid=aRowid;
end;



procedure ENTDiC_RETTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDiC_RETTYPEid CHAR,
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
if aENTDiC_RETTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDiC_RETTYPE where ENTDiC_RETTYPEID=aENTDiC_RETTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDiC_RETTYPE where ENTDiC_RETTYPEid=aENTDiC_RETTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDiC_RETTYPE');
    return;
  end if;
  aBRIEF:=func.ENTDiC_RETTYPE_BRIEF_F(aENTDiC_RETTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDiC_RETTYPE_DELETE /*Тип возврата*/ (
 aCURSESSION CHAR,
 aENTDiC_RETTYPEid CHAR,
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
select count(*) into existsCnt from ENTDiC_RETTYPE where ENTDiC_RETTYPEID=aENTDiC_RETTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDiC_RETTYPE where ENTDiC_RETTYPEid=aENTDiC_RETTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDiC_RETTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDiC_RETTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDiC_RETTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDiC_RETTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDiC_RETTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDiC_RETTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDiC_RETTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDiC_RETTYPE is select  instanceid ID from instance where OwnerPartName ='ENTDiC_RETTYPE' and OwnerRowID=aENTDiC_RETTYPEid;
row_ENTDiC_RETTYPE  chld_ENTDiC_RETTYPE%ROWTYPE;
begin
--open chld_ENTDiC_RETTYPE;
for row_ENTDiC_RETTYPE in chld_ENTDiC_RETTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDiC_RETTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDiC_RETTYPE.id);
end loop;
--close chld_ENTDiC_RETTYPE;
end ;
  delete from  ENTDiC_RETTYPE 
  where  ENTDiC_RETTYPEID = aENTDiC_RETTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип возврата*/
procedure ENTDiC_RETTYPE_SAVE /*Тип возврата*/ (
 aCURSESSION CHAR,
 aENTDiC_RETTYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDiC_RETTYPE where ENTDiC_RETTYPEID=aENTDiC_RETTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDiC_RETTYPE where ENTDiC_RETTYPEid=aENTDiC_RETTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDiC_RETTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDiC_RETTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDiC_RETTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDiC_RETTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDiC_RETTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDiC_RETTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDiC_RETTYPEid,aLogInstanceID=>aInstanceID);
 update  ENTDiC_RETTYPE set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDiC_RETTYPEID = aENTDiC_RETTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDiC_RETTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDiC_RETTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDiC_RETTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDiC_RETTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDiC_RETTYPEid,aLogInstanceID=>aInstanceID);
 insert into   ENTDiC_RETTYPE
 (  ENTDiC_RETTYPEID 
,InstanceID
,Code

,name

 ) values ( aENTDiC_RETTYPEID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDiC_RETTYPE_SINIT( aCURSESSION,aENTDiC_RETTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDiC_RETTYPE_PARENT /*Тип возврата*/ (
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
  select  INSTANCEID into aParentID from ENTDiC_RETTYPE where  ENTDiC_RETTYPEid=aRowID;
 end; 


procedure ENTDiC_RETTYPE_ISLOCKED /*Тип возврата*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDiC_RETTYPE where ENTDiC_RETTYPEid=aRowID;
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
  ENTDiC_RETTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDiC_RETTYPE_LOCK /*Тип возврата*/ (
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
 ENTDiC_RETTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDiC_RETTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDiC_RETTYPE where ENTDiC_RETTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDiC_RETTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDiC_RETTYPE set LockUserID =auserID ,LockSessionID =null where ENTDiC_RETTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDiC_RETTYPE set LockUserID =null,LockSessionID =aCURSESSION  where ENTDiC_RETTYPEid=aRowID;
     return;
   end if;
 end ;


procedure ENTDiC_RETTYPE_HCL /*Тип возврата*/ (
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


procedure ENTDiC_RETTYPE_UNLOCK /*Тип возврата*/ (
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
 ENTDiC_RETTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDiC_RETTYPE set LockUserID =null  where ENTDiC_RETTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDiC_RETTYPE set LockSessionID =null  where ENTDiC_RETTYPEid=aRowID;
     return;
   end if;
 end; 


procedure ENTDiC_RETTYPE_SINIT /*Тип возврата*/ (
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
 select  SecurityStyleID into atmpID from ENTDiC_RETTYPE where ENTDiC_RETTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDiC_RETTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDiC_RETTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDiC_RETTYPE set securitystyleid =aStyleID where ENTDiC_RETTYPEid = aRowID;
else 
 update ENTDiC_RETTYPE set securitystyleid =aSecurityStyleID where ENTDiC_RETTYPEid = aRowID;
end if; 
end ; 


procedure ENTDiC_RETTYPE_propagate /*Тип возврата*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDiC_RETTYPE where ENTDiC_RETTYPEid=aRowid;
end;



procedure ENTDIC_REGION_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_REGIONid CHAR,
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
if aENTDIC_REGIONid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_REGION where ENTDIC_REGIONID=aENTDIC_REGIONID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_REGION where ENTDIC_REGIONid=aENTDIC_REGIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_REGION');
    return;
  end if;
  aBRIEF:=func.ENTDIC_REGION_BRIEF_F(aENTDIC_REGIONid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_REGION_DELETE /*Название областей*/ (
 aCURSESSION CHAR,
 aENTDIC_REGIONid CHAR,
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
select count(*) into existsCnt from ENTDIC_REGION where ENTDIC_REGIONID=aENTDIC_REGIONID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_REGION where ENTDIC_REGIONid=aENTDIC_REGIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_REGION',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_REGION');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_REGION_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_REGIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_REGION');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_REGION',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_REGIONid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_REGION is select  instanceid ID from instance where OwnerPartName ='ENTDIC_REGION' and OwnerRowID=aENTDIC_REGIONid;
row_ENTDIC_REGION  chld_ENTDIC_REGION%ROWTYPE;
begin
--open chld_ENTDIC_REGION;
for row_ENTDIC_REGION in chld_ENTDIC_REGION loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_REGION.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_REGION.id);
end loop;
--close chld_ENTDIC_REGION;
end ;
  delete from  ENTDIC_REGION 
  where  ENTDIC_REGIONID = aENTDIC_REGIONID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Название областей*/
procedure ENTDIC_REGION_SAVE /*Название областей*/ (
 aCURSESSION CHAR,
 aENTDIC_REGIONid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_REGION where ENTDIC_REGIONID=aENTDIC_REGIONID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_REGION where ENTDIC_REGIONid=aENTDIC_REGIONID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_REGION',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_REGION');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_REGION_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_REGIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_REGION');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_REGION',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_REGIONid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_REGION set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_REGIONID = aENTDIC_REGIONID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_REGION',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_REGION');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_REGION');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_REGION',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_REGIONid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_REGION
 (  ENTDIC_REGIONID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_REGIONID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_REGION_SINIT( aCURSESSION,aENTDIC_REGIONid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_REGION_PARENT /*Название областей*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_REGION where  ENTDIC_REGIONid=aRowID;
 end; 


procedure ENTDIC_REGION_ISLOCKED /*Название областей*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_REGION where ENTDIC_REGIONid=aRowID;
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
  ENTDIC_REGION_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_REGION_LOCK /*Название областей*/ (
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
 ENTDIC_REGION_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_REGION_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_REGION where ENTDIC_REGIONid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_REGION');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_REGION set LockUserID =auserID ,LockSessionID =null where ENTDIC_REGIONid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_REGION set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_REGIONid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_REGION_HCL /*Название областей*/ (
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


procedure ENTDIC_REGION_UNLOCK /*Название областей*/ (
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
 ENTDIC_REGION_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_REGION set LockUserID =null  where ENTDIC_REGIONid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_REGION set LockSessionID =null  where ENTDIC_REGIONid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_REGION_SINIT /*Название областей*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_REGION where ENTDIC_REGIONid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_REGION');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_REGION_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_REGION set securitystyleid =aStyleID where ENTDIC_REGIONid = aRowID;
else 
 update ENTDIC_REGION set securitystyleid =aSecurityStyleID where ENTDIC_REGIONid = aRowID;
end if; 
end ; 


procedure ENTDIC_REGION_propagate /*Название областей*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_REGION where ENTDIC_REGIONid=aRowid;
end;



procedure ENTDIC_VOT_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_VOTid CHAR,
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
if aENTDIC_VOTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_VOT where ENTDIC_VOTID=aENTDIC_VOTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_VOT where ENTDIC_VOTid=aENTDIC_VOTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_VOT');
    return;
  end if;
  aBRIEF:=func.ENTDIC_VOT_BRIEF_F(aENTDIC_VOTid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_VOT_DELETE /*Вид отгрузки*/ (
 aCURSESSION CHAR,
 aENTDIC_VOTid CHAR,
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
select count(*) into existsCnt from ENTDIC_VOT where ENTDIC_VOTID=aENTDIC_VOTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_VOT where ENTDIC_VOTid=aENTDIC_VOTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_VOT',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_VOT');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_VOT_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_VOTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_VOT');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_VOT',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_VOTid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_VOT is select  instanceid ID from instance where OwnerPartName ='ENTDIC_VOT' and OwnerRowID=aENTDIC_VOTid;
row_ENTDIC_VOT  chld_ENTDIC_VOT%ROWTYPE;
begin
--open chld_ENTDIC_VOT;
for row_ENTDIC_VOT in chld_ENTDIC_VOT loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_VOT.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_VOT.id);
end loop;
--close chld_ENTDIC_VOT;
end ;
  delete from  ENTDIC_VOT 
  where  ENTDIC_VOTID = aENTDIC_VOTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Вид отгрузки*/
procedure ENTDIC_VOT_SAVE /*Вид отгрузки*/ (
 aCURSESSION CHAR,
 aENTDIC_VOTid CHAR,
aInstanceID CHAR 
,acode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_VOT where ENTDIC_VOTID=aENTDIC_VOTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_VOT where ENTDIC_VOTid=aENTDIC_VOTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_VOT',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_VOT');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_VOT_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_VOTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_VOT');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_VOT',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_VOTid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_VOT set ChangeStamp=sysdate
,
  code=acode
,
  name=aname
  where  ENTDIC_VOTID = aENTDIC_VOTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_VOT',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_VOT');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_VOT');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_VOT',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_VOTid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_VOT
 (  ENTDIC_VOTID 
,InstanceID
,code

,name

 ) values ( aENTDIC_VOTID 
,aInstanceID
,acode

,aname

 ); 
 ENTDIC_VOT_SINIT( aCURSESSION,aENTDIC_VOTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_VOT_PARENT /*Вид отгрузки*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_VOT where  ENTDIC_VOTid=aRowID;
 end; 


procedure ENTDIC_VOT_ISLOCKED /*Вид отгрузки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_VOT where ENTDIC_VOTid=aRowID;
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
  ENTDIC_VOT_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_VOT_LOCK /*Вид отгрузки*/ (
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
 ENTDIC_VOT_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_VOT_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_VOT where ENTDIC_VOTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_VOT');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_VOT set LockUserID =auserID ,LockSessionID =null where ENTDIC_VOTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_VOT set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_VOTid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_VOT_HCL /*Вид отгрузки*/ (
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


procedure ENTDIC_VOT_UNLOCK /*Вид отгрузки*/ (
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
 ENTDIC_VOT_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_VOT set LockUserID =null  where ENTDIC_VOTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_VOT set LockSessionID =null  where ENTDIC_VOTid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_VOT_SINIT /*Вид отгрузки*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_VOT where ENTDIC_VOTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_VOT');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_VOT_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_VOT set securitystyleid =aStyleID where ENTDIC_VOTid = aRowID;
else 
 update ENTDIC_VOT set securitystyleid =aSecurityStyleID where ENTDIC_VOTid = aRowID;
end if; 
end ; 


procedure ENTDIC_VOT_propagate /*Вид отгрузки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_VOT where ENTDIC_VOTid=aRowid;
end;



procedure ENTDIC_PRTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_PRTYPEid CHAR,
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
if aENTDIC_PRTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_PRTYPE where ENTDIC_PRTYPEID=aENTDIC_PRTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_PRTYPE where ENTDIC_PRTYPEid=aENTDIC_PRTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_PRTYPE');
    return;
  end if;
  aBRIEF:=func.ENTDIC_PRTYPE_BRIEF_F(aENTDIC_PRTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_PRTYPE_DELETE /*Отрасль производства*/ (
 aCURSESSION CHAR,
 aENTDIC_PRTYPEid CHAR,
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
select count(*) into existsCnt from ENTDIC_PRTYPE where ENTDIC_PRTYPEID=aENTDIC_PRTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_PRTYPE where ENTDIC_PRTYPEid=aENTDIC_PRTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_PRTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_PRTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_PRTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_PRTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_PRTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_PRTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_PRTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_PRTYPE is select  instanceid ID from instance where OwnerPartName ='ENTDIC_PRTYPE' and OwnerRowID=aENTDIC_PRTYPEid;
row_ENTDIC_PRTYPE  chld_ENTDIC_PRTYPE%ROWTYPE;
begin
--open chld_ENTDIC_PRTYPE;
for row_ENTDIC_PRTYPE in chld_ENTDIC_PRTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_PRTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_PRTYPE.id);
end loop;
--close chld_ENTDIC_PRTYPE;
end ;
  delete from  ENTDIC_PRTYPE 
  where  ENTDIC_PRTYPEID = aENTDIC_PRTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Отрасль производства*/
procedure ENTDIC_PRTYPE_SAVE /*Отрасль производства*/ (
 aCURSESSION CHAR,
 aENTDIC_PRTYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
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
select count(*) into existsCnt from ENTDIC_PRTYPE where ENTDIC_PRTYPEID=aENTDIC_PRTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_PRTYPE where ENTDIC_PRTYPEid=aENTDIC_PRTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_PRTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_PRTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_PRTYPE_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_PRTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_PRTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_PRTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_PRTYPEid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_PRTYPE set ChangeStamp=sysdate
,
  Code=aCode
,
  name=aname
  where  ENTDIC_PRTYPEID = aENTDIC_PRTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_PRTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_PRTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_PRTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_PRTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_PRTYPEid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_PRTYPE
 (  ENTDIC_PRTYPEID 
,InstanceID
,Code

,name

 ) values ( aENTDIC_PRTYPEID 
,aInstanceID
,aCode

,aname

 ); 
 ENTDIC_PRTYPE_SINIT( aCURSESSION,aENTDIC_PRTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_PRTYPE_PARENT /*Отрасль производства*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_PRTYPE where  ENTDIC_PRTYPEid=aRowID;
 end; 


procedure ENTDIC_PRTYPE_ISLOCKED /*Отрасль производства*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_PRTYPE where ENTDIC_PRTYPEid=aRowID;
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
  ENTDIC_PRTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_PRTYPE_LOCK /*Отрасль производства*/ (
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
 ENTDIC_PRTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_PRTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_PRTYPE where ENTDIC_PRTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_PRTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_PRTYPE set LockUserID =auserID ,LockSessionID =null where ENTDIC_PRTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_PRTYPE set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_PRTYPEid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_PRTYPE_HCL /*Отрасль производства*/ (
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


procedure ENTDIC_PRTYPE_UNLOCK /*Отрасль производства*/ (
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
 ENTDIC_PRTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_PRTYPE set LockUserID =null  where ENTDIC_PRTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_PRTYPE set LockSessionID =null  where ENTDIC_PRTYPEid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_PRTYPE_SINIT /*Отрасль производства*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_PRTYPE where ENTDIC_PRTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_PRTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_PRTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_PRTYPE set securitystyleid =aStyleID where ENTDIC_PRTYPEid = aRowID;
else 
 update ENTDIC_PRTYPE set securitystyleid =aSecurityStyleID where ENTDIC_PRTYPEid = aRowID;
end if; 
end ; 


procedure ENTDIC_PRTYPE_propagate /*Отрасль производства*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_PRTYPE where ENTDIC_PRTYPEid=aRowid;
end;



procedure ENTDIC_NALOGI_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_NALOGIid CHAR,
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
if aENTDIC_NALOGIid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from ENTDIC_NALOGI where ENTDIC_NALOGIID=aENTDIC_NALOGIID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from ENTDIC_NALOGI where ENTDIC_NALOGIid=aENTDIC_NALOGIID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=ENTDIC_NALOGI');
    return;
  end if;
  aBRIEF:=func.ENTDIC_NALOGI_BRIEF_F(aENTDIC_NALOGIid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure ENTDIC_NALOGI_DELETE /*Схема учета налогов*/ (
 aCURSESSION CHAR,
 aENTDIC_NALOGIid CHAR,
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
select count(*) into existsCnt from ENTDIC_NALOGI where ENTDIC_NALOGIID=aENTDIC_NALOGIID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from ENTDIC_NALOGI where ENTDIC_NALOGIid=aENTDIC_NALOGIID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:ENTDIC_NALOGI',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=ENTDIC_NALOGI');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_NALOGI_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_NALOGIid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=ENTDIC_NALOGI');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_NALOGI',
 aVERB=>'DELETEROW',  aThe_Resource=>aENTDIC_NALOGIid, aLogInstanceID=>aInstanceID);
declare cursor chld_ENTDIC_NALOGI is select  instanceid ID from instance where OwnerPartName ='ENTDIC_NALOGI' and OwnerRowID=aENTDIC_NALOGIid;
row_ENTDIC_NALOGI  chld_ENTDIC_NALOGI%ROWTYPE;
begin
--open chld_ENTDIC_NALOGI;
for row_ENTDIC_NALOGI in chld_ENTDIC_NALOGI loop
 Kernel.INSTANCE_OWNER (acursession,row_ENTDIC_NALOGI.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_ENTDIC_NALOGI.id);
end loop;
--close chld_ENTDIC_NALOGI;
end ;
  delete from  ENTDIC_NALOGI 
  where  ENTDIC_NALOGIID = aENTDIC_NALOGIID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Схема учета налогов*/
procedure ENTDIC_NALOGI_SAVE /*Схема учета налогов*/ (
 aCURSESSION CHAR,
 aENTDIC_NALOGIid CHAR,
aInstanceID CHAR 
,aname
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
select count(*) into existsCnt from ENTDIC_NALOGI where ENTDIC_NALOGIID=aENTDIC_NALOGIID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from ENTDIC_NALOGI where ENTDIC_NALOGIid=aENTDIC_NALOGIID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:ENTDIC_NALOGI',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=ENTDIC_NALOGI');
      return;
    end if;
  end if;
 --  verify lock  --
 ENTDIC_NALOGI_ISLOCKED( acursession=>acursession,aROWID=>aENTDIC_NALOGIid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_NALOGI');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_NALOGI',
 aVERB=>'EDITROW',  aThe_Resource=>aENTDIC_NALOGIid,aLogInstanceID=>aInstanceID);
 update  ENTDIC_NALOGI set ChangeStamp=sysdate
,
  name=aname
  where  ENTDIC_NALOGIID = aENTDIC_NALOGIID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:ENTDIC_NALOGI',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=ENTDIC_NALOGI');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=ENTDIC_NALOGI');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'ENTDIC_NALOGI',
 aVERB=>'CREATEROW',  aThe_Resource=>aENTDIC_NALOGIid,aLogInstanceID=>aInstanceID);
 insert into   ENTDIC_NALOGI
 (  ENTDIC_NALOGIID 
,InstanceID
,name

 ) values ( aENTDIC_NALOGIID 
,aInstanceID
,aname

 ); 
 ENTDIC_NALOGI_SINIT( aCURSESSION,aENTDIC_NALOGIid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure ENTDIC_NALOGI_PARENT /*Схема учета налогов*/ (
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
  select  INSTANCEID into aParentID from ENTDIC_NALOGI where  ENTDIC_NALOGIid=aRowID;
 end; 


procedure ENTDIC_NALOGI_ISLOCKED /*Схема учета налогов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from ENTDIC_NALOGI where ENTDIC_NALOGIid=aRowID;
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
  ENTDIC_NALOGI_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin ENTDIC.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure ENTDIC_NALOGI_LOCK /*Схема учета налогов*/ (
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
 ENTDIC_NALOGI_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  ENTDIC_NALOGI_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from ENTDIC_NALOGI where ENTDIC_NALOGIid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=ENTDIC_NALOGI');
    return;
  end if;
   if  aLockMode =2  
   then   
    update ENTDIC_NALOGI set LockUserID =auserID ,LockSessionID =null where ENTDIC_NALOGIid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update ENTDIC_NALOGI set LockUserID =null,LockSessionID =aCURSESSION  where ENTDIC_NALOGIid=aRowID;
     return;
   end if;
 end ;


procedure ENTDIC_NALOGI_HCL /*Схема учета налогов*/ (
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


procedure ENTDIC_NALOGI_UNLOCK /*Схема учета налогов*/ (
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
 ENTDIC_NALOGI_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update ENTDIC_NALOGI set LockUserID =null  where ENTDIC_NALOGIid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update ENTDIC_NALOGI set LockSessionID =null  where ENTDIC_NALOGIid=aRowID;
     return;
   end if;
 end; 


procedure ENTDIC_NALOGI_SINIT /*Схема учета налогов*/ (
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
 select  SecurityStyleID into atmpID from ENTDIC_NALOGI where ENTDIC_NALOGIid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =ENTDIC_NALOGI');
    return;
  end if;
if aSecurityStyleID is null then
 ENTDIC_NALOGI_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update ENTDIC_NALOGI set securitystyleid =aStyleID where ENTDIC_NALOGIid = aRowID;
else 
 update ENTDIC_NALOGI set securitystyleid =aSecurityStyleID where ENTDIC_NALOGIid = aRowID;
end if; 
end ; 


procedure ENTDIC_NALOGI_propagate /*Схема учета налогов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from ENTDIC_NALOGI where ENTDIC_NALOGIid=aRowid;
end;


end ENTDIC;

/



