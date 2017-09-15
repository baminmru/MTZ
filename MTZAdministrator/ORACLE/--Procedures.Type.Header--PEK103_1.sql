
/* --PEK103*/

 create or replace package PEK103 as

procedure PEK103_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEK103_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEK103_propagate(acursession CHAR, aROWID CHAR); 


procedure PEK103_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEK103_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEK103_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEK103_DEFid CHAR,
 ainstanceid char
); 
procedure PEK103_DEF_SAVE (
 aCURSESSION CHAR,
 aPEK103_DEFid CHAR,
aInstanceID CHAR 
,aTheNumber
 NUMBER/* ����� *//* ����� */
,aORG CHAR/* ����������� *//* ����������� */
,aSender VARCHAR2/* ����������� *//* ����������� */
,aRcvDate
 DATE/* ���� ������ ������ *//* ���� ������ ������ */
,aVOP CHAR := null /* ��� ������ *//* ��� ������ */
,aComent VARCHAR2 := null /* ���������� *//* ���������� */
,aNodeDate
 DATE := null /* ���� �������  *//* ���� �������  */
,aPEKZ CHAR/* ������ *//* ������ */
,aThePath CHAR/* ������ �������� *//* ������ �������� */
); 
procedure PEK103_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEK103_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEK103_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEK103_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEK103_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEK103_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEK103_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEK103_LINES_BRIEF  (
 aCURSESSION CHAR,
 aPEK103_LINESid CHAR,
 aBRIEF out varchar2
);
procedure PEK103_LINES_DELETE  (
 aCURSESSION CHAR,
 aPEK103_LINESid CHAR,
 ainstanceid char
); 
procedure PEK103_LINES_SAVE (
 aCURSESSION CHAR,
 aPEK103_LINESid CHAR,
aInstanceID CHAR 
,aSeqence
 NUMBER/* � �\� *//* � �\� */
,aIndexTo CHAR/* ������� ���������� *//* ������� ���������� */
,aReciever
 VARCHAR2/* ���������� *//* ���������� */
,aWeight
 NUMBER/* ��� *//* ��� */
,aWeightEDIZM CHAR := null /* ��. ���. ���� *//* ��. ���. ���� */
,aQuantity
 NUMBER/* ���������� *//* ���������� */
,aCost
 NUMBER/* ��������� ��������� *//* ��������� ��������� */
,aPPOCode
 VARCHAR2/* ��� ����������� *//* ��� ����������� */
); 
procedure PEK103_LINES_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEK103_LINES_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEK103_LINES_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEK103_LINES_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEK103_LINES_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEK103_LINES_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEK103_LINES_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEK103;

/



