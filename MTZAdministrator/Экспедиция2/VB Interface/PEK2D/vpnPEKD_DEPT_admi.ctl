VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl vpnPEKD_DEPT_admi 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKD_DEPT 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlPEKD_DEPT 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdPEKD_DEPTAcc 
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
      Begin MTZ_PANEL.DropButton cmdPEKD_DEPTRun 
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
      Begin VB.CommandButton cmdPEKD_DEPTFnd 
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
      Begin VB.CommandButton cmdPEKD_DEPTCfg 
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
      Begin VB.CommandButton cmdPEKD_DEPTPrn 
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
      Begin VB.CommandButton cmdPEKD_DEPTRef 
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
      Begin VB.CommandButton cmdPEKD_DEPTDel 
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
      Begin VB.CommandButton cmdPEKD_DEPTEdit 
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
      Begin VB.CommandButton cmdPEKD_DEPTAdd 
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
      Begin VB.CommandButton cmdTPEKD_DEPTRef 
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
      Begin GridEX20.GridEX gridPEKD_DEPT 
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
         Column(1)       =   "vpnPEKD_DEPT_admi.ctx":0000
         Column(2)       =   "vpnPEKD_DEPT_admi.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKD_DEPT_admi.ctx":016C
         FormatStyle(2)  =   "vpnPEKD_DEPT_admi.ctx":02C8
         FormatStyle(3)  =   "vpnPEKD_DEPT_admi.ctx":0378
         FormatStyle(4)  =   "vpnPEKD_DEPT_admi.ctx":042C
         FormatStyle(5)  =   "vpnPEKD_DEPT_admi.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKD_DEPT_admi.ctx":05BC
      End
      Begin MSComctlLib.TreeView treePEKD_DEPT 
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
   Begin VB.Menu mnuPopupPEKD_DEPT 
      Caption         =   "Меню для Филиал"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKD_DEPTAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKD_DEPTEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKD_DEPTDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKD_DEPTOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKD_DEPTRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKD_DEPTS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKD_DEPTBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKD_DEPTCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKD_DEPTCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKD_DEPTPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKD_DEPTCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKD_DEPTCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKD_DEPTPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKD_DEPTCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKD_DEPTFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKD_DEPTAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKD_DEPT_admi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKD_DEPT As Object
Private menuActionPEKD_DEPT As String





Private Sub pnlPEKD_DEPT_PositionChanged()
  pnlPEKD_DEPT.SavePosition
End Sub
Private Sub cmdPEKD_DEPTPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKD_DEPT, "Филиал"
Set jset = Nothing
End Sub

Private Sub cmdPEKD_DEPTFnd_Click()
  On Error Resume Next
  fndPEKD_DEPT.ShowForm
End Sub
Private Sub cmdPEKD_DEPTRun_Click()
  On Error Resume Next
  gridPEKD_DEPT_DblClick
End Sub
Private Sub pnlPEKD_DEPT_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treePEKD_DEPT.Left = Left
  treePEKD_DEPT.Top = Top + 25 * Screen.TwipsPerPixelY
  treePEKD_DEPT.Width = Width
  treePEKD_DEPT.Height = Height - 25 * Screen.TwipsPerPixelY
End Sub
Private Sub pnlPEKD_DEPT_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridPEKD_DEPT.Left = Left
  gridPEKD_DEPT.Top = Top + 25 * Screen.TwipsPerPixelY
  gridPEKD_DEPT.Width = Width
  gridPEKD_DEPT.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKD_DEPTAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKD_DEPTEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKD_DEPTDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKD_DEPTRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKD_DEPTPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKD_DEPTCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdPEKD_DEPTFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdPEKD_DEPTRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdPEKD_DEPTAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
 Private Sub cmdPEKD_DEPTDel_Click()
  On Error Resume Next
  gridPEKD_DEPT.Delete
End Sub

Public Function IsOK() As Boolean
        IsOK = True
End Function
 Private Sub cmdPEKD_DEPTEdit_Click()
On Error Resume Next
If gridPEKD_DEPT.ItemCount = 0 Then Exit Sub
If gridPEKD_DEPT.Row > 0 Then
 If gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_DEPT.RowBookmark(gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "admi")
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
    gridPEKD_DEPT.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

 Private Sub cmdPEKD_DEPTAdd_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treePEKD_DEPT.SelectedItem Is Nothing Then Exit Sub
    If treePEKD_DEPT.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treePEKD_DEPT.SelectedItem.key, 39, 38)
      struct = treePEKD_DEPT.SelectedItem.Parent.Tag
      Set p = Item.FindRowObject(struct, ID)
      If Item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = Item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treePEKD_DEPT.SelectedItem.Tag <> "object" Then
        If treePEKD_DEPT.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treePEKD_DEPT.SelectedItem.Parent.key, 39, 38)
        struct = treePEKD_DEPT.SelectedItem.Parent.Parent.Tag
        Set p = Item.FindRowObject(struct, ID)
        Set u = Item.itemcollection(p, treePEKD_DEPT.SelectedItem.Tag).Add
      End If
      If treePEKD_DEPT.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treePEKD_DEPT.SelectedItem.Parent.key, 39, 38)
        Set p = Item.Manager.GetInstanceObject(ID)
        Set u = Item.itemcollection(p, treePEKD_DEPT.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "admi")




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
      gridPEKD_DEPT.ItemCount = u.Parent.Count
        gridPEKD_DEPT.Refresh
        gridPEKD_DEPT.RefreshGroups
        gridPEKD_DEPT.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treePEKD_DEPT.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treePEKD_DEPT.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treePEKD_DEPT.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treePEKD_DEPT_Expand treePEKD_DEPT.Nodes.Item(rnode.key)
    Else
     u.Parent.Delete u.ID
     u.Parent.Remove u.ID
    End If
    Set frm = Nothing
End Sub

Private Sub cmdPEKD_DEPTCfg_Click()
  On Error Resume Next
  Dim rnode As MSComctlLib.Node
  Set rnode = treePEKD_DEPT.SelectedItem
  If rnode.Tag = "object" Then Exit Sub
  If rnode.Tag = "Row" Then
    Set rnode = rnode.Parent
  End If
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKD_DEPT, "gridPEKD_DEPT" & rnode.Tag
Set jset = Nothing
End Sub


Private Sub treePEKD_DEPT_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treePEKD_DEPT.Nodes.Remove Node.Child.Index
 Item.Expand treePEKD_DEPT, Node.key, "admi"
 ParentForm.MousePointer = vbNormal
End If
 Set treePEKD_DEPT.SelectedItem = Node
 treePEKD_DEPT_NodeClick Node
End Sub

Private Sub treePEKD_DEPT_Collapse(ByVal Node As MSComctlLib.Node)
 Set treePEKD_DEPT.SelectedItem = Node
 treePEKD_DEPT_NodeClick Node
End Sub

Private Sub treePEKD_DEPT_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object, ID As String, struct As String
  If Node.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(Node.key, 39, 38)
    struct = Node.Parent.Tag
    Set p = Item.FindRowObject(struct, ID)
    On Error Resume Next
      Item.itemcollection(p.Parent.Parent, TypeName(p)).preparegrid gridPEKD_DEPT
      LoadGridLayout gridPEKD_DEPT, gridPEKD_DEPT.Name & Node.Parent.Tag
    Set fndPEKD_DEPT = Nothing
    Set fndPEKD_DEPT = CreateObject("MTZ_JSetup.GridFinder")
    fndPEKD_DEPT.Init gridPEKD_DEPT
  ElseIf Node.Tag <> "object" Then
    If Node.Parent Is Nothing Then
      Item.itemcollection(Item, Node.Tag).preparegrid gridPEKD_DEPT
      LoadGridLayout gridPEKD_DEPT, gridPEKD_DEPT.Name & Node.Tag
    Else
     If Node.Parent.Tag = "Row" Then
       ID = Mid(Node.Parent.key, 39, 38)
       struct = Node.Parent.Parent.Tag
       Set p = Item.FindRowObject(struct, ID)
       Item.itemcollection(p, Node.Tag).preparegrid gridPEKD_DEPT
       LoadGridLayout gridPEKD_DEPT, gridPEKD_DEPT.Name & Node.Tag
     End If
     If Node.Parent.Tag = "object" Then
       ID = Mid(Node.Parent.key, 39, 38)
       Set p = Item.Manager.GetInstanceObject(ID)
       Item.itemcollection(p, Node.Tag).preparegrid gridPEKD_DEPT
       LoadGridLayout gridPEKD_DEPT, gridPEKD_DEPT.Name & Node.Tag
     End If
    End If
  End If
End Sub
Private Sub cmdTPEKD_DEPTRef_Click()
  On Error Resume Next
  treePEKD_DEPT.Nodes.Clear
  Item.FillTree treePEKD_DEPT, "", "", "PEKD_DEPT"
  gridPEKD_DEPT.Columns.Clear
  gridPEKD_DEPT.ItemCount = 0
End Sub
Private Sub cmdPEKD_DEPTRef_Click()
  On Error Resume Next
  treePEKD_DEPT_NodeClick treePEKD_DEPT.SelectedItem
End Sub
Private Sub cmdPEKD_DEPTAcc_Click()
On Error Resume Next
If gridPEKD_DEPT.ItemCount = 0 Then Exit Sub
If gridPEKD_DEPT.Row > 0 Then
 If gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_DEPT.RowBookmark(gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub gridPEKD_DEPT_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object, ID As String, struct As String
  If treePEKD_DEPT.SelectedItem Is Nothing Then Exit Sub
  If treePEKD_DEPT.SelectedItem.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(treePEKD_DEPT.SelectedItem.key, 39, 38)
    struct = treePEKD_DEPT.SelectedItem.Parent.Tag
    Set p = Item.FindRowObject(struct, ID)
      Item.itemcollection(p.Parent.Parent, TypeName(p)).LoadRow gridPEKD_DEPT, RowIndex, Bookmark, Values
    Set p = Nothing
  ElseIf treePEKD_DEPT.SelectedItem.Tag <> "object" Then
      If treePEKD_DEPT.SelectedItem.Parent Is Nothing Then
          Item.itemcollection(Item, treePEKD_DEPT.SelectedItem.Tag).LoadRow gridPEKD_DEPT, RowIndex, Bookmark, Values
      Else
        If treePEKD_DEPT.SelectedItem.Parent.Tag = "Row" Then
          ID = Mid(treePEKD_DEPT.SelectedItem.Parent.key, 39, 38)
          struct = treePEKD_DEPT.SelectedItem.Parent.Parent.Tag
          Set p = Item.FindRowObject(struct, ID)
          Item.itemcollection(p, treePEKD_DEPT.SelectedItem.Tag).LoadRow gridPEKD_DEPT, RowIndex, Bookmark, Values
        End If
        If treePEKD_DEPT.SelectedItem.Parent.Tag = "object" Then
          ID = Mid(treePEKD_DEPT.SelectedItem.Parent.key, 39, 38)
          Set p = Item.Manager.GetInstanceObject(ID)
          Item.itemcollection(p, treePEKD_DEPT.SelectedItem.Tag).LoadRow gridPEKD_DEPT, RowIndex, Bookmark, Values
        End If
    End If
  End If
End Sub
Private Sub gridPEKD_DEPT_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKD_DEPT.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    On Error Resume Next
      Dim rnode As MSComctlLib.Node, tid As String
      Set rnode = treePEKD_DEPT.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treePEKD_DEPT.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treePEKD_DEPT.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treePEKD_DEPT_Expand treePEKD_DEPT.Nodes.Item(rnode.key)
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridPEKD_DEPT_DblClick()
On Error Resume Next
If gridPEKD_DEPT.ItemCount = 0 Then Exit Sub
If gridPEKD_DEPT.Row > 0 Then
 If gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_DEPT.RowBookmark(gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "admi")
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
    gridPEKD_DEPT.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

Private Sub gridPEKD_DEPT_KeyPress(KeyAscii As Integer)
  If gridPEKD_DEPT.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKD_DEPT.FindOnPress KeyAscii
End Sub

Private Sub gridPEKD_DEPT_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridPEKD_DEPT.ItemCount = 0 Then Exit Sub
 If gridPEKD_DEPT.Row > 0 Then
   If LastRow <> gridPEKD_DEPT.Row And LastRow > 0 Then
     gridPEKD_DEPT.GetRowData(LastRow).RowStyle = "Default"
     gridPEKD_DEPT.GetRowData(gridPEKD_DEPT.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub gridPEKD_DEPT_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupPEKD_DEPT
End If
End Sub
Private Sub mnuPEKD_DEPTAdd_click()
   menuActionPEKD_DEPT = "ADD"
   menuTimerPEKD_DEPT.Enabled = True
End Sub
Private Sub mnuPEKD_DEPTEdit_click()
   menuActionPEKD_DEPT = "EDIT"
   menuTimerPEKD_DEPT.Enabled = True
End Sub
Private Sub mnuPEKD_DEPTDelete_click()
   menuActionPEKD_DEPT = "DEL"
   menuTimerPEKD_DEPT.Enabled = True
End Sub
Private Sub mnuPEKD_DEPTOpen_click()
   menuActionPEKD_DEPT = "RUN"
   menuTimerPEKD_DEPT.Enabled = True
End Sub
Private Sub mnuPEKD_DEPTRef_click()
   menuActionPEKD_DEPT = "REF"
   menuTimerPEKD_DEPT.Enabled = True
End Sub
  Private Sub mnuPEKD_DEPTCOPY_Click()
    On Error Resume Next
    If gridPEKD_DEPT.ItemCount = 0 Then Exit Sub
    If gridPEKD_DEPT.Row > 0 Then
     If gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_DEPT.RowBookmark(gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKD_DEPTCUT_Click()
    On Error Resume Next
    If gridPEKD_DEPT.ItemCount = 0 Then Exit Sub
    If gridPEKD_DEPT.Row > 0 Then
     If gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_DEPT.RowBookmark(gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKD_DEPT.ItemCount = bm.Count
      End If
    End If
  End Sub
 Private Sub mnuPEKD_DEPTPASTE_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treePEKD_DEPT.SelectedItem Is Nothing Then Exit Sub
    If treePEKD_DEPT.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treePEKD_DEPT.SelectedItem.key, 39, 38)
      struct = treePEKD_DEPT.SelectedItem.Parent.Tag
      Set p = Item.FindRowObject(struct, ID)
      If Item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = Item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treePEKD_DEPT.SelectedItem.Tag <> "object" Then
        If treePEKD_DEPT.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treePEKD_DEPT.SelectedItem.Parent.key, 39, 38)
        struct = treePEKD_DEPT.SelectedItem.Parent.Parent.Tag
        Set p = Item.FindRowObject(struct, ID)
        Set u = Item.itemcollection(p, treePEKD_DEPT.SelectedItem.Tag).Add
      End If
      If treePEKD_DEPT.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treePEKD_DEPT.SelectedItem.Parent.key, 39, 38)
        Set p = Item.Manager.GetInstanceObject(ID)
        Set u = Item.itemcollection(p, treePEKD_DEPT.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    If GetFromBuffer(u) Then
      gridPEKD_DEPT.ItemCount = u.Parent.Count
      gridPEKD_DEPT.Refresh
      gridPEKD_DEPT.RefreshGroups
      gridPEKD_DEPT.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treePEKD_DEPT.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treePEKD_DEPT.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treePEKD_DEPT.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treePEKD_DEPT_Expand treePEKD_DEPT.Nodes.Item(rnode.key)
    Else
     u.Parent.Remove u.ID
    End If
End Sub

Private Sub mnuPEKD_DEPTCHANGE_Click()
  On Error Resume Next
  If gridPEKD_DEPT.ItemCount = 0 Then Exit Sub
  If gridPEKD_DEPT.Row > 0 Then
   If gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_DEPT.RowBookmark(gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKD_DEPT.ItemCount = u.Parent.Count
      gridPEKD_DEPT.RefreshRowIndex gridPEKD_DEPT.RowIndex(gridPEKD_DEPT.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKD_DEPTCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKD_DEPTPrn_click()
   menuActionPEKD_DEPT = "PRN"
   menuTimerPEKD_DEPT.Enabled = True
End Sub
Private Sub mnuPEKD_DEPTCfg_click()
   menuActionPEKD_DEPT = "CFG"
   menuTimerPEKD_DEPT.Enabled = True
End Sub
Private Sub mnuPEKD_DEPTFind_click()
   menuActionPEKD_DEPT = "FND"
   menuTimerPEKD_DEPT.Enabled = True
End Sub
Private Sub mnuPEKD_DEPTAcc_click()
   menuActionPEKD_DEPT = "ACC"
   menuTimerPEKD_DEPT.Enabled = True
End Sub
Private Sub menuTimerPEKD_DEPT_timer()
   menuTimerPEKD_DEPT.Enabled = False
   If menuActionPEKD_DEPT = "ADD" Then cmdPEKD_DEPTAdd_Click
   If menuActionPEKD_DEPT = "EDIT" Then cmdPEKD_DEPTEdit_Click
   If menuActionPEKD_DEPT = "DEL" Then cmdPEKD_DEPTDel_Click
   If menuActionPEKD_DEPT = "RUN" Then cmdPEKD_DEPTRun_Click
   If menuActionPEKD_DEPT = "REF" Then cmdPEKD_DEPTRef_Click
   If menuActionPEKD_DEPT = "PRN" Then cmdPEKD_DEPTPrn_Click
   If menuActionPEKD_DEPT = "CFG" Then cmdPEKD_DEPTCfg_Click
   If menuActionPEKD_DEPT = "FND" Then cmdPEKD_DEPTFnd_Click
   If menuActionPEKD_DEPT = "ACC" Then cmdPEKD_DEPTAcc_Click
   menuActionPEKD_DEPT = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

Item.FillTree treePEKD_DEPT, "", "admi", "PEKD_DEPT"
  LoadBtnPictures cmdTPEKD_DEPTRef, cmdTPEKD_DEPTRef.Tag
  LoadBtnPictures cmdPEKD_DEPTRef, cmdPEKD_DEPTRef.Tag
  LoadBtnPictures cmdPEKD_DEPTAdd, cmdPEKD_DEPTAdd.Tag
  LoadBtnPictures cmdPEKD_DEPTEdit, cmdPEKD_DEPTEdit.Tag
  LoadBtnPictures cmdPEKD_DEPTDel, cmdPEKD_DEPTDel.Tag
  LoadBtnPictures cmdPEKD_DEPTPrn, cmdPEKD_DEPTPrn.Tag
  LoadBtnPictures cmdPEKD_DEPTFnd, cmdPEKD_DEPTFnd.Tag
  LoadBtnPictures cmdPEKD_DEPTCfg, cmdPEKD_DEPTCfg.Tag
  LoadBtnPictures cmdPEKD_DEPTRun, cmdPEKD_DEPTRun.Tag
  LoadBtnPictures cmdPEKD_DEPTAcc, cmdPEKD_DEPTAcc.Tag
  gridPEKD_DEPT.Columns.Clear
  gridPEKD_DEPT.ItemCount = 0
End Sub
Private Sub OnTabClick()

pnlPEKD_DEPT.RestorePosition
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
  pnlPEKD_DEPT.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKD_DEPT = Nothing
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





