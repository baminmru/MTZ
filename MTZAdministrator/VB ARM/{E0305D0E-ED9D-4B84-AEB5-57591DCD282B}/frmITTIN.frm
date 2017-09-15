VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmITTIN 
   Caption         =   "Фильтр для Приемка груза"
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
      Begin MTZ_PANEL.DropButton cmdThePartyRule 
         Height          =   300
         Left            =   9150
         TabIndex        =   42
         Tag             =   "refopen.ico"
         ToolTipText     =   "Правиило формирования партии"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtThePartyRule 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   41
         ToolTipText     =   "Правиило формирования партии"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblThePartyRule 
         Caption         =   "Правиило формирования партии:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   40
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txttemp_in_track_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   39
         ToolTipText     =   "Температура меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lbltemp_in_track_LE 
         Caption         =   "Температура меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   38
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txttemp_in_track_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   37
         ToolTipText     =   "Температура больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lbltemp_in_track_GE 
         Caption         =   "Температура больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   36
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtptrack_time_out_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         ToolTipText     =   "Время убытия машины по"
         Top             =   6045
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   89063427
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lbltrack_time_out_LE 
         Caption         =   "Время убытия машины по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtptrack_time_out_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         ToolTipText     =   "Время убытия машины C"
         Top             =   5340
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   89063427
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lbltrack_time_out_GE 
         Caption         =   "Время убытия машины C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   5010
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTrack_time_in_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         ToolTipText     =   "Время прибытия машины по"
         Top             =   4635
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   89063427
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblTrack_time_in_LE 
         Caption         =   "Время прибытия машины по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTrack_time_in_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         ToolTipText     =   "Время прибытия машины C"
         Top             =   3930
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   89063427
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblTrack_time_in_GE 
         Caption         =   "Время прибытия машины C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtStampStatus 
         Height          =   300
         Left            =   3450
         MaxLength       =   30
         TabIndex        =   27
         ToolTipText     =   "Состояние пломбы"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblStampStatus 
         Caption         =   "Состояние пломбы:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtStampNumber 
         Height          =   300
         Left            =   3450
         MaxLength       =   20
         TabIndex        =   25
         ToolTipText     =   "Номер пломбы"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblStampNumber 
         Caption         =   "Номер пломбы:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtContainer 
         Height          =   300
         Left            =   3450
         MaxLength       =   10
         TabIndex        =   23
         ToolTipText     =   "№ прицепа \ контейнера"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblContainer 
         Caption         =   "№ прицепа \ контейнера:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtTranspNumber 
         Height          =   300
         Left            =   3450
         MaxLength       =   10
         TabIndex        =   21
         ToolTipText     =   "№ ТС"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblTranspNumber 
         Caption         =   "№ ТС:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTTNDate_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         ToolTipText     =   "Дата ТТН по"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   89063427
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblTTNDate_LE 
         Caption         =   "Дата ТТН по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   18
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTTNDate_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   17
         ToolTipText     =   "Дата ТТН C"
         Top             =   6435
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   89063427
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblTTNDate_GE 
         Caption         =   "Дата ТТН C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   6105
         Width           =   3000
      End
      Begin VB.TextBox txtTTN 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   15
         ToolTipText     =   "Номер ТТН"
         Top             =   5730
         Width           =   3000
      End
      Begin VB.CheckBox lblTTN 
         Caption         =   "Номер ТТН:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   5400
         Width           =   3000
      End
      Begin VB.TextBox txtSupplier 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   13
         ToolTipText     =   "Поставщик"
         Top             =   5025
         Width           =   3000
      End
      Begin VB.CheckBox lblSupplier 
         Caption         =   "Поставщик:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   4695
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpProcessDate_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Дата обработки заказа по"
         Top             =   4320
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   89063427
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblProcessDate_LE 
         Caption         =   "Дата обработки заказа по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   3990
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpProcessDate_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Дата обработки заказа C"
         Top             =   3615
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   89063427
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblProcessDate_GE 
         Caption         =   "Дата обработки заказа C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   3285
         Width           =   3000
      End
      Begin VB.TextBox txtTheClient 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         ToolTipText     =   "Клиент"
         Top             =   2010
         Width           =   3000
      End
      Begin VB.CheckBox lblTheClient 
         Caption         =   "Клиент:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1680
         Width           =   3000
      End
      Begin VB.TextBox txtQryCode 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   5
         ToolTipText     =   "Код заказа"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblQryCode 
         Caption         =   "Код заказа:"
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
Attribute VB_Name = "frmITTIN"
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
  TSCustom.Init ts, "ITTIN", "fctlITTIN"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtQryCode_Change()
  Changing
End Sub
Private Sub txtTheClient_Change()
  Changing
End Sub
Private Sub dtpProcessDate_GE_Change()
  Changing
End Sub
Private Sub dtpProcessDate_LE_Change()
  Changing
End Sub
Private Sub txtSupplier_Change()
  Changing
End Sub
Private Sub txtTTN_Change()
  Changing
End Sub
Private Sub dtpTTNDate_GE_Change()
  Changing
End Sub
Private Sub dtpTTNDate_LE_Change()
  Changing
End Sub
Private Sub txtTranspNumber_Change()
  Changing
End Sub
Private Sub txtContainer_Change()
  Changing
End Sub
Private Sub txtStampNumber_Change()
  Changing
End Sub
Private Sub txtStampStatus_Change()
  Changing
End Sub
Private Sub dtpTrack_time_in_GE_Change()
  Changing
End Sub
Private Sub dtpTrack_time_in_LE_Change()
  Changing
End Sub
Private Sub dtptrack_time_out_GE_Change()
  Changing
End Sub
Private Sub dtptrack_time_out_LE_Change()
  Changing
End Sub
Private Sub txttemp_in_track_GE_Validate(cancel As Boolean)
If txttemp_in_track_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txttemp_in_track_GE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txttemp_in_track_GE.Text) < -922337203685478# Or val(txttemp_in_track_GE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txttemp_in_track_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txttemp_in_track_GE_Change()
  Changing
End Sub
Private Sub txttemp_in_track_LE_Validate(cancel As Boolean)
If txttemp_in_track_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txttemp_in_track_LE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txttemp_in_track_LE.Text) < -922337203685478# Or val(txttemp_in_track_LE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txttemp_in_track_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txttemp_in_track_LE_Change()
  Changing
End Sub
Private Sub txtThePartyRule_Change()
  Changing
End Sub
Private Sub cmdThePartyRule_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_RULE", id, brief) Then
          txtThePartyRule.Tag = Left(id, 38)
          txtThePartyRule = brief
        End If
End Sub
Private Sub cmdThePartyRule_MenuClick(ByVal sCaption As String)
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

dtpProcessDate_GE = Date
dtpProcessDate_LE = Date
txtSupplier = ""
txtTTN = ""
dtpTTNDate_GE = Date
dtpTTNDate_LE = Date
txtTranspNumber = ""
txtContainer = ""
txtStampNumber = ""
txtStampStatus = ""
dtpTrack_time_in_GE = Now
dtpTrack_time_in_LE = Now
dtptrack_time_out_GE = Now
dtptrack_time_out_LE = Now
  txtThePartyRule.Tag = ""
  txtThePartyRule = ""
 LoadBtnPictures cmdThePartyRule, cmdThePartyRule.Tag
  cmdThePartyRule.RemoveAllMenu
OnInit = False
End Sub



