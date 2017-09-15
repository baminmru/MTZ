
/* --STDInfoStore*/

 create or replace package STDInfoStore as

procedure STDInfoStore_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure STDInfoStore_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure STDInfoStore_propagate(acursession CHAR, aROWID CHAR); 


procedure InfoStoreDef_BRIEF  (
 aCURSESSION CHAR,
 aInfoStoreDefid CHAR,
 aBRIEF out varchar2
);
procedure InfoStoreDef_DELETE  (
 aCURSESSION CHAR,
 aInfoStoreDefid CHAR,
 ainstanceid char
); 
procedure InfoStoreDef_SAVE (
 aCURSESSION CHAR,
 aInfoStoreDefid CHAR,
aInstanceID CHAR 
,aTheGroup CHAR := null /* Группа *//* Группа */
,aName
 VARCHAR2/* Название *//* Название */
,aInfoStoreType
 NUMBER/* Тип каталога *//* Тип каталога */
,aTheUser CHAR := null /* Пользователь *//* Пользователь */
); 
procedure InfoStoreDef_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure InfoStoreDef_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure InfoStoreDef_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure InfoStoreDef_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure InfoStoreDef_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure InfoStoreDef_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure InfoStoreDef_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure Folder_BRIEF  (
 aCURSESSION CHAR,
 aFolderid CHAR,
 aBRIEF out varchar2
);
procedure Folder_DELETE  (
 aCURSESSION CHAR,
 aFolderid CHAR,
 ainstanceid char
); 
procedure Folder_SAVE (
 aCURSESSION CHAR,
 aFolderid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aName
 VARCHAR2/* Название *//* Название */
,aFolderType
 NUMBER/* Тип папки *//* Тип папки */
); 
procedure Folder_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Folder_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Folder_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Folder_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Folder_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Folder_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Folder_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure Shortcut_BRIEF  (
 aCURSESSION CHAR,
 aShortcutid CHAR,
 aBRIEF out varchar2
);
procedure Shortcut_DELETE  (
 aCURSESSION CHAR,
 aShortcutid CHAR,
 ainstanceid char
); 
procedure Shortcut_SAVE (
 aCURSESSION CHAR,
 aShortcutid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aDocItem CHAR/* Документ *//* Документ */
,aStartMode
 VARCHAR2 := null /* Режим *//* Режим */
); 
procedure Shortcut_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Shortcut_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Shortcut_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Shortcut_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Shortcut_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Shortcut_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Shortcut_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end STDInfoStore;

/



