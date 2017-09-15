VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnMTZ_Inst_Section_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerMTZ_Inst_Sec_Files 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerMTZ_Inst_Section 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlMTZ_Inst_Section 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdMTZ_Inst_Sec_FilesAcc 
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
      Begin MTZ_PANEL.DropButton cmdMTZ_Inst_Sec_FilesRun 
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
      Begin VB.CommandButton cmdMTZ_Inst_Sec_FilesFnd 
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
      Begin VB.CommandButton cmdMTZ_Inst_Sec_FilesCfg 
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
      Begin VB.CommandButton cmdMTZ_Inst_Sec_FilesPrn 
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
      Begin VB.CommandButton cmdMTZ_Inst_Sec_FilesRef 
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
      Begin VB.CommandButton cmdMTZ_Inst_Sec_FilesDel 
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
      Begin VB.CommandButton cmdMTZ_Inst_Sec_FilesEdit 
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
      Begin VB.CommandButton cmdMTZ_Inst_Sec_FilesAdd 
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
      Begin GridEX20.GridEX gridMTZ_Inst_Sec_Files 
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
         Column(1)       =   "vpnMTZ_Inst_Section_.ctx":0000
         Column(2)       =   "vpnMTZ_Inst_Section_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnMTZ_Inst_Section_.ctx":016C
         FormatStyle(2)  =   "vpnMTZ_Inst_Section_.ctx":02C8
         FormatStyle(3)  =   "vpnMTZ_Inst_Section_.ctx":0378
         FormatStyle(4)  =   "vpnMTZ_Inst_Section_.ctx":042C
         FormatStyle(5)  =   "vpnMTZ_Inst_Section_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnMTZ_Inst_Section_.ctx":05BC
      End
      Begin VB.CommandButton cmdMTZ_Inst_SectionAcc 
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
      Begin MTZ_PANEL.DropButton cmdMTZ_Inst_SectionRun 
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
      Begin VB.CommandButton cmdMTZ_Inst_SectionFnd 
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
      Begin VB.CommandButton cmdMTZ_Inst_SectionCfg 
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
      Begin VB.CommandButton cmdMTZ_Inst_SectionPrn 
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
      Begin VB.CommandButton cmdMTZ_Inst_SectionRef 
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
      Begin VB.CommandButton cmdMTZ_Inst_SectionDel 
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
      Begin VB.CommandButton cmdMTZ_Inst_SectionEdit 
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
      Begin VB.CommandButton cmdMTZ_Inst_SectionAdd 
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
      Begin GridEX20.GridEX gridMTZ_Inst_Section 
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
         Column(1)       =   "vpnMTZ_Inst_Section_.ctx":0794
         Column(2)       =   "vpnMTZ_Inst_Section_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnMTZ_Inst_Section_.ctx":0900
         FormatStyle(2)  =   "vpnMTZ_Inst_Section_.ctx":0A5C
         FormatStyle(3)  =   "vpnMTZ_Inst_Section_.ctx":0B0C
         FormatStyle(4)  =   "vpnMTZ_Inst_Section_.ctx":0BC0
         FormatStyle(5)  =   "vpnMTZ_Inst_Section_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnMTZ_Inst_Section_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupMTZ_Inst_Section 
      Caption         =   "Меню для Секции"
      Visible         =   0   'False
      Begin VB.Menu mnuMTZ_Inst_SectionAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuMTZ_Inst_SectionEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuMTZ_Inst_SectionDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuMTZ_Inst_SectionOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuMTZ_Inst_SectionRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuMTZ_Inst_SectionS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMTZ_Inst_SectionBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuMTZ_Inst_SectionCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuMTZ_Inst_SectionCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuMTZ_Inst_SectionPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuMTZ_Inst_SectionCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuMTZ_Inst_SectionCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuMTZ_Inst_SectionPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuMTZ_Inst_SectionCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuMTZ_Inst_SectionFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuMTZ_Inst_SectionAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupMTZ_Inst_Sec_Files 
      Caption         =   "Меню для Файлы секции"
      Visible         =   0   'False
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuMTZ_Inst_Sec_FilesCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuMTZ_Inst_Sec_FilesCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuMTZ_Inst_Sec_FilesPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuMTZ_Inst_Sec_FilesCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuMTZ_Inst_Sec_FilesCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuMTZ_Inst_Sec_FilesAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnMTZ_Inst_Section_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела
Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndMTZ_Inst_Section As Object
Private menuActionMTZ_Inst_Section As String
Private fndMTZ_Inst_Sec_Files As Object
Private menuActionMTZ_Inst_Sec_Files As String





Private Sub pnlMTZ_Inst_Section_PositionChanged()
  pnlMTZ_Inst_Section.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridMTZ_Inst_Section_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdMTZ_Inst_SectionCfg_Click
        End If
    End If
End Sub

Private Sub gridMTZ_Inst_Section_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupMTZ_Inst_Section
End If
End Sub
Private Sub mnuMTZ_Inst_SectionAdd_click()
   menuActionMTZ_Inst_Section = "ADD"
   menuTimerMTZ_Inst_Section.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_SectionEdit_click()
   menuActionMTZ_Inst_Section = "EDIT"
   menuTimerMTZ_Inst_Section.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_SectionDelete_click()
   menuActionMTZ_Inst_Section = "DEL"
   menuTimerMTZ_Inst_Section.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_SectionOpen_click()
   menuActionMTZ_Inst_Section = "RUN"
   menuTimerMTZ_Inst_Section.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_SectionRef_click()
   menuActionMTZ_Inst_Section = "REF"
   menuTimerMTZ_Inst_Section.Enabled = True
End Sub
  Private Sub mnuMTZ_Inst_SectionCOPY_Click()
    On Error Resume Next
    If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
    If gridMTZ_Inst_Section.Row > 0 Then
     If gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridMTZ_Inst_Section.RowBookmark(gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuMTZ_Inst_SectionCUT_Click()
    On Error Resume Next
    If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
    If gridMTZ_Inst_Section.Row > 0 Then
     If gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridMTZ_Inst_Section.RowBookmark(gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridMTZ_Inst_Section.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuMTZ_Inst_SectionCHANGE_Click()
  On Error Resume Next
  If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
  If gridMTZ_Inst_Section.Row > 0 Then
   If gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridMTZ_Inst_Section.RowBookmark(gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridMTZ_Inst_Section.ItemCount = u.Parent.Count
      gridMTZ_Inst_Section.RefreshRowIndex gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuMTZ_Inst_SectionCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuMTZ_Inst_SectionPrn_click()
   menuActionMTZ_Inst_Section = "PRN"
   menuTimerMTZ_Inst_Section.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_SectionCfg_click()
   menuActionMTZ_Inst_Section = "CFG"
   menuTimerMTZ_Inst_Section.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_SectionFind_click()
   menuActionMTZ_Inst_Section = "FND"
   menuTimerMTZ_Inst_Section.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_SectionAcc_click()
   menuActionMTZ_Inst_Section = "ACC"
   menuTimerMTZ_Inst_Section.Enabled = True
End Sub
Private Sub menuTimerMTZ_Inst_Section_timer()
   menuTimerMTZ_Inst_Section.Enabled = False
   If menuActionMTZ_Inst_Section = "ADD" Then cmdMTZ_Inst_SectionAdd_Click
   If menuActionMTZ_Inst_Section = "EDIT" Then cmdMTZ_Inst_SectionEdit_Click
   If menuActionMTZ_Inst_Section = "DEL" Then cmdMTZ_Inst_SectionDel_Click
   If menuActionMTZ_Inst_Section = "RUN" Then cmdMTZ_Inst_SectionRun_Click
   If menuActionMTZ_Inst_Section = "REF" Then cmdMTZ_Inst_SectionRef_Click
   If menuActionMTZ_Inst_Section = "PRN" Then cmdMTZ_Inst_SectionPrn_Click
   If menuActionMTZ_Inst_Section = "CFG" Then cmdMTZ_Inst_SectionCfg_Click
   If menuActionMTZ_Inst_Section = "FND" Then cmdMTZ_Inst_SectionFnd_Click
   If menuActionMTZ_Inst_Section = "ACC" Then cmdMTZ_Inst_SectionAcc_Click
   menuActionMTZ_Inst_Section = ""
End Sub
Private Sub cmdMTZ_Inst_SectionCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridMTZ_Inst_Section, "gridMTZ_Inst_Section"
Set jset = Nothing
End Sub

Private Sub cmdMTZ_Inst_SectionPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridMTZ_Inst_Section, "Секции"
Set jset = Nothing
End Sub

Private Sub cmdMTZ_Inst_SectionRef_Click()
  On Error Resume Next
  item.MTZ_Inst_Section.Refresh
  gridMTZ_Inst_Section.ItemCount = item.MTZ_Inst_Section.Count
  gridMTZ_Inst_Section.Refetch
  gridMTZ_Inst_Section.Refresh
End Sub
Private Sub cmdMTZ_Inst_SectionAcc_Click()
On Error Resume Next
If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
If gridMTZ_Inst_Section.Row > 0 Then
 If gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridMTZ_Inst_Section.RowBookmark(gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdMTZ_Inst_SectionEdit_Click()
  On Error Resume Next
If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
If gridMTZ_Inst_Section.Row > 0 Then
 If gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridMTZ_Inst_Section.RowBookmark(gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmMTZ_Inst_Section_.item = u
again:     frmMTZ_Inst_Section_.NotFirstTime = False
    frmMTZ_Inst_Section_.OnInit
    frmMTZ_Inst_Section_.Show vbModal
    If frmMTZ_Inst_Section_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridMTZ_Inst_Section.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdMTZ_Inst_SectionDel_Click()
  On Error Resume Next
  gridMTZ_Inst_Section.Delete
End Sub
Private Sub cmdMTZ_Inst_SectionAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.MTZ_Inst_Section.Add()

      Set frmMTZ_Inst_Section_.item = u
again:       frmMTZ_Inst_Section_.NotFirstTime = False
      frmMTZ_Inst_Section_.OnInit
      frmMTZ_Inst_Section_.Show vbModal
      If frmMTZ_Inst_Section_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridMTZ_Inst_Section.ItemCount = item.MTZ_Inst_Section.Count
        gridMTZ_Inst_Section.Refresh
        gridMTZ_Inst_Section.RefreshGroups
        gridMTZ_Inst_Section.RefreshSort
        gridMTZ_Inst_Section.MoveToBookmark u.ID & "MTZ_Inst_Section"
      Else
        item.MTZ_Inst_Section.Delete u.ID
        item.MTZ_Inst_Section.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdMTZ_Inst_SectionFnd_Click()
  On Error Resume Next
  fndMTZ_Inst_Section.ShowForm
End Sub
Private Sub cmdMTZ_Inst_SectionRun_Click()
  On Error Resume Next
  gridMTZ_Inst_Section_DblClick
End Sub
Private Sub gridMTZ_Inst_Section_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.MTZ_Inst_Section.LoadRow gridMTZ_Inst_Section, RowIndex, Bookmark, Values
End Sub
Private Sub gridMTZ_Inst_Section_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
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
Private Sub gridMTZ_Inst_Section_DblClick()
  cmdMTZ_Inst_SectionEdit_Click
End Sub
Private Sub gridMTZ_Inst_Section_KeyPress(KeyAscii As Integer)
  If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndMTZ_Inst_Section.FindOnPress KeyAscii
End Sub

Private Sub pnlMTZ_Inst_Section_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridMTZ_Inst_Section.Left = Left
  gridMTZ_Inst_Section.Top = Top + 25 * Screen.TwipsPerPixelY
  gridMTZ_Inst_Section.Width = Width
  gridMTZ_Inst_Section.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_SectionAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_SectionEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_SectionDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_SectionRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_SectionPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_SectionCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_SectionFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_SectionRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_SectionAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_SectionAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_SectionEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_SectionDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_SectionRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_SectionPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_SectionCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_SectionFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_SectionRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_SectionAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuMTZ_Inst_SectionPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.MTZ_Inst_Section.Add()
    If GetFromBuffer(u) Then
      gridMTZ_Inst_Section.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdMTZ_Inst_Sec_FilesCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridMTZ_Inst_Sec_Files, "gridMTZ_Inst_Sec_Files"
Set jset = Nothing
End Sub

Private Sub cmdMTZ_Inst_Sec_FilesPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridMTZ_Inst_Sec_Files, "Файлы секции"
Set jset = Nothing
End Sub

Private Sub cmdMTZ_Inst_Sec_FilesAcc_Click()
On Error Resume Next
If gridMTZ_Inst_Sec_Files.ItemCount = 0 Then Exit Sub
If gridMTZ_Inst_Sec_Files.Row > 0 Then
 If gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridMTZ_Inst_Sec_Files.RowBookmark(gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdMTZ_Inst_Sec_FilesFnd_Click()
  On Error Resume Next
  fndMTZ_Inst_Sec_Files.ShowForm
End Sub
Private Sub cmdMTZ_Inst_Sec_FilesRun_Click()
  On Error Resume Next
  gridMTZ_Inst_Sec_Files_DblClick
End Sub
Private Sub pnlMTZ_Inst_Section_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridMTZ_Inst_Sec_Files.Left = Left
  gridMTZ_Inst_Sec_Files.Top = Top + 25 * Screen.TwipsPerPixelY
  gridMTZ_Inst_Sec_Files.Width = Width
  gridMTZ_Inst_Sec_Files.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_Sec_FilesAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_Sec_FilesEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_Sec_FilesDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_Sec_FilesRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_Sec_FilesPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_Sec_FilesCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_Sec_FilesFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_Sec_FilesRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_Sec_FilesAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdMTZ_Inst_Sec_FilesAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_Sec_FilesEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_Sec_FilesDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_Sec_FilesRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_Sec_FilesPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_Sec_FilesCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_Sec_FilesFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_Sec_FilesRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdMTZ_Inst_Sec_FilesAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdMTZ_Inst_Sec_FilesRef_Click()
  On Error Resume Next
If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
If gridMTZ_Inst_Section.Row > 0 Then
 If gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridMTZ_Inst_Section.RowBookmark(gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.MTZ_Inst_Sec_Files.Refresh
   gridMTZ_Inst_Sec_Files.ItemCount = gu.MTZ_Inst_Sec_Files.Count
   gridMTZ_Inst_Sec_Files.Refetch
   gridMTZ_Inst_Sec_Files.Refresh
 Else
  gridMTZ_Inst_Sec_Files.Columns.Clear
  gridMTZ_Inst_Sec_Files.ItemCount = 0
 End If
Else
 gridMTZ_Inst_Sec_Files.Columns.Clear
 gridMTZ_Inst_Sec_Files.ItemCount = 0
End If
End Sub
Private Sub cmdMTZ_Inst_Sec_FilesEdit_Click()
    If gridMTZ_Inst_Sec_Files.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridMTZ_Inst_Sec_Files.RowBookmark(gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmMTZ_Inst_Sec_Files_.item = u
again:     frmMTZ_Inst_Sec_Files_.NotFirstTime = False
    frmMTZ_Inst_Sec_Files_.OnInit
    frmMTZ_Inst_Sec_Files_.Show vbModal
    If frmMTZ_Inst_Sec_Files_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridMTZ_Inst_Sec_Files.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdMTZ_Inst_Sec_FilesDel_Click()
  On Error Resume Next
  gridMTZ_Inst_Sec_Files.Delete
End Sub
Private Sub cmdMTZ_Inst_Sec_FilesAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridMTZ_Inst_Section.RowBookmark(gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.MTZ_Inst_Sec_Files.Add()

      Set frmMTZ_Inst_Sec_Files_.item = u
again:       frmMTZ_Inst_Sec_Files_.NotFirstTime = False
      frmMTZ_Inst_Sec_Files_.OnInit
      frmMTZ_Inst_Sec_Files_.Show vbModal
      If frmMTZ_Inst_Sec_Files_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridMTZ_Inst_Sec_Files.ItemCount = gu.MTZ_Inst_Sec_Files.Count
        gridMTZ_Inst_Sec_Files.Refresh
        gridMTZ_Inst_Sec_Files.RefreshGroups
        gridMTZ_Inst_Sec_Files.RefreshSort
        gridMTZ_Inst_Sec_Files.MoveToBookmark u.ID & "MTZ_Inst_Sec_Files"
      Else
        gu.MTZ_Inst_Sec_Files.Delete u.ID
        gu.MTZ_Inst_Sec_Files.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridMTZ_Inst_Section_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridMTZ_Inst_Section.ItemCount = 0 Then
  gridMTZ_Inst_Sec_Files.ItemCount = 0
  Exit Sub
End If
If gridMTZ_Inst_Section.Row > 0 Then
  If LastRow <> gridMTZ_Inst_Section.Row And LastRow > 0 Then
    gridMTZ_Inst_Section.GetRowData(LastRow).RowStyle = "Default"
    gridMTZ_Inst_Section.GetRowData(gridMTZ_Inst_Section.Row).RowStyle = "SelectedRow"
  End If
 If gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row) > 0 Then
  If LastRow <> gridMTZ_Inst_Section.Row Or gridMTZ_Inst_Sec_Files.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridMTZ_Inst_Section.RowBookmark(gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.MTZ_Inst_Sec_Files.PrepareGrid gridMTZ_Inst_Sec_Files
  gridMTZ_Inst_Sec_Files.ItemCount = 0
    LoadGridLayout gridMTZ_Inst_Sec_Files
    Set fndMTZ_Inst_Sec_Files = Nothing
    Set fndMTZ_Inst_Sec_Files = CreateObject("MTZ_JSetup.GridFinder")
    fndMTZ_Inst_Sec_Files.Init gridMTZ_Inst_Sec_Files
  gridMTZ_Inst_Sec_Files.ItemCount = gu.MTZ_Inst_Sec_Files.Count
  End If
 End If
End If
End Sub
Private Sub gridMTZ_Inst_Sec_Files_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
    If gridMTZ_Inst_Sec_Files.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridMTZ_Inst_Section.RowBookmark(gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.MTZ_Inst_Sec_Files.LoadRow gridMTZ_Inst_Sec_Files, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridMTZ_Inst_Sec_Files_KeyPress(KeyAscii As Integer)
  If gridMTZ_Inst_Sec_Files.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndMTZ_Inst_Sec_Files.FindOnPress KeyAscii
End Sub

Private Sub gridMTZ_Inst_Sec_Files_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridMTZ_Inst_Sec_Files.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridMTZ_Inst_Sec_Files.RowBookmark(gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row))
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
Private Sub gridMTZ_Inst_Sec_Files_DblClick()
    cmdMTZ_Inst_Sec_FilesEdit_Click
End Sub
Private Sub gridMTZ_Inst_Sec_Files_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridMTZ_Inst_Sec_Files.ItemCount = 0 Then Exit Sub
 If gridMTZ_Inst_Sec_Files.Row > 0 Then
   If LastRow <> gridMTZ_Inst_Sec_Files.Row And LastRow > 0 Then
     gridMTZ_Inst_Sec_Files.GetRowData(LastRow).RowStyle = "Default"
     gridMTZ_Inst_Sec_Files.GetRowData(gridMTZ_Inst_Sec_Files.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuMTZ_Inst_Sec_FilesPASTE_Click()
On Error Resume Next
    If gridMTZ_Inst_Section.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridMTZ_Inst_Section.RowBookmark(gridMTZ_Inst_Section.RowIndex(gridMTZ_Inst_Section.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.MTZ_Inst_Sec_Files.Add()
    If GetFromBuffer(u) Then
      gridMTZ_Inst_Sec_Files.ItemCount = u.Parent.Count
    Else
      gu.MTZ_Inst_Sec_Files.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridMTZ_Inst_Sec_Files_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdMTZ_Inst_Sec_FilesCfg_Click
        End If
    End If
End Sub

Private Sub gridMTZ_Inst_Sec_Files_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupMTZ_Inst_Sec_Files
End If
End Sub
Private Sub mnuMTZ_Inst_Sec_FilesAdd_click()
   menuActionMTZ_Inst_Sec_Files = "ADD"
   menuTimerMTZ_Inst_Sec_Files.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_Sec_FilesEdit_click()
   menuActionMTZ_Inst_Sec_Files = "EDIT"
   menuTimerMTZ_Inst_Sec_Files.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_Sec_FilesDelete_click()
   menuActionMTZ_Inst_Sec_Files = "DEL"
   menuTimerMTZ_Inst_Sec_Files.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_Sec_FilesOpen_click()
   menuActionMTZ_Inst_Sec_Files = "RUN"
   menuTimerMTZ_Inst_Sec_Files.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_Sec_FilesRef_click()
   menuActionMTZ_Inst_Sec_Files = "REF"
   menuTimerMTZ_Inst_Sec_Files.Enabled = True
End Sub
  Private Sub mnuMTZ_Inst_Sec_FilesCOPY_Click()
    On Error Resume Next
    If gridMTZ_Inst_Sec_Files.ItemCount = 0 Then Exit Sub
    If gridMTZ_Inst_Sec_Files.Row > 0 Then
     If gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridMTZ_Inst_Sec_Files.RowBookmark(gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuMTZ_Inst_Sec_FilesCUT_Click()
    On Error Resume Next
    If gridMTZ_Inst_Sec_Files.ItemCount = 0 Then Exit Sub
    If gridMTZ_Inst_Sec_Files.Row > 0 Then
     If gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridMTZ_Inst_Sec_Files.RowBookmark(gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridMTZ_Inst_Sec_Files.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuMTZ_Inst_Sec_FilesCHANGE_Click()
  On Error Resume Next
  If gridMTZ_Inst_Sec_Files.ItemCount = 0 Then Exit Sub
  If gridMTZ_Inst_Sec_Files.Row > 0 Then
   If gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridMTZ_Inst_Sec_Files.RowBookmark(gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridMTZ_Inst_Sec_Files.ItemCount = u.Parent.Count
      gridMTZ_Inst_Sec_Files.RefreshRowIndex gridMTZ_Inst_Sec_Files.RowIndex(gridMTZ_Inst_Sec_Files.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuMTZ_Inst_Sec_FilesCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuMTZ_Inst_Sec_FilesPrn_click()
   menuActionMTZ_Inst_Sec_Files = "PRN"
   menuTimerMTZ_Inst_Sec_Files.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_Sec_FilesCfg_click()
   menuActionMTZ_Inst_Sec_Files = "CFG"
   menuTimerMTZ_Inst_Sec_Files.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_Sec_FilesFind_click()
   menuActionMTZ_Inst_Sec_Files = "FND"
   menuTimerMTZ_Inst_Sec_Files.Enabled = True
End Sub
Private Sub mnuMTZ_Inst_Sec_FilesAcc_click()
   menuActionMTZ_Inst_Sec_Files = "ACC"
   menuTimerMTZ_Inst_Sec_Files.Enabled = True
End Sub
Private Sub menuTimerMTZ_Inst_Sec_Files_timer()
   menuTimerMTZ_Inst_Sec_Files.Enabled = False
   If menuActionMTZ_Inst_Sec_Files = "ADD" Then cmdMTZ_Inst_Sec_FilesAdd_Click
   If menuActionMTZ_Inst_Sec_Files = "EDIT" Then cmdMTZ_Inst_Sec_FilesEdit_Click
   If menuActionMTZ_Inst_Sec_Files = "DEL" Then cmdMTZ_Inst_Sec_FilesDel_Click
   If menuActionMTZ_Inst_Sec_Files = "RUN" Then cmdMTZ_Inst_Sec_FilesRun_Click
   If menuActionMTZ_Inst_Sec_Files = "REF" Then cmdMTZ_Inst_Sec_FilesRef_Click
   If menuActionMTZ_Inst_Sec_Files = "PRN" Then cmdMTZ_Inst_Sec_FilesPrn_Click
   If menuActionMTZ_Inst_Sec_Files = "CFG" Then cmdMTZ_Inst_Sec_FilesCfg_Click
   If menuActionMTZ_Inst_Sec_Files = "FND" Then cmdMTZ_Inst_Sec_FilesFnd_Click
   If menuActionMTZ_Inst_Sec_Files = "ACC" Then cmdMTZ_Inst_Sec_FilesAcc_Click
   menuActionMTZ_Inst_Sec_Files = ""
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
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdMTZ_Inst_SectionAdd, cmdMTZ_Inst_SectionAdd.Tag
  LoadBtnPictures cmdMTZ_Inst_SectionEdit, cmdMTZ_Inst_SectionEdit.Tag
  LoadBtnPictures cmdMTZ_Inst_SectionDel, cmdMTZ_Inst_SectionDel.Tag
  LoadBtnPictures cmdMTZ_Inst_SectionRef, cmdMTZ_Inst_SectionRef.Tag
  LoadBtnPictures cmdMTZ_Inst_SectionPrn, cmdMTZ_Inst_SectionPrn.Tag
  LoadBtnPictures cmdMTZ_Inst_SectionFnd, cmdMTZ_Inst_SectionFnd.Tag
  LoadBtnPictures cmdMTZ_Inst_SectionRun, cmdMTZ_Inst_SectionRun.Tag
  LoadBtnPictures cmdMTZ_Inst_SectionAcc, cmdMTZ_Inst_SectionAcc.Tag
  LoadBtnPictures cmdMTZ_Inst_SectionCfg, cmdMTZ_Inst_SectionCfg.Tag
  item.MTZ_Inst_Section.PrepareGrid gridMTZ_Inst_Section
  LoadGridLayout gridMTZ_Inst_Section
  Set fndMTZ_Inst_Section = Nothing
  On Error Resume Next
  Set fndMTZ_Inst_Section = CreateObject("MTZ_JSetup.GridFinder")
  fndMTZ_Inst_Section.Init gridMTZ_Inst_Section
  LoadBtnPictures cmdMTZ_Inst_Sec_FilesAdd, cmdMTZ_Inst_Sec_FilesAdd.Tag
  LoadBtnPictures cmdMTZ_Inst_Sec_FilesEdit, cmdMTZ_Inst_Sec_FilesEdit.Tag
  LoadBtnPictures cmdMTZ_Inst_Sec_FilesDel, cmdMTZ_Inst_Sec_FilesDel.Tag
  LoadBtnPictures cmdMTZ_Inst_Sec_FilesRef, cmdMTZ_Inst_Sec_FilesRef.Tag
  LoadBtnPictures cmdMTZ_Inst_Sec_FilesPrn, cmdMTZ_Inst_Sec_FilesPrn.Tag
  LoadBtnPictures cmdMTZ_Inst_Sec_FilesFnd, cmdMTZ_Inst_Sec_FilesFnd.Tag
  LoadBtnPictures cmdMTZ_Inst_Sec_FilesCfg, cmdMTZ_Inst_Sec_FilesCfg.Tag
  LoadBtnPictures cmdMTZ_Inst_Sec_FilesRun, cmdMTZ_Inst_Sec_FilesRun.Tag
  LoadBtnPictures cmdMTZ_Inst_Sec_FilesAcc, cmdMTZ_Inst_Sec_FilesAcc.Tag
  gridMTZ_Inst_Sec_Files.Columns.Clear
  gridMTZ_Inst_Sec_Files.ItemCount = 0
  cmdMTZ_Inst_Sec_FilesRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlMTZ_Inst_Section.RestorePosition
  gridMTZ_Inst_Section_RowColChange gridMTZ_Inst_Section.Row, -1
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
  Set item = aItem
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
  pnlMTZ_Inst_Section.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set item = Nothing
  Set fndMTZ_Inst_Section = Nothing
  Set fndMTZ_Inst_Sec_Files = Nothing
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



'Создание номенклатуры по шаблону
'{B91ABF3A-31F8-4A82-8D41-EF463DBA32D0}
Private Sub Run_SSCreateNomen(Name As Variant, Optional RowItem As Object)
On Error Resume Next

'pointCreateLine
End Sub





