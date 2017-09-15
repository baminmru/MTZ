
/* --ForeignKey*/

 

alter  TABLE FilterFieldGroup DROP CONSTRAINT fk_195
;
alter  table FilterFieldGroup add constraint fk_195 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE FileterField DROP CONSTRAINT fk_196
;
alter  table FileterField add constraint fk_196 foreign key(ParentStructRowID) references FilterFieldGroup (FilterFieldGroupID)
;


alter  TABLE Filters DROP CONSTRAINT fk_197
;
alter  table Filters add constraint fk_197 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEK103_DEF DROP CONSTRAINT fk_474
;
alter  table PEK103_DEF add constraint fk_474 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEK103_LINES DROP CONSTRAINT fk_475
;
alter  table PEK103_LINES add constraint fk_475 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBC_BLOCK DROP CONSTRAINT fk_149
;
alter  table WEBC_BLOCK add constraint fk_149 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBC_NEWS DROP CONSTRAINT fk_150
;
alter  table WEBC_NEWS add constraint fk_150 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBC_JOB DROP CONSTRAINT fk_548
;
alter  table WEBC_JOB add constraint fk_548 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBC_MESSAGES DROP CONSTRAINT fk_589
;
alter  table WEBC_MESSAGES add constraint fk_589 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBC_DOCS DROP CONSTRAINT fk_549
;
alter  table WEBC_DOCS add constraint fk_549 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBC_FILIALS DROP CONSTRAINT fk_550
;
alter  table WEBC_FILIALS add constraint fk_550 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBC_LINKS DROP CONSTRAINT fk_551
;
alter  table WEBC_LINKS add constraint fk_551 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRRPT_COSTS DROP CONSTRAINT fk_216
;
alter  table VRRPT_COSTS add constraint fk_216 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRRPT_MeetingPlan DROP CONSTRAINT fk_217
;
alter  table VRRPT_MeetingPlan add constraint fk_217 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRRPT_Meeters DROP CONSTRAINT fk_218
;
alter  table VRRPT_Meeters add constraint fk_218 foreign key(ParentStructRowID) references VRRPT_MeetingPlan (VRRPT_MeetingPlanID)
;


alter  TABLE VRRPT_MAIN DROP CONSTRAINT fk_219
;
alter  table VRRPT_MAIN add constraint fk_219 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDGCommon DROP CONSTRAINT fk_55
;
alter  table VRDGCommon add constraint fk_55 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDGReport DROP CONSTRAINT fk_56
;
alter  table VRDGReport add constraint fk_56 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDGContractChanges DROP CONSTRAINT fk_58
;
alter  table VRDGContractChanges add constraint fk_58 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDGContractVersion DROP CONSTRAINT fk_60
;
alter  table VRDGContractVersion add constraint fk_60 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDGContractSpesial DROP CONSTRAINT fk_61
;
alter  table VRDGContractSpesial add constraint fk_61 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKSH_DATA DROP CONSTRAINT fk_545
;
alter  table PEKSH_DATA add constraint fk_545 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKSH_START DROP CONSTRAINT fk_546
;
alter  table PEKSH_START add constraint fk_546 foreign key(ParentStructRowID) references PEKSH_DATA (PEKSH_DATAID)
;


alter  TABLE PEKSH_DEF DROP CONSTRAINT fk_547
;
alter  table PEKSH_DEF add constraint fk_547 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE MTZ2JOB_DEF DROP CONSTRAINT fk_580
;
alter  table MTZ2JOB_DEF add constraint fk_580 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKPAY_DEF DROP CONSTRAINT fk_603
;
alter  table PEKPAY_DEF add constraint fk_603 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBSDIC_DEF DROP CONSTRAINT fk_619
;
alter  table WEBSDIC_DEF add constraint fk_619 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PWUUSERS DROP CONSTRAINT fk_706
;
alter  table PWUUSERS add constraint fk_706 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE pekz_path DROP CONSTRAINT fk_79
;
alter  table pekz_path add constraint fk_79 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKZ_WLIST DROP CONSTRAINT fk_596
;
alter  table PEKZ_WLIST add constraint fk_596 foreign key(ParentStructRowID) references pekz_path (pekz_pathID)
;


alter  TABLE PEKZ_WLADDS DROP CONSTRAINT fk_597
;
alter  table PEKZ_WLADDS add constraint fk_597 foreign key(ParentStructRowID) references PEKZ_WLIST (PEKZ_WLISTID)
;


alter  TABLE PEKZ_DOCS DROP CONSTRAINT fk_80
;
alter  table PEKZ_DOCS add constraint fk_80 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE pekz_def DROP CONSTRAINT fk_81
;
alter  table pekz_def add constraint fk_81 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKZ_ACLCT DROP CONSTRAINT fk_707
;
alter  table PEKZ_ACLCT add constraint fk_707 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKZ_ADLVR DROP CONSTRAINT fk_708
;
alter  table PEKZ_ADLVR add constraint fk_708 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE pekz_dop DROP CONSTRAINT fk_82
;
alter  table pekz_dop add constraint fk_82 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE REPD_LOCKED DROP CONSTRAINT fk_527
;
alter  table REPD_LOCKED add constraint fk_527 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE REPD_RequestQuery DROP CONSTRAINT fk_528
;
alter  table REPD_RequestQuery add constraint fk_528 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE REPD_ResQueryRcv DROP CONSTRAINT fk_529
;
alter  table REPD_ResQueryRcv add constraint fk_529 foreign key(ParentStructRowID) references REPD_RequestQuery (REPD_RequestQueryID)
;


alter  TABLE REPD_PROV DROP CONSTRAINT fk_530
;
alter  table REPD_PROV add constraint fk_530 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE REPD_SRV DROP CONSTRAINT fk_531
;
alter  table REPD_SRV add constraint fk_531 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE REPD_SNDTO DROP CONSTRAINT fk_532
;
alter  table REPD_SNDTO add constraint fk_532 foreign key(ParentStructRowID) references REPD_SRV (REPD_SRVID)
;


alter  TABLE REPD_CONST DROP CONSTRAINT fk_621
;
alter  table REPD_CONST add constraint fk_621 foreign key(ParentStructRowID) references REPD_SNDTO (REPD_SNDTOID)
;


alter  TABLE REPD_REPTYPE DROP CONSTRAINT fk_622
;
alter  table REPD_REPTYPE add constraint fk_622 foreign key(ParentStructRowID) references REPD_SNDTO (REPD_SNDTOID)
;


alter  TABLE REPD_SendQ DROP CONSTRAINT fk_533
;
alter  table REPD_SendQ add constraint fk_533 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE REPD_RecvQ DROP CONSTRAINT fk_534
;
alter  table REPD_RecvQ add constraint fk_534 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE StateAction DROP CONSTRAINT fk_64
;
alter  table StateAction add constraint fk_64 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE TheDiffPath DROP CONSTRAINT fk_709
;
alter  table TheDiffPath add constraint fk_709 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE DopUslTo DROP CONSTRAINT fk_710
;
alter  table DopUslTo add constraint fk_710 foreign key(ParentStructRowID) references TheDiffPath (TheDiffPathID)
;


alter  TABLE DopUslFrom DROP CONSTRAINT fk_711
;
alter  table DopUslFrom add constraint fk_711 foreign key(ParentStructRowID) references TheDiffPath (TheDiffPathID)
;


alter  TABLE TheDefenitionDiffP DROP CONSTRAINT fk_712
;
alter  table TheDefenitionDiffP add constraint fk_712 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKACT_DEF DROP CONSTRAINT fk_604
;
alter  table PEKACT_DEF add constraint fk_604 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKACT_ITOG DROP CONSTRAINT fk_605
;
alter  table PEKACT_ITOG add constraint fk_605 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKACT_LINES DROP CONSTRAINT fk_606
;
alter  table PEKACT_LINES add constraint fk_606 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE FIELDTYPE DROP CONSTRAINT fk_299
;
alter  table FIELDTYPE add constraint fk_299 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE FIELDTYPEMAP DROP CONSTRAINT fk_300
;
alter  table FIELDTYPEMAP add constraint fk_300 foreign key(ParentStructRowID) references FIELDTYPE (FIELDTYPEID)
;


alter  TABLE ENUMITEM DROP CONSTRAINT fk_301
;
alter  table ENUMITEM add constraint fk_301 foreign key(ParentStructRowID) references FIELDTYPE (FIELDTYPEID)
;


alter  TABLE SHAREDMETHOD DROP CONSTRAINT fk_302
;
alter  table SHAREDMETHOD add constraint fk_302 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE SCRIPT DROP CONSTRAINT fk_303
;
alter  table SCRIPT add constraint fk_303 foreign key(ParentStructRowID) references SHAREDMETHOD (SHAREDMETHODID)
;


alter  TABLE PARAMETERS DROP CONSTRAINT fk_304
;
alter  table PARAMETERS add constraint fk_304 foreign key(ParentStructRowID) references SCRIPT (SCRIPTID)
;


alter  TABLE OBJECTTYPE DROP CONSTRAINT fk_305
;
alter  table OBJECTTYPE add constraint fk_305 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PART DROP CONSTRAINT fk_306
;
alter  table PART add constraint fk_306 foreign key(ParentStructRowID) references OBJECTTYPE (OBJECTTYPEID)
;


alter  TABLE PARTMENU DROP CONSTRAINT fk_307
;
alter  table PARTMENU add constraint fk_307 foreign key(ParentStructRowID) references PART (PARTID)
;


alter  TABLE PARTPARAMMAP DROP CONSTRAINT fk_308
;
alter  table PARTPARAMMAP add constraint fk_308 foreign key(ParentStructRowID) references PARTMENU (PARTMENUID)
;


alter  TABLE FIELD DROP CONSTRAINT fk_309
;
alter  table FIELD add constraint fk_309 foreign key(ParentStructRowID) references PART (PARTID)
;


alter  TABLE FIELDVALIDATOR DROP CONSTRAINT fk_310
;
alter  table FIELDVALIDATOR add constraint fk_310 foreign key(ParentStructRowID) references FIELD (FIELDID)
;


alter  TABLE FIELDMENU DROP CONSTRAINT fk_311
;
alter  table FIELDMENU add constraint fk_311 foreign key(ParentStructRowID) references FIELD (FIELDID)
;


alter  TABLE FIELDPARAMMAP DROP CONSTRAINT fk_312
;
alter  table FIELDPARAMMAP add constraint fk_312 foreign key(ParentStructRowID) references FIELDMENU (FIELDMENUID)
;


alter  TABLE FldExtenders DROP CONSTRAINT fk_654
;
alter  table FldExtenders add constraint fk_654 foreign key(ParentStructRowID) references FIELD (FIELDID)
;


alter  TABLE FIELDEXPRESSION DROP CONSTRAINT fk_313
;
alter  table FIELDEXPRESSION add constraint fk_313 foreign key(ParentStructRowID) references FIELD (FIELDID)
;


alter  TABLE DINAMICFILTERSCRIPT DROP CONSTRAINT fk_314
;
alter  table DINAMICFILTERSCRIPT add constraint fk_314 foreign key(ParentStructRowID) references FIELD (FIELDID)
;


alter  TABLE FIELDSRCDEF DROP CONSTRAINT fk_655
;
alter  table FIELDSRCDEF add constraint fk_655 foreign key(ParentStructRowID) references FIELD (FIELDID)
;


alter  TABLE PARTVIEW DROP CONSTRAINT fk_315
;
alter  table PARTVIEW add constraint fk_315 foreign key(ParentStructRowID) references PART (PARTID)
;


alter  TABLE ViewColumn DROP CONSTRAINT fk_316
;
alter  table ViewColumn add constraint fk_316 foreign key(ParentStructRowID) references PARTVIEW (PARTVIEWID)
;


alter  TABLE PARTVIEW_LNK DROP CONSTRAINT fk_656
;
alter  table PARTVIEW_LNK add constraint fk_656 foreign key(ParentStructRowID) references PARTVIEW (PARTVIEWID)
;


alter  TABLE ExtenderInterface DROP CONSTRAINT fk_657
;
alter  table ExtenderInterface add constraint fk_657 foreign key(ParentStructRowID) references PART (PARTID)
;


alter  TABLE VALIDATOR DROP CONSTRAINT fk_317
;
alter  table VALIDATOR add constraint fk_317 foreign key(ParentStructRowID) references PART (PARTID)
;


alter  TABLE UNIQUECONSTRAINT DROP CONSTRAINT fk_318
;
alter  table UNIQUECONSTRAINT add constraint fk_318 foreign key(ParentStructRowID) references PART (PARTID)
;


alter  TABLE CONSTRAINTFIELD DROP CONSTRAINT fk_319
;
alter  table CONSTRAINTFIELD add constraint fk_319 foreign key(ParentStructRowID) references UNIQUECONSTRAINT (UNIQUECONSTRAINTID)
;


alter  TABLE INSTANCEVALIDATOR DROP CONSTRAINT fk_320
;
alter  table INSTANCEVALIDATOR add constraint fk_320 foreign key(ParentStructRowID) references OBJECTTYPE (OBJECTTYPEID)
;


alter  TABLE OBJSTATUS DROP CONSTRAINT fk_321
;
alter  table OBJSTATUS add constraint fk_321 foreign key(ParentStructRowID) references OBJECTTYPE (OBJECTTYPEID)
;


alter  TABLE NEXTSTATE DROP CONSTRAINT fk_322
;
alter  table NEXTSTATE add constraint fk_322 foreign key(ParentStructRowID) references OBJSTATUS (OBJSTATUSID)
;


alter  TABLE OBJECTMODE DROP CONSTRAINT fk_323
;
alter  table OBJECTMODE add constraint fk_323 foreign key(ParentStructRowID) references OBJECTTYPE (OBJECTTYPEID)
;


alter  TABLE STRUCTRESTRICTION DROP CONSTRAINT fk_324
;
alter  table STRUCTRESTRICTION add constraint fk_324 foreign key(ParentStructRowID) references OBJECTMODE (OBJECTMODEID)
;


alter  TABLE FIELDRESTRICTION DROP CONSTRAINT fk_325
;
alter  table FIELDRESTRICTION add constraint fk_325 foreign key(ParentStructRowID) references OBJECTMODE (OBJECTMODEID)
;


alter  TABLE METHODRESTRICTION DROP CONSTRAINT fk_326
;
alter  table METHODRESTRICTION add constraint fk_326 foreign key(ParentStructRowID) references OBJECTMODE (OBJECTMODEID)
;


alter  TABLE TYPEMENU DROP CONSTRAINT fk_327
;
alter  table TYPEMENU add constraint fk_327 foreign key(ParentStructRowID) references OBJECTTYPE (OBJECTTYPEID)
;


alter  TABLE MTZAPP DROP CONSTRAINT fk_328
;
alter  table MTZAPP add constraint fk_328 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ParentPackage DROP CONSTRAINT fk_329
;
alter  table ParentPackage add constraint fk_329 foreign key(ParentStructRowID) references MTZAPP (MTZAPPID)
;


alter  TABLE GENPACKAGE DROP CONSTRAINT fk_330
;
alter  table GENPACKAGE add constraint fk_330 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE GENERATOR_TARGET DROP CONSTRAINT fk_331
;
alter  table GENERATOR_TARGET add constraint fk_331 foreign key(ParentStructRowID) references GENPACKAGE (GENPACKAGEID)
;


alter  TABLE GENMANUALCODE DROP CONSTRAINT fk_332
;
alter  table GENMANUALCODE add constraint fk_332 foreign key(ParentStructRowID) references GENERATOR_TARGET (GENERATOR_TARGETID)
;


alter  TABLE GENCONTROLS DROP CONSTRAINT fk_333
;
alter  table GENCONTROLS add constraint fk_333 foreign key(ParentStructRowID) references GENERATOR_TARGET (GENERATOR_TARGETID)
;


alter  TABLE GENREFERENCE DROP CONSTRAINT fk_334
;
alter  table GENREFERENCE add constraint fk_334 foreign key(ParentStructRowID) references GENERATOR_TARGET (GENERATOR_TARGETID)
;


alter  TABLE LocalizeInfo DROP CONSTRAINT fk_658
;
alter  table LocalizeInfo add constraint fk_658 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKPQ_DEF DROP CONSTRAINT fk_598
;
alter  table PEKPQ_DEF add constraint fk_598 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ENTDIC_BANK DROP CONSTRAINT fk_388
;
alter  table ENTDIC_BANK add constraint fk_388 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ENTDIC_DOST DROP CONSTRAINT fk_390
;
alter  table ENTDIC_DOST add constraint fk_390 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ENTDIC_TOWN DROP CONSTRAINT fk_391
;
alter  table ENTDIC_TOWN add constraint fk_391 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ENTDIC_TransportType DROP CONSTRAINT fk_713
;
alter  table ENTDIC_TransportType add constraint fk_713 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ENTDIC_OPF DROP CONSTRAINT fk_714
;
alter  table ENTDIC_OPF add constraint fk_714 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ENTDIC_EDIZM DROP CONSTRAINT fk_398
;
alter  table ENTDIC_EDIZM add constraint fk_398 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ENTDIC_CURRENCY DROP CONSTRAINT fk_404
;
alter  table ENTDIC_CURRENCY add constraint fk_404 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ENTDIC_CURCOURCE DROP CONSTRAINT fk_405
;
alter  table ENTDIC_CURCOURCE add constraint fk_405 foreign key(ParentStructRowID) references ENTDIC_CURRENCY (ENTDIC_CURRENCYID)
;


alter  TABLE ENTDIC_COUNTRY DROP CONSTRAINT fk_410
;
alter  table ENTDIC_COUNTRY add constraint fk_410 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ENTDIC_REGION DROP CONSTRAINT fk_414
;
alter  table ENTDIC_REGION add constraint fk_414 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ST_MAIN DROP CONSTRAINT fk_623
;
alter  table ST_MAIN add constraint fk_623 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ST_DEF DROP CONSTRAINT fk_624
;
alter  table ST_DEF add constraint fk_624 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ST_PAGES DROP CONSTRAINT fk_625
;
alter  table ST_PAGES add constraint fk_625 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE STDJournlaExtInfo DROP CONSTRAINT fk_648
;
alter  table STDJournlaExtInfo add constraint fk_648 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE STDJournalExtParam DROP CONSTRAINT fk_649
;
alter  table STDJournalExtParam add constraint fk_649 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE STDJournalExtFlt DROP CONSTRAINT fk_650
;
alter  table STDJournalExtFlt add constraint fk_650 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE STDJournalExtField DROP CONSTRAINT fk_715
;
alter  table STDJournalExtField add constraint fk_715 foreign key(ParentStructRowID) references STDJournalExtFlt (STDJournalExtFltID)
;


alter  TABLE CAL_DAYS DROP CONSTRAINT fk_98
;
alter  table CAL_DAYS add constraint fk_98 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE CAL_TIME DROP CONSTRAINT fk_99
;
alter  table CAL_TIME add constraint fk_99 foreign key(ParentStructRowID) references CAL_DAYS (CAL_DAYSID)
;


alter  TABLE CAL_HEAD DROP CONSTRAINT fk_100
;
alter  table CAL_HEAD add constraint fk_100 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE SrvMessageInfo DROP CONSTRAINT fk_296
;
alter  table SrvMessageInfo add constraint fk_296 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKNAL_DEF DROP CONSTRAINT fk_599
;
alter  table PEKNAL_DEF add constraint fk_599 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKNAL_PZ DROP CONSTRAINT fk_607
;
alter  table PEKNAL_PZ add constraint fk_607 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKNAL_ROWS DROP CONSTRAINT fk_716
;
alter  table PEKNAL_ROWS add constraint fk_716 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE FileDef DROP CONSTRAINT fk_467
;
alter  table FileDef add constraint fk_467 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE FileVersion DROP CONSTRAINT fk_468
;
alter  table FileVersion add constraint fk_468 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE Num_zones DROP CONSTRAINT fk_161
;
alter  table Num_zones add constraint fk_161 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE Num_Values DROP CONSTRAINT fk_162
;
alter  table Num_Values add constraint fk_162 foreign key(ParentStructRowID) references Num_zones (Num_zonesID)
;


alter  TABLE Num_head DROP CONSTRAINT fk_163
;
alter  table Num_head add constraint fk_163 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE BaseSetting DROP CONSTRAINT fk_717
;
alter  table BaseSetting add constraint fk_717 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE Reports DROP CONSTRAINT fk_181
;
alter  table Reports add constraint fk_181 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE RPTStruct DROP CONSTRAINT fk_182
;
alter  table RPTStruct add constraint fk_182 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE RPTFields DROP CONSTRAINT fk_183
;
alter  table RPTFields add constraint fk_183 foreign key(ParentStructRowID) references RPTStruct (RPTStructID)
;


alter  TABLE RPTFormula DROP CONSTRAINT fk_184
;
alter  table RPTFormula add constraint fk_184 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKRKO_DEF DROP CONSTRAINT fk_718
;
alter  table PEKRKO_DEF add constraint fk_718 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKRKO_ROWS DROP CONSTRAINT fk_719
;
alter  table PEKRKO_ROWS add constraint fk_719 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKTRF_REGALL DROP CONSTRAINT fk_540
;
alter  table PEKTRF_REGALL add constraint fk_540 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKTRF_DECR DROP CONSTRAINT fk_539
;
alter  table PEKTRF_DECR add constraint fk_539 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKTRF_ADDS DROP CONSTRAINT fk_538
;
alter  table PEKTRF_ADDS add constraint fk_538 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKTRF_DEF DROP CONSTRAINT fk_456
;
alter  table PEKTRF_DEF add constraint fk_456 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKTRF_AUTO DROP CONSTRAINT fk_720
;
alter  table PEKTRF_AUTO add constraint fk_720 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKTRF_SRV DROP CONSTRAINT fk_457
;
alter  table PEKTRF_SRV add constraint fk_457 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKTRF_TR DROP CONSTRAINT fk_458
;
alter  table PEKTRF_TR add constraint fk_458 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKTRF_REGRTR DROP CONSTRAINT fk_537
;
alter  table PEKTRF_REGRTR add constraint fk_537 foreign key(ParentStructRowID) references PEKTRF_TR (PEKTRF_TRID)
;


alter  TABLE PEKCL_DEF DROP CONSTRAINT fk_459
;
alter  table PEKCL_DEF add constraint fk_459 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKCL_DAYLY DROP CONSTRAINT fk_460
;
alter  table PEKCL_DAYLY add constraint fk_460 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKL_TOLOAD DROP CONSTRAINT fk_461
;
alter  table PEKL_TOLOAD add constraint fk_461 foreign key(ParentStructRowID) references PEKCL_DAYLY (PEKCL_DAYLYID)
;


alter  TABLE MTZExt_def DROP CONSTRAINT fk_581
;
alter  table MTZExt_def add constraint fk_581 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE MTZExtRel DROP CONSTRAINT fk_591
;
alter  table MTZExtRel add constraint fk_591 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE InfoStoreDef DROP CONSTRAINT fk_120
;
alter  table InfoStoreDef add constraint fk_120 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE Folder DROP CONSTRAINT fk_121
;
alter  table Folder add constraint fk_121 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE Shortcut DROP CONSTRAINT fk_122
;
alter  table Shortcut add constraint fk_122 foreign key(ParentStructRowID) references Folder (FolderID)
;


alter  TABLE PEKP_DEF DROP CONSTRAINT fk_208
;
alter  table PEKP_DEF add constraint fk_208 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKP_PZ DROP CONSTRAINT fk_608
;
alter  table PEKP_PZ add constraint fk_608 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE SysLog DROP CONSTRAINT fk_338
;
alter  table SysLog add constraint fk_338 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE the_Session DROP CONSTRAINT fk_339
;
alter  table the_Session add constraint fk_339 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE LogReader DROP CONSTRAINT fk_340
;
alter  table LogReader add constraint fk_340 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE Verb DROP CONSTRAINT fk_341
;
alter  table Verb add constraint fk_341 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE Users DROP CONSTRAINT fk_418
;
alter  table Users add constraint fk_418 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE Groups DROP CONSTRAINT fk_419
;
alter  table Groups add constraint fk_419 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE GroupUser DROP CONSTRAINT fk_420
;
alter  table GroupUser add constraint fk_420 foreign key(ParentStructRowID) references Groups (GroupsID)
;


alter  TABLE VRDContractStage DROP CONSTRAINT fk_424
;
alter  table VRDContractStage add constraint fk_424 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDRreportType DROP CONSTRAINT fk_425
;
alter  table VRDRreportType add constraint fk_425 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDPrjType DROP CONSTRAINT fk_426
;
alter  table VRDPrjType add constraint fk_426 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDStream DROP CONSTRAINT fk_427
;
alter  table VRDStream add constraint fk_427 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDInterest DROP CONSTRAINT fk_428
;
alter  table VRDInterest add constraint fk_428 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDDocType DROP CONSTRAINT fk_429
;
alter  table VRDDocType add constraint fk_429 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDLoyalty DROP CONSTRAINT fk_430
;
alter  table VRDLoyalty add constraint fk_430 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRDMarket DROP CONSTRAINT fk_431
;
alter  table VRDMarket add constraint fk_431 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE MTZSEC_RIGHT DROP CONSTRAINT fk_185
;
alter  table MTZSEC_RIGHT add constraint fk_185 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCAccounts DROP CONSTRAINT fk_126
;
alter  table VRCAccounts add constraint fk_126 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCTorg DROP CONSTRAINT fk_131
;
alter  table VRCTorg add constraint fk_131 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCAditional DROP CONSTRAINT fk_554
;
alter  table VRCAditional add constraint fk_554 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCTarif DROP CONSTRAINT fk_721
;
alter  table VRCTarif add constraint fk_721 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCCommonInfo DROP CONSTRAINT fk_136
;
alter  table VRCCommonInfo add constraint fk_136 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ROLES_USER DROP CONSTRAINT fk_281
;
alter  table ROLES_USER add constraint fk_281 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ROLES_MAP DROP CONSTRAINT fk_282
;
alter  table ROLES_MAP add constraint fk_282 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ROLES_DOC DROP CONSTRAINT fk_556
;
alter  table ROLES_DOC add constraint fk_556 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ROLES_DOC_STATE DROP CONSTRAINT fk_557
;
alter  table ROLES_DOC_STATE add constraint fk_557 foreign key(ParentStructRowID) references ROLES_DOC (ROLES_DOCID)
;


alter  TABLE ROLES_DEF DROP CONSTRAINT fk_283
;
alter  table ROLES_DEF add constraint fk_283 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ROLES_REPORTS DROP CONSTRAINT fk_558
;
alter  table ROLES_REPORTS add constraint fk_558 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ROLES_WP DROP CONSTRAINT fk_285
;
alter  table ROLES_WP add constraint fk_285 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ROLES_ACT DROP CONSTRAINT fk_559
;
alter  table ROLES_ACT add constraint fk_559 foreign key(ParentStructRowID) references ROLES_WP (ROLES_WPID)
;


alter  TABLE RptSrvMsg DROP CONSTRAINT fk_83
;
alter  table RptSrvMsg add constraint fk_83 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE RptQuery DROP CONSTRAINT fk_84
;
alter  table RptQuery add constraint fk_84 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE RptQryParam DROP CONSTRAINT fk_85
;
alter  table RptQryParam add constraint fk_85 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKORD_DEF DROP CONSTRAINT fk_562
;
alter  table PEKORD_DEF add constraint fk_562 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKORD_DATA DROP CONSTRAINT fk_563
;
alter  table PEKORD_DATA add constraint fk_563 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WorkPlace DROP CONSTRAINT fk_165
;
alter  table WorkPlace add constraint fk_165 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE EntryPoints DROP CONSTRAINT fk_583
;
alter  table EntryPoints add constraint fk_583 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE EPFilterLink DROP CONSTRAINT fk_590
;
alter  table EPFilterLink add constraint fk_590 foreign key(ParentStructRowID) references EntryPoints (EntryPointsID)
;


alter  TABLE ARMTypes DROP CONSTRAINT fk_584
;
alter  table ARMTypes add constraint fk_584 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ARMJournal DROP CONSTRAINT fk_585
;
alter  table ARMJournal add constraint fk_585 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE ARMJRNLADD DROP CONSTRAINT fk_586
;
alter  table ARMJRNLADD add constraint fk_586 foreign key(ParentStructRowID) references ARMJournal (ARMJournalID)
;


alter  TABLE ARMJRNLREP DROP CONSTRAINT fk_587
;
alter  table ARMJRNLREP add constraint fk_587 foreign key(ParentStructRowID) references ARMJournal (ARMJournalID)
;


alter  TABLE ARMJRNLRUN DROP CONSTRAINT fk_588
;
alter  table ARMJRNLRUN add constraint fk_588 foreign key(ParentStructRowID) references ARMJournal (ARMJournalID)
;


alter  TABLE PEKD_NZONE DROP CONSTRAINT fk_564
;
alter  table PEKD_NZONE add constraint fk_564 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_USEDNUM DROP CONSTRAINT fk_565
;
alter  table PEKD_USEDNUM add constraint fk_565 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE JournalColumn DROP CONSTRAINT fk_168
;
alter  table JournalColumn add constraint fk_168 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE JColumnSource DROP CONSTRAINT fk_169
;
alter  table JColumnSource add constraint fk_169 foreign key(ParentStructRowID) references JournalColumn (JournalColumnID)
;


alter  TABLE Journal DROP CONSTRAINT fk_170
;
alter  table Journal add constraint fk_170 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE JournalSrc DROP CONSTRAINT fk_171
;
alter  table JournalSrc add constraint fk_171 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE pekmsg_path DROP CONSTRAINT fk_722
;
alter  table pekmsg_path add constraint fk_722 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBS_MAILLIST DROP CONSTRAINT fk_685
;
alter  table WEBS_MAILLIST add constraint fk_685 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBS_RECLAME DROP CONSTRAINT fk_723
;
alter  table WEBS_RECLAME add constraint fk_723 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBS_PAGEDEF DROP CONSTRAINT fk_687
;
alter  table WEBS_PAGEDEF add constraint fk_687 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBS_PICS DROP CONSTRAINT fk_688
;
alter  table WEBS_PICS add constraint fk_688 foreign key(ParentStructRowID) references WEBS_PAGEDEF (WEBS_PAGEDEFID)
;


alter  TABLE WEBS_PAGEMENU DROP CONSTRAINT fk_689
;
alter  table WEBS_PAGEMENU add constraint fk_689 foreign key(ParentStructRowID) references WEBS_PAGEDEF (WEBS_PAGEDEFID)
;


alter  TABLE WEBS_PAGECONTENT DROP CONSTRAINT fk_690
;
alter  table WEBS_PAGECONTENT add constraint fk_690 foreign key(ParentStructRowID) references WEBS_PAGEDEF (WEBS_PAGEDEFID)
;


alter  TABLE WEBS_PAGEPARS DROP CONSTRAINT fk_691
;
alter  table WEBS_PAGEPARS add constraint fk_691 foreign key(ParentStructRowID) references WEBS_PAGEDEF (WEBS_PAGEDEFID)
;


alter  TABLE WEBS_PAGECOMP DROP CONSTRAINT fk_692
;
alter  table WEBS_PAGECOMP add constraint fk_692 foreign key(ParentStructRowID) references WEBS_PAGEDEF (WEBS_PAGEDEFID)
;


alter  TABLE TablePart DROP CONSTRAINT fk_693
;
alter  table TablePart add constraint fk_693 foreign key(ParentStructRowID) references WEBS_PAGECOMP (WEBS_PAGECOMPID)
;


alter  TABLE ReplaceValues DROP CONSTRAINT fk_694
;
alter  table ReplaceValues add constraint fk_694 foreign key(ParentStructRowID) references WEBS_PAGECOMP (WEBS_PAGECOMPID)
;


alter  TABLE DenyEdit DROP CONSTRAINT fk_695
;
alter  table DenyEdit add constraint fk_695 foreign key(ParentStructRowID) references WEBS_PAGECOMP (WEBS_PAGECOMPID)
;


alter  TABLE DenyVisible DROP CONSTRAINT fk_696
;
alter  table DenyVisible add constraint fk_696 foreign key(ParentStructRowID) references WEBS_PAGECOMP (WEBS_PAGECOMPID)
;


alter  TABLE AllowEditFieldValues DROP CONSTRAINT fk_697
;
alter  table AllowEditFieldValues add constraint fk_697 foreign key(ParentStructRowID) references WEBS_PAGECOMP (WEBS_PAGECOMPID)
;


alter  TABLE ComboFields DROP CONSTRAINT fk_698
;
alter  table ComboFields add constraint fk_698 foreign key(ParentStructRowID) references WEBS_PAGECOMP (WEBS_PAGECOMPID)
;


alter  TABLE WEBS_ANKETA DROP CONSTRAINT fk_700
;
alter  table WEBS_ANKETA add constraint fk_700 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBS_QUESTIONS DROP CONSTRAINT fk_701
;
alter  table WEBS_QUESTIONS add constraint fk_701 foreign key(ParentStructRowID) references WEBS_ANKETA (WEBS_ANKETAID)
;


alter  TABLE WEBS_ANSWERS DROP CONSTRAINT fk_702
;
alter  table WEBS_ANSWERS add constraint fk_702 foreign key(ParentStructRowID) references WEBS_QUESTIONS (WEBS_QUESTIONSID)
;


alter  TABLE WEBS_DDOC DROP CONSTRAINT fk_703
;
alter  table WEBS_DDOC add constraint fk_703 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBS_NEWS DROP CONSTRAINT fk_704
;
alter  table WEBS_NEWS add constraint fk_704 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE NEWS_PICS DROP CONSTRAINT fk_705
;
alter  table NEWS_PICS add constraint fk_705 foreign key(ParentStructRowID) references WEBS_NEWS (WEBS_NEWSID)
;


alter  TABLE VRCPSeeAlso DROP CONSTRAINT fk_141
;
alter  table VRCPSeeAlso add constraint fk_141 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCPSpecial DROP CONSTRAINT fk_142
;
alter  table VRCPSpecial add constraint fk_142 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCPPresents DROP CONSTRAINT fk_143
;
alter  table VRCPPresents add constraint fk_143 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCPReports DROP CONSTRAINT fk_144
;
alter  table VRCPReports add constraint fk_144 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCPDates DROP CONSTRAINT fk_145
;
alter  table VRCPDates add constraint fk_145 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCPNeigborhood DROP CONSTRAINT fk_146
;
alter  table VRCPNeigborhood add constraint fk_146 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCPInterest DROP CONSTRAINT fk_147
;
alter  table VRCPInterest add constraint fk_147 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE VRCPCommon DROP CONSTRAINT fk_148
;
alter  table VRCPCommon add constraint fk_148 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKZR_DATA DROP CONSTRAINT fk_724
;
alter  table PEKZR_DATA add constraint fk_724 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WEBCRD_NUM DROP CONSTRAINT fk_293
;
alter  table WEBCRD_NUM add constraint fk_293 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE WBCRD_DEF DROP CONSTRAINT fk_294
;
alter  table WBCRD_DEF add constraint fk_294 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKO_DEF DROP CONSTRAINT fk_245
;
alter  table PEKO_DEF add constraint fk_245 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKL_DEF DROP CONSTRAINT fk_152
;
alter  table PEKL_DEF add constraint fk_152 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKL_WDAY DROP CONSTRAINT fk_153
;
alter  table PEKL_WDAY add constraint fk_153 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_ADDS DROP CONSTRAINT fk_602
;
alter  table PEKD_ADDS add constraint fk_602 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_TRAINTYPE DROP CONSTRAINT fk_567
;
alter  table PEKD_TRAINTYPE add constraint fk_567 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_AUTO DROP CONSTRAINT fk_725
;
alter  table PEKD_AUTO add constraint fk_725 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_GOTYPE DROP CONSTRAINT fk_568
;
alter  table PEKD_GOTYPE add constraint fk_568 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_INFOSENDTYPE DROP CONSTRAINT fk_609
;
alter  table PEKD_INFOSENDTYPE add constraint fk_609 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_TRTYPE DROP CONSTRAINT fk_569
;
alter  table PEKD_TRTYPE add constraint fk_569 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_GRPDpUSL DROP CONSTRAINT fk_726
;
alter  table PEKD_GRPDpUSL add constraint fk_726 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_POSTTYPE DROP CONSTRAINT fk_611
;
alter  table PEKD_POSTTYPE add constraint fk_611 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_TRFGRP DROP CONSTRAINT fk_570
;
alter  table PEKD_TRFGRP add constraint fk_570 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_TRFTYPE DROP CONSTRAINT fk_571
;
alter  table PEKD_TRFTYPE add constraint fk_571 foreign key(ParentStructRowID) references PEKD_TRFGRP (PEKD_TRFGRPID)
;


alter  TABLE PEKD_DEPT DROP CONSTRAINT fk_572
;
alter  table PEKD_DEPT add constraint fk_572 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_DEPLIMITS DROP CONSTRAINT fk_573
;
alter  table PEKD_DEPLIMITS add constraint fk_573 foreign key(ParentStructRowID) references PEKD_DEPT (PEKD_DEPTID)
;


alter  TABLE PEKD_DEPDOG DROP CONSTRAINT fk_612
;
alter  table PEKD_DEPDOG add constraint fk_612 foreign key(ParentStructRowID) references PEKD_DEPT (PEKD_DEPTID)
;


alter  TABLE PEKD_DIRECTION DROP CONSTRAINT fk_574
;
alter  table PEKD_DIRECTION add constraint fk_574 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;


alter  TABLE PEKD_TRAINS DROP CONSTRAINT fk_575
;
alter  table PEKD_TRAINS add constraint fk_575 foreign key(ParentStructRowID) references PEKD_DIRECTION (PEKD_DIRECTIONID)
;


alter  TABLE PEKD_DIRSTATION DROP CONSTRAINT fk_576
;
alter  table PEKD_DIRSTATION add constraint fk_576 foreign key(ParentStructRowID) references PEKD_DIRECTION (PEKD_DIRECTIONID)
;


alter  TABLE PEKD_SRV DROP CONSTRAINT fk_579
;
alter  table PEKD_SRV add constraint fk_579 foreign key(INSTANCEID) references INSTANCE (INSTANCEID)
;




