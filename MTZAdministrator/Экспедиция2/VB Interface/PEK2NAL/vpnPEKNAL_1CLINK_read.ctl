VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnPEKNAL_1CLINK_read 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKNAL_1CLINK 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKNAL_1CLINK 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKNAL_1CLINKFnd 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "find.ico"
         ToolTipText     =   "�����"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKNAL_1CLINKPrn 
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
      Begin VB.CommandButton cmdPEKNAL_1CLINKRef 
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
      Begin VB.CommandButton cmdPEKNAL_1CLINKDel 
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
      Begin VB.CommandButton cmdPEKNAL_1CLINKEdit 
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
      Begin VB.CommandButton cmdPEKNAL_1CLINKAdd 
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
      Begin GridEX20.GridEX gridPEKNAL_1CLINK 
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
         Column(1)       =   "vpnPEKNAL_1CLINK_read.ctx":0000
         Column(2)       =   "vpnPEKNAL_1CLINK_read.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKNAL_1CLINK_read.ctx":016C
         FormatStyle(2)  =   "vpnPEKNAL_1CLINK_read.ctx":02C8
         FormatStyle(3)  =   "vpnPEKNAL_1CLINK_read.ctx":0378
         FormatStyle(4)  =   "vpnPEKNAL_1CLINK_read.ctx":042C
         FormatStyle(5)  =   "vpnPEKNAL_1CLINK_read.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKNAL_1CLINK_read.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupPEKNAL_1CLINK 
      Caption         =   "���� ��� ����� � 1�"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKNAL_1CLINKAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuPEKNAL_1CLINKEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuPEKNAL_1CLINKDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuPEKNAL_1CLINKOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuPEKNAL_1CLINKRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuPEKNAL_1CLINKPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuPEKNAL_1CLINKCfg 
         Caption         =   "���������"
      End
   End
End
Attribute VB_Name = "vpnPEKNAL_1CLINK_read"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKNAL_1CLINK As Object
Private menuActionPEKNAL_1CLINK As String





Private Sub cmdPEKNAL_1CLINKCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKNAL_1CLINK, "gridPEKNAL_1CLINK"
Set jset = Nothing
End Sub

Private Sub cmdPEKNAL_1CLINKPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKNAL_1CLINK, "����� � 1�"
Set jset = Nothing
End Sub

Private Sub cmdPEKNAL_1CLINKRef_Click()
  On Error Resume Next
  item.PEKNAL_1CLINK.Refresh
  gridPEKNAL_1CLINK.ItemCount = item.PEKNAL_1CLINK.Count
  gridPEKNAL_1CLINK.Refetch
  gridPEKNAL_1CLINK.Refresh
End Sub
Private Sub cmdPEKNAL_1CLINKAcc_Click()
On Error Resume Next
If gridPEKNAL_1CLINK.ItemCount = 0 Then Exit Sub
If gridPEKNAL_1CLINK.Row > 0 Then
 If gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKNAL_1CLINK.RowBookmark(gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKNAL_1CLINKEdit_Click()
  On Error Resume Next
If gridPEKNAL_1CLINK.ItemCount = 0 Then Exit Sub
If gridPEKNAL_1CLINK.Row > 0 Then
 If gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKNAL_1CLINK.RowBookmark(gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKNAL_1CLINK_read.item = u
again:     frmPEKNAL_1CLINK_read.NotFirstTime = False
    frmPEKNAL_1CLINK_read.OnInit
    frmPEKNAL_1CLINK_read.Show vbModal
    If frmPEKNAL_1CLINK_read.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridPEKNAL_1CLINK.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKNAL_1CLINKDel_Click()
  On Error Resume Next
  gridPEKNAL_1CLINK.Delete
End Sub
Private Sub cmdPEKNAL_1CLINKAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.PEKNAL_1CLINK.Add()

      Set frmPEKNAL_1CLINK_read.item = u
again:       frmPEKNAL_1CLINK_read.NotFirstTime = False
      frmPEKNAL_1CLINK_read.OnInit
      frmPEKNAL_1CLINK_read.Show vbModal
      If frmPEKNAL_1CLINK_read.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridPEKNAL_1CLINK.ItemCount = item.PEKNAL_1CLINK.Count
        gridPEKNAL_1CLINK.Refresh
        gridPEKNAL_1CLINK.RefreshGroups
        gridPEKNAL_1CLINK.RefreshSort
        gridPEKNAL_1CLINK.MoveToBookmark u.ID & "PEKNAL_1CLINK"
      Else
        item.PEKNAL_1CLINK.Delete u.ID
        item.PEKNAL_1CLINK.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdPEKNAL_1CLINKFnd_Click()
  On Error Resume Next
  fndPEKNAL_1CLINK.ShowForm
End Sub
Private Sub cmdPEKNAL_1CLINKRun_Click()
  On Error Resume Next
  gridPEKNAL_1CLINK_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKNAL_1CLINK_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.PEKNAL_1CLINK.LoadRow gridPEKNAL_1CLINK, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKNAL_1CLINK_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKNAL_1CLINK.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject("PEKNAL_1CLINK", Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("������� �������" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "��������") = vbYes Then
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

Private Sub gridPEKNAL_1CLINK_DblClick()
  cmdPEKNAL_1CLINKEdit_Click
End Sub
Private Sub gridPEKNAL_1CLINK_KeyPress(KeyAscii As Integer)
  If gridPEKNAL_1CLINK.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKNAL_1CLINK.FindOnPress KeyAscii
End Sub

Private Sub gridPEKNAL_1CLINK_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKNAL_1CLINK.Row And LastRow > 0 Then
  gridPEKNAL_1CLINK.GetRowData(LastRow).RowStyle = "Default"
  gridPEKNAL_1CLINK.GetRowData(gridPEKNAL_1CLINK.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKNAL_1CLINKPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.PEKNAL_1CLINK.Add()
    If GetFromBuffer(u) Then
      gridPEKNAL_1CLINK.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKNAL_1CLINK_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKNAL_1CLINKCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKNAL_1CLINK_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKNAL_1CLINK
End If
End Sub
Private Sub mnuPEKNAL_1CLINKAdd_click()
   menuActionPEKNAL_1CLINK = "ADD"
   menuTimerPEKNAL_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKNAL_1CLINKEdit_click()
   menuActionPEKNAL_1CLINK = "EDIT"
   menuTimerPEKNAL_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKNAL_1CLINKDelete_click()
   menuActionPEKNAL_1CLINK = "DEL"
   menuTimerPEKNAL_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKNAL_1CLINKOpen_click()
   menuActionPEKNAL_1CLINK = "RUN"
   menuTimerPEKNAL_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKNAL_1CLINKRef_click()
   menuActionPEKNAL_1CLINK = "REF"
   menuTimerPEKNAL_1CLINK.Enabled = True
End Sub
  Private Sub mnuPEKNAL_1CLINKCOPY_Click()
    On Error Resume Next
    If gridPEKNAL_1CLINK.ItemCount = 0 Then Exit Sub
    If gridPEKNAL_1CLINK.Row > 0 Then
     If gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKNAL_1CLINK.RowBookmark(gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKNAL_1CLINKCUT_Click()
    On Error Resume Next
    If gridPEKNAL_1CLINK.ItemCount = 0 Then Exit Sub
    If gridPEKNAL_1CLINK.Row > 0 Then
     If gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKNAL_1CLINK.RowBookmark(gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKNAL_1CLINK.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKNAL_1CLINKCHANGE_Click()
  On Error Resume Next
  If gridPEKNAL_1CLINK.ItemCount = 0 Then Exit Sub
  If gridPEKNAL_1CLINK.Row > 0 Then
   If gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKNAL_1CLINK.RowBookmark(gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKNAL_1CLINK.ItemCount = u.Parent.Count
      gridPEKNAL_1CLINK.RefreshRowIndex gridPEKNAL_1CLINK.RowIndex(gridPEKNAL_1CLINK.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKNAL_1CLINKCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKNAL_1CLINKPrn_click()
   menuActionPEKNAL_1CLINK = "PRN"
   menuTimerPEKNAL_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKNAL_1CLINKCfg_click()
   menuActionPEKNAL_1CLINK = "CFG"
   menuTimerPEKNAL_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKNAL_1CLINKFind_click()
   menuActionPEKNAL_1CLINK = "FND"
   menuTimerPEKNAL_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKNAL_1CLINKAcc_click()
   menuActionPEKNAL_1CLINK = "ACC"
   menuTimerPEKNAL_1CLINK.Enabled = True
End Sub
Private Sub menuTimerPEKNAL_1CLINK_timer()
   menuTimerPEKNAL_1CLINK.Enabled = False
   If menuActionPEKNAL_1CLINK = "ADD" Then cmdPEKNAL_1CLINKAdd_Click
   If menuActionPEKNAL_1CLINK = "EDIT" Then cmdPEKNAL_1CLINKEdit_Click
   If menuActionPEKNAL_1CLINK = "DEL" Then cmdPEKNAL_1CLINKDel_Click
   If menuActionPEKNAL_1CLINK = "RUN" Then cmdPEKNAL_1CLINKRun_Click
   If menuActionPEKNAL_1CLINK = "REF" Then cmdPEKNAL_1CLINKRef_Click
   If menuActionPEKNAL_1CLINK = "PRN" Then cmdPEKNAL_1CLINKPrn_Click
   If menuActionPEKNAL_1CLINK = "CFG" Then cmdPEKNAL_1CLINKCfg_Click
   If menuActionPEKNAL_1CLINK = "FND" Then cmdPEKNAL_1CLINKFnd_Click
   If menuActionPEKNAL_1CLINK = "ACC" Then cmdPEKNAL_1CLINKAcc_Click
   menuActionPEKNAL_1CLINK = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKNAL_1CLINKAdd, cmdPEKNAL_1CLINKAdd.Tag
  LoadBtnPictures cmdPEKNAL_1CLINKEdit, cmdPEKNAL_1CLINKEdit.Tag
  LoadBtnPictures cmdPEKNAL_1CLINKDel, cmdPEKNAL_1CLINKDel.Tag
  LoadBtnPictures cmdPEKNAL_1CLINKRef, cmdPEKNAL_1CLINKRef.Tag
  LoadBtnPictures cmdPEKNAL_1CLINKPrn, cmdPEKNAL_1CLINKPrn.Tag
  LoadBtnPictures cmdPEKNAL_1CLINKFnd, cmdPEKNAL_1CLINKFnd.Tag
  item.PEKNAL_1CLINK.PrepareGrid gridPEKNAL_1CLINK
  LoadGridLayout gridPEKNAL_1CLINK
  Set fndPEKNAL_1CLINK = Nothing
  On Error Resume Next
  Set fndPEKNAL_1CLINK = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKNAL_1CLINK.Init gridPEKNAL_1CLINK
End Sub
Private Sub OnTabClick()

      gridPEKNAL_1CLINK.Top = 40 * Screen.TwipsPerPixelX
      gridPEKNAL_1CLINK.Left = 5 * Screen.TwipsPerPixelX
      gridPEKNAL_1CLINK.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKNAL_1CLINK.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKNAL_1CLINK.Top = 40 * Screen.TwipsPerPixelX
      gridPEKNAL_1CLINK.Left = 5 * Screen.TwipsPerPixelX
      gridPEKNAL_1CLINK.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKNAL_1CLINK.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set item = aItem
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
  pnlPEKNAL_1CLINK.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndPEKNAL_1CLINK = Nothing
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

  RowItem.Person.Secure item.SecureStyleID
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
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT2", "����� " & Date)
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "������ " & Date)
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





