VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnSHAREDMETHOD_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerSHAREDMETHOD 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlSHAREDMETHOD 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdSHAREDMETHODAcc 
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
      Begin MTZ_PANEL.DropButton cmdSHAREDMETHODRun 
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
      Begin VB.CommandButton cmdSHAREDMETHODFnd 
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
      Begin VB.CommandButton cmdSHAREDMETHODCfg 
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
      Begin VB.CommandButton cmdSHAREDMETHODPrn 
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
      Begin VB.CommandButton cmdSHAREDMETHODRef 
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
      Begin VB.CommandButton cmdSHAREDMETHODDel 
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
      Begin VB.CommandButton cmdSHAREDMETHODEdit 
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
      Begin VB.CommandButton cmdSHAREDMETHODAdd 
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
      Begin VB.CommandButton cmdTSHAREDMETHODRef 
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
      Begin GridEX20.GridEX gridSHAREDMETHOD 
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
         Column(1)       =   "vpnSHAREDMETHOD_.ctx":0000
         Column(2)       =   "vpnSHAREDMETHOD_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnSHAREDMETHOD_.ctx":016C
         FormatStyle(2)  =   "vpnSHAREDMETHOD_.ctx":02C8
         FormatStyle(3)  =   "vpnSHAREDMETHOD_.ctx":0378
         FormatStyle(4)  =   "vpnSHAREDMETHOD_.ctx":042C
         FormatStyle(5)  =   "vpnSHAREDMETHOD_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnSHAREDMETHOD_.ctx":05BC
      End
      Begin MSComctlLib.TreeView treeSHAREDMETHOD 
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
   Begin VB.Menu mnuPopupSHAREDMETHOD 
      Caption         =   "���� ��� ������ � ���������"
      Visible         =   0   'False
      Begin VB.Menu mnuSHAREDMETHODAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuSHAREDMETHODEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuSHAREDMETHODDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuSHAREDMETHODOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuSHAREDMETHODRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuSHAREDMETHODS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSHAREDMETHODBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuSHAREDMETHODCOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuSHAREDMETHODCUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuSHAREDMETHODPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuSHAREDMETHODCHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuSHAREDMETHODCLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuSHAREDMETHODPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuSHAREDMETHODCfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuSHAREDMETHODFind 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuSHAREDMETHODAcc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnSHAREDMETHOD_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ��� ������ �� �������� ������� ������ � ���������
Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndSHAREDMETHOD As Object
Private menuActionSHAREDMETHOD As String





Private Sub pnlSHAREDMETHOD_PositionChanged()
  pnlSHAREDMETHOD.SavePosition
End Sub
Private Sub cmdSHAREDMETHODPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridSHAREDMETHOD, "������ � ���������"
Set jset = Nothing
End Sub

Private Sub cmdSHAREDMETHODFnd_Click()
  On Error Resume Next
  fndSHAREDMETHOD.ShowForm
End Sub
Private Sub cmdSHAREDMETHODRun_Click()
  On Error Resume Next
  gridSHAREDMETHOD_DblClick
End Sub
Private Sub pnlSHAREDMETHOD_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treeSHAREDMETHOD.Left = Left
  treeSHAREDMETHOD.Top = Top + 25 * Screen.TwipsPerPixelY
  treeSHAREDMETHOD.Width = Width
  treeSHAREDMETHOD.Height = Height - 25 * Screen.TwipsPerPixelY
End Sub
Private Sub pnlSHAREDMETHOD_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridSHAREDMETHOD.Left = Left
  gridSHAREDMETHOD.Top = Top + 25 * Screen.TwipsPerPixelY
  gridSHAREDMETHOD.Width = Width
  gridSHAREDMETHOD.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdSHAREDMETHODAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdSHAREDMETHODEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdSHAREDMETHODDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdSHAREDMETHODRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdSHAREDMETHODPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdSHAREDMETHODCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdSHAREDMETHODFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdSHAREDMETHODRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdSHAREDMETHODAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
 Private Sub cmdSHAREDMETHODDel_Click()
  On Error Resume Next
  gridSHAREDMETHOD.Delete
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
 Private Sub cmdSHAREDMETHODEdit_Click()
On Error Resume Next
If gridSHAREDMETHOD.ItemCount = 0 Then Exit Sub
If gridSHAREDMETHOD.Row > 0 Then
 If gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridSHAREDMETHOD.RowBookmark(gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row))
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
    gridSHAREDMETHOD.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

 Private Sub cmdSHAREDMETHODAdd_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeSHAREDMETHOD.SelectedItem Is Nothing Then Exit Sub
    If treeSHAREDMETHOD.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeSHAREDMETHOD.SelectedItem.key, 39, 38)
      struct = treeSHAREDMETHOD.SelectedItem.Parent.Tag
      Set p = item.FindRowObject(struct, ID)
      If item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeSHAREDMETHOD.SelectedItem.Tag <> "object" Then
        If treeSHAREDMETHOD.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeSHAREDMETHOD.SelectedItem.Parent.key, 39, 38)
        struct = treeSHAREDMETHOD.SelectedItem.Parent.Parent.Tag
        Set p = item.FindRowObject(struct, ID)
        Set u = item.itemcollection(p, treeSHAREDMETHOD.SelectedItem.Tag).Add
      End If
      If treeSHAREDMETHOD.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeSHAREDMETHOD.SelectedItem.Parent.key, 39, 38)
        Set p = item.Manager.GetInstanceObject(ID)
        Set u = item.itemcollection(p, treeSHAREDMETHOD.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    Dim frm As Form
    Set frm = FormByName(TypeName(u), "")



If TypeName(u) = "PARAMETERS" Then
   Call GetNumValue(u, "sequence", "{E7F3EE01-4EC4-41D2-8657-BA22089DE0E5}", Now, "PARAMETER%P", "")

End If
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
      gridSHAREDMETHOD.ItemCount = u.Parent.Count
        gridSHAREDMETHOD.Refresh
        gridSHAREDMETHOD.RefreshGroups
        gridSHAREDMETHOD.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeSHAREDMETHOD.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeSHAREDMETHOD.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeSHAREDMETHOD.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeSHAREDMETHOD_Expand treeSHAREDMETHOD.Nodes.item(rnode.key)
    Else
     u.Parent.Delete u.ID
     u.Parent.Remove u.ID
    End If
    Set frm = Nothing
End Sub

Private Sub cmdSHAREDMETHODCfg_Click()
  On Error Resume Next
  Dim rnode As MSComctlLib.Node
  Set rnode = treeSHAREDMETHOD.SelectedItem
  If rnode.Tag = "object" Then Exit Sub
  If rnode.Tag = "Row" Then
    Set rnode = rnode.Parent
  End If
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridSHAREDMETHOD, "gridSHAREDMETHOD" & rnode.Tag
Set jset = Nothing
End Sub


Private Sub treeSHAREDMETHOD_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeSHAREDMETHOD.Nodes.Remove Node.Child.Index
 item.Expand treeSHAREDMETHOD, Node.key, ""
 ParentForm.MousePointer = vbNormal
End If
 Set treeSHAREDMETHOD.SelectedItem = Node
 treeSHAREDMETHOD_NodeClick Node
End Sub

Private Sub treeSHAREDMETHOD_Collapse(ByVal Node As MSComctlLib.Node)
 Set treeSHAREDMETHOD.SelectedItem = Node
 treeSHAREDMETHOD_NodeClick Node
End Sub

Private Sub treeSHAREDMETHOD_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object, ID As String, struct As String
  If Node.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(Node.key, 39, 38)
    struct = Node.Parent.Tag
    Set p = item.FindRowObject(struct, ID)
    On Error Resume Next
      item.itemcollection(p.Parent.Parent, TypeName(p)).PrepareGrid gridSHAREDMETHOD
      LoadGridLayout gridSHAREDMETHOD, gridSHAREDMETHOD.Name & Node.Parent.Tag
    Set fndSHAREDMETHOD = Nothing
    Set fndSHAREDMETHOD = CreateObject("MTZ_JSetup.GridFinder")
    fndSHAREDMETHOD.Init gridSHAREDMETHOD
  ElseIf Node.Tag <> "object" Then
    If Node.Parent Is Nothing Then
      item.itemcollection(item, Node.Tag).PrepareGrid gridSHAREDMETHOD
      LoadGridLayout gridSHAREDMETHOD, gridSHAREDMETHOD.Name & Node.Tag
    Else
     If Node.Parent.Tag = "Row" Then
       ID = Mid(Node.Parent.key, 39, 38)
       struct = Node.Parent.Parent.Tag
       Set p = item.FindRowObject(struct, ID)
       item.itemcollection(p, Node.Tag).PrepareGrid gridSHAREDMETHOD
       LoadGridLayout gridSHAREDMETHOD, gridSHAREDMETHOD.Name & Node.Tag
     End If
     If Node.Parent.Tag = "object" Then
       ID = Mid(Node.Parent.key, 39, 38)
       Set p = item.Manager.GetInstanceObject(ID)
       item.itemcollection(p, Node.Tag).PrepareGrid gridSHAREDMETHOD
       LoadGridLayout gridSHAREDMETHOD, gridSHAREDMETHOD.Name & Node.Tag
     End If
    End If
  End If
End Sub
Private Sub cmdTSHAREDMETHODRef_Click()
  On Error Resume Next
  treeSHAREDMETHOD.Nodes.Clear
  item.FillTree treeSHAREDMETHOD, "", "", "SHAREDMETHOD"
  gridSHAREDMETHOD.Columns.Clear
  gridSHAREDMETHOD.ItemCount = 0
End Sub
Private Sub cmdSHAREDMETHODRef_Click()
  On Error Resume Next
  treeSHAREDMETHOD_NodeClick treeSHAREDMETHOD.SelectedItem
End Sub
Private Sub cmdSHAREDMETHODAcc_Click()
On Error Resume Next
If gridSHAREDMETHOD.ItemCount = 0 Then Exit Sub
If gridSHAREDMETHOD.Row > 0 Then
 If gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridSHAREDMETHOD.RowBookmark(gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub gridSHAREDMETHOD_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object, ID As String, struct As String
  If treeSHAREDMETHOD.SelectedItem Is Nothing Then Exit Sub
  If treeSHAREDMETHOD.SelectedItem.Tag = "Row" Then
    On Error Resume Next
    ID = Mid(treeSHAREDMETHOD.SelectedItem.key, 39, 38)
    struct = treeSHAREDMETHOD.SelectedItem.Parent.Tag
    Set p = item.FindRowObject(struct, ID)
      item.itemcollection(p.Parent.Parent, TypeName(p)).LoadRow gridSHAREDMETHOD, RowIndex, Bookmark, Values
    Set p = Nothing
  ElseIf treeSHAREDMETHOD.SelectedItem.Tag <> "object" Then
      If treeSHAREDMETHOD.SelectedItem.Parent Is Nothing Then
          item.itemcollection(item, treeSHAREDMETHOD.SelectedItem.Tag).LoadRow gridSHAREDMETHOD, RowIndex, Bookmark, Values
      Else
        If treeSHAREDMETHOD.SelectedItem.Parent.Tag = "Row" Then
          ID = Mid(treeSHAREDMETHOD.SelectedItem.Parent.key, 39, 38)
          struct = treeSHAREDMETHOD.SelectedItem.Parent.Parent.Tag
          Set p = item.FindRowObject(struct, ID)
          item.itemcollection(p, treeSHAREDMETHOD.SelectedItem.Tag).LoadRow gridSHAREDMETHOD, RowIndex, Bookmark, Values
        End If
        If treeSHAREDMETHOD.SelectedItem.Parent.Tag = "object" Then
          ID = Mid(treeSHAREDMETHOD.SelectedItem.Parent.key, 39, 38)
          Set p = item.Manager.GetInstanceObject(ID)
          item.itemcollection(p, treeSHAREDMETHOD.SelectedItem.Tag).LoadRow gridSHAREDMETHOD, RowIndex, Bookmark, Values
        End If
    End If
  End If
End Sub
Private Sub gridSHAREDMETHOD_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridSHAREDMETHOD.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("������� �������" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "��������") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    On Error Resume Next
      Dim rnode As MSComctlLib.Node, tid As String
      Set rnode = treeSHAREDMETHOD.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeSHAREDMETHOD.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeSHAREDMETHOD.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeSHAREDMETHOD_Expand treeSHAREDMETHOD.Nodes.item(rnode.key)
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub

Private Sub gridSHAREDMETHOD_DblClick()
On Error Resume Next
If gridSHAREDMETHOD.ItemCount = 0 Then Exit Sub
If gridSHAREDMETHOD.Row > 0 Then
 If gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridSHAREDMETHOD.RowBookmark(gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row))
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
    gridSHAREDMETHOD.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
    Set frm = Nothing
 End If
End If
End Sub

Private Sub gridSHAREDMETHOD_KeyPress(KeyAscii As Integer)
  If gridSHAREDMETHOD.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndSHAREDMETHOD.FindOnPress KeyAscii
End Sub

Private Sub gridSHAREDMETHOD_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridSHAREDMETHOD.ItemCount = 0 Then Exit Sub
 If gridSHAREDMETHOD.Row > 0 Then
   If LastRow <> gridSHAREDMETHOD.Row And LastRow > 0 Then
     gridSHAREDMETHOD.GetRowData(LastRow).RowStyle = "Default"
     gridSHAREDMETHOD.GetRowData(gridSHAREDMETHOD.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub gridSHAREDMETHOD_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupSHAREDMETHOD
End If
End Sub
Private Sub mnuSHAREDMETHODAdd_click()
   menuActionSHAREDMETHOD = "ADD"
   menuTimerSHAREDMETHOD.Enabled = True
End Sub
Private Sub mnuSHAREDMETHODEdit_click()
   menuActionSHAREDMETHOD = "EDIT"
   menuTimerSHAREDMETHOD.Enabled = True
End Sub
Private Sub mnuSHAREDMETHODDelete_click()
   menuActionSHAREDMETHOD = "DEL"
   menuTimerSHAREDMETHOD.Enabled = True
End Sub
Private Sub mnuSHAREDMETHODOpen_click()
   menuActionSHAREDMETHOD = "RUN"
   menuTimerSHAREDMETHOD.Enabled = True
End Sub
Private Sub mnuSHAREDMETHODRef_click()
   menuActionSHAREDMETHOD = "REF"
   menuTimerSHAREDMETHOD.Enabled = True
End Sub
  Private Sub mnuSHAREDMETHODCOPY_Click()
    On Error Resume Next
    If gridSHAREDMETHOD.ItemCount = 0 Then Exit Sub
    If gridSHAREDMETHOD.Row > 0 Then
     If gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridSHAREDMETHOD.RowBookmark(gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuSHAREDMETHODCUT_Click()
    On Error Resume Next
    If gridSHAREDMETHOD.ItemCount = 0 Then Exit Sub
    If gridSHAREDMETHOD.Row > 0 Then
     If gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridSHAREDMETHOD.RowBookmark(gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridSHAREDMETHOD.ItemCount = bm.Count
      End If
    End If
  End Sub
 Private Sub mnuSHAREDMETHODPASTE_Click()
  On Error Resume Next
Dim p As Object, ID As String, struct As String, u As Object
  If treeSHAREDMETHOD.SelectedItem Is Nothing Then Exit Sub
    If treeSHAREDMETHOD.SelectedItem.Tag = "Row" Then
      On Error Resume Next
      ID = Mid(treeSHAREDMETHOD.SelectedItem.key, 39, 38)
      struct = treeSHAREDMETHOD.SelectedItem.Parent.Tag
      Set p = item.FindRowObject(struct, ID)
      If item.itemcollection(p, TypeName(p)) Is Nothing Then
        Set u = p.Parent.Add
      Else
        Set u = item.itemcollection(p, TypeName(p)).Add
      End If

      Set p = Nothing
    ElseIf treeSHAREDMETHOD.SelectedItem.Tag <> "object" Then
        If treeSHAREDMETHOD.SelectedItem.Parent.Tag = "Row" Then
        ID = Mid(treeSHAREDMETHOD.SelectedItem.Parent.key, 39, 38)
        struct = treeSHAREDMETHOD.SelectedItem.Parent.Parent.Tag
        Set p = item.FindRowObject(struct, ID)
        Set u = item.itemcollection(p, treeSHAREDMETHOD.SelectedItem.Tag).Add
      End If
      If treeSHAREDMETHOD.SelectedItem.Parent.Tag = "object" Then
        ID = Mid(treeSHAREDMETHOD.SelectedItem.Parent.key, 39, 38)
        Set p = item.Manager.GetInstanceObject(ID)
        Set u = item.itemcollection(p, treeSHAREDMETHOD.SelectedItem.Tag).Add
      End If
    End If
    Set p = Nothing
    If u Is Nothing Then Exit Sub
    If GetFromBuffer(u) Then
      gridSHAREDMETHOD.ItemCount = u.Parent.Count
      gridSHAREDMETHOD.Refresh
      gridSHAREDMETHOD.RefreshGroups
      gridSHAREDMETHOD.RefreshSort
      Dim tid As String
      Dim key As String
      On Error Resume Next
      Dim rnode As MSComctlLib.Node
      Set rnode = treeSHAREDMETHOD.SelectedItem
      If rnode.Tag = "Row" Then
        Set rnode = rnode.Parent
      End If
      While rnode.Children > 0
         treeSHAREDMETHOD.Nodes.Remove rnode.Child.key
      Wend
      tid = CreateGUID2()
      treeSHAREDMETHOD.Nodes.Add(rnode.key, 4, tid, "Expanding...").Tag = "ToDelete"
      treeSHAREDMETHOD_Expand treeSHAREDMETHOD.Nodes.item(rnode.key)
    Else
     u.Parent.Remove u.ID
    End If
End Sub

Private Sub mnuSHAREDMETHODCHANGE_Click()
  On Error Resume Next
  If gridSHAREDMETHOD.ItemCount = 0 Then Exit Sub
  If gridSHAREDMETHOD.Row > 0 Then
   If gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridSHAREDMETHOD.RowBookmark(gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridSHAREDMETHOD.ItemCount = u.Parent.Count
      gridSHAREDMETHOD.RefreshRowIndex gridSHAREDMETHOD.RowIndex(gridSHAREDMETHOD.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuSHAREDMETHODCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuSHAREDMETHODPrn_click()
   menuActionSHAREDMETHOD = "PRN"
   menuTimerSHAREDMETHOD.Enabled = True
End Sub
Private Sub mnuSHAREDMETHODCfg_click()
   menuActionSHAREDMETHOD = "CFG"
   menuTimerSHAREDMETHOD.Enabled = True
End Sub
Private Sub mnuSHAREDMETHODFind_click()
   menuActionSHAREDMETHOD = "FND"
   menuTimerSHAREDMETHOD.Enabled = True
End Sub
Private Sub mnuSHAREDMETHODAcc_click()
   menuActionSHAREDMETHOD = "ACC"
   menuTimerSHAREDMETHOD.Enabled = True
End Sub
Private Sub menuTimerSHAREDMETHOD_timer()
   menuTimerSHAREDMETHOD.Enabled = False
   If menuActionSHAREDMETHOD = "ADD" Then cmdSHAREDMETHODAdd_Click
   If menuActionSHAREDMETHOD = "EDIT" Then cmdSHAREDMETHODEdit_Click
   If menuActionSHAREDMETHOD = "DEL" Then cmdSHAREDMETHODDel_Click
   If menuActionSHAREDMETHOD = "RUN" Then cmdSHAREDMETHODRun_Click
   If menuActionSHAREDMETHOD = "REF" Then cmdSHAREDMETHODRef_Click
   If menuActionSHAREDMETHOD = "PRN" Then cmdSHAREDMETHODPrn_Click
   If menuActionSHAREDMETHOD = "CFG" Then cmdSHAREDMETHODCfg_Click
   If menuActionSHAREDMETHOD = "FND" Then cmdSHAREDMETHODFnd_Click
   If menuActionSHAREDMETHOD = "ACC" Then cmdSHAREDMETHODAcc_Click
   menuActionSHAREDMETHOD = ""
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

item.FillTree treeSHAREDMETHOD, "", "", "SHAREDMETHOD"
  LoadBtnPictures cmdTSHAREDMETHODRef, cmdTSHAREDMETHODRef.Tag
  LoadBtnPictures cmdSHAREDMETHODRef, cmdSHAREDMETHODRef.Tag
  LoadBtnPictures cmdSHAREDMETHODAdd, cmdSHAREDMETHODAdd.Tag
  LoadBtnPictures cmdSHAREDMETHODEdit, cmdSHAREDMETHODEdit.Tag
  LoadBtnPictures cmdSHAREDMETHODDel, cmdSHAREDMETHODDel.Tag
  LoadBtnPictures cmdSHAREDMETHODPrn, cmdSHAREDMETHODPrn.Tag
  LoadBtnPictures cmdSHAREDMETHODFnd, cmdSHAREDMETHODFnd.Tag
  LoadBtnPictures cmdSHAREDMETHODCfg, cmdSHAREDMETHODCfg.Tag
  LoadBtnPictures cmdSHAREDMETHODRun, cmdSHAREDMETHODRun.Tag
  LoadBtnPictures cmdSHAREDMETHODAcc, cmdSHAREDMETHODAcc.Tag
  gridSHAREDMETHOD.Columns.Clear
  gridSHAREDMETHOD.ItemCount = 0
End Sub

'�������� ��� ����������� ����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlSHAREDMETHOD.RestorePosition
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
  pnlSHAREDMETHOD.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndSHAREDMETHOD = Nothing
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





