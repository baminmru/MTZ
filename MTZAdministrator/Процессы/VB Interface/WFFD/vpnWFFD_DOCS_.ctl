VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnWFFD_DOCS_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFFD_DOCS 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFFD_DOCS 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFFD_DOCSFnd 
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
      Begin VB.CommandButton cmdWFFD_DOCSPrn 
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
      Begin VB.CommandButton cmdWFFD_DOCSRef 
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
      Begin VB.CommandButton cmdWFFD_DOCSDel 
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
      Begin VB.CommandButton cmdWFFD_DOCSEdit 
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
      Begin VB.CommandButton cmdWFFD_DOCSAdd 
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
      Begin GridEX20.GridEX gridWFFD_DOCS 
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
         Column(1)       =   "vpnWFFD_DOCS_.ctx":0000
         Column(2)       =   "vpnWFFD_DOCS_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFFD_DOCS_.ctx":016C
         FormatStyle(2)  =   "vpnWFFD_DOCS_.ctx":02C8
         FormatStyle(3)  =   "vpnWFFD_DOCS_.ctx":0378
         FormatStyle(4)  =   "vpnWFFD_DOCS_.ctx":042C
         FormatStyle(5)  =   "vpnWFFD_DOCS_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWFFD_DOCS_.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupWFFD_DOCS 
      Caption         =   "Меню для Документы для шага"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFD_DOCSAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFFD_DOCSEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFFD_DOCSDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFFD_DOCSOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFFD_DOCSRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFFD_DOCSS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFD_DOCSBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFFD_DOCSCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFFD_DOCSCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFFD_DOCSPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFFD_DOCSCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFFD_DOCSCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFFD_DOCSPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFFD_DOCSCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFFD_DOCSFind 
         Caption         =   "Поиск"
      End
   End
End
Attribute VB_Name = "vpnWFFD_DOCS_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFFD_DOCS As Object
Private menuActionWFFD_DOCS As String





Private Sub cmdWFFD_DOCSCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFFD_DOCS, "gridWFFD_DOCS"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_DOCSPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFFD_DOCS, "Документы для шага"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_DOCSRef_Click()
  On Error Resume Next
  Item.WFFD_DOCS.Refresh
  gridWFFD_DOCS.ItemCount = Item.WFFD_DOCS.Count
  gridWFFD_DOCS.Refetch
  gridWFFD_DOCS.Refresh
End Sub
Private Sub cmdWFFD_DOCSAcc_Click()
On Error Resume Next
If gridWFFD_DOCS.ItemCount = 0 Then Exit Sub
If gridWFFD_DOCS.Row > 0 Then
 If gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_DOCS.RowBookmark(gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFFD_DOCSEdit_Click()
  On Error Resume Next
If gridWFFD_DOCS.ItemCount = 0 Then Exit Sub
If gridWFFD_DOCS.Row > 0 Then
 If gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_DOCS.RowBookmark(gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFFD_DOCS_.Item = u
again:     frmWFFD_DOCS_.NotFirstTime = False
    frmWFFD_DOCS_.OnInit
    frmWFFD_DOCS_.Show vbModal
    If frmWFFD_DOCS_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFFD_DOCS.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFFD_DOCSDel_Click()
  On Error Resume Next
  gridWFFD_DOCS.Delete
End Sub
Private Sub cmdWFFD_DOCSAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFFD_DOCS.Add()

      Set frmWFFD_DOCS_.Item = u
again:       frmWFFD_DOCS_.NotFirstTime = False
      frmWFFD_DOCS_.OnInit
      frmWFFD_DOCS_.Show vbModal
      If frmWFFD_DOCS_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFFD_DOCS.ItemCount = Item.WFFD_DOCS.Count
        gridWFFD_DOCS.Refresh
        gridWFFD_DOCS.RefreshGroups
        gridWFFD_DOCS.RefreshSort
        gridWFFD_DOCS.MoveToBookmark u.ID & "WFFD_DOCS"
      Else
        Item.WFFD_DOCS.Delete u.ID
        Item.WFFD_DOCS.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFFD_DOCSFnd_Click()
  On Error Resume Next
  fndWFFD_DOCS.ShowForm
End Sub
Private Sub cmdWFFD_DOCSRun_Click()
  On Error Resume Next
  gridWFFD_DOCS_DblClick
End Sub
Private Sub gridWFFD_DOCS_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WFFD_DOCS.LoadRow gridWFFD_DOCS, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFFD_DOCS_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFFD_DOCS.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFFD_DOCS", Left(Bookmark, 38))
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

Private Sub gridWFFD_DOCS_DblClick()
  cmdWFFD_DOCSEdit_Click
End Sub
Private Sub gridWFFD_DOCS_KeyPress(KeyAscii As Integer)
  If gridWFFD_DOCS.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFFD_DOCS.FindOnPress KeyAscii
End Sub

Private Sub gridWFFD_DOCS_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFFD_DOCS.Row And LastRow > 0 Then
  gridWFFD_DOCS.GetRowData(LastRow).RowStyle = "Default"
  gridWFFD_DOCS.GetRowData(gridWFFD_DOCS.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFFD_DOCSPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFFD_DOCS.Add()
    If GetFromBuffer(u) Then
      gridWFFD_DOCS.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridWFFD_DOCS_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFFD_DOCSCfg_Click
        End If
    End If
End Sub

Private Sub gridWFFD_DOCS_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFFD_DOCS
End If
End Sub
Private Sub mnuWFFD_DOCSAdd_click()
   menuActionWFFD_DOCS = "ADD"
   menuTimerWFFD_DOCS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSEdit_click()
   menuActionWFFD_DOCS = "EDIT"
   menuTimerWFFD_DOCS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSDelete_click()
   menuActionWFFD_DOCS = "DEL"
   menuTimerWFFD_DOCS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSOpen_click()
   menuActionWFFD_DOCS = "RUN"
   menuTimerWFFD_DOCS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSRef_click()
   menuActionWFFD_DOCS = "REF"
   menuTimerWFFD_DOCS.Enabled = True
End Sub
  Private Sub mnuWFFD_DOCSCOPY_Click()
    On Error Resume Next
    If gridWFFD_DOCS.ItemCount = 0 Then Exit Sub
    If gridWFFD_DOCS.Row > 0 Then
     If gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_DOCS.RowBookmark(gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFFD_DOCSCUT_Click()
    On Error Resume Next
    If gridWFFD_DOCS.ItemCount = 0 Then Exit Sub
    If gridWFFD_DOCS.Row > 0 Then
     If gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_DOCS.RowBookmark(gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFFD_DOCS.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFFD_DOCSCHANGE_Click()
  On Error Resume Next
  If gridWFFD_DOCS.ItemCount = 0 Then Exit Sub
  If gridWFFD_DOCS.Row > 0 Then
   If gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_DOCS.RowBookmark(gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFFD_DOCS.ItemCount = u.Parent.Count
      gridWFFD_DOCS.RefreshRowIndex gridWFFD_DOCS.RowIndex(gridWFFD_DOCS.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFFD_DOCSCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFD_DOCSPrn_click()
   menuActionWFFD_DOCS = "PRN"
   menuTimerWFFD_DOCS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSCfg_click()
   menuActionWFFD_DOCS = "CFG"
   menuTimerWFFD_DOCS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSFind_click()
   menuActionWFFD_DOCS = "FND"
   menuTimerWFFD_DOCS.Enabled = True
End Sub
Private Sub mnuWFFD_DOCSAcc_click()
   menuActionWFFD_DOCS = "ACC"
   menuTimerWFFD_DOCS.Enabled = True
End Sub
Private Sub menuTimerWFFD_DOCS_timer()
   menuTimerWFFD_DOCS.Enabled = False
   If menuActionWFFD_DOCS = "ADD" Then cmdWFFD_DOCSAdd_Click
   If menuActionWFFD_DOCS = "EDIT" Then cmdWFFD_DOCSEdit_Click
   If menuActionWFFD_DOCS = "DEL" Then cmdWFFD_DOCSDel_Click
   If menuActionWFFD_DOCS = "RUN" Then cmdWFFD_DOCSRun_Click
   If menuActionWFFD_DOCS = "REF" Then cmdWFFD_DOCSRef_Click
   If menuActionWFFD_DOCS = "PRN" Then cmdWFFD_DOCSPrn_Click
   If menuActionWFFD_DOCS = "CFG" Then cmdWFFD_DOCSCfg_Click
   If menuActionWFFD_DOCS = "FND" Then cmdWFFD_DOCSFnd_Click
   If menuActionWFFD_DOCS = "ACC" Then cmdWFFD_DOCSAcc_Click
   menuActionWFFD_DOCS = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFFD_DOCSAdd, cmdWFFD_DOCSAdd.Tag
  LoadBtnPictures cmdWFFD_DOCSEdit, cmdWFFD_DOCSEdit.Tag
  LoadBtnPictures cmdWFFD_DOCSDel, cmdWFFD_DOCSDel.Tag
  LoadBtnPictures cmdWFFD_DOCSRef, cmdWFFD_DOCSRef.Tag
  LoadBtnPictures cmdWFFD_DOCSPrn, cmdWFFD_DOCSPrn.Tag
  LoadBtnPictures cmdWFFD_DOCSFnd, cmdWFFD_DOCSFnd.Tag
  Item.WFFD_DOCS.PrepareGrid gridWFFD_DOCS
  LoadGridLayout gridWFFD_DOCS
  Set fndWFFD_DOCS = Nothing
  On Error Resume Next
  Set fndWFFD_DOCS = CreateObject("MTZ_JSetup.GridFinder")
  fndWFFD_DOCS.Init gridWFFD_DOCS
End Sub
Private Sub OnTabClick()

      gridWFFD_DOCS.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_DOCS.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_DOCS.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_DOCS.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFFD_DOCS.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_DOCS.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_DOCS.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_DOCS.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlWFFD_DOCS.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWFFD_DOCS = Nothing
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





