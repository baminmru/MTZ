VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKTRF_DECR_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKTRF_DECR 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKTRF_DECR 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKTRF_DECRAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "security.ico"
         ToolTipText     =   "����� ������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKTRF_DECRFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   8
         Tag             =   "find.ico"
         ToolTipText     =   "�����"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKTRF_DECRCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "config.ico"
         ToolTipText     =   "��������� �������� ����"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKTRF_DECRPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKTRF_DECRRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "Refresh.ico"
         ToolTipText     =   "��������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKTRF_DECRDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "DELETE.ico"
         ToolTipText     =   "�������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKTRF_DECREdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "PROP.ico"
         ToolTipText     =   "��������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKTRF_DECRAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "NEW.ico"
         ToolTipText     =   "��������"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridPEKTRF_DECR 
         Height          =   480
         Left            =   3900
         TabIndex        =   1
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
         Column(1)       =   "vpnPEKTRF_DECR_main.ctx":0000
         Column(2)       =   "vpnPEKTRF_DECR_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKTRF_DECR_main.ctx":016C
         FormatStyle(2)  =   "vpnPEKTRF_DECR_main.ctx":02C8
         FormatStyle(3)  =   "vpnPEKTRF_DECR_main.ctx":0378
         FormatStyle(4)  =   "vpnPEKTRF_DECR_main.ctx":042C
         FormatStyle(5)  =   "vpnPEKTRF_DECR_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKTRF_DECR_main.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKTRF_DECRRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   9
         Tag             =   "run.ico"
         ToolTipText     =   "�������"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Menu mnuPopupPEKTRF_DECR 
      Caption         =   "���� ��� ������"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKTRF_DECRAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuPEKTRF_DECREdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuPEKTRF_DECRDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuPEKTRF_DECROpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuPEKTRF_DECRRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuPEKTRF_DECRS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKTRF_DECRBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuPEKTRF_DECRCOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuPEKTRF_DECRCUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuPEKTRF_DECRPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuPEKTRF_DECRCHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuPEKTRF_DECRCLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuPEKTRF_DECRPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuPEKTRF_DECRCfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuPEKTRF_DECRFind 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuPEKTRF_DECRAcc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnPEKTRF_DECR_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKTRF_DECR As Object
Private menuActionPEKTRF_DECR As String





Private Sub cmdPEKTRF_DECRCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKTRF_DECR, "gridPEKTRF_DECR"
Set jset = Nothing
End Sub

Private Sub cmdPEKTRF_DECRPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKTRF_DECR, "������"
Set jset = Nothing
End Sub

Private Sub cmdPEKTRF_DECRRef_Click()
  On Error Resume Next
  Item.PEKTRF_DECR.Refresh
  gridPEKTRF_DECR.ItemCount = Item.PEKTRF_DECR.Count
  gridPEKTRF_DECR.Refetch
  gridPEKTRF_DECR.Refresh
End Sub
Private Sub cmdPEKTRF_DECRAcc_Click()
On Error Resume Next
If gridPEKTRF_DECR.ItemCount = 0 Then Exit Sub
If gridPEKTRF_DECR.Row > 0 Then
 If gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_DECR.RowBookmark(gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKTRF_DECREdit_Click()
  On Error Resume Next
If gridPEKTRF_DECR.ItemCount = 0 Then Exit Sub
If gridPEKTRF_DECR.Row > 0 Then
 If gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_DECR.RowBookmark(gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKTRF_DECR_main.Item = u
again:     frmPEKTRF_DECR_main.NotFirstTime = False
    frmPEKTRF_DECR_main.OnInit
    frmPEKTRF_DECR_main.Show vbModal
    If frmPEKTRF_DECR_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridPEKTRF_DECR.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKTRF_DECRDel_Click()
  On Error Resume Next
  gridPEKTRF_DECR.Delete
End Sub
Private Sub cmdPEKTRF_DECRAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.PEKTRF_DECR.Add()

      Set frmPEKTRF_DECR_main.Item = u
again:       frmPEKTRF_DECR_main.NotFirstTime = False
      frmPEKTRF_DECR_main.OnInit
      frmPEKTRF_DECR_main.Show vbModal
      If frmPEKTRF_DECR_main.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridPEKTRF_DECR.ItemCount = Item.PEKTRF_DECR.Count
        gridPEKTRF_DECR.Refresh
        gridPEKTRF_DECR.RefreshGroups
        gridPEKTRF_DECR.RefreshSort
        gridPEKTRF_DECR.MoveToBookmark u.ID & "PEKTRF_DECR"
      Else
        Item.PEKTRF_DECR.Delete u.ID
        Item.PEKTRF_DECR.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdPEKTRF_DECRFnd_Click()
  On Error Resume Next
  fndPEKTRF_DECR.ShowForm
End Sub
Private Sub cmdPEKTRF_DECRRun_Click()
  On Error Resume Next
  gridPEKTRF_DECR_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKTRF_DECR_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKTRF_DECR.LoadRow gridPEKTRF_DECR, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKTRF_DECR_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKTRF_DECR.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("PEKTRF_DECR", Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("������� �������" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "��������") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub

Private Sub gridPEKTRF_DECR_DblClick()
  cmdPEKTRF_DECREdit_Click
End Sub
Private Sub gridPEKTRF_DECR_KeyPress(KeyAscii As Integer)
  If gridPEKTRF_DECR.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKTRF_DECR.FindOnPress KeyAscii
End Sub

Private Sub gridPEKTRF_DECR_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKTRF_DECR.Row And LastRow > 0 Then
  gridPEKTRF_DECR.GetRowData(LastRow).RowStyle = "Default"
  gridPEKTRF_DECR.GetRowData(gridPEKTRF_DECR.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKTRF_DECRPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKTRF_DECR.Add()
    If GetFromBuffer(u) Then
      gridPEKTRF_DECR.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKTRF_DECR_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKTRF_DECRCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKTRF_DECR_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKTRF_DECR
End If
End Sub
Private Sub mnuPEKTRF_DECRAdd_click()
   menuActionPEKTRF_DECR = "ADD"
   menuTimerPEKTRF_DECR.Enabled = True
End Sub
Private Sub mnuPEKTRF_DECREdit_click()
   menuActionPEKTRF_DECR = "EDIT"
   menuTimerPEKTRF_DECR.Enabled = True
End Sub
Private Sub mnuPEKTRF_DECRDelete_click()
   menuActionPEKTRF_DECR = "DEL"
   menuTimerPEKTRF_DECR.Enabled = True
End Sub
Private Sub mnuPEKTRF_DECROpen_click()
   menuActionPEKTRF_DECR = "RUN"
   menuTimerPEKTRF_DECR.Enabled = True
End Sub
Private Sub mnuPEKTRF_DECRRef_click()
   menuActionPEKTRF_DECR = "REF"
   menuTimerPEKTRF_DECR.Enabled = True
End Sub
  Private Sub mnuPEKTRF_DECRCOPY_Click()
    On Error Resume Next
    If gridPEKTRF_DECR.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_DECR.Row > 0 Then
     If gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKTRF_DECR.RowBookmark(gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKTRF_DECRCUT_Click()
    On Error Resume Next
    If gridPEKTRF_DECR.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_DECR.Row > 0 Then
     If gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKTRF_DECR.RowBookmark(gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKTRF_DECR.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKTRF_DECRCHANGE_Click()
  On Error Resume Next
  If gridPEKTRF_DECR.ItemCount = 0 Then Exit Sub
  If gridPEKTRF_DECR.Row > 0 Then
   If gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_DECR.RowBookmark(gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKTRF_DECR.ItemCount = u.Parent.Count
      gridPEKTRF_DECR.RefreshRowIndex gridPEKTRF_DECR.RowIndex(gridPEKTRF_DECR.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKTRF_DECRCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKTRF_DECRPrn_click()
   menuActionPEKTRF_DECR = "PRN"
   menuTimerPEKTRF_DECR.Enabled = True
End Sub
Private Sub mnuPEKTRF_DECRCfg_click()
   menuActionPEKTRF_DECR = "CFG"
   menuTimerPEKTRF_DECR.Enabled = True
End Sub
Private Sub mnuPEKTRF_DECRFind_click()
   menuActionPEKTRF_DECR = "FND"
   menuTimerPEKTRF_DECR.Enabled = True
End Sub
Private Sub mnuPEKTRF_DECRAcc_click()
   menuActionPEKTRF_DECR = "ACC"
   menuTimerPEKTRF_DECR.Enabled = True
End Sub
Private Sub menuTimerPEKTRF_DECR_timer()
   menuTimerPEKTRF_DECR.Enabled = False
   If menuActionPEKTRF_DECR = "ADD" Then cmdPEKTRF_DECRAdd_Click
   If menuActionPEKTRF_DECR = "EDIT" Then cmdPEKTRF_DECREdit_Click
   If menuActionPEKTRF_DECR = "DEL" Then cmdPEKTRF_DECRDel_Click
   If menuActionPEKTRF_DECR = "RUN" Then cmdPEKTRF_DECRRun_Click
   If menuActionPEKTRF_DECR = "REF" Then cmdPEKTRF_DECRRef_Click
   If menuActionPEKTRF_DECR = "PRN" Then cmdPEKTRF_DECRPrn_Click
   If menuActionPEKTRF_DECR = "CFG" Then cmdPEKTRF_DECRCfg_Click
   If menuActionPEKTRF_DECR = "FND" Then cmdPEKTRF_DECRFnd_Click
   If menuActionPEKTRF_DECR = "ACC" Then cmdPEKTRF_DECRAcc_Click
   menuActionPEKTRF_DECR = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKTRF_DECRAdd, cmdPEKTRF_DECRAdd.Tag
  LoadBtnPictures cmdPEKTRF_DECREdit, cmdPEKTRF_DECREdit.Tag
  LoadBtnPictures cmdPEKTRF_DECRDel, cmdPEKTRF_DECRDel.Tag
  LoadBtnPictures cmdPEKTRF_DECRRef, cmdPEKTRF_DECRRef.Tag
  LoadBtnPictures cmdPEKTRF_DECRPrn, cmdPEKTRF_DECRPrn.Tag
  LoadBtnPictures cmdPEKTRF_DECRFnd, cmdPEKTRF_DECRFnd.Tag
  LoadBtnPictures cmdPEKTRF_DECRRun, cmdPEKTRF_DECRRun.Tag
  LoadBtnPictures cmdPEKTRF_DECRAcc, cmdPEKTRF_DECRAcc.Tag
  LoadBtnPictures cmdPEKTRF_DECRCfg, cmdPEKTRF_DECRCfg.Tag
  Item.PEKTRF_DECR.PrepareGrid gridPEKTRF_DECR
  LoadGridLayout gridPEKTRF_DECR
  Set fndPEKTRF_DECR = Nothing
  On Error Resume Next
  Set fndPEKTRF_DECR = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKTRF_DECR.Init gridPEKTRF_DECR
End Sub
Private Sub OnTabClick()

      gridPEKTRF_DECR.Top = 40 * Screen.TwipsPerPixelX
      gridPEKTRF_DECR.Left = 5 * Screen.TwipsPerPixelX
      gridPEKTRF_DECR.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKTRF_DECR.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKTRF_DECR.Top = 40 * Screen.TwipsPerPixelX
      gridPEKTRF_DECR.Left = 5 * Screen.TwipsPerPixelX
      gridPEKTRF_DECR.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKTRF_DECR.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKTRF_DECR.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKTRF_DECR = Nothing
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



'�������� ����� ������� ���������� ���� �� ������� ������
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
  MsgBox err.Description, vbOKOnly + vbCritical, "��������� ����� ������"
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
  MsgBox err.Description, vbOKOnly + vbCritical, "��������� ����� ������"
End Sub



'�������� ������ �� ������ ��������
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
'  ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT2", "����� " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� ������"
End Sub



'������� ����� ������ �� �������
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2P", "������ " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� �������"
End Sub



'������� ����� ������ �� �������
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2O", "������ " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� �������"
End Sub



'�������� �������� �� ��������������
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



'�������� �������� �������
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = Name
' ����� �� ���� �����, ���� ���������� ������ ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'������� ������ �� �������
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "������ " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� ������"
End Sub





