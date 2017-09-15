VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWMSD_FACTORY_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWMSD_FACTORY 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWMSD_FACTORY 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWMSD_FACTORYAcc 
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
      Begin VB.CommandButton cmdWMSD_FACTORYFnd 
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
      Begin VB.CommandButton cmdWMSD_FACTORYCfg 
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
      Begin VB.CommandButton cmdWMSD_FACTORYPrn 
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
      Begin VB.CommandButton cmdWMSD_FACTORYRef 
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
      Begin VB.CommandButton cmdWMSD_FACTORYDel 
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
      Begin VB.CommandButton cmdWMSD_FACTORYEdit 
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
      Begin VB.CommandButton cmdWMSD_FACTORYAdd 
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
      Begin GridEX20.GridEX gridWMSD_FACTORY 
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
         Column(1)       =   "vpnWMSD_FACTORY_main.ctx":0000
         Column(2)       =   "vpnWMSD_FACTORY_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWMSD_FACTORY_main.ctx":016C
         FormatStyle(2)  =   "vpnWMSD_FACTORY_main.ctx":02C8
         FormatStyle(3)  =   "vpnWMSD_FACTORY_main.ctx":0378
         FormatStyle(4)  =   "vpnWMSD_FACTORY_main.ctx":042C
         FormatStyle(5)  =   "vpnWMSD_FACTORY_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWMSD_FACTORY_main.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdWMSD_FACTORYRun 
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
   Begin VB.Menu mnuPopupWMSD_FACTORY 
      Caption         =   "���� ��� �����"
      Visible         =   0   'False
      Begin VB.Menu mnuWMSD_FACTORYAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWMSD_FACTORYEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuWMSD_FACTORYDelete 
         Caption         =   "�������"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuWMSD_FACTORYOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWMSD_FACTORYRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuWMSD_FACTORYS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWMSD_FACTORYBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuWMSD_FACTORYCOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuWMSD_FACTORYCUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWMSD_FACTORYPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWMSD_FACTORYCHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWMSD_FACTORYCLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuWMSD_FACTORYPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuWMSD_FACTORYCfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuWMSD_FACTORYFind 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuWMSD_FACTORYAcc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnWMSD_FACTORY_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWMSD_FACTORY As Object
Private menuActionWMSD_FACTORY As String





Private Sub cmdWMSD_FACTORYCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWMSD_FACTORY, "gridWMSD_FACTORY"
Set jset = Nothing
End Sub

Private Sub cmdWMSD_FACTORYPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWMSD_FACTORY, "�����"
Set jset = Nothing
End Sub

Private Sub cmdWMSD_FACTORYRef_Click()
  On Error Resume Next
  Item.WMSD_FACTORY.Refresh
  gridWMSD_FACTORY.ItemCount = Item.WMSD_FACTORY.Count
  gridWMSD_FACTORY.Refetch
  gridWMSD_FACTORY.Refresh
End Sub
Private Sub cmdWMSD_FACTORYAcc_Click()
On Error Resume Next
If gridWMSD_FACTORY.ItemCount = 0 Then Exit Sub
If gridWMSD_FACTORY.Row > 0 Then
 If gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSD_FACTORY.RowBookmark(gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWMSD_FACTORYEdit_Click()
  On Error Resume Next
If gridWMSD_FACTORY.ItemCount = 0 Then Exit Sub
If gridWMSD_FACTORY.Row > 0 Then
 If gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSD_FACTORY.RowBookmark(gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWMSD_FACTORY_main.Item = u
again:     frmWMSD_FACTORY_main.NotFirstTime = False
    frmWMSD_FACTORY_main.OnInit
    frmWMSD_FACTORY_main.Show vbModal
    If frmWMSD_FACTORY_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridWMSD_FACTORY.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWMSD_FACTORYDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdWMSD_FACTORYAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WMSD_FACTORY.Add()

      Set frmWMSD_FACTORY_main.Item = u
again:       frmWMSD_FACTORY_main.NotFirstTime = False
      frmWMSD_FACTORY_main.OnInit
      frmWMSD_FACTORY_main.Show vbModal
      If frmWMSD_FACTORY_main.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridWMSD_FACTORY.ItemCount = Item.WMSD_FACTORY.Count
        gridWMSD_FACTORY.Refresh
        gridWMSD_FACTORY.RefreshGroups
        gridWMSD_FACTORY.RefreshSort
        gridWMSD_FACTORY.MoveToBookmark u.ID & "WMSD_FACTORY"
      Else
        Item.WMSD_FACTORY.Delete u.ID
        Item.WMSD_FACTORY.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdWMSD_FACTORYFnd_Click()
  On Error Resume Next
  fndWMSD_FACTORY.ShowForm
End Sub
Private Sub cmdWMSD_FACTORYRun_Click()
  On Error Resume Next
  gridWMSD_FACTORY_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridWMSD_FACTORY_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WMSD_FACTORY.LoadRow gridWMSD_FACTORY, RowIndex, Bookmark, Values
End Sub
Private Sub gridWMSD_FACTORY_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridWMSD_FACTORY_DblClick()
  cmdWMSD_FACTORYEdit_Click
End Sub
Private Sub gridWMSD_FACTORY_KeyPress(KeyAscii As Integer)
  If gridWMSD_FACTORY.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWMSD_FACTORY.FindOnPress KeyAscii
End Sub

Private Sub gridWMSD_FACTORY_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWMSD_FACTORY.Row And LastRow > 0 Then
  gridWMSD_FACTORY.GetRowData(LastRow).RowStyle = "Default"
  gridWMSD_FACTORY.GetRowData(gridWMSD_FACTORY.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWMSD_FACTORYPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WMSD_FACTORY.Add()
    If GetFromBuffer(u) Then
      gridWMSD_FACTORY.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridWMSD_FACTORY_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWMSD_FACTORYCfg_Click
        End If
    End If
End Sub

Private Sub gridWMSD_FACTORY_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWMSD_FACTORY
End If
End Sub
Private Sub mnuWMSD_FACTORYAdd_click()
   menuActionWMSD_FACTORY = "ADD"
   menuTimerWMSD_FACTORY.Enabled = True
End Sub
Private Sub mnuWMSD_FACTORYEdit_click()
   menuActionWMSD_FACTORY = "EDIT"
   menuTimerWMSD_FACTORY.Enabled = True
End Sub
Private Sub mnuWMSD_FACTORYDelete_click()
   menuActionWMSD_FACTORY = "DEL"
   menuTimerWMSD_FACTORY.Enabled = True
End Sub
Private Sub mnuWMSD_FACTORYOpen_click()
   menuActionWMSD_FACTORY = "RUN"
   menuTimerWMSD_FACTORY.Enabled = True
End Sub
Private Sub mnuWMSD_FACTORYRef_click()
   menuActionWMSD_FACTORY = "REF"
   menuTimerWMSD_FACTORY.Enabled = True
End Sub
  Private Sub mnuWMSD_FACTORYCOPY_Click()
    On Error Resume Next
    If gridWMSD_FACTORY.ItemCount = 0 Then Exit Sub
    If gridWMSD_FACTORY.Row > 0 Then
     If gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSD_FACTORY.RowBookmark(gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWMSD_FACTORYCUT_Click()
    On Error Resume Next
    If gridWMSD_FACTORY.ItemCount = 0 Then Exit Sub
    If gridWMSD_FACTORY.Row > 0 Then
     If gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSD_FACTORY.RowBookmark(gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWMSD_FACTORY.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWMSD_FACTORYCHANGE_Click()
  On Error Resume Next
  If gridWMSD_FACTORY.ItemCount = 0 Then Exit Sub
  If gridWMSD_FACTORY.Row > 0 Then
   If gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSD_FACTORY.RowBookmark(gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWMSD_FACTORY.ItemCount = u.Parent.Count
      gridWMSD_FACTORY.RefreshRowIndex gridWMSD_FACTORY.RowIndex(gridWMSD_FACTORY.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWMSD_FACTORYCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWMSD_FACTORYPrn_click()
   menuActionWMSD_FACTORY = "PRN"
   menuTimerWMSD_FACTORY.Enabled = True
End Sub
Private Sub mnuWMSD_FACTORYCfg_click()
   menuActionWMSD_FACTORY = "CFG"
   menuTimerWMSD_FACTORY.Enabled = True
End Sub
Private Sub mnuWMSD_FACTORYFind_click()
   menuActionWMSD_FACTORY = "FND"
   menuTimerWMSD_FACTORY.Enabled = True
End Sub
Private Sub mnuWMSD_FACTORYAcc_click()
   menuActionWMSD_FACTORY = "ACC"
   menuTimerWMSD_FACTORY.Enabled = True
End Sub
Private Sub menuTimerWMSD_FACTORY_timer()
   menuTimerWMSD_FACTORY.Enabled = False
   If menuActionWMSD_FACTORY = "ADD" Then cmdWMSD_FACTORYAdd_Click
   If menuActionWMSD_FACTORY = "EDIT" Then cmdWMSD_FACTORYEdit_Click
   If menuActionWMSD_FACTORY = "DEL" Then cmdWMSD_FACTORYDel_Click
   If menuActionWMSD_FACTORY = "RUN" Then cmdWMSD_FACTORYRun_Click
   If menuActionWMSD_FACTORY = "REF" Then cmdWMSD_FACTORYRef_Click
   If menuActionWMSD_FACTORY = "PRN" Then cmdWMSD_FACTORYPrn_Click
   If menuActionWMSD_FACTORY = "CFG" Then cmdWMSD_FACTORYCfg_Click
   If menuActionWMSD_FACTORY = "FND" Then cmdWMSD_FACTORYFnd_Click
   If menuActionWMSD_FACTORY = "ACC" Then cmdWMSD_FACTORYAcc_Click
   menuActionWMSD_FACTORY = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWMSD_FACTORYAdd, cmdWMSD_FACTORYAdd.Tag
  LoadBtnPictures cmdWMSD_FACTORYEdit, cmdWMSD_FACTORYEdit.Tag
  LoadBtnPictures cmdWMSD_FACTORYDel, cmdWMSD_FACTORYDel.Tag
  LoadBtnPictures cmdWMSD_FACTORYRef, cmdWMSD_FACTORYRef.Tag
  LoadBtnPictures cmdWMSD_FACTORYPrn, cmdWMSD_FACTORYPrn.Tag
  LoadBtnPictures cmdWMSD_FACTORYFnd, cmdWMSD_FACTORYFnd.Tag
  LoadBtnPictures cmdWMSD_FACTORYRun, cmdWMSD_FACTORYRun.Tag
  LoadBtnPictures cmdWMSD_FACTORYAcc, cmdWMSD_FACTORYAcc.Tag
  LoadBtnPictures cmdWMSD_FACTORYCfg, cmdWMSD_FACTORYCfg.Tag
  Item.WMSD_FACTORY.PrepareGrid gridWMSD_FACTORY
  LoadGridLayout gridWMSD_FACTORY
  Set fndWMSD_FACTORY = Nothing
  On Error Resume Next
  Set fndWMSD_FACTORY = CreateObject("MTZ_JSetup.GridFinder")
  fndWMSD_FACTORY.Init gridWMSD_FACTORY
End Sub
Private Sub OnTabClick()

      gridWMSD_FACTORY.Top = 40 * Screen.TwipsPerPixelX
      gridWMSD_FACTORY.Left = 5 * Screen.TwipsPerPixelX
      gridWMSD_FACTORY.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWMSD_FACTORY.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWMSD_FACTORY.Top = 40 * Screen.TwipsPerPixelX
      gridWMSD_FACTORY.Left = 5 * Screen.TwipsPerPixelX
      gridWMSD_FACTORY.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWMSD_FACTORY.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWMSD_FACTORY.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWMSD_FACTORY = Nothing
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

  RowItem.Person.Secure Item.SecureStyleid
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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� ��"

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
  MsgBox err.Description, vbOKOnly + vbCritical, "�������� ������"
End Sub





