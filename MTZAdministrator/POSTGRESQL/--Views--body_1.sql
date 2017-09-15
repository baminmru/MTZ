
/* --body*/

 

create or replace view v_INSTANCE as
select instance.*,objstatus.name statusname,objstatus.IsArchive
from instance left join objstatus on instance.status=objstatus.objstatusid
;

create or replace view V_AUTOFilterFieldGroup as 
select   FilterFieldGroupID
, 
FilterFieldGroup.sequence 
FilterFieldGroup_sequence 
, 
FilterFieldGroup.Caption 
FilterFieldGroup_Caption 
, 
FilterFieldGroup.Name 
FilterFieldGroup_Name 
, 
 FilterFieldGroup.AllowIgnore  
FilterFieldGroup_AllowIgnore_VAL, 
 decode(FilterFieldGroup.AllowIgnore 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FilterFieldGroup_AllowIgnore 
, FilterFieldGroup.InstanceID InstanceID 
, FilterFieldGroup.FilterFieldGroupID ID 
, 'FilterFieldGroup' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FilterFieldGroup
 join INSTANCE on FilterFieldGroup.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOFileterField as 
select   FileterFieldID,FilterFieldGroupID
, 
FileterField.sequence 
FileterField_sequence 
, 
 FileterField.ValueArray  
FileterField_ValueArray_VAL, 
 decode(FileterField.ValueArray 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FileterField_ValueArray 
, 
FileterField.FieldSize 
FileterField_FieldSize 
, 
 FileterField.RefType  
FileterField_RefType_VAL, 
 decode(FileterField.RefType 
, 2 ,'На строку раздела'
, 3 ,'На источник данных'
, 0 ,'Скалярное поле ( не ссылка)'
, 1 ,'На объект '
, '???') 
FileterField_RefType 
, 
 FileterField.RefToPart  
FileterField_RefToPart_ID, 
 Func.PART_BRIEF_F(FileterField.RefToPart) 
FileterField_RefToPart 
, 
FileterField.Caption 
FileterField_Caption 
, 
 FileterField.FieldType  
FileterField_FieldType_ID, 
 Func.FIELDTYPE_BRIEF_F(FileterField.FieldType) 
FileterField_FieldType 
, 
 FileterField.RefToType  
FileterField_RefToType_ID, 
 Func.OBJECTTYPE_BRIEF_F(FileterField.RefToType) 
FileterField_RefToType 
, 
FileterField.Name 
FileterField_Name 
, FilterFieldGroup.InstanceID InstanceID 
, FileterField.FileterFieldID ID 
, 'FileterField' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FileterField
 join FilterFieldGroup on FilterFieldGroup.FilterFieldGroupID=FileterField.ParentStructRowID 
 join INSTANCE on FilterFieldGroup.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewMTZFltr_Filters as 
select   FiltersID
, 
Filters.TheCaption 
Filters_TheCaption 
, 
Filters.Name 
Filters_Name 
, Filters.InstanceID InstanceID 
, Filters.FiltersID ID 
, 'Filters' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Filters
 join INSTANCE on Filters.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOFilters as 
select   FiltersID
, 
Filters.Name 
Filters_Name 
, 
Filters.TheCaption 
Filters_TheCaption 
, 
Filters.TheComment 
Filters_TheComment 
, Filters.InstanceID InstanceID 
, Filters.FiltersID ID 
, 'Filters' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Filters
 join INSTANCE on Filters.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEK103_DEF as 
select   PEK103_DEFID
, 
PEK103_DEF.Coment 
PEK103_DEF_Coment 
, 
PEK103_DEF.TheNumber 
PEK103_DEF_TheNumber 
, 
 PEK103_DEF.PEKZ  
PEK103_DEF_PEKZ_ID, 
 Func.INSTANCE_BRIEF_F(PEK103_DEF.PEKZ) 
PEK103_DEF_PEKZ 
, 
PEK103_DEF.NodeDate 
PEK103_DEF_NodeDate 
, 
PEK103_DEF.Sender 
PEK103_DEF_Sender 
, 
 PEK103_DEF.ThePath  
PEK103_DEF_ThePath_ID, 
 Func.pekz_path_BRIEF_F(PEK103_DEF.ThePath) 
PEK103_DEF_ThePath 
, 
PEK103_DEF.RcvDate 
PEK103_DEF_RcvDate 
, PEK103_DEF.InstanceID InstanceID 
, PEK103_DEF.PEK103_DEFID ID 
, 'PEK103_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEK103_DEF
 join INSTANCE on PEK103_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEK103_LINES as 
select   PEK103_LINESID
, 
PEK103_LINES.Weight 
PEK103_LINES_Weight 
, 
PEK103_LINES.Seqence 
PEK103_LINES_Seqence 
, 
PEK103_LINES.Cost 
PEK103_LINES_Cost 
, 
PEK103_LINES.PPOCode 
PEK103_LINES_PPOCode 
, 
 PEK103_LINES.IndexTo  
PEK103_LINES_IndexTo_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(PEK103_LINES.IndexTo) 
PEK103_LINES_IndexTo 
, 
 PEK103_LINES.WeightEDIZM  
PEK103_LINES_WeightEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEK103_LINES.WeightEDIZM) 
PEK103_LINES_WeightEDIZM 
, 
PEK103_LINES.Reciever 
PEK103_LINES_Reciever 
, 
PEK103_LINES.Quantity 
PEK103_LINES_Quantity 
, PEK103_LINES.InstanceID InstanceID 
, PEK103_LINES.PEK103_LINESID ID 
, 'PEK103_LINES' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEK103_LINES
 join INSTANCE on PEK103_LINES.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBC_BLOCK as 
select   WEBC_BLOCKID
, 
WEBC_BLOCK.name 
WEBC_BLOCK_name 
, 
WEBC_BLOCK.Info 
WEBC_BLOCK_Info 
, WEBC_BLOCK.InstanceID InstanceID 
, WEBC_BLOCK.WEBC_BLOCKID ID 
, 'WEBC_BLOCK' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBC_BLOCK
 join INSTANCE on WEBC_BLOCK.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBC_NEWS as 
select   WEBC_NEWSID
, 
WEBC_NEWS.Annotation 
WEBC_NEWS_Annotation 
, 
WEBC_NEWS.TheDate 
WEBC_NEWS_TheDate 
, 
 WEBC_NEWS.Accept  
WEBC_NEWS_Accept_VAL, 
 decode(WEBC_NEWS.Accept 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBC_NEWS_Accept 
, 
WEBC_NEWS.Info 
WEBC_NEWS_Info 
, 
WEBC_NEWS.ShortName 
WEBC_NEWS_ShortName 
, WEBC_NEWS.InstanceID InstanceID 
, WEBC_NEWS.WEBC_NEWSID ID 
, 'WEBC_NEWS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBC_NEWS
 join INSTANCE on WEBC_NEWS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBC_JOB as 
select   WEBC_JOBID
, 
WEBC_JOB.JobCity 
WEBC_JOB_JobCity 
, 
WEBC_JOB.JobName 
WEBC_JOB_JobName 
, 
WEBC_JOB.JobDescription 
WEBC_JOB_JobDescription 
, 
WEBC_JOB.JobCompensation 
WEBC_JOB_JobCompensation 
, 
 WEBC_JOB.JobEducation  
WEBC_JOB_JobEducation_VAL, 
 decode(WEBC_JOB.JobEducation 
, 2 ,'Среднее специальное'
, 1 ,'Среднее'
, -1 ,'Не важно'
, 4 ,'Высшее'
, 0 ,'Неполное среднее'
, 3 ,'Неполное высшее'
, 5 ,'Несколько высших'
, '???') 
WEBC_JOB_JobEducation 
, 
WEBC_JOB.JobDate 
WEBC_JOB_JobDate 
, 
 WEBC_JOB.JobActual  
WEBC_JOB_JobActual_VAL, 
 decode(WEBC_JOB.JobActual 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBC_JOB_JobActual 
, 
WEBC_JOB.JobExperience 
WEBC_JOB_JobExperience 
, 
WEBC_JOB.JobAge 
WEBC_JOB_JobAge 
, 
 WEBC_JOB.JobSex  
WEBC_JOB_JobSex_VAL, 
 decode(WEBC_JOB.JobSex 
, 1 ,'Мужской'
, 0 ,'Не существенно'
, -1 ,'Женский'
, '???') 
WEBC_JOB_JobSex 
, 
 WEBC_JOB.JobEmployment  
WEBC_JOB_JobEmployment_VAL, 
 decode(WEBC_JOB.JobEmployment 
, 0 ,'Полная'
, 1 ,'Частичная'
, -1 ,'Не важно'
, '???') 
WEBC_JOB_JobEmployment 
, WEBC_JOB.InstanceID InstanceID 
, WEBC_JOB.WEBC_JOBID ID 
, 'WEBC_JOB' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBC_JOB
 join INSTANCE on WEBC_JOB.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBC_MESSAGES as 
select   WEBC_MESSAGESID
, 
WEBC_MESSAGES.MESSAGES_FIO 
WEBC_MESSAGES_MESSAGES_FIO 
, 
WEBC_MESSAGES.MESSAGES_TEL 
WEBC_MESSAGES_MESSAGES_TEL 
, 
WEBC_MESSAGES.MESSAGES_Text 
WEBC_MESSAGES_MESSAGES_Text 
, 
WEBC_MESSAGES.MESSAGES_Org 
WEBC_MESSAGES_MESSAGES_Org 
, 
WEBC_MESSAGES.MESSAGES_Position 
WEBC_MESSAGES_MESSAGES_Position 
, 
WEBC_MESSAGES.MESSAGES_Email 
WEBC_MESSAGES_MESSAGES_Email 
, 
WEBC_MESSAGES.MESSAGES_City 
WEBC_MESSAGES_MESSAGES_City 
, WEBC_MESSAGES.InstanceID InstanceID 
, WEBC_MESSAGES.WEBC_MESSAGESID ID 
, 'WEBC_MESSAGES' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBC_MESSAGES
 join INSTANCE on WEBC_MESSAGES.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBC_DOCS as 
select   WEBC_DOCSID
, 
WEBC_DOCS.DocsName 
WEBC_DOCS_DocsName 
, 
WEBC_DOCS.DocsFileDate 
WEBC_DOCS_DocsFileDate 
, 
WEBC_DOCS.DocsDescription 
WEBC_DOCS_DocsDescription 
, 
 WEBC_DOCS.DocsActual  
WEBC_DOCS_DocsActual_VAL, 
 decode(WEBC_DOCS.DocsActual 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBC_DOCS_DocsActual 
, 
WEBC_DOCS.DocsFileSize 
WEBC_DOCS_DocsFileSize 
, 
WEBC_DOCS.DocsNum 
WEBC_DOCS_DocsNum 
, 
WEBC_DOCS.DocsFileName 
WEBC_DOCS_DocsFileName 
, WEBC_DOCS.InstanceID InstanceID 
, WEBC_DOCS.WEBC_DOCSID ID 
, 'WEBC_DOCS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBC_DOCS
 join INSTANCE on WEBC_DOCS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBC_FILIALS as 
select   WEBC_FILIALSID
, 
WEBC_FILIALS.OfficeBigImage 
WEBC_FILIALS_OfficeBigImage 
, 
WEBC_FILIALS.OfficeName 
WEBC_FILIALS_OfficeName 
, 
WEBC_FILIALS.EMailManag 
WEBC_FILIALS_EMailManag 
, 
WEBC_FILIALS.OfficeCity 
WEBC_FILIALS_OfficeCity 
, 
 WEBC_FILIALS.ReferFilial  
WEBC_FILIALS_ReferFilial_ID, 
 Func.PEKD_DEPT_BRIEF_F(WEBC_FILIALS.ReferFilial) 
WEBC_FILIALS_ReferFilial 
, 
WEBC_FILIALS.OfficeAddress 
WEBC_FILIALS_OfficeAddress 
, 
WEBC_FILIALS.OfficeSmallImage 
WEBC_FILIALS_OfficeSmallImage 
, 
WEBC_FILIALS.OfficeTelefons 
WEBC_FILIALS_OfficeTelefons 
, 
WEBC_FILIALS.OfficeNum 
WEBC_FILIALS_OfficeNum 
, 
WEBC_FILIALS.EMailAddit 
WEBC_FILIALS_EMailAddit 
, WEBC_FILIALS.InstanceID InstanceID 
, WEBC_FILIALS.WEBC_FILIALSID ID 
, 'WEBC_FILIALS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBC_FILIALS
 join INSTANCE on WEBC_FILIALS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBC_LINKS as 
select   WEBC_LINKSID
, 
WEBC_LINKS.LinkName 
WEBC_LINKS_LinkName 
, 
WEBC_LINKS.LinkURL 
WEBC_LINKS_LinkURL 
, 
WEBC_LINKS.LinkDescription 
WEBC_LINKS_LinkDescription 
, WEBC_LINKS.InstanceID InstanceID 
, WEBC_LINKS.WEBC_LINKSID ID 
, 'WEBC_LINKS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBC_LINKS
 join INSTANCE on WEBC_LINKS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewVRRPT_COSTS as 
select   VRRPT_COSTSID
, 
 VRRPT_MAIN.Contract  
VRRPT_MAIN_Contract_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Contract) 
VRRPT_MAIN_Contract 
, 
VRRPT_MAIN.Attrachment 
VRRPT_MAIN_Attrachment 
, 
 VRRPT_MAIN.Author  
VRRPT_MAIN_Author_ID, 
 Func.Users_BRIEF_F(VRRPT_MAIN.Author) 
VRRPT_MAIN_Author 
, 
VRRPT_MAIN.Name 
VRRPT_MAIN_Name 
, 
VRRPT_COSTS.Descrtiption 
VRRPT_COSTS_Descrtiption 
, 
 VRRPT_MAIN.Client  
VRRPT_MAIN_Client_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Client) 
VRRPT_MAIN_Client 
, 
VRRPT_MAIN.TheDate 
VRRPT_MAIN_TheDate 
, 
 VRRPT_MAIN.Project  
VRRPT_MAIN_Project_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Project) 
VRRPT_MAIN_Project 
, 
VRRPT_COSTS.Duration 
VRRPT_COSTS_Duration 
, 
 VRRPT_MAIN.Person  
VRRPT_MAIN_Person_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Person) 
VRRPT_MAIN_Person 
, VRRPT_COSTS.InstanceID InstanceID 
, VRRPT_COSTS.VRRPT_COSTSID ID 
, 'VRRPT_COSTS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRRPT_COSTS
 join INSTANCE on VRRPT_COSTS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join VRRPT_MAIN ON VRRPT_MAIN.InstanceID=VRRPT_COSTS.InstanceID 
;
create or replace view V_AUTOVRRPT_COSTS as 
select   VRRPT_COSTSID
, 
VRRPT_COSTS.Duration 
VRRPT_COSTS_Duration 
, 
VRRPT_COSTS.Descrtiption 
VRRPT_COSTS_Descrtiption 
, 
VRRPT_COSTS.Cost 
VRRPT_COSTS_Cost 
, VRRPT_COSTS.InstanceID InstanceID 
, VRRPT_COSTS.VRRPT_COSTSID ID 
, 'VRRPT_COSTS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRRPT_COSTS
 join INSTANCE on VRRPT_COSTS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_VRRPT_MeetingPlan as 
select   VRRPT_MeetingPlanID
, 
 VRRPT_MAIN.Client  
VRRPT_MAIN_Client_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Client) 
VRRPT_MAIN_Client 
, 
VRRPT_MAIN.Info 
VRRPT_MAIN_Info 
, 
VRRPT_MeetingPlan.theme 
VRRPT_MeetingPlan_theme 
, 
VRRPT_MeetingPlan.PlaceOf 
VRRPT_MeetingPlan_PlaceOf 
, 
 VRRPT_MAIN.Project  
VRRPT_MAIN_Project_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Project) 
VRRPT_MAIN_Project 
, 
 VRRPT_MAIN.Contract  
VRRPT_MAIN_Contract_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Contract) 
VRRPT_MAIN_Contract 
, 
VRRPT_MeetingPlan.DateOF 
VRRPT_MeetingPlan_DateOF 
, 
 VRRPT_MAIN.Person  
VRRPT_MAIN_Person_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Person) 
VRRPT_MAIN_Person 
, 
VRRPT_MAIN.Name 
VRRPT_MAIN_Name 
, 
VRRPT_MAIN.Attrachment 
VRRPT_MAIN_Attrachment 
, 
 VRRPT_MAIN.ReportType  
VRRPT_MAIN_ReportType_ID, 
 Func.VRDRreportType_BRIEF_F(VRRPT_MAIN.ReportType) 
VRRPT_MAIN_ReportType 
, 
VRRPT_MAIN.TheDate 
VRRPT_MAIN_TheDate 
, 
 VRRPT_MAIN.Author  
VRRPT_MAIN_Author_ID, 
 Func.Users_BRIEF_F(VRRPT_MAIN.Author) 
VRRPT_MAIN_Author 
, VRRPT_MeetingPlan.InstanceID InstanceID 
, VRRPT_MeetingPlan.VRRPT_MeetingPlanID ID 
, 'VRRPT_MeetingPlan' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRRPT_MeetingPlan
 join INSTANCE on VRRPT_MeetingPlan.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join VRRPT_MAIN ON VRRPT_MAIN.InstanceID=VRRPT_MeetingPlan.InstanceID 
;
create or replace view V_AUTOVRRPT_MeetingPlan as 
select   VRRPT_MeetingPlanID
, 
VRRPT_MeetingPlan.PlaceOf 
VRRPT_MeetingPlan_PlaceOf 
, 
VRRPT_MeetingPlan.theme 
VRRPT_MeetingPlan_theme 
, 
VRRPT_MeetingPlan.DateOF 
VRRPT_MeetingPlan_DateOF 
, VRRPT_MeetingPlan.InstanceID InstanceID 
, VRRPT_MeetingPlan.VRRPT_MeetingPlanID ID 
, 'VRRPT_MeetingPlan' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRRPT_MeetingPlan
 join INSTANCE on VRRPT_MeetingPlan.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRRPT_Meeters as 
select   VRRPT_MeetersID,VRRPT_MeetingPlanID
, 
 VRRPT_Meeters.Contact  
VRRPT_Meeters_Contact_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_Meeters.Contact) 
VRRPT_Meeters_Contact 
, 
 VRRPT_Meeters.ReminderSent  
VRRPT_Meeters_ReminderSent_VAL, 
 decode(VRRPT_Meeters.ReminderSent 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRRPT_Meeters_ReminderSent 
, 
 VRRPT_Meeters.Worker  
VRRPT_Meeters_Worker_ID, 
 Func.Users_BRIEF_F(VRRPT_Meeters.Worker) 
VRRPT_Meeters_Worker 
, 
VRRPT_Meeters.ReminderTime 
VRRPT_Meeters_ReminderTime 
, 
 VRRPT_Meeters.Mandatory  
VRRPT_Meeters_Mandatory_VAL, 
 decode(VRRPT_Meeters.Mandatory 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRRPT_Meeters_Mandatory 
, VRRPT_MeetingPlan.InstanceID InstanceID 
, VRRPT_Meeters.VRRPT_MeetersID ID 
, 'VRRPT_Meeters' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRRPT_Meeters
 join VRRPT_MeetingPlan on VRRPT_MeetingPlan.VRRPT_MeetingPlanID=VRRPT_Meeters.ParentStructRowID 
 join INSTANCE on VRRPT_MeetingPlan.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewVRRPT_Meeters as 
select   VRRPT_MeetersID,VRRPT_MeetingPlanID
, 
VRRPT_MeetingPlan.theme 
VRRPT_MeetingPlan_theme 
, 
VRRPT_MeetingPlan.DateOF 
VRRPT_MeetingPlan_DateOF 
, 
 VRRPT_MAIN.Person  
VRRPT_MAIN_Person_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Person) 
VRRPT_MAIN_Person 
, 
VRRPT_Meeters.ReminderTime 
VRRPT_Meeters_ReminderTime 
, 
 VRRPT_Meeters.Worker  
VRRPT_Meeters_Worker_ID, 
 Func.Users_BRIEF_F(VRRPT_Meeters.Worker) 
VRRPT_Meeters_Worker 
, 
 VRRPT_MAIN.Author  
VRRPT_MAIN_Author_ID, 
 Func.Users_BRIEF_F(VRRPT_MAIN.Author) 
VRRPT_MAIN_Author 
, 
 VRRPT_MAIN.Project  
VRRPT_MAIN_Project_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Project) 
VRRPT_MAIN_Project 
, 
VRRPT_MeetingPlan.PlaceOf 
VRRPT_MeetingPlan_PlaceOf 
, 
VRRPT_MAIN.TheDate 
VRRPT_MAIN_TheDate 
, 
VRRPT_MAIN.Attrachment 
VRRPT_MAIN_Attrachment 
, 
 VRRPT_Meeters.Contact  
VRRPT_Meeters_Contact_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_Meeters.Contact) 
VRRPT_Meeters_Contact 
, 
 VRRPT_MAIN.Contract  
VRRPT_MAIN_Contract_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Contract) 
VRRPT_MAIN_Contract 
, 
 VRRPT_Meeters.Mandatory  
VRRPT_Meeters_Mandatory_VAL, 
 decode(VRRPT_Meeters.Mandatory 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRRPT_Meeters_Mandatory 
, 
 VRRPT_MAIN.Client  
VRRPT_MAIN_Client_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Client) 
VRRPT_MAIN_Client 
, 
VRRPT_MAIN.Info 
VRRPT_MAIN_Info 
, 
 VRRPT_Meeters.ReminderSent  
VRRPT_Meeters_ReminderSent_VAL, 
 decode(VRRPT_Meeters.ReminderSent 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRRPT_Meeters_ReminderSent 
, 
VRRPT_MAIN.Name 
VRRPT_MAIN_Name 
, VRRPT_MeetingPlan.InstanceID InstanceID 
, VRRPT_Meeters.VRRPT_MeetersID ID 
, 'VRRPT_Meeters' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRRPT_Meeters
 join VRRPT_MeetingPlan on VRRPT_MeetingPlan.VRRPT_MeetingPlanID=VRRPT_Meeters.ParentStructRowID 
 join INSTANCE on VRRPT_MeetingPlan.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join VRRPT_MAIN ON VRRPT_MAIN.InstanceID=VRRPT_MeetingPlan.InstanceID 
;
create or replace view V_AUTOVRRPT_MAIN as 
select   VRRPT_MAINID
, 
 VRRPT_MAIN.Contract  
VRRPT_MAIN_Contract_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Contract) 
VRRPT_MAIN_Contract 
, 
VRRPT_MAIN.Info 
VRRPT_MAIN_Info 
, 
VRRPT_MAIN.Name 
VRRPT_MAIN_Name 
, 
 VRRPT_MAIN.Project  
VRRPT_MAIN_Project_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Project) 
VRRPT_MAIN_Project 
, 
VRRPT_MAIN.Attrachment 
VRRPT_MAIN_Attrachment 
, 
 VRRPT_MAIN.Client  
VRRPT_MAIN_Client_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Client) 
VRRPT_MAIN_Client 
, 
 VRRPT_MAIN.ReportType  
VRRPT_MAIN_ReportType_ID, 
 Func.VRDRreportType_BRIEF_F(VRRPT_MAIN.ReportType) 
VRRPT_MAIN_ReportType 
, 
VRRPT_MAIN.TheDate 
VRRPT_MAIN_TheDate 
, 
 VRRPT_MAIN.Author  
VRRPT_MAIN_Author_ID, 
 Func.Users_BRIEF_F(VRRPT_MAIN.Author) 
VRRPT_MAIN_Author 
, 
 VRRPT_MAIN.Person  
VRRPT_MAIN_Person_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Person) 
VRRPT_MAIN_Person 
, VRRPT_MAIN.InstanceID InstanceID 
, VRRPT_MAIN.VRRPT_MAINID ID 
, 'VRRPT_MAIN' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRRPT_MAIN
 join INSTANCE on VRRPT_MAIN.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewVRRPT_MAIN as 
select   VRRPT_MAINID
, 
 VRRPT_MAIN.Client  
VRRPT_MAIN_Client_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Client) 
VRRPT_MAIN_Client 
, 
 VRRPT_MAIN.Author  
VRRPT_MAIN_Author_ID, 
 Func.Users_BRIEF_F(VRRPT_MAIN.Author) 
VRRPT_MAIN_Author 
, 
VRRPT_MAIN.Info 
VRRPT_MAIN_Info 
, 
VRRPT_MAIN.TheDate 
VRRPT_MAIN_TheDate 
, 
 VRRPT_MAIN.ReportType  
VRRPT_MAIN_ReportType_ID, 
 Func.VRDRreportType_BRIEF_F(VRRPT_MAIN.ReportType) 
VRRPT_MAIN_ReportType 
, 
VRRPT_MAIN.Attrachment 
VRRPT_MAIN_Attrachment 
, 
 VRRPT_MAIN.Contract  
VRRPT_MAIN_Contract_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Contract) 
VRRPT_MAIN_Contract 
, 
 VRRPT_MAIN.Project  
VRRPT_MAIN_Project_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Project) 
VRRPT_MAIN_Project 
, 
 VRRPT_MAIN.Person  
VRRPT_MAIN_Person_ID, 
 Func.INSTANCE_BRIEF_F(VRRPT_MAIN.Person) 
VRRPT_MAIN_Person 
, 
VRRPT_MAIN.Name 
VRRPT_MAIN_Name 
, VRRPT_MAIN.InstanceID InstanceID 
, VRRPT_MAIN.VRRPT_MAINID ID 
, 'VRRPT_MAIN' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRRPT_MAIN
 join INSTANCE on VRRPT_MAIN.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDGCommon as 
select   VRDGCommonID
, 
 VRDGCommon.Curator  
VRDGCommon_Curator_ID, 
 Func.Users_BRIEF_F(VRDGCommon.Curator) 
VRDGCommon_Curator 
, 
VRDGCommon.Name 
VRDGCommon_Name 
, 
VRDGCommon.EndDate 
VRDGCommon_EndDate 
, 
VRDGCommon.Code1C 
VRDGCommon_Code1C 
, 
VRDGCommon.DogNum 
VRDGCommon_DogNum 
, 
 VRDGCommon.Client  
VRDGCommon_Client_ID, 
 Func.INSTANCE_BRIEF_F(VRDGCommon.Client) 
VRDGCommon_Client 
, 
 VRDGCommon.PZDog  
VRDGCommon_PZDog_VAL, 
 decode(VRDGCommon.PZDog 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRDGCommon_PZDog 
, 
VRDGCommon.StartDate 
VRDGCommon_StartDate 
, 
VRDGCommon.DogDate 
VRDGCommon_DogDate 
, 
VRDGCommon.Info 
VRDGCommon_Info 
, VRDGCommon.InstanceID InstanceID 
, VRDGCommon.VRDGCommonID ID 
, 'VRDGCommon' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDGCommon
 join INSTANCE on VRDGCommon.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDGReport as 
select   VRDGReportID
, 
 VRDGReport.Report  
VRDGReport_Report_ID, 
 Func.INSTANCE_BRIEF_F(VRDGReport.Report) 
VRDGReport_Report 
, VRDGReport.InstanceID InstanceID 
, VRDGReport.VRDGReportID ID 
, 'VRDGReport' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDGReport
 join INSTANCE on VRDGReport.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDGContractChanges as 
select   VRDGContractChangesID
, 
VRDGContractChanges.Code 
VRDGContractChanges_Code 
, 
VRDGContractChanges.theFile 
VRDGContractChanges_theFile 
, 
VRDGContractChanges.the_Comment 
VRDGContractChanges_the_Comment 
, 
VRDGContractChanges.DateOf 
VRDGContractChanges_DateOf 
, VRDGContractChanges.InstanceID InstanceID 
, VRDGContractChanges.VRDGContractChangesID ID 
, 'VRDGContractChanges' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDGContractChanges
 join INSTANCE on VRDGContractChanges.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDGContractVersion as 
select   VRDGContractVersionID
, 
 VRDGContractVersion.Actual  
VRDGContractVersion_Actual_VAL, 
 decode(VRDGContractVersion.Actual 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRDGContractVersion_Actual 
, 
VRDGContractVersion.the_Comment 
VRDGContractVersion_the_Comment 
, 
VRDGContractVersion.theFile 
VRDGContractVersion_theFile 
, 
VRDGContractVersion.DateOf 
VRDGContractVersion_DateOf 
, VRDGContractVersion.InstanceID InstanceID 
, VRDGContractVersion.VRDGContractVersionID ID 
, 'VRDGContractVersion' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDGContractVersion
 join INSTANCE on VRDGContractVersion.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDGContractSpesial as 
select   VRDGContractSpesialID
, 
VRDGContractSpesial.DateOf 
VRDGContractSpesial_DateOf 
, 
 VRDGContractSpesial.IsDone  
VRDGContractSpesial_IsDone_VAL, 
 decode(VRDGContractSpesial.IsDone 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRDGContractSpesial_IsDone 
, 
VRDGContractSpesial.the_Comment 
VRDGContractSpesial_the_Comment 
, VRDGContractSpesial.InstanceID InstanceID 
, VRDGContractSpesial.VRDGContractSpesialID ID 
, 'VRDGContractSpesial' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDGContractSpesial
 join INSTANCE on VRDGContractSpesial.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKSH_DATA as 
select   PEKSH_DATAID
, 
PEKSH_DATA.Duration 
PEKSH_DATA_Duration 
, 
 PEKSH_DATA.Train  
PEKSH_DATA_Train_ID, 
 Func.PEKD_TRAINS_BRIEF_F(PEKSH_DATA.Train) 
PEKSH_DATA_Train 
, 
PEKSH_DATA.StartTime 
PEKSH_DATA_StartTime 
, PEKSH_DATA.InstanceID InstanceID 
, PEKSH_DATA.PEKSH_DATAID ID 
, 'PEKSH_DATA' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKSH_DATA
 join INSTANCE on PEKSH_DATA.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKSH_START as 
select   PEKSH_STARTID,PEKSH_DATAID
, 
PEKSH_START.StartTime 
PEKSH_START_StartTime 
, 
PEKSH_START.DayInYear 
PEKSH_START_DayInYear 
, PEKSH_DATA.InstanceID InstanceID 
, PEKSH_START.PEKSH_STARTID ID 
, 'PEKSH_START' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKSH_START
 join PEKSH_DATA on PEKSH_DATA.PEKSH_DATAID=PEKSH_START.ParentStructRowID 
 join INSTANCE on PEKSH_DATA.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKSH_PEKSH_DEF as 
select   PEKSH_DEFID
, 
 PEKSH_DEF.DIRECTION  
PEKSH_DEF_DIRECTION_ID, 
 Func.PEKD_DIRECTION_BRIEF_F(PEKSH_DEF.DIRECTION) 
PEKSH_DEF_DIRECTION 
, 
PEKSH_DEF.TheYear 
PEKSH_DEF_TheYear 
, PEKSH_DEF.InstanceID InstanceID 
, PEKSH_DEF.PEKSH_DEFID ID 
, 'PEKSH_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKSH_DEF
 join INSTANCE on PEKSH_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKSH_DEF as 
select   PEKSH_DEFID
, 
 PEKSH_DEF.DIRECTION  
PEKSH_DEF_DIRECTION_ID, 
 Func.PEKD_DIRECTION_BRIEF_F(PEKSH_DEF.DIRECTION) 
PEKSH_DEF_DIRECTION 
, 
PEKSH_DEF.TheYear 
PEKSH_DEF_TheYear 
, PEKSH_DEF.InstanceID InstanceID 
, PEKSH_DEF.PEKSH_DEFID ID 
, 'PEKSH_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKSH_DEF
 join INSTANCE on PEKSH_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOMTZ2JOB_DEF as 
select   MTZ2JOB_DEFID
, 
 MTZ2JOB_DEF.Processed  
MTZ2JOB_DEF_Processed_VAL, 
 decode(MTZ2JOB_DEF.Processed 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ2JOB_DEF_Processed 
, 
MTZ2JOB_DEF.ProcessDate 
MTZ2JOB_DEF_ProcessDate 
, 
MTZ2JOB_DEF.ThruState 
MTZ2JOB_DEF_ThruState 
, 
MTZ2JOB_DEF.EventDate 
MTZ2JOB_DEF_EventDate 
, 
MTZ2JOB_DEF.NextState 
MTZ2JOB_DEF_NextState 
, 
 MTZ2JOB_DEF.ThruObject  
MTZ2JOB_DEF_ThruObject_ID, 
 Func.INSTANCE_BRIEF_F(MTZ2JOB_DEF.ThruObject) 
MTZ2JOB_DEF_ThruObject 
, 
MTZ2JOB_DEF.EvenType 
MTZ2JOB_DEF_EvenType 
, MTZ2JOB_DEF.InstanceID InstanceID 
, MTZ2JOB_DEF.MTZ2JOB_DEFID ID 
, 'MTZ2JOB_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZ2JOB_DEF
 join INSTANCE on MTZ2JOB_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKPAY_DEF as 
select   PEKPAY_DEFID
, 
PEKPAY_DEF.PLPNUM 
PEKPAY_DEF_PLPNUM 
, 
PEKPAY_DEF.PLPSumm 
PEKPAY_DEF_PLPSumm 
, 
 PEKPAY_DEF.ToClient  
PEKPAY_DEF_ToClient_ID, 
 Func.INSTANCE_BRIEF_F(PEKPAY_DEF.ToClient) 
PEKPAY_DEF_ToClient 
, 
PEKPAY_DEF.Code1C 
PEKPAY_DEF_Code1C 
, 
PEKPAY_DEF.TheComment 
PEKPAY_DEF_TheComment 
, 
 PEKPAY_DEF.TheDept  
PEKPAY_DEF_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKPAY_DEF.TheDept) 
PEKPAY_DEF_TheDept 
, 
PEKPAY_DEF.PLPDate 
PEKPAY_DEF_PLPDate 
, PEKPAY_DEF.InstanceID InstanceID 
, PEKPAY_DEF.PEKPAY_DEFID ID 
, 'PEKPAY_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKPAY_DEF
 join INSTANCE on PEKPAY_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBSDIC_DEF as 
select   WEBSDIC_DEFID
, 
WEBSDIC_DEF.PathToFiles 
WEBSDIC_DEF_PathToFiles 
, 
 WEBSDIC_DEF.WEBS  
WEBSDIC_DEF_WEBS_ID, 
 Func.INSTANCE_BRIEF_F(WEBSDIC_DEF.WEBS) 
WEBSDIC_DEF_WEBS 
, WEBSDIC_DEF.InstanceID InstanceID 
, WEBSDIC_DEF.WEBSDIC_DEFID ID 
, 'WEBSDIC_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBSDIC_DEF
 join INSTANCE on WEBSDIC_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPWUUSERS as 
select   PWUUSERSID
, 
 PWUUSERS.PWUUSERSClient  
PWUUSERS_PWUUSERSClient_ID, 
 Func.INSTANCE_BRIEF_F(PWUUSERS.PWUUSERSClient) 
PWUUSERS_PWUUSERSClient 
, 
PWUUSERS.PWUUSERSEMail 
PWUUSERS_PWUUSERSEMail 
, 
PWUUSERS.PWUUSERSRegDate 
PWUUSERS_PWUUSERSRegDate 
, 
PWUUSERS.PWUUSERSLogin 
PWUUSERS_PWUUSERSLogin 
, 
PWUUSERS.PWUUSERSOrderNum 
PWUUSERS_PWUUSERSOrderNum 
, 
PWUUSERS.PWUUSERSPassword 
PWUUSERS_PWUUSERSPassword 
, 
 PWUUSERS.PWUUSERSIsBanned  
PWUUSERS_PWUUSERSIsBanned_VAL, 
 decode(PWUUSERS.PWUUSERSIsBanned 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PWUUSERS_PWUUSERSIsBanned 
, PWUUSERS.InstanceID InstanceID 
, PWUUSERS.PWUUSERSID ID 
, 'PWUUSERS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PWUUSERS
 join INSTANCE on PWUUSERS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKZ_pekz_path as 
select   pekz_pathID
, 
 pekz_def.ClientTo  
pekz_def_ClientTo_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientTo) 
pekz_def_ClientTo 
, 
 pekz_path.InfoSendType  
pekz_path_InfoSendType_ID, 
 Func.PEKD_INFOSENDTYPE_BRIEF_F(pekz_path.InfoSendType) 
pekz_path_InfoSendType 
, 
 pekz_def.Supplier  
pekz_def_Supplier_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.Supplier) 
pekz_def_Supplier 
, 
pekz_def.Code1C 
pekz_def_Code1C 
, 
pekz_path.vagNo 
pekz_path_vagNo 
, 
pekz_def.PlanedDate 
pekz_def_PlanedDate 
, 
 pekz_def.Fillial  
pekz_def_Fillial_ID, 
 Func.PEKD_DEPT_BRIEF_F(pekz_def.Fillial) 
pekz_def_Fillial 
, 
pekz_path.sequence 
pekz_path_sequence 
, 
pekz_path.SupSumm 
pekz_path_SupSumm 
, 
pekz_def.AcceptDate 
pekz_def_AcceptDate 
, 
pekz_path.RcvFIO 
pekz_path_RcvFIO 
, 
 pekz_path.TheCurrency  
pekz_path_TheCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(pekz_path.TheCurrency) 
pekz_path_TheCurrency 
, 
pekz_def.AcceptTime 
pekz_def_AcceptTime 
, 
 pekz_path.DestStation  
pekz_path_DestStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(pekz_path.DestStation) 
pekz_path_DestStation 
, 
pekz_path.TRF 
pekz_path_TRF 
, 
 pekz_def.TheDogovor  
pekz_def_TheDogovor_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.TheDogovor) 
pekz_def_TheDogovor 
, 
pekz_path.PassDate 
pekz_path_PassDate 
, 
 pekz_def.ClientFrom  
pekz_def_ClientFrom_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientFrom) 
pekz_def_ClientFrom 
, 
pekz_path.RCVInfo 
PEKZ_PATH_RCVInfo 
, 
 pekz_path.trainNo  
pekz_path_trainNo_ID, 
 Func.PEKD_TRAINS_BRIEF_F(pekz_path.trainNo) 
pekz_path_trainNo 
, 
pekz_path.SendDate 
pekz_path_SendDate 
, 
pekz_def.TheComment 
pekz_def_TheComment 
, 
pekz_path.PassFIO 
pekz_path_PassFIO 
, 
 pekz_path.ValueEDIZM  
pekz_path_ValueEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(pekz_path.ValueEDIZM) 
pekz_path_ValueEDIZM 
, 
 pekz_path.Receiver  
pekz_path_Receiver_ID, 
 Func.INSTANCE_BRIEF_F(pekz_path.Receiver) 
pekz_path_Receiver 
, 
 pekz_path.WeightEDIZM  
pekz_path_WeightEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(pekz_path.WeightEDIZM) 
pekz_path_WeightEDIZM 
, 
pekz_def.QueryDate 
pekz_def_QueryDate 
, 
pekz_path.RcvWaitDate 
pekz_path_RcvWaitDate 
, 
pekz_path.SummNDS 
pekz_path_SummNDS 
, 
pekz_path.Summ 
pekz_path_Summ 
, 
 pekz_path.PPODescription  
pekz_path_PPODescription_ID, 
 Func.PEKD_POSTTYPE_BRIEF_F(pekz_path.PPODescription) 
pekz_path_PPODescription 
, 
pekz_path.SupSummNDS 
pekz_path_SupSummNDS 
, 
 pekz_def.TRType  
pekz_def_TRType_ID, 
 Func.PEKD_TRTYPE_BRIEF_F(pekz_def.TRType) 
pekz_def_TRType 
, 
 pekz_def.PlatType  
pekz_def_PlatType_VAL, 
 decode(pekz_def.PlatType 
, 0 ,'Отправитель'
, 1 ,'Получатель'
, 2 ,'Другой'
, '???') 
pekz_def_PlatType 
, 
pekz_path.PPOWeight 
pekz_path_PPOWeight 
, 
 pekz_def.TRF  
pekz_def_TRF_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(pekz_def.TRF) 
pekz_def_TRF 
, 
pekz_path.InfoDate 
pekz_path_InfoDate 
, 
 pekz_def.IsNal  
pekz_def_IsNal_VAL, 
 decode(pekz_def.IsNal 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
pekz_def_IsNal 
, 
pekz_def.LoadTime 
pekz_def_LoadTime 
, 
pekz_path.PPONum 
pekz_path_PPONum 
, 
pekz_path.RcvDate 
pekz_path_RcvDate 
, 
pekz_def.PEKCode 
pekz_def_PEKCode 
, 
pekz_path.PPOVol 
pekz_path_PPOVol 
, 
 pekz_def.IncludeInOrder  
pekz_def_IncludeInOrder_VAL, 
 decode(pekz_def.IncludeInOrder 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
pekz_def_IncludeInOrder 
, 
 pekz_def.ClientPayed  
pekz_def_ClientPayed_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientPayed) 
pekz_def_ClientPayed 
, 
pekz_def.LoadDate 
pekz_def_LoadDate 
, 
 pekz_path.TheDirection  
pekz_path_TheDirection_ID, 
 Func.PEKD_DIRECTION_BRIEF_F(pekz_path.TheDirection) 
pekz_path_TheDirection 
, 
pekz_path.InforRcvFIO 
pekz_path_InforRcvFIO 
, 
pekz_path.SupTRF 
pekz_path_SupTRF 
, pekz_path.InstanceID InstanceID 
, pekz_path.pekz_pathID ID 
, 'pekz_path' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from pekz_path
 join INSTANCE on pekz_path.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join pekz_def ON pekz_def.InstanceID=pekz_path.InstanceID 
;
create or replace view V_AUTOpekz_path as 
select   pekz_pathID
, 
pekz_path.TRF 
pekz_path_TRF 
, 
pekz_path.SupSummNDS 
pekz_path_SupSummNDS 
, 
pekz_path.RcvWaitDate 
pekz_path_RcvWaitDate 
, 
 pekz_path.TransSupplier  
pekz_path_TransSupplier_ID, 
 Func.INSTANCE_BRIEF_F(pekz_path.TransSupplier) 
pekz_path_TransSupplier 
, 
 pekz_path.PathFilial  
pekz_path_PathFilial_ID, 
 Func.PEKD_DEPT_BRIEF_F(pekz_path.PathFilial) 
pekz_path_PathFilial 
, 
pekz_path.PPOVol 
pekz_path_PPOVol 
, 
pekz_path.SupTRF 
pekz_path_SupTRF 
, 
 pekz_path.trainNo  
pekz_path_trainNo_ID, 
 Func.PEKD_TRAINS_BRIEF_F(pekz_path.trainNo) 
pekz_path_trainNo 
, 
pekz_path.RCVInfo 
pekz_path_RCVInfo 
, 
pekz_path.InfoDate 
pekz_path_InfoDate 
, 
pekz_path.RcvDate 
pekz_path_RcvDate 
, 
pekz_path.PPONum 
pekz_path_PPONum 
, 
pekz_path.vagNo 
pekz_path_vagNo 
, 
pekz_path.SupSumm 
pekz_path_SupSumm 
, 
 pekz_path.IsTranzit  
pekz_path_IsTranzit_VAL, 
 decode(pekz_path.IsTranzit 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
pekz_path_IsTranzit 
, 
 pekz_path.InfoSendType  
pekz_path_InfoSendType_ID, 
 Func.PEKD_INFOSENDTYPE_BRIEF_F(pekz_path.InfoSendType) 
pekz_path_InfoSendType 
, 
 pekz_path.PPODescription  
pekz_path_PPODescription_ID, 
 Func.PEKD_POSTTYPE_BRIEF_F(pekz_path.PPODescription) 
pekz_path_PPODescription 
, 
 pekz_path.TheDirection  
pekz_path_TheDirection_ID, 
 Func.PEKD_DIRECTION_BRIEF_F(pekz_path.TheDirection) 
pekz_path_TheDirection 
, 
pekz_path.InforRcvFIO 
pekz_path_InforRcvFIO 
, 
 pekz_path.Receiver  
pekz_path_Receiver_ID, 
 Func.INSTANCE_BRIEF_F(pekz_path.Receiver) 
pekz_path_Receiver 
, 
pekz_path.sequence 
pekz_path_sequence 
, 
 pekz_path.ValueEDIZM  
pekz_path_ValueEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(pekz_path.ValueEDIZM) 
pekz_path_ValueEDIZM 
, 
pekz_path.SummNDS 
pekz_path_SummNDS 
, 
pekz_path.PassFIO 
pekz_path_PassFIO 
, 
pekz_path.SendDate 
pekz_path_SendDate 
, 
pekz_path.RcvFIO 
pekz_path_RcvFIO 
, 
 pekz_path.DestStation  
pekz_path_DestStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(pekz_path.DestStation) 
pekz_path_DestStation 
, 
 pekz_path.TheCurrency  
pekz_path_TheCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(pekz_path.TheCurrency) 
pekz_path_TheCurrency 
, 
 pekz_path.WeightEDIZM  
pekz_path_WeightEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(pekz_path.WeightEDIZM) 
pekz_path_WeightEDIZM 
, 
pekz_path.Summ 
pekz_path_Summ 
, 
pekz_path.PPOWeight 
pekz_path_PPOWeight 
, 
pekz_path.PassDate 
pekz_path_PassDate 
, 
pekz_path.PathPlanedDate 
pekz_path_PathPlanedDate 
, pekz_path.InstanceID InstanceID 
, pekz_path.pekz_pathID ID 
, 'pekz_path' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from pekz_path
 join INSTANCE on pekz_path.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewMessageForCLI as 
select   pekz_pathID
, 
pekz_def.QueryDate 
pekz_def_QueryDate 
, 
pekz_path.RcvWaitDate 
pekz_path_RcvWaitDate 
, 
pekz_path.PPOWeight 
pekz_path_PPOWeight 
, 
pekz_path.RcvDate 
pekz_path_RcvDate 
, 
 pekz_def.ClientPayed  
pekz_def_ClientPayed_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientPayed) 
pekz_def_ClientPayed 
, 
pekz_path.RCVInfo 
pekz_path_RCVInfo 
, 
pekz_def.VRCFinfo 
pekz_def_VRCFinfo 
, 
pekz_path.PassFIO 
pekz_path_PassFIO 
, 
pekz_path.RcvFIO 
pekz_path_RcvFIO 
, 
pekz_def.SummDopNDS 
pekz_def_SummDopNDS 
, 
 pekz_path.TheDirection  
pekz_path_TheDirection_ID, 
 Func.PEKD_DIRECTION_BRIEF_F(pekz_path.TheDirection) 
pekz_path_TheDirection 
, 
 pekz_def.ClientTo  
pekz_def_ClientTo_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientTo) 
pekz_def_ClientTo 
, 
pekz_def.AcceptDate 
pekz_def_AcceptDate 
, 
pekz_def.RcvInfo 
pekz_def_RcvInfo 
, 
 pekz_path.TransSupplier  
pekz_path_TransSupplier_ID, 
 Func.INSTANCE_BRIEF_F(pekz_path.TransSupplier) 
pekz_path_TransSupplier 
, 
 pekz_path.Receiver  
pekz_path_Receiver_ID, 
 Func.INSTANCE_BRIEF_F(pekz_path.Receiver) 
pekz_path_Receiver 
, 
 pekz_path.PPODescription  
pekz_path_PPODescription_ID, 
 Func.PEKD_POSTTYPE_BRIEF_F(pekz_path.PPODescription) 
pekz_path_PPODescription 
, 
pekz_path.PassDate 
pekz_path_PassDate 
, 
pekz_def.LoadDate 
pekz_def_LoadDate 
, 
pekz_path.PathPlanedDate 
pekz_path_PathPlanedDate 
, 
 pekz_path.PathFilial  
pekz_path_PathFilial_ID, 
 Func.PEKD_DEPT_BRIEF_F(pekz_path.PathFilial) 
pekz_path_PathFilial 
, 
pekz_path.PPOVol 
pekz_path_PPOVol 
, 
 pekz_path.WeightEDIZM  
pekz_path_WeightEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(pekz_path.WeightEDIZM) 
pekz_path_WeightEDIZM 
, 
 pekz_def.TheDogovor  
pekz_def_TheDogovor_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.TheDogovor) 
pekz_def_TheDogovor 
, 
 pekz_def.ClientFrom  
pekz_def_ClientFrom_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientFrom) 
pekz_def_ClientFrom 
, 
 pekz_def.Fillial  
pekz_def_Fillial_ID, 
 Func.PEKD_DEPT_BRIEF_F(pekz_def.Fillial) 
pekz_def_Fillial 
, 
pekz_def.PEKCode 
pekz_def_PEKCode 
, 
pekz_path.InfoDate 
pekz_path_InfoDate 
, 
 pekz_path.DestStation  
pekz_path_DestStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(pekz_path.DestStation) 
pekz_path_DestStation 
, 
 pekz_path.trainNo  
pekz_path_trainNo_ID, 
 Func.PEKD_TRAINS_BRIEF_F(pekz_path.trainNo) 
pekz_path_trainNo 
, 
pekz_def.AcceptTime 
pekz_def_AcceptTime 
, 
 pekz_path.InfoSendType  
pekz_path_InfoSendType_ID, 
 Func.PEKD_INFOSENDTYPE_BRIEF_F(pekz_path.InfoSendType) 
pekz_path_InfoSendType 
, 
 pekz_path.ValueEDIZM  
pekz_path_ValueEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(pekz_path.ValueEDIZM) 
pekz_path_ValueEDIZM 
, 
pekz_def.TheComment 
pekz_def_TheComment 
, 
pekz_path.SendDate 
pekz_path_SendDate 
, 
pekz_path.InforRcvFIO 
pekz_path_InforRcvFIO 
, 
pekz_path.SummNDS 
pekz_path_SummNDS 
, 
pekz_def.LoadTime 
pekz_def_LoadTime 
, 
pekz_path.vagNo 
pekz_path_vagNo 
, pekz_path.InstanceID InstanceID 
, pekz_path.pekz_pathID ID 
, 'pekz_path' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from pekz_path
 join INSTANCE on pekz_path.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join pekz_def ON pekz_def.InstanceID=pekz_path.InstanceID 
;
create or replace view V_AUTOPEKZ_WLIST as 
select   PEKZ_WLISTID,pekz_pathID
, 
PEKZ_WLIST.ItemDescription 
PEKZ_WLIST_ItemDescription 
, 
 PEKZ_WLIST.IsProchee  
PEKZ_WLIST_IsProchee_VAL, 
 decode(PEKZ_WLIST.IsProchee 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKZ_WLIST_IsProchee 
, 
PEKZ_WLIST.NettoWeight 
PEKZ_WLIST_NettoWeight 
, 
PEKZ_WLIST.theWeight 
PEKZ_WLIST_theWeight 
, 
PEKZ_WLIST.shCode 
PEKZ_WLIST_shCode 
, 
 PEKZ_WLIST.TheCountry  
PEKZ_WLIST_TheCountry_ID, 
 Func.ENTDIC_COUNTRY_BRIEF_F(PEKZ_WLIST.TheCountry) 
PEKZ_WLIST_TheCountry 
, 
PEKZ_WLIST.QDocs 
PEKZ_WLIST_QDocs 
, 
 PEKZ_WLIST.TheCurrency  
PEKZ_WLIST_TheCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(PEKZ_WLIST.TheCurrency) 
PEKZ_WLIST_TheCurrency 
, 
 PEKZ_WLIST.IsDocument  
PEKZ_WLIST_IsDocument_VAL, 
 decode(PEKZ_WLIST.IsDocument 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKZ_WLIST_IsDocument 
, 
PEKZ_WLIST.VozmCost 
PEKZ_WLIST_VozmCost 
, 
PEKZ_WLIST.OrderNum 
PEKZ_WLIST_OrderNum 
, 
PEKZ_WLIST.sequence 
PEKZ_WLIST_sequence 
, 
 PEKZ_WLIST.IsObrazec  
PEKZ_WLIST_IsObrazec_VAL, 
 decode(PEKZ_WLIST.IsObrazec 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKZ_WLIST_IsObrazec 
, 
PEKZ_WLIST.QSertif 
PEKZ_WLIST_QSertif 
, 
PEKZ_WLIST.QLicense 
PEKZ_WLIST_QLicense 
, 
PEKZ_WLIST.ItemPrice 
PEKZ_WLIST_ItemPrice 
, 
 PEKZ_WLIST.IsPodarok  
PEKZ_WLIST_IsPodarok_VAL, 
 decode(PEKZ_WLIST.IsPodarok 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKZ_WLIST_IsPodarok 
, 
 PEKZ_WLIST.IsVozvrat  
PEKZ_WLIST_IsVozvrat_VAL, 
 decode(PEKZ_WLIST.IsVozvrat 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKZ_WLIST_IsVozvrat 
, 
PEKZ_WLIST.TNBED 
PEKZ_WLIST_TNBED 
, pekz_path.InstanceID InstanceID 
, PEKZ_WLIST.PEKZ_WLISTID ID 
, 'PEKZ_WLIST' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKZ_WLIST
 join pekz_path on pekz_path.pekz_pathID=PEKZ_WLIST.ParentStructRowID 
 join INSTANCE on pekz_path.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKZ_WLADDS as 
select   PEKZ_WLADDSID,PEKZ_WLISTID,pekz_pathID
, 
 PEKZ_WLADDS.TheAdds  
PEKZ_WLADDS_TheAdds_ID, 
 Func.PEKD_ADDS_BRIEF_F(PEKZ_WLADDS.TheAdds) 
PEKZ_WLADDS_TheAdds 
, pekz_path.InstanceID InstanceID 
, PEKZ_WLADDS.PEKZ_WLADDSID ID 
, 'PEKZ_WLADDS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKZ_WLADDS
 join PEKZ_WLIST on PEKZ_WLIST.PEKZ_WLISTID=PEKZ_WLADDS.ParentStructRowID 
 join pekz_path on pekz_path.pekz_pathID=PEKZ_WLIST.ParentStructRowID 
 join INSTANCE on pekz_path.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKZ_DOCS as 
select   PEKZ_DOCSID
, 
 PEKZ_DOCS.TheDoc  
PEKZ_DOCS_TheDoc_ID, 
 Func.INSTANCE_BRIEF_F(PEKZ_DOCS.TheDoc) 
PEKZ_DOCS_TheDoc 
, PEKZ_DOCS.InstanceID InstanceID 
, PEKZ_DOCS.PEKZ_DOCSID ID 
, 'PEKZ_DOCS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKZ_DOCS
 join INSTANCE on PEKZ_DOCS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOpekz_def as 
select   pekz_defID
, 
 pekz_def.PlatType  
pekz_def_PlatType_VAL, 
 decode(pekz_def.PlatType 
, 0 ,'Отправитель'
, 1 ,'Получатель'
, 2 ,'Другой'
, '???') 
pekz_def_PlatType 
, 
pekz_def.AcceptDate 
pekz_def_AcceptDate 
, 
pekz_def.SummDop 
pekz_def_SummDop 
, 
pekz_def.TheComment 
pekz_def_TheComment 
, 
 pekz_def.Fillial  
pekz_def_Fillial_ID, 
 Func.PEKD_DEPT_BRIEF_F(pekz_def.Fillial) 
pekz_def_Fillial 
, 
 pekz_def.TRType  
pekz_def_TRType_ID, 
 Func.PEKD_TRTYPE_BRIEF_F(pekz_def.TRType) 
pekz_def_TRType 
, 
 pekz_def.ClientPayed  
pekz_def_ClientPayed_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientPayed) 
pekz_def_ClientPayed 
, 
 pekz_def.TRF  
pekz_def_TRF_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(pekz_def.TRF) 
pekz_def_TRF 
, 
pekz_def.Summ 
pekz_def_Summ 
, 
pekz_def.SummDopNDS 
pekz_def_SummDopNDS 
, 
 pekz_def.IsPayed  
pekz_def_IsPayed_VAL, 
 decode(pekz_def.IsPayed 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
pekz_def_IsPayed 
, 
pekz_def.RcvInfo 
pekz_def_RcvInfo 
, 
 pekz_def.theActWork  
pekz_def_theActWork_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.theActWork) 
pekz_def_theActWork 
, 
 pekz_def.IncludeInAct  
pekz_def_IncludeInAct_VAL, 
 decode(pekz_def.IncludeInAct 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
pekz_def_IncludeInAct 
, 
pekz_def.SummNDS 
pekz_def_SummNDS 
, 
pekz_def.LoadDate 
pekz_def_LoadDate 
, 
pekz_def.AcceptTime 
pekz_def_AcceptTime 
, 
 pekz_def.PayDept  
pekz_def_PayDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(pekz_def.PayDept) 
pekz_def_PayDept 
, 
pekz_def.VRCFinfo 
pekz_def_VRCFinfo 
, 
 pekz_def.ClientTo  
pekz_def_ClientTo_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientTo) 
pekz_def_ClientTo 
, 
pekz_def.PEKCode 
pekz_def_PEKCode 
, 
 pekz_def.TheDogovor  
pekz_def_TheDogovor_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.TheDogovor) 
pekz_def_TheDogovor 
, 
 pekz_def.ClientFrom  
pekz_def_ClientFrom_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientFrom) 
pekz_def_ClientFrom 
, 
 pekz_def.IsNal  
pekz_def_IsNal_VAL, 
 decode(pekz_def.IsNal 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
pekz_def_IsNal 
, 
 pekz_def.Supplier  
pekz_def_Supplier_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.Supplier) 
pekz_def_Supplier 
, 
pekz_def.Code1C 
pekz_def_Code1C 
, 
pekz_def.QueryDate 
pekz_def_QueryDate 
, 
 pekz_def.IncludeInOrder  
pekz_def_IncludeInOrder_VAL, 
 decode(pekz_def.IncludeInOrder 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
pekz_def_IncludeInOrder 
, 
pekz_def.LoadTime 
pekz_def_LoadTime 
, 
pekz_def.PlanedDate 
pekz_def_PlanedDate 
, pekz_def.InstanceID InstanceID 
, pekz_def.pekz_defID ID 
, 'pekz_def' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from pekz_def
 join INSTANCE on pekz_def.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKZ_pekz_def as 
select   pekz_defID
, 
 pekz_def.Supplier  
pekz_def_Supplier_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.Supplier) 
pekz_def_Supplier 
, 
 pekz_def.TRType  
pekz_def_TRType_ID, 
 Func.PEKD_TRTYPE_BRIEF_F(pekz_def.TRType) 
pekz_def_TRType 
, 
 pekz_def.IncludeInAct  
pekz_def_IncludeInAct_VAL, 
 decode(pekz_def.IncludeInAct 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
pekz_def_IncludeInAct 
, 
pekz_def.SummDop 
pekz_def_SummDop 
, 
 pekz_def.IncludeInOrder  
pekz_def_IncludeInOrder_VAL, 
 decode(pekz_def.IncludeInOrder 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
pekz_def_IncludeInOrder 
, 
pekz_def.RcvInfo 
pekz_def_RCVInfo 
, 
 pekz_def.IsNal  
pekz_def_IsNal_VAL, 
 decode(pekz_def.IsNal 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
pekz_def_IsNal 
, 
 pekz_def.Fillial  
pekz_def_filial_ID, 
 Func.PEKD_DEPT_BRIEF_F(pekz_def.Fillial) 
pekz_def_filial 
, 
pekz_def.LoadTime 
pekz_def_LoadTime 
, 
pekz_def.SummDopNDS 
pekz_def_SummDopNDS 
, 
pekz_def.PEKCode 
pekz_def_PEKCode 
, 
pekz_def.SummNDS 
pekz_def_SummNDS 
, 
 pekz_def.PayDept  
pekz_def_paydept_ID, 
 Func.PEKD_DEPT_BRIEF_F(pekz_def.PayDept) 
pekz_def_paydept 
, 
pekz_def.AcceptDate 
pekz_def_AcceptDate 
, 
pekz_def.LoadDate 
pekz_def_LoadDate 
, 
pekz_def.PlanedDate 
pekz_def_PlanedDate 
, 
 pekz_def.TRF  
pekz_def_TRF_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(pekz_def.TRF) 
pekz_def_TRF 
, 
pekz_def.AcceptTime 
pekz_def_AcceptTime 
, 
pekz_def.Summ 
pekz_def_Summ 
, 
 pekz_def.ClientFrom  
pekz_def_ClientFrom_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientFrom) 
pekz_def_ClientFrom 
, 
 pekz_def.ClientTo  
pekz_def_ClientTo_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientTo) 
pekz_def_ClientTo 
, 
pekz_def.TheComment 
pekz_def_TheComment 
, 
 pekz_def.ClientPayed  
pekz_def_ClientPayed_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.ClientPayed) 
pekz_def_ClientPayed 
, 
 pekz_def.TheDogovor  
pekz_def_TheDogovor_ID, 
 Func.INSTANCE_BRIEF_F(pekz_def.TheDogovor) 
pekz_def_TheDogovor 
, 
pekz_def.QueryDate 
pekz_def_QueryDate 
, pekz_def.InstanceID InstanceID 
, pekz_def.pekz_defID ID 
, 'pekz_def' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from pekz_def
 join INSTANCE on pekz_def.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKZ_ACLCT as 
select   PEKZ_ACLCTID
, 
PEKZ_ACLCT.TheDuration 
PEKZ_ACLCT_TheDuration 
, 
 PEKZ_ACLCT.AutoSuplier  
PEKZ_ACLCT_AutoSuplier_ID, 
 Func.INSTANCE_BRIEF_F(PEKZ_ACLCT.AutoSuplier) 
PEKZ_ACLCT_AutoSuplier 
, 
PEKZ_ACLCT.SupSumm 
PEKZ_ACLCT_SupSumm 
, 
PEKZ_ACLCT.CollectTimeTo 
PEKZ_ACLCT_CollectTimeTo 
, 
PEKZ_ACLCT.SupSummNDS 
PEKZ_ACLCT_SupSummNDS 
, 
PEKZ_ACLCT.CollectTimeFrom 
PEKZ_ACLCT_CollectTimeFrom 
, 
 PEKZ_ACLCT.AutoType  
PEKZ_ACLCT_AutoType_ID, 
 Func.PEKD_AUTO_BRIEF_F(PEKZ_ACLCT.AutoType) 
PEKZ_ACLCT_AutoType 
, 
PEKZ_ACLCT.Summ 
PEKZ_ACLCT_Summ 
, 
PEKZ_ACLCT.SummNDS 
PEKZ_ACLCT_SummNDS 
, 
PEKZ_ACLCT.Info 
PEKZ_ACLCT_Info 
, 
PEKZ_ACLCT.TheComment 
PEKZ_ACLCT_TheComment 
, 
PEKZ_ACLCT.TheLength 
PEKZ_ACLCT_TheLength 
, 
PEKZ_ACLCT.Phone 
PEKZ_ACLCT_Phone 
, 
PEKZ_ACLCT.CollectDate 
PEKZ_ACLCT_CollectDate 
, 
 PEKZ_ACLCT.TheFilial  
PEKZ_ACLCT_TheFilial_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKZ_ACLCT.TheFilial) 
PEKZ_ACLCT_TheFilial 
, 
PEKZ_ACLCT.TheAddress 
PEKZ_ACLCT_TheAddress 
, 
PEKZ_ACLCT.ThePerson 
PEKZ_ACLCT_ThePerson 
, PEKZ_ACLCT.InstanceID InstanceID 
, PEKZ_ACLCT.PEKZ_ACLCTID ID 
, 'PEKZ_ACLCT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKZ_ACLCT
 join INSTANCE on PEKZ_ACLCT.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKZ_ADLVR as 
select   PEKZ_ADLVRID
, 
PEKZ_ADLVR.SupSumm 
PEKZ_ADLVR_SupSumm 
, 
PEKZ_ADLVR.ThePerson 
PEKZ_ADLVR_ThePerson 
, 
 PEKZ_ADLVR.AutoType  
PEKZ_ADLVR_AutoType_ID, 
 Func.PEKD_AUTO_BRIEF_F(PEKZ_ADLVR.AutoType) 
PEKZ_ADLVR_AutoType 
, 
PEKZ_ADLVR.CollectTimeFrom 
PEKZ_ADLVR_CollectTimeFrom 
, 
PEKZ_ADLVR.Summ 
PEKZ_ADLVR_Summ 
, 
PEKZ_ADLVR.Info 
PEKZ_ADLVR_Info 
, 
 PEKZ_ADLVR.TheFilial  
PEKZ_ADLVR_TheFilial_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKZ_ADLVR.TheFilial) 
PEKZ_ADLVR_TheFilial 
, 
PEKZ_ADLVR.CollectDate 
PEKZ_ADLVR_CollectDate 
, 
PEKZ_ADLVR.SupSummNDS 
PEKZ_ADLVR_SupSummNDS 
, 
 PEKZ_ADLVR.AutoSuplier  
PEKZ_ADLVR_AutoSuplier_ID, 
 Func.INSTANCE_BRIEF_F(PEKZ_ADLVR.AutoSuplier) 
PEKZ_ADLVR_AutoSuplier 
, 
PEKZ_ADLVR.TheAddress 
PEKZ_ADLVR_TheAddress 
, 
PEKZ_ADLVR.SummNDS 
PEKZ_ADLVR_SummNDS 
, 
PEKZ_ADLVR.TheLength 
PEKZ_ADLVR_TheLength 
, 
PEKZ_ADLVR.Phone 
PEKZ_ADLVR_Phone 
, 
PEKZ_ADLVR.TheDuration 
PEKZ_ADLVR_TheDuration 
, 
PEKZ_ADLVR.CollectTimeTo 
PEKZ_ADLVR_CollectTimeTo 
, 
PEKZ_ADLVR.TheComment 
PEKZ_ADLVR_TheComment 
, PEKZ_ADLVR.InstanceID InstanceID 
, PEKZ_ADLVR.PEKZ_ADLVRID ID 
, 'PEKZ_ADLVR' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKZ_ADLVR
 join INSTANCE on PEKZ_ADLVR.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOpekz_dop as 
select   pekz_dopID
, 
pekz_dop.sequence 
pekz_dop_sequence 
, 
pekz_dop.TRF 
pekz_dop_TRF 
, 
pekz_dop.Quantity 
pekz_dop_Quantity 
, 
 pekz_dop.PathFilial  
pekz_dop_PathFilial_ID, 
 Func.PEKD_DEPT_BRIEF_F(pekz_dop.PathFilial) 
pekz_dop_PathFilial 
, 
pekz_dop.SupTRF 
pekz_dop_SupTRF 
, 
pekz_dop.TheComment 
pekz_dop_TheComment 
, 
pekz_dop.Summ 
pekz_dop_Summ 
, 
 pekz_dop.DopSupplier  
pekz_dop_DopSupplier_ID, 
 Func.INSTANCE_BRIEF_F(pekz_dop.DopSupplier) 
pekz_dop_DopSupplier 
, 
 pekz_dop.EDIZM  
pekz_dop_EDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(pekz_dop.EDIZM) 
pekz_dop_EDIZM 
, 
pekz_dop.SummNDS 
pekz_dop_SummNDS 
, 
pekz_dop.SupSummNDS 
pekz_dop_SupSummNDS 
, 
 pekz_dop.TheCurrency  
pekz_dop_TheCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(pekz_dop.TheCurrency) 
pekz_dop_TheCurrency 
, 
pekz_dop.SupSumm 
pekz_dop_SupSumm 
, 
 pekz_dop.SRV  
pekz_dop_SRV_ID, 
 Func.PEKD_SRV_BRIEF_F(pekz_dop.SRV) 
pekz_dop_SRV 
, pekz_dop.InstanceID InstanceID 
, pekz_dop.pekz_dopID ID 
, 'pekz_dop' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from pekz_dop
 join INSTANCE on pekz_dop.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOREPD_LOCKED as 
select   REPD_LOCKEDID
, 
REPD_LOCKED.LastTry 
REPD_LOCKED_LastTry 
, 
REPD_LOCKED.SourceFile 
REPD_LOCKED_SourceFile 
, 
REPD_LOCKED.FirstTry 
REPD_LOCKED_FirstTry 
, 
REPD_LOCKED.ObjectType 
REPD_LOCKED_ObjectType 
, 
REPD_LOCKED.PartCount 
REPD_LOCKED_PartCount 
, 
REPD_LOCKED.StructType 
REPD_LOCKED_StructType 
, 
REPD_LOCKED.ReplicaPackID 
REPD_LOCKED_ReplicaPackID 
, 
REPD_LOCKED.The_InstanceID 
REPD_LOCKED_The_InstanceID 
, 
REPD_LOCKED.The_RowID 
REPD_LOCKED_The_RowID 
, 
REPD_LOCKED.PartNumber 
REPD_LOCKED_PartNumber 
, 
REPD_LOCKED.ReplicaRowID 
REPD_LOCKED_ReplicaRowID 
, REPD_LOCKED.InstanceID InstanceID 
, REPD_LOCKED.REPD_LOCKEDID ID 
, 'REPD_LOCKED' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_LOCKED
 join INSTANCE on REPD_LOCKED.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOREPD_RequestQuery as 
select   REPD_RequestQueryID
, 
 REPD_RequestQuery.DestSrv  
REPD_RequestQuery_DestSrv_ID, 
 Func.REPD_SRV_BRIEF_F(REPD_RequestQuery.DestSrv) 
REPD_RequestQuery_DestSrv 
, 
 REPD_RequestQuery.Provider  
REPD_RequestQuery_Provider_ID, 
 Func.REPD_PROV_BRIEF_F(REPD_RequestQuery.Provider) 
REPD_RequestQuery_Provider 
, 
REPD_RequestQuery.ReqTypeName 
REPD_RequestQuery_ReqTypeName 
, 
 REPD_RequestQuery.SourceSrv  
REPD_RequestQuery_SourceSrv_ID, 
 Func.REPD_SRV_BRIEF_F(REPD_RequestQuery.SourceSrv) 
REPD_RequestQuery_SourceSrv 
, 
REPD_RequestQuery.ObjectID 
REPD_RequestQuery_ObjectID 
, 
REPD_RequestQuery.TheRowID 
REPD_RequestQuery_TheRowID 
, 
REPD_RequestQuery.ReqPartName 
REPD_RequestQuery_ReqPartName 
, 
 REPD_RequestQuery.SendRecord  
REPD_RequestQuery_SendRecord_ID, 
 Func.REPD_SendQ_BRIEF_F(REPD_RequestQuery.SendRecord) 
REPD_RequestQuery_SendRecord 
, REPD_RequestQuery.InstanceID InstanceID 
, REPD_RequestQuery.REPD_RequestQueryID ID 
, 'REPD_RequestQuery' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_RequestQuery
 join INSTANCE on REPD_RequestQuery.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOREPD_ResQueryRcv as 
select   REPD_ResQueryRcvID,REPD_RequestQueryID
, 
 REPD_ResQueryRcv.ReceiveRec  
REPD_ResQueryRcv_ReceiveRec_ID, 
 Func.REPD_RecvQ_BRIEF_F(REPD_ResQueryRcv.ReceiveRec) 
REPD_ResQueryRcv_ReceiveRec 
, REPD_RequestQuery.InstanceID InstanceID 
, REPD_ResQueryRcv.REPD_ResQueryRcvID ID 
, 'REPD_ResQueryRcv' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_ResQueryRcv
 join REPD_RequestQuery on REPD_RequestQuery.REPD_RequestQueryID=REPD_ResQueryRcv.ParentStructRowID 
 join INSTANCE on REPD_RequestQuery.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOREPD_PROV as 
select   REPD_PROVID
, 
REPD_PROV.Name 
REPD_PROV_Name 
, 
REPD_PROV.AssemblyName 
REPD_PROV_AssemblyName 
, 
REPD_PROV.ClassName 
REPD_PROV_ClassName 
, REPD_PROV.InstanceID InstanceID 
, REPD_PROV.REPD_PROVID ID 
, 'REPD_PROV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_PROV
 join INSTANCE on REPD_PROV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOREPD_SRV as 
select   REPD_SRVID
, 
 REPD_SRV.Obj1  
REPD_SRV_Obj1_ID, 
 Func.INSTANCE_BRIEF_F(REPD_SRV.Obj1) 
REPD_SRV_Obj1 
, 
 REPD_SRV.Obj2  
REPD_SRV_Obj2_ID, 
 Func.INSTANCE_BRIEF_F(REPD_SRV.Obj2) 
REPD_SRV_Obj2 
, 
 REPD_SRV.Obj3  
REPD_SRV_Obj3_ID, 
 Func.INSTANCE_BRIEF_F(REPD_SRV.Obj3) 
REPD_SRV_Obj3 
, 
REPD_SRV.name 
REPD_SRV_name 
, REPD_SRV.InstanceID InstanceID 
, REPD_SRV.REPD_SRVID ID 
, 'REPD_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_SRV
 join INSTANCE on REPD_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOREPD_SNDTO as 
select   REPD_SNDTOID,REPD_SRVID
, 
REPD_SNDTO.LastReceive 
REPD_SNDTO_LastReceive 
, 
 REPD_SNDTO.Provider  
REPD_SNDTO_Provider_ID, 
 Func.REPD_PROV_BRIEF_F(REPD_SNDTO.Provider) 
REPD_SNDTO_Provider 
, 
REPD_SNDTO.Config 
REPD_SNDTO_Config 
, 
REPD_SNDTO.LastScan 
REPD_SNDTO_LastScan 
, 
REPD_SNDTO.The_Interval 
REPD_SNDTO_The_Interval 
, 
REPD_SNDTO.Work_Start 
REPD_SNDTO_Work_Start 
, 
REPD_SNDTO.Work_End 
REPD_SNDTO_Work_End 
, 
 REPD_SNDTO.DestSrv  
REPD_SNDTO_DestSrv_ID, 
 Func.REPD_SRV_BRIEF_F(REPD_SNDTO.DestSrv) 
REPD_SNDTO_DestSrv 
, REPD_SRV.InstanceID InstanceID 
, REPD_SNDTO.REPD_SNDTOID ID 
, 'REPD_SNDTO' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_SNDTO
 join REPD_SRV on REPD_SRV.REPD_SRVID=REPD_SNDTO.ParentStructRowID 
 join INSTANCE on REPD_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOREPD_CONST as 
select   REPD_CONSTID,REPD_SNDTOID,REPD_SRVID
, 
REPD_CONST.TheValue 
REPD_CONST_TheValue 
, 
REPD_CONST.Name 
REPD_CONST_Name 
, REPD_SRV.InstanceID InstanceID 
, REPD_CONST.REPD_CONSTID ID 
, 'REPD_CONST' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_CONST
 join REPD_SNDTO on REPD_SNDTO.REPD_SNDTOID=REPD_CONST.ParentStructRowID 
 join REPD_SRV on REPD_SRV.REPD_SRVID=REPD_SNDTO.ParentStructRowID 
 join INSTANCE on REPD_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOREPD_REPTYPE as 
select   REPD_REPTYPEID,REPD_SNDTOID,REPD_SRVID
, 
 REPD_REPTYPE.ReplicaType  
REPD_REPTYPE_ReplicaType_VAL, 
 decode(REPD_REPTYPE.ReplicaType 
, 0 ,'Весь документ'
, 2 ,'Локальный'
, 1 ,'Построчно'
, '???') 
REPD_REPTYPE_ReplicaType 
, 
 REPD_REPTYPE.TheObjectType  
REPD_REPTYPE_TheObjectType_ID, 
 Func.OBJECTTYPE_BRIEF_F(REPD_REPTYPE.TheObjectType) 
REPD_REPTYPE_TheObjectType 
, 
 REPD_REPTYPE.UseFilter  
REPD_REPTYPE_UseFilter_VAL, 
 decode(REPD_REPTYPE.UseFilter 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
REPD_REPTYPE_UseFilter 
, 
REPD_REPTYPE.RepConditonQRY 
REPD_REPTYPE_RepConditonQRY 
, REPD_SRV.InstanceID InstanceID 
, REPD_REPTYPE.REPD_REPTYPEID ID 
, 'REPD_REPTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_REPTYPE
 join REPD_SNDTO on REPD_SNDTO.REPD_SNDTOID=REPD_REPTYPE.ParentStructRowID 
 join REPD_SRV on REPD_SRV.REPD_SRVID=REPD_SNDTO.ParentStructRowID 
 join INSTANCE on REPD_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOREPD_SendQ as 
select   REPD_SendQID
, 
REPD_SendQ.PartNumber 
REPD_SendQ_PartNumber 
, 
REPD_SendQ.FileName 
REPD_SendQ_FileName 
, 
REPD_SendQ.ReplicatorPointer 
REPD_SendQ_ReplicatorPointer 
, 
REPD_SendQ.SentDate 
REPD_SendQ_SentDate 
, 
REPD_SendQ.SendSize 
REPD_SendQ_SendSize 
, 
REPD_SendQ.ReplicaPackID 
REPD_SendQ_ReplicaPackID 
, 
 REPD_SendQ.DestSrv  
REPD_SendQ_DestSrv_ID, 
 Func.REPD_SRV_BRIEF_F(REPD_SendQ.DestSrv) 
REPD_SendQ_DestSrv 
, 
 REPD_SendQ.Acknowelge  
REPD_SendQ_Acknowelge_VAL, 
 decode(REPD_SendQ.Acknowelge 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
REPD_SendQ_Acknowelge 
, 
REPD_SendQ.CheckDate 
REPD_SendQ_CheckDate 
, 
 REPD_SendQ.Sent  
REPD_SendQ_Sent_VAL, 
 decode(REPD_SendQ.Sent 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
REPD_SendQ_Sent 
, 
REPD_SendQ.Config 
REPD_SendQ_Config 
, 
 REPD_SendQ.Provider  
REPD_SendQ_Provider_ID, 
 Func.REPD_PROV_BRIEF_F(REPD_SendQ.Provider) 
REPD_SendQ_Provider 
, 
REPD_SendQ.PartCount 
REPD_SendQ_PartCount 
, 
 REPD_SendQ.SourceSrv  
REPD_SendQ_SourceSrv_ID, 
 Func.REPD_SRV_BRIEF_F(REPD_SendQ.SourceSrv) 
REPD_SendQ_SourceSrv 
, REPD_SendQ.InstanceID InstanceID 
, REPD_SendQ.REPD_SendQID ID 
, 'REPD_SendQ' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_SendQ
 join INSTANCE on REPD_SendQ.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOREPD_RecvQ as 
select   REPD_RecvQID
, 
REPD_RecvQ.PartCount 
REPD_RecvQ_PartCount 
, 
REPD_RecvQ.ReplicaPackID 
REPD_RecvQ_ReplicaPackID 
, 
REPD_RecvQ.TheRowID 
REPD_RecvQ_TheRowID 
, 
 REPD_RecvQ.Acknowelge  
REPD_RecvQ_Acknowelge_VAL, 
 decode(REPD_RecvQ.Acknowelge 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
REPD_RecvQ_Acknowelge 
, 
REPD_RecvQ.FileName 
REPD_RecvQ_FileName 
, 
 REPD_RecvQ.Completed  
REPD_RecvQ_Completed_VAL, 
 decode(REPD_RecvQ.Completed 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
REPD_RecvQ_Completed 
, 
REPD_RecvQ.PartNumber 
REPD_RecvQ_PartNumber 
, 
REPD_RecvQ.RecvSize 
REPD_RecvQ_RecvSize 
, 
 REPD_RecvQ.SourceSrv  
REPD_RecvQ_SourceSrv_ID, 
 Func.REPD_SRV_BRIEF_F(REPD_RecvQ.SourceSrv) 
REPD_RecvQ_SourceSrv 
, 
 REPD_RecvQ.Provider  
REPD_RecvQ_Provider_ID, 
 Func.REPD_PROV_BRIEF_F(REPD_RecvQ.Provider) 
REPD_RecvQ_Provider 
, 
 REPD_RecvQ.DestSrv  
REPD_RecvQ_DestSrv_ID, 
 Func.REPD_SRV_BRIEF_F(REPD_RecvQ.DestSrv) 
REPD_RecvQ_DestSrv 
, 
REPD_RecvQ.Received 
REPD_RecvQ_Received 
, REPD_RecvQ.InstanceID InstanceID 
, REPD_RecvQ.REPD_RecvQID ID 
, 'REPD_RecvQ' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_RecvQ
 join INSTANCE on REPD_RecvQ.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOStateAction as 
select   StateActionID
, 
 StateAction.OnDocStatus  
StateAction_OnDocStatus_ID, 
 Func.OBJSTATUS_BRIEF_F(StateAction.OnDocStatus) 
StateAction_OnDocStatus 
, 
 StateAction.NewSecurityStyle  
StateAction_NewSecurityStyle_ID, 
 Func.INSTANCE_BRIEF_F(StateAction.NewSecurityStyle) 
StateAction_NewSecurityStyle 
, 
StateAction.ActionScript 
StateAction_ActionScript 
, 
StateAction.ActionClass 
StateAction_ActionClass 
, 
StateAction.LibraryFile 
StateAction_LibraryFile 
, 
 StateAction.ClearSecurity  
StateAction_ClearSecurity_VAL, 
 decode(StateAction.ClearSecurity 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
StateAction_ClearSecurity 
, StateAction.InstanceID InstanceID 
, StateAction.StateActionID ID 
, 'StateAction' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from StateAction
 join INSTANCE on StateAction.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOTheDiffPath as 
select   TheDiffPathID
, 
 TheDiffPath.Transporter  
TheDiffPath_Transporter_ID, 
 Func.INSTANCE_BRIEF_F(TheDiffPath.Transporter) 
TheDiffPath_Transporter 
, 
 TheDiffPath.TempDirStation  
TheDiffPath_TempDirStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(TheDiffPath.TempDirStation) 
TheDiffPath_TempDirStation 
, 
 TheDiffPath.Direction  
TheDiffPath_Direction_ID, 
 Func.PEKD_DIRECTION_BRIEF_F(TheDiffPath.Direction) 
TheDiffPath_Direction 
, 
 TheDiffPath.Transport  
TheDiffPath_Transport_ID, 
 Func.ENTDIC_TransportType_BRIEF_F(TheDiffPath.Transport) 
TheDiffPath_Transport 
, 
TheDiffPath.TheNumber 
TheDiffPath_TheNumber 
, 
 TheDiffPath.TempTownFrom  
TheDiffPath_TempTownFrom_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(TheDiffPath.TempTownFrom) 
TheDiffPath_TempTownFrom 
, TheDiffPath.InstanceID InstanceID 
, TheDiffPath.TheDiffPathID ID 
, 'TheDiffPath' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from TheDiffPath
 join INSTANCE on TheDiffPath.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewDifficultPath_TheDiffPath as 
select   TheDiffPathID
, 
TheDefenitionDiffP.TheComment 
TheDefenitionDiffP_TheComment 
, 
 TheDiffPath.TempDirStation  
TheDiffPath_TempDirStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(TheDiffPath.TempDirStation) 
TheDiffPath_TempDirStation 
, 
 TheDefenitionDiffP.DirStation  
TheDefenitionDiffP_DirStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(TheDefenitionDiffP.DirStation) 
TheDefenitionDiffP_DirStation 
, 
 TheDiffPath.TempTownFrom  
TheDiffPath_TempTownFrom_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(TheDiffPath.TempTownFrom) 
TheDiffPath_TempTownFrom 
, 
TheDefenitionDiffP.TheNumeric 
TheDefenitionDiffP_TheNumeric 
, 
 TheDiffPath.Transport  
TheDiffPath_Transport_ID, 
 Func.ENTDIC_TransportType_BRIEF_F(TheDiffPath.Transport) 
TheDiffPath_Transport 
, 
TheDiffPath.TheNumber 
TheDiffPath_TheNumber 
, 
 TheDiffPath.Direction  
TheDiffPath_Direction_ID, 
 Func.PEKD_DIRECTION_BRIEF_F(TheDiffPath.Direction) 
TheDiffPath_Direction 
, 
 TheDefenitionDiffP.TownFrom  
TheDefenitionDiffP_TownFrom_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(TheDefenitionDiffP.TownFrom) 
TheDefenitionDiffP_TownFrom 
, 
 TheDiffPath.Transporter  
TheDiffPath_Transporter_ID, 
 Func.INSTANCE_BRIEF_F(TheDiffPath.Transporter) 
TheDiffPath_Transporter 
, 
TheDefenitionDiffP.CountParticles 
TheDefenitionDiffP_CountParticles 
, TheDiffPath.InstanceID InstanceID 
, TheDiffPath.TheDiffPathID ID 
, 'TheDiffPath' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from TheDiffPath
 join INSTANCE on TheDiffPath.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join TheDefenitionDiffP ON TheDefenitionDiffP.InstanceID=TheDiffPath.InstanceID 
;
create or replace view V_AUTODopUslTo as 
select   DopUslToID,TheDiffPathID
, 
 DopUslTo.DopUsluga  
DopUslTo_DopUsluga_ID, 
 Func.PEKD_SRV_BRIEF_F(DopUslTo.DopUsluga) 
DopUslTo_DopUsluga 
, TheDiffPath.InstanceID InstanceID 
, DopUslTo.DopUslToID ID 
, 'DopUslTo' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from DopUslTo
 join TheDiffPath on TheDiffPath.TheDiffPathID=DopUslTo.ParentStructRowID 
 join INSTANCE on TheDiffPath.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTODopUslFrom as 
select   DopUslFromID,TheDiffPathID
, 
 DopUslFrom.DopUsluga  
DopUslFrom_DopUsluga_ID, 
 Func.PEKD_SRV_BRIEF_F(DopUslFrom.DopUsluga) 
DopUslFrom_DopUsluga 
, TheDiffPath.InstanceID InstanceID 
, DopUslFrom.DopUslFromID ID 
, 'DopUslFrom' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from DopUslFrom
 join TheDiffPath on TheDiffPath.TheDiffPathID=DopUslFrom.ParentStructRowID 
 join INSTANCE on TheDiffPath.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOTheDefenitionDiffP as 
select   TheDefenitionDiffPID
, 
TheDefenitionDiffP.TheComment 
TheDefenitionDiffP_TheComment 
, 
TheDefenitionDiffP.TheNumeric 
TheDefenitionDiffP_TheNumeric 
, 
 TheDefenitionDiffP.DirStation  
TheDefenitionDiffP_DirStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(TheDefenitionDiffP.DirStation) 
TheDefenitionDiffP_DirStation 
, 
 TheDefenitionDiffP.TownFrom  
TheDefenitionDiffP_TownFrom_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(TheDefenitionDiffP.TownFrom) 
TheDefenitionDiffP_TownFrom 
, 
TheDefenitionDiffP.CountParticles 
TheDefenitionDiffP_CountParticles 
, TheDefenitionDiffP.InstanceID InstanceID 
, TheDefenitionDiffP.TheDefenitionDiffPID ID 
, 'TheDefenitionDiffP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from TheDefenitionDiffP
 join INSTANCE on TheDefenitionDiffP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewDifficultPath_TheDefenitionDiffP as 
select   TheDefenitionDiffPID
, 
TheDefenitionDiffP.TheComment 
TheDefenitionDiffP_TheComment 
, 
 TheDefenitionDiffP.TownFrom  
TheDefenitionDiffP_TownFrom_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(TheDefenitionDiffP.TownFrom) 
TheDefenitionDiffP_TownFrom 
, 
 TheDefenitionDiffP.DirStation  
TheDefenitionDiffP_DirStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(TheDefenitionDiffP.DirStation) 
TheDefenitionDiffP_DirStation 
, 
TheDefenitionDiffP.TheNumeric 
TheDefenitionDiffP_TheNumeric 
, TheDefenitionDiffP.InstanceID InstanceID 
, TheDefenitionDiffP.TheDefenitionDiffPID ID 
, 'TheDefenitionDiffP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from TheDefenitionDiffP
 join INSTANCE on TheDefenitionDiffP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKAKT_CONTROLLIST as 
select   PEKACT_DEFID
, 
PEKACT_DEF.FIO 
PEKACT_DEF_FIO 
, 
PEKACT_DEF.Date_FROM 
PEKACT_DEF_Date_FROM 
, 
PEKACT_DEF.dateCreate 
PEKACT_DEF_dateCreate 
, 
PEKACT_DEF.dateSend 
PEKACT_DEF_dateSend 
, 
 PEKACT_DEF.Podrazdelenie  
PEKACT_DEF_Podrazdelenie_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKACT_DEF.Podrazdelenie) 
PEKACT_DEF_Podrazdelenie 
, 
PEKACT_DEF.Number_of_akt 
PEKACT_DEF_Number_of_akt 
, 
 PEKACT_DEF.TheDgovor  
PEKACT_DEF_TheDgovor_ID, 
 Func.INSTANCE_BRIEF_F(PEKACT_DEF.TheDgovor) 
PEKACT_DEF_TheDgovor 
, 
PEKACT_DEF.dateReceive 
PEKACT_DEF_dateReceive 
, 
PEKACT_DEF.Date_TO 
PEKACT_DEF_Date_TO 
, 
 PEKACT_DEF.Client  
PEKACT_DEF_Client_ID, 
 Func.INSTANCE_BRIEF_F(PEKACT_DEF.Client) 
PEKACT_DEF_Client 
, PEKACT_DEF.InstanceID InstanceID 
, PEKACT_DEF.PEKACT_DEFID ID 
, 'PEKACT_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKACT_DEF
 join INSTANCE on PEKACT_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKAKT_PEKACT_DEF as 
select   PEKACT_DEFID
, 
 PEKACT_DEF.Client  
PEKACT_DEF_Client_ID, 
 Func.INSTANCE_BRIEF_F(PEKACT_DEF.Client) 
PEKACT_DEF_Client 
, 
PEKACT_DEF.Number_of_akt 
PEKACT_DEF_Number_of_akt 
, 
PEKACT_DEF.Date_TO 
PEKACT_DEF_Date_TO 
, 
PEKACT_DEF.Date_FROM 
PEKACT_DEF_Date_FROM 
, 
 PEKACT_DEF.Podrazdelenie  
PEKACT_DEF_Podrazdelenie_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKACT_DEF.Podrazdelenie) 
PEKACT_DEF_Podrazdelenie 
, PEKACT_DEF.InstanceID InstanceID 
, PEKACT_DEF.PEKACT_DEFID ID 
, 'PEKACT_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKACT_DEF
 join INSTANCE on PEKACT_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKACT_DEF as 
select   PEKACT_DEFID
, 
PEKACT_DEF.Code1C 
PEKACT_DEF_Code1C 
, 
PEKACT_DEF.dateReceive 
PEKACT_DEF_dateReceive 
, 
PEKACT_DEF.Number_of_akt 
PEKACT_DEF_Number_of_akt 
, 
 PEKACT_DEF.TheDgovor  
PEKACT_DEF_TheDgovor_ID, 
 Func.INSTANCE_BRIEF_F(PEKACT_DEF.TheDgovor) 
PEKACT_DEF_TheDgovor 
, 
PEKACT_DEF.FIO 
PEKACT_DEF_FIO 
, 
PEKACT_DEF.dateSend 
PEKACT_DEF_dateSend 
, 
 PEKACT_DEF.Client  
PEKACT_DEF_Client_ID, 
 Func.INSTANCE_BRIEF_F(PEKACT_DEF.Client) 
PEKACT_DEF_Client 
, 
PEKACT_DEF.dateCreate 
PEKACT_DEF_dateCreate 
, 
PEKACT_DEF.Date_TO 
PEKACT_DEF_Date_TO 
, 
 PEKACT_DEF.Podrazdelenie  
PEKACT_DEF_Podrazdelenie_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKACT_DEF.Podrazdelenie) 
PEKACT_DEF_Podrazdelenie 
, 
PEKACT_DEF.Date_FROM 
PEKACT_DEF_Date_FROM 
, PEKACT_DEF.InstanceID InstanceID 
, PEKACT_DEF.PEKACT_DEFID ID 
, 'PEKACT_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKACT_DEF
 join INSTANCE on PEKACT_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKAKT_PEKACT_ITOG as 
select   PEKACT_ITOGID
, 
PEKACT_DEF.Date_TO 
PEKACT_DEF_Date_TO 
, 
PEKACT_DEF.Date_FROM 
PEKACT_DEF_Date_FROM 
, 
PEKACT_ITOG.SupSUMM 
PEKACT_ITOG_SupSUMM 
, 
PEKACT_DEF.Number_of_akt 
PEKACT_DEF_Number_of_akt 
, 
 PEKACT_DEF.Podrazdelenie  
PEKACT_DEF_Podrazdelenie_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKACT_DEF.Podrazdelenie) 
PEKACT_DEF_Podrazdelenie 
, 
 PEKACT_DEF.Client  
PEKACT_DEF_Client_ID, 
 Func.INSTANCE_BRIEF_F(PEKACT_DEF.Client) 
PEKACT_DEF_Client 
, 
 PEKACT_ITOG.SRV  
PEKACT_ITOG_SRV_ID, 
 Func.PEKD_SRV_BRIEF_F(PEKACT_ITOG.SRV) 
PEKACT_ITOG_SRV 
, 
PEKACT_ITOG.SummNDS 
PEKACT_ITOG_SummNDS 
, 
PEKACT_ITOG.Summ 
PEKACT_ITOG_Summ 
, 
PEKACT_ITOG.SupSummNDS 
PEKACT_ITOG_SupSummNDS 
, PEKACT_ITOG.InstanceID InstanceID 
, PEKACT_ITOG.PEKACT_ITOGID ID 
, 'PEKACT_ITOG' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKACT_ITOG
 join INSTANCE on PEKACT_ITOG.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join PEKACT_DEF ON PEKACT_DEF.InstanceID=PEKACT_ITOG.InstanceID 
;
create or replace view V_AUTOPEKACT_ITOG as 
select   PEKACT_ITOGID
, 
PEKACT_ITOG.Quantity 
PEKACT_ITOG_Quantity 
, 
PEKACT_ITOG.SummNDS 
PEKACT_ITOG_SummNDS 
, 
PEKACT_ITOG.SupSUMM 
PEKACT_ITOG_SupSUMM 
, 
PEKACT_ITOG.SupSummNDS 
PEKACT_ITOG_SupSummNDS 
, 
 PEKACT_ITOG.edizm  
PEKACT_ITOG_edizm_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKACT_ITOG.edizm) 
PEKACT_ITOG_edizm 
, 
 PEKACT_ITOG.SRV  
PEKACT_ITOG_SRV_ID, 
 Func.PEKD_SRV_BRIEF_F(PEKACT_ITOG.SRV) 
PEKACT_ITOG_SRV 
, 
PEKACT_ITOG.Summ 
PEKACT_ITOG_Summ 
, PEKACT_ITOG.InstanceID InstanceID 
, PEKACT_ITOG.PEKACT_ITOGID ID 
, 'PEKACT_ITOG' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKACT_ITOG
 join INSTANCE on PEKACT_ITOG.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKACT_LINES as 
select   PEKACT_LINESID
, 
 PEKACT_LINES.Zayavka  
PEKACT_LINES_Zayavka_ID, 
 Func.INSTANCE_BRIEF_F(PEKACT_LINES.Zayavka) 
PEKACT_LINES_Zayavka 
, PEKACT_LINES.InstanceID InstanceID 
, PEKACT_LINES.PEKACT_LINESID ID 
, 'PEKACT_LINES' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKACT_LINES
 join INSTANCE on PEKACT_LINES.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindFieldType as 
select   FIELDTYPEID
, 
 FIELDTYPE.TypeStyle  
FIELDTYPE_TypeStyle_VAL, 
 decode(FIELDTYPE.TypeStyle 
, 3 ,'Интервал'
, 0 ,'Скалярный тип'
, 4 ,'Ссылка'
, 2 ,'Перечисление'
, 1 ,'Выражение'
, 5 ,'Элемент оформления'
, '???') 
FIELDTYPE_TypeStyle 
, 
FIELDTYPE.Name 
FIELDTYPE_Name 
, 
FIELDTYPE.the_Comment 
FIELDTYPE_Comment 
, FIELDTYPE.InstanceID InstanceID 
, FIELDTYPE.FIELDTYPEID ID 
, 'FIELDTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FIELDTYPE
 join INSTANCE on FIELDTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindMethod as 
select   SHAREDMETHODID
, 
SHAREDMETHOD.Name 
SHAREDMETHOD_Name 
, 
SHAREDMETHOD.the_Comment 
SHAREDMETHOD_Comment 
, SHAREDMETHOD.InstanceID InstanceID 
, SHAREDMETHOD.SHAREDMETHODID ID 
, 'SHAREDMETHOD' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from SHAREDMETHOD
 join INSTANCE on SHAREDMETHOD.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindOBJECTTYPE as 
select   OBJECTTYPEID
, 
OBJECTTYPE.the_Comment 
OBJECTTYPE_Comment 
, 
 OBJECTTYPE.Package  
OBJECTTYPE_Package_ID, 
 Func.MTZAPP_BRIEF_F(OBJECTTYPE.Package) 
OBJECTTYPE_Package 
, 
OBJECTTYPE.Name 
OBJECTTYPE_Name 
, OBJECTTYPE.InstanceID InstanceID 
, OBJECTTYPE.OBJECTTYPEID ID 
, 'OBJECTTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from OBJECTTYPE
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindPart as 
select   PARTID,OBJECTTYPEID
, 
OBJECTTYPE.Name 
OBJECTTYPE_Name 
, 
PART.Caption 
PART_Caption 
, 
OBJECTTYPE.the_Comment 
OBJECTTYPE_Comment 
, 
PART.the_Comment 
PART_Comment 
, 
PART.Name 
PART_Name 
, OBJECTTYPE.InstanceID InstanceID 
, PART.PARTID ID 
, 'PART' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PART
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindPARTMENU as 
select   PARTMENUID,PARTID,OBJECTTYPEID
, 
OBJECTTYPE.the_Comment 
OBJECTTYPE_Comment 
, 
PARTMENU.Name 
PARTMENU_Name 
, 
PART.the_Comment 
PART_Comment 
, OBJECTTYPE.InstanceID InstanceID 
, PARTMENU.PARTMENUID ID 
, 'PARTMENU' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PARTMENU
 join PART on PART.PARTID=PARTMENU.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindField as 
select   FIELDID,PARTID,OBJECTTYPEID
, 
FIELD.Name 
FIELD_Name 
, 
OBJECTTYPE.the_Comment 
OBJECTTYPE_Comment 
, 
FIELD.Caption 
FIELD_Caption 
, 
PART.the_Comment 
PART_Comment 
, OBJECTTYPE.InstanceID InstanceID 
, FIELD.FIELDID ID 
, 'FIELD' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FIELD
 join PART on PART.PARTID=FIELD.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewMTZMetaModel_OBJECTMODE as 
select   OBJECTMODEID,OBJECTTYPEID
, 
 OBJECTTYPE.AllowSearch  
OBJECTTYPE_AllowSearch_VAL, 
 decode(OBJECTTYPE.AllowSearch 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
OBJECTTYPE_AllowSearch 
, 
 OBJECTTYPE.ReplicaType  
OBJECTTYPE_ReplicaType_VAL, 
 decode(OBJECTTYPE.ReplicaType 
, 0 ,'Весь документ'
, 2 ,'Локальный'
, 1 ,'Построчно'
, '???') 
OBJECTTYPE_ReplicaType 
, 
 OBJECTTYPE.Package  
OBJECTTYPE_Package_ID, 
 Func.MTZAPP_BRIEF_F(OBJECTTYPE.Package) 
OBJECTTYPE_Package 
, 
 OBJECTMODE.DefaultMode  
OBJECTMODE_DefaultMode_VAL, 
 decode(OBJECTMODE.DefaultMode 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
OBJECTMODE_DefaultMode 
, 
 OBJECTTYPE.IsSingleInstance  
OBJECTTYPE_IsSingleInstance_VAL, 
 decode(OBJECTTYPE.IsSingleInstance 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
OBJECTTYPE_IsSingleInstance 
, 
 OBJECTTYPE.OnRun  
OBJECTTYPE_OnRun_ID, 
 Func.TYPEMENU_BRIEF_F(OBJECTTYPE.OnRun) 
OBJECTTYPE_OnRun 
, 
 OBJECTTYPE.ChooseView  
OBJECTTYPE_ChooseView_ID, 
 Func.PARTVIEW_BRIEF_F(OBJECTTYPE.ChooseView) 
OBJECTTYPE_ChooseView 
, 
 OBJECTTYPE.OnDelete  
OBJECTTYPE_OnDelete_ID, 
 Func.TYPEMENU_BRIEF_F(OBJECTTYPE.OnDelete) 
OBJECTTYPE_OnDelete 
, 
OBJECTMODE.Name 
OBJECTMODE_Name 
, 
 OBJECTTYPE.OnCreate  
OBJECTTYPE_OnCreate_ID, 
 Func.TYPEMENU_BRIEF_F(OBJECTTYPE.OnCreate) 
OBJECTTYPE_OnCreate 
, 
 OBJECTTYPE.AllowRefToObject  
OBJECTTYPE_AllowRefToObject_VAL, 
 decode(OBJECTTYPE.AllowRefToObject 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
OBJECTTYPE_AllowRefToObject 
, 
OBJECTTYPE.Name 
OBJECTTYPE_Name 
, 
OBJECTTYPE.the_Comment 
OBJECTTYPE_the_Comment 
, OBJECTTYPE.InstanceID InstanceID 
, OBJECTMODE.OBJECTMODEID ID 
, 'OBJECTMODE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from OBJECTMODE
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=OBJECTMODE.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindTYPEMENU as 
select   TYPEMENUID,OBJECTTYPEID
, 
OBJECTTYPE.the_Comment 
OBJECTTYPE_Comment 
, 
TYPEMENU.Name 
TYPEMENU_Name 
, OBJECTTYPE.InstanceID InstanceID 
, TYPEMENU.TYPEMENUID ID 
, 'TYPEMENU' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from TYPEMENU
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=TYPEMENU.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindMTZAPP as 
select   MTZAPPID
, 
MTZAPP.Name 
MTZAPP_Name 
, MTZAPP.InstanceID InstanceID 
, MTZAPP.MTZAPPID ID 
, 'MTZAPP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZAPP
 join INSTANCE on MTZAPP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindGENPACKAGE as 
select   GENPACKAGEID
, 
GENPACKAGE.Name 
GENPACKAGE_Name 
, GENPACKAGE.InstanceID InstanceID 
, GENPACKAGE.GENPACKAGEID ID 
, 'GENPACKAGE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from GENPACKAGE
 join INSTANCE on GENPACKAGE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindGENERATOR_TARGET as 
select   GENERATOR_TARGETID,GENPACKAGEID
, 
GENERATOR_TARGET.Name 
GENERATOR_TARGET_Name 
, 
GENPACKAGE.Name 
GENPACKAGE_Name 
, GENPACKAGE.InstanceID InstanceID 
, GENERATOR_TARGET.GENERATOR_TARGETID ID 
, 'GENERATOR_TARGET' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from GENERATOR_TARGET
 join GENPACKAGE on GENPACKAGE.GENPACKAGEID=GENERATOR_TARGET.ParentStructRowID 
 join INSTANCE on GENPACKAGE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKPQ_PEKPQ_DEF as 
select   PEKPQ_DEFID
, 
PEKPQ_DEF.TheDate 
PEKPQ_DEF_TheDate 
, 
PEKPQ_DEF.TheComment 
PEKPQ_DEF_TheComment 
, 
 PEKPQ_DEF.TheDept  
PEKPQ_DEF_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKPQ_DEF.TheDept) 
PEKPQ_DEF_TheDept 
, 
 PEKPQ_DEF.ToSuplier  
PEKPQ_DEF_ToSuplier_ID, 
 Func.INSTANCE_BRIEF_F(PEKPQ_DEF.ToSuplier) 
PEKPQ_DEF_ToSuplier 
, 
PEKPQ_DEF.TheSumm 
PEKPQ_DEF_TheSumm 
, 
PEKPQ_DEF.sequence 
PEKPQ_DEF_sequence 
, PEKPQ_DEF.InstanceID InstanceID 
, PEKPQ_DEF.PEKPQ_DEFID ID 
, 'PEKPQ_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKPQ_DEF
 join INSTANCE on PEKPQ_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKPQ_DEF as 
select   PEKPQ_DEFID
, 
 PEKPQ_DEF.TheDogovor  
PEKPQ_DEF_TheDogovor_ID, 
 Func.INSTANCE_BRIEF_F(PEKPQ_DEF.TheDogovor) 
PEKPQ_DEF_TheDogovor 
, 
 PEKPQ_DEF.TheDept  
PEKPQ_DEF_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKPQ_DEF.TheDept) 
PEKPQ_DEF_TheDept 
, 
PEKPQ_DEF.TheComment 
PEKPQ_DEF_TheComment 
, 
PEKPQ_DEF.Code1C 
PEKPQ_DEF_Code1C 
, 
PEKPQ_DEF.sequence 
PEKPQ_DEF_sequence 
, 
PEKPQ_DEF.TheSumm 
PEKPQ_DEF_TheSumm 
, 
PEKPQ_DEF.TheDate 
PEKPQ_DEF_TheDate 
, 
PEKPQ_DEF.TheDescription 
PEKPQ_DEF_TheDescription 
, 
 PEKPQ_DEF.ToSuplier  
PEKPQ_DEF_ToSuplier_ID, 
 Func.INSTANCE_BRIEF_F(PEKPQ_DEF.ToSuplier) 
PEKPQ_DEF_ToSuplier 
, PEKPQ_DEF.InstanceID InstanceID 
, PEKPQ_DEF.PEKPQ_DEFID ID 
, 'PEKPQ_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKPQ_DEF
 join INSTANCE on PEKPQ_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOENTDIC_BANK as 
select   ENTDIC_BANKID
, 
ENTDIC_BANK.Addr 
ENTDIC_BANK_Addr 
, 
ENTDIC_BANK.BIC 
ENTDIC_BANK_BIC 
, 
ENTDIC_BANK.Code1C 
ENTDIC_BANK_Code1C 
, 
ENTDIC_BANK.SUBKORACC 
ENTDIC_BANK_SUBKORACC 
, 
ENTDIC_BANK.RKC 
ENTDIC_BANK_RKC 
, 
ENTDIC_BANK.ACC 
ENTDIC_BANK_ACC 
, 
ENTDIC_BANK.name 
ENTDIC_BANK_name 
, 
ENTDIC_BANK.KORACC 
ENTDIC_BANK_KORACC 
, ENTDIC_BANK.InstanceID InstanceID 
, ENTDIC_BANK.ENTDIC_BANKID ID 
, 'ENTDIC_BANK' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_BANK
 join INSTANCE on ENTDIC_BANK.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewENTDIC_ENTDIC_BANK as 
select   ENTDIC_BANKID
, 
ENTDIC_BANK.KORACC 
ENTDIC_BANK_KORACC 
, 
ENTDIC_BANK.Addr 
ENTDIC_BANK_Addr 
, 
ENTDIC_BANK.name 
ENTDIC_BANK_name 
, 
ENTDIC_BANK.BIC 
ENTDIC_BANK_BIC 
, 
ENTDIC_BANK.SUBKORACC 
ENTDIC_BANK_SUBKORACC 
, 
ENTDIC_BANK.ACC 
ENTDIC_BANK_ACC 
, 
ENTDIC_BANK.RKC 
ENTDIC_BANK_RKC 
, ENTDIC_BANK.InstanceID InstanceID 
, ENTDIC_BANK.ENTDIC_BANKID ID 
, 'ENTDIC_BANK' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_BANK
 join INSTANCE on ENTDIC_BANK.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOENTDIC_DOST as 
select   ENTDIC_DOSTID
, 
ENTDIC_DOST.Code 
ENTDIC_DOST_Code 
, 
ENTDIC_DOST.name 
ENTDIC_DOST_name 
, ENTDIC_DOST.InstanceID InstanceID 
, ENTDIC_DOST.ENTDIC_DOSTID ID 
, 'ENTDIC_DOST' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_DOST
 join INSTANCE on ENTDIC_DOST.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewENTDIC_ENTDIC_DOST as 
select   ENTDIC_DOSTID
, 
ENTDIC_DOST.name 
ENTDIC_DOST_name 
, ENTDIC_DOST.InstanceID InstanceID 
, ENTDIC_DOST.ENTDIC_DOSTID ID 
, 'ENTDIC_DOST' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_DOST
 join INSTANCE on ENTDIC_DOST.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOENTDIC_TOWN as 
select   ENTDIC_TOWNID
, 
 ENTDIC_TOWN.country  
ENTDIC_TOWN_country_ID, 
 Func.ENTDIC_COUNTRY_BRIEF_F(ENTDIC_TOWN.country) 
ENTDIC_TOWN_country 
, 
ENTDIC_TOWN.name 
ENTDIC_TOWN_name 
, ENTDIC_TOWN.InstanceID InstanceID 
, ENTDIC_TOWN.ENTDIC_TOWNID ID 
, 'ENTDIC_TOWN' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_TOWN
 join INSTANCE on ENTDIC_TOWN.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewENTDIC_ENTDIC_TOWN as 
select   ENTDIC_TOWNID
, 
 ENTDIC_TOWN.country  
ENTDIC_TOWN_country_ID, 
 Func.ENTDIC_COUNTRY_BRIEF_F(ENTDIC_TOWN.country) 
ENTDIC_TOWN_country 
, 
ENTDIC_TOWN.name 
ENTDIC_TOWN_name 
, ENTDIC_TOWN.InstanceID InstanceID 
, ENTDIC_TOWN.ENTDIC_TOWNID ID 
, 'ENTDIC_TOWN' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_TOWN
 join INSTANCE on ENTDIC_TOWN.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOENTDIC_TransportType as 
select   ENTDIC_TransportTypeID
, 
ENTDIC_TransportType.TheName 
ENTDIC_TransportType_TheName 
, ENTDIC_TransportType.InstanceID InstanceID 
, ENTDIC_TransportType.ENTDIC_TransportTypeID ID 
, 'ENTDIC_TransportType' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_TransportType
 join INSTANCE on ENTDIC_TransportType.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewENTDIC_ENTDIC_TransportType as 
select   ENTDIC_TransportTypeID
, 
ENTDIC_TransportType.TheName 
ENTDIC_TransportType_TheName 
, ENTDIC_TransportType.InstanceID InstanceID 
, ENTDIC_TransportType.ENTDIC_TransportTypeID ID 
, 'ENTDIC_TransportType' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_TransportType
 join INSTANCE on ENTDIC_TransportType.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewENTDIC_ENTDIC_OPF as 
select   ENTDIC_OPFID
, 
ENTDIC_OPF.name 
ENTDIC_OPF_name 
, ENTDIC_OPF.InstanceID InstanceID 
, ENTDIC_OPF.ENTDIC_OPFID ID 
, 'ENTDIC_OPF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_OPF
 join INSTANCE on ENTDIC_OPF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOENTDIC_EDIZM as 
select   ENTDIC_EDIZMID
, 
ENTDIC_EDIZM.Netto 
ENTDIC_EDIZM_Netto 
, 
ENTDIC_EDIZM.name 
ENTDIC_EDIZM_name 
, 
ENTDIC_EDIZM.code 
ENTDIC_EDIZM_code 
, 
 ENTDIC_EDIZM.baseEDIZM  
ENTDIC_EDIZM_baseEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(ENTDIC_EDIZM.baseEDIZM) 
ENTDIC_EDIZM_baseEDIZM 
, ENTDIC_EDIZM.InstanceID InstanceID 
, ENTDIC_EDIZM.ENTDIC_EDIZMID ID 
, 'ENTDIC_EDIZM' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_EDIZM
 join INSTANCE on ENTDIC_EDIZM.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewENTDIC_ENTDIC_EDIZM as 
select   ENTDIC_EDIZMID
, 
ENTDIC_EDIZM.Netto 
ENTDIC_EDIZM_Netto 
, 
ENTDIC_EDIZM.name 
ENTDIC_EDIZM_name 
, 
ENTDIC_EDIZM.code 
ENTDIC_EDIZM_code 
, ENTDIC_EDIZM.InstanceID InstanceID 
, ENTDIC_EDIZM.ENTDIC_EDIZMID ID 
, 'ENTDIC_EDIZM' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_EDIZM
 join INSTANCE on ENTDIC_EDIZM.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOENTDIC_CURRENCY as 
select   ENTDIC_CURRENCYID
, 
ENTDIC_CURRENCY.Code 
ENTDIC_CURRENCY_Code 
, 
ENTDIC_CURRENCY.name 
ENTDIC_CURRENCY_name 
, ENTDIC_CURRENCY.InstanceID InstanceID 
, ENTDIC_CURRENCY.ENTDIC_CURRENCYID ID 
, 'ENTDIC_CURRENCY' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_CURRENCY
 join INSTANCE on ENTDIC_CURRENCY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewENTDIC_ENTDIC_CURRENCY as 
select   ENTDIC_CURRENCYID
, 
ENTDIC_CURRENCY.Code 
ENTDIC_CURRENCY_Code 
, 
ENTDIC_CURRENCY.name 
ENTDIC_CURRENCY_name 
, ENTDIC_CURRENCY.InstanceID InstanceID 
, ENTDIC_CURRENCY.ENTDIC_CURRENCYID ID 
, 'ENTDIC_CURRENCY' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_CURRENCY
 join INSTANCE on ENTDIC_CURRENCY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOENTDIC_CURCOURCE as 
select   ENTDIC_CURCOURCEID,ENTDIC_CURRENCYID
, 
ENTDIC_CURCOURCE.the_Value 
ENTDIC_CURCOURCE_the_Value 
, 
ENTDIC_CURCOURCE.CourceDate 
ENTDIC_CURCOURCE_CourceDate 
, 
ENTDIC_CURCOURCE.Quantity 
ENTDIC_CURCOURCE_Quantity 
, ENTDIC_CURRENCY.InstanceID InstanceID 
, ENTDIC_CURCOURCE.ENTDIC_CURCOURCEID ID 
, 'ENTDIC_CURCOURCE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_CURCOURCE
 join ENTDIC_CURRENCY on ENTDIC_CURRENCY.ENTDIC_CURRENCYID=ENTDIC_CURCOURCE.ParentStructRowID 
 join INSTANCE on ENTDIC_CURRENCY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewENTDIC_ENTDIC_COUNTRY as 
select   ENTDIC_COUNTRYID
, 
ENTDIC_COUNTRY.name 
ENTDIC_COUNTRY_name 
, ENTDIC_COUNTRY.InstanceID InstanceID 
, ENTDIC_COUNTRY.ENTDIC_COUNTRYID ID 
, 'ENTDIC_COUNTRY' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_COUNTRY
 join INSTANCE on ENTDIC_COUNTRY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOENTDIC_COUNTRY as 
select   ENTDIC_COUNTRYID
, 
ENTDIC_COUNTRY.name 
ENTDIC_COUNTRY_name 
, 
ENTDIC_COUNTRY.Code 
ENTDIC_COUNTRY_Code 
, ENTDIC_COUNTRY.InstanceID InstanceID 
, ENTDIC_COUNTRY.ENTDIC_COUNTRYID ID 
, 'ENTDIC_COUNTRY' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_COUNTRY
 join INSTANCE on ENTDIC_COUNTRY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewENTDIC_ENTDIC_REGION as 
select   ENTDIC_REGIONID
, 
ENTDIC_REGION.name 
ENTDIC_REGION_name 
, ENTDIC_REGION.InstanceID InstanceID 
, ENTDIC_REGION.ENTDIC_REGIONID ID 
, 'ENTDIC_REGION' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_REGION
 join INSTANCE on ENTDIC_REGION.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOENTDIC_REGION as 
select   ENTDIC_REGIONID
, 
ENTDIC_REGION.name 
ENTDIC_REGION_name 
, 
ENTDIC_REGION.Code 
ENTDIC_REGION_Code 
, ENTDIC_REGION.InstanceID InstanceID 
, ENTDIC_REGION.ENTDIC_REGIONID ID 
, 'ENTDIC_REGION' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENTDIC_REGION
 join INSTANCE on ENTDIC_REGION.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOST_MAIN as 
select   ST_MAINID
, 
ST_MAIN.UrlReferer 
ST_MAIN_UrlReferer 
, 
ST_MAIN.AccessDate 
ST_MAIN_AccessDate 
, 
ST_MAIN.UserHostName 
ST_MAIN_UserHostName 
, 
 ST_MAIN.WEBS_Page  
ST_MAIN_WEBS_Page_ID, 
 Func.WEBS_PAGEDEF_BRIEF_F(ST_MAIN.WEBS_Page) 
ST_MAIN_WEBS_Page 
, 
ST_MAIN.UserAgent 
ST_MAIN_UserAgent 
, 
ST_MAIN.the_Description 
ST_MAIN_the_Description 
, 
ST_MAIN.UserHostAddress 
ST_MAIN_UserHostAddress 
, ST_MAIN.InstanceID InstanceID 
, ST_MAIN.ST_MAINID ID 
, 'ST_MAIN' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ST_MAIN
 join INSTANCE on ST_MAIN.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOST_DEF as 
select   ST_DEFID
, 
ST_DEF.the_Description 
ST_DEF_the_Description 
, 
 ST_DEF.IsActive  
ST_DEF_IsActive_VAL, 
 decode(ST_DEF.IsActive 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ST_DEF_IsActive 
, 
 ST_DEF.WEBS  
ST_DEF_WEBS_ID, 
 Func.INSTANCE_BRIEF_F(ST_DEF.WEBS) 
ST_DEF_WEBS 
, 
ST_DEF.Name 
ST_DEF_Name 
, ST_DEF.InstanceID InstanceID 
, ST_DEF.ST_DEFID ID 
, 'ST_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ST_DEF
 join INSTANCE on ST_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOST_PAGES as 
select   ST_PAGESID
, 
ST_PAGES.AccessDate 
ST_PAGES_AccessDate 
, 
ST_PAGES.UserAgent 
ST_PAGES_UserAgent 
, 
ST_PAGES.UserHostName 
ST_PAGES_UserHostName 
, 
ST_PAGES.UserHostAddress 
ST_PAGES_UserHostAddress 
, 
ST_PAGES.UrlReferer 
ST_PAGES_UrlReferer 
, 
ST_PAGES.the_Description 
ST_PAGES_the_Description 
, 
 ST_PAGES.WEBS_Page  
ST_PAGES_WEBS_Page_ID, 
 Func.WEBS_PAGEDEF_BRIEF_F(ST_PAGES.WEBS_Page) 
ST_PAGES_WEBS_Page 
, ST_PAGES.InstanceID InstanceID 
, ST_PAGES.ST_PAGESID ID 
, 'ST_PAGES' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ST_PAGES
 join INSTANCE on ST_PAGES.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOSTDJournlaExtInfo as 
select   STDJournlaExtInfoID
, 
STDJournlaExtInfo.TheName 
STDJournlaExtInfo_TheName 
, 
 STDJournlaExtInfo.TheJournalRef  
STDJournlaExtInfo_TheJournalRef_ID, 
 Func.INSTANCE_BRIEF_F(STDJournlaExtInfo.TheJournalRef) 
STDJournlaExtInfo_TheJournalRef 
, STDJournlaExtInfo.InstanceID InstanceID 
, STDJournlaExtInfo.STDJournlaExtInfoID ID 
, 'STDJournlaExtInfo' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from STDJournlaExtInfo
 join INSTANCE on STDJournlaExtInfo.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOSTDJournalExtParam as 
select   STDJournalExtParamID
, 
STDJournalExtParam.FieldName 
STDJournalExtParam_FieldName 
, 
STDJournalExtParam.ParamName 
STDJournalExtParam_ParamName 
, 
 STDJournalExtParam.TargetPlatform  
STDJournalExtParam_TargetPlatform_ID, 
 Func.GENERATOR_TARGET_BRIEF_F(STDJournalExtParam.TargetPlatform) 
STDJournalExtParam_TargetPlatform 
, STDJournalExtParam.InstanceID InstanceID 
, STDJournalExtParam.STDJournalExtParamID ID 
, 'STDJournalExtParam' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from STDJournalExtParam
 join INSTANCE on STDJournalExtParam.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOSTDJournalExtFlt as 
select   STDJournalExtFltID
, 
STDJournalExtFlt.ViewSource 
STDJournalExtFlt_ViewSource 
, STDJournalExtFlt.InstanceID InstanceID 
, STDJournalExtFlt.STDJournalExtFltID ID 
, 'STDJournalExtFlt' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from STDJournalExtFlt
 join INSTANCE on STDJournalExtFlt.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOSTDJournalExtField as 
select   STDJournalExtFieldID,STDJournalExtFltID
, 
 STDJournalExtField.ConditionType  
STDJournalExtField_ConditionType_VAL, 
 decode(STDJournalExtField.ConditionType 
, 2 ,'<>'
, 3 ,'>'
, 1 ,'='
, 4 ,'>='
, 7 ,'<='
, 8 ,'like'
, 6 ,'<'
, 0 ,'none'
, '???') 
STDJournalExtField_ConditionType 
, 
STDJournalExtField.ViewField 
STDJournalExtField_ViewField 
, 
STDJournalExtField.ConstantValue 
STDJournalExtField_ConstantValue 
, 
STDJournalExtField.FieldSource 
STDJournalExtField_FieldSource 
, 
 STDJournalExtField.TargetPlatform  
STDJournalExtField_TargetPlatform_ID, 
 Func.GENERATOR_TARGET_BRIEF_F(STDJournalExtField.TargetPlatform) 
STDJournalExtField_TargetPlatform 
, STDJournalExtFlt.InstanceID InstanceID 
, STDJournalExtField.STDJournalExtFieldID ID 
, 'STDJournalExtField' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from STDJournalExtField
 join STDJournalExtFlt on STDJournalExtFlt.STDJournalExtFltID=STDJournalExtField.ParentStructRowID 
 join INSTANCE on STDJournalExtFlt.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOCAL_DAYS as 
select   CAL_DAYSID
, 
CAL_DAYS.TheDate 
CAL_DAYS_TheDate 
, 
 CAL_DAYS.IsHoliday  
CAL_DAYS_IsHoliday_VAL, 
 decode(CAL_DAYS.IsHoliday 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
CAL_DAYS_IsHoliday 
, CAL_DAYS.InstanceID InstanceID 
, CAL_DAYS.CAL_DAYSID ID 
, 'CAL_DAYS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from CAL_DAYS
 join INSTANCE on CAL_DAYS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOCAL_TIME as 
select   CAL_TIMEID,CAL_DAYSID
, 
CAL_TIME.ToTime 
CAL_TIME_ToTime 
, 
CAL_TIME.FromTime 
CAL_TIME_FromTime 
, CAL_DAYS.InstanceID InstanceID 
, CAL_TIME.CAL_TIMEID ID 
, 'CAL_TIME' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from CAL_TIME
 join CAL_DAYS on CAL_DAYS.CAL_DAYSID=CAL_TIME.ParentStructRowID 
 join INSTANCE on CAL_DAYS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOCAL_HEAD as 
select   CAL_HEADID
, 
CAL_HEAD.Name 
CAL_HEAD_Name 
, 
CAL_HEAD.FillStyle 
CAL_HEAD_FillStyle 
, CAL_HEAD.InstanceID InstanceID 
, CAL_HEAD.CAL_HEADID ID 
, 'CAL_HEAD' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from CAL_HEAD
 join INSTANCE on CAL_HEAD.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindCAL_HEAD as 
select   CAL_HEADID
, 
CAL_HEAD.Name 
CAL_HEAD_Name 
, CAL_HEAD.InstanceID InstanceID 
, CAL_HEAD.CAL_HEADID ID 
, 'CAL_HEAD' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from CAL_HEAD
 join INSTANCE on CAL_HEAD.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOSrvMessageInfo as 
select   SrvMessageInfoID
, 
SrvMessageInfo.MsgInfo 
SrvMessageInfo_MsgInfo 
, 
 SrvMessageInfo.ForUser  
SrvMessageInfo_ForUser_ID, 
 Func.Users_BRIEF_F(SrvMessageInfo.ForUser) 
SrvMessageInfo_ForUser 
, 
 SrvMessageInfo.TheDocument  
SrvMessageInfo_TheDocument_ID, 
 Func.INSTANCE_BRIEF_F(SrvMessageInfo.TheDocument) 
SrvMessageInfo_TheDocument 
, 
SrvMessageInfo.msgDate 
SrvMessageInfo_msgDate 
, 
SrvMessageInfo.ReadTime 
SrvMessageInfo_ReadTime 
, SrvMessageInfo.InstanceID InstanceID 
, SrvMessageInfo.SrvMessageInfoID ID 
, 'SrvMessageInfo' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from SrvMessageInfo
 join INSTANCE on SrvMessageInfo.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKNAL_PEKNAL_DEF as 
select   PEKNAL_DEFID
, 
PEKNAL_DEF.TheNumber 
PEKNAL_DEF_THENUMBER 
, 
 PEKNAL_DEF.ThePEKZ  
PEKNAL_DEF_ThePEKZ_ID, 
 Func.INSTANCE_BRIEF_F(PEKNAL_DEF.ThePEKZ) 
PEKNAL_DEF_ThePEKZ 
, 
 PEKNAL_DEF.TheDept  
PEKNAL_DEF_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKNAL_DEF.TheDept) 
PEKNAL_DEF_TheDept 
, 
PEKNAL_DEF.TheDate 
PEKNAL_DEF_TheDate 
, 
 PEKNAL_DEF.FromClient  
PEKNAL_DEF_FromClient_ID, 
 Func.INSTANCE_BRIEF_F(PEKNAL_DEF.FromClient) 
PEKNAL_DEF_FromClient 
, 
PEKNAL_DEF.TheSumm 
PEKNAL_DEF_TheSumm 
, PEKNAL_DEF.InstanceID InstanceID 
, PEKNAL_DEF.PEKNAL_DEFID ID 
, 'PEKNAL_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKNAL_DEF
 join INSTANCE on PEKNAL_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKNAL_DEF as 
select   PEKNAL_DEFID
, 
 PEKNAL_DEF.TheDept  
PEKNAL_DEF_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKNAL_DEF.TheDept) 
PEKNAL_DEF_TheDept 
, 
PEKNAL_DEF.TheDate 
PEKNAL_DEF_TheDate 
, 
 PEKNAL_DEF.FromClient  
PEKNAL_DEF_FromClient_ID, 
 Func.INSTANCE_BRIEF_F(PEKNAL_DEF.FromClient) 
PEKNAL_DEF_FromClient 
, 
PEKNAL_DEF.TheNumber 
PEKNAL_DEF_TheNumber 
, 
 PEKNAL_DEF.RceivedBy  
PEKNAL_DEF_RceivedBy_ID, 
 Func.Users_BRIEF_F(PEKNAL_DEF.RceivedBy) 
PEKNAL_DEF_RceivedBy 
, 
PEKNAL_DEF.Code1C 
PEKNAL_DEF_Code1C 
, 
PEKNAL_DEF.TheComment 
PEKNAL_DEF_TheComment 
, 
PEKNAL_DEF.TheSumm 
PEKNAL_DEF_TheSumm 
, 
 PEKNAL_DEF.ThePEKZ  
PEKNAL_DEF_ThePEKZ_ID, 
 Func.INSTANCE_BRIEF_F(PEKNAL_DEF.ThePEKZ) 
PEKNAL_DEF_ThePEKZ 
, PEKNAL_DEF.InstanceID InstanceID 
, PEKNAL_DEF.PEKNAL_DEFID ID 
, 'PEKNAL_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKNAL_DEF
 join INSTANCE on PEKNAL_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKNAL_PZ as 
select   PEKNAL_PZID
, 
 PEKNAL_PZ.PZ  
PEKNAL_PZ_PZ_ID, 
 Func.INSTANCE_BRIEF_F(PEKNAL_PZ.PZ) 
PEKNAL_PZ_PZ 
, 
PEKNAL_PZ.TheSumm 
PEKNAL_PZ_TheSumm 
, PEKNAL_PZ.InstanceID InstanceID 
, PEKNAL_PZ.PEKNAL_PZID ID 
, 'PEKNAL_PZ' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKNAL_PZ
 join INSTANCE on PEKNAL_PZ.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKNAL_ROWS as 
select   PEKNAL_ROWSID
, 
PEKNAL_ROWS.TheDate 
PEKNAL_ROWS_TheDate 
, 
PEKNAL_ROWS.TheSumm 
PEKNAL_ROWS_TheSumm 
, 
 PEKNAL_ROWS.FromClient  
PEKNAL_ROWS_FromClient_ID, 
 Func.INSTANCE_BRIEF_F(PEKNAL_ROWS.FromClient) 
PEKNAL_ROWS_FromClient 
, 
 PEKNAL_ROWS.TheDogovor  
PEKNAL_ROWS_TheDogovor_ID, 
 Func.INSTANCE_BRIEF_F(PEKNAL_ROWS.TheDogovor) 
PEKNAL_ROWS_TheDogovor 
, 
PEKNAL_ROWS.TheNumber 
PEKNAL_ROWS_TheNumber 
, 
 PEKNAL_ROWS.TheDept  
PEKNAL_ROWS_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKNAL_ROWS.TheDept) 
PEKNAL_ROWS_TheDept 
, PEKNAL_ROWS.InstanceID InstanceID 
, PEKNAL_ROWS.PEKNAL_ROWSID ID 
, 'PEKNAL_ROWS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKNAL_ROWS
 join INSTANCE on PEKNAL_ROWS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindFileDef as 
select   FileDefID
, 
FileDef.Name 
FileDef_Name 
, 
FileDef.the_Comment 
FileDef_Comment 
, FileDef.InstanceID InstanceID 
, FileDef.FileDefID ID 
, 'FileDef' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FileDef
 join INSTANCE on FileDef.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOFileDef as 
select   FileDefID
, 
FileDef.the_Comment 
FileDef_the_Comment 
, 
FileDef.Name 
FileDef_Name 
, FileDef.InstanceID InstanceID 
, FileDef.FileDefID ID 
, 'FileDef' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FileDef
 join INSTANCE on FileDef.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOFileVersion as 
select   FileVersionID
, 
FileVersion.the_Comment 
FileVersion_the_Comment 
, 
FileVersion.FileData 
FileVersion_FileData 
, 
FileVersion.Ext 
FileVersion_Ext 
, 
 FileVersion.CurrentVersion  
FileVersion_CurrentVersion_VAL, 
 decode(FileVersion.CurrentVersion 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FileVersion_CurrentVersion 
, 
FileVersion.Version 
FileVersion_Version 
, FileVersion.InstanceID InstanceID 
, FileVersion.FileVersionID ID 
, 'FileVersion' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FileVersion
 join INSTANCE on FileVersion.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTONum_zones as 
select   Num_zonesID
, 
Num_zones.ZoneMask 
Num_zones_ZoneMask 
, Num_zones.InstanceID InstanceID 
, Num_zones.Num_zonesID ID 
, 'Num_zones' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Num_zones
 join INSTANCE on Num_zones.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTONum_Values as 
select   Num_ValuesID,Num_zonesID
, 
Num_Values.OwnerRowID 
Num_Values_OwnerRowID 
, 
Num_Values.OwnerPartName 
Num_Values_OwnerPartName 
, 
Num_Values.the_Value 
Num_Values_the_Value 
, Num_zones.InstanceID InstanceID 
, Num_Values.Num_ValuesID ID 
, 'Num_Values' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Num_Values
 join Num_zones on Num_zones.Num_zonesID=Num_Values.ParentStructRowID 
 join INSTANCE on Num_zones.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewSTDNumerator_Num_Values as 
select   Num_ValuesID,Num_zonesID
, 
Num_zones.ZoneMask 
Num_zones_ZoneMask 
, 
Num_Values.the_Value 
Num_Values_Value 
, 
 Num_head.Shema  
Num_head_Shema_VAL, 
 decode(Num_head.Shema 
, 0 ,'Единая зона'
, 1 ,'По году'
, 4 ,'По дню'
, 2 ,'По кварталу'
, 3 ,'По месяцу'
, 10 ,'Произвольные зоны'
, '???') 
Num_head_Shema 
, 
Num_head.Name 
Num_head_Name 
, Num_zones.InstanceID InstanceID 
, Num_Values.Num_ValuesID ID 
, 'Num_Values' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Num_Values
 join Num_zones on Num_zones.Num_zonesID=Num_Values.ParentStructRowID 
 join INSTANCE on Num_zones.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join Num_head ON Num_head.InstanceID=Num_zones.InstanceID 
;
create or replace view V_AUTONum_head as 
select   Num_headID
, 
 Num_head.Shema  
Num_head_Shema_VAL, 
 decode(Num_head.Shema 
, 0 ,'Единая зона'
, 1 ,'По году'
, 4 ,'По дню'
, 2 ,'По кварталу'
, 3 ,'По месяцу'
, 10 ,'Произвольные зоны'
, '???') 
Num_head_Shema 
, 
Num_head.Name 
Num_head_Name 
, Num_head.InstanceID InstanceID 
, Num_head.Num_headID ID 
, 'Num_head' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Num_head
 join INSTANCE on Num_head.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewSTDNumerator_Num_head as 
select   Num_headID
, 
 Num_head.Shema  
Num_head_Shema_VAL, 
 decode(Num_head.Shema 
, 0 ,'Единая зона'
, 1 ,'По году'
, 4 ,'По дню'
, 2 ,'По кварталу'
, 3 ,'По месяцу'
, 10 ,'Произвольные зоны'
, '???') 
Num_head_Shema 
, 
Num_head.Name 
Num_head_Name 
, Num_head.InstanceID InstanceID 
, Num_head.Num_headID ID 
, 'Num_head' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Num_head
 join INSTANCE on Num_head.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOBaseSetting as 
select   BaseSettingID
, 
BaseSetting.Passport 
BaseSetting_Passport 
, 
 BaseSetting.TrTypeDef  
BaseSetting_TrTypeDef_ID, 
 Func.PEKD_TRTYPE_BRIEF_F(BaseSetting.TrTypeDef) 
BaseSetting_TrTypeDef 
, 
BaseSetting.Count103 
BaseSetting_Count103 
, 
 BaseSetting.Direction  
BaseSetting_Direction_ID, 
 Func.PEKD_DIRECTION_BRIEF_F(BaseSetting.Direction) 
BaseSetting_Direction 
, 
BaseSetting.addInvoiceInfo 
BaseSetting_addInvoiceInfo 
, 
 BaseSetting.WED  
BaseSetting_WED_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(BaseSetting.WED) 
BaseSetting_WED 
, 
 BaseSetting.Code  
BaseSetting_Code_VAL, 
 decode(BaseSetting.Code 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
BaseSetting_Code 
, 
 BaseSetting.FIL  
BaseSetting_FIL_ID, 
 Func.PEKD_DEPT_BRIEF_F(BaseSetting.FIL) 
BaseSetting_FIL 
, 
 BaseSetting.SingleSendTRF  
BaseSetting_SingleSendTRF_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(BaseSetting.SingleSendTRF) 
BaseSetting_SingleSendTRF 
, 
BaseSetting.CashMan 
BaseSetting_CashMan 
, 
BaseSetting.NDS 
BaseSetting_NDS 
, 
 BaseSetting.SingleSendCli  
BaseSetting_SingleSendCli_ID, 
 Func.INSTANCE_BRIEF_F(BaseSetting.SingleSendCli) 
BaseSetting_SingleSendCli 
, 
 BaseSetting.Round500  
BaseSetting_Round500_VAL, 
 decode(BaseSetting.Round500 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
BaseSetting_Round500 
, 
 BaseSetting.VED  
BaseSetting_VED_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(BaseSetting.VED) 
BaseSetting_VED 
, 
BaseSetting.AccountGeneral 
BaseSetting_AccountGeneral 
, 
BaseSetting.DateSHCode 
BaseSetting_DateSHCode 
, 
 BaseSetting.NewClientTRF  
BaseSetting_NewClientTRF_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(BaseSetting.NewClientTRF) 
BaseSetting_NewClientTRF 
, 
 BaseSetting.NDS103  
BaseSetting_NDS103_VAL, 
 decode(BaseSetting.NDS103 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
BaseSetting_NDS103 
, 
BaseSetting.IDX 
BaseSetting_IDX 
, 
BaseSetting.genDirector 
BaseSetting_genDirector 
, BaseSetting.InstanceID InstanceID 
, BaseSetting.BaseSettingID ID 
, 'BaseSetting' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from BaseSetting
 join INSTANCE on BaseSetting.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOReports as 
select   ReportsID
, 
Reports.TheComment 
Reports_TheComment 
, 
 Reports.ReportType  
Reports_ReportType_VAL, 
 decode(Reports.ReportType 
, 1 ,'Двумерная матрица'
, 0 ,'Таблица'
, 3 ,'Экспорт по WORD шаблону'
, 2 ,'Только расчет'
, 4 ,'Экспорт по Excel шаблону'
, '???') 
Reports_ReportType 
, 
 Reports.PrepareMethod  
Reports_PrepareMethod_ID, 
 Func.SHAREDMETHOD_BRIEF_F(Reports.PrepareMethod) 
Reports_PrepareMethod 
, 
Reports.ReportView 
Reports_ReportView 
, 
 Reports.TheReportExt  
Reports_TheReportExt_ID, 
 Func.INSTANCE_BRIEF_F(Reports.TheReportExt) 
Reports_TheReportExt 
, 
Reports.Caption 
Reports_Caption 
, 
Reports.ReportFile 
Reports_ReportFile 
, 
Reports.Name 
Reports_Name 
, Reports.InstanceID InstanceID 
, Reports.ReportsID ID 
, 'Reports' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Reports
 join INSTANCE on Reports.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindReports as 
select   ReportsID
, 
Reports.Name 
Reports_Name 
, Reports.InstanceID InstanceID 
, Reports.ReportsID ID 
, 'Reports' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Reports
 join INSTANCE on Reports.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTORPTStruct as 
select   RPTStructID
, 
RPTStruct.Caption 
RPTStruct_Caption 
, 
RPTStruct.Name 
RPTStruct_Name 
, RPTStruct.InstanceID InstanceID 
, RPTStruct.RPTStructID ID 
, 'RPTStruct' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RPTStruct
 join INSTANCE on RPTStruct.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTORPTFields as 
select   RPTFieldsID,RPTStructID
, 
 RPTFields.FieldType  
RPTFields_FieldType_ID, 
 Func.FIELDTYPE_BRIEF_F(RPTFields.FieldType) 
RPTFields_FieldType 
, 
RPTFields.Caption 
RPTFields_Caption 
, 
RPTFields.FieldSize 
RPTFields_FieldSize 
, 
RPTFields.Name 
RPTFields_Name 
, RPTStruct.InstanceID InstanceID 
, RPTFields.RPTFieldsID ID 
, 'RPTFields' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RPTFields
 join RPTStruct on RPTStruct.RPTStructID=RPTFields.ParentStructRowID 
 join INSTANCE on RPTStruct.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTORPTFormula as 
select   RPTFormulaID
, 
RPTFormula.Name 
RPTFormula_Name 
, 
 RPTFormula.Platform  
RPTFormula_Platform_ID, 
 Func.GENERATOR_TARGET_BRIEF_F(RPTFormula.Platform) 
RPTFormula_Platform 
, 
RPTFormula.Code 
RPTFormula_Code 
, RPTFormula.InstanceID InstanceID 
, RPTFormula.RPTFormulaID ID 
, 'RPTFormula' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RPTFormula
 join INSTANCE on RPTFormula.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKRKO_DEF as 
select   PEKRKO_DEFID
, 
 PEKRKO_DEF.EmpPayed  
PEKRKO_DEF_EmpPayed_ID, 
 Func.Users_BRIEF_F(PEKRKO_DEF.EmpPayed) 
PEKRKO_DEF_EmpPayed 
, 
 PEKRKO_DEF.TheDept  
PEKRKO_DEF_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKRKO_DEF.TheDept) 
PEKRKO_DEF_TheDept 
, 
PEKRKO_DEF.TheNumber 
PEKRKO_DEF_TheNumber 
, 
 PEKRKO_DEF.FromClient  
PEKRKO_DEF_FromClient_ID, 
 Func.INSTANCE_BRIEF_F(PEKRKO_DEF.FromClient) 
PEKRKO_DEF_FromClient 
, 
PEKRKO_DEF.TheSumm 
PEKRKO_DEF_TheSumm 
, 
 PEKRKO_DEF.ThePEKZ  
PEKRKO_DEF_ThePEKZ_ID, 
 Func.INSTANCE_BRIEF_F(PEKRKO_DEF.ThePEKZ) 
PEKRKO_DEF_ThePEKZ 
, 
PEKRKO_DEF.TheComment 
PEKRKO_DEF_TheComment 
, 
PEKRKO_DEF.TheDate 
PEKRKO_DEF_TheDate 
, 
PEKRKO_DEF.Code1C 
PEKRKO_DEF_Code1C 
, PEKRKO_DEF.InstanceID InstanceID 
, PEKRKO_DEF.PEKRKO_DEFID ID 
, 'PEKRKO_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKRKO_DEF
 join INSTANCE on PEKRKO_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKRKO_ROWS as 
select   PEKRKO_ROWSID
, 
 PEKRKO_ROWS.FromClient  
PEKRKO_ROWS_FromClient_ID, 
 Func.INSTANCE_BRIEF_F(PEKRKO_ROWS.FromClient) 
PEKRKO_ROWS_FromClient 
, 
 PEKRKO_ROWS.TheDept  
PEKRKO_ROWS_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKRKO_ROWS.TheDept) 
PEKRKO_ROWS_TheDept 
, 
 PEKRKO_ROWS.TheDogovor  
PEKRKO_ROWS_TheDogovor_ID, 
 Func.INSTANCE_BRIEF_F(PEKRKO_ROWS.TheDogovor) 
PEKRKO_ROWS_TheDogovor 
, 
PEKRKO_ROWS.TheNumber 
PEKRKO_ROWS_TheNumber 
, 
PEKRKO_ROWS.TheSumm 
PEKRKO_ROWS_TheSumm 
, 
PEKRKO_ROWS.TheDate 
PEKRKO_ROWS_TheDate 
, PEKRKO_ROWS.InstanceID InstanceID 
, PEKRKO_ROWS.PEKRKO_ROWSID ID 
, 'PEKRKO_ROWS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKRKO_ROWS
 join INSTANCE on PEKRKO_ROWS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKTRF_REGALL as 
select   PEKTRF_REGALLID
, 
 PEKTRF_REGALL.WeightEDIZM  
PEKTRF_REGALL_WeightEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKTRF_REGALL.WeightEDIZM) 
PEKTRF_REGALL_WeightEDIZM 
, 
 PEKTRF_REGALL.PriceCurrency  
PEKTRF_REGALL_PriceCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(PEKTRF_REGALL.PriceCurrency) 
PEKTRF_REGALL_PriceCurrency 
, 
PEKTRF_REGALL.WeightFrom 
PEKTRF_REGALL_WeightFrom 
, 
PEKTRF_REGALL.WeightTo 
PEKTRF_REGALL_WeightTo 
, 
PEKTRF_REGALL.FixedPrice 
PEKTRF_REGALL_FixedPrice 
, 
PEKTRF_REGALL.PricePercent 
PEKTRF_REGALL_PricePercent 
, PEKTRF_REGALL.InstanceID InstanceID 
, PEKTRF_REGALL.PEKTRF_REGALLID ID 
, 'PEKTRF_REGALL' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_REGALL
 join INSTANCE on PEKTRF_REGALL.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKTRF_DECR as 
select   PEKTRF_DECRID
, 
PEKTRF_DECR.DecrPercent 
PEKTRF_DECR_DecrPercent 
, 
PEKTRF_DECR.Name 
PEKTRF_DECR_Name 
, PEKTRF_DECR.InstanceID InstanceID 
, PEKTRF_DECR.PEKTRF_DECRID ID 
, 'PEKTRF_DECR' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_DECR
 join INSTANCE on PEKTRF_DECR.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKTRF_ADDS as 
select   PEKTRF_ADDSID
, 
 PEKTRF_ADDS.Name  
PEKTRF_ADDS_Name_ID, 
 Func.PEKD_ADDS_BRIEF_F(PEKTRF_ADDS.Name) 
PEKTRF_ADDS_Name 
, 
PEKTRF_ADDS.MaxValue 
PEKTRF_ADDS_MaxValue 
, 
PEKTRF_ADDS.AddPercent 
PEKTRF_ADDS_AddPercent 
, 
PEKTRF_ADDS.MinValue 
PEKTRF_ADDS_MinValue 
, PEKTRF_ADDS.InstanceID InstanceID 
, PEKTRF_ADDS.PEKTRF_ADDSID ID 
, 'PEKTRF_ADDS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_ADDS
 join INSTANCE on PEKTRF_ADDS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKTRF_DEF as 
select   PEKTRF_DEFID
, 
 PEKTRF_DEF.TheFilial  
PEKTRF_DEF_TheFilial_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKTRF_DEF.TheFilial) 
PEKTRF_DEF_TheFilial 
, 
 PEKTRF_DEF.SupplierTarif  
PEKTRF_DEF_SupplierTarif_VAL, 
 decode(PEKTRF_DEF.SupplierTarif 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKTRF_DEF_SupplierTarif 
, 
PEKTRF_DEF.NalAdds 
PEKTRF_DEF_NalAdds 
, 
PEKTRF_DEF.EndDate 
PEKTRF_DEF_EndDate 
, 
PEKTRF_DEF.MinPPOWeight 
PEKTRF_DEF_MinPPOWeight 
, 
 PEKTRF_DEF.TType  
PEKTRF_DEF_TType_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(PEKTRF_DEF.TType) 
PEKTRF_DEF_TType 
, 
 PEKTRF_DEF.VolumeTarif  
PEKTRF_DEF_VolumeTarif_VAL, 
 decode(PEKTRF_DEF.VolumeTarif 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKTRF_DEF_VolumeTarif 
, 
PEKTRF_DEF.StartDate 
PEKTRF_DEF_StartDate 
, 
 PEKTRF_DEF.TRType  
PEKTRF_DEF_TRType_ID, 
 Func.PEKD_TRTYPE_BRIEF_F(PEKTRF_DEF.TRType) 
PEKTRF_DEF_TRType 
, 
 PEKTRF_DEF.Supplier  
PEKTRF_DEF_Supplier_ID, 
 Func.INSTANCE_BRIEF_F(PEKTRF_DEF.Supplier) 
PEKTRF_DEF_Supplier 
, 
 PEKTRF_DEF.IncludeNDS  
PEKTRF_DEF_IncludeNDS_VAL, 
 decode(PEKTRF_DEF.IncludeNDS 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKTRF_DEF_IncludeNDS 
, PEKTRF_DEF.InstanceID InstanceID 
, PEKTRF_DEF.PEKTRF_DEFID ID 
, 'PEKTRF_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_DEF
 join INSTANCE on PEKTRF_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKTRF_PEKTRF_DEF as 
select   PEKTRF_DEFID
, 
PEKTRF_DEF.StartDate 
PEKTRF_DEF_StartDate 
, 
 PEKTRF_DEF.Supplier  
PEKTRF_DEF_Supplier_ID, 
 Func.INSTANCE_BRIEF_F(PEKTRF_DEF.Supplier) 
PEKTRF_DEF_Supplier 
, 
PEKTRF_DEF.MinPPOWeight 
PEKTRF_DEF_MinPPOWeight 
, 
 PEKTRF_DEF.SupplierTarif  
PEKTRF_DEF_SupplierTarif_VAL, 
 decode(PEKTRF_DEF.SupplierTarif 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKTRF_DEF_SupplierTarif 
, 
 PEKTRF_DEF.IncludeNDS  
PEKTRF_DEF_IncludeNDS_VAL, 
 decode(PEKTRF_DEF.IncludeNDS 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKTRF_DEF_IncludeNDS 
, 
PEKTRF_DEF.EndDate 
PEKTRF_DEF_EndDate 
, 
 PEKTRF_DEF.TheFilial  
PEKTRF_DEF_TheFILIAL_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKTRF_DEF.TheFilial) 
PEKTRF_DEF_TheFILIAL 
, 
 PEKTRF_DEF.TRType  
PEKTRF_DEF_TRType_ID, 
 Func.PEKD_TRTYPE_BRIEF_F(PEKTRF_DEF.TRType) 
PEKTRF_DEF_TRType 
, 
 PEKTRF_DEF.TType  
PEKTRF_DEF_TType_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(PEKTRF_DEF.TType) 
PEKTRF_DEF_TType 
, PEKTRF_DEF.InstanceID InstanceID 
, PEKTRF_DEF.PEKTRF_DEFID ID 
, 'PEKTRF_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_DEF
 join INSTANCE on PEKTRF_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKTRF_AUTO as 
select   PEKTRF_AUTOID
, 
 PEKTRF_AUTO.ByLength  
PEKTRF_AUTO_ByLength_VAL, 
 decode(PEKTRF_AUTO.ByLength 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKTRF_AUTO_ByLength 
, 
PEKTRF_AUTO.LengthPrice 
PEKTRF_AUTO_LengthPrice 
, 
PEKTRF_AUTO.HourPrice 
PEKTRF_AUTO_HourPrice 
, 
 PEKTRF_AUTO.AutoType  
PEKTRF_AUTO_AutoType_ID, 
 Func.PEKD_AUTO_BRIEF_F(PEKTRF_AUTO.AutoType) 
PEKTRF_AUTO_AutoType 
, 
 PEKTRF_AUTO.ForTime  
PEKTRF_AUTO_ForTime_VAL, 
 decode(PEKTRF_AUTO.ForTime 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKTRF_AUTO_ForTime 
, PEKTRF_AUTO.InstanceID InstanceID 
, PEKTRF_AUTO.PEKTRF_AUTOID ID 
, 'PEKTRF_AUTO' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_AUTO
 join INSTANCE on PEKTRF_AUTO.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKTRF_PEKTRF_SRV as 
select   PEKTRF_SRVID
, 
 PEKTRF_DEF.TType  
PEKTRF_DEF_TType_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(PEKTRF_DEF.TType) 
PEKTRF_DEF_TType 
, 
PEKTRF_DEF.StartDate 
PEKTRF_DEF_StartDate 
, 
 PEKTRF_SRV.SrvTYPE  
PEKTRF_SRV_SrvTYPE_ID, 
 Func.PEKD_SRV_BRIEF_F(PEKTRF_SRV.SrvTYPE) 
PEKTRF_SRV_SrvTYPE 
, 
 PEKTRF_SRV.EDIZM  
PEKTRF_SRV_EDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKTRF_SRV.EDIZM) 
PEKTRF_SRV_EDIZM 
, 
 PEKTRF_SRV.TheCurrency  
PEKTRF_SRV_TheCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(PEKTRF_SRV.TheCurrency) 
PEKTRF_SRV_TheCurrency 
, 
PEKTRF_SRV.Quant 
PEKTRF_SRV_Quant 
, 
PEKTRF_SRV.Price 
PEKTRF_SRV_Price 
, PEKTRF_SRV.InstanceID InstanceID 
, PEKTRF_SRV.PEKTRF_SRVID ID 
, 'PEKTRF_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_SRV
 join INSTANCE on PEKTRF_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join PEKTRF_DEF ON PEKTRF_DEF.InstanceID=PEKTRF_SRV.InstanceID 
;
create or replace view V_AUTOPEKTRF_SRV as 
select   PEKTRF_SRVID
, 
 PEKTRF_SRV.EDIZM  
PEKTRF_SRV_EDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKTRF_SRV.EDIZM) 
PEKTRF_SRV_EDIZM 
, 
PEKTRF_SRV.Quant 
PEKTRF_SRV_Quant 
, 
 PEKTRF_SRV.TheCurrency  
PEKTRF_SRV_TheCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(PEKTRF_SRV.TheCurrency) 
PEKTRF_SRV_TheCurrency 
, 
 PEKTRF_SRV.SrvTYPE  
PEKTRF_SRV_SrvTYPE_ID, 
 Func.PEKD_SRV_BRIEF_F(PEKTRF_SRV.SrvTYPE) 
PEKTRF_SRV_SrvTYPE 
, 
PEKTRF_SRV.Price 
PEKTRF_SRV_Price 
, PEKTRF_SRV.InstanceID InstanceID 
, PEKTRF_SRV.PEKTRF_SRVID ID 
, 'PEKTRF_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_SRV
 join INSTANCE on PEKTRF_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKTRF_TR as 
select   PEKTRF_TRID
, 
 PEKTRF_TR.TheCurrency  
PEKTRF_TR_TheCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(PEKTRF_TR.TheCurrency) 
PEKTRF_TR_TheCurrency 
, 
 PEKTRF_TR.Train  
PEKTRF_TR_Train_ID, 
 Func.PEKD_DIRECTION_BRIEF_F(PEKTRF_TR.Train) 
PEKTRF_TR_Train 
, 
 PEKTRF_TR.ToST  
PEKTRF_TR_ToST_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(PEKTRF_TR.ToST) 
PEKTRF_TR_ToST 
, 
PEKTRF_TR.Price 
PEKTRF_TR_Price 
, 
PEKTRF_TR.TheQuantity 
PEKTRF_TR_TheQuantity 
, 
 PEKTRF_TR.EDIZM  
PEKTRF_TR_EDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKTRF_TR.EDIZM) 
PEKTRF_TR_EDIZM 
, PEKTRF_TR.InstanceID InstanceID 
, PEKTRF_TR.PEKTRF_TRID ID 
, 'PEKTRF_TR' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_TR
 join INSTANCE on PEKTRF_TR.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKTRF_PEKTRF_TR as 
select   PEKTRF_TRID
, 
 PEKTRF_TR.ToST  
PEKTRF_TR_ToST_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(PEKTRF_TR.ToST) 
PEKTRF_TR_ToST 
, 
PEKTRF_DEF.StartDate 
PEKTRF_DEF_StartDate 
, 
 PEKTRF_DEF.TType  
PEKTRF_DEF_TType_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(PEKTRF_DEF.TType) 
PEKTRF_DEF_TType 
, 
PEKTRF_TR.Price 
PEKTRF_TR_Price 
, 
 PEKTRF_TR.EDIZM  
PEKTRF_TR_EDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKTRF_TR.EDIZM) 
PEKTRF_TR_EDIZM 
, 
 PEKTRF_TR.TheCurrency  
PEKTRF_TR_TheCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(PEKTRF_TR.TheCurrency) 
PEKTRF_TR_TheCurrency 
, 
 PEKTRF_TR.Train  
PEKTRF_TR__ID, 
 Func.PEKD_DIRECTION_BRIEF_F(PEKTRF_TR.Train) 
PEKTRF_TR_ 
, PEKTRF_TR.InstanceID InstanceID 
, PEKTRF_TR.PEKTRF_TRID ID 
, 'PEKTRF_TR' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_TR
 join INSTANCE on PEKTRF_TR.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join PEKTRF_DEF ON PEKTRF_DEF.InstanceID=PEKTRF_TR.InstanceID 
;
create or replace view V_AUTOPEKTRF_REGRTR as 
select   PEKTRF_REGRTRID,PEKTRF_TRID
, 
PEKTRF_REGRTR.PricePercent 
PEKTRF_REGRTR_PricePercent 
, 
 PEKTRF_REGRTR.WeightEDIZM  
PEKTRF_REGRTR_WeightEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKTRF_REGRTR.WeightEDIZM) 
PEKTRF_REGRTR_WeightEDIZM 
, 
PEKTRF_REGRTR.WeightTo 
PEKTRF_REGRTR_WeightTo 
, 
 PEKTRF_REGRTR.PriceCurrency  
PEKTRF_REGRTR_PriceCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(PEKTRF_REGRTR.PriceCurrency) 
PEKTRF_REGRTR_PriceCurrency 
, 
PEKTRF_REGRTR.WeightFrom 
PEKTRF_REGRTR_WeightFrom 
, 
PEKTRF_REGRTR.FixedPrice 
PEKTRF_REGRTR_FixedPrice 
, PEKTRF_TR.InstanceID InstanceID 
, PEKTRF_REGRTR.PEKTRF_REGRTRID ID 
, 'PEKTRF_REGRTR' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKTRF_REGRTR
 join PEKTRF_TR on PEKTRF_TR.PEKTRF_TRID=PEKTRF_REGRTR.ParentStructRowID 
 join INSTANCE on PEKTRF_TR.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKCL_DEF as 
select   PEKCL_DEFID
, 
 PEKCL_DEF.TheDep  
PEKCL_DEF_TheDep_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKCL_DEF.TheDep) 
PEKCL_DEF_TheDep 
, 
PEKCL_DEF.LimDate 
PEKCL_DEF_LimDate 
, PEKCL_DEF.InstanceID InstanceID 
, PEKCL_DEF.PEKCL_DEFID ID 
, 'PEKCL_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKCL_DEF
 join INSTANCE on PEKCL_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKCL_PEKCL_DEF as 
select   PEKCL_DEFID
, 
PEKCL_DEF.LimDate 
PEKCL_DEF_LimDate 
, 
 PEKCL_DEF.TheDep  
PEKCL_DEF_TheDep_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKCL_DEF.TheDep) 
PEKCL_DEF_TheDep 
, PEKCL_DEF.InstanceID InstanceID 
, PEKCL_DEF.PEKCL_DEFID ID 
, 'PEKCL_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKCL_DEF
 join INSTANCE on PEKCL_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKCL_DAYLY as 
select   PEKCL_DAYLYID
, 
 PEKCL_DAYLY.Train  
PEKCL_DAYLY_Train_ID, 
 Func.PEKD_TRAINS_BRIEF_F(PEKCL_DAYLY.Train) 
PEKCL_DAYLY_Train 
, 
PEKCL_DAYLY.WeightValue 
PEKCL_DAYLY_WeightValue 
, 
PEKCL_DAYLY.the_Description 
PEKCL_DAYLY_the_Description 
, 
 PEKCL_DAYLY.GOTYPE  
PEKCL_DAYLY_GOTYPE_ID, 
 Func.PEKD_GOTYPE_BRIEF_F(PEKCL_DAYLY.GOTYPE) 
PEKCL_DAYLY_GOTYPE 
, 
 PEKCL_DAYLY.ValueEDIZM  
PEKCL_DAYLY_ValueEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKCL_DAYLY.ValueEDIZM) 
PEKCL_DAYLY_ValueEDIZM 
, 
PEKCL_DAYLY.TheValue 
PEKCL_DAYLY_TheValue 
, 
 PEKCL_DAYLY.WeightEDIZM  
PEKCL_DAYLY_WeightEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKCL_DAYLY.WeightEDIZM) 
PEKCL_DAYLY_WeightEDIZM 
, PEKCL_DAYLY.InstanceID InstanceID 
, PEKCL_DAYLY.PEKCL_DAYLYID ID 
, 'PEKCL_DAYLY' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKCL_DAYLY
 join INSTANCE on PEKCL_DAYLY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKL_TOLOAD as 
select   PEKL_TOLOADID,PEKCL_DAYLYID
, 
PEKL_TOLOAD.WeightValue 
PEKL_TOLOAD_WeightValue 
, 
 PEKL_TOLOAD.ValueEDIZM  
PEKL_TOLOAD_ValueEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKL_TOLOAD.ValueEDIZM) 
PEKL_TOLOAD_ValueEDIZM 
, 
 PEKL_TOLOAD.WeightEDIZM  
PEKL_TOLOAD_WeightEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKL_TOLOAD.WeightEDIZM) 
PEKL_TOLOAD_WeightEDIZM 
, 
 PEKL_TOLOAD.SRCPekZ  
PEKL_TOLOAD_SRCPekZ_ID, 
 Func.INSTANCE_BRIEF_F(PEKL_TOLOAD.SRCPekZ) 
PEKL_TOLOAD_SRCPekZ 
, 
PEKL_TOLOAD.TheValue 
PEKL_TOLOAD_TheValue 
, PEKCL_DAYLY.InstanceID InstanceID 
, PEKL_TOLOAD.PEKL_TOLOADID ID 
, 'PEKL_TOLOAD' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKL_TOLOAD
 join PEKCL_DAYLY on PEKCL_DAYLY.PEKCL_DAYLYID=PEKL_TOLOAD.ParentStructRowID 
 join INSTANCE on PEKCL_DAYLY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewMTZExt_MTZExt_def as 
select   MTZExt_defID
, 
MTZExt_def.TheDescription 
MTZExt_def_TheDescription 
, 
 MTZExt_def.ExtType  
MTZExt_def_ExtType_VAL, 
 decode(MTZExt_def.ExtType 
, 1 ,'OnFormExt'
, 7 ,'CodeGenerator'
, 3 ,'JrnlAddExt'
, 6 ,'VerifyRowExt'
, 0 ,'StatusExt'
, 8 ,'ARMGenerator'
, 5 ,'DefaultExt'
, 2 ,'CustomExt'
, 4 ,'JrnlRunExt'
, '???') 
MTZExt_def_ExtType 
, 
MTZExt_def.Name 
MTZExt_def_Name 
, MTZExt_def.InstanceID InstanceID 
, MTZExt_def.MTZExt_defID ID 
, 'MTZExt_def' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZExt_def
 join INSTANCE on MTZExt_def.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOMTZExt_def as 
select   MTZExt_defID
, 
MTZExt_def.Name 
MTZExt_def_Name 
, 
MTZExt_def.TheDescription 
MTZExt_def_TheDescription 
, 
 MTZExt_def.ExtType  
MTZExt_def_ExtType_VAL, 
 decode(MTZExt_def.ExtType 
, 1 ,'OnFormExt'
, 7 ,'CodeGenerator'
, 3 ,'JrnlAddExt'
, 6 ,'VerifyRowExt'
, 0 ,'StatusExt'
, 8 ,'ARMGenerator'
, 5 ,'DefaultExt'
, 2 ,'CustomExt'
, 4 ,'JrnlRunExt'
, '???') 
MTZExt_def_ExtType 
, MTZExt_def.InstanceID InstanceID 
, MTZExt_def.MTZExt_defID ID 
, 'MTZExt_def' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZExt_def
 join INSTANCE on MTZExt_def.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOMTZExtRel as 
select   MTZExtRelID
, 
MTZExtRel.TheLibraryName 
MTZExtRel_TheLibraryName 
, 
 MTZExtRel.ThePlatform  
MTZExtRel_ThePlatform_VAL, 
 decode(MTZExtRel.ThePlatform 
, 2 ,'JAVA'
, 3 ,'OTHER'
, 1 ,'DOTNET'
, 0 ,'VB6'
, '???') 
MTZExtRel_ThePlatform 
, 
MTZExtRel.TheClassName 
MTZExtRel_TheClassName 
, MTZExtRel.InstanceID InstanceID 
, MTZExtRel.MTZExtRelID ID 
, 'MTZExtRel' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZExtRel
 join INSTANCE on MTZExtRel.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOInfoStoreDef as 
select   InfoStoreDefID
, 
 InfoStoreDef.TheGroup  
InfoStoreDef_TheGroup_ID, 
 Func.Groups_BRIEF_F(InfoStoreDef.TheGroup) 
InfoStoreDef_TheGroup 
, 
 InfoStoreDef.InfoStoreType  
InfoStoreDef_InfoStoreType_VAL, 
 decode(InfoStoreDef.InfoStoreType 
, 2 ,'Групповой'
, 1 ,'Персональный'
, 0 ,' Общий'
, '???') 
InfoStoreDef_InfoStoreType 
, 
 InfoStoreDef.TheUser  
InfoStoreDef_TheUser_ID, 
 Func.Users_BRIEF_F(InfoStoreDef.TheUser) 
InfoStoreDef_TheUser 
, 
InfoStoreDef.Name 
InfoStoreDef_Name 
, InfoStoreDef.InstanceID InstanceID 
, InfoStoreDef.InfoStoreDefID ID 
, 'InfoStoreDef' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from InfoStoreDef
 join INSTANCE on InfoStoreDef.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewSTDInfoStore_Folder as 
select   FolderID
, 
 InfoStoreDef.TheUser  
InfoStoreDef_TheUser_ID, 
 Func.Users_BRIEF_F(InfoStoreDef.TheUser) 
InfoStoreDef_TheUser 
, 
 InfoStoreDef.TheGroup  
InfoStoreDef_TheGroup_ID, 
 Func.Groups_BRIEF_F(InfoStoreDef.TheGroup) 
InfoStoreDef_TheGroup 
, 
 InfoStoreDef.InfoStoreType  
InfoStoreDef_InfoStoreType_VAL, 
 decode(InfoStoreDef.InfoStoreType 
, 2 ,'Групповой'
, 1 ,'Персональный'
, 0 ,' Общий'
, '???') 
InfoStoreDef_InfoStoreType 
, 
InfoStoreDef.Name 
InfoStoreDef_Name 
, 
Folder.Name 
Folder_Name 
, 
 Folder.FolderType  
Folder_FolderType_VAL, 
 decode(Folder.FolderType 
, 2 ,'Исходящие'
, 10 ,'Завершенные'
, 5 ,'Календарь'
, 0 ,' '
, 1 ,'Входящие'
, 9 ,'Отложенные'
, 4 ,'Журнал'
, 8 ,'В работе'
, 7 ,'Черновики'
, 6 ,'Отправленные'
, 3 ,'Удаленные'
, '???') 
Folder_FolderType 
, Folder.InstanceID InstanceID 
, Folder.FolderID ID 
, 'Folder' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Folder
 join INSTANCE on Folder.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join InfoStoreDef ON InfoStoreDef.InstanceID=Folder.InstanceID 
;
create or replace view V_AUTOFolder as 
select   FolderID
, 
 Folder.FolderType  
Folder_FolderType_VAL, 
 decode(Folder.FolderType 
, 2 ,'Исходящие'
, 10 ,'Завершенные'
, 5 ,'Календарь'
, 0 ,' '
, 1 ,'Входящие'
, 9 ,'Отложенные'
, 4 ,'Журнал'
, 8 ,'В работе'
, 7 ,'Черновики'
, 6 ,'Отправленные'
, 3 ,'Удаленные'
, '???') 
Folder_FolderType 
, 
Folder.Name 
Folder_Name 
, Folder.InstanceID InstanceID 
, Folder.FolderID ID 
, 'Folder' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Folder
 join INSTANCE on Folder.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOShortcut as 
select   ShortcutID,FolderID
, 
 Shortcut.DocItem  
Shortcut_DocItem_ID, 
 Func.INSTANCE_BRIEF_F(Shortcut.DocItem) 
Shortcut_DocItem 
, 
Shortcut.StartMode 
Shortcut_StartMode 
, Folder.InstanceID InstanceID 
, Shortcut.ShortcutID ID 
, 'Shortcut' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Shortcut
 join Folder on Folder.FolderID=Shortcut.ParentStructRowID 
 join INSTANCE on Folder.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKP_DEF as 
select   PEKP_DEFID
, 
 PEKP_DEF.FromClient  
PEKP_DEF_FromClient_ID, 
 Func.INSTANCE_BRIEF_F(PEKP_DEF.FromClient) 
PEKP_DEF_FromClient 
, 
 PEKP_DEF.TheDogovor  
PEKP_DEF_TheDogovor_ID, 
 Func.INSTANCE_BRIEF_F(PEKP_DEF.TheDogovor) 
PEKP_DEF_TheDogovor 
, 
PEKP_DEF.PLPDate 
PEKP_DEF_PLPDate 
, 
PEKP_DEF.Code1C 
PEKP_DEF_Code1C 
, 
 PEKP_DEF.TheCurrncy  
PEKP_DEF_TheCurrncy_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(PEKP_DEF.TheCurrncy) 
PEKP_DEF_TheCurrncy 
, 
PEKP_DEF.PLPSumm 
PEKP_DEF_PLPSumm 
, 
 PEKP_DEF.TheDept  
PEKP_DEF_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKP_DEF.TheDept) 
PEKP_DEF_TheDept 
, 
PEKP_DEF.PLPNUM 
PEKP_DEF_PLPNUM 
, 
PEKP_DEF.TheComment 
PEKP_DEF_TheComment 
, PEKP_DEF.InstanceID InstanceID 
, PEKP_DEF.PEKP_DEFID ID 
, 'PEKP_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKP_DEF
 join INSTANCE on PEKP_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKP_PEKP_DEF as 
select   PEKP_DEFID
, 
PEKP_DEF.PLPNUM 
PEKP_DEF_PLPNUM 
, 
PEKP_DEF.PLPDate 
PEKP_DEF_PLPDate 
, 
 PEKP_DEF.TheCurrncy  
PEKP_DEF_TheCurrncy_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(PEKP_DEF.TheCurrncy) 
PEKP_DEF_TheCurrncy 
, 
PEKP_DEF.TheComment 
PEKP_DEF_TheComment 
, 
 PEKP_DEF.TheDogovor  
PEKP_DEF_TheDogovor_ID, 
 Func.INSTANCE_BRIEF_F(PEKP_DEF.TheDogovor) 
PEKP_DEF_TheDogovor 
, 
PEKP_DEF.PLPSumm 
PEKP_DEF_PLPSumm 
, 
 PEKP_DEF.FromClient  
PEKP_DEF_FromClient_ID, 
 Func.INSTANCE_BRIEF_F(PEKP_DEF.FromClient) 
PEKP_DEF_FromClient 
, 
 PEKP_DEF.TheDept  
PEKP_DEF_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKP_DEF.TheDept) 
PEKP_DEF_TheDept 
, 
PEKP_DEF.Code1C 
PEKP_DEF_Code1C 
, PEKP_DEF.InstanceID InstanceID 
, PEKP_DEF.PEKP_DEFID ID 
, 'PEKP_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKP_DEF
 join INSTANCE on PEKP_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKP_PZ as 
select   PEKP_PZID
, 
PEKP_PZ.TheSumm 
PEKP_PZ_TheSumm 
, 
 PEKP_PZ.PZ  
PEKP_PZ_PZ_ID, 
 Func.INSTANCE_BRIEF_F(PEKP_PZ.PZ) 
PEKP_PZ_PZ 
, PEKP_PZ.InstanceID InstanceID 
, PEKP_PZ.PEKP_PZID ID 
, 'PEKP_PZ' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKP_PZ
 join INSTANCE on PEKP_PZ.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindUsers as 
select   UsersID
, 
Users.LocalPhone 
Users_LocalPhone 
, 
Users.Family 
Users_Family 
, 
Users.SurName 
Users_SurName 
, 
Users.MobilePhone 
Users_MobilePhone 
, 
Users.EMail 
Users_EMail 
, 
Users.Phone 
Users_Phone 
, 
Users.Name 
Users_Name 
, Users.InstanceID InstanceID 
, Users.UsersID ID 
, 'Users' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Users
 join INSTANCE on Users.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOUsers as 
select   UsersID
, 
Users.Photo 
Users_Photo 
, 
Users.CertData 
Users_CertData 
, 
Users.Password 
Users_Password 
, 
 Users.PersonaData  
Users_PersonaData_ID, 
 Func.INSTANCE_BRIEF_F(Users.PersonaData) 
Users_PersonaData 
, 
Users.CertificateID 
Users_CertificateID 
, 
Users.DomaiName 
Users_DomaiName 
, 
Users.LocalPhone 
Users_LocalPhone 
, 
 Users.Activity  
Users_Activity_ID, 
 Func.INSTANCE_BRIEF_F(Users.Activity) 
Users_Activity 
, 
Users.MobilePhone 
Users_MobilePhone 
, 
 Users.ClientDef  
Users_ClientDef_ID, 
 Func.INSTANCE_BRIEF_F(Users.ClientDef) 
Users_ClientDef 
, 
Users.SurName 
Users_SurName 
, 
Users.BirthDay 
Users_BirthDay 
, 
Users.Phone 
Users_Phone 
, 
Users.Family 
Users_Family 
, 
Users.EMail 
Users_EMail 
, 
Users.Login 
Users_Login 
, 
Users.Name 
Users_Name 
, Users.InstanceID InstanceID 
, Users.UsersID ID 
, 'Users' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Users
 join INSTANCE on Users.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOGroups as 
select   GroupsID
, 
Groups.Name 
Groups_Name 
, Groups.InstanceID InstanceID 
, Groups.GroupsID ID 
, 'Groups' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Groups
 join INSTANCE on Groups.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindGroups as 
select   GroupsID
, 
Groups.Name 
Groups_Name 
, Groups.InstanceID InstanceID 
, Groups.GroupsID ID 
, 'Groups' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Groups
 join INSTANCE on Groups.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewMTZUsers_GroupUser as 
select   GroupUserID,GroupsID
, 
 GroupUser.TheUser  
GroupUser_TheUser_ID, 
 Func.Users_BRIEF_F(GroupUser.TheUser) 
GroupUser_TheUser 
, 
Groups.Name 
Groups_Name 
, Groups.InstanceID InstanceID 
, GroupUser.GroupUserID ID 
, 'GroupUser' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from GroupUser
 join Groups on Groups.GroupsID=GroupUser.ParentStructRowID 
 join INSTANCE on Groups.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOGroupUser as 
select   GroupUserID,GroupsID
, 
 GroupUser.TheUser  
GroupUser_TheUser_ID, 
 Func.Users_BRIEF_F(GroupUser.TheUser) 
GroupUser_TheUser 
, Groups.InstanceID InstanceID 
, GroupUser.GroupUserID ID 
, 'GroupUser' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from GroupUser
 join Groups on Groups.GroupsID=GroupUser.ParentStructRowID 
 join INSTANCE on Groups.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindVRDDogSatge as 
select   VRDContractStageID
, 
VRDContractStage.Name 
VRDContractStage_Name 
, VRDContractStage.InstanceID InstanceID 
, VRDContractStage.VRDContractStageID ID 
, 'VRDContractStage' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDContractStage
 join INSTANCE on VRDContractStage.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDContractStage as 
select   VRDContractStageID
, 
VRDContractStage.Name 
VRDContractStage_Name 
, VRDContractStage.InstanceID InstanceID 
, VRDContractStage.VRDContractStageID ID 
, 'VRDContractStage' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDContractStage
 join INSTANCE on VRDContractStage.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDRreportType as 
select   VRDRreportTypeID
, 
VRDRreportType.Name 
VRDRreportType_Name 
, VRDRreportType.InstanceID InstanceID 
, VRDRreportType.VRDRreportTypeID ID 
, 'VRDRreportType' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDRreportType
 join INSTANCE on VRDRreportType.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewVRD_VRDRreportType as 
select   VRDRreportTypeID
, 
VRDRreportType.Name 
VRDRreportType_Name 
, VRDRreportType.InstanceID InstanceID 
, VRDRreportType.VRDRreportTypeID ID 
, 'VRDRreportType' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDRreportType
 join INSTANCE on VRDRreportType.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDPrjType as 
select   VRDPrjTypeID
, 
VRDPrjType.Name 
VRDPrjType_Name 
, VRDPrjType.InstanceID InstanceID 
, VRDPrjType.VRDPrjTypeID ID 
, 'VRDPrjType' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDPrjType
 join INSTANCE on VRDPrjType.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewVRDPrjType as 
select   VRDPrjTypeID
, 
VRDPrjType.Name 
VRDPrjType_Name 
, VRDPrjType.InstanceID InstanceID 
, VRDPrjType.VRDPrjTypeID ID 
, 'VRDPrjType' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDPrjType
 join INSTANCE on VRDPrjType.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_findVRDStream as 
select   VRDStreamID
, 
VRDStream.Name 
VRDStream_Name 
, VRDStream.InstanceID InstanceID 
, VRDStream.VRDStreamID ID 
, 'VRDStream' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDStream
 join INSTANCE on VRDStream.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDStream as 
select   VRDStreamID
, 
VRDStream.Name 
VRDStream_Name 
, VRDStream.InstanceID InstanceID 
, VRDStream.VRDStreamID ID 
, 'VRDStream' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDStream
 join INSTANCE on VRDStream.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindVRDInterest as 
select   VRDInterestID
, 
VRDInterest.Name 
VRDInterest_Name 
, VRDInterest.InstanceID InstanceID 
, VRDInterest.VRDInterestID ID 
, 'VRDInterest' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDInterest
 join INSTANCE on VRDInterest.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDInterest as 
select   VRDInterestID
, 
VRDInterest.Name 
VRDInterest_Name 
, VRDInterest.InstanceID InstanceID 
, VRDInterest.VRDInterestID ID 
, 'VRDInterest' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDInterest
 join INSTANCE on VRDInterest.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDDocType as 
select   VRDDocTypeID
, 
VRDDocType.Name 
VRDDocType_Name 
, VRDDocType.InstanceID InstanceID 
, VRDDocType.VRDDocTypeID ID 
, 'VRDDocType' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDDocType
 join INSTANCE on VRDDocType.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewVRDDocType as 
select   VRDDocTypeID
, 
VRDDocType.Name 
VRDDocType_Name 
, VRDDocType.InstanceID InstanceID 
, VRDDocType.VRDDocTypeID ID 
, 'VRDDocType' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDDocType
 join INSTANCE on VRDDocType.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDLoyalty as 
select   VRDLoyaltyID
, 
VRDLoyalty.the_Level 
VRDLoyalty_the_Level 
, VRDLoyalty.InstanceID InstanceID 
, VRDLoyalty.VRDLoyaltyID ID 
, 'VRDLoyalty' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDLoyalty
 join INSTANCE on VRDLoyalty.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindVRDLoyalty as 
select   VRDLoyaltyID
, 
VRDLoyalty.the_Level 
VRDLoyalty_Level 
, VRDLoyalty.InstanceID InstanceID 
, VRDLoyalty.VRDLoyaltyID ID 
, 'VRDLoyalty' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDLoyalty
 join INSTANCE on VRDLoyalty.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewVRD_VRDMarket as 
select   VRDMarketID
, 
VRDMarket.Name 
VRDMarket_Name 
, VRDMarket.InstanceID InstanceID 
, VRDMarket.VRDMarketID ID 
, 'VRDMarket' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDMarket
 join INSTANCE on VRDMarket.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRDMarket as 
select   VRDMarketID
, 
VRDMarket.Name 
VRDMarket_Name 
, VRDMarket.InstanceID InstanceID 
, VRDMarket.VRDMarketID ID 
, 'VRDMarket' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRDMarket
 join INSTANCE on VRDMarket.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_FindMTZSEC_RIGHT as 
select   MTZSEC_RIGHTID
, 
MTZSEC_RIGHT.ProtectedItem 
MTZSEC_RIGHT_ProtectedItem 
, 
MTZSEC_RIGHT.Piority 
MTZSEC_RIGHT_Piority 
, 
 MTZSEC_RIGHT.Allow  
MTZSEC_RIGHT_Allow_VAL, 
 decode(MTZSEC_RIGHT.Allow 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZSEC_RIGHT_Allow 
, 
 MTZSEC_RIGHT.TheGroup  
MTZSEC_RIGHT_TheGroup_ID, 
 Func.Groups_BRIEF_F(MTZSEC_RIGHT.TheGroup) 
MTZSEC_RIGHT_TheGroup 
, MTZSEC_RIGHT.InstanceID InstanceID 
, MTZSEC_RIGHT.MTZSEC_RIGHTID ID 
, 'MTZSEC_RIGHT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZSEC_RIGHT
 join INSTANCE on MTZSEC_RIGHT.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOMTZSEC_RIGHT as 
select   MTZSEC_RIGHTID
, 
 MTZSEC_RIGHT.TheGroup  
MTZSEC_RIGHT_TheGroup_ID, 
 Func.Groups_BRIEF_F(MTZSEC_RIGHT.TheGroup) 
MTZSEC_RIGHT_TheGroup 
, 
 MTZSEC_RIGHT.Allow  
MTZSEC_RIGHT_Allow_VAL, 
 decode(MTZSEC_RIGHT.Allow 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZSEC_RIGHT_Allow 
, 
MTZSEC_RIGHT.Piority 
MTZSEC_RIGHT_Piority 
, 
MTZSEC_RIGHT.ProtectedItem 
MTZSEC_RIGHT_ProtectedItem 
, MTZSEC_RIGHT.InstanceID InstanceID 
, MTZSEC_RIGHT.MTZSEC_RIGHTID ID 
, 'MTZSEC_RIGHT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZSEC_RIGHT
 join INSTANCE on MTZSEC_RIGHT.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCAccounts as 
select   VRCAccountsID
, 
 VRCAccounts.BANK  
VRCAccounts_BANK_ID, 
 Func.ENTDIC_BANK_BRIEF_F(VRCAccounts.BANK) 
VRCAccounts_BANK 
, 
VRCAccounts.Code1C 
VRCAccounts_Code1C 
, 
 VRCAccounts.DefaultAccount  
VRCAccounts_DefaultAccount_VAL, 
 decode(VRCAccounts.DefaultAccount 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRCAccounts_DefaultAccount 
, 
VRCAccounts.fillial 
VRCAccounts_fillial 
, 
VRCAccounts.acc 
VRCAccounts_acc 
, VRCAccounts.InstanceID InstanceID 
, VRCAccounts.VRCAccountsID ID 
, 'VRCAccounts' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCAccounts
 join INSTANCE on VRCAccounts.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCTorg as 
select   VRCTorgID
, 
VRCTorg.name 
VRCTorg_name 
, 
VRCTorg.Address 
VRCTorg_Address 
, 
 VRCTorg.Town  
VRCTorg_Town_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(VRCTorg.Town) 
VRCTorg_Town 
, VRCTorg.InstanceID InstanceID 
, VRCTorg.VRCTorgID ID 
, 'VRCTorg' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCTorg
 join INSTANCE on VRCTorg.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCAditional as 
select   VRCAditionalID
, 
VRCAditional.regsved 
VRCAditional_regsved 
, 
VRCAditional.KPP 
VRCAditional_KPP 
, 
VRCAditional.uraddr 
VRCAditional_uraddr 
, 
 VRCAditional.regby  
VRCAditional_regby_ID, 
 Func.Users_BRIEF_F(VRCAditional.regby) 
VRCAditional_regby 
, 
VRCAditional.townphonecode 
VRCAditional_townphonecode 
, 
VRCAditional.mobTelephone 
VRCAditional_mobTelephone 
, 
 VRCAditional.Stream  
VRCAditional_Stream_ID, 
 Func.VRDStream_BRIEF_F(VRCAditional.Stream) 
VRCAditional_Stream 
, 
VRCAditional.maxcreditlen 
VRCAditional_maxcreditlen 
, 
VRCAditional.phone2 
VRCAditional_phone2 
, 
 VRCAditional.Concurent  
VRCAditional_Concurent_VAL, 
 decode(VRCAditional.Concurent 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRCAditional_Concurent 
, 
 VRCAditional.prnActWork  
VRCAditional_prnActWork_VAL, 
 decode(VRCAditional.prnActWork 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRCAditional_prnActWork 
, 
VRCAditional.OKPO 
VRCAditional_OKPO 
, 
VRCAditional.WEBSite 
VRCAditional_WEBSite 
, 
VRCAditional.OKONH 
VRCAditional_OKONH 
, 
VRCAditional.regdate 
VRCAditional_regdate 
, 
VRCAditional.district 
VRCAditional_district 
, 
 VRCAditional.Country  
VRCAditional_Country_ID, 
 Func.ENTDIC_COUNTRY_BRIEF_F(VRCAditional.Country) 
VRCAditional_Country 
, 
VRCAditional.creditlimit 
VRCAditional_creditlimit 
, 
 VRCAditional.town  
VRCAditional_town_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(VRCAditional.town) 
VRCAditional_town 
, 
VRCAditional.urphone 
VRCAditional_urphone 
, 
VRCAditional.POSTINDEX 
VRCAditional_POSTINDEX 
, 
VRCAditional.eMail 
VRCAditional_eMail 
, VRCAditional.InstanceID InstanceID 
, VRCAditional.VRCAditionalID ID 
, 'VRCAditional' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCAditional
 join INSTANCE on VRCAditional.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCTarif as 
select   VRCTarifID
, 
 VRCTarif.TheDept  
VRCTarif_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(VRCTarif.TheDept) 
VRCTarif_TheDept 
, 
 VRCTarif.TheTarifType  
VRCTarif_TheTarifType_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(VRCTarif.TheTarifType) 
VRCTarif_TheTarifType 
, VRCTarif.InstanceID InstanceID 
, VRCTarif.VRCTarifID ID 
, 'VRCTarif' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCTarif
 join INSTANCE on VRCTarif.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewVRC_VRCCommonInfo as 
select   VRCCommonInfoID
, 
VRCCommonInfo.fullname 
VRCCommonInfo_fullname 
, 
VRCAditional.regdate 
VRCAditional_regdate 
, 
VRCCommonInfo.Phone 
VRCCommonInfo_Phone 
, 
VRCCommonInfo.the_Comment 
VRCCommonInfo_the_Comment 
, 
VRCAditional.townphonecode 
VRCAditional_townphonecode 
, 
VRCAditional.OKONH 
VRCAditional_OKONH 
, 
 VRCCommonInfo.Curator  
VRCCommonInfo_Curator_ID, 
 Func.Users_BRIEF_F(VRCCommonInfo.Curator) 
VRCCommonInfo_Curator 
, 
VRCAditional.creditlimit 
VRCAditional_creditlimit 
, 
 VRCAditional.Country  
VRCAditional_Country_ID, 
 Func.ENTDIC_COUNTRY_BRIEF_F(VRCAditional.Country) 
VRCAditional_Country 
, 
VRCCommonInfo.Name 
VRCCommonInfo_Name 
, 
VRCCommonInfo.INN 
VRCCommonInfo_INN 
, 
VRCAditional.OKPO 
VRCAditional_OKPO 
, 
VRCCommonInfo.fax 
VRCCommonInfo_fax 
, 
 VRCCommonInfo.Transporter  
VRCCommonInfo_Transporter_VAL, 
 decode(VRCCommonInfo.Transporter 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRCCommonInfo_Transporter 
, 
VRCAditional.POSTINDEX 
VRCAditional_POSTINDEX 
, 
VRCAditional.maxcreditlen 
VRCAditional_maxcreditlen 
, 
VRCAditional.urphone 
VRCAditional_urphone 
, 
VRCAditional.phone2 
VRCAditional_phone2 
, 
 VRCAditional.regby  
VRCAditional_regby_ID, 
 Func.Users_BRIEF_F(VRCAditional.regby) 
VRCAditional_regby 
, 
VRCAditional.uraddr 
VRCAditional_uraddr 
, 
 VRCAditional.Stream  
VRCAditional_Stream_ID, 
 Func.VRDStream_BRIEF_F(VRCAditional.Stream) 
VRCAditional_Stream 
, 
VRCAditional.WEBSite 
VRCAditional_WEBSite 
, 
 VRCAditional.Concurent  
VRCAditional_Concurent_VAL, 
 decode(VRCAditional.Concurent 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRCAditional_Concurent 
, 
VRCAditional.district 
VRCAditional_district 
, 
VRCCommonInfo.Address 
VRCCommonInfo_Address 
, 
 VRCAditional.town  
VRCAditional_town_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(VRCAditional.town) 
VRCAditional_town 
, 
VRCAditional.regsved 
VRCAditional_regsved 
, VRCCommonInfo.InstanceID InstanceID 
, VRCCommonInfo.VRCCommonInfoID ID 
, 'VRCCommonInfo' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCCommonInfo
 join INSTANCE on VRCCommonInfo.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join VRCAditional ON VRCAditional.InstanceID=VRCCommonInfo.InstanceID 
;
create or replace view V_AUTOVRCCommonInfo as 
select   VRCCommonInfoID
, 
VRCCommonInfo.fax 
VRCCommonInfo_fax 
, 
 VRCCommonInfo.Transporter  
VRCCommonInfo_Transporter_VAL, 
 decode(VRCCommonInfo.Transporter 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRCCommonInfo_Transporter 
, 
VRCCommonInfo.Address 
VRCCommonInfo_Address 
, 
VRCCommonInfo.Code1C 
VRCCommonInfo_Code1C 
, 
VRCCommonInfo.PassportInfo 
VRCCommonInfo_PassportInfo 
, 
VRCCommonInfo.Phone 
VRCCommonInfo_Phone 
, 
 VRCCommonInfo.Curator  
VRCCommonInfo_Curator_ID, 
 Func.Users_BRIEF_F(VRCCommonInfo.Curator) 
VRCCommonInfo_Curator 
, 
VRCCommonInfo.Name 
VRCCommonInfo_Name 
, 
 VRCCommonInfo.IsPhizical  
VRCCommonInfo_IsPhizical_VAL, 
 decode(VRCCommonInfo.IsPhizical 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRCCommonInfo_IsPhizical 
, 
VRCCommonInfo.fullname 
VRCCommonInfo_fullname 
, 
VRCCommonInfo.INN 
VRCCommonInfo_INN 
, 
VRCCommonInfo.the_Comment 
VRCCommonInfo_the_Comment 
, 
VRCCommonInfo.KPP 
VRCCommonInfo_KPP 
, VRCCommonInfo.InstanceID InstanceID 
, VRCCommonInfo.VRCCommonInfoID ID 
, 'VRCCommonInfo' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCCommonInfo
 join INSTANCE on VRCCommonInfo.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOROLES_USER as 
select   ROLES_USERID
, 
 ROLES_USER.TheUser  
ROLES_USER_TheUser_ID, 
 Func.Users_BRIEF_F(ROLES_USER.TheUser) 
ROLES_USER_TheUser 
, ROLES_USER.InstanceID InstanceID 
, ROLES_USER.ROLES_USERID ID 
, 'ROLES_USER' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_USER
 join INSTANCE on ROLES_USER.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOROLES_MAP as 
select   ROLES_MAPID
, 
 ROLES_MAP.TheGroup  
ROLES_MAP_TheGroup_ID, 
 Func.Groups_BRIEF_F(ROLES_MAP.TheGroup) 
ROLES_MAP_TheGroup 
, ROLES_MAP.InstanceID InstanceID 
, ROLES_MAP.ROLES_MAPID ID 
, 'ROLES_MAP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_MAP
 join INSTANCE on ROLES_MAP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOROLES_DOC as 
select   ROLES_DOCID
, 
 ROLES_DOC.The_Document  
ROLES_DOC_The_Document_ID, 
 Func.OBJECTTYPE_BRIEF_F(ROLES_DOC.The_Document) 
ROLES_DOC_The_Document 
, 
 ROLES_DOC.AllowDeleteDoc  
ROLES_DOC_AllowDeleteDoc_VAL, 
 decode(ROLES_DOC.AllowDeleteDoc 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DOC_AllowDeleteDoc 
, 
 ROLES_DOC.The_Denied  
ROLES_DOC_The_Denied_VAL, 
 decode(ROLES_DOC.The_Denied 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DOC_The_Denied 
, ROLES_DOC.InstanceID InstanceID 
, ROLES_DOC.ROLES_DOCID ID 
, 'ROLES_DOC' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_DOC
 join INSTANCE on ROLES_DOC.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOROLES_DOC_STATE as 
select   ROLES_DOC_STATEID,ROLES_DOCID
, 
 ROLES_DOC_STATE.The_Mode  
ROLES_DOC_STATE_The_Mode_ID, 
 Func.OBJECTMODE_BRIEF_F(ROLES_DOC_STATE.The_Mode) 
ROLES_DOC_STATE_The_Mode 
, 
 ROLES_DOC_STATE.StateChangeDisabled  
ROLES_DOC_STATE_StateChangeDisabled_VAL, 
 decode(ROLES_DOC_STATE.StateChangeDisabled 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DOC_STATE_StateChangeDisabled 
, 
 ROLES_DOC_STATE.AllowDelete  
ROLES_DOC_STATE_AllowDelete_VAL, 
 decode(ROLES_DOC_STATE.AllowDelete 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DOC_STATE_AllowDelete 
, 
 ROLES_DOC_STATE.The_State  
ROLES_DOC_STATE_The_State_ID, 
 Func.OBJSTATUS_BRIEF_F(ROLES_DOC_STATE.The_State) 
ROLES_DOC_STATE_The_State 
, ROLES_DOC.InstanceID InstanceID 
, ROLES_DOC_STATE.ROLES_DOC_STATEID ID 
, 'ROLES_DOC_STATE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_DOC_STATE
 join ROLES_DOC on ROLES_DOC.ROLES_DOCID=ROLES_DOC_STATE.ParentStructRowID 
 join INSTANCE on ROLES_DOC.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOROLES_DEF as 
select   ROLES_DEFID
, 
 ROLES_DEF.ListCFG_Denied  
ROLES_DEF_ListCFG_Denied_VAL, 
 decode(ROLES_DEF.ListCFG_Denied 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DEF_ListCFG_Denied 
, 
ROLES_DEF.TheComment 
ROLES_DEF_TheComment 
, 
 ROLES_DEF.FormCFG_Denied  
ROLES_DEF_FormCFG_Denied_VAL, 
 decode(ROLES_DEF.FormCFG_Denied 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DEF_FormCFG_Denied 
, 
 ROLES_DEF.FileExch_Denied  
ROLES_DEF_FileExch_Denied_VAL, 
 decode(ROLES_DEF.FileExch_Denied 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DEF_FileExch_Denied 
, 
 ROLES_DEF.RightsSet_Denied  
ROLES_DEF_RightsSet_Denied_VAL, 
 decode(ROLES_DEF.RightsSet_Denied 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DEF_RightsSet_Denied 
, 
ROLES_DEF.name 
ROLES_DEF_name 
, ROLES_DEF.InstanceID InstanceID 
, ROLES_DEF.ROLES_DEFID ID 
, 'ROLES_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_DEF
 join INSTANCE on ROLES_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewROLES_ROLES_DEF as 
select   ROLES_DEFID
, 
ROLES_DEF.name 
ROLES_DEF_name 
, 
 ROLES_DEF.RightsSet_Denied  
ROLES_DEF_RightsSet_Denied_VAL, 
 decode(ROLES_DEF.RightsSet_Denied 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DEF_RightsSet_Denied 
, 
ROLES_DEF.TheComment 
ROLES_DEF_TheComment 
, 
 ROLES_DEF.FileExch_Denied  
ROLES_DEF_FileExch_Denied_VAL, 
 decode(ROLES_DEF.FileExch_Denied 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DEF_FileExch_Denied 
, ROLES_DEF.InstanceID InstanceID 
, ROLES_DEF.ROLES_DEFID ID 
, 'ROLES_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_DEF
 join INSTANCE on ROLES_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOROLES_REPORTS as 
select   ROLES_REPORTSID
, 
 ROLES_REPORTS.The_Report  
ROLES_REPORTS_The_Report_ID, 
 Func.INSTANCE_BRIEF_F(ROLES_REPORTS.The_Report) 
ROLES_REPORTS_The_Report 
, ROLES_REPORTS.InstanceID InstanceID 
, ROLES_REPORTS.ROLES_REPORTSID ID 
, 'ROLES_REPORTS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_REPORTS
 join INSTANCE on ROLES_REPORTS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOROLES_WP as 
select   ROLES_WPID
, 
 ROLES_WP.WP  
ROLES_WP_WP_ID, 
 Func.INSTANCE_BRIEF_F(ROLES_WP.WP) 
ROLES_WP_WP 
, ROLES_WP.InstanceID InstanceID 
, ROLES_WP.ROLES_WPID ID 
, 'ROLES_WP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_WP
 join INSTANCE on ROLES_WP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOROLES_ACT as 
select   ROLES_ACTID,ROLES_WPID
, 
 ROLES_ACT.Accesible  
ROLES_ACT_Accesible_VAL, 
 decode(ROLES_ACT.Accesible 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_ACT_Accesible 
, 
 ROLES_ACT.EntryPoints  
ROLES_ACT_EntryPoints_ID, 
 Func.EntryPoints_BRIEF_F(ROLES_ACT.EntryPoints) 
ROLES_ACT_EntryPoints 
, ROLES_WP.InstanceID InstanceID 
, ROLES_ACT.ROLES_ACTID ID 
, 'ROLES_ACT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_ACT
 join ROLES_WP on ROLES_WP.ROLES_WPID=ROLES_ACT.ParentStructRowID 
 join INSTANCE on ROLES_WP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewMtzRptQry_RptSrvMsg as 
select   RptSrvMsgID
, 
RptQuery.AcceptDate 
RptQuery_AcceptDate 
, 
RptQuery.FinDate 
RptQuery_FinDate 
, 
 RptQuery.QueryUser  
RptQuery_QueryUser_ID, 
 Func.Users_BRIEF_F(RptQuery.QueryUser) 
RptQuery_QueryUser 
, 
RptSrvMsg.Msgdate 
RptSrvMsg_Msgdate 
, 
RptQuery.QryDate 
RptQuery_QryDate 
, 
RptSrvMsg.Info 
RptSrvMsg_Info 
, RptSrvMsg.InstanceID InstanceID 
, RptSrvMsg.RptSrvMsgID ID 
, 'RptSrvMsg' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RptSrvMsg
 join INSTANCE on RptSrvMsg.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join RptQuery ON RptQuery.InstanceID=RptSrvMsg.InstanceID 
;
create or replace view V_AUTORptSrvMsg as 
select   RptSrvMsgID
, 
RptSrvMsg.Info 
RptSrvMsg_Info 
, 
RptSrvMsg.Msgdate 
RptSrvMsg_Msgdate 
, RptSrvMsg.InstanceID InstanceID 
, RptSrvMsg.RptSrvMsgID ID 
, 'RptSrvMsg' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RptSrvMsg
 join INSTANCE on RptSrvMsg.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewMtzRptQry_RptQuery as 
select   RptQueryID
, 
RptQuery.QryDate 
RptQuery_QryDate 
, 
 RptQuery.QueryUser  
RptQuery_QueryUser_ID, 
 Func.Users_BRIEF_F(RptQuery.QueryUser) 
RptQuery_QueryUser 
, 
 RptQuery.ReportType  
RptQuery_ReportType_ID, 
 Func.INSTANCE_BRIEF_F(RptQuery.ReportType) 
RptQuery_ReportType 
, 
RptQuery.AcceptDate 
RptQuery_AcceptDate 
, 
RptQuery.FinDate 
RptQuery_FinDate 
, RptQuery.InstanceID InstanceID 
, RptQuery.RptQueryID ID 
, 'RptQuery' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RptQuery
 join INSTANCE on RptQuery.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTORptQuery as 
select   RptQueryID
, 
 RptQuery.QueryUser  
RptQuery_QueryUser_ID, 
 Func.Users_BRIEF_F(RptQuery.QueryUser) 
RptQuery_QueryUser 
, 
 RptQuery.ReportType  
RptQuery_ReportType_ID, 
 Func.INSTANCE_BRIEF_F(RptQuery.ReportType) 
RptQuery_ReportType 
, 
RptQuery.AcceptDate 
RptQuery_AcceptDate 
, 
RptQuery.ResultID 
RptQuery_ResultID 
, 
RptQuery.FinDate 
RptQuery_FinDate 
, 
RptQuery.QryDate 
RptQuery_QryDate 
, RptQuery.InstanceID InstanceID 
, RptQuery.RptQueryID ID 
, 'RptQuery' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RptQuery
 join INSTANCE on RptQuery.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTORptQryParam as 
select   RptQryParamID
, 
RptQryParam.Name 
RptQryParam_Name 
, 
RptQryParam.TheValue 
RptQryParam_TheValue 
, RptQryParam.InstanceID InstanceID 
, RptQryParam.RptQryParamID ID 
, 'RptQryParam' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RptQryParam
 join INSTANCE on RptQryParam.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKORD_PEKORD_DEF as 
select   PEKORD_DEFID
, 
PEKORD_DEF.docnumber 
PEKORD_DEF_docnumber 
, 
PEKORD_DEF.TarifStartDate 
PEKORD_DEF_TarifStartDate 
, 
PEKORD_DEF.regdate 
PEKORD_DEF_regdate 
, 
PEKORD_DEF.docname 
PEKORD_DEF_docname 
, 
PEKORD_DEF.comments 
PEKORD_DEF_comments 
, 
 PEKORD_DEF.author  
PEKORD_DEF_author_ID, 
 Func.Users_BRIEF_F(PEKORD_DEF.author) 
PEKORD_DEF_author 
, PEKORD_DEF.InstanceID InstanceID 
, PEKORD_DEF.PEKORD_DEFID ID 
, 'PEKORD_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKORD_DEF
 join INSTANCE on PEKORD_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKORD_DEF as 
select   PEKORD_DEFID
, 
PEKORD_DEF.docnumber 
PEKORD_DEF_docnumber 
, 
PEKORD_DEF.comments 
PEKORD_DEF_comments 
, 
PEKORD_DEF.TarifStartDate 
PEKORD_DEF_TarifStartDate 
, 
PEKORD_DEF.regdate 
PEKORD_DEF_regdate 
, 
 PEKORD_DEF.author  
PEKORD_DEF_author_ID, 
 Func.Users_BRIEF_F(PEKORD_DEF.author) 
PEKORD_DEF_author 
, 
PEKORD_DEF.docname 
PEKORD_DEF_docname 
, PEKORD_DEF.InstanceID InstanceID 
, PEKORD_DEF.PEKORD_DEFID ID 
, 'PEKORD_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKORD_DEF
 join INSTANCE on PEKORD_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKORD_DATA as 
select   PEKORD_DATAID
, 
 PEKORD_DATA.TheDept  
PEKORD_DATA_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKORD_DATA.TheDept) 
PEKORD_DATA_TheDept 
, 
 PEKORD_DATA.Cient  
PEKORD_DATA_Cient_ID, 
 Func.INSTANCE_BRIEF_F(PEKORD_DATA.Cient) 
PEKORD_DATA_Cient 
, 
 PEKORD_DATA.NewTarifType  
PEKORD_DATA_NewTarifType_ID, 
 Func.PEKD_TRFTYPE_BRIEF_F(PEKORD_DATA.NewTarifType) 
PEKORD_DATA_NewTarifType 
, PEKORD_DATA.InstanceID InstanceID 
, PEKORD_DATA.PEKORD_DATAID ID 
, 'PEKORD_DATA' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKORD_DATA
 join INSTANCE on PEKORD_DATA.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWorkPlace as 
select   WorkPlaceID
, 
WorkPlace.TheComment 
WorkPlace_TheComment 
, 
WorkPlace.TheVersion 
WorkPlace_TheVersion 
, 
WorkPlace.Caption 
WorkPlace_Caption 
, 
WorkPlace.Name 
WorkPlace_Name 
, 
 WorkPlace.ThePlatform  
WorkPlace_ThePlatform_VAL, 
 decode(WorkPlace.ThePlatform 
, 2 ,'JAVA'
, 3 ,'OTHER'
, 1 ,'DOTNET'
, 0 ,'VB6'
, '???') 
WorkPlace_ThePlatform 
, WorkPlace.InstanceID InstanceID 
, WorkPlace.WorkPlaceID ID 
, 'WorkPlace' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WorkPlace
 join INSTANCE on WorkPlace.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewMTZwp_WorkPlace as 
select   WorkPlaceID
, 
 WorkPlace.ThePlatform  
WorkPlace_ThePlatform_VAL, 
 decode(WorkPlace.ThePlatform 
, 2 ,'JAVA'
, 3 ,'OTHER'
, 1 ,'DOTNET'
, 0 ,'VB6'
, '???') 
WorkPlace_ThePlatform 
, 
WorkPlace.Name 
WorkPlace_Name 
, 
WorkPlace.TheVersion 
WorkPlace_TheVersion 
, WorkPlace.InstanceID InstanceID 
, WorkPlace.WorkPlaceID ID 
, 'WorkPlace' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WorkPlace
 join INSTANCE on WorkPlace.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOEntryPoints as 
select   EntryPointsID
, 
 EntryPoints.Document  
EntryPoints_Document_ID, 
 Func.INSTANCE_BRIEF_F(EntryPoints.Document) 
EntryPoints_Document 
, 
EntryPoints.Name 
EntryPoints_Name 
, 
 EntryPoints.TheFilter  
EntryPoints_TheFilter_ID, 
 Func.INSTANCE_BRIEF_F(EntryPoints.TheFilter) 
EntryPoints_TheFilter 
, 
 EntryPoints.TheExtention  
EntryPoints_TheExtention_ID, 
 Func.INSTANCE_BRIEF_F(EntryPoints.TheExtention) 
EntryPoints_TheExtention 
, 
 EntryPoints.Report  
EntryPoints_Report_ID, 
 Func.INSTANCE_BRIEF_F(EntryPoints.Report) 
EntryPoints_Report 
, 
 EntryPoints.ActionType  
EntryPoints_ActionType_VAL, 
 decode(EntryPoints.ActionType 
, 5 ,'Открыть отчет'
, 0 ,'Ничего не делать'
, 2 ,'Выполнить метод'
, 1 ,'Открыть документ'
, 4 ,'Запустить АРМ'
, 3 ,'Открыть журнал'
, '???') 
EntryPoints_ActionType 
, 
 EntryPoints.ARM  
EntryPoints_ARM_ID, 
 Func.INSTANCE_BRIEF_F(EntryPoints.ARM) 
EntryPoints_ARM 
, 
EntryPoints.IconFile 
EntryPoints_IconFile 
, 
EntryPoints.sequence 
EntryPoints_sequence 
, 
 EntryPoints.AsToolbarItem  
EntryPoints_AsToolbarItem_VAL, 
 decode(EntryPoints.AsToolbarItem 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
EntryPoints_AsToolbarItem 
, 
 EntryPoints.Method  
EntryPoints_Method_ID, 
 Func.SHAREDMETHOD_BRIEF_F(EntryPoints.Method) 
EntryPoints_Method 
, 
 EntryPoints.ObjectType  
EntryPoints_ObjectType_ID, 
 Func.OBJECTTYPE_BRIEF_F(EntryPoints.ObjectType) 
EntryPoints_ObjectType 
, 
EntryPoints.Caption 
EntryPoints_Caption 
, 
 EntryPoints.Journal  
EntryPoints_Journal_ID, 
 Func.INSTANCE_BRIEF_F(EntryPoints.Journal) 
EntryPoints_Journal 
, 
EntryPoints.TheComment 
EntryPoints_TheComment 
, 
EntryPoints.JournalFixedQuery 
EntryPoints_JournalFixedQuery 
, EntryPoints.InstanceID InstanceID 
, EntryPoints.EntryPointsID ID 
, 'EntryPoints' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from EntryPoints
 join INSTANCE on EntryPoints.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOEPFilterLink as 
select   EPFilterLinkID,EntryPointsID
, 
EPFilterLink.RowSource 
EPFilterLink_RowSource 
, 
EPFilterLink.FilterField 
EPFilterLink_FilterField 
, 
EPFilterLink.TheExpression 
EPFilterLink_TheExpression 
, EntryPoints.InstanceID InstanceID 
, EPFilterLink.EPFilterLinkID ID 
, 'EPFilterLink' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from EPFilterLink
 join EntryPoints on EntryPoints.EntryPointsID=EPFilterLink.ParentStructRowID 
 join INSTANCE on EntryPoints.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOARMTypes as 
select   ARMTypesID
, 
 ARMTypes.TheDocumentType  
ARMTypes_TheDocumentType_ID, 
 Func.OBJECTTYPE_BRIEF_F(ARMTypes.TheDocumentType) 
ARMTypes_TheDocumentType 
, ARMTypes.InstanceID InstanceID 
, ARMTypes.ARMTypesID ID 
, 'ARMTypes' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ARMTypes
 join INSTANCE on ARMTypes.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOARMJournal as 
select   ARMJournalID
, 
 ARMJournal.TheJournal  
ARMJournal_TheJournal_ID, 
 Func.INSTANCE_BRIEF_F(ARMJournal.TheJournal) 
ARMJournal_TheJournal 
, ARMJournal.InstanceID InstanceID 
, ARMJournal.ARMJournalID ID 
, 'ARMJournal' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ARMJournal
 join INSTANCE on ARMJournal.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOARMJRNLADD as 
select   ARMJRNLADDID,ARMJournalID
, 
 ARMJRNLADD.TheExtention  
ARMJRNLADD_TheExtention_ID, 
 Func.INSTANCE_BRIEF_F(ARMJRNLADD.TheExtention) 
ARMJRNLADD_TheExtention 
, 
ARMJRNLADD.Name 
ARMJRNLADD_Name 
, ARMJournal.InstanceID InstanceID 
, ARMJRNLADD.ARMJRNLADDID ID 
, 'ARMJRNLADD' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ARMJRNLADD
 join ARMJournal on ARMJournal.ARMJournalID=ARMJRNLADD.ParentStructRowID 
 join INSTANCE on ARMJournal.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOARMJRNLREP as 
select   ARMJRNLREPID,ARMJournalID
, 
 ARMJRNLREP.TheReport  
ARMJRNLREP_TheReport_ID, 
 Func.INSTANCE_BRIEF_F(ARMJRNLREP.TheReport) 
ARMJRNLREP_TheReport 
, 
ARMJRNLREP.repname 
ARMJRNLREP_repname 
, ARMJournal.InstanceID InstanceID 
, ARMJRNLREP.ARMJRNLREPID ID 
, 'ARMJRNLREP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ARMJRNLREP
 join ARMJournal on ARMJournal.ARMJournalID=ARMJRNLREP.ParentStructRowID 
 join INSTANCE on ARMJournal.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOARMJRNLRUN as 
select   ARMJRNLRUNID,ARMJournalID
, 
ARMJRNLRUN.Name 
ARMJRNLRUN_Name 
, 
 ARMJRNLRUN.TheExtention  
ARMJRNLRUN_TheExtention_ID, 
 Func.INSTANCE_BRIEF_F(ARMJRNLRUN.TheExtention) 
ARMJRNLRUN_TheExtention 
, ARMJournal.InstanceID InstanceID 
, ARMJRNLRUN.ARMJRNLRUNID ID 
, 'ARMJRNLRUN' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ARMJRNLRUN
 join ARMJournal on ARMJournal.ARMJournalID=ARMJRNLRUN.ParentStructRowID 
 join INSTANCE on ARMJournal.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_NZONE as 
select   PEKD_NZONEID
, 
PEKD_NZONE.POIDX 
PEKD_NZONE_POIDX 
, 
 PEKD_NZONE.TheMonth  
PEKD_NZONE_TheMonth_VAL, 
 decode(PEKD_NZONE.TheMonth 
, 11 ,'Ноябрь'
, 2 ,'Февраль'
, 12 ,'Декабрь'
, 3 ,'Март'
, 1 ,'Январь'
, 9 ,'Сентябрь'
, 6 ,'Июнь'
, 10 ,'Октябрь'
, 5 ,'Май'
, 8 ,'Август'
, 7 ,'Июль'
, 4 ,'Апрель'
, '???') 
PEKD_NZONE_TheMonth 
, 
 PEKD_NZONE.Dept  
PEKD_NZONE_Dept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKD_NZONE.Dept) 
PEKD_NZONE_Dept 
, 
PEKD_NZONE.FromPPOIDX 
PEKD_NZONE_FromPPOIDX 
, 
PEKD_NZONE.ToPPOIdx 
PEKD_NZONE_ToPPOIdx 
, 
PEKD_NZONE.TheYear 
PEKD_NZONE_TheYear 
, PEKD_NZONE.InstanceID InstanceID 
, PEKD_NZONE.PEKD_NZONEID ID 
, 'PEKD_NZONE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_NZONE
 join INSTANCE on PEKD_NZONE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKN_PEKD_NZONE as 
select   PEKD_NZONEID
, 
PEKD_NZONE.POIDX 
PEKD_NZONE_POIDX 
, 
PEKD_NZONE.TheYear 
PEKD_NZONE_TheYear 
, 
 PEKD_NZONE.TheMonth  
PEKD_NZONE_TheMonth_VAL, 
 decode(PEKD_NZONE.TheMonth 
, 11 ,'Ноябрь'
, 2 ,'Февраль'
, 12 ,'Декабрь'
, 3 ,'Март'
, 1 ,'Январь'
, 9 ,'Сентябрь'
, 6 ,'Июнь'
, 10 ,'Октябрь'
, 5 ,'Май'
, 8 ,'Август'
, 7 ,'Июль'
, 4 ,'Апрель'
, '???') 
PEKD_NZONE_TheMonth 
, 
PEKD_NZONE.ToPPOIdx 
PEKD_NZONE_ToPPOIdx 
, 
PEKD_NZONE.FromPPOIDX 
PEKD_NZONE_FromPPOIDX 
, 
 PEKD_NZONE.Dept  
PEKD_NZONE_Dept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKD_NZONE.Dept) 
PEKD_NZONE_Dept 
, PEKD_NZONE.InstanceID InstanceID 
, PEKD_NZONE.PEKD_NZONEID ID 
, 'PEKD_NZONE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_NZONE
 join INSTANCE on PEKD_NZONE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_USEDNUM as 
select   PEKD_USEDNUMID
, 
PEKD_USEDNUM.UsedNumber 
PEKD_USEDNUM_UsedNumber 
, PEKD_USEDNUM.InstanceID InstanceID 
, PEKD_USEDNUM.PEKD_USEDNUMID ID 
, 'PEKD_USEDNUM' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_USEDNUM
 join INSTANCE on PEKD_USEDNUM.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOJournalColumn as 
select   JournalColumnID
, 
 JournalColumn.ColumnAlignment  
JournalColumn_ColumnAlignment_VAL, 
 decode(JournalColumn.ColumnAlignment 
, 4 ,'Center Center'
, 3 ,'Center Top'
, 6 ,'Right Top'
, 8 ,'Right Bottom'
, 2 ,'Left Bottom'
, 7 ,'Right Center'
, 5 ,'Center Bottom'
, 1 ,'Left Center'
, 0 ,'Left Top'
, '???') 
JournalColumn_ColumnAlignment 
, 
 JournalColumn.GroupAggregation  
JournalColumn_GroupAggregation_VAL, 
 decode(JournalColumn.GroupAggregation 
, 5 ,'MAX'
, 1 ,'AVG'
, 3 ,'SUM'
, 2 ,'COUNT'
, 4 ,'MIN'
, 6 ,'CUSTOM'
, 0 ,'none'
, '???') 
JournalColumn_GroupAggregation 
, 
 JournalColumn.ColSort  
JournalColumn_ColSort_VAL, 
 decode(JournalColumn.ColSort 
, 0 ,'As String'
, 1 ,'As Numeric'
, 2 ,'As Date'
, '???') 
JournalColumn_ColSort 
, 
JournalColumn.name 
JournalColumn_name 
, 
JournalColumn.sequence 
JournalColumn_sequence 
, JournalColumn.InstanceID InstanceID 
, JournalColumn.JournalColumnID ID 
, 'JournalColumn' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from JournalColumn
 join INSTANCE on JournalColumn.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOJColumnSource as 
select   JColumnSourceID,JournalColumnID
, 
JColumnSource.ViewField 
JColumnSource_ViewField 
, 
 JColumnSource.SrcPartView  
JColumnSource_SrcPartView_ID, 
 Func.JournalSrc_BRIEF_F(JColumnSource.SrcPartView) 
JColumnSource_SrcPartView 
, JournalColumn.InstanceID InstanceID 
, JColumnSource.JColumnSourceID ID 
, 'JColumnSource' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from JColumnSource
 join JournalColumn on JournalColumn.JournalColumnID=JColumnSource.ParentStructRowID 
 join INSTANCE on JournalColumn.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOJournal as 
select   JournalID
, 
Journal.TheComment 
Journal_TheComment 
, 
Journal.Name 
Journal_Name 
, 
Journal.the_Alias 
Journal_the_Alias 
, Journal.InstanceID InstanceID 
, Journal.JournalID ID 
, 'Journal' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Journal
 join INSTANCE on Journal.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOJournalSrc as 
select   JournalSrcID
, 
JournalSrc.ViewAlias 
JournalSrc_ViewAlias 
, 
 JournalSrc.OnRun  
JournalSrc_OnRun_VAL, 
 decode(JournalSrc.OnRun 
, 2 ,'Открыть документ'
, 1 ,'Открыть строку'
, 0 ,'Ничего не делать'
, '???') 
JournalSrc_OnRun 
, 
JournalSrc.OpenMode 
JournalSrc_OpenMode 
, 
JournalSrc.PartView 
JournalSrc_PartView 
, JournalSrc.InstanceID InstanceID 
, JournalSrc.JournalSrcID ID 
, 'JournalSrc' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from JournalSrc
 join INSTANCE on JournalSrc.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOpekmsg_path as 
select   pekmsg_pathID
, 
 pekmsg_path.PathFilial  
pekmsg_path_PathFilial_ID, 
 Func.PEKD_DEPT_BRIEF_F(pekmsg_path.PathFilial) 
pekmsg_path_PathFilial 
, 
 pekmsg_path.trainNo  
pekmsg_path_trainNo_ID, 
 Func.PEKD_TRAINS_BRIEF_F(pekmsg_path.trainNo) 
pekmsg_path_trainNo 
, 
 pekmsg_path.InfoSendType  
pekmsg_path_InfoSendType_ID, 
 Func.PEKD_INFOSENDTYPE_BRIEF_F(pekmsg_path.InfoSendType) 
pekmsg_path_InfoSendType 
, 
pekmsg_path.vagNo 
pekmsg_path_vagNo 
, 
 pekmsg_path.PPODescription  
pekmsg_path_PPODescription_ID, 
 Func.PEKD_POSTTYPE_BRIEF_F(pekmsg_path.PPODescription) 
pekmsg_path_PPODescription 
, 
pekmsg_path.PPOVol 
pekmsg_path_PPOVol 
, 
pekmsg_path.PassDate 
pekmsg_path_PassDate 
, 
pekmsg_path.SendDate 
pekmsg_path_SendDate 
, 
 pekmsg_path.TheDirection  
pekmsg_path_TheDirection_ID, 
 Func.PEKD_DIRECTION_BRIEF_F(pekmsg_path.TheDirection) 
pekmsg_path_TheDirection 
, 
 pekmsg_path.Receiver  
pekmsg_path_Receiver_ID, 
 Func.INSTANCE_BRIEF_F(pekmsg_path.Receiver) 
pekmsg_path_Receiver 
, 
pekmsg_path.RcvFIO 
pekmsg_path_RcvFIO 
, 
pekmsg_path.InforRcvFIO 
pekmsg_path_InforRcvFIO 
, 
 pekmsg_path.TransSupplier  
pekmsg_path_TransSupplier_ID, 
 Func.INSTANCE_BRIEF_F(pekmsg_path.TransSupplier) 
pekmsg_path_TransSupplier 
, 
pekmsg_path.InfoDate 
pekmsg_path_InfoDate 
, 
 pekmsg_path.ValueEDIZM  
pekmsg_path_ValueEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(pekmsg_path.ValueEDIZM) 
pekmsg_path_ValueEDIZM 
, 
pekmsg_path.PPONum 
pekmsg_path_PPONum 
, 
pekmsg_path.PassFIO 
pekmsg_path_PassFIO 
, 
pekmsg_path.RcvDate 
pekmsg_path_RcvDate 
, 
pekmsg_path.PPOWeight 
pekmsg_path_PPOWeight 
, 
pekmsg_path.RcvWaitDate 
pekmsg_path_RcvWaitDate 
, 
 pekmsg_path.DestStation  
pekmsg_path_DestStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(pekmsg_path.DestStation) 
pekmsg_path_DestStation 
, 
 pekmsg_path.WeightEDIZM  
pekmsg_path_WeightEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(pekmsg_path.WeightEDIZM) 
pekmsg_path_WeightEDIZM 
, pekmsg_path.InstanceID InstanceID 
, pekmsg_path.pekmsg_pathID ID 
, 'pekmsg_path' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from pekmsg_path
 join INSTANCE on pekmsg_path.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_MAILLIST as 
select   WEBS_MAILLISTID
, 
WEBS_MAILLIST.Email 
WEBS_MAILLIST_Email 
, WEBS_MAILLIST.InstanceID InstanceID 
, WEBS_MAILLIST.WEBS_MAILLISTID ID 
, 'WEBS_MAILLIST' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_MAILLIST
 join INSTANCE on WEBS_MAILLIST.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_RECLAME as 
select   WEBS_RECLAMEID
, 
 WEBS_RECLAME.Path  
WEBS_RECLAME_Path_ID, 
 Func.TheDefenitionDiffP_BRIEF_F(WEBS_RECLAME.Path) 
WEBS_RECLAME_Path 
, 
WEBS_RECLAME.queque 
WEBS_RECLAME_queque 
, WEBS_RECLAME.InstanceID InstanceID 
, WEBS_RECLAME.WEBS_RECLAMEID ID 
, 'WEBS_RECLAME' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_RECLAME
 join INSTANCE on WEBS_RECLAME.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewWEBS_WEBS_PAGEDEF as 
select   WEBS_PAGEDEFID
, 
WEBS_PAGEDEF.Name 
WEBS_PAGEDEF_Name 
, 
WEBS_PAGEDEF.QueueNumber 
WEBS_PAGEDEF_QueueNumber 
, 
WEBS_PAGEDEF.Url 
WEBS_PAGEDEF_Url 
, WEBS_PAGEDEF.InstanceID InstanceID 
, WEBS_PAGEDEF.WEBS_PAGEDEFID ID 
, 'WEBS_PAGEDEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_PAGEDEF
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_PAGEDEF as 
select   WEBS_PAGEDEFID
, 
 WEBS_PAGEDEF.IsOnMap  
WEBS_PAGEDEF_IsOnMap_VAL, 
 decode(WEBS_PAGEDEF.IsOnMap 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGEDEF_IsOnMap 
, 
 WEBS_PAGEDEF.ObjectCode  
WEBS_PAGEDEF_ObjectCode_ID, 
 Func.PART_BRIEF_F(WEBS_PAGEDEF.ObjectCode) 
WEBS_PAGEDEF_ObjectCode 
, 
WEBS_PAGEDEF.QueueNumber 
WEBS_PAGEDEF_QueueNumber 
, 
WEBS_PAGEDEF.SelectIDParameterName 
WEBS_PAGEDEF_SelectIDParameterName 
, 
 WEBS_PAGEDEF.IsShowHisory  
WEBS_PAGEDEF_IsShowHisory_VAL, 
 decode(WEBS_PAGEDEF.IsShowHisory 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGEDEF_IsShowHisory 
, 
WEBS_PAGEDEF.ShortName 
WEBS_PAGEDEF_ShortName 
, 
WEBS_PAGEDEF.Title 
WEBS_PAGEDEF_Title 
, 
 WEBS_PAGEDEF.the_IsLocked  
WEBS_PAGEDEF_the_IsLocked_VAL, 
 decode(WEBS_PAGEDEF.the_IsLocked 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGEDEF_the_IsLocked 
, 
WEBS_PAGEDEF.ControlPath 
WEBS_PAGEDEF_ControlPath 
, 
 WEBS_PAGEDEF.AllowHeader  
WEBS_PAGEDEF_AllowHeader_VAL, 
 decode(WEBS_PAGEDEF.AllowHeader 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGEDEF_AllowHeader 
, 
 WEBS_PAGEDEF.RedirectToFirstChild  
WEBS_PAGEDEF_RedirectToFirstChild_VAL, 
 decode(WEBS_PAGEDEF.RedirectToFirstChild 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGEDEF_RedirectToFirstChild 
, 
 WEBS_PAGEDEF.PageType  
WEBS_PAGEDEF_PageType_VAL, 
 decode(WEBS_PAGEDEF.PageType 
, 0 ,'Не существенно'
, 1 ,'Объект'
, 3 ,'Раздел'
, 2 ,'Таблица'
, '???') 
WEBS_PAGEDEF_PageType 
, 
WEBS_PAGEDEF.the_Mode 
WEBS_PAGEDEF_the_Mode 
, 
WEBS_PAGEDEF.Name 
WEBS_PAGEDEF_Name 
, 
WEBS_PAGEDEF.PageContent 
WEBS_PAGEDEF_PageContent 
, 
 WEBS_PAGEDEF.ObjectName  
WEBS_PAGEDEF_ObjectName_ID, 
 Func.OBJECTTYPE_BRIEF_F(WEBS_PAGEDEF.ObjectName) 
WEBS_PAGEDEF_ObjectName 
, 
 WEBS_PAGEDEF.AllowAddPage  
WEBS_PAGEDEF_AllowAddPage_VAL, 
 decode(WEBS_PAGEDEF.AllowAddPage 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGEDEF_AllowAddPage 
, 
WEBS_PAGEDEF.Url 
WEBS_PAGEDEF_Url 
, WEBS_PAGEDEF.InstanceID InstanceID 
, WEBS_PAGEDEF.WEBS_PAGEDEFID ID 
, 'WEBS_PAGEDEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_PAGEDEF
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_PICS as 
select   WEBS_PICSID,WEBS_PAGEDEFID
, 
WEBS_PICS.Name 
WEBS_PICS_Name 
, 
WEBS_PICS.FileContent 
WEBS_PICS_FileContent 
, WEBS_PAGEDEF.InstanceID InstanceID 
, WEBS_PICS.WEBS_PICSID ID 
, 'WEBS_PICS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_PICS
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PICS.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_PAGEMENU as 
select   WEBS_PAGEMENUID,WEBS_PAGEDEFID
, 
WEBS_PAGEMENU.UsePartRowsSort 
WEBS_PAGEMENU_UsePartRowsSort 
, 
 WEBS_PAGEMENU.AllowInMenu  
WEBS_PAGEMENU_AllowInMenu_VAL, 
 decode(WEBS_PAGEMENU.AllowInMenu 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGEMENU_AllowInMenu 
, 
WEBS_PAGEMENU.UsePartRowsTextField 
WEBS_PAGEMENU_UsePartRowsTextField 
, 
 WEBS_PAGEMENU.AllowInBottomMenu  
WEBS_PAGEMENU_AllowInBottomMenu_VAL, 
 decode(WEBS_PAGEMENU.AllowInBottomMenu 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGEMENU_AllowInBottomMenu 
, 
 WEBS_PAGEMENU.UsePartRowsInMenu  
WEBS_PAGEMENU_UsePartRowsInMenu_VAL, 
 decode(WEBS_PAGEMENU.UsePartRowsInMenu 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGEMENU_UsePartRowsInMenu 
, 
WEBS_PAGEMENU.UsePartRowsRowIDField 
WEBS_PAGEMENU_UsePartRowsRowIDField 
, 
 WEBS_PAGEMENU.UsePartRowsEditForm  
WEBS_PAGEMENU_UsePartRowsEditForm_ID, 
 Func.WEBS_PAGEDEF_BRIEF_F(WEBS_PAGEMENU.UsePartRowsEditForm) 
WEBS_PAGEMENU_UsePartRowsEditForm 
, WEBS_PAGEDEF.InstanceID InstanceID 
, WEBS_PAGEMENU.WEBS_PAGEMENUID ID 
, 'WEBS_PAGEMENU' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_PAGEMENU
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PAGEMENU.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_PAGECONTENT as 
select   WEBS_PAGECONTENTID,WEBS_PAGEDEFID
, 
WEBS_PAGECONTENT.Content 
WEBS_PAGECONTENT_Content 
, WEBS_PAGEDEF.InstanceID InstanceID 
, WEBS_PAGECONTENT.WEBS_PAGECONTENTID ID 
, 'WEBS_PAGECONTENT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_PAGECONTENT
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PAGECONTENT.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_PAGEPARS as 
select   WEBS_PAGEPARSID,WEBS_PAGEDEFID
, 
WEBS_PAGEPARS.TheValue 
WEBS_PAGEPARS_TheValue 
, 
WEBS_PAGEPARS.Name 
WEBS_PAGEPARS_Name 
, WEBS_PAGEDEF.InstanceID InstanceID 
, WEBS_PAGEPARS.WEBS_PAGEPARSID ID 
, 'WEBS_PAGEPARS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_PAGEPARS
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PAGEPARS.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_PAGECOMP as 
select   WEBS_PAGECOMPID,WEBS_PAGEDEFID
, 
 WEBS_PAGECOMP.IsCollection  
WEBS_PAGECOMP_IsCollection_VAL, 
 decode(WEBS_PAGECOMP.IsCollection 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGECOMP_IsCollection 
, 
 WEBS_PAGECOMP.Visible  
WEBS_PAGECOMP_Visible_VAL, 
 decode(WEBS_PAGECOMP.Visible 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGECOMP_Visible 
, 
WEBS_PAGECOMP.Title 
WEBS_PAGECOMP_Title 
, 
 WEBS_PAGECOMP.Selected  
WEBS_PAGECOMP_Selected_VAL, 
 decode(WEBS_PAGECOMP.Selected 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGECOMP_Selected 
, 
 WEBS_PAGECOMP.the_PartName  
WEBS_PAGECOMP_the_PartName_ID, 
 Func.PART_BRIEF_F(WEBS_PAGECOMP.the_PartName) 
WEBS_PAGECOMP_the_PartName 
, 
WEBS_PAGECOMP.UserIdField 
WEBS_PAGECOMP_UserIdField 
, 
WEBS_PAGECOMP.Name 
WEBS_PAGECOMP_Name 
, 
WEBS_PAGECOMP.IDField 
WEBS_PAGECOMP_IDField 
, WEBS_PAGEDEF.InstanceID InstanceID 
, WEBS_PAGECOMP.WEBS_PAGECOMPID ID 
, 'WEBS_PAGECOMP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_PAGECOMP
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PAGECOMP.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOTablePart as 
select   TablePartID,WEBS_PAGECOMPID,WEBS_PAGEDEFID
, 
 TablePart.EditForm  
TablePart_EditForm_ID, 
 Func.WEBS_PAGEDEF_BRIEF_F(TablePart.EditForm) 
TablePart_EditForm 
, 
TablePart.AllowEditRowStatusNameValue 
TablePart_AllowEditRowStatusNameValue 
, 
 TablePart.AllowAddNew  
TablePart_AllowAddNew_VAL, 
 decode(TablePart.AllowAddNew 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
TablePart_AllowAddNew 
, 
TablePart.SelectIDParameterName 
TablePart_SelectIDParameterName 
, 
TablePart.Filter_ 
TablePart_Filter_ 
, 
TablePart.FilterUserIDFieldName_ 
TablePart_FilterUserIDFieldName_ 
, 
TablePart.DataNavigateUrlField 
TablePart_DataNavigateUrlField 
, 
TablePart.ClientDefField 
TablePart_ClientDefField 
, 
 TablePart.AllowEditUserClientDef  
TablePart_AllowEditUserClientDef_VAL, 
 decode(TablePart.AllowEditUserClientDef 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
TablePart_AllowEditUserClientDef 
, 
TablePart.PagerSize 
TablePart_PagerSize 
, 
TablePart.AllowEditField 
TablePart_AllowEditField 
, 
TablePart.DeleteCaption 
TablePart_DeleteCaption 
, 
 TablePart.JournalID  
TablePart_JournalID_ID, 
 Func.INSTANCE_BRIEF_F(TablePart.JournalID) 
TablePart_JournalID 
, 
TablePart.ViewCaption 
TablePart_ViewCaption 
, 
TablePart.EditCaption 
TablePart_EditCaption 
, 
 TablePart.AddStatusColumn_  
TablePart_AddStatusColumn__VAL, 
 decode(TablePart.AddStatusColumn_ 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
TablePart_AddStatusColumn_ 
, 
 TablePart.AllowDelete  
TablePart_AllowDelete_VAL, 
 decode(TablePart.AllowDelete 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
TablePart_AllowDelete 
, 
TablePart.FilterUserClientDef 
TablePart_FilterUserClientDef 
, WEBS_PAGEDEF.InstanceID InstanceID 
, TablePart.TablePartID ID 
, 'TablePart' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from TablePart
 join WEBS_PAGECOMP on WEBS_PAGECOMP.WEBS_PAGECOMPID=TablePart.ParentStructRowID 
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PAGECOMP.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOReplaceValues as 
select   ReplaceValuesID,WEBS_PAGECOMPID,WEBS_PAGEDEFID
, 
ReplaceValues.SourceName 
ReplaceValues_SourceName 
, 
ReplaceValues.Name 
ReplaceValues_Name 
, WEBS_PAGEDEF.InstanceID InstanceID 
, ReplaceValues.ReplaceValuesID ID 
, 'ReplaceValues' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ReplaceValues
 join WEBS_PAGECOMP on WEBS_PAGECOMP.WEBS_PAGECOMPID=ReplaceValues.ParentStructRowID 
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PAGECOMP.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTODenyEdit as 
select   DenyEditID,WEBS_PAGECOMPID,WEBS_PAGEDEFID
, 
DenyEdit.Name 
DenyEdit_Name 
, WEBS_PAGEDEF.InstanceID InstanceID 
, DenyEdit.DenyEditID ID 
, 'DenyEdit' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from DenyEdit
 join WEBS_PAGECOMP on WEBS_PAGECOMP.WEBS_PAGECOMPID=DenyEdit.ParentStructRowID 
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PAGECOMP.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTODenyVisible as 
select   DenyVisibleID,WEBS_PAGECOMPID,WEBS_PAGEDEFID
, 
DenyVisible.Name 
DenyVisible_Name 
, WEBS_PAGEDEF.InstanceID InstanceID 
, DenyVisible.DenyVisibleID ID 
, 'DenyVisible' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from DenyVisible
 join WEBS_PAGECOMP on WEBS_PAGECOMP.WEBS_PAGECOMPID=DenyVisible.ParentStructRowID 
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PAGECOMP.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOAllowEditFieldValues as 
select   AllowEditFieldValuesID,WEBS_PAGECOMPID,WEBS_PAGEDEFID
, 
AllowEditFieldValues.Name 
AllowEditFieldValues_Name 
, WEBS_PAGEDEF.InstanceID InstanceID 
, AllowEditFieldValues.AllowEditFieldValuesID ID 
, 'AllowEditFieldValues' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from AllowEditFieldValues
 join WEBS_PAGECOMP on WEBS_PAGECOMP.WEBS_PAGECOMPID=AllowEditFieldValues.ParentStructRowID 
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PAGECOMP.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOComboFields as 
select   ComboFieldsID,WEBS_PAGECOMPID,WEBS_PAGEDEFID
, 
ComboFields.SourceName 
ComboFields_SourceName 
, 
ComboFields.Name 
ComboFields_Name 
, WEBS_PAGEDEF.InstanceID InstanceID 
, ComboFields.ComboFieldsID ID 
, 'ComboFields' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ComboFields
 join WEBS_PAGECOMP on WEBS_PAGECOMP.WEBS_PAGECOMPID=ComboFields.ParentStructRowID 
 join WEBS_PAGEDEF on WEBS_PAGEDEF.WEBS_PAGEDEFID=WEBS_PAGECOMP.ParentStructRowID 
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_ANKETA as 
select   WEBS_ANKETAID
, 
WEBS_ANKETA.Message 
WEBS_ANKETA_Message 
, 
 WEBS_ANKETA.AnketaDef  
WEBS_ANKETA_AnketaDef_ID, 
 Func.INSTANCE_BRIEF_F(WEBS_ANKETA.AnketaDef) 
WEBS_ANKETA_AnketaDef 
, 
WEBS_ANKETA.Name 
WEBS_ANKETA_Name 
, 
WEBS_ANKETA.the_Description 
WEBS_ANKETA_the_Description 
, WEBS_ANKETA.InstanceID InstanceID 
, WEBS_ANKETA.WEBS_ANKETAID ID 
, 'WEBS_ANKETA' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_ANKETA
 join INSTANCE on WEBS_ANKETA.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewWEBS_WEBS_ANKETA as 
select   WEBS_ANKETAID
, 
WEBS_ANKETA.the_Description 
WEBS_ANKETA_the_Description 
, 
WEBS_ANKETA.Name 
WEBS_ANKETA_Name 
, WEBS_ANKETA.InstanceID InstanceID 
, WEBS_ANKETA.WEBS_ANKETAID ID 
, 'WEBS_ANKETA' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_ANKETA
 join INSTANCE on WEBS_ANKETA.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_QUESTIONS as 
select   WEBS_QUESTIONSID,WEBS_ANKETAID
, 
WEBS_QUESTIONS.QuestionType 
WEBS_QUESTIONS_QuestionType 
, 
 WEBS_QUESTIONS.Required  
WEBS_QUESTIONS_Required_VAL, 
 decode(WEBS_QUESTIONS.Required 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_QUESTIONS_Required 
, 
WEBS_QUESTIONS.Style 
WEBS_QUESTIONS_Style 
, 
WEBS_QUESTIONS.the_Number 
WEBS_QUESTIONS_the_Number 
, 
WEBS_QUESTIONS.Name 
WEBS_QUESTIONS_Name 
, WEBS_ANKETA.InstanceID InstanceID 
, WEBS_QUESTIONS.WEBS_QUESTIONSID ID 
, 'WEBS_QUESTIONS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_QUESTIONS
 join WEBS_ANKETA on WEBS_ANKETA.WEBS_ANKETAID=WEBS_QUESTIONS.ParentStructRowID 
 join INSTANCE on WEBS_ANKETA.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_ANSWERS as 
select   WEBS_ANSWERSID,WEBS_QUESTIONSID,WEBS_ANKETAID
, 
WEBS_ANSWERS.the_Description 
WEBS_ANSWERS_the_Description 
, 
WEBS_ANSWERS.the_Number 
WEBS_ANSWERS_the_Number 
, 
WEBS_ANSWERS.Name 
WEBS_ANSWERS_Name 
, WEBS_ANKETA.InstanceID InstanceID 
, WEBS_ANSWERS.WEBS_ANSWERSID ID 
, 'WEBS_ANSWERS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_ANSWERS
 join WEBS_QUESTIONS on WEBS_QUESTIONS.WEBS_QUESTIONSID=WEBS_ANSWERS.ParentStructRowID 
 join WEBS_ANKETA on WEBS_ANKETA.WEBS_ANKETAID=WEBS_QUESTIONS.ParentStructRowID 
 join INSTANCE on WEBS_ANKETA.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_DDOC as 
select   WEBS_DDOCID
, 
WEBS_DDOC.Title 
WEBS_DDOC_Title 
, 
WEBS_DDOC.FileContract 
WEBS_DDOC_FileContract 
, 
WEBS_DDOC.Name 
WEBS_DDOC_Name 
, 
WEBS_DDOC.FileName 
WEBS_DDOC_FileName 
, WEBS_DDOC.InstanceID InstanceID 
, WEBS_DDOC.WEBS_DDOCID ID 
, 'WEBS_DDOC' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_DDOC
 join INSTANCE on WEBS_DDOC.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewWEBS_WEBS_DDOC as 
select   WEBS_DDOCID
, 
WEBS_DDOC.FileName 
WEBS_DDOC_FileName 
, 
WEBS_DDOC.Name 
WEBS_DDOC_Name 
, 
WEBS_DDOC.Title 
WEBS_DDOC_Title 
, WEBS_DDOC.InstanceID InstanceID 
, WEBS_DDOC.WEBS_DDOCID ID 
, 'WEBS_DDOC' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_DDOC
 join INSTANCE on WEBS_DDOC.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBS_NEWS as 
select   WEBS_NEWSID
, 
WEBS_NEWS.PageContent 
WEBS_NEWS_PageContent 
, 
WEBS_NEWS.NewsDate 
WEBS_NEWS_NewsDate 
, 
WEBS_NEWS.the_Mode 
WEBS_NEWS_the_Mode 
, 
WEBS_NEWS.QueueNumber 
WEBS_NEWS_QueueNumber 
, 
WEBS_NEWS.ShortName 
WEBS_NEWS_ShortName 
, 
WEBS_NEWS.Title 
WEBS_NEWS_Title 
, 
WEBS_NEWS.NewsDescription 
WEBS_NEWS_NewsDescription 
, 
 WEBS_NEWS.the_IsLocked  
WEBS_NEWS_the_IsLocked_VAL, 
 decode(WEBS_NEWS.the_IsLocked 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_NEWS_the_IsLocked 
, 
WEBS_NEWS.Name 
WEBS_NEWS_Name 
, 
 WEBS_NEWS.IsShowHisory  
WEBS_NEWS_IsShowHisory_VAL, 
 decode(WEBS_NEWS.IsShowHisory 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_NEWS_IsShowHisory 
, WEBS_NEWS.InstanceID InstanceID 
, WEBS_NEWS.WEBS_NEWSID ID 
, 'WEBS_NEWS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_NEWS
 join INSTANCE on WEBS_NEWS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTONEWS_PICS as 
select   NEWS_PICSID,WEBS_NEWSID
, 
NEWS_PICS.FileContent 
NEWS_PICS_FileContent 
, 
NEWS_PICS.Name 
NEWS_PICS_Name 
, WEBS_NEWS.InstanceID InstanceID 
, NEWS_PICS.NEWS_PICSID ID 
, 'NEWS_PICS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from NEWS_PICS
 join WEBS_NEWS on WEBS_NEWS.WEBS_NEWSID=NEWS_PICS.ParentStructRowID 
 join INSTANCE on WEBS_NEWS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCPSeeAlso as 
select   VRCPSeeAlsoID
, 
VRCPSeeAlso.the_Comment 
VRCPSeeAlso_the_Comment 
, 
 VRCPSeeAlso.Document  
VRCPSeeAlso_Document_ID, 
 Func.INSTANCE_BRIEF_F(VRCPSeeAlso.Document) 
VRCPSeeAlso_Document 
, VRCPSeeAlso.InstanceID InstanceID 
, VRCPSeeAlso.VRCPSeeAlsoID ID 
, 'VRCPSeeAlso' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPSeeAlso
 join INSTANCE on VRCPSeeAlso.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCPSpecial as 
select   VRCPSpecialID
, 
VRCPSpecial.DateOF 
VRCPSpecial_DateOF 
, 
VRCPSpecial.InfoSrc 
VRCPSpecial_InfoSrc 
, 
VRCPSpecial.theFile 
VRCPSpecial_theFile 
, 
VRCPSpecial.Info 
VRCPSpecial_Info 
, VRCPSpecial.InstanceID InstanceID 
, VRCPSpecial.VRCPSpecialID ID 
, 'VRCPSpecial' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPSpecial
 join INSTANCE on VRCPSpecial.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCPPresents as 
select   VRCPPresentsID
, 
VRCPPresents.PresentCost 
VRCPPresents_PresentCost 
, 
VRCPPresents.DateOF 
VRCPPresents_DateOF 
, 
VRCPPresents.Gift 
VRCPPresents_Gift 
, 
VRCPPresents.reason 
VRCPPresents_reason 
, VRCPPresents.InstanceID InstanceID 
, VRCPPresents.VRCPPresentsID ID 
, 'VRCPPresents' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPPresents
 join INSTANCE on VRCPPresents.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCPReports as 
select   VRCPReportsID
, 
 VRCPReports.Report  
VRCPReports_Report_ID, 
 Func.INSTANCE_BRIEF_F(VRCPReports.Report) 
VRCPReports_Report 
, VRCPReports.InstanceID InstanceID 
, VRCPReports.VRCPReportsID ID 
, 'VRCPReports' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPReports
 join INSTANCE on VRCPReports.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewVRCPDates as 
select   VRCPDatesID
, 
VRCPCommon.Family 
VRCPCommon_Family 
, 
VRCPCommon.phone 
VRCPCommon_phone 
, 
VRCPCommon.email 
VRCPCommon_email 
, 
VRCPDates.DateEvent 
VRCPDates_DateEvent 
, 
VRCPCommon.the_Comment 
VRCPCommon_Comment 
, 
VRCPCommon.SurName 
VRCPCommon_SurName 
, 
VRCPCommon.mobile 
VRCPCommon_mobile 
, 
VRCPCommon.Privelegie 
VRCPCommon_Privelegie 
, 
VRCPDates.DateOf 
VRCPDates_DateOf 
, 
 VRCPCommon.Curator  
VRCPCommon_Curator_ID, 
 Func.Users_BRIEF_F(VRCPCommon.Curator) 
VRCPCommon_Curator 
, 
VRCPCommon.Name 
VRCPCommon_Name 
, 
VRCPCommon.fax 
VRCPCommon_fax 
, VRCPDates.InstanceID InstanceID 
, VRCPDates.VRCPDatesID ID 
, 'VRCPDates' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPDates
 join INSTANCE on VRCPDates.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join VRCPCommon ON VRCPCommon.InstanceID=VRCPDates.InstanceID 
;
create or replace view V_AUTOVRCPDates as 
select   VRCPDatesID
, 
VRCPDates.DateEvent 
VRCPDates_DateEvent 
, 
VRCPDates.DateOf 
VRCPDates_DateOf 
, VRCPDates.InstanceID InstanceID 
, VRCPDates.VRCPDatesID ID 
, 'VRCPDates' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPDates
 join INSTANCE on VRCPDates.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCPNeigborhood as 
select   VRCPNeigborhoodID
, 
 VRCPNeigborhood.person  
VRCPNeigborhood_person_ID, 
 Func.INSTANCE_BRIEF_F(VRCPNeigborhood.person) 
VRCPNeigborhood_person 
, 
VRCPNeigborhood.the_Level 
VRCPNeigborhood_the_Level 
, VRCPNeigborhood.InstanceID InstanceID 
, VRCPNeigborhood.VRCPNeigborhoodID ID 
, 'VRCPNeigborhood' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPNeigborhood
 join INSTANCE on VRCPNeigborhood.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCPInterest as 
select   VRCPInterestID
, 
VRCPInterest.Info 
VRCPInterest_Info 
, VRCPInterest.InstanceID InstanceID 
, VRCPInterest.VRCPInterestID ID 
, 'VRCPInterest' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPInterest
 join INSTANCE on VRCPInterest.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewVRCPInterest as 
select   VRCPInterestID
, 
VRCPCommon.Privelegie 
VRCPCommon_Privelegie 
, 
VRCPCommon.email 
VRCPCommon_email 
, 
 VRCPCommon.Loyality  
VRCPCommon_Loyality_ID, 
 Func.VRDLoyalty_BRIEF_F(VRCPCommon.Loyality) 
VRCPCommon_Loyality 
, 
VRCPCommon.the_Comment 
VRCPCommon_Comment 
, 
VRCPCommon.Name 
VRCPCommon_Name 
, 
VRCPCommon.phone 
VRCPCommon_phone 
, 
VRCPCommon.fax 
VRCPCommon_fax 
, 
VRCPInterest.Info 
VRCPInterest_Info 
, 
VRCPCommon.SurName 
VRCPCommon_SurName 
, 
VRCPCommon.Family 
VRCPCommon_Family 
, VRCPInterest.InstanceID InstanceID 
, VRCPInterest.VRCPInterestID ID 
, 'VRCPInterest' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPInterest
 join INSTANCE on VRCPInterest.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join VRCPCommon ON VRCPCommon.InstanceID=VRCPInterest.InstanceID 
;
create or replace view V_viewVRCPCommon as 
select   VRCPCommonID
, 
VRCPCommon.Privelegie 
VRCPCommon_Privelegie 
, 
VRCPCommon.the_Comment 
VRCPCommon_Comment 
, 
VRCPCommon.email 
VRCPCommon_email 
, 
VRCPCommon.Family 
VRCPCommon_Family 
, 
VRCPCommon.SurName 
VRCPCommon_SurName 
, 
 VRCPCommon.Curator  
VRCPCommon_Curator_ID, 
 Func.Users_BRIEF_F(VRCPCommon.Curator) 
VRCPCommon_Curator 
, 
 VRCPCommon.Loyality  
VRCPCommon_Loyality_ID, 
 Func.VRDLoyalty_BRIEF_F(VRCPCommon.Loyality) 
VRCPCommon_Loyality 
, 
VRCPCommon.Name 
VRCPCommon_Name 
, 
VRCPCommon.fax 
VRCPCommon_fax 
, 
VRCPCommon.phone 
VRCPCommon_phone 
, VRCPCommon.InstanceID InstanceID 
, VRCPCommon.VRCPCommonID ID 
, 'VRCPCommon' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPCommon
 join INSTANCE on VRCPCommon.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOVRCPCommon as 
select   VRCPCommonID
, 
VRCPCommon.ActionReason 
VRCPCommon_ActionReason 
, 
VRCPCommon.the_Comment 
VRCPCommon_the_Comment 
, 
VRCPCommon.email 
VRCPCommon_email 
, 
VRCPCommon.phone 
VRCPCommon_phone 
, 
 VRCPCommon.Curator  
VRCPCommon_Curator_ID, 
 Func.Users_BRIEF_F(VRCPCommon.Curator) 
VRCPCommon_Curator 
, 
VRCPCommon.ActionStart 
VRCPCommon_ActionStart 
, 
 VRCPCommon.PersonDeYuro  
VRCPCommon_PersonDeYuro_VAL, 
 decode(VRCPCommon.PersonDeYuro 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
VRCPCommon_PersonDeYuro 
, 
VRCPCommon.SurName 
VRCPCommon_SurName 
, 
VRCPCommon.mobile 
VRCPCommon_mobile 
, 
VRCPCommon.fax 
VRCPCommon_fax 
, 
VRCPCommon.Family 
VRCPCommon_Family 
, 
VRCPCommon.ActionEnd 
VRCPCommon_ActionEnd 
, 
VRCPCommon.Privelegie 
VRCPCommon_Privelegie 
, 
VRCPCommon.Name 
VRCPCommon_Name 
, 
VRCPCommon.Address 
VRCPCommon_Address 
, 
 VRCPCommon.Loyality  
VRCPCommon_Loyality_ID, 
 Func.VRDLoyalty_BRIEF_F(VRCPCommon.Loyality) 
VRCPCommon_Loyality 
, 
VRCPCommon.PassportInfo 
VRCPCommon_PassportInfo 
, VRCPCommon.InstanceID InstanceID 
, VRCPCommon.VRCPCommonID ID 
, 'VRCPCommon' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VRCPCommon
 join INSTANCE on VRCPCommon.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKZR_DATA as 
select   PEKZR_DATAID
, 
PEKZR_DATA.TheDate 
PEKZR_DATA_TheDate 
, 
 PEKZR_DATA.TheDept  
PEKZR_DATA_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKZR_DATA.TheDept) 
PEKZR_DATA_TheDept 
, 
PEKZR_DATA.TheValue 
PEKZR_DATA_TheValue 
, PEKZR_DATA.InstanceID InstanceID 
, PEKZR_DATA.PEKZR_DATAID ID 
, 'PEKZR_DATA' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKZR_DATA
 join INSTANCE on PEKZR_DATA.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKZR_PEKZR_DATA as 
select   PEKZR_DATAID
, 
PEKZR_DATA.TheValue 
PEKZR_DATA_TheValue 
, 
PEKZR_DATA.TheDate 
PEKZR_DATA_TheDate 
, 
 PEKZR_DATA.TheDept  
PEKZR_DATA_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKZR_DATA.TheDept) 
PEKZR_DATA_TheDept 
, PEKZR_DATA.InstanceID InstanceID 
, PEKZR_DATA.PEKZR_DATAID ID 
, 'PEKZR_DATA' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKZR_DATA
 join INSTANCE on PEKZR_DATA.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWEBCRD_NUM as 
select   WEBCRD_NUMID
, 
WEBCRD_NUM.ActivationTime 
WEBCRD_NUM_ActivationTime 
, 
WEBCRD_NUM.TheNumber 
WEBCRD_NUM_TheNumber 
, 
 WEBCRD_NUM.Activated  
WEBCRD_NUM_Activated_VAL, 
 decode(WEBCRD_NUM.Activated 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBCRD_NUM_Activated 
, 
 WEBCRD_NUM.ActivatedBy  
WEBCRD_NUM_ActivatedBy_ID, 
 Func.INSTANCE_BRIEF_F(WEBCRD_NUM.ActivatedBy) 
WEBCRD_NUM_ActivatedBy 
, WEBCRD_NUM.InstanceID InstanceID 
, WEBCRD_NUM.WEBCRD_NUMID ID 
, 'WEBCRD_NUM' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBCRD_NUM
 join INSTANCE on WEBCRD_NUM.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOWBCRD_DEF as 
select   WBCRD_DEFID
, 
 WBCRD_DEF.TheCurrency  
WBCRD_DEF_TheCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(WBCRD_DEF.TheCurrency) 
WBCRD_DEF_TheCurrency 
, 
WBCRD_DEF.ExpDate 
WBCRD_DEF_ExpDate 
, 
WBCRD_DEF.TheDate 
WBCRD_DEF_TheDate 
, 
WBCRD_DEF.CardSumm 
WBCRD_DEF_CardSumm 
, WBCRD_DEF.InstanceID InstanceID 
, WBCRD_DEF.WBCRD_DEFID ID 
, 'WBCRD_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WBCRD_DEF
 join INSTANCE on WBCRD_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewWEBCRD_WBCRD_DEF as 
select   WBCRD_DEFID
, 
WBCRD_DEF.ExpDate 
WBCRD_DEF_ExpDate 
, 
 WBCRD_DEF.TheCurrency  
WBCRD_DEF_TheCurrency_ID, 
 Func.ENTDIC_CURRENCY_BRIEF_F(WBCRD_DEF.TheCurrency) 
WBCRD_DEF_TheCurrency 
, 
WBCRD_DEF.TheDate 
WBCRD_DEF_TheDate 
, 
WBCRD_DEF.CardSumm 
WBCRD_DEF_CardSumm 
, WBCRD_DEF.InstanceID InstanceID 
, WBCRD_DEF.WBCRD_DEFID ID 
, 'WBCRD_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WBCRD_DEF
 join INSTANCE on WBCRD_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKO_DEF as 
select   PEKO_DEFID
, 
PEKO_DEF.Code1C 
PEKO_DEF_Code1C 
, 
 PEKO_DEF.ToClient  
PEKO_DEF_ToClient_ID, 
 Func.INSTANCE_BRIEF_F(PEKO_DEF.ToClient) 
PEKO_DEF_ToClient 
, 
 PEKO_DEF.TheDept  
PEKO_DEF_TheDept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKO_DEF.TheDept) 
PEKO_DEF_TheDept 
, 
PEKO_DEF.PLPNUM 
PEKO_DEF_PLPNUM 
, 
PEKO_DEF.PLPDate 
PEKO_DEF_PLPDate 
, 
PEKO_DEF.TheComment 
PEKO_DEF_TheComment 
, 
PEKO_DEF.PLPSumm 
PEKO_DEF_PLPSumm 
, PEKO_DEF.InstanceID InstanceID 
, PEKO_DEF.PEKO_DEFID ID 
, 'PEKO_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKO_DEF
 join INSTANCE on PEKO_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKL_DEF as 
select   PEKL_DEFID
, 
PEKL_DEF.ToDate 
PEKL_DEF_ToDate 
, 
PEKL_DEF.FromDate 
PEKL_DEF_FromDate 
, 
 PEKL_DEF.TheDep  
PEKL_DEF_TheDep_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKL_DEF.TheDep) 
PEKL_DEF_TheDep 
, PEKL_DEF.InstanceID InstanceID 
, PEKL_DEF.PEKL_DEFID ID 
, 'PEKL_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKL_DEF
 join INSTANCE on PEKL_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKL_PEKL_DEF as 
select   PEKL_DEFID
, 
PEKL_DEF.FromDate 
PEKL_DEF_FromDate 
, 
 PEKL_DEF.TheDep  
PEKL_DEF_TheDep_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKL_DEF.TheDep) 
PEKL_DEF_TheDep 
, 
PEKL_DEF.ToDate 
PEKL_DEF_ToDate 
, PEKL_DEF.InstanceID InstanceID 
, PEKL_DEF.PEKL_DEFID ID 
, 'PEKL_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKL_DEF
 join INSTANCE on PEKL_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKL_WDAY as 
select   PEKL_WDAYID
, 
 PEKL_WDAY.GOTYPE  
PEKL_WDAY_GOTYPE_ID, 
 Func.PEKD_GOTYPE_BRIEF_F(PEKL_WDAY.GOTYPE) 
PEKL_WDAY_GOTYPE 
, 
PEKL_WDAY.WeightValue 
PEKL_WDAY_WeightValue 
, 
PEKL_WDAY.TheValue 
PEKL_WDAY_TheValue 
, 
 PEKL_WDAY.Train  
PEKL_WDAY_Train_ID, 
 Func.PEKD_TRAINS_BRIEF_F(PEKL_WDAY.Train) 
PEKL_WDAY_Train 
, 
PEKL_WDAY.the_Description 
PEKL_WDAY_the_Description 
, 
 PEKL_WDAY.WeightEDIZM  
PEKL_WDAY_WeightEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKL_WDAY.WeightEDIZM) 
PEKL_WDAY_WeightEDIZM 
, 
 PEKL_WDAY.TheValueEDIZM  
PEKL_WDAY_TheValueEDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKL_WDAY.TheValueEDIZM) 
PEKL_WDAY_TheValueEDIZM 
, PEKL_WDAY.InstanceID InstanceID 
, PEKL_WDAY.PEKL_WDAYID ID 
, 'PEKL_WDAY' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKL_WDAY
 join INSTANCE on PEKL_WDAY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_ADDS as 
select   PEKD_ADDSID
, 
PEKD_ADDS.Name 
PEKD_ADDS_Name 
, 
 PEKD_ADDS.CalcType  
PEKD_ADDS_CalcType_VAL, 
 decode(PEKD_ADDS.CalcType 
, 1 ,'Объем'
, 2 ,'Плотность'
, 3 ,'Прочее'
, 0 ,'Вес'
, '???') 
PEKD_ADDS_CalcType 
, PEKD_ADDS.InstanceID InstanceID 
, PEKD_ADDS.PEKD_ADDSID ID 
, 'PEKD_ADDS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_ADDS
 join INSTANCE on PEKD_ADDS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_TRAINTYPE as 
select   PEKD_TRAINTYPEID
, 
PEKD_TRAINTYPE.name 
PEKD_TRAINTYPE_name 
, PEKD_TRAINTYPE.InstanceID InstanceID 
, PEKD_TRAINTYPE.PEKD_TRAINTYPEID ID 
, 'PEKD_TRAINTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_TRAINTYPE
 join INSTANCE on PEKD_TRAINTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_TRAINTYPE as 
select   PEKD_TRAINTYPEID
, 
PEKD_TRAINTYPE.name 
PEKD_TRAINTYPE_name 
, PEKD_TRAINTYPE.InstanceID InstanceID 
, PEKD_TRAINTYPE.PEKD_TRAINTYPEID ID 
, 'PEKD_TRAINTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_TRAINTYPE
 join INSTANCE on PEKD_TRAINTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_AUTO as 
select   PEKD_AUTOID
, 
PEKD_AUTO.TheDimentions 
PEKD_AUTO_TheDimentions 
, 
PEKD_AUTO.TheVolume 
PEKD_AUTO_TheVolume 
, 
PEKD_AUTO.Name 
PEKD_AUTO_Name 
, PEKD_AUTO.InstanceID InstanceID 
, PEKD_AUTO.PEKD_AUTOID ID 
, 'PEKD_AUTO' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_AUTO
 join INSTANCE on PEKD_AUTO.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_AUTO as 
select   PEKD_AUTOID
, 
PEKD_AUTO.TheDimentions 
PEKD_AUTO_TheDimentions 
, 
PEKD_AUTO.TheVolume 
PEKD_AUTO_TheVolume 
, 
PEKD_AUTO.Name 
PEKD_AUTO_Name 
, PEKD_AUTO.InstanceID InstanceID 
, PEKD_AUTO.PEKD_AUTOID ID 
, 'PEKD_AUTO' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_AUTO
 join INSTANCE on PEKD_AUTO.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_GOTYPE as 
select   PEKD_GOTYPEID
, 
PEKD_GOTYPE.name 
PEKD_GOTYPE_name 
, PEKD_GOTYPE.InstanceID InstanceID 
, PEKD_GOTYPE.PEKD_GOTYPEID ID 
, 'PEKD_GOTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_GOTYPE
 join INSTANCE on PEKD_GOTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_GOTYPE as 
select   PEKD_GOTYPEID
, 
PEKD_GOTYPE.name 
PEKD_GOTYPE_name 
, PEKD_GOTYPE.InstanceID InstanceID 
, PEKD_GOTYPE.PEKD_GOTYPEID ID 
, 'PEKD_GOTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_GOTYPE
 join INSTANCE on PEKD_GOTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_INFOSENDTYPE as 
select   PEKD_INFOSENDTYPEID
, 
PEKD_INFOSENDTYPE.Name 
PEKD_INFOSENDTYPE_Name 
, PEKD_INFOSENDTYPE.InstanceID InstanceID 
, PEKD_INFOSENDTYPE.PEKD_INFOSENDTYPEID ID 
, 'PEKD_INFOSENDTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_INFOSENDTYPE
 join INSTANCE on PEKD_INFOSENDTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_INFOSENDTYPE as 
select   PEKD_INFOSENDTYPEID
, 
PEKD_INFOSENDTYPE.Name 
PEKD_INFOSENDTYPE_Name 
, PEKD_INFOSENDTYPE.InstanceID InstanceID 
, PEKD_INFOSENDTYPE.PEKD_INFOSENDTYPEID ID 
, 'PEKD_INFOSENDTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_INFOSENDTYPE
 join INSTANCE on PEKD_INFOSENDTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_TRTYPE as 
select   PEKD_TRTYPEID
, 
PEKD_TRTYPE.name 
PEKD_TRTYPE_name 
, PEKD_TRTYPE.InstanceID InstanceID 
, PEKD_TRTYPE.PEKD_TRTYPEID ID 
, 'PEKD_TRTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_TRTYPE
 join INSTANCE on PEKD_TRTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_TRTYPE as 
select   PEKD_TRTYPEID
, 
PEKD_TRTYPE.name 
PEKD_TRTYPE_name 
, PEKD_TRTYPE.InstanceID InstanceID 
, PEKD_TRTYPE.PEKD_TRTYPEID ID 
, 'PEKD_TRTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_TRTYPE
 join INSTANCE on PEKD_TRTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_POSTTYPE as 
select   PEKD_POSTTYPEID
, 
PEKD_POSTTYPE.Name 
PEKD_POSTTYPE_Name 
, PEKD_POSTTYPE.InstanceID InstanceID 
, PEKD_POSTTYPE.PEKD_POSTTYPEID ID 
, 'PEKD_POSTTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_POSTTYPE
 join INSTANCE on PEKD_POSTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_POSTTYPE as 
select   PEKD_POSTTYPEID
, 
PEKD_POSTTYPE.Name 
PEKD_POSTTYPE_Name 
, PEKD_POSTTYPE.InstanceID InstanceID 
, PEKD_POSTTYPE.PEKD_POSTTYPEID ID 
, 'PEKD_POSTTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_POSTTYPE
 join INSTANCE on PEKD_POSTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_TRFGRP as 
select   PEKD_TRFGRPID
, 
PEKD_TRFGRP.name 
PEKD_TRFGRP_name 
, PEKD_TRFGRP.InstanceID InstanceID 
, PEKD_TRFGRP.PEKD_TRFGRPID ID 
, 'PEKD_TRFGRP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_TRFGRP
 join INSTANCE on PEKD_TRFGRP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_TRFGRP as 
select   PEKD_TRFGRPID
, 
PEKD_TRFGRP.name 
PEKD_TRFGRP_name 
, PEKD_TRFGRP.InstanceID InstanceID 
, PEKD_TRFGRP.PEKD_TRFGRPID ID 
, 'PEKD_TRFGRP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_TRFGRP
 join INSTANCE on PEKD_TRFGRP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_TRFTYPE as 
select   PEKD_TRFTYPEID,PEKD_TRFGRPID
, 
PEKD_TRFGRP.name 
PEKD_TRFGRP_name 
, 
PEKD_TRFTYPE.name 
PEKD_TRFTYPE_name 
, PEKD_TRFGRP.InstanceID InstanceID 
, PEKD_TRFTYPE.PEKD_TRFTYPEID ID 
, 'PEKD_TRFTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_TRFTYPE
 join PEKD_TRFGRP on PEKD_TRFGRP.PEKD_TRFGRPID=PEKD_TRFTYPE.ParentStructRowID 
 join INSTANCE on PEKD_TRFGRP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_TRFTYPE as 
select   PEKD_TRFTYPEID,PEKD_TRFGRPID
, 
PEKD_TRFTYPE.name 
PEKD_TRFTYPE_name 
, PEKD_TRFGRP.InstanceID InstanceID 
, PEKD_TRFTYPE.PEKD_TRFTYPEID ID 
, 'PEKD_TRFTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_TRFTYPE
 join PEKD_TRFGRP on PEKD_TRFGRP.PEKD_TRFGRPID=PEKD_TRFTYPE.ParentStructRowID 
 join INSTANCE on PEKD_TRFGRP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_DEPT as 
select   PEKD_DEPTID
, 
PEKD_DEPT.name 
PEKD_DEPT_name 
, 
PEKD_DEPT.Address 
PEKD_DEPT_Address 
, PEKD_DEPT.InstanceID InstanceID 
, PEKD_DEPT.PEKD_DEPTID ID 
, 'PEKD_DEPT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_DEPT
 join INSTANCE on PEKD_DEPT.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_DEPT as 
select   PEKD_DEPTID
, 
PEKD_DEPT.PGDPName 
PEKD_DEPT_PGDPName 
, 
 PEKD_DEPT.town  
PEKD_DEPT_town_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(PEKD_DEPT.town) 
PEKD_DEPT_town 
, 
PEKD_DEPT.Address 
PEKD_DEPT_Address 
, 
 PEKD_DEPT.Supplier  
PEKD_DEPT_Supplier_ID, 
 Func.INSTANCE_BRIEF_F(PEKD_DEPT.Supplier) 
PEKD_DEPT_Supplier 
, 
PEKD_DEPT.Code1C 
PEKD_DEPT_Code1C 
, 
PEKD_DEPT.DocPrefix 
PEKD_DEPT_DocPrefix 
, 
PEKD_DEPT.name 
PEKD_DEPT_name 
, PEKD_DEPT.InstanceID InstanceID 
, PEKD_DEPT.PEKD_DEPTID ID 
, 'PEKD_DEPT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_DEPT
 join INSTANCE on PEKD_DEPT.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_DEPLIMITS as 
select   PEKD_DEPLIMITSID,PEKD_DEPTID
, 
 PEKD_DEPLIMITS.Supplier  
PEKD_DEPLIMITS_Supplier_ID, 
 Func.INSTANCE_BRIEF_F(PEKD_DEPLIMITS.Supplier) 
PEKD_DEPLIMITS_Supplier 
, 
PEKD_DEPLIMITS.DaysToCrash 
PEKD_DEPLIMITS_DaysToCrash 
, 
PEKD_DEPLIMITS.LimitMark 
PEKD_DEPLIMITS_LimitMark 
, PEKD_DEPT.InstanceID InstanceID 
, PEKD_DEPLIMITS.PEKD_DEPLIMITSID ID 
, 'PEKD_DEPLIMITS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_DEPLIMITS
 join PEKD_DEPT on PEKD_DEPT.PEKD_DEPTID=PEKD_DEPLIMITS.ParentStructRowID 
 join INSTANCE on PEKD_DEPT.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_DEPDOG as 
select   PEKD_DEPDOGID,PEKD_DEPTID
, 
 PEKD_DEPDOG.TheDogovor  
PEKD_DEPDOG_TheDogovor_ID, 
 Func.INSTANCE_BRIEF_F(PEKD_DEPDOG.TheDogovor) 
PEKD_DEPDOG_TheDogovor 
, 
 PEKD_DEPDOG.Supplier  
PEKD_DEPDOG_Supplier_ID, 
 Func.INSTANCE_BRIEF_F(PEKD_DEPDOG.Supplier) 
PEKD_DEPDOG_Supplier 
, PEKD_DEPT.InstanceID InstanceID 
, PEKD_DEPDOG.PEKD_DEPDOGID ID 
, 'PEKD_DEPDOG' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_DEPDOG
 join PEKD_DEPT on PEKD_DEPT.PEKD_DEPTID=PEKD_DEPDOG.ParentStructRowID 
 join INSTANCE on PEKD_DEPT.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_DIRECTION as 
select   PEKD_DIRECTIONID
, 
 PEKD_DIRECTION.Town  
PEKD_DIRECTION_Town_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(PEKD_DIRECTION.Town) 
PEKD_DIRECTION_Town 
, 
 PEKD_DIRECTION.Dept  
PEKD_DIRECTION_Dept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKD_DIRECTION.Dept) 
PEKD_DIRECTION_Dept 
, 
 PEKD_DIRECTION.TheTransport  
PEKD_DIRECTION_TheTransport_ID, 
 Func.ENTDIC_TransportType_BRIEF_F(PEKD_DIRECTION.TheTransport) 
PEKD_DIRECTION_TheTransport 
, 
PEKD_DIRECTION.the_Rule 
PEKD_DIRECTION_the_Rule 
, 
PEKD_DIRECTION.Name 
PEKD_DIRECTION_Name 
, 
PEKD_DIRECTION.POSTINDEX 
PEKD_DIRECTION_POSTINDEX 
, 
PEKD_DIRECTION.Srok 
PEKD_DIRECTION_Srok 
, 
 PEKD_DIRECTION.TheAgent  
PEKD_DIRECTION_TheAgent_ID, 
 Func.INSTANCE_BRIEF_F(PEKD_DIRECTION.TheAgent) 
PEKD_DIRECTION_TheAgent 
, PEKD_DIRECTION.InstanceID InstanceID 
, PEKD_DIRECTION.PEKD_DIRECTIONID ID 
, 'PEKD_DIRECTION' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_DIRECTION
 join INSTANCE on PEKD_DIRECTION.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_DIRECTION as 
select   PEKD_DIRECTIONID
, 
PEKD_DIRECTION.Srok 
PEKD_DIRECTION_Srok 
, 
PEKD_DIRECTION.Name 
PEKD_DIRECTION_Name 
, 
 PEKD_DIRECTION.Dept  
PEKD_DIRECTION_Dept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKD_DIRECTION.Dept) 
PEKD_DIRECTION_Dept 
, 
 PEKD_DIRECTION.Town  
PEKD_DIRECTION_Town_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(PEKD_DIRECTION.Town) 
PEKD_DIRECTION_Town 
, 
PEKD_DIRECTION.the_Rule 
PEKD_DIRECTION_Rule 
, PEKD_DIRECTION.InstanceID InstanceID 
, PEKD_DIRECTION.PEKD_DIRECTIONID ID 
, 'PEKD_DIRECTION' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_DIRECTION
 join INSTANCE on PEKD_DIRECTION.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_TRAINS as 
select   PEKD_TRAINSID,PEKD_DIRECTIONID
, 
PEKD_TRAINS.TheComment 
PEKD_TRAINS_TheComment 
, 
PEKD_TRAINS.TrainNo 
PEKD_TRAINS_TrainNo 
, 
 PEKD_TRAINS.TrainType  
PEKD_TRAINS_TrainType_ID, 
 Func.PEKD_TRAINTYPE_BRIEF_F(PEKD_TRAINS.TrainType) 
PEKD_TRAINS_TrainType 
, 
 PEKD_TRAINS.ToSTATION  
PEKD_TRAINS_ToSTATION_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(PEKD_TRAINS.ToSTATION) 
PEKD_TRAINS_ToSTATION 
, 
PEKD_TRAINS.the_Rule 
PEKD_TRAINS_the_Rule 
, 
PEKD_TRAINS.TheDesciption 
PEKD_TRAINS_TheDesciption 
, 
 PEKD_TRAINS.FromStation  
PEKD_TRAINS_FromStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(PEKD_TRAINS.FromStation) 
PEKD_TRAINS_FromStation 
, PEKD_DIRECTION.InstanceID InstanceID 
, PEKD_TRAINS.PEKD_TRAINSID ID 
, 'PEKD_TRAINS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_TRAINS
 join PEKD_DIRECTION on PEKD_DIRECTION.PEKD_DIRECTIONID=PEKD_TRAINS.ParentStructRowID 
 join INSTANCE on PEKD_DIRECTION.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_TRAINS as 
select   PEKD_TRAINSID,PEKD_DIRECTIONID
, 
 PEKD_TRAINS.FromStation  
PEKD_TRAINS_FromStation_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(PEKD_TRAINS.FromStation) 
PEKD_TRAINS_FromStation 
, 
PEKD_DIRECTION.the_Rule 
PEKD_DIRECTION_Rule 
, 
 PEKD_DIRECTION.Town  
PEKD_DIRECTION_Town_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(PEKD_DIRECTION.Town) 
PEKD_DIRECTION_Town 
, 
PEKD_DIRECTION.Name 
PEKD_DIRECTION_Name 
, 
PEKD_TRAINS.TheComment 
PEKD_TRAINS_TheComment 
, 
PEKD_TRAINS.TrainNo 
PEKD_TRAINS_TrainNo 
, 
 PEKD_DIRECTION.Dept  
PEKD_DIRECTION_Dept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKD_DIRECTION.Dept) 
PEKD_DIRECTION_Dept 
, 
PEKD_TRAINS.the_Rule 
PEKD_TRAINS_Rule 
, 
PEKD_DIRECTION.Srok 
PEKD_DIRECTION_Srok 
, 
 PEKD_TRAINS.ToSTATION  
PEKD_TRAINS_ToSTATION_ID, 
 Func.PEKD_DIRSTATION_BRIEF_F(PEKD_TRAINS.ToSTATION) 
PEKD_TRAINS_ToSTATION 
, 
PEKD_TRAINS.TheDesciption 
PEKD_TRAINS_TheDesciption 
, 
 PEKD_TRAINS.TrainType  
PEKD_TRAINS_TrainType_ID, 
 Func.PEKD_TRAINTYPE_BRIEF_F(PEKD_TRAINS.TrainType) 
PEKD_TRAINS_TrainType 
, PEKD_DIRECTION.InstanceID InstanceID 
, PEKD_TRAINS.PEKD_TRAINSID ID 
, 'PEKD_TRAINS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_TRAINS
 join PEKD_DIRECTION on PEKD_DIRECTION.PEKD_DIRECTIONID=PEKD_TRAINS.ParentStructRowID 
 join INSTANCE on PEKD_DIRECTION.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_DIRSTATION as 
select   PEKD_DIRSTATIONID,PEKD_DIRECTIONID
, 
 PEKD_DIRECTION.Dept  
PEKD_DIRECTION_Dept_ID, 
 Func.PEKD_DEPT_BRIEF_F(PEKD_DIRECTION.Dept) 
PEKD_DIRECTION_Dept 
, 
 PEKD_DIRECTION.Town  
PEKD_DIRECTION_Town_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(PEKD_DIRECTION.Town) 
PEKD_DIRECTION_Town 
, 
PEKD_DIRECTION.the_Rule 
PEKD_DIRECTION_Rule 
, 
 PEKD_DIRSTATION.TheNextTown  
PEKD_DIRSTATION_TheNextTown_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(PEKD_DIRSTATION.TheNextTown) 
PEKD_DIRSTATION_TheNextTown 
, 
PEKD_DIRECTION.Name 
PEKD_DIRECTION_Name 
, 
PEKD_DIRSTATION.name 
PEKD_DIRSTATION_name 
, 
PEKD_DIRECTION.Srok 
PEKD_DIRECTION_Srok 
, PEKD_DIRECTION.InstanceID InstanceID 
, PEKD_DIRSTATION.PEKD_DIRSTATIONID ID 
, 'PEKD_DIRSTATION' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_DIRSTATION
 join PEKD_DIRECTION on PEKD_DIRECTION.PEKD_DIRECTIONID=PEKD_DIRSTATION.ParentStructRowID 
 join INSTANCE on PEKD_DIRECTION.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_DIRSTATION as 
select   PEKD_DIRSTATIONID,PEKD_DIRECTIONID
, 
PEKD_DIRSTATION.POSTINDEX 
PEKD_DIRSTATION_POSTINDEX 
, 
 PEKD_DIRSTATION.TheNextTown  
PEKD_DIRSTATION_TheNextTown_ID, 
 Func.ENTDIC_TOWN_BRIEF_F(PEKD_DIRSTATION.TheNextTown) 
PEKD_DIRSTATION_TheNextTown 
, 
PEKD_DIRSTATION.name 
PEKD_DIRSTATION_name 
, 
 PEKD_DIRSTATION.region  
PEKD_DIRSTATION_region_ID, 
 Func.ENTDIC_REGION_BRIEF_F(PEKD_DIRSTATION.region) 
PEKD_DIRSTATION_region 
, 
PEKD_DIRSTATION.area 
PEKD_DIRSTATION_area 
, PEKD_DIRECTION.InstanceID InstanceID 
, PEKD_DIRSTATION.PEKD_DIRSTATIONID ID 
, 'PEKD_DIRSTATION' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_DIRSTATION
 join PEKD_DIRECTION on PEKD_DIRECTION.PEKD_DIRECTIONID=PEKD_DIRSTATION.ParentStructRowID 
 join INSTANCE on PEKD_DIRECTION.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_AUTOPEKD_SRV as 
select   PEKD_SRVID
, 
PEKD_SRV.Code1C 
PEKD_SRV_Code1C 
, 
 PEKD_SRV.DependOnWeight  
PEKD_SRV_DependOnWeight_VAL, 
 decode(PEKD_SRV.DependOnWeight 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PEKD_SRV_DependOnWeight 
, 
 PEKD_SRV.EDIZM  
PEKD_SRV_EDIZM_ID, 
 Func.ENTDIC_EDIZM_BRIEF_F(PEKD_SRV.EDIZM) 
PEKD_SRV_EDIZM 
, 
PEKD_SRV.name 
PEKD_SRV_name 
, PEKD_SRV.InstanceID InstanceID 
, PEKD_SRV.PEKD_SRVID ID 
, 'PEKD_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_SRV
 join INSTANCE on PEKD_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;
create or replace view V_viewPEKD_PEKD_SRV as 
select   PEKD_SRVID
, 
PEKD_SRV.name 
PEKD_SRV_name 
, PEKD_SRV.InstanceID InstanceID 
, PEKD_SRV.PEKD_SRVID ID 
, 'PEKD_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PEKD_SRV
 join INSTANCE on PEKD_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
;


