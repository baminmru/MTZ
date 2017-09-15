
/* --PEKD*/

 create or replace package PEKD as

procedure PEKD_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKD_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKD_ADDS_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_ADDSid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_ADDS_DELETE  (
 aCURSESSION CHAR,
 aPEKD_ADDSid CHAR,
 ainstanceid char
); 
procedure PEKD_ADDS_SAVE (
 aCURSESSION CHAR,
 aPEKD_ADDSid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aCalcType
 NUMBER := null /* ��� ������� *//* ��� ������� */
); 
procedure PEKD_ADDS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_ADDS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_ADDS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_ADDS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_ADDS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_ADDS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_ADDS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_TRAINTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_TRAINTYPEid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_TRAINTYPE_DELETE  (
 aCURSESSION CHAR,
 aPEKD_TRAINTYPEid CHAR,
 ainstanceid char
); 
procedure PEKD_TRAINTYPE_SAVE (
 aCURSESSION CHAR,
 aPEKD_TRAINTYPEid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* �������� *//* �������� */
); 
procedure PEKD_TRAINTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_TRAINTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_TRAINTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_TRAINTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_TRAINTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_TRAINTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_TRAINTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_GOTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_GOTYPEid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_GOTYPE_DELETE  (
 aCURSESSION CHAR,
 aPEKD_GOTYPEid CHAR,
 ainstanceid char
); 
procedure PEKD_GOTYPE_SAVE (
 aCURSESSION CHAR,
 aPEKD_GOTYPEid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* �������� *//* �������� */
); 
procedure PEKD_GOTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_GOTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_GOTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_GOTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_GOTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_GOTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_GOTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_INFOSENDTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_INFOSENDTYPEid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_INFOSENDTYPE_DELETE  (
 aCURSESSION CHAR,
 aPEKD_INFOSENDTYPEid CHAR,
 ainstanceid char
); 
procedure PEKD_INFOSENDTYPE_SAVE (
 aCURSESSION CHAR,
 aPEKD_INFOSENDTYPEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
); 
procedure PEKD_INFOSENDTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_INFOSENDTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_INFOSENDTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_INFOSENDTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_INFOSENDTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_INFOSENDTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_INFOSENDTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_ST_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_STid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_ST_DELETE  (
 aCURSESSION CHAR,
 aPEKD_STid CHAR,
 ainstanceid char
); 
procedure PEKD_ST_SAVE (
 aCURSESSION CHAR,
 aPEKD_STid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aCode1C
 VARCHAR2 := null /* �o� 1� *//* �o� 1� */
); 
procedure PEKD_ST_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_ST_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_ST_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_ST_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_ST_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_ST_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_ST_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_TRTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_TRTYPEid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_TRTYPE_DELETE  (
 aCURSESSION CHAR,
 aPEKD_TRTYPEid CHAR,
 ainstanceid char
); 
procedure PEKD_TRTYPE_SAVE (
 aCURSESSION CHAR,
 aPEKD_TRTYPEid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* �������� *//* �������� */
); 
procedure PEKD_TRTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_TRTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_TRTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_TRTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_TRTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_TRTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_TRTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_POSTTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_POSTTYPEid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_POSTTYPE_DELETE  (
 aCURSESSION CHAR,
 aPEKD_POSTTYPEid CHAR,
 ainstanceid char
); 
procedure PEKD_POSTTYPE_SAVE (
 aCURSESSION CHAR,
 aPEKD_POSTTYPEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
); 
procedure PEKD_POSTTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_POSTTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_POSTTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_POSTTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_POSTTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_POSTTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_POSTTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_TRFGRP_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_TRFGRPid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_TRFGRP_DELETE  (
 aCURSESSION CHAR,
 aPEKD_TRFGRPid CHAR,
 ainstanceid char
); 
procedure PEKD_TRFGRP_SAVE (
 aCURSESSION CHAR,
 aPEKD_TRFGRPid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aname
 VARCHAR2/* ������ *//* ������ */
); 
procedure PEKD_TRFGRP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_TRFGRP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_TRFGRP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_TRFGRP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_TRFGRP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_TRFGRP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_TRFGRP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_TRFTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_TRFTYPEid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_TRFTYPE_DELETE  (
 aCURSESSION CHAR,
 aPEKD_TRFTYPEid CHAR,
 ainstanceid char
); 
procedure PEKD_TRFTYPE_SAVE (
 aCURSESSION CHAR,
 aPEKD_TRFTYPEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aname
 VARCHAR2/* �������� *//* �������� */
); 
procedure PEKD_TRFTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_TRFTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_TRFTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_TRFTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_TRFTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_TRFTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_TRFTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_DEPT_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DEPTid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_DEPT_DELETE  (
 aCURSESSION CHAR,
 aPEKD_DEPTid CHAR,
 ainstanceid char
); 
procedure PEKD_DEPT_SAVE (
 aCURSESSION CHAR,
 aPEKD_DEPTid CHAR,
aInstanceID CHAR 
,aORG CHAR/* ����������� *//* ����������� */
,aname
 VARCHAR2/* �������� *//* �������� */
,aAddress VARCHAR2 := null /* ����� *//* ����� */
,aSupplier CHAR := null /* �������� ��������� *//* �������� ��������� */
,aDocPrefix
 VARCHAR2 := null /* ������� ������� ���������� *//* ������� ������� ���������� */
,aPGDPName
 VARCHAR2 := null /* �������� ���� *//* �������� ���� */
,aCode1C
 VARCHAR2 := null /* ���1� *//* ���1� */
); 
procedure PEKD_DEPT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_DEPT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_DEPT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_DEPT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_DEPT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_DEPT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_DEPT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_DEPLIMITS_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DEPLIMITSid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_DEPLIMITS_DELETE  (
 aCURSESSION CHAR,
 aPEKD_DEPLIMITSid CHAR,
 ainstanceid char
); 
procedure PEKD_DEPLIMITS_SAVE (
 aCURSESSION CHAR,
 aPEKD_DEPLIMITSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSupplier CHAR/* ��������� *//* ��������� */
,aLimitMark
 NUMBER/* ����������� ������� *//* ����������� ������� */
,aDaysToCrash
 NUMBER := null /* ����� � ���� *//* ����� � ���� */
); 
procedure PEKD_DEPLIMITS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_DEPLIMITS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_DEPLIMITS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_DEPLIMITS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_DEPLIMITS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_DEPLIMITS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_DEPLIMITS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_DEPDOG_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DEPDOGid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_DEPDOG_DELETE  (
 aCURSESSION CHAR,
 aPEKD_DEPDOGid CHAR,
 ainstanceid char
); 
procedure PEKD_DEPDOG_SAVE (
 aCURSESSION CHAR,
 aPEKD_DEPDOGid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSupplier CHAR/* ��������� *//* ��������� */
,aTheDogovor CHAR/* ������� *//* ������� */
); 
procedure PEKD_DEPDOG_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_DEPDOG_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_DEPDOG_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_DEPDOG_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_DEPDOG_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_DEPDOG_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_DEPDOG_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_DIRECTION_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DIRECTIONid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_DIRECTION_DELETE  (
 aCURSESSION CHAR,
 aPEKD_DIRECTIONid CHAR,
 ainstanceid char
); 
procedure PEKD_DIRECTION_SAVE (
 aCURSESSION CHAR,
 aPEKD_DIRECTIONid CHAR,
aInstanceID CHAR 
,aTown CHAR/* ����� *//* ����� */
,aName
 VARCHAR2/* ����������� *//* ����������� */
,aDept CHAR := null /* ������ *//* ������ */
,aSrok
 VARCHAR2 := null /* ���� �������� *//* ���� �������� */
,athe_Rule
 VARCHAR2 := null /* �������� *//* �������� */
,aPOSTINDEX
 VARCHAR2 := null /* �������� ������ *//* �������� ������ */
); 
procedure PEKD_DIRECTION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_DIRECTION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_DIRECTION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_DIRECTION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_DIRECTION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_DIRECTION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_DIRECTION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_TRAINS_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_TRAINSid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_TRAINS_DELETE  (
 aCURSESSION CHAR,
 aPEKD_TRAINSid CHAR,
 ainstanceid char
); 
procedure PEKD_TRAINS_SAVE (
 aCURSESSION CHAR,
 aPEKD_TRAINSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTrainNo
 VARCHAR2/* � ������ *//* � ������ */
,aFromStation CHAR := null /* �� *//* �� */
,aToSTATION CHAR := null /* � *//* � */
,athe_Rule
 VARCHAR2 := null /* �������� *//* �������� */
,aTheDesciption
 VARCHAR2 := null /* �������� *//* �������� */
,aTheComment VARCHAR2 := null /* ���������� *//* ���������� */
,aTrainType CHAR := null /* ��� ������ *//* ��� ������ */
); 
procedure PEKD_TRAINS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_TRAINS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_TRAINS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_TRAINS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_TRAINS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_TRAINS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_TRAINS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_DIRSTATION_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DIRSTATIONid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_DIRSTATION_DELETE  (
 aCURSESSION CHAR,
 aPEKD_DIRSTATIONid CHAR,
 ainstanceid char
); 
procedure PEKD_DIRSTATION_SAVE (
 aCURSESSION CHAR,
 aPEKD_DIRSTATIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aname
 VARCHAR2/* �������� *//* �������� */
,aPOSTINDEX
 VARCHAR2 := null /* ������ ��������� *//* ������ ��������� */
); 
procedure PEKD_DIRSTATION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_DIRSTATION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_DIRSTATION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_DIRSTATION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_DIRSTATION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_DIRSTATION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_DIRSTATION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_DOGTYPE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DOGTYPEid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_DOGTYPE_DELETE  (
 aCURSESSION CHAR,
 aPEKD_DOGTYPEid CHAR,
 ainstanceid char
); 
procedure PEKD_DOGTYPE_SAVE (
 aCURSESSION CHAR,
 aPEKD_DOGTYPEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aTRTYPE CHAR := null /* ������� �������� *//* ������� �������� */
,aDogTemplate VARCHAR2 := null /* ������ �������� */
,aDogTemplate_EXT varchar2 /* ������ �������� */
,aIsActual
 NUMBER/* ���������� ������� *//* ���������� ������� */
,athe_Comment VARCHAR2 := null /* ���������� *//* ���������� */
); 
procedure PEKD_DOGTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_DOGTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_DOGTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_DOGTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_DOGTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_DOGTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_DOGTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_DOGAPPENDIX_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_DOGAPPENDIXid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_DOGAPPENDIX_DELETE  (
 aCURSESSION CHAR,
 aPEKD_DOGAPPENDIXid CHAR,
 ainstanceid char
); 
procedure PEKD_DOGAPPENDIX_SAVE (
 aCURSESSION CHAR,
 aPEKD_DOGAPPENDIXid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aAPPENDIXTemplate VARCHAR2 := null /* ������ */
,aAPPENDIXTemplate_EXT varchar2 /* ������ */
,athe_comment VARCHAR2 := null /* ���������� *//* ���������� */
); 
procedure PEKD_DOGAPPENDIX_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_DOGAPPENDIX_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_DOGAPPENDIX_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_DOGAPPENDIX_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_DOGAPPENDIX_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_DOGAPPENDIX_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_DOGAPPENDIX_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_SRV_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_SRVid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_SRV_DELETE  (
 aCURSESSION CHAR,
 aPEKD_SRVid CHAR,
 ainstanceid char
); 
procedure PEKD_SRV_SAVE (
 aCURSESSION CHAR,
 aPEKD_SRVid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* �������� *//* �������� */
,aDependOnWeight
 NUMBER := null /* ������� �� ���� *//* ������� �� ���� */
,aEDIZM CHAR := null /* ������� ��������� *//* ������� ��������� */
,aCode1C
 VARCHAR2 := null /* ���1� *//* ���1� */
); 
procedure PEKD_SRV_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_SRV_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_SRV_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_SRV_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_SRV_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_SRV_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_SRV_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKD;

/



