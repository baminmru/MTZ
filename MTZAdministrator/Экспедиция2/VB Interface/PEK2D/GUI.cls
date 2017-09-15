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
 App.Title = "Справочники: Экспедиция"
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
 App.Title = ObjItem.Brief & " (тип: Справочники: Экспедиция)"
 defaccess = ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "OPEN")
If Not OpenModal Then
If Mode = "admi" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2D:admi")) Then
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
If Mode = "main" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2D:main")) Then
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2D:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Справочники: Экспедиция"
  End If
End If
If OpenModal Then
If Mode = "admi" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2D:admi")) Then
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
If Mode = "main" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2D:main")) Then
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2D:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Справочники: Экспедиция"
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

 If Mode = "admi" Then
  If UCase(PartName) = "PEKD_ADDS" Then
    Set f = New frmPEKD_ADDS_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_TRAINTYPE" Then
    Set f = New frmPEKD_TRAINTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_AUTO" Then
    Set f = New frmPEKD_AUTO_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_GOTYPE" Then
    Set f = New frmPEKD_GOTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_INFOSENDTYPE" Then
    Set f = New frmPEKD_INFOSENDTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_TRTYPE" Then
    Set f = New frmPEKD_TRTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_GRPDPUSL" Then
    Set f = New frmPEKD_GRPDpUSL_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_1CTR" Then
    Set f = New frmPEKD_1CTR_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_POSTTYPE" Then
    Set f = New frmPEKD_POSTTYPE_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_TRFGRP" Then
    Set f = New frmPEKD_TRFGRP_admi
  End If

 If Mode = "admi" Then
  If UCase(PartName) = "PEKD_TRFTYPE" Then
    Set f = New frmPEKD_TRFTYPE_admi
  End If

 If Mode = "admi" Then
 End If
 End If
  If UCase(PartName) = "PEKD_DEPT" Then
    Set f = New frmPEKD_DEPT_admi
  End If

 If Mode = "admi" Then
  If UCase(PartName) = "PEKD_DEPLIMITS" Then
    Set f = New frmPEKD_DEPLIMITS_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_DEPDOG" Then
    Set f = New frmPEKD_DEPDOG_admi
  End If

 If Mode = "admi" Then
 End If
 End If
  If UCase(PartName) = "PEKD_DIRECTION" Then
    Set f = New frmPEKD_DIRECTION_admi
  End If

 If Mode = "admi" Then
  If UCase(PartName) = "PEKD_TRAINS" Then
    Set f = New frmPEKD_TRAINS_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "PEKD_DIRSTATION" Then
    Set f = New frmPEKD_DIRSTATION_admi
  End If

 If Mode = "admi" Then
 End If
 End If
  If UCase(PartName) = "PEKD_SRV" Then
    Set f = New frmPEKD_SRV_admi
  End If

 If Mode = "admi" Then
 End If
 End If

 If Mode = "main" Then
  If UCase(PartName) = "PEKD_ADDS" Then
    Set f = New frmPEKD_ADDS_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_TRAINTYPE" Then
    Set f = New frmPEKD_TRAINTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_AUTO" Then
    Set f = New frmPEKD_AUTO_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_GOTYPE" Then
    Set f = New frmPEKD_GOTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_INFOSENDTYPE" Then
    Set f = New frmPEKD_INFOSENDTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_TRTYPE" Then
    Set f = New frmPEKD_TRTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_GRPDPUSL" Then
    Set f = New frmPEKD_GRPDpUSL_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_1CTR" Then
    Set f = New frmPEKD_1CTR_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_POSTTYPE" Then
    Set f = New frmPEKD_POSTTYPE_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_TRFGRP" Then
    Set f = New frmPEKD_TRFGRP_main
  End If

 If Mode = "main" Then
  If UCase(PartName) = "PEKD_TRFTYPE" Then
    Set f = New frmPEKD_TRFTYPE_main
  End If

 If Mode = "main" Then
 End If
 End If
  If UCase(PartName) = "PEKD_DEPT" Then
    Set f = New frmPEKD_DEPT_main
  End If

 If Mode = "main" Then
  If UCase(PartName) = "PEKD_DEPLIMITS" Then
    Set f = New frmPEKD_DEPLIMITS_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_DEPDOG" Then
    Set f = New frmPEKD_DEPDOG_main
  End If

 If Mode = "main" Then
 End If
 End If
  If UCase(PartName) = "PEKD_DIRECTION" Then
    Set f = New frmPEKD_DIRECTION_main
  End If

 If Mode = "main" Then
  If UCase(PartName) = "PEKD_TRAINS" Then
    Set f = New frmPEKD_TRAINS_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKD_DIRSTATION" Then
    Set f = New frmPEKD_DIRSTATION_main
  End If

 If Mode = "main" Then
 End If
 End If
  If UCase(PartName) = "PEKD_SRV" Then
    Set f = New frmPEKD_SRV_main
  End If

 If Mode = "main" Then
 End If
 End If

 If Mode = "" Then
  If UCase(PartName) = "PEKD_ADDS" Then
    Set f = New frmPEKD_ADDS_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_TRAINTYPE" Then
    Set f = New frmPEKD_TRAINTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_AUTO" Then
    Set f = New frmPEKD_AUTO_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_GOTYPE" Then
    Set f = New frmPEKD_GOTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_INFOSENDTYPE" Then
    Set f = New frmPEKD_INFOSENDTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_TRTYPE" Then
    Set f = New frmPEKD_TRTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_GRPDPUSL" Then
    Set f = New frmPEKD_GRPDpUSL_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_1CTR" Then
    Set f = New frmPEKD_1CTR_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_POSTTYPE" Then
    Set f = New frmPEKD_POSTTYPE_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_TRFGRP" Then
    Set f = New frmPEKD_TRFGRP_
  End If

 If Mode = "" Then
  If UCase(PartName) = "PEKD_TRFTYPE" Then
    Set f = New frmPEKD_TRFTYPE_
  End If

 If Mode = "" Then
 End If
 End If
  If UCase(PartName) = "PEKD_DEPT" Then
    Set f = New frmPEKD_DEPT_
  End If

 If Mode = "" Then
  If UCase(PartName) = "PEKD_DEPLIMITS" Then
    Set f = New frmPEKD_DEPLIMITS_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_DEPDOG" Then
    Set f = New frmPEKD_DEPDOG_
  End If

 If Mode = "" Then
 End If
 End If
  If UCase(PartName) = "PEKD_DIRECTION" Then
    Set f = New frmPEKD_DIRECTION_
  End If

 If Mode = "" Then
  If UCase(PartName) = "PEKD_TRAINS" Then
    Set f = New frmPEKD_TRAINS_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKD_DIRSTATION" Then
    Set f = New frmPEKD_DIRSTATION_
  End If

 If Mode = "" Then
 End If
 End If
  If UCase(PartName) = "PEKD_SRV" Then
    Set f = New frmPEKD_SRV_
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




