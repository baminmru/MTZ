VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnROLES_DOC_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerROLES_DOC_STATE 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerROLES_DOC 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlROLES_DOC 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdROLES_DOC_STATEAcc 
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
      Begin MTZ_PANEL.DropButton cmdROLES_DOC_STATERun 
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
      Begin VB.CommandButton cmdROLES_DOC_STATEFnd 
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
      Begin VB.CommandButton cmdROLES_DOC_STATECfg 
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
      Begin VB.CommandButton cmdROLES_DOC_STATEPrn 
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
      Begin VB.CommandButton cmdROLES_DOC_STATERef 
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
      Begin VB.CommandButton cmdROLES_DOC_STATEDel 
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
      Begin VB.CommandButton cmdROLES_DOC_STATEEdit 
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
      Begin VB.CommandButton cmdROLES_DOC_STATEAdd 
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
      Begin GridEX20.GridEX gridROLES_DOC_STATE 
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
         Column(1)       =   "vpnROLES_DOC_.ctx":0000
         Column(2)       =   "vpnROLES_DOC_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnROLES_DOC_.ctx":016C
         FormatStyle(2)  =   "vpnROLES_DOC_.ctx":02C8
         FormatStyle(3)  =   "vpnROLES_DOC_.ctx":0378
         FormatStyle(4)  =   "vpnROLES_DOC_.ctx":042C
         FormatStyle(5)  =   "vpnROLES_DOC_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnROLES_DOC_.ctx":05BC
      End
      Begin VB.CommandButton cmdROLES_DOCAcc 
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
      Begin MTZ_PANEL.DropButton cmdROLES_DOCRun 
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
      Begin VB.CommandButton cmdROLES_DOCFnd 
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
      Begin VB.CommandButton cmdROLES_DOCCfg 
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
      Begin VB.CommandButton cmdROLES_DOCPrn 
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
      Begin VB.CommandButton cmdROLES_DOCRef 
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
      Begin VB.CommandButton cmdROLES_DOCDel 
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
      Begin VB.CommandButton cmdROLES_DOCEdit 
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
      Begin VB.CommandButton cmdROLES_DOCAdd 
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
      Begin GridEX20.GridEX gridROLES_DOC 
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
         Column(1)       =   "vpnROLES_DOC_.ctx":0794
         Column(2)       =   "vpnROLES_DOC_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnROLES_DOC_.ctx":0900
         FormatStyle(2)  =   "vpnROLES_DOC_.ctx":0A5C
         FormatStyle(3)  =   "vpnROLES_DOC_.ctx":0B0C
         FormatStyle(4)  =   "vpnROLES_DOC_.ctx":0BC0
         FormatStyle(5)  =   "vpnROLES_DOC_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnROLES_DOC_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupROLES_DOC 
      Caption         =   "Меню для Доступные документы"
      Visible         =   0   'False
      Begin VB.Menu mnuROLES_DOCAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuROLES_DOCEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuROLES_DOCDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuROLES_DOCOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuROLES_DOCRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuROLES_DOCS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuROLES_DOCBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuROLES_DOCCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuROLES_DOCCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuROLES_DOCPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuROLES_DOCCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuROLES_DOCCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuROLES_DOCPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuROLES_DOCCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuROLES_DOCFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuROLES_DOCAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupROLES_DOC_STATE 
      Caption         =   "Меню для Доступные состояния"
      Visible         =   0   'False
      Begin VB.Menu mnuROLES_DOC_STATEAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuROLES_DOC_STATEEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuROLES_DOC_STATEDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuROLES_DOC_STATEOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuROLES_DOC_STATERef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuROLES_DOC_STATES1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuROLES_DOC_STATEBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuROLES_DOC_STATECOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuROLES_DOC_STATECUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuROLES_DOC_STATEPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuROLES_DOC_STATECHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuROLES_DOC_STATECLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuROLES_DOC_STATEPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuROLES_DOC_STATECfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuROLES_DOC_STATEFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuROLES_DOC_STATEAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnROLES_DOC_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndROLES_DOC As Object
Private menuActionROLES_DOC As String
Private fndROLES_DOC_STATE As Object
Private menuActionROLES_DOC_STATE As String





Private Sub opROLES_DOC_OpenRef_(RowItem As Object)
With RowItem
Run_VBOpenRef StartMode:="", ID:=.The_Document.ID, RowItem:=RowItem
End With
End Sub
Private Sub pnlROLES_DOC_PositionChanged()
  pnlROLES_DOC.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridROLES_DOC_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdROLES_DOCCfg_Click
        End If
    End If
End Sub

Private Sub gridROLES_DOC_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupROLES_DOC
End If
End Sub
Private Sub mnuROLES_DOCAdd_click()
   menuActionROLES_DOC = "ADD"
   menuTimerROLES_DOC.Enabled = True
End Sub
Private Sub mnuROLES_DOCEdit_click()
   menuActionROLES_DOC = "EDIT"
   menuTimerROLES_DOC.Enabled = True
End Sub
Private Sub mnuROLES_DOCDelete_click()
   menuActionROLES_DOC = "DEL"
   menuTimerROLES_DOC.Enabled = True
End Sub
Private Sub mnuROLES_DOCOpen_click()
   menuActionROLES_DOC = "RUN"
   menuTimerROLES_DOC.Enabled = True
End Sub
Private Sub mnuROLES_DOCRef_click()
   menuActionROLES_DOC = "REF"
   menuTimerROLES_DOC.Enabled = True
End Sub
  Private Sub mnuROLES_DOCCOPY_Click()
    On Error Resume Next
    If gridROLES_DOC.ItemCount = 0 Then Exit Sub
    If gridROLES_DOC.Row > 0 Then
     If gridROLES_DOC.RowIndex(gridROLES_DOC.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuROLES_DOCCUT_Click()
    On Error Resume Next
    If gridROLES_DOC.ItemCount = 0 Then Exit Sub
    If gridROLES_DOC.Row > 0 Then
     If gridROLES_DOC.RowIndex(gridROLES_DOC.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridROLES_DOC.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuROLES_DOCCHANGE_Click()
  On Error Resume Next
  If gridROLES_DOC.ItemCount = 0 Then Exit Sub
  If gridROLES_DOC.Row > 0 Then
   If gridROLES_DOC.RowIndex(gridROLES_DOC.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridROLES_DOC.ItemCount = u.Parent.Count
      gridROLES_DOC.RefreshRowIndex gridROLES_DOC.RowIndex(gridROLES_DOC.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuROLES_DOCCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuROLES_DOCPrn_click()
   menuActionROLES_DOC = "PRN"
   menuTimerROLES_DOC.Enabled = True
End Sub
Private Sub mnuROLES_DOCCfg_click()
   menuActionROLES_DOC = "CFG"
   menuTimerROLES_DOC.Enabled = True
End Sub
Private Sub mnuROLES_DOCFind_click()
   menuActionROLES_DOC = "FND"
   menuTimerROLES_DOC.Enabled = True
End Sub
Private Sub mnuROLES_DOCAcc_click()
   menuActionROLES_DOC = "ACC"
   menuTimerROLES_DOC.Enabled = True
End Sub
Private Sub menuTimerROLES_DOC_timer()
   menuTimerROLES_DOC.Enabled = False
   If menuActionROLES_DOC = "ADD" Then cmdROLES_DOCAdd_Click
   If menuActionROLES_DOC = "EDIT" Then cmdROLES_DOCEdit_Click
   If menuActionROLES_DOC = "DEL" Then cmdROLES_DOCDel_Click
   If menuActionROLES_DOC = "RUN" Then cmdROLES_DOCRun_Click
   If menuActionROLES_DOC = "REF" Then cmdROLES_DOCRef_Click
   If menuActionROLES_DOC = "PRN" Then cmdROLES_DOCPrn_Click
   If menuActionROLES_DOC = "CFG" Then cmdROLES_DOCCfg_Click
   If menuActionROLES_DOC = "FND" Then cmdROLES_DOCFnd_Click
   If menuActionROLES_DOC = "ACC" Then cmdROLES_DOCAcc_Click
   menuActionROLES_DOC = ""
End Sub
Private Sub cmdROLES_DOCCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridROLES_DOC, "gridROLES_DOC"
Set jset = Nothing
End Sub

Private Sub cmdROLES_DOCPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridROLES_DOC, "Доступные документы"
Set jset = Nothing
End Sub

Private Sub cmdROLES_DOCRef_Click()
  On Error Resume Next
  Item.ROLES_DOC.Refresh
  gridROLES_DOC.ItemCount = Item.ROLES_DOC.Count
  gridROLES_DOC.Refetch
  gridROLES_DOC.Refresh
End Sub
Private Sub cmdROLES_DOCAcc_Click()
On Error Resume Next
If gridROLES_DOC.ItemCount = 0 Then Exit Sub
If gridROLES_DOC.Row > 0 Then
 If gridROLES_DOC.RowIndex(gridROLES_DOC.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdROLES_DOCEdit_Click()
  On Error Resume Next
If gridROLES_DOC.ItemCount = 0 Then Exit Sub
If gridROLES_DOC.Row > 0 Then
 If gridROLES_DOC.RowIndex(gridROLES_DOC.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmROLES_DOC_.Item = u
again:     frmROLES_DOC_.NotFirstTime = False
    frmROLES_DOC_.OnInit
    frmROLES_DOC_.Show vbModal
    If frmROLES_DOC_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridROLES_DOC.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdROLES_DOCDel_Click()
  On Error Resume Next
  gridROLES_DOC.Delete
End Sub
Private Sub cmdROLES_DOCAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.ROLES_DOC.Add()

      Set frmROLES_DOC_.Item = u
again:       frmROLES_DOC_.NotFirstTime = False
      frmROLES_DOC_.OnInit
      frmROLES_DOC_.Show vbModal
      If frmROLES_DOC_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridROLES_DOC.ItemCount = Item.ROLES_DOC.Count
        gridROLES_DOC.Refresh
        gridROLES_DOC.RefreshGroups
        gridROLES_DOC.RefreshSort
        gridROLES_DOC.MoveToBookmark u.ID & "ROLES_DOC"
      Else
        Item.ROLES_DOC.Delete u.ID
        Item.ROLES_DOC.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdROLES_DOCFnd_Click()
  On Error Resume Next
  fndROLES_DOC.ShowForm
End Sub
Private Sub cmdROLES_DOCRun_Click()
  On Error Resume Next
  gridROLES_DOC_DblClick
End Sub
Private Sub gridROLES_DOC_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.ROLES_DOC.LoadRow gridROLES_DOC, RowIndex, Bookmark, Values
End Sub
Private Sub gridROLES_DOC_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridROLES_DOC.ItemCount = 0 Then Exit Sub
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
Private Sub gridROLES_DOC_DblClick()
If gridROLES_DOC.ItemCount = 0 Then Exit Sub
If gridROLES_DOC.Row > 0 Then
  If gridROLES_DOC.RowIndex(gridROLES_DOC.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    On Error Resume Next
    If Not u Is Nothing Then
      opROLES_DOC_OpenRef_ u
    End If
     u.Refresh
  End If
End If
End Sub
Private Sub gridROLES_DOC_KeyPress(KeyAscii As Integer)
  If gridROLES_DOC.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndROLES_DOC.FindOnPress KeyAscii
End Sub

Private Sub pnlROLES_DOC_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridROLES_DOC.Left = Left
  gridROLES_DOC.Top = Top + 25 * Screen.TwipsPerPixelY
  gridROLES_DOC.Width = Width
  gridROLES_DOC.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdROLES_DOCAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOCEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOCDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOCRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOCPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOCCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOCFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOCRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOCAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOCAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdROLES_DOCEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdROLES_DOCDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdROLES_DOCRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdROLES_DOCPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdROLES_DOCCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdROLES_DOCFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdROLES_DOCRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdROLES_DOCAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuROLES_DOCPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.ROLES_DOC.Add()
    If GetFromBuffer(u) Then
      gridROLES_DOC.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdROLES_DOC_STATECfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridROLES_DOC_STATE, "gridROLES_DOC_STATE"
Set jset = Nothing
End Sub

Private Sub cmdROLES_DOC_STATEPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridROLES_DOC_STATE, "Доступные состояния"
Set jset = Nothing
End Sub

Private Sub cmdROLES_DOC_STATEAcc_Click()
On Error Resume Next
If gridROLES_DOC_STATE.ItemCount = 0 Then Exit Sub
If gridROLES_DOC_STATE.Row > 0 Then
 If gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridROLES_DOC_STATE.RowBookmark(gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdROLES_DOC_STATEFnd_Click()
  On Error Resume Next
  fndROLES_DOC_STATE.ShowForm
End Sub
Private Sub cmdROLES_DOC_STATERun_Click()
  On Error Resume Next
  gridROLES_DOC_STATE_DblClick
End Sub
Private Sub pnlROLES_DOC_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridROLES_DOC_STATE.Left = Left
  gridROLES_DOC_STATE.Top = Top + 25 * Screen.TwipsPerPixelY
  gridROLES_DOC_STATE.Width = Width
  gridROLES_DOC_STATE.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdROLES_DOC_STATEAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOC_STATEEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOC_STATEDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOC_STATERef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOC_STATEPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOC_STATECfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOC_STATEFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOC_STATERun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOC_STATEAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdROLES_DOC_STATEAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdROLES_DOC_STATEEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdROLES_DOC_STATEDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdROLES_DOC_STATERef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdROLES_DOC_STATEPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdROLES_DOC_STATECfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdROLES_DOC_STATEFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdROLES_DOC_STATERun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdROLES_DOC_STATEAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdROLES_DOC_STATERef_Click()
  On Error Resume Next
If gridROLES_DOC.ItemCount = 0 Then Exit Sub
If gridROLES_DOC.Row > 0 Then
 If gridROLES_DOC.RowIndex(gridROLES_DOC.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ROLES_DOC_STATE.Refresh
   gridROLES_DOC_STATE.ItemCount = gu.ROLES_DOC_STATE.Count
   gridROLES_DOC_STATE.Refetch
   gridROLES_DOC_STATE.Refresh
 Else
  gridROLES_DOC_STATE.Columns.Clear
  gridROLES_DOC_STATE.ItemCount = 0
 End If
Else
 gridROLES_DOC_STATE.Columns.Clear
 gridROLES_DOC_STATE.ItemCount = 0
End If
End Sub
Private Sub cmdROLES_DOC_STATEEdit_Click()
    If gridROLES_DOC_STATE.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridROLES_DOC_STATE.RowBookmark(gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmROLES_DOC_STATE_.Item = u
again:     frmROLES_DOC_STATE_.NotFirstTime = False
    frmROLES_DOC_STATE_.OnInit
    frmROLES_DOC_STATE_.Show vbModal
    If frmROLES_DOC_STATE_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridROLES_DOC_STATE.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdROLES_DOC_STATEDel_Click()
  On Error Resume Next
  gridROLES_DOC_STATE.Delete
End Sub
Private Sub cmdROLES_DOC_STATEAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridROLES_DOC.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.ROLES_DOC_STATE.Add()

      Set frmROLES_DOC_STATE_.Item = u
again:       frmROLES_DOC_STATE_.NotFirstTime = False
      frmROLES_DOC_STATE_.OnInit
      frmROLES_DOC_STATE_.Show vbModal
      If frmROLES_DOC_STATE_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridROLES_DOC_STATE.ItemCount = gu.ROLES_DOC_STATE.Count
        gridROLES_DOC_STATE.Refresh
        gridROLES_DOC_STATE.RefreshGroups
        gridROLES_DOC_STATE.RefreshSort
        gridROLES_DOC_STATE.MoveToBookmark u.ID & "ROLES_DOC_STATE"
      Else
        gu.ROLES_DOC_STATE.Delete u.ID
        gu.ROLES_DOC_STATE.Remove u.ID
      End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridROLES_DOC_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridROLES_DOC.ItemCount = 0 Then
  gridROLES_DOC_STATE.ItemCount = 0
  Exit Sub
End If
If gridROLES_DOC.Row > 0 Then
  If LastRow <> gridROLES_DOC.Row And LastRow > 0 Then
    gridROLES_DOC.GetRowData(LastRow).RowStyle = "Default"
    gridROLES_DOC.GetRowData(gridROLES_DOC.Row).RowStyle = "SelectedRow"
  End If
 If gridROLES_DOC.RowIndex(gridROLES_DOC.Row) > 0 Then
  If LastRow <> gridROLES_DOC.Row Or gridROLES_DOC_STATE.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ROLES_DOC_STATE.PrepareGrid gridROLES_DOC_STATE
  gridROLES_DOC_STATE.ItemCount = 0
    LoadGridLayout gridROLES_DOC_STATE
    Set fndROLES_DOC_STATE = Nothing
    Set fndROLES_DOC_STATE = CreateObject("MTZ_JSetup.GridFinder")
    fndROLES_DOC_STATE.Init gridROLES_DOC_STATE
  gridROLES_DOC_STATE.ItemCount = gu.ROLES_DOC_STATE.Count
  End If
 End If
End If
End Sub
Private Sub gridROLES_DOC_STATE_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridROLES_DOC.ItemCount = 0 Then Exit Sub
    If gridROLES_DOC_STATE.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.ROLES_DOC_STATE.LoadRow gridROLES_DOC_STATE, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridROLES_DOC_STATE_KeyPress(KeyAscii As Integer)
  If gridROLES_DOC_STATE.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndROLES_DOC_STATE.FindOnPress KeyAscii
End Sub

Private Sub gridROLES_DOC_STATE_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridROLES_DOC_STATE.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridROLES_DOC_STATE.RowBookmark(gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row))
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
Private Sub gridROLES_DOC_STATE_DblClick()
    cmdROLES_DOC_STATEEdit_Click
End Sub
Private Sub gridROLES_DOC_STATE_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridROLES_DOC_STATE.ItemCount = 0 Then Exit Sub
 If gridROLES_DOC_STATE.Row > 0 Then
   If LastRow <> gridROLES_DOC_STATE.Row And LastRow > 0 Then
     gridROLES_DOC_STATE.GetRowData(LastRow).RowStyle = "Default"
     gridROLES_DOC_STATE.GetRowData(gridROLES_DOC_STATE.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuROLES_DOC_STATEPASTE_Click()
On Error Resume Next
    If gridROLES_DOC.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridROLES_DOC.RowBookmark(gridROLES_DOC.RowIndex(gridROLES_DOC.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.ROLES_DOC_STATE.Add()
    If GetFromBuffer(u) Then
      gridROLES_DOC_STATE.ItemCount = u.Parent.Count
    Else
      gu.ROLES_DOC_STATE.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridROLES_DOC_STATE_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdROLES_DOC_STATECfg_Click
        End If
    End If
End Sub

Private Sub gridROLES_DOC_STATE_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupROLES_DOC_STATE
End If
End Sub
Private Sub mnuROLES_DOC_STATEAdd_click()
   menuActionROLES_DOC_STATE = "ADD"
   menuTimerROLES_DOC_STATE.Enabled = True
End Sub
Private Sub mnuROLES_DOC_STATEEdit_click()
   menuActionROLES_DOC_STATE = "EDIT"
   menuTimerROLES_DOC_STATE.Enabled = True
End Sub
Private Sub mnuROLES_DOC_STATEDelete_click()
   menuActionROLES_DOC_STATE = "DEL"
   menuTimerROLES_DOC_STATE.Enabled = True
End Sub
Private Sub mnuROLES_DOC_STATEOpen_click()
   menuActionROLES_DOC_STATE = "RUN"
   menuTimerROLES_DOC_STATE.Enabled = True
End Sub
Private Sub mnuROLES_DOC_STATERef_click()
   menuActionROLES_DOC_STATE = "REF"
   menuTimerROLES_DOC_STATE.Enabled = True
End Sub
  Private Sub mnuROLES_DOC_STATECOPY_Click()
    On Error Resume Next
    If gridROLES_DOC_STATE.ItemCount = 0 Then Exit Sub
    If gridROLES_DOC_STATE.Row > 0 Then
     If gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridROLES_DOC_STATE.RowBookmark(gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuROLES_DOC_STATECUT_Click()
    On Error Resume Next
    If gridROLES_DOC_STATE.ItemCount = 0 Then Exit Sub
    If gridROLES_DOC_STATE.Row > 0 Then
     If gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridROLES_DOC_STATE.RowBookmark(gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridROLES_DOC_STATE.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuROLES_DOC_STATECHANGE_Click()
  On Error Resume Next
  If gridROLES_DOC_STATE.ItemCount = 0 Then Exit Sub
  If gridROLES_DOC_STATE.Row > 0 Then
   If gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridROLES_DOC_STATE.RowBookmark(gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridROLES_DOC_STATE.ItemCount = u.Parent.Count
      gridROLES_DOC_STATE.RefreshRowIndex gridROLES_DOC_STATE.RowIndex(gridROLES_DOC_STATE.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuROLES_DOC_STATECLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuROLES_DOC_STATEPrn_click()
   menuActionROLES_DOC_STATE = "PRN"
   menuTimerROLES_DOC_STATE.Enabled = True
End Sub
Private Sub mnuROLES_DOC_STATECfg_click()
   menuActionROLES_DOC_STATE = "CFG"
   menuTimerROLES_DOC_STATE.Enabled = True
End Sub
Private Sub mnuROLES_DOC_STATEFind_click()
   menuActionROLES_DOC_STATE = "FND"
   menuTimerROLES_DOC_STATE.Enabled = True
End Sub
Private Sub mnuROLES_DOC_STATEAcc_click()
   menuActionROLES_DOC_STATE = "ACC"
   menuTimerROLES_DOC_STATE.Enabled = True
End Sub
Private Sub menuTimerROLES_DOC_STATE_timer()
   menuTimerROLES_DOC_STATE.Enabled = False
   If menuActionROLES_DOC_STATE = "ADD" Then cmdROLES_DOC_STATEAdd_Click
   If menuActionROLES_DOC_STATE = "EDIT" Then cmdROLES_DOC_STATEEdit_Click
   If menuActionROLES_DOC_STATE = "DEL" Then cmdROLES_DOC_STATEDel_Click
   If menuActionROLES_DOC_STATE = "RUN" Then cmdROLES_DOC_STATERun_Click
   If menuActionROLES_DOC_STATE = "REF" Then cmdROLES_DOC_STATERef_Click
   If menuActionROLES_DOC_STATE = "PRN" Then cmdROLES_DOC_STATEPrn_Click
   If menuActionROLES_DOC_STATE = "CFG" Then cmdROLES_DOC_STATECfg_Click
   If menuActionROLES_DOC_STATE = "FND" Then cmdROLES_DOC_STATEFnd_Click
   If menuActionROLES_DOC_STATE = "ACC" Then cmdROLES_DOC_STATEAcc_Click
   menuActionROLES_DOC_STATE = ""
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

  LoadBtnPictures cmdROLES_DOCAdd, cmdROLES_DOCAdd.Tag
  LoadBtnPictures cmdROLES_DOCEdit, cmdROLES_DOCEdit.Tag
  LoadBtnPictures cmdROLES_DOCDel, cmdROLES_DOCDel.Tag
  LoadBtnPictures cmdROLES_DOCRef, cmdROLES_DOCRef.Tag
  LoadBtnPictures cmdROLES_DOCPrn, cmdROLES_DOCPrn.Tag
  LoadBtnPictures cmdROLES_DOCFnd, cmdROLES_DOCFnd.Tag
  LoadBtnPictures cmdROLES_DOCRun, cmdROLES_DOCRun.Tag
  LoadBtnPictures cmdROLES_DOCAcc, cmdROLES_DOCAcc.Tag
  LoadBtnPictures cmdROLES_DOCCfg, cmdROLES_DOCCfg.Tag
  Item.ROLES_DOC.PrepareGrid gridROLES_DOC
  LoadGridLayout gridROLES_DOC
  Set fndROLES_DOC = Nothing
  On Error Resume Next
  Set fndROLES_DOC = CreateObject("MTZ_JSetup.GridFinder")
  fndROLES_DOC.Init gridROLES_DOC
  LoadBtnPictures cmdROLES_DOC_STATEAdd, cmdROLES_DOC_STATEAdd.Tag
  LoadBtnPictures cmdROLES_DOC_STATEEdit, cmdROLES_DOC_STATEEdit.Tag
  LoadBtnPictures cmdROLES_DOC_STATEDel, cmdROLES_DOC_STATEDel.Tag
  LoadBtnPictures cmdROLES_DOC_STATERef, cmdROLES_DOC_STATERef.Tag
  LoadBtnPictures cmdROLES_DOC_STATEPrn, cmdROLES_DOC_STATEPrn.Tag
  LoadBtnPictures cmdROLES_DOC_STATEFnd, cmdROLES_DOC_STATEFnd.Tag
  LoadBtnPictures cmdROLES_DOC_STATECfg, cmdROLES_DOC_STATECfg.Tag
  LoadBtnPictures cmdROLES_DOC_STATERun, cmdROLES_DOC_STATERun.Tag
  LoadBtnPictures cmdROLES_DOC_STATEAcc, cmdROLES_DOC_STATEAcc.Tag
  gridROLES_DOC_STATE.Columns.Clear
  gridROLES_DOC_STATE.ItemCount = 0
  cmdROLES_DOC_STATERef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlROLES_DOC.RestorePosition
  gridROLES_DOC_RowColChange gridROLES_DOC.Row, -1
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
  pnlROLES_DOC.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndROLES_DOC = Nothing
  Set fndROLES_DOC_STATE = Nothing
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





