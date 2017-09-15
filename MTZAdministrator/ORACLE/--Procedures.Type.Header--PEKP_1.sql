
/* --PEKP*/

 create or replace package PEKP as

procedure PEKP_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKP_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKP_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKP_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKP_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKP_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKP_DEFid CHAR,
 ainstanceid char
); 
procedure PEKP_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKP_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR/* Организация *//* Организация */
,aFromClient CHAR/* Клиент *//* Клиент */
,aPLPNUM
 VARCHAR2/* № документа *//* № документа */
,aPLPDate
 DATE := null /* Дата документа *//* Дата документа */
,aPLPSumm
 NUMBER := null /* Сумма *//* Сумма */
,aVOP CHAR := null /* Вид оплаты *//* Вид оплаты */
,aVP CHAR := null /* Вид платежа *//* Вид платежа */
,aTheCurrncy CHAR := null /* Валюта *//* Валюта */
,aTheComment VARCHAR2 := null /* Назначение платежа *//* Назначение платежа */
,aTheDogovor CHAR := null /* К договору *//* К договору */
,aTheDept CHAR := null /* Подразделение *//* Подразделение */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
); 
procedure PEKP_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKP_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKP_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKP_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKP_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKP_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKP_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKP_PZ_BRIEF  (
 aCURSESSION CHAR,
 aPEKP_PZid CHAR,
 aBRIEF out varchar2
);
procedure PEKP_PZ_DELETE  (
 aCURSESSION CHAR,
 aPEKP_PZid CHAR,
 ainstanceid char
); 
procedure PEKP_PZ_SAVE (
 aCURSESSION CHAR,
 aPEKP_PZid CHAR,
aInstanceID CHAR 
,aPZ CHAR/* Заявка *//* Заявка */
,aTheSumm
 NUMBER/* Сумма *//* Сумма */
); 
procedure PEKP_PZ_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKP_PZ_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKP_PZ_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKP_PZ_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKP_PZ_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKP_PZ_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKP_PZ_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKP;

/



