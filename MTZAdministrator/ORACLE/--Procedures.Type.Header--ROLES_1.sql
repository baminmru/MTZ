
/* --ROLES*/

 create or replace package ROLES as

procedure ROLES_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure ROLES_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure ROLES_propagate(acursession CHAR, aROWID CHAR); 


procedure ROLES_USER_BRIEF  (
 aCURSESSION CHAR,
 aROLES_USERid CHAR,
 aBRIEF out varchar2
);
procedure ROLES_USER_DELETE  (
 aCURSESSION CHAR,
 aROLES_USERid CHAR,
 ainstanceid char
); 
procedure ROLES_USER_SAVE (
 aCURSESSION CHAR,
 aROLES_USERid CHAR,
aInstanceID CHAR 
,aTheUser CHAR/* Пользователь *//* Пользователь */
); 
procedure ROLES_USER_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ROLES_USER_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ROLES_USER_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ROLES_USER_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ROLES_USER_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ROLES_USER_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ROLES_USER_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ROLES_MAP_BRIEF  (
 aCURSESSION CHAR,
 aROLES_MAPid CHAR,
 aBRIEF out varchar2
);
procedure ROLES_MAP_DELETE  (
 aCURSESSION CHAR,
 aROLES_MAPid CHAR,
 ainstanceid char
); 
procedure ROLES_MAP_SAVE (
 aCURSESSION CHAR,
 aROLES_MAPid CHAR,
aInstanceID CHAR 
,aTheGroup CHAR/* Группа *//* Группа */
); 
procedure ROLES_MAP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ROLES_MAP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ROLES_MAP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ROLES_MAP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ROLES_MAP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ROLES_MAP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ROLES_MAP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ROLES_DOC_BRIEF  (
 aCURSESSION CHAR,
 aROLES_DOCid CHAR,
 aBRIEF out varchar2
);
procedure ROLES_DOC_DELETE  (
 aCURSESSION CHAR,
 aROLES_DOCid CHAR,
 ainstanceid char
); 
procedure ROLES_DOC_SAVE (
 aCURSESSION CHAR,
 aROLES_DOCid CHAR,
aInstanceID CHAR 
,aThe_Document CHAR/* Тип документа *//* Тип документа */
,aThe_Denied
 NUMBER := null /* Запрещен *//* Запрещен */
,aAllowDeleteDoc
 NUMBER := null /* Разрешено удаление *//* Разрешено удаление */
); 
procedure ROLES_DOC_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ROLES_DOC_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ROLES_DOC_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ROLES_DOC_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ROLES_DOC_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ROLES_DOC_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ROLES_DOC_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ROLES_DOC_STATE_BRIEF  (
 aCURSESSION CHAR,
 aROLES_DOC_STATEid CHAR,
 aBRIEF out varchar2
);
procedure ROLES_DOC_STATE_DELETE  (
 aCURSESSION CHAR,
 aROLES_DOC_STATEid CHAR,
 ainstanceid char
); 
procedure ROLES_DOC_STATE_SAVE (
 aCURSESSION CHAR,
 aROLES_DOC_STATEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aThe_State CHAR := null /* Состояние *//* Состояние */
,aThe_Mode CHAR := null /* Режим *//* Режим */
,aAllowDelete
 NUMBER := null /* Можно удалять *//* Можно удалять */
,aStateChangeDisabled
 NUMBER := null /* Запрещена смена состояния *//* Запрещена смена состояния */
); 
procedure ROLES_DOC_STATE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ROLES_DOC_STATE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ROLES_DOC_STATE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ROLES_DOC_STATE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ROLES_DOC_STATE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ROLES_DOC_STATE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ROLES_DOC_STATE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ROLES_DEF_BRIEF  (
 aCURSESSION CHAR,
 aROLES_DEFid CHAR,
 aBRIEF out varchar2
);
procedure ROLES_DEF_DELETE  (
 aCURSESSION CHAR,
 aROLES_DEFid CHAR,
 ainstanceid char
); 
procedure ROLES_DEF_SAVE (
 aCURSESSION CHAR,
 aROLES_DEFid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название *//* Название */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
,aRightsSet_Denied
 NUMBER := null /* Настройка прав запрещена *//* Настройка прав запрещена */
,aFormCFG_Denied
 NUMBER := null /* Настройки форм запрещены *//* Настройки форм запрещены */
,aListCFG_Denied
 NUMBER := null /* Настройка журналов запрещена *//* Настройка журналов запрещена */
,aFileExch_Denied
 NUMBER := null /* Файловый обмен запрещен *//* Файловый обмен запрещен */
); 
procedure ROLES_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ROLES_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ROLES_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ROLES_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ROLES_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ROLES_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ROLES_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ROLES_REPORTS_BRIEF  (
 aCURSESSION CHAR,
 aROLES_REPORTSid CHAR,
 aBRIEF out varchar2
);
procedure ROLES_REPORTS_DELETE  (
 aCURSESSION CHAR,
 aROLES_REPORTSid CHAR,
 ainstanceid char
); 
procedure ROLES_REPORTS_SAVE (
 aCURSESSION CHAR,
 aROLES_REPORTSid CHAR,
aInstanceID CHAR 
,aThe_Report CHAR/* Отчёт *//* Отчёт */
); 
procedure ROLES_REPORTS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ROLES_REPORTS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ROLES_REPORTS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ROLES_REPORTS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ROLES_REPORTS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ROLES_REPORTS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ROLES_REPORTS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ROLES_WP_BRIEF  (
 aCURSESSION CHAR,
 aROLES_WPid CHAR,
 aBRIEF out varchar2
);
procedure ROLES_WP_DELETE  (
 aCURSESSION CHAR,
 aROLES_WPid CHAR,
 ainstanceid char
); 
procedure ROLES_WP_SAVE (
 aCURSESSION CHAR,
 aROLES_WPid CHAR,
aInstanceID CHAR 
,aWP CHAR/* Приложение *//* Приложение */
); 
procedure ROLES_WP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ROLES_WP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ROLES_WP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ROLES_WP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ROLES_WP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ROLES_WP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ROLES_WP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ROLES_ACT_BRIEF  (
 aCURSESSION CHAR,
 aROLES_ACTid CHAR,
 aBRIEF out varchar2
);
procedure ROLES_ACT_DELETE  (
 aCURSESSION CHAR,
 aROLES_ACTid CHAR,
 ainstanceid char
); 
procedure ROLES_ACT_SAVE (
 aCURSESSION CHAR,
 aROLES_ACTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
, aParentRowid CHAR :=null
,aAccesible
 NUMBER := null /* Доступность *//* Доступность */
,aEntryPoints CHAR/* Доступные действия *//* Доступные действия */
); 
procedure ROLES_ACT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ROLES_ACT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ROLES_ACT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ROLES_ACT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ROLES_ACT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ROLES_ACT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ROLES_ACT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end ROLES;

/



