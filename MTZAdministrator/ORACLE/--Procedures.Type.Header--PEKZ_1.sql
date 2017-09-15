
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
 NUMBER/* № *//* № */
,aTheDirection CHAR/* Направление *//* Направление */
,aPPONum
 NUMBER/* Кол-во ПО *//* Кол-во ПО */
,aDestStation CHAR/* Станция назначения *//* Станция назначения */
,aPPODescription CHAR := null /* Характер груза *//* Характер груза */
,aReceiver CHAR := null /* Получатель *//* Получатель */
,aPPOWeight
 NUMBER/* Вес ПО *//* Вес ПО */
,aWeightEDIZM CHAR := null /* Ед. изм. веса *//* Ед. изм. веса */
,aPPOVol
 NUMBER := null /* Объем ПО *//* Объем ПО */
,aValueEDIZM CHAR := null /* Ед.изм. объема *//* Ед.изм. объема */
,aPathPlanedDate
 DATE := null /* Дата предполагаемой отправки *//* Дата предполагаемой отправки */
,aSendDate
 DATE := null /* Дата отправки *//* Дата отправки */
,aRcvWaitDate
 DATE := null /* Ориентировочная дата получения *//* Ориентировочная дата получения */
,atrainNo CHAR := null /* Поезд *//* Поезд */
,avagNo
 VARCHAR2 := null /* Вагон № *//* Вагон № */
,aPassFIO
 VARCHAR2 := null /* ФИО Кладовщика *//* ФИО Кладовщика */
,aPassDate
 DATE := null /* Дата передачи груза в вагон *//* Дата передачи груза в вагон */
,aRcvFIO
 VARCHAR2 := null /* ФИО ВПН *//* ФИО ВПН */
,aRcvDate
 DATE := null /* Дата получения груза в ПО *//* Дата получения груза в ПО */
,aInforRcvFIO
 VARCHAR2 := null /* Кому передана информация *//* Кому передана информация */
,aInfoDate
 DATE := null /* Дата передачи информации *//* Дата передачи информации */
,aInfoSendType CHAR := null /* Способ передачи информации *//* Способ передачи информации */
,aTheCurrency CHAR := null /* Валюта *//* Валюта */
,aTRF
 NUMBER := null /* Тариф *//* Тариф */
,aSummNDS
 NUMBER := null /* Сумма с НДС *//* Сумма с НДС */
,aSumm
 NUMBER := null /* Сумма без НДС *//* Сумма без НДС */
,aSupTRF
 NUMBER := null /* Тариф поставщика *//* Тариф поставщика */
,aSupSumm
 NUMBER := null /* Сумма поставщику без НДС *//* Сумма поставщику без НДС */
,aSupSummNDS
 NUMBER := null /* Сумма поставщику с НДС *//* Сумма поставщику с НДС */
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
 NUMBER/* № *//* № */
,atheWeight
 NUMBER/* Вес *//* Вес */
,ashCode
 VARCHAR2 := null /* Штрих Код *//* Штрих Код */
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
,aTheAdds CHAR/* Надбавка *//* Надбавка */
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
,aTheDoc CHAR/* Документ *//* Документ */
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
 DATE/* Дата запроса *//* Дата запроса */
,aFillial CHAR/* Принята в *//* Принята в */
,aPEKCode
 VARCHAR2 := null /* № заявки *//* № заявки */
,aPlatType
 NUMBER/* Платит *//* Платит */
,aTRType CHAR/* Тип доставки *//* Тип доставки */
,aPlanedDate
 DATE := null /* Дата предполагаемой отправки *//* Дата предполагаемой отправки */
,aClientFrom CHAR := null /* Отправитель *//* Отправитель */
,aClientTo CHAR := null /* Получатель *//* Получатель */
,aClientPayed CHAR := null /* Плательщик *//* Плательщик */
,aAcceptDate
 DATE := null /* Дата приема заявки *//* Дата приема заявки */
,aIsNal
 NUMBER/* Наличная оплата *//* Наличная оплата */
,aSupplier CHAR := null /* Поставщик *//* Поставщик */
,aTheComment VARCHAR2 := null /* Примечания *//* Примечания */
,aTheDogovor CHAR := null /* Договор *//* Договор */
,aAcceptTime
 DATE := null /* Время приема заявки *//* Время приема заявки */
,aLoadTime
 DATE := null /* Время приема груза на склад *//* Время приема груза на склад */
,aORG CHAR := null /* Организация *//* Организация */
,aLoadDate
 DATE := null /* Дата приема груза на склад *//* Дата приема груза на склад */
,aTRF CHAR := null /* Тариф *//* Тариф */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
,aIncludeInOrder
 NUMBER := null /* Включен в ордер *//* Включен в ордер */
,aIncludeInAct
 NUMBER := null /* Включена в акт *//* Включена в акт */
,aSummNDS
 NUMBER := null /* Сумма с НДС *//* Сумма с НДС */
,aSumm
 NUMBER := null /* Сумма без НДС *//* Сумма без НДС */
,aSummDop
 NUMBER := null /* Сумма доп. услуг без НДС *//* Сумма доп. услуг без НДС */
,aSummDopNDS
 NUMBER := null /* Сумма доп. услуг с НДС *//* Сумма доп. услуг с НДС */
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
 NUMBER/* № *//* № */
,aSRV CHAR/* Услуга *//* Услуга */
,aQuantity
 NUMBER/* Количество *//* Количество */
,aEDIZM CHAR := null /* Ед. измерения *//* Ед. измерения */
,aPathFilial CHAR := null /* Филиал *//* Филиал */
,aDopSupplier CHAR := null /* Поставщик *//* Поставщик */
,aTheCurrency CHAR := null /* Валюта *//* Валюта */
,aTRF
 NUMBER := null /* Тариф *//* Тариф */
,aSumm
 NUMBER := null /* Сумма без НДС *//* Сумма без НДС */
,aSummNDS
 NUMBER := null /* Сумма с НДС *//* Сумма с НДС */
,aSupTRF
 NUMBER := null /* Тариф поставщика *//* Тариф поставщика */
,aSupSumm
 NUMBER := null /* Сумма поставщику без НДС *//* Сумма поставщику без НДС */
,aSupSummNDS
 NUMBER := null /* Сумма поставщику с НДС *//* Сумма поставщику с НДС */
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



