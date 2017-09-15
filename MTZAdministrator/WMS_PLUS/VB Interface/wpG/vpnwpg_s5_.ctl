VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnwpg_s5_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerwpg_s5 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlwpg_s5 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdwpg_s5Acc 
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
      Begin VB.CommandButton cmdwpg_s5Fnd 
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
      Begin VB.CommandButton cmdwpg_s5Cfg 
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
      Begin VB.CommandButton cmdwpg_s5Prn 
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
      Begin VB.CommandButton cmdwpg_s5Ref 
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
      Begin VB.CommandButton cmdwpg_s5Del 
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
      Begin VB.CommandButton cmdwpg_s5Edit 
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
      Begin VB.CommandButton cmdwpg_s5Add 
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
      Begin GridEX20.GridEX gridwpg_s5 
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
         Column(1)       =   "vpnwpg_s5_.ctx":0000
         Column(2)       =   "vpnwpg_s5_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnwpg_s5_.ctx":016C
         FormatStyle(2)  =   "vpnwpg_s5_.ctx":02C8
         FormatStyle(3)  =   "vpnwpg_s5_.ctx":0378
         FormatStyle(4)  =   "vpnwpg_s5_.ctx":042C
         FormatStyle(5)  =   "vpnwpg_s5_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnwpg_s5_.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdwpg_s5Run 
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
   Begin VB.Menu mnuPopupwpg_s5 
      Caption         =   "���� ��� �-��������� 5"
      Visible         =   0   'False
      Begin VB.Menu mnuwpg_s5Add 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuwpg_s5Edit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuwpg_s5Delete 
         Caption         =   "�������"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuwpg_s5Open 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuwpg_s5Ref 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuwpg_s5S1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuwpg_s5Buffer 
         Caption         =   "�����"
         Begin VB.Menu mnuwpg_s5COPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuwpg_s5CUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuwpg_s5PASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuwpg_s5CHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuwpg_s5CLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuwpg_s5Prn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuwpg_s5Cfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuwpg_s5Find 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuwpg_s5Acc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnwpg_s5_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ��� ������ �� �������� �������
Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndwpg_s5 As Object
Private menuActionwpg_s5 As String





Private Sub cmdwpg_s5Cfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridwpg_s5, "gridwpg_s5"
Set jset = Nothing
End Sub

Private Sub cmdwpg_s5Prn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridwpg_s5, "�-��������� 5"
Set jset = Nothing
End Sub

Private Sub cmdwpg_s5Ref_Click()
  On Error Resume Next
  item.wpg_s5.Refresh
  gridwpg_s5.ItemCount = item.wpg_s5.Count
  gridwpg_s5.Refetch
  gridwpg_s5.Refresh
End Sub
Private Sub cmdwpg_s5Acc_Click()
On Error Resume Next
If gridwpg_s5.ItemCount = 0 Then Exit Sub
If gridwpg_s5.Row > 0 Then
 If gridwpg_s5.RowIndex(gridwpg_s5.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridwpg_s5.RowBookmark(gridwpg_s5.RowIndex(gridwpg_s5.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdwpg_s5Edit_Click()
  On Error Resume Next
If gridwpg_s5.ItemCount = 0 Then Exit Sub
If gridwpg_s5.Row > 0 Then
 If gridwpg_s5.RowIndex(gridwpg_s5.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridwpg_s5.RowBookmark(gridwpg_s5.RowIndex(gridwpg_s5.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmwpg_s5_.item = u
again:     frmwpg_s5_.NotFirstTime = False
    frmwpg_s5_.OnInit
    frmwpg_s5_.Show vbModal
    If frmwpg_s5_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridwpg_s5.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdwpg_s5Del_Click()
  On Error Resume Next
End Sub
Private Sub cmdwpg_s5Add_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.wpg_s5.Add()

      Set frmwpg_s5_.item = u
again:       frmwpg_s5_.NotFirstTime = False
      frmwpg_s5_.OnInit
      frmwpg_s5_.Show vbModal
      If frmwpg_s5_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridwpg_s5.ItemCount = item.wpg_s5.Count
        gridwpg_s5.Refresh
        gridwpg_s5.RefreshGroups
        gridwpg_s5.RefreshSort
        gridwpg_s5.MoveToBookmark u.ID & "wpg_s5"
      Else
        item.wpg_s5.Delete u.ID
        item.wpg_s5.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdwpg_s5Fnd_Click()
  On Error Resume Next
  fndwpg_s5.ShowForm
End Sub
Private Sub cmdwpg_s5Run_Click()
  On Error Resume Next
  gridwpg_s5_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridwpg_s5_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.wpg_s5.LoadRow gridwpg_s5, RowIndex, Bookmark, Values
End Sub
Private Sub gridwpg_s5_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridwpg_s5_DblClick()
  cmdwpg_s5Edit_Click
End Sub
Private Sub gridwpg_s5_KeyPress(KeyAscii As Integer)
  If gridwpg_s5.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndwpg_s5.FindOnPress KeyAscii
End Sub

Private Sub gridwpg_s5_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridwpg_s5.Row And LastRow > 0 Then
  gridwpg_s5.GetRowData(LastRow).RowStyle = "Default"
  gridwpg_s5.GetRowData(gridwpg_s5.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuwpg_s5PASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.wpg_s5.Add()
    If GetFromBuffer(u) Then
      gridwpg_s5.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridwpg_s5_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdwpg_s5Cfg_Click
        End If
    End If
End Sub

Private Sub gridwpg_s5_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupwpg_s5
End If
End Sub
Private Sub mnuwpg_s5Add_click()
   menuActionwpg_s5 = "ADD"
   menuTimerwpg_s5.Enabled = True
End Sub
Private Sub mnuwpg_s5Edit_click()
   menuActionwpg_s5 = "EDIT"
   menuTimerwpg_s5.Enabled = True
End Sub
Private Sub mnuwpg_s5Delete_click()
   menuActionwpg_s5 = "DEL"
   menuTimerwpg_s5.Enabled = True
End Sub
Private Sub mnuwpg_s5Open_click()
   menuActionwpg_s5 = "RUN"
   menuTimerwpg_s5.Enabled = True
End Sub
Private Sub mnuwpg_s5Ref_click()
   menuActionwpg_s5 = "REF"
   menuTimerwpg_s5.Enabled = True
End Sub
  Private Sub mnuwpg_s5COPY_Click()
    On Error Resume Next
    If gridwpg_s5.ItemCount = 0 Then Exit Sub
    If gridwpg_s5.Row > 0 Then
     If gridwpg_s5.RowIndex(gridwpg_s5.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridwpg_s5.RowBookmark(gridwpg_s5.RowIndex(gridwpg_s5.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuwpg_s5CUT_Click()
    On Error Resume Next
    If gridwpg_s5.ItemCount = 0 Then Exit Sub
    If gridwpg_s5.Row > 0 Then
     If gridwpg_s5.RowIndex(gridwpg_s5.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridwpg_s5.RowBookmark(gridwpg_s5.RowIndex(gridwpg_s5.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridwpg_s5.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuwpg_s5CHANGE_Click()
  On Error Resume Next
  If gridwpg_s5.ItemCount = 0 Then Exit Sub
  If gridwpg_s5.Row > 0 Then
   If gridwpg_s5.RowIndex(gridwpg_s5.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridwpg_s5.RowBookmark(gridwpg_s5.RowIndex(gridwpg_s5.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridwpg_s5.ItemCount = u.Parent.Count
      gridwpg_s5.RefreshRowIndex gridwpg_s5.RowIndex(gridwpg_s5.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuwpg_s5CLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuwpg_s5Prn_click()
   menuActionwpg_s5 = "PRN"
   menuTimerwpg_s5.Enabled = True
End Sub
Private Sub mnuwpg_s5Cfg_click()
   menuActionwpg_s5 = "CFG"
   menuTimerwpg_s5.Enabled = True
End Sub
Private Sub mnuwpg_s5Find_click()
   menuActionwpg_s5 = "FND"
   menuTimerwpg_s5.Enabled = True
End Sub
Private Sub mnuwpg_s5Acc_click()
   menuActionwpg_s5 = "ACC"
   menuTimerwpg_s5.Enabled = True
End Sub
Private Sub menuTimerwpg_s5_timer()
   menuTimerwpg_s5.Enabled = False
   If menuActionwpg_s5 = "ADD" Then cmdwpg_s5Add_Click
   If menuActionwpg_s5 = "EDIT" Then cmdwpg_s5Edit_Click
   If menuActionwpg_s5 = "DEL" Then cmdwpg_s5Del_Click
   If menuActionwpg_s5 = "RUN" Then cmdwpg_s5Run_Click
   If menuActionwpg_s5 = "REF" Then cmdwpg_s5Ref_Click
   If menuActionwpg_s5 = "PRN" Then cmdwpg_s5Prn_Click
   If menuActionwpg_s5 = "CFG" Then cmdwpg_s5Cfg_Click
   If menuActionwpg_s5 = "FND" Then cmdwpg_s5Fnd_Click
   If menuActionwpg_s5 = "ACC" Then cmdwpg_s5Acc_Click
   menuActionwpg_s5 = ""
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

  LoadBtnPictures cmdwpg_s5Add, cmdwpg_s5Add.Tag
  LoadBtnPictures cmdwpg_s5Edit, cmdwpg_s5Edit.Tag
  LoadBtnPictures cmdwpg_s5Del, cmdwpg_s5Del.Tag
  LoadBtnPictures cmdwpg_s5Ref, cmdwpg_s5Ref.Tag
  LoadBtnPictures cmdwpg_s5Prn, cmdwpg_s5Prn.Tag
  LoadBtnPictures cmdwpg_s5Fnd, cmdwpg_s5Fnd.Tag
  LoadBtnPictures cmdwpg_s5Run, cmdwpg_s5Run.Tag
  LoadBtnPictures cmdwpg_s5Acc, cmdwpg_s5Acc.Tag
  LoadBtnPictures cmdwpg_s5Cfg, cmdwpg_s5Cfg.Tag
  item.wpg_s5.PrepareGrid gridwpg_s5
  LoadGridLayout gridwpg_s5
  Set fndwpg_s5 = Nothing
  On Error Resume Next
  Set fndwpg_s5 = CreateObject("MTZ_JSetup.GridFinder")
  fndwpg_s5.Init gridwpg_s5
End Sub

'�������� ��� ����������� ����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

      gridwpg_s5.Top = 40 * Screen.TwipsPerPixelX
      gridwpg_s5.Left = 5 * Screen.TwipsPerPixelX
      gridwpg_s5.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridwpg_s5.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridwpg_s5.Top = 40 * Screen.TwipsPerPixelX
      gridwpg_s5.Left = 5 * Screen.TwipsPerPixelX
      gridwpg_s5.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridwpg_s5.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlwpg_s5.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndwpg_s5 = Nothing
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





