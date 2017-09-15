
/* --WEBC*/

 create or replace package WEBC as

procedure WEBC_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure WEBC_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure WEBC_propagate(acursession CHAR, aROWID CHAR); 


procedure WEBC_BLOCK_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_BLOCKid CHAR,
 aBRIEF out varchar2
);
procedure WEBC_BLOCK_DELETE  (
 aCURSESSION CHAR,
 aWEBC_BLOCKid CHAR,
 ainstanceid char
); 
procedure WEBC_BLOCK_SAVE (
 aCURSESSION CHAR,
 aWEBC_BLOCKid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* Название блока *//* Название блока */
,aInfo VARCHAR2/* Содержание *//* Содержание */
); 
procedure WEBC_BLOCK_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WEBC_BLOCK_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WEBC_BLOCK_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WEBC_BLOCK_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WEBC_BLOCK_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WEBC_BLOCK_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WEBC_BLOCK_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WEBC_NEWS_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_NEWSid CHAR,
 aBRIEF out varchar2
);
procedure WEBC_NEWS_DELETE  (
 aCURSESSION CHAR,
 aWEBC_NEWSid CHAR,
 ainstanceid char
); 
procedure WEBC_NEWS_SAVE (
 aCURSESSION CHAR,
 aWEBC_NEWSid CHAR,
aInstanceID CHAR 
,aTheDate
 DATE/* Дата *//* Дата */
,aShortName
 VARCHAR2/* Краткое название *//* Краткое название */
,aInfo VARCHAR2/* Содержание *//* Содержание */
,aAccept
 NUMBER/* Разрешена публикация *//* Разрешена публикация */
,aAnnotation
 VARCHAR2 := null /* Краткое сообщение *//* Краткое сообщение */
); 
procedure WEBC_NEWS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WEBC_NEWS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WEBC_NEWS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WEBC_NEWS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WEBC_NEWS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WEBC_NEWS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WEBC_NEWS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WEBC_JOB_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_JOBid CHAR,
 aBRIEF out varchar2
);
procedure WEBC_JOB_DELETE  (
 aCURSESSION CHAR,
 aWEBC_JOBid CHAR,
 ainstanceid char
); 
procedure WEBC_JOB_SAVE (
 aCURSESSION CHAR,
 aWEBC_JOBid CHAR,
aInstanceID CHAR 
,aJobDate
 DATE/* Дата *//* Дата */
,aJobName
 VARCHAR2/* Название *//* Название */
,aJobCity
 VARCHAR2 := null /* Город *//* Город */
,aJobSex
 NUMBER := null /* Пол *//* Пол */
,aJobAge
 VARCHAR2 := null /* Возраст *//* Возраст */
,aJobEducation
 NUMBER := null /* Образование *//* Образование */
,aJobExperience
 VARCHAR2 := null /* Опыт работы *//* Опыт работы */
,aJobEmployment
 NUMBER := null /* Занятость *//* Занятость */
,aJobCompensation
 VARCHAR2 := null /* Зарплата *//* Зарплата */
,aJobDescription
 VARCHAR2/* Описание *//* Описание */
,aJobActual
 NUMBER/* Актуальность *//* Актуальность */
); 
procedure WEBC_JOB_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WEBC_JOB_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WEBC_JOB_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WEBC_JOB_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WEBC_JOB_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WEBC_JOB_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WEBC_JOB_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WEBC_MESSAGES_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_MESSAGESid CHAR,
 aBRIEF out varchar2
);
procedure WEBC_MESSAGES_DELETE  (
 aCURSESSION CHAR,
 aWEBC_MESSAGESid CHAR,
 ainstanceid char
); 
procedure WEBC_MESSAGES_SAVE (
 aCURSESSION CHAR,
 aWEBC_MESSAGESid CHAR,
aInstanceID CHAR 
,aMESSAGES_FIO
 VARCHAR2/* Фамилия, имя, отчество *//* Фамилия, имя, отчество */
,aMESSAGES_Email
 VARCHAR2/* Адрес электронной почты *//* Адрес электронной почты */
,aMESSAGES_TEL
 VARCHAR2 := null /* Телефон *//* Телефон */
,aMESSAGES_City
 VARCHAR2 := null /* Город *//* Город */
,aMESSAGES_Org
 VARCHAR2 := null /* Название организации *//* Название организации */
,aMESSAGES_Position
 VARCHAR2 := null /* Специальность/должность *//* Специальность/должность */
,aMESSAGES_Text
 VARCHAR2/* Сообщение *//* Сообщение */
); 
procedure WEBC_MESSAGES_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WEBC_MESSAGES_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WEBC_MESSAGES_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WEBC_MESSAGES_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WEBC_MESSAGES_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WEBC_MESSAGES_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WEBC_MESSAGES_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WEBC_DOCS_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_DOCSid CHAR,
 aBRIEF out varchar2
);
procedure WEBC_DOCS_DELETE  (
 aCURSESSION CHAR,
 aWEBC_DOCSid CHAR,
 ainstanceid char
); 
procedure WEBC_DOCS_SAVE (
 aCURSESSION CHAR,
 aWEBC_DOCSid CHAR,
aInstanceID CHAR 
,aDocsNum
 NUMBER/* № *//* № */
,aDocsName
 VARCHAR2/* Название *//* Название */
,aDocsFileName
 VARCHAR2/* Имя файла *//* Имя файла */
,aDocsFileSize
 NUMBER := null /* Размер *//* Размер */
,aDocsFileDate
 DATE := null /* Дата  *//* Дата  */
,aDocsDescription
 VARCHAR2 := null /* Примечания *//* Примечания */
,aDocsActual
 NUMBER/* Актуальность *//* Актуальность */
); 
procedure WEBC_DOCS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WEBC_DOCS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WEBC_DOCS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WEBC_DOCS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WEBC_DOCS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WEBC_DOCS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WEBC_DOCS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WEBC_FILIALS_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_FILIALSid CHAR,
 aBRIEF out varchar2
);
procedure WEBC_FILIALS_DELETE  (
 aCURSESSION CHAR,
 aWEBC_FILIALSid CHAR,
 ainstanceid char
); 
procedure WEBC_FILIALS_SAVE (
 aCURSESSION CHAR,
 aWEBC_FILIALSid CHAR,
aInstanceID CHAR 
,aOfficeName
 VARCHAR2/* Название *//* Название */
,aOfficeCity
 VARCHAR2 := null /* Город *//* Город */
,aOfficeAddress
 VARCHAR2/* Адрес *//* Адрес */
,aOfficeTelefons
 VARCHAR2 := null /* Телефоны *//* Телефоны */
,aOfficeSmallImage
 VARCHAR2 := null /* URL картинки со схемой *//* URL картинки со схемой */
,aOfficeBigImage
 VARCHAR2 := null /* URL картинки увеличенной *//* URL картинки увеличенной */
,aOfficeNum
 NUMBER/* № *//* № */
); 
procedure WEBC_FILIALS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WEBC_FILIALS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WEBC_FILIALS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WEBC_FILIALS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WEBC_FILIALS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WEBC_FILIALS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WEBC_FILIALS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WEBC_LINKS_BRIEF  (
 aCURSESSION CHAR,
 aWEBC_LINKSid CHAR,
 aBRIEF out varchar2
);
procedure WEBC_LINKS_DELETE  (
 aCURSESSION CHAR,
 aWEBC_LINKSid CHAR,
 ainstanceid char
); 
procedure WEBC_LINKS_SAVE (
 aCURSESSION CHAR,
 aWEBC_LINKSid CHAR,
aInstanceID CHAR 
,aLinkName
 VARCHAR2/* Название *//* Название */
,aLinkURL
 VARCHAR2/* Ссылка *//* Ссылка */
,aLinkDescription
 VARCHAR2/* Описание *//* Описание */
); 
procedure WEBC_LINKS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WEBC_LINKS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WEBC_LINKS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WEBC_LINKS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WEBC_LINKS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WEBC_LINKS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WEBC_LINKS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end WEBC;

/



