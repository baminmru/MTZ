
/* --MTZUsers*/

 create or replace package MTZUsers as

procedure MTZUsers_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZUsers_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZUsers_propagate(acursession CHAR, aROWID CHAR); 


procedure Users_BRIEF  (
 aCURSESSION CHAR,
 aUsersid CHAR,
 aBRIEF out varchar2
);
procedure Users_DELETE  (
 aCURSESSION CHAR,
 aUsersid CHAR,
 ainstanceid char
); 
procedure Users_SAVE (
 aCURSESSION CHAR,
 aUsersid CHAR,
aInstanceID CHAR 
,aFamily
 VARCHAR2 := null /* ������� *//* ������� */
,aName
 VARCHAR2 := null /* ��� *//* ��� */
,aSurName
 VARCHAR2 := null /* �������� *//* �������� */
,aLogin
 VARCHAR2/* ��� ��� ����� *//* ��� ��� ����� */
,aPassword VARCHAR2 := null /* ������ *//* ������ */
,aDomaiName
 VARCHAR2 := null /* �������� ��� *//* �������� ��� */
,aEMail VARCHAR2 := null /* e-mail *//* e-mail */
,aPhone
 VARCHAR2 := null /* ������� *//* ������� */
,aLocalPhone
 VARCHAR2 := null /* ������� ������� *//* ������� ������� */
,aMobilePhone
 VARCHAR2 := null /* ��������� ������� *//* ��������� ������� */
,aPhoto VARCHAR2 := null /* ���� *//* ���� */
,aBirthDay
 DATE := null /* ���� �������� *//* ���� �������� */
,aActivity CHAR := null /* ������ ���������� *//* ������ ���������� */
,aCertificateID
 VARCHAR2 := null /* CertificateID *//* CertificateID */
,aCertData VARCHAR2 := null /* CertData *//* CertData */
,aClientDef CHAR := null /* ���������� � �������� *//* ���������� � �������� */
,aPersonaData CHAR := null /* PersonaData *//* PersonaData */
); 
procedure Users_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Users_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Users_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Users_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Users_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Users_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Users_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure Groups_BRIEF  (
 aCURSESSION CHAR,
 aGroupsid CHAR,
 aBRIEF out varchar2
);
procedure Groups_DELETE  (
 aCURSESSION CHAR,
 aGroupsid CHAR,
 ainstanceid char
); 
procedure Groups_SAVE (
 aCURSESSION CHAR,
 aGroupsid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
); 
procedure Groups_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Groups_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Groups_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Groups_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Groups_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Groups_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Groups_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GroupUser_BRIEF  (
 aCURSESSION CHAR,
 aGroupUserid CHAR,
 aBRIEF out varchar2
);
procedure GroupUser_DELETE  (
 aCURSESSION CHAR,
 aGroupUserid CHAR,
 ainstanceid char
); 
procedure GroupUser_SAVE (
 aCURSESSION CHAR,
 aGroupUserid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheUser CHAR/* ������������ *//* ������������ */
); 
procedure GroupUser_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GroupUser_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GroupUser_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GroupUser_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GroupUser_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GroupUser_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GroupUser_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZUsers;

/



