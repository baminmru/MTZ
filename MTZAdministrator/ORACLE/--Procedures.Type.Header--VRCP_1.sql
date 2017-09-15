
/* --VRCP*/

 create or replace package VRCP as

procedure VRCP_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure VRCP_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure VRCP_propagate(acursession CHAR, aROWID CHAR); 


procedure VRCPSeeAlso_BRIEF  (
 aCURSESSION CHAR,
 aVRCPSeeAlsoid CHAR,
 aBRIEF out varchar2
);
procedure VRCPSeeAlso_DELETE  (
 aCURSESSION CHAR,
 aVRCPSeeAlsoid CHAR,
 ainstanceid char
); 
procedure VRCPSeeAlso_SAVE (
 aCURSESSION CHAR,
 aVRCPSeeAlsoid CHAR,
aInstanceID CHAR 
,aDocument CHAR/* �������� *//* �������� */
,athe_Comment VARCHAR2 := null /* ���������� *//* ���������� */
); 
procedure VRCPSeeAlso_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPSeeAlso_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPSeeAlso_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPSeeAlso_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPSeeAlso_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPSeeAlso_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPSeeAlso_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCPSpecial_BRIEF  (
 aCURSESSION CHAR,
 aVRCPSpecialid CHAR,
 aBRIEF out varchar2
);
procedure VRCPSpecial_DELETE  (
 aCURSESSION CHAR,
 aVRCPSpecialid CHAR,
 ainstanceid char
); 
procedure VRCPSpecial_SAVE (
 aCURSESSION CHAR,
 aVRCPSpecialid CHAR,
aInstanceID CHAR 
,aDateOF
 DATE/* ���� *//* ���� */
,aInfo VARCHAR2 := null /* �������� *//* �������� */
,atheFile VARCHAR2 := null /* ���� */
,atheFile_EXT varchar2 /* ���� */
,aInfoSrc VARCHAR2 := null /* �������� *//* �������� */
); 
procedure VRCPSpecial_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPSpecial_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPSpecial_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPSpecial_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPSpecial_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPSpecial_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPSpecial_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCPPresents_BRIEF  (
 aCURSESSION CHAR,
 aVRCPPresentsid CHAR,
 aBRIEF out varchar2
);
procedure VRCPPresents_DELETE  (
 aCURSESSION CHAR,
 aVRCPPresentsid CHAR,
 ainstanceid char
); 
procedure VRCPPresents_SAVE (
 aCURSESSION CHAR,
 aVRCPPresentsid CHAR,
aInstanceID CHAR 
,aDateOF
 DATE/* ���� *//* ���� */
,aGift
 VARCHAR2 := null /* ������� *//* ������� */
,aPresentCost
 NUMBER := null /* ���� ������� *//* ���� ������� */
,areason VARCHAR2 := null /* ����� *//* ����� */
); 
procedure VRCPPresents_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPPresents_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPPresents_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPPresents_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPPresents_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPPresents_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPPresents_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCPReports_BRIEF  (
 aCURSESSION CHAR,
 aVRCPReportsid CHAR,
 aBRIEF out varchar2
);
procedure VRCPReports_DELETE  (
 aCURSESSION CHAR,
 aVRCPReportsid CHAR,
 ainstanceid char
); 
procedure VRCPReports_SAVE (
 aCURSESSION CHAR,
 aVRCPReportsid CHAR,
aInstanceID CHAR 
,aReport CHAR/* ����� *//* ����� */
); 
procedure VRCPReports_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPReports_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPReports_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPReports_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPReports_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPReports_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPReports_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCPDates_BRIEF  (
 aCURSESSION CHAR,
 aVRCPDatesid CHAR,
 aBRIEF out varchar2
);
procedure VRCPDates_DELETE  (
 aCURSESSION CHAR,
 aVRCPDatesid CHAR,
 ainstanceid char
); 
procedure VRCPDates_SAVE (
 aCURSESSION CHAR,
 aVRCPDatesid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* ���� *//* ���� */
,aDateEvent
 VARCHAR2/* ������� *//* ������� */
); 
procedure VRCPDates_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPDates_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPDates_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPDates_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPDates_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPDates_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPDates_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCPNeigborhood_BRIEF  (
 aCURSESSION CHAR,
 aVRCPNeigborhoodid CHAR,
 aBRIEF out varchar2
);
procedure VRCPNeigborhood_DELETE  (
 aCURSESSION CHAR,
 aVRCPNeigborhoodid CHAR,
 ainstanceid char
); 
procedure VRCPNeigborhood_SAVE (
 aCURSESSION CHAR,
 aVRCPNeigborhoodid CHAR,
aInstanceID CHAR 
,athe_Level
 VARCHAR2 := null /* ������� ������� *//* ������� ������� */
,aperson CHAR := null /* �������� *//* �������� */
); 
procedure VRCPNeigborhood_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPNeigborhood_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPNeigborhood_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPNeigborhood_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPNeigborhood_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPNeigborhood_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPNeigborhood_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCPInterest_BRIEF  (
 aCURSESSION CHAR,
 aVRCPInterestid CHAR,
 aBRIEF out varchar2
);
procedure VRCPInterest_DELETE  (
 aCURSESSION CHAR,
 aVRCPInterestid CHAR,
 ainstanceid char
); 
procedure VRCPInterest_SAVE (
 aCURSESSION CHAR,
 aVRCPInterestid CHAR,
aInstanceID CHAR 
,aInfo VARCHAR2/* �������� *//* �������� */
); 
procedure VRCPInterest_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPInterest_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPInterest_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPInterest_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPInterest_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPInterest_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPInterest_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCPCommon_BRIEF  (
 aCURSESSION CHAR,
 aVRCPCommonid CHAR,
 aBRIEF out varchar2
);
procedure VRCPCommon_DELETE  (
 aCURSESSION CHAR,
 aVRCPCommonid CHAR,
 ainstanceid char
); 
procedure VRCPCommon_SAVE (
 aCURSESSION CHAR,
 aVRCPCommonid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* ���� ����������� *//* ���� ����������� */
,aFamily
 VARCHAR2/* ������� *//* ������� */
,aName
 VARCHAR2/* ��� *//* ��� */
,aSurName
 VARCHAR2 := null /* �������� *//* �������� */
,aPrivelegie VARCHAR2 := null /* ������ *//* ������ */
,aphone
 VARCHAR2 := null /* ������� *//* ������� */
,aemail VARCHAR2 := null /* e-mail *//* e-mail */
,afax
 VARCHAR2 := null /* ���� *//* ���� */
,aLoyality CHAR := null /* ���������� *//* ���������� */
,athe_Comment VARCHAR2 := null /* ���������� *//* ���������� */
,aCurator CHAR := null /* ������������� *//* ������������� */
,amobile
 VARCHAR2 := null /* ��������� ������� *//* ��������� ������� */
,aPersonDeYuro
 NUMBER := null /* ����������� ������������� *//* ����������� ������������� */
,aActionReason
 VARCHAR2 := null /* ��������� �� ��������� *//* ��������� �� ��������� */
,aActionStart
 DATE := null /* ������ �������� ����������� *//* ������ �������� ����������� */
,aActionEnd
 DATE := null /* ����� �������� ������������ *//* ����� �������� ������������ */
,aPassportInfo VARCHAR2 := null /* ���������� ������ *//* ���������� ������ */
,aAddress VARCHAR2 := null /* ����� *//* ����� */
); 
procedure VRCPCommon_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPCommon_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPCommon_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPCommon_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPCommon_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPCommon_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPCommon_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end VRCP;

/



