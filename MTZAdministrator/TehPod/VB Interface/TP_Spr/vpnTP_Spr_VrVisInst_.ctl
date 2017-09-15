VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnTP_Spr_VrVisInst_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerTP_Spr_VrVisInst 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlTP_Spr_VrVisInst 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdTP_Spr_VrVisInstAcc 
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
      Begin VB.CommandButton cmdTP_Spr_VrVisInstFnd 
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
      Begin VB.CommandButton cmdTP_Spr_VrVisInstCfg 
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
      Begin VB.CommandButton cmdTP_Spr_VrVisInstPrn 
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
      Begin VB.CommandButton cmdTP_Spr_VrVisInstRef 
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
      Begin VB.CommandButton cmdTP_Spr_VrVisInstDel 
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
      Begin VB.CommandButton cmdTP_Spr_VrVisInstEdit 
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
      Begin VB.CommandButton cmdTP_Spr_VrVisInstAdd 
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
      Begin GridEX20.GridEX gridTP_Spr_VrVisInst 
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
         Column(1)       =   "vpnTP_Spr_VrVisInst_.ctx":0000
         Column(2)       =   "vpnTP_Spr_VrVisInst_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnTP_Spr_VrVisInst_.ctx":016C
         FormatStyle(2)  =   "vpnTP_Spr_VrVisInst_.ctx":02C8
         FormatStyle(3)  =   "vpnTP_Spr_VrVisInst_.ctx":0378
         FormatStyle(4)  =   "vpnTP_Spr_VrVisInst_.ctx":042C
         FormatStyle(5)  =   "vpnTP_Spr_VrVisInst_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnTP_Spr_VrVisInst_.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdTP_Spr_VrVisInstRun 
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
   Begin VB.Menu mnuPopupTP_Spr_VrVisInst 
      Caption         =   "���� ��� ����� ������ �����������"
      Visible         =   0   'False
      Begin VB.Menu mnuTP_Spr_VrVisInstAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuTP_Spr_VrVisInstEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuTP_Spr_VrVisInstDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuTP_Spr_VrVisInstOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuTP_Spr_VrVisInstRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuTP_Spr_VrVisInstS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuTP_Spr_VrVisInstBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuTP_Spr_VrVisInstCOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuTP_Spr_VrVisInstCUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuTP_Spr_VrVisInstPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuTP_Spr_VrVisInstCHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuTP_Spr_VrVisInstCLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuTP_Spr_VrVisInstPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuTP_Spr_VrVisInstCfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuTP_Spr_VrVisInstFind 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuTP_Spr_VrVisInstAcc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnTP_Spr_VrVisInst_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ��� ������ �� �������� �������
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndTP_Spr_VrVisInst As Object
Private menuActionTP_Spr_VrVisInst As String





Private Sub cmdTP_Spr_VrVisInstCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridTP_Spr_VrVisInst, "gridTP_Spr_VrVisInst"
Set jset = Nothing
End Sub

Private Sub cmdTP_Spr_VrVisInstPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridTP_Spr_VrVisInst, "����� ������ �����������"
Set jset = Nothing
End Sub

Private Sub cmdTP_Spr_VrVisInstRef_Click()
  On Error Resume Next
  Item.TP_Spr_VrVisInst.Refresh
  gridTP_Spr_VrVisInst.ItemCount = Item.TP_Spr_VrVisInst.Count
  gridTP_Spr_VrVisInst.Refetch
  gridTP_Spr_VrVisInst.Refresh
End Sub
Private Sub cmdTP_Spr_VrVisInstAcc_Click()
On Error Resume Next
If gridTP_Spr_VrVisInst.ItemCount = 0 Then Exit Sub
If gridTP_Spr_VrVisInst.Row > 0 Then
 If gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridTP_Spr_VrVisInst.RowBookmark(gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdTP_Spr_VrVisInstEdit_Click()
  On Error Resume Next
If gridTP_Spr_VrVisInst.ItemCount = 0 Then Exit Sub
If gridTP_Spr_VrVisInst.Row > 0 Then
 If gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridTP_Spr_VrVisInst.RowBookmark(gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmTP_Spr_VrVisInst_.Item = u
again:     frmTP_Spr_VrVisInst_.NotFirstTime = False
    frmTP_Spr_VrVisInst_.OnInit
    frmTP_Spr_VrVisInst_.Show vbModal
    If frmTP_Spr_VrVisInst_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridTP_Spr_VrVisInst.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdTP_Spr_VrVisInstDel_Click()
  On Error Resume Next
  gridTP_Spr_VrVisInst.Delete
End Sub
Private Sub cmdTP_Spr_VrVisInstAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.TP_Spr_VrVisInst.Add()

      Set frmTP_Spr_VrVisInst_.Item = u
again:       frmTP_Spr_VrVisInst_.NotFirstTime = False
      frmTP_Spr_VrVisInst_.OnInit
      frmTP_Spr_VrVisInst_.Show vbModal
      If frmTP_Spr_VrVisInst_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridTP_Spr_VrVisInst.ItemCount = Item.TP_Spr_VrVisInst.Count
        gridTP_Spr_VrVisInst.Refresh
        gridTP_Spr_VrVisInst.RefreshGroups
        gridTP_Spr_VrVisInst.RefreshSort
        gridTP_Spr_VrVisInst.MoveToBookmark u.ID & "TP_Spr_VrVisInst"
      Else
        Item.TP_Spr_VrVisInst.Delete u.ID
        Item.TP_Spr_VrVisInst.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdTP_Spr_VrVisInstFnd_Click()
  On Error Resume Next
  fndTP_Spr_VrVisInst.ShowForm
End Sub
Private Sub cmdTP_Spr_VrVisInstRun_Click()
  On Error Resume Next
  gridTP_Spr_VrVisInst_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridTP_Spr_VrVisInst_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.TP_Spr_VrVisInst.LoadRow gridTP_Spr_VrVisInst, RowIndex, Bookmark, Values
End Sub
Private Sub gridTP_Spr_VrVisInst_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridTP_Spr_VrVisInst.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("TP_Spr_VrVisInst", Left(Bookmark, 38))
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

Private Sub gridTP_Spr_VrVisInst_DblClick()
  cmdTP_Spr_VrVisInstEdit_Click
End Sub
Private Sub gridTP_Spr_VrVisInst_KeyPress(KeyAscii As Integer)
  If gridTP_Spr_VrVisInst.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndTP_Spr_VrVisInst.FindOnPress KeyAscii
End Sub

Private Sub gridTP_Spr_VrVisInst_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridTP_Spr_VrVisInst.Row And LastRow > 0 Then
  gridTP_Spr_VrVisInst.GetRowData(LastRow).RowStyle = "Default"
  gridTP_Spr_VrVisInst.GetRowData(gridTP_Spr_VrVisInst.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuTP_Spr_VrVisInstPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.TP_Spr_VrVisInst.Add()
    If GetFromBuffer(u) Then
      gridTP_Spr_VrVisInst.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridTP_Spr_VrVisInst_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdTP_Spr_VrVisInstCfg_Click
        End If
    End If
End Sub

Private Sub gridTP_Spr_VrVisInst_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupTP_Spr_VrVisInst
End If
End Sub
Private Sub mnuTP_Spr_VrVisInstAdd_click()
   menuActionTP_Spr_VrVisInst = "ADD"
   menuTimerTP_Spr_VrVisInst.Enabled = True
End Sub
Private Sub mnuTP_Spr_VrVisInstEdit_click()
   menuActionTP_Spr_VrVisInst = "EDIT"
   menuTimerTP_Spr_VrVisInst.Enabled = True
End Sub
Private Sub mnuTP_Spr_VrVisInstDelete_click()
   menuActionTP_Spr_VrVisInst = "DEL"
   menuTimerTP_Spr_VrVisInst.Enabled = True
End Sub
Private Sub mnuTP_Spr_VrVisInstOpen_click()
   menuActionTP_Spr_VrVisInst = "RUN"
   menuTimerTP_Spr_VrVisInst.Enabled = True
End Sub
Private Sub mnuTP_Spr_VrVisInstRef_click()
   menuActionTP_Spr_VrVisInst = "REF"
   menuTimerTP_Spr_VrVisInst.Enabled = True
End Sub
  Private Sub mnuTP_Spr_VrVisInstCOPY_Click()
    On Error Resume Next
    If gridTP_Spr_VrVisInst.ItemCount = 0 Then Exit Sub
    If gridTP_Spr_VrVisInst.Row > 0 Then
     If gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridTP_Spr_VrVisInst.RowBookmark(gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuTP_Spr_VrVisInstCUT_Click()
    On Error Resume Next
    If gridTP_Spr_VrVisInst.ItemCount = 0 Then Exit Sub
    If gridTP_Spr_VrVisInst.Row > 0 Then
     If gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridTP_Spr_VrVisInst.RowBookmark(gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridTP_Spr_VrVisInst.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuTP_Spr_VrVisInstCHANGE_Click()
  On Error Resume Next
  If gridTP_Spr_VrVisInst.ItemCount = 0 Then Exit Sub
  If gridTP_Spr_VrVisInst.Row > 0 Then
   If gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridTP_Spr_VrVisInst.RowBookmark(gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridTP_Spr_VrVisInst.ItemCount = u.Parent.Count
      gridTP_Spr_VrVisInst.RefreshRowIndex gridTP_Spr_VrVisInst.RowIndex(gridTP_Spr_VrVisInst.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuTP_Spr_VrVisInstCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuTP_Spr_VrVisInstPrn_click()
   menuActionTP_Spr_VrVisInst = "PRN"
   menuTimerTP_Spr_VrVisInst.Enabled = True
End Sub
Private Sub mnuTP_Spr_VrVisInstCfg_click()
   menuActionTP_Spr_VrVisInst = "CFG"
   menuTimerTP_Spr_VrVisInst.Enabled = True
End Sub
Private Sub mnuTP_Spr_VrVisInstFind_click()
   menuActionTP_Spr_VrVisInst = "FND"
   menuTimerTP_Spr_VrVisInst.Enabled = True
End Sub
Private Sub mnuTP_Spr_VrVisInstAcc_click()
   menuActionTP_Spr_VrVisInst = "ACC"
   menuTimerTP_Spr_VrVisInst.Enabled = True
End Sub
Private Sub menuTimerTP_Spr_VrVisInst_timer()
   menuTimerTP_Spr_VrVisInst.Enabled = False
   If menuActionTP_Spr_VrVisInst = "ADD" Then cmdTP_Spr_VrVisInstAdd_Click
   If menuActionTP_Spr_VrVisInst = "EDIT" Then cmdTP_Spr_VrVisInstEdit_Click
   If menuActionTP_Spr_VrVisInst = "DEL" Then cmdTP_Spr_VrVisInstDel_Click
   If menuActionTP_Spr_VrVisInst = "RUN" Then cmdTP_Spr_VrVisInstRun_Click
   If menuActionTP_Spr_VrVisInst = "REF" Then cmdTP_Spr_VrVisInstRef_Click
   If menuActionTP_Spr_VrVisInst = "PRN" Then cmdTP_Spr_VrVisInstPrn_Click
   If menuActionTP_Spr_VrVisInst = "CFG" Then cmdTP_Spr_VrVisInstCfg_Click
   If menuActionTP_Spr_VrVisInst = "FND" Then cmdTP_Spr_VrVisInstFnd_Click
   If menuActionTP_Spr_VrVisInst = "ACC" Then cmdTP_Spr_VrVisInstAcc_Click
   menuActionTP_Spr_VrVisInst = ""
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

  LoadBtnPictures cmdTP_Spr_VrVisInstAdd, cmdTP_Spr_VrVisInstAdd.Tag
  LoadBtnPictures cmdTP_Spr_VrVisInstEdit, cmdTP_Spr_VrVisInstEdit.Tag
  LoadBtnPictures cmdTP_Spr_VrVisInstDel, cmdTP_Spr_VrVisInstDel.Tag
  LoadBtnPictures cmdTP_Spr_VrVisInstRef, cmdTP_Spr_VrVisInstRef.Tag
  LoadBtnPictures cmdTP_Spr_VrVisInstPrn, cmdTP_Spr_VrVisInstPrn.Tag
  LoadBtnPictures cmdTP_Spr_VrVisInstFnd, cmdTP_Spr_VrVisInstFnd.Tag
  LoadBtnPictures cmdTP_Spr_VrVisInstRun, cmdTP_Spr_VrVisInstRun.Tag
  LoadBtnPictures cmdTP_Spr_VrVisInstAcc, cmdTP_Spr_VrVisInstAcc.Tag
  LoadBtnPictures cmdTP_Spr_VrVisInstCfg, cmdTP_Spr_VrVisInstCfg.Tag
  Item.TP_Spr_VrVisInst.PrepareGrid gridTP_Spr_VrVisInst
  LoadGridLayout gridTP_Spr_VrVisInst
  Set fndTP_Spr_VrVisInst = Nothing
  On Error Resume Next
  Set fndTP_Spr_VrVisInst = CreateObject("MTZ_JSetup.GridFinder")
  fndTP_Spr_VrVisInst.Init gridTP_Spr_VrVisInst
End Sub

'�������� ��� ����������� ����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

      gridTP_Spr_VrVisInst.Top = 40 * Screen.TwipsPerPixelX
      gridTP_Spr_VrVisInst.Left = 5 * Screen.TwipsPerPixelX
      gridTP_Spr_VrVisInst.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridTP_Spr_VrVisInst.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridTP_Spr_VrVisInst.Top = 40 * Screen.TwipsPerPixelX
      gridTP_Spr_VrVisInst.Left = 5 * Screen.TwipsPerPixelX
      gridTP_Spr_VrVisInst.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridTP_Spr_VrVisInst.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlTP_Spr_VrVisInst.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndTP_Spr_VrVisInst = Nothing
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





