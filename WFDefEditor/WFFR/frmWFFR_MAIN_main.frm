VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmWFFR_MAIN_main 
   Caption         =   "Активная функця"
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
   Begin VB.Timer menuTimerWFFR_Fcomm 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFFR_Fcomm 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   4500
      TabIndex        =   7
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFFR_FcommAcc 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFR_FcommRef 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   13
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFR_FcommDel 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFR_FcommEdit 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   11
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFR_FcommAdd 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFR_FcommAddRoot 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "NEWROOT.ico"
         ToolTipText     =   "Добавить ветку"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MSComctlLib.TreeView treeWFFR_Fcomm 
         Height          =   480
         Left            =   225
         TabIndex        =   8
         Top             =   600
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   132
         LabelEdit       =   1
         LineStyle       =   1
         PathSeparator   =   ""
         Style           =   7
         Appearance      =   1
      End
   End
   Begin VB.Frame pnlWFFR_func 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFFR_funcRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFR_funcAdd 
         Enabled         =   0   'False
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "New.ico"
         ToolTipText     =   "Создать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFR_funcDel 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFR_funcSave 
         Enabled         =   0   'False
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "SAVE.ico"
         ToolTipText     =   "Сохранить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin WFFRGUI.WFFR_funcMAIN editWFFR_func 
         Height          =   480
         Left            =   150
         TabIndex        =   2
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
   End
   Begin MSComctlLib.TabStrip ts 
      Height          =   1500
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   1
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
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
   Begin VB.Menu mnuPopupWFFR_Fcomm 
      Caption         =   "Меню для Комментарии"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFR_FcommAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuWFFR_FcommAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFFR_FcommEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFFR_FcommDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFFR_FcommS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFR_FcommBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFFR_FcommCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFFR_FcommCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFFR_FcommPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFFR_FcommCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFFR_FcommCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFFR_FcommRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFFR_FcommAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "frmWFFR_MAIN_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Item As Object
Public Host As GUI
Public ModalMode As Boolean
Private menuActionWFFR_Fcomm As String


Private Sub SaveToBuffer(u As Object)
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      xdom.loadXML "<I></I>"
      u.XMLSave xdom.lastChild, xdom
      Item.Manager.SetBuffer u.PartName, xdom.xml
      Set xdom = Nothing
End Sub

Private Function GetFromBuffer(u As Object) As Boolean
      On Error GoTo bye
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      GetFromBuffer = False
      If Item.Manager.GetBuffer(u.PartName) <> "" Then
        xdom.loadXML Item.Manager.GetBuffer(u.PartName)
        u.XMLLoad xdom.lastChild, 2
        u.BatchUpdate
        GetFromBuffer = True
      Else
        MsgBox "Буфер данных для этого раздела пуст", vbInformation
      End If
    Exit Function
bye:
    MsgBox Err.Description, vbCritical
End Function
Private Sub mnuSaveAsXML_Click()
  On Error Resume Next
 If Item.Application.MTZSession.CheckRight(Item.SecureStyleid, "XMLSAVE") Then
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
  Item.Application.Manager.ShowSecurityDialog Item
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
    Item.Manager.DeleteInstance Item.ID
    Item.Manager.FreeInstanceObject Item.ID
    Unload Me
  End If
  Exit Sub
bye:
   MsgBox Err.Description, vbCritical, "Ошибка при удалении"
End Sub
Private Sub mnuLoadFromXML_Click()
 On Error Resume Next
 If Item.Application.MTZSession.CheckRight(Item.SecureStyleid, "XMLLOAD") Then
  Dim xdom As MSXML2.DOMDocument
  Set xdom = New MSXML2.DOMDocument
  xdom.Load App.Path & "\" & Item.ID & ".xml"
  Item.XMLLoad xdom.lastChild, 1
  Item.WorkOffline = False
  Item.BatchUpdate
  Set xdom = Nothing
 End If
End Sub
Private Sub cmdWFFR_funcRef_Click()
  On Error Resume Next
  Item.WFFR_func.Refresh
  cmdWFFR_funcAdd_Click
End Sub
Private Sub cmdWFFR_funcAdd_Click()
  On Error Resume Next
 Dim u As Object
 If Item.WFFR_func.Count = 0 Then
   Set u = Item.WFFR_func.Add

 End If
 Set editWFFR_func.Item = Item.WFFR_func.Item(1)
 editWFFR_func.InitPanel
 cmdWFFR_funcDel.Enabled = True
 cmdWFFR_funcSave.Enabled = False
 cmdWFFR_funcAdd.Enabled = False
End Sub
Private Sub cmdWFFR_funcDel_Click()
  On Error Resume Next
  If editWFFR_func.Item Is Nothing Then Exit Sub
  If MsgBox("Удалить элемент" & vbCrLf & editWFFR_func.Item.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
    On Error GoTo bye
    editWFFR_func.Item.Parent.Delete editWFFR_func.Item.ID
    cmdWFFR_funcDel.Enabled = False
    cmdWFFR_funcSave.Enabled = False
    editWFFR_func.Enabled = False
    Set editWFFR_func.Item = Nothing
    cmdWFFR_funcAdd.Enabled = True
  End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub editWFFR_func_Changed()
 cmdWFFR_funcSave.Enabled = True
End Sub
Private Sub cmdWFFR_funcSave_Click()
  On Error Resume Next
    If editWFFR_func.IsOK Then
    editWFFR_func.Save
  On Error GoTo bye
    editWFFR_func.Item.Save
    cmdWFFR_funcSave.Enabled = False
    Else
      MsgBox "Не все обязатеьлные поля заполнены", vbOKOnly + vbExclamation
    End If
  On Error Resume Next
  Dim ff As Long
  ff = FreeFile
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFFR_editWFFR_func_MAIN" For Output As #ff
  Print #ff, editWFFR_func.PanelCustomisationString
  Close #ff
Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
  editWFFR_func.Item.Refresh
  editWFFR_func.InitPanel
End Sub
Private Sub cmdWFFR_FcommAdd_Click()
  On Error Resume Next
Dim f As Object, p As Object
If (treeWFFR_Fcomm.SelectedItem Is Nothing) Then Exit Sub
  Set p = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  Set f = p.WFFR_Fcomm.Add()

      Set frmWFFR_Fcomm_MAIN.Item = f
again:       frmWFFR_Fcomm_MAIN.NotFirstTime = False
      frmWFFR_Fcomm_MAIN.Show vbModal
      If frmWFFR_Fcomm_MAIN.OK Then
        Err.Clear
        f.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treeWFFR_Fcomm.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treeWFFR_Fcomm, treeWFFR_Fcomm.SelectedItem.Key
          End If
          Set treeWFFR_Fcomm.SelectedItem = treeWFFR_Fcomm.Nodes.Item(f.ID & "WFFR_Fcomm")
      Else
        Item.WFFR_Fcomm.Remove f.ID
      End If
End Sub

Private Sub cmdWFFR_FcommAddRoot_Click()
  On Error Resume Next
Dim f As Object, p As Object
  Set f = Item.WFFR_Fcomm.Add()
  Set frmWFFR_Fcomm_MAIN.Item = f
again:   frmWFFR_Fcomm_MAIN.NotFirstTime = False
  frmWFFR_Fcomm_MAIN.Show vbModal
  If frmWFFR_Fcomm_MAIN.OK Then
    Err.Clear
    f.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
      GoTo again
    End If
    f.LoadToTree treeWFFR_Fcomm, ""
  Else
    Item.WFFR_Fcomm.Remove f.ID
  End If
End Sub

Private Sub cmdWFFR_FcommEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  Set frmWFFR_Fcomm_MAIN.Item = f
again:   frmWFFR_Fcomm_MAIN.NotFirstTime = False
  frmWFFR_Fcomm_MAIN.Show vbModal
  If frmWFFR_Fcomm_MAIN.OK Then
    Err.Clear
    f.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdWFFR_FcommDel_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  If MsgBox("Удалить элемент" & vbCrLf & f.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
  On Error GoTo bye
     If f.Parent.Delete(f.ID) Then
       treeWFFR_Fcomm.Nodes.Remove treeWFFR_Fcomm.SelectedItem.Key
     End If
  End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub cmdWFFR_FcommAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  Item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdWFFR_FcommREf_Click()
  On Error Resume Next
  Item.WFFR_Fcomm.Refresh
  treeWFFR_Fcomm.Nodes.Clear
  Item.WFFR_Fcomm.filltree treeWFFR_Fcomm
End Sub

Private Sub treeWFFR_Fcomm_JWDblClick()
If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Dim f As Object
  Set f = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  Set frmWFFR_Fcomm_MAIN.Item = f
again:   frmWFFR_Fcomm_MAIN.NotFirstTime = False
  frmWFFR_Fcomm_MAIN.Show vbModal
  If frmWFFR_Fcomm_MAIN.OK Then
    On Error Resume Next
    Err.Clear
    f.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    treeWFFR_Fcomm.SelectedItem.Text = f.Brief(True)
    Else
     f.Refresh
  End If
End Sub

Private Sub treeWFFR_Fcomm_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 Me.MousePointer = vbHourglass
 treeWFFR_Fcomm.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = Item.FindRowObject("WFFR_Fcomm", Left(Node.Key, 38))
 f.expandpart treeWFFR_Fcomm, Node.Key
 Me.MousePointer = vbNormal
End If
End Sub

Private Sub treeWFFR_Fcomm_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFFR_Fcomm
End If
End Sub
Private Sub mnuWFFR_FcommAddRoot_click()
   menuActionWFFR_Fcomm = "ADDROOT"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
Private Sub mnuWFFR_FcommAdd_click()
   menuActionWFFR_Fcomm = "ADD"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
Private Sub mnuWFFR_FcommEdit_click()
   menuActionWFFR_Fcomm = "EDIT"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
Private Sub mnuWFFR_FcommDelete_click()
   menuActionWFFR_Fcomm = "DEL"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
  Private Sub mnuWFFR_FcommCOPY_Click()
    On Error Resume Next
    If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuWFFR_FcommCUT_Click()
    On Error Resume Next
    If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, BM
    Set u = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
    SaveToBuffer u
    Set BM = u.Parent
    u.Parent.Delete u.ID
    treeWFFR_Fcomm.Nodes.Remove treeWFFR_Fcomm.SelectedItem.Key
  End Sub
Private Sub mnuWFFR_FcommPASTE_Click()
On Error Resume Next
If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  Set u = f.WFFR_Fcomm.Add()
  If GetFromBuffer(u) Then
    If treeWFFR_Fcomm.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treeWFFR_Fcomm, treeWFFR_Fcomm.SelectedItem.Key
    End If
  Else
   f.WFFR_Fcomm.Refresh
  End If
End Sub
Private Sub mnuWFFR_FcommCHANGE_Click()
  On Error Resume Next
  If treeWFFR_Fcomm.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, BM
  Set u = Item.FindRowObject("WFFR_Fcomm", Left(treeWFFR_Fcomm.SelectedItem.Key, 38))
  If GetFromBuffer(u) Then
    treeWFFR_Fcomm.SelectedItem.Text = u.Brief
      treeWFFR_Fcomm.SelectedItem.Expanded = False
      While treeWFFR_Fcomm.SelectedItem.children > 0
        treeWFFR_Fcomm.Nodes.Remove treeWFFR_Fcomm.SelectedItem.Child.Key
      Wend
      treeWFFR_Fcomm.Nodes.Add(treeWFFR_Fcomm.SelectedItem.Key, 4, "Expanding ...").Tag = "ToDelete"
      treeWFFR_Fcomm_Expand treeWFFR_Fcomm.SelectedItem
  End If
End Sub
  Private Sub mnuWFFR_FcommCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFR_FcommRef_click()
   menuActionWFFR_Fcomm = "REF"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
Private Sub mnuWFFR_FcommAcc_click()
   menuActionWFFR_Fcomm = "ACC"
   menuTimerWFFR_Fcomm.Enabled = True
End Sub
Private Sub menuTimerWFFR_Fcomm_timer()
   menuTimerWFFR_Fcomm.Enabled = False
   If menuActionWFFR_Fcomm = "ADDROOT" Then cmdWFFR_FcommAddRoot_Click
   If menuActionWFFR_Fcomm = "ADD" Then cmdWFFR_FcommAdd_Click
   If menuActionWFFR_Fcomm = "EDIT" Then cmdWFFR_FcommEdit_Click
   If menuActionWFFR_Fcomm = "DEL" Then cmdWFFR_FcommDel_Click
   If menuActionWFFR_Fcomm = "REF" Then cmdWFFR_FcommREf_Click
   If menuActionWFFR_Fcomm = "ACC" Then cmdWFFR_FcommAcc_Click
   menuActionWFFR_Fcomm = ""
End Sub
Private Sub ts_click()
  On Error Resume Next
  pnlWFFR_Fcomm.Visible = False
  pnlWFFR_func.Visible = False

   Select Case ts.SelectedItem.Key
   Case "WFFR_func"
     With pnlWFFR_func
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      editWFFR_func.Top = 40 * Screen.TwipsPerPixelX
      editWFFR_func.Left = 5 * Screen.TwipsPerPixelX
      editWFFR_func.Width = .Width - 10 * Screen.TwipsPerPixelX
      editWFFR_func.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFFR_Fcomm"
     With pnlWFFR_Fcomm
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      treeWFFR_Fcomm.Top = 40 * Screen.TwipsPerPixelX
      treeWFFR_Fcomm.Left = 5 * Screen.TwipsPerPixelX
      treeWFFR_Fcomm.Width = .Width - 10 * Screen.TwipsPerPixelX
      treeWFFR_Fcomm.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
     End Select
End Sub
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean)
 Set Item = ObjItem
 Set Host = MyHost
 ModalMode = aModalMode
End Sub
Private Sub Form_Load()
  On Error Resume Next
  Me.Caption = Item.Brief
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "Описание"
ts.Tabs.Item(1).Key = "WFFR_func"
  LoadBtnPictures cmdWFFR_funcSave, cmdWFFR_funcSave.Tag
  LoadBtnPictures cmdWFFR_funcDel, cmdWFFR_funcDel.Tag
  LoadBtnPictures cmdWFFR_funcAdd, cmdWFFR_funcAdd.Tag
  LoadBtnPictures cmdWFFR_funcRef, cmdWFFR_funcRef.Tag
  ff = FreeFile
  On Error Resume Next
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFFR_editWFFR_func_MAIN" For Input As #ff
  buf = ""
  buf = Input(LOF(ff), ff)
  Close #ff
  If buf <> "" Then editWFFR_func.PanelCustomisationString = buf
  cmdWFFR_funcAdd_Click
Call ts.Tabs.Add(, "WFFR_Fcomm", "Комментарии")
  LoadBtnPictures cmdWFFR_FcommAddRoot, cmdWFFR_FcommAddRoot.Tag
  LoadBtnPictures cmdWFFR_FcommAdd, cmdWFFR_FcommAdd.Tag
  LoadBtnPictures cmdWFFR_FcommEdit, cmdWFFR_FcommEdit.Tag
  LoadBtnPictures cmdWFFR_FcommDel, cmdWFFR_FcommDel.Tag
  LoadBtnPictures cmdWFFR_FcommRef, cmdWFFR_FcommRef.Tag
  LoadBtnPictures cmdWFFR_FcommAcc, cmdWFFR_FcommAcc.Tag
Item.WFFR_Fcomm.filltree treeWFFR_Fcomm
  LoadFromSkin Me
End Sub
Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  If Not Item Is Nothing Then
    If Not Item.Manager Is Nothing Then
      Item.BatchUpdate
    End If
  End If
  If Not Host Is Nothing Then
   Host.EraseForm Item.ID, "MAIN", ModalMode
  End If
  Set Item = Nothing
  Set Host = Nothing
  SaveToSkin Me
End Sub
Private Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
ts.Top = 0
ts.Left = 0
ts.Width = Me.ScaleWidth
ts.Height = Me.ScaleHeight
ts_click
End Sub
Private Function FormByName(ByVal Name As String) As Form

If Name = "WFFR_func" Then
 Set FormByName = New frmWFFR_func_MAIN
 Exit Function
End If

If Name = "WFFR_Fcomm" Then
 Set FormByName = New frmWFFR_Fcomm_MAIN
 Exit Function
End If

End Function
Private Sub LoadFromSkin(frm As Form)
  On Error Resume Next
  Dim s As String, arr() As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  Dim ff As Long, buf As String
  ff = FreeFile
  Open s & frm.Name For Input As #ff
  buf = Input(LOF(ff), ff)
  Close #ff
  arr = Split(buf, vbCrLf)
  Dim arr2() As String, i As Long
For i = 0 To UBound(arr)
  arr2 = Split(arr(i), ":")
  Select Case arr2(0)
  Case "FormTag"
    frm.Tag = arr2(1)
  Case "FormTop"
    frm.Top = arr2(1)
  Case "FormLeft"
    frm.Left = arr2(1)
  Case "FormWidth"
    frm.Width = arr2(1)
  Case "FormHeight"
    frm.Height = arr2(1)
  Case Else
    frm.Controls(arr2(0)).Tag = Val(arr2(1))
  End Select
Next
  s = ""
  s = GetSetting("MTZ", "CONFIG", "IMAGEPATH", "")
  If s = "" Then Exit Sub
  Set frm.Icon = LoadPicture(s & frm.Tag)
End Sub

Private Sub SaveToSkin(frm As Form)
  On Error Resume Next
  Dim s As String, buf As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  frm.WindowState = 0
  Dim ff As Long
  ff = FreeFile
  Kill s & frm.Name
  Open s & frm.Name For Output As #ff
  buf = "FormTag:" & frm.Tag
  buf = buf & vbCrLf & "FormTop:" & frm.Top
  buf = buf & vbCrLf & "FormLeft:" & frm.Left
  buf = buf & vbCrLf & "FormWidth:" & frm.Width
  buf = buf & vbCrLf & "FormHeight:" & frm.Height
  Print #ff, buf
  Close #ff
End Sub


'переместить клиента в каталоге
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
'do nothing
End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для  каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
 'Set RowItem.Report = RowItem.Application.Manager.GetInstanceObject(ID)
 If RowItem.Report.VRRPT_MAIN.Count = 0 Then
  Set Obj = RowItem.Report.VRRPT_MAIN.Add
 Else
  Set Obj = RowItem.Report.VRRPT_MAIN.Item(1)
 End If
 
 Set Obj.Author = RowItem.Application.FindRowObject("Users", Item.Application.MTZSession.GetSessionUserID())
 Obj.TheDate = Date
 
 If ReportType = "CLNT" Then
   Set Obj.Client = RowItem.Application
 End If
 If ReportType = "PRJ" Then
   Set Obj.Project = RowItem.Application
 End If
 If ReportType = "CONT" Then
   Set Obj.Contract = RowItem.Application
 End If
 If ReportType = "PERS" Then
   Set Obj.Person = RowItem.Application
 End If
 
 Obj.Save
 RowItem.Save

End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
On Error Resume Next
If ID <> "" Then
    Dim Obj As Object
    Set Obj = Item.Manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = Item.Manager.GetInstanceGUI(Obj.ID)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If Obj.MTZSession.CheckRight(Obj.SecureStyleid, Obj.TypeName & ":" & "M" & i) Then
            StartMode = "M" & i
            Exit For
          End If
        Next
       End If
      
      objGui.Show StartMode & "", Obj
      Set objGui = Nothing
    End If
  End If
  
End Sub



'
'{069956DC-3305-45EF-9331-91CE323B5942}
Private Sub Run_WFDefName(Optional RowItem As Object)
Item.Name = RowItem.Description
Me.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
Item.Name = RowItem.Name
Me.Caption = Item.Name
Item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
Item.Name = Name
Me.Caption = Item.Name
Item.Save
End Sub



