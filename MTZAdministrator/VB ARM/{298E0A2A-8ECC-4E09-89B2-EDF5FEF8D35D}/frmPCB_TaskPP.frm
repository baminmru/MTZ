VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmPCB_TaskPP 
   Caption         =   "Фильтр для Задача на монтаж ПП"
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
         Left            =   22350
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   146
         ToolTipText     =   "Примечание"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComment 
         Caption         =   "Примечание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   145
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPriceSetByRef 
         Height          =   300
         Left            =   24900
         TabIndex        =   144
         Tag             =   "refopen.ico"
         ToolTipText     =   "Цену установил"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPriceSetByRef 
         Height          =   300
         Left            =   22350
         Locked          =   -1  'True
         TabIndex        =   143
         ToolTipText     =   "Цену установил"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblPriceSetByRef 
         Caption         =   "Цену установил:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   142
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCreatedByRef 
         Height          =   300
         Left            =   24900
         TabIndex        =   141
         Tag             =   "refopen.ico"
         ToolTipText     =   "Создал"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCreatedByRef 
         Height          =   300
         Left            =   22350
         Locked          =   -1  'True
         TabIndex        =   140
         ToolTipText     =   "Создал"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblCreatedByRef 
         Caption         =   "Создал:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   139
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEstimationDT_LE 
         Height          =   300
         Left            =   22350
         TabIndex        =   138
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
      Begin VB.CheckBox lblEstimationDT_LE 
         Caption         =   "Дата и время оценки по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   137
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEstimationDT_GE 
         Height          =   300
         Left            =   22350
         TabIndex        =   136
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
      Begin VB.CheckBox lblEstimationDT_GE 
         Caption         =   "Дата и время оценки C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   135
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_LE 
         Height          =   300
         Left            =   22350
         TabIndex        =   134
         ToolTipText     =   "Дата и время создания по"
         Top             =   405
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblCreatedDT_LE 
         Caption         =   "Дата и время создания по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   133
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_GE 
         Height          =   300
         Left            =   19200
         TabIndex        =   132
         ToolTipText     =   "Дата и время создания C"
         Top             =   6240
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblCreatedDT_GE 
         Caption         =   "Дата и время создания C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   131
         Top             =   5910
         Width           =   3000
      End
      Begin VB.TextBox txtDopRequests 
         Height          =   1200
         Left            =   19200
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   130
         ToolTipText     =   "Дополнительные требования"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblDopRequests 
         Caption         =   "Дополнительные требования:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   129
         Top             =   4305
         Width           =   3000
      End
      Begin VB.ComboBox cmbExtraControl 
         Height          =   315
         Left            =   19200
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   128
         ToolTipText     =   "Функ. контр., прогр. и настройка"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblExtraControl 
         Caption         =   "Функ. контр., прогр. и настройка:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   127
         Top             =   3600
         Width           =   3000
      End
      Begin VB.ComboBox cmbAccCustomer 
         Height          =   315
         Left            =   19200
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   126
         ToolTipText     =   "Приёмка заказчика 5"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblAccCustomer 
         Caption         =   "Приёмка заказчика 5:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   125
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtContRentgen_LE 
         Height          =   300
         Left            =   19200
         MaxLength       =   15
         TabIndex        =   124
         ToolTipText     =   "Кол-во рентг. конт. на заготовке, шт. меньше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblContRentgen_LE 
         Caption         =   "Кол-во рентг. конт. на заготовке, шт. меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   123
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtContRentgen_GE 
         Height          =   300
         Left            =   19200
         MaxLength       =   15
         TabIndex        =   122
         ToolTipText     =   "Кол-во рентг. конт. на заготовке, шт. больше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblContRentgen_GE 
         Caption         =   "Кол-во рентг. конт. на заготовке, шт. больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   121
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRentOnce_LE 
         Height          =   300
         Left            =   19200
         MaxLength       =   27
         TabIndex        =   120
         ToolTipText     =   "Цена рентг.контр. за шт, руб меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRentOnce_LE 
         Caption         =   "Цена рентг.контр. за шт, руб меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   119
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRentOnce_GE 
         Height          =   300
         Left            =   19200
         MaxLength       =   27
         TabIndex        =   118
         ToolTipText     =   "Цена рентг.контр. за шт, руб больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRentOnce_GE 
         Caption         =   "Цена рентг.контр. за шт, руб больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   117
         Top             =   75
         Width           =   3000
      End
      Begin VB.ComboBox cmbRentBGA 
         Height          =   315
         Left            =   16050
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   116
         ToolTipText     =   "Рентгенконтроль BGA"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.CheckBox lblRentBGA 
         Caption         =   "Рентгенконтроль BGA:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   115
         Top             =   5715
         Width           =   3000
      End
      Begin VB.ComboBox cmbUseGlue 
         Height          =   315
         Left            =   16050
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   114
         ToolTipText     =   "Установка комп. на клей"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.CheckBox lblUseGlue 
         Caption         =   "Установка комп. на клей:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   113
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdLak 
         Height          =   300
         Left            =   18600
         TabIndex        =   112
         Tag             =   "refopen.ico"
         ToolTipText     =   "Покрытие лаком"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtLak 
         Height          =   300
         Left            =   16050
         Locked          =   -1  'True
         TabIndex        =   111
         ToolTipText     =   "Покрытие лаком"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblLak 
         Caption         =   "Покрытие лаком:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   110
         Top             =   4305
         Width           =   3000
      End
      Begin VB.ComboBox cmbAntisitat 
         Height          =   315
         Left            =   16050
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   109
         ToolTipText     =   "Идивид. антистат. упаковка"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblAntisitat 
         Caption         =   "Идивид. антистат. упаковка:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   108
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdClearAfter 
         Height          =   300
         Left            =   18600
         TabIndex        =   107
         Tag             =   "refopen.ico"
         ToolTipText     =   "Отмывка после монтажа"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtClearAfter 
         Height          =   300
         Left            =   16050
         Locked          =   -1  'True
         TabIndex        =   106
         ToolTipText     =   "Отмывка после монтажа"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblClearAfter 
         Caption         =   "Отмывка после монтажа:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   105
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPripoyType 
         Height          =   300
         Left            =   18600
         TabIndex        =   104
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип пасты или припоя"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPripoyType 
         Height          =   300
         Left            =   16050
         Locked          =   -1  'True
         TabIndex        =   103
         ToolTipText     =   "Тип пасты или припоя"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblPripoyType 
         Caption         =   "Тип пасты или припоя:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   102
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtWeidthMM_LE 
         Height          =   300
         Left            =   16050
         MaxLength       =   15
         TabIndex        =   101
         ToolTipText     =   "Ширина заг. (мм) меньше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblWeidthMM_LE 
         Caption         =   "Ширина заг. (мм) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   100
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtWeidthMM_GE 
         Height          =   300
         Left            =   16050
         MaxLength       =   15
         TabIndex        =   99
         ToolTipText     =   "Ширина заг. (мм) больше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblWeidthMM_GE 
         Caption         =   "Ширина заг. (мм) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   98
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtLengthMM_LE 
         Height          =   300
         Left            =   16050
         MaxLength       =   15
         TabIndex        =   97
         ToolTipText     =   "Длинна заг. (мм) меньше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblLengthMM_LE 
         Caption         =   "Длинна заг. (мм) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   96
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtLengthMM_GE 
         Height          =   300
         Left            =   12900
         MaxLength       =   15
         TabIndex        =   95
         ToolTipText     =   "Длинна заг. (мм) больше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblLengthMM_GE 
         Caption         =   "Длинна заг. (мм) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   94
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtMountZagot_LE 
         Height          =   300
         Left            =   12900
         MaxLength       =   15
         TabIndex        =   93
         ToolTipText     =   "Кол-во монтир. заготовок меньше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblMountZagot_LE 
         Caption         =   "Кол-во монтир. заготовок меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   92
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtMountZagot_GE 
         Height          =   300
         Left            =   12900
         MaxLength       =   15
         TabIndex        =   91
         ToolTipText     =   "Кол-во монтир. заготовок больше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblMountZagot_GE 
         Caption         =   "Кол-во монтир. заготовок больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   90
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtMountCount_LE 
         Height          =   300
         Left            =   12900
         MaxLength       =   15
         TabIndex        =   89
         ToolTipText     =   "Кол-во монтир. сторон меньше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblMountCount_LE 
         Caption         =   "Кол-во монтир. сторон меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   88
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtMountCount_GE 
         Height          =   300
         Left            =   12900
         MaxLength       =   15
         TabIndex        =   87
         ToolTipText     =   "Кол-во монтир. сторон больше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblMountCount_GE 
         Caption         =   "Кол-во монтир. сторон больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   86
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMountingType 
         Height          =   300
         Left            =   15450
         TabIndex        =   85
         Tag             =   "refopen.ico"
         ToolTipText     =   "Вид монтажа"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMountingType 
         Height          =   300
         Left            =   12900
         Locked          =   -1  'True
         TabIndex        =   84
         ToolTipText     =   "Вид монтажа"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblMountingType 
         Caption         =   "Вид монтажа:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   83
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtFileFormat 
         Height          =   300
         Left            =   12900
         MaxLength       =   255
         TabIndex        =   82
         ToolTipText     =   "Формат файлов проекта ПП"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblFileFormat 
         Caption         =   "Формат файлов проекта ПП:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   81
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtThePName 
         Height          =   300
         Left            =   12900
         MaxLength       =   255
         TabIndex        =   80
         ToolTipText     =   "Название файла проекта ПП"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblThePName 
         Caption         =   "Название файла проекта ПП:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   79
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactEndDT_LE 
         Height          =   300
         Left            =   12900
         TabIndex        =   78
         ToolTipText     =   "Дата окончания факт по"
         Top             =   405
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
         Left            =   12900
         TabIndex        =   77
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactEndDT_GE 
         Height          =   300
         Left            =   9750
         TabIndex        =   76
         ToolTipText     =   "Дата окончания факт C"
         Top             =   6045
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
         Left            =   9750
         TabIndex        =   75
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactStartDT_LE 
         Height          =   300
         Left            =   9750
         TabIndex        =   74
         ToolTipText     =   "Дата начала факт по"
         Top             =   5340
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
         Left            =   9750
         TabIndex        =   73
         Top             =   5010
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactStartDT_GE 
         Height          =   300
         Left            =   9750
         TabIndex        =   72
         ToolTipText     =   "Дата начала факт C"
         Top             =   4635
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
         Left            =   9750
         TabIndex        =   71
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanEndDT_LE 
         Height          =   300
         Left            =   9750
         TabIndex        =   70
         ToolTipText     =   "Дата окончания план по"
         Top             =   3930
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
         Left            =   9750
         TabIndex        =   69
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanEndDT_GE 
         Height          =   300
         Left            =   9750
         TabIndex        =   68
         ToolTipText     =   "Дата окончания план C"
         Top             =   3225
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
         Left            =   9750
         TabIndex        =   67
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanStartDT_LE 
         Height          =   300
         Left            =   9750
         TabIndex        =   66
         ToolTipText     =   "Дата начала план по"
         Top             =   2520
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
         Left            =   9750
         TabIndex        =   65
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanStartDT_GE 
         Height          =   300
         Left            =   9750
         TabIndex        =   64
         ToolTipText     =   "Дата начала план C"
         Top             =   1815
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
         Left            =   9750
         TabIndex        =   63
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtProductPeriod_LE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   62
         ToolTipText     =   "Срок подготовки меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblProductPeriod_LE 
         Caption         =   "Срок подготовки меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   61
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtProductPeriod_GE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   60
         ToolTipText     =   "Срок подготовки больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblProductPeriod_GE 
         Caption         =   "Срок подготовки больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   59
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtMontainPeriod_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   58
         ToolTipText     =   "Срок монтажа меньше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblMontainPeriod_LE 
         Caption         =   "Срок монтажа меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   57
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtMontainPeriod_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   56
         ToolTipText     =   "Срок монтажа больше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblMontainPeriod_GE 
         Caption         =   "Срок монтажа больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   55
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRes_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   54
         ToolTipText     =   "Уст. цена с подготовкой (с НДС), руб меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRes_LE 
         Caption         =   "Уст. цена с подготовкой (с НДС), руб меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRes_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   52
         ToolTipText     =   "Уст. цена с подготовкой (с НДС), руб больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRes_GE 
         Caption         =   "Уст. цена с подготовкой (с НДС), руб больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtPriceResPrepare_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   50
         ToolTipText     =   "Уст. цена монтажа за заказ (с НДС), руб меньше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceResPrepare_LE 
         Caption         =   "Уст. цена монтажа за заказ (с НДС), руб меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   49
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtPriceResPrepare_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   48
         ToolTipText     =   "Уст. цена монтажа за заказ (с НДС), руб больше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceResPrepare_GE 
         Caption         =   "Уст. цена монтажа за заказ (с НДС), руб больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtPriceItemNNDS_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   46
         ToolTipText     =   "Уст. цена монтажа за 1 шт.(без НДС), руб меньше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceItemNNDS_LE 
         Caption         =   "Уст. цена монтажа за 1 шт.(без НДС), руб меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtPriceItemNNDS_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   44
         ToolTipText     =   "Уст. цена монтажа за 1 шт.(без НДС), руб больше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceItemNNDS_GE 
         Caption         =   "Уст. цена монтажа за 1 шт.(без НДС), руб больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRecom_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   42
         ToolTipText     =   "Рек. цена монтажа за заказ, руб меньше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecom_LE 
         Caption         =   "Рек. цена монтажа за заказ, руб меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   41
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRecom_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   40
         ToolTipText     =   "Рек. цена монтажа за заказ, руб больше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecom_GE 
         Caption         =   "Рек. цена монтажа за заказ, руб больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRecomMin_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   38
         ToolTipText     =   "Минимальная цена монтажа за заказ, руб меньше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecomMin_LE 
         Caption         =   "Минимальная цена монтажа за заказ, руб меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRecomMin_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   36
         ToolTipText     =   "Минимальная цена монтажа за заказ, руб больше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecomMin_GE 
         Caption         =   "Минимальная цена монтажа за заказ, руб больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtPricePerOne_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   34
         ToolTipText     =   "Стоимость монтажа 1 шт (прайс), руб меньше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePerOne_LE 
         Caption         =   "Стоимость монтажа 1 шт (прайс), руб меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtPricePerOne_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   32
         ToolTipText     =   "Стоимость монтажа 1 шт (прайс), руб больше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePerOne_GE 
         Caption         =   "Стоимость монтажа 1 шт (прайс), руб больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtExtraChargeMax_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   30
         ToolTipText     =   "Наценка max меньше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMax_LE 
         Caption         =   "Наценка max меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtExtraChargeMax_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   28
         ToolTipText     =   "Наценка max больше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMax_GE 
         Caption         =   "Наценка max больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtExtraChargeMin_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   26
         ToolTipText     =   "Наценка min меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMin_LE 
         Caption         =   "Наценка min меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtExtraChargeMin_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   24
         ToolTipText     =   "Наценка min больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMin_GE 
         Caption         =   "Наценка min больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtPriceTrafaretSell_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   22
         ToolTipText     =   "Цена трафарета(ов), руб меньше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceTrafaretSell_LE 
         Caption         =   "Цена трафарета(ов), руб меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtPriceTrafaretSell_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   20
         ToolTipText     =   "Цена трафарета(ов), руб больше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceTrafaretSell_GE 
         Caption         =   "Цена трафарета(ов), руб больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtPriceTrafaret_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   18
         ToolTipText     =   "Себестоимость трафарета(ов), руб меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceTrafaret_LE 
         Caption         =   "Себестоимость трафарета(ов), руб меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtPriceTrafaret_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   16
         ToolTipText     =   "Себестоимость трафарета(ов), руб больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceTrafaret_GE 
         Caption         =   "Себестоимость трафарета(ов), руб больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtPricePrepare_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   14
         ToolTipText     =   "Сумма подготовки, руб меньше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePrepare_LE 
         Caption         =   "Сумма подготовки, руб меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtPricePrepare_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   12
         ToolTipText     =   "Сумма подготовки, руб больше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePrepare_GE 
         Caption         =   "Сумма подготовки, руб больше или равно:"
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
Attribute VB_Name = "frmPCB_TaskPP"
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
  TSCustom.Init ts, "PCB_TaskPP", "fctlPCB_TaskPP"
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
Private Sub txtPricePrepare_GE_Validate(Cancel As Boolean)
If txtPricePrepare_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPricePrepare_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPricePrepare_GE.Text) < -922337203685478# Or val(txtPricePrepare_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPricePrepare_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPricePrepare_GE_Change()
  Changing
End Sub
Private Sub txtPricePrepare_LE_Validate(Cancel As Boolean)
If txtPricePrepare_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPricePrepare_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPricePrepare_LE.Text) < -922337203685478# Or val(txtPricePrepare_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPricePrepare_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPricePrepare_LE_Change()
  Changing
End Sub
Private Sub txtPriceTrafaret_GE_Validate(Cancel As Boolean)
If txtPriceTrafaret_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceTrafaret_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceTrafaret_GE.Text) < -922337203685478# Or val(txtPriceTrafaret_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceTrafaret_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceTrafaret_GE_Change()
  Changing
End Sub
Private Sub txtPriceTrafaret_LE_Validate(Cancel As Boolean)
If txtPriceTrafaret_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceTrafaret_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceTrafaret_LE.Text) < -922337203685478# Or val(txtPriceTrafaret_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceTrafaret_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceTrafaret_LE_Change()
  Changing
End Sub
Private Sub txtPriceTrafaretSell_GE_Validate(Cancel As Boolean)
If txtPriceTrafaretSell_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceTrafaretSell_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceTrafaretSell_GE.Text) < -922337203685478# Or val(txtPriceTrafaretSell_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceTrafaretSell_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceTrafaretSell_GE_Change()
  Changing
End Sub
Private Sub txtPriceTrafaretSell_LE_Validate(Cancel As Boolean)
If txtPriceTrafaretSell_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceTrafaretSell_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceTrafaretSell_LE.Text) < -922337203685478# Or val(txtPriceTrafaretSell_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceTrafaretSell_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceTrafaretSell_LE_Change()
  Changing
End Sub
Private Sub txtExtraChargeMin_GE_Validate(Cancel As Boolean)
If txtExtraChargeMin_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtExtraChargeMin_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtExtraChargeMin_GE.Text) <> CLng(val(txtExtraChargeMin_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtExtraChargeMin_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtExtraChargeMin_GE_Change()
  Changing
End Sub
Private Sub txtExtraChargeMin_LE_Validate(Cancel As Boolean)
If txtExtraChargeMin_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtExtraChargeMin_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtExtraChargeMin_LE.Text) <> CLng(val(txtExtraChargeMin_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtExtraChargeMin_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtExtraChargeMin_LE_Change()
  Changing
End Sub
Private Sub txtExtraChargeMax_GE_Validate(Cancel As Boolean)
If txtExtraChargeMax_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtExtraChargeMax_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtExtraChargeMax_GE.Text) <> CLng(val(txtExtraChargeMax_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtExtraChargeMax_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtExtraChargeMax_GE_Change()
  Changing
End Sub
Private Sub txtExtraChargeMax_LE_Validate(Cancel As Boolean)
If txtExtraChargeMax_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtExtraChargeMax_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtExtraChargeMax_LE.Text) <> CLng(val(txtExtraChargeMax_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtExtraChargeMax_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtExtraChargeMax_LE_Change()
  Changing
End Sub
Private Sub txtPricePerOne_GE_Validate(Cancel As Boolean)
If txtPricePerOne_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPricePerOne_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPricePerOne_GE.Text) < -922337203685478# Or val(txtPricePerOne_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPricePerOne_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPricePerOne_GE_Change()
  Changing
End Sub
Private Sub txtPricePerOne_LE_Validate(Cancel As Boolean)
If txtPricePerOne_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPricePerOne_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPricePerOne_LE.Text) < -922337203685478# Or val(txtPricePerOne_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPricePerOne_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPricePerOne_LE_Change()
  Changing
End Sub
Private Sub txtPriceRecomMin_GE_Validate(Cancel As Boolean)
If txtPriceRecomMin_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceRecomMin_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceRecomMin_GE.Text) < -922337203685478# Or val(txtPriceRecomMin_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceRecomMin_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceRecomMin_GE_Change()
  Changing
End Sub
Private Sub txtPriceRecomMin_LE_Validate(Cancel As Boolean)
If txtPriceRecomMin_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceRecomMin_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceRecomMin_LE.Text) < -922337203685478# Or val(txtPriceRecomMin_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceRecomMin_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceRecomMin_LE_Change()
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
Private Sub txtPriceItemNNDS_GE_Validate(Cancel As Boolean)
If txtPriceItemNNDS_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceItemNNDS_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceItemNNDS_GE.Text) < -922337203685478# Or val(txtPriceItemNNDS_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceItemNNDS_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceItemNNDS_GE_Change()
  Changing
End Sub
Private Sub txtPriceItemNNDS_LE_Validate(Cancel As Boolean)
If txtPriceItemNNDS_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceItemNNDS_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceItemNNDS_LE.Text) < -922337203685478# Or val(txtPriceItemNNDS_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceItemNNDS_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceItemNNDS_LE_Change()
  Changing
End Sub
Private Sub txtPriceResPrepare_GE_Validate(Cancel As Boolean)
If txtPriceResPrepare_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceResPrepare_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceResPrepare_GE.Text) < -922337203685478# Or val(txtPriceResPrepare_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceResPrepare_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceResPrepare_GE_Change()
  Changing
End Sub
Private Sub txtPriceResPrepare_LE_Validate(Cancel As Boolean)
If txtPriceResPrepare_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceResPrepare_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceResPrepare_LE.Text) < -922337203685478# Or val(txtPriceResPrepare_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceResPrepare_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceResPrepare_LE_Change()
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
Private Sub txtMontainPeriod_GE_Validate(Cancel As Boolean)
If txtMontainPeriod_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMontainPeriod_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtMontainPeriod_GE.Text) <> CLng(val(txtMontainPeriod_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtMontainPeriod_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMontainPeriod_GE_Change()
  Changing
End Sub
Private Sub txtMontainPeriod_LE_Validate(Cancel As Boolean)
If txtMontainPeriod_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMontainPeriod_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtMontainPeriod_LE.Text) <> CLng(val(txtMontainPeriod_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtMontainPeriod_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMontainPeriod_LE_Change()
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
Private Sub txtThePName_Change()
  Changing
End Sub
Private Sub txtFileFormat_Change()
  Changing
End Sub
Private Sub txtMountingType_Change()
  Changing
End Sub
Private Sub cmdMountingType_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_AssemblyT", id, brief) Then
          txtMountingType.Tag = Left(id, 38)
          txtMountingType = brief
        End If
End Sub
Private Sub txtMountCount_GE_Validate(Cancel As Boolean)
If txtMountCount_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMountCount_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtMountCount_GE.Text) <> CLng(val(txtMountCount_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtMountCount_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMountCount_GE_Change()
  Changing
End Sub
Private Sub txtMountCount_LE_Validate(Cancel As Boolean)
If txtMountCount_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMountCount_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtMountCount_LE.Text) <> CLng(val(txtMountCount_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtMountCount_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMountCount_LE_Change()
  Changing
End Sub
Private Sub txtMountZagot_GE_Validate(Cancel As Boolean)
If txtMountZagot_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMountZagot_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtMountZagot_GE.Text) <> CLng(val(txtMountZagot_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtMountZagot_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMountZagot_GE_Change()
  Changing
End Sub
Private Sub txtMountZagot_LE_Validate(Cancel As Boolean)
If txtMountZagot_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMountZagot_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtMountZagot_LE.Text) <> CLng(val(txtMountZagot_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtMountZagot_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMountZagot_LE_Change()
  Changing
End Sub
Private Sub txtLengthMM_GE_Validate(Cancel As Boolean)
If txtLengthMM_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtLengthMM_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtLengthMM_GE.Text) <> CLng(val(txtLengthMM_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtLengthMM_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtLengthMM_GE_Change()
  Changing
End Sub
Private Sub txtLengthMM_LE_Validate(Cancel As Boolean)
If txtLengthMM_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtLengthMM_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtLengthMM_LE.Text) <> CLng(val(txtLengthMM_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtLengthMM_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtLengthMM_LE_Change()
  Changing
End Sub
Private Sub txtWeidthMM_GE_Validate(Cancel As Boolean)
If txtWeidthMM_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeidthMM_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtWeidthMM_GE.Text) <> CLng(val(txtWeidthMM_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtWeidthMM_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeidthMM_GE_Change()
  Changing
End Sub
Private Sub txtWeidthMM_LE_Validate(Cancel As Boolean)
If txtWeidthMM_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeidthMM_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtWeidthMM_LE.Text) <> CLng(val(txtWeidthMM_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtWeidthMM_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeidthMM_LE_Change()
  Changing
End Sub
Private Sub txtPripoyType_Change()
  Changing
End Sub
Private Sub cmdPripoyType_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_Pasta", id, brief) Then
          txtPripoyType.Tag = Left(id, 38)
          txtPripoyType = brief
        End If
End Sub
Private Sub txtClearAfter_Change()
  Changing
End Sub
Private Sub cmdClearAfter_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_Clean", id, brief) Then
          txtClearAfter.Tag = Left(id, 38)
          txtClearAfter = brief
        End If
End Sub
Private Sub cmbAntisitat_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtLak_Change()
  Changing
End Sub
Private Sub cmdLak_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_Lak", id, brief) Then
          txtLak.Tag = Left(id, 38)
          txtLak = brief
        End If
End Sub
Private Sub cmbUseGlue_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbRentBGA_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtPriceRentOnce_GE_Validate(Cancel As Boolean)
If txtPriceRentOnce_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceRentOnce_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceRentOnce_GE.Text) < -922337203685478# Or val(txtPriceRentOnce_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceRentOnce_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceRentOnce_GE_Change()
  Changing
End Sub
Private Sub txtPriceRentOnce_LE_Validate(Cancel As Boolean)
If txtPriceRentOnce_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceRentOnce_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceRentOnce_LE.Text) < -922337203685478# Or val(txtPriceRentOnce_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceRentOnce_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceRentOnce_LE_Change()
  Changing
End Sub
Private Sub txtContRentgen_GE_Validate(Cancel As Boolean)
If txtContRentgen_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtContRentgen_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtContRentgen_GE.Text) <> CLng(val(txtContRentgen_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtContRentgen_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtContRentgen_GE_Change()
  Changing
End Sub
Private Sub txtContRentgen_LE_Validate(Cancel As Boolean)
If txtContRentgen_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtContRentgen_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtContRentgen_LE.Text) <> CLng(val(txtContRentgen_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtContRentgen_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtContRentgen_LE_Change()
  Changing
End Sub
Private Sub cmbAccCustomer_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbExtraControl_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtDopRequests_Change()
  Changing
End Sub
Private Sub dtpCreatedDT_GE_Change()
  Changing
End Sub
Private Sub dtpCreatedDT_LE_Change()
  Changing
End Sub
Private Sub dtpEstimationDT_GE_Change()
  Changing
End Sub
Private Sub dtpEstimationDT_LE_Change()
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
dtpPlanStartDT_GE = Date
dtpPlanStartDT_LE = Date
dtpPlanEndDT_GE = Date
dtpPlanEndDT_LE = Date
dtpFactStartDT_GE = Date
dtpFactStartDT_LE = Date
dtpFactEndDT_GE = Date
dtpFactEndDT_LE = Date
txtThePName = ""
txtFileFormat = ""
  txtMountingType.Tag = ""
  txtMountingType = ""
 LoadBtnPictures cmdMountingType, cmdMountingType.Tag
  cmdMountingType.RemoveAllMenu
  txtPripoyType.Tag = ""
  txtPripoyType = ""
 LoadBtnPictures cmdPripoyType, cmdPripoyType.Tag
  cmdPripoyType.RemoveAllMenu
  txtClearAfter.Tag = ""
  txtClearAfter = ""
 LoadBtnPictures cmdClearAfter, cmdClearAfter.Tag
  cmdClearAfter.RemoveAllMenu
cmbAntisitat.Clear
cmbAntisitat.AddItem "Да"
cmbAntisitat.ItemData(cmbAntisitat.NewIndex) = -1
cmbAntisitat.AddItem "Нет"
cmbAntisitat.ItemData(cmbAntisitat.NewIndex) = 0
  txtLak.Tag = ""
  txtLak = ""
 LoadBtnPictures cmdLak, cmdLak.Tag
  cmdLak.RemoveAllMenu
cmbUseGlue.Clear
cmbUseGlue.AddItem "Да"
cmbUseGlue.ItemData(cmbUseGlue.NewIndex) = -1
cmbUseGlue.AddItem "Нет"
cmbUseGlue.ItemData(cmbUseGlue.NewIndex) = 0
cmbRentBGA.Clear
cmbRentBGA.AddItem "Да"
cmbRentBGA.ItemData(cmbRentBGA.NewIndex) = -1
cmbRentBGA.AddItem "Нет"
cmbRentBGA.ItemData(cmbRentBGA.NewIndex) = 0
cmbAccCustomer.Clear
cmbAccCustomer.AddItem "Да"
cmbAccCustomer.ItemData(cmbAccCustomer.NewIndex) = -1
cmbAccCustomer.AddItem "Нет"
cmbAccCustomer.ItemData(cmbAccCustomer.NewIndex) = 0
cmbExtraControl.Clear
cmbExtraControl.AddItem "Да"
cmbExtraControl.ItemData(cmbExtraControl.NewIndex) = -1
cmbExtraControl.AddItem "Нет"
cmbExtraControl.ItemData(cmbExtraControl.NewIndex) = 0
dtpCreatedDT_GE = Now
dtpCreatedDT_LE = Now
dtpEstimationDT_GE = Now
dtpEstimationDT_LE = Now
  txtCreatedByRef.Tag = ""
  txtCreatedByRef = ""
 LoadBtnPictures cmdCreatedByRef, cmdCreatedByRef.Tag
  cmdCreatedByRef.RemoveAllMenu
  txtPriceSetByRef.Tag = ""
  txtPriceSetByRef = ""
 LoadBtnPictures cmdPriceSetByRef, cmdPriceSetByRef.Tag
  cmdPriceSetByRef.RemoveAllMenu
OnInit = False
End Sub



