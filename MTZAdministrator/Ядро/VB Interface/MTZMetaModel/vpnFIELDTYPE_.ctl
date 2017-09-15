VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnFIELDTYPE_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerFIELDTYPE 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlFIELDTYPE 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdFIELDTYPEAcc 
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
      Begin MTZ_PANEL.DropButton cmdFIELDTYPERun 
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
      Begin VB.CommandButton cmdFIELDTYPEFnd 
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
      Begin VB.CommandButton cmdFIELDTYPECfg 
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
      Begin VB.CommandButton cmdFIELDTYPEPrn 
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
      Begin VB.CommandButton cmdFIELDTYPERef 
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
      Begin VB.CommandButton cmdFIELDTYPEDel 
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
      Begin VB.CommandButton cmdFIELDTYPEEdit 
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
      Begin VB.CommandButton cmdFIELDTYPEAdd 
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
      Begin VB.CommandButton cmdTFIELDTYPERef 
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
      Begin GridEX20.GridEX gridFIELDTYPE 
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
         Column(1)       =   "vpnFIELDTYPE_.ctx":0000
         Column(2)       =   "vpnFIELDTYPE_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnFIELDTYPE_.ctx":016C
         FormatStyle(2)  =   "vpnFIELDTYPE_.ctx":02C8
         FormatStyle(3)  =   "vpnFIELDTYPE_.ctx":0378
         FormatStyle(4)  =   "vpnFIELDTYPE_.ctx":042C
         FormatStyle(5)  =   "vpnFIELDTYPE_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnFIELDTYPE_.ctx":05BC
      End
      Begin MSComctlLib.TreeView treeFIELDTYPE 
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
   Begin VB.Menu mnuPopupFIELDTYPE 
      Caption         =   "Меню для Тип поля"
      Visible         =   0   'False
      Begin VB.Menu mnuFIELDTYPEAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuFIELDTYPEEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuFIELDTYPEDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuFIELDTYPEOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuFIELDTYPERef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuFIELDTYPES1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFIELDTYPEBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuFIELDTYPECOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuFIELDTYPECUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuFIELDTYPEPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuFIELDTYPECHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuFIELDTYPECLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuFIELDTYPEPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuFIELDTYPECfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuFIELDTYPEFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuFIELDTYPEAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnFIELDTYPE_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Типы полей, перечисления, интервалы
Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndFIELDTYPE As Object
Private menuActionFIELDTYPE As String





Private Sub pnlFIELDTYPE_PositionChanged()
  pnlFIELDTYPE.SavePosition
End Sub
Private Sub cmdFIELDTYPEPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridFIELDTYPE, "Тип поля"
Set jset = Nothing
End Sub

Private Sub cmdFIELDTYPEFnd_Click()
  On Error Resume Next
  fndFIELDTYPE.ShowForm
End Sub
Private Sub cmdFIELDTYPERun_Click()
  On Error Resume Next
  gridFIELDTYPE_DblClick
End Sub
Private Sub pnlFIELDTYPE_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treeFIELDTYPE.Left = Left
  treeFIELDTYPE.Top = Top + 25 * Screen.TwipsPerPixelY
  treeFIELDTYPE.Width = Width
  treeFIELDTYPE.Height = Height - 25 * Screen.TwipsPerPixelY
End Sub
Private Sub pnlFIELDTYPE_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridFIELDTYPE.Left = Left
  gridFIELDTYPE.Top = Top + 25 * Screen.TwipsPerPixelY
  gridFIELDTYPE.Width = Width
  gridFIELDTYPE.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdFIELDTYPEAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdFIELDTYPEEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdFIELDTYPEDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdFIELDTYPERef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdFIELDTYPEPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdFIELDTYPECfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdFIELDTYPEFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdFIELDTYPERun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdFIELDTYPEAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
 Private Sub cmdFIELDTYPEDel_Click()
  On Error Resume Next
  gridFIELDTYPE.Delete
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
 Private Sub cmdFIELDTYPEEdit_Click()
On Error Resume Next
If gridFIELDTYPE.ItemCount = 0 Then Exit Sub
If gridFIELDTYPE.Row > 0 Then
 If gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridFIELDTYPE.RowBookmark(gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "")
    Set frm.item = u
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
    gridFIELDTYPE.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

 Private Sub cmdFIELDTYPEAdd_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeFIELDTYPE.SelectedItem Is Nothing Then Exit Sub
    If treeFIELDTYPE.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeFIELDTYPE.SelectedItem.key, 39, 38)
      struct = treeFIELDTYPE.SelectedItem.Parent.Tag
      Set p = item.FindRowObject(struct, ID)
      If item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeFIELDTYPE.SelectedItem.Tag <> "object" Then
        If treeFIELDTYPE.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeFIELDTYPE.SelectedItem.Parent.key, 39, 38)
        struct = treeFIELDTYPE.SelectedItem.Parent.Parent.Tag
        Set p = item.FindRowObject(struct, ID)
        Set u = item.itemcollection(p, treeFIELDTYPE.SelectedItem.Tag).Add
      End If
      If treeFIELDTYPE.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeFIELDTYPE.SelectedItem.Parent.key, 39, 38)
        Set p = item.Manager.GetInstanceObject(ID)
        Set u = item.itemcollection(p, treeFIELDTYPE.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "")



    Set frm.item = u
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
      gridFIELDTYPE.ItemCount = u.Parent.Count
        gridFIELDTYPE.Refresh
        gridFIELDTYPE.RefreshGroups
        gridFIELDTYPE.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeFIELDTYPE.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeFIELDTYPE.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeFIELDTYPE.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeFIELDTYPE_Expand treeFIELDTYPE.Nodes.item(rnode.key)
    Else
     u.Parent.Delete u.ID
     u.Parent.Remove u.ID
    End If
    Set frm = Nothing
End Sub

Private Sub cmdFIELDTYPECfg_Click()
  On Error Resume Next
  Dim rnode As MSComctlLib.Node
  Set rnode = treeFIELDTYPE.SelectedItem
  If rnode.Tag = "object" Then Exit Sub
  If rnode.Tag = "Row" Then
    Set rnode = rnode.Parent
  End If
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridFIELDTYPE, "gridFIELDTYPE" & rnode.Tag
Set jset = Nothing
End Sub


Private Sub treeFIELDTYPE_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeFIELDTYPE.Nodes.Remove Node.Child.Index
 item.Expand treeFIELDTYPE, Node.key, ""
 ParentForm.MousePointer = vbNormal
End If
 Set treeFIELDTYPE.SelectedItem = Node
 treeFIELDTYPE_NodeClick Node
End Sub

Private Sub treeFIELDTYPE_Collapse(ByVal Node As MSComctlLib.Node)
 Set treeFIELDTYPE.SelectedItem = Node
 treeFIELDTYPE_NodeClick Node
End Sub

Private Sub treeFIELDTYPE_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object, ID As String, struct As String
  If Node.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(Node.key, 39, 38)
    struct = Node.Parent.Tag
    Set p = item.FindRowObject(struct, ID)
    On Error Resume Next
      item.itemcollection(p.Parent.Parent, TypeName(p)).PrepareGrid gridFIELDTYPE
      LoadGridLayout gridFIELDTYPE, gridFIELDTYPE.Name & Node.Parent.Tag
    Set fndFIELDTYPE = Nothing
    Set fndFIELDTYPE = CreateObject("MTZ_JSetup.GridFinder")
    fndFIELDTYPE.Init gridFIELDTYPE
  ElseIf Node.Tag <> "object" Then
    If Node.Parent Is Nothing Then
      item.itemcollection(item, Node.Tag).PrepareGrid gridFIELDTYPE
      LoadGridLayout gridFIELDTYPE, gridFIELDTYPE.Name & Node.Tag
    Else
     If Node.Parent.Tag = "Row" Then
       ID = Mid(Node.Parent.key, 39, 38)
       struct = Node.Parent.Parent.Tag
       Set p = item.FindRowObject(struct, ID)
       item.itemcollection(p, Node.Tag).PrepareGrid gridFIELDTYPE
       LoadGridLayout gridFIELDTYPE, gridFIELDTYPE.Name & Node.Tag
     End If
     If Node.Parent.Tag = "object" Then
       ID = Mid(Node.Parent.key, 39, 38)
       Set p = item.Manager.GetInstanceObject(ID)
       item.itemcollection(p, Node.Tag).PrepareGrid gridFIELDTYPE
       LoadGridLayout gridFIELDTYPE, gridFIELDTYPE.Name & Node.Tag
     End If
    End If
  End If
End Sub
Private Sub cmdTFIELDTYPERef_Click()
  On Error Resume Next
  treeFIELDTYPE.Nodes.Clear
  item.FillTree treeFIELDTYPE, "", "", "FIELDTYPE"
  gridFIELDTYPE.Columns.Clear
  gridFIELDTYPE.ItemCount = 0
End Sub
Private Sub cmdFIELDTYPERef_Click()
  On Error Resume Next
  treeFIELDTYPE_NodeClick treeFIELDTYPE.SelectedItem
End Sub
Private Sub cmdFIELDTYPEAcc_Click()
On Error Resume Next
If gridFIELDTYPE.ItemCount = 0 Then Exit Sub
If gridFIELDTYPE.Row > 0 Then
 If gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridFIELDTYPE.RowBookmark(gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub gridFIELDTYPE_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object, ID As String, struct As String
  If treeFIELDTYPE.SelectedItem Is Nothing Then Exit Sub
  If treeFIELDTYPE.SelectedItem.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(treeFIELDTYPE.SelectedItem.key, 39, 38)
    struct = treeFIELDTYPE.SelectedItem.Parent.Tag
    Set p = item.FindRowObject(struct, ID)
      item.itemcollection(p.Parent.Parent, TypeName(p)).LoadRow gridFIELDTYPE, RowIndex, Bookmark, Values
    Set p = Nothing
  ElseIf treeFIELDTYPE.SelectedItem.Tag <> "object" Then
      If treeFIELDTYPE.SelectedItem.Parent Is Nothing Then
          item.itemcollection(item, treeFIELDTYPE.SelectedItem.Tag).LoadRow gridFIELDTYPE, RowIndex, Bookmark, Values
      Else
        If treeFIELDTYPE.SelectedItem.Parent.Tag = "Row" Then
          ID = Mid(treeFIELDTYPE.SelectedItem.Parent.key, 39, 38)
          struct = treeFIELDTYPE.SelectedItem.Parent.Parent.Tag
          Set p = item.FindRowObject(struct, ID)
          item.itemcollection(p, treeFIELDTYPE.SelectedItem.Tag).LoadRow gridFIELDTYPE, RowIndex, Bookmark, Values
        End If
        If treeFIELDTYPE.SelectedItem.Parent.Tag = "object" Then
          ID = Mid(treeFIELDTYPE.SelectedItem.Parent.key, 39, 38)
          Set p = item.Manager.GetInstanceObject(ID)
          item.itemcollection(p, treeFIELDTYPE.SelectedItem.Tag).LoadRow gridFIELDTYPE, RowIndex, Bookmark, Values
        End If
    End If
  End If
End Sub
Private Sub gridFIELDTYPE_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridFIELDTYPE.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    On Error Resume Next
      Dim rnode As MSComctlLib.Node, tid As String
      Set rnode = treeFIELDTYPE.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeFIELDTYPE.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeFIELDTYPE.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeFIELDTYPE_Expand treeFIELDTYPE.Nodes.item(rnode.key)
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridFIELDTYPE_DblClick()
On Error Resume Next
If gridFIELDTYPE.ItemCount = 0 Then Exit Sub
If gridFIELDTYPE.Row > 0 Then
 If gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridFIELDTYPE.RowBookmark(gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "")
    Set frm.item = u
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
    gridFIELDTYPE.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

Private Sub gridFIELDTYPE_KeyPress(KeyAscii As Integer)
  If gridFIELDTYPE.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndFIELDTYPE.FindOnPress KeyAscii
End Sub

Private Sub gridFIELDTYPE_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridFIELDTYPE.ItemCount = 0 Then Exit Sub
 If gridFIELDTYPE.Row > 0 Then
   If LastRow <> gridFIELDTYPE.Row And LastRow > 0 Then
     gridFIELDTYPE.GetRowData(LastRow).RowStyle = "Default"
     gridFIELDTYPE.GetRowData(gridFIELDTYPE.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub gridFIELDTYPE_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupFIELDTYPE
End If
End Sub
Private Sub mnuFIELDTYPEAdd_click()
   menuActionFIELDTYPE = "ADD"
   menuTimerFIELDTYPE.Enabled = True
End Sub
Private Sub mnuFIELDTYPEEdit_click()
   menuActionFIELDTYPE = "EDIT"
   menuTimerFIELDTYPE.Enabled = True
End Sub
Private Sub mnuFIELDTYPEDelete_click()
   menuActionFIELDTYPE = "DEL"
   menuTimerFIELDTYPE.Enabled = True
End Sub
Private Sub mnuFIELDTYPEOpen_click()
   menuActionFIELDTYPE = "RUN"
   menuTimerFIELDTYPE.Enabled = True
End Sub
Private Sub mnuFIELDTYPERef_click()
   menuActionFIELDTYPE = "REF"
   menuTimerFIELDTYPE.Enabled = True
End Sub
  Private Sub mnuFIELDTYPECOPY_Click()
    On Error Resume Next
    If gridFIELDTYPE.ItemCount = 0 Then Exit Sub
    If gridFIELDTYPE.Row > 0 Then
     If gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridFIELDTYPE.RowBookmark(gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuFIELDTYPECUT_Click()
    On Error Resume Next
    If gridFIELDTYPE.ItemCount = 0 Then Exit Sub
    If gridFIELDTYPE.Row > 0 Then
     If gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridFIELDTYPE.RowBookmark(gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridFIELDTYPE.ItemCount = bm.Count
      End If
    End If
  End Sub
 Private Sub mnuFIELDTYPEPASTE_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeFIELDTYPE.SelectedItem Is Nothing Then Exit Sub
    If treeFIELDTYPE.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeFIELDTYPE.SelectedItem.key, 39, 38)
      struct = treeFIELDTYPE.SelectedItem.Parent.Tag
      Set p = item.FindRowObject(struct, ID)
      If item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeFIELDTYPE.SelectedItem.Tag <> "object" Then
        If treeFIELDTYPE.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeFIELDTYPE.SelectedItem.Parent.key, 39, 38)
        struct = treeFIELDTYPE.SelectedItem.Parent.Parent.Tag
        Set p = item.FindRowObject(struct, ID)
        Set u = item.itemcollection(p, treeFIELDTYPE.SelectedItem.Tag).Add
      End If
      If treeFIELDTYPE.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeFIELDTYPE.SelectedItem.Parent.key, 39, 38)
        Set p = item.Manager.GetInstanceObject(ID)
        Set u = item.itemcollection(p, treeFIELDTYPE.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    If GetFromBuffer(u) Then
      gridFIELDTYPE.ItemCount = u.Parent.Count
      gridFIELDTYPE.Refresh
      gridFIELDTYPE.RefreshGroups
      gridFIELDTYPE.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeFIELDTYPE.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeFIELDTYPE.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeFIELDTYPE.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeFIELDTYPE_Expand treeFIELDTYPE.Nodes.item(rnode.key)
    Else
     u.Parent.Remove u.ID
    End If
End Sub

Private Sub mnuFIELDTYPECHANGE_Click()
  On Error Resume Next
  If gridFIELDTYPE.ItemCount = 0 Then Exit Sub
  If gridFIELDTYPE.Row > 0 Then
   If gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridFIELDTYPE.RowBookmark(gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridFIELDTYPE.ItemCount = u.Parent.Count
      gridFIELDTYPE.RefreshRowIndex gridFIELDTYPE.RowIndex(gridFIELDTYPE.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuFIELDTYPECLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuFIELDTYPEPrn_click()
   menuActionFIELDTYPE = "PRN"
   menuTimerFIELDTYPE.Enabled = True
End Sub
Private Sub mnuFIELDTYPECfg_click()
   menuActionFIELDTYPE = "CFG"
   menuTimerFIELDTYPE.Enabled = True
End Sub
Private Sub mnuFIELDTYPEFind_click()
   menuActionFIELDTYPE = "FND"
   menuTimerFIELDTYPE.Enabled = True
End Sub
Private Sub mnuFIELDTYPEAcc_click()
   menuActionFIELDTYPE = "ACC"
   menuTimerFIELDTYPE.Enabled = True
End Sub
Private Sub menuTimerFIELDTYPE_timer()
   menuTimerFIELDTYPE.Enabled = False
   If menuActionFIELDTYPE = "ADD" Then cmdFIELDTYPEAdd_Click
   If menuActionFIELDTYPE = "EDIT" Then cmdFIELDTYPEEdit_Click
   If menuActionFIELDTYPE = "DEL" Then cmdFIELDTYPEDel_Click
   If menuActionFIELDTYPE = "RUN" Then cmdFIELDTYPERun_Click
   If menuActionFIELDTYPE = "REF" Then cmdFIELDTYPERef_Click
   If menuActionFIELDTYPE = "PRN" Then cmdFIELDTYPEPrn_Click
   If menuActionFIELDTYPE = "CFG" Then cmdFIELDTYPECfg_Click
   If menuActionFIELDTYPE = "FND" Then cmdFIELDTYPEFnd_Click
   If menuActionFIELDTYPE = "ACC" Then cmdFIELDTYPEAcc_Click
   menuActionFIELDTYPE = ""
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

item.FillTree treeFIELDTYPE, "", "", "FIELDTYPE"
  LoadBtnPictures cmdTFIELDTYPERef, cmdTFIELDTYPERef.Tag
  LoadBtnPictures cmdFIELDTYPERef, cmdFIELDTYPERef.Tag
  LoadBtnPictures cmdFIELDTYPEAdd, cmdFIELDTYPEAdd.Tag
  LoadBtnPictures cmdFIELDTYPEEdit, cmdFIELDTYPEEdit.Tag
  LoadBtnPictures cmdFIELDTYPEDel, cmdFIELDTYPEDel.Tag
  LoadBtnPictures cmdFIELDTYPEPrn, cmdFIELDTYPEPrn.Tag
  LoadBtnPictures cmdFIELDTYPEFnd, cmdFIELDTYPEFnd.Tag
  LoadBtnPictures cmdFIELDTYPECfg, cmdFIELDTYPECfg.Tag
  LoadBtnPictures cmdFIELDTYPERun, cmdFIELDTYPERun.Tag
  LoadBtnPictures cmdFIELDTYPEAcc, cmdFIELDTYPEAcc.Tag
  gridFIELDTYPE.Columns.Clear
  gridFIELDTYPE.ItemCount = 0
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlFIELDTYPE.RestorePosition
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
  pnlFIELDTYPE.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndFIELDTYPE = Nothing
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





