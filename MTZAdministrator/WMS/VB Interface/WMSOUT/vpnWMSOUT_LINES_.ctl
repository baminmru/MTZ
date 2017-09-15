VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWMSOUT_LINES_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWMSOUT_PALET 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerWMSOUT_LINES 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlWMSOUT_LINES 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdWMSOUT_PALETAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   20
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdWMSOUT_PALETRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   19
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdWMSOUT_PALETFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   18
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWMSOUT_PALETCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   17
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWMSOUT_PALETPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   16
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWMSOUT_PALETRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   15
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWMSOUT_PALETDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWMSOUT_PALETEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   13
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWMSOUT_PALETAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridWMSOUT_PALET 
         Height          =   480
         Left            =   3900
         TabIndex        =   11
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
         Column(1)       =   "vpnWMSOUT_LINES_.ctx":0000
         Column(2)       =   "vpnWMSOUT_LINES_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWMSOUT_LINES_.ctx":016C
         FormatStyle(2)  =   "vpnWMSOUT_LINES_.ctx":02C8
         FormatStyle(3)  =   "vpnWMSOUT_LINES_.ctx":0378
         FormatStyle(4)  =   "vpnWMSOUT_LINES_.ctx":042C
         FormatStyle(5)  =   "vpnWMSOUT_LINES_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWMSOUT_LINES_.ctx":05BC
      End
      Begin VB.CommandButton cmdWMSOUT_LINESAcc 
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
      Begin MTZ_PANEL.DropButton cmdWMSOUT_LINESRun 
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
      Begin VB.CommandButton cmdWMSOUT_LINESFnd 
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
      Begin VB.CommandButton cmdWMSOUT_LINESCfg 
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
      Begin VB.CommandButton cmdWMSOUT_LINESPrn 
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
      Begin VB.CommandButton cmdWMSOUT_LINESRef 
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
      Begin VB.CommandButton cmdWMSOUT_LINESDel 
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
      Begin VB.CommandButton cmdWMSOUT_LINESEdit 
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
      Begin VB.CommandButton cmdWMSOUT_LINESAdd 
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
      Begin GridEX20.GridEX gridWMSOUT_LINES 
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
         Column(1)       =   "vpnWMSOUT_LINES_.ctx":0794
         Column(2)       =   "vpnWMSOUT_LINES_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWMSOUT_LINES_.ctx":0900
         FormatStyle(2)  =   "vpnWMSOUT_LINES_.ctx":0A5C
         FormatStyle(3)  =   "vpnWMSOUT_LINES_.ctx":0B0C
         FormatStyle(4)  =   "vpnWMSOUT_LINES_.ctx":0BC0
         FormatStyle(5)  =   "vpnWMSOUT_LINES_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnWMSOUT_LINES_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupWMSOUT_LINES 
      Caption         =   "Меню для Строки заказа"
      Visible         =   0   'False
      Begin VB.Menu mnuWMSOUT_LINESAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWMSOUT_LINESEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWMSOUT_LINESDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWMSOUT_LINESOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWMSOUT_LINESRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWMSOUT_LINESS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWMSOUT_LINESBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWMSOUT_LINESCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWMSOUT_LINESCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWMSOUT_LINESPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWMSOUT_LINESCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWMSOUT_LINESCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWMSOUT_LINESPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWMSOUT_LINESCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWMSOUT_LINESFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWMSOUT_LINESAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWMSOUT_PALET 
      Caption         =   "Меню для Палеты к строке"
      Visible         =   0   'False
      Begin VB.Menu mnuWMSOUT_PALETAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWMSOUT_PALETEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWMSOUT_PALETDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWMSOUT_PALETOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWMSOUT_PALETRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWMSOUT_PALETS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWMSOUT_PALETBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWMSOUT_PALETCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWMSOUT_PALETCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWMSOUT_PALETPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWMSOUT_PALETCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWMSOUT_PALETCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWMSOUT_PALETPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWMSOUT_PALETCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWMSOUT_PALETFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWMSOUT_PALETAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWMSOUT_LINES_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWMSOUT_LINES As Object
Private menuActionWMSOUT_LINES As String
Private fndWMSOUT_PALET As Object
Private menuActionWMSOUT_PALET As String





Private Sub pnlWMSOUT_LINES_PositionChanged()
  pnlWMSOUT_LINES.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridWMSOUT_LINES_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWMSOUT_LINESCfg_Click
        End If
    End If
End Sub

Private Sub gridWMSOUT_LINES_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWMSOUT_LINES
End If
End Sub
Private Sub mnuWMSOUT_LINESAdd_click()
   menuActionWMSOUT_LINES = "ADD"
   menuTimerWMSOUT_LINES.Enabled = True
End Sub
Private Sub mnuWMSOUT_LINESEdit_click()
   menuActionWMSOUT_LINES = "EDIT"
   menuTimerWMSOUT_LINES.Enabled = True
End Sub
Private Sub mnuWMSOUT_LINESDelete_click()
   menuActionWMSOUT_LINES = "DEL"
   menuTimerWMSOUT_LINES.Enabled = True
End Sub
Private Sub mnuWMSOUT_LINESOpen_click()
   menuActionWMSOUT_LINES = "RUN"
   menuTimerWMSOUT_LINES.Enabled = True
End Sub
Private Sub mnuWMSOUT_LINESRef_click()
   menuActionWMSOUT_LINES = "REF"
   menuTimerWMSOUT_LINES.Enabled = True
End Sub
  Private Sub mnuWMSOUT_LINESCOPY_Click()
    On Error Resume Next
    If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
    If gridWMSOUT_LINES.Row > 0 Then
     If gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSOUT_LINES.RowBookmark(gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWMSOUT_LINESCUT_Click()
    On Error Resume Next
    If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
    If gridWMSOUT_LINES.Row > 0 Then
     If gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSOUT_LINES.RowBookmark(gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWMSOUT_LINES.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWMSOUT_LINESCHANGE_Click()
  On Error Resume Next
  If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
  If gridWMSOUT_LINES.Row > 0 Then
   If gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSOUT_LINES.RowBookmark(gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWMSOUT_LINES.ItemCount = u.Parent.Count
      gridWMSOUT_LINES.RefreshRowIndex gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWMSOUT_LINESCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWMSOUT_LINESPrn_click()
   menuActionWMSOUT_LINES = "PRN"
   menuTimerWMSOUT_LINES.Enabled = True
End Sub
Private Sub mnuWMSOUT_LINESCfg_click()
   menuActionWMSOUT_LINES = "CFG"
   menuTimerWMSOUT_LINES.Enabled = True
End Sub
Private Sub mnuWMSOUT_LINESFind_click()
   menuActionWMSOUT_LINES = "FND"
   menuTimerWMSOUT_LINES.Enabled = True
End Sub
Private Sub mnuWMSOUT_LINESAcc_click()
   menuActionWMSOUT_LINES = "ACC"
   menuTimerWMSOUT_LINES.Enabled = True
End Sub
Private Sub menuTimerWMSOUT_LINES_timer()
   menuTimerWMSOUT_LINES.Enabled = False
   If menuActionWMSOUT_LINES = "ADD" Then cmdWMSOUT_LINESAdd_Click
   If menuActionWMSOUT_LINES = "EDIT" Then cmdWMSOUT_LINESEdit_Click
   If menuActionWMSOUT_LINES = "DEL" Then cmdWMSOUT_LINESDel_Click
   If menuActionWMSOUT_LINES = "RUN" Then cmdWMSOUT_LINESRun_Click
   If menuActionWMSOUT_LINES = "REF" Then cmdWMSOUT_LINESRef_Click
   If menuActionWMSOUT_LINES = "PRN" Then cmdWMSOUT_LINESPrn_Click
   If menuActionWMSOUT_LINES = "CFG" Then cmdWMSOUT_LINESCfg_Click
   If menuActionWMSOUT_LINES = "FND" Then cmdWMSOUT_LINESFnd_Click
   If menuActionWMSOUT_LINES = "ACC" Then cmdWMSOUT_LINESAcc_Click
   menuActionWMSOUT_LINES = ""
End Sub
Private Sub cmdWMSOUT_LINESCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWMSOUT_LINES, "gridWMSOUT_LINES"
Set jset = Nothing
End Sub

Private Sub cmdWMSOUT_LINESPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWMSOUT_LINES, "Строки заказа"
Set jset = Nothing
End Sub

Private Sub cmdWMSOUT_LINESRef_Click()
  On Error Resume Next
  item.WMSOUT_LINES.Refresh
  gridWMSOUT_LINES.ItemCount = item.WMSOUT_LINES.Count
  gridWMSOUT_LINES.Refetch
  gridWMSOUT_LINES.Refresh
End Sub
Private Sub cmdWMSOUT_LINESAcc_Click()
On Error Resume Next
If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
If gridWMSOUT_LINES.Row > 0 Then
 If gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSOUT_LINES.RowBookmark(gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWMSOUT_LINESEdit_Click()
  On Error Resume Next
If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
If gridWMSOUT_LINES.Row > 0 Then
 If gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSOUT_LINES.RowBookmark(gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWMSOUT_LINES_.item = u
again:     frmWMSOUT_LINES_.NotFirstTime = False
    frmWMSOUT_LINES_.OnInit
    frmWMSOUT_LINES_.Show vbModal
    If frmWMSOUT_LINES_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWMSOUT_LINES.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWMSOUT_LINESDel_Click()
  On Error Resume Next
  gridWMSOUT_LINES.Delete
End Sub
Private Sub cmdWMSOUT_LINESAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.WMSOUT_LINES.Add()

      Set frmWMSOUT_LINES_.item = u
again:       frmWMSOUT_LINES_.NotFirstTime = False
      frmWMSOUT_LINES_.OnInit
      frmWMSOUT_LINES_.Show vbModal
      If frmWMSOUT_LINES_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWMSOUT_LINES.ItemCount = item.WMSOUT_LINES.Count
        gridWMSOUT_LINES.Refresh
        gridWMSOUT_LINES.RefreshGroups
        gridWMSOUT_LINES.RefreshSort
        gridWMSOUT_LINES.MoveToBookmark u.ID & "WMSOUT_LINES"
      Else
        item.WMSOUT_LINES.Delete u.ID
        item.WMSOUT_LINES.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWMSOUT_LINESFnd_Click()
  On Error Resume Next
  fndWMSOUT_LINES.ShowForm
End Sub
Private Sub cmdWMSOUT_LINESRun_Click()
  On Error Resume Next
  gridWMSOUT_LINES_DblClick
End Sub
Private Sub gridWMSOUT_LINES_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.WMSOUT_LINES.LoadRow gridWMSOUT_LINES, RowIndex, Bookmark, Values
End Sub
Private Sub gridWMSOUT_LINES_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
  Dim u As Object
  On Error Resume Next
  Set u = item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
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
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridWMSOUT_LINES_DblClick()
  cmdWMSOUT_LINESEdit_Click
End Sub
Private Sub gridWMSOUT_LINES_KeyPress(KeyAscii As Integer)
  If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWMSOUT_LINES.FindOnPress KeyAscii
End Sub

Private Sub pnlWMSOUT_LINES_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridWMSOUT_LINES.Left = Left
  gridWMSOUT_LINES.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWMSOUT_LINES.Width = Width
  gridWMSOUT_LINES.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWMSOUT_LINESAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_LINESEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_LINESDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_LINESRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_LINESPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_LINESCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_LINESFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_LINESRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_LINESAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_LINESAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWMSOUT_LINESEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWMSOUT_LINESDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWMSOUT_LINESRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWMSOUT_LINESPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWMSOUT_LINESCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWMSOUT_LINESFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWMSOUT_LINESRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWMSOUT_LINESAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuWMSOUT_LINESPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.WMSOUT_LINES.Add()
    If GetFromBuffer(u) Then
      gridWMSOUT_LINES.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdWMSOUT_PALETCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWMSOUT_PALET, "gridWMSOUT_PALET"
Set jset = Nothing
End Sub

Private Sub cmdWMSOUT_PALETPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWMSOUT_PALET, "Палеты к строке"
Set jset = Nothing
End Sub

Private Sub cmdWMSOUT_PALETAcc_Click()
On Error Resume Next
If gridWMSOUT_PALET.ItemCount = 0 Then Exit Sub
If gridWMSOUT_PALET.Row > 0 Then
 If gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSOUT_PALET.RowBookmark(gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWMSOUT_PALETFnd_Click()
  On Error Resume Next
  fndWMSOUT_PALET.ShowForm
End Sub
Private Sub cmdWMSOUT_PALETRun_Click()
  On Error Resume Next
  gridWMSOUT_PALET_DblClick
End Sub
Private Sub pnlWMSOUT_LINES_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridWMSOUT_PALET.Left = Left
  gridWMSOUT_PALET.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWMSOUT_PALET.Width = Width
  gridWMSOUT_PALET.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWMSOUT_PALETAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_PALETEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_PALETDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_PALETRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_PALETPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_PALETCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_PALETFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_PALETRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_PALETAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSOUT_PALETAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWMSOUT_PALETEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWMSOUT_PALETDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWMSOUT_PALETRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWMSOUT_PALETPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWMSOUT_PALETCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWMSOUT_PALETFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWMSOUT_PALETRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWMSOUT_PALETAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdWMSOUT_PALETRef_Click()
  On Error Resume Next
If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
If gridWMSOUT_LINES.Row > 0 Then
 If gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWMSOUT_LINES.RowBookmark(gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WMSOUT_PALET.Refresh
   gridWMSOUT_PALET.ItemCount = gu.WMSOUT_PALET.Count
   gridWMSOUT_PALET.Refetch
   gridWMSOUT_PALET.Refresh
 Else
  gridWMSOUT_PALET.Columns.Clear
  gridWMSOUT_PALET.ItemCount = 0
 End If
Else
 gridWMSOUT_PALET.Columns.Clear
 gridWMSOUT_PALET.ItemCount = 0
End If
End Sub
Private Sub cmdWMSOUT_PALETEdit_Click()
    If gridWMSOUT_PALET.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWMSOUT_PALET.RowBookmark(gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmWMSOUT_PALET_.item = u
again:     frmWMSOUT_PALET_.NotFirstTime = False
    frmWMSOUT_PALET_.OnInit
    frmWMSOUT_PALET_.Show vbModal
    If frmWMSOUT_PALET_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWMSOUT_PALET.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdWMSOUT_PALETDel_Click()
  On Error Resume Next
  gridWMSOUT_PALET.Delete
End Sub
Private Sub cmdWMSOUT_PALETAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridWMSOUT_LINES.RowBookmark(gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.WMSOUT_PALET.Add()

      Set frmWMSOUT_PALET_.item = u
again:       frmWMSOUT_PALET_.NotFirstTime = False
      frmWMSOUT_PALET_.OnInit
      frmWMSOUT_PALET_.Show vbModal
      If frmWMSOUT_PALET_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWMSOUT_PALET.ItemCount = gu.WMSOUT_PALET.Count
        gridWMSOUT_PALET.Refresh
        gridWMSOUT_PALET.RefreshGroups
        gridWMSOUT_PALET.RefreshSort
        gridWMSOUT_PALET.MoveToBookmark u.ID & "WMSOUT_PALET"
      Else
        gu.WMSOUT_PALET.Delete u.ID
        gu.WMSOUT_PALET.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridWMSOUT_LINES_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridWMSOUT_LINES.ItemCount = 0 Then
  gridWMSOUT_PALET.ItemCount = 0
  Exit Sub
End If
If gridWMSOUT_LINES.Row > 0 Then
  If LastRow <> gridWMSOUT_LINES.Row And LastRow > 0 Then
    gridWMSOUT_LINES.GetRowData(LastRow).RowStyle = "Default"
    gridWMSOUT_LINES.GetRowData(gridWMSOUT_LINES.Row).RowStyle = "SelectedRow"
  End If
 If gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row) > 0 Then
  If LastRow <> gridWMSOUT_LINES.Row Or gridWMSOUT_PALET.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWMSOUT_LINES.RowBookmark(gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WMSOUT_PALET.PrepareGrid gridWMSOUT_PALET
  gridWMSOUT_PALET.ItemCount = 0
    LoadGridLayout gridWMSOUT_PALET
    Set fndWMSOUT_PALET = Nothing
    Set fndWMSOUT_PALET = CreateObject("MTZ_JSetup.GridFinder")
    fndWMSOUT_PALET.Init gridWMSOUT_PALET
  gridWMSOUT_PALET.ItemCount = gu.WMSOUT_PALET.Count
  End If
 End If
End If
End Sub
Private Sub gridWMSOUT_PALET_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
    If gridWMSOUT_PALET.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWMSOUT_LINES.RowBookmark(gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WMSOUT_PALET.LoadRow gridWMSOUT_PALET, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridWMSOUT_PALET_KeyPress(KeyAscii As Integer)
  If gridWMSOUT_PALET.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWMSOUT_PALET.FindOnPress KeyAscii
End Sub

Private Sub gridWMSOUT_PALET_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridWMSOUT_PALET.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWMSOUT_PALET.RowBookmark(gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    If Not u Is Nothing Then
      On Error Resume Next
      If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
        u.Parent.Delete u.ID
      Else
        Cancel = True
      End If
    End If

    Set u = Nothing
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub gridWMSOUT_PALET_DblClick()
    cmdWMSOUT_PALETEdit_Click
End Sub
Private Sub gridWMSOUT_PALET_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridWMSOUT_PALET.ItemCount = 0 Then Exit Sub
 If gridWMSOUT_PALET.Row > 0 Then
   If LastRow <> gridWMSOUT_PALET.Row And LastRow > 0 Then
     gridWMSOUT_PALET.GetRowData(LastRow).RowStyle = "Default"
     gridWMSOUT_PALET.GetRowData(gridWMSOUT_PALET.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuWMSOUT_PALETPASTE_Click()
On Error Resume Next
    If gridWMSOUT_LINES.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWMSOUT_LINES.RowBookmark(gridWMSOUT_LINES.RowIndex(gridWMSOUT_LINES.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.WMSOUT_PALET.Add()
    If GetFromBuffer(u) Then
      gridWMSOUT_PALET.ItemCount = u.Parent.Count
    Else
      gu.WMSOUT_PALET.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridWMSOUT_PALET_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWMSOUT_PALETCfg_Click
        End If
    End If
End Sub

Private Sub gridWMSOUT_PALET_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWMSOUT_PALET
End If
End Sub
Private Sub mnuWMSOUT_PALETAdd_click()
   menuActionWMSOUT_PALET = "ADD"
   menuTimerWMSOUT_PALET.Enabled = True
End Sub
Private Sub mnuWMSOUT_PALETEdit_click()
   menuActionWMSOUT_PALET = "EDIT"
   menuTimerWMSOUT_PALET.Enabled = True
End Sub
Private Sub mnuWMSOUT_PALETDelete_click()
   menuActionWMSOUT_PALET = "DEL"
   menuTimerWMSOUT_PALET.Enabled = True
End Sub
Private Sub mnuWMSOUT_PALETOpen_click()
   menuActionWMSOUT_PALET = "RUN"
   menuTimerWMSOUT_PALET.Enabled = True
End Sub
Private Sub mnuWMSOUT_PALETRef_click()
   menuActionWMSOUT_PALET = "REF"
   menuTimerWMSOUT_PALET.Enabled = True
End Sub
  Private Sub mnuWMSOUT_PALETCOPY_Click()
    On Error Resume Next
    If gridWMSOUT_PALET.ItemCount = 0 Then Exit Sub
    If gridWMSOUT_PALET.Row > 0 Then
     If gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSOUT_PALET.RowBookmark(gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWMSOUT_PALETCUT_Click()
    On Error Resume Next
    If gridWMSOUT_PALET.ItemCount = 0 Then Exit Sub
    If gridWMSOUT_PALET.Row > 0 Then
     If gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSOUT_PALET.RowBookmark(gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWMSOUT_PALET.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWMSOUT_PALETCHANGE_Click()
  On Error Resume Next
  If gridWMSOUT_PALET.ItemCount = 0 Then Exit Sub
  If gridWMSOUT_PALET.Row > 0 Then
   If gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSOUT_PALET.RowBookmark(gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWMSOUT_PALET.ItemCount = u.Parent.Count
      gridWMSOUT_PALET.RefreshRowIndex gridWMSOUT_PALET.RowIndex(gridWMSOUT_PALET.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWMSOUT_PALETCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWMSOUT_PALETPrn_click()
   menuActionWMSOUT_PALET = "PRN"
   menuTimerWMSOUT_PALET.Enabled = True
End Sub
Private Sub mnuWMSOUT_PALETCfg_click()
   menuActionWMSOUT_PALET = "CFG"
   menuTimerWMSOUT_PALET.Enabled = True
End Sub
Private Sub mnuWMSOUT_PALETFind_click()
   menuActionWMSOUT_PALET = "FND"
   menuTimerWMSOUT_PALET.Enabled = True
End Sub
Private Sub mnuWMSOUT_PALETAcc_click()
   menuActionWMSOUT_PALET = "ACC"
   menuTimerWMSOUT_PALET.Enabled = True
End Sub
Private Sub menuTimerWMSOUT_PALET_timer()
   menuTimerWMSOUT_PALET.Enabled = False
   If menuActionWMSOUT_PALET = "ADD" Then cmdWMSOUT_PALETAdd_Click
   If menuActionWMSOUT_PALET = "EDIT" Then cmdWMSOUT_PALETEdit_Click
   If menuActionWMSOUT_PALET = "DEL" Then cmdWMSOUT_PALETDel_Click
   If menuActionWMSOUT_PALET = "RUN" Then cmdWMSOUT_PALETRun_Click
   If menuActionWMSOUT_PALET = "REF" Then cmdWMSOUT_PALETRef_Click
   If menuActionWMSOUT_PALET = "PRN" Then cmdWMSOUT_PALETPrn_Click
   If menuActionWMSOUT_PALET = "CFG" Then cmdWMSOUT_PALETCfg_Click
   If menuActionWMSOUT_PALET = "FND" Then cmdWMSOUT_PALETFnd_Click
   If menuActionWMSOUT_PALET = "ACC" Then cmdWMSOUT_PALETAcc_Click
   menuActionWMSOUT_PALET = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWMSOUT_LINESAdd, cmdWMSOUT_LINESAdd.Tag
  LoadBtnPictures cmdWMSOUT_LINESEdit, cmdWMSOUT_LINESEdit.Tag
  LoadBtnPictures cmdWMSOUT_LINESDel, cmdWMSOUT_LINESDel.Tag
  LoadBtnPictures cmdWMSOUT_LINESRef, cmdWMSOUT_LINESRef.Tag
  LoadBtnPictures cmdWMSOUT_LINESPrn, cmdWMSOUT_LINESPrn.Tag
  LoadBtnPictures cmdWMSOUT_LINESFnd, cmdWMSOUT_LINESFnd.Tag
  LoadBtnPictures cmdWMSOUT_LINESRun, cmdWMSOUT_LINESRun.Tag
  LoadBtnPictures cmdWMSOUT_LINESAcc, cmdWMSOUT_LINESAcc.Tag
  LoadBtnPictures cmdWMSOUT_LINESCfg, cmdWMSOUT_LINESCfg.Tag
  item.WMSOUT_LINES.PrepareGrid gridWMSOUT_LINES
  LoadGridLayout gridWMSOUT_LINES
  Set fndWMSOUT_LINES = Nothing
  On Error Resume Next
  Set fndWMSOUT_LINES = CreateObject("MTZ_JSetup.GridFinder")
  fndWMSOUT_LINES.Init gridWMSOUT_LINES
  LoadBtnPictures cmdWMSOUT_PALETAdd, cmdWMSOUT_PALETAdd.Tag
  LoadBtnPictures cmdWMSOUT_PALETEdit, cmdWMSOUT_PALETEdit.Tag
  LoadBtnPictures cmdWMSOUT_PALETDel, cmdWMSOUT_PALETDel.Tag
  LoadBtnPictures cmdWMSOUT_PALETRef, cmdWMSOUT_PALETRef.Tag
  LoadBtnPictures cmdWMSOUT_PALETPrn, cmdWMSOUT_PALETPrn.Tag
  LoadBtnPictures cmdWMSOUT_PALETFnd, cmdWMSOUT_PALETFnd.Tag
  LoadBtnPictures cmdWMSOUT_PALETCfg, cmdWMSOUT_PALETCfg.Tag
  LoadBtnPictures cmdWMSOUT_PALETRun, cmdWMSOUT_PALETRun.Tag
  LoadBtnPictures cmdWMSOUT_PALETAcc, cmdWMSOUT_PALETAcc.Tag
  gridWMSOUT_PALET.Columns.Clear
  gridWMSOUT_PALET.ItemCount = 0
  cmdWMSOUT_PALETRef_Click
End Sub
Private Sub OnTabClick()

pnlWMSOUT_LINES.RestorePosition
  gridWMSOUT_LINES_RowColChange gridWMSOUT_LINES.Row, -1
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
  pnlWMSOUT_LINES.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndWMSOUT_LINES = Nothing
  Set fndWMSOUT_PALET = Nothing
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





