VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmPCB_OUtility 
   Caption         =   "Фильтр для Задача на поставку комплектующих"
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
         Left            =   9750
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   69
         ToolTipText     =   "Примечание"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComment 
         Caption         =   "Примечание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   68
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPreSetDT_LE 
         Height          =   300
         Left            =   9750
         TabIndex        =   67
         ToolTipText     =   "Дата и время оценки по"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblPreSetDT_LE 
         Caption         =   "Дата и время оценки по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   66
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPreSetDT_GE 
         Height          =   300
         Left            =   9750
         TabIndex        =   65
         ToolTipText     =   "Дата и время оценки C"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblPreSetDT_GE 
         Caption         =   "Дата и время оценки C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   64
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPriceSetByRef 
         Height          =   300
         Left            =   12300
         TabIndex        =   63
         Tag             =   "refopen.ico"
         ToolTipText     =   "Цену установил"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPriceSetByRef 
         Height          =   300
         Left            =   9750
         Locked          =   -1  'True
         TabIndex        =   62
         ToolTipText     =   "Цену установил"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblPriceSetByRef 
         Caption         =   "Цену установил:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   61
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   60
         ToolTipText     =   "Дата создания по"
         Top             =   6045
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblCreatedDT_LE 
         Caption         =   "Дата создания по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   59
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   58
         ToolTipText     =   "Дата создания C"
         Top             =   5340
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblCreatedDT_GE 
         Caption         =   "Дата создания C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   57
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCreatedByRef 
         Height          =   300
         Left            =   9150
         TabIndex        =   56
         Tag             =   "refopen.ico"
         ToolTipText     =   "Создал"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCreatedByRef 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   55
         ToolTipText     =   "Создал"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblCreatedByRef 
         Caption         =   "Создал:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   54
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactEndDT_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         ToolTipText     =   "Дата окончания факт по"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblFactEndDT_LE 
         Caption         =   "Дата окончания факт по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   52
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactEndDT_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         ToolTipText     =   "Дата окончания факт C"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblFactEndDT_GE 
         Caption         =   "Дата окончания факт C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   50
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactStartDT_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   49
         ToolTipText     =   "Дата начала факт по"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblFactStartDT_LE 
         Caption         =   "Дата начала факт по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactStartDT_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         ToolTipText     =   "Дата начала факт C"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblFactStartDT_GE 
         Caption         =   "Дата начала факт C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanEndDT_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         ToolTipText     =   "Дата окончания план по"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblPlanEndDT_LE 
         Caption         =   "Дата окончания план по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanEndDT_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         ToolTipText     =   "Дата окончания план C"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblPlanEndDT_GE 
         Caption         =   "Дата окончания план C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanStartDT_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   41
         ToolTipText     =   "Дата начала план по"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblPlanStartDT_LE 
         Caption         =   "Дата начала план по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   40
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanStartDT_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         ToolTipText     =   "Дата начала план C"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblPlanStartDT_GE 
         Caption         =   "Дата начала план C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtPriceResNDS_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   37
         ToolTipText     =   "Цена уст. (без НДС) меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceResNDS_LE 
         Caption         =   "Цена уст. (без НДС) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtPriceResNDS_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   35
         ToolTipText     =   "Цена уст. (без НДС) больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceResNDS_GE 
         Caption         =   "Цена уст. (без НДС) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRes_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   33
         ToolTipText     =   "Цена Уст. (с НДС) меньше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRes_LE 
         Caption         =   "Цена Уст. (с НДС) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRes_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   31
         ToolTipText     =   "Цена Уст. (с НДС) больше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRes_GE 
         Caption         =   "Цена Уст. (с НДС) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRecom_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   29
         ToolTipText     =   "Рек. Цена меньше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecom_LE 
         Caption         =   "Рек. Цена меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRecom_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   27
         ToolTipText     =   "Рек. Цена больше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecom_GE 
         Caption         =   "Рек. Цена больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtPriceCommon_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   25
         ToolTipText     =   "Общие затраты меньше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceCommon_LE 
         Caption         =   "Общие затраты меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtPriceCommon_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   23
         ToolTipText     =   "Общие затраты больше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceCommon_GE 
         Caption         =   "Общие затраты больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   22
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtProductPeriod_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   21
         ToolTipText     =   "Срок поставки меньше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblProductPeriod_LE 
         Caption         =   "Срок поставки меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtProductPeriod_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   19
         ToolTipText     =   "Срок поставки больше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblProductPeriod_GE 
         Caption         =   "Срок поставки больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtPriceDelivery_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   17
         ToolTipText     =   "Доставка меньше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceDelivery_LE 
         Caption         =   "Доставка меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtPriceDelivery_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   15
         ToolTipText     =   "Доставка больше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceDelivery_GE 
         Caption         =   "Доставка больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdControlerRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ответственный"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtControlerRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Ответственный"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblControlerRef 
         Caption         =   "Ответственный:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2190
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdDeliveryRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Доставка"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDeliveryRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Доставка"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblDeliveryRef 
         Caption         =   "Доставка:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin VB.ComboBox cmbTaskType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "Тип задачи"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblTaskType 
         Caption         =   "Тип задачи:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtTheName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Код задачи"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblTheName 
         Caption         =   "Код задачи:"
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
Attribute VB_Name = "frmPCB_OUtility"
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
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdOK.Height
  cmdOK.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdOK.Width, cmdOK.Height
  cmdCancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdCancel.Width, cmdOK.Height
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
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdOK.Height
  cmdOK.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdOK.Width, cmdOK.Height
  cmdCancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdCancel.Width, cmdOK.Height
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
  PanelfGroup.Visible = False

   Select Case ts.SelectedItem.Key
   Case "fGroup"
     With PanelfGroup
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
  TSCustom.Init ts, "PCB_OUtility", "fctlPCB_OUtility"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtTheName_Change()
  Changing
End Sub
Private Sub cmbTaskType_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtDeliveryRef_Change()
  Changing
End Sub
Private Sub cmdDeliveryRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_I_Orgs", id, brief) Then
          txtDeliveryRef.Tag = Left(id, 38)
          txtDeliveryRef = brief
        End If
End Sub
Private Sub txtControlerRef_Change()
  Changing
End Sub
Private Sub cmdControlerRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtControlerRef.Tag = Left(id, 38)
          txtControlerRef = brief
        End If
End Sub
Private Sub txtPriceDelivery_GE_Validate(Cancel As Boolean)
If txtPriceDelivery_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceDelivery_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceDelivery_GE.Text) < -922337203685478# Or val(txtPriceDelivery_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceDelivery_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceDelivery_GE_Change()
  Changing
End Sub
Private Sub txtPriceDelivery_LE_Validate(Cancel As Boolean)
If txtPriceDelivery_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceDelivery_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceDelivery_LE.Text) < -922337203685478# Or val(txtPriceDelivery_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceDelivery_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceDelivery_LE_Change()
  Changing
End Sub
Private Sub txtProductPeriod_GE_Validate(Cancel As Boolean)
If txtProductPeriod_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtProductPeriod_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtProductPeriod_GE.Text) <> CLng(val(txtProductPeriod_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtProductPeriod_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtProductPeriod_GE_Change()
  Changing
End Sub
Private Sub txtProductPeriod_LE_Validate(Cancel As Boolean)
If txtProductPeriod_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtProductPeriod_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtProductPeriod_LE.Text) <> CLng(val(txtProductPeriod_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtProductPeriod_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtProductPeriod_LE_Change()
  Changing
End Sub
Private Sub txtPriceCommon_GE_Validate(Cancel As Boolean)
If txtPriceCommon_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceCommon_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceCommon_GE.Text) < -922337203685478# Or val(txtPriceCommon_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceCommon_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceCommon_GE_Change()
  Changing
End Sub
Private Sub txtPriceCommon_LE_Validate(Cancel As Boolean)
If txtPriceCommon_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceCommon_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceCommon_LE.Text) < -922337203685478# Or val(txtPriceCommon_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceCommon_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceCommon_LE_Change()
  Changing
End Sub
Private Sub txtPriceRecom_GE_Validate(Cancel As Boolean)
If txtPriceRecom_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceRecom_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceRecom_GE.Text) < -922337203685478# Or val(txtPriceRecom_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceRecom_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceRecom_GE_Change()
  Changing
End Sub
Private Sub txtPriceRecom_LE_Validate(Cancel As Boolean)
If txtPriceRecom_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceRecom_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceRecom_LE.Text) < -922337203685478# Or val(txtPriceRecom_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceRecom_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceRecom_LE_Change()
  Changing
End Sub
Private Sub txtPriceRes_GE_Validate(Cancel As Boolean)
If txtPriceRes_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceRes_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceRes_GE.Text) < -922337203685478# Or val(txtPriceRes_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceRes_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceRes_GE_Change()
  Changing
End Sub
Private Sub txtPriceRes_LE_Validate(Cancel As Boolean)
If txtPriceRes_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceRes_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceRes_LE.Text) < -922337203685478# Or val(txtPriceRes_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceRes_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceRes_LE_Change()
  Changing
End Sub
Private Sub txtPriceResNDS_GE_Validate(Cancel As Boolean)
If txtPriceResNDS_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceResNDS_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceResNDS_GE.Text) < -922337203685478# Or val(txtPriceResNDS_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceResNDS_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceResNDS_GE_Change()
  Changing
End Sub
Private Sub txtPriceResNDS_LE_Validate(Cancel As Boolean)
If txtPriceResNDS_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceResNDS_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceResNDS_LE.Text) < -922337203685478# Or val(txtPriceResNDS_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceResNDS_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceResNDS_LE_Change()
  Changing
End Sub
Private Sub dtpPlanStartDT_GE_Change()
  Changing
End Sub
Private Sub dtpPlanStartDT_LE_Change()
  Changing
End Sub
Private Sub dtpPlanEndDT_GE_Change()
  Changing
End Sub
Private Sub dtpPlanEndDT_LE_Change()
  Changing
End Sub
Private Sub dtpFactStartDT_GE_Change()
  Changing
End Sub
Private Sub dtpFactStartDT_LE_Change()
  Changing
End Sub
Private Sub dtpFactEndDT_GE_Change()
  Changing
End Sub
Private Sub dtpFactEndDT_LE_Change()
  Changing
End Sub
Private Sub txtCreatedByRef_Change()
  Changing
End Sub
Private Sub cmdCreatedByRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtCreatedByRef.Tag = Left(id, 38)
          txtCreatedByRef = brief
        End If
End Sub
Private Sub dtpCreatedDT_GE_Change()
  Changing
End Sub
Private Sub dtpCreatedDT_LE_Change()
  Changing
End Sub
Private Sub txtPriceSetByRef_Change()
  Changing
End Sub
Private Sub cmdPriceSetByRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtPriceSetByRef.Tag = Left(id, 38)
          txtPriceSetByRef = brief
        End If
End Sub
Private Sub dtpPreSetDT_GE_Change()
  Changing
End Sub
Private Sub dtpPreSetDT_LE_Change()
  Changing
End Sub
Private Sub txtTheComment_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtTheName = ""
cmbTaskType.Clear
cmbTaskType.AddItem "Доставка"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 4
cmbTaskType.AddItem "Изготовление ПП"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 1
cmbTaskType.AddItem "Поставка комплектующих"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 2
cmbTaskType.AddItem "Монтаж ПП"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 0
cmbTaskType.AddItem "Проектирование ПП"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 3
  txtDeliveryRef.Tag = ""
  txtDeliveryRef = ""
 LoadBtnPictures cmdDeliveryRef, cmdDeliveryRef.Tag
  cmdDeliveryRef.RemoveAllMenu
  txtControlerRef.Tag = ""
  txtControlerRef = ""
 LoadBtnPictures cmdControlerRef, cmdControlerRef.Tag
  cmdControlerRef.RemoveAllMenu
dtpPlanStartDT_GE = Date
dtpPlanStartDT_LE = Date
dtpPlanEndDT_GE = Date
dtpPlanEndDT_LE = Date
dtpFactStartDT_GE = Date
dtpFactStartDT_LE = Date
dtpFactEndDT_GE = Date
dtpFactEndDT_LE = Date
  txtCreatedByRef.Tag = ""
  txtCreatedByRef = ""
 LoadBtnPictures cmdCreatedByRef, cmdCreatedByRef.Tag
  cmdCreatedByRef.RemoveAllMenu
dtpCreatedDT_GE = Now
dtpCreatedDT_LE = Now
  txtPriceSetByRef.Tag = ""
  txtPriceSetByRef = ""
 LoadBtnPictures cmdPriceSetByRef, cmdPriceSetByRef.Tag
  cmdPriceSetByRef.RemoveAllMenu
dtpPreSetDT_GE = Now
dtpPreSetDT_LE = Now
OnInit = False
End Sub



