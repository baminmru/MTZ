VERSION 5.00
Begin VB.Form frm_main 
   Caption         =   "Процесс"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
   Begin WFRtmGUI.ctl_main ctl 
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
End
Attribute VB_Name = "frm_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Item As Object
Public Host As GUI
Public ModalMode As Boolean


Private Sub mnuSaveAsXML_Click()
  On Error Resume Next
 If Item.Application.MTZSession.CheckRight(Item.SecureStyleID, "XMLSAVE") Then
   Item.LockResource True
   Item.LoadAll
   Item.WorkOffline = True
   Dim xdom As MSXML2.DOMDocument
   Set xdom = New MSXML2.DOMDocument
   xdom.loadXML "<root></root>"
   Item.XMLSave xdom.lastChild, xdom
   xdom.Save App.Path & "\" & Item.ID & ".xml"
   Item.WorkOffline = False
 End If
End Sub
Private Sub mnuSecure_Click()
  On Error Resume Next
  Item.Application.manager.ShowSecurityDialog Item
End Sub
Private Sub mnuUnlock_Click()
  On Error Resume Next
  If Item.IsLocked Then
    Item.UnlockResource
  Else
  MsgBox "Объект не заблокирован", vbInformation
  End If
End Sub
Private Sub mnuLock_Click()
  On Error Resume Next
    Item.LockResource True
End Sub
Private Sub mnuRename_Click()
  On Error Resume Next
  Dim n As String
  n = InputBox("Новое название", "Переименовать", Item.Name)
  If n <> "" And n <> Item.Name Then
    Item.Name = n
    Item.Save
    Me.Caption = Item.Name
  End If
End Sub
Private Sub mnuExit_Click()
  On Error Resume Next
  Unload Me
End Sub
Private Sub mnuDelete_Click()
  On Error GoTo bye
  If MsgBox("Удалить документ?", vbQuestion + vbYesNo) = vbYes Then
    Item.UnlockResource
    Item.WorkOffline = False
    Item.manager.DeleteInstance Item.ID
    Item.manager.FreeInstanceObject Item.ID
    Unload Me
  End If
  Exit Sub
bye:
   MsgBox Err.Description, vbCritical, "Ошибка при удалении"
End Sub
Private Sub mnuLoadFromXML_Click()
 On Error Resume Next
 If Item.Application.MTZSession.CheckRight(Item.SecureStyleID, "XMLLOAD") Then
  Dim xdom As MSXML2.DOMDocument
  Set xdom = New MSXML2.DOMDocument
  xdom.Load App.Path & "\" & Item.ID & ".xml"
  Item.XMLLoad xdom.lastChild, 1
  Item.WorkOffline = False
  Item.BatchUpdate
  Set xdom = Nothing
 End If
End Sub
Private Function ParentForm() As Form
  Set ParentForm = Me
End Function
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean)
 Set Item = ObjItem
 Set Host = MyHost
 ModalMode = aModalMode
 ctl.Init ObjItem, MyHost, aModalMode, Me
End Sub
Private Sub Form_Load()
  On Error Resume Next
  Me.Caption = Item.Brief
  Dim ff As Long, buf As String
  LoadFromSkin Me
  ctl.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight
End Sub
Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  If Not Item Is Nothing Then
    If Not Item.manager Is Nothing Then
      If ctl.IsChanged Then
  On Error GoTo bye
        ctl.OnSave
      End If
    End If
  End If
  On Error Resume Next
  If Not Host Is Nothing Then
   Host.EraseForm Item.ID, "", ModalMode
  End If
  Set Item = Nothing
  Set Host = Nothing
  SaveToSkin Me
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
  Cancel = -1
End Sub
Private Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
 ctl.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight
End Sub

