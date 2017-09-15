VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmITTOPT 
   Caption         =   "Фильтр для Задание на оптимизацию склада"
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
      Begin MSComCtl2.DTPicker dtpDateToOptimize_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   54
         ToolTipText     =   "Плановая дата оптимизации по"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblDateToOptimize_LE 
         Caption         =   "Плановая дата оптимизации по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDateToOptimize_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   52
         ToolTipText     =   "Плановая дата оптимизации C"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblDateToOptimize_GE 
         Caption         =   "Плановая дата оптимизации C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpOPtDate_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   50
         ToolTipText     =   "Дата создания заявки по"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblOPtDate_LE 
         Caption         =   "Дата создания заявки по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   49
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpOPtDate_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         ToolTipText     =   "Дата создания заявки C"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblOPtDate_GE 
         Caption         =   "Дата создания заявки C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         Top             =   2190
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsCaliber 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   46
         ToolTipText     =   "Калиброваный товар"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblIsCaliber 
         Caption         =   "Калиброваный товар:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         Top             =   1485
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsBrak 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   44
         ToolTipText     =   "Брак"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblIsBrak 
         Caption         =   "Брак:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpexp_date_from_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         ToolTipText     =   "Срок годности с по"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblexp_date_from_LE 
         Caption         =   "Срок годности с по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   41
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpexp_date_from_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   40
         ToolTipText     =   "Срок годности с C"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblexp_date_from_GE 
         Caption         =   "Срок годности с C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpexp_date_to_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         ToolTipText     =   "Срок годности по по"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblexp_date_to_LE 
         Caption         =   "Срок годности по по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   5010
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpexp_date_to_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         ToolTipText     =   "Срок годности по C"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblexp_date_to_GE 
         Caption         =   "Срок годности по C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpMade_date_From_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         ToolTipText     =   "Дата производства с по"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblMade_date_From_LE 
         Caption         =   "Дата производства с по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpMade_date_From_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         ToolTipText     =   "Дата производства с C"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblMade_date_From_GE 
         Caption         =   "Дата производства с C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpMade_date_to_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         ToolTipText     =   "Дата производства по по"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblMade_date_to_LE 
         Caption         =   "Дата производства по по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpMade_date_to_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         ToolTipText     =   "Дата производства по C"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   88997891
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblMade_date_to_GE 
         Caption         =   "Дата производства по C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   1485
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPartRef 
         Height          =   300
         Left            =   6000
         TabIndex        =   26
         Tag             =   "refopen.ico"
         ToolTipText     =   "Партия"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPartRef 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   25
         ToolTipText     =   "Партия"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.CheckBox lblPartRef 
         Caption         =   "Партия:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtarticul 
         Height          =   300
         Left            =   3450
         MaxLength       =   30
         TabIndex        =   23
         ToolTipText     =   "Артикул"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblarticul 
         Caption         =   "Артикул:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtVidOtruba 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   21
         ToolTipText     =   "Вид отруба"
         Top             =   6435
         Width           =   3000
      End
      Begin VB.CheckBox lblVidOtruba 
         Caption         =   "Вид отруба:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   6105
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdKILL_NUMBER 
         Height          =   300
         Left            =   2850
         TabIndex        =   19
         Tag             =   "refopen.ico"
         ToolTipText     =   "№ бойни"
         Top             =   5730
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtKILL_NUMBER 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   18
         ToolTipText     =   "№ бойни"
         Top             =   5730
         Width           =   2550
      End
      Begin VB.CheckBox lblKILL_NUMBER 
         Caption         =   "№ бойни:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5400
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdFactory 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Завод"
         Top             =   5025
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFactory 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Завод"
         Top             =   5025
         Width           =   2550
      End
      Begin VB.CheckBox lblFactory 
         Caption         =   "Завод:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4695
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdmade_country 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страна производитель"
         Top             =   4320
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtmade_country 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Страна производитель"
         Top             =   4320
         Width           =   2550
      End
      Begin VB.CheckBox lblmade_country 
         Caption         =   "Страна производитель:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3990
         Width           =   3000
      End
      Begin VB.TextBox txtgood 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   10
         ToolTipText     =   "Товар"
         Top             =   2715
         Width           =   3000
      End
      Begin VB.CheckBox lblgood 
         Caption         =   "Товар:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2385
         Width           =   3000
      End
      Begin VB.TextBox txtTheClient 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   8
         ToolTipText     =   "Клиент"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblTheClient 
         Caption         =   "Клиент:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdOptType 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип оптимизации"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOptType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Тип оптимизации"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblOptType 
         Caption         =   "Тип оптимизации:"
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
Attribute VB_Name = "frmITTOPT"
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
  TSCustom.Init ts, "ITTOPT", "fctlITTOPT"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtOptType_Change()
  Changing
End Sub
Private Sub cmdOptType_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_OPTTYPE", id, brief) Then
          txtOptType.Tag = Left(id, 38)
          txtOptType = brief
        End If
End Sub
Private Sub cmdOptType_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtTheClient_Change()
  Changing
End Sub
Private Sub txtgood_Change()
  Changing
End Sub
Private Sub txtmade_country_Change()
  Changing
End Sub
Private Sub cmdmade_country_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_COUNTRY", id, brief) Then
          txtmade_country.Tag = Left(id, 38)
          txtmade_country = brief
        End If
End Sub
Private Sub cmdmade_country_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtFactory_Change()
  Changing
End Sub
Private Sub cmdFactory_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_FACTORY", id, brief) Then
          txtFactory.Tag = Left(id, 38)
          txtFactory = brief
        End If
End Sub
Private Sub cmdFactory_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtKILL_NUMBER_Change()
  Changing
End Sub
Private Sub cmdKILL_NUMBER_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_KILLPLACE", id, brief) Then
          txtKILL_NUMBER.Tag = Left(id, 38)
          txtKILL_NUMBER = brief
        End If
End Sub
Private Sub cmdKILL_NUMBER_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtVidOtruba_Change()
  Changing
End Sub
Private Sub txtarticul_Change()
  Changing
End Sub
Private Sub txtPartRef_Change()
  Changing
End Sub
Private Sub cmdPartRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_PART", id, brief) Then
          txtPartRef.Tag = Left(id, 38)
          txtPartRef = brief
        End If
End Sub
Private Sub cmdPartRef_MenuClick(ByVal sCaption As String)
End Sub
Private Sub dtpMade_date_to_GE_Change()
  Changing
End Sub
Private Sub dtpMade_date_to_LE_Change()
  Changing
End Sub
Private Sub dtpMade_date_From_GE_Change()
  Changing
End Sub
Private Sub dtpMade_date_From_LE_Change()
  Changing
End Sub
Private Sub dtpexp_date_to_GE_Change()
  Changing
End Sub
Private Sub dtpexp_date_to_LE_Change()
  Changing
End Sub
Private Sub dtpexp_date_from_GE_Change()
  Changing
End Sub
Private Sub dtpexp_date_from_LE_Change()
  Changing
End Sub
Private Sub cmbIsBrak_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbIsCaliber_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub dtpOPtDate_GE_Change()
  Changing
End Sub
Private Sub dtpOPtDate_LE_Change()
  Changing
End Sub
Private Sub dtpDateToOptimize_GE_Change()
  Changing
End Sub
Private Sub dtpDateToOptimize_LE_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

  txtOptType.Tag = ""
  txtOptType = ""
 LoadBtnPictures cmdOptType, cmdOptType.Tag
  cmdOptType.RemoveAllMenu
  txtmade_country.Tag = ""
  txtmade_country = ""
 LoadBtnPictures cmdmade_country, cmdmade_country.Tag
  cmdmade_country.RemoveAllMenu
  txtFactory.Tag = ""
  txtFactory = ""
 LoadBtnPictures cmdFactory, cmdFactory.Tag
  cmdFactory.RemoveAllMenu
  txtKILL_NUMBER.Tag = ""
  txtKILL_NUMBER = ""
 LoadBtnPictures cmdKILL_NUMBER, cmdKILL_NUMBER.Tag
  cmdKILL_NUMBER.RemoveAllMenu
txtVidOtruba = ""
txtarticul = ""
  txtPartRef.Tag = ""
  txtPartRef = ""
 LoadBtnPictures cmdPartRef, cmdPartRef.Tag
  cmdPartRef.RemoveAllMenu
dtpMade_date_to_GE = Date
dtpMade_date_to_LE = Date
dtpMade_date_From_GE = Date
dtpMade_date_From_LE = Date
dtpexp_date_to_GE = Date
dtpexp_date_to_LE = Date
dtpexp_date_from_GE = Date
dtpexp_date_from_LE = Date
cmbIsBrak.Clear
cmbIsBrak.AddItem "Да"
cmbIsBrak.ItemData(cmbIsBrak.NewIndex) = -1
cmbIsBrak.AddItem "Нет"
cmbIsBrak.ItemData(cmbIsBrak.NewIndex) = 0
cmbIsCaliber.Clear
cmbIsCaliber.AddItem "Да"
cmbIsCaliber.ItemData(cmbIsCaliber.NewIndex) = -1
cmbIsCaliber.AddItem "Нет"
cmbIsCaliber.ItemData(cmbIsCaliber.NewIndex) = 0
dtpOPtDate_GE = Date
dtpOPtDate_LE = Date
dtpDateToOptimize_GE = Date
dtpDateToOptimize_LE = Date
OnInit = False
End Sub



