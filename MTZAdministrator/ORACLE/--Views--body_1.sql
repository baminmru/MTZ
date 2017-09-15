
/* --body*/

 

create or replace view v_INSTANCE as
select instance.*,objstatus.name statusname,objstatus.IsArchive
from instance left join objstatus on instance.status=objstatus.objstatusid
/

create or replace view V_AUTOSrvMessageInfo as 
select   SrvMessageInfoID
, 
SrvMessageInfo.MsgInfo 
SrvMessageInfo_MsgInfo 
, 
SrvMessageInfo.msgDate 
SrvMessageInfo_msgDate 
, 
 SrvMessageInfo.ForUser  
SrvMessageInfo_ForUser_ID, 
 MTZ.Func.Users_BRIEF_F(SrvMessageInfo.ForUser) 
SrvMessageInfo_ForUser 
, 
 SrvMessageInfo.TheDocument  
SrvMessageInfo_TheDocument_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(SrvMessageInfo.TheDocument) 
SrvMessageInfo_TheDocument 
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
/
create or replace view V_viewSTDMail_Info as 
select   STDMail_InfoID
, 
 STDMail_Info.IsDelete  
STDMail_Info_IsDelete_VAL, 
 decode(STDMail_Info.IsDelete 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
STDMail_Info_IsDelete 
, 
STDMail_Info.TheFromName 
STDMail_Info_TheFromName 
, 
STDMail_Info.SentDT 
STDMail_Info_SentDT 
, 
 STDMail_Info.Sended  
STDMail_Info_Sended_VAL, 
 decode(STDMail_Info.Sended 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
STDMail_Info_Sended 
, 
STDMail_Info.CreatedDT 
STDMail_Info_CreatedDT 
, 
STDMail_Info.TheBody 
STDMail_Info_TheBody 
, 
STDMail_Info.Subject 
STDMail_Info_Subject 
, STDMail_Info.InstanceID InstanceID 
, STDMail_Info.STDMail_InfoID ID 
, 'STDMail_Info' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from STDMail_Info
 join INSTANCE on STDMail_Info.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_viewITTOPT_ITTOPT_MOVE as 
select   ITTOPT_MOVEID
, 
ITTOPT_MOVE.ThePalletteNum 
ITTOPT_MOVE_ThePalletteNum 
, 
ITTOPT_DEF.DateToOptimize 
ITTOPT_DEF_DateToOptimize 
, 
ITTOPT_DEF.Factory 
ITTOPT_DEF_Factory 
, 
ITTOPT_DEF.made_country 
ITTOPT_DEF_made_country 
, 
ITTOPT_DEF.OPtDate 
ITTOPT_DEF_OPtDate 
, 
 ITTOPT_DEF.OptType  
ITTOPT_DEF_OptType_ID, 
 MTZ.Func.ITTD_OPTTYPE_BRIEF_F(ITTOPT_DEF.OptType) 
ITTOPT_DEF_OptType 
, 
ITTOPT_DEF.KILL_NUMBER 
ITTOPT_DEF_KILL_NUMBER 
, 
ITTOPT_DEF.TheClient 
ITTOPT_DEF_TheClient 
, 
ITTOPT_MOVE.sequence 
ITTOPT_MOVE_sequence 
, 
ITTOPT_MOVE.ToLocation 
ITTOPT_MOVE_ToLocation 
, 
ITTOPT_MOVE.FromLocation 
ITTOPT_MOVE_FromLocation 
, 
ITTOPT_DEF.IsBrak 
ITTOPT_DEF_IsBrak 
, 
ITTOPT_DEF.good 
ITTOPT_DEF_good 
, 
 ITTOPT_MOVE.ISMoved  
ITTOPT_MOVE_ISMoved_VAL, 
 decode(ITTOPT_MOVE.ISMoved 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOPT_MOVE_ISMoved 
, ITTOPT_MOVE.InstanceID InstanceID 
, ITTOPT_MOVE.ITTOPT_MOVEID ID 
, 'ITTOPT_MOVE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOPT_MOVE
 join INSTANCE on ITTOPT_MOVE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join ITTOPT_DEF ON ITTOPT_DEF.InstanceID=ITTOPT_MOVE.InstanceID 
/
create or replace view V_AUTOITTOPT_DEF as 
select   ITTOPT_DEFID
, 
ITTOPT_DEF.Factory 
ITTOPT_DEF_Factory 
, 
 ITTOPT_DEF.OptType  
ITTOPT_DEF_OptType_ID, 
 MTZ.Func.ITTD_OPTTYPE_BRIEF_F(ITTOPT_DEF.OptType) 
ITTOPT_DEF_OptType 
, 
ITTOPT_DEF.made_country 
ITTOPT_DEF_made_country 
, 
ITTOPT_DEF.good 
ITTOPT_DEF_good 
, 
ITTOPT_DEF.TheClient 
ITTOPT_DEF_TheClient 
, 
ITTOPT_DEF.OPtDate 
ITTOPT_DEF_OPtDate 
, 
ITTOPT_DEF.KILL_NUMBER 
ITTOPT_DEF_KILL_NUMBER 
, 
ITTOPT_DEF.IsBrak 
ITTOPT_DEF_IsBrak 
, 
ITTOPT_DEF.DateToOptimize 
ITTOPT_DEF_DateToOptimize 
, ITTOPT_DEF.InstanceID InstanceID 
, ITTOPT_DEF.ITTOPT_DEFID ID 
, 'ITTOPT_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOPT_DEF
 join INSTANCE on ITTOPT_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
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
/
create or replace view V_AUTONum_Values as 
select   Num_ValuesID,Num_zonesID
, 
Num_Values.the_Value 
Num_Values_the_Value 
, 
Num_Values.OwnerRowID 
Num_Values_OwnerRowID 
, 
Num_Values.OwnerPartName 
Num_Values_OwnerPartName 
, Num_zones.InstanceID InstanceID 
, Num_Values.Num_ValuesID ID 
, 'Num_Values' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Num_Values
 join Num_zones on Num_zones.Num_zonesID=Num_Values.ParentStructRowID 
 join INSTANCE on Num_zones.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
create or replace view V_AUTONum_head as 
select   Num_headID
, 
Num_head.Name 
Num_head_Name 
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
, Num_head.InstanceID InstanceID 
, Num_head.Num_headID ID 
, 'Num_head' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Num_head
 join INSTANCE on Num_head.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOFilterFieldGroup as 
select   FilterFieldGroupID
, 
 FilterFieldGroup.AllowIgnore  
FilterFieldGroup_AllowIgnore_VAL, 
 decode(FilterFieldGroup.AllowIgnore 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FilterFieldGroup_AllowIgnore 
, 
FilterFieldGroup.sequence 
FilterFieldGroup_sequence 
, 
FilterFieldGroup.Name 
FilterFieldGroup_Name 
, 
FilterFieldGroup.Caption 
FilterFieldGroup_Caption 
, FilterFieldGroup.InstanceID InstanceID 
, FilterFieldGroup.FilterFieldGroupID ID 
, 'FilterFieldGroup' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FilterFieldGroup
 join INSTANCE on FilterFieldGroup.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOFileterField as 
select   FileterFieldID,FilterFieldGroupID
, 
 FileterField.ValueArray  
FileterField_ValueArray_VAL, 
 decode(FileterField.ValueArray 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FileterField_ValueArray 
, 
FileterField.sequence 
FileterField_sequence 
, 
 FileterField.RefToType  
FileterField_RefToType_ID, 
 MTZ.Func.OBJECTTYPE_BRIEF_F(FileterField.RefToType) 
FileterField_RefToType 
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
FileterField.Caption 
FileterField_Caption 
, 
 FileterField.RefToPart  
FileterField_RefToPart_ID, 
 MTZ.Func.PART_BRIEF_F(FileterField.RefToPart) 
FileterField_RefToPart 
, 
FileterField.Name 
FileterField_Name 
, 
FileterField.FieldSize 
FileterField_FieldSize 
, 
 FileterField.FieldType  
FileterField_FieldType_ID, 
 MTZ.Func.FIELDTYPE_BRIEF_F(FileterField.FieldType) 
FileterField_FieldType 
, FilterFieldGroup.InstanceID InstanceID 
, FileterField.FileterFieldID ID 
, 'FileterField' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FileterField
 join FilterFieldGroup on FilterFieldGroup.FilterFieldGroupID=FileterField.ParentStructRowID 
 join INSTANCE on FilterFieldGroup.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
create or replace view V_AUTOFilters as 
select   FiltersID
, 
Filters.TheComment 
Filters_TheComment 
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
/
create or replace view V_AUTOStateAction as 
select   StateActionID
, 
 StateAction.NewSecurityStyle  
StateAction_NewSecurityStyle_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(StateAction.NewSecurityStyle) 
StateAction_NewSecurityStyle 
, 
StateAction.ActionScript 
StateAction_ActionScript 
, 
 StateAction.OnDocStatus  
StateAction_OnDocStatus_ID, 
 MTZ.Func.OBJSTATUS_BRIEF_F(StateAction.OnDocStatus) 
StateAction_OnDocStatus 
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
, 
StateAction.ActionClass 
StateAction_ActionClass 
, StateAction.InstanceID InstanceID 
, StateAction.StateActionID ID 
, 'StateAction' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from StateAction
 join INSTANCE on StateAction.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOMTZ2JOB_DEF as 
select   MTZ2JOB_DEFID
, 
MTZ2JOB_DEF.ProcessDate 
MTZ2JOB_DEF_ProcessDate 
, 
MTZ2JOB_DEF.EventDate 
MTZ2JOB_DEF_EventDate 
, 
 MTZ2JOB_DEF.ThruObject  
MTZ2JOB_DEF_ThruObject_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(MTZ2JOB_DEF.ThruObject) 
MTZ2JOB_DEF_ThruObject 
, 
MTZ2JOB_DEF.ThruState 
MTZ2JOB_DEF_ThruState 
, 
MTZ2JOB_DEF.NextState 
MTZ2JOB_DEF_NextState 
, 
MTZ2JOB_DEF.EvenType 
MTZ2JOB_DEF_EvenType 
, 
 MTZ2JOB_DEF.Processed  
MTZ2JOB_DEF_Processed_VAL, 
 decode(MTZ2JOB_DEF.Processed 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ2JOB_DEF_Processed 
, MTZ2JOB_DEF.InstanceID InstanceID 
, MTZ2JOB_DEF.MTZ2JOB_DEFID ID 
, 'MTZ2JOB_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZ2JOB_DEF
 join INSTANCE on MTZ2JOB_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOREPD_LOCKED as 
select   REPD_LOCKEDID
, 
REPD_LOCKED.FirstTry 
REPD_LOCKED_FirstTry 
, 
REPD_LOCKED.SourceFile 
REPD_LOCKED_SourceFile 
, 
REPD_LOCKED.The_RowID 
REPD_LOCKED_The_RowID 
, 
REPD_LOCKED.ReplicaRowID 
REPD_LOCKED_ReplicaRowID 
, 
REPD_LOCKED.ReplicaPackID 
REPD_LOCKED_ReplicaPackID 
, 
REPD_LOCKED.ObjectType 
REPD_LOCKED_ObjectType 
, 
REPD_LOCKED.LastTry 
REPD_LOCKED_LastTry 
, 
REPD_LOCKED.The_InstanceID 
REPD_LOCKED_The_InstanceID 
, 
REPD_LOCKED.StructType 
REPD_LOCKED_StructType 
, 
REPD_LOCKED.PartNumber 
REPD_LOCKED_PartNumber 
, 
REPD_LOCKED.PartCount 
REPD_LOCKED_PartCount 
, REPD_LOCKED.InstanceID InstanceID 
, REPD_LOCKED.REPD_LOCKEDID ID 
, 'REPD_LOCKED' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_LOCKED
 join INSTANCE on REPD_LOCKED.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOREPD_RequestQuery as 
select   REPD_RequestQueryID
, 
REPD_RequestQuery.ObjectID 
REPD_RequestQuery_ObjectID 
, 
 REPD_RequestQuery.Provider  
REPD_RequestQuery_Provider_ID, 
 MTZ.Func.REPD_PROV_BRIEF_F(REPD_RequestQuery.Provider) 
REPD_RequestQuery_Provider 
, 
REPD_RequestQuery.ReqPartName 
REPD_RequestQuery_ReqPartName 
, 
REPD_RequestQuery.ReqTypeName 
REPD_RequestQuery_ReqTypeName 
, 
 REPD_RequestQuery.DestSrv  
REPD_RequestQuery_DestSrv_ID, 
 MTZ.Func.REPD_SRV_BRIEF_F(REPD_RequestQuery.DestSrv) 
REPD_RequestQuery_DestSrv 
, 
 REPD_RequestQuery.SourceSrv  
REPD_RequestQuery_SourceSrv_ID, 
 MTZ.Func.REPD_SRV_BRIEF_F(REPD_RequestQuery.SourceSrv) 
REPD_RequestQuery_SourceSrv 
, 
 REPD_RequestQuery.SendRecord  
REPD_RequestQuery_SendRecord_ID, 
 MTZ.Func.REPD_SendQ_BRIEF_F(REPD_RequestQuery.SendRecord) 
REPD_RequestQuery_SendRecord 
, 
REPD_RequestQuery.TheRowID 
REPD_RequestQuery_TheRowID 
, REPD_RequestQuery.InstanceID InstanceID 
, REPD_RequestQuery.REPD_RequestQueryID ID 
, 'REPD_RequestQuery' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_RequestQuery
 join INSTANCE on REPD_RequestQuery.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOREPD_ResQueryRcv as 
select   REPD_ResQueryRcvID,REPD_RequestQueryID
, 
 REPD_ResQueryRcv.ReceiveRec  
REPD_ResQueryRcv_ReceiveRec_ID, 
 MTZ.Func.REPD_RecvQ_BRIEF_F(REPD_ResQueryRcv.ReceiveRec) 
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
/
create or replace view V_AUTOREPD_PROV as 
select   REPD_PROVID
, 
REPD_PROV.AssemblyName 
REPD_PROV_AssemblyName 
, 
REPD_PROV.Name 
REPD_PROV_Name 
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
/
create or replace view V_AUTOREPD_SRV as 
select   REPD_SRVID
, 
 REPD_SRV.Obj1  
REPD_SRV_Obj1_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(REPD_SRV.Obj1) 
REPD_SRV_Obj1 
, 
REPD_SRV.name 
REPD_SRV_name 
, 
 REPD_SRV.Obj2  
REPD_SRV_Obj2_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(REPD_SRV.Obj2) 
REPD_SRV_Obj2 
, 
 REPD_SRV.Obj3  
REPD_SRV_Obj3_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(REPD_SRV.Obj3) 
REPD_SRV_Obj3 
, REPD_SRV.InstanceID InstanceID 
, REPD_SRV.REPD_SRVID ID 
, 'REPD_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_SRV
 join INSTANCE on REPD_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOREPD_SNDTO as 
select   REPD_SNDTOID,REPD_SRVID
, 
 REPD_SNDTO.DestSrv  
REPD_SNDTO_DestSrv_ID, 
 MTZ.Func.REPD_SRV_BRIEF_F(REPD_SNDTO.DestSrv) 
REPD_SNDTO_DestSrv 
, 
REPD_SNDTO.Work_Start 
REPD_SNDTO_Work_Start 
, 
REPD_SNDTO.Work_End 
REPD_SNDTO_Work_End 
, 
 REPD_SNDTO.Provider  
REPD_SNDTO_Provider_ID, 
 MTZ.Func.REPD_PROV_BRIEF_F(REPD_SNDTO.Provider) 
REPD_SNDTO_Provider 
, 
REPD_SNDTO.LastScan 
REPD_SNDTO_LastScan 
, 
REPD_SNDTO.The_Interval 
REPD_SNDTO_The_Interval 
, 
REPD_SNDTO.LastReceive 
REPD_SNDTO_LastReceive 
, 
REPD_SNDTO.Config 
REPD_SNDTO_Config 
, REPD_SRV.InstanceID InstanceID 
, REPD_SNDTO.REPD_SNDTOID ID 
, 'REPD_SNDTO' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_SNDTO
 join REPD_SRV on REPD_SRV.REPD_SRVID=REPD_SNDTO.ParentStructRowID 
 join INSTANCE on REPD_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOREPD_SendQ as 
select   REPD_SendQID
, 
REPD_SendQ.SendSize 
REPD_SendQ_SendSize 
, 
 REPD_SendQ.Acknowelge  
REPD_SendQ_Acknowelge_VAL, 
 decode(REPD_SendQ.Acknowelge 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
REPD_SendQ_Acknowelge 
, 
REPD_SendQ.Config 
REPD_SendQ_Config 
, 
REPD_SendQ.CheckDate 
REPD_SendQ_CheckDate 
, 
REPD_SendQ.FileName 
REPD_SendQ_FileName 
, 
REPD_SendQ.ReplicaPackID 
REPD_SendQ_ReplicaPackID 
, 
 REPD_SendQ.SourceSrv  
REPD_SendQ_SourceSrv_ID, 
 MTZ.Func.REPD_SRV_BRIEF_F(REPD_SendQ.SourceSrv) 
REPD_SendQ_SourceSrv 
, 
 REPD_SendQ.Provider  
REPD_SendQ_Provider_ID, 
 MTZ.Func.REPD_PROV_BRIEF_F(REPD_SendQ.Provider) 
REPD_SendQ_Provider 
, 
 REPD_SendQ.Sent  
REPD_SendQ_Sent_VAL, 
 decode(REPD_SendQ.Sent 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
REPD_SendQ_Sent 
, 
REPD_SendQ.PartNumber 
REPD_SendQ_PartNumber 
, 
REPD_SendQ.PartCount 
REPD_SendQ_PartCount 
, 
 REPD_SendQ.DestSrv  
REPD_SendQ_DestSrv_ID, 
 MTZ.Func.REPD_SRV_BRIEF_F(REPD_SendQ.DestSrv) 
REPD_SendQ_DestSrv 
, 
REPD_SendQ.SentDate 
REPD_SendQ_SentDate 
, REPD_SendQ.InstanceID InstanceID 
, REPD_SendQ.REPD_SendQID ID 
, 'REPD_SendQ' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from REPD_SendQ
 join INSTANCE on REPD_SendQ.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOREPD_RecvQ as 
select   REPD_RecvQID
, 
 REPD_RecvQ.Provider  
REPD_RecvQ_Provider_ID, 
 MTZ.Func.REPD_PROV_BRIEF_F(REPD_RecvQ.Provider) 
REPD_RecvQ_Provider 
, 
REPD_RecvQ.FileName 
REPD_RecvQ_FileName 
, 
REPD_RecvQ.RecvSize 
REPD_RecvQ_RecvSize 
, 
 REPD_RecvQ.SourceSrv  
REPD_RecvQ_SourceSrv_ID, 
 MTZ.Func.REPD_SRV_BRIEF_F(REPD_RecvQ.SourceSrv) 
REPD_RecvQ_SourceSrv 
, 
REPD_RecvQ.ReplicaPackID 
REPD_RecvQ_ReplicaPackID 
, 
REPD_RecvQ.TheRowID 
REPD_RecvQ_TheRowID 
, 
REPD_RecvQ.PartNumber 
REPD_RecvQ_PartNumber 
, 
 REPD_RecvQ.Completed  
REPD_RecvQ_Completed_VAL, 
 decode(REPD_RecvQ.Completed 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
REPD_RecvQ_Completed 
, 
REPD_RecvQ.PartCount 
REPD_RecvQ_PartCount 
, 
 REPD_RecvQ.Acknowelge  
REPD_RecvQ_Acknowelge_VAL, 
 decode(REPD_RecvQ.Acknowelge 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
REPD_RecvQ_Acknowelge 
, 
 REPD_RecvQ.DestSrv  
REPD_RecvQ_DestSrv_ID, 
 MTZ.Func.REPD_SRV_BRIEF_F(REPD_RecvQ.DestSrv) 
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
/
create or replace view V_AUTOITTD_MOROZ as 
select   ITTD_MOROZID
, 
ITTD_MOROZ.MorozConst 
ITTD_MOROZ_MorozConst 
, 
ITTD_MOROZ.WeightConst 
ITTD_MOROZ_WeightConst 
, 
 ITTD_MOROZ.TheClient  
ITTD_MOROZ_TheClient_ID, 
ITTD_MOROZ.TheClient 
ITTD_MOROZ_TheClient 
, ITTD_MOROZ.InstanceID InstanceID 
, ITTD_MOROZ.ITTD_MOROZID ID 
, 'ITTD_MOROZ' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_MOROZ
 join INSTANCE on ITTD_MOROZ.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_RULE as 
select   ITTD_RULEID
, 
 ITTD_RULE.TheCountry  
ITTD_RULE_TheCountry_VAL, 
 decode(ITTD_RULE.TheCountry 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTD_RULE_TheCountry 
, 
ITTD_RULE.Name 
ITTD_RULE_Name 
, 
 ITTD_RULE.UseExpDate  
ITTD_RULE_UseExpDate_VAL, 
 decode(ITTD_RULE.UseExpDate 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTD_RULE_UseExpDate 
, 
 ITTD_RULE.UseBrak  
ITTD_RULE_UseBrak_VAL, 
 decode(ITTD_RULE.UseBrak 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTD_RULE_UseBrak 
, 
 ITTD_RULE.TheFactory  
ITTD_RULE_TheFactory_VAL, 
 decode(ITTD_RULE.TheFactory 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTD_RULE_TheFactory 
, 
 ITTD_RULE.UseProduct  
ITTD_RULE_UseProduct_VAL, 
 decode(ITTD_RULE.UseProduct 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTD_RULE_UseProduct 
, 
 ITTD_RULE.KillPlace  
ITTD_RULE_KillPlace_VAL, 
 decode(ITTD_RULE.KillPlace 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTD_RULE_KillPlace 
, ITTD_RULE.InstanceID InstanceID 
, ITTD_RULE.ITTD_RULEID ID 
, 'ITTD_RULE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_RULE
 join INSTANCE on ITTD_RULE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_PLTYPE as 
select   ITTD_PLTYPEID
, 
ITTD_PLTYPE.Name 
ITTD_PLTYPE_Name 
, ITTD_PLTYPE.InstanceID InstanceID 
, ITTD_PLTYPE.ITTD_PLTYPEID ID 
, 'ITTD_PLTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_PLTYPE
 join INSTANCE on ITTD_PLTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_PLTYPE as 
select   ITTD_PLTYPEID
, 
ITTD_PLTYPE.Name 
ITTD_PLTYPE_Name 
, ITTD_PLTYPE.InstanceID InstanceID 
, ITTD_PLTYPE.ITTD_PLTYPEID ID 
, 'ITTD_PLTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_PLTYPE
 join INSTANCE on ITTD_PLTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_FACTORY as 
select   ITTD_FACTORYID
, 
ITTD_FACTORY.Code1 
ITTD_FACTORY_Code1 
, 
ITTD_FACTORY.Name 
ITTD_FACTORY_Name 
, 
ITTD_FACTORY.Code2 
ITTD_FACTORY_Code2 
, 
 ITTD_FACTORY.Country  
ITTD_FACTORY_Country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTD_FACTORY.Country) 
ITTD_FACTORY_Country 
, ITTD_FACTORY.InstanceID InstanceID 
, ITTD_FACTORY.ITTD_FACTORYID ID 
, 'ITTD_FACTORY' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_FACTORY
 join INSTANCE on ITTD_FACTORY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_FACTORY as 
select   ITTD_FACTORYID
, 
ITTD_FACTORY.Code1 
ITTD_FACTORY_Code1 
, 
ITTD_FACTORY.Code2 
ITTD_FACTORY_Code2 
, 
ITTD_FACTORY.Name 
ITTD_FACTORY_Name 
, 
 ITTD_FACTORY.Country  
ITTD_FACTORY_Country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTD_FACTORY.Country) 
ITTD_FACTORY_Country 
, ITTD_FACTORY.InstanceID InstanceID 
, ITTD_FACTORY.ITTD_FACTORYID ID 
, 'ITTD_FACTORY' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_FACTORY
 join INSTANCE on ITTD_FACTORY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_ZTYPE as 
select   ITTD_ZTYPEID
, 
ITTD_ZTYPE.Name 
ITTD_ZTYPE_Name 
, ITTD_ZTYPE.InstanceID InstanceID 
, ITTD_ZTYPE.ITTD_ZTYPEID ID 
, 'ITTD_ZTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_ZTYPE
 join INSTANCE on ITTD_ZTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_ZTYPE as 
select   ITTD_ZTYPEID
, 
ITTD_ZTYPE.Name 
ITTD_ZTYPE_Name 
, ITTD_ZTYPE.InstanceID InstanceID 
, ITTD_ZTYPE.ITTD_ZTYPEID ID 
, 'ITTD_ZTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_ZTYPE
 join INSTANCE on ITTD_ZTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_GTYPE as 
select   ITTD_GTYPEID
, 
ITTD_GTYPE.Name 
ITTD_GTYPE_Name 
, ITTD_GTYPE.InstanceID InstanceID 
, ITTD_GTYPE.ITTD_GTYPEID ID 
, 'ITTD_GTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_GTYPE
 join INSTANCE on ITTD_GTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_GTYPE as 
select   ITTD_GTYPEID
, 
ITTD_GTYPE.Name 
ITTD_GTYPE_Name 
, ITTD_GTYPE.InstanceID InstanceID 
, ITTD_GTYPE.ITTD_GTYPEID ID 
, 'ITTD_GTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_GTYPE
 join INSTANCE on ITTD_GTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_KILLPLACE as 
select   ITTD_KILLPLACEID
, 
ITTD_KILLPLACE.Code2 
ITTD_KILLPLACE_Code2 
, 
ITTD_KILLPLACE.Name 
ITTD_KILLPLACE_Name 
, 
 ITTD_KILLPLACE.Factory  
ITTD_KILLPLACE_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTD_KILLPLACE.Factory) 
ITTD_KILLPLACE_Factory 
, 
ITTD_KILLPLACE.Code1 
ITTD_KILLPLACE_Code1 
, ITTD_KILLPLACE.InstanceID InstanceID 
, ITTD_KILLPLACE.ITTD_KILLPLACEID ID 
, 'ITTD_KILLPLACE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_KILLPLACE
 join INSTANCE on ITTD_KILLPLACE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_KILLPLACE as 
select   ITTD_KILLPLACEID
, 
 ITTD_KILLPLACE.Factory  
ITTD_KILLPLACE_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTD_KILLPLACE.Factory) 
ITTD_KILLPLACE_Factory 
, 
ITTD_KILLPLACE.Name 
ITTD_KILLPLACE_Name 
, 
ITTD_KILLPLACE.Code2 
ITTD_KILLPLACE_Code2 
, 
ITTD_KILLPLACE.Code1 
ITTD_KILLPLACE_Code1 
, ITTD_KILLPLACE.InstanceID InstanceID 
, ITTD_KILLPLACE.ITTD_KILLPLACEID ID 
, 'ITTD_KILLPLACE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_KILLPLACE
 join INSTANCE on ITTD_KILLPLACE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_COUNTRY as 
select   ITTD_COUNTRYID
, 
ITTD_COUNTRY.Code1 
ITTD_COUNTRY_Code1 
, 
ITTD_COUNTRY.Code2 
ITTD_COUNTRY_Code2 
, 
ITTD_COUNTRY.Name 
ITTD_COUNTRY_Name 
, 
ITTD_COUNTRY.TheSupplier 
ITTD_COUNTRY_TheSupplier 
, ITTD_COUNTRY.InstanceID InstanceID 
, ITTD_COUNTRY.ITTD_COUNTRYID ID 
, 'ITTD_COUNTRY' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_COUNTRY
 join INSTANCE on ITTD_COUNTRY.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_QTYPE as 
select   ITTD_QTYPEID
, 
ITTD_QTYPE.Name 
ITTD_QTYPE_Name 
, ITTD_QTYPE.InstanceID InstanceID 
, ITTD_QTYPE.ITTD_QTYPEID ID 
, 'ITTD_QTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_QTYPE
 join INSTANCE on ITTD_QTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_QTYPE as 
select   ITTD_QTYPEID
, 
ITTD_QTYPE.Name 
ITTD_QTYPE_Name 
, ITTD_QTYPE.InstanceID InstanceID 
, ITTD_QTYPE.ITTD_QTYPEID ID 
, 'ITTD_QTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_QTYPE
 join INSTANCE on ITTD_QTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_CAMERA as 
select   ITTD_CAMERAID
, 
ITTD_CAMERA.CameraMask 
ITTD_CAMERA_CameraMask 
, 
ITTD_CAMERA.Name 
ITTD_CAMERA_Name 
, ITTD_CAMERA.InstanceID InstanceID 
, ITTD_CAMERA.ITTD_CAMERAID ID 
, 'ITTD_CAMERA' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_CAMERA
 join INSTANCE on ITTD_CAMERA.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_SRV as 
select   ITTD_SRVID
, 
ITTD_SRV.Name 
ITTD_SRV_Name 
, 
ITTD_SRV.LinkCode 
ITTD_SRV_LinkCode 
, 
 ITTD_SRV.ForShipping  
ITTD_SRV_ForShipping_VAL, 
 decode(ITTD_SRV.ForShipping 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTD_SRV_ForShipping 
, 
 ITTD_SRV.ForReceiving  
ITTD_SRV_ForReceiving_VAL, 
 decode(ITTD_SRV.ForReceiving 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTD_SRV_ForReceiving 
, ITTD_SRV.InstanceID InstanceID 
, ITTD_SRV.ITTD_SRVID ID 
, 'ITTD_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_SRV
 join INSTANCE on ITTD_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_SRV as 
select   ITTD_SRVID
, 
ITTD_SRV.LinkCode 
ITTD_SRV_LinkCode 
, 
 ITTD_SRV.ForShipping  
ITTD_SRV_ForShipping_VAL, 
 decode(ITTD_SRV.ForShipping 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTD_SRV_ForShipping 
, 
 ITTD_SRV.ForReceiving  
ITTD_SRV_ForReceiving_VAL, 
 decode(ITTD_SRV.ForReceiving 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTD_SRV_ForReceiving 
, 
ITTD_SRV.Name 
ITTD_SRV_Name 
, ITTD_SRV.InstanceID InstanceID 
, ITTD_SRV.ITTD_SRVID ID 
, 'ITTD_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_SRV
 join INSTANCE on ITTD_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_ATYPE as 
select   ITTD_ATYPEID
, 
ITTD_ATYPE.Name 
ITTD_ATYPE_Name 
, ITTD_ATYPE.InstanceID InstanceID 
, ITTD_ATYPE.ITTD_ATYPEID ID 
, 'ITTD_ATYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_ATYPE
 join INSTANCE on ITTD_ATYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_ATYPE as 
select   ITTD_ATYPEID
, 
ITTD_ATYPE.Name 
ITTD_ATYPE_Name 
, ITTD_ATYPE.InstanceID InstanceID 
, ITTD_ATYPE.ITTD_ATYPEID ID 
, 'ITTD_ATYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_ATYPE
 join INSTANCE on ITTD_ATYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_OPTTYPE as 
select   ITTD_OPTTYPEID
, 
ITTD_OPTTYPE.Name 
ITTD_OPTTYPE_Name 
, 
ITTD_OPTTYPE.Code 
ITTD_OPTTYPE_Code 
, ITTD_OPTTYPE.InstanceID InstanceID 
, ITTD_OPTTYPE.ITTD_OPTTYPEID ID 
, 'ITTD_OPTTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_OPTTYPE
 join INSTANCE on ITTD_OPTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_PART as 
select   ITTD_PARTID
, 
 ITTD_PART.TheGood  
ITTD_PART_TheGood_ID, 
ITTD_PART.TheGood 
ITTD_PART_TheGood 
, 
ITTD_PART.Name 
ITTD_PART_Name 
, ITTD_PART.InstanceID InstanceID 
, ITTD_PART.ITTD_PARTID ID 
, 'ITTD_PART' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_PART
 join INSTANCE on ITTD_PART.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTD_PART as 
select   ITTD_PARTID
, 
 ITTD_PART.TheGood  
ITTD_PART_TheGood_ID, 
ITTD_PART.TheGood 
ITTD_PART_TheGood 
, 
ITTD_PART.Name 
ITTD_PART_Name 
, ITTD_PART.InstanceID InstanceID 
, ITTD_PART.ITTD_PARTID ID 
, 'ITTD_PART' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTD_PART
 join INSTANCE on ITTD_PART.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTPL_DEF as 
select   ITTPL_DEFID
, 
ITTPL_DEF.CurrentWeightBrutto 
ITTPL_DEF_CurrentWeightBrutto 
, 
ITTPL_DEF.TheNumber 
ITTPL_DEF_TheNumber 
, 
 ITTPL_DEF.PrivatePalet  
ITTPL_DEF_PrivatePalet_VAL, 
 decode(ITTPL_DEF.PrivatePalet 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTPL_DEF_PrivatePalet 
, 
ITTPL_DEF.WDate 
ITTPL_DEF_WDate 
, 
ITTPL_DEF.Code 
ITTPL_DEF_Code 
, 
 ITTPL_DEF.CurrentGood  
ITTPL_DEF_CurrentGood_ID, 
ITTPL_DEF.CurrentGood 
ITTPL_DEF_CurrentGood 
, 
ITTPL_DEF.CaliberQuantity 
ITTPL_DEF_CaliberQuantity 
, 
ITTPL_DEF.CorePalette_ID 
ITTPL_DEF_CorePalette_ID 
, 
ITTPL_DEF.PalKode 
ITTPL_DEF_PalKode 
, 
ITTPL_DEF.CurrentPosition 
ITTPL_DEF_CurrentPosition 
, 
 ITTPL_DEF.Pltype  
ITTPL_DEF_Pltype_ID, 
 MTZ.Func.ITTD_PLTYPE_BRIEF_F(ITTPL_DEF.Pltype) 
ITTPL_DEF_Pltype 
, 
ITTPL_DEF.Weight 
ITTPL_DEF_Weight 
, 
ITTPL_DEF.PackageWeight 
ITTPL_DEF_PackageWeight 
, ITTPL_DEF.InstanceID InstanceID 
, ITTPL_DEF.ITTPL_DEFID ID 
, 'ITTPL_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTPL_DEF
 join INSTANCE on ITTPL_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTPL_DEF as 
select   ITTPL_DEFID
, 
ITTPL_DEF.CurrentWeightBrutto 
ITTPL_DEF_CurrentWeightBrutto 
, 
ITTPL_DEF.PalKode 
ITTPL_DEF_PalKode 
, 
ITTPL_DEF.CorePalette_ID 
ITTPL_DEF_CorePalette_ID 
, 
ITTPL_DEF.Weight 
ITTPL_DEF_Weight 
, 
ITTPL_DEF.TheNumber 
ITTPL_DEF_TheNumber 
, 
 ITTPL_DEF.PrivatePalet  
ITTPL_DEF_PrivatePalet_VAL, 
 decode(ITTPL_DEF.PrivatePalet 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTPL_DEF_PrivatePalet 
, 
 ITTPL_DEF.CurrentGood  
ITTPL_DEF_CurrentGood_ID, 
ITTPL_DEF.CurrentGood 
ITTPL_DEF_CurrentGood 
, 
ITTPL_DEF.CaliberQuantity 
ITTPL_DEF_CaliberQuantity 
, 
ITTPL_DEF.CurrentPosition 
ITTPL_DEF_CurrentPosition 
, 
ITTPL_DEF.WDate 
ITTPL_DEF_WDate 
, 
ITTPL_DEF.Code 
ITTPL_DEF_Code 
, 
ITTPL_DEF.PackageWeight 
ITTPL_DEF_PackageWeight 
, 
 ITTPL_DEF.Pltype  
ITTPL_DEF_Pltype_ID, 
 MTZ.Func.ITTD_PLTYPE_BRIEF_F(ITTPL_DEF.Pltype) 
ITTPL_DEF_Pltype 
, ITTPL_DEF.InstanceID InstanceID 
, ITTPL_DEF.ITTPL_DEFID ID 
, 'ITTPL_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTPL_DEF
 join INSTANCE on ITTPL_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOP_OPLNK as 
select   ITTOP_OPLNKID
, 
 ITTOP_OPLNK.TheUser  
ITTOP_OPLNK_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(ITTOP_OPLNK.TheUser) 
ITTOP_OPLNK_TheUser 
, ITTOP_OPLNK.InstanceID InstanceID 
, ITTOP_OPLNK.ITTOP_OPLNKID ID 
, 'ITTOP_OPLNK' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOP_OPLNK
 join INSTANCE on ITTOP_OPLNK.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOP_OPKAM as 
select   ITTOP_OPKAMID,ITTOP_OPLNKID
, 
 ITTOP_OPKAM.TheKamera  
ITTOP_OPKAM_TheKamera_ID, 
 MTZ.Func.ITTD_CAMERA_BRIEF_F(ITTOP_OPKAM.TheKamera) 
ITTOP_OPKAM_TheKamera 
, ITTOP_OPLNK.InstanceID InstanceID 
, ITTOP_OPKAM.ITTOP_OPKAMID ID 
, 'ITTOP_OPKAM' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOP_OPKAM
 join ITTOP_OPLNK on ITTOP_OPLNK.ITTOP_OPLNKID=ITTOP_OPKAM.ParentStructRowID 
 join INSTANCE on ITTOP_OPLNK.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOP_KLNK as 
select   ITTOP_KLNKID
, 
 ITTOP_KLNK.TheUser  
ITTOP_KLNK_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(ITTOP_KLNK.TheUser) 
ITTOP_KLNK_TheUser 
, ITTOP_KLNK.InstanceID InstanceID 
, ITTOP_KLNK.ITTOP_KLNKID ID 
, 'ITTOP_KLNK' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOP_KLNK
 join INSTANCE on ITTOP_KLNK.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOP_KCAM as 
select   ITTOP_KCAMID,ITTOP_KLNKID
, 
 ITTOP_KCAM.TheKamera  
ITTOP_KCAM_TheKamera_ID, 
 MTZ.Func.ITTD_CAMERA_BRIEF_F(ITTOP_KCAM.TheKamera) 
ITTOP_KCAM_TheKamera 
, ITTOP_KLNK.InstanceID InstanceID 
, ITTOP_KCAM.ITTOP_KCAMID ID 
, 'ITTOP_KCAM' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOP_KCAM
 join ITTOP_KLNK on ITTOP_KLNK.ITTOP_KLNKID=ITTOP_KCAM.ParentStructRowID 
 join INSTANCE on ITTOP_KLNK.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOP_KCLI as 
select   ITTOP_KCLIID,ITTOP_KLNKID
, 
 ITTOP_KCLI.TheClient  
ITTOP_KCLI_TheClient_ID, 
ITTOP_KCLI.TheClient 
ITTOP_KCLI_TheClient 
, ITTOP_KLNK.InstanceID InstanceID 
, ITTOP_KCLI.ITTOP_KCLIID ID 
, 'ITTOP_KCLI' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOP_KCLI
 join ITTOP_KLNK on ITTOP_KLNK.ITTOP_KLNKID=ITTOP_KCLI.ParentStructRowID 
 join INSTANCE on ITTOP_KLNK.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTFN_MAX as 
select   ITTFN_MAXID
, 
ITTFN_MAX.PalMaxNum 
ITTFN_MAX_PalMaxNum 
, ITTFN_MAX.InstanceID InstanceID 
, ITTFN_MAX.ITTFN_MAXID ID 
, 'ITTFN_MAX' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTFN_MAX
 join INSTANCE on ITTFN_MAX.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTFN_MAX as 
select   ITTFN_MAXID
, 
ITTFN_MAX.PalMaxNum 
ITTFN_MAX_PalMaxNum 
, ITTFN_MAX.InstanceID InstanceID 
, ITTFN_MAX.ITTFN_MAXID ID 
, 'ITTFN_MAX' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTFN_MAX
 join INSTANCE on ITTFN_MAX.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOSTDJournlaExtInfo as 
select   STDJournlaExtInfoID
, 
STDJournlaExtInfo.TheName 
STDJournlaExtInfo_TheName 
, 
 STDJournlaExtInfo.TheJournalRef  
STDJournlaExtInfo_TheJournalRef_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(STDJournlaExtInfo.TheJournalRef) 
STDJournlaExtInfo_TheJournalRef 
, STDJournlaExtInfo.InstanceID InstanceID 
, STDJournlaExtInfo.STDJournlaExtInfoID ID 
, 'STDJournlaExtInfo' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from STDJournlaExtInfo
 join INSTANCE on STDJournlaExtInfo.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOSTDJournalExtParam as 
select   STDJournalExtParamID
, 
 STDJournalExtParam.TargetPlatform  
STDJournalExtParam_TargetPlatform_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(STDJournalExtParam.TargetPlatform) 
STDJournalExtParam_TargetPlatform 
, 
STDJournalExtParam.ParamName 
STDJournalExtParam_ParamName 
, 
STDJournalExtParam.FieldName 
STDJournalExtParam_FieldName 
, STDJournalExtParam.InstanceID InstanceID 
, STDJournalExtParam.STDJournalExtParamID ID 
, 'STDJournalExtParam' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from STDJournalExtParam
 join INSTANCE on STDJournalExtParam.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
create or replace view V_AUTOSTDJournalExtField as 
select   STDJournalExtFieldID,STDJournalExtFltID
, 
 STDJournalExtField.TargetPlatform  
STDJournalExtField_TargetPlatform_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(STDJournalExtField.TargetPlatform) 
STDJournalExtField_TargetPlatform 
, 
STDJournalExtField.ConstantValue 
STDJournalExtField_ConstantValue 
, 
STDJournalExtField.FieldSource 
STDJournalExtField_FieldSource 
, 
STDJournalExtField.ViewField 
STDJournalExtField_ViewField 
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
, STDJournalExtFlt.InstanceID InstanceID 
, STDJournalExtField.STDJournalExtFieldID ID 
, 'STDJournalExtField' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from STDJournalExtField
 join STDJournalExtFlt on STDJournalExtFlt.STDJournalExtFltID=STDJournalExtField.ParentStructRowID 
 join INSTANCE on STDJournalExtFlt.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_FindFieldType as 
select   FIELDTYPEID
, 
 FIELDTYPE.TypeStyle  
FIELDTYPE_TypeStyle_VAL, 
 decode(FIELDTYPE.TypeStyle 
, 3 ,'Интервал'
, 5 ,'Элемент оформления'
, 0 ,'Скалярный тип'
, 4 ,'Ссылка'
, 2 ,'Перечисление'
, 1 ,'Выражение'
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
/
create or replace view V_AUTOFIELDTYPE as 
select   FIELDTYPEID
, 
FIELDTYPE.Name 
FIELDTYPE_Name 
, 
FIELDTYPE.Minimum 
FIELDTYPE_Minimum 
, 
FIELDTYPE.Maximum 
FIELDTYPE_Maximum 
, 
 FIELDTYPE.AllowSize  
FIELDTYPE_AllowSize_VAL, 
 decode(FIELDTYPE.AllowSize 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELDTYPE_AllowSize 
, 
 FIELDTYPE.AllowLikeSearch  
FIELDTYPE_AllowLikeSearch_VAL, 
 decode(FIELDTYPE.AllowLikeSearch 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELDTYPE_AllowLikeSearch 
, 
 FIELDTYPE.TypeStyle  
FIELDTYPE_TypeStyle_VAL, 
 decode(FIELDTYPE.TypeStyle 
, 3 ,'Интервал'
, 5 ,'Элемент оформления'
, 0 ,'Скалярный тип'
, 4 ,'Ссылка'
, 2 ,'Перечисление'
, 1 ,'Выражение'
, '???') 
FIELDTYPE_TypeStyle 
, 
FIELDTYPE.the_Comment 
FIELDTYPE_the_Comment 
, 
 FIELDTYPE.GridSortType  
FIELDTYPE_GridSortType_VAL, 
 decode(FIELDTYPE.GridSortType 
, 0 ,'As String'
, 1 ,'As Numeric'
, 2 ,'As Date'
, '???') 
FIELDTYPE_GridSortType 
, FIELDTYPE.InstanceID InstanceID 
, FIELDTYPE.FIELDTYPEID ID 
, 'FIELDTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FIELDTYPE
 join INSTANCE on FIELDTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOFIELDTYPEMAP as 
select   FIELDTYPEMAPID,FIELDTYPEID
, 
FIELDTYPEMAP.StoageType 
FIELDTYPEMAP_StoageType 
, 
 FIELDTYPEMAP.Target  
FIELDTYPEMAP_Target_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(FIELDTYPEMAP.Target) 
FIELDTYPEMAP_Target 
, 
FIELDTYPEMAP.FixedSize 
FIELDTYPEMAP_FixedSize 
, FIELDTYPE.InstanceID InstanceID 
, FIELDTYPEMAP.FIELDTYPEMAPID ID 
, 'FIELDTYPEMAP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FIELDTYPEMAP
 join FIELDTYPE on FIELDTYPE.FIELDTYPEID=FIELDTYPEMAP.ParentStructRowID 
 join INSTANCE on FIELDTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOENUMITEM as 
select   ENUMITEMID,FIELDTYPEID
, 
ENUMITEM.Name 
ENUMITEM_Name 
, 
ENUMITEM.NameInCode 
ENUMITEM_NameInCode 
, 
ENUMITEM.NameValue 
ENUMITEM_NameValue 
, FIELDTYPE.InstanceID InstanceID 
, ENUMITEM.ENUMITEMID ID 
, 'ENUMITEM' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ENUMITEM
 join FIELDTYPE on FIELDTYPE.FIELDTYPEID=ENUMITEM.ParentStructRowID 
 join INSTANCE on FIELDTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
create or replace view V_AUTOSHAREDMETHOD as 
select   SHAREDMETHODID
, 
SHAREDMETHOD.Name 
SHAREDMETHOD_Name 
, 
SHAREDMETHOD.the_Comment 
SHAREDMETHOD_the_Comment 
, 
 SHAREDMETHOD.ReturnType  
SHAREDMETHOD_ReturnType_ID, 
 MTZ.Func.FIELDTYPE_BRIEF_F(SHAREDMETHOD.ReturnType) 
SHAREDMETHOD_ReturnType 
, SHAREDMETHOD.InstanceID InstanceID 
, SHAREDMETHOD.SHAREDMETHODID ID 
, 'SHAREDMETHOD' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from SHAREDMETHOD
 join INSTANCE on SHAREDMETHOD.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOSCRIPT as 
select   SCRIPTID,SHAREDMETHODID
, 
SCRIPT.Code 
SCRIPT_Code 
, 
 SCRIPT.Target  
SCRIPT_Target_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(SCRIPT.Target) 
SCRIPT_Target 
, SHAREDMETHOD.InstanceID InstanceID 
, SCRIPT.SCRIPTID ID 
, 'SCRIPT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from SCRIPT
 join SHAREDMETHOD on SHAREDMETHOD.SHAREDMETHODID=SCRIPT.ParentStructRowID 
 join INSTANCE on SHAREDMETHOD.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOPARAMETERS as 
select   PARAMETERSID,SCRIPTID,SHAREDMETHODID
, 
 PARAMETERS.RefToType  
PARAMETERS_RefToType_ID, 
 MTZ.Func.OBJECTTYPE_BRIEF_F(PARAMETERS.RefToType) 
PARAMETERS_RefToType 
, 
 PARAMETERS.AllowNull  
PARAMETERS_AllowNull_VAL, 
 decode(PARAMETERS.AllowNull 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PARAMETERS_AllowNull 
, 
PARAMETERS.Name 
PARAMETERS_Name 
, 
 PARAMETERS.OutParam  
PARAMETERS_OutParam_VAL, 
 decode(PARAMETERS.OutParam 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PARAMETERS_OutParam 
, 
 PARAMETERS.ReferenceType  
PARAMETERS_ReferenceType_VAL, 
 decode(PARAMETERS.ReferenceType 
, 2 ,'На строку раздела'
, 3 ,'На источник данных'
, 0 ,'Скалярное поле ( не ссылка)'
, 1 ,'На объект '
, '???') 
PARAMETERS_ReferenceType 
, 
PARAMETERS.DataSize 
PARAMETERS_DataSize 
, 
PARAMETERS.Caption 
PARAMETERS_Caption 
, 
 PARAMETERS.RefToPart  
PARAMETERS_RefToPart_ID, 
 MTZ.Func.PART_BRIEF_F(PARAMETERS.RefToPart) 
PARAMETERS_RefToPart 
, 
 PARAMETERS.TypeOfParm  
PARAMETERS_TypeOfParm_ID, 
 MTZ.Func.FIELDTYPE_BRIEF_F(PARAMETERS.TypeOfParm) 
PARAMETERS_TypeOfParm 
, 
PARAMETERS.sequence 
PARAMETERS_sequence 
, SHAREDMETHOD.InstanceID InstanceID 
, PARAMETERS.PARAMETERSID ID 
, 'PARAMETERS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PARAMETERS
 join SCRIPT on SCRIPT.SCRIPTID=PARAMETERS.ParentStructRowID 
 join SHAREDMETHOD on SHAREDMETHOD.SHAREDMETHODID=SCRIPT.ParentStructRowID 
 join INSTANCE on SHAREDMETHOD.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOOBJECTTYPE as 
select   OBJECTTYPEID
, 
 OBJECTTYPE.IsSingleInstance  
OBJECTTYPE_IsSingleInstance_VAL, 
 decode(OBJECTTYPE.IsSingleInstance 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
OBJECTTYPE_IsSingleInstance 
, 
OBJECTTYPE.the_Comment 
OBJECTTYPE_the_Comment 
, 
OBJECTTYPE.Name 
OBJECTTYPE_Name 
, 
OBJECTTYPE.TheComment 
OBJECTTYPE_TheComment 
, 
 OBJECTTYPE.OnCreate  
OBJECTTYPE_OnCreate_ID, 
 MTZ.Func.TYPEMENU_BRIEF_F(OBJECTTYPE.OnCreate) 
OBJECTTYPE_OnCreate 
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
 OBJECTTYPE.AllowRefToObject  
OBJECTTYPE_AllowRefToObject_VAL, 
 decode(OBJECTTYPE.AllowRefToObject 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
OBJECTTYPE_AllowRefToObject 
, 
 OBJECTTYPE.ChooseView  
OBJECTTYPE_ChooseView_ID, 
 MTZ.Func.PARTVIEW_BRIEF_F(OBJECTTYPE.ChooseView) 
OBJECTTYPE_ChooseView 
, 
 OBJECTTYPE.OnRun  
OBJECTTYPE_OnRun_ID, 
 MTZ.Func.TYPEMENU_BRIEF_F(OBJECTTYPE.OnRun) 
OBJECTTYPE_OnRun 
, 
 OBJECTTYPE.Package  
OBJECTTYPE_Package_ID, 
 MTZ.Func.MTZAPP_BRIEF_F(OBJECTTYPE.Package) 
OBJECTTYPE_Package 
, 
 OBJECTTYPE.AllowSearch  
OBJECTTYPE_AllowSearch_VAL, 
 decode(OBJECTTYPE.AllowSearch 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
OBJECTTYPE_AllowSearch 
, 
 OBJECTTYPE.OnDelete  
OBJECTTYPE_OnDelete_ID, 
 MTZ.Func.TYPEMENU_BRIEF_F(OBJECTTYPE.OnDelete) 
OBJECTTYPE_OnDelete 
, OBJECTTYPE.InstanceID InstanceID 
, OBJECTTYPE.OBJECTTYPEID ID 
, 'OBJECTTYPE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from OBJECTTYPE
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_FindOBJECTTYPE as 
select   OBJECTTYPEID
, 
OBJECTTYPE.the_Comment 
OBJECTTYPE_Comment 
, 
 OBJECTTYPE.Package  
OBJECTTYPE_Package_ID, 
 MTZ.Func.MTZAPP_BRIEF_F(OBJECTTYPE.Package) 
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
/
create or replace view V_AUTOPART as 
select   PARTID,OBJECTTYPEID
, 
 PART.PartType  
PART_PartType_VAL, 
 decode(PART.PartType 
, 3 ,'Расширение'
, 1 ,'Коллекция'
, 0 ,'Строка'
, 2 ,'Дерево'
, 4 ,'Расширение с данными'
, '???') 
PART_PartType 
, 
 PART.ManualRegister  
PART_ManualRegister_VAL, 
 decode(PART.ManualRegister 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PART_ManualRegister 
, 
PART.Caption 
PART_Caption 
, 
PART.the_Comment 
PART_the_Comment 
, 
 PART.OnRun  
PART_OnRun_ID, 
 MTZ.Func.PARTMENU_BRIEF_F(PART.OnRun) 
PART_OnRun 
, 
 PART.OnDelete  
PART_OnDelete_ID, 
 MTZ.Func.PARTMENU_BRIEF_F(PART.OnDelete) 
PART_OnDelete 
, 
 PART.OnCreate  
PART_OnCreate_ID, 
 MTZ.Func.PARTMENU_BRIEF_F(PART.OnCreate) 
PART_OnCreate 
, 
 PART.OnSave  
PART_OnSave_ID, 
 MTZ.Func.PARTMENU_BRIEF_F(PART.OnSave) 
PART_OnSave 
, 
 PART.ExtenderObject  
PART_ExtenderObject_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(PART.ExtenderObject) 
PART_ExtenderObject 
, 
 PART.NoLog  
PART_NoLog_VAL, 
 decode(PART.NoLog 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PART_NoLog 
, 
PART.Sequence 
PART_Sequence 
, 
PART.shablonBrief 
PART_shablonBrief 
, 
PART.Name 
PART_Name 
, 
 PART.AddBehaivor  
PART_AddBehaivor_VAL, 
 decode(PART.AddBehaivor 
, 0 ,'AddForm'
, 2 ,'RunAction'
, 1 ,'RefreshOnly'
, '???') 
PART_AddBehaivor 
, OBJECTTYPE.InstanceID InstanceID 
, PART.PARTID ID 
, 'PART' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PART
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
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
/
create or replace view V_AUTOPARTMENU as 
select   PARTMENUID,PARTID,OBJECTTYPEID
, 
 PARTMENU.the_Action  
PARTMENU_the_Action_ID, 
 MTZ.Func.SHAREDMETHOD_BRIEF_F(PARTMENU.the_Action) 
PARTMENU_the_Action 
, 
PARTMENU.Name 
PARTMENU_Name 
, 
 PARTMENU.IsToolBarButton  
PARTMENU_IsToolBarButton_VAL, 
 decode(PARTMENU.IsToolBarButton 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PARTMENU_IsToolBarButton 
, 
PARTMENU.ToolTip 
PARTMENU_ToolTip 
, 
 PARTMENU.IsMenuItem  
PARTMENU_IsMenuItem_VAL, 
 decode(PARTMENU.IsMenuItem 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PARTMENU_IsMenuItem 
, 
PARTMENU.Caption 
PARTMENU_Caption 
, 
PARTMENU.HotKey 
PARTMENU_HotKey 
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
/
create or replace view V_AUTOPARTPARAMMAP as 
select   PARTPARAMMAPID,PARTMENUID,PARTID,OBJECTTYPEID
, 
PARTPARAMMAP.FieldName 
PARTPARAMMAP_FieldName 
, 
 PARTPARAMMAP.NoEdit  
PARTPARAMMAP_NoEdit_VAL, 
 decode(PARTPARAMMAP.NoEdit 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PARTPARAMMAP_NoEdit 
, 
PARTPARAMMAP.ParamName 
PARTPARAMMAP_ParamName 
, OBJECTTYPE.InstanceID InstanceID 
, PARTPARAMMAP.PARTPARAMMAPID ID 
, 'PARTPARAMMAP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PARTPARAMMAP
 join PARTMENU on PARTMENU.PARTMENUID=PARTPARAMMAP.ParentStructRowID 
 join PART on PART.PARTID=PARTMENU.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOFIELD as 
select   FIELDID,PARTID,OBJECTTYPEID
, 
FIELD.Caption 
FIELD_Caption 
, 
 FIELD.IsAutoNumber  
FIELD_IsAutoNumber_VAL, 
 decode(FIELD.IsAutoNumber 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELD_IsAutoNumber 
, 
FIELD.ZoneTemplate 
FIELD_ZoneTemplate 
, 
 FIELD.IsBrief  
FIELD_IsBrief_VAL, 
 decode(FIELD.IsBrief 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELD_IsBrief 
, 
FIELD.TheComment 
FIELD_TheComment 
, 
 FIELD.RefToPart  
FIELD_RefToPart_ID, 
 MTZ.Func.PART_BRIEF_F(FIELD.RefToPart) 
FIELD_RefToPart 
, 
 FIELD.FieldType  
FIELD_FieldType_ID, 
 MTZ.Func.FIELDTYPE_BRIEF_F(FIELD.FieldType) 
FIELD_FieldType 
, 
FIELD.DataSize 
FIELD_DataSize 
, 
 FIELD.RefToType  
FIELD_RefToType_ID, 
 MTZ.Func.OBJECTTYPE_BRIEF_F(FIELD.RefToType) 
FIELD_RefToType 
, 
 FIELD.TheNumerator  
FIELD_TheNumerator_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(FIELD.TheNumerator) 
FIELD_TheNumerator 
, 
 FIELD.CreateRefOnly  
FIELD_CreateRefOnly_VAL, 
 decode(FIELD.CreateRefOnly 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELD_CreateRefOnly 
, 
 FIELD.InternalReference  
FIELD_InternalReference_VAL, 
 decode(FIELD.InternalReference 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELD_InternalReference 
, 
 FIELD.NumberDateField  
FIELD_NumberDateField_ID, 
 MTZ.Func.FIELD_BRIEF_F(FIELD.NumberDateField) 
FIELD_NumberDateField 
, 
FIELD.Sequence 
FIELD_Sequence 
, 
FIELD.Name 
FIELD_Name 
, 
FIELD.shablonBrief 
FIELD_shablonBrief 
, 
 FIELD.AllowNull  
FIELD_AllowNull_VAL, 
 decode(FIELD.AllowNull 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELD_AllowNull 
, 
 FIELD.ReferenceType  
FIELD_ReferenceType_VAL, 
 decode(FIELD.ReferenceType 
, 2 ,'На строку раздела'
, 3 ,'На источник данных'
, 0 ,'Скалярное поле ( не ссылка)'
, 1 ,'На объект '
, '???') 
FIELD_ReferenceType 
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
/
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
/
create or replace view V_AUTOFIELDVALIDATOR as 
select   FIELDVALIDATORID,FIELDID,PARTID,OBJECTTYPEID
, 
FIELDVALIDATOR.Code 
FIELDVALIDATOR_Code 
, 
 FIELDVALIDATOR.Target  
FIELDVALIDATOR_Target_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(FIELDVALIDATOR.Target) 
FIELDVALIDATOR_Target 
, OBJECTTYPE.InstanceID InstanceID 
, FIELDVALIDATOR.FIELDVALIDATORID ID 
, 'FIELDVALIDATOR' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FIELDVALIDATOR
 join FIELD on FIELD.FIELDID=FIELDVALIDATOR.ParentStructRowID 
 join PART on PART.PARTID=FIELD.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOFIELDMENU as 
select   FIELDMENUID,FIELDID,PARTID,OBJECTTYPEID
, 
FIELDMENU.HotKey 
FIELDMENU_HotKey 
, 
FIELDMENU.Name 
FIELDMENU_Name 
, 
 FIELDMENU.IsToolBarButton  
FIELDMENU_IsToolBarButton_VAL, 
 decode(FIELDMENU.IsToolBarButton 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELDMENU_IsToolBarButton 
, 
 FIELDMENU.ActionID  
FIELDMENU_ActionID_ID, 
 MTZ.Func.SHAREDMETHOD_BRIEF_F(FIELDMENU.ActionID) 
FIELDMENU_ActionID 
, 
 FIELDMENU.IsMenuItem  
FIELDMENU_IsMenuItem_VAL, 
 decode(FIELDMENU.IsMenuItem 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELDMENU_IsMenuItem 
, 
FIELDMENU.Caption 
FIELDMENU_Caption 
, 
FIELDMENU.ToolTip 
FIELDMENU_ToolTip 
, OBJECTTYPE.InstanceID InstanceID 
, FIELDMENU.FIELDMENUID ID 
, 'FIELDMENU' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FIELDMENU
 join FIELD on FIELD.FIELDID=FIELDMENU.ParentStructRowID 
 join PART on PART.PARTID=FIELD.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOFIELDPARAMMAP as 
select   FIELDPARAMMAPID,FIELDMENUID,FIELDID,PARTID,OBJECTTYPEID
, 
 FIELDPARAMMAP.NoEdit  
FIELDPARAMMAP_NoEdit_VAL, 
 decode(FIELDPARAMMAP.NoEdit 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELDPARAMMAP_NoEdit 
, 
FIELDPARAMMAP.FieldName 
FIELDPARAMMAP_FieldName 
, 
FIELDPARAMMAP.ParamName 
FIELDPARAMMAP_ParamName 
, OBJECTTYPE.InstanceID InstanceID 
, FIELDPARAMMAP.FIELDPARAMMAPID ID 
, 'FIELDPARAMMAP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FIELDPARAMMAP
 join FIELDMENU on FIELDMENU.FIELDMENUID=FIELDPARAMMAP.ParentStructRowID 
 join FIELD on FIELD.FIELDID=FIELDMENU.ParentStructRowID 
 join PART on PART.PARTID=FIELD.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOFIELDEXPRESSION as 
select   FIELDEXPRESSIONID,FIELDID,PARTID,OBJECTTYPEID
, 
 FIELDEXPRESSION.Target  
FIELDEXPRESSION_Target_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(FIELDEXPRESSION.Target) 
FIELDEXPRESSION_Target 
, 
FIELDEXPRESSION.Code 
FIELDEXPRESSION_Code 
, OBJECTTYPE.InstanceID InstanceID 
, FIELDEXPRESSION.FIELDEXPRESSIONID ID 
, 'FIELDEXPRESSION' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FIELDEXPRESSION
 join FIELD on FIELD.FIELDID=FIELDEXPRESSION.ParentStructRowID 
 join PART on PART.PARTID=FIELD.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTODINAMICFILTERSCRIPT as 
select   DINAMICFILTERSCRIPTID,FIELDID,PARTID,OBJECTTYPEID
, 
DINAMICFILTERSCRIPT.Code 
DINAMICFILTERSCRIPT_Code 
, 
 DINAMICFILTERSCRIPT.Target  
DINAMICFILTERSCRIPT_Target_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(DINAMICFILTERSCRIPT.Target) 
DINAMICFILTERSCRIPT_Target 
, OBJECTTYPE.InstanceID InstanceID 
, DINAMICFILTERSCRIPT.DINAMICFILTERSCRIPTID ID 
, 'DINAMICFILTERSCRIPT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from DINAMICFILTERSCRIPT
 join FIELD on FIELD.FIELDID=DINAMICFILTERSCRIPT.ParentStructRowID 
 join PART on PART.PARTID=FIELD.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOFIELDSRCDEF as 
select   FIELDSRCDEFID,FIELDID,PARTID,OBJECTTYPEID
, 
FIELDSRCDEF.DataSource 
FIELDSRCDEF_DataSource 
, 
FIELDSRCDEF.IDField 
FIELDSRCDEF_IDField 
, 
 FIELDSRCDEF.DontShowDialog  
FIELDSRCDEF_DontShowDialog_VAL, 
 decode(FIELDSRCDEF.DontShowDialog 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELDSRCDEF_DontShowDialog 
, 
FIELDSRCDEF.FilterString 
FIELDSRCDEF_FilterString 
, 
FIELDSRCDEF.ConnectionString 
FIELDSRCDEF_ConnectionString 
, 
FIELDSRCDEF.BriefString 
FIELDSRCDEF_BriefString 
, 
FIELDSRCDEF.DescriptionString 
FIELDSRCDEF_DescriptionString 
, 
FIELDSRCDEF.SortField 
FIELDSRCDEF_SortField 
, 
FIELDSRCDEF.Provider 
FIELDSRCDEF_Provider 
, OBJECTTYPE.InstanceID InstanceID 
, FIELDSRCDEF.FIELDSRCDEFID ID 
, 'FIELDSRCDEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FIELDSRCDEF
 join FIELD on FIELD.FIELDID=FIELDSRCDEF.ParentStructRowID 
 join PART on PART.PARTID=FIELD.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOPARTVIEW as 
select   PARTVIEWID,PARTID,OBJECTTYPEID
, 
PARTVIEW.FilterField2 
PARTVIEW_FilterField2 
, 
 PARTVIEW.ForChoose  
PARTVIEW_ForChoose_VAL, 
 decode(PARTVIEW.ForChoose 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
PARTVIEW_ForChoose 
, 
PARTVIEW.the_Alias 
PARTVIEW_the_Alias 
, 
PARTVIEW.FilterField3 
PARTVIEW_FilterField3 
, 
PARTVIEW.Name 
PARTVIEW_Name 
, 
PARTVIEW.FilterField0 
PARTVIEW_FilterField0 
, 
PARTVIEW.FilterField1 
PARTVIEW_FilterField1 
, OBJECTTYPE.InstanceID InstanceID 
, PARTVIEW.PARTVIEWID ID 
, 'PARTVIEW' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from PARTVIEW
 join PART on PART.PARTID=PARTVIEW.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOViewColumn as 
select   ViewColumnID,PARTVIEWID,PARTID,OBJECTTYPEID
, 
 ViewColumn.Field  
ViewColumn_Field_ID, 
 MTZ.Func.FIELD_BRIEF_F(ViewColumn.Field) 
ViewColumn_Field 
, 
ViewColumn.sequence 
ViewColumn_sequence 
, 
ViewColumn.Expression 
ViewColumn_Expression 
, 
 ViewColumn.ForCombo  
ViewColumn_ForCombo_VAL, 
 decode(ViewColumn.ForCombo 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ViewColumn_ForCombo 
, 
ViewColumn.Name 
ViewColumn_Name 
, 
 ViewColumn.FromPart  
ViewColumn_FromPart_ID, 
 MTZ.Func.PART_BRIEF_F(ViewColumn.FromPart) 
ViewColumn_FromPart 
, 
 ViewColumn.Aggregation  
ViewColumn_Aggregation_VAL, 
 decode(ViewColumn.Aggregation 
, 5 ,'MAX'
, 1 ,'AVG'
, 3 ,'SUM'
, 2 ,'COUNT'
, 4 ,'MIN'
, 6 ,'CUSTOM'
, 0 ,'none'
, '???') 
ViewColumn_Aggregation 
, 
ViewColumn.the_Alias 
ViewColumn_the_Alias 
, OBJECTTYPE.InstanceID InstanceID 
, ViewColumn.ViewColumnID ID 
, 'ViewColumn' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ViewColumn
 join PARTVIEW on PARTVIEW.PARTVIEWID=ViewColumn.ParentStructRowID 
 join PART on PART.PARTID=PARTVIEW.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOExtenderInterface as 
select   ExtenderInterfaceID,PARTID,OBJECTTYPEID
, 
 ExtenderInterface.TargetPlatform  
ExtenderInterface_TargetPlatform_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(ExtenderInterface.TargetPlatform) 
ExtenderInterface_TargetPlatform 
, 
ExtenderInterface.TheObject 
ExtenderInterface_TheObject 
, 
ExtenderInterface.TheName 
ExtenderInterface_TheName 
, OBJECTTYPE.InstanceID InstanceID 
, ExtenderInterface.ExtenderInterfaceID ID 
, 'ExtenderInterface' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ExtenderInterface
 join PART on PART.PARTID=ExtenderInterface.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOVALIDATOR as 
select   VALIDATORID,PARTID,OBJECTTYPEID
, 
 VALIDATOR.Target  
VALIDATOR_Target_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(VALIDATOR.Target) 
VALIDATOR_Target 
, 
VALIDATOR.Code 
VALIDATOR_Code 
, OBJECTTYPE.InstanceID InstanceID 
, VALIDATOR.VALIDATORID ID 
, 'VALIDATOR' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from VALIDATOR
 join PART on PART.PARTID=VALIDATOR.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOUNIQUECONSTRAINT as 
select   UNIQUECONSTRAINTID,PARTID,OBJECTTYPEID
, 
UNIQUECONSTRAINT.TheComment 
UNIQUECONSTRAINT_TheComment 
, 
 UNIQUECONSTRAINT.PerParent  
UNIQUECONSTRAINT_PerParent_VAL, 
 decode(UNIQUECONSTRAINT.PerParent 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
UNIQUECONSTRAINT_PerParent 
, 
UNIQUECONSTRAINT.Name 
UNIQUECONSTRAINT_Name 
, OBJECTTYPE.InstanceID InstanceID 
, UNIQUECONSTRAINT.UNIQUECONSTRAINTID ID 
, 'UNIQUECONSTRAINT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from UNIQUECONSTRAINT
 join PART on PART.PARTID=UNIQUECONSTRAINT.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOCONSTRAINTFIELD as 
select   CONSTRAINTFIELDID,UNIQUECONSTRAINTID,PARTID,OBJECTTYPEID
, 
 CONSTRAINTFIELD.TheField  
CONSTRAINTFIELD_TheField_ID, 
 MTZ.Func.FIELD_BRIEF_F(CONSTRAINTFIELD.TheField) 
CONSTRAINTFIELD_TheField 
, OBJECTTYPE.InstanceID InstanceID 
, CONSTRAINTFIELD.CONSTRAINTFIELDID ID 
, 'CONSTRAINTFIELD' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from CONSTRAINTFIELD
 join UNIQUECONSTRAINT on UNIQUECONSTRAINT.UNIQUECONSTRAINTID=CONSTRAINTFIELD.ParentStructRowID 
 join PART on PART.PARTID=UNIQUECONSTRAINT.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=PART.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOINSTANCEVALIDATOR as 
select   INSTANCEVALIDATORID,OBJECTTYPEID
, 
 INSTANCEVALIDATOR.Target  
INSTANCEVALIDATOR_Target_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(INSTANCEVALIDATOR.Target) 
INSTANCEVALIDATOR_Target 
, 
INSTANCEVALIDATOR.Code 
INSTANCEVALIDATOR_Code 
, OBJECTTYPE.InstanceID InstanceID 
, INSTANCEVALIDATOR.INSTANCEVALIDATORID ID 
, 'INSTANCEVALIDATOR' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from INSTANCEVALIDATOR
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=INSTANCEVALIDATOR.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOOBJSTATUS as 
select   OBJSTATUSID,OBJECTTYPEID
, 
OBJSTATUS.name 
OBJSTATUS_name 
, 
 OBJSTATUS.IsArchive  
OBJSTATUS_IsArchive_VAL, 
 decode(OBJSTATUS.IsArchive 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
OBJSTATUS_IsArchive 
, 
 OBJSTATUS.isStartup  
OBJSTATUS_isStartup_VAL, 
 decode(OBJSTATUS.isStartup 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
OBJSTATUS_isStartup 
, 
OBJSTATUS.the_comment 
OBJSTATUS_the_comment 
, OBJECTTYPE.InstanceID InstanceID 
, OBJSTATUS.OBJSTATUSID ID 
, 'OBJSTATUS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from OBJSTATUS
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=OBJSTATUS.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTONEXTSTATE as 
select   NEXTSTATEID,OBJSTATUSID,OBJECTTYPEID
, 
 NEXTSTATE.TheState  
NEXTSTATE_TheState_ID, 
 MTZ.Func.OBJSTATUS_BRIEF_F(NEXTSTATE.TheState) 
NEXTSTATE_TheState 
, OBJECTTYPE.InstanceID InstanceID 
, NEXTSTATE.NEXTSTATEID ID 
, 'NEXTSTATE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from NEXTSTATE
 join OBJSTATUS on OBJSTATUS.OBJSTATUSID=NEXTSTATE.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=OBJSTATUS.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOOBJECTMODE as 
select   OBJECTMODEID,OBJECTTYPEID
, 
 OBJECTMODE.DefaultMode  
OBJECTMODE_DefaultMode_VAL, 
 decode(OBJECTMODE.DefaultMode 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
OBJECTMODE_DefaultMode 
, 
OBJECTMODE.Name 
OBJECTMODE_Name 
, 
OBJECTMODE.TheComment 
OBJECTMODE_TheComment 
, OBJECTTYPE.InstanceID InstanceID 
, OBJECTMODE.OBJECTMODEID ID 
, 'OBJECTMODE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from OBJECTMODE
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=OBJECTMODE.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
 MTZ.Func.MTZAPP_BRIEF_F(OBJECTTYPE.Package) 
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
 MTZ.Func.TYPEMENU_BRIEF_F(OBJECTTYPE.OnRun) 
OBJECTTYPE_OnRun 
, 
 OBJECTTYPE.ChooseView  
OBJECTTYPE_ChooseView_ID, 
 MTZ.Func.PARTVIEW_BRIEF_F(OBJECTTYPE.ChooseView) 
OBJECTTYPE_ChooseView 
, 
 OBJECTTYPE.OnDelete  
OBJECTTYPE_OnDelete_ID, 
 MTZ.Func.TYPEMENU_BRIEF_F(OBJECTTYPE.OnDelete) 
OBJECTTYPE_OnDelete 
, 
OBJECTMODE.Name 
OBJECTMODE_Name 
, 
 OBJECTTYPE.OnCreate  
OBJECTTYPE_OnCreate_ID, 
 MTZ.Func.TYPEMENU_BRIEF_F(OBJECTTYPE.OnCreate) 
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
/
create or replace view V_AUTOSTRUCTRESTRICTION as 
select   STRUCTRESTRICTIONID,OBJECTMODEID,OBJECTTYPEID
, 
 STRUCTRESTRICTION.AllowRead  
STRUCTRESTRICTION_AllowRead_VAL, 
 decode(STRUCTRESTRICTION.AllowRead 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
STRUCTRESTRICTION_AllowRead 
, 
 STRUCTRESTRICTION.AllowAdd  
STRUCTRESTRICTION_AllowAdd_VAL, 
 decode(STRUCTRESTRICTION.AllowAdd 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
STRUCTRESTRICTION_AllowAdd 
, 
 STRUCTRESTRICTION.AllowEdit  
STRUCTRESTRICTION_AllowEdit_VAL, 
 decode(STRUCTRESTRICTION.AllowEdit 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
STRUCTRESTRICTION_AllowEdit 
, 
 STRUCTRESTRICTION.Struct  
STRUCTRESTRICTION_Struct_ID, 
 MTZ.Func.PART_BRIEF_F(STRUCTRESTRICTION.Struct) 
STRUCTRESTRICTION_Struct 
, 
 STRUCTRESTRICTION.AllowDelete  
STRUCTRESTRICTION_AllowDelete_VAL, 
 decode(STRUCTRESTRICTION.AllowDelete 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
STRUCTRESTRICTION_AllowDelete 
, OBJECTTYPE.InstanceID InstanceID 
, STRUCTRESTRICTION.STRUCTRESTRICTIONID ID 
, 'STRUCTRESTRICTION' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from STRUCTRESTRICTION
 join OBJECTMODE on OBJECTMODE.OBJECTMODEID=STRUCTRESTRICTION.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=OBJECTMODE.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOFIELDRESTRICTION as 
select   FIELDRESTRICTIONID,OBJECTMODEID,OBJECTTYPEID
, 
 FIELDRESTRICTION.AllowRead  
FIELDRESTRICTION_AllowRead_VAL, 
 decode(FIELDRESTRICTION.AllowRead 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELDRESTRICTION_AllowRead 
, 
 FIELDRESTRICTION.ThePart  
FIELDRESTRICTION_ThePart_ID, 
 MTZ.Func.PART_BRIEF_F(FIELDRESTRICTION.ThePart) 
FIELDRESTRICTION_ThePart 
, 
 FIELDRESTRICTION.AllowModify  
FIELDRESTRICTION_AllowModify_VAL, 
 decode(FIELDRESTRICTION.AllowModify 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
FIELDRESTRICTION_AllowModify 
, 
 FIELDRESTRICTION.TheField  
FIELDRESTRICTION_TheField_ID, 
 MTZ.Func.FIELD_BRIEF_F(FIELDRESTRICTION.TheField) 
FIELDRESTRICTION_TheField 
, OBJECTTYPE.InstanceID InstanceID 
, FIELDRESTRICTION.FIELDRESTRICTIONID ID 
, 'FIELDRESTRICTION' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from FIELDRESTRICTION
 join OBJECTMODE on OBJECTMODE.OBJECTMODEID=FIELDRESTRICTION.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=OBJECTMODE.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOMETHODRESTRICTION as 
select   METHODRESTRICTIONID,OBJECTMODEID,OBJECTTYPEID
, 
 METHODRESTRICTION.Method  
METHODRESTRICTION_Method_ID, 
 MTZ.Func.SHAREDMETHOD_BRIEF_F(METHODRESTRICTION.Method) 
METHODRESTRICTION_Method 
, 
 METHODRESTRICTION.IsRestricted  
METHODRESTRICTION_IsRestricted_VAL, 
 decode(METHODRESTRICTION.IsRestricted 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
METHODRESTRICTION_IsRestricted 
, 
 METHODRESTRICTION.Part  
METHODRESTRICTION_Part_ID, 
 MTZ.Func.PART_BRIEF_F(METHODRESTRICTION.Part) 
METHODRESTRICTION_Part 
, OBJECTTYPE.InstanceID InstanceID 
, METHODRESTRICTION.METHODRESTRICTIONID ID 
, 'METHODRESTRICTION' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from METHODRESTRICTION
 join OBJECTMODE on OBJECTMODE.OBJECTMODEID=METHODRESTRICTION.ParentStructRowID 
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=OBJECTMODE.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOTYPEMENU as 
select   TYPEMENUID,OBJECTTYPEID
, 
TYPEMENU.Caption 
TYPEMENU_Caption 
, 
 TYPEMENU.the_Action  
TYPEMENU_the_Action_ID, 
 MTZ.Func.SHAREDMETHOD_BRIEF_F(TYPEMENU.the_Action) 
TYPEMENU_the_Action 
, 
TYPEMENU.ToolTip 
TYPEMENU_ToolTip 
, 
TYPEMENU.HotKey 
TYPEMENU_HotKey 
, 
TYPEMENU.Name 
TYPEMENU_Name 
, 
 TYPEMENU.IsMenuItem  
TYPEMENU_IsMenuItem_VAL, 
 decode(TYPEMENU.IsMenuItem 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
TYPEMENU_IsMenuItem 
, 
 TYPEMENU.IsToolBarButton  
TYPEMENU_IsToolBarButton_VAL, 
 decode(TYPEMENU.IsToolBarButton 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
TYPEMENU_IsToolBarButton 
, OBJECTTYPE.InstanceID InstanceID 
, TYPEMENU.TYPEMENUID ID 
, 'TYPEMENU' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from TYPEMENU
 join OBJECTTYPE on OBJECTTYPE.OBJECTTYPEID=TYPEMENU.ParentStructRowID 
 join INSTANCE on OBJECTTYPE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
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
/
create or replace view V_AUTOMTZAPP as 
select   MTZAPPID
, 
MTZAPP.DBName 
MTZAPP_DBName 
, 
MTZAPP.Name 
MTZAPP_Name 
, 
MTZAPP.TheComment 
MTZAPP_TheComment 
, MTZAPP.InstanceID InstanceID 
, MTZAPP.MTZAPPID ID 
, 'MTZAPP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZAPP
 join INSTANCE on MTZAPP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOParentPackage as 
select   ParentPackageID,MTZAPPID
, 
 ParentPackage.Package  
ParentPackage_Package_ID, 
 MTZ.Func.MTZAPP_BRIEF_F(ParentPackage.Package) 
ParentPackage_Package 
, MTZAPP.InstanceID InstanceID 
, ParentPackage.ParentPackageID ID 
, 'ParentPackage' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ParentPackage
 join MTZAPP on MTZAPP.MTZAPPID=ParentPackage.ParentStructRowID 
 join INSTANCE on MTZAPP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOGENPACKAGE as 
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
/
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
/
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
/
create or replace view V_AUTOGENERATOR_TARGET as 
select   GENERATOR_TARGETID,GENPACKAGEID
, 
 GENERATOR_TARGET.TargetType  
GENERATOR_TARGET_TargetType_VAL, 
 decode(GENERATOR_TARGET.TargetType 
, 0 ,'СУБД'
, 4 ,'АРМ'
, 3 ,'Документация'
, 1 ,'МОДЕЛЬ'
, 2 ,'Приложение'
, '???') 
GENERATOR_TARGET_TargetType 
, 
 GENERATOR_TARGET.TheDevelopmentEnv  
GENERATOR_TARGET_TheDevelopmentEnv_VAL, 
 decode(GENERATOR_TARGET.TheDevelopmentEnv 
, 2 ,'JAVA'
, 3 ,'OTHER'
, 1 ,'DOTNET'
, 0 ,'VB6'
, '???') 
GENERATOR_TARGET_TheDevelopmentEnv 
, 
GENERATOR_TARGET.QueueName 
GENERATOR_TARGET_QueueName 
, 
 GENERATOR_TARGET.GeneratorStyle  
GENERATOR_TARGET_GeneratorStyle_VAL, 
 decode(GENERATOR_TARGET.GeneratorStyle 
, 0 ,'Один тип'
, 1 ,'Все типы сразу'
, '???') 
GENERATOR_TARGET_GeneratorStyle 
, 
GENERATOR_TARGET.GeneratorProgID 
GENERATOR_TARGET_GeneratorProgID 
, 
GENERATOR_TARGET.Name 
GENERATOR_TARGET_Name 
, GENPACKAGE.InstanceID InstanceID 
, GENERATOR_TARGET.GENERATOR_TARGETID ID 
, 'GENERATOR_TARGET' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from GENERATOR_TARGET
 join GENPACKAGE on GENPACKAGE.GENPACKAGEID=GENERATOR_TARGET.ParentStructRowID 
 join INSTANCE on GENPACKAGE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOGENMANUALCODE as 
select   GENMANUALCODEID,GENERATOR_TARGETID,GENPACKAGEID
, 
GENMANUALCODE.the_Alias 
GENMANUALCODE_the_Alias 
, 
GENMANUALCODE.Name 
GENMANUALCODE_Name 
, 
GENMANUALCODE.Code 
GENMANUALCODE_Code 
, GENPACKAGE.InstanceID InstanceID 
, GENMANUALCODE.GENMANUALCODEID ID 
, 'GENMANUALCODE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from GENMANUALCODE
 join GENERATOR_TARGET on GENERATOR_TARGET.GENERATOR_TARGETID=GENMANUALCODE.ParentStructRowID 
 join GENPACKAGE on GENPACKAGE.GENPACKAGEID=GENERATOR_TARGET.ParentStructRowID 
 join INSTANCE on GENPACKAGE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOGENCONTROLS as 
select   GENCONTROLSID,GENERATOR_TARGETID,GENPACKAGEID
, 
GENCONTROLS.ControlProgID 
GENCONTROLS_ControlProgID 
, 
GENCONTROLS.ControlClassID 
GENCONTROLS_ControlClassID 
, 
GENCONTROLS.VersionMinor 
GENCONTROLS_VersionMinor 
, 
GENCONTROLS.VersionMajor 
GENCONTROLS_VersionMajor 
, GENPACKAGE.InstanceID InstanceID 
, GENCONTROLS.GENCONTROLSID ID 
, 'GENCONTROLS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from GENCONTROLS
 join GENERATOR_TARGET on GENERATOR_TARGET.GENERATOR_TARGETID=GENCONTROLS.ParentStructRowID 
 join GENPACKAGE on GENPACKAGE.GENPACKAGEID=GENERATOR_TARGET.ParentStructRowID 
 join INSTANCE on GENPACKAGE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOGENREFERENCE as 
select   GENREFERENCEID,GENERATOR_TARGETID,GENPACKAGEID
, 
GENREFERENCE.RefClassID 
GENREFERENCE_RefClassID 
, 
GENREFERENCE.VersionMajor 
GENREFERENCE_VersionMajor 
, 
GENREFERENCE.Name 
GENREFERENCE_Name 
, 
GENREFERENCE.VersionMinor 
GENREFERENCE_VersionMinor 
, GENPACKAGE.InstanceID InstanceID 
, GENREFERENCE.GENREFERENCEID ID 
, 'GENREFERENCE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from GENREFERENCE
 join GENERATOR_TARGET on GENERATOR_TARGET.GENERATOR_TARGETID=GENREFERENCE.ParentStructRowID 
 join GENPACKAGE on GENPACKAGE.GENPACKAGEID=GENERATOR_TARGET.ParentStructRowID 
 join INSTANCE on GENPACKAGE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTNO_YC as 
select   ITTNO_YCID
, 
ITTNO_YC.YNum 
ITTNO_YC_YNum 
, 
ITTNO_YC.TheTime 
ITTNO_YC_TheTime 
, ITTNO_YC.InstanceID InstanceID 
, ITTNO_YC.ITTNO_YCID ID 
, 'ITTNO_YC' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTNO_YC
 join INSTANCE on ITTNO_YC.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTNO_CMN as 
select   ITTNO_CMNID
, 
ITTNO_CMN.IN_TIME 
ITTNO_CMN_IN_TIME 
, 
ITTNO_CMN.Out_Time 
ITTNO_CMN_Out_Time 
, ITTNO_CMN.InstanceID InstanceID 
, ITTNO_CMN.ITTNO_CMNID ID 
, 'ITTNO_CMN' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTNO_CMN
 join INSTANCE on ITTNO_CMN.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTNO_ZC as 
select   ITTNO_ZCID
, 
ITTNO_ZC.ZNum 
ITTNO_ZC_ZNum 
, 
ITTNO_ZC.TheTime 
ITTNO_ZC_TheTime 
, ITTNO_ZC.InstanceID InstanceID 
, ITTNO_ZC.ITTNO_ZCID ID 
, 'ITTNO_ZC' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTNO_ZC
 join INSTANCE on ITTNO_ZC.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOInfoStoreDef as 
select   InfoStoreDefID
, 
 InfoStoreDef.TheGroup  
InfoStoreDef_TheGroup_ID, 
 MTZ.Func.Groups_BRIEF_F(InfoStoreDef.TheGroup) 
InfoStoreDef_TheGroup 
, 
InfoStoreDef.Name 
InfoStoreDef_Name 
, 
 InfoStoreDef.TheUser  
InfoStoreDef_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(InfoStoreDef.TheUser) 
InfoStoreDef_TheUser 
, 
 InfoStoreDef.InfoStoreType  
InfoStoreDef_InfoStoreType_VAL, 
 decode(InfoStoreDef.InfoStoreType 
, 2 ,'Групповой'
, 1 ,'Персональный'
, 0 ,' Общий'
, '???') 
InfoStoreDef_InfoStoreType 
, InfoStoreDef.InstanceID InstanceID 
, InfoStoreDef.InfoStoreDefID ID 
, 'InfoStoreDef' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from InfoStoreDef
 join INSTANCE on InfoStoreDef.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOInfoStoreDef as 
select   InfoStoreDefID
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
 InfoStoreDef.TheGroup  
InfoStoreDef_TheGroup_ID, 
 MTZ.Func.Groups_BRIEF_F(InfoStoreDef.TheGroup) 
InfoStoreDef_TheGroup 
, 
InfoStoreDef.Name 
InfoStoreDef_Name 
, 
 InfoStoreDef.TheUser  
InfoStoreDef_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(InfoStoreDef.TheUser) 
InfoStoreDef_TheUser 
, InfoStoreDef.InstanceID InstanceID 
, InfoStoreDef.InfoStoreDefID ID 
, 'InfoStoreDef' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from InfoStoreDef
 join INSTANCE on InfoStoreDef.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOInfoStoreDef as 
select   InfoStoreDefID
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
 InfoStoreDef.TheGroup  
InfoStoreDef_TheGroup_ID, 
 MTZ.Func.Groups_BRIEF_F(InfoStoreDef.TheGroup) 
InfoStoreDef_TheGroup 
, 
 InfoStoreDef.TheUser  
InfoStoreDef_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(InfoStoreDef.TheUser) 
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
/
create or replace view V_AUTOFolder as 
select   FolderID
, 
 Folder.FolderType  
Folder_FolderType_VAL, 
 decode(Folder.FolderType 
, 2 ,'Исходящие'
, 10 ,'Завершенные'
, 0 ,'cls__'
, 5 ,'Календарь'
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
/
create or replace view V_AUTOFolder as 
select   FolderID
, 
Folder.Name 
Folder_Name 
, 
 Folder.FolderType  
Folder_FolderType_VAL, 
 decode(Folder.FolderType 
, 2 ,'Исходящие'
, 10 ,'Завершенные'
, 0 ,'cls__'
, 5 ,'Календарь'
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
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOFolder as 
select   FolderID
, 
 Folder.FolderType  
Folder_FolderType_VAL, 
 decode(Folder.FolderType 
, 2 ,'Исходящие'
, 10 ,'Завершенные'
, 0 ,'cls__'
, 5 ,'Календарь'
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
/
create or replace view V_viewSTDInfoStore_Folder as 
select   FolderID
, 
 InfoStoreDef.TheUser  
InfoStoreDef_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(InfoStoreDef.TheUser) 
InfoStoreDef_TheUser 
, 
 InfoStoreDef.TheGroup  
InfoStoreDef_TheGroup_ID, 
 MTZ.Func.Groups_BRIEF_F(InfoStoreDef.TheGroup) 
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
, 0 ,'cls__'
, 5 ,'Календарь'
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
/
create or replace view V_AUTOShortcut as 
select   ShortcutID,FolderID
, 
Shortcut.StartMode 
Shortcut_StartMode 
, 
 Shortcut.DocItem  
Shortcut_DocItem_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(Shortcut.DocItem) 
Shortcut_DocItem 
, Folder.InstanceID InstanceID 
, Shortcut.ShortcutID ID 
, 'Shortcut' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Shortcut
 join Folder on Folder.FolderID=Shortcut.ParentStructRowID 
 join INSTANCE on Folder.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOShortcut as 
select   ShortcutID,FolderID
, 
 Shortcut.DocItem  
Shortcut_DocItem_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(Shortcut.DocItem) 
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
/
create or replace view V_AUTOShortcut as 
select   ShortcutID,FolderID
, 
 Shortcut.DocItem  
Shortcut_DocItem_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(Shortcut.DocItem) 
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
/
create or replace view V_AUTOReports as 
select   ReportsID
, 
 Reports.TheReportExt  
Reports_TheReportExt_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(Reports.TheReportExt) 
Reports_TheReportExt 
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
 MTZ.Func.SHAREDMETHOD_BRIEF_F(Reports.PrepareMethod) 
Reports_PrepareMethod 
, 
Reports.ReportView 
Reports_ReportView 
, 
Reports.Caption 
Reports_Caption 
, 
Reports.ReportFile 
Reports_ReportFile 
, 
Reports.Name 
Reports_Name 
, 
Reports.TheComment 
Reports_TheComment 
, Reports.InstanceID InstanceID 
, Reports.ReportsID ID 
, 'Reports' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Reports
 join INSTANCE on Reports.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
create or replace view V_AUTORPTStruct as 
select   RPTStructID
, 
RPTStruct.Name 
RPTStruct_Name 
, 
RPTStruct.Caption 
RPTStruct_Caption 
, RPTStruct.InstanceID InstanceID 
, RPTStruct.RPTStructID ID 
, 'RPTStruct' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RPTStruct
 join INSTANCE on RPTStruct.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTORPTFields as 
select   RPTFieldsID,RPTStructID
, 
RPTFields.Caption 
RPTFields_Caption 
, 
RPTFields.FieldSize 
RPTFields_FieldSize 
, 
RPTFields.Name 
RPTFields_Name 
, 
 RPTFields.FieldType  
RPTFields_FieldType_ID, 
 MTZ.Func.FIELDTYPE_BRIEF_F(RPTFields.FieldType) 
RPTFields_FieldType 
, RPTStruct.InstanceID InstanceID 
, RPTFields.RPTFieldsID ID 
, 'RPTFields' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RPTFields
 join RPTStruct on RPTStruct.RPTStructID=RPTFields.ParentStructRowID 
 join INSTANCE on RPTStruct.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTORPTFormula as 
select   RPTFormulaID
, 
 RPTFormula.Platform  
RPTFormula_Platform_ID, 
 MTZ.Func.GENERATOR_TARGET_BRIEF_F(RPTFormula.Platform) 
RPTFormula_Platform 
, 
RPTFormula.Code 
RPTFormula_Code 
, 
RPTFormula.Name 
RPTFormula_Name 
, RPTFormula.InstanceID InstanceID 
, RPTFormula.RPTFormulaID ID 
, 'RPTFormula' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from RPTFormula
 join INSTANCE on RPTFormula.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTPR_DEF as 
select   ITTPR_DEFID
, 
ITTPR_DEF.InBoxes 
ITTPR_DEF_InBoxes 
, 
ITTPR_DEF.the_Description 
ITTPR_DEF_Description 
, 
ITTPR_DEF.KillPlace 
ITTPR_DEF_KillPlace 
, 
ITTPR_DEF.Poddon 
ITTPR_DEF_Poddon 
, 
ITTPR_DEF.Good 
ITTPR_DEF_Good 
, 
ITTPR_DEF.TheDate 
ITTPR_DEF_TheDate 
, 
ITTPR_DEF.Client 
ITTPR_DEF_Client 
, 
ITTPR_DEF.OutBoxes 
ITTPR_DEF_OutBoxes 
, 
ITTPR_DEF.Country 
ITTPR_DEF_Country 
, 
ITTPR_DEF.Factory 
ITTPR_DEF_Factory 
, 
ITTPR_DEF.InWeight 
ITTPR_DEF_InWeight 
, 
ITTPR_DEF.Vesi 
ITTPR_DEF_Vesi 
, 
ITTPR_DEF.Moroz 
ITTPR_DEF_Moroz 
, 
ITTPR_DEF.OutWeight 
ITTPR_DEF_OutWeight 
, 
ITTPR_DEF.WeightDelta 
ITTPR_DEF_WeightDelta 
, 
ITTPR_DEF.Brak 
ITTPR_DEF_Brak 
, ITTPR_DEF.InstanceID InstanceID 
, ITTPR_DEF.ITTPR_DEFID ID 
, 'ITTPR_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTPR_DEF
 join INSTANCE on ITTPR_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
create or replace view V_AUTOMTZExt_def as 
select   MTZExt_defID
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
MTZExt_def.TheDescription 
MTZExt_def_TheDescription 
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
/
create or replace view V_AUTOMTZExtRel as 
select   MTZExtRelID
, 
MTZExtRel.TheClassName 
MTZExtRel_TheClassName 
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
MTZExtRel.TheLibraryName 
MTZExtRel_TheLibraryName 
, MTZExtRel.InstanceID InstanceID 
, MTZExtRel.MTZExtRelID ID 
, 'MTZExtRel' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZExtRel
 join INSTANCE on MTZExtRel.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTCS_LIN as 
select   ITTCS_LINID
, 
 ITTCS_LIN.UseSrv  
ITTCS_LIN_UseSrv_VAL, 
 decode(ITTCS_LIN.UseSrv 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTCS_LIN_UseSrv 
, 
 ITTCS_LIN.SRV  
ITTCS_LIN_SRV_ID, 
 MTZ.Func.ITTD_SRV_BRIEF_F(ITTCS_LIN.SRV) 
ITTCS_LIN_SRV 
, ITTCS_LIN.InstanceID InstanceID 
, ITTCS_LIN.ITTCS_LINID ID 
, 'ITTCS_LIN' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTCS_LIN
 join INSTANCE on ITTCS_LIN.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTCS_LIN as 
select   ITTCS_LINID
, 
 ITTCS_LIN.SRV  
ITTCS_LIN_SRV_ID, 
 MTZ.Func.ITTD_SRV_BRIEF_F(ITTCS_LIN.SRV) 
ITTCS_LIN_SRV 
, 
 ITTCS_LIN.UseSrv  
ITTCS_LIN_UseSrv_VAL, 
 decode(ITTCS_LIN.UseSrv 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTCS_LIN_UseSrv 
, ITTCS_LIN.InstanceID InstanceID 
, ITTCS_LIN.ITTCS_LINID ID 
, 'ITTCS_LIN' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTCS_LIN
 join INSTANCE on ITTCS_LIN.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTCS_DEF as 
select   ITTCS_DEFID
, 
 ITTCS_DEF.CLIENTCODE  
ITTCS_DEF_CLIENTCODE_ID, 
ITTCS_DEF.CLIENTCODE 
ITTCS_DEF_CLIENTCODE 
, ITTCS_DEF.InstanceID InstanceID 
, ITTCS_DEF.ITTCS_DEFID ID 
, 'ITTCS_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTCS_DEF
 join INSTANCE on ITTCS_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTCS_DEF as 
select   ITTCS_DEFID
, 
 ITTCS_DEF.CLIENTCODE  
ITTCS_DEF_CLIENTCODE_ID, 
ITTCS_DEF.CLIENTCODE 
ITTCS_DEF_CLIENTCODE 
, ITTCS_DEF.InstanceID InstanceID 
, ITTCS_DEF.ITTCS_DEFID ID 
, 'ITTCS_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTCS_DEF
 join INSTANCE on ITTCS_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOSysLog as 
select   SysLogID
, 
SysLog.LogInstanceID 
SysLog_LogInstanceID 
, 
SysLog.VERB 
SysLog_VERB 
, 
SysLog.LogStructID 
SysLog_LogStructID 
, 
SysLog.the_Resource 
SysLog_the_Resource 
, 
 SysLog.TheSession  
SysLog_TheSession_ID, 
 MTZ.Func.the_Session_BRIEF_F(SysLog.TheSession) 
SysLog_TheSession 
, SysLog.InstanceID InstanceID 
, SysLog.SysLogID ID 
, 'SysLog' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from SysLog
 join INSTANCE on SysLog.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOthe_Session as 
select   the_SessionID
, 
 the_Session.Usersid  
the_Session_Usersid_ID, 
 MTZ.Func.Users_BRIEF_F(the_Session.Usersid) 
the_Session_Usersid 
, 
the_Session.LastAccess 
the_Session_LastAccess 
, 
the_Session.ClosedAt 
the_Session_ClosedAt 
, 
the_Session.StartAt 
the_Session_StartAt 
, 
 the_Session.Closed  
the_Session_Closed_VAL, 
 decode(the_Session.Closed 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
the_Session_Closed 
, 
 the_Session.UserRole  
the_Session_UserRole_ID, 
 MTZ.Func.Groups_BRIEF_F(the_Session.UserRole) 
the_Session_UserRole 
, the_Session.InstanceID InstanceID 
, the_Session.the_SessionID ID 
, 'the_Session' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from the_Session
 join INSTANCE on the_Session.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOLogReader as 
select   LogReaderID
, 
LogReader.Name 
LogReader_Name 
, 
LogReader.LastStart 
LogReader_LastStart 
, 
LogReader.StartInterval 
LogReader_StartInterval 
, 
LogReader.ReadMarker 
LogReader_ReadMarker 
, 
LogReader.LastStop 
LogReader_LastStop 
, 
LogReader.AutoProgid 
LogReader_AutoProgid 
, 
 LogReader.AutoStart  
LogReader_AutoStart_VAL, 
 decode(LogReader.AutoStart 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
LogReader_AutoStart 
, LogReader.InstanceID InstanceID 
, LogReader.LogReaderID ID 
, 'LogReader' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from LogReader
 join INSTANCE on LogReader.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOVerb as 
select   VerbID
, 
Verb.Name 
Verb_Name 
, Verb.InstanceID InstanceID 
, Verb.VerbID ID 
, 'Verb' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Verb
 join INSTANCE on Verb.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
create or replace view V_AUTOUsers as 
select   UsersID
, 
Users.Login 
Users_Login 
, 
Users.Phone 
Users_Phone 
, 
Users.BirthDay 
Users_BirthDay 
, 
Users.Photo 
Users_Photo 
, 
Users.Name 
Users_Name 
, 
Users.LocalPhone 
Users_LocalPhone 
, 
Users.CertificateID 
Users_CertificateID 
, 
 Users.PersonaData  
Users_PersonaData_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(Users.PersonaData) 
Users_PersonaData 
, 
Users.CertData 
Users_CertData 
, 
Users.SurName 
Users_SurName 
, 
Users.MobilePhone 
Users_MobilePhone 
, 
 Users.Activity  
Users_Activity_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(Users.Activity) 
Users_Activity 
, 
 Users.ClientDef  
Users_ClientDef_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(Users.ClientDef) 
Users_ClientDef 
, 
Users.Password 
Users_Password 
, 
Users.EMail 
Users_EMail 
, 
Users.Family 
Users_Family 
, 
Users.DomaiName 
Users_DomaiName 
, Users.InstanceID InstanceID 
, Users.UsersID ID 
, 'Users' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Users
 join INSTANCE on Users.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOUsers as 
select   UsersID
, 
Users.Login 
Users_Login 
, 
Users.Name 
Users_Name 
, 
Users.Phone 
Users_Phone 
, 
Users.EMail 
Users_EMail 
, 
 Users.PersonaData  
Users_PersonaData_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(Users.PersonaData) 
Users_PersonaData 
, 
Users.PositionU 
Users_PositionU 
, 
Users.Family 
Users_Family 
, 
 Users.ClientDef  
Users_ClientDef_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(Users.ClientDef) 
Users_ClientDef 
, 
Users.CertData 
Users_CertData 
, 
Users.CertificateID 
Users_CertificateID 
, 
Users.WorkPlace 
Users_WorkPlace 
, 
Users.SurName 
Users_SurName 
, 
Users.MobilePhone 
Users_MobilePhone 
, 
Users.BirthDay 
Users_BirthDay 
, 
Users.Password 
Users_Password 
, 
Users.LocalPhone 
Users_LocalPhone 
, 
Users.Photo 
Users_Photo 
, 
Users.DomaiName 
Users_DomaiName 
, 
 Users.Activity  
Users_Activity_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(Users.Activity) 
Users_Activity 
, Users.InstanceID InstanceID 
, Users.UsersID ID 
, 'Users' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Users
 join INSTANCE on Users.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
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
/
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
/
create or replace view V_viewMTZUsers_GroupUser as 
select   GroupUserID,GroupsID
, 
 GroupUser.TheUser  
GroupUser_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(GroupUser.TheUser) 
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
/
create or replace view V_AUTOGroupUser as 
select   GroupUserID,GroupsID
, 
 GroupUser.TheUser  
GroupUser_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(GroupUser.TheUser) 
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
/
create or replace view V_AUTOGroupUser as 
select   GroupUserID,GroupsID
, 
 GroupUser.TheUser  
GroupUser_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(GroupUser.TheUser) 
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
/
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
 MTZ.Func.Groups_BRIEF_F(MTZSEC_RIGHT.TheGroup) 
MTZSEC_RIGHT_TheGroup 
, MTZSEC_RIGHT.InstanceID InstanceID 
, MTZSEC_RIGHT.MTZSEC_RIGHTID ID 
, 'MTZSEC_RIGHT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZSEC_RIGHT
 join INSTANCE on MTZSEC_RIGHT.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOMTZSEC_RIGHT as 
select   MTZSEC_RIGHTID
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
 MTZ.Func.Groups_BRIEF_F(MTZSEC_RIGHT.TheGroup) 
MTZSEC_RIGHT_TheGroup 
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
/
create or replace view V_AUTOROLES_USER as 
select   ROLES_USERID
, 
 ROLES_USER.TheUser  
ROLES_USER_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(ROLES_USER.TheUser) 
ROLES_USER_TheUser 
, ROLES_USER.InstanceID InstanceID 
, ROLES_USER.ROLES_USERID ID 
, 'ROLES_USER' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_USER
 join INSTANCE on ROLES_USER.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOROLES_USER as 
select   ROLES_USERID
, 
 ROLES_USER.TheUser  
ROLES_USER_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(ROLES_USER.TheUser) 
ROLES_USER_TheUser 
, ROLES_USER.InstanceID InstanceID 
, ROLES_USER.ROLES_USERID ID 
, 'ROLES_USER' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_USER
 join INSTANCE on ROLES_USER.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOROLES_MAP as 
select   ROLES_MAPID
, 
 ROLES_MAP.TheGroup  
ROLES_MAP_TheGroup_ID, 
 MTZ.Func.Groups_BRIEF_F(ROLES_MAP.TheGroup) 
ROLES_MAP_TheGroup 
, ROLES_MAP.InstanceID InstanceID 
, ROLES_MAP.ROLES_MAPID ID 
, 'ROLES_MAP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_MAP
 join INSTANCE on ROLES_MAP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOROLES_MAP as 
select   ROLES_MAPID
, 
 ROLES_MAP.TheGroup  
ROLES_MAP_TheGroup_ID, 
 MTZ.Func.Groups_BRIEF_F(ROLES_MAP.TheGroup) 
ROLES_MAP_TheGroup 
, ROLES_MAP.InstanceID InstanceID 
, ROLES_MAP.ROLES_MAPID ID 
, 'ROLES_MAP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_MAP
 join INSTANCE on ROLES_MAP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOROLES_DOC as 
select   ROLES_DOCID
, 
 ROLES_DOC.The_Document  
ROLES_DOC_The_Document_ID, 
 MTZ.Func.OBJECTTYPE_BRIEF_F(ROLES_DOC.The_Document) 
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
/
create or replace view V_AUTOROLES_DOC as 
select   ROLES_DOCID
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
, 
 ROLES_DOC.The_Document  
ROLES_DOC_The_Document_ID, 
 MTZ.Func.OBJECTTYPE_BRIEF_F(ROLES_DOC.The_Document) 
ROLES_DOC_The_Document 
, ROLES_DOC.InstanceID InstanceID 
, ROLES_DOC.ROLES_DOCID ID 
, 'ROLES_DOC' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_DOC
 join INSTANCE on ROLES_DOC.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOROLES_DOC_STATE as 
select   ROLES_DOC_STATEID,ROLES_DOCID
, 
 ROLES_DOC_STATE.StateChangeDisabled  
ROLES_DOC_STATE_StateChangeDisabled_VAL, 
 decode(ROLES_DOC_STATE.StateChangeDisabled 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DOC_STATE_StateChangeDisabled 
, 
 ROLES_DOC_STATE.The_Mode  
ROLES_DOC_STATE_The_Mode_ID, 
 MTZ.Func.OBJECTMODE_BRIEF_F(ROLES_DOC_STATE.The_Mode) 
ROLES_DOC_STATE_The_Mode 
, 
 ROLES_DOC_STATE.The_State  
ROLES_DOC_STATE_The_State_ID, 
 MTZ.Func.OBJSTATUS_BRIEF_F(ROLES_DOC_STATE.The_State) 
ROLES_DOC_STATE_The_State 
, 
 ROLES_DOC_STATE.AllowDelete  
ROLES_DOC_STATE_AllowDelete_VAL, 
 decode(ROLES_DOC_STATE.AllowDelete 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DOC_STATE_AllowDelete 
, ROLES_DOC.InstanceID InstanceID 
, ROLES_DOC_STATE.ROLES_DOC_STATEID ID 
, 'ROLES_DOC_STATE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_DOC_STATE
 join ROLES_DOC on ROLES_DOC.ROLES_DOCID=ROLES_DOC_STATE.ParentStructRowID 
 join INSTANCE on ROLES_DOC.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOROLES_DOC_STATE as 
select   ROLES_DOC_STATEID,ROLES_DOCID
, 
 ROLES_DOC_STATE.The_Mode  
ROLES_DOC_STATE_The_Mode_ID, 
 MTZ.Func.OBJECTMODE_BRIEF_F(ROLES_DOC_STATE.The_Mode) 
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
 MTZ.Func.OBJSTATUS_BRIEF_F(ROLES_DOC_STATE.The_State) 
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
/
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
/
create or replace view V_AUTOROLES_DEF as 
select   ROLES_DEFID
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
 ROLES_DEF.FileExch_Denied  
ROLES_DEF_FileExch_Denied_VAL, 
 decode(ROLES_DEF.FileExch_Denied 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DEF_FileExch_Denied 
, 
 ROLES_DEF.ListCFG_Denied  
ROLES_DEF_ListCFG_Denied_VAL, 
 decode(ROLES_DEF.ListCFG_Denied 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_DEF_ListCFG_Denied 
, ROLES_DEF.InstanceID InstanceID 
, ROLES_DEF.ROLES_DEFID ID 
, 'ROLES_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_DEF
 join INSTANCE on ROLES_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
create or replace view V_AUTOROLES_REPORTS as 
select   ROLES_REPORTSID
, 
 ROLES_REPORTS.The_Report  
ROLES_REPORTS_The_Report_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(ROLES_REPORTS.The_Report) 
ROLES_REPORTS_The_Report 
, ROLES_REPORTS.InstanceID InstanceID 
, ROLES_REPORTS.ROLES_REPORTSID ID 
, 'ROLES_REPORTS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_REPORTS
 join INSTANCE on ROLES_REPORTS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOROLES_REPORTS as 
select   ROLES_REPORTSID
, 
 ROLES_REPORTS.The_Report  
ROLES_REPORTS_The_Report_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(ROLES_REPORTS.The_Report) 
ROLES_REPORTS_The_Report 
, ROLES_REPORTS.InstanceID InstanceID 
, ROLES_REPORTS.ROLES_REPORTSID ID 
, 'ROLES_REPORTS' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_REPORTS
 join INSTANCE on ROLES_REPORTS.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOROLES_WP as 
select   ROLES_WPID
, 
 ROLES_WP.WP  
ROLES_WP_WP_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(ROLES_WP.WP) 
ROLES_WP_WP 
, ROLES_WP.InstanceID InstanceID 
, ROLES_WP.ROLES_WPID ID 
, 'ROLES_WP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_WP
 join INSTANCE on ROLES_WP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOROLES_WP as 
select   ROLES_WPID
, 
 ROLES_WP.WP  
ROLES_WP_WP_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(ROLES_WP.WP) 
ROLES_WP_WP 
, ROLES_WP.InstanceID InstanceID 
, ROLES_WP.ROLES_WPID ID 
, 'ROLES_WP' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_WP
 join INSTANCE on ROLES_WP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOROLES_ACT as 
select   ROLES_ACTID,ROLES_WPID
, 
 ROLES_ACT.EntryPoints  
ROLES_ACT_EntryPoints_ID, 
 MTZ.Func.EntryPoints_BRIEF_F(ROLES_ACT.EntryPoints) 
ROLES_ACT_EntryPoints 
, 
 ROLES_ACT.Accesible  
ROLES_ACT_Accesible_VAL, 
 decode(ROLES_ACT.Accesible 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
ROLES_ACT_Accesible 
, ROLES_WP.InstanceID InstanceID 
, ROLES_ACT.ROLES_ACTID ID 
, 'ROLES_ACT' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ROLES_ACT
 join ROLES_WP on ROLES_WP.ROLES_WPID=ROLES_ACT.ParentStructRowID 
 join INSTANCE on ROLES_WP.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
 MTZ.Func.EntryPoints_BRIEF_F(ROLES_ACT.EntryPoints) 
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
/
create or replace view V_AUTOJournalColumn as 
select   JournalColumnID
, 
JournalColumn.sequence 
JournalColumn_sequence 
, 
JournalColumn.name 
JournalColumn_name 
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
, JournalColumn.InstanceID InstanceID 
, JournalColumn.JournalColumnID ID 
, 'JournalColumn' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from JournalColumn
 join INSTANCE on JournalColumn.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOJColumnSource as 
select   JColumnSourceID,JournalColumnID
, 
 JColumnSource.SrcPartView  
JColumnSource_SrcPartView_ID, 
 MTZ.Func.JournalSrc_BRIEF_F(JColumnSource.SrcPartView) 
JColumnSource_SrcPartView 
, 
JColumnSource.ViewField 
JColumnSource_ViewField 
, JournalColumn.InstanceID InstanceID 
, JColumnSource.JColumnSourceID ID 
, 'JColumnSource' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from JColumnSource
 join JournalColumn on JournalColumn.JournalColumnID=JColumnSource.ParentStructRowID 
 join INSTANCE on JournalColumn.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOJournal as 
select   JournalID
, 
Journal.Name 
Journal_Name 
, 
Journal.the_Alias 
Journal_the_Alias 
, 
Journal.TheComment 
Journal_TheComment 
, Journal.InstanceID InstanceID 
, Journal.JournalID ID 
, 'Journal' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from Journal
 join INSTANCE on Journal.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_viewMTZJrnl_Jo as 
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
/
create or replace view V_AUTOJournalSrc as 
select   JournalSrcID
, 
JournalSrc.OpenMode 
JournalSrc_OpenMode 
, 
JournalSrc.PartView 
JournalSrc_PartView 
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
, JournalSrc.InstanceID InstanceID 
, JournalSrc.JournalSrcID ID 
, 'JournalSrc' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from JournalSrc
 join INSTANCE on JournalSrc.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOMTZ_Inst_Build as 
select   MTZ_Inst_BuildID
, 
MTZ_Inst_Build.InstallDir 
MTZ_Inst_Build_InstallDir 
, 
MTZ_Inst_Build.PRODUCT_WEB_SITE 
MTZ_Inst_Build_PRODUCT_WEB_SITE 
, 
MTZ_Inst_Build.ShortCutDir 
MTZ_Inst_Build_ShortCutDir 
, 
 MTZ_Inst_Build.MainFileRef  
MTZ_Inst_Build_MainFileRef_ID, 
 MTZ.Func.MTZ_Inst_Sec_Files_BRIEF_F(MTZ_Inst_Build.MainFileRef) 
MTZ_Inst_Build_MainFileRef 
, 
MTZ_Inst_Build.PRODUCT_VERSION 
MTZ_Inst_Build_PRODUCT_VERSION 
, 
MTZ_Inst_Build.LicensFilePath 
MTZ_Inst_Build_LicensFilePath 
, 
MTZ_Inst_Build.PRODUCT_PUBLISHER 
MTZ_Inst_Build_PRODUCT_PUBLISHER 
, 
MTZ_Inst_Build.PRODUCT_NAME 
MTZ_Inst_Build_PRODUCT_NAME 
, MTZ_Inst_Build.InstanceID InstanceID 
, MTZ_Inst_Build.MTZ_Inst_BuildID ID 
, 'MTZ_Inst_Build' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZ_Inst_Build
 join INSTANCE on MTZ_Inst_Build.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_viewMTZ_Install_MTZ_Inst_Build as 
select   MTZ_Inst_BuildID
, 
MTZ_Inst_Build.LicensFilePath 
MTZ_Inst_Build_LicensFilePath 
, 
MTZ_Inst_Build.PRODUCT_NAME 
MTZ_Inst_Build_PRODUCT_NAME 
, 
MTZ_Inst_Build.InstallDir 
MTZ_Inst_Build_InstallDir 
, 
MTZ_Inst_Build.PRODUCT_VERSION 
MTZ_Inst_Build_PRODUCT_VERSION 
, 
MTZ_Inst_Build.PRODUCT_PUBLISHER 
MTZ_Inst_Build_PRODUCT_PUBLISHER 
, 
MTZ_Inst_Build.PRODUCT_WEB_SITE 
MTZ_Inst_Build_PRODUCT_WEB_SITE 
, 
 MTZ_Inst_Build.MainFileRef  
MTZ_Inst_Build_MainFileRef_ID, 
 MTZ.Func.MTZ_Inst_Sec_Files_BRIEF_F(MTZ_Inst_Build.MainFileRef) 
MTZ_Inst_Build_MainFileRef 
, 
MTZ_Inst_Build.ShortCutDir 
MTZ_Inst_Build_ShortCutDir 
, MTZ_Inst_Build.InstanceID InstanceID 
, MTZ_Inst_Build.MTZ_Inst_BuildID ID 
, 'MTZ_Inst_Build' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZ_Inst_Build
 join INSTANCE on MTZ_Inst_Build.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOMTZ_Inst_Build_Sec as 
select   MTZ_Inst_Build_SecID,MTZ_Inst_BuildID
, 
 MTZ_Inst_Build_Sec.IsRewriteSectionDesc  
MTZ_Inst_Build_Sec_IsRewriteSectionDesc_VAL, 
 decode(MTZ_Inst_Build_Sec.IsRewriteSectionDesc 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Build_Sec_IsRewriteSectionDesc 
, 
 MTZ_Inst_Build_Sec.TheSection  
MTZ_Inst_Build_Sec_TheSection_ID, 
 MTZ.Func.MTZ_Inst_Section_BRIEF_F(MTZ_Inst_Build_Sec.TheSection) 
MTZ_Inst_Build_Sec_TheSection 
, 
MTZ_Inst_Build_Sec.SEQ 
MTZ_Inst_Build_Sec_SEQ 
, 
MTZ_Inst_Build_Sec.TheDescription 
MTZ_Inst_Build_Sec_TheDescription 
, MTZ_Inst_Build.InstanceID InstanceID 
, MTZ_Inst_Build_Sec.MTZ_Inst_Build_SecID ID 
, 'MTZ_Inst_Build_Sec' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZ_Inst_Build_Sec
 join MTZ_Inst_Build on MTZ_Inst_Build.MTZ_Inst_BuildID=MTZ_Inst_Build_Sec.ParentStructRowID 
 join INSTANCE on MTZ_Inst_Build.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOMTZ_Inst_Section as 
select   MTZ_Inst_SectionID
, 
MTZ_Inst_Section.TheName 
MTZ_Inst_Section_TheName 
, 
 MTZ_Inst_Section.IsCustomSection  
MTZ_Inst_Section_IsCustomSection_VAL, 
 decode(MTZ_Inst_Section.IsCustomSection 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Section_IsCustomSection 
, 
 MTZ_Inst_Section.CustomSectionUnInstall  
MTZ_Inst_Section_CustomSectionUnInstall_ID, 
 MTZ.Func.MTZ_Inst_Common_BRIEF_F(MTZ_Inst_Section.CustomSectionUnInstall) 
MTZ_Inst_Section_CustomSectionUnInstall 
, 
 MTZ_Inst_Section.IsVisible  
MTZ_Inst_Section_IsVisible_VAL, 
 decode(MTZ_Inst_Section.IsVisible 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Section_IsVisible 
, 
MTZ_Inst_Section.TheDescription 
MTZ_Inst_Section_TheDescription 
, 
 MTZ_Inst_Section.CustomSectionInstall  
MTZ_Inst_Section_CustomSectionInstall_ID, 
 MTZ.Func.MTZ_Inst_Common_BRIEF_F(MTZ_Inst_Section.CustomSectionInstall) 
MTZ_Inst_Section_CustomSectionInstall 
, 
 MTZ_Inst_Section.IsNotDeletable  
MTZ_Inst_Section_IsNotDeletable_VAL, 
 decode(MTZ_Inst_Section.IsNotDeletable 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Section_IsNotDeletable 
, 
 MTZ_Inst_Section.TheTargetPlatform  
MTZ_Inst_Section_TheTargetPlatform_VAL, 
 decode(MTZ_Inst_Section.TheTargetPlatform 
, 2 ,'JAVA'
, 3 ,'OTHER'
, 1 ,'DOTNET'
, 0 ,'VB6'
, '???') 
MTZ_Inst_Section_TheTargetPlatform 
, MTZ_Inst_Section.InstanceID InstanceID 
, MTZ_Inst_Section.MTZ_Inst_SectionID ID 
, 'MTZ_Inst_Section' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZ_Inst_Section
 join INSTANCE on MTZ_Inst_Section.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOMTZ_Inst_Sec_Files as 
select   MTZ_Inst_Sec_FilesID,MTZ_Inst_SectionID
, 
MTZ_Inst_Sec_Files.SEQ 
MTZ_Inst_Sec_Files_SEQ 
, 
MTZ_Inst_Sec_Files.ShortCutInfo 
MTZ_Inst_Sec_Files_ShortCutInfo 
, 
 MTZ_Inst_Sec_Files.IsCOM  
MTZ_Inst_Sec_Files_IsCOM_VAL, 
 decode(MTZ_Inst_Sec_Files.IsCOM 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Sec_Files_IsCOM 
, 
 MTZ_Inst_Sec_Files.IsShortcut  
MTZ_Inst_Sec_Files_IsShortcut_VAL, 
 decode(MTZ_Inst_Sec_Files.IsShortcut 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Sec_Files_IsShortcut 
, 
MTZ_Inst_Sec_Files.DefaultInterface 
MTZ_Inst_Sec_Files_DefaultInterface 
, 
MTZ_Inst_Sec_Files.ShortcutName 
MTZ_Inst_Sec_Files_ShortcutName 
, 
MTZ_Inst_Sec_Files.DeinstallComandParam 
MTZ_Inst_Sec_Files_DeinstallComandParam 
, 
 MTZ_Inst_Sec_Files.HaveToRun  
MTZ_Inst_Sec_Files_HaveToRun_VAL, 
 decode(MTZ_Inst_Sec_Files.HaveToRun 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Sec_Files_HaveToRun 
, 
 MTZ_Inst_Sec_Files.CustomScriptUnInstall  
MTZ_Inst_Sec_Files_CustomScriptUnInstall_ID, 
 MTZ.Func.MTZ_Inst_Common_BRIEF_F(MTZ_Inst_Sec_Files.CustomScriptUnInstall) 
MTZ_Inst_Sec_Files_CustomScriptUnInstall 
, 
MTZ_Inst_Sec_Files.CommanLineParams 
MTZ_Inst_Sec_Files_CommanLineParams 
, 
MTZ_Inst_Sec_Files.TheSource 
MTZ_Inst_Sec_Files_TheSource 
, 
 MTZ_Inst_Sec_Files.SysstemObject  
MTZ_Inst_Sec_Files_SysstemObject_ID, 
 MTZ.Func.OBJECTTYPE_BRIEF_F(MTZ_Inst_Sec_Files.SysstemObject) 
MTZ_Inst_Sec_Files_SysstemObject 
, 
 MTZ_Inst_Sec_Files.IsCustomScript  
MTZ_Inst_Sec_Files_IsCustomScript_VAL, 
 decode(MTZ_Inst_Sec_Files.IsCustomScript 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Sec_Files_IsCustomScript 
, 
MTZ_Inst_Sec_Files.SubDir 
MTZ_Inst_Sec_Files_SubDir 
, 
 MTZ_Inst_Sec_Files.TheApplication  
MTZ_Inst_Sec_Files_TheApplication_ID, 
 MTZ.Func.MTZAPP_BRIEF_F(MTZ_Inst_Sec_Files.TheApplication) 
MTZ_Inst_Sec_Files_TheApplication 
, 
 MTZ_Inst_Sec_Files.HaveToRunDeinst  
MTZ_Inst_Sec_Files_HaveToRunDeinst_VAL, 
 decode(MTZ_Inst_Sec_Files.HaveToRunDeinst 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Sec_Files_HaveToRunDeinst 
, 
 MTZ_Inst_Sec_Files.CustomScriptInstall  
MTZ_Inst_Sec_Files_CustomScriptInstall_ID, 
 MTZ.Func.MTZ_Inst_Common_BRIEF_F(MTZ_Inst_Sec_Files.CustomScriptInstall) 
MTZ_Inst_Sec_Files_CustomScriptInstall 
, MTZ_Inst_Section.InstanceID InstanceID 
, MTZ_Inst_Sec_Files.MTZ_Inst_Sec_FilesID ID 
, 'MTZ_Inst_Sec_Files' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZ_Inst_Sec_Files
 join MTZ_Inst_Section on MTZ_Inst_Section.MTZ_Inst_SectionID=MTZ_Inst_Sec_Files.ParentStructRowID 
 join INSTANCE on MTZ_Inst_Section.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOMTZ_Inst_Common as 
select   MTZ_Inst_CommonID
, 
MTZ_Inst_Common.TheName 
MTZ_Inst_Common_TheName 
, 
MTZ_Inst_Common.TheInstallScript 
MTZ_Inst_Common_TheInstallScript 
, 
 MTZ_Inst_Common.IsDeinstallUSE  
MTZ_Inst_Common_IsDeinstallUSE_VAL, 
 decode(MTZ_Inst_Common.IsDeinstallUSE 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Common_IsDeinstallUSE 
, 
MTZ_Inst_Common.SEQ 
MTZ_Inst_Common_SEQ 
, MTZ_Inst_Common.InstanceID InstanceID 
, MTZ_Inst_Common.MTZ_Inst_CommonID ID 
, 'MTZ_Inst_Common' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZ_Inst_Common
 join INSTANCE on MTZ_Inst_Common.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_viewMTZ_Install_MTZ_Inst_Common as 
select   MTZ_Inst_CommonID
, 
 MTZ_Inst_Common.IsDeinstallUSE  
MTZ_Inst_Common_IsDeinstallUSE_VAL, 
 decode(MTZ_Inst_Common.IsDeinstallUSE 
, 1 ,'Да'
, 0 ,'Нет'
, '???') 
MTZ_Inst_Common_IsDeinstallUSE 
, 
MTZ_Inst_Common.TheName 
MTZ_Inst_Common_TheName 
, MTZ_Inst_Common.InstanceID InstanceID 
, MTZ_Inst_Common.MTZ_Inst_CommonID ID 
, 'MTZ_Inst_Common' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from MTZ_Inst_Common
 join INSTANCE on MTZ_Inst_Common.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTTZ_DEF as 
select   ITTTZ_DEFID
, 
ITTTZ_DEF.Code 
ITTTZ_DEF_Code 
, 
ITTTZ_DEF.TheNumber 
ITTTZ_DEF_TheNumber 
, 
ITTTZ_DEF.DocDate 
ITTTZ_DEF_DocDate 
, 
ITTTZ_DEF.SupplierCode 
ITTTZ_DEF_SupplierCode 
, 
ITTTZ_DEF.Direction 
ITTTZ_DEF_Direction 
, 
ITTTZ_DEF.TheClient 
ITTTZ_DEF_TheClient 
, ITTTZ_DEF.InstanceID InstanceID 
, ITTTZ_DEF.ITTTZ_DEFID ID 
, 'ITTTZ_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTTZ_DEF
 join INSTANCE on ITTTZ_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTTZ_LINES as 
select   ITTTZ_LINESID
, 
ITTTZ_LINES.FileLink 
ITTTZ_LINES_FileLink 
, 
ITTTZ_LINES.TheArticul 
ITTTZ_LINES_TheArticul 
, 
ITTTZ_LINES.EDIZM 
ITTTZ_LINES_EDIZM 
, 
ITTTZ_LINES.TheNumber 
ITTTZ_LINES_TheNumber 
, 
ITTTZ_LINES.sequence 
ITTTZ_LINES_sequence 
, 
ITTTZ_LINES.Partia 
ITTTZ_LINES_Partia 
, 
ITTTZ_LINES.SupplierCode 
ITTTZ_LINES_SupplierCode 
, 
ITTTZ_LINES.Direction 
ITTTZ_LINES_Direction 
, 
ITTTZ_LINES.Quantity 
ITTTZ_LINES_Quantity 
, 
ITTTZ_LINES.SSCC 
ITTTZ_LINES_SSCC 
, ITTTZ_LINES.InstanceID InstanceID 
, ITTTZ_LINES.ITTTZ_LINESID ID 
, 'ITTTZ_LINES' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTTZ_LINES
 join INSTANCE on ITTTZ_LINES.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITT2OPT_DEF as 
select   ITT2OPT_DEFID
, 
ITT2OPT_DEF.DateToOptimize 
ITT2OPT_DEF_DateToOptimize 
, 
 ITT2OPT_DEF.TheRule  
ITT2OPT_DEF_TheRule_ID, 
 MTZ.Func.ITTD_RULE_BRIEF_F(ITT2OPT_DEF.TheRule) 
ITT2OPT_DEF_TheRule 
, 
 ITT2OPT_DEF.OptType  
ITT2OPT_DEF_OptType_ID, 
 MTZ.Func.ITTD_OPTTYPE_BRIEF_F(ITT2OPT_DEF.OptType) 
ITT2OPT_DEF_OptType 
, 
ITT2OPT_DEF.OPtDate 
ITT2OPT_DEF_OPtDate 
, ITT2OPT_DEF.InstanceID InstanceID 
, ITT2OPT_DEF.ITT2OPT_DEFID ID 
, 'ITT2OPT_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITT2OPT_DEF
 join INSTANCE on ITT2OPT_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_viewITTOUT_ITTOUT_SRV as 
select   ITTOUT_SRVID
, 
ITTOUT_DEF.ProcessDate 
ITTOUT_DEF_ProcessDate 
, 
ITTOUT_DEF.TTNDate 
ITTOUT_DEF_TTNDate 
, 
ITTOUT_DEF.TranspNumber 
ITTOUT_DEF_TranspNumber 
, 
 ITTOUT_DEF.ShipOrder  
ITTOUT_DEF_ShipOrder_ID, 
ITTOUT_DEF.ShipOrder 
ITTOUT_DEF_ShipOrder 
, 
 ITTOUT_DEF.TheClient  
ITTOUT_DEF_TheClient_ID, 
ITTOUT_DEF.TheClient 
ITTOUT_DEF_TheClient 
, 
ITTOUT_DEF.StampStatus 
ITTOUT_DEF_StampStatus 
, 
ITTOUT_DEF.TTN 
ITTOUT_DEF_TTN 
, 
ITTOUT_DEF.Supplier 
ITTOUT_DEF_Supplier 
, 
ITTOUT_DEF.StampNumber 
ITTOUT_DEF_StampNumber 
, 
ITTOUT_DEF.temp_in_track 
ITTOUT_DEF_temp_in_track 
, 
 ITTOUT_SRV.SRV  
ITTOUT_SRV_SRV_ID, 
 MTZ.Func.ITTD_SRV_BRIEF_F(ITTOUT_SRV.SRV) 
ITTOUT_SRV_SRV 
, 
ITTOUT_DEF.Container 
ITTOUT_DEF_Container 
, 
ITTOUT_DEF.Track_time_in 
ITTOUT_DEF_Track_time_in 
, 
ITTOUT_SRV.Quantity 
ITTOUT_SRV_Quantity 
, 
ITTOUT_DEF.track_time_out 
ITTOUT_DEF_track_time_out 
, ITTOUT_SRV.InstanceID InstanceID 
, ITTOUT_SRV.ITTOUT_SRVID ID 
, 'ITTOUT_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_SRV
 join INSTANCE on ITTOUT_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join ITTOUT_DEF ON ITTOUT_DEF.InstanceID=ITTOUT_SRV.InstanceID 
/
create or replace view V_AUTOITTOUT_SRV as 
select   ITTOUT_SRVID
, 
ITTOUT_SRV.Quantity 
ITTOUT_SRV_Quantity 
, 
 ITTOUT_SRV.SRV  
ITTOUT_SRV_SRV_ID, 
 MTZ.Func.ITTD_SRV_BRIEF_F(ITTOUT_SRV.SRV) 
ITTOUT_SRV_SRV 
, ITTOUT_SRV.InstanceID InstanceID 
, ITTOUT_SRV.ITTOUT_SRVID ID 
, 'ITTOUT_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_SRV
 join INSTANCE on ITTOUT_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOUT_SRV as 
select   ITTOUT_SRVID
, 
ITTOUT_SRV.Quantity 
ITTOUT_SRV_Quantity 
, 
 ITTOUT_SRV.SRV  
ITTOUT_SRV_SRV_ID, 
 MTZ.Func.ITTD_SRV_BRIEF_F(ITTOUT_SRV.SRV) 
ITTOUT_SRV_SRV 
, ITTOUT_SRV.InstanceID InstanceID 
, ITTOUT_SRV.ITTOUT_SRVID ID 
, 'ITTOUT_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_SRV
 join INSTANCE on ITTOUT_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOUT_DEF as 
select   ITTOUT_DEFID
, 
ITTOUT_DEF.temp_in_track 
ITTOUT_DEF_temp_in_track 
, 
 ITTOUT_DEF.ThePartyRule  
ITTOUT_DEF_ThePartyRule_ID, 
 MTZ.Func.ITTD_RULE_BRIEF_F(ITTOUT_DEF.ThePartyRule) 
ITTOUT_DEF_ThePartyRule 
, 
ITTOUT_DEF.Track_time_in 
ITTOUT_DEF_Track_time_in 
, 
 ITTOUT_DEF.ShipOrder  
ITTOUT_DEF_ShipOrder_ID, 
ITTOUT_DEF.ShipOrder 
ITTOUT_DEF_ShipOrder 
, 
ITTOUT_DEF.TTN 
ITTOUT_DEF_TTN 
, 
 ITTOUT_DEF.TheClient  
ITTOUT_DEF_TheClient_ID, 
ITTOUT_DEF.TheClient 
ITTOUT_DEF_TheClient 
, 
ITTOUT_DEF.track_time_out 
ITTOUT_DEF_track_time_out 
, 
ITTOUT_DEF.Container 
ITTOUT_DEF_Container 
, 
ITTOUT_DEF.ProcessDate 
ITTOUT_DEF_ProcessDate 
, 
ITTOUT_DEF.StampStatus 
ITTOUT_DEF_StampStatus 
, 
ITTOUT_DEF.TTNDate 
ITTOUT_DEF_TTNDate 
, 
ITTOUT_DEF.TranspNumber 
ITTOUT_DEF_TranspNumber 
, 
ITTOUT_DEF.Supplier 
ITTOUT_DEF_Supplier 
, 
ITTOUT_DEF.StampNumber 
ITTOUT_DEF_StampNumber 
, ITTOUT_DEF.InstanceID InstanceID 
, ITTOUT_DEF.ITTOUT_DEFID ID 
, 'ITTOUT_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_DEF
 join INSTANCE on ITTOUT_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOUT_DEF as 
select   ITTOUT_DEFID
, 
ITTOUT_DEF.TTN 
ITTOUT_DEF_TTN 
, 
ITTOUT_DEF.StampNumber 
ITTOUT_DEF_StampNumber 
, 
 ITTOUT_DEF.TheClient  
ITTOUT_DEF_TheClient_ID, 
ITTOUT_DEF.TheClient 
ITTOUT_DEF_TheClient 
, 
ITTOUT_DEF.Track_time_in 
ITTOUT_DEF_Track_time_in 
, 
ITTOUT_DEF.StampStatus 
ITTOUT_DEF_StampStatus 
, 
ITTOUT_DEF.Container 
ITTOUT_DEF_Container 
, 
 ITTOUT_DEF.ThePartyRule  
ITTOUT_DEF_ThePartyRule_ID, 
 MTZ.Func.ITTD_RULE_BRIEF_F(ITTOUT_DEF.ThePartyRule) 
ITTOUT_DEF_ThePartyRule 
, 
ITTOUT_DEF.temp_in_track 
ITTOUT_DEF_temp_in_track 
, 
ITTOUT_DEF.TranspNumber 
ITTOUT_DEF_TranspNumber 
, 
ITTOUT_DEF.Supplier 
ITTOUT_DEF_Supplier 
, 
ITTOUT_DEF.track_time_out 
ITTOUT_DEF_track_time_out 
, 
ITTOUT_DEF.ProcessDate 
ITTOUT_DEF_ProcessDate 
, 
ITTOUT_DEF.TTNDate 
ITTOUT_DEF_TTNDate 
, 
 ITTOUT_DEF.ShipOrder  
ITTOUT_DEF_ShipOrder_ID, 
ITTOUT_DEF.ShipOrder 
ITTOUT_DEF_ShipOrder 
, ITTOUT_DEF.InstanceID InstanceID 
, ITTOUT_DEF.ITTOUT_DEFID ID 
, 'ITTOUT_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_DEF
 join INSTANCE on ITTOUT_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOUT_EPL as 
select   ITTOUT_EPLID
, 
ITTOUT_EPL.Palet_ID 
ITTOUT_EPL_Palet_ID 
, 
ITTOUT_EPL.PalWeight 
ITTOUT_EPL_PalWeight 
, 
 ITTOUT_EPL.TheNumber  
ITTOUT_EPL_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTOUT_EPL.TheNumber) 
ITTOUT_EPL_TheNumber 
, ITTOUT_EPL.InstanceID InstanceID 
, ITTOUT_EPL.ITTOUT_EPLID ID 
, 'ITTOUT_EPL' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_EPL
 join INSTANCE on ITTOUT_EPL.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_viewITTOUT_ITTOUT_EPL as 
select   ITTOUT_EPLID
, 
ITTOUT_EPL.Palet_ID 
ITTOUT_EPL_Palet_ID 
, 
 ITTOUT_DEF.ShipOrder  
ITTOUT_DEF_ShipOrder_ID, 
ITTOUT_DEF.ShipOrder 
ITTOUT_DEF_ShipOrder 
, 
 ITTOUT_DEF.TheClient  
ITTOUT_DEF_TheClient_ID, 
ITTOUT_DEF.TheClient 
ITTOUT_DEF_TheClient 
, 
 ITTOUT_EPL.TheNumber  
ITTOUT_EPL_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTOUT_EPL.TheNumber) 
ITTOUT_EPL_TheNumber 
, 
ITTOUT_EPL.PalWeight 
ITTOUT_EPL_PalWeight 
, ITTOUT_EPL.InstanceID InstanceID 
, ITTOUT_EPL.ITTOUT_EPLID ID 
, 'ITTOUT_EPL' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_EPL
 join INSTANCE on ITTOUT_EPL.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join ITTOUT_DEF ON ITTOUT_DEF.InstanceID=ITTOUT_EPL.InstanceID 
/
create or replace view V_AUTOITTOUT_EPL as 
select   ITTOUT_EPLID
, 
ITTOUT_EPL.PalWeight 
ITTOUT_EPL_PalWeight 
, 
ITTOUT_EPL.Palet_ID 
ITTOUT_EPL_Palet_ID 
, 
 ITTOUT_EPL.TheNumber  
ITTOUT_EPL_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTOUT_EPL.TheNumber) 
ITTOUT_EPL_TheNumber 
, ITTOUT_EPL.InstanceID InstanceID 
, ITTOUT_EPL.ITTOUT_EPLID ID 
, 'ITTOUT_EPL' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_EPL
 join INSTANCE on ITTOUT_EPL.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOUT_LINES as 
select   ITTOUT_LINESID
, 
ITTOUT_LINES.Made_date 
ITTOUT_LINES_Made_date 
, 
ITTOUT_LINES.Quanity 
ITTOUT_LINES_Quanity 
, 
 ITTOUT_LINES.made_country  
ITTOUT_LINES_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTOUT_LINES.made_country) 
ITTOUT_LINES_made_country 
, 
 ITTOUT_LINES.good_ID  
ITTOUT_LINES_good_ID_ID, 
ITTOUT_LINES.good_ID 
ITTOUT_LINES_good_ID 
, 
ITTOUT_LINES.articul 
ITTOUT_LINES_articul 
, 
ITTOUT_LINES.edizm 
ITTOUT_LINES_edizm 
, 
 ITTOUT_LINES.QRY_NUM  
ITTOUT_LINES_QRY_NUM_ID, 
ITTOUT_LINES.QRY_NUM 
ITTOUT_LINES_QRY_NUM 
, 
 ITTOUT_LINES.PartRef  
ITTOUT_LINES_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTOUT_LINES.PartRef) 
ITTOUT_LINES_PartRef 
, 
 ITTOUT_LINES.Navalom  
ITTOUT_LINES_Navalom_VAL, 
 decode(ITTOUT_LINES.Navalom 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_LINES_Navalom 
, 
ITTOUT_LINES.sequence 
ITTOUT_LINES_sequence 
, 
ITTOUT_LINES.PackageWeight 
ITTOUT_LINES_PackageWeight 
, 
ITTOUT_LINES.VidOtruba 
ITTOUT_LINES_VidOtruba 
, 
 ITTOUT_LINES.LineAtQuery  
ITTOUT_LINES_LineAtQuery_ID, 
ITTOUT_LINES.LineAtQuery 
ITTOUT_LINES_LineAtQuery 
, 
 ITTOUT_LINES.KILL_NUMBER  
ITTOUT_LINES_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTOUT_LINES.KILL_NUMBER) 
ITTOUT_LINES_KILL_NUMBER 
, 
ITTOUT_LINES.NumInBufZone 
ITTOUT_LINES_NumInBufZone 
, 
 ITTOUT_LINES.Factory  
ITTOUT_LINES_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTOUT_LINES.Factory) 
ITTOUT_LINES_Factory 
, 
ITTOUT_LINES.FullPackageWeight 
ITTOUT_LINES_FullPackageWeight 
, 
ITTOUT_LINES.CurValue 
ITTOUT_LINES_CurValue 
, 
ITTOUT_LINES.exp_date 
ITTOUT_LINES_exp_date 
, ITTOUT_LINES.InstanceID InstanceID 
, ITTOUT_LINES.ITTOUT_LINESID ID 
, 'ITTOUT_LINES' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_LINES
 join INSTANCE on ITTOUT_LINES.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOUT_LINES as 
select   ITTOUT_LINESID
, 
 ITTOUT_LINES.Factory  
ITTOUT_LINES_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTOUT_LINES.Factory) 
ITTOUT_LINES_Factory 
, 
ITTOUT_LINES.NumInBufZone 
ITTOUT_LINES_NumInBufZone 
, 
ITTOUT_LINES.vetsved 
ITTOUT_LINES_vetsved 
, 
 ITTOUT_LINES.good_ID  
ITTOUT_LINES_good_ID_ID, 
ITTOUT_LINES.good_ID 
ITTOUT_LINES_good_ID 
, 
ITTOUT_LINES.PackageWeight 
ITTOUT_LINES_PackageWeight 
, 
 ITTOUT_LINES.LineAtQuery  
ITTOUT_LINES_LineAtQuery_ID, 
ITTOUT_LINES.LineAtQuery 
ITTOUT_LINES_LineAtQuery 
, 
ITTOUT_LINES.VidOtruba 
ITTOUT_LINES_VidOtruba 
, 
ITTOUT_LINES.sequence 
ITTOUT_LINES_sequence 
, 
ITTOUT_LINES.exp_date 
ITTOUT_LINES_exp_date 
, 
ITTOUT_LINES.CurValue 
ITTOUT_LINES_CurValue 
, 
 ITTOUT_LINES.made_country  
ITTOUT_LINES_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTOUT_LINES.made_country) 
ITTOUT_LINES_made_country 
, 
 ITTOUT_LINES.Navalom  
ITTOUT_LINES_Navalom_VAL, 
 decode(ITTOUT_LINES.Navalom 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_LINES_Navalom 
, 
ITTOUT_LINES.edizm 
ITTOUT_LINES_edizm 
, 
ITTOUT_LINES.made_date_to 
ITTOUT_LINES_made_date_to 
, 
ITTOUT_LINES.Quanity 
ITTOUT_LINES_Quanity 
, 
 ITTOUT_LINES.QRY_NUM  
ITTOUT_LINES_QRY_NUM_ID, 
ITTOUT_LINES.QRY_NUM 
ITTOUT_LINES_QRY_NUM 
, 
ITTOUT_LINES.articul 
ITTOUT_LINES_articul 
, 
ITTOUT_LINES.FullPackageWeight 
ITTOUT_LINES_FullPackageWeight 
, 
ITTOUT_LINES.Made_date 
ITTOUT_LINES_Made_date 
, 
 ITTOUT_LINES.KILL_NUMBER  
ITTOUT_LINES_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTOUT_LINES.KILL_NUMBER) 
ITTOUT_LINES_KILL_NUMBER 
, 
 ITTOUT_LINES.PartRef  
ITTOUT_LINES_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTOUT_LINES.PartRef) 
ITTOUT_LINES_PartRef 
, ITTOUT_LINES.InstanceID InstanceID 
, ITTOUT_LINES.ITTOUT_LINESID ID 
, 'ITTOUT_LINES' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_LINES
 join INSTANCE on ITTOUT_LINES.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_viewITTOUT_ITTOUT_PALET as 
select   ITTOUT_PALETID,ITTOUT_LINESID
, 
ITTOUT_DEF.Track_time_in 
ITTOUT_DEF_Track_time_in 
, 
ITTOUT_LINES.exp_date 
ITTOUT_LINES_exp_date 
, 
ITTOUT_DEF.ProcessDate 
ITTOUT_DEF_ProcessDate 
, 
ITTOUT_DEF.TTNDate 
ITTOUT_DEF_TTNDate 
, 
ITTOUT_LINES.sequence 
ITTOUT_LINES_sequence 
, 
ITTOUT_PALET.GoodWithPaletWeight 
ITTOUT_PALET_GoodWithPaletWeight 
, 
ITTOUT_DEF.temp_in_track 
ITTOUT_DEF_temp_in_track 
, 
ITTOUT_PALET.ReorgCaliberQuantity 
ITTOUT_PALET_ReorgCaliberQuantity 
, 
 ITTOUT_PALET.Factory  
ITTOUT_PALET_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTOUT_PALET.Factory) 
ITTOUT_PALET_Factory 
, 
 ITTOUT_PALET.KILL_NUMBER  
ITTOUT_PALET_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTOUT_PALET.KILL_NUMBER) 
ITTOUT_PALET_KILL_NUMBER 
, 
ITTOUT_DEF.TranspNumber 
ITTOUT_DEF_TranspNumber 
, 
 ITTOUT_PALET.TheNumber  
ITTOUT_PALET_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTOUT_PALET.TheNumber) 
ITTOUT_PALET_TheNumber 
, 
 ITTOUT_LINES.PartRef  
ITTOUT_LINES_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTOUT_LINES.PartRef) 
ITTOUT_LINES_PartRef 
, 
ITTOUT_DEF.StampStatus 
ITTOUT_DEF_StampStatus 
, 
ITTOUT_DEF.StampNumber 
ITTOUT_DEF_StampNumber 
, 
 ITTOUT_DEF.ShipOrder  
ITTOUT_DEF_ShipOrder_ID, 
ITTOUT_DEF.ShipOrder 
ITTOUT_DEF_ShipOrder 
, 
ITTOUT_LINES.NumInBufZone 
ITTOUT_LINES_NumInBufZone 
, 
 ITTOUT_LINES.Factory  
ITTOUT_LINES_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTOUT_LINES.Factory) 
ITTOUT_LINES_Factory 
, 
ITTOUT_DEF.Supplier 
ITTOUT_DEF_Supplier 
, 
ITTOUT_PALET.BufferCell 
ITTOUT_PALET_BufferCell 
, 
 ITTOUT_PALET.PartRef  
ITTOUT_PALET_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTOUT_PALET.PartRef) 
ITTOUT_PALET_PartRef 
, 
ITTOUT_DEF.Container 
ITTOUT_DEF_Container 
, 
 ITTOUT_PALET.IsEmpty  
ITTOUT_PALET_IsEmpty_VAL, 
 decode(ITTOUT_PALET.IsEmpty 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_PALET_IsEmpty 
, 
ITTOUT_PALET.CaliberQuantity 
ITTOUT_PALET_CaliberQuantity 
, 
ITTOUT_DEF.track_time_out 
ITTOUT_DEF_track_time_out 
, 
 ITTOUT_PALET.made_country  
ITTOUT_PALET_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTOUT_PALET.made_country) 
ITTOUT_PALET_made_country 
, 
ITTOUT_LINES.Quanity 
ITTOUT_LINES_Quanity 
, 
 ITTOUT_LINES.made_country  
ITTOUT_LINES_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTOUT_LINES.made_country) 
ITTOUT_LINES_made_country 
, 
ITTOUT_LINES.VidOtruba 
ITTOUT_LINES_VidOtruba 
, 
ITTOUT_LINES.Made_date 
ITTOUT_LINES_Made_date 
, 
ITTOUT_PALET.ReorgWeight 
ITTOUT_PALET_ReorgWeight 
, 
ITTOUT_PALET.ReorgPackageFullWeight 
ITTOUT_PALET_ReorgPackageFullWeight 
, 
ITTOUT_PALET.Made_date 
ITTOUT_PALET_Made_date 
, 
ITTOUT_LINES.PackageWeight 
ITTOUT_LINES_PackageWeight 
, 
ITTOUT_LINES.CurValue 
ITTOUT_LINES_CurValue 
, 
ITTOUT_PALET.FullPackageWeight 
ITTOUT_PALET_FullPackageWeight 
, 
 ITTOUT_LINES.LineAtQuery  
ITTOUT_LINES_LineAtQuery_ID, 
ITTOUT_LINES.LineAtQuery 
ITTOUT_LINES_LineAtQuery 
, 
ITTOUT_PALET.StoreCell 
ITTOUT_PALET_StoreCell 
, 
 ITTOUT_LINES.KILL_NUMBER  
ITTOUT_LINES_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTOUT_LINES.KILL_NUMBER) 
ITTOUT_LINES_KILL_NUMBER 
, 
ITTOUT_PALET.VidOtruba 
ITTOUT_PALET_VidOtruba 
, 
ITTOUT_LINES.articul 
ITTOUT_LINES_articul 
, 
 ITTOUT_LINES.Navalom  
ITTOUT_LINES_Navalom_VAL, 
 decode(ITTOUT_LINES.Navalom 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_LINES_Navalom 
, 
ITTOUT_PALET.PackageWeight 
ITTOUT_PALET_PackageWeight 
, 
 ITTOUT_LINES.good_ID  
ITTOUT_LINES_good_ID_ID, 
ITTOUT_LINES.good_ID 
ITTOUT_LINES_good_ID 
, 
 ITTOUT_PALET.IsBrak  
ITTOUT_PALET_IsBrak_VAL, 
 decode(ITTOUT_PALET.IsBrak 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_PALET_IsBrak 
, 
ITTOUT_DEF.TTN 
ITTOUT_DEF_TTN 
, 
ITTOUT_PALET.exp_date 
ITTOUT_PALET_exp_date 
, 
ITTOUT_LINES.edizm 
ITTOUT_LINES_edizm 
, 
 ITTOUT_PALET.IsCalibrated  
ITTOUT_PALET_IsCalibrated_VAL, 
 decode(ITTOUT_PALET.IsCalibrated 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_PALET_IsCalibrated 
, 
 ITTOUT_LINES.QRY_NUM  
ITTOUT_LINES_QRY_NUM_ID, 
ITTOUT_LINES.QRY_NUM 
ITTOUT_LINES_QRY_NUM 
, 
 ITTOUT_DEF.TheClient  
ITTOUT_DEF_TheClient_ID, 
ITTOUT_DEF.TheClient 
ITTOUT_DEF_TheClient 
, 
ITTOUT_LINES.FullPackageWeight 
ITTOUT_LINES_FullPackageWeight 
, 
ITTOUT_PALET.sequence 
ITTOUT_PALET_sequence 
, ITTOUT_LINES.InstanceID InstanceID 
, ITTOUT_PALET.ITTOUT_PALETID ID 
, 'ITTOUT_PALET' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_PALET
 join ITTOUT_LINES on ITTOUT_LINES.ITTOUT_LINESID=ITTOUT_PALET.ParentStructRowID 
 join INSTANCE on ITTOUT_LINES.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join ITTOUT_DEF ON ITTOUT_DEF.InstanceID=ITTOUT_LINES.InstanceID 
/
create or replace view V_AUTOITTOUT_PALET as 
select   ITTOUT_PALETID,ITTOUT_LINESID
, 
ITTOUT_PALET.ReorgCaliberQuantity 
ITTOUT_PALET_ReorgCaliberQuantity 
, 
ITTOUT_PALET.PackageWeight 
ITTOUT_PALET_PackageWeight 
, 
ITTOUT_PALET.ReorgWeight 
ITTOUT_PALET_ReorgWeight 
, 
ITTOUT_PALET.exp_date 
ITTOUT_PALET_exp_date 
, 
 ITTOUT_PALET.IsBrak  
ITTOUT_PALET_IsBrak_VAL, 
 decode(ITTOUT_PALET.IsBrak 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_PALET_IsBrak 
, 
ITTOUT_PALET.BufferCell 
ITTOUT_PALET_BufferCell 
, 
 ITTOUT_PALET.made_country  
ITTOUT_PALET_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTOUT_PALET.made_country) 
ITTOUT_PALET_made_country 
, 
ITTOUT_PALET.ReorgPackageFullWeight 
ITTOUT_PALET_ReorgPackageFullWeight 
, 
ITTOUT_PALET.VidOtruba 
ITTOUT_PALET_VidOtruba 
, 
ITTOUT_PALET.StoreCell 
ITTOUT_PALET_StoreCell 
, 
ITTOUT_PALET.sequence 
ITTOUT_PALET_sequence 
, 
 ITTOUT_PALET.IsCalibrated  
ITTOUT_PALET_IsCalibrated_VAL, 
 decode(ITTOUT_PALET.IsCalibrated 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_PALET_IsCalibrated 
, 
 ITTOUT_PALET.KILL_NUMBER  
ITTOUT_PALET_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTOUT_PALET.KILL_NUMBER) 
ITTOUT_PALET_KILL_NUMBER 
, 
ITTOUT_PALET.CaliberQuantity 
ITTOUT_PALET_CaliberQuantity 
, 
 ITTOUT_PALET.TheNumber  
ITTOUT_PALET_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTOUT_PALET.TheNumber) 
ITTOUT_PALET_TheNumber 
, 
ITTOUT_PALET.GoodWithPaletWeight 
ITTOUT_PALET_GoodWithPaletWeight 
, 
 ITTOUT_PALET.PartRef  
ITTOUT_PALET_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTOUT_PALET.PartRef) 
ITTOUT_PALET_PartRef 
, 
ITTOUT_PALET.Made_date 
ITTOUT_PALET_Made_date 
, 
 ITTOUT_PALET.IsEmpty  
ITTOUT_PALET_IsEmpty_VAL, 
 decode(ITTOUT_PALET.IsEmpty 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_PALET_IsEmpty 
, 
 ITTOUT_PALET.Factory  
ITTOUT_PALET_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTOUT_PALET.Factory) 
ITTOUT_PALET_Factory 
, 
ITTOUT_PALET.FullPackageWeight 
ITTOUT_PALET_FullPackageWeight 
, ITTOUT_LINES.InstanceID InstanceID 
, ITTOUT_PALET.ITTOUT_PALETID ID 
, 'ITTOUT_PALET' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_PALET
 join ITTOUT_LINES on ITTOUT_LINES.ITTOUT_LINESID=ITTOUT_PALET.ParentStructRowID 
 join INSTANCE on ITTOUT_LINES.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTOUT_PALET as 
select   ITTOUT_PALETID,ITTOUT_LINESID
, 
ITTOUT_PALET.FullPackageWeight 
ITTOUT_PALET_FullPackageWeight 
, 
ITTOUT_PALET.PackageWeight 
ITTOUT_PALET_PackageWeight 
, 
ITTOUT_PALET.BufferCell 
ITTOUT_PALET_BufferCell 
, 
ITTOUT_PALET.BarCode1 
ITTOUT_PALET_BarCode1 
, 
ITTOUT_PALET.BarCode2 
ITTOUT_PALET_BarCode2 
, 
ITTOUT_PALET.Made_date 
ITTOUT_PALET_Made_date 
, 
ITTOUT_PALET.CaliberQuantity 
ITTOUT_PALET_CaliberQuantity 
, 
ITTOUT_PALET.SSCC 
ITTOUT_PALET_SSCC 
, 
 ITTOUT_PALET.IsBrak  
ITTOUT_PALET_IsBrak_VAL, 
 decode(ITTOUT_PALET.IsBrak 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_PALET_IsBrak 
, 
 ITTOUT_PALET.KILL_NUMBER  
ITTOUT_PALET_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTOUT_PALET.KILL_NUMBER) 
ITTOUT_PALET_KILL_NUMBER 
, 
ITTOUT_PALET.StoreCell 
ITTOUT_PALET_StoreCell 
, 
ITTOUT_PALET.exp_date 
ITTOUT_PALET_exp_date 
, 
ITTOUT_PALET.made_date_to 
ITTOUT_PALET_made_date_to 
, 
 ITTOUT_PALET.TheNumber  
ITTOUT_PALET_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTOUT_PALET.TheNumber) 
ITTOUT_PALET_TheNumber 
, 
 ITTOUT_PALET.PartRef  
ITTOUT_PALET_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTOUT_PALET.PartRef) 
ITTOUT_PALET_PartRef 
, 
ITTOUT_PALET.GoodWithPaletWeight 
ITTOUT_PALET_GoodWithPaletWeight 
, 
 ITTOUT_PALET.IsEmpty  
ITTOUT_PALET_IsEmpty_VAL, 
 decode(ITTOUT_PALET.IsEmpty 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_PALET_IsEmpty 
, 
ITTOUT_PALET.ReorgPackageFullWeight 
ITTOUT_PALET_ReorgPackageFullWeight 
, 
ITTOUT_PALET.sequence 
ITTOUT_PALET_sequence 
, 
 ITTOUT_PALET.IsCalibrated  
ITTOUT_PALET_IsCalibrated_VAL, 
 decode(ITTOUT_PALET.IsCalibrated 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTOUT_PALET_IsCalibrated 
, 
 ITTOUT_PALET.Factory  
ITTOUT_PALET_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTOUT_PALET.Factory) 
ITTOUT_PALET_Factory 
, 
ITTOUT_PALET.ReorgCaliberQuantity 
ITTOUT_PALET_ReorgCaliberQuantity 
, 
ITTOUT_PALET.ReorgWeight 
ITTOUT_PALET_ReorgWeight 
, 
 ITTOUT_PALET.made_country  
ITTOUT_PALET_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTOUT_PALET.made_country) 
ITTOUT_PALET_made_country 
, 
ITTOUT_PALET.vetsved 
ITTOUT_PALET_vetsved 
, 
ITTOUT_PALET.VidOtruba 
ITTOUT_PALET_VidOtruba 
, ITTOUT_LINES.InstanceID InstanceID 
, ITTOUT_PALET.ITTOUT_PALETID ID 
, 'ITTOUT_PALET' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTOUT_PALET
 join ITTOUT_LINES on ITTOUT_LINES.ITTOUT_LINESID=ITTOUT_PALET.ParentStructRowID 
 join INSTANCE on ITTOUT_LINES.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTIN_QLINE as 
select   ITTIN_QLINEID
, 
ITTIN_QLINE.FullPackageWeight 
ITTIN_QLINE_FullPackageWeight 
, 
ITTIN_QLINE.KorobNetto 
ITTIN_QLINE_KorobNetto 
, 
 ITTIN_QLINE.KILL_NUMBER  
ITTIN_QLINE_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTIN_QLINE.KILL_NUMBER) 
ITTIN_QLINE_KILL_NUMBER 
, 
 ITTIN_QLINE.made_country  
ITTIN_QLINE_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTIN_QLINE.made_country) 
ITTIN_QLINE_made_country 
, 
 ITTIN_QLINE.Navalom  
ITTIN_QLINE_Navalom_VAL, 
 decode(ITTIN_QLINE.Navalom 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTIN_QLINE_Navalom 
, 
 ITTIN_QLINE.QRY_NUM  
ITTIN_QLINE_QRY_NUM_ID, 
ITTIN_QLINE.QRY_NUM 
ITTIN_QLINE_QRY_NUM 
, 
ITTIN_QLINE.exp_date 
ITTIN_QLINE_exp_date 
, 
ITTIN_QLINE.KorobBrutto 
ITTIN_QLINE_KorobBrutto 
, 
ITTIN_QLINE.sequence 
ITTIN_QLINE_sequence 
, 
ITTIN_QLINE.PackageWeight 
ITTIN_QLINE_PackageWeight 
, 
 ITTIN_QLINE.good_id  
ITTIN_QLINE_good_id_ID, 
ITTIN_QLINE.good_id 
ITTIN_QLINE_good_id 
, 
ITTIN_QLINE.VidOtruba 
ITTIN_QLINE_VidOtruba 
, 
 ITTIN_QLINE.IsCalibrated  
ITTIN_QLINE_IsCalibrated_VAL, 
 decode(ITTIN_QLINE.IsCalibrated 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTIN_QLINE_IsCalibrated 
, 
ITTIN_QLINE.articul 
ITTIN_QLINE_articul 
, 
ITTIN_QLINE.Made_date 
ITTIN_QLINE_Made_date 
, 
 ITTIN_QLINE.Factory  
ITTIN_QLINE_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTIN_QLINE.Factory) 
ITTIN_QLINE_Factory 
, 
 ITTIN_QLINE.LineAtQuery  
ITTIN_QLINE_LineAtQuery_ID, 
ITTIN_QLINE.LineAtQuery 
ITTIN_QLINE_LineAtQuery 
, 
ITTIN_QLINE.CaliberWeight 
ITTIN_QLINE_CaliberWeight 
, 
ITTIN_QLINE.edizm 
ITTIN_QLINE_edizm 
, 
ITTIN_QLINE.CurValue 
ITTIN_QLINE_CurValue 
, 
 ITTIN_QLINE.PartRef  
ITTIN_QLINE_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTIN_QLINE.PartRef) 
ITTIN_QLINE_PartRef 
, ITTIN_QLINE.InstanceID InstanceID 
, ITTIN_QLINE.ITTIN_QLINEID ID 
, 'ITTIN_QLINE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_QLINE
 join INSTANCE on ITTIN_QLINE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTIN_QLINE as 
select   ITTIN_QLINEID
, 
ITTIN_QLINE.sequence 
ITTIN_QLINE_sequence 
, 
ITTIN_QLINE.VidOtruba 
ITTIN_QLINE_VidOtruba 
, 
 ITTIN_QLINE.IsCalibrated  
ITTIN_QLINE_IsCalibrated_VAL, 
 decode(ITTIN_QLINE.IsCalibrated 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTIN_QLINE_IsCalibrated 
, 
ITTIN_QLINE.articul 
ITTIN_QLINE_articul 
, 
 ITTIN_QLINE.KILL_NUMBER  
ITTIN_QLINE_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTIN_QLINE.KILL_NUMBER) 
ITTIN_QLINE_KILL_NUMBER 
, 
ITTIN_QLINE.CaliberWeight 
ITTIN_QLINE_CaliberWeight 
, 
ITTIN_QLINE.PackageWeight 
ITTIN_QLINE_PackageWeight 
, 
 ITTIN_QLINE.LineAtQuery  
ITTIN_QLINE_LineAtQuery_ID, 
ITTIN_QLINE.LineAtQuery 
ITTIN_QLINE_LineAtQuery 
, 
 ITTIN_QLINE.made_country  
ITTIN_QLINE_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTIN_QLINE.made_country) 
ITTIN_QLINE_made_country 
, 
 ITTIN_QLINE.good_id  
ITTIN_QLINE_good_id_ID, 
ITTIN_QLINE.good_id 
ITTIN_QLINE_good_id 
, 
ITTIN_QLINE.KorobBrutto 
ITTIN_QLINE_KorobBrutto 
, 
 ITTIN_QLINE.Navalom  
ITTIN_QLINE_Navalom_VAL, 
 decode(ITTIN_QLINE.Navalom 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTIN_QLINE_Navalom 
, 
ITTIN_QLINE.made_date_to 
ITTIN_QLINE_made_date_to 
, 
ITTIN_QLINE.Made_date 
ITTIN_QLINE_Made_date 
, 
ITTIN_QLINE.KorobNetto 
ITTIN_QLINE_KorobNetto 
, 
 ITTIN_QLINE.Factory  
ITTIN_QLINE_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTIN_QLINE.Factory) 
ITTIN_QLINE_Factory 
, 
 ITTIN_QLINE.PartRef  
ITTIN_QLINE_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTIN_QLINE.PartRef) 
ITTIN_QLINE_PartRef 
, 
ITTIN_QLINE.vetsved 
ITTIN_QLINE_vetsved 
, 
ITTIN_QLINE.CurValue 
ITTIN_QLINE_CurValue 
, 
ITTIN_QLINE.edizm 
ITTIN_QLINE_edizm 
, 
 ITTIN_QLINE.QRY_NUM  
ITTIN_QLINE_QRY_NUM_ID, 
ITTIN_QLINE.QRY_NUM 
ITTIN_QLINE_QRY_NUM 
, 
ITTIN_QLINE.exp_date 
ITTIN_QLINE_exp_date 
, 
ITTIN_QLINE.FullPackageWeight 
ITTIN_QLINE_FullPackageWeight 
, ITTIN_QLINE.InstanceID InstanceID 
, ITTIN_QLINE.ITTIN_QLINEID ID 
, 'ITTIN_QLINE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_QLINE
 join INSTANCE on ITTIN_QLINE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTIN_PALET as 
select   ITTIN_PALETID,ITTIN_QLINEID
, 
ITTIN_PALET.VidOtruba 
ITTIN_PALET_VidOtruba 
, 
ITTIN_PALET.PalWeight 
ITTIN_PALET_PalWeight 
, 
ITTIN_PALET.Stock_ID 
ITTIN_PALET_Stock_ID 
, 
ITTIN_PALET.CaliberQuantity 
ITTIN_PALET_CaliberQuantity 
, 
ITTIN_PALET.PackageWeight 
ITTIN_PALET_PackageWeight 
, 
 ITTIN_PALET.made_country  
ITTIN_PALET_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTIN_PALET.made_country) 
ITTIN_PALET_made_country 
, 
ITTIN_PALET.palet_id 
ITTIN_PALET_palet_id 
, 
ITTIN_PALET.FullPackageWeight 
ITTIN_PALET_FullPackageWeight 
, 
 ITTIN_PALET.Factory  
ITTIN_PALET_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTIN_PALET.Factory) 
ITTIN_PALET_Factory 
, 
 ITTIN_PALET.TheNumber  
ITTIN_PALET_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTIN_PALET.TheNumber) 
ITTIN_PALET_TheNumber 
, 
ITTIN_PALET.KorobNetto 
ITTIN_PALET_KorobNetto 
, 
ITTIN_PALET.Made_date 
ITTIN_PALET_Made_date 
, 
 ITTIN_PALET.PartRef  
ITTIN_PALET_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTIN_PALET.PartRef) 
ITTIN_PALET_PartRef 
, 
ITTIN_PALET.sequence 
ITTIN_PALET_sequence 
, 
 ITTIN_PALET.KILL_NUMBER  
ITTIN_PALET_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTIN_PALET.KILL_NUMBER) 
ITTIN_PALET_KILL_NUMBER 
, 
ITTIN_PALET.GoodWithPaletWeight 
ITTIN_PALET_GoodWithPaletWeight 
, 
ITTIN_PALET.BufferZonePlace 
ITTIN_PALET_BufferZonePlace 
, 
ITTIN_PALET.KorobBrutto 
ITTIN_PALET_KorobBrutto 
, 
ITTIN_PALET.exp_date 
ITTIN_PALET_exp_date 
, 
 ITTIN_PALET.IsBrak  
ITTIN_PALET_IsBrak_VAL, 
 decode(ITTIN_PALET.IsBrak 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTIN_PALET_IsBrak 
, ITTIN_QLINE.InstanceID InstanceID 
, ITTIN_PALET.ITTIN_PALETID ID 
, 'ITTIN_PALET' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_PALET
 join ITTIN_QLINE on ITTIN_QLINE.ITTIN_QLINEID=ITTIN_PALET.ParentStructRowID 
 join INSTANCE on ITTIN_QLINE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTIN_PALET as 
select   ITTIN_PALETID,ITTIN_QLINEID
, 
ITTIN_PALET.vetsved 
ITTIN_PALET_vetsved 
, 
ITTIN_PALET.BarCode2 
ITTIN_PALET_BarCode2 
, 
 ITTIN_PALET.TheNumber  
ITTIN_PALET_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTIN_PALET.TheNumber) 
ITTIN_PALET_TheNumber 
, 
ITTIN_PALET.sequence 
ITTIN_PALET_sequence 
, 
ITTIN_PALET.Made_date 
ITTIN_PALET_Made_date 
, 
ITTIN_PALET.KorobBrutto 
ITTIN_PALET_KorobBrutto 
, 
ITTIN_PALET.Stock_ID 
ITTIN_PALET_Stock_ID 
, 
ITTIN_PALET.BufferZonePlace 
ITTIN_PALET_BufferZonePlace 
, 
 ITTIN_PALET.KILL_NUMBER  
ITTIN_PALET_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTIN_PALET.KILL_NUMBER) 
ITTIN_PALET_KILL_NUMBER 
, 
ITTIN_PALET.exp_date 
ITTIN_PALET_exp_date 
, 
 ITTIN_PALET.Factory  
ITTIN_PALET_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTIN_PALET.Factory) 
ITTIN_PALET_Factory 
, 
ITTIN_PALET.KorobNetto 
ITTIN_PALET_KorobNetto 
, 
 ITTIN_PALET.made_country  
ITTIN_PALET_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTIN_PALET.made_country) 
ITTIN_PALET_made_country 
, 
 ITTIN_PALET.IsBrak  
ITTIN_PALET_IsBrak_VAL, 
 decode(ITTIN_PALET.IsBrak 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTIN_PALET_IsBrak 
, 
ITTIN_PALET.VidOtruba 
ITTIN_PALET_VidOtruba 
, 
 ITTIN_PALET.IsCalibrated  
ITTIN_PALET_IsCalibrated_VAL, 
 decode(ITTIN_PALET.IsCalibrated 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTIN_PALET_IsCalibrated 
, 
ITTIN_PALET.palet_id 
ITTIN_PALET_palet_id 
, 
ITTIN_PALET.FullPackageWeight 
ITTIN_PALET_FullPackageWeight 
, 
ITTIN_PALET.PalWeight 
ITTIN_PALET_PalWeight 
, 
ITTIN_PALET.BarCode1 
ITTIN_PALET_BarCode1 
, 
ITTIN_PALET.SSCC 
ITTIN_PALET_SSCC 
, 
ITTIN_PALET.CaliberQuantity 
ITTIN_PALET_CaliberQuantity 
, 
ITTIN_PALET.made_date_to 
ITTIN_PALET_made_date_to 
, 
 ITTIN_PALET.PartRef  
ITTIN_PALET_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTIN_PALET.PartRef) 
ITTIN_PALET_PartRef 
, 
ITTIN_PALET.PackageWeight 
ITTIN_PALET_PackageWeight 
, 
ITTIN_PALET.GoodWithPaletWeight 
ITTIN_PALET_GoodWithPaletWeight 
, ITTIN_QLINE.InstanceID InstanceID 
, ITTIN_PALET.ITTIN_PALETID ID 
, 'ITTIN_PALET' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_PALET
 join ITTIN_QLINE on ITTIN_QLINE.ITTIN_QLINEID=ITTIN_PALET.ParentStructRowID 
 join INSTANCE on ITTIN_QLINE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_viewITTIN_ITTIN_PALET as 
select   ITTIN_PALETID,ITTIN_QLINEID
, 
ITTIN_QLINE.exp_date 
ITTIN_QLINE_exp_date 
, 
 ITTIN_PALET.IsBrak  
ITTIN_PALET_IsBrak_VAL, 
 decode(ITTIN_PALET.IsBrak 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTIN_PALET_IsBrak 
, 
ITTIN_PALET.PalWeight 
ITTIN_PALET_PalWeight 
, 
ITTIN_PALET.GoodWithPaletWeight 
ITTIN_PALET_GoodWithPaletWeight 
, 
ITTIN_DEF.Supplier 
ITTIN_DEF_Supplier 
, 
ITTIN_QLINE.KorobNetto 
ITTIN_QLINE_KorobNetto 
, 
ITTIN_DEF.temp_in_track 
ITTIN_DEF_temp_in_track 
, 
 ITTIN_QLINE.Factory  
ITTIN_QLINE_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTIN_QLINE.Factory) 
ITTIN_QLINE_Factory 
, 
ITTIN_DEF.StampNumber 
ITTIN_DEF_StampNumber 
, 
 ITTIN_QLINE.good_id  
ITTIN_QLINE_good_id_ID, 
ITTIN_QLINE.good_id 
ITTIN_QLINE_good_id 
, 
ITTIN_PALET.BufferZonePlace 
ITTIN_PALET_BufferZonePlace 
, 
 ITTIN_PALET.made_country  
ITTIN_PALET_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTIN_PALET.made_country) 
ITTIN_PALET_made_country 
, 
ITTIN_DEF.TranspNumber 
ITTIN_DEF_TranspNumber 
, 
ITTIN_QLINE.FullPackageWeight 
ITTIN_QLINE_FullPackageWeight 
, 
ITTIN_PALET.CaliberQuantity 
ITTIN_PALET_CaliberQuantity 
, 
 ITTIN_QLINE.QRY_NUM  
ITTIN_QLINE_QRY_NUM_ID, 
ITTIN_QLINE.QRY_NUM 
ITTIN_QLINE_QRY_NUM 
, 
ITTIN_PALET.FullPackageWeight 
ITTIN_PALET_FullPackageWeight 
, 
ITTIN_DEF.TTN 
ITTIN_DEF_TTN 
, 
ITTIN_PALET.PackageWeight 
ITTIN_PALET_PackageWeight 
, 
 ITTIN_QLINE.LineAtQuery  
ITTIN_QLINE_LineAtQuery_ID, 
ITTIN_QLINE.LineAtQuery 
ITTIN_QLINE_LineAtQuery 
, 
ITTIN_PALET.palet_id 
ITTIN_PALET_palet_id 
, 
ITTIN_QLINE.articul 
ITTIN_QLINE_articul 
, 
ITTIN_PALET.Made_date 
ITTIN_PALET_Made_date 
, 
 ITTIN_QLINE.PartRef  
ITTIN_QLINE_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTIN_QLINE.PartRef) 
ITTIN_QLINE_PartRef 
, 
 ITTIN_QLINE.KILL_NUMBER  
ITTIN_QLINE_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTIN_QLINE.KILL_NUMBER) 
ITTIN_QLINE_KILL_NUMBER 
, 
 ITTIN_QLINE.Navalom  
ITTIN_QLINE_Navalom_VAL, 
 decode(ITTIN_QLINE.Navalom 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTIN_QLINE_Navalom 
, 
ITTIN_PALET.Stock_ID 
ITTIN_PALET_Stock_ID 
, 
ITTIN_PALET.KorobNetto 
ITTIN_PALET_KorobNetto 
, 
ITTIN_PALET.exp_date 
ITTIN_PALET_exp_date 
, 
ITTIN_QLINE.edizm 
ITTIN_QLINE_edizm 
, 
ITTIN_QLINE.CaliberWeight 
ITTIN_QLINE_CaliberWeight 
, 
 ITTIN_DEF.QryCode  
ITTIN_DEF_QryCode_ID, 
ITTIN_DEF.QryCode 
ITTIN_DEF_QryCode 
, 
ITTIN_DEF.ProcessDate 
ITTIN_DEF_ProcessDate 
, 
ITTIN_DEF.StampStatus 
ITTIN_DEF_StampStatus 
, 
 ITTIN_PALET.PartRef  
ITTIN_PALET_PartRef_ID, 
 MTZ.Func.ITTD_PART_BRIEF_F(ITTIN_PALET.PartRef) 
ITTIN_PALET_PartRef 
, 
ITTIN_QLINE.VidOtruba 
ITTIN_QLINE_VidOtruba 
, 
ITTIN_DEF.Container 
ITTIN_DEF_Container 
, 
ITTIN_DEF.Track_time_in 
ITTIN_DEF_Track_time_in 
, 
ITTIN_QLINE.CurValue 
ITTIN_QLINE_CurValue 
, 
ITTIN_QLINE.sequence 
ITTIN_QLINE_sequence 
, 
 ITTIN_QLINE.IsCalibrated  
ITTIN_QLINE_IsCalibrated_VAL, 
 decode(ITTIN_QLINE.IsCalibrated 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTIN_QLINE_IsCalibrated 
, 
ITTIN_QLINE.KorobBrutto 
ITTIN_QLINE_KorobBrutto 
, 
ITTIN_DEF.TTNDate 
ITTIN_DEF_TTNDate 
, 
ITTIN_DEF.track_time_out 
ITTIN_DEF_track_time_out 
, 
ITTIN_PALET.KorobBrutto 
ITTIN_PALET_KorobBrutto 
, 
 ITTIN_PALET.TheNumber  
ITTIN_PALET_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTIN_PALET.TheNumber) 
ITTIN_PALET_TheNumber 
, 
 ITTIN_DEF.TheClient  
ITTIN_DEF_TheClient_ID, 
ITTIN_DEF.TheClient 
ITTIN_DEF_TheClient 
, 
ITTIN_PALET.VidOtruba 
ITTIN_PALET_VidOtruba 
, 
 ITTIN_QLINE.made_country  
ITTIN_QLINE_made_country_ID, 
 MTZ.Func.ITTD_COUNTRY_BRIEF_F(ITTIN_QLINE.made_country) 
ITTIN_QLINE_made_country 
, 
 ITTIN_PALET.KILL_NUMBER  
ITTIN_PALET_KILL_NUMBER_ID, 
 MTZ.Func.ITTD_KILLPLACE_BRIEF_F(ITTIN_PALET.KILL_NUMBER) 
ITTIN_PALET_KILL_NUMBER 
, 
ITTIN_QLINE.PackageWeight 
ITTIN_QLINE_PackageWeight 
, 
ITTIN_QLINE.Made_date 
ITTIN_QLINE_Made_date 
, 
 ITTIN_PALET.Factory  
ITTIN_PALET_Factory_ID, 
 MTZ.Func.ITTD_FACTORY_BRIEF_F(ITTIN_PALET.Factory) 
ITTIN_PALET_Factory 
, 
ITTIN_PALET.sequence 
ITTIN_PALET_sequence 
, ITTIN_QLINE.InstanceID InstanceID 
, ITTIN_PALET.ITTIN_PALETID ID 
, 'ITTIN_PALET' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_PALET
 join ITTIN_QLINE on ITTIN_QLINE.ITTIN_QLINEID=ITTIN_PALET.ParentStructRowID 
 join INSTANCE on ITTIN_QLINE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join ITTIN_DEF ON ITTIN_DEF.InstanceID=ITTIN_QLINE.InstanceID 
/
create or replace view V_AUTOITTIN_SRV as 
select   ITTIN_SRVID
, 
ITTIN_SRV.Quantity 
ITTIN_SRV_Quantity 
, 
 ITTIN_SRV.SRV  
ITTIN_SRV_SRV_ID, 
 MTZ.Func.ITTD_SRV_BRIEF_F(ITTIN_SRV.SRV) 
ITTIN_SRV_SRV 
, ITTIN_SRV.InstanceID InstanceID 
, ITTIN_SRV.ITTIN_SRVID ID 
, 'ITTIN_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_SRV
 join INSTANCE on ITTIN_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_viewITTIN_ITTIN_SRV as 
select   ITTIN_SRVID
, 
ITTIN_DEF.TranspNumber 
ITTIN_DEF_TranspNumber 
, 
ITTIN_DEF.TTNDate 
ITTIN_DEF_TTNDate 
, 
 ITTIN_DEF.TheClient  
ITTIN_DEF_TheClient_ID, 
ITTIN_DEF.TheClient 
ITTIN_DEF_TheClient 
, 
 ITTIN_DEF.QryCode  
ITTIN_DEF_QryCode_ID, 
ITTIN_DEF.QryCode 
ITTIN_DEF_QryCode 
, 
ITTIN_DEF.Track_time_in 
ITTIN_DEF_Track_time_in 
, 
ITTIN_DEF.TTN 
ITTIN_DEF_TTN 
, 
ITTIN_DEF.ProcessDate 
ITTIN_DEF_ProcessDate 
, 
ITTIN_DEF.StampNumber 
ITTIN_DEF_StampNumber 
, 
 ITTIN_SRV.SRV  
ITTIN_SRV_SRV_ID, 
 MTZ.Func.ITTD_SRV_BRIEF_F(ITTIN_SRV.SRV) 
ITTIN_SRV_SRV 
, 
ITTIN_DEF.Container 
ITTIN_DEF_Container 
, 
ITTIN_DEF.temp_in_track 
ITTIN_DEF_temp_in_track 
, 
ITTIN_SRV.Quantity 
ITTIN_SRV_Quantity 
, 
ITTIN_DEF.StampStatus 
ITTIN_DEF_StampStatus 
, 
ITTIN_DEF.track_time_out 
ITTIN_DEF_track_time_out 
, 
ITTIN_DEF.Supplier 
ITTIN_DEF_Supplier 
, ITTIN_SRV.InstanceID InstanceID 
, ITTIN_SRV.ITTIN_SRVID ID 
, 'ITTIN_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_SRV
 join INSTANCE on ITTIN_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join ITTIN_DEF ON ITTIN_DEF.InstanceID=ITTIN_SRV.InstanceID 
/
create or replace view V_AUTOITTIN_SRV as 
select   ITTIN_SRVID
, 
 ITTIN_SRV.SRV  
ITTIN_SRV_SRV_ID, 
 MTZ.Func.ITTD_SRV_BRIEF_F(ITTIN_SRV.SRV) 
ITTIN_SRV_SRV 
, 
ITTIN_SRV.Quantity 
ITTIN_SRV_Quantity 
, ITTIN_SRV.InstanceID InstanceID 
, ITTIN_SRV.ITTIN_SRVID ID 
, 'ITTIN_SRV' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_SRV
 join INSTANCE on ITTIN_SRV.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTIN_DEF as 
select   ITTIN_DEFID
, 
 ITTIN_DEF.TheClient  
ITTIN_DEF_TheClient_ID, 
ITTIN_DEF.TheClient 
ITTIN_DEF_TheClient 
, 
 ITTIN_DEF.QryCode  
ITTIN_DEF_QryCode_ID, 
ITTIN_DEF.QryCode 
ITTIN_DEF_QryCode 
, 
 ITTIN_DEF.ThePartyRule  
ITTIN_DEF_ThePartyRule_ID, 
 MTZ.Func.ITTD_RULE_BRIEF_F(ITTIN_DEF.ThePartyRule) 
ITTIN_DEF_ThePartyRule 
, 
ITTIN_DEF.track_time_out 
ITTIN_DEF_track_time_out 
, 
ITTIN_DEF.Supplier 
ITTIN_DEF_Supplier 
, 
ITTIN_DEF.TTNDate 
ITTIN_DEF_TTNDate 
, 
ITTIN_DEF.temp_in_track 
ITTIN_DEF_temp_in_track 
, 
ITTIN_DEF.StampNumber 
ITTIN_DEF_StampNumber 
, 
ITTIN_DEF.StampStatus 
ITTIN_DEF_StampStatus 
, 
ITTIN_DEF.ProcessDate 
ITTIN_DEF_ProcessDate 
, 
ITTIN_DEF.Container 
ITTIN_DEF_Container 
, 
ITTIN_DEF.TranspNumber 
ITTIN_DEF_TranspNumber 
, 
ITTIN_DEF.TTN 
ITTIN_DEF_TTN 
, 
ITTIN_DEF.Track_time_in 
ITTIN_DEF_Track_time_in 
, ITTIN_DEF.InstanceID InstanceID 
, ITTIN_DEF.ITTIN_DEFID ID 
, 'ITTIN_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_DEF
 join INSTANCE on ITTIN_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTIN_DEF as 
select   ITTIN_DEFID
, 
ITTIN_DEF.TranspNumber 
ITTIN_DEF_TranspNumber 
, 
ITTIN_DEF.Container 
ITTIN_DEF_Container 
, 
ITTIN_DEF.Track_time_in 
ITTIN_DEF_Track_time_in 
, 
ITTIN_DEF.ProcessDate 
ITTIN_DEF_ProcessDate 
, 
ITTIN_DEF.track_time_out 
ITTIN_DEF_track_time_out 
, 
ITTIN_DEF.temp_in_track 
ITTIN_DEF_temp_in_track 
, 
ITTIN_DEF.TTNDate 
ITTIN_DEF_TTNDate 
, 
ITTIN_DEF.StampStatus 
ITTIN_DEF_StampStatus 
, 
 ITTIN_DEF.TheClient  
ITTIN_DEF_TheClient_ID, 
ITTIN_DEF.TheClient 
ITTIN_DEF_TheClient 
, 
 ITTIN_DEF.QryCode  
ITTIN_DEF_QryCode_ID, 
ITTIN_DEF.QryCode 
ITTIN_DEF_QryCode 
, 
ITTIN_DEF.TTN 
ITTIN_DEF_TTN 
, 
 ITTIN_DEF.ThePartyRule  
ITTIN_DEF_ThePartyRule_ID, 
 MTZ.Func.ITTD_RULE_BRIEF_F(ITTIN_DEF.ThePartyRule) 
ITTIN_DEF_ThePartyRule 
, 
ITTIN_DEF.Supplier 
ITTIN_DEF_Supplier 
, 
ITTIN_DEF.StampNumber 
ITTIN_DEF_StampNumber 
, ITTIN_DEF.InstanceID InstanceID 
, ITTIN_DEF.ITTIN_DEFID ID 
, 'ITTIN_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_DEF
 join INSTANCE on ITTIN_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_viewITTIN_ITTIN_EPL as 
select   ITTIN_EPLID
, 
ITTIN_EPL.PalWeight 
ITTIN_EPL_PalWeight 
, 
 ITTIN_DEF.QryCode  
ITTIN_DEF_QryCode_ID, 
ITTIN_DEF.QryCode 
ITTIN_DEF_QryCode 
, 
 ITTIN_DEF.TheClient  
ITTIN_DEF_TheClient_ID, 
ITTIN_DEF.TheClient 
ITTIN_DEF_TheClient 
, 
 ITTIN_EPL.TheNumber  
ITTIN_EPL_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTIN_EPL.TheNumber) 
ITTIN_EPL_TheNumber 
, ITTIN_EPL.InstanceID InstanceID 
, ITTIN_EPL.ITTIN_EPLID ID 
, 'ITTIN_EPL' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_EPL
 join INSTANCE on ITTIN_EPL.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid left join ITTIN_DEF ON ITTIN_DEF.InstanceID=ITTIN_EPL.InstanceID 
/
create or replace view V_AUTOITTIN_EPL as 
select   ITTIN_EPLID
, 
ITTIN_EPL.PalWeight 
ITTIN_EPL_PalWeight 
, 
 ITTIN_EPL.TheNumber  
ITTIN_EPL_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTIN_EPL.TheNumber) 
ITTIN_EPL_TheNumber 
, ITTIN_EPL.InstanceID InstanceID 
, ITTIN_EPL.ITTIN_EPLID ID 
, 'ITTIN_EPL' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_EPL
 join INSTANCE on ITTIN_EPL.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTIN_EPL as 
select   ITTIN_EPLID
, 
ITTIN_EPL.PalWeight 
ITTIN_EPL_PalWeight 
, 
 ITTIN_EPL.TheNumber  
ITTIN_EPL_TheNumber_ID, 
 MTZ.Func.ITTPL_DEF_BRIEF_F(ITTIN_EPL.TheNumber) 
ITTIN_EPL_TheNumber 
, ITTIN_EPL.InstanceID InstanceID 
, ITTIN_EPL.ITTIN_EPLID ID 
, 'ITTIN_EPL' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTIN_EPL
 join INSTANCE on ITTIN_EPL.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTSSCC_LINE as 
select   ITTSSCC_LINEID
, 
ITTSSCC_LINE.PalletCode 
ITTSSCC_LINE_PalletCode 
, 
ITTSSCC_LINE.Barcode1 
ITTSSCC_LINE_Barcode1 
, 
ITTSSCC_LINE.Barcode2 
ITTSSCC_LINE_Barcode2 
, 
ITTSSCC_LINE.Result 
ITTSSCC_LINE_Result 
, 
 ITTSSCC_LINE.Processed  
ITTSSCC_LINE_Processed_VAL, 
 decode(ITTSSCC_LINE.Processed 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
ITTSSCC_LINE_Processed 
, ITTSSCC_LINE.InstanceID InstanceID 
, ITTSSCC_LINE.ITTSSCC_LINEID ID 
, 'ITTSSCC_LINE' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTSSCC_LINE
 join INSTANCE on ITTSSCC_LINE.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOITTSSCC_DEF as 
select   ITTSSCC_DEFID
, 
ITTSSCC_DEF.TheDate 
ITTSSCC_DEF_TheDate 
, 
 ITTSSCC_DEF.TheUser  
ITTSSCC_DEF_TheUser_ID, 
 MTZ.Func.Users_BRIEF_F(ITTSSCC_DEF.TheUser) 
ITTSSCC_DEF_TheUser 
, 
ITTSSCC_DEF.TCode 
ITTSSCC_DEF_TCode 
, ITTSSCC_DEF.InstanceID InstanceID 
, ITTSSCC_DEF.ITTSSCC_DEFID ID 
, 'ITTSSCC_DEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ITTSSCC_DEF
 join INSTANCE on ITTSSCC_DEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
create or replace view V_AUTOWorkPlace as 
select   WorkPlaceID
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
, 
WorkPlace.TheComment 
WorkPlace_TheComment 
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
/
create or replace view V_AUTOEntryPoints as 
select   EntryPointsID
, 
EntryPoints.IconFile 
EntryPoints_IconFile 
, 
 EntryPoints.Journal  
EntryPoints_Journal_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(EntryPoints.Journal) 
EntryPoints_Journal 
, 
EntryPoints.TheComment 
EntryPoints_TheComment 
, 
 EntryPoints.Document  
EntryPoints_Document_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(EntryPoints.Document) 
EntryPoints_Document 
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
 EntryPoints.Report  
EntryPoints_Report_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(EntryPoints.Report) 
EntryPoints_Report 
, 
 EntryPoints.Method  
EntryPoints_Method_ID, 
 MTZ.Func.SHAREDMETHOD_BRIEF_F(EntryPoints.Method) 
EntryPoints_Method 
, 
EntryPoints.Caption 
EntryPoints_Caption 
, 
 EntryPoints.AsToolbarItem  
EntryPoints_AsToolbarItem_VAL, 
 decode(EntryPoints.AsToolbarItem 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
EntryPoints_AsToolbarItem 
, 
EntryPoints.Name 
EntryPoints_Name 
, 
 EntryPoints.ObjectType  
EntryPoints_ObjectType_ID, 
 MTZ.Func.OBJECTTYPE_BRIEF_F(EntryPoints.ObjectType) 
EntryPoints_ObjectType 
, 
 EntryPoints.TheExtention  
EntryPoints_TheExtention_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(EntryPoints.TheExtention) 
EntryPoints_TheExtention 
, 
 EntryPoints.TheFilter  
EntryPoints_TheFilter_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(EntryPoints.TheFilter) 
EntryPoints_TheFilter 
, 
 EntryPoints.ARM  
EntryPoints_ARM_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(EntryPoints.ARM) 
EntryPoints_ARM 
, 
EntryPoints.JournalFixedQuery 
EntryPoints_JournalFixedQuery 
, 
EntryPoints.sequence 
EntryPoints_sequence 
, EntryPoints.InstanceID InstanceID 
, EntryPoints.EntryPointsID ID 
, 'EntryPoints' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from EntryPoints
 join INSTANCE on EntryPoints.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOEPFilterLink as 
select   EPFilterLinkID,EntryPointsID
, 
EPFilterLink.TheExpression 
EPFilterLink_TheExpression 
, 
EPFilterLink.FilterField 
EPFilterLink_FilterField 
, 
EPFilterLink.RowSource 
EPFilterLink_RowSource 
, EntryPoints.InstanceID InstanceID 
, EPFilterLink.EPFilterLinkID ID 
, 'EPFilterLink' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from EPFilterLink
 join EntryPoints on EntryPoints.EntryPointsID=EPFilterLink.ParentStructRowID 
 join INSTANCE on EntryPoints.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOARMTypes as 
select   ARMTypesID
, 
 ARMTypes.TheDocumentType  
ARMTypes_TheDocumentType_ID, 
 MTZ.Func.OBJECTTYPE_BRIEF_F(ARMTypes.TheDocumentType) 
ARMTypes_TheDocumentType 
, ARMTypes.InstanceID InstanceID 
, ARMTypes.ARMTypesID ID 
, 'ARMTypes' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ARMTypes
 join INSTANCE on ARMTypes.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOARMJournal as 
select   ARMJournalID
, 
 ARMJournal.TheJournal  
ARMJournal_TheJournal_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(ARMJournal.TheJournal) 
ARMJournal_TheJournal 
, ARMJournal.InstanceID InstanceID 
, ARMJournal.ARMJournalID ID 
, 'ARMJournal' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ARMJournal
 join INSTANCE on ARMJournal.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOARMJRNLADD as 
select   ARMJRNLADDID,ARMJournalID
, 
ARMJRNLADD.Name 
ARMJRNLADD_Name 
, 
 ARMJRNLADD.TheExtention  
ARMJRNLADD_TheExtention_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(ARMJRNLADD.TheExtention) 
ARMJRNLADD_TheExtention 
, ARMJournal.InstanceID InstanceID 
, ARMJRNLADD.ARMJRNLADDID ID 
, 'ARMJRNLADD' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from ARMJRNLADD
 join ARMJournal on ARMJournal.ARMJournalID=ARMJRNLADD.ParentStructRowID 
 join INSTANCE on ARMJournal.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
create or replace view V_AUTOARMJRNLREP as 
select   ARMJRNLREPID,ARMJournalID
, 
 ARMJRNLREP.TheReport  
ARMJRNLREP_TheReport_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(ARMJRNLREP.TheReport) 
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
/
create or replace view V_AUTOARMJRNLRUN as 
select   ARMJRNLRUNID,ARMJournalID
, 
ARMJRNLRUN.Name 
ARMJRNLRUN_Name 
, 
 ARMJRNLRUN.TheExtention  
ARMJRNLRUN_TheExtention_ID, 
 MTZ.Func.INSTANCE_BRIEF_F(ARMJRNLRUN.TheExtention) 
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
/
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
/
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
/
create or replace view V_AUTOWEBS_PAGEDEF as 
select   WEBS_PAGEDEFID
, 
 WEBS_PAGEDEF.ObjectName  
WEBS_PAGEDEF_ObjectName_ID, 
 MTZ.Func.OBJECTTYPE_BRIEF_F(WEBS_PAGEDEF.ObjectName) 
WEBS_PAGEDEF_ObjectName 
, 
 WEBS_PAGEDEF.PageType  
WEBS_PAGEDEF_PageType_ID, 
 MTZ.Func.WEBSDIC_PAGETYPE_BRIEF_F(WEBS_PAGEDEF.PageType) 
WEBS_PAGEDEF_PageType 
, 
WEBS_PAGEDEF.PageContent 
WEBS_PAGEDEF_PageContent 
, 
WEBS_PAGEDEF.Title 
WEBS_PAGEDEF_Title 
, 
WEBS_PAGEDEF.SelectIDParameterName 
WEBS_PAGEDEF_SelectIDParameterName 
, 
WEBS_PAGEDEF.QueueNumber 
WEBS_PAGEDEF_QueueNumber 
, 
WEBS_PAGEDEF.Name 
WEBS_PAGEDEF_Name 
, 
WEBS_PAGEDEF.the_Mode 
WEBS_PAGEDEF_the_Mode 
, 
 WEBS_PAGEDEF.IsShowHisory  
WEBS_PAGEDEF_IsShowHisory_VAL, 
 decode(WEBS_PAGEDEF.IsShowHisory 
, -1 ,'Да'
, 0 ,'Нет'
, '???') 
WEBS_PAGEDEF_IsShowHisory 
, WEBS_PAGEDEF.InstanceID InstanceID 
, WEBS_PAGEDEF.WEBS_PAGEDEFID ID 
, 'WEBS_PAGEDEF' VIEWBASE 
, XXXMYSTATUSXXX.Name StatusName 
, XXXMYSTATUSXXX.objstatusid INTSANCEStatusID
  from WEBS_PAGEDEF
 join INSTANCE on WEBS_PAGEDEF.INSTANCEID=INSTANCE.INSTANCEID
 left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid 
/
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
/
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
/


