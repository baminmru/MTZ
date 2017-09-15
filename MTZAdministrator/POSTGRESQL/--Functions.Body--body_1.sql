
/* --body*/

 

 create or replace package body Func as

  function instance_BRIEF_F  (
 ainstanceid CHAR
)return varchar as  
 aBRIEF varchar(4000);
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


function FilterFieldGroup_BRIEF_F  (
 aFilterFieldGroupid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function PEK103_DEF_BRIEF_F  (
 aPEK103_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEK103_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEK103_DEF where PEK103_DEFID=aPEK103_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheNumber),' ') ||'; '
  into aBrief from PEK103_DEF  where  PEK103_DEFID = aPEK103_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(Sender),' ') ||'; '
  into aBrief from PEK103_DEF  where  PEK103_DEFID = aPEK103_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(RcvDate),' ') ||'; '
  into aBrief from PEK103_DEF  where  PEK103_DEFID = aPEK103_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEK103_LINES_BRIEF_F  (
 aPEK103_LINESid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEK103_LINESid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEK103_LINES where PEK103_LINESID=aPEK103_LINESID;
if aTmpCnt >0 then
  aBRIEF:='';
select IndexTo
 into atmpID  from PEK103_LINES  where  PEK103_LINESID = aPEK103_LINESID ;
 atmpBrief := func.PEKD_DIRSTATION_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(Reciever),' ') ||'; '
  into aBrief from PEK103_LINES  where  PEK103_LINESID = aPEK103_LINESID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBC_BLOCK_BRIEF_F  (
 aWEBC_BLOCKid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBC_BLOCKid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBC_BLOCK where WEBC_BLOCKID=aWEBC_BLOCKID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from WEBC_BLOCK  where  WEBC_BLOCKID = aWEBC_BLOCKID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBC_NEWS_BRIEF_F  (
 aWEBC_NEWSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBC_NEWSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBC_NEWS where WEBC_NEWSID=aWEBC_NEWSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from WEBC_NEWS  where  WEBC_NEWSID = aWEBC_NEWSID; 
 select aBRIEF 
  ||  nvl(to_char(ShortName),' ') ||'; '
  into aBrief from WEBC_NEWS  where  WEBC_NEWSID = aWEBC_NEWSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBC_JOB_BRIEF_F  (
 aWEBC_JOBid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBC_JOBid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBC_JOB where WEBC_JOBID=aWEBC_JOBID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(JobName),' ') ||'; '
  into aBrief from WEBC_JOB  where  WEBC_JOBID = aWEBC_JOBID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBC_MESSAGES_BRIEF_F  (
 aWEBC_MESSAGESid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBC_MESSAGESid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBC_MESSAGES where WEBC_MESSAGESID=aWEBC_MESSAGESID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(MESSAGES_FIO),' ') ||'; '
  into aBrief from WEBC_MESSAGES  where  WEBC_MESSAGESID = aWEBC_MESSAGESID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBC_DOCS_BRIEF_F  (
 aWEBC_DOCSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBC_DOCSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBC_DOCS where WEBC_DOCSID=aWEBC_DOCSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DocsName),' ') ||'; '
  into aBrief from WEBC_DOCS  where  WEBC_DOCSID = aWEBC_DOCSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBC_FILIALS_BRIEF_F  (
 aWEBC_FILIALSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBC_FILIALSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBC_FILIALS where WEBC_FILIALSID=aWEBC_FILIALSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(OfficeName),' ') ||'; '
  into aBrief from WEBC_FILIALS  where  WEBC_FILIALSID = aWEBC_FILIALSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBC_LINKS_BRIEF_F  (
 aWEBC_LINKSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBC_LINKSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBC_LINKS where WEBC_LINKSID=aWEBC_LINKSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(LinkName),' ') ||'; '
  into aBrief from WEBC_LINKS  where  WEBC_LINKSID = aWEBC_LINKSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRRPT_COSTS_BRIEF_F  (
 aVRRPT_COSTSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRRPT_COSTSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRRPT_COSTS where VRRPT_COSTSID=aVRRPT_COSTSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Descrtiption),' ') ||'; '
  into aBrief from VRRPT_COSTS  where  VRRPT_COSTSID = aVRRPT_COSTSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRRPT_MeetingPlan_BRIEF_F  (
 aVRRPT_MeetingPlanid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRRPT_MeetingPlanid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRRPT_MeetingPlan where VRRPT_MeetingPlanID=aVRRPT_MeetingPlanID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DateOF),' ') ||'; '
  into aBrief from VRRPT_MeetingPlan  where  VRRPT_MeetingPlanID = aVRRPT_MeetingPlanID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRRPT_Meeters_BRIEF_F  (
 aVRRPT_Meetersid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRRPT_Meetersid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRRPT_Meeters where VRRPT_MeetersID=aVRRPT_MeetersID;
if aTmpCnt >0 then
  aBRIEF:='';
select Worker
 into atmpID  from VRRPT_Meeters  where  VRRPT_MeetersID = aVRRPT_MeetersID ;
 atmpBrief := func.Users_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
select Contact
 into atmpID  from VRRPT_Meeters  where  VRRPT_MeetersID = aVRRPT_MeetersID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
  select  aBRIEF ||
  Decode( Mandatory
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from VRRPT_Meeters where VRRPT_MeetersID=aVRRPT_MeetersID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRRPT_MAIN_BRIEF_F  (
 aVRRPT_MAINid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRRPT_MAINid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRRPT_MAIN where VRRPT_MAINID=aVRRPT_MAINID;
if aTmpCnt >0 then
  aBRIEF:='';
select Author
 into atmpID  from VRRPT_MAIN  where  VRRPT_MAINID = aVRRPT_MAINID ;
 atmpBrief := func.Users_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from VRRPT_MAIN  where  VRRPT_MAINID = aVRRPT_MAINID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRRPT_MAIN  where  VRRPT_MAINID = aVRRPT_MAINID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDGCommon_BRIEF_F  (
 aVRDGCommonid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDGCommonid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDGCommon where VRDGCommonID=aVRDGCommonID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DogNum),' ') ||'; '
  into aBrief from VRDGCommon  where  VRDGCommonID = aVRDGCommonID; 
 select aBRIEF 
  ||  nvl(to_char(DogDate),' ') ||'; '
  into aBrief from VRDGCommon  where  VRDGCommonID = aVRDGCommonID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRDGCommon  where  VRDGCommonID = aVRDGCommonID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDGReport_BRIEF_F  (
 aVRDGReportid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDGReportid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDGReport where VRDGReportID=aVRDGReportID;
if aTmpCnt >0 then
  aBRIEF:='';
select Report
 into atmpID  from VRDGReport  where  VRDGReportID = aVRDGReportID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDGContractChanges_BRIEF_F  (
 aVRDGContractChangesid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDGContractChangesid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDGContractChanges where VRDGContractChangesID=aVRDGContractChangesID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Code),' ') ||'; '
  into aBrief from VRDGContractChanges  where  VRDGContractChangesID = aVRDGContractChangesID; 
 select aBRIEF 
  ||  nvl(to_char(DateOf),' ') ||'; '
  into aBrief from VRDGContractChanges  where  VRDGContractChangesID = aVRDGContractChangesID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDGContractVersion_BRIEF_F  (
 aVRDGContractVersionid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDGContractVersionid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDGContractVersion where VRDGContractVersionID=aVRDGContractVersionID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DateOf),' ') ||'; '
  into aBrief from VRDGContractVersion  where  VRDGContractVersionID = aVRDGContractVersionID; 
  select  aBRIEF ||
  Decode( Actual
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from VRDGContractVersion where VRDGContractVersionID=aVRDGContractVersionID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDGContractSpesial_BRIEF_F  (
 aVRDGContractSpesialid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDGContractSpesialid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDGContractSpesial where VRDGContractSpesialID=aVRDGContractSpesialID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DateOf),' ') ||'; '
  into aBrief from VRDGContractSpesial  where  VRDGContractSpesialID = aVRDGContractSpesialID; 
  select  aBRIEF ||
  Decode( IsDone
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from VRDGContractSpesial where VRDGContractSpesialID=aVRDGContractSpesialID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKSH_DATA_BRIEF_F  (
 aPEKSH_DATAid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKSH_DATAid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKSH_DATA where PEKSH_DATAID=aPEKSH_DATAID;
if aTmpCnt >0 then
  aBRIEF:='';
select Train
 into atmpID  from PEKSH_DATA  where  PEKSH_DATAID = aPEKSH_DATAID ;
 atmpBrief := func.PEKD_TRAINS_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKSH_START_BRIEF_F  (
 aPEKSH_STARTid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKSH_STARTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKSH_START where PEKSH_STARTID=aPEKSH_STARTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DayInYear),' ') ||'; '
  into aBrief from PEKSH_START  where  PEKSH_STARTID = aPEKSH_STARTID; 
 select aBRIEF 
  ||  nvl(to_char(StartTime),' ') ||'; '
  into aBrief from PEKSH_START  where  PEKSH_STARTID = aPEKSH_STARTID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKSH_DEF_BRIEF_F  (
 aPEKSH_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKSH_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKSH_DEF where PEKSH_DEFID=aPEKSH_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select DIRECTION
 into atmpID  from PEKSH_DEF  where  PEKSH_DEFID = aPEKSH_DEFID ;
 atmpBrief := func.PEKD_DIRECTION_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(TheYear),' ') ||'; '
  into aBrief from PEKSH_DEF  where  PEKSH_DEFID = aPEKSH_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZ2JOB_DEF_BRIEF_F  (
 aMTZ2JOB_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function PEKPAY_DEF_BRIEF_F  (
 aPEKPAY_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKPAY_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKPAY_DEF where PEKPAY_DEFID=aPEKPAY_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select ToClient
 into atmpID  from PEKPAY_DEF  where  PEKPAY_DEFID = aPEKPAY_DEFID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(PLPNUM),' ') ||'; '
  into aBrief from PEKPAY_DEF  where  PEKPAY_DEFID = aPEKPAY_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(PLPDate),' ') ||'; '
  into aBrief from PEKPAY_DEF  where  PEKPAY_DEFID = aPEKPAY_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBSDIC_DEF_BRIEF_F  (
 aWEBSDIC_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function PWUUSERS_BRIEF_F  (
 aPWUUSERSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPWUUSERSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PWUUSERS where PWUUSERSID=aPWUUSERSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(PWUUSERSOrderNum),' ') ||'; '
  into aBrief from PWUUSERS  where  PWUUSERSID = aPWUUSERSID; 
 select aBRIEF 
  ||  nvl(to_char(PWUUSERSLogin),' ') ||'; '
  into aBrief from PWUUSERS  where  PWUUSERSID = aPWUUSERSID; 
 select aBRIEF 
  ||  nvl(to_char(PWUUSERSEMail),' ') ||'; '
  into aBrief from PWUUSERS  where  PWUUSERSID = aPWUUSERSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function pekz_path_BRIEF_F  (
 apekz_pathid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if apekz_pathid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from pekz_path where pekz_pathID=apekz_pathID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheDirection
 into atmpID  from pekz_path  where  pekz_pathID = apekz_pathID ;
 atmpBrief := func.PEKD_DIRECTION_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(vagNo),' ') ||'; '
  into aBrief from pekz_path  where  pekz_pathID = apekz_pathID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKZ_WLIST_BRIEF_F  (
 aPEKZ_WLISTid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKZ_WLISTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKZ_WLIST where PEKZ_WLISTID=aPEKZ_WLISTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(sequence),' ') ||'; '
  into aBrief from PEKZ_WLIST  where  PEKZ_WLISTID = aPEKZ_WLISTID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKZ_WLADDS_BRIEF_F  (
 aPEKZ_WLADDSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKZ_WLADDSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKZ_WLADDS where PEKZ_WLADDSID=aPEKZ_WLADDSID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheAdds
 into atmpID  from PEKZ_WLADDS  where  PEKZ_WLADDSID = aPEKZ_WLADDSID ;
 atmpBrief := func.PEKD_ADDS_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKZ_DOCS_BRIEF_F  (
 aPEKZ_DOCSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKZ_DOCSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKZ_DOCS where PEKZ_DOCSID=aPEKZ_DOCSID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheDoc
 into atmpID  from PEKZ_DOCS  where  PEKZ_DOCSID = aPEKZ_DOCSID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function pekz_def_BRIEF_F  (
 apekz_defid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if apekz_defid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from pekz_def where pekz_defID=apekz_defID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(PEKCode),' ') ||'; '
  into aBrief from pekz_def  where  pekz_defID = apekz_defID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKZ_ACLCT_BRIEF_F  (
 aPEKZ_ACLCTid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKZ_ACLCTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKZ_ACLCT where PEKZ_ACLCTID=aPEKZ_ACLCTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(CollectDate),' ') ||'; '
  into aBrief from PEKZ_ACLCT  where  PEKZ_ACLCTID = aPEKZ_ACLCTID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKZ_ADLVR_BRIEF_F  (
 aPEKZ_ADLVRid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKZ_ADLVRid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKZ_ADLVR where PEKZ_ADLVRID=aPEKZ_ADLVRID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(CollectDate),' ') ||'; '
  into aBrief from PEKZ_ADLVR  where  PEKZ_ADLVRID = aPEKZ_ADLVRID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function pekz_dop_BRIEF_F  (
 apekz_dopid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if apekz_dopid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from pekz_dop where pekz_dopID=apekz_dopID;
if aTmpCnt >0 then
  aBRIEF:='';
select SRV
 into atmpID  from pekz_dop  where  pekz_dopID = apekz_dopID ;
 atmpBrief := func.PEKD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function REPD_LOCKED_BRIEF_F  (
 aREPD_LOCKEDid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function StateAction_BRIEF_F  (
 aStateActionid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function TheDiffPath_BRIEF_F  (
 aTheDiffPathid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aTheDiffPathid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from TheDiffPath where TheDiffPathID=aTheDiffPathID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheNumber),' ') ||'; '
  into aBrief from TheDiffPath  where  TheDiffPathID = aTheDiffPathID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function DopUslTo_BRIEF_F  (
 aDopUslToid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aDopUslToid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from DopUslTo where DopUslToID=aDopUslToID;
if aTmpCnt >0 then
  aBRIEF:='';
select DopUsluga
 into atmpID  from DopUslTo  where  DopUslToID = aDopUslToID ;
 atmpBrief := func.PEKD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function DopUslFrom_BRIEF_F  (
 aDopUslFromid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aDopUslFromid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from DopUslFrom where DopUslFromID=aDopUslFromID;
if aTmpCnt >0 then
  aBRIEF:='';
select DopUsluga
 into atmpID  from DopUslFrom  where  DopUslFromID = aDopUslFromID ;
 atmpBrief := func.PEKD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function TheDefenitionDiffP_BRIEF_F  (
 aTheDefenitionDiffPid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aTheDefenitionDiffPid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from TheDefenitionDiffP where TheDefenitionDiffPID=aTheDefenitionDiffPID;
if aTmpCnt >0 then
  aBRIEF:='';
select TownFrom
 into atmpID  from TheDefenitionDiffP  where  TheDefenitionDiffPID = aTheDefenitionDiffPID ;
 atmpBrief := func.ENTDIC_TOWN_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
select DirStation
 into atmpID  from TheDefenitionDiffP  where  TheDefenitionDiffPID = aTheDefenitionDiffPID ;
 atmpBrief := func.PEKD_DIRSTATION_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKACT_DEF_BRIEF_F  (
 aPEKACT_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKACT_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKACT_DEF where PEKACT_DEFID=aPEKACT_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select Client
 into atmpID  from PEKACT_DEF  where  PEKACT_DEFID = aPEKACT_DEFID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(Number_of_akt),' ') ||'; '
  into aBrief from PEKACT_DEF  where  PEKACT_DEFID = aPEKACT_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKACT_ITOG_BRIEF_F  (
 aPEKACT_ITOGid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKACT_ITOGid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKACT_ITOG where PEKACT_ITOGID=aPEKACT_ITOGID;
if aTmpCnt >0 then
  aBRIEF:='';
select SRV
 into atmpID  from PEKACT_ITOG  where  PEKACT_ITOGID = aPEKACT_ITOGID ;
 atmpBrief := func.PEKD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKACT_LINES_BRIEF_F  (
 aPEKACT_LINESid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKACT_LINESid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKACT_LINES where PEKACT_LINESID=aPEKACT_LINESID;
if aTmpCnt >0 then
  aBRIEF:='';
select Zayavka
 into atmpID  from PEKACT_LINES  where  PEKACT_LINESID = aPEKACT_LINESID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELDTYPE_BRIEF_F  (
 aFIELDTYPEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
 ,0
 ,'Скалярный тип'
 ,4
 ,'Ссылка'
 ,2
 ,'Перечисление'
 ,1
 ,'Выражение'
 ,5
 ,'Элемент оформления'
,'.') into aBrief from FIELDTYPE where FIELDTYPEID=aFIELDTYPEID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FIELDTYPEMAP_BRIEF_F  (
 aFIELDTYPEMAPid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function PEKPQ_DEF_BRIEF_F  (
 aPEKPQ_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKPQ_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKPQ_DEF where PEKPQ_DEFID=aPEKPQ_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(sequence),' ') ||'; '
  into aBrief from PEKPQ_DEF  where  PEKPQ_DEFID = aPEKPQ_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from PEKPQ_DEF  where  PEKPQ_DEFID = aPEKPQ_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENTDIC_BANK_BRIEF_F  (
 aENTDIC_BANKid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENTDIC_BANKid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENTDIC_BANK where ENTDIC_BANKID=aENTDIC_BANKID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from ENTDIC_BANK  where  ENTDIC_BANKID = aENTDIC_BANKID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENTDIC_DOST_BRIEF_F  (
 aENTDIC_DOSTid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENTDIC_DOSTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENTDIC_DOST where ENTDIC_DOSTID=aENTDIC_DOSTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Code),' ') ||'; '
  into aBrief from ENTDIC_DOST  where  ENTDIC_DOSTID = aENTDIC_DOSTID; 
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from ENTDIC_DOST  where  ENTDIC_DOSTID = aENTDIC_DOSTID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENTDIC_TOWN_BRIEF_F  (
 aENTDIC_TOWNid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENTDIC_TOWNid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENTDIC_TOWN where ENTDIC_TOWNID=aENTDIC_TOWNID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from ENTDIC_TOWN  where  ENTDIC_TOWNID = aENTDIC_TOWNID; 
select country
 into atmpID  from ENTDIC_TOWN  where  ENTDIC_TOWNID = aENTDIC_TOWNID ;
 atmpBrief := func.ENTDIC_COUNTRY_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENTDIC_TransportType_BRIEF_F  (
 aENTDIC_TransportTypeid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENTDIC_TransportTypeid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENTDIC_TransportType where ENTDIC_TransportTypeID=aENTDIC_TransportTypeID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheName),' ') ||'; '
  into aBrief from ENTDIC_TransportType  where  ENTDIC_TransportTypeID = aENTDIC_TransportTypeID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENTDIC_OPF_BRIEF_F  (
 aENTDIC_OPFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENTDIC_OPFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENTDIC_OPF where ENTDIC_OPFID=aENTDIC_OPFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from ENTDIC_OPF  where  ENTDIC_OPFID = aENTDIC_OPFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENTDIC_EDIZM_BRIEF_F  (
 aENTDIC_EDIZMid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENTDIC_EDIZMid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENTDIC_EDIZM where ENTDIC_EDIZMID=aENTDIC_EDIZMID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(code),' ') ||'; '
  into aBrief from ENTDIC_EDIZM  where  ENTDIC_EDIZMID = aENTDIC_EDIZMID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENTDIC_CURRENCY_BRIEF_F  (
 aENTDIC_CURRENCYid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENTDIC_CURRENCYid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENTDIC_CURRENCY where ENTDIC_CURRENCYID=aENTDIC_CURRENCYID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from ENTDIC_CURRENCY  where  ENTDIC_CURRENCYID = aENTDIC_CURRENCYID; 
 select aBRIEF 
  ||  nvl(to_char(Code),' ') ||'; '
  into aBrief from ENTDIC_CURRENCY  where  ENTDIC_CURRENCYID = aENTDIC_CURRENCYID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENTDIC_CURCOURCE_BRIEF_F  (
 aENTDIC_CURCOURCEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENTDIC_CURCOURCEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENTDIC_CURCOURCE where ENTDIC_CURCOURCEID=aENTDIC_CURCOURCEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(CourceDate),' ') ||'; '
  into aBrief from ENTDIC_CURCOURCE  where  ENTDIC_CURCOURCEID = aENTDIC_CURCOURCEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENTDIC_COUNTRY_BRIEF_F  (
 aENTDIC_COUNTRYid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENTDIC_COUNTRYid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENTDIC_COUNTRY where ENTDIC_COUNTRYID=aENTDIC_COUNTRYID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Code),' ') ||'; '
  into aBrief from ENTDIC_COUNTRY  where  ENTDIC_COUNTRYID = aENTDIC_COUNTRYID; 
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from ENTDIC_COUNTRY  where  ENTDIC_COUNTRYID = aENTDIC_COUNTRYID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ENTDIC_REGION_BRIEF_F  (
 aENTDIC_REGIONid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aENTDIC_REGIONid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from ENTDIC_REGION where ENTDIC_REGIONID=aENTDIC_REGIONID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Code),' ') ||'; '
  into aBrief from ENTDIC_REGION  where  ENTDIC_REGIONID = aENTDIC_REGIONID; 
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from ENTDIC_REGION  where  ENTDIC_REGIONID = aENTDIC_REGIONID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ST_MAIN_BRIEF_F  (
 aST_MAINid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function STDJournlaExtInfo_BRIEF_F  (
 aSTDJournlaExtInfoid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function CAL_DAYS_BRIEF_F  (
 aCAL_DAYSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aCAL_DAYSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from CAL_DAYS where CAL_DAYSID=aCAL_DAYSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from CAL_DAYS  where  CAL_DAYSID = aCAL_DAYSID; 
  select  aBRIEF ||
  Decode( IsHoliday
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from CAL_DAYS where CAL_DAYSID=aCAL_DAYSID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function CAL_TIME_BRIEF_F  (
 aCAL_TIMEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aCAL_TIMEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from CAL_TIME where CAL_TIMEID=aCAL_TIMEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(FromTime),' ') ||'; '
  into aBrief from CAL_TIME  where  CAL_TIMEID = aCAL_TIMEID; 
 select aBRIEF 
  ||  nvl(to_char(ToTime),' ') ||'; '
  into aBrief from CAL_TIME  where  CAL_TIMEID = aCAL_TIMEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function CAL_HEAD_BRIEF_F  (
 aCAL_HEADid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aCAL_HEADid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from CAL_HEAD where CAL_HEADID=aCAL_HEADID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from CAL_HEAD  where  CAL_HEADID = aCAL_HEADID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function SrvMessageInfo_BRIEF_F  (
 aSrvMessageInfoid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function PEKNAL_DEF_BRIEF_F  (
 aPEKNAL_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKNAL_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKNAL_DEF where PEKNAL_DEFID=aPEKNAL_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheNumber),' ') ||'; '
  into aBrief from PEKNAL_DEF  where  PEKNAL_DEFID = aPEKNAL_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from PEKNAL_DEF  where  PEKNAL_DEFID = aPEKNAL_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKNAL_PZ_BRIEF_F  (
 aPEKNAL_PZid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKNAL_PZid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKNAL_PZ where PEKNAL_PZID=aPEKNAL_PZID;
if aTmpCnt >0 then
  aBRIEF:='';
select PZ
 into atmpID  from PEKNAL_PZ  where  PEKNAL_PZID = aPEKNAL_PZID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKNAL_ROWS_BRIEF_F  (
 aPEKNAL_ROWSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKNAL_ROWSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKNAL_ROWS where PEKNAL_ROWSID=aPEKNAL_ROWSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheNumber),' ') ||'; '
  into aBrief from PEKNAL_ROWS  where  PEKNAL_ROWSID = aPEKNAL_ROWSID; 
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from PEKNAL_ROWS  where  PEKNAL_ROWSID = aPEKNAL_ROWSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FileDef_BRIEF_F  (
 aFileDefid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFileDefid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FileDef where FileDefID=aFileDefID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from FileDef  where  FileDefID = aFileDefID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function FileVersion_BRIEF_F  (
 aFileVersionid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aFileVersionid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from FileVersion where FileVersionID=aFileVersionID;
if aTmpCnt >0 then
  aBRIEF:='';
  select  aBRIEF ||
  Decode( CurrentVersion
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from FileVersion where FileVersionID=aFileVersionID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Num_zones_BRIEF_F  (
 aNum_zonesid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function BaseSetting_BRIEF_F  (
 aBaseSettingid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aBaseSettingid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from BaseSetting where BaseSettingID=aBaseSettingID;
if aTmpCnt >0 then
  aBRIEF:='';
select FIL
 into atmpID  from BaseSetting  where  BaseSettingID = aBaseSettingID ;
 atmpBrief := func.PEKD_DEPT_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(NDS),' ') ||'; '
  into aBrief from BaseSetting  where  BaseSettingID = aBaseSettingID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function Reports_BRIEF_F  (
 aReportsid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function PEKRKO_DEF_BRIEF_F  (
 aPEKRKO_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKRKO_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKRKO_DEF where PEKRKO_DEFID=aPEKRKO_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheNumber),' ') ||'; '
  into aBrief from PEKRKO_DEF  where  PEKRKO_DEFID = aPEKRKO_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from PEKRKO_DEF  where  PEKRKO_DEFID = aPEKRKO_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKRKO_ROWS_BRIEF_F  (
 aPEKRKO_ROWSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKRKO_ROWSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKRKO_ROWS where PEKRKO_ROWSID=aPEKRKO_ROWSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheNumber),' ') ||'; '
  into aBrief from PEKRKO_ROWS  where  PEKRKO_ROWSID = aPEKRKO_ROWSID; 
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from PEKRKO_ROWS  where  PEKRKO_ROWSID = aPEKRKO_ROWSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKTRF_REGALL_BRIEF_F  (
 aPEKTRF_REGALLid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKTRF_REGALLid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKTRF_REGALL where PEKTRF_REGALLID=aPEKTRF_REGALLID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(WeightFrom),' ') ||'; '
  into aBrief from PEKTRF_REGALL  where  PEKTRF_REGALLID = aPEKTRF_REGALLID; 
 select aBRIEF 
  ||  nvl(to_char(WeightTo),' ') ||'; '
  into aBrief from PEKTRF_REGALL  where  PEKTRF_REGALLID = aPEKTRF_REGALLID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKTRF_DECR_BRIEF_F  (
 aPEKTRF_DECRid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKTRF_DECRid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKTRF_DECR where PEKTRF_DECRID=aPEKTRF_DECRID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from PEKTRF_DECR  where  PEKTRF_DECRID = aPEKTRF_DECRID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKTRF_ADDS_BRIEF_F  (
 aPEKTRF_ADDSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKTRF_ADDSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKTRF_ADDS where PEKTRF_ADDSID=aPEKTRF_ADDSID;
if aTmpCnt >0 then
  aBRIEF:='';
select Name
 into atmpID  from PEKTRF_ADDS  where  PEKTRF_ADDSID = aPEKTRF_ADDSID ;
 atmpBrief := func.PEKD_ADDS_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKTRF_DEF_BRIEF_F  (
 aPEKTRF_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKTRF_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKTRF_DEF where PEKTRF_DEFID=aPEKTRF_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(StartDate),' ') ||'; '
  into aBrief from PEKTRF_DEF  where  PEKTRF_DEFID = aPEKTRF_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKTRF_AUTO_BRIEF_F  (
 aPEKTRF_AUTOid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKTRF_AUTOid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKTRF_AUTO where PEKTRF_AUTOID=aPEKTRF_AUTOID;
if aTmpCnt >0 then
  aBRIEF:='';
select AutoType
 into atmpID  from PEKTRF_AUTO  where  PEKTRF_AUTOID = aPEKTRF_AUTOID ;
 atmpBrief := func.PEKD_AUTO_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKTRF_SRV_BRIEF_F  (
 aPEKTRF_SRVid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKTRF_SRVid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKTRF_SRV where PEKTRF_SRVID=aPEKTRF_SRVID;
if aTmpCnt >0 then
  aBRIEF:='';
select SrvTYPE
 into atmpID  from PEKTRF_SRV  where  PEKTRF_SRVID = aPEKTRF_SRVID ;
 atmpBrief := func.PEKD_SRV_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKTRF_TR_BRIEF_F  (
 aPEKTRF_TRid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKTRF_TRid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKTRF_TR where PEKTRF_TRID=aPEKTRF_TRID;
if aTmpCnt >0 then
  aBRIEF:='';
select Train
 into atmpID  from PEKTRF_TR  where  PEKTRF_TRID = aPEKTRF_TRID ;
 atmpBrief := func.PEKD_DIRECTION_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
select ToST
 into atmpID  from PEKTRF_TR  where  PEKTRF_TRID = aPEKTRF_TRID ;
 atmpBrief := func.PEKD_DIRSTATION_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKTRF_REGRTR_BRIEF_F  (
 aPEKTRF_REGRTRid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKTRF_REGRTRid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKTRF_REGRTR where PEKTRF_REGRTRID=aPEKTRF_REGRTRID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(WeightFrom),' ') ||'; '
  into aBrief from PEKTRF_REGRTR  where  PEKTRF_REGRTRID = aPEKTRF_REGRTRID; 
 select aBRIEF 
  ||  nvl(to_char(WeightTo),' ') ||'; '
  into aBrief from PEKTRF_REGRTR  where  PEKTRF_REGRTRID = aPEKTRF_REGRTRID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKCL_DEF_BRIEF_F  (
 aPEKCL_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKCL_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKCL_DEF where PEKCL_DEFID=aPEKCL_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheDep
 into atmpID  from PEKCL_DEF  where  PEKCL_DEFID = aPEKCL_DEFID ;
 atmpBrief := func.PEKD_DEPT_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(LimDate),' ') ||'; '
  into aBrief from PEKCL_DEF  where  PEKCL_DEFID = aPEKCL_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKCL_DAYLY_BRIEF_F  (
 aPEKCL_DAYLYid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKCL_DAYLYid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKCL_DAYLY where PEKCL_DAYLYID=aPEKCL_DAYLYID;
if aTmpCnt >0 then
  aBRIEF:='';
select Train
 into atmpID  from PEKCL_DAYLY  where  PEKCL_DAYLYID = aPEKCL_DAYLYID ;
 atmpBrief := func.PEKD_TRAINS_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKL_TOLOAD_BRIEF_F  (
 aPEKL_TOLOADid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKL_TOLOADid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKL_TOLOAD where PEKL_TOLOADID=aPEKL_TOLOADID;
if aTmpCnt >0 then
  aBRIEF:='';
select SRCPekZ
 into atmpID  from PEKL_TOLOAD  where  PEKL_TOLOADID = aPEKL_TOLOADID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZExt_def_BRIEF_F  (
 aMTZExt_defid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function InfoStoreDef_BRIEF_F  (
 aInfoStoreDefid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function PEKP_DEF_BRIEF_F  (
 aPEKP_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKP_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKP_DEF where PEKP_DEFID=aPEKP_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select FromClient
 into atmpID  from PEKP_DEF  where  PEKP_DEFID = aPEKP_DEFID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(PLPNUM),' ') ||'; '
  into aBrief from PEKP_DEF  where  PEKP_DEFID = aPEKP_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(PLPDate),' ') ||'; '
  into aBrief from PEKP_DEF  where  PEKP_DEFID = aPEKP_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKP_PZ_BRIEF_F  (
 aPEKP_PZid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKP_PZid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKP_PZ where PEKP_PZID=aPEKP_PZID;
if aTmpCnt >0 then
  aBRIEF:='';
select PZ
 into atmpID  from PEKP_PZ  where  PEKP_PZID = aPEKP_PZID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function SysLog_BRIEF_F  (
 aSysLogid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function VRDContractStage_BRIEF_F  (
 aVRDContractStageid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDContractStageid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDContractStage where VRDContractStageID=aVRDContractStageID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRDContractStage  where  VRDContractStageID = aVRDContractStageID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDRreportType_BRIEF_F  (
 aVRDRreportTypeid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDRreportTypeid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDRreportType where VRDRreportTypeID=aVRDRreportTypeID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRDRreportType  where  VRDRreportTypeID = aVRDRreportTypeID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDPrjType_BRIEF_F  (
 aVRDPrjTypeid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDPrjTypeid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDPrjType where VRDPrjTypeID=aVRDPrjTypeID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRDPrjType  where  VRDPrjTypeID = aVRDPrjTypeID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDStream_BRIEF_F  (
 aVRDStreamid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDStreamid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDStream where VRDStreamID=aVRDStreamID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRDStream  where  VRDStreamID = aVRDStreamID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDInterest_BRIEF_F  (
 aVRDInterestid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDInterestid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDInterest where VRDInterestID=aVRDInterestID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRDInterest  where  VRDInterestID = aVRDInterestID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDDocType_BRIEF_F  (
 aVRDDocTypeid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDDocTypeid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDDocType where VRDDocTypeID=aVRDDocTypeID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRDDocType  where  VRDDocTypeID = aVRDDocTypeID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDLoyalty_BRIEF_F  (
 aVRDLoyaltyid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDLoyaltyid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDLoyalty where VRDLoyaltyID=aVRDLoyaltyID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(the_Level),' ') ||'; '
  into aBrief from VRDLoyalty  where  VRDLoyaltyID = aVRDLoyaltyID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRDMarket_BRIEF_F  (
 aVRDMarketid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRDMarketid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRDMarket where VRDMarketID=aVRDMarketID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRDMarket  where  VRDMarketID = aVRDMarketID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function MTZSEC_RIGHT_BRIEF_F  (
 aMTZSEC_RIGHTid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function VRCAccounts_BRIEF_F  (
 aVRCAccountsid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCAccountsid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCAccounts where VRCAccountsID=aVRCAccountsID;
if aTmpCnt >0 then
  aBRIEF:='';
select BANK
 into atmpID  from VRCAccounts  where  VRCAccountsID = aVRCAccountsID ;
 atmpBrief := func.ENTDIC_BANK_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(acc),' ') ||'; '
  into aBrief from VRCAccounts  where  VRCAccountsID = aVRCAccountsID; 
  select  aBRIEF ||
  Decode( DefaultAccount
 ,-1
 ,'Да'
 ,0
 ,'Нет'
,'.') into aBrief from VRCAccounts where VRCAccountsID=aVRCAccountsID;
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCTorg_BRIEF_F  (
 aVRCTorgid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCTorgid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCTorg where VRCTorgID=aVRCTorgID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Address),' ') ||'; '
  into aBrief from VRCTorg  where  VRCTorgID = aVRCTorgID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCAditional_BRIEF_F  (
 aVRCAditionalid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCAditionalid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCAditional where VRCAditionalID=aVRCAditionalID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(regdate),' ') ||'; '
  into aBrief from VRCAditional  where  VRCAditionalID = aVRCAditionalID; 
select regby
 into atmpID  from VRCAditional  where  VRCAditionalID = aVRCAditionalID ;
 atmpBrief := func.Users_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCTarif_BRIEF_F  (
 aVRCTarifid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCTarifid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCTarif where VRCTarifID=aVRCTarifID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheDept
 into atmpID  from VRCTarif  where  VRCTarifID = aVRCTarifID ;
 atmpBrief := func.PEKD_DEPT_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCCommonInfo_BRIEF_F  (
 aVRCCommonInfoid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCCommonInfoid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCCommonInfo where VRCCommonInfoID=aVRCCommonInfoID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRCCommonInfo  where  VRCCommonInfoID = aVRCCommonInfoID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function ROLES_USER_BRIEF_F  (
 aROLES_USERid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function RptSrvMsg_BRIEF_F  (
 aRptSrvMsgid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aRptSrvMsgid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from RptSrvMsg where RptSrvMsgID=aRptSrvMsgID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Msgdate),' ') ||'; '
  into aBrief from RptSrvMsg  where  RptSrvMsgID = aRptSrvMsgID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function RptQuery_BRIEF_F  (
 aRptQueryid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aRptQueryid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from RptQuery where RptQueryID=aRptQueryID;
if aTmpCnt >0 then
  aBRIEF:='';
select ReportType
 into atmpID  from RptQuery  where  RptQueryID = aRptQueryID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function RptQryParam_BRIEF_F  (
 aRptQryParamid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aRptQryParamid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from RptQryParam where RptQryParamID=aRptQryParamID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from RptQryParam  where  RptQryParamID = aRptQryParamID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKORD_DEF_BRIEF_F  (
 aPEKORD_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKORD_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKORD_DEF where PEKORD_DEFID=aPEKORD_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(docnumber),' ') ||'; '
  into aBrief from PEKORD_DEF  where  PEKORD_DEFID = aPEKORD_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(docname),' ') ||'; '
  into aBrief from PEKORD_DEF  where  PEKORD_DEFID = aPEKORD_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(regdate),' ') ||'; '
  into aBrief from PEKORD_DEF  where  PEKORD_DEFID = aPEKORD_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKORD_DATA_BRIEF_F  (
 aPEKORD_DATAid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKORD_DATAid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKORD_DATA where PEKORD_DATAID=aPEKORD_DATAID;
if aTmpCnt >0 then
  aBRIEF:='';
select Cient
 into atmpID  from PEKORD_DATA  where  PEKORD_DATAID = aPEKORD_DATAID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
select NewTarifType
 into atmpID  from PEKORD_DATA  where  PEKORD_DATAID = aPEKORD_DATAID ;
 atmpBrief := func.PEKD_TRFTYPE_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WorkPlace_BRIEF_F  (
 aWorkPlaceid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function PEKD_NZONE_BRIEF_F  (
 aPEKD_NZONEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_NZONEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_NZONE where PEKD_NZONEID=aPEKD_NZONEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheYear),' ') ||'; '
  into aBrief from PEKD_NZONE  where  PEKD_NZONEID = aPEKD_NZONEID; 
  select  aBRIEF ||
  Decode( TheMonth
 ,11
 ,'Ноябрь'
 ,2
 ,'Февраль'
 ,12
 ,'Декабрь'
 ,3
 ,'Март'
 ,1
 ,'Январь'
 ,9
 ,'Сентябрь'
 ,6
 ,'Июнь'
 ,10
 ,'Октябрь'
 ,5
 ,'Май'
 ,8
 ,'Август'
 ,7
 ,'Июль'
 ,4
 ,'Апрель'
,'.') into aBrief from PEKD_NZONE where PEKD_NZONEID=aPEKD_NZONEID;
 select aBRIEF 
  ||  nvl(to_char(POIDX),' ') ||'; '
  into aBrief from PEKD_NZONE  where  PEKD_NZONEID = aPEKD_NZONEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_USEDNUM_BRIEF_F  (
 aPEKD_USEDNUMid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_USEDNUMid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_USEDNUM where PEKD_USEDNUMID=aPEKD_USEDNUMID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(UsedNumber),' ') ||'; '
  into aBrief from PEKD_USEDNUM  where  PEKD_USEDNUMID = aPEKD_USEDNUMID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function JournalColumn_BRIEF_F  (
 aJournalColumnid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function pekmsg_path_BRIEF_F  (
 apekmsg_pathid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if apekmsg_pathid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from pekmsg_path where pekmsg_pathID=apekmsg_pathID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(vagNo),' ') ||'; '
  into aBrief from pekmsg_path  where  pekmsg_pathID = apekmsg_pathID; 
select TheDirection
 into atmpID  from pekmsg_path  where  pekmsg_pathID = apekmsg_pathID ;
 atmpBrief := func.PEKD_DIRECTION_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_MAILLIST_BRIEF_F  (
 aWEBS_MAILLISTid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function WEBS_RECLAME_BRIEF_F  (
 aWEBS_RECLAMEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBS_RECLAMEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBS_RECLAME where WEBS_RECLAMEID=aWEBS_RECLAMEID;
if aTmpCnt >0 then
  aBRIEF:='';
select Path
 into atmpID  from WEBS_RECLAME  where  WEBS_RECLAMEID = aWEBS_RECLAMEID ;
 atmpBrief := func.TheDefenitionDiffP_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBS_PAGEDEF_BRIEF_F  (
 aWEBS_PAGEDEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function WEBS_ANKETA_BRIEF_F  (
 aWEBS_ANKETAid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
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



function VRCPSeeAlso_BRIEF_F  (
 aVRCPSeeAlsoid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCPSeeAlsoid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCPSeeAlso where VRCPSeeAlsoID=aVRCPSeeAlsoID;
if aTmpCnt >0 then
  aBRIEF:='';
select Document
 into atmpID  from VRCPSeeAlso  where  VRCPSeeAlsoID = aVRCPSeeAlsoID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(the_Comment),' ') ||'; '
  into aBrief from VRCPSeeAlso  where  VRCPSeeAlsoID = aVRCPSeeAlsoID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCPSpecial_BRIEF_F  (
 aVRCPSpecialid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCPSpecialid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCPSpecial where VRCPSpecialID=aVRCPSpecialID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DateOF),' ') ||'; '
  into aBrief from VRCPSpecial  where  VRCPSpecialID = aVRCPSpecialID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCPPresents_BRIEF_F  (
 aVRCPPresentsid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCPPresentsid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCPPresents where VRCPPresentsID=aVRCPPresentsID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DateOF),' ') ||'; '
  into aBrief from VRCPPresents  where  VRCPPresentsID = aVRCPPresentsID; 
 select aBRIEF 
  ||  nvl(to_char(Gift),' ') ||'; '
  into aBrief from VRCPPresents  where  VRCPPresentsID = aVRCPPresentsID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCPReports_BRIEF_F  (
 aVRCPReportsid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCPReportsid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCPReports where VRCPReportsID=aVRCPReportsID;
if aTmpCnt >0 then
  aBRIEF:='';
select Report
 into atmpID  from VRCPReports  where  VRCPReportsID = aVRCPReportsID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCPDates_BRIEF_F  (
 aVRCPDatesid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCPDatesid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCPDates where VRCPDatesID=aVRCPDatesID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(DateOf),' ') ||'; '
  into aBrief from VRCPDates  where  VRCPDatesID = aVRCPDatesID; 
 select aBRIEF 
  ||  nvl(to_char(DateEvent),' ') ||'; '
  into aBrief from VRCPDates  where  VRCPDatesID = aVRCPDatesID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCPNeigborhood_BRIEF_F  (
 aVRCPNeigborhoodid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCPNeigborhoodid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCPNeigborhood where VRCPNeigborhoodID=aVRCPNeigborhoodID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(the_Level),' ') ||'; '
  into aBrief from VRCPNeigborhood  where  VRCPNeigborhoodID = aVRCPNeigborhoodID; 
select person
 into atmpID  from VRCPNeigborhood  where  VRCPNeigborhoodID = aVRCPNeigborhoodID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCPInterest_BRIEF_F  (
 aVRCPInterestid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCPInterestid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCPInterest where VRCPInterestID=aVRCPInterestID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Info),' ') ||'; '
  into aBrief from VRCPInterest  where  VRCPInterestID = aVRCPInterestID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function VRCPCommon_BRIEF_F  (
 aVRCPCommonid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aVRCPCommonid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from VRCPCommon where VRCPCommonID=aVRCPCommonID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Family),' ') ||'; '
  into aBrief from VRCPCommon  where  VRCPCommonID = aVRCPCommonID; 
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from VRCPCommon  where  VRCPCommonID = aVRCPCommonID; 
 select aBRIEF 
  ||  nvl(to_char(SurName),' ') ||'; '
  into aBrief from VRCPCommon  where  VRCPCommonID = aVRCPCommonID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKZR_DATA_BRIEF_F  (
 aPEKZR_DATAid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKZR_DATAid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKZR_DATA where PEKZR_DATAID=aPEKZR_DATAID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheDept
 into atmpID  from PEKZR_DATA  where  PEKZR_DATAID = aPEKZR_DATAID ;
 atmpBrief := func.PEKD_DEPT_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from PEKZR_DATA  where  PEKZR_DATAID = aPEKZR_DATAID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WEBCRD_NUM_BRIEF_F  (
 aWEBCRD_NUMid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWEBCRD_NUMid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WEBCRD_NUM where WEBCRD_NUMID=aWEBCRD_NUMID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheNumber),' ') ||'; '
  into aBrief from WEBCRD_NUM  where  WEBCRD_NUMID = aWEBCRD_NUMID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function WBCRD_DEF_BRIEF_F  (
 aWBCRD_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aWBCRD_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from WBCRD_DEF where WBCRD_DEFID=aWBCRD_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TheDate),' ') ||'; '
  into aBrief from WBCRD_DEF  where  WBCRD_DEFID = aWBCRD_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKO_DEF_BRIEF_F  (
 aPEKO_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKO_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKO_DEF where PEKO_DEFID=aPEKO_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select ToClient
 into atmpID  from PEKO_DEF  where  PEKO_DEFID = aPEKO_DEFID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(PLPNUM),' ') ||'; '
  into aBrief from PEKO_DEF  where  PEKO_DEFID = aPEKO_DEFID; 
 select aBRIEF 
  ||  nvl(to_char(PLPDate),' ') ||'; '
  into aBrief from PEKO_DEF  where  PEKO_DEFID = aPEKO_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKL_DEF_BRIEF_F  (
 aPEKL_DEFid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKL_DEFid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKL_DEF where PEKL_DEFID=aPEKL_DEFID;
if aTmpCnt >0 then
  aBRIEF:='';
select TheDep
 into atmpID  from PEKL_DEF  where  PEKL_DEFID = aPEKL_DEFID ;
 atmpBrief := func.PEKD_DEPT_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 select aBRIEF 
  ||  nvl(to_char(FromDate),' ') ||'; '
  into aBrief from PEKL_DEF  where  PEKL_DEFID = aPEKL_DEFID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKL_WDAY_BRIEF_F  (
 aPEKL_WDAYid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKL_WDAYid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKL_WDAY where PEKL_WDAYID=aPEKL_WDAYID;
if aTmpCnt >0 then
  aBRIEF:='';
select Train
 into atmpID  from PEKL_WDAY  where  PEKL_WDAYID = aPEKL_WDAYID ;
 atmpBrief := func.PEKD_TRAINS_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_ADDS_BRIEF_F  (
 aPEKD_ADDSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_ADDSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_ADDS where PEKD_ADDSID=aPEKD_ADDSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from PEKD_ADDS  where  PEKD_ADDSID = aPEKD_ADDSID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_TRAINTYPE_BRIEF_F  (
 aPEKD_TRAINTYPEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_TRAINTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_TRAINTYPE where PEKD_TRAINTYPEID=aPEKD_TRAINTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from PEKD_TRAINTYPE  where  PEKD_TRAINTYPEID = aPEKD_TRAINTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_AUTO_BRIEF_F  (
 aPEKD_AUTOid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_AUTOid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_AUTO where PEKD_AUTOID=aPEKD_AUTOID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from PEKD_AUTO  where  PEKD_AUTOID = aPEKD_AUTOID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_GOTYPE_BRIEF_F  (
 aPEKD_GOTYPEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_GOTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_GOTYPE where PEKD_GOTYPEID=aPEKD_GOTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from PEKD_GOTYPE  where  PEKD_GOTYPEID = aPEKD_GOTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_INFOSENDTYPE_BRIEF_F  (
 aPEKD_INFOSENDTYPEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_INFOSENDTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_INFOSENDTYPE where PEKD_INFOSENDTYPEID=aPEKD_INFOSENDTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from PEKD_INFOSENDTYPE  where  PEKD_INFOSENDTYPEID = aPEKD_INFOSENDTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_TRTYPE_BRIEF_F  (
 aPEKD_TRTYPEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_TRTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_TRTYPE where PEKD_TRTYPEID=aPEKD_TRTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from PEKD_TRTYPE  where  PEKD_TRTYPEID = aPEKD_TRTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_GRPDpUSL_BRIEF_F  (
 aPEKD_GRPDpUSLid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_GRPDpUSLid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_GRPDpUSL where PEKD_GRPDpUSLID=aPEKD_GRPDpUSLID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from PEKD_GRPDpUSL  where  PEKD_GRPDpUSLID = aPEKD_GRPDpUSLID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_POSTTYPE_BRIEF_F  (
 aPEKD_POSTTYPEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_POSTTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_POSTTYPE where PEKD_POSTTYPEID=aPEKD_POSTTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from PEKD_POSTTYPE  where  PEKD_POSTTYPEID = aPEKD_POSTTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_TRFGRP_BRIEF_F  (
 aPEKD_TRFGRPid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_TRFGRPid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_TRFGRP where PEKD_TRFGRPID=aPEKD_TRFGRPID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from PEKD_TRFGRP  where  PEKD_TRFGRPID = aPEKD_TRFGRPID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_TRFTYPE_BRIEF_F  (
 aPEKD_TRFTYPEid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_TRFTYPEid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_TRFTYPE where PEKD_TRFTYPEID=aPEKD_TRFTYPEID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from PEKD_TRFTYPE  where  PEKD_TRFTYPEID = aPEKD_TRFTYPEID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_DEPT_BRIEF_F  (
 aPEKD_DEPTid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_DEPTid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_DEPT where PEKD_DEPTID=aPEKD_DEPTID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from PEKD_DEPT  where  PEKD_DEPTID = aPEKD_DEPTID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_DEPLIMITS_BRIEF_F  (
 aPEKD_DEPLIMITSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_DEPLIMITSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_DEPLIMITS where PEKD_DEPLIMITSID=aPEKD_DEPLIMITSID;
if aTmpCnt >0 then
  aBRIEF:='';
select Supplier
 into atmpID  from PEKD_DEPLIMITS  where  PEKD_DEPLIMITSID = aPEKD_DEPLIMITSID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_DEPDOG_BRIEF_F  (
 aPEKD_DEPDOGid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_DEPDOGid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_DEPDOG where PEKD_DEPDOGID=aPEKD_DEPDOGID;
if aTmpCnt >0 then
  aBRIEF:='';
select Supplier
 into atmpID  from PEKD_DEPDOG  where  PEKD_DEPDOGID = aPEKD_DEPDOGID ;
 atmpBrief:= Func.Instance_BRIEF_F( atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_DIRECTION_BRIEF_F  (
 aPEKD_DIRECTIONid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_DIRECTIONid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_DIRECTION where PEKD_DIRECTIONID=aPEKD_DIRECTIONID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(Name),' ') ||'; '
  into aBrief from PEKD_DIRECTION  where  PEKD_DIRECTIONID = aPEKD_DIRECTIONID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_TRAINS_BRIEF_F  (
 aPEKD_TRAINSid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_TRAINSid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_TRAINS where PEKD_TRAINSID=aPEKD_TRAINSID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(TrainNo),' ') ||'; '
  into aBrief from PEKD_TRAINS  where  PEKD_TRAINSID = aPEKD_TRAINSID; 
select FromStation
 into atmpID  from PEKD_TRAINS  where  PEKD_TRAINSID = aPEKD_TRAINSID ;
 atmpBrief := func.PEKD_DIRSTATION_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
select ToSTATION
 into atmpID  from PEKD_TRAINS  where  PEKD_TRAINSID = aPEKD_TRAINSID ;
 atmpBrief := func.PEKD_DIRSTATION_BRIEF_F(atmpID);
  aBRIEF:= aBRIEF || '{' || nvl(atmpbrief,' ') || '}; ';
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_DIRSTATION_BRIEF_F  (
 aPEKD_DIRSTATIONid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_DIRSTATIONid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_DIRSTATION where PEKD_DIRSTATIONID=aPEKD_DIRSTATIONID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from PEKD_DIRSTATION  where  PEKD_DIRSTATIONID = aPEKD_DIRSTATIONID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;



function PEKD_SRV_BRIEF_F  (
 aPEKD_SRVid CHAR
) return varchar as 
 aBRIEF varchar(255);
 atmpStr varchar(255);
 atmpBrief varchar(2000);
 atmpID CHAR(38);
 atmpCnt Numeric;
 begin  
if aPEKD_SRVid is null  then  aBRIEF:=' '; return (aBRIEF); end if;
 -- Brief body -- 
select count(*) into aTmpCnt from PEKD_SRV where PEKD_SRVID=aPEKD_SRVID;
if aTmpCnt >0 then
  aBRIEF:='';
 select aBRIEF 
  ||  nvl(to_char(name),' ') ||'; '
  into aBrief from PEKD_SRV  where  PEKD_SRVID = aPEKD_SRVID; 
 else 
  aBRIEF:= '-';
end if;
 aBRIEF:=substr(aBRIEF,1,255);
return (aBRIEF);
end;


 end Func;

;



