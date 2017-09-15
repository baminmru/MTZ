
/* --PEKCL*/

 create or replace package PEKCL as

procedure PEKCL_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKCL_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKCL_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKCL_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKCL_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKCL_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKCL_DEFid CHAR,
 ainstanceid char
); 
procedure PEKCL_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKCL_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* ����������� *//* ����������� */
,aTheDep CHAR/* ������ *//* ������ */
,aLimDate
 DATE/* ���� *//* ���� */
); 
procedure PEKCL_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKCL_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKCL_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKCL_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKCL_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKCL_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKCL_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKCL_DAYLY_BRIEF  (
 aCURSESSION CHAR,
 aPEKCL_DAYLYid CHAR,
 aBRIEF out varchar2
);
procedure PEKCL_DAYLY_DELETE  (
 aCURSESSION CHAR,
 aPEKCL_DAYLYid CHAR,
 ainstanceid char
); 
procedure PEKCL_DAYLY_SAVE (
 aCURSESSION CHAR,
 aPEKCL_DAYLYid CHAR,
aInstanceID CHAR 
,aTrain CHAR/* ����� *//* ����� */
,aGOTYPE CHAR := null /* ��� ��� *//* ��� ��� */
,aTheValue
 NUMBER := null /* ����� *//* ����� */
,aValueEDIZM CHAR := null /* ��. ���. ������ *//* ��. ���. ������ */
,aWeightValue
 NUMBER := null /* ��� *//* ��� */
,aWeightEDIZM CHAR := null /* ��. ���.���� *//* ��. ���.���� */
,athe_Description VARCHAR2 := null /* �������� *//* �������� */
); 
procedure PEKCL_DAYLY_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKCL_DAYLY_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKCL_DAYLY_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKCL_DAYLY_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKCL_DAYLY_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKCL_DAYLY_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKCL_DAYLY_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKL_TOLOAD_BRIEF  (
 aCURSESSION CHAR,
 aPEKL_TOLOADid CHAR,
 aBRIEF out varchar2
);
procedure PEKL_TOLOAD_DELETE  (
 aCURSESSION CHAR,
 aPEKL_TOLOADid CHAR,
 ainstanceid char
); 
procedure PEKL_TOLOAD_SAVE (
 aCURSESSION CHAR,
 aPEKL_TOLOADid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSRCPekZ CHAR/* �� ������ *//* �� ������ */
,aTheValue
 NUMBER := null /* ����� *//* ����� */
,aValueEDIZM CHAR := null /* ��. ���. ������ *//* ��. ���. ������ */
,aWeightValue
 NUMBER := null /* ��� *//* ��� */
,aWeightEDIZM CHAR := null /* ��. ���.���� *//* ��. ���.���� */
); 
procedure PEKL_TOLOAD_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKL_TOLOAD_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKL_TOLOAD_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKL_TOLOAD_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKL_TOLOAD_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKL_TOLOAD_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKL_TOLOAD_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKCL;

/



