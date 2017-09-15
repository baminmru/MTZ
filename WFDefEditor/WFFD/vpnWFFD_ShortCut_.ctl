VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWFFD_ShortCut_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFFD_ShortCut 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFFD_ShortCut 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFFD_ShortCutAcc 
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
      Begin VB.CommandButton cmdWFFD_ShortCutFnd 
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
      Begin VB.CommandButton cmdWFFD_ShortCutCfg 
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
      Begin VB.CommandButton cmdWFFD_ShortCutPrn 
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
      Begin VB.CommandButton cmdWFFD_ShortCutRef 
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
      Begin VB.CommandButton cmdWFFD_ShortCutDel 
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
      Begin VB.CommandButton cmdWFFD_ShortCutEdit 
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
      Begin VB.CommandButton cmdWFFD_ShortCutAdd 
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
      Begin GridEX20.GridEX gridWFFD_ShortCut 
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
         Column(1)       =   "vpnWFFD_ShortCut_.ctx":0000
         Column(2)       =   "vpnWFFD_ShortCut_.ctx":00C8
         FormatStylesCount=   6
         FormatStyle(1)  =   "vpnWFFD_ShortCut_.ctx":016C
         FormatStyle(2)  =   "vpnWFFD_ShortCut_.ctx":02C8
         FormatStyle(3)  =   "vpnWFFD_ShortCut_.ctx":0378
         FormatStyle(4)  =   "vpnWFFD_ShortCut_.ctx":042C
         FormatStyle(5)  =   "vpnWFFD_ShortCut_.ctx":0504
         FormatStyle(6)  =   "vpnWFFD_ShortCut_.ctx":05BC
         ImageCount      =   0
         PrinterProperties=   "vpnWFFD_ShortCut_.ctx":069C
      End
      Begin MTZ_PANEL.DropButton cmdWFFD_ShortCutRun 
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
   Begin VB.Menu mnuPopupWFFD_ShortCut 
      Caption         =   "Меню для Ярлыки"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFD_ShortCutAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFFD_ShortCutEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFFD_ShortCutDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFFD_ShortCutOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFFD_ShortCutRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFFD_ShortCutS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFD_ShortCutBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFFD_ShortCutCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFFD_ShortCutCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFFD_ShortCutPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFFD_ShortCutCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFFD_ShortCutCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFFD_ShortCutPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFFD_ShortCutCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFFD_ShortCutFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFFD_ShortCutAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWFFD_ShortCut_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As WFFD.Application
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFFD_ShortCut As Object
Private menuActionWFFD_ShortCut As String





Private Sub cmdWFFD_ShortCutCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFFD_ShortCut, "gridWFFD_ShortCut"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_ShortCutPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFFD_ShortCut, "Ярлыки"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_ShortCutRef_Click()
  On Error Resume Next
  item.WFFD_ShortCut.Refresh
  gridWFFD_ShortCut.ItemCount = item.WFFD_ShortCut.Count
  gridWFFD_ShortCut.Refetch
  gridWFFD_ShortCut.Refresh
End Sub
Private Sub cmdWFFD_ShortCutAcc_Click()
On Error Resume Next
If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
If gridWFFD_ShortCut.Row > 0 Then
 If gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_ShortCut.RowBookmark(gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFFD_ShortCutEdit_Click()
  On Error Resume Next
If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
If gridWFFD_ShortCut.Row > 0 Then
 If gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_ShortCut.RowBookmark(gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFFD_ShortCut_.item = u
again:     frmWFFD_ShortCut_.NotFirstTime = False
    frmWFFD_ShortCut_.OnInit
    frmWFFD_ShortCut_.Show vbModal
    If frmWFFD_ShortCut_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFFD_ShortCut.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFFD_ShortCutDel_Click()
  On Error Resume Next
  gridWFFD_ShortCut.Delete
End Sub
Private Sub cmdWFFD_ShortCutAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.WFFD_ShortCut.Add()

      Set frmWFFD_ShortCut_.item = u
again:       frmWFFD_ShortCut_.NotFirstTime = False
      frmWFFD_ShortCut_.OnInit
      frmWFFD_ShortCut_.Show vbModal
      If frmWFFD_ShortCut_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFFD_ShortCut.ItemCount = item.WFFD_ShortCut.Count
        gridWFFD_ShortCut.Refresh
        gridWFFD_ShortCut.RefreshGroups
        gridWFFD_ShortCut.RefreshSort
        gridWFFD_ShortCut.MoveToBookmark u.ID & "WFFD_ShortCut"
      Else
        item.WFFD_ShortCut.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFFD_ShortCutFnd_Click()
  On Error Resume Next
  fndWFFD_ShortCut.ShowForm
End Sub
Private Sub cmdWFFD_ShortCutRun_Click()
  On Error Resume Next
  gridWFFD_ShortCut_DblClick
End Sub
Private Sub gridWFFD_ShortCut_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.WFFD_ShortCut.LoadRow gridWFFD_ShortCut, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFFD_ShortCut_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject("WFFD_ShortCut", Left(Bookmark, 38))
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
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridWFFD_ShortCut_DblClick()
  cmdWFFD_ShortCutEdit_Click
End Sub
Private Sub gridWFFD_ShortCut_KeyPress(KeyAscii As Integer)
  If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFFD_ShortCut.FindOnPress KeyAscii
End Sub

Private Sub gridWFFD_ShortCut_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFFD_ShortCut.Row And LastRow > 0 Then
  gridWFFD_ShortCut.GetRowData(LastRow).RowStyle = "Default"
  gridWFFD_ShortCut.GetRowData(gridWFFD_ShortCut.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFFD_ShortCutPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.WFFD_ShortCut.Add()
    If GetFromBuffer(u) Then
      gridWFFD_ShortCut.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFFD_ShortCut_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFFD_ShortCut
End If
End Sub
Private Sub mnuWFFD_ShortCutAdd_click()
   menuActionWFFD_ShortCut = "ADD"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutEdit_click()
   menuActionWFFD_ShortCut = "EDIT"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutDelete_click()
   menuActionWFFD_ShortCut = "DEL"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutOpen_click()
   menuActionWFFD_ShortCut = "RUN"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutRef_click()
   menuActionWFFD_ShortCut = "REF"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
  Private Sub mnuWFFD_ShortCutCOPY_Click()
    On Error Resume Next
    If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
    If gridWFFD_ShortCut.Row > 0 Then
     If gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_ShortCut.RowBookmark(gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFFD_ShortCutCUT_Click()
    On Error Resume Next
    If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
    If gridWFFD_ShortCut.Row > 0 Then
     If gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_ShortCut.RowBookmark(gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFFD_ShortCut.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFFD_ShortCutCHANGE_Click()
  On Error Resume Next
  If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
  If gridWFFD_ShortCut.Row > 0 Then
   If gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_ShortCut.RowBookmark(gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFFD_ShortCut.ItemCount = u.Parent.Count
      gridWFFD_ShortCut.RefreshRowIndex gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFFD_ShortCutCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFD_ShortCutPrn_click()
   menuActionWFFD_ShortCut = "PRN"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutCfg_click()
   menuActionWFFD_ShortCut = "CFG"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutFind_click()
   menuActionWFFD_ShortCut = "FND"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutAcc_click()
   menuActionWFFD_ShortCut = "ACC"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub menuTimerWFFD_ShortCut_timer()
   menuTimerWFFD_ShortCut.Enabled = False
   If menuActionWFFD_ShortCut = "ADD" Then cmdWFFD_ShortCutAdd_Click
   If menuActionWFFD_ShortCut = "EDIT" Then cmdWFFD_ShortCutEdit_Click
   If menuActionWFFD_ShortCut = "DEL" Then cmdWFFD_ShortCutDel_Click
   If menuActionWFFD_ShortCut = "RUN" Then cmdWFFD_ShortCutRun_Click
   If menuActionWFFD_ShortCut = "REF" Then cmdWFFD_ShortCutRef_Click
   If menuActionWFFD_ShortCut = "PRN" Then cmdWFFD_ShortCutPrn_Click
   If menuActionWFFD_ShortCut = "CFG" Then cmdWFFD_ShortCutCfg_Click
   If menuActionWFFD_ShortCut = "FND" Then cmdWFFD_ShortCutFnd_Click
   If menuActionWFFD_ShortCut = "ACC" Then cmdWFFD_ShortCutAcc_Click
   menuActionWFFD_ShortCut = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFFD_ShortCutAdd, cmdWFFD_ShortCutAdd.Tag
  LoadBtnPictures cmdWFFD_ShortCutEdit, cmdWFFD_ShortCutEdit.Tag
  LoadBtnPictures cmdWFFD_ShortCutDel, cmdWFFD_ShortCutDel.Tag
  LoadBtnPictures cmdWFFD_ShortCutRef, cmdWFFD_ShortCutRef.Tag
  LoadBtnPictures cmdWFFD_ShortCutCfg, cmdWFFD_ShortCutCfg.Tag
  LoadBtnPictures cmdWFFD_ShortCutPrn, cmdWFFD_ShortCutPrn.Tag
  LoadBtnPictures cmdWFFD_ShortCutFnd, cmdWFFD_ShortCutFnd.Tag
  LoadBtnPictures cmdWFFD_ShortCutRun, cmdWFFD_ShortCutRun.Tag
  LoadBtnPictures cmdWFFD_ShortCutAcc, cmdWFFD_ShortCutAcc.Tag
  item.WFFD_ShortCut.PrepareGrid gridWFFD_ShortCut
  LoadGridLayout gridWFFD_ShortCut
  Set fndWFFD_ShortCut = Nothing
  On Error Resume Next
  Set fndWFFD_ShortCut = CreateObject("MTZ_JSetup.GridFinder")
  fndWFFD_ShortCut.Init gridWFFD_ShortCut
End Sub
Private Sub OnTabClick()

      gridWFFD_ShortCut.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFFD_ShortCut.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set item = aItem
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
  pnlWFFD_ShortCut.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndWFFD_ShortCut = Nothing
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

  RowItem.Person.Secure item.SecureStyleID
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
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
item.Name = RowItem.Description
ParentForm.Caption = item.Name
item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next
item.Name = RowItem.Name
ParentForm.Caption = item.Name
item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next
item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = item.Name
item.Save
End Sub





