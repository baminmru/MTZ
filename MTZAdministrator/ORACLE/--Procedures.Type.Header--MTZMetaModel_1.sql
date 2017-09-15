
/* --MTZMetaModel*/

 create or replace package MTZMetaModel as

procedure MTZMetaModel_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZMetaModel_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZMetaModel_propagate(acursession CHAR, aROWID CHAR); 


procedure FIELDTYPE_BRIEF  (
 aCURSESSION CHAR,
 aFIELDTYPEid CHAR,
 aBRIEF out varchar2
);
procedure FIELDTYPE_DELETE  (
 aCURSESSION CHAR,
 aFIELDTYPEid CHAR,
 ainstanceid char
); 
procedure FIELDTYPE_SAVE (
 aCURSESSION CHAR,
 aFIELDTYPEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aTypeStyle
 NUMBER/* Трактовка *//* Трактовка */
,athe_Comment VARCHAR2 := null /* Описание *//* Описание */
,aAllowSize
 NUMBER/* Нужен размер *//* Нужен размер */
,aMinimum
 VARCHAR2 := null /* Минимум *//* Минимум */
,aMaximum
 VARCHAR2 := null /* Максимум *//* Максимум */
,aAllowLikeSearch
 NUMBER := null /* Поиск текста *//* Поиск текста */
,aGridSortType
 NUMBER := null /* Вариант сортировки в табличном представлении *//* Вариант сортировки в табличном представлении */
); 
procedure FIELDTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDTYPEMAP_BRIEF  (
 aCURSESSION CHAR,
 aFIELDTYPEMAPid CHAR,
 aBRIEF out varchar2
);
procedure FIELDTYPEMAP_DELETE  (
 aCURSESSION CHAR,
 aFIELDTYPEMAPid CHAR,
 ainstanceid char
); 
procedure FIELDTYPEMAP_SAVE (
 aCURSESSION CHAR,
 aFIELDTYPEMAPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR/* Платформа *//* Платформа */
,aStoageType
 VARCHAR2/* Тип хранения *//* Тип хранения */
,aFixedSize
 NUMBER := null /* Размер *//* Размер */
); 
procedure FIELDTYPEMAP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDTYPEMAP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDTYPEMAP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDTYPEMAP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDTYPEMAP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDTYPEMAP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDTYPEMAP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENUMITEM_BRIEF  (
 aCURSESSION CHAR,
 aENUMITEMid CHAR,
 aBRIEF out varchar2
);
procedure ENUMITEM_DELETE  (
 aCURSESSION CHAR,
 aENUMITEMid CHAR,
 ainstanceid char
); 
procedure ENUMITEM_SAVE (
 aCURSESSION CHAR,
 aENUMITEMid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aNameValue
 NUMBER/* Значение *//* Значение */
,aNameInCode
 VARCHAR2 := null /* Название в коде *//* Название в коде */
); 
procedure ENUMITEM_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENUMITEM_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENUMITEM_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENUMITEM_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENUMITEM_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENUMITEM_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENUMITEM_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure SHAREDMETHOD_BRIEF  (
 aCURSESSION CHAR,
 aSHAREDMETHODid CHAR,
 aBRIEF out varchar2
);
procedure SHAREDMETHOD_DELETE  (
 aCURSESSION CHAR,
 aSHAREDMETHODid CHAR,
 ainstanceid char
); 
procedure SHAREDMETHOD_SAVE (
 aCURSESSION CHAR,
 aSHAREDMETHODid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2 := null /* Название *//* Название */
,athe_Comment VARCHAR2 := null /* Описание метода *//* Описание метода */
,aReturnType CHAR := null /* Возвращаемый тип *//* Возвращаемый тип */
); 
procedure SHAREDMETHOD_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure SHAREDMETHOD_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure SHAREDMETHOD_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure SHAREDMETHOD_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure SHAREDMETHOD_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure SHAREDMETHOD_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure SHAREDMETHOD_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure SCRIPT_BRIEF  (
 aCURSESSION CHAR,
 aSCRIPTid CHAR,
 aBRIEF out varchar2
);
procedure SCRIPT_DELETE  (
 aCURSESSION CHAR,
 aSCRIPTid CHAR,
 ainstanceid char
); 
procedure SCRIPT_SAVE (
 aCURSESSION CHAR,
 aSCRIPTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* Целевая платформа *//* Целевая платформа */
,aCode VARCHAR2 := null /* Скрипт *//* Скрипт */
); 
procedure SCRIPT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure SCRIPT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure SCRIPT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure SCRIPT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure SCRIPT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure SCRIPT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure SCRIPT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PARAMETERS_BRIEF  (
 aCURSESSION CHAR,
 aPARAMETERSid CHAR,
 aBRIEF out varchar2
);
procedure PARAMETERS_DELETE  (
 aCURSESSION CHAR,
 aPARAMETERSid CHAR,
 ainstanceid char
); 
procedure PARAMETERS_SAVE (
 aCURSESSION CHAR,
 aPARAMETERSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,asequence
 NUMBER/* Последовательность *//* Последовательность */
,aName
 VARCHAR2/* Имя *//* Имя */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
,aTypeOfParm CHAR/* Тип данных *//* Тип данных */
,aDataSize
 NUMBER := null /* Размер *//* Размер */
,aAllowNull
 NUMBER/* Можно не задавать *//* Можно не задавать */
,aOutParam
 NUMBER/* Возвращает значение *//* Возвращает значение */
,aReferenceType
 NUMBER/* Тип ссылки *//* Тип ссылки */
,aRefToType CHAR := null /* Ссылка на тип *//* Ссылка на тип */
,aRefToPart CHAR := null /* Ссылка на раздел *//* Ссылка на раздел */
); 
procedure PARAMETERS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PARAMETERS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PARAMETERS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PARAMETERS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PARAMETERS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PARAMETERS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PARAMETERS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure OBJECTTYPE_BRIEF  (
 aCURSESSION CHAR,
 aOBJECTTYPEid CHAR,
 aBRIEF out varchar2
);
procedure OBJECTTYPE_DELETE  (
 aCURSESSION CHAR,
 aOBJECTTYPEid CHAR,
 ainstanceid char
); 
procedure OBJECTTYPE_SAVE (
 aCURSESSION CHAR,
 aOBJECTTYPEid CHAR,
aInstanceID CHAR 
,aPackage CHAR/* Приложение *//* Приложение */
,athe_Comment
 VARCHAR2 := null /* Название *//* Название */
,aName
 VARCHAR2/* Код *//* Код */
,aIsSingleInstance
 NUMBER/* Допускается только один объект *//* Допускается только один объект */
,aChooseView CHAR := null /* Представление для выбора *//* Представление для выбора */
,aOnRun CHAR := null /* При запуске *//* При запуске */
,aOnCreate CHAR := null /* При создании *//* При создании */
,aOnDelete CHAR := null /* При удалении *//* При удалении */
,aAllowRefToObject
 NUMBER := null /* Отображать при выборе ссылки *//* Отображать при выборе ссылки */
,aAllowSearch
 NUMBER := null /* Отображать при поиске *//* Отображать при поиске */
,aReplicaType
 NUMBER := null /* Тип репликации *//* Тип репликации */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
); 
procedure OBJECTTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure OBJECTTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure OBJECTTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure OBJECTTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure OBJECTTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure OBJECTTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure OBJECTTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PART_BRIEF  (
 aCURSESSION CHAR,
 aPARTid CHAR,
 aBRIEF out varchar2
);
procedure PART_DELETE  (
 aCURSESSION CHAR,
 aPARTid CHAR,
 ainstanceid char
); 
procedure PART_SAVE (
 aCURSESSION CHAR,
 aPARTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
, aParentRowid CHAR :=null
,aSequence
 NUMBER/* № п/п *//* № п/п */
,aPartType
 NUMBER/* Тип структры  *//* Тип структры  */
,aCaption
 VARCHAR2/* Заголовок *//* Заголовок */
,aName
 VARCHAR2/* Название *//* Название */
,athe_Comment VARCHAR2 := null /* Описание *//* Описание */
,aNoLog
 NUMBER/* Не записывать в журнал *//* Не записывать в журнал */
,aManualRegister
 NUMBER/* Исключить из индексирования *//* Исключить из индексирования */
,aOnCreate CHAR := null /* При создании *//* При создании */
,aOnSave CHAR := null /* При сохранении *//* При сохранении */
,aOnRun CHAR := null /* При открытии *//* При открытии */
,aOnDelete CHAR := null /* При удалении *//* При удалении */
,aAddBehaivor
 NUMBER := null /* Поведение при добавлении *//* Поведение при добавлении */
); 
procedure PART_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PART_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PART_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PART_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PART_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PART_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PART_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PARTMENU_BRIEF  (
 aCURSESSION CHAR,
 aPARTMENUid CHAR,
 aBRIEF out varchar2
);
procedure PARTMENU_DELETE  (
 aCURSESSION CHAR,
 aPARTMENUid CHAR,
 ainstanceid char
); 
procedure PARTMENU_SAVE (
 aCURSESSION CHAR,
 aPARTMENUid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* Название *//* Название */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
,aToolTip
 VARCHAR2 := null /* Подсказка *//* Подсказка */
,athe_Action CHAR := null /* Метод *//* Метод */
,aIsMenuItem
 NUMBER := null /* Включать в меню *//* Включать в меню */
,aIsToolBarButton
 NUMBER := null /* В тулбар *//* В тулбар */
,aHotKey
 VARCHAR2 := null /* Горячая клавиша *//* Горячая клавиша */
); 
procedure PARTMENU_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PARTMENU_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PARTMENU_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PARTMENU_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PARTMENU_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PARTMENU_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PARTMENU_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PARTPARAMMAP_BRIEF  (
 aCURSESSION CHAR,
 aPARTPARAMMAPid CHAR,
 aBRIEF out varchar2
);
procedure PARTPARAMMAP_DELETE  (
 aCURSESSION CHAR,
 aPARTPARAMMAPid CHAR,
 ainstanceid char
); 
procedure PARTPARAMMAP_SAVE (
 aCURSESSION CHAR,
 aPARTPARAMMAPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aFieldName
 VARCHAR2/* Поле (значение) *//* Поле (значение) */
,aParamName
 VARCHAR2/* Параметр *//* Параметр */
,aNoEdit
 NUMBER/* Редактировать параметр нельзя *//* Редактировать параметр нельзя */
); 
procedure PARTPARAMMAP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PARTPARAMMAP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PARTPARAMMAP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PARTPARAMMAP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PARTPARAMMAP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PARTPARAMMAP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PARTPARAMMAP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELD_BRIEF  (
 aCURSESSION CHAR,
 aFIELDid CHAR,
 aBRIEF out varchar2
);
procedure FIELD_DELETE  (
 aCURSESSION CHAR,
 aFIELDid CHAR,
 ainstanceid char
); 
procedure FIELD_SAVE (
 aCURSESSION CHAR,
 aFIELDid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSequence
 NUMBER/* № п/п *//* № п/п */
,aCaption
 VARCHAR2/* Надпись *//* Надпись */
,aName
 VARCHAR2/* Имя поля *//* Имя поля */
,aFieldType CHAR/* Тип поля *//* Тип поля */
,aIsBrief
 NUMBER/* Краткая информация *//* Краткая информация */
,aAllowNull
 NUMBER/* Может быть пустым *//* Может быть пустым */
,aDataSize
 NUMBER := null /* Размер поля *//* Размер поля */
,aReferenceType
 NUMBER/* Тип ссылки *//* Тип ссылки */
,aRefToType CHAR := null /* Ссылка на тип *//* Ссылка на тип */
,aRefToPart CHAR := null /* Ссылка на раздел *//* Ссылка на раздел */
,aInternalReference
 NUMBER := null /* Ссылка в пределах объекта *//* Ссылка в пределах объекта */
,aCreateRefOnly
 NUMBER := null /* Только создание объекта *//* Только создание объекта */
,aIsAutoNumber
 NUMBER := null /* Автонумерация *//* Автонумерация */
,aTheNumerator CHAR := null /* Нумератор *//* Нумератор */
,aZoneTemplate
 VARCHAR2 := null /* Шаблон зоны нумерации *//* Шаблон зоны нумерации */
,aNumberDateField CHAR := null /* Поле для расчета даты *//* Поле для расчета даты */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
); 
procedure FIELD_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELD_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELD_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELD_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELD_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELD_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELD_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDVALIDATOR_BRIEF  (
 aCURSESSION CHAR,
 aFIELDVALIDATORid CHAR,
 aBRIEF out varchar2
);
procedure FIELDVALIDATOR_DELETE  (
 aCURSESSION CHAR,
 aFIELDVALIDATORid CHAR,
 ainstanceid char
); 
procedure FIELDVALIDATOR_SAVE (
 aCURSESSION CHAR,
 aFIELDVALIDATORid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* Платформа *//* Платформа */
,aCode VARCHAR2 := null /* Скрипт *//* Скрипт */
); 
procedure FIELDVALIDATOR_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDVALIDATOR_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDVALIDATOR_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDVALIDATOR_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDVALIDATOR_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDVALIDATOR_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDVALIDATOR_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDMENU_BRIEF  (
 aCURSESSION CHAR,
 aFIELDMENUid CHAR,
 aBRIEF out varchar2
);
procedure FIELDMENU_DELETE  (
 aCURSESSION CHAR,
 aFIELDMENUid CHAR,
 ainstanceid char
); 
procedure FIELDMENU_SAVE (
 aCURSESSION CHAR,
 aFIELDMENUid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* Название *//* Название */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
,aToolTip
 VARCHAR2 := null /* Подсказка *//* Подсказка */
,aActionID CHAR/* Идентификатор вызываемого метода *//* Идентификатор вызываемого метода */
,aIsMenuItem
 NUMBER := null /* В меню *//* В меню */
,aIsToolBarButton
 NUMBER := null /* В тулбар *//* В тулбар */
,aHotKey
 VARCHAR2 := null /* Горячая клавиша *//* Горячая клавиша */
); 
procedure FIELDMENU_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDMENU_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDMENU_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDMENU_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDMENU_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDMENU_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDMENU_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDPARAMMAP_BRIEF  (
 aCURSESSION CHAR,
 aFIELDPARAMMAPid CHAR,
 aBRIEF out varchar2
);
procedure FIELDPARAMMAP_DELETE  (
 aCURSESSION CHAR,
 aFIELDPARAMMAPid CHAR,
 ainstanceid char
); 
procedure FIELDPARAMMAP_SAVE (
 aCURSESSION CHAR,
 aFIELDPARAMMAPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aFieldName
 VARCHAR2/* Поле (значение) *//* Поле (значение) */
,aParamName
 VARCHAR2/* Параметр *//* Параметр */
,aNoEdit
 NUMBER/* Редактировать параметр нельзя *//* Редактировать параметр нельзя */
); 
procedure FIELDPARAMMAP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDPARAMMAP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDPARAMMAP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDPARAMMAP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDPARAMMAP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDPARAMMAP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDPARAMMAP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDEXPRESSION_BRIEF  (
 aCURSESSION CHAR,
 aFIELDEXPRESSIONid CHAR,
 aBRIEF out varchar2
);
procedure FIELDEXPRESSION_DELETE  (
 aCURSESSION CHAR,
 aFIELDEXPRESSIONid CHAR,
 ainstanceid char
); 
procedure FIELDEXPRESSION_SAVE (
 aCURSESSION CHAR,
 aFIELDEXPRESSIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* Платформа *//* Платформа */
,aCode VARCHAR2 := null /* Скрипт *//* Скрипт */
); 
procedure FIELDEXPRESSION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDEXPRESSION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDEXPRESSION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDEXPRESSION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDEXPRESSION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDEXPRESSION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDEXPRESSION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure DINAMICFILTERSCRIPT_BRIEF  (
 aCURSESSION CHAR,
 aDINAMICFILTERSCRIPTid CHAR,
 aBRIEF out varchar2
);
procedure DINAMICFILTERSCRIPT_DELETE  (
 aCURSESSION CHAR,
 aDINAMICFILTERSCRIPTid CHAR,
 ainstanceid char
); 
procedure DINAMICFILTERSCRIPT_SAVE (
 aCURSESSION CHAR,
 aDINAMICFILTERSCRIPTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* Целевая платформа *//* Целевая платформа */
,aCode VARCHAR2 := null /* Скрипт *//* Скрипт */
); 
procedure DINAMICFILTERSCRIPT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure DINAMICFILTERSCRIPT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure DINAMICFILTERSCRIPT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure DINAMICFILTERSCRIPT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure DINAMICFILTERSCRIPT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure DINAMICFILTERSCRIPT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure DINAMICFILTERSCRIPT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PARTVIEW_BRIEF  (
 aCURSESSION CHAR,
 aPARTVIEWid CHAR,
 aBRIEF out varchar2
);
procedure PARTVIEW_DELETE  (
 aCURSESSION CHAR,
 aPARTVIEWid CHAR,
 ainstanceid char
); 
procedure PARTVIEW_SAVE (
 aCURSESSION CHAR,
 aPARTVIEWid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,athe_Alias
 VARCHAR2/* Псевдоним *//* Псевдоним */
,aForChoose
 NUMBER/* Для поиска *//* Для поиска */
,aFilterField0
 VARCHAR2 := null /* Поле - фильтр 0 *//* Поле - фильтр 0 */
,aFilterField1
 VARCHAR2 := null /* Поле - фильтр 1 *//* Поле - фильтр 1 */
,aFilterField2
 VARCHAR2 := null /* Поле - фильтр 2 *//* Поле - фильтр 2 */
,aFilterField3
 VARCHAR2 := null /* Поле - фильтр 3 *//* Поле - фильтр 3 */
); 
procedure PARTVIEW_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PARTVIEW_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PARTVIEW_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PARTVIEW_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PARTVIEW_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PARTVIEW_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PARTVIEW_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ViewColumn_BRIEF  (
 aCURSESSION CHAR,
 aViewColumnid CHAR,
 aBRIEF out varchar2
);
procedure ViewColumn_DELETE  (
 aCURSESSION CHAR,
 aViewColumnid CHAR,
 ainstanceid char
); 
procedure ViewColumn_SAVE (
 aCURSESSION CHAR,
 aViewColumnid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,asequence
 NUMBER := null /* №  *//* №  */
,aName
 VARCHAR2/* Название *//* Название */
,athe_Alias
 VARCHAR2/* Псвдоним *//* Псвдоним */
,aFromPart CHAR/* Раздел *//* Раздел */
,aField CHAR/* Поле *//* Поле */
,aAggregation
 NUMBER/* Агрегация *//* Агрегация */
,aExpression VARCHAR2 := null /* Формула *//* Формула */
,aForCombo
 NUMBER := null /* Для комбо *//* Для комбо */
); 
procedure ViewColumn_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ViewColumn_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ViewColumn_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ViewColumn_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ViewColumn_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ViewColumn_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ViewColumn_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VALIDATOR_BRIEF  (
 aCURSESSION CHAR,
 aVALIDATORid CHAR,
 aBRIEF out varchar2
);
procedure VALIDATOR_DELETE  (
 aCURSESSION CHAR,
 aVALIDATORid CHAR,
 ainstanceid char
); 
procedure VALIDATOR_SAVE (
 aCURSESSION CHAR,
 aVALIDATORid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* Целевая платформа *//* Целевая платформа */
,aCode VARCHAR2 := null /* Скрипт *//* Скрипт */
); 
procedure VALIDATOR_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VALIDATOR_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VALIDATOR_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VALIDATOR_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VALIDATOR_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VALIDATOR_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VALIDATOR_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure UNIQUECONSTRAINT_BRIEF  (
 aCURSESSION CHAR,
 aUNIQUECONSTRAINTid CHAR,
 aBRIEF out varchar2
);
procedure UNIQUECONSTRAINT_DELETE  (
 aCURSESSION CHAR,
 aUNIQUECONSTRAINTid CHAR,
 ainstanceid char
); 
procedure UNIQUECONSTRAINT_SAVE (
 aCURSESSION CHAR,
 aUNIQUECONSTRAINTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* Название *//* Название */
,aPerParent
 NUMBER/* По родителю *//* По родителю */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
); 
procedure UNIQUECONSTRAINT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure UNIQUECONSTRAINT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure UNIQUECONSTRAINT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure UNIQUECONSTRAINT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure UNIQUECONSTRAINT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure UNIQUECONSTRAINT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure UNIQUECONSTRAINT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure CONSTRAINTFIELD_BRIEF  (
 aCURSESSION CHAR,
 aCONSTRAINTFIELDid CHAR,
 aBRIEF out varchar2
);
procedure CONSTRAINTFIELD_DELETE  (
 aCURSESSION CHAR,
 aCONSTRAINTFIELDid CHAR,
 ainstanceid char
); 
procedure CONSTRAINTFIELD_SAVE (
 aCURSESSION CHAR,
 aCONSTRAINTFIELDid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheField CHAR/* Поле *//* Поле */
); 
procedure CONSTRAINTFIELD_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure CONSTRAINTFIELD_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure CONSTRAINTFIELD_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure CONSTRAINTFIELD_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure CONSTRAINTFIELD_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure CONSTRAINTFIELD_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure CONSTRAINTFIELD_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure INSTANCEVALIDATOR_BRIEF  (
 aCURSESSION CHAR,
 aINSTANCEVALIDATORid CHAR,
 aBRIEF out varchar2
);
procedure INSTANCEVALIDATOR_DELETE  (
 aCURSESSION CHAR,
 aINSTANCEVALIDATORid CHAR,
 ainstanceid char
); 
procedure INSTANCEVALIDATOR_SAVE (
 aCURSESSION CHAR,
 aINSTANCEVALIDATORid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* Платформа *//* Платформа */
,aCode VARCHAR2 := null /* Скрипт *//* Скрипт */
); 
procedure INSTANCEVALIDATOR_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure INSTANCEVALIDATOR_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure INSTANCEVALIDATOR_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure INSTANCEVALIDATOR_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure INSTANCEVALIDATOR_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure INSTANCEVALIDATOR_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure INSTANCEVALIDATOR_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure OBJSTATUS_BRIEF  (
 aCURSESSION CHAR,
 aOBJSTATUSid CHAR,
 aBRIEF out varchar2
);
procedure OBJSTATUS_DELETE  (
 aCURSESSION CHAR,
 aOBJSTATUSid CHAR,
 ainstanceid char
); 
procedure OBJSTATUS_SAVE (
 aCURSESSION CHAR,
 aOBJSTATUSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aisStartup
 NUMBER/* Начальное *//* Начальное */
,aIsArchive
 NUMBER/* Архивное *//* Архивное */
,athe_comment VARCHAR2 := null /* Описание *//* Описание */
); 
procedure OBJSTATUS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure OBJSTATUS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure OBJSTATUS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure OBJSTATUS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure OBJSTATUS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure OBJSTATUS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure OBJSTATUS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure NEXTSTATE_BRIEF  (
 aCURSESSION CHAR,
 aNEXTSTATEid CHAR,
 aBRIEF out varchar2
);
procedure NEXTSTATE_DELETE  (
 aCURSESSION CHAR,
 aNEXTSTATEid CHAR,
 ainstanceid char
); 
procedure NEXTSTATE_SAVE (
 aCURSESSION CHAR,
 aNEXTSTATEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheState CHAR/* Разрешенное состояние *//* Разрешенное состояние */
); 
procedure NEXTSTATE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure NEXTSTATE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure NEXTSTATE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure NEXTSTATE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure NEXTSTATE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure NEXTSTATE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure NEXTSTATE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure OBJECTMODE_BRIEF  (
 aCURSESSION CHAR,
 aOBJECTMODEid CHAR,
 aBRIEF out varchar2
);
procedure OBJECTMODE_DELETE  (
 aCURSESSION CHAR,
 aOBJECTMODEid CHAR,
 ainstanceid char
); 
procedure OBJECTMODE_SAVE (
 aCURSESSION CHAR,
 aOBJECTMODEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Название режима *//* Название режима */
,aDefaultMode
 NUMBER := null /* Этот режим является основным режимом работы объекта *//* Этот режим является основным режимом работы объекта */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
); 
procedure OBJECTMODE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure OBJECTMODE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure OBJECTMODE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure OBJECTMODE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure OBJECTMODE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure OBJECTMODE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure OBJECTMODE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure STRUCTRESTRICTION_BRIEF  (
 aCURSESSION CHAR,
 aSTRUCTRESTRICTIONid CHAR,
 aBRIEF out varchar2
);
procedure STRUCTRESTRICTION_DELETE  (
 aCURSESSION CHAR,
 aSTRUCTRESTRICTIONid CHAR,
 ainstanceid char
); 
procedure STRUCTRESTRICTION_SAVE (
 aCURSESSION CHAR,
 aSTRUCTRESTRICTIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aStruct CHAR := null /* структура, доступ к которой ограничен *//* структура, доступ к которой ограничен */
,aAllowRead
 NUMBER := null /* Разрешен просмотр *//* Разрешен просмотр */
,aAllowAdd
 NUMBER := null /* Разрешено добавлять *//* Разрешено добавлять */
,aAllowEdit
 NUMBER := null /* Разрешено изменять *//* Разрешено изменять */
,aAllowDelete
 NUMBER := null /* Разрешено удалять *//* Разрешено удалять */
); 
procedure STRUCTRESTRICTION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure STRUCTRESTRICTION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure STRUCTRESTRICTION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure STRUCTRESTRICTION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure STRUCTRESTRICTION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure STRUCTRESTRICTION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure STRUCTRESTRICTION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDRESTRICTION_BRIEF  (
 aCURSESSION CHAR,
 aFIELDRESTRICTIONid CHAR,
 aBRIEF out varchar2
);
procedure FIELDRESTRICTION_DELETE  (
 aCURSESSION CHAR,
 aFIELDRESTRICTIONid CHAR,
 ainstanceid char
); 
procedure FIELDRESTRICTION_SAVE (
 aCURSESSION CHAR,
 aFIELDRESTRICTIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aThePart CHAR := null /* Структура, которой принадлежит поле *//* Структура, которой принадлежит поле */
,aTheField CHAR := null /* Поле, на которое накладывается ограничение *//* Поле, на которое накладывается ограничение */
,aAllowRead
 NUMBER := null /* Разрешен просмотр *//* Разрешен просмотр */
,aAllowModify
 NUMBER := null /* Разрешена модификация *//* Разрешена модификация */
); 
procedure FIELDRESTRICTION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDRESTRICTION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDRESTRICTION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDRESTRICTION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDRESTRICTION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDRESTRICTION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDRESTRICTION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure METHODRESTRICTION_BRIEF  (
 aCURSESSION CHAR,
 aMETHODRESTRICTIONid CHAR,
 aBRIEF out varchar2
);
procedure METHODRESTRICTION_DELETE  (
 aCURSESSION CHAR,
 aMETHODRESTRICTIONid CHAR,
 ainstanceid char
); 
procedure METHODRESTRICTION_SAVE (
 aCURSESSION CHAR,
 aMETHODRESTRICTIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aPart CHAR := null /* Структура, которой принадлежит метод *//* Структура, которой принадлежит метод */
,aMethod CHAR := null /* Метод *//* Метод */
,aIsRestricted
 NUMBER := null /* Запрещено использовать *//* Запрещено использовать */
); 
procedure METHODRESTRICTION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure METHODRESTRICTION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure METHODRESTRICTION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure METHODRESTRICTION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure METHODRESTRICTION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure METHODRESTRICTION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure METHODRESTRICTION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure TYPEMENU_BRIEF  (
 aCURSESSION CHAR,
 aTYPEMENUid CHAR,
 aBRIEF out varchar2
);
procedure TYPEMENU_DELETE  (
 aCURSESSION CHAR,
 aTYPEMENUid CHAR,
 ainstanceid char
); 
procedure TYPEMENU_SAVE (
 aCURSESSION CHAR,
 aTYPEMENUid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* Название *//* Название */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
,aToolTip
 VARCHAR2 := null /* Подсказка *//* Подсказка */
,athe_Action CHAR := null /* Метод *//* Метод */
,aIsMenuItem
 NUMBER := null /* Включать в меню *//* Включать в меню */
,aIsToolBarButton
 NUMBER := null /* Включать в тулбар *//* Включать в тулбар */
,aHotKey
 VARCHAR2 := null /* Горячая клавиша *//* Горячая клавиша */
); 
procedure TYPEMENU_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure TYPEMENU_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure TYPEMENU_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure TYPEMENU_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure TYPEMENU_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure TYPEMENU_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure TYPEMENU_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure MTZAPP_BRIEF  (
 aCURSESSION CHAR,
 aMTZAPPid CHAR,
 aBRIEF out varchar2
);
procedure MTZAPP_DELETE  (
 aCURSESSION CHAR,
 aMTZAPPid CHAR,
 ainstanceid char
); 
procedure MTZAPP_SAVE (
 aCURSESSION CHAR,
 aMTZAPPid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aDBName
 VARCHAR2 := null /* База данных *//* База данных */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
); 
procedure MTZAPP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure MTZAPP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure MTZAPP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure MTZAPP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure MTZAPP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure MTZAPP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure MTZAPP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ParentPackage_BRIEF  (
 aCURSESSION CHAR,
 aParentPackageid CHAR,
 aBRIEF out varchar2
);
procedure ParentPackage_DELETE  (
 aCURSESSION CHAR,
 aParentPackageid CHAR,
 ainstanceid char
); 
procedure ParentPackage_SAVE (
 aCURSESSION CHAR,
 aParentPackageid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aPackage CHAR/* Приложение *//* Приложение */
); 
procedure ParentPackage_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ParentPackage_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ParentPackage_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ParentPackage_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ParentPackage_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ParentPackage_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ParentPackage_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GENPACKAGE_BRIEF  (
 aCURSESSION CHAR,
 aGENPACKAGEid CHAR,
 aBRIEF out varchar2
);
procedure GENPACKAGE_DELETE  (
 aCURSESSION CHAR,
 aGENPACKAGEid CHAR,
 ainstanceid char
); 
procedure GENPACKAGE_SAVE (
 aCURSESSION CHAR,
 aGENPACKAGEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2 := null /* Название *//* Название */
); 
procedure GENPACKAGE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GENPACKAGE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GENPACKAGE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GENPACKAGE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GENPACKAGE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GENPACKAGE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GENPACKAGE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GENERATOR_TARGET_BRIEF  (
 aCURSESSION CHAR,
 aGENERATOR_TARGETid CHAR,
 aBRIEF out varchar2
);
procedure GENERATOR_TARGET_DELETE  (
 aCURSESSION CHAR,
 aGENERATOR_TARGETid CHAR,
 ainstanceid char
); 
procedure GENERATOR_TARGET_SAVE (
 aCURSESSION CHAR,
 aGENERATOR_TARGETid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* Название *//* Название */
,aTargetType
 NUMBER := null /* Тип платформы *//* Тип платформы */
,aQueueName
 VARCHAR2 := null /* Очередь *//* Очередь */
,aGeneratorProgID
 VARCHAR2 := null /* COM класс *//* COM класс */
,aGeneratorStyle
 NUMBER := null /* Вариант *//* Вариант */
,aTheDevelopmentEnv
 NUMBER := null /* Среда разработки *//* Среда разработки */
); 
procedure GENERATOR_TARGET_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GENERATOR_TARGET_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GENERATOR_TARGET_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GENERATOR_TARGET_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GENERATOR_TARGET_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GENERATOR_TARGET_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GENERATOR_TARGET_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GENMANUALCODE_BRIEF  (
 aCURSESSION CHAR,
 aGENMANUALCODEid CHAR,
 aBRIEF out varchar2
);
procedure GENMANUALCODE_DELETE  (
 aCURSESSION CHAR,
 aGENMANUALCODEid CHAR,
 ainstanceid char
); 
procedure GENMANUALCODE_SAVE (
 aCURSESSION CHAR,
 aGENMANUALCODEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,athe_Alias
 VARCHAR2 := null /* Псевдоним *//* Псевдоним */
,aCode VARCHAR2/* Код *//* Код */
); 
procedure GENMANUALCODE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GENMANUALCODE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GENMANUALCODE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GENMANUALCODE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GENMANUALCODE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GENMANUALCODE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GENMANUALCODE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GENCONTROLS_BRIEF  (
 aCURSESSION CHAR,
 aGENCONTROLSid CHAR,
 aBRIEF out varchar2
);
procedure GENCONTROLS_DELETE  (
 aCURSESSION CHAR,
 aGENCONTROLSid CHAR,
 ainstanceid char
); 
procedure GENCONTROLS_SAVE (
 aCURSESSION CHAR,
 aGENCONTROLSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aControlProgID
 VARCHAR2 := null /* ProgID контрольконо элемента *//* ProgID контрольконо элемента */
,aControlClassID
 VARCHAR2 := null /* Класс контрольногоэлемента *//* Класс контрольногоэлемента */
,aVersionMajor
 NUMBER := null /* Версия *//* Версия */
,aVersionMinor
 NUMBER := null /* Подверсия *//* Подверсия */
); 
procedure GENCONTROLS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GENCONTROLS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GENCONTROLS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GENCONTROLS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GENCONTROLS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GENCONTROLS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GENCONTROLS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GENREFERENCE_BRIEF  (
 aCURSESSION CHAR,
 aGENREFERENCEid CHAR,
 aBRIEF out varchar2
);
procedure GENREFERENCE_DELETE  (
 aCURSESSION CHAR,
 aGENREFERENCEid CHAR,
 ainstanceid char
); 
procedure GENREFERENCE_SAVE (
 aCURSESSION CHAR,
 aGENREFERENCEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* Название *//* Название */
,aRefClassID
 VARCHAR2 := null /* Класс ссылки *//* Класс ссылки */
,aVersionMajor
 NUMBER := null /* Номер версии *//* Номер версии */
,aVersionMinor
 NUMBER := null /* Подверсия *//* Подверсия */
); 
procedure GENREFERENCE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GENREFERENCE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GENREFERENCE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GENREFERENCE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GENREFERENCE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GENREFERENCE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GENREFERENCE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZMetaModel;

/



