
/* --PEKD*/

 create or replace package body PEKD as

procedure PEKD_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='PEKD'
then
declare cursor child_PEKD_ADDS is select PEKD_ADDS.PEKD_ADDSid ID from PEKD_ADDS where  PEKD_ADDS.InstanceID = ainstanceid;
row_PEKD_ADDS  child_PEKD_ADDS%ROWTYPE;
begin
--open child_PEKD_ADDS;
for row_PEKD_ADDS in child_PEKD_ADDS loop
 PEKD_ADDS_DELETE (acursession,row_PEKD_ADDS.id,aInstanceID);
end loop;
--close child_PEKD_ADDS;
end;
declare cursor child_PEKD_TRAINTYPE is select PEKD_TRAINTYPE.PEKD_TRAINTYPEid ID from PEKD_TRAINTYPE where  PEKD_TRAINTYPE.InstanceID = ainstanceid;
row_PEKD_TRAINTYPE  child_PEKD_TRAINTYPE%ROWTYPE;
begin
--open child_PEKD_TRAINTYPE;
for row_PEKD_TRAINTYPE in child_PEKD_TRAINTYPE loop
 PEKD_TRAINTYPE_DELETE (acursession,row_PEKD_TRAINTYPE.id,aInstanceID);
end loop;
--close child_PEKD_TRAINTYPE;
end;
declare cursor child_PEKD_GOTYPE is select PEKD_GOTYPE.PEKD_GOTYPEid ID from PEKD_GOTYPE where  PEKD_GOTYPE.InstanceID = ainstanceid;
row_PEKD_GOTYPE  child_PEKD_GOTYPE%ROWTYPE;
begin
--open child_PEKD_GOTYPE;
for row_PEKD_GOTYPE in child_PEKD_GOTYPE loop
 PEKD_GOTYPE_DELETE (acursession,row_PEKD_GOTYPE.id,aInstanceID);
end loop;
--close child_PEKD_GOTYPE;
end;
declare cursor child_PEKD_INFOSENDTYPE is select PEKD_INFOSENDTYPE.PEKD_INFOSENDTYPEid ID from PEKD_INFOSENDTYPE where  PEKD_INFOSENDTYPE.InstanceID = ainstanceid;
row_PEKD_INFOSENDTYPE  child_PEKD_INFOSENDTYPE%ROWTYPE;
begin
--open child_PEKD_INFOSENDTYPE;
for row_PEKD_INFOSENDTYPE in child_PEKD_INFOSENDTYPE loop
 PEKD_INFOSENDTYPE_DELETE (acursession,row_PEKD_INFOSENDTYPE.id,aInstanceID);
end loop;
--close child_PEKD_INFOSENDTYPE;
end;
declare cursor child_PEKD_ST is select PEKD_ST.PEKD_STid ID from PEKD_ST where  PEKD_ST.InstanceID = ainstanceid;
row_PEKD_ST  child_PEKD_ST%ROWTYPE;
begin
--open child_PEKD_ST;
for row_PEKD_ST in child_PEKD_ST loop
 PEKD_ST_DELETE (acursession,row_PEKD_ST.id,aInstanceID);
end loop;
--close child_PEKD_ST;
end;
declare cursor child_PEKD_TRTYPE is select PEKD_TRTYPE.PEKD_TRTYPEid ID from PEKD_TRTYPE where  PEKD_TRTYPE.InstanceID = ainstanceid;
row_PEKD_TRTYPE  child_PEKD_TRTYPE%ROWTYPE;
begin
--open child_PEKD_TRTYPE;
for row_PEKD_TRTYPE in child_PEKD_TRTYPE loop
 PEKD_TRTYPE_DELETE (acursession,row_PEKD_TRTYPE.id,aInstanceID);
end loop;
--close child_PEKD_TRTYPE;
end;
declare cursor child_PEKD_POSTTYPE is select PEKD_POSTTYPE.PEKD_POSTTYPEid ID from PEKD_POSTTYPE where  PEKD_POSTTYPE.InstanceID = ainstanceid;
row_PEKD_POSTTYPE  child_PEKD_POSTTYPE%ROWTYPE;
begin
--open child_PEKD_POSTTYPE;
for row_PEKD_POSTTYPE in child_PEKD_POSTTYPE loop
 PEKD_POSTTYPE_DELETE (acursession,row_PEKD_POSTTYPE.id,aInstanceID);
end loop;
--close child_PEKD_POSTTYPE;
end;
declare cursor child_PEKD_TRFGRP is select PEKD_TRFGRP.PEKD_TRFGRPid ID from PEKD_TRFGRP where  PEKD_TRFGRP.InstanceID = ainstanceid;
row_PEKD_TRFGRP  child_PEKD_TRFGRP%ROWTYPE;
begin
--open child_PEKD_TRFGRP;
for row_PEKD_TRFGRP in child_PEKD_TRFGRP loop
 PEKD_TRFGRP_DELETE (acursession,row_PEKD_TRFGRP.id,aInstanceID);
end loop;
--close child_PEKD_TRFGRP;
end;
declare cursor child_PEKD_DEPT is select PEKD_DEPT.PEKD_DEPTid ID from PEKD_DEPT where  PEKD_DEPT.InstanceID = ainstanceid;
row_PEKD_DEPT  child_PEKD_DEPT%ROWTYPE;
begin
--open child_PEKD_DEPT;
for row_PEKD_DEPT in child_PEKD_DEPT loop
 PEKD_DEPT_DELETE (acursession,row_PEKD_DEPT.id,aInstanceID);
end loop;
--close child_PEKD_DEPT;
end;
declare cursor child_PEKD_DIRECTION is select PEKD_DIRECTION.PEKD_DIRECTIONid ID from PEKD_DIRECTION where  PEKD_DIRECTION.InstanceID = ainstanceid;
row_PEKD_DIRECTION  child_PEKD_DIRECTION%ROWTYPE;
begin
--open child_PEKD_DIRECTION;
for row_PEKD_DIRECTION in child_PEKD_DIRECTION loop
 PEKD_DIRECTION_DELETE (acursession,row_PEKD_DIRECTION.id,aInstanceID);
end loop;
--close child_PEKD_DIRECTION;
end;
declare cursor child_PEKD_DOGTYPE is select PEKD_DOGTYPE.PEKD_DOGTYPEid ID from PEKD_DOGTYPE where  PEKD_DOGTYPE.InstanceID = ainstanceid;
row_PEKD_DOGTYPE  child_PEKD_DOGTYPE%ROWTYPE;
begin
--open child_PEKD_DOGTYPE;
for row_PEKD_DOGTYPE in child_PEKD_DOGTYPE loop
 PEKD_DOGTYPE_DELETE (acursession,row_PEKD_DOGTYPE.id,aInstanceID);
end loop;
--close child_PEKD_DOGTYPE;
end;
declare cursor child_PEKD_SRV is select PEKD_SRV.PEKD_SRVid ID from PEKD_SRV where  PEKD_SRV.InstanceID = ainstanceid;
row_PEKD_SRV  child_PEKD_SRV%ROWTYPE;
begin
--open child_PEKD_SRV;
for row_PEKD_SRV in child_PEKD_SRV loop
 PEKD_SRV_DELETE (acursession,row_PEKD_SRV.id,aInstanceID);
end loop;
--close child_PEKD_SRV;
end;
return;
<<del_error>>
return;
end if;
end;
procedure PEKD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'PEKD'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_PEKD_ADDS is select PEKD_ADDS.PEKD_ADDSid ID from PEKD_ADDS where  PEKD_ADDS.InstanceID = arowid;
ROW_PEKD_ADDS  lch_PEKD_ADDS%ROWTYPE;
begin
--open lch_PEKD_ADDS;
for row_PEKD_ADDS in lch_PEKD_ADDS loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_ADDS where PEKD_ADDSid=row_PEKD_ADDS.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_ADDS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_ADDS;
     return;
   end if; 
 end if; 
 PEKD_ADDS_HCL (acursession,ROW_PEKD_ADDS.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_ADDS;
   return;
 end if;
 end loop;
--close lch_PEKD_ADDS;
end;
declare cursor lch_PEKD_TRAINTYPE is select PEKD_TRAINTYPE.PEKD_TRAINTYPEid ID from PEKD_TRAINTYPE where  PEKD_TRAINTYPE.InstanceID = arowid;
ROW_PEKD_TRAINTYPE  lch_PEKD_TRAINTYPE%ROWTYPE;
begin
--open lch_PEKD_TRAINTYPE;
for row_PEKD_TRAINTYPE in lch_PEKD_TRAINTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_TRAINTYPE where PEKD_TRAINTYPEid=row_PEKD_TRAINTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_TRAINTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_TRAINTYPE;
     return;
   end if; 
 end if; 
 PEKD_TRAINTYPE_HCL (acursession,ROW_PEKD_TRAINTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_TRAINTYPE;
   return;
 end if;
 end loop;
--close lch_PEKD_TRAINTYPE;
end;
declare cursor lch_PEKD_GOTYPE is select PEKD_GOTYPE.PEKD_GOTYPEid ID from PEKD_GOTYPE where  PEKD_GOTYPE.InstanceID = arowid;
ROW_PEKD_GOTYPE  lch_PEKD_GOTYPE%ROWTYPE;
begin
--open lch_PEKD_GOTYPE;
for row_PEKD_GOTYPE in lch_PEKD_GOTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_GOTYPE where PEKD_GOTYPEid=row_PEKD_GOTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_GOTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_GOTYPE;
     return;
   end if; 
 end if; 
 PEKD_GOTYPE_HCL (acursession,ROW_PEKD_GOTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_GOTYPE;
   return;
 end if;
 end loop;
--close lch_PEKD_GOTYPE;
end;
declare cursor lch_PEKD_INFOSENDTYPE is select PEKD_INFOSENDTYPE.PEKD_INFOSENDTYPEid ID from PEKD_INFOSENDTYPE where  PEKD_INFOSENDTYPE.InstanceID = arowid;
ROW_PEKD_INFOSENDTYPE  lch_PEKD_INFOSENDTYPE%ROWTYPE;
begin
--open lch_PEKD_INFOSENDTYPE;
for row_PEKD_INFOSENDTYPE in lch_PEKD_INFOSENDTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEid=row_PEKD_INFOSENDTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_INFOSENDTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_INFOSENDTYPE;
     return;
   end if; 
 end if; 
 PEKD_INFOSENDTYPE_HCL (acursession,ROW_PEKD_INFOSENDTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_INFOSENDTYPE;
   return;
 end if;
 end loop;
--close lch_PEKD_INFOSENDTYPE;
end;
declare cursor lch_PEKD_ST is select PEKD_ST.PEKD_STid ID from PEKD_ST where  PEKD_ST.InstanceID = arowid;
ROW_PEKD_ST  lch_PEKD_ST%ROWTYPE;
begin
--open lch_PEKD_ST;
for row_PEKD_ST in lch_PEKD_ST loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_ST where PEKD_STid=row_PEKD_ST.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_ST;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_ST;
     return;
   end if; 
 end if; 
 PEKD_ST_HCL (acursession,ROW_PEKD_ST.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_ST;
   return;
 end if;
 end loop;
--close lch_PEKD_ST;
end;
declare cursor lch_PEKD_TRTYPE is select PEKD_TRTYPE.PEKD_TRTYPEid ID from PEKD_TRTYPE where  PEKD_TRTYPE.InstanceID = arowid;
ROW_PEKD_TRTYPE  lch_PEKD_TRTYPE%ROWTYPE;
begin
--open lch_PEKD_TRTYPE;
for row_PEKD_TRTYPE in lch_PEKD_TRTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_TRTYPE where PEKD_TRTYPEid=row_PEKD_TRTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_TRTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_TRTYPE;
     return;
   end if; 
 end if; 
 PEKD_TRTYPE_HCL (acursession,ROW_PEKD_TRTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_TRTYPE;
   return;
 end if;
 end loop;
--close lch_PEKD_TRTYPE;
end;
declare cursor lch_PEKD_POSTTYPE is select PEKD_POSTTYPE.PEKD_POSTTYPEid ID from PEKD_POSTTYPE where  PEKD_POSTTYPE.InstanceID = arowid;
ROW_PEKD_POSTTYPE  lch_PEKD_POSTTYPE%ROWTYPE;
begin
--open lch_PEKD_POSTTYPE;
for row_PEKD_POSTTYPE in lch_PEKD_POSTTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_POSTTYPE where PEKD_POSTTYPEid=row_PEKD_POSTTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_POSTTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_POSTTYPE;
     return;
   end if; 
 end if; 
 PEKD_POSTTYPE_HCL (acursession,ROW_PEKD_POSTTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_POSTTYPE;
   return;
 end if;
 end loop;
--close lch_PEKD_POSTTYPE;
end;
declare cursor lch_PEKD_TRFGRP is select PEKD_TRFGRP.PEKD_TRFGRPid ID from PEKD_TRFGRP where  PEKD_TRFGRP.InstanceID = arowid;
ROW_PEKD_TRFGRP  lch_PEKD_TRFGRP%ROWTYPE;
begin
--open lch_PEKD_TRFGRP;
for row_PEKD_TRFGRP in lch_PEKD_TRFGRP loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_TRFGRP where PEKD_TRFGRPid=row_PEKD_TRFGRP.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_TRFGRP;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_TRFGRP;
     return;
   end if; 
 end if; 
 PEKD_TRFGRP_HCL (acursession,ROW_PEKD_TRFGRP.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_TRFGRP;
   return;
 end if;
 end loop;
--close lch_PEKD_TRFGRP;
end;
declare cursor lch_PEKD_DEPT is select PEKD_DEPT.PEKD_DEPTid ID from PEKD_DEPT where  PEKD_DEPT.InstanceID = arowid;
ROW_PEKD_DEPT  lch_PEKD_DEPT%ROWTYPE;
begin
--open lch_PEKD_DEPT;
for row_PEKD_DEPT in lch_PEKD_DEPT loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_DEPT where PEKD_DEPTid=row_PEKD_DEPT.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_DEPT;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_DEPT;
     return;
   end if; 
 end if; 
 PEKD_DEPT_HCL (acursession,ROW_PEKD_DEPT.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_DEPT;
   return;
 end if;
 end loop;
--close lch_PEKD_DEPT;
end;
declare cursor lch_PEKD_DIRECTION is select PEKD_DIRECTION.PEKD_DIRECTIONid ID from PEKD_DIRECTION where  PEKD_DIRECTION.InstanceID = arowid;
ROW_PEKD_DIRECTION  lch_PEKD_DIRECTION%ROWTYPE;
begin
--open lch_PEKD_DIRECTION;
for row_PEKD_DIRECTION in lch_PEKD_DIRECTION loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_DIRECTION where PEKD_DIRECTIONid=row_PEKD_DIRECTION.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_DIRECTION;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_DIRECTION;
     return;
   end if; 
 end if; 
 PEKD_DIRECTION_HCL (acursession,ROW_PEKD_DIRECTION.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_DIRECTION;
   return;
 end if;
 end loop;
--close lch_PEKD_DIRECTION;
end;
declare cursor lch_PEKD_DOGTYPE is select PEKD_DOGTYPE.PEKD_DOGTYPEid ID from PEKD_DOGTYPE where  PEKD_DOGTYPE.InstanceID = arowid;
ROW_PEKD_DOGTYPE  lch_PEKD_DOGTYPE%ROWTYPE;
begin
--open lch_PEKD_DOGTYPE;
for row_PEKD_DOGTYPE in lch_PEKD_DOGTYPE loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_DOGTYPE where PEKD_DOGTYPEid=row_PEKD_DOGTYPE.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_DOGTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_DOGTYPE;
     return;
   end if; 
 end if; 
 PEKD_DOGTYPE_HCL (acursession,ROW_PEKD_DOGTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_DOGTYPE;
   return;
 end if;
 end loop;
--close lch_PEKD_DOGTYPE;
end;
declare cursor lch_PEKD_SRV is select PEKD_SRV.PEKD_SRVid ID from PEKD_SRV where  PEKD_SRV.InstanceID = arowid;
ROW_PEKD_SRV  lch_PEKD_SRV%ROWTYPE;
begin
--open lch_PEKD_SRV;
for row_PEKD_SRV in lch_PEKD_SRV loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from PEKD_SRV where PEKD_SRVid=row_PEKD_SRV.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_SRV;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_PEKD_SRV;
     return;
   end if; 
 end if; 
 PEKD_SRV_HCL (acursession,ROW_PEKD_SRV.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_SRV;
   return;
 end if;
 end loop;
--close lch_PEKD_SRV;
end;
 end if;
aIsLocked:=0;
end;
procedure PEKD_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'PEKD'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_PEKD_ADDS is select PEKD_ADDS.PEKD_ADDSid id from PEKD_ADDS where  PEKD_ADDS.InstanceID = arowid;
row_PEKD_ADDS  pch_PEKD_ADDS%ROWTYPE;
begin
--open pch_PEKD_ADDS;
for row_PEKD_ADDS in  pch_PEKD_ADDS loop
 PEKD_ADDS_SINIT( acursession,row_PEKD_ADDS.id,assid);
 PEKD_ADDS_propagate( acursession,row_PEKD_ADDS.id);
end loop;
--close pch_PEKD_ADDS;
end;
declare cursor pch_PEKD_TRAINTYPE is select PEKD_TRAINTYPE.PEKD_TRAINTYPEid id from PEKD_TRAINTYPE where  PEKD_TRAINTYPE.InstanceID = arowid;
row_PEKD_TRAINTYPE  pch_PEKD_TRAINTYPE%ROWTYPE;
begin
--open pch_PEKD_TRAINTYPE;
for row_PEKD_TRAINTYPE in  pch_PEKD_TRAINTYPE loop
 PEKD_TRAINTYPE_SINIT( acursession,row_PEKD_TRAINTYPE.id,assid);
 PEKD_TRAINTYPE_propagate( acursession,row_PEKD_TRAINTYPE.id);
end loop;
--close pch_PEKD_TRAINTYPE;
end;
declare cursor pch_PEKD_GOTYPE is select PEKD_GOTYPE.PEKD_GOTYPEid id from PEKD_GOTYPE where  PEKD_GOTYPE.InstanceID = arowid;
row_PEKD_GOTYPE  pch_PEKD_GOTYPE%ROWTYPE;
begin
--open pch_PEKD_GOTYPE;
for row_PEKD_GOTYPE in  pch_PEKD_GOTYPE loop
 PEKD_GOTYPE_SINIT( acursession,row_PEKD_GOTYPE.id,assid);
 PEKD_GOTYPE_propagate( acursession,row_PEKD_GOTYPE.id);
end loop;
--close pch_PEKD_GOTYPE;
end;
declare cursor pch_PEKD_INFOSENDTYPE is select PEKD_INFOSENDTYPE.PEKD_INFOSENDTYPEid id from PEKD_INFOSENDTYPE where  PEKD_INFOSENDTYPE.InstanceID = arowid;
row_PEKD_INFOSENDTYPE  pch_PEKD_INFOSENDTYPE%ROWTYPE;
begin
--open pch_PEKD_INFOSENDTYPE;
for row_PEKD_INFOSENDTYPE in  pch_PEKD_INFOSENDTYPE loop
 PEKD_INFOSENDTYPE_SINIT( acursession,row_PEKD_INFOSENDTYPE.id,assid);
 PEKD_INFOSENDTYPE_propagate( acursession,row_PEKD_INFOSENDTYPE.id);
end loop;
--close pch_PEKD_INFOSENDTYPE;
end;
declare cursor pch_PEKD_ST is select PEKD_ST.PEKD_STid id from PEKD_ST where  PEKD_ST.InstanceID = arowid;
row_PEKD_ST  pch_PEKD_ST%ROWTYPE;
begin
--open pch_PEKD_ST;
for row_PEKD_ST in  pch_PEKD_ST loop
 PEKD_ST_SINIT( acursession,row_PEKD_ST.id,assid);
 PEKD_ST_propagate( acursession,row_PEKD_ST.id);
end loop;
--close pch_PEKD_ST;
end;
declare cursor pch_PEKD_TRTYPE is select PEKD_TRTYPE.PEKD_TRTYPEid id from PEKD_TRTYPE where  PEKD_TRTYPE.InstanceID = arowid;
row_PEKD_TRTYPE  pch_PEKD_TRTYPE%ROWTYPE;
begin
--open pch_PEKD_TRTYPE;
for row_PEKD_TRTYPE in  pch_PEKD_TRTYPE loop
 PEKD_TRTYPE_SINIT( acursession,row_PEKD_TRTYPE.id,assid);
 PEKD_TRTYPE_propagate( acursession,row_PEKD_TRTYPE.id);
end loop;
--close pch_PEKD_TRTYPE;
end;
declare cursor pch_PEKD_POSTTYPE is select PEKD_POSTTYPE.PEKD_POSTTYPEid id from PEKD_POSTTYPE where  PEKD_POSTTYPE.InstanceID = arowid;
row_PEKD_POSTTYPE  pch_PEKD_POSTTYPE%ROWTYPE;
begin
--open pch_PEKD_POSTTYPE;
for row_PEKD_POSTTYPE in  pch_PEKD_POSTTYPE loop
 PEKD_POSTTYPE_SINIT( acursession,row_PEKD_POSTTYPE.id,assid);
 PEKD_POSTTYPE_propagate( acursession,row_PEKD_POSTTYPE.id);
end loop;
--close pch_PEKD_POSTTYPE;
end;
declare cursor pch_PEKD_TRFGRP is select PEKD_TRFGRP.PEKD_TRFGRPid id from PEKD_TRFGRP where  PEKD_TRFGRP.InstanceID = arowid;
row_PEKD_TRFGRP  pch_PEKD_TRFGRP%ROWTYPE;
begin
--open pch_PEKD_TRFGRP;
for row_PEKD_TRFGRP in  pch_PEKD_TRFGRP loop
 PEKD_TRFGRP_SINIT( acursession,row_PEKD_TRFGRP.id,assid);
 PEKD_TRFGRP_propagate( acursession,row_PEKD_TRFGRP.id);
end loop;
--close pch_PEKD_TRFGRP;
end;
declare cursor pch_PEKD_DEPT is select PEKD_DEPT.PEKD_DEPTid id from PEKD_DEPT where  PEKD_DEPT.InstanceID = arowid;
row_PEKD_DEPT  pch_PEKD_DEPT%ROWTYPE;
begin
--open pch_PEKD_DEPT;
for row_PEKD_DEPT in  pch_PEKD_DEPT loop
 PEKD_DEPT_SINIT( acursession,row_PEKD_DEPT.id,assid);
 PEKD_DEPT_propagate( acursession,row_PEKD_DEPT.id);
end loop;
--close pch_PEKD_DEPT;
end;
declare cursor pch_PEKD_DIRECTION is select PEKD_DIRECTION.PEKD_DIRECTIONid id from PEKD_DIRECTION where  PEKD_DIRECTION.InstanceID = arowid;
row_PEKD_DIRECTION  pch_PEKD_DIRECTION%ROWTYPE;
begin
--open pch_PEKD_DIRECTION;
for row_PEKD_DIRECTION in  pch_PEKD_DIRECTION loop
 PEKD_DIRECTION_SINIT( acursession,row_PEKD_DIRECTION.id,assid);
 PEKD_DIRECTION_propagate( acursession,row_PEKD_DIRECTION.id);
end loop;
--close pch_PEKD_DIRECTION;
end;
declare cursor pch_PEKD_DOGTYPE is select PEKD_DOGTYPE.PEKD_DOGTYPEid id from PEKD_DOGTYPE where  PEKD_DOGTYPE.InstanceID = arowid;
row_PEKD_DOGTYPE  pch_PEKD_DOGTYPE%ROWTYPE;
begin
--open pch_PEKD_DOGTYPE;
for row_PEKD_DOGTYPE in  pch_PEKD_DOGTYPE loop
 PEKD_DOGTYPE_SINIT( acursession,row_PEKD_DOGTYPE.id,assid);
 PEKD_DOGTYPE_propagate( acursession,row_PEKD_DOGTYPE.id);
end loop;
--close pch_PEKD_DOGTYPE;
end;
declare cursor pch_PEKD_SRV is select PEKD_SRV.PEKD_SRVid id from PEKD_SRV where  PEKD_SRV.InstanceID = arowid;
row_PEKD_SRV  pch_PEKD_SRV%ROWTYPE;
begin
--open pch_PEKD_SRV;
for row_PEKD_SRV in  pch_PEKD_SRV loop
 PEKD_SRV_SINIT( acursession,row_PEKD_SRV.id,assid);
 PEKD_SRV_propagate( acursession,row_PEKD_SRV.id);
end loop;
--close pch_PEKD_SRV;
end;
 end if; 
end;



procedure PEKD_ADDS_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_ADDSid CHAR,
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
if aPEKD_ADDSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_ADDS where PEKD_ADDSID=aPEKD_ADDSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_ADDS where PEKD_ADDSid=aPEKD_ADDSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_ADDS');
    return;
  end if;
  aBRIEF:=func.PEKD_ADDS_BRIEF_F(aPEKD_ADDSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_ADDS_DELETE /*Варианты надбавок*/ (
 aCURSESSION CHAR,
 aPEKD_ADDSid CHAR,
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
select count(*) into existsCnt from PEKD_ADDS where PEKD_ADDSID=aPEKD_ADDSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_ADDS where PEKD_ADDSid=aPEKD_ADDSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_ADDS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_ADDS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_ADDS_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_ADDSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_ADDS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_ADDS',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_ADDSid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_ADDS is select  instanceid ID from instance where OwnerPartName ='PEKD_ADDS' and OwnerRowID=aPEKD_ADDSid;
row_PEKD_ADDS  chld_PEKD_ADDS%ROWTYPE;
begin
--open chld_PEKD_ADDS;
for row_PEKD_ADDS in chld_PEKD_ADDS loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_ADDS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_ADDS.id);
end loop;
--close chld_PEKD_ADDS;
end ;
  delete from  PEKD_ADDS 
  where  PEKD_ADDSID = aPEKD_ADDSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Надбавки*/
procedure PEKD_ADDS_SAVE /*Варианты надбавок*/ (
 aCURSESSION CHAR,
 aPEKD_ADDSid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aCalcType
 NUMBER := null /* Тип расчета *//* Тип расчета */
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
select count(*) into existsCnt from PEKD_ADDS where PEKD_ADDSID=aPEKD_ADDSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_ADDS where PEKD_ADDSid=aPEKD_ADDSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_ADDS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_ADDS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_ADDS_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_ADDSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_ADDS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_ADDS',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_ADDSid,aLogInstanceID=>aInstanceID);
 update  PEKD_ADDS set ChangeStamp=sysdate
,
  Name=aName
,
  CalcType=aCalcType
  where  PEKD_ADDSID = aPEKD_ADDSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_ADDS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_ADDS');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_ADDS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_ADDS',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_ADDSid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_ADDS
 (  PEKD_ADDSID 
,InstanceID
,Name

,CalcType

 ) values ( aPEKD_ADDSID 
,aInstanceID
,aName

,aCalcType

 ); 
 PEKD_ADDS_SINIT( aCURSESSION,aPEKD_ADDSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_ADDS_PARENT /*Варианты надбавок*/ (
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
  select  INSTANCEID into aParentID from PEKD_ADDS where  PEKD_ADDSid=aRowID;
 end; 


procedure PEKD_ADDS_ISLOCKED /*Варианты надбавок*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_ADDS where PEKD_ADDSid=aRowID;
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
  PEKD_ADDS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_ADDS_LOCK /*Варианты надбавок*/ (
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
 PEKD_ADDS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_ADDS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_ADDS where PEKD_ADDSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_ADDS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_ADDS set LockUserID =auserID ,LockSessionID =null where PEKD_ADDSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_ADDS set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_ADDSid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_ADDS_HCL /*Варианты надбавок*/ (
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


procedure PEKD_ADDS_UNLOCK /*Варианты надбавок*/ (
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
 PEKD_ADDS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_ADDS set LockUserID =null  where PEKD_ADDSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_ADDS set LockSessionID =null  where PEKD_ADDSid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_ADDS_SINIT /*Варианты надбавок*/ (
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
 select  SecurityStyleID into atmpID from PEKD_ADDS where PEKD_ADDSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_ADDS');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_ADDS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_ADDS set securitystyleid =aStyleID where PEKD_ADDSid = aRowID;
else 
 update PEKD_ADDS set securitystyleid =aSecurityStyleID where PEKD_ADDSid = aRowID;
end if; 
end ; 


procedure PEKD_ADDS_propagate /*Варианты надбавок*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_ADDS where PEKD_ADDSid=aRowid;
end;



procedure PEKD_TRAINTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_TRAINTYPEid CHAR,
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
if aPEKD_TRAINTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_TRAINTYPE where PEKD_TRAINTYPEID=aPEKD_TRAINTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_TRAINTYPE where PEKD_TRAINTYPEid=aPEKD_TRAINTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_TRAINTYPE');
    return;
  end if;
  aBRIEF:=func.PEKD_TRAINTYPE_BRIEF_F(aPEKD_TRAINTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_TRAINTYPE_DELETE /*Тип поезда*/ (
 aCURSESSION CHAR,
 aPEKD_TRAINTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_TRAINTYPE where PEKD_TRAINTYPEID=aPEKD_TRAINTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_TRAINTYPE where PEKD_TRAINTYPEid=aPEKD_TRAINTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_TRAINTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_TRAINTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_TRAINTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_TRAINTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_TRAINTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRAINTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_TRAINTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_TRAINTYPE is select  instanceid ID from instance where OwnerPartName ='PEKD_TRAINTYPE' and OwnerRowID=aPEKD_TRAINTYPEid;
row_PEKD_TRAINTYPE  chld_PEKD_TRAINTYPE%ROWTYPE;
begin
--open chld_PEKD_TRAINTYPE;
for row_PEKD_TRAINTYPE in chld_PEKD_TRAINTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_TRAINTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_TRAINTYPE.id);
end loop;
--close chld_PEKD_TRAINTYPE;
end ;
  delete from  PEKD_TRAINTYPE 
  where  PEKD_TRAINTYPEID = aPEKD_TRAINTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип поезда*/
procedure PEKD_TRAINTYPE_SAVE /*Тип поезда*/ (
 aCURSESSION CHAR,
 aPEKD_TRAINTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_TRAINTYPE where PEKD_TRAINTYPEID=aPEKD_TRAINTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_TRAINTYPE where PEKD_TRAINTYPEid=aPEKD_TRAINTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_TRAINTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_TRAINTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_TRAINTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_TRAINTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_TRAINTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRAINTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_TRAINTYPEid,aLogInstanceID=>aInstanceID);
 update  PEKD_TRAINTYPE set ChangeStamp=sysdate
,
  name=aname
  where  PEKD_TRAINTYPEID = aPEKD_TRAINTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_TRAINTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_TRAINTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_TRAINTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRAINTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_TRAINTYPEid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_TRAINTYPE
 (  PEKD_TRAINTYPEID 
,InstanceID
,name

 ) values ( aPEKD_TRAINTYPEID 
,aInstanceID
,aname

 ); 
 PEKD_TRAINTYPE_SINIT( aCURSESSION,aPEKD_TRAINTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_TRAINTYPE_PARENT /*Тип поезда*/ (
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
  select  INSTANCEID into aParentID from PEKD_TRAINTYPE where  PEKD_TRAINTYPEid=aRowID;
 end; 


procedure PEKD_TRAINTYPE_ISLOCKED /*Тип поезда*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_TRAINTYPE where PEKD_TRAINTYPEid=aRowID;
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
  PEKD_TRAINTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_TRAINTYPE_LOCK /*Тип поезда*/ (
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
 PEKD_TRAINTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_TRAINTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_TRAINTYPE where PEKD_TRAINTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_TRAINTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_TRAINTYPE set LockUserID =auserID ,LockSessionID =null where PEKD_TRAINTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_TRAINTYPE set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_TRAINTYPEid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_TRAINTYPE_HCL /*Тип поезда*/ (
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


procedure PEKD_TRAINTYPE_UNLOCK /*Тип поезда*/ (
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
 PEKD_TRAINTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_TRAINTYPE set LockUserID =null  where PEKD_TRAINTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_TRAINTYPE set LockSessionID =null  where PEKD_TRAINTYPEid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_TRAINTYPE_SINIT /*Тип поезда*/ (
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
 select  SecurityStyleID into atmpID from PEKD_TRAINTYPE where PEKD_TRAINTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_TRAINTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_TRAINTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_TRAINTYPE set securitystyleid =aStyleID where PEKD_TRAINTYPEid = aRowID;
else 
 update PEKD_TRAINTYPE set securitystyleid =aSecurityStyleID where PEKD_TRAINTYPEid = aRowID;
end if; 
end ; 


procedure PEKD_TRAINTYPE_propagate /*Тип поезда*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_TRAINTYPE where PEKD_TRAINTYPEid=aRowid;
end;



procedure PEKD_GOTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_GOTYPEid CHAR,
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
if aPEKD_GOTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_GOTYPE where PEKD_GOTYPEID=aPEKD_GOTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_GOTYPE where PEKD_GOTYPEid=aPEKD_GOTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_GOTYPE');
    return;
  end if;
  aBRIEF:=func.PEKD_GOTYPE_BRIEF_F(aPEKD_GOTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_GOTYPE_DELETE /*Типы СГО*/ (
 aCURSESSION CHAR,
 aPEKD_GOTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_GOTYPE where PEKD_GOTYPEID=aPEKD_GOTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_GOTYPE where PEKD_GOTYPEid=aPEKD_GOTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_GOTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_GOTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_GOTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_GOTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_GOTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_GOTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_GOTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_GOTYPE is select  instanceid ID from instance where OwnerPartName ='PEKD_GOTYPE' and OwnerRowID=aPEKD_GOTYPEid;
row_PEKD_GOTYPE  chld_PEKD_GOTYPE%ROWTYPE;
begin
--open chld_PEKD_GOTYPE;
for row_PEKD_GOTYPE in chld_PEKD_GOTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_GOTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_GOTYPE.id);
end loop;
--close chld_PEKD_GOTYPE;
end ;
  delete from  PEKD_GOTYPE 
  where  PEKD_GOTYPEID = aPEKD_GOTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Типы СГО*/
procedure PEKD_GOTYPE_SAVE /*Типы СГО*/ (
 aCURSESSION CHAR,
 aPEKD_GOTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_GOTYPE where PEKD_GOTYPEID=aPEKD_GOTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_GOTYPE where PEKD_GOTYPEid=aPEKD_GOTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_GOTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_GOTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_GOTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_GOTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_GOTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_GOTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_GOTYPEid,aLogInstanceID=>aInstanceID);
 update  PEKD_GOTYPE set ChangeStamp=sysdate
,
  name=aname
  where  PEKD_GOTYPEID = aPEKD_GOTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_GOTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_GOTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_GOTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_GOTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_GOTYPEid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_GOTYPE
 (  PEKD_GOTYPEID 
,InstanceID
,name

 ) values ( aPEKD_GOTYPEID 
,aInstanceID
,aname

 ); 
 PEKD_GOTYPE_SINIT( aCURSESSION,aPEKD_GOTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_GOTYPE_PARENT /*Типы СГО*/ (
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
  select  INSTANCEID into aParentID from PEKD_GOTYPE where  PEKD_GOTYPEid=aRowID;
 end; 


procedure PEKD_GOTYPE_ISLOCKED /*Типы СГО*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_GOTYPE where PEKD_GOTYPEid=aRowID;
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
  PEKD_GOTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_GOTYPE_LOCK /*Типы СГО*/ (
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
 PEKD_GOTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_GOTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_GOTYPE where PEKD_GOTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_GOTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_GOTYPE set LockUserID =auserID ,LockSessionID =null where PEKD_GOTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_GOTYPE set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_GOTYPEid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_GOTYPE_HCL /*Типы СГО*/ (
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


procedure PEKD_GOTYPE_UNLOCK /*Типы СГО*/ (
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
 PEKD_GOTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_GOTYPE set LockUserID =null  where PEKD_GOTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_GOTYPE set LockSessionID =null  where PEKD_GOTYPEid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_GOTYPE_SINIT /*Типы СГО*/ (
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
 select  SecurityStyleID into atmpID from PEKD_GOTYPE where PEKD_GOTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_GOTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_GOTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_GOTYPE set securitystyleid =aStyleID where PEKD_GOTYPEid = aRowID;
else 
 update PEKD_GOTYPE set securitystyleid =aSecurityStyleID where PEKD_GOTYPEid = aRowID;
end if; 
end ; 


procedure PEKD_GOTYPE_propagate /*Типы СГО*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_GOTYPE where PEKD_GOTYPEid=aRowid;
end;



procedure PEKD_INFOSENDTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_INFOSENDTYPEid CHAR,
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
if aPEKD_INFOSENDTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEID=aPEKD_INFOSENDTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEid=aPEKD_INFOSENDTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_INFOSENDTYPE');
    return;
  end if;
  aBRIEF:=func.PEKD_INFOSENDTYPE_BRIEF_F(aPEKD_INFOSENDTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_INFOSENDTYPE_DELETE /*Способ передачи информации */ (
 aCURSESSION CHAR,
 aPEKD_INFOSENDTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEID=aPEKD_INFOSENDTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEid=aPEKD_INFOSENDTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_INFOSENDTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_INFOSENDTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_INFOSENDTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_INFOSENDTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_INFOSENDTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_INFOSENDTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_INFOSENDTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_INFOSENDTYPE is select  instanceid ID from instance where OwnerPartName ='PEKD_INFOSENDTYPE' and OwnerRowID=aPEKD_INFOSENDTYPEid;
row_PEKD_INFOSENDTYPE  chld_PEKD_INFOSENDTYPE%ROWTYPE;
begin
--open chld_PEKD_INFOSENDTYPE;
for row_PEKD_INFOSENDTYPE in chld_PEKD_INFOSENDTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_INFOSENDTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_INFOSENDTYPE.id);
end loop;
--close chld_PEKD_INFOSENDTYPE;
end ;
  delete from  PEKD_INFOSENDTYPE 
  where  PEKD_INFOSENDTYPEID = aPEKD_INFOSENDTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Способ передачи информации*/
procedure PEKD_INFOSENDTYPE_SAVE /*Способ передачи информации */ (
 aCURSESSION CHAR,
 aPEKD_INFOSENDTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEID=aPEKD_INFOSENDTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEid=aPEKD_INFOSENDTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_INFOSENDTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_INFOSENDTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_INFOSENDTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_INFOSENDTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_INFOSENDTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_INFOSENDTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_INFOSENDTYPEid,aLogInstanceID=>aInstanceID);
 update  PEKD_INFOSENDTYPE set ChangeStamp=sysdate
,
  Name=aName
  where  PEKD_INFOSENDTYPEID = aPEKD_INFOSENDTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_INFOSENDTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_INFOSENDTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_INFOSENDTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_INFOSENDTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_INFOSENDTYPEid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_INFOSENDTYPE
 (  PEKD_INFOSENDTYPEID 
,InstanceID
,Name

 ) values ( aPEKD_INFOSENDTYPEID 
,aInstanceID
,aName

 ); 
 PEKD_INFOSENDTYPE_SINIT( aCURSESSION,aPEKD_INFOSENDTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_INFOSENDTYPE_PARENT /*Способ передачи информации */ (
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
  select  INSTANCEID into aParentID from PEKD_INFOSENDTYPE where  PEKD_INFOSENDTYPEid=aRowID;
 end; 


procedure PEKD_INFOSENDTYPE_ISLOCKED /*Способ передачи информации */ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEid=aRowID;
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
  PEKD_INFOSENDTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_INFOSENDTYPE_LOCK /*Способ передачи информации */ (
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
 PEKD_INFOSENDTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_INFOSENDTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_INFOSENDTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_INFOSENDTYPE set LockUserID =auserID ,LockSessionID =null where PEKD_INFOSENDTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_INFOSENDTYPE set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_INFOSENDTYPEid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_INFOSENDTYPE_HCL /*Способ передачи информации */ (
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


procedure PEKD_INFOSENDTYPE_UNLOCK /*Способ передачи информации */ (
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
 PEKD_INFOSENDTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_INFOSENDTYPE set LockUserID =null  where PEKD_INFOSENDTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_INFOSENDTYPE set LockSessionID =null  where PEKD_INFOSENDTYPEid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_INFOSENDTYPE_SINIT /*Способ передачи информации */ (
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
 select  SecurityStyleID into atmpID from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_INFOSENDTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_INFOSENDTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_INFOSENDTYPE set securitystyleid =aStyleID where PEKD_INFOSENDTYPEid = aRowID;
else 
 update PEKD_INFOSENDTYPE set securitystyleid =aSecurityStyleID where PEKD_INFOSENDTYPEid = aRowID;
end if; 
end ; 


procedure PEKD_INFOSENDTYPE_propagate /*Способ передачи информации */ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEid=aRowid;
end;



procedure PEKD_ST_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_STid CHAR,
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
if aPEKD_STid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_ST where PEKD_STID=aPEKD_STID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_ST where PEKD_STid=aPEKD_STID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_ST');
    return;
  end if;
  aBRIEF:=func.PEKD_ST_BRIEF_F(aPEKD_STid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_ST_DELETE /*Статьи затрат*/ (
 aCURSESSION CHAR,
 aPEKD_STid CHAR,
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
select count(*) into existsCnt from PEKD_ST where PEKD_STID=aPEKD_STID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_ST where PEKD_STid=aPEKD_STID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_ST',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_ST');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_ST_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_STid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_ST');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_ST',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_STid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_ST is select  instanceid ID from instance where OwnerPartName ='PEKD_ST' and OwnerRowID=aPEKD_STid;
row_PEKD_ST  chld_PEKD_ST%ROWTYPE;
begin
--open chld_PEKD_ST;
for row_PEKD_ST in chld_PEKD_ST loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_ST.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_ST.id);
end loop;
--close chld_PEKD_ST;
end ;
  delete from  PEKD_ST 
  where  PEKD_STID = aPEKD_STID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Статьи затрат*/
procedure PEKD_ST_SAVE /*Статьи затрат*/ (
 aCURSESSION CHAR,
 aPEKD_STid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aCode1C
 VARCHAR2 := null /* Кoд 1С *//* Кoд 1С */
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
select count(*) into existsCnt from PEKD_ST where PEKD_STID=aPEKD_STID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_ST where PEKD_STid=aPEKD_STID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_ST',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_ST');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_ST_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_STid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_ST');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_ST',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_STid,aLogInstanceID=>aInstanceID);
 update  PEKD_ST set ChangeStamp=sysdate
,
  Name=aName
,
  Code1C=aCode1C
  where  PEKD_STID = aPEKD_STID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_ST',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_ST');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_ST');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_ST',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_STid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_ST
 (  PEKD_STID 
,InstanceID
,Name

,Code1C

 ) values ( aPEKD_STID 
,aInstanceID
,aName

,aCode1C

 ); 
 PEKD_ST_SINIT( aCURSESSION,aPEKD_STid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_ST_PARENT /*Статьи затрат*/ (
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
  select  INSTANCEID into aParentID from PEKD_ST where  PEKD_STid=aRowID;
 end; 


procedure PEKD_ST_ISLOCKED /*Статьи затрат*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_ST where PEKD_STid=aRowID;
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
  PEKD_ST_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_ST_LOCK /*Статьи затрат*/ (
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
 PEKD_ST_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_ST_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_ST where PEKD_STid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_ST');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_ST set LockUserID =auserID ,LockSessionID =null where PEKD_STid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_ST set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_STid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_ST_HCL /*Статьи затрат*/ (
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


procedure PEKD_ST_UNLOCK /*Статьи затрат*/ (
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
 PEKD_ST_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_ST set LockUserID =null  where PEKD_STid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_ST set LockSessionID =null  where PEKD_STid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_ST_SINIT /*Статьи затрат*/ (
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
 select  SecurityStyleID into atmpID from PEKD_ST where PEKD_STid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_ST');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_ST_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_ST set securitystyleid =aStyleID where PEKD_STid = aRowID;
else 
 update PEKD_ST set securitystyleid =aSecurityStyleID where PEKD_STid = aRowID;
end if; 
end ; 


procedure PEKD_ST_propagate /*Статьи затрат*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_ST where PEKD_STid=aRowid;
end;



procedure PEKD_TRTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_TRTYPEid CHAR,
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
if aPEKD_TRTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_TRTYPE where PEKD_TRTYPEID=aPEKD_TRTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_TRTYPE where PEKD_TRTYPEid=aPEKD_TRTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_TRTYPE');
    return;
  end if;
  aBRIEF:=func.PEKD_TRTYPE_BRIEF_F(aPEKD_TRTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_TRTYPE_DELETE /*Система отправки*/ (
 aCURSESSION CHAR,
 aPEKD_TRTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_TRTYPE where PEKD_TRTYPEID=aPEKD_TRTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_TRTYPE where PEKD_TRTYPEid=aPEKD_TRTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_TRTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_TRTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_TRTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_TRTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_TRTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_TRTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_TRTYPE is select  instanceid ID from instance where OwnerPartName ='PEKD_TRTYPE' and OwnerRowID=aPEKD_TRTYPEid;
row_PEKD_TRTYPE  chld_PEKD_TRTYPE%ROWTYPE;
begin
--open chld_PEKD_TRTYPE;
for row_PEKD_TRTYPE in chld_PEKD_TRTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_TRTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_TRTYPE.id);
end loop;
--close chld_PEKD_TRTYPE;
end ;
  delete from  PEKD_TRTYPE 
  where  PEKD_TRTYPEID = aPEKD_TRTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Система отправки*/
procedure PEKD_TRTYPE_SAVE /*Система отправки*/ (
 aCURSESSION CHAR,
 aPEKD_TRTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_TRTYPE where PEKD_TRTYPEID=aPEKD_TRTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_TRTYPE where PEKD_TRTYPEid=aPEKD_TRTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_TRTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_TRTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_TRTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_TRTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_TRTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_TRTYPEid,aLogInstanceID=>aInstanceID);
 update  PEKD_TRTYPE set ChangeStamp=sysdate
,
  name=aname
  where  PEKD_TRTYPEID = aPEKD_TRTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_TRTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_TRTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_TRTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_TRTYPEid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_TRTYPE
 (  PEKD_TRTYPEID 
,InstanceID
,name

 ) values ( aPEKD_TRTYPEID 
,aInstanceID
,aname

 ); 
 PEKD_TRTYPE_SINIT( aCURSESSION,aPEKD_TRTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_TRTYPE_PARENT /*Система отправки*/ (
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
  select  INSTANCEID into aParentID from PEKD_TRTYPE where  PEKD_TRTYPEid=aRowID;
 end; 


procedure PEKD_TRTYPE_ISLOCKED /*Система отправки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_TRTYPE where PEKD_TRTYPEid=aRowID;
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
  PEKD_TRTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_TRTYPE_LOCK /*Система отправки*/ (
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
 PEKD_TRTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_TRTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_TRTYPE where PEKD_TRTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_TRTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_TRTYPE set LockUserID =auserID ,LockSessionID =null where PEKD_TRTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_TRTYPE set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_TRTYPEid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_TRTYPE_HCL /*Система отправки*/ (
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


procedure PEKD_TRTYPE_UNLOCK /*Система отправки*/ (
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
 PEKD_TRTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_TRTYPE set LockUserID =null  where PEKD_TRTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_TRTYPE set LockSessionID =null  where PEKD_TRTYPEid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_TRTYPE_SINIT /*Система отправки*/ (
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
 select  SecurityStyleID into atmpID from PEKD_TRTYPE where PEKD_TRTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_TRTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_TRTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_TRTYPE set securitystyleid =aStyleID where PEKD_TRTYPEid = aRowID;
else 
 update PEKD_TRTYPE set securitystyleid =aSecurityStyleID where PEKD_TRTYPEid = aRowID;
end if; 
end ; 


procedure PEKD_TRTYPE_propagate /*Система отправки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_TRTYPE where PEKD_TRTYPEid=aRowid;
end;



procedure PEKD_POSTTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_POSTTYPEid CHAR,
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
if aPEKD_POSTTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_POSTTYPE where PEKD_POSTTYPEID=aPEKD_POSTTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_POSTTYPE where PEKD_POSTTYPEid=aPEKD_POSTTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_POSTTYPE');
    return;
  end if;
  aBRIEF:=func.PEKD_POSTTYPE_BRIEF_F(aPEKD_POSTTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_POSTTYPE_DELETE /*Характер отправления*/ (
 aCURSESSION CHAR,
 aPEKD_POSTTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_POSTTYPE where PEKD_POSTTYPEID=aPEKD_POSTTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_POSTTYPE where PEKD_POSTTYPEid=aPEKD_POSTTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_POSTTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_POSTTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_POSTTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_POSTTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_POSTTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_POSTTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_POSTTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_POSTTYPE is select  instanceid ID from instance where OwnerPartName ='PEKD_POSTTYPE' and OwnerRowID=aPEKD_POSTTYPEid;
row_PEKD_POSTTYPE  chld_PEKD_POSTTYPE%ROWTYPE;
begin
--open chld_PEKD_POSTTYPE;
for row_PEKD_POSTTYPE in chld_PEKD_POSTTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_POSTTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_POSTTYPE.id);
end loop;
--close chld_PEKD_POSTTYPE;
end ;
  delete from  PEKD_POSTTYPE 
  where  PEKD_POSTTYPEID = aPEKD_POSTTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Характер отправления*/
procedure PEKD_POSTTYPE_SAVE /*Характер отправления*/ (
 aCURSESSION CHAR,
 aPEKD_POSTTYPEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2 := null /* Название *//* Название */
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
select count(*) into existsCnt from PEKD_POSTTYPE where PEKD_POSTTYPEID=aPEKD_POSTTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_POSTTYPE where PEKD_POSTTYPEid=aPEKD_POSTTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_POSTTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_POSTTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_POSTTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_POSTTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_POSTTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_POSTTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_POSTTYPEid,aLogInstanceID=>aInstanceID);
 update  PEKD_POSTTYPE set ChangeStamp=sysdate
,
  Name=aName
  where  PEKD_POSTTYPEID = aPEKD_POSTTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_POSTTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_POSTTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_POSTTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_POSTTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_POSTTYPEid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_POSTTYPE
 (  PEKD_POSTTYPEID 
,InstanceID
,Name

 ) values ( aPEKD_POSTTYPEID 
,aInstanceID
,aName

 ); 
 PEKD_POSTTYPE_SINIT( aCURSESSION,aPEKD_POSTTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_POSTTYPE_PARENT /*Характер отправления*/ (
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
  select  INSTANCEID into aParentID from PEKD_POSTTYPE where  PEKD_POSTTYPEid=aRowID;
 end; 


procedure PEKD_POSTTYPE_ISLOCKED /*Характер отправления*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_POSTTYPE where PEKD_POSTTYPEid=aRowID;
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
  PEKD_POSTTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_POSTTYPE_LOCK /*Характер отправления*/ (
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
 PEKD_POSTTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_POSTTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_POSTTYPE where PEKD_POSTTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_POSTTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_POSTTYPE set LockUserID =auserID ,LockSessionID =null where PEKD_POSTTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_POSTTYPE set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_POSTTYPEid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_POSTTYPE_HCL /*Характер отправления*/ (
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


procedure PEKD_POSTTYPE_UNLOCK /*Характер отправления*/ (
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
 PEKD_POSTTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_POSTTYPE set LockUserID =null  where PEKD_POSTTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_POSTTYPE set LockSessionID =null  where PEKD_POSTTYPEid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_POSTTYPE_SINIT /*Характер отправления*/ (
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
 select  SecurityStyleID into atmpID from PEKD_POSTTYPE where PEKD_POSTTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_POSTTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_POSTTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_POSTTYPE set securitystyleid =aStyleID where PEKD_POSTTYPEid = aRowID;
else 
 update PEKD_POSTTYPE set securitystyleid =aSecurityStyleID where PEKD_POSTTYPEid = aRowID;
end if; 
end ; 


procedure PEKD_POSTTYPE_propagate /*Характер отправления*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_POSTTYPE where PEKD_POSTTYPEid=aRowid;
end;



procedure PEKD_TRFGRP_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_TRFGRPid CHAR,
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
if aPEKD_TRFGRPid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_TRFGRP where PEKD_TRFGRPID=aPEKD_TRFGRPID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_TRFGRP where PEKD_TRFGRPid=aPEKD_TRFGRPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_TRFGRP');
    return;
  end if;
  aBRIEF:=func.PEKD_TRFGRP_BRIEF_F(aPEKD_TRFGRPid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_TRFGRP_DELETE /*Группы тарифов*/ (
 aCURSESSION CHAR,
 aPEKD_TRFGRPid CHAR,
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
select count(*) into existsCnt from PEKD_TRFGRP where PEKD_TRFGRPID=aPEKD_TRFGRPID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_TRFGRP where PEKD_TRFGRPid=aPEKD_TRFGRPID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_TRFGRP',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_TRFGRP');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_TRFGRP_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_TRFGRPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_TRFGRP');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PEKD_TRFTYPE is select PEKD_TRFTYPE.PEKD_TRFTYPEid ID from PEKD_TRFTYPE where  PEKD_TRFTYPE.ParentStructRowID = aPEKD_TRFGRPid;
    child_PEKD_TRFTYPE_rec  child_PEKD_TRFTYPE%ROWTYPE;
    begin
    --open child_PEKD_TRFTYPE;
      for child_PEKD_TRFTYPE_rec in child_PEKD_TRFTYPE loop
      PEKD_TRFTYPE_DELETE (acursession,child_PEKD_TRFTYPE_rec.id,aInstanceid);
      end loop;
      --close child_PEKD_TRFTYPE;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRFGRP',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_TRFGRPid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_TRFGRP is select  instanceid ID from instance where OwnerPartName ='PEKD_TRFGRP' and OwnerRowID=aPEKD_TRFGRPid;
row_PEKD_TRFGRP  chld_PEKD_TRFGRP%ROWTYPE;
begin
--open chld_PEKD_TRFGRP;
for row_PEKD_TRFGRP in chld_PEKD_TRFGRP loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_TRFGRP.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_TRFGRP.id);
end loop;
--close chld_PEKD_TRFGRP;
end ;
  delete from  PEKD_TRFGRP 
  where  PEKD_TRFGRPID = aPEKD_TRFGRPID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Группы тарифов*/
procedure PEKD_TRFGRP_SAVE /*Группы тарифов*/ (
 aCURSESSION CHAR,
 aPEKD_TRFGRPid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aname
 VARCHAR2/* Группа *//* Группа */
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
select count(*) into existsCnt from PEKD_TRFGRP where PEKD_TRFGRPID=aPEKD_TRFGRPID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_TRFGRP where PEKD_TRFGRPid=aPEKD_TRFGRPID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_TRFGRP',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_TRFGRP');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_TRFGRP_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_TRFGRPid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_TRFGRP');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRFGRP',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_TRFGRPid,aLogInstanceID=>aInstanceID);
 update  PEKD_TRFGRP set ChangeStamp=sysdate
,ParentRowid= aParentRowid
,
  name=aname
  where  PEKD_TRFGRPID = aPEKD_TRFGRPID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_TRFGRP',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_TRFGRP');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_TRFGRP');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRFGRP',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_TRFGRPid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_TRFGRP
 (  PEKD_TRFGRPID 
,ParentRowid
,InstanceID
,name

 ) values ( aPEKD_TRFGRPID 
,aParentRowid
,aInstanceID
,aname

 ); 
 PEKD_TRFGRP_SINIT( aCURSESSION,aPEKD_TRFGRPid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_TRFGRP_PARENT /*Группы тарифов*/ (
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
  select  INSTANCEID into aParentID from PEKD_TRFGRP where  PEKD_TRFGRPid=aRowID;
 end; 


procedure PEKD_TRFGRP_ISLOCKED /*Группы тарифов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_TRFGRP where PEKD_TRFGRPid=aRowID;
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
  PEKD_TRFGRP_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_TRFGRP_LOCK /*Группы тарифов*/ (
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
 PEKD_TRFGRP_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_TRFGRP_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_TRFGRP where PEKD_TRFGRPid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_TRFGRP');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_TRFGRP set LockUserID =auserID ,LockSessionID =null where PEKD_TRFGRPid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_TRFGRP set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_TRFGRPid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_TRFGRP_HCL /*Группы тарифов*/ (
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
declare cursor lch_PEKD_TRFTYPE is select PEKD_TRFTYPE.PEKD_TRFTYPEid ID from PEKD_TRFTYPE where  PEKD_TRFTYPE.ParentStructRowID = aRowid;
row_PEKD_TRFTYPE lch_PEKD_TRFTYPE%ROWTYPE;
begin  
--open lch_PEKD_TRFTYPE;
for row_PEKD_TRFTYPE in lch_PEKD_TRFTYPE
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKD_TRFTYPE where PEKD_TRFTYPEid=row_PEKD_TRFTYPE.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_TRFTYPE;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKD_TRFTYPE;
     return;
   end if; 
 end if;  
 PEKD_TRFTYPE_HCL (acursession,row_PEKD_TRFTYPE.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_TRFTYPE;
   return;
 end if;
end loop;
--close lch_PEKD_TRFTYPE;
end;
aIsLocked :=0;
end;


procedure PEKD_TRFGRP_UNLOCK /*Группы тарифов*/ (
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
 PEKD_TRFGRP_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_TRFGRP set LockUserID =null  where PEKD_TRFGRPid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_TRFGRP set LockSessionID =null  where PEKD_TRFGRPid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_TRFGRP_SINIT /*Группы тарифов*/ (
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
 select  SecurityStyleID into atmpID from PEKD_TRFGRP where PEKD_TRFGRPid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_TRFGRP');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_TRFGRP_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_TRFGRP set securitystyleid =aStyleID where PEKD_TRFGRPid = aRowID;
else 
 update PEKD_TRFGRP set securitystyleid =aSecurityStyleID where PEKD_TRFGRPid = aRowID;
end if; 
end ; 


procedure PEKD_TRFGRP_propagate /*Группы тарифов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_TRFGRP where PEKD_TRFGRPid=aRowid;
declare cursor pch_PEKD_TRFTYPE  is select PEKD_TRFTYPE.PEKD_TRFTYPEid ID from PEKD_TRFTYPE where  PEKD_TRFTYPE.ParentStructRowID = aRowid;
row_PEKD_TRFTYPE  pch_PEKD_TRFTYPE%ROWTYPE;
begin
--open pch_PEKD_TRFTYPE;
for row_PEKD_TRFTYPE in pch_PEKD_TRFTYPE loop
   PEKD_TRFTYPE_SINIT( acursession,row_PEKD_TRFTYPE.id,assid);
   PEKD_TRFTYPE_propagate( acursession,row_PEKD_TRFTYPE.id);
end loop;
--close pch_PEKD_TRFTYPE;
end;
end;



procedure PEKD_TRFTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_TRFTYPEid CHAR,
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
if aPEKD_TRFTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_TRFTYPE where PEKD_TRFTYPEID=aPEKD_TRFTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_TRFTYPE where PEKD_TRFTYPEid=aPEKD_TRFTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_TRFTYPE');
    return;
  end if;
  aBRIEF:=func.PEKD_TRFTYPE_BRIEF_F(aPEKD_TRFTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_TRFTYPE_DELETE /*Типы тарифов*/ (
 aCURSESSION CHAR,
 aPEKD_TRFTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_TRFTYPE where PEKD_TRFTYPEID=aPEKD_TRFTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_TRFTYPE where PEKD_TRFTYPEid=aPEKD_TRFTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_TRFTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_TRFTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_TRFTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_TRFTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_TRFTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRFTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_TRFTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_TRFTYPE is select  instanceid ID from instance where OwnerPartName ='PEKD_TRFTYPE' and OwnerRowID=aPEKD_TRFTYPEid;
row_PEKD_TRFTYPE  chld_PEKD_TRFTYPE%ROWTYPE;
begin
--open chld_PEKD_TRFTYPE;
for row_PEKD_TRFTYPE in chld_PEKD_TRFTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_TRFTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_TRFTYPE.id);
end loop;
--close chld_PEKD_TRFTYPE;
end ;
  delete from  PEKD_TRFTYPE 
  where  PEKD_TRFTYPEID = aPEKD_TRFTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Типы тарифов*/
procedure PEKD_TRFTYPE_SAVE /*Типы тарифов*/ (
 aCURSESSION CHAR,
 aPEKD_TRFTYPEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
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
select count(*) into existsCnt from PEKD_TRFTYPE where PEKD_TRFTYPEID=aPEKD_TRFTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_TRFTYPE where PEKD_TRFTYPEid=aPEKD_TRFTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_TRFTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_TRFTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_TRFTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_TRFTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_TRFTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRFTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_TRFTYPEid,aLogInstanceID=>aInstanceID);
 update  PEKD_TRFTYPE set ChangeStamp=sysdate
,
  name=aname
  where  PEKD_TRFTYPEID = aPEKD_TRFTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PEKD_TRFGRP where PEKD_TRFGRPid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_TRFTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_TRFTYPE');
      return;
    end if;
 end if;
 PEKD_TRFGRP_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_TRFTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRFTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_TRFTYPEid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_TRFTYPE
 (  PEKD_TRFTYPEID 
,ParentStructRowID
,name

 ) values ( aPEKD_TRFTYPEID 
,aParentStructRowID
,aname

 ); 
 PEKD_TRFTYPE_SINIT( aCURSESSION,aPEKD_TRFTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_TRFTYPE_PARENT /*Типы тарифов*/ (
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
  select ParentStructRowID into aParentID  from PEKD_TRFTYPE where  PEKD_TRFTYPEid=aRowID;
  aParentTable := 'PEKD_TRFGRP';
 end; 


procedure PEKD_TRFTYPE_ISLOCKED /*Типы тарифов*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_TRFTYPE where PEKD_TRFTYPEid=aRowID;
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
  PEKD_TRFTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_TRFTYPE_LOCK /*Типы тарифов*/ (
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
 PEKD_TRFTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_TRFTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_TRFTYPE where PEKD_TRFTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_TRFTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_TRFTYPE set LockUserID =auserID ,LockSessionID =null where PEKD_TRFTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_TRFTYPE set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_TRFTYPEid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_TRFTYPE_HCL /*Типы тарифов*/ (
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


procedure PEKD_TRFTYPE_UNLOCK /*Типы тарифов*/ (
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
 PEKD_TRFTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_TRFTYPE set LockUserID =null  where PEKD_TRFTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_TRFTYPE set LockSessionID =null  where PEKD_TRFTYPEid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_TRFTYPE_SINIT /*Типы тарифов*/ (
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
 select  SecurityStyleID into atmpID from PEKD_TRFTYPE where PEKD_TRFTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_TRFTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_TRFTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_TRFTYPE set securitystyleid =aStyleID where PEKD_TRFTYPEid = aRowID;
else 
 update PEKD_TRFTYPE set securitystyleid =aSecurityStyleID where PEKD_TRFTYPEid = aRowID;
end if; 
end ; 


procedure PEKD_TRFTYPE_propagate /*Типы тарифов*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_TRFTYPE where PEKD_TRFTYPEid=aRowid;
end;



procedure PEKD_DEPT_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DEPTid CHAR,
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
if aPEKD_DEPTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_DEPT where PEKD_DEPTID=aPEKD_DEPTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_DEPT where PEKD_DEPTid=aPEKD_DEPTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_DEPT');
    return;
  end if;
  aBRIEF:=func.PEKD_DEPT_BRIEF_F(aPEKD_DEPTid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_DEPT_DELETE /*Филиал*/ (
 aCURSESSION CHAR,
 aPEKD_DEPTid CHAR,
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
select count(*) into existsCnt from PEKD_DEPT where PEKD_DEPTID=aPEKD_DEPTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_DEPT where PEKD_DEPTid=aPEKD_DEPTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_DEPT',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_DEPT');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DEPT_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DEPTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_DEPT');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PEKD_DEPLIMITS is select PEKD_DEPLIMITS.PEKD_DEPLIMITSid ID from PEKD_DEPLIMITS where  PEKD_DEPLIMITS.ParentStructRowID = aPEKD_DEPTid;
    child_PEKD_DEPLIMITS_rec  child_PEKD_DEPLIMITS%ROWTYPE;
    begin
    --open child_PEKD_DEPLIMITS;
      for child_PEKD_DEPLIMITS_rec in child_PEKD_DEPLIMITS loop
      PEKD_DEPLIMITS_DELETE (acursession,child_PEKD_DEPLIMITS_rec.id,aInstanceid);
      end loop;
      --close child_PEKD_DEPLIMITS;
    end ;
    declare cursor child_PEKD_DEPDOG is select PEKD_DEPDOG.PEKD_DEPDOGid ID from PEKD_DEPDOG where  PEKD_DEPDOG.ParentStructRowID = aPEKD_DEPTid;
    child_PEKD_DEPDOG_rec  child_PEKD_DEPDOG%ROWTYPE;
    begin
    --open child_PEKD_DEPDOG;
      for child_PEKD_DEPDOG_rec in child_PEKD_DEPDOG loop
      PEKD_DEPDOG_DELETE (acursession,child_PEKD_DEPDOG_rec.id,aInstanceid);
      end loop;
      --close child_PEKD_DEPDOG;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DEPT',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_DEPTid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_DEPT is select  instanceid ID from instance where OwnerPartName ='PEKD_DEPT' and OwnerRowID=aPEKD_DEPTid;
row_PEKD_DEPT  chld_PEKD_DEPT%ROWTYPE;
begin
--open chld_PEKD_DEPT;
for row_PEKD_DEPT in chld_PEKD_DEPT loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_DEPT.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_DEPT.id);
end loop;
--close chld_PEKD_DEPT;
end ;
  delete from  PEKD_DEPT 
  where  PEKD_DEPTID = aPEKD_DEPTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Филиал*/
procedure PEKD_DEPT_SAVE /*Филиал*/ (
 aCURSESSION CHAR,
 aPEKD_DEPTid CHAR,
aInstanceID CHAR 
,aORG CHAR/* Организация *//* Организация */
,aname
 VARCHAR2/* Название *//* Название */
,aAddress VARCHAR2 := null /* Адрес *//* Адрес */
,aSupplier CHAR := null /* Основной поставщик *//* Основной поставщик */
,aDocPrefix
 VARCHAR2 := null /* Префикс номеров документов *//* Префикс номеров документов */
,aPGDPName
 VARCHAR2 := null /* Название ПЖДП *//* Название ПЖДП */
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
select count(*) into existsCnt from PEKD_DEPT where PEKD_DEPTID=aPEKD_DEPTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_DEPT where PEKD_DEPTid=aPEKD_DEPTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_DEPT',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_DEPT');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DEPT_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DEPTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DEPT');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DEPT',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_DEPTid,aLogInstanceID=>aInstanceID);
 update  PEKD_DEPT set ChangeStamp=sysdate
,
  ORG=aORG
,
  name=aname
,
  Address=aAddress
,
  Supplier=aSupplier
,
  DocPrefix=aDocPrefix
,
  PGDPName=aPGDPName
,
  Code1C=aCode1C
  where  PEKD_DEPTID = aPEKD_DEPTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_DEPT',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_DEPT');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DEPT');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DEPT',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_DEPTid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_DEPT
 (  PEKD_DEPTID 
,InstanceID
,ORG

,name

,Address

,Supplier

,DocPrefix

,PGDPName

,Code1C

 ) values ( aPEKD_DEPTID 
,aInstanceID
,aORG

,aname

,aAddress

,aSupplier

,aDocPrefix

,aPGDPName

,aCode1C

 ); 
 PEKD_DEPT_SINIT( aCURSESSION,aPEKD_DEPTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_DEPT_PARENT /*Филиал*/ (
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
  select  INSTANCEID into aParentID from PEKD_DEPT where  PEKD_DEPTid=aRowID;
 end; 


procedure PEKD_DEPT_ISLOCKED /*Филиал*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_DEPT where PEKD_DEPTid=aRowID;
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
  PEKD_DEPT_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_DEPT_LOCK /*Филиал*/ (
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
 PEKD_DEPT_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_DEPT_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_DEPT where PEKD_DEPTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_DEPT');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_DEPT set LockUserID =auserID ,LockSessionID =null where PEKD_DEPTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_DEPT set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_DEPTid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_DEPT_HCL /*Филиал*/ (
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
declare cursor lch_PEKD_DEPLIMITS is select PEKD_DEPLIMITS.PEKD_DEPLIMITSid ID from PEKD_DEPLIMITS where  PEKD_DEPLIMITS.ParentStructRowID = aRowid;
row_PEKD_DEPLIMITS lch_PEKD_DEPLIMITS%ROWTYPE;
begin  
--open lch_PEKD_DEPLIMITS;
for row_PEKD_DEPLIMITS in lch_PEKD_DEPLIMITS
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKD_DEPLIMITS where PEKD_DEPLIMITSid=row_PEKD_DEPLIMITS.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_DEPLIMITS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKD_DEPLIMITS;
     return;
   end if; 
 end if;  
 PEKD_DEPLIMITS_HCL (acursession,row_PEKD_DEPLIMITS.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_DEPLIMITS;
   return;
 end if;
end loop;
--close lch_PEKD_DEPLIMITS;
end;
declare cursor lch_PEKD_DEPDOG is select PEKD_DEPDOG.PEKD_DEPDOGid ID from PEKD_DEPDOG where  PEKD_DEPDOG.ParentStructRowID = aRowid;
row_PEKD_DEPDOG lch_PEKD_DEPDOG%ROWTYPE;
begin  
--open lch_PEKD_DEPDOG;
for row_PEKD_DEPDOG in lch_PEKD_DEPDOG
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKD_DEPDOG where PEKD_DEPDOGid=row_PEKD_DEPDOG.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_DEPDOG;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKD_DEPDOG;
     return;
   end if; 
 end if;  
 PEKD_DEPDOG_HCL (acursession,row_PEKD_DEPDOG.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_DEPDOG;
   return;
 end if;
end loop;
--close lch_PEKD_DEPDOG;
end;
aIsLocked :=0;
end;


procedure PEKD_DEPT_UNLOCK /*Филиал*/ (
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
 PEKD_DEPT_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_DEPT set LockUserID =null  where PEKD_DEPTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_DEPT set LockSessionID =null  where PEKD_DEPTid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_DEPT_SINIT /*Филиал*/ (
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
 select  SecurityStyleID into atmpID from PEKD_DEPT where PEKD_DEPTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_DEPT');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_DEPT_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_DEPT set securitystyleid =aStyleID where PEKD_DEPTid = aRowID;
else 
 update PEKD_DEPT set securitystyleid =aSecurityStyleID where PEKD_DEPTid = aRowID;
end if; 
end ; 


procedure PEKD_DEPT_propagate /*Филиал*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_DEPT where PEKD_DEPTid=aRowid;
declare cursor pch_PEKD_DEPLIMITS  is select PEKD_DEPLIMITS.PEKD_DEPLIMITSid ID from PEKD_DEPLIMITS where  PEKD_DEPLIMITS.ParentStructRowID = aRowid;
row_PEKD_DEPLIMITS  pch_PEKD_DEPLIMITS%ROWTYPE;
begin
--open pch_PEKD_DEPLIMITS;
for row_PEKD_DEPLIMITS in pch_PEKD_DEPLIMITS loop
   PEKD_DEPLIMITS_SINIT( acursession,row_PEKD_DEPLIMITS.id,assid);
   PEKD_DEPLIMITS_propagate( acursession,row_PEKD_DEPLIMITS.id);
end loop;
--close pch_PEKD_DEPLIMITS;
end;
declare cursor pch_PEKD_DEPDOG  is select PEKD_DEPDOG.PEKD_DEPDOGid ID from PEKD_DEPDOG where  PEKD_DEPDOG.ParentStructRowID = aRowid;
row_PEKD_DEPDOG  pch_PEKD_DEPDOG%ROWTYPE;
begin
--open pch_PEKD_DEPDOG;
for row_PEKD_DEPDOG in pch_PEKD_DEPDOG loop
   PEKD_DEPDOG_SINIT( acursession,row_PEKD_DEPDOG.id,assid);
   PEKD_DEPDOG_propagate( acursession,row_PEKD_DEPDOG.id);
end loop;
--close pch_PEKD_DEPDOG;
end;
end;



procedure PEKD_DEPLIMITS_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DEPLIMITSid CHAR,
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
if aPEKD_DEPLIMITSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_DEPLIMITS where PEKD_DEPLIMITSID=aPEKD_DEPLIMITSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_DEPLIMITS where PEKD_DEPLIMITSid=aPEKD_DEPLIMITSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_DEPLIMITS');
    return;
  end if;
  aBRIEF:=func.PEKD_DEPLIMITS_BRIEF_F(aPEKD_DEPLIMITSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_DEPLIMITS_DELETE /*Уровни неснижаемых остатков по постащикам*/ (
 aCURSESSION CHAR,
 aPEKD_DEPLIMITSid CHAR,
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
select count(*) into existsCnt from PEKD_DEPLIMITS where PEKD_DEPLIMITSID=aPEKD_DEPLIMITSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_DEPLIMITS where PEKD_DEPLIMITSid=aPEKD_DEPLIMITSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_DEPLIMITS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_DEPLIMITS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DEPLIMITS_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DEPLIMITSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_DEPLIMITS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DEPLIMITS',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_DEPLIMITSid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_DEPLIMITS is select  instanceid ID from instance where OwnerPartName ='PEKD_DEPLIMITS' and OwnerRowID=aPEKD_DEPLIMITSid;
row_PEKD_DEPLIMITS  chld_PEKD_DEPLIMITS%ROWTYPE;
begin
--open chld_PEKD_DEPLIMITS;
for row_PEKD_DEPLIMITS in chld_PEKD_DEPLIMITS loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_DEPLIMITS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_DEPLIMITS.id);
end loop;
--close chld_PEKD_DEPLIMITS;
end ;
  delete from  PEKD_DEPLIMITS 
  where  PEKD_DEPLIMITSID = aPEKD_DEPLIMITSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Контролируемые лимиты*/
procedure PEKD_DEPLIMITS_SAVE /*Уровни неснижаемых остатков по постащикам*/ (
 aCURSESSION CHAR,
 aPEKD_DEPLIMITSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSupplier CHAR/* Поставщик *//* Поставщик */
,aLimitMark
 NUMBER/* Необходимый остаток *//* Необходимый остаток */
,aDaysToCrash
 NUMBER := null /* Запас в днях *//* Запас в днях */
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
select count(*) into existsCnt from PEKD_DEPLIMITS where PEKD_DEPLIMITSID=aPEKD_DEPLIMITSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_DEPLIMITS where PEKD_DEPLIMITSid=aPEKD_DEPLIMITSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_DEPLIMITS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_DEPLIMITS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DEPLIMITS_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DEPLIMITSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DEPLIMITS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DEPLIMITS',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_DEPLIMITSid,aLogInstanceID=>aInstanceID);
 update  PEKD_DEPLIMITS set ChangeStamp=sysdate
,
  Supplier=aSupplier
,
  LimitMark=aLimitMark
,
  DaysToCrash=aDaysToCrash
  where  PEKD_DEPLIMITSID = aPEKD_DEPLIMITSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PEKD_DEPT where PEKD_DEPTid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_DEPLIMITS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_DEPLIMITS');
      return;
    end if;
 end if;
 PEKD_DEPT_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DEPLIMITS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DEPLIMITS',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_DEPLIMITSid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_DEPLIMITS
 (  PEKD_DEPLIMITSID 
,ParentStructRowID
,Supplier

,LimitMark

,DaysToCrash

 ) values ( aPEKD_DEPLIMITSID 
,aParentStructRowID
,aSupplier

,aLimitMark

,aDaysToCrash

 ); 
 PEKD_DEPLIMITS_SINIT( aCURSESSION,aPEKD_DEPLIMITSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_DEPLIMITS_PARENT /*Уровни неснижаемых остатков по постащикам*/ (
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
  select ParentStructRowID into aParentID  from PEKD_DEPLIMITS where  PEKD_DEPLIMITSid=aRowID;
  aParentTable := 'PEKD_DEPT';
 end; 


procedure PEKD_DEPLIMITS_ISLOCKED /*Уровни неснижаемых остатков по постащикам*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_DEPLIMITS where PEKD_DEPLIMITSid=aRowID;
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
  PEKD_DEPLIMITS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_DEPLIMITS_LOCK /*Уровни неснижаемых остатков по постащикам*/ (
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
 PEKD_DEPLIMITS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_DEPLIMITS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_DEPLIMITS where PEKD_DEPLIMITSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_DEPLIMITS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_DEPLIMITS set LockUserID =auserID ,LockSessionID =null where PEKD_DEPLIMITSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_DEPLIMITS set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_DEPLIMITSid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_DEPLIMITS_HCL /*Уровни неснижаемых остатков по постащикам*/ (
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


procedure PEKD_DEPLIMITS_UNLOCK /*Уровни неснижаемых остатков по постащикам*/ (
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
 PEKD_DEPLIMITS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_DEPLIMITS set LockUserID =null  where PEKD_DEPLIMITSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_DEPLIMITS set LockSessionID =null  where PEKD_DEPLIMITSid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_DEPLIMITS_SINIT /*Уровни неснижаемых остатков по постащикам*/ (
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
 select  SecurityStyleID into atmpID from PEKD_DEPLIMITS where PEKD_DEPLIMITSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_DEPLIMITS');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_DEPLIMITS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_DEPLIMITS set securitystyleid =aStyleID where PEKD_DEPLIMITSid = aRowID;
else 
 update PEKD_DEPLIMITS set securitystyleid =aSecurityStyleID where PEKD_DEPLIMITSid = aRowID;
end if; 
end ; 


procedure PEKD_DEPLIMITS_propagate /*Уровни неснижаемых остатков по постащикам*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_DEPLIMITS where PEKD_DEPLIMITSid=aRowid;
end;



procedure PEKD_DEPDOG_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DEPDOGid CHAR,
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
if aPEKD_DEPDOGid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_DEPDOG where PEKD_DEPDOGID=aPEKD_DEPDOGID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_DEPDOG where PEKD_DEPDOGid=aPEKD_DEPDOGID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_DEPDOG');
    return;
  end if;
  aBRIEF:=func.PEKD_DEPDOG_BRIEF_F(aPEKD_DEPDOGid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_DEPDOG_DELETE /*Договора в рамках которого поставщик поставляет услуги*/ (
 aCURSESSION CHAR,
 aPEKD_DEPDOGid CHAR,
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
select count(*) into existsCnt from PEKD_DEPDOG where PEKD_DEPDOGID=aPEKD_DEPDOGID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_DEPDOG where PEKD_DEPDOGid=aPEKD_DEPDOGID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_DEPDOG',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_DEPDOG');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DEPDOG_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DEPDOGid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_DEPDOG');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DEPDOG',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_DEPDOGid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_DEPDOG is select  instanceid ID from instance where OwnerPartName ='PEKD_DEPDOG' and OwnerRowID=aPEKD_DEPDOGid;
row_PEKD_DEPDOG  chld_PEKD_DEPDOG%ROWTYPE;
begin
--open chld_PEKD_DEPDOG;
for row_PEKD_DEPDOG in chld_PEKD_DEPDOG loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_DEPDOG.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_DEPDOG.id);
end loop;
--close chld_PEKD_DEPDOG;
end ;
  delete from  PEKD_DEPDOG 
  where  PEKD_DEPDOGID = aPEKD_DEPDOGID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Договора с поставщиками*/
procedure PEKD_DEPDOG_SAVE /*Договора в рамках которого поставщик поставляет услуги*/ (
 aCURSESSION CHAR,
 aPEKD_DEPDOGid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSupplier CHAR/* Поставщик *//* Поставщик */
,aTheDogovor CHAR/* Договор *//* Договор */
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
select count(*) into existsCnt from PEKD_DEPDOG where PEKD_DEPDOGID=aPEKD_DEPDOGID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_DEPDOG where PEKD_DEPDOGid=aPEKD_DEPDOGID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_DEPDOG',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_DEPDOG');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DEPDOG_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DEPDOGid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DEPDOG');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DEPDOG',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_DEPDOGid,aLogInstanceID=>aInstanceID);
 update  PEKD_DEPDOG set ChangeStamp=sysdate
,
  Supplier=aSupplier
,
  TheDogovor=aTheDogovor
  where  PEKD_DEPDOGID = aPEKD_DEPDOGID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PEKD_DEPT where PEKD_DEPTid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_DEPDOG',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_DEPDOG');
      return;
    end if;
 end if;
 PEKD_DEPT_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DEPDOG');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DEPDOG',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_DEPDOGid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_DEPDOG
 (  PEKD_DEPDOGID 
,ParentStructRowID
,Supplier

,TheDogovor

 ) values ( aPEKD_DEPDOGID 
,aParentStructRowID
,aSupplier

,aTheDogovor

 ); 
 PEKD_DEPDOG_SINIT( aCURSESSION,aPEKD_DEPDOGid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_DEPDOG_PARENT /*Договора в рамках которого поставщик поставляет услуги*/ (
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
  select ParentStructRowID into aParentID  from PEKD_DEPDOG where  PEKD_DEPDOGid=aRowID;
  aParentTable := 'PEKD_DEPT';
 end; 


procedure PEKD_DEPDOG_ISLOCKED /*Договора в рамках которого поставщик поставляет услуги*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_DEPDOG where PEKD_DEPDOGid=aRowID;
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
  PEKD_DEPDOG_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_DEPDOG_LOCK /*Договора в рамках которого поставщик поставляет услуги*/ (
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
 PEKD_DEPDOG_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_DEPDOG_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_DEPDOG where PEKD_DEPDOGid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_DEPDOG');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_DEPDOG set LockUserID =auserID ,LockSessionID =null where PEKD_DEPDOGid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_DEPDOG set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_DEPDOGid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_DEPDOG_HCL /*Договора в рамках которого поставщик поставляет услуги*/ (
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


procedure PEKD_DEPDOG_UNLOCK /*Договора в рамках которого поставщик поставляет услуги*/ (
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
 PEKD_DEPDOG_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_DEPDOG set LockUserID =null  where PEKD_DEPDOGid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_DEPDOG set LockSessionID =null  where PEKD_DEPDOGid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_DEPDOG_SINIT /*Договора в рамках которого поставщик поставляет услуги*/ (
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
 select  SecurityStyleID into atmpID from PEKD_DEPDOG where PEKD_DEPDOGid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_DEPDOG');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_DEPDOG_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_DEPDOG set securitystyleid =aStyleID where PEKD_DEPDOGid = aRowID;
else 
 update PEKD_DEPDOG set securitystyleid =aSecurityStyleID where PEKD_DEPDOGid = aRowID;
end if; 
end ; 


procedure PEKD_DEPDOG_propagate /*Договора в рамках которого поставщик поставляет услуги*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_DEPDOG where PEKD_DEPDOGid=aRowid;
end;



procedure PEKD_DIRECTION_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DIRECTIONid CHAR,
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
if aPEKD_DIRECTIONid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_DIRECTION where PEKD_DIRECTIONID=aPEKD_DIRECTIONID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_DIRECTION where PEKD_DIRECTIONid=aPEKD_DIRECTIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_DIRECTION');
    return;
  end if;
  aBRIEF:=func.PEKD_DIRECTION_BRIEF_F(aPEKD_DIRECTIONid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_DIRECTION_DELETE /*Направление перевозки*/ (
 aCURSESSION CHAR,
 aPEKD_DIRECTIONid CHAR,
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
select count(*) into existsCnt from PEKD_DIRECTION where PEKD_DIRECTIONID=aPEKD_DIRECTIONID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_DIRECTION where PEKD_DIRECTIONid=aPEKD_DIRECTIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_DIRECTION',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_DIRECTION');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DIRECTION_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DIRECTIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_DIRECTION');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PEKD_TRAINS is select PEKD_TRAINS.PEKD_TRAINSid ID from PEKD_TRAINS where  PEKD_TRAINS.ParentStructRowID = aPEKD_DIRECTIONid;
    child_PEKD_TRAINS_rec  child_PEKD_TRAINS%ROWTYPE;
    begin
    --open child_PEKD_TRAINS;
      for child_PEKD_TRAINS_rec in child_PEKD_TRAINS loop
      PEKD_TRAINS_DELETE (acursession,child_PEKD_TRAINS_rec.id,aInstanceid);
      end loop;
      --close child_PEKD_TRAINS;
    end ;
    declare cursor child_PEKD_DIRSTATION is select PEKD_DIRSTATION.PEKD_DIRSTATIONid ID from PEKD_DIRSTATION where  PEKD_DIRSTATION.ParentStructRowID = aPEKD_DIRECTIONid;
    child_PEKD_DIRSTATION_rec  child_PEKD_DIRSTATION%ROWTYPE;
    begin
    --open child_PEKD_DIRSTATION;
      for child_PEKD_DIRSTATION_rec in child_PEKD_DIRSTATION loop
      PEKD_DIRSTATION_DELETE (acursession,child_PEKD_DIRSTATION_rec.id,aInstanceid);
      end loop;
      --close child_PEKD_DIRSTATION;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DIRECTION',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_DIRECTIONid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_DIRECTION is select  instanceid ID from instance where OwnerPartName ='PEKD_DIRECTION' and OwnerRowID=aPEKD_DIRECTIONid;
row_PEKD_DIRECTION  chld_PEKD_DIRECTION%ROWTYPE;
begin
--open chld_PEKD_DIRECTION;
for row_PEKD_DIRECTION in chld_PEKD_DIRECTION loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_DIRECTION.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_DIRECTION.id);
end loop;
--close chld_PEKD_DIRECTION;
end ;
  delete from  PEKD_DIRECTION 
  where  PEKD_DIRECTIONID = aPEKD_DIRECTIONID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Направление перевозки*/
procedure PEKD_DIRECTION_SAVE /*Направление перевозки*/ (
 aCURSESSION CHAR,
 aPEKD_DIRECTIONid CHAR,
aInstanceID CHAR 
,aTown CHAR/* Город *//* Город */
,aName
 VARCHAR2/* Направление *//* Направление */
,aDept CHAR := null /* Филиал *//* Филиал */
,aSrok
 VARCHAR2 := null /* Срок доставки *//* Срок доставки */
,athe_Rule
 VARCHAR2 := null /* Отправка *//* Отправка */
,aPOSTINDEX
 VARCHAR2 := null /* Почтовый индекс *//* Почтовый индекс */
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
select count(*) into existsCnt from PEKD_DIRECTION where PEKD_DIRECTIONID=aPEKD_DIRECTIONID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_DIRECTION where PEKD_DIRECTIONid=aPEKD_DIRECTIONID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_DIRECTION',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_DIRECTION');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DIRECTION_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DIRECTIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DIRECTION');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DIRECTION',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_DIRECTIONid,aLogInstanceID=>aInstanceID);
 update  PEKD_DIRECTION set ChangeStamp=sysdate
,
  Town=aTown
,
  Name=aName
,
  Dept=aDept
,
  Srok=aSrok
,
  the_Rule=athe_Rule
,
  POSTINDEX=aPOSTINDEX
  where  PEKD_DIRECTIONID = aPEKD_DIRECTIONID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_DIRECTION',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_DIRECTION');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DIRECTION');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DIRECTION',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_DIRECTIONid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_DIRECTION
 (  PEKD_DIRECTIONID 
,InstanceID
,Town

,Name

,Dept

,Srok

,the_Rule

,POSTINDEX

 ) values ( aPEKD_DIRECTIONID 
,aInstanceID
,aTown

,aName

,aDept

,aSrok

,athe_Rule

,aPOSTINDEX

 ); 
 PEKD_DIRECTION_SINIT( aCURSESSION,aPEKD_DIRECTIONid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_DIRECTION_PARENT /*Направление перевозки*/ (
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
  select  INSTANCEID into aParentID from PEKD_DIRECTION where  PEKD_DIRECTIONid=aRowID;
 end; 


procedure PEKD_DIRECTION_ISLOCKED /*Направление перевозки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_DIRECTION where PEKD_DIRECTIONid=aRowID;
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
  PEKD_DIRECTION_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_DIRECTION_LOCK /*Направление перевозки*/ (
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
 PEKD_DIRECTION_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_DIRECTION_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_DIRECTION where PEKD_DIRECTIONid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_DIRECTION');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_DIRECTION set LockUserID =auserID ,LockSessionID =null where PEKD_DIRECTIONid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_DIRECTION set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_DIRECTIONid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_DIRECTION_HCL /*Направление перевозки*/ (
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
declare cursor lch_PEKD_TRAINS is select PEKD_TRAINS.PEKD_TRAINSid ID from PEKD_TRAINS where  PEKD_TRAINS.ParentStructRowID = aRowid;
row_PEKD_TRAINS lch_PEKD_TRAINS%ROWTYPE;
begin  
--open lch_PEKD_TRAINS;
for row_PEKD_TRAINS in lch_PEKD_TRAINS
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKD_TRAINS where PEKD_TRAINSid=row_PEKD_TRAINS.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_TRAINS;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKD_TRAINS;
     return;
   end if; 
 end if;  
 PEKD_TRAINS_HCL (acursession,row_PEKD_TRAINS.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_TRAINS;
   return;
 end if;
end loop;
--close lch_PEKD_TRAINS;
end;
declare cursor lch_PEKD_DIRSTATION is select PEKD_DIRSTATION.PEKD_DIRSTATIONid ID from PEKD_DIRSTATION where  PEKD_DIRSTATION.ParentStructRowID = aRowid;
row_PEKD_DIRSTATION lch_PEKD_DIRSTATION%ROWTYPE;
begin  
--open lch_PEKD_DIRSTATION;
for row_PEKD_DIRSTATION in lch_PEKD_DIRSTATION
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKD_DIRSTATION where PEKD_DIRSTATIONid=row_PEKD_DIRSTATION.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_DIRSTATION;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKD_DIRSTATION;
     return;
   end if; 
 end if;  
 PEKD_DIRSTATION_HCL (acursession,row_PEKD_DIRSTATION.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_DIRSTATION;
   return;
 end if;
end loop;
--close lch_PEKD_DIRSTATION;
end;
aIsLocked :=0;
end;


procedure PEKD_DIRECTION_UNLOCK /*Направление перевозки*/ (
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
 PEKD_DIRECTION_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_DIRECTION set LockUserID =null  where PEKD_DIRECTIONid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_DIRECTION set LockSessionID =null  where PEKD_DIRECTIONid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_DIRECTION_SINIT /*Направление перевозки*/ (
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
 select  SecurityStyleID into atmpID from PEKD_DIRECTION where PEKD_DIRECTIONid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_DIRECTION');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_DIRECTION_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_DIRECTION set securitystyleid =aStyleID where PEKD_DIRECTIONid = aRowID;
else 
 update PEKD_DIRECTION set securitystyleid =aSecurityStyleID where PEKD_DIRECTIONid = aRowID;
end if; 
end ; 


procedure PEKD_DIRECTION_propagate /*Направление перевозки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_DIRECTION where PEKD_DIRECTIONid=aRowid;
declare cursor pch_PEKD_TRAINS  is select PEKD_TRAINS.PEKD_TRAINSid ID from PEKD_TRAINS where  PEKD_TRAINS.ParentStructRowID = aRowid;
row_PEKD_TRAINS  pch_PEKD_TRAINS%ROWTYPE;
begin
--open pch_PEKD_TRAINS;
for row_PEKD_TRAINS in pch_PEKD_TRAINS loop
   PEKD_TRAINS_SINIT( acursession,row_PEKD_TRAINS.id,assid);
   PEKD_TRAINS_propagate( acursession,row_PEKD_TRAINS.id);
end loop;
--close pch_PEKD_TRAINS;
end;
declare cursor pch_PEKD_DIRSTATION  is select PEKD_DIRSTATION.PEKD_DIRSTATIONid ID from PEKD_DIRSTATION where  PEKD_DIRSTATION.ParentStructRowID = aRowid;
row_PEKD_DIRSTATION  pch_PEKD_DIRSTATION%ROWTYPE;
begin
--open pch_PEKD_DIRSTATION;
for row_PEKD_DIRSTATION in pch_PEKD_DIRSTATION loop
   PEKD_DIRSTATION_SINIT( acursession,row_PEKD_DIRSTATION.id,assid);
   PEKD_DIRSTATION_propagate( acursession,row_PEKD_DIRSTATION.id);
end loop;
--close pch_PEKD_DIRSTATION;
end;
end;



procedure PEKD_TRAINS_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_TRAINSid CHAR,
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
if aPEKD_TRAINSid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_TRAINS where PEKD_TRAINSID=aPEKD_TRAINSID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_TRAINS where PEKD_TRAINSid=aPEKD_TRAINSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_TRAINS');
    return;
  end if;
  aBRIEF:=func.PEKD_TRAINS_BRIEF_F(aPEKD_TRAINSid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_TRAINS_DELETE /*Маршруты*/ (
 aCURSESSION CHAR,
 aPEKD_TRAINSid CHAR,
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
select count(*) into existsCnt from PEKD_TRAINS where PEKD_TRAINSID=aPEKD_TRAINSID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_TRAINS where PEKD_TRAINSid=aPEKD_TRAINSID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_TRAINS',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_TRAINS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_TRAINS_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_TRAINSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_TRAINS');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRAINS',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_TRAINSid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_TRAINS is select  instanceid ID from instance where OwnerPartName ='PEKD_TRAINS' and OwnerRowID=aPEKD_TRAINSid;
row_PEKD_TRAINS  chld_PEKD_TRAINS%ROWTYPE;
begin
--open chld_PEKD_TRAINS;
for row_PEKD_TRAINS in chld_PEKD_TRAINS loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_TRAINS.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_TRAINS.id);
end loop;
--close chld_PEKD_TRAINS;
end ;
  delete from  PEKD_TRAINS 
  where  PEKD_TRAINSID = aPEKD_TRAINSID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Маршруты*/
procedure PEKD_TRAINS_SAVE /*Маршруты*/ (
 aCURSESSION CHAR,
 aPEKD_TRAINSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTrainNo
 VARCHAR2/* № поезда *//* № поезда */
,aFromStation CHAR := null /* Из *//* Из */
,aToSTATION CHAR := null /* В *//* В */
,athe_Rule
 VARCHAR2 := null /* Отправка *//* Отправка */
,aTheDesciption
 VARCHAR2 := null /* Описание *//* Описание */
,aTheComment VARCHAR2 := null /* Примечание *//* Примечание */
,aTrainType CHAR := null /* Тип поезда *//* Тип поезда */
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
select count(*) into existsCnt from PEKD_TRAINS where PEKD_TRAINSID=aPEKD_TRAINSID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_TRAINS where PEKD_TRAINSid=aPEKD_TRAINSID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_TRAINS',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_TRAINS');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_TRAINS_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_TRAINSid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_TRAINS');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRAINS',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_TRAINSid,aLogInstanceID=>aInstanceID);
 update  PEKD_TRAINS set ChangeStamp=sysdate
,
  TrainNo=aTrainNo
,
  FromStation=aFromStation
,
  ToSTATION=aToSTATION
,
  the_Rule=athe_Rule
,
  TheDesciption=aTheDesciption
,
  TheComment=aTheComment
,
  TrainType=aTrainType
  where  PEKD_TRAINSID = aPEKD_TRAINSID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PEKD_DIRECTION where PEKD_DIRECTIONid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_TRAINS',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_TRAINS');
      return;
    end if;
 end if;
 PEKD_DIRECTION_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_TRAINS');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_TRAINS',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_TRAINSid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_TRAINS
 (  PEKD_TRAINSID 
,ParentStructRowID
,TrainNo

,FromStation

,ToSTATION

,the_Rule

,TheDesciption

,TheComment

,TrainType

 ) values ( aPEKD_TRAINSID 
,aParentStructRowID
,aTrainNo

,aFromStation

,aToSTATION

,athe_Rule

,aTheDesciption

,aTheComment

,aTrainType

 ); 
 PEKD_TRAINS_SINIT( aCURSESSION,aPEKD_TRAINSid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_TRAINS_PARENT /*Маршруты*/ (
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
  select ParentStructRowID into aParentID  from PEKD_TRAINS where  PEKD_TRAINSid=aRowID;
  aParentTable := 'PEKD_DIRECTION';
 end; 


procedure PEKD_TRAINS_ISLOCKED /*Маршруты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_TRAINS where PEKD_TRAINSid=aRowID;
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
  PEKD_TRAINS_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_TRAINS_LOCK /*Маршруты*/ (
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
 PEKD_TRAINS_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_TRAINS_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_TRAINS where PEKD_TRAINSid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_TRAINS');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_TRAINS set LockUserID =auserID ,LockSessionID =null where PEKD_TRAINSid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_TRAINS set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_TRAINSid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_TRAINS_HCL /*Маршруты*/ (
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


procedure PEKD_TRAINS_UNLOCK /*Маршруты*/ (
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
 PEKD_TRAINS_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_TRAINS set LockUserID =null  where PEKD_TRAINSid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_TRAINS set LockSessionID =null  where PEKD_TRAINSid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_TRAINS_SINIT /*Маршруты*/ (
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
 select  SecurityStyleID into atmpID from PEKD_TRAINS where PEKD_TRAINSid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_TRAINS');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_TRAINS_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_TRAINS set securitystyleid =aStyleID where PEKD_TRAINSid = aRowID;
else 
 update PEKD_TRAINS set securitystyleid =aSecurityStyleID where PEKD_TRAINSid = aRowID;
end if; 
end ; 


procedure PEKD_TRAINS_propagate /*Маршруты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_TRAINS where PEKD_TRAINSid=aRowid;
end;



procedure PEKD_DIRSTATION_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DIRSTATIONid CHAR,
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
if aPEKD_DIRSTATIONid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_DIRSTATION where PEKD_DIRSTATIONID=aPEKD_DIRSTATIONID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_DIRSTATION where PEKD_DIRSTATIONid=aPEKD_DIRSTATIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_DIRSTATION');
    return;
  end if;
  aBRIEF:=func.PEKD_DIRSTATION_BRIEF_F(aPEKD_DIRSTATIONid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_DIRSTATION_DELETE /*Точки доставки*/ (
 aCURSESSION CHAR,
 aPEKD_DIRSTATIONid CHAR,
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
select count(*) into existsCnt from PEKD_DIRSTATION where PEKD_DIRSTATIONID=aPEKD_DIRSTATIONID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_DIRSTATION where PEKD_DIRSTATIONid=aPEKD_DIRSTATIONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_DIRSTATION',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_DIRSTATION');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DIRSTATION_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DIRSTATIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_DIRSTATION');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DIRSTATION',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_DIRSTATIONid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_DIRSTATION is select  instanceid ID from instance where OwnerPartName ='PEKD_DIRSTATION' and OwnerRowID=aPEKD_DIRSTATIONid;
row_PEKD_DIRSTATION  chld_PEKD_DIRSTATION%ROWTYPE;
begin
--open chld_PEKD_DIRSTATION;
for row_PEKD_DIRSTATION in chld_PEKD_DIRSTATION loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_DIRSTATION.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_DIRSTATION.id);
end loop;
--close chld_PEKD_DIRSTATION;
end ;
  delete from  PEKD_DIRSTATION 
  where  PEKD_DIRSTATIONID = aPEKD_DIRSTATIONID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Точки доставки*/
procedure PEKD_DIRSTATION_SAVE /*Точки доставки*/ (
 aCURSESSION CHAR,
 aPEKD_DIRSTATIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aPOSTINDEX
 VARCHAR2 := null /* Индекс отделения *//* Индекс отделения */
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
select count(*) into existsCnt from PEKD_DIRSTATION where PEKD_DIRSTATIONID=aPEKD_DIRSTATIONID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_DIRSTATION where PEKD_DIRSTATIONid=aPEKD_DIRSTATIONID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_DIRSTATION',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_DIRSTATION');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DIRSTATION_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DIRSTATIONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DIRSTATION');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DIRSTATION',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_DIRSTATIONid,aLogInstanceID=>aInstanceID);
 update  PEKD_DIRSTATION set ChangeStamp=sysdate
,
  name=aname
,
  POSTINDEX=aPOSTINDEX
  where  PEKD_DIRSTATIONID = aPEKD_DIRSTATIONID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PEKD_DIRECTION where PEKD_DIRECTIONid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_DIRSTATION',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_DIRSTATION');
      return;
    end if;
 end if;
 PEKD_DIRECTION_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DIRSTATION');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DIRSTATION',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_DIRSTATIONid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_DIRSTATION
 (  PEKD_DIRSTATIONID 
,ParentStructRowID
,name

,POSTINDEX

 ) values ( aPEKD_DIRSTATIONID 
,aParentStructRowID
,aname

,aPOSTINDEX

 ); 
 PEKD_DIRSTATION_SINIT( aCURSESSION,aPEKD_DIRSTATIONid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_DIRSTATION_PARENT /*Точки доставки*/ (
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
  select ParentStructRowID into aParentID  from PEKD_DIRSTATION where  PEKD_DIRSTATIONid=aRowID;
  aParentTable := 'PEKD_DIRECTION';
 end; 


procedure PEKD_DIRSTATION_ISLOCKED /*Точки доставки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_DIRSTATION where PEKD_DIRSTATIONid=aRowID;
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
  PEKD_DIRSTATION_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_DIRSTATION_LOCK /*Точки доставки*/ (
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
 PEKD_DIRSTATION_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_DIRSTATION_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_DIRSTATION where PEKD_DIRSTATIONid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_DIRSTATION');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_DIRSTATION set LockUserID =auserID ,LockSessionID =null where PEKD_DIRSTATIONid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_DIRSTATION set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_DIRSTATIONid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_DIRSTATION_HCL /*Точки доставки*/ (
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


procedure PEKD_DIRSTATION_UNLOCK /*Точки доставки*/ (
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
 PEKD_DIRSTATION_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_DIRSTATION set LockUserID =null  where PEKD_DIRSTATIONid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_DIRSTATION set LockSessionID =null  where PEKD_DIRSTATIONid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_DIRSTATION_SINIT /*Точки доставки*/ (
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
 select  SecurityStyleID into atmpID from PEKD_DIRSTATION where PEKD_DIRSTATIONid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_DIRSTATION');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_DIRSTATION_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_DIRSTATION set securitystyleid =aStyleID where PEKD_DIRSTATIONid = aRowID;
else 
 update PEKD_DIRSTATION set securitystyleid =aSecurityStyleID where PEKD_DIRSTATIONid = aRowID;
end if; 
end ; 


procedure PEKD_DIRSTATION_propagate /*Точки доставки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_DIRSTATION where PEKD_DIRSTATIONid=aRowid;
end;



procedure PEKD_DOGTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DOGTYPEid CHAR,
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
if aPEKD_DOGTYPEid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_DOGTYPE where PEKD_DOGTYPEID=aPEKD_DOGTYPEID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_DOGTYPE where PEKD_DOGTYPEid=aPEKD_DOGTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_DOGTYPE');
    return;
  end if;
  aBRIEF:=func.PEKD_DOGTYPE_BRIEF_F(aPEKD_DOGTYPEid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_DOGTYPE_DELETE /*Типы договоров
Клиентские, Агентские, с Поставщиками и тп*/ (
 aCURSESSION CHAR,
 aPEKD_DOGTYPEid CHAR,
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
select count(*) into existsCnt from PEKD_DOGTYPE where PEKD_DOGTYPEID=aPEKD_DOGTYPEID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_DOGTYPE where PEKD_DOGTYPEid=aPEKD_DOGTYPEID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_DOGTYPE',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_DOGTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DOGTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DOGTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_DOGTYPE');
    return;
  end if;
  --begin tran--  
 -- erase child items --
-- delete in-struct child
    declare cursor child_PEKD_DOGAPPENDIX is select PEKD_DOGAPPENDIX.PEKD_DOGAPPENDIXid ID from PEKD_DOGAPPENDIX where  PEKD_DOGAPPENDIX.ParentStructRowID = aPEKD_DOGTYPEid;
    child_PEKD_DOGAPPENDIX_rec  child_PEKD_DOGAPPENDIX%ROWTYPE;
    begin
    --open child_PEKD_DOGAPPENDIX;
      for child_PEKD_DOGAPPENDIX_rec in child_PEKD_DOGAPPENDIX loop
      PEKD_DOGAPPENDIX_DELETE (acursession,child_PEKD_DOGAPPENDIX_rec.id,aInstanceid);
      end loop;
      --close child_PEKD_DOGAPPENDIX;
    end ;
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DOGTYPE',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_DOGTYPEid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_DOGTYPE is select  instanceid ID from instance where OwnerPartName ='PEKD_DOGTYPE' and OwnerRowID=aPEKD_DOGTYPEid;
row_PEKD_DOGTYPE  chld_PEKD_DOGTYPE%ROWTYPE;
begin
--open chld_PEKD_DOGTYPE;
for row_PEKD_DOGTYPE in chld_PEKD_DOGTYPE loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_DOGTYPE.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_DOGTYPE.id);
end loop;
--close chld_PEKD_DOGTYPE;
end ;
  delete from  PEKD_DOGTYPE 
  where  PEKD_DOGTYPEID = aPEKD_DOGTYPEID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Тип договора*/
procedure PEKD_DOGTYPE_SAVE /*Типы договоров
Клиентские, Агентские, с Поставщиками и тп*/ (
 aCURSESSION CHAR,
 aPEKD_DOGTYPEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aTRTYPE CHAR := null /* Система отправки *//* Система отправки */
,aDogTemplate VARCHAR2 := null /* Шаблон договора */
,aDogTemplate_EXT varchar2 /* Шаблон договора */
,aIsActual
 NUMBER/* Актуальный вариант *//* Актуальный вариант */
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
select count(*) into existsCnt from PEKD_DOGTYPE where PEKD_DOGTYPEID=aPEKD_DOGTYPEID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_DOGTYPE where PEKD_DOGTYPEid=aPEKD_DOGTYPEID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_DOGTYPE',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_DOGTYPE');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DOGTYPE_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DOGTYPEid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DOGTYPE');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DOGTYPE',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_DOGTYPEid,aLogInstanceID=>aInstanceID);
 update  PEKD_DOGTYPE set ChangeStamp=sysdate
,
  Name=aName
,
  TRTYPE=aTRTYPE
,
  DogTemplate=aDogTemplate
,DogTemplate_EXT=
aDogTemplate_EXT 
,
  IsActual=aIsActual
,
  the_Comment=athe_Comment
  where  PEKD_DOGTYPEID = aPEKD_DOGTYPEID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_DOGTYPE',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_DOGTYPE');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DOGTYPE');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DOGTYPE',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_DOGTYPEid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_DOGTYPE
 (  PEKD_DOGTYPEID 
,InstanceID
,Name

,TRTYPE

,DogTemplate

,DogTemplate_EXT
,IsActual

,the_Comment

 ) values ( aPEKD_DOGTYPEID 
,aInstanceID
,aName

,aTRTYPE

,aDogTemplate

,aDogTemplate_EXT
,aIsActual

,athe_Comment

 ); 
 PEKD_DOGTYPE_SINIT( aCURSESSION,aPEKD_DOGTYPEid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_DOGTYPE_PARENT /*Типы договоров
Клиентские, Агентские, с Поставщиками и тп*/ (
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
  select  INSTANCEID into aParentID from PEKD_DOGTYPE where  PEKD_DOGTYPEid=aRowID;
 end; 


procedure PEKD_DOGTYPE_ISLOCKED /*Типы договоров
Клиентские, Агентские, с Поставщиками и тп*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_DOGTYPE where PEKD_DOGTYPEid=aRowID;
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
  PEKD_DOGTYPE_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_DOGTYPE_LOCK /*Типы договоров
Клиентские, Агентские, с Поставщиками и тп*/ (
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
 PEKD_DOGTYPE_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_DOGTYPE_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_DOGTYPE where PEKD_DOGTYPEid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_DOGTYPE');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_DOGTYPE set LockUserID =auserID ,LockSessionID =null where PEKD_DOGTYPEid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_DOGTYPE set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_DOGTYPEid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_DOGTYPE_HCL /*Типы договоров
Клиентские, Агентские, с Поставщиками и тп*/ (
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
declare cursor lch_PEKD_DOGAPPENDIX is select PEKD_DOGAPPENDIX.PEKD_DOGAPPENDIXid ID from PEKD_DOGAPPENDIX where  PEKD_DOGAPPENDIX.ParentStructRowID = aRowid;
row_PEKD_DOGAPPENDIX lch_PEKD_DOGAPPENDIX%ROWTYPE;
begin  
--open lch_PEKD_DOGAPPENDIX;
for row_PEKD_DOGAPPENDIX in lch_PEKD_DOGAPPENDIX
loop
 select  LockUserID, LockSessionID into aLockUserID,aLockSessionID from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXid=row_PEKD_DOGAPPENDIX.id;
 /* verify this row */
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_PEKD_DOGAPPENDIX;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked := 3; /* Lockes by another user */
     close lch_PEKD_DOGAPPENDIX;
     return;
   end if; 
 end if;  
 PEKD_DOGAPPENDIX_HCL (acursession,row_PEKD_DOGAPPENDIX.id,aisLocked);
 if aisLocked >2 then
   close lch_PEKD_DOGAPPENDIX;
   return;
 end if;
end loop;
--close lch_PEKD_DOGAPPENDIX;
end;
aIsLocked :=0;
end;


procedure PEKD_DOGTYPE_UNLOCK /*Типы договоров
Клиентские, Агентские, с Поставщиками и тп*/ (
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
 PEKD_DOGTYPE_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_DOGTYPE set LockUserID =null  where PEKD_DOGTYPEid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_DOGTYPE set LockSessionID =null  where PEKD_DOGTYPEid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_DOGTYPE_SINIT /*Типы договоров
Клиентские, Агентские, с Поставщиками и тп*/ (
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
 select  SecurityStyleID into atmpID from PEKD_DOGTYPE where PEKD_DOGTYPEid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_DOGTYPE');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_DOGTYPE_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_DOGTYPE set securitystyleid =aStyleID where PEKD_DOGTYPEid = aRowID;
else 
 update PEKD_DOGTYPE set securitystyleid =aSecurityStyleID where PEKD_DOGTYPEid = aRowID;
end if; 
end ; 


procedure PEKD_DOGTYPE_propagate /*Типы договоров
Клиентские, Агентские, с Поставщиками и тп*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_DOGTYPE where PEKD_DOGTYPEid=aRowid;
declare cursor pch_PEKD_DOGAPPENDIX  is select PEKD_DOGAPPENDIX.PEKD_DOGAPPENDIXid ID from PEKD_DOGAPPENDIX where  PEKD_DOGAPPENDIX.ParentStructRowID = aRowid;
row_PEKD_DOGAPPENDIX  pch_PEKD_DOGAPPENDIX%ROWTYPE;
begin
--open pch_PEKD_DOGAPPENDIX;
for row_PEKD_DOGAPPENDIX in pch_PEKD_DOGAPPENDIX loop
   PEKD_DOGAPPENDIX_SINIT( acursession,row_PEKD_DOGAPPENDIX.id,assid);
   PEKD_DOGAPPENDIX_propagate( acursession,row_PEKD_DOGAPPENDIX.id);
end loop;
--close pch_PEKD_DOGAPPENDIX;
end;
end;



procedure PEKD_DOGAPPENDIX_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DOGAPPENDIXid CHAR,
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
if aPEKD_DOGAPPENDIXid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXID=aPEKD_DOGAPPENDIXID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXid=aPEKD_DOGAPPENDIXID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_DOGAPPENDIX');
    return;
  end if;
  aBRIEF:=func.PEKD_DOGAPPENDIX_BRIEF_F(aPEKD_DOGAPPENDIXid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_DOGAPPENDIX_DELETE /*Приложения к договору*/ (
 aCURSESSION CHAR,
 aPEKD_DOGAPPENDIXid CHAR,
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
select count(*) into existsCnt from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXID=aPEKD_DOGAPPENDIXID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXid=aPEKD_DOGAPPENDIXID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_DOGAPPENDIX',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_DOGAPPENDIX');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DOGAPPENDIX_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DOGAPPENDIXid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_DOGAPPENDIX');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DOGAPPENDIX',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_DOGAPPENDIXid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_DOGAPPENDIX is select  instanceid ID from instance where OwnerPartName ='PEKD_DOGAPPENDIX' and OwnerRowID=aPEKD_DOGAPPENDIXid;
row_PEKD_DOGAPPENDIX  chld_PEKD_DOGAPPENDIX%ROWTYPE;
begin
--open chld_PEKD_DOGAPPENDIX;
for row_PEKD_DOGAPPENDIX in chld_PEKD_DOGAPPENDIX loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_DOGAPPENDIX.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_DOGAPPENDIX.id);
end loop;
--close chld_PEKD_DOGAPPENDIX;
end ;
  delete from  PEKD_DOGAPPENDIX 
  where  PEKD_DOGAPPENDIXID = aPEKD_DOGAPPENDIXID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Приложения*/
procedure PEKD_DOGAPPENDIX_SAVE /*Приложения к договору*/ (
 aCURSESSION CHAR,
 aPEKD_DOGAPPENDIXid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aAPPENDIXTemplate VARCHAR2 := null /* Шаблон */
,aAPPENDIXTemplate_EXT varchar2 /* Шаблон */
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
select count(*) into existsCnt from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXID=aPEKD_DOGAPPENDIXID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXid=aPEKD_DOGAPPENDIXID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_DOGAPPENDIX',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_DOGAPPENDIX');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_DOGAPPENDIX_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_DOGAPPENDIXid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DOGAPPENDIX');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DOGAPPENDIX',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_DOGAPPENDIXid,aLogInstanceID=>aInstanceID);
 update  PEKD_DOGAPPENDIX set ChangeStamp=sysdate
,
  Name=aName
,
  APPENDIXTemplate=aAPPENDIXTemplate
,APPENDIXTemplate_EXT=
aAPPENDIXTemplate_EXT 
,
  the_comment=athe_comment
  where  PEKD_DOGAPPENDIXID = aPEKD_DOGAPPENDIXID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from PEKD_DOGTYPE where PEKD_DOGTYPEid=aParentStructRowID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_DOGAPPENDIX',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_DOGAPPENDIX');
      return;
    end if;
 end if;
 PEKD_DOGTYPE_ISLOCKED (acursession=>acursession,aROWID=>aParentStructRowID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_DOGAPPENDIX');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_DOGAPPENDIX',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_DOGAPPENDIXid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_DOGAPPENDIX
 (  PEKD_DOGAPPENDIXID 
,ParentStructRowID
,Name

,APPENDIXTemplate

,APPENDIXTemplate_EXT
,the_comment

 ) values ( aPEKD_DOGAPPENDIXID 
,aParentStructRowID
,aName

,aAPPENDIXTemplate

,aAPPENDIXTemplate_EXT
,athe_comment

 ); 
 PEKD_DOGAPPENDIX_SINIT( aCURSESSION,aPEKD_DOGAPPENDIXid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_DOGAPPENDIX_PARENT /*Приложения к договору*/ (
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
  select ParentStructRowID into aParentID  from PEKD_DOGAPPENDIX where  PEKD_DOGAPPENDIXid=aRowID;
  aParentTable := 'PEKD_DOGTYPE';
 end; 


procedure PEKD_DOGAPPENDIX_ISLOCKED /*Приложения к договору*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXid=aRowID;
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
  PEKD_DOGAPPENDIX_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_DOGAPPENDIX_LOCK /*Приложения к договору*/ (
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
 PEKD_DOGAPPENDIX_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_DOGAPPENDIX_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_DOGAPPENDIX');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_DOGAPPENDIX set LockUserID =auserID ,LockSessionID =null where PEKD_DOGAPPENDIXid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_DOGAPPENDIX set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_DOGAPPENDIXid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_DOGAPPENDIX_HCL /*Приложения к договору*/ (
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


procedure PEKD_DOGAPPENDIX_UNLOCK /*Приложения к договору*/ (
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
 PEKD_DOGAPPENDIX_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_DOGAPPENDIX set LockUserID =null  where PEKD_DOGAPPENDIXid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_DOGAPPENDIX set LockSessionID =null  where PEKD_DOGAPPENDIXid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_DOGAPPENDIX_SINIT /*Приложения к договору*/ (
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
 select  SecurityStyleID into atmpID from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_DOGAPPENDIX');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_DOGAPPENDIX_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_DOGAPPENDIX set securitystyleid =aStyleID where PEKD_DOGAPPENDIXid = aRowID;
else 
 update PEKD_DOGAPPENDIX set securitystyleid =aSecurityStyleID where PEKD_DOGAPPENDIXid = aRowID;
end if; 
end ; 


procedure PEKD_DOGAPPENDIX_propagate /*Приложения к договору*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_DOGAPPENDIX where PEKD_DOGAPPENDIXid=aRowid;
end;



procedure PEKD_SRV_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_SRVid CHAR,
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
if aPEKD_SRVid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from PEKD_SRV where PEKD_SRVID=aPEKD_SRVID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from PEKD_SRV where PEKD_SRVid=aPEKD_SRVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=PEKD_SRV');
    return;
  end if;
  aBRIEF:=func.PEKD_SRV_BRIEF_F(aPEKD_SRVid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure PEKD_SRV_DELETE /*Дополнительные услуги*/ (
 aCURSESSION CHAR,
 aPEKD_SRVid CHAR,
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
select count(*) into existsCnt from PEKD_SRV where PEKD_SRVID=aPEKD_SRVID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from PEKD_SRV where PEKD_SRVid=aPEKD_SRVID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:PEKD_SRV',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=PEKD_SRV');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_SRV_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_SRVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=PEKD_SRV');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_SRV',
 aVERB=>'DELETEROW',  aThe_Resource=>aPEKD_SRVid, aLogInstanceID=>aInstanceID);
declare cursor chld_PEKD_SRV is select  instanceid ID from instance where OwnerPartName ='PEKD_SRV' and OwnerRowID=aPEKD_SRVid;
row_PEKD_SRV  chld_PEKD_SRV%ROWTYPE;
begin
--open chld_PEKD_SRV;
for row_PEKD_SRV in chld_PEKD_SRV loop
 Kernel.INSTANCE_OWNER (acursession,row_PEKD_SRV.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_PEKD_SRV.id);
end loop;
--close chld_PEKD_SRV;
end ;
  delete from  PEKD_SRV 
  where  PEKD_SRVID = aPEKD_SRVID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Дополнительные услуги*/
procedure PEKD_SRV_SAVE /*Дополнительные услуги*/ (
 aCURSESSION CHAR,
 aPEKD_SRVid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aDependOnWeight
 NUMBER := null /* Зависит от веса *//* Зависит от веса */
,aEDIZM CHAR := null /* Единица измерения *//* Единица измерения */
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
select count(*) into existsCnt from PEKD_SRV where PEKD_SRVID=aPEKD_SRVID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from PEKD_SRV where PEKD_SRVid=aPEKD_SRVID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:PEKD_SRV',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=PEKD_SRV');
      return;
    end if;
  end if;
 --  verify lock  --
 PEKD_SRV_ISLOCKED( acursession=>acursession,aROWID=>aPEKD_SRVid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_SRV');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_SRV',
 aVERB=>'EDITROW',  aThe_Resource=>aPEKD_SRVid,aLogInstanceID=>aInstanceID);
 update  PEKD_SRV set ChangeStamp=sysdate
,
  name=aname
,
  DependOnWeight=aDependOnWeight
,
  EDIZM=aEDIZM
,
  Code1C=aCode1C
  where  PEKD_SRVID = aPEKD_SRVID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:PEKD_SRV',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=PEKD_SRV');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=PEKD_SRV');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'PEKD_SRV',
 aVERB=>'CREATEROW',  aThe_Resource=>aPEKD_SRVid,aLogInstanceID=>aInstanceID);
 insert into   PEKD_SRV
 (  PEKD_SRVID 
,InstanceID
,name

,DependOnWeight

,EDIZM

,Code1C

 ) values ( aPEKD_SRVID 
,aInstanceID
,aname

,aDependOnWeight

,aEDIZM

,aCode1C

 ); 
 PEKD_SRV_SINIT( aCURSESSION,aPEKD_SRVid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure PEKD_SRV_PARENT /*Дополнительные услуги*/ (
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
  select  INSTANCEID into aParentID from PEKD_SRV where  PEKD_SRVid=aRowID;
 end; 


procedure PEKD_SRV_ISLOCKED /*Дополнительные услуги*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from PEKD_SRV where PEKD_SRVid=aRowID;
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
  PEKD_SRV_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin PEKD.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure PEKD_SRV_LOCK /*Дополнительные услуги*/ (
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
 PEKD_SRV_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  PEKD_SRV_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from PEKD_SRV where PEKD_SRVid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=PEKD_SRV');
    return;
  end if;
   if  aLockMode =2  
   then   
    update PEKD_SRV set LockUserID =auserID ,LockSessionID =null where PEKD_SRVid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update PEKD_SRV set LockUserID =null,LockSessionID =aCURSESSION  where PEKD_SRVid=aRowID;
     return;
   end if;
 end ;


procedure PEKD_SRV_HCL /*Дополнительные услуги*/ (
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


procedure PEKD_SRV_UNLOCK /*Дополнительные услуги*/ (
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
 PEKD_SRV_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update PEKD_SRV set LockUserID =null  where PEKD_SRVid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update PEKD_SRV set LockSessionID =null  where PEKD_SRVid=aRowID;
     return;
   end if;
 end; 


procedure PEKD_SRV_SINIT /*Дополнительные услуги*/ (
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
 select  SecurityStyleID into atmpID from PEKD_SRV where PEKD_SRVid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =PEKD_SRV');
    return;
  end if;
if aSecurityStyleID is null then
 PEKD_SRV_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update PEKD_SRV set securitystyleid =aStyleID where PEKD_SRVid = aRowID;
else 
 update PEKD_SRV set securitystyleid =aSecurityStyleID where PEKD_SRVid = aRowID;
end if; 
end ; 


procedure PEKD_SRV_propagate /*Дополнительные услуги*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from PEKD_SRV where PEKD_SRVid=aRowid;
end;


end PEKD;

/



