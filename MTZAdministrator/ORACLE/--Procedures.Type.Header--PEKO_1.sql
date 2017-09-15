
/* --PEKO*/

 create or replace package PEKO as

procedure PEKO_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKO_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKO_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKO_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKO_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKO_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKO_DEFid CHAR,
 ainstanceid char
); 
procedure PEKO_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKO_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* Организация *//* Организация */
,aToClient CHAR/* Поставщик *//* Поставщик */
,aPLPNUM
 VARCHAR2/* № документа *//* № документа */
,aPLPDate
 DATE := null /* Дата документа *//* Дата документа */
,aPLPSumm
 NUMBER := null /* Сумма *//* Сумма */
,aVOP CHAR := null /* Вид оплаты *//* Вид оплаты */
,aVP CHAR := null /* Вид платежа *//* Вид платежа */
,aTheDept CHAR := null /* В счет филиала *//* В счет филиала */
,aTheComment VARCHAR2 := null /* Назначеие платежа *//* Назначеие платежа */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
); 
procedure PEKO_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKO_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKO_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKO_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKO_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKO_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKO_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKO;

/



