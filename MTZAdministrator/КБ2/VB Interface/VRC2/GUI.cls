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
 App.Title = "Контрагент"
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
Private Function FindForm(ByVal InstanceID As String, ByVal mode As String) As Object
  Dim f As OpenFormInfo
  For Each f In openForms
    If f.InstanceID = InstanceID And f.mode = mode And f.modal = False Then
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
Public Sub EraseForm(ByVal InstanceID As String, ByVal mode As String, ByVal ModalMode As Boolean)
    On Error Resume Next
    Dim f As OpenFormInfo
    Dim i As Long, cnt As Long
    i = 1
    cnt = FormCount(InstanceID)
    For Each f In openForms
      If f.InstanceID = InstanceID And f.mode = mode And f.modal = ModalMode Then
        GoTo found
      End If
      i = i + 1
    Next
    Exit Sub
found:
    openForms.Remove i
    With f.Form
      If Not .item Is Nothing Then
         .item.Manager.FreeInstanceObject .item.ID
      End If
    End With
    Set f.Form.Host = Nothing
End Sub
Public Property Get IsModal() As Boolean
 IsModal = mOpenModal
End Property
Public Sub Show(ByVal inMode As String, ObjItem As Object, Optional OpenModal As Boolean = False)
 Dim f As Form
 Dim defaccess As Boolean
 Dim mode As String
 On Error Resume Next
 mode = inMode
 mOpenModal = OpenModal
 App.Title = ObjItem.brief & " (тип: Контрагент)"
 defaccess = ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "OPEN")
If Not OpenModal Then
If mode = "" Then
  If ObjItem.VRCCommonInfo.Count = 1 Then
    If ObjItem.VRCCommonInfo.item(1).isPhizical = -1 Then
      mode = "phiz"
    Else
      mode = "ur"
    End If
  End If
End If


If mode = "ur" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRC2:ur")) Then
   Set opf = FindForm(ObjItem.ID, mode)
   If opf Is Nothing Then
     Set f = New frmur_main
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.mode = mode
     opf.modal = OpenModal
     openForms.Add opf
   End If
   Set f = opf.Form
   f.Init ObjItem, Me, OpenModal
   f.Show
   f.WindowState = 0
   Exit Sub
  Else
   mode = ""
  End If
End If
If mode = "main" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRC2:main")) Then
   Set opf = FindForm(ObjItem.ID, mode)
   If opf Is Nothing Then
     Set f = New frmmain_main
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.mode = mode
     opf.modal = OpenModal
     openForms.Add opf
   End If
   Set f = opf.Form
   f.Init ObjItem, Me, OpenModal
   f.Show
   f.WindowState = 0
   Exit Sub
  Else
   mode = ""
  End If
End If
If mode = "phiz" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRC2:phiz")) Then
   Set opf = FindForm(ObjItem.ID, mode)
   If opf Is Nothing Then
     Set f = New frmphiz_main
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.mode = mode
     opf.modal = OpenModal
     openForms.Add opf
   End If
   Set f = opf.Form
   f.Init ObjItem, Me, OpenModal
   f.Show
   f.WindowState = 0
   Exit Sub
  Else
   mode = ""
  End If
End If
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRC2:")) Then
   Set opf = FindForm(ObjItem.ID, mode)
   If opf Is Nothing Then
     Set f = New frm_main
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.mode = mode
     opf.modal = OpenModal
     openForms.Add opf
   End If
   Set f = opf.Form
   f.Init ObjItem, Me, OpenModal
   f.Show
   f.WindowState = 0
  Else
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Контрагент"
  End If
End If
If OpenModal Then
  If mode = "" Then
    If ObjItem.VRCCommonInfo.Count = 1 Then
      If ObjItem.VRCCommonInfo.item(1).isPhizical = -1 Then
        mode = "phiz"
      Else
        mode = "ur"
      End If
    End If
  End If
If mode = "ur" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRC2:ur")) Then
     Set f = New frmur_main
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.mode = mode
     opf.modal = OpenModal
     openForms.Add opf
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     mode = ""
  End If
End If
If mode = "main" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRC2:main")) Then
     Set f = New frmmain_main
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.mode = mode
     opf.modal = OpenModal
     openForms.Add opf
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     mode = ""
  End If
End If
If mode = "phiz" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRC2:phiz")) Then
     Set f = New frmphiz_main
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.mode = mode
     opf.modal = OpenModal
     openForms.Add opf
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     mode = ""
  End If
End If
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRC2:")) Then
    Set f = New frm_main
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.mode = mode
     opf.modal = OpenModal
     openForms.Add opf
   f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
  Else
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Контрагент"
  End If
End If
End Sub
Public Function ShowAddForm(ByVal mode As String, RowItem As Object) As Boolean
 Dim f As Form
 Dim OK As Boolean
 On Error Resume Next
 Set f = Nothing
 Dim PartName As String
 PartName = TypeName(RowItem)

 If mode = "ur" Then
  If UCase(PartName) = "VRCACCOUNTS" Then
    Set f = New frmVRCAccounts_ur
  End If

 If mode = "ur" Then
 End If
  If UCase(PartName) = "VRCADITIONAL" Then
    Set f = New frmVRCAditional_ur
  End If

 If mode = "ur" Then
 End If
  If UCase(PartName) = "VRC_DOGS" Then
    Set f = New frmVRC_DOGS_ur
  End If

 If mode = "ur" Then
 End If
  If UCase(PartName) = "VRCTARIF" Then
    Set f = New frmVRCTarif_ur
  End If

 If mode = "ur" Then
 End If
  If UCase(PartName) = "VRCCOMMONINFO" Then
    Set f = New frmVRCCommonInfo_ur
  End If

 If mode = "ur" Then
 End If
 End If

 If mode = "main" Then
  If UCase(PartName) = "VRCACCOUNTS" Then
    Set f = New frmVRCAccounts_main
  End If

 If mode = "main" Then
 End If
  If UCase(PartName) = "VRCADITIONAL" Then
    Set f = New frmVRCAditional_main
  End If

 If mode = "main" Then
 End If
  If UCase(PartName) = "VRC_DOGS" Then
    Set f = New frmVRC_DOGS_main
  End If

 If mode = "main" Then
 End If
  If UCase(PartName) = "VRCTARIF" Then
    Set f = New frmVRCTarif_main
  End If

 If mode = "main" Then
 End If
  If UCase(PartName) = "VRCCOMMONINFO" Then
    Set f = New frmVRCCommonInfo_main
  End If

 If mode = "main" Then
 End If
 End If

 If mode = "phiz" Then
  If UCase(PartName) = "VRCADITIONAL" Then
    Set f = New frmVRCAditional_phiz
  End If

 If mode = "phiz" Then
 End If
  If UCase(PartName) = "VRC_DOGS" Then
    Set f = New frmVRC_DOGS_phiz
  End If

 If mode = "phiz" Then
 End If
  If UCase(PartName) = "VRCTARIF" Then
    Set f = New frmVRCTarif_phiz
  End If

 If mode = "phiz" Then
 End If
  If UCase(PartName) = "VRCCOMMONINFO" Then
    Set f = New frmVRCCommonInfo_phiz
  End If

 If mode = "phiz" Then
 End If
 End If

 If mode = "" Then
  If UCase(PartName) = "VRCACCOUNTS" Then
    Set f = New frmVRCAccounts_
  End If

 If mode = "" Then
 End If
  If UCase(PartName) = "VRCTORG" Then
    Set f = New frmVRCTorg_
  End If

 If mode = "" Then
 End If
  If UCase(PartName) = "VRCADITIONAL" Then
    Set f = New frmVRCAditional_
  End If

 If mode = "" Then
 End If
  If UCase(PartName) = "VRC_1CLINK" Then
    Set f = New frmVRC_1CLINK_
  End If

 If mode = "" Then
 End If
  If UCase(PartName) = "VRC_DOGS" Then
    Set f = New frmVRC_DOGS_
  End If

 If mode = "" Then
 End If
  If UCase(PartName) = "VRCTARIF" Then
    Set f = New frmVRCTarif_
  End If

 If mode = "" Then
 End If
  If UCase(PartName) = "VRCCOMMONINFO" Then
    Set f = New frmVRCCommonInfo_
  End If

 If mode = "" Then
 End If
 End If
  If f Is Nothing Then
    OK = False
  Else

    Set f.item = RowItem
    f.OnInit
    f.Show vbModal
    Set f.item = Nothing
    OK = f.OK
    Unload f
    Set f = Nothing
  End If
  ShowAddForm = OK
End Function




