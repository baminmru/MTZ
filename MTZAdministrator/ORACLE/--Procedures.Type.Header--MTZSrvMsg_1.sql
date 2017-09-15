
/* --MTZSrvMsg*/

 create or replace package MTZSrvMsg as

procedure MTZSrvMsg_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZSrvMsg_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZSrvMsg_propagate(acursession CHAR, aROWID CHAR); 


procedure SrvMessageInfo_BRIEF  (
 aCURSESSION CHAR,
 aSrvMessageInfoid CHAR,
 aBRIEF out varchar2
);
procedure SrvMessageInfo_DELETE  (
 aCURSESSION CHAR,
 aSrvMessageInfoid CHAR,
 ainstanceid char
); 
procedure SrvMessageInfo_SAVE (
 aCURSESSION CHAR,
 aSrvMessageInfoid CHAR,
aInstanceID CHAR 
,aForUser CHAR/* Для пользователя *//* Для пользователя */
,amsgDate
 DATE/* Дата *//* Дата */
,aMsgInfo VARCHAR2/* Текст сообщения *//* Текст сообщения */
,aTheDocument CHAR := null /* Документ *//* Документ */
,aReadTime
 DATE := null /* Время прочтения *//* Время прочтения */
); 
procedure SrvMessageInfo_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure SrvMessageInfo_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure SrvMessageInfo_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure SrvMessageInfo_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure SrvMessageInfo_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure SrvMessageInfo_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure SrvMessageInfo_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZSrvMsg;

/



