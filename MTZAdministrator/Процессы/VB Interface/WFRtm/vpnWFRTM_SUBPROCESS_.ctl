VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnWFRTM_SUBPROCESS_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFRTM_SUBPROCESS 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFRTM_SUBPROCESS 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFRTM_SUBPROCESSFnd 
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
      Begin VB.CommandButton cmdWFRTM_SUBPROCESSPrn 
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
      Begin VB.CommandButton cmdWFRTM_SUBPROCESSRef 
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
      Begin VB.CommandButton cmdWFRTM_SUBPROCESSDel 
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
      Begin VB.CommandButton cmdWFRTM_SUBPROCESSEdit 
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
      Begin VB.CommandButton cmdWFRTM_SUBPROCESSAdd 
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
      Begin GridEX20.GridEX gridWFRTM_SUBPROCESS 
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
         Column(1)       =   "vpnWFRTM_SUBPROCESS_.ctx":0000
         Column(2)       =   "vpnWFRTM_SUBPROCESS_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFRTM_SUBPROCESS_.ctx":016C
         FormatStyle(2)  =   "vpnWFRTM_SUBPROCESS_.ctx":02C8
         FormatStyle(3)  =   "vpnWFRTM_SUBPROCESS_.ctx":0378
         FormatStyle(4)  =   "vpnWFRTM_SUBPROCESS_.ctx":042C
         FormatStyle(5)  =   "vpnWFRTM_SUBPROCESS_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWFRTM_SUBPROCESS_.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupWFRTM_SUBPROCESS 
      Caption         =   "Меню для Подпроцессы"
      Visible         =   0   'False
      Begin VB.Menu mnuWFRTM_SUBPROCESSAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFRTM_SUBPROCESSEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFRTM_SUBPROCESSDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFRTM_SUBPROCESSOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFRTM_SUBPROCESSRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFRTM_SUBPROCESSS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFRTM_SUBPROCESSBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFRTM_SUBPROCESSCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFRTM_SUBPROCESSCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFRTM_SUBPROCESSPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFRTM_SUBPROCESSCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFRTM_SUBPROCESSCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFRTM_SUBPROCESSPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFRTM_SUBPROCESSCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFRTM_SUBPROCESSFind 
         Caption         =   "Поиск"
      End
   End
End
Attribute VB_Name = "vpnWFRTM_SUBPROCESS_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFRTM_SUBPROCESS As Object
Private menuActionWFRTM_SUBPROCESS As String





Private Sub cmdWFRTM_SUBPROCESSCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFRTM_SUBPROCESS, "gridWFRTM_SUBPROCESS"
Set jset = Nothing
End Sub

Private Sub cmdWFRTM_SUBPROCESSPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFRTM_SUBPROCESS, "Подпроцессы"
Set jset = Nothing
End Sub

Private Sub cmdWFRTM_SUBPROCESSRef_Click()
  On Error Resume Next
  Item.WFRTM_SUBPROCESS.Refresh
  gridWFRTM_SUBPROCESS.ItemCount = Item.WFRTM_SUBPROCESS.Count
  gridWFRTM_SUBPROCESS.Refetch
  gridWFRTM_SUBPROCESS.Refresh
End Sub
Private Sub cmdWFRTM_SUBPROCESSAcc_Click()
On Error Resume Next
If gridWFRTM_SUBPROCESS.ItemCount = 0 Then Exit Sub
If gridWFRTM_SUBPROCESS.Row > 0 Then
 If gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRTM_SUBPROCESS.RowBookmark(gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFRTM_SUBPROCESSEdit_Click()
  On Error Resume Next
If gridWFRTM_SUBPROCESS.ItemCount = 0 Then Exit Sub
If gridWFRTM_SUBPROCESS.Row > 0 Then
 If gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRTM_SUBPROCESS.RowBookmark(gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFRTM_SUBPROCESS_.Item = u
again:     frmWFRTM_SUBPROCESS_.NotFirstTime = False
    frmWFRTM_SUBPROCESS_.OnInit
    frmWFRTM_SUBPROCESS_.Show vbModal
    If frmWFRTM_SUBPROCESS_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFRTM_SUBPROCESS.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFRTM_SUBPROCESSDel_Click()
  On Error Resume Next
  gridWFRTM_SUBPROCESS.Delete
End Sub
Private Sub cmdWFRTM_SUBPROCESSAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFRTM_SUBPROCESS.Add()

      Set frmWFRTM_SUBPROCESS_.Item = u
again:       frmWFRTM_SUBPROCESS_.NotFirstTime = False
      frmWFRTM_SUBPROCESS_.OnInit
      frmWFRTM_SUBPROCESS_.Show vbModal
      If frmWFRTM_SUBPROCESS_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFRTM_SUBPROCESS.ItemCount = Item.WFRTM_SUBPROCESS.Count
        gridWFRTM_SUBPROCESS.Refresh
        gridWFRTM_SUBPROCESS.RefreshGroups
        gridWFRTM_SUBPROCESS.RefreshSort
        gridWFRTM_SUBPROCESS.MoveToBookmark u.ID & "WFRTM_SUBPROCESS"
      Else
        Item.WFRTM_SUBPROCESS.Delete u.ID
        Item.WFRTM_SUBPROCESS.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFRTM_SUBPROCESSFnd_Click()
  On Error Resume Next
  fndWFRTM_SUBPROCESS.ShowForm
End Sub
Private Sub cmdWFRTM_SUBPROCESSRun_Click()
  On Error Resume Next
  gridWFRTM_SUBPROCESS_DblClick
End Sub
Private Sub gridWFRTM_SUBPROCESS_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WFRTM_SUBPROCESS.LoadRow gridWFRTM_SUBPROCESS, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFRTM_SUBPROCESS_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFRTM_SUBPROCESS.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFRTM_SUBPROCESS", Left(Bookmark, 38))
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
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridWFRTM_SUBPROCESS_DblClick()
  cmdWFRTM_SUBPROCESSEdit_Click
End Sub
Private Sub gridWFRTM_SUBPROCESS_KeyPress(KeyAscii As Integer)
  If gridWFRTM_SUBPROCESS.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFRTM_SUBPROCESS.FindOnPress KeyAscii
End Sub

Private Sub gridWFRTM_SUBPROCESS_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFRTM_SUBPROCESS.Row And LastRow > 0 Then
  gridWFRTM_SUBPROCESS.GetRowData(LastRow).RowStyle = "Default"
  gridWFRTM_SUBPROCESS.GetRowData(gridWFRTM_SUBPROCESS.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFRTM_SUBPROCESSPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFRTM_SUBPROCESS.Add()
    If GetFromBuffer(u) Then
      gridWFRTM_SUBPROCESS.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridWFRTM_SUBPROCESS_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFRTM_SUBPROCESSCfg_Click
        End If
    End If
End Sub

Private Sub gridWFRTM_SUBPROCESS_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFRTM_SUBPROCESS
End If
End Sub
Private Sub mnuWFRTM_SUBPROCESSAdd_click()
   menuActionWFRTM_SUBPROCESS = "ADD"
   menuTimerWFRTM_SUBPROCESS.Enabled = True
End Sub
Private Sub mnuWFRTM_SUBPROCESSEdit_click()
   menuActionWFRTM_SUBPROCESS = "EDIT"
   menuTimerWFRTM_SUBPROCESS.Enabled = True
End Sub
Private Sub mnuWFRTM_SUBPROCESSDelete_click()
   menuActionWFRTM_SUBPROCESS = "DEL"
   menuTimerWFRTM_SUBPROCESS.Enabled = True
End Sub
Private Sub mnuWFRTM_SUBPROCESSOpen_click()
   menuActionWFRTM_SUBPROCESS = "RUN"
   menuTimerWFRTM_SUBPROCESS.Enabled = True
End Sub
Private Sub mnuWFRTM_SUBPROCESSRef_click()
   menuActionWFRTM_SUBPROCESS = "REF"
   menuTimerWFRTM_SUBPROCESS.Enabled = True
End Sub
  Private Sub mnuWFRTM_SUBPROCESSCOPY_Click()
    On Error Resume Next
    If gridWFRTM_SUBPROCESS.ItemCount = 0 Then Exit Sub
    If gridWFRTM_SUBPROCESS.Row > 0 Then
     If gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRTM_SUBPROCESS.RowBookmark(gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFRTM_SUBPROCESSCUT_Click()
    On Error Resume Next
    If gridWFRTM_SUBPROCESS.ItemCount = 0 Then Exit Sub
    If gridWFRTM_SUBPROCESS.Row > 0 Then
     If gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRTM_SUBPROCESS.RowBookmark(gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFRTM_SUBPROCESS.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFRTM_SUBPROCESSCHANGE_Click()
  On Error Resume Next
  If gridWFRTM_SUBPROCESS.ItemCount = 0 Then Exit Sub
  If gridWFRTM_SUBPROCESS.Row > 0 Then
   If gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRTM_SUBPROCESS.RowBookmark(gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFRTM_SUBPROCESS.ItemCount = u.Parent.Count
      gridWFRTM_SUBPROCESS.RefreshRowIndex gridWFRTM_SUBPROCESS.RowIndex(gridWFRTM_SUBPROCESS.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFRTM_SUBPROCESSCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFRTM_SUBPROCESSPrn_click()
   menuActionWFRTM_SUBPROCESS = "PRN"
   menuTimerWFRTM_SUBPROCESS.Enabled = True
End Sub
Private Sub mnuWFRTM_SUBPROCESSCfg_click()
   menuActionWFRTM_SUBPROCESS = "CFG"
   menuTimerWFRTM_SUBPROCESS.Enabled = True
End Sub
Private Sub mnuWFRTM_SUBPROCESSFind_click()
   menuActionWFRTM_SUBPROCESS = "FND"
   menuTimerWFRTM_SUBPROCESS.Enabled = True
End Sub
Private Sub mnuWFRTM_SUBPROCESSAcc_click()
   menuActionWFRTM_SUBPROCESS = "ACC"
   menuTimerWFRTM_SUBPROCESS.Enabled = True
End Sub
Private Sub menuTimerWFRTM_SUBPROCESS_timer()
   menuTimerWFRTM_SUBPROCESS.Enabled = False
   If menuActionWFRTM_SUBPROCESS = "ADD" Then cmdWFRTM_SUBPROCESSAdd_Click
   If menuActionWFRTM_SUBPROCESS = "EDIT" Then cmdWFRTM_SUBPROCESSEdit_Click
   If menuActionWFRTM_SUBPROCESS = "DEL" Then cmdWFRTM_SUBPROCESSDel_Click
   If menuActionWFRTM_SUBPROCESS = "RUN" Then cmdWFRTM_SUBPROCESSRun_Click
   If menuActionWFRTM_SUBPROCESS = "REF" Then cmdWFRTM_SUBPROCESSRef_Click
   If menuActionWFRTM_SUBPROCESS = "PRN" Then cmdWFRTM_SUBPROCESSPrn_Click
   If menuActionWFRTM_SUBPROCESS = "CFG" Then cmdWFRTM_SUBPROCESSCfg_Click
   If menuActionWFRTM_SUBPROCESS = "FND" Then cmdWFRTM_SUBPROCESSFnd_Click
   If menuActionWFRTM_SUBPROCESS = "ACC" Then cmdWFRTM_SUBPROCESSAcc_Click
   menuActionWFRTM_SUBPROCESS = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFRTM_SUBPROCESSAdd, cmdWFRTM_SUBPROCESSAdd.Tag
  LoadBtnPictures cmdWFRTM_SUBPROCESSEdit, cmdWFRTM_SUBPROCESSEdit.Tag
  LoadBtnPictures cmdWFRTM_SUBPROCESSDel, cmdWFRTM_SUBPROCESSDel.Tag
  LoadBtnPictures cmdWFRTM_SUBPROCESSRef, cmdWFRTM_SUBPROCESSRef.Tag
  LoadBtnPictures cmdWFRTM_SUBPROCESSPrn, cmdWFRTM_SUBPROCESSPrn.Tag
  LoadBtnPictures cmdWFRTM_SUBPROCESSFnd, cmdWFRTM_SUBPROCESSFnd.Tag
  Item.WFRTM_SUBPROCESS.PrepareGrid gridWFRTM_SUBPROCESS
  LoadGridLayout gridWFRTM_SUBPROCESS
  Set fndWFRTM_SUBPROCESS = Nothing
  On Error Resume Next
  Set fndWFRTM_SUBPROCESS = CreateObject("MTZ_JSetup.GridFinder")
  fndWFRTM_SUBPROCESS.Init gridWFRTM_SUBPROCESS
End Sub
Private Sub OnTabClick()

      gridWFRTM_SUBPROCESS.Top = 40 * Screen.TwipsPerPixelX
      gridWFRTM_SUBPROCESS.Left = 5 * Screen.TwipsPerPixelX
      gridWFRTM_SUBPROCESS.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFRTM_SUBPROCESS.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFRTM_SUBPROCESS.Top = 40 * Screen.TwipsPerPixelX
      gridWFRTM_SUBPROCESS.Left = 5 * Screen.TwipsPerPixelX
      gridWFRTM_SUBPROCESS.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFRTM_SUBPROCESS.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWFRTM_SUBPROCESS.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWFRTM_SUBPROCESS = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
End Sub

'переместить клиента в каталоге
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
'do nothing
End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для каталога клиентов
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKP", "Платеж " & Date)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKO", "Оплата " & Date)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'открытие карточки по идентификатору
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



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next
Item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "Заявка " & Date)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





