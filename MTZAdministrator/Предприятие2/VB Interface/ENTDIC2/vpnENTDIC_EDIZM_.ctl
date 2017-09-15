VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnENTDIC_EDIZM_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerENTDIC_EDIZM 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlENTDIC_EDIZM 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdENTDIC_EDIZMFnd 
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
      Begin VB.CommandButton cmdENTDIC_EDIZMPrn 
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
      Begin VB.CommandButton cmdENTDIC_EDIZMRef 
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
      Begin VB.CommandButton cmdENTDIC_EDIZMDel 
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
      Begin VB.CommandButton cmdENTDIC_EDIZMEdit 
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
      Begin VB.CommandButton cmdENTDIC_EDIZMAdd 
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
      Begin GridEX20.GridEX gridENTDIC_EDIZM 
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
         Column(1)       =   "vpnENTDIC_EDIZM_.ctx":0000
         Column(2)       =   "vpnENTDIC_EDIZM_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnENTDIC_EDIZM_.ctx":016C
         FormatStyle(2)  =   "vpnENTDIC_EDIZM_.ctx":02C8
         FormatStyle(3)  =   "vpnENTDIC_EDIZM_.ctx":0378
         FormatStyle(4)  =   "vpnENTDIC_EDIZM_.ctx":042C
         FormatStyle(5)  =   "vpnENTDIC_EDIZM_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnENTDIC_EDIZM_.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupENTDIC_EDIZM 
      Caption         =   "Меню для Единицы измерения"
      Visible         =   0   'False
      Begin VB.Menu mnuENTDIC_EDIZMAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuENTDIC_EDIZMEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuENTDIC_EDIZMDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuENTDIC_EDIZMOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuENTDIC_EDIZMRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuENTDIC_EDIZMPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuENTDIC_EDIZMCfg 
         Caption         =   "Настроить"
      End
   End
End
Attribute VB_Name = "vpnENTDIC_EDIZM_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndENTDIC_EDIZM As Object
Private menuActionENTDIC_EDIZM As String





Private Sub cmdENTDIC_EDIZMCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridENTDIC_EDIZM, "gridENTDIC_EDIZM"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_EDIZMPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridENTDIC_EDIZM, "Единицы измерения"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_EDIZMRef_Click()
  On Error Resume Next
  Item.ENTDIC_EDIZM.Refresh
  gridENTDIC_EDIZM.ItemCount = Item.ENTDIC_EDIZM.Count
  gridENTDIC_EDIZM.Refetch
  gridENTDIC_EDIZM.Refresh
End Sub
Private Sub cmdENTDIC_EDIZMAcc_Click()
On Error Resume Next
If gridENTDIC_EDIZM.ItemCount = 0 Then Exit Sub
If gridENTDIC_EDIZM.Row > 0 Then
 If gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_EDIZM.RowBookmark(gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdENTDIC_EDIZMEdit_Click()
  On Error Resume Next
If gridENTDIC_EDIZM.ItemCount = 0 Then Exit Sub
If gridENTDIC_EDIZM.Row > 0 Then
 If gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_EDIZM.RowBookmark(gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmENTDIC_EDIZM_.Item = u
again:     frmENTDIC_EDIZM_.NotFirstTime = False
    frmENTDIC_EDIZM_.OnInit
    frmENTDIC_EDIZM_.Show vbModal
    If frmENTDIC_EDIZM_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridENTDIC_EDIZM.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdENTDIC_EDIZMDel_Click()
  On Error Resume Next
  gridENTDIC_EDIZM.Delete
End Sub
Private Sub cmdENTDIC_EDIZMAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.ENTDIC_EDIZM.Add()

      Set frmENTDIC_EDIZM_.Item = u
again:       frmENTDIC_EDIZM_.NotFirstTime = False
      frmENTDIC_EDIZM_.OnInit
      frmENTDIC_EDIZM_.Show vbModal
      If frmENTDIC_EDIZM_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridENTDIC_EDIZM.ItemCount = Item.ENTDIC_EDIZM.Count
        gridENTDIC_EDIZM.Refresh
        gridENTDIC_EDIZM.RefreshGroups
        gridENTDIC_EDIZM.RefreshSort
        gridENTDIC_EDIZM.MoveToBookmark u.ID & "ENTDIC_EDIZM"
      Else
        Item.ENTDIC_EDIZM.Delete u.ID
        Item.ENTDIC_EDIZM.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdENTDIC_EDIZMFnd_Click()
  On Error Resume Next
  fndENTDIC_EDIZM.ShowForm
End Sub
Private Sub cmdENTDIC_EDIZMRun_Click()
  On Error Resume Next
  gridENTDIC_EDIZM_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridENTDIC_EDIZM_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.ENTDIC_EDIZM.LoadRow gridENTDIC_EDIZM, RowIndex, Bookmark, Values
End Sub
Private Sub gridENTDIC_EDIZM_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridENTDIC_EDIZM.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("ENTDIC_EDIZM", Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
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

Private Sub gridENTDIC_EDIZM_DblClick()
  cmdENTDIC_EDIZMEdit_Click
End Sub
Private Sub gridENTDIC_EDIZM_KeyPress(KeyAscii As Integer)
  If gridENTDIC_EDIZM.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndENTDIC_EDIZM.FindOnPress KeyAscii
End Sub

Private Sub gridENTDIC_EDIZM_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridENTDIC_EDIZM.Row And LastRow > 0 Then
  gridENTDIC_EDIZM.GetRowData(LastRow).RowStyle = "Default"
  gridENTDIC_EDIZM.GetRowData(gridENTDIC_EDIZM.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuENTDIC_EDIZMPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.ENTDIC_EDIZM.Add()
    If GetFromBuffer(u) Then
      gridENTDIC_EDIZM.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridENTDIC_EDIZM_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdENTDIC_EDIZMCfg_Click
        End If
    End If
End Sub

Private Sub gridENTDIC_EDIZM_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupENTDIC_EDIZM
End If
End Sub
Private Sub mnuENTDIC_EDIZMAdd_click()
   menuActionENTDIC_EDIZM = "ADD"
   menuTimerENTDIC_EDIZM.Enabled = True
End Sub
Private Sub mnuENTDIC_EDIZMEdit_click()
   menuActionENTDIC_EDIZM = "EDIT"
   menuTimerENTDIC_EDIZM.Enabled = True
End Sub
Private Sub mnuENTDIC_EDIZMDelete_click()
   menuActionENTDIC_EDIZM = "DEL"
   menuTimerENTDIC_EDIZM.Enabled = True
End Sub
Private Sub mnuENTDIC_EDIZMOpen_click()
   menuActionENTDIC_EDIZM = "RUN"
   menuTimerENTDIC_EDIZM.Enabled = True
End Sub
Private Sub mnuENTDIC_EDIZMRef_click()
   menuActionENTDIC_EDIZM = "REF"
   menuTimerENTDIC_EDIZM.Enabled = True
End Sub
  Private Sub mnuENTDIC_EDIZMCOPY_Click()
    On Error Resume Next
    If gridENTDIC_EDIZM.ItemCount = 0 Then Exit Sub
    If gridENTDIC_EDIZM.Row > 0 Then
     If gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_EDIZM.RowBookmark(gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuENTDIC_EDIZMCUT_Click()
    On Error Resume Next
    If gridENTDIC_EDIZM.ItemCount = 0 Then Exit Sub
    If gridENTDIC_EDIZM.Row > 0 Then
     If gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_EDIZM.RowBookmark(gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridENTDIC_EDIZM.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuENTDIC_EDIZMCHANGE_Click()
  On Error Resume Next
  If gridENTDIC_EDIZM.ItemCount = 0 Then Exit Sub
  If gridENTDIC_EDIZM.Row > 0 Then
   If gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_EDIZM.RowBookmark(gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridENTDIC_EDIZM.ItemCount = u.Parent.Count
      gridENTDIC_EDIZM.RefreshRowIndex gridENTDIC_EDIZM.RowIndex(gridENTDIC_EDIZM.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuENTDIC_EDIZMCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuENTDIC_EDIZMPrn_click()
   menuActionENTDIC_EDIZM = "PRN"
   menuTimerENTDIC_EDIZM.Enabled = True
End Sub
Private Sub mnuENTDIC_EDIZMCfg_click()
   menuActionENTDIC_EDIZM = "CFG"
   menuTimerENTDIC_EDIZM.Enabled = True
End Sub
Private Sub mnuENTDIC_EDIZMFind_click()
   menuActionENTDIC_EDIZM = "FND"
   menuTimerENTDIC_EDIZM.Enabled = True
End Sub
Private Sub mnuENTDIC_EDIZMAcc_click()
   menuActionENTDIC_EDIZM = "ACC"
   menuTimerENTDIC_EDIZM.Enabled = True
End Sub
Private Sub menuTimerENTDIC_EDIZM_timer()
   menuTimerENTDIC_EDIZM.Enabled = False
   If menuActionENTDIC_EDIZM = "ADD" Then cmdENTDIC_EDIZMAdd_Click
   If menuActionENTDIC_EDIZM = "EDIT" Then cmdENTDIC_EDIZMEdit_Click
   If menuActionENTDIC_EDIZM = "DEL" Then cmdENTDIC_EDIZMDel_Click
   If menuActionENTDIC_EDIZM = "RUN" Then cmdENTDIC_EDIZMRun_Click
   If menuActionENTDIC_EDIZM = "REF" Then cmdENTDIC_EDIZMRef_Click
   If menuActionENTDIC_EDIZM = "PRN" Then cmdENTDIC_EDIZMPrn_Click
   If menuActionENTDIC_EDIZM = "CFG" Then cmdENTDIC_EDIZMCfg_Click
   If menuActionENTDIC_EDIZM = "FND" Then cmdENTDIC_EDIZMFnd_Click
   If menuActionENTDIC_EDIZM = "ACC" Then cmdENTDIC_EDIZMAcc_Click
   menuActionENTDIC_EDIZM = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdENTDIC_EDIZMAdd, cmdENTDIC_EDIZMAdd.Tag
  LoadBtnPictures cmdENTDIC_EDIZMEdit, cmdENTDIC_EDIZMEdit.Tag
  LoadBtnPictures cmdENTDIC_EDIZMDel, cmdENTDIC_EDIZMDel.Tag
  LoadBtnPictures cmdENTDIC_EDIZMRef, cmdENTDIC_EDIZMRef.Tag
  LoadBtnPictures cmdENTDIC_EDIZMPrn, cmdENTDIC_EDIZMPrn.Tag
  LoadBtnPictures cmdENTDIC_EDIZMFnd, cmdENTDIC_EDIZMFnd.Tag
  Item.ENTDIC_EDIZM.PrepareGrid gridENTDIC_EDIZM
  LoadGridLayout gridENTDIC_EDIZM
  Set fndENTDIC_EDIZM = Nothing
  On Error Resume Next
  Set fndENTDIC_EDIZM = CreateObject("MTZ_JSetup.GridFinder")
  fndENTDIC_EDIZM.Init gridENTDIC_EDIZM
End Sub
Private Sub OnTabClick()

      gridENTDIC_EDIZM.Top = 40 * Screen.TwipsPerPixelX
      gridENTDIC_EDIZM.Left = 5 * Screen.TwipsPerPixelX
      gridENTDIC_EDIZM.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridENTDIC_EDIZM.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridENTDIC_EDIZM.Top = 40 * Screen.TwipsPerPixelX
      gridENTDIC_EDIZM.Left = 5 * Screen.TwipsPerPixelX
      gridENTDIC_EDIZM.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridENTDIC_EDIZM.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlENTDIC_EDIZM.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndENTDIC_EDIZM = Nothing
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





