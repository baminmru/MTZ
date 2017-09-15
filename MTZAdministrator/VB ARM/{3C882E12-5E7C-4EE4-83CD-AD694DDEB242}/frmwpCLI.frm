VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmwpCLI 
   Caption         =   "Фильтр для Контрагет"
   ClientHeight    =   3390
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3390
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
      Begin VB.TextBox txtFIOBuh 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   27
         ToolTipText     =   "ФИО гл. Бухгалтера"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblFIOBuh 
         Caption         =   "ФИО гл. Бухгалтера:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtFIODirector 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   25
         ToolTipText     =   "ФИО директора"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblFIODirector 
         Caption         =   "ФИО директора:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtWEBSiteURL 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   23
         ToolTipText     =   "WEB"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblWEBSiteURL 
         Caption         =   "WEB:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtemail 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   21
         ToolTipText     =   "E-MAIL"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblemail 
         Caption         =   "E-MAIL:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtTheFax 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   19
         ToolTipText     =   "Факс"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblTheFax 
         Caption         =   "Факс:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   18
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtPhone 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   17
         ToolTipText     =   "Телефон"
         Top             =   6435
         Width           =   3000
      End
      Begin VB.CheckBox lblPhone 
         Caption         =   "Телефон:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   6105
         Width           =   3000
      End
      Begin VB.TextBox txtpostAddr 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         ToolTipText     =   "Почтовый адрес"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.CheckBox lblpostAddr 
         Caption         =   "Почтовый адрес:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4500
         Width           =   3000
      End
      Begin VB.TextBox txtUrAddr 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   13
         ToolTipText     =   "Юр. адрес"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblUrAddr 
         Caption         =   "Юр. адрес:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtKPP 
         Height          =   300
         Left            =   300
         MaxLength       =   12
         TabIndex        =   11
         ToolTipText     =   "КПП"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblKPP 
         Caption         =   "КПП:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtINN 
         Height          =   300
         Left            =   300
         MaxLength       =   11
         TabIndex        =   9
         ToolTipText     =   "ИНН"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblINN 
         Caption         =   "ИНН:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtFullName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   7
         ToolTipText     =   "Полное наименование"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblFullName 
         Caption         =   "Полное наименование:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtShortName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Краткое наименование"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblShortName 
         Caption         =   "Краткое наименование:"
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
Attribute VB_Name = "frmwpCLI"
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
  TSCustom.Init ts, "wpCLI", "fctlwpCLI"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtShortName_Change()
  Changing
End Sub
Private Sub txtFullName_Change()
  Changing
End Sub
Private Sub txtINN_Change()
  Changing
End Sub
Private Sub txtKPP_Change()
  Changing
End Sub
Private Sub txtUrAddr_Change()
  Changing
End Sub
Private Sub txtpostAddr_Change()
  Changing
End Sub
Private Sub txtPhone_Change()
  Changing
End Sub
Private Sub txtTheFax_Change()
  Changing
End Sub
Private Sub txtemail_Change()
  Changing
End Sub
Private Sub txtWEBSiteURL_Change()
  Changing
End Sub
Private Sub txtFIODirector_Change()
  Changing
End Sub
Private Sub txtFIOBuh_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtShortName = ""
txtFullName = ""
txtINN = ""
txtKPP = ""
txtPhone = ""
txtTheFax = ""
txtemail = ""
txtWEBSiteURL = ""
txtFIODirector = ""
txtFIOBuh = ""
OnInit = False
End Sub



