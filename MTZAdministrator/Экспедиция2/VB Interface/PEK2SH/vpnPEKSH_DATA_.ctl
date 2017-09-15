VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKSH_DATA_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKSH_START 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerPEKSH_DATA 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlPEKSH_DATA 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdPEKSH_STARTAcc 
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
      Begin MTZ_PANEL.DropButton cmdPEKSH_STARTRun 
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
      Begin VB.CommandButton cmdPEKSH_STARTFnd 
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
      Begin VB.CommandButton cmdPEKSH_STARTCfg 
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
      Begin VB.CommandButton cmdPEKSH_STARTPrn 
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
      Begin VB.CommandButton cmdPEKSH_STARTRef 
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
      Begin VB.CommandButton cmdPEKSH_STARTDel 
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
      Begin VB.CommandButton cmdPEKSH_STARTEdit 
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
      Begin VB.CommandButton cmdPEKSH_STARTAdd 
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
      Begin GridEX20.GridEX gridPEKSH_START 
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
         Column(1)       =   "vpnPEKSH_DATA_.ctx":0000
         Column(2)       =   "vpnPEKSH_DATA_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKSH_DATA_.ctx":016C
         FormatStyle(2)  =   "vpnPEKSH_DATA_.ctx":02C8
         FormatStyle(3)  =   "vpnPEKSH_DATA_.ctx":0378
         FormatStyle(4)  =   "vpnPEKSH_DATA_.ctx":042C
         FormatStyle(5)  =   "vpnPEKSH_DATA_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKSH_DATA_.ctx":05BC
      End
      Begin VB.CommandButton cmdPEKSH_DATAAcc 
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
      Begin MTZ_PANEL.DropButton cmdPEKSH_DATARun 
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
      Begin VB.CommandButton cmdPEKSH_DATAFnd 
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
      Begin VB.CommandButton cmdPEKSH_DATACfg 
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
      Begin VB.CommandButton cmdPEKSH_DATAPrn 
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
      Begin VB.CommandButton cmdPEKSH_DATARef 
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
      Begin VB.CommandButton cmdPEKSH_DATADel 
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
      Begin VB.CommandButton cmdPEKSH_DATAEdit 
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
      Begin VB.CommandButton cmdPEKSH_DATAAdd 
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
      Begin GridEX20.GridEX gridPEKSH_DATA 
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
         Column(1)       =   "vpnPEKSH_DATA_.ctx":0794
         Column(2)       =   "vpnPEKSH_DATA_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKSH_DATA_.ctx":0900
         FormatStyle(2)  =   "vpnPEKSH_DATA_.ctx":0A5C
         FormatStyle(3)  =   "vpnPEKSH_DATA_.ctx":0B0C
         FormatStyle(4)  =   "vpnPEKSH_DATA_.ctx":0BC0
         FormatStyle(5)  =   "vpnPEKSH_DATA_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnPEKSH_DATA_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupPEKSH_DATA 
      Caption         =   "Меню для Поезд"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKSH_DATAAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKSH_DATAEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKSH_DATADelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKSH_DATAOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKSH_DATARef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKSH_DATAS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKSH_DATABuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKSH_DATACOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKSH_DATACUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKSH_DATAPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKSH_DATACHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKSH_DATACLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKSH_DATAPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKSH_DATACfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKSH_DATAFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKSH_DATAAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupPEKSH_START 
      Caption         =   "Меню для День и время отправления"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKSH_STARTAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKSH_STARTEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKSH_STARTDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKSH_STARTOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKSH_STARTRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKSH_STARTS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKSH_STARTBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKSH_STARTCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKSH_STARTCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKSH_STARTPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKSH_STARTCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKSH_STARTCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKSH_STARTPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKSH_STARTCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKSH_STARTFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKSH_STARTAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKSH_DATA_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKSH_DATA As Object
Private menuActionPEKSH_DATA As String
Private fndPEKSH_START As Object
Private menuActionPEKSH_START As String





Private Sub pnlPEKSH_DATA_PositionChanged()
  pnlPEKSH_DATA.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridPEKSH_DATA_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKSH_DATACfg_Click
        End If
    End If
End Sub

Private Sub gridPEKSH_DATA_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKSH_DATA
End If
End Sub
Private Sub mnuPEKSH_DATAAdd_click()
   menuActionPEKSH_DATA = "ADD"
   menuTimerPEKSH_DATA.Enabled = True
End Sub
Private Sub mnuPEKSH_DATAEdit_click()
   menuActionPEKSH_DATA = "EDIT"
   menuTimerPEKSH_DATA.Enabled = True
End Sub
Private Sub mnuPEKSH_DATADelete_click()
   menuActionPEKSH_DATA = "DEL"
   menuTimerPEKSH_DATA.Enabled = True
End Sub
Private Sub mnuPEKSH_DATAOpen_click()
   menuActionPEKSH_DATA = "RUN"
   menuTimerPEKSH_DATA.Enabled = True
End Sub
Private Sub mnuPEKSH_DATARef_click()
   menuActionPEKSH_DATA = "REF"
   menuTimerPEKSH_DATA.Enabled = True
End Sub
  Private Sub mnuPEKSH_DATACOPY_Click()
    On Error Resume Next
    If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
    If gridPEKSH_DATA.Row > 0 Then
     If gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKSH_DATA.RowBookmark(gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKSH_DATACUT_Click()
    On Error Resume Next
    If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
    If gridPEKSH_DATA.Row > 0 Then
     If gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKSH_DATA.RowBookmark(gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKSH_DATA.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKSH_DATACHANGE_Click()
  On Error Resume Next
  If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
  If gridPEKSH_DATA.Row > 0 Then
   If gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKSH_DATA.RowBookmark(gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKSH_DATA.ItemCount = u.Parent.Count
      gridPEKSH_DATA.RefreshRowIndex gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKSH_DATACLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKSH_DATAPrn_click()
   menuActionPEKSH_DATA = "PRN"
   menuTimerPEKSH_DATA.Enabled = True
End Sub
Private Sub mnuPEKSH_DATACfg_click()
   menuActionPEKSH_DATA = "CFG"
   menuTimerPEKSH_DATA.Enabled = True
End Sub
Private Sub mnuPEKSH_DATAFind_click()
   menuActionPEKSH_DATA = "FND"
   menuTimerPEKSH_DATA.Enabled = True
End Sub
Private Sub mnuPEKSH_DATAAcc_click()
   menuActionPEKSH_DATA = "ACC"
   menuTimerPEKSH_DATA.Enabled = True
End Sub
Private Sub menuTimerPEKSH_DATA_timer()
   menuTimerPEKSH_DATA.Enabled = False
   If menuActionPEKSH_DATA = "ADD" Then cmdPEKSH_DATAAdd_Click
   If menuActionPEKSH_DATA = "EDIT" Then cmdPEKSH_DATAEdit_Click
   If menuActionPEKSH_DATA = "DEL" Then cmdPEKSH_DATADel_Click
   If menuActionPEKSH_DATA = "RUN" Then cmdPEKSH_DATARun_Click
   If menuActionPEKSH_DATA = "REF" Then cmdPEKSH_DATARef_Click
   If menuActionPEKSH_DATA = "PRN" Then cmdPEKSH_DATAPrn_Click
   If menuActionPEKSH_DATA = "CFG" Then cmdPEKSH_DATACfg_Click
   If menuActionPEKSH_DATA = "FND" Then cmdPEKSH_DATAFnd_Click
   If menuActionPEKSH_DATA = "ACC" Then cmdPEKSH_DATAAcc_Click
   menuActionPEKSH_DATA = ""
End Sub
Private Sub cmdPEKSH_DATACfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKSH_DATA, "gridPEKSH_DATA"
Set jset = Nothing
End Sub

Private Sub cmdPEKSH_DATAPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKSH_DATA, "Поезд"
Set jset = Nothing
End Sub

Private Sub cmdPEKSH_DATARef_Click()
  On Error Resume Next
  Item.PEKSH_DATA.Refresh
  gridPEKSH_DATA.ItemCount = Item.PEKSH_DATA.Count
  gridPEKSH_DATA.Refetch
  gridPEKSH_DATA.Refresh
End Sub
Private Sub cmdPEKSH_DATAAcc_Click()
On Error Resume Next
If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
If gridPEKSH_DATA.Row > 0 Then
 If gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKSH_DATA.RowBookmark(gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKSH_DATAEdit_Click()
  On Error Resume Next
If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
If gridPEKSH_DATA.Row > 0 Then
 If gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKSH_DATA.RowBookmark(gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKSH_DATA_.Item = u
again:     frmPEKSH_DATA_.NotFirstTime = False
    frmPEKSH_DATA_.OnInit
    frmPEKSH_DATA_.Show vbModal
    If frmPEKSH_DATA_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKSH_DATA.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKSH_DATADel_Click()
  On Error Resume Next
  gridPEKSH_DATA.Delete
End Sub
Private Sub cmdPEKSH_DATAAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.PEKSH_DATA.Add()

      Set frmPEKSH_DATA_.Item = u
again:       frmPEKSH_DATA_.NotFirstTime = False
      frmPEKSH_DATA_.OnInit
      frmPEKSH_DATA_.Show vbModal
      If frmPEKSH_DATA_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKSH_DATA.ItemCount = Item.PEKSH_DATA.Count
        gridPEKSH_DATA.Refresh
        gridPEKSH_DATA.RefreshGroups
        gridPEKSH_DATA.RefreshSort
        gridPEKSH_DATA.MoveToBookmark u.ID & "PEKSH_DATA"
      Else
        Item.PEKSH_DATA.Delete u.ID
        Item.PEKSH_DATA.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKSH_DATAFnd_Click()
  On Error Resume Next
  fndPEKSH_DATA.ShowForm
End Sub
Private Sub cmdPEKSH_DATARun_Click()
  On Error Resume Next
  gridPEKSH_DATA_DblClick
End Sub
Private Sub gridPEKSH_DATA_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKSH_DATA.LoadRow gridPEKSH_DATA, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKSH_DATA_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
  Dim u As Object
  On Error Resume Next
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
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
Private Sub gridPEKSH_DATA_DblClick()
  cmdPEKSH_DATAEdit_Click
End Sub
Private Sub gridPEKSH_DATA_KeyPress(KeyAscii As Integer)
  If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKSH_DATA.FindOnPress KeyAscii
End Sub

Private Sub pnlPEKSH_DATA_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridPEKSH_DATA.Left = Left
  gridPEKSH_DATA.Top = Top + 25 * Screen.TwipsPerPixelY
  gridPEKSH_DATA.Width = Width
  gridPEKSH_DATA.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKSH_DATAAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_DATAEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_DATADel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_DATARef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_DATAPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_DATACfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_DATAFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_DATARun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_DATAAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_DATAAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKSH_DATAEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKSH_DATADel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKSH_DATARef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKSH_DATAPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKSH_DATACfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdPEKSH_DATAFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdPEKSH_DATARun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdPEKSH_DATAAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuPEKSH_DATAPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKSH_DATA.Add()
    If GetFromBuffer(u) Then
      gridPEKSH_DATA.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdPEKSH_STARTCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKSH_START, "gridPEKSH_START"
Set jset = Nothing
End Sub

Private Sub cmdPEKSH_STARTPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKSH_START, "День и время отправления"
Set jset = Nothing
End Sub

Private Sub cmdPEKSH_STARTAcc_Click()
On Error Resume Next
If gridPEKSH_START.ItemCount = 0 Then Exit Sub
If gridPEKSH_START.Row > 0 Then
 If gridPEKSH_START.RowIndex(gridPEKSH_START.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKSH_START.RowBookmark(gridPEKSH_START.RowIndex(gridPEKSH_START.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKSH_STARTFnd_Click()
  On Error Resume Next
  fndPEKSH_START.ShowForm
End Sub
Private Sub cmdPEKSH_STARTRun_Click()
  On Error Resume Next
  gridPEKSH_START_DblClick
End Sub
Private Sub pnlPEKSH_DATA_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridPEKSH_START.Left = Left
  gridPEKSH_START.Top = Top + 25 * Screen.TwipsPerPixelY
  gridPEKSH_START.Width = Width
  gridPEKSH_START.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKSH_STARTAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_STARTEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_STARTDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_STARTRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_STARTPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_STARTCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_STARTFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_STARTRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_STARTAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKSH_STARTAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKSH_STARTEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKSH_STARTDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKSH_STARTRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKSH_STARTPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKSH_STARTCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdPEKSH_STARTFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdPEKSH_STARTRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdPEKSH_STARTAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdPEKSH_STARTRef_Click()
  On Error Resume Next
If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
If gridPEKSH_DATA.Row > 0 Then
 If gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridPEKSH_DATA.RowBookmark(gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKSH_START.Refresh
   gridPEKSH_START.ItemCount = gu.PEKSH_START.Count
   gridPEKSH_START.Refetch
   gridPEKSH_START.Refresh
 Else
  gridPEKSH_START.Columns.Clear
  gridPEKSH_START.ItemCount = 0
 End If
Else
 gridPEKSH_START.Columns.Clear
 gridPEKSH_START.ItemCount = 0
End If
End Sub
Private Sub cmdPEKSH_STARTEdit_Click()
    If gridPEKSH_START.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridPEKSH_START.RowBookmark(gridPEKSH_START.RowIndex(gridPEKSH_START.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmPEKSH_START_.Item = u
again:     frmPEKSH_START_.NotFirstTime = False
    frmPEKSH_START_.OnInit
    frmPEKSH_START_.Show vbModal
    If frmPEKSH_START_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKSH_START.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdPEKSH_STARTDel_Click()
  On Error Resume Next
  gridPEKSH_START.Delete
End Sub
Private Sub cmdPEKSH_STARTAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridPEKSH_DATA.RowBookmark(gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.PEKSH_START.Add()

      Set frmPEKSH_START_.Item = u
again:       frmPEKSH_START_.NotFirstTime = False
      frmPEKSH_START_.OnInit
      frmPEKSH_START_.Show vbModal
      If frmPEKSH_START_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKSH_START.ItemCount = gu.PEKSH_START.Count
        gridPEKSH_START.Refresh
        gridPEKSH_START.RefreshGroups
        gridPEKSH_START.RefreshSort
        gridPEKSH_START.MoveToBookmark u.ID & "PEKSH_START"
      Else
        gu.PEKSH_START.Delete u.ID
        gu.PEKSH_START.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridPEKSH_DATA_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridPEKSH_DATA.ItemCount = 0 Then
  gridPEKSH_START.ItemCount = 0
  Exit Sub
End If
If gridPEKSH_DATA.Row > 0 Then
  If LastRow <> gridPEKSH_DATA.Row And LastRow > 0 Then
    gridPEKSH_DATA.GetRowData(LastRow).RowStyle = "Default"
    gridPEKSH_DATA.GetRowData(gridPEKSH_DATA.Row).RowStyle = "SelectedRow"
  End If
 If gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row) > 0 Then
  If LastRow <> gridPEKSH_DATA.Row Or gridPEKSH_START.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridPEKSH_DATA.RowBookmark(gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKSH_START.PrepareGrid gridPEKSH_START
  gridPEKSH_START.ItemCount = 0
    LoadGridLayout gridPEKSH_START
    Set fndPEKSH_START = Nothing
    Set fndPEKSH_START = CreateObject("MTZ_JSetup.GridFinder")
    fndPEKSH_START.Init gridPEKSH_START
  gridPEKSH_START.ItemCount = gu.PEKSH_START.Count
  End If
 End If
End If
End Sub
Private Sub gridPEKSH_START_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
    If gridPEKSH_START.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridPEKSH_DATA.RowBookmark(gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.PEKSH_START.LoadRow gridPEKSH_START, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridPEKSH_START_KeyPress(KeyAscii As Integer)
  If gridPEKSH_START.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKSH_START.FindOnPress KeyAscii
End Sub

Private Sub gridPEKSH_START_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridPEKSH_START.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridPEKSH_START.RowBookmark(gridPEKSH_START.RowIndex(gridPEKSH_START.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
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
Private Sub gridPEKSH_START_DblClick()
    cmdPEKSH_STARTEdit_Click
End Sub
Private Sub gridPEKSH_START_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridPEKSH_START.ItemCount = 0 Then Exit Sub
 If gridPEKSH_START.Row > 0 Then
   If LastRow <> gridPEKSH_START.Row And LastRow > 0 Then
     gridPEKSH_START.GetRowData(LastRow).RowStyle = "Default"
     gridPEKSH_START.GetRowData(gridPEKSH_START.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuPEKSH_STARTPASTE_Click()
On Error Resume Next
    If gridPEKSH_DATA.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridPEKSH_DATA.RowBookmark(gridPEKSH_DATA.RowIndex(gridPEKSH_DATA.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.PEKSH_START.Add()
    If GetFromBuffer(u) Then
      gridPEKSH_START.ItemCount = u.Parent.Count
    Else
      gu.PEKSH_START.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridPEKSH_START_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKSH_STARTCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKSH_START_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKSH_START
End If
End Sub
Private Sub mnuPEKSH_STARTAdd_click()
   menuActionPEKSH_START = "ADD"
   menuTimerPEKSH_START.Enabled = True
End Sub
Private Sub mnuPEKSH_STARTEdit_click()
   menuActionPEKSH_START = "EDIT"
   menuTimerPEKSH_START.Enabled = True
End Sub
Private Sub mnuPEKSH_STARTDelete_click()
   menuActionPEKSH_START = "DEL"
   menuTimerPEKSH_START.Enabled = True
End Sub
Private Sub mnuPEKSH_STARTOpen_click()
   menuActionPEKSH_START = "RUN"
   menuTimerPEKSH_START.Enabled = True
End Sub
Private Sub mnuPEKSH_STARTRef_click()
   menuActionPEKSH_START = "REF"
   menuTimerPEKSH_START.Enabled = True
End Sub
  Private Sub mnuPEKSH_STARTCOPY_Click()
    On Error Resume Next
    If gridPEKSH_START.ItemCount = 0 Then Exit Sub
    If gridPEKSH_START.Row > 0 Then
     If gridPEKSH_START.RowIndex(gridPEKSH_START.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKSH_START.RowBookmark(gridPEKSH_START.RowIndex(gridPEKSH_START.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKSH_STARTCUT_Click()
    On Error Resume Next
    If gridPEKSH_START.ItemCount = 0 Then Exit Sub
    If gridPEKSH_START.Row > 0 Then
     If gridPEKSH_START.RowIndex(gridPEKSH_START.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKSH_START.RowBookmark(gridPEKSH_START.RowIndex(gridPEKSH_START.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKSH_START.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKSH_STARTCHANGE_Click()
  On Error Resume Next
  If gridPEKSH_START.ItemCount = 0 Then Exit Sub
  If gridPEKSH_START.Row > 0 Then
   If gridPEKSH_START.RowIndex(gridPEKSH_START.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKSH_START.RowBookmark(gridPEKSH_START.RowIndex(gridPEKSH_START.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKSH_START.ItemCount = u.Parent.Count
      gridPEKSH_START.RefreshRowIndex gridPEKSH_START.RowIndex(gridPEKSH_START.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKSH_STARTCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKSH_STARTPrn_click()
   menuActionPEKSH_START = "PRN"
   menuTimerPEKSH_START.Enabled = True
End Sub
Private Sub mnuPEKSH_STARTCfg_click()
   menuActionPEKSH_START = "CFG"
   menuTimerPEKSH_START.Enabled = True
End Sub
Private Sub mnuPEKSH_STARTFind_click()
   menuActionPEKSH_START = "FND"
   menuTimerPEKSH_START.Enabled = True
End Sub
Private Sub mnuPEKSH_STARTAcc_click()
   menuActionPEKSH_START = "ACC"
   menuTimerPEKSH_START.Enabled = True
End Sub
Private Sub menuTimerPEKSH_START_timer()
   menuTimerPEKSH_START.Enabled = False
   If menuActionPEKSH_START = "ADD" Then cmdPEKSH_STARTAdd_Click
   If menuActionPEKSH_START = "EDIT" Then cmdPEKSH_STARTEdit_Click
   If menuActionPEKSH_START = "DEL" Then cmdPEKSH_STARTDel_Click
   If menuActionPEKSH_START = "RUN" Then cmdPEKSH_STARTRun_Click
   If menuActionPEKSH_START = "REF" Then cmdPEKSH_STARTRef_Click
   If menuActionPEKSH_START = "PRN" Then cmdPEKSH_STARTPrn_Click
   If menuActionPEKSH_START = "CFG" Then cmdPEKSH_STARTCfg_Click
   If menuActionPEKSH_START = "FND" Then cmdPEKSH_STARTFnd_Click
   If menuActionPEKSH_START = "ACC" Then cmdPEKSH_STARTAcc_Click
   menuActionPEKSH_START = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKSH_DATAAdd, cmdPEKSH_DATAAdd.Tag
  LoadBtnPictures cmdPEKSH_DATAEdit, cmdPEKSH_DATAEdit.Tag
  LoadBtnPictures cmdPEKSH_DATADel, cmdPEKSH_DATADel.Tag
  LoadBtnPictures cmdPEKSH_DATARef, cmdPEKSH_DATARef.Tag
  LoadBtnPictures cmdPEKSH_DATAPrn, cmdPEKSH_DATAPrn.Tag
  LoadBtnPictures cmdPEKSH_DATAFnd, cmdPEKSH_DATAFnd.Tag
  LoadBtnPictures cmdPEKSH_DATARun, cmdPEKSH_DATARun.Tag
  LoadBtnPictures cmdPEKSH_DATAAcc, cmdPEKSH_DATAAcc.Tag
  LoadBtnPictures cmdPEKSH_DATACfg, cmdPEKSH_DATACfg.Tag
  Item.PEKSH_DATA.PrepareGrid gridPEKSH_DATA
  LoadGridLayout gridPEKSH_DATA
  Set fndPEKSH_DATA = Nothing
  On Error Resume Next
  Set fndPEKSH_DATA = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKSH_DATA.Init gridPEKSH_DATA
  LoadBtnPictures cmdPEKSH_STARTAdd, cmdPEKSH_STARTAdd.Tag
  LoadBtnPictures cmdPEKSH_STARTEdit, cmdPEKSH_STARTEdit.Tag
  LoadBtnPictures cmdPEKSH_STARTDel, cmdPEKSH_STARTDel.Tag
  LoadBtnPictures cmdPEKSH_STARTRef, cmdPEKSH_STARTRef.Tag
  LoadBtnPictures cmdPEKSH_STARTPrn, cmdPEKSH_STARTPrn.Tag
  LoadBtnPictures cmdPEKSH_STARTFnd, cmdPEKSH_STARTFnd.Tag
  LoadBtnPictures cmdPEKSH_STARTCfg, cmdPEKSH_STARTCfg.Tag
  LoadBtnPictures cmdPEKSH_STARTRun, cmdPEKSH_STARTRun.Tag
  LoadBtnPictures cmdPEKSH_STARTAcc, cmdPEKSH_STARTAcc.Tag
  gridPEKSH_START.Columns.Clear
  gridPEKSH_START.ItemCount = 0
  cmdPEKSH_STARTRef_Click
End Sub
Private Sub OnTabClick()

pnlPEKSH_DATA.RestorePosition
  gridPEKSH_DATA_RowColChange gridPEKSH_DATA.Row, -1
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
  pnlPEKSH_DATA.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKSH_DATA = Nothing
  Set fndPEKSH_START = Nothing
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





