VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmROLES 
   Caption         =   "Фильтр для Роли"
   ClientHeight    =   3480
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3480
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Отмена"
      Height          =   330
      Left            =   0
      TabIndex        =   1
      ToolTipText     =   "Отказ от задания фильтра"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   750
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   330
      Left            =   0
      TabIndex        =   0
      ToolTipText     =   "Применить фильтр"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   750
   End
   Begin MSComctlLib.TabStrip ts 
      Height          =   1500
      Left            =   0
      TabIndex        =   2
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
   Begin MTZ_PANEL.ScrolledWindow PanelfGroup 
      Height          =   1000
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin VB.ComboBox cmbFileExch_Denied 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   15
         ToolTipText     =   "Файловый обмен запрещен"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.CheckBox lblFileExch_Denied 
         Caption         =   "Файловый обмен запрещен:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4500
         Width           =   3000
      End
      Begin VB.ComboBox cmbListCFG_Denied 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         ToolTipText     =   "Настройка журналов запрещена"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.CheckBox lblListCFG_Denied 
         Caption         =   "Настройка журналов запрещена:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3795
         Width           =   3000
      End
      Begin VB.ComboBox cmbFormCFG_Denied 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "Настройки форм запрещены"
         Top             =   3420
         Width           =   3000
      End
      Begin VB.CheckBox lblFormCFG_Denied 
         Caption         =   "Настройки форм запрещены:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   3090
         Width           =   3000
      End
      Begin VB.ComboBox cmbRightsSet_Denied 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "Настройка прав запрещена"
         Top             =   2715
         Width           =   3000
      End
      Begin VB.CheckBox lblRightsSet_Denied 
         Caption         =   "Настройка прав запрещена:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2385
         Width           =   3000
      End
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         ToolTipText     =   "Описание"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComment 
         Caption         =   "Описание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtname 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblname 
         Caption         =   "Название:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   75
         Width           =   3000
      End
   End
   Begin VB.Menu mnuCtl 
      Caption         =   "mnuCtl"
      Visible         =   0   'False
      Begin VB.Menu mnuSetup 
         Caption         =   "Настройка"
      End
   End
End
Attribute VB_Name = "frmROLES"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Public Item As Object
Public OK As Boolean
Private OnInit As Boolean
Public Event Changed()
Private TSCustom As MTZ_CUSTOMTAB.TabStripCustomizer







Private Sub cmdOK_Click()
    On Error Resume Next
    OK = True
    Me.Hide
End Sub
Private Sub cmdCancel_Click()
    On Error Resume Next
    OK = False
    Me.Hide
End Sub
Public Sub Init(ObjItem As Object)
 Set Item = ObjItem
 If Item Is Nothing Then Set Item = MyUser.Application
 TInit
End Sub
Private Sub Form_Load()
  On Error Resume Next
  Dim ff As Long, buf As String
  LoadFromSkin Me
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdok.Height
  cmdok.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdok.Width, cmdok.Height
  cmdcancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdcancel.Width, cmdok.Height
  If Item Is Nothing Then Init MyUser.Application
End Sub
Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  Set Item = Nothing
  Set TSCustom = Nothing
  SaveToSkin Me
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
  Cancel = -1
End Sub
Private Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdok.Height
  cmdok.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdok.Width, cmdok.Height
  cmdcancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdcancel.Width, cmdok.Height
  ts_click
End Sub
Private Sub mnuSetup_Click()
TSCustom.Setup ts
End Sub
Private Sub ts_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu mnuCtl
  End If
End Sub
Private Sub ts_click()
  On Error Resume Next
  panelfGroup.Visible = False

   Select Case ts.SelectedItem.Key
   Case "fGroup"
     With panelfGroup
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     End With
     End Select
End Sub
Private Sub TInit()
  On Error Resume Next
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "Определение роли"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "ROLES", "fctlROLES"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtname_Change()
  Changing
End Sub
Private Sub txtTheComment_Change()
  Changing
End Sub
Private Sub cmbRightsSet_Denied_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbFormCFG_Denied_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbListCFG_Denied_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbFileExch_Denied_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtname = ""
cmbRightsSet_Denied.Clear
cmbRightsSet_Denied.AddItem "Да"
cmbRightsSet_Denied.ItemData(cmbRightsSet_Denied.NewIndex) = -1
cmbRightsSet_Denied.AddItem "Нет"
cmbRightsSet_Denied.ItemData(cmbRightsSet_Denied.NewIndex) = 0
cmbFormCFG_Denied.Clear
cmbFormCFG_Denied.AddItem "Да"
cmbFormCFG_Denied.ItemData(cmbFormCFG_Denied.NewIndex) = -1
cmbFormCFG_Denied.AddItem "Нет"
cmbFormCFG_Denied.ItemData(cmbFormCFG_Denied.NewIndex) = 0
cmbListCFG_Denied.Clear
cmbListCFG_Denied.AddItem "Да"
cmbListCFG_Denied.ItemData(cmbListCFG_Denied.NewIndex) = -1
cmbListCFG_Denied.AddItem "Нет"
cmbListCFG_Denied.ItemData(cmbListCFG_Denied.NewIndex) = 0
cmbFileExch_Denied.Clear
cmbFileExch_Denied.AddItem "Да"
cmbFileExch_Denied.ItemData(cmbFileExch_Denied.NewIndex) = -1
cmbFileExch_Denied.AddItem "Нет"
cmbFileExch_Denied.ItemData(cmbFileExch_Denied.NewIndex) = 0
OnInit = False
End Sub



