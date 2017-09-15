
/* --VRRPT*/

 create or replace package VRRPT as

procedure VRRPT_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure VRRPT_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure VRRPT_propagate(acursession CHAR, aROWID CHAR); 


procedure VRRPT_COSTS_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_COSTSid CHAR,
 aBRIEF out varchar2
);
procedure VRRPT_COSTS_DELETE  (
 aCURSESSION CHAR,
 aVRRPT_COSTSid CHAR,
 ainstanceid char
); 
procedure VRRPT_COSTS_SAVE (
 aCURSESSION CHAR,
 aVRRPT_COSTSid CHAR,
aInstanceID CHAR 
,aDescrtiption VARCHAR2/* �������� *//* �������� */
,aCost
 NUMBER := null /* ��������� *//* ��������� */
,aDuration
 NUMBER := null /* ������������ (���.) *//* ������������ (���.) */
); 
procedure VRRPT_COSTS_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRRPT_COSTS_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRRPT_COSTS_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRRPT_COSTS_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRRPT_COSTS_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRRPT_COSTS_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRRPT_COSTS_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRRPT_MeetingPlan_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_MeetingPlanid CHAR,
 aBRIEF out varchar2
);
procedure VRRPT_MeetingPlan_DELETE  (
 aCURSESSION CHAR,
 aVRRPT_MeetingPlanid CHAR,
 ainstanceid char
); 
procedure VRRPT_MeetingPlan_SAVE (
 aCURSESSION CHAR,
 aVRRPT_MeetingPlanid CHAR,
aInstanceID CHAR 
,aDateOF
 DATE/* ����� ������� *//* ����� ������� */
,aPlaceOf VARCHAR2/* ����� ���������� *//* ����� ���������� */
,atheme VARCHAR2/* ���� *//* ���� */
); 
procedure VRRPT_MeetingPlan_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRRPT_MeetingPlan_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRRPT_MeetingPlan_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRRPT_MeetingPlan_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRRPT_MeetingPlan_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRRPT_MeetingPlan_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRRPT_MeetingPlan_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRRPT_Meeters_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_Meetersid CHAR,
 aBRIEF out varchar2
);
procedure VRRPT_Meeters_DELETE  (
 aCURSESSION CHAR,
 aVRRPT_Meetersid CHAR,
 ainstanceid char
); 
procedure VRRPT_Meeters_SAVE (
 aCURSESSION CHAR,
 aVRRPT_Meetersid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aWorker CHAR := null /* ��������� *//* ��������� */
,aContact CHAR := null /* ���������� ���� *//* ���������� ���� */
,aMandatory
 NUMBER/* ����������� *//* ����������� */
,aReminderTime
 NUMBER := null /* ��������� �� (���.) *//* ��������� �� (���.) */
,aReminderSent
 NUMBER := null /* �������� *//* �������� */
); 
procedure VRRPT_Meeters_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRRPT_Meeters_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRRPT_Meeters_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRRPT_Meeters_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRRPT_Meeters_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRRPT_Meeters_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRRPT_Meeters_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRRPT_MAIN_BRIEF  (
 aCURSESSION CHAR,
 aVRRPT_MAINid CHAR,
 aBRIEF out varchar2
);
procedure VRRPT_MAIN_DELETE  (
 aCURSESSION CHAR,
 aVRRPT_MAINid CHAR,
 ainstanceid char
); 
procedure VRRPT_MAIN_SAVE (
 aCURSESSION CHAR,
 aVRRPT_MAINid CHAR,
aInstanceID CHAR 
,aOrg CHAR/* ���� ����������� *//* ���� ����������� */
,aAuthor CHAR/* ����� *//* ����� */
,aTheDate
 DATE/* ���� ������ *//* ���� ������ */
,aClient CHAR := null /* ������ *//* ������ */
,aProject CHAR := null /* ������ *//* ������ */
,aContract CHAR := null /* ������� *//* ������� */
,aPerson CHAR := null /* ���������� ���� *//* ���������� ���� */
,aName
 VARCHAR2 := null /* �������� ������ *//* �������� ������ */
,aInfo VARCHAR2 := null /* ���������� *//* ���������� */
,aAttrachment VARCHAR2 := null /* �������� */
,aAttrachment_EXT varchar2 /* �������� */
,aReportType CHAR := null /* ��� ������ *//* ��� ������ */
); 
procedure VRRPT_MAIN_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRRPT_MAIN_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRRPT_MAIN_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRRPT_MAIN_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRRPT_MAIN_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRRPT_MAIN_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRRPT_MAIN_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end VRRPT;

/



