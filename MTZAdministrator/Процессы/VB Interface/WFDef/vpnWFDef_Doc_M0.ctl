VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnWFDef_Doc_M0 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFDef_Doc 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFDef_Doc 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFDef_DocFnd 
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
      Begin VB.CommandButton cmdWFDef_DocPrn 
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
      Begin VB.CommandButton cmdWFDef_DocRef 
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
      Begin VB.CommandButton cmdWFDef_DocDel 
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
      Begin VB.CommandButton cmdWFDef_DocEdit 
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
      Begin VB.CommandButton cmdWFDef_DocAdd 
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
      Begin GridEX20.GridEX gridWFDef_Doc 
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
         Column(1)       =   "vpnWFDef_Doc_M0.ctx":0000
         Column(2)       =   "vpnWFDef_Doc_M0.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFDef_Doc_M0.ctx":016C
         FormatStyle(2)  =   "vpnWFDef_Doc_M0.ctx":02C8
         FormatStyle(3)  =   "vpnWFDef_Doc_M0.ctx":0378
         FormatStyle(4)  =   "vpnWFDef_Doc_M0.ctx":042C
         FormatStyle(5)  =   "vpnWFDef_Doc_M0.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWFDef_Doc_M0.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupWFDef_Doc 
      Caption         =   "Меню для Документы"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDef_DocAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDef_DocEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDef_DocDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDef_DocOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDef_DocRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDef_DocS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDef_DocBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDef_DocCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDef_DocCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDef_DocPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDef_DocCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDef_DocCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDef_DocPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDef_DocCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDef_DocFind 
         Caption         =   "Поиск"
      End
   End
End
Attribute VB_Name = "vpnWFDef_Doc_M0"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFDef_Doc As Object
Private menuActionWFDef_Doc As String





Private Sub cmdWFDef_DocCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDef_Doc, "gridWFDef_Doc"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_DocPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDef_Doc, "Документы"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_DocRef_Click()
  On Error Resume Next
  Item.WFDef_Doc.Refresh
  gridWFDef_Doc.ItemCount = Item.WFDef_Doc.Count
  gridWFDef_Doc.Refetch
  gridWFDef_Doc.Refresh
End Sub
Private Sub cmdWFDef_DocAcc_Click()
On Error Resume Next
If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
If gridWFDef_Doc.Row > 0 Then
 If gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_Doc.RowBookmark(gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDef_DocEdit_Click()
  On Error Resume Next
If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
If gridWFDef_Doc.Row > 0 Then
 If gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_Doc.RowBookmark(gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFDef_Doc_M0.Item = u
again:     frmWFDef_Doc_M0.NotFirstTime = False
    frmWFDef_Doc_M0.OnInit
    frmWFDef_Doc_M0.Show vbModal
    If frmWFDef_Doc_M0.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDef_Doc.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFDef_DocDel_Click()
  On Error Resume Next
  gridWFDef_Doc.Delete
End Sub
Private Sub cmdWFDef_DocAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFDef_Doc.Add()

      Set frmWFDef_Doc_M0.Item = u
again:       frmWFDef_Doc_M0.NotFirstTime = False
      frmWFDef_Doc_M0.OnInit
      frmWFDef_Doc_M0.Show vbModal
      If frmWFDef_Doc_M0.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFDef_Doc.ItemCount = Item.WFDef_Doc.Count
        gridWFDef_Doc.Refresh
        gridWFDef_Doc.RefreshGroups
        gridWFDef_Doc.RefreshSort
        gridWFDef_Doc.MoveToBookmark u.ID & "WFDef_Doc"
      Else
        Item.WFDef_Doc.Delete u.ID
        Item.WFDef_Doc.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFDef_DocFnd_Click()
  On Error Resume Next
  fndWFDef_Doc.ShowForm
End Sub
Private Sub cmdWFDef_DocRun_Click()
  On Error Resume Next
  gridWFDef_Doc_DblClick
End Sub
Private Sub gridWFDef_Doc_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WFDef_Doc.LoadRow gridWFDef_Doc, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFDef_Doc_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFDef_Doc", Left(Bookmark, 38))
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

Private Sub gridWFDef_Doc_DblClick()
  cmdWFDef_DocEdit_Click
End Sub
Private Sub gridWFDef_Doc_KeyPress(KeyAscii As Integer)
  If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDef_Doc.FindOnPress KeyAscii
End Sub

Private Sub gridWFDef_Doc_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFDef_Doc.Row And LastRow > 0 Then
  gridWFDef_Doc.GetRowData(LastRow).RowStyle = "Default"
  gridWFDef_Doc.GetRowData(gridWFDef_Doc.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFDef_DocPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFDef_Doc.Add()
    If GetFromBuffer(u) Then
      gridWFDef_Doc.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridWFDef_Doc_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFDef_DocCfg_Click
        End If
    End If
End Sub

Private Sub gridWFDef_Doc_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFDef_Doc
End If
End Sub
Private Sub mnuWFDef_DocAdd_click()
   menuActionWFDef_Doc = "ADD"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocEdit_click()
   menuActionWFDef_Doc = "EDIT"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocDelete_click()
   menuActionWFDef_Doc = "DEL"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocOpen_click()
   menuActionWFDef_Doc = "RUN"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocRef_click()
   menuActionWFDef_Doc = "REF"
   menuTimerWFDef_Doc.Enabled = True
End Sub
  Private Sub mnuWFDef_DocCOPY_Click()
    On Error Resume Next
    If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
    If gridWFDef_Doc.Row > 0 Then
     If gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_Doc.RowBookmark(gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDef_DocCUT_Click()
    On Error Resume Next
    If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
    If gridWFDef_Doc.Row > 0 Then
     If gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_Doc.RowBookmark(gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDef_Doc.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDef_DocCHANGE_Click()
  On Error Resume Next
  If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
  If gridWFDef_Doc.Row > 0 Then
   If gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_Doc.RowBookmark(gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDef_Doc.ItemCount = u.Parent.Count
      gridWFDef_Doc.RefreshRowIndex gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDef_DocCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDef_DocPrn_click()
   menuActionWFDef_Doc = "PRN"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocCfg_click()
   menuActionWFDef_Doc = "CFG"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocFind_click()
   menuActionWFDef_Doc = "FND"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocAcc_click()
   menuActionWFDef_Doc = "ACC"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub menuTimerWFDef_Doc_timer()
   menuTimerWFDef_Doc.Enabled = False
   If menuActionWFDef_Doc = "ADD" Then cmdWFDef_DocAdd_Click
   If menuActionWFDef_Doc = "EDIT" Then cmdWFDef_DocEdit_Click
   If menuActionWFDef_Doc = "DEL" Then cmdWFDef_DocDel_Click
   If menuActionWFDef_Doc = "RUN" Then cmdWFDef_DocRun_Click
   If menuActionWFDef_Doc = "REF" Then cmdWFDef_DocRef_Click
   If menuActionWFDef_Doc = "PRN" Then cmdWFDef_DocPrn_Click
   If menuActionWFDef_Doc = "CFG" Then cmdWFDef_DocCfg_Click
   If menuActionWFDef_Doc = "FND" Then cmdWFDef_DocFnd_Click
   If menuActionWFDef_Doc = "ACC" Then cmdWFDef_DocAcc_Click
   menuActionWFDef_Doc = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFDef_DocAdd, cmdWFDef_DocAdd.Tag
  LoadBtnPictures cmdWFDef_DocEdit, cmdWFDef_DocEdit.Tag
  LoadBtnPictures cmdWFDef_DocDel, cmdWFDef_DocDel.Tag
  LoadBtnPictures cmdWFDef_DocRef, cmdWFDef_DocRef.Tag
  LoadBtnPictures cmdWFDef_DocPrn, cmdWFDef_DocPrn.Tag
  LoadBtnPictures cmdWFDef_DocFnd, cmdWFDef_DocFnd.Tag
  Item.WFDef_Doc.PrepareGrid gridWFDef_Doc
  LoadGridLayout gridWFDef_Doc
  Set fndWFDef_Doc = Nothing
  On Error Resume Next
  Set fndWFDef_Doc = CreateObject("MTZ_JSetup.GridFinder")
  fndWFDef_Doc.Init gridWFDef_Doc
End Sub
Private Sub OnTabClick()

      gridWFDef_Doc.Top = 40 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Left = 5 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFDef_Doc.Top = 40 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Left = 5 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWFDef_Doc.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWFDef_Doc = Nothing
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





