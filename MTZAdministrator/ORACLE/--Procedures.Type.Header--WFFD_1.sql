
/* --WFFD*/

 create or replace package WFFD as

procedure WFFD_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure WFFD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure WFFD_propagate(acursession CHAR, aROWID CHAR); 


procedure WFFD_ShortCut_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_ShortCutid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_ShortCut_DELETE  (
 aCURSESSION CHAR,
 aWFFD_ShortCutid CHAR,
 ainstanceid char
); 
procedure WFFD_ShortCut_SAVE (
 aCURSESSION CHAR,
 aWFFD_ShortCutid CHAR,
aInstanceID CHAR 
,aFolder CHAR/* Папка *//* Папка */
,aDocName
 VARCHAR2/* Название документа *//* Название документа */
,aStartMode
 VARCHAR2 := null /* Режим запуска *//* Режим запуска */
); 
procedure WFFD_ShortCut_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_ShortCut_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_ShortCut_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_ShortCut_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_ShortCut_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_ShortCut_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_ShortCut_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_Results_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_Resultsid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_Results_DELETE  (
 aCURSESSION CHAR,
 aWFFD_Resultsid CHAR,
 ainstanceid char
); 
procedure WFFD_Results_SAVE (
 aCURSESSION CHAR,
 aWFFD_Resultsid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Наименование *//* Наименование */
,aResultWeight
 NUMBER := null /* Весовой коэффицент *//* Весовой коэффицент */
); 
procedure WFFD_Results_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_Results_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_Results_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_Results_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_Results_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_Results_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_Results_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_DOCSTOPS_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_DOCSTOPSid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_DOCSTOPS_DELETE  (
 aCURSESSION CHAR,
 aWFFD_DOCSTOPSid CHAR,
 ainstanceid char
); 
procedure WFFD_DOCSTOPS_SAVE (
 aCURSESSION CHAR,
 aWFFD_DOCSTOPSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aProcessDocument CHAR/* Документ процеса *//* Документ процеса */
,aDocStateName
 VARCHAR2/* Название состояния *//* Название состояния */
); 
procedure WFFD_DOCSTOPS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_DOCSTOPS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_DOCSTOPS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_DOCSTOPS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_DOCSTOPS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_DOCSTOPS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_DOCSTOPS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_CustomParam_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_CustomParamid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_CustomParam_DELETE  (
 aCURSESSION CHAR,
 aWFFD_CustomParamid CHAR,
 ainstanceid char
); 
procedure WFFD_CustomParam_SAVE (
 aCURSESSION CHAR,
 aWFFD_CustomParamid CHAR,
aInstanceID CHAR 
,aParamName
 VARCHAR2/* Имя параметра *//* Имя параметра */
,athe_Value VARCHAR2 := null /* Значение *//* Значение */
); 
procedure WFFD_CustomParam_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_CustomParam_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_CustomParam_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_CustomParam_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_CustomParam_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_CustomParam_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_CustomParam_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_Doer_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_Doerid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_Doer_DELETE  (
 aCURSESSION CHAR,
 aWFFD_Doerid CHAR,
 ainstanceid char
); 
procedure WFFD_Doer_SAVE (
 aCURSESSION CHAR,
 aWFFD_Doerid CHAR,
aInstanceID CHAR 
,aDoerGroup CHAR/* Группа *//* Группа */
); 
procedure WFFD_Doer_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_Doer_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_Doer_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_Doer_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_Doer_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_Doer_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_Doer_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_common_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_commonid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_common_DELETE  (
 aCURSESSION CHAR,
 aWFFD_commonid CHAR,
 ainstanceid char
); 
procedure WFFD_common_SAVE (
 aCURSESSION CHAR,
 aWFFD_commonid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aStepType CHAR/* Тип шага *//* Тип шага */
,aReuseStep
 NUMBER/* Использовать незавершенный шаг *//* Использовать незавершенный шаг */
,aAutoCheckState
 NUMBER/* Проверять состояние *//* Проверять состояние */
,aReStartInterval
 NUMBER := null /* Интервал перезапуска (мин.) *//* Интервал перезапуска (мин.) */
,aStateCeckInterval
 NUMBER := null /* Инетрвал проверки состояния (мин.) *//* Инетрвал проверки состояния (мин.) */
,aMinPriority
 NUMBER := null /* Минимальный приоритет *//* Минимальный приоритет */
,aMaxPriority
 NUMBER := null /* Максимальный приоритет *//* Максимальный приоритет */
,aIncPriority
 NUMBER := null /* Прирост приоритета *//* Прирост приоритета */
,aGrowPriorityInterval
 NUMBER := null /* Интервал роста приоритета (мин.) *//* Интервал роста приоритета (мин.) */
,aMaxPassNumber
 NUMBER := null /* Максимальный номер прохода *//* Максимальный номер прохода */
,aTaskDescription VARCHAR2 := null /* Описание задания *//* Описание задания */
,aAttachment VARCHAR2 := null /* Вложение */
,aAttachment_EXT varchar2 /* Вложение */
,aWorkTime
 NUMBER := null /* Срок исполнения (ч.) *//* Срок исполнения (ч.) */
,aIntegrationData1
 VARCHAR2 := null /* Данные для интеграции 1 *//* Данные для интеграции 1 */
,aIntegrationData2
 VARCHAR2 := null /* Данные для интеграции 2 *//* Данные для интеграции 2 */
); 
procedure WFFD_common_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_common_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_common_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_common_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_common_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_common_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_common_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_ATTR1_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_ATTR1id CHAR,
 aBRIEF out varchar2
);
procedure WFFD_ATTR1_DELETE  (
 aCURSESSION CHAR,
 aWFFD_ATTR1id CHAR,
 ainstanceid char
); 
procedure WFFD_ATTR1_SAVE (
 aCURSESSION CHAR,
 aWFFD_ATTR1id CHAR,
aInstanceID CHAR 
,aObjectType CHAR := null /* Тип документа *//* Тип документа */
,aProcessDocument CHAR := null /* Документ процеса *//* Документ процеса */
,aSubProcDocument
 VARCHAR2 := null /* Название документа в подпроцессе *//* Название документа в подпроцессе */
,aDocumentPart CHAR := null /* Раздел документа *//* Раздел документа */
,aPartField CHAR := null /* Поле в разделе *//* Поле в разделе */
,aFolder CHAR := null /* Папка в каталоге *//* Папка в каталоге */
,aProcessParameter CHAR := null /* Переменная 1 *//* Переменная 1 */
,aProcessParameter2 CHAR := null /* Переменная 2 *//* Переменная 2 */
,athe_Value
 VARCHAR2 := null /* Значение *//* Значение */
,aValue2
 VARCHAR2 := null /* Значение2 *//* Значение2 */
,aPath VARCHAR2 := null /* Директория *//* Директория */
,aPath2 VARCHAR2 := null /* Директория для размещения *//* Директория для размещения */
,aFlag
 NUMBER := null /* Флаг *//* Флаг */
,aFlag2
 NUMBER := null /* Флаг 2 *//* Флаг 2 */
,aSubProcessType CHAR := null /* Тип подпроцесса *//* Тип подпроцесса */
,aProcessParameter3 CHAR := null /* Переменная 3 *//* Переменная 3 */
,aProcessParameter4 CHAR := null /* Переменная 4 *//* Переменная 4 */
,aDocState1 CHAR := null /* Состояние 1 *//* Состояние 1 */
,aDocState2 CHAR := null /* Состояние 2 *//* Состояние 2 */
); 
procedure WFFD_ATTR1_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_ATTR1_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_ATTR1_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_ATTR1_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_ATTR1_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_ATTR1_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_ATTR1_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFD_DOCS_BRIEF  (
 aCURSESSION CHAR,
 aWFFD_DOCSid CHAR,
 aBRIEF out varchar2
);
procedure WFFD_DOCS_DELETE  (
 aCURSESSION CHAR,
 aWFFD_DOCSid CHAR,
 ainstanceid char
); 
procedure WFFD_DOCS_SAVE (
 aCURSESSION CHAR,
 aWFFD_DOCSid CHAR,
aInstanceID CHAR 
,aProcessDocument CHAR/* Документ процеса *//* Документ процеса */
,aAllowCreate
 NUMBER := null /* Ожидается создание *//* Ожидается создание */
,aAllowWrite
 NUMBER := null /* Ожидается модификация *//* Ожидается модификация */
,aDocMode
 VARCHAR2 := null /* Режим открытия документа *//* Режим открытия документа */
); 
procedure WFFD_DOCS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFD_DOCS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFD_DOCS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFD_DOCS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFD_DOCS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFD_DOCS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFD_DOCS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end WFFD;

/



