VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmITTOPT 
   Caption         =   "Фильтр для Задание на перемещения"
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
         Left            =   3450
         TabIndex        =   26
         ToolTipText     =   "Плановая дата оптимизации по"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39193
      End
      Begin VB.CheckBox lblDateToOptimize_LE 
         Caption         =   "Плановая дата оптимизации по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDateToOptimize_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "Плановая дата оптимизации C"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39193
      End
      Begin VB.CheckBox lblDateToOptimize_GE 
         Caption         =   "Плановая дата оптимизации C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpOPtDate_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   22
         ToolTipText     =   "Дата создания заявки по"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39193
      End
      Begin VB.CheckBox lblOPtDate_LE 
         Caption         =   "Дата создания заявки по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpOPtDate_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   20
         ToolTipText     =   "Дата создания заявки C"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39193
      End
      Begin VB.CheckBox lblOPtDate_GE 
         Caption         =   "Дата создания заявки C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtIsBrak 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   18
         ToolTipText     =   "Брак"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblIsBrak 
         Caption         =   "Брак:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtKILL_NUMBER 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   16
         ToolTipText     =   "№ бойни"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblKILL_NUMBER 
         Caption         =   "№ бойни:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtFactory 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   14
         ToolTipText     =   "Завод"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblFactory 
         Caption         =   "Завод:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtmade_country 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   12
         ToolTipText     =   "Страна производитель"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblmade_country 
         Caption         =   "Страна производитель:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtgood 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   10
         ToolTipText     =   "Товар"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblgood 
         Caption         =   "Товар:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtTheClient 
         Height          =   300
         Left            =   300
         MaxLength       =   255
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
Private Sub txtFactory_Change()
  Changing
End Sub
Private Sub txtKILL_NUMBER_Change()
  Changing
End Sub
Private Sub txtIsBrak_Change()
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
txtTheClient = ""
txtgood = ""
txtmade_country = ""
txtFactory = ""
txtKILL_NUMBER = ""
txtIsBrak = ""
dtpOPtDate_GE = Date
dtpOPtDate_LE = Date
dtpDateToOptimize_GE = Date
dtpDateToOptimize_LE = Date
OnInit = False
End Sub



