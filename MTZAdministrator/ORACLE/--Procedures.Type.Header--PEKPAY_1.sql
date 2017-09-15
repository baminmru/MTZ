
/* --PEKPAY*/

 create or replace package PEKPAY as

procedure PEKPAY_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKPAY_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKPAY_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKPAY_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKPAY_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKPAY_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKPAY_DEFid CHAR,
 ainstanceid char
); 
procedure PEKPAY_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKPAY_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* Организация *//* Организация */
,aToClient CHAR := null /* Поставщик *//* Поставщик */
,aPLPNUM
 VARCHAR2/* № документа *//* № документа */
,aPLPDate
 DATE/* Дата документа *//* Дата документа */
,aPLPSumm
 NUMBER/* Сумма *//* Сумма */
,aStatya CHAR := null /* Статья расходов *//* Статья расходов */
,aTheDept CHAR := null /* В счет филиала *//* В счет филиала */
,aTheComment VARCHAR2 := null /* Назначеие платежа *//* Назначеие платежа */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
); 
procedure PEKPAY_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKPAY_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKPAY_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKPAY_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKPAY_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKPAY_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKPAY_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKPAY;

/



