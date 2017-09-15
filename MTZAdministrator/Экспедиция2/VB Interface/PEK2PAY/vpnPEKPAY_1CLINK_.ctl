VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnPEKPAY_1CLINK_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKPAY_1CLINK 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKPAY_1CLINK 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKPAY_1CLINKFnd 
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
      Begin VB.CommandButton cmdPEKPAY_1CLINKPrn 
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
      Begin VB.CommandButton cmdPEKPAY_1CLINKRef 
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
      Begin VB.CommandButton cmdPEKPAY_1CLINKDel 
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
      Begin VB.CommandButton cmdPEKPAY_1CLINKEdit 
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
      Begin VB.CommandButton cmdPEKPAY_1CLINKAdd 
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
      Begin GridEX20.GridEX gridPEKPAY_1CLINK 
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
         Column(1)       =   "vpnPEKPAY_1CLINK_.ctx":0000
         Column(2)       =   "vpnPEKPAY_1CLINK_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKPAY_1CLINK_.ctx":016C
         FormatStyle(2)  =   "vpnPEKPAY_1CLINK_.ctx":02C8
         FormatStyle(3)  =   "vpnPEKPAY_1CLINK_.ctx":0378
         FormatStyle(4)  =   "vpnPEKPAY_1CLINK_.ctx":042C
         FormatStyle(5)  =   "vpnPEKPAY_1CLINK_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKPAY_1CLINK_.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupPEKPAY_1CLINK 
      Caption         =   "Меню для Связь с 1С"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKPAY_1CLINKAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKPAY_1CLINKEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKPAY_1CLINKDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKPAY_1CLINKOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKPAY_1CLINKRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKPAY_1CLINKPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKPAY_1CLINKCfg 
         Caption         =   "Настроить"
      End
   End
End
Attribute VB_Name = "vpnPEKPAY_1CLINK_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKPAY_1CLINK As Object
Private menuActionPEKPAY_1CLINK As String





Private Sub cmdPEKPAY_1CLINKCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKPAY_1CLINK, "gridPEKPAY_1CLINK"
Set jset = Nothing
End Sub

Private Sub cmdPEKPAY_1CLINKPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKPAY_1CLINK, "Связь с 1С"
Set jset = Nothing
End Sub

Private Sub cmdPEKPAY_1CLINKRef_Click()
  On Error Resume Next
  Item.PEKPAY_1CLINK.Refresh
  gridPEKPAY_1CLINK.ItemCount = Item.PEKPAY_1CLINK.Count
  gridPEKPAY_1CLINK.Refetch
  gridPEKPAY_1CLINK.Refresh
End Sub
Private Sub cmdPEKPAY_1CLINKAcc_Click()
On Error Resume Next
If gridPEKPAY_1CLINK.ItemCount = 0 Then Exit Sub
If gridPEKPAY_1CLINK.Row > 0 Then
 If gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKPAY_1CLINK.RowBookmark(gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKPAY_1CLINKEdit_Click()
  On Error Resume Next
If gridPEKPAY_1CLINK.ItemCount = 0 Then Exit Sub
If gridPEKPAY_1CLINK.Row > 0 Then
 If gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKPAY_1CLINK.RowBookmark(gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKPAY_1CLINK_.Item = u
again:     frmPEKPAY_1CLINK_.NotFirstTime = False
    frmPEKPAY_1CLINK_.OnInit
    frmPEKPAY_1CLINK_.Show vbModal
    If frmPEKPAY_1CLINK_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKPAY_1CLINK.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKPAY_1CLINKDel_Click()
  On Error Resume Next
  gridPEKPAY_1CLINK.Delete
End Sub
Private Sub cmdPEKPAY_1CLINKAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.PEKPAY_1CLINK.Add()

      Set frmPEKPAY_1CLINK_.Item = u
again:       frmPEKPAY_1CLINK_.NotFirstTime = False
      frmPEKPAY_1CLINK_.OnInit
      frmPEKPAY_1CLINK_.Show vbModal
      If frmPEKPAY_1CLINK_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKPAY_1CLINK.ItemCount = Item.PEKPAY_1CLINK.Count
        gridPEKPAY_1CLINK.Refresh
        gridPEKPAY_1CLINK.RefreshGroups
        gridPEKPAY_1CLINK.RefreshSort
        gridPEKPAY_1CLINK.MoveToBookmark u.ID & "PEKPAY_1CLINK"
      Else
        Item.PEKPAY_1CLINK.Delete u.ID
        Item.PEKPAY_1CLINK.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKPAY_1CLINKFnd_Click()
  On Error Resume Next
  fndPEKPAY_1CLINK.ShowForm
End Sub
Private Sub cmdPEKPAY_1CLINKRun_Click()
  On Error Resume Next
  gridPEKPAY_1CLINK_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKPAY_1CLINK_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKPAY_1CLINK.LoadRow gridPEKPAY_1CLINK, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKPAY_1CLINK_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKPAY_1CLINK.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("PEKPAY_1CLINK", Left(Bookmark, 38))
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

Private Sub gridPEKPAY_1CLINK_DblClick()
  cmdPEKPAY_1CLINKEdit_Click
End Sub
Private Sub gridPEKPAY_1CLINK_KeyPress(KeyAscii As Integer)
  If gridPEKPAY_1CLINK.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKPAY_1CLINK.FindOnPress KeyAscii
End Sub

Private Sub gridPEKPAY_1CLINK_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKPAY_1CLINK.Row And LastRow > 0 Then
  gridPEKPAY_1CLINK.GetRowData(LastRow).RowStyle = "Default"
  gridPEKPAY_1CLINK.GetRowData(gridPEKPAY_1CLINK.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKPAY_1CLINKPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKPAY_1CLINK.Add()
    If GetFromBuffer(u) Then
      gridPEKPAY_1CLINK.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKPAY_1CLINK_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKPAY_1CLINKCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKPAY_1CLINK_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKPAY_1CLINK
End If
End Sub
Private Sub mnuPEKPAY_1CLINKAdd_click()
   menuActionPEKPAY_1CLINK = "ADD"
   menuTimerPEKPAY_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKPAY_1CLINKEdit_click()
   menuActionPEKPAY_1CLINK = "EDIT"
   menuTimerPEKPAY_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKPAY_1CLINKDelete_click()
   menuActionPEKPAY_1CLINK = "DEL"
   menuTimerPEKPAY_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKPAY_1CLINKOpen_click()
   menuActionPEKPAY_1CLINK = "RUN"
   menuTimerPEKPAY_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKPAY_1CLINKRef_click()
   menuActionPEKPAY_1CLINK = "REF"
   menuTimerPEKPAY_1CLINK.Enabled = True
End Sub
  Private Sub mnuPEKPAY_1CLINKCOPY_Click()
    On Error Resume Next
    If gridPEKPAY_1CLINK.ItemCount = 0 Then Exit Sub
    If gridPEKPAY_1CLINK.Row > 0 Then
     If gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKPAY_1CLINK.RowBookmark(gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKPAY_1CLINKCUT_Click()
    On Error Resume Next
    If gridPEKPAY_1CLINK.ItemCount = 0 Then Exit Sub
    If gridPEKPAY_1CLINK.Row > 0 Then
     If gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKPAY_1CLINK.RowBookmark(gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKPAY_1CLINK.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKPAY_1CLINKCHANGE_Click()
  On Error Resume Next
  If gridPEKPAY_1CLINK.ItemCount = 0 Then Exit Sub
  If gridPEKPAY_1CLINK.Row > 0 Then
   If gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKPAY_1CLINK.RowBookmark(gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKPAY_1CLINK.ItemCount = u.Parent.Count
      gridPEKPAY_1CLINK.RefreshRowIndex gridPEKPAY_1CLINK.RowIndex(gridPEKPAY_1CLINK.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKPAY_1CLINKCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKPAY_1CLINKPrn_click()
   menuActionPEKPAY_1CLINK = "PRN"
   menuTimerPEKPAY_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKPAY_1CLINKCfg_click()
   menuActionPEKPAY_1CLINK = "CFG"
   menuTimerPEKPAY_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKPAY_1CLINKFind_click()
   menuActionPEKPAY_1CLINK = "FND"
   menuTimerPEKPAY_1CLINK.Enabled = True
End Sub
Private Sub mnuPEKPAY_1CLINKAcc_click()
   menuActionPEKPAY_1CLINK = "ACC"
   menuTimerPEKPAY_1CLINK.Enabled = True
End Sub
Private Sub menuTimerPEKPAY_1CLINK_timer()
   menuTimerPEKPAY_1CLINK.Enabled = False
   If menuActionPEKPAY_1CLINK = "ADD" Then cmdPEKPAY_1CLINKAdd_Click
   If menuActionPEKPAY_1CLINK = "EDIT" Then cmdPEKPAY_1CLINKEdit_Click
   If menuActionPEKPAY_1CLINK = "DEL" Then cmdPEKPAY_1CLINKDel_Click
   If menuActionPEKPAY_1CLINK = "RUN" Then cmdPEKPAY_1CLINKRun_Click
   If menuActionPEKPAY_1CLINK = "REF" Then cmdPEKPAY_1CLINKRef_Click
   If menuActionPEKPAY_1CLINK = "PRN" Then cmdPEKPAY_1CLINKPrn_Click
   If menuActionPEKPAY_1CLINK = "CFG" Then cmdPEKPAY_1CLINKCfg_Click
   If menuActionPEKPAY_1CLINK = "FND" Then cmdPEKPAY_1CLINKFnd_Click
   If menuActionPEKPAY_1CLINK = "ACC" Then cmdPEKPAY_1CLINKAcc_Click
   menuActionPEKPAY_1CLINK = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKPAY_1CLINKAdd, cmdPEKPAY_1CLINKAdd.Tag
  LoadBtnPictures cmdPEKPAY_1CLINKEdit, cmdPEKPAY_1CLINKEdit.Tag
  LoadBtnPictures cmdPEKPAY_1CLINKDel, cmdPEKPAY_1CLINKDel.Tag
  LoadBtnPictures cmdPEKPAY_1CLINKRef, cmdPEKPAY_1CLINKRef.Tag
  LoadBtnPictures cmdPEKPAY_1CLINKPrn, cmdPEKPAY_1CLINKPrn.Tag
  LoadBtnPictures cmdPEKPAY_1CLINKFnd, cmdPEKPAY_1CLINKFnd.Tag
  Item.PEKPAY_1CLINK.PrepareGrid gridPEKPAY_1CLINK
  LoadGridLayout gridPEKPAY_1CLINK
  Set fndPEKPAY_1CLINK = Nothing
  On Error Resume Next
  Set fndPEKPAY_1CLINK = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKPAY_1CLINK.Init gridPEKPAY_1CLINK
End Sub
Private Sub OnTabClick()

      gridPEKPAY_1CLINK.Top = 40 * Screen.TwipsPerPixelX
      gridPEKPAY_1CLINK.Left = 5 * Screen.TwipsPerPixelX
      gridPEKPAY_1CLINK.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKPAY_1CLINK.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKPAY_1CLINK.Top = 40 * Screen.TwipsPerPixelX
      gridPEKPAY_1CLINK.Left = 5 * Screen.TwipsPerPixelX
      gridPEKPAY_1CLINK.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKPAY_1CLINK.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKPAY_1CLINK.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKPAY_1CLINK = Nothing
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
 'ID = CreateGUID2
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





