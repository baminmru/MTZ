VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWFDic_func_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFDic_presets 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerWFDic_func 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlWFDic_func 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdWFDic_presetsFnd 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDic_presetsPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   13
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDic_presetsRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDic_presetsDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   11
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDic_presetsEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDic_presetsAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridWFDic_presets 
         Height          =   480
         Left            =   3900
         TabIndex        =   8
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
         Column(1)       =   "vpnWFDic_func_.ctx":0000
         Column(2)       =   "vpnWFDic_func_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFDic_func_.ctx":016C
         FormatStyle(2)  =   "vpnWFDic_func_.ctx":02C8
         FormatStyle(3)  =   "vpnWFDic_func_.ctx":0378
         FormatStyle(4)  =   "vpnWFDic_func_.ctx":042C
         FormatStyle(5)  =   "vpnWFDic_func_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWFDic_func_.ctx":05BC
      End
      Begin VB.CommandButton cmdWFDic_funcFnd 
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
      Begin VB.CommandButton cmdWFDic_funcPrn 
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
      Begin VB.CommandButton cmdWFDic_funcRef 
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
      Begin VB.CommandButton cmdWFDic_funcDel 
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
      Begin VB.CommandButton cmdWFDic_funcEdit 
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
      Begin VB.CommandButton cmdWFDic_funcAdd 
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
      Begin GridEX20.GridEX gridWFDic_func 
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
         Column(1)       =   "vpnWFDic_func_.ctx":0794
         Column(2)       =   "vpnWFDic_func_.ctx":085C
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWFDic_func_.ctx":0900
         FormatStyle(2)  =   "vpnWFDic_func_.ctx":0A5C
         FormatStyle(3)  =   "vpnWFDic_func_.ctx":0B0C
         FormatStyle(4)  =   "vpnWFDic_func_.ctx":0BC0
         FormatStyle(5)  =   "vpnWFDic_func_.ctx":0C98
         ImageCount      =   0
         PrinterProperties=   "vpnWFDic_func_.ctx":0D50
      End
   End
   Begin VB.Menu mnuPopupWFDic_func 
      Caption         =   "Меню для Типы функций"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDic_funcAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDic_funcEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDic_funcDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDic_funcOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDic_funcRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDic_funcS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDic_funcBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDic_funcCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDic_funcCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDic_funcPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDic_funcCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDic_funcCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDic_funcPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDic_funcCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDic_funcFind 
         Caption         =   "Поиск"
      End
   End
   Begin VB.Menu mnuPopupWFDic_presets 
      Caption         =   "Меню для Значения атрибутов по умолчанию"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDic_presetsAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDic_presetsEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDic_presetsDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDic_presetsOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDic_presetsRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDic_presetsS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDic_presetsBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDic_presetsCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDic_presetsCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDic_presetsPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDic_presetsCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDic_presetsCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDic_presetsPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDic_presetsCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDic_presetsFind 
         Caption         =   "Поиск"
      End
   End
End
Attribute VB_Name = "vpnWFDic_func_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFDic_func As Object
Private menuActionWFDic_func As String
Private fndWFDic_presets As Object
Private menuActionWFDic_presets As String





Private Sub pnlWFDic_func_PositionChanged()
  pnlWFDic_func.SavePosition
End Sub
'Hidden GRID Setup...
Private Sub gridWFDic_func_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFDic_funcCfg_Click
        End If
    End If
End Sub

Private Sub gridWFDic_func_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFDic_func
End If
End Sub
Private Sub mnuWFDic_funcAdd_click()
   menuActionWFDic_func = "ADD"
   menuTimerWFDic_func.Enabled = True
End Sub
Private Sub mnuWFDic_funcEdit_click()
   menuActionWFDic_func = "EDIT"
   menuTimerWFDic_func.Enabled = True
End Sub
Private Sub mnuWFDic_funcDelete_click()
   menuActionWFDic_func = "DEL"
   menuTimerWFDic_func.Enabled = True
End Sub
Private Sub mnuWFDic_funcOpen_click()
   menuActionWFDic_func = "RUN"
   menuTimerWFDic_func.Enabled = True
End Sub
Private Sub mnuWFDic_funcRef_click()
   menuActionWFDic_func = "REF"
   menuTimerWFDic_func.Enabled = True
End Sub
  Private Sub mnuWFDic_funcCOPY_Click()
    On Error Resume Next
    If gridWFDic_func.ItemCount = 0 Then Exit Sub
    If gridWFDic_func.Row > 0 Then
     If gridWFDic_func.RowIndex(gridWFDic_func.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDic_funcCUT_Click()
    On Error Resume Next
    If gridWFDic_func.ItemCount = 0 Then Exit Sub
    If gridWFDic_func.Row > 0 Then
     If gridWFDic_func.RowIndex(gridWFDic_func.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDic_func.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDic_funcCHANGE_Click()
  On Error Resume Next
  If gridWFDic_func.ItemCount = 0 Then Exit Sub
  If gridWFDic_func.Row > 0 Then
   If gridWFDic_func.RowIndex(gridWFDic_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDic_func.ItemCount = u.Parent.Count
      gridWFDic_func.RefreshRowIndex gridWFDic_func.RowIndex(gridWFDic_func.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDic_funcCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDic_funcPrn_click()
   menuActionWFDic_func = "PRN"
   menuTimerWFDic_func.Enabled = True
End Sub
Private Sub mnuWFDic_funcCfg_click()
   menuActionWFDic_func = "CFG"
   menuTimerWFDic_func.Enabled = True
End Sub
Private Sub mnuWFDic_funcFind_click()
   menuActionWFDic_func = "FND"
   menuTimerWFDic_func.Enabled = True
End Sub
Private Sub mnuWFDic_funcAcc_click()
   menuActionWFDic_func = "ACC"
   menuTimerWFDic_func.Enabled = True
End Sub
Private Sub menuTimerWFDic_func_timer()
   menuTimerWFDic_func.Enabled = False
   If menuActionWFDic_func = "ADD" Then cmdWFDic_funcAdd_Click
   If menuActionWFDic_func = "EDIT" Then cmdWFDic_funcEdit_Click
   If menuActionWFDic_func = "DEL" Then cmdWFDic_funcDel_Click
   If menuActionWFDic_func = "RUN" Then cmdWFDic_funcRun_Click
   If menuActionWFDic_func = "REF" Then cmdWFDic_funcRef_Click
   If menuActionWFDic_func = "PRN" Then cmdWFDic_funcPrn_Click
   If menuActionWFDic_func = "CFG" Then cmdWFDic_funcCfg_Click
   If menuActionWFDic_func = "FND" Then cmdWFDic_funcFnd_Click
   If menuActionWFDic_func = "ACC" Then cmdWFDic_funcAcc_Click
   menuActionWFDic_func = ""
End Sub
Private Sub cmdWFDic_funcCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDic_func, "gridWFDic_func"
Set jset = Nothing
End Sub

Private Sub cmdWFDic_funcPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDic_func, "Типы функций"
Set jset = Nothing
End Sub

Private Sub cmdWFDic_funcRef_Click()
  On Error Resume Next
  Item.WFDic_func.Refresh
  gridWFDic_func.ItemCount = Item.WFDic_func.Count
  gridWFDic_func.Refetch
  gridWFDic_func.Refresh
End Sub
Private Sub cmdWFDic_funcAcc_Click()
On Error Resume Next
If gridWFDic_func.ItemCount = 0 Then Exit Sub
If gridWFDic_func.Row > 0 Then
 If gridWFDic_func.RowIndex(gridWFDic_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDic_funcEdit_Click()
  On Error Resume Next
If gridWFDic_func.ItemCount = 0 Then Exit Sub
If gridWFDic_func.Row > 0 Then
 If gridWFDic_func.RowIndex(gridWFDic_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFDic_func_.Item = u
again:     frmWFDic_func_.NotFirstTime = False
    frmWFDic_func_.OnInit
    frmWFDic_func_.Show vbModal
    If frmWFDic_func_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDic_func.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFDic_funcDel_Click()
  On Error Resume Next
  gridWFDic_func.Delete
End Sub
Private Sub cmdWFDic_funcAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFDic_func.Add()

      Set frmWFDic_func_.Item = u
again:       frmWFDic_func_.NotFirstTime = False
      frmWFDic_func_.OnInit
      frmWFDic_func_.Show vbModal
      If frmWFDic_func_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFDic_func.ItemCount = Item.WFDic_func.Count
        gridWFDic_func.Refresh
        gridWFDic_func.RefreshGroups
        gridWFDic_func.RefreshSort
        gridWFDic_func.MoveToBookmark u.ID & "WFDic_func"
      Else
        Item.WFDic_func.Delete u.ID
        Item.WFDic_func.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFDic_funcFnd_Click()
  On Error Resume Next
  fndWFDic_func.ShowForm
End Sub
Private Sub cmdWFDic_funcRun_Click()
  On Error Resume Next
  gridWFDic_func_DblClick
End Sub
Private Sub gridWFDic_func_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.WFDic_func.LoadRow gridWFDic_func, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFDic_func_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFDic_func.ItemCount = 0 Then Exit Sub
  Dim u As Object
  On Error Resume Next
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
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
Private Sub gridWFDic_func_DblClick()
  cmdWFDic_funcEdit_Click
End Sub
Private Sub gridWFDic_func_KeyPress(KeyAscii As Integer)
  If gridWFDic_func.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDic_func.FindOnPress KeyAscii
End Sub

Private Sub pnlWFDic_func_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridWFDic_func.Left = Left
  gridWFDic_func.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWFDic_func.Width = Width
  gridWFDic_func.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWFDic_funcAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_funcEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_funcDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_funcRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_funcPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_funcFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_funcAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWFDic_funcEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWFDic_funcDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWFDic_funcRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWFDic_funcPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWFDic_funcFnd.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuWFDic_funcPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFDic_func.Add()
    If GetFromBuffer(u) Then
      gridWFDic_func.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdWFDic_presetsCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDic_presets, "gridWFDic_presets"
Set jset = Nothing
End Sub

Private Sub cmdWFDic_presetsPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDic_presets, "Значения атрибутов по умолчанию"
Set jset = Nothing
End Sub

Private Sub cmdWFDic_presetsAcc_Click()
On Error Resume Next
If gridWFDic_presets.ItemCount = 0 Then Exit Sub
If gridWFDic_presets.Row > 0 Then
 If gridWFDic_presets.RowIndex(gridWFDic_presets.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDic_presets.RowBookmark(gridWFDic_presets.RowIndex(gridWFDic_presets.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDic_presetsFnd_Click()
  On Error Resume Next
  fndWFDic_presets.ShowForm
End Sub
Private Sub cmdWFDic_presetsRun_Click()
  On Error Resume Next
  gridWFDic_presets_DblClick
End Sub
Private Sub pnlWFDic_func_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridWFDic_presets.Left = Left
  gridWFDic_presets.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWFDic_presets.Width = Width
  gridWFDic_presets.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWFDic_presetsAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_presetsEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_presetsDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_presetsRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_presetsPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_presetsFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_presetsAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWFDic_presetsEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWFDic_presetsDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWFDic_presetsRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWFDic_presetsPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWFDic_presetsFnd.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdWFDic_presetsRef_Click()
  On Error Resume Next
If gridWFDic_func.ItemCount = 0 Then Exit Sub
If gridWFDic_func.Row > 0 Then
 If gridWFDic_func.RowIndex(gridWFDic_func.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFDic_presets.Refresh
   gridWFDic_presets.ItemCount = gu.WFDic_presets.Count
   gridWFDic_presets.Refetch
   gridWFDic_presets.Refresh
 Else
  gridWFDic_presets.Columns.Clear
  gridWFDic_presets.ItemCount = 0
 End If
Else
 gridWFDic_presets.Columns.Clear
 gridWFDic_presets.ItemCount = 0
End If
End Sub
Private Sub cmdWFDic_presetsEdit_Click()
    If gridWFDic_presets.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWFDic_presets.RowBookmark(gridWFDic_presets.RowIndex(gridWFDic_presets.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmWFDic_presets_.Item = u
again:     frmWFDic_presets_.NotFirstTime = False
    frmWFDic_presets_.OnInit
    frmWFDic_presets_.Show vbModal
    If frmWFDic_presets_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDic_presets.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdWFDic_presetsDel_Click()
  On Error Resume Next
  gridWFDic_presets.Delete
End Sub
Private Sub cmdWFDic_presetsAdd_Click()
  On Error Resume Next
    Dim gu As Object
    Dim u As Object
If gridWFDic_func.ItemCount = 0 Then Exit Sub
    Dim bm
    bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set u = gu.WFDic_presets.Add()

      Set frmWFDic_presets_.Item = u
again:       frmWFDic_presets_.NotFirstTime = False
      frmWFDic_presets_.OnInit
      frmWFDic_presets_.Show vbModal
      If frmWFDic_presets_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFDic_presets.ItemCount = gu.WFDic_presets.Count
        gridWFDic_presets.Refresh
        gridWFDic_presets.RefreshGroups
        gridWFDic_presets.RefreshSort
        gridWFDic_presets.MoveToBookmark u.ID & "WFDic_presets"
      Else
        gu.WFDic_presets.Delete u.ID
        gu.WFDic_presets.Remove u.ID
      End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridWFDic_func_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridWFDic_func.ItemCount = 0 Then
  gridWFDic_presets.ItemCount = 0
  Exit Sub
End If
If gridWFDic_func.Row > 0 Then
  If LastRow <> gridWFDic_func.Row And LastRow > 0 Then
    gridWFDic_func.GetRowData(LastRow).RowStyle = "Default"
    gridWFDic_func.GetRowData(gridWFDic_func.Row).RowStyle = "SelectedRow"
  End If
 If gridWFDic_func.RowIndex(gridWFDic_func.Row) > 0 Then
  If LastRow <> gridWFDic_func.Row Or gridWFDic_presets.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFDic_presets.PrepareGrid gridWFDic_presets
  gridWFDic_presets.ItemCount = 0
    LoadGridLayout gridWFDic_presets
    Set fndWFDic_presets = Nothing
    Set fndWFDic_presets = CreateObject("MTZ_JSetup.GridFinder")
    fndWFDic_presets.Init gridWFDic_presets
  gridWFDic_presets.ItemCount = gu.WFDic_presets.Count
  End If
 End If
End If
End Sub
Private Sub gridWFDic_presets_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
    If gridWFDic_func.ItemCount = 0 Then Exit Sub
    If gridWFDic_presets.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFDic_presets.LoadRow gridWFDic_presets, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridWFDic_presets_KeyPress(KeyAscii As Integer)
  If gridWFDic_presets.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDic_presets.FindOnPress KeyAscii
End Sub

Private Sub gridWFDic_presets_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridWFDic_presets.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWFDic_presets.RowBookmark(gridWFDic_presets.RowIndex(gridWFDic_presets.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    If Not u Is Nothing Then
      On Error Resume Next
      If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
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
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub gridWFDic_presets_DblClick()
    cmdWFDic_presetsEdit_Click
End Sub
Private Sub gridWFDic_presets_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridWFDic_presets.ItemCount = 0 Then Exit Sub
 If gridWFDic_presets.Row > 0 Then
   If LastRow <> gridWFDic_presets.Row And LastRow > 0 Then
     gridWFDic_presets.GetRowData(LastRow).RowStyle = "Default"
     gridWFDic_presets.GetRowData(gridWFDic_presets.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuWFDic_presetsPASTE_Click()
On Error Resume Next
    If gridWFDic_func.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.WFDic_presets.Add()
    If GetFromBuffer(u) Then
      gridWFDic_presets.ItemCount = u.Parent.Count
    Else
      gu.WFDic_presets.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridWFDic_presets_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdWFDic_presetsCfg_Click
        End If
    End If
End Sub

Private Sub gridWFDic_presets_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupWFDic_presets
End If
End Sub
Private Sub mnuWFDic_presetsAdd_click()
   menuActionWFDic_presets = "ADD"
   menuTimerWFDic_presets.Enabled = True
End Sub
Private Sub mnuWFDic_presetsEdit_click()
   menuActionWFDic_presets = "EDIT"
   menuTimerWFDic_presets.Enabled = True
End Sub
Private Sub mnuWFDic_presetsDelete_click()
   menuActionWFDic_presets = "DEL"
   menuTimerWFDic_presets.Enabled = True
End Sub
Private Sub mnuWFDic_presetsOpen_click()
   menuActionWFDic_presets = "RUN"
   menuTimerWFDic_presets.Enabled = True
End Sub
Private Sub mnuWFDic_presetsRef_click()
   menuActionWFDic_presets = "REF"
   menuTimerWFDic_presets.Enabled = True
End Sub
  Private Sub mnuWFDic_presetsCOPY_Click()
    On Error Resume Next
    If gridWFDic_presets.ItemCount = 0 Then Exit Sub
    If gridWFDic_presets.Row > 0 Then
     If gridWFDic_presets.RowIndex(gridWFDic_presets.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDic_presets.RowBookmark(gridWFDic_presets.RowIndex(gridWFDic_presets.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDic_presetsCUT_Click()
    On Error Resume Next
    If gridWFDic_presets.ItemCount = 0 Then Exit Sub
    If gridWFDic_presets.Row > 0 Then
     If gridWFDic_presets.RowIndex(gridWFDic_presets.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDic_presets.RowBookmark(gridWFDic_presets.RowIndex(gridWFDic_presets.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDic_presets.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDic_presetsCHANGE_Click()
  On Error Resume Next
  If gridWFDic_presets.ItemCount = 0 Then Exit Sub
  If gridWFDic_presets.Row > 0 Then
   If gridWFDic_presets.RowIndex(gridWFDic_presets.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDic_presets.RowBookmark(gridWFDic_presets.RowIndex(gridWFDic_presets.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDic_presets.ItemCount = u.Parent.Count
      gridWFDic_presets.RefreshRowIndex gridWFDic_presets.RowIndex(gridWFDic_presets.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDic_presetsCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDic_presetsPrn_click()
   menuActionWFDic_presets = "PRN"
   menuTimerWFDic_presets.Enabled = True
End Sub
Private Sub mnuWFDic_presetsCfg_click()
   menuActionWFDic_presets = "CFG"
   menuTimerWFDic_presets.Enabled = True
End Sub
Private Sub mnuWFDic_presetsFind_click()
   menuActionWFDic_presets = "FND"
   menuTimerWFDic_presets.Enabled = True
End Sub
Private Sub mnuWFDic_presetsAcc_click()
   menuActionWFDic_presets = "ACC"
   menuTimerWFDic_presets.Enabled = True
End Sub
Private Sub menuTimerWFDic_presets_timer()
   menuTimerWFDic_presets.Enabled = False
   If menuActionWFDic_presets = "ADD" Then cmdWFDic_presetsAdd_Click
   If menuActionWFDic_presets = "EDIT" Then cmdWFDic_presetsEdit_Click
   If menuActionWFDic_presets = "DEL" Then cmdWFDic_presetsDel_Click
   If menuActionWFDic_presets = "RUN" Then cmdWFDic_presetsRun_Click
   If menuActionWFDic_presets = "REF" Then cmdWFDic_presetsRef_Click
   If menuActionWFDic_presets = "PRN" Then cmdWFDic_presetsPrn_Click
   If menuActionWFDic_presets = "CFG" Then cmdWFDic_presetsCfg_Click
   If menuActionWFDic_presets = "FND" Then cmdWFDic_presetsFnd_Click
   If menuActionWFDic_presets = "ACC" Then cmdWFDic_presetsAcc_Click
   menuActionWFDic_presets = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFDic_funcAdd, cmdWFDic_funcAdd.Tag
  LoadBtnPictures cmdWFDic_funcEdit, cmdWFDic_funcEdit.Tag
  LoadBtnPictures cmdWFDic_funcDel, cmdWFDic_funcDel.Tag
  LoadBtnPictures cmdWFDic_funcRef, cmdWFDic_funcRef.Tag
  LoadBtnPictures cmdWFDic_funcPrn, cmdWFDic_funcPrn.Tag
  LoadBtnPictures cmdWFDic_funcFnd, cmdWFDic_funcFnd.Tag
  Item.WFDic_func.PrepareGrid gridWFDic_func
  LoadGridLayout gridWFDic_func
  Set fndWFDic_func = Nothing
  On Error Resume Next
  Set fndWFDic_func = CreateObject("MTZ_JSetup.GridFinder")
  fndWFDic_func.Init gridWFDic_func
  LoadBtnPictures cmdWFDic_presetsAdd, cmdWFDic_presetsAdd.Tag
  LoadBtnPictures cmdWFDic_presetsEdit, cmdWFDic_presetsEdit.Tag
  LoadBtnPictures cmdWFDic_presetsDel, cmdWFDic_presetsDel.Tag
  LoadBtnPictures cmdWFDic_presetsRef, cmdWFDic_presetsRef.Tag
  LoadBtnPictures cmdWFDic_presetsPrn, cmdWFDic_presetsPrn.Tag
  LoadBtnPictures cmdWFDic_presetsFnd, cmdWFDic_presetsFnd.Tag
  gridWFDic_presets.Columns.Clear
  gridWFDic_presets.ItemCount = 0
  cmdWFDic_presetsRef_Click
End Sub
Private Sub OnTabClick()

pnlWFDic_func.RestorePosition
  gridWFDic_func_RowColChange gridWFDic_func.Row, -1
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
  pnlWFDic_func.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndWFDic_func = Nothing
  Set fndWFDic_presets = Nothing
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

  RowItem.Person.Secure Item.SecureStyleid
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
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
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next
Item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





