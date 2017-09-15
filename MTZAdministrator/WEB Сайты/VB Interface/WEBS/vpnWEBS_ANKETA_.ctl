VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnWEBS_ANKETA_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWEBS_ANKETA 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlWEBS_ANKETA 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdWEBS_ANKETAAcc 
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
      Begin MTZ_PANEL.DropButton cmdWEBS_ANKETARun 
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
      Begin VB.CommandButton cmdWEBS_ANKETAFnd 
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
      Begin VB.CommandButton cmdWEBS_ANKETACfg 
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
      Begin VB.CommandButton cmdWEBS_ANKETAPrn 
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
      Begin VB.CommandButton cmdWEBS_ANKETARef 
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
      Begin VB.CommandButton cmdWEBS_ANKETADel 
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
      Begin VB.CommandButton cmdWEBS_ANKETAEdit 
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
      Begin VB.CommandButton cmdWEBS_ANKETAAdd 
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
      Begin VB.CommandButton cmdTWEBS_ANKETARef 
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
      Begin GridEX20.GridEX gridWEBS_ANKETA 
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
         Column(1)       =   "vpnWEBS_ANKETA_.ctx":0000
         Column(2)       =   "vpnWEBS_ANKETA_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWEBS_ANKETA_.ctx":016C
         FormatStyle(2)  =   "vpnWEBS_ANKETA_.ctx":02C8
         FormatStyle(3)  =   "vpnWEBS_ANKETA_.ctx":0378
         FormatStyle(4)  =   "vpnWEBS_ANKETA_.ctx":042C
         FormatStyle(5)  =   "vpnWEBS_ANKETA_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWEBS_ANKETA_.ctx":05BC
      End
      Begin MSComctlLib.TreeView treeWEBS_ANKETA 
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
   Begin VB.Menu mnuPopupWEBS_ANKETA 
      Caption         =   "Меню для Анкеты"
      Visible         =   0   'False
      Begin VB.Menu mnuWEBS_ANKETAAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWEBS_ANKETAEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWEBS_ANKETADelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWEBS_ANKETAOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWEBS_ANKETARef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWEBS_ANKETAS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWEBS_ANKETABuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWEBS_ANKETACOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWEBS_ANKETACUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWEBS_ANKETAPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWEBS_ANKETACHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWEBS_ANKETACLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWEBS_ANKETAPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWEBS_ANKETACfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWEBS_ANKETAFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWEBS_ANKETAAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWEBS_ANKETA_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWEBS_ANKETA As Object
Private menuActionWEBS_ANKETA As String





Private Sub pnlWEBS_ANKETA_PositionChanged()
  pnlWEBS_ANKETA.SavePosition
End Sub
Private Sub cmdWEBS_ANKETAPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWEBS_ANKETA, "Анкеты"
Set jset = Nothing
End Sub

Private Sub cmdWEBS_ANKETAFnd_Click()
  On Error Resume Next
  fndWEBS_ANKETA.ShowForm
End Sub
Private Sub cmdWEBS_ANKETARun_Click()
  On Error Resume Next
  gridWEBS_ANKETA_DblClick
End Sub
Private Sub pnlWEBS_ANKETA_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treeWEBS_ANKETA.Left = Left
  treeWEBS_ANKETA.Top = Top + 25 * Screen.TwipsPerPixelY
  treeWEBS_ANKETA.Width = Width
  treeWEBS_ANKETA.Height = Height - 25 * Screen.TwipsPerPixelY
End Sub
Private Sub pnlWEBS_ANKETA_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridWEBS_ANKETA.Left = Left
  gridWEBS_ANKETA.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWEBS_ANKETA.Width = Width
  gridWEBS_ANKETA.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWEBS_ANKETAAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWEBS_ANKETAEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWEBS_ANKETADel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWEBS_ANKETARef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWEBS_ANKETAPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWEBS_ANKETACfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWEBS_ANKETAFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWEBS_ANKETARun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWEBS_ANKETAAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
 Private Sub cmdWEBS_ANKETADel_Click()
  On Error Resume Next
  gridWEBS_ANKETA.Delete
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
 Private Sub cmdWEBS_ANKETAEdit_Click()
On Error Resume Next
If gridWEBS_ANKETA.ItemCount = 0 Then Exit Sub
If gridWEBS_ANKETA.Row > 0 Then
 If gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWEBS_ANKETA.RowBookmark(gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row))
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
    gridWEBS_ANKETA.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

 Private Sub cmdWEBS_ANKETAAdd_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeWEBS_ANKETA.SelectedItem Is Nothing Then Exit Sub
    If treeWEBS_ANKETA.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeWEBS_ANKETA.SelectedItem.key, 39, 38)
      struct = treeWEBS_ANKETA.SelectedItem.Parent.Tag
      Set p = Item.FindRowObject(struct, ID)
      If Item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = Item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeWEBS_ANKETA.SelectedItem.Tag <> "object" Then
        If treeWEBS_ANKETA.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeWEBS_ANKETA.SelectedItem.Parent.key, 39, 38)
        struct = treeWEBS_ANKETA.SelectedItem.Parent.Parent.Tag
        Set p = Item.FindRowObject(struct, ID)
        Set u = Item.itemcollection(p, treeWEBS_ANKETA.SelectedItem.Tag).Add
      End If
      If treeWEBS_ANKETA.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeWEBS_ANKETA.SelectedItem.Parent.key, 39, 38)
        Set p = Item.Manager.GetInstanceObject(ID)
        Set u = Item.itemcollection(p, treeWEBS_ANKETA.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "")


If TypeName(u) = "WEBS_QUESTIONS" Then
   Call GetNumValue(u, "the_Number", "{E7F3EE01-4EC4-41D2-8657-BA22089DE0E5}", Now, "", "")

End If

If TypeName(u) = "WEBS_ANSWERS" Then
   Call GetNumValue(u, "the_Number", "{E7F3EE01-4EC4-41D2-8657-BA22089DE0E5}", Now, "", "")

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
      gridWEBS_ANKETA.ItemCount = u.Parent.Count
        gridWEBS_ANKETA.Refresh
        gridWEBS_ANKETA.RefreshGroups
        gridWEBS_ANKETA.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeWEBS_ANKETA.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeWEBS_ANKETA.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeWEBS_ANKETA.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeWEBS_ANKETA_Expand treeWEBS_ANKETA.Nodes.Item(rnode.key)
    Else
     u.Parent.Delete u.ID
     u.Parent.Remove u.ID
    End If
    Set frm = Nothing
End Sub

Private Sub cmdWEBS_ANKETACfg_Click()
  On Error Resume Next
  Dim rnode As MSComctlLib.Node
  Set rnode = treeWEBS_ANKETA.SelectedItem
  If rnode.Tag = "object" Then Exit Sub
  If rnode.Tag = "Row" Then
    Set rnode = rnode.Parent
  End If
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWEBS_ANKETA, "gridWEBS_ANKETA" & rnode.Tag
Set jset = Nothing
End Sub


Private Sub treeWEBS_ANKETA_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeWEBS_ANKETA.Nodes.Remove Node.Child.Index
 Item.Expand treeWEBS_ANKETA, Node.key, ""
 ParentForm.MousePointer = vbNormal
End If
 Set treeWEBS_ANKETA.SelectedItem = Node
 treeWEBS_ANKETA_NodeClick Node
End Sub

Private Sub treeWEBS_ANKETA_Collapse(ByVal Node As MSComctlLib.Node)
 Set treeWEBS_ANKETA.SelectedItem = Node
 treeWEBS_ANKETA_NodeClick Node
End Sub

Private Sub treeWEBS_ANKETA_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object, ID As String, struct As String
  If Node.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(Node.key, 39, 38)
    struct = Node.Parent.Tag
    Set p = Item.FindRowObject(struct, ID)
    On Error Resume Next
      Item.itemcollection(p.Parent.Parent, TypeName(p)).preparegrid gridWEBS_ANKETA
      LoadGridLayout gridWEBS_ANKETA, gridWEBS_ANKETA.Name & Node.Parent.Tag
    Set fndWEBS_ANKETA = Nothing
    Set fndWEBS_ANKETA = CreateObject("MTZ_JSetup.GridFinder")
    fndWEBS_ANKETA.Init gridWEBS_ANKETA
  ElseIf Node.Tag <> "object" Then
    If Node.Parent Is Nothing Then
      Item.itemcollection(Item, Node.Tag).preparegrid gridWEBS_ANKETA
      LoadGridLayout gridWEBS_ANKETA, gridWEBS_ANKETA.Name & Node.Tag
    Else
     If Node.Parent.Tag = "Row" Then
       ID = Mid(Node.Parent.key, 39, 38)
       struct = Node.Parent.Parent.Tag
       Set p = Item.FindRowObject(struct, ID)
       Item.itemcollection(p, Node.Tag).preparegrid gridWEBS_ANKETA
       LoadGridLayout gridWEBS_ANKETA, gridWEBS_ANKETA.Name & Node.Tag
     End If
     If Node.Parent.Tag = "object" Then
       ID = Mid(Node.Parent.key, 39, 38)
       Set p = Item.Manager.GetInstanceObject(ID)
       Item.itemcollection(p, Node.Tag).preparegrid gridWEBS_ANKETA
       LoadGridLayout gridWEBS_ANKETA, gridWEBS_ANKETA.Name & Node.Tag
     End If
    End If
  End If
End Sub
Private Sub cmdTWEBS_ANKETARef_Click()
  On Error Resume Next
  treeWEBS_ANKETA.Nodes.Clear
  Item.FillTree treeWEBS_ANKETA, "", "", "WEBS_ANKETA"
  gridWEBS_ANKETA.Columns.Clear
  gridWEBS_ANKETA.ItemCount = 0
End Sub
Private Sub cmdWEBS_ANKETARef_Click()
  On Error Resume Next
  treeWEBS_ANKETA_NodeClick treeWEBS_ANKETA.SelectedItem
End Sub
Private Sub cmdWEBS_ANKETAAcc_Click()
On Error Resume Next
If gridWEBS_ANKETA.ItemCount = 0 Then Exit Sub
If gridWEBS_ANKETA.Row > 0 Then
 If gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWEBS_ANKETA.RowBookmark(gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub gridWEBS_ANKETA_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object, ID As String, struct As String
  If treeWEBS_ANKETA.SelectedItem Is Nothing Then Exit Sub
  If treeWEBS_ANKETA.SelectedItem.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(treeWEBS_ANKETA.SelectedItem.key, 39, 38)
    struct = treeWEBS_ANKETA.SelectedItem.Parent.Tag
    Set p = Item.FindRowObject(struct, ID)
      Item.itemcollection(p.Parent.Parent, TypeName(p)).LoadRow gridWEBS_ANKETA, RowIndex, Bookmark, Values
    Set p = Nothing
  ElseIf treeWEBS_ANKETA.SelectedItem.Tag <> "object" Then
      If treeWEBS_ANKETA.SelectedItem.Parent Is Nothing Then
          Item.itemcollection(Item, treeWEBS_ANKETA.SelectedItem.Tag).LoadRow gridWEBS_ANKETA, RowIndex, Bookmark, Values
      Else
        If treeWEBS_ANKETA.SelectedItem.Parent.Tag = "Row" Then
          ID = Mid(treeWEBS_ANKETA.SelectedItem.Parent.key, 39, 38)
          struct = treeWEBS_ANKETA.SelectedItem.Parent.Parent.Tag
          Set p = Item.FindRowObject(struct, ID)
          Item.itemcollection(p, treeWEBS_ANKETA.SelectedItem.Tag).LoadRow gridWEBS_ANKETA, RowIndex, Bookmark, Values
        End If
        If treeWEBS_ANKETA.SelectedItem.Parent.Tag = "object" Then
          ID = Mid(treeWEBS_ANKETA.SelectedItem.Parent.key, 39, 38)
          Set p = Item.Manager.GetInstanceObject(ID)
          Item.itemcollection(p, treeWEBS_ANKETA.SelectedItem.Tag).LoadRow gridWEBS_ANKETA, RowIndex, Bookmark, Values
        End If
    End If
  End If
End Sub
Private Sub gridWEBS_ANKETA_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWEBS_ANKETA.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    On Error Resume Next
      Dim rnode As MSComctlLib.Node, tid As String
      Set rnode = treeWEBS_ANKETA.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeWEBS_ANKETA.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeWEBS_ANKETA.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeWEBS_ANKETA_Expand treeWEBS_ANKETA.Nodes.Item(rnode.key)
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridWEBS_ANKETA_DblClick()
On Error Resume Next
If gridWEBS_ANKETA.ItemCount = 0 Then Exit Sub
If gridWEBS_ANKETA.Row > 0 Then
 If gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWEBS_ANKETA.RowBookmark(gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row))
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
    gridWEBS_ANKETA.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

Private Sub gridWEBS_ANKETA_KeyPress(KeyAscii As Integer)
  If gridWEBS_ANKETA.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWEBS_ANKETA.FindOnPress KeyAscii
End Sub

Private Sub gridWEBS_ANKETA_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridWEBS_ANKETA.ItemCount = 0 Then Exit Sub
 If gridWEBS_ANKETA.Row > 0 Then
   If LastRow <> gridWEBS_ANKETA.Row And LastRow > 0 Then
     gridWEBS_ANKETA.GetRowData(LastRow).RowStyle = "Default"
     gridWEBS_ANKETA.GetRowData(gridWEBS_ANKETA.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub gridWEBS_ANKETA_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWEBS_ANKETA
End If
End Sub
Private Sub mnuWEBS_ANKETAAdd_click()
   menuActionWEBS_ANKETA = "ADD"
   menuTimerWEBS_ANKETA.Enabled = True
End Sub
Private Sub mnuWEBS_ANKETAEdit_click()
   menuActionWEBS_ANKETA = "EDIT"
   menuTimerWEBS_ANKETA.Enabled = True
End Sub
Private Sub mnuWEBS_ANKETADelete_click()
   menuActionWEBS_ANKETA = "DEL"
   menuTimerWEBS_ANKETA.Enabled = True
End Sub
Private Sub mnuWEBS_ANKETAOpen_click()
   menuActionWEBS_ANKETA = "RUN"
   menuTimerWEBS_ANKETA.Enabled = True
End Sub
Private Sub mnuWEBS_ANKETARef_click()
   menuActionWEBS_ANKETA = "REF"
   menuTimerWEBS_ANKETA.Enabled = True
End Sub
  Private Sub mnuWEBS_ANKETACOPY_Click()
    On Error Resume Next
    If gridWEBS_ANKETA.ItemCount = 0 Then Exit Sub
    If gridWEBS_ANKETA.Row > 0 Then
     If gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWEBS_ANKETA.RowBookmark(gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWEBS_ANKETACUT_Click()
    On Error Resume Next
    If gridWEBS_ANKETA.ItemCount = 0 Then Exit Sub
    If gridWEBS_ANKETA.Row > 0 Then
     If gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWEBS_ANKETA.RowBookmark(gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWEBS_ANKETA.ItemCount = bm.Count
      End If
    End If
  End Sub
 Private Sub mnuWEBS_ANKETAPASTE_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeWEBS_ANKETA.SelectedItem Is Nothing Then Exit Sub
    If treeWEBS_ANKETA.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeWEBS_ANKETA.SelectedItem.key, 39, 38)
      struct = treeWEBS_ANKETA.SelectedItem.Parent.Tag
      Set p = Item.FindRowObject(struct, ID)
      If Item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = Item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeWEBS_ANKETA.SelectedItem.Tag <> "object" Then
        If treeWEBS_ANKETA.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeWEBS_ANKETA.SelectedItem.Parent.key, 39, 38)
        struct = treeWEBS_ANKETA.SelectedItem.Parent.Parent.Tag
        Set p = Item.FindRowObject(struct, ID)
        Set u = Item.itemcollection(p, treeWEBS_ANKETA.SelectedItem.Tag).Add
      End If
      If treeWEBS_ANKETA.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeWEBS_ANKETA.SelectedItem.Parent.key, 39, 38)
        Set p = Item.Manager.GetInstanceObject(ID)
        Set u = Item.itemcollection(p, treeWEBS_ANKETA.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    If GetFromBuffer(u) Then
      gridWEBS_ANKETA.ItemCount = u.Parent.Count
      gridWEBS_ANKETA.Refresh
      gridWEBS_ANKETA.RefreshGroups
      gridWEBS_ANKETA.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeWEBS_ANKETA.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeWEBS_ANKETA.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeWEBS_ANKETA.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeWEBS_ANKETA_Expand treeWEBS_ANKETA.Nodes.Item(rnode.key)
    Else
     u.Parent.Remove u.ID
    End If
End Sub

Private Sub mnuWEBS_ANKETACHANGE_Click()
  On Error Resume Next
  If gridWEBS_ANKETA.ItemCount = 0 Then Exit Sub
  If gridWEBS_ANKETA.Row > 0 Then
   If gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWEBS_ANKETA.RowBookmark(gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWEBS_ANKETA.ItemCount = u.Parent.Count
      gridWEBS_ANKETA.RefreshRowIndex gridWEBS_ANKETA.RowIndex(gridWEBS_ANKETA.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWEBS_ANKETACLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWEBS_ANKETAPrn_click()
   menuActionWEBS_ANKETA = "PRN"
   menuTimerWEBS_ANKETA.Enabled = True
End Sub
Private Sub mnuWEBS_ANKETACfg_click()
   menuActionWEBS_ANKETA = "CFG"
   menuTimerWEBS_ANKETA.Enabled = True
End Sub
Private Sub mnuWEBS_ANKETAFind_click()
   menuActionWEBS_ANKETA = "FND"
   menuTimerWEBS_ANKETA.Enabled = True
End Sub
Private Sub mnuWEBS_ANKETAAcc_click()
   menuActionWEBS_ANKETA = "ACC"
   menuTimerWEBS_ANKETA.Enabled = True
End Sub
Private Sub menuTimerWEBS_ANKETA_timer()
   menuTimerWEBS_ANKETA.Enabled = False
   If menuActionWEBS_ANKETA = "ADD" Then cmdWEBS_ANKETAAdd_Click
   If menuActionWEBS_ANKETA = "EDIT" Then cmdWEBS_ANKETAEdit_Click
   If menuActionWEBS_ANKETA = "DEL" Then cmdWEBS_ANKETADel_Click
   If menuActionWEBS_ANKETA = "RUN" Then cmdWEBS_ANKETARun_Click
   If menuActionWEBS_ANKETA = "REF" Then cmdWEBS_ANKETARef_Click
   If menuActionWEBS_ANKETA = "PRN" Then cmdWEBS_ANKETAPrn_Click
   If menuActionWEBS_ANKETA = "CFG" Then cmdWEBS_ANKETACfg_Click
   If menuActionWEBS_ANKETA = "FND" Then cmdWEBS_ANKETAFnd_Click
   If menuActionWEBS_ANKETA = "ACC" Then cmdWEBS_ANKETAAcc_Click
   menuActionWEBS_ANKETA = ""
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

Item.FillTree treeWEBS_ANKETA, "", "", "WEBS_ANKETA"
  LoadBtnPictures cmdTWEBS_ANKETARef, cmdTWEBS_ANKETARef.Tag
  LoadBtnPictures cmdWEBS_ANKETARef, cmdWEBS_ANKETARef.Tag
  LoadBtnPictures cmdWEBS_ANKETAAdd, cmdWEBS_ANKETAAdd.Tag
  LoadBtnPictures cmdWEBS_ANKETAEdit, cmdWEBS_ANKETAEdit.Tag
  LoadBtnPictures cmdWEBS_ANKETADel, cmdWEBS_ANKETADel.Tag
  LoadBtnPictures cmdWEBS_ANKETAPrn, cmdWEBS_ANKETAPrn.Tag
  LoadBtnPictures cmdWEBS_ANKETAFnd, cmdWEBS_ANKETAFnd.Tag
  LoadBtnPictures cmdWEBS_ANKETACfg, cmdWEBS_ANKETACfg.Tag
  LoadBtnPictures cmdWEBS_ANKETARun, cmdWEBS_ANKETARun.Tag
  LoadBtnPictures cmdWEBS_ANKETAAcc, cmdWEBS_ANKETAAcc.Tag
  gridWEBS_ANKETA.Columns.Clear
  gridWEBS_ANKETA.ItemCount = 0
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlWEBS_ANKETA.RestorePosition
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
  pnlWEBS_ANKETA.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndWEBS_ANKETA = Nothing
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





