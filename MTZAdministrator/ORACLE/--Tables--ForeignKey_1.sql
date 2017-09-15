
/* --ForeignKey*/

 

alter  TABLE SrvMessageInfo DROP CONSTRAINT fk_296
/
alter  table MTZ.SrvMessageInfo add constraint fk_296 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE STDMail_To DROP CONSTRAINT fk_613
/
alter  table MTZ.STDMail_To add constraint fk_613 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE STDMail_Attach DROP CONSTRAINT fk_614
/
alter  table MTZ.STDMail_Attach add constraint fk_614 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE STDMail_Info DROP CONSTRAINT fk_615
/
alter  table MTZ.STDMail_Info add constraint fk_615 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTOPT_MOVE DROP CONSTRAINT fk_616
/
alter  table MTZ.ITTOPT_MOVE add constraint fk_616 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTOPT_DEF DROP CONSTRAINT fk_617
/
alter  table MTZ.ITTOPT_DEF add constraint fk_617 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE Num_zones DROP CONSTRAINT fk_161
/
alter  table MTZ.Num_zones add constraint fk_161 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE Num_Values DROP CONSTRAINT fk_162
/
alter  table MTZ.Num_Values add constraint fk_162 foreign key(ParentStructRowID) references MTZ.Num_zones (Num_zonesID)
/


alter  TABLE Num_head DROP CONSTRAINT fk_163
/
alter  table MTZ.Num_head add constraint fk_163 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE FilterFieldGroup DROP CONSTRAINT fk_195
/
alter  table MTZ.FilterFieldGroup add constraint fk_195 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE FileterField DROP CONSTRAINT fk_196
/
alter  table MTZ.FileterField add constraint fk_196 foreign key(ParentStructRowID) references MTZ.FilterFieldGroup (FilterFieldGroupID)
/


alter  TABLE Filters DROP CONSTRAINT fk_197
/
alter  table MTZ.Filters add constraint fk_197 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE StateAction DROP CONSTRAINT fk_64
/
alter  table MTZ.StateAction add constraint fk_64 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE WEBSDIC_QTYPE DROP CONSTRAINT fk_618
/
alter  table MTZ.WEBSDIC_QTYPE add constraint fk_618 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE WEBSDIC_DEF DROP CONSTRAINT fk_619
/
alter  table MTZ.WEBSDIC_DEF add constraint fk_619 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE WEBSDIC_PAGETYPE DROP CONSTRAINT fk_620
/
alter  table MTZ.WEBSDIC_PAGETYPE add constraint fk_620 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE MTZ2JOB_DEF DROP CONSTRAINT fk_580
/
alter  table MTZ.MTZ2JOB_DEF add constraint fk_580 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE REPD_LOCKED DROP CONSTRAINT fk_527
/
alter  table MTZ.REPD_LOCKED add constraint fk_527 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE REPD_RequestQuery DROP CONSTRAINT fk_528
/
alter  table MTZ.REPD_RequestQuery add constraint fk_528 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE REPD_ResQueryRcv DROP CONSTRAINT fk_529
/
alter  table MTZ.REPD_ResQueryRcv add constraint fk_529 foreign key(ParentStructRowID) references MTZ.REPD_RequestQuery (REPD_RequestQueryID)
/


alter  TABLE REPD_PROV DROP CONSTRAINT fk_530
/
alter  table MTZ.REPD_PROV add constraint fk_530 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE REPD_SRV DROP CONSTRAINT fk_531
/
alter  table MTZ.REPD_SRV add constraint fk_531 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE REPD_SNDTO DROP CONSTRAINT fk_532
/
alter  table MTZ.REPD_SNDTO add constraint fk_532 foreign key(ParentStructRowID) references MTZ.REPD_SRV (REPD_SRVID)
/


alter  TABLE REPD_CONST DROP CONSTRAINT fk_621
/
alter  table MTZ.REPD_CONST add constraint fk_621 foreign key(ParentStructRowID) references MTZ.REPD_SNDTO (REPD_SNDTOID)
/


alter  TABLE REPD_REPTYPE DROP CONSTRAINT fk_622
/
alter  table MTZ.REPD_REPTYPE add constraint fk_622 foreign key(ParentStructRowID) references MTZ.REPD_SNDTO (REPD_SNDTOID)
/


alter  TABLE REPD_SendQ DROP CONSTRAINT fk_533
/
alter  table MTZ.REPD_SendQ add constraint fk_533 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE REPD_RecvQ DROP CONSTRAINT fk_534
/
alter  table MTZ.REPD_RecvQ add constraint fk_534 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ST_MAIN DROP CONSTRAINT fk_623
/
alter  table MTZ.ST_MAIN add constraint fk_623 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ST_DEF DROP CONSTRAINT fk_624
/
alter  table MTZ.ST_DEF add constraint fk_624 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ST_PAGES DROP CONSTRAINT fk_625
/
alter  table MTZ.ST_PAGES add constraint fk_625 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_MOROZ DROP CONSTRAINT fk_626
/
alter  table MTZ.ITTD_MOROZ add constraint fk_626 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_RULE DROP CONSTRAINT fk_627
/
alter  table MTZ.ITTD_RULE add constraint fk_627 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_PLTYPE DROP CONSTRAINT fk_628
/
alter  table MTZ.ITTD_PLTYPE add constraint fk_628 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_FACTORY DROP CONSTRAINT fk_629
/
alter  table MTZ.ITTD_FACTORY add constraint fk_629 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_ZTYPE DROP CONSTRAINT fk_630
/
alter  table MTZ.ITTD_ZTYPE add constraint fk_630 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_GTYPE DROP CONSTRAINT fk_631
/
alter  table MTZ.ITTD_GTYPE add constraint fk_631 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_KILLPLACE DROP CONSTRAINT fk_632
/
alter  table MTZ.ITTD_KILLPLACE add constraint fk_632 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_COUNTRY DROP CONSTRAINT fk_633
/
alter  table MTZ.ITTD_COUNTRY add constraint fk_633 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_QTYPE DROP CONSTRAINT fk_634
/
alter  table MTZ.ITTD_QTYPE add constraint fk_634 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_CAMERA DROP CONSTRAINT fk_635
/
alter  table MTZ.ITTD_CAMERA add constraint fk_635 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_SRV DROP CONSTRAINT fk_636
/
alter  table MTZ.ITTD_SRV add constraint fk_636 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_ATYPE DROP CONSTRAINT fk_637
/
alter  table MTZ.ITTD_ATYPE add constraint fk_637 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_OPTTYPE DROP CONSTRAINT fk_638
/
alter  table MTZ.ITTD_OPTTYPE add constraint fk_638 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_EMAIL DROP CONSTRAINT fk_639
/
alter  table MTZ.ITTD_EMAIL add constraint fk_639 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTD_PART DROP CONSTRAINT fk_640
/
alter  table MTZ.ITTD_PART add constraint fk_640 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTPL_DEF DROP CONSTRAINT fk_641
/
alter  table MTZ.ITTPL_DEF add constraint fk_641 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTOP_OPLNK DROP CONSTRAINT fk_642
/
alter  table MTZ.ITTOP_OPLNK add constraint fk_642 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTOP_OPKAM DROP CONSTRAINT fk_643
/
alter  table MTZ.ITTOP_OPKAM add constraint fk_643 foreign key(ParentStructRowID) references MTZ.ITTOP_OPLNK (ITTOP_OPLNKID)
/


alter  TABLE ITTOP_KLNK DROP CONSTRAINT fk_644
/
alter  table MTZ.ITTOP_KLNK add constraint fk_644 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTOP_KCAM DROP CONSTRAINT fk_645
/
alter  table MTZ.ITTOP_KCAM add constraint fk_645 foreign key(ParentStructRowID) references MTZ.ITTOP_KLNK (ITTOP_KLNKID)
/


alter  TABLE ITTOP_KCLI DROP CONSTRAINT fk_646
/
alter  table MTZ.ITTOP_KCLI add constraint fk_646 foreign key(ParentStructRowID) references MTZ.ITTOP_KLNK (ITTOP_KLNKID)
/


alter  TABLE ITTFN_MAX DROP CONSTRAINT fk_647
/
alter  table MTZ.ITTFN_MAX add constraint fk_647 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE STDJournlaExtInfo DROP CONSTRAINT fk_648
/
alter  table MTZ.STDJournlaExtInfo add constraint fk_648 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE STDJournalExtParam DROP CONSTRAINT fk_649
/
alter  table MTZ.STDJournalExtParam add constraint fk_649 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE STDJournalExtFlt DROP CONSTRAINT fk_650
/
alter  table MTZ.STDJournalExtFlt add constraint fk_650 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE STDJournalExtField DROP CONSTRAINT fk_651
/
alter  table MTZ.STDJournalExtField add constraint fk_651 foreign key(ParentStructRowID) references MTZ.STDJournalExtFlt (STDJournalExtFltID)
/


alter  TABLE Ext_Photos DROP CONSTRAINT fk_652
/
alter  table MTZ.Ext_Photos add constraint fk_652 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE Ext_Photo_Call DROP CONSTRAINT fk_653
/
alter  table MTZ.Ext_Photo_Call add constraint fk_653 foreign key(ParentStructRowID) references MTZ.Ext_Photos (Ext_PhotosID)
/


alter  TABLE FIELDTYPE DROP CONSTRAINT fk_299
/
alter  table MTZ.FIELDTYPE add constraint fk_299 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE FIELDTYPEMAP DROP CONSTRAINT fk_300
/
alter  table MTZ.FIELDTYPEMAP add constraint fk_300 foreign key(ParentStructRowID) references MTZ.FIELDTYPE (FIELDTYPEID)
/


alter  TABLE ENUMITEM DROP CONSTRAINT fk_301
/
alter  table MTZ.ENUMITEM add constraint fk_301 foreign key(ParentStructRowID) references MTZ.FIELDTYPE (FIELDTYPEID)
/


alter  TABLE SHAREDMETHOD DROP CONSTRAINT fk_302
/
alter  table MTZ.SHAREDMETHOD add constraint fk_302 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE SCRIPT DROP CONSTRAINT fk_303
/
alter  table MTZ.SCRIPT add constraint fk_303 foreign key(ParentStructRowID) references MTZ.SHAREDMETHOD (SHAREDMETHODID)
/


alter  TABLE PARAMETERS DROP CONSTRAINT fk_304
/
alter  table MTZ.PARAMETERS add constraint fk_304 foreign key(ParentStructRowID) references MTZ.SCRIPT (SCRIPTID)
/


alter  TABLE OBJECTTYPE DROP CONSTRAINT fk_305
/
alter  table MTZ.OBJECTTYPE add constraint fk_305 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE PART DROP CONSTRAINT fk_306
/
alter  table MTZ.PART add constraint fk_306 foreign key(ParentStructRowID) references MTZ.OBJECTTYPE (OBJECTTYPEID)
/


alter  TABLE PARTMENU DROP CONSTRAINT fk_307
/
alter  table MTZ.PARTMENU add constraint fk_307 foreign key(ParentStructRowID) references MTZ.PART (PARTID)
/


alter  TABLE PARTPARAMMAP DROP CONSTRAINT fk_308
/
alter  table MTZ.PARTPARAMMAP add constraint fk_308 foreign key(ParentStructRowID) references MTZ.PARTMENU (PARTMENUID)
/


alter  TABLE FIELD DROP CONSTRAINT fk_309
/
alter  table MTZ.FIELD add constraint fk_309 foreign key(ParentStructRowID) references MTZ.PART (PARTID)
/


alter  TABLE FIELDVALIDATOR DROP CONSTRAINT fk_310
/
alter  table MTZ.FIELDVALIDATOR add constraint fk_310 foreign key(ParentStructRowID) references MTZ.FIELD (FIELDID)
/


alter  TABLE FIELDMENU DROP CONSTRAINT fk_311
/
alter  table MTZ.FIELDMENU add constraint fk_311 foreign key(ParentStructRowID) references MTZ.FIELD (FIELDID)
/


alter  TABLE FIELDPARAMMAP DROP CONSTRAINT fk_312
/
alter  table MTZ.FIELDPARAMMAP add constraint fk_312 foreign key(ParentStructRowID) references MTZ.FIELDMENU (FIELDMENUID)
/


alter  TABLE FldExtenders DROP CONSTRAINT fk_654
/
alter  table MTZ.FldExtenders add constraint fk_654 foreign key(ParentStructRowID) references MTZ.FIELD (FIELDID)
/


alter  TABLE FIELDEXPRESSION DROP CONSTRAINT fk_313
/
alter  table MTZ.FIELDEXPRESSION add constraint fk_313 foreign key(ParentStructRowID) references MTZ.FIELD (FIELDID)
/


alter  TABLE DINAMICFILTERSCRIPT DROP CONSTRAINT fk_314
/
alter  table MTZ.DINAMICFILTERSCRIPT add constraint fk_314 foreign key(ParentStructRowID) references MTZ.FIELD (FIELDID)
/


alter  TABLE FIELDSRCDEF DROP CONSTRAINT fk_655
/
alter  table MTZ.FIELDSRCDEF add constraint fk_655 foreign key(ParentStructRowID) references MTZ.FIELD (FIELDID)
/


alter  TABLE PARTVIEW DROP CONSTRAINT fk_315
/
alter  table MTZ.PARTVIEW add constraint fk_315 foreign key(ParentStructRowID) references MTZ.PART (PARTID)
/


alter  TABLE ViewColumn DROP CONSTRAINT fk_316
/
alter  table MTZ.ViewColumn add constraint fk_316 foreign key(ParentStructRowID) references MTZ.PARTVIEW (PARTVIEWID)
/


alter  TABLE PARTVIEW_LNK DROP CONSTRAINT fk_656
/
alter  table MTZ.PARTVIEW_LNK add constraint fk_656 foreign key(ParentStructRowID) references MTZ.PARTVIEW (PARTVIEWID)
/


alter  TABLE ExtenderInterface DROP CONSTRAINT fk_657
/
alter  table MTZ.ExtenderInterface add constraint fk_657 foreign key(ParentStructRowID) references MTZ.PART (PARTID)
/


alter  TABLE VALIDATOR DROP CONSTRAINT fk_317
/
alter  table MTZ.VALIDATOR add constraint fk_317 foreign key(ParentStructRowID) references MTZ.PART (PARTID)
/


alter  TABLE UNIQUECONSTRAINT DROP CONSTRAINT fk_318
/
alter  table MTZ.UNIQUECONSTRAINT add constraint fk_318 foreign key(ParentStructRowID) references MTZ.PART (PARTID)
/


alter  TABLE CONSTRAINTFIELD DROP CONSTRAINT fk_319
/
alter  table MTZ.CONSTRAINTFIELD add constraint fk_319 foreign key(ParentStructRowID) references MTZ.UNIQUECONSTRAINT (UNIQUECONSTRAINTID)
/


alter  TABLE INSTANCEVALIDATOR DROP CONSTRAINT fk_320
/
alter  table MTZ.INSTANCEVALIDATOR add constraint fk_320 foreign key(ParentStructRowID) references MTZ.OBJECTTYPE (OBJECTTYPEID)
/


alter  TABLE OBJSTATUS DROP CONSTRAINT fk_321
/
alter  table MTZ.OBJSTATUS add constraint fk_321 foreign key(ParentStructRowID) references MTZ.OBJECTTYPE (OBJECTTYPEID)
/


alter  TABLE NEXTSTATE DROP CONSTRAINT fk_322
/
alter  table MTZ.NEXTSTATE add constraint fk_322 foreign key(ParentStructRowID) references MTZ.OBJSTATUS (OBJSTATUSID)
/


alter  TABLE OBJECTMODE DROP CONSTRAINT fk_323
/
alter  table MTZ.OBJECTMODE add constraint fk_323 foreign key(ParentStructRowID) references MTZ.OBJECTTYPE (OBJECTTYPEID)
/


alter  TABLE STRUCTRESTRICTION DROP CONSTRAINT fk_324
/
alter  table MTZ.STRUCTRESTRICTION add constraint fk_324 foreign key(ParentStructRowID) references MTZ.OBJECTMODE (OBJECTMODEID)
/


alter  TABLE FIELDRESTRICTION DROP CONSTRAINT fk_325
/
alter  table MTZ.FIELDRESTRICTION add constraint fk_325 foreign key(ParentStructRowID) references MTZ.OBJECTMODE (OBJECTMODEID)
/


alter  TABLE METHODRESTRICTION DROP CONSTRAINT fk_326
/
alter  table MTZ.METHODRESTRICTION add constraint fk_326 foreign key(ParentStructRowID) references MTZ.OBJECTMODE (OBJECTMODEID)
/


alter  TABLE TYPEMENU DROP CONSTRAINT fk_327
/
alter  table MTZ.TYPEMENU add constraint fk_327 foreign key(ParentStructRowID) references MTZ.OBJECTTYPE (OBJECTTYPEID)
/


alter  TABLE MTZAPP DROP CONSTRAINT fk_328
/
alter  table MTZ.MTZAPP add constraint fk_328 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ParentPackage DROP CONSTRAINT fk_329
/
alter  table MTZ.ParentPackage add constraint fk_329 foreign key(ParentStructRowID) references MTZ.MTZAPP (MTZAPPID)
/


alter  TABLE GENPACKAGE DROP CONSTRAINT fk_330
/
alter  table MTZ.GENPACKAGE add constraint fk_330 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE GENERATOR_TARGET DROP CONSTRAINT fk_331
/
alter  table MTZ.GENERATOR_TARGET add constraint fk_331 foreign key(ParentStructRowID) references MTZ.GENPACKAGE (GENPACKAGEID)
/


alter  TABLE GENMANUALCODE DROP CONSTRAINT fk_332
/
alter  table MTZ.GENMANUALCODE add constraint fk_332 foreign key(ParentStructRowID) references MTZ.GENERATOR_TARGET (GENERATOR_TARGETID)
/


alter  TABLE GENCONTROLS DROP CONSTRAINT fk_333
/
alter  table MTZ.GENCONTROLS add constraint fk_333 foreign key(ParentStructRowID) references MTZ.GENERATOR_TARGET (GENERATOR_TARGETID)
/


alter  TABLE GENREFERENCE DROP CONSTRAINT fk_334
/
alter  table MTZ.GENREFERENCE add constraint fk_334 foreign key(ParentStructRowID) references MTZ.GENERATOR_TARGET (GENERATOR_TARGETID)
/


alter  TABLE LocalizeInfo DROP CONSTRAINT fk_658
/
alter  table MTZ.LocalizeInfo add constraint fk_658 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTNO_YC DROP CONSTRAINT fk_659
/
alter  table MTZ.ITTNO_YC add constraint fk_659 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTNO_CMN DROP CONSTRAINT fk_660
/
alter  table MTZ.ITTNO_CMN add constraint fk_660 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTNO_ZC DROP CONSTRAINT fk_661
/
alter  table MTZ.ITTNO_ZC add constraint fk_661 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE InfoStoreDef DROP CONSTRAINT fk_120
/
alter  table MTZ.InfoStoreDef add constraint fk_120 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE Folder DROP CONSTRAINT fk_121
/
alter  table MTZ.Folder add constraint fk_121 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE Shortcut DROP CONSTRAINT fk_122
/
alter  table MTZ.Shortcut add constraint fk_122 foreign key(ParentStructRowID) references MTZ.Folder (FolderID)
/


alter  TABLE Reports DROP CONSTRAINT fk_181
/
alter  table MTZ.Reports add constraint fk_181 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE RPTStruct DROP CONSTRAINT fk_182
/
alter  table MTZ.RPTStruct add constraint fk_182 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE RPTFields DROP CONSTRAINT fk_183
/
alter  table MTZ.RPTFields add constraint fk_183 foreign key(ParentStructRowID) references MTZ.RPTStruct (RPTStructID)
/


alter  TABLE RPTFormula DROP CONSTRAINT fk_184
/
alter  table MTZ.RPTFormula add constraint fk_184 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTPR_DEF DROP CONSTRAINT fk_662
/
alter  table MTZ.ITTPR_DEF add constraint fk_662 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE MTZExt_def DROP CONSTRAINT fk_581
/
alter  table MTZ.MTZExt_def add constraint fk_581 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE MTZExtRel DROP CONSTRAINT fk_591
/
alter  table MTZ.MTZExtRel add constraint fk_591 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTCS_LIN DROP CONSTRAINT fk_663
/
alter  table MTZ.ITTCS_LIN add constraint fk_663 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTCS_DEF DROP CONSTRAINT fk_664
/
alter  table MTZ.ITTCS_DEF add constraint fk_664 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE SysLog DROP CONSTRAINT fk_338
/
alter  table MTZ.SysLog add constraint fk_338 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE the_Session DROP CONSTRAINT fk_339
/
alter  table MTZ.the_Session add constraint fk_339 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE LogReader DROP CONSTRAINT fk_340
/
alter  table MTZ.LogReader add constraint fk_340 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE Verb DROP CONSTRAINT fk_341
/
alter  table MTZ.Verb add constraint fk_341 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE Users DROP CONSTRAINT fk_418
/
alter  table MTZ.Users add constraint fk_418 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE Groups DROP CONSTRAINT fk_419
/
alter  table MTZ.Groups add constraint fk_419 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE GroupUser DROP CONSTRAINT fk_420
/
alter  table MTZ.GroupUser add constraint fk_420 foreign key(ParentStructRowID) references MTZ.Groups (GroupsID)
/


alter  TABLE MTZSEC_RIGHT DROP CONSTRAINT fk_185
/
alter  table MTZ.MTZSEC_RIGHT add constraint fk_185 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ROLES_USER DROP CONSTRAINT fk_281
/
alter  table MTZ.ROLES_USER add constraint fk_281 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ROLES_MAP DROP CONSTRAINT fk_282
/
alter  table MTZ.ROLES_MAP add constraint fk_282 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ROLES_DOC DROP CONSTRAINT fk_556
/
alter  table MTZ.ROLES_DOC add constraint fk_556 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ROLES_DOC_STATE DROP CONSTRAINT fk_557
/
alter  table MTZ.ROLES_DOC_STATE add constraint fk_557 foreign key(ParentStructRowID) references MTZ.ROLES_DOC (ROLES_DOCID)
/


alter  TABLE ROLES_DEF DROP CONSTRAINT fk_283
/
alter  table MTZ.ROLES_DEF add constraint fk_283 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ROLES_REPORTS DROP CONSTRAINT fk_558
/
alter  table MTZ.ROLES_REPORTS add constraint fk_558 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ROLES_WP DROP CONSTRAINT fk_285
/
alter  table MTZ.ROLES_WP add constraint fk_285 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ROLES_ACT DROP CONSTRAINT fk_559
/
alter  table MTZ.ROLES_ACT add constraint fk_559 foreign key(ParentStructRowID) references MTZ.ROLES_WP (ROLES_WPID)
/


alter  TABLE JournalColumn DROP CONSTRAINT fk_168
/
alter  table MTZ.JournalColumn add constraint fk_168 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE JColumnSource DROP CONSTRAINT fk_169
/
alter  table MTZ.JColumnSource add constraint fk_169 foreign key(ParentStructRowID) references MTZ.JournalColumn (JournalColumnID)
/


alter  TABLE Journal DROP CONSTRAINT fk_170
/
alter  table MTZ.Journal add constraint fk_170 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE JournalSrc DROP CONSTRAINT fk_171
/
alter  table MTZ.JournalSrc add constraint fk_171 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE MTZ_Inst_Build DROP CONSTRAINT fk_665
/
alter  table MTZ.MTZ_Inst_Build add constraint fk_665 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE MTZ_Inst_Build_Sec DROP CONSTRAINT fk_666
/
alter  table MTZ.MTZ_Inst_Build_Sec add constraint fk_666 foreign key(ParentStructRowID) references MTZ.MTZ_Inst_Build (MTZ_Inst_BuildID)
/


alter  TABLE MTZ_Inst_Section DROP CONSTRAINT fk_667
/
alter  table MTZ.MTZ_Inst_Section add constraint fk_667 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE MTZ_Inst_Sec_Files DROP CONSTRAINT fk_668
/
alter  table MTZ.MTZ_Inst_Sec_Files add constraint fk_668 foreign key(ParentStructRowID) references MTZ.MTZ_Inst_Section (MTZ_Inst_SectionID)
/


alter  TABLE MTZ_Inst_Common DROP CONSTRAINT fk_669
/
alter  table MTZ.MTZ_Inst_Common add constraint fk_669 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTTZ_DEF DROP CONSTRAINT fk_670
/
alter  table MTZ.ITTTZ_DEF add constraint fk_670 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTTZ_LINES DROP CONSTRAINT fk_671
/
alter  table MTZ.ITTTZ_LINES add constraint fk_671 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITT2OPT_DEF DROP CONSTRAINT fk_672
/
alter  table MTZ.ITT2OPT_DEF add constraint fk_672 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTOUT_SRV DROP CONSTRAINT fk_673
/
alter  table MTZ.ITTOUT_SRV add constraint fk_673 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTOUT_DEF DROP CONSTRAINT fk_674
/
alter  table MTZ.ITTOUT_DEF add constraint fk_674 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTOUT_EPL DROP CONSTRAINT fk_675
/
alter  table MTZ.ITTOUT_EPL add constraint fk_675 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTOUT_LINES DROP CONSTRAINT fk_676
/
alter  table MTZ.ITTOUT_LINES add constraint fk_676 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTOUT_PALET DROP CONSTRAINT fk_677
/
alter  table MTZ.ITTOUT_PALET add constraint fk_677 foreign key(ParentStructRowID) references MTZ.ITTOUT_LINES (ITTOUT_LINESID)
/


alter  TABLE ITTIN_QLINE DROP CONSTRAINT fk_678
/
alter  table MTZ.ITTIN_QLINE add constraint fk_678 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTIN_PALET DROP CONSTRAINT fk_679
/
alter  table MTZ.ITTIN_PALET add constraint fk_679 foreign key(ParentStructRowID) references MTZ.ITTIN_QLINE (ITTIN_QLINEID)
/


alter  TABLE ITTIN_SRV DROP CONSTRAINT fk_680
/
alter  table MTZ.ITTIN_SRV add constraint fk_680 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTIN_DEF DROP CONSTRAINT fk_681
/
alter  table MTZ.ITTIN_DEF add constraint fk_681 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTIN_EPL DROP CONSTRAINT fk_682
/
alter  table MTZ.ITTIN_EPL add constraint fk_682 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTSSCC_LINE DROP CONSTRAINT fk_683
/
alter  table MTZ.ITTSSCC_LINE add constraint fk_683 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ITTSSCC_DEF DROP CONSTRAINT fk_684
/
alter  table MTZ.ITTSSCC_DEF add constraint fk_684 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE WorkPlace DROP CONSTRAINT fk_165
/
alter  table MTZ.WorkPlace add constraint fk_165 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE EntryPoints DROP CONSTRAINT fk_583
/
alter  table MTZ.EntryPoints add constraint fk_583 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE EPFilterLink DROP CONSTRAINT fk_590
/
alter  table MTZ.EPFilterLink add constraint fk_590 foreign key(ParentStructRowID) references MTZ.EntryPoints (EntryPointsID)
/


alter  TABLE ARMTypes DROP CONSTRAINT fk_584
/
alter  table MTZ.ARMTypes add constraint fk_584 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ARMJournal DROP CONSTRAINT fk_585
/
alter  table MTZ.ARMJournal add constraint fk_585 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE ARMJRNLADD DROP CONSTRAINT fk_586
/
alter  table MTZ.ARMJRNLADD add constraint fk_586 foreign key(ParentStructRowID) references MTZ.ARMJournal (ARMJournalID)
/


alter  TABLE ARMJRNLREP DROP CONSTRAINT fk_587
/
alter  table MTZ.ARMJRNLREP add constraint fk_587 foreign key(ParentStructRowID) references MTZ.ARMJournal (ARMJournalID)
/


alter  TABLE ARMJRNLRUN DROP CONSTRAINT fk_588
/
alter  table MTZ.ARMJRNLRUN add constraint fk_588 foreign key(ParentStructRowID) references MTZ.ARMJournal (ARMJournalID)
/


alter  TABLE WEBS_MAILLIST DROP CONSTRAINT fk_685
/
alter  table MTZ.WEBS_MAILLIST add constraint fk_685 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE WEBS_ROLES DROP CONSTRAINT fk_686
/
alter  table MTZ.WEBS_ROLES add constraint fk_686 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE WEBS_PAGEDEF DROP CONSTRAINT fk_687
/
alter  table MTZ.WEBS_PAGEDEF add constraint fk_687 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE WEBS_PICS DROP CONSTRAINT fk_688
/
alter  table MTZ.WEBS_PICS add constraint fk_688 foreign key(ParentStructRowID) references MTZ.WEBS_PAGEDEF (WEBS_PAGEDEFID)
/


alter  TABLE WEBS_PAGEMENU DROP CONSTRAINT fk_689
/
alter  table MTZ.WEBS_PAGEMENU add constraint fk_689 foreign key(ParentStructRowID) references MTZ.WEBS_PAGEDEF (WEBS_PAGEDEFID)
/


alter  TABLE WEBS_PAGECONTENT DROP CONSTRAINT fk_690
/
alter  table MTZ.WEBS_PAGECONTENT add constraint fk_690 foreign key(ParentStructRowID) references MTZ.WEBS_PAGEDEF (WEBS_PAGEDEFID)
/


alter  TABLE WEBS_PAGEPARS DROP CONSTRAINT fk_691
/
alter  table MTZ.WEBS_PAGEPARS add constraint fk_691 foreign key(ParentStructRowID) references MTZ.WEBS_PAGEDEF (WEBS_PAGEDEFID)
/


alter  TABLE WEBS_PAGECOMP DROP CONSTRAINT fk_692
/
alter  table MTZ.WEBS_PAGECOMP add constraint fk_692 foreign key(ParentStructRowID) references MTZ.WEBS_PAGEDEF (WEBS_PAGEDEFID)
/


alter  TABLE TablePart DROP CONSTRAINT fk_693
/
alter  table MTZ.TablePart add constraint fk_693 foreign key(ParentStructRowID) references MTZ.WEBS_PAGECOMP (WEBS_PAGECOMPID)
/


alter  TABLE ReplaceValues DROP CONSTRAINT fk_694
/
alter  table MTZ.ReplaceValues add constraint fk_694 foreign key(ParentStructRowID) references MTZ.WEBS_PAGECOMP (WEBS_PAGECOMPID)
/


alter  TABLE DenyEdit DROP CONSTRAINT fk_695
/
alter  table MTZ.DenyEdit add constraint fk_695 foreign key(ParentStructRowID) references MTZ.WEBS_PAGECOMP (WEBS_PAGECOMPID)
/


alter  TABLE DenyVisible DROP CONSTRAINT fk_696
/
alter  table MTZ.DenyVisible add constraint fk_696 foreign key(ParentStructRowID) references MTZ.WEBS_PAGECOMP (WEBS_PAGECOMPID)
/


alter  TABLE AllowEditFieldValues DROP CONSTRAINT fk_697
/
alter  table MTZ.AllowEditFieldValues add constraint fk_697 foreign key(ParentStructRowID) references MTZ.WEBS_PAGECOMP (WEBS_PAGECOMPID)
/


alter  TABLE ComboFields DROP CONSTRAINT fk_698
/
alter  table MTZ.ComboFields add constraint fk_698 foreign key(ParentStructRowID) references MTZ.WEBS_PAGECOMP (WEBS_PAGECOMPID)
/


alter  TABLE WEBS_USERS DROP CONSTRAINT fk_699
/
alter  table MTZ.WEBS_USERS add constraint fk_699 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE WEBS_ANKETA DROP CONSTRAINT fk_700
/
alter  table MTZ.WEBS_ANKETA add constraint fk_700 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE WEBS_QUESTIONS DROP CONSTRAINT fk_701
/
alter  table MTZ.WEBS_QUESTIONS add constraint fk_701 foreign key(ParentStructRowID) references MTZ.WEBS_ANKETA (WEBS_ANKETAID)
/


alter  TABLE WEBS_ANSWERS DROP CONSTRAINT fk_702
/
alter  table MTZ.WEBS_ANSWERS add constraint fk_702 foreign key(ParentStructRowID) references MTZ.WEBS_QUESTIONS (WEBS_QUESTIONSID)
/


alter  TABLE WEBS_DDOC DROP CONSTRAINT fk_703
/
alter  table MTZ.WEBS_DDOC add constraint fk_703 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE WEBS_NEWS DROP CONSTRAINT fk_704
/
alter  table MTZ.WEBS_NEWS add constraint fk_704 foreign key(INSTANCEID) references MTZ.INSTANCE (INSTANCEID)
/


alter  TABLE NEWS_PICS DROP CONSTRAINT fk_705
/
alter  table MTZ.NEWS_PICS add constraint fk_705 foreign key(ParentStructRowID) references MTZ.WEBS_NEWS (WEBS_NEWSID)
/




