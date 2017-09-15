VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnWFDef_param_M0 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFDef_param 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFDef_param 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFDef_paramFnd 
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
      Begin VB.CommandButton cmdWFDef_paramPrn 
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
      Begin VB.CommandButton cmdWFDef_paramRef 
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
      Begin VB.CommandButton cmdWFDef_paramDel 
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
      Begin VB.CommandButton cmdWFDef_paramEdit 
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
      Begin VB.CommandButton cmdWFDef_paramAdd 
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
      Begin GridEX20.GridEX gridWFDef_param 
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
         Column(1)       =   "vpnWFDef_param_M0.ctx":0000
         Column(2)       =   "vpnWFDef_param_M0.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFDef_param_M0.ctx":016C
         FormatStyle(2)  =   "vpnWFDef_param_M0.ctx":02C8
         FormatStyle(3)  =   "vpnWFDef_param_M0.ctx":0378
         FormatStyle(4)  =   "vpnWFDef_param_M0.ctx":042C
         FormatStyle(5)  =   "vpnWFDef_param_M0.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWFDef_param_M0.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupWFDef_param 
      Caption         =   "Меню для Параметры и переменные"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDef_paramAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDef_paramEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDef_paramDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDef_paramOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDef_paramRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDef_paramS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDef_paramBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDef_paramCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDef_paramCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDef_paramPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDef_paramCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDef_paramCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDef_paramPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDef_paramCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDef_paramFind 
         Caption         =   "Поиск"
      End
   End
End
Attribute VB_Name = "vpnWFDef_param_M0"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFDef_param As Object
Private menuActionWFDef_param As String





Private Sub cmdWFDef_paramCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDef_param, "gridWFDef_param"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_paramPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDef_param, "Параметры и переменные"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_paramRef_Click()
  On Error Resume Next
  Item.WFDef_param.Refresh
  gridWFDef_param.ItemCount = Item.WFDef_param.Count
  gridWFDef_param.Refetch
  gridWFDef_param.Refresh
End Sub
Private Sub cmdWFDef_paramAcc_Click()
On Error Resume Next
If gridWFDef_param.ItemCount = 0 Then Exit Sub
If gridWFDef_param.Row > 0 Then
 If gridWFDef_param.RowIndex(gridWFDef_param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_param.RowBookmark(gridWFDef_param.RowIndex(gridWFDef_param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDef_paramEdit_Click()
  On Error Resume Next
If gridWFDef_param.ItemCount = 0 Then Exit Sub
If gridWFDef_param.Row > 0 Then
 If gridWFDef_param.RowIndex(gridWFDef_param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_param.RowBookmark(gridWFDef_param.RowIndex(gridWFDef_param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFDef_param_M0.Item = u
again:     frmWFDef_param_M0.NotFirstTime = False
    frmWFDef_param_M0.OnInit
    frmWFDef_param_M0.Show vbModal
    If frmWFDef_param_M0.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDef_param.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFDef_paramDel_Click()
  On Error Resume Next
  gridWFDef_param.Delete
End Sub
Private Sub cmdWFDef_paramAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFDef_param.Add()

      Set frmWFDef_param_M0.Item = u
again:       frmWFDef_param_M0.NotFirstTime = False
      frmWFDef_param_M0.OnInit
      frmWFDef_param_M0.Show vbModal
      If frmWFDef_param_M0.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFDef_param.ItemCount = Item.WFDef_param.Count
        gridWFDef_param.Refresh
        gridWFDef_param.RefreshGroups
        gridWFDef_param.RefreshSort
        gridWFDef_param.MoveToBookmark u.ID & "WFDef_param"
      Else
        Item.WFDef_param.Delete u.ID
        Item.WFDef_param.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFDef_paramFnd_Click()
  On Error Resume Next
  fndWFDef_param.ShowForm
End Sub
Private Sub cmdWFDef_paramRun_Click()
  On Error Resume Next
  gridWFDef_param_DblClick
End Sub
Private Sub gridWFDef_param_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WFDef_param.LoadRow gridWFDef_param, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFDef_param_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFDef_param.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFDef_param", Left(Bookmark, 38))
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

Private Sub gridWFDef_param_DblClick()
  cmdWFDef_paramEdit_Click
End Sub
Private Sub gridWFDef_param_KeyPress(KeyAscii As Integer)
  If gridWFDef_param.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDef_param.FindOnPress KeyAscii
End Sub

Private Sub gridWFDef_param_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFDef_param.Row And LastRow > 0 Then
  gridWFDef_param.GetRowData(LastRow).RowStyle = "Default"
  gridWFDef_param.GetRowData(gridWFDef_param.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFDef_paramPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFDef_param.Add()
    If GetFromBuffer(u) Then
      gridWFDef_param.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridWFDef_param_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFDef_paramCfg_Click
        End If
    End If
End Sub

Private Sub gridWFDef_param_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFDef_param
End If
End Sub
Private Sub mnuWFDef_paramAdd_click()
   menuActionWFDef_param = "ADD"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramEdit_click()
   menuActionWFDef_param = "EDIT"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramDelete_click()
   menuActionWFDef_param = "DEL"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramOpen_click()
   menuActionWFDef_param = "RUN"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramRef_click()
   menuActionWFDef_param = "REF"
   menuTimerWFDef_param.Enabled = True
End Sub
  Private Sub mnuWFDef_paramCOPY_Click()
    On Error Resume Next
    If gridWFDef_param.ItemCount = 0 Then Exit Sub
    If gridWFDef_param.Row > 0 Then
     If gridWFDef_param.RowIndex(gridWFDef_param.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_param.RowBookmark(gridWFDef_param.RowIndex(gridWFDef_param.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDef_paramCUT_Click()
    On Error Resume Next
    If gridWFDef_param.ItemCount = 0 Then Exit Sub
    If gridWFDef_param.Row > 0 Then
     If gridWFDef_param.RowIndex(gridWFDef_param.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_param.RowBookmark(gridWFDef_param.RowIndex(gridWFDef_param.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDef_param.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDef_paramCHANGE_Click()
  On Error Resume Next
  If gridWFDef_param.ItemCount = 0 Then Exit Sub
  If gridWFDef_param.Row > 0 Then
   If gridWFDef_param.RowIndex(gridWFDef_param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_param.RowBookmark(gridWFDef_param.RowIndex(gridWFDef_param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDef_param.ItemCount = u.Parent.Count
      gridWFDef_param.RefreshRowIndex gridWFDef_param.RowIndex(gridWFDef_param.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDef_paramCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDef_paramPrn_click()
   menuActionWFDef_param = "PRN"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramCfg_click()
   menuActionWFDef_param = "CFG"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramFind_click()
   menuActionWFDef_param = "FND"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramAcc_click()
   menuActionWFDef_param = "ACC"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub menuTimerWFDef_param_timer()
   menuTimerWFDef_param.Enabled = False
   If menuActionWFDef_param = "ADD" Then cmdWFDef_paramAdd_Click
   If menuActionWFDef_param = "EDIT" Then cmdWFDef_paramEdit_Click
   If menuActionWFDef_param = "DEL" Then cmdWFDef_paramDel_Click
   If menuActionWFDef_param = "RUN" Then cmdWFDef_paramRun_Click
   If menuActionWFDef_param = "REF" Then cmdWFDef_paramRef_Click
   If menuActionWFDef_param = "PRN" Then cmdWFDef_paramPrn_Click
   If menuActionWFDef_param = "CFG" Then cmdWFDef_paramCfg_Click
   If menuActionWFDef_param = "FND" Then cmdWFDef_paramFnd_Click
   If menuActionWFDef_param = "ACC" Then cmdWFDef_paramAcc_Click
   menuActionWFDef_param = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFDef_paramAdd, cmdWFDef_paramAdd.Tag
  LoadBtnPictures cmdWFDef_paramEdit, cmdWFDef_paramEdit.Tag
  LoadBtnPictures cmdWFDef_paramDel, cmdWFDef_paramDel.Tag
  LoadBtnPictures cmdWFDef_paramRef, cmdWFDef_paramRef.Tag
  LoadBtnPictures cmdWFDef_paramPrn, cmdWFDef_paramPrn.Tag
  LoadBtnPictures cmdWFDef_paramFnd, cmdWFDef_paramFnd.Tag
  Item.WFDef_param.PrepareGrid gridWFDef_param
  LoadGridLayout gridWFDef_param
  Set fndWFDef_param = Nothing
  On Error Resume Next
  Set fndWFDef_param = CreateObject("MTZ_JSetup.GridFinder")
  fndWFDef_param.Init gridWFDef_param
End Sub
Private Sub OnTabClick()

      gridWFDef_param.Top = 40 * Screen.TwipsPerPixelX
      gridWFDef_param.Left = 5 * Screen.TwipsPerPixelX
      gridWFDef_param.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFDef_param.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFDef_param.Top = 40 * Screen.TwipsPerPixelX
      gridWFDef_param.Left = 5 * Screen.TwipsPerPixelX
      gridWFDef_param.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFDef_param.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWFDef_param.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWFDef_param = Nothing
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





