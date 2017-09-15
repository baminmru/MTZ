VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnwpout_srv_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerwpout_srv 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlwpout_srv 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdwpout_srvAcc 
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
      Begin VB.CommandButton cmdwpout_srvFnd 
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
      Begin VB.CommandButton cmdwpout_srvCfg 
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
      Begin VB.CommandButton cmdwpout_srvPrn 
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
      Begin VB.CommandButton cmdwpout_srvRef 
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
      Begin VB.CommandButton cmdwpout_srvDel 
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
      Begin VB.CommandButton cmdwpout_srvEdit 
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
      Begin VB.CommandButton cmdwpout_srvAdd 
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
      Begin GridEX20.GridEX gridwpout_srv 
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
         Column(1)       =   "vpnwpout_srv_main.ctx":0000
         Column(2)       =   "vpnwpout_srv_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnwpout_srv_main.ctx":016C
         FormatStyle(2)  =   "vpnwpout_srv_main.ctx":02C8
         FormatStyle(3)  =   "vpnwpout_srv_main.ctx":0378
         FormatStyle(4)  =   "vpnwpout_srv_main.ctx":042C
         FormatStyle(5)  =   "vpnwpout_srv_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnwpout_srv_main.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdwpout_srvRun 
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
   Begin VB.Menu mnuPopupwpout_srv 
      Caption         =   "���� ��� ���. ������"
      Visible         =   0   'False
      Begin VB.Menu mnuwpout_srvAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuwpout_srvEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuwpout_srvDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuwpout_srvOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuwpout_srvRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuwpout_srvS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuwpout_srvBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuwpout_srvCOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuwpout_srvCUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuwpout_srvPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuwpout_srvCHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuwpout_srvCLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuwpout_srvPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuwpout_srvCfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuwpout_srvFind 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuwpout_srvAcc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnwpout_srv_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ��� ������ �� �������� �������
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndwpout_srv As Object
Private menuActionwpout_srv As String





Private Sub cmdwpout_srvCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridwpout_srv, "gridwpout_srv"
Set jset = Nothing
End Sub

Private Sub cmdwpout_srvPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridwpout_srv, "���. ������"
Set jset = Nothing
End Sub

Private Sub cmdwpout_srvRef_Click()
  On Error Resume Next
  Item.wpout_srv.Refresh
  gridwpout_srv.ItemCount = Item.wpout_srv.Count
  gridwpout_srv.Refetch
  gridwpout_srv.Refresh
End Sub
Private Sub cmdwpout_srvAcc_Click()
On Error Resume Next
If gridwpout_srv.ItemCount = 0 Then Exit Sub
If gridwpout_srv.Row > 0 Then
 If gridwpout_srv.RowIndex(gridwpout_srv.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridwpout_srv.RowBookmark(gridwpout_srv.RowIndex(gridwpout_srv.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdwpout_srvEdit_Click()
  On Error Resume Next
If gridwpout_srv.ItemCount = 0 Then Exit Sub
If gridwpout_srv.Row > 0 Then
 If gridwpout_srv.RowIndex(gridwpout_srv.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridwpout_srv.RowBookmark(gridwpout_srv.RowIndex(gridwpout_srv.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmwpout_srv_main.Item = u
again:     frmwpout_srv_main.NotFirstTime = False
    frmwpout_srv_main.OnInit
    frmwpout_srv_main.Show vbModal
    If frmwpout_srv_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridwpout_srv.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdwpout_srvDel_Click()
  On Error Resume Next
  gridwpout_srv.Delete
End Sub
Private Sub cmdwpout_srvAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.wpout_srv.Add()
   Call GetNumValue(u, "sequence", "{C51BB549-613B-4EE8-A257-7C21F0C3D585}", Now, "%P", "")

      Set frmwpout_srv_main.Item = u
again:       frmwpout_srv_main.NotFirstTime = False
      frmwpout_srv_main.OnInit
      frmwpout_srv_main.Show vbModal
      If frmwpout_srv_main.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridwpout_srv.ItemCount = Item.wpout_srv.Count
        gridwpout_srv.Refresh
        gridwpout_srv.RefreshGroups
        gridwpout_srv.RefreshSort
        gridwpout_srv.MoveToBookmark u.ID & "wpout_srv"
      Else
        Item.wpout_srv.Delete u.ID
        Item.wpout_srv.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdwpout_srvFnd_Click()
  On Error Resume Next
  fndwpout_srv.ShowForm
End Sub
Private Sub cmdwpout_srvRun_Click()
  On Error Resume Next
  gridwpout_srv_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridwpout_srv_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.wpout_srv.LoadRow gridwpout_srv, RowIndex, Bookmark, Values
End Sub
Private Sub gridwpout_srv_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridwpout_srv.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("wpout_srv", Left(Bookmark, 38))
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

Private Sub gridwpout_srv_DblClick()
  cmdwpout_srvEdit_Click
End Sub
Private Sub gridwpout_srv_KeyPress(KeyAscii As Integer)
  If gridwpout_srv.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndwpout_srv.FindOnPress KeyAscii
End Sub

Private Sub gridwpout_srv_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridwpout_srv.Row And LastRow > 0 Then
  gridwpout_srv.GetRowData(LastRow).RowStyle = "Default"
  gridwpout_srv.GetRowData(gridwpout_srv.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuwpout_srvPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.wpout_srv.Add()
    If GetFromBuffer(u) Then
      gridwpout_srv.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridwpout_srv_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdwpout_srvCfg_Click
        End If
    End If
End Sub

Private Sub gridwpout_srv_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupwpout_srv
End If
End Sub
Private Sub mnuwpout_srvAdd_click()
   menuActionwpout_srv = "ADD"
   menuTimerwpout_srv.Enabled = True
End Sub
Private Sub mnuwpout_srvEdit_click()
   menuActionwpout_srv = "EDIT"
   menuTimerwpout_srv.Enabled = True
End Sub
Private Sub mnuwpout_srvDelete_click()
   menuActionwpout_srv = "DEL"
   menuTimerwpout_srv.Enabled = True
End Sub
Private Sub mnuwpout_srvOpen_click()
   menuActionwpout_srv = "RUN"
   menuTimerwpout_srv.Enabled = True
End Sub
Private Sub mnuwpout_srvRef_click()
   menuActionwpout_srv = "REF"
   menuTimerwpout_srv.Enabled = True
End Sub
  Private Sub mnuwpout_srvCOPY_Click()
    On Error Resume Next
    If gridwpout_srv.ItemCount = 0 Then Exit Sub
    If gridwpout_srv.Row > 0 Then
     If gridwpout_srv.RowIndex(gridwpout_srv.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridwpout_srv.RowBookmark(gridwpout_srv.RowIndex(gridwpout_srv.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuwpout_srvCUT_Click()
    On Error Resume Next
    If gridwpout_srv.ItemCount = 0 Then Exit Sub
    If gridwpout_srv.Row > 0 Then
     If gridwpout_srv.RowIndex(gridwpout_srv.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridwpout_srv.RowBookmark(gridwpout_srv.RowIndex(gridwpout_srv.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridwpout_srv.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuwpout_srvCHANGE_Click()
  On Error Resume Next
  If gridwpout_srv.ItemCount = 0 Then Exit Sub
  If gridwpout_srv.Row > 0 Then
   If gridwpout_srv.RowIndex(gridwpout_srv.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridwpout_srv.RowBookmark(gridwpout_srv.RowIndex(gridwpout_srv.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridwpout_srv.ItemCount = u.Parent.Count
      gridwpout_srv.RefreshRowIndex gridwpout_srv.RowIndex(gridwpout_srv.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuwpout_srvCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuwpout_srvPrn_click()
   menuActionwpout_srv = "PRN"
   menuTimerwpout_srv.Enabled = True
End Sub
Private Sub mnuwpout_srvCfg_click()
   menuActionwpout_srv = "CFG"
   menuTimerwpout_srv.Enabled = True
End Sub
Private Sub mnuwpout_srvFind_click()
   menuActionwpout_srv = "FND"
   menuTimerwpout_srv.Enabled = True
End Sub
Private Sub mnuwpout_srvAcc_click()
   menuActionwpout_srv = "ACC"
   menuTimerwpout_srv.Enabled = True
End Sub
Private Sub menuTimerwpout_srv_timer()
   menuTimerwpout_srv.Enabled = False
   If menuActionwpout_srv = "ADD" Then cmdwpout_srvAdd_Click
   If menuActionwpout_srv = "EDIT" Then cmdwpout_srvEdit_Click
   If menuActionwpout_srv = "DEL" Then cmdwpout_srvDel_Click
   If menuActionwpout_srv = "RUN" Then cmdwpout_srvRun_Click
   If menuActionwpout_srv = "REF" Then cmdwpout_srvRef_Click
   If menuActionwpout_srv = "PRN" Then cmdwpout_srvPrn_Click
   If menuActionwpout_srv = "CFG" Then cmdwpout_srvCfg_Click
   If menuActionwpout_srv = "FND" Then cmdwpout_srvFnd_Click
   If menuActionwpout_srv = "ACC" Then cmdwpout_srvAcc_Click
   menuActionwpout_srv = ""
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
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdwpout_srvAdd, cmdwpout_srvAdd.Tag
  LoadBtnPictures cmdwpout_srvEdit, cmdwpout_srvEdit.Tag
  LoadBtnPictures cmdwpout_srvDel, cmdwpout_srvDel.Tag
  LoadBtnPictures cmdwpout_srvRef, cmdwpout_srvRef.Tag
  LoadBtnPictures cmdwpout_srvPrn, cmdwpout_srvPrn.Tag
  LoadBtnPictures cmdwpout_srvFnd, cmdwpout_srvFnd.Tag
  LoadBtnPictures cmdwpout_srvRun, cmdwpout_srvRun.Tag
  LoadBtnPictures cmdwpout_srvAcc, cmdwpout_srvAcc.Tag
  LoadBtnPictures cmdwpout_srvCfg, cmdwpout_srvCfg.Tag
  Item.wpout_srv.PrepareGrid gridwpout_srv
  LoadGridLayout gridwpout_srv
  Set fndwpout_srv = Nothing
  On Error Resume Next
  Set fndwpout_srv = CreateObject("MTZ_JSetup.GridFinder")
  fndwpout_srv.Init gridwpout_srv
End Sub

'�������� ��� ����������� ����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

      gridwpout_srv.Top = 40 * Screen.TwipsPerPixelX
      gridwpout_srv.Left = 5 * Screen.TwipsPerPixelX
      gridwpout_srv.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridwpout_srv.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridwpout_srv.Top = 40 * Screen.TwipsPerPixelX
      gridwpout_srv.Left = 5 * Screen.TwipsPerPixelX
      gridwpout_srv.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridwpout_srv.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  Set Item = aItem
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
  pnlwpout_srv.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set Item = Nothing
  Set fndwpout_srv = Nothing
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



'�������� ������������ �� �������
'{B91ABF3A-31F8-4A82-8D41-EF463DBA32D0}
Private Sub Run_SSCreateNomen(Name As Variant, Optional RowItem As Object)
On Error Resume Next

'pointCreateLine
End Sub





