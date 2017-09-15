VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnRPTStruct_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerRPTFields 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerRPTStruct 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlRPTStruct 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdRPTFieldsAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   17
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdRPTFieldsRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   16
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdRPTFieldsFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   15
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdRPTFieldsCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdRPTFieldsPrn 
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
      Begin VB.CommandButton cmdRPTFieldsRef 
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
      Begin VB.CommandButton cmdRPTFieldsDel 
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
      Begin VB.CommandButton cmdRPTFieldsEdit 
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
      Begin VB.CommandButton cmdRPTFieldsAdd 
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
      Begin GridEX20.GridEX gridRPTFields 
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
         Column(1)       =   "vpnRPTStruct_.ctx":0000
         Column(2)       =   "vpnRPTStruct_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnRPTStruct_.ctx":016C
         FormatStyle(2)  =   "vpnRPTStruct_.ctx":02C8
         FormatStyle(3)  =   "vpnRPTStruct_.ctx":0378
         FormatStyle(4)  =   "vpnRPTStruct_.ctx":042C
         FormatStyle(5)  =   "vpnRPTStruct_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnRPTStruct_.ctx":05BC
      End
      Begin VB.CommandButton cmdRPTStructAcc 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdRPTStructRef 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdRPTStructDel 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdRPTStructEdit 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdRPTStructAdd 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdRPTStructAddRoot 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "NEWROOT.ico"
         ToolTipText     =   "Добавить ветку"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MSComctlLib.TreeView treeRPTStruct 
         Height          =   480
         Left            =   3900
         TabIndex        =   1
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   132
         LabelEdit       =   1
         LineStyle       =   1
         PathSeparator   =   ""
         Sorted          =   -1  'True
         Style           =   7
         Appearance      =   1
      End
   End
   Begin VB.Menu mnuPopupRPTStruct 
      Caption         =   "Меню для Секции"
      Visible         =   0   'False
      Begin VB.Menu mnuRPTStructAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuRPTStructAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuRPTStructEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuRPTStructDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuRPTStructS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuRPTStructBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuRPTStructCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuRPTStructCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuRPTStructPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuRPTStructCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuRPTStructCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuRPTStructRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuRPTStructAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupRPTFields 
      Caption         =   "Меню для Поля секции"
      Visible         =   0   'False
      Begin VB.Menu mnuRPTFieldsAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuRPTFieldsEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuRPTFieldsDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuRPTFieldsOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuRPTFieldsRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuRPTFieldsS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuRPTFieldsBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuRPTFieldsCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuRPTFieldsCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuRPTFieldsPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuRPTFieldsCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuRPTFieldsCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuRPTFieldsPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuRPTFieldsCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuRPTFieldsFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuRPTFieldsAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnRPTStruct_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Секции
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private menuActionRPTStruct As String
Private fndRPTFields As Object
Private menuActionRPTFields As String





Private Sub pnlRPTStruct_PositionChanged()
  pnlRPTStruct.SavePosition
End Sub
Private Sub treeRPTStruct_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupRPTStruct
End If
End Sub
Private Sub mnuRPTStructAddRoot_click()
   menuActionRPTStruct = "ADDROOT"
   menuTimerRPTStruct.Enabled = True
End Sub
Private Sub mnuRPTStructAdd_click()
   menuActionRPTStruct = "ADD"
   menuTimerRPTStruct.Enabled = True
End Sub
Private Sub mnuRPTStructEdit_click()
   menuActionRPTStruct = "EDIT"
   menuTimerRPTStruct.Enabled = True
End Sub
Private Sub mnuRPTStructDelete_click()
   menuActionRPTStruct = "DEL"
   menuTimerRPTStruct.Enabled = True
End Sub
  Private Sub mnuRPTStructCOPY_Click()
    On Error Resume Next
    If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuRPTStructCUT_Click()
    On Error Resume Next
    If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, bm
    Set u = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
    SaveToBuffer u
    Set bm = u.Parent
    u.Parent.Delete u.ID
    treeRPTStruct.Nodes.Remove treeRPTStruct.SelectedItem.Key
  End Sub
Private Sub mnuRPTStructPASTE_Click()
On Error Resume Next
If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
  Set u = f.RPTStruct.Add()
  If GetFromBuffer(u) Then
    If treeRPTStruct.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treeRPTStruct, treeRPTStruct.SelectedItem.Key
    End If
  Else
   f.RPTStruct.Refresh
  End If
End Sub
Private Sub mnuRPTStructCHANGE_Click()
  On Error Resume Next
  If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, bm
  Set u = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
  If GetFromBuffer(u) Then
    treeRPTStruct.SelectedItem.Text = u.brief
      treeRPTStruct.SelectedItem.Expanded = False
      While treeRPTStruct.SelectedItem.Children > 0
        treeRPTStruct.Nodes.Remove treeRPTStruct.SelectedItem.Child.Key
      Wend
      treeRPTStruct.Nodes.Add(treeRPTStruct.SelectedItem.Key, 4, "Expanding ...").Tag = "ToDelete"
      treeRPTStruct_Expand treeRPTStruct.SelectedItem
  End If
End Sub
  Private Sub mnuRPTStructCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuRPTStructRef_click()
   menuActionRPTStruct = "REF"
   menuTimerRPTStruct.Enabled = True
End Sub
Private Sub mnuRPTStructAcc_click()
   menuActionRPTStruct = "ACC"
   menuTimerRPTStruct.Enabled = True
End Sub
Private Sub menuTimerRPTStruct_timer()
   menuTimerRPTStruct.Enabled = False
   If menuActionRPTStruct = "ADDROOT" Then cmdRPTStructAddRoot_Click
   If menuActionRPTStruct = "ADD" Then cmdRPTStructAdd_Click
   If menuActionRPTStruct = "EDIT" Then cmdRPTStructEdit_Click
   If menuActionRPTStruct = "DEL" Then cmdRPTStructDel_Click
   If menuActionRPTStruct = "REF" Then cmdRPTStructREf_Click
   If menuActionRPTStruct = "ACC" Then cmdRPTStructAcc_Click
   menuActionRPTStruct = ""
End Sub
Private Sub cmdRPTStructAdd_Click()
  On Error Resume Next
  On Error Resume Next
  Dim f As Object, p As Object
If (treeRPTStruct.SelectedItem Is Nothing) Then Exit Sub
  Set p = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
  Set f = p.RPTStruct.Add()

      Set frmRPTStruct_.Item = f
again:       frmRPTStruct_.NotFirstTime = False
      frmRPTStruct_.OnInit
      frmRPTStruct_.Show vbModal
      If frmRPTStruct_.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treeRPTStruct.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treeRPTStruct, treeRPTStruct.SelectedItem.Key
          End If
          Set treeRPTStruct.SelectedItem = treeRPTStruct.Nodes.Item(f.ID & "RPTStruct")
      Else
        Item.RPTStruct.Delete f.ID
        Item.RPTStruct.Remove f.ID
      End If
End Sub

Private Sub cmdRPTStructAddRoot_Click()
  On Error Resume Next
Dim f As Object, p As Object
  Set f = Item.RPTStruct.Add()

      Set frmRPTStruct_.Item = f
again:       frmRPTStruct_.NotFirstTime = False
      frmRPTStruct_.OnInit
      frmRPTStruct_.Show vbModal
      If frmRPTStruct_.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
    Item.RPTStruct.Refresh
    treeRPTStruct.Nodes.Clear
    Item.RPTStruct.filltree treeRPTStruct
          Set treeRPTStruct.SelectedItem = treeRPTStruct.Nodes.Item(f.ID & "RPTStruct")
      Else
        Item.RPTStruct.Remove f.ID
      End If
End Sub

Private Sub cmdRPTStructEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
  Set frmRPTStruct_.Item = f
again:   frmRPTStruct_.NotFirstTime = False
  frmRPTStruct_.OnInit
  frmRPTStruct_.Show vbModal
  If frmRPTStruct_.OK Then
    err.Clear
    f.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdRPTStructDel_Click()
  On Error Resume Next
  Dim f As Object
  If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
  If MsgBox("Удалить элемент" & vbCrLf & f.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
  On Error GoTo bye
     If f.Parent.Delete(f.ID) Then
       treeRPTStruct.Nodes.Remove treeRPTStruct.SelectedItem.Key
     End If
  End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub cmdRPTStructAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
  Item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdRPTStructREf_Click()
  On Error Resume Next
  Item.RPTStruct.Refresh
  treeRPTStruct.Nodes.Clear
  Item.RPTStruct.filltree treeRPTStruct
End Sub

Private Sub treeRPTStruct_DblClick()
If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
  cmdRPTStructEdit_Click
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function

Private Sub treeRPTStruct_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeRPTStruct.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = Item.FindRowObject("RPTStruct", Left(Node.Key, 38))
 f.expandpart treeRPTStruct, Node.Key
 ParentForm.MousePointer = vbNormal
End If
 Set treeRPTStruct.SelectedItem = Node
 treeRPTStruct_NodeClick Node
End Sub

Private Sub treeRPTStruct_Collapse(ByVal Node As MSComctlLib.Node)
 Set treeRPTStruct.SelectedItem = Node
 treeRPTStruct_NodeClick Node
End Sub

Private Sub pnlRPTStruct_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treeRPTStruct.Left = Left
  treeRPTStruct.Top = Top + 25 * Screen.TwipsPerPixelY
  treeRPTStruct.Width = Width
  treeRPTStruct.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdRPTStructAddRoot.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTStructAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTStructEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTStructDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTStructRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTStructAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTStructAddRoot.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdRPTStructAdd.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdRPTStructEdit.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdRPTStructDel.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdRPTStructRef.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdRPTStructAcc.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdRPTFieldsCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridRPTFields, "gridRPTFields"
Set jset = Nothing
End Sub

Private Sub cmdRPTFieldsPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridRPTFields, "Поля секции"
Set jset = Nothing
End Sub

Private Sub cmdRPTFieldsAcc_Click()
On Error Resume Next
If gridRPTFields.ItemCount = 0 Then Exit Sub
If gridRPTFields.Row > 0 Then
 If gridRPTFields.RowIndex(gridRPTFields.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridRPTFields.RowBookmark(gridRPTFields.RowIndex(gridRPTFields.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdRPTFieldsFnd_Click()
  On Error Resume Next
  fndRPTFields.ShowForm
End Sub
Private Sub cmdRPTFieldsRun_Click()
  On Error Resume Next
  gridRPTFields_DblClick
End Sub
Private Sub pnlRPTStruct_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridRPTFields.Left = Left
  gridRPTFields.Top = Top + 25 * Screen.TwipsPerPixelY
  gridRPTFields.Width = Width
  gridRPTFields.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdRPTFieldsAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTFieldsEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTFieldsDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTFieldsRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTFieldsPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTFieldsCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTFieldsFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTFieldsRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTFieldsAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdRPTFieldsAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdRPTFieldsEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdRPTFieldsDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdRPTFieldsRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdRPTFieldsPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdRPTFieldsCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdRPTFieldsFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdRPTFieldsRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdRPTFieldsAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub treeRPTStruct_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object
  Set p = Item.FindRowObject("RPTStruct", Left(Node.Key, 38))
  p.RPTFields.Refresh
  p.RPTFields.preparegrid gridRPTFields
  LoadGridLayout gridRPTFields
    Set fndRPTFields = Nothing
    Set fndRPTFields = CreateObject("MTZ_JSetup.GridFinder")
    fndRPTFields.Init gridRPTFields
End Sub

Private Sub gridRPTFields_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object
  If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
  Set p = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
  p.RPTFields.LoadRow gridRPTFields, RowIndex, Bookmark, Values
  Set p = Nothing
End Sub
Private Sub gridRPTFields_KeyPress(KeyAscii As Integer)
  If gridRPTFields.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndRPTFields.FindOnPress KeyAscii
End Sub

Private Sub gridRPTFields_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
    If gridRPTFields.Row = 0 Then Exit Sub
    If gridRPTFields.RowIndex(gridRPTFields.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridRPTFields.RowBookmark(gridRPTFields.RowIndex(gridRPTFields.Row))
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
Private Sub cmdRPTFieldsEdit_Click()
    On Error Resume Next
    If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
    If gridRPTFields.Row = 0 Then Exit Sub
    If gridRPTFields.RowIndex(gridRPTFields.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridRPTFields.RowBookmark(gridRPTFields.RowIndex(gridRPTFields.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmRPTFields_.Item = u
again:     frmRPTFields_.NotFirstTime = False
    frmRPTFields_.OnInit
    frmRPTFields_.Show vbModal
    If frmRPTFields_.OK Then
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridRPTFields.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
  Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdRPTFieldsRef_Click()
  On Error Resume Next
    If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
  gridRPTFields.Columns.Clear
  gridRPTFields.ItemCount = 0
   treeRPTStruct_NodeClick treeRPTStruct.SelectedItem
End Sub
Private Sub cmdRPTFieldsDel_Click()
  On Error Resume Next
   gridRPTFields.Delete
End Sub
Private Sub cmdRPTFieldsAdd_Click()
  On Error Resume Next
   If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
   Dim gu As Object
   Set gu = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
   Dim u As Object
   Set u = gu.RPTFields.Add()

      Set frmRPTFields_.Item = u
again:       frmRPTFields_.NotFirstTime = False
      frmRPTFields_.OnInit
      frmRPTFields_.Show vbModal
      If frmRPTFields_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridRPTFields.ItemCount = gu.RPTFields.Count
        gridRPTFields.Refresh
        gridRPTFields.RefreshGroups
        gridRPTFields.RefreshSort
        gridRPTFields.MoveToBookmark u.ID & "RPTFields"
      Else
        gu.RPTFields.Delete u.ID
        gu.RPTFields.Remove u.ID
      End If
Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridRPTFields_DblClick()
    cmdRPTFieldsEdit_Click
End Sub
Private Sub gridRPTFields_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridRPTFields.ItemCount = 0 Then Exit Sub
 If gridRPTFields.Row > 0 Then
   If LastRow <> gridRPTFields.Row And LastRow > 0 Then
     gridRPTFields.GetRowData(LastRow).RowStyle = "Default"
     gridRPTFields.GetRowData(gridRPTFields.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuRPTFieldsPASTE_Click()
On Error Resume Next
   If treeRPTStruct.SelectedItem Is Nothing Then Exit Sub
   Dim gu As Object
   Set gu = Item.FindRowObject("RPTStruct", Left(treeRPTStruct.SelectedItem.Key, 38))
   Dim u As Object
   Set u = gu.RPTFields.Add()
    If GetFromBuffer(u) Then
      gridRPTFields.ItemCount = u.Parent.Count
    Else
      gu.RPTFields.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridRPTFields_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdRPTFieldsCfg_Click
        End If
    End If
End Sub

Private Sub gridRPTFields_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupRPTFields
End If
End Sub
Private Sub mnuRPTFieldsAdd_click()
   menuActionRPTFields = "ADD"
   menuTimerRPTFields.Enabled = True
End Sub
Private Sub mnuRPTFieldsEdit_click()
   menuActionRPTFields = "EDIT"
   menuTimerRPTFields.Enabled = True
End Sub
Private Sub mnuRPTFieldsDelete_click()
   menuActionRPTFields = "DEL"
   menuTimerRPTFields.Enabled = True
End Sub
Private Sub mnuRPTFieldsOpen_click()
   menuActionRPTFields = "RUN"
   menuTimerRPTFields.Enabled = True
End Sub
Private Sub mnuRPTFieldsRef_click()
   menuActionRPTFields = "REF"
   menuTimerRPTFields.Enabled = True
End Sub
  Private Sub mnuRPTFieldsCOPY_Click()
    On Error Resume Next
    If gridRPTFields.ItemCount = 0 Then Exit Sub
    If gridRPTFields.Row > 0 Then
     If gridRPTFields.RowIndex(gridRPTFields.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridRPTFields.RowBookmark(gridRPTFields.RowIndex(gridRPTFields.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuRPTFieldsCUT_Click()
    On Error Resume Next
    If gridRPTFields.ItemCount = 0 Then Exit Sub
    If gridRPTFields.Row > 0 Then
     If gridRPTFields.RowIndex(gridRPTFields.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridRPTFields.RowBookmark(gridRPTFields.RowIndex(gridRPTFields.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridRPTFields.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuRPTFieldsCHANGE_Click()
  On Error Resume Next
  If gridRPTFields.ItemCount = 0 Then Exit Sub
  If gridRPTFields.Row > 0 Then
   If gridRPTFields.RowIndex(gridRPTFields.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridRPTFields.RowBookmark(gridRPTFields.RowIndex(gridRPTFields.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridRPTFields.ItemCount = u.Parent.Count
      gridRPTFields.RefreshRowIndex gridRPTFields.RowIndex(gridRPTFields.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuRPTFieldsCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuRPTFieldsPrn_click()
   menuActionRPTFields = "PRN"
   menuTimerRPTFields.Enabled = True
End Sub
Private Sub mnuRPTFieldsCfg_click()
   menuActionRPTFields = "CFG"
   menuTimerRPTFields.Enabled = True
End Sub
Private Sub mnuRPTFieldsFind_click()
   menuActionRPTFields = "FND"
   menuTimerRPTFields.Enabled = True
End Sub
Private Sub mnuRPTFieldsAcc_click()
   menuActionRPTFields = "ACC"
   menuTimerRPTFields.Enabled = True
End Sub
Private Sub menuTimerRPTFields_timer()
   menuTimerRPTFields.Enabled = False
   If menuActionRPTFields = "ADD" Then cmdRPTFieldsAdd_Click
   If menuActionRPTFields = "EDIT" Then cmdRPTFieldsEdit_Click
   If menuActionRPTFields = "DEL" Then cmdRPTFieldsDel_Click
   If menuActionRPTFields = "RUN" Then cmdRPTFieldsRun_Click
   If menuActionRPTFields = "REF" Then cmdRPTFieldsRef_Click
   If menuActionRPTFields = "PRN" Then cmdRPTFieldsPrn_Click
   If menuActionRPTFields = "CFG" Then cmdRPTFieldsCfg_Click
   If menuActionRPTFields = "FND" Then cmdRPTFieldsFnd_Click
   If menuActionRPTFields = "ACC" Then cmdRPTFieldsAcc_Click
   menuActionRPTFields = ""
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

  LoadBtnPictures cmdRPTStructAddRoot, cmdRPTStructAddRoot.Tag
  LoadBtnPictures cmdRPTStructAdd, cmdRPTStructAdd.Tag
  LoadBtnPictures cmdRPTStructEdit, cmdRPTStructEdit.Tag
  LoadBtnPictures cmdRPTStructDel, cmdRPTStructDel.Tag
  LoadBtnPictures cmdRPTStructRef, cmdRPTStructRef.Tag
  LoadBtnPictures cmdRPTStructAcc, cmdRPTStructAcc.Tag
Item.RPTStruct.filltree treeRPTStruct
  LoadBtnPictures cmdRPTFieldsAdd, cmdRPTFieldsAdd.Tag
  LoadBtnPictures cmdRPTFieldsEdit, cmdRPTFieldsEdit.Tag
  LoadBtnPictures cmdRPTFieldsDel, cmdRPTFieldsDel.Tag
  LoadBtnPictures cmdRPTFieldsRef, cmdRPTFieldsRef.Tag
  LoadBtnPictures cmdRPTFieldsPrn, cmdRPTFieldsPrn.Tag
  LoadBtnPictures cmdRPTFieldsFnd, cmdRPTFieldsFnd.Tag
  LoadBtnPictures cmdRPTFieldsCfg, cmdRPTFieldsCfg.Tag
  LoadBtnPictures cmdRPTFieldsRun, cmdRPTFieldsRun.Tag
  LoadBtnPictures cmdRPTFieldsAcc, cmdRPTFieldsAcc.Tag
  gridRPTFields.Columns.Clear
  gridRPTFields.ItemCount = 0
  cmdRPTFieldsRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlRPTStruct.RestorePosition
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
  pnlRPTStruct.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndRPTFields = Nothing
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





