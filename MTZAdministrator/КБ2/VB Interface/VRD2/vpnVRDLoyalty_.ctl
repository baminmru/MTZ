VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnVRDLoyalty_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerVRDLoyalty 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlVRDLoyalty 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdVRDLoyaltyAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdVRDLoyaltyFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   8
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdVRDLoyaltyCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdVRDLoyaltyPrn 
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
      Begin VB.CommandButton cmdVRDLoyaltyRef 
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
      Begin VB.CommandButton cmdVRDLoyaltyDel 
         Enabled         =   0   'False
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
      Begin VB.CommandButton cmdVRDLoyaltyEdit 
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
      Begin VB.CommandButton cmdVRDLoyaltyAdd 
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
      Begin GridEX20.GridEX gridVRDLoyalty 
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
         Column(1)       =   "vpnVRDLoyalty_.ctx":0000
         Column(2)       =   "vpnVRDLoyalty_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnVRDLoyalty_.ctx":016C
         FormatStyle(2)  =   "vpnVRDLoyalty_.ctx":02C8
         FormatStyle(3)  =   "vpnVRDLoyalty_.ctx":0378
         FormatStyle(4)  =   "vpnVRDLoyalty_.ctx":042C
         FormatStyle(5)  =   "vpnVRDLoyalty_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnVRDLoyalty_.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdVRDLoyaltyRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   9
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Menu mnuPopupVRDLoyalty 
      Caption         =   "Меню для Лояльность"
      Visible         =   0   'False
      Begin VB.Menu mnuVRDLoyaltyAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuVRDLoyaltyEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuVRDLoyaltyDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuVRDLoyaltyOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuVRDLoyaltyRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuVRDLoyaltyS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVRDLoyaltyBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuVRDLoyaltyCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuVRDLoyaltyCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuVRDLoyaltyPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuVRDLoyaltyCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuVRDLoyaltyCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuVRDLoyaltyPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuVRDLoyaltyCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuVRDLoyaltyFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuVRDLoyaltyAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnVRDLoyalty_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndVRDLoyalty As Object
Private menuActionVRDLoyalty As String





Private Sub cmdVRDLoyaltyCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridVRDLoyalty, "gridVRDLoyalty"
Set jset = Nothing
End Sub

Private Sub cmdVRDLoyaltyPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridVRDLoyalty, "Лояльность"
Set jset = Nothing
End Sub

Private Sub cmdVRDLoyaltyRef_Click()
  On Error Resume Next
  Item.VRDLoyalty.Refresh
  gridVRDLoyalty.ItemCount = Item.VRDLoyalty.Count
  gridVRDLoyalty.Refetch
  gridVRDLoyalty.Refresh
End Sub
Private Sub cmdVRDLoyaltyAcc_Click()
On Error Resume Next
If gridVRDLoyalty.ItemCount = 0 Then Exit Sub
If gridVRDLoyalty.Row > 0 Then
 If gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRDLoyalty.RowBookmark(gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdVRDLoyaltyEdit_Click()
  On Error Resume Next
If gridVRDLoyalty.ItemCount = 0 Then Exit Sub
If gridVRDLoyalty.Row > 0 Then
 If gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRDLoyalty.RowBookmark(gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmVRDLoyalty_.Item = u
again:     frmVRDLoyalty_.NotFirstTime = False
    frmVRDLoyalty_.OnInit
    frmVRDLoyalty_.Show vbModal
    If frmVRDLoyalty_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridVRDLoyalty.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdVRDLoyaltyDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdVRDLoyaltyAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.VRDLoyalty.Add()

      Set frmVRDLoyalty_.Item = u
again:       frmVRDLoyalty_.NotFirstTime = False
      frmVRDLoyalty_.OnInit
      frmVRDLoyalty_.Show vbModal
      If frmVRDLoyalty_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridVRDLoyalty.ItemCount = Item.VRDLoyalty.Count
        gridVRDLoyalty.Refresh
        gridVRDLoyalty.RefreshGroups
        gridVRDLoyalty.RefreshSort
        gridVRDLoyalty.MoveToBookmark u.ID & "VRDLoyalty"
      Else
        Item.VRDLoyalty.Delete u.ID
        Item.VRDLoyalty.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdVRDLoyaltyFnd_Click()
  On Error Resume Next
  fndVRDLoyalty.ShowForm
End Sub
Private Sub cmdVRDLoyaltyRun_Click()
  On Error Resume Next
  gridVRDLoyalty_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridVRDLoyalty_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.VRDLoyalty.LoadRow gridVRDLoyalty, RowIndex, Bookmark, Values
End Sub
Private Sub gridVRDLoyalty_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridVRDLoyalty_DblClick()
  cmdVRDLoyaltyEdit_Click
End Sub
Private Sub gridVRDLoyalty_KeyPress(KeyAscii As Integer)
  If gridVRDLoyalty.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndVRDLoyalty.FindOnPress KeyAscii
End Sub

Private Sub gridVRDLoyalty_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridVRDLoyalty.Row And LastRow > 0 Then
  gridVRDLoyalty.GetRowData(LastRow).RowStyle = "Default"
  gridVRDLoyalty.GetRowData(gridVRDLoyalty.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuVRDLoyaltyPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.VRDLoyalty.Add()
    If GetFromBuffer(u) Then
      gridVRDLoyalty.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridVRDLoyalty_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdVRDLoyaltyCfg_Click
        End If
    End If
End Sub

Private Sub gridVRDLoyalty_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupVRDLoyalty
End If
End Sub
Private Sub mnuVRDLoyaltyAdd_click()
   menuActionVRDLoyalty = "ADD"
   menuTimerVRDLoyalty.Enabled = True
End Sub
Private Sub mnuVRDLoyaltyEdit_click()
   menuActionVRDLoyalty = "EDIT"
   menuTimerVRDLoyalty.Enabled = True
End Sub
Private Sub mnuVRDLoyaltyDelete_click()
   menuActionVRDLoyalty = "DEL"
   menuTimerVRDLoyalty.Enabled = True
End Sub
Private Sub mnuVRDLoyaltyOpen_click()
   menuActionVRDLoyalty = "RUN"
   menuTimerVRDLoyalty.Enabled = True
End Sub
Private Sub mnuVRDLoyaltyRef_click()
   menuActionVRDLoyalty = "REF"
   menuTimerVRDLoyalty.Enabled = True
End Sub
  Private Sub mnuVRDLoyaltyCOPY_Click()
    On Error Resume Next
    If gridVRDLoyalty.ItemCount = 0 Then Exit Sub
    If gridVRDLoyalty.Row > 0 Then
     If gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRDLoyalty.RowBookmark(gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuVRDLoyaltyCUT_Click()
    On Error Resume Next
    If gridVRDLoyalty.ItemCount = 0 Then Exit Sub
    If gridVRDLoyalty.Row > 0 Then
     If gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRDLoyalty.RowBookmark(gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridVRDLoyalty.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuVRDLoyaltyCHANGE_Click()
  On Error Resume Next
  If gridVRDLoyalty.ItemCount = 0 Then Exit Sub
  If gridVRDLoyalty.Row > 0 Then
   If gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRDLoyalty.RowBookmark(gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridVRDLoyalty.ItemCount = u.Parent.Count
      gridVRDLoyalty.RefreshRowIndex gridVRDLoyalty.RowIndex(gridVRDLoyalty.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuVRDLoyaltyCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRDLoyaltyPrn_click()
   menuActionVRDLoyalty = "PRN"
   menuTimerVRDLoyalty.Enabled = True
End Sub
Private Sub mnuVRDLoyaltyCfg_click()
   menuActionVRDLoyalty = "CFG"
   menuTimerVRDLoyalty.Enabled = True
End Sub
Private Sub mnuVRDLoyaltyFind_click()
   menuActionVRDLoyalty = "FND"
   menuTimerVRDLoyalty.Enabled = True
End Sub
Private Sub mnuVRDLoyaltyAcc_click()
   menuActionVRDLoyalty = "ACC"
   menuTimerVRDLoyalty.Enabled = True
End Sub
Private Sub menuTimerVRDLoyalty_timer()
   menuTimerVRDLoyalty.Enabled = False
   If menuActionVRDLoyalty = "ADD" Then cmdVRDLoyaltyAdd_Click
   If menuActionVRDLoyalty = "EDIT" Then cmdVRDLoyaltyEdit_Click
   If menuActionVRDLoyalty = "DEL" Then cmdVRDLoyaltyDel_Click
   If menuActionVRDLoyalty = "RUN" Then cmdVRDLoyaltyRun_Click
   If menuActionVRDLoyalty = "REF" Then cmdVRDLoyaltyRef_Click
   If menuActionVRDLoyalty = "PRN" Then cmdVRDLoyaltyPrn_Click
   If menuActionVRDLoyalty = "CFG" Then cmdVRDLoyaltyCfg_Click
   If menuActionVRDLoyalty = "FND" Then cmdVRDLoyaltyFnd_Click
   If menuActionVRDLoyalty = "ACC" Then cmdVRDLoyaltyAcc_Click
   menuActionVRDLoyalty = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdVRDLoyaltyAdd, cmdVRDLoyaltyAdd.Tag
  LoadBtnPictures cmdVRDLoyaltyEdit, cmdVRDLoyaltyEdit.Tag
  LoadBtnPictures cmdVRDLoyaltyDel, cmdVRDLoyaltyDel.Tag
  LoadBtnPictures cmdVRDLoyaltyRef, cmdVRDLoyaltyRef.Tag
  LoadBtnPictures cmdVRDLoyaltyPrn, cmdVRDLoyaltyPrn.Tag
  LoadBtnPictures cmdVRDLoyaltyFnd, cmdVRDLoyaltyFnd.Tag
  LoadBtnPictures cmdVRDLoyaltyRun, cmdVRDLoyaltyRun.Tag
  LoadBtnPictures cmdVRDLoyaltyAcc, cmdVRDLoyaltyAcc.Tag
  LoadBtnPictures cmdVRDLoyaltyCfg, cmdVRDLoyaltyCfg.Tag
  Item.VRDLoyalty.PrepareGrid gridVRDLoyalty
  LoadGridLayout gridVRDLoyalty
  Set fndVRDLoyalty = Nothing
  On Error Resume Next
  Set fndVRDLoyalty = CreateObject("MTZ_JSetup.GridFinder")
  fndVRDLoyalty.Init gridVRDLoyalty
End Sub
Private Sub OnTabClick()

      gridVRDLoyalty.Top = 40 * Screen.TwipsPerPixelX
      gridVRDLoyalty.Left = 5 * Screen.TwipsPerPixelX
      gridVRDLoyalty.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRDLoyalty.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridVRDLoyalty.Top = 40 * Screen.TwipsPerPixelX
      gridVRDLoyalty.Left = 5 * Screen.TwipsPerPixelX
      gridVRDLoyalty.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRDLoyalty.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlVRDLoyalty.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndVRDLoyalty = Nothing
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

  RowItem.Person.Secure Item.SecureStyleid
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
'  ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT2", "Отчет " & Date)
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
  Set Obj = RowItem.TheDocument.PEKP_DEF.Item(1)
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
  Set Obj = RowItem.TheDocument.PEKO_DEF.Item(1)
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



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = Item.Name
Item.Save
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





