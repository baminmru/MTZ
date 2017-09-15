VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.UserControl vpnWEBS_NEWS_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerNEWS_PICS 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerWEBS_NEWS 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlWEBS_NEWS 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdNEWS_PICSAcc 
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
      Begin MTZ_PANEL.DropButton cmdNEWS_PICSRun 
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
      Begin VB.CommandButton cmdNEWS_PICSFnd 
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
      Begin VB.CommandButton cmdNEWS_PICSCfg 
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
      Begin VB.CommandButton cmdNEWS_PICSPrn 
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
      Begin VB.CommandButton cmdNEWS_PICSRef 
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
      Begin VB.CommandButton cmdNEWS_PICSDel 
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
      Begin VB.CommandButton cmdNEWS_PICSEdit 
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
      Begin VB.CommandButton cmdNEWS_PICSAdd 
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
      Begin GridEX20.GridEX gridNEWS_PICS 
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
         Column(1)       =   "vpnWEBS_NEWS_.ctx":0000
         Column(2)       =   "vpnWEBS_NEWS_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnWEBS_NEWS_.ctx":016C
         FormatStyle(2)  =   "vpnWEBS_NEWS_.ctx":02C8
         FormatStyle(3)  =   "vpnWEBS_NEWS_.ctx":0378
         FormatStyle(4)  =   "vpnWEBS_NEWS_.ctx":042C
         FormatStyle(5)  =   "vpnWEBS_NEWS_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnWEBS_NEWS_.ctx":05BC
      End
      Begin VB.CommandButton cmdWEBS_NEWSAcc 
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
      Begin VB.CommandButton cmdWEBS_NEWSRef 
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
      Begin VB.CommandButton cmdWEBS_NEWSDel 
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
      Begin VB.CommandButton cmdWEBS_NEWSEdit 
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
      Begin VB.CommandButton cmdWEBS_NEWSAdd 
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
      Begin VB.CommandButton cmdWEBS_NEWSAddRoot 
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
      Begin MSComctlLib.TreeView treeWEBS_NEWS 
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
   Begin VB.Menu mnuPopupWEBS_NEWS 
      Caption         =   "Меню для Новости"
      Visible         =   0   'False
      Begin VB.Menu mnuWEBS_NEWSAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuWEBS_NEWSAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWEBS_NEWSEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWEBS_NEWSDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWEBS_NEWSS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWEBS_NEWSBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWEBS_NEWSCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWEBS_NEWSCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWEBS_NEWSPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWEBS_NEWSCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWEBS_NEWSCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWEBS_NEWSRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWEBS_NEWSAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupNEWS_PICS 
      Caption         =   "Меню для Картинки"
      Visible         =   0   'False
      Begin VB.Menu mnuNEWS_PICSAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuNEWS_PICSEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuNEWS_PICSDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuNEWS_PICSOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuNEWS_PICSRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuNEWS_PICSS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuNEWS_PICSBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuNEWS_PICSCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuNEWS_PICSCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuNEWS_PICSPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuNEWS_PICSCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuNEWS_PICSCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuNEWS_PICSPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuNEWS_PICSCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuNEWS_PICSFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuNEWS_PICSAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWEBS_NEWS_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель для работы со строками раздела Древовидный список новостей
Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private menuActionWEBS_NEWS As String
Private fndNEWS_PICS As Object
Private menuActionNEWS_PICS As String





Private Sub pnlWEBS_NEWS_PositionChanged()
  pnlWEBS_NEWS.SavePosition
End Sub
Private Sub treeWEBS_NEWS_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWEBS_NEWS
End If
End Sub
Private Sub mnuWEBS_NEWSAddRoot_click()
   menuActionWEBS_NEWS = "ADDROOT"
   menuTimerWEBS_NEWS.Enabled = True
End Sub
Private Sub mnuWEBS_NEWSAdd_click()
   menuActionWEBS_NEWS = "ADD"
   menuTimerWEBS_NEWS.Enabled = True
End Sub
Private Sub mnuWEBS_NEWSEdit_click()
   menuActionWEBS_NEWS = "EDIT"
   menuTimerWEBS_NEWS.Enabled = True
End Sub
Private Sub mnuWEBS_NEWSDelete_click()
   menuActionWEBS_NEWS = "DEL"
   menuTimerWEBS_NEWS.Enabled = True
End Sub
  Private Sub mnuWEBS_NEWSCOPY_Click()
    On Error Resume Next
    If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuWEBS_NEWSCUT_Click()
    On Error Resume Next
    If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, bm
    Set u = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
    SaveToBuffer u
    Set bm = u.Parent
    u.Parent.Delete u.ID
    treeWEBS_NEWS.Nodes.Remove treeWEBS_NEWS.SelectedItem.key
  End Sub
Private Sub mnuWEBS_NEWSPASTE_Click()
On Error Resume Next
If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
  Set u = f.WEBS_NEWS.Add()
  If GetFromBuffer(u) Then
    If treeWEBS_NEWS.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treeWEBS_NEWS, treeWEBS_NEWS.SelectedItem.key
    End If
  Else
   f.WEBS_NEWS.Refresh
  End If
End Sub
Private Sub mnuWEBS_NEWSCHANGE_Click()
  On Error Resume Next
  If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, bm
  Set u = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
  If GetFromBuffer(u) Then
    treeWEBS_NEWS.SelectedItem.Text = u.brief
      treeWEBS_NEWS.SelectedItem.Expanded = False
      While treeWEBS_NEWS.SelectedItem.Children > 0
        treeWEBS_NEWS.Nodes.Remove treeWEBS_NEWS.SelectedItem.Child.key
      Wend
      treeWEBS_NEWS.Nodes.Add(treeWEBS_NEWS.SelectedItem.key, 4, "Expanding ...").Tag = "ToDelete"
      treeWEBS_NEWS_Expand treeWEBS_NEWS.SelectedItem
  End If
End Sub
  Private Sub mnuWEBS_NEWSCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWEBS_NEWSRef_click()
   menuActionWEBS_NEWS = "REF"
   menuTimerWEBS_NEWS.Enabled = True
End Sub
Private Sub mnuWEBS_NEWSAcc_click()
   menuActionWEBS_NEWS = "ACC"
   menuTimerWEBS_NEWS.Enabled = True
End Sub
Private Sub menuTimerWEBS_NEWS_timer()
   menuTimerWEBS_NEWS.Enabled = False
   If menuActionWEBS_NEWS = "ADDROOT" Then cmdWEBS_NEWSAddRoot_Click
   If menuActionWEBS_NEWS = "ADD" Then cmdWEBS_NEWSAdd_Click
   If menuActionWEBS_NEWS = "EDIT" Then cmdWEBS_NEWSEdit_Click
   If menuActionWEBS_NEWS = "DEL" Then cmdWEBS_NEWSDel_Click
   If menuActionWEBS_NEWS = "REF" Then cmdWEBS_NEWSREf_Click
   If menuActionWEBS_NEWS = "ACC" Then cmdWEBS_NEWSAcc_Click
   menuActionWEBS_NEWS = ""
End Sub
Private Sub cmdWEBS_NEWSAdd_Click()
  On Error Resume Next
  On Error Resume Next
  Dim f As Object, p As Object
If (treeWEBS_NEWS.SelectedItem Is Nothing) Then Exit Sub
  Set p = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
  Set f = p.WEBS_NEWS.Add()
   Call GetNumValue(f, "QueueNumber", "{E7F3EE01-4EC4-41D2-8657-BA22089DE0E5}", Now, "%P", "")

      Set frmWEBS_NEWS_.Item = f
again:       frmWEBS_NEWS_.NotFirstTime = False
      frmWEBS_NEWS_.OnInit
      frmWEBS_NEWS_.Show vbModal
      If frmWEBS_NEWS_.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treeWEBS_NEWS.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treeWEBS_NEWS, treeWEBS_NEWS.SelectedItem.key
          End If
          Set treeWEBS_NEWS.SelectedItem = treeWEBS_NEWS.Nodes.Item(f.ID & "WEBS_NEWS")
      Else
        Item.WEBS_NEWS.Delete f.ID
        Item.WEBS_NEWS.Remove f.ID
      End If
End Sub

Private Sub cmdWEBS_NEWSAddRoot_Click()
  On Error Resume Next
Dim f As Object, p As Object
  Set f = Item.WEBS_NEWS.Add()
   Call GetNumValue(f, "QueueNumber", "{E7F3EE01-4EC4-41D2-8657-BA22089DE0E5}", Now, "%P", "")

      Set frmWEBS_NEWS_.Item = f
again:       frmWEBS_NEWS_.NotFirstTime = False
      frmWEBS_NEWS_.OnInit
      frmWEBS_NEWS_.Show vbModal
      If frmWEBS_NEWS_.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
    Item.WEBS_NEWS.Refresh
    treeWEBS_NEWS.Nodes.Clear
    Item.WEBS_NEWS.filltree treeWEBS_NEWS
          Set treeWEBS_NEWS.SelectedItem = treeWEBS_NEWS.Nodes.Item(f.ID & "WEBS_NEWS")
      Else
        Item.WEBS_NEWS.Remove f.ID
      End If
End Sub

Private Sub cmdWEBS_NEWSEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
  Set frmWEBS_NEWS_.Item = f
again:   frmWEBS_NEWS_.NotFirstTime = False
  frmWEBS_NEWS_.OnInit
  frmWEBS_NEWS_.Show vbModal
  If frmWEBS_NEWS_.OK Then
    err.Clear
    f.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdWEBS_NEWSDel_Click()
  On Error Resume Next
  Dim f As Object
  If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
  If MsgBox("Удалить элемент" & vbCrLf & f.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
  On Error GoTo bye
     If f.Parent.Delete(f.ID) Then
       treeWEBS_NEWS.Nodes.Remove treeWEBS_NEWS.SelectedItem.key
     End If
  End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub cmdWEBS_NEWSAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
  Item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdWEBS_NEWSREf_Click()
  On Error Resume Next
  Item.WEBS_NEWS.Refresh
  treeWEBS_NEWS.Nodes.Clear
  Item.WEBS_NEWS.filltree treeWEBS_NEWS
End Sub

Private Sub treeWEBS_NEWS_DblClick()
If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
  cmdWEBS_NEWSEdit_Click
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function

Private Sub treeWEBS_NEWS_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treeWEBS_NEWS.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = Item.FindRowObject("WEBS_NEWS", Left(Node.key, 38))
 f.expandpart treeWEBS_NEWS, Node.key
 ParentForm.MousePointer = vbNormal
End If
 Set treeWEBS_NEWS.SelectedItem = Node
 treeWEBS_NEWS_NodeClick Node
End Sub

Private Sub treeWEBS_NEWS_Collapse(ByVal Node As MSComctlLib.Node)
 Set treeWEBS_NEWS.SelectedItem = Node
 treeWEBS_NEWS_NodeClick Node
End Sub

Private Sub pnlWEBS_NEWS_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treeWEBS_NEWS.Left = Left
  treeWEBS_NEWS.Top = Top + 25 * Screen.TwipsPerPixelY
  treeWEBS_NEWS.Width = Width
  treeWEBS_NEWS.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWEBS_NEWSAddRoot.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWEBS_NEWSAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWEBS_NEWSEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWEBS_NEWSDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWEBS_NEWSRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWEBS_NEWSAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWEBS_NEWSAddRoot.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWEBS_NEWSAdd.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWEBS_NEWSEdit.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWEBS_NEWSDel.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWEBS_NEWSRef.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWEBS_NEWSAcc.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdNEWS_PICSCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridNEWS_PICS, "gridNEWS_PICS"
Set jset = Nothing
End Sub

Private Sub cmdNEWS_PICSPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridNEWS_PICS, "Картинки"
Set jset = Nothing
End Sub

Private Sub cmdNEWS_PICSAcc_Click()
On Error Resume Next
If gridNEWS_PICS.ItemCount = 0 Then Exit Sub
If gridNEWS_PICS.Row > 0 Then
 If gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridNEWS_PICS.RowBookmark(gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdNEWS_PICSFnd_Click()
  On Error Resume Next
  fndNEWS_PICS.ShowForm
End Sub
Private Sub cmdNEWS_PICSRun_Click()
  On Error Resume Next
  gridNEWS_PICS_DblClick
End Sub
Private Sub pnlWEBS_NEWS_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridNEWS_PICS.Left = Left
  gridNEWS_PICS.Top = Top + 25 * Screen.TwipsPerPixelY
  gridNEWS_PICS.Width = Width
  gridNEWS_PICS.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdNEWS_PICSAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNEWS_PICSEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNEWS_PICSDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNEWS_PICSRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNEWS_PICSPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNEWS_PICSCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNEWS_PICSFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNEWS_PICSRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNEWS_PICSAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdNEWS_PICSAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdNEWS_PICSEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdNEWS_PICSDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdNEWS_PICSRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdNEWS_PICSPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdNEWS_PICSCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdNEWS_PICSFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdNEWS_PICSRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdNEWS_PICSAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub treeWEBS_NEWS_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object
  Set p = Item.FindRowObject("WEBS_NEWS", Left(Node.key, 38))
  p.NEWS_PICS.Refresh
  p.NEWS_PICS.preparegrid gridNEWS_PICS
  LoadGridLayout gridNEWS_PICS
    Set fndNEWS_PICS = Nothing
    Set fndNEWS_PICS = CreateObject("MTZ_JSetup.GridFinder")
    fndNEWS_PICS.Init gridNEWS_PICS
End Sub

Private Sub gridNEWS_PICS_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object
  If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
  Set p = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
  p.NEWS_PICS.LoadRow gridNEWS_PICS, RowIndex, Bookmark, Values
  Set p = Nothing
End Sub
Private Sub gridNEWS_PICS_KeyPress(KeyAscii As Integer)
  If gridNEWS_PICS.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndNEWS_PICS.FindOnPress KeyAscii
End Sub

Private Sub gridNEWS_PICS_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
    If gridNEWS_PICS.Row = 0 Then Exit Sub
    If gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridNEWS_PICS.RowBookmark(gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row))
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
Private Sub cmdNEWS_PICSEdit_Click()
    On Error Resume Next
    If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
    If gridNEWS_PICS.Row = 0 Then Exit Sub
    If gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridNEWS_PICS.RowBookmark(gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmNEWS_PICS_.Item = u
again:     frmNEWS_PICS_.NotFirstTime = False
    frmNEWS_PICS_.OnInit
    frmNEWS_PICS_.Show vbModal
    If frmNEWS_PICS_.OK Then
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridNEWS_PICS.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
  Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdNEWS_PICSRef_Click()
  On Error Resume Next
    If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
  gridNEWS_PICS.Columns.Clear
  gridNEWS_PICS.ItemCount = 0
   treeWEBS_NEWS_NodeClick treeWEBS_NEWS.SelectedItem
End Sub
Private Sub cmdNEWS_PICSDel_Click()
  On Error Resume Next
   gridNEWS_PICS.Delete
End Sub
Private Sub cmdNEWS_PICSAdd_Click()
  On Error Resume Next
   If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
   Dim gu As Object
   Set gu = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
   Dim u As Object
   Set u = gu.NEWS_PICS.Add()

      Set frmNEWS_PICS_.Item = u
again:       frmNEWS_PICS_.NotFirstTime = False
      frmNEWS_PICS_.OnInit
      frmNEWS_PICS_.Show vbModal
      If frmNEWS_PICS_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridNEWS_PICS.ItemCount = gu.NEWS_PICS.Count
        gridNEWS_PICS.Refresh
        gridNEWS_PICS.RefreshGroups
        gridNEWS_PICS.RefreshSort
        gridNEWS_PICS.MoveToBookmark u.ID & "NEWS_PICS"
      Else
        gu.NEWS_PICS.Delete u.ID
        gu.NEWS_PICS.Remove u.ID
      End If
Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridNEWS_PICS_DblClick()
    cmdNEWS_PICSEdit_Click
End Sub
Private Sub gridNEWS_PICS_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridNEWS_PICS.ItemCount = 0 Then Exit Sub
 If gridNEWS_PICS.Row > 0 Then
   If LastRow <> gridNEWS_PICS.Row And LastRow > 0 Then
     gridNEWS_PICS.GetRowData(LastRow).RowStyle = "Default"
     gridNEWS_PICS.GetRowData(gridNEWS_PICS.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuNEWS_PICSPASTE_Click()
On Error Resume Next
   If treeWEBS_NEWS.SelectedItem Is Nothing Then Exit Sub
   Dim gu As Object
   Set gu = Item.FindRowObject("WEBS_NEWS", Left(treeWEBS_NEWS.SelectedItem.key, 38))
   Dim u As Object
   Set u = gu.NEWS_PICS.Add()
    If GetFromBuffer(u) Then
      gridNEWS_PICS.ItemCount = u.Parent.Count
    Else
      gu.NEWS_PICS.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridNEWS_PICS_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdNEWS_PICSCfg_Click
        End If
    End If
End Sub

Private Sub gridNEWS_PICS_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupNEWS_PICS
End If
End Sub
Private Sub mnuNEWS_PICSAdd_click()
   menuActionNEWS_PICS = "ADD"
   menuTimerNEWS_PICS.Enabled = True
End Sub
Private Sub mnuNEWS_PICSEdit_click()
   menuActionNEWS_PICS = "EDIT"
   menuTimerNEWS_PICS.Enabled = True
End Sub
Private Sub mnuNEWS_PICSDelete_click()
   menuActionNEWS_PICS = "DEL"
   menuTimerNEWS_PICS.Enabled = True
End Sub
Private Sub mnuNEWS_PICSOpen_click()
   menuActionNEWS_PICS = "RUN"
   menuTimerNEWS_PICS.Enabled = True
End Sub
Private Sub mnuNEWS_PICSRef_click()
   menuActionNEWS_PICS = "REF"
   menuTimerNEWS_PICS.Enabled = True
End Sub
  Private Sub mnuNEWS_PICSCOPY_Click()
    On Error Resume Next
    If gridNEWS_PICS.ItemCount = 0 Then Exit Sub
    If gridNEWS_PICS.Row > 0 Then
     If gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridNEWS_PICS.RowBookmark(gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuNEWS_PICSCUT_Click()
    On Error Resume Next
    If gridNEWS_PICS.ItemCount = 0 Then Exit Sub
    If gridNEWS_PICS.Row > 0 Then
     If gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridNEWS_PICS.RowBookmark(gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridNEWS_PICS.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuNEWS_PICSCHANGE_Click()
  On Error Resume Next
  If gridNEWS_PICS.ItemCount = 0 Then Exit Sub
  If gridNEWS_PICS.Row > 0 Then
   If gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridNEWS_PICS.RowBookmark(gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridNEWS_PICS.ItemCount = u.Parent.Count
      gridNEWS_PICS.RefreshRowIndex gridNEWS_PICS.RowIndex(gridNEWS_PICS.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuNEWS_PICSCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuNEWS_PICSPrn_click()
   menuActionNEWS_PICS = "PRN"
   menuTimerNEWS_PICS.Enabled = True
End Sub
Private Sub mnuNEWS_PICSCfg_click()
   menuActionNEWS_PICS = "CFG"
   menuTimerNEWS_PICS.Enabled = True
End Sub
Private Sub mnuNEWS_PICSFind_click()
   menuActionNEWS_PICS = "FND"
   menuTimerNEWS_PICS.Enabled = True
End Sub
Private Sub mnuNEWS_PICSAcc_click()
   menuActionNEWS_PICS = "ACC"
   menuTimerNEWS_PICS.Enabled = True
End Sub
Private Sub menuTimerNEWS_PICS_timer()
   menuTimerNEWS_PICS.Enabled = False
   If menuActionNEWS_PICS = "ADD" Then cmdNEWS_PICSAdd_Click
   If menuActionNEWS_PICS = "EDIT" Then cmdNEWS_PICSEdit_Click
   If menuActionNEWS_PICS = "DEL" Then cmdNEWS_PICSDel_Click
   If menuActionNEWS_PICS = "RUN" Then cmdNEWS_PICSRun_Click
   If menuActionNEWS_PICS = "REF" Then cmdNEWS_PICSRef_Click
   If menuActionNEWS_PICS = "PRN" Then cmdNEWS_PICSPrn_Click
   If menuActionNEWS_PICS = "CFG" Then cmdNEWS_PICSCfg_Click
   If menuActionNEWS_PICS = "FND" Then cmdNEWS_PICSFnd_Click
   If menuActionNEWS_PICS = "ACC" Then cmdNEWS_PICSAcc_Click
   menuActionNEWS_PICS = ""
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

  LoadBtnPictures cmdWEBS_NEWSAddRoot, cmdWEBS_NEWSAddRoot.Tag
  LoadBtnPictures cmdWEBS_NEWSAdd, cmdWEBS_NEWSAdd.Tag
  LoadBtnPictures cmdWEBS_NEWSEdit, cmdWEBS_NEWSEdit.Tag
  LoadBtnPictures cmdWEBS_NEWSDel, cmdWEBS_NEWSDel.Tag
  LoadBtnPictures cmdWEBS_NEWSRef, cmdWEBS_NEWSRef.Tag
  LoadBtnPictures cmdWEBS_NEWSAcc, cmdWEBS_NEWSAcc.Tag
Item.WEBS_NEWS.filltree treeWEBS_NEWS
  LoadBtnPictures cmdNEWS_PICSAdd, cmdNEWS_PICSAdd.Tag
  LoadBtnPictures cmdNEWS_PICSEdit, cmdNEWS_PICSEdit.Tag
  LoadBtnPictures cmdNEWS_PICSDel, cmdNEWS_PICSDel.Tag
  LoadBtnPictures cmdNEWS_PICSRef, cmdNEWS_PICSRef.Tag
  LoadBtnPictures cmdNEWS_PICSPrn, cmdNEWS_PICSPrn.Tag
  LoadBtnPictures cmdNEWS_PICSFnd, cmdNEWS_PICSFnd.Tag
  LoadBtnPictures cmdNEWS_PICSCfg, cmdNEWS_PICSCfg.Tag
  LoadBtnPictures cmdNEWS_PICSRun, cmdNEWS_PICSRun.Tag
  LoadBtnPictures cmdNEWS_PICSAcc, cmdNEWS_PICSAcc.Tag
  gridNEWS_PICS.Columns.Clear
  gridNEWS_PICS.ItemCount = 0
  cmdNEWS_PICSRef_Click
End Sub

'Действие при активизации таба
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnTabClick()
Private Sub OnTabClick()

pnlWEBS_NEWS.RestorePosition
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
  pnlWEBS_NEWS.Move 0, 0, UserControl.Width, UserControl.Height
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
  Set fndNEWS_PICS = Nothing
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





