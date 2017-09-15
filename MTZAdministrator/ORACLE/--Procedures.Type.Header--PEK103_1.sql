
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
 NUMBER/* Номер *//* Номер */
,aORG CHAR/* Организация *//* Организация */
,aSender VARCHAR2/* Отправитель *//* Отправитель */
,aRcvDate
 DATE/* Дата подачи заявки *//* Дата подачи заявки */
,aVOP CHAR := null /* Вид оплаты *//* Вид оплаты */
,aComent VARCHAR2 := null /* Примечание *//* Примечание */
,aNodeDate
 DATE := null /* Дата приемки  *//* Дата приемки  */
,aPEKZ CHAR/* Заявка *//* Заявка */
,aThePath CHAR/* Строка маршрута *//* Строка маршрута */
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
 NUMBER/* № п\п *//* № п\п */
,aIndexTo CHAR/* Станция назначения *//* Станция назначения */
,aReciever
 VARCHAR2/* Получатель *//* Получатель */
,aWeight
 NUMBER/* Вес *//* Вес */
,aWeightEDIZM CHAR := null /* Ед. изм. веса *//* Ед. изм. веса */
,aQuantity
 NUMBER/* Количество *//* Количество */
,aCost
 NUMBER/* Стоимость перевозки *//* Стоимость перевозки */
,aPPOCode
 VARCHAR2/* Код отправления *//* Код отправления */
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



