VERSION 5.00
Object = "{8408294B-9E97-428D-999B-82C43BF0BFFA}#2.4#0"; "JWRAP.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.5#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmWFDic__main 
   Caption         =   "Справочник сервиса процессов"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
   Begin VB.Timer menuTimerWFDic_presets 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Timer menuTimerWFDic_func 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin MSComctlLib.TabStrip ts 
      Height          =   1500
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   1
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin MTZ_PANEL.HFrames pnlWFDic_func 
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
      Begin VB.CommandButton cmdWFDic_presetsAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   21
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdWFDic_presetsRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   20
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdWFDic_presetsFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   19
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDic_presetsCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   18
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDic_presetsPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   17
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
         TabIndex        =   16
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
         TabIndex        =   15
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
         TabIndex        =   14
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
         TabIndex        =   13
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFDic_presets 
         Height          =   480
         Left            =   150
         TabIndex        =   12
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin VB.CommandButton cmdWFDic_funcAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   11
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdWFDic_funcRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   10
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdWFDic_funcFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDic_funcCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   8
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDic_funcPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   7
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
         TabIndex        =   6
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
         TabIndex        =   5
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
         TabIndex        =   4
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
         TabIndex        =   3
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFDic_func 
         Height          =   480
         Left            =   150
         TabIndex        =   2
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "Файл"
      Begin VB.Menu mnuSaveAsXML 
         Caption         =   "Сохранить в формате XML"
      End
      Begin VB.Menu mnuLoadFromXML 
         Caption         =   "Загрузить из XML"
      End
      Begin VB.Menu mnuSecure 
         Caption         =   "Стиль защиты"
      End
      Begin VB.Menu mnuLock 
         Caption         =   "Заблокировать"
      End
      Begin VB.Menu mnuUnlock 
         Caption         =   "Разблокировать"
      End
      Begin VB.Menu mnuRename 
         Caption         =   "Переименовать"
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Выход"
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
      Begin VB.Menu mnuWFDic_funcAcc 
         Caption         =   "Стиль защиты"
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
      Begin VB.Menu mnuWFDic_presetsAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "frmWFDic__main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Item As Object
Public Host As GUI
Public ModalMode As Boolean
Private fndWFDic_func As Object
Private menuActionWFDic_func As String
Private fndWFDic_presets As Object
Private menuActionWFDic_presets As String


Private Sub SaveToBuffer(u As Object)
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      xdom.loadXML "<I></I>"
      u.XMLSave xdom.lastChild, xdom
      Item.Manager.SetBuffer u.PartName, xdom.xml
      Set xdom = Nothing
End Sub

Private Function GetFromBuffer(u As Object) As Boolean
      On Error GoTo bye
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      GetFromBuffer = False
      If Item.Manager.GetBuffer(u.PartName) <> "" Then
        xdom.loadXML Item.Manager.GetBuffer(u.PartName)
        u.XMLLoad xdom.lastChild, 2
        u.BatchUpdate
        GetFromBuffer = True
      Else
        MsgBox "Буфер данных для этого раздела пуст", vbInformation
      End If
    Exit Function
bye:
    MsgBox Err.Description, vbCritical
End Function
Private Sub mnuSaveAsXML_Click()
  On Error Resume Next
 If Item.Application.MTZSession.CheckRight(Item.SecureStyleid, "XMLSAVE") Then
   Item.LockResource True
   Item.LoadAll
   Item.WorkOffline = True
   Dim xdom As MSXML2.DOMDocument
   Set xdom = New MSXML2.DOMDocument
   xdom.loadXML "<root></root>"
   Item.XMLSave xdom.lastChild, xdom
   xdom.Save App.Path & "\" & Item.ID & ".xml"
   Item.WorkOffline = False
 End If
End Sub
Private Sub mnuSecure_Click()
  On Error Resume Next
  Item.Application.Manager.ShowSecurityDialog Item
End Sub
Private Sub mnuUnlock_Click()
  On Error Resume Next
  If Item.IsLocked Then
    Item.UnlockResource
  Else
  MsgBox "Объект не заблокирован", vbInformation
  End If
End Sub
Private Sub mnuLock_Click()
  On Error Resume Next
    Item.LockResource True
End Sub
Private Sub mnuRename_Click()
  On Error Resume Next
  Dim n As String
  n = InputBox("Новое название", "Переименовать", Item.Name)
  If n <> "" And n <> Item.Name Then
    Item.Name = n
    Item.Save
    Me.Caption = Item.Name
  End If
End Sub
Private Sub mnuExit_Click()
  On Error Resume Next
  Unload Me
End Sub
Private Sub mnuDelete_Click()
  On Error GoTo bye
  If MsgBox("Удалить документ?", vbQuestion + vbYesNo) = vbYes Then
    Item.UnlockResource
    Item.WorkOffline = False
    Item.Manager.DeleteInstance Item.ID
    Item.Manager.FreeInstanceObject Item.ID
    Unload Me
  End If
  Exit Sub
bye:
   MsgBox Err.Description, vbCritical, "Ошибка при удалении"
End Sub
Private Sub mnuLoadFromXML_Click()
 On Error Resume Next
 If Item.Application.MTZSession.CheckRight(Item.SecureStyleid, "XMLLOAD") Then
  Dim xdom As MSXML2.DOMDocument
  Set xdom = New MSXML2.DOMDocument
  xdom.Load App.Path & "\" & Item.ID & ".xml"
  Item.XMLLoad xdom.lastChild, 1
  Item.WorkOffline = False
  Item.BatchUpdate
  Set xdom = Nothing
 End If
End Sub
Private Sub gridWFDic_func_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
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
  gridWFDic_func_JWDblClick
End Sub
Private Sub gridWFDic_func_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFDic_func.LoadRow gridWFDic_func, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFDic_func_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
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
Private Sub gridWFDic_func_JWDblClick()
  cmdWFDic_funcEdit_Click
End Sub
Private Sub gridWFDic_func_JWKeyPress(KeyAscii As Integer)
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
   cmdWFDic_funcCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_funcFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_funcRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_funcAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_funcAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWFDic_funcEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWFDic_funcDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWFDic_funcRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWFDic_funcPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWFDic_funcCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWFDic_funcFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWFDic_funcRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWFDic_funcAcc.Left = Left + 205 * Screen.TwipsPerPixelX
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
  gridWFDic_presets_JWDblClick
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
   cmdWFDic_presetsCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_presetsFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_presetsRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_presetsAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDic_presetsAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWFDic_presetsEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWFDic_presetsDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWFDic_presetsRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWFDic_presetsPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWFDic_presetsCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWFDic_presetsFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWFDic_presetsRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWFDic_presetsAcc.Left = Left + 205 * Screen.TwipsPerPixelX
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
If gridWFDic_func.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.WFDic_presets.Add()

    Set frmWFDic_presets_.Item = u
again:     frmWFDic_presets_.NotFirstTime = False
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
Private Sub gridWFDic_func_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridWFDic_func.ItemCount = 0 Then Exit Sub
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
    LoadGridLayout gridWFDic_presets
    Set fndWFDic_presets = Nothing
    Set fndWFDic_presets = CreateObject("MTZ_JSetup.GridFinder")
    fndWFDic_presets.Init gridWFDic_presets
  End If
 End If
End If
End Sub
Private Sub gridWFDic_presets_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
    If gridWFDic_func.ItemCount = 0 Then Exit Sub
    If gridWFDic_presets.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFDic_func.RowBookmark(gridWFDic_func.RowIndex(gridWFDic_func.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFDic_presets.LoadRow gridWFDic_presets, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridWFDic_presets_JWKeyPress(KeyAscii As Integer)
  If gridWFDic_presets.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDic_presets.FindOnPress KeyAscii
End Sub

Private Sub gridWFDic_presets_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
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
Private Sub gridWFDic_presets_JWDblClick()
    cmdWFDic_presetsEdit_Click
End Sub
Private Sub gridWFDic_presets_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
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
Private Sub gridWFDic_presets_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
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
Private Sub ts_click()
  On Error Resume Next
  pnlWFDic_func.Visible = False

   Select Case ts.SelectedItem.Key
   Case "WFDic_func"
     With pnlWFDic_func
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     .SizeControls ts.ClientHeight / 2
     End With
     End Select
End Sub
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean)
 Set Item = ObjItem
 Set Host = MyHost
 ModalMode = aModalMode
End Sub
Private Sub Form_Load()
  On Error Resume Next
  Me.Caption = Item.Brief
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "Типы функций"
ts.Tabs.Item(1).Key = "WFDic_func"
  LoadBtnPictures cmdWFDic_funcAdd, cmdWFDic_funcAdd.Tag
  LoadBtnPictures cmdWFDic_funcEdit, cmdWFDic_funcEdit.Tag
  LoadBtnPictures cmdWFDic_funcDel, cmdWFDic_funcDel.Tag
  LoadBtnPictures cmdWFDic_funcRef, cmdWFDic_funcRef.Tag
  LoadBtnPictures cmdWFDic_funcCfg, cmdWFDic_funcCfg.Tag
  LoadBtnPictures cmdWFDic_funcPrn, cmdWFDic_funcPrn.Tag
  LoadBtnPictures cmdWFDic_funcFnd, cmdWFDic_funcFnd.Tag
  LoadBtnPictures cmdWFDic_funcRun, cmdWFDic_funcRun.Tag
  LoadBtnPictures cmdWFDic_funcAcc, cmdWFDic_funcAcc.Tag
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
  LoadBtnPictures cmdWFDic_presetsCfg, cmdWFDic_presetsCfg.Tag
  LoadBtnPictures cmdWFDic_presetsFnd, cmdWFDic_presetsFnd.Tag
  LoadBtnPictures cmdWFDic_presetsRun, cmdWFDic_presetsRun.Tag
  LoadBtnPictures cmdWFDic_presetsAcc, cmdWFDic_presetsAcc.Tag
  gridWFDic_presets.Columns.Clear
  gridWFDic_presets.ItemCount = 0
  LoadFromSkin Me
End Sub
Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  If Not Item Is Nothing Then
    If Not Item.Manager Is Nothing Then
      Item.BatchUpdate
    End If
  End If
  If Not Host Is Nothing Then
   Host.EraseForm Item.ID, "", ModalMode
  End If
  Set Item = Nothing
  Set Host = Nothing
  SaveToSkin Me
End Sub
Private Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
ts.Top = 0
ts.Left = 0
ts.Width = Me.ScaleWidth
ts.Height = Me.ScaleHeight
ts_click
End Sub
Private Function FormByName(ByVal Name As String) As Form

If Name = "WFDic_func" Then
 Set FormByName = New frmWFDic_func_
 Exit Function
End If

If Name = "WFDic_presets" Then
 Set FormByName = New frmWFDic_presets_
 Exit Function
End If

End Function
Private Sub LoadFromSkin(frm As Form)
  On Error Resume Next
  Dim s As String, arr() As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  Dim ff As Long, buf As String
  ff = FreeFile
  Open s & frm.Name For Input As #ff
  buf = Input(LOF(ff), ff)
  Close #ff
  arr = Split(buf, vbCrLf)
  Dim arr2() As String, i As Long
For i = 0 To UBound(arr)
  arr2 = Split(arr(i), ":")
  Select Case arr2(0)
  Case "FormTag"
    frm.Tag = arr2(1)
  Case "FormTop"
    frm.Top = arr2(1)
  Case "FormLeft"
    frm.Left = arr2(1)
  Case "FormWidth"
    frm.Width = arr2(1)
  Case "FormHeight"
    frm.Height = arr2(1)
  Case Else
    frm.Controls(arr2(0)).Tag = Val(arr2(1))
  End Select
Next
  s = ""
  s = GetSetting("MTZ", "CONFIG", "IMAGEPATH", "")
  If s = "" Then Exit Sub
  Set frm.Icon = LoadPicture(s & frm.Tag)
End Sub

Private Sub SaveToSkin(frm As Form)
  On Error Resume Next
  Dim s As String, buf As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  frm.WindowState = 0
  Dim ff As Long
  ff = FreeFile
  Kill s & frm.Name
  Open s & frm.Name For Output As #ff
  buf = "FormTag:" & frm.Tag
  buf = buf & vbCrLf & "FormTop:" & frm.Top
  buf = buf & vbCrLf & "FormLeft:" & frm.Left
  buf = buf & vbCrLf & "FormWidth:" & frm.Width
  buf = buf & vbCrLf & "FormHeight:" & frm.Height
buf = buf & vbCrLf & "pnlWFDic_func:" & pnlWFDic_func.SpliterPosition
  Print #ff, buf
  Close #ff
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
  RowItem.Person.propagate
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
  RowItem.Client.propagate
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
Item.Name = RowItem.Description
Me.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
Item.Name = RowItem.Name
Me.Caption = Item.Name
Item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
Item.Name = Name
Me.Caption = Item.Name
Item.Save
End Sub



