
/* --VRPRJ*/

 create or replace package VRPRJ as

procedure VRPRJ_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure VRPRJ_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure VRPRJ_propagate(acursession CHAR, aROWID CHAR); 


procedure VRPRJ_REPORT_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_REPORTid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_REPORT_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_REPORTid CHAR,
 ainstanceid char
); 
procedure VRPRJ_REPORT_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_REPORTid CHAR,
aInstanceID CHAR 
,aReport CHAR/* Отчет *//* Отчет */
); 
procedure VRPRJ_REPORT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_REPORT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_REPORT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_REPORT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_REPORT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_REPORT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_REPORT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_SUBPROJECT_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_SUBPROJECTid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_SUBPROJECT_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_SUBPROJECTid CHAR,
 ainstanceid char
); 
procedure VRPRJ_SUBPROJECT_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_SUBPROJECTid CHAR,
aInstanceID CHAR 
,aSubProject CHAR/* Подпроект *//* Подпроект */
,athe_Comment VARCHAR2 := null /* Комментарий *//* Комментарий */
); 
procedure VRPRJ_SUBPROJECT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_SUBPROJECT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_SUBPROJECT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_SUBPROJECT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_SUBPROJECT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_SUBPROJECT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_SUBPROJECT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_JOB_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_JOBid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_JOB_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_JOBid CHAR,
 ainstanceid char
); 
procedure VRPRJ_JOB_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_JOBid CHAR,
aInstanceID CHAR 
,athe_Description VARCHAR2/* Описание *//* Описание */
,aMainPerson CHAR := null /* Ответственный *//* Ответственный */
,aTheFile VARCHAR2 := null /* Файл */
,aTheFile_EXT varchar2 /* Файл */
,aPlanWork
 NUMBER := null /* Плановая трудоемкость *//* Плановая трудоемкость */
,aStartDate
 DATE := null /* Дата начала работ *//* Дата начала работ */
,aDueDate
 DATE := null /* Дата звершения *//* Дата звершения */
,aFactStart
 DATE := null /* Фактическое начало *//* Фактическое начало */
,aFactFinish
 DATE := null /* Фактическое звершение *//* Фактическое звершение */
,aFactWork
 NUMBER := null /* Фактическая трудоемкость *//* Фактическая трудоемкость */
,aJobDone
 NUMBER := null /* Работа выполнена *//* Работа выполнена */
); 
procedure VRPRJ_JOB_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_JOB_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_JOB_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_JOB_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_JOB_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_JOB_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_JOB_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_SeeAlso_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_SeeAlsoid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_SeeAlso_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_SeeAlsoid CHAR,
 ainstanceid char
); 
procedure VRPRJ_SeeAlso_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_SeeAlsoid CHAR,
aInstanceID CHAR 
,aDocument CHAR/* Документ *//* Документ */
,athe_Comment VARCHAR2 := null /* Примечание *//* Примечание */
); 
procedure VRPRJ_SeeAlso_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_SeeAlso_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_SeeAlso_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_SeeAlso_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_SeeAlso_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_SeeAlso_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_SeeAlso_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_CUSTOMER_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_CUSTOMERid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_CUSTOMER_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_CUSTOMERid CHAR,
 ainstanceid char
); 
procedure VRPRJ_CUSTOMER_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_CUSTOMERid CHAR,
aInstanceID CHAR 
,aCustomer CHAR/* Заказчик *//* Заказчик */
,athe_Comment VARCHAR2 := null /* Примечание *//* Примечание */
,aSubContructor
 NUMBER := null /* Субподрядчик *//* Субподрядчик */
); 
procedure VRPRJ_CUSTOMER_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_CUSTOMER_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_CUSTOMER_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_CUSTOMER_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_CUSTOMER_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_CUSTOMER_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_CUSTOMER_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_Contract_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_Contractid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_Contract_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_Contractid CHAR,
 ainstanceid char
); 
procedure VRPRJ_Contract_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_Contractid CHAR,
aInstanceID CHAR 
,aContract CHAR/* Договор *//* Договор */
); 
procedure VRPRJ_Contract_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_Contract_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_Contract_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_Contract_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_Contract_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_Contract_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_Contract_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRPRJ_COMMON_BRIEF  (
 aCURSESSION CHAR,
 aVRPRJ_COMMONid CHAR,
 aBRIEF out varchar2
);
procedure VRPRJ_COMMON_DELETE  (
 aCURSESSION CHAR,
 aVRPRJ_COMMONid CHAR,
 ainstanceid char
); 
procedure VRPRJ_COMMON_SAVE (
 aCURSESSION CHAR,
 aVRPRJ_COMMONid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* Наша организация *//* Наша организация */
,aProjectType CHAR/* Тип проекта *//* Тип проекта */
,aname
 VARCHAR2/* Название *//* Название */
,aInfo VARCHAR2 := null /* Описание *//* Описание */
,atheFile VARCHAR2 := null /* Файл */
,atheFile_EXT varchar2 /* Файл */
,aMainPerson CHAR := null /* Ответственный *//* Ответственный */
,aProjectClosed
 NUMBER/* Проект завершен *//* Проект завершен */
,aPlanStart
 DATE := null /* Плановое начало *//* Плановое начало */
,aPlanWork
 NUMBER/* Плановая трудоемкость *//* Плановая трудоемкость */
,aPlanFinish
 DATE := null /* Плановое завершение *//* Плановое завершение */
); 
procedure VRPRJ_COMMON_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRPRJ_COMMON_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRPRJ_COMMON_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRPRJ_COMMON_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRPRJ_COMMON_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRPRJ_COMMON_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRPRJ_COMMON_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end VRPRJ;

/



