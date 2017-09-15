VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnPEKZ_1CLINK_path 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKZ_1CLINK 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKZ_1CLINK 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKZ_1CLINKFnd 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKZ_1CLINKPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKZ_1CLINKRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKZ_1CLINKDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKZ_1CLINKEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdPEKZ_1CLINKAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridPEKZ_1CLINK 
         Height          =   480
         Left            =   3900
         TabIndex        =   1
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         Version         =   "2.0"
         AutomaticSort   =   -1  'True
         RecordNavigatorString=   "Запись:|из"
         BoundColumnIndex=   ""
         ReplaceColumnIndex=   ""
         ScrollToolTipColumn=   ""
         TabKeyBehavior  =   1
         HideSelection   =   2
         SelectionStyle  =   1
         GroupByBoxInfoText=   "Группировка"
         AllowDelete     =   -1  'True
         AllowEdit       =   0   'False
         ItemCount       =   0
         DataMode        =   99
         ColumnHeaderHeight=   285
         IntProp1        =   0
         IntProp2        =   0
         IntProp7        =   0
         ColumnsCount    =   2
         Column(1)       =   "vpnPEKZ_1CLINK_path.ctx":0000
         Column(2)       =   "vpnPEKZ_1CLINK_path.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKZ_1CLINK_path.ctx":016C
         FormatStyle(2)  =   "vpnPEKZ_1CLINK_path.ctx":02C8
         FormatStyle(3)  =   "vpnPEKZ_1CLINK_path.ctx":0378
         FormatStyle(4)  =   "vpnPEKZ_1CLINK_path.ctx":042C
         FormatStyle(5)  =   "vpnPEKZ_1CLINK_path.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKZ_1CLINK_path.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupPEKZ_1CLINK 
      Caption         =   "Меню для Связь с 1С"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKZ_1CLINKAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKZ_1CLINKEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKZ_1CLINKDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKZ_1CLINKOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKZ_1CLINKRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKZ_1CLINKPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKZ_1CLINKCfg 
         Caption         =   "Настроить"
      End
   End
End
Attribute VB_Name = "vpnPEKZ_1CLINK_path"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKZ_1CLINK As Object
Private menuActionPEKZ_1CLINK As String





Private Sub cmdPEKZ_1CLINKCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKZ_1CLINK, "gridPEKZ_1CLINK"
Set jset = Nothing
End Sub

Private Sub cmdPEKZ_1CLINKPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKZ_1CLINK, "Связь с 1С"
Set jset = Nothing
End Sub

Private Sub cmdPEKZ_1CLINKRef_Click()
  On Error Resume Next
  item.PEKZ_1CLINK.Refresh
  gridPEKZ_1CLINK.ItemCount = item.PEKZ_1CLINK.Count
  gridPEKZ_1CLINK.Refetch
  gridPEKZ_1CLINK.Refresh
End Sub
Private Sub cmdPEKZ_1CLINKAcc_Click()
On Error Resume Next
If gridPEKZ_1CLINK.ItemCount = 0 Then Exit Sub
If gridPEKZ_1CLINK.Row > 0 Then
 If gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKZ_1CLINK.RowBookmark(gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKZ_1CLINKEdit_Click()
  On Error Resume Next
If gridPEKZ_1CLINK.ItemCount = 0 Then Exit Sub
If gridPEKZ_1CLINK.Row > 0 Then
 If gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKZ_1CLINK.RowBookmark(gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKZ_1CLINK_path.item = u
again:     frmPEKZ_1CLINK_path.NotFirstTime = False
    frmPEKZ_1CLINK_path.OnInit
    frmPEKZ_1CLINK_path.Show vbModal
    If frmPEKZ_1CLINK_path.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKZ_1CLINK.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKZ_1CLINKDel_Click()
  On Error Resume Next
  gridPEKZ_1CLINK.Delete
End Sub
Private Sub cmdPEKZ_1CLINKAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.PEKZ_1CLINK.Add()

      Set frmPEKZ_1CLINK_path.item = u
again:       frmPEKZ_1CLINK_path.NotFirstTime = False
      frmPEKZ_1CLINK_path.OnInit
      frmPEKZ_1CLINK_path.Show vbModal
      If frmPEKZ_1CLINK_path.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKZ_1CLINK.ItemCount = item.PEKZ_1CLINK.Count
        gridPEKZ_1CLINK.Refresh
        gridPEKZ_1CLINK.RefreshGroups
        gridPEKZ_1CLINK.RefreshSort
        gridPEKZ_1CLINK.MoveToBookmark u.ID & "PEKZ_1CLINK"
      Else
        item.PEKZ_1CLINK.Delete u.ID
        item.PEKZ_1CLINK.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKZ_1CLINKFnd_Click()
  On Error Resume Next
  fndPEKZ_1CLINK.ShowForm
End Sub
Private Sub cmdPEKZ_1CLINKRun_Click()
  On Error Resume Next
  gridPEKZ_1CLINK_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKZ_1CLINK_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.PEKZ_1CLINK.LoadRow gridPEKZ_1CLINK, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKZ_1CLINK_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKZ_1CLINK.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject("PEKZ_1CLINK", Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridPEKZ_1CLINK_DblClick()
  cmdPEKZ_1CLINKEdit_Click
End Sub
Private Sub gridPEKZ_1CLINK_KeyPress(KeyAscii As Integer)
  If gridPEKZ_1CLINK.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKZ_1CLINK.FindOnPress KeyAscii
End Sub

Private Sub gridPEKZ_1CLINK_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKZ_1CLINK.Row And LastRow > 0 Then
  gridPEKZ_1CLINK.GetRowData(LastRow).RowStyle = "Default"
  gridPEKZ_1CLINK.GetRowData(gridPEKZ_1CLINK.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKZ_1CLINKPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.PEKZ_1CLINK.Add()
    If GetFromBuffer(u) Then
      gridPEKZ_1CLINK.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKZ_1CLINK_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKZ_1CLINKCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKZ_1CLINK_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKZ_1CLINK
End If
End Sub
Private Sub mnuPEKZ_1CLINKAdd_click()
   menuActionPEKZ_1CLINK = "ADD"
   menuTimerPEKZ_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKZ_1CLINKEdit_click()
   menuActionPEKZ_1CLINK = "EDIT"
   menuTimerPEKZ_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKZ_1CLINKDelete_click()
   menuActionPEKZ_1CLINK = "DEL"
   menuTimerPEKZ_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKZ_1CLINKOpen_click()
   menuActionPEKZ_1CLINK = "RUN"
   menuTimerPEKZ_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKZ_1CLINKRef_click()
   menuActionPEKZ_1CLINK = "REF"
   menuTimerPEKZ_1CLINK.Enabled = True
End Sub
  Private Sub mnuPEKZ_1CLINKCOPY_Click()
    On Error Resume Next
    If gridPEKZ_1CLINK.ItemCount = 0 Then Exit Sub
    If gridPEKZ_1CLINK.Row > 0 Then
     If gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKZ_1CLINK.RowBookmark(gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKZ_1CLINKCUT_Click()
    On Error Resume Next
    If gridPEKZ_1CLINK.ItemCount = 0 Then Exit Sub
    If gridPEKZ_1CLINK.Row > 0 Then
     If gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKZ_1CLINK.RowBookmark(gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKZ_1CLINK.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKZ_1CLINKCHANGE_Click()
  On Error Resume Next
  If gridPEKZ_1CLINK.ItemCount = 0 Then Exit Sub
  If gridPEKZ_1CLINK.Row > 0 Then
   If gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKZ_1CLINK.RowBookmark(gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKZ_1CLINK.ItemCount = u.Parent.Count
      gridPEKZ_1CLINK.RefreshRowIndex gridPEKZ_1CLINK.RowIndex(gridPEKZ_1CLINK.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKZ_1CLINKCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKZ_1CLINKPrn_click()
   menuActionPEKZ_1CLINK = "PRN"
   menuTimerPEKZ_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKZ_1CLINKCfg_click()
   menuActionPEKZ_1CLINK = "CFG"
   menuTimerPEKZ_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKZ_1CLINKFind_click()
   menuActionPEKZ_1CLINK = "FND"
   menuTimerPEKZ_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKZ_1CLINKAcc_click()
   menuActionPEKZ_1CLINK = "ACC"
   menuTimerPEKZ_1CLINK.Enabled = True
End Sub
Private Sub menuTimerPEKZ_1CLINK_timer()
   menuTimerPEKZ_1CLINK.Enabled = False
   If menuActionPEKZ_1CLINK = "ADD" Then cmdPEKZ_1CLINKAdd_Click
   If menuActionPEKZ_1CLINK = "EDIT" Then cmdPEKZ_1CLINKEdit_Click
   If menuActionPEKZ_1CLINK = "DEL" Then cmdPEKZ_1CLINKDel_Click
   If menuActionPEKZ_1CLINK = "RUN" Then cmdPEKZ_1CLINKRun_Click
   If menuActionPEKZ_1CLINK = "REF" Then cmdPEKZ_1CLINKRef_Click
   If menuActionPEKZ_1CLINK = "PRN" Then cmdPEKZ_1CLINKPrn_Click
   If menuActionPEKZ_1CLINK = "CFG" Then cmdPEKZ_1CLINKCfg_Click
   If menuActionPEKZ_1CLINK = "FND" Then cmdPEKZ_1CLINKFnd_Click
   If menuActionPEKZ_1CLINK = "ACC" Then cmdPEKZ_1CLINKAcc_Click
   menuActionPEKZ_1CLINK = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKZ_1CLINKAdd, cmdPEKZ_1CLINKAdd.Tag
  LoadBtnPictures cmdPEKZ_1CLINKEdit, cmdPEKZ_1CLINKEdit.Tag
  LoadBtnPictures cmdPEKZ_1CLINKDel, cmdPEKZ_1CLINKDel.Tag
  LoadBtnPictures cmdPEKZ_1CLINKRef, cmdPEKZ_1CLINKRef.Tag
  LoadBtnPictures cmdPEKZ_1CLINKPrn, cmdPEKZ_1CLINKPrn.Tag
  LoadBtnPictures cmdPEKZ_1CLINKFnd, cmdPEKZ_1CLINKFnd.Tag
  item.PEKZ_1CLINK.PrepareGrid gridPEKZ_1CLINK
  LoadGridLayout gridPEKZ_1CLINK
  Set fndPEKZ_1CLINK = Nothing
  On Error Resume Next
  Set fndPEKZ_1CLINK = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKZ_1CLINK.Init gridPEKZ_1CLINK
End Sub
Private Sub OnTabClick()

      gridPEKZ_1CLINK.Top = 40 * Screen.TwipsPerPixelX
      gridPEKZ_1CLINK.Left = 5 * Screen.TwipsPerPixelX
      gridPEKZ_1CLINK.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKZ_1CLINK.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKZ_1CLINK.Top = 40 * Screen.TwipsPerPixelX
      gridPEKZ_1CLINK.Left = 5 * Screen.TwipsPerPixelX
      gridPEKZ_1CLINK.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKZ_1CLINK.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKZ_1CLINK.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndPEKZ_1CLINK = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
End Sub

'переместить клиента в каталоге
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
On Error Resume Next

'do nothing
End Sub



'Передать права объекту контактное лицо от объекта клиент
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для каталога клиентов
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT2", "Отчет " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2P", "Платеж " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2O", "Оплата " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'открытие карточки по идентификатору
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



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = item.Name
item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "Заявка " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.pekz_def.Add
 Else
  Set Obj = RowItem.TheDocument.pekz_def.item(1)
 End If
 
 Set Obj.ClientFrom = RowItem.Application
 Obj.QueryDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





