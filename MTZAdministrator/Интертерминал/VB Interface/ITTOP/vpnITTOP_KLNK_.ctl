VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnITTOP_KLNK_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerITTOP_KLNK 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlITTOP_KLNK 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdITTOP_KLNKAcc 
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
      Begin MTZ_PANEL.DropButton cmdITTOP_KLNKRun 
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
      Begin VB.CommandButton cmdITTOP_KLNKFnd 
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
      Begin VB.CommandButton cmdITTOP_KLNKCfg 
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
      Begin VB.CommandButton cmdITTOP_KLNKPrn 
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
      Begin VB.CommandButton cmdITTOP_KLNKRef 
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
      Begin VB.CommandButton cmdITTOP_KLNKDel 
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
      Begin VB.CommandButton cmdITTOP_KLNKEdit 
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
      Begin VB.CommandButton cmdITTOP_KLNKAdd 
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
      Begin VB.CommandButton cmdTITTOP_KLNKRef 
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
      Begin GridEX20.GridEX gridITTOP_KLNK 
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
         Column(1)       =   "vpnITTOP_KLNK_.ctx":0000
         Column(2)       =   "vpnITTOP_KLNK_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnITTOP_KLNK_.ctx":016C
         FormatStyle(2)  =   "vpnITTOP_KLNK_.ctx":02C8
         FormatStyle(3)  =   "vpnITTOP_KLNK_.ctx":0378
         FormatStyle(4)  =   "vpnITTOP_KLNK_.ctx":042C
         FormatStyle(5)  =   "vpnITTOP_KLNK_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnITTOP_KLNK_.ctx":05BC
      End
      Begin MSComctlLib.TreeView treeITTOP_KLNK 
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
   Begin VB.Menu mnuPopupITTOP_KLNK 
      Caption         =   "Меню для Кладовщики"
      Visible         =   0   'False
      Begin VB.Menu mnuITTOP_KLNKAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuITTOP_KLNKEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuITTOP_KLNKDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuITTOP_KLNKOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuITTOP_KLNKRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuITTOP_KLNKS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuITTOP_KLNKBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuITTOP_KLNKCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuITTOP_KLNKCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuITTOP_KLNKPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuITTOP_KLNKCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuITTOP_KLNKCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuITTOP_KLNKPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuITTOP_KLNKCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuITTOP_KLNKFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuITTOP_KLNKAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnITTOP_KLNK_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Привязка кладовщиков
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndITTOP_KLNK As Object
Private menuActionITTOP_KLNK As String





Private Sub pnlITTOP_KLNK_PositionChanged()
  pnlITTOP_KLNK.SavePosition
End Sub
Private Sub cmdITTOP_KLNKPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridITTOP_KLNK, "Кладовщики"
Set jset = Nothing
End Sub

Private Sub cmdITTOP_KLNKFnd_Click()
  On Error Resume Next
  fndITTOP_KLNK.ShowForm
End Sub
Private Sub cmdITTOP_KLNKRun_Click()
  On Error Resume Next
  gridITTOP_KLNK_DblClick
End Sub
Private Sub pnlITTOP_KLNK_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treeITTOP_KLNK.Left = Left
  treeITTOP_KLNK.Top = Top + 25 * Screen.TwipsPerPixelY
  treeITTOP_KLNK.Width = Width
  treeITTOP_KLNK.Height = Height - 25 * Screen.TwipsPerPixelY
End Sub
Private Sub pnlITTOP_KLNK_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridITTOP_KLNK.Left = Left
  gridITTOP_KLNK.Top = Top + 25 * Screen.TwipsPerPixelY
  gridITTOP_KLNK.Width = Width
  gridITTOP_KLNK.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdITTOP_KLNKAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdITTOP_KLNKEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdITTOP_KLNKDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdITTOP_KLNKRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdITTOP_KLNKPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdITTOP_KLNKCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdITTOP_KLNKFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdITTOP_KLNKRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdITTOP_KLNKAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
 Private Sub cmdITTOP_KLNKDel_Click()
  On Error Resume Next
  gridITTOP_KLNK.Delete
End Sub


'Признак правильности заполнения
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as BooLEAN
'  variable = me.IsOK()
Public Function IsOK() As Boolean
        IsOK = True
End Function
 Private Sub cmdITTOP_KLNKEdit_Click()
On Error Resume Next
If gridITTOP_KLNK.ItemCount = 0 Then Exit Sub
If gridITTOP_KLNK.Row > 0 Then
 If gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOP_KLNK.RowBookmark(gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row))
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
    gridITTOP_KLNK.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

 Private Sub cmdITTOP_KLNKAdd_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeITTOP_KLNK.SelectedItem Is Nothing Then Exit Sub
    If treeITTOP_KLNK.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeITTOP_KLNK.SelectedItem.key, 39, 38)
      struct = treeITTOP_KLNK.SelectedItem.Parent.Tag
      Set p = Item.FindRowObject(struct, ID)
      If Item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = Item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeITTOP_KLNK.SelectedItem.Tag <> "object" Then
        If treeITTOP_KLNK.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeITTOP_KLNK.SelectedItem.Parent.key, 39, 38)
        struct = treeITTOP_KLNK.SelectedItem.Parent.Parent.Tag
        Set p = Item.FindRowObject(struct, ID)
        Set u = Item.itemcollection(p, treeITTOP_KLNK.SelectedItem.Tag).Add
      End If
      If treeITTOP_KLNK.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeITTOP_KLNK.SelectedItem.Parent.key, 39, 38)
        Set p = Item.Manager.GetInstanceObject(ID)
        Set u = Item.itemcollection(p, treeITTOP_KLNK.SelectedItem.Tag).Add
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
      gridITTOP_KLNK.ItemCount = u.Parent.Count
        gridITTOP_KLNK.Refresh
        gridITTOP_KLNK.RefreshGroups
        gridITTOP_KLNK.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeITTOP_KLNK.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeITTOP_KLNK.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeITTOP_KLNK.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeITTOP_KLNK_Expand treeITTOP_KLNK.Nodes.Item(rnode.key)
    Else
     u.Parent.Delete u.ID
     u.Parent.Remove u.ID
    End If
    Set frm = Nothing
End Sub

Private Sub cmdITTOP_KLNKCfg_Click()
  On Error Resume Next
  Dim rnode As MSComctlLib.Node
  Set rnode = treeITTOP_KLNK.SelectedItem
  If rnode.Tag = "object" Then Exit Sub
  If rnode.Tag = "Row" Then
    Set rnode = rnode.Parent
  End If
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridITTOP_KLNK, "gridITTOP_KLNK" & rnode.Tag
Set jset = Nothing
End Sub


Private Sub treeITTOP_KLNK_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeITTOP_KLNK.Nodes.Remove Node.Child.Index
 Item.Expand treeITTOP_KLNK, Node.key, ""
 ParentForm.MousePointer = vbNormal
End If
 Set treeITTOP_KLNK.SelectedItem = Node
 treeITTOP_KLNK_NodeClick Node
End Sub

Private Sub treeITTOP_KLNK_Collapse(ByVal Node As MSComctlLib.Node)
 Set treeITTOP_KLNK.SelectedItem = Node
 treeITTOP_KLNK_NodeClick Node
End Sub

Private Sub treeITTOP_KLNK_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object, ID As String, struct As String
  If Node.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(Node.key, 39, 38)
    struct = Node.Parent.Tag
    Set p = Item.FindRowObject(struct, ID)
    On Error Resume Next
      Item.itemcollection(p.Parent.Parent, TypeName(p)).preparegrid gridITTOP_KLNK
      LoadGridLayout gridITTOP_KLNK, gridITTOP_KLNK.Name & Node.Parent.Tag
    Set fndITTOP_KLNK = Nothing
    Set fndITTOP_KLNK = CreateObject("MTZ_JSetup.GridFinder")
    fndITTOP_KLNK.Init gridITTOP_KLNK
  ElseIf Node.Tag <> "object" Then
    If Node.Parent Is Nothing Then
      Item.itemcollection(Item, Node.Tag).preparegrid gridITTOP_KLNK
      LoadGridLayout gridITTOP_KLNK, gridITTOP_KLNK.Name & Node.Tag
    Else
     If Node.Parent.Tag = "Row" Then
       ID = Mid(Node.Parent.key, 39, 38)
       struct = Node.Parent.Parent.Tag
       Set p = Item.FindRowObject(struct, ID)
       Item.itemcollection(p, Node.Tag).preparegrid gridITTOP_KLNK
       LoadGridLayout gridITTOP_KLNK, gridITTOP_KLNK.Name & Node.Tag
     End If
     If Node.Parent.Tag = "object" Then
       ID = Mid(Node.Parent.key, 39, 38)
       Set p = Item.Manager.GetInstanceObject(ID)
       Item.itemcollection(p, Node.Tag).preparegrid gridITTOP_KLNK
       LoadGridLayout gridITTOP_KLNK, gridITTOP_KLNK.Name & Node.Tag
     End If
    End If
  End If
End Sub
Private Sub cmdTITTOP_KLNKRef_Click()
  On Error Resume Next
  treeITTOP_KLNK.Nodes.Clear
  Item.FillTree treeITTOP_KLNK, "", "", "ITTOP_KLNK"
  gridITTOP_KLNK.Columns.Clear
  gridITTOP_KLNK.ItemCount = 0
End Sub
Private Sub cmdITTOP_KLNKRef_Click()
  On Error Resume Next
  treeITTOP_KLNK_NodeClick treeITTOP_KLNK.SelectedItem
End Sub
Private Sub cmdITTOP_KLNKAcc_Click()
On Error Resume Next
If gridITTOP_KLNK.ItemCount = 0 Then Exit Sub
If gridITTOP_KLNK.Row > 0 Then
 If gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOP_KLNK.RowBookmark(gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub gridITTOP_KLNK_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object, ID As String, struct As String
  If treeITTOP_KLNK.SelectedItem Is Nothing Then Exit Sub
  If treeITTOP_KLNK.SelectedItem.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(treeITTOP_KLNK.SelectedItem.key, 39, 38)
    struct = treeITTOP_KLNK.SelectedItem.Parent.Tag
    Set p = Item.FindRowObject(struct, ID)
      Item.itemcollection(p.Parent.Parent, TypeName(p)).LoadRow gridITTOP_KLNK, RowIndex, Bookmark, Values
    Set p = Nothing
  ElseIf treeITTOP_KLNK.SelectedItem.Tag <> "object" Then
      If treeITTOP_KLNK.SelectedItem.Parent Is Nothing Then
          Item.itemcollection(Item, treeITTOP_KLNK.SelectedItem.Tag).LoadRow gridITTOP_KLNK, RowIndex, Bookmark, Values
      Else
        If treeITTOP_KLNK.SelectedItem.Parent.Tag = "Row" Then
          ID = Mid(treeITTOP_KLNK.SelectedItem.Parent.key, 39, 38)
          struct = treeITTOP_KLNK.SelectedItem.Parent.Parent.Tag
          Set p = Item.FindRowObject(struct, ID)
          Item.itemcollection(p, treeITTOP_KLNK.SelectedItem.Tag).LoadRow gridITTOP_KLNK, RowIndex, Bookmark, Values
        End If
        If treeITTOP_KLNK.SelectedItem.Parent.Tag = "object" Then
          ID = Mid(treeITTOP_KLNK.SelectedItem.Parent.key, 39, 38)
          Set p = Item.Manager.GetInstanceObject(ID)
          Item.itemcollection(p, treeITTOP_KLNK.SelectedItem.Tag).LoadRow gridITTOP_KLNK, RowIndex, Bookmark, Values
        End If
    End If
  End If
End Sub
Private Sub gridITTOP_KLNK_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridITTOP_KLNK.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    On Error Resume Next
      Dim rnode As MSComctlLib.Node, tid As String
      Set rnode = treeITTOP_KLNK.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeITTOP_KLNK.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeITTOP_KLNK.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeITTOP_KLNK_Expand treeITTOP_KLNK.Nodes.Item(rnode.key)
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridITTOP_KLNK_DblClick()
On Error Resume Next
If gridITTOP_KLNK.ItemCount = 0 Then Exit Sub
If gridITTOP_KLNK.Row > 0 Then
 If gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOP_KLNK.RowBookmark(gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row))
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
    gridITTOP_KLNK.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

Private Sub gridITTOP_KLNK_KeyPress(KeyAscii As Integer)
  If gridITTOP_KLNK.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndITTOP_KLNK.FindOnPress KeyAscii
End Sub

Private Sub gridITTOP_KLNK_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridITTOP_KLNK.ItemCount = 0 Then Exit Sub
 If gridITTOP_KLNK.Row > 0 Then
   If LastRow <> gridITTOP_KLNK.Row And LastRow > 0 Then
     gridITTOP_KLNK.GetRowData(LastRow).RowStyle = "Default"
     gridITTOP_KLNK.GetRowData(gridITTOP_KLNK.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub gridITTOP_KLNK_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupITTOP_KLNK
End If
End Sub
Private Sub mnuITTOP_KLNKAdd_click()
   menuActionITTOP_KLNK = "ADD"
   menuTimerITTOP_KLNK.Enabled = True
End Sub
Private Sub mnuITTOP_KLNKEdit_click()
   menuActionITTOP_KLNK = "EDIT"
   menuTimerITTOP_KLNK.Enabled = True
End Sub
Private Sub mnuITTOP_KLNKDelete_click()
   menuActionITTOP_KLNK = "DEL"
   menuTimerITTOP_KLNK.Enabled = True
End Sub
Private Sub mnuITTOP_KLNKOpen_click()
   menuActionITTOP_KLNK = "RUN"
   menuTimerITTOP_KLNK.Enabled = True
End Sub
Private Sub mnuITTOP_KLNKRef_click()
   menuActionITTOP_KLNK = "REF"
   menuTimerITTOP_KLNK.Enabled = True
End Sub
  Private Sub mnuITTOP_KLNKCOPY_Click()
    On Error Resume Next
    If gridITTOP_KLNK.ItemCount = 0 Then Exit Sub
    If gridITTOP_KLNK.Row > 0 Then
     If gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTOP_KLNK.RowBookmark(gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuITTOP_KLNKCUT_Click()
    On Error Resume Next
    If gridITTOP_KLNK.ItemCount = 0 Then Exit Sub
    If gridITTOP_KLNK.Row > 0 Then
     If gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTOP_KLNK.RowBookmark(gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridITTOP_KLNK.ItemCount = bm.Count
      End If
    End If
  End Sub
 Private Sub mnuITTOP_KLNKPASTE_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeITTOP_KLNK.SelectedItem Is Nothing Then Exit Sub
    If treeITTOP_KLNK.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeITTOP_KLNK.SelectedItem.key, 39, 38)
      struct = treeITTOP_KLNK.SelectedItem.Parent.Tag
      Set p = Item.FindRowObject(struct, ID)
      If Item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = Item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeITTOP_KLNK.SelectedItem.Tag <> "object" Then
        If treeITTOP_KLNK.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeITTOP_KLNK.SelectedItem.Parent.key, 39, 38)
        struct = treeITTOP_KLNK.SelectedItem.Parent.Parent.Tag
        Set p = Item.FindRowObject(struct, ID)
        Set u = Item.itemcollection(p, treeITTOP_KLNK.SelectedItem.Tag).Add
      End If
      If treeITTOP_KLNK.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeITTOP_KLNK.SelectedItem.Parent.key, 39, 38)
        Set p = Item.Manager.GetInstanceObject(ID)
        Set u = Item.itemcollection(p, treeITTOP_KLNK.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    If GetFromBuffer(u) Then
      gridITTOP_KLNK.ItemCount = u.Parent.Count
      gridITTOP_KLNK.Refresh
      gridITTOP_KLNK.RefreshGroups
      gridITTOP_KLNK.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeITTOP_KLNK.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeITTOP_KLNK.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeITTOP_KLNK.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeITTOP_KLNK_Expand treeITTOP_KLNK.Nodes.Item(rnode.key)
    Else
     u.Parent.Remove u.ID
    End If
End Sub

Private Sub mnuITTOP_KLNKCHANGE_Click()
  On Error Resume Next
  If gridITTOP_KLNK.ItemCount = 0 Then Exit Sub
  If gridITTOP_KLNK.Row > 0 Then
   If gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTOP_KLNK.RowBookmark(gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridITTOP_KLNK.ItemCount = u.Parent.Count
      gridITTOP_KLNK.RefreshRowIndex gridITTOP_KLNK.RowIndex(gridITTOP_KLNK.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuITTOP_KLNKCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuITTOP_KLNKPrn_click()
   menuActionITTOP_KLNK = "PRN"
   menuTimerITTOP_KLNK.Enabled = True
End Sub
Private Sub mnuITTOP_KLNKCfg_click()
   menuActionITTOP_KLNK = "CFG"
   menuTimerITTOP_KLNK.Enabled = True
End Sub
Private Sub mnuITTOP_KLNKFind_click()
   menuActionITTOP_KLNK = "FND"
   menuTimerITTOP_KLNK.Enabled = True
End Sub
Private Sub mnuITTOP_KLNKAcc_click()
   menuActionITTOP_KLNK = "ACC"
   menuTimerITTOP_KLNK.Enabled = True
End Sub
Private Sub menuTimerITTOP_KLNK_timer()
   menuTimerITTOP_KLNK.Enabled = False
   If menuActionITTOP_KLNK = "ADD" Then cmdITTOP_KLNKAdd_Click
   If menuActionITTOP_KLNK = "EDIT" Then cmdITTOP_KLNKEdit_Click
   If menuActionITTOP_KLNK = "DEL" Then cmdITTOP_KLNKDel_Click
   If menuActionITTOP_KLNK = "RUN" Then cmdITTOP_KLNKRun_Click
   If menuActionITTOP_KLNK = "REF" Then cmdITTOP_KLNKRef_Click
   If menuActionITTOP_KLNK = "PRN" Then cmdITTOP_KLNKPrn_Click
   If menuActionITTOP_KLNK = "CFG" Then cmdITTOP_KLNKCfg_Click
   If menuActionITTOP_KLNK = "FND" Then cmdITTOP_KLNKFnd_Click
   If menuActionITTOP_KLNK = "ACC" Then cmdITTOP_KLNKAcc_Click
   menuActionITTOP_KLNK = ""
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

Item.FillTree treeITTOP_KLNK, "", "", "ITTOP_KLNK"
  LoadBtnPictures cmdTITTOP_KLNKRef, cmdTITTOP_KLNKRef.Tag
  LoadBtnPictures cmdITTOP_KLNKRef, cmdITTOP_KLNKRef.Tag
  LoadBtnPictures cmdITTOP_KLNKAdd, cmdITTOP_KLNKAdd.Tag
  LoadBtnPictures cmdITTOP_KLNKEdit, cmdITTOP_KLNKEdit.Tag
  LoadBtnPictures cmdITTOP_KLNKDel, cmdITTOP_KLNKDel.Tag
  LoadBtnPictures cmdITTOP_KLNKPrn, cmdITTOP_KLNKPrn.Tag
  LoadBtnPictures cmdITTOP_KLNKFnd, cmdITTOP_KLNKFnd.Tag
  LoadBtnPictures cmdITTOP_KLNKCfg, cmdITTOP_KLNKCfg.Tag
  LoadBtnPictures cmdITTOP_KLNKRun, cmdITTOP_KLNKRun.Tag
  LoadBtnPictures cmdITTOP_KLNKAcc, cmdITTOP_KLNKAcc.Tag
  gridITTOP_KLNK.Columns.Clear
  gridITTOP_KLNK.ItemCount = 0
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlITTOP_KLNK.RestorePosition
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
  pnlITTOP_KLNK.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndITTOP_KLNK = Nothing
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





