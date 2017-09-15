
/* --PEKPQ*/

 create or replace package PEKPQ as

procedure PEKPQ_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKPQ_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKPQ_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKPQ_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKPQ_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKPQ_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKPQ_DEFid CHAR,
 ainstanceid char
); 
procedure PEKPQ_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKPQ_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR := null /* ����������� *//* ����������� */
,asequence
 NUMBER/* � *//* � */
,aTheDate
 DATE/* ���� ���������� *//* ���� ���������� */
,aTheDept CHAR/* ������������� *//* ������������� */
,aTheComment VARCHAR2/* ���������� ������� *//* ���������� ������� */
,aTheSumm
 NUMBER/* ���� ������� *//* ���� ������� */
,aToSuplier CHAR/* ���������� *//* ���������� */
,aTheDescription VARCHAR2 := null /* ���������� *//* ���������� */
,aTheDogovor CHAR := null /* ������� *//* ������� */
,aCode1C
 VARCHAR2 := null /* ���1� *//* ���1� */
); 
procedure PEKPQ_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKPQ_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKPQ_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKPQ_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKPQ_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKPQ_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKPQ_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKPQ;

/



