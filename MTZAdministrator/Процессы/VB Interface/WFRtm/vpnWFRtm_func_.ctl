VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnWFRtm_func_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFRtm_func 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFRtm_func 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFRtm_funcFnd 
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
      Begin VB.CommandButton cmdWFRtm_funcPrn 
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
      Begin VB.CommandButton cmdWFRtm_funcRef 
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
      Begin VB.CommandButton cmdWFRtm_funcDel 
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
      Begin VB.CommandButton cmdWFRtm_funcEdit 
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
      Begin VB.CommandButton cmdWFRtm_funcAdd 
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
      Begin GridEX20.GridEX gridWFRtm_func 
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
         Column(1)       =   "vpnWFRtm_func_.ctx":0000
         Column(2)       =   "vpnWFRtm_func_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFRtm_func_.ctx":016C
         FormatStyle(2)  =   "vpnWFRtm_func_.ctx":02C8
         FormatStyle(3)  =   "vpnWFRtm_func_.ctx":0378
         FormatStyle(4)  =   "vpnWFRtm_func_.ctx":042C
         FormatStyle(5)  =   "vpnWFRtm_func_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWFRtm_func_.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupWFRtm_func 
      Caption         =   "���� ��� �������"
      Visible         =   0   'False
      Begin VB.Menu mnuWFRtm_funcAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWFRtm_funcEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuWFRtm_funcDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWFRtm_funcOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWFRtm_funcRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuWFRtm_funcS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFRtm_funcBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuWFRtm_funcCOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuWFRtm_funcCUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWFRtm_funcPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWFRtm_funcCHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWFRtm_funcCLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuWFRtm_funcPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuWFRtm_funcCfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuWFRtm_funcFind 
         Caption         =   "�����"
      End
   End
End
Attribute VB_Name = "vpnWFRtm_func_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFRtm_func As Object
Private menuActionWFRtm_func As String





Private Sub opWFRtm_func_OpenRef_(RowItem As Object)
With RowItem
Run_VBOpenRef ID:=.Func.ID, StartMode:="", RowItem:=RowItem
End With
End Sub
Private Sub cmdWFRtm_funcCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFRtm_func, "gridWFRtm_func"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_funcPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFRtm_func, "�������"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_funcRef_Click()
  On Error Resume Next
  Item.WFRtm_func.Refresh
  gridWFRtm_func.ItemCount = Item.WFRtm_func.Count
  gridWFRtm_func.Refetch
  gridWFRtm_func.Refresh
End Sub
Private Sub cmdWFRtm_funcAcc_Click()
On Error Resume Next
If gridWFRtm_func.ItemCount = 0 Then Exit Sub
If gridWFRtm_func.Row > 0 Then
 If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFRtm_funcEdit_Click()
  On Error Resume Next
If gridWFRtm_func.ItemCount = 0 Then Exit Sub
If gridWFRtm_func.Row > 0 Then
 If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFRtm_func_.Item = u
again:     frmWFRtm_func_.NotFirstTime = False
    frmWFRtm_func_.OnInit
    frmWFRtm_func_.Show vbModal
    If frmWFRtm_func_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridWFRtm_func.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFRtm_funcDel_Click()
  On Error Resume Next
  gridWFRtm_func.Delete
End Sub
Private Sub cmdWFRtm_funcAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFRtm_func.Add()

      Set frmWFRtm_func_.Item = u
again:       frmWFRtm_func_.NotFirstTime = False
      frmWFRtm_func_.OnInit
      frmWFRtm_func_.Show vbModal
      If frmWFRtm_func_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridWFRtm_func.ItemCount = Item.WFRtm_func.Count
        gridWFRtm_func.Refresh
        gridWFRtm_func.RefreshGroups
        gridWFRtm_func.RefreshSort
        gridWFRtm_func.MoveToBookmark u.ID & "WFRtm_func"
      Else
        Item.WFRtm_func.Delete u.ID
        Item.WFRtm_func.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdWFRtm_funcFnd_Click()
  On Error Resume Next
  fndWFRtm_func.ShowForm
End Sub
Private Sub cmdWFRtm_funcRun_Click()
  On Error Resume Next
  gridWFRtm_func_DblClick
End Sub
Private Sub gridWFRtm_func_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WFRtm_func.LoadRow gridWFRtm_func, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFRtm_func_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFRtm_func.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFRtm_func", Left(Bookmark, 38))
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

Private Sub gridWFRtm_func_DblClick()
If gridWFRtm_func.ItemCount = 0 Then Exit Sub
If gridWFRtm_func.Row > 0 Then
  If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    On Error Resume Next
    If Not u Is Nothing Then
      opWFRtm_func_OpenRef_ u
    End If
     u.Refresh
  End If
End If
End Sub
Private Sub gridWFRtm_func_KeyPress(KeyAscii As Integer)
  If gridWFRtm_func.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFRtm_func.FindOnPress KeyAscii
End Sub

Private Sub gridWFRtm_func_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFRtm_func.Row And LastRow > 0 Then
  gridWFRtm_func.GetRowData(LastRow).RowStyle = "Default"
  gridWFRtm_func.GetRowData(gridWFRtm_func.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFRtm_funcPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFRtm_func.Add()
    If GetFromBuffer(u) Then
      gridWFRtm_func.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridWFRtm_func_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFRtm_funcCfg_Click
        End If
    End If
End Sub

Private Sub gridWFRtm_func_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFRtm_func
End If
End Sub
Private Sub mnuWFRtm_funcAdd_click()
   menuActionWFRtm_func = "ADD"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcEdit_click()
   menuActionWFRtm_func = "EDIT"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcDelete_click()
   menuActionWFRtm_func = "DEL"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcOpen_click()
   menuActionWFRtm_func = "RUN"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcRef_click()
   menuActionWFRtm_func = "REF"
   menuTimerWFRtm_func.Enabled = True
End Sub
  Private Sub mnuWFRtm_funcCOPY_Click()
    On Error Resume Next
    If gridWFRtm_func.ItemCount = 0 Then Exit Sub
    If gridWFRtm_func.Row > 0 Then
     If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFRtm_funcCUT_Click()
    On Error Resume Next
    If gridWFRtm_func.ItemCount = 0 Then Exit Sub
    If gridWFRtm_func.Row > 0 Then
     If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFRtm_func.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFRtm_funcCHANGE_Click()
  On Error Resume Next
  If gridWFRtm_func.ItemCount = 0 Then Exit Sub
  If gridWFRtm_func.Row > 0 Then
   If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFRtm_func.ItemCount = u.Parent.Count
      gridWFRtm_func.RefreshRowIndex gridWFRtm_func.RowIndex(gridWFRtm_func.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFRtm_funcCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFRtm_funcPrn_click()
   menuActionWFRtm_func = "PRN"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcCfg_click()
   menuActionWFRtm_func = "CFG"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcFind_click()
   menuActionWFRtm_func = "FND"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcAcc_click()
   menuActionWFRtm_func = "ACC"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub menuTimerWFRtm_func_timer()
   menuTimerWFRtm_func.Enabled = False
   If menuActionWFRtm_func = "ADD" Then cmdWFRtm_funcAdd_Click
   If menuActionWFRtm_func = "EDIT" Then cmdWFRtm_funcEdit_Click
   If menuActionWFRtm_func = "DEL" Then cmdWFRtm_funcDel_Click
   If menuActionWFRtm_func = "RUN" Then cmdWFRtm_funcRun_Click
   If menuActionWFRtm_func = "REF" Then cmdWFRtm_funcRef_Click
   If menuActionWFRtm_func = "PRN" Then cmdWFRtm_funcPrn_Click
   If menuActionWFRtm_func = "CFG" Then cmdWFRtm_funcCfg_Click
   If menuActionWFRtm_func = "FND" Then cmdWFRtm_funcFnd_Click
   If menuActionWFRtm_func = "ACC" Then cmdWFRtm_funcAcc_Click
   menuActionWFRtm_func = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFRtm_funcAdd, cmdWFRtm_funcAdd.Tag
  LoadBtnPictures cmdWFRtm_funcEdit, cmdWFRtm_funcEdit.Tag
  LoadBtnPictures cmdWFRtm_funcDel, cmdWFRtm_funcDel.Tag
  LoadBtnPictures cmdWFRtm_funcRef, cmdWFRtm_funcRef.Tag
  LoadBtnPictures cmdWFRtm_funcPrn, cmdWFRtm_funcPrn.Tag
  LoadBtnPictures cmdWFRtm_funcFnd, cmdWFRtm_funcFnd.Tag
  Item.WFRtm_func.PrepareGrid gridWFRtm_func
  LoadGridLayout gridWFRtm_func
  Set fndWFRtm_func = Nothing
  On Error Resume Next
  Set fndWFRtm_func = CreateObject("MTZ_JSetup.GridFinder")
  fndWFRtm_func.Init gridWFRtm_func
End Sub
Private Sub OnTabClick()

      gridWFRtm_func.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_func.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_func.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_func.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFRtm_func.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_func.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_func.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_func.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWFRtm_func.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWFRtm_func = Nothing
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





