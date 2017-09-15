
/* --WFFR*/

 create or replace package WFFR as

procedure WFFR_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure WFFR_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure WFFR_propagate(acursession CHAR, aROWID CHAR); 


procedure WFFR_ShortCut_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_ShortCutid CHAR,
 aBRIEF out varchar2
);
procedure WFFR_ShortCut_DELETE  (
 aCURSESSION CHAR,
 aWFFR_ShortCutid CHAR,
 ainstanceid char
); 
procedure WFFR_ShortCut_SAVE (
 aCURSESSION CHAR,
 aWFFR_ShortCutid CHAR,
aInstanceID CHAR 
,aBasedOn CHAR/* На основании *//* На основании */
,aShortCut CHAR := null /* Ярлык *//* Ярлык */
); 
procedure WFFR_ShortCut_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFR_ShortCut_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFR_ShortCut_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFR_ShortCut_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFR_ShortCut_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFR_ShortCut_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFR_ShortCut_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFR_Fcomm_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_Fcommid CHAR,
 aBRIEF out varchar2
);
procedure WFFR_Fcomm_DELETE  (
 aCURSESSION CHAR,
 aWFFR_Fcommid CHAR,
 ainstanceid char
); 
procedure WFFR_Fcomm_SAVE (
 aCURSESSION CHAR,
 aWFFR_Fcommid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aAuthor CHAR/* Автор *//* Автор */
,aSubject
 VARCHAR2/* Тема *//* Тема */
,aMessage VARCHAR2 := null /* Сообщение *//* Сообщение */
,aAttachment VARCHAR2 := null /* Вложение */
,aAttachment_EXT varchar2 /* Вложение */
); 
procedure WFFR_Fcomm_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFR_Fcomm_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFR_Fcomm_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFR_Fcomm_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFR_Fcomm_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFR_Fcomm_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFR_Fcomm_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFR_fparents_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_fparentsid CHAR,
 aBRIEF out varchar2
);
procedure WFFR_fparents_DELETE  (
 aCURSESSION CHAR,
 aWFFR_fparentsid CHAR,
 ainstanceid char
); 
procedure WFFR_fparents_SAVE (
 aCURSESSION CHAR,
 aWFFR_fparentsid CHAR,
aInstanceID CHAR 
,aPrevFunc CHAR/* Предыдущая функция *//* Предыдущая функция */
); 
procedure WFFR_fparents_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFR_fparents_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFR_fparents_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFR_fparents_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFR_fparents_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFR_fparents_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFR_fparents_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFR_func_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_funcid CHAR,
 aBRIEF out varchar2
);
procedure WFFR_func_DELETE  (
 aCURSESSION CHAR,
 aWFFR_funcid CHAR,
 ainstanceid char
); 
procedure WFFR_func_SAVE (
 aCURSESSION CHAR,
 aWFFR_funcid CHAR,
aInstanceID CHAR 
,aState
 NUMBER/* Состояние *//* Состояние */
,aBasedOn CHAR/* Реализует *//* Реализует */
,aPassNo
 NUMBER/* Проход *//* Проход */
,aCreateAt
 DATE := null /* Момент создания *//* Момент создания */
,aLastStart
 DATE := null /* Последний запуск *//* Последний запуск */
,aLastStateScan
 DATE := null /* Последний контроль состояния *//* Последний контроль состояния */
,aPriority
 NUMBER := null /* Текущий приоритет *//* Текущий приоритет */
,aChangePriorityTime
 DATE := null /* Момент пересчета приоритета *//* Момент пересчета приоритета */
,aWorkPercent
 NUMBER := null /* Готовность *//* Готовность */
,aInfo VARCHAR2 := null /* Текущее задание *//* Текущее задание */
,aFuncResult
 VARCHAR2 := null /* Результат *//* Результат */
); 
procedure WFFR_func_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFR_func_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFR_func_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFR_func_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFR_func_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFR_func_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFR_func_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end WFFR;

/



