VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWMSIN_QLINE_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWMSIN_PALET 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerWMSIN_QLINE 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlWMSIN_QLINE 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdWMSIN_PALETAcc 
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
      Begin MTZ_PANEL.DropButton cmdWMSIN_PALETRun 
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
      Begin VB.CommandButton cmdWMSIN_PALETFnd 
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
      Begin VB.CommandButton cmdWMSIN_PALETCfg 
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
      Begin VB.CommandButton cmdWMSIN_PALETPrn 
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
      Begin VB.CommandButton cmdWMSIN_PALETRef 
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
      Begin VB.CommandButton cmdWMSIN_PALETDel 
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
      Begin VB.CommandButton cmdWMSIN_PALETEdit 
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
      Begin VB.CommandButton cmdWMSIN_PALETAdd 
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
      Begin GridEX20.GridEX gridWMSIN_PALET 
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
         Column(1)       =   "vpnWMSIN_QLINE_.ctx":0000
         Column(2)       =   "vpnWMSIN_QLINE_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWMSIN_QLINE_.ctx":016C
         FormatStyle(2)  =   "vpnWMSIN_QLINE_.ctx":02C8
         FormatStyle(3)  =   "vpnWMSIN_QLINE_.ctx":0378
         FormatStyle(4)  =   "vpnWMSIN_QLINE_.ctx":042C
         FormatStyle(5)  =   "vpnWMSIN_QLINE_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWMSIN_QLINE_.ctx":05BC
      End
      Begin VB.CommandButton cmdWMSIN_QLINEAcc 
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
      Begin MTZ_PANEL.DropButton cmdWMSIN_QLINERun 
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
      Begin VB.CommandButton cmdWMSIN_QLINEFnd 
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
      Begin VB.CommandButton cmdWMSIN_QLINECfg 
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
      Begin VB.CommandButton cmdWMSIN_QLINEPrn 
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
      Begin VB.CommandButton cmdWMSIN_QLINERef 
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
      Begin VB.CommandButton cmdWMSIN_QLINEDel 
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
      Begin VB.CommandButton cmdWMSIN_QLINEEdit 
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
      Begin VB.CommandButton cmdWMSIN_QLINEAdd 
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
      Begin GridEX20.GridEX gridWMSIN_QLINE 
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
         Column(1)       =   "vpnWMSIN_QLINE_.ctx":0794
         Column(2)       =   "vpnWMSIN_QLINE_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWMSIN_QLINE_.ctx":0900
         FormatStyle(2)  =   "vpnWMSIN_QLINE_.ctx":0A5C
         FormatStyle(3)  =   "vpnWMSIN_QLINE_.ctx":0B0C
         FormatStyle(4)  =   "vpnWMSIN_QLINE_.ctx":0BC0
         FormatStyle(5)  =   "vpnWMSIN_QLINE_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnWMSIN_QLINE_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupWMSIN_QLINE 
      Caption         =   "Меню для Строки заказа"
      Visible         =   0   'False
      Begin VB.Menu mnuWMSIN_QLINEAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWMSIN_QLINEEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWMSIN_QLINEDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWMSIN_QLINEOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWMSIN_QLINERef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWMSIN_QLINES1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWMSIN_QLINEBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWMSIN_QLINECOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWMSIN_QLINECUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWMSIN_QLINEPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWMSIN_QLINECHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWMSIN_QLINECLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWMSIN_QLINEPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWMSIN_QLINECfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWMSIN_QLINEFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWMSIN_QLINEAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWMSIN_PALET 
      Caption         =   "Меню для Палеты к строке"
      Visible         =   0   'False
      Begin VB.Menu mnuWMSIN_PALETAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWMSIN_PALETEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWMSIN_PALETDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWMSIN_PALETOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWMSIN_PALETRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWMSIN_PALETS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWMSIN_PALETBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWMSIN_PALETCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWMSIN_PALETCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWMSIN_PALETPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWMSIN_PALETCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWMSIN_PALETCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWMSIN_PALETPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWMSIN_PALETCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWMSIN_PALETFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWMSIN_PALETAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWMSIN_QLINE_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWMSIN_QLINE As Object
Private menuActionWMSIN_QLINE As String
Private fndWMSIN_PALET As Object
Private menuActionWMSIN_PALET As String





Private Sub pnlWMSIN_QLINE_PositionChanged()
  pnlWMSIN_QLINE.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridWMSIN_QLINE_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWMSIN_QLINECfg_Click
        End If
    End If
End Sub

Private Sub gridWMSIN_QLINE_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWMSIN_QLINE
End If
End Sub
Private Sub mnuWMSIN_QLINEAdd_click()
   menuActionWMSIN_QLINE = "ADD"
   menuTimerWMSIN_QLINE.Enabled = True
End Sub
Private Sub mnuWMSIN_QLINEEdit_click()
   menuActionWMSIN_QLINE = "EDIT"
   menuTimerWMSIN_QLINE.Enabled = True
End Sub
Private Sub mnuWMSIN_QLINEDelete_click()
   menuActionWMSIN_QLINE = "DEL"
   menuTimerWMSIN_QLINE.Enabled = True
End Sub
Private Sub mnuWMSIN_QLINEOpen_click()
   menuActionWMSIN_QLINE = "RUN"
   menuTimerWMSIN_QLINE.Enabled = True
End Sub
Private Sub mnuWMSIN_QLINERef_click()
   menuActionWMSIN_QLINE = "REF"
   menuTimerWMSIN_QLINE.Enabled = True
End Sub
  Private Sub mnuWMSIN_QLINECOPY_Click()
    On Error Resume Next
    If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
    If gridWMSIN_QLINE.Row > 0 Then
     If gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSIN_QLINE.RowBookmark(gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWMSIN_QLINECUT_Click()
    On Error Resume Next
    If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
    If gridWMSIN_QLINE.Row > 0 Then
     If gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSIN_QLINE.RowBookmark(gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWMSIN_QLINE.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWMSIN_QLINECHANGE_Click()
  On Error Resume Next
  If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
  If gridWMSIN_QLINE.Row > 0 Then
   If gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSIN_QLINE.RowBookmark(gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWMSIN_QLINE.ItemCount = u.Parent.Count
      gridWMSIN_QLINE.RefreshRowIndex gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWMSIN_QLINECLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWMSIN_QLINEPrn_click()
   menuActionWMSIN_QLINE = "PRN"
   menuTimerWMSIN_QLINE.Enabled = True
End Sub
Private Sub mnuWMSIN_QLINECfg_click()
   menuActionWMSIN_QLINE = "CFG"
   menuTimerWMSIN_QLINE.Enabled = True
End Sub
Private Sub mnuWMSIN_QLINEFind_click()
   menuActionWMSIN_QLINE = "FND"
   menuTimerWMSIN_QLINE.Enabled = True
End Sub
Private Sub mnuWMSIN_QLINEAcc_click()
   menuActionWMSIN_QLINE = "ACC"
   menuTimerWMSIN_QLINE.Enabled = True
End Sub
Private Sub menuTimerWMSIN_QLINE_timer()
   menuTimerWMSIN_QLINE.Enabled = False
   If menuActionWMSIN_QLINE = "ADD" Then cmdWMSIN_QLINEAdd_Click
   If menuActionWMSIN_QLINE = "EDIT" Then cmdWMSIN_QLINEEdit_Click
   If menuActionWMSIN_QLINE = "DEL" Then cmdWMSIN_QLINEDel_Click
   If menuActionWMSIN_QLINE = "RUN" Then cmdWMSIN_QLINERun_Click
   If menuActionWMSIN_QLINE = "REF" Then cmdWMSIN_QLINERef_Click
   If menuActionWMSIN_QLINE = "PRN" Then cmdWMSIN_QLINEPrn_Click
   If menuActionWMSIN_QLINE = "CFG" Then cmdWMSIN_QLINECfg_Click
   If menuActionWMSIN_QLINE = "FND" Then cmdWMSIN_QLINEFnd_Click
   If menuActionWMSIN_QLINE = "ACC" Then cmdWMSIN_QLINEAcc_Click
   menuActionWMSIN_QLINE = ""
End Sub
Private Sub cmdWMSIN_QLINECfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWMSIN_QLINE, "gridWMSIN_QLINE"
Set jset = Nothing
End Sub

Private Sub cmdWMSIN_QLINEPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWMSIN_QLINE, "Строки заказа"
Set jset = Nothing
End Sub

Private Sub cmdWMSIN_QLINERef_Click()
  On Error Resume Next
  item.WMSIN_QLINE.Refresh
  gridWMSIN_QLINE.ItemCount = item.WMSIN_QLINE.Count
  gridWMSIN_QLINE.Refetch
  gridWMSIN_QLINE.Refresh
End Sub
Private Sub cmdWMSIN_QLINEAcc_Click()
On Error Resume Next
If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
If gridWMSIN_QLINE.Row > 0 Then
 If gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSIN_QLINE.RowBookmark(gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWMSIN_QLINEEdit_Click()
  On Error Resume Next
If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
If gridWMSIN_QLINE.Row > 0 Then
 If gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSIN_QLINE.RowBookmark(gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWMSIN_QLINE_.item = u
again:     frmWMSIN_QLINE_.NotFirstTime = False
    frmWMSIN_QLINE_.OnInit
    frmWMSIN_QLINE_.Show vbModal
    If frmWMSIN_QLINE_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWMSIN_QLINE.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWMSIN_QLINEDel_Click()
  On Error Resume Next
  gridWMSIN_QLINE.Delete
End Sub
Private Sub cmdWMSIN_QLINEAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.WMSIN_QLINE.Add()

      Set frmWMSIN_QLINE_.item = u
again:       frmWMSIN_QLINE_.NotFirstTime = False
      frmWMSIN_QLINE_.OnInit
      frmWMSIN_QLINE_.Show vbModal
      If frmWMSIN_QLINE_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWMSIN_QLINE.ItemCount = item.WMSIN_QLINE.Count
        gridWMSIN_QLINE.Refresh
        gridWMSIN_QLINE.RefreshGroups
        gridWMSIN_QLINE.RefreshSort
        gridWMSIN_QLINE.MoveToBookmark u.ID & "WMSIN_QLINE"
      Else
        item.WMSIN_QLINE.Delete u.ID
        item.WMSIN_QLINE.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWMSIN_QLINEFnd_Click()
  On Error Resume Next
  fndWMSIN_QLINE.ShowForm
End Sub
Private Sub cmdWMSIN_QLINERun_Click()
  On Error Resume Next
  gridWMSIN_QLINE_DblClick
End Sub
Private Sub gridWMSIN_QLINE_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.WMSIN_QLINE.LoadRow gridWMSIN_QLINE, RowIndex, Bookmark, Values
End Sub
Private Sub gridWMSIN_QLINE_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
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
Private Sub gridWMSIN_QLINE_DblClick()
  cmdWMSIN_QLINEEdit_Click
End Sub
Private Sub gridWMSIN_QLINE_KeyPress(KeyAscii As Integer)
  If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWMSIN_QLINE.FindOnPress KeyAscii
End Sub

Private Sub pnlWMSIN_QLINE_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridWMSIN_QLINE.Left = Left
  gridWMSIN_QLINE.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWMSIN_QLINE.Width = Width
  gridWMSIN_QLINE.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWMSIN_QLINEAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_QLINEEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_QLINEDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_QLINERef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_QLINEPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_QLINECfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_QLINEFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_QLINERun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_QLINEAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_QLINEAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWMSIN_QLINEEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWMSIN_QLINEDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWMSIN_QLINERef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWMSIN_QLINEPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWMSIN_QLINECfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWMSIN_QLINEFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWMSIN_QLINERun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWMSIN_QLINEAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuWMSIN_QLINEPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.WMSIN_QLINE.Add()
    If GetFromBuffer(u) Then
      gridWMSIN_QLINE.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdWMSIN_PALETCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWMSIN_PALET, "gridWMSIN_PALET"
Set jset = Nothing
End Sub

Private Sub cmdWMSIN_PALETPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWMSIN_PALET, "Палеты к строке"
Set jset = Nothing
End Sub

Private Sub cmdWMSIN_PALETAcc_Click()
On Error Resume Next
If gridWMSIN_PALET.ItemCount = 0 Then Exit Sub
If gridWMSIN_PALET.Row > 0 Then
 If gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSIN_PALET.RowBookmark(gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWMSIN_PALETFnd_Click()
  On Error Resume Next
  fndWMSIN_PALET.ShowForm
End Sub
Private Sub cmdWMSIN_PALETRun_Click()
  On Error Resume Next
  gridWMSIN_PALET_DblClick
End Sub
Private Sub pnlWMSIN_QLINE_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridWMSIN_PALET.Left = Left
  gridWMSIN_PALET.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWMSIN_PALET.Width = Width
  gridWMSIN_PALET.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWMSIN_PALETAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_PALETEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_PALETDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_PALETRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_PALETPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_PALETCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_PALETFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_PALETRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_PALETAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWMSIN_PALETAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWMSIN_PALETEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWMSIN_PALETDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWMSIN_PALETRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWMSIN_PALETPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWMSIN_PALETCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWMSIN_PALETFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWMSIN_PALETRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWMSIN_PALETAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdWMSIN_PALETRef_Click()
  On Error Resume Next
If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
If gridWMSIN_QLINE.Row > 0 Then
 If gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWMSIN_QLINE.RowBookmark(gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WMSIN_PALET.Refresh
   gridWMSIN_PALET.ItemCount = gu.WMSIN_PALET.Count
   gridWMSIN_PALET.Refetch
   gridWMSIN_PALET.Refresh
 Else
  gridWMSIN_PALET.Columns.Clear
  gridWMSIN_PALET.ItemCount = 0
 End If
Else
 gridWMSIN_PALET.Columns.Clear
 gridWMSIN_PALET.ItemCount = 0
End If
End Sub
Private Sub cmdWMSIN_PALETEdit_Click()
    If gridWMSIN_PALET.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWMSIN_PALET.RowBookmark(gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmWMSIN_PALET_.item = u
again:     frmWMSIN_PALET_.NotFirstTime = False
    frmWMSIN_PALET_.OnInit
    frmWMSIN_PALET_.Show vbModal
    If frmWMSIN_PALET_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWMSIN_PALET.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdWMSIN_PALETDel_Click()
  On Error Resume Next
  gridWMSIN_PALET.Delete
End Sub
Private Sub cmdWMSIN_PALETAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridWMSIN_QLINE.RowBookmark(gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.WMSIN_PALET.Add()

      Set frmWMSIN_PALET_.item = u
again:       frmWMSIN_PALET_.NotFirstTime = False
      frmWMSIN_PALET_.OnInit
      frmWMSIN_PALET_.Show vbModal
      If frmWMSIN_PALET_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWMSIN_PALET.ItemCount = gu.WMSIN_PALET.Count
        gridWMSIN_PALET.Refresh
        gridWMSIN_PALET.RefreshGroups
        gridWMSIN_PALET.RefreshSort
        gridWMSIN_PALET.MoveToBookmark u.ID & "WMSIN_PALET"
      Else
        gu.WMSIN_PALET.Delete u.ID
        gu.WMSIN_PALET.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridWMSIN_QLINE_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridWMSIN_QLINE.ItemCount = 0 Then
  gridWMSIN_PALET.ItemCount = 0
  Exit Sub
End If
If gridWMSIN_QLINE.Row > 0 Then
  If LastRow <> gridWMSIN_QLINE.Row And LastRow > 0 Then
    gridWMSIN_QLINE.GetRowData(LastRow).RowStyle = "Default"
    gridWMSIN_QLINE.GetRowData(gridWMSIN_QLINE.Row).RowStyle = "SelectedRow"
  End If
 If gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row) > 0 Then
  If LastRow <> gridWMSIN_QLINE.Row Or gridWMSIN_PALET.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWMSIN_QLINE.RowBookmark(gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WMSIN_PALET.PrepareGrid gridWMSIN_PALET
  gridWMSIN_PALET.ItemCount = 0
    LoadGridLayout gridWMSIN_PALET
    Set fndWMSIN_PALET = Nothing
    Set fndWMSIN_PALET = CreateObject("MTZ_JSetup.GridFinder")
    fndWMSIN_PALET.Init gridWMSIN_PALET
  gridWMSIN_PALET.ItemCount = gu.WMSIN_PALET.Count
  End If
 End If
End If
End Sub
Private Sub gridWMSIN_PALET_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
    If gridWMSIN_PALET.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWMSIN_QLINE.RowBookmark(gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WMSIN_PALET.LoadRow gridWMSIN_PALET, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridWMSIN_PALET_KeyPress(KeyAscii As Integer)
  If gridWMSIN_PALET.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWMSIN_PALET.FindOnPress KeyAscii
End Sub

Private Sub gridWMSIN_PALET_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridWMSIN_PALET.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWMSIN_PALET.RowBookmark(gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row))
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
Private Sub gridWMSIN_PALET_DblClick()
    cmdWMSIN_PALETEdit_Click
End Sub
Private Sub gridWMSIN_PALET_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridWMSIN_PALET.ItemCount = 0 Then Exit Sub
 If gridWMSIN_PALET.Row > 0 Then
   If LastRow <> gridWMSIN_PALET.Row And LastRow > 0 Then
     gridWMSIN_PALET.GetRowData(LastRow).RowStyle = "Default"
     gridWMSIN_PALET.GetRowData(gridWMSIN_PALET.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuWMSIN_PALETPASTE_Click()
On Error Resume Next
    If gridWMSIN_QLINE.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWMSIN_QLINE.RowBookmark(gridWMSIN_QLINE.RowIndex(gridWMSIN_QLINE.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.WMSIN_PALET.Add()
    If GetFromBuffer(u) Then
      gridWMSIN_PALET.ItemCount = u.Parent.Count
    Else
      gu.WMSIN_PALET.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridWMSIN_PALET_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWMSIN_PALETCfg_Click
        End If
    End If
End Sub

Private Sub gridWMSIN_PALET_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWMSIN_PALET
End If
End Sub
Private Sub mnuWMSIN_PALETAdd_click()
   menuActionWMSIN_PALET = "ADD"
   menuTimerWMSIN_PALET.Enabled = True
End Sub
Private Sub mnuWMSIN_PALETEdit_click()
   menuActionWMSIN_PALET = "EDIT"
   menuTimerWMSIN_PALET.Enabled = True
End Sub
Private Sub mnuWMSIN_PALETDelete_click()
   menuActionWMSIN_PALET = "DEL"
   menuTimerWMSIN_PALET.Enabled = True
End Sub
Private Sub mnuWMSIN_PALETOpen_click()
   menuActionWMSIN_PALET = "RUN"
   menuTimerWMSIN_PALET.Enabled = True
End Sub
Private Sub mnuWMSIN_PALETRef_click()
   menuActionWMSIN_PALET = "REF"
   menuTimerWMSIN_PALET.Enabled = True
End Sub
  Private Sub mnuWMSIN_PALETCOPY_Click()
    On Error Resume Next
    If gridWMSIN_PALET.ItemCount = 0 Then Exit Sub
    If gridWMSIN_PALET.Row > 0 Then
     If gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSIN_PALET.RowBookmark(gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWMSIN_PALETCUT_Click()
    On Error Resume Next
    If gridWMSIN_PALET.ItemCount = 0 Then Exit Sub
    If gridWMSIN_PALET.Row > 0 Then
     If gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWMSIN_PALET.RowBookmark(gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWMSIN_PALET.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWMSIN_PALETCHANGE_Click()
  On Error Resume Next
  If gridWMSIN_PALET.ItemCount = 0 Then Exit Sub
  If gridWMSIN_PALET.Row > 0 Then
   If gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWMSIN_PALET.RowBookmark(gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWMSIN_PALET.ItemCount = u.Parent.Count
      gridWMSIN_PALET.RefreshRowIndex gridWMSIN_PALET.RowIndex(gridWMSIN_PALET.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWMSIN_PALETCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWMSIN_PALETPrn_click()
   menuActionWMSIN_PALET = "PRN"
   menuTimerWMSIN_PALET.Enabled = True
End Sub
Private Sub mnuWMSIN_PALETCfg_click()
   menuActionWMSIN_PALET = "CFG"
   menuTimerWMSIN_PALET.Enabled = True
End Sub
Private Sub mnuWMSIN_PALETFind_click()
   menuActionWMSIN_PALET = "FND"
   menuTimerWMSIN_PALET.Enabled = True
End Sub
Private Sub mnuWMSIN_PALETAcc_click()
   menuActionWMSIN_PALET = "ACC"
   menuTimerWMSIN_PALET.Enabled = True
End Sub
Private Sub menuTimerWMSIN_PALET_timer()
   menuTimerWMSIN_PALET.Enabled = False
   If menuActionWMSIN_PALET = "ADD" Then cmdWMSIN_PALETAdd_Click
   If menuActionWMSIN_PALET = "EDIT" Then cmdWMSIN_PALETEdit_Click
   If menuActionWMSIN_PALET = "DEL" Then cmdWMSIN_PALETDel_Click
   If menuActionWMSIN_PALET = "RUN" Then cmdWMSIN_PALETRun_Click
   If menuActionWMSIN_PALET = "REF" Then cmdWMSIN_PALETRef_Click
   If menuActionWMSIN_PALET = "PRN" Then cmdWMSIN_PALETPrn_Click
   If menuActionWMSIN_PALET = "CFG" Then cmdWMSIN_PALETCfg_Click
   If menuActionWMSIN_PALET = "FND" Then cmdWMSIN_PALETFnd_Click
   If menuActionWMSIN_PALET = "ACC" Then cmdWMSIN_PALETAcc_Click
   menuActionWMSIN_PALET = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWMSIN_QLINEAdd, cmdWMSIN_QLINEAdd.Tag
  LoadBtnPictures cmdWMSIN_QLINEEdit, cmdWMSIN_QLINEEdit.Tag
  LoadBtnPictures cmdWMSIN_QLINEDel, cmdWMSIN_QLINEDel.Tag
  LoadBtnPictures cmdWMSIN_QLINERef, cmdWMSIN_QLINERef.Tag
  LoadBtnPictures cmdWMSIN_QLINEPrn, cmdWMSIN_QLINEPrn.Tag
  LoadBtnPictures cmdWMSIN_QLINEFnd, cmdWMSIN_QLINEFnd.Tag
  LoadBtnPictures cmdWMSIN_QLINERun, cmdWMSIN_QLINERun.Tag
  LoadBtnPictures cmdWMSIN_QLINEAcc, cmdWMSIN_QLINEAcc.Tag
  LoadBtnPictures cmdWMSIN_QLINECfg, cmdWMSIN_QLINECfg.Tag
  item.WMSIN_QLINE.PrepareGrid gridWMSIN_QLINE
  LoadGridLayout gridWMSIN_QLINE
  Set fndWMSIN_QLINE = Nothing
  On Error Resume Next
  Set fndWMSIN_QLINE = CreateObject("MTZ_JSetup.GridFinder")
  fndWMSIN_QLINE.Init gridWMSIN_QLINE
  LoadBtnPictures cmdWMSIN_PALETAdd, cmdWMSIN_PALETAdd.Tag
  LoadBtnPictures cmdWMSIN_PALETEdit, cmdWMSIN_PALETEdit.Tag
  LoadBtnPictures cmdWMSIN_PALETDel, cmdWMSIN_PALETDel.Tag
  LoadBtnPictures cmdWMSIN_PALETRef, cmdWMSIN_PALETRef.Tag
  LoadBtnPictures cmdWMSIN_PALETPrn, cmdWMSIN_PALETPrn.Tag
  LoadBtnPictures cmdWMSIN_PALETFnd, cmdWMSIN_PALETFnd.Tag
  LoadBtnPictures cmdWMSIN_PALETCfg, cmdWMSIN_PALETCfg.Tag
  LoadBtnPictures cmdWMSIN_PALETRun, cmdWMSIN_PALETRun.Tag
  LoadBtnPictures cmdWMSIN_PALETAcc, cmdWMSIN_PALETAcc.Tag
  gridWMSIN_PALET.Columns.Clear
  gridWMSIN_PALET.ItemCount = 0
  cmdWMSIN_PALETRef_Click
End Sub
Private Sub OnTabClick()

pnlWMSIN_QLINE.RestorePosition
  gridWMSIN_QLINE_RowColChange gridWMSIN_QLINE.Row, -1
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
  pnlWMSIN_QLINE.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndWMSIN_QLINE = Nothing
  Set fndWMSIN_PALET = Nothing
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





