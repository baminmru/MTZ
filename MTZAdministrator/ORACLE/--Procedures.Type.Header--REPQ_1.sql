
/* --REPQ*/

 create or replace package REPQ as

procedure REPQ_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure REPQ_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure REPQ_propagate(acursession CHAR, aROWID CHAR); 


procedure REPQ_RCV_BRIEF  (
 aCURSESSION CHAR,
 aREPQ_RCVid CHAR,
 aBRIEF out varchar2
);
procedure REPQ_RCV_DELETE  (
 aCURSESSION CHAR,
 aREPQ_RCVid CHAR,
 ainstanceid char
); 
procedure REPQ_RCV_SAVE (
 aCURSESSION CHAR,
 aREPQ_RCVid CHAR,
aInstanceID CHAR 
,aPEKF CHAR/* Филиал *//* Филиал */
,aIDX
 NUMBER/* Индекс *//* Индекс */
,aDATA VARCHAR2/* Данные *//* Данные */
); 
procedure REPQ_RCV_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPQ_RCV_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPQ_RCV_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPQ_RCV_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPQ_RCV_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPQ_RCV_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPQ_RCV_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure REPQ_SND_BRIEF  (
 aCURSESSION CHAR,
 aREPQ_SNDid CHAR,
 aBRIEF out varchar2
);
procedure REPQ_SND_DELETE  (
 aCURSESSION CHAR,
 aREPQ_SNDid CHAR,
 ainstanceid char
); 
procedure REPQ_SND_SAVE (
 aCURSESSION CHAR,
 aREPQ_SNDid CHAR,
aInstanceID CHAR 
,aPEKF CHAR/* Филиал *//* Филиал */
,aIDX
 NUMBER/* Индекс *//* Индекс */
,aDATA VARCHAR2/* Данные *//* Данные */
,aACCEPTED
 NUMBER/* ACCEPTED *//* ACCEPTED */
); 
procedure REPQ_SND_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPQ_SND_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPQ_SND_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPQ_SND_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPQ_SND_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPQ_SND_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPQ_SND_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure REPQ_DATA_BRIEF  (
 aCURSESSION CHAR,
 aREPQ_DATAid CHAR,
 aBRIEF out varchar2
);
procedure REPQ_DATA_DELETE  (
 aCURSESSION CHAR,
 aREPQ_DATAid CHAR,
 ainstanceid char
); 
procedure REPQ_DATA_SAVE (
 aCURSESSION CHAR,
 aREPQ_DATAid CHAR,
aInstanceID CHAR 
,aData VARCHAR2/* Data *//* Data */
); 
procedure REPQ_DATA_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPQ_DATA_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPQ_DATA_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPQ_DATA_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPQ_DATA_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPQ_DATA_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPQ_DATA_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end REPQ;

/



