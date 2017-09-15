
/* --PEKTRF*/

 create or replace package PEKTRF as

procedure PEKTRF_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKTRF_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKTRF_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKTRF_REGALL_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_REGALLid CHAR,
 aBRIEF out varchar2
);
procedure PEKTRF_REGALL_DELETE  (
 aCURSESSION CHAR,
 aPEKTRF_REGALLid CHAR,
 ainstanceid char
); 
procedure PEKTRF_REGALL_SAVE (
 aCURSESSION CHAR,
 aPEKTRF_REGALLid CHAR,
aInstanceID CHAR 
,aWeightFrom
 NUMBER/* ��������� ��� �� *//* ��������� ��� �� */
,aWeightTo
 NUMBER/* ��������� ��� �� *//* ��������� ��� �� */
,aWeightEDIZM CHAR := null /* ��. ���. ���� *//* ��. ���. ���� */
,aPricePercent
 NUMBER := null /* ������� �� ������ *//* ������� �� ������ */
,aFixedPrice
 NUMBER := null /* ������������� ���� *//* ������������� ���� */
,aPriceCurrency CHAR := null /* ������ ������������� ���� *//* ������ ������������� ���� */
); 
procedure PEKTRF_REGALL_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKTRF_REGALL_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKTRF_REGALL_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKTRF_REGALL_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKTRF_REGALL_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKTRF_REGALL_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKTRF_REGALL_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKTRF_DECR_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_DECRid CHAR,
 aBRIEF out varchar2
);
procedure PEKTRF_DECR_DELETE  (
 aCURSESSION CHAR,
 aPEKTRF_DECRid CHAR,
 ainstanceid char
); 
procedure PEKTRF_DECR_SAVE (
 aCURSESSION CHAR,
 aPEKTRF_DECRid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� ������ *//* �������� ������ */
,aDecrPercent
 NUMBER/* ������� � ������ *//* ������� � ������ */
); 
procedure PEKTRF_DECR_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKTRF_DECR_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKTRF_DECR_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKTRF_DECR_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKTRF_DECR_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKTRF_DECR_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKTRF_DECR_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKTRF_ADDS_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_ADDSid CHAR,
 aBRIEF out varchar2
);
procedure PEKTRF_ADDS_DELETE  (
 aCURSESSION CHAR,
 aPEKTRF_ADDSid CHAR,
 ainstanceid char
); 
procedure PEKTRF_ADDS_SAVE (
 aCURSESSION CHAR,
 aPEKTRF_ADDSid CHAR,
aInstanceID CHAR 
,aName CHAR/* �������� �������� *//* �������� �������� */
,aAddPercent
 NUMBER/* ������� � �������� ������ *//* ������� � �������� ������ */
,aMinValue
 NUMBER := null /* ����������� �������� *//* ����������� �������� */
,aMaxValue
 NUMBER := null /* ������������ �������� *//* ������������ �������� */
); 
procedure PEKTRF_ADDS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKTRF_ADDS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKTRF_ADDS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKTRF_ADDS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKTRF_ADDS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKTRF_ADDS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKTRF_ADDS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKTRF_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKTRF_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKTRF_DEFid CHAR,
 ainstanceid char
); 
procedure PEKTRF_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKTRF_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* ����������� *//* ����������� */
,aStartDate
 DATE/* ������ �������� *//* ������ �������� */
,aTType CHAR/* ��� ������ *//* ��� ������ */
,aTRType CHAR/* ��� �������� *//* ��� �������� */
,aIncludeNDS
 NUMBER/* ���� � ��� *//* ���� � ��� */
,aMinPPOWeight
 NUMBER := null /* ����������� ��������� ��� *//* ����������� ��������� ��� */
,aSupplierTarif
 NUMBER/* ����� ���������� *//* ����� ���������� */
,aSupplier CHAR := null /* ��������� *//* ��������� */
,aEndDate
 DATE := null /* ����� �������� ������ *//* ����� �������� ������ */
); 
procedure PEKTRF_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKTRF_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKTRF_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKTRF_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKTRF_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKTRF_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKTRF_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKTRF_SRV_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_SRVid CHAR,
 aBRIEF out varchar2
);
procedure PEKTRF_SRV_DELETE  (
 aCURSESSION CHAR,
 aPEKTRF_SRVid CHAR,
 ainstanceid char
); 
procedure PEKTRF_SRV_SAVE (
 aCURSESSION CHAR,
 aPEKTRF_SRVid CHAR,
aInstanceID CHAR 
,aSrvTYPE CHAR/* ������ *//* ������ */
,aPrice
 NUMBER/* ���� *//* ���� */
,aTheCurrency CHAR/* ������ *//* ������ */
,aEDIZM CHAR/* ��. ���. *//* ��. ���. */
,aQuant
 NUMBER/* ���������� *//* ���������� */
); 
procedure PEKTRF_SRV_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKTRF_SRV_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKTRF_SRV_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKTRF_SRV_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKTRF_SRV_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKTRF_SRV_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKTRF_SRV_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKTRF_TR_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_TRid CHAR,
 aBRIEF out varchar2
);
procedure PEKTRF_TR_DELETE  (
 aCURSESSION CHAR,
 aPEKTRF_TRid CHAR,
 ainstanceid char
); 
procedure PEKTRF_TR_SAVE (
 aCURSESSION CHAR,
 aPEKTRF_TRid CHAR,
aInstanceID CHAR 
,aTrain CHAR/* ����������� *//* ����������� */
,aToST CHAR/* �� ������� *//* �� ������� */
,aPrice
 NUMBER/* ���� *//* ���� */
,aTheCurrency CHAR := null /* ����� *//* ����� */
,aTheQuantity
 NUMBER := null /* ���������� *//* ���������� */
,aEDIZM CHAR := null /* ������� ��������� *//* ������� ��������� */
); 
procedure PEKTRF_TR_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKTRF_TR_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKTRF_TR_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKTRF_TR_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKTRF_TR_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKTRF_TR_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKTRF_TR_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKTRF_REGRTR_BRIEF  (
 aCURSESSION CHAR,
 aPEKTRF_REGRTRid CHAR,
 aBRIEF out varchar2
);
procedure PEKTRF_REGRTR_DELETE  (
 aCURSESSION CHAR,
 aPEKTRF_REGRTRid CHAR,
 ainstanceid char
); 
procedure PEKTRF_REGRTR_SAVE (
 aCURSESSION CHAR,
 aPEKTRF_REGRTRid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aWeightFrom
 NUMBER/* ��������� ��� �� *//* ��������� ��� �� */
,aWeightTo
 NUMBER/* ��������� ��� �� *//* ��������� ��� �� */
,aWeightEDIZM CHAR := null /* ��. ���. ���� *//* ��. ���. ���� */
,aPricePercent
 NUMBER := null /* ������� �� ������ *//* ������� �� ������ */
,aFixedPrice
 NUMBER := null /* ������������� ���� *//* ������������� ���� */
,aPriceCurrency CHAR := null /* ������ ������������� ���� *//* ������ ������������� ���� */
); 
procedure PEKTRF_REGRTR_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKTRF_REGRTR_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKTRF_REGRTR_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKTRF_REGRTR_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKTRF_REGRTR_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKTRF_REGRTR_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKTRF_REGRTR_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKTRF;

/



