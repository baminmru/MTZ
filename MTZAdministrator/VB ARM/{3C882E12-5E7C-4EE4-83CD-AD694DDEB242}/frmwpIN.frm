VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmwpIN 
   Caption         =   "Фильтр для Заказ на приемку"
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
      Begin VB.TextBox txtS_code 
         Height          =   300
         Left            =   6600
         MaxLength       =   30
         TabIndex        =   45
         ToolTipText     =   "Штрихкод"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblS_code 
         Caption         =   "Штрихкод:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCarOutTime_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         ToolTipText     =   "Время убытия машины по"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   77856771
         CurrentDate     =   39926
      End
      Begin VB.CheckBox lblCarOutTime_LE 
         Caption         =   "Время убытия машины по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCarOutTime_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   41
         ToolTipText     =   "Время убытия машины C"
         Top             =   405
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   77856771
         CurrentDate     =   39926
      End
      Begin VB.CheckBox lblCarOutTime_GE 
         Caption         =   "Время убытия машины C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   40
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCarInTime_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         ToolTipText     =   "Время прибытия машины по"
         Top             =   6045
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   77856771
         CurrentDate     =   39926
      End
      Begin VB.CheckBox lblCarInTime_LE 
         Caption         =   "Время прибытия машины по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCarInTime_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         ToolTipText     =   "Время прибытия машины C"
         Top             =   5340
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   77856771
         CurrentDate     =   39926
      End
      Begin VB.CheckBox lblCarInTime_GE 
         Caption         =   "Время прибытия машины C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtPlombNum 
         Height          =   300
         Left            =   3450
         MaxLength       =   50
         TabIndex        =   35
         ToolTipText     =   "Номер пломбы"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblPlombNum 
         Caption         =   "Номер пломбы:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTTNDate_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         ToolTipText     =   "Дата ТТН по"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   77856771
         CurrentDate     =   39926
      End
      Begin VB.CheckBox lblTTNDate_LE 
         Caption         =   "Дата ТТН по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTTNDate_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         ToolTipText     =   "Дата ТТН C"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   77856771
         CurrentDate     =   39926
      End
      Begin VB.CheckBox lblTTNDate_GE 
         Caption         =   "Дата ТТН C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtTTNNum 
         Height          =   300
         Left            =   3450
         MaxLength       =   50
         TabIndex        =   29
         ToolTipText     =   "Номер ТТН"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblTTNNum 
         Caption         =   "Номер ТТН:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtTheContainer 
         Height          =   300
         Left            =   3450
         MaxLength       =   20
         TabIndex        =   27
         ToolTipText     =   "Номер контейнера"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblTheContainer 
         Caption         =   "Номер контейнера:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtCar2Num 
         Height          =   300
         Left            =   3450
         MaxLength       =   20
         TabIndex        =   25
         ToolTipText     =   "Номер прицепа"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblCar2Num 
         Caption         =   "Номер прицепа:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtCarNum 
         Height          =   300
         Left            =   3450
         MaxLength       =   20
         TabIndex        =   23
         ToolTipText     =   "Номер ТС"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblCarNum 
         Caption         =   "Номер ТС:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtSupplier 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   21
         ToolTipText     =   "Поставщик"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.CheckBox lblSupplier 
         Caption         =   "Поставщик:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5910
         Width           =   3000
      End
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   19
         ToolTipText     =   "Примечание"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComment 
         Caption         =   "Примечание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTheDate_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   17
         ToolTipText     =   "Дата заказа по"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   77856771
         CurrentDate     =   39926
      End
      Begin VB.CheckBox lblTheDate_LE 
         Caption         =   "Дата заказа по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTheDate_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   15
         ToolTipText     =   "Дата заказа C"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   77856771
         CurrentDate     =   39926
      End
      Begin VB.CheckBox lblTheDate_GE 
         Caption         =   "Дата заказа C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   13
         ToolTipText     =   "Номер заказа меньше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblTheNumber_LE 
         Caption         =   "Номер заказа меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   11
         ToolTipText     =   "Номер заказа больше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblTheNumber_GE 
         Caption         =   "Номер заказа больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   1485
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheDogovor 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Договор"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDogovor 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Договор"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.CheckBox lblTheDogovor 
         Caption         =   "Договор:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheCLient 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Клиент"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCLient 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Клиент"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblTheCLient 
         Caption         =   "Клиент:"
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
Attribute VB_Name = "frmwpIN"
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
Private Sub Form_Unload(cancel As Integer)
  On Error Resume Next
  Set Item = Nothing
  Set TSCustom = Nothing
  SaveToSkin Me
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
  cancel = -1
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
  TSCustom.Init ts, "wpIN", "fctlwpIN"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtTheCLient_Change()
  Changing
End Sub
Private Sub cmdTheCLient_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpCli_def", id, brief) Then
          txtTheCLient.Tag = Left(id, 38)
          txtTheCLient = brief
        End If
End Sub
Private Sub cmdTheCLient_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtTheDogovor_Change()
  Changing
End Sub
Private Sub cmdTheDogovor_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpDog_def", id, brief) Then
          txtTheDogovor.Tag = Left(id, 38)
          txtTheDogovor = brief
        End If
End Sub
Private Sub cmdTheDogovor_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtTheNumber_GE_Validate(cancel As Boolean)
If txtTheNumber_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNumber_GE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtTheNumber_GE.Text) <> CLng(val(txtTheNumber_GE.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtTheNumber_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheNumber_GE_Change()
  Changing
End Sub
Private Sub txtTheNumber_LE_Validate(cancel As Boolean)
If txtTheNumber_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNumber_LE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtTheNumber_LE.Text) <> CLng(val(txtTheNumber_LE.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtTheNumber_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheNumber_LE_Change()
  Changing
End Sub
Private Sub dtpTheDate_GE_Change()
  Changing
End Sub
Private Sub dtpTheDate_LE_Change()
  Changing
End Sub
Private Sub txtTheComment_Change()
  Changing
End Sub
Private Sub txtSupplier_Change()
  Changing
End Sub
Private Sub txtCarNum_Change()
  Changing
End Sub
Private Sub txtCar2Num_Change()
  Changing
End Sub
Private Sub txtTheContainer_Change()
  Changing
End Sub
Private Sub txtTTNNum_Change()
  Changing
End Sub
Private Sub dtpTTNDate_GE_Change()
  Changing
End Sub
Private Sub dtpTTNDate_LE_Change()
  Changing
End Sub
Private Sub txtPlombNum_Change()
  Changing
End Sub
Private Sub dtpCarInTime_GE_Change()
  Changing
End Sub
Private Sub dtpCarInTime_LE_Change()
  Changing
End Sub
Private Sub dtpCarOutTime_GE_Change()
  Changing
End Sub
Private Sub dtpCarOutTime_LE_Change()
  Changing
End Sub
Private Sub txtS_code_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

  txtTheCLient.Tag = ""
  txtTheCLient = ""
 LoadBtnPictures cmdTheCLient, cmdTheCLient.Tag
  cmdTheCLient.RemoveAllMenu
  txtTheDogovor.Tag = ""
  txtTheDogovor = ""
 LoadBtnPictures cmdTheDogovor, cmdTheDogovor.Tag
  cmdTheDogovor.RemoveAllMenu
dtpTheDate_GE = Date
dtpTheDate_LE = Date
txtSupplier = ""
txtCarNum = ""
txtCar2Num = ""
txtTheContainer = ""
txtTTNNum = ""
dtpTTNDate_GE = Date
dtpTTNDate_LE = Date
txtPlombNum = ""
dtpCarInTime_GE = Now
dtpCarInTime_LE = Now
dtpCarOutTime_GE = Now
dtpCarOutTime_LE = Now
txtS_code = ""
OnInit = False
End Sub



