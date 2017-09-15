
/* --index*/

 

drop index parent_FilterFieldGroup
;
create index parent_FilterFieldGroup on FilterFieldGroup("INSTANCEID")
;


drop index parent_FileterField
;
create index parent_FileterField on FileterField(ParentStructRowID)
;


drop index parent_Filters
;
create index parent_Filters on Filters("INSTANCEID")
;


drop index parent_PEK103_DEF
;
create index parent_PEK103_DEF on PEK103_DEF("INSTANCEID")
;


drop index parent_PEK103_LINES
;
create index parent_PEK103_LINES on PEK103_LINES("INSTANCEID")
;


drop index parent_WEBC_BLOCK
;
create index parent_WEBC_BLOCK on WEBC_BLOCK("INSTANCEID")
;


drop index parent_WEBC_NEWS
;
create index parent_WEBC_NEWS on WEBC_NEWS("INSTANCEID")
;


drop index parent_WEBC_JOB
;
create index parent_WEBC_JOB on WEBC_JOB("INSTANCEID")
;


drop index parent_WEBC_MESSAGES
;
create index parent_WEBC_MESSAGES on WEBC_MESSAGES("INSTANCEID")
;


drop index parent_WEBC_DOCS
;
create index parent_WEBC_DOCS on WEBC_DOCS("INSTANCEID")
;


drop index parent_WEBC_FILIALS
;
create index parent_WEBC_FILIALS on WEBC_FILIALS("INSTANCEID")
;


drop index parent_WEBC_LINKS
;
create index parent_WEBC_LINKS on WEBC_LINKS("INSTANCEID")
;


drop index parent_VRRPT_COSTS
;
create index parent_VRRPT_COSTS on VRRPT_COSTS("INSTANCEID")
;


drop index parent_VRRPT_MeetingPlan
;
create index parent_VRRPT_MeetingPlan on VRRPT_MeetingPlan("INSTANCEID")
;


drop index parent_VRRPT_Meeters
;
create index parent_VRRPT_Meeters on VRRPT_Meeters(ParentStructRowID)
;


drop index parent_VRRPT_MAIN
;
create index parent_VRRPT_MAIN on VRRPT_MAIN("INSTANCEID")
;


drop index parent_VRDGCommon
;
create index parent_VRDGCommon on VRDGCommon("INSTANCEID")
;


drop index parent_VRDGReport
;
create index parent_VRDGReport on VRDGReport("INSTANCEID")
;


drop index parent_VRDGContractChanges
;
create index parent_VRDGContractChanges on VRDGContractChanges("INSTANCEID")
;


drop index parent_VRDGContractVersion
;
create index parent_VRDGContractVersion on VRDGContractVersion("INSTANCEID")
;


drop index parent_VRDGContractSpesial
;
create index parent_VRDGContractSpesial on VRDGContractSpesial("INSTANCEID")
;


drop index parent_PEKSH_DATA
;
create index parent_PEKSH_DATA on PEKSH_DATA("INSTANCEID")
;


drop index parent_PEKSH_START
;
create index parent_PEKSH_START on PEKSH_START(ParentStructRowID)
;


drop index parent_PEKSH_DEF
;
create index parent_PEKSH_DEF on PEKSH_DEF("INSTANCEID")
;


drop index parent_MTZ2JOB_DEF
;
create index parent_MTZ2JOB_DEF on MTZ2JOB_DEF("INSTANCEID")
;


drop index parent_PEKPAY_DEF
;
create index parent_PEKPAY_DEF on PEKPAY_DEF("INSTANCEID")
;


drop index parent_WEBSDIC_DEF
;
create index parent_WEBSDIC_DEF on WEBSDIC_DEF("INSTANCEID")
;


drop index parent_PWUUSERS
;
create index parent_PWUUSERS on PWUUSERS("INSTANCEID")
;


drop index parent_pekz_path
;
create index parent_pekz_path on pekz_path("INSTANCEID")
;


drop index parent_PEKZ_WLIST
;
create index parent_PEKZ_WLIST on PEKZ_WLIST(ParentStructRowID)
;


drop index parent_PEKZ_WLADDS
;
create index parent_PEKZ_WLADDS on PEKZ_WLADDS(ParentStructRowID)
;


drop index parent_PEKZ_DOCS
;
create index parent_PEKZ_DOCS on PEKZ_DOCS("INSTANCEID")
;


drop index parent_pekz_def
;
create index parent_pekz_def on pekz_def("INSTANCEID")
;


drop index parent_PEKZ_ACLCT
;
create index parent_PEKZ_ACLCT on PEKZ_ACLCT("INSTANCEID")
;


drop index parent_PEKZ_ADLVR
;
create index parent_PEKZ_ADLVR on PEKZ_ADLVR("INSTANCEID")
;


drop index parent_pekz_dop
;
create index parent_pekz_dop on pekz_dop("INSTANCEID")
;


drop index parent_REPD_LOCKED
;
create index parent_REPD_LOCKED on REPD_LOCKED("INSTANCEID")
;


drop index parent_REPD_RequestQuery
;
create index parent_REPD_RequestQuery on REPD_RequestQuery("INSTANCEID")
;


drop index parent_REPD_ResQueryRcv
;
create index parent_REPD_ResQueryRcv on REPD_ResQueryRcv(ParentStructRowID)
;


drop index parent_REPD_PROV
;
create index parent_REPD_PROV on REPD_PROV("INSTANCEID")
;


drop index parent_REPD_SRV
;
create index parent_REPD_SRV on REPD_SRV("INSTANCEID")
;


drop index parent_REPD_SNDTO
;
create index parent_REPD_SNDTO on REPD_SNDTO(ParentStructRowID)
;


drop index parent_REPD_CONST
;
create index parent_REPD_CONST on REPD_CONST(ParentStructRowID)
;


drop index parent_REPD_REPTYPE
;
create index parent_REPD_REPTYPE on REPD_REPTYPE(ParentStructRowID)
;


drop index parent_REPD_SendQ
;
create index parent_REPD_SendQ on REPD_SendQ("INSTANCEID")
;


drop index parent_REPD_RecvQ
;
create index parent_REPD_RecvQ on REPD_RecvQ("INSTANCEID")
;


drop index parent_StateAction
;
create index parent_StateAction on StateAction("INSTANCEID")
;


drop index parent_TheDiffPath
;
create index parent_TheDiffPath on TheDiffPath("INSTANCEID")
;


drop index parent_DopUslTo
;
create index parent_DopUslTo on DopUslTo(ParentStructRowID)
;


drop index parent_DopUslFrom
;
create index parent_DopUslFrom on DopUslFrom(ParentStructRowID)
;


drop index parent_TheDefenitionDiffP
;
create index parent_TheDefenitionDiffP on TheDefenitionDiffP("INSTANCEID")
;


drop index parent_PEKACT_DEF
;
create index parent_PEKACT_DEF on PEKACT_DEF("INSTANCEID")
;


drop index parent_PEKACT_ITOG
;
create index parent_PEKACT_ITOG on PEKACT_ITOG("INSTANCEID")
;


drop index parent_PEKACT_LINES
;
create index parent_PEKACT_LINES on PEKACT_LINES("INSTANCEID")
;


drop index parent_FIELDTYPE
;
create index parent_FIELDTYPE on FIELDTYPE("INSTANCEID")
;


drop index parent_FIELDTYPEMAP
;
create index parent_FIELDTYPEMAP on FIELDTYPEMAP(ParentStructRowID)
;


drop index parent_ENUMITEM
;
create index parent_ENUMITEM on ENUMITEM(ParentStructRowID)
;


drop index parent_SHAREDMETHOD
;
create index parent_SHAREDMETHOD on SHAREDMETHOD("INSTANCEID")
;


drop index parent_SCRIPT
;
create index parent_SCRIPT on SCRIPT(ParentStructRowID)
;


drop index parent_PARAMETERS
;
create index parent_PARAMETERS on PARAMETERS(ParentStructRowID)
;


drop index parent_OBJECTTYPE
;
create index parent_OBJECTTYPE on OBJECTTYPE("INSTANCEID")
;


drop index parent_PART
;
create index parent_PART on PART(ParentStructRowID)
;


drop index parent_PARTMENU
;
create index parent_PARTMENU on PARTMENU(ParentStructRowID)
;


drop index parent_PARTPARAMMAP
;
create index parent_PARTPARAMMAP on PARTPARAMMAP(ParentStructRowID)
;


drop index parent_FIELD
;
create index parent_FIELD on FIELD(ParentStructRowID)
;


drop index parent_FIELDVALIDATOR
;
create index parent_FIELDVALIDATOR on FIELDVALIDATOR(ParentStructRowID)
;


drop index parent_FIELDMENU
;
create index parent_FIELDMENU on FIELDMENU(ParentStructRowID)
;


drop index parent_FIELDPARAMMAP
;
create index parent_FIELDPARAMMAP on FIELDPARAMMAP(ParentStructRowID)
;


drop index parent_FldExtenders
;
create index parent_FldExtenders on FldExtenders(ParentStructRowID)
;


drop index parent_FIELDEXPRESSION
;
create index parent_FIELDEXPRESSION on FIELDEXPRESSION(ParentStructRowID)
;


drop index parent_DINAMICFILTERSCRIPT
;
create index parent_DINAMICFILTERSCRIPT on DINAMICFILTERSCRIPT(ParentStructRowID)
;


drop index parent_FIELDSRCDEF
;
create index parent_FIELDSRCDEF on FIELDSRCDEF(ParentStructRowID)
;


drop index parent_PARTVIEW
;
create index parent_PARTVIEW on PARTVIEW(ParentStructRowID)
;


drop index parent_ViewColumn
;
create index parent_ViewColumn on ViewColumn(ParentStructRowID)
;


drop index parent_PARTVIEW_LNK
;
create index parent_PARTVIEW_LNK on PARTVIEW_LNK(ParentStructRowID)
;


drop index parent_ExtenderInterface
;
create index parent_ExtenderInterface on ExtenderInterface(ParentStructRowID)
;


drop index parent_VALIDATOR
;
create index parent_VALIDATOR on VALIDATOR(ParentStructRowID)
;


drop index parent_UNIQUECONSTRAINT
;
create index parent_UNIQUECONSTRAINT on UNIQUECONSTRAINT(ParentStructRowID)
;


drop index parent_CONSTRAINTFIELD
;
create index parent_CONSTRAINTFIELD on CONSTRAINTFIELD(ParentStructRowID)
;


drop index parent_INSTANCEVALIDATOR
;
create index parent_INSTANCEVALIDATOR on INSTANCEVALIDATOR(ParentStructRowID)
;


drop index parent_OBJSTATUS
;
create index parent_OBJSTATUS on OBJSTATUS(ParentStructRowID)
;


drop index parent_NEXTSTATE
;
create index parent_NEXTSTATE on NEXTSTATE(ParentStructRowID)
;


drop index parent_OBJECTMODE
;
create index parent_OBJECTMODE on OBJECTMODE(ParentStructRowID)
;


drop index parent_STRUCTRESTRICTION
;
create index parent_STRUCTRESTRICTION on STRUCTRESTRICTION(ParentStructRowID)
;


drop index parent_FIELDRESTRICTION
;
create index parent_FIELDRESTRICTION on FIELDRESTRICTION(ParentStructRowID)
;


drop index parent_METHODRESTRICTION
;
create index parent_METHODRESTRICTION on METHODRESTRICTION(ParentStructRowID)
;


drop index parent_TYPEMENU
;
create index parent_TYPEMENU on TYPEMENU(ParentStructRowID)
;


drop index parent_MTZAPP
;
create index parent_MTZAPP on MTZAPP("INSTANCEID")
;


drop index parent_ParentPackage
;
create index parent_ParentPackage on ParentPackage(ParentStructRowID)
;


drop index parent_GENPACKAGE
;
create index parent_GENPACKAGE on GENPACKAGE("INSTANCEID")
;


drop index parent_GENERATOR_TARGET
;
create index parent_GENERATOR_TARGET on GENERATOR_TARGET(ParentStructRowID)
;


drop index parent_GENMANUALCODE
;
create index parent_GENMANUALCODE on GENMANUALCODE(ParentStructRowID)
;


drop index parent_GENCONTROLS
;
create index parent_GENCONTROLS on GENCONTROLS(ParentStructRowID)
;


drop index parent_GENREFERENCE
;
create index parent_GENREFERENCE on GENREFERENCE(ParentStructRowID)
;


drop index parent_LocalizeInfo
;
create index parent_LocalizeInfo on LocalizeInfo("INSTANCEID")
;


drop index parent_PEKPQ_DEF
;
create index parent_PEKPQ_DEF on PEKPQ_DEF("INSTANCEID")
;


drop index parent_ENTDIC_BANK
;
create index parent_ENTDIC_BANK on ENTDIC_BANK("INSTANCEID")
;


drop index parent_ENTDIC_DOST
;
create index parent_ENTDIC_DOST on ENTDIC_DOST("INSTANCEID")
;


drop index parent_ENTDIC_TOWN
;
create index parent_ENTDIC_TOWN on ENTDIC_TOWN("INSTANCEID")
;


drop index parent_ENTDIC_TransportType
;
create index parent_ENTDIC_TransportType on ENTDIC_TransportType("INSTANCEID")
;


drop index parent_ENTDIC_OPF
;
create index parent_ENTDIC_OPF on ENTDIC_OPF("INSTANCEID")
;


drop index parent_ENTDIC_EDIZM
;
create index parent_ENTDIC_EDIZM on ENTDIC_EDIZM("INSTANCEID")
;


drop index parent_ENTDIC_CURRENCY
;
create index parent_ENTDIC_CURRENCY on ENTDIC_CURRENCY("INSTANCEID")
;


drop index parent_ENTDIC_CURCOURCE
;
create index parent_ENTDIC_CURCOURCE on ENTDIC_CURCOURCE(ParentStructRowID)
;


drop index parent_ENTDIC_COUNTRY
;
create index parent_ENTDIC_COUNTRY on ENTDIC_COUNTRY("INSTANCEID")
;


drop index parent_ENTDIC_REGION
;
create index parent_ENTDIC_REGION on ENTDIC_REGION("INSTANCEID")
;


drop index parent_ST_MAIN
;
create index parent_ST_MAIN on ST_MAIN("INSTANCEID")
;


drop index parent_ST_DEF
;
create index parent_ST_DEF on ST_DEF("INSTANCEID")
;


drop index parent_ST_PAGES
;
create index parent_ST_PAGES on ST_PAGES("INSTANCEID")
;


drop index parent_STDJournlaExtInfo
;
create index parent_STDJournlaExtInfo on STDJournlaExtInfo("INSTANCEID")
;


drop index parent_STDJournalExtParam
;
create index parent_STDJournalExtParam on STDJournalExtParam("INSTANCEID")
;


drop index parent_STDJournalExtFlt
;
create index parent_STDJournalExtFlt on STDJournalExtFlt("INSTANCEID")
;


drop index parent_STDJournalExtField
;
create index parent_STDJournalExtField on STDJournalExtField(ParentStructRowID)
;


drop index parent_CAL_DAYS
;
create index parent_CAL_DAYS on CAL_DAYS("INSTANCEID")
;


drop index parent_CAL_TIME
;
create index parent_CAL_TIME on CAL_TIME(ParentStructRowID)
;


drop index parent_CAL_HEAD
;
create index parent_CAL_HEAD on CAL_HEAD("INSTANCEID")
;


drop index parent_SrvMessageInfo
;
create index parent_SrvMessageInfo on SrvMessageInfo("INSTANCEID")
;


drop index parent_PEKNAL_DEF
;
create index parent_PEKNAL_DEF on PEKNAL_DEF("INSTANCEID")
;


drop index parent_PEKNAL_PZ
;
create index parent_PEKNAL_PZ on PEKNAL_PZ("INSTANCEID")
;


drop index parent_PEKNAL_ROWS
;
create index parent_PEKNAL_ROWS on PEKNAL_ROWS("INSTANCEID")
;


drop index parent_FileDef
;
create index parent_FileDef on FileDef("INSTANCEID")
;


drop index parent_FileVersion
;
create index parent_FileVersion on FileVersion("INSTANCEID")
;


drop index parent_Num_zones
;
create index parent_Num_zones on Num_zones("INSTANCEID")
;


drop index parent_Num_Values
;
create index parent_Num_Values on Num_Values(ParentStructRowID)
;


drop index parent_Num_head
;
create index parent_Num_head on Num_head("INSTANCEID")
;


drop index parent_BaseSetting
;
create index parent_BaseSetting on BaseSetting("INSTANCEID")
;


drop index parent_Reports
;
create index parent_Reports on Reports("INSTANCEID")
;


drop index parent_RPTStruct
;
create index parent_RPTStruct on RPTStruct("INSTANCEID")
;


drop index parent_RPTFields
;
create index parent_RPTFields on RPTFields(ParentStructRowID)
;


drop index parent_RPTFormula
;
create index parent_RPTFormula on RPTFormula("INSTANCEID")
;


drop index parent_PEKRKO_DEF
;
create index parent_PEKRKO_DEF on PEKRKO_DEF("INSTANCEID")
;


drop index parent_PEKRKO_ROWS
;
create index parent_PEKRKO_ROWS on PEKRKO_ROWS("INSTANCEID")
;


drop index parent_PEKTRF_REGALL
;
create index parent_PEKTRF_REGALL on PEKTRF_REGALL("INSTANCEID")
;


drop index parent_PEKTRF_DECR
;
create index parent_PEKTRF_DECR on PEKTRF_DECR("INSTANCEID")
;


drop index parent_PEKTRF_ADDS
;
create index parent_PEKTRF_ADDS on PEKTRF_ADDS("INSTANCEID")
;


drop index parent_PEKTRF_DEF
;
create index parent_PEKTRF_DEF on PEKTRF_DEF("INSTANCEID")
;


drop index parent_PEKTRF_AUTO
;
create index parent_PEKTRF_AUTO on PEKTRF_AUTO("INSTANCEID")
;


drop index parent_PEKTRF_SRV
;
create index parent_PEKTRF_SRV on PEKTRF_SRV("INSTANCEID")
;


drop index parent_PEKTRF_TR
;
create index parent_PEKTRF_TR on PEKTRF_TR("INSTANCEID")
;


drop index parent_PEKTRF_REGRTR
;
create index parent_PEKTRF_REGRTR on PEKTRF_REGRTR(ParentStructRowID)
;


drop index parent_PEKCL_DEF
;
create index parent_PEKCL_DEF on PEKCL_DEF("INSTANCEID")
;


drop index parent_PEKCL_DAYLY
;
create index parent_PEKCL_DAYLY on PEKCL_DAYLY("INSTANCEID")
;


drop index parent_PEKL_TOLOAD
;
create index parent_PEKL_TOLOAD on PEKL_TOLOAD(ParentStructRowID)
;


drop index parent_MTZExt_def
;
create index parent_MTZExt_def on MTZExt_def("INSTANCEID")
;


drop index parent_MTZExtRel
;
create index parent_MTZExtRel on MTZExtRel("INSTANCEID")
;


drop index parent_InfoStoreDef
;
create index parent_InfoStoreDef on InfoStoreDef("INSTANCEID")
;


drop index parent_Folder
;
create index parent_Folder on Folder("INSTANCEID")
;


drop index parent_Shortcut
;
create index parent_Shortcut on Shortcut(ParentStructRowID)
;


drop index parent_PEKP_DEF
;
create index parent_PEKP_DEF on PEKP_DEF("INSTANCEID")
;


drop index parent_PEKP_PZ
;
create index parent_PEKP_PZ on PEKP_PZ("INSTANCEID")
;


drop index parent_SysLog
;
create index parent_SysLog on SysLog("INSTANCEID")
;


drop index parent_the_Session
;
create index parent_the_Session on the_Session("INSTANCEID")
;


drop index parent_LogReader
;
create index parent_LogReader on LogReader("INSTANCEID")
;


drop index parent_Verb
;
create index parent_Verb on Verb("INSTANCEID")
;


drop index parent_Users
;
create index parent_Users on Users("INSTANCEID")
;


drop index parent_Groups
;
create index parent_Groups on Groups("INSTANCEID")
;


drop index parent_GroupUser
;
create index parent_GroupUser on GroupUser(ParentStructRowID)
;


drop index parent_VRDContractStage
;
create index parent_VRDContractStage on VRDContractStage("INSTANCEID")
;


drop index parent_VRDRreportType
;
create index parent_VRDRreportType on VRDRreportType("INSTANCEID")
;


drop index parent_VRDPrjType
;
create index parent_VRDPrjType on VRDPrjType("INSTANCEID")
;


drop index parent_VRDStream
;
create index parent_VRDStream on VRDStream("INSTANCEID")
;


drop index parent_VRDInterest
;
create index parent_VRDInterest on VRDInterest("INSTANCEID")
;


drop index parent_VRDDocType
;
create index parent_VRDDocType on VRDDocType("INSTANCEID")
;


drop index parent_VRDLoyalty
;
create index parent_VRDLoyalty on VRDLoyalty("INSTANCEID")
;


drop index parent_VRDMarket
;
create index parent_VRDMarket on VRDMarket("INSTANCEID")
;


drop index parent_MTZSEC_RIGHT
;
create index parent_MTZSEC_RIGHT on MTZSEC_RIGHT("INSTANCEID")
;


drop index parent_VRCAccounts
;
create index parent_VRCAccounts on VRCAccounts("INSTANCEID")
;


drop index parent_VRCTorg
;
create index parent_VRCTorg on VRCTorg("INSTANCEID")
;


drop index parent_VRCAditional
;
create index parent_VRCAditional on VRCAditional("INSTANCEID")
;


drop index parent_VRCTarif
;
create index parent_VRCTarif on VRCTarif("INSTANCEID")
;


drop index parent_VRCCommonInfo
;
create index parent_VRCCommonInfo on VRCCommonInfo("INSTANCEID")
;


drop index parent_ROLES_USER
;
create index parent_ROLES_USER on ROLES_USER("INSTANCEID")
;


drop index parent_ROLES_MAP
;
create index parent_ROLES_MAP on ROLES_MAP("INSTANCEID")
;


drop index parent_ROLES_DOC
;
create index parent_ROLES_DOC on ROLES_DOC("INSTANCEID")
;


drop index parent_ROLES_DOC_STATE
;
create index parent_ROLES_DOC_STATE on ROLES_DOC_STATE(ParentStructRowID)
;


drop index parent_ROLES_DEF
;
create index parent_ROLES_DEF on ROLES_DEF("INSTANCEID")
;


drop index parent_ROLES_REPORTS
;
create index parent_ROLES_REPORTS on ROLES_REPORTS("INSTANCEID")
;


drop index parent_ROLES_WP
;
create index parent_ROLES_WP on ROLES_WP("INSTANCEID")
;


drop index parent_ROLES_ACT
;
create index parent_ROLES_ACT on ROLES_ACT(ParentStructRowID)
;


drop index parent_RptSrvMsg
;
create index parent_RptSrvMsg on RptSrvMsg("INSTANCEID")
;


drop index parent_RptQuery
;
create index parent_RptQuery on RptQuery("INSTANCEID")
;


drop index parent_RptQryParam
;
create index parent_RptQryParam on RptQryParam("INSTANCEID")
;


drop index parent_PEKORD_DEF
;
create index parent_PEKORD_DEF on PEKORD_DEF("INSTANCEID")
;


drop index parent_PEKORD_DATA
;
create index parent_PEKORD_DATA on PEKORD_DATA("INSTANCEID")
;


drop index parent_WorkPlace
;
create index parent_WorkPlace on WorkPlace("INSTANCEID")
;


drop index parent_EntryPoints
;
create index parent_EntryPoints on EntryPoints("INSTANCEID")
;


drop index parent_EPFilterLink
;
create index parent_EPFilterLink on EPFilterLink(ParentStructRowID)
;


drop index parent_ARMTypes
;
create index parent_ARMTypes on ARMTypes("INSTANCEID")
;


drop index parent_ARMJournal
;
create index parent_ARMJournal on ARMJournal("INSTANCEID")
;


drop index parent_ARMJRNLADD
;
create index parent_ARMJRNLADD on ARMJRNLADD(ParentStructRowID)
;


drop index parent_ARMJRNLREP
;
create index parent_ARMJRNLREP on ARMJRNLREP(ParentStructRowID)
;


drop index parent_ARMJRNLRUN
;
create index parent_ARMJRNLRUN on ARMJRNLRUN(ParentStructRowID)
;


drop index parent_PEKD_NZONE
;
create index parent_PEKD_NZONE on PEKD_NZONE("INSTANCEID")
;


drop index parent_PEKD_USEDNUM
;
create index parent_PEKD_USEDNUM on PEKD_USEDNUM("INSTANCEID")
;


drop index parent_JournalColumn
;
create index parent_JournalColumn on JournalColumn("INSTANCEID")
;


drop index parent_JColumnSource
;
create index parent_JColumnSource on JColumnSource(ParentStructRowID)
;


drop index parent_Journal
;
create index parent_Journal on Journal("INSTANCEID")
;


drop index parent_JournalSrc
;
create index parent_JournalSrc on JournalSrc("INSTANCEID")
;


drop index parent_pekmsg_path
;
create index parent_pekmsg_path on pekmsg_path("INSTANCEID")
;


drop index parent_WEBS_MAILLIST
;
create index parent_WEBS_MAILLIST on WEBS_MAILLIST("INSTANCEID")
;


drop index parent_WEBS_RECLAME
;
create index parent_WEBS_RECLAME on WEBS_RECLAME("INSTANCEID")
;


drop index parent_WEBS_PAGEDEF
;
create index parent_WEBS_PAGEDEF on WEBS_PAGEDEF("INSTANCEID")
;


drop index parent_WEBS_PICS
;
create index parent_WEBS_PICS on WEBS_PICS(ParentStructRowID)
;


drop index parent_WEBS_PAGEMENU
;
create index parent_WEBS_PAGEMENU on WEBS_PAGEMENU(ParentStructRowID)
;


drop index parent_WEBS_PAGECONTENT
;
create index parent_WEBS_PAGECONTENT on WEBS_PAGECONTENT(ParentStructRowID)
;


drop index parent_WEBS_PAGEPARS
;
create index parent_WEBS_PAGEPARS on WEBS_PAGEPARS(ParentStructRowID)
;


drop index parent_WEBS_PAGECOMP
;
create index parent_WEBS_PAGECOMP on WEBS_PAGECOMP(ParentStructRowID)
;


drop index parent_TablePart
;
create index parent_TablePart on TablePart(ParentStructRowID)
;


drop index parent_ReplaceValues
;
create index parent_ReplaceValues on ReplaceValues(ParentStructRowID)
;


drop index parent_DenyEdit
;
create index parent_DenyEdit on DenyEdit(ParentStructRowID)
;


drop index parent_DenyVisible
;
create index parent_DenyVisible on DenyVisible(ParentStructRowID)
;


drop index parent_AllowEditFieldValues
;
create index parent_AllowEditFieldValues on AllowEditFieldValues(ParentStructRowID)
;


drop index parent_ComboFields
;
create index parent_ComboFields on ComboFields(ParentStructRowID)
;


drop index parent_WEBS_ANKETA
;
create index parent_WEBS_ANKETA on WEBS_ANKETA("INSTANCEID")
;


drop index parent_WEBS_QUESTIONS
;
create index parent_WEBS_QUESTIONS on WEBS_QUESTIONS(ParentStructRowID)
;


drop index parent_WEBS_ANSWERS
;
create index parent_WEBS_ANSWERS on WEBS_ANSWERS(ParentStructRowID)
;


drop index parent_WEBS_DDOC
;
create index parent_WEBS_DDOC on WEBS_DDOC("INSTANCEID")
;


drop index parent_WEBS_NEWS
;
create index parent_WEBS_NEWS on WEBS_NEWS("INSTANCEID")
;


drop index parent_NEWS_PICS
;
create index parent_NEWS_PICS on NEWS_PICS(ParentStructRowID)
;


drop index parent_VRCPSeeAlso
;
create index parent_VRCPSeeAlso on VRCPSeeAlso("INSTANCEID")
;


drop index parent_VRCPSpecial
;
create index parent_VRCPSpecial on VRCPSpecial("INSTANCEID")
;


drop index parent_VRCPPresents
;
create index parent_VRCPPresents on VRCPPresents("INSTANCEID")
;


drop index parent_VRCPReports
;
create index parent_VRCPReports on VRCPReports("INSTANCEID")
;


drop index parent_VRCPDates
;
create index parent_VRCPDates on VRCPDates("INSTANCEID")
;


drop index parent_VRCPNeigborhood
;
create index parent_VRCPNeigborhood on VRCPNeigborhood("INSTANCEID")
;


drop index parent_VRCPInterest
;
create index parent_VRCPInterest on VRCPInterest("INSTANCEID")
;


drop index parent_VRCPCommon
;
create index parent_VRCPCommon on VRCPCommon("INSTANCEID")
;


drop index parent_PEKZR_DATA
;
create index parent_PEKZR_DATA on PEKZR_DATA("INSTANCEID")
;


drop index parent_WEBCRD_NUM
;
create index parent_WEBCRD_NUM on WEBCRD_NUM("INSTANCEID")
;


drop index parent_WBCRD_DEF
;
create index parent_WBCRD_DEF on WBCRD_DEF("INSTANCEID")
;


drop index parent_PEKO_DEF
;
create index parent_PEKO_DEF on PEKO_DEF("INSTANCEID")
;


drop index parent_PEKL_DEF
;
create index parent_PEKL_DEF on PEKL_DEF("INSTANCEID")
;


drop index parent_PEKL_WDAY
;
create index parent_PEKL_WDAY on PEKL_WDAY("INSTANCEID")
;


drop index parent_PEKD_ADDS
;
create index parent_PEKD_ADDS on PEKD_ADDS("INSTANCEID")
;


drop index parent_PEKD_TRAINTYPE
;
create index parent_PEKD_TRAINTYPE on PEKD_TRAINTYPE("INSTANCEID")
;


drop index parent_PEKD_AUTO
;
create index parent_PEKD_AUTO on PEKD_AUTO("INSTANCEID")
;


drop index parent_PEKD_GOTYPE
;
create index parent_PEKD_GOTYPE on PEKD_GOTYPE("INSTANCEID")
;


drop index parent_PEKD_INFOSENDTYPE
;
create index parent_PEKD_INFOSENDTYPE on PEKD_INFOSENDTYPE("INSTANCEID")
;


drop index parent_PEKD_TRTYPE
;
create index parent_PEKD_TRTYPE on PEKD_TRTYPE("INSTANCEID")
;


drop index parent_PEKD_GRPDpUSL
;
create index parent_PEKD_GRPDpUSL on PEKD_GRPDpUSL("INSTANCEID")
;


drop index parent_PEKD_POSTTYPE
;
create index parent_PEKD_POSTTYPE on PEKD_POSTTYPE("INSTANCEID")
;


drop index parent_PEKD_TRFGRP
;
create index parent_PEKD_TRFGRP on PEKD_TRFGRP("INSTANCEID")
;


drop index parent_PEKD_TRFTYPE
;
create index parent_PEKD_TRFTYPE on PEKD_TRFTYPE(ParentStructRowID)
;


drop index parent_PEKD_DEPT
;
create index parent_PEKD_DEPT on PEKD_DEPT("INSTANCEID")
;


drop index parent_PEKD_DEPLIMITS
;
create index parent_PEKD_DEPLIMITS on PEKD_DEPLIMITS(ParentStructRowID)
;


drop index parent_PEKD_DEPDOG
;
create index parent_PEKD_DEPDOG on PEKD_DEPDOG(ParentStructRowID)
;


drop index parent_PEKD_DIRECTION
;
create index parent_PEKD_DIRECTION on PEKD_DIRECTION("INSTANCEID")
;


drop index parent_PEKD_TRAINS
;
create index parent_PEKD_TRAINS on PEKD_TRAINS(ParentStructRowID)
;


drop index parent_PEKD_DIRSTATION
;
create index parent_PEKD_DIRSTATION on PEKD_DIRSTATION(ParentStructRowID)
;


drop index parent_PEKD_SRV
;
create index parent_PEKD_SRV on PEKD_SRV("INSTANCEID")
;




