
/* --VRRPT*/

 create or replace package VRRPT as

procedure VRRPT_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure VRRPT_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure VRRPT_propagate(acursession CHAR, aROWID CHAR); 


procedure VRRPT_COSTS_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_COSTSid CHAR,
 aBRIEF out varchar2
);
procedure VRRPT_COSTS_DELETE  (
 aCURSESSION CHAR,
 aVRRPT_COSTSid CHAR,
 ainstanceid char
); 
procedure VRRPT_COSTS_SAVE (
 aCURSESSION CHAR,
 aVRRPT_COSTSid CHAR,
aInstanceID CHAR 
,aDescrtiption VARCHAR2/* Описание *//* Описание */
,aCost
 NUMBER := null /* Стоимость *//* Стоимость */
,aDuration
 NUMBER := null /* Длительность (час.) *//* Длительность (час.) */
); 
procedure VRRPT_COSTS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRRPT_COSTS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRRPT_COSTS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRRPT_COSTS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRRPT_COSTS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRRPT_COSTS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRRPT_COSTS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRRPT_MeetingPlan_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_MeetingPlanid CHAR,
 aBRIEF out varchar2
);
procedure VRRPT_MeetingPlan_DELETE  (
 aCURSESSION CHAR,
 aVRRPT_MeetingPlanid CHAR,
 ainstanceid char
); 
procedure VRRPT_MeetingPlan_SAVE (
 aCURSESSION CHAR,
 aVRRPT_MeetingPlanid CHAR,
aInstanceID CHAR 
,aDateOF
 DATE/* Время встречи *//* Время встречи */
,aPlaceOf VARCHAR2/* Место проведения *//* Место проведения */
,atheme VARCHAR2/* Тема *//* Тема */
); 
procedure VRRPT_MeetingPlan_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRRPT_MeetingPlan_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRRPT_MeetingPlan_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRRPT_MeetingPlan_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRRPT_MeetingPlan_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRRPT_MeetingPlan_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRRPT_MeetingPlan_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRRPT_Meeters_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_Meetersid CHAR,
 aBRIEF out varchar2
);
procedure VRRPT_Meeters_DELETE  (
 aCURSESSION CHAR,
 aVRRPT_Meetersid CHAR,
 ainstanceid char
); 
procedure VRRPT_Meeters_SAVE (
 aCURSESSION CHAR,
 aVRRPT_Meetersid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aWorker CHAR := null /* Сотрудник *//* Сотрудник */
,aContact CHAR := null /* Контактное лицо *//* Контактное лицо */
,aMandatory
 NUMBER/* Обязательно *//* Обязательно */
,aReminderTime
 NUMBER := null /* Оповещать за (час.) *//* Оповещать за (час.) */
,aReminderSent
 NUMBER := null /* Оповещен *//* Оповещен */
); 
procedure VRRPT_Meeters_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRRPT_Meeters_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRRPT_Meeters_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRRPT_Meeters_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRRPT_Meeters_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRRPT_Meeters_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRRPT_Meeters_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRRPT_MAIN_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_MAINid CHAR,
 aBRIEF out varchar2
);
procedure VRRPT_MAIN_DELETE  (
 aCURSESSION CHAR,
 aVRRPT_MAINid CHAR,
 ainstanceid char
); 
procedure VRRPT_MAIN_SAVE (
 aCURSESSION CHAR,
 aVRRPT_MAINid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* Наша организация *//* Наша организация */
,aAuthor CHAR/* Автор *//* Автор */
,aTheDate
 DATE/* Дата отчета *//* Дата отчета */
,aClient CHAR := null /* Клиент *//* Клиент */
,aProject CHAR := null /* Проект *//* Проект */
,aContract CHAR := null /* Договор *//* Договор */
,aPerson CHAR := null /* Контактное лицо *//* Контактное лицо */
,aName
 VARCHAR2 := null /* Название отчета *//* Название отчета */
,aInfo VARCHAR2 := null /* Информация *//* Информация */
,aAttrachment VARCHAR2 := null /* Вложение */
,aAttrachment_EXT varchar2 /* Вложение */
,aReportType CHAR := null /* Тип отчета *//* Тип отчета */
); 
procedure VRRPT_MAIN_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRRPT_MAIN_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRRPT_MAIN_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRRPT_MAIN_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRRPT_MAIN_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRRPT_MAIN_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRRPT_MAIN_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end VRRPT;

/



