
/* --MTZStateSrv*/

 create or replace package MTZStateSrv as

procedure MTZStateSrv_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZStateSrv_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZStateSrv_propagate(acursession CHAR, aROWID CHAR); 


procedure StateAction_BRIEF  (
 aCURSESSION CHAR,
 aStateActionid CHAR,
 aBRIEF out varchar2
);
procedure StateAction_DELETE  (
 aCURSESSION CHAR,
 aStateActionid CHAR,
 ainstanceid char
); 
procedure StateAction_SAVE (
 aCURSESSION CHAR,
 aStateActionid CHAR,
aInstanceID CHAR 
,aOnDocStatus CHAR/* ��� ����� � �������� *//* ��� ����� � �������� */
,aNewSecurityStyle CHAR := null /* ���������� ����� ������ *//* ���������� ����� ������ */
,aClearSecurity
 NUMBER/* �������� ����� ������ *//* �������� ����� ������ */
,aLibraryFile
 VARCHAR2 := null /* ����������-���������� *//* ����������-���������� */
,aActionClass
 VARCHAR2 := null /* ����� ��� ��������� *//* ����� ��� ��������� */
,aActionScript VARCHAR2 := null /* ������ ��� ���������� *//* ������ ��� ���������� */
); 
procedure StateAction_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure StateAction_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure StateAction_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure StateAction_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure StateAction_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure StateAction_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure StateAction_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZStateSrv;

/



