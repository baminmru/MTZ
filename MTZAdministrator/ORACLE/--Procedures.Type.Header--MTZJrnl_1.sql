
/* --MTZJrnl*/

 create or replace package MTZJrnl as

procedure MTZJrnl_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZJrnl_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZJrnl_propagate(acursession CHAR, aROWID CHAR); 


procedure JournalColumn_BRIEF  (
 aCURSESSION CHAR,
 aJournalColumnid CHAR,
 aBRIEF out varchar2
);
procedure JournalColumn_DELETE  (
 aCURSESSION CHAR,
 aJournalColumnid CHAR,
 ainstanceid char
); 
procedure JournalColumn_SAVE (
 aCURSESSION CHAR,
 aJournalColumnid CHAR,
aInstanceID CHAR 
,asequence
 NUMBER := null /* ������������������ *//* ������������������ */
,aname
 VARCHAR2/* �������� *//* �������� */
,aColumnAlignment
 NUMBER/* ������������ *//* ������������ */
,aColSort
 NUMBER/* ���������� ������� *//* ���������� ������� */
,aGroupAggregation
 NUMBER/* ���������� ��� ����������� *//* ���������� ��� ����������� */
); 
procedure JournalColumn_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure JournalColumn_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure JournalColumn_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure JournalColumn_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure JournalColumn_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure JournalColumn_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure JournalColumn_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure JColumnSource_BRIEF  (
 aCURSESSION CHAR,
 aJColumnSourceid CHAR,
 aBRIEF out varchar2
);
procedure JColumnSource_DELETE  (
 aCURSESSION CHAR,
 aJColumnSourceid CHAR,
 ainstanceid char
); 
procedure JColumnSource_SAVE (
 aCURSESSION CHAR,
 aJColumnSourceid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSrcPartView CHAR/* ������������� *//* ������������� */
,aViewField
 VARCHAR2/* ���� ������������� *//* ���� ������������� */
); 
procedure JColumnSource_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure JColumnSource_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure JColumnSource_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure JColumnSource_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure JColumnSource_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure JColumnSource_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure JColumnSource_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure Journal_BRIEF  (
 aCURSESSION CHAR,
 aJournalid CHAR,
 aBRIEF out varchar2
);
procedure Journal_DELETE  (
 aCURSESSION CHAR,
 aJournalid CHAR,
 ainstanceid char
); 
procedure Journal_SAVE (
 aCURSESSION CHAR,
 aJournalid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,athe_Alias
 VARCHAR2 := null /* ��������� *//* ��������� */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
); 
procedure Journal_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Journal_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Journal_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Journal_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Journal_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Journal_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Journal_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure JournalSrc_BRIEF  (
 aCURSESSION CHAR,
 aJournalSrcid CHAR,
 aBRIEF out varchar2
);
procedure JournalSrc_DELETE  (
 aCURSESSION CHAR,
 aJournalSrcid CHAR,
 ainstanceid char
); 
procedure JournalSrc_SAVE (
 aCURSESSION CHAR,
 aJournalSrcid CHAR,
aInstanceID CHAR 
,aPartView CHAR/* ������������� *//* ������������� */
,aOnRun
 NUMBER/* ��� �������� *//* ��� �������� */
,aOpenMode
 VARCHAR2 := null /* ����� �������� *//* ����� �������� */
,aViewAlias
 VARCHAR2 := null /* ��������� ������������� *//* ��������� ������������� */
); 
procedure JournalSrc_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure JournalSrc_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure JournalSrc_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure JournalSrc_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure JournalSrc_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure JournalSrc_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure JournalSrc_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZJrnl;

/



