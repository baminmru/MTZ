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
Attribute VB_Exposed = False
Option Explicit


Private mOpenModal As Boolean
Dim opf As OpenFormInfo
Dim openForms As Collection
Private m_Typename As String
Private STDTypeGUI As Object


Public Sub Init(ByVal tn As String)
m_Typename = tn
Set STDTypeGUI = CreateObject(tn & "GUI.GUI")
End Sub

Private Sub Class_Initialize()
 Set openForms = New Collection

 
End Sub

Private Sub Class_Terminate()
  On Error Resume Next
  CloseClass
End Sub

Public Function ShowAddForm(ByVal Mode As String, RowItem As Object) As Boolean
On Error Resume Next
ShowAddForm = STDTypeGUI.ShowAddForm(Mode, RowItem)
End Function
Public Sub CloseClass()
  Dim f As OpenFormInfo
  On Error Resume Next
  For Each f In openForms
      Set f.Form.Host = Nothing
      Unload f.Form
      Set f.Form = Nothing
  Next
  Set openForms = Nothing
  STDTypeGUI.CloseClass
  Set STDTypeGUI = Nothing
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
    FormCount = cnt + STDTypeGUI.FormCount(InstanceID)
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
    STDTypeGUI.EraseForm InstanceID, Mode, ModalMode
    Exit Sub
found:
    
    openForms.Remove i
    If Not f.Form Is Nothing Then
    With f.Form
      If Not .Item Is Nothing Then
         .Item.Manager.FreeInstanceObject .Item.id
      End If
    End With
    Set f.Form.Host = Nothing
    End If
    Set f.Form = Nothing
End Sub
Public Property Get IsModal() As Boolean
 IsModal = mOpenModal
End Property
Public Sub Show(ByVal Mode As String, ObjItem As Object, Optional OpenModal As Boolean = False)
 Dim f As Form
 On Error Resume Next
 mOpenModal = OpenModal
If Not OpenModal Then
  If ObjItem.MTZSession.CheckRight(ObjItem.SecureStyleID, m_Typename & ":" & Mode & ":" & ObjItem.StatusID) Then
   Set opf = FindForm(ObjItem.id, Mode)
   If opf Is Nothing Then
     Set f = New frmObj
     Set opf = New OpenFormInfo
     Set opf.Form = f
     opf.InstanceID = ObjItem.id
     opf.Mode = Mode
     opf.modal = OpenModal
     openForms.Add opf
   End If
   Set f = opf.Form
   Set f.Host = Me
   f.Init ObjItem, Mode
   f.Show
   f.WindowState = 0
   f.ZOrder 0
  Else
   MsgBox "Доступ к документу запрещен", vbOKOnly + vbCritical, ""
  End If
End If
If OpenModal Then
  STDTypeGUI.Show Mode, ObjItem, OpenModal
End If
End Sub

Public Function GuiPath() As String
On Error GoTo bye
GuiPath = STDTypeGUI.GuiPath
Exit Function
bye:
GuiPath = App.Path & "\" & App.EXEName & ".exe"
End Function
