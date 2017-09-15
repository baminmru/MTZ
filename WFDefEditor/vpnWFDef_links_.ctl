VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWFDef_links_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFDef_linkres 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerWFDef_links 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.HFrames pnlWFDef_links 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      Begin GridEX20.GridEX gridWFDef_links 
         Height          =   1680
         Left            =   3120
         TabIndex        =   20
         Top             =   1800
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   2963
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
         Column(1)       =   "vpnWFDef_links_.ctx":0000
         Column(2)       =   "vpnWFDef_links_.ctx":00C8
         FormatStylesCount=   6
         FormatStyle(1)  =   "vpnWFDef_links_.ctx":016C
         FormatStyle(2)  =   "vpnWFDef_links_.ctx":024C
         FormatStyle(3)  =   "vpnWFDef_links_.ctx":03A8
         FormatStyle(4)  =   "vpnWFDef_links_.ctx":0458
         FormatStyle(5)  =   "vpnWFDef_links_.ctx":050C
         FormatStyle(6)  =   "vpnWFDef_links_.ctx":05E4
         ImageCount      =   0
         PrinterProperties=   "vpnWFDef_links_.ctx":069C
      End
      Begin GridEX20.GridEX gridWFDef_linkres 
         Height          =   1680
         Left            =   480
         TabIndex        =   19
         Top             =   1440
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   2963
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
         Column(1)       =   "vpnWFDef_links_.ctx":0874
         Column(2)       =   "vpnWFDef_links_.ctx":093C
         FormatStylesCount=   6
         FormatStyle(1)  =   "vpnWFDef_links_.ctx":09E0
         FormatStyle(2)  =   "vpnWFDef_links_.ctx":0AC0
         FormatStyle(3)  =   "vpnWFDef_links_.ctx":0C1C
         FormatStyle(4)  =   "vpnWFDef_links_.ctx":0CCC
         FormatStyle(5)  =   "vpnWFDef_links_.ctx":0D80
         FormatStyle(6)  =   "vpnWFDef_links_.ctx":0E58
         ImageCount      =   0
         PrinterProperties=   "vpnWFDef_links_.ctx":0F10
      End
      Begin VB.CommandButton cmdWFDef_linkresAcc 
         Height          =   330
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   18
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   480
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdWFDef_linkresRun 
         Height          =   330
         Left            =   2760
         TabIndex        =   17
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   480
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdWFDef_linkresFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   16
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   480
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   15
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   480
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresPrn 
         Height          =   330
         Left            =   1560
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   480
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   13
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   480
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   480
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   11
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   480
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   480
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linksAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdWFDef_linksRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   8
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdWFDef_linksFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linksCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linksPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linksRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linksDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linksEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linksAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   1
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
   End
   Begin VB.Menu mnuPopupWFDef_links 
      Caption         =   "Меню для Переходы"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDef_linksAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDef_linksEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDef_linksDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDef_linksOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDef_linksRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDef_linksS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDef_linksBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDef_linksCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDef_linksCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDef_linksPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDef_linksCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDef_linksCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDef_linksPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDef_linksCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDef_linksFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFDef_linksAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWFDef_linkres 
      Caption         =   "Меню для Допустимые результаты"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDef_linkresAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDef_linkresEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDef_linkresDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDef_linkresOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDef_linkresRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDef_linkresS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDef_linkresBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDef_linkresCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDef_linkresCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDef_linkresPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDef_linkresCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDef_linkresCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDef_linkresPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDef_linkresCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDef_linkresFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFDef_linkresAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWFDef_links_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFDef_links As Object
Private menuActionWFDef_links As String
Private fndWFDef_linkres As Object
Private menuActionWFDef_linkres As String



Private Sub gridWFDef_links_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFDef_links
End If
End Sub

Private Sub gridWFDef_links_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
  item.WFDef_links.LoadRow gridWFDef_links, RowIndex, Bookmark, Values
End Sub

Private Sub mnuWFDef_linksAdd_click()
   menuActionWFDef_links = "ADD"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksEdit_click()
   menuActionWFDef_links = "EDIT"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksDelete_click()
   menuActionWFDef_links = "DEL"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksOpen_click()
   menuActionWFDef_links = "RUN"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksRef_click()
   menuActionWFDef_links = "REF"
   menuTimerWFDef_links.Enabled = True
End Sub
  Private Sub mnuWFDef_linksCOPY_Click()
    On Error Resume Next
    If gridWFDef_links.ItemCount = 0 Then Exit Sub
    If gridWFDef_links.Row > 0 Then
     If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDef_linksCUT_Click()
    On Error Resume Next
    If gridWFDef_links.ItemCount = 0 Then Exit Sub
    If gridWFDef_links.Row > 0 Then
     If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDef_links.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDef_linksCHANGE_Click()
  On Error Resume Next
  If gridWFDef_links.ItemCount = 0 Then Exit Sub
  If gridWFDef_links.Row > 0 Then
   If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDef_links.ItemCount = u.Parent.Count
      gridWFDef_links.RefreshRowIndex gridWFDef_links.RowIndex(gridWFDef_links.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDef_linksCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDef_linksPrn_click()
   menuActionWFDef_links = "PRN"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksCfg_click()
   menuActionWFDef_links = "CFG"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksFind_click()
   menuActionWFDef_links = "FND"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksAcc_click()
   menuActionWFDef_links = "ACC"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub menuTimerWFDef_links_timer()
   menuTimerWFDef_links.Enabled = False
   If menuActionWFDef_links = "ADD" Then cmdWFDef_linksAdd_Click
   If menuActionWFDef_links = "EDIT" Then cmdWFDef_linksEdit_Click
   If menuActionWFDef_links = "DEL" Then cmdWFDef_linksDel_Click
   If menuActionWFDef_links = "RUN" Then cmdWFDef_linksRun_Click
   If menuActionWFDef_links = "REF" Then cmdWFDef_linksRef_Click
   If menuActionWFDef_links = "PRN" Then cmdWFDef_linksPrn_Click
   If menuActionWFDef_links = "CFG" Then cmdWFDef_linksCfg_Click
   If menuActionWFDef_links = "FND" Then cmdWFDef_linksFnd_Click
   If menuActionWFDef_links = "ACC" Then cmdWFDef_linksAcc_Click
   menuActionWFDef_links = ""
End Sub
Private Sub cmdWFDef_linksCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDef_links, "gridWFDef_links"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_linksPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDef_links, "Переходы"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_linksRef_Click()
  On Error Resume Next
  item.WFDef_links.Refresh
  gridWFDef_links.ItemCount = item.WFDef_links.Count
  gridWFDef_links.Refetch
  gridWFDef_links.Refresh
End Sub
Private Sub cmdWFDef_linksAcc_Click()
On Error Resume Next
If gridWFDef_links.ItemCount = 0 Then Exit Sub
If gridWFDef_links.Row > 0 Then
 If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDef_linksEdit_Click()
  On Error Resume Next
If gridWFDef_links.ItemCount = 0 Then Exit Sub
If gridWFDef_links.Row > 0 Then
 If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFDef_links_.item = u
again:     frmWFDef_links_.NotFirstTime = False
    frmWFDef_links_.OnInit
    frmWFDef_links_.Show vbModal
    If frmWFDef_links_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDef_links.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFDef_linksDel_Click()
  On Error Resume Next
  gridWFDef_links.Delete
End Sub
Private Sub cmdWFDef_linksAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.WFDef_links.Add()

      Set frmWFDef_links_.item = u
again:       frmWFDef_links_.NotFirstTime = False
      frmWFDef_links_.OnInit
      frmWFDef_links_.Show vbModal
      If frmWFDef_links_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFDef_links.ItemCount = item.WFDef_links.Count
        gridWFDef_links.Refresh
        gridWFDef_links.RefreshGroups
        gridWFDef_links.RefreshSort
        gridWFDef_links.MoveToBookmark u.ID & "WFDef_links"
      Else
        item.WFDef_links.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFDef_linksFnd_Click()
  On Error Resume Next
  fndWFDef_links.ShowForm
End Sub
Private Sub cmdWFDef_linksRun_Click()
  On Error Resume Next
  gridWFDef_links_DblClick
End Sub

Private Sub gridWFDef_links_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridWFDef_links.ItemCount = 0 Then Exit Sub
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
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridWFDef_links_DblClick()
  cmdWFDef_linksEdit_Click
End Sub
Private Sub gridWFDef_links_KeyPress(KeyAscii As Integer)
  If gridWFDef_links.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDef_links.FindOnPress KeyAscii
End Sub

Private Sub pnlWFDef_links_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridWFDef_links.Left = Left
  gridWFDef_links.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWFDef_links.Width = Width
  gridWFDef_links.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWFDef_linksAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWFDef_linksEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWFDef_linksDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWFDef_linksRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWFDef_linksPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWFDef_linksCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWFDef_linksFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWFDef_linksRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWFDef_linksAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuWFDef_linksPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.WFDef_links.Add()
    If GetFromBuffer(u) Then
      gridWFDef_links.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdWFDef_linkresCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDef_linkres, "gridWFDef_linkres"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_linkresPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDef_linkres, "Допустимые результаты"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_linkresAcc_Click()
On Error Resume Next
If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
If gridWFDef_linkres.Row > 0 Then
 If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDef_linkresFnd_Click()
  On Error Resume Next
  fndWFDef_linkres.ShowForm
End Sub
Private Sub cmdWFDef_linkresRun_Click()
  On Error Resume Next
  gridWFDef_linkres_DblClick
End Sub
Private Sub pnlWFDef_links_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridWFDef_linkres.Left = Left
  gridWFDef_linkres.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWFDef_linkres.Width = Width
  gridWFDef_linkres.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWFDef_linkresAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWFDef_linkresEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWFDef_linkresDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWFDef_linkresRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWFDef_linkresPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWFDef_linkresCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWFDef_linkresFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWFDef_linkresRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWFDef_linkresAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdWFDef_linkresRef_Click()
  On Error Resume Next
If gridWFDef_links.ItemCount = 0 Then Exit Sub
If gridWFDef_links.Row > 0 Then
 If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFDef_linkres.Refresh
   gridWFDef_linkres.ItemCount = gu.WFDef_linkres.Count
   gridWFDef_linkres.Refetch
   gridWFDef_linkres.Refresh
 Else
  gridWFDef_linkres.Columns.Clear
  gridWFDef_linkres.ItemCount = 0
 End If
Else
 gridWFDef_linkres.Columns.Clear
 gridWFDef_linkres.ItemCount = 0
End If
End Sub
Private Sub cmdWFDef_linkresEdit_Click()
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
    Set u = item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmWFDef_linkres_.item = u
again:     frmWFDef_linkres_.NotFirstTime = False
    frmWFDef_linkres_.OnInit
    frmWFDef_linkres_.Show vbModal
    If frmWFDef_linkres_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDef_linkres.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdWFDef_linkresDel_Click()
  On Error Resume Next
  gridWFDef_linkres.Delete
End Sub
Private Sub cmdWFDef_linkresAdd_Click()
  On Error Resume Next
If gridWFDef_links.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.WFDef_linkres.Add()

    Set frmWFDef_linkres_.item = u
again:     frmWFDef_linkres_.NotFirstTime = False
    frmWFDef_linkres_.OnInit
    frmWFDef_linkres_.Show vbModal
    If frmWFDef_linkres_.OK Then
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
      GoTo again
    End If

        gridWFDef_linkres.ItemCount = gu.WFDef_linkres.Count
        gridWFDef_linkres.Refresh
        gridWFDef_linkres.RefreshGroups
        gridWFDef_linkres.RefreshSort
    Else
        u.Parent.Remove u.ID
    End If
    Set u = Nothing
    Set gu = Nothing
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridWFDef_links_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridWFDef_links.ItemCount = 0 Then Exit Sub
If gridWFDef_links.Row > 0 Then
  If LastRow <> gridWFDef_links.Row And LastRow > 0 Then
    gridWFDef_links.GetRowData(LastRow).RowStyle = "Default"
    gridWFDef_links.GetRowData(gridWFDef_links.Row).RowStyle = "SelectedRow"
  End If
 If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
  If LastRow <> gridWFDef_links.Row Or gridWFDef_linkres.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFDef_linkres.PrepareGrid gridWFDef_linkres
    LoadGridLayout gridWFDef_linkres
    Set fndWFDef_linkres = Nothing
    Set fndWFDef_linkres = CreateObject("MTZ_JSetup.GridFinder")
    fndWFDef_linkres.Init gridWFDef_linkres
  End If
 End If
End If
End Sub
Private Sub gridWFDef_linkres_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
    If gridWFDef_links.ItemCount = 0 Then Exit Sub
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFDef_linkres.LoadRow gridWFDef_linkres, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridWFDef_linkres_KeyPress(KeyAscii As Integer)
  If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDef_linkres.FindOnPress KeyAscii
End Sub

Private Sub gridWFDef_linkres_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
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
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub gridWFDef_linkres_DblClick()
    cmdWFDef_linkresEdit_Click
End Sub
Private Sub gridWFDef_linkres_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
 If gridWFDef_linkres.Row > 0 Then
   If LastRow <> gridWFDef_linkres.Row And LastRow > 0 Then
     gridWFDef_linkres.GetRowData(LastRow).RowStyle = "Default"
     gridWFDef_linkres.GetRowData(gridWFDef_linkres.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuWFDef_linkresPASTE_Click()
On Error Resume Next
    If gridWFDef_links.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set gu = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.WFDef_linkres.Add()
    If GetFromBuffer(u) Then
      gridWFDef_linkres.ItemCount = u.Parent.Count
    Else
      gu.WFDef_linkres.Refresh
    End If
    Set gu = Nothing
End Sub
Private Sub gridWFDef_linkres_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFDef_linkres
End If
End Sub
Private Sub mnuWFDef_linkresAdd_click()
   menuActionWFDef_linkres = "ADD"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresEdit_click()
   menuActionWFDef_linkres = "EDIT"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresDelete_click()
   menuActionWFDef_linkres = "DEL"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresOpen_click()
   menuActionWFDef_linkres = "RUN"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresRef_click()
   menuActionWFDef_linkres = "REF"
   menuTimerWFDef_linkres.Enabled = True
End Sub
  Private Sub mnuWFDef_linkresCOPY_Click()
    On Error Resume Next
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    If gridWFDef_linkres.Row > 0 Then
     If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDef_linkresCUT_Click()
    On Error Resume Next
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    If gridWFDef_linkres.Row > 0 Then
     If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDef_linkres.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDef_linkresCHANGE_Click()
  On Error Resume Next
  If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
  If gridWFDef_linkres.Row > 0 Then
   If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDef_linkres.ItemCount = u.Parent.Count
      gridWFDef_linkres.RefreshRowIndex gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDef_linkresCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDef_linkresPrn_click()
   menuActionWFDef_linkres = "PRN"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresCfg_click()
   menuActionWFDef_linkres = "CFG"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresFind_click()
   menuActionWFDef_linkres = "FND"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresAcc_click()
   menuActionWFDef_linkres = "ACC"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub menuTimerWFDef_linkres_timer()
   menuTimerWFDef_linkres.Enabled = False
   If menuActionWFDef_linkres = "ADD" Then cmdWFDef_linkresAdd_Click
   If menuActionWFDef_linkres = "EDIT" Then cmdWFDef_linkresEdit_Click
   If menuActionWFDef_linkres = "DEL" Then cmdWFDef_linkresDel_Click
   If menuActionWFDef_linkres = "RUN" Then cmdWFDef_linkresRun_Click
   If menuActionWFDef_linkres = "REF" Then cmdWFDef_linkresRef_Click
   If menuActionWFDef_linkres = "PRN" Then cmdWFDef_linkresPrn_Click
   If menuActionWFDef_linkres = "CFG" Then cmdWFDef_linkresCfg_Click
   If menuActionWFDef_linkres = "FND" Then cmdWFDef_linkresFnd_Click
   If menuActionWFDef_linkres = "ACC" Then cmdWFDef_linkresAcc_Click
   menuActionWFDef_linkres = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFDef_linksAdd, cmdWFDef_linksAdd.Tag
  LoadBtnPictures cmdWFDef_linksEdit, cmdWFDef_linksEdit.Tag
  LoadBtnPictures cmdWFDef_linksDel, cmdWFDef_linksDel.Tag
  LoadBtnPictures cmdWFDef_linksRef, cmdWFDef_linksRef.Tag
  LoadBtnPictures cmdWFDef_linksCfg, cmdWFDef_linksCfg.Tag
  LoadBtnPictures cmdWFDef_linksPrn, cmdWFDef_linksPrn.Tag
  LoadBtnPictures cmdWFDef_linksFnd, cmdWFDef_linksFnd.Tag
  LoadBtnPictures cmdWFDef_linksRun, cmdWFDef_linksRun.Tag
  LoadBtnPictures cmdWFDef_linksAcc, cmdWFDef_linksAcc.Tag
  item.WFDef_links.PrepareGrid gridWFDef_links
  LoadGridLayout gridWFDef_links
  Set fndWFDef_links = Nothing
  On Error Resume Next
  Set fndWFDef_links = CreateObject("MTZ_JSetup.GridFinder")
  fndWFDef_links.Init gridWFDef_links
  LoadBtnPictures cmdWFDef_linkresAdd, cmdWFDef_linkresAdd.Tag
  LoadBtnPictures cmdWFDef_linkresEdit, cmdWFDef_linkresEdit.Tag
  LoadBtnPictures cmdWFDef_linkresDel, cmdWFDef_linkresDel.Tag
  LoadBtnPictures cmdWFDef_linkresRef, cmdWFDef_linkresRef.Tag
  LoadBtnPictures cmdWFDef_linkresPrn, cmdWFDef_linkresPrn.Tag
  LoadBtnPictures cmdWFDef_linkresCfg, cmdWFDef_linkresCfg.Tag
  LoadBtnPictures cmdWFDef_linkresFnd, cmdWFDef_linkresFnd.Tag
  LoadBtnPictures cmdWFDef_linkresRun, cmdWFDef_linkresRun.Tag
  LoadBtnPictures cmdWFDef_linkresAcc, cmdWFDef_linkresAcc.Tag
  gridWFDef_linkres.Columns.Clear
  gridWFDef_linkres.ItemCount = 0
End Sub
Private Sub OnTabClick()

pnlWFDef_links.SizeControls pnlWFDef_links.Height / 2
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
Private Sub Usercontrol_resize()
  On Error Resume Next
  pnlWFDef_links.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndWFDef_links = Nothing
  Set fndWFDef_linkres = Nothing
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

  RowItem.Person.Secure item.SecureStyleID
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для  каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
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

End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
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
item.Name = RowItem.Description
ParentForm.Caption = item.Name
item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
item.Name = RowItem.Name
ParentForm.Caption = item.Name
item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
item.Name = Name
ParentForm.Caption = item.Name
item.Save
End Sub



