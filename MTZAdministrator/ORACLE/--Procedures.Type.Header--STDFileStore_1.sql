
/* --STDFileStore*/

 create or replace package STDFileStore as

procedure STDFileStore_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure STDFileStore_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure STDFileStore_propagate(acursession CHAR, aROWID CHAR); 


procedure FileDef_BRIEF  (
 aCURSESSION CHAR,
 aFileDefid CHAR,
 aBRIEF out varchar2
);
procedure FileDef_DELETE  (
 aCURSESSION CHAR,
 aFileDefid CHAR,
 ainstanceid char
); 
procedure FileDef_SAVE (
 aCURSESSION CHAR,
 aFileDefid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,athe_Comment VARCHAR2 := null /* Пояснение *//* Пояснение */
); 
procedure FileDef_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FileDef_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FileDef_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FileDef_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FileDef_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FileDef_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FileDef_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FileVersion_BRIEF  (
 aCURSESSION CHAR,
 aFileVersionid CHAR,
 aBRIEF out varchar2
);
procedure FileVersion_DELETE  (
 aCURSESSION CHAR,
 aFileVersionid CHAR,
 ainstanceid char
); 
procedure FileVersion_SAVE (
 aCURSESSION CHAR,
 aFileVersionid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aVersion
 VARCHAR2 := null /* Номер версии *//* Номер версии */
,aExt
 VARCHAR2/* Расширение *//* Расширение */
,aCurrentVersion
 NUMBER/* Текущая версия *//* Текущая версия */
,athe_Comment VARCHAR2 := null /* Пояснение *//* Пояснение */
,aFileData VARCHAR2/* Данные */
,aFileData_EXT varchar2 /* Данные */
); 
procedure FileVersion_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FileVersion_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FileVersion_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FileVersion_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FileVersion_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FileVersion_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FileVersion_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end STDFileStore;

/



