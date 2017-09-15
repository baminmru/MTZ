VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnWFRtm_Doc_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFRtm_Doc 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFRtm_Doc 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFRtm_DocFnd 
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
      Begin VB.CommandButton cmdWFRtm_DocPrn 
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
      Begin VB.CommandButton cmdWFRtm_DocRef 
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
      Begin VB.CommandButton cmdWFRtm_DocDel 
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
      Begin VB.CommandButton cmdWFRtm_DocEdit 
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
      Begin VB.CommandButton cmdWFRtm_DocAdd 
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
      Begin GridEX20.GridEX gridWFRtm_Doc 
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
         Column(1)       =   "vpnWFRtm_Doc_.ctx":0000
         Column(2)       =   "vpnWFRtm_Doc_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFRtm_Doc_.ctx":016C
         FormatStyle(2)  =   "vpnWFRtm_Doc_.ctx":02C8
         FormatStyle(3)  =   "vpnWFRtm_Doc_.ctx":0378
         FormatStyle(4)  =   "vpnWFRtm_Doc_.ctx":042C
         FormatStyle(5)  =   "vpnWFRtm_Doc_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWFRtm_Doc_.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupWFRtm_Doc 
      Caption         =   "Меню для Документы"
      Visible         =   0   'False
      Begin VB.Menu mnuWFRtm_DocAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFRtm_DocEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFRtm_DocDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFRtm_DocOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFRtm_DocRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFRtm_DocS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFRtm_DocBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFRtm_DocCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFRtm_DocCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFRtm_DocPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFRtm_DocCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFRtm_DocCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFRtm_DocPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFRtm_DocCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFRtm_DocFind 
         Caption         =   "Поиск"
      End
   End
End
Attribute VB_Name = "vpnWFRtm_Doc_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFRtm_Doc As Object
Private menuActionWFRtm_Doc As String





Private Sub cmdWFRtm_DocCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFRtm_Doc, "gridWFRtm_Doc"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_DocPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFRtm_Doc, "Документы"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_DocRef_Click()
  On Error Resume Next
  Item.WFRtm_Doc.Refresh
  gridWFRtm_Doc.ItemCount = Item.WFRtm_Doc.Count
  gridWFRtm_Doc.Refetch
  gridWFRtm_Doc.Refresh
End Sub
Private Sub cmdWFRtm_DocAcc_Click()
On Error Resume Next
If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
If gridWFRtm_Doc.Row > 0 Then
 If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFRtm_DocEdit_Click()
  On Error Resume Next
If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
If gridWFRtm_Doc.Row > 0 Then
 If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFRtm_Doc_.Item = u
again:     frmWFRtm_Doc_.NotFirstTime = False
    frmWFRtm_Doc_.OnInit
    frmWFRtm_Doc_.Show vbModal
    If frmWFRtm_Doc_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFRtm_Doc.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFRtm_DocDel_Click()
  On Error Resume Next
  gridWFRtm_Doc.Delete
End Sub
Private Sub cmdWFRtm_DocAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFRtm_Doc.Add()

      Set frmWFRtm_Doc_.Item = u
again:       frmWFRtm_Doc_.NotFirstTime = False
      frmWFRtm_Doc_.OnInit
      frmWFRtm_Doc_.Show vbModal
      If frmWFRtm_Doc_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFRtm_Doc.ItemCount = Item.WFRtm_Doc.Count
        gridWFRtm_Doc.Refresh
        gridWFRtm_Doc.RefreshGroups
        gridWFRtm_Doc.RefreshSort
        gridWFRtm_Doc.MoveToBookmark u.ID & "WFRtm_Doc"
      Else
        Item.WFRtm_Doc.Delete u.ID
        Item.WFRtm_Doc.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFRtm_DocFnd_Click()
  On Error Resume Next
  fndWFRtm_Doc.ShowForm
End Sub
Private Sub cmdWFRtm_DocRun_Click()
  On Error Resume Next
  gridWFRtm_Doc_DblClick
End Sub
Private Sub gridWFRtm_Doc_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WFRtm_Doc.LoadRow gridWFRtm_Doc, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFRtm_Doc_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFRtm_Doc", Left(Bookmark, 38))
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

Private Sub gridWFRtm_Doc_DblClick()
  cmdWFRtm_DocEdit_Click
End Sub
Private Sub gridWFRtm_Doc_KeyPress(KeyAscii As Integer)
  If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFRtm_Doc.FindOnPress KeyAscii
End Sub

Private Sub gridWFRtm_Doc_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFRtm_Doc.Row And LastRow > 0 Then
  gridWFRtm_Doc.GetRowData(LastRow).RowStyle = "Default"
  gridWFRtm_Doc.GetRowData(gridWFRtm_Doc.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFRtm_DocPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFRtm_Doc.Add()
    If GetFromBuffer(u) Then
      gridWFRtm_Doc.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridWFRtm_Doc_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFRtm_DocCfg_Click
        End If
    End If
End Sub

Private Sub gridWFRtm_Doc_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFRtm_Doc
End If
End Sub
Private Sub mnuWFRtm_DocAdd_click()
   menuActionWFRtm_Doc = "ADD"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocEdit_click()
   menuActionWFRtm_Doc = "EDIT"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocDelete_click()
   menuActionWFRtm_Doc = "DEL"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocOpen_click()
   menuActionWFRtm_Doc = "RUN"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocRef_click()
   menuActionWFRtm_Doc = "REF"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
  Private Sub mnuWFRtm_DocCOPY_Click()
    On Error Resume Next
    If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
    If gridWFRtm_Doc.Row > 0 Then
     If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFRtm_DocCUT_Click()
    On Error Resume Next
    If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
    If gridWFRtm_Doc.Row > 0 Then
     If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFRtm_Doc.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFRtm_DocCHANGE_Click()
  On Error Resume Next
  If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
  If gridWFRtm_Doc.Row > 0 Then
   If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFRtm_Doc.ItemCount = u.Parent.Count
      gridWFRtm_Doc.RefreshRowIndex gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFRtm_DocCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFRtm_DocPrn_click()
   menuActionWFRtm_Doc = "PRN"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocCfg_click()
   menuActionWFRtm_Doc = "CFG"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocFind_click()
   menuActionWFRtm_Doc = "FND"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocAcc_click()
   menuActionWFRtm_Doc = "ACC"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub menuTimerWFRtm_Doc_timer()
   menuTimerWFRtm_Doc.Enabled = False
   If menuActionWFRtm_Doc = "ADD" Then cmdWFRtm_DocAdd_Click
   If menuActionWFRtm_Doc = "EDIT" Then cmdWFRtm_DocEdit_Click
   If menuActionWFRtm_Doc = "DEL" Then cmdWFRtm_DocDel_Click
   If menuActionWFRtm_Doc = "RUN" Then cmdWFRtm_DocRun_Click
   If menuActionWFRtm_Doc = "REF" Then cmdWFRtm_DocRef_Click
   If menuActionWFRtm_Doc = "PRN" Then cmdWFRtm_DocPrn_Click
   If menuActionWFRtm_Doc = "CFG" Then cmdWFRtm_DocCfg_Click
   If menuActionWFRtm_Doc = "FND" Then cmdWFRtm_DocFnd_Click
   If menuActionWFRtm_Doc = "ACC" Then cmdWFRtm_DocAcc_Click
   menuActionWFRtm_Doc = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFRtm_DocAdd, cmdWFRtm_DocAdd.Tag
  LoadBtnPictures cmdWFRtm_DocEdit, cmdWFRtm_DocEdit.Tag
  LoadBtnPictures cmdWFRtm_DocDel, cmdWFRtm_DocDel.Tag
  LoadBtnPictures cmdWFRtm_DocRef, cmdWFRtm_DocRef.Tag
  LoadBtnPictures cmdWFRtm_DocPrn, cmdWFRtm_DocPrn.Tag
  LoadBtnPictures cmdWFRtm_DocFnd, cmdWFRtm_DocFnd.Tag
  Item.WFRtm_Doc.PrepareGrid gridWFRtm_Doc
  LoadGridLayout gridWFRtm_Doc
  Set fndWFRtm_Doc = Nothing
  On Error Resume Next
  Set fndWFRtm_Doc = CreateObject("MTZ_JSetup.GridFinder")
  fndWFRtm_Doc.Init gridWFRtm_Doc
End Sub
Private Sub OnTabClick()

      gridWFRtm_Doc.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFRtm_Doc.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWFRtm_Doc.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWFRtm_Doc = Nothing
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





