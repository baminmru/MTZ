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
 App.Title = "Справочник: работа с клиентами"
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
 App.Title = ObjItem.Brief & " (тип: Справочник: работа с клиентами)"
 defaccess = ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "OPEN")
If Not OpenModal Then
If Mode = "admi" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRD2:admi")) Then
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRD2:main")) Then
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRD2:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Справочник: работа с клиентами"
  End If
End If
If OpenModal Then
If Mode = "admi" Then
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRD2:admi")) Then
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRD2:main")) Then
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
  If defaccess Or ((Not defaccess) And ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, "VRD2:")) Then
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
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, "Справочник: работа с клиентами"
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
  If UCase(PartName) = "VRDCONTRACTSTAGE" Then
    Set f = New frmVRDContractStage_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "VRD_COMPINFO" Then
    Set f = New frmVRD_CompInfo_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "VRDRREPORTTYPE" Then
    Set f = New frmVRDRreportType_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "VRDPRJTYPE" Then
    Set f = New frmVRDPrjType_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "VRDSTREAM" Then
    Set f = New frmVRDStream_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "VRDINTEREST" Then
    Set f = New frmVRDInterest_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "VRDDOCTYPE" Then
    Set f = New frmVRDDocType_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "VRDLOYALTY" Then
    Set f = New frmVRDLoyalty_admi
  End If

 If Mode = "admi" Then
 End If
  If UCase(PartName) = "VRDMARKET" Then
    Set f = New frmVRDMarket_admi
  End If

 If Mode = "admi" Then
 End If
 End If

 If Mode = "main" Then
  If UCase(PartName) = "VRDCONTRACTSTAGE" Then
    Set f = New frmVRDContractStage_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "VRD_COMPINFO" Then
    Set f = New frmVRD_CompInfo_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "VRDRREPORTTYPE" Then
    Set f = New frmVRDRreportType_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "VRDPRJTYPE" Then
    Set f = New frmVRDPrjType_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "VRDSTREAM" Then
    Set f = New frmVRDStream_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "VRDINTEREST" Then
    Set f = New frmVRDInterest_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "VRDDOCTYPE" Then
    Set f = New frmVRDDocType_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "VRDLOYALTY" Then
    Set f = New frmVRDLoyalty_main
  End If

 If Mode = "main" Then
 End If
  If UCase(PartName) = "VRDMARKET" Then
    Set f = New frmVRDMarket_main
  End If

 If Mode = "main" Then
 End If
 End If

 If Mode = "" Then
  If UCase(PartName) = "VRDCONTRACTSTAGE" Then
    Set f = New frmVRDContractStage_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "VRD_COMPINFO" Then
    Set f = New frmVRD_CompInfo_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "VRDRREPORTTYPE" Then
    Set f = New frmVRDRreportType_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "VRDPRJTYPE" Then
    Set f = New frmVRDPrjType_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "VRDSTREAM" Then
    Set f = New frmVRDStream_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "VRDINTEREST" Then
    Set f = New frmVRDInterest_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "VRDDOCTYPE" Then
    Set f = New frmVRDDocType_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "VRDLOYALTY" Then
    Set f = New frmVRDLoyalty_
  End If

 If Mode = "" Then
 End If
  If UCase(PartName) = "VRDMARKET" Then
    Set f = New frmVRDMarket_
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




