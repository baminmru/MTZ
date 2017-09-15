
/* --VRC*/

 create or replace package VRC as

procedure VRC_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure VRC_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure VRC_propagate(acursession CHAR, aROWID CHAR); 


procedure VRCSeeAlso_BRIEF  (
 aCURSESSION CHAR,
 aVRCSeeAlsoid CHAR,
 aBRIEF out varchar2
);
procedure VRCSeeAlso_DELETE  (
 aCURSESSION CHAR,
 aVRCSeeAlsoid CHAR,
 ainstanceid char
); 
procedure VRCSeeAlso_SAVE (
 aCURSESSION CHAR,
 aVRCSeeAlsoid CHAR,
aInstanceID CHAR 
,aDocument CHAR/* Документ *//* Документ */
,athe_Comment VARCHAR2 := null /* Примечание *//* Примечание */
); 
procedure VRCSeeAlso_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCSeeAlso_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCSeeAlso_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCSeeAlso_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCSeeAlso_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCSeeAlso_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCSeeAlso_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCAccounts_BRIEF  (
 aCURSESSION CHAR,
 aVRCAccountsid CHAR,
 aBRIEF out varchar2
);
procedure VRCAccounts_DELETE  (
 aCURSESSION CHAR,
 aVRCAccountsid CHAR,
 ainstanceid char
); 
procedure VRCAccounts_SAVE (
 aCURSESSION CHAR,
 aVRCAccountsid CHAR,
aInstanceID CHAR 
,aBANK CHAR/* Банк *//* Банк */
,aacc
 VARCHAR2/* № счета *//* № счета */
,afillial VARCHAR2 := null /* Название филиала *//* Название филиала */
,aDefaultAccount
 NUMBER/* Основной счет для расчетов *//* Основной счет для расчетов */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
); 
procedure VRCAccounts_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCAccounts_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCAccounts_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCAccounts_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCAccounts_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCAccounts_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCAccounts_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCPayIn_BRIEF  (
 aCURSESSION CHAR,
 aVRCPayInid CHAR,
 aBRIEF out varchar2
);
procedure VRCPayIn_DELETE  (
 aCURSESSION CHAR,
 aVRCPayInid CHAR,
 ainstanceid char
); 
procedure VRCPayIn_SAVE (
 aCURSESSION CHAR,
 aVRCPayInid CHAR,
aInstanceID CHAR 
,aTheDocument CHAR/* Оплаты *//* Оплаты */
); 
procedure VRCPayIn_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPayIn_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPayIn_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPayIn_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPayIn_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPayIn_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPayIn_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCOwnership_BRIEF  (
 aCURSESSION CHAR,
 aVRCOwnershipid CHAR,
 aBRIEF out varchar2
);
procedure VRCOwnership_DELETE  (
 aCURSESSION CHAR,
 aVRCOwnershipid CHAR,
 ainstanceid char
); 
procedure VRCOwnership_SAVE (
 aCURSESSION CHAR,
 aVRCOwnershipid CHAR,
aInstanceID CHAR 
,aOwnedObject VARCHAR2/* Объект *//* Объект */
,aInfoSrc VARCHAR2 := null /* Источник *//* Источник */
,aTheFile VARCHAR2 := null /* Файл */
,aTheFile_EXT varchar2 /* Файл */
,aURL VARCHAR2 := null /* Ссылка *//* Ссылка */
); 
procedure VRCOwnership_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCOwnership_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCOwnership_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCOwnership_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCOwnership_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCOwnership_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCOwnership_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCGlossary_BRIEF  (
 aCURSESSION CHAR,
 aVRCGlossaryid CHAR,
 aBRIEF out varchar2
);
procedure VRCGlossary_DELETE  (
 aCURSESSION CHAR,
 aVRCGlossaryid CHAR,
 ainstanceid char
); 
procedure VRCGlossary_SAVE (
 aCURSESSION CHAR,
 aVRCGlossaryid CHAR,
aInstanceID CHAR 
,aTerm
 VARCHAR2/* Термин *//* Термин */
,athe_Comment VARCHAR2/* Описание *//* Описание */
); 
procedure VRCGlossary_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCGlossary_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCGlossary_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCGlossary_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCGlossary_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCGlossary_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCGlossary_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCProgress_BRIEF  (
 aCURSESSION CHAR,
 aVRCProgressid CHAR,
 aBRIEF out varchar2
);
procedure VRCProgress_DELETE  (
 aCURSESSION CHAR,
 aVRCProgressid CHAR,
 ainstanceid char
); 
procedure VRCProgress_SAVE (
 aCURSESSION CHAR,
 aVRCProgressid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* Дата *//* Дата */
,aInfoSrc
 VARCHAR2 := null /* Источник *//* Источник */
,aInfo VARCHAR2/* Информация *//* Информация */
,aTheFile VARCHAR2 := null /* Файл */
,aTheFile_EXT varchar2 /* Файл */
,aURL VARCHAR2 := null /* Ссылка *//* Ссылка */
); 
procedure VRCProgress_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCProgress_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCProgress_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCProgress_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCProgress_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCProgress_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCProgress_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCLifeSupport_BRIEF  (
 aCURSESSION CHAR,
 aVRCLifeSupportid CHAR,
 aBRIEF out varchar2
);
procedure VRCLifeSupport_DELETE  (
 aCURSESSION CHAR,
 aVRCLifeSupportid CHAR,
 ainstanceid char
); 
procedure VRCLifeSupport_SAVE (
 aCURSESSION CHAR,
 aVRCLifeSupportid CHAR,
aInstanceID CHAR 
,aDateOf
 DATE/* Дата *//* Дата */
,aInfo VARCHAR2/* Информация *//* Информация */
,aTheFile VARCHAR2 := null /* Файл */
,aTheFile_EXT varchar2 /* Файл */
,aInfoSrc VARCHAR2 := null /* Источник *//* Источник */
,aURL VARCHAR2 := null /* Ссылка *//* Ссылка */
); 
procedure VRCLifeSupport_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCLifeSupport_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCLifeSupport_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCLifeSupport_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCLifeSupport_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCLifeSupport_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCLifeSupport_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCTorg_BRIEF  (
 aCURSESSION CHAR,
 aVRCTorgid CHAR,
 aBRIEF out varchar2
);
procedure VRCTorg_DELETE  (
 aCURSESSION CHAR,
 aVRCTorgid CHAR,
 ainstanceid char
); 
procedure VRCTorg_SAVE (
 aCURSESSION CHAR,
 aVRCTorgid CHAR,
aInstanceID CHAR 
,aAddress VARCHAR2/* Адрес *//* Адрес */
,aname
 VARCHAR2/* Название *//* Название */
,aReg CHAR := null /* Район доставки *//* Район доставки */
,aTown CHAR := null /* Город *//* Город */
); 
procedure VRCTorg_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCTorg_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCTorg_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCTorg_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCTorg_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCTorg_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCTorg_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCZayavki_BRIEF  (
 aCURSESSION CHAR,
 aVRCZayavkiid CHAR,
 aBRIEF out varchar2
);
procedure VRCZayavki_DELETE  (
 aCURSESSION CHAR,
 aVRCZayavkiid CHAR,
 ainstanceid char
); 
procedure VRCZayavki_SAVE (
 aCURSESSION CHAR,
 aVRCZayavkiid CHAR,
aInstanceID CHAR 
,aTheDocument CHAR/* Заявка *//* Заявка */
); 
procedure VRCZayavki_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCZayavki_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCZayavki_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCZayavki_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCZayavki_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCZayavki_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCZayavki_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCAutomatizations_BRIEF  (
 aCURSESSION CHAR,
 aVRCAutomatizationsid CHAR,
 aBRIEF out varchar2
);
procedure VRCAutomatizations_DELETE  (
 aCURSESSION CHAR,
 aVRCAutomatizationsid CHAR,
 ainstanceid char
); 
procedure VRCAutomatizations_SAVE (
 aCURSESSION CHAR,
 aVRCAutomatizationsid CHAR,
aInstanceID CHAR 
,aRecDate
 DATE/* Дата *//* Дата */
,aInfo VARCHAR2 := null /* Информация *//* Информация */
,aTheFile VARCHAR2 := null /* Файл */
,aTheFile_EXT varchar2 /* Файл */
,aInfoSrc VARCHAR2 := null /* Источник *//* Источник */
,aInfoUrl VARCHAR2 := null /* Ссылка *//* Ссылка */
); 
procedure VRCAutomatizations_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCAutomatizations_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCAutomatizations_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCAutomatizations_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCAutomatizations_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCAutomatizations_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCAutomatizations_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCReport_BRIEF  (
 aCURSESSION CHAR,
 aVRCReportid CHAR,
 aBRIEF out varchar2
);
procedure VRCReport_DELETE  (
 aCURSESSION CHAR,
 aVRCReportid CHAR,
 ainstanceid char
); 
procedure VRCReport_SAVE (
 aCURSESSION CHAR,
 aVRCReportid CHAR,
aInstanceID CHAR 
,aReport CHAR/* Отчет *//* Отчет */
); 
procedure VRCReport_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCReport_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCReport_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCReport_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCReport_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCReport_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCReport_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCAditional_BRIEF  (
 aCURSESSION CHAR,
 aVRCAditionalid CHAR,
 aBRIEF out varchar2
);
procedure VRCAditional_DELETE  (
 aCURSESSION CHAR,
 aVRCAditionalid CHAR,
 ainstanceid char
); 
procedure VRCAditional_SAVE (
 aCURSESSION CHAR,
 aVRCAditionalid CHAR,
aInstanceID CHAR 
,aKPP
 VARCHAR2 := null /* КПП *//* КПП */
,aCountry CHAR := null /* Страна *//* Страна */
,atown CHAR := null /* Город *//* Город */
,adistrict
 VARCHAR2 := null /* Район *//* Район */
,auraddr VARCHAR2 := null /* Юридический адрес *//* Юридический адрес */
,aurphone
 VARCHAR2 := null /* Телефон по юр. адресу *//* Телефон по юр. адресу */
,aregdate
 DATE := null /* Дата регистрации *//* Дата регистрации */
,aregby CHAR := null /* Кем зарегистрирован *//* Кем зарегистрирован */
,aclitype CHAR := null /* Тип клиента *//* Тип клиента */
,aStream CHAR := null /* Направление деяельности *//* Направление деяельности */
,aWEBSite VARCHAR2 := null /* WEB узел *//* WEB узел */
,acreditlimit
 NUMBER := null /* Лимит кредита *//* Лимит кредита */
,amaxcreditlen
 NUMBER := null /* Длительность кредита *//* Длительность кредита */
,avop CHAR := null /* Основной вид оплаты *//* Основной вид оплаты */
,atownphonecode
 VARCHAR2 := null /* Телефонный код  *//* Телефонный код  */
,aPOSTINDEX
 VARCHAR2 := null /* Почтовый индекс *//* Почтовый индекс */
,aphone2
 VARCHAR2 := null /* Телефон 2 *//* Телефон 2 */
,aOKONH
 VARCHAR2 := null /* ОКОНХ *//* ОКОНХ */
,aOKPO
 VARCHAR2 := null /* ОКПО *//* ОКПО */
,aregsved
 VARCHAR2 := null /* Номер свидетельства орегистрации *//* Номер свидетельства орегистрации */
,aprtype CHAR := null /* Тип производства *//* Тип производства */
,aConcurent
 NUMBER := null /* Конкурент *//* Конкурент */
); 
procedure VRCAditional_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCAditional_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCAditional_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCAditional_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCAditional_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCAditional_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCAditional_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCPayOut_BRIEF  (
 aCURSESSION CHAR,
 aVRCPayOutid CHAR,
 aBRIEF out varchar2
);
procedure VRCPayOut_DELETE  (
 aCURSESSION CHAR,
 aVRCPayOutid CHAR,
 ainstanceid char
); 
procedure VRCPayOut_SAVE (
 aCURSESSION CHAR,
 aVRCPayOutid CHAR,
aInstanceID CHAR 
,aTheDocument CHAR/* Платеж *//* Платеж */
); 
procedure VRCPayOut_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPayOut_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPayOut_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPayOut_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPayOut_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPayOut_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPayOut_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VCContract_BRIEF  (
 aCURSESSION CHAR,
 aVCContractid CHAR,
 aBRIEF out varchar2
);
procedure VCContract_DELETE  (
 aCURSESSION CHAR,
 aVCContractid CHAR,
 ainstanceid char
); 
procedure VCContract_SAVE (
 aCURSESSION CHAR,
 aVCContractid CHAR,
aInstanceID CHAR 
,aContract CHAR/* Договор *//* Договор */
); 
procedure VCContract_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VCContract_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VCContract_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VCContract_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VCContract_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VCContract_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VCContract_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCOrgStruct_BRIEF  (
 aCURSESSION CHAR,
 aVRCOrgStructid CHAR,
 aBRIEF out varchar2
);
procedure VRCOrgStruct_DELETE  (
 aCURSESSION CHAR,
 aVRCOrgStructid CHAR,
 ainstanceid char
); 
procedure VRCOrgStruct_SAVE (
 aCURSESSION CHAR,
 aVRCOrgStructid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aVRCDepartment
 VARCHAR2/* Подразделение *//* Подразделение */
,aDepChief CHAR := null /* Начальник *//* Начальник */
,aPhone
 VARCHAR2 := null /* Телефон *//* Телефон */
,athe_comment VARCHAR2 := null /* Примечание *//* Примечание */
); 
procedure VRCOrgStruct_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCOrgStruct_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCOrgStruct_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCOrgStruct_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCOrgStruct_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCOrgStruct_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCOrgStruct_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCCommonInfo_BRIEF  (
 aCURSESSION CHAR,
 aVRCCommonInfoid CHAR,
 aBRIEF out varchar2
);
procedure VRCCommonInfo_DELETE  (
 aCURSESSION CHAR,
 aVRCCommonInfoid CHAR,
 ainstanceid char
); 
procedure VRCCommonInfo_SAVE (
 aCURSESSION CHAR,
 aVRCCommonInfoid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* Наша организация *//* Наша организация */
,aIsPhizical
 NUMBER/* Физическое лицо *//* Физическое лицо */
,acode
 VARCHAR2 := null /* Код клиента *//* Код клиента */
,aName
 VARCHAR2/* Название *//* Название */
,afullname VARCHAR2 := null /* Полное наименование *//* Полное наименование */
,aAddress
 VARCHAR2 := null /* Почтовый адрес *//* Почтовый адрес */
,afax
 VARCHAR2 := null /* Факс *//* Факс */
,aPhone
 VARCHAR2 := null /* Телефон *//* Телефон */
,athe_Comment VARCHAR2 := null /* Примечание *//* Примечание */
,aTRFTYPE CHAR := null /* Тип тарифа *//* Тип тарифа */
,aINN
 VARCHAR2 := null /* ИНН *//* ИНН */
,aCurator CHAR := null /* Ответственный *//* Ответственный */
,aInterest CHAR := null /* Заинтересованность *//* Заинтересованность */
,aTransporter
 NUMBER := null /* Поставщик тр. услуг *//* Поставщик тр. услуг */
,aPassportInfo VARCHAR2 := null /* Паспортные данные *//* Паспортные данные */
,aCode1C
 VARCHAR2 := null /* Код1С *//* Код1С */
); 
procedure VRCCommonInfo_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCCommonInfo_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCCommonInfo_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCCommonInfo_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCCommonInfo_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCCommonInfo_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCCommonInfo_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCPerson_BRIEF  (
 aCURSESSION CHAR,
 aVRCPersonid CHAR,
 aBRIEF out varchar2
);
procedure VRCPerson_DELETE  (
 aCURSESSION CHAR,
 aVRCPersonid CHAR,
 ainstanceid char
); 
procedure VRCPerson_SAVE (
 aCURSESSION CHAR,
 aVRCPersonid CHAR,
aInstanceID CHAR 
,aPerson CHAR/* Контактное лицо *//* Контактное лицо */
,aPosition
 VARCHAR2 := null /* Должность *//* Должность */
,aphone
 VARCHAR2 := null /* Телефон *//* Телефон */
,amobile
 VARCHAR2 := null /* Мобильный телефон *//* Мобильный телефон */
,aUseInDogovor
 NUMBER/* Использовать в договоре *//* Использовать в договоре */
,aDocReason
 VARCHAR2 := null /* Действует на основании *//* Действует на основании */
); 
procedure VRCPerson_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCPerson_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCPerson_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCPerson_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCPerson_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCPerson_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCPerson_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end VRC;

/



