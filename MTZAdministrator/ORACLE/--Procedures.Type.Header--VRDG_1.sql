
/* --VRDG*/

 create or replace package VRDG as

procedure VRDG_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure VRDG_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure VRDG_propagate(acursession CHAR, aROWID CHAR); 


procedure VRDGCommon_BRIEF  (
 aCURSESSION CHAR,
 aVRDGCommonid CHAR,
 aBRIEF out varchar2
);
procedure VRDGCommon_DELETE  (
 aCURSESSION CHAR,
 aVRDGCommonid CHAR,
 ainstanceid char
); 
procedure VRDGCommon_SAVE (
 aCURSESSION CHAR,
 aVRDGCommonid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* ���� ����������� *//* ���� ����������� */
,aDogNum
 VARCHAR2/* ����� �������� *//* ����� �������� */
,aDogDate
 DATE/* ���� �������� *//* ���� �������� */
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aCurator CHAR := null /* ������������� *//* ������������� */
,aInfo VARCHAR2 := null /* ���������� *//* ���������� */
,aClient CHAR := null /* ���������� *//* ���������� */
,aDogType CHAR := null /* ��� �������� *//* ��� �������� */
,aPZDog
 NUMBER := null /* ������� � ������� ������ *//* ������� � ������� ������ */
,aStartDate
 DATE := null /* ������ �������� *//* ������ �������� */
,aEndDate
 DATE := null /* ��������� �������� �������� *//* ��������� �������� �������� */
,aCode1C
 VARCHAR2 := null /* ���1� *//* ���1� */
); 
procedure VRDGCommon_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGCommon_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGCommon_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGCommon_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGCommon_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGCommon_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGCommon_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGReport_BRIEF  (
 aCURSESSION CHAR,
 aVRDGReportid CHAR,
 aBRIEF out varchar2
);
procedure VRDGReport_DELETE  (
 aCURSESSION CHAR,
 aVRDGReportid CHAR,
 ainstanceid char
); 
procedure VRDGReport_SAVE (
 aCURSESSION CHAR,
 aVRDGReportid CHAR,
aInstanceID CHAR 
,aReport CHAR/* ����� *//* ����� */
); 
procedure VRDGReport_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGReport_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGReport_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGReport_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGReport_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGReport_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGReport_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGPayment_BRIEF  (
 aCURSESSION CHAR,
 aVRDGPaymentid CHAR,
 aBRIEF out varchar2
);
procedure VRDGPayment_DELETE  (
 aCURSESSION CHAR,
 aVRDGPaymentid CHAR,
 ainstanceid char
); 
procedure VRDGPayment_SAVE (
 aCURSESSION CHAR,
 aVRDGPaymentid CHAR,
aInstanceID CHAR 
,aCreateDate
 DATE := null /* ���� ������� ����� *//* ���� ������� ����� */
,aDateOF
 DATE/* ���� ������ *//* ���� ������ */
,atheSumm
 NUMBER/* ����� *//* ����� */
,aCash
 NUMBER := null /* �������� ������ *//* �������� ������ */
,aPaymentForm
 VARCHAR2 := null /* � ����� *//* � ����� */
,aInfo VARCHAR2 := null /* ������� ����� *//* ������� ����� */
); 
procedure VRDGPayment_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGPayment_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGPayment_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGPayment_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGPayment_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGPayment_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGPayment_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGContractChanges_BRIEF  (
 aCURSESSION CHAR,
 aVRDGContractChangesid CHAR,
 aBRIEF out varchar2
);
procedure VRDGContractChanges_DELETE  (
 aCURSESSION CHAR,
 aVRDGContractChangesid CHAR,
 ainstanceid char
); 
procedure VRDGContractChanges_SAVE (
 aCURSESSION CHAR,
 aVRDGContractChangesid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* ����� ���������� *//* ����� ���������� */
,aDateOf
 DATE/* ���� ���������� *//* ���� ���������� */
,atheFile VARCHAR2 := null /* ���� ���������� */
,atheFile_EXT varchar2 /* ���� ���������� */
,athe_Comment VARCHAR2 := null /* ���������� *//* ���������� */
); 
procedure VRDGContractChanges_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGContractChanges_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGContractChanges_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGContractChanges_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGContractChanges_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGContractChanges_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGContractChanges_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGSeeAlso_BRIEF  (
 aCURSESSION CHAR,
 aVRDGSeeAlsoid CHAR,
 aBRIEF out varchar2
);
procedure VRDGSeeAlso_DELETE  (
 aCURSESSION CHAR,
 aVRDGSeeAlsoid CHAR,
 ainstanceid char
); 
procedure VRDGSeeAlso_SAVE (
 aCURSESSION CHAR,
 aVRDGSeeAlsoid CHAR,
aInstanceID CHAR 
,aDocument CHAR/* �������� *//* �������� */
,athe_Comment VARCHAR2 := null /* ���������� *//* ���������� */
); 
procedure VRDGSeeAlso_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGSeeAlso_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGSeeAlso_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGSeeAlso_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGSeeAlso_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGSeeAlso_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGSeeAlso_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGContractVersion_BRIEF  (
 aCURSESSION CHAR,
 aVRDGContractVersionid CHAR,
 aBRIEF out varchar2
);
procedure VRDGContractVersion_DELETE  (
 aCURSESSION CHAR,
 aVRDGContractVersionid CHAR,
 ainstanceid char
); 
procedure VRDGContractVersion_SAVE (
 aCURSESSION CHAR,
 aVRDGContractVersionid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* ���� ������ *//* ���� ������ */
,atheFile VARCHAR2/* ���� */
,atheFile_EXT varchar2 /* ���� */
,aActual
 NUMBER/* ���������� ������ *//* ���������� ������ */
,athe_Comment VARCHAR2/* ���������� *//* ���������� */
); 
procedure VRDGContractVersion_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGContractVersion_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGContractVersion_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGContractVersion_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGContractVersion_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGContractVersion_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGContractVersion_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGContractSpesial_BRIEF  (
 aCURSESSION CHAR,
 aVRDGContractSpesialid CHAR,
 aBRIEF out varchar2
);
procedure VRDGContractSpesial_DELETE  (
 aCURSESSION CHAR,
 aVRDGContractSpesialid CHAR,
 ainstanceid char
); 
procedure VRDGContractSpesial_SAVE (
 aCURSESSION CHAR,
 aVRDGContractSpesialid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* ���� *//* ���� */
,aIsDone
 NUMBER/* ��������� *//* ��������� */
,athe_Comment VARCHAR2/* ���� ������� *//* ���� ������� */
); 
procedure VRDGContractSpesial_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGContractSpesial_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGContractSpesial_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGContractSpesial_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGContractSpesial_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGContractSpesial_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGContractSpesial_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end VRDG;

/



