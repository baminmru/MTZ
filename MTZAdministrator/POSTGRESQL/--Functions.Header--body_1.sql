
/* --body*/

 

 create or replace package Func as

  function instance_BRIEF_F  (
 ainstanceid CHAR
)return varchar;


 function FilterFieldGroup_BRIEF_F  (
 aFilterFieldGroupid CHAR
) return varchar;


 function FileterField_BRIEF_F  (
 aFileterFieldid CHAR
) return varchar;


 function Filters_BRIEF_F  (
 aFiltersid CHAR
) return varchar;


 function PEK103_DEF_BRIEF_F  (
 aPEK103_DEFid CHAR
) return varchar;


 function PEK103_LINES_BRIEF_F  (
 aPEK103_LINESid CHAR
) return varchar;


 function WEBC_BLOCK_BRIEF_F  (
 aWEBC_BLOCKid CHAR
) return varchar;


 function WEBC_NEWS_BRIEF_F  (
 aWEBC_NEWSid CHAR
) return varchar;


 function WEBC_JOB_BRIEF_F  (
 aWEBC_JOBid CHAR
) return varchar;


 function WEBC_MESSAGES_BRIEF_F  (
 aWEBC_MESSAGESid CHAR
) return varchar;


 function WEBC_DOCS_BRIEF_F  (
 aWEBC_DOCSid CHAR
) return varchar;


 function WEBC_FILIALS_BRIEF_F  (
 aWEBC_FILIALSid CHAR
) return varchar;


 function WEBC_LINKS_BRIEF_F  (
 aWEBC_LINKSid CHAR
) return varchar;


 function VRRPT_COSTS_BRIEF_F  (
 aVRRPT_COSTSid CHAR
) return varchar;


 function VRRPT_MeetingPlan_BRIEF_F  (
 aVRRPT_MeetingPlanid CHAR
) return varchar;


 function VRRPT_Meeters_BRIEF_F  (
 aVRRPT_Meetersid CHAR
) return varchar;


 function VRRPT_MAIN_BRIEF_F  (
 aVRRPT_MAINid CHAR
) return varchar;


 function VRDGCommon_BRIEF_F  (
 aVRDGCommonid CHAR
) return varchar;


 function VRDGReport_BRIEF_F  (
 aVRDGReportid CHAR
) return varchar;


 function VRDGContractChanges_BRIEF_F  (
 aVRDGContractChangesid CHAR
) return varchar;


 function VRDGContractVersion_BRIEF_F  (
 aVRDGContractVersionid CHAR
) return varchar;


 function VRDGContractSpesial_BRIEF_F  (
 aVRDGContractSpesialid CHAR
) return varchar;


 function PEKSH_DATA_BRIEF_F  (
 aPEKSH_DATAid CHAR
) return varchar;


 function PEKSH_START_BRIEF_F  (
 aPEKSH_STARTid CHAR
) return varchar;


 function PEKSH_DEF_BRIEF_F  (
 aPEKSH_DEFid CHAR
) return varchar;


 function MTZ2JOB_DEF_BRIEF_F  (
 aMTZ2JOB_DEFid CHAR
) return varchar;


 function PEKPAY_DEF_BRIEF_F  (
 aPEKPAY_DEFid CHAR
) return varchar;


 function WEBSDIC_DEF_BRIEF_F  (
 aWEBSDIC_DEFid CHAR
) return varchar;


 function PWUUSERS_BRIEF_F  (
 aPWUUSERSid CHAR
) return varchar;


 function pekz_path_BRIEF_F  (
 apekz_pathid CHAR
) return varchar;


 function PEKZ_WLIST_BRIEF_F  (
 aPEKZ_WLISTid CHAR
) return varchar;


 function PEKZ_WLADDS_BRIEF_F  (
 aPEKZ_WLADDSid CHAR
) return varchar;


 function PEKZ_DOCS_BRIEF_F  (
 aPEKZ_DOCSid CHAR
) return varchar;


 function pekz_def_BRIEF_F  (
 apekz_defid CHAR
) return varchar;


 function PEKZ_ACLCT_BRIEF_F  (
 aPEKZ_ACLCTid CHAR
) return varchar;


 function PEKZ_ADLVR_BRIEF_F  (
 aPEKZ_ADLVRid CHAR
) return varchar;


 function pekz_dop_BRIEF_F  (
 apekz_dopid CHAR
) return varchar;


 function REPD_LOCKED_BRIEF_F  (
 aREPD_LOCKEDid CHAR
) return varchar;


 function REPD_RequestQuery_BRIEF_F  (
 aREPD_RequestQueryid CHAR
) return varchar;


 function REPD_ResQueryRcv_BRIEF_F  (
 aREPD_ResQueryRcvid CHAR
) return varchar;


 function REPD_PROV_BRIEF_F  (
 aREPD_PROVid CHAR
) return varchar;


 function REPD_SRV_BRIEF_F  (
 aREPD_SRVid CHAR
) return varchar;


 function REPD_SNDTO_BRIEF_F  (
 aREPD_SNDTOid CHAR
) return varchar;


 function REPD_CONST_BRIEF_F  (
 aREPD_CONSTid CHAR
) return varchar;


 function REPD_REPTYPE_BRIEF_F  (
 aREPD_REPTYPEid CHAR
) return varchar;


 function REPD_SendQ_BRIEF_F  (
 aREPD_SendQid CHAR
) return varchar;


 function REPD_RecvQ_BRIEF_F  (
 aREPD_RecvQid CHAR
) return varchar;


 function StateAction_BRIEF_F  (
 aStateActionid CHAR
) return varchar;


 function TheDiffPath_BRIEF_F  (
 aTheDiffPathid CHAR
) return varchar;


 function DopUslTo_BRIEF_F  (
 aDopUslToid CHAR
) return varchar;


 function DopUslFrom_BRIEF_F  (
 aDopUslFromid CHAR
) return varchar;


 function TheDefenitionDiffP_BRIEF_F  (
 aTheDefenitionDiffPid CHAR
) return varchar;


 function PEKACT_DEF_BRIEF_F  (
 aPEKACT_DEFid CHAR
) return varchar;


 function PEKACT_ITOG_BRIEF_F  (
 aPEKACT_ITOGid CHAR
) return varchar;


 function PEKACT_LINES_BRIEF_F  (
 aPEKACT_LINESid CHAR
) return varchar;


 function FIELDTYPE_BRIEF_F  (
 aFIELDTYPEid CHAR
) return varchar;


 function FIELDTYPEMAP_BRIEF_F  (
 aFIELDTYPEMAPid CHAR
) return varchar;


 function ENUMITEM_BRIEF_F  (
 aENUMITEMid CHAR
) return varchar;


 function SHAREDMETHOD_BRIEF_F  (
 aSHAREDMETHODid CHAR
) return varchar;


 function SCRIPT_BRIEF_F  (
 aSCRIPTid CHAR
) return varchar;


 function PARAMETERS_BRIEF_F  (
 aPARAMETERSid CHAR
) return varchar;


 function OBJECTTYPE_BRIEF_F  (
 aOBJECTTYPEid CHAR
) return varchar;


 function PART_BRIEF_F  (
 aPARTid CHAR
) return varchar;


 function PARTMENU_BRIEF_F  (
 aPARTMENUid CHAR
) return varchar;


 function PARTPARAMMAP_BRIEF_F  (
 aPARTPARAMMAPid CHAR
) return varchar;


 function FIELD_BRIEF_F  (
 aFIELDid CHAR
) return varchar;


 function FIELDVALIDATOR_BRIEF_F  (
 aFIELDVALIDATORid CHAR
) return varchar;


 function FIELDMENU_BRIEF_F  (
 aFIELDMENUid CHAR
) return varchar;


 function FIELDPARAMMAP_BRIEF_F  (
 aFIELDPARAMMAPid CHAR
) return varchar;


 function FldExtenders_BRIEF_F  (
 aFldExtendersid CHAR
) return varchar;


 function FIELDEXPRESSION_BRIEF_F  (
 aFIELDEXPRESSIONid CHAR
) return varchar;


 function DINAMICFILTERSCRIPT_BRIEF_F  (
 aDINAMICFILTERSCRIPTid CHAR
) return varchar;


 function FIELDSRCDEF_BRIEF_F  (
 aFIELDSRCDEFid CHAR
) return varchar;


 function PARTVIEW_BRIEF_F  (
 aPARTVIEWid CHAR
) return varchar;


 function ViewColumn_BRIEF_F  (
 aViewColumnid CHAR
) return varchar;


 function PARTVIEW_LNK_BRIEF_F  (
 aPARTVIEW_LNKid CHAR
) return varchar;


 function ExtenderInterface_BRIEF_F  (
 aExtenderInterfaceid CHAR
) return varchar;


 function VALIDATOR_BRIEF_F  (
 aVALIDATORid CHAR
) return varchar;


 function UNIQUECONSTRAINT_BRIEF_F  (
 aUNIQUECONSTRAINTid CHAR
) return varchar;


 function CONSTRAINTFIELD_BRIEF_F  (
 aCONSTRAINTFIELDid CHAR
) return varchar;


 function INSTANCEVALIDATOR_BRIEF_F  (
 aINSTANCEVALIDATORid CHAR
) return varchar;


 function OBJSTATUS_BRIEF_F  (
 aOBJSTATUSid CHAR
) return varchar;


 function NEXTSTATE_BRIEF_F  (
 aNEXTSTATEid CHAR
) return varchar;


 function OBJECTMODE_BRIEF_F  (
 aOBJECTMODEid CHAR
) return varchar;


 function STRUCTRESTRICTION_BRIEF_F  (
 aSTRUCTRESTRICTIONid CHAR
) return varchar;


 function FIELDRESTRICTION_BRIEF_F  (
 aFIELDRESTRICTIONid CHAR
) return varchar;


 function METHODRESTRICTION_BRIEF_F  (
 aMETHODRESTRICTIONid CHAR
) return varchar;


 function TYPEMENU_BRIEF_F  (
 aTYPEMENUid CHAR
) return varchar;


 function MTZAPP_BRIEF_F  (
 aMTZAPPid CHAR
) return varchar;


 function ParentPackage_BRIEF_F  (
 aParentPackageid CHAR
) return varchar;


 function GENPACKAGE_BRIEF_F  (
 aGENPACKAGEid CHAR
) return varchar;


 function GENERATOR_TARGET_BRIEF_F  (
 aGENERATOR_TARGETid CHAR
) return varchar;


 function GENMANUALCODE_BRIEF_F  (
 aGENMANUALCODEid CHAR
) return varchar;


 function GENCONTROLS_BRIEF_F  (
 aGENCONTROLSid CHAR
) return varchar;


 function GENREFERENCE_BRIEF_F  (
 aGENREFERENCEid CHAR
) return varchar;


 function LocalizeInfo_BRIEF_F  (
 aLocalizeInfoid CHAR
) return varchar;


 function PEKPQ_DEF_BRIEF_F  (
 aPEKPQ_DEFid CHAR
) return varchar;


 function ENTDIC_BANK_BRIEF_F  (
 aENTDIC_BANKid CHAR
) return varchar;


 function ENTDIC_DOST_BRIEF_F  (
 aENTDIC_DOSTid CHAR
) return varchar;


 function ENTDIC_TOWN_BRIEF_F  (
 aENTDIC_TOWNid CHAR
) return varchar;


 function ENTDIC_TransportType_BRIEF_F  (
 aENTDIC_TransportTypeid CHAR
) return varchar;


 function ENTDIC_OPF_BRIEF_F  (
 aENTDIC_OPFid CHAR
) return varchar;


 function ENTDIC_EDIZM_BRIEF_F  (
 aENTDIC_EDIZMid CHAR
) return varchar;


 function ENTDIC_CURRENCY_BRIEF_F  (
 aENTDIC_CURRENCYid CHAR
) return varchar;


 function ENTDIC_CURCOURCE_BRIEF_F  (
 aENTDIC_CURCOURCEid CHAR
) return varchar;


 function ENTDIC_COUNTRY_BRIEF_F  (
 aENTDIC_COUNTRYid CHAR
) return varchar;


 function ENTDIC_REGION_BRIEF_F  (
 aENTDIC_REGIONid CHAR
) return varchar;


 function ST_MAIN_BRIEF_F  (
 aST_MAINid CHAR
) return varchar;


 function ST_DEF_BRIEF_F  (
 aST_DEFid CHAR
) return varchar;


 function ST_PAGES_BRIEF_F  (
 aST_PAGESid CHAR
) return varchar;


 function STDJournlaExtInfo_BRIEF_F  (
 aSTDJournlaExtInfoid CHAR
) return varchar;


 function STDJournalExtParam_BRIEF_F  (
 aSTDJournalExtParamid CHAR
) return varchar;


 function STDJournalExtFlt_BRIEF_F  (
 aSTDJournalExtFltid CHAR
) return varchar;


 function STDJournalExtField_BRIEF_F  (
 aSTDJournalExtFieldid CHAR
) return varchar;


 function CAL_DAYS_BRIEF_F  (
 aCAL_DAYSid CHAR
) return varchar;


 function CAL_TIME_BRIEF_F  (
 aCAL_TIMEid CHAR
) return varchar;


 function CAL_HEAD_BRIEF_F  (
 aCAL_HEADid CHAR
) return varchar;


 function SrvMessageInfo_BRIEF_F  (
 aSrvMessageInfoid CHAR
) return varchar;


 function PEKNAL_DEF_BRIEF_F  (
 aPEKNAL_DEFid CHAR
) return varchar;


 function PEKNAL_PZ_BRIEF_F  (
 aPEKNAL_PZid CHAR
) return varchar;


 function PEKNAL_ROWS_BRIEF_F  (
 aPEKNAL_ROWSid CHAR
) return varchar;


 function FileDef_BRIEF_F  (
 aFileDefid CHAR
) return varchar;


 function FileVersion_BRIEF_F  (
 aFileVersionid CHAR
) return varchar;


 function Num_zones_BRIEF_F  (
 aNum_zonesid CHAR
) return varchar;


 function Num_Values_BRIEF_F  (
 aNum_Valuesid CHAR
) return varchar;


 function Num_head_BRIEF_F  (
 aNum_headid CHAR
) return varchar;


 function BaseSetting_BRIEF_F  (
 aBaseSettingid CHAR
) return varchar;


 function Reports_BRIEF_F  (
 aReportsid CHAR
) return varchar;


 function RPTStruct_BRIEF_F  (
 aRPTStructid CHAR
) return varchar;


 function RPTFields_BRIEF_F  (
 aRPTFieldsid CHAR
) return varchar;


 function RPTFormula_BRIEF_F  (
 aRPTFormulaid CHAR
) return varchar;


 function PEKRKO_DEF_BRIEF_F  (
 aPEKRKO_DEFid CHAR
) return varchar;


 function PEKRKO_ROWS_BRIEF_F  (
 aPEKRKO_ROWSid CHAR
) return varchar;


 function PEKTRF_REGALL_BRIEF_F  (
 aPEKTRF_REGALLid CHAR
) return varchar;


 function PEKTRF_DECR_BRIEF_F  (
 aPEKTRF_DECRid CHAR
) return varchar;


 function PEKTRF_ADDS_BRIEF_F  (
 aPEKTRF_ADDSid CHAR
) return varchar;


 function PEKTRF_DEF_BRIEF_F  (
 aPEKTRF_DEFid CHAR
) return varchar;


 function PEKTRF_AUTO_BRIEF_F  (
 aPEKTRF_AUTOid CHAR
) return varchar;


 function PEKTRF_SRV_BRIEF_F  (
 aPEKTRF_SRVid CHAR
) return varchar;


 function PEKTRF_TR_BRIEF_F  (
 aPEKTRF_TRid CHAR
) return varchar;


 function PEKTRF_REGRTR_BRIEF_F  (
 aPEKTRF_REGRTRid CHAR
) return varchar;


 function PEKCL_DEF_BRIEF_F  (
 aPEKCL_DEFid CHAR
) return varchar;


 function PEKCL_DAYLY_BRIEF_F  (
 aPEKCL_DAYLYid CHAR
) return varchar;


 function PEKL_TOLOAD_BRIEF_F  (
 aPEKL_TOLOADid CHAR
) return varchar;


 function MTZExt_def_BRIEF_F  (
 aMTZExt_defid CHAR
) return varchar;


 function MTZExtRel_BRIEF_F  (
 aMTZExtRelid CHAR
) return varchar;


 function InfoStoreDef_BRIEF_F  (
 aInfoStoreDefid CHAR
) return varchar;


 function Folder_BRIEF_F  (
 aFolderid CHAR
) return varchar;


 function Shortcut_BRIEF_F  (
 aShortcutid CHAR
) return varchar;


 function PEKP_DEF_BRIEF_F  (
 aPEKP_DEFid CHAR
) return varchar;


 function PEKP_PZ_BRIEF_F  (
 aPEKP_PZid CHAR
) return varchar;


 function SysLog_BRIEF_F  (
 aSysLogid CHAR
) return varchar;


 function the_Session_BRIEF_F  (
 athe_Sessionid CHAR
) return varchar;


 function LogReader_BRIEF_F  (
 aLogReaderid CHAR
) return varchar;


 function Verb_BRIEF_F  (
 aVerbid CHAR
) return varchar;


 function Users_BRIEF_F  (
 aUsersid CHAR
) return varchar;


 function Groups_BRIEF_F  (
 aGroupsid CHAR
) return varchar;


 function GroupUser_BRIEF_F  (
 aGroupUserid CHAR
) return varchar;


 function VRDContractStage_BRIEF_F  (
 aVRDContractStageid CHAR
) return varchar;


 function VRDRreportType_BRIEF_F  (
 aVRDRreportTypeid CHAR
) return varchar;


 function VRDPrjType_BRIEF_F  (
 aVRDPrjTypeid CHAR
) return varchar;


 function VRDStream_BRIEF_F  (
 aVRDStreamid CHAR
) return varchar;


 function VRDInterest_BRIEF_F  (
 aVRDInterestid CHAR
) return varchar;


 function VRDDocType_BRIEF_F  (
 aVRDDocTypeid CHAR
) return varchar;


 function VRDLoyalty_BRIEF_F  (
 aVRDLoyaltyid CHAR
) return varchar;


 function VRDMarket_BRIEF_F  (
 aVRDMarketid CHAR
) return varchar;


 function MTZSEC_RIGHT_BRIEF_F  (
 aMTZSEC_RIGHTid CHAR
) return varchar;


 function VRCAccounts_BRIEF_F  (
 aVRCAccountsid CHAR
) return varchar;


 function VRCTorg_BRIEF_F  (
 aVRCTorgid CHAR
) return varchar;


 function VRCAditional_BRIEF_F  (
 aVRCAditionalid CHAR
) return varchar;


 function VRCTarif_BRIEF_F  (
 aVRCTarifid CHAR
) return varchar;


 function VRCCommonInfo_BRIEF_F  (
 aVRCCommonInfoid CHAR
) return varchar;


 function ROLES_USER_BRIEF_F  (
 aROLES_USERid CHAR
) return varchar;


 function ROLES_MAP_BRIEF_F  (
 aROLES_MAPid CHAR
) return varchar;


 function ROLES_DOC_BRIEF_F  (
 aROLES_DOCid CHAR
) return varchar;


 function ROLES_DOC_STATE_BRIEF_F  (
 aROLES_DOC_STATEid CHAR
) return varchar;


 function ROLES_DEF_BRIEF_F  (
 aROLES_DEFid CHAR
) return varchar;


 function ROLES_REPORTS_BRIEF_F  (
 aROLES_REPORTSid CHAR
) return varchar;


 function ROLES_WP_BRIEF_F  (
 aROLES_WPid CHAR
) return varchar;


 function ROLES_ACT_BRIEF_F  (
 aROLES_ACTid CHAR
) return varchar;


 function RptSrvMsg_BRIEF_F  (
 aRptSrvMsgid CHAR
) return varchar;


 function RptQuery_BRIEF_F  (
 aRptQueryid CHAR
) return varchar;


 function RptQryParam_BRIEF_F  (
 aRptQryParamid CHAR
) return varchar;


 function PEKORD_DEF_BRIEF_F  (
 aPEKORD_DEFid CHAR
) return varchar;


 function PEKORD_DATA_BRIEF_F  (
 aPEKORD_DATAid CHAR
) return varchar;


 function WorkPlace_BRIEF_F  (
 aWorkPlaceid CHAR
) return varchar;


 function EntryPoints_BRIEF_F  (
 aEntryPointsid CHAR
) return varchar;


 function EPFilterLink_BRIEF_F  (
 aEPFilterLinkid CHAR
) return varchar;


 function ARMTypes_BRIEF_F  (
 aARMTypesid CHAR
) return varchar;


 function ARMJournal_BRIEF_F  (
 aARMJournalid CHAR
) return varchar;


 function ARMJRNLADD_BRIEF_F  (
 aARMJRNLADDid CHAR
) return varchar;


 function ARMJRNLREP_BRIEF_F  (
 aARMJRNLREPid CHAR
) return varchar;


 function ARMJRNLRUN_BRIEF_F  (
 aARMJRNLRUNid CHAR
) return varchar;


 function PEKD_NZONE_BRIEF_F  (
 aPEKD_NZONEid CHAR
) return varchar;


 function PEKD_USEDNUM_BRIEF_F  (
 aPEKD_USEDNUMid CHAR
) return varchar;


 function JournalColumn_BRIEF_F  (
 aJournalColumnid CHAR
) return varchar;


 function JColumnSource_BRIEF_F  (
 aJColumnSourceid CHAR
) return varchar;


 function Journal_BRIEF_F  (
 aJournalid CHAR
) return varchar;


 function JournalSrc_BRIEF_F  (
 aJournalSrcid CHAR
) return varchar;


 function pekmsg_path_BRIEF_F  (
 apekmsg_pathid CHAR
) return varchar;


 function WEBS_MAILLIST_BRIEF_F  (
 aWEBS_MAILLISTid CHAR
) return varchar;


 function WEBS_RECLAME_BRIEF_F  (
 aWEBS_RECLAMEid CHAR
) return varchar;


 function WEBS_PAGEDEF_BRIEF_F  (
 aWEBS_PAGEDEFid CHAR
) return varchar;


 function WEBS_PICS_BRIEF_F  (
 aWEBS_PICSid CHAR
) return varchar;


 function WEBS_PAGEMENU_BRIEF_F  (
 aWEBS_PAGEMENUid CHAR
) return varchar;


 function WEBS_PAGECONTENT_BRIEF_F  (
 aWEBS_PAGECONTENTid CHAR
) return varchar;


 function WEBS_PAGEPARS_BRIEF_F  (
 aWEBS_PAGEPARSid CHAR
) return varchar;


 function WEBS_PAGECOMP_BRIEF_F  (
 aWEBS_PAGECOMPid CHAR
) return varchar;


 function TablePart_BRIEF_F  (
 aTablePartid CHAR
) return varchar;


 function ReplaceValues_BRIEF_F  (
 aReplaceValuesid CHAR
) return varchar;


 function DenyEdit_BRIEF_F  (
 aDenyEditid CHAR
) return varchar;


 function DenyVisible_BRIEF_F  (
 aDenyVisibleid CHAR
) return varchar;


 function AllowEditFieldValues_BRIEF_F  (
 aAllowEditFieldValuesid CHAR
) return varchar;


 function ComboFields_BRIEF_F  (
 aComboFieldsid CHAR
) return varchar;


 function WEBS_ANKETA_BRIEF_F  (
 aWEBS_ANKETAid CHAR
) return varchar;


 function WEBS_QUESTIONS_BRIEF_F  (
 aWEBS_QUESTIONSid CHAR
) return varchar;


 function WEBS_ANSWERS_BRIEF_F  (
 aWEBS_ANSWERSid CHAR
) return varchar;


 function WEBS_DDOC_BRIEF_F  (
 aWEBS_DDOCid CHAR
) return varchar;


 function WEBS_NEWS_BRIEF_F  (
 aWEBS_NEWSid CHAR
) return varchar;


 function NEWS_PICS_BRIEF_F  (
 aNEWS_PICSid CHAR
) return varchar;


 function VRCPSeeAlso_BRIEF_F  (
 aVRCPSeeAlsoid CHAR
) return varchar;


 function VRCPSpecial_BRIEF_F  (
 aVRCPSpecialid CHAR
) return varchar;


 function VRCPPresents_BRIEF_F  (
 aVRCPPresentsid CHAR
) return varchar;


 function VRCPReports_BRIEF_F  (
 aVRCPReportsid CHAR
) return varchar;


 function VRCPDates_BRIEF_F  (
 aVRCPDatesid CHAR
) return varchar;


 function VRCPNeigborhood_BRIEF_F  (
 aVRCPNeigborhoodid CHAR
) return varchar;


 function VRCPInterest_BRIEF_F  (
 aVRCPInterestid CHAR
) return varchar;


 function VRCPCommon_BRIEF_F  (
 aVRCPCommonid CHAR
) return varchar;


 function PEKZR_DATA_BRIEF_F  (
 aPEKZR_DATAid CHAR
) return varchar;


 function WEBCRD_NUM_BRIEF_F  (
 aWEBCRD_NUMid CHAR
) return varchar;


 function WBCRD_DEF_BRIEF_F  (
 aWBCRD_DEFid CHAR
) return varchar;


 function PEKO_DEF_BRIEF_F  (
 aPEKO_DEFid CHAR
) return varchar;


 function PEKL_DEF_BRIEF_F  (
 aPEKL_DEFid CHAR
) return varchar;


 function PEKL_WDAY_BRIEF_F  (
 aPEKL_WDAYid CHAR
) return varchar;


 function PEKD_ADDS_BRIEF_F  (
 aPEKD_ADDSid CHAR
) return varchar;


 function PEKD_TRAINTYPE_BRIEF_F  (
 aPEKD_TRAINTYPEid CHAR
) return varchar;


 function PEKD_AUTO_BRIEF_F  (
 aPEKD_AUTOid CHAR
) return varchar;


 function PEKD_GOTYPE_BRIEF_F  (
 aPEKD_GOTYPEid CHAR
) return varchar;


 function PEKD_INFOSENDTYPE_BRIEF_F  (
 aPEKD_INFOSENDTYPEid CHAR
) return varchar;


 function PEKD_TRTYPE_BRIEF_F  (
 aPEKD_TRTYPEid CHAR
) return varchar;


 function PEKD_GRPDpUSL_BRIEF_F  (
 aPEKD_GRPDpUSLid CHAR
) return varchar;


 function PEKD_POSTTYPE_BRIEF_F  (
 aPEKD_POSTTYPEid CHAR
) return varchar;


 function PEKD_TRFGRP_BRIEF_F  (
 aPEKD_TRFGRPid CHAR
) return varchar;


 function PEKD_TRFTYPE_BRIEF_F  (
 aPEKD_TRFTYPEid CHAR
) return varchar;


 function PEKD_DEPT_BRIEF_F  (
 aPEKD_DEPTid CHAR
) return varchar;


 function PEKD_DEPLIMITS_BRIEF_F  (
 aPEKD_DEPLIMITSid CHAR
) return varchar;


 function PEKD_DEPDOG_BRIEF_F  (
 aPEKD_DEPDOGid CHAR
) return varchar;


 function PEKD_DIRECTION_BRIEF_F  (
 aPEKD_DIRECTIONid CHAR
) return varchar;


 function PEKD_TRAINS_BRIEF_F  (
 aPEKD_TRAINSid CHAR
) return varchar;


 function PEKD_DIRSTATION_BRIEF_F  (
 aPEKD_DIRSTATIONid CHAR
) return varchar;


 function PEKD_SRV_BRIEF_F  (
 aPEKD_SRVid CHAR
) return varchar;

 end Func;

;



