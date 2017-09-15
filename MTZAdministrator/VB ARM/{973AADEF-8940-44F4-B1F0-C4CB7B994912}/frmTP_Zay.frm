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
      Begin VB.TextBox txtKomment 
         Height          =   1200
         Left            =   12900
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   86
         ToolTipText     =   "Комментарий"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblKomment 
         Caption         =   "Комментарий:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   85
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtNumDogovor 
         Height          =   300
         Left            =   12900
         MaxLength       =   255
         TabIndex        =   84
         ToolTipText     =   "Номер договора"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblNumDogovor 
         Caption         =   "Номер договора:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   12900
         TabIndex        =   83
         Top             =   75
         Width           =   3000
      End
      Begin VB.ComboBox cmbDopSogl 
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   82
         ToolTipText     =   "Дополнительное соглашение"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.CheckBox lblDopSogl 
         Caption         =   "Дополнительное соглашение:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   81
         Top             =   5910
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataOtpravVKEY_LE 
         Height          =   300
         Left            =   9750
         TabIndex        =   80
         ToolTipText     =   "Дата отправки в КЭУ по"
         Top             =   5535
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16580611
         CurrentDate     =   39792
      End
      Begin VB.CheckBox lblDataOtpravVKEY_LE 
         Caption         =   "Дата отправки в КЭУ по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   79
         Top             =   5205
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataOtpravVKEY_GE 
         Height          =   300
         Left            =   9750
         TabIndex        =   78
         ToolTipText     =   "Дата отправки в КЭУ C"
         Top             =   4830
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16580611
         CurrentDate     =   39792
      End
      Begin VB.CheckBox lblDataOtpravVKEY_GE 
         Caption         =   "Дата отправки в КЭУ C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   77
         Top             =   4500
         Width           =   3000
      End
      Begin VB.ComboBox cmbOtprVKEY 
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   76
         ToolTipText     =   "Отправлено в КЭУ"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.CheckBox lblOtprVKEY 
         Caption         =   "Отправлено в КЭУ:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   75
         Top             =   3795
         Width           =   3000
      End
      Begin VB.TextBox txtOpisProblem 
         Height          =   1200
         Left            =   9750
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   74
         ToolTipText     =   "Описание проблемы"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblOpisProblem 
         Caption         =   "Описание проблемы:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   73
         Top             =   2190
         Width           =   3000
      End
      Begin VB.ComboBox cmbOtkaz 
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   72
         ToolTipText     =   "Отказ"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblOtkaz 
         Caption         =   "Отказ:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   71
         Top             =   1485
         Width           =   3000
      End
      Begin VB.ComboBox cmbVklVReestr 
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   70
         ToolTipText     =   "Включена в реестр для оплаты"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblVklVReestr 
         Caption         =   "Включена в реестр для оплаты:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   69
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataSZT_LE 
         Height          =   300
         Left            =   9750
         TabIndex        =   68
         ToolTipText     =   "Дата передачи в СЗТ по"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16580611
         CurrentDate     =   39792
      End
      Begin VB.CheckBox lblDataSZT_LE 
         Caption         =   "Дата передачи в СЗТ по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   9750
         TabIndex        =   67
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataSZT_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   66
         ToolTipText     =   "Дата передачи в СЗТ C"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16580611
         CurrentDate     =   39792
      End
      Begin VB.CheckBox lblDataSZT_GE 
         Caption         =   "Дата передачи в СЗТ C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   65
         Top             =   5715
         Width           =   3000
      End
      Begin VB.ComboBox cmbDocPolych 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   64
         ToolTipText     =   "Документы получены"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.CheckBox lblDocPolych 
         Caption         =   "Документы получены:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   63
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdSrochDogovor 
         Height          =   300
         Left            =   9150
         TabIndex        =   62
         Tag             =   "refopen.ico"
         ToolTipText     =   "Срок договора"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSrochDogovor 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   61
         ToolTipText     =   "Срок договора"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblSrochDogovor 
         Caption         =   "Срок договора:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   60
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataInstall_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   59
         ToolTipText     =   "Дата инсталяции по"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16580611
         CurrentDate     =   39792
      End
      Begin VB.CheckBox lblDataInstall_LE 
         Caption         =   "Дата инсталяции по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   58
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataInstall_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   57
         ToolTipText     =   "Дата инсталяции C"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16580611
         CurrentDate     =   39792
      End
      Begin VB.CheckBox lblDataInstall_GE 
         Caption         =   "Дата инсталяции C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   56
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtFIOdogovor 
         Height          =   300
         Left            =   6600
         MaxLength       =   255
         TabIndex        =   55
         ToolTipText     =   "ФИО в договоре"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblFIOdogovor 
         Caption         =   "ФИО в договоре:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   54
         Top             =   2190
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTarif 
         Height          =   300
         Left            =   9150
         TabIndex        =   53
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тариф"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTarif 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   52
         ToolTipText     =   "Тариф"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblTarif 
         Caption         =   "Тариф:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtVidanModemSer 
         Height          =   300
         Left            =   6600
         MaxLength       =   255
         TabIndex        =   50
         ToolTipText     =   "Выданный модем серийник"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblVidanModemSer 
         Caption         =   "Выданный модем серийник:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   49
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdIngener 
         Height          =   300
         Left            =   9150
         TabIndex        =   48
         Tag             =   "refopen.ico"
         ToolTipText     =   "Инженер"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtIngener 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   47
         ToolTipText     =   "Инженер"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblIngener 
         Caption         =   "Инженер:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         Top             =   75
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdKoordin 
         Height          =   300
         Left            =   6000
         TabIndex        =   45
         Tag             =   "refopen.ico"
         ToolTipText     =   "Координатор"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtKoordin 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   44
         ToolTipText     =   "Координатор"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.CheckBox lblKoordin 
         Caption         =   "Координатор:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   43
         Top             =   5715
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPortref 
         Height          =   300
         Left            =   6000
         TabIndex        =   42
         Tag             =   "refopen.ico"
         ToolTipText     =   "Порт"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPortref 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   41
         ToolTipText     =   "Порт"
         Top             =   5340
         Width           =   2550
      End
      Begin VB.CheckBox lblPortref 
         Caption         =   "Порт:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   40
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdGelVremja 
         Height          =   300
         Left            =   6000
         TabIndex        =   39
         Tag             =   "refopen.ico"
         ToolTipText     =   "Желаемое время визита инсталятора"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtGelVremja 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   38
         ToolTipText     =   "Желаемое время визита инсталятора"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblGelVremja 
         Caption         =   "Желаемое время визита инсталятора:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpGelData_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         ToolTipText     =   "Желаемая дата визита инсталятора по"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16580611
         CurrentDate     =   39792
      End
      Begin VB.CheckBox lblGelData_LE 
         Caption         =   "Желаемая дата визита инсталятора по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpGelData_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         ToolTipText     =   "Желаемая дата визита инсталятора C"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16580611
         CurrentDate     =   39792
      End
      Begin VB.CheckBox lblGelData_GE 
         Caption         =   "Желаемая дата визита инсталятора C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtVremjaDljaSvjazi 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   32
         ToolTipText     =   "Время для связи"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblVremjaDljaSvjazi 
         Caption         =   "Время для связи:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtKontEMAIL 
         Height          =   300
         Left            =   3450
         MaxLength       =   100
         TabIndex        =   30
         ToolTipText     =   "Контактный e-mail"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblKontEMAIL 
         Caption         =   "Контактный e-mail:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtKontTelefon 
         Height          =   300
         Left            =   3450
         MaxLength       =   100
         TabIndex        =   28
         ToolTipText     =   "Контактный телефон"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblKontTelefon 
         Caption         =   "Контактный телефон:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtKonrLizo 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   26
         ToolTipText     =   "Контактное лицо"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblKonrLizo 
         Caption         =   "Контактное лицо:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   75
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMetro 
         Height          =   300
         Left            =   2850
         TabIndex        =   24
         Tag             =   "refopen.ico"
         ToolTipText     =   "Метро"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMetro 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   23
         ToolTipText     =   "Метро"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.CheckBox lblMetro 
         Caption         =   "Метро:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   22
         Top             =   5715
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdRayon 
         Height          =   300
         Left            =   2850
         TabIndex        =   21
         Tag             =   "refopen.ico"
         ToolTipText     =   "Район"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtRayon 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   20
         ToolTipText     =   "Район"
         Top             =   5340
         Width           =   2550
      End
      Begin VB.CheckBox lblRayon 
         Caption         =   "Район:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtAdres 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   18
         ToolTipText     =   "Адрес"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblAdres 
         Caption         =   "Адрес:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   4305
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdOperator 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Оператор"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOperator 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Оператор"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.CheckBox lblOperator 
         Caption         =   "Оператор:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtFIO 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   13
         ToolTipText     =   "ФИО"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblFIO 
         Caption         =   "ФИО:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataPriem_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Дата приема по"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16580611
         CurrentDate     =   39792
      End
      Begin VB.CheckBox lblDataPriem_LE 
         Caption         =   "Дата приема по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataPriem_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Дата приема C"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16580611
         CurrentDate     =   39792
      End
      Begin VB.CheckBox lblDataPriem_GE 
         Caption         =   "Дата приема C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtNum_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   7
         ToolTipText     =   "Номер заявки меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblNum_LE 
         Caption         =   "Номер заявки меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtNum_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   5
         ToolTipText     =   "Номер заявки больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblNum_GE 
         Caption         =   "Номер заявки больше или равно:"
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
Private Sub Form_Unload(cancel As Integer)
  On Error Resume Next
  Set Item = Nothing
  Set TSCustom = Nothing
  SaveToSkin Me
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
  cancel = -1
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
Private Sub txtNum_GE_Validate(cancel As Boolean)
If txtNum_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNum_GE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtNum_GE.Text) <> CLng(val(txtNum_GE.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtNum_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNum_GE_Change()
  Changing
End Sub
Private Sub txtNum_LE_Validate(cancel As Boolean)
If txtNum_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNum_LE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtNum_LE.Text) <> CLng(val(txtNum_LE.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtNum_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNum_LE_Change()
  Changing
End Sub
Private Sub dtpDataPriem_GE_Change()
  Changing
End Sub
Private Sub dtpDataPriem_LE_Change()
  Changing
End Sub
Private Sub txtFIO_Change()
  Changing
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
Private Sub txtAdres_Change()
  Changing
End Sub
Private Sub txtRayon_Change()
  Changing
End Sub
Private Sub cmdRayon_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Rayon", id, brief) Then
          txtRayon.Tag = Left(id, 38)
          txtRayon = brief
        End If
End Sub
Private Sub cmdRayon_MenuClick(ByVal sCaption As String)
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
Private Sub txtKonrLizo_Change()
  Changing
End Sub
Private Sub txtKontTelefon_Change()
  Changing
End Sub
Private Sub txtKontEMAIL_Change()
  Changing
End Sub
Private Sub txtVremjaDljaSvjazi_Change()
  Changing
End Sub
Private Sub dtpGelData_GE_Change()
  Changing
End Sub
Private Sub dtpGelData_LE_Change()
  Changing
End Sub
Private Sub txtGelVremja_Change()
  Changing
End Sub
Private Sub cmdGelVremja_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_VrVisInst", id, brief) Then
          txtGelVremja.Tag = Left(id, 38)
          txtGelVremja = brief
        End If
End Sub
Private Sub cmdGelVremja_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtPortref_Change()
  Changing
End Sub
Private Sub cmdPortref_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_SPR_Port", id, brief) Then
          txtPortref.Tag = Left(id, 38)
          txtPortref = brief
        End If
End Sub
Private Sub cmdPortref_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtKoordin_Change()
  Changing
End Sub
Private Sub cmdKoordin_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Koor", id, brief) Then
          txtKoordin.Tag = Left(id, 38)
          txtKoordin = brief
        End If
End Sub
Private Sub cmdKoordin_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtIngener_Change()
  Changing
End Sub
Private Sub cmdIngener_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Ing", id, brief) Then
          txtIngener.Tag = Left(id, 38)
          txtIngener = brief
        End If
End Sub
Private Sub cmdIngener_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtVidanModemSer_Change()
  Changing
End Sub
Private Sub txtTarif_Change()
  Changing
End Sub
Private Sub cmdTarif_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Tar", id, brief) Then
          txtTarif.Tag = Left(id, 38)
          txtTarif = brief
        End If
End Sub
Private Sub cmdTarif_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtFIOdogovor_Change()
  Changing
End Sub
Private Sub dtpDataInstall_GE_Change()
  Changing
End Sub
Private Sub dtpDataInstall_LE_Change()
  Changing
End Sub
Private Sub txtSrochDogovor_Change()
  Changing
End Sub
Private Sub cmdSrochDogovor_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_SrochDog", id, brief) Then
          txtSrochDogovor.Tag = Left(id, 38)
          txtSrochDogovor = brief
        End If
End Sub
Private Sub cmdSrochDogovor_MenuClick(ByVal sCaption As String)
End Sub
Private Sub cmbDocPolych_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub dtpDataSZT_GE_Change()
  Changing
End Sub
Private Sub dtpDataSZT_LE_Change()
  Changing
End Sub
Private Sub cmbVklVReestr_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbOtkaz_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtOpisProblem_Change()
  Changing
End Sub
Private Sub cmbOtprVKEY_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub dtpDataOtpravVKEY_GE_Change()
  Changing
End Sub
Private Sub dtpDataOtpravVKEY_LE_Change()
  Changing
End Sub
Private Sub cmbDopSogl_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtNumDogovor_Change()
  Changing
End Sub
Private Sub txtKomment_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

dtpDataPriem_GE = Date
dtpDataPriem_LE = Date
txtFIO = ""
  txtOperator.Tag = ""
  txtOperator = ""
 LoadBtnPictures cmdOperator, cmdOperator.Tag
  cmdOperator.RemoveAllMenu
txtAdres = ""
  txtRayon.Tag = ""
  txtRayon = ""
 LoadBtnPictures cmdRayon, cmdRayon.Tag
  cmdRayon.RemoveAllMenu
  txtMetro.Tag = ""
  txtMetro = ""
 LoadBtnPictures cmdMetro, cmdMetro.Tag
  cmdMetro.RemoveAllMenu
txtKonrLizo = ""
txtKontTelefon = ""
txtKontEMAIL = ""
txtVremjaDljaSvjazi = ""
dtpGelData_GE = Date
dtpGelData_LE = Date
  txtGelVremja.Tag = ""
  txtGelVremja = ""
 LoadBtnPictures cmdGelVremja, cmdGelVremja.Tag
  cmdGelVremja.RemoveAllMenu
  txtPortref.Tag = ""
  txtPortref = ""
 LoadBtnPictures cmdPortref, cmdPortref.Tag
  cmdPortref.RemoveAllMenu
  txtKoordin.Tag = ""
  txtKoordin = ""
 LoadBtnPictures cmdKoordin, cmdKoordin.Tag
  cmdKoordin.RemoveAllMenu
  txtIngener.Tag = ""
  txtIngener = ""
 LoadBtnPictures cmdIngener, cmdIngener.Tag
  cmdIngener.RemoveAllMenu
txtVidanModemSer = ""
  txtTarif.Tag = ""
  txtTarif = ""
 LoadBtnPictures cmdTarif, cmdTarif.Tag
  cmdTarif.RemoveAllMenu
txtFIOdogovor = ""
dtpDataInstall_GE = Date
dtpDataInstall_LE = Date
  txtSrochDogovor.Tag = ""
  txtSrochDogovor = ""
 LoadBtnPictures cmdSrochDogovor, cmdSrochDogovor.Tag
  cmdSrochDogovor.RemoveAllMenu
cmbDocPolych.Clear
cmbDocPolych.AddItem "Да"
cmbDocPolych.ItemData(cmbDocPolych.NewIndex) = -1
cmbDocPolych.AddItem "Нет"
cmbDocPolych.ItemData(cmbDocPolych.NewIndex) = 0
dtpDataSZT_GE = Date
dtpDataSZT_LE = Date
cmbVklVReestr.Clear
cmbVklVReestr.AddItem "Да"
cmbVklVReestr.ItemData(cmbVklVReestr.NewIndex) = -1
cmbVklVReestr.AddItem "Нет"
cmbVklVReestr.ItemData(cmbVklVReestr.NewIndex) = 0
cmbOtkaz.Clear
cmbOtkaz.AddItem "Да"
cmbOtkaz.ItemData(cmbOtkaz.NewIndex) = -1
cmbOtkaz.AddItem "Нет"
cmbOtkaz.ItemData(cmbOtkaz.NewIndex) = 0
cmbOtprVKEY.Clear
cmbOtprVKEY.AddItem "Да"
cmbOtprVKEY.ItemData(cmbOtprVKEY.NewIndex) = -1
cmbOtprVKEY.AddItem "Нет"
cmbOtprVKEY.ItemData(cmbOtprVKEY.NewIndex) = 0
dtpDataOtpravVKEY_GE = Date
dtpDataOtpravVKEY_LE = Date
cmbDopSogl.Clear
cmbDopSogl.AddItem "Да"
cmbDopSogl.ItemData(cmbDopSogl.NewIndex) = -1
cmbDopSogl.AddItem "Нет"
cmbDopSogl.ItemData(cmbDopSogl.NewIndex) = 0
txtNumDogovor = ""
OnInit = False
End Sub



