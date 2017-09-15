
/* --WFFR*/

 create or replace package WFFR as

procedure WFFR_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure WFFR_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure WFFR_propagate(acursession CHAR, aROWID CHAR); 


procedure WFFR_ShortCut_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_ShortCutid CHAR,
 aBRIEF out varchar2
);
procedure WFFR_ShortCut_DELETE  (
 aCURSESSION CHAR,
 aWFFR_ShortCutid CHAR,
 ainstanceid char
); 
procedure WFFR_ShortCut_SAVE (
 aCURSESSION CHAR,
 aWFFR_ShortCutid CHAR,
aInstanceID CHAR 
,aBasedOn CHAR/* �� ��������� *//* �� ��������� */
,aShortCut CHAR := null /* ����� *//* ����� */
); 
procedure WFFR_ShortCut_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFR_ShortCut_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFR_ShortCut_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFR_ShortCut_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFR_ShortCut_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFR_ShortCut_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFR_ShortCut_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFR_Fcomm_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_Fcommid CHAR,
 aBRIEF out varchar2
);
procedure WFFR_Fcomm_DELETE  (
 aCURSESSION CHAR,
 aWFFR_Fcommid CHAR,
 ainstanceid char
); 
procedure WFFR_Fcomm_SAVE (
 aCURSESSION CHAR,
 aWFFR_Fcommid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aAuthor CHAR/* ����� *//* ����� */
,aSubject
 VARCHAR2/* ���� *//* ���� */
,aMessage VARCHAR2 := null /* ��������� *//* ��������� */
,aAttachment VARCHAR2 := null /* �������� */
,aAttachment_EXT varchar2 /* �������� */
); 
procedure WFFR_Fcomm_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFR_Fcomm_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFR_Fcomm_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFR_Fcomm_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFR_Fcomm_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFR_Fcomm_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFR_Fcomm_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFR_fparents_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_fparentsid CHAR,
 aBRIEF out varchar2
);
procedure WFFR_fparents_DELETE  (
 aCURSESSION CHAR,
 aWFFR_fparentsid CHAR,
 ainstanceid char
); 
procedure WFFR_fparents_SAVE (
 aCURSESSION CHAR,
 aWFFR_fparentsid CHAR,
aInstanceID CHAR 
,aPrevFunc CHAR/* ���������� ������� *//* ���������� ������� */
); 
procedure WFFR_fparents_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFR_fparents_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFR_fparents_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFR_fparents_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFR_fparents_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFR_fparents_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFR_fparents_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFFR_func_BRIEF  (
 aCURSESSION CHAR,
 aWFFR_funcid CHAR,
 aBRIEF out varchar2
);
procedure WFFR_func_DELETE  (
 aCURSESSION CHAR,
 aWFFR_funcid CHAR,
 ainstanceid char
); 
procedure WFFR_func_SAVE (
 aCURSESSION CHAR,
 aWFFR_funcid CHAR,
aInstanceID CHAR 
,aState
 NUMBER/* ��������� *//* ��������� */
,aBasedOn CHAR/* ��������� *//* ��������� */
,aPassNo
 NUMBER/* ������ *//* ������ */
,aCreateAt
 DATE := null /* ������ �������� *//* ������ �������� */
,aLastStart
 DATE := null /* ��������� ������ *//* ��������� ������ */
,aLastStateScan
 DATE := null /* ��������� �������� ��������� *//* ��������� �������� ��������� */
,aPriority
 NUMBER := null /* ������� ��������� *//* ������� ��������� */
,aChangePriorityTime
 DATE := null /* ������ ��������� ���������� *//* ������ ��������� ���������� */
,aWorkPercent
 NUMBER := null /* ���������� *//* ���������� */
,aInfo VARCHAR2 := null /* ������� ������� *//* ������� ������� */
,aFuncResult
 VARCHAR2 := null /* ��������� *//* ��������� */
); 
procedure WFFR_func_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFFR_func_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFFR_func_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFFR_func_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFFR_func_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFFR_func_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFFR_func_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end WFFR;

/



