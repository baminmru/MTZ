VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl vpnPEKD_TRFGRP_admi 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKD_TRFTYPE 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Timer menuTimerPEKD_TRFGRP 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin MTZ_PANEL.VFrames pnlPEKD_TRFGRP 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
      SpliterPosition =   1500
      Begin VB.CommandButton cmdPEKD_TRFTYPEAcc 
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
      Begin MTZ_PANEL.DropButton cmdPEKD_TRFTYPERun 
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
      Begin VB.CommandButton cmdPEKD_TRFTYPEFnd 
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
      Begin VB.CommandButton cmdPEKD_TRFTYPECfg 
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
      Begin VB.CommandButton cmdPEKD_TRFTYPEPrn 
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
      Begin VB.CommandButton cmdPEKD_TRFTYPERef 
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
      Begin VB.CommandButton cmdPEKD_TRFTYPEDel 
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
      Begin VB.CommandButton cmdPEKD_TRFTYPEEdit 
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
      Begin VB.CommandButton cmdPEKD_TRFTYPEAdd 
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
      Begin GridEX20.GridEX gridPEKD_TRFTYPE 
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
         Column(1)       =   "vpnPEKD_TRFGRP_admi.ctx":0000
         Column(2)       =   "vpnPEKD_TRFGRP_admi.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKD_TRFGRP_admi.ctx":016C
         FormatStyle(2)  =   "vpnPEKD_TRFGRP_admi.ctx":02C8
         FormatStyle(3)  =   "vpnPEKD_TRFGRP_admi.ctx":0378
         FormatStyle(4)  =   "vpnPEKD_TRFGRP_admi.ctx":042C
         FormatStyle(5)  =   "vpnPEKD_TRFGRP_admi.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKD_TRFGRP_admi.ctx":05BC
      End
      Begin VB.CommandButton cmdPEKD_TRFGRPAcc 
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
      Begin VB.CommandButton cmdPEKD_TRFGRPRef 
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
      Begin VB.CommandButton cmdPEKD_TRFGRPDel 
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
      Begin VB.CommandButton cmdPEKD_TRFGRPEdit 
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
      Begin VB.CommandButton cmdPEKD_TRFGRPAdd 
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
      Begin VB.CommandButton cmdPEKD_TRFGRPAddRoot 
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
      Begin MSComctlLib.TreeView treePEKD_TRFGRP 
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
   Begin VB.Menu mnuPopupPEKD_TRFGRP 
      Caption         =   "Меню для Группы тарифов"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKD_TRFGRPAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuPEKD_TRFGRPAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKD_TRFGRPEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKD_TRFGRPDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKD_TRFGRPS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKD_TRFGRPBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKD_TRFGRPCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKD_TRFGRPCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKD_TRFGRPPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKD_TRFGRPCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKD_TRFGRPCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKD_TRFGRPRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKD_TRFGRPAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupPEKD_TRFTYPE 
      Caption         =   "Меню для Типы тарифов"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKD_TRFTYPEAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKD_TRFTYPEEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKD_TRFTYPEDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKD_TRFTYPEOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKD_TRFTYPERef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKD_TRFTYPES1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKD_TRFTYPEBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKD_TRFTYPECOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKD_TRFTYPECUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKD_TRFTYPEPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKD_TRFTYPECHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKD_TRFTYPECLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKD_TRFTYPEPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKD_TRFTYPECfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKD_TRFTYPEFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKD_TRFTYPEAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKD_TRFGRP_admi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private menuActionPEKD_TRFGRP As String
Private fndPEKD_TRFTYPE As Object
Private menuActionPEKD_TRFTYPE As String





Private Sub pnlPEKD_TRFGRP_PositionChanged()
  pnlPEKD_TRFGRP.SavePosition
End Sub
Private Sub treePEKD_TRFGRP_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupPEKD_TRFGRP
End If
End Sub
Private Sub mnuPEKD_TRFGRPAddRoot_click()
   menuActionPEKD_TRFGRP = "ADDROOT"
   menuTimerPEKD_TRFGRP.Enabled = True
End Sub
Private Sub mnuPEKD_TRFGRPAdd_click()
   menuActionPEKD_TRFGRP = "ADD"
   menuTimerPEKD_TRFGRP.Enabled = True
End Sub
Private Sub mnuPEKD_TRFGRPEdit_click()
   menuActionPEKD_TRFGRP = "EDIT"
   menuTimerPEKD_TRFGRP.Enabled = True
End Sub
Private Sub mnuPEKD_TRFGRPDelete_click()
   menuActionPEKD_TRFGRP = "DEL"
   menuTimerPEKD_TRFGRP.Enabled = True
End Sub
  Private Sub mnuPEKD_TRFGRPCOPY_Click()
    On Error Resume Next
    If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuPEKD_TRFGRPCUT_Click()
    On Error Resume Next
    If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, bm
    Set u = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
    SaveToBuffer u
    Set bm = u.Parent
    u.Parent.Delete u.ID
    treePEKD_TRFGRP.Nodes.Remove treePEKD_TRFGRP.SelectedItem.Key
  End Sub
Private Sub mnuPEKD_TRFGRPPASTE_Click()
On Error Resume Next
If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
  Set u = f.PEKD_TRFGRP.Add()
  If GetFromBuffer(u) Then
    If treePEKD_TRFGRP.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treePEKD_TRFGRP, treePEKD_TRFGRP.SelectedItem.Key
    End If
  Else
   f.PEKD_TRFGRP.Refresh
  End If
End Sub
Private Sub mnuPEKD_TRFGRPCHANGE_Click()
  On Error Resume Next
  If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, bm
  Set u = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
  If GetFromBuffer(u) Then
    treePEKD_TRFGRP.SelectedItem.Text = u.brief
      treePEKD_TRFGRP.SelectedItem.Expanded = False
      While treePEKD_TRFGRP.SelectedItem.Children > 0
        treePEKD_TRFGRP.Nodes.Remove treePEKD_TRFGRP.SelectedItem.Child.Key
      Wend
      treePEKD_TRFGRP.Nodes.Add(treePEKD_TRFGRP.SelectedItem.Key, 4, "Expanding ...").Tag = "ToDelete"
      treePEKD_TRFGRP_Expand treePEKD_TRFGRP.SelectedItem
  End If
End Sub
  Private Sub mnuPEKD_TRFGRPCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKD_TRFGRPRef_click()
   menuActionPEKD_TRFGRP = "REF"
   menuTimerPEKD_TRFGRP.Enabled = True
End Sub
Private Sub mnuPEKD_TRFGRPAcc_click()
   menuActionPEKD_TRFGRP = "ACC"
   menuTimerPEKD_TRFGRP.Enabled = True
End Sub
Private Sub menuTimerPEKD_TRFGRP_timer()
   menuTimerPEKD_TRFGRP.Enabled = False
   If menuActionPEKD_TRFGRP = "ADDROOT" Then cmdPEKD_TRFGRPAddRoot_Click
   If menuActionPEKD_TRFGRP = "ADD" Then cmdPEKD_TRFGRPAdd_Click
   If menuActionPEKD_TRFGRP = "EDIT" Then cmdPEKD_TRFGRPEdit_Click
   If menuActionPEKD_TRFGRP = "DEL" Then cmdPEKD_TRFGRPDel_Click
   If menuActionPEKD_TRFGRP = "REF" Then cmdPEKD_TRFGRPREf_Click
   If menuActionPEKD_TRFGRP = "ACC" Then cmdPEKD_TRFGRPAcc_Click
   menuActionPEKD_TRFGRP = ""
End Sub
Private Sub cmdPEKD_TRFGRPAdd_Click()
  On Error Resume Next
  On Error Resume Next
  Dim f As Object, p As Object
If (treePEKD_TRFGRP.SelectedItem Is Nothing) Then Exit Sub
  Set p = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
  Set f = p.PEKD_TRFGRP.Add()

      Set frmPEKD_TRFGRP_admi.Item = f
again:       frmPEKD_TRFGRP_admi.NotFirstTime = False
      frmPEKD_TRFGRP_admi.OnInit
      frmPEKD_TRFGRP_admi.Show vbModal
      If frmPEKD_TRFGRP_admi.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treePEKD_TRFGRP.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treePEKD_TRFGRP, treePEKD_TRFGRP.SelectedItem.Key
          End If
          Set treePEKD_TRFGRP.SelectedItem = treePEKD_TRFGRP.Nodes.Item(f.ID & "PEKD_TRFGRP")
      Else
        Item.PEKD_TRFGRP.Delete f.ID
        Item.PEKD_TRFGRP.Remove f.ID
      End If
End Sub

Private Sub cmdPEKD_TRFGRPAddRoot_Click()
  On Error Resume Next
Dim f As Object, p As Object
  Set f = Item.PEKD_TRFGRP.Add()

      Set frmPEKD_TRFGRP_admi.Item = f
again:       frmPEKD_TRFGRP_admi.NotFirstTime = False
      frmPEKD_TRFGRP_admi.OnInit
      frmPEKD_TRFGRP_admi.Show vbModal
      If frmPEKD_TRFGRP_admi.OK Then
        err.Clear
        f.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
    Item.PEKD_TRFGRP.Refresh
    treePEKD_TRFGRP.Nodes.Clear
    Item.PEKD_TRFGRP.filltree treePEKD_TRFGRP
          Set treePEKD_TRFGRP.SelectedItem = treePEKD_TRFGRP.Nodes.Item(f.ID & "PEKD_TRFGRP")
      Else
        Item.PEKD_TRFGRP.Remove f.ID
      End If
End Sub

Private Sub cmdPEKD_TRFGRPEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
  Set frmPEKD_TRFGRP_admi.Item = f
again:   frmPEKD_TRFGRP_admi.NotFirstTime = False
  frmPEKD_TRFGRP_admi.OnInit
  frmPEKD_TRFGRP_admi.Show vbModal
  If frmPEKD_TRFGRP_admi.OK Then
    err.Clear
    f.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdPEKD_TRFGRPDel_Click()
  On Error Resume Next
  Dim f As Object
  If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
  If MsgBox("Удалить элемент" & vbCrLf & f.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
  On Error GoTo bye
     If f.Parent.Delete(f.ID) Then
       treePEKD_TRFGRP.Nodes.Remove treePEKD_TRFGRP.SelectedItem.Key
     End If
  End If
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub cmdPEKD_TRFGRPAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
  Item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdPEKD_TRFGRPREf_Click()
  On Error Resume Next
  Item.PEKD_TRFGRP.Refresh
  treePEKD_TRFGRP.Nodes.Clear
  Item.PEKD_TRFGRP.filltree treePEKD_TRFGRP
End Sub

Private Sub treePEKD_TRFGRP_DblClick()
If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
  cmdPEKD_TRFGRPEdit_Click
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function

Private Sub treePEKD_TRFGRP_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 ParentForm.MousePointer = vbHourglass
 treePEKD_TRFGRP.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = Item.FindRowObject("PEKD_TRFGRP", Left(Node.Key, 38))
 f.expandpart treePEKD_TRFGRP, Node.Key
 ParentForm.MousePointer = vbNormal
End If
 Set treePEKD_TRFGRP.SelectedItem = Node
 treePEKD_TRFGRP_NodeClick Node
End Sub

Private Sub treePEKD_TRFGRP_Collapse(ByVal Node As MSComctlLib.Node)
 Set treePEKD_TRFGRP.SelectedItem = Node
 treePEKD_TRFGRP_NodeClick Node
End Sub

Private Sub pnlPEKD_TRFGRP_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  treePEKD_TRFGRP.Left = Left
  treePEKD_TRFGRP.Top = Top + 25 * Screen.TwipsPerPixelY
  treePEKD_TRFGRP.Width = Width
  treePEKD_TRFGRP.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKD_TRFGRPAddRoot.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFGRPAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFGRPEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFGRPDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFGRPRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFGRPAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFGRPAddRoot.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKD_TRFGRPAdd.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKD_TRFGRPEdit.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKD_TRFGRPDel.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKD_TRFGRPRef.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKD_TRFGRPAcc.Left = Left + 130 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdPEKD_TRFTYPECfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKD_TRFTYPE, "gridPEKD_TRFTYPE"
Set jset = Nothing
End Sub

Private Sub cmdPEKD_TRFTYPEPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKD_TRFTYPE, "Типы тарифов"
Set jset = Nothing
End Sub

Private Sub cmdPEKD_TRFTYPEAcc_Click()
On Error Resume Next
If gridPEKD_TRFTYPE.ItemCount = 0 Then Exit Sub
If gridPEKD_TRFTYPE.Row > 0 Then
 If gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_TRFTYPE.RowBookmark(gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKD_TRFTYPEFnd_Click()
  On Error Resume Next
  fndPEKD_TRFTYPE.ShowForm
End Sub
Private Sub cmdPEKD_TRFTYPERun_Click()
  On Error Resume Next
  gridPEKD_TRFTYPE_DblClick
End Sub
Private Sub pnlPEKD_TRFGRP_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridPEKD_TRFTYPE.Left = Left
  gridPEKD_TRFTYPE.Top = Top + 25 * Screen.TwipsPerPixelY
  gridPEKD_TRFTYPE.Width = Width
  gridPEKD_TRFTYPE.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdPEKD_TRFTYPEAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFTYPEEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFTYPEDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFTYPERef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFTYPEPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFTYPECfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFTYPEFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFTYPERun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFTYPEAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdPEKD_TRFTYPEAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdPEKD_TRFTYPEEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdPEKD_TRFTYPEDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdPEKD_TRFTYPERef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdPEKD_TRFTYPEPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdPEKD_TRFTYPECfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdPEKD_TRFTYPEFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdPEKD_TRFTYPERun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdPEKD_TRFTYPEAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub treePEKD_TRFGRP_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim p As Object
  Set p = Item.FindRowObject("PEKD_TRFGRP", Left(Node.Key, 38))
  p.PEKD_TRFTYPE.Refresh
  p.PEKD_TRFTYPE.preparegrid gridPEKD_TRFTYPE
  LoadGridLayout gridPEKD_TRFTYPE
    Set fndPEKD_TRFTYPE = Nothing
    Set fndPEKD_TRFTYPE = CreateObject("MTZ_JSetup.GridFinder")
    fndPEKD_TRFTYPE.Init gridPEKD_TRFTYPE
End Sub

Private Sub gridPEKD_TRFTYPE_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
  Dim p As Object
  If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
  Set p = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
  p.PEKD_TRFTYPE.LoadRow gridPEKD_TRFTYPE, RowIndex, Bookmark, Values
  Set p = Nothing
End Sub
Private Sub gridPEKD_TRFTYPE_KeyPress(KeyAscii As Integer)
  If gridPEKD_TRFTYPE.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKD_TRFTYPE.FindOnPress KeyAscii
End Sub

Private Sub gridPEKD_TRFTYPE_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
    If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
    If gridPEKD_TRFTYPE.Row = 0 Then Exit Sub
    If gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridPEKD_TRFTYPE.RowBookmark(gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row))
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
Private Sub cmdPEKD_TRFTYPEEdit_Click()
    On Error Resume Next
    If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
    If gridPEKD_TRFTYPE.Row = 0 Then Exit Sub
    If gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row) = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridPEKD_TRFTYPE.RowBookmark(gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmPEKD_TRFTYPE_admi.Item = u
again:     frmPEKD_TRFTYPE_admi.NotFirstTime = False
    frmPEKD_TRFTYPE_admi.OnInit
    frmPEKD_TRFTYPE_admi.Show vbModal
    If frmPEKD_TRFTYPE_admi.OK Then
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKD_TRFTYPE.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
  Set u = Nothing
Exit Sub
bye:
MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdPEKD_TRFTYPERef_Click()
  On Error Resume Next
    If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
  gridPEKD_TRFTYPE.Columns.Clear
  gridPEKD_TRFTYPE.ItemCount = 0
   treePEKD_TRFGRP_NodeClick treePEKD_TRFGRP.SelectedItem
End Sub
Private Sub cmdPEKD_TRFTYPEDel_Click()
  On Error Resume Next
   gridPEKD_TRFTYPE.Delete
End Sub
Private Sub cmdPEKD_TRFTYPEAdd_Click()
  On Error Resume Next
   If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
   Dim gu As Object
   Set gu = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
   Dim u As Object
   Set u = gu.PEKD_TRFTYPE.Add()

      Set frmPEKD_TRFTYPE_admi.Item = u
again:       frmPEKD_TRFTYPE_admi.NotFirstTime = False
      frmPEKD_TRFTYPE_admi.OnInit
      frmPEKD_TRFTYPE_admi.Show vbModal
      If frmPEKD_TRFTYPE_admi.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKD_TRFTYPE.ItemCount = gu.PEKD_TRFTYPE.Count
        gridPEKD_TRFTYPE.Refresh
        gridPEKD_TRFTYPE.RefreshGroups
        gridPEKD_TRFTYPE.RefreshSort
        gridPEKD_TRFTYPE.MoveToBookmark u.ID & "PEKD_TRFTYPE"
      Else
        gu.PEKD_TRFTYPE.Delete u.ID
        gu.PEKD_TRFTYPE.Remove u.ID
      End If
Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridPEKD_TRFTYPE_DblClick()
    cmdPEKD_TRFTYPEEdit_Click
End Sub
Private Sub gridPEKD_TRFTYPE_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridPEKD_TRFTYPE.ItemCount = 0 Then Exit Sub
 If gridPEKD_TRFTYPE.Row > 0 Then
   If LastRow <> gridPEKD_TRFTYPE.Row And LastRow > 0 Then
     gridPEKD_TRFTYPE.GetRowData(LastRow).RowStyle = "Default"
     gridPEKD_TRFTYPE.GetRowData(gridPEKD_TRFTYPE.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuPEKD_TRFTYPEPASTE_Click()
On Error Resume Next
   If treePEKD_TRFGRP.SelectedItem Is Nothing Then Exit Sub
   Dim gu As Object
   Set gu = Item.FindRowObject("PEKD_TRFGRP", Left(treePEKD_TRFGRP.SelectedItem.Key, 38))
   Dim u As Object
   Set u = gu.PEKD_TRFTYPE.Add()
    If GetFromBuffer(u) Then
      gridPEKD_TRFTYPE.ItemCount = u.Parent.Count
    Else
      gu.PEKD_TRFTYPE.Refresh
    End If
    Set gu = Nothing
End Sub
'Hidden GRID Setup...
Private Sub gridPEKD_TRFTYPE_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKD_TRFTYPECfg_Click
        End If
    End If
End Sub

Private Sub gridPEKD_TRFTYPE_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKD_TRFTYPE
End If
End Sub
Private Sub mnuPEKD_TRFTYPEAdd_click()
   menuActionPEKD_TRFTYPE = "ADD"
   menuTimerPEKD_TRFTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_TRFTYPEEdit_click()
   menuActionPEKD_TRFTYPE = "EDIT"
   menuTimerPEKD_TRFTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_TRFTYPEDelete_click()
   menuActionPEKD_TRFTYPE = "DEL"
   menuTimerPEKD_TRFTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_TRFTYPEOpen_click()
   menuActionPEKD_TRFTYPE = "RUN"
   menuTimerPEKD_TRFTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_TRFTYPERef_click()
   menuActionPEKD_TRFTYPE = "REF"
   menuTimerPEKD_TRFTYPE.Enabled = True
End Sub
  Private Sub mnuPEKD_TRFTYPECOPY_Click()
    On Error Resume Next
    If gridPEKD_TRFTYPE.ItemCount = 0 Then Exit Sub
    If gridPEKD_TRFTYPE.Row > 0 Then
     If gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_TRFTYPE.RowBookmark(gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKD_TRFTYPECUT_Click()
    On Error Resume Next
    If gridPEKD_TRFTYPE.ItemCount = 0 Then Exit Sub
    If gridPEKD_TRFTYPE.Row > 0 Then
     If gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_TRFTYPE.RowBookmark(gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKD_TRFTYPE.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKD_TRFTYPECHANGE_Click()
  On Error Resume Next
  If gridPEKD_TRFTYPE.ItemCount = 0 Then Exit Sub
  If gridPEKD_TRFTYPE.Row > 0 Then
   If gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_TRFTYPE.RowBookmark(gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKD_TRFTYPE.ItemCount = u.Parent.Count
      gridPEKD_TRFTYPE.RefreshRowIndex gridPEKD_TRFTYPE.RowIndex(gridPEKD_TRFTYPE.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKD_TRFTYPECLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKD_TRFTYPEPrn_click()
   menuActionPEKD_TRFTYPE = "PRN"
   menuTimerPEKD_TRFTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_TRFTYPECfg_click()
   menuActionPEKD_TRFTYPE = "CFG"
   menuTimerPEKD_TRFTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_TRFTYPEFind_click()
   menuActionPEKD_TRFTYPE = "FND"
   menuTimerPEKD_TRFTYPE.Enabled = True
End Sub
Private Sub mnuPEKD_TRFTYPEAcc_click()
   menuActionPEKD_TRFTYPE = "ACC"
   menuTimerPEKD_TRFTYPE.Enabled = True
End Sub
Private Sub menuTimerPEKD_TRFTYPE_timer()
   menuTimerPEKD_TRFTYPE.Enabled = False
   If menuActionPEKD_TRFTYPE = "ADD" Then cmdPEKD_TRFTYPEAdd_Click
   If menuActionPEKD_TRFTYPE = "EDIT" Then cmdPEKD_TRFTYPEEdit_Click
   If menuActionPEKD_TRFTYPE = "DEL" Then cmdPEKD_TRFTYPEDel_Click
   If menuActionPEKD_TRFTYPE = "RUN" Then cmdPEKD_TRFTYPERun_Click
   If menuActionPEKD_TRFTYPE = "REF" Then cmdPEKD_TRFTYPERef_Click
   If menuActionPEKD_TRFTYPE = "PRN" Then cmdPEKD_TRFTYPEPrn_Click
   If menuActionPEKD_TRFTYPE = "CFG" Then cmdPEKD_TRFTYPECfg_Click
   If menuActionPEKD_TRFTYPE = "FND" Then cmdPEKD_TRFTYPEFnd_Click
   If menuActionPEKD_TRFTYPE = "ACC" Then cmdPEKD_TRFTYPEAcc_Click
   menuActionPEKD_TRFTYPE = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKD_TRFGRPAddRoot, cmdPEKD_TRFGRPAddRoot.Tag
  LoadBtnPictures cmdPEKD_TRFGRPAdd, cmdPEKD_TRFGRPAdd.Tag
  LoadBtnPictures cmdPEKD_TRFGRPEdit, cmdPEKD_TRFGRPEdit.Tag
  LoadBtnPictures cmdPEKD_TRFGRPDel, cmdPEKD_TRFGRPDel.Tag
  LoadBtnPictures cmdPEKD_TRFGRPRef, cmdPEKD_TRFGRPRef.Tag
  LoadBtnPictures cmdPEKD_TRFGRPAcc, cmdPEKD_TRFGRPAcc.Tag
Item.PEKD_TRFGRP.filltree treePEKD_TRFGRP
  LoadBtnPictures cmdPEKD_TRFTYPEAdd, cmdPEKD_TRFTYPEAdd.Tag
  LoadBtnPictures cmdPEKD_TRFTYPEEdit, cmdPEKD_TRFTYPEEdit.Tag
  LoadBtnPictures cmdPEKD_TRFTYPEDel, cmdPEKD_TRFTYPEDel.Tag
  LoadBtnPictures cmdPEKD_TRFTYPERef, cmdPEKD_TRFTYPERef.Tag
  LoadBtnPictures cmdPEKD_TRFTYPEPrn, cmdPEKD_TRFTYPEPrn.Tag
  LoadBtnPictures cmdPEKD_TRFTYPEFnd, cmdPEKD_TRFTYPEFnd.Tag
  LoadBtnPictures cmdPEKD_TRFTYPECfg, cmdPEKD_TRFTYPECfg.Tag
  LoadBtnPictures cmdPEKD_TRFTYPERun, cmdPEKD_TRFTYPERun.Tag
  LoadBtnPictures cmdPEKD_TRFTYPEAcc, cmdPEKD_TRFTYPEAcc.Tag
  gridPEKD_TRFTYPE.Columns.Clear
  gridPEKD_TRFTYPE.ItemCount = 0
  cmdPEKD_TRFTYPERef_Click
End Sub
Private Sub OnTabClick()

pnlPEKD_TRFGRP.RestorePosition
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
  pnlPEKD_TRFGRP.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKD_TRFTYPE = Nothing
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
'  ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT2", "Отчет " & Date)
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



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2P", "Платеж " & Date)
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



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2O", "Оплата " & Date)
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "Заявка " & Date)
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





