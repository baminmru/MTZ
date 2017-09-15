
/* --PEKORD*/

 create or replace package PEKORD as

procedure PEKORD_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKORD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKORD_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKORD_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKORD_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKORD_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKORD_DEFid CHAR,
 ainstanceid char
); 
procedure PEKORD_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKORD_DEFid CHAR,
aInstanceID CHAR 
,adocnumber
 NUMBER := null /* ����� ������� *//* ����� ������� */
,aauthor CHAR/* ����� *//* ����� */
,adocname
 VARCHAR2/* �������� *//* �������� */
,aOrg CHAR/* ���� ����������� *//* ���� ����������� */
,aregdate
 DATE := null /* ���� ����������� *//* ���� ����������� */
,acomments VARCHAR2 := null /* ���������� *//* ���������� */
,aTarifStartDate
 DATE/* ���� ������ �������� ������ *//* ���� ������ �������� ������ */
); 
procedure PEKORD_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKORD_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKORD_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKORD_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKORD_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKORD_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKORD_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKORD_DATA_BRIEF  (
 aCURSESSION CHAR,
 aPEKORD_DATAid CHAR,
 aBRIEF out varchar2
);
procedure PEKORD_DATA_DELETE  (
 aCURSESSION CHAR,
 aPEKORD_DATAid CHAR,
 ainstanceid char
); 
procedure PEKORD_DATA_SAVE (
 aCURSESSION CHAR,
 aPEKORD_DATAid CHAR,
aInstanceID CHAR 
,aCient CHAR/* ������ *//* ������ */
,aNewTarifType CHAR/* ��� ������ *//* ��� ������ */
); 
procedure PEKORD_DATA_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKORD_DATA_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKORD_DATA_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKORD_DATA_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKORD_DATA_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKORD_DATA_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKORD_DATA_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKORD;

/



