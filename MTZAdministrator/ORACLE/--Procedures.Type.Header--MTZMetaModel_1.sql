
/* --MTZMetaModel*/

 create or replace package MTZMetaModel as

procedure MTZMetaModel_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MTZMetaModel_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MTZMetaModel_propagate(acursession CHAR, aROWID CHAR); 


procedure FIELDTYPE_BRIEF  (
 aCURSESSION CHAR,
 aFIELDTYPEid CHAR,
 aBRIEF out varchar2
);
procedure FIELDTYPE_DELETE  (
 aCURSESSION CHAR,
 aFIELDTYPEid CHAR,
 ainstanceid char
); 
procedure FIELDTYPE_SAVE (
 aCURSESSION CHAR,
 aFIELDTYPEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aTypeStyle
 NUMBER/* ��������� *//* ��������� */
,athe_Comment VARCHAR2 := null /* �������� *//* �������� */
,aAllowSize
 NUMBER/* ����� ������ *//* ����� ������ */
,aMinimum
 VARCHAR2 := null /* ������� *//* ������� */
,aMaximum
 VARCHAR2 := null /* �������� *//* �������� */
,aAllowLikeSearch
 NUMBER := null /* ����� ������ *//* ����� ������ */
,aGridSortType
 NUMBER := null /* ������� ���������� � ��������� ������������� *//* ������� ���������� � ��������� ������������� */
); 
procedure FIELDTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDTYPEMAP_BRIEF  (
 aCURSESSION CHAR,
 aFIELDTYPEMAPid CHAR,
 aBRIEF out varchar2
);
procedure FIELDTYPEMAP_DELETE  (
 aCURSESSION CHAR,
 aFIELDTYPEMAPid CHAR,
 ainstanceid char
); 
procedure FIELDTYPEMAP_SAVE (
 aCURSESSION CHAR,
 aFIELDTYPEMAPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR/* ��������� *//* ��������� */
,aStoageType
 VARCHAR2/* ��� �������� *//* ��� �������� */
,aFixedSize
 NUMBER := null /* ������ *//* ������ */
); 
procedure FIELDTYPEMAP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDTYPEMAP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDTYPEMAP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDTYPEMAP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDTYPEMAP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDTYPEMAP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDTYPEMAP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ENUMITEM_BRIEF  (
 aCURSESSION CHAR,
 aENUMITEMid CHAR,
 aBRIEF out varchar2
);
procedure ENUMITEM_DELETE  (
 aCURSESSION CHAR,
 aENUMITEMid CHAR,
 ainstanceid char
); 
procedure ENUMITEM_SAVE (
 aCURSESSION CHAR,
 aENUMITEMid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aNameValue
 NUMBER/* �������� *//* �������� */
,aNameInCode
 VARCHAR2 := null /* �������� � ���� *//* �������� � ���� */
); 
procedure ENUMITEM_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ENUMITEM_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ENUMITEM_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ENUMITEM_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ENUMITEM_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ENUMITEM_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ENUMITEM_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure SHAREDMETHOD_BRIEF  (
 aCURSESSION CHAR,
 aSHAREDMETHODid CHAR,
 aBRIEF out varchar2
);
procedure SHAREDMETHOD_DELETE  (
 aCURSESSION CHAR,
 aSHAREDMETHODid CHAR,
 ainstanceid char
); 
procedure SHAREDMETHOD_SAVE (
 aCURSESSION CHAR,
 aSHAREDMETHODid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,athe_Comment VARCHAR2 := null /* �������� ������ *//* �������� ������ */
,aReturnType CHAR := null /* ������������ ��� *//* ������������ ��� */
); 
procedure SHAREDMETHOD_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure SHAREDMETHOD_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure SHAREDMETHOD_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure SHAREDMETHOD_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure SHAREDMETHOD_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure SHAREDMETHOD_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure SHAREDMETHOD_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure SCRIPT_BRIEF  (
 aCURSESSION CHAR,
 aSCRIPTid CHAR,
 aBRIEF out varchar2
);
procedure SCRIPT_DELETE  (
 aCURSESSION CHAR,
 aSCRIPTid CHAR,
 ainstanceid char
); 
procedure SCRIPT_SAVE (
 aCURSESSION CHAR,
 aSCRIPTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ������� ��������� *//* ������� ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
); 
procedure SCRIPT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure SCRIPT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure SCRIPT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure SCRIPT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure SCRIPT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure SCRIPT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure SCRIPT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PARAMETERS_BRIEF  (
 aCURSESSION CHAR,
 aPARAMETERSid CHAR,
 aBRIEF out varchar2
);
procedure PARAMETERS_DELETE  (
 aCURSESSION CHAR,
 aPARAMETERSid CHAR,
 ainstanceid char
); 
procedure PARAMETERS_SAVE (
 aCURSESSION CHAR,
 aPARAMETERSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,asequence
 NUMBER/* ������������������ *//* ������������������ */
,aName
 VARCHAR2/* ��� *//* ��� */
,aCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aTypeOfParm CHAR/* ��� ������ *//* ��� ������ */
,aDataSize
 NUMBER := null /* ������ *//* ������ */
,aAllowNull
 NUMBER/* ����� �� �������� *//* ����� �� �������� */
,aOutParam
 NUMBER/* ���������� �������� *//* ���������� �������� */
,aReferenceType
 NUMBER/* ��� ������ *//* ��� ������ */
,aRefToType CHAR := null /* ������ �� ��� *//* ������ �� ��� */
,aRefToPart CHAR := null /* ������ �� ������ *//* ������ �� ������ */
); 
procedure PARAMETERS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PARAMETERS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PARAMETERS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PARAMETERS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PARAMETERS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PARAMETERS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PARAMETERS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure OBJECTTYPE_BRIEF  (
 aCURSESSION CHAR,
 aOBJECTTYPEid CHAR,
 aBRIEF out varchar2
);
procedure OBJECTTYPE_DELETE  (
 aCURSESSION CHAR,
 aOBJECTTYPEid CHAR,
 ainstanceid char
); 
procedure OBJECTTYPE_SAVE (
 aCURSESSION CHAR,
 aOBJECTTYPEid CHAR,
aInstanceID CHAR 
,aPackage CHAR/* ���������� *//* ���������� */
,athe_Comment
 VARCHAR2 := null /* �������� *//* �������� */
,aName
 VARCHAR2/* ��� *//* ��� */
,aIsSingleInstance
 NUMBER/* ����������� ������ ���� ������ *//* ����������� ������ ���� ������ */
,aChooseView CHAR := null /* ������������� ��� ������ *//* ������������� ��� ������ */
,aOnRun CHAR := null /* ��� ������� *//* ��� ������� */
,aOnCreate CHAR := null /* ��� �������� *//* ��� �������� */
,aOnDelete CHAR := null /* ��� �������� *//* ��� �������� */
,aAllowRefToObject
 NUMBER := null /* ���������� ��� ������ ������ *//* ���������� ��� ������ ������ */
,aAllowSearch
 NUMBER := null /* ���������� ��� ������ *//* ���������� ��� ������ */
,aReplicaType
 NUMBER := null /* ��� ���������� *//* ��� ���������� */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
); 
procedure OBJECTTYPE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure OBJECTTYPE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure OBJECTTYPE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure OBJECTTYPE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure OBJECTTYPE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure OBJECTTYPE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure OBJECTTYPE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PART_BRIEF  (
 aCURSESSION CHAR,
 aPARTid CHAR,
 aBRIEF out varchar2
);
procedure PART_DELETE  (
 aCURSESSION CHAR,
 aPARTid CHAR,
 ainstanceid char
); 
procedure PART_SAVE (
 aCURSESSION CHAR,
 aPARTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
, aParentRowid CHAR :=null
,aSequence
 NUMBER/* � �/� *//* � �/� */
,aPartType
 NUMBER/* ��� ��������  *//* ��� ��������  */
,aCaption
 VARCHAR2/* ��������� *//* ��������� */
,aName
 VARCHAR2/* �������� *//* �������� */
,athe_Comment VARCHAR2 := null /* �������� *//* �������� */
,aNoLog
 NUMBER/* �� ���������� � ������ *//* �� ���������� � ������ */
,aManualRegister
 NUMBER/* ��������� �� �������������� *//* ��������� �� �������������� */
,aOnCreate CHAR := null /* ��� �������� *//* ��� �������� */
,aOnSave CHAR := null /* ��� ���������� *//* ��� ���������� */
,aOnRun CHAR := null /* ��� �������� *//* ��� �������� */
,aOnDelete CHAR := null /* ��� �������� *//* ��� �������� */
,aAddBehaivor
 NUMBER := null /* ��������� ��� ���������� *//* ��������� ��� ���������� */
); 
procedure PART_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PART_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PART_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PART_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PART_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PART_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PART_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PARTMENU_BRIEF  (
 aCURSESSION CHAR,
 aPARTMENUid CHAR,
 aBRIEF out varchar2
);
procedure PARTMENU_DELETE  (
 aCURSESSION CHAR,
 aPARTMENUid CHAR,
 ainstanceid char
); 
procedure PARTMENU_SAVE (
 aCURSESSION CHAR,
 aPARTMENUid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aToolTip
 VARCHAR2 := null /* ��������� *//* ��������� */
,athe_Action CHAR := null /* ����� *//* ����� */
,aIsMenuItem
 NUMBER := null /* �������� � ���� *//* �������� � ���� */
,aIsToolBarButton
 NUMBER := null /* � ������ *//* � ������ */
,aHotKey
 VARCHAR2 := null /* ������� ������� *//* ������� ������� */
); 
procedure PARTMENU_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PARTMENU_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PARTMENU_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PARTMENU_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PARTMENU_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PARTMENU_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PARTMENU_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PARTPARAMMAP_BRIEF  (
 aCURSESSION CHAR,
 aPARTPARAMMAPid CHAR,
 aBRIEF out varchar2
);
procedure PARTPARAMMAP_DELETE  (
 aCURSESSION CHAR,
 aPARTPARAMMAPid CHAR,
 ainstanceid char
); 
procedure PARTPARAMMAP_SAVE (
 aCURSESSION CHAR,
 aPARTPARAMMAPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aFieldName
 VARCHAR2/* ���� (��������) *//* ���� (��������) */
,aParamName
 VARCHAR2/* �������� *//* �������� */
,aNoEdit
 NUMBER/* ������������� �������� ������ *//* ������������� �������� ������ */
); 
procedure PARTPARAMMAP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PARTPARAMMAP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PARTPARAMMAP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PARTPARAMMAP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PARTPARAMMAP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PARTPARAMMAP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PARTPARAMMAP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELD_BRIEF  (
 aCURSESSION CHAR,
 aFIELDid CHAR,
 aBRIEF out varchar2
);
procedure FIELD_DELETE  (
 aCURSESSION CHAR,
 aFIELDid CHAR,
 ainstanceid char
); 
procedure FIELD_SAVE (
 aCURSESSION CHAR,
 aFIELDid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aSequence
 NUMBER/* � �/� *//* � �/� */
,aCaption
 VARCHAR2/* ������� *//* ������� */
,aName
 VARCHAR2/* ��� ���� *//* ��� ���� */
,aFieldType CHAR/* ��� ���� *//* ��� ���� */
,aIsBrief
 NUMBER/* ������� ���������� *//* ������� ���������� */
,aAllowNull
 NUMBER/* ����� ���� ������ *//* ����� ���� ������ */
,aDataSize
 NUMBER := null /* ������ ���� *//* ������ ���� */
,aReferenceType
 NUMBER/* ��� ������ *//* ��� ������ */
,aRefToType CHAR := null /* ������ �� ��� *//* ������ �� ��� */
,aRefToPart CHAR := null /* ������ �� ������ *//* ������ �� ������ */
,aInternalReference
 NUMBER := null /* ������ � �������� ������� *//* ������ � �������� ������� */
,aCreateRefOnly
 NUMBER := null /* ������ �������� ������� *//* ������ �������� ������� */
,aIsAutoNumber
 NUMBER := null /* ������������� *//* ������������� */
,aTheNumerator CHAR := null /* ��������� *//* ��������� */
,aZoneTemplate
 VARCHAR2 := null /* ������ ���� ��������� *//* ������ ���� ��������� */
,aNumberDateField CHAR := null /* ���� ��� ������� ���� *//* ���� ��� ������� ���� */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
); 
procedure FIELD_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELD_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELD_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELD_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELD_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELD_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELD_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDVALIDATOR_BRIEF  (
 aCURSESSION CHAR,
 aFIELDVALIDATORid CHAR,
 aBRIEF out varchar2
);
procedure FIELDVALIDATOR_DELETE  (
 aCURSESSION CHAR,
 aFIELDVALIDATORid CHAR,
 ainstanceid char
); 
procedure FIELDVALIDATOR_SAVE (
 aCURSESSION CHAR,
 aFIELDVALIDATORid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ��������� *//* ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
); 
procedure FIELDVALIDATOR_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDVALIDATOR_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDVALIDATOR_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDVALIDATOR_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDVALIDATOR_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDVALIDATOR_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDVALIDATOR_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDMENU_BRIEF  (
 aCURSESSION CHAR,
 aFIELDMENUid CHAR,
 aBRIEF out varchar2
);
procedure FIELDMENU_DELETE  (
 aCURSESSION CHAR,
 aFIELDMENUid CHAR,
 ainstanceid char
); 
procedure FIELDMENU_SAVE (
 aCURSESSION CHAR,
 aFIELDMENUid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aToolTip
 VARCHAR2 := null /* ��������� *//* ��������� */
,aActionID CHAR/* ������������� ����������� ������ *//* ������������� ����������� ������ */
,aIsMenuItem
 NUMBER := null /* � ���� *//* � ���� */
,aIsToolBarButton
 NUMBER := null /* � ������ *//* � ������ */
,aHotKey
 VARCHAR2 := null /* ������� ������� *//* ������� ������� */
); 
procedure FIELDMENU_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDMENU_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDMENU_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDMENU_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDMENU_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDMENU_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDMENU_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDPARAMMAP_BRIEF  (
 aCURSESSION CHAR,
 aFIELDPARAMMAPid CHAR,
 aBRIEF out varchar2
);
procedure FIELDPARAMMAP_DELETE  (
 aCURSESSION CHAR,
 aFIELDPARAMMAPid CHAR,
 ainstanceid char
); 
procedure FIELDPARAMMAP_SAVE (
 aCURSESSION CHAR,
 aFIELDPARAMMAPid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aFieldName
 VARCHAR2/* ���� (��������) *//* ���� (��������) */
,aParamName
 VARCHAR2/* �������� *//* �������� */
,aNoEdit
 NUMBER/* ������������� �������� ������ *//* ������������� �������� ������ */
); 
procedure FIELDPARAMMAP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDPARAMMAP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDPARAMMAP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDPARAMMAP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDPARAMMAP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDPARAMMAP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDPARAMMAP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDEXPRESSION_BRIEF  (
 aCURSESSION CHAR,
 aFIELDEXPRESSIONid CHAR,
 aBRIEF out varchar2
);
procedure FIELDEXPRESSION_DELETE  (
 aCURSESSION CHAR,
 aFIELDEXPRESSIONid CHAR,
 ainstanceid char
); 
procedure FIELDEXPRESSION_SAVE (
 aCURSESSION CHAR,
 aFIELDEXPRESSIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ��������� *//* ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
); 
procedure FIELDEXPRESSION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDEXPRESSION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDEXPRESSION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDEXPRESSION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDEXPRESSION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDEXPRESSION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDEXPRESSION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure DINAMICFILTERSCRIPT_BRIEF  (
 aCURSESSION CHAR,
 aDINAMICFILTERSCRIPTid CHAR,
 aBRIEF out varchar2
);
procedure DINAMICFILTERSCRIPT_DELETE  (
 aCURSESSION CHAR,
 aDINAMICFILTERSCRIPTid CHAR,
 ainstanceid char
); 
procedure DINAMICFILTERSCRIPT_SAVE (
 aCURSESSION CHAR,
 aDINAMICFILTERSCRIPTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ������� ��������� *//* ������� ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
); 
procedure DINAMICFILTERSCRIPT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure DINAMICFILTERSCRIPT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure DINAMICFILTERSCRIPT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure DINAMICFILTERSCRIPT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure DINAMICFILTERSCRIPT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure DINAMICFILTERSCRIPT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure DINAMICFILTERSCRIPT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure PARTVIEW_BRIEF  (
 aCURSESSION CHAR,
 aPARTVIEWid CHAR,
 aBRIEF out varchar2
);
procedure PARTVIEW_DELETE  (
 aCURSESSION CHAR,
 aPARTVIEWid CHAR,
 ainstanceid char
); 
procedure PARTVIEW_SAVE (
 aCURSESSION CHAR,
 aPARTVIEWid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,athe_Alias
 VARCHAR2/* ��������� *//* ��������� */
,aForChoose
 NUMBER/* ��� ������ *//* ��� ������ */
,aFilterField0
 VARCHAR2 := null /* ���� - ������ 0 *//* ���� - ������ 0 */
,aFilterField1
 VARCHAR2 := null /* ���� - ������ 1 *//* ���� - ������ 1 */
,aFilterField2
 VARCHAR2 := null /* ���� - ������ 2 *//* ���� - ������ 2 */
,aFilterField3
 VARCHAR2 := null /* ���� - ������ 3 *//* ���� - ������ 3 */
); 
procedure PARTVIEW_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure PARTVIEW_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure PARTVIEW_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure PARTVIEW_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure PARTVIEW_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure PARTVIEW_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure PARTVIEW_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ViewColumn_BRIEF  (
 aCURSESSION CHAR,
 aViewColumnid CHAR,
 aBRIEF out varchar2
);
procedure ViewColumn_DELETE  (
 aCURSESSION CHAR,
 aViewColumnid CHAR,
 ainstanceid char
); 
procedure ViewColumn_SAVE (
 aCURSESSION CHAR,
 aViewColumnid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,asequence
 NUMBER := null /* �  *//* �  */
,aName
 VARCHAR2/* �������� *//* �������� */
,athe_Alias
 VARCHAR2/* �������� *//* �������� */
,aFromPart CHAR/* ������ *//* ������ */
,aField CHAR/* ���� *//* ���� */
,aAggregation
 NUMBER/* ��������� *//* ��������� */
,aExpression VARCHAR2 := null /* ������� *//* ������� */
,aForCombo
 NUMBER := null /* ��� ����� *//* ��� ����� */
); 
procedure ViewColumn_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ViewColumn_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ViewColumn_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ViewColumn_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ViewColumn_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ViewColumn_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ViewColumn_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VALIDATOR_BRIEF  (
 aCURSESSION CHAR,
 aVALIDATORid CHAR,
 aBRIEF out varchar2
);
procedure VALIDATOR_DELETE  (
 aCURSESSION CHAR,
 aVALIDATORid CHAR,
 ainstanceid char
); 
procedure VALIDATOR_SAVE (
 aCURSESSION CHAR,
 aVALIDATORid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ������� ��������� *//* ������� ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
); 
procedure VALIDATOR_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VALIDATOR_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VALIDATOR_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VALIDATOR_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VALIDATOR_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VALIDATOR_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VALIDATOR_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure UNIQUECONSTRAINT_BRIEF  (
 aCURSESSION CHAR,
 aUNIQUECONSTRAINTid CHAR,
 aBRIEF out varchar2
);
procedure UNIQUECONSTRAINT_DELETE  (
 aCURSESSION CHAR,
 aUNIQUECONSTRAINTid CHAR,
 ainstanceid char
); 
procedure UNIQUECONSTRAINT_SAVE (
 aCURSESSION CHAR,
 aUNIQUECONSTRAINTid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aPerParent
 NUMBER/* �� �������� *//* �� �������� */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
); 
procedure UNIQUECONSTRAINT_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure UNIQUECONSTRAINT_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure UNIQUECONSTRAINT_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure UNIQUECONSTRAINT_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure UNIQUECONSTRAINT_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure UNIQUECONSTRAINT_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure UNIQUECONSTRAINT_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure CONSTRAINTFIELD_BRIEF  (
 aCURSESSION CHAR,
 aCONSTRAINTFIELDid CHAR,
 aBRIEF out varchar2
);
procedure CONSTRAINTFIELD_DELETE  (
 aCURSESSION CHAR,
 aCONSTRAINTFIELDid CHAR,
 ainstanceid char
); 
procedure CONSTRAINTFIELD_SAVE (
 aCURSESSION CHAR,
 aCONSTRAINTFIELDid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheField CHAR/* ���� *//* ���� */
); 
procedure CONSTRAINTFIELD_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure CONSTRAINTFIELD_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure CONSTRAINTFIELD_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure CONSTRAINTFIELD_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure CONSTRAINTFIELD_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure CONSTRAINTFIELD_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure CONSTRAINTFIELD_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure INSTANCEVALIDATOR_BRIEF  (
 aCURSESSION CHAR,
 aINSTANCEVALIDATORid CHAR,
 aBRIEF out varchar2
);
procedure INSTANCEVALIDATOR_DELETE  (
 aCURSESSION CHAR,
 aINSTANCEVALIDATORid CHAR,
 ainstanceid char
); 
procedure INSTANCEVALIDATOR_SAVE (
 aCURSESSION CHAR,
 aINSTANCEVALIDATORid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTarget CHAR := null /* ��������� *//* ��������� */
,aCode VARCHAR2 := null /* ������ *//* ������ */
); 
procedure INSTANCEVALIDATOR_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure INSTANCEVALIDATOR_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure INSTANCEVALIDATOR_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure INSTANCEVALIDATOR_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure INSTANCEVALIDATOR_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure INSTANCEVALIDATOR_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure INSTANCEVALIDATOR_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure OBJSTATUS_BRIEF  (
 aCURSESSION CHAR,
 aOBJSTATUSid CHAR,
 aBRIEF out varchar2
);
procedure OBJSTATUS_DELETE  (
 aCURSESSION CHAR,
 aOBJSTATUSid CHAR,
 ainstanceid char
); 
procedure OBJSTATUS_SAVE (
 aCURSESSION CHAR,
 aOBJSTATUSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aname
 VARCHAR2/* �������� *//* �������� */
,aisStartup
 NUMBER/* ��������� *//* ��������� */
,aIsArchive
 NUMBER/* �������� *//* �������� */
,athe_comment VARCHAR2 := null /* �������� *//* �������� */
); 
procedure OBJSTATUS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure OBJSTATUS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure OBJSTATUS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure OBJSTATUS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure OBJSTATUS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure OBJSTATUS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure OBJSTATUS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure NEXTSTATE_BRIEF  (
 aCURSESSION CHAR,
 aNEXTSTATEid CHAR,
 aBRIEF out varchar2
);
procedure NEXTSTATE_DELETE  (
 aCURSESSION CHAR,
 aNEXTSTATEid CHAR,
 ainstanceid char
); 
procedure NEXTSTATE_SAVE (
 aCURSESSION CHAR,
 aNEXTSTATEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheState CHAR/* ����������� ��������� *//* ����������� ��������� */
); 
procedure NEXTSTATE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure NEXTSTATE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure NEXTSTATE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure NEXTSTATE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure NEXTSTATE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure NEXTSTATE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure NEXTSTATE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure OBJECTMODE_BRIEF  (
 aCURSESSION CHAR,
 aOBJECTMODEid CHAR,
 aBRIEF out varchar2
);
procedure OBJECTMODE_DELETE  (
 aCURSESSION CHAR,
 aOBJECTMODEid CHAR,
 ainstanceid char
); 
procedure OBJECTMODE_SAVE (
 aCURSESSION CHAR,
 aOBJECTMODEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� ������ *//* �������� ������ */
,aDefaultMode
 NUMBER := null /* ���� ����� �������� �������� ������� ������ ������� *//* ���� ����� �������� �������� ������� ������ ������� */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
); 
procedure OBJECTMODE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure OBJECTMODE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure OBJECTMODE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure OBJECTMODE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure OBJECTMODE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure OBJECTMODE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure OBJECTMODE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure STRUCTRESTRICTION_BRIEF  (
 aCURSESSION CHAR,
 aSTRUCTRESTRICTIONid CHAR,
 aBRIEF out varchar2
);
procedure STRUCTRESTRICTION_DELETE  (
 aCURSESSION CHAR,
 aSTRUCTRESTRICTIONid CHAR,
 ainstanceid char
); 
procedure STRUCTRESTRICTION_SAVE (
 aCURSESSION CHAR,
 aSTRUCTRESTRICTIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aStruct CHAR := null /* ���������, ������ � ������� ��������� *//* ���������, ������ � ������� ��������� */
,aAllowRead
 NUMBER := null /* �������� �������� *//* �������� �������� */
,aAllowAdd
 NUMBER := null /* ��������� ��������� *//* ��������� ��������� */
,aAllowEdit
 NUMBER := null /* ��������� �������� *//* ��������� �������� */
,aAllowDelete
 NUMBER := null /* ��������� ������� *//* ��������� ������� */
); 
procedure STRUCTRESTRICTION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure STRUCTRESTRICTION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure STRUCTRESTRICTION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure STRUCTRESTRICTION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure STRUCTRESTRICTION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure STRUCTRESTRICTION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure STRUCTRESTRICTION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure FIELDRESTRICTION_BRIEF  (
 aCURSESSION CHAR,
 aFIELDRESTRICTIONid CHAR,
 aBRIEF out varchar2
);
procedure FIELDRESTRICTION_DELETE  (
 aCURSESSION CHAR,
 aFIELDRESTRICTIONid CHAR,
 ainstanceid char
); 
procedure FIELDRESTRICTION_SAVE (
 aCURSESSION CHAR,
 aFIELDRESTRICTIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aThePart CHAR := null /* ���������, ������� ����������� ���� *//* ���������, ������� ����������� ���� */
,aTheField CHAR := null /* ����, �� ������� ������������� ����������� *//* ����, �� ������� ������������� ����������� */
,aAllowRead
 NUMBER := null /* �������� �������� *//* �������� �������� */
,aAllowModify
 NUMBER := null /* ��������� ����������� *//* ��������� ����������� */
); 
procedure FIELDRESTRICTION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure FIELDRESTRICTION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure FIELDRESTRICTION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure FIELDRESTRICTION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure FIELDRESTRICTION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure FIELDRESTRICTION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure FIELDRESTRICTION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure METHODRESTRICTION_BRIEF  (
 aCURSESSION CHAR,
 aMETHODRESTRICTIONid CHAR,
 aBRIEF out varchar2
);
procedure METHODRESTRICTION_DELETE  (
 aCURSESSION CHAR,
 aMETHODRESTRICTIONid CHAR,
 ainstanceid char
); 
procedure METHODRESTRICTION_SAVE (
 aCURSESSION CHAR,
 aMETHODRESTRICTIONid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aPart CHAR := null /* ���������, ������� ����������� ����� *//* ���������, ������� ����������� ����� */
,aMethod CHAR := null /* ����� *//* ����� */
,aIsRestricted
 NUMBER := null /* ��������� ������������ *//* ��������� ������������ */
); 
procedure METHODRESTRICTION_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure METHODRESTRICTION_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure METHODRESTRICTION_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure METHODRESTRICTION_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure METHODRESTRICTION_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure METHODRESTRICTION_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure METHODRESTRICTION_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure TYPEMENU_BRIEF  (
 aCURSESSION CHAR,
 aTYPEMENUid CHAR,
 aBRIEF out varchar2
);
procedure TYPEMENU_DELETE  (
 aCURSESSION CHAR,
 aTYPEMENUid CHAR,
 ainstanceid char
); 
procedure TYPEMENU_SAVE (
 aCURSESSION CHAR,
 aTYPEMENUid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aCaption
 VARCHAR2 := null /* ��������� *//* ��������� */
,aToolTip
 VARCHAR2 := null /* ��������� *//* ��������� */
,athe_Action CHAR := null /* ����� *//* ����� */
,aIsMenuItem
 NUMBER := null /* �������� � ���� *//* �������� � ���� */
,aIsToolBarButton
 NUMBER := null /* �������� � ������ *//* �������� � ������ */
,aHotKey
 VARCHAR2 := null /* ������� ������� *//* ������� ������� */
); 
procedure TYPEMENU_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure TYPEMENU_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure TYPEMENU_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure TYPEMENU_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure TYPEMENU_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure TYPEMENU_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure TYPEMENU_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure MTZAPP_BRIEF  (
 aCURSESSION CHAR,
 aMTZAPPid CHAR,
 aBRIEF out varchar2
);
procedure MTZAPP_DELETE  (
 aCURSESSION CHAR,
 aMTZAPPid CHAR,
 ainstanceid char
); 
procedure MTZAPP_SAVE (
 aCURSESSION CHAR,
 aMTZAPPid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aDBName
 VARCHAR2 := null /* ���� ������ *//* ���� ������ */
,aTheComment VARCHAR2 := null /* �������� *//* �������� */
); 
procedure MTZAPP_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure MTZAPP_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure MTZAPP_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure MTZAPP_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure MTZAPP_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure MTZAPP_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure MTZAPP_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure ParentPackage_BRIEF  (
 aCURSESSION CHAR,
 aParentPackageid CHAR,
 aBRIEF out varchar2
);
procedure ParentPackage_DELETE  (
 aCURSESSION CHAR,
 aParentPackageid CHAR,
 ainstanceid char
); 
procedure ParentPackage_SAVE (
 aCURSESSION CHAR,
 aParentPackageid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aPackage CHAR/* ���������� *//* ���������� */
); 
procedure ParentPackage_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure ParentPackage_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure ParentPackage_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure ParentPackage_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure ParentPackage_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure ParentPackage_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure ParentPackage_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GENPACKAGE_BRIEF  (
 aCURSESSION CHAR,
 aGENPACKAGEid CHAR,
 aBRIEF out varchar2
);
procedure GENPACKAGE_DELETE  (
 aCURSESSION CHAR,
 aGENPACKAGEid CHAR,
 ainstanceid char
); 
procedure GENPACKAGE_SAVE (
 aCURSESSION CHAR,
 aGENPACKAGEid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
); 
procedure GENPACKAGE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GENPACKAGE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GENPACKAGE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GENPACKAGE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GENPACKAGE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GENPACKAGE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GENPACKAGE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GENERATOR_TARGET_BRIEF  (
 aCURSESSION CHAR,
 aGENERATOR_TARGETid CHAR,
 aBRIEF out varchar2
);
procedure GENERATOR_TARGET_DELETE  (
 aCURSESSION CHAR,
 aGENERATOR_TARGETid CHAR,
 ainstanceid char
); 
procedure GENERATOR_TARGET_SAVE (
 aCURSESSION CHAR,
 aGENERATOR_TARGETid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aTargetType
 NUMBER := null /* ��� ��������� *//* ��� ��������� */
,aQueueName
 VARCHAR2 := null /* ������� *//* ������� */
,aGeneratorProgID
 VARCHAR2 := null /* COM ����� *//* COM ����� */
,aGeneratorStyle
 NUMBER := null /* ������� *//* ������� */
,aTheDevelopmentEnv
 NUMBER := null /* ����� ���������� *//* ����� ���������� */
); 
procedure GENERATOR_TARGET_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GENERATOR_TARGET_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GENERATOR_TARGET_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GENERATOR_TARGET_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GENERATOR_TARGET_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GENERATOR_TARGET_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GENERATOR_TARGET_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GENMANUALCODE_BRIEF  (
 aCURSESSION CHAR,
 aGENMANUALCODEid CHAR,
 aBRIEF out varchar2
);
procedure GENMANUALCODE_DELETE  (
 aCURSESSION CHAR,
 aGENMANUALCODEid CHAR,
 ainstanceid char
); 
procedure GENMANUALCODE_SAVE (
 aCURSESSION CHAR,
 aGENMANUALCODEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,athe_Alias
 VARCHAR2 := null /* ��������� *//* ��������� */
,aCode VARCHAR2/* ��� *//* ��� */
); 
procedure GENMANUALCODE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GENMANUALCODE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GENMANUALCODE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GENMANUALCODE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GENMANUALCODE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GENMANUALCODE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GENMANUALCODE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GENCONTROLS_BRIEF  (
 aCURSESSION CHAR,
 aGENCONTROLSid CHAR,
 aBRIEF out varchar2
);
procedure GENCONTROLS_DELETE  (
 aCURSESSION CHAR,
 aGENCONTROLSid CHAR,
 ainstanceid char
); 
procedure GENCONTROLS_SAVE (
 aCURSESSION CHAR,
 aGENCONTROLSid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aControlProgID
 VARCHAR2 := null /* ProgID ������������ �������� *//* ProgID ������������ �������� */
,aControlClassID
 VARCHAR2 := null /* ����� �������������������� *//* ����� �������������������� */
,aVersionMajor
 NUMBER := null /* ������ *//* ������ */
,aVersionMinor
 NUMBER := null /* ��������� *//* ��������� */
); 
procedure GENCONTROLS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GENCONTROLS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GENCONTROLS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GENCONTROLS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GENCONTROLS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GENCONTROLS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GENCONTROLS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure GENREFERENCE_BRIEF  (
 aCURSESSION CHAR,
 aGENREFERENCEid CHAR,
 aBRIEF out varchar2
);
procedure GENREFERENCE_DELETE  (
 aCURSESSION CHAR,
 aGENREFERENCEid CHAR,
 ainstanceid char
); 
procedure GENREFERENCE_SAVE (
 aCURSESSION CHAR,
 aGENREFERENCEid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2 := null /* �������� *//* �������� */
,aRefClassID
 VARCHAR2 := null /* ����� ������ *//* ����� ������ */
,aVersionMajor
 NUMBER := null /* ����� ������ *//* ����� ������ */
,aVersionMinor
 NUMBER := null /* ��������� *//* ��������� */
); 
procedure GENREFERENCE_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure GENREFERENCE_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure GENREFERENCE_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure GENREFERENCE_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure GENREFERENCE_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure GENREFERENCE_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure GENREFERENCE_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MTZMetaModel;

/



