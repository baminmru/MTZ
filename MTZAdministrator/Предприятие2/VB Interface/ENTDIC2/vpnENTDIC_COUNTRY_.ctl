VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnENTDIC_COUNTRY_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerENTDIC_COUNTRY 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlENTDIC_COUNTRY 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdENTDIC_COUNTRYFnd 
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
      Begin VB.CommandButton cmdENTDIC_COUNTRYPrn 
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
      Begin VB.CommandButton cmdENTDIC_COUNTRYRef 
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
      Begin VB.CommandButton cmdENTDIC_COUNTRYDel 
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
      Begin VB.CommandButton cmdENTDIC_COUNTRYEdit 
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
      Begin VB.CommandButton cmdENTDIC_COUNTRYAdd 
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
      Begin GridEX20.GridEX gridENTDIC_COUNTRY 
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
         Column(1)       =   "vpnENTDIC_COUNTRY_.ctx":0000
         Column(2)       =   "vpnENTDIC_COUNTRY_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnENTDIC_COUNTRY_.ctx":016C
         FormatStyle(2)  =   "vpnENTDIC_COUNTRY_.ctx":02C8
         FormatStyle(3)  =   "vpnENTDIC_COUNTRY_.ctx":0378
         FormatStyle(4)  =   "vpnENTDIC_COUNTRY_.ctx":042C
         FormatStyle(5)  =   "vpnENTDIC_COUNTRY_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnENTDIC_COUNTRY_.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupENTDIC_COUNTRY 
      Caption         =   "Меню для Страны"
      Visible         =   0   'False
      Begin VB.Menu mnuENTDIC_COUNTRYAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuENTDIC_COUNTRYEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuENTDIC_COUNTRYDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuENTDIC_COUNTRYOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuENTDIC_COUNTRYRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuENTDIC_COUNTRYPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuENTDIC_COUNTRYCfg 
         Caption         =   "Настроить"
      End
   End
End
Attribute VB_Name = "vpnENTDIC_COUNTRY_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndENTDIC_COUNTRY As Object
Private menuActionENTDIC_COUNTRY As String





Private Sub cmdENTDIC_COUNTRYCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridENTDIC_COUNTRY, "gridENTDIC_COUNTRY"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_COUNTRYPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridENTDIC_COUNTRY, "Страны"
Set jset = Nothing
End Sub

Private Sub cmdENTDIC_COUNTRYRef_Click()
  On Error Resume Next
  Item.ENTDIC_COUNTRY.Refresh
  gridENTDIC_COUNTRY.ItemCount = Item.ENTDIC_COUNTRY.Count
  gridENTDIC_COUNTRY.Refetch
  gridENTDIC_COUNTRY.Refresh
End Sub
Private Sub cmdENTDIC_COUNTRYAcc_Click()
On Error Resume Next
If gridENTDIC_COUNTRY.ItemCount = 0 Then Exit Sub
If gridENTDIC_COUNTRY.Row > 0 Then
 If gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_COUNTRY.RowBookmark(gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdENTDIC_COUNTRYEdit_Click()
  On Error Resume Next
If gridENTDIC_COUNTRY.ItemCount = 0 Then Exit Sub
If gridENTDIC_COUNTRY.Row > 0 Then
 If gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_COUNTRY.RowBookmark(gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmENTDIC_COUNTRY_.Item = u
again:     frmENTDIC_COUNTRY_.NotFirstTime = False
    frmENTDIC_COUNTRY_.OnInit
    frmENTDIC_COUNTRY_.Show vbModal
    If frmENTDIC_COUNTRY_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridENTDIC_COUNTRY.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdENTDIC_COUNTRYDel_Click()
  On Error Resume Next
  gridENTDIC_COUNTRY.Delete
End Sub
Private Sub cmdENTDIC_COUNTRYAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.ENTDIC_COUNTRY.Add()

      Set frmENTDIC_COUNTRY_.Item = u
again:       frmENTDIC_COUNTRY_.NotFirstTime = False
      frmENTDIC_COUNTRY_.OnInit
      frmENTDIC_COUNTRY_.Show vbModal
      If frmENTDIC_COUNTRY_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridENTDIC_COUNTRY.ItemCount = Item.ENTDIC_COUNTRY.Count
        gridENTDIC_COUNTRY.Refresh
        gridENTDIC_COUNTRY.RefreshGroups
        gridENTDIC_COUNTRY.RefreshSort
        gridENTDIC_COUNTRY.MoveToBookmark u.ID & "ENTDIC_COUNTRY"
      Else
        Item.ENTDIC_COUNTRY.Delete u.ID
        Item.ENTDIC_COUNTRY.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdENTDIC_COUNTRYFnd_Click()
  On Error Resume Next
  fndENTDIC_COUNTRY.ShowForm
End Sub
Private Sub cmdENTDIC_COUNTRYRun_Click()
  On Error Resume Next
  gridENTDIC_COUNTRY_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridENTDIC_COUNTRY_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.ENTDIC_COUNTRY.LoadRow gridENTDIC_COUNTRY, RowIndex, Bookmark, Values
End Sub
Private Sub gridENTDIC_COUNTRY_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridENTDIC_COUNTRY.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("ENTDIC_COUNTRY", Left(Bookmark, 38))
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

Private Sub gridENTDIC_COUNTRY_DblClick()
  cmdENTDIC_COUNTRYEdit_Click
End Sub
Private Sub gridENTDIC_COUNTRY_KeyPress(KeyAscii As Integer)
  If gridENTDIC_COUNTRY.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndENTDIC_COUNTRY.FindOnPress KeyAscii
End Sub

Private Sub gridENTDIC_COUNTRY_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridENTDIC_COUNTRY.Row And LastRow > 0 Then
  gridENTDIC_COUNTRY.GetRowData(LastRow).RowStyle = "Default"
  gridENTDIC_COUNTRY.GetRowData(gridENTDIC_COUNTRY.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuENTDIC_COUNTRYPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.ENTDIC_COUNTRY.Add()
    If GetFromBuffer(u) Then
      gridENTDIC_COUNTRY.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridENTDIC_COUNTRY_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdENTDIC_COUNTRYCfg_Click
        End If
    End If
End Sub

Private Sub gridENTDIC_COUNTRY_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupENTDIC_COUNTRY
End If
End Sub
Private Sub mnuENTDIC_COUNTRYAdd_click()
   menuActionENTDIC_COUNTRY = "ADD"
   menuTimerENTDIC_COUNTRY.Enabled = True
End Sub
Private Sub mnuENTDIC_COUNTRYEdit_click()
   menuActionENTDIC_COUNTRY = "EDIT"
   menuTimerENTDIC_COUNTRY.Enabled = True
End Sub
Private Sub mnuENTDIC_COUNTRYDelete_click()
   menuActionENTDIC_COUNTRY = "DEL"
   menuTimerENTDIC_COUNTRY.Enabled = True
End Sub
Private Sub mnuENTDIC_COUNTRYOpen_click()
   menuActionENTDIC_COUNTRY = "RUN"
   menuTimerENTDIC_COUNTRY.Enabled = True
End Sub
Private Sub mnuENTDIC_COUNTRYRef_click()
   menuActionENTDIC_COUNTRY = "REF"
   menuTimerENTDIC_COUNTRY.Enabled = True
End Sub
  Private Sub mnuENTDIC_COUNTRYCOPY_Click()
    On Error Resume Next
    If gridENTDIC_COUNTRY.ItemCount = 0 Then Exit Sub
    If gridENTDIC_COUNTRY.Row > 0 Then
     If gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_COUNTRY.RowBookmark(gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuENTDIC_COUNTRYCUT_Click()
    On Error Resume Next
    If gridENTDIC_COUNTRY.ItemCount = 0 Then Exit Sub
    If gridENTDIC_COUNTRY.Row > 0 Then
     If gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridENTDIC_COUNTRY.RowBookmark(gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridENTDIC_COUNTRY.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuENTDIC_COUNTRYCHANGE_Click()
  On Error Resume Next
  If gridENTDIC_COUNTRY.ItemCount = 0 Then Exit Sub
  If gridENTDIC_COUNTRY.Row > 0 Then
   If gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridENTDIC_COUNTRY.RowBookmark(gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridENTDIC_COUNTRY.ItemCount = u.Parent.Count
      gridENTDIC_COUNTRY.RefreshRowIndex gridENTDIC_COUNTRY.RowIndex(gridENTDIC_COUNTRY.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuENTDIC_COUNTRYCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuENTDIC_COUNTRYPrn_click()
   menuActionENTDIC_COUNTRY = "PRN"
   menuTimerENTDIC_COUNTRY.Enabled = True
End Sub
Private Sub mnuENTDIC_COUNTRYCfg_click()
   menuActionENTDIC_COUNTRY = "CFG"
   menuTimerENTDIC_COUNTRY.Enabled = True
End Sub
Private Sub mnuENTDIC_COUNTRYFind_click()
   menuActionENTDIC_COUNTRY = "FND"
   menuTimerENTDIC_COUNTRY.Enabled = True
End Sub
Private Sub mnuENTDIC_COUNTRYAcc_click()
   menuActionENTDIC_COUNTRY = "ACC"
   menuTimerENTDIC_COUNTRY.Enabled = True
End Sub
Private Sub menuTimerENTDIC_COUNTRY_timer()
   menuTimerENTDIC_COUNTRY.Enabled = False
   If menuActionENTDIC_COUNTRY = "ADD" Then cmdENTDIC_COUNTRYAdd_Click
   If menuActionENTDIC_COUNTRY = "EDIT" Then cmdENTDIC_COUNTRYEdit_Click
   If menuActionENTDIC_COUNTRY = "DEL" Then cmdENTDIC_COUNTRYDel_Click
   If menuActionENTDIC_COUNTRY = "RUN" Then cmdENTDIC_COUNTRYRun_Click
   If menuActionENTDIC_COUNTRY = "REF" Then cmdENTDIC_COUNTRYRef_Click
   If menuActionENTDIC_COUNTRY = "PRN" Then cmdENTDIC_COUNTRYPrn_Click
   If menuActionENTDIC_COUNTRY = "CFG" Then cmdENTDIC_COUNTRYCfg_Click
   If menuActionENTDIC_COUNTRY = "FND" Then cmdENTDIC_COUNTRYFnd_Click
   If menuActionENTDIC_COUNTRY = "ACC" Then cmdENTDIC_COUNTRYAcc_Click
   menuActionENTDIC_COUNTRY = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdENTDIC_COUNTRYAdd, cmdENTDIC_COUNTRYAdd.Tag
  LoadBtnPictures cmdENTDIC_COUNTRYEdit, cmdENTDIC_COUNTRYEdit.Tag
  LoadBtnPictures cmdENTDIC_COUNTRYDel, cmdENTDIC_COUNTRYDel.Tag
  LoadBtnPictures cmdENTDIC_COUNTRYRef, cmdENTDIC_COUNTRYRef.Tag
  LoadBtnPictures cmdENTDIC_COUNTRYPrn, cmdENTDIC_COUNTRYPrn.Tag
  LoadBtnPictures cmdENTDIC_COUNTRYFnd, cmdENTDIC_COUNTRYFnd.Tag
  Item.ENTDIC_COUNTRY.PrepareGrid gridENTDIC_COUNTRY
  LoadGridLayout gridENTDIC_COUNTRY
  Set fndENTDIC_COUNTRY = Nothing
  On Error Resume Next
  Set fndENTDIC_COUNTRY = CreateObject("MTZ_JSetup.GridFinder")
  fndENTDIC_COUNTRY.Init gridENTDIC_COUNTRY
End Sub
Private Sub OnTabClick()

      gridENTDIC_COUNTRY.Top = 40 * Screen.TwipsPerPixelX
      gridENTDIC_COUNTRY.Left = 5 * Screen.TwipsPerPixelX
      gridENTDIC_COUNTRY.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridENTDIC_COUNTRY.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridENTDIC_COUNTRY.Top = 40 * Screen.TwipsPerPixelX
      gridENTDIC_COUNTRY.Left = 5 * Screen.TwipsPerPixelX
      gridENTDIC_COUNTRY.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridENTDIC_COUNTRY.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlENTDIC_COUNTRY.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndENTDIC_COUNTRY = Nothing
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





