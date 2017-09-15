VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWEBSDIC_QTYPE_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWEBSDIC_QTYPE 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWEBSDIC_QTYPE 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWEBSDIC_QTYPEAcc 
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
      Begin VB.CommandButton cmdWEBSDIC_QTYPEFnd 
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
      Begin VB.CommandButton cmdWEBSDIC_QTYPECfg 
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
      Begin VB.CommandButton cmdWEBSDIC_QTYPEPrn 
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
      Begin VB.CommandButton cmdWEBSDIC_QTYPERef 
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
      Begin VB.CommandButton cmdWEBSDIC_QTYPEDel 
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
      Begin VB.CommandButton cmdWEBSDIC_QTYPEEdit 
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
      Begin VB.CommandButton cmdWEBSDIC_QTYPEAdd 
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
      Begin GridEX20.GridEX gridWEBSDIC_QTYPE 
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
         Column(1)       =   "vpnWEBSDIC_QTYPE_.ctx":0000
         Column(2)       =   "vpnWEBSDIC_QTYPE_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWEBSDIC_QTYPE_.ctx":016C
         FormatStyle(2)  =   "vpnWEBSDIC_QTYPE_.ctx":02C8
         FormatStyle(3)  =   "vpnWEBSDIC_QTYPE_.ctx":0378
         FormatStyle(4)  =   "vpnWEBSDIC_QTYPE_.ctx":042C
         FormatStyle(5)  =   "vpnWEBSDIC_QTYPE_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWEBSDIC_QTYPE_.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdWEBSDIC_QTYPERun 
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
   Begin VB.Menu mnuPopupWEBSDIC_QTYPE 
      Caption         =   "���� ��� ��� ������� � ������"
      Visible         =   0   'False
      Begin VB.Menu mnuWEBSDIC_QTYPEAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWEBSDIC_QTYPEEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuWEBSDIC_QTYPEDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWEBSDIC_QTYPEOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWEBSDIC_QTYPERef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuWEBSDIC_QTYPES1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWEBSDIC_QTYPEBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuWEBSDIC_QTYPECOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuWEBSDIC_QTYPECUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWEBSDIC_QTYPEPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWEBSDIC_QTYPECHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWEBSDIC_QTYPECLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuWEBSDIC_QTYPEPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuWEBSDIC_QTYPECfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuWEBSDIC_QTYPEFind 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuWEBSDIC_QTYPEAcc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnWEBSDIC_QTYPE_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ ��� ������ �� �������� �������
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWEBSDIC_QTYPE As Object
Private menuActionWEBSDIC_QTYPE As String





Private Sub cmdWEBSDIC_QTYPECfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWEBSDIC_QTYPE, "gridWEBSDIC_QTYPE"
Set jset = Nothing
End Sub

Private Sub cmdWEBSDIC_QTYPEPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWEBSDIC_QTYPE, "��� ������� � ������"
Set jset = Nothing
End Sub

Private Sub cmdWEBSDIC_QTYPERef_Click()
  On Error Resume Next
  Item.WEBSDIC_QTYPE.Refresh
  gridWEBSDIC_QTYPE.ItemCount = Item.WEBSDIC_QTYPE.Count
  gridWEBSDIC_QTYPE.Refetch
  gridWEBSDIC_QTYPE.Refresh
End Sub
Private Sub cmdWEBSDIC_QTYPEAcc_Click()
On Error Resume Next
If gridWEBSDIC_QTYPE.ItemCount = 0 Then Exit Sub
If gridWEBSDIC_QTYPE.Row > 0 Then
 If gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWEBSDIC_QTYPE.RowBookmark(gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWEBSDIC_QTYPEEdit_Click()
  On Error Resume Next
If gridWEBSDIC_QTYPE.ItemCount = 0 Then Exit Sub
If gridWEBSDIC_QTYPE.Row > 0 Then
 If gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWEBSDIC_QTYPE.RowBookmark(gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWEBSDIC_QTYPE_.Item = u
again:     frmWEBSDIC_QTYPE_.NotFirstTime = False
    frmWEBSDIC_QTYPE_.OnInit
    frmWEBSDIC_QTYPE_.Show vbModal
    If frmWEBSDIC_QTYPE_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridWEBSDIC_QTYPE.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWEBSDIC_QTYPEDel_Click()
  On Error Resume Next
  gridWEBSDIC_QTYPE.Delete
End Sub
Private Sub cmdWEBSDIC_QTYPEAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WEBSDIC_QTYPE.Add()

      Set frmWEBSDIC_QTYPE_.Item = u
again:       frmWEBSDIC_QTYPE_.NotFirstTime = False
      frmWEBSDIC_QTYPE_.OnInit
      frmWEBSDIC_QTYPE_.Show vbModal
      If frmWEBSDIC_QTYPE_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridWEBSDIC_QTYPE.ItemCount = Item.WEBSDIC_QTYPE.Count
        gridWEBSDIC_QTYPE.Refresh
        gridWEBSDIC_QTYPE.RefreshGroups
        gridWEBSDIC_QTYPE.RefreshSort
        gridWEBSDIC_QTYPE.MoveToBookmark u.ID & "WEBSDIC_QTYPE"
      Else
        Item.WEBSDIC_QTYPE.Delete u.ID
        Item.WEBSDIC_QTYPE.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdWEBSDIC_QTYPEFnd_Click()
  On Error Resume Next
  fndWEBSDIC_QTYPE.ShowForm
End Sub
Private Sub cmdWEBSDIC_QTYPERun_Click()
  On Error Resume Next
  gridWEBSDIC_QTYPE_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridWEBSDIC_QTYPE_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WEBSDIC_QTYPE.LoadRow gridWEBSDIC_QTYPE, RowIndex, Bookmark, Values
End Sub
Private Sub gridWEBSDIC_QTYPE_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWEBSDIC_QTYPE.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WEBSDIC_QTYPE", Left(Bookmark, 38))
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

Private Sub gridWEBSDIC_QTYPE_DblClick()
  cmdWEBSDIC_QTYPEEdit_Click
End Sub
Private Sub gridWEBSDIC_QTYPE_KeyPress(KeyAscii As Integer)
  If gridWEBSDIC_QTYPE.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWEBSDIC_QTYPE.FindOnPress KeyAscii
End Sub

Private Sub gridWEBSDIC_QTYPE_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWEBSDIC_QTYPE.Row And LastRow > 0 Then
  gridWEBSDIC_QTYPE.GetRowData(LastRow).RowStyle = "Default"
  gridWEBSDIC_QTYPE.GetRowData(gridWEBSDIC_QTYPE.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWEBSDIC_QTYPEPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WEBSDIC_QTYPE.Add()
    If GetFromBuffer(u) Then
      gridWEBSDIC_QTYPE.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridWEBSDIC_QTYPE_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWEBSDIC_QTYPECfg_Click
        End If
    End If
End Sub

Private Sub gridWEBSDIC_QTYPE_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWEBSDIC_QTYPE
End If
End Sub
Private Sub mnuWEBSDIC_QTYPEAdd_click()
   menuActionWEBSDIC_QTYPE = "ADD"
   menuTimerWEBSDIC_QTYPE.Enabled = True
End Sub
Private Sub mnuWEBSDIC_QTYPEEdit_click()
   menuActionWEBSDIC_QTYPE = "EDIT"
   menuTimerWEBSDIC_QTYPE.Enabled = True
End Sub
Private Sub mnuWEBSDIC_QTYPEDelete_click()
   menuActionWEBSDIC_QTYPE = "DEL"
   menuTimerWEBSDIC_QTYPE.Enabled = True
End Sub
Private Sub mnuWEBSDIC_QTYPEOpen_click()
   menuActionWEBSDIC_QTYPE = "RUN"
   menuTimerWEBSDIC_QTYPE.Enabled = True
End Sub
Private Sub mnuWEBSDIC_QTYPERef_click()
   menuActionWEBSDIC_QTYPE = "REF"
   menuTimerWEBSDIC_QTYPE.Enabled = True
End Sub
  Private Sub mnuWEBSDIC_QTYPECOPY_Click()
    On Error Resume Next
    If gridWEBSDIC_QTYPE.ItemCount = 0 Then Exit Sub
    If gridWEBSDIC_QTYPE.Row > 0 Then
     If gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWEBSDIC_QTYPE.RowBookmark(gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWEBSDIC_QTYPECUT_Click()
    On Error Resume Next
    If gridWEBSDIC_QTYPE.ItemCount = 0 Then Exit Sub
    If gridWEBSDIC_QTYPE.Row > 0 Then
     If gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWEBSDIC_QTYPE.RowBookmark(gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWEBSDIC_QTYPE.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWEBSDIC_QTYPECHANGE_Click()
  On Error Resume Next
  If gridWEBSDIC_QTYPE.ItemCount = 0 Then Exit Sub
  If gridWEBSDIC_QTYPE.Row > 0 Then
   If gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWEBSDIC_QTYPE.RowBookmark(gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWEBSDIC_QTYPE.ItemCount = u.Parent.Count
      gridWEBSDIC_QTYPE.RefreshRowIndex gridWEBSDIC_QTYPE.RowIndex(gridWEBSDIC_QTYPE.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWEBSDIC_QTYPECLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWEBSDIC_QTYPEPrn_click()
   menuActionWEBSDIC_QTYPE = "PRN"
   menuTimerWEBSDIC_QTYPE.Enabled = True
End Sub
Private Sub mnuWEBSDIC_QTYPECfg_click()
   menuActionWEBSDIC_QTYPE = "CFG"
   menuTimerWEBSDIC_QTYPE.Enabled = True
End Sub
Private Sub mnuWEBSDIC_QTYPEFind_click()
   menuActionWEBSDIC_QTYPE = "FND"
   menuTimerWEBSDIC_QTYPE.Enabled = True
End Sub
Private Sub mnuWEBSDIC_QTYPEAcc_click()
   menuActionWEBSDIC_QTYPE = "ACC"
   menuTimerWEBSDIC_QTYPE.Enabled = True
End Sub
Private Sub menuTimerWEBSDIC_QTYPE_timer()
   menuTimerWEBSDIC_QTYPE.Enabled = False
   If menuActionWEBSDIC_QTYPE = "ADD" Then cmdWEBSDIC_QTYPEAdd_Click
   If menuActionWEBSDIC_QTYPE = "EDIT" Then cmdWEBSDIC_QTYPEEdit_Click
   If menuActionWEBSDIC_QTYPE = "DEL" Then cmdWEBSDIC_QTYPEDel_Click
   If menuActionWEBSDIC_QTYPE = "RUN" Then cmdWEBSDIC_QTYPERun_Click
   If menuActionWEBSDIC_QTYPE = "REF" Then cmdWEBSDIC_QTYPERef_Click
   If menuActionWEBSDIC_QTYPE = "PRN" Then cmdWEBSDIC_QTYPEPrn_Click
   If menuActionWEBSDIC_QTYPE = "CFG" Then cmdWEBSDIC_QTYPECfg_Click
   If menuActionWEBSDIC_QTYPE = "FND" Then cmdWEBSDIC_QTYPEFnd_Click
   If menuActionWEBSDIC_QTYPE = "ACC" Then cmdWEBSDIC_QTYPEAcc_Click
   menuActionWEBSDIC_QTYPE = ""
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

  LoadBtnPictures cmdWEBSDIC_QTYPEAdd, cmdWEBSDIC_QTYPEAdd.Tag
  LoadBtnPictures cmdWEBSDIC_QTYPEEdit, cmdWEBSDIC_QTYPEEdit.Tag
  LoadBtnPictures cmdWEBSDIC_QTYPEDel, cmdWEBSDIC_QTYPEDel.Tag
  LoadBtnPictures cmdWEBSDIC_QTYPERef, cmdWEBSDIC_QTYPERef.Tag
  LoadBtnPictures cmdWEBSDIC_QTYPEPrn, cmdWEBSDIC_QTYPEPrn.Tag
  LoadBtnPictures cmdWEBSDIC_QTYPEFnd, cmdWEBSDIC_QTYPEFnd.Tag
  LoadBtnPictures cmdWEBSDIC_QTYPERun, cmdWEBSDIC_QTYPERun.Tag
  LoadBtnPictures cmdWEBSDIC_QTYPEAcc, cmdWEBSDIC_QTYPEAcc.Tag
  LoadBtnPictures cmdWEBSDIC_QTYPECfg, cmdWEBSDIC_QTYPECfg.Tag
  Item.WEBSDIC_QTYPE.PrepareGrid gridWEBSDIC_QTYPE
  LoadGridLayout gridWEBSDIC_QTYPE
  Set fndWEBSDIC_QTYPE = Nothing
  On Error Resume Next
  Set fndWEBSDIC_QTYPE = CreateObject("MTZ_JSetup.GridFinder")
  fndWEBSDIC_QTYPE.Init gridWEBSDIC_QTYPE
End Sub

'�������� ��� ����������� ����
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

      gridWEBSDIC_QTYPE.Top = 40 * Screen.TwipsPerPixelX
      gridWEBSDIC_QTYPE.Left = 5 * Screen.TwipsPerPixelX
      gridWEBSDIC_QTYPE.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWEBSDIC_QTYPE.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWEBSDIC_QTYPE.Top = 40 * Screen.TwipsPerPixelX
      gridWEBSDIC_QTYPE.Left = 5 * Screen.TwipsPerPixelX
      gridWEBSDIC_QTYPE.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWEBSDIC_QTYPE.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWEBSDIC_QTYPE.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndWEBSDIC_QTYPE = Nothing
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





