
/* --MTZ2JOB*/

 create or replace package MTZ2JOB as

procedure MTZ2JOB_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZ2JOB_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZ2JOB_propagate(acursession CHAR, aROWID CHAR); 


procedure MTZ2JOB_DEF_BRIEF  (
 aCURSESSION CHAR,
 aMTZ2JOB_DEFid CHAR,
 aBRIEF out varchar2
);
procedure MTZ2JOB_DEF_DELETE  (
 aCURSESSION CHAR,
 aMTZ2JOB_DEFid CHAR,
 ainstanceid char
); 
procedure MTZ2JOB_DEF_SAVE (
 aCURSESSION CHAR,
 aMTZ2JOB_DEFid CHAR,
aInstanceID CHAR 
,aEventDate
 DATE/* �������� �� *//* �������� �� */
,aEvenType
 VARCHAR2/* ��� ������� *//* ��� ������� */
,aThruObject CHAR/* ������ - ������� ������� *//* ������ - ������� ������� */
,aThruState CHAR := null /* ��������� - ������� *//* ��������� - ������� */
,aNextState CHAR := null /* ��������� ����� ��������� *//* ��������� ����� ��������� */
,aProcessDate
 DATE := null /* ������ ��������� *//* ������ ��������� */
,aProcessed
 NUMBER/* ��������� *//* ��������� */
); 
procedure MTZ2JOB_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure MTZ2JOB_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure MTZ2JOB_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure MTZ2JOB_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure MTZ2JOB_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure MTZ2JOB_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure MTZ2JOB_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZ2JOB;

/



