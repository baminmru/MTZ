VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnGENPACKAGE_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerGENPACKAGE 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlGENPACKAGE 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdGENPACKAGEAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "security.ico"
         ToolTipText     =   "����� ������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdGENPACKAGERun 
         Height          =   330
         Left            =   2700
         TabIndex        =   11
         Tag             =   "run.ico"
         ToolTipText     =   "�������"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdGENPACKAGEFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "find.ico"
         ToolTipText     =   "�����"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdGENPACKAGECfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "config.ico"
         ToolTipText     =   "��������� �������� ����"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdGENPACKAGEPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   8
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdGENPACKAGERef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "refresh.ico"
         ToolTipText     =   "��������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdGENPACKAGEDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "DELETE.ico"
         ToolTipText     =   "�������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdGENPACKAGEEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "PROP.ico"
         ToolTipText     =   "��������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdGENPACKAGEAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "NEW.ico"
         ToolTipText     =   "��������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdTGENPACKAGERef 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "Refresh.ico"
         ToolTipText     =   "��������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridGENPACKAGE 
         Height          =   480
         Left            =   3900
         TabIndex        =   2
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         Version         =   "2.0"
         AutomaticSort   =   -1  'True
         RecordNavigatorString=   "������:|��"
         BoundColumnIndex=   ""
         ReplaceColumnIndex=   ""
         ScrollToolTipColumn=   ""
         TabKeyBehavior  =   1
         HideSelection   =   2
         SelectionStyle  =   1
         GroupByBoxInfoText=   "�����������"
         AllowDelete     =   -1  'True
         AllowEdit       =   0   'False
         ItemCount       =   0
         DataMode        =   99
         ColumnHeaderHeight=   285
         IntProp1        =   0
         IntProp2        =   0
         IntProp7        =   0
         ColumnsCount    =   2
         Column(1)       =   "vpnGENPACKAGE_.ctx":0000
         Column(2)       =   "vpnGENPACKAGE_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnGENPACKAGE_.ctx":016C
         FormatStyle(2)  =   "vpnGENPACKAGE_.ctx":02C8
         FormatStyle(3)  =   "vpnGENPACKAGE_.ctx":0378
         FormatStyle(4)  =   "vpnGENPACKAGE_.ctx":042C
         FormatStyle(5)  =   "vpnGENPACKAGE_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnGENPACKAGE_.ctx":05BC
      End
      Begin MSComctlLib.TreeView treeGENPACKAGE 
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
   Begin VB.Menu mnuPopupGENPACKAGE 
      Caption         =   "���� ��� ����� ���������"
      Visible         =   0   'False
      Begin VB.Menu mnuGENPACKAGEAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuGENPACKAGEEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuGENPACKAGEDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuGENPACKAGEOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuGENPACKAGERef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuGENPACKAGES1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGENPACKAGEBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuGENPACKAGECOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuGENPACKAGECUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuGENPACKAGEPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuGENPACKAGECHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuGENPACKAGECLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuGENPACKAGEPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuGENPACKAGECfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuGENPACKAGEFind 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuGENPACKAGEAcc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnGENPACKAGE_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ��� ������ �� �������� ������� ����� ���������
Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndGENPACKAGE As Object
Private menuActionGENPACKAGE As String





Private Sub pnlGENPACKAGE_PositionChanged()
  pnlGENPACKAGE.SavePosition
End Sub
Private Sub cmdGENPACKAGEPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridGENPACKAGE, "����� ���������"
Set jset = Nothing
End Sub

Private Sub cmdGENPACKAGEFnd_Click()
  On Error Resume Next
  fndGENPACKAGE.ShowForm
End Sub
Private Sub cmdGENPACKAGERun_Click()
  On Error Resume Next
  gridGENPACKAGE_DblClick
End Sub
Private Sub pnlGENPACKAGE_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treeGENPACKAGE.Left = Left
  treeGENPACKAGE.Top = Top + 25 * Screen.TwipsPerPixelY
  treeGENPACKAGE.Width = Width
  treeGENPACKAGE.Height = Height - 25 * Screen.TwipsPerPixelY
End Sub
Private Sub pnlGENPACKAGE_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridGENPACKAGE.Left = Left
  gridGENPACKAGE.Top = Top + 25 * Screen.TwipsPerPixelY
  gridGENPACKAGE.Width = Width
  gridGENPACKAGE.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdGENPACKAGEAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdGENPACKAGEEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdGENPACKAGEDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdGENPACKAGERef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdGENPACKAGEPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdGENPACKAGECfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdGENPACKAGEFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdGENPACKAGERun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdGENPACKAGEAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
 Private Sub cmdGENPACKAGEDel_Click()
  On Error Resume Next
  gridGENPACKAGE.Delete
End Sub


'������� ������������ ����������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as BooLEAN
'  variable = me.IsOK()
Public Function IsOK() As Boolean
        IsOK = True
End Function
 Private Sub cmdGENPACKAGEEdit_Click()
On Error Resume Next
If gridGENPACKAGE.ItemCount = 0 Then Exit Sub
If gridGENPACKAGE.Row > 0 Then
 If gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridGENPACKAGE.RowBookmark(gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row))
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
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
On Error Resume Next
      GoTo again
    End If
On Error Resume Next
    gridGENPACKAGE.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

 Private Sub cmdGENPACKAGEAdd_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeGENPACKAGE.SelectedItem Is Nothing Then Exit Sub
    If treeGENPACKAGE.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeGENPACKAGE.SelectedItem.key, 39, 38)
      struct = treeGENPACKAGE.SelectedItem.Parent.Tag
      Set p = item.FindRowObject(struct, ID)
      If item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeGENPACKAGE.SelectedItem.Tag <> "object" Then
        If treeGENPACKAGE.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeGENPACKAGE.SelectedItem.Parent.key, 39, 38)
        struct = treeGENPACKAGE.SelectedItem.Parent.Parent.Tag
        Set p = item.FindRowObject(struct, ID)
        Set u = item.itemcollection(p, treeGENPACKAGE.SelectedItem.Tag).Add
      End If
      If treeGENPACKAGE.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeGENPACKAGE.SelectedItem.Parent.key, 39, 38)
        Set p = item.Manager.GetInstanceObject(ID)
        Set u = item.itemcollection(p, treeGENPACKAGE.SelectedItem.Tag).Add
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
      MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
      GoTo again
    End If
      gridGENPACKAGE.ItemCount = u.Parent.Count
        gridGENPACKAGE.Refresh
        gridGENPACKAGE.RefreshGroups
        gridGENPACKAGE.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeGENPACKAGE.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeGENPACKAGE.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeGENPACKAGE.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeGENPACKAGE_Expand treeGENPACKAGE.Nodes.item(rnode.key)
    Else
     u.Parent.Delete u.ID
     u.Parent.Remove u.ID
    End If
    Set frm = Nothing
End Sub

Private Sub cmdGENPACKAGECfg_Click()
  On Error Resume Next
  Dim rnode As MSComctlLib.Node
  Set rnode = treeGENPACKAGE.SelectedItem
  If rnode.Tag = "object" Then Exit Sub
  If rnode.Tag = "Row" Then
    Set rnode = rnode.Parent
  End If
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridGENPACKAGE, "gridGENPACKAGE" & rnode.Tag
Set jset = Nothing
End Sub


Private Sub treeGENPACKAGE_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeGENPACKAGE.Nodes.Remove Node.Child.Index
 item.Expand treeGENPACKAGE, Node.key, ""
 ParentForm.MousePointer = vbNormal
End If
 Set treeGENPACKAGE.SelectedItem = Node
 treeGENPACKAGE_NodeClick Node
End Sub

Private Sub treeGENPACKAGE_Collapse(ByVal Node As MSComctlLib.Node)
 Set treeGENPACKAGE.SelectedItem = Node
 treeGENPACKAGE_NodeClick Node
End Sub

Private Sub treeGENPACKAGE_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object, ID As String, struct As String
  If Node.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(Node.key, 39, 38)
    struct = Node.Parent.Tag
    Set p = item.FindRowObject(struct, ID)
    On Error Resume Next
      item.itemcollection(p.Parent.Parent, TypeName(p)).PrepareGrid gridGENPACKAGE
      LoadGridLayout gridGENPACKAGE, gridGENPACKAGE.Name & Node.Parent.Tag
    Set fndGENPACKAGE = Nothing
    Set fndGENPACKAGE = CreateObject("MTZ_JSetup.GridFinder")
    fndGENPACKAGE.Init gridGENPACKAGE
  ElseIf Node.Tag <> "object" Then
    If Node.Parent Is Nothing Then
      item.itemcollection(item, Node.Tag).PrepareGrid gridGENPACKAGE
      LoadGridLayout gridGENPACKAGE, gridGENPACKAGE.Name & Node.Tag
    Else
     If Node.Parent.Tag = "Row" Then
       ID = Mid(Node.Parent.key, 39, 38)
       struct = Node.Parent.Parent.Tag
       Set p = item.FindRowObject(struct, ID)
       item.itemcollection(p, Node.Tag).PrepareGrid gridGENPACKAGE
       LoadGridLayout gridGENPACKAGE, gridGENPACKAGE.Name & Node.Tag
     End If
     If Node.Parent.Tag = "object" Then
       ID = Mid(Node.Parent.key, 39, 38)
       Set p = item.Manager.GetInstanceObject(ID)
       item.itemcollection(p, Node.Tag).PrepareGrid gridGENPACKAGE
       LoadGridLayout gridGENPACKAGE, gridGENPACKAGE.Name & Node.Tag
     End If
    End If
  End If
End Sub
Private Sub cmdTGENPACKAGERef_Click()
  On Error Resume Next
  treeGENPACKAGE.Nodes.Clear
  item.FillTree treeGENPACKAGE, "", "", "GENPACKAGE"
  gridGENPACKAGE.Columns.Clear
  gridGENPACKAGE.ItemCount = 0
End Sub
Private Sub cmdGENPACKAGERef_Click()
  On Error Resume Next
  treeGENPACKAGE_NodeClick treeGENPACKAGE.SelectedItem
End Sub
Private Sub cmdGENPACKAGEAcc_Click()
On Error Resume Next
If gridGENPACKAGE.ItemCount = 0 Then Exit Sub
If gridGENPACKAGE.Row > 0 Then
 If gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridGENPACKAGE.RowBookmark(gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub gridGENPACKAGE_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object, ID As String, struct As String
  If treeGENPACKAGE.SelectedItem Is Nothing Then Exit Sub
  If treeGENPACKAGE.SelectedItem.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(treeGENPACKAGE.SelectedItem.key, 39, 38)
    struct = treeGENPACKAGE.SelectedItem.Parent.Tag
    Set p = item.FindRowObject(struct, ID)
      item.itemcollection(p.Parent.Parent, TypeName(p)).LoadRow gridGENPACKAGE, RowIndex, Bookmark, Values
    Set p = Nothing
  ElseIf treeGENPACKAGE.SelectedItem.Tag <> "object" Then
      If treeGENPACKAGE.SelectedItem.Parent Is Nothing Then
          item.itemcollection(item, treeGENPACKAGE.SelectedItem.Tag).LoadRow gridGENPACKAGE, RowIndex, Bookmark, Values
      Else
        If treeGENPACKAGE.SelectedItem.Parent.Tag = "Row" Then
          ID = Mid(treeGENPACKAGE.SelectedItem.Parent.key, 39, 38)
          struct = treeGENPACKAGE.SelectedItem.Parent.Parent.Tag
          Set p = item.FindRowObject(struct, ID)
          item.itemcollection(p, treeGENPACKAGE.SelectedItem.Tag).LoadRow gridGENPACKAGE, RowIndex, Bookmark, Values
        End If
        If treeGENPACKAGE.SelectedItem.Parent.Tag = "object" Then
          ID = Mid(treeGENPACKAGE.SelectedItem.Parent.key, 39, 38)
          Set p = item.Manager.GetInstanceObject(ID)
          item.itemcollection(p, treeGENPACKAGE.SelectedItem.Tag).LoadRow gridGENPACKAGE, RowIndex, Bookmark, Values
        End If
    End If
  End If
End Sub
Private Sub gridGENPACKAGE_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridGENPACKAGE.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("������� �������" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "��������") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    On Error Resume Next
      Dim rnode As MSComctlLib.Node, tid As String
      Set rnode = treeGENPACKAGE.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeGENPACKAGE.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeGENPACKAGE.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeGENPACKAGE_Expand treeGENPACKAGE.Nodes.item(rnode.key)
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub

Private Sub gridGENPACKAGE_DblClick()
On Error Resume Next
If gridGENPACKAGE.ItemCount = 0 Then Exit Sub
If gridGENPACKAGE.Row > 0 Then
 If gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridGENPACKAGE.RowBookmark(gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row))
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
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
On Error Resume Next
      GoTo again
    End If
On Error Resume Next
    gridGENPACKAGE.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

Private Sub gridGENPACKAGE_KeyPress(KeyAscii As Integer)
  If gridGENPACKAGE.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndGENPACKAGE.FindOnPress KeyAscii
End Sub

Private Sub gridGENPACKAGE_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridGENPACKAGE.ItemCount = 0 Then Exit Sub
 If gridGENPACKAGE.Row > 0 Then
   If LastRow <> gridGENPACKAGE.Row And LastRow > 0 Then
     gridGENPACKAGE.GetRowData(LastRow).RowStyle = "Default"
     gridGENPACKAGE.GetRowData(gridGENPACKAGE.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub gridGENPACKAGE_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupGENPACKAGE
End If
End Sub
Private Sub mnuGENPACKAGEAdd_click()
   menuActionGENPACKAGE = "ADD"
   menuTimerGENPACKAGE.Enabled = True
End Sub
Private Sub mnuGENPACKAGEEdit_click()
   menuActionGENPACKAGE = "EDIT"
   menuTimerGENPACKAGE.Enabled = True
End Sub
Private Sub mnuGENPACKAGEDelete_click()
   menuActionGENPACKAGE = "DEL"
   menuTimerGENPACKAGE.Enabled = True
End Sub
Private Sub mnuGENPACKAGEOpen_click()
   menuActionGENPACKAGE = "RUN"
   menuTimerGENPACKAGE.Enabled = True
End Sub
Private Sub mnuGENPACKAGERef_click()
   menuActionGENPACKAGE = "REF"
   menuTimerGENPACKAGE.Enabled = True
End Sub
  Private Sub mnuGENPACKAGECOPY_Click()
    On Error Resume Next
    If gridGENPACKAGE.ItemCount = 0 Then Exit Sub
    If gridGENPACKAGE.Row > 0 Then
     If gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridGENPACKAGE.RowBookmark(gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuGENPACKAGECUT_Click()
    On Error Resume Next
    If gridGENPACKAGE.ItemCount = 0 Then Exit Sub
    If gridGENPACKAGE.Row > 0 Then
     If gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridGENPACKAGE.RowBookmark(gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridGENPACKAGE.ItemCount = bm.Count
      End If
    End If
  End Sub
 Private Sub mnuGENPACKAGEPASTE_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeGENPACKAGE.SelectedItem Is Nothing Then Exit Sub
    If treeGENPACKAGE.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeGENPACKAGE.SelectedItem.key, 39, 38)
      struct = treeGENPACKAGE.SelectedItem.Parent.Tag
      Set p = item.FindRowObject(struct, ID)
      If item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeGENPACKAGE.SelectedItem.Tag <> "object" Then
        If treeGENPACKAGE.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeGENPACKAGE.SelectedItem.Parent.key, 39, 38)
        struct = treeGENPACKAGE.SelectedItem.Parent.Parent.Tag
        Set p = item.FindRowObject(struct, ID)
        Set u = item.itemcollection(p, treeGENPACKAGE.SelectedItem.Tag).Add
      End If
      If treeGENPACKAGE.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeGENPACKAGE.SelectedItem.Parent.key, 39, 38)
        Set p = item.Manager.GetInstanceObject(ID)
        Set u = item.itemcollection(p, treeGENPACKAGE.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    If GetFromBuffer(u) Then
      gridGENPACKAGE.ItemCount = u.Parent.Count
      gridGENPACKAGE.Refresh
      gridGENPACKAGE.RefreshGroups
      gridGENPACKAGE.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeGENPACKAGE.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeGENPACKAGE.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeGENPACKAGE.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeGENPACKAGE_Expand treeGENPACKAGE.Nodes.item(rnode.key)
    Else
     u.Parent.Remove u.ID
    End If
End Sub

Private Sub mnuGENPACKAGECHANGE_Click()
  On Error Resume Next
  If gridGENPACKAGE.ItemCount = 0 Then Exit Sub
  If gridGENPACKAGE.Row > 0 Then
   If gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridGENPACKAGE.RowBookmark(gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridGENPACKAGE.ItemCount = u.Parent.Count
      gridGENPACKAGE.RefreshRowIndex gridGENPACKAGE.RowIndex(gridGENPACKAGE.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuGENPACKAGECLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuGENPACKAGEPrn_click()
   menuActionGENPACKAGE = "PRN"
   menuTimerGENPACKAGE.Enabled = True
End Sub
Private Sub mnuGENPACKAGECfg_click()
   menuActionGENPACKAGE = "CFG"
   menuTimerGENPACKAGE.Enabled = True
End Sub
Private Sub mnuGENPACKAGEFind_click()
   menuActionGENPACKAGE = "FND"
   menuTimerGENPACKAGE.Enabled = True
End Sub
Private Sub mnuGENPACKAGEAcc_click()
   menuActionGENPACKAGE = "ACC"
   menuTimerGENPACKAGE.Enabled = True
End Sub
Private Sub menuTimerGENPACKAGE_timer()
   menuTimerGENPACKAGE.Enabled = False
   If menuActionGENPACKAGE = "ADD" Then cmdGENPACKAGEAdd_Click
   If menuActionGENPACKAGE = "EDIT" Then cmdGENPACKAGEEdit_Click
   If menuActionGENPACKAGE = "DEL" Then cmdGENPACKAGEDel_Click
   If menuActionGENPACKAGE = "RUN" Then cmdGENPACKAGERun_Click
   If menuActionGENPACKAGE = "REF" Then cmdGENPACKAGERef_Click
   If menuActionGENPACKAGE = "PRN" Then cmdGENPACKAGEPrn_Click
   If menuActionGENPACKAGE = "CFG" Then cmdGENPACKAGECfg_Click
   If menuActionGENPACKAGE = "FND" Then cmdGENPACKAGEFnd_Click
   If menuActionGENPACKAGE = "ACC" Then cmdGENPACKAGEAcc_Click
   menuActionGENPACKAGE = ""
End Sub

'������� ������������� ������ �������
'Parameters:
'[IN][OUT]  aItem , ��� ���������: object,
'[IN][OUT]   optional pForm , ��� ���������: object = nothing  - ...
'See Also:
'Example:
'  call me.OnInit({���������})
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

item.FillTree treeGENPACKAGE, "", "", "GENPACKAGE"
  LoadBtnPictures cmdTGENPACKAGERef, cmdTGENPACKAGERef.Tag
  LoadBtnPictures cmdGENPACKAGERef, cmdGENPACKAGERef.Tag
  LoadBtnPictures cmdGENPACKAGEAdd, cmdGENPACKAGEAdd.Tag
  LoadBtnPictures cmdGENPACKAGEEdit, cmdGENPACKAGEEdit.Tag
  LoadBtnPictures cmdGENPACKAGEDel, cmdGENPACKAGEDel.Tag
  LoadBtnPictures cmdGENPACKAGEPrn, cmdGENPACKAGEPrn.Tag
  LoadBtnPictures cmdGENPACKAGEFnd, cmdGENPACKAGEFnd.Tag
  LoadBtnPictures cmdGENPACKAGECfg, cmdGENPACKAGECfg.Tag
  LoadBtnPictures cmdGENPACKAGERun, cmdGENPACKAGERun.Tag
  LoadBtnPictures cmdGENPACKAGEAcc, cmdGENPACKAGEAcc.Tag
  gridGENPACKAGE.Columns.Clear
  gridGENPACKAGE.ItemCount = 0
End Sub

'�������� ��� ����������� ����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlGENPACKAGE.RestorePosition
End Sub

'�������� ��� ����������� ������
'Parameters:
'[IN][OUT]  aItem , ��� ���������: object,
'[IN][OUT]   optional pForm , ��� ���������: object = nothing  - ...
'See Also:
'Example:
'  call me.OnClick({���������})
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub

'�������� ��� ����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.OnSave()
Public Sub OnSave()
  
End Sub

'������� ���������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
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
  pnlGENPACKAGE.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub

'������������ ��������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.CloseClass()
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndGENPACKAGE = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
End Sub

'����������� ������� � ��������
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
On Error Resume Next

'do nothing
End Sub



'��� �� ��������� Square >0
'{53371FFA-B514-447A-A1F9-26EE4FD409C9}
Private Sub Run_VBUpdateObjNamePEO(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save

End Sub



'�������� ����� ������� ���������� ���� �� ������� ������
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� ����� ������"
End Sub



'�������� ������� ��������� �������������
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



'��������� ����� ������ ��� ������� ������������ ��� �������� ��������
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� ����� ������"
End Sub



'�������� ������ �� ������ ��������
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "����� " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� ������"
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



'������� ����� ������ �� �������
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKP", "������ " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� �������"
End Sub



'��� �������, � ������� ���� ���� - ������, �������/�������� ������ ��� �������� ���� �������������� ������
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



'������� ����� ������ �� �������
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKO", "������ " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� �������"
End Sub



'�������� �������� �� ��������������
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



'���������� ����� �������
'{61393545-ABF7-46F7-82F3-9B7E610DD9C0}
Private Sub Run_VBUpdateObjName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save
End Sub



'����� ������� ����� ������� � �������� ������������� ���������� (���������� RealEstate) ��� �������� ������ �������� � ���� ��������� ������ ��, ����� �������� � ���������� �� ��������������
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� ��"

End Sub



'�������� �������� �������
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
item.Name = Name
' ����� �� ���� �����, ���� ���������� ������ ActiveX
ParentForm.Caption = item.Name
item.Save
End Sub



'������� ������ �� �������
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "������ " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� ������"
End Sub



'�������� ������������ �� �������
'{B91ABF3A-31F8-4A82-8D41-EF463DBA32D0}
Private Sub Run_SSCreateNomen(Name As Variant, Optional RowItem As Object)
On Error Resume Next

'pointCreateLine
End Sub





