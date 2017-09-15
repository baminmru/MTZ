VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnVRDGContractSpesial_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerVRDGContractSpesial 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlVRDGContractSpesial 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdVRDGContractSpesialAcc 
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
      Begin VB.CommandButton cmdVRDGContractSpesialFnd 
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
      Begin VB.CommandButton cmdVRDGContractSpesialCfg 
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
      Begin VB.CommandButton cmdVRDGContractSpesialPrn 
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
      Begin VB.CommandButton cmdVRDGContractSpesialRef 
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
      Begin VB.CommandButton cmdVRDGContractSpesialDel 
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
      Begin VB.CommandButton cmdVRDGContractSpesialEdit 
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
      Begin VB.CommandButton cmdVRDGContractSpesialAdd 
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
      Begin GridEX20.GridEX gridVRDGContractSpesial 
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
         Column(1)       =   "vpnVRDGContractSpesial_main.ctx":0000
         Column(2)       =   "vpnVRDGContractSpesial_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnVRDGContractSpesial_main.ctx":016C
         FormatStyle(2)  =   "vpnVRDGContractSpesial_main.ctx":02C8
         FormatStyle(3)  =   "vpnVRDGContractSpesial_main.ctx":0378
         FormatStyle(4)  =   "vpnVRDGContractSpesial_main.ctx":042C
         FormatStyle(5)  =   "vpnVRDGContractSpesial_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnVRDGContractSpesial_main.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdVRDGContractSpesialRun 
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
   Begin VB.Menu mnuPopupVRDGContractSpesial 
      Caption         =   "���� ��� ����������� �������"
      Visible         =   0   'False
      Begin VB.Menu mnuVRDGContractSpesialAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuVRDGContractSpesialEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuVRDGContractSpesialDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuVRDGContractSpesialOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuVRDGContractSpesialRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuVRDGContractSpesialS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVRDGContractSpesialBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuVRDGContractSpesialCOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuVRDGContractSpesialCUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuVRDGContractSpesialPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuVRDGContractSpesialCHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuVRDGContractSpesialCLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuVRDGContractSpesialPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuVRDGContractSpesialCfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuVRDGContractSpesialFind 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuVRDGContractSpesialAcc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnVRDGContractSpesial_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndVRDGContractSpesial As Object
Private menuActionVRDGContractSpesial As String





Private Sub cmdVRDGContractSpesialCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridVRDGContractSpesial, "gridVRDGContractSpesial"
Set jset = Nothing
End Sub

Private Sub cmdVRDGContractSpesialPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridVRDGContractSpesial, "����������� �������"
Set jset = Nothing
End Sub

Private Sub cmdVRDGContractSpesialRef_Click()
  On Error Resume Next
  Item.VRDGContractSpesial.Refresh
  gridVRDGContractSpesial.ItemCount = Item.VRDGContractSpesial.Count
  gridVRDGContractSpesial.Refetch
  gridVRDGContractSpesial.Refresh
End Sub
Private Sub cmdVRDGContractSpesialAcc_Click()
On Error Resume Next
If gridVRDGContractSpesial.ItemCount = 0 Then Exit Sub
If gridVRDGContractSpesial.Row > 0 Then
 If gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRDGContractSpesial.RowBookmark(gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdVRDGContractSpesialEdit_Click()
  On Error Resume Next
If gridVRDGContractSpesial.ItemCount = 0 Then Exit Sub
If gridVRDGContractSpesial.Row > 0 Then
 If gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRDGContractSpesial.RowBookmark(gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmVRDGContractSpesial_main.Item = u
again:     frmVRDGContractSpesial_main.NotFirstTime = False
    frmVRDGContractSpesial_main.OnInit
    frmVRDGContractSpesial_main.Show vbModal
    If frmVRDGContractSpesial_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridVRDGContractSpesial.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdVRDGContractSpesialDel_Click()
  On Error Resume Next
  gridVRDGContractSpesial.Delete
End Sub
Private Sub cmdVRDGContractSpesialAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.VRDGContractSpesial.Add()

      Set frmVRDGContractSpesial_main.Item = u
again:       frmVRDGContractSpesial_main.NotFirstTime = False
      frmVRDGContractSpesial_main.OnInit
      frmVRDGContractSpesial_main.Show vbModal
      If frmVRDGContractSpesial_main.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridVRDGContractSpesial.ItemCount = Item.VRDGContractSpesial.Count
        gridVRDGContractSpesial.Refresh
        gridVRDGContractSpesial.RefreshGroups
        gridVRDGContractSpesial.RefreshSort
        gridVRDGContractSpesial.MoveToBookmark u.ID & "VRDGContractSpesial"
      Else
        Item.VRDGContractSpesial.Delete u.ID
        Item.VRDGContractSpesial.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdVRDGContractSpesialFnd_Click()
  On Error Resume Next
  fndVRDGContractSpesial.ShowForm
End Sub
Private Sub cmdVRDGContractSpesialRun_Click()
  On Error Resume Next
  gridVRDGContractSpesial_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridVRDGContractSpesial_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.VRDGContractSpesial.LoadRow gridVRDGContractSpesial, RowIndex, Bookmark, Values
End Sub
Private Sub gridVRDGContractSpesial_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridVRDGContractSpesial.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("VRDGContractSpesial", Left(Bookmark, 38))
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

Private Sub gridVRDGContractSpesial_DblClick()
  cmdVRDGContractSpesialEdit_Click
End Sub
Private Sub gridVRDGContractSpesial_KeyPress(KeyAscii As Integer)
  If gridVRDGContractSpesial.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndVRDGContractSpesial.FindOnPress KeyAscii
End Sub

Private Sub gridVRDGContractSpesial_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridVRDGContractSpesial.Row And LastRow > 0 Then
  gridVRDGContractSpesial.GetRowData(LastRow).RowStyle = "Default"
  gridVRDGContractSpesial.GetRowData(gridVRDGContractSpesial.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuVRDGContractSpesialPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.VRDGContractSpesial.Add()
    If GetFromBuffer(u) Then
      gridVRDGContractSpesial.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridVRDGContractSpesial_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdVRDGContractSpesialCfg_Click
        End If
    End If
End Sub

Private Sub gridVRDGContractSpesial_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupVRDGContractSpesial
End If
End Sub
Private Sub mnuVRDGContractSpesialAdd_click()
   menuActionVRDGContractSpesial = "ADD"
   menuTimerVRDGContractSpesial.Enabled = True
End Sub
Private Sub mnuVRDGContractSpesialEdit_click()
   menuActionVRDGContractSpesial = "EDIT"
   menuTimerVRDGContractSpesial.Enabled = True
End Sub
Private Sub mnuVRDGContractSpesialDelete_click()
   menuActionVRDGContractSpesial = "DEL"
   menuTimerVRDGContractSpesial.Enabled = True
End Sub
Private Sub mnuVRDGContractSpesialOpen_click()
   menuActionVRDGContractSpesial = "RUN"
   menuTimerVRDGContractSpesial.Enabled = True
End Sub
Private Sub mnuVRDGContractSpesialRef_click()
   menuActionVRDGContractSpesial = "REF"
   menuTimerVRDGContractSpesial.Enabled = True
End Sub
  Private Sub mnuVRDGContractSpesialCOPY_Click()
    On Error Resume Next
    If gridVRDGContractSpesial.ItemCount = 0 Then Exit Sub
    If gridVRDGContractSpesial.Row > 0 Then
     If gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRDGContractSpesial.RowBookmark(gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuVRDGContractSpesialCUT_Click()
    On Error Resume Next
    If gridVRDGContractSpesial.ItemCount = 0 Then Exit Sub
    If gridVRDGContractSpesial.Row > 0 Then
     If gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRDGContractSpesial.RowBookmark(gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridVRDGContractSpesial.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuVRDGContractSpesialCHANGE_Click()
  On Error Resume Next
  If gridVRDGContractSpesial.ItemCount = 0 Then Exit Sub
  If gridVRDGContractSpesial.Row > 0 Then
   If gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRDGContractSpesial.RowBookmark(gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridVRDGContractSpesial.ItemCount = u.Parent.Count
      gridVRDGContractSpesial.RefreshRowIndex gridVRDGContractSpesial.RowIndex(gridVRDGContractSpesial.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuVRDGContractSpesialCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRDGContractSpesialPrn_click()
   menuActionVRDGContractSpesial = "PRN"
   menuTimerVRDGContractSpesial.Enabled = True
End Sub
Private Sub mnuVRDGContractSpesialCfg_click()
   menuActionVRDGContractSpesial = "CFG"
   menuTimerVRDGContractSpesial.Enabled = True
End Sub
Private Sub mnuVRDGContractSpesialFind_click()
   menuActionVRDGContractSpesial = "FND"
   menuTimerVRDGContractSpesial.Enabled = True
End Sub
Private Sub mnuVRDGContractSpesialAcc_click()
   menuActionVRDGContractSpesial = "ACC"
   menuTimerVRDGContractSpesial.Enabled = True
End Sub
Private Sub menuTimerVRDGContractSpesial_timer()
   menuTimerVRDGContractSpesial.Enabled = False
   If menuActionVRDGContractSpesial = "ADD" Then cmdVRDGContractSpesialAdd_Click
   If menuActionVRDGContractSpesial = "EDIT" Then cmdVRDGContractSpesialEdit_Click
   If menuActionVRDGContractSpesial = "DEL" Then cmdVRDGContractSpesialDel_Click
   If menuActionVRDGContractSpesial = "RUN" Then cmdVRDGContractSpesialRun_Click
   If menuActionVRDGContractSpesial = "REF" Then cmdVRDGContractSpesialRef_Click
   If menuActionVRDGContractSpesial = "PRN" Then cmdVRDGContractSpesialPrn_Click
   If menuActionVRDGContractSpesial = "CFG" Then cmdVRDGContractSpesialCfg_Click
   If menuActionVRDGContractSpesial = "FND" Then cmdVRDGContractSpesialFnd_Click
   If menuActionVRDGContractSpesial = "ACC" Then cmdVRDGContractSpesialAcc_Click
   menuActionVRDGContractSpesial = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdVRDGContractSpesialAdd, cmdVRDGContractSpesialAdd.Tag
  LoadBtnPictures cmdVRDGContractSpesialEdit, cmdVRDGContractSpesialEdit.Tag
  LoadBtnPictures cmdVRDGContractSpesialDel, cmdVRDGContractSpesialDel.Tag
  LoadBtnPictures cmdVRDGContractSpesialRef, cmdVRDGContractSpesialRef.Tag
  LoadBtnPictures cmdVRDGContractSpesialPrn, cmdVRDGContractSpesialPrn.Tag
  LoadBtnPictures cmdVRDGContractSpesialFnd, cmdVRDGContractSpesialFnd.Tag
  LoadBtnPictures cmdVRDGContractSpesialRun, cmdVRDGContractSpesialRun.Tag
  LoadBtnPictures cmdVRDGContractSpesialAcc, cmdVRDGContractSpesialAcc.Tag
  LoadBtnPictures cmdVRDGContractSpesialCfg, cmdVRDGContractSpesialCfg.Tag
  Item.VRDGContractSpesial.PrepareGrid gridVRDGContractSpesial
  LoadGridLayout gridVRDGContractSpesial
  Set fndVRDGContractSpesial = Nothing
  On Error Resume Next
  Set fndVRDGContractSpesial = CreateObject("MTZ_JSetup.GridFinder")
  fndVRDGContractSpesial.Init gridVRDGContractSpesial
End Sub
Private Sub OnTabClick()

      gridVRDGContractSpesial.Top = 40 * Screen.TwipsPerPixelX
      gridVRDGContractSpesial.Left = 5 * Screen.TwipsPerPixelX
      gridVRDGContractSpesial.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRDGContractSpesial.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridVRDGContractSpesial.Top = 40 * Screen.TwipsPerPixelX
      gridVRDGContractSpesial.Left = 5 * Screen.TwipsPerPixelX
      gridVRDGContractSpesial.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRDGContractSpesial.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlVRDGContractSpesial.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndVRDGContractSpesial = Nothing
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





