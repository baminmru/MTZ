
/* --WFFD*/

 create or replace package WFFD as

procedure WFFD_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure WFFD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure WFFD_propagate(acursession CHAR, aROWID CHAR); 


procedure WFFD_ShortCut_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_ShortCutid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_ShortCut_DELETE  (
 aCURSESSION CHAR,
 aWFFD_ShortCutid CHAR,
 ainstanceid char
); 
procedure WFFD_ShortCut_SAVE (
 aCURSESSION CHAR,
 aWFFD_ShortCutid CHAR,
aInstanceID CHAR 
,aFolder CHAR/* ����� *//* ����� */
,aDocName
 VARCHAR2/* �������� ��������� *//* �������� ��������� */
,aStartMode
 VARCHAR2 := null /* ����� ������� *//* ����� ������� */
); 
procedure WFFD_ShortCut_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_ShortCut_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_ShortCut_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_ShortCut_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_ShortCut_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_ShortCut_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_ShortCut_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_Results_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_Resultsid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_Results_DELETE  (
 aCURSESSION CHAR,
 aWFFD_Resultsid CHAR,
 ainstanceid char
); 
procedure WFFD_Results_SAVE (
 aCURSESSION CHAR,
 aWFFD_Resultsid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* ������������ *//* ������������ */
,aResultWeight
 NUMBER := null /* ������� ���������� *//* ������� ���������� */
); 
procedure WFFD_Results_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_Results_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_Results_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_Results_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_Results_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_Results_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_Results_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_DOCSTOPS_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_DOCSTOPSid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_DOCSTOPS_DELETE  (
 aCURSESSION CHAR,
 aWFFD_DOCSTOPSid CHAR,
 ainstanceid char
); 
procedure WFFD_DOCSTOPS_SAVE (
 aCURSESSION CHAR,
 aWFFD_DOCSTOPSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aProcessDocument CHAR/* �������� ������� *//* �������� ������� */
,aDocStateName
 VARCHAR2/* �������� ��������� *//* �������� ��������� */
); 
procedure WFFD_DOCSTOPS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_DOCSTOPS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_DOCSTOPS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_DOCSTOPS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_DOCSTOPS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_DOCSTOPS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_DOCSTOPS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_CustomParam_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_CustomParamid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_CustomParam_DELETE  (
 aCURSESSION CHAR,
 aWFFD_CustomParamid CHAR,
 ainstanceid char
); 
procedure WFFD_CustomParam_SAVE (
 aCURSESSION CHAR,
 aWFFD_CustomParamid CHAR,
aInstanceID CHAR 
,aParamName
 VARCHAR2/* ��� ��������� *//* ��� ��������� */
,athe_Value VARCHAR2 := null /* �������� *//* �������� */
); 
procedure WFFD_CustomParam_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_CustomParam_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_CustomParam_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_CustomParam_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_CustomParam_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_CustomParam_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_CustomParam_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_Doer_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_Doerid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_Doer_DELETE  (
 aCURSESSION CHAR,
 aWFFD_Doerid CHAR,
 ainstanceid char
); 
procedure WFFD_Doer_SAVE (
 aCURSESSION CHAR,
 aWFFD_Doerid CHAR,
aInstanceID CHAR 
,aDoerGroup CHAR/* ������ *//* ������ */
); 
procedure WFFD_Doer_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_Doer_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_Doer_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_Doer_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_Doer_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_Doer_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_Doer_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_common_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_commonid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_common_DELETE  (
 aCURSESSION CHAR,
 aWFFD_commonid CHAR,
 ainstanceid char
); 
procedure WFFD_common_SAVE (
 aCURSESSION CHAR,
 aWFFD_commonid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aStepType CHAR/* ��� ���� *//* ��� ���� */
,aReuseStep
 NUMBER/* ������������ ������������� ��� *//* ������������ ������������� ��� */
,aAutoCheckState
 NUMBER/* ��������� ��������� *//* ��������� ��������� */
,aReStartInterval
 NUMBER := null /* �������� ����������� (���.) *//* �������� ����������� (���.) */
,aStateCeckInterval
 NUMBER := null /* �������� �������� ��������� (���.) *//* �������� �������� ��������� (���.) */
,aMinPriority
 NUMBER := null /* ����������� ��������� *//* ����������� ��������� */
,aMaxPriority
 NUMBER := null /* ������������ ��������� *//* ������������ ��������� */
,aIncPriority
 NUMBER := null /* ������� ���������� *//* ������� ���������� */
,aGrowPriorityInterval
 NUMBER := null /* �������� ����� ���������� (���.) *//* �������� ����� ���������� (���.) */
,aMaxPassNumber
 NUMBER := null /* ������������ ����� ������� *//* ������������ ����� ������� */
,aTaskDescription VARCHAR2 := null /* �������� ������� *//* �������� ������� */
,aAttachment VARCHAR2 := null /* �������� */
,aAttachment_EXT varchar2 /* �������� */
,aWorkTime
 NUMBER := null /* ���� ���������� (�.) *//* ���� ���������� (�.) */
,aIntegrationData1
 VARCHAR2 := null /* ������ ��� ���������� 1 *//* ������ ��� ���������� 1 */
,aIntegrationData2
 VARCHAR2 := null /* ������ ��� ���������� 2 *//* ������ ��� ���������� 2 */
); 
procedure WFFD_common_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_common_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_common_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_common_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_common_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_common_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_common_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_ATTR1_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_ATTR1id CHAR,
 aBRIEF out varchar2
);
procedure WFFD_ATTR1_DELETE  (
 aCURSESSION CHAR,
 aWFFD_ATTR1id CHAR,
 ainstanceid char
); 
procedure WFFD_ATTR1_SAVE (
 aCURSESSION CHAR,
 aWFFD_ATTR1id CHAR,
aInstanceID CHAR 
,aObjectType CHAR := null /* ��� ��������� *//* ��� ��������� */
,aProcessDocument CHAR := null /* �������� ������� *//* �������� ������� */
,aSubProcDocument
 VARCHAR2 := null /* �������� ��������� � ����������� *//* �������� ��������� � ����������� */
,aDocumentPart CHAR := null /* ������ ��������� *//* ������ ��������� */
,aPartField CHAR := null /* ���� � ������� *//* ���� � ������� */
,aFolder CHAR := null /* ����� � �������� *//* ����� � �������� */
,aProcessParameter CHAR := null /* ���������� 1 *//* ���������� 1 */
,aProcessParameter2 CHAR := null /* ���������� 2 *//* ���������� 2 */
,athe_Value
 VARCHAR2 := null /* �������� *//* �������� */
,aValue2
 VARCHAR2 := null /* ��������2 *//* ��������2 */
,aPath VARCHAR2 := null /* ���������� *//* ���������� */
,aPath2 VARCHAR2 := null /* ���������� ��� ���������� *//* ���������� ��� ���������� */
,aFlag
 NUMBER := null /* ���� *//* ���� */
,aFlag2
 NUMBER := null /* ���� 2 *//* ���� 2 */
,aSubProcessType CHAR := null /* ��� ����������� *//* ��� ����������� */
,aProcessParameter3 CHAR := null /* ���������� 3 *//* ���������� 3 */
,aProcessParameter4 CHAR := null /* ���������� 4 *//* ���������� 4 */
,aDocState1 CHAR := null /* ��������� 1 *//* ��������� 1 */
,aDocState2 CHAR := null /* ��������� 2 *//* ��������� 2 */
); 
procedure WFFD_ATTR1_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_ATTR1_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_ATTR1_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_ATTR1_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_ATTR1_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_ATTR1_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_ATTR1_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_DOCS_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_DOCSid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_DOCS_DELETE  (
 aCURSESSION CHAR,
 aWFFD_DOCSid CHAR,
 ainstanceid char
); 
procedure WFFD_DOCS_SAVE (
 aCURSESSION CHAR,
 aWFFD_DOCSid CHAR,
aInstanceID CHAR 
,aProcessDocument CHAR/* �������� ������� *//* �������� ������� */
,aAllowCreate
 NUMBER := null /* ��������� �������� *//* ��������� �������� */
,aAllowWrite
 NUMBER := null /* ��������� ����������� *//* ��������� ����������� */
,aDocMode
 VARCHAR2 := null /* ����� �������� ��������� *//* ����� �������� ��������� */
); 
procedure WFFD_DOCS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_DOCS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_DOCS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_DOCS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_DOCS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_DOCS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_DOCS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end WFFD;

/



