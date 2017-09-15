
/* --VRCAT*/

 create or replace package VRCAT as

procedure VRCAT_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure VRCAT_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure VRCAT_propagate(acursession CHAR, aROWID CHAR); 


procedure VRCATCatalog_BRIEF  (
 aCURSESSION CHAR,
 aVRCATCatalogid CHAR,
 aBRIEF out varchar2
);
procedure VRCATCatalog_DELETE  (
 aCURSESSION CHAR,
 aVRCATCatalogid CHAR,
 ainstanceid char
); 
procedure VRCATCatalog_SAVE (
 aCURSESSION CHAR,
 aVRCATCatalogid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aName
 VARCHAR2 := null /* Название *//* Название */
,aMarket CHAR := null /* Рынок *//* Рынок */
,aAccessLevel CHAR := null /* Доступ *//* Доступ */
); 
procedure VRCATCatalog_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCATCatalog_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCATCatalog_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCATCatalog_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCATCatalog_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCATCatalog_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCATCatalog_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRCATClients_BRIEF  (
 aCURSESSION CHAR,
 aVRCATClientsid CHAR,
 aBRIEF out varchar2
);
procedure VRCATClients_DELETE  (
 aCURSESSION CHAR,
 aVRCATClientsid CHAR,
 ainstanceid char
); 
procedure VRCATClients_SAVE (
 aCURSESSION CHAR,
 aVRCATClientsid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aClient CHAR/* Клиент *//* Клиент */
,aInterest CHAR := null /* Заинтересованность *//* Заинтересованность */
); 
procedure VRCATClients_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRCATClients_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRCATClients_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRCATClients_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRCATClients_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRCATClients_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRCATClients_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end VRCAT;

/



