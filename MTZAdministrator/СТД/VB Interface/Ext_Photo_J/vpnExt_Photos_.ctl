VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnExt_Photos_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerExt_Photo_Call 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlExt_Photos 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin VB.CommandButton cmdExt_Photo_CallAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdExt_Photo_CallRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   13
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdExt_Photo_CallFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdExt_Photo_CallCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   11
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdExt_Photo_CallPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdExt_Photo_CallRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdExt_Photo_CallDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   8
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdExt_Photo_CallEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdExt_Photo_CallAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridExt_Photo_Call 
         Height          =   480
         Left            =   3900
         TabIndex        =   5
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
         Column(1)       =   "vpnExt_Photos_.ctx":0000
         Column(2)       =   "vpnExt_Photos_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnExt_Photos_.ctx":016C
         FormatStyle(2)  =   "vpnExt_Photos_.ctx":02C8
         FormatStyle(3)  =   "vpnExt_Photos_.ctx":0378
         FormatStyle(4)  =   "vpnExt_Photos_.ctx":042C
         FormatStyle(5)  =   "vpnExt_Photos_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnExt_Photos_.ctx":05BC
      End
      Begin VB.CommandButton cmdExt_PhotosCfg 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdExt_PhotosRef 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdExt_PhotosSave 
         Enabled         =   0   'False
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "SAVE.ico"
         ToolTipText     =   "Сохранить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin Ext_Photo_JGUI.Ext_Photos editExt_Photos 
         Height          =   480
         Left            =   3900
         TabIndex        =   1
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
   End
   Begin VB.Menu mnuPopupExt_Photo_Call 
      Caption         =   "Меню для Вызов изображения"
      Visible         =   0   'False
      Begin VB.Menu mnuExt_Photo_CallAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuExt_Photo_CallEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuExt_Photo_CallDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuExt_Photo_CallOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuExt_Photo_CallRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuExt_Photo_CallS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExt_Photo_CallBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuExt_Photo_CallCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuExt_Photo_CallCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuExt_Photo_CallPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuExt_Photo_CallCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuExt_Photo_CallCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuExt_Photo_CallPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuExt_Photo_CallCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuExt_Photo_CallFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuExt_Photo_CallAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnExt_Photos_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела
Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndExt_Photo_Call As Object
Private menuActionExt_Photo_Call As String





Private Sub opExt_Photos_Ext_Photo_J_SetName_(RowItem As Object)
With RowItem
Run_VBUpdateItemName Name:=.brief, RowItem:=RowItem
End With
End Sub
Private Sub pnlExt_Photos_PositionChanged()
  pnlExt_Photos.SavePosition
End Sub
Private Sub cmdExt_PhotosRef_Click()
  On Error Resume Next
  item.Ext_Photos.Refresh
  cmdExt_PhotosAdd_Click
End Sub
Private Sub cmdExt_PhotosAdd_Click()
  On Error Resume Next
 If item.Ext_Photos.Count = 0 Then
   item.Ext_Photos.Add
 End If
 Set editExt_Photos.item = item.Ext_Photos.item(1)
 editExt_Photos.InitPanel
 cmdExt_PhotosSave.Enabled = True
 Ext_Photo_Call_Reinit
End Sub
Private Sub cmdExt_PhotosDel_Click()
  On Error Resume Next
  If editExt_Photos.item Is Nothing Then Exit Sub
  If MsgBox("Удалить элемент" & vbCrLf & editExt_Photos.item.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
    On Error GoTo bye
    editExt_Photos.item.Parent.Delete editExt_Photos.item.ID
    cmdExt_PhotosSave.Enabled = True
    editExt_Photos.Enabled = False
    Set editExt_Photos.item = Nothing
 Ext_Photo_Call_Reinit
  End If
  Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub editExt_Photos_Changed()
 cmdExt_PhotosSave.Enabled = True
End Sub
Private Sub cmdExt_PhotosCfg_Click()
    On Error Resume Next
    editExt_Photos.Customize
    Dim ff As Long
    ff = FreeFile
    Open GetSetting("MTZ", "CONFIG", "LAYOUTS", App.Path & "\LAYOUTS\") & "Ext_Photo_J_editExt_Photos_" For Output As #ff
    Print #ff, editExt_Photos.PanelCustomisationString
    Close #ff
End Sub
Public Function IsOK() As Boolean
    If editExt_Photos.IsOK Then
        IsOK = True
    End If
End Function
Private Sub cmdExt_PhotosSave_Click()
  On Error Resume Next
    If editExt_Photos.IsOK Then
    MousePointer = vbHourglass
    editExt_Photos.Save
  On Error GoTo bye
    editExt_Photos.item.Save
    MousePointer = vbNormal
    cmdExt_PhotosSave.Enabled = False
        opExt_Photos_Ext_Photo_J_SetName_ editExt_Photos.item
    Else
      MsgBox "Не все обязательные поля заполнены", vbOKOnly + vbExclamation
      Exit Sub
    End If
   Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
  editExt_Photos.item.Refresh
  editExt_Photos.InitPanel
End Sub
Private Sub pnlExt_Photos_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  editExt_Photos.Left = Left
  editExt_Photos.Top = Top + 25 * Screen.TwipsPerPixelY
  editExt_Photos.Width = Width
  editExt_Photos.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdExt_PhotosSave.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_PhotosRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_PhotosCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_PhotosSave.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdExt_PhotosRef.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdExt_PhotosCfg.Left = Left + 55 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdExt_Photo_CallCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridExt_Photo_Call, "gridExt_Photo_Call"
Set jset = Nothing
End Sub

Private Sub cmdExt_Photo_CallPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridExt_Photo_Call, "Вызов изображения"
Set jset = Nothing
End Sub

Private Sub cmdExt_Photo_CallAcc_Click()
On Error Resume Next
If gridExt_Photo_Call.ItemCount = 0 Then Exit Sub
If gridExt_Photo_Call.Row > 0 Then
 If gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridExt_Photo_Call.RowBookmark(gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdExt_Photo_CallFnd_Click()
  On Error Resume Next
  fndExt_Photo_Call.ShowForm
End Sub
Private Sub cmdExt_Photo_CallRun_Click()
  On Error Resume Next
  gridExt_Photo_Call_DblClick
End Sub
Private Sub pnlExt_Photos_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridExt_Photo_Call.Left = Left
  gridExt_Photo_Call.Top = Top + 25 * Screen.TwipsPerPixelY
  gridExt_Photo_Call.Width = Width
  gridExt_Photo_Call.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdExt_Photo_CallAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_Photo_CallEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_Photo_CallDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_Photo_CallRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_Photo_CallPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_Photo_CallCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_Photo_CallFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_Photo_CallRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_Photo_CallAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdExt_Photo_CallAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdExt_Photo_CallEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdExt_Photo_CallDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdExt_Photo_CallRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdExt_Photo_CallPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdExt_Photo_CallCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdExt_Photo_CallFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdExt_Photo_CallRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdExt_Photo_CallAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub

Private Sub gridExt_Photo_Call_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  If editExt_Photos.item Is Nothing Then gridExt_Photo_Call.ItemCount = 0: Exit Sub
  Dim p As Object
  If editExt_Photos.item Is Nothing Then Exit Sub
  Set p = editExt_Photos.item
  p.Ext_Photo_Call.LoadRow gridExt_Photo_Call, RowIndex, Bookmark, Values
  Set p = Nothing
End Sub

Private Sub Ext_Photo_Call_Reinit()
  On Error Resume Next
   cmdExt_Photo_CallRef_Click
End Sub
Private Sub gridExt_Photo_Call_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If editExt_Photos.item Is Nothing Then gridExt_Photo_Call.ItemCount = 0: Exit Sub
  If gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridExt_Photo_Call.RowBookmark(gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row))
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
Private Sub cmdExt_Photo_CallEdit_Click()
    On Error Resume Next
  If editExt_Photos.item Is Nothing Then gridExt_Photo_Call.ItemCount = 0: Exit Sub
    If gridExt_Photo_Call.Row = 0 Then Exit Sub
    If gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridExt_Photo_Call.RowBookmark(gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmExt_Photo_Call_.item = u
again:     frmExt_Photo_Call_.NotFirstTime = False
    frmExt_Photo_Call_.OnInit
    frmExt_Photo_Call_.Show vbModal
    If frmExt_Photo_Call_.OK Then
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridExt_Photo_Call.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
  Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdExt_Photo_CallRef_Click()
  On Error Resume Next
  If editExt_Photos.item Is Nothing Then gridExt_Photo_Call.ItemCount = 0: Exit Sub
   editExt_Photos.item.Ext_Photo_Call.Refresh
   editExt_Photos.item.Ext_Photo_Call.preparegrid gridExt_Photo_Call
   LoadGridLayout gridExt_Photo_Call
    Set fndExt_Photo_Call = Nothing
    Set fndExt_Photo_Call = CreateObject("MTZ_JSetup.GridFinder")
    fndExt_Photo_Call.Init gridExt_Photo_Call
End Sub
Private Sub gridExt_Photo_Call_KeyPress(KeyAscii As Integer)
  If gridExt_Photo_Call.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndExt_Photo_Call.FindOnPress KeyAscii
End Sub

Private Sub cmdExt_Photo_CallDel_Click()
  On Error Resume Next
  If editExt_Photos.item Is Nothing Then gridExt_Photo_Call.ItemCount = 0: Exit Sub
   gridExt_Photo_Call.Delete
End Sub
Private Sub cmdExt_Photo_CallAdd_Click()
  On Error Resume Next
  If editExt_Photos.item Is Nothing Then gridExt_Photo_Call.ItemCount = 0: Exit Sub
  editExt_Photos.item.Save
   Dim gu As Object
   Set gu = editExt_Photos.item
   Dim u As Object
   Set u = gu.Ext_Photo_Call.Add()

      Set frmExt_Photo_Call_.item = u
again:       frmExt_Photo_Call_.NotFirstTime = False
      frmExt_Photo_Call_.OnInit
      frmExt_Photo_Call_.Show vbModal
      If frmExt_Photo_Call_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridExt_Photo_Call.ItemCount = item.Ext_Photo_Call.Count
        gridExt_Photo_Call.Refresh
        gridExt_Photo_Call.RefreshGroups
        gridExt_Photo_Call.RefreshSort
        gridExt_Photo_Call.MoveToBookmark u.ID & "Ext_Photo_Call"
      Else
        gu.Ext_Photo_Call.Delete u.ID
        gu.Ext_Photo_Call.Remove u.ID
      End If
End Sub
Private Sub gridExt_Photo_Call_DblClick()
    cmdExt_Photo_CallEdit_Click
End Sub
Private Sub gridExt_Photo_Call_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridExt_Photo_Call.ItemCount = 0 Then Exit Sub
 If gridExt_Photo_Call.Row > 0 Then
   If LastRow <> gridExt_Photo_Call.Row And LastRow > 0 Then
     gridExt_Photo_Call.GetRowData(LastRow).RowStyle = "Default"
     gridExt_Photo_Call.GetRowData(gridExt_Photo_Call.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuExt_Photo_CallPASTE_Click()
On Error Resume Next
    If editExt_Photos.item Is Nothing Then Exit Sub
    Dim u As Object
    Set u = editExt_Photos.item.Ext_Photo_Call.Add()
    If GetFromBuffer(u) Then
      gridExt_Photo_Call.ItemCount = u.Parent.Count
    Else
      editExt_Photos.item.Ext_Photo_Call.Refresh
    End If
    Set u = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridExt_Photo_Call_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdExt_Photo_CallCfg_Click
        End If
    End If
End Sub

Private Sub gridExt_Photo_Call_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupExt_Photo_Call
End If
End Sub
Private Sub mnuExt_Photo_CallAdd_click()
   menuActionExt_Photo_Call = "ADD"
   menuTimerExt_Photo_Call.Enabled = True
End Sub
Private Sub mnuExt_Photo_CallEdit_click()
   menuActionExt_Photo_Call = "EDIT"
   menuTimerExt_Photo_Call.Enabled = True
End Sub
Private Sub mnuExt_Photo_CallDelete_click()
   menuActionExt_Photo_Call = "DEL"
   menuTimerExt_Photo_Call.Enabled = True
End Sub
Private Sub mnuExt_Photo_CallOpen_click()
   menuActionExt_Photo_Call = "RUN"
   menuTimerExt_Photo_Call.Enabled = True
End Sub
Private Sub mnuExt_Photo_CallRef_click()
   menuActionExt_Photo_Call = "REF"
   menuTimerExt_Photo_Call.Enabled = True
End Sub
  Private Sub mnuExt_Photo_CallCOPY_Click()
    On Error Resume Next
    If gridExt_Photo_Call.ItemCount = 0 Then Exit Sub
    If gridExt_Photo_Call.Row > 0 Then
     If gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridExt_Photo_Call.RowBookmark(gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuExt_Photo_CallCUT_Click()
    On Error Resume Next
    If gridExt_Photo_Call.ItemCount = 0 Then Exit Sub
    If gridExt_Photo_Call.Row > 0 Then
     If gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridExt_Photo_Call.RowBookmark(gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridExt_Photo_Call.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuExt_Photo_CallCHANGE_Click()
  On Error Resume Next
  If gridExt_Photo_Call.ItemCount = 0 Then Exit Sub
  If gridExt_Photo_Call.Row > 0 Then
   If gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridExt_Photo_Call.RowBookmark(gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridExt_Photo_Call.ItemCount = u.Parent.Count
      gridExt_Photo_Call.RefreshRowIndex gridExt_Photo_Call.RowIndex(gridExt_Photo_Call.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuExt_Photo_CallCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuExt_Photo_CallPrn_click()
   menuActionExt_Photo_Call = "PRN"
   menuTimerExt_Photo_Call.Enabled = True
End Sub
Private Sub mnuExt_Photo_CallCfg_click()
   menuActionExt_Photo_Call = "CFG"
   menuTimerExt_Photo_Call.Enabled = True
End Sub
Private Sub mnuExt_Photo_CallFind_click()
   menuActionExt_Photo_Call = "FND"
   menuTimerExt_Photo_Call.Enabled = True
End Sub
Private Sub mnuExt_Photo_CallAcc_click()
   menuActionExt_Photo_Call = "ACC"
   menuTimerExt_Photo_Call.Enabled = True
End Sub
Private Sub menuTimerExt_Photo_Call_timer()
   menuTimerExt_Photo_Call.Enabled = False
   If menuActionExt_Photo_Call = "ADD" Then cmdExt_Photo_CallAdd_Click
   If menuActionExt_Photo_Call = "EDIT" Then cmdExt_Photo_CallEdit_Click
   If menuActionExt_Photo_Call = "DEL" Then cmdExt_Photo_CallDel_Click
   If menuActionExt_Photo_Call = "RUN" Then cmdExt_Photo_CallRun_Click
   If menuActionExt_Photo_Call = "REF" Then cmdExt_Photo_CallRef_Click
   If menuActionExt_Photo_Call = "PRN" Then cmdExt_Photo_CallPrn_Click
   If menuActionExt_Photo_Call = "CFG" Then cmdExt_Photo_CallCfg_Click
   If menuActionExt_Photo_Call = "FND" Then cmdExt_Photo_CallFnd_Click
   If menuActionExt_Photo_Call = "ACC" Then cmdExt_Photo_CallAcc_Click
   menuActionExt_Photo_Call = ""
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

  LoadBtnPictures cmdExt_PhotosSave, cmdExt_PhotosSave.Tag
  LoadBtnPictures cmdExt_PhotosRef, cmdExt_PhotosRef.Tag
  LoadBtnPictures cmdExt_PhotosCfg, cmdExt_PhotosCfg.Tag
  Dim ff As Long, buf As String
  ff = FreeFile
  On Error Resume Next
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", App.Path & "c:\LAYOUTS\") & "Ext_Photo_J_editExt_Photos_" For Input As #ff
  buf = ""
  buf = Input(LOF(ff), ff)
  Close #ff
  If buf <> "" Then editExt_Photos.PanelCustomisationString = buf
 cmdExt_PhotosAdd_Click
  LoadBtnPictures cmdExt_Photo_CallAdd, cmdExt_Photo_CallAdd.Tag
  LoadBtnPictures cmdExt_Photo_CallEdit, cmdExt_Photo_CallEdit.Tag
  LoadBtnPictures cmdExt_Photo_CallDel, cmdExt_Photo_CallDel.Tag
  LoadBtnPictures cmdExt_Photo_CallRef, cmdExt_Photo_CallRef.Tag
  LoadBtnPictures cmdExt_Photo_CallPrn, cmdExt_Photo_CallPrn.Tag
  LoadBtnPictures cmdExt_Photo_CallFnd, cmdExt_Photo_CallFnd.Tag
  LoadBtnPictures cmdExt_Photo_CallCfg, cmdExt_Photo_CallCfg.Tag
  LoadBtnPictures cmdExt_Photo_CallRun, cmdExt_Photo_CallRun.Tag
  LoadBtnPictures cmdExt_Photo_CallAcc, cmdExt_Photo_CallAcc.Tag
  gridExt_Photo_Call.Columns.Clear
  gridExt_Photo_Call.ItemCount = 0
  cmdExt_Photo_CallRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlExt_Photos.RestorePosition
   cmdExt_Photo_CallRef_Click
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
  
  editExt_Photos.Save
If editExt_Photos.item.Changed Then
  editExt_Photos.item.Save
End If
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
  
 m_IsChanged = m_IsChanged Or item.Changed
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  pnlExt_Photos.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndExt_Photo_Call = Nothing
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





