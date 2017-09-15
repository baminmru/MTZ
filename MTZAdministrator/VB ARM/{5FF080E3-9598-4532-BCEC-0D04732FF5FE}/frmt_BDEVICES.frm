VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmt_BDEVICES 
   Caption         =   "Фильтр для Опрашиваемое устройство"
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
      Begin VB.ComboBox cmbID_MD 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   21
         ToolTipText     =   "Автоматический опрос"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.CheckBox lblID_MD 
         Caption         =   "Автоматический опрос:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5010
         Width           =   3000
      End
      Begin VB.ComboBox cmbCONNECTED 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   19
         ToolTipText     =   "1 - подключен 0 - отключен"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblCONNECTED 
         Caption         =   "1 - подключен 0 - отключен:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpNPLOCK_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   17
         ToolTipText     =   "Время до которого устройство считается заблокированным по"
         Top             =   3930
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   79167491
         CurrentDate     =   39857
      End
      Begin VB.CheckBox lblNPLOCK_LE 
         Caption         =   "Время до которого устройство считается заблокированным по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpNPLOCK_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   15
         ToolTipText     =   "Время до которого устройство считается заблокированным C"
         Top             =   3225
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   79167491
         CurrentDate     =   39857
      End
      Begin VB.CheckBox lblNPLOCK_GE 
         Caption         =   "Время до которого устройство считается заблокированным C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtNPPASSWORD 
         Height          =   300
         Left            =   300
         MaxLength       =   160
         TabIndex        =   13
         ToolTipText     =   "Пароль к NPORT"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblNPPASSWORD 
         Caption         =   "Пароль к NPORT:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtNPIP 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   11
         ToolTipText     =   "IP адрес NPORT"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblNPIP 
         Caption         =   "IP адрес NPORT:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   1485
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdID_DEV 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Устройство"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_DEV 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Устройство"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.CheckBox lblID_DEV 
         Caption         =   "Устройство:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdID_BU 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Здание"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_BU 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Здание"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblID_BU 
         Caption         =   "Здание:"
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
Attribute VB_Name = "frmt_BDEVICES"
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

ts.Tabs.Item(1).Caption = "Подключенные к узлу устройства"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "t_BDEVICES", "fctlt_BDEVICES"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtID_BU_Change()
  Changing
End Sub
Private Sub cmdID_BU_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("BBUILDINGS", id, brief) Then
          txtID_BU.Tag = Left(id, 38)
          txtID_BU = brief
        End If
End Sub
Private Sub cmdID_BU_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtID_DEV_Change()
  Changing
End Sub
Private Sub cmdID_DEV_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("DEVICES", id, brief) Then
          txtID_DEV.Tag = Left(id, 38)
          txtID_DEV = brief
        End If
End Sub
Private Sub cmdID_DEV_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtNPIP_Change()
  Changing
End Sub
Private Sub txtNPPASSWORD_Change()
  Changing
End Sub
Private Sub dtpNPLOCK_GE_Change()
  Changing
End Sub
Private Sub dtpNPLOCK_LE_Change()
  Changing
End Sub
Private Sub cmbCONNECTED_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbID_MD_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

  txtID_BU.Tag = ""
  txtID_BU = ""
 LoadBtnPictures cmdID_BU, cmdID_BU.Tag
  cmdID_BU.RemoveAllMenu
  txtID_DEV.Tag = ""
  txtID_DEV = ""
 LoadBtnPictures cmdID_DEV, cmdID_DEV.Tag
  cmdID_DEV.RemoveAllMenu
txtNPIP = ""
txtNPPASSWORD = ""
dtpNPLOCK_GE = Now
dtpNPLOCK_LE = Now
cmbCONNECTED.Clear
cmbCONNECTED.AddItem "Да"
cmbCONNECTED.ItemData(cmbCONNECTED.NewIndex) = -1
cmbCONNECTED.AddItem "Нет"
cmbCONNECTED.ItemData(cmbCONNECTED.NewIndex) = 0
cmbID_MD.Clear
cmbID_MD.AddItem "Да"
cmbID_MD.ItemData(cmbID_MD.NewIndex) = -1
cmbID_MD.AddItem "Нет"
cmbID_MD.ItemData(cmbID_MD.NewIndex) = 0
OnInit = False
End Sub



