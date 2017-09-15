VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl vpnTheDiffPath_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerTheDiffPath 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlTheDiffPath 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdTheDiffPathAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdTheDiffPathRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   11
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdTheDiffPathFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdTheDiffPathCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdTheDiffPathPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   8
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdTheDiffPathRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdTheDiffPathDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdTheDiffPathEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdTheDiffPathAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdTTheDiffPathRef 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridTheDiffPath 
         Height          =   480
         Left            =   3900
         TabIndex        =   2
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
         Column(1)       =   "vpnTheDiffPath_.ctx":0000
         Column(2)       =   "vpnTheDiffPath_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnTheDiffPath_.ctx":016C
         FormatStyle(2)  =   "vpnTheDiffPath_.ctx":02C8
         FormatStyle(3)  =   "vpnTheDiffPath_.ctx":0378
         FormatStyle(4)  =   "vpnTheDiffPath_.ctx":042C
         FormatStyle(5)  =   "vpnTheDiffPath_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnTheDiffPath_.ctx":05BC
      End
      Begin MSComctlLib.TreeView treeTheDiffPath 
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
   Begin VB.Menu mnuPopupTheDiffPath 
      Caption         =   "Меню для Элементы маршрута"
      Visible         =   0   'False
      Begin VB.Menu mnuTheDiffPathAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuTheDiffPathEdit 
         Caption         =   "Свойства"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuTheDiffPathDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuTheDiffPathOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuTheDiffPathRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuTheDiffPathS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuTheDiffPathBuffer 
         Caption         =   "Буфер"
         Enabled         =   0   'False
         Begin VB.Menu mnuTheDiffPathCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuTheDiffPathCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuTheDiffPathPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuTheDiffPathCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuTheDiffPathCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuTheDiffPathPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuTheDiffPathCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuTheDiffPathFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuTheDiffPathAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnTheDiffPath_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndTheDiffPath As Object
Private menuActionTheDiffPath As String





Private Sub pnlTheDiffPath_PositionChanged()
  pnlTheDiffPath.SavePosition
End Sub
Private Sub cmdTheDiffPathPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridTheDiffPath, "Элементы маршрута"
Set jset = Nothing
End Sub

Private Sub cmdTheDiffPathFnd_Click()
  On Error Resume Next
  fndTheDiffPath.ShowForm
End Sub
Private Sub cmdTheDiffPathRun_Click()
  On Error Resume Next
  gridTheDiffPath_DblClick
End Sub
Private Sub pnlTheDiffPath_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treeTheDiffPath.Left = Left
  treeTheDiffPath.Top = Top + 25 * Screen.TwipsPerPixelY
  treeTheDiffPath.Width = Width
  treeTheDiffPath.Height = Height - 25 * Screen.TwipsPerPixelY
End Sub
Private Sub pnlTheDiffPath_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridTheDiffPath.Left = Left
  gridTheDiffPath.Top = Top + 25 * Screen.TwipsPerPixelY
  gridTheDiffPath.Width = Width
  gridTheDiffPath.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdTheDiffPathAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdTheDiffPathEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdTheDiffPathDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdTheDiffPathRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdTheDiffPathPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdTheDiffPathCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdTheDiffPathFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdTheDiffPathRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdTheDiffPathAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
 Private Sub cmdTheDiffPathDel_Click()
  On Error Resume Next
  gridTheDiffPath.Delete
End Sub

Public Function IsOK() As Boolean
        IsOK = True
End Function
 Private Sub cmdTheDiffPathEdit_Click()
On Error Resume Next
If gridTheDiffPath.ItemCount = 0 Then Exit Sub
If gridTheDiffPath.Row > 0 Then
 If gridTheDiffPath.RowIndex(gridTheDiffPath.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridTheDiffPath.RowBookmark(gridTheDiffPath.RowIndex(gridTheDiffPath.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "")
    Set frm.Item = u
again:     frm.NotFirstTime = False
    frm.OnInit
    frm.Show vbModal
    If frm.OK Then
    On Error GoTo bye
    u.Save
    u.brief True
    If err.Number <> 0 Then
bye:
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
On Error Resume Next
      GoTo again
    End If
On Error Resume Next
    gridTheDiffPath.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

 Private Sub cmdTheDiffPathAdd_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeTheDiffPath.SelectedItem Is Nothing Then Exit Sub
    If treeTheDiffPath.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeTheDiffPath.SelectedItem.key, 39, 38)
      struct = treeTheDiffPath.SelectedItem.Parent.Tag
      Set p = Item.FindRowObject(struct, ID)
      If Item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = Item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeTheDiffPath.SelectedItem.Tag <> "object" Then
        If treeTheDiffPath.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeTheDiffPath.SelectedItem.Parent.key, 39, 38)
        struct = treeTheDiffPath.SelectedItem.Parent.Parent.Tag
        Set p = Item.FindRowObject(struct, ID)
        Set u = Item.itemcollection(p, treeTheDiffPath.SelectedItem.Tag).Add
      End If
      If treeTheDiffPath.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeTheDiffPath.SelectedItem.Parent.key, 39, 38)
        Set p = Item.Manager.GetInstanceObject(ID)
        Set u = Item.itemcollection(p, treeTheDiffPath.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "")



    Set frm.Item = u
again:     frm.NotFirstTime = False
    frm.OnInit
    frm.Show vbModal
    If frm.OK Then
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
      GoTo again
    End If
      gridTheDiffPath.ItemCount = u.Parent.Count
        gridTheDiffPath.Refresh
        gridTheDiffPath.RefreshGroups
        gridTheDiffPath.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeTheDiffPath.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeTheDiffPath.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeTheDiffPath.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeTheDiffPath_Expand treeTheDiffPath.Nodes.Item(rnode.key)
    Else
     u.Parent.Delete u.ID
     u.Parent.Remove u.ID
    End If
    Set frm = Nothing
End Sub

Private Sub cmdTheDiffPathCfg_Click()
  On Error Resume Next
  Dim rnode As MSComctlLib.Node
  Set rnode = treeTheDiffPath.SelectedItem
  If rnode.Tag = "object" Then Exit Sub
  If rnode.Tag = "Row" Then
    Set rnode = rnode.Parent
  End If
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridTheDiffPath, "gridTheDiffPath" & rnode.Tag
Set jset = Nothing
End Sub


Private Sub treeTheDiffPath_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeTheDiffPath.Nodes.Remove Node.Child.Index
 Item.Expand treeTheDiffPath, Node.key, ""
 ParentForm.MousePointer = vbNormal
End If
 Set treeTheDiffPath.SelectedItem = Node
 treeTheDiffPath_NodeClick Node
End Sub

Private Sub treeTheDiffPath_Collapse(ByVal Node As MSComctlLib.Node)
 Set treeTheDiffPath.SelectedItem = Node
 treeTheDiffPath_NodeClick Node
End Sub

Private Sub treeTheDiffPath_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object, ID As String, struct As String
  If Node.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(Node.key, 39, 38)
    struct = Node.Parent.Tag
    Set p = Item.FindRowObject(struct, ID)
    On Error Resume Next
      Item.itemcollection(p.Parent.Parent, TypeName(p)).preparegrid gridTheDiffPath
      LoadGridLayout gridTheDiffPath, gridTheDiffPath.Name & Node.Parent.Tag
    Set fndTheDiffPath = Nothing
    Set fndTheDiffPath = CreateObject("MTZ_JSetup.GridFinder")
    fndTheDiffPath.Init gridTheDiffPath
  ElseIf Node.Tag <> "object" Then
    If Node.Parent Is Nothing Then
      Item.itemcollection(Item, Node.Tag).preparegrid gridTheDiffPath
      LoadGridLayout gridTheDiffPath, gridTheDiffPath.Name & Node.Tag
    Else
     If Node.Parent.Tag = "Row" Then
       ID = Mid(Node.Parent.key, 39, 38)
       struct = Node.Parent.Parent.Tag
       Set p = Item.FindRowObject(struct, ID)
       Item.itemcollection(p, Node.Tag).preparegrid gridTheDiffPath
       LoadGridLayout gridTheDiffPath, gridTheDiffPath.Name & Node.Tag
     End If
     If Node.Parent.Tag = "object" Then
       ID = Mid(Node.Parent.key, 39, 38)
       Set p = Item.Manager.GetInstanceObject(ID)
       Item.itemcollection(p, Node.Tag).preparegrid gridTheDiffPath
       LoadGridLayout gridTheDiffPath, gridTheDiffPath.Name & Node.Tag
     End If
    End If
  End If
End Sub
Private Sub cmdTTheDiffPathRef_Click()
  On Error Resume Next
  treeTheDiffPath.Nodes.Clear
  Item.FillTree treeTheDiffPath, "", "", "TheDiffPath"
  gridTheDiffPath.Columns.Clear
  gridTheDiffPath.ItemCount = 0
End Sub
Private Sub cmdTheDiffPathRef_Click()
  On Error Resume Next
  treeTheDiffPath_NodeClick treeTheDiffPath.SelectedItem
End Sub
Private Sub cmdTheDiffPathAcc_Click()
On Error Resume Next
If gridTheDiffPath.ItemCount = 0 Then Exit Sub
If gridTheDiffPath.Row > 0 Then
 If gridTheDiffPath.RowIndex(gridTheDiffPath.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridTheDiffPath.RowBookmark(gridTheDiffPath.RowIndex(gridTheDiffPath.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub gridTheDiffPath_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object, ID As String, struct As String
  If treeTheDiffPath.SelectedItem Is Nothing Then Exit Sub
  If treeTheDiffPath.SelectedItem.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(treeTheDiffPath.SelectedItem.key, 39, 38)
    struct = treeTheDiffPath.SelectedItem.Parent.Tag
    Set p = Item.FindRowObject(struct, ID)
      Item.itemcollection(p.Parent.Parent, TypeName(p)).LoadRow gridTheDiffPath, RowIndex, Bookmark, Values
    Set p = Nothing
  ElseIf treeTheDiffPath.SelectedItem.Tag <> "object" Then
      If treeTheDiffPath.SelectedItem.Parent Is Nothing Then
          Item.itemcollection(Item, treeTheDiffPath.SelectedItem.Tag).LoadRow gridTheDiffPath, RowIndex, Bookmark, Values
      Else
        If treeTheDiffPath.SelectedItem.Parent.Tag = "Row" Then
          ID = Mid(treeTheDiffPath.SelectedItem.Parent.key, 39, 38)
          struct = treeTheDiffPath.SelectedItem.Parent.Parent.Tag
          Set p = Item.FindRowObject(struct, ID)
          Item.itemcollection(p, treeTheDiffPath.SelectedItem.Tag).LoadRow gridTheDiffPath, RowIndex, Bookmark, Values
        End If
        If treeTheDiffPath.SelectedItem.Parent.Tag = "object" Then
          ID = Mid(treeTheDiffPath.SelectedItem.Parent.key, 39, 38)
          Set p = Item.Manager.GetInstanceObject(ID)
          Item.itemcollection(p, treeTheDiffPath.SelectedItem.Tag).LoadRow gridTheDiffPath, RowIndex, Bookmark, Values
        End If
    End If
  End If
End Sub
Private Sub gridTheDiffPath_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridTheDiffPath.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    On Error Resume Next
      Dim rnode As MSComctlLib.Node, tid As String
      Set rnode = treeTheDiffPath.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeTheDiffPath.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeTheDiffPath.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeTheDiffPath_Expand treeTheDiffPath.Nodes.Item(rnode.key)
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridTheDiffPath_DblClick()
On Error Resume Next
If gridTheDiffPath.ItemCount = 0 Then Exit Sub
If gridTheDiffPath.Row > 0 Then
 If gridTheDiffPath.RowIndex(gridTheDiffPath.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridTheDiffPath.RowBookmark(gridTheDiffPath.RowIndex(gridTheDiffPath.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "")
    Set frm.Item = u
again:     frm.NotFirstTime = False
    frm.OnInit
    frm.Show vbModal
    If frm.OK Then
    On Error GoTo bye
    u.Save
    u.brief True
bye:
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
On Error Resume Next
      GoTo again
    End If
On Error Resume Next
    gridTheDiffPath.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

Private Sub gridTheDiffPath_KeyPress(KeyAscii As Integer)
  If gridTheDiffPath.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndTheDiffPath.FindOnPress KeyAscii
End Sub

Private Sub gridTheDiffPath_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridTheDiffPath.ItemCount = 0 Then Exit Sub
 If gridTheDiffPath.Row > 0 Then
   If LastRow <> gridTheDiffPath.Row And LastRow > 0 Then
     gridTheDiffPath.GetRowData(LastRow).RowStyle = "Default"
     gridTheDiffPath.GetRowData(gridTheDiffPath.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub gridTheDiffPath_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupTheDiffPath
End If
End Sub
Private Sub mnuTheDiffPathAdd_click()
   menuActionTheDiffPath = "ADD"
   menuTimerTheDiffPath.Enabled = True
End Sub
Private Sub mnuTheDiffPathEdit_click()
   menuActionTheDiffPath = "EDIT"
   menuTimerTheDiffPath.Enabled = True
End Sub
Private Sub mnuTheDiffPathDelete_click()
   menuActionTheDiffPath = "DEL"
   menuTimerTheDiffPath.Enabled = True
End Sub
Private Sub mnuTheDiffPathOpen_click()
   menuActionTheDiffPath = "RUN"
   menuTimerTheDiffPath.Enabled = True
End Sub
Private Sub mnuTheDiffPathRef_click()
   menuActionTheDiffPath = "REF"
   menuTimerTheDiffPath.Enabled = True
End Sub
  Private Sub mnuTheDiffPathCOPY_Click()
    On Error Resume Next
    If gridTheDiffPath.ItemCount = 0 Then Exit Sub
    If gridTheDiffPath.Row > 0 Then
     If gridTheDiffPath.RowIndex(gridTheDiffPath.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridTheDiffPath.RowBookmark(gridTheDiffPath.RowIndex(gridTheDiffPath.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuTheDiffPathCUT_Click()
    On Error Resume Next
    If gridTheDiffPath.ItemCount = 0 Then Exit Sub
    If gridTheDiffPath.Row > 0 Then
     If gridTheDiffPath.RowIndex(gridTheDiffPath.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridTheDiffPath.RowBookmark(gridTheDiffPath.RowIndex(gridTheDiffPath.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridTheDiffPath.ItemCount = bm.Count
      End If
    End If
  End Sub
 Private Sub mnuTheDiffPathPASTE_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeTheDiffPath.SelectedItem Is Nothing Then Exit Sub
    If treeTheDiffPath.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeTheDiffPath.SelectedItem.key, 39, 38)
      struct = treeTheDiffPath.SelectedItem.Parent.Tag
      Set p = Item.FindRowObject(struct, ID)
      If Item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = Item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeTheDiffPath.SelectedItem.Tag <> "object" Then
        If treeTheDiffPath.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeTheDiffPath.SelectedItem.Parent.key, 39, 38)
        struct = treeTheDiffPath.SelectedItem.Parent.Parent.Tag
        Set p = Item.FindRowObject(struct, ID)
        Set u = Item.itemcollection(p, treeTheDiffPath.SelectedItem.Tag).Add
      End If
      If treeTheDiffPath.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeTheDiffPath.SelectedItem.Parent.key, 39, 38)
        Set p = Item.Manager.GetInstanceObject(ID)
        Set u = Item.itemcollection(p, treeTheDiffPath.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    If GetFromBuffer(u) Then
      gridTheDiffPath.ItemCount = u.Parent.Count
      gridTheDiffPath.Refresh
      gridTheDiffPath.RefreshGroups
      gridTheDiffPath.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeTheDiffPath.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeTheDiffPath.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeTheDiffPath.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeTheDiffPath_Expand treeTheDiffPath.Nodes.Item(rnode.key)
    Else
     u.Parent.Remove u.ID
    End If
End Sub

Private Sub mnuTheDiffPathCHANGE_Click()
  On Error Resume Next
  If gridTheDiffPath.ItemCount = 0 Then Exit Sub
  If gridTheDiffPath.Row > 0 Then
   If gridTheDiffPath.RowIndex(gridTheDiffPath.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridTheDiffPath.RowBookmark(gridTheDiffPath.RowIndex(gridTheDiffPath.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridTheDiffPath.ItemCount = u.Parent.Count
      gridTheDiffPath.RefreshRowIndex gridTheDiffPath.RowIndex(gridTheDiffPath.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuTheDiffPathCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuTheDiffPathPrn_click()
   menuActionTheDiffPath = "PRN"
   menuTimerTheDiffPath.Enabled = True
End Sub
Private Sub mnuTheDiffPathCfg_click()
   menuActionTheDiffPath = "CFG"
   menuTimerTheDiffPath.Enabled = True
End Sub
Private Sub mnuTheDiffPathFind_click()
   menuActionTheDiffPath = "FND"
   menuTimerTheDiffPath.Enabled = True
End Sub
Private Sub mnuTheDiffPathAcc_click()
   menuActionTheDiffPath = "ACC"
   menuTimerTheDiffPath.Enabled = True
End Sub
Private Sub menuTimerTheDiffPath_timer()
   menuTimerTheDiffPath.Enabled = False
   If menuActionTheDiffPath = "ADD" Then cmdTheDiffPathAdd_Click
   If menuActionTheDiffPath = "EDIT" Then cmdTheDiffPathEdit_Click
   If menuActionTheDiffPath = "DEL" Then cmdTheDiffPathDel_Click
   If menuActionTheDiffPath = "RUN" Then cmdTheDiffPathRun_Click
   If menuActionTheDiffPath = "REF" Then cmdTheDiffPathRef_Click
   If menuActionTheDiffPath = "PRN" Then cmdTheDiffPathPrn_Click
   If menuActionTheDiffPath = "CFG" Then cmdTheDiffPathCfg_Click
   If menuActionTheDiffPath = "FND" Then cmdTheDiffPathFnd_Click
   If menuActionTheDiffPath = "ACC" Then cmdTheDiffPathAcc_Click
   menuActionTheDiffPath = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

Item.FillTree treeTheDiffPath, "", "", "TheDiffPath"
  LoadBtnPictures cmdTTheDiffPathRef, cmdTTheDiffPathRef.Tag
  LoadBtnPictures cmdTheDiffPathRef, cmdTheDiffPathRef.Tag
  LoadBtnPictures cmdTheDiffPathAdd, cmdTheDiffPathAdd.Tag
  LoadBtnPictures cmdTheDiffPathEdit, cmdTheDiffPathEdit.Tag
  LoadBtnPictures cmdTheDiffPathDel, cmdTheDiffPathDel.Tag
  LoadBtnPictures cmdTheDiffPathPrn, cmdTheDiffPathPrn.Tag
  LoadBtnPictures cmdTheDiffPathFnd, cmdTheDiffPathFnd.Tag
  LoadBtnPictures cmdTheDiffPathCfg, cmdTheDiffPathCfg.Tag
  LoadBtnPictures cmdTheDiffPathRun, cmdTheDiffPathRun.Tag
  LoadBtnPictures cmdTheDiffPathAcc, cmdTheDiffPathAcc.Tag
  gridTheDiffPath.Columns.Clear
  gridTheDiffPath.ItemCount = 0
End Sub
Private Sub OnTabClick()

pnlTheDiffPath.RestorePosition
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set Item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub
Public Sub OnSave()
  
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  pnlTheDiffPath.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndTheDiffPath = Nothing
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
'  ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT2", "Отчет " & Date)
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



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2P", "Платеж " & Date)
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



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2O", "Оплата " & Date)
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "Заявка " & Date)
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





