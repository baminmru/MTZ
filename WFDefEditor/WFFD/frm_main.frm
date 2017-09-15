VERSION 5.00
Begin VB.Form frm_main 
   Caption         =   "Описание функции процесса"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
   Begin WFFDGUI.ctl_main ctl 
      Height          =   1500
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin VB.Menu mnuFile 
      Caption         =   "Файл"
      Begin VB.Menu mnuSaveAsXML 
         Caption         =   "Сохранить в формате XML"
      End
      Begin VB.Menu mnuLoadFromXML 
         Caption         =   "Загрузить из XML"
      End
      Begin VB.Menu mnuSecure 
         Caption         =   "Стиль защиты"
      End
      Begin VB.Menu mnuLock 
         Caption         =   "Заблокировать"
      End
      Begin VB.Menu mnuUnlock 
         Caption         =   "Разблокировать"
      End
      Begin VB.Menu mnuRename 
         Caption         =   "Переименовать"
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Выход"
      End
   End
   Begin VB.Menu mnuStatus 
      Caption         =   "Состояния"
      Begin VB.Menu mnuState 
         Caption         =   "..."
         Index           =   1
      End
   End
End
Attribute VB_Name = "frm_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Public item As WFFD.Application
Public Host As GUI
Public ModalMode As Boolean





Private Sub mnuSaveAsXML_Click()
  On Error Resume Next
 If item.Application.MTZSession.CheckRight(item.SecureStyleID, "XMLSAVE") Then
   item.LockResource True
   item.LoadAll
   item.WorkOffline = True
   Dim xdom As MSXML2.DOMDocument
   Set xdom = New MSXML2.DOMDocument
   xdom.loadXML "<root></root>"
   item.XMLSave xdom.lastChild, xdom
   xdom.Save App.Path & "\" & item.ID & ".xml"
   item.WorkOffline = False
 End If
End Sub
Private Sub mnuSecure_Click()
  On Error Resume Next
  item.Application.Manager.ShowSecurityDialog item
End Sub
Private Sub mnuUnlock_Click()
  On Error Resume Next
  If item.IsLocked Then
    item.UnLockResource
  Else
  MsgBox "Объект не заблокирован", vbInformation
  End If
End Sub
Private Sub mnuLock_Click()
  On Error Resume Next
    item.LockResource True
End Sub
Private Sub mnuRename_Click()
  On Error Resume Next
  Dim n As String
  n = InputBox("Новое название", "Переименовать", item.Name)
  If n <> "" And n <> item.Name Then
    item.Name = n
    item.Save
    Me.Caption = item.Name
  End If
End Sub
Private Sub mnuExit_Click()
  On Error Resume Next
  Unload Me
End Sub
Private Sub mnuDelete_Click()
  On Error GoTo bye
  If MsgBox("Удалить документ?", vbQuestion + vbYesNo) = vbYes Then
    item.UnLockResource
    item.WorkOffline = False
    item.Manager.DeleteInstance item.ID
    item.Manager.FreeInstanceObject item.ID
    Unload Me
  End If
  Exit Sub
bye:
   MsgBox Err.Description, vbCritical, "Ошибка при удалении"
End Sub
Private Sub mnuLoadFromXML_Click()
 On Error Resume Next
 If item.Application.MTZSession.CheckRight(item.SecureStyleID, "XMLLOAD") Then
  Dim xdom As MSXML2.DOMDocument
  Set xdom = New MSXML2.DOMDocument
  xdom.Load App.Path & "\" & item.ID & ".xml"
  item.XMLLoad xdom.lastChild, 1
  item.WorkOffline = False
  item.BatchUpdate
  Set xdom = Nothing
 End If
End Sub
Private Function ParentForm() As Form
  Set ParentForm = Me
End Function
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean)
 Set item = ObjItem
 Set Host = MyHost
 ModalMode = aModalMode
 ctl.Init ObjItem, MyHost, aModalMode, Me
 CheckStatus
End Sub
Private Sub CheckStatus()
 If ctl.StatusMenuCount > 0 Then
    Dim i As Long
    Dim mm() As Object
    ReDim mm(1 To ctl.StatusMenuCount)
    For i = 1 To ctl.StatusMenuCount
      Set mm(i) = mnuState(i)
    Next
    ctl.CheckStatusMenu mm
  End If
End Sub
Private Sub form_Activate()
 CheckStatus
End Sub
Private Sub form_load()
  On Error Resume Next
  Me.Caption = item.Brief
  Dim ff As Long, buf As String
  LoadFromSkin Me
  ctl.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight
  If ctl.StatusMenuCount > 0 Then
    Dim i As Long
    Dim mm() As Object
    ReDim mm(1 To ctl.StatusMenuCount)
    Set mm(1) = mnuState(1)
    For i = 2 To ctl.StatusMenuCount
     Load mnuState(i)
     Set mm(i) = mnuState(i)
    Next
    ctl.SetupStatusMenu mm
    CheckStatus
  Else
    mnuStatus.Visible = False
  End If
End Sub
Private Sub mnuState_Click(index As Integer)
  On Error Resume Next
  item.StatusID = mnuState(index).Tag
  CheckStatus
End Sub
Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  If Not item Is Nothing Then
    If Not item.Manager Is Nothing Then
      If ctl.IsChanged Then
  On Error GoTo bye
        ctl.OnSave
      End If
    End If
  End If
  On Error Resume Next
  If Not Host Is Nothing Then
   Host.EraseForm item.ID, "", ModalMode
  End If
  Set item = Nothing
  Set Host = Nothing
  SaveToSkin Me
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
  Cancel = -1
End Sub
Private Sub form_resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
 ctl.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight
End Sub



