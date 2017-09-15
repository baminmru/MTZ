
/* --PEKSH*/

 create or replace package PEKSH as

procedure PEKSH_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure PEKSH_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure PEKSH_propagate(acursession CHAR, aROWID CHAR); 


procedure PEKSH_DATA_BRIEF  (
 aCURSESSION CHAR,
 aPEKSH_DATAid CHAR,
 aBRIEF out varchar2
);
procedure PEKSH_DATA_DELETE  (
 aCURSESSION CHAR,
 aPEKSH_DATAid CHAR,
 ainstanceid char
); 
procedure PEKSH_DATA_SAVE (
 aCURSESSION CHAR,
 aPEKSH_DATAid CHAR,
aInstanceID CHAR 
,aTrain CHAR/* Поезд *//* Поезд */
,aStartTime
 DATE := null /* Время отправления *//* Время отправления */
,aDuration
 NUMBER := null /* Время доставки *//* Время доставки */
); 
procedure PEKSH_DATA_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKSH_DATA_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKSH_DATA_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKSH_DATA_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKSH_DATA_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKSH_DATA_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKSH_DATA_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKSH_START_BRIEF  (
 aCURSESSION CHAR,
 aPEKSH_STARTid CHAR,
 aBRIEF out varchar2
);
procedure PEKSH_START_DELETE  (
 aCURSESSION CHAR,
 aPEKSH_STARTid CHAR,
 ainstanceid char
); 
procedure PEKSH_START_SAVE (
 aCURSESSION CHAR,
 aPEKSH_STARTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aDayInYear
 NUMBER/* Номер дня в году *//* Номер дня в году */
,aStartTime
 DATE := null /* Время отправления *//* Время отправления */
); 
procedure PEKSH_START_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKSH_START_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKSH_START_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKSH_START_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKSH_START_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKSH_START_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKSH_START_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PEKSH_DEF_BRIEF  (
 aCURSESSION CHAR,
 aPEKSH_DEFid CHAR,
 aBRIEF out varchar2
);
procedure PEKSH_DEF_DELETE  (
 aCURSESSION CHAR,
 aPEKSH_DEFid CHAR,
 ainstanceid char
); 
procedure PEKSH_DEF_SAVE (
 aCURSESSION CHAR,
 aPEKSH_DEFid CHAR,
aInstanceID CHAR 
,aDIRECTION CHAR/* Направление *//* Направление */
,aTheYear
 NUMBER/* Год *//* Год */
); 
procedure PEKSH_DEF_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PEKSH_DEF_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PEKSH_DEF_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PEKSH_DEF_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PEKSH_DEF_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PEKSH_DEF_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PEKSH_DEF_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end PEKSH;

/



