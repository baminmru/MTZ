VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnITTIN_QLINE_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerITTIN_PALET 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerITTIN_QLINE 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlITTIN_QLINE 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdITTIN_PALETAcc 
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
      Begin MTZ_PANEL.DropButton cmdITTIN_PALETRun 
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
      Begin VB.CommandButton cmdITTIN_PALETFnd 
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
      Begin VB.CommandButton cmdITTIN_PALETCfg 
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
      Begin VB.CommandButton cmdITTIN_PALETPrn 
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
      Begin VB.CommandButton cmdITTIN_PALETRef 
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
      Begin VB.CommandButton cmdITTIN_PALETDel 
         Enabled         =   0   'False
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
      Begin VB.CommandButton cmdITTIN_PALETEdit 
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
      Begin VB.CommandButton cmdITTIN_PALETAdd 
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
      Begin GridEX20.GridEX gridITTIN_PALET 
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
         Column(1)       =   "vpnITTIN_QLINE_main.ctx":0000
         Column(2)       =   "vpnITTIN_QLINE_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnITTIN_QLINE_main.ctx":016C
         FormatStyle(2)  =   "vpnITTIN_QLINE_main.ctx":02C8
         FormatStyle(3)  =   "vpnITTIN_QLINE_main.ctx":0378
         FormatStyle(4)  =   "vpnITTIN_QLINE_main.ctx":042C
         FormatStyle(5)  =   "vpnITTIN_QLINE_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnITTIN_QLINE_main.ctx":05BC
      End
      Begin VB.CommandButton cmdITTIN_QLINEAcc 
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
      Begin MTZ_PANEL.DropButton cmdITTIN_QLINERun 
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
      Begin VB.CommandButton cmdITTIN_QLINEFnd 
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
      Begin VB.CommandButton cmdITTIN_QLINECfg 
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
      Begin VB.CommandButton cmdITTIN_QLINEPrn 
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
      Begin VB.CommandButton cmdITTIN_QLINERef 
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
      Begin VB.CommandButton cmdITTIN_QLINEDel 
         Enabled         =   0   'False
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
      Begin VB.CommandButton cmdITTIN_QLINEEdit 
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
      Begin VB.CommandButton cmdITTIN_QLINEAdd 
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
      Begin GridEX20.GridEX gridITTIN_QLINE 
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
         Column(1)       =   "vpnITTIN_QLINE_main.ctx":0794
         Column(2)       =   "vpnITTIN_QLINE_main.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnITTIN_QLINE_main.ctx":0900
         FormatStyle(2)  =   "vpnITTIN_QLINE_main.ctx":0A5C
         FormatStyle(3)  =   "vpnITTIN_QLINE_main.ctx":0B0C
         FormatStyle(4)  =   "vpnITTIN_QLINE_main.ctx":0BC0
         FormatStyle(5)  =   "vpnITTIN_QLINE_main.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnITTIN_QLINE_main.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupITTIN_QLINE 
      Caption         =   "Меню для Строки заказа"
      Visible         =   0   'False
      Begin VB.Menu mnuITTIN_QLINEAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuITTIN_QLINEEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuITTIN_QLINEDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuITTIN_QLINEOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuITTIN_QLINERef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuITTIN_QLINES1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuITTIN_QLINEBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuITTIN_QLINECOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuITTIN_QLINECUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuITTIN_QLINEPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuITTIN_QLINECHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuITTIN_QLINECLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuITTIN_QLINEPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuITTIN_QLINECfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuITTIN_QLINEFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuITTIN_QLINEAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupITTIN_PALET 
      Caption         =   "Меню для Палеты к строке"
      Visible         =   0   'False
      Begin VB.Menu mnuITTIN_PALETAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuITTIN_PALETEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuITTIN_PALETDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuITTIN_PALETOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuITTIN_PALETRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuITTIN_PALETS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuITTIN_PALETBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuITTIN_PALETCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuITTIN_PALETCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuITTIN_PALETPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuITTIN_PALETCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuITTIN_PALETCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuITTIN_PALETPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuITTIN_PALETCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuITTIN_PALETFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuITTIN_PALETAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnITTIN_QLINE_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndITTIN_QLINE As Object
Private menuActionITTIN_QLINE As String
Private fndITTIN_PALET As Object
Private menuActionITTIN_PALET As String





Private Sub pnlITTIN_QLINE_PositionChanged()
  pnlITTIN_QLINE.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridITTIN_QLINE_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdITTIN_QLINECfg_Click
        End If
    End If
End Sub

Private Sub gridITTIN_QLINE_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupITTIN_QLINE
End If
End Sub
Private Sub mnuITTIN_QLINEAdd_click()
   menuActionITTIN_QLINE = "ADD"
   menuTimerITTIN_QLINE.Enabled = True
End Sub
Private Sub mnuITTIN_QLINEEdit_click()
   menuActionITTIN_QLINE = "EDIT"
   menuTimerITTIN_QLINE.Enabled = True
End Sub
Private Sub mnuITTIN_QLINEDelete_click()
   menuActionITTIN_QLINE = "DEL"
   menuTimerITTIN_QLINE.Enabled = True
End Sub
Private Sub mnuITTIN_QLINEOpen_click()
   menuActionITTIN_QLINE = "RUN"
   menuTimerITTIN_QLINE.Enabled = True
End Sub
Private Sub mnuITTIN_QLINERef_click()
   menuActionITTIN_QLINE = "REF"
   menuTimerITTIN_QLINE.Enabled = True
End Sub
  Private Sub mnuITTIN_QLINECOPY_Click()
    On Error Resume Next
    If gridITTIN_QLINE.ItemCount = 0 Then Exit Sub
    If gridITTIN_QLINE.Row > 0 Then
     If gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTIN_QLINE.RowBookmark(gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuITTIN_QLINECUT_Click()
    On Error Resume Next
    If gridITTIN_QLINE.ItemCount = 0 Then Exit Sub
    If gridITTIN_QLINE.Row > 0 Then
     If gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTIN_QLINE.RowBookmark(gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridITTIN_QLINE.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuITTIN_QLINECHANGE_Click()
  On Error Resume Next
  If gridITTIN_QLINE.ItemCount = 0 Then Exit Sub
  If gridITTIN_QLINE.Row > 0 Then
   If gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTIN_QLINE.RowBookmark(gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridITTIN_QLINE.ItemCount = u.Parent.Count
      gridITTIN_QLINE.RefreshRowIndex gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuITTIN_QLINECLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuITTIN_QLINEPrn_click()
   menuActionITTIN_QLINE = "PRN"
   menuTimerITTIN_QLINE.Enabled = True
End Sub
Private Sub mnuITTIN_QLINECfg_click()
   menuActionITTIN_QLINE = "CFG"
   menuTimerITTIN_QLINE.Enabled = True
End Sub
Private Sub mnuITTIN_QLINEFind_click()
   menuActionITTIN_QLINE = "FND"
   menuTimerITTIN_QLINE.Enabled = True
End Sub
Private Sub mnuITTIN_QLINEAcc_click()
   menuActionITTIN_QLINE = "ACC"
   menuTimerITTIN_QLINE.Enabled = True
End Sub
Private Sub menuTimerITTIN_QLINE_timer()
   menuTimerITTIN_QLINE.Enabled = False
   If menuActionITTIN_QLINE = "ADD" Then cmdITTIN_QLINEAdd_Click
   If menuActionITTIN_QLINE = "EDIT" Then cmdITTIN_QLINEEdit_Click
   If menuActionITTIN_QLINE = "DEL" Then cmdITTIN_QLINEDel_Click
   If menuActionITTIN_QLINE = "RUN" Then cmdITTIN_QLINERun_Click
   If menuActionITTIN_QLINE = "REF" Then cmdITTIN_QLINERef_Click
   If menuActionITTIN_QLINE = "PRN" Then cmdITTIN_QLINEPrn_Click
   If menuActionITTIN_QLINE = "CFG" Then cmdITTIN_QLINECfg_Click
   If menuActionITTIN_QLINE = "FND" Then cmdITTIN_QLINEFnd_Click
   If menuActionITTIN_QLINE = "ACC" Then cmdITTIN_QLINEAcc_Click
   menuActionITTIN_QLINE = ""
End Sub
Private Sub cmdITTIN_QLINECfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridITTIN_QLINE, "gridITTIN_QLINE"
Set jset = Nothing
End Sub

Private Sub cmdITTIN_QLINEPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridITTIN_QLINE, "Строки заказа"
Set jset = Nothing
End Sub

Private Sub cmdITTIN_QLINERef_Click()
  On Error Resume Next
  Item.ITTIN_QLINE.Refresh
  gridITTIN_QLINE.ItemCount = Item.ITTIN_QLINE.Count
  gridITTIN_QLINE.Refetch
  gridITTIN_QLINE.Refresh
End Sub
Private Sub cmdITTIN_QLINEAcc_Click()
On Error Resume Next
If gridITTIN_QLINE.ItemCount = 0 Then Exit Sub
If gridITTIN_QLINE.Row > 0 Then
 If gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTIN_QLINE.RowBookmark(gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdITTIN_QLINEEdit_Click()
  On Error Resume Next
If gridITTIN_QLINE.ItemCount = 0 Then Exit Sub
If gridITTIN_QLINE.Row > 0 Then
 If gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTIN_QLINE.RowBookmark(gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmITTIN_QLINE_main.Item = u
again:     frmITTIN_QLINE_main.NotFirstTime = False
    frmITTIN_QLINE_main.OnInit
    frmITTIN_QLINE_main.Show vbModal
    If frmITTIN_QLINE_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridITTIN_QLINE.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdITTIN_QLINEDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdITTIN_QLINEAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.ITTIN_QLINE.Add()
u.exp_date = DateSerial(1911, 11, 11)
   Call GetNumValue(u, "sequence", "{E7F3EE01-4EC4-41D2-8657-BA22089DE0E5}", Now, "IN%P", "")

      Set frmITTIN_QLINE_main.Item = u
again:       frmITTIN_QLINE_main.NotFirstTime = False
      frmITTIN_QLINE_main.OnInit
      frmITTIN_QLINE_main.Show vbModal
      If frmITTIN_QLINE_main.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridITTIN_QLINE.ItemCount = Item.ITTIN_QLINE.Count
        gridITTIN_QLINE.Refresh
        gridITTIN_QLINE.RefreshGroups
        gridITTIN_QLINE.RefreshSort
        gridITTIN_QLINE.MoveToBookmark u.ID & "ITTIN_QLINE"
      Else
        Item.ITTIN_QLINE.Delete u.ID
        Item.ITTIN_QLINE.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdITTIN_QLINEFnd_Click()
  On Error Resume Next
  fndITTIN_QLINE.ShowForm
End Sub
Private Sub cmdITTIN_QLINERun_Click()
  On Error Resume Next
  gridITTIN_QLINE_DblClick
End Sub
Private Sub gridITTIN_QLINE_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.ITTIN_QLINE.LoadRow gridITTIN_QLINE, RowIndex, Bookmark, Values
End Sub
Private Sub gridITTIN_QLINE_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridITTIN_QLINE_DblClick()
  cmdITTIN_QLINEEdit_Click
End Sub
Private Sub gridITTIN_QLINE_KeyPress(KeyAscii As Integer)
  If gridITTIN_QLINE.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndITTIN_QLINE.FindOnPress KeyAscii
End Sub

Private Sub pnlITTIN_QLINE_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridITTIN_QLINE.Left = Left
  gridITTIN_QLINE.Top = Top + 25 * Screen.TwipsPerPixelY
  gridITTIN_QLINE.Width = Width
  gridITTIN_QLINE.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdITTIN_QLINEAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_QLINEEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_QLINEDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_QLINERef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_QLINEPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_QLINECfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_QLINEFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_QLINERun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_QLINEAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_QLINEAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdITTIN_QLINEEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdITTIN_QLINEDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdITTIN_QLINERef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdITTIN_QLINEPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdITTIN_QLINECfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdITTIN_QLINEFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdITTIN_QLINERun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdITTIN_QLINEAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuITTIN_QLINEPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.ITTIN_QLINE.Add()
    If GetFromBuffer(u) Then
      gridITTIN_QLINE.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdITTIN_PALETCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridITTIN_PALET, "gridITTIN_PALET"
Set jset = Nothing
End Sub

Private Sub cmdITTIN_PALETPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridITTIN_PALET, "Палеты к строке"
Set jset = Nothing
End Sub

Private Sub cmdITTIN_PALETAcc_Click()
On Error Resume Next
If gridITTIN_PALET.ItemCount = 0 Then Exit Sub
If gridITTIN_PALET.Row > 0 Then
 If gridITTIN_PALET.RowIndex(gridITTIN_PALET.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTIN_PALET.RowBookmark(gridITTIN_PALET.RowIndex(gridITTIN_PALET.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdITTIN_PALETFnd_Click()
  On Error Resume Next
  fndITTIN_PALET.ShowForm
End Sub
Private Sub cmdITTIN_PALETRun_Click()
  On Error Resume Next
  gridITTIN_PALET_DblClick
End Sub
Private Sub pnlITTIN_QLINE_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridITTIN_PALET.Left = Left
  gridITTIN_PALET.Top = Top + 25 * Screen.TwipsPerPixelY
  gridITTIN_PALET.Width = Width
  gridITTIN_PALET.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdITTIN_PALETAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_PALETEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_PALETDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_PALETRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_PALETPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_PALETCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_PALETFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_PALETRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_PALETAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdITTIN_PALETAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdITTIN_PALETEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdITTIN_PALETDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdITTIN_PALETRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdITTIN_PALETPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdITTIN_PALETCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdITTIN_PALETFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdITTIN_PALETRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdITTIN_PALETAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdITTIN_PALETRef_Click()
  On Error Resume Next
If gridITTIN_QLINE.ItemCount = 0 Then Exit Sub
If gridITTIN_QLINE.Row > 0 Then
 If gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridITTIN_QLINE.RowBookmark(gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ITTIN_PALET.Refresh
   gridITTIN_PALET.ItemCount = gu.ITTIN_PALET.Count
   gridITTIN_PALET.Refetch
   gridITTIN_PALET.Refresh
 Else
  gridITTIN_PALET.Columns.Clear
  gridITTIN_PALET.ItemCount = 0
 End If
Else
 gridITTIN_PALET.Columns.Clear
 gridITTIN_PALET.ItemCount = 0
End If
End Sub
Private Sub cmdITTIN_PALETEdit_Click()
    If gridITTIN_PALET.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridITTIN_PALET.RowBookmark(gridITTIN_PALET.RowIndex(gridITTIN_PALET.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmITTIN_PALET_main.Item = u
again:     frmITTIN_PALET_main.NotFirstTime = False
    frmITTIN_PALET_main.OnInit
    frmITTIN_PALET_main.Show vbModal
    If frmITTIN_PALET_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridITTIN_PALET.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdITTIN_PALETDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdITTIN_PALETAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridITTIN_QLINE.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridITTIN_QLINE.RowBookmark(gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.ITTIN_PALET.Add()
   Call GetNumValue(u, "sequence", "{E7F3EE01-4EC4-41D2-8657-BA22089DE0E5}", Now, "INPAL%P", "")

      Set frmITTIN_PALET_main.Item = u
again:       frmITTIN_PALET_main.NotFirstTime = False
      frmITTIN_PALET_main.OnInit
      frmITTIN_PALET_main.Show vbModal
      If frmITTIN_PALET_main.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridITTIN_PALET.ItemCount = gu.ITTIN_PALET.Count
        gridITTIN_PALET.Refresh
        gridITTIN_PALET.RefreshGroups
        gridITTIN_PALET.RefreshSort
        gridITTIN_PALET.MoveToBookmark u.ID & "ITTIN_PALET"
      Else
        gu.ITTIN_PALET.Delete u.ID
        gu.ITTIN_PALET.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridITTIN_QLINE_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridITTIN_QLINE.ItemCount = 0 Then
  gridITTIN_PALET.ItemCount = 0
  Exit Sub
End If
If gridITTIN_QLINE.Row > 0 Then
  If LastRow <> gridITTIN_QLINE.Row And LastRow > 0 Then
    gridITTIN_QLINE.GetRowData(LastRow).RowStyle = "Default"
    gridITTIN_QLINE.GetRowData(gridITTIN_QLINE.Row).RowStyle = "SelectedRow"
  End If
 If gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row) > 0 Then
  If LastRow <> gridITTIN_QLINE.Row Or gridITTIN_PALET.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridITTIN_QLINE.RowBookmark(gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ITTIN_PALET.PrepareGrid gridITTIN_PALET
  gridITTIN_PALET.ItemCount = 0
    LoadGridLayout gridITTIN_PALET
    Set fndITTIN_PALET = Nothing
    Set fndITTIN_PALET = CreateObject("MTZ_JSetup.GridFinder")
    fndITTIN_PALET.Init gridITTIN_PALET
  gridITTIN_PALET.ItemCount = gu.ITTIN_PALET.Count
  End If
 End If
End If
End Sub
Private Sub gridITTIN_PALET_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridITTIN_QLINE.ItemCount = 0 Then Exit Sub
    If gridITTIN_PALET.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridITTIN_QLINE.RowBookmark(gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ITTIN_PALET.LoadRow gridITTIN_PALET, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridITTIN_PALET_KeyPress(KeyAscii As Integer)
  If gridITTIN_PALET.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndITTIN_PALET.FindOnPress KeyAscii
End Sub

Private Sub gridITTIN_PALET_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub
Private Sub gridITTIN_PALET_DblClick()
    cmdITTIN_PALETEdit_Click
End Sub
Private Sub gridITTIN_PALET_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridITTIN_PALET.ItemCount = 0 Then Exit Sub
 If gridITTIN_PALET.Row > 0 Then
   If LastRow <> gridITTIN_PALET.Row And LastRow > 0 Then
     gridITTIN_PALET.GetRowData(LastRow).RowStyle = "Default"
     gridITTIN_PALET.GetRowData(gridITTIN_PALET.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuITTIN_PALETPASTE_Click()
On Error Resume Next
    If gridITTIN_QLINE.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridITTIN_QLINE.RowBookmark(gridITTIN_QLINE.RowIndex(gridITTIN_QLINE.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.ITTIN_PALET.Add()
    If GetFromBuffer(u) Then
      gridITTIN_PALET.ItemCount = u.Parent.Count
    Else
      gu.ITTIN_PALET.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridITTIN_PALET_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdITTIN_PALETCfg_Click
        End If
    End If
End Sub

Private Sub gridITTIN_PALET_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupITTIN_PALET
End If
End Sub
Private Sub mnuITTIN_PALETAdd_click()
   menuActionITTIN_PALET = "ADD"
   menuTimerITTIN_PALET.Enabled = True
End Sub
Private Sub mnuITTIN_PALETEdit_click()
   menuActionITTIN_PALET = "EDIT"
   menuTimerITTIN_PALET.Enabled = True
End Sub
Private Sub mnuITTIN_PALETDelete_click()
   menuActionITTIN_PALET = "DEL"
   menuTimerITTIN_PALET.Enabled = True
End Sub
Private Sub mnuITTIN_PALETOpen_click()
   menuActionITTIN_PALET = "RUN"
   menuTimerITTIN_PALET.Enabled = True
End Sub
Private Sub mnuITTIN_PALETRef_click()
   menuActionITTIN_PALET = "REF"
   menuTimerITTIN_PALET.Enabled = True
End Sub
  Private Sub mnuITTIN_PALETCOPY_Click()
    On Error Resume Next
    If gridITTIN_PALET.ItemCount = 0 Then Exit Sub
    If gridITTIN_PALET.Row > 0 Then
     If gridITTIN_PALET.RowIndex(gridITTIN_PALET.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTIN_PALET.RowBookmark(gridITTIN_PALET.RowIndex(gridITTIN_PALET.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuITTIN_PALETCUT_Click()
    On Error Resume Next
    If gridITTIN_PALET.ItemCount = 0 Then Exit Sub
    If gridITTIN_PALET.Row > 0 Then
     If gridITTIN_PALET.RowIndex(gridITTIN_PALET.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridITTIN_PALET.RowBookmark(gridITTIN_PALET.RowIndex(gridITTIN_PALET.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridITTIN_PALET.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuITTIN_PALETCHANGE_Click()
  On Error Resume Next
  If gridITTIN_PALET.ItemCount = 0 Then Exit Sub
  If gridITTIN_PALET.Row > 0 Then
   If gridITTIN_PALET.RowIndex(gridITTIN_PALET.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridITTIN_PALET.RowBookmark(gridITTIN_PALET.RowIndex(gridITTIN_PALET.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridITTIN_PALET.ItemCount = u.Parent.Count
      gridITTIN_PALET.RefreshRowIndex gridITTIN_PALET.RowIndex(gridITTIN_PALET.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuITTIN_PALETCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuITTIN_PALETPrn_click()
   menuActionITTIN_PALET = "PRN"
   menuTimerITTIN_PALET.Enabled = True
End Sub
Private Sub mnuITTIN_PALETCfg_click()
   menuActionITTIN_PALET = "CFG"
   menuTimerITTIN_PALET.Enabled = True
End Sub
Private Sub mnuITTIN_PALETFind_click()
   menuActionITTIN_PALET = "FND"
   menuTimerITTIN_PALET.Enabled = True
End Sub
Private Sub mnuITTIN_PALETAcc_click()
   menuActionITTIN_PALET = "ACC"
   menuTimerITTIN_PALET.Enabled = True
End Sub
Private Sub menuTimerITTIN_PALET_timer()
   menuTimerITTIN_PALET.Enabled = False
   If menuActionITTIN_PALET = "ADD" Then cmdITTIN_PALETAdd_Click
   If menuActionITTIN_PALET = "EDIT" Then cmdITTIN_PALETEdit_Click
   If menuActionITTIN_PALET = "DEL" Then cmdITTIN_PALETDel_Click
   If menuActionITTIN_PALET = "RUN" Then cmdITTIN_PALETRun_Click
   If menuActionITTIN_PALET = "REF" Then cmdITTIN_PALETRef_Click
   If menuActionITTIN_PALET = "PRN" Then cmdITTIN_PALETPrn_Click
   If menuActionITTIN_PALET = "CFG" Then cmdITTIN_PALETCfg_Click
   If menuActionITTIN_PALET = "FND" Then cmdITTIN_PALETFnd_Click
   If menuActionITTIN_PALET = "ACC" Then cmdITTIN_PALETAcc_Click
   menuActionITTIN_PALET = ""
End Sub

'Функция инициализации панели данными
'Parameters:
'[IN][OUT]  aItem , тип параметра: object,
'[IN][OUT]   optional pForm , тип параметра: object = nothing  - ...
'See Also:
'Example:
'  call me.OnInit({параметры})
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdITTIN_QLINEAdd, cmdITTIN_QLINEAdd.Tag
  LoadBtnPictures cmdITTIN_QLINEEdit, cmdITTIN_QLINEEdit.Tag
  LoadBtnPictures cmdITTIN_QLINEDel, cmdITTIN_QLINEDel.Tag
  LoadBtnPictures cmdITTIN_QLINERef, cmdITTIN_QLINERef.Tag
  LoadBtnPictures cmdITTIN_QLINEPrn, cmdITTIN_QLINEPrn.Tag
  LoadBtnPictures cmdITTIN_QLINEFnd, cmdITTIN_QLINEFnd.Tag
  LoadBtnPictures cmdITTIN_QLINERun, cmdITTIN_QLINERun.Tag
  LoadBtnPictures cmdITTIN_QLINEAcc, cmdITTIN_QLINEAcc.Tag
  LoadBtnPictures cmdITTIN_QLINECfg, cmdITTIN_QLINECfg.Tag
  Item.ITTIN_QLINE.PrepareGrid gridITTIN_QLINE
  LoadGridLayout gridITTIN_QLINE
  Set fndITTIN_QLINE = Nothing
  On Error Resume Next
  Set fndITTIN_QLINE = CreateObject("MTZ_JSetup.GridFinder")
  fndITTIN_QLINE.Init gridITTIN_QLINE
  LoadBtnPictures cmdITTIN_PALETAdd, cmdITTIN_PALETAdd.Tag
  LoadBtnPictures cmdITTIN_PALETEdit, cmdITTIN_PALETEdit.Tag
  LoadBtnPictures cmdITTIN_PALETDel, cmdITTIN_PALETDel.Tag
  LoadBtnPictures cmdITTIN_PALETRef, cmdITTIN_PALETRef.Tag
  LoadBtnPictures cmdITTIN_PALETPrn, cmdITTIN_PALETPrn.Tag
  LoadBtnPictures cmdITTIN_PALETFnd, cmdITTIN_PALETFnd.Tag
  LoadBtnPictures cmdITTIN_PALETCfg, cmdITTIN_PALETCfg.Tag
  LoadBtnPictures cmdITTIN_PALETRun, cmdITTIN_PALETRun.Tag
  LoadBtnPictures cmdITTIN_PALETAcc, cmdITTIN_PALETAcc.Tag
  gridITTIN_PALET.Columns.Clear
  gridITTIN_PALET.ItemCount = 0
  cmdITTIN_PALETRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlITTIN_QLINE.RestorePosition
  gridITTIN_QLINE_RowColChange gridITTIN_QLINE.Row, -1
End Sub

'Действие при активизации панели
'Parameters:
'[IN][OUT]  aItem , тип параметра: object,
'[IN][OUT]   optional pForm , тип параметра: object = nothing  - ...
'See Also:
'Example:
'  call me.OnClick({параметры})
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set Item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub

'Действие при сохранении
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnSave()
Public Sub OnSave()
  
End Sub

'Признак изменения
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.IsChanged()
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  pnlITTIN_QLINE.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub

'Освобождение ресурсов
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndITTIN_QLINE = Nothing
  Set fndITTIN_PALET = Nothing
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

  RowItem.Person.Secure Item.SecureStyleid
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
    Set part_item = part_col.Item(1)
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
    Set part_item = part_col.Item(1)
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
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", ObjTypeName)
    Else
        ID = CreateGUID2
        If Len(ObjTypeName) = 0 Then
            Dim newObj As Object
            Set newObj = Item.Application.Manager.GetNewObject
            If Not (newObj Is Nothing) Then
                OK = True
                ID = newObj.ID
            End If
        Else
            OK = Item.Application.Manager.NewInstance(ID, ObjTypeName, "")
        End If
        Dim ref As Object, objGui As Object
        Set ref = Item.Application.Manager.GetInstanceObject(ID)
        If Not ref Is Nothing Then
          Set objGui = Item.Application.Manager.GetInstanceGUI(ID)
          If objGui Is Nothing Then Set ref = Nothing: Exit Sub
          objGui.Show "", ref, False
          Set objGui = Nothing
        Else
          OK = False
        End If
    End If
    Dim Obj As Object
    Set Obj = Item.Application.Manager.GetInstanceObject(ID)
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
        Call Item.Application.Manager.AddCustomObjects(Coll, Obj.ID)
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
    Obj.EC_Def.Item(1).TheName = RowItem.TheName
 End If
 Obj.Save
 Set RowItem.LinkedEC = Obj
 RowItem.Save
 Set GObj = RowItem.Application.Manager.GetInstanceGUI(Obj.ID)
 GObj.Show "", Obj, True 'False
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 RowItem.TheName = Obj.EC_Def.Item(1).TheName
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



'Создание номенклатуры по шаблону
'{B91ABF3A-31F8-4A82-8D41-EF463DBA32D0}
Private Sub Run_SSCreateNomen(Name As Variant, Optional RowItem As Object)
On Error Resume Next

'pointCreateLine
End Sub





