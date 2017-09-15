VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmITTTZ 
   Caption         =   "Фильтр для Транспортный заказ"
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
      Begin VB.TextBox txtTheClient 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   17
         ToolTipText     =   "Клиент"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblTheClient 
         Caption         =   "Клиент:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtSupplierCode 
         Height          =   300
         Left            =   300
         MaxLength       =   4
         TabIndex        =   15
         ToolTipText     =   "Код поставщика"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblSupplierCode 
         Caption         =   "Код поставщика:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   8
         TabIndex        =   13
         ToolTipText     =   "Номер документа"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblTheNumber 
         Caption         =   "Номер документа:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDocDate_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Дата документа по"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16187395
         CurrentDate     =   39247
      End
      Begin VB.CheckBox lblDocDate_LE 
         Caption         =   "Дата документа по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDocDate_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Дата документа C"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16187395
         CurrentDate     =   39247
      End
      Begin VB.CheckBox lblDocDate_GE 
         Caption         =   "Дата документа C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtDirection 
         Height          =   300
         Left            =   300
         MaxLength       =   1
         TabIndex        =   7
         ToolTipText     =   "Направление "
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblDirection 
         Caption         =   "Направление :"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtCode 
         Height          =   300
         Left            =   300
         MaxLength       =   2
         TabIndex        =   5
         ToolTipText     =   "Код документа"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblCode 
         Caption         =   "Код документа:"
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
Attribute VB_Name = "frmITTTZ"
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

ts.Tabs.Item(1).Caption = "Описание заказа"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "ITTTZ", "fctlITTTZ"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtCode_Change()
  Changing
End Sub
Private Sub txtDirection_Change()
  Changing
End Sub
Private Sub dtpDocDate_GE_Change()
  Changing
End Sub
Private Sub dtpDocDate_LE_Change()
  Changing
End Sub
Private Sub txtTheNumber_Change()
  Changing
End Sub
Private Sub txtSupplierCode_Change()
  Changing
End Sub
Private Sub txtTheClient_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtCode = ""
txtDirection = ""
dtpDocDate_GE = Date
dtpDocDate_LE = Date
txtTheNumber = ""
txtSupplierCode = ""
txtTheClient = ""
OnInit = False
End Sub



