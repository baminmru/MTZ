
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
 NUMBER/* Суммарный вес от *//* Суммарный вес от */
,aWeightTo
 NUMBER/* Суммарный вес по *//* Суммарный вес по */
,aWeightEDIZM CHAR := null /* Ед. изм. веса *//* Ед. изм. веса */
,aPricePercent
 NUMBER := null /* Процент от тарифа *//* Процент от тарифа */
,aFixedPrice
 NUMBER := null /* Фиксированная цена *//* Фиксированная цена */
,aPriceCurrency CHAR := null /* Валюта фиксированной цены *//* Валюта фиксированной цены */
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
 VARCHAR2/* Название скидки *//* Название скидки */
,aDecrPercent
 NUMBER/* Процент к тарифу *//* Процент к тарифу */
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
,aName CHAR/* Название надбавки *//* Название надбавки */
,aAddPercent
 NUMBER/* Процент к тарифной ставке *//* Процент к тарифной ставке */
,aMinValue
 NUMBER := null /* Минимальное значение *//* Минимальное значение */
,aMaxValue
 NUMBER := null /* Максимальное значение *//* Максимальное значение */
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
,aORG CHAR/* Организация *//* Организация */
,aStartDate
 DATE/* Начало действия *//* Начало действия */
,aTType CHAR/* Тип тарифа *//* Тип тарифа */
,aTRType CHAR/* Тип доставки *//* Тип доставки */
,aIncludeNDS
 NUMBER/* Цены с НДС *//* Цены с НДС */
,aMinPPOWeight
 NUMBER := null /* Минимальный расчетный вес *//* Минимальный расчетный вес */
,aSupplierTarif
 NUMBER/* Тариф поставщика *//* Тариф поставщика */
,aSupplier CHAR := null /* Поставщик *//* Поставщик */
,aEndDate
 DATE := null /* Конец действия тарифа *//* Конец действия тарифа */
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
,aSrvTYPE CHAR/* Услуга *//* Услуга */
,aPrice
 NUMBER/* Цена *//* Цена */
,aTheCurrency CHAR/* Валюта *//* Валюта */
,aEDIZM CHAR/* Ед. изм. *//* Ед. изм. */
,aQuant
 NUMBER/* Количество *//* Количество */
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
,aTrain CHAR/* Направление *//* Направление */
,aToST CHAR/* До станции *//* До станции */
,aPrice
 NUMBER/* Цена *//* Цена */
,aTheCurrency CHAR := null /* Ваюта *//* Ваюта */
,aTheQuantity
 NUMBER := null /* Количество *//* Количество */
,aEDIZM CHAR := null /* Единица измерения *//* Единица измерения */
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
 NUMBER/* Суммарный вес от *//* Суммарный вес от */
,aWeightTo
 NUMBER/* Суммарный вес по *//* Суммарный вес по */
,aWeightEDIZM CHAR := null /* Ед. изм. веса *//* Ед. изм. веса */
,aPricePercent
 NUMBER := null /* Процент от тарифа *//* Процент от тарифа */
,aFixedPrice
 NUMBER := null /* Фиксированная цена *//* Фиксированная цена */
,aPriceCurrency CHAR := null /* Валюта фиксированной цены *//* Валюта фиксированной цены */
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



