VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmPCB_MPP 
   Caption         =   "Фильтр для Задача на изготовление ПП"
   ClientHeight    =   3480
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   11115
   ScaleWidth      =   15240
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
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
   Begin MTZ_PANEL.ScrolledWindow PanelfGroup 
      Height          =   10125
      Left            =   -5280
      TabIndex        =   3
      Top             =   -600
      Width           =   15480
      _ExtentX        =   27305
      _ExtentY        =   17859
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   34950
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   226
         ToolTipText     =   "Примечание"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComment 
         Caption         =   "Примечание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   34950
         TabIndex        =   225
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMaskColorBottom 
         Height          =   300
         Left            =   37500
         TabIndex        =   224
         Tag             =   "refopen.ico"
         ToolTipText     =   "Цвет защитной маски Bottom"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMaskColorBottom 
         Height          =   300
         Left            =   34950
         Locked          =   -1  'True
         TabIndex        =   223
         ToolTipText     =   "Цвет защитной маски Bottom"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblMaskColorBottom 
         Caption         =   "Цвет защитной маски Bottom:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   34950
         TabIndex        =   222
         Top             =   2190
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdToleranceMRef 
         Height          =   300
         Left            =   37500
         TabIndex        =   221
         Tag             =   "refopen.ico"
         ToolTipText     =   "Допуск ""-"""
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtToleranceMRef 
         Height          =   300
         Left            =   34950
         Locked          =   -1  'True
         TabIndex        =   220
         ToolTipText     =   "Допуск ""-"""
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblToleranceMRef 
         Caption         =   "Допуск ""-"":"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   34950
         TabIndex        =   219
         Top             =   1485
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTolerancePRef 
         Height          =   300
         Left            =   37500
         TabIndex        =   218
         Tag             =   "refopen.ico"
         ToolTipText     =   "Допуск ""+"""
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTolerancePRef 
         Height          =   300
         Left            =   34950
         Locked          =   -1  'True
         TabIndex        =   217
         ToolTipText     =   "Допуск ""+"""
         Top             =   1110
         Width           =   2550
      End
      Begin VB.CheckBox lblTolerancePRef 
         Caption         =   "Допуск ""+"":"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   34950
         TabIndex        =   216
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPriceSetByRef 
         Height          =   300
         Left            =   37500
         TabIndex        =   215
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
         Left            =   34950
         Locked          =   -1  'True
         TabIndex        =   214
         ToolTipText     =   "Цену установил"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblPriceSetByRef 
         Caption         =   "Цену установил:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   34950
         TabIndex        =   213
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtPriceDM2_LE 
         Height          =   300
         Left            =   31800
         MaxLength       =   27
         TabIndex        =   212
         ToolTipText     =   "Цена за1 дм2 меньше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceDM2_LE 
         Caption         =   "Цена за1 дм2 меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   31800
         TabIndex        =   211
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtPriceDM2_GE 
         Height          =   300
         Left            =   31800
         MaxLength       =   27
         TabIndex        =   210
         ToolTipText     =   "Цена за1 дм2 больше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceDM2_GE 
         Caption         =   "Цена за1 дм2 больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   31800
         TabIndex        =   209
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtCostsPriceDM2_LE 
         Height          =   300
         Left            =   31800
         MaxLength       =   27
         TabIndex        =   208
         ToolTipText     =   "Себистоимость Изг 1 дм2 меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblCostsPriceDM2_LE 
         Caption         =   "Себистоимость Изг 1 дм2 меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   31800
         TabIndex        =   207
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtCostsPriceDM2_GE 
         Height          =   300
         Left            =   31800
         MaxLength       =   27
         TabIndex        =   206
         ToolTipText     =   "Себистоимость Изг 1 дм2 больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblCostsPriceDM2_GE 
         Caption         =   "Себистоимость Изг 1 дм2 больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   31800
         TabIndex        =   205
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdAssessByRef 
         Height          =   300
         Left            =   34350
         TabIndex        =   204
         Tag             =   "refopen.ico"
         ToolTipText     =   "Оценил"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtAssessByRef 
         Height          =   300
         Left            =   31800
         Locked          =   -1  'True
         TabIndex        =   203
         ToolTipText     =   "Оценил"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblAssessByRef 
         Caption         =   "Оценил:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   31800
         TabIndex        =   202
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCreatedByRef 
         Height          =   300
         Left            =   34350
         TabIndex        =   201
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
         Left            =   31800
         Locked          =   -1  'True
         TabIndex        =   200
         ToolTipText     =   "Создал"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblCreatedByRef 
         Caption         =   "Создал:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   31800
         TabIndex        =   199
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpManufShipDT_LE 
         Height          =   300
         Left            =   31800
         TabIndex        =   198
         ToolTipText     =   "Дата доставки от произв. по"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblManufShipDT_LE 
         Caption         =   "Дата доставки от произв. по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   31800
         TabIndex        =   197
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpManufShipDT_GE 
         Height          =   300
         Left            =   31800
         TabIndex        =   196
         ToolTipText     =   "Дата доставки от произв. C"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblManufShipDT_GE 
         Caption         =   "Дата доставки от произв. C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   31800
         TabIndex        =   195
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpShipedDT_LE 
         Height          =   300
         Left            =   31800
         TabIndex        =   194
         ToolTipText     =   "Дата отгрузки по"
         Top             =   405
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblShipedDT_LE 
         Caption         =   "Дата отгрузки по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   31800
         TabIndex        =   193
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpShipedDT_GE 
         Height          =   300
         Left            =   28650
         TabIndex        =   192
         ToolTipText     =   "Дата отгрузки C"
         Top             =   6045
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblShipedDT_GE 
         Caption         =   "Дата отгрузки C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   28650
         TabIndex        =   191
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEstimationDT_LE 
         Height          =   300
         Left            =   28650
         TabIndex        =   190
         ToolTipText     =   "Дата и время оценки по"
         Top             =   5340
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
         Left            =   28650
         TabIndex        =   189
         Top             =   5010
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEstimationDT_GE 
         Height          =   300
         Left            =   28650
         TabIndex        =   188
         ToolTipText     =   "Дата и время оценки C"
         Top             =   4635
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
         Left            =   28650
         TabIndex        =   187
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_LE 
         Height          =   300
         Left            =   28650
         TabIndex        =   186
         ToolTipText     =   "Дата и время создания по"
         Top             =   3930
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
         Left            =   28650
         TabIndex        =   185
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_GE 
         Height          =   300
         Left            =   28650
         TabIndex        =   184
         ToolTipText     =   "Дата и время создания C"
         Top             =   3225
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
         Left            =   28650
         TabIndex        =   183
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtTheWeight_LE 
         Height          =   300
         Left            =   28650
         MaxLength       =   27
         TabIndex        =   182
         ToolTipText     =   "Вес (кг) меньше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblTheWeight_LE 
         Caption         =   "Вес (кг) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   28650
         TabIndex        =   181
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtTheWeight_GE 
         Height          =   300
         Left            =   28650
         MaxLength       =   27
         TabIndex        =   180
         ToolTipText     =   "Вес (кг) больше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblTheWeight_GE 
         Caption         =   "Вес (кг) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   28650
         TabIndex        =   179
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtWayBill 
         Height          =   300
         Left            =   28650
         MaxLength       =   255
         TabIndex        =   178
         ToolTipText     =   "Накладная"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblWayBill 
         Caption         =   "Накладная:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   28650
         TabIndex        =   177
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtTheSender 
         Height          =   300
         Left            =   28650
         MaxLength       =   255
         TabIndex        =   176
         ToolTipText     =   "Отправитель"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblTheSender 
         Caption         =   "Отправитель:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   28650
         TabIndex        =   175
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtRecipient 
         Height          =   300
         Left            =   25500
         MaxLength       =   255
         TabIndex        =   174
         ToolTipText     =   "Получатель"
         Top             =   6435
         Width           =   3000
      End
      Begin VB.CheckBox lblRecipient 
         Caption         =   "Получатель:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   25500
         TabIndex        =   173
         Top             =   6105
         Width           =   3000
      End
      Begin VB.TextBox txtDopNeeds 
         Height          =   1200
         Left            =   25500
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   172
         ToolTipText     =   "Дополнительные требования"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.CheckBox lblDopNeeds 
         Caption         =   "Дополнительные требования:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   25500
         TabIndex        =   171
         Top             =   4500
         Width           =   3000
      End
      Begin VB.TextBox txtImpedanceOverview 
         Height          =   1200
         Left            =   25500
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   170
         ToolTipText     =   "Описание требований импедансов"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblImpedanceOverview 
         Caption         =   "Описание требований импедансов:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   25500
         TabIndex        =   169
         Top             =   2895
         Width           =   3000
      End
      Begin VB.ComboBox cmbCheckImpedance 
         Height          =   315
         Left            =   25500
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   168
         ToolTipText     =   "Контроль импедансов"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblCheckImpedance 
         Caption         =   "Контроль импедансов:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   25500
         TabIndex        =   167
         Top             =   2190
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsCustomerCheck 
         Height          =   315
         Left            =   25500
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   166
         ToolTipText     =   "Приёмка заказчика 5"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblIsCustomerCheck 
         Caption         =   "Приёмка заказчика 5:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   25500
         TabIndex        =   165
         Top             =   1485
         Width           =   3000
      End
      Begin VB.ComboBox cmbUseElectrTest 
         Height          =   315
         Left            =   25500
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   164
         ToolTipText     =   "Электроконтроль"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblUseElectrTest 
         Caption         =   "Электроконтроль:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   25500
         TabIndex        =   163
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtFaskaSize_LE 
         Height          =   300
         Left            =   25500
         MaxLength       =   15
         TabIndex        =   162
         ToolTipText     =   "Размер фаски на разьёме (мм) меньше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblFaskaSize_LE 
         Caption         =   "Размер фаски на разьёме (мм) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   25500
         TabIndex        =   161
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtFaskaSize_GE 
         Height          =   300
         Left            =   22350
         MaxLength       =   15
         TabIndex        =   160
         ToolTipText     =   "Размер фаски на разьёме (мм) больше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblFaskaSize_GE 
         Caption         =   "Размер фаски на разьёме (мм) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   159
         Top             =   5715
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdProceedContur 
         Height          =   300
         Left            =   24900
         TabIndex        =   158
         Tag             =   "refopen.ico"
         ToolTipText     =   "Оработка контура ПП"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProceedContur 
         Height          =   300
         Left            =   22350
         Locked          =   -1  'True
         TabIndex        =   157
         ToolTipText     =   "Оработка контура ПП"
         Top             =   5340
         Width           =   2550
      End
      Begin VB.CheckBox lblProceedContur 
         Caption         =   "Оработка контура ПП:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   156
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdFaskaGRD 
         Height          =   300
         Left            =   24900
         TabIndex        =   155
         Tag             =   "refopen.ico"
         ToolTipText     =   "Угол фаски на разьёме (град)"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFaskaGRD 
         Height          =   300
         Left            =   22350
         Locked          =   -1  'True
         TabIndex        =   154
         ToolTipText     =   "Угол фаски на разьёме (град)"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblFaskaGRD 
         Caption         =   "Угол фаски на разьёме (град):"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   153
         Top             =   4305
         Width           =   3000
      End
      Begin VB.ComboBox cmbUseGold 
         Height          =   315
         Left            =   22350
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   152
         ToolTipText     =   "Золочение разьёмов"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblUseGold 
         Caption         =   "Золочение разьёмов:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   151
         Top             =   3600
         Width           =   3000
      End
      Begin VB.ComboBox cmbOpenHole 
         Height          =   315
         Left            =   22350
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   150
         ToolTipText     =   "Открыть перех. отверстия от маски"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblOpenHole 
         Caption         =   "Открыть перех. отверстия от маски:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   149
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtMinHoleE_LE 
         Height          =   300
         Left            =   22350
         MaxLength       =   15
         TabIndex        =   148
         ToolTipText     =   "Кол-во типов гл/сл перех.отв. меньше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblMinHoleE_LE 
         Caption         =   "Кол-во типов гл/сл перех.отв. меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   147
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtMinHoleE_GE 
         Height          =   300
         Left            =   22350
         MaxLength       =   15
         TabIndex        =   146
         ToolTipText     =   "Кол-во типов гл/сл перех.отв. больше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblMinHoleE_GE 
         Caption         =   "Кол-во типов гл/сл перех.отв. больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   145
         Top             =   1485
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMinHole 
         Height          =   300
         Left            =   24900
         TabIndex        =   144
         Tag             =   "refopen.ico"
         ToolTipText     =   "Мин. диам. метализ. отверстия (мм)"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMinHole 
         Height          =   300
         Left            =   22350
         Locked          =   -1  'True
         TabIndex        =   143
         ToolTipText     =   "Мин. диам. метализ. отверстия (мм)"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.CheckBox lblMinHole 
         Caption         =   "Мин. диам. метализ. отверстия (мм):"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   142
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtMinThinBetween_LE 
         Height          =   300
         Left            =   22350
         MaxLength       =   15
         TabIndex        =   141
         ToolTipText     =   "Мин. ширина зазора м/д пр. (мм) меньше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblMinThinBetween_LE 
         Caption         =   "Мин. ширина зазора м/д пр. (мм) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   22350
         TabIndex        =   140
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtMinThinBetween_GE 
         Height          =   300
         Left            =   19200
         MaxLength       =   15
         TabIndex        =   139
         ToolTipText     =   "Мин. ширина зазора м/д пр. (мм) больше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblMinThinBetween_GE 
         Caption         =   "Мин. ширина зазора м/д пр. (мм) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   138
         Top             =   5715
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMinThinConductor 
         Height          =   300
         Left            =   21750
         TabIndex        =   137
         Tag             =   "refopen.ico"
         ToolTipText     =   "Мин. ширина проводника (мм)"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMinThinConductor 
         Height          =   300
         Left            =   19200
         Locked          =   -1  'True
         TabIndex        =   136
         ToolTipText     =   "Мин. ширина проводника (мм)"
         Top             =   5340
         Width           =   2550
      End
      Begin VB.CheckBox lblMinThinConductor 
         Caption         =   "Мин. ширина проводника (мм):"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   135
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCuperRef 
         Height          =   300
         Left            =   21750
         TabIndex        =   134
         Tag             =   "refopen.ico"
         ToolTipText     =   "Медь (мкм)"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCuperRef 
         Height          =   300
         Left            =   19200
         Locked          =   -1  'True
         TabIndex        =   133
         ToolTipText     =   "Медь (мкм)"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblCuperRef 
         Caption         =   "Медь (мкм):"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   132
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtThickness_LE 
         Height          =   300
         Left            =   19200
         MaxLength       =   27
         TabIndex        =   131
         ToolTipText     =   "Толщина ПП от 0,10 до 10,00 (мм) меньше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblThickness_LE 
         Caption         =   "Толщина ПП от 0,10 до 10,00 (мм) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   130
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtThickness_GE 
         Height          =   300
         Left            =   19200
         MaxLength       =   27
         TabIndex        =   129
         ToolTipText     =   "Толщина ПП от 0,10 до 10,00 (мм) больше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblThickness_GE 
         Caption         =   "Толщина ПП от 0,10 до 10,00 (мм) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   128
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCoverTypeRef 
         Height          =   300
         Left            =   21750
         TabIndex        =   127
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип покрытия КП"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCoverTypeRef 
         Height          =   300
         Left            =   19200
         Locked          =   -1  'True
         TabIndex        =   126
         ToolTipText     =   "Тип покрытия КП"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblCoverTypeRef 
         Caption         =   "Тип покрытия КП:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   125
         Top             =   2190
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdSerigraphyColor 
         Height          =   300
         Left            =   21750
         TabIndex        =   124
         Tag             =   "refopen.ico"
         ToolTipText     =   "Цвет шелкографии"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSerigraphyColor 
         Height          =   300
         Left            =   19200
         Locked          =   -1  'True
         TabIndex        =   123
         ToolTipText     =   "Цвет шелкографии"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblSerigraphyColor 
         Caption         =   "Цвет шелкографии:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   122
         Top             =   1485
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdSerigraphy 
         Height          =   300
         Left            =   21750
         TabIndex        =   121
         Tag             =   "refopen.ico"
         ToolTipText     =   "Шелкография"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSerigraphy 
         Height          =   300
         Left            =   19200
         Locked          =   -1  'True
         TabIndex        =   120
         ToolTipText     =   "Шелкография"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.CheckBox lblSerigraphy 
         Caption         =   "Шелкография:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   119
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMaskColorTop 
         Height          =   300
         Left            =   21750
         TabIndex        =   118
         Tag             =   "refopen.ico"
         ToolTipText     =   "Цвет защитной маски Top"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMaskColorTop 
         Height          =   300
         Left            =   19200
         Locked          =   -1  'True
         TabIndex        =   117
         ToolTipText     =   "Цвет защитной маски Top"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblMaskColorTop 
         Caption         =   "Цвет защитной маски Top:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   19200
         TabIndex        =   116
         Top             =   75
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdDefendMask 
         Height          =   300
         Left            =   18600
         TabIndex        =   115
         Tag             =   "refopen.ico"
         ToolTipText     =   "Защитная маска"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDefendMask 
         Height          =   300
         Left            =   16050
         Locked          =   -1  'True
         TabIndex        =   114
         ToolTipText     =   "Защитная маска"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.CheckBox lblDefendMask 
         Caption         =   "Защитная маска:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   113
         Top             =   5715
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMaterialPP 
         Height          =   300
         Left            =   18600
         TabIndex        =   112
         Tag             =   "refopen.ico"
         ToolTipText     =   "Материал ПП"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMaterialPP 
         Height          =   300
         Left            =   16050
         Locked          =   -1  'True
         TabIndex        =   111
         ToolTipText     =   "Материал ПП"
         Top             =   5340
         Width           =   2550
      End
      Begin VB.CheckBox lblMaterialPP 
         Caption         =   "Материал ПП:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   110
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtLayers_LE 
         Height          =   300
         Left            =   16050
         MaxLength       =   15
         TabIndex        =   109
         ToolTipText     =   "Количество слоёв ПП меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblLayers_LE 
         Caption         =   "Количество слоёв ПП меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   108
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtLayers_GE 
         Height          =   300
         Left            =   16050
         MaxLength       =   15
         TabIndex        =   107
         ToolTipText     =   "Количество слоёв ПП больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblLayers_GE 
         Caption         =   "Количество слоёв ПП больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   106
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdManufTypeRef 
         Height          =   300
         Left            =   18600
         TabIndex        =   105
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип производства"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtManufTypeRef 
         Height          =   300
         Left            =   16050
         Locked          =   -1  'True
         TabIndex        =   104
         ToolTipText     =   "Тип производства"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblManufTypeRef 
         Caption         =   "Тип производства:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   103
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpNeedsDT_LE 
         Height          =   300
         Left            =   16050
         TabIndex        =   102
         ToolTipText     =   "Желаемый срок по"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblNeedsDT_LE 
         Caption         =   "Желаемый срок по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   101
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpNeedsDT_GE 
         Height          =   300
         Left            =   16050
         TabIndex        =   100
         ToolTipText     =   "Желаемый срок C"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblNeedsDT_GE 
         Caption         =   "Желаемый срок C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   16050
         TabIndex        =   99
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactEndDT_LE 
         Height          =   300
         Left            =   16050
         TabIndex        =   98
         ToolTipText     =   "Дата окончания факт по"
         Top             =   1110
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
         Left            =   16050
         TabIndex        =   97
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactEndDT_GE 
         Height          =   300
         Left            =   16050
         TabIndex        =   96
         ToolTipText     =   "Дата окончания факт C"
         Top             =   405
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
         Left            =   16050
         TabIndex        =   95
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactStartDT_LE 
         Height          =   300
         Left            =   12900
         TabIndex        =   94
         ToolTipText     =   "Дата начала факт по"
         Top             =   6045
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
         Left            =   12900
         TabIndex        =   93
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactStartDT_GE 
         Height          =   300
         Left            =   12900
         TabIndex        =   92
         ToolTipText     =   "Дата начала факт C"
         Top             =   5340
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
         Left            =   12900
         TabIndex        =   91
         Top             =   5010
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanEndDT_LE 
         Height          =   300
         Left            =   12900
         TabIndex        =   90
         ToolTipText     =   "Дата окончания план по"
         Top             =   4635
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
         Left            =   12900
         TabIndex        =   89
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanEndDT_GE 
         Height          =   300
         Left            =   12900
         TabIndex        =   88
         ToolTipText     =   "Дата окончания план C"
         Top             =   3930
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
         Left            =   12900
         TabIndex        =   87
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanStartDT_LE 
         Height          =   300
         Left            =   12900
         TabIndex        =   86
         ToolTipText     =   "Дата начала план по"
         Top             =   3225
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
         Left            =   12900
         TabIndex        =   85
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanStartDT_GE 
         Height          =   300
         Left            =   12900
         TabIndex        =   84
         ToolTipText     =   "Дата начала план C"
         Top             =   2520
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
         Left            =   12900
         TabIndex        =   83
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtProfit_LE 
         Height          =   300
         Left            =   12900
         MaxLength       =   27
         TabIndex        =   82
         ToolTipText     =   "Прибыль меньше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblProfit_LE 
         Caption         =   "Прибыль меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   81
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtProfit_GE 
         Height          =   300
         Left            =   12900
         MaxLength       =   27
         TabIndex        =   80
         ToolTipText     =   "Прибыль больше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblProfit_GE 
         Caption         =   "Прибыль больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   79
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtPriceOneNNDS_LE 
         Height          =   300
         Left            =   12900
         MaxLength       =   27
         TabIndex        =   78
         ToolTipText     =   "Цена уст. за шт. (без НДС) меньше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceOneNNDS_LE 
         Caption         =   "Цена уст. за шт. (без НДС) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   77
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtPriceOneNNDS_GE 
         Height          =   300
         Left            =   9750
         MaxLength       =   27
         TabIndex        =   76
         ToolTipText     =   "Цена уст. за шт. (без НДС) больше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceOneNNDS_GE 
         Caption         =   "Цена уст. за шт. (без НДС) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   75
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRes_LE 
         Height          =   300
         Left            =   9750
         MaxLength       =   27
         TabIndex        =   74
         ToolTipText     =   "Цена уст. (с НДС) меньше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRes_LE 
         Caption         =   "Цена уст. (с НДС) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   73
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRes_GE 
         Height          =   300
         Left            =   9750
         MaxLength       =   27
         TabIndex        =   72
         ToolTipText     =   "Цена уст. (с НДС) больше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRes_GE 
         Caption         =   "Цена уст. (с НДС) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   71
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRecom_LE 
         Height          =   300
         Left            =   9750
         MaxLength       =   27
         TabIndex        =   70
         ToolTipText     =   "Рек. Цена меньше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecom_LE 
         Caption         =   "Рек. Цена меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   69
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtPriceRecom_GE 
         Height          =   300
         Left            =   9750
         MaxLength       =   27
         TabIndex        =   68
         ToolTipText     =   "Рек. Цена больше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecom_GE 
         Caption         =   "Рек. Цена больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   67
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtPriceMin_LE 
         Height          =   300
         Left            =   9750
         MaxLength       =   27
         TabIndex        =   66
         ToolTipText     =   "Минимальная цена меньше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceMin_LE 
         Caption         =   "Минимальная цена меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   65
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtPriceMin_GE 
         Height          =   300
         Left            =   9750
         MaxLength       =   27
         TabIndex        =   64
         ToolTipText     =   "Минимальная цена больше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceMin_GE 
         Caption         =   "Минимальная цена больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   63
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtExtraChargeMax_LE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   62
         ToolTipText     =   "Наценка max - % меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMax_LE 
         Caption         =   "Наценка max - % меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   61
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtExtraChargeMax_GE 
         Height          =   300
         Left            =   9750
         MaxLength       =   15
         TabIndex        =   60
         ToolTipText     =   "Наценка max - % больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMax_GE 
         Caption         =   "Наценка max - % больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   59
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtExtraChargeMin_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   58
         ToolTipText     =   "Наценка min - % меньше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMin_LE 
         Caption         =   "Наценка min - % меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   57
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtExtraChargeMin_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   56
         ToolTipText     =   "Наценка min - % больше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMin_GE 
         Caption         =   "Наценка min - % больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   55
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtPriceCommon_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   54
         ToolTipText     =   "Общие затраты меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceCommon_LE 
         Caption         =   "Общие затраты меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtPriceCommon_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   52
         ToolTipText     =   "Общие затраты больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceCommon_GE 
         Caption         =   "Общие затраты больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtPriceETest_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   50
         ToolTipText     =   "Стоимость E-test - цена в у.е. меньше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceETest_LE 
         Caption         =   "Стоимость E-test - цена в у.е. меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   49
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtPriceETest_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   48
         ToolTipText     =   "Стоимость E-test - цена в у.е. больше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceETest_GE 
         Caption         =   "Стоимость E-test - цена в у.е. больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtPriceCustom_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   46
         ToolTipText     =   "Таможня меньше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceCustom_LE 
         Caption         =   "Таможня меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtPriceCustom_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   27
         TabIndex        =   44
         ToolTipText     =   "Таможня больше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceCustom_GE 
         Caption         =   "Таможня больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtTaskPeriod_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   42
         ToolTipText     =   "Срок выполнения заказа (дн) меньше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblTaskPeriod_LE 
         Caption         =   "Срок выполнения заказа (дн) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   41
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtTaskPeriod_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   40
         ToolTipText     =   "Срок выполнения заказа (дн) больше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblTaskPeriod_GE 
         Caption         =   "Срок выполнения заказа (дн) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtProductPeriod_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   38
         ToolTipText     =   "Срок изготовления (дн) меньше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblProductPeriod_LE 
         Caption         =   "Срок изготовления (дн) меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtProductPeriod_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   36
         ToolTipText     =   "Срок изготовления (дн) больше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblProductPeriod_GE 
         Caption         =   "Срок изготовления (дн) больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtCosts_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   34
         ToolTipText     =   "Затраты производителя - цена в у.е. меньше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblCosts_LE 
         Caption         =   "Затраты производителя - цена в у.е. меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtCosts_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   32
         ToolTipText     =   "Затраты производителя - цена в у.е. больше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblCosts_GE 
         Caption         =   "Затраты производителя - цена в у.е. больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtPriceDelivery_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   30
         ToolTipText     =   "Доставка - цена в у.е. меньше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceDelivery_LE 
         Caption         =   "Доставка - цена в у.е. меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtPriceDelivery_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   28
         ToolTipText     =   "Доставка - цена в у.е. больше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceDelivery_GE 
         Caption         =   "Доставка - цена в у.е. больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtPricePCB_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   26
         ToolTipText     =   "Изг. ПП - цена в у.е. меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePCB_LE 
         Caption         =   "Изг. ПП - цена в у.е. меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtPricePCB_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   24
         ToolTipText     =   "Изг. ПП - цена в у.е. больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePCB_GE 
         Caption         =   "Изг. ПП - цена в у.е. больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtPPCount_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   22
         ToolTipText     =   "Количество меньше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblPPCount_LE 
         Caption         =   "Количество меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtPPCount_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   20
         ToolTipText     =   "Количество больше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblPPCount_GE 
         Caption         =   "Количество больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtPriceOne_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   18
         ToolTipText     =   "Цена за шт. - цена в у.е. меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceOne_LE 
         Caption         =   "Цена за шт. - цена в у.е. меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtPriceOne_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   16
         ToolTipText     =   "Цена за шт. - цена в у.е. больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceOne_GE 
         Caption         =   "Цена за шт. - цена в у.е. больше или равно:"
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
         ToolTipText     =   "Подготовка - цена в у.е. меньше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePrepare_LE 
         Caption         =   "Подготовка - цена в у.е. меньше или равно:"
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
         ToolTipText     =   "Подготовка - цена в у.е. больше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePrepare_GE 
         Caption         =   "Подготовка - цена в у.е. больше или равно:"
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
Attribute VB_Name = "frmPCB_MPP"
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
  TSCustom.Init ts, "PCB_MPP", "fctlPCB_MPP"
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
Private Sub txtPriceOne_GE_Validate(Cancel As Boolean)
If txtPriceOne_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceOne_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceOne_GE.Text) < -922337203685478# Or val(txtPriceOne_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceOne_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceOne_GE_Change()
  Changing
End Sub
Private Sub txtPriceOne_LE_Validate(Cancel As Boolean)
If txtPriceOne_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceOne_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceOne_LE.Text) < -922337203685478# Or val(txtPriceOne_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceOne_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceOne_LE_Change()
  Changing
End Sub
Private Sub txtPPCount_GE_Validate(Cancel As Boolean)
If txtPPCount_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPPCount_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPPCount_GE.Text) <> CLng(val(txtPPCount_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPPCount_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPPCount_GE_Change()
  Changing
End Sub
Private Sub txtPPCount_LE_Validate(Cancel As Boolean)
If txtPPCount_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPPCount_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPPCount_LE.Text) <> CLng(val(txtPPCount_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPPCount_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPPCount_LE_Change()
  Changing
End Sub
Private Sub txtPricePCB_GE_Validate(Cancel As Boolean)
If txtPricePCB_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPricePCB_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPricePCB_GE.Text) < -922337203685478# Or val(txtPricePCB_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPricePCB_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPricePCB_GE_Change()
  Changing
End Sub
Private Sub txtPricePCB_LE_Validate(Cancel As Boolean)
If txtPricePCB_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPricePCB_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPricePCB_LE.Text) < -922337203685478# Or val(txtPricePCB_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPricePCB_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPricePCB_LE_Change()
  Changing
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
Private Sub txtCosts_GE_Validate(Cancel As Boolean)
If txtCosts_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCosts_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtCosts_GE.Text) < -922337203685478# Or val(txtCosts_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtCosts_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCosts_GE_Change()
  Changing
End Sub
Private Sub txtCosts_LE_Validate(Cancel As Boolean)
If txtCosts_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCosts_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtCosts_LE.Text) < -922337203685478# Or val(txtCosts_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtCosts_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCosts_LE_Change()
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
Private Sub txtTaskPeriod_GE_Validate(Cancel As Boolean)
If txtTaskPeriod_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTaskPeriod_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtTaskPeriod_GE.Text) <> CLng(val(txtTaskPeriod_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtTaskPeriod_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTaskPeriod_GE_Change()
  Changing
End Sub
Private Sub txtTaskPeriod_LE_Validate(Cancel As Boolean)
If txtTaskPeriod_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTaskPeriod_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtTaskPeriod_LE.Text) <> CLng(val(txtTaskPeriod_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtTaskPeriod_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTaskPeriod_LE_Change()
  Changing
End Sub
Private Sub txtPriceCustom_GE_Validate(Cancel As Boolean)
If txtPriceCustom_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceCustom_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceCustom_GE.Text) < -922337203685478# Or val(txtPriceCustom_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceCustom_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceCustom_GE_Change()
  Changing
End Sub
Private Sub txtPriceCustom_LE_Validate(Cancel As Boolean)
If txtPriceCustom_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceCustom_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceCustom_LE.Text) < -922337203685478# Or val(txtPriceCustom_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceCustom_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceCustom_LE_Change()
  Changing
End Sub
Private Sub txtPriceETest_GE_Validate(Cancel As Boolean)
If txtPriceETest_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceETest_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceETest_GE.Text) < -922337203685478# Or val(txtPriceETest_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceETest_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceETest_GE_Change()
  Changing
End Sub
Private Sub txtPriceETest_LE_Validate(Cancel As Boolean)
If txtPriceETest_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceETest_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceETest_LE.Text) < -922337203685478# Or val(txtPriceETest_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceETest_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceETest_LE_Change()
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
Private Sub txtPriceMin_GE_Validate(Cancel As Boolean)
If txtPriceMin_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceMin_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceMin_GE.Text) < -922337203685478# Or val(txtPriceMin_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceMin_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceMin_GE_Change()
  Changing
End Sub
Private Sub txtPriceMin_LE_Validate(Cancel As Boolean)
If txtPriceMin_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceMin_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceMin_LE.Text) < -922337203685478# Or val(txtPriceMin_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceMin_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceMin_LE_Change()
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
Private Sub txtPriceOneNNDS_GE_Validate(Cancel As Boolean)
If txtPriceOneNNDS_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceOneNNDS_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceOneNNDS_GE.Text) < -922337203685478# Or val(txtPriceOneNNDS_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceOneNNDS_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceOneNNDS_GE_Change()
  Changing
End Sub
Private Sub txtPriceOneNNDS_LE_Validate(Cancel As Boolean)
If txtPriceOneNNDS_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceOneNNDS_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceOneNNDS_LE.Text) < -922337203685478# Or val(txtPriceOneNNDS_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceOneNNDS_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceOneNNDS_LE_Change()
  Changing
End Sub
Private Sub txtProfit_GE_Validate(Cancel As Boolean)
If txtProfit_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtProfit_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtProfit_GE.Text) < -922337203685478# Or val(txtProfit_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtProfit_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtProfit_GE_Change()
  Changing
End Sub
Private Sub txtProfit_LE_Validate(Cancel As Boolean)
If txtProfit_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtProfit_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtProfit_LE.Text) < -922337203685478# Or val(txtProfit_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtProfit_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtProfit_LE_Change()
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
Private Sub dtpNeedsDT_GE_Change()
  Changing
End Sub
Private Sub dtpNeedsDT_LE_Change()
  Changing
End Sub
Private Sub txtManufTypeRef_Change()
  Changing
End Sub
Private Sub cmdManufTypeRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_Manuf", id, brief) Then
          txtManufTypeRef.Tag = Left(id, 38)
          txtManufTypeRef = brief
        End If
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
Private Sub txtMaterialPP_Change()
  Changing
End Sub
Private Sub cmdMaterialPP_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_Material", id, brief) Then
          txtMaterialPP.Tag = Left(id, 38)
          txtMaterialPP = brief
        End If
End Sub
Private Sub txtDefendMask_Change()
  Changing
End Sub
Private Sub cmdDefendMask_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_PMask", id, brief) Then
          txtDefendMask.Tag = Left(id, 38)
          txtDefendMask = brief
        End If
End Sub
Private Sub txtMaskColorTop_Change()
  Changing
End Sub
Private Sub cmdMaskColorTop_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_DMColor", id, brief) Then
          txtMaskColorTop.Tag = Left(id, 38)
          txtMaskColorTop = brief
        End If
End Sub
Private Sub txtSerigraphy_Change()
  Changing
End Sub
Private Sub cmdSerigraphy_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_Shelk", id, brief) Then
          txtSerigraphy.Tag = Left(id, 38)
          txtSerigraphy = brief
        End If
End Sub
Private Sub txtSerigraphyColor_Change()
  Changing
End Sub
Private Sub cmdSerigraphyColor_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_SHColor", id, brief) Then
          txtSerigraphyColor.Tag = Left(id, 38)
          txtSerigraphyColor = brief
        End If
End Sub
Private Sub txtCoverTypeRef_Change()
  Changing
End Sub
Private Sub cmdCoverTypeRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_CoverKP", id, brief) Then
          txtCoverTypeRef.Tag = Left(id, 38)
          txtCoverTypeRef = brief
        End If
End Sub
Private Sub txtThickness_GE_Validate(Cancel As Boolean)
If txtThickness_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtThickness_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtThickness_GE.Text) < -922337203685478# Or val(txtThickness_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtThickness_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtThickness_GE_Change()
  Changing
End Sub
Private Sub txtThickness_LE_Validate(Cancel As Boolean)
If txtThickness_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtThickness_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtThickness_LE.Text) < -922337203685478# Or val(txtThickness_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtThickness_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtThickness_LE_Change()
  Changing
End Sub
Private Sub txtCuperRef_Change()
  Changing
End Sub
Private Sub cmdCuperRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_CuperLen", id, brief) Then
          txtCuperRef.Tag = Left(id, 38)
          txtCuperRef = brief
        End If
End Sub
Private Sub txtMinThinConductor_Change()
  Changing
End Sub
Private Sub cmdMinThinConductor_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_MinThinC", id, brief) Then
          txtMinThinConductor.Tag = Left(id, 38)
          txtMinThinConductor = brief
        End If
End Sub
Private Sub txtMinThinBetween_GE_Validate(Cancel As Boolean)
If txtMinThinBetween_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMinThinBetween_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtMinThinBetween_GE.Text) <> CLng(val(txtMinThinBetween_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtMinThinBetween_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMinThinBetween_GE_Change()
  Changing
End Sub
Private Sub txtMinThinBetween_LE_Validate(Cancel As Boolean)
If txtMinThinBetween_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMinThinBetween_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtMinThinBetween_LE.Text) <> CLng(val(txtMinThinBetween_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtMinThinBetween_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMinThinBetween_LE_Change()
  Changing
End Sub
Private Sub txtMinHole_Change()
  Changing
End Sub
Private Sub cmdMinHole_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_MinThinH", id, brief) Then
          txtMinHole.Tag = Left(id, 38)
          txtMinHole = brief
        End If
End Sub
Private Sub txtMinHoleE_GE_Validate(Cancel As Boolean)
If txtMinHoleE_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMinHoleE_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtMinHoleE_GE.Text) <> CLng(val(txtMinHoleE_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtMinHoleE_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMinHoleE_GE_Change()
  Changing
End Sub
Private Sub txtMinHoleE_LE_Validate(Cancel As Boolean)
If txtMinHoleE_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMinHoleE_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtMinHoleE_LE.Text) <> CLng(val(txtMinHoleE_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtMinHoleE_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMinHoleE_LE_Change()
  Changing
End Sub
Private Sub cmbOpenHole_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbUseGold_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtFaskaGRD_Change()
  Changing
End Sub
Private Sub cmdFaskaGRD_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_FaskGrd", id, brief) Then
          txtFaskaGRD.Tag = Left(id, 38)
          txtFaskaGRD = brief
        End If
End Sub
Private Sub txtProceedContur_Change()
  Changing
End Sub
Private Sub cmdProceedContur_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_Contur", id, brief) Then
          txtProceedContur.Tag = Left(id, 38)
          txtProceedContur = brief
        End If
End Sub
Private Sub txtFaskaSize_GE_Validate(Cancel As Boolean)
If txtFaskaSize_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtFaskaSize_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtFaskaSize_GE.Text) <> CLng(val(txtFaskaSize_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtFaskaSize_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtFaskaSize_GE_Change()
  Changing
End Sub
Private Sub txtFaskaSize_LE_Validate(Cancel As Boolean)
If txtFaskaSize_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtFaskaSize_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtFaskaSize_LE.Text) <> CLng(val(txtFaskaSize_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtFaskaSize_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtFaskaSize_LE_Change()
  Changing
End Sub
Private Sub cmbUseElectrTest_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbIsCustomerCheck_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbCheckImpedance_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtImpedanceOverview_Change()
  Changing
End Sub
Private Sub txtDopNeeds_Change()
  Changing
End Sub
Private Sub txtRecipient_Change()
  Changing
End Sub
Private Sub txtTheSender_Change()
  Changing
End Sub
Private Sub txtWayBill_Change()
  Changing
End Sub
Private Sub txtTheWeight_GE_Validate(Cancel As Boolean)
If txtTheWeight_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheWeight_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtTheWeight_GE.Text) < -922337203685478# Or val(txtTheWeight_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtTheWeight_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheWeight_GE_Change()
  Changing
End Sub
Private Sub txtTheWeight_LE_Validate(Cancel As Boolean)
If txtTheWeight_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheWeight_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtTheWeight_LE.Text) < -922337203685478# Or val(txtTheWeight_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtTheWeight_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheWeight_LE_Change()
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
Private Sub dtpShipedDT_GE_Change()
  Changing
End Sub
Private Sub dtpShipedDT_LE_Change()
  Changing
End Sub
Private Sub dtpManufShipDT_GE_Change()
  Changing
End Sub
Private Sub dtpManufShipDT_LE_Change()
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
Private Sub txtAssessByRef_Change()
  Changing
End Sub
Private Sub cmdAssessByRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtAssessByRef.Tag = Left(id, 38)
          txtAssessByRef = brief
        End If
End Sub
Private Sub txtCostsPriceDM2_GE_Validate(Cancel As Boolean)
If txtCostsPriceDM2_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCostsPriceDM2_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtCostsPriceDM2_GE.Text) < -922337203685478# Or val(txtCostsPriceDM2_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtCostsPriceDM2_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCostsPriceDM2_GE_Change()
  Changing
End Sub
Private Sub txtCostsPriceDM2_LE_Validate(Cancel As Boolean)
If txtCostsPriceDM2_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCostsPriceDM2_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtCostsPriceDM2_LE.Text) < -922337203685478# Or val(txtCostsPriceDM2_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtCostsPriceDM2_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCostsPriceDM2_LE_Change()
  Changing
End Sub
Private Sub txtPriceDM2_GE_Validate(Cancel As Boolean)
If txtPriceDM2_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceDM2_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceDM2_GE.Text) < -922337203685478# Or val(txtPriceDM2_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceDM2_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceDM2_GE_Change()
  Changing
End Sub
Private Sub txtPriceDM2_LE_Validate(Cancel As Boolean)
If txtPriceDM2_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceDM2_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceDM2_LE.Text) < -922337203685478# Or val(txtPriceDM2_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceDM2_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceDM2_LE_Change()
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
Private Sub txtTolerancePRef_Change()
  Changing
End Sub
Private Sub cmdTolerancePRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_ToleranceP", id, brief) Then
          txtTolerancePRef.Tag = Left(id, 38)
          txtTolerancePRef = brief
        End If
End Sub
Private Sub txtToleranceMRef_Change()
  Changing
End Sub
Private Sub cmdToleranceMRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_ToleranceM", id, brief) Then
          txtToleranceMRef.Tag = Left(id, 38)
          txtToleranceMRef = brief
        End If
End Sub
Private Sub txtMaskColorBottom_Change()
  Changing
End Sub
Private Sub cmdMaskColorBottom_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_DMColor", id, brief) Then
          txtMaskColorBottom.Tag = Left(id, 38)
          txtMaskColorBottom = brief
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
dtpNeedsDT_GE = Date
dtpNeedsDT_LE = Date
  txtManufTypeRef.Tag = ""
  txtManufTypeRef = ""
 LoadBtnPictures cmdManufTypeRef, cmdManufTypeRef.Tag
  cmdManufTypeRef.RemoveAllMenu
  txtMaterialPP.Tag = ""
  txtMaterialPP = ""
 LoadBtnPictures cmdMaterialPP, cmdMaterialPP.Tag
  cmdMaterialPP.RemoveAllMenu
  txtDefendMask.Tag = ""
  txtDefendMask = ""
 LoadBtnPictures cmdDefendMask, cmdDefendMask.Tag
  cmdDefendMask.RemoveAllMenu
  txtMaskColorTop.Tag = ""
  txtMaskColorTop = ""
 LoadBtnPictures cmdMaskColorTop, cmdMaskColorTop.Tag
  cmdMaskColorTop.RemoveAllMenu
  txtSerigraphy.Tag = ""
  txtSerigraphy = ""
 LoadBtnPictures cmdSerigraphy, cmdSerigraphy.Tag
  cmdSerigraphy.RemoveAllMenu
  txtSerigraphyColor.Tag = ""
  txtSerigraphyColor = ""
 LoadBtnPictures cmdSerigraphyColor, cmdSerigraphyColor.Tag
  cmdSerigraphyColor.RemoveAllMenu
  txtCoverTypeRef.Tag = ""
  txtCoverTypeRef = ""
 LoadBtnPictures cmdCoverTypeRef, cmdCoverTypeRef.Tag
  cmdCoverTypeRef.RemoveAllMenu
  txtCuperRef.Tag = ""
  txtCuperRef = ""
 LoadBtnPictures cmdCuperRef, cmdCuperRef.Tag
  cmdCuperRef.RemoveAllMenu
  txtMinThinConductor.Tag = ""
  txtMinThinConductor = ""
 LoadBtnPictures cmdMinThinConductor, cmdMinThinConductor.Tag
  cmdMinThinConductor.RemoveAllMenu
  txtMinHole.Tag = ""
  txtMinHole = ""
 LoadBtnPictures cmdMinHole, cmdMinHole.Tag
  cmdMinHole.RemoveAllMenu
cmbOpenHole.Clear
cmbOpenHole.AddItem "Да"
cmbOpenHole.ItemData(cmbOpenHole.NewIndex) = -1
cmbOpenHole.AddItem "Нет"
cmbOpenHole.ItemData(cmbOpenHole.NewIndex) = 0
cmbUseGold.Clear
cmbUseGold.AddItem "Да"
cmbUseGold.ItemData(cmbUseGold.NewIndex) = -1
cmbUseGold.AddItem "Нет"
cmbUseGold.ItemData(cmbUseGold.NewIndex) = 0
  txtFaskaGRD.Tag = ""
  txtFaskaGRD = ""
 LoadBtnPictures cmdFaskaGRD, cmdFaskaGRD.Tag
  cmdFaskaGRD.RemoveAllMenu
  txtProceedContur.Tag = ""
  txtProceedContur = ""
 LoadBtnPictures cmdProceedContur, cmdProceedContur.Tag
  cmdProceedContur.RemoveAllMenu
cmbUseElectrTest.Clear
cmbUseElectrTest.AddItem "Да"
cmbUseElectrTest.ItemData(cmbUseElectrTest.NewIndex) = -1
cmbUseElectrTest.AddItem "Нет"
cmbUseElectrTest.ItemData(cmbUseElectrTest.NewIndex) = 0
cmbIsCustomerCheck.Clear
cmbIsCustomerCheck.AddItem "Да"
cmbIsCustomerCheck.ItemData(cmbIsCustomerCheck.NewIndex) = -1
cmbIsCustomerCheck.AddItem "Нет"
cmbIsCustomerCheck.ItemData(cmbIsCustomerCheck.NewIndex) = 0
cmbCheckImpedance.Clear
cmbCheckImpedance.AddItem "Да"
cmbCheckImpedance.ItemData(cmbCheckImpedance.NewIndex) = -1
cmbCheckImpedance.AddItem "Нет"
cmbCheckImpedance.ItemData(cmbCheckImpedance.NewIndex) = 0
txtRecipient = ""
txtTheSender = ""
txtWayBill = ""
dtpCreatedDT_GE = Now
dtpCreatedDT_LE = Now
dtpEstimationDT_GE = Now
dtpEstimationDT_LE = Now
dtpShipedDT_GE = Now
dtpShipedDT_LE = Now
dtpManufShipDT_GE = Now
dtpManufShipDT_LE = Now
  txtCreatedByRef.Tag = ""
  txtCreatedByRef = ""
 LoadBtnPictures cmdCreatedByRef, cmdCreatedByRef.Tag
  cmdCreatedByRef.RemoveAllMenu
  txtAssessByRef.Tag = ""
  txtAssessByRef = ""
 LoadBtnPictures cmdAssessByRef, cmdAssessByRef.Tag
  cmdAssessByRef.RemoveAllMenu
  txtPriceSetByRef.Tag = ""
  txtPriceSetByRef = ""
 LoadBtnPictures cmdPriceSetByRef, cmdPriceSetByRef.Tag
  cmdPriceSetByRef.RemoveAllMenu
  txtTolerancePRef.Tag = ""
  txtTolerancePRef = ""
 LoadBtnPictures cmdTolerancePRef, cmdTolerancePRef.Tag
  cmdTolerancePRef.RemoveAllMenu
  txtToleranceMRef.Tag = ""
  txtToleranceMRef = ""
 LoadBtnPictures cmdToleranceMRef, cmdToleranceMRef.Tag
  cmdToleranceMRef.RemoveAllMenu
  txtMaskColorBottom.Tag = ""
  txtMaskColorBottom = ""
 LoadBtnPictures cmdMaskColorBottom, cmdMaskColorBottom.Tag
  cmdMaskColorBottom.RemoveAllMenu
OnInit = False
End Sub



