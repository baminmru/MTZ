VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnEntryPoints_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerEPFilterLink 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerEntryPoints 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlEntryPoints 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdEPFilterLinkAcc 
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
      Begin MTZ_PANEL.DropButton cmdEPFilterLinkRun 
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
      Begin VB.CommandButton cmdEPFilterLinkFnd 
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
      Begin VB.CommandButton cmdEPFilterLinkCfg 
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
      Begin VB.CommandButton cmdEPFilterLinkPrn 
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
      Begin VB.CommandButton cmdEPFilterLinkRef 
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
      Begin VB.CommandButton cmdEPFilterLinkDel 
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
      Begin VB.CommandButton cmdEPFilterLinkEdit 
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
      Begin VB.CommandButton cmdEPFilterLinkAdd 
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
      Begin GridEX20.GridEX gridEPFilterLink 
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
         Column(1)       =   "vpnEntryPoints_.ctx":0000
         Column(2)       =   "vpnEntryPoints_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnEntryPoints_.ctx":016C
         FormatStyle(2)  =   "vpnEntryPoints_.ctx":02C8
         FormatStyle(3)  =   "vpnEntryPoints_.ctx":0378
         FormatStyle(4)  =   "vpnEntryPoints_.ctx":042C
         FormatStyle(5)  =   "vpnEntryPoints_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnEntryPoints_.ctx":05BC
      End
      Begin VB.CommandButton cmdEntryPointsAcc 
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
      Begin VB.CommandButton cmdEntryPointsRef 
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
      Begin VB.CommandButton cmdEntryPointsDel 
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
      Begin VB.CommandButton cmdEntryPointsEdit 
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
      Begin VB.CommandButton cmdEntryPointsAdd 
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
      Begin VB.CommandButton cmdEntryPointsAddRoot 
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
      Begin MSComctlLib.TreeView treeEntryPoints 
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
   Begin VB.Menu mnuPopupEntryPoints 
      Caption         =   "Меню для Меню"
      Visible         =   0   'False
      Begin VB.Menu mnuEntryPointsAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuEntryPointsAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuEntryPointsEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuEntryPointsDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuEntryPointsS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEntryPointsBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuEntryPointsCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuEntryPointsCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuEntryPointsPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuEntryPointsCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuEntryPointsCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuEntryPointsRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuEntryPointsAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupEPFilterLink 
      Caption         =   "Меню для Привязка фильтра"
      Visible         =   0   'False
      Begin VB.Menu mnuEPFilterLinkAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuEPFilterLinkEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuEPFilterLinkDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuEPFilterLinkOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuEPFilterLinkRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuEPFilterLinkS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEPFilterLinkBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuEPFilterLinkCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuEPFilterLinkCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuEPFilterLinkPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuEPFilterLinkCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuEPFilterLinkCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuEPFilterLinkPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuEPFilterLinkCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuEPFilterLinkFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuEPFilterLinkAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnEntryPoints_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Меню
Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private menuActionEntryPoints As String
Private fndEPFilterLink As Object
Private menuActionEPFilterLink As String





Private Sub pnlEntryPoints_PositionChanged()
  pnlEntryPoints.SavePosition
End Sub
Private Sub treeEntryPoints_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupEntryPoints
End If
End Sub
Private Sub mnuEntryPointsAddRoot_click()
   menuActionEntryPoints = "ADDROOT"
   menuTimerEntryPoints.Enabled = True
End Sub
Private Sub mnuEntryPointsAdd_click()
   menuActionEntryPoints = "ADD"
   menuTimerEntryPoints.Enabled = True
End Sub
Private Sub mnuEntryPointsEdit_click()
   menuActionEntryPoints = "EDIT"
   menuTimerEntryPoints.Enabled = True
End Sub
Private Sub mnuEntryPointsDelete_click()
   menuActionEntryPoints = "DEL"
   menuTimerEntryPoints.Enabled = True
End Sub
  Private Sub mnuEntryPointsCOPY_Click()
    On Error Resume Next
    If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuEntryPointsCUT_Click()
    On Error Resume Next
    If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, bm
    Set u = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
    SaveToBuffer u
    Set bm = u.Parent
    u.Parent.Delete u.ID
    treeEntryPoints.Nodes.Remove treeEntryPoints.SelectedItem.key
  End Sub
Private Sub mnuEntryPointsPASTE_Click()
On Error Resume Next
If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
  Set u = f.EntryPoints.Add()
  If GetFromBuffer(u) Then
    If treeEntryPoints.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treeEntryPoints, treeEntryPoints.SelectedItem.key
    End If
  Else
   f.EntryPoints.Refresh
  End If
End Sub
Private Sub mnuEntryPointsCHANGE_Click()
  On Error Resume Next
  If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, bm
  Set u = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
  If GetFromBuffer(u) Then
    treeEntryPoints.SelectedItem.Text = u.brief
      treeEntryPoints.SelectedItem.Expanded = False
      While treeEntryPoints.SelectedItem.Children > 0
        treeEntryPoints.Nodes.Remove treeEntryPoints.SelectedItem.Child.key
      Wend
      treeEntryPoints.Nodes.Add(treeEntryPoints.SelectedItem.key, 4, "Expanding ...").Tag = "ToDelete"
      treeEntryPoints_Expand treeEntryPoints.SelectedItem
  End If
End Sub
  Private Sub mnuEntryPointsCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuEntryPointsRef_click()
   menuActionEntryPoints = "REF"
   menuTimerEntryPoints.Enabled = True
End Sub
Private Sub mnuEntryPointsAcc_click()
   menuActionEntryPoints = "ACC"
   menuTimerEntryPoints.Enabled = True
End Sub
Private Sub menuTimerEntryPoints_timer()
   menuTimerEntryPoints.Enabled = False
   If menuActionEntryPoints = "ADDROOT" Then cmdEntryPointsAddRoot_Click
   If menuActionEntryPoints = "ADD" Then cmdEntryPointsAdd_Click
   If menuActionEntryPoints = "EDIT" Then cmdEntryPointsEdit_Click
   If menuActionEntryPoints = "DEL" Then cmdEntryPointsDel_Click
   If menuActionEntryPoints = "REF" Then cmdEntryPointsREf_Click
   If menuActionEntryPoints = "ACC" Then cmdEntryPointsAcc_Click
   menuActionEntryPoints = ""
End Sub
Private Sub cmdEntryPointsAdd_Click()
  On Error Resume Next
  On Error Resume Next
  Dim f As Object, p As Object
If (treeEntryPoints.SelectedItem Is Nothing) Then Exit Sub
  Set p = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
  Set f = p.EntryPoints.Add()

      Set frmEntryPoints_.item = f
again:       frmEntryPoints_.NotFirstTime = False
      frmEntryPoints_.OnInit
      frmEntryPoints_.Show vbModal
      If frmEntryPoints_.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treeEntryPoints.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treeEntryPoints, treeEntryPoints.SelectedItem.key
          End If
          Set treeEntryPoints.SelectedItem = treeEntryPoints.Nodes.item(f.ID & "EntryPoints")
      Else
        item.EntryPoints.Delete f.ID
        item.EntryPoints.Remove f.ID
      End If
End Sub

Private Sub cmdEntryPointsAddRoot_Click()
  On Error Resume Next
Dim f As Object, p As Object
  Set f = item.EntryPoints.Add()

      Set frmEntryPoints_.item = f
again:       frmEntryPoints_.NotFirstTime = False
      frmEntryPoints_.OnInit
      frmEntryPoints_.Show vbModal
      If frmEntryPoints_.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
    item.EntryPoints.Refresh
    treeEntryPoints.Nodes.Clear
    item.EntryPoints.FillTree treeEntryPoints
          Set treeEntryPoints.SelectedItem = treeEntryPoints.Nodes.item(f.ID & "EntryPoints")
      Else
        item.EntryPoints.Remove f.ID
      End If
End Sub

Private Sub cmdEntryPointsEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
  Set f = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
  Set frmEntryPoints_.item = f
again:   frmEntryPoints_.NotFirstTime = False
  frmEntryPoints_.OnInit
  frmEntryPoints_.Show vbModal
  If frmEntryPoints_.OK Then
    err.Clear
    f.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdEntryPointsDel_Click()
  On Error Resume Next
  Dim f As Object
  If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
  Set f = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
  If MsgBox("Удалить элемент" & vbCrLf & f.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
  On Error GoTo bye
     If f.Parent.Delete(f.ID) Then
       treeEntryPoints.Nodes.Remove treeEntryPoints.SelectedItem.key
     End If
  End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub cmdEntryPointsAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
  Set f = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
  item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdEntryPointsREf_Click()
  On Error Resume Next
  item.EntryPoints.Refresh
  treeEntryPoints.Nodes.Clear
  item.EntryPoints.FillTree treeEntryPoints
End Sub

Private Sub treeEntryPoints_DblClick()
If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
  cmdEntryPointsEdit_Click
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function

Private Sub treeEntryPoints_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeEntryPoints.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = item.FindRowObject("EntryPoints", Left(Node.key, 38))
 f.expandpart treeEntryPoints, Node.key
 ParentForm.MousePointer = vbNormal
End If
 Set treeEntryPoints.SelectedItem = Node
 treeEntryPoints_NodeClick Node
End Sub

Private Sub treeEntryPoints_Collapse(ByVal Node As MSComctlLib.Node)
 Set treeEntryPoints.SelectedItem = Node
 treeEntryPoints_NodeClick Node
End Sub

Private Sub pnlEntryPoints_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treeEntryPoints.Left = Left
  treeEntryPoints.Top = Top + 25 * Screen.TwipsPerPixelY
  treeEntryPoints.Width = Width
  treeEntryPoints.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdEntryPointsAddRoot.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEntryPointsAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEntryPointsEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEntryPointsDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEntryPointsRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEntryPointsAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEntryPointsAddRoot.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdEntryPointsAdd.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdEntryPointsEdit.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdEntryPointsDel.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdEntryPointsRef.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdEntryPointsAcc.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdEPFilterLinkCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridEPFilterLink, "gridEPFilterLink"
Set jset = Nothing
End Sub

Private Sub cmdEPFilterLinkPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridEPFilterLink, "Привязка фильтра"
Set jset = Nothing
End Sub

Private Sub cmdEPFilterLinkAcc_Click()
On Error Resume Next
If gridEPFilterLink.ItemCount = 0 Then Exit Sub
If gridEPFilterLink.Row > 0 Then
 If gridEPFilterLink.RowIndex(gridEPFilterLink.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridEPFilterLink.RowBookmark(gridEPFilterLink.RowIndex(gridEPFilterLink.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdEPFilterLinkFnd_Click()
  On Error Resume Next
  fndEPFilterLink.ShowForm
End Sub
Private Sub cmdEPFilterLinkRun_Click()
  On Error Resume Next
  gridEPFilterLink_DblClick
End Sub
Private Sub pnlEntryPoints_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridEPFilterLink.Left = Left
  gridEPFilterLink.Top = Top + 25 * Screen.TwipsPerPixelY
  gridEPFilterLink.Width = Width
  gridEPFilterLink.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdEPFilterLinkAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEPFilterLinkEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEPFilterLinkDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEPFilterLinkRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEPFilterLinkPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEPFilterLinkCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEPFilterLinkFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEPFilterLinkRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEPFilterLinkAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdEPFilterLinkAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdEPFilterLinkEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdEPFilterLinkDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdEPFilterLinkRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdEPFilterLinkPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdEPFilterLinkCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdEPFilterLinkFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdEPFilterLinkRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdEPFilterLinkAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub treeEntryPoints_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object
  Set p = item.FindRowObject("EntryPoints", Left(Node.key, 38))
  p.EPFilterLink.Refresh
  p.EPFilterLink.preparegrid gridEPFilterLink
  LoadGridLayout gridEPFilterLink
    Set fndEPFilterLink = Nothing
    Set fndEPFilterLink = CreateObject("MTZ_JSetup.GridFinder")
    fndEPFilterLink.Init gridEPFilterLink
End Sub

Private Sub gridEPFilterLink_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object
  If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
  Set p = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
  p.EPFilterLink.LoadRow gridEPFilterLink, RowIndex, Bookmark, Values
  Set p = Nothing
End Sub
Private Sub gridEPFilterLink_KeyPress(KeyAscii As Integer)
  If gridEPFilterLink.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndEPFilterLink.FindOnPress KeyAscii
End Sub

Private Sub gridEPFilterLink_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
    If gridEPFilterLink.Row = 0 Then Exit Sub
    If gridEPFilterLink.RowIndex(gridEPFilterLink.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridEPFilterLink.RowBookmark(gridEPFilterLink.RowIndex(gridEPFilterLink.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
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
Private Sub cmdEPFilterLinkEdit_Click()
    On Error Resume Next
    If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
    If gridEPFilterLink.Row = 0 Then Exit Sub
    If gridEPFilterLink.RowIndex(gridEPFilterLink.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridEPFilterLink.RowBookmark(gridEPFilterLink.RowIndex(gridEPFilterLink.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmEPFilterLink_.item = u
again:     frmEPFilterLink_.NotFirstTime = False
    frmEPFilterLink_.OnInit
    frmEPFilterLink_.Show vbModal
    If frmEPFilterLink_.OK Then
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridEPFilterLink.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
  Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdEPFilterLinkRef_Click()
  On Error Resume Next
    If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
  gridEPFilterLink.Columns.Clear
  gridEPFilterLink.ItemCount = 0
   treeEntryPoints_NodeClick treeEntryPoints.SelectedItem
End Sub
Private Sub cmdEPFilterLinkDel_Click()
  On Error Resume Next
   gridEPFilterLink.Delete
End Sub
Private Sub cmdEPFilterLinkAdd_Click()
  On Error Resume Next
   If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
   Dim gu As Object
   Set gu = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
   Dim u As Object
   Set u = gu.EPFilterLink.Add()

      Set frmEPFilterLink_.item = u
again:       frmEPFilterLink_.NotFirstTime = False
      frmEPFilterLink_.OnInit
      frmEPFilterLink_.Show vbModal
      If frmEPFilterLink_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridEPFilterLink.ItemCount = gu.EPFilterLink.Count
        gridEPFilterLink.Refresh
        gridEPFilterLink.RefreshGroups
        gridEPFilterLink.RefreshSort
        gridEPFilterLink.MoveToBookmark u.ID & "EPFilterLink"
      Else
        gu.EPFilterLink.Delete u.ID
        gu.EPFilterLink.Remove u.ID
      End If
Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridEPFilterLink_DblClick()
    cmdEPFilterLinkEdit_Click
End Sub
Private Sub gridEPFilterLink_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridEPFilterLink.ItemCount = 0 Then Exit Sub
 If gridEPFilterLink.Row > 0 Then
   If LastRow <> gridEPFilterLink.Row And LastRow > 0 Then
     gridEPFilterLink.GetRowData(LastRow).RowStyle = "Default"
     gridEPFilterLink.GetRowData(gridEPFilterLink.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuEPFilterLinkPASTE_Click()
On Error Resume Next
   If treeEntryPoints.SelectedItem Is Nothing Then Exit Sub
   Dim gu As Object
   Set gu = item.FindRowObject("EntryPoints", Left(treeEntryPoints.SelectedItem.key, 38))
   Dim u As Object
   Set u = gu.EPFilterLink.Add()
    If GetFromBuffer(u) Then
      gridEPFilterLink.ItemCount = u.Parent.Count
    Else
      gu.EPFilterLink.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridEPFilterLink_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdEPFilterLinkCfg_Click
        End If
    End If
End Sub

Private Sub gridEPFilterLink_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupEPFilterLink
End If
End Sub
Private Sub mnuEPFilterLinkAdd_click()
   menuActionEPFilterLink = "ADD"
   menuTimerEPFilterLink.Enabled = True
End Sub
Private Sub mnuEPFilterLinkEdit_click()
   menuActionEPFilterLink = "EDIT"
   menuTimerEPFilterLink.Enabled = True
End Sub
Private Sub mnuEPFilterLinkDelete_click()
   menuActionEPFilterLink = "DEL"
   menuTimerEPFilterLink.Enabled = True
End Sub
Private Sub mnuEPFilterLinkOpen_click()
   menuActionEPFilterLink = "RUN"
   menuTimerEPFilterLink.Enabled = True
End Sub
Private Sub mnuEPFilterLinkRef_click()
   menuActionEPFilterLink = "REF"
   menuTimerEPFilterLink.Enabled = True
End Sub
  Private Sub mnuEPFilterLinkCOPY_Click()
    On Error Resume Next
    If gridEPFilterLink.ItemCount = 0 Then Exit Sub
    If gridEPFilterLink.Row > 0 Then
     If gridEPFilterLink.RowIndex(gridEPFilterLink.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridEPFilterLink.RowBookmark(gridEPFilterLink.RowIndex(gridEPFilterLink.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuEPFilterLinkCUT_Click()
    On Error Resume Next
    If gridEPFilterLink.ItemCount = 0 Then Exit Sub
    If gridEPFilterLink.Row > 0 Then
     If gridEPFilterLink.RowIndex(gridEPFilterLink.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridEPFilterLink.RowBookmark(gridEPFilterLink.RowIndex(gridEPFilterLink.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridEPFilterLink.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuEPFilterLinkCHANGE_Click()
  On Error Resume Next
  If gridEPFilterLink.ItemCount = 0 Then Exit Sub
  If gridEPFilterLink.Row > 0 Then
   If gridEPFilterLink.RowIndex(gridEPFilterLink.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridEPFilterLink.RowBookmark(gridEPFilterLink.RowIndex(gridEPFilterLink.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridEPFilterLink.ItemCount = u.Parent.Count
      gridEPFilterLink.RefreshRowIndex gridEPFilterLink.RowIndex(gridEPFilterLink.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuEPFilterLinkCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuEPFilterLinkPrn_click()
   menuActionEPFilterLink = "PRN"
   menuTimerEPFilterLink.Enabled = True
End Sub
Private Sub mnuEPFilterLinkCfg_click()
   menuActionEPFilterLink = "CFG"
   menuTimerEPFilterLink.Enabled = True
End Sub
Private Sub mnuEPFilterLinkFind_click()
   menuActionEPFilterLink = "FND"
   menuTimerEPFilterLink.Enabled = True
End Sub
Private Sub mnuEPFilterLinkAcc_click()
   menuActionEPFilterLink = "ACC"
   menuTimerEPFilterLink.Enabled = True
End Sub
Private Sub menuTimerEPFilterLink_timer()
   menuTimerEPFilterLink.Enabled = False
   If menuActionEPFilterLink = "ADD" Then cmdEPFilterLinkAdd_Click
   If menuActionEPFilterLink = "EDIT" Then cmdEPFilterLinkEdit_Click
   If menuActionEPFilterLink = "DEL" Then cmdEPFilterLinkDel_Click
   If menuActionEPFilterLink = "RUN" Then cmdEPFilterLinkRun_Click
   If menuActionEPFilterLink = "REF" Then cmdEPFilterLinkRef_Click
   If menuActionEPFilterLink = "PRN" Then cmdEPFilterLinkPrn_Click
   If menuActionEPFilterLink = "CFG" Then cmdEPFilterLinkCfg_Click
   If menuActionEPFilterLink = "FND" Then cmdEPFilterLinkFnd_Click
   If menuActionEPFilterLink = "ACC" Then cmdEPFilterLinkAcc_Click
   menuActionEPFilterLink = ""
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
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdEntryPointsAddRoot, cmdEntryPointsAddRoot.Tag
  LoadBtnPictures cmdEntryPointsAdd, cmdEntryPointsAdd.Tag
  LoadBtnPictures cmdEntryPointsEdit, cmdEntryPointsEdit.Tag
  LoadBtnPictures cmdEntryPointsDel, cmdEntryPointsDel.Tag
  LoadBtnPictures cmdEntryPointsRef, cmdEntryPointsRef.Tag
  LoadBtnPictures cmdEntryPointsAcc, cmdEntryPointsAcc.Tag
item.EntryPoints.FillTree treeEntryPoints
  LoadBtnPictures cmdEPFilterLinkAdd, cmdEPFilterLinkAdd.Tag
  LoadBtnPictures cmdEPFilterLinkEdit, cmdEPFilterLinkEdit.Tag
  LoadBtnPictures cmdEPFilterLinkDel, cmdEPFilterLinkDel.Tag
  LoadBtnPictures cmdEPFilterLinkRef, cmdEPFilterLinkRef.Tag
  LoadBtnPictures cmdEPFilterLinkPrn, cmdEPFilterLinkPrn.Tag
  LoadBtnPictures cmdEPFilterLinkFnd, cmdEPFilterLinkFnd.Tag
  LoadBtnPictures cmdEPFilterLinkCfg, cmdEPFilterLinkCfg.Tag
  LoadBtnPictures cmdEPFilterLinkRun, cmdEPFilterLinkRun.Tag
  LoadBtnPictures cmdEPFilterLinkAcc, cmdEPFilterLinkAcc.Tag
  gridEPFilterLink.Columns.Clear
  gridEPFilterLink.ItemCount = 0
  cmdEPFilterLinkRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlEntryPoints.RestorePosition
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
  Set item = aItem
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
  pnlEntryPoints.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set item = Nothing
  Set fndEPFilterLink = Nothing
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

  RowItem.Person.Secure item.SecureStyleID
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
    Set part_item = part_col.item(1)
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
  Set Obj = RowItem.Report.VRRPT_MAIN.item(1)
 End If
 
 Set Obj.Author = RowItem.Application.FindRowObject("Users", item.Application.MTZSession.GetSessionUserID())
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
    Set part_item = part_col.item(1)
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
  Set Obj = RowItem.TheDocument.PEKP_DEF.item(1)
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
        OK = item.Application.Manager.GetObjectListDialogEx(ID, brief, "", ObjTypeName)
    Else
        ID = CreateGUID2
        If Len(ObjTypeName) = 0 Then
            Dim newObj As Object
            Set newObj = item.Application.Manager.GetNewObject
            If Not (newObj Is Nothing) Then
                OK = True
                ID = newObj.ID
            End If
        Else
            OK = item.Application.Manager.NewInstance(ID, ObjTypeName, "")
        End If
        Dim ref As Object, objGui As Object
        Set ref = item.Application.Manager.GetInstanceObject(ID)
        If Not ref Is Nothing Then
          Set objGui = item.Application.Manager.GetInstanceGUI(ID)
          If objGui Is Nothing Then Set ref = Nothing: Exit Sub
          objGui.Show "", ref, False
          Set objGui = Nothing
        Else
          OK = False
        End If
    End If
    Dim Obj As Object
    Set Obj = item.Application.Manager.GetInstanceObject(ID)
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
        Call item.Application.Manager.AddCustomObjects(Coll, Obj.ID)
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
  Set Obj = RowItem.TheDocument.PEKO_DEF.item(1)
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
    Set Obj = item.Manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = item.Manager.GetInstanceGUI(Obj.ID)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If Obj.MTZSession.CheckRight(Obj.SecureStyleID, Obj.TypeName & ":" & "M" & i) Then
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
item.Name = RowItem.Description
ParentForm.Caption = item.Name
item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
item.Name = RowItem.Name
ParentForm.Caption = item.Name
item.Save
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
    Obj.EC_Def.item(1).TheName = RowItem.TheName
 End If
 Obj.Save
 Set RowItem.LinkedEC = Obj
 RowItem.Save
 Set GObj = RowItem.Application.Manager.GetInstanceGUI(Obj.ID)
 GObj.Show "", Obj, True 'False
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 RowItem.TheName = Obj.EC_Def.item(1).TheName
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
item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = item.Name
item.Save
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
  Set Obj = RowItem.TheDocument.PEKZ_DEF.item(1)
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





