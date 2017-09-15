
/* --MTZwp*/

 create or replace package MTZwp as

procedure MTZwp_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZwp_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZwp_propagate(acursession CHAR, aROWID CHAR); 


procedure WorkPlace_BRIEF  (
 aCURSESSION CHAR,
 aWorkPlaceid CHAR,
 aBRIEF out varchar2
);
procedure WorkPlace_DELETE  (
 aCURSESSION CHAR,
 aWorkPlaceid CHAR,
 ainstanceid char
); 
procedure WorkPlace_SAVE (
 aCURSESSION CHAR,
 aWorkPlaceid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aCaption
 VARCHAR2/* ��������� *//* ��������� */
,aTheVersion
 VARCHAR2 := null /* ������ *//* ������ */
,aThePlatform
 NUMBER := null /* ��������� ���������� *//* ��������� ���������� */
,aTheComment VARCHAR2 := null /* ���������� *//* ���������� */
); 
procedure WorkPlace_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WorkPlace_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WorkPlace_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WorkPlace_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WorkPlace_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WorkPlace_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WorkPlace_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure EntryPoints_BRIEF  (
 aCURSESSION CHAR,
 aEntryPointsid CHAR,
 aBRIEF out varchar2
);
procedure EntryPoints_DELETE  (
 aCURSESSION CHAR,
 aEntryPointsid CHAR,
 ainstanceid char
); 
procedure EntryPoints_SAVE (
 aCURSESSION CHAR,
 aEntryPointsid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,asequence
 NUMBER/* ������������������ *//* ������������������ */
,aName
 VARCHAR2/* �������� *//* �������� */
,aCaption
 VARCHAR2/* ��������� *//* ��������� */
,aAsToolbarItem
 NUMBER/* �������� � ������ *//* �������� � ������ */
,aActionType
 NUMBER/* ������� �������� *//* ������� �������� */
,aTheFilter CHAR := null /* ������ *//* ������ */
,aJournal CHAR := null /* ������ *//* ������ */
,aReport CHAR := null /* ����� *//* ����� */
,aDocument CHAR := null /* �������� *//* �������� */
,aMethod CHAR := null /* ����� *//* ����� */
,aIconFile
 VARCHAR2 := null /* ���� �������� *//* ���� �������� */
,aTheExtention CHAR := null /* ���������� *//* ���������� */
,aARM CHAR := null /* ��� *//* ��� */
,aTheComment VARCHAR2 := null /* ���������� *//* ���������� */
); 
procedure EntryPoints_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure EntryPoints_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure EntryPoints_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure EntryPoints_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure EntryPoints_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure EntryPoints_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure EntryPoints_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure EPFilterLink_BRIEF  (
 aCURSESSION CHAR,
 aEPFilterLinkid CHAR,
 aBRIEF out varchar2
);
procedure EPFilterLink_DELETE  (
 aCURSESSION CHAR,
 aEPFilterLinkid CHAR,
 ainstanceid char
); 
procedure EPFilterLink_SAVE (
 aCURSESSION CHAR,
 aEPFilterLinkid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aRowSource
 VARCHAR2/* �������� *//* �������� */
,aTheExpression VARCHAR2/* ��������� *//* ��������� */
); 
procedure EPFilterLink_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure EPFilterLink_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure EPFilterLink_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure EPFilterLink_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure EPFilterLink_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure EPFilterLink_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure EPFilterLink_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ARMTypes_BRIEF  (
 aCURSESSION CHAR,
 aARMTypesid CHAR,
 aBRIEF out varchar2
);
procedure ARMTypes_DELETE  (
 aCURSESSION CHAR,
 aARMTypesid CHAR,
 ainstanceid char
); 
procedure ARMTypes_SAVE (
 aCURSESSION CHAR,
 aARMTypesid CHAR,
aInstanceID CHAR 
,aTheDocumentType CHAR/* ��� ��������� *//* ��� ��������� */
); 
procedure ARMTypes_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ARMTypes_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ARMTypes_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ARMTypes_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ARMTypes_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ARMTypes_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ARMTypes_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ARMJournal_BRIEF  (
 aCURSESSION CHAR,
 aARMJournalid CHAR,
 aBRIEF out varchar2
);
procedure ARMJournal_DELETE  (
 aCURSESSION CHAR,
 aARMJournalid CHAR,
 ainstanceid char
); 
procedure ARMJournal_SAVE (
 aCURSESSION CHAR,
 aARMJournalid CHAR,
aInstanceID CHAR 
,aTheJournal CHAR/* ������ *//* ������ */
); 
procedure ARMJournal_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ARMJournal_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ARMJournal_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ARMJournal_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ARMJournal_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ARMJournal_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ARMJournal_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ARMJRNLADD_BRIEF  (
 aCURSESSION CHAR,
 aARMJRNLADDid CHAR,
 aBRIEF out varchar2
);
procedure ARMJRNLADD_DELETE  (
 aCURSESSION CHAR,
 aARMJRNLADDid CHAR,
 ainstanceid char
); 
procedure ARMJRNLADD_SAVE (
 aCURSESSION CHAR,
 aARMJRNLADDid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aTheExtention CHAR/* ���������� *//* ���������� */
); 
procedure ARMJRNLADD_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ARMJRNLADD_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ARMJRNLADD_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ARMJRNLADD_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ARMJRNLADD_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ARMJRNLADD_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ARMJRNLADD_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ARMJRNLREP_BRIEF  (
 aCURSESSION CHAR,
 aARMJRNLREPid CHAR,
 aBRIEF out varchar2
);
procedure ARMJRNLREP_DELETE  (
 aCURSESSION CHAR,
 aARMJRNLREPid CHAR,
 ainstanceid char
); 
procedure ARMJRNLREP_SAVE (
 aCURSESSION CHAR,
 aARMJRNLREPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,arepname
 VARCHAR2/* �������� ������ *//* �������� ������ */
,aTheReport CHAR/* ����� *//* ����� */
); 
procedure ARMJRNLREP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ARMJRNLREP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ARMJRNLREP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ARMJRNLREP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ARMJRNLREP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ARMJRNLREP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ARMJRNLREP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ARMJRNLRUN_BRIEF  (
 aCURSESSION CHAR,
 aARMJRNLRUNid CHAR,
 aBRIEF out varchar2
);
procedure ARMJRNLRUN_DELETE  (
 aCURSESSION CHAR,
 aARMJRNLRUNid CHAR,
 ainstanceid char
); 
procedure ARMJRNLRUN_SAVE (
 aCURSESSION CHAR,
 aARMJRNLRUNid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aTheExtention CHAR/* ���������� *//* ���������� */
); 
procedure ARMJRNLRUN_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ARMJRNLRUN_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ARMJRNLRUN_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ARMJRNLRUN_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ARMJRNLRUN_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ARMJRNLRUN_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ARMJRNLRUN_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZwp;

/



