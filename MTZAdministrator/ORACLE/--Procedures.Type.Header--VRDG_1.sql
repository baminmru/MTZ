
/* --VRDG*/

 create or replace package VRDG as

procedure VRDG_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure VRDG_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure VRDG_propagate(acursession CHAR, aROWID CHAR); 


procedure VRDGCommon_BRIEF  (
 aCURSESSION CHAR,
 aVRDGCommonid CHAR,
 aBRIEF out varchar2
);
procedure VRDGCommon_DELETE  (
 aCURSESSION CHAR,
 aVRDGCommonid CHAR,
 ainstanceid char
); 
procedure VRDGCommon_SAVE (
 aCURSESSION CHAR,
 aVRDGCommonid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* Наша организация *//* Наша организация */
,aDogNum
 VARCHAR2/* Номер договора *//* Номер договора */
,aDogDate
 DATE/* Дата договора *//* Дата договора */
,aName
 VARCHAR2 := null /* Название *//* Название */
,aCurator CHAR := null /* Ответственный *//* Ответственный */
,aInfo VARCHAR2 := null /* Примечание *//* Примечание */
,aClient CHAR := null /* Контрагент *//* Контрагент */
,aDogType CHAR := null /* Тип договора *//* Тип договора */
,aPZDog
 NUMBER := null /* Договор к разовой заявке *//* Договор к разовой заявке */
,aStartDate
 DATE := null /* Начало действия *//* Начало действия */
,aEndDate
 DATE := null /* Окончание действия договора *//* Окончание действия договора */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
); 
procedure VRDGCommon_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGCommon_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGCommon_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGCommon_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGCommon_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGCommon_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGCommon_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGReport_BRIEF  (
 aCURSESSION CHAR,
 aVRDGReportid CHAR,
 aBRIEF out varchar2
);
procedure VRDGReport_DELETE  (
 aCURSESSION CHAR,
 aVRDGReportid CHAR,
 ainstanceid char
); 
procedure VRDGReport_SAVE (
 aCURSESSION CHAR,
 aVRDGReportid CHAR,
aInstanceID CHAR 
,aReport CHAR/* Отчет *//* Отчет */
); 
procedure VRDGReport_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGReport_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGReport_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGReport_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGReport_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGReport_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGReport_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGPayment_BRIEF  (
 aCURSESSION CHAR,
 aVRDGPaymentid CHAR,
 aBRIEF out varchar2
);
procedure VRDGPayment_DELETE  (
 aCURSESSION CHAR,
 aVRDGPaymentid CHAR,
 ainstanceid char
); 
procedure VRDGPayment_SAVE (
 aCURSESSION CHAR,
 aVRDGPaymentid CHAR,
aInstanceID CHAR 
,aCreateDate
 DATE := null /* Дата выписки счета *//* Дата выписки счета */
,aDateOF
 DATE/* Дата оплаты *//* Дата оплаты */
,atheSumm
 NUMBER/* Сумма *//* Сумма */
,aCash
 NUMBER := null /* Наличная оплата *//* Наличная оплата */
,aPaymentForm
 VARCHAR2 := null /* № Счета *//* № Счета */
,aInfo VARCHAR2 := null /* Предмет счета *//* Предмет счета */
); 
procedure VRDGPayment_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGPayment_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGPayment_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGPayment_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGPayment_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGPayment_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGPayment_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGContractChanges_BRIEF  (
 aCURSESSION CHAR,
 aVRDGContractChangesid CHAR,
 aBRIEF out varchar2
);
procedure VRDGContractChanges_DELETE  (
 aCURSESSION CHAR,
 aVRDGContractChangesid CHAR,
 ainstanceid char
); 
procedure VRDGContractChanges_SAVE (
 aCURSESSION CHAR,
 aVRDGContractChangesid CHAR,
aInstanceID CHAR 
,aCode
 VARCHAR2/* Номер соглашения *//* Номер соглашения */
,aDateOf
 DATE/* Дата соглашения *//* Дата соглашения */
,atheFile VARCHAR2 := null /* Файл соглашения */
,atheFile_EXT varchar2 /* Файл соглашения */
,athe_Comment VARCHAR2 := null /* Примечание *//* Примечание */
); 
procedure VRDGContractChanges_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGContractChanges_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGContractChanges_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGContractChanges_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGContractChanges_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGContractChanges_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGContractChanges_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGSeeAlso_BRIEF  (
 aCURSESSION CHAR,
 aVRDGSeeAlsoid CHAR,
 aBRIEF out varchar2
);
procedure VRDGSeeAlso_DELETE  (
 aCURSESSION CHAR,
 aVRDGSeeAlsoid CHAR,
 ainstanceid char
); 
procedure VRDGSeeAlso_SAVE (
 aCURSESSION CHAR,
 aVRDGSeeAlsoid CHAR,
aInstanceID CHAR 
,aDocument CHAR/* Документ *//* Документ */
,athe_Comment VARCHAR2 := null /* Примечание *//* Примечание */
); 
procedure VRDGSeeAlso_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGSeeAlso_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGSeeAlso_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGSeeAlso_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGSeeAlso_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGSeeAlso_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGSeeAlso_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGContractVersion_BRIEF  (
 aCURSESSION CHAR,
 aVRDGContractVersionid CHAR,
 aBRIEF out varchar2
);
procedure VRDGContractVersion_DELETE  (
 aCURSESSION CHAR,
 aVRDGContractVersionid CHAR,
 ainstanceid char
); 
procedure VRDGContractVersion_SAVE (
 aCURSESSION CHAR,
 aVRDGContractVersionid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* Дата версии *//* Дата версии */
,atheFile VARCHAR2/* Файл */
,atheFile_EXT varchar2 /* Файл */
,aActual
 NUMBER/* Актуальная версия *//* Актуальная версия */
,athe_Comment VARCHAR2/* Примечание *//* Примечание */
); 
procedure VRDGContractVersion_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGContractVersion_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGContractVersion_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGContractVersion_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGContractVersion_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGContractVersion_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGContractVersion_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDGContractSpesial_BRIEF  (
 aCURSESSION CHAR,
 aVRDGContractSpesialid CHAR,
 aBRIEF out varchar2
);
procedure VRDGContractSpesial_DELETE  (
 aCURSESSION CHAR,
 aVRDGContractSpesialid CHAR,
 ainstanceid char
); 
procedure VRDGContractSpesial_SAVE (
 aCURSESSION CHAR,
 aVRDGContractSpesialid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* Дата *//* Дата */
,aIsDone
 NUMBER/* Исполнено *//* Исполнено */
,athe_Comment VARCHAR2/* Суть условия *//* Суть условия */
); 
procedure VRDGContractSpesial_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDGContractSpesial_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDGContractSpesial_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDGContractSpesial_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDGContractSpesial_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDGContractSpesial_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDGContractSpesial_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end VRDG;

/



