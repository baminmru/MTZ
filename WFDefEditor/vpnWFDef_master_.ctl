VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWFDef_master_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFDef_master 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlWFDef_master 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFDef_masterAcc 
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
      Begin VB.CommandButton cmdWFDef_masterFnd 
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
      Begin VB.CommandButton cmdWFDef_masterCfg 
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
      Begin VB.CommandButton cmdWFDef_masterPrn 
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
      Begin VB.CommandButton cmdWFDef_masterRef 
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
      Begin VB.CommandButton cmdWFDef_masterDel 
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
      Begin VB.CommandButton cmdWFDef_masterEdit 
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
      Begin VB.CommandButton cmdWFDef_masterAdd 
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
      Begin GridEX20.GridEX gridWFDef_master 
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
         Column(1)       =   "vpnWFDef_master_.ctx":0000
         Column(2)       =   "vpnWFDef_master_.ctx":00C8
         FormatStylesCount=   6
         FormatStyle(1)  =   "vpnWFDef_master_.ctx":016C
         FormatStyle(2)  =   "vpnWFDef_master_.ctx":024C
         FormatStyle(3)  =   "vpnWFDef_master_.ctx":03A8
         FormatStyle(4)  =   "vpnWFDef_master_.ctx":0458
         FormatStyle(5)  =   "vpnWFDef_master_.ctx":050C
         FormatStyle(6)  =   "vpnWFDef_master_.ctx":05E4
         ImageCount      =   0
         PrinterProperties=   "vpnWFDef_master_.ctx":069C
      End
      Begin MTZ_PANEL.DropButton cmdWFDef_masterRun 
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
   Begin VB.Menu mnuPopupWFDef_master 
      Caption         =   "Меню для Управляющие"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDef_masterAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDef_masterEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDef_masterDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDef_masterOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDef_masterRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDef_masterS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDef_masterBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDef_masterCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDef_masterCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDef_masterPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDef_masterCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDef_masterCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDef_masterPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDef_masterCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDef_masterFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFDef_masterAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWFDef_master_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFDef_master As Object
Private menuActionWFDef_master As String





Private Sub cmdWFDef_masterCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDef_master, "gridWFDef_master"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_masterPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDef_master, "Управляющие"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_masterRef_Click()
  On Error Resume Next
  item.WFDef_master.Refresh
  gridWFDef_master.ItemCount = item.WFDef_master.Count
  gridWFDef_master.Refetch
  gridWFDef_master.Refresh
End Sub
Private Sub cmdWFDef_masterAcc_Click()
On Error Resume Next
If gridWFDef_master.ItemCount = 0 Then Exit Sub
If gridWFDef_master.Row > 0 Then
 If gridWFDef_master.RowIndex(gridWFDef_master.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_master.RowBookmark(gridWFDef_master.RowIndex(gridWFDef_master.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDef_masterEdit_Click()
  On Error Resume Next
If gridWFDef_master.ItemCount = 0 Then Exit Sub
If gridWFDef_master.Row > 0 Then
 If gridWFDef_master.RowIndex(gridWFDef_master.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_master.RowBookmark(gridWFDef_master.RowIndex(gridWFDef_master.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFDef_master_.item = u
again:     frmWFDef_master_.NotFirstTime = False
    frmWFDef_master_.OnInit
    frmWFDef_master_.Show vbModal
    If frmWFDef_master_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDef_master.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFDef_masterDel_Click()
  On Error Resume Next
  gridWFDef_master.Delete
End Sub
Private Sub cmdWFDef_masterAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.WFDef_master.Add()

      Set frmWFDef_master_.item = u
again:       frmWFDef_master_.NotFirstTime = False
      frmWFDef_master_.OnInit
      frmWFDef_master_.Show vbModal
      If frmWFDef_master_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFDef_master.ItemCount = item.WFDef_master.Count
        gridWFDef_master.Refresh
        gridWFDef_master.RefreshGroups
        gridWFDef_master.RefreshSort
        gridWFDef_master.MoveToBookmark u.ID & "WFDef_master"
      Else
        item.WFDef_master.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFDef_masterFnd_Click()
  On Error Resume Next
  fndWFDef_master.ShowForm
End Sub
Private Sub cmdWFDef_masterRun_Click()
  On Error Resume Next
  gridWFDef_master_DblClick
End Sub
Private Sub gridWFDef_master_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.WFDef_master.LoadRow gridWFDef_master, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFDef_master_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFDef_master.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject("WFDef_master", Left(Bookmark, 38))
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

Private Sub gridWFDef_master_DblClick()
  cmdWFDef_masterEdit_Click
End Sub
Private Sub gridWFDef_master_KeyPress(KeyAscii As Integer)
  If gridWFDef_master.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDef_master.FindOnPress KeyAscii
End Sub

Private Sub gridWFDef_master_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFDef_master.Row And LastRow > 0 Then
  gridWFDef_master.GetRowData(LastRow).RowStyle = "Default"
  gridWFDef_master.GetRowData(gridWFDef_master.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFDef_masterPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.WFDef_master.Add()
    If GetFromBuffer(u) Then
      gridWFDef_master.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFDef_master_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFDef_master
End If
End Sub
Private Sub mnuWFDef_masterAdd_click()
   menuActionWFDef_master = "ADD"
   menuTimerWFDef_master.Enabled = True
End Sub
Private Sub mnuWFDef_masterEdit_click()
   menuActionWFDef_master = "EDIT"
   menuTimerWFDef_master.Enabled = True
End Sub
Private Sub mnuWFDef_masterDelete_click()
   menuActionWFDef_master = "DEL"
   menuTimerWFDef_master.Enabled = True
End Sub
Private Sub mnuWFDef_masterOpen_click()
   menuActionWFDef_master = "RUN"
   menuTimerWFDef_master.Enabled = True
End Sub
Private Sub mnuWFDef_masterRef_click()
   menuActionWFDef_master = "REF"
   menuTimerWFDef_master.Enabled = True
End Sub
  Private Sub mnuWFDef_masterCOPY_Click()
    On Error Resume Next
    If gridWFDef_master.ItemCount = 0 Then Exit Sub
    If gridWFDef_master.Row > 0 Then
     If gridWFDef_master.RowIndex(gridWFDef_master.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_master.RowBookmark(gridWFDef_master.RowIndex(gridWFDef_master.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDef_masterCUT_Click()
    On Error Resume Next
    If gridWFDef_master.ItemCount = 0 Then Exit Sub
    If gridWFDef_master.Row > 0 Then
     If gridWFDef_master.RowIndex(gridWFDef_master.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_master.RowBookmark(gridWFDef_master.RowIndex(gridWFDef_master.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDef_master.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDef_masterCHANGE_Click()
  On Error Resume Next
  If gridWFDef_master.ItemCount = 0 Then Exit Sub
  If gridWFDef_master.Row > 0 Then
   If gridWFDef_master.RowIndex(gridWFDef_master.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_master.RowBookmark(gridWFDef_master.RowIndex(gridWFDef_master.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDef_master.ItemCount = u.Parent.Count
      gridWFDef_master.RefreshRowIndex gridWFDef_master.RowIndex(gridWFDef_master.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDef_masterCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDef_masterPrn_click()
   menuActionWFDef_master = "PRN"
   menuTimerWFDef_master.Enabled = True
End Sub
Private Sub mnuWFDef_masterCfg_click()
   menuActionWFDef_master = "CFG"
   menuTimerWFDef_master.Enabled = True
End Sub
Private Sub mnuWFDef_masterFind_click()
   menuActionWFDef_master = "FND"
   menuTimerWFDef_master.Enabled = True
End Sub
Private Sub mnuWFDef_masterAcc_click()
   menuActionWFDef_master = "ACC"
   menuTimerWFDef_master.Enabled = True
End Sub
Private Sub menuTimerWFDef_master_timer()
   menuTimerWFDef_master.Enabled = False
   If menuActionWFDef_master = "ADD" Then cmdWFDef_masterAdd_Click
   If menuActionWFDef_master = "EDIT" Then cmdWFDef_masterEdit_Click
   If menuActionWFDef_master = "DEL" Then cmdWFDef_masterDel_Click
   If menuActionWFDef_master = "RUN" Then cmdWFDef_masterRun_Click
   If menuActionWFDef_master = "REF" Then cmdWFDef_masterRef_Click
   If menuActionWFDef_master = "PRN" Then cmdWFDef_masterPrn_Click
   If menuActionWFDef_master = "CFG" Then cmdWFDef_masterCfg_Click
   If menuActionWFDef_master = "FND" Then cmdWFDef_masterFnd_Click
   If menuActionWFDef_master = "ACC" Then cmdWFDef_masterAcc_Click
   menuActionWFDef_master = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFDef_masterAdd, cmdWFDef_masterAdd.Tag
  LoadBtnPictures cmdWFDef_masterEdit, cmdWFDef_masterEdit.Tag
  LoadBtnPictures cmdWFDef_masterDel, cmdWFDef_masterDel.Tag
  LoadBtnPictures cmdWFDef_masterRef, cmdWFDef_masterRef.Tag
  LoadBtnPictures cmdWFDef_masterCfg, cmdWFDef_masterCfg.Tag
  LoadBtnPictures cmdWFDef_masterPrn, cmdWFDef_masterPrn.Tag
  LoadBtnPictures cmdWFDef_masterFnd, cmdWFDef_masterFnd.Tag
  LoadBtnPictures cmdWFDef_masterRun, cmdWFDef_masterRun.Tag
  LoadBtnPictures cmdWFDef_masterAcc, cmdWFDef_masterAcc.Tag
  item.WFDef_master.PrepareGrid gridWFDef_master
  LoadGridLayout gridWFDef_master
  Set fndWFDef_master = Nothing
  On Error Resume Next
  Set fndWFDef_master = CreateObject("MTZ_JSetup.GridFinder")
  fndWFDef_master.Init gridWFDef_master
End Sub
Private Sub OnTabClick()

      gridWFDef_master.Top = 40 * Screen.TwipsPerPixelX
      gridWFDef_master.Left = 5 * Screen.TwipsPerPixelX
      gridWFDef_master.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFDef_master.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFDef_master.Top = 40 * Screen.TwipsPerPixelX
      gridWFDef_master.Left = 5 * Screen.TwipsPerPixelX
      gridWFDef_master.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFDef_master.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
Private Sub Usercontrol_resize()
  On Error Resume Next
  pnlWFDef_master.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndWFDef_master = Nothing
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





