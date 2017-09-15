
/* --WFRtm*/

 create or replace package WFRtm as

procedure WFRtm_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure WFRtm_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure WFRtm_propagate(acursession CHAR, aROWID CHAR); 


procedure WFRtm_Param_BRIEF  (
 aCURSESSION CHAR,
 aWFRtm_Paramid CHAR,
 aBRIEF out varchar2
);
procedure WFRtm_Param_DELETE  (
 aCURSESSION CHAR,
 aWFRtm_Paramid CHAR,
 ainstanceid char
); 
procedure WFRtm_Param_SAVE (
 aCURSESSION CHAR,
 aWFRtm_Paramid CHAR,
aInstanceID CHAR 
,aBasedOn CHAR/* Реализует *//* Реализует */
,athe_Value
 VARCHAR2/* Значение *//* Значение */
); 
procedure WFRtm_Param_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFRtm_Param_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFRtm_Param_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFRtm_Param_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFRtm_Param_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFRtm_Param_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFRtm_Param_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFRTM_SUBPROCESS_BRIEF  (
 aCURSESSION CHAR,
 aWFRTM_SUBPROCESSid CHAR,
 aBRIEF out varchar2
);
procedure WFRTM_SUBPROCESS_DELETE  (
 aCURSESSION CHAR,
 aWFRTM_SUBPROCESSid CHAR,
 ainstanceid char
); 
procedure WFRTM_SUBPROCESS_SAVE (
 aCURSESSION CHAR,
 aWFRTM_SUBPROCESSid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Имя процесса *//* Имя процесса */
,aProcess CHAR/* Процесс *//* Процесс */
); 
procedure WFRTM_SUBPROCESS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFRTM_SUBPROCESS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFRTM_SUBPROCESS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFRTM_SUBPROCESS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFRTM_SUBPROCESS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFRTM_SUBPROCESS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFRTM_SUBPROCESS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFRtm_main_BRIEF  (
 aCURSESSION CHAR,
 aWFRtm_mainid CHAR,
 aBRIEF out varchar2
);
procedure WFRtm_main_DELETE  (
 aCURSESSION CHAR,
 aWFRtm_mainid CHAR,
 ainstanceid char
); 
procedure WFRtm_main_SAVE (
 aCURSESSION CHAR,
 aWFRtm_mainid CHAR,
aInstanceID CHAR 
,aProcessState
 NUMBER/* Состояние процесса *//* Состояние процесса */
,aBasedOn CHAR/* Реализует *//* Реализует */
,athe_Description VARCHAR2 := null /* Сопровоительная информация *//* Сопровоительная информация */
,aAttachment VARCHAR2 := null /* Приложение */
,aAttachment_EXT varchar2 /* Приложение */
,aModerator CHAR := null /* Отвественный *//* Отвественный */
); 
procedure WFRtm_main_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFRtm_main_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFRtm_main_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFRtm_main_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFRtm_main_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFRtm_main_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFRtm_main_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFRtm_Doc_BRIEF  (
 aCURSESSION CHAR,
 aWFRtm_Docid CHAR,
 aBRIEF out varchar2
);
procedure WFRtm_Doc_DELETE  (
 aCURSESSION CHAR,
 aWFRtm_Docid CHAR,
 ainstanceid char
); 
procedure WFRtm_Doc_SAVE (
 aCURSESSION CHAR,
 aWFRtm_Docid CHAR,
aInstanceID CHAR 
,aBasedOn CHAR/* Реализует *//* Реализует */
,aDocument CHAR/* Документ *//* Документ */
); 
procedure WFRtm_Doc_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFRtm_Doc_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFRtm_Doc_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFRtm_Doc_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFRtm_Doc_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFRtm_Doc_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFRtm_Doc_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFRtm_func_BRIEF  (
 aCURSESSION CHAR,
 aWFRtm_funcid CHAR,
 aBRIEF out varchar2
);
procedure WFRtm_func_DELETE  (
 aCURSESSION CHAR,
 aWFRtm_funcid CHAR,
 ainstanceid char
); 
procedure WFRtm_func_SAVE (
 aCURSESSION CHAR,
 aWFRtm_funcid CHAR,
aInstanceID CHAR 
,aFunc CHAR/* Функция *//* Функция */
); 
procedure WFRtm_func_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFRtm_func_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFRtm_func_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFRtm_func_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFRtm_func_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFRtm_func_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFRtm_func_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFRtm_Pcomm_BRIEF  (
 aCURSESSION CHAR,
 aWFRtm_Pcommid CHAR,
 aBRIEF out varchar2
);
procedure WFRtm_Pcomm_DELETE  (
 aCURSESSION CHAR,
 aWFRtm_Pcommid CHAR,
 ainstanceid char
); 
procedure WFRtm_Pcomm_SAVE (
 aCURSESSION CHAR,
 aWFRtm_Pcommid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aAuthor CHAR/* Автор *//* Автор */
,aSubject
 VARCHAR2/* Тема *//* Тема */
,aMessage VARCHAR2 := null /* Сообщение *//* Сообщение */
,aAttachment VARCHAR2 := null /* Вложение */
,aAttachment_EXT varchar2 /* Вложение */
); 
procedure WFRtm_Pcomm_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFRtm_Pcomm_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFRtm_Pcomm_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFRtm_Pcomm_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFRtm_Pcomm_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFRtm_Pcomm_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFRtm_Pcomm_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end WFRtm;

/



