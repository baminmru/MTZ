
/* --STDNumerator*/

 create or replace package STDNumerator as

procedure STDNumerator_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure STDNumerator_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure STDNumerator_propagate(acursession CHAR, aROWID CHAR); 


procedure Num_zones_BRIEF  (
 aCURSESSION CHAR,
 aNum_zonesid CHAR,
 aBRIEF out varchar2
);
procedure Num_zones_DELETE  (
 aCURSESSION CHAR,
 aNum_zonesid CHAR,
 ainstanceid char
); 
procedure Num_zones_SAVE (
 aCURSESSION CHAR,
 aNum_zonesid CHAR,
aInstanceID CHAR 
,aZoneMask
 VARCHAR2/* Маска зоны *//* Маска зоны */
); 
procedure Num_zones_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Num_zones_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Num_zones_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Num_zones_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Num_zones_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Num_zones_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Num_zones_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure Num_Values_BRIEF  (
 aCURSESSION CHAR,
 aNum_Valuesid CHAR,
 aBRIEF out varchar2
);
procedure Num_Values_DELETE  (
 aCURSESSION CHAR,
 aNum_Valuesid CHAR,
 ainstanceid char
); 
procedure Num_Values_SAVE (
 aCURSESSION CHAR,
 aNum_Valuesid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,athe_Value
 NUMBER/* Значение *//* Значение */
,aOwnerPartName
 VARCHAR2 := null /* Раздел *//* Раздел */
,aOwnerRowID CHAR := null /* Идентификатор строки *//* Идентификатор строки */
); 
procedure Num_Values_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Num_Values_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Num_Values_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Num_Values_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Num_Values_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Num_Values_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Num_Values_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure Num_head_BRIEF  (
 aCURSESSION CHAR,
 aNum_headid CHAR,
 aBRIEF out varchar2
);
procedure Num_head_DELETE  (
 aCURSESSION CHAR,
 aNum_headid CHAR,
 ainstanceid char
); 
procedure Num_head_SAVE (
 aCURSESSION CHAR,
 aNum_headid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aShema
 NUMBER/* Схема нумерации *//* Схема нумерации */
); 
procedure Num_head_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Num_head_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Num_head_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Num_head_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Num_head_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Num_head_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Num_head_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end STDNumerator;

/



