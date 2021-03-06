VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GUI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


' �������� ��������� ���������� WEBSGUI
Private mOpenModal As Boolean
Dim opf As OpenFormInfo
Dim openForms As Collection






'����������� ������ WEBS
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Class_Initialize()
Private Sub Class_Initialize()
 Set openForms = New Collection
 App.Title = "WEB ����"
End Sub


'���������� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Class_Terminate()
Private Sub Class_Terminate()
  On Error Resume Next
CloseClass
End Sub

'������� �������� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Public Sub CloseClass()
Dim f As OpenFormInfo
  On Error Resume Next
For Each f In openForms
    Set f.Form.Host = Nothing
    Unload f.Form
    Set f.Form = Nothing
Next
Set openForms = Nothing
End Sub

'����� ����� ��������������
'Parameters:
'[IN]   InstanceID , ��� ���������: String,
'[IN]   mode , ��� ���������: String  - ...
'Returns:
'  ������ ������ ������ Visual Basic
'  ,��� Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me.FindForm(...���������...)
Private Function FindForm(ByVal InstanceID As String, ByVal Mode As String) As Object
  Dim f As OpenFormInfo
  For Each f In openForms
    If f.InstanceID = InstanceID And f.Mode = Mode And f.modal = False Then
      Set FindForm = f
      Exit Function
    End If
  Next
End Function

'���� � ������� ����������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
'  variable = me.GUIPath()
Public Function GUIPath() As String
    GUIPath = App.Path & "\" & App.EXEName & ".ocx"
End Function

'���������� �������� ����
'Parameters:
'[IN]   InstanceID , ��� ���������: String  - ...
'Returns:
'  �������� ���� long
'See Also:
'Example:
' dim variable as long
' variable = me.FormCount(...���������...)
Public Function FormCount(ByVal InstanceID As String) As Long
    Dim f As OpenFormInfo
    Dim cnt As Long
    cnt = 0
    For Each f In openForms
      If f.InstanceID = InstanceID Then
        cnt = cnt + 1
      End If
    Next
    FormCount = cnt
End Function

'�������� �����
'Parameters:
'[IN]   InstanceID , ��� ���������: String,
'[IN]   mode , ��� ���������: String,
'[IN]   ModalMode , ��� ���������: boolean  - ...
'See Also:
'Example:
'  call me.EraseForm({���������})
Public Sub EraseForm(ByVal InstanceID As String, ByVal Mode As String, ByVal ModalMode As Boolean)
    On Error Resume Next
    Dim f As OpenFormInfo
    Dim i As Long, cnt As Long
    i = 1
    cnt = FormCount(InstanceID)
    For Each f In openForms
      If f.InstanceID = InstanceID And f.Mode = Mode And f.modal = ModalMode Then
        GoTo found
      End If
      i = i + 1
    Next
    Exit Sub
found:
    openForms.Remove i
    With f.Form
      If Not .Item Is Nothing Then
         .Item.Manager.FreeInstanceObject .Item.ID
      End If
    End With
    Set f.Form.Host = Nothing
End Sub

'��������� ���������� ������ ������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. IsModal
Public Property Get IsModal() As Boolean
 IsModal = mOpenModal
End Property

'�������� ����� �������������� ���������
'Parameters:
'[IN]   mode , ��� ���������: string,
'[IN][OUT]   ObjItem , ��� ���������: object,
'[IN][OUT]   optional OpenModal , ��� ���������: boolean = false  - ...
'See Also:
'Example:
'  call me.Show({���������})
Public Sub Show(ByVal Mode As String, ObjItem As Object, Optional OpenModal As Boolean = False)
 Dim f As Form
 Dim defaccess As Boolean
 On Error Resume Next
 mOpenModal = OpenModal
 App.Title = ObjItem.Brief & " (���: WEB ����)"
 defaccess = ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "OPEN")
If Not OpenModal Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WEBS:")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frm_main
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
   End If
   Set f = opf.Form
   f.Init ObjItem, Me, OpenModal
   f.Show
   f.WindowState = 0
  Else
   MsgBox "������ � ��������� ��������", vbOKOnly + vbCritical, "WEB ����"
  End If
End If
If OpenModal Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WEBS:")) Then
    Set f = New frm_main
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
   f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
  Else
   MsgBox "������ � ��������� ��������", vbOKOnly + vbCritical, "WEB ����"
  End If
End If
End Sub

'������� ����� �������������� ������ �������. RowItem -  ������ ������, ��� ������ ���� ������
'Parameters:
'[IN]   Mode , ��� ���������: String,
'[IN][OUT]   RowItem , ��� ���������: Object  - ...
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.ShowAddForm(...���������...)
Public Function ShowAddForm(ByVal Mode As String, RowItem As Object) As Boolean
 Dim f As Form
 Dim OK As Boolean
 On Error Resume Next
 Set f = Nothing
 Dim PartName As String
 PartName = TypeName(RowItem)

 If Mode = "" Then
  If UCase(PartName) = "WEBS_MAILLIST" Then
    Set f = New frmWEBS_MAILLIST_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WEBS_ROLES" Then
    Set f = New frmWEBS_ROLES_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WEBS_PAGEDEF" Then
    Set f = New frmWEBS_PAGEDEF_
  End If

 If Mode = "" Then
  If UCase(PartName) = "WEBS_PICS" Then
    Set f = New frmWEBS_PICS_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WEBS_PAGEMENU" Then
    Set f = New frmWEBS_PAGEMENU_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WEBS_PAGECONTENT" Then
    Set f = New frmWEBS_PAGECONTENT_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WEBS_PAGEPARS" Then
    Set f = New frmWEBS_PAGEPARS_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WEBS_PAGECOMP" Then
    Set f = New frmWEBS_PAGECOMP_
  End If

 If Mode = "" Then
  If UCase(PartName) = "TABLEPART" Then
    Set f = New frmTablePart_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "REPLACEVALUES" Then
    Set f = New frmReplaceValues_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "DENYEDIT" Then
    Set f = New frmDenyEdit_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "DENYVISIBLE" Then
    Set f = New frmDenyVisible_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ALLOWEDITFIELDVALUES" Then
    Set f = New frmAllowEditFieldValues_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "COMBOFIELDS" Then
    Set f = New frmComboFields_
  End If

 If Mode = "" Then
 End If
 End If
 End If
  If UCase(PartName) = "WEBS_USERS" Then
    Set f = New frmWEBS_USERS_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WEBS_ANKETA" Then
    Set f = New frmWEBS_ANKETA_
  End If

 If Mode = "" Then
  If UCase(PartName) = "WEBS_QUESTIONS" Then
    Set f = New frmWEBS_QUESTIONS_
  End If

 If Mode = "" Then
  If UCase(PartName) = "WEBS_ANSWERS" Then
    Set f = New frmWEBS_ANSWERS_
  End If

 If Mode = "" Then
 End If
 End If
 End If
  If UCase(PartName) = "WEBS_DDOC" Then
    Set f = New frmWEBS_DDOC_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WEBS_NEWS" Then
    Set f = New frmWEBS_NEWS_
  End If

 If Mode = "" Then
  If UCase(PartName) = "NEWS_PICS" Then
    Set f = New frmNEWS_PICS_
  End If

 If Mode = "" Then
 End If
 End If
 End If
  If f Is Nothing Then
    OK = False
  Else

    Set f.Item = RowItem
    f.OnInit
    f.Show vbModal
    Set f.Item = Nothing
    OK = f.OK
    Unload f
    Set f = Nothing
  End If
  ShowAddForm = OK
End Function




