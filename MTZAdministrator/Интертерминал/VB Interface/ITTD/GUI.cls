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


' �������� ��������� ���������� ITTDGUI
Private mOpenModal As Boolean
Dim opf As OpenFormInfo
Dim openForms As Collection






'����������� ������ ITTD
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Class_Initialize()
Private Sub Class_Initialize()
 Set openForms = New Collection
 App.Title = "����������"
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
 App.Title = ObjItem.Brief & " (���: ����������)"
 defaccess = ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "OPEN")
If Not OpenModal Then
If Mode = "main" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "ITTD:main")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmmain_main
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
   Exit Sub
  Else
   Mode = ""
  End If
End If
If Mode = "admi" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "ITTD:admi")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmadmi_main
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
   Exit Sub
  Else
   Mode = ""
  End If
End If
If Mode = "read" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "ITTD:read")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmread_main
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
   Exit Sub
  Else
   Mode = ""
  End If
End If
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "ITTD:")) Then
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
   MsgBox "������ � ��������� ��������", vbOKOnly + vbCritical, "����������"
  End If
End If
If OpenModal Then
If Mode = "main" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "ITTD:main")) Then
     Set f = New frmmain_main
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
     Exit Sub
  Else
     Mode = ""
  End If
End If
If Mode = "admi" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "ITTD:admi")) Then
     Set f = New frmadmi_main
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
     Exit Sub
  Else
     Mode = ""
  End If
End If
If Mode = "read" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "ITTD:read")) Then
     Set f = New frmread_main
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
     Exit Sub
  Else
     Mode = ""
  End If
End If
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "ITTD:")) Then
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
   MsgBox "������ � ��������� ��������", vbOKOnly + vbCritical, "����������"
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

 If Mode = "main" Then
  If UCase(PartName) = "ITTD_MOROZ" Then
    Set f = New frmITTD_MOROZ_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_RULE" Then
    Set f = New frmITTD_RULE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_PLTYPE" Then
    Set f = New frmITTD_PLTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_FACTORY" Then
    Set f = New frmITTD_FACTORY_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_ZTYPE" Then
    Set f = New frmITTD_ZTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_GTYPE" Then
    Set f = New frmITTD_GTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_KILLPLACE" Then
    Set f = New frmITTD_KILLPLACE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_COUNTRY" Then
    Set f = New frmITTD_COUNTRY_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_QTYPE" Then
    Set f = New frmITTD_QTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_CAMERA" Then
    Set f = New frmITTD_CAMERA_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_SRV" Then
    Set f = New frmITTD_SRV_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_ATYPE" Then
    Set f = New frmITTD_ATYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_OPTTYPE" Then
    Set f = New frmITTD_OPTTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_EMAIL" Then
    Set f = New frmITTD_EMAIL_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "ITTD_PART" Then
    Set f = New frmITTD_PART_main
  End If

 If Mode = "main" Then
 End If
 End If

 If Mode = "admi" Then
  If UCase(PartName) = "ITTD_MOROZ" Then
    Set f = New frmITTD_MOROZ_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_RULE" Then
    Set f = New frmITTD_RULE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_PLTYPE" Then
    Set f = New frmITTD_PLTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_FACTORY" Then
    Set f = New frmITTD_FACTORY_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_ZTYPE" Then
    Set f = New frmITTD_ZTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_GTYPE" Then
    Set f = New frmITTD_GTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_KILLPLACE" Then
    Set f = New frmITTD_KILLPLACE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_COUNTRY" Then
    Set f = New frmITTD_COUNTRY_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_QTYPE" Then
    Set f = New frmITTD_QTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_CAMERA" Then
    Set f = New frmITTD_CAMERA_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_SRV" Then
    Set f = New frmITTD_SRV_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_ATYPE" Then
    Set f = New frmITTD_ATYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_OPTTYPE" Then
    Set f = New frmITTD_OPTTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_EMAIL" Then
    Set f = New frmITTD_EMAIL_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "ITTD_PART" Then
    Set f = New frmITTD_PART_admi
  End If

 If Mode = "admi" Then
 End If
 End If

 If Mode = "read" Then
  If UCase(PartName) = "ITTD_MOROZ" Then
    Set f = New frmITTD_MOROZ_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_RULE" Then
    Set f = New frmITTD_RULE_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_PLTYPE" Then
    Set f = New frmITTD_PLTYPE_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_FACTORY" Then
    Set f = New frmITTD_FACTORY_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_ZTYPE" Then
    Set f = New frmITTD_ZTYPE_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_GTYPE" Then
    Set f = New frmITTD_GTYPE_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_KILLPLACE" Then
    Set f = New frmITTD_KILLPLACE_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_COUNTRY" Then
    Set f = New frmITTD_COUNTRY_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_QTYPE" Then
    Set f = New frmITTD_QTYPE_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_CAMERA" Then
    Set f = New frmITTD_CAMERA_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_SRV" Then
    Set f = New frmITTD_SRV_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_ATYPE" Then
    Set f = New frmITTD_ATYPE_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_OPTTYPE" Then
    Set f = New frmITTD_OPTTYPE_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_EMAIL" Then
    Set f = New frmITTD_EMAIL_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "ITTD_PART" Then
    Set f = New frmITTD_PART_read
  End If

 If Mode = "read" Then
 End If
 End If

 If Mode = "" Then
  If UCase(PartName) = "ITTD_MOROZ" Then
    Set f = New frmITTD_MOROZ_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_RULE" Then
    Set f = New frmITTD_RULE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_PLTYPE" Then
    Set f = New frmITTD_PLTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_FACTORY" Then
    Set f = New frmITTD_FACTORY_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_ZTYPE" Then
    Set f = New frmITTD_ZTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_GTYPE" Then
    Set f = New frmITTD_GTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_KILLPLACE" Then
    Set f = New frmITTD_KILLPLACE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_COUNTRY" Then
    Set f = New frmITTD_COUNTRY_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_QTYPE" Then
    Set f = New frmITTD_QTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_CAMERA" Then
    Set f = New frmITTD_CAMERA_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_SRV" Then
    Set f = New frmITTD_SRV_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_ATYPE" Then
    Set f = New frmITTD_ATYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_OPTTYPE" Then
    Set f = New frmITTD_OPTTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_EMAIL" Then
    Set f = New frmITTD_EMAIL_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "ITTD_PART" Then
    Set f = New frmITTD_PART_
  End If

 If Mode = "" Then
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




