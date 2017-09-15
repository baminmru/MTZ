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
Public Function GUIPath() As String
    GUIPath = App.Path & "\" & App.EXEName & ".ocx"
End Function

Private Sub Class_Initialize()
 Set openForms = New Collection
 App.Title = "Описание функции процесса"
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
      If Not .item Is Nothing Then
         .item.Manager.FreeInstanceObject .item.ID
      End If
    End With
    Set f.Form.Host = Nothing
End Sub
Public Property Get IsModal() As Boolean
 IsModal = mOpenModal
End Property
Public Sub Show(ByVal Mode As String, ObjItem As Object, Optional OpenModal As Boolean = False)
 Dim f As Form
 On Error Resume Next
 mOpenModal = OpenModal
 App.Title = ObjItem.Brief & " (тип: Описание функции процесса)"
If Not OpenModal Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD:") Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Описание функции процесса"
  End If
End If
If OpenModal Then
If Mode = "M001" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmNameOnly
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
If Mode = "M002" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVarVal
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
If Mode = "M003" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVarVar
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
If Mode = "M004" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVar
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

If Mode = "M005" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVal
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
     f.ValName = "Имя подпроцесса:"
     f.CheckNumber = False
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     Mode = ""
  End If
End If

If Mode = "M006" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVal
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
     f.ValName = "Год (2004):"
     f.CheckNumber = True
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     Mode = ""
  End If
End If

If Mode = "M007" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVal
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
     f.ValName = "Месяц (1-12):"
     f.CheckNumber = True
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     Mode = ""
  End If
End If

If Mode = "M008" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVal
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
     f.ValName = "День (1-31):"
     f.CheckNumber = True
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     Mode = ""
  End If
End If

If Mode = "M009" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVal
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
     f.ValName = "Час (0-23):"
     f.CheckNumber = True
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     Mode = ""
  End If
End If

If Mode = "M010" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVal
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
     f.ValName = "Минута (0-59):"
     f.CheckNumber = True
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     Mode = ""
  End If
End If

If Mode = "M011" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmDocPart
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

If Mode = "M012" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmDoc
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

If Mode = "M013" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmDocPartVar
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

If Mode = "M014" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmFldVar
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

If Mode = "M015" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmFldWait
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

If Mode = "M016" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmPRCDOC
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


If Mode = "M017" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmPRCVAR
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

If Mode = "M018" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmNewPRC
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


If Mode = "M019" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmEvent
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


If Mode = "M020" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmDOCEVENT
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


If Mode = "M021" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmDocVar
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

If Mode = "M022" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmDocSecure
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

If Mode = "M023" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmDocFolder
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


If Mode = "M024" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVal
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
     f.ValName = "Название события:"
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     Mode = ""
  End If
End If

If Mode = "M025" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmPulse
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
     f.ValName = "Интервал повторного запуска:"
     f.CheckNumber = True
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     Mode = ""
  End If
End If


If Mode = "M026" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVal
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
     f.ValName = "Количество минут:"
     f.CheckNumber = True
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     Mode = ""
  End If
End If
If Mode = "M027" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmVal
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.ID
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
     f.ValName = "Название события:"
     f.CheckNumber = False
     f.Init ObjItem, Me, OpenModal
     f.Show vbModal
     Unload f
     Set f = Nothing
     Exit Sub
  Else
     Mode = ""
  End If
End If

If Mode = "M028" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmDOCROBOT
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


If Mode = "M029" Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD") Then
     Set f = New frmDocState
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




  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "WFFD:") Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Описание функции процесса"
  End If
End If
End Sub

