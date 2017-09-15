
/* --MTZSecurity*/

 create or replace package MTZSecurity as

procedure MTZSecurity_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZSecurity_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZSecurity_propagate(acursession CHAR, aROWID CHAR); 


procedure MTZSEC_RIGHT_BRIEF  (
 aCURSESSION CHAR,
 aMTZSEC_RIGHTid CHAR,
 aBRIEF out varchar2
);
procedure MTZSEC_RIGHT_DELETE  (
 aCURSESSION CHAR,
 aMTZSEC_RIGHTid CHAR,
 ainstanceid char
); 
procedure MTZSEC_RIGHT_SAVE (
 aCURSESSION CHAR,
 aMTZSEC_RIGHTid CHAR,
aInstanceID CHAR 
,aPiority
 NUMBER/* Приоритет *//* Приоритет */
,aTheGroup CHAR/* Группа *//* Группа */
,aProtectedItem
 VARCHAR2/* Защищаемый элемент *//* Защищаемый элемент */
,aAllow
 NUMBER/* Разрешение *//* Разрешение */
); 
procedure MTZSEC_RIGHT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure MTZSEC_RIGHT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure MTZSEC_RIGHT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure MTZSEC_RIGHT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure MTZSEC_RIGHT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure MTZSEC_RIGHT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure MTZSEC_RIGHT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZSecurity;

/



