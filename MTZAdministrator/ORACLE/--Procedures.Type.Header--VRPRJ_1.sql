
/* --VRPRJ*/

 create or replace package VRPRJ as

procedure VRPRJ_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure VRPRJ_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure VRPRJ_propagate(acursession CHAR, aROWID CHAR); 


procedure VRPRJ_REPORT_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_REPORTid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_REPORT_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_REPORTid CHAR,
 ainstanceid char
); 
procedure VRPRJ_REPORT_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_REPORTid CHAR,
aInstanceID CHAR 
,aReport CHAR/* ����� *//* ����� */
); 
procedure VRPRJ_REPORT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_REPORT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_REPORT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_REPORT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_REPORT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_REPORT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_REPORT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_SUBPROJECT_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_SUBPROJECTid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_SUBPROJECT_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_SUBPROJECTid CHAR,
 ainstanceid char
); 
procedure VRPRJ_SUBPROJECT_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_SUBPROJECTid CHAR,
aInstanceID CHAR 
,aSubProject CHAR/* ��������� *//* ��������� */
,athe_Comment VARCHAR2 := null /* ����������� *//* ����������� */
); 
procedure VRPRJ_SUBPROJECT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_SUBPROJECT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_SUBPROJECT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_SUBPROJECT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_SUBPROJECT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_SUBPROJECT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_SUBPROJECT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_JOB_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_JOBid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_JOB_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_JOBid CHAR,
 ainstanceid char
); 
procedure VRPRJ_JOB_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_JOBid CHAR,
aInstanceID CHAR 
,athe_Description VARCHAR2/* �������� *//* �������� */
,aMainPerson CHAR := null /* ������������� *//* ������������� */
,aTheFile VARCHAR2 := null /* ���� */
,aTheFile_EXT varchar2 /* ���� */
,aPlanWork
 NUMBER := null /* �������� ������������ *//* �������� ������������ */
,aStartDate
 DATE := null /* ���� ������ ����� *//* ���� ������ ����� */
,aDueDate
 DATE := null /* ���� ��������� *//* ���� ��������� */
,aFactStart
 DATE := null /* ����������� ������ *//* ����������� ������ */
,aFactFinish
 DATE := null /* ����������� ��������� *//* ����������� ��������� */
,aFactWork
 NUMBER := null /* ����������� ������������ *//* ����������� ������������ */
,aJobDone
 NUMBER := null /* ������ ��������� *//* ������ ��������� */
); 
procedure VRPRJ_JOB_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_JOB_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_JOB_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_JOB_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_JOB_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_JOB_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_JOB_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_SeeAlso_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_SeeAlsoid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_SeeAlso_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_SeeAlsoid CHAR,
 ainstanceid char
); 
procedure VRPRJ_SeeAlso_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_SeeAlsoid CHAR,
aInstanceID CHAR 
,aDocument CHAR/* �������� *//* �������� */
,athe_Comment VARCHAR2 := null /* ���������� *//* ���������� */
); 
procedure VRPRJ_SeeAlso_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_SeeAlso_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_SeeAlso_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_SeeAlso_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_SeeAlso_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_SeeAlso_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_SeeAlso_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_CUSTOMER_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_CUSTOMERid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_CUSTOMER_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_CUSTOMERid CHAR,
 ainstanceid char
); 
procedure VRPRJ_CUSTOMER_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_CUSTOMERid CHAR,
aInstanceID CHAR 
,aCustomer CHAR/* �������� *//* �������� */
,athe_Comment VARCHAR2 := null /* ���������� *//* ���������� */
,aSubContructor
 NUMBER := null /* ������������ *//* ������������ */
); 
procedure VRPRJ_CUSTOMER_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_CUSTOMER_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_CUSTOMER_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_CUSTOMER_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_CUSTOMER_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_CUSTOMER_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_CUSTOMER_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_Contract_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_Contractid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_Contract_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_Contractid CHAR,
 ainstanceid char
); 
procedure VRPRJ_Contract_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_Contractid CHAR,
aInstanceID CHAR 
,aContract CHAR/* ������� *//* ������� */
); 
procedure VRPRJ_Contract_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_Contract_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_Contract_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_Contract_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_Contract_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_Contract_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_Contract_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_COMMON_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_COMMONid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_COMMON_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_COMMONid CHAR,
 ainstanceid char
); 
procedure VRPRJ_COMMON_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_COMMONid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* ���� ����������� *//* ���� ����������� */
,aProjectType CHAR/* ��� ������� *//* ��� ������� */
,aname
 VARCHAR2/* �������� *//* �������� */
,aInfo VARCHAR2 := null /* �������� *//* �������� */
,atheFile VARCHAR2 := null /* ���� */
,atheFile_EXT varchar2 /* ���� */
,aMainPerson CHAR := null /* ������������� *//* ������������� */
,aProjectClosed
 NUMBER/* ������ �������� *//* ������ �������� */
,aPlanStart
 DATE := null /* �������� ������ *//* �������� ������ */
,aPlanWork
 NUMBER/* �������� ������������ *//* �������� ������������ */
,aPlanFinish
 DATE := null /* �������� ���������� *//* �������� ���������� */
); 
procedure VRPRJ_COMMON_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_COMMON_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_COMMON_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_COMMON_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_COMMON_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_COMMON_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_COMMON_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end VRPRJ;

/



