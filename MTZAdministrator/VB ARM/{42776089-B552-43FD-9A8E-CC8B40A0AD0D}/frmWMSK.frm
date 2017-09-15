VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmWMSK 
   Caption         =   "Фильтр для Контрагент"
   ClientHeight    =   3480
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3480
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
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
   Begin MTZ_PANEL.ScrolledWindow PanelfGroup 
      Height          =   1000
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   20
         ToolTipText     =   "Комментарий"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComment 
         Caption         =   "Комментарий:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5910
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdmail 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "mailopen.ico"
         ToolTipText     =   "E-mail"
         Top             =   5535
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtmail 
         Height          =   300
         Left            =   300
         TabIndex        =   17
         ToolTipText     =   "E-mail"
         Top             =   5535
         Width           =   2550
      End
      Begin VB.CheckBox lblmail 
         Caption         =   "E-mail:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5205
         Width           =   3000
      End
      Begin VB.TextBox txtfax 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   15
         ToolTipText     =   "Факс"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.CheckBox lblfax 
         Caption         =   "Факс:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4500
         Width           =   3000
      End
      Begin VB.TextBox txtfon2 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   13
         ToolTipText     =   "Телефон 2"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.CheckBox lblfon2 
         Caption         =   "Телефон 2:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3795
         Width           =   3000
      End
      Begin VB.TextBox txtfon1 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   11
         ToolTipText     =   "Телефон 1"
         Top             =   3420
         Width           =   3000
      End
      Begin VB.CheckBox lblfon1 
         Caption         =   "Телефон 1:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   3090
         Width           =   3000
      End
      Begin VB.TextBox txtaddress 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         ToolTipText     =   "Адрес"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lbladdress 
         Caption         =   "Адрес:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtname 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   7
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblname 
         Caption         =   "Название:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtcode 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Код"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblcode 
         Caption         =   "Код:"
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
Attribute VB_Name = "frmWMSK"
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

ts.Tabs.Item(1).Caption = "Описание"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "WMSK", "fctlWMSK"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtcode_Change()
  Changing
End Sub
Private Sub txtname_Change()
  Changing
End Sub
Private Sub txtaddress_Change()
  Changing
End Sub
Private Sub txtfon1_Change()
  Changing
End Sub
Private Sub txtfon2_Change()
  Changing
End Sub
Private Sub txtfax_Change()
  Changing
End Sub
Private Sub txtmail_Change()
  Changing
End Sub
Private Sub cmdmail_CLick()
  On Error Resume Next
  Dim s As String
  s = s & "mailto:" & txtmail.Text
  OpenDocument 0, s
End Sub
Private Sub txtTheComment_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtcode = ""
txtname = ""
txtfon1 = ""
txtfon2 = ""
txtfax = ""
 LoadBtnPictures cmdmail, cmdmail.Tag
  cmdmail.RemoveAllMenu
OnInit = False
End Sub



