
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
 VARCHAR2/* �������� ����� *//* �������� ����� */
,aInfo VARCHAR2/* ���������� *//* ���������� */
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
 DATE/* ���� *//* ���� */
,aShortName
 VARCHAR2/* ������� �������� *//* ������� �������� */
,aInfo VARCHAR2/* ���������� *//* ���������� */
,aAccept
 NUMBER/* ��������� ���������� *//* ��������� ���������� */
,aAnnotation
 VARCHAR2 := null /* ������� ��������� *//* ������� ��������� */
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
 DATE/* ���� *//* ���� */
,aJobName
 VARCHAR2/* �������� *//* �������� */
,aJobCity
 VARCHAR2 := null /* ����� *//* ����� */
,aJobSex
 NUMBER := null /* ��� *//* ��� */
,aJobAge
 VARCHAR2 := null /* ������� *//* ������� */
,aJobEducation
 NUMBER := null /* ����������� *//* ����������� */
,aJobExperience
 VARCHAR2 := null /* ���� ������ *//* ���� ������ */
,aJobEmployment
 NUMBER := null /* ��������� *//* ��������� */
,aJobCompensation
 VARCHAR2 := null /* �������� *//* �������� */
,aJobDescription
 VARCHAR2/* �������� *//* �������� */
,aJobActual
 NUMBER/* ������������ *//* ������������ */
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
 VARCHAR2/* �������, ���, �������� *//* �������, ���, �������� */
,aMESSAGES_Email
 VARCHAR2/* ����� ����������� ����� *//* ����� ����������� ����� */
,aMESSAGES_TEL
 VARCHAR2 := null /* ������� *//* ������� */
,aMESSAGES_City
 VARCHAR2 := null /* ����� *//* ����� */
,aMESSAGES_Org
 VARCHAR2 := null /* �������� ����������� *//* �������� ����������� */
,aMESSAGES_Position
 VARCHAR2 := null /* �������������/��������� *//* �������������/��������� */
,aMESSAGES_Text
 VARCHAR2/* ��������� *//* ��������� */
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
 NUMBER/* � *//* � */
,aDocsName
 VARCHAR2/* �������� *//* �������� */
,aDocsFileName
 VARCHAR2/* ��� ����� *//* ��� ����� */
,aDocsFileSize
 NUMBER := null /* ������ *//* ������ */
,aDocsFileDate
 DATE := null /* ����  *//* ����  */
,aDocsDescription
 VARCHAR2 := null /* ���������� *//* ���������� */
,aDocsActual
 NUMBER/* ������������ *//* ������������ */
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
 VARCHAR2/* �������� *//* �������� */
,aOfficeCity
 VARCHAR2 := null /* ����� *//* ����� */
,aOfficeAddress
 VARCHAR2/* ����� *//* ����� */
,aOfficeTelefons
 VARCHAR2 := null /* �������� *//* �������� */
,aOfficeSmallImage
 VARCHAR2 := null /* URL �������� �� ������ *//* URL �������� �� ������ */
,aOfficeBigImage
 VARCHAR2 := null /* URL �������� ����������� *//* URL �������� ����������� */
,aOfficeNum
 NUMBER/* � *//* � */
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
 VARCHAR2/* �������� *//* �������� */
,aLinkURL
 VARCHAR2/* ������ *//* ������ */
,aLinkDescription
 VARCHAR2/* �������� *//* �������� */
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



