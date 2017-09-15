VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnWFFD_Doer_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFFD_Doer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFFD_Doer 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFFD_DoerFnd 
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
      Begin VB.CommandButton cmdWFFD_DoerPrn 
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
      Begin VB.CommandButton cmdWFFD_DoerRef 
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
      Begin VB.CommandButton cmdWFFD_DoerDel 
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
      Begin VB.CommandButton cmdWFFD_DoerEdit 
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
      Begin VB.CommandButton cmdWFFD_DoerAdd 
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
      Begin GridEX20.GridEX gridWFFD_Doer 
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
         Column(1)       =   "vpnWFFD_Doer_.ctx":0000
         Column(2)       =   "vpnWFFD_Doer_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFFD_Doer_.ctx":016C
         FormatStyle(2)  =   "vpnWFFD_Doer_.ctx":02C8
         FormatStyle(3)  =   "vpnWFFD_Doer_.ctx":0378
         FormatStyle(4)  =   "vpnWFFD_Doer_.ctx":042C
         FormatStyle(5)  =   "vpnWFFD_Doer_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWFFD_Doer_.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupWFFD_Doer 
      Caption         =   "���� ��� �����������"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFD_DoerAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWFFD_DoerEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuWFFD_DoerDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWFFD_DoerOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWFFD_DoerRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuWFFD_DoerS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFD_DoerBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuWFFD_DoerCOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuWFFD_DoerCUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWFFD_DoerPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWFFD_DoerCHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWFFD_DoerCLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuWFFD_DoerPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuWFFD_DoerCfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuWFFD_DoerFind 
         Caption         =   "�����"
      End
   End
End
Attribute VB_Name = "vpnWFFD_Doer_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFFD_Doer As Object
Private menuActionWFFD_Doer As String





Private Sub cmdWFFD_DoerCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFFD_Doer, "gridWFFD_Doer"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_DoerPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFFD_Doer, "�����������"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_DoerRef_Click()
  On Error Resume Next
  Item.WFFD_Doer.Refresh
  gridWFFD_Doer.ItemCount = Item.WFFD_Doer.Count
  gridWFFD_Doer.Refetch
  gridWFFD_Doer.Refresh
End Sub
Private Sub cmdWFFD_DoerAcc_Click()
On Error Resume Next
If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
If gridWFFD_Doer.Row > 0 Then
 If gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Doer.RowBookmark(gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFFD_DoerEdit_Click()
  On Error Resume Next
If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
If gridWFFD_Doer.Row > 0 Then
 If gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Doer.RowBookmark(gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFFD_Doer_.Item = u
again:     frmWFFD_Doer_.NotFirstTime = False
    frmWFFD_Doer_.OnInit
    frmWFFD_Doer_.Show vbModal
    If frmWFFD_Doer_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridWFFD_Doer.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFFD_DoerDel_Click()
  On Error Resume Next
  gridWFFD_Doer.Delete
End Sub
Private Sub cmdWFFD_DoerAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFFD_Doer.Add()

      Set frmWFFD_Doer_.Item = u
again:       frmWFFD_Doer_.NotFirstTime = False
      frmWFFD_Doer_.OnInit
      frmWFFD_Doer_.Show vbModal
      If frmWFFD_Doer_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridWFFD_Doer.ItemCount = Item.WFFD_Doer.Count
        gridWFFD_Doer.Refresh
        gridWFFD_Doer.RefreshGroups
        gridWFFD_Doer.RefreshSort
        gridWFFD_Doer.MoveToBookmark u.ID & "WFFD_Doer"
      Else
        Item.WFFD_Doer.Delete u.ID
        Item.WFFD_Doer.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdWFFD_DoerFnd_Click()
  On Error Resume Next
  fndWFFD_Doer.ShowForm
End Sub
Private Sub cmdWFFD_DoerRun_Click()
  On Error Resume Next
  gridWFFD_Doer_DblClick
End Sub
Private Sub gridWFFD_Doer_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WFFD_Doer.LoadRow gridWFFD_Doer, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFFD_Doer_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFFD_Doer", Left(Bookmark, 38))
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
   MsgBox Err.Description, vbOKOnly + vbExclamation, "��������"
End Sub

Private Sub gridWFFD_Doer_DblClick()
  cmdWFFD_DoerEdit_Click
End Sub
Private Sub gridWFFD_Doer_KeyPress(KeyAscii As Integer)
  If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFFD_Doer.FindOnPress KeyAscii
End Sub

Private Sub gridWFFD_Doer_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFFD_Doer.Row And LastRow > 0 Then
  gridWFFD_Doer.GetRowData(LastRow).RowStyle = "Default"
  gridWFFD_Doer.GetRowData(gridWFFD_Doer.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFFD_DoerPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFFD_Doer.Add()
    If GetFromBuffer(u) Then
      gridWFFD_Doer.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridWFFD_Doer_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFFD_DoerCfg_Click
        End If
    End If
End Sub

Private Sub gridWFFD_Doer_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFFD_Doer
End If
End Sub
Private Sub mnuWFFD_DoerAdd_click()
   menuActionWFFD_Doer = "ADD"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerEdit_click()
   menuActionWFFD_Doer = "EDIT"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerDelete_click()
   menuActionWFFD_Doer = "DEL"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerOpen_click()
   menuActionWFFD_Doer = "RUN"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerRef_click()
   menuActionWFFD_Doer = "REF"
   menuTimerWFFD_Doer.Enabled = True
End Sub
  Private Sub mnuWFFD_DoerCOPY_Click()
    On Error Resume Next
    If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
    If gridWFFD_Doer.Row > 0 Then
     If gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_Doer.RowBookmark(gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFFD_DoerCUT_Click()
    On Error Resume Next
    If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
    If gridWFFD_Doer.Row > 0 Then
     If gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_Doer.RowBookmark(gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFFD_Doer.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFFD_DoerCHANGE_Click()
  On Error Resume Next
  If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
  If gridWFFD_Doer.Row > 0 Then
   If gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Doer.RowBookmark(gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFFD_Doer.ItemCount = u.Parent.Count
      gridWFFD_Doer.RefreshRowIndex gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFFD_DoerCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFD_DoerPrn_click()
   menuActionWFFD_Doer = "PRN"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerCfg_click()
   menuActionWFFD_Doer = "CFG"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerFind_click()
   menuActionWFFD_Doer = "FND"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerAcc_click()
   menuActionWFFD_Doer = "ACC"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub menuTimerWFFD_Doer_timer()
   menuTimerWFFD_Doer.Enabled = False
   If menuActionWFFD_Doer = "ADD" Then cmdWFFD_DoerAdd_Click
   If menuActionWFFD_Doer = "EDIT" Then cmdWFFD_DoerEdit_Click
   If menuActionWFFD_Doer = "DEL" Then cmdWFFD_DoerDel_Click
   If menuActionWFFD_Doer = "RUN" Then cmdWFFD_DoerRun_Click
   If menuActionWFFD_Doer = "REF" Then cmdWFFD_DoerRef_Click
   If menuActionWFFD_Doer = "PRN" Then cmdWFFD_DoerPrn_Click
   If menuActionWFFD_Doer = "CFG" Then cmdWFFD_DoerCfg_Click
   If menuActionWFFD_Doer = "FND" Then cmdWFFD_DoerFnd_Click
   If menuActionWFFD_Doer = "ACC" Then cmdWFFD_DoerAcc_Click
   menuActionWFFD_Doer = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFFD_DoerAdd, cmdWFFD_DoerAdd.Tag
  LoadBtnPictures cmdWFFD_DoerEdit, cmdWFFD_DoerEdit.Tag
  LoadBtnPictures cmdWFFD_DoerDel, cmdWFFD_DoerDel.Tag
  LoadBtnPictures cmdWFFD_DoerRef, cmdWFFD_DoerRef.Tag
  LoadBtnPictures cmdWFFD_DoerPrn, cmdWFFD_DoerPrn.Tag
  LoadBtnPictures cmdWFFD_DoerFnd, cmdWFFD_DoerFnd.Tag
  Item.WFFD_Doer.PrepareGrid gridWFFD_Doer
  LoadGridLayout gridWFFD_Doer
  Set fndWFFD_Doer = Nothing
  On Error Resume Next
  Set fndWFFD_Doer = CreateObject("MTZ_JSetup.GridFinder")
  fndWFFD_Doer.Init gridWFFD_Doer
End Sub
Private Sub OnTabClick()

      gridWFFD_Doer.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFFD_Doer.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWFFD_Doer.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWFFD_Doer = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
End Sub

'����������� ������� � ��������
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
'do nothing
End Sub



'�������� ����� ������� ���������� ���� �� ������� ������
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "�������� ����� ������"
End Sub



'��������� ����� ������ ��� ������� ������������ ��� �������� ��������
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly + vbCritical, "�������� ����� ������"
End Sub



'�������� ������ �� ������ ��������
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "����� " & Date)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "�������� ������"
End Sub



'������� ����� ������ �� �������
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKP", "������ " & Date)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "�������� �������"
End Sub



'������� ����� ������ �� �������
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKO", "������ " & Date)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "�������� �������"
End Sub



'�������� �������� �� ��������������
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
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
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'�������� �������� �������
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next
Item.Name = Name
' ����� �� ���� �����, ���� ���������� ������ ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'������� ������ �� �������
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "������ " & Date)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "�������� ������"
End Sub





