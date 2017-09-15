VERSION 5.00
Object = "{8408294B-9E97-428D-999B-82C43BF0BFFA}#3.0#0"; "JWRAP.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWFRtm_Param_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFRtm_Param 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFRtm_Param 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFRtm_ParamAcc 
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
      Begin VB.CommandButton cmdWFRtm_ParamFnd 
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
      Begin VB.CommandButton cmdWFRtm_ParamCfg 
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
      Begin VB.CommandButton cmdWFRtm_ParamPrn 
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
      Begin VB.CommandButton cmdWFRtm_ParamRef 
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
      Begin VB.CommandButton cmdWFRtm_ParamDel 
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
      Begin VB.CommandButton cmdWFRtm_ParamEdit 
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
      Begin VB.CommandButton cmdWFRtm_ParamAdd 
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
      Begin JWRAP.JanusWRAP gridWFRtm_Param 
         Height          =   480
         Left            =   3900
         TabIndex        =   1
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin MTZ_PANEL.DropButton cmdWFRtm_ParamRun 
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
   Begin VB.Menu mnuPopupWFRtm_Param 
      Caption         =   "���� ��� ���������"
      Visible         =   0   'False
      Begin VB.Menu mnuWFRtm_ParamAdd 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWFRtm_ParamEdit 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuWFRtm_ParamDelete 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWFRtm_ParamOpen 
         Caption         =   "�������"
      End
      Begin VB.Menu mnuWFRtm_ParamRef 
         Caption         =   "��������"
      End
      Begin VB.Menu mnuWFRtm_ParamS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFRtm_ParamBuffer 
         Caption         =   "�����"
         Begin VB.Menu mnuWFRtm_ParamCOPY 
            Caption         =   "����������"
         End
         Begin VB.Menu mnuWFRtm_ParamCUT 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWFRtm_ParamPASTE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWFRtm_ParamCHANGE 
            Caption         =   "��������"
         End
         Begin VB.Menu mnuWFRtm_ParamCLEAN 
            Caption         =   "��������"
         End
      End
      Begin VB.Menu mnuWFRtm_ParamPrn 
         Caption         =   "������"
      End
      Begin VB.Menu mnuWFRtm_ParamCfg 
         Caption         =   "���������"
      End
      Begin VB.Menu mnuWFRtm_ParamFind 
         Caption         =   "�����"
      End
      Begin VB.Menu mnuWFRtm_ParamAcc 
         Caption         =   "����� ������"
      End
   End
End
Attribute VB_Name = "vpnWFRtm_Param_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFRtm_Param As Object
Private menuActionWFRtm_Param As String


Private Sub cmdWFRtm_ParamCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFRtm_Param, "gridWFRtm_Param"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_ParamPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFRtm_Param, "���������"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_ParamRef_Click()
  On Error Resume Next
  Item.WFRtm_Param.Refresh
  gridWFRtm_Param.ItemCount = Item.WFRtm_Param.Count
  gridWFRtm_Param.Refetch
  gridWFRtm_Param.Refresh
End Sub
Private Sub cmdWFRtm_ParamAcc_Click()
On Error Resume Next
If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
If gridWFRtm_Param.Row > 0 Then
 If gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Param.RowBookmark(gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFRtm_ParamEdit_Click()
  On Error Resume Next
If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
If gridWFRtm_Param.Row > 0 Then
 If gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Param.RowBookmark(gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFRtm_Param_.Item = u
again:     frmWFRtm_Param_.NotFirstTime = False
    frmWFRtm_Param_.OnInit
    frmWFRtm_Param_.Show vbModal
    If frmWFRtm_Param_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "���������"
      GoTo again
    End If
    gridWFRtm_Param.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFRtm_ParamDel_Click()
  On Error Resume Next
  gridWFRtm_Param.Delete
End Sub
Private Sub cmdWFRtm_ParamAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFRtm_Param.Add()

      Set frmWFRtm_Param_.Item = u
again:       frmWFRtm_Param_.NotFirstTime = False
      frmWFRtm_Param_.OnInit
      frmWFRtm_Param_.Show vbModal
      If frmWFRtm_Param_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "��������"
          GoTo again
        End If
        gridWFRtm_Param.ItemCount = Item.WFRtm_Param.Count
        gridWFRtm_Param.Refresh
        gridWFRtm_Param.RefreshGroups
        gridWFRtm_Param.RefreshSort
        gridWFRtm_Param.MoveToBookmark u.ID & "WFRtm_Param"
      Else
        Item.WFRtm_Param.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "��������"
End Sub
Private Sub cmdWFRtm_ParamFnd_Click()
  On Error Resume Next
  fndWFRtm_Param.ShowForm
End Sub
Private Sub cmdWFRtm_ParamRun_Click()
  On Error Resume Next
  gridWFRtm_Param_JWDblClick
End Sub
Private Sub gridWFRtm_Param_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFRtm_Param.LoadRow gridWFRtm_Param, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFRtm_Param_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFRtm_Param", Left(Bookmark, 38))
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
   MsgBox Err.Description, vbOKOnly + vbExclamation, "��������"
End Sub

Private Sub gridWFRtm_Param_JWDblClick()
  cmdWFRtm_ParamEdit_Click
End Sub
Private Sub gridWFRtm_Param_JWKeyPress(KeyAscii As Integer)
  If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFRtm_Param.FindOnPress KeyAscii
End Sub

Private Sub gridWFRtm_Param_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFRtm_Param.Row And LastRow > 0 Then
  gridWFRtm_Param.GetRowData(LastRow).RowStyle = "Default"
  gridWFRtm_Param.GetRowData(gridWFRtm_Param.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFRtm_ParamPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFRtm_Param.Add()
    If GetFromBuffer(u) Then
      gridWFRtm_Param.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFRtm_Param_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFRtm_Param
End If
End Sub
Private Sub mnuWFRtm_ParamAdd_click()
   menuActionWFRtm_Param = "ADD"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamEdit_click()
   menuActionWFRtm_Param = "EDIT"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamDelete_click()
   menuActionWFRtm_Param = "DEL"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamOpen_click()
   menuActionWFRtm_Param = "RUN"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamRef_click()
   menuActionWFRtm_Param = "REF"
   menuTimerWFRtm_Param.Enabled = True
End Sub
  Private Sub mnuWFRtm_ParamCOPY_Click()
    On Error Resume Next
    If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
    If gridWFRtm_Param.Row > 0 Then
     If gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_Param.RowBookmark(gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFRtm_ParamCUT_Click()
    On Error Resume Next
    If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
    If gridWFRtm_Param.Row > 0 Then
     If gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_Param.RowBookmark(gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFRtm_Param.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFRtm_ParamCHANGE_Click()
  On Error Resume Next
  If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
  If gridWFRtm_Param.Row > 0 Then
   If gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Param.RowBookmark(gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFRtm_Param.ItemCount = u.Parent.Count
      gridWFRtm_Param.RefreshRowIndex gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFRtm_ParamCLEAN_Click()
    Item.manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFRtm_ParamPrn_click()
   menuActionWFRtm_Param = "PRN"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamCfg_click()
   menuActionWFRtm_Param = "CFG"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamFind_click()
   menuActionWFRtm_Param = "FND"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamAcc_click()
   menuActionWFRtm_Param = "ACC"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub menuTimerWFRtm_Param_timer()
   menuTimerWFRtm_Param.Enabled = False
   If menuActionWFRtm_Param = "ADD" Then cmdWFRtm_ParamAdd_Click
   If menuActionWFRtm_Param = "EDIT" Then cmdWFRtm_ParamEdit_Click
   If menuActionWFRtm_Param = "DEL" Then cmdWFRtm_ParamDel_Click
   If menuActionWFRtm_Param = "RUN" Then cmdWFRtm_ParamRun_Click
   If menuActionWFRtm_Param = "REF" Then cmdWFRtm_ParamRef_Click
   If menuActionWFRtm_Param = "PRN" Then cmdWFRtm_ParamPrn_Click
   If menuActionWFRtm_Param = "CFG" Then cmdWFRtm_ParamCfg_Click
   If menuActionWFRtm_Param = "FND" Then cmdWFRtm_ParamFnd_Click
   If menuActionWFRtm_Param = "ACC" Then cmdWFRtm_ParamAcc_Click
   menuActionWFRtm_Param = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFRtm_ParamAdd, cmdWFRtm_ParamAdd.Tag
  LoadBtnPictures cmdWFRtm_ParamEdit, cmdWFRtm_ParamEdit.Tag
  LoadBtnPictures cmdWFRtm_ParamDel, cmdWFRtm_ParamDel.Tag
  LoadBtnPictures cmdWFRtm_ParamRef, cmdWFRtm_ParamRef.Tag
  LoadBtnPictures cmdWFRtm_ParamCfg, cmdWFRtm_ParamCfg.Tag
  LoadBtnPictures cmdWFRtm_ParamPrn, cmdWFRtm_ParamPrn.Tag
  LoadBtnPictures cmdWFRtm_ParamFnd, cmdWFRtm_ParamFnd.Tag
  LoadBtnPictures cmdWFRtm_ParamRun, cmdWFRtm_ParamRun.Tag
  LoadBtnPictures cmdWFRtm_ParamAcc, cmdWFRtm_ParamAcc.Tag
  Item.WFRtm_Param.PrepareGrid gridWFRtm_Param
  LoadGridLayout gridWFRtm_Param
  Set fndWFRtm_Param = Nothing
  On Error Resume Next
  Set fndWFRtm_Param = CreateObject("MTZ_JSetup.GridFinder")
  fndWFRtm_Param.Init gridWFRtm_Param
End Sub
Private Sub OnTabClick()

      gridWFRtm_Param.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFRtm_Param.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWFRtm_Param.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWFRtm_Param = Nothing
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

  RowItem.Person.Secure Item.SecureStyleID
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "�������� ����� ������"
End Sub



'��������� ����� ������ ��� ������� ������������ ���  �������� ��������
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "�������� ����� ������"
End Sub



'�������� ������ �� ������ ��������
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
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

End Sub



'�������� �������� �� ��������������
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
On Error Resume Next
If ID <> "" Then
    Dim Obj As Object
    Set Obj = Item.manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = Item.manager.GetInstanceGUI(Obj.ID)
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
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'�������� �������� �������
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
Item.Name = Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



