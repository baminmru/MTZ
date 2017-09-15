
/* --WFDef*/

 create or replace package WFDef as

procedure WFDef_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure WFDef_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure WFDef_propagate(acursession CHAR, aROWID CHAR); 


procedure WFDef_param_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_paramid CHAR,
 aBRIEF out varchar2
);
procedure WFDef_param_DELETE  (
 aCURSESSION CHAR,
 aWFDef_paramid CHAR,
 ainstanceid char
); 
procedure WFDef_param_SAVE (
 aCURSESSION CHAR,
 aWFDef_paramid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,athe_Value
 VARCHAR2/* Значение *//* Значение */
,aNoChange
 NUMBER/* Не менять после старта *//* Не менять после старта */
,aSetBeforStart
 NUMBER/* Задать до старта процесса *//* Задать до старта процесса */
); 
procedure WFDef_param_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFDef_param_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFDef_param_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFDef_param_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFDef_param_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFDef_param_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFDef_param_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFDef_Doc_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_Docid CHAR,
 aBRIEF out varchar2
);
procedure WFDef_Doc_DELETE  (
 aCURSESSION CHAR,
 aWFDef_Docid CHAR,
 ainstanceid char
); 
procedure WFDef_Doc_SAVE (
 aCURSESSION CHAR,
 aWFDef_Docid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aSetBeforStart
 NUMBER/* Задать до начала процесса *//* Задать до начала процесса */
,aCreateInRuntime
 NUMBER/* Создается в ходе процесса *//* Создается в ходе процесса */
,aDocTemplate CHAR := null /* Шаблон документа *//* Шаблон документа */
,aArchveFolder CHAR := null /* Папка для архивной копии *//* Папка для архивной копии */
,aArchiveMode
 VARCHAR2 := null /* Режим архивного запуска *//* Режим архивного запуска */
,aDocType CHAR := null /* Тип документа *//* Тип документа */
); 
procedure WFDef_Doc_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFDef_Doc_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFDef_Doc_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFDef_Doc_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFDef_Doc_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFDef_Doc_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFDef_Doc_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFDef_func_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_funcid CHAR,
 aBRIEF out varchar2
);
procedure WFDef_func_DELETE  (
 aCURSESSION CHAR,
 aWFDef_funcid CHAR,
 ainstanceid char
); 
procedure WFDef_func_SAVE (
 aCURSESSION CHAR,
 aWFDef_funcid CHAR,
aInstanceID CHAR 
,aFunc CHAR/* Функция *//* Функция */
); 
procedure WFDef_func_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFDef_func_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFDef_func_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFDef_func_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFDef_func_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFDef_func_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFDef_func_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFDef_master_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_masterid CHAR,
 aBRIEF out varchar2
);
procedure WFDef_master_DELETE  (
 aCURSESSION CHAR,
 aWFDef_masterid CHAR,
 ainstanceid char
); 
procedure WFDef_master_SAVE (
 aCURSESSION CHAR,
 aWFDef_masterid CHAR,
aInstanceID CHAR 
,aTheGroup CHAR/* Группа *//* Группа */
,aAllowStart
 NUMBER := null /* Разрешен запуск *//* Разрешен запуск */
,aAllowCheckState
 NUMBER := null /* Разрешен промотр состояния *//* Разрешен промотр состояния */
,aAllowAnaliz
 NUMBER/* Разрешен детальный анализ *//* Разрешен детальный анализ */
,aAllowControl
 NUMBER := null /* Разрешено управление *//* Разрешено управление */
); 
procedure WFDef_master_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFDef_master_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFDef_master_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFDef_master_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFDef_master_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFDef_master_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFDef_master_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFDef_INFO_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_INFOid CHAR,
 aBRIEF out varchar2
);
procedure WFDef_INFO_DELETE  (
 aCURSESSION CHAR,
 aWFDef_INFOid CHAR,
 ainstanceid char
); 
procedure WFDef_INFO_SAVE (
 aCURSESSION CHAR,
 aWFDef_INFOid CHAR,
aInstanceID CHAR 
,aDiagram VARCHAR2 := null /* Диаграмма процесса *//* Диаграмма процесса */
,athe_Description VARCHAR2 := null /* Описание *//* Описание */
); 
procedure WFDef_INFO_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFDef_INFO_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFDef_INFO_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFDef_INFO_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFDef_INFO_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFDef_INFO_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFDef_INFO_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFDef_links_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_linksid CHAR,
 aBRIEF out varchar2
);
procedure WFDef_links_DELETE  (
 aCURSESSION CHAR,
 aWFDef_linksid CHAR,
 ainstanceid char
); 
procedure WFDef_links_SAVE (
 aCURSESSION CHAR,
 aWFDef_linksid CHAR,
aInstanceID CHAR 
,aFromFunction CHAR/* От *//* От */
,aToFunc CHAR/* К *//* К */
,aAcceptAnyResults
 NUMBER/* При любом результате завершения *//* При любом результате завершения */
); 
procedure WFDef_links_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFDef_links_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFDef_links_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFDef_links_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFDef_links_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFDef_links_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFDef_links_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFDef_linkres_BRIEF  (
 aCURSESSION CHAR,
 aWFDef_linkresid CHAR,
 aBRIEF out varchar2
);
procedure WFDef_linkres_DELETE  (
 aCURSESSION CHAR,
 aWFDef_linkresid CHAR,
 ainstanceid char
); 
procedure WFDef_linkres_SAVE (
 aCURSESSION CHAR,
 aWFDef_linkresid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Результат *//* Результат */
); 
procedure WFDef_linkres_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFDef_linkres_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFDef_linkres_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFDef_linkres_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFDef_linkres_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFDef_linkres_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFDef_linkres_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end WFDef;

/



