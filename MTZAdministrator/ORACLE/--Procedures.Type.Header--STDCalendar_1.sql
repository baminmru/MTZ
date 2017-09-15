
/* --STDCalendar*/

 create or replace package STDCalendar as

procedure STDCalendar_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure STDCalendar_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure STDCalendar_propagate(acursession CHAR, aROWID CHAR); 


procedure CAL_DAYS_BRIEF  (
 aCURSESSION CHAR,
 aCAL_DAYSid CHAR,
 aBRIEF out varchar2
);
procedure CAL_DAYS_DELETE  (
 aCURSESSION CHAR,
 aCAL_DAYSid CHAR,
 ainstanceid char
); 
procedure CAL_DAYS_SAVE (
 aCURSESSION CHAR,
 aCAL_DAYSid CHAR,
aInstanceID CHAR 
,aTheDate
 DATE/* Дата *//* Дата */
,aIsHoliday
 NUMBER/* Выходной *//* Выходной */
); 
procedure CAL_DAYS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure CAL_DAYS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure CAL_DAYS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure CAL_DAYS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure CAL_DAYS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure CAL_DAYS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure CAL_DAYS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure CAL_TIME_BRIEF  (
 aCURSESSION CHAR,
 aCAL_TIMEid CHAR,
 aBRIEF out varchar2
);
procedure CAL_TIME_DELETE  (
 aCURSESSION CHAR,
 aCAL_TIMEid CHAR,
 ainstanceid char
); 
procedure CAL_TIME_SAVE (
 aCURSESSION CHAR,
 aCAL_TIMEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aFromTime
 DATE/* Начало периода *//* Начало периода */
,aToTime
 DATE/* Конец периода *//* Конец периода */
); 
procedure CAL_TIME_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure CAL_TIME_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure CAL_TIME_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure CAL_TIME_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure CAL_TIME_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure CAL_TIME_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure CAL_TIME_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure CAL_HEAD_BRIEF  (
 aCURSESSION CHAR,
 aCAL_HEADid CHAR,
 aBRIEF out varchar2
);
procedure CAL_HEAD_DELETE  (
 aCURSESSION CHAR,
 aCAL_HEADid CHAR,
 ainstanceid char
); 
procedure CAL_HEAD_SAVE (
 aCURSESSION CHAR,
 aCAL_HEADid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
,aFillStyle
 VARCHAR2 := null /* Вариант заполнения *//* Вариант заполнения */
); 
procedure CAL_HEAD_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure CAL_HEAD_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure CAL_HEAD_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure CAL_HEAD_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure CAL_HEAD_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure CAL_HEAD_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure CAL_HEAD_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end STDCalendar;

/



