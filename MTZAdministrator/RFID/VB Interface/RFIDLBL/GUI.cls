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
Attribute VB_HelpID = 185
Option Explicit



Private mOpenModal As Boolean
Dim opf As OpenFormInfo
Dim openForms As Collection





Private Sub Class_Initialize()
 Set openForms = New Collection
 App.Title = "Метки"
End Sub

Private Sub Class_Terminate()
  On Error Resume Next
CloseClass
End Sub
Public Sub CloseClass()
Attribute CloseClass.VB_HelpID = 190
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
Attribute GUIPath.VB_HelpID = 205
    GUIPath = App.Path & "\" & App.EXEName & ".ocx"
End Function
Public Function FormCount(ByVal InstanceID As String) As Long
Attribute FormCount.VB_HelpID = 200
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
Attribute EraseForm.VB_HelpID = 195
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
Attribute IsModal.VB_HelpID = 210
 IsModal = mOpenModal
End Property
Public Sub Show(ByVal Mode As String, ObjItem As Object, Optional OpenModal As Boolean = False)
Attribute Show.VB_HelpID = 215
 Dim f As Form
 Dim defaccess As Boolean
 On Error Resume Next
 mOpenModal = OpenModal
 App.Title = ObjItem.brief & " (тип: Метки)"
 defaccess = ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "OPEN")
If Not OpenModal Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "RFIDLBL:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Метки"
  End If
End If
If OpenModal Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "RFIDLBL:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Метки"
  End If
End If
End Sub
Public Function ShowAddForm(ByVal Mode As String, RowItem As Object) As Boolean
Attribute ShowAddForm.VB_HelpID = 220
 Dim f As Form
 Dim OK As Boolean
 On Error Resume Next
 Set f = Nothing
 Dim PartName As String
 PartName = TypeName(RowItem)

 If Mode = "" Then
  If UCase(PartName) = "RFIDLBD_INFO" Then
    Set f = New frmRFIDLBD_INFO_
  End If

 If Mode = "" Then
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




