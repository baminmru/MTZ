
/* --MTZSystem*/

 create or replace package MTZSystem as

procedure MTZSystem_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZSystem_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZSystem_propagate(acursession CHAR, aROWID CHAR); 


procedure SysLog_BRIEF  (
 aCURSESSION CHAR,
 aSysLogid CHAR,
 aBRIEF out varchar2
);
procedure SysLog_DELETE  (
 aCURSESSION CHAR,
 aSysLogid CHAR,
 ainstanceid char
); 
procedure SysLog_SAVE (
 aCURSESSION CHAR,
 aSysLogid CHAR,
aInstanceID CHAR 
,aTheSession CHAR/* Сессия *//* Сессия */
,athe_Resource
 VARCHAR2/* Ресурс *//* Ресурс */
,aLogStructID
 VARCHAR2 := null /* Раздел с которым происхоит действие *//* Раздел с которым происхоит действие */
,aVERB
 VARCHAR2/* Действие *//* Действие */
,aLogInstanceID CHAR := null /* Идентификатор документа *//* Идентификатор документа */
); 
procedure SysLog_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure SysLog_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure SysLog_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure SysLog_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure SysLog_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure SysLog_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure SysLog_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure the_Session_BRIEF  (
 aCURSESSION CHAR,
 athe_Sessionid CHAR,
 aBRIEF out varchar2
);
procedure the_Session_DELETE  (
 aCURSESSION CHAR,
 athe_Sessionid CHAR,
 ainstanceid char
); 
procedure the_Session_SAVE (
 aCURSESSION CHAR,
 athe_Sessionid CHAR,
aInstanceID CHAR 
,aUserRole CHAR := null /* Текущая роль пользователя *//* Текущая роль пользователя */
,aClosedAt
 DATE := null /* Момент закрытия *//* Момент закрытия */
,aClosed
 NUMBER/* Закрыта *//* Закрыта */
,aUsersid CHAR/* Пользователь *//* Пользователь */
,aLastAccess
 DATE := null /* Последнее подтверждение *//* Последнее подтверждение */
,aStartAt
 DATE/* Момент открытия *//* Момент открытия */
); 
procedure the_Session_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure the_Session_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure the_Session_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure the_Session_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure the_Session_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure the_Session_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure the_Session_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure LogReader_BRIEF  (
 aCURSESSION CHAR,
 aLogReaderid CHAR,
 aBRIEF out varchar2
);
procedure LogReader_DELETE  (
 aCURSESSION CHAR,
 aLogReaderid CHAR,
 ainstanceid char
); 
procedure LogReader_SAVE (
 aCURSESSION CHAR,
 aLogReaderid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aAutoStart
 NUMBER/* Автоматизированный запуск *//* Автоматизированный запуск */
,aAutoProgid
 VARCHAR2 := null /* Класс для автоматического запуска *//* Класс для автоматического запуска */
,aReadMarker
 DATE/* Дата последней прочитанной записи *//* Дата последней прочитанной записи */
,aStartInterval
 NUMBER := null /* Интервал запуска (мин) *//* Интервал запуска (мин) */
,aLastStart
 DATE := null /* Дата последнего запуска *//* Дата последнего запуска */
,aLastStop
 DATE := null /* Дата последне останвки *//* Дата последне останвки */
); 
procedure LogReader_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure LogReader_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure LogReader_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure LogReader_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure LogReader_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure LogReader_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure LogReader_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure Verb_BRIEF  (
 aCURSESSION CHAR,
 aVerbid CHAR,
 aBRIEF out varchar2
);
procedure Verb_DELETE  (
 aCURSESSION CHAR,
 aVerbid CHAR,
 ainstanceid char
); 
procedure Verb_SAVE (
 aCURSESSION CHAR,
 aVerbid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
); 
procedure Verb_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Verb_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Verb_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Verb_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Verb_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Verb_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Verb_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZSystem;

/



