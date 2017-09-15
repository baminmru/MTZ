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
 App.Title = "Отчет"
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
 App.Title = ObjItem.Brief & " (тип: Отчет)"
 defaccess = ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "OPEN")
If Not OpenModal Then
If Mode = "CONT" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:CONT")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmCONT_main
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
If Mode = "dflt" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:dflt")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmdflt_main
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
If Mode = "PRJ" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:PRJ")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmPRJ_main
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
If Mode = "PERS" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:PERS")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmPERS_main
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
If Mode = "CLNT" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:CLNT")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmCLNT_main
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Отчет"
  End If
End If
If OpenModal Then
If Mode = "CONT" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:CONT")) Then
     Set f = New frmCONT_main
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
If Mode = "dflt" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:dflt")) Then
     Set f = New frmdflt_main
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
If Mode = "PRJ" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:PRJ")) Then
     Set f = New frmPRJ_main
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
If Mode = "PERS" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:PERS")) Then
     Set f = New frmPERS_main
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
If Mode = "CLNT" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:CLNT")) Then
     Set f = New frmCLNT_main
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRRPT2:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Отчет"
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

 If Mode = "CONT" Then
  If UCase(PartName) = "VRRPT_COSTS" Then
    Set f = New frmVRRPT_COSTS_CONT
  End If

 If Mode = "CONT" Then
 End If
  If UCase(PartName) = "VRRPT_MEETINGPLAN" Then
    Set f = New frmVRRPT_MeetingPlan_CONT
  End If

 If Mode = "CONT" Then
  If UCase(PartName) = "VRRPT_MEETERS" Then
    Set f = New frmVRRPT_Meeters_CONT
  End If

 If Mode = "CONT" Then
 End If
 End If
  If UCase(PartName) = "VRRPT_MAIN" Then
    Set f = New frmVRRPT_MAIN_CONT
  End If

 If Mode = "CONT" Then
 End If
 End If

 If Mode = "dflt" Then
  If UCase(PartName) = "VRRPT_COSTS" Then
    Set f = New frmVRRPT_COSTS_dflt
  End If

 If Mode = "dflt" Then
 End If
  If UCase(PartName) = "VRRPT_MEETINGPLAN" Then
    Set f = New frmVRRPT_MeetingPlan_dflt
  End If

 If Mode = "dflt" Then
  If UCase(PartName) = "VRRPT_MEETERS" Then
    Set f = New frmVRRPT_Meeters_dflt
  End If

 If Mode = "dflt" Then
 End If
 End If
  If UCase(PartName) = "VRRPT_MAIN" Then
    Set f = New frmVRRPT_MAIN_dflt
  End If

 If Mode = "dflt" Then
 End If
 End If

 If Mode = "PRJ" Then
  If UCase(PartName) = "VRRPT_COSTS" Then
    Set f = New frmVRRPT_COSTS_PRJ
  End If

 If Mode = "PRJ" Then
 End If
  If UCase(PartName) = "VRRPT_MEETINGPLAN" Then
    Set f = New frmVRRPT_MeetingPlan_PRJ
  End If

 If Mode = "PRJ" Then
  If UCase(PartName) = "VRRPT_MEETERS" Then
    Set f = New frmVRRPT_Meeters_PRJ
  End If

 If Mode = "PRJ" Then
 End If
 End If
  If UCase(PartName) = "VRRPT_MAIN" Then
    Set f = New frmVRRPT_MAIN_PRJ
  End If

 If Mode = "PRJ" Then
 End If
 End If

 If Mode = "PERS" Then
  If UCase(PartName) = "VRRPT_COSTS" Then
    Set f = New frmVRRPT_COSTS_PERS
  End If

 If Mode = "PERS" Then
 End If
  If UCase(PartName) = "VRRPT_MEETINGPLAN" Then
    Set f = New frmVRRPT_MeetingPlan_PERS
  End If

 If Mode = "PERS" Then
  If UCase(PartName) = "VRRPT_MEETERS" Then
    Set f = New frmVRRPT_Meeters_PERS
  End If

 If Mode = "PERS" Then
 End If
 End If
  If UCase(PartName) = "VRRPT_MAIN" Then
    Set f = New frmVRRPT_MAIN_PERS
  End If

 If Mode = "PERS" Then
 End If
 End If

 If Mode = "CLNT" Then
  If UCase(PartName) = "VRRPT_COSTS" Then
    Set f = New frmVRRPT_COSTS_CLNT
  End If

 If Mode = "CLNT" Then
 End If
  If UCase(PartName) = "VRRPT_MEETINGPLAN" Then
    Set f = New frmVRRPT_MeetingPlan_CLNT
  End If

 If Mode = "CLNT" Then
  If UCase(PartName) = "VRRPT_MEETERS" Then
    Set f = New frmVRRPT_Meeters_CLNT
  End If

 If Mode = "CLNT" Then
 End If
 End If
  If UCase(PartName) = "VRRPT_MAIN" Then
    Set f = New frmVRRPT_MAIN_CLNT
  End If

 If Mode = "CLNT" Then
 End If
 End If

 If Mode = "" Then
  If UCase(PartName) = "VRRPT_COSTS" Then
    Set f = New frmVRRPT_COSTS_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "VRRPT_MEETINGPLAN" Then
    Set f = New frmVRRPT_MeetingPlan_
  End If

 If Mode = "" Then
  If UCase(PartName) = "VRRPT_MEETERS" Then
    Set f = New frmVRRPT_Meeters_
  End If

 If Mode = "" Then
 End If
 End If
  If UCase(PartName) = "VRRPT_MAIN" Then
    Set f = New frmVRRPT_MAIN_
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




