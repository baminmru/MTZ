
/* --WFDic*/

 create or replace package WFDic as

procedure WFDic_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure WFDic_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure WFDic_propagate(acursession CHAR, aROWID CHAR); 


procedure WFDic_func_BRIEF  (
 aCURSESSION CHAR,
 aWFDic_funcid CHAR,
 aBRIEF out varchar2
);
procedure WFDic_func_DELETE  (
 aCURSESSION CHAR,
 aWFDic_funcid CHAR,
 ainstanceid char
); 
procedure WFDic_func_SAVE (
 aCURSESSION CHAR,
 aWFDic_funcid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* �������� *//* �������� */
,aStepClass
 NUMBER/* ��� *//* ��� */
,aIconName
 VARCHAR2/* �������� ������ *//* �������� ������ */
,aProgID
 VARCHAR2 := null /* COM ����� *//* COM ����� */
,aEdtMode
 VARCHAR2 := null /* ����� ������� *//* ����� ������� */
,aRTMProgID
 VARCHAR2 := null /* ����� ������ ���������� *//* ����� ������ ���������� */
,aIsMailStone
 NUMBER := null /* ��� ���� �������� *//* ��� ���� �������� */
,athe_Comment VARCHAR2 := null /* ���������� *//* ���������� */
,aIntegrationData1
 VARCHAR2 := null /* ����� ��� ���������� 1 *//* ����� ��� ���������� 1 */
,aIntegrationData2
 VARCHAR2 := null /* ����� ��� ���������� 2 *//* ����� ��� ���������� 2 */
); 
procedure WFDic_func_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFDic_func_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFDic_func_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFDic_func_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFDic_func_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFDic_func_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFDic_func_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure WFDic_presets_BRIEF  (
 aCURSESSION CHAR,
 aWFDic_presetsid CHAR,
 aBRIEF out varchar2
);
procedure WFDic_presets_DELETE  (
 aCURSESSION CHAR,
 aWFDic_presetsid CHAR,
 ainstanceid char
); 
procedure WFDic_presets_SAVE (
 aCURSESSION CHAR,
 aWFDic_presetsid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aName
 VARCHAR2/* ��� �������� *//* ��� �������� */
,athe_Value
 VARCHAR2/* �������� *//* �������� */
); 
procedure WFDic_presets_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure WFDic_presets_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure WFDic_presets_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure WFDic_presets_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure WFDic_presets_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure WFDic_presets_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure WFDic_presets_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end WFDic;

/



