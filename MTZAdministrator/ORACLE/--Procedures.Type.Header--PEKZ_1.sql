
/* --PEKZ*/

 create or replace package PEKZ as

procedure PEKZ_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKZ_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKZ_propagate(acursession CHAR, aROWID CHAR); 


procedure pekz_path_BRIEF  (
 aCURSESSION CHAR,
 apekz_pathid CHAR,
 aBRIEF out varchar2
);
procedure pekz_path_DELETE  (
 aCURSESSION CHAR,
 apekz_pathid CHAR,
 ainstanceid char
); 
procedure pekz_path_SAVE (
 aCURSESSION CHAR,
 apekz_pathid CHAR,
aInstanceID CHAR 
,asequence
 NUMBER/* � *//* � */
,aTheDirection CHAR/* ����������� *//* ����������� */
,aPPONum
 NUMBER/* ���-�� �� *//* ���-�� �� */
,aDestStation CHAR/* ������� ���������� *//* ������� ���������� */
,aPPODescription CHAR := null /* �������� ����� *//* �������� ����� */
,aReceiver CHAR := null /* ���������� *//* ���������� */
,aPPOWeight
 NUMBER/* ��� �� *//* ��� �� */
,aWeightEDIZM CHAR := null /* ��. ���. ���� *//* ��. ���. ���� */
,aPPOVol
 NUMBER := null /* ����� �� *//* ����� �� */
,aValueEDIZM CHAR := null /* ��.���. ������ *//* ��.���. ������ */
,aPathPlanedDate
 DATE := null /* ���� �������������� �������� *//* ���� �������������� �������� */
,aSendDate
 DATE := null /* ���� �������� *//* ���� �������� */
,aRcvWaitDate
 DATE := null /* ��������������� ���� ��������� *//* ��������������� ���� ��������� */
,atrainNo CHAR := null /* ����� *//* ����� */
,avagNo
 VARCHAR2 := null /* ����� � *//* ����� � */
,aPassFIO
 VARCHAR2 := null /* ��� ���������� *//* ��� ���������� */
,aPassDate
 DATE := null /* ���� �������� ����� � ����� *//* ���� �������� ����� � ����� */
,aRcvFIO
 VARCHAR2 := null /* ��� ��� *//* ��� ��� */
,aRcvDate
 DATE := null /* ���� ��������� ����� � �� *//* ���� ��������� ����� � �� */
,aInforRcvFIO
 VARCHAR2 := null /* ���� �������� ���������� *//* ���� �������� ���������� */
,aInfoDate
 DATE := null /* ���� �������� ���������� *//* ���� �������� ���������� */
,aInfoSendType CHAR := null /* ������ �������� ���������� *//* ������ �������� ���������� */
,aTheCurrency CHAR := null /* ������ *//* ������ */
,aTRF
 NUMBER := null /* ����� *//* ����� */
,aSummNDS
 NUMBER := null /* ����� � ��� *//* ����� � ��� */
,aSumm
 NUMBER := null /* ����� ��� ��� *//* ����� ��� ��� */
,aSupTRF
 NUMBER := null /* ����� ���������� *//* ����� ���������� */
,aSupSumm
 NUMBER := null /* ����� ���������� ��� ��� *//* ����� ���������� ��� ��� */
,aSupSummNDS
 NUMBER := null /* ����� ���������� � ��� *//* ����� ���������� � ��� */
); 
procedure pekz_path_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure pekz_path_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure pekz_path_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure pekz_path_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure pekz_path_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure pekz_path_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure pekz_path_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKZ_WLIST_BRIEF  (
 aCURSESSION CHAR,
 aPEKZ_WLISTid CHAR,
 aBRIEF out varchar2
);
procedure PEKZ_WLIST_DELETE  (
 aCURSESSION CHAR,
 aPEKZ_WLISTid CHAR,
 ainstanceid char
); 
procedure PEKZ_WLIST_SAVE (
 aCURSESSION CHAR,
 aPEKZ_WLISTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,asequence
 NUMBER/* � *//* � */
,atheWeight
 NUMBER/* ��� *//* ��� */
,ashCode
 VARCHAR2 := null /* ����� ��� *//* ����� ��� */
); 
procedure PEKZ_WLIST_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKZ_WLIST_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKZ_WLIST_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKZ_WLIST_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKZ_WLIST_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKZ_WLIST_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKZ_WLIST_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKZ_WLADDS_BRIEF  (
 aCURSESSION CHAR,
 aPEKZ_WLADDSid CHAR,
 aBRIEF out varchar2
);
procedure PEKZ_WLADDS_DELETE  (
 aCURSESSION CHAR,
 aPEKZ_WLADDSid CHAR,
 ainstanceid char
); 
procedure PEKZ_WLADDS_SAVE (
 aCURSESSION CHAR,
 aPEKZ_WLADDSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheAdds CHAR/* �������� *//* �������� */
); 
procedure PEKZ_WLADDS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKZ_WLADDS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKZ_WLADDS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKZ_WLADDS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKZ_WLADDS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKZ_WLADDS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKZ_WLADDS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKZ_DOCS_BRIEF  (
 aCURSESSION CHAR,
 aPEKZ_DOCSid CHAR,
 aBRIEF out varchar2
);
procedure PEKZ_DOCS_DELETE  (
 aCURSESSION CHAR,
 aPEKZ_DOCSid CHAR,
 ainstanceid char
); 
procedure PEKZ_DOCS_SAVE (
 aCURSESSION CHAR,
 aPEKZ_DOCSid CHAR,
aInstanceID CHAR 
,aTheDoc CHAR/* �������� *//* �������� */
); 
procedure PEKZ_DOCS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKZ_DOCS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKZ_DOCS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKZ_DOCS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKZ_DOCS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKZ_DOCS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKZ_DOCS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure pekz_def_BRIEF  (
 aCURSESSION CHAR,
 apekz_defid CHAR,
 aBRIEF out varchar2
);
procedure pekz_def_DELETE  (
 aCURSESSION CHAR,
 apekz_defid CHAR,
 ainstanceid char
); 
procedure pekz_def_SAVE (
 aCURSESSION CHAR,
 apekz_defid CHAR,
aInstanceID CHAR 
,aQueryDate
 DATE/* ���� ������� *//* ���� ������� */
,aFillial CHAR/* ������� � *//* ������� � */
,aPEKCode
 VARCHAR2 := null /* � ������ *//* � ������ */
,aPlatType
 NUMBER/* ������ *//* ������ */
,aTRType CHAR/* ��� �������� *//* ��� �������� */
,aPlanedDate
 DATE := null /* ���� �������������� �������� *//* ���� �������������� �������� */
,aClientFrom CHAR := null /* ����������� *//* ����������� */
,aClientTo CHAR := null /* ���������� *//* ���������� */
,aClientPayed CHAR := null /* ���������� *//* ���������� */
,aAcceptDate
 DATE := null /* ���� ������ ������ *//* ���� ������ ������ */
,aIsNal
 NUMBER/* �������� ������ *//* �������� ������ */
,aSupplier CHAR := null /* ��������� *//* ��������� */
,aTheComment VARCHAR2 := null /* ���������� *//* ���������� */
,aTheDogovor CHAR := null /* ������� *//* ������� */
,aAcceptTime
 DATE := null /* ����� ������ ������ *//* ����� ������ ������ */
,aLoadTime
 DATE := null /* ����� ������ ����� �� ����� *//* ����� ������ ����� �� ����� */
,aORG CHAR := null /* ����������� *//* ����������� */
,aLoadDate
 DATE := null /* ���� ������ ����� �� ����� *//* ���� ������ ����� �� ����� */
,aTRF CHAR := null /* ����� *//* ����� */
,aCode1C
 VARCHAR2 := null /* ���1� *//* ���1� */
,aIncludeInOrder
 NUMBER := null /* ������� � ����� *//* ������� � ����� */
,aIncludeInAct
 NUMBER := null /* �������� � ��� *//* �������� � ��� */
,aSummNDS
 NUMBER := null /* ����� � ��� *//* ����� � ��� */
,aSumm
 NUMBER := null /* ����� ��� ��� *//* ����� ��� ��� */
,aSummDop
 NUMBER := null /* ����� ���. ����� ��� ��� *//* ����� ���. ����� ��� ��� */
,aSummDopNDS
 NUMBER := null /* ����� ���. ����� � ��� *//* ����� ���. ����� � ��� */
); 
procedure pekz_def_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure pekz_def_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure pekz_def_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure pekz_def_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure pekz_def_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure pekz_def_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure pekz_def_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure pekz_dop_BRIEF  (
 aCURSESSION CHAR,
 apekz_dopid CHAR,
 aBRIEF out varchar2
);
procedure pekz_dop_DELETE  (
 aCURSESSION CHAR,
 apekz_dopid CHAR,
 ainstanceid char
); 
procedure pekz_dop_SAVE (
 aCURSESSION CHAR,
 apekz_dopid CHAR,
aInstanceID CHAR 
,asequence
 NUMBER/* � *//* � */
,aSRV CHAR/* ������ *//* ������ */
,aQuantity
 NUMBER/* ���������� *//* ���������� */
,aEDIZM CHAR := null /* ��. ��������� *//* ��. ��������� */
,aPathFilial CHAR := null /* ������ *//* ������ */
,aDopSupplier CHAR := null /* ��������� *//* ��������� */
,aTheCurrency CHAR := null /* ������ *//* ������ */
,aTRF
 NUMBER := null /* ����� *//* ����� */
,aSumm
 NUMBER := null /* ����� ��� ��� *//* ����� ��� ��� */
,aSummNDS
 NUMBER := null /* ����� � ��� *//* ����� � ��� */
,aSupTRF
 NUMBER := null /* ����� ���������� *//* ����� ���������� */
,aSupSumm
 NUMBER := null /* ����� ���������� ��� ��� *//* ����� ���������� ��� ��� */
,aSupSummNDS
 NUMBER := null /* ����� ���������� � ��� *//* ����� ���������� � ��� */
); 
procedure pekz_dop_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure pekz_dop_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure pekz_dop_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure pekz_dop_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure pekz_dop_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure pekz_dop_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure pekz_dop_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKZ;

/



