
/* --index*/

 

drop index parent_SrvMessageInfo
/
create index MTZ.parent_SrvMessageInfo on MTZ.SrvMessageInfo("INSTANCEID")
/


drop index parent_STDMail_To
/
create index MTZ.parent_STDMail_To on MTZ.STDMail_To("INSTANCEID")
/


drop index parent_STDMail_Attach
/
create index MTZ.parent_STDMail_Attach on MTZ.STDMail_Attach("INSTANCEID")
/


drop index parent_STDMail_Info
/
create index MTZ.parent_STDMail_Info on MTZ.STDMail_Info("INSTANCEID")
/


drop index parent_ITTOPT_MOVE
/
create index MTZ.parent_ITTOPT_MOVE on MTZ.ITTOPT_MOVE("INSTANCEID")
/


drop index parent_ITTOPT_DEF
/
create index MTZ.parent_ITTOPT_DEF on MTZ.ITTOPT_DEF("INSTANCEID")
/


drop index parent_Num_zones
/
create index MTZ.parent_Num_zones on MTZ.Num_zones("INSTANCEID")
/


drop index parent_Num_Values
/
create index MTZ.parent_Num_Values on MTZ.Num_Values(ParentStructRowID)
/


drop index parent_Num_head
/
create index MTZ.parent_Num_head on MTZ.Num_head("INSTANCEID")
/


drop index parent_FilterFieldGroup
/
create index MTZ.parent_FilterFieldGroup on MTZ.FilterFieldGroup("INSTANCEID")
/


drop index parent_FileterField
/
create index MTZ.parent_FileterField on MTZ.FileterField(ParentStructRowID)
/


drop index parent_Filters
/
create index MTZ.parent_Filters on MTZ.Filters("INSTANCEID")
/


drop index parent_StateAction
/
create index MTZ.parent_StateAction on MTZ.StateAction("INSTANCEID")
/


drop index parent_WEBSDIC_QTYPE
/
create index MTZ.parent_WEBSDIC_QTYPE on MTZ.WEBSDIC_QTYPE("INSTANCEID")
/


drop index parent_WEBSDIC_DEF
/
create index MTZ.parent_WEBSDIC_DEF on MTZ.WEBSDIC_DEF("INSTANCEID")
/


drop index parent_WEBSDIC_PAGETYPE
/
create index MTZ.parent_WEBSDIC_PAGETYPE on MTZ.WEBSDIC_PAGETYPE("INSTANCEID")
/


drop index parent_MTZ2JOB_DEF
/
create index MTZ.parent_MTZ2JOB_DEF on MTZ.MTZ2JOB_DEF("INSTANCEID")
/


drop index parent_REPD_LOCKED
/
create index MTZ.parent_REPD_LOCKED on MTZ.REPD_LOCKED("INSTANCEID")
/


drop index parent_REPD_RequestQuery
/
create index MTZ.parent_REPD_RequestQuery on MTZ.REPD_RequestQuery("INSTANCEID")
/


drop index parent_REPD_ResQueryRcv
/
create index MTZ.parent_REPD_ResQueryRcv on MTZ.REPD_ResQueryRcv(ParentStructRowID)
/


drop index parent_REPD_PROV
/
create index MTZ.parent_REPD_PROV on MTZ.REPD_PROV("INSTANCEID")
/


drop index parent_REPD_SRV
/
create index MTZ.parent_REPD_SRV on MTZ.REPD_SRV("INSTANCEID")
/


drop index parent_REPD_SNDTO
/
create index MTZ.parent_REPD_SNDTO on MTZ.REPD_SNDTO(ParentStructRowID)
/


drop index parent_REPD_CONST
/
create index MTZ.parent_REPD_CONST on MTZ.REPD_CONST(ParentStructRowID)
/


drop index parent_REPD_REPTYPE
/
create index MTZ.parent_REPD_REPTYPE on MTZ.REPD_REPTYPE(ParentStructRowID)
/


drop index parent_REPD_SendQ
/
create index MTZ.parent_REPD_SendQ on MTZ.REPD_SendQ("INSTANCEID")
/


drop index parent_REPD_RecvQ
/
create index MTZ.parent_REPD_RecvQ on MTZ.REPD_RecvQ("INSTANCEID")
/


drop index parent_ST_MAIN
/
create index MTZ.parent_ST_MAIN on MTZ.ST_MAIN("INSTANCEID")
/


drop index parent_ST_DEF
/
create index MTZ.parent_ST_DEF on MTZ.ST_DEF("INSTANCEID")
/


drop index parent_ST_PAGES
/
create index MTZ.parent_ST_PAGES on MTZ.ST_PAGES("INSTANCEID")
/


drop index parent_ITTD_MOROZ
/
create index MTZ.parent_ITTD_MOROZ on MTZ.ITTD_MOROZ("INSTANCEID")
/


drop index parent_ITTD_RULE
/
create index MTZ.parent_ITTD_RULE on MTZ.ITTD_RULE("INSTANCEID")
/


drop index parent_ITTD_PLTYPE
/
create index MTZ.parent_ITTD_PLTYPE on MTZ.ITTD_PLTYPE("INSTANCEID")
/


drop index parent_ITTD_FACTORY
/
create index MTZ.parent_ITTD_FACTORY on MTZ.ITTD_FACTORY("INSTANCEID")
/


drop index parent_ITTD_ZTYPE
/
create index MTZ.parent_ITTD_ZTYPE on MTZ.ITTD_ZTYPE("INSTANCEID")
/


drop index parent_ITTD_GTYPE
/
create index MTZ.parent_ITTD_GTYPE on MTZ.ITTD_GTYPE("INSTANCEID")
/


drop index parent_ITTD_KILLPLACE
/
create index MTZ.parent_ITTD_KILLPLACE on MTZ.ITTD_KILLPLACE("INSTANCEID")
/


drop index parent_ITTD_COUNTRY
/
create index MTZ.parent_ITTD_COUNTRY on MTZ.ITTD_COUNTRY("INSTANCEID")
/


drop index parent_ITTD_QTYPE
/
create index MTZ.parent_ITTD_QTYPE on MTZ.ITTD_QTYPE("INSTANCEID")
/


drop index parent_ITTD_CAMERA
/
create index MTZ.parent_ITTD_CAMERA on MTZ.ITTD_CAMERA("INSTANCEID")
/


drop index parent_ITTD_SRV
/
create index MTZ.parent_ITTD_SRV on MTZ.ITTD_SRV("INSTANCEID")
/


drop index parent_ITTD_ATYPE
/
create index MTZ.parent_ITTD_ATYPE on MTZ.ITTD_ATYPE("INSTANCEID")
/


drop index parent_ITTD_OPTTYPE
/
create index MTZ.parent_ITTD_OPTTYPE on MTZ.ITTD_OPTTYPE("INSTANCEID")
/


drop index parent_ITTD_EMAIL
/
create index MTZ.parent_ITTD_EMAIL on MTZ.ITTD_EMAIL("INSTANCEID")
/


drop index parent_ITTD_PART
/
create index MTZ.parent_ITTD_PART on MTZ.ITTD_PART("INSTANCEID")
/


drop index parent_ITTPL_DEF
/
create index MTZ.parent_ITTPL_DEF on MTZ.ITTPL_DEF("INSTANCEID")
/


drop index parent_ITTOP_OPLNK
/
create index MTZ.parent_ITTOP_OPLNK on MTZ.ITTOP_OPLNK("INSTANCEID")
/


drop index parent_ITTOP_OPKAM
/
create index MTZ.parent_ITTOP_OPKAM on MTZ.ITTOP_OPKAM(ParentStructRowID)
/


drop index parent_ITTOP_KLNK
/
create index MTZ.parent_ITTOP_KLNK on MTZ.ITTOP_KLNK("INSTANCEID")
/


drop index parent_ITTOP_KCAM
/
create index MTZ.parent_ITTOP_KCAM on MTZ.ITTOP_KCAM(ParentStructRowID)
/


drop index parent_ITTOP_KCLI
/
create index MTZ.parent_ITTOP_KCLI on MTZ.ITTOP_KCLI(ParentStructRowID)
/


drop index parent_ITTFN_MAX
/
create index MTZ.parent_ITTFN_MAX on MTZ.ITTFN_MAX("INSTANCEID")
/


drop index parent_STDJournlaExtInfo
/
create index MTZ.parent_STDJournlaExtInfo on MTZ.STDJournlaExtInfo("INSTANCEID")
/


drop index parent_STDJournalExtParam
/
create index MTZ.parent_STDJournalExtParam on MTZ.STDJournalExtParam("INSTANCEID")
/


drop index parent_STDJournalExtFlt
/
create index MTZ.parent_STDJournalExtFlt on MTZ.STDJournalExtFlt("INSTANCEID")
/


drop index parent_STDJournalExtField
/
create index MTZ.parent_STDJournalExtField on MTZ.STDJournalExtField(ParentStructRowID)
/


drop index parent_Ext_Photos
/
create index MTZ.parent_Ext_Photos on MTZ.Ext_Photos("INSTANCEID")
/


drop index parent_Ext_Photo_Call
/
create index MTZ.parent_Ext_Photo_Call on MTZ.Ext_Photo_Call(ParentStructRowID)
/


drop index parent_FIELDTYPE
/
create index MTZ.parent_FIELDTYPE on MTZ.FIELDTYPE("INSTANCEID")
/


drop index parent_FIELDTYPEMAP
/
create index MTZ.parent_FIELDTYPEMAP on MTZ.FIELDTYPEMAP(ParentStructRowID)
/


drop index parent_ENUMITEM
/
create index MTZ.parent_ENUMITEM on MTZ.ENUMITEM(ParentStructRowID)
/


drop index parent_SHAREDMETHOD
/
create index MTZ.parent_SHAREDMETHOD on MTZ.SHAREDMETHOD("INSTANCEID")
/


drop index parent_SCRIPT
/
create index MTZ.parent_SCRIPT on MTZ.SCRIPT(ParentStructRowID)
/


drop index parent_PARAMETERS
/
create index MTZ.parent_PARAMETERS on MTZ.PARAMETERS(ParentStructRowID)
/


drop index parent_OBJECTTYPE
/
create index MTZ.parent_OBJECTTYPE on MTZ.OBJECTTYPE("INSTANCEID")
/


drop index parent_PART
/
create index MTZ.parent_PART on MTZ.PART(ParentStructRowID)
/


drop index parent_PARTMENU
/
create index MTZ.parent_PARTMENU on MTZ.PARTMENU(ParentStructRowID)
/


drop index parent_PARTPARAMMAP
/
create index MTZ.parent_PARTPARAMMAP on MTZ.PARTPARAMMAP(ParentStructRowID)
/


drop index parent_FIELD
/
create index MTZ.parent_FIELD on MTZ.FIELD(ParentStructRowID)
/


drop index parent_FIELDVALIDATOR
/
create index MTZ.parent_FIELDVALIDATOR on MTZ.FIELDVALIDATOR(ParentStructRowID)
/


drop index parent_FIELDMENU
/
create index MTZ.parent_FIELDMENU on MTZ.FIELDMENU(ParentStructRowID)
/


drop index parent_FIELDPARAMMAP
/
create index MTZ.parent_FIELDPARAMMAP on MTZ.FIELDPARAMMAP(ParentStructRowID)
/


drop index parent_FldExtenders
/
create index MTZ.parent_FldExtenders on MTZ.FldExtenders(ParentStructRowID)
/


drop index parent_FIELDEXPRESSION
/
create index MTZ.parent_FIELDEXPRESSION on MTZ.FIELDEXPRESSION(ParentStructRowID)
/


drop index parent_DINAMICFILTERSCRIPT
/
create index MTZ.parent_DINAMICFILTERSCRIPT on MTZ.DINAMICFILTERSCRIPT(ParentStructRowID)
/


drop index parent_FIELDSRCDEF
/
create index MTZ.parent_FIELDSRCDEF on MTZ.FIELDSRCDEF(ParentStructRowID)
/


drop index parent_PARTVIEW
/
create index MTZ.parent_PARTVIEW on MTZ.PARTVIEW(ParentStructRowID)
/


drop index parent_ViewColumn
/
create index MTZ.parent_ViewColumn on MTZ.ViewColumn(ParentStructRowID)
/


drop index parent_PARTVIEW_LNK
/
create index MTZ.parent_PARTVIEW_LNK on MTZ.PARTVIEW_LNK(ParentStructRowID)
/


drop index parent_ExtenderInterface
/
create index MTZ.parent_ExtenderInterface on MTZ.ExtenderInterface(ParentStructRowID)
/


drop index parent_VALIDATOR
/
create index MTZ.parent_VALIDATOR on MTZ.VALIDATOR(ParentStructRowID)
/


drop index parent_UNIQUECONSTRAINT
/
create index MTZ.parent_UNIQUECONSTRAINT on MTZ.UNIQUECONSTRAINT(ParentStructRowID)
/


drop index parent_CONSTRAINTFIELD
/
create index MTZ.parent_CONSTRAINTFIELD on MTZ.CONSTRAINTFIELD(ParentStructRowID)
/


drop index parent_INSTANCEVALIDATOR
/
create index MTZ.parent_INSTANCEVALIDATOR on MTZ.INSTANCEVALIDATOR(ParentStructRowID)
/


drop index parent_OBJSTATUS
/
create index MTZ.parent_OBJSTATUS on MTZ.OBJSTATUS(ParentStructRowID)
/


drop index parent_NEXTSTATE
/
create index MTZ.parent_NEXTSTATE on MTZ.NEXTSTATE(ParentStructRowID)
/


drop index parent_OBJECTMODE
/
create index MTZ.parent_OBJECTMODE on MTZ.OBJECTMODE(ParentStructRowID)
/


drop index parent_STRUCTRESTRICTION
/
create index MTZ.parent_STRUCTRESTRICTION on MTZ.STRUCTRESTRICTION(ParentStructRowID)
/


drop index parent_FIELDRESTRICTION
/
create index MTZ.parent_FIELDRESTRICTION on MTZ.FIELDRESTRICTION(ParentStructRowID)
/


drop index parent_METHODRESTRICTION
/
create index MTZ.parent_METHODRESTRICTION on MTZ.METHODRESTRICTION(ParentStructRowID)
/


drop index parent_TYPEMENU
/
create index MTZ.parent_TYPEMENU on MTZ.TYPEMENU(ParentStructRowID)
/


drop index parent_MTZAPP
/
create index MTZ.parent_MTZAPP on MTZ.MTZAPP("INSTANCEID")
/


drop index parent_ParentPackage
/
create index MTZ.parent_ParentPackage on MTZ.ParentPackage(ParentStructRowID)
/


drop index parent_GENPACKAGE
/
create index MTZ.parent_GENPACKAGE on MTZ.GENPACKAGE("INSTANCEID")
/


drop index parent_GENERATOR_TARGET
/
create index MTZ.parent_GENERATOR_TARGET on MTZ.GENERATOR_TARGET(ParentStructRowID)
/


drop index parent_GENMANUALCODE
/
create index MTZ.parent_GENMANUALCODE on MTZ.GENMANUALCODE(ParentStructRowID)
/


drop index parent_GENCONTROLS
/
create index MTZ.parent_GENCONTROLS on MTZ.GENCONTROLS(ParentStructRowID)
/


drop index parent_GENREFERENCE
/
create index MTZ.parent_GENREFERENCE on MTZ.GENREFERENCE(ParentStructRowID)
/


drop index parent_LocalizeInfo
/
create index MTZ.parent_LocalizeInfo on MTZ.LocalizeInfo("INSTANCEID")
/


drop index parent_ITTNO_YC
/
create index MTZ.parent_ITTNO_YC on MTZ.ITTNO_YC("INSTANCEID")
/


drop index parent_ITTNO_CMN
/
create index MTZ.parent_ITTNO_CMN on MTZ.ITTNO_CMN("INSTANCEID")
/


drop index parent_ITTNO_ZC
/
create index MTZ.parent_ITTNO_ZC on MTZ.ITTNO_ZC("INSTANCEID")
/


drop index parent_InfoStoreDef
/
create index MTZ.parent_InfoStoreDef on MTZ.InfoStoreDef("INSTANCEID")
/


drop index parent_Folder
/
create index MTZ.parent_Folder on MTZ.Folder("INSTANCEID")
/


drop index parent_Shortcut
/
create index MTZ.parent_Shortcut on MTZ.Shortcut(ParentStructRowID)
/


drop index parent_Reports
/
create index MTZ.parent_Reports on MTZ.Reports("INSTANCEID")
/


drop index parent_RPTStruct
/
create index MTZ.parent_RPTStruct on MTZ.RPTStruct("INSTANCEID")
/


drop index parent_RPTFields
/
create index MTZ.parent_RPTFields on MTZ.RPTFields(ParentStructRowID)
/


drop index parent_RPTFormula
/
create index MTZ.parent_RPTFormula on MTZ.RPTFormula("INSTANCEID")
/


drop index parent_ITTPR_DEF
/
create index MTZ.parent_ITTPR_DEF on MTZ.ITTPR_DEF("INSTANCEID")
/


drop index parent_MTZExt_def
/
create index MTZ.parent_MTZExt_def on MTZ.MTZExt_def("INSTANCEID")
/


drop index parent_MTZExtRel
/
create index MTZ.parent_MTZExtRel on MTZ.MTZExtRel("INSTANCEID")
/


drop index parent_ITTCS_LIN
/
create index MTZ.parent_ITTCS_LIN on MTZ.ITTCS_LIN("INSTANCEID")
/


drop index parent_ITTCS_DEF
/
create index MTZ.parent_ITTCS_DEF on MTZ.ITTCS_DEF("INSTANCEID")
/


drop index parent_SysLog
/
create index MTZ.parent_SysLog on MTZ.SysLog("INSTANCEID")
/


drop index parent_the_Session
/
create index MTZ.parent_the_Session on MTZ.the_Session("INSTANCEID")
/


drop index parent_LogReader
/
create index MTZ.parent_LogReader on MTZ.LogReader("INSTANCEID")
/


drop index parent_Verb
/
create index MTZ.parent_Verb on MTZ.Verb("INSTANCEID")
/


drop index parent_Users
/
create index MTZ.parent_Users on MTZ.Users("INSTANCEID")
/


drop index parent_Groups
/
create index MTZ.parent_Groups on MTZ.Groups("INSTANCEID")
/


drop index parent_GroupUser
/
create index MTZ.parent_GroupUser on MTZ.GroupUser(ParentStructRowID)
/


drop index parent_MTZSEC_RIGHT
/
create index MTZ.parent_MTZSEC_RIGHT on MTZ.MTZSEC_RIGHT("INSTANCEID")
/


drop index parent_ROLES_USER
/
create index MTZ.parent_ROLES_USER on MTZ.ROLES_USER("INSTANCEID")
/


drop index parent_ROLES_MAP
/
create index MTZ.parent_ROLES_MAP on MTZ.ROLES_MAP("INSTANCEID")
/


drop index parent_ROLES_DOC
/
create index MTZ.parent_ROLES_DOC on MTZ.ROLES_DOC("INSTANCEID")
/


drop index parent_ROLES_DOC_STATE
/
create index MTZ.parent_ROLES_DOC_STATE on MTZ.ROLES_DOC_STATE(ParentStructRowID)
/


drop index parent_ROLES_DEF
/
create index MTZ.parent_ROLES_DEF on MTZ.ROLES_DEF("INSTANCEID")
/


drop index parent_ROLES_REPORTS
/
create index MTZ.parent_ROLES_REPORTS on MTZ.ROLES_REPORTS("INSTANCEID")
/


drop index parent_ROLES_WP
/
create index MTZ.parent_ROLES_WP on MTZ.ROLES_WP("INSTANCEID")
/


drop index parent_ROLES_ACT
/
create index MTZ.parent_ROLES_ACT on MTZ.ROLES_ACT(ParentStructRowID)
/


drop index parent_JournalColumn
/
create index MTZ.parent_JournalColumn on MTZ.JournalColumn("INSTANCEID")
/


drop index parent_JColumnSource
/
create index MTZ.parent_JColumnSource on MTZ.JColumnSource(ParentStructRowID)
/


drop index parent_Journal
/
create index MTZ.parent_Journal on MTZ.Journal("INSTANCEID")
/


drop index parent_JournalSrc
/
create index MTZ.parent_JournalSrc on MTZ.JournalSrc("INSTANCEID")
/


drop index parent_MTZ_Inst_Build
/
create index MTZ.parent_MTZ_Inst_Build on MTZ.MTZ_Inst_Build("INSTANCEID")
/


drop index parent_MTZ_Inst_Build_Sec
/
create index MTZ.parent_MTZ_Inst_Build_Sec on MTZ.MTZ_Inst_Build_Sec(ParentStructRowID)
/


drop index parent_MTZ_Inst_Section
/
create index MTZ.parent_MTZ_Inst_Section on MTZ.MTZ_Inst_Section("INSTANCEID")
/


drop index parent_MTZ_Inst_Sec_Files
/
create index MTZ.parent_MTZ_Inst_Sec_Files on MTZ.MTZ_Inst_Sec_Files(ParentStructRowID)
/


drop index parent_MTZ_Inst_Common
/
create index MTZ.parent_MTZ_Inst_Common on MTZ.MTZ_Inst_Common("INSTANCEID")
/


drop index parent_ITTTZ_DEF
/
create index MTZ.parent_ITTTZ_DEF on MTZ.ITTTZ_DEF("INSTANCEID")
/


drop index parent_ITTTZ_LINES
/
create index MTZ.parent_ITTTZ_LINES on MTZ.ITTTZ_LINES("INSTANCEID")
/


drop index parent_ITT2OPT_DEF
/
create index MTZ.parent_ITT2OPT_DEF on MTZ.ITT2OPT_DEF("INSTANCEID")
/


drop index parent_ITTOUT_SRV
/
create index MTZ.parent_ITTOUT_SRV on MTZ.ITTOUT_SRV("INSTANCEID")
/


drop index parent_ITTOUT_DEF
/
create index MTZ.parent_ITTOUT_DEF on MTZ.ITTOUT_DEF("INSTANCEID")
/


drop index parent_ITTOUT_EPL
/
create index MTZ.parent_ITTOUT_EPL on MTZ.ITTOUT_EPL("INSTANCEID")
/


drop index parent_ITTOUT_LINES
/
create index MTZ.parent_ITTOUT_LINES on MTZ.ITTOUT_LINES("INSTANCEID")
/


drop index parent_ITTOUT_PALET
/
create index MTZ.parent_ITTOUT_PALET on MTZ.ITTOUT_PALET(ParentStructRowID)
/


drop index parent_ITTIN_QLINE
/
create index MTZ.parent_ITTIN_QLINE on MTZ.ITTIN_QLINE("INSTANCEID")
/


drop index parent_ITTIN_PALET
/
create index MTZ.parent_ITTIN_PALET on MTZ.ITTIN_PALET(ParentStructRowID)
/


drop index parent_ITTIN_SRV
/
create index MTZ.parent_ITTIN_SRV on MTZ.ITTIN_SRV("INSTANCEID")
/


drop index parent_ITTIN_DEF
/
create index MTZ.parent_ITTIN_DEF on MTZ.ITTIN_DEF("INSTANCEID")
/


drop index parent_ITTIN_EPL
/
create index MTZ.parent_ITTIN_EPL on MTZ.ITTIN_EPL("INSTANCEID")
/


drop index parent_ITTSSCC_LINE
/
create index MTZ.parent_ITTSSCC_LINE on MTZ.ITTSSCC_LINE("INSTANCEID")
/


drop index parent_ITTSSCC_DEF
/
create index MTZ.parent_ITTSSCC_DEF on MTZ.ITTSSCC_DEF("INSTANCEID")
/


drop index parent_WorkPlace
/
create index MTZ.parent_WorkPlace on MTZ.WorkPlace("INSTANCEID")
/


drop index parent_EntryPoints
/
create index MTZ.parent_EntryPoints on MTZ.EntryPoints("INSTANCEID")
/


drop index parent_EPFilterLink
/
create index MTZ.parent_EPFilterLink on MTZ.EPFilterLink(ParentStructRowID)
/


drop index parent_ARMTypes
/
create index MTZ.parent_ARMTypes on MTZ.ARMTypes("INSTANCEID")
/


drop index parent_ARMJournal
/
create index MTZ.parent_ARMJournal on MTZ.ARMJournal("INSTANCEID")
/


drop index parent_ARMJRNLADD
/
create index MTZ.parent_ARMJRNLADD on MTZ.ARMJRNLADD(ParentStructRowID)
/


drop index parent_ARMJRNLREP
/
create index MTZ.parent_ARMJRNLREP on MTZ.ARMJRNLREP(ParentStructRowID)
/


drop index parent_ARMJRNLRUN
/
create index MTZ.parent_ARMJRNLRUN on MTZ.ARMJRNLRUN(ParentStructRowID)
/


drop index parent_WEBS_MAILLIST
/
create index MTZ.parent_WEBS_MAILLIST on MTZ.WEBS_MAILLIST("INSTANCEID")
/


drop index parent_WEBS_ROLES
/
create index MTZ.parent_WEBS_ROLES on MTZ.WEBS_ROLES("INSTANCEID")
/


drop index parent_WEBS_PAGEDEF
/
create index MTZ.parent_WEBS_PAGEDEF on MTZ.WEBS_PAGEDEF("INSTANCEID")
/


drop index parent_WEBS_PICS
/
create index MTZ.parent_WEBS_PICS on MTZ.WEBS_PICS(ParentStructRowID)
/


drop index parent_WEBS_PAGEMENU
/
create index MTZ.parent_WEBS_PAGEMENU on MTZ.WEBS_PAGEMENU(ParentStructRowID)
/


drop index parent_WEBS_PAGECONTENT
/
create index MTZ.parent_WEBS_PAGECONTENT on MTZ.WEBS_PAGECONTENT(ParentStructRowID)
/


drop index parent_WEBS_PAGEPARS
/
create index MTZ.parent_WEBS_PAGEPARS on MTZ.WEBS_PAGEPARS(ParentStructRowID)
/


drop index parent_WEBS_PAGECOMP
/
create index MTZ.parent_WEBS_PAGECOMP on MTZ.WEBS_PAGECOMP(ParentStructRowID)
/


drop index parent_TablePart
/
create index MTZ.parent_TablePart on MTZ.TablePart(ParentStructRowID)
/


drop index parent_ReplaceValues
/
create index MTZ.parent_ReplaceValues on MTZ.ReplaceValues(ParentStructRowID)
/


drop index parent_DenyEdit
/
create index MTZ.parent_DenyEdit on MTZ.DenyEdit(ParentStructRowID)
/


drop index parent_DenyVisible
/
create index MTZ.parent_DenyVisible on MTZ.DenyVisible(ParentStructRowID)
/


drop index parent_AllowEditFieldValues
/
create index MTZ.parent_AllowEditFieldValues on MTZ.AllowEditFieldValues(ParentStructRowID)
/


drop index parent_ComboFields
/
create index MTZ.parent_ComboFields on MTZ.ComboFields(ParentStructRowID)
/


drop index parent_WEBS_USERS
/
create index MTZ.parent_WEBS_USERS on MTZ.WEBS_USERS("INSTANCEID")
/


drop index parent_WEBS_ANKETA
/
create index MTZ.parent_WEBS_ANKETA on MTZ.WEBS_ANKETA("INSTANCEID")
/


drop index parent_WEBS_QUESTIONS
/
create index MTZ.parent_WEBS_QUESTIONS on MTZ.WEBS_QUESTIONS(ParentStructRowID)
/


drop index parent_WEBS_ANSWERS
/
create index MTZ.parent_WEBS_ANSWERS on MTZ.WEBS_ANSWERS(ParentStructRowID)
/


drop index parent_WEBS_DDOC
/
create index MTZ.parent_WEBS_DDOC on MTZ.WEBS_DDOC("INSTANCEID")
/


drop index parent_WEBS_NEWS
/
create index MTZ.parent_WEBS_NEWS on MTZ.WEBS_NEWS("INSTANCEID")
/


drop index parent_NEWS_PICS
/
create index MTZ.parent_NEWS_PICS on MTZ.NEWS_PICS(ParentStructRowID)
/




