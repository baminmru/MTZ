VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl DATACURR_D 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   1000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin VB.TextBox txtHC_CODE 
         Height          =   300
         Left            =   28650
         MaxLength       =   360
         TabIndex        =   172
         ToolTipText     =   "Код нештатной ситуации тепловычислителя"
         Top             =   3225
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtTAIR2 
         Height          =   300
         Left            =   28650
         TabIndex        =   170
         ToolTipText     =   "Температура воздуха канал 2"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtTAIR1 
         Height          =   300
         Left            =   28650
         TabIndex        =   168
         ToolTipText     =   "Температура воздуха канал 1"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtWORKTIME 
         Height          =   300
         Left            =   28650
         TabIndex        =   166
         ToolTipText     =   "Время работы"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtOKTIME 
         Height          =   300
         Left            =   28650
         TabIndex        =   164
         ToolTipText     =   "Время безошиб.работы"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtCHECK_A 
         Height          =   300
         Left            =   25500
         TabIndex        =   162
         ToolTipText     =   "Проверка архивных данных на НС (0 - не производилась, 1 - произведена)"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDANS6 
         Height          =   300
         Left            =   25500
         TabIndex        =   160
         ToolTipText     =   "DANS6"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDANS5 
         Height          =   300
         Left            =   25500
         TabIndex        =   158
         ToolTipText     =   "DANS5"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDANS4 
         Height          =   300
         Left            =   25500
         TabIndex        =   156
         ToolTipText     =   "DANS4"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDANS3 
         Height          =   300
         Left            =   25500
         TabIndex        =   154
         ToolTipText     =   "DANS3"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDANS2 
         Height          =   300
         Left            =   25500
         TabIndex        =   152
         ToolTipText     =   "DANS2"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDANS1 
         Height          =   300
         Left            =   25500
         TabIndex        =   150
         ToolTipText     =   "DANS1"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtTHOT 
         Height          =   300
         Left            =   25500
         TabIndex        =   148
         ToolTipText     =   "Температура горячей воды"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtHC_2 
         Height          =   300
         Left            =   25500
         MaxLength       =   360
         TabIndex        =   146
         ToolTipText     =   "Нештатная ситуация 2 (ТВ2 или внутренняя)"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtHC_1 
         Height          =   300
         Left            =   22350
         MaxLength       =   360
         TabIndex        =   144
         ToolTipText     =   "Нештатная ситуация 1 (ТВ1 или внешняя)"
         Top             =   6045
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtDQ 
         Height          =   300
         Left            =   22350
         TabIndex        =   142
         ToolTipText     =   "Расход энергии потребитель 1"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtPXB 
         Height          =   300
         Left            =   22350
         TabIndex        =   140
         ToolTipText     =   "Давление холодной воды"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDQ45 
         Height          =   300
         Left            =   22350
         TabIndex        =   138
         ToolTipText     =   "Тепловая энергия потребитель 2"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDQ12 
         Height          =   300
         Left            =   22350
         TabIndex        =   136
         ToolTipText     =   "Тепловая энергия потребитель 1"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtQ5 
         Height          =   300
         Left            =   22350
         TabIndex        =   134
         ToolTipText     =   "Тепловая энергия канал 5"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtPATM 
         Height          =   300
         Left            =   22350
         TabIndex        =   132
         ToolTipText     =   "Атмосферное давление"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtQ4 
         Height          =   300
         Left            =   22350
         TabIndex        =   130
         ToolTipText     =   "Тепловая энергия канал 4"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtQ3 
         Height          =   300
         Left            =   22350
         TabIndex        =   128
         ToolTipText     =   "Тепловая энергия канал 3"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtUNITSR 
         Height          =   300
         Left            =   19200
         MaxLength       =   24
         TabIndex        =   126
         ToolTipText     =   "Единицы измерения расхода"
         Top             =   6045
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtDP45 
         Height          =   300
         Left            =   19200
         TabIndex        =   124
         ToolTipText     =   "P4-P5"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDP12 
         Height          =   300
         Left            =   19200
         TabIndex        =   122
         ToolTipText     =   "P1-P2"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDG45 
         Height          =   300
         Left            =   19200
         TabIndex        =   120
         ToolTipText     =   "G4-G5"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDG12 
         Height          =   300
         Left            =   19200
         TabIndex        =   118
         ToolTipText     =   "G1-G2"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSComCtl2.DTPicker dtpdatetimeCOUNTER 
         Height          =   300
         Left            =   19200
         TabIndex        =   116
         ToolTipText     =   "datetimeCOUNTER"
         Top             =   2520
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   80084995
         CurrentDate     =   39975
      End
      Begin MSMask.MaskEdBox txtSP_TB2 
         Height          =   300
         Left            =   19200
         TabIndex        =   114
         ToolTipText     =   "Схема потребления TB2"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtSP_TB1 
         Height          =   300
         Left            =   19200
         TabIndex        =   112
         ToolTipText     =   "Схема потребления TB1"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtSP 
         Height          =   300
         Left            =   19200
         TabIndex        =   110
         ToolTipText     =   "Схема потребления"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtHC 
         Height          =   300
         Left            =   16050
         MaxLength       =   360
         TabIndex        =   108
         ToolTipText     =   "Нештатные ситуации общ"
         Top             =   6045
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtERRTIMEH 
         Height          =   300
         Left            =   16050
         TabIndex        =   106
         ToolTipText     =   "Время аварии нарастающим итогом"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtERRTIME 
         Height          =   300
         Left            =   16050
         TabIndex        =   104
         ToolTipText     =   "Время аварии"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtV5H 
         Height          =   300
         Left            =   16050
         TabIndex        =   102
         ToolTipText     =   "Объемный расход воды по каналу 5 нарастающим итогом"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtV4H 
         Height          =   300
         Left            =   16050
         TabIndex        =   100
         ToolTipText     =   "Объемный расход воды по каналу 4 нарастающим итогом"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtV2H 
         Height          =   300
         Left            =   16050
         TabIndex        =   98
         ToolTipText     =   "Объемный расход воды по каналу 2 нарастающим итогом"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtV1H 
         Height          =   300
         Left            =   16050
         TabIndex        =   96
         ToolTipText     =   "Объемный расход воды по каналу 1 нарастающим итогом"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtQ2H 
         Height          =   300
         Left            =   16050
         TabIndex        =   94
         ToolTipText     =   "Тепловая энергия канал 2 нарастающим итогом"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtQ1H 
         Height          =   300
         Left            =   16050
         TabIndex        =   92
         ToolTipText     =   "Тепловая энергия канал 1 нарастающим итогом"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtTSUM2 
         Height          =   300
         Left            =   12900
         TabIndex        =   90
         ToolTipText     =   "Тотальное время счета TB2"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtTSUM1 
         Height          =   300
         Left            =   12900
         TabIndex        =   88
         ToolTipText     =   "Тотальное время счета TB1"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtTCE2 
         Height          =   300
         Left            =   12900
         TabIndex        =   86
         ToolTipText     =   "Температура холодного конца канал 2"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtTCE1 
         Height          =   300
         Left            =   12900
         TabIndex        =   84
         ToolTipText     =   "Температура холодного конца канал 1"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtTCOOL 
         Height          =   300
         Left            =   12900
         TabIndex        =   82
         ToolTipText     =   "Температура холодной воды"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtG6 
         Height          =   300
         Left            =   12900
         TabIndex        =   80
         ToolTipText     =   "Текущее значение расхода в трубопроводе 6"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtG5 
         Height          =   300
         Left            =   12900
         TabIndex        =   78
         ToolTipText     =   "Текущее значение расхода в трубопроводе 5"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtG4 
         Height          =   300
         Left            =   12900
         TabIndex        =   76
         ToolTipText     =   "Текущее значение расхода в трубопроводе 4"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtG3 
         Height          =   300
         Left            =   12900
         TabIndex        =   74
         ToolTipText     =   "Текущее значение расхода в трубопроводе 3"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtG2 
         Height          =   300
         Left            =   9750
         TabIndex        =   72
         ToolTipText     =   "Текущее значение расхода в трубопроводе 2"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtG1 
         Height          =   300
         Left            =   9750
         TabIndex        =   70
         ToolTipText     =   "Текущее значение расхода в трубопроводе 1"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtP6 
         Height          =   300
         Left            =   9750
         TabIndex        =   68
         ToolTipText     =   "Давление в трубопроводе 6"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtP5 
         Height          =   300
         Left            =   9750
         TabIndex        =   66
         ToolTipText     =   "Давление в трубопроводе 5"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtP4 
         Height          =   300
         Left            =   9750
         TabIndex        =   64
         ToolTipText     =   "Давление в трубопроводе 4"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtP3 
         Height          =   300
         Left            =   9750
         TabIndex        =   62
         ToolTipText     =   "Давление в трубопроводе 3"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtP2 
         Height          =   300
         Left            =   9750
         TabIndex        =   60
         ToolTipText     =   "Давление в трубопроводе 2"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtP1 
         Height          =   300
         Left            =   9750
         TabIndex        =   58
         ToolTipText     =   "Давление в трубопроводе 1"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtM6 
         Height          =   300
         Left            =   9750
         TabIndex        =   56
         ToolTipText     =   "Масса воды по каналу 6"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDM45 
         Height          =   300
         Left            =   6600
         TabIndex        =   54
         ToolTipText     =   "Разность масс канал 2"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtM5 
         Height          =   300
         Left            =   6600
         TabIndex        =   52
         ToolTipText     =   "Масса воды по каналу 5"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtM4 
         Height          =   300
         Left            =   6600
         TabIndex        =   50
         ToolTipText     =   "Масса воды по каналу 4"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtM3 
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         ToolTipText     =   "Масса воды по каналу 3"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDM12 
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         ToolTipText     =   "Разность масс канал 1 (расход ГВС)"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtM2 
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         ToolTipText     =   "Масса воды по каналу 2"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtM1 
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         ToolTipText     =   "Масса воды по каналу 1"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtV6 
         Height          =   300
         Left            =   6600
         TabIndex        =   40
         ToolTipText     =   "Объемный расход воды по каналу 6"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDV45 
         Height          =   300
         Left            =   6600
         TabIndex        =   38
         ToolTipText     =   "Разность объемов канал 2"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtV5 
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         ToolTipText     =   "Объемный расход воды по каналу 5"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtV4 
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         ToolTipText     =   "Объемный расход воды по каналу 4"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtV3 
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         ToolTipText     =   "Объемный расход воды по каналу 3"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDV12 
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         ToolTipText     =   "Разность объемов канал 1 (расход ГВС)"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtV2 
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         ToolTipText     =   "Объемный расход воды по каналу 2"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtV1 
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         ToolTipText     =   "Объемный расход воды по каналу 1"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtT6 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "Температура по каналу 6"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDT45 
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         ToolTipText     =   "Разность Температур по каналу 4 и 5"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtT5 
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         ToolTipText     =   "Температура по каналу 5"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtT4 
         Height          =   300
         Left            =   300
         TabIndex        =   18
         ToolTipText     =   "Температура по каналу 4"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtT3 
         Height          =   300
         Left            =   300
         TabIndex        =   16
         ToolTipText     =   "Температура по каналу 3"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtDT12 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Разность Температур по каналу 1 и 2"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtT2 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Температура по каналу 2"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtT1 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Температура по каналу 1"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtQ2 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Тепловая энергия канал 2"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtQ1 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "Тепловая энергия канал 1"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSComCtl2.DTPicker dtpDCOUNTER 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Дата счетчика"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   80084995
         CurrentDate     =   39975
      End
      Begin MSComCtl2.DTPicker dtpDCALL 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "Дата опроса"
         Top             =   405
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   80084995
         CurrentDate     =   39975
      End
      Begin VB.Label lblHC_CODE 
         BackStyle       =   0  'Transparent
         Caption         =   "Код нештатной ситуации тепловычислителя:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   28650
         TabIndex        =   171
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTAIR2 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура воздуха канал 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   28650
         TabIndex        =   169
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTAIR1 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура воздуха канал 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   28650
         TabIndex        =   167
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblWORKTIME 
         BackStyle       =   0  'Transparent
         Caption         =   "Время работы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   28650
         TabIndex        =   165
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblOKTIME 
         BackStyle       =   0  'Transparent
         Caption         =   "Время безошиб.работы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   28650
         TabIndex        =   163
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblCHECK_A 
         BackStyle       =   0  'Transparent
         Caption         =   "Проверка архивных данных на НС (0 - не производилась, 1 - произведена):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   161
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblDANS6 
         BackStyle       =   0  'Transparent
         Caption         =   "DANS6:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   159
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblDANS5 
         BackStyle       =   0  'Transparent
         Caption         =   "DANS5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   157
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblDANS4 
         BackStyle       =   0  'Transparent
         Caption         =   "DANS4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   155
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDANS3 
         BackStyle       =   0  'Transparent
         Caption         =   "DANS3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   153
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblDANS2 
         BackStyle       =   0  'Transparent
         Caption         =   "DANS2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   151
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblDANS1 
         BackStyle       =   0  'Transparent
         Caption         =   "DANS1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   149
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTHOT 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура горячей воды:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   147
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblHC_2 
         BackStyle       =   0  'Transparent
         Caption         =   "Нештатная ситуация 2 (ТВ2 или внутренняя):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   145
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblHC_1 
         BackStyle       =   0  'Transparent
         Caption         =   "Нештатная ситуация 1 (ТВ1 или внешняя):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   143
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblDQ 
         BackStyle       =   0  'Transparent
         Caption         =   "Расход энергии потребитель 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   141
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblPXB 
         BackStyle       =   0  'Transparent
         Caption         =   "Давление холодной воды:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   139
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblDQ45 
         BackStyle       =   0  'Transparent
         Caption         =   "Тепловая энергия потребитель 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   137
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDQ12 
         BackStyle       =   0  'Transparent
         Caption         =   "Тепловая энергия потребитель 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   135
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblQ5 
         BackStyle       =   0  'Transparent
         Caption         =   "Тепловая энергия канал 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   133
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPATM 
         BackStyle       =   0  'Transparent
         Caption         =   "Атмосферное давление:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   131
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblQ4 
         BackStyle       =   0  'Transparent
         Caption         =   "Тепловая энергия канал 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   129
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblQ3 
         BackStyle       =   0  'Transparent
         Caption         =   "Тепловая энергия канал 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   127
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblUNITSR 
         BackStyle       =   0  'Transparent
         Caption         =   "Единицы измерения расхода:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   125
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblDP45 
         BackStyle       =   0  'Transparent
         Caption         =   "P4-P5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   123
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblDP12 
         BackStyle       =   0  'Transparent
         Caption         =   "P1-P2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   121
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblDG45 
         BackStyle       =   0  'Transparent
         Caption         =   "G4-G5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   119
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDG12 
         BackStyle       =   0  'Transparent
         Caption         =   "G1-G2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   117
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lbldatetimeCOUNTER 
         BackStyle       =   0  'Transparent
         Caption         =   "datetimeCOUNTER:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   115
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSP_TB2 
         BackStyle       =   0  'Transparent
         Caption         =   "Схема потребления TB2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   113
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblSP_TB1 
         BackStyle       =   0  'Transparent
         Caption         =   "Схема потребления TB1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   111
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSP 
         BackStyle       =   0  'Transparent
         Caption         =   "Схема потребления:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   109
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblHC 
         BackStyle       =   0  'Transparent
         Caption         =   "Нештатные ситуации общ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   107
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblERRTIMEH 
         BackStyle       =   0  'Transparent
         Caption         =   "Время аварии нарастающим итогом:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   105
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblERRTIME 
         BackStyle       =   0  'Transparent
         Caption         =   "Время аварии:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   103
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblV5H 
         BackStyle       =   0  'Transparent
         Caption         =   "Объемный расход воды по каналу 5 нарастающим итогом:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   101
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblV4H 
         BackStyle       =   0  'Transparent
         Caption         =   "Объемный расход воды по каналу 4 нарастающим итогом:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   99
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblV2H 
         BackStyle       =   0  'Transparent
         Caption         =   "Объемный расход воды по каналу 2 нарастающим итогом:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   97
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblV1H 
         BackStyle       =   0  'Transparent
         Caption         =   "Объемный расход воды по каналу 1 нарастающим итогом:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   95
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblQ2H 
         BackStyle       =   0  'Transparent
         Caption         =   "Тепловая энергия канал 2 нарастающим итогом:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   93
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblQ1H 
         BackStyle       =   0  'Transparent
         Caption         =   "Тепловая энергия канал 1 нарастающим итогом:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   91
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblTSUM2 
         BackStyle       =   0  'Transparent
         Caption         =   "Тотальное время счета TB2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   89
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblTSUM1 
         BackStyle       =   0  'Transparent
         Caption         =   "Тотальное время счета TB1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   87
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblTCE2 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура холодного конца канал 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   85
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTCE1 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура холодного конца канал 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   83
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTCOOL 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура холодной воды:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   81
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblG6 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущее значение расхода в трубопроводе 6:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   79
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblG5 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущее значение расхода в трубопроводе 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   77
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblG4 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущее значение расхода в трубопроводе 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   75
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblG3 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущее значение расхода в трубопроводе 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   73
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblG2 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущее значение расхода в трубопроводе 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   71
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblG1 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущее значение расхода в трубопроводе 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   69
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblP6 
         BackStyle       =   0  'Transparent
         Caption         =   "Давление в трубопроводе 6:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   67
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblP5 
         BackStyle       =   0  'Transparent
         Caption         =   "Давление в трубопроводе 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   65
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblP4 
         BackStyle       =   0  'Transparent
         Caption         =   "Давление в трубопроводе 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   63
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblP3 
         BackStyle       =   0  'Transparent
         Caption         =   "Давление в трубопроводе 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   61
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblP2 
         BackStyle       =   0  'Transparent
         Caption         =   "Давление в трубопроводе 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   59
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblP1 
         BackStyle       =   0  'Transparent
         Caption         =   "Давление в трубопроводе 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   57
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblM6 
         BackStyle       =   0  'Transparent
         Caption         =   "Масса воды по каналу 6:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   55
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblDM45 
         BackStyle       =   0  'Transparent
         Caption         =   "Разность масс канал 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblM5 
         BackStyle       =   0  'Transparent
         Caption         =   "Масса воды по каналу 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblM4 
         BackStyle       =   0  'Transparent
         Caption         =   "Масса воды по каналу 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   49
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblM3 
         BackStyle       =   0  'Transparent
         Caption         =   "Масса воды по каналу 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDM12 
         BackStyle       =   0  'Transparent
         Caption         =   "Разность масс канал 1 (расход ГВС):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblM2 
         BackStyle       =   0  'Transparent
         Caption         =   "Масса воды по каналу 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblM1 
         BackStyle       =   0  'Transparent
         Caption         =   "Масса воды по каналу 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   41
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblV6 
         BackStyle       =   0  'Transparent
         Caption         =   "Объемный расход воды по каналу 6:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   39
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDV45 
         BackStyle       =   0  'Transparent
         Caption         =   "Разность объемов канал 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   37
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblV5 
         BackStyle       =   0  'Transparent
         Caption         =   "Объемный расход воды по каналу 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblV4 
         BackStyle       =   0  'Transparent
         Caption         =   "Объемный расход воды по каналу 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblV3 
         BackStyle       =   0  'Transparent
         Caption         =   "Объемный расход воды по каналу 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblDV12 
         BackStyle       =   0  'Transparent
         Caption         =   "Разность объемов канал 1 (расход ГВС):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblV2 
         BackStyle       =   0  'Transparent
         Caption         =   "Объемный расход воды по каналу 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblV1 
         BackStyle       =   0  'Transparent
         Caption         =   "Объемный расход воды по каналу 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblT6 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура по каналу 6:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDT45 
         BackStyle       =   0  'Transparent
         Caption         =   "Разность Температур по каналу 4 и 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblT5 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура по каналу 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblT4 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура по каналу 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblT3 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура по каналу 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblDT12 
         BackStyle       =   0  'Transparent
         Caption         =   "Разность Температур по каналу 1 и 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblT2 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура по каналу 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblT1 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура по каналу 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblQ2 
         BackStyle       =   0  'Transparent
         Caption         =   "Тепловая энергия канал 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblQ1 
         BackStyle       =   0  'Transparent
         Caption         =   "Тепловая энергия канал 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDCOUNTER 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата счетчика:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDCALL 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата опроса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "DATACURR_D"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Суточный архив
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean






'Функция поиска строки
'Parameters:
'[IN][OUT]  Runner , тип параметра: mtzmanager.main,
'[IN]   TypeName , тип параметра: String,
'[IN][OUT]   ID , тип параметра: string,
'[IN][OUT]   Brief , тип параметра: string,
'[IN][OUT]   Cancel , тип параметра: boolean  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.findObject(...параметры...)
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, cancel)
bye:
findObject = result
End Function

'Признак изменения строки
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
'  variable = me.IsChanged()
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub dtpDCALL_Change()
  Changing

End Sub
Private Sub dtpDCOUNTER_Change()
  Changing

End Sub
Private Sub txtQ1_Validate(cancel As Boolean)
If txtQ1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQ1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQ1.SetFocus
  ElseIf Val(txtQ1.Text) < -922337203685478# Or Val(txtQ1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQ1.SetFocus
  End If
End If
End Sub
Private Sub txtQ1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQ1_Change()
  Changing

End Sub
Private Sub txtQ2_Validate(cancel As Boolean)
If txtQ2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQ2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQ2.SetFocus
  ElseIf Val(txtQ2.Text) < -922337203685478# Or Val(txtQ2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQ2.SetFocus
  End If
End If
End Sub
Private Sub txtQ2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQ2_Change()
  Changing

End Sub
Private Sub txtT1_Validate(cancel As Boolean)
If txtT1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtT1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtT1.SetFocus
  ElseIf Val(txtT1.Text) < -922337203685478# Or Val(txtT1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtT1.SetFocus
  End If
End If
End Sub
Private Sub txtT1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtT1_Change()
  Changing

End Sub
Private Sub txtT2_Validate(cancel As Boolean)
If txtT2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtT2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtT2.SetFocus
  ElseIf Val(txtT2.Text) < -922337203685478# Or Val(txtT2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtT2.SetFocus
  End If
End If
End Sub
Private Sub txtT2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtT2_Change()
  Changing

End Sub
Private Sub txtDT12_Validate(cancel As Boolean)
If txtDT12.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDT12.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDT12.SetFocus
  ElseIf Val(txtDT12.Text) < -922337203685478# Or Val(txtDT12.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDT12.SetFocus
  End If
End If
End Sub
Private Sub txtDT12_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDT12_Change()
  Changing

End Sub
Private Sub txtT3_Validate(cancel As Boolean)
If txtT3.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtT3.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtT3.SetFocus
  ElseIf Val(txtT3.Text) < -922337203685478# Or Val(txtT3.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtT3.SetFocus
  End If
End If
End Sub
Private Sub txtT3_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtT3_Change()
  Changing

End Sub
Private Sub txtT4_Validate(cancel As Boolean)
If txtT4.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtT4.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtT4.SetFocus
  ElseIf Val(txtT4.Text) < -922337203685478# Or Val(txtT4.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtT4.SetFocus
  End If
End If
End Sub
Private Sub txtT4_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtT4_Change()
  Changing

End Sub
Private Sub txtT5_Validate(cancel As Boolean)
If txtT5.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtT5.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtT5.SetFocus
  ElseIf Val(txtT5.Text) < -922337203685478# Or Val(txtT5.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtT5.SetFocus
  End If
End If
End Sub
Private Sub txtT5_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtT5_Change()
  Changing

End Sub
Private Sub txtDT45_Validate(cancel As Boolean)
If txtDT45.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDT45.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDT45.SetFocus
  ElseIf Val(txtDT45.Text) < -922337203685478# Or Val(txtDT45.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDT45.SetFocus
  End If
End If
End Sub
Private Sub txtDT45_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDT45_Change()
  Changing

End Sub
Private Sub txtT6_Validate(cancel As Boolean)
If txtT6.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtT6.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtT6.SetFocus
  ElseIf Val(txtT6.Text) < -922337203685478# Or Val(txtT6.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtT6.SetFocus
  End If
End If
End Sub
Private Sub txtT6_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtT6_Change()
  Changing

End Sub
Private Sub txtV1_Validate(cancel As Boolean)
If txtV1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtV1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtV1.SetFocus
  ElseIf Val(txtV1.Text) < -922337203685478# Or Val(txtV1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtV1.SetFocus
  End If
End If
End Sub
Private Sub txtV1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtV1_Change()
  Changing

End Sub
Private Sub txtV2_Validate(cancel As Boolean)
If txtV2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtV2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtV2.SetFocus
  ElseIf Val(txtV2.Text) < -922337203685478# Or Val(txtV2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtV2.SetFocus
  End If
End If
End Sub
Private Sub txtV2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtV2_Change()
  Changing

End Sub
Private Sub txtDV12_Validate(cancel As Boolean)
If txtDV12.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDV12.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDV12.SetFocus
  ElseIf Val(txtDV12.Text) < -922337203685478# Or Val(txtDV12.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDV12.SetFocus
  End If
End If
End Sub
Private Sub txtDV12_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDV12_Change()
  Changing

End Sub
Private Sub txtV3_Validate(cancel As Boolean)
If txtV3.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtV3.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtV3.SetFocus
  ElseIf Val(txtV3.Text) < -922337203685478# Or Val(txtV3.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtV3.SetFocus
  End If
End If
End Sub
Private Sub txtV3_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtV3_Change()
  Changing

End Sub
Private Sub txtV4_Validate(cancel As Boolean)
If txtV4.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtV4.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtV4.SetFocus
  ElseIf Val(txtV4.Text) < -922337203685478# Or Val(txtV4.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtV4.SetFocus
  End If
End If
End Sub
Private Sub txtV4_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtV4_Change()
  Changing

End Sub
Private Sub txtV5_Validate(cancel As Boolean)
If txtV5.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtV5.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtV5.SetFocus
  ElseIf Val(txtV5.Text) < -922337203685478# Or Val(txtV5.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtV5.SetFocus
  End If
End If
End Sub
Private Sub txtV5_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtV5_Change()
  Changing

End Sub
Private Sub txtDV45_Validate(cancel As Boolean)
If txtDV45.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDV45.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDV45.SetFocus
  ElseIf Val(txtDV45.Text) < -922337203685478# Or Val(txtDV45.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDV45.SetFocus
  End If
End If
End Sub
Private Sub txtDV45_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDV45_Change()
  Changing

End Sub
Private Sub txtV6_Validate(cancel As Boolean)
If txtV6.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtV6.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtV6.SetFocus
  ElseIf Val(txtV6.Text) < -922337203685478# Or Val(txtV6.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtV6.SetFocus
  End If
End If
End Sub
Private Sub txtV6_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtV6_Change()
  Changing

End Sub
Private Sub txtM1_Validate(cancel As Boolean)
If txtM1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtM1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtM1.SetFocus
  ElseIf Val(txtM1.Text) < -922337203685478# Or Val(txtM1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtM1.SetFocus
  End If
End If
End Sub
Private Sub txtM1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtM1_Change()
  Changing

End Sub
Private Sub txtM2_Validate(cancel As Boolean)
If txtM2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtM2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtM2.SetFocus
  ElseIf Val(txtM2.Text) < -922337203685478# Or Val(txtM2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtM2.SetFocus
  End If
End If
End Sub
Private Sub txtM2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtM2_Change()
  Changing

End Sub
Private Sub txtDM12_Validate(cancel As Boolean)
If txtDM12.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDM12.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDM12.SetFocus
  ElseIf Val(txtDM12.Text) < -922337203685478# Or Val(txtDM12.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDM12.SetFocus
  End If
End If
End Sub
Private Sub txtDM12_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDM12_Change()
  Changing

End Sub
Private Sub txtM3_Validate(cancel As Boolean)
If txtM3.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtM3.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtM3.SetFocus
  ElseIf Val(txtM3.Text) < -922337203685478# Or Val(txtM3.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtM3.SetFocus
  End If
End If
End Sub
Private Sub txtM3_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtM3_Change()
  Changing

End Sub
Private Sub txtM4_Validate(cancel As Boolean)
If txtM4.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtM4.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtM4.SetFocus
  ElseIf Val(txtM4.Text) < -922337203685478# Or Val(txtM4.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtM4.SetFocus
  End If
End If
End Sub
Private Sub txtM4_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtM4_Change()
  Changing

End Sub
Private Sub txtM5_Validate(cancel As Boolean)
If txtM5.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtM5.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtM5.SetFocus
  ElseIf Val(txtM5.Text) < -922337203685478# Or Val(txtM5.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtM5.SetFocus
  End If
End If
End Sub
Private Sub txtM5_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtM5_Change()
  Changing

End Sub
Private Sub txtDM45_Validate(cancel As Boolean)
If txtDM45.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDM45.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDM45.SetFocus
  ElseIf Val(txtDM45.Text) < -922337203685478# Or Val(txtDM45.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDM45.SetFocus
  End If
End If
End Sub
Private Sub txtDM45_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDM45_Change()
  Changing

End Sub
Private Sub txtM6_Validate(cancel As Boolean)
If txtM6.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtM6.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtM6.SetFocus
  ElseIf Val(txtM6.Text) < -922337203685478# Or Val(txtM6.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtM6.SetFocus
  End If
End If
End Sub
Private Sub txtM6_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtM6_Change()
  Changing

End Sub
Private Sub txtP1_Validate(cancel As Boolean)
If txtP1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtP1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtP1.SetFocus
  ElseIf Val(txtP1.Text) < -922337203685478# Or Val(txtP1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtP1.SetFocus
  End If
End If
End Sub
Private Sub txtP1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtP1_Change()
  Changing

End Sub
Private Sub txtP2_Validate(cancel As Boolean)
If txtP2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtP2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtP2.SetFocus
  ElseIf Val(txtP2.Text) < -922337203685478# Or Val(txtP2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtP2.SetFocus
  End If
End If
End Sub
Private Sub txtP2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtP2_Change()
  Changing

End Sub
Private Sub txtP3_Validate(cancel As Boolean)
If txtP3.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtP3.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtP3.SetFocus
  ElseIf Val(txtP3.Text) < -922337203685478# Or Val(txtP3.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtP3.SetFocus
  End If
End If
End Sub
Private Sub txtP3_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtP3_Change()
  Changing

End Sub
Private Sub txtP4_Validate(cancel As Boolean)
If txtP4.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtP4.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtP4.SetFocus
  ElseIf Val(txtP4.Text) < -922337203685478# Or Val(txtP4.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtP4.SetFocus
  End If
End If
End Sub
Private Sub txtP4_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtP4_Change()
  Changing

End Sub
Private Sub txtP5_Validate(cancel As Boolean)
If txtP5.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtP5.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtP5.SetFocus
  ElseIf Val(txtP5.Text) < -922337203685478# Or Val(txtP5.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtP5.SetFocus
  End If
End If
End Sub
Private Sub txtP5_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtP5_Change()
  Changing

End Sub
Private Sub txtP6_Validate(cancel As Boolean)
If txtP6.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtP6.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtP6.SetFocus
  ElseIf Val(txtP6.Text) < -922337203685478# Or Val(txtP6.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtP6.SetFocus
  End If
End If
End Sub
Private Sub txtP6_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtP6_Change()
  Changing

End Sub
Private Sub txtG1_Validate(cancel As Boolean)
If txtG1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtG1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtG1.SetFocus
  ElseIf Val(txtG1.Text) < -922337203685478# Or Val(txtG1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtG1.SetFocus
  End If
End If
End Sub
Private Sub txtG1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtG1_Change()
  Changing

End Sub
Private Sub txtG2_Validate(cancel As Boolean)
If txtG2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtG2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtG2.SetFocus
  ElseIf Val(txtG2.Text) < -922337203685478# Or Val(txtG2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtG2.SetFocus
  End If
End If
End Sub
Private Sub txtG2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtG2_Change()
  Changing

End Sub
Private Sub txtG3_Validate(cancel As Boolean)
If txtG3.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtG3.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtG3.SetFocus
  ElseIf Val(txtG3.Text) < -922337203685478# Or Val(txtG3.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtG3.SetFocus
  End If
End If
End Sub
Private Sub txtG3_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtG3_Change()
  Changing

End Sub
Private Sub txtG4_Validate(cancel As Boolean)
If txtG4.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtG4.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtG4.SetFocus
  ElseIf Val(txtG4.Text) < -922337203685478# Or Val(txtG4.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtG4.SetFocus
  End If
End If
End Sub
Private Sub txtG4_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtG4_Change()
  Changing

End Sub
Private Sub txtG5_Validate(cancel As Boolean)
If txtG5.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtG5.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtG5.SetFocus
  ElseIf Val(txtG5.Text) < -922337203685478# Or Val(txtG5.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtG5.SetFocus
  End If
End If
End Sub
Private Sub txtG5_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtG5_Change()
  Changing

End Sub
Private Sub txtG6_Validate(cancel As Boolean)
If txtG6.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtG6.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtG6.SetFocus
  ElseIf Val(txtG6.Text) < -922337203685478# Or Val(txtG6.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtG6.SetFocus
  End If
End If
End Sub
Private Sub txtG6_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtG6_Change()
  Changing

End Sub
Private Sub txtTCOOL_Validate(cancel As Boolean)
If txtTCOOL.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTCOOL.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTCOOL.SetFocus
  ElseIf Val(txtTCOOL.Text) < -922337203685478# Or Val(txtTCOOL.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTCOOL.SetFocus
  End If
End If
End Sub
Private Sub txtTCOOL_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTCOOL_Change()
  Changing

End Sub
Private Sub txtTCE1_Validate(cancel As Boolean)
If txtTCE1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTCE1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTCE1.SetFocus
  ElseIf Val(txtTCE1.Text) < -922337203685478# Or Val(txtTCE1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTCE1.SetFocus
  End If
End If
End Sub
Private Sub txtTCE1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTCE1_Change()
  Changing

End Sub
Private Sub txtTCE2_Validate(cancel As Boolean)
If txtTCE2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTCE2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTCE2.SetFocus
  ElseIf Val(txtTCE2.Text) < -922337203685478# Or Val(txtTCE2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTCE2.SetFocus
  End If
End If
End Sub
Private Sub txtTCE2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTCE2_Change()
  Changing

End Sub
Private Sub txtTSUM1_Validate(cancel As Boolean)
If txtTSUM1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTSUM1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTSUM1.SetFocus
  ElseIf Val(txtTSUM1.Text) < -922337203685478# Or Val(txtTSUM1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTSUM1.SetFocus
  End If
End If
End Sub
Private Sub txtTSUM1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTSUM1_Change()
  Changing

End Sub
Private Sub txtTSUM2_Validate(cancel As Boolean)
If txtTSUM2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTSUM2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTSUM2.SetFocus
  ElseIf Val(txtTSUM2.Text) < -922337203685478# Or Val(txtTSUM2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTSUM2.SetFocus
  End If
End If
End Sub
Private Sub txtTSUM2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTSUM2_Change()
  Changing

End Sub
Private Sub txtQ1H_Validate(cancel As Boolean)
If txtQ1H.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQ1H.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQ1H.SetFocus
  ElseIf Val(txtQ1H.Text) < -922337203685478# Or Val(txtQ1H.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQ1H.SetFocus
  End If
End If
End Sub
Private Sub txtQ1H_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQ1H_Change()
  Changing

End Sub
Private Sub txtQ2H_Validate(cancel As Boolean)
If txtQ2H.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQ2H.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQ2H.SetFocus
  ElseIf Val(txtQ2H.Text) < -922337203685478# Or Val(txtQ2H.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQ2H.SetFocus
  End If
End If
End Sub
Private Sub txtQ2H_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQ2H_Change()
  Changing

End Sub
Private Sub txtV1H_Validate(cancel As Boolean)
If txtV1H.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtV1H.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtV1H.SetFocus
  ElseIf Val(txtV1H.Text) < -922337203685478# Or Val(txtV1H.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtV1H.SetFocus
  End If
End If
End Sub
Private Sub txtV1H_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtV1H_Change()
  Changing

End Sub
Private Sub txtV2H_Validate(cancel As Boolean)
If txtV2H.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtV2H.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtV2H.SetFocus
  ElseIf Val(txtV2H.Text) < -922337203685478# Or Val(txtV2H.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtV2H.SetFocus
  End If
End If
End Sub
Private Sub txtV2H_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtV2H_Change()
  Changing

End Sub
Private Sub txtV4H_Validate(cancel As Boolean)
If txtV4H.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtV4H.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtV4H.SetFocus
  ElseIf Val(txtV4H.Text) < -922337203685478# Or Val(txtV4H.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtV4H.SetFocus
  End If
End If
End Sub
Private Sub txtV4H_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtV4H_Change()
  Changing

End Sub
Private Sub txtV5H_Validate(cancel As Boolean)
If txtV5H.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtV5H.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtV5H.SetFocus
  ElseIf Val(txtV5H.Text) < -922337203685478# Or Val(txtV5H.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtV5H.SetFocus
  End If
End If
End Sub
Private Sub txtV5H_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtV5H_Change()
  Changing

End Sub
Private Sub txtERRTIME_Validate(cancel As Boolean)
If txtERRTIME.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtERRTIME.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtERRTIME.SetFocus
  ElseIf Val(txtERRTIME.Text) < -922337203685478# Or Val(txtERRTIME.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtERRTIME.SetFocus
  End If
End If
End Sub
Private Sub txtERRTIME_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtERRTIME_Change()
  Changing

End Sub
Private Sub txtERRTIMEH_Validate(cancel As Boolean)
If txtERRTIMEH.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtERRTIMEH.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtERRTIMEH.SetFocus
  ElseIf Val(txtERRTIMEH.Text) < -922337203685478# Or Val(txtERRTIMEH.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtERRTIMEH.SetFocus
  End If
End If
End Sub
Private Sub txtERRTIMEH_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtERRTIMEH_Change()
  Changing

End Sub
Private Sub txtHC_Change()
  Changing

End Sub
Private Sub txtSP_Validate(cancel As Boolean)
If txtSP.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSP.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtSP.SetFocus
  ElseIf Val(txtSP.Text) < -922337203685478# Or Val(txtSP.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtSP.SetFocus
  End If
End If
End Sub
Private Sub txtSP_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtSP_Change()
  Changing

End Sub
Private Sub txtSP_TB1_Validate(cancel As Boolean)
If txtSP_TB1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSP_TB1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtSP_TB1.SetFocus
  ElseIf Val(txtSP_TB1.Text) < -922337203685478# Or Val(txtSP_TB1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtSP_TB1.SetFocus
  End If
End If
End Sub
Private Sub txtSP_TB1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtSP_TB1_Change()
  Changing

End Sub
Private Sub txtSP_TB2_Validate(cancel As Boolean)
If txtSP_TB2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSP_TB2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtSP_TB2.SetFocus
  ElseIf Val(txtSP_TB2.Text) < -922337203685478# Or Val(txtSP_TB2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtSP_TB2.SetFocus
  End If
End If
End Sub
Private Sub txtSP_TB2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtSP_TB2_Change()
  Changing

End Sub
Private Sub dtpdatetimeCOUNTER_Change()
  Changing

End Sub
Private Sub txtDG12_Validate(cancel As Boolean)
If txtDG12.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDG12.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDG12.SetFocus
  ElseIf Val(txtDG12.Text) < -922337203685478# Or Val(txtDG12.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDG12.SetFocus
  End If
End If
End Sub
Private Sub txtDG12_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDG12_Change()
  Changing

End Sub
Private Sub txtDG45_Validate(cancel As Boolean)
If txtDG45.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDG45.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDG45.SetFocus
  ElseIf Val(txtDG45.Text) < -922337203685478# Or Val(txtDG45.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDG45.SetFocus
  End If
End If
End Sub
Private Sub txtDG45_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDG45_Change()
  Changing

End Sub
Private Sub txtDP12_Validate(cancel As Boolean)
If txtDP12.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDP12.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDP12.SetFocus
  ElseIf Val(txtDP12.Text) < -922337203685478# Or Val(txtDP12.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDP12.SetFocus
  End If
End If
End Sub
Private Sub txtDP12_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDP12_Change()
  Changing

End Sub
Private Sub txtDP45_Validate(cancel As Boolean)
If txtDP45.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDP45.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDP45.SetFocus
  ElseIf Val(txtDP45.Text) < -922337203685478# Or Val(txtDP45.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDP45.SetFocus
  End If
End If
End Sub
Private Sub txtDP45_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDP45_Change()
  Changing

End Sub
Private Sub txtUNITSR_Change()
  Changing

End Sub
Private Sub txtQ3_Validate(cancel As Boolean)
If txtQ3.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQ3.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQ3.SetFocus
  ElseIf Val(txtQ3.Text) < -922337203685478# Or Val(txtQ3.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQ3.SetFocus
  End If
End If
End Sub
Private Sub txtQ3_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQ3_Change()
  Changing

End Sub
Private Sub txtQ4_Validate(cancel As Boolean)
If txtQ4.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQ4.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQ4.SetFocus
  ElseIf Val(txtQ4.Text) < -922337203685478# Or Val(txtQ4.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQ4.SetFocus
  End If
End If
End Sub
Private Sub txtQ4_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQ4_Change()
  Changing

End Sub
Private Sub txtPATM_Validate(cancel As Boolean)
If txtPATM.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPATM.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPATM.SetFocus
  ElseIf Val(txtPATM.Text) < -922337203685478# Or Val(txtPATM.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPATM.SetFocus
  End If
End If
End Sub
Private Sub txtPATM_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPATM_Change()
  Changing

End Sub
Private Sub txtQ5_Validate(cancel As Boolean)
If txtQ5.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQ5.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQ5.SetFocus
  ElseIf Val(txtQ5.Text) < -922337203685478# Or Val(txtQ5.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQ5.SetFocus
  End If
End If
End Sub
Private Sub txtQ5_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQ5_Change()
  Changing

End Sub
Private Sub txtDQ12_Validate(cancel As Boolean)
If txtDQ12.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDQ12.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDQ12.SetFocus
  ElseIf Val(txtDQ12.Text) < -922337203685478# Or Val(txtDQ12.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDQ12.SetFocus
  End If
End If
End Sub
Private Sub txtDQ12_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDQ12_Change()
  Changing

End Sub
Private Sub txtDQ45_Validate(cancel As Boolean)
If txtDQ45.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDQ45.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDQ45.SetFocus
  ElseIf Val(txtDQ45.Text) < -922337203685478# Or Val(txtDQ45.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDQ45.SetFocus
  End If
End If
End Sub
Private Sub txtDQ45_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDQ45_Change()
  Changing

End Sub
Private Sub txtPXB_Validate(cancel As Boolean)
If txtPXB.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPXB.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPXB.SetFocus
  ElseIf Val(txtPXB.Text) < -922337203685478# Or Val(txtPXB.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPXB.SetFocus
  End If
End If
End Sub
Private Sub txtPXB_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPXB_Change()
  Changing

End Sub
Private Sub txtDQ_Validate(cancel As Boolean)
If txtDQ.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDQ.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDQ.SetFocus
  ElseIf Val(txtDQ.Text) < -922337203685478# Or Val(txtDQ.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDQ.SetFocus
  End If
End If
End Sub
Private Sub txtDQ_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDQ_Change()
  Changing

End Sub
Private Sub txtHC_1_Change()
  Changing

End Sub
Private Sub txtHC_2_Change()
  Changing

End Sub
Private Sub txtTHOT_Validate(cancel As Boolean)
If txtTHOT.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTHOT.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTHOT.SetFocus
  ElseIf Val(txtTHOT.Text) < -922337203685478# Or Val(txtTHOT.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTHOT.SetFocus
  End If
End If
End Sub
Private Sub txtTHOT_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTHOT_Change()
  Changing

End Sub
Private Sub txtDANS1_Validate(cancel As Boolean)
If txtDANS1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDANS1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDANS1.SetFocus
  ElseIf Val(txtDANS1.Text) < -922337203685478# Or Val(txtDANS1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDANS1.SetFocus
  End If
End If
End Sub
Private Sub txtDANS1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDANS1_Change()
  Changing

End Sub
Private Sub txtDANS2_Validate(cancel As Boolean)
If txtDANS2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDANS2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDANS2.SetFocus
  ElseIf Val(txtDANS2.Text) < -922337203685478# Or Val(txtDANS2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDANS2.SetFocus
  End If
End If
End Sub
Private Sub txtDANS2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDANS2_Change()
  Changing

End Sub
Private Sub txtDANS3_Validate(cancel As Boolean)
If txtDANS3.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDANS3.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDANS3.SetFocus
  ElseIf Val(txtDANS3.Text) < -922337203685478# Or Val(txtDANS3.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDANS3.SetFocus
  End If
End If
End Sub
Private Sub txtDANS3_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDANS3_Change()
  Changing

End Sub
Private Sub txtDANS4_Validate(cancel As Boolean)
If txtDANS4.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDANS4.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDANS4.SetFocus
  ElseIf Val(txtDANS4.Text) < -922337203685478# Or Val(txtDANS4.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDANS4.SetFocus
  End If
End If
End Sub
Private Sub txtDANS4_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDANS4_Change()
  Changing

End Sub
Private Sub txtDANS5_Validate(cancel As Boolean)
If txtDANS5.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDANS5.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDANS5.SetFocus
  ElseIf Val(txtDANS5.Text) < -922337203685478# Or Val(txtDANS5.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDANS5.SetFocus
  End If
End If
End Sub
Private Sub txtDANS5_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDANS5_Change()
  Changing

End Sub
Private Sub txtDANS6_Validate(cancel As Boolean)
If txtDANS6.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDANS6.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDANS6.SetFocus
  ElseIf Val(txtDANS6.Text) < -922337203685478# Or Val(txtDANS6.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDANS6.SetFocus
  End If
End If
End Sub
Private Sub txtDANS6_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDANS6_Change()
  Changing

End Sub
Private Sub txtCHECK_A_Validate(cancel As Boolean)
If txtCHECK_A.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCHECK_A.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCHECK_A.SetFocus
  ElseIf Val(txtCHECK_A.Text) < -922337203685478# Or Val(txtCHECK_A.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCHECK_A.SetFocus
  End If
End If
End Sub
Private Sub txtCHECK_A_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCHECK_A_Change()
  Changing

End Sub
Private Sub txtOKTIME_Validate(cancel As Boolean)
If txtOKTIME.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtOKTIME.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtOKTIME.SetFocus
  ElseIf Val(txtOKTIME.Text) < -922337203685478# Or Val(txtOKTIME.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtOKTIME.SetFocus
  End If
End If
End Sub
Private Sub txtOKTIME_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtOKTIME_Change()
  Changing

End Sub
Private Sub txtWORKTIME_Validate(cancel As Boolean)
If txtWORKTIME.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWORKTIME.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWORKTIME.SetFocus
  ElseIf Val(txtWORKTIME.Text) < -922337203685478# Or Val(txtWORKTIME.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWORKTIME.SetFocus
  End If
End If
End Sub
Private Sub txtWORKTIME_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWORKTIME_Change()
  Changing

End Sub
Private Sub txtTAIR1_Validate(cancel As Boolean)
If txtTAIR1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTAIR1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTAIR1.SetFocus
  ElseIf Val(txtTAIR1.Text) < -922337203685478# Or Val(txtTAIR1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTAIR1.SetFocus
  End If
End If
End Sub
Private Sub txtTAIR1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTAIR1_Change()
  Changing

End Sub
Private Sub txtTAIR2_Validate(cancel As Boolean)
If txtTAIR2.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTAIR2.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTAIR2.SetFocus
  ElseIf Val(txtTAIR2.Text) < -922337203685478# Or Val(txtTAIR2.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTAIR2.SetFocus
  End If
End If
End Sub
Private Sub txtTAIR2_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTAIR2_Change()
  Changing

End Sub
Private Sub txtHC_CODE_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub

'Контроль правильности заполнения данных на панели редактирования
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.IsOK()
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

  IsOK = mIsOK
End Function
Private Function AddSQLRefIds(ByVal strTo As String, ByVal fldName As String, ByVal strFrom As String) As String
  Dim XMLDocFrom As New DOMDocument
  Dim XMLDocTo As New DOMDocument
  AddSQLRefIds = strTo
  On Error GoTo err
  Call XMLDocTo.loadXML(strTo)
  Call XMLDocFrom.loadXML(strFrom)
  Dim Node As MSXML2.IXMLDOMNode
  Dim ID As String
  For Each Node In XMLDocFrom.childNodes.Item(0).childNodes
    If (Node.baseName = "ID") Then
      ID = Node.Text
      Dim NodeTO As MSXML2.IXMLDOMNode
      Dim bAdded As Boolean
      bAdded = False
      For Each NodeTO In XMLDocTo.childNodes.Item(0).childNodes
       If (NodeTO.baseName = fldName & "ID") Then
         NodeTO.Text = ID
         bAdded = True
         Exit For
       End If
      Next
      If (Not bAdded) Then
       Dim newNode As MSXML2.IXMLDOMNode
       Set newNode = XMLDocTo.createNode(MSXML2.NODE_ELEMENT, fldName & "ID", XMLDocTo.namespaceURI)
        newNode.Text = ID
       Call XMLDocTo.childNodes.Item(0).appendChild(newNode)
      End If
      AddSQLRefIds = XMLDocTo.xml
      Exit For
    End If
  Next
err:
End Function

'Инициализация контролов панели
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.InitPanel()
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

dtpDCALL = Now
If Item.DCALL <> 0 Then
 dtpDCALL = Item.DCALL
Else
 dtpDCALL.Value = Null
End If
dtpDCOUNTER = Now
If Item.DCOUNTER <> 0 Then
 dtpDCOUNTER = Item.DCOUNTER
Else
 dtpDCOUNTER.Value = Null
End If
txtQ1 = Item.Q1
txtQ2 = Item.Q2
txtT1 = Item.T1
txtT2 = Item.T2
txtDT12 = Item.DT12
txtT3 = Item.T3
txtT4 = Item.T4
txtT5 = Item.T5
txtDT45 = Item.DT45
txtT6 = Item.T6
txtV1 = Item.V1
txtV2 = Item.V2
txtDV12 = Item.DV12
txtV3 = Item.V3
txtV4 = Item.V4
txtV5 = Item.V5
txtDV45 = Item.DV45
txtV6 = Item.V6
txtM1 = Item.M1
txtM2 = Item.M2
txtDM12 = Item.DM12
txtM3 = Item.M3
txtM4 = Item.M4
txtM5 = Item.M5
txtDM45 = Item.DM45
txtM6 = Item.M6
txtP1 = Item.P1
txtP2 = Item.P2
txtP3 = Item.P3
txtP4 = Item.P4
txtP5 = Item.P5
txtP6 = Item.P6
txtG1 = Item.G1
txtG2 = Item.G2
txtG3 = Item.G3
txtG4 = Item.G4
txtG5 = Item.G5
txtG6 = Item.G6
txtTCOOL = Item.TCOOL
txtTCE1 = Item.TCE1
txtTCE2 = Item.TCE2
txtTSUM1 = Item.TSUM1
txtTSUM2 = Item.TSUM2
txtQ1H = Item.Q1H
txtQ2H = Item.Q2H
txtV1H = Item.V1H
txtV2H = Item.V2H
txtV4H = Item.V4H
txtV5H = Item.V5H
txtERRTIME = Item.ERRTIME
txtERRTIMEH = Item.ERRTIMEH
  On Error Resume Next
txtHC = Item.HC
txtSP = Item.SP
txtSP_TB1 = Item.SP_TB1
txtSP_TB2 = Item.SP_TB2
dtpdatetimeCOUNTER = Now
If Item.datetimeCOUNTER <> 0 Then
 dtpdatetimeCOUNTER = Item.datetimeCOUNTER
Else
 dtpdatetimeCOUNTER.Value = Null
End If
txtDG12 = Item.DG12
txtDG45 = Item.DG45
txtDP12 = Item.DP12
txtDP45 = Item.DP45
  On Error Resume Next
txtUNITSR = Item.UNITSR
txtQ3 = Item.Q3
txtQ4 = Item.Q4
txtPATM = Item.PATM
txtQ5 = Item.Q5
txtDQ12 = Item.DQ12
txtDQ45 = Item.DQ45
txtPXB = Item.PXB
txtDQ = Item.DQ
  On Error Resume Next
txtHC_1 = Item.HC_1
  On Error Resume Next
txtHC_2 = Item.HC_2
txtTHOT = Item.THOT
txtDANS1 = Item.DANS1
txtDANS2 = Item.DANS2
txtDANS3 = Item.DANS3
txtDANS4 = Item.DANS4
txtDANS5 = Item.DANS5
txtDANS6 = Item.DANS6
txtCHECK_A = Item.CHECK_A
txtOKTIME = Item.OKTIME
txtWORKTIME = Item.WORKTIME
txtTAIR1 = Item.TAIR1
txtTAIR2 = Item.TAIR2
  On Error Resume Next
txtHC_CODE = Item.HC_CODE
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub

'Сохранение
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Save({параметры})
Public Sub Save()
If OnInit Then Exit Sub

  If IsNull(dtpDCALL) Then
    Item.DCALL = 0
  Else
    Item.DCALL = dtpDCALL.Value
  End If
  If IsNull(dtpDCOUNTER) Then
    Item.DCOUNTER = 0
  Else
    Item.DCOUNTER = dtpDCOUNTER.Value
  End If
Item.Q1 = CDbl(txtQ1)
Item.Q2 = CDbl(txtQ2)
Item.T1 = CDbl(txtT1)
Item.T2 = CDbl(txtT2)
Item.DT12 = CDbl(txtDT12)
Item.T3 = CDbl(txtT3)
Item.T4 = CDbl(txtT4)
Item.T5 = CDbl(txtT5)
Item.DT45 = CDbl(txtDT45)
Item.T6 = CDbl(txtT6)
Item.V1 = CDbl(txtV1)
Item.V2 = CDbl(txtV2)
Item.DV12 = CDbl(txtDV12)
Item.V3 = CDbl(txtV3)
Item.V4 = CDbl(txtV4)
Item.V5 = CDbl(txtV5)
Item.DV45 = CDbl(txtDV45)
Item.V6 = CDbl(txtV6)
Item.M1 = CDbl(txtM1)
Item.M2 = CDbl(txtM2)
Item.DM12 = CDbl(txtDM12)
Item.M3 = CDbl(txtM3)
Item.M4 = CDbl(txtM4)
Item.M5 = CDbl(txtM5)
Item.DM45 = CDbl(txtDM45)
Item.M6 = CDbl(txtM6)
Item.P1 = CDbl(txtP1)
Item.P2 = CDbl(txtP2)
Item.P3 = CDbl(txtP3)
Item.P4 = CDbl(txtP4)
Item.P5 = CDbl(txtP5)
Item.P6 = CDbl(txtP6)
Item.G1 = CDbl(txtG1)
Item.G2 = CDbl(txtG2)
Item.G3 = CDbl(txtG3)
Item.G4 = CDbl(txtG4)
Item.G5 = CDbl(txtG5)
Item.G6 = CDbl(txtG6)
Item.TCOOL = CDbl(txtTCOOL)
Item.TCE1 = CDbl(txtTCE1)
Item.TCE2 = CDbl(txtTCE2)
Item.TSUM1 = CDbl(txtTSUM1)
Item.TSUM2 = CDbl(txtTSUM2)
Item.Q1H = CDbl(txtQ1H)
Item.Q2H = CDbl(txtQ2H)
Item.V1H = CDbl(txtV1H)
Item.V2H = CDbl(txtV2H)
Item.V4H = CDbl(txtV4H)
Item.V5H = CDbl(txtV5H)
Item.ERRTIME = CDbl(txtERRTIME)
Item.ERRTIMEH = CDbl(txtERRTIMEH)
Item.HC = txtHC
Item.SP = CDbl(txtSP)
Item.SP_TB1 = CDbl(txtSP_TB1)
Item.SP_TB2 = CDbl(txtSP_TB2)
  If IsNull(dtpdatetimeCOUNTER) Then
    Item.datetimeCOUNTER = 0
  Else
    Item.datetimeCOUNTER = dtpdatetimeCOUNTER.Value
  End If
Item.DG12 = CDbl(txtDG12)
Item.DG45 = CDbl(txtDG45)
Item.DP12 = CDbl(txtDP12)
Item.DP45 = CDbl(txtDP45)
Item.UNITSR = txtUNITSR
Item.Q3 = CDbl(txtQ3)
Item.Q4 = CDbl(txtQ4)
Item.PATM = CDbl(txtPATM)
Item.Q5 = CDbl(txtQ5)
Item.DQ12 = CDbl(txtDQ12)
Item.DQ45 = CDbl(txtDQ45)
Item.PXB = CDbl(txtPXB)
Item.DQ = CDbl(txtDQ)
Item.HC_1 = txtHC_1
Item.HC_2 = txtHC_2
Item.THOT = CDbl(txtTHOT)
Item.DANS1 = CDbl(txtDANS1)
Item.DANS2 = CDbl(txtDANS2)
Item.DANS3 = CDbl(txtDANS3)
Item.DANS4 = CDbl(txtDANS4)
Item.DANS5 = CDbl(txtDANS5)
Item.DANS6 = CDbl(txtDANS6)
Item.CHECK_A = CDbl(txtCHECK_A)
Item.OKTIME = CDbl(txtOKTIME)
Item.WORKTIME = CDbl(txtWORKTIME)
Item.TAIR1 = CDbl(txtTAIR1)
Item.TAIR2 = CDbl(txtTAIR2)
Item.HC_CODE = txtHC_CODE
 mIsChanged = False
 RaiseEvent Changed
End Sub

'Подбор размера панели по размеру контролов
'Parameters:
'[IN][OUT]  x , тип параметра: Single,
'[IN][OUT]   y , тип параметра: single  - ...
'See Also:
'Example:
'  call me.OptimalSize({параметры})
 Public Sub OptimalSize(x As Single, y As Single)
   Panel.OptimalSize x, y
   x = x + Panel.Left
   y = y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim x As Single, y As Single
   Panel.OptimalSize x, y
   OptimalY = y
 End Function

'Открытие окна настройки панели
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
   Panel.Customize
 End Sub

'Строка положения контролов на панели для сохранения позиций
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. PanelCustomisationString
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property

'Восстановление  позиций контролов из строки
'Parameters:
'[IN][OUT]  s , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. PanelCustomisationString = value
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property

'Разрешения изменений контролов
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Enabled
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property

'Запрет \ Разрешение изменений контролов
'Parameters:
'[IN]   v , тип параметра: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. Enabled = value
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



