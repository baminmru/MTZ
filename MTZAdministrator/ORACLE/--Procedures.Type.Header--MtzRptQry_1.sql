
/* --MtzRptQry*/

 create or replace package MtzRptQry as

procedure MtzRptQry_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure MtzRptQry_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure MtzRptQry_propagate(acursession CHAR, aROWID CHAR); 


procedure RptSrvMsg_BRIEF  (
 aCURSESSION CHAR,
 aRptSrvMsgid CHAR,
 aBRIEF out varchar2
);
procedure RptSrvMsg_DELETE  (
 aCURSESSION CHAR,
 aRptSrvMsgid CHAR,
 ainstanceid char
); 
procedure RptSrvMsg_SAVE (
 aCURSESSION CHAR,
 aRptSrvMsgid CHAR,
aInstanceID CHAR 
,aMsgdate
 DATE/* ���� ��������� *//* ���� ��������� */
,aInfo VARCHAR2 := null /* ���������� *//* ���������� */
); 
procedure RptSrvMsg_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure RptSrvMsg_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure RptSrvMsg_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure RptSrvMsg_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure RptSrvMsg_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure RptSrvMsg_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure RptSrvMsg_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure RptQuery_BRIEF  (
 aCURSESSION CHAR,
 aRptQueryid CHAR,
 aBRIEF out varchar2
);
procedure RptQuery_DELETE  (
 aCURSESSION CHAR,
 aRptQueryid CHAR,
 ainstanceid char
); 
procedure RptQuery_SAVE (
 aCURSESSION CHAR,
 aRptQueryid CHAR,
aInstanceID CHAR 
,aReportType CHAR/* ��� ������ *//* ��� ������ */
,aQueryUser CHAR/* ����� ������ *//* ����� ������ */
,aQryDate
 DATE/* ���� ������ *//* ���� ������ */
,aAcceptDate
 DATE := null /* ���� ������ ������ �������� *//* ���� ������ ������ �������� */
,aFinDate
 DATE := null /* ������ ���������� ��������� *//* ������ ���������� ��������� */
,aResultID CHAR := null /* ������������� ���������� *//* ������������� ���������� */
); 
procedure RptQuery_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure RptQuery_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure RptQuery_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure RptQuery_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure RptQuery_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure RptQuery_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure RptQuery_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure RptQryParam_BRIEF  (
 aCURSESSION CHAR,
 aRptQryParamid CHAR,
 aBRIEF out varchar2
);
procedure RptQryParam_DELETE  (
 aCURSESSION CHAR,
 aRptQryParamid CHAR,
 ainstanceid char
); 
procedure RptQryParam_SAVE (
 aCURSESSION CHAR,
 aRptQryParamid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aTheValue VARCHAR2 := null /* �������� *//* �������� */
); 
procedure RptQryParam_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure RptQryParam_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure RptQryParam_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure RptQryParam_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure RptQryParam_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure RptQryParam_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure RptQryParam_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end MtzRptQry;

/



