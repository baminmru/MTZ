VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKNAL_ROWS_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKNAL_ROWS 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKNAL_ROWS 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKNAL_ROWSAcc 
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
      Begin VB.CommandButton cmdPEKNAL_ROWSFnd 
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
      Begin VB.CommandButton cmdPEKNAL_ROWSCfg 
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
      Begin VB.CommandButton cmdPEKNAL_ROWSPrn 
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
      Begin VB.CommandButton cmdPEKNAL_ROWSRef 
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
      Begin VB.CommandButton cmdPEKNAL_ROWSDel 
         Enabled         =   0   'False
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
      Begin VB.CommandButton cmdPEKNAL_ROWSEdit 
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
      Begin VB.CommandButton cmdPEKNAL_ROWSAdd 
         Enabled         =   0   'False
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
      Begin GridEX20.GridEX gridPEKNAL_ROWS 
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
         Column(1)       =   "vpnPEKNAL_ROWS_main.ctx":0000
         Column(2)       =   "vpnPEKNAL_ROWS_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKNAL_ROWS_main.ctx":016C
         FormatStyle(2)  =   "vpnPEKNAL_ROWS_main.ctx":02C8
         FormatStyle(3)  =   "vpnPEKNAL_ROWS_main.ctx":0378
         FormatStyle(4)  =   "vpnPEKNAL_ROWS_main.ctx":042C
         FormatStyle(5)  =   "vpnPEKNAL_ROWS_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKNAL_ROWS_main.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKNAL_ROWSRun 
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
   Begin VB.Menu mnuPopupPEKNAL_ROWS 
      Caption         =   "���� ��� ��������� �� ��������"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKNAL_ROWSAdd 
         Caption         =   "�������"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKNAL_ROWSEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuPEKNAL_ROWSDelete 
         Caption         =   "�������"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKNAL_ROWSOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuPEKNAL_ROWSRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuPEKNAL_ROWSS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKNAL_ROWSBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuPEKNAL_ROWSCOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuPEKNAL_ROWSCUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuPEKNAL_ROWSPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuPEKNAL_ROWSCHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuPEKNAL_ROWSCLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuPEKNAL_ROWSPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuPEKNAL_ROWSCfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuPEKNAL_ROWSFind 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuPEKNAL_ROWSAcc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnPEKNAL_ROWS_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKNAL_ROWS As Object
Private menuActionPEKNAL_ROWS As String





Private Sub cmdPEKNAL_ROWSCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKNAL_ROWS, "gridPEKNAL_ROWS"
Set jset = Nothing
End Sub

Private Sub cmdPEKNAL_ROWSPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKNAL_ROWS, "��������� �� ��������"
Set jset = Nothing
End Sub

Private Sub cmdPEKNAL_ROWSRef_Click()
  On Error Resume Next
  Item.PEKNAL_ROWS.Refresh
  gridPEKNAL_ROWS.ItemCount = Item.PEKNAL_ROWS.Count
  gridPEKNAL_ROWS.Refetch
  gridPEKNAL_ROWS.Refresh
End Sub
Private Sub cmdPEKNAL_ROWSAcc_Click()
On Error Resume Next
If gridPEKNAL_ROWS.ItemCount = 0 Then Exit Sub
If gridPEKNAL_ROWS.Row > 0 Then
 If gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKNAL_ROWS.RowBookmark(gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKNAL_ROWSEdit_Click()
  On Error Resume Next
If gridPEKNAL_ROWS.ItemCount = 0 Then Exit Sub
If gridPEKNAL_ROWS.Row > 0 Then
 If gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKNAL_ROWS.RowBookmark(gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKNAL_ROWS_main.Item = u
again:     frmPEKNAL_ROWS_main.NotFirstTime = False
    frmPEKNAL_ROWS_main.OnInit
    frmPEKNAL_ROWS_main.Show vbModal
    If frmPEKNAL_ROWS_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridPEKNAL_ROWS.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKNAL_ROWSDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKNAL_ROWSAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdPEKNAL_ROWSFnd_Click()
  On Error Resume Next
  fndPEKNAL_ROWS.ShowForm
End Sub
Private Sub cmdPEKNAL_ROWSRun_Click()
  On Error Resume Next
  gridPEKNAL_ROWS_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKNAL_ROWS_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKNAL_ROWS.LoadRow gridPEKNAL_ROWS, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKNAL_ROWS_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEKNAL_ROWS_DblClick()
  cmdPEKNAL_ROWSEdit_Click
End Sub
Private Sub gridPEKNAL_ROWS_KeyPress(KeyAscii As Integer)
  If gridPEKNAL_ROWS.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKNAL_ROWS.FindOnPress KeyAscii
End Sub

Private Sub gridPEKNAL_ROWS_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKNAL_ROWS.Row And LastRow > 0 Then
  gridPEKNAL_ROWS.GetRowData(LastRow).RowStyle = "Default"
  gridPEKNAL_ROWS.GetRowData(gridPEKNAL_ROWS.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKNAL_ROWSPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKNAL_ROWS.Add()
    If GetFromBuffer(u) Then
      gridPEKNAL_ROWS.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKNAL_ROWS_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKNAL_ROWSCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKNAL_ROWS_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKNAL_ROWS
End If
End Sub
Private Sub mnuPEKNAL_ROWSAdd_click()
   menuActionPEKNAL_ROWS = "ADD"
   menuTimerPEKNAL_ROWS.Enabled = True
End Sub
Private Sub mnuPEKNAL_ROWSEdit_click()
   menuActionPEKNAL_ROWS = "EDIT"
   menuTimerPEKNAL_ROWS.Enabled = True
End Sub
Private Sub mnuPEKNAL_ROWSDelete_click()
   menuActionPEKNAL_ROWS = "DEL"
   menuTimerPEKNAL_ROWS.Enabled = True
End Sub
Private Sub mnuPEKNAL_ROWSOpen_click()
   menuActionPEKNAL_ROWS = "RUN"
   menuTimerPEKNAL_ROWS.Enabled = True
End Sub
Private Sub mnuPEKNAL_ROWSRef_click()
   menuActionPEKNAL_ROWS = "REF"
   menuTimerPEKNAL_ROWS.Enabled = True
End Sub
  Private Sub mnuPEKNAL_ROWSCOPY_Click()
    On Error Resume Next
    If gridPEKNAL_ROWS.ItemCount = 0 Then Exit Sub
    If gridPEKNAL_ROWS.Row > 0 Then
     If gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKNAL_ROWS.RowBookmark(gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKNAL_ROWSCUT_Click()
    On Error Resume Next
    If gridPEKNAL_ROWS.ItemCount = 0 Then Exit Sub
    If gridPEKNAL_ROWS.Row > 0 Then
     If gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKNAL_ROWS.RowBookmark(gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKNAL_ROWS.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKNAL_ROWSCHANGE_Click()
  On Error Resume Next
  If gridPEKNAL_ROWS.ItemCount = 0 Then Exit Sub
  If gridPEKNAL_ROWS.Row > 0 Then
   If gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKNAL_ROWS.RowBookmark(gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKNAL_ROWS.ItemCount = u.Parent.Count
      gridPEKNAL_ROWS.RefreshRowIndex gridPEKNAL_ROWS.RowIndex(gridPEKNAL_ROWS.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKNAL_ROWSCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKNAL_ROWSPrn_click()
   menuActionPEKNAL_ROWS = "PRN"
   menuTimerPEKNAL_ROWS.Enabled = True
End Sub
Private Sub mnuPEKNAL_ROWSCfg_click()
   menuActionPEKNAL_ROWS = "CFG"
   menuTimerPEKNAL_ROWS.Enabled = True
End Sub
Private Sub mnuPEKNAL_ROWSFind_click()
   menuActionPEKNAL_ROWS = "FND"
   menuTimerPEKNAL_ROWS.Enabled = True
End Sub
Private Sub mnuPEKNAL_ROWSAcc_click()
   menuActionPEKNAL_ROWS = "ACC"
   menuTimerPEKNAL_ROWS.Enabled = True
End Sub
Private Sub menuTimerPEKNAL_ROWS_timer()
   menuTimerPEKNAL_ROWS.Enabled = False
   If menuActionPEKNAL_ROWS = "ADD" Then cmdPEKNAL_ROWSAdd_Click
   If menuActionPEKNAL_ROWS = "EDIT" Then cmdPEKNAL_ROWSEdit_Click
   If menuActionPEKNAL_ROWS = "DEL" Then cmdPEKNAL_ROWSDel_Click
   If menuActionPEKNAL_ROWS = "RUN" Then cmdPEKNAL_ROWSRun_Click
   If menuActionPEKNAL_ROWS = "REF" Then cmdPEKNAL_ROWSRef_Click
   If menuActionPEKNAL_ROWS = "PRN" Then cmdPEKNAL_ROWSPrn_Click
   If menuActionPEKNAL_ROWS = "CFG" Then cmdPEKNAL_ROWSCfg_Click
   If menuActionPEKNAL_ROWS = "FND" Then cmdPEKNAL_ROWSFnd_Click
   If menuActionPEKNAL_ROWS = "ACC" Then cmdPEKNAL_ROWSAcc_Click
   menuActionPEKNAL_ROWS = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKNAL_ROWSAdd, cmdPEKNAL_ROWSAdd.Tag
  LoadBtnPictures cmdPEKNAL_ROWSEdit, cmdPEKNAL_ROWSEdit.Tag
  LoadBtnPictures cmdPEKNAL_ROWSDel, cmdPEKNAL_ROWSDel.Tag
  LoadBtnPictures cmdPEKNAL_ROWSRef, cmdPEKNAL_ROWSRef.Tag
  LoadBtnPictures cmdPEKNAL_ROWSPrn, cmdPEKNAL_ROWSPrn.Tag
  LoadBtnPictures cmdPEKNAL_ROWSFnd, cmdPEKNAL_ROWSFnd.Tag
  LoadBtnPictures cmdPEKNAL_ROWSRun, cmdPEKNAL_ROWSRun.Tag
  LoadBtnPictures cmdPEKNAL_ROWSAcc, cmdPEKNAL_ROWSAcc.Tag
  LoadBtnPictures cmdPEKNAL_ROWSCfg, cmdPEKNAL_ROWSCfg.Tag
  Item.PEKNAL_ROWS.PrepareGrid gridPEKNAL_ROWS
  LoadGridLayout gridPEKNAL_ROWS
  Set fndPEKNAL_ROWS = Nothing
  On Error Resume Next
  Set fndPEKNAL_ROWS = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKNAL_ROWS.Init gridPEKNAL_ROWS
End Sub
Private Sub OnTabClick()

      gridPEKNAL_ROWS.Top = 40 * Screen.TwipsPerPixelX
      gridPEKNAL_ROWS.Left = 5 * Screen.TwipsPerPixelX
      gridPEKNAL_ROWS.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKNAL_ROWS.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKNAL_ROWS.Top = 40 * Screen.TwipsPerPixelX
      gridPEKNAL_ROWS.Left = 5 * Screen.TwipsPerPixelX
      gridPEKNAL_ROWS.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKNAL_ROWS.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKNAL_ROWS.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKNAL_ROWS = Nothing
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





