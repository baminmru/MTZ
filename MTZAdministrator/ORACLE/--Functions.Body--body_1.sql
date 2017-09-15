
/* --body*/

 

 create or replace package body Func as

  function instance_BRIEF_F  (
 ainstanceid CHAR
)return varchar2 as  
 aBRIEF varchar2(4000);
 atmpCnt numeric;
 begin
if ainstanceid is null then aBRIEF:=''; return (aBRIEF); end if;
 -- Brief body --
select count(*) into aTmpCnt from instance where instanceID=ainstanceID;
if aTmpCnt >0 then
  aBRIEF:='';
  select aBRIEF
  ||  nvl(Name,' ')||'; ' into aBrief
  from instance where  instanceID = ainstanceID;
else 
  aBRIEF:= 'неверный идентификатор';
End if;
 aBRIEF:=substr(aBRIEF,1,255);
  return (aBRIEF);
End;


function SrvMessageInfo_BRIEF_F  (
 aSrvMessageInfoid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSrvMessageInfoid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from SrvMessageInfo where SrvMessageInfoID=aSrvMessageInfoID;
if aTmpCnt >0 then
  aBRIEF:='';
select ForUser
 into atmpID  from SrvMessageInfo  where  SrvMessageInfoID = aSrvMessageInfoID ;
 atmpBrief := func.Users_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(msgDate),' ') ||'; '
  into aBrief from SrvMessageInfo  where  SrvMessageInfoID = aSrvMessageInfoID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function STDMail_To_BRIEF_F  (
 aSTDMail_Toid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSTDMail_Toid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from STDMail_To where STDMail_ToID=aSTDMail_ToID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheTo),' ') ||'; '
  into aBrief from STDMail_To  where  STDMail_ToID = aSTDMail_ToID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function STDMail_Attach_BRIEF_F  (
 aSTDMail_Attachid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSTDMail_Attachid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from STDMail_Attach where STDMail_AttachID=aSTDMail_AttachID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheName),' ') ||'; '
  into aBrief from STDMail_Attach  where  STDMail_AttachID = aSTDMail_AttachID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function STDMail_Info_BRIEF_F  (
 aSTDMail_Infoid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSTDMail_Infoid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from STDMail_Info where STDMail_InfoID=aSTDMail_InfoID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Subject),' ') ||'; '
  into aBrief from STDMail_Info  where  STDMail_InfoID = aSTDMail_InfoID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOPT_MOVE_BRIEF_F  (
 aITTOPT_MOVEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOPT_MOVEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOPT_MOVE where ITTOPT_MOVEID=aITTOPT_MOVEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(sequence),' ') ||'; '
  into aBrief from ITTOPT_MOVE  where  ITTOPT_MOVEID = aITTOPT_MOVEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOPT_DEF_BRIEF_F  (
 aITTOPT_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOPT_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOPT_DEF where ITTOPT_DEFID=aITTOPT_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select OptType
 into atmpID  from ITTOPT_DEF  where  ITTOPT_DEFID = aITTOPT_DEFID ;
 atmpBrief := func.ITTD_OPTTYPE_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(OPtDate),' ') ||'; '
  into aBrief from ITTOPT_DEF  where  ITTOPT_DEFID = aITTOPT_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(DateToOptimize),' ') ||'; '
  into aBrief from ITTOPT_DEF  where  ITTOPT_DEFID = aITTOPT_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Num_zones_BRIEF_F  (
 aNum_zonesid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aNum_zonesid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Num_zones where Num_zonesID=aNum_zonesID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(ZoneMask),' ') ||'; '
  into aBrief from Num_zones  where  Num_zonesID = aNum_zonesID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Num_Values_BRIEF_F  (
 aNum_Valuesid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aNum_Valuesid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Num_Values where Num_ValuesID=aNum_ValuesID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(the_Value),' ') ||'; '
  into aBrief from Num_Values  where  Num_ValuesID = aNum_ValuesID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Num_head_BRIEF_F  (
 aNum_headid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aNum_headid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Num_head where Num_headID=aNum_headID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from Num_head  where  Num_headID = aNum_headID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FilterFieldGroup_BRIEF_F  (
 aFilterFieldGroupid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFilterFieldGroupid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FilterFieldGroup where FilterFieldGroupID=aFilterFieldGroupID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from FilterFieldGroup  where  FilterFieldGroupID = aFilterFieldGroupID; 
 select aBRIEF 
  ||  nvl(to_char(Caption),' ') ||'; '
  into aBrief from FilterFieldGroup  where  FilterFieldGroupID = aFilterFieldGroupID; 
  select  aBRIEF ||
  Decode( AllowIgnore
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from FilterFieldGroup where FilterFieldGroupID=aFilterFieldGroupID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FileterField_BRIEF_F  (
 aFileterFieldid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFileterFieldid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FileterField where FileterFieldID=aFileterFieldID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from FileterField  where  FileterFieldID = aFileterFieldID; 
 select aBRIEF 
  ||  nvl(to_char(Caption),' ') ||'; '
  into aBrief from FileterField  where  FileterFieldID = aFileterFieldID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Filters_BRIEF_F  (
 aFiltersid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFiltersid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Filters where FiltersID=aFiltersID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from Filters  where  FiltersID = aFiltersID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function StateAction_BRIEF_F  (
 aStateActionid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aStateActionid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from StateAction where StateActionID=aStateActionID;
if aTmpCnt >0 then
  aBRIEF:='';
select OnDocStatus
 into atmpID  from StateAction  where  StateActionID = aStateActionID ;
 atmpBrief := func.OBJSTATUS_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBSDIC_QTYPE_BRIEF_F  (
 aWEBSDIC_QTYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBSDIC_QTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBSDIC_QTYPE where WEBSDIC_QTYPEID=aWEBSDIC_QTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Sequence),' ') ||'; '
  into aBrief from WEBSDIC_QTYPE  where  WEBSDIC_QTYPEID = aWEBSDIC_QTYPEID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBSDIC_QTYPE  where  WEBSDIC_QTYPEID = aWEBSDIC_QTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBSDIC_DEF_BRIEF_F  (
 aWEBSDIC_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBSDIC_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBSDIC_DEF where WEBSDIC_DEFID=aWEBSDIC_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select WEBS
 into atmpID  from WEBSDIC_DEF  where  WEBSDIC_DEFID = aWEBSDIC_DEFID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBSDIC_PAGETYPE_BRIEF_F  (
 aWEBSDIC_PAGETYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBSDIC_PAGETYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBSDIC_PAGETYPE where WEBSDIC_PAGETYPEID=aWEBSDIC_PAGETYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Sequence),' ') ||'; '
  into aBrief from WEBSDIC_PAGETYPE  where  WEBSDIC_PAGETYPEID = aWEBSDIC_PAGETYPEID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBSDIC_PAGETYPE  where  WEBSDIC_PAGETYPEID = aWEBSDIC_PAGETYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZ2JOB_DEF_BRIEF_F  (
 aMTZ2JOB_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMTZ2JOB_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from MTZ2JOB_DEF where MTZ2JOB_DEFID=aMTZ2JOB_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(EventDate),' ') ||'; '
  into aBrief from MTZ2JOB_DEF  where  MTZ2JOB_DEFID = aMTZ2JOB_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(EvenType),' ') ||'; '
  into aBrief from MTZ2JOB_DEF  where  MTZ2JOB_DEFID = aMTZ2JOB_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_LOCKED_BRIEF_F  (
 aREPD_LOCKEDid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aREPD_LOCKEDid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from REPD_LOCKED where REPD_LOCKEDID=aREPD_LOCKEDID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(StructType),' ') ||'; '
  into aBrief from REPD_LOCKED  where  REPD_LOCKEDID = aREPD_LOCKEDID; 
 select aBRIEF 
  ||  nvl(to_char(ObjectType),' ') ||'; '
  into aBrief from REPD_LOCKED  where  REPD_LOCKEDID = aREPD_LOCKEDID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_RequestQuery_BRIEF_F  (
 aREPD_RequestQueryid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aREPD_RequestQueryid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from REPD_RequestQuery where REPD_RequestQueryID=aREPD_RequestQueryID;
if aTmpCnt >0 then
  aBRIEF:='';
select SourceSrv
 into atmpID  from REPD_RequestQuery  where  REPD_RequestQueryID = aREPD_RequestQueryID ;
 atmpBrief := func.REPD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_ResQueryRcv_BRIEF_F  (
 aREPD_ResQueryRcvid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aREPD_ResQueryRcvid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from REPD_ResQueryRcv where REPD_ResQueryRcvID=aREPD_ResQueryRcvID;
if aTmpCnt >0 then
  aBRIEF:='';
select ReceiveRec
 into atmpID  from REPD_ResQueryRcv  where  REPD_ResQueryRcvID = aREPD_ResQueryRcvID ;
 atmpBrief := func.REPD_RecvQ_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_PROV_BRIEF_F  (
 aREPD_PROVid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aREPD_PROVid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from REPD_PROV where REPD_PROVID=aREPD_PROVID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from REPD_PROV  where  REPD_PROVID = aREPD_PROVID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_SRV_BRIEF_F  (
 aREPD_SRVid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aREPD_SRVid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from REPD_SRV where REPD_SRVID=aREPD_SRVID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from REPD_SRV  where  REPD_SRVID = aREPD_SRVID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_SNDTO_BRIEF_F  (
 aREPD_SNDTOid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aREPD_SNDTOid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from REPD_SNDTO where REPD_SNDTOID=aREPD_SNDTOID;
if aTmpCnt >0 then
  aBRIEF:='';
select DestSrv
 into atmpID  from REPD_SNDTO  where  REPD_SNDTOID = aREPD_SNDTOID ;
 atmpBrief := func.REPD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_CONST_BRIEF_F  (
 aREPD_CONSTid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aREPD_CONSTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from REPD_CONST where REPD_CONSTID=aREPD_CONSTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from REPD_CONST  where  REPD_CONSTID = aREPD_CONSTID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_REPTYPE_BRIEF_F  (
 aREPD_REPTYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aREPD_REPTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from REPD_REPTYPE where REPD_REPTYPEID=aREPD_REPTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
  select  aBRIEF ||
  Decode( ReplicaType
 ,0
 ,'Весь документ'
 ,2
 ,'Локальный'
 ,1
 ,'Построчно'
,'.') into aBrief from REPD_REPTYPE where REPD_REPTYPEID=aREPD_REPTYPEID;
select TheObjectType
 into atmpID  from REPD_REPTYPE  where  REPD_REPTYPEID = aREPD_REPTYPEID ;
 atmpBrief := func.OBJECTTYPE_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_SendQ_BRIEF_F  (
 aREPD_SendQid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aREPD_SendQid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from REPD_SendQ where REPD_SendQID=aREPD_SendQID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(FileName),' ') ||'; '
  into aBrief from REPD_SendQ  where  REPD_SendQID = aREPD_SendQID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_RecvQ_BRIEF_F  (
 aREPD_RecvQid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aREPD_RecvQid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from REPD_RecvQ where REPD_RecvQID=aREPD_RecvQID;
if aTmpCnt >0 then
  aBRIEF:='';
select SourceSrv
 into atmpID  from REPD_RecvQ  where  REPD_RecvQID = aREPD_RecvQID ;
 atmpBrief := func.REPD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ST_MAIN_BRIEF_F  (
 aST_MAINid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aST_MAINid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ST_MAIN where ST_MAINID=aST_MAINID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(AccessDate),' ') ||'; '
  into aBrief from ST_MAIN  where  ST_MAINID = aST_MAINID; 
select WEBS_Page
 into atmpID  from ST_MAIN  where  ST_MAINID = aST_MAINID ;
 atmpBrief := func.WEBS_PAGEDEF_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ST_DEF_BRIEF_F  (
 aST_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aST_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ST_DEF where ST_DEFID=aST_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ST_DEF  where  ST_DEFID = aST_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ST_PAGES_BRIEF_F  (
 aST_PAGESid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aST_PAGESid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ST_PAGES where ST_PAGESID=aST_PAGESID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(AccessDate),' ') ||'; '
  into aBrief from ST_PAGES  where  ST_PAGESID = aST_PAGESID; 
select WEBS_Page
 into atmpID  from ST_PAGES  where  ST_PAGESID = aST_PAGESID ;
 atmpBrief := func.WEBS_PAGEDEF_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_MOROZ_BRIEF_F  (
 aITTD_MOROZid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_MOROZid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_MOROZ where ITTD_MOROZID=aITTD_MOROZID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheClient
 into atmpID  from ITTD_MOROZ  where  ITTD_MOROZID = aITTD_MOROZID ;
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(MorozConst),' ') ||'; '
  into aBrief from ITTD_MOROZ  where  ITTD_MOROZID = aITTD_MOROZID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_RULE_BRIEF_F  (
 aITTD_RULEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_RULEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_RULE where ITTD_RULEID=aITTD_RULEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_RULE  where  ITTD_RULEID = aITTD_RULEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_PLTYPE_BRIEF_F  (
 aITTD_PLTYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_PLTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_PLTYPE where ITTD_PLTYPEID=aITTD_PLTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_PLTYPE  where  ITTD_PLTYPEID = aITTD_PLTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_FACTORY_BRIEF_F  (
 aITTD_FACTORYid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_FACTORYid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_FACTORY where ITTD_FACTORYID=aITTD_FACTORYID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_FACTORY  where  ITTD_FACTORYID = aITTD_FACTORYID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_ZTYPE_BRIEF_F  (
 aITTD_ZTYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_ZTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_ZTYPE where ITTD_ZTYPEID=aITTD_ZTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_ZTYPE  where  ITTD_ZTYPEID = aITTD_ZTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_GTYPE_BRIEF_F  (
 aITTD_GTYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_GTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_GTYPE where ITTD_GTYPEID=aITTD_GTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_GTYPE  where  ITTD_GTYPEID = aITTD_GTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_KILLPLACE_BRIEF_F  (
 aITTD_KILLPLACEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_KILLPLACEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_KILLPLACE where ITTD_KILLPLACEID=aITTD_KILLPLACEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_KILLPLACE  where  ITTD_KILLPLACEID = aITTD_KILLPLACEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_COUNTRY_BRIEF_F  (
 aITTD_COUNTRYid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_COUNTRYid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_COUNTRY where ITTD_COUNTRYID=aITTD_COUNTRYID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_COUNTRY  where  ITTD_COUNTRYID = aITTD_COUNTRYID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_QTYPE_BRIEF_F  (
 aITTD_QTYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_QTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_QTYPE where ITTD_QTYPEID=aITTD_QTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_QTYPE  where  ITTD_QTYPEID = aITTD_QTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_CAMERA_BRIEF_F  (
 aITTD_CAMERAid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_CAMERAid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_CAMERA where ITTD_CAMERAID=aITTD_CAMERAID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_CAMERA  where  ITTD_CAMERAID = aITTD_CAMERAID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_SRV_BRIEF_F  (
 aITTD_SRVid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_SRVid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_SRV where ITTD_SRVID=aITTD_SRVID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_SRV  where  ITTD_SRVID = aITTD_SRVID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_ATYPE_BRIEF_F  (
 aITTD_ATYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_ATYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_ATYPE where ITTD_ATYPEID=aITTD_ATYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_ATYPE  where  ITTD_ATYPEID = aITTD_ATYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_OPTTYPE_BRIEF_F  (
 aITTD_OPTTYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_OPTTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_OPTTYPE where ITTD_OPTTYPEID=aITTD_OPTTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_OPTTYPE  where  ITTD_OPTTYPEID = aITTD_OPTTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_EMAIL_BRIEF_F  (
 aITTD_EMAILid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_EMAILid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_EMAIL where ITTD_EMAILID=aITTD_EMAILID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(FIO),' ') ||'; '
  into aBrief from ITTD_EMAIL  where  ITTD_EMAILID = aITTD_EMAILID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTD_PART_BRIEF_F  (
 aITTD_PARTid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTD_PARTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTD_PART where ITTD_PARTID=aITTD_PARTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ITTD_PART  where  ITTD_PARTID = aITTD_PARTID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTPL_DEF_BRIEF_F  (
 aITTPL_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTPL_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTPL_DEF where ITTPL_DEFID=aITTPL_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Code),' ') ||'; '
  into aBrief from ITTPL_DEF  where  ITTPL_DEFID = aITTPL_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOP_OPLNK_BRIEF_F  (
 aITTOP_OPLNKid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOP_OPLNKid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOP_OPLNK where ITTOP_OPLNKID=aITTOP_OPLNKID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheUser
 into atmpID  from ITTOP_OPLNK  where  ITTOP_OPLNKID = aITTOP_OPLNKID ;
 atmpBrief := func.Users_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOP_OPKAM_BRIEF_F  (
 aITTOP_OPKAMid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOP_OPKAMid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOP_OPKAM where ITTOP_OPKAMID=aITTOP_OPKAMID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheKamera
 into atmpID  from ITTOP_OPKAM  where  ITTOP_OPKAMID = aITTOP_OPKAMID ;
 atmpBrief := func.ITTD_CAMERA_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOP_KLNK_BRIEF_F  (
 aITTOP_KLNKid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOP_KLNKid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOP_KLNK where ITTOP_KLNKID=aITTOP_KLNKID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheUser
 into atmpID  from ITTOP_KLNK  where  ITTOP_KLNKID = aITTOP_KLNKID ;
 atmpBrief := func.Users_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOP_KCAM_BRIEF_F  (
 aITTOP_KCAMid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOP_KCAMid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOP_KCAM where ITTOP_KCAMID=aITTOP_KCAMID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheKamera
 into atmpID  from ITTOP_KCAM  where  ITTOP_KCAMID = aITTOP_KCAMID ;
 atmpBrief := func.ITTD_CAMERA_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOP_KCLI_BRIEF_F  (
 aITTOP_KCLIid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOP_KCLIid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOP_KCLI where ITTOP_KCLIID=aITTOP_KCLIID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheClient
 into atmpID  from ITTOP_KCLI  where  ITTOP_KCLIID = aITTOP_KCLIID ;
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTFN_MAX_BRIEF_F  (
 aITTFN_MAXid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTFN_MAXid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTFN_MAX where ITTFN_MAXID=aITTFN_MAXID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(PalMaxNum),' ') ||'; '
  into aBrief from ITTFN_MAX  where  ITTFN_MAXID = aITTFN_MAXID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function STDJournlaExtInfo_BRIEF_F  (
 aSTDJournlaExtInfoid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSTDJournlaExtInfoid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from STDJournlaExtInfo where STDJournlaExtInfoID=aSTDJournlaExtInfoID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheName),' ') ||'; '
  into aBrief from STDJournlaExtInfo  where  STDJournlaExtInfoID = aSTDJournlaExtInfoID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function STDJournalExtParam_BRIEF_F  (
 aSTDJournalExtParamid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSTDJournalExtParamid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from STDJournalExtParam where STDJournalExtParamID=aSTDJournalExtParamID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(FieldName),' ') ||'; '
  into aBrief from STDJournalExtParam  where  STDJournalExtParamID = aSTDJournalExtParamID; 
 select aBRIEF 
  ||  nvl(to_char(ParamName),' ') ||'; '
  into aBrief from STDJournalExtParam  where  STDJournalExtParamID = aSTDJournalExtParamID; 
select TargetPlatform
 into atmpID  from STDJournalExtParam  where  STDJournalExtParamID = aSTDJournalExtParamID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function STDJournalExtFlt_BRIEF_F  (
 aSTDJournalExtFltid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSTDJournalExtFltid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from STDJournalExtFlt where STDJournalExtFltID=aSTDJournalExtFltID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(ViewSource),' ') ||'; '
  into aBrief from STDJournalExtFlt  where  STDJournalExtFltID = aSTDJournalExtFltID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function STDJournalExtField_BRIEF_F  (
 aSTDJournalExtFieldid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSTDJournalExtFieldid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from STDJournalExtField where STDJournalExtFieldID=aSTDJournalExtFieldID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(ViewField),' ') ||'; '
  into aBrief from STDJournalExtField  where  STDJournalExtFieldID = aSTDJournalExtFieldID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Ext_Photos_BRIEF_F  (
 aExt_Photosid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aExt_Photosid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Ext_Photos where Ext_PhotosID=aExt_PhotosID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheName),' ') ||'; '
  into aBrief from Ext_Photos  where  Ext_PhotosID = aExt_PhotosID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Ext_Photo_Call_BRIEF_F  (
 aExt_Photo_Callid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aExt_Photo_Callid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Ext_Photo_Call where Ext_Photo_CallID=aExt_Photo_CallID;
if aTmpCnt >0 then
  aBRIEF:='';
select TargetPlatform
 into atmpID  from Ext_Photo_Call  where  Ext_Photo_CallID = aExt_Photo_CallID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELDTYPE_BRIEF_F  (
 aFIELDTYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFIELDTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FIELDTYPE where FIELDTYPEID=aFIELDTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from FIELDTYPE  where  FIELDTYPEID = aFIELDTYPEID; 
  select  aBRIEF ||
  Decode( TypeStyle
 ,3
 ,'Интервал'
 ,5
 ,'Элемент оформления'
 ,0
 ,'Скалярный тип'
 ,4
 ,'Ссылка'
 ,2
 ,'Перечисление'
 ,1
 ,'Выражение'
,'.') into aBrief from FIELDTYPE where FIELDTYPEID=aFIELDTYPEID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELDTYPEMAP_BRIEF_F  (
 aFIELDTYPEMAPid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFIELDTYPEMAPid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FIELDTYPEMAP where FIELDTYPEMAPID=aFIELDTYPEMAPID;
if aTmpCnt >0 then
  aBRIEF:='';
select Target
 into atmpID  from FIELDTYPEMAP  where  FIELDTYPEMAPID = aFIELDTYPEMAPID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(StoageType),' ') ||'; '
  into aBrief from FIELDTYPEMAP  where  FIELDTYPEMAPID = aFIELDTYPEMAPID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENUMITEM_BRIEF_F  (
 aENUMITEMid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENUMITEMid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENUMITEM where ENUMITEMID=aENUMITEMID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ENUMITEM  where  ENUMITEMID = aENUMITEMID; 
 select aBRIEF 
  ||  nvl(to_char(NameValue),' ') ||'; '
  into aBrief from ENUMITEM  where  ENUMITEMID = aENUMITEMID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function SHAREDMETHOD_BRIEF_F  (
 aSHAREDMETHODid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSHAREDMETHODid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from SHAREDMETHOD where SHAREDMETHODID=aSHAREDMETHODID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from SHAREDMETHOD  where  SHAREDMETHODID = aSHAREDMETHODID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function SCRIPT_BRIEF_F  (
 aSCRIPTid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSCRIPTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from SCRIPT where SCRIPTID=aSCRIPTID;
if aTmpCnt >0 then
  aBRIEF:='';
select Target
 into atmpID  from SCRIPT  where  SCRIPTID = aSCRIPTID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PARAMETERS_BRIEF_F  (
 aPARAMETERSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPARAMETERSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PARAMETERS where PARAMETERSID=aPARAMETERSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from PARAMETERS  where  PARAMETERSID = aPARAMETERSID; 
 select aBRIEF 
  ||  nvl(to_char(Caption),' ') ||'; '
  into aBrief from PARAMETERS  where  PARAMETERSID = aPARAMETERSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function OBJECTTYPE_BRIEF_F  (
 aOBJECTTYPEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aOBJECTTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from OBJECTTYPE where OBJECTTYPEID=aOBJECTTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
select Package
 into atmpID  from OBJECTTYPE  where  OBJECTTYPEID = aOBJECTTYPEID ;
 atmpBrief := func.MTZAPP_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(the_Comment),' ') ||'; '
  into aBrief from OBJECTTYPE  where  OBJECTTYPEID = aOBJECTTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PART_BRIEF_F  (
 aPARTid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPARTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PART where PARTID=aPARTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Caption),' ') ||'; '
  into aBrief from PART  where  PARTID = aPARTID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from PART  where  PARTID = aPARTID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PARTMENU_BRIEF_F  (
 aPARTMENUid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPARTMENUid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PARTMENU where PARTMENUID=aPARTMENUID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from PARTMENU  where  PARTMENUID = aPARTMENUID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PARTPARAMMAP_BRIEF_F  (
 aPARTPARAMMAPid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPARTPARAMMAPid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PARTPARAMMAP where PARTPARAMMAPID=aPARTPARAMMAPID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(FieldName),' ') ||'; '
  into aBrief from PARTPARAMMAP  where  PARTPARAMMAPID = aPARTPARAMMAPID; 
 select aBRIEF 
  ||  nvl(to_char(ParamName),' ') ||'; '
  into aBrief from PARTPARAMMAP  where  PARTPARAMMAPID = aPARTPARAMMAPID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELD_BRIEF_F  (
 aFIELDid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFIELDid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FIELD where FIELDID=aFIELDID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Caption),' ') ||'; '
  into aBrief from FIELD  where  FIELDID = aFIELDID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from FIELD  where  FIELDID = aFIELDID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELDVALIDATOR_BRIEF_F  (
 aFIELDVALIDATORid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFIELDVALIDATORid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FIELDVALIDATOR where FIELDVALIDATORID=aFIELDVALIDATORID;
if aTmpCnt >0 then
  aBRIEF:='';
select Target
 into atmpID  from FIELDVALIDATOR  where  FIELDVALIDATORID = aFIELDVALIDATORID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELDMENU_BRIEF_F  (
 aFIELDMENUid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFIELDMENUid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FIELDMENU where FIELDMENUID=aFIELDMENUID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from FIELDMENU  where  FIELDMENUID = aFIELDMENUID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELDPARAMMAP_BRIEF_F  (
 aFIELDPARAMMAPid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFIELDPARAMMAPid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FIELDPARAMMAP where FIELDPARAMMAPID=aFIELDPARAMMAPID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(FieldName),' ') ||'; '
  into aBrief from FIELDPARAMMAP  where  FIELDPARAMMAPID = aFIELDPARAMMAPID; 
 select aBRIEF 
  ||  nvl(to_char(ParamName),' ') ||'; '
  into aBrief from FIELDPARAMMAP  where  FIELDPARAMMAPID = aFIELDPARAMMAPID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FldExtenders_BRIEF_F  (
 aFldExtendersid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFldExtendersid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FldExtenders where FldExtendersID=aFldExtendersID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheName),' ') ||'; '
  into aBrief from FldExtenders  where  FldExtendersID = aFldExtendersID; 
select TargetPlatform
 into atmpID  from FldExtenders  where  FldExtendersID = aFldExtendersID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(TheObject),' ') ||'; '
  into aBrief from FldExtenders  where  FldExtendersID = aFldExtendersID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELDEXPRESSION_BRIEF_F  (
 aFIELDEXPRESSIONid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFIELDEXPRESSIONid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FIELDEXPRESSION where FIELDEXPRESSIONID=aFIELDEXPRESSIONID;
if aTmpCnt >0 then
  aBRIEF:='';
select Target
 into atmpID  from FIELDEXPRESSION  where  FIELDEXPRESSIONID = aFIELDEXPRESSIONID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function DINAMICFILTERSCRIPT_BRIEF_F  (
 aDINAMICFILTERSCRIPTid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aDINAMICFILTERSCRIPTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from DINAMICFILTERSCRIPT where DINAMICFILTERSCRIPTID=aDINAMICFILTERSCRIPTID;
if aTmpCnt >0 then
  aBRIEF:='';
select Target
 into atmpID  from DINAMICFILTERSCRIPT  where  DINAMICFILTERSCRIPTID = aDINAMICFILTERSCRIPTID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELDSRCDEF_BRIEF_F  (
 aFIELDSRCDEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFIELDSRCDEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FIELDSRCDEF where FIELDSRCDEFID=aFIELDSRCDEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DataSource),' ') ||'; '
  into aBrief from FIELDSRCDEF  where  FIELDSRCDEFID = aFIELDSRCDEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PARTVIEW_BRIEF_F  (
 aPARTVIEWid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPARTVIEWid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PARTVIEW where PARTVIEWID=aPARTVIEWID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from PARTVIEW  where  PARTVIEWID = aPARTVIEWID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ViewColumn_BRIEF_F  (
 aViewColumnid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aViewColumnid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ViewColumn where ViewColumnID=aViewColumnID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ViewColumn  where  ViewColumnID = aViewColumnID; 
select FromPart
 into atmpID  from ViewColumn  where  ViewColumnID = aViewColumnID ;
 atmpBrief := func.PART_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
  select  aBRIEF ||
  Decode( Aggregation
 ,5
 ,'MAX'
 ,1
 ,'AVG'
 ,3
 ,'SUM'
 ,2
 ,'COUNT'
 ,4
 ,'MIN'
 ,6
 ,'CUSTOM'
 ,0
 ,'none'
,'.') into aBrief from ViewColumn where ViewColumnID=aViewColumnID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PARTVIEW_LNK_BRIEF_F  (
 aPARTVIEW_LNKid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPARTVIEW_LNKid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PARTVIEW_LNK where PARTVIEW_LNKID=aPARTVIEW_LNKID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheView
 into atmpID  from PARTVIEW_LNK  where  PARTVIEW_LNKID = aPARTVIEW_LNKID ;
 atmpBrief := func.PARTVIEW_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ExtenderInterface_BRIEF_F  (
 aExtenderInterfaceid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aExtenderInterfaceid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ExtenderInterface where ExtenderInterfaceID=aExtenderInterfaceID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheName),' ') ||'; '
  into aBrief from ExtenderInterface  where  ExtenderInterfaceID = aExtenderInterfaceID; 
select TargetPlatform
 into atmpID  from ExtenderInterface  where  ExtenderInterfaceID = aExtenderInterfaceID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(TheObject),' ') ||'; '
  into aBrief from ExtenderInterface  where  ExtenderInterfaceID = aExtenderInterfaceID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VALIDATOR_BRIEF_F  (
 aVALIDATORid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVALIDATORid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VALIDATOR where VALIDATORID=aVALIDATORID;
if aTmpCnt >0 then
  aBRIEF:='';
select Target
 into atmpID  from VALIDATOR  where  VALIDATORID = aVALIDATORID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function UNIQUECONSTRAINT_BRIEF_F  (
 aUNIQUECONSTRAINTid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aUNIQUECONSTRAINTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from UNIQUECONSTRAINT where UNIQUECONSTRAINTID=aUNIQUECONSTRAINTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from UNIQUECONSTRAINT  where  UNIQUECONSTRAINTID = aUNIQUECONSTRAINTID; 
  select  aBRIEF ||
  Decode( PerParent
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from UNIQUECONSTRAINT where UNIQUECONSTRAINTID=aUNIQUECONSTRAINTID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function CONSTRAINTFIELD_BRIEF_F  (
 aCONSTRAINTFIELDid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aCONSTRAINTFIELDid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from CONSTRAINTFIELD where CONSTRAINTFIELDID=aCONSTRAINTFIELDID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheField
 into atmpID  from CONSTRAINTFIELD  where  CONSTRAINTFIELDID = aCONSTRAINTFIELDID ;
 atmpBrief := func.FIELD_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function INSTANCEVALIDATOR_BRIEF_F  (
 aINSTANCEVALIDATORid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aINSTANCEVALIDATORid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from INSTANCEVALIDATOR where INSTANCEVALIDATORID=aINSTANCEVALIDATORID;
if aTmpCnt >0 then
  aBRIEF:='';
select Target
 into atmpID  from INSTANCEVALIDATOR  where  INSTANCEVALIDATORID = aINSTANCEVALIDATORID ;
 atmpBrief := func.GENERATOR_TARGET_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function OBJSTATUS_BRIEF_F  (
 aOBJSTATUSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aOBJSTATUSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from OBJSTATUS where OBJSTATUSID=aOBJSTATUSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from OBJSTATUS  where  OBJSTATUSID = aOBJSTATUSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function NEXTSTATE_BRIEF_F  (
 aNEXTSTATEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aNEXTSTATEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from NEXTSTATE where NEXTSTATEID=aNEXTSTATEID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheState
 into atmpID  from NEXTSTATE  where  NEXTSTATEID = aNEXTSTATEID ;
 atmpBrief := func.OBJSTATUS_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function OBJECTMODE_BRIEF_F  (
 aOBJECTMODEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aOBJECTMODEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from OBJECTMODE where OBJECTMODEID=aOBJECTMODEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from OBJECTMODE  where  OBJECTMODEID = aOBJECTMODEID; 
  select  aBRIEF ||
  Decode( DefaultMode
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from OBJECTMODE where OBJECTMODEID=aOBJECTMODEID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function STRUCTRESTRICTION_BRIEF_F  (
 aSTRUCTRESTRICTIONid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSTRUCTRESTRICTIONid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from STRUCTRESTRICTION where STRUCTRESTRICTIONID=aSTRUCTRESTRICTIONID;
if aTmpCnt >0 then
  aBRIEF:='';
select Struct
 into atmpID  from STRUCTRESTRICTION  where  STRUCTRESTRICTIONID = aSTRUCTRESTRICTIONID ;
 atmpBrief := func.PART_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
  select  aBRIEF ||
  Decode( AllowRead
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from STRUCTRESTRICTION where STRUCTRESTRICTIONID=aSTRUCTRESTRICTIONID;
  select  aBRIEF ||
  Decode( AllowAdd
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from STRUCTRESTRICTION where STRUCTRESTRICTIONID=aSTRUCTRESTRICTIONID;
  select  aBRIEF ||
  Decode( AllowEdit
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from STRUCTRESTRICTION where STRUCTRESTRICTIONID=aSTRUCTRESTRICTIONID;
  select  aBRIEF ||
  Decode( AllowDelete
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from STRUCTRESTRICTION where STRUCTRESTRICTIONID=aSTRUCTRESTRICTIONID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELDRESTRICTION_BRIEF_F  (
 aFIELDRESTRICTIONid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFIELDRESTRICTIONid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FIELDRESTRICTION where FIELDRESTRICTIONID=aFIELDRESTRICTIONID;
if aTmpCnt >0 then
  aBRIEF:='';
select ThePart
 into atmpID  from FIELDRESTRICTION  where  FIELDRESTRICTIONID = aFIELDRESTRICTIONID ;
 atmpBrief := func.PART_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
select TheField
 into atmpID  from FIELDRESTRICTION  where  FIELDRESTRICTIONID = aFIELDRESTRICTIONID ;
 atmpBrief := func.FIELD_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
  select  aBRIEF ||
  Decode( AllowRead
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from FIELDRESTRICTION where FIELDRESTRICTIONID=aFIELDRESTRICTIONID;
  select  aBRIEF ||
  Decode( AllowModify
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from FIELDRESTRICTION where FIELDRESTRICTIONID=aFIELDRESTRICTIONID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function METHODRESTRICTION_BRIEF_F  (
 aMETHODRESTRICTIONid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMETHODRESTRICTIONid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from METHODRESTRICTION where METHODRESTRICTIONID=aMETHODRESTRICTIONID;
if aTmpCnt >0 then
  aBRIEF:='';
select Method
 into atmpID  from METHODRESTRICTION  where  METHODRESTRICTIONID = aMETHODRESTRICTIONID ;
 atmpBrief := func.SHAREDMETHOD_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
  select  aBRIEF ||
  Decode( IsRestricted
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from METHODRESTRICTION where METHODRESTRICTIONID=aMETHODRESTRICTIONID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function TYPEMENU_BRIEF_F  (
 aTYPEMENUid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aTYPEMENUid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from TYPEMENU where TYPEMENUID=aTYPEMENUID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from TYPEMENU  where  TYPEMENUID = aTYPEMENUID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZAPP_BRIEF_F  (
 aMTZAPPid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMTZAPPid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from MTZAPP where MTZAPPID=aMTZAPPID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from MTZAPP  where  MTZAPPID = aMTZAPPID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ParentPackage_BRIEF_F  (
 aParentPackageid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aParentPackageid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ParentPackage where ParentPackageID=aParentPackageID;
if aTmpCnt >0 then
  aBRIEF:='';
select Package
 into atmpID  from ParentPackage  where  ParentPackageID = aParentPackageID ;
 atmpBrief := func.MTZAPP_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function GENPACKAGE_BRIEF_F  (
 aGENPACKAGEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aGENPACKAGEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from GENPACKAGE where GENPACKAGEID=aGENPACKAGEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from GENPACKAGE  where  GENPACKAGEID = aGENPACKAGEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function GENERATOR_TARGET_BRIEF_F  (
 aGENERATOR_TARGETid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aGENERATOR_TARGETid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from GENERATOR_TARGET where GENERATOR_TARGETID=aGENERATOR_TARGETID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from GENERATOR_TARGET  where  GENERATOR_TARGETID = aGENERATOR_TARGETID; 
  select  aBRIEF ||
  Decode( TargetType
 ,0
 ,'СУБД'
 ,4
 ,'АРМ'
 ,3
 ,'Документация'
 ,1
 ,'МОДЕЛЬ'
 ,2
 ,'Приложение'
,'.') into aBrief from GENERATOR_TARGET where GENERATOR_TARGETID=aGENERATOR_TARGETID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function GENMANUALCODE_BRIEF_F  (
 aGENMANUALCODEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aGENMANUALCODEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from GENMANUALCODE where GENMANUALCODEID=aGENMANUALCODEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from GENMANUALCODE  where  GENMANUALCODEID = aGENMANUALCODEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function GENCONTROLS_BRIEF_F  (
 aGENCONTROLSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aGENCONTROLSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from GENCONTROLS where GENCONTROLSID=aGENCONTROLSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(ControlProgID),' ') ||'; '
  into aBrief from GENCONTROLS  where  GENCONTROLSID = aGENCONTROLSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function GENREFERENCE_BRIEF_F  (
 aGENREFERENCEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aGENREFERENCEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from GENREFERENCE where GENREFERENCEID=aGENREFERENCEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from GENREFERENCE  where  GENREFERENCEID = aGENREFERENCEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function LocalizeInfo_BRIEF_F  (
 aLocalizeInfoid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aLocalizeInfoid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from LocalizeInfo where LocalizeInfoID=aLocalizeInfoID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(LangFull),' ') ||'; '
  into aBrief from LocalizeInfo  where  LocalizeInfoID = aLocalizeInfoID; 
 select aBRIEF 
  ||  nvl(to_char(LangShort),' ') ||'; '
  into aBrief from LocalizeInfo  where  LocalizeInfoID = aLocalizeInfoID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTNO_YC_BRIEF_F  (
 aITTNO_YCid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTNO_YCid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTNO_YC where ITTNO_YCID=aITTNO_YCID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(YNum),' ') ||'; '
  into aBrief from ITTNO_YC  where  ITTNO_YCID = aITTNO_YCID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTNO_CMN_BRIEF_F  (
 aITTNO_CMNid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTNO_CMNid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTNO_CMN where ITTNO_CMNID=aITTNO_CMNID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(IN_TIME),' ') ||'; '
  into aBrief from ITTNO_CMN  where  ITTNO_CMNID = aITTNO_CMNID; 
 select aBRIEF 
  ||  nvl(to_char(Out_Time),' ') ||'; '
  into aBrief from ITTNO_CMN  where  ITTNO_CMNID = aITTNO_CMNID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTNO_ZC_BRIEF_F  (
 aITTNO_ZCid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTNO_ZCid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTNO_ZC where ITTNO_ZCID=aITTNO_ZCID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(ZNum),' ') ||'; '
  into aBrief from ITTNO_ZC  where  ITTNO_ZCID = aITTNO_ZCID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function InfoStoreDef_BRIEF_F  (
 aInfoStoreDefid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aInfoStoreDefid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from InfoStoreDef where InfoStoreDefID=aInfoStoreDefID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from InfoStoreDef  where  InfoStoreDefID = aInfoStoreDefID; 
  select  aBRIEF ||
  Decode( InfoStoreType
 ,2
 ,'Групповой'
 ,1
 ,'Персональный'
 ,0
 ,' Общий'
,'.') into aBrief from InfoStoreDef where InfoStoreDefID=aInfoStoreDefID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Folder_BRIEF_F  (
 aFolderid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFolderid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Folder where FolderID=aFolderID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from Folder  where  FolderID = aFolderID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Shortcut_BRIEF_F  (
 aShortcutid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aShortcutid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Shortcut where ShortcutID=aShortcutID;
if aTmpCnt >0 then
  aBRIEF:='';
select DocItem
 into atmpID  from Shortcut  where  ShortcutID = aShortcutID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Reports_BRIEF_F  (
 aReportsid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aReportsid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Reports where ReportsID=aReportsID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from Reports  where  ReportsID = aReportsID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function RPTStruct_BRIEF_F  (
 aRPTStructid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aRPTStructid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from RPTStruct where RPTStructID=aRPTStructID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from RPTStruct  where  RPTStructID = aRPTStructID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function RPTFields_BRIEF_F  (
 aRPTFieldsid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aRPTFieldsid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from RPTFields where RPTFieldsID=aRPTFieldsID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from RPTFields  where  RPTFieldsID = aRPTFieldsID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function RPTFormula_BRIEF_F  (
 aRPTFormulaid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aRPTFormulaid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from RPTFormula where RPTFormulaID=aRPTFormulaID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from RPTFormula  where  RPTFormulaID = aRPTFormulaID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTPR_DEF_BRIEF_F  (
 aITTPR_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTPR_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTPR_DEF where ITTPR_DEFID=aITTPR_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Poddon),' ') ||'; '
  into aBrief from ITTPR_DEF  where  ITTPR_DEFID = aITTPR_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(Client),' ') ||'; '
  into aBrief from ITTPR_DEF  where  ITTPR_DEFID = aITTPR_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from ITTPR_DEF  where  ITTPR_DEFID = aITTPR_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZExt_def_BRIEF_F  (
 aMTZExt_defid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMTZExt_defid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from MTZExt_def where MTZExt_defID=aMTZExt_defID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from MTZExt_def  where  MTZExt_defID = aMTZExt_defID; 
  select  aBRIEF ||
  Decode( ExtType
 ,1
 ,'OnFormExt'
 ,7
 ,'CodeGenerator'
 ,3
 ,'JrnlAddExt'
 ,6
 ,'VerifyRowExt'
 ,0
 ,'StatusExt'
 ,8
 ,'ARMGenerator'
 ,5
 ,'DefaultExt'
 ,2
 ,'CustomExt'
 ,4
 ,'JrnlRunExt'
,'.') into aBrief from MTZExt_def where MTZExt_defID=aMTZExt_defID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZExtRel_BRIEF_F  (
 aMTZExtRelid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMTZExtRelid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from MTZExtRel where MTZExtRelID=aMTZExtRelID;
if aTmpCnt >0 then
  aBRIEF:='';
  select  aBRIEF ||
  Decode( ThePlatform
 ,2
 ,'JAVA'
 ,3
 ,'OTHER'
 ,1
 ,'DOTNET'
 ,0
 ,'VB6'
,'.') into aBrief from MTZExtRel where MTZExtRelID=aMTZExtRelID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTCS_LIN_BRIEF_F  (
 aITTCS_LINid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTCS_LINid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTCS_LIN where ITTCS_LINID=aITTCS_LINID;
if aTmpCnt >0 then
  aBRIEF:='';
select SRV
 into atmpID  from ITTCS_LIN  where  ITTCS_LINID = aITTCS_LINID ;
 atmpBrief := func.ITTD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
  select  aBRIEF ||
  Decode( UseSrv
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from ITTCS_LIN where ITTCS_LINID=aITTCS_LINID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTCS_DEF_BRIEF_F  (
 aITTCS_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTCS_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTCS_DEF where ITTCS_DEFID=aITTCS_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select CLIENTCODE
 into atmpID  from ITTCS_DEF  where  ITTCS_DEFID = aITTCS_DEFID ;
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function SysLog_BRIEF_F  (
 aSysLogid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aSysLogid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from SysLog where SysLogID=aSysLogID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheSession
 into atmpID  from SysLog  where  SysLogID = aSysLogID ;
 atmpBrief := func.the_Session_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(LogStructID),' ') ||'; '
  into aBrief from SysLog  where  SysLogID = aSysLogID; 
 select aBRIEF 
  ||  nvl(to_char(VERB),' ') ||'; '
  into aBrief from SysLog  where  SysLogID = aSysLogID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function the_Session_BRIEF_F  (
 athe_Sessionid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if athe_Sessionid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from the_Session where the_SessionID=athe_SessionID;
if aTmpCnt >0 then
  aBRIEF:='';
select UserRole
 into atmpID  from the_Session  where  the_SessionID = athe_SessionID ;
 atmpBrief := func.Groups_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
  select  aBRIEF ||
  Decode( Closed
 ,1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from the_Session where the_SessionID=athe_SessionID;
select Usersid
 into atmpID  from the_Session  where  the_SessionID = athe_SessionID ;
 atmpBrief := func.Users_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function LogReader_BRIEF_F  (
 aLogReaderid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aLogReaderid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from LogReader where LogReaderID=aLogReaderID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from LogReader  where  LogReaderID = aLogReaderID; 
 select aBRIEF 
  ||  nvl(to_char(ReadMarker),' ') ||'; '
  into aBrief from LogReader  where  LogReaderID = aLogReaderID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Verb_BRIEF_F  (
 aVerbid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVerbid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Verb where VerbID=aVerbID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from Verb  where  VerbID = aVerbID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Users_BRIEF_F  (
 aUsersid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aUsersid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Users where UsersID=aUsersID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Family),' ') ||'; '
  into aBrief from Users  where  UsersID = aUsersID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from Users  where  UsersID = aUsersID; 
 select aBRIEF 
  ||  nvl(to_char(SurName),' ') ||'; '
  into aBrief from Users  where  UsersID = aUsersID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Groups_BRIEF_F  (
 aGroupsid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aGroupsid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Groups where GroupsID=aGroupsID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from Groups  where  GroupsID = aGroupsID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function GroupUser_BRIEF_F  (
 aGroupUserid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aGroupUserid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from GroupUser where GroupUserID=aGroupUserID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheUser
 into atmpID  from GroupUser  where  GroupUserID = aGroupUserID ;
 atmpBrief := func.Users_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZSEC_RIGHT_BRIEF_F  (
 aMTZSEC_RIGHTid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMTZSEC_RIGHTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from MTZSEC_RIGHT where MTZSEC_RIGHTID=aMTZSEC_RIGHTID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheGroup
 into atmpID  from MTZSEC_RIGHT  where  MTZSEC_RIGHTID = aMTZSEC_RIGHTID ;
 atmpBrief := func.Groups_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(ProtectedItem),' ') ||'; '
  into aBrief from MTZSEC_RIGHT  where  MTZSEC_RIGHTID = aMTZSEC_RIGHTID; 
  select  aBRIEF ||
  Decode( Allow
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from MTZSEC_RIGHT where MTZSEC_RIGHTID=aMTZSEC_RIGHTID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ROLES_USER_BRIEF_F  (
 aROLES_USERid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aROLES_USERid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ROLES_USER where ROLES_USERID=aROLES_USERID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheUser
 into atmpID  from ROLES_USER  where  ROLES_USERID = aROLES_USERID ;
 atmpBrief := func.Users_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ROLES_MAP_BRIEF_F  (
 aROLES_MAPid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aROLES_MAPid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ROLES_MAP where ROLES_MAPID=aROLES_MAPID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheGroup
 into atmpID  from ROLES_MAP  where  ROLES_MAPID = aROLES_MAPID ;
 atmpBrief := func.Groups_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ROLES_DOC_BRIEF_F  (
 aROLES_DOCid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aROLES_DOCid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ROLES_DOC where ROLES_DOCID=aROLES_DOCID;
if aTmpCnt >0 then
  aBRIEF:='';
select The_Document
 into atmpID  from ROLES_DOC  where  ROLES_DOCID = aROLES_DOCID ;
 atmpBrief := func.OBJECTTYPE_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ROLES_DOC_STATE_BRIEF_F  (
 aROLES_DOC_STATEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aROLES_DOC_STATEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ROLES_DOC_STATE where ROLES_DOC_STATEID=aROLES_DOC_STATEID;
if aTmpCnt >0 then
  aBRIEF:='';
select The_State
 into atmpID  from ROLES_DOC_STATE  where  ROLES_DOC_STATEID = aROLES_DOC_STATEID ;
 atmpBrief := func.OBJSTATUS_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
select The_Mode
 into atmpID  from ROLES_DOC_STATE  where  ROLES_DOC_STATEID = aROLES_DOC_STATEID ;
 atmpBrief := func.OBJECTMODE_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ROLES_DEF_BRIEF_F  (
 aROLES_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aROLES_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ROLES_DEF where ROLES_DEFID=aROLES_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from ROLES_DEF  where  ROLES_DEFID = aROLES_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ROLES_REPORTS_BRIEF_F  (
 aROLES_REPORTSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aROLES_REPORTSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ROLES_REPORTS where ROLES_REPORTSID=aROLES_REPORTSID;
if aTmpCnt >0 then
  aBRIEF:='';
select The_Report
 into atmpID  from ROLES_REPORTS  where  ROLES_REPORTSID = aROLES_REPORTSID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ROLES_WP_BRIEF_F  (
 aROLES_WPid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aROLES_WPid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ROLES_WP where ROLES_WPID=aROLES_WPID;
if aTmpCnt >0 then
  aBRIEF:='';
select WP
 into atmpID  from ROLES_WP  where  ROLES_WPID = aROLES_WPID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ROLES_ACT_BRIEF_F  (
 aROLES_ACTid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aROLES_ACTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ROLES_ACT where ROLES_ACTID=aROLES_ACTID;
if aTmpCnt >0 then
  aBRIEF:='';
  select  aBRIEF ||
  Decode( Accesible
 ,1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from ROLES_ACT where ROLES_ACTID=aROLES_ACTID;
select EntryPoints
 into atmpID  from ROLES_ACT  where  ROLES_ACTID = aROLES_ACTID ;
 atmpBrief := func.EntryPoints_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function JournalColumn_BRIEF_F  (
 aJournalColumnid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aJournalColumnid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from JournalColumn where JournalColumnID=aJournalColumnID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from JournalColumn  where  JournalColumnID = aJournalColumnID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function JColumnSource_BRIEF_F  (
 aJColumnSourceid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aJColumnSourceid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from JColumnSource where JColumnSourceID=aJColumnSourceID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(ViewField),' ') ||'; '
  into aBrief from JColumnSource  where  JColumnSourceID = aJColumnSourceID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Journal_BRIEF_F  (
 aJournalid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aJournalid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from Journal where JournalID=aJournalID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from Journal  where  JournalID = aJournalID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function JournalSrc_BRIEF_F  (
 aJournalSrcid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aJournalSrcid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from JournalSrc where JournalSrcID=aJournalSrcID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(PartView),' ') ||'; '
  into aBrief from JournalSrc  where  JournalSrcID = aJournalSrcID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZ_Inst_Build_BRIEF_F  (
 aMTZ_Inst_Buildid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMTZ_Inst_Buildid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from MTZ_Inst_Build where MTZ_Inst_BuildID=aMTZ_Inst_BuildID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(PRODUCT_NAME),' ') ||'; '
  into aBrief from MTZ_Inst_Build  where  MTZ_Inst_BuildID = aMTZ_Inst_BuildID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZ_Inst_Build_Sec_BRIEF_F  (
 aMTZ_Inst_Build_Secid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMTZ_Inst_Build_Secid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from MTZ_Inst_Build_Sec where MTZ_Inst_Build_SecID=aMTZ_Inst_Build_SecID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheSection
 into atmpID  from MTZ_Inst_Build_Sec  where  MTZ_Inst_Build_SecID = aMTZ_Inst_Build_SecID ;
 atmpBrief := func.MTZ_Inst_Section_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZ_Inst_Section_BRIEF_F  (
 aMTZ_Inst_Sectionid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMTZ_Inst_Sectionid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from MTZ_Inst_Section where MTZ_Inst_SectionID=aMTZ_Inst_SectionID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheName),' ') ||'; '
  into aBrief from MTZ_Inst_Section  where  MTZ_Inst_SectionID = aMTZ_Inst_SectionID; 
  select  aBRIEF ||
  Decode( TheTargetPlatform
 ,2
 ,'JAVA'
 ,3
 ,'OTHER'
 ,1
 ,'DOTNET'
 ,0
 ,'VB6'
,'.') into aBrief from MTZ_Inst_Section where MTZ_Inst_SectionID=aMTZ_Inst_SectionID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZ_Inst_Sec_Files_BRIEF_F  (
 aMTZ_Inst_Sec_Filesid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMTZ_Inst_Sec_Filesid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from MTZ_Inst_Sec_Files where MTZ_Inst_Sec_FilesID=aMTZ_Inst_Sec_FilesID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheSource),' ') ||'; '
  into aBrief from MTZ_Inst_Sec_Files  where  MTZ_Inst_Sec_FilesID = aMTZ_Inst_Sec_FilesID; 
select SysstemObject
 into atmpID  from MTZ_Inst_Sec_Files  where  MTZ_Inst_Sec_FilesID = aMTZ_Inst_Sec_FilesID ;
 atmpBrief := func.OBJECTTYPE_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
select TheApplication
 into atmpID  from MTZ_Inst_Sec_Files  where  MTZ_Inst_Sec_FilesID = aMTZ_Inst_Sec_FilesID ;
 atmpBrief := func.MTZAPP_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZ_Inst_Common_BRIEF_F  (
 aMTZ_Inst_Commonid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aMTZ_Inst_Commonid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from MTZ_Inst_Common where MTZ_Inst_CommonID=aMTZ_Inst_CommonID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheName),' ') ||'; '
  into aBrief from MTZ_Inst_Common  where  MTZ_Inst_CommonID = aMTZ_Inst_CommonID; 
 select aBRIEF 
  ||  nvl(to_char(SEQ),' ') ||'; '
  into aBrief from MTZ_Inst_Common  where  MTZ_Inst_CommonID = aMTZ_Inst_CommonID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTTZ_DEF_BRIEF_F  (
 aITTTZ_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTTZ_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTTZ_DEF where ITTTZ_DEFID=aITTTZ_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DocDate),' ') ||'; '
  into aBrief from ITTTZ_DEF  where  ITTTZ_DEFID = aITTTZ_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(TheNumber),' ') ||'; '
  into aBrief from ITTTZ_DEF  where  ITTTZ_DEFID = aITTTZ_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(SupplierCode),' ') ||'; '
  into aBrief from ITTTZ_DEF  where  ITTTZ_DEFID = aITTTZ_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTTZ_LINES_BRIEF_F  (
 aITTTZ_LINESid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTTZ_LINESid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTTZ_LINES where ITTTZ_LINESID=aITTTZ_LINESID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheNumber),' ') ||'; '
  into aBrief from ITTTZ_LINES  where  ITTTZ_LINESID = aITTTZ_LINESID; 
 select aBRIEF 
  ||  nvl(to_char(SupplierCode),' ') ||'; '
  into aBrief from ITTTZ_LINES  where  ITTTZ_LINESID = aITTTZ_LINESID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITT2OPT_DEF_BRIEF_F  (
 aITT2OPT_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITT2OPT_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITT2OPT_DEF where ITT2OPT_DEFID=aITT2OPT_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select OptType
 into atmpID  from ITT2OPT_DEF  where  ITT2OPT_DEFID = aITT2OPT_DEFID ;
 atmpBrief := func.ITTD_OPTTYPE_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOUT_SRV_BRIEF_F  (
 aITTOUT_SRVid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOUT_SRVid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOUT_SRV where ITTOUT_SRVID=aITTOUT_SRVID;
if aTmpCnt >0 then
  aBRIEF:='';
select SRV
 into atmpID  from ITTOUT_SRV  where  ITTOUT_SRVID = aITTOUT_SRVID ;
 atmpBrief := func.ITTD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOUT_DEF_BRIEF_F  (
 aITTOUT_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOUT_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOUT_DEF where ITTOUT_DEFID=aITTOUT_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select ShipOrder
 into atmpID  from ITTOUT_DEF  where  ITTOUT_DEFID = aITTOUT_DEFID ;
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOUT_EPL_BRIEF_F  (
 aITTOUT_EPLid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOUT_EPLid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOUT_EPL where ITTOUT_EPLID=aITTOUT_EPLID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheNumber
 into atmpID  from ITTOUT_EPL  where  ITTOUT_EPLID = aITTOUT_EPLID ;
 atmpBrief := func.ITTPL_DEF_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOUT_LINES_BRIEF_F  (
 aITTOUT_LINESid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOUT_LINESid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOUT_LINES where ITTOUT_LINESID=aITTOUT_LINESID;
if aTmpCnt >0 then
  aBRIEF:='';
select LineAtQuery
 into atmpID  from ITTOUT_LINES  where  ITTOUT_LINESID = aITTOUT_LINESID ;
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTOUT_PALET_BRIEF_F  (
 aITTOUT_PALETid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTOUT_PALETid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTOUT_PALET where ITTOUT_PALETID=aITTOUT_PALETID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheNumber
 into atmpID  from ITTOUT_PALET  where  ITTOUT_PALETID = aITTOUT_PALETID ;
 atmpBrief := func.ITTPL_DEF_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTIN_QLINE_BRIEF_F  (
 aITTIN_QLINEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTIN_QLINEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTIN_QLINE where ITTIN_QLINEID=aITTIN_QLINEID;
if aTmpCnt >0 then
  aBRIEF:='';
select LineAtQuery
 into atmpID  from ITTIN_QLINE  where  ITTIN_QLINEID = aITTIN_QLINEID ;
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTIN_PALET_BRIEF_F  (
 aITTIN_PALETid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTIN_PALETid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTIN_PALET where ITTIN_PALETID=aITTIN_PALETID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheNumber
 into atmpID  from ITTIN_PALET  where  ITTIN_PALETID = aITTIN_PALETID ;
 atmpBrief := func.ITTPL_DEF_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTIN_SRV_BRIEF_F  (
 aITTIN_SRVid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTIN_SRVid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTIN_SRV where ITTIN_SRVID=aITTIN_SRVID;
if aTmpCnt >0 then
  aBRIEF:='';
select SRV
 into atmpID  from ITTIN_SRV  where  ITTIN_SRVID = aITTIN_SRVID ;
 atmpBrief := func.ITTD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTIN_DEF_BRIEF_F  (
 aITTIN_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTIN_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTIN_DEF where ITTIN_DEFID=aITTIN_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select QryCode
 into atmpID  from ITTIN_DEF  where  ITTIN_DEFID = aITTIN_DEFID ;
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTIN_EPL_BRIEF_F  (
 aITTIN_EPLid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTIN_EPLid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTIN_EPL where ITTIN_EPLID=aITTIN_EPLID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheNumber
 into atmpID  from ITTIN_EPL  where  ITTIN_EPLID = aITTIN_EPLID ;
 atmpBrief := func.ITTPL_DEF_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTSSCC_LINE_BRIEF_F  (
 aITTSSCC_LINEid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTSSCC_LINEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTSSCC_LINE where ITTSSCC_LINEID=aITTSSCC_LINEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(PalletCode),' ') ||'; '
  into aBrief from ITTSSCC_LINE  where  ITTSSCC_LINEID = aITTSSCC_LINEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ITTSSCC_DEF_BRIEF_F  (
 aITTSSCC_DEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aITTSSCC_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ITTSSCC_DEF where ITTSSCC_DEFID=aITTSSCC_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from ITTSSCC_DEF  where  ITTSSCC_DEFID = aITTSSCC_DEFID; 
select TheUser
 into atmpID  from ITTSSCC_DEF  where  ITTSSCC_DEFID = aITTSSCC_DEFID ;
 atmpBrief := func.Users_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WorkPlace_BRIEF_F  (
 aWorkPlaceid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWorkPlaceid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WorkPlace where WorkPlaceID=aWorkPlaceID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Caption),' ') ||'; '
  into aBrief from WorkPlace  where  WorkPlaceID = aWorkPlaceID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function EntryPoints_BRIEF_F  (
 aEntryPointsid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aEntryPointsid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from EntryPoints where EntryPointsID=aEntryPointsID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from EntryPoints  where  EntryPointsID = aEntryPointsID; 
 select aBRIEF 
  ||  nvl(to_char(Caption),' ') ||'; '
  into aBrief from EntryPoints  where  EntryPointsID = aEntryPointsID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function EPFilterLink_BRIEF_F  (
 aEPFilterLinkid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aEPFilterLinkid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from EPFilterLink where EPFilterLinkID=aEPFilterLinkID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(RowSource),' ') ||'; '
  into aBrief from EPFilterLink  where  EPFilterLinkID = aEPFilterLinkID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ARMTypes_BRIEF_F  (
 aARMTypesid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aARMTypesid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ARMTypes where ARMTypesID=aARMTypesID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheDocumentType
 into atmpID  from ARMTypes  where  ARMTypesID = aARMTypesID ;
 atmpBrief := func.OBJECTTYPE_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ARMJournal_BRIEF_F  (
 aARMJournalid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aARMJournalid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ARMJournal where ARMJournalID=aARMJournalID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheJournal
 into atmpID  from ARMJournal  where  ARMJournalID = aARMJournalID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ARMJRNLADD_BRIEF_F  (
 aARMJRNLADDid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aARMJRNLADDid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ARMJRNLADD where ARMJRNLADDID=aARMJRNLADDID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ARMJRNLADD  where  ARMJRNLADDID = aARMJRNLADDID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ARMJRNLREP_BRIEF_F  (
 aARMJRNLREPid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aARMJRNLREPid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ARMJRNLREP where ARMJRNLREPID=aARMJRNLREPID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(repname),' ') ||'; '
  into aBrief from ARMJRNLREP  where  ARMJRNLREPID = aARMJRNLREPID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ARMJRNLRUN_BRIEF_F  (
 aARMJRNLRUNid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aARMJRNLRUNid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ARMJRNLRUN where ARMJRNLRUNID=aARMJRNLRUNID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ARMJRNLRUN  where  ARMJRNLRUNID = aARMJRNLRUNID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_MAILLIST_BRIEF_F  (
 aWEBS_MAILLISTid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_MAILLISTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_MAILLIST where WEBS_MAILLISTID=aWEBS_MAILLISTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Email),' ') ||'; '
  into aBrief from WEBS_MAILLIST  where  WEBS_MAILLISTID = aWEBS_MAILLISTID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_ROLES_BRIEF_F  (
 aWEBS_ROLESid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_ROLESid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_ROLES where WEBS_ROLESID=aWEBS_ROLESID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBS_ROLES  where  WEBS_ROLESID = aWEBS_ROLESID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_PAGEDEF_BRIEF_F  (
 aWEBS_PAGEDEFid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_PAGEDEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_PAGEDEF where WEBS_PAGEDEFID=aWEBS_PAGEDEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(QueueNumber),' ') ||'; '
  into aBrief from WEBS_PAGEDEF  where  WEBS_PAGEDEFID = aWEBS_PAGEDEFID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBS_PAGEDEF  where  WEBS_PAGEDEFID = aWEBS_PAGEDEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_PICS_BRIEF_F  (
 aWEBS_PICSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_PICSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_PICS where WEBS_PICSID=aWEBS_PICSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBS_PICS  where  WEBS_PICSID = aWEBS_PICSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_PAGEMENU_BRIEF_F  (
 aWEBS_PAGEMENUid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_PAGEMENUid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_PAGEMENU where WEBS_PAGEMENUID=aWEBS_PAGEMENUID;
if aTmpCnt >0 then
  aBRIEF:='';
select UsePartRowsEditForm
 into atmpID  from WEBS_PAGEMENU  where  WEBS_PAGEMENUID = aWEBS_PAGEMENUID ;
 atmpBrief := func.WEBS_PAGEDEF_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_PAGECONTENT_BRIEF_F  (
 aWEBS_PAGECONTENTid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_PAGECONTENTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_PAGECONTENT where WEBS_PAGECONTENTID=aWEBS_PAGECONTENTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Content),' ') ||'; '
  into aBrief from WEBS_PAGECONTENT  where  WEBS_PAGECONTENTID = aWEBS_PAGECONTENTID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_PAGEPARS_BRIEF_F  (
 aWEBS_PAGEPARSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_PAGEPARSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_PAGEPARS where WEBS_PAGEPARSID=aWEBS_PAGEPARSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBS_PAGEPARS  where  WEBS_PAGEPARSID = aWEBS_PAGEPARSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_PAGECOMP_BRIEF_F  (
 aWEBS_PAGECOMPid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_PAGECOMPid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_PAGECOMP where WEBS_PAGECOMPID=aWEBS_PAGECOMPID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBS_PAGECOMP  where  WEBS_PAGECOMPID = aWEBS_PAGECOMPID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function TablePart_BRIEF_F  (
 aTablePartid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aTablePartid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from TablePart where TablePartID=aTablePartID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(FilterUserIDFieldName_),' ') ||'; '
  into aBrief from TablePart  where  TablePartID = aTablePartID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ReplaceValues_BRIEF_F  (
 aReplaceValuesid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aReplaceValuesid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ReplaceValues where ReplaceValuesID=aReplaceValuesID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ReplaceValues  where  ReplaceValuesID = aReplaceValuesID; 
 select aBRIEF 
  ||  nvl(to_char(SourceName),' ') ||'; '
  into aBrief from ReplaceValues  where  ReplaceValuesID = aReplaceValuesID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function DenyEdit_BRIEF_F  (
 aDenyEditid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aDenyEditid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from DenyEdit where DenyEditID=aDenyEditID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from DenyEdit  where  DenyEditID = aDenyEditID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function DenyVisible_BRIEF_F  (
 aDenyVisibleid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aDenyVisibleid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from DenyVisible where DenyVisibleID=aDenyVisibleID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from DenyVisible  where  DenyVisibleID = aDenyVisibleID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function AllowEditFieldValues_BRIEF_F  (
 aAllowEditFieldValuesid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aAllowEditFieldValuesid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from AllowEditFieldValues where AllowEditFieldValuesID=aAllowEditFieldValuesID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from AllowEditFieldValues  where  AllowEditFieldValuesID = aAllowEditFieldValuesID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ComboFields_BRIEF_F  (
 aComboFieldsid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aComboFieldsid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ComboFields where ComboFieldsID=aComboFieldsID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from ComboFields  where  ComboFieldsID = aComboFieldsID; 
 select aBRIEF 
  ||  nvl(to_char(SourceName),' ') ||'; '
  into aBrief from ComboFields  where  ComboFieldsID = aComboFieldsID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_USERS_BRIEF_F  (
 aWEBS_USERSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_USERSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_USERS where WEBS_USERSID=aWEBS_USERSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(LoginName),' ') ||'; '
  into aBrief from WEBS_USERS  where  WEBS_USERSID = aWEBS_USERSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_ANKETA_BRIEF_F  (
 aWEBS_ANKETAid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_ANKETAid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_ANKETA where WEBS_ANKETAID=aWEBS_ANKETAID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBS_ANKETA  where  WEBS_ANKETAID = aWEBS_ANKETAID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_QUESTIONS_BRIEF_F  (
 aWEBS_QUESTIONSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_QUESTIONSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_QUESTIONS where WEBS_QUESTIONSID=aWEBS_QUESTIONSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(the_Number),' ') ||'; '
  into aBrief from WEBS_QUESTIONS  where  WEBS_QUESTIONSID = aWEBS_QUESTIONSID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBS_QUESTIONS  where  WEBS_QUESTIONSID = aWEBS_QUESTIONSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_ANSWERS_BRIEF_F  (
 aWEBS_ANSWERSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_ANSWERSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_ANSWERS where WEBS_ANSWERSID=aWEBS_ANSWERSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(the_Number),' ') ||'; '
  into aBrief from WEBS_ANSWERS  where  WEBS_ANSWERSID = aWEBS_ANSWERSID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBS_ANSWERS  where  WEBS_ANSWERSID = aWEBS_ANSWERSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_DDOC_BRIEF_F  (
 aWEBS_DDOCid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_DDOCid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_DDOC where WEBS_DDOCID=aWEBS_DDOCID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBS_DDOC  where  WEBS_DDOCID = aWEBS_DDOCID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_NEWS_BRIEF_F  (
 aWEBS_NEWSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_NEWSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_NEWS where WEBS_NEWSID=aWEBS_NEWSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(QueueNumber),' ') ||'; '
  into aBrief from WEBS_NEWS  where  WEBS_NEWSID = aWEBS_NEWSID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from WEBS_NEWS  where  WEBS_NEWSID = aWEBS_NEWSID; 
 select aBRIEF 
  ||  nvl(to_char(NewsDate),' ') ||'; '
  into aBrief from WEBS_NEWS  where  WEBS_NEWSID = aWEBS_NEWSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function NEWS_PICS_BRIEF_F  (
 aNEWS_PICSid CHAR
) return varchar2 as 
 aBRIEF varchar2(255);
 atmpStr varchar2(255);
 atmpBrief varchar2(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aNEWS_PICSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from NEWS_PICS where NEWS_PICSID=aNEWS_PICSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from NEWS_PICS  where  NEWS_PICSID = aNEWS_PICSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;


 end Func;

/



