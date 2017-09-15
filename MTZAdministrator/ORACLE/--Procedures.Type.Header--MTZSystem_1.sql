
/* --MTZSystem*/

 create or replace package MTZSystem as

procedure MTZSystem_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZSystem_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZSystem_propagate(acursession CHAR, aROWID CHAR); 


procedure SysLog_BRIEF  (
 aCURSESSION CHAR,
 aSysLogid CHAR,
 aBRIEF out varchar2
);
procedure SysLog_DELETE  (
 aCURSESSION CHAR,
 aSysLogid CHAR,
 ainstanceid char
); 
procedure SysLog_SAVE (
 aCURSESSION CHAR,
 aSysLogid CHAR,
aInstanceID CHAR 
,aTheSession CHAR/* ������ *//* ������ */
,athe_Resource
 VARCHAR2/* ������ *//* ������ */
,aLogStructID
 VARCHAR2 := null /* ������ � ������� ��������� �������� *//* ������ � ������� ��������� �������� */
,aVERB
 VARCHAR2/* �������� *//* �������� */
,aLogInstanceID CHAR := null /* ������������� ��������� *//* ������������� ��������� */
); 
procedure SysLog_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure SysLog_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure SysLog_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure SysLog_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure SysLog_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure SysLog_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure SysLog_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure the_Session_BRIEF  (
 aCURSESSION CHAR,
 athe_Sessionid CHAR,
 aBRIEF out varchar2
);
procedure the_Session_DELETE  (
 aCURSESSION CHAR,
 athe_Sessionid CHAR,
 ainstanceid char
); 
procedure the_Session_SAVE (
 aCURSESSION CHAR,
 athe_Sessionid CHAR,
aInstanceID CHAR 
,aUserRole CHAR := null /* ������� ���� ������������ *//* ������� ���� ������������ */
,aClosedAt
 DATE := null /* ������ �������� *//* ������ �������� */
,aClosed
 NUMBER/* ������� *//* ������� */
,aUsersid CHAR/* ������������ *//* ������������ */
,aLastAccess
 DATE := null /* ��������� ������������� *//* ��������� ������������� */
,aStartAt
 DATE/* ������ �������� *//* ������ �������� */
); 
procedure the_Session_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure the_Session_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure the_Session_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure the_Session_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure the_Session_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure the_Session_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure the_Session_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure LogReader_BRIEF  (
 aCURSESSION CHAR,
 aLogReaderid CHAR,
 aBRIEF out varchar2
);
procedure LogReader_DELETE  (
 aCURSESSION CHAR,
 aLogReaderid CHAR,
 ainstanceid char
); 
procedure LogReader_SAVE (
 aCURSESSION CHAR,
 aLogReaderid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aAutoStart
 NUMBER/* ������������������ ������ *//* ������������������ ������ */
,aAutoProgid
 VARCHAR2 := null /* ����� ��� ��������������� ������� *//* ����� ��� ��������������� ������� */
,aReadMarker
 DATE/* ���� ��������� ����������� ������ *//* ���� ��������� ����������� ������ */
,aStartInterval
 NUMBER := null /* �������� ������� (���) *//* �������� ������� (���) */
,aLastStart
 DATE := null /* ���� ���������� ������� *//* ���� ���������� ������� */
,aLastStop
 DATE := null /* ���� �������� �������� *//* ���� �������� �������� */
); 
procedure LogReader_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure LogReader_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure LogReader_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure LogReader_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure LogReader_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure LogReader_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure LogReader_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure Verb_BRIEF  (
 aCURSESSION CHAR,
 aVerbid CHAR,
 aBRIEF out varchar2
);
procedure Verb_DELETE  (
 aCURSESSION CHAR,
 aVerbid CHAR,
 ainstanceid char
); 
procedure Verb_SAVE (
 aCURSESSION CHAR,
 aVerbid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
); 
procedure Verb_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Verb_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Verb_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Verb_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Verb_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Verb_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Verb_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZSystem;

/



