
/* --VRCP*/

 create or replace package body VRCP as

procedure VRCP_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='VRCP'
then
declare cursor child_VRCPSeeAlso is select VRCPSeeAlso.VRCPSeeAlsoid ID from VRCPSeeAlso where  VRCPSeeAlso.InstanceID = ainstanceid;
row_VRCPSeeAlso  child_VRCPSeeAlso%ROWTYPE;
begin
--open child_VRCPSeeAlso;
for row_VRCPSeeAlso in child_VRCPSeeAlso loop
 VRCPSeeAlso_DELETE (acursession,row_VRCPSeeAlso.id,aInstanceID);
end loop;
--close child_VRCPSeeAlso;
end;
declare cursor child_VRCPSpecial is select VRCPSpecial.VRCPSpecialid ID from VRCPSpecial where  VRCPSpecial.InstanceID = ainstanceid;
row_VRCPSpecial  child_VRCPSpecial%ROWTYPE;
begin
--open child_VRCPSpecial;
for row_VRCPSpecial in child_VRCPSpecial loop
 VRCPSpecial_DELETE (acursession,row_VRCPSpecial.id,aInstanceID);
end loop;
--close child_VRCPSpecial;
end;
declare cursor child_VRCPPresents is select VRCPPresents.VRCPPresentsid ID from VRCPPresents where  VRCPPresents.InstanceID = ainstanceid;
row_VRCPPresents  child_VRCPPresents%ROWTYPE;
begin
--open child_VRCPPresents;
for row_VRCPPresents in child_VRCPPresents loop
 VRCPPresents_DELETE (acursession,row_VRCPPresents.id,aInstanceID);
end loop;
--close child_VRCPPresents;
end;
declare cursor child_VRCPReports is select VRCPReports.VRCPReportsid ID from VRCPReports where  VRCPReports.InstanceID = ainstanceid;
row_VRCPReports  child_VRCPReports%ROWTYPE;
begin
--open child_VRCPReports;
for row_VRCPReports in child_VRCPReports loop
 VRCPReports_DELETE (acursession,row_VRCPReports.id,aInstanceID);
end loop;
--close child_VRCPReports;
end;
declare cursor child_VRCPDates is select VRCPDates.VRCPDatesid ID from VRCPDates where  VRCPDates.InstanceID = ainstanceid;
row_VRCPDates  child_VRCPDates%ROWTYPE;
begin
--open child_VRCPDates;
for row_VRCPDates in child_VRCPDates loop
 VRCPDates_DELETE (acursession,row_VRCPDates.id,aInstanceID);
end loop;
--close child_VRCPDates;
end;
declare cursor child_VRCPNeigborhood is select VRCPNeigborhood.VRCPNeigborhoodid ID from VRCPNeigborhood where  VRCPNeigborhood.InstanceID = ainstanceid;
row_VRCPNeigborhood  child_VRCPNeigborhood%ROWTYPE;
begin
--open child_VRCPNeigborhood;
for row_VRCPNeigborhood in child_VRCPNeigborhood loop
 VRCPNeigborhood_DELETE (acursession,row_VRCPNeigborhood.id,aInstanceID);
end loop;
--close child_VRCPNeigborhood;
end;
declare cursor child_VRCPInterest is select VRCPInterest.VRCPInterestid ID from VRCPInterest where  VRCPInterest.InstanceID = ainstanceid;
row_VRCPInterest  child_VRCPInterest%ROWTYPE;
begin
--open child_VRCPInterest;
for row_VRCPInterest in child_VRCPInterest loop
 VRCPInterest_DELETE (acursession,row_VRCPInterest.id,aInstanceID);
end loop;
--close child_VRCPInterest;
end;
declare cursor child_VRCPCommon is select VRCPCommon.VRCPCommonid ID from VRCPCommon where  VRCPCommon.InstanceID = ainstanceid;
row_VRCPCommon  child_VRCPCommon%ROWTYPE;
begin
--open child_VRCPCommon;
for row_VRCPCommon in child_VRCPCommon loop
 VRCPCommon_DELETE (acursession,row_VRCPCommon.id,aInstanceID);
end loop;
--close child_VRCPCommon;
end;
return;
<<del_error>>
return;
end if;
end;
procedure VRCP_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'VRCP'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_VRCPSeeAlso is select VRCPSeeAlso.VRCPSeeAlsoid ID from VRCPSeeAlso where  VRCPSeeAlso.InstanceID = arowid;
ROW_VRCPSeeAlso  lch_VRCPSeeAlso%ROWTYPE;
begin
--open lch_VRCPSeeAlso;
for row_VRCPSeeAlso in lch_VRCPSeeAlso loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPSeeAlso where VRCPSeeAlsoid=row_VRCPSeeAlso.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPSeeAlso;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPSeeAlso;
     return;
   end if; 
 end if; 
 VRCPSeeAlso_HCL (acursession,ROW_VRCPSeeAlso.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPSeeAlso;
   return;
 end if;
 end loop;
--close lch_VRCPSeeAlso;
end;
declare cursor lch_VRCPSpecial is select VRCPSpecial.VRCPSpecialid ID from VRCPSpecial where  VRCPSpecial.InstanceID = arowid;
ROW_VRCPSpecial  lch_VRCPSpecial%ROWTYPE;
begin
--open lch_VRCPSpecial;
for row_VRCPSpecial in lch_VRCPSpecial loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPSpecial where VRCPSpecialid=row_VRCPSpecial.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPSpecial;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPSpecial;
     return;
   end if; 
 end if; 
 VRCPSpecial_HCL (acursession,ROW_VRCPSpecial.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPSpecial;
   return;
 end if;
 end loop;
--close lch_VRCPSpecial;
end;
declare cursor lch_VRCPPresents is select VRCPPresents.VRCPPresentsid ID from VRCPPresents where  VRCPPresents.InstanceID = arowid;
ROW_VRCPPresents  lch_VRCPPresents%ROWTYPE;
begin
--open lch_VRCPPresents;
for row_VRCPPresents in lch_VRCPPresents loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPPresents where VRCPPresentsid=row_VRCPPresents.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPPresents;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPPresents;
     return;
   end if; 
 end if; 
 VRCPPresents_HCL (acursession,ROW_VRCPPresents.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPPresents;
   return;
 end if;
 end loop;
--close lch_VRCPPresents;
end;
declare cursor lch_VRCPReports is select VRCPReports.VRCPReportsid ID from VRCPReports where  VRCPReports.InstanceID = arowid;
ROW_VRCPReports  lch_VRCPReports%ROWTYPE;
begin
--open lch_VRCPReports;
for row_VRCPReports in lch_VRCPReports loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPReports where VRCPReportsid=row_VRCPReports.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPReports;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPReports;
     return;
   end if; 
 end if; 
 VRCPReports_HCL (acursession,ROW_VRCPReports.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPReports;
   return;
 end if;
 end loop;
--close lch_VRCPReports;
end;
declare cursor lch_VRCPDates is select VRCPDates.VRCPDatesid ID from VRCPDates where  VRCPDates.InstanceID = arowid;
ROW_VRCPDates  lch_VRCPDates%ROWTYPE;
begin
--open lch_VRCPDates;
for row_VRCPDates in lch_VRCPDates loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPDates where VRCPDatesid=row_VRCPDates.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPDates;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPDates;
     return;
   end if; 
 end if; 
 VRCPDates_HCL (acursession,ROW_VRCPDates.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPDates;
   return;
 end if;
 end loop;
--close lch_VRCPDates;
end;
declare cursor lch_VRCPNeigborhood is select VRCPNeigborhood.VRCPNeigborhoodid ID from VRCPNeigborhood where  VRCPNeigborhood.InstanceID = arowid;
ROW_VRCPNeigborhood  lch_VRCPNeigborhood%ROWTYPE;
begin
--open lch_VRCPNeigborhood;
for row_VRCPNeigborhood in lch_VRCPNeigborhood loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPNeigborhood where VRCPNeigborhoodid=row_VRCPNeigborhood.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPNeigborhood;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPNeigborhood;
     return;
   end if; 
 end if; 
 VRCPNeigborhood_HCL (acursession,ROW_VRCPNeigborhood.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPNeigborhood;
   return;
 end if;
 end loop;
--close lch_VRCPNeigborhood;
end;
declare cursor lch_VRCPInterest is select VRCPInterest.VRCPInterestid ID from VRCPInterest where  VRCPInterest.InstanceID = arowid;
ROW_VRCPInterest  lch_VRCPInterest%ROWTYPE;
begin
--open lch_VRCPInterest;
for row_VRCPInterest in lch_VRCPInterest loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPInterest where VRCPInterestid=row_VRCPInterest.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPInterest;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPInterest;
     return;
   end if; 
 end if; 
 VRCPInterest_HCL (acursession,ROW_VRCPInterest.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPInterest;
   return;
 end if;
 end loop;
--close lch_VRCPInterest;
end;
declare cursor lch_VRCPCommon is select VRCPCommon.VRCPCommonid ID from VRCPCommon where  VRCPCommon.InstanceID = arowid;
ROW_VRCPCommon  lch_VRCPCommon%ROWTYPE;
begin
--open lch_VRCPCommon;
for row_VRCPCommon in lch_VRCPCommon loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRCPCommon where VRCPCommonid=row_VRCPCommon.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRCPCommon;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRCPCommon;
     return;
   end if; 
 end if; 
 VRCPCommon_HCL (acursession,ROW_VRCPCommon.id,aisLocked);
 if aisLocked >2 then
   close lch_VRCPCommon;
   return;
 end if;
 end loop;
--close lch_VRCPCommon;
end;
 end if;
aIsLocked:=0;
end;
procedure VRCP_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'VRCP'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_VRCPSeeAlso is select VRCPSeeAlso.VRCPSeeAlsoid id from VRCPSeeAlso where  VRCPSeeAlso.InstanceID = arowid;
row_VRCPSeeAlso  pch_VRCPSeeAlso%ROWTYPE;
begin
--open pch_VRCPSeeAlso;
for row_VRCPSeeAlso in  pch_VRCPSeeAlso loop
 VRCPSeeAlso_SINIT( acursession,row_VRCPSeeAlso.id,assid);
 VRCPSeeAlso_propagate( acursession,row_VRCPSeeAlso.id);
end loop;
--close pch_VRCPSeeAlso;
end;
declare cursor pch_VRCPSpecial is select VRCPSpecial.VRCPSpecialid id from VRCPSpecial where  VRCPSpecial.InstanceID = arowid;
row_VRCPSpecial  pch_VRCPSpecial%ROWTYPE;
begin
--open pch_VRCPSpecial;
for row_VRCPSpecial in  pch_VRCPSpecial loop
 VRCPSpecial_SINIT( acursession,row_VRCPSpecial.id,assid);
 VRCPSpecial_propagate( acursession,row_VRCPSpecial.id);
end loop;
--close pch_VRCPSpecial;
end;
declare cursor pch_VRCPPresents is select VRCPPresents.VRCPPresentsid id from VRCPPresents where  VRCPPresents.InstanceID = arowid;
row_VRCPPresents  pch_VRCPPresents%ROWTYPE;
begin
--open pch_VRCPPresents;
for row_VRCPPresents in  pch_VRCPPresents loop
 VRCPPresents_SINIT( acursession,row_VRCPPresents.id,assid);
 VRCPPresents_propagate( acursession,row_VRCPPresents.id);
end loop;
--close pch_VRCPPresents;
end;
declare cursor pch_VRCPReports is select VRCPReports.VRCPReportsid id from VRCPReports where  VRCPReports.InstanceID = arowid;
row_VRCPReports  pch_VRCPReports%ROWTYPE;
begin
--open pch_VRCPReports;
for row_VRCPReports in  pch_VRCPReports loop
 VRCPReports_SINIT( acursession,row_VRCPReports.id,assid);
 VRCPReports_propagate( acursession,row_VRCPReports.id);
end loop;
--close pch_VRCPReports;
end;
declare cursor pch_VRCPDates is select VRCPDates.VRCPDatesid id from VRCPDates where  VRCPDates.InstanceID = arowid;
row_VRCPDates  pch_VRCPDates%ROWTYPE;
begin
--open pch_VRCPDates;
for row_VRCPDates in  pch_VRCPDates loop
 VRCPDates_SINIT( acursession,row_VRCPDates.id,assid);
 VRCPDates_propagate( acursession,row_VRCPDates.id);
end loop;
--close pch_VRCPDates;
end;
declare cursor pch_VRCPNeigborhood is select VRCPNeigborhood.VRCPNeigborhoodid id from VRCPNeigborhood where  VRCPNeigborhood.InstanceID = arowid;
row_VRCPNeigborhood  pch_VRCPNeigborhood%ROWTYPE;
begin
--open pch_VRCPNeigborhood;
for row_VRCPNeigborhood in  pch_VRCPNeigborhood loop
 VRCPNeigborhood_SINIT( acursession,row_VRCPNeigborhood.id,assid);
 VRCPNeigborhood_propagate( acursession,row_VRCPNeigborhood.id);
end loop;
--close pch_VRCPNeigborhood;
end;
declare cursor pch_VRCPInterest is select VRCPInterest.VRCPInterestid id from VRCPInterest where  VRCPInterest.InstanceID = arowid;
row_VRCPInterest  pch_VRCPInterest%ROWTYPE;
begin
--open pch_VRCPInterest;
for row_VRCPInterest in  pch_VRCPInterest loop
 VRCPInterest_SINIT( acursession,row_VRCPInterest.id,assid);
 VRCPInterest_propagate( acursession,row_VRCPInterest.id);
end loop;
--close pch_VRCPInterest;
end;
declare cursor pch_VRCPCommon is select VRCPCommon.VRCPCommonid id from VRCPCommon where  VRCPCommon.InstanceID = arowid;
row_VRCPCommon  pch_VRCPCommon%ROWTYPE;
begin
--open pch_VRCPCommon;
for row_VRCPCommon in  pch_VRCPCommon loop
 VRCPCommon_SINIT( acursession,row_VRCPCommon.id,assid);
 VRCPCommon_propagate( acursession,row_VRCPCommon.id);
end loop;
--close pch_VRCPCommon;
end;
 end if; 
end;



procedure VRCPSeeAlso_BRIEF  (
 aCURSESSION CHAR,
 aVRCPSeeAlsoid CHAR,
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
if aVRCPSeeAlsoid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPSeeAlso where VRCPSeeAlsoID=aVRCPSeeAlsoID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPSeeAlso where VRCPSeeAlsoid=aVRCPSeeAlsoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPSeeAlso');
    return;
  end if;
  aBRIEF:=func.VRCPSeeAlso_BRIEF_F(aVRCPSeeAlsoid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPSeeAlso_DELETE /*Смотри также*/ (
 aCURSESSION CHAR,
 aVRCPSeeAlsoid CHAR,
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
select count(*) into existsCnt from VRCPSeeAlso where VRCPSeeAlsoID=aVRCPSeeAlsoID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPSeeAlso where VRCPSeeAlsoid=aVRCPSeeAlsoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPSeeAlso',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPSeeAlso');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPSeeAlso_ISLOCKED( acursession=>acursession,aROWID=>aVRCPSeeAlsoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPSeeAlso');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPSeeAlso',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPSeeAlsoid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPSeeAlso is select  instanceid ID from instance where OwnerPartName ='VRCPSeeAlso' and OwnerRowID=aVRCPSeeAlsoid;
row_VRCPSeeAlso  chld_VRCPSeeAlso%ROWTYPE;
begin
--open chld_VRCPSeeAlso;
for row_VRCPSeeAlso in chld_VRCPSeeAlso loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPSeeAlso.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPSeeAlso.id);
end loop;
--close chld_VRCPSeeAlso;
end ;
  delete from  VRCPSeeAlso 
  where  VRCPSeeAlsoID = aVRCPSeeAlsoID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Смотри также*/
procedure VRCPSeeAlso_SAVE /*Смотри также*/ (
 aCURSESSION CHAR,
 aVRCPSeeAlsoid CHAR,
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
select count(*) into existsCnt from VRCPSeeAlso where VRCPSeeAlsoID=aVRCPSeeAlsoID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPSeeAlso where VRCPSeeAlsoid=aVRCPSeeAlsoID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPSeeAlso',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPSeeAlso');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPSeeAlso_ISLOCKED( acursession=>acursession,aROWID=>aVRCPSeeAlsoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPSeeAlso');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPSeeAlso',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPSeeAlsoid,aLogInstanceID=>aInstanceID);
 update  VRCPSeeAlso set ChangeStamp=sysdate
,
  Document=aDocument
,
  the_Comment=athe_Comment
  where  VRCPSeeAlsoID = aVRCPSeeAlsoID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPSeeAlso',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPSeeAlso');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPSeeAlso');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPSeeAlso',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPSeeAlsoid,aLogInstanceID=>aInstanceID);
 insert into   VRCPSeeAlso
 (  VRCPSeeAlsoID 
,InstanceID
,Document

,the_Comment

 ) values ( aVRCPSeeAlsoID 
,aInstanceID
,aDocument

,athe_Comment

 ); 
 VRCPSeeAlso_SINIT( aCURSESSION,aVRCPSeeAlsoid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPSeeAlso_PARENT /*Смотри также*/ (
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
  select  INSTANCEID into aParentID from VRCPSeeAlso where  VRCPSeeAlsoid=aRowID;
 end; 


procedure VRCPSeeAlso_ISLOCKED /*Смотри также*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPSeeAlso where VRCPSeeAlsoid=aRowID;
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
  VRCPSeeAlso_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRCP.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPSeeAlso_LOCK /*Смотри также*/ (
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
 VRCPSeeAlso_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPSeeAlso_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPSeeAlso where VRCPSeeAlsoid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPSeeAlso');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPSeeAlso set LockUserID =auserID ,LockSessionID =null where VRCPSeeAlsoid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPSeeAlso set LockUserID =null,LockSessionID =aCURSESSION  where VRCPSeeAlsoid=aRowID;
     return;
   end if;
 end ;


procedure VRCPSeeAlso_HCL /*Смотри также*/ (
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


procedure VRCPSeeAlso_UNLOCK /*Смотри также*/ (
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
 VRCPSeeAlso_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPSeeAlso set LockUserID =null  where VRCPSeeAlsoid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPSeeAlso set LockSessionID =null  where VRCPSeeAlsoid=aRowID;
     return;
   end if;
 end; 


procedure VRCPSeeAlso_SINIT /*Смотри также*/ (
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
 select  SecurityStyleID into atmpID from VRCPSeeAlso where VRCPSeeAlsoid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPSeeAlso');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPSeeAlso_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPSeeAlso set securitystyleid =aStyleID where VRCPSeeAlsoid = aRowID;
else 
 update VRCPSeeAlso set securitystyleid =aSecurityStyleID where VRCPSeeAlsoid = aRowID;
end if; 
end ; 


procedure VRCPSeeAlso_propagate /*Смотри также*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPSeeAlso where VRCPSeeAlsoid=aRowid;
end;



procedure VRCPSpecial_BRIEF  (
 aCURSESSION CHAR,
 aVRCPSpecialid CHAR,
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
if aVRCPSpecialid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPSpecial where VRCPSpecialID=aVRCPSpecialID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPSpecial where VRCPSpecialid=aVRCPSpecialID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPSpecial');
    return;
  end if;
  aBRIEF:=func.VRCPSpecial_BRIEF_F(aVRCPSpecialid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPSpecial_DELETE /*Факты*/ (
 aCURSESSION CHAR,
 aVRCPSpecialid CHAR,
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
select count(*) into existsCnt from VRCPSpecial where VRCPSpecialID=aVRCPSpecialID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPSpecial where VRCPSpecialid=aVRCPSpecialID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPSpecial',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPSpecial');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPSpecial_ISLOCKED( acursession=>acursession,aROWID=>aVRCPSpecialid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPSpecial');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPSpecial',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPSpecialid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPSpecial is select  instanceid ID from instance where OwnerPartName ='VRCPSpecial' and OwnerRowID=aVRCPSpecialid;
row_VRCPSpecial  chld_VRCPSpecial%ROWTYPE;
begin
--open chld_VRCPSpecial;
for row_VRCPSpecial in chld_VRCPSpecial loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPSpecial.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPSpecial.id);
end loop;
--close chld_VRCPSpecial;
end ;
  delete from  VRCPSpecial 
  where  VRCPSpecialID = aVRCPSpecialID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Факты*/
procedure VRCPSpecial_SAVE /*Факты*/ (
 aCURSESSION CHAR,
 aVRCPSpecialid CHAR,
aInstanceID CHAR 
,aDateOF
 DATE/* Дата *//* Дата */
,aInfo VARCHAR2 := null /* Описание *//* Описание */
,atheFile VARCHAR2 := null /* Файл */
,atheFile_EXT varchar2 /* Файл */
,aInfoSrc VARCHAR2 := null /* Источник *//* Источник */
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
select count(*) into existsCnt from VRCPSpecial where VRCPSpecialID=aVRCPSpecialID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPSpecial where VRCPSpecialid=aVRCPSpecialID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPSpecial',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPSpecial');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPSpecial_ISLOCKED( acursession=>acursession,aROWID=>aVRCPSpecialid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPSpecial');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPSpecial',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPSpecialid,aLogInstanceID=>aInstanceID);
 update  VRCPSpecial set ChangeStamp=sysdate
,
  DateOF=aDateOF
,
  Info=aInfo
,
  theFile=atheFile
,theFile_EXT=
atheFile_EXT 
,
  InfoSrc=aInfoSrc
  where  VRCPSpecialID = aVRCPSpecialID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPSpecial',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPSpecial');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPSpecial');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPSpecial',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPSpecialid,aLogInstanceID=>aInstanceID);
 insert into   VRCPSpecial
 (  VRCPSpecialID 
,InstanceID
,DateOF

,Info

,theFile

,theFile_EXT
,InfoSrc

 ) values ( aVRCPSpecialID 
,aInstanceID
,aDateOF

,aInfo

,atheFile

,atheFile_EXT
,aInfoSrc

 ); 
 VRCPSpecial_SINIT( aCURSESSION,aVRCPSpecialid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPSpecial_PARENT /*Факты*/ (
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
  select  INSTANCEID into aParentID from VRCPSpecial where  VRCPSpecialid=aRowID;
 end; 


procedure VRCPSpecial_ISLOCKED /*Факты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPSpecial where VRCPSpecialid=aRowID;
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
  VRCPSpecial_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRCP.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPSpecial_LOCK /*Факты*/ (
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
 VRCPSpecial_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPSpecial_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPSpecial where VRCPSpecialid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPSpecial');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPSpecial set LockUserID =auserID ,LockSessionID =null where VRCPSpecialid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPSpecial set LockUserID =null,LockSessionID =aCURSESSION  where VRCPSpecialid=aRowID;
     return;
   end if;
 end ;


procedure VRCPSpecial_HCL /*Факты*/ (
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


procedure VRCPSpecial_UNLOCK /*Факты*/ (
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
 VRCPSpecial_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPSpecial set LockUserID =null  where VRCPSpecialid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPSpecial set LockSessionID =null  where VRCPSpecialid=aRowID;
     return;
   end if;
 end; 


procedure VRCPSpecial_SINIT /*Факты*/ (
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
 select  SecurityStyleID into atmpID from VRCPSpecial where VRCPSpecialid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPSpecial');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPSpecial_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPSpecial set securitystyleid =aStyleID where VRCPSpecialid = aRowID;
else 
 update VRCPSpecial set securitystyleid =aSecurityStyleID where VRCPSpecialid = aRowID;
end if; 
end ; 


procedure VRCPSpecial_propagate /*Факты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPSpecial where VRCPSpecialid=aRowid;
end;



procedure VRCPPresents_BRIEF  (
 aCURSESSION CHAR,
 aVRCPPresentsid CHAR,
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
if aVRCPPresentsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPPresents where VRCPPresentsID=aVRCPPresentsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPPresents where VRCPPresentsid=aVRCPPresentsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPPresents');
    return;
  end if;
  aBRIEF:=func.VRCPPresents_BRIEF_F(aVRCPPresentsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPPresents_DELETE /*Подарки*/ (
 aCURSESSION CHAR,
 aVRCPPresentsid CHAR,
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
select count(*) into existsCnt from VRCPPresents where VRCPPresentsID=aVRCPPresentsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPPresents where VRCPPresentsid=aVRCPPresentsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPPresents',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPPresents');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPPresents_ISLOCKED( acursession=>acursession,aROWID=>aVRCPPresentsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPPresents');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPPresents',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPPresentsid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPPresents is select  instanceid ID from instance where OwnerPartName ='VRCPPresents' and OwnerRowID=aVRCPPresentsid;
row_VRCPPresents  chld_VRCPPresents%ROWTYPE;
begin
--open chld_VRCPPresents;
for row_VRCPPresents in chld_VRCPPresents loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPPresents.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPPresents.id);
end loop;
--close chld_VRCPPresents;
end ;
  delete from  VRCPPresents 
  where  VRCPPresentsID = aVRCPPresentsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Подарки*/
procedure VRCPPresents_SAVE /*Подарки*/ (
 aCURSESSION CHAR,
 aVRCPPresentsid CHAR,
aInstanceID CHAR 
,aDateOF
 DATE/* Дата *//* Дата */
,aGift
 VARCHAR2 := null /* Подарок *//* Подарок */
,aPresentCost
 NUMBER := null /* Цена подарка *//* Цена подарка */
,areason VARCHAR2 := null /* Повод *//* Повод */
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
select count(*) into existsCnt from VRCPPresents where VRCPPresentsID=aVRCPPresentsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPPresents where VRCPPresentsid=aVRCPPresentsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPPresents',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPPresents');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPPresents_ISLOCKED( acursession=>acursession,aROWID=>aVRCPPresentsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPPresents');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPPresents',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPPresentsid,aLogInstanceID=>aInstanceID);
 update  VRCPPresents set ChangeStamp=sysdate
,
  DateOF=aDateOF
,
  Gift=aGift
,
  PresentCost=aPresentCost
,
  reason=areason
  where  VRCPPresentsID = aVRCPPresentsID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPPresents',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPPresents');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPPresents');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPPresents',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPPresentsid,aLogInstanceID=>aInstanceID);
 insert into   VRCPPresents
 (  VRCPPresentsID 
,InstanceID
,DateOF

,Gift

,PresentCost

,reason

 ) values ( aVRCPPresentsID 
,aInstanceID
,aDateOF

,aGift

,aPresentCost

,areason

 ); 
 VRCPPresents_SINIT( aCURSESSION,aVRCPPresentsid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPPresents_PARENT /*Подарки*/ (
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
  select  INSTANCEID into aParentID from VRCPPresents where  VRCPPresentsid=aRowID;
 end; 


procedure VRCPPresents_ISLOCKED /*Подарки*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPPresents where VRCPPresentsid=aRowID;
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
  VRCPPresents_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRCP.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPPresents_LOCK /*Подарки*/ (
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
 VRCPPresents_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPPresents_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPPresents where VRCPPresentsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPPresents');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPPresents set LockUserID =auserID ,LockSessionID =null where VRCPPresentsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPPresents set LockUserID =null,LockSessionID =aCURSESSION  where VRCPPresentsid=aRowID;
     return;
   end if;
 end ;


procedure VRCPPresents_HCL /*Подарки*/ (
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


procedure VRCPPresents_UNLOCK /*Подарки*/ (
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
 VRCPPresents_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPPresents set LockUserID =null  where VRCPPresentsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPPresents set LockSessionID =null  where VRCPPresentsid=aRowID;
     return;
   end if;
 end; 


procedure VRCPPresents_SINIT /*Подарки*/ (
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
 select  SecurityStyleID into atmpID from VRCPPresents where VRCPPresentsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPPresents');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPPresents_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPPresents set securitystyleid =aStyleID where VRCPPresentsid = aRowID;
else 
 update VRCPPresents set securitystyleid =aSecurityStyleID where VRCPPresentsid = aRowID;
end if; 
end ; 


procedure VRCPPresents_propagate /*Подарки*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPPresents where VRCPPresentsid=aRowid;
end;



procedure VRCPReports_BRIEF  (
 aCURSESSION CHAR,
 aVRCPReportsid CHAR,
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
if aVRCPReportsid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPReports where VRCPReportsID=aVRCPReportsID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPReports where VRCPReportsid=aVRCPReportsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPReports');
    return;
  end if;
  aBRIEF:=func.VRCPReports_BRIEF_F(aVRCPReportsid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPReports_DELETE /*Отчеты*/ (
 aCURSESSION CHAR,
 aVRCPReportsid CHAR,
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
select count(*) into existsCnt from VRCPReports where VRCPReportsID=aVRCPReportsID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPReports where VRCPReportsid=aVRCPReportsID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPReports',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPReports');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPReports_ISLOCKED( acursession=>acursession,aROWID=>aVRCPReportsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPReports');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPReports',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPReportsid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPReports is select  instanceid ID from instance where OwnerPartName ='VRCPReports' and OwnerRowID=aVRCPReportsid;
row_VRCPReports  chld_VRCPReports%ROWTYPE;
begin
--open chld_VRCPReports;
for row_VRCPReports in chld_VRCPReports loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPReports.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPReports.id);
end loop;
--close chld_VRCPReports;
end ;
  delete from  VRCPReports 
  where  VRCPReportsID = aVRCPReportsID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Отчеты*/
procedure VRCPReports_SAVE /*Отчеты*/ (
 aCURSESSION CHAR,
 aVRCPReportsid CHAR,
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
select count(*) into existsCnt from VRCPReports where VRCPReportsID=aVRCPReportsID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPReports where VRCPReportsid=aVRCPReportsID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPReports',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPReports');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPReports_ISLOCKED( acursession=>acursession,aROWID=>aVRCPReportsid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPReports');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPReports',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPReportsid,aLogInstanceID=>aInstanceID);
 update  VRCPReports set ChangeStamp=sysdate
,
  Report=aReport
  where  VRCPReportsID = aVRCPReportsID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPReports',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPReports');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPReports');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPReports',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPReportsid,aLogInstanceID=>aInstanceID);
 insert into   VRCPReports
 (  VRCPReportsID 
,InstanceID
,Report

 ) values ( aVRCPReportsID 
,aInstanceID
,aReport

 ); 
 VRCPReports_SINIT( aCURSESSION,aVRCPReportsid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPReports_PARENT /*Отчеты*/ (
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
  select  INSTANCEID into aParentID from VRCPReports where  VRCPReportsid=aRowID;
 end; 


procedure VRCPReports_ISLOCKED /*Отчеты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPReports where VRCPReportsid=aRowID;
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
  VRCPReports_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRCP.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPReports_LOCK /*Отчеты*/ (
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
 VRCPReports_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPReports_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPReports where VRCPReportsid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPReports');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPReports set LockUserID =auserID ,LockSessionID =null where VRCPReportsid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPReports set LockUserID =null,LockSessionID =aCURSESSION  where VRCPReportsid=aRowID;
     return;
   end if;
 end ;


procedure VRCPReports_HCL /*Отчеты*/ (
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


procedure VRCPReports_UNLOCK /*Отчеты*/ (
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
 VRCPReports_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPReports set LockUserID =null  where VRCPReportsid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPReports set LockSessionID =null  where VRCPReportsid=aRowID;
     return;
   end if;
 end; 


procedure VRCPReports_SINIT /*Отчеты*/ (
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
 select  SecurityStyleID into atmpID from VRCPReports where VRCPReportsid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPReports');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPReports_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPReports set securitystyleid =aStyleID where VRCPReportsid = aRowID;
else 
 update VRCPReports set securitystyleid =aSecurityStyleID where VRCPReportsid = aRowID;
end if; 
end ; 


procedure VRCPReports_propagate /*Отчеты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPReports where VRCPReportsid=aRowid;
end;



procedure VRCPDates_BRIEF  (
 aCURSESSION CHAR,
 aVRCPDatesid CHAR,
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
if aVRCPDatesid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPDates where VRCPDatesID=aVRCPDatesID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPDates where VRCPDatesid=aVRCPDatesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPDates');
    return;
  end if;
  aBRIEF:=func.VRCPDates_BRIEF_F(aVRCPDatesid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPDates_DELETE /*Памятные даты*/ (
 aCURSESSION CHAR,
 aVRCPDatesid CHAR,
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
select count(*) into existsCnt from VRCPDates where VRCPDatesID=aVRCPDatesID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPDates where VRCPDatesid=aVRCPDatesID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPDates',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPDates');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPDates_ISLOCKED( acursession=>acursession,aROWID=>aVRCPDatesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPDates');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPDates',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPDatesid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPDates is select  instanceid ID from instance where OwnerPartName ='VRCPDates' and OwnerRowID=aVRCPDatesid;
row_VRCPDates  chld_VRCPDates%ROWTYPE;
begin
--open chld_VRCPDates;
for row_VRCPDates in chld_VRCPDates loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPDates.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPDates.id);
end loop;
--close chld_VRCPDates;
end ;
  delete from  VRCPDates 
  where  VRCPDatesID = aVRCPDatesID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Памятные даты*/
procedure VRCPDates_SAVE /*Памятные даты*/ (
 aCURSESSION CHAR,
 aVRCPDatesid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* Дата *//* Дата */
,aDateEvent
 VARCHAR2/* Событие *//* Событие */
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
select count(*) into existsCnt from VRCPDates where VRCPDatesID=aVRCPDatesID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPDates where VRCPDatesid=aVRCPDatesID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPDates',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPDates');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPDates_ISLOCKED( acursession=>acursession,aROWID=>aVRCPDatesid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPDates');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPDates',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPDatesid,aLogInstanceID=>aInstanceID);
 update  VRCPDates set ChangeStamp=sysdate
,
  DateOf=aDateOf
,
  DateEvent=aDateEvent
  where  VRCPDatesID = aVRCPDatesID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPDates',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPDates');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPDates');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPDates',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPDatesid,aLogInstanceID=>aInstanceID);
 insert into   VRCPDates
 (  VRCPDatesID 
,InstanceID
,DateOf

,DateEvent

 ) values ( aVRCPDatesID 
,aInstanceID
,aDateOf

,aDateEvent

 ); 
 VRCPDates_SINIT( aCURSESSION,aVRCPDatesid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPDates_PARENT /*Памятные даты*/ (
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
  select  INSTANCEID into aParentID from VRCPDates where  VRCPDatesid=aRowID;
 end; 


procedure VRCPDates_ISLOCKED /*Памятные даты*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPDates where VRCPDatesid=aRowID;
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
  VRCPDates_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRCP.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPDates_LOCK /*Памятные даты*/ (
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
 VRCPDates_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPDates_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPDates where VRCPDatesid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPDates');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPDates set LockUserID =auserID ,LockSessionID =null where VRCPDatesid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPDates set LockUserID =null,LockSessionID =aCURSESSION  where VRCPDatesid=aRowID;
     return;
   end if;
 end ;


procedure VRCPDates_HCL /*Памятные даты*/ (
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


procedure VRCPDates_UNLOCK /*Памятные даты*/ (
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
 VRCPDates_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPDates set LockUserID =null  where VRCPDatesid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPDates set LockSessionID =null  where VRCPDatesid=aRowID;
     return;
   end if;
 end; 


procedure VRCPDates_SINIT /*Памятные даты*/ (
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
 select  SecurityStyleID into atmpID from VRCPDates where VRCPDatesid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPDates');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPDates_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPDates set securitystyleid =aStyleID where VRCPDatesid = aRowID;
else 
 update VRCPDates set securitystyleid =aSecurityStyleID where VRCPDatesid = aRowID;
end if; 
end ; 


procedure VRCPDates_propagate /*Памятные даты*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPDates where VRCPDatesid=aRowid;
end;



procedure VRCPNeigborhood_BRIEF  (
 aCURSESSION CHAR,
 aVRCPNeigborhoodid CHAR,
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
if aVRCPNeigborhoodid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPNeigborhood where VRCPNeigborhoodID=aVRCPNeigborhoodID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPNeigborhood where VRCPNeigborhoodid=aVRCPNeigborhoodID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPNeigborhood');
    return;
  end if;
  aBRIEF:=func.VRCPNeigborhood_BRIEF_F(aVRCPNeigborhoodid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPNeigborhood_DELETE /*Родственники*/ (
 aCURSESSION CHAR,
 aVRCPNeigborhoodid CHAR,
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
select count(*) into existsCnt from VRCPNeigborhood where VRCPNeigborhoodID=aVRCPNeigborhoodID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPNeigborhood where VRCPNeigborhoodid=aVRCPNeigborhoodID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPNeigborhood',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPNeigborhood');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPNeigborhood_ISLOCKED( acursession=>acursession,aROWID=>aVRCPNeigborhoodid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPNeigborhood');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPNeigborhood',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPNeigborhoodid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPNeigborhood is select  instanceid ID from instance where OwnerPartName ='VRCPNeigborhood' and OwnerRowID=aVRCPNeigborhoodid;
row_VRCPNeigborhood  chld_VRCPNeigborhood%ROWTYPE;
begin
--open chld_VRCPNeigborhood;
for row_VRCPNeigborhood in chld_VRCPNeigborhood loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPNeigborhood.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPNeigborhood.id);
end loop;
--close chld_VRCPNeigborhood;
end ;
  delete from  VRCPNeigborhood 
  where  VRCPNeigborhoodID = aVRCPNeigborhoodID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Родственники*/
procedure VRCPNeigborhood_SAVE /*Родственники*/ (
 aCURSESSION CHAR,
 aVRCPNeigborhoodid CHAR,
aInstanceID CHAR 
,athe_Level
 VARCHAR2 := null /* Степень родства *//* Степень родства */
,aperson CHAR := null /* Описание *//* Описание */
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
select count(*) into existsCnt from VRCPNeigborhood where VRCPNeigborhoodID=aVRCPNeigborhoodID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPNeigborhood where VRCPNeigborhoodid=aVRCPNeigborhoodID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPNeigborhood',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPNeigborhood');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPNeigborhood_ISLOCKED( acursession=>acursession,aROWID=>aVRCPNeigborhoodid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPNeigborhood');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPNeigborhood',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPNeigborhoodid,aLogInstanceID=>aInstanceID);
 update  VRCPNeigborhood set ChangeStamp=sysdate
,
  the_Level=athe_Level
,
  person=aperson
  where  VRCPNeigborhoodID = aVRCPNeigborhoodID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPNeigborhood',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPNeigborhood');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPNeigborhood');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPNeigborhood',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPNeigborhoodid,aLogInstanceID=>aInstanceID);
 insert into   VRCPNeigborhood
 (  VRCPNeigborhoodID 
,InstanceID
,the_Level

,person

 ) values ( aVRCPNeigborhoodID 
,aInstanceID
,athe_Level

,aperson

 ); 
 VRCPNeigborhood_SINIT( aCURSESSION,aVRCPNeigborhoodid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPNeigborhood_PARENT /*Родственники*/ (
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
  select  INSTANCEID into aParentID from VRCPNeigborhood where  VRCPNeigborhoodid=aRowID;
 end; 


procedure VRCPNeigborhood_ISLOCKED /*Родственники*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPNeigborhood where VRCPNeigborhoodid=aRowID;
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
  VRCPNeigborhood_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRCP.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPNeigborhood_LOCK /*Родственники*/ (
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
 VRCPNeigborhood_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPNeigborhood_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPNeigborhood where VRCPNeigborhoodid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPNeigborhood');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPNeigborhood set LockUserID =auserID ,LockSessionID =null where VRCPNeigborhoodid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPNeigborhood set LockUserID =null,LockSessionID =aCURSESSION  where VRCPNeigborhoodid=aRowID;
     return;
   end if;
 end ;


procedure VRCPNeigborhood_HCL /*Родственники*/ (
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


procedure VRCPNeigborhood_UNLOCK /*Родственники*/ (
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
 VRCPNeigborhood_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPNeigborhood set LockUserID =null  where VRCPNeigborhoodid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPNeigborhood set LockSessionID =null  where VRCPNeigborhoodid=aRowID;
     return;
   end if;
 end; 


procedure VRCPNeigborhood_SINIT /*Родственники*/ (
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
 select  SecurityStyleID into atmpID from VRCPNeigborhood where VRCPNeigborhoodid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPNeigborhood');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPNeigborhood_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPNeigborhood set securitystyleid =aStyleID where VRCPNeigborhoodid = aRowID;
else 
 update VRCPNeigborhood set securitystyleid =aSecurityStyleID where VRCPNeigborhoodid = aRowID;
end if; 
end ; 


procedure VRCPNeigborhood_propagate /*Родственники*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPNeigborhood where VRCPNeigborhoodid=aRowid;
end;



procedure VRCPInterest_BRIEF  (
 aCURSESSION CHAR,
 aVRCPInterestid CHAR,
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
if aVRCPInterestid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPInterest where VRCPInterestID=aVRCPInterestID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPInterest where VRCPInterestid=aVRCPInterestID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPInterest');
    return;
  end if;
  aBRIEF:=func.VRCPInterest_BRIEF_F(aVRCPInterestid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPInterest_DELETE /*Увлечения*/ (
 aCURSESSION CHAR,
 aVRCPInterestid CHAR,
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
select count(*) into existsCnt from VRCPInterest where VRCPInterestID=aVRCPInterestID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPInterest where VRCPInterestid=aVRCPInterestID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPInterest',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPInterest');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPInterest_ISLOCKED( acursession=>acursession,aROWID=>aVRCPInterestid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPInterest');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPInterest',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPInterestid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPInterest is select  instanceid ID from instance where OwnerPartName ='VRCPInterest' and OwnerRowID=aVRCPInterestid;
row_VRCPInterest  chld_VRCPInterest%ROWTYPE;
begin
--open chld_VRCPInterest;
for row_VRCPInterest in chld_VRCPInterest loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPInterest.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPInterest.id);
end loop;
--close chld_VRCPInterest;
end ;
  delete from  VRCPInterest 
  where  VRCPInterestID = aVRCPInterestID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Увлечения*/
procedure VRCPInterest_SAVE /*Увлечения*/ (
 aCURSESSION CHAR,
 aVRCPInterestid CHAR,
aInstanceID CHAR 
,aInfo VARCHAR2/* Описание *//* Описание */
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
select count(*) into existsCnt from VRCPInterest where VRCPInterestID=aVRCPInterestID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPInterest where VRCPInterestid=aVRCPInterestID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPInterest',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPInterest');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPInterest_ISLOCKED( acursession=>acursession,aROWID=>aVRCPInterestid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPInterest');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPInterest',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPInterestid,aLogInstanceID=>aInstanceID);
 update  VRCPInterest set ChangeStamp=sysdate
,
  Info=aInfo
  where  VRCPInterestID = aVRCPInterestID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPInterest',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPInterest');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPInterest');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPInterest',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPInterestid,aLogInstanceID=>aInstanceID);
 insert into   VRCPInterest
 (  VRCPInterestID 
,InstanceID
,Info

 ) values ( aVRCPInterestID 
,aInstanceID
,aInfo

 ); 
 VRCPInterest_SINIT( aCURSESSION,aVRCPInterestid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPInterest_PARENT /*Увлечения*/ (
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
  select  INSTANCEID into aParentID from VRCPInterest where  VRCPInterestid=aRowID;
 end; 


procedure VRCPInterest_ISLOCKED /*Увлечения*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPInterest where VRCPInterestid=aRowID;
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
  VRCPInterest_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRCP.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPInterest_LOCK /*Увлечения*/ (
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
 VRCPInterest_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPInterest_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPInterest where VRCPInterestid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPInterest');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPInterest set LockUserID =auserID ,LockSessionID =null where VRCPInterestid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPInterest set LockUserID =null,LockSessionID =aCURSESSION  where VRCPInterestid=aRowID;
     return;
   end if;
 end ;


procedure VRCPInterest_HCL /*Увлечения*/ (
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


procedure VRCPInterest_UNLOCK /*Увлечения*/ (
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
 VRCPInterest_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPInterest set LockUserID =null  where VRCPInterestid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPInterest set LockSessionID =null  where VRCPInterestid=aRowID;
     return;
   end if;
 end; 


procedure VRCPInterest_SINIT /*Увлечения*/ (
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
 select  SecurityStyleID into atmpID from VRCPInterest where VRCPInterestid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPInterest');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPInterest_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPInterest set securitystyleid =aStyleID where VRCPInterestid = aRowID;
else 
 update VRCPInterest set securitystyleid =aSecurityStyleID where VRCPInterestid = aRowID;
end if; 
end ; 


procedure VRCPInterest_propagate /*Увлечения*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPInterest where VRCPInterestid=aRowid;
end;



procedure VRCPCommon_BRIEF  (
 aCURSESSION CHAR,
 aVRCPCommonid CHAR,
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
if aVRCPCommonid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRCPCommon where VRCPCommonID=aVRCPCommonID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRCPCommon where VRCPCommonid=aVRCPCommonID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRCPCommon');
    return;
  end if;
  aBRIEF:=func.VRCPCommon_BRIEF_F(aVRCPCommonid);
else
  aBRIEF:= 'неверный идентификатор';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRCPCommon_DELETE /*Общая информация*/ (
 aCURSESSION CHAR,
 aVRCPCommonid CHAR,
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
select count(*) into existsCnt from VRCPCommon where VRCPCommonID=aVRCPCommonID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRCPCommon where VRCPCommonid=aVRCPCommonID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRCPCommon',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'Нет прав на удаление. Раздел=VRCPCommon');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPCommon_ISLOCKED( acursession=>acursession,aROWID=>aVRCPCommonid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем. Раздел=VRCPCommon');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRCPCommon',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRCPCommonid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRCPCommon is select  instanceid ID from instance where OwnerPartName ='VRCPCommon' and OwnerRowID=aVRCPCommonid;
row_VRCPCommon  chld_VRCPCommon%ROWTYPE;
begin
--open chld_VRCPCommon;
for row_VRCPCommon in chld_VRCPCommon loop
 Kernel.INSTANCE_OWNER (acursession,row_VRCPCommon.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRCPCommon.id);
end loop;
--close chld_VRCPCommon;
end ;
  delete from  VRCPCommon 
  where  VRCPCommonID = aVRCPCommonID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*Общая информация*/
procedure VRCPCommon_SAVE /*Общая информация*/ (
 aCURSESSION CHAR,
 aVRCPCommonid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* Наша организация *//* Наша организация */
,aFamily
 VARCHAR2/* Фамилия *//* Фамилия */
,aName
 VARCHAR2/* Имя *//* Имя */
,aSurName
 VARCHAR2 := null /* Отчество *//* Отчество */
,aPrivelegie VARCHAR2 := null /* Звание *//* Звание */
,aphone
 VARCHAR2 := null /* Телефон *//* Телефон */
,aemail VARCHAR2 := null /* e-mail *//* e-mail */
,afax
 VARCHAR2 := null /* Факс *//* Факс */
,aLoyality CHAR := null /* Лояльность *//* Лояльность */
,athe_Comment VARCHAR2 := null /* Примечания *//* Примечания */
,aCurator CHAR := null /* Ответственный *//* Ответственный */
,amobile
 VARCHAR2 := null /* Мобильный телефон *//* Мобильный телефон */
,aPersonDeYuro
 NUMBER := null /* Официальный представитель *//* Официальный представитель */
,aActionReason
 VARCHAR2 := null /* Действует на основании *//* Действует на основании */
,aActionStart
 DATE := null /* Начало действия доверености *//* Начало действия доверености */
,aActionEnd
 DATE := null /* Конец действия доверенности *//* Конец действия доверенности */
,aPassportInfo VARCHAR2 := null /* Паспортные данные *//* Паспортные данные */
,aAddress VARCHAR2 := null /* Адрес *//* Адрес */
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
select count(*) into existsCnt from VRCPCommon where VRCPCommonID=aVRCPCommonID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRCPCommon where VRCPCommonid=aVRCPCommonID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRCPCommon',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на модификацию. Раздел=VRCPCommon');
      return;
    end if;
  end if;
 --  verify lock  --
 VRCPCommon_ISLOCKED( acursession=>acursession,aROWID=>aVRCPCommonid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPCommon');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPCommon',
 aVERB=>'EDITROW',  aThe_Resource=>aVRCPCommonid,aLogInstanceID=>aInstanceID);
 update  VRCPCommon set ChangeStamp=sysdate
,
  Org=aOrg
,
  Family=aFamily
,
  Name=aName
,
  SurName=aSurName
,
  Privelegie=aPrivelegie
,
  phone=aphone
,
  email=aemail
,
  fax=afax
,
  Loyality=aLoyality
,
  the_Comment=athe_Comment
,
  Curator=aCurator
,
  mobile=amobile
,
  PersonDeYuro=aPersonDeYuro
,
  ActionReason=aActionReason
,
  ActionStart=aActionStart
,
  ActionEnd=aActionEnd
,
  PassportInfo=aPassportInfo
,
  Address=aAddress
  where  VRCPCommonID = aVRCPCommonID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRCPCommon',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'Нет прав на создание строк. Раздел=VRCPCommon');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'Строка заблокирована другим пльзователем. Раздел=VRCPCommon');
    return;
  end if;
select Count(*) into existsCnt from VRCPCommon where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'Невозможно создать вторую строку в однострочной сессии. Раздел: <VRCPCommon>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRCPCommon',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRCPCommonid,aLogInstanceID=>aInstanceID);
 insert into   VRCPCommon
 (  VRCPCommonID 
,InstanceID
,Org

,Family

,Name

,SurName

,Privelegie

,phone

,email

,fax

,Loyality

,the_Comment

,Curator

,mobile

,PersonDeYuro

,ActionReason

,ActionStart

,ActionEnd

,PassportInfo

,Address

 ) values ( aVRCPCommonID 
,aInstanceID
,aOrg

,aFamily

,aName

,aSurName

,aPrivelegie

,aphone

,aemail

,afax

,aLoyality

,athe_Comment

,aCurator

,amobile

,aPersonDeYuro

,aActionReason

,aActionStart

,aActionEnd

,aPassportInfo

,aAddress

 ); 
 VRCPCommon_SINIT( aCURSESSION,aVRCPCommonid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRCPCommon_PARENT /*Общая информация*/ (
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
  select  INSTANCEID into aParentID from VRCPCommon where  VRCPCommonid=aRowID;
 end; 


procedure VRCPCommon_ISLOCKED /*Общая информация*/ (
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
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRCPCommon where VRCPCommonid=aRowID;
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
  VRCPCommon_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRCP.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRCPCommon_LOCK /*Общая информация*/ (
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
 VRCPCommon_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблокирована другим пользователем');
    return;
  end if;
 if aIsLocked =0  
 then
  VRCPCommon_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'У данной строки имеются дочерние строки, которые заблокированы другим пользователем');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRCPCommon where VRCPCommonid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'Нет прав на блокировку строк. Раздел=VRCPCommon');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRCPCommon set LockUserID =auserID ,LockSessionID =null where VRCPCommonid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRCPCommon set LockUserID =null,LockSessionID =aCURSESSION  where VRCPCommonid=aRowID;
     return;
   end if;
 end ;


procedure VRCPCommon_HCL /*Общая информация*/ (
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


procedure VRCPCommon_UNLOCK /*Общая информация*/ (
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
 VRCPCommon_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'Строка заблоирована другим пользователем');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRCPCommon set LockUserID =null  where VRCPCommonid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRCPCommon set LockSessionID =null  where VRCPCommonid=aRowID;
     return;
   end if;
 end; 


procedure VRCPCommon_SINIT /*Общая информация*/ (
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
 select  SecurityStyleID into atmpID from VRCPCommon where VRCPCommonid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'Нет прав на управление защитой. Раздел =VRCPCommon');
    return;
  end if;
if aSecurityStyleID is null then
 VRCPCommon_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRCPCommon set securitystyleid =aStyleID where VRCPCommonid = aRowID;
else 
 update VRCPCommon set securitystyleid =aSecurityStyleID where VRCPCommonid = aRowID;
end if; 
end ; 


procedure VRCPCommon_propagate /*Общая информация*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRCPCommon where VRCPCommonid=aRowid;
end;


end VRCP;

/



