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



Private mOpenModal As Boolean
Dim opf As OpenFormInfo
Dim openForms As Collection





Private Sub Class_Initialize()
 Set openForms = New Collection
 App.Title = "Справочник"
End Sub

Private Sub Class_Terminate()
  On Error Resume Next
CloseClass
End Sub
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
Private Function FindForm(ByVal InstanceID As String, ByVal Mode As String) As Object
  Dim f As OpenFormInfo
  For Each f In openForms
    If f.InstanceID = InstanceID And f.Mode = Mode And f.modal = False Then
      Set FindForm = f
      Exit Function
    End If
  Next
End Function
Public Function GUIPath() As String
    GUIPath = App.Path & "\" & App.EXEName & ".ocx"
End Function
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
Public Property Get IsModal() As Boolean
 IsModal = mOpenModal
End Property
Public Sub Show(ByVal Mode As String, ObjItem As Object, Optional OpenModal As Boolean = False)
 Dim f As Form
 Dim defaccess As Boolean
 On Error Resume Next
 mOpenModal = OpenModal
 App.Title = ObjItem.Brief & " (тип: Справочник)"
 defaccess = ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "OPEN")
If Not OpenModal Then
If Mode = "main" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WMSD:main")) Then
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WMSD:admi")) Then
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WMSD:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Справочник"
  End If
End If
If OpenModal Then
If Mode = "main" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WMSD:main")) Then
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WMSD:admi")) Then
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WMSD:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Справочник"
  End If
End If
End Sub
Public Function ShowAddForm(ByVal Mode As String, RowItem As Object) As Boolean
 Dim f As Form
 Dim OK As Boolean
 On Error Resume Next
 Set f = Nothing
 Dim PartName As String
 PartName = TypeName(RowItem)

 If Mode = "main" Then
  If UCase(PartName) = "WMSD_GTYPE" Then
    Set f = New frmWMSD_GTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_ZTYPE" Then
    Set f = New frmWMSD_ZTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_PLTYPE" Then
    Set f = New frmWMSD_PLTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_QTYPE" Then
    Set f = New frmWMSD_QTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_ATYPE" Then
    Set f = New frmWMSD_ATYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_SRV" Then
    Set f = New frmWMSD_SRV_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_PART" Then
    Set f = New frmWMSD_PART_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_FACTORY" Then
    Set f = New frmWMSD_FACTORY_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_KILLPLACE" Then
    Set f = New frmWMSD_KILLPLACE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_COUNTRY" Then
    Set f = New frmWMSD_COUNTRY_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_CAMERA" Then
    Set f = New frmWMSD_CAMERA_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_RULE" Then
    Set f = New frmWMSD_RULE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_OPTTYPE" Then
    Set f = New frmWMSD_OPTTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_MOROZ" Then
    Set f = New frmWMSD_MOROZ_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_WH" Then
    Set f = New frmWMSD_WH_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "WMSD_EI" Then
    Set f = New frmWMSD_EI_main
  End If

 If Mode = "main" Then
 End If
 End If

 If Mode = "admi" Then
  If UCase(PartName) = "WMSD_GTYPE" Then
    Set f = New frmWMSD_GTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_ZTYPE" Then
    Set f = New frmWMSD_ZTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_PLTYPE" Then
    Set f = New frmWMSD_PLTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_QTYPE" Then
    Set f = New frmWMSD_QTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_ATYPE" Then
    Set f = New frmWMSD_ATYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_SRV" Then
    Set f = New frmWMSD_SRV_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_PART" Then
    Set f = New frmWMSD_PART_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_FACTORY" Then
    Set f = New frmWMSD_FACTORY_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_KILLPLACE" Then
    Set f = New frmWMSD_KILLPLACE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_COUNTRY" Then
    Set f = New frmWMSD_COUNTRY_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_CAMERA" Then
    Set f = New frmWMSD_CAMERA_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_RULE" Then
    Set f = New frmWMSD_RULE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_OPTTYPE" Then
    Set f = New frmWMSD_OPTTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_MOROZ" Then
    Set f = New frmWMSD_MOROZ_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_WH" Then
    Set f = New frmWMSD_WH_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "WMSD_EI" Then
    Set f = New frmWMSD_EI_admi
  End If

 If Mode = "admi" Then
 End If
 End If

 If Mode = "" Then
  If UCase(PartName) = "WMSD_GTYPE" Then
    Set f = New frmWMSD_GTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_ZTYPE" Then
    Set f = New frmWMSD_ZTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_PLTYPE" Then
    Set f = New frmWMSD_PLTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_QTYPE" Then
    Set f = New frmWMSD_QTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_ATYPE" Then
    Set f = New frmWMSD_ATYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_SRV" Then
    Set f = New frmWMSD_SRV_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_PART" Then
    Set f = New frmWMSD_PART_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_FACTORY" Then
    Set f = New frmWMSD_FACTORY_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_KILLPLACE" Then
    Set f = New frmWMSD_KILLPLACE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_COUNTRY" Then
    Set f = New frmWMSD_COUNTRY_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_CAMERA" Then
    Set f = New frmWMSD_CAMERA_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_RULE" Then
    Set f = New frmWMSD_RULE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_OPTTYPE" Then
    Set f = New frmWMSD_OPTTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_MOROZ" Then
    Set f = New frmWMSD_MOROZ_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_WH" Then
    Set f = New frmWMSD_WH_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "WMSD_EI" Then
    Set f = New frmWMSD_EI_
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




