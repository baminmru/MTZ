
/* --PEKL*/

 create or replace package PEKL as

procedure PEKL_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKL_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKL_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKL_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKL_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKL_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKL_DEFid CHAR,
 ainstanceid char
); 
procedure PEKL_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKL_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* ����������� *//* ����������� */
,aTheDep CHAR/* ������ *//* ������ */
,aFromDate
 DATE/* ������ �������� *//* ������ �������� */
,aToDate
 DATE := null /* ��������� �������� *//* ��������� �������� */
); 
procedure PEKL_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKL_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKL_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKL_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKL_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKL_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKL_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKL_WDAY_BRIEF  (
 aCURSESSION CHAR,
 aPEKL_WDAYid CHAR,
 aBRIEF out varchar2
);
procedure PEKL_WDAY_DELETE  (
 aCURSESSION CHAR,
 aPEKL_WDAYid CHAR,
 ainstanceid char
); 
procedure PEKL_WDAY_SAVE (
 aCURSESSION CHAR,
 aPEKL_WDAYid CHAR,
aInstanceID CHAR 
,aTrain CHAR/* ����� *//* ����� */
,aGOTYPE CHAR := null /* ��� ��� *//* ��� ��� */
,aTheValue
 NUMBER := null /* ����� *//* ����� */
,aTheValueEDIZM CHAR := null /* ��. ���. ������ *//* ��. ���. ������ */
,aWeightValue
 NUMBER := null /* ��� *//* ��� */
,aWeightEDIZM CHAR := null /* ��. ���. ���� *//* ��. ���. ���� */
,athe_Description VARCHAR2 := null /* �������� *//* �������� */
); 
procedure PEKL_WDAY_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKL_WDAY_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKL_WDAY_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKL_WDAY_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKL_WDAY_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKL_WDAY_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKL_WDAY_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKL;

/



