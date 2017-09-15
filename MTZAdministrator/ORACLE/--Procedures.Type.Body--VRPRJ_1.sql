
/* --VRPRJ*/

 create or replace package body VRPRJ as

procedure VRPRJ_DELETE(acursession CHAR, aInstanceID CHAR) as  
aObjType  varchar2(255);
begin
select  objtype into aObjType from instance where instanceid=ainstanceid;
if  aObjType ='VRPRJ'
then
declare cursor child_VRPRJ_REPORT is select VRPRJ_REPORT.VRPRJ_REPORTid ID from VRPRJ_REPORT where  VRPRJ_REPORT.InstanceID = ainstanceid;
row_VRPRJ_REPORT  child_VRPRJ_REPORT%ROWTYPE;
begin
--open child_VRPRJ_REPORT;
for row_VRPRJ_REPORT in child_VRPRJ_REPORT loop
 VRPRJ_REPORT_DELETE (acursession,row_VRPRJ_REPORT.id,aInstanceID);
end loop;
--close child_VRPRJ_REPORT;
end;
declare cursor child_VRPRJ_SUBPROJECT is select VRPRJ_SUBPROJECT.VRPRJ_SUBPROJECTid ID from VRPRJ_SUBPROJECT where  VRPRJ_SUBPROJECT.InstanceID = ainstanceid;
row_VRPRJ_SUBPROJECT  child_VRPRJ_SUBPROJECT%ROWTYPE;
begin
--open child_VRPRJ_SUBPROJECT;
for row_VRPRJ_SUBPROJECT in child_VRPRJ_SUBPROJECT loop
 VRPRJ_SUBPROJECT_DELETE (acursession,row_VRPRJ_SUBPROJECT.id,aInstanceID);
end loop;
--close child_VRPRJ_SUBPROJECT;
end;
declare cursor child_VRPRJ_JOB is select VRPRJ_JOB.VRPRJ_JOBid ID from VRPRJ_JOB where  VRPRJ_JOB.InstanceID = ainstanceid;
row_VRPRJ_JOB  child_VRPRJ_JOB%ROWTYPE;
begin
--open child_VRPRJ_JOB;
for row_VRPRJ_JOB in child_VRPRJ_JOB loop
 VRPRJ_JOB_DELETE (acursession,row_VRPRJ_JOB.id,aInstanceID);
end loop;
--close child_VRPRJ_JOB;
end;
declare cursor child_VRPRJ_SeeAlso is select VRPRJ_SeeAlso.VRPRJ_SeeAlsoid ID from VRPRJ_SeeAlso where  VRPRJ_SeeAlso.InstanceID = ainstanceid;
row_VRPRJ_SeeAlso  child_VRPRJ_SeeAlso%ROWTYPE;
begin
--open child_VRPRJ_SeeAlso;
for row_VRPRJ_SeeAlso in child_VRPRJ_SeeAlso loop
 VRPRJ_SeeAlso_DELETE (acursession,row_VRPRJ_SeeAlso.id,aInstanceID);
end loop;
--close child_VRPRJ_SeeAlso;
end;
declare cursor child_VRPRJ_CUSTOMER is select VRPRJ_CUSTOMER.VRPRJ_CUSTOMERid ID from VRPRJ_CUSTOMER where  VRPRJ_CUSTOMER.InstanceID = ainstanceid;
row_VRPRJ_CUSTOMER  child_VRPRJ_CUSTOMER%ROWTYPE;
begin
--open child_VRPRJ_CUSTOMER;
for row_VRPRJ_CUSTOMER in child_VRPRJ_CUSTOMER loop
 VRPRJ_CUSTOMER_DELETE (acursession,row_VRPRJ_CUSTOMER.id,aInstanceID);
end loop;
--close child_VRPRJ_CUSTOMER;
end;
declare cursor child_VRPRJ_Contract is select VRPRJ_Contract.VRPRJ_Contractid ID from VRPRJ_Contract where  VRPRJ_Contract.InstanceID = ainstanceid;
row_VRPRJ_Contract  child_VRPRJ_Contract%ROWTYPE;
begin
--open child_VRPRJ_Contract;
for row_VRPRJ_Contract in child_VRPRJ_Contract loop
 VRPRJ_Contract_DELETE (acursession,row_VRPRJ_Contract.id,aInstanceID);
end loop;
--close child_VRPRJ_Contract;
end;
declare cursor child_VRPRJ_COMMON is select VRPRJ_COMMON.VRPRJ_COMMONid ID from VRPRJ_COMMON where  VRPRJ_COMMON.InstanceID = ainstanceid;
row_VRPRJ_COMMON  child_VRPRJ_COMMON%ROWTYPE;
begin
--open child_VRPRJ_COMMON;
for row_VRPRJ_COMMON in child_VRPRJ_COMMON loop
 VRPRJ_COMMON_DELETE (acursession,row_VRPRJ_COMMON.id,aInstanceID);
end loop;
--close child_VRPRJ_COMMON;
end;
return;
<<del_error>>
return;
end if;
end;
procedure VRPRJ_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
 aUserID CHAR(38);
 aLockUserID CHAR(38);
 aLockSessionID CHAR(38);
 begin
select  objtype into aObjtype from instance where instanceid=aRowid;
if aobjtype = 'VRPRJ'
 then
 select usersid into auserID from  the_session where the_sessionid=acursession;
declare cursor lch_VRPRJ_REPORT is select VRPRJ_REPORT.VRPRJ_REPORTid ID from VRPRJ_REPORT where  VRPRJ_REPORT.InstanceID = arowid;
ROW_VRPRJ_REPORT  lch_VRPRJ_REPORT%ROWTYPE;
begin
--open lch_VRPRJ_REPORT;
for row_VRPRJ_REPORT in lch_VRPRJ_REPORT loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRPRJ_REPORT where VRPRJ_REPORTid=row_VRPRJ_REPORT.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRPRJ_REPORT;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRPRJ_REPORT;
     return;
   end if; 
 end if; 
 VRPRJ_REPORT_HCL (acursession,ROW_VRPRJ_REPORT.id,aisLocked);
 if aisLocked >2 then
   close lch_VRPRJ_REPORT;
   return;
 end if;
 end loop;
--close lch_VRPRJ_REPORT;
end;
declare cursor lch_VRPRJ_SUBPROJECT is select VRPRJ_SUBPROJECT.VRPRJ_SUBPROJECTid ID from VRPRJ_SUBPROJECT where  VRPRJ_SUBPROJECT.InstanceID = arowid;
ROW_VRPRJ_SUBPROJECT  lch_VRPRJ_SUBPROJECT%ROWTYPE;
begin
--open lch_VRPRJ_SUBPROJECT;
for row_VRPRJ_SUBPROJECT in lch_VRPRJ_SUBPROJECT loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTid=row_VRPRJ_SUBPROJECT.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRPRJ_SUBPROJECT;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRPRJ_SUBPROJECT;
     return;
   end if; 
 end if; 
 VRPRJ_SUBPROJECT_HCL (acursession,ROW_VRPRJ_SUBPROJECT.id,aisLocked);
 if aisLocked >2 then
   close lch_VRPRJ_SUBPROJECT;
   return;
 end if;
 end loop;
--close lch_VRPRJ_SUBPROJECT;
end;
declare cursor lch_VRPRJ_JOB is select VRPRJ_JOB.VRPRJ_JOBid ID from VRPRJ_JOB where  VRPRJ_JOB.InstanceID = arowid;
ROW_VRPRJ_JOB  lch_VRPRJ_JOB%ROWTYPE;
begin
--open lch_VRPRJ_JOB;
for row_VRPRJ_JOB in lch_VRPRJ_JOB loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRPRJ_JOB where VRPRJ_JOBid=row_VRPRJ_JOB.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRPRJ_JOB;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRPRJ_JOB;
     return;
   end if; 
 end if; 
 VRPRJ_JOB_HCL (acursession,ROW_VRPRJ_JOB.id,aisLocked);
 if aisLocked >2 then
   close lch_VRPRJ_JOB;
   return;
 end if;
 end loop;
--close lch_VRPRJ_JOB;
end;
declare cursor lch_VRPRJ_SeeAlso is select VRPRJ_SeeAlso.VRPRJ_SeeAlsoid ID from VRPRJ_SeeAlso where  VRPRJ_SeeAlso.InstanceID = arowid;
ROW_VRPRJ_SeeAlso  lch_VRPRJ_SeeAlso%ROWTYPE;
begin
--open lch_VRPRJ_SeeAlso;
for row_VRPRJ_SeeAlso in lch_VRPRJ_SeeAlso loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRPRJ_SeeAlso where VRPRJ_SeeAlsoid=row_VRPRJ_SeeAlso.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRPRJ_SeeAlso;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRPRJ_SeeAlso;
     return;
   end if; 
 end if; 
 VRPRJ_SeeAlso_HCL (acursession,ROW_VRPRJ_SeeAlso.id,aisLocked);
 if aisLocked >2 then
   close lch_VRPRJ_SeeAlso;
   return;
 end if;
 end loop;
--close lch_VRPRJ_SeeAlso;
end;
declare cursor lch_VRPRJ_CUSTOMER is select VRPRJ_CUSTOMER.VRPRJ_CUSTOMERid ID from VRPRJ_CUSTOMER where  VRPRJ_CUSTOMER.InstanceID = arowid;
ROW_VRPRJ_CUSTOMER  lch_VRPRJ_CUSTOMER%ROWTYPE;
begin
--open lch_VRPRJ_CUSTOMER;
for row_VRPRJ_CUSTOMER in lch_VRPRJ_CUSTOMER loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERid=row_VRPRJ_CUSTOMER.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRPRJ_CUSTOMER;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRPRJ_CUSTOMER;
     return;
   end if; 
 end if; 
 VRPRJ_CUSTOMER_HCL (acursession,ROW_VRPRJ_CUSTOMER.id,aisLocked);
 if aisLocked >2 then
   close lch_VRPRJ_CUSTOMER;
   return;
 end if;
 end loop;
--close lch_VRPRJ_CUSTOMER;
end;
declare cursor lch_VRPRJ_Contract is select VRPRJ_Contract.VRPRJ_Contractid ID from VRPRJ_Contract where  VRPRJ_Contract.InstanceID = arowid;
ROW_VRPRJ_Contract  lch_VRPRJ_Contract%ROWTYPE;
begin
--open lch_VRPRJ_Contract;
for row_VRPRJ_Contract in lch_VRPRJ_Contract loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRPRJ_Contract where VRPRJ_Contractid=row_VRPRJ_Contract.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRPRJ_Contract;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRPRJ_Contract;
     return;
   end if; 
 end if; 
 VRPRJ_Contract_HCL (acursession,ROW_VRPRJ_Contract.id,aisLocked);
 if aisLocked >2 then
   close lch_VRPRJ_Contract;
   return;
 end if;
 end loop;
--close lch_VRPRJ_Contract;
end;
declare cursor lch_VRPRJ_COMMON is select VRPRJ_COMMON.VRPRJ_COMMONid ID from VRPRJ_COMMON where  VRPRJ_COMMON.InstanceID = arowid;
ROW_VRPRJ_COMMON  lch_VRPRJ_COMMON%ROWTYPE;
begin
--open lch_VRPRJ_COMMON;
for row_VRPRJ_COMMON in lch_VRPRJ_COMMON loop
 select LockUserID,LockSessionID into aLockUserID,aLockSessionID from VRPRJ_COMMON where VRPRJ_COMMONid=row_VRPRJ_COMMON.id;
 if not aLockUserID is null  
 then   
   if  aLockUserID <> auserID  
   then   
     aisLocked := 4; /* CheckOut by another user */
     close lch_VRPRJ_COMMON;
     return;
   end if;  
 end if;  
 if not aLockSessionID is null  
 then   
   if  aLockSessionID <> aCURSESSION  
   then   
     aisLocked:= 3; /* Lockes by another user */
     close lch_VRPRJ_COMMON;
     return;
   end if; 
 end if; 
 VRPRJ_COMMON_HCL (acursession,ROW_VRPRJ_COMMON.id,aisLocked);
 if aisLocked >2 then
   close lch_VRPRJ_COMMON;
   return;
 end if;
 end loop;
--close lch_VRPRJ_COMMON;
end;
 end if;
aIsLocked:=0;
end;
procedure VRPRJ_propagate(acursession CHAR, aROWID CHAR) as  
aObjType  varchar2(255);
atmpStr  varchar2(255);
achildlistid CHAR(38);
assid CHAR(38);
begin
select  objtype into aObjType from instance where instanceid=aRowid;
if aobjtype = 'VRPRJ'
 then
 select securitystyleid into aSSID from instance where instanceid=aRowID;
declare cursor pch_VRPRJ_REPORT is select VRPRJ_REPORT.VRPRJ_REPORTid id from VRPRJ_REPORT where  VRPRJ_REPORT.InstanceID = arowid;
row_VRPRJ_REPORT  pch_VRPRJ_REPORT%ROWTYPE;
begin
--open pch_VRPRJ_REPORT;
for row_VRPRJ_REPORT in  pch_VRPRJ_REPORT loop
 VRPRJ_REPORT_SINIT( acursession,row_VRPRJ_REPORT.id,assid);
 VRPRJ_REPORT_propagate( acursession,row_VRPRJ_REPORT.id);
end loop;
--close pch_VRPRJ_REPORT;
end;
declare cursor pch_VRPRJ_SUBPROJECT is select VRPRJ_SUBPROJECT.VRPRJ_SUBPROJECTid id from VRPRJ_SUBPROJECT where  VRPRJ_SUBPROJECT.InstanceID = arowid;
row_VRPRJ_SUBPROJECT  pch_VRPRJ_SUBPROJECT%ROWTYPE;
begin
--open pch_VRPRJ_SUBPROJECT;
for row_VRPRJ_SUBPROJECT in  pch_VRPRJ_SUBPROJECT loop
 VRPRJ_SUBPROJECT_SINIT( acursession,row_VRPRJ_SUBPROJECT.id,assid);
 VRPRJ_SUBPROJECT_propagate( acursession,row_VRPRJ_SUBPROJECT.id);
end loop;
--close pch_VRPRJ_SUBPROJECT;
end;
declare cursor pch_VRPRJ_JOB is select VRPRJ_JOB.VRPRJ_JOBid id from VRPRJ_JOB where  VRPRJ_JOB.InstanceID = arowid;
row_VRPRJ_JOB  pch_VRPRJ_JOB%ROWTYPE;
begin
--open pch_VRPRJ_JOB;
for row_VRPRJ_JOB in  pch_VRPRJ_JOB loop
 VRPRJ_JOB_SINIT( acursession,row_VRPRJ_JOB.id,assid);
 VRPRJ_JOB_propagate( acursession,row_VRPRJ_JOB.id);
end loop;
--close pch_VRPRJ_JOB;
end;
declare cursor pch_VRPRJ_SeeAlso is select VRPRJ_SeeAlso.VRPRJ_SeeAlsoid id from VRPRJ_SeeAlso where  VRPRJ_SeeAlso.InstanceID = arowid;
row_VRPRJ_SeeAlso  pch_VRPRJ_SeeAlso%ROWTYPE;
begin
--open pch_VRPRJ_SeeAlso;
for row_VRPRJ_SeeAlso in  pch_VRPRJ_SeeAlso loop
 VRPRJ_SeeAlso_SINIT( acursession,row_VRPRJ_SeeAlso.id,assid);
 VRPRJ_SeeAlso_propagate( acursession,row_VRPRJ_SeeAlso.id);
end loop;
--close pch_VRPRJ_SeeAlso;
end;
declare cursor pch_VRPRJ_CUSTOMER is select VRPRJ_CUSTOMER.VRPRJ_CUSTOMERid id from VRPRJ_CUSTOMER where  VRPRJ_CUSTOMER.InstanceID = arowid;
row_VRPRJ_CUSTOMER  pch_VRPRJ_CUSTOMER%ROWTYPE;
begin
--open pch_VRPRJ_CUSTOMER;
for row_VRPRJ_CUSTOMER in  pch_VRPRJ_CUSTOMER loop
 VRPRJ_CUSTOMER_SINIT( acursession,row_VRPRJ_CUSTOMER.id,assid);
 VRPRJ_CUSTOMER_propagate( acursession,row_VRPRJ_CUSTOMER.id);
end loop;
--close pch_VRPRJ_CUSTOMER;
end;
declare cursor pch_VRPRJ_Contract is select VRPRJ_Contract.VRPRJ_Contractid id from VRPRJ_Contract where  VRPRJ_Contract.InstanceID = arowid;
row_VRPRJ_Contract  pch_VRPRJ_Contract%ROWTYPE;
begin
--open pch_VRPRJ_Contract;
for row_VRPRJ_Contract in  pch_VRPRJ_Contract loop
 VRPRJ_Contract_SINIT( acursession,row_VRPRJ_Contract.id,assid);
 VRPRJ_Contract_propagate( acursession,row_VRPRJ_Contract.id);
end loop;
--close pch_VRPRJ_Contract;
end;
declare cursor pch_VRPRJ_COMMON is select VRPRJ_COMMON.VRPRJ_COMMONid id from VRPRJ_COMMON where  VRPRJ_COMMON.InstanceID = arowid;
row_VRPRJ_COMMON  pch_VRPRJ_COMMON%ROWTYPE;
begin
--open pch_VRPRJ_COMMON;
for row_VRPRJ_COMMON in  pch_VRPRJ_COMMON loop
 VRPRJ_COMMON_SINIT( acursession,row_VRPRJ_COMMON.id,assid);
 VRPRJ_COMMON_propagate( acursession,row_VRPRJ_COMMON.id);
end loop;
--close pch_VRPRJ_COMMON;
end;
 end if; 
end;



procedure VRPRJ_REPORT_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_REPORTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aVRPRJ_REPORTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRPRJ_REPORT where VRPRJ_REPORTID=aVRPRJ_REPORTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRPRJ_REPORT where VRPRJ_REPORTid=aVRPRJ_REPORTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRPRJ_REPORT');
    return;
  end if;
  aBRIEF:=func.VRPRJ_REPORT_BRIEF_F(aVRPRJ_REPORTid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRPRJ_REPORT_DELETE /*������*/ (
 aCURSESSION CHAR,
 aVRPRJ_REPORTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from VRPRJ_REPORT where VRPRJ_REPORTID=aVRPRJ_REPORTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRPRJ_REPORT where VRPRJ_REPORTid=aVRPRJ_REPORTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRPRJ_REPORT',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=VRPRJ_REPORT');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_REPORT_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_REPORTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=VRPRJ_REPORT');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_REPORT',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRPRJ_REPORTid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRPRJ_REPORT is select  instanceid ID from instance where OwnerPartName ='VRPRJ_REPORT' and OwnerRowID=aVRPRJ_REPORTid;
row_VRPRJ_REPORT  chld_VRPRJ_REPORT%ROWTYPE;
begin
--open chld_VRPRJ_REPORT;
for row_VRPRJ_REPORT in chld_VRPRJ_REPORT loop
 Kernel.INSTANCE_OWNER (acursession,row_VRPRJ_REPORT.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRPRJ_REPORT.id);
end loop;
--close chld_VRPRJ_REPORT;
end ;
  delete from  VRPRJ_REPORT 
  where  VRPRJ_REPORTID = aVRPRJ_REPORTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������*/
procedure VRPRJ_REPORT_SAVE /*������*/ (
 aCURSESSION CHAR,
 aVRPRJ_REPORTid CHAR,
aInstanceID CHAR 
,aReport CHAR/* ����� *//* ����� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from VRPRJ_REPORT where VRPRJ_REPORTID=aVRPRJ_REPORTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRPRJ_REPORT where VRPRJ_REPORTid=aVRPRJ_REPORTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRPRJ_REPORT',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=VRPRJ_REPORT');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_REPORT_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_REPORTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_REPORT');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_REPORT',
 aVERB=>'EDITROW',  aThe_Resource=>aVRPRJ_REPORTid,aLogInstanceID=>aInstanceID);
 update  VRPRJ_REPORT set ChangeStamp=sysdate
,
  Report=aReport
  where  VRPRJ_REPORTID = aVRPRJ_REPORTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRPRJ_REPORT',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=VRPRJ_REPORT');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_REPORT');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_REPORT',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRPRJ_REPORTid,aLogInstanceID=>aInstanceID);
 insert into   VRPRJ_REPORT
 (  VRPRJ_REPORTID 
,InstanceID
,Report

 ) values ( aVRPRJ_REPORTID 
,aInstanceID
,aReport

 ); 
 VRPRJ_REPORT_SINIT( aCURSESSION,aVRPRJ_REPORTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRPRJ_REPORT_PARENT /*������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from VRPRJ_REPORT where  VRPRJ_REPORTid=aRowID;
 end; 


procedure VRPRJ_REPORT_ISLOCKED /*������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRPRJ_REPORT where VRPRJ_REPORTid=aRowID;
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
  VRPRJ_REPORT_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRPRJ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRPRJ_REPORT_LOCK /*������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 VRPRJ_REPORT_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  VRPRJ_REPORT_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRPRJ_REPORT where VRPRJ_REPORTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=VRPRJ_REPORT');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRPRJ_REPORT set LockUserID =auserID ,LockSessionID =null where VRPRJ_REPORTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRPRJ_REPORT set LockUserID =null,LockSessionID =aCURSESSION  where VRPRJ_REPORTid=aRowID;
     return;
   end if;
 end ;


procedure VRPRJ_REPORT_HCL /*������*/ (
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


procedure VRPRJ_REPORT_UNLOCK /*������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 VRPRJ_REPORT_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRPRJ_REPORT set LockUserID =null  where VRPRJ_REPORTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRPRJ_REPORT set LockSessionID =null  where VRPRJ_REPORTid=aRowID;
     return;
   end if;
 end; 


procedure VRPRJ_REPORT_SINIT /*������*/ (
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
 select  SecurityStyleID into atmpID from VRPRJ_REPORT where VRPRJ_REPORTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =VRPRJ_REPORT');
    return;
  end if;
if aSecurityStyleID is null then
 VRPRJ_REPORT_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRPRJ_REPORT set securitystyleid =aStyleID where VRPRJ_REPORTid = aRowID;
else 
 update VRPRJ_REPORT set securitystyleid =aSecurityStyleID where VRPRJ_REPORTid = aRowID;
end if; 
end ; 


procedure VRPRJ_REPORT_propagate /*������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRPRJ_REPORT where VRPRJ_REPORTid=aRowid;
end;



procedure VRPRJ_SUBPROJECT_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_SUBPROJECTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aVRPRJ_SUBPROJECTid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTID=aVRPRJ_SUBPROJECTID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTid=aVRPRJ_SUBPROJECTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRPRJ_SUBPROJECT');
    return;
  end if;
  aBRIEF:=func.VRPRJ_SUBPROJECT_BRIEF_F(aVRPRJ_SUBPROJECTid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRPRJ_SUBPROJECT_DELETE /*����������*/ (
 aCURSESSION CHAR,
 aVRPRJ_SUBPROJECTid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTID=aVRPRJ_SUBPROJECTID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTid=aVRPRJ_SUBPROJECTID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRPRJ_SUBPROJECT',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=VRPRJ_SUBPROJECT');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_SUBPROJECT_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_SUBPROJECTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=VRPRJ_SUBPROJECT');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_SUBPROJECT',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRPRJ_SUBPROJECTid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRPRJ_SUBPROJECT is select  instanceid ID from instance where OwnerPartName ='VRPRJ_SUBPROJECT' and OwnerRowID=aVRPRJ_SUBPROJECTid;
row_VRPRJ_SUBPROJECT  chld_VRPRJ_SUBPROJECT%ROWTYPE;
begin
--open chld_VRPRJ_SUBPROJECT;
for row_VRPRJ_SUBPROJECT in chld_VRPRJ_SUBPROJECT loop
 Kernel.INSTANCE_OWNER (acursession,row_VRPRJ_SUBPROJECT.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRPRJ_SUBPROJECT.id);
end loop;
--close chld_VRPRJ_SUBPROJECT;
end ;
  delete from  VRPRJ_SUBPROJECT 
  where  VRPRJ_SUBPROJECTID = aVRPRJ_SUBPROJECTID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����������*/
procedure VRPRJ_SUBPROJECT_SAVE /*����������*/ (
 aCURSESSION CHAR,
 aVRPRJ_SUBPROJECTid CHAR,
aInstanceID CHAR 
,aSubProject CHAR/* ��������� *//* ��������� */
,athe_Comment VARCHAR2 := null /* ����������� *//* ����������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTID=aVRPRJ_SUBPROJECTID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTid=aVRPRJ_SUBPROJECTID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRPRJ_SUBPROJECT',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=VRPRJ_SUBPROJECT');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_SUBPROJECT_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_SUBPROJECTid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_SUBPROJECT');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_SUBPROJECT',
 aVERB=>'EDITROW',  aThe_Resource=>aVRPRJ_SUBPROJECTid,aLogInstanceID=>aInstanceID);
 update  VRPRJ_SUBPROJECT set ChangeStamp=sysdate
,
  SubProject=aSubProject
,
  the_Comment=athe_Comment
  where  VRPRJ_SUBPROJECTID = aVRPRJ_SUBPROJECTID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRPRJ_SUBPROJECT',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=VRPRJ_SUBPROJECT');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_SUBPROJECT');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_SUBPROJECT',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRPRJ_SUBPROJECTid,aLogInstanceID=>aInstanceID);
 insert into   VRPRJ_SUBPROJECT
 (  VRPRJ_SUBPROJECTID 
,InstanceID
,SubProject

,the_Comment

 ) values ( aVRPRJ_SUBPROJECTID 
,aInstanceID
,aSubProject

,athe_Comment

 ); 
 VRPRJ_SUBPROJECT_SINIT( aCURSESSION,aVRPRJ_SUBPROJECTid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRPRJ_SUBPROJECT_PARENT /*����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from VRPRJ_SUBPROJECT where  VRPRJ_SUBPROJECTid=aRowID;
 end; 


procedure VRPRJ_SUBPROJECT_ISLOCKED /*����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTid=aRowID;
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
  VRPRJ_SUBPROJECT_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRPRJ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRPRJ_SUBPROJECT_LOCK /*����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 VRPRJ_SUBPROJECT_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  VRPRJ_SUBPROJECT_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=VRPRJ_SUBPROJECT');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRPRJ_SUBPROJECT set LockUserID =auserID ,LockSessionID =null where VRPRJ_SUBPROJECTid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRPRJ_SUBPROJECT set LockUserID =null,LockSessionID =aCURSESSION  where VRPRJ_SUBPROJECTid=aRowID;
     return;
   end if;
 end ;


procedure VRPRJ_SUBPROJECT_HCL /*����������*/ (
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


procedure VRPRJ_SUBPROJECT_UNLOCK /*����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 VRPRJ_SUBPROJECT_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRPRJ_SUBPROJECT set LockUserID =null  where VRPRJ_SUBPROJECTid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRPRJ_SUBPROJECT set LockSessionID =null  where VRPRJ_SUBPROJECTid=aRowID;
     return;
   end if;
 end; 


procedure VRPRJ_SUBPROJECT_SINIT /*����������*/ (
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
 select  SecurityStyleID into atmpID from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =VRPRJ_SUBPROJECT');
    return;
  end if;
if aSecurityStyleID is null then
 VRPRJ_SUBPROJECT_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRPRJ_SUBPROJECT set securitystyleid =aStyleID where VRPRJ_SUBPROJECTid = aRowID;
else 
 update VRPRJ_SUBPROJECT set securitystyleid =aSecurityStyleID where VRPRJ_SUBPROJECTid = aRowID;
end if; 
end ; 


procedure VRPRJ_SUBPROJECT_propagate /*����������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRPRJ_SUBPROJECT where VRPRJ_SUBPROJECTid=aRowid;
end;



procedure VRPRJ_JOB_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_JOBid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aVRPRJ_JOBid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRPRJ_JOB where VRPRJ_JOBID=aVRPRJ_JOBID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRPRJ_JOB where VRPRJ_JOBid=aVRPRJ_JOBID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRPRJ_JOB');
    return;
  end if;
  aBRIEF:=func.VRPRJ_JOB_BRIEF_F(aVRPRJ_JOBid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRPRJ_JOB_DELETE /*������ �����*/ (
 aCURSESSION CHAR,
 aVRPRJ_JOBid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from VRPRJ_JOB where VRPRJ_JOBID=aVRPRJ_JOBID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRPRJ_JOB where VRPRJ_JOBid=aVRPRJ_JOBID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRPRJ_JOB',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=VRPRJ_JOB');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_JOB_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_JOBid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=VRPRJ_JOB');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_JOB',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRPRJ_JOBid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRPRJ_JOB is select  instanceid ID from instance where OwnerPartName ='VRPRJ_JOB' and OwnerRowID=aVRPRJ_JOBid;
row_VRPRJ_JOB  chld_VRPRJ_JOB%ROWTYPE;
begin
--open chld_VRPRJ_JOB;
for row_VRPRJ_JOB in chld_VRPRJ_JOB loop
 Kernel.INSTANCE_OWNER (acursession,row_VRPRJ_JOB.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRPRJ_JOB.id);
end loop;
--close chld_VRPRJ_JOB;
end ;
  delete from  VRPRJ_JOB 
  where  VRPRJ_JOBID = aVRPRJ_JOBID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������ �����*/
procedure VRPRJ_JOB_SAVE /*������ �����*/ (
 aCURSESSION CHAR,
 aVRPRJ_JOBid CHAR,
aInstanceID CHAR 
,athe_Description VARCHAR2/* �������� *//* �������� */
,aMainPerson CHAR := null /* ������������� *//* ������������� */
,aTheFile VARCHAR2 := null /* ���� */
,aTheFile_EXT varchar2 /* ���� */
,aPlanWork
 NUMBER := null /* �������� ������������ *//* �������� ������������ */
,aStartDate
 DATE := null /* ���� ������ ����� *//* ���� ������ ����� */
,aDueDate
 DATE := null /* ���� ��������� *//* ���� ��������� */
,aFactStart
 DATE := null /* ����������� ������ *//* ����������� ������ */
,aFactFinish
 DATE := null /* ����������� ��������� *//* ����������� ��������� */
,aFactWork
 NUMBER := null /* ����������� ������������ *//* ����������� ������������ */
,aJobDone
 NUMBER := null /* ������ ��������� *//* ������ ��������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from VRPRJ_JOB where VRPRJ_JOBID=aVRPRJ_JOBID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRPRJ_JOB where VRPRJ_JOBid=aVRPRJ_JOBID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRPRJ_JOB',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=VRPRJ_JOB');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_JOB_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_JOBid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_JOB');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_JOB',
 aVERB=>'EDITROW',  aThe_Resource=>aVRPRJ_JOBid,aLogInstanceID=>aInstanceID);
 update  VRPRJ_JOB set ChangeStamp=sysdate
,
  the_Description=athe_Description
,
  MainPerson=aMainPerson
,
  TheFile=aTheFile
,TheFile_EXT=
aTheFile_EXT 
,
  PlanWork=aPlanWork
,
  StartDate=aStartDate
,
  DueDate=aDueDate
,
  FactStart=aFactStart
,
  FactFinish=aFactFinish
,
  FactWork=aFactWork
,
  JobDone=aJobDone
  where  VRPRJ_JOBID = aVRPRJ_JOBID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRPRJ_JOB',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=VRPRJ_JOB');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_JOB');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_JOB',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRPRJ_JOBid,aLogInstanceID=>aInstanceID);
 insert into   VRPRJ_JOB
 (  VRPRJ_JOBID 
,InstanceID
,the_Description

,MainPerson

,TheFile

,TheFile_EXT
,PlanWork

,StartDate

,DueDate

,FactStart

,FactFinish

,FactWork

,JobDone

 ) values ( aVRPRJ_JOBID 
,aInstanceID
,athe_Description

,aMainPerson

,aTheFile

,aTheFile_EXT
,aPlanWork

,aStartDate

,aDueDate

,aFactStart

,aFactFinish

,aFactWork

,aJobDone

 ); 
 VRPRJ_JOB_SINIT( aCURSESSION,aVRPRJ_JOBid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRPRJ_JOB_PARENT /*������ �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from VRPRJ_JOB where  VRPRJ_JOBid=aRowID;
 end; 


procedure VRPRJ_JOB_ISLOCKED /*������ �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRPRJ_JOB where VRPRJ_JOBid=aRowID;
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
  VRPRJ_JOB_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRPRJ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRPRJ_JOB_LOCK /*������ �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 VRPRJ_JOB_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  VRPRJ_JOB_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRPRJ_JOB where VRPRJ_JOBid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=VRPRJ_JOB');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRPRJ_JOB set LockUserID =auserID ,LockSessionID =null where VRPRJ_JOBid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRPRJ_JOB set LockUserID =null,LockSessionID =aCURSESSION  where VRPRJ_JOBid=aRowID;
     return;
   end if;
 end ;


procedure VRPRJ_JOB_HCL /*������ �����*/ (
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


procedure VRPRJ_JOB_UNLOCK /*������ �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 VRPRJ_JOB_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRPRJ_JOB set LockUserID =null  where VRPRJ_JOBid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRPRJ_JOB set LockSessionID =null  where VRPRJ_JOBid=aRowID;
     return;
   end if;
 end; 


procedure VRPRJ_JOB_SINIT /*������ �����*/ (
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
 select  SecurityStyleID into atmpID from VRPRJ_JOB where VRPRJ_JOBid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =VRPRJ_JOB');
    return;
  end if;
if aSecurityStyleID is null then
 VRPRJ_JOB_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRPRJ_JOB set securitystyleid =aStyleID where VRPRJ_JOBid = aRowID;
else 
 update VRPRJ_JOB set securitystyleid =aSecurityStyleID where VRPRJ_JOBid = aRowID;
end if; 
end ; 


procedure VRPRJ_JOB_propagate /*������ �����*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRPRJ_JOB where VRPRJ_JOBid=aRowid;
end;



procedure VRPRJ_SeeAlso_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_SeeAlsoid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aVRPRJ_SeeAlsoid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRPRJ_SeeAlso where VRPRJ_SeeAlsoID=aVRPRJ_SeeAlsoID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRPRJ_SeeAlso where VRPRJ_SeeAlsoid=aVRPRJ_SeeAlsoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRPRJ_SeeAlso');
    return;
  end if;
  aBRIEF:=func.VRPRJ_SeeAlso_BRIEF_F(aVRPRJ_SeeAlsoid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRPRJ_SeeAlso_DELETE /*������ �����*/ (
 aCURSESSION CHAR,
 aVRPRJ_SeeAlsoid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from VRPRJ_SeeAlso where VRPRJ_SeeAlsoID=aVRPRJ_SeeAlsoID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRPRJ_SeeAlso where VRPRJ_SeeAlsoid=aVRPRJ_SeeAlsoID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRPRJ_SeeAlso',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=VRPRJ_SeeAlso');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_SeeAlso_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_SeeAlsoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=VRPRJ_SeeAlso');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_SeeAlso',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRPRJ_SeeAlsoid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRPRJ_SeeAlso is select  instanceid ID from instance where OwnerPartName ='VRPRJ_SeeAlso' and OwnerRowID=aVRPRJ_SeeAlsoid;
row_VRPRJ_SeeAlso  chld_VRPRJ_SeeAlso%ROWTYPE;
begin
--open chld_VRPRJ_SeeAlso;
for row_VRPRJ_SeeAlso in chld_VRPRJ_SeeAlso loop
 Kernel.INSTANCE_OWNER (acursession,row_VRPRJ_SeeAlso.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRPRJ_SeeAlso.id);
end loop;
--close chld_VRPRJ_SeeAlso;
end ;
  delete from  VRPRJ_SeeAlso 
  where  VRPRJ_SeeAlsoID = aVRPRJ_SeeAlsoID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*������ �����*/
procedure VRPRJ_SeeAlso_SAVE /*������ �����*/ (
 aCURSESSION CHAR,
 aVRPRJ_SeeAlsoid CHAR,
aInstanceID CHAR 
,aDocument CHAR/* �������� *//* �������� */
,athe_Comment VARCHAR2 := null /* ���������� *//* ���������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from VRPRJ_SeeAlso where VRPRJ_SeeAlsoID=aVRPRJ_SeeAlsoID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRPRJ_SeeAlso where VRPRJ_SeeAlsoid=aVRPRJ_SeeAlsoID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRPRJ_SeeAlso',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=VRPRJ_SeeAlso');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_SeeAlso_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_SeeAlsoid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_SeeAlso');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_SeeAlso',
 aVERB=>'EDITROW',  aThe_Resource=>aVRPRJ_SeeAlsoid,aLogInstanceID=>aInstanceID);
 update  VRPRJ_SeeAlso set ChangeStamp=sysdate
,
  Document=aDocument
,
  the_Comment=athe_Comment
  where  VRPRJ_SeeAlsoID = aVRPRJ_SeeAlsoID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRPRJ_SeeAlso',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=VRPRJ_SeeAlso');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_SeeAlso');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_SeeAlso',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRPRJ_SeeAlsoid,aLogInstanceID=>aInstanceID);
 insert into   VRPRJ_SeeAlso
 (  VRPRJ_SeeAlsoID 
,InstanceID
,Document

,the_Comment

 ) values ( aVRPRJ_SeeAlsoID 
,aInstanceID
,aDocument

,athe_Comment

 ); 
 VRPRJ_SeeAlso_SINIT( aCURSESSION,aVRPRJ_SeeAlsoid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRPRJ_SeeAlso_PARENT /*������ �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from VRPRJ_SeeAlso where  VRPRJ_SeeAlsoid=aRowID;
 end; 


procedure VRPRJ_SeeAlso_ISLOCKED /*������ �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRPRJ_SeeAlso where VRPRJ_SeeAlsoid=aRowID;
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
  VRPRJ_SeeAlso_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRPRJ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRPRJ_SeeAlso_LOCK /*������ �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 VRPRJ_SeeAlso_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  VRPRJ_SeeAlso_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRPRJ_SeeAlso where VRPRJ_SeeAlsoid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=VRPRJ_SeeAlso');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRPRJ_SeeAlso set LockUserID =auserID ,LockSessionID =null where VRPRJ_SeeAlsoid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRPRJ_SeeAlso set LockUserID =null,LockSessionID =aCURSESSION  where VRPRJ_SeeAlsoid=aRowID;
     return;
   end if;
 end ;


procedure VRPRJ_SeeAlso_HCL /*������ �����*/ (
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


procedure VRPRJ_SeeAlso_UNLOCK /*������ �����*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 VRPRJ_SeeAlso_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRPRJ_SeeAlso set LockUserID =null  where VRPRJ_SeeAlsoid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRPRJ_SeeAlso set LockSessionID =null  where VRPRJ_SeeAlsoid=aRowID;
     return;
   end if;
 end; 


procedure VRPRJ_SeeAlso_SINIT /*������ �����*/ (
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
 select  SecurityStyleID into atmpID from VRPRJ_SeeAlso where VRPRJ_SeeAlsoid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =VRPRJ_SeeAlso');
    return;
  end if;
if aSecurityStyleID is null then
 VRPRJ_SeeAlso_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRPRJ_SeeAlso set securitystyleid =aStyleID where VRPRJ_SeeAlsoid = aRowID;
else 
 update VRPRJ_SeeAlso set securitystyleid =aSecurityStyleID where VRPRJ_SeeAlsoid = aRowID;
end if; 
end ; 


procedure VRPRJ_SeeAlso_propagate /*������ �����*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRPRJ_SeeAlso where VRPRJ_SeeAlsoid=aRowid;
end;



procedure VRPRJ_CUSTOMER_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_CUSTOMERid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aVRPRJ_CUSTOMERid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERID=aVRPRJ_CUSTOMERID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERid=aVRPRJ_CUSTOMERID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRPRJ_CUSTOMER');
    return;
  end if;
  aBRIEF:=func.VRPRJ_CUSTOMER_BRIEF_F(aVRPRJ_CUSTOMERid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRPRJ_CUSTOMER_DELETE /*���������*/ (
 aCURSESSION CHAR,
 aVRPRJ_CUSTOMERid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERID=aVRPRJ_CUSTOMERID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERid=aVRPRJ_CUSTOMERID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRPRJ_CUSTOMER',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=VRPRJ_CUSTOMER');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_CUSTOMER_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_CUSTOMERid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=VRPRJ_CUSTOMER');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_CUSTOMER',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRPRJ_CUSTOMERid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRPRJ_CUSTOMER is select  instanceid ID from instance where OwnerPartName ='VRPRJ_CUSTOMER' and OwnerRowID=aVRPRJ_CUSTOMERid;
row_VRPRJ_CUSTOMER  chld_VRPRJ_CUSTOMER%ROWTYPE;
begin
--open chld_VRPRJ_CUSTOMER;
for row_VRPRJ_CUSTOMER in chld_VRPRJ_CUSTOMER loop
 Kernel.INSTANCE_OWNER (acursession,row_VRPRJ_CUSTOMER.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRPRJ_CUSTOMER.id);
end loop;
--close chld_VRPRJ_CUSTOMER;
end ;
  delete from  VRPRJ_CUSTOMER 
  where  VRPRJ_CUSTOMERID = aVRPRJ_CUSTOMERID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*��������� � �������������*/
procedure VRPRJ_CUSTOMER_SAVE /*���������*/ (
 aCURSESSION CHAR,
 aVRPRJ_CUSTOMERid CHAR,
aInstanceID CHAR 
,aCustomer CHAR/* �������� *//* �������� */
,athe_Comment VARCHAR2 := null /* ���������� *//* ���������� */
,aSubContructor
 NUMBER := null /* ������������ *//* ������������ */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERID=aVRPRJ_CUSTOMERID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERid=aVRPRJ_CUSTOMERID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRPRJ_CUSTOMER',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=VRPRJ_CUSTOMER');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_CUSTOMER_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_CUSTOMERid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_CUSTOMER');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_CUSTOMER',
 aVERB=>'EDITROW',  aThe_Resource=>aVRPRJ_CUSTOMERid,aLogInstanceID=>aInstanceID);
 update  VRPRJ_CUSTOMER set ChangeStamp=sysdate
,
  Customer=aCustomer
,
  the_Comment=athe_Comment
,
  SubContructor=aSubContructor
  where  VRPRJ_CUSTOMERID = aVRPRJ_CUSTOMERID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRPRJ_CUSTOMER',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=VRPRJ_CUSTOMER');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_CUSTOMER');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_CUSTOMER',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRPRJ_CUSTOMERid,aLogInstanceID=>aInstanceID);
 insert into   VRPRJ_CUSTOMER
 (  VRPRJ_CUSTOMERID 
,InstanceID
,Customer

,the_Comment

,SubContructor

 ) values ( aVRPRJ_CUSTOMERID 
,aInstanceID
,aCustomer

,athe_Comment

,aSubContructor

 ); 
 VRPRJ_CUSTOMER_SINIT( aCURSESSION,aVRPRJ_CUSTOMERid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRPRJ_CUSTOMER_PARENT /*���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from VRPRJ_CUSTOMER where  VRPRJ_CUSTOMERid=aRowID;
 end; 


procedure VRPRJ_CUSTOMER_ISLOCKED /*���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERid=aRowID;
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
  VRPRJ_CUSTOMER_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRPRJ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRPRJ_CUSTOMER_LOCK /*���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 VRPRJ_CUSTOMER_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  VRPRJ_CUSTOMER_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=VRPRJ_CUSTOMER');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRPRJ_CUSTOMER set LockUserID =auserID ,LockSessionID =null where VRPRJ_CUSTOMERid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRPRJ_CUSTOMER set LockUserID =null,LockSessionID =aCURSESSION  where VRPRJ_CUSTOMERid=aRowID;
     return;
   end if;
 end ;


procedure VRPRJ_CUSTOMER_HCL /*���������*/ (
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


procedure VRPRJ_CUSTOMER_UNLOCK /*���������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 VRPRJ_CUSTOMER_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRPRJ_CUSTOMER set LockUserID =null  where VRPRJ_CUSTOMERid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRPRJ_CUSTOMER set LockSessionID =null  where VRPRJ_CUSTOMERid=aRowID;
     return;
   end if;
 end; 


procedure VRPRJ_CUSTOMER_SINIT /*���������*/ (
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
 select  SecurityStyleID into atmpID from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =VRPRJ_CUSTOMER');
    return;
  end if;
if aSecurityStyleID is null then
 VRPRJ_CUSTOMER_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRPRJ_CUSTOMER set securitystyleid =aStyleID where VRPRJ_CUSTOMERid = aRowID;
else 
 update VRPRJ_CUSTOMER set securitystyleid =aSecurityStyleID where VRPRJ_CUSTOMERid = aRowID;
end if; 
end ; 


procedure VRPRJ_CUSTOMER_propagate /*���������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRPRJ_CUSTOMER where VRPRJ_CUSTOMERid=aRowid;
end;



procedure VRPRJ_Contract_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_Contractid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aVRPRJ_Contractid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRPRJ_Contract where VRPRJ_ContractID=aVRPRJ_ContractID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRPRJ_Contract where VRPRJ_Contractid=aVRPRJ_ContractID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRPRJ_Contract');
    return;
  end if;
  aBRIEF:=func.VRPRJ_Contract_BRIEF_F(aVRPRJ_Contractid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRPRJ_Contract_DELETE /*��������*/ (
 aCURSESSION CHAR,
 aVRPRJ_Contractid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from VRPRJ_Contract where VRPRJ_ContractID=aVRPRJ_ContractID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRPRJ_Contract where VRPRJ_Contractid=aVRPRJ_ContractID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRPRJ_Contract',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=VRPRJ_Contract');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_Contract_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_Contractid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=VRPRJ_Contract');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_Contract',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRPRJ_Contractid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRPRJ_Contract is select  instanceid ID from instance where OwnerPartName ='VRPRJ_Contract' and OwnerRowID=aVRPRJ_Contractid;
row_VRPRJ_Contract  chld_VRPRJ_Contract%ROWTYPE;
begin
--open chld_VRPRJ_Contract;
for row_VRPRJ_Contract in chld_VRPRJ_Contract loop
 Kernel.INSTANCE_OWNER (acursession,row_VRPRJ_Contract.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRPRJ_Contract.id);
end loop;
--close chld_VRPRJ_Contract;
end ;
  delete from  VRPRJ_Contract 
  where  VRPRJ_ContractID = aVRPRJ_ContractID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*��������*/
procedure VRPRJ_Contract_SAVE /*��������*/ (
 aCURSESSION CHAR,
 aVRPRJ_Contractid CHAR,
aInstanceID CHAR 
,aContract CHAR/* ������� *//* ������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from VRPRJ_Contract where VRPRJ_ContractID=aVRPRJ_ContractID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRPRJ_Contract where VRPRJ_Contractid=aVRPRJ_ContractID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRPRJ_Contract',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=VRPRJ_Contract');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_Contract_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_Contractid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_Contract');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_Contract',
 aVERB=>'EDITROW',  aThe_Resource=>aVRPRJ_Contractid,aLogInstanceID=>aInstanceID);
 update  VRPRJ_Contract set ChangeStamp=sysdate
,
  Contract=aContract
  where  VRPRJ_ContractID = aVRPRJ_ContractID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRPRJ_Contract',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=VRPRJ_Contract');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_Contract');
    return;
  end if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_Contract',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRPRJ_Contractid,aLogInstanceID=>aInstanceID);
 insert into   VRPRJ_Contract
 (  VRPRJ_ContractID 
,InstanceID
,Contract

 ) values ( aVRPRJ_ContractID 
,aInstanceID
,aContract

 ); 
 VRPRJ_Contract_SINIT( aCURSESSION,aVRPRJ_Contractid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRPRJ_Contract_PARENT /*��������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from VRPRJ_Contract where  VRPRJ_Contractid=aRowID;
 end; 


procedure VRPRJ_Contract_ISLOCKED /*��������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRPRJ_Contract where VRPRJ_Contractid=aRowID;
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
  VRPRJ_Contract_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRPRJ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRPRJ_Contract_LOCK /*��������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 VRPRJ_Contract_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  VRPRJ_Contract_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRPRJ_Contract where VRPRJ_Contractid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=VRPRJ_Contract');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRPRJ_Contract set LockUserID =auserID ,LockSessionID =null where VRPRJ_Contractid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRPRJ_Contract set LockUserID =null,LockSessionID =aCURSESSION  where VRPRJ_Contractid=aRowID;
     return;
   end if;
 end ;


procedure VRPRJ_Contract_HCL /*��������*/ (
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


procedure VRPRJ_Contract_UNLOCK /*��������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 VRPRJ_Contract_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRPRJ_Contract set LockUserID =null  where VRPRJ_Contractid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRPRJ_Contract set LockSessionID =null  where VRPRJ_Contractid=aRowID;
     return;
   end if;
 end; 


procedure VRPRJ_Contract_SINIT /*��������*/ (
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
 select  SecurityStyleID into atmpID from VRPRJ_Contract where VRPRJ_Contractid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =VRPRJ_Contract');
    return;
  end if;
if aSecurityStyleID is null then
 VRPRJ_Contract_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRPRJ_Contract set securitystyleid =aStyleID where VRPRJ_Contractid = aRowID;
else 
 update VRPRJ_Contract set securitystyleid =aSecurityStyleID where VRPRJ_Contractid = aRowID;
end if; 
end ; 


procedure VRPRJ_Contract_propagate /*��������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRPRJ_Contract where VRPRJ_Contractid=aRowid;
end;



procedure VRPRJ_COMMON_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_COMMONid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
if aVRPRJ_COMMONid is null then aBRIEF:=''; return; end if;
 -- Brief body -- 
select count(*)into existsCnt from VRPRJ_COMMON where VRPRJ_COMMONID=aVRPRJ_COMMONID;
if existsCnt >0
 then
 --  verify access  --
 select  SecurityStyleID into atmpid from VRPRJ_COMMON where VRPRJ_COMMONid=aVRPRJ_COMMONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'BRIEF',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'No access for BRIEF Structure=VRPRJ_COMMON');
    return;
  end if;
  aBRIEF:=func.VRPRJ_COMMON_BRIEF_F(aVRPRJ_COMMONid);
else
  aBRIEF:= '�������� �������������';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
end; 


procedure VRPRJ_COMMON_DELETE /*����� ����������*/ (
 aCURSESSION CHAR,
 aVRPRJ_COMMONid CHAR,
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
end if;
 -- Delete body -- 
select count(*) into existsCnt from VRPRJ_COMMON where VRPRJ_COMMONID=aVRPRJ_COMMONID;
if existsCnt >0 then
 --  verify access  --
 select   SecurityStyleID into atmpID from VRPRJ_COMMON where VRPRJ_COMMONid=aVRPRJ_COMMONID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW',aaccess=>aaccess ) ;
 if aaccess=0 then 
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'DELETEROW:VRPRJ_COMMON',aaccess=>aaccess); 
    if aaccess=0 then
      raise_application_error(-20000,'��� ���� �� ��������. ������=VRPRJ_COMMON');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_COMMON_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_COMMONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ �������������. ������=VRPRJ_COMMON');
    return;
  end if;
  --begin tran--  
 -- erase child items --
select  MTZ.newid() into aSysLogid from SYS.DUAL;
 MTZSystem.SysLog_SAVE (aCURSESSION=>acursession ,aTheSession=>acursession, aInstanceID=>aSysInstID, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_COMMON',
 aVERB=>'DELETEROW',  aThe_Resource=>aVRPRJ_COMMONid, aLogInstanceID=>aInstanceID);
declare cursor chld_VRPRJ_COMMON is select  instanceid ID from instance where OwnerPartName ='VRPRJ_COMMON' and OwnerRowID=aVRPRJ_COMMONid;
row_VRPRJ_COMMON  chld_VRPRJ_COMMON%ROWTYPE;
begin
--open chld_VRPRJ_COMMON;
for row_VRPRJ_COMMON in chld_VRPRJ_COMMON loop
 Kernel.INSTANCE_OWNER (acursession,row_VRPRJ_COMMON.id,null,null);
 Kernel.INSTANCE_DELETE (acursession,row_VRPRJ_COMMON.id);
end loop;
--close chld_VRPRJ_COMMON;
end ;
  delete from  VRPRJ_COMMON 
  where  VRPRJ_COMMONID = aVRPRJ_COMMONID; 
 end if;
 -- close transaction --
 <<del_error>>
 existsCnt:=0;
end;


/*����� ����������*/
procedure VRPRJ_COMMON_SAVE /*����� ����������*/ (
 aCURSESSION CHAR,
 aVRPRJ_COMMONid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* ���� ����������� *//* ���� ����������� */
,aProjectType CHAR/* ��� ������� *//* ��� ������� */
,aname
 VARCHAR2/* �������� *//* �������� */
,aInfo VARCHAR2 := null /* �������� *//* �������� */
,atheFile VARCHAR2 := null /* ���� */
,atheFile_EXT varchar2 /* ���� */
,aMainPerson CHAR := null /* ������������� *//* ������������� */
,aProjectClosed
 NUMBER/* ������ �������� *//* ������ �������� */
,aPlanStart
 DATE := null /* �������� ������ *//* �������� ������ */
,aPlanWork
 NUMBER/* �������� ������������ *//* �������� ������������ */
,aPlanFinish
 DATE := null /* �������� ���������� *//* �������� ���������� */
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 -- Insert / Update body -- 
select count(*) into existsCnt from VRPRJ_COMMON where VRPRJ_COMMONID=aVRPRJ_COMMONID;
if existsCnt >0
 then
 --  UPDATE  --
 --  verify access  --
 select SecurityStyleID into atmpID from VRPRJ_COMMON where VRPRJ_COMMONid=aVRPRJ_COMMONID;
 CheckVerbRight( acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW',aaccess=>aaccess); 
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'EDITROW:VRPRJ_COMMON',aaccess=>aaccess ); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �����������. ������=VRPRJ_COMMON');
      return;
    end if;
  end if;
 --  verify lock  --
 VRPRJ_COMMON_ISLOCKED( acursession=>acursession,aROWID=>aVRPRJ_COMMONid,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_COMMON');
    return;
  end if;
 -- update row  --
select mtz.newid() into asyslogid from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_COMMON',
 aVERB=>'EDITROW',  aThe_Resource=>aVRPRJ_COMMONid,aLogInstanceID=>aInstanceID);
 update  VRPRJ_COMMON set ChangeStamp=sysdate
,
  Org=aOrg
,
  ProjectType=aProjectType
,
  name=aname
,
  Info=aInfo
,
  theFile=atheFile
,theFile_EXT=
atheFile_EXT 
,
  MainPerson=aMainPerson
,
  ProjectClosed=aProjectClosed
,
  PlanStart=aPlanStart
,
  PlanWork=aPlanWork
,
  PlanFinish=aPlanFinish
  where  VRPRJ_COMMONID = aVRPRJ_COMMONID; 
 -- checking unique constraints  --


 else
 --  INSERT  --
 --  verify access  --
 select  SecurityStyleID into atmpID from instance where instanceid=ainstanceid;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW',aaccess=>aaccess );
 if aaccess=0 
  then
    CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'CREATEROW:VRPRJ_COMMON',aaccess=>aaccess); 
    if aaccess=0 
    then
      raise_application_error(-20000,'��� ���� �� �������� �����. ������=VRPRJ_COMMON');
      return;
    end if;
 end if;
 MTZ.Kernel.instance_ISLOCKED( acursession=>acursession,aROWID=>aInstanceID,aIsLocked=>aaccess); 
 if aaccess>2 
  then
    raise_application_error(-20000,'������ ������������� ������ ������������. ������=VRPRJ_COMMON');
    return;
  end if;
select Count(*) into existsCnt from VRPRJ_COMMON where 
InstanceID=aInstanceID;
if existsCnt >0 
 then
    raise_application_error(-20000,'���������� ������� ������ ������ � ������������ ������. ������: <VRPRJ_COMMON>');
    return;
 End if;
select MTZ.newid() into aSysLogID from sys.dual;
 MTZSystem.SysLog_SAVE( aTheSession=>acursession,aCURSESSION=>acursession, aInstanceID=>asysinstid, aSysLogid=>aSysLogid, aLogStructID => 'VRPRJ_COMMON',
 aVERB=>'CREATEROW',  aThe_Resource=>aVRPRJ_COMMONid,aLogInstanceID=>aInstanceID);
 insert into   VRPRJ_COMMON
 (  VRPRJ_COMMONID 
,InstanceID
,Org

,ProjectType

,name

,Info

,theFile

,theFile_EXT
,MainPerson

,ProjectClosed

,PlanStart

,PlanWork

,PlanFinish

 ) values ( aVRPRJ_COMMONID 
,aInstanceID
,aOrg

,aProjectType

,aname

,aInfo

,atheFile

,atheFile_EXT
,aMainPerson

,aProjectClosed

,aPlanStart

,aPlanWork

,aPlanFinish

 ); 
 VRPRJ_COMMON_SINIT( aCURSESSION,aVRPRJ_COMMONid,atmpid);
 -- checking unique constraints  --


 end if;
 -- close transaction --
 end; 


procedure VRPRJ_COMMON_PARENT /*����� ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
  aParentTable := 'INSTANCE';
  select  INSTANCEID into aParentID from VRPRJ_COMMON where  VRPRJ_COMMONid=aRowID;
 end; 


procedure VRPRJ_COMMON_ISLOCKED /*����� ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 select  LockUserID,LockSessionID into aLockUserID, aLockSessionID from VRPRJ_COMMON where VRPRJ_COMMONid=aRowID;
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
  VRPRJ_COMMON_parent (aCURSESSION,aROWID,aParentID,aParentTable);
  if aparenttable='INSTANCE' then
      astr := 'begin Kernel.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    Else
      astr := 'begin VRPRJ.' || aPARENTTABLE || '_islocked (:1,:2,:3); end;';
    end if;
  execute immediate  astr using aCURSESSION,aParentID ,out aISLocked;
 end; 


procedure VRPRJ_COMMON_LOCK /*����� ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserid from  the_session where the_sessionid=acursession;
 VRPRJ_COMMON_ISLOCKED (aCURSESSION,aROWID,aISLocked );
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������� ������ �������������');
    return;
  end if;
 if aIsLocked =0  
 then
  VRPRJ_COMMON_HCL (acursession,aRowID,aisLocked);
  if aIsLocked >=3  
  then
     raise_application_error(-20000,'� ������ ������ ������� �������� ������, ������� ������������� ������ �������������');
     return;
   end if;
 end if;
 select  SecurityStyleID into atmpID from VRPRJ_COMMON where VRPRJ_COMMONid=aROWID;
 CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'LOCKROW',aaccess=>aaccess); 
 if aaccess=0 
 then
    raise_application_error(-20000,'��� ���� �� ���������� �����. ������=VRPRJ_COMMON');
    return;
  end if;
   if  aLockMode =2  
   then   
    update VRPRJ_COMMON set LockUserID =auserID ,LockSessionID =null where VRPRJ_COMMONid=aRowID;
     return;
   end if;
   if  aLockMode =1  
   then   
    update VRPRJ_COMMON set LockUserID =null,LockSessionID =aCURSESSION  where VRPRJ_COMMONid=aRowID;
     return;
   end if;
 end ;


procedure VRPRJ_COMMON_HCL /*����� ����������*/ (
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


procedure VRPRJ_COMMON_UNLOCK /*����� ����������*/ (
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
    raise_application_error(-20000,'������ ��� ���������.');
    return;
  end if;
 select usersid into auserID from the_session where the_sessionid=acursession;
 VRPRJ_COMMON_ISLOCKED( aCURSESSION,aROWID,aISLocked);
 if aIsLocked >=3  
  then
    raise_application_error(-20000,'������ ������������ ������ �������������');
    return;
  end if;
   if  aIsLocked =2  
   then   
    update VRPRJ_COMMON set LockUserID =null  where VRPRJ_COMMONid=aRowID;
     return;
   end if;
   if  aIsLocked =1  
   then   
    update VRPRJ_COMMON set LockSessionID =null  where VRPRJ_COMMONid=aRowID;
     return;
   end if;
 end; 


procedure VRPRJ_COMMON_SINIT /*����� ����������*/ (
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
 select  SecurityStyleID into atmpID from VRPRJ_COMMON where VRPRJ_COMMONid=aROWID;
  CheckVerbRight (acursession=>acursession,aThe_Resource=>atmpID,averb=>'SECURE',aaccess=>aaccess); 
 if aaccess=0 
  then
    raise_application_error(-20000,'��� ���� �� ���������� �������. ������ =VRPRJ_COMMON');
    return;
  end if;
if aSecurityStyleID is null then
 VRPRJ_COMMON_parent( aCURSESSION,aROWID,aParentID ,aParentTable);
  astr:= 'select SecurityStyleID  from ' || aParentTable || ' where ' ||aParentTable || 'id=:1' ;
  execute immediate astr into aStyleID using aParentid;
 update VRPRJ_COMMON set securitystyleid =aStyleID where VRPRJ_COMMONid = aRowID;
else 
 update VRPRJ_COMMON set securitystyleid =aSecurityStyleID where VRPRJ_COMMONid = aRowID;
end if; 
end ; 


procedure VRPRJ_COMMON_propagate /*����� ����������*/ (
 aCURSESSION CHAR,
 aRowID CHAR
) as 
achildlistid CHAR(38);
aSSID CHAR(38);
begin
select securityStyleid into aSSID from VRPRJ_COMMON where VRPRJ_COMMONid=aRowid;
end;


end VRPRJ;

/



