VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnthe_Session_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerthe_Session 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlthe_Session 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdthe_SessionAcc 
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
      Begin VB.CommandButton cmdthe_SessionFnd 
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
      Begin VB.CommandButton cmdthe_SessionCfg 
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
      Begin VB.CommandButton cmdthe_SessionPrn 
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
      Begin VB.CommandButton cmdthe_SessionRef 
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
      Begin VB.CommandButton cmdthe_SessionDel 
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
      Begin VB.CommandButton cmdthe_SessionEdit 
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
      Begin VB.CommandButton cmdthe_SessionAdd 
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
      Begin GridEX20.GridEX gridthe_Session 
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
         Column(1)       =   "vpnthe_Session_.ctx":0000
         Column(2)       =   "vpnthe_Session_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnthe_Session_.ctx":016C
         FormatStyle(2)  =   "vpnthe_Session_.ctx":02C8
         FormatStyle(3)  =   "vpnthe_Session_.ctx":0378
         FormatStyle(4)  =   "vpnthe_Session_.ctx":042C
         FormatStyle(5)  =   "vpnthe_Session_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnthe_Session_.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdthe_SessionRun 
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
   Begin VB.Menu mnuPopupthe_Session 
      Caption         =   "Меню для Сессия пользователя"
      Visible         =   0   'False
      Begin VB.Menu mnuthe_SessionAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuthe_SessionEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuthe_SessionDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuthe_SessionOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuthe_SessionRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuthe_SessionS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuthe_SessionBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuthe_SessionCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuthe_SessionCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuthe_SessionPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuthe_SessionCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuthe_SessionCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuthe_SessionPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuthe_SessionCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuthe_SessionFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuthe_SessionAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnthe_Session_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Зарегистрированные сессии пользователей
Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndthe_Session As Object
Private menuActionthe_Session As String





Private Sub cmdthe_SessionCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridthe_Session, "gridthe_Session"
Set jset = Nothing
End Sub

Private Sub cmdthe_SessionPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridthe_Session, "Сессия пользователя"
Set jset = Nothing
End Sub

Private Sub cmdthe_SessionRef_Click()
  On Error Resume Next
  item.the_Session.Refresh
  gridthe_Session.ItemCount = item.the_Session.Count
  gridthe_Session.Refetch
  gridthe_Session.Refresh
End Sub
Private Sub cmdthe_SessionAcc_Click()
On Error Resume Next
If gridthe_Session.ItemCount = 0 Then Exit Sub
If gridthe_Session.Row > 0 Then
 If gridthe_Session.RowIndex(gridthe_Session.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridthe_Session.RowBookmark(gridthe_Session.RowIndex(gridthe_Session.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdthe_SessionEdit_Click()
  On Error Resume Next
If gridthe_Session.ItemCount = 0 Then Exit Sub
If gridthe_Session.Row > 0 Then
 If gridthe_Session.RowIndex(gridthe_Session.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridthe_Session.RowBookmark(gridthe_Session.RowIndex(gridthe_Session.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmthe_Session_.item = u
again:     frmthe_Session_.NotFirstTime = False
    frmthe_Session_.OnInit
    frmthe_Session_.Show vbModal
    If frmthe_Session_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridthe_Session.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdthe_SessionDel_Click()
  On Error Resume Next
  gridthe_Session.Delete
End Sub
Private Sub cmdthe_SessionAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.the_Session.Add()

      Set frmthe_Session_.item = u
again:       frmthe_Session_.NotFirstTime = False
      frmthe_Session_.OnInit
      frmthe_Session_.Show vbModal
      If frmthe_Session_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridthe_Session.ItemCount = item.the_Session.Count
        gridthe_Session.Refresh
        gridthe_Session.RefreshGroups
        gridthe_Session.RefreshSort
        gridthe_Session.MoveToBookmark u.ID & "the_Session"
      Else
        item.the_Session.Delete u.ID
        item.the_Session.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdthe_SessionFnd_Click()
  On Error Resume Next
  fndthe_Session.ShowForm
End Sub
Private Sub cmdthe_SessionRun_Click()
  On Error Resume Next
  gridthe_Session_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridthe_Session_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.the_Session.LoadRow gridthe_Session, RowIndex, Bookmark, Values
End Sub
Private Sub gridthe_Session_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridthe_Session.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject("the_Session", Left(Bookmark, 38))
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

Private Sub gridthe_Session_DblClick()
  cmdthe_SessionEdit_Click
End Sub
Private Sub gridthe_Session_KeyPress(KeyAscii As Integer)
  If gridthe_Session.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndthe_Session.FindOnPress KeyAscii
End Sub

Private Sub gridthe_Session_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridthe_Session.Row And LastRow > 0 Then
  gridthe_Session.GetRowData(LastRow).RowStyle = "Default"
  gridthe_Session.GetRowData(gridthe_Session.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuthe_SessionPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.the_Session.Add()
    If GetFromBuffer(u) Then
      gridthe_Session.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridthe_Session_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdthe_SessionCfg_Click
        End If
    End If
End Sub

Private Sub gridthe_Session_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupthe_Session
End If
End Sub
Private Sub mnuthe_SessionAdd_click()
   menuActionthe_Session = "ADD"
   menuTimerthe_Session.Enabled = True
End Sub
Private Sub mnuthe_SessionEdit_click()
   menuActionthe_Session = "EDIT"
   menuTimerthe_Session.Enabled = True
End Sub
Private Sub mnuthe_SessionDelete_click()
   menuActionthe_Session = "DEL"
   menuTimerthe_Session.Enabled = True
End Sub
Private Sub mnuthe_SessionOpen_click()
   menuActionthe_Session = "RUN"
   menuTimerthe_Session.Enabled = True
End Sub
Private Sub mnuthe_SessionRef_click()
   menuActionthe_Session = "REF"
   menuTimerthe_Session.Enabled = True
End Sub
  Private Sub mnuthe_SessionCOPY_Click()
    On Error Resume Next
    If gridthe_Session.ItemCount = 0 Then Exit Sub
    If gridthe_Session.Row > 0 Then
     If gridthe_Session.RowIndex(gridthe_Session.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridthe_Session.RowBookmark(gridthe_Session.RowIndex(gridthe_Session.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuthe_SessionCUT_Click()
    On Error Resume Next
    If gridthe_Session.ItemCount = 0 Then Exit Sub
    If gridthe_Session.Row > 0 Then
     If gridthe_Session.RowIndex(gridthe_Session.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridthe_Session.RowBookmark(gridthe_Session.RowIndex(gridthe_Session.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridthe_Session.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuthe_SessionCHANGE_Click()
  On Error Resume Next
  If gridthe_Session.ItemCount = 0 Then Exit Sub
  If gridthe_Session.Row > 0 Then
   If gridthe_Session.RowIndex(gridthe_Session.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridthe_Session.RowBookmark(gridthe_Session.RowIndex(gridthe_Session.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridthe_Session.ItemCount = u.Parent.Count
      gridthe_Session.RefreshRowIndex gridthe_Session.RowIndex(gridthe_Session.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuthe_SessionCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuthe_SessionPrn_click()
   menuActionthe_Session = "PRN"
   menuTimerthe_Session.Enabled = True
End Sub
Private Sub mnuthe_SessionCfg_click()
   menuActionthe_Session = "CFG"
   menuTimerthe_Session.Enabled = True
End Sub
Private Sub mnuthe_SessionFind_click()
   menuActionthe_Session = "FND"
   menuTimerthe_Session.Enabled = True
End Sub
Private Sub mnuthe_SessionAcc_click()
   menuActionthe_Session = "ACC"
   menuTimerthe_Session.Enabled = True
End Sub
Private Sub menuTimerthe_Session_timer()
   menuTimerthe_Session.Enabled = False
   If menuActionthe_Session = "ADD" Then cmdthe_SessionAdd_Click
   If menuActionthe_Session = "EDIT" Then cmdthe_SessionEdit_Click
   If menuActionthe_Session = "DEL" Then cmdthe_SessionDel_Click
   If menuActionthe_Session = "RUN" Then cmdthe_SessionRun_Click
   If menuActionthe_Session = "REF" Then cmdthe_SessionRef_Click
   If menuActionthe_Session = "PRN" Then cmdthe_SessionPrn_Click
   If menuActionthe_Session = "CFG" Then cmdthe_SessionCfg_Click
   If menuActionthe_Session = "FND" Then cmdthe_SessionFnd_Click
   If menuActionthe_Session = "ACC" Then cmdthe_SessionAcc_Click
   menuActionthe_Session = ""
End Sub

'Функция инициализации панели данными
'Parameters:
'[IN][OUT]  aItem , тип параметра: object,
'[IN][OUT]   optional pForm , тип параметра: object = nothing  - ...
'See Also:
'Example:
'  call me.OnInit({параметры})
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdthe_SessionAdd, cmdthe_SessionAdd.Tag
  LoadBtnPictures cmdthe_SessionEdit, cmdthe_SessionEdit.Tag
  LoadBtnPictures cmdthe_SessionDel, cmdthe_SessionDel.Tag
  LoadBtnPictures cmdthe_SessionRef, cmdthe_SessionRef.Tag
  LoadBtnPictures cmdthe_SessionPrn, cmdthe_SessionPrn.Tag
  LoadBtnPictures cmdthe_SessionFnd, cmdthe_SessionFnd.Tag
  LoadBtnPictures cmdthe_SessionRun, cmdthe_SessionRun.Tag
  LoadBtnPictures cmdthe_SessionAcc, cmdthe_SessionAcc.Tag
  LoadBtnPictures cmdthe_SessionCfg, cmdthe_SessionCfg.Tag
  item.the_Session.PrepareGrid gridthe_Session
  LoadGridLayout gridthe_Session
  Set fndthe_Session = Nothing
  On Error Resume Next
  Set fndthe_Session = CreateObject("MTZ_JSetup.GridFinder")
  fndthe_Session.Init gridthe_Session
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

      gridthe_Session.Top = 40 * Screen.TwipsPerPixelX
      gridthe_Session.Left = 5 * Screen.TwipsPerPixelX
      gridthe_Session.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridthe_Session.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridthe_Session.Top = 40 * Screen.TwipsPerPixelX
      gridthe_Session.Left = 5 * Screen.TwipsPerPixelX
      gridthe_Session.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridthe_Session.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
End Sub

'Действие при активизации панели
'Parameters:
'[IN][OUT]  aItem , тип параметра: object,
'[IN][OUT]   optional pForm , тип параметра: object = nothing  - ...
'See Also:
'Example:
'  call me.OnClick({параметры})
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub

'Действие при сохранении
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnSave()
Public Sub OnSave()
  
End Sub

'Признак изменения
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
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
  pnlthe_Session.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub

'Освобождение ресурсов
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndthe_Session = Nothing
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



'Так же проверяет Square >0
'{53371FFA-B514-447A-A1F9-26EE4FD409C9}
Private Sub Run_VBUpdateObjNamePEO(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save

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
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Проверка наличия коллекции характеристик
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



'Для раздела, в котором есть поле - ссылка, создает/выбирает объект без открытия окна редактирования ссылки
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



'Обновление Имени объекта
'{61393545-ABF7-46F7-82F3-9B7E610DD9C0}
Private Sub Run_VBUpdateObjName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save
End Sub



'Метод создает новый элемент в иерархии Имущественных Комплексов (приложение RealEstate) при создании нового элемента к нему линкуется объект ИК, форма которого и вызывается на редактирование
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание ИК"

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
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "Заявка " & Date)
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub



'Создание номенклатуры по шаблону
'{B91ABF3A-31F8-4A82-8D41-EF463DBA32D0}
Private Sub Run_SSCreateNomen(Name As Variant, Optional RowItem As Object)
On Error Resume Next

'pointCreateLine
End Sub





