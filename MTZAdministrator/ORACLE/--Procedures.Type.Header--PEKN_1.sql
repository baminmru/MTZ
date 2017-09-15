
/* --PEKN*/

 create or replace package PEKN as

procedure PEKN_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKN_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKN_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKD_NZONE_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_NZONEid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_NZONE_DELETE  (
 aCURSESSION CHAR,
 aPEKD_NZONEid CHAR,
 ainstanceid char
); 
procedure PEKD_NZONE_SAVE (
 aCURSESSION CHAR,
 aPEKD_NZONEid CHAR,
aInstanceID CHAR 
,aDept CHAR/* Филиал *//* Филиал */
,aTheYear
 NUMBER/* Год *//* Год */
,aTheMonth
 NUMBER/* Месяц *//* Месяц */
,aFromPPOIDX
 NUMBER/* Начиная с *//* Начиная с */
,aToPPOIdx
 NUMBER/* По *//* По */
,aPOIDX
 VARCHAR2/* Индекс отделения *//* Индекс отделения */
); 
procedure PEKD_NZONE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_NZONE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_NZONE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_NZONE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_NZONE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_NZONE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_NZONE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKD_USEDNUM_BRIEF  (
 aCURSESSION CHAR,
 aPEKD_USEDNUMid CHAR,
 aBRIEF out varchar2
);
procedure PEKD_USEDNUM_DELETE  (
 aCURSESSION CHAR,
 aPEKD_USEDNUMid CHAR,
 ainstanceid char
); 
procedure PEKD_USEDNUM_SAVE (
 aCURSESSION CHAR,
 aPEKD_USEDNUMid CHAR,
aInstanceID CHAR 
,aUsedNumber
 NUMBER/* Номер *//* Номер */
); 
procedure PEKD_USEDNUM_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKD_USEDNUM_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKD_USEDNUM_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKD_USEDNUM_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKD_USEDNUM_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKD_USEDNUM_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKD_USEDNUM_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKN;

/



