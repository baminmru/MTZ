VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl CONTRACT 
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
      Begin VB.TextBox txtFLD104 
         Height          =   300
         Left            =   28650
         MaxLength       =   96
         TabIndex        =   164
         ToolTipText     =   "Расходомер M2"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtFLD103 
         Height          =   300
         Left            =   25500
         MaxLength       =   96
         TabIndex        =   162
         ToolTipText     =   "Доп_погр_изм_M2гв%"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtFLD102 
         Height          =   300
         Left            =   25500
         MaxLength       =   96
         TabIndex        =   160
         ToolTipText     =   "Доп_погр_изм_M1гв%"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtFLD101 
         Height          =   300
         Left            =   25500
         MaxLength       =   96
         TabIndex        =   158
         ToolTipText     =   "Доп_погр_изм_M2%"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtFLD100 
         Height          =   300
         Left            =   25500
         MaxLength       =   96
         TabIndex        =   156
         ToolTipText     =   "Доп_погр_изм_M1%"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFLD99 
         Height          =   300
         Left            =   25500
         MaxLength       =   96
         TabIndex        =   154
         ToolTipText     =   "Цена_имп_M2гв"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtFLD98 
         Height          =   300
         Left            =   25500
         MaxLength       =   96
         TabIndex        =   152
         ToolTipText     =   "Цена_имп_M1гв"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtFLD97 
         Height          =   300
         Left            =   25500
         MaxLength       =   96
         TabIndex        =   150
         ToolTipText     =   "Цена_имп_M2"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFLD96 
         Height          =   300
         Left            =   25500
         MaxLength       =   96
         TabIndex        =   148
         ToolTipText     =   "Цена_имп_M1"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFLD95 
         Height          =   300
         Left            =   25500
         MaxLength       =   96
         TabIndex        =   146
         ToolTipText     =   "DyГВСц"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtFLD94 
         Height          =   300
         Left            =   22350
         MaxLength       =   96
         TabIndex        =   144
         ToolTipText     =   "G(гвс)ОБР"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtFLD93 
         Height          =   300
         Left            =   22350
         MaxLength       =   96
         TabIndex        =   142
         ToolTipText     =   "Стр.адрес"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtFLD92 
         Height          =   300
         Left            =   22350
         MaxLength       =   96
         TabIndex        =   140
         ToolTipText     =   "Узел учета"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtFLD90 
         Height          =   300
         Left            =   22350
         MaxLength       =   96
         TabIndex        =   138
         ToolTipText     =   "Фамилия"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFLD89 
         Height          =   300
         Left            =   22350
         MaxLength       =   96
         TabIndex        =   136
         ToolTipText     =   "Дата поверки"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtFLD88 
         Height          =   300
         Left            =   22350
         MaxLength       =   96
         TabIndex        =   134
         ToolTipText     =   "Qгвс ср"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtFLD87 
         Height          =   300
         Left            =   22350
         MaxLength       =   96
         TabIndex        =   132
         ToolTipText     =   "Qтех_гвс ср"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFLD86 
         Height          =   300
         Left            =   22350
         MaxLength       =   96
         TabIndex        =   130
         ToolTipText     =   "Qтех_гвс"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFLD85 
         Height          =   300
         Left            =   22350
         MaxLength       =   96
         TabIndex        =   128
         ToolTipText     =   "Сист_теплопотребления"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtFLD84 
         Height          =   300
         Left            =   19200
         MaxLength       =   96
         TabIndex        =   126
         ToolTipText     =   "Код УУТЭ"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtFLD83 
         Height          =   300
         Left            =   19200
         MaxLength       =   96
         TabIndex        =   124
         ToolTipText     =   "Gвент"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtFLD82 
         Height          =   300
         Left            =   19200
         MaxLength       =   96
         TabIndex        =   122
         ToolTipText     =   "Термопреобр"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtFLD81 
         Height          =   300
         Left            =   19200
         MaxLength       =   96
         TabIndex        =   120
         ToolTipText     =   "Формула2"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFLD73 
         Height          =   300
         Left            =   19200
         MaxLength       =   96
         TabIndex        =   118
         ToolTipText     =   "Расходомер ГВСц"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtFLD72 
         Height          =   300
         Left            =   19200
         MaxLength       =   96
         TabIndex        =   116
         ToolTipText     =   "Тхв"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtFLD71 
         Height          =   300
         Left            =   19200
         MaxLength       =   96
         TabIndex        =   114
         ToolTipText     =   "Qвент"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFLD70 
         Height          =   300
         Left            =   19200
         MaxLength       =   96
         TabIndex        =   112
         ToolTipText     =   "Qтех"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFLD69 
         Height          =   300
         Left            =   19200
         MaxLength       =   96
         TabIndex        =   110
         ToolTipText     =   "Gгвс_м"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtFLD68 
         Height          =   300
         Left            =   16050
         MaxLength       =   96
         TabIndex        =   108
         ToolTipText     =   "Gтех_гвс"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtFLD67 
         Height          =   300
         Left            =   16050
         MaxLength       =   96
         TabIndex        =   106
         ToolTipText     =   "Gтех"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtFLD66 
         Height          =   300
         Left            =   16050
         MaxLength       =   96
         TabIndex        =   104
         ToolTipText     =   "Т4"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtFLD65 
         Height          =   300
         Left            =   16050
         MaxLength       =   96
         TabIndex        =   102
         ToolTipText     =   "Т3"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFLD64 
         Height          =   300
         Left            =   16050
         MaxLength       =   96
         TabIndex        =   100
         ToolTipText     =   "Т2"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtFLD63 
         Height          =   300
         Left            =   16050
         MaxLength       =   96
         TabIndex        =   98
         ToolTipText     =   "Т1"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtFLD62 
         Height          =   300
         Left            =   16050
         MaxLength       =   96
         TabIndex        =   96
         ToolTipText     =   "Термопреобр ГВС"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFLD61 
         Height          =   300
         Left            =   16050
         MaxLength       =   96
         TabIndex        =   94
         ToolTipText     =   "Сут_архив"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFLD60 
         Height          =   300
         Left            =   16050
         MaxLength       =   96
         TabIndex        =   92
         ToolTipText     =   "Часов_архив"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtFLD59 
         Height          =   300
         Left            =   12900
         MaxLength       =   96
         TabIndex        =   90
         ToolTipText     =   "Gну"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtFLD58 
         Height          =   300
         Left            =   12900
         MaxLength       =   96
         TabIndex        =   88
         ToolTipText     =   "Gв"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtFLD57 
         Height          =   300
         Left            =   12900
         MaxLength       =   96
         TabIndex        =   86
         ToolTipText     =   "Gот"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtFLD56 
         Height          =   300
         Left            =   12900
         MaxLength       =   96
         TabIndex        =   84
         ToolTipText     =   "Qну"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFLD55 
         Height          =   300
         Left            =   12900
         MaxLength       =   96
         TabIndex        =   82
         ToolTipText     =   "Qгвс"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtFLD54 
         Height          =   300
         Left            =   12900
         MaxLength       =   96
         TabIndex        =   80
         ToolTipText     =   "Qв"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtFLD53 
         Height          =   300
         Left            =   12900
         MaxLength       =   96
         TabIndex        =   78
         ToolTipText     =   "Qот"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFLD52 
         Height          =   300
         Left            =   12900
         MaxLength       =   96
         TabIndex        =   76
         ToolTipText     =   "Схема"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFLD51 
         Height          =   300
         Left            =   12900
         MaxLength       =   96
         TabIndex        =   74
         ToolTipText     =   "Наименование счетчика"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtFLD50 
         Height          =   300
         Left            =   9750
         MaxLength       =   96
         TabIndex        =   72
         ToolTipText     =   "Формула"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtFLD49 
         Height          =   300
         Left            =   9750
         MaxLength       =   96
         TabIndex        =   70
         ToolTipText     =   "тип термометра"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtFLD48 
         Height          =   300
         Left            =   9750
         MaxLength       =   96
         TabIndex        =   68
         ToolTipText     =   "Тип расходомера"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtFLD47 
         Height          =   300
         Left            =   9750
         MaxLength       =   96
         TabIndex        =   66
         ToolTipText     =   "Теп_камера"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFLD46 
         Height          =   300
         Left            =   9750
         MaxLength       =   96
         TabIndex        =   64
         ToolTipText     =   "Т_график"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtFLD45 
         Height          =   300
         Left            =   9750
         MaxLength       =   96
         TabIndex        =   62
         ToolTipText     =   "Способ отбора"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtFLD43 
         Height          =   300
         Left            =   9750
         MaxLength       =   96
         TabIndex        =   60
         ToolTipText     =   "Рпр"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFLD42 
         Height          =   300
         Left            =   9750
         MaxLength       =   96
         TabIndex        =   58
         ToolTipText     =   "Робр"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFLD41 
         Height          =   300
         Left            =   9750
         MaxLength       =   96
         TabIndex        =   56
         ToolTipText     =   "Расходомер ГВС"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtFLD40 
         Height          =   300
         Left            =   6600
         MaxLength       =   96
         TabIndex        =   54
         ToolTipText     =   "Расходомер"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtFLD37 
         Height          =   300
         Left            =   6600
         MaxLength       =   96
         TabIndex        =   52
         ToolTipText     =   "Магистраль"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtFLD36 
         Height          =   300
         Left            =   6600
         MaxLength       =   96
         TabIndex        =   50
         ToolTipText     =   "Источник"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtFLD35 
         Height          =   300
         Left            =   6600
         MaxLength       =   96
         TabIndex        =   48
         ToolTipText     =   "Договор G1"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFLD34 
         Height          =   300
         Left            =   6600
         MaxLength       =   96
         TabIndex        =   46
         ToolTipText     =   "Договор G2"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtFLD33 
         Height          =   300
         Left            =   6600
         MaxLength       =   96
         TabIndex        =   44
         ToolTipText     =   "Договор"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtFLD32 
         Height          =   300
         Left            =   6600
         MaxLength       =   96
         TabIndex        =   42
         ToolTipText     =   "д20ПР"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFLD31 
         Height          =   300
         Left            =   6600
         MaxLength       =   96
         TabIndex        =   40
         ToolTipText     =   "д20ОБ"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFLD30 
         Height          =   300
         Left            =   6600
         MaxLength       =   96
         TabIndex        =   38
         ToolTipText     =   "Gут"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtFLD29 
         Height          =   300
         Left            =   3450
         MaxLength       =   96
         TabIndex        =   36
         ToolTipText     =   "GпрПР"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtFLD28 
         Height          =   300
         Left            =   3450
         MaxLength       =   96
         TabIndex        =   34
         ToolTipText     =   "GпрОБ"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtFLD27 
         Height          =   300
         Left            =   3450
         MaxLength       =   96
         TabIndex        =   32
         ToolTipText     =   "Gпр_minПР"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtFLD26 
         Height          =   300
         Left            =   3450
         MaxLength       =   96
         TabIndex        =   30
         ToolTipText     =   "Gпр_minОБ"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFLD25 
         Height          =   300
         Left            =   3450
         MaxLength       =   96
         TabIndex        =   28
         ToolTipText     =   "Gпр(гвс min)"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtFLD24 
         Height          =   300
         Left            =   3450
         MaxLength       =   96
         TabIndex        =   26
         ToolTipText     =   "Gов"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtFLD23 
         Height          =   300
         Left            =   3450
         MaxLength       =   96
         TabIndex        =   24
         ToolTipText     =   "Gоб(гвс min)"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFLD22 
         Height          =   300
         Left            =   3450
         MaxLength       =   96
         TabIndex        =   22
         ToolTipText     =   "Gгвс"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFLD21 
         Height          =   300
         Left            =   3450
         MaxLength       =   96
         TabIndex        =   20
         ToolTipText     =   "G(гвс)ПР"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtFLD20 
         Height          =   300
         Left            =   300
         MaxLength       =   96
         TabIndex        =   18
         ToolTipText     =   "dРпрПР"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtFLD19 
         Height          =   300
         Left            =   300
         MaxLength       =   96
         TabIndex        =   16
         ToolTipText     =   "dРпрОБ"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtFLD18 
         Height          =   300
         Left            =   300
         MaxLength       =   96
         TabIndex        =   14
         ToolTipText     =   "DyПР"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtFLD17 
         Height          =   300
         Left            =   300
         MaxLength       =   96
         TabIndex        =   12
         ToolTipText     =   "DyОБР"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFLD16 
         Height          =   300
         Left            =   300
         MaxLength       =   96
         TabIndex        =   10
         ToolTipText     =   "DyГВС"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtFLD15 
         Height          =   300
         Left            =   300
         MaxLength       =   96
         TabIndex        =   8
         ToolTipText     =   "D20ПР"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtFLD14 
         Height          =   300
         Left            =   300
         MaxLength       =   96
         TabIndex        =   6
         ToolTipText     =   "D20ОБ"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFLD13 
         Height          =   300
         Left            =   300
         MaxLength       =   96
         TabIndex        =   4
         ToolTipText     =   "№ключа"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFLD12 
         Height          =   300
         Left            =   300
         MaxLength       =   96
         TabIndex        =   2
         ToolTipText     =   "№ прибора"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblFLD104 
         BackStyle       =   0  'Transparent
         Caption         =   "Расходомер M2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   28650
         TabIndex        =   163
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFLD103 
         BackStyle       =   0  'Transparent
         Caption         =   "Доп_погр_изм_M2гв%:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   161
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFLD102 
         BackStyle       =   0  'Transparent
         Caption         =   "Доп_погр_изм_M1гв%:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   159
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblFLD101 
         BackStyle       =   0  'Transparent
         Caption         =   "Доп_погр_изм_M2%:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   157
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFLD100 
         BackStyle       =   0  'Transparent
         Caption         =   "Доп_погр_изм_M1%:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   155
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFLD99 
         BackStyle       =   0  'Transparent
         Caption         =   "Цена_имп_M2гв:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   153
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFLD98 
         BackStyle       =   0  'Transparent
         Caption         =   "Цена_имп_M1гв:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   151
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFLD97 
         BackStyle       =   0  'Transparent
         Caption         =   "Цена_имп_M2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   149
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFLD96 
         BackStyle       =   0  'Transparent
         Caption         =   "Цена_имп_M1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   147
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFLD95 
         BackStyle       =   0  'Transparent
         Caption         =   "DyГВСц:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   25500
         TabIndex        =   145
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFLD94 
         BackStyle       =   0  'Transparent
         Caption         =   "G(гвс)ОБР:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   143
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFLD93 
         BackStyle       =   0  'Transparent
         Caption         =   "Стр.адрес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   141
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblFLD92 
         BackStyle       =   0  'Transparent
         Caption         =   "Узел учета:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   139
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFLD90 
         BackStyle       =   0  'Transparent
         Caption         =   "Фамилия:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   137
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFLD89 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата поверки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   135
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFLD88 
         BackStyle       =   0  'Transparent
         Caption         =   "Qгвс ср:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   133
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFLD87 
         BackStyle       =   0  'Transparent
         Caption         =   "Qтех_гвс ср:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   131
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFLD86 
         BackStyle       =   0  'Transparent
         Caption         =   "Qтех_гвс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   129
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFLD85 
         BackStyle       =   0  'Transparent
         Caption         =   "Сист_теплопотребления:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   22350
         TabIndex        =   127
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFLD84 
         BackStyle       =   0  'Transparent
         Caption         =   "Код УУТЭ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   125
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFLD83 
         BackStyle       =   0  'Transparent
         Caption         =   "Gвент:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   123
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblFLD82 
         BackStyle       =   0  'Transparent
         Caption         =   "Термопреобр:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   121
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFLD81 
         BackStyle       =   0  'Transparent
         Caption         =   "Формула2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   119
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFLD73 
         BackStyle       =   0  'Transparent
         Caption         =   "Расходомер ГВСц:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   117
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFLD72 
         BackStyle       =   0  'Transparent
         Caption         =   "Тхв:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   115
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFLD71 
         BackStyle       =   0  'Transparent
         Caption         =   "Qвент:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   113
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFLD70 
         BackStyle       =   0  'Transparent
         Caption         =   "Qтех:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   111
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFLD69 
         BackStyle       =   0  'Transparent
         Caption         =   "Gгвс_м:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   19200
         TabIndex        =   109
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFLD68 
         BackStyle       =   0  'Transparent
         Caption         =   "Gтех_гвс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   107
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFLD67 
         BackStyle       =   0  'Transparent
         Caption         =   "Gтех:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   105
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblFLD66 
         BackStyle       =   0  'Transparent
         Caption         =   "Т4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   103
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFLD65 
         BackStyle       =   0  'Transparent
         Caption         =   "Т3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   101
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFLD64 
         BackStyle       =   0  'Transparent
         Caption         =   "Т2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   99
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFLD63 
         BackStyle       =   0  'Transparent
         Caption         =   "Т1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   97
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFLD62 
         BackStyle       =   0  'Transparent
         Caption         =   "Термопреобр ГВС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   95
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFLD61 
         BackStyle       =   0  'Transparent
         Caption         =   "Сут_архив:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   93
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFLD60 
         BackStyle       =   0  'Transparent
         Caption         =   "Часов_архив:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   91
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFLD59 
         BackStyle       =   0  'Transparent
         Caption         =   "Gну:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   89
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFLD58 
         BackStyle       =   0  'Transparent
         Caption         =   "Gв:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   87
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblFLD57 
         BackStyle       =   0  'Transparent
         Caption         =   "Gот:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   85
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFLD56 
         BackStyle       =   0  'Transparent
         Caption         =   "Qну:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   83
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFLD55 
         BackStyle       =   0  'Transparent
         Caption         =   "Qгвс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   81
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFLD54 
         BackStyle       =   0  'Transparent
         Caption         =   "Qв:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   79
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFLD53 
         BackStyle       =   0  'Transparent
         Caption         =   "Qот:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   77
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFLD52 
         BackStyle       =   0  'Transparent
         Caption         =   "Схема:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   75
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFLD51 
         BackStyle       =   0  'Transparent
         Caption         =   "Наименование счетчика:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   73
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFLD50 
         BackStyle       =   0  'Transparent
         Caption         =   "Формула:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   71
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFLD49 
         BackStyle       =   0  'Transparent
         Caption         =   "тип термометра:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   69
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblFLD48 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип расходомера:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   67
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFLD47 
         BackStyle       =   0  'Transparent
         Caption         =   "Теп_камера:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   65
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFLD46 
         BackStyle       =   0  'Transparent
         Caption         =   "Т_график:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   63
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFLD45 
         BackStyle       =   0  'Transparent
         Caption         =   "Способ отбора:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   61
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFLD43 
         BackStyle       =   0  'Transparent
         Caption         =   "Рпр:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   59
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFLD42 
         BackStyle       =   0  'Transparent
         Caption         =   "Робр:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   57
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFLD41 
         BackStyle       =   0  'Transparent
         Caption         =   "Расходомер ГВС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   55
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFLD40 
         BackStyle       =   0  'Transparent
         Caption         =   "Расходомер:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFLD37 
         BackStyle       =   0  'Transparent
         Caption         =   "Магистраль:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblFLD36 
         BackStyle       =   0  'Transparent
         Caption         =   "Источник:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   49
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFLD35 
         BackStyle       =   0  'Transparent
         Caption         =   "Договор G1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFLD34 
         BackStyle       =   0  'Transparent
         Caption         =   "Договор G2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFLD33 
         BackStyle       =   0  'Transparent
         Caption         =   "Договор:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFLD32 
         BackStyle       =   0  'Transparent
         Caption         =   "д20ПР:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   41
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFLD31 
         BackStyle       =   0  'Transparent
         Caption         =   "д20ОБ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   39
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFLD30 
         BackStyle       =   0  'Transparent
         Caption         =   "Gут:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   37
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFLD29 
         BackStyle       =   0  'Transparent
         Caption         =   "GпрПР:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFLD28 
         BackStyle       =   0  'Transparent
         Caption         =   "GпрОБ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblFLD27 
         BackStyle       =   0  'Transparent
         Caption         =   "Gпр_minПР:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFLD26 
         BackStyle       =   0  'Transparent
         Caption         =   "Gпр_minОБ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFLD25 
         BackStyle       =   0  'Transparent
         Caption         =   "Gпр(гвс min):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFLD24 
         BackStyle       =   0  'Transparent
         Caption         =   "Gов:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFLD23 
         BackStyle       =   0  'Transparent
         Caption         =   "Gоб(гвс min):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFLD22 
         BackStyle       =   0  'Transparent
         Caption         =   "Gгвс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFLD21 
         BackStyle       =   0  'Transparent
         Caption         =   "G(гвс)ПР:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFLD20 
         BackStyle       =   0  'Transparent
         Caption         =   "dРпрПР:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFLD19 
         BackStyle       =   0  'Transparent
         Caption         =   "dРпрОБ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblFLD18 
         BackStyle       =   0  'Transparent
         Caption         =   "DyПР:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFLD17 
         BackStyle       =   0  'Transparent
         Caption         =   "DyОБР:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFLD16 
         BackStyle       =   0  'Transparent
         Caption         =   "DyГВС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFLD15 
         BackStyle       =   0  'Transparent
         Caption         =   "D20ПР:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFLD14 
         BackStyle       =   0  'Transparent
         Caption         =   "D20ОБ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFLD13 
         BackStyle       =   0  'Transparent
         Caption         =   "№ключа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFLD12 
         BackStyle       =   0  'Transparent
         Caption         =   "№ прибора:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "CONTRACT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Договорные установки
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
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, Cancel)
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

Private Sub txtFLD12_Change()
  Changing

End Sub
Private Sub txtFLD13_Change()
  Changing

End Sub
Private Sub txtFLD14_Change()
  Changing

End Sub
Private Sub txtFLD15_Change()
  Changing

End Sub
Private Sub txtFLD16_Change()
  Changing

End Sub
Private Sub txtFLD17_Change()
  Changing

End Sub
Private Sub txtFLD18_Change()
  Changing

End Sub
Private Sub txtFLD19_Change()
  Changing

End Sub
Private Sub txtFLD20_Change()
  Changing

End Sub
Private Sub txtFLD21_Change()
  Changing

End Sub
Private Sub txtFLD22_Change()
  Changing

End Sub
Private Sub txtFLD23_Change()
  Changing

End Sub
Private Sub txtFLD24_Change()
  Changing

End Sub
Private Sub txtFLD25_Change()
  Changing

End Sub
Private Sub txtFLD26_Change()
  Changing

End Sub
Private Sub txtFLD27_Change()
  Changing

End Sub
Private Sub txtFLD28_Change()
  Changing

End Sub
Private Sub txtFLD29_Change()
  Changing

End Sub
Private Sub txtFLD30_Change()
  Changing

End Sub
Private Sub txtFLD31_Change()
  Changing

End Sub
Private Sub txtFLD32_Change()
  Changing

End Sub
Private Sub txtFLD33_Change()
  Changing

End Sub
Private Sub txtFLD34_Change()
  Changing

End Sub
Private Sub txtFLD35_Change()
  Changing

End Sub
Private Sub txtFLD36_Change()
  Changing

End Sub
Private Sub txtFLD37_Change()
  Changing

End Sub
Private Sub txtFLD40_Change()
  Changing

End Sub
Private Sub txtFLD41_Change()
  Changing

End Sub
Private Sub txtFLD42_Change()
  Changing

End Sub
Private Sub txtFLD43_Change()
  Changing

End Sub
Private Sub txtFLD45_Change()
  Changing

End Sub
Private Sub txtFLD46_Change()
  Changing

End Sub
Private Sub txtFLD47_Change()
  Changing

End Sub
Private Sub txtFLD48_Change()
  Changing

End Sub
Private Sub txtFLD49_Change()
  Changing

End Sub
Private Sub txtFLD50_Change()
  Changing

End Sub
Private Sub txtFLD51_Change()
  Changing

End Sub
Private Sub txtFLD52_Change()
  Changing

End Sub
Private Sub txtFLD53_Change()
  Changing

End Sub
Private Sub txtFLD54_Change()
  Changing

End Sub
Private Sub txtFLD55_Change()
  Changing

End Sub
Private Sub txtFLD56_Change()
  Changing

End Sub
Private Sub txtFLD57_Change()
  Changing

End Sub
Private Sub txtFLD58_Change()
  Changing

End Sub
Private Sub txtFLD59_Change()
  Changing

End Sub
Private Sub txtFLD60_Change()
  Changing

End Sub
Private Sub txtFLD61_Change()
  Changing

End Sub
Private Sub txtFLD62_Change()
  Changing

End Sub
Private Sub txtFLD63_Change()
  Changing

End Sub
Private Sub txtFLD64_Change()
  Changing

End Sub
Private Sub txtFLD65_Change()
  Changing

End Sub
Private Sub txtFLD66_Change()
  Changing

End Sub
Private Sub txtFLD67_Change()
  Changing

End Sub
Private Sub txtFLD68_Change()
  Changing

End Sub
Private Sub txtFLD69_Change()
  Changing

End Sub
Private Sub txtFLD70_Change()
  Changing

End Sub
Private Sub txtFLD71_Change()
  Changing

End Sub
Private Sub txtFLD72_Change()
  Changing

End Sub
Private Sub txtFLD73_Change()
  Changing

End Sub
Private Sub txtFLD81_Change()
  Changing

End Sub
Private Sub txtFLD82_Change()
  Changing

End Sub
Private Sub txtFLD83_Change()
  Changing

End Sub
Private Sub txtFLD84_Change()
  Changing

End Sub
Private Sub txtFLD85_Change()
  Changing

End Sub
Private Sub txtFLD86_Change()
  Changing

End Sub
Private Sub txtFLD87_Change()
  Changing

End Sub
Private Sub txtFLD88_Change()
  Changing

End Sub
Private Sub txtFLD89_Change()
  Changing

End Sub
Private Sub txtFLD90_Change()
  Changing

End Sub
Private Sub txtFLD92_Change()
  Changing

End Sub
Private Sub txtFLD93_Change()
  Changing

End Sub
Private Sub txtFLD94_Change()
  Changing

End Sub
Private Sub txtFLD95_Change()
  Changing

End Sub
Private Sub txtFLD96_Change()
  Changing

End Sub
Private Sub txtFLD97_Change()
  Changing

End Sub
Private Sub txtFLD98_Change()
  Changing

End Sub
Private Sub txtFLD99_Change()
  Changing

End Sub
Private Sub txtFLD100_Change()
  Changing

End Sub
Private Sub txtFLD101_Change()
  Changing

End Sub
Private Sub txtFLD102_Change()
  Changing

End Sub
Private Sub txtFLD103_Change()
  Changing

End Sub
Private Sub txtFLD104_Change()
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

  On Error Resume Next
txtFLD12 = Item.FLD12
  On Error Resume Next
txtFLD13 = Item.FLD13
  On Error Resume Next
txtFLD14 = Item.FLD14
  On Error Resume Next
txtFLD15 = Item.FLD15
  On Error Resume Next
txtFLD16 = Item.FLD16
  On Error Resume Next
txtFLD17 = Item.FLD17
  On Error Resume Next
txtFLD18 = Item.FLD18
  On Error Resume Next
txtFLD19 = Item.FLD19
  On Error Resume Next
txtFLD20 = Item.FLD20
  On Error Resume Next
txtFLD21 = Item.FLD21
  On Error Resume Next
txtFLD22 = Item.FLD22
  On Error Resume Next
txtFLD23 = Item.FLD23
  On Error Resume Next
txtFLD24 = Item.FLD24
  On Error Resume Next
txtFLD25 = Item.FLD25
  On Error Resume Next
txtFLD26 = Item.FLD26
  On Error Resume Next
txtFLD27 = Item.FLD27
  On Error Resume Next
txtFLD28 = Item.FLD28
  On Error Resume Next
txtFLD29 = Item.FLD29
  On Error Resume Next
txtFLD30 = Item.FLD30
  On Error Resume Next
txtFLD31 = Item.FLD31
  On Error Resume Next
txtFLD32 = Item.FLD32
  On Error Resume Next
txtFLD33 = Item.FLD33
  On Error Resume Next
txtFLD34 = Item.FLD34
  On Error Resume Next
txtFLD35 = Item.FLD35
  On Error Resume Next
txtFLD36 = Item.FLD36
  On Error Resume Next
txtFLD37 = Item.FLD37
  On Error Resume Next
txtFLD40 = Item.FLD40
  On Error Resume Next
txtFLD41 = Item.FLD41
  On Error Resume Next
txtFLD42 = Item.FLD42
  On Error Resume Next
txtFLD43 = Item.FLD43
  On Error Resume Next
txtFLD45 = Item.FLD45
  On Error Resume Next
txtFLD46 = Item.FLD46
  On Error Resume Next
txtFLD47 = Item.FLD47
  On Error Resume Next
txtFLD48 = Item.FLD48
  On Error Resume Next
txtFLD49 = Item.FLD49
  On Error Resume Next
txtFLD50 = Item.FLD50
  On Error Resume Next
txtFLD51 = Item.FLD51
  On Error Resume Next
txtFLD52 = Item.FLD52
  On Error Resume Next
txtFLD53 = Item.FLD53
  On Error Resume Next
txtFLD54 = Item.FLD54
  On Error Resume Next
txtFLD55 = Item.FLD55
  On Error Resume Next
txtFLD56 = Item.FLD56
  On Error Resume Next
txtFLD57 = Item.FLD57
  On Error Resume Next
txtFLD58 = Item.FLD58
  On Error Resume Next
txtFLD59 = Item.FLD59
  On Error Resume Next
txtFLD60 = Item.FLD60
  On Error Resume Next
txtFLD61 = Item.FLD61
  On Error Resume Next
txtFLD62 = Item.FLD62
  On Error Resume Next
txtFLD63 = Item.FLD63
  On Error Resume Next
txtFLD64 = Item.FLD64
  On Error Resume Next
txtFLD65 = Item.FLD65
  On Error Resume Next
txtFLD66 = Item.FLD66
  On Error Resume Next
txtFLD67 = Item.FLD67
  On Error Resume Next
txtFLD68 = Item.FLD68
  On Error Resume Next
txtFLD69 = Item.FLD69
  On Error Resume Next
txtFLD70 = Item.FLD70
  On Error Resume Next
txtFLD71 = Item.FLD71
  On Error Resume Next
txtFLD72 = Item.FLD72
  On Error Resume Next
txtFLD73 = Item.FLD73
  On Error Resume Next
txtFLD81 = Item.FLD81
  On Error Resume Next
txtFLD82 = Item.FLD82
  On Error Resume Next
txtFLD83 = Item.FLD83
  On Error Resume Next
txtFLD84 = Item.FLD84
  On Error Resume Next
txtFLD85 = Item.FLD85
  On Error Resume Next
txtFLD86 = Item.FLD86
  On Error Resume Next
txtFLD87 = Item.FLD87
  On Error Resume Next
txtFLD88 = Item.FLD88
  On Error Resume Next
txtFLD89 = Item.FLD89
  On Error Resume Next
txtFLD90 = Item.FLD90
  On Error Resume Next
txtFLD92 = Item.FLD92
  On Error Resume Next
txtFLD93 = Item.FLD93
  On Error Resume Next
txtFLD94 = Item.FLD94
  On Error Resume Next
txtFLD95 = Item.FLD95
  On Error Resume Next
txtFLD96 = Item.FLD96
  On Error Resume Next
txtFLD97 = Item.FLD97
  On Error Resume Next
txtFLD98 = Item.FLD98
  On Error Resume Next
txtFLD99 = Item.FLD99
  On Error Resume Next
txtFLD100 = Item.FLD100
  On Error Resume Next
txtFLD101 = Item.FLD101
  On Error Resume Next
txtFLD102 = Item.FLD102
  On Error Resume Next
txtFLD103 = Item.FLD103
  On Error Resume Next
txtFLD104 = Item.FLD104
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

Item.FLD12 = txtFLD12
Item.FLD13 = txtFLD13
Item.FLD14 = txtFLD14
Item.FLD15 = txtFLD15
Item.FLD16 = txtFLD16
Item.FLD17 = txtFLD17
Item.FLD18 = txtFLD18
Item.FLD19 = txtFLD19
Item.FLD20 = txtFLD20
Item.FLD21 = txtFLD21
Item.FLD22 = txtFLD22
Item.FLD23 = txtFLD23
Item.FLD24 = txtFLD24
Item.FLD25 = txtFLD25
Item.FLD26 = txtFLD26
Item.FLD27 = txtFLD27
Item.FLD28 = txtFLD28
Item.FLD29 = txtFLD29
Item.FLD30 = txtFLD30
Item.FLD31 = txtFLD31
Item.FLD32 = txtFLD32
Item.FLD33 = txtFLD33
Item.FLD34 = txtFLD34
Item.FLD35 = txtFLD35
Item.FLD36 = txtFLD36
Item.FLD37 = txtFLD37
Item.FLD40 = txtFLD40
Item.FLD41 = txtFLD41
Item.FLD42 = txtFLD42
Item.FLD43 = txtFLD43
Item.FLD45 = txtFLD45
Item.FLD46 = txtFLD46
Item.FLD47 = txtFLD47
Item.FLD48 = txtFLD48
Item.FLD49 = txtFLD49
Item.FLD50 = txtFLD50
Item.FLD51 = txtFLD51
Item.FLD52 = txtFLD52
Item.FLD53 = txtFLD53
Item.FLD54 = txtFLD54
Item.FLD55 = txtFLD55
Item.FLD56 = txtFLD56
Item.FLD57 = txtFLD57
Item.FLD58 = txtFLD58
Item.FLD59 = txtFLD59
Item.FLD60 = txtFLD60
Item.FLD61 = txtFLD61
Item.FLD62 = txtFLD62
Item.FLD63 = txtFLD63
Item.FLD64 = txtFLD64
Item.FLD65 = txtFLD65
Item.FLD66 = txtFLD66
Item.FLD67 = txtFLD67
Item.FLD68 = txtFLD68
Item.FLD69 = txtFLD69
Item.FLD70 = txtFLD70
Item.FLD71 = txtFLD71
Item.FLD72 = txtFLD72
Item.FLD73 = txtFLD73
Item.FLD81 = txtFLD81
Item.FLD82 = txtFLD82
Item.FLD83 = txtFLD83
Item.FLD84 = txtFLD84
Item.FLD85 = txtFLD85
Item.FLD86 = txtFLD86
Item.FLD87 = txtFLD87
Item.FLD88 = txtFLD88
Item.FLD89 = txtFLD89
Item.FLD90 = txtFLD90
Item.FLD92 = txtFLD92
Item.FLD93 = txtFLD93
Item.FLD94 = txtFLD94
Item.FLD95 = txtFLD95
Item.FLD96 = txtFLD96
Item.FLD97 = txtFLD97
Item.FLD98 = txtFLD98
Item.FLD99 = txtFLD99
Item.FLD100 = txtFLD100
Item.FLD101 = txtFLD101
Item.FLD102 = txtFLD102
Item.FLD103 = txtFLD103
Item.FLD104 = txtFLD104
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



