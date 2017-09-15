VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl vpnPEKD_DIRECTION_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKD_DIRECTION 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlPEKD_DIRECTION 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdPEKD_DIRECTIONAcc 
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
      Begin MTZ_PANEL.DropButton cmdPEKD_DIRECTIONRun 
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
      Begin VB.CommandButton cmdPEKD_DIRECTIONFnd 
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
      Begin VB.CommandButton cmdPEKD_DIRECTIONCfg 
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
      Begin VB.CommandButton cmdPEKD_DIRECTIONPrn 
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
      Begin VB.CommandButton cmdPEKD_DIRECTIONRef 
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
      Begin VB.CommandButton cmdPEKD_DIRECTIONDel 
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
      Begin VB.CommandButton cmdPEKD_DIRECTIONEdit 
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
      Begin VB.CommandButton cmdPEKD_DIRECTIONAdd 
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
      Begin VB.CommandButton cmdTPEKD_DIRECTIONRef 
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
      Begin GridEX20.GridEX gridPEKD_DIRECTION 
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
         Column(1)       =   "vpnPEKD_DIRECTION_.ctx":0000
         Column(2)       =   "vpnPEKD_DIRECTION_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKD_DIRECTION_.ctx":016C
         FormatStyle(2)  =   "vpnPEKD_DIRECTION_.ctx":02C8
         FormatStyle(3)  =   "vpnPEKD_DIRECTION_.ctx":0378
         FormatStyle(4)  =   "vpnPEKD_DIRECTION_.ctx":042C
         FormatStyle(5)  =   "vpnPEKD_DIRECTION_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKD_DIRECTION_.ctx":05BC
      End
      Begin MSComctlLib.TreeView treePEKD_DIRECTION 
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
   Begin VB.Menu mnuPopupPEKD_DIRECTION 
      Caption         =   "Меню для Направление перевозки"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKD_DIRECTIONAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKD_DIRECTIONEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKD_DIRECTIONDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKD_DIRECTIONOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKD_DIRECTIONRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKD_DIRECTIONS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKD_DIRECTIONBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKD_DIRECTIONCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKD_DIRECTIONCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKD_DIRECTIONPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKD_DIRECTIONCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKD_DIRECTIONCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKD_DIRECTIONPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKD_DIRECTIONCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKD_DIRECTIONFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKD_DIRECTIONAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKD_DIRECTION_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKD_DIRECTION As Object
Private menuActionPEKD_DIRECTION As String





Private Sub pnlPEKD_DIRECTION_PositionChanged()
  pnlPEKD_DIRECTION.SavePosition
End Sub
Private Sub cmdPEKD_DIRECTIONPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKD_DIRECTION, "Направление перевозки"
Set jset = Nothing
End Sub

Private Sub cmdPEKD_DIRECTIONFnd_Click()
  On Error Resume Next
  fndPEKD_DIRECTION.ShowForm
End Sub
Private Sub cmdPEKD_DIRECTIONRun_Click()
  On Error Resume Next
  gridPEKD_DIRECTION_DblClick
End Sub
Private Sub pnlPEKD_DIRECTION_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treePEKD_DIRECTION.Left = Left
  treePEKD_DIRECTION.Top = Top + 25 * Screen.TwipsPerPixelY
  treePEKD_DIRECTION.Width = Width
  treePEKD_DIRECTION.Height = Height - 25 * Screen.TwipsPerPixelY
End Sub
Private Sub pnlPEKD_DIRECTION_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridPEKD_DIRECTION.Left = Left
  gridPEKD_DIRECTION.Top = Top + 25 * Screen.TwipsPerPixelY
  gridPEKD_DIRECTION.Width = Width
  gridPEKD_DIRECTION.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKD_DIRECTIONAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKD_DIRECTIONEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKD_DIRECTIONDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKD_DIRECTIONRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKD_DIRECTIONPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKD_DIRECTIONCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdPEKD_DIRECTIONFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdPEKD_DIRECTIONRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdPEKD_DIRECTIONAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
 Private Sub cmdPEKD_DIRECTIONDel_Click()
  On Error Resume Next
  gridPEKD_DIRECTION.Delete
End Sub

Public Function IsOK() As Boolean
        IsOK = True
End Function
 Private Sub cmdPEKD_DIRECTIONEdit_Click()
On Error Resume Next
If gridPEKD_DIRECTION.ItemCount = 0 Then Exit Sub
If gridPEKD_DIRECTION.Row > 0 Then
 If gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_DIRECTION.RowBookmark(gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row))
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
    gridPEKD_DIRECTION.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

 Private Sub cmdPEKD_DIRECTIONAdd_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treePEKD_DIRECTION.SelectedItem Is Nothing Then Exit Sub
    If treePEKD_DIRECTION.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treePEKD_DIRECTION.SelectedItem.key, 39, 38)
      struct = treePEKD_DIRECTION.SelectedItem.Parent.Tag
      Set p = Item.FindRowObject(struct, ID)
      If Item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = Item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treePEKD_DIRECTION.SelectedItem.Tag <> "object" Then
        If treePEKD_DIRECTION.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treePEKD_DIRECTION.SelectedItem.Parent.key, 39, 38)
        struct = treePEKD_DIRECTION.SelectedItem.Parent.Parent.Tag
        Set p = Item.FindRowObject(struct, ID)
        Set u = Item.itemcollection(p, treePEKD_DIRECTION.SelectedItem.Tag).Add
      End If
      If treePEKD_DIRECTION.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treePEKD_DIRECTION.SelectedItem.Parent.key, 39, 38)
        Set p = Item.Manager.GetInstanceObject(ID)
        Set u = Item.itemcollection(p, treePEKD_DIRECTION.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "")



If TypeName(u) = "PEKD_DIRSTATION" Then
u.VolSwitchWeight = 150
u.VolSwitchWeightSup = 150

End If
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
      gridPEKD_DIRECTION.ItemCount = u.Parent.Count
        gridPEKD_DIRECTION.Refresh
        gridPEKD_DIRECTION.RefreshGroups
        gridPEKD_DIRECTION.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treePEKD_DIRECTION.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treePEKD_DIRECTION.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treePEKD_DIRECTION.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treePEKD_DIRECTION_Expand treePEKD_DIRECTION.Nodes.Item(rnode.key)
    Else
     u.Parent.Delete u.ID
     u.Parent.Remove u.ID
    End If
    Set frm = Nothing
End Sub

Private Sub cmdPEKD_DIRECTIONCfg_Click()
  On Error Resume Next
  Dim rnode As MSComctlLib.Node
  Set rnode = treePEKD_DIRECTION.SelectedItem
  If rnode.Tag = "object" Then Exit Sub
  If rnode.Tag = "Row" Then
    Set rnode = rnode.Parent
  End If
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKD_DIRECTION, "gridPEKD_DIRECTION" & rnode.Tag
Set jset = Nothing
End Sub


Private Sub treePEKD_DIRECTION_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treePEKD_DIRECTION.Nodes.Remove Node.Child.Index
 Item.Expand treePEKD_DIRECTION, Node.key, ""
 ParentForm.MousePointer = vbNormal
End If
 Set treePEKD_DIRECTION.SelectedItem = Node
 treePEKD_DIRECTION_NodeClick Node
End Sub

Private Sub treePEKD_DIRECTION_Collapse(ByVal Node As MSComctlLib.Node)
 Set treePEKD_DIRECTION.SelectedItem = Node
 treePEKD_DIRECTION_NodeClick Node
End Sub

Private Sub treePEKD_DIRECTION_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object, ID As String, struct As String
  If Node.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(Node.key, 39, 38)
    struct = Node.Parent.Tag
    Set p = Item.FindRowObject(struct, ID)
    On Error Resume Next
      Item.itemcollection(p.Parent.Parent, TypeName(p)).preparegrid gridPEKD_DIRECTION
      LoadGridLayout gridPEKD_DIRECTION, gridPEKD_DIRECTION.Name & Node.Parent.Tag
    Set fndPEKD_DIRECTION = Nothing
    Set fndPEKD_DIRECTION = CreateObject("MTZ_JSetup.GridFinder")
    fndPEKD_DIRECTION.Init gridPEKD_DIRECTION
  ElseIf Node.Tag <> "object" Then
    If Node.Parent Is Nothing Then
      Item.itemcollection(Item, Node.Tag).preparegrid gridPEKD_DIRECTION
      LoadGridLayout gridPEKD_DIRECTION, gridPEKD_DIRECTION.Name & Node.Tag
    Else
     If Node.Parent.Tag = "Row" Then
       ID = Mid(Node.Parent.key, 39, 38)
       struct = Node.Parent.Parent.Tag
       Set p = Item.FindRowObject(struct, ID)
       Item.itemcollection(p, Node.Tag).preparegrid gridPEKD_DIRECTION
       LoadGridLayout gridPEKD_DIRECTION, gridPEKD_DIRECTION.Name & Node.Tag
     End If
     If Node.Parent.Tag = "object" Then
       ID = Mid(Node.Parent.key, 39, 38)
       Set p = Item.Manager.GetInstanceObject(ID)
       Item.itemcollection(p, Node.Tag).preparegrid gridPEKD_DIRECTION
       LoadGridLayout gridPEKD_DIRECTION, gridPEKD_DIRECTION.Name & Node.Tag
     End If
    End If
  End If
End Sub
Private Sub cmdTPEKD_DIRECTIONRef_Click()
  On Error Resume Next
  treePEKD_DIRECTION.Nodes.Clear
  Item.FillTree treePEKD_DIRECTION, "", "", "PEKD_DIRECTION"
  gridPEKD_DIRECTION.Columns.Clear
  gridPEKD_DIRECTION.ItemCount = 0
End Sub
Private Sub cmdPEKD_DIRECTIONRef_Click()
  On Error Resume Next
  treePEKD_DIRECTION_NodeClick treePEKD_DIRECTION.SelectedItem
End Sub
Private Sub cmdPEKD_DIRECTIONAcc_Click()
On Error Resume Next
If gridPEKD_DIRECTION.ItemCount = 0 Then Exit Sub
If gridPEKD_DIRECTION.Row > 0 Then
 If gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_DIRECTION.RowBookmark(gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub gridPEKD_DIRECTION_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object, ID As String, struct As String
  If treePEKD_DIRECTION.SelectedItem Is Nothing Then Exit Sub
  If treePEKD_DIRECTION.SelectedItem.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(treePEKD_DIRECTION.SelectedItem.key, 39, 38)
    struct = treePEKD_DIRECTION.SelectedItem.Parent.Tag
    Set p = Item.FindRowObject(struct, ID)
      Item.itemcollection(p.Parent.Parent, TypeName(p)).LoadRow gridPEKD_DIRECTION, RowIndex, Bookmark, Values
    Set p = Nothing
  ElseIf treePEKD_DIRECTION.SelectedItem.Tag <> "object" Then
      If treePEKD_DIRECTION.SelectedItem.Parent Is Nothing Then
          Item.itemcollection(Item, treePEKD_DIRECTION.SelectedItem.Tag).LoadRow gridPEKD_DIRECTION, RowIndex, Bookmark, Values
      Else
        If treePEKD_DIRECTION.SelectedItem.Parent.Tag = "Row" Then
          ID = Mid(treePEKD_DIRECTION.SelectedItem.Parent.key, 39, 38)
          struct = treePEKD_DIRECTION.SelectedItem.Parent.Parent.Tag
          Set p = Item.FindRowObject(struct, ID)
          Item.itemcollection(p, treePEKD_DIRECTION.SelectedItem.Tag).LoadRow gridPEKD_DIRECTION, RowIndex, Bookmark, Values
        End If
        If treePEKD_DIRECTION.SelectedItem.Parent.Tag = "object" Then
          ID = Mid(treePEKD_DIRECTION.SelectedItem.Parent.key, 39, 38)
          Set p = Item.Manager.GetInstanceObject(ID)
          Item.itemcollection(p, treePEKD_DIRECTION.SelectedItem.Tag).LoadRow gridPEKD_DIRECTION, RowIndex, Bookmark, Values
        End If
    End If
  End If
End Sub
Private Sub gridPEKD_DIRECTION_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKD_DIRECTION.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    On Error Resume Next
      Dim rnode As MSComctlLib.Node, tid As String
      Set rnode = treePEKD_DIRECTION.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treePEKD_DIRECTION.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treePEKD_DIRECTION.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treePEKD_DIRECTION_Expand treePEKD_DIRECTION.Nodes.Item(rnode.key)
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridPEKD_DIRECTION_DblClick()
On Error Resume Next
If gridPEKD_DIRECTION.ItemCount = 0 Then Exit Sub
If gridPEKD_DIRECTION.Row > 0 Then
 If gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_DIRECTION.RowBookmark(gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row))
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
    gridPEKD_DIRECTION.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

Private Sub gridPEKD_DIRECTION_KeyPress(KeyAscii As Integer)
  If gridPEKD_DIRECTION.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKD_DIRECTION.FindOnPress KeyAscii
End Sub

Private Sub gridPEKD_DIRECTION_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridPEKD_DIRECTION.ItemCount = 0 Then Exit Sub
 If gridPEKD_DIRECTION.Row > 0 Then
   If LastRow <> gridPEKD_DIRECTION.Row And LastRow > 0 Then
     gridPEKD_DIRECTION.GetRowData(LastRow).RowStyle = "Default"
     gridPEKD_DIRECTION.GetRowData(gridPEKD_DIRECTION.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub gridPEKD_DIRECTION_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupPEKD_DIRECTION
End If
End Sub
Private Sub mnuPEKD_DIRECTIONAdd_click()
   menuActionPEKD_DIRECTION = "ADD"
   menuTimerPEKD_DIRECTION.Enabled = True
End Sub
Private Sub mnuPEKD_DIRECTIONEdit_click()
   menuActionPEKD_DIRECTION = "EDIT"
   menuTimerPEKD_DIRECTION.Enabled = True
End Sub
Private Sub mnuPEKD_DIRECTIONDelete_click()
   menuActionPEKD_DIRECTION = "DEL"
   menuTimerPEKD_DIRECTION.Enabled = True
End Sub
Private Sub mnuPEKD_DIRECTIONOpen_click()
   menuActionPEKD_DIRECTION = "RUN"
   menuTimerPEKD_DIRECTION.Enabled = True
End Sub
Private Sub mnuPEKD_DIRECTIONRef_click()
   menuActionPEKD_DIRECTION = "REF"
   menuTimerPEKD_DIRECTION.Enabled = True
End Sub
  Private Sub mnuPEKD_DIRECTIONCOPY_Click()
    On Error Resume Next
    If gridPEKD_DIRECTION.ItemCount = 0 Then Exit Sub
    If gridPEKD_DIRECTION.Row > 0 Then
     If gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_DIRECTION.RowBookmark(gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKD_DIRECTIONCUT_Click()
    On Error Resume Next
    If gridPEKD_DIRECTION.ItemCount = 0 Then Exit Sub
    If gridPEKD_DIRECTION.Row > 0 Then
     If gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_DIRECTION.RowBookmark(gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKD_DIRECTION.ItemCount = bm.Count
      End If
    End If
  End Sub
 Private Sub mnuPEKD_DIRECTIONPASTE_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treePEKD_DIRECTION.SelectedItem Is Nothing Then Exit Sub
    If treePEKD_DIRECTION.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treePEKD_DIRECTION.SelectedItem.key, 39, 38)
      struct = treePEKD_DIRECTION.SelectedItem.Parent.Tag
      Set p = Item.FindRowObject(struct, ID)
      If Item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = Item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treePEKD_DIRECTION.SelectedItem.Tag <> "object" Then
        If treePEKD_DIRECTION.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treePEKD_DIRECTION.SelectedItem.Parent.key, 39, 38)
        struct = treePEKD_DIRECTION.SelectedItem.Parent.Parent.Tag
        Set p = Item.FindRowObject(struct, ID)
        Set u = Item.itemcollection(p, treePEKD_DIRECTION.SelectedItem.Tag).Add
      End If
      If treePEKD_DIRECTION.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treePEKD_DIRECTION.SelectedItem.Parent.key, 39, 38)
        Set p = Item.Manager.GetInstanceObject(ID)
        Set u = Item.itemcollection(p, treePEKD_DIRECTION.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    If GetFromBuffer(u) Then
      gridPEKD_DIRECTION.ItemCount = u.Parent.Count
      gridPEKD_DIRECTION.Refresh
      gridPEKD_DIRECTION.RefreshGroups
      gridPEKD_DIRECTION.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treePEKD_DIRECTION.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treePEKD_DIRECTION.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treePEKD_DIRECTION.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treePEKD_DIRECTION_Expand treePEKD_DIRECTION.Nodes.Item(rnode.key)
    Else
     u.Parent.Remove u.ID
    End If
End Sub

Private Sub mnuPEKD_DIRECTIONCHANGE_Click()
  On Error Resume Next
  If gridPEKD_DIRECTION.ItemCount = 0 Then Exit Sub
  If gridPEKD_DIRECTION.Row > 0 Then
   If gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_DIRECTION.RowBookmark(gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKD_DIRECTION.ItemCount = u.Parent.Count
      gridPEKD_DIRECTION.RefreshRowIndex gridPEKD_DIRECTION.RowIndex(gridPEKD_DIRECTION.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKD_DIRECTIONCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKD_DIRECTIONPrn_click()
   menuActionPEKD_DIRECTION = "PRN"
   menuTimerPEKD_DIRECTION.Enabled = True
End Sub
Private Sub mnuPEKD_DIRECTIONCfg_click()
   menuActionPEKD_DIRECTION = "CFG"
   menuTimerPEKD_DIRECTION.Enabled = True
End Sub
Private Sub mnuPEKD_DIRECTIONFind_click()
   menuActionPEKD_DIRECTION = "FND"
   menuTimerPEKD_DIRECTION.Enabled = True
End Sub
Private Sub mnuPEKD_DIRECTIONAcc_click()
   menuActionPEKD_DIRECTION = "ACC"
   menuTimerPEKD_DIRECTION.Enabled = True
End Sub
Private Sub menuTimerPEKD_DIRECTION_timer()
   menuTimerPEKD_DIRECTION.Enabled = False
   If menuActionPEKD_DIRECTION = "ADD" Then cmdPEKD_DIRECTIONAdd_Click
   If menuActionPEKD_DIRECTION = "EDIT" Then cmdPEKD_DIRECTIONEdit_Click
   If menuActionPEKD_DIRECTION = "DEL" Then cmdPEKD_DIRECTIONDel_Click
   If menuActionPEKD_DIRECTION = "RUN" Then cmdPEKD_DIRECTIONRun_Click
   If menuActionPEKD_DIRECTION = "REF" Then cmdPEKD_DIRECTIONRef_Click
   If menuActionPEKD_DIRECTION = "PRN" Then cmdPEKD_DIRECTIONPrn_Click
   If menuActionPEKD_DIRECTION = "CFG" Then cmdPEKD_DIRECTIONCfg_Click
   If menuActionPEKD_DIRECTION = "FND" Then cmdPEKD_DIRECTIONFnd_Click
   If menuActionPEKD_DIRECTION = "ACC" Then cmdPEKD_DIRECTIONAcc_Click
   menuActionPEKD_DIRECTION = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

Item.FillTree treePEKD_DIRECTION, "", "", "PEKD_DIRECTION"
  LoadBtnPictures cmdTPEKD_DIRECTIONRef, cmdTPEKD_DIRECTIONRef.Tag
  LoadBtnPictures cmdPEKD_DIRECTIONRef, cmdPEKD_DIRECTIONRef.Tag
  LoadBtnPictures cmdPEKD_DIRECTIONAdd, cmdPEKD_DIRECTIONAdd.Tag
  LoadBtnPictures cmdPEKD_DIRECTIONEdit, cmdPEKD_DIRECTIONEdit.Tag
  LoadBtnPictures cmdPEKD_DIRECTIONDel, cmdPEKD_DIRECTIONDel.Tag
  LoadBtnPictures cmdPEKD_DIRECTIONPrn, cmdPEKD_DIRECTIONPrn.Tag
  LoadBtnPictures cmdPEKD_DIRECTIONFnd, cmdPEKD_DIRECTIONFnd.Tag
  LoadBtnPictures cmdPEKD_DIRECTIONCfg, cmdPEKD_DIRECTIONCfg.Tag
  LoadBtnPictures cmdPEKD_DIRECTIONRun, cmdPEKD_DIRECTIONRun.Tag
  LoadBtnPictures cmdPEKD_DIRECTIONAcc, cmdPEKD_DIRECTIONAcc.Tag
  gridPEKD_DIRECTION.Columns.Clear
  gridPEKD_DIRECTION.ItemCount = 0
End Sub
Private Sub OnTabClick()

pnlPEKD_DIRECTION.RestorePosition
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
  pnlPEKD_DIRECTION.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKD_DIRECTION = Nothing
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





