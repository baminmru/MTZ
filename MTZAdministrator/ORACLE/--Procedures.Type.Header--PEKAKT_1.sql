
/* --PEKAKT*/

 create or replace package PEKAKT as

procedure PEKAKT_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKAKT_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKAKT_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKACT_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKACT_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKACT_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKACT_DEFid CHAR,
 ainstanceid char
); 
procedure PEKACT_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKACT_DEFid CHAR,
aInstanceID CHAR 
,aPodrazdelenie CHAR := null /* ������������� *//* ������������� */
,aClient CHAR/* ������ *//* ������ */
,aNumber_of_akt
 NUMBER/* �����_���� *//* �����_���� */
,aDate_FROM
 DATE := null /* ���� � *//* ���� � */
,aDate_TO
 DATE := null /* ���� �� *//* ���� �� */
,aTheDgovor CHAR := null /* ������� *//* ������� */
,aCode1C
 VARCHAR2 := null /* ��� 1� *//* ��� 1� */
); 
procedure PEKACT_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKACT_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKACT_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKACT_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKACT_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKACT_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKACT_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKACT_ITOG_BRIEF  (
 aCURSESSION CHAR,
 aPEKACT_ITOGid CHAR,
 aBRIEF out varchar2
);
procedure PEKACT_ITOG_DELETE  (
 aCURSESSION CHAR,
 aPEKACT_ITOGid CHAR,
 ainstanceid char
); 
procedure PEKACT_ITOG_SAVE (
 aCURSESSION CHAR,
 aPEKACT_ITOGid CHAR,
aInstanceID CHAR 
,aSRV CHAR := null /* ������ *//* ������ */
,aSumm
 NUMBER := null /* ����� *//* ����� */
,aSummNDS
 NUMBER := null /* ����� � ��� *//* ����� � ��� */
,aSupSUMM
 NUMBER := null /* ����� ���������� *//* ����� ���������� */
,aSupSummNDS
 NUMBER := null /* ����� ���������� � ��� *//* ����� ���������� � ��� */
,aQuantity
 NUMBER := null /* ���������� *//* ���������� */
,aedizm CHAR := null /* ������� ��������� *//* ������� ��������� */
); 
procedure PEKACT_ITOG_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKACT_ITOG_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKACT_ITOG_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKACT_ITOG_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKACT_ITOG_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKACT_ITOG_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKACT_ITOG_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKACT_LINES_BRIEF  (
 aCURSESSION CHAR,
 aPEKACT_LINESid CHAR,
 aBRIEF out varchar2
);
procedure PEKACT_LINES_DELETE  (
 aCURSESSION CHAR,
 aPEKACT_LINESid CHAR,
 ainstanceid char
); 
procedure PEKACT_LINES_SAVE (
 aCURSESSION CHAR,
 aPEKACT_LINESid CHAR,
aInstanceID CHAR 
,aZayavka CHAR := null /* ������ *//* ������ */
); 
procedure PEKACT_LINES_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKACT_LINES_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKACT_LINES_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKACT_LINES_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKACT_LINES_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKACT_LINES_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKACT_LINES_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKAKT;

/



