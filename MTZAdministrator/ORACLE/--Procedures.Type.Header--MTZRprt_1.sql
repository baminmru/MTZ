
/* --MTZRprt*/

 create or replace package MTZRprt as

procedure MTZRprt_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZRprt_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZRprt_propagate(acursession CHAR, aROWID CHAR); 


procedure Reports_BRIEF  (
 aCURSESSION CHAR,
 aReportsid CHAR,
 aBRIEF out varchar2
);
procedure Reports_DELETE  (
 aCURSESSION CHAR,
 aReportsid CHAR,
 ainstanceid char
); 
procedure Reports_SAVE (
 aCURSESSION CHAR,
 aReportsid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aReportFile VARCHAR2 := null /* Файл отчета */
,aReportFile_EXT varchar2 /* Файл отчета */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
,aPrepareMethod CHAR := null /* Метод для формирования *//* Метод для формирования */
,aReportType
 NUMBER/* Тип отчета *//* Тип отчета */
,aTheReportExt CHAR := null /* Расширение для создания отчета *//* Расширение для создания отчета */
,aReportView
 VARCHAR2 := null /* Базовый запрос *//* Базовый запрос */
,aTheComment VARCHAR2 := null /* Описание *//* Описание */
); 
procedure Reports_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Reports_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Reports_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Reports_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Reports_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Reports_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Reports_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure RPTStruct_BRIEF  (
 aCURSESSION CHAR,
 aRPTStructid CHAR,
 aBRIEF out varchar2
);
procedure RPTStruct_DELETE  (
 aCURSESSION CHAR,
 aRPTStructid CHAR,
 ainstanceid char
); 
procedure RPTStruct_SAVE (
 aCURSESSION CHAR,
 aRPTStructid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aName
 VARCHAR2/* Название *//* Название */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
); 
procedure RPTStruct_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure RPTStruct_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure RPTStruct_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure RPTStruct_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure RPTStruct_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure RPTStruct_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure RPTStruct_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure RPTFields_BRIEF  (
 aCURSESSION CHAR,
 aRPTFieldsid CHAR,
 aBRIEF out varchar2
);
procedure RPTFields_DELETE  (
 aCURSESSION CHAR,
 aRPTFieldsid CHAR,
 ainstanceid char
); 
procedure RPTFields_SAVE (
 aCURSESSION CHAR,
 aRPTFieldsid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aFieldType CHAR/* Тип поля *//* Тип поля */
,aFieldSize
 NUMBER := null /* Размер *//* Размер */
,aCaption
 VARCHAR2 := null /* Заголовок *//* Заголовок */
); 
procedure RPTFields_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure RPTFields_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure RPTFields_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure RPTFields_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure RPTFields_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure RPTFields_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure RPTFields_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure RPTFormula_BRIEF  (
 aCURSESSION CHAR,
 aRPTFormulaid CHAR,
 aBRIEF out varchar2
);
procedure RPTFormula_DELETE  (
 aCURSESSION CHAR,
 aRPTFormulaid CHAR,
 ainstanceid char
); 
procedure RPTFormula_SAVE (
 aCURSESSION CHAR,
 aRPTFormulaid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aCode VARCHAR2 := null /* Выражение *//* Выражение */
,aPlatform CHAR := null /* Платформа *//* Платформа */
); 
procedure RPTFormula_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure RPTFormula_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure RPTFormula_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure RPTFormula_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure RPTFormula_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure RPTFormula_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure RPTFormula_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZRprt;

/



