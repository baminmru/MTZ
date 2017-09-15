VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnVRCPNeigborhood_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerVRCPNeigborhood 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlVRCPNeigborhood 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdVRCPNeigborhoodAcc 
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
      Begin VB.CommandButton cmdVRCPNeigborhoodFnd 
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
      Begin VB.CommandButton cmdVRCPNeigborhoodCfg 
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
      Begin VB.CommandButton cmdVRCPNeigborhoodPrn 
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
      Begin VB.CommandButton cmdVRCPNeigborhoodRef 
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
      Begin VB.CommandButton cmdVRCPNeigborhoodDel 
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
      Begin VB.CommandButton cmdVRCPNeigborhoodEdit 
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
      Begin VB.CommandButton cmdVRCPNeigborhoodAdd 
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
      Begin GridEX20.GridEX gridVRCPNeigborhood 
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
         Column(1)       =   "vpnVRCPNeigborhood_.ctx":0000
         Column(2)       =   "vpnVRCPNeigborhood_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnVRCPNeigborhood_.ctx":016C
         FormatStyle(2)  =   "vpnVRCPNeigborhood_.ctx":02C8
         FormatStyle(3)  =   "vpnVRCPNeigborhood_.ctx":0378
         FormatStyle(4)  =   "vpnVRCPNeigborhood_.ctx":042C
         FormatStyle(5)  =   "vpnVRCPNeigborhood_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnVRCPNeigborhood_.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdVRCPNeigborhoodRun 
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
   Begin VB.Menu mnuPopupVRCPNeigborhood 
      Caption         =   "Меню для Родственники"
      Visible         =   0   'False
      Begin VB.Menu mnuVRCPNeigborhoodAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuVRCPNeigborhoodEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuVRCPNeigborhoodDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuVRCPNeigborhoodOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuVRCPNeigborhoodRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuVRCPNeigborhoodS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVRCPNeigborhoodBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuVRCPNeigborhoodCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuVRCPNeigborhoodCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuVRCPNeigborhoodPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuVRCPNeigborhoodCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuVRCPNeigborhoodCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuVRCPNeigborhoodPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuVRCPNeigborhoodCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuVRCPNeigborhoodFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuVRCPNeigborhoodAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnVRCPNeigborhood_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndVRCPNeigborhood As Object
Private menuActionVRCPNeigborhood As String





Private Sub opVRCPNeigborhood_OpenRef_(RowItem As Object)
With RowItem
Run_VBOpenRef ID:=.Person.ID, StartMode:="AUTO", RowItem:=RowItem
End With
End Sub
Private Sub cmdVRCPNeigborhoodCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridVRCPNeigborhood, "gridVRCPNeigborhood"
Set jset = Nothing
End Sub

Private Sub cmdVRCPNeigborhoodPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridVRCPNeigborhood, "Родственники"
Set jset = Nothing
End Sub

Private Sub cmdVRCPNeigborhoodRef_Click()
  On Error Resume Next
  Item.VRCPNeigborhood.Refresh
  gridVRCPNeigborhood.ItemCount = Item.VRCPNeigborhood.Count
  gridVRCPNeigborhood.Refetch
  gridVRCPNeigborhood.Refresh
End Sub
Private Sub cmdVRCPNeigborhoodAcc_Click()
On Error Resume Next
If gridVRCPNeigborhood.ItemCount = 0 Then Exit Sub
If gridVRCPNeigborhood.Row > 0 Then
 If gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPNeigborhood.RowBookmark(gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdVRCPNeigborhoodEdit_Click()
  On Error Resume Next
If gridVRCPNeigborhood.ItemCount = 0 Then Exit Sub
If gridVRCPNeigborhood.Row > 0 Then
 If gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPNeigborhood.RowBookmark(gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmVRCPNeigborhood_.Item = u
again:     frmVRCPNeigborhood_.NotFirstTime = False
    frmVRCPNeigborhood_.OnInit
    frmVRCPNeigborhood_.Show vbModal
    If frmVRCPNeigborhood_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridVRCPNeigborhood.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdVRCPNeigborhoodDel_Click()
  On Error Resume Next
  gridVRCPNeigborhood.Delete
End Sub
Private Sub cmdVRCPNeigborhoodAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.VRCPNeigborhood.Add()
 Dim ID As String
 ID = CreateGUID2
 Call u.Application.Manager.NewInstance(ID, "VRCP", "Родственник " & Date)
 Set u.Person = u.Application.Manager.GetInstanceObject(ID)
 u.Save
 u.Application.MTZSession.SetOwner u.Person.ID, u.PartName, u.ID

        gridVRCPNeigborhood.ItemCount = Item.VRCPNeigborhood.Count
        gridVRCPNeigborhood.Refresh
        gridVRCPNeigborhood.RefreshGroups
        gridVRCPNeigborhood.RefreshSort
        gridVRCPNeigborhood.MoveToBookmark u.ID & "VRCPNeigborhood"
        cmdVRCPNeigborhoodRun_Click
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdVRCPNeigborhoodFnd_Click()
  On Error Resume Next
  fndVRCPNeigborhood.ShowForm
End Sub
Private Sub cmdVRCPNeigborhoodRun_Click()
  On Error Resume Next
  gridVRCPNeigborhood_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridVRCPNeigborhood_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.VRCPNeigborhood.LoadRow gridVRCPNeigborhood, RowIndex, Bookmark, Values
End Sub
Private Sub gridVRCPNeigborhood_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridVRCPNeigborhood.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("VRCPNeigborhood", Left(Bookmark, 38))
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

Private Sub gridVRCPNeigborhood_DblClick()
If gridVRCPNeigborhood.ItemCount = 0 Then Exit Sub
If gridVRCPNeigborhood.Row > 0 Then
  If gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPNeigborhood.RowBookmark(gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    On Error Resume Next
    If Not u Is Nothing Then
      opVRCPNeigborhood_OpenRef_ u
    End If
     u.Refresh
  End If
End If
End Sub
Private Sub gridVRCPNeigborhood_KeyPress(KeyAscii As Integer)
  If gridVRCPNeigborhood.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndVRCPNeigborhood.FindOnPress KeyAscii
End Sub

Private Sub gridVRCPNeigborhood_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridVRCPNeigborhood.Row And LastRow > 0 Then
  gridVRCPNeigborhood.GetRowData(LastRow).RowStyle = "Default"
  gridVRCPNeigborhood.GetRowData(gridVRCPNeigborhood.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuVRCPNeigborhoodPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.VRCPNeigborhood.Add()
    If GetFromBuffer(u) Then
      gridVRCPNeigborhood.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridVRCPNeigborhood_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdVRCPNeigborhoodCfg_Click
        End If
    End If
End Sub

Private Sub gridVRCPNeigborhood_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupVRCPNeigborhood
End If
End Sub
Private Sub mnuVRCPNeigborhoodAdd_click()
   menuActionVRCPNeigborhood = "ADD"
   menuTimerVRCPNeigborhood.Enabled = True
End Sub
Private Sub mnuVRCPNeigborhoodEdit_click()
   menuActionVRCPNeigborhood = "EDIT"
   menuTimerVRCPNeigborhood.Enabled = True
End Sub
Private Sub mnuVRCPNeigborhoodDelete_click()
   menuActionVRCPNeigborhood = "DEL"
   menuTimerVRCPNeigborhood.Enabled = True
End Sub
Private Sub mnuVRCPNeigborhoodOpen_click()
   menuActionVRCPNeigborhood = "RUN"
   menuTimerVRCPNeigborhood.Enabled = True
End Sub
Private Sub mnuVRCPNeigborhoodRef_click()
   menuActionVRCPNeigborhood = "REF"
   menuTimerVRCPNeigborhood.Enabled = True
End Sub
  Private Sub mnuVRCPNeigborhoodCOPY_Click()
    On Error Resume Next
    If gridVRCPNeigborhood.ItemCount = 0 Then Exit Sub
    If gridVRCPNeigborhood.Row > 0 Then
     If gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRCPNeigborhood.RowBookmark(gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuVRCPNeigborhoodCUT_Click()
    On Error Resume Next
    If gridVRCPNeigborhood.ItemCount = 0 Then Exit Sub
    If gridVRCPNeigborhood.Row > 0 Then
     If gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRCPNeigborhood.RowBookmark(gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridVRCPNeigborhood.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuVRCPNeigborhoodCHANGE_Click()
  On Error Resume Next
  If gridVRCPNeigborhood.ItemCount = 0 Then Exit Sub
  If gridVRCPNeigborhood.Row > 0 Then
   If gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPNeigborhood.RowBookmark(gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridVRCPNeigborhood.ItemCount = u.Parent.Count
      gridVRCPNeigborhood.RefreshRowIndex gridVRCPNeigborhood.RowIndex(gridVRCPNeigborhood.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuVRCPNeigborhoodCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRCPNeigborhoodPrn_click()
   menuActionVRCPNeigborhood = "PRN"
   menuTimerVRCPNeigborhood.Enabled = True
End Sub
Private Sub mnuVRCPNeigborhoodCfg_click()
   menuActionVRCPNeigborhood = "CFG"
   menuTimerVRCPNeigborhood.Enabled = True
End Sub
Private Sub mnuVRCPNeigborhoodFind_click()
   menuActionVRCPNeigborhood = "FND"
   menuTimerVRCPNeigborhood.Enabled = True
End Sub
Private Sub mnuVRCPNeigborhoodAcc_click()
   menuActionVRCPNeigborhood = "ACC"
   menuTimerVRCPNeigborhood.Enabled = True
End Sub
Private Sub menuTimerVRCPNeigborhood_timer()
   menuTimerVRCPNeigborhood.Enabled = False
   If menuActionVRCPNeigborhood = "ADD" Then cmdVRCPNeigborhoodAdd_Click
   If menuActionVRCPNeigborhood = "EDIT" Then cmdVRCPNeigborhoodEdit_Click
   If menuActionVRCPNeigborhood = "DEL" Then cmdVRCPNeigborhoodDel_Click
   If menuActionVRCPNeigborhood = "RUN" Then cmdVRCPNeigborhoodRun_Click
   If menuActionVRCPNeigborhood = "REF" Then cmdVRCPNeigborhoodRef_Click
   If menuActionVRCPNeigborhood = "PRN" Then cmdVRCPNeigborhoodPrn_Click
   If menuActionVRCPNeigborhood = "CFG" Then cmdVRCPNeigborhoodCfg_Click
   If menuActionVRCPNeigborhood = "FND" Then cmdVRCPNeigborhoodFnd_Click
   If menuActionVRCPNeigborhood = "ACC" Then cmdVRCPNeigborhoodAcc_Click
   menuActionVRCPNeigborhood = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdVRCPNeigborhoodAdd, cmdVRCPNeigborhoodAdd.Tag
  LoadBtnPictures cmdVRCPNeigborhoodEdit, cmdVRCPNeigborhoodEdit.Tag
  LoadBtnPictures cmdVRCPNeigborhoodDel, cmdVRCPNeigborhoodDel.Tag
  LoadBtnPictures cmdVRCPNeigborhoodRef, cmdVRCPNeigborhoodRef.Tag
  LoadBtnPictures cmdVRCPNeigborhoodPrn, cmdVRCPNeigborhoodPrn.Tag
  LoadBtnPictures cmdVRCPNeigborhoodFnd, cmdVRCPNeigborhoodFnd.Tag
  LoadBtnPictures cmdVRCPNeigborhoodRun, cmdVRCPNeigborhoodRun.Tag
  LoadBtnPictures cmdVRCPNeigborhoodAcc, cmdVRCPNeigborhoodAcc.Tag
  LoadBtnPictures cmdVRCPNeigborhoodCfg, cmdVRCPNeigborhoodCfg.Tag
  Item.VRCPNeigborhood.PrepareGrid gridVRCPNeigborhood
  LoadGridLayout gridVRCPNeigborhood
  Set fndVRCPNeigborhood = Nothing
  On Error Resume Next
  Set fndVRCPNeigborhood = CreateObject("MTZ_JSetup.GridFinder")
  fndVRCPNeigborhood.Init gridVRCPNeigborhood
End Sub
Private Sub OnTabClick()

      gridVRCPNeigborhood.Top = 40 * Screen.TwipsPerPixelX
      gridVRCPNeigborhood.Left = 5 * Screen.TwipsPerPixelX
      gridVRCPNeigborhood.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRCPNeigborhood.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridVRCPNeigborhood.Top = 40 * Screen.TwipsPerPixelX
      gridVRCPNeigborhood.Left = 5 * Screen.TwipsPerPixelX
      gridVRCPNeigborhood.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRCPNeigborhood.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlVRCPNeigborhood.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndVRCPNeigborhood = Nothing
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





