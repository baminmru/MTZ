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
 App.Title = "Заявка"
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
 App.Title = ObjItem.Brief & " (тип: Заявка)"
 defaccess = ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "OPEN")
If Not OpenModal Then
If Mode = "prnt" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:prnt")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmprnt_main
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
If Mode = "path" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:path")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmpath_main
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:read")) Then
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
If Mode = "main" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:main")) Then
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
If Mode = "sent" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:sent")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmsent_main
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
If Mode = "done" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:done")) Then
   Set opf = FindForm(ObjItem.ID, Mode)
   If opf Is Nothing Then
     Set f = New frmdone_main
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Заявка"
  End If
End If
If OpenModal Then
If Mode = "prnt" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:prnt")) Then
     Set f = New frmprnt_main
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
If Mode = "path" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:path")) Then
     Set f = New frmpath_main
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:read")) Then
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
If Mode = "main" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:main")) Then
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
If Mode = "sent" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:sent")) Then
     Set f = New frmsent_main
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
If Mode = "done" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:done")) Then
     Set f = New frmdone_main
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "PEK2Z:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Заявка"
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

 If Mode = "prnt" Then
  If UCase(PartName) = "PEKZ_PATH" Then
    Set f = New frmpekz_path_prnt
  End If

 If Mode = "prnt" Then
  If UCase(PartName) = "PEKZ_WLIST" Then
    Set f = New frmPEKZ_WLIST_prnt
  End If

 If Mode = "prnt" Then
 End If
 End If
  If UCase(PartName) = "PEKZ_DEF" Then
    Set f = New frmpekz_def_prnt
  End If

 If Mode = "prnt" Then
 End If
  If UCase(PartName) = "PEKZ_ACLCT" Then
    Set f = New frmPEKZ_ACLCT_prnt
  End If

 If Mode = "prnt" Then
 End If
  If UCase(PartName) = "PEKZ_ADLVR" Then
    Set f = New frmPEKZ_ADLVR_prnt
  End If

 If Mode = "prnt" Then
 End If
  If UCase(PartName) = "PEKZ_DOP" Then
    Set f = New frmpekz_dop_prnt
  End If

 If Mode = "prnt" Then
 End If
 End If

 If Mode = "path" Then
  If UCase(PartName) = "PEKZ_PATH" Then
    Set f = New frmpekz_path_path
  End If

 If Mode = "path" Then
  If UCase(PartName) = "PEKZ_WLIST" Then
    Set f = New frmPEKZ_WLIST_path
  End If

 If Mode = "path" Then
 End If
 End If
  If UCase(PartName) = "PEKZ_DEF" Then
    Set f = New frmpekz_def_path
  End If

 If Mode = "path" Then
 End If
  If UCase(PartName) = "PEKZ_ACLCT" Then
    Set f = New frmPEKZ_ACLCT_path
  End If

 If Mode = "path" Then
 End If
  If UCase(PartName) = "PEKZ_ADLVR" Then
    Set f = New frmPEKZ_ADLVR_path
  End If

 If Mode = "path" Then
 End If
  If UCase(PartName) = "PEKZ_DOP" Then
    Set f = New frmpekz_dop_path
  End If

 If Mode = "path" Then
 End If
 End If

 If Mode = "read" Then
  If UCase(PartName) = "PEKZ_PATH" Then
    Set f = New frmpekz_path_read
  End If

 If Mode = "read" Then
  If UCase(PartName) = "PEKZ_WLIST" Then
    Set f = New frmPEKZ_WLIST_read
  End If

 If Mode = "read" Then
 End If
 End If
  If UCase(PartName) = "PEKZ_DEF" Then
    Set f = New frmpekz_def_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "PEKZ_ACLCT" Then
    Set f = New frmPEKZ_ACLCT_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "PEKZ_ADLVR" Then
    Set f = New frmPEKZ_ADLVR_read
  End If

 If Mode = "read" Then
 End If
  If UCase(PartName) = "PEKZ_DOP" Then
    Set f = New frmpekz_dop_read
  End If

 If Mode = "read" Then
 End If
 End If

 If Mode = "main" Then
  If UCase(PartName) = "PEKZ_PATH" Then
    Set f = New frmpekz_path_main
  End If

 If Mode = "main" Then
  If UCase(PartName) = "PEKZ_WLIST" Then
    Set f = New frmPEKZ_WLIST_main
  End If

 If Mode = "main" Then
 End If
 End If
  If UCase(PartName) = "PEKZ_DEF" Then
    Set f = New frmpekz_def_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKZ_ACLCT" Then
    Set f = New frmPEKZ_ACLCT_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKZ_ADLVR" Then
    Set f = New frmPEKZ_ADLVR_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "PEKZ_DOP" Then
    Set f = New frmpekz_dop_main
  End If

 If Mode = "main" Then
 End If
 End If

 If Mode = "sent" Then
  If UCase(PartName) = "PEKZ_PATH" Then
    Set f = New frmpekz_path_sent
  End If

 If Mode = "sent" Then
  If UCase(PartName) = "PEKZ_WLIST" Then
    Set f = New frmPEKZ_WLIST_sent
  End If

 If Mode = "sent" Then
 End If
 End If
  If UCase(PartName) = "PEKZ_DEF" Then
    Set f = New frmpekz_def_sent
  End If

 If Mode = "sent" Then
 End If
  If UCase(PartName) = "PEKZ_ACLCT" Then
    Set f = New frmPEKZ_ACLCT_sent
  End If

 If Mode = "sent" Then
 End If
  If UCase(PartName) = "PEKZ_ADLVR" Then
    Set f = New frmPEKZ_ADLVR_sent
  End If

 If Mode = "sent" Then
 End If
  If UCase(PartName) = "PEKZ_DOP" Then
    Set f = New frmpekz_dop_sent
  End If

 If Mode = "sent" Then
 End If
 End If

 If Mode = "done" Then
  If UCase(PartName) = "PEKZ_PATH" Then
    Set f = New frmpekz_path_done
  End If

 If Mode = "done" Then
  If UCase(PartName) = "PEKZ_WLIST" Then
    Set f = New frmPEKZ_WLIST_done
  End If

 If Mode = "done" Then
 End If
 End If
  If UCase(PartName) = "PEKZ_DEF" Then
    Set f = New frmpekz_def_done
  End If

 If Mode = "done" Then
 End If
  If UCase(PartName) = "PEKZ_ACLCT" Then
    Set f = New frmPEKZ_ACLCT_done
  End If

 If Mode = "done" Then
 End If
  If UCase(PartName) = "PEKZ_ADLVR" Then
    Set f = New frmPEKZ_ADLVR_done
  End If

 If Mode = "done" Then
 End If
  If UCase(PartName) = "PEKZ_DOP" Then
    Set f = New frmpekz_dop_done
  End If

 If Mode = "done" Then
 End If
 End If

 If Mode = "" Then
  If UCase(PartName) = "PEKZ_PATH" Then
    Set f = New frmpekz_path_
  End If

 If Mode = "" Then
  If UCase(PartName) = "PEKZ_WLIST" Then
    Set f = New frmPEKZ_WLIST_
  End If

 If Mode = "" Then
 End If
 End If
  If UCase(PartName) = "PEKZ_DEF" Then
    Set f = New frmpekz_def_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKZ_ACLCT" Then
    Set f = New frmPEKZ_ACLCT_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKZ_ADLVR" Then
    Set f = New frmPEKZ_ADLVR_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "PEKZ_DOP" Then
    Set f = New frmpekz_dop_
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




