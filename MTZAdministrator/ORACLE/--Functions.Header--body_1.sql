
/* --body*/

 

 create or replace package Func as

  function instance_BRIEF_F  (
 ainstanceid CHAR
)return varchar2;


 function SrvMessageInfo_BRIEF_F  (
 aSrvMessageInfoid CHAR
) return varchar2;


 function STDMail_To_BRIEF_F  (
 aSTDMail_Toid CHAR
) return varchar2;


 function STDMail_Attach_BRIEF_F  (
 aSTDMail_Attachid CHAR
) return varchar2;


 function STDMail_Info_BRIEF_F  (
 aSTDMail_Infoid CHAR
) return varchar2;


 function ITTOPT_MOVE_BRIEF_F  (
 aITTOPT_MOVEid CHAR
) return varchar2;


 function ITTOPT_DEF_BRIEF_F  (
 aITTOPT_DEFid CHAR
) return varchar2;


 function Num_zones_BRIEF_F  (
 aNum_zonesid CHAR
) return varchar2;


 function Num_Values_BRIEF_F  (
 aNum_Valuesid CHAR
) return varchar2;


 function Num_head_BRIEF_F  (
 aNum_headid CHAR
) return varchar2;


 function FilterFieldGroup_BRIEF_F  (
 aFilterFieldGroupid CHAR
) return varchar2;


 function FileterField_BRIEF_F  (
 aFileterFieldid CHAR
) return varchar2;


 function Filters_BRIEF_F  (
 aFiltersid CHAR
) return varchar2;


 function StateAction_BRIEF_F  (
 aStateActionid CHAR
) return varchar2;


 function WEBSDIC_QTYPE_BRIEF_F  (
 aWEBSDIC_QTYPEid CHAR
) return varchar2;


 function WEBSDIC_DEF_BRIEF_F  (
 aWEBSDIC_DEFid CHAR
) return varchar2;


 function WEBSDIC_PAGETYPE_BRIEF_F  (
 aWEBSDIC_PAGETYPEid CHAR
) return varchar2;


 function MTZ2JOB_DEF_BRIEF_F  (
 aMTZ2JOB_DEFid CHAR
) return varchar2;


 function REPD_LOCKED_BRIEF_F  (
 aREPD_LOCKEDid CHAR
) return varchar2;


 function REPD_RequestQuery_BRIEF_F  (
 aREPD_RequestQueryid CHAR
) return varchar2;


 function REPD_ResQueryRcv_BRIEF_F  (
 aREPD_ResQueryRcvid CHAR
) return varchar2;


 function REPD_PROV_BRIEF_F  (
 aREPD_PROVid CHAR
) return varchar2;


 function REPD_SRV_BRIEF_F  (
 aREPD_SRVid CHAR
) return varchar2;


 function REPD_SNDTO_BRIEF_F  (
 aREPD_SNDTOid CHAR
) return varchar2;


 function REPD_CONST_BRIEF_F  (
 aREPD_CONSTid CHAR
) return varchar2;


 function REPD_REPTYPE_BRIEF_F  (
 aREPD_REPTYPEid CHAR
) return varchar2;


 function REPD_SendQ_BRIEF_F  (
 aREPD_SendQid CHAR
) return varchar2;


 function REPD_RecvQ_BRIEF_F  (
 aREPD_RecvQid CHAR
) return varchar2;


 function ST_MAIN_BRIEF_F  (
 aST_MAINid CHAR
) return varchar2;


 function ST_DEF_BRIEF_F  (
 aST_DEFid CHAR
) return varchar2;


 function ST_PAGES_BRIEF_F  (
 aST_PAGESid CHAR
) return varchar2;


 function ITTD_MOROZ_BRIEF_F  (
 aITTD_MOROZid CHAR
) return varchar2;


 function ITTD_RULE_BRIEF_F  (
 aITTD_RULEid CHAR
) return varchar2;


 function ITTD_PLTYPE_BRIEF_F  (
 aITTD_PLTYPEid CHAR
) return varchar2;


 function ITTD_FACTORY_BRIEF_F  (
 aITTD_FACTORYid CHAR
) return varchar2;


 function ITTD_ZTYPE_BRIEF_F  (
 aITTD_ZTYPEid CHAR
) return varchar2;


 function ITTD_GTYPE_BRIEF_F  (
 aITTD_GTYPEid CHAR
) return varchar2;


 function ITTD_KILLPLACE_BRIEF_F  (
 aITTD_KILLPLACEid CHAR
) return varchar2;


 function ITTD_COUNTRY_BRIEF_F  (
 aITTD_COUNTRYid CHAR
) return varchar2;


 function ITTD_QTYPE_BRIEF_F  (
 aITTD_QTYPEid CHAR
) return varchar2;


 function ITTD_CAMERA_BRIEF_F  (
 aITTD_CAMERAid CHAR
) return varchar2;


 function ITTD_SRV_BRIEF_F  (
 aITTD_SRVid CHAR
) return varchar2;


 function ITTD_ATYPE_BRIEF_F  (
 aITTD_ATYPEid CHAR
) return varchar2;


 function ITTD_OPTTYPE_BRIEF_F  (
 aITTD_OPTTYPEid CHAR
) return varchar2;


 function ITTD_EMAIL_BRIEF_F  (
 aITTD_EMAILid CHAR
) return varchar2;


 function ITTD_PART_BRIEF_F  (
 aITTD_PARTid CHAR
) return varchar2;


 function ITTPL_DEF_BRIEF_F  (
 aITTPL_DEFid CHAR
) return varchar2;


 function ITTOP_OPLNK_BRIEF_F  (
 aITTOP_OPLNKid CHAR
) return varchar2;


 function ITTOP_OPKAM_BRIEF_F  (
 aITTOP_OPKAMid CHAR
) return varchar2;


 function ITTOP_KLNK_BRIEF_F  (
 aITTOP_KLNKid CHAR
) return varchar2;


 function ITTOP_KCAM_BRIEF_F  (
 aITTOP_KCAMid CHAR
) return varchar2;


 function ITTOP_KCLI_BRIEF_F  (
 aITTOP_KCLIid CHAR
) return varchar2;


 function ITTFN_MAX_BRIEF_F  (
 aITTFN_MAXid CHAR
) return varchar2;


 function STDJournlaExtInfo_BRIEF_F  (
 aSTDJournlaExtInfoid CHAR
) return varchar2;


 function STDJournalExtParam_BRIEF_F  (
 aSTDJournalExtParamid CHAR
) return varchar2;


 function STDJournalExtFlt_BRIEF_F  (
 aSTDJournalExtFltid CHAR
) return varchar2;


 function STDJournalExtField_BRIEF_F  (
 aSTDJournalExtFieldid CHAR
) return varchar2;


 function Ext_Photos_BRIEF_F  (
 aExt_Photosid CHAR
) return varchar2;


 function Ext_Photo_Call_BRIEF_F  (
 aExt_Photo_Callid CHAR
) return varchar2;


 function FIELDTYPE_BRIEF_F  (
 aFIELDTYPEid CHAR
) return varchar2;


 function FIELDTYPEMAP_BRIEF_F  (
 aFIELDTYPEMAPid CHAR
) return varchar2;


 function ENUMITEM_BRIEF_F  (
 aENUMITEMid CHAR
) return varchar2;


 function SHAREDMETHOD_BRIEF_F  (
 aSHAREDMETHODid CHAR
) return varchar2;


 function SCRIPT_BRIEF_F  (
 aSCRIPTid CHAR
) return varchar2;


 function PARAMETERS_BRIEF_F  (
 aPARAMETERSid CHAR
) return varchar2;


 function OBJECTTYPE_BRIEF_F  (
 aOBJECTTYPEid CHAR
) return varchar2;


 function PART_BRIEF_F  (
 aPARTid CHAR
) return varchar2;


 function PARTMENU_BRIEF_F  (
 aPARTMENUid CHAR
) return varchar2;


 function PARTPARAMMAP_BRIEF_F  (
 aPARTPARAMMAPid CHAR
) return varchar2;


 function FIELD_BRIEF_F  (
 aFIELDid CHAR
) return varchar2;


 function FIELDVALIDATOR_BRIEF_F  (
 aFIELDVALIDATORid CHAR
) return varchar2;


 function FIELDMENU_BRIEF_F  (
 aFIELDMENUid CHAR
) return varchar2;


 function FIELDPARAMMAP_BRIEF_F  (
 aFIELDPARAMMAPid CHAR
) return varchar2;


 function FldExtenders_BRIEF_F  (
 aFldExtendersid CHAR
) return varchar2;


 function FIELDEXPRESSION_BRIEF_F  (
 aFIELDEXPRESSIONid CHAR
) return varchar2;


 function DINAMICFILTERSCRIPT_BRIEF_F  (
 aDINAMICFILTERSCRIPTid CHAR
) return varchar2;


 function FIELDSRCDEF_BRIEF_F  (
 aFIELDSRCDEFid CHAR
) return varchar2;


 function PARTVIEW_BRIEF_F  (
 aPARTVIEWid CHAR
) return varchar2;


 function ViewColumn_BRIEF_F  (
 aViewColumnid CHAR
) return varchar2;


 function PARTVIEW_LNK_BRIEF_F  (
 aPARTVIEW_LNKid CHAR
) return varchar2;


 function ExtenderInterface_BRIEF_F  (
 aExtenderInterfaceid CHAR
) return varchar2;


 function VALIDATOR_BRIEF_F  (
 aVALIDATORid CHAR
) return varchar2;


 function UNIQUECONSTRAINT_BRIEF_F  (
 aUNIQUECONSTRAINTid CHAR
) return varchar2;


 function CONSTRAINTFIELD_BRIEF_F  (
 aCONSTRAINTFIELDid CHAR
) return varchar2;


 function INSTANCEVALIDATOR_BRIEF_F  (
 aINSTANCEVALIDATORid CHAR
) return varchar2;


 function OBJSTATUS_BRIEF_F  (
 aOBJSTATUSid CHAR
) return varchar2;


 function NEXTSTATE_BRIEF_F  (
 aNEXTSTATEid CHAR
) return varchar2;


 function OBJECTMODE_BRIEF_F  (
 aOBJECTMODEid CHAR
) return varchar2;


 function STRUCTRESTRICTION_BRIEF_F  (
 aSTRUCTRESTRICTIONid CHAR
) return varchar2;


 function FIELDRESTRICTION_BRIEF_F  (
 aFIELDRESTRICTIONid CHAR
) return varchar2;


 function METHODRESTRICTION_BRIEF_F  (
 aMETHODRESTRICTIONid CHAR
) return varchar2;


 function TYPEMENU_BRIEF_F  (
 aTYPEMENUid CHAR
) return varchar2;


 function MTZAPP_BRIEF_F  (
 aMTZAPPid CHAR
) return varchar2;


 function ParentPackage_BRIEF_F  (
 aParentPackageid CHAR
) return varchar2;


 function GENPACKAGE_BRIEF_F  (
 aGENPACKAGEid CHAR
) return varchar2;


 function GENERATOR_TARGET_BRIEF_F  (
 aGENERATOR_TARGETid CHAR
) return varchar2;


 function GENMANUALCODE_BRIEF_F  (
 aGENMANUALCODEid CHAR
) return varchar2;


 function GENCONTROLS_BRIEF_F  (
 aGENCONTROLSid CHAR
) return varchar2;


 function GENREFERENCE_BRIEF_F  (
 aGENREFERENCEid CHAR
) return varchar2;


 function LocalizeInfo_BRIEF_F  (
 aLocalizeInfoid CHAR
) return varchar2;


 function ITTNO_YC_BRIEF_F  (
 aITTNO_YCid CHAR
) return varchar2;


 function ITTNO_CMN_BRIEF_F  (
 aITTNO_CMNid CHAR
) return varchar2;


 function ITTNO_ZC_BRIEF_F  (
 aITTNO_ZCid CHAR
) return varchar2;


 function InfoStoreDef_BRIEF_F  (
 aInfoStoreDefid CHAR
) return varchar2;


 function Folder_BRIEF_F  (
 aFolderid CHAR
) return varchar2;


 function Shortcut_BRIEF_F  (
 aShortcutid CHAR
) return varchar2;


 function Reports_BRIEF_F  (
 aReportsid CHAR
) return varchar2;


 function RPTStruct_BRIEF_F  (
 aRPTStructid CHAR
) return varchar2;


 function RPTFields_BRIEF_F  (
 aRPTFieldsid CHAR
) return varchar2;


 function RPTFormula_BRIEF_F  (
 aRPTFormulaid CHAR
) return varchar2;


 function ITTPR_DEF_BRIEF_F  (
 aITTPR_DEFid CHAR
) return varchar2;


 function MTZExt_def_BRIEF_F  (
 aMTZExt_defid CHAR
) return varchar2;


 function MTZExtRel_BRIEF_F  (
 aMTZExtRelid CHAR
) return varchar2;


 function ITTCS_LIN_BRIEF_F  (
 aITTCS_LINid CHAR
) return varchar2;


 function ITTCS_DEF_BRIEF_F  (
 aITTCS_DEFid CHAR
) return varchar2;


 function SysLog_BRIEF_F  (
 aSysLogid CHAR
) return varchar2;


 function the_Session_BRIEF_F  (
 athe_Sessionid CHAR
) return varchar2;


 function LogReader_BRIEF_F  (
 aLogReaderid CHAR
) return varchar2;


 function Verb_BRIEF_F  (
 aVerbid CHAR
) return varchar2;


 function Users_BRIEF_F  (
 aUsersid CHAR
) return varchar2;


 function Groups_BRIEF_F  (
 aGroupsid CHAR
) return varchar2;


 function GroupUser_BRIEF_F  (
 aGroupUserid CHAR
) return varchar2;


 function MTZSEC_RIGHT_BRIEF_F  (
 aMTZSEC_RIGHTid CHAR
) return varchar2;


 function ROLES_USER_BRIEF_F  (
 aROLES_USERid CHAR
) return varchar2;


 function ROLES_MAP_BRIEF_F  (
 aROLES_MAPid CHAR
) return varchar2;


 function ROLES_DOC_BRIEF_F  (
 aROLES_DOCid CHAR
) return varchar2;


 function ROLES_DOC_STATE_BRIEF_F  (
 aROLES_DOC_STATEid CHAR
) return varchar2;


 function ROLES_DEF_BRIEF_F  (
 aROLES_DEFid CHAR
) return varchar2;


 function ROLES_REPORTS_BRIEF_F  (
 aROLES_REPORTSid CHAR
) return varchar2;


 function ROLES_WP_BRIEF_F  (
 aROLES_WPid CHAR
) return varchar2;


 function ROLES_ACT_BRIEF_F  (
 aROLES_ACTid CHAR
) return varchar2;


 function JournalColumn_BRIEF_F  (
 aJournalColumnid CHAR
) return varchar2;


 function JColumnSource_BRIEF_F  (
 aJColumnSourceid CHAR
) return varchar2;


 function Journal_BRIEF_F  (
 aJournalid CHAR
) return varchar2;


 function JournalSrc_BRIEF_F  (
 aJournalSrcid CHAR
) return varchar2;


 function MTZ_Inst_Build_BRIEF_F  (
 aMTZ_Inst_Buildid CHAR
) return varchar2;


 function MTZ_Inst_Build_Sec_BRIEF_F  (
 aMTZ_Inst_Build_Secid CHAR
) return varchar2;


 function MTZ_Inst_Section_BRIEF_F  (
 aMTZ_Inst_Sectionid CHAR
) return varchar2;


 function MTZ_Inst_Sec_Files_BRIEF_F  (
 aMTZ_Inst_Sec_Filesid CHAR
) return varchar2;


 function MTZ_Inst_Common_BRIEF_F  (
 aMTZ_Inst_Commonid CHAR
) return varchar2;


 function ITTTZ_DEF_BRIEF_F  (
 aITTTZ_DEFid CHAR
) return varchar2;


 function ITTTZ_LINES_BRIEF_F  (
 aITTTZ_LINESid CHAR
) return varchar2;


 function ITT2OPT_DEF_BRIEF_F  (
 aITT2OPT_DEFid CHAR
) return varchar2;


 function ITTOUT_SRV_BRIEF_F  (
 aITTOUT_SRVid CHAR
) return varchar2;


 function ITTOUT_DEF_BRIEF_F  (
 aITTOUT_DEFid CHAR
) return varchar2;


 function ITTOUT_EPL_BRIEF_F  (
 aITTOUT_EPLid CHAR
) return varchar2;


 function ITTOUT_LINES_BRIEF_F  (
 aITTOUT_LINESid CHAR
) return varchar2;


 function ITTOUT_PALET_BRIEF_F  (
 aITTOUT_PALETid CHAR
) return varchar2;


 function ITTIN_QLINE_BRIEF_F  (
 aITTIN_QLINEid CHAR
) return varchar2;


 function ITTIN_PALET_BRIEF_F  (
 aITTIN_PALETid CHAR
) return varchar2;


 function ITTIN_SRV_BRIEF_F  (
 aITTIN_SRVid CHAR
) return varchar2;


 function ITTIN_DEF_BRIEF_F  (
 aITTIN_DEFid CHAR
) return varchar2;


 function ITTIN_EPL_BRIEF_F  (
 aITTIN_EPLid CHAR
) return varchar2;


 function ITTSSCC_LINE_BRIEF_F  (
 aITTSSCC_LINEid CHAR
) return varchar2;


 function ITTSSCC_DEF_BRIEF_F  (
 aITTSSCC_DEFid CHAR
) return varchar2;


 function WorkPlace_BRIEF_F  (
 aWorkPlaceid CHAR
) return varchar2;


 function EntryPoints_BRIEF_F  (
 aEntryPointsid CHAR
) return varchar2;


 function EPFilterLink_BRIEF_F  (
 aEPFilterLinkid CHAR
) return varchar2;


 function ARMTypes_BRIEF_F  (
 aARMTypesid CHAR
) return varchar2;


 function ARMJournal_BRIEF_F  (
 aARMJournalid CHAR
) return varchar2;


 function ARMJRNLADD_BRIEF_F  (
 aARMJRNLADDid CHAR
) return varchar2;


 function ARMJRNLREP_BRIEF_F  (
 aARMJRNLREPid CHAR
) return varchar2;


 function ARMJRNLRUN_BRIEF_F  (
 aARMJRNLRUNid CHAR
) return varchar2;


 function WEBS_MAILLIST_BRIEF_F  (
 aWEBS_MAILLISTid CHAR
) return varchar2;


 function WEBS_ROLES_BRIEF_F  (
 aWEBS_ROLESid CHAR
) return varchar2;


 function WEBS_PAGEDEF_BRIEF_F  (
 aWEBS_PAGEDEFid CHAR
) return varchar2;


 function WEBS_PICS_BRIEF_F  (
 aWEBS_PICSid CHAR
) return varchar2;


 function WEBS_PAGEMENU_BRIEF_F  (
 aWEBS_PAGEMENUid CHAR
) return varchar2;


 function WEBS_PAGECONTENT_BRIEF_F  (
 aWEBS_PAGECONTENTid CHAR
) return varchar2;


 function WEBS_PAGEPARS_BRIEF_F  (
 aWEBS_PAGEPARSid CHAR
) return varchar2;


 function WEBS_PAGECOMP_BRIEF_F  (
 aWEBS_PAGECOMPid CHAR
) return varchar2;


 function TablePart_BRIEF_F  (
 aTablePartid CHAR
) return varchar2;


 function ReplaceValues_BRIEF_F  (
 aReplaceValuesid CHAR
) return varchar2;


 function DenyEdit_BRIEF_F  (
 aDenyEditid CHAR
) return varchar2;


 function DenyVisible_BRIEF_F  (
 aDenyVisibleid CHAR
) return varchar2;


 function AllowEditFieldValues_BRIEF_F  (
 aAllowEditFieldValuesid CHAR
) return varchar2;


 function ComboFields_BRIEF_F  (
 aComboFieldsid CHAR
) return varchar2;


 function WEBS_USERS_BRIEF_F  (
 aWEBS_USERSid CHAR
) return varchar2;


 function WEBS_ANKETA_BRIEF_F  (
 aWEBS_ANKETAid CHAR
) return varchar2;


 function WEBS_QUESTIONS_BRIEF_F  (
 aWEBS_QUESTIONSid CHAR
) return varchar2;


 function WEBS_ANSWERS_BRIEF_F  (
 aWEBS_ANSWERSid CHAR
) return varchar2;


 function WEBS_DDOC_BRIEF_F  (
 aWEBS_DDOCid CHAR
) return varchar2;


 function WEBS_NEWS_BRIEF_F  (
 aWEBS_NEWSid CHAR
) return varchar2;


 function NEWS_PICS_BRIEF_F  (
 aNEWS_PICSid CHAR
) return varchar2;

 end Func;

/



