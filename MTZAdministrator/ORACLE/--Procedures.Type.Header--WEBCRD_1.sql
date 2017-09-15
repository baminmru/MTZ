
/* --WEBCRD*/

 create or replace package WEBCRD as

procedure WEBCRD_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure WEBCRD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure WEBCRD_propagate(acursession CHAR, aROWID CHAR); 


procedure WEBCRD_NUM_BRIEF  (
 aCURSESSION CHAR,
 aWEBCRD_NUMid CHAR,
 aBRIEF out varchar2
);
procedure WEBCRD_NUM_DELETE  (
 aCURSESSION CHAR,
 aWEBCRD_NUMid CHAR,
 ainstanceid char
); 
procedure WEBCRD_NUM_SAVE (
 aCURSESSION CHAR,
 aWEBCRD_NUMid CHAR,
aInstanceID CHAR 
,aTheNumber
 VARCHAR2/* Номер карточки *//* Номер карточки */
,aActivationTime
 DATE := null /* Когда активирована *//* Когда активирована */
,aActivatedBy CHAR := null /* Кем активирована *//* Кем активирована */
,aActivated
 NUMBER := null /* Активирована *//* Активирована */
); 
procedure WEBCRD_NUM_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WEBCRD_NUM_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WEBCRD_NUM_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WEBCRD_NUM_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WEBCRD_NUM_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WEBCRD_NUM_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WEBCRD_NUM_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WBCRD_DEF_BRIEF  (
 aCURSESSION CHAR,
 aWBCRD_DEFid CHAR,
 aBRIEF out varchar2
);
procedure WBCRD_DEF_DELETE  (
 aCURSESSION CHAR,
 aWBCRD_DEFid CHAR,
 ainstanceid char
); 
procedure WBCRD_DEF_SAVE (
 aCURSESSION CHAR,
 aWBCRD_DEFid CHAR,
aInstanceID CHAR 
,aTheDate
 DATE/* Дата выпуска сериии *//* Дата выпуска сериии */
,aExpDate
 DATE/* Конец действия серии *//* Конец действия серии */
,aCardSumm
 NUMBER/* Сумма на карточке *//* Сумма на карточке */
,aTheCurrency CHAR/* Валюта *//* Валюта */
); 
procedure WBCRD_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WBCRD_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WBCRD_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WBCRD_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WBCRD_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WBCRD_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WBCRD_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end WEBCRD;

/



