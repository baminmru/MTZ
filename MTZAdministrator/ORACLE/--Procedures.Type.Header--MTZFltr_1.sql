
/* --MTZFltr*/

 create or replace package MTZFltr as

procedure MTZFltr_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZFltr_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZFltr_propagate(acursession CHAR, aROWID CHAR); 


procedure FilterFieldGroup_BRIEF  (
 aCURSESSION CHAR,
 aFilterFieldGroupid CHAR,
 aBRIEF out varchar2
);
procedure FilterFieldGroup_DELETE  (
 aCURSESSION CHAR,
 aFilterFieldGroupid CHAR,
 ainstanceid char
); 
procedure FilterFieldGroup_SAVE (
 aCURSESSION CHAR,
 aFilterFieldGroupid CHAR,
aInstanceID CHAR 
,asequence
 NUMBER/* ������������������ *//* ������������������ */
,aName
 VARCHAR2/* �������� *//* �������� */
,aCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aAllowIgnore
 NUMBER/* ����� ��������� *//* ����� ��������� */
); 
procedure FilterFieldGroup_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FilterFieldGroup_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FilterFieldGroup_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FilterFieldGroup_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FilterFieldGroup_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FilterFieldGroup_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FilterFieldGroup_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FileterField_BRIEF  (
 aCURSESSION CHAR,
 aFileterFieldid CHAR,
 aBRIEF out varchar2
);
procedure FileterField_DELETE  (
 aCURSESSION CHAR,
 aFileterFieldid CHAR,
 ainstanceid char
); 
procedure FileterField_SAVE (
 aCURSESSION CHAR,
 aFileterFieldid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,asequence
 NUMBER/* ������������������ *//* ������������������ */
,aName
 VARCHAR2/* �������� *//* �������� */
,aCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aFieldType CHAR/* ��� ���� *//* ��� ���� */
,aFieldSize
 NUMBER := null /* ������ *//* ������ */
,aRefType
 NUMBER := null /* ��� ������ *//* ��� ������ */
,aRefToType CHAR := null /* ���, ���� ��������� *//* ���, ���� ��������� */
,aRefToPart CHAR := null /* ������, ���� ��������� *//* ������, ���� ��������� */
,aValueArray
 NUMBER := null /* ������ �������� *//* ������ �������� */
); 
procedure FileterField_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FileterField_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FileterField_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FileterField_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FileterField_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FileterField_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FileterField_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure Filters_BRIEF  (
 aCURSESSION CHAR,
 aFiltersid CHAR,
 aBRIEF out varchar2
);
procedure Filters_DELETE  (
 aCURSESSION CHAR,
 aFiltersid CHAR,
 ainstanceid char
); 
procedure Filters_SAVE (
 aCURSESSION CHAR,
 aFiltersid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aTheCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
); 
procedure Filters_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure Filters_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure Filters_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure Filters_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure Filters_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure Filters_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure Filters_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZFltr;

/



