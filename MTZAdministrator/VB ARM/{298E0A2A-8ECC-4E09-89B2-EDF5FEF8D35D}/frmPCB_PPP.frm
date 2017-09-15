VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmPCB_PPP 
   Caption         =   "Фильтр для Задача на проектирование ПП"
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
         Left            =   16050
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   109
         ToolTipText     =   "Примечание"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComment 
         Caption         =   "Примечание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   108
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDueDate_LE 
         Height          =   300
         Left            =   16050
         TabIndex        =   107
         ToolTipText     =   "Общий срок выполнения по"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblDueDate_LE 
         Caption         =   "Общий срок выполнения по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   106
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDueDate_GE 
         Height          =   300
         Left            =   16050
         TabIndex        =   105
         ToolTipText     =   "Общий срок выполнения C"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblDueDate_GE 
         Caption         =   "Общий срок выполнения C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   104
         Top             =   2190
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdConstructorRef 
         Height          =   300
         Left            =   18600
         TabIndex        =   103
         Tag             =   "refopen.ico"
         ToolTipText     =   "Конструктор"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtConstructorRef 
         Height          =   300
         Left            =   16050
         Locked          =   -1  'True
         TabIndex        =   102
         ToolTipText     =   "Конструктор"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblConstructorRef 
         Caption         =   "Конструктор:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   101
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtDocLength_LE 
         Height          =   300
         Left            =   16050
         MaxLength       =   15
         TabIndex        =   100
         ToolTipText     =   "Срок оформления КД меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblDocLength_LE 
         Caption         =   "Срок оформления КД меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   99
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtDocLength_GE 
         Height          =   300
         Left            =   16050
         MaxLength       =   15
         TabIndex        =   98
         ToolTipText     =   "Срок оформления КД больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblDocLength_GE 
         Caption         =   "Срок оформления КД больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   97
         Top             =   75
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdEstimatedByRef 
         Height          =   300
         Left            =   15450
         TabIndex        =   96
         Tag             =   "refopen.ico"
         ToolTipText     =   "Оценку провёл"
         Top             =   6240
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtEstimatedByRef 
         Height          =   300
         Left            =   12900
         Locked          =   -1  'True
         TabIndex        =   95
         ToolTipText     =   "Оценку провёл"
         Top             =   6240
         Width           =   2550
      End
      Begin VB.CheckBox lblEstimatedByRef 
         Caption         =   "Оценку провёл:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   94
         Top             =   5910
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEstimationDT_LE 
         Height          =   300
         Left            =   12900
         TabIndex        =   93
         ToolTipText     =   "Дата оценки по"
         Top             =   5535
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblEstimationDT_LE 
         Caption         =   "Дата оценки по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   92
         Top             =   5205
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEstimationDT_GE 
         Height          =   300
         Left            =   12900
         TabIndex        =   91
         ToolTipText     =   "Дата оценки C"
         Top             =   4830
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblEstimationDT_GE 
         Caption         =   "Дата оценки C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   90
         Top             =   4500
         Width           =   3000
      End
      Begin VB.TextBox txtDopNeeds 
         Height          =   1200
         Left            =   12900
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   89
         ToolTipText     =   "Дополнительные требования"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblDopNeeds 
         Caption         =   "Дополнительные требования:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   88
         Top             =   2895
         Width           =   3000
      End
      Begin VB.ComboBox cmbWarmAnalize 
         Height          =   315
         Left            =   12900
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   87
         ToolTipText     =   "Тепловой анализ"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblWarmAnalize 
         Caption         =   "Тепловой анализ:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   86
         Top             =   2190
         Width           =   3000
      End
      Begin VB.ComboBox cmbNeeds3D 
         Height          =   315
         Left            =   12900
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   85
         ToolTipText     =   "3D моделирование"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblNeeds3D 
         Caption         =   "3D моделирование:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   84
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpWhantedDT_LE 
         Height          =   300
         Left            =   12900
         TabIndex        =   83
         ToolTipText     =   "Желаемая дата завершения по"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblWhantedDT_LE 
         Caption         =   "Желаемая дата завершения по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   82
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpWhantedDT_GE 
         Height          =   300
         Left            =   12900
         TabIndex        =   81
         ToolTipText     =   "Желаемая дата завершения C"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblWhantedDT_GE 
         Caption         =   "Желаемая дата завершения C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   80
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtComponents_LE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   79
         ToolTipText     =   "Кол-во типов компонентов меньше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblComponents_LE 
         Caption         =   "Кол-во типов компонентов меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   78
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtComponents_GE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   77
         ToolTipText     =   "Кол-во типов компонентов больше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblComponents_GE 
         Caption         =   "Кол-во типов компонентов больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   76
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtOutlets_LE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   75
         ToolTipText     =   "Кол-во выводов меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblOutlets_LE 
         Caption         =   "Кол-во выводов меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   74
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtOutlets_GE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   73
         ToolTipText     =   "Кол-во выводов больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblOutlets_GE 
         Caption         =   "Кол-во выводов больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   72
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtLayers_LE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   71
         ToolTipText     =   "Кол-во слоёв ПП меньше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblLayers_LE 
         Caption         =   "Кол-во слоёв ПП меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   70
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtLayers_GE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   69
         ToolTipText     =   "Кол-во слоёв ПП больше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblLayers_GE 
         Caption         =   "Кол-во слоёв ПП больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   68
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtSquareDM_LE 
         Height          =   300
         Left            =   9750
         MaxLength       =   27
         TabIndex        =   67
         ToolTipText     =   "Площадь ПП (дм2) меньше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblSquareDM_LE 
         Caption         =   "Площадь ПП (дм2) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   66
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtSquareDM_GE 
         Height          =   300
         Left            =   9750
         MaxLength       =   27
         TabIndex        =   65
         ToolTipText     =   "Площадь ПП (дм2) больше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblSquareDM_GE 
         Caption         =   "Площадь ПП (дм2) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   64
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtWidthMM_LE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   63
         ToolTipText     =   "Ширина ПП (мм) меньше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblWidthMM_LE 
         Caption         =   "Ширина ПП (мм) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   62
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtWidthMM_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   61
         ToolTipText     =   "Ширина ПП (мм) больше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblWidthMM_GE 
         Caption         =   "Ширина ПП (мм) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   60
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtLegthMM_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   59
         ToolTipText     =   "Длинна ПП (мм) меньше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblLegthMM_LE 
         Caption         =   "Длинна ПП (мм) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   58
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtLegthMM_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   57
         ToolTipText     =   "Длинна ПП (мм) больше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblLegthMM_GE 
         Caption         =   "Длинна ПП (мм) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   56
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactEndDT_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   55
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
         TabIndex        =   54
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactEndDT_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   53
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
         TabIndex        =   52
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactStartDT_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   51
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
         TabIndex        =   50
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactStartDT_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   49
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
         TabIndex        =   48
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanEndDT_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   47
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
         TabIndex        =   46
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanEndDT_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   45
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
         TabIndex        =   44
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanStartDT_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   43
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
         TabIndex        =   42
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanStartDT_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   41
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
         TabIndex        =   40
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtPriceResNDS_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   39
         ToolTipText     =   "Цена уст. (без НДС) меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceResNDS_LE 
         Caption         =   "Цена уст. (без НДС) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtPriceResNDS_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   37
         ToolTipText     =   "Цена уст. (без НДС) больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceResNDS_GE 
         Caption         =   "Цена уст. (без НДС) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRes_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   35
         ToolTipText     =   "Цена уст. (с НДС) меньше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRes_LE 
         Caption         =   "Цена уст. (с НДС) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRes_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   33
         ToolTipText     =   "Цена уст. (с НДС) больше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRes_GE 
         Caption         =   "Цена уст. (с НДС) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRecom_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   31
         ToolTipText     =   "Рек. Цена меньше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecom_LE 
         Caption         =   "Рек. Цена меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRecom_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   29
         ToolTipText     =   "Рек. Цена больше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecom_GE 
         Caption         =   "Рек. Цена больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCreatedByRef 
         Height          =   300
         Left            =   6000
         TabIndex        =   27
         Tag             =   "refopen.ico"
         ToolTipText     =   "Создал"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCreatedByRef 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   26
         ToolTipText     =   "Создал"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblCreatedByRef 
         Caption         =   "Создал:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   24
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
         Left            =   300
         TabIndex        =   23
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   22
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
         Left            =   300
         TabIndex        =   21
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtProductPeriod_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   20
         ToolTipText     =   "Срок проектирования меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblProductPeriod_LE 
         Caption         =   "Срок проектирования меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtProductPeriod_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   18
         ToolTipText     =   "Срок проектирования больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblProductPeriod_GE 
         Caption         =   "Срок проектирования больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdSoftType 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Пакет проектирования"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSoftType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Пакет проектирования"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblSoftType 
         Caption         =   "Пакет проектирования:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdFormatKD 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Формат КД"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFormatKD 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Формат КД"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblFormatKD 
         Caption         =   "Формат КД:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2190
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdControlerRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ответственный"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtControlerRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Ответственный"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblControlerRef 
         Caption         =   "Ответственный:"
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
         ToolTipText     =   "Номер"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblTheName 
         Caption         =   "Номер:"
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
Attribute VB_Name = "frmPCB_PPP"
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
  TSCustom.Init ts, "PCB_PPP", "fctlPCB_PPP"
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
Private Sub txtFormatKD_Change()
  Changing
End Sub
Private Sub cmdFormatKD_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_FormatKD", id, brief) Then
          txtFormatKD.Tag = Left(id, 38)
          txtFormatKD = brief
        End If
End Sub
Private Sub txtSoftType_Change()
  Changing
End Sub
Private Sub cmdSoftType_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_Soft", id, brief) Then
          txtSoftType.Tag = Left(id, 38)
          txtSoftType = brief
        End If
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
Private Sub dtpCreatedDT_GE_Change()
  Changing
End Sub
Private Sub dtpCreatedDT_LE_Change()
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
Private Sub txtLegthMM_GE_Validate(Cancel As Boolean)
If txtLegthMM_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtLegthMM_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtLegthMM_GE.Text) <> CLng(val(txtLegthMM_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtLegthMM_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtLegthMM_GE_Change()
  Changing
End Sub
Private Sub txtLegthMM_LE_Validate(Cancel As Boolean)
If txtLegthMM_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtLegthMM_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtLegthMM_LE.Text) <> CLng(val(txtLegthMM_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtLegthMM_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtLegthMM_LE_Change()
  Changing
End Sub
Private Sub txtWidthMM_GE_Validate(Cancel As Boolean)
If txtWidthMM_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWidthMM_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtWidthMM_GE.Text) <> CLng(val(txtWidthMM_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtWidthMM_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWidthMM_GE_Change()
  Changing
End Sub
Private Sub txtWidthMM_LE_Validate(Cancel As Boolean)
If txtWidthMM_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWidthMM_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtWidthMM_LE.Text) <> CLng(val(txtWidthMM_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtWidthMM_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWidthMM_LE_Change()
  Changing
End Sub
Private Sub txtSquareDM_GE_Validate(Cancel As Boolean)
If txtSquareDM_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSquareDM_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtSquareDM_GE.Text) < -922337203685478# Or val(txtSquareDM_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtSquareDM_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtSquareDM_GE_Change()
  Changing
End Sub
Private Sub txtSquareDM_LE_Validate(Cancel As Boolean)
If txtSquareDM_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSquareDM_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtSquareDM_LE.Text) < -922337203685478# Or val(txtSquareDM_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtSquareDM_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtSquareDM_LE_Change()
  Changing
End Sub
Private Sub txtLayers_GE_Validate(Cancel As Boolean)
If txtLayers_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtLayers_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtLayers_GE.Text) <> CLng(val(txtLayers_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtLayers_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtLayers_GE_Change()
  Changing
End Sub
Private Sub txtLayers_LE_Validate(Cancel As Boolean)
If txtLayers_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtLayers_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtLayers_LE.Text) <> CLng(val(txtLayers_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtLayers_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtLayers_LE_Change()
  Changing
End Sub
Private Sub txtOutlets_GE_Validate(Cancel As Boolean)
If txtOutlets_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtOutlets_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtOutlets_GE.Text) <> CLng(val(txtOutlets_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtOutlets_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtOutlets_GE_Change()
  Changing
End Sub
Private Sub txtOutlets_LE_Validate(Cancel As Boolean)
If txtOutlets_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtOutlets_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtOutlets_LE.Text) <> CLng(val(txtOutlets_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtOutlets_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtOutlets_LE_Change()
  Changing
End Sub
Private Sub txtComponents_GE_Validate(Cancel As Boolean)
If txtComponents_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtComponents_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtComponents_GE.Text) <> CLng(val(txtComponents_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtComponents_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtComponents_GE_Change()
  Changing
End Sub
Private Sub txtComponents_LE_Validate(Cancel As Boolean)
If txtComponents_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtComponents_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtComponents_LE.Text) <> CLng(val(txtComponents_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtComponents_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtComponents_LE_Change()
  Changing
End Sub
Private Sub dtpWhantedDT_GE_Change()
  Changing
End Sub
Private Sub dtpWhantedDT_LE_Change()
  Changing
End Sub
Private Sub cmbNeeds3D_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbWarmAnalize_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtDopNeeds_Change()
  Changing
End Sub
Private Sub dtpEstimationDT_GE_Change()
  Changing
End Sub
Private Sub dtpEstimationDT_LE_Change()
  Changing
End Sub
Private Sub txtEstimatedByRef_Change()
  Changing
End Sub
Private Sub cmdEstimatedByRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtEstimatedByRef.Tag = Left(id, 38)
          txtEstimatedByRef = brief
        End If
End Sub
Private Sub txtDocLength_GE_Validate(Cancel As Boolean)
If txtDocLength_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDocLength_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtDocLength_GE.Text) <> CLng(val(txtDocLength_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtDocLength_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDocLength_GE_Change()
  Changing
End Sub
Private Sub txtDocLength_LE_Validate(Cancel As Boolean)
If txtDocLength_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDocLength_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtDocLength_LE.Text) <> CLng(val(txtDocLength_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtDocLength_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDocLength_LE_Change()
  Changing
End Sub
Private Sub txtConstructorRef_Change()
  Changing
End Sub
Private Sub cmdConstructorRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtConstructorRef.Tag = Left(id, 38)
          txtConstructorRef = brief
        End If
End Sub
Private Sub dtpDueDate_GE_Change()
  Changing
End Sub
Private Sub dtpDueDate_LE_Change()
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
  txtControlerRef.Tag = ""
  txtControlerRef = ""
 LoadBtnPictures cmdControlerRef, cmdControlerRef.Tag
  cmdControlerRef.RemoveAllMenu
  txtFormatKD.Tag = ""
  txtFormatKD = ""
 LoadBtnPictures cmdFormatKD, cmdFormatKD.Tag
  cmdFormatKD.RemoveAllMenu
  txtSoftType.Tag = ""
  txtSoftType = ""
 LoadBtnPictures cmdSoftType, cmdSoftType.Tag
  cmdSoftType.RemoveAllMenu
dtpCreatedDT_GE = Now
dtpCreatedDT_LE = Now
  txtCreatedByRef.Tag = ""
  txtCreatedByRef = ""
 LoadBtnPictures cmdCreatedByRef, cmdCreatedByRef.Tag
  cmdCreatedByRef.RemoveAllMenu
dtpPlanStartDT_GE = Date
dtpPlanStartDT_LE = Date
dtpPlanEndDT_GE = Date
dtpPlanEndDT_LE = Date
dtpFactStartDT_GE = Date
dtpFactStartDT_LE = Date
dtpFactEndDT_GE = Date
dtpFactEndDT_LE = Date
dtpWhantedDT_GE = Date
dtpWhantedDT_LE = Date
cmbNeeds3D.Clear
cmbNeeds3D.AddItem "Да"
cmbNeeds3D.ItemData(cmbNeeds3D.NewIndex) = -1
cmbNeeds3D.AddItem "Нет"
cmbNeeds3D.ItemData(cmbNeeds3D.NewIndex) = 0
cmbWarmAnalize.Clear
cmbWarmAnalize.AddItem "Да"
cmbWarmAnalize.ItemData(cmbWarmAnalize.NewIndex) = -1
cmbWarmAnalize.AddItem "Нет"
cmbWarmAnalize.ItemData(cmbWarmAnalize.NewIndex) = 0
dtpEstimationDT_GE = Now
dtpEstimationDT_LE = Now
  txtEstimatedByRef.Tag = ""
  txtEstimatedByRef = ""
 LoadBtnPictures cmdEstimatedByRef, cmdEstimatedByRef.Tag
  cmdEstimatedByRef.RemoveAllMenu
  txtConstructorRef.Tag = ""
  txtConstructorRef = ""
 LoadBtnPictures cmdConstructorRef, cmdConstructorRef.Tag
  cmdConstructorRef.RemoveAllMenu
dtpDueDate_GE = Date
dtpDueDate_LE = Date
OnInit = False
End Sub



