
/* --PEKNAL*/

 create or replace package PEKNAL as

procedure PEKNAL_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKNAL_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKNAL_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKNAL_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKNAL_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKNAL_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKNAL_DEFid CHAR,
 ainstanceid char
); 
procedure PEKNAL_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKNAL_DEFid CHAR,
aInstanceID CHAR 
,aORG CHAR := null /* Организация *//* Организация */
,aTheNumber
 VARCHAR2 := null /* Номер *//* Номер */
,aTheDate
 DATE/* Дата оплаты *//* Дата оплаты */
,aTheSumm
 NUMBER/* Сумма оплаты *//* Сумма оплаты */
,aThePEKZ CHAR := null /* Заявка *//* Заявка */
,aTheDept CHAR/* Из подразделения *//* Из подразделения */
,aFromClient CHAR := null /* От клиента *//* От клиента */
,aTheComment VARCHAR2 := null /* Назнаение платежа *//* Назнаение платежа */
,aRceivedBy CHAR := null /* Кто получил *//* Кто получил */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
); 
procedure PEKNAL_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKNAL_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKNAL_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKNAL_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKNAL_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKNAL_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKNAL_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKNAL_PZ_BRIEF  (
 aCURSESSION CHAR,
 aPEKNAL_PZid CHAR,
 aBRIEF out varchar2
);
procedure PEKNAL_PZ_DELETE  (
 aCURSESSION CHAR,
 aPEKNAL_PZid CHAR,
 ainstanceid char
); 
procedure PEKNAL_PZ_SAVE (
 aCURSESSION CHAR,
 aPEKNAL_PZid CHAR,
aInstanceID CHAR 
,aPZ CHAR/* Заявка *//* Заявка */
,aTheSumm
 NUMBER/* Сумма *//* Сумма */
); 
procedure PEKNAL_PZ_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKNAL_PZ_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKNAL_PZ_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKNAL_PZ_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKNAL_PZ_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKNAL_PZ_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKNAL_PZ_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKNAL;

/



