VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnFolder_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerShortcut 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerFolder 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlFolder 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdShortcutAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   17
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdShortcutRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   16
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdShortcutFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   15
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdShortcutCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdShortcutPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   13
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdShortcutRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdShortcutDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   11
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdShortcutEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdShortcutAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridShortcut 
         Height          =   480
         Left            =   3900
         TabIndex        =   8
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         Version         =   "2.0"
         AutomaticSort   =   -1  'True
         RecordNavigatorString=   "Запись:|из"
         BoundColumnIndex=   ""
         ReplaceColumnIndex=   ""
         ScrollToolTipColumn=   ""
         TabKeyBehavior  =   1
         HideSelection   =   2
         SelectionStyle  =   1
         GroupByBoxInfoText=   "Группировка"
         AllowDelete     =   -1  'True
         AllowEdit       =   0   'False
         ItemCount       =   0
         DataMode        =   99
         ColumnHeaderHeight=   285
         IntProp1        =   0
         IntProp2        =   0
         IntProp7        =   0
         ColumnsCount    =   2
         Column(1)       =   "vpnFolder_.ctx":0000
         Column(2)       =   "vpnFolder_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnFolder_.ctx":016C
         FormatStyle(2)  =   "vpnFolder_.ctx":02C8
         FormatStyle(3)  =   "vpnFolder_.ctx":0378
         FormatStyle(4)  =   "vpnFolder_.ctx":042C
         FormatStyle(5)  =   "vpnFolder_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnFolder_.ctx":05BC
      End
      Begin VB.CommandButton cmdFolderAcc 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdFolderRef 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdFolderDel 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdFolderEdit 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdFolderAdd 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdFolderAddRoot 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "NEWROOT.ico"
         ToolTipText     =   "Добавить ветку"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MSComctlLib.TreeView treeFolder 
         Height          =   480
         Left            =   3900
         TabIndex        =   1
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   132
         LabelEdit       =   1
         LineStyle       =   1
         PathSeparator   =   ""
         Sorted          =   -1  'True
         Style           =   7
         Appearance      =   1
      End
   End
   Begin VB.Menu mnuPopupFolder 
      Caption         =   "Меню для Папка"
      Visible         =   0   'False
      Begin VB.Menu mnuFolderAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuFolderAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuFolderEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuFolderDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuFolderS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFolderBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuFolderCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuFolderCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuFolderPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuFolderCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuFolderCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuFolderRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuFolderAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupShortcut 
      Caption         =   "Меню для Документы"
      Visible         =   0   'False
      Begin VB.Menu mnuShortcutAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuShortcutEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuShortcutDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuShortcutOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuShortcutRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuShortcutS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuShortcutBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuShortcutCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuShortcutCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuShortcutPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuShortcutCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuShortcutCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuShortcutPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuShortcutCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuShortcutFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuShortcutAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnFolder_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Папка каталога
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private menuActionFolder As String
Private fndShortcut As Object
Private menuActionShortcut As String





Private Sub opShortcut_OpenRef_(RowItem As Object)
With RowItem
Run_VBOpenRef ID:=.DocItem.ID, StartMode:=.StartMode, RowItem:=RowItem
End With
End Sub
Private Sub pnlFolder_PositionChanged()
  pnlFolder.SavePosition
End Sub
Private Sub treeFolder_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupFolder
End If
End Sub
Private Sub mnuFolderAddRoot_click()
   menuActionFolder = "ADDROOT"
   menuTimerFolder.Enabled = True
End Sub
Private Sub mnuFolderAdd_click()
   menuActionFolder = "ADD"
   menuTimerFolder.Enabled = True
End Sub
Private Sub mnuFolderEdit_click()
   menuActionFolder = "EDIT"
   menuTimerFolder.Enabled = True
End Sub
Private Sub mnuFolderDelete_click()
   menuActionFolder = "DEL"
   menuTimerFolder.Enabled = True
End Sub
  Private Sub mnuFolderCOPY_Click()
    On Error Resume Next
    If treeFolder.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuFolderCUT_Click()
    On Error Resume Next
    If treeFolder.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, bm
    Set u = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
    SaveToBuffer u
    Set bm = u.Parent
    u.Parent.Delete u.ID
    treeFolder.Nodes.Remove treeFolder.SelectedItem.Key
  End Sub
Private Sub mnuFolderPASTE_Click()
On Error Resume Next
If treeFolder.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
  Set u = f.Folder.Add()
  If GetFromBuffer(u) Then
    If treeFolder.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treeFolder, treeFolder.SelectedItem.Key
    End If
  Else
   f.Folder.Refresh
  End If
End Sub
Private Sub mnuFolderCHANGE_Click()
  On Error Resume Next
  If treeFolder.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, bm
  Set u = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
  If GetFromBuffer(u) Then
    treeFolder.SelectedItem.Text = u.brief
      treeFolder.SelectedItem.Expanded = False
      While treeFolder.SelectedItem.Children > 0
        treeFolder.Nodes.Remove treeFolder.SelectedItem.Child.Key
      Wend
      treeFolder.Nodes.Add(treeFolder.SelectedItem.Key, 4, "Expanding ...").Tag = "ToDelete"
      treeFolder_Expand treeFolder.SelectedItem
  End If
End Sub
  Private Sub mnuFolderCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuFolderRef_click()
   menuActionFolder = "REF"
   menuTimerFolder.Enabled = True
End Sub
Private Sub mnuFolderAcc_click()
   menuActionFolder = "ACC"
   menuTimerFolder.Enabled = True
End Sub
Private Sub menuTimerFolder_timer()
   menuTimerFolder.Enabled = False
   If menuActionFolder = "ADDROOT" Then cmdFolderAddRoot_Click
   If menuActionFolder = "ADD" Then cmdFolderAdd_Click
   If menuActionFolder = "EDIT" Then cmdFolderEdit_Click
   If menuActionFolder = "DEL" Then cmdFolderDel_Click
   If menuActionFolder = "REF" Then cmdFolderREf_Click
   If menuActionFolder = "ACC" Then cmdFolderAcc_Click
   menuActionFolder = ""
End Sub
Private Sub cmdFolderAdd_Click()
  On Error Resume Next
  On Error Resume Next
  Dim f As Object, p As Object
If (treeFolder.SelectedItem Is Nothing) Then Exit Sub
  Set p = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
  Set f = p.Folder.Add()

      Set frmFolder_.Item = f
again:       frmFolder_.NotFirstTime = False
      frmFolder_.OnInit
      frmFolder_.Show vbModal
      If frmFolder_.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treeFolder.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treeFolder, treeFolder.SelectedItem.Key
          End If
          Set treeFolder.SelectedItem = treeFolder.Nodes.Item(f.ID & "Folder")
      Else
        Item.Folder.Delete f.ID
        Item.Folder.Remove f.ID
      End If
End Sub

Private Sub cmdFolderAddRoot_Click()
  On Error Resume Next
Dim f As Object, p As Object
  Set f = Item.Folder.Add()

      Set frmFolder_.Item = f
again:       frmFolder_.NotFirstTime = False
      frmFolder_.OnInit
      frmFolder_.Show vbModal
      If frmFolder_.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
    Item.Folder.Refresh
    treeFolder.Nodes.Clear
    Item.Folder.filltree treeFolder
          Set treeFolder.SelectedItem = treeFolder.Nodes.Item(f.ID & "Folder")
      Else
        Item.Folder.Remove f.ID
      End If
End Sub

Private Sub cmdFolderEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treeFolder.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
  Set frmFolder_.Item = f
again:   frmFolder_.NotFirstTime = False
  frmFolder_.OnInit
  frmFolder_.Show vbModal
  If frmFolder_.OK Then
    err.Clear
    f.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdFolderDel_Click()
  On Error Resume Next
  Dim f As Object
  If treeFolder.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
  If MsgBox("Удалить элемент" & vbCrLf & f.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
  On Error GoTo bye
     If f.Parent.Delete(f.ID) Then
       treeFolder.Nodes.Remove treeFolder.SelectedItem.Key
     End If
  End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub cmdFolderAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treeFolder.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
  Item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdFolderREf_Click()
  On Error Resume Next
  Item.Folder.Refresh
  treeFolder.Nodes.Clear
  Item.Folder.filltree treeFolder
End Sub

Private Sub treeFolder_DblClick()
If treeFolder.SelectedItem Is Nothing Then Exit Sub
  cmdFolderEdit_Click
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function

Private Sub treeFolder_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeFolder.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = Item.FindRowObject("Folder", Left(Node.Key, 38))
 f.expandpart treeFolder, Node.Key
 ParentForm.MousePointer = vbNormal
End If
 Set treeFolder.SelectedItem = Node
 treeFolder_NodeClick Node
End Sub

Private Sub treeFolder_Collapse(ByVal Node As MSComctlLib.Node)
 Set treeFolder.SelectedItem = Node
 treeFolder_NodeClick Node
End Sub

Private Sub pnlFolder_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treeFolder.Left = Left
  treeFolder.Top = Top + 25 * Screen.TwipsPerPixelY
  treeFolder.Width = Width
  treeFolder.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdFolderAddRoot.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFolderAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFolderEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFolderDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFolderRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFolderAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdFolderAddRoot.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdFolderAdd.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdFolderEdit.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdFolderDel.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdFolderRef.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdFolderAcc.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdShortcutCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridShortcut, "gridShortcut"
Set jset = Nothing
End Sub

Private Sub cmdShortcutPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridShortcut, "Документы"
Set jset = Nothing
End Sub

Private Sub cmdShortcutAcc_Click()
On Error Resume Next
If gridShortcut.ItemCount = 0 Then Exit Sub
If gridShortcut.Row > 0 Then
 If gridShortcut.RowIndex(gridShortcut.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridShortcut.RowBookmark(gridShortcut.RowIndex(gridShortcut.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdShortcutFnd_Click()
  On Error Resume Next
  fndShortcut.ShowForm
End Sub
Private Sub cmdShortcutRun_Click()
  On Error Resume Next
  gridShortcut_DblClick
End Sub
Private Sub pnlFolder_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridShortcut.Left = Left
  gridShortcut.Top = Top + 25 * Screen.TwipsPerPixelY
  gridShortcut.Width = Width
  gridShortcut.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdShortcutAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdShortcutEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdShortcutDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdShortcutRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdShortcutPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdShortcutCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdShortcutFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdShortcutRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdShortcutAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdShortcutAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdShortcutEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdShortcutDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdShortcutRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdShortcutPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdShortcutCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdShortcutFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdShortcutRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdShortcutAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub treeFolder_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object
  Set p = Item.FindRowObject("Folder", Left(Node.Key, 38))
  p.Shortcut.Refresh
  p.Shortcut.preparegrid gridShortcut
  LoadGridLayout gridShortcut
    Set fndShortcut = Nothing
    Set fndShortcut = CreateObject("MTZ_JSetup.GridFinder")
    fndShortcut.Init gridShortcut
End Sub

Private Sub gridShortcut_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object
  If treeFolder.SelectedItem Is Nothing Then Exit Sub
  Set p = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
  p.Shortcut.LoadRow gridShortcut, RowIndex, Bookmark, Values
  Set p = Nothing
End Sub
Private Sub gridShortcut_KeyPress(KeyAscii As Integer)
  If gridShortcut.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndShortcut.FindOnPress KeyAscii
End Sub

Private Sub gridShortcut_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If treeFolder.SelectedItem Is Nothing Then Exit Sub
    If gridShortcut.Row = 0 Then Exit Sub
    If gridShortcut.RowIndex(gridShortcut.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridShortcut.RowBookmark(gridShortcut.RowIndex(gridShortcut.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    If Not u Is Nothing Then
      On Error Resume Next
      If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
        On Error GoTo bye
        u.Parent.Delete u.ID
      Else
        Cancel = True
      End If
    End If

    Set u = Nothing
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub cmdShortcutEdit_Click()
    On Error Resume Next
    If treeFolder.SelectedItem Is Nothing Then Exit Sub
    If gridShortcut.Row = 0 Then Exit Sub
    If gridShortcut.RowIndex(gridShortcut.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridShortcut.RowBookmark(gridShortcut.RowIndex(gridShortcut.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmShortcut_.Item = u
again:     frmShortcut_.NotFirstTime = False
    frmShortcut_.OnInit
    frmShortcut_.Show vbModal
    If frmShortcut_.OK Then
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridShortcut.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
  Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdShortcutRef_Click()
  On Error Resume Next
    If treeFolder.SelectedItem Is Nothing Then Exit Sub
  gridShortcut.Columns.Clear
  gridShortcut.ItemCount = 0
   treeFolder_NodeClick treeFolder.SelectedItem
End Sub
Private Sub cmdShortcutDel_Click()
  On Error Resume Next
   gridShortcut.Delete
End Sub
Private Sub cmdShortcutAdd_Click()
  On Error Resume Next
   If treeFolder.SelectedItem Is Nothing Then Exit Sub
   Dim gu As Object
   Set gu = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
   Dim u As Object
   Set u = gu.Shortcut.Add()

      Set frmShortcut_.Item = u
again:       frmShortcut_.NotFirstTime = False
      frmShortcut_.OnInit
      frmShortcut_.Show vbModal
      If frmShortcut_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridShortcut.ItemCount = gu.Shortcut.Count
        gridShortcut.Refresh
        gridShortcut.RefreshGroups
        gridShortcut.RefreshSort
        gridShortcut.MoveToBookmark u.ID & "Shortcut"
      Else
        gu.Shortcut.Delete u.ID
        gu.Shortcut.Remove u.ID
      End If
Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridShortcut_DblClick()
    On Error Resume Next
    If treeFolder.SelectedItem Is Nothing Then Exit Sub
    If gridShortcut.Row = 0 Then Exit Sub
    If gridShortcut.RowIndex(gridShortcut.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridShortcut.RowBookmark(gridShortcut.RowIndex(gridShortcut.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    opShortcut_OpenRef_ u
    u.Refresh
End Sub
Private Sub gridShortcut_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridShortcut.ItemCount = 0 Then Exit Sub
 If gridShortcut.Row > 0 Then
   If LastRow <> gridShortcut.Row And LastRow > 0 Then
     gridShortcut.GetRowData(LastRow).RowStyle = "Default"
     gridShortcut.GetRowData(gridShortcut.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuShortcutPASTE_Click()
On Error Resume Next
   If treeFolder.SelectedItem Is Nothing Then Exit Sub
   Dim gu As Object
   Set gu = Item.FindRowObject("Folder", Left(treeFolder.SelectedItem.Key, 38))
   Dim u As Object
   Set u = gu.Shortcut.Add()
    If GetFromBuffer(u) Then
      gridShortcut.ItemCount = u.Parent.Count
    Else
      gu.Shortcut.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridShortcut_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdShortcutCfg_Click
        End If
    End If
End Sub

Private Sub gridShortcut_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupShortcut
End If
End Sub
Private Sub mnuShortcutAdd_click()
   menuActionShortcut = "ADD"
   menuTimerShortcut.Enabled = True
End Sub
Private Sub mnuShortcutEdit_click()
   menuActionShortcut = "EDIT"
   menuTimerShortcut.Enabled = True
End Sub
Private Sub mnuShortcutDelete_click()
   menuActionShortcut = "DEL"
   menuTimerShortcut.Enabled = True
End Sub
Private Sub mnuShortcutOpen_click()
   menuActionShortcut = "RUN"
   menuTimerShortcut.Enabled = True
End Sub
Private Sub mnuShortcutRef_click()
   menuActionShortcut = "REF"
   menuTimerShortcut.Enabled = True
End Sub
  Private Sub mnuShortcutCOPY_Click()
    On Error Resume Next
    If gridShortcut.ItemCount = 0 Then Exit Sub
    If gridShortcut.Row > 0 Then
     If gridShortcut.RowIndex(gridShortcut.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridShortcut.RowBookmark(gridShortcut.RowIndex(gridShortcut.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuShortcutCUT_Click()
    On Error Resume Next
    If gridShortcut.ItemCount = 0 Then Exit Sub
    If gridShortcut.Row > 0 Then
     If gridShortcut.RowIndex(gridShortcut.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridShortcut.RowBookmark(gridShortcut.RowIndex(gridShortcut.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridShortcut.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuShortcutCHANGE_Click()
  On Error Resume Next
  If gridShortcut.ItemCount = 0 Then Exit Sub
  If gridShortcut.Row > 0 Then
   If gridShortcut.RowIndex(gridShortcut.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridShortcut.RowBookmark(gridShortcut.RowIndex(gridShortcut.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridShortcut.ItemCount = u.Parent.Count
      gridShortcut.RefreshRowIndex gridShortcut.RowIndex(gridShortcut.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuShortcutCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuShortcutPrn_click()
   menuActionShortcut = "PRN"
   menuTimerShortcut.Enabled = True
End Sub
Private Sub mnuShortcutCfg_click()
   menuActionShortcut = "CFG"
   menuTimerShortcut.Enabled = True
End Sub
Private Sub mnuShortcutFind_click()
   menuActionShortcut = "FND"
   menuTimerShortcut.Enabled = True
End Sub
Private Sub mnuShortcutAcc_click()
   menuActionShortcut = "ACC"
   menuTimerShortcut.Enabled = True
End Sub
Private Sub menuTimerShortcut_timer()
   menuTimerShortcut.Enabled = False
   If menuActionShortcut = "ADD" Then cmdShortcutAdd_Click
   If menuActionShortcut = "EDIT" Then cmdShortcutEdit_Click
   If menuActionShortcut = "DEL" Then cmdShortcutDel_Click
   If menuActionShortcut = "RUN" Then cmdShortcutRun_Click
   If menuActionShortcut = "REF" Then cmdShortcutRef_Click
   If menuActionShortcut = "PRN" Then cmdShortcutPrn_Click
   If menuActionShortcut = "CFG" Then cmdShortcutCfg_Click
   If menuActionShortcut = "FND" Then cmdShortcutFnd_Click
   If menuActionShortcut = "ACC" Then cmdShortcutAcc_Click
   menuActionShortcut = ""
End Sub

'Функция инициализации панели данными
'Parameters:
'[IN][OUT]  aItem , тип параметра: object,
'[IN][OUT]   optional pForm , тип параметра: object = nothing  - ...
'See Also:
'Example:
'  call me.OnInit({параметры})
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdFolderAddRoot, cmdFolderAddRoot.Tag
  LoadBtnPictures cmdFolderAdd, cmdFolderAdd.Tag
  LoadBtnPictures cmdFolderEdit, cmdFolderEdit.Tag
  LoadBtnPictures cmdFolderDel, cmdFolderDel.Tag
  LoadBtnPictures cmdFolderRef, cmdFolderRef.Tag
  LoadBtnPictures cmdFolderAcc, cmdFolderAcc.Tag
Item.Folder.filltree treeFolder
  LoadBtnPictures cmdShortcutAdd, cmdShortcutAdd.Tag
  LoadBtnPictures cmdShortcutEdit, cmdShortcutEdit.Tag
  LoadBtnPictures cmdShortcutDel, cmdShortcutDel.Tag
  LoadBtnPictures cmdShortcutRef, cmdShortcutRef.Tag
  LoadBtnPictures cmdShortcutPrn, cmdShortcutPrn.Tag
  LoadBtnPictures cmdShortcutFnd, cmdShortcutFnd.Tag
  LoadBtnPictures cmdShortcutCfg, cmdShortcutCfg.Tag
  LoadBtnPictures cmdShortcutRun, cmdShortcutRun.Tag
  LoadBtnPictures cmdShortcutAcc, cmdShortcutAcc.Tag
  gridShortcut.Columns.Clear
  gridShortcut.ItemCount = 0
  cmdShortcutRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlFolder.RestorePosition
End Sub

'Действие при активизации панели
'Parameters:
'[IN][OUT]  aItem , тип параметра: object,
'[IN][OUT]   optional pForm , тип параметра: object = nothing  - ...
'See Also:
'Example:
'  call me.OnClick({параметры})
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set Item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub

'Действие при сохранении
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnSave()
Public Sub OnSave()
  
End Sub

'Признак изменения
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.IsChanged()
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  pnlFolder.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub

'Освобождение ресурсов
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndShortcut = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
End Sub

'переместить клиента в каталоге
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
On Error Resume Next

'do nothing
End Sub



'Так же проверяет Square >0
'{53371FFA-B514-447A-A1F9-26EE4FD409C9}
Private Sub Run_VBUpdateObjNamePEO(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save

End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
On Error Resume Next

'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Проверка наличия коллекции характеристик
'{79E6BDEB-91D5-4B2E-81F7-3E091FB65E3A}
Private Sub Run_VBCheckDescrs(DesPartName As Variant, Optional RowItem As Object)
On Error Resume Next

    On Error Resume Next

    Dim part_col As Variant
    Dim part_item As Object
    Set part_col = CallByName(RowItem.Parent.Parent, DesPartName, VbGet, False)
    Set part_item = part_col.Item(1)
    If RowItem.Parent.Count = 1 Then
        If part_item.HasDescrs = -1 Then
            part_item.HasDescrs = 0
        Else
            part_item.HasDescrs = -1
        End If
    End If
    part_item.Save

End Sub



'Применить стиль защиты для объекта Предназначен для каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
On Error Resume Next

'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
  Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
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

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'
'{AA4085E6-745B-4A37-8EC4-65D99A653966}
Private Sub Run_VBRemoveSymmetricObjRef(ForwardFieldName As Variant, ObjTypeName As Variant, SymmetricPartName As Variant, SymmetricFieldName As Variant, Optional RowItem As Object)
On Error Resume Next

    Dim OK As Boolean
    Dim ID As String
    Dim brief As String

    On Error Resume Next
'     On Error GoTo bye

    Dim Obj As Object
    Dim part_col As Variant
    Dim part_item As Object
    Set Obj = CallByName(RowItem, ForwardFieldName, VbGet)
    Set part_col = CallByName(Obj, SymmetricPartName, VbGet, False)
    part_col.Filter = SymmetricFieldName + "='" + RowItem.Application.ID + "'"
'    RowItem.Parent.Remove RowItem.ID
    Set part_item = part_col.Item(1)
    part_col.Delete part_item.ID
    Exit Sub
bye:
Resume

End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKP", "Платеж " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKP_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKP_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKP_DEF.Item(1)
 End If
 
 Set Obj.FromClient = RowItem.Application
 Obj.PLPDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'Для раздела, в котором есть поле - ссылка, создает/выбирает объект без открытия окна редактирования ссылки
'{A2EEE876-54D8-4AED-B124-775F5DA2D911}
Private Sub Run_VBAddObjByRef(ObjTypeName As Variant, ForwardFieldName As Variant, SymmetricPartName As Variant, SymmetricFieldName As Variant, Optional RowItem As Object)
On Error Resume Next

    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
    Dim Mode As String
    Dim ResObject As Object
    On Error Resume Next
    Mode = Mid(TypeName(Me), InStr(TypeName(Me), "_") + 1)
    
'     On Error GoTo bye
    If Len(Mode) = 0 Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", ObjTypeName)
    Else
        ID = CreateGUID2
        If Len(ObjTypeName) = 0 Then
            Dim newObj As Object
            Set newObj = Item.Application.Manager.GetNewObject
            If Not (newObj Is Nothing) Then
                OK = True
                ID = newObj.ID
            End If
        Else
            OK = Item.Application.Manager.NewInstance(ID, ObjTypeName, "")
        End If
        Dim ref As Object, objGui As Object
        Set ref = Item.Application.Manager.GetInstanceObject(ID)
        If Not ref Is Nothing Then
          Set objGui = Item.Application.Manager.GetInstanceGUI(ID)
          If objGui Is Nothing Then Set ref = Nothing: Exit Sub
          objGui.Show "", ref, False
          Set objGui = Nothing
        Else
          OK = False
        End If
    End If
    Dim Obj As Object
    Set Obj = Item.Application.Manager.GetInstanceObject(ID)
    If Obj Is Nothing Then
        OK = False
    End If
    If OK Then
  Dim Coll As New Collection
        Dim part_col As Variant
        Dim part_item As Object
        CallByName RowItem, ForwardFieldName, VbSet, Obj
        Coll.Add TypeName(RowItem) + ":" + RowItem.ID
        RowItem.Save
        If Len(SymmetricPartName) > 0 And Len(SymmetricFieldName) > 0 Then
          Set part_col = CallByName(Obj, SymmetricPartName, VbGet, True)
          Set part_item = part_col.Add
          CallByName part_item, SymmetricFieldName, VbSet, RowItem.Application
          part_item.Save
          Coll.Add SymmetricPartName + ":" + part_item.ID
        End If
        Call Item.Application.Manager.AddCustomObjects(Coll, Obj.ID)
    Else
        RowItem.Parent.Remove RowItem.ID
    End If
    Exit Sub
bye:
Resume
End Sub



'
'{5B376AF5-339B-4365-BA80-785E28BCF4DA}
Private Sub Run_VBUpdateSymmetricObjRef(SymmetricFieldName As Variant, ForwardFieldName As Variant, SymmetricPartName As Variant, ObjTypeName As Variant, Optional RowItem As Object)
On Error Resume Next

 
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKO", "Оплата " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKO_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKO_DEF.Item(1)
 End If
 
 Set Obj.ToClient = RowItem.Application
 Obj.PLPDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
On Error Resume Next

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
On Error Resume Next

On Error Resume Next
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Обновление Имени объекта
'{61393545-ABF7-46F7-82F3-9B7E610DD9C0}
Private Sub Run_VBUpdateObjName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save
End Sub



'Метод создает новый элемент в иерархии Имущественных Комплексов (приложение RealEstate) при создании нового элемента к нему линкуется объект ИК, форма которого и вызывается на редактирование
'{477B8D25-4FF7-491A-A0B0-D3437EC16957}
Private Sub Run_MakeNewFolderEC(FolderID As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
 Dim ID As String
 Dim Obj As Object ' EstComplex.Application ' Object
 Dim GObj As Object
 Dim fold As Object 'EstCatalog.Application ' Object
 
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "EstComplex", RowItem.TheName & " " & Date)
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 If Obj.EC_Def.Count = 0 Then
    With Obj.EC_Def.Add
        .TheName = RowItem.TheName
    End With
 Else
    Obj.EC_Def.Item(1).TheName = RowItem.TheName
 End If
 Obj.Save
 Set RowItem.LinkedEC = Obj
 RowItem.Save
 Set GObj = RowItem.Application.Manager.GetInstanceGUI(Obj.ID)
 GObj.Show "", Obj, True 'False
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 RowItem.TheName = Obj.EC_Def.Item(1).TheName
 RowItem.Save
 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание ИК"

End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "Заявка " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Item(1)
 End If
 
 Set Obj.ClientFrom = RowItem.Application
 Obj.QueryDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub



'Создание номенклатуры по шаблону
'{B91ABF3A-31F8-4A82-8D41-EF463DBA32D0}
Private Sub Run_SSCreateNomen(Name As Variant, Optional RowItem As Object)
On Error Resume Next

'pointCreateLine
End Sub





