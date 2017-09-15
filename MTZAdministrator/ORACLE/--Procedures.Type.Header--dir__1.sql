
/* --dir_*/

 create or replace package dir_ as

procedure dir__DELETE(acursession CHAR, aInstanceID CHAR);  
procedure dir__HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure dir__propagate(acursession CHAR, aROWID CHAR); 


procedure dir_flow_BRIEF  (
 aCURSESSION CHAR,
 adir_flowid CHAR,
 aBRIEF out varchar2
);
procedure dir_flow_DELETE  (
 aCURSESSION CHAR,
 adir_flowid CHAR,
 ainstanceid char
); 
procedure dir_flow_SAVE (
 aCURSESSION CHAR,
 adir_flowid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,adocNumerator CHAR/* ��������� *//* ��������� */
,adocPrefix
 VARCHAR2 := null /* ������� *//* ������� */
,adocPostfix
 VARCHAR2 := null /* �������� *//* �������� */
); 
procedure dir_flow_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_flow_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_flow_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_flow_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_flow_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_flow_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_flow_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_flowtype_BRIEF  (
 aCURSESSION CHAR,
 adir_flowtypeid CHAR,
 aBRIEF out varchar2
);
procedure dir_flowtype_DELETE  (
 aCURSESSION CHAR,
 adir_flowtypeid CHAR,
 ainstanceid char
); 
procedure dir_flowtype_SAVE (
 aCURSESSION CHAR,
 adir_flowtypeid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aTheNumPart CHAR/* ������ ��������� *//* ������ ��������� */
,aNumField CHAR/* ���� ��� �������� ������ *//* ���� ��� �������� ������ */
,azonetemplate
 VARCHAR2/* ������ ���� *//* ������ ���� */
,aNumDateField CHAR := null /* ���� � ����� ����������� *//* ���� � ����� ����������� */
); 
procedure dir_flowtype_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_flowtype_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_flowtype_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_flowtype_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_flowtype_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_flowtype_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_flowtype_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_ordtype_BRIEF  (
 aCURSESSION CHAR,
 adir_ordtypeid CHAR,
 aBRIEF out varchar2
);
procedure dir_ordtype_DELETE  (
 aCURSESSION CHAR,
 adir_ordtypeid CHAR,
 ainstanceid char
); 
procedure dir_ordtype_SAVE (
 aCURSESSION CHAR,
 adir_ordtypeid CHAR,
aInstanceID CHAR 
,aordtype
 VARCHAR2/* ��� *//* ��� */
,aProcess CHAR := null /* ������ ��������� *//* ������ ��������� */
,aUseProject
 NUMBER/* ��������� ��������� *//* ��������� ��������� */
,aStateMachine CHAR := null /* ������ ��������� *//* ������ ��������� */
,aProcessDocumentName
 VARCHAR2 := null /* �������� ��������� � �������� *//* �������� ��������� � �������� */
); 
procedure dir_ordtype_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_ordtype_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_ordtype_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_ordtype_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_ordtype_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_ordtype_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_ordtype_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_org_BRIEF  (
 aCURSESSION CHAR,
 adir_orgid CHAR,
 aBRIEF out varchar2
);
procedure dir_org_DELETE  (
 aCURSESSION CHAR,
 adir_orgid CHAR,
 ainstanceid char
); 
procedure dir_org_SAVE (
 aCURSESSION CHAR,
 adir_orgid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* �������� *//* �������� */
,aInfo VARCHAR2 := null /* ���������� *//* ���������� */
,athe_Description CHAR := null /* �������� �������� *//* �������� �������� */
,aProfile CHAR := null /* ������� ����������� *//* ������� ����������� */
); 
procedure dir_org_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_org_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_org_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_org_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_org_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_org_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_org_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_departments_BRIEF  (
 aCURSESSION CHAR,
 adir_departmentsid CHAR,
 aBRIEF out varchar2
);
procedure dir_departments_DELETE  (
 aCURSESSION CHAR,
 adir_departmentsid CHAR,
 ainstanceid char
); 
procedure dir_departments_SAVE (
 aCURSESSION CHAR,
 adir_departmentsid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
, aParentRowid CHAR :=null
,adepname
 VARCHAR2/* �������� ������ *//* �������� ������ */
,adepgroup CHAR := null /* ������ *//* ������ */
,aincfolder CHAR := null /* ����� �������� *//* ����� �������� */
,arootfolder CHAR := null /* �������� ����� *//* �������� ����� */
,aoutprefix
 VARCHAR2 := null /* ������� ���������� *//* ������� ���������� */
,aincprefix
 VARCHAR2 := null /* ������� ��������� *//* ������� ��������� */
,aordprefix
 VARCHAR2 := null /* ������� ������� *//* ������� ������� */
,aoutpostfix
 VARCHAR2 := null /* �������� ���������� *//* �������� ���������� */
,aincpostfix
 VARCHAR2 := null /* �������� ��������� *//* �������� ��������� */
,aordpostfix
 VARCHAR2 := null /* ������� ������� *//* ������� ������� */
,aoutfolder CHAR := null /* ����� ��������� *//* ����� ��������� */
,aorderfolder CHAR := null /* ����� �������� *//* ����� �������� */
,aincnumerator CHAR := null /* ��������� �������� *//* ��������� �������� */
,aoutnumerator CHAR := null /* ��������� ��������� *//* ��������� ��������� */
,aordnumerator CHAR := null /* ��������� �������� *//* ��������� �������� */
,aIncZone
 VARCHAR2 := null /* ���� ��������� *//* ���� ��������� */
,aOutZone
 VARCHAR2 := null /* ���� ���������� *//* ���� ���������� */
,aEMail VARCHAR2 := null /* �������� ����� *//* �������� ����� */
,aOrdZone
 VARCHAR2 := null /* ���� �������� *//* ���� �������� */
,aUnitType CHAR/* ��� ������� *//* ��� ������� */
,aHasBudget
 NUMBER/* ���� ���� ������ *//* ���� ���� ������ */
); 
procedure dir_departments_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_departments_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_departments_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_departments_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_departments_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_departments_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_departments_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_inctype_BRIEF  (
 aCURSESSION CHAR,
 adir_inctypeid CHAR,
 aBRIEF out varchar2
);
procedure dir_inctype_DELETE  (
 aCURSESSION CHAR,
 adir_inctypeid CHAR,
 ainstanceid char
); 
procedure dir_inctype_SAVE (
 aCURSESSION CHAR,
 adir_inctypeid CHAR,
aInstanceID CHAR 
,aitype
 VARCHAR2/* ��� *//* ��� */
,aProcess CHAR := null /* ������� ��������� *//* ������� ��������� */
,aUseProject
 NUMBER/* ��������� ��������� *//* ��������� ��������� */
,aStateMachine CHAR := null /* ������ ��������� *//* ������ ��������� */
,aProcessDocumentName
 VARCHAR2 := null /* �������� ��������� � �������� *//* �������� ��������� � �������� */
); 
procedure dir_inctype_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_inctype_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_inctype_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_inctype_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_inctype_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_inctype_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_inctype_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_reftype_BRIEF  (
 aCURSESSION CHAR,
 adir_reftypeid CHAR,
 aBRIEF out varchar2
);
procedure dir_reftype_DELETE  (
 aCURSESSION CHAR,
 adir_reftypeid CHAR,
 ainstanceid char
); 
procedure dir_reftype_SAVE (
 aCURSESSION CHAR,
 adir_reftypeid CHAR,
aInstanceID CHAR 
,areftypename
 VARCHAR2/* �������� *//* �������� */
,aBackref CHAR := null /* �������� ������ *//* �������� ������ */
); 
procedure dir_reftype_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_reftype_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_reftype_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_reftype_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_reftype_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_reftype_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_reftype_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_position_BRIEF  (
 aCURSESSION CHAR,
 adir_positionid CHAR,
 aBRIEF out varchar2
);
procedure dir_position_DELETE  (
 aCURSESSION CHAR,
 adir_positionid CHAR,
 ainstanceid char
); 
procedure dir_position_SAVE (
 aCURSESSION CHAR,
 adir_positionid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,acode
 VARCHAR2/* ��� *//* ��� */
,adepartment CHAR/* ����� *//* ����� */
,aPerson CHAR := null /* ��������� *//* ��������� */
,aTheUser CHAR := null /* ������������ ������� *//* ������������ ������� */
,aUnavailable
 NUMBER/* ����������� *//* ����������� */
,aZAMEST CHAR := null /* ����������� *//* ����������� */
); 
procedure dir_position_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_position_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_position_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_position_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_position_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_position_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_position_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_jobstates_BRIEF  (
 aCURSESSION CHAR,
 adir_jobstatesid CHAR,
 aBRIEF out varchar2
);
procedure dir_jobstates_DELETE  (
 aCURSESSION CHAR,
 adir_jobstatesid CHAR,
 ainstanceid char
); 
procedure dir_jobstates_SAVE (
 aCURSESSION CHAR,
 adir_jobstatesid CHAR,
aInstanceID CHAR 
,aresstate
 VARCHAR2/* ��������� *//* ��������� */
); 
procedure dir_jobstates_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_jobstates_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_jobstates_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_jobstates_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_jobstates_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_jobstates_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_jobstates_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_outtype_BRIEF  (
 aCURSESSION CHAR,
 adir_outtypeid CHAR,
 aBRIEF out varchar2
);
procedure dir_outtype_DELETE  (
 aCURSESSION CHAR,
 adir_outtypeid CHAR,
 ainstanceid char
); 
procedure dir_outtype_SAVE (
 aCURSESSION CHAR,
 adir_outtypeid CHAR,
aInstanceID CHAR 
,aotype
 VARCHAR2/* ��� *//* ��� */
,aProcess CHAR := null /* ������� ��������� *//* ������� ��������� */
,aStateMachine CHAR := null /* ������ ��������� *//* ������ ��������� */
,aProcessDocumentName
 VARCHAR2 := null /* �������� ��������� � �������� *//* �������� ��������� � �������� */
); 
procedure dir_outtype_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_outtype_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_outtype_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_outtype_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_outtype_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_outtype_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_outtype_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure dir_theme_BRIEF  (
 aCURSESSION CHAR,
 adir_themeid CHAR,
 aBRIEF out varchar2
);
procedure dir_theme_DELETE  (
 aCURSESSION CHAR,
 adir_themeid CHAR,
 ainstanceid char
); 
procedure dir_theme_SAVE (
 aCURSESSION CHAR,
 adir_themeid CHAR,
aInstanceID CHAR 
,aname
 VARCHAR2/* �������� *//* �������� */
,aComent VARCHAR2 := null /* ����������� *//* ����������� */
); 
procedure dir_theme_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure dir_theme_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure dir_theme_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure dir_theme_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure dir_theme_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure dir_theme_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure dir_theme_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end dir_;

/



