
/* --ENTDIC*/

 create or replace package ENTDIC as

procedure ENTDIC_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure ENTDIC_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure ENTDIC_propagate(acursession CHAR, aROWID CHAR); 


procedure ENTDIC_BANK_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_BANKid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_BANK_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_BANKid CHAR,
 ainstanceid char
); 
procedure ENTDIC_BANK_SAVE (
 aCURSESSION CHAR,
 aENTDIC_BANKid CHAR,
aInstanceID CHAR 
,aBIC
 VARCHAR2/* БИК *//* БИК */
,aRKC
 VARCHAR2/* РКЦ *//* РКЦ */
,aACC
 VARCHAR2 := null /* Счет *//* Счет */
,aKORACC
 VARCHAR2 := null /* Кор. счет *//* Кор. счет */
,aSUBKORACC
 VARCHAR2 := null /* Суб кор счет *//* Суб кор счет */
,aname
 VARCHAR2/* Название *//* Название */
,aAddr
 VARCHAR2 := null /* Адрес *//* Адрес */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
); 
procedure ENTDIC_BANK_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_BANK_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_BANK_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_BANK_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_BANK_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_BANK_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_BANK_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_MTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_MTYPEid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_MTYPE_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_MTYPEid CHAR,
 ainstanceid char
); 
procedure ENTDIC_MTYPE_SAVE (
 aCURSESSION CHAR,
 aENTDIC_MTYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_MTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_MTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_MTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_MTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_MTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_MTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_MTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_DOST_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_DOSTid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_DOST_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_DOSTid CHAR,
 ainstanceid char
); 
procedure ENTDIC_DOST_SAVE (
 aCURSESSION CHAR,
 aENTDIC_DOSTid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_DOST_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_DOST_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_DOST_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_DOST_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_DOST_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_DOST_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_DOST_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_TOWN_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_TOWNid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_TOWN_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_TOWNid CHAR,
 ainstanceid char
); 
procedure ENTDIC_TOWN_SAVE (
 aCURSESSION CHAR,
 aENTDIC_TOWNid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,acountry CHAR/* Страна *//* Страна */
); 
procedure ENTDIC_TOWN_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_TOWN_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_TOWN_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_TOWN_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_TOWN_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_TOWN_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_TOWN_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_ANALIZ_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_ANALIZid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_ANALIZ_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_ANALIZid CHAR,
 ainstanceid char
); 
procedure ENTDIC_ANALIZ_SAVE (
 aCURSESSION CHAR,
 aENTDIC_ANALIZid CHAR,
aInstanceID CHAR 
,acode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_ANALIZ_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_ANALIZ_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_ANALIZ_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_ANALIZ_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_ANALIZ_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_ANALIZ_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_ANALIZ_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_NTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_NTYPEid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_NTYPE_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_NTYPEid CHAR,
 ainstanceid char
); 
procedure ENTDIC_NTYPE_SAVE (
 aCURSESSION CHAR,
 aENTDIC_NTYPEid CHAR,
aInstanceID CHAR 
,acode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_NTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_NTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_NTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_NTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_NTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_NTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_NTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_DEPTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_DEPTYPEid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_DEPTYPE_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_DEPTYPEid CHAR,
 ainstanceid char
); 
procedure ENTDIC_DEPTYPE_SAVE (
 aCURSESSION CHAR,
 aENTDIC_DEPTYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_DEPTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_DEPTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_DEPTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_DEPTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_DEPTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_DEPTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_DEPTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_URTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_URTYPEid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_URTYPE_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_URTYPEid CHAR,
 ainstanceid char
); 
procedure ENTDIC_URTYPE_SAVE (
 aCURSESSION CHAR,
 aENTDIC_URTYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_URTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_URTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_URTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_URTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_URTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_URTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_URTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_VOP_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_VOPid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_VOP_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_VOPid CHAR,
 ainstanceid char
); 
procedure ENTDIC_VOP_SAVE (
 aCURSESSION CHAR,
 aENTDIC_VOPid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_VOP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_VOP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_VOP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_VOP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_VOP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_VOP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_VOP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_VP_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_VPid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_VP_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_VPid CHAR,
 ainstanceid char
); 
procedure ENTDIC_VP_SAVE (
 aCURSESSION CHAR,
 aENTDIC_VPid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,acode
 VARCHAR2/* Код *//* Код */
); 
procedure ENTDIC_VP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_VP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_VP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_VP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_VP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_VP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_VP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_EDIZM_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_EDIZMid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_EDIZM_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_EDIZMid CHAR,
 ainstanceid char
); 
procedure ENTDIC_EDIZM_SAVE (
 aCURSESSION CHAR,
 aENTDIC_EDIZMid CHAR,
aInstanceID CHAR 
,acode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2 := null /* Название *//* Название */
,aNetto
 NUMBER := null /* Базовых единиц *//* Базовых единиц */
,abaseEDIZM CHAR := null /* Базовая единица изм. *//* Базовая единица изм. */
); 
procedure ENTDIC_EDIZM_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_EDIZM_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_EDIZM_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_EDIZM_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_EDIZM_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_EDIZM_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_EDIZM_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_RWSRV_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_RWSRVid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_RWSRV_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_RWSRVid CHAR,
 ainstanceid char
); 
procedure ENTDIC_RWSRV_SAVE (
 aCURSESSION CHAR,
 aENTDIC_RWSRVid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_RWSRV_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_RWSRV_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_RWSRV_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_RWSRV_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_RWSRV_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_RWSRV_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_RWSRV_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_RW_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_RWid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_RW_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_RWid CHAR,
 ainstanceid char
); 
procedure ENTDIC_RW_SAVE (
 aCURSESSION CHAR,
 aENTDIC_RWid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,acode
 VARCHAR2/* Код *//* Код */
); 
procedure ENTDIC_RW_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_RW_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_RW_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_RW_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_RW_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_RW_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_RW_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_RWDIV_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_RWDIVid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_RWDIV_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_RWDIVid CHAR,
 ainstanceid char
); 
procedure ENTDIC_RWDIV_SAVE (
 aCURSESSION CHAR,
 aENTDIC_RWDIVid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aname
 VARCHAR2/* Направление *//* Направление */
); 
procedure ENTDIC_RWDIV_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_RWDIV_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_RWDIV_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_RWDIV_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_RWDIV_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_RWDIV_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_RWDIV_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_RWSTATION_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_RWSTATIONid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_RWSTATION_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_RWSTATIONid CHAR,
 ainstanceid char
); 
procedure ENTDIC_RWSTATION_SAVE (
 aCURSESSION CHAR,
 aENTDIC_RWSTATIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,asname
 VARCHAR2 := null /* Краткое название *//* Краткое название */
,aPostNode
 NUMBER/* Почтовый узел *//* Почтовый узел */
,aPGDPIdx
 VARCHAR2 := null /* Индекс *//* Индекс */
); 
procedure ENTDIC_RWSTATION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_RWSTATION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_RWSTATION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_RWSTATION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_RWSTATION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_RWSTATION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_RWSTATION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_IZMAP_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_IZMAPid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_IZMAP_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_IZMAPid CHAR,
 ainstanceid char
); 
procedure ENTDIC_IZMAP_SAVE (
 aCURSESSION CHAR,
 aENTDIC_IZMAPid CHAR,
aInstanceID CHAR 
,aFromEDIZM CHAR/* Из измерения *//* Из измерения */
,aIZMultiplicator
 NUMBER/* Множитель *//* Множитель */
,aToEDIZM CHAR/* К измерению *//* К измерению */
); 
procedure ENTDIC_IZMAP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_IZMAP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_IZMAP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_IZMAP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_IZMAP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_IZMAP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_IZMAP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_CURRENCY_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_CURRENCYid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_CURRENCY_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_CURRENCYid CHAR,
 ainstanceid char
); 
procedure ENTDIC_CURRENCY_SAVE (
 aCURSESSION CHAR,
 aENTDIC_CURRENCYid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aCode
 VARCHAR2/* Код *//* Код */
); 
procedure ENTDIC_CURRENCY_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_CURRENCY_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_CURRENCY_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_CURRENCY_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_CURRENCY_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_CURRENCY_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_CURRENCY_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_CURCOURCE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_CURCOURCEid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_CURCOURCE_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_CURCOURCEid CHAR,
 ainstanceid char
); 
procedure ENTDIC_CURCOURCE_SAVE (
 aCURSESSION CHAR,
 aENTDIC_CURCOURCEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aCourceDate
 DATE/* Дата *//* Дата */
,athe_Value
 NUMBER/* Курс *//* Курс */
,aQuantity
 NUMBER/* Количество *//* Количество */
); 
procedure ENTDIC_CURCOURCE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_CURCOURCE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_CURCOURCE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_CURCOURCE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_CURCOURCE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_CURCOURCE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_CURCOURCE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_TRREG_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_TRREGid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_TRREG_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_TRREGid CHAR,
 ainstanceid char
); 
procedure ENTDIC_TRREG_SAVE (
 aCURSESSION CHAR,
 aENTDIC_TRREGid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
,amapIndex
 NUMBER := null /* mapIndex *//* mapIndex */
,amapLayer
 VARCHAR2 := null /* mapLayer *//* mapLayer */
); 
procedure ENTDIC_TRREG_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_TRREG_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_TRREG_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_TRREG_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_TRREG_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_TRREG_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_TRREG_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_STORETYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_STORETYPEid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_STORETYPE_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_STORETYPEid CHAR,
 ainstanceid char
); 
procedure ENTDIC_STORETYPE_SAVE (
 aCURSESSION CHAR,
 aENTDIC_STORETYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_STORETYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_STORETYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_STORETYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_STORETYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_STORETYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_STORETYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_STORETYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_MACHINES_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_MACHINESid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_MACHINES_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_MACHINESid CHAR,
 ainstanceid char
); 
procedure ENTDIC_MACHINES_SAVE (
 aCURSESSION CHAR,
 aENTDIC_MACHINESid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_MACHINES_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_MACHINES_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_MACHINES_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_MACHINES_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_MACHINES_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_MACHINES_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_MACHINES_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_CLITYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_CLITYPEid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_CLITYPE_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_CLITYPEid CHAR,
 ainstanceid char
); 
procedure ENTDIC_CLITYPE_SAVE (
 aCURSESSION CHAR,
 aENTDIC_CLITYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_CLITYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_CLITYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_CLITYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_CLITYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_CLITYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_CLITYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_CLITYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_COUNTRY_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_COUNTRYid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_COUNTRY_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_COUNTRYid CHAR,
 ainstanceid char
); 
procedure ENTDIC_COUNTRY_SAVE (
 aCURSESSION CHAR,
 aENTDIC_COUNTRYid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_COUNTRY_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_COUNTRY_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_COUNTRY_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_COUNTRY_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_COUNTRY_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_COUNTRY_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_COUNTRY_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_PACKAGE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_PACKAGEid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_PACKAGE_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_PACKAGEid CHAR,
 ainstanceid char
); 
procedure ENTDIC_PACKAGE_SAVE (
 aCURSESSION CHAR,
 aENTDIC_PACKAGEid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aWieght
 NUMBER/* Вес *//* Вес */
,aPLenght
 NUMBER/* Длина *//* Длина */
,aPHeight
 NUMBER/* Высота *//* Высота */
,aPWidth
 NUMBER/* Ширина *//* Ширина */
,aNetto
 NUMBER/* Внутренний объем *//* Внутренний объем */
); 
procedure ENTDIC_PACKAGE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_PACKAGE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_PACKAGE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_PACKAGE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_PACKAGE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_PACKAGE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_PACKAGE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_SRV_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_SRVid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_SRV_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_SRVid CHAR,
 ainstanceid char
); 
procedure ENTDIC_SRV_SAVE (
 aCURSESSION CHAR,
 aENTDIC_SRVid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_SRV_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_SRV_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_SRV_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_SRV_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_SRV_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_SRV_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_SRV_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDiC_RETTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDiC_RETTYPEid CHAR,
 aBRIEF out varchar2
);
procedure ENTDiC_RETTYPE_DELETE  (
 aCURSESSION CHAR,
 aENTDiC_RETTYPEid CHAR,
 ainstanceid char
); 
procedure ENTDiC_RETTYPE_SAVE (
 aCURSESSION CHAR,
 aENTDiC_RETTYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDiC_RETTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDiC_RETTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDiC_RETTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDiC_RETTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDiC_RETTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDiC_RETTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDiC_RETTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_REGION_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_REGIONid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_REGION_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_REGIONid CHAR,
 ainstanceid char
); 
procedure ENTDIC_REGION_SAVE (
 aCURSESSION CHAR,
 aENTDIC_REGIONid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_REGION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_REGION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_REGION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_REGION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_REGION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_REGION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_REGION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_VOT_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_VOTid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_VOT_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_VOTid CHAR,
 ainstanceid char
); 
procedure ENTDIC_VOT_SAVE (
 aCURSESSION CHAR,
 aENTDIC_VOTid CHAR,
aInstanceID CHAR 
,acode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_VOT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_VOT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_VOT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_VOT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_VOT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_VOT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_VOT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_PRTYPE_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_PRTYPEid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_PRTYPE_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_PRTYPEid CHAR,
 ainstanceid char
); 
procedure ENTDIC_PRTYPE_SAVE (
 aCURSESSION CHAR,
 aENTDIC_PRTYPEid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Код *//* Код */
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_PRTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_PRTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_PRTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_PRTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_PRTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_PRTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_PRTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENTDIC_NALOGI_BRIEF  (
 aCURSESSION CHAR,
 aENTDIC_NALOGIid CHAR,
 aBRIEF out varchar2
);
procedure ENTDIC_NALOGI_DELETE  (
 aCURSESSION CHAR,
 aENTDIC_NALOGIid CHAR,
 ainstanceid char
); 
procedure ENTDIC_NALOGI_SAVE (
 aCURSESSION CHAR,
 aENTDIC_NALOGIid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
); 
procedure ENTDIC_NALOGI_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENTDIC_NALOGI_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENTDIC_NALOGI_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENTDIC_NALOGI_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENTDIC_NALOGI_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENTDIC_NALOGI_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENTDIC_NALOGI_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end ENTDIC;

/



