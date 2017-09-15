VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl TP_ZayvVipol 
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
      Begin VB.TextBox txtKomment 
         Enabled         =   0   'False
         Height          =   300
         Left            =   16050
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   110
         ToolTipText     =   "Комментарии"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.ComboBox cmbVklVReestr 
         Height          =   315
         Left            =   16050
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   108
         ToolTipText     =   "Включена в реестр оплаты"
         Top             =   405
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataInstall 
         Height          =   300
         Left            =   12900
         TabIndex        =   106
         ToolTipText     =   "Дата инсталяции"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   90767363
         CurrentDate     =   39784
      End
      Begin VB.TextBox txtFIOdogovor 
         Enabled         =   0   'False
         Height          =   300
         Left            =   12900
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   104
         ToolTipText     =   "ФИО в договоре"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtOpisProblem 
         Enabled         =   0   'False
         Height          =   300
         Left            =   12900
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   102
         ToolTipText     =   "Описание проблемы"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.ComboBox cmbOtkaz 
         Enabled         =   0   'False
         Height          =   315
         Left            =   12900
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   100
         ToolTipText     =   "Отказ"
         Top             =   3930
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataSZT 
         Height          =   300
         Left            =   12900
         TabIndex        =   98
         ToolTipText     =   "Дата передачи в СЗТ"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   90767363
         CurrentDate     =   39784
      End
      Begin VB.ComboBox cmbDocPolych 
         Height          =   315
         Left            =   12900
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   96
         ToolTipText     =   "Документы получены"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdIngener 
         Height          =   300
         Left            =   15450
         TabIndex        =   94
         Tag             =   "refopen.ico"
         ToolTipText     =   "Инженер"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtIngener 
         Enabled         =   0   'False
         Height          =   300
         Left            =   12900
         Locked          =   -1  'True
         TabIndex        =   93
         ToolTipText     =   "Инженер"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdKoord 
         Height          =   300
         Left            =   15450
         TabIndex        =   91
         Tag             =   "refopen.ico"
         ToolTipText     =   "Координатор"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtKoord 
         Enabled         =   0   'False
         Height          =   300
         Left            =   12900
         Locked          =   -1  'True
         TabIndex        =   90
         ToolTipText     =   "Координатор"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdDisp 
         Height          =   300
         Left            =   15450
         TabIndex        =   88
         Tag             =   "refopen.ico"
         ToolTipText     =   "Диспетчер"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtDisp 
         Enabled         =   0   'False
         Height          =   300
         Left            =   12900
         Locked          =   -1  'True
         TabIndex        =   87
         ToolTipText     =   "Диспетчер"
         Top             =   405
         Width           =   2550
      End
      Begin VB.TextBox txtRayon 
         Enabled         =   0   'False
         Height          =   300
         Left            =   9750
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   85
         ToolTipText     =   "Район"
         Top             =   6045
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPaketYsl 
         Height          =   300
         Left            =   12300
         TabIndex        =   83
         Tag             =   "refopen.ico"
         ToolTipText     =   "Пакет услуг"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtPaketYsl 
         Enabled         =   0   'False
         Height          =   300
         Left            =   9750
         Locked          =   -1  'True
         TabIndex        =   82
         ToolTipText     =   "Пакет услуг"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTipSignalizazii 
         Height          =   300
         Left            =   12300
         TabIndex        =   80
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип сигнализации"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTipSignalizazii 
         Enabled         =   0   'False
         Height          =   300
         Left            =   9750
         Locked          =   -1  'True
         TabIndex        =   79
         ToolTipText     =   "Тип сигнализации"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.ComboBox cmbNalichSignalizazii 
         Enabled         =   0   'False
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   77
         ToolTipText     =   "Наличие сигнализации"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdSrochDogovor 
         Height          =   300
         Left            =   12300
         TabIndex        =   75
         Tag             =   "refopen.ico"
         ToolTipText     =   "Срочный доровор"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtSrochDogovor 
         Enabled         =   0   'False
         Height          =   300
         Left            =   9750
         Locked          =   -1  'True
         TabIndex        =   74
         ToolTipText     =   "Срочный доровор"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.TextBox txtSerNomModem 
         Enabled         =   0   'False
         Height          =   300
         Left            =   9750
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   72
         ToolTipText     =   "Серийный номер модема"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdEstAVYorBLOK 
         Height          =   300
         Left            =   12300
         TabIndex        =   70
         Tag             =   "refopen.ico"
         ToolTipText     =   "Есть ли АВУ или блокиратор"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtEstAVYorBLOK 
         Enabled         =   0   'False
         Height          =   300
         Left            =   9750
         Locked          =   -1  'True
         TabIndex        =   69
         ToolTipText     =   "Есть ли АВУ или блокиратор"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.ComboBox cmbYslygiInformSpravSlygb 
         Enabled         =   0   'False
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   67
         ToolTipText     =   "Услуги информ-справ. служб"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.ComboBox cmbDVO 
         Enabled         =   0   'False
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   65
         ToolTipText     =   "ДВО"
         Top             =   405
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdViborOperat 
         Height          =   300
         Left            =   9150
         TabIndex        =   63
         Tag             =   "refopen.ico"
         ToolTipText     =   "Выбор оператора"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtViborOperat 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   62
         ToolTipText     =   "Выбор оператора"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.ComboBox cmbMGMNTelSviaz 
         Enabled         =   0   'False
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   60
         ToolTipText     =   "МГ, МН Телефонная связь"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.ComboBox cmbVnytriZonovajaTLF 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   58
         ToolTipText     =   "Внутризоновая ТЛФ"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtPodborNomerTLF 
         Height          =   300
         Left            =   6600
         MaxLength       =   100
         TabIndex        =   56
         ToolTipText     =   "Подбор номера ТЛФ"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTarifPlanTLF 
         Height          =   300
         Left            =   9150
         TabIndex        =   54
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тарифный план ТЛФ"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTarifPlanTLF 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   53
         ToolTipText     =   "Тарифный план ТЛФ"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.TextBox txtNomerZayavSYZIZ 
         Height          =   300
         Left            =   6600
         MaxLength       =   100
         TabIndex        =   51
         ToolTipText     =   "Номер заявки СУЗИЗ"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbPaketFootball 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   49
         ToolTipText     =   "Пакет """"футбол"""" "
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbPaketVzroslieIstorii 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   47
         ToolTipText     =   "Пакет """"взрослые истории"""""
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTarifPlanZFTV 
         Height          =   300
         Left            =   9150
         TabIndex        =   45
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тарифный план ЦФТВ"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTarifPlanZFTV 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   44
         ToolTipText     =   "Тарифный план ЦФТВ"
         Top             =   405
         Width           =   2550
      End
      Begin VB.TextBox txtFiksIPZnach 
         Height          =   300
         Left            =   3450
         MaxLength       =   100
         TabIndex        =   42
         ToolTipText     =   "Фикс. IP Значение"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.ComboBox cmbFiksirIP 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   40
         ToolTipText     =   "Фиксированный IP"
         Top             =   5340
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTarifPlan 
         Height          =   300
         Left            =   6000
         TabIndex        =   38
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тарифный план"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTarifPlan 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   37
         ToolTipText     =   "Тарифный план"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTipModemaADSL 
         Height          =   300
         Left            =   6000
         TabIndex        =   35
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип модема ADSL"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTipModemaADSL 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   34
         ToolTipText     =   "Тип модема ADSL"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdMetro 
         Height          =   300
         Left            =   6000
         TabIndex        =   32
         Tag             =   "refopen.ico"
         ToolTipText     =   "Метро"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMetro 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   31
         ToolTipText     =   "Метро"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdGelVREMJA 
         Height          =   300
         Left            =   6000
         TabIndex        =   29
         Tag             =   "refopen.ico"
         ToolTipText     =   "Желаемое время визита инсталятора"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtGelVREMJA 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   28
         ToolTipText     =   "Желаемое время визита инсталятора"
         Top             =   2520
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpGelDATA 
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         ToolTipText     =   "Желаемая дата визита инсталятора"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   90767363
         CurrentDate     =   39784
      End
      Begin VB.TextBox txtVremjaDljaSvjazi 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   24
         ToolTipText     =   "Время для связи"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtKontTELEFON 
         Height          =   300
         Left            =   3450
         MaxLength       =   100
         TabIndex        =   22
         ToolTipText     =   "Контактный телефон"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtKontEMAIL 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   20
         ToolTipText     =   "Контактный e-mail"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtKontLIZO 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   18
         ToolTipText     =   "Контактное лицо"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtKodPorta 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   16
         ToolTipText     =   "Код порта"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtAdres 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   14
         ToolTipText     =   "Адрес"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFIO 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   12
         ToolTipText     =   "ФИО"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTipKlient 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип клиента"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTipKlient 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Тип клиента"
         Top             =   2520
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpData 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Дата и время подачи заявки"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   90767363
         CurrentDate     =   39784
      End
      Begin MTZ_PANEL.DropButton cmdTipZayav 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип заявки"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTipZayav 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Тип заявки"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtNomerZayav 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер заявки"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblKomment 
         BackStyle       =   0  'Transparent
         Caption         =   "Комментарии:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   109
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblVklVReestr 
         BackStyle       =   0  'Transparent
         Caption         =   "Включена в реестр оплаты:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   16050
         TabIndex        =   107
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblDataInstall 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата инсталяции:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   105
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFIOdogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "ФИО в договоре:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   103
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblOpisProblem 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание проблемы:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   101
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblOtkaz 
         BackStyle       =   0  'Transparent
         Caption         =   "Отказ:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   99
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDataSZT 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата передачи в СЗТ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   97
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblDocPolych 
         BackStyle       =   0  'Transparent
         Caption         =   "Документы получены:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   95
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblIngener 
         BackStyle       =   0  'Transparent
         Caption         =   "Инженер:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   92
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblKoord 
         BackStyle       =   0  'Transparent
         Caption         =   "Координатор:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   89
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDisp 
         BackStyle       =   0  'Transparent
         Caption         =   "Диспетчер:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   86
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblRayon 
         BackStyle       =   0  'Transparent
         Caption         =   "Район:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   84
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblPaketYsl 
         BackStyle       =   0  'Transparent
         Caption         =   "Пакет услуг:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   81
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblTipSignalizazii 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип сигнализации:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   78
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblNalichSignalizazii 
         BackStyle       =   0  'Transparent
         Caption         =   "Наличие сигнализации:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   76
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblSrochDogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "Срочный доровор:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   73
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblSerNomModem 
         BackStyle       =   0  'Transparent
         Caption         =   "Серийный номер модема:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   71
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblEstAVYorBLOK 
         BackStyle       =   0  'Transparent
         Caption         =   "Есть ли АВУ или блокиратор:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   68
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblYslygiInformSpravSlygb 
         BackStyle       =   0  'Transparent
         Caption         =   "Услуги информ-справ. служб:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   66
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDVO 
         BackStyle       =   0  'Transparent
         Caption         =   "ДВО:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   64
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblViborOperat 
         BackStyle       =   0  'Transparent
         Caption         =   "Выбор оператора:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   61
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblMGMNTelSviaz 
         BackStyle       =   0  'Transparent
         Caption         =   "МГ, МН Телефонная связь:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   59
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblVnytriZonovajaTLF 
         BackStyle       =   0  'Transparent
         Caption         =   "Внутризоновая ТЛФ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   57
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblPodborNomerTLF 
         BackStyle       =   0  'Transparent
         Caption         =   "Подбор номера ТЛФ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   55
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTarifPlanTLF 
         BackStyle       =   0  'Transparent
         Caption         =   "Тарифный план ТЛФ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   52
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblNomerZayavSYZIZ 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер заявки СУЗИЗ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   50
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPaketFootball 
         BackStyle       =   0  'Transparent
         Caption         =   "Пакет """"футбол"""" :"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPaketVzroslieIstorii 
         BackStyle       =   0  'Transparent
         Caption         =   "Пакет """"взрослые истории"""":"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTarifPlanZFTV 
         BackStyle       =   0  'Transparent
         Caption         =   "Тарифный план ЦФТВ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFiksIPZnach 
         BackStyle       =   0  'Transparent
         Caption         =   "Фикс. IP Значение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   41
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFiksirIP 
         BackStyle       =   0  'Transparent
         Caption         =   "Фиксированный IP:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblTarifPlan 
         BackStyle       =   0  'Transparent
         Caption         =   "Тарифный план:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTipModemaADSL 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип модема ADSL:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblMetro 
         BackStyle       =   0  'Transparent
         Caption         =   "Метро:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblGelVREMJA 
         BackStyle       =   0  'Transparent
         Caption         =   "Желаемое время визита инсталятора:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblGelDATA 
         BackStyle       =   0  'Transparent
         Caption         =   "Желаемая дата визита инсталятора:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblVremjaDljaSvjazi 
         BackStyle       =   0  'Transparent
         Caption         =   "Время для связи:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblKontTELEFON 
         BackStyle       =   0  'Transparent
         Caption         =   "Контактный телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblKontEMAIL 
         BackStyle       =   0  'Transparent
         Caption         =   "Контактный e-mail:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblKontLIZO 
         BackStyle       =   0  'Transparent
         Caption         =   "Контактное лицо:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblKodPorta 
         BackStyle       =   0  'Transparent
         Caption         =   "Код порта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblAdres 
         BackStyle       =   0  'Transparent
         Caption         =   "Адрес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFIO 
         BackStyle       =   0  'Transparent
         Caption         =   "ФИО:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTipKlient 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип клиента:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblData 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата и время подачи заявки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTipZayav 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип заявки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblNomerZayav 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер заявки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "TP_ZayvVipol"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True


   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, cancel)
bye:
findObject = result
End Function
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtNomerZayav_Validate(cancel As Boolean)
If txtNomerZayav.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNomerZayav.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtNomerZayav.SetFocus
  ElseIf Val(txtNomerZayav.Text) <> CLng(Val(txtNomerZayav.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtNomerZayav.SetFocus
  End If
End If
End Sub
Private Sub txtNomerZayav_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNomerZayav_Change()
  Changing

End Sub
Private Sub txtTipZayav_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTipZayav_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Tzay", ID, brief) Then
          txtTipZayav.Tag = Left(ID, 38)
          txtTipZayav = brief
        End If
End Sub
Private Sub cmdTipZayav_MenuClick(ByVal sCaption As String)
          txtTipZayav.Tag = ""
          txtTipZayav = ""
End Sub
Private Sub dtpData_Change()
  Changing

End Sub
Private Sub txtTipKlient_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTipKlient_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_tklient", ID, brief) Then
          txtTipKlient.Tag = Left(ID, 38)
          txtTipKlient = brief
        End If
End Sub
Private Sub cmdTipKlient_MenuClick(ByVal sCaption As String)
          txtTipKlient.Tag = ""
          txtTipKlient = ""
End Sub
Private Sub txtFIO_Change()
  Changing

End Sub
Private Sub txtAdres_Change()
  Changing

End Sub
Private Sub txtKodPorta_Change()
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
Private Sub dtpGelDATA_Change()
  Changing

End Sub
Private Sub txtGelVREMJA_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdGelVREMJA_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_VrVisInst", ID, brief) Then
          txtGelVREMJA.Tag = Left(ID, 38)
          txtGelVREMJA = brief
        End If
End Sub
Private Sub cmdGelVREMJA_MenuClick(ByVal sCaption As String)
          txtGelVREMJA.Tag = ""
          txtGelVREMJA = ""
End Sub
Private Sub txtMetro_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdMetro_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Metro", ID, brief) Then
          txtMetro.Tag = Left(ID, 38)
          txtMetro = brief
        End If
End Sub
Private Sub cmdMetro_MenuClick(ByVal sCaption As String)
          txtMetro.Tag = ""
          txtMetro = ""
End Sub
Private Sub txtTipModemaADSL_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTipModemaADSL_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_TipModADSL", ID, brief) Then
          txtTipModemaADSL.Tag = Left(ID, 38)
          txtTipModemaADSL = brief
        End If
End Sub
Private Sub cmdTipModemaADSL_MenuClick(ByVal sCaption As String)
          txtTipModemaADSL.Tag = ""
          txtTipModemaADSL = ""
End Sub
Private Sub txtTarifPlan_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTarifPlan_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Tarplan", ID, brief) Then
          txtTarifPlan.Tag = Left(ID, 38)
          txtTarifPlan = brief
        End If
End Sub
Private Sub cmdTarifPlan_MenuClick(ByVal sCaption As String)
          txtTarifPlan.Tag = ""
          txtTarifPlan = ""
End Sub
Private Sub cmbFiksirIP_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtFiksIPZnach_Change()
  Changing

End Sub
Private Sub txtTarifPlanZFTV_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTarifPlanZFTV_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spt_TarplanZFTV", ID, brief) Then
          txtTarifPlanZFTV.Tag = Left(ID, 38)
          txtTarifPlanZFTV = brief
        End If
End Sub
Private Sub cmdTarifPlanZFTV_MenuClick(ByVal sCaption As String)
          txtTarifPlanZFTV.Tag = ""
          txtTarifPlanZFTV = ""
End Sub
Private Sub cmbPaketVzroslieIstorii_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbPaketFootball_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtNomerZayavSYZIZ_Change()
  Changing

End Sub
Private Sub txtTarifPlanTLF_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTarifPlanTLF_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_TarplanTLF", ID, brief) Then
          txtTarifPlanTLF.Tag = Left(ID, 38)
          txtTarifPlanTLF = brief
        End If
End Sub
Private Sub cmdTarifPlanTLF_MenuClick(ByVal sCaption As String)
          txtTarifPlanTLF.Tag = ""
          txtTarifPlanTLF = ""
End Sub
Private Sub txtPodborNomerTLF_Change()
  Changing

End Sub
Private Sub cmbVnytriZonovajaTLF_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbMGMNTelSviaz_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtViborOperat_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdViborOperat_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdViborOperat_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmbDVO_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbYslygiInformSpravSlygb_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtEstAVYorBLOK_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdEstAVYorBLOK_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdEstAVYorBLOK_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtSerNomModem_Change()
  Changing

End Sub
Private Sub txtSrochDogovor_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSrochDogovor_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdSrochDogovor_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmbNalichSignalizazii_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtTipSignalizazii_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTipSignalizazii_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdTipSignalizazii_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtPaketYsl_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPaketYsl_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdPaketYsl_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtRayon_Change()
  Changing

End Sub
Private Sub txtDisp_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDisp_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdDisp_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtKoord_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdKoord_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdKoord_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtIngener_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdIngener_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdIngener_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmbDocPolych_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub dtpDataSZT_Change()
  Changing

End Sub
Private Sub cmbOtkaz_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtOpisProblem_Change()
  Changing

End Sub
Private Sub txtFIOdogovor_Change()
  Changing

End Sub
Private Sub dtpDataInstall_Change()
  Changing

End Sub
Private Sub cmbVklVReestr_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtKomment_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtNomerZayav.Text)
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
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

txtNomerZayav = Item.NomerZayav
If Not Item.TipZayav Is Nothing Then
  txtTipZayav.Tag = Item.TipZayav.ID
  txtTipZayav = Item.TipZayav.brief
Else
  txtTipZayav.Tag = ""
  txtTipZayav = ""
End If
 LoadBtnPictures cmdTipZayav, cmdTipZayav.Tag
  cmdTipZayav.RemoveAllMenu
  cmdTipZayav.AddMenu "Очистить"
dtpData = Now
If Item.Data <> 0 Then
 dtpData = Item.Data
Else
 dtpData.Value = Null
End If
If Not Item.TipKlient Is Nothing Then
  txtTipKlient.Tag = Item.TipKlient.ID
  txtTipKlient = Item.TipKlient.brief
Else
  txtTipKlient.Tag = ""
  txtTipKlient = ""
End If
 LoadBtnPictures cmdTipKlient, cmdTipKlient.Tag
  cmdTipKlient.RemoveAllMenu
  cmdTipKlient.AddMenu "Очистить"
  On Error Resume Next
txtFIO = Item.FIO
  On Error Resume Next
txtAdres = Item.Adres
  On Error Resume Next
txtKodPorta = Item.KodPorta
  On Error Resume Next
txtKontLIZO = Item.KontLIZO
  On Error Resume Next
txtKontEMAIL = Item.KontEMAIL
  On Error Resume Next
txtKontTELEFON = Item.KontTELEFON
  On Error Resume Next
txtVremjaDljaSvjazi = Item.VremjaDljaSvjazi
dtpGelDATA = Date
If Item.GelDATA <> 0 Then
 dtpGelDATA = Item.GelDATA
Else
 dtpGelDATA.Value = Null
End If
If Not Item.GelVREMJA Is Nothing Then
  txtGelVREMJA.Tag = Item.GelVREMJA.ID
  txtGelVREMJA = Item.GelVREMJA.brief
Else
  txtGelVREMJA.Tag = ""
  txtGelVREMJA = ""
End If
 LoadBtnPictures cmdGelVREMJA, cmdGelVREMJA.Tag
  cmdGelVREMJA.RemoveAllMenu
  cmdGelVREMJA.AddMenu "Очистить"
If Not Item.Metro Is Nothing Then
  txtMetro.Tag = Item.Metro.ID
  txtMetro = Item.Metro.brief
Else
  txtMetro.Tag = ""
  txtMetro = ""
End If
 LoadBtnPictures cmdMetro, cmdMetro.Tag
  cmdMetro.RemoveAllMenu
  cmdMetro.AddMenu "Очистить"
If Not Item.TipModemaADSL Is Nothing Then
  txtTipModemaADSL.Tag = Item.TipModemaADSL.ID
  txtTipModemaADSL = Item.TipModemaADSL.brief
Else
  txtTipModemaADSL.Tag = ""
  txtTipModemaADSL = ""
End If
 LoadBtnPictures cmdTipModemaADSL, cmdTipModemaADSL.Tag
  cmdTipModemaADSL.RemoveAllMenu
  cmdTipModemaADSL.AddMenu "Очистить"
If Not Item.TarifPlan Is Nothing Then
  txtTarifPlan.Tag = Item.TarifPlan.ID
  txtTarifPlan = Item.TarifPlan.brief
Else
  txtTarifPlan.Tag = ""
  txtTarifPlan = ""
End If
 LoadBtnPictures cmdTarifPlan, cmdTarifPlan.Tag
  cmdTarifPlan.RemoveAllMenu
  cmdTarifPlan.AddMenu "Очистить"
cmbFiksirIP.Clear
cmbFiksirIP.AddItem "Да"
cmbFiksirIP.ItemData(cmbFiksirIP.NewIndex) = -1
cmbFiksirIP.AddItem "Нет"
cmbFiksirIP.ItemData(cmbFiksirIP.NewIndex) = 0
 For iii = 0 To cmbFiksirIP.ListCount - 1
  If Item.FiksirIP = cmbFiksirIP.ItemData(iii) Then
   cmbFiksirIP.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtFiksIPZnach = Item.FiksIPZnach
If Not Item.TarifPlanZFTV Is Nothing Then
  txtTarifPlanZFTV.Tag = Item.TarifPlanZFTV.ID
  txtTarifPlanZFTV = Item.TarifPlanZFTV.brief
Else
  txtTarifPlanZFTV.Tag = ""
  txtTarifPlanZFTV = ""
End If
 LoadBtnPictures cmdTarifPlanZFTV, cmdTarifPlanZFTV.Tag
  cmdTarifPlanZFTV.RemoveAllMenu
  cmdTarifPlanZFTV.AddMenu "Очистить"
cmbPaketVzroslieIstorii.Clear
cmbPaketVzroslieIstorii.AddItem "Да"
cmbPaketVzroslieIstorii.ItemData(cmbPaketVzroslieIstorii.NewIndex) = -1
cmbPaketVzroslieIstorii.AddItem "Нет"
cmbPaketVzroslieIstorii.ItemData(cmbPaketVzroslieIstorii.NewIndex) = 0
 For iii = 0 To cmbPaketVzroslieIstorii.ListCount - 1
  If Item.PaketVzroslieIstorii = cmbPaketVzroslieIstorii.ItemData(iii) Then
   cmbPaketVzroslieIstorii.ListIndex = iii
   Exit For
  End If
 Next
cmbPaketFootball.Clear
cmbPaketFootball.AddItem "Да"
cmbPaketFootball.ItemData(cmbPaketFootball.NewIndex) = -1
cmbPaketFootball.AddItem "Нет"
cmbPaketFootball.ItemData(cmbPaketFootball.NewIndex) = 0
 For iii = 0 To cmbPaketFootball.ListCount - 1
  If Item.PaketFootball = cmbPaketFootball.ItemData(iii) Then
   cmbPaketFootball.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtNomerZayavSYZIZ = Item.NomerZayavSYZIZ
If Not Item.TarifPlanTLF Is Nothing Then
  txtTarifPlanTLF.Tag = Item.TarifPlanTLF.ID
  txtTarifPlanTLF = Item.TarifPlanTLF.brief
Else
  txtTarifPlanTLF.Tag = ""
  txtTarifPlanTLF = ""
End If
 LoadBtnPictures cmdTarifPlanTLF, cmdTarifPlanTLF.Tag
  cmdTarifPlanTLF.RemoveAllMenu
  cmdTarifPlanTLF.AddMenu "Очистить"
  On Error Resume Next
txtPodborNomerTLF = Item.PodborNomerTLF
cmbVnytriZonovajaTLF.Clear
cmbVnytriZonovajaTLF.AddItem "Да"
cmbVnytriZonovajaTLF.ItemData(cmbVnytriZonovajaTLF.NewIndex) = -1
cmbVnytriZonovajaTLF.AddItem "Нет"
cmbVnytriZonovajaTLF.ItemData(cmbVnytriZonovajaTLF.NewIndex) = 0
 For iii = 0 To cmbVnytriZonovajaTLF.ListCount - 1
  If Item.VnytriZonovajaTLF = cmbVnytriZonovajaTLF.ItemData(iii) Then
   cmbVnytriZonovajaTLF.ListIndex = iii
   Exit For
  End If
 Next
cmbMGMNTelSviaz.Clear
cmbMGMNTelSviaz.AddItem "Да"
cmbMGMNTelSviaz.ItemData(cmbMGMNTelSviaz.NewIndex) = -1
cmbMGMNTelSviaz.AddItem "Нет"
cmbMGMNTelSviaz.ItemData(cmbMGMNTelSviaz.NewIndex) = 0
 For iii = 0 To cmbMGMNTelSviaz.ListCount - 1
  If Item.MGMNTelSviaz = cmbMGMNTelSviaz.ItemData(iii) Then
   cmbMGMNTelSviaz.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.ViborOperat Is Nothing Then
  txtViborOperat.Tag = Item.ViborOperat.ID
  txtViborOperat = Item.ViborOperat.brief
Else
  txtViborOperat.Tag = ""
  txtViborOperat = ""
End If
 LoadBtnPictures cmdViborOperat, cmdViborOperat.Tag
  cmdViborOperat.RemoveAllMenu
  cmdViborOperat.AddMenu "Очистить"
cmbDVO.Clear
cmbDVO.AddItem "Да"
cmbDVO.ItemData(cmbDVO.NewIndex) = -1
cmbDVO.AddItem "Нет"
cmbDVO.ItemData(cmbDVO.NewIndex) = 0
 For iii = 0 To cmbDVO.ListCount - 1
  If Item.DVO = cmbDVO.ItemData(iii) Then
   cmbDVO.ListIndex = iii
   Exit For
  End If
 Next
cmbYslygiInformSpravSlygb.Clear
cmbYslygiInformSpravSlygb.AddItem "Да"
cmbYslygiInformSpravSlygb.ItemData(cmbYslygiInformSpravSlygb.NewIndex) = -1
cmbYslygiInformSpravSlygb.AddItem "Нет"
cmbYslygiInformSpravSlygb.ItemData(cmbYslygiInformSpravSlygb.NewIndex) = 0
 For iii = 0 To cmbYslygiInformSpravSlygb.ListCount - 1
  If Item.YslygiInformSpravSlygb = cmbYslygiInformSpravSlygb.ItemData(iii) Then
   cmbYslygiInformSpravSlygb.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.EstAVYorBLOK Is Nothing Then
  txtEstAVYorBLOK.Tag = Item.EstAVYorBLOK.ID
  txtEstAVYorBLOK = Item.EstAVYorBLOK.brief
Else
  txtEstAVYorBLOK.Tag = ""
  txtEstAVYorBLOK = ""
End If
 LoadBtnPictures cmdEstAVYorBLOK, cmdEstAVYorBLOK.Tag
  cmdEstAVYorBLOK.RemoveAllMenu
  cmdEstAVYorBLOK.AddMenu "Очистить"
  On Error Resume Next
txtSerNomModem = Item.SerNomModem
If Not Item.SrochDogovor Is Nothing Then
  txtSrochDogovor.Tag = Item.SrochDogovor.ID
  txtSrochDogovor = Item.SrochDogovor.brief
Else
  txtSrochDogovor.Tag = ""
  txtSrochDogovor = ""
End If
 LoadBtnPictures cmdSrochDogovor, cmdSrochDogovor.Tag
  cmdSrochDogovor.RemoveAllMenu
  cmdSrochDogovor.AddMenu "Очистить"
cmbNalichSignalizazii.Clear
cmbNalichSignalizazii.AddItem "Да"
cmbNalichSignalizazii.ItemData(cmbNalichSignalizazii.NewIndex) = -1
cmbNalichSignalizazii.AddItem "Нет"
cmbNalichSignalizazii.ItemData(cmbNalichSignalizazii.NewIndex) = 0
 For iii = 0 To cmbNalichSignalizazii.ListCount - 1
  If Item.NalichSignalizazii = cmbNalichSignalizazii.ItemData(iii) Then
   cmbNalichSignalizazii.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.TipSignalizazii Is Nothing Then
  txtTipSignalizazii.Tag = Item.TipSignalizazii.ID
  txtTipSignalizazii = Item.TipSignalizazii.brief
Else
  txtTipSignalizazii.Tag = ""
  txtTipSignalizazii = ""
End If
 LoadBtnPictures cmdTipSignalizazii, cmdTipSignalizazii.Tag
  cmdTipSignalizazii.RemoveAllMenu
  cmdTipSignalizazii.AddMenu "Очистить"
If Not Item.PaketYsl Is Nothing Then
  txtPaketYsl.Tag = Item.PaketYsl.ID
  txtPaketYsl = Item.PaketYsl.brief
Else
  txtPaketYsl.Tag = ""
  txtPaketYsl = ""
End If
 LoadBtnPictures cmdPaketYsl, cmdPaketYsl.Tag
  cmdPaketYsl.RemoveAllMenu
  cmdPaketYsl.AddMenu "Очистить"
  On Error Resume Next
txtRayon = Item.Rayon
If Not Item.Disp Is Nothing Then
  txtDisp.Tag = Item.Disp.ID
  txtDisp = Item.Disp.brief
Else
  txtDisp.Tag = ""
  txtDisp = ""
End If
 LoadBtnPictures cmdDisp, cmdDisp.Tag
  cmdDisp.RemoveAllMenu
  cmdDisp.AddMenu "Очистить"
If Not Item.Koord Is Nothing Then
  txtKoord.Tag = Item.Koord.ID
  txtKoord = Item.Koord.brief
Else
  txtKoord.Tag = ""
  txtKoord = ""
End If
 LoadBtnPictures cmdKoord, cmdKoord.Tag
  cmdKoord.RemoveAllMenu
  cmdKoord.AddMenu "Очистить"
If Not Item.Ingener Is Nothing Then
  txtIngener.Tag = Item.Ingener.ID
  txtIngener = Item.Ingener.brief
Else
  txtIngener.Tag = ""
  txtIngener = ""
End If
 LoadBtnPictures cmdIngener, cmdIngener.Tag
  cmdIngener.RemoveAllMenu
  cmdIngener.AddMenu "Очистить"
cmbDocPolych.Clear
cmbDocPolych.AddItem "Да"
cmbDocPolych.ItemData(cmbDocPolych.NewIndex) = -1
cmbDocPolych.AddItem "Нет"
cmbDocPolych.ItemData(cmbDocPolych.NewIndex) = 0
 For iii = 0 To cmbDocPolych.ListCount - 1
  If Item.DocPolych = cmbDocPolych.ItemData(iii) Then
   cmbDocPolych.ListIndex = iii
   Exit For
  End If
 Next
dtpDataSZT = Date
If Item.DataSZT <> 0 Then
 dtpDataSZT = Item.DataSZT
Else
 dtpDataSZT.Value = Null
End If
cmbOtkaz.Clear
cmbOtkaz.AddItem "Да"
cmbOtkaz.ItemData(cmbOtkaz.NewIndex) = -1
cmbOtkaz.AddItem "Нет"
cmbOtkaz.ItemData(cmbOtkaz.NewIndex) = 0
 For iii = 0 To cmbOtkaz.ListCount - 1
  If Item.Otkaz = cmbOtkaz.ItemData(iii) Then
   cmbOtkaz.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtOpisProblem = Item.OpisProblem
  On Error Resume Next
txtFIOdogovor = Item.FIOdogovor
dtpDataInstall = Date
If Item.DataInstall <> 0 Then
 dtpDataInstall = Item.DataInstall
Else
 dtpDataInstall.Value = Null
End If
cmbVklVReestr.Clear
cmbVklVReestr.AddItem "Да"
cmbVklVReestr.ItemData(cmbVklVReestr.NewIndex) = -1
cmbVklVReestr.AddItem "Нет"
cmbVklVReestr.ItemData(cmbVklVReestr.NewIndex) = 0
 For iii = 0 To cmbVklVReestr.ListCount - 1
  If Item.VklVReestr = cmbVklVReestr.ItemData(iii) Then
   cmbVklVReestr.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtKomment = Item.Komment
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

Item.NomerZayav = CDbl(txtNomerZayav)
If txtTipZayav.Tag <> "" Then
  Set Item.TipZayav = Item.Application.FindRowObject("TP_Spr_Tzay", txtTipZayav.Tag)
Else
  Set Item.TipZayav = Nothing
End If
  If IsNull(dtpData) Then
    Item.Data = 0
  Else
    Item.Data = dtpData.Value
  End If
If txtTipKlient.Tag <> "" Then
  Set Item.TipKlient = Item.Application.FindRowObject("TP_Spr_tklient", txtTipKlient.Tag)
Else
  Set Item.TipKlient = Nothing
End If
Item.FIO = txtFIO
Item.Adres = txtAdres
Item.KodPorta = txtKodPorta
Item.KontLIZO = txtKontLIZO
Item.KontEMAIL = txtKontEMAIL
Item.KontTELEFON = txtKontTELEFON
Item.VremjaDljaSvjazi = txtVremjaDljaSvjazi
  If IsNull(dtpGelDATA) Then
    Item.GelDATA = 0
  Else
    Item.GelDATA = dtpGelDATA.Value
  End If
If txtGelVREMJA.Tag <> "" Then
  Set Item.GelVREMJA = Item.Application.FindRowObject("TP_Spr_VrVisInst", txtGelVREMJA.Tag)
Else
  Set Item.GelVREMJA = Nothing
End If
If txtMetro.Tag <> "" Then
  Set Item.Metro = Item.Application.FindRowObject("TP_Spr_Metro", txtMetro.Tag)
Else
  Set Item.Metro = Nothing
End If
If txtTipModemaADSL.Tag <> "" Then
  Set Item.TipModemaADSL = Item.Application.FindRowObject("TP_Spr_TipModADSL", txtTipModemaADSL.Tag)
Else
  Set Item.TipModemaADSL = Nothing
End If
If txtTarifPlan.Tag <> "" Then
  Set Item.TarifPlan = Item.Application.FindRowObject("TP_Spr_Tarplan", txtTarifPlan.Tag)
Else
  Set Item.TarifPlan = Nothing
End If
 If cmbFiksirIP.ListIndex >= 0 Then
   Item.FiksirIP = cmbFiksirIP.ItemData(cmbFiksirIP.ListIndex)
 End If
Item.FiksIPZnach = txtFiksIPZnach
If txtTarifPlanZFTV.Tag <> "" Then
  Set Item.TarifPlanZFTV = Item.Application.FindRowObject("TP_Spt_TarplanZFTV", txtTarifPlanZFTV.Tag)
Else
  Set Item.TarifPlanZFTV = Nothing
End If
 If cmbPaketVzroslieIstorii.ListIndex >= 0 Then
   Item.PaketVzroslieIstorii = cmbPaketVzroslieIstorii.ItemData(cmbPaketVzroslieIstorii.ListIndex)
 End If
 If cmbPaketFootball.ListIndex >= 0 Then
   Item.PaketFootball = cmbPaketFootball.ItemData(cmbPaketFootball.ListIndex)
 End If
Item.NomerZayavSYZIZ = txtNomerZayavSYZIZ
If txtTarifPlanTLF.Tag <> "" Then
  Set Item.TarifPlanTLF = Item.Application.FindRowObject("TP_Spr_TarplanTLF", txtTarifPlanTLF.Tag)
Else
  Set Item.TarifPlanTLF = Nothing
End If
Item.PodborNomerTLF = txtPodborNomerTLF
 If cmbVnytriZonovajaTLF.ListIndex >= 0 Then
   Item.VnytriZonovajaTLF = cmbVnytriZonovajaTLF.ItemData(cmbVnytriZonovajaTLF.ListIndex)
 End If
 If cmbDocPolych.ListIndex >= 0 Then
   Item.DocPolych = cmbDocPolych.ItemData(cmbDocPolych.ListIndex)
 End If
  If IsNull(dtpDataSZT) Then
    Item.DataSZT = 0
  Else
    Item.DataSZT = dtpDataSZT.Value
  End If
 If cmbVklVReestr.ListIndex >= 0 Then
   Item.VklVReestr = cmbVklVReestr.ItemData(cmbVklVReestr.ListIndex)
 End If
 mIsChanged = False
 RaiseEvent Changed
End Sub
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
 Public Sub Customize()
   Panel.Customize
 End Sub
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



