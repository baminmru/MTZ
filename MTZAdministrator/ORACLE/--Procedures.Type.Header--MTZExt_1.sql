
/* --MTZExt*/

 create or replace package MTZExt as

procedure MTZExt_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZExt_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZExt_propagate(acursession CHAR, aROWID CHAR); 


procedure MTZExt_def_BRIEF  (
 aCURSESSION CHAR,
 aMTZExt_defid CHAR,
 aBRIEF out varchar2
);
procedure MTZExt_def_DELETE  (
 aCURSESSION CHAR,
 aMTZExt_defid CHAR,
 ainstanceid char
); 
procedure MTZExt_def_SAVE (
 aCURSESSION CHAR,
 aMTZExt_defid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aExtType
 NUMBER/* Тип расширения *//* Тип расширения */
,aTheDescription VARCHAR2 := null /* Описание *//* Описание */
); 
procedure MTZExt_def_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure MTZExt_def_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure MTZExt_def_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure MTZExt_def_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure MTZExt_def_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure MTZExt_def_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure MTZExt_def_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure MTZExtRel_BRIEF  (
 aCURSESSION CHAR,
 aMTZExtRelid CHAR,
 aBRIEF out varchar2
);
procedure MTZExtRel_DELETE  (
 aCURSESSION CHAR,
 aMTZExtRelid CHAR,
 ainstanceid char
); 
procedure MTZExtRel_SAVE (
 aCURSESSION CHAR,
 aMTZExtRelid CHAR,
aInstanceID CHAR 
,aThePlatform
 NUMBER/* Реализация *//* Реализация */
,aTheClassName
 VARCHAR2/* Название класса *//* Название класса */
,aTheLibraryName
 VARCHAR2 := null /* Название библиотеки *//* Название библиотеки */
); 
procedure MTZExtRel_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure MTZExtRel_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure MTZExtRel_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure MTZExtRel_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure MTZExtRel_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure MTZExtRel_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure MTZExtRel_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZExt;

/



