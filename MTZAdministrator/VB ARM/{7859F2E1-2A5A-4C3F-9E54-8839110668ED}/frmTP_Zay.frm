VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmTP_Zay 
   Caption         =   "Фильтр для Заявки"
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
      Begin MSComCtl2.DTPicker dtpDoneDate_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   54
         ToolTipText     =   "Дата передачи в СЗТ по"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16449539
         CurrentDate     =   39781
      End
      Begin VB.CheckBox lblDoneDate_LE 
         Caption         =   "Дата передачи в СЗТ по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDoneDate_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   52
         ToolTipText     =   "Дата передачи в СЗТ C"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16449539
         CurrentDate     =   39781
      End
      Begin VB.CheckBox lblDoneDate_GE 
         Caption         =   "Дата передачи в СЗТ C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   1485
         Width           =   3000
      End
      Begin VB.ComboBox cmbDocOK 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   50
         ToolTipText     =   "Документы получены"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblDocOK 
         Caption         =   "Документы получены:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   49
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheCoordinator 
         Height          =   300
         Left            =   9150
         TabIndex        =   48
         Tag             =   "refopen.ico"
         ToolTipText     =   "Координатор"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCoordinator 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   47
         ToolTipText     =   "Координатор"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblTheCoordinator 
         Caption         =   "Координатор:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         Top             =   75
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheDistrict 
         Height          =   300
         Left            =   6000
         TabIndex        =   45
         Tag             =   "refopen.ico"
         ToolTipText     =   "Район"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDistrict 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   44
         ToolTipText     =   "Район"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.CheckBox lblTheDistrict 
         Caption         =   "Район:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   43
         Top             =   5715
         Width           =   3000
      End
      Begin VB.ComboBox cmbSrochDogovor 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   42
         ToolTipText     =   "Срочный доровор"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.CheckBox lblSrochDogovor 
         Caption         =   "Срочный доровор:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   41
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdVidanModem 
         Height          =   300
         Left            =   6000
         TabIndex        =   40
         Tag             =   "refopen.ico"
         ToolTipText     =   "Выданный модем"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtVidanModem 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   39
         ToolTipText     =   "Выданный модем"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblVidanModem 
         Caption         =   "Выданный модем:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   4305
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheMaster 
         Height          =   300
         Left            =   6000
         TabIndex        =   37
         Tag             =   "refopen.ico"
         ToolTipText     =   "Инженер"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheMaster 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   36
         ToolTipText     =   "Инженер"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.CheckBox lblTheMaster 
         Caption         =   "Инженер:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdOperator 
         Height          =   300
         Left            =   6000
         TabIndex        =   34
         Tag             =   "refopen.ico"
         ToolTipText     =   "Оператор"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOperator 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   33
         ToolTipText     =   "Оператор"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblOperator 
         Caption         =   "Оператор:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMetro 
         Height          =   300
         Left            =   6000
         TabIndex        =   31
         Tag             =   "refopen.ico"
         ToolTipText     =   "Метро"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMetro 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   30
         ToolTipText     =   "Метро"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblMetro 
         Caption         =   "Метро:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2190
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdGelVREMJA 
         Height          =   300
         Left            =   6000
         TabIndex        =   28
         Tag             =   "refopen.ico"
         ToolTipText     =   "Желаемое время визита инсталятора"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtGelVREMJA 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   27
         ToolTipText     =   "Желаемое время визита инсталятора"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblGelVREMJA 
         Caption         =   "Желаемое время визита инсталятора:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpGelDATA_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         ToolTipText     =   "Желаемая дата визита инсталятора по"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16449539
         CurrentDate     =   39781
      End
      Begin VB.CheckBox lblGelDATA_LE 
         Caption         =   "Желаемая дата визита инсталятора по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpGelDATA_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         ToolTipText     =   "Желаемая дата визита инсталятора C"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16449539
         CurrentDate     =   39781
      End
      Begin VB.CheckBox lblGelDATA_GE 
         Caption         =   "Желаемая дата визита инсталятора C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtVremjaDljaSvjazi 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   21
         ToolTipText     =   "Время для связи"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.CheckBox lblVremjaDljaSvjazi 
         Caption         =   "Время для связи:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtKontTELEFON 
         Height          =   300
         Left            =   300
         MaxLength       =   100
         TabIndex        =   19
         ToolTipText     =   "Контактный телефон"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.CheckBox lblKontTELEFON 
         Caption         =   "Контактный телефон:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtKontEMAIL 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   17
         ToolTipText     =   "Контактный e-mail"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblKontEMAIL 
         Caption         =   "Контактный e-mail:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtKontLIZO 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   15
         ToolTipText     =   "Контактное лицо"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblKontLIZO 
         Caption         =   "Контактное лицо:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtAdres 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   13
         ToolTipText     =   "Адрес"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblAdres 
         Caption         =   "Адрес:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtFIO 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   11
         ToolTipText     =   "ФИО"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblFIO 
         Caption         =   "ФИО:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpData_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Дата и время подачи заявки по"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16449539
         CurrentDate     =   39781
      End
      Begin VB.CheckBox lblData_LE 
         Caption         =   "Дата и время подачи заявки по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpData_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Дата и время подачи заявки C"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16449539
         CurrentDate     =   39781
      End
      Begin VB.CheckBox lblData_GE 
         Caption         =   "Дата и время подачи заявки C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtNomerZayavSYZIZ 
         Height          =   300
         Left            =   300
         MaxLength       =   100
         TabIndex        =   5
         ToolTipText     =   "Номер заявки "
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblNomerZayavSYZIZ 
         Caption         =   "Номер заявки :"
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
Attribute VB_Name = "frmTP_Zay"
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

ts.Tabs.Item(1).Caption = "Заявка"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "TP_Zay", "fctlTP_Zay"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtNomerZayavSYZIZ_Change()
  Changing
End Sub
Private Sub dtpData_GE_Change()
  Changing
End Sub
Private Sub dtpData_LE_Change()
  Changing
End Sub
Private Sub txtFIO_Change()
  Changing
End Sub
Private Sub txtAdres_Change()
  Changing
End Sub
Private Sub txtKontLIZO_Change()
  Changing
End Sub
Private Sub txtKontEMAIL_Change()
  Changing
End Sub
Private Sub txtKontTELEFON_Change()
  Changing
End Sub
Private Sub txtVremjaDljaSvjazi_Change()
  Changing
End Sub
Private Sub dtpGelDATA_GE_Change()
  Changing
End Sub
Private Sub dtpGelDATA_LE_Change()
  Changing
End Sub
Private Sub txtGelVREMJA_Change()
  Changing
End Sub
Private Sub cmdGelVREMJA_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_VrVisInst", id, brief) Then
          txtGelVREMJA.Tag = Left(id, 38)
          txtGelVREMJA = brief
        End If
End Sub
Private Sub cmdGelVREMJA_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtMetro_Change()
  Changing
End Sub
Private Sub cmdMetro_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Metro", id, brief) Then
          txtMetro.Tag = Left(id, 38)
          txtMetro = brief
        End If
End Sub
Private Sub cmdMetro_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtOperator_Change()
  Changing
End Sub
Private Sub cmdOperator_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Oper", id, brief) Then
          txtOperator.Tag = Left(id, 38)
          txtOperator = brief
        End If
End Sub
Private Sub cmdOperator_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtTheMaster_Change()
  Changing
End Sub
Private Sub cmdTheMaster_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Ing", id, brief) Then
          txtTheMaster.Tag = Left(id, 38)
          txtTheMaster = brief
        End If
End Sub
Private Sub cmdTheMaster_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtVidanModem_Change()
  Changing
End Sub
Private Sub cmdVidanModem_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Modem", id, brief) Then
          txtVidanModem.Tag = Left(id, 38)
          txtVidanModem = brief
        End If
End Sub
Private Sub cmdVidanModem_MenuClick(ByVal sCaption As String)
End Sub
Private Sub cmbSrochDogovor_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtTheDistrict_Change()
  Changing
End Sub
Private Sub txtTheCoordinator_Change()
  Changing
End Sub
Private Sub cmdTheCoordinator_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Coord", id, brief) Then
          txtTheCoordinator.Tag = Left(id, 38)
          txtTheCoordinator = brief
        End If
End Sub
Private Sub cmdTheCoordinator_MenuClick(ByVal sCaption As String)
End Sub
Private Sub cmbDocOK_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub dtpDoneDate_GE_Change()
  Changing
End Sub
Private Sub dtpDoneDate_LE_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtNomerZayavSYZIZ = ""
dtpData_GE = Now
dtpData_LE = Now
txtFIO = ""
txtAdres = ""
txtKontLIZO = ""
txtKontEMAIL = ""
txtKontTELEFON = ""
txtVremjaDljaSvjazi = ""
dtpGelDATA_GE = Date
dtpGelDATA_LE = Date
  txtGelVREMJA.Tag = ""
  txtGelVREMJA = ""
 LoadBtnPictures cmdGelVREMJA, cmdGelVREMJA.Tag
  cmdGelVREMJA.RemoveAllMenu
  txtMetro.Tag = ""
  txtMetro = ""
 LoadBtnPictures cmdMetro, cmdMetro.Tag
  cmdMetro.RemoveAllMenu
  txtOperator.Tag = ""
  txtOperator = ""
 LoadBtnPictures cmdOperator, cmdOperator.Tag
  cmdOperator.RemoveAllMenu
  txtTheMaster.Tag = ""
  txtTheMaster = ""
 LoadBtnPictures cmdTheMaster, cmdTheMaster.Tag
  cmdTheMaster.RemoveAllMenu
  txtVidanModem.Tag = ""
  txtVidanModem = ""
 LoadBtnPictures cmdVidanModem, cmdVidanModem.Tag
  cmdVidanModem.RemoveAllMenu
cmbSrochDogovor.Clear
cmbSrochDogovor.AddItem "Да"
cmbSrochDogovor.ItemData(cmbSrochDogovor.NewIndex) = -1
cmbSrochDogovor.AddItem "Нет"
cmbSrochDogovor.ItemData(cmbSrochDogovor.NewIndex) = 0
  txtTheDistrict.Tag = ""
  txtTheDistrict = ""
 LoadBtnPictures cmdTheDistrict, cmdTheDistrict.Tag
  cmdTheDistrict.RemoveAllMenu
  txtTheCoordinator.Tag = ""
  txtTheCoordinator = ""
 LoadBtnPictures cmdTheCoordinator, cmdTheCoordinator.Tag
  cmdTheCoordinator.RemoveAllMenu
cmbDocOK.Clear
cmbDocOK.AddItem "Да"
cmbDocOK.ItemData(cmbDocOK.NewIndex) = -1
cmbDocOK.AddItem "Нет"
cmbDocOK.ItemData(cmbDocOK.NewIndex) = 0
dtpDoneDate_GE = Date
dtpDoneDate_LE = Date
OnInit = False
End Sub



