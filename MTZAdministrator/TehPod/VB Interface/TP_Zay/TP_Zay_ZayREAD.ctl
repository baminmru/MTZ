VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl TP_Zay_ZayREAD 
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
         Height          =   1200
         Left            =   12900
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   85
         ToolTipText     =   "�����������"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtNumDogovor 
         Enabled         =   0   'False
         Height          =   300
         Left            =   12900
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   83
         ToolTipText     =   "����� ��������"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.ComboBox cmbDopSogl 
         Enabled         =   0   'False
         Height          =   315
         Left            =   12900
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   81
         ToolTipText     =   "�������������� ����������"
         Top             =   405
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataOtpravVKEY 
         Height          =   300
         Left            =   9750
         TabIndex        =   79
         ToolTipText     =   "���� �������� � ���"
         Top             =   6240
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   88997891
         CurrentDate     =   39853
      End
      Begin VB.ComboBox cmbOtprVKEY 
         Enabled         =   0   'False
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   77
         ToolTipText     =   "���������� � ���"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.TextBox txtOpisProblem 
         Enabled         =   0   'False
         Height          =   1200
         Left            =   9750
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   75
         ToolTipText     =   "�������� ��������"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbOtkaz 
         Enabled         =   0   'False
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   73
         ToolTipText     =   "�����"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbVklVReestr 
         Enabled         =   0   'False
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   71
         ToolTipText     =   "�������� � ������ ��� ������"
         Top             =   2520
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataSZT 
         Height          =   300
         Left            =   9750
         TabIndex        =   69
         ToolTipText     =   "���� �������� � ���"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   88997891
         CurrentDate     =   39853
      End
      Begin VB.ComboBox cmbDocPolych 
         Enabled         =   0   'False
         Height          =   315
         Left            =   9750
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   67
         ToolTipText     =   "��������� ��������"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdSrochDogovor 
         Height          =   300
         Left            =   12300
         TabIndex        =   65
         Tag             =   "refopen.ico"
         ToolTipText     =   "���� ��������"
         Top             =   405
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
         TabIndex        =   64
         ToolTipText     =   "���� ��������"
         Top             =   405
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpDataInstall 
         Height          =   300
         Left            =   6600
         TabIndex        =   62
         ToolTipText     =   "���� ����������"
         Top             =   6240
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   88997891
         CurrentDate     =   39853
      End
      Begin VB.TextBox txtFIOdogovor 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   60
         ToolTipText     =   "��� � ��������"
         Top             =   5535
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTarif 
         Height          =   300
         Left            =   9150
         TabIndex        =   58
         Tag             =   "refopen.ico"
         ToolTipText     =   "�����"
         Top             =   4830
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTarif 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   57
         ToolTipText     =   "�����"
         Top             =   4830
         Width           =   2550
      End
      Begin VB.TextBox txtVidanModemSer 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   55
         ToolTipText     =   "�������� ����� ��������"
         Top             =   4125
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdDeviceType 
         Height          =   300
         Left            =   9150
         TabIndex        =   53
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ������������"
         Top             =   3420
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtDeviceType 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   52
         ToolTipText     =   "��� ������������"
         Top             =   3420
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdIngener 
         Height          =   300
         Left            =   9150
         TabIndex        =   50
         Tag             =   "refopen.ico"
         ToolTipText     =   "�������"
         Top             =   2715
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtIngener 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   49
         ToolTipText     =   "�������"
         Top             =   2715
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdKoordin 
         Height          =   300
         Left            =   9150
         TabIndex        =   47
         Tag             =   "refopen.ico"
         ToolTipText     =   "�����������"
         Top             =   2010
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtKoordin 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   46
         ToolTipText     =   "�����������"
         Top             =   2010
         Width           =   2550
      End
      Begin VB.TextBox txtDopInfo 
         Enabled         =   0   'False
         Height          =   1200
         Left            =   6600
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   44
         ToolTipText     =   "���. ����������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtMAC_STB 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   30
         TabIndex        =   42
         ToolTipText     =   "MAC STB"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtSN_STB 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   40
         ToolTipText     =   "���. ����� STB"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtABNumber 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   30
         TabIndex        =   38
         ToolTipText     =   "����������� �����"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPortref 
         Height          =   300
         Left            =   6000
         TabIndex        =   36
         Tag             =   "refopen.ico"
         ToolTipText     =   "����"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtPortref 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   35
         ToolTipText     =   "����"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdGelVremja 
         Height          =   300
         Left            =   6000
         TabIndex        =   33
         Tag             =   "refopen.ico"
         ToolTipText     =   "�������� ����� ������ �����������"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtGelVremja 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   32
         ToolTipText     =   "�������� ����� ������ �����������"
         Top             =   3225
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpGelData 
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         ToolTipText     =   "�������� ���� ������ �����������"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   88997891
         CurrentDate     =   39853
      End
      Begin VB.TextBox txtVremjaDljaSvjazi 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   28
         ToolTipText     =   "����� ��� �����"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtKontEMAIL 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   100
         TabIndex        =   26
         ToolTipText     =   "���������� e-mail"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtKontTelefon 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   100
         TabIndex        =   24
         ToolTipText     =   "���������� �������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtKonrLizo 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   22
         ToolTipText     =   "���������� ����"
         Top             =   6045
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMetro 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "�����"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtMetro 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "�����"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdRayon 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "�����"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtRayon 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "�����"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.TextBox txtAdres 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   14
         ToolTipText     =   "�����"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheOperator 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "��������"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheOperator 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "��������"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.TextBox txtFIO 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   9
         ToolTipText     =   "���"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdZType 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ������"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtZType 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "��� ������"
         Top             =   1815
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpDataPriem 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "���� ������"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   88997891
         CurrentDate     =   39853
      End
      Begin VB.TextBox txtNum 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "����� ������ "
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblKomment 
         BackStyle       =   0  'Transparent
         Caption         =   "�����������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   84
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblNumDogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   82
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDopSogl 
         BackStyle       =   0  'Transparent
         Caption         =   "�������������� ����������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   12900
         TabIndex        =   80
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblDataOtpravVKEY 
         BackStyle       =   0  'Transparent
         Caption         =   "���� �������� � ���:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   78
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblOtprVKEY 
         BackStyle       =   0  'Transparent
         Caption         =   "���������� � ���:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   76
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblOpisProblem 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   74
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblOtkaz 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   72
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblVklVReestr 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� � ������ ��� ������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   70
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblDataSZT 
         BackStyle       =   0  'Transparent
         Caption         =   "���� �������� � ���:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   68
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDocPolych 
         BackStyle       =   0  'Transparent
         Caption         =   "��������� ��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   66
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSrochDogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   9750
         TabIndex        =   63
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblDataInstall 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ����������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   61
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblFIOdogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "��� � ��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   59
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblTarif 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   56
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblVidanModemSer 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ����� ��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   54
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblDeviceType 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ������������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblIngener 
         BackStyle       =   0  'Transparent
         Caption         =   "�������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   2385
         Width           =   3000
      End
      Begin VB.Label lblKoordin 
         BackStyle       =   0  'Transparent
         Caption         =   "�����������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         Top             =   1680
         Width           =   3000
      End
      Begin VB.Label lblDopInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "���. ����������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblMAC_STB 
         BackStyle       =   0  'Transparent
         Caption         =   "MAC STB:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   41
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblSN_STB 
         BackStyle       =   0  'Transparent
         Caption         =   "���. ����� STB:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblABNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "����������� �����:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblPortref 
         BackStyle       =   0  'Transparent
         Caption         =   "����:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblGelVremja 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ����� ������ �����������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblGelData 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ���� ������ �����������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblVremjaDljaSvjazi 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ��� �����:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblKontEMAIL 
         BackStyle       =   0  'Transparent
         Caption         =   "���������� e-mail:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblKontTelefon 
         BackStyle       =   0  'Transparent
         Caption         =   "���������� �������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblKonrLizo 
         BackStyle       =   0  'Transparent
         Caption         =   "���������� ����:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblMetro 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblRayon 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblAdres 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheOperator 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFIO 
         BackStyle       =   0  'Transparent
         Caption         =   "���:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblZType 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ������:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDataPriem 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ������:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblNum 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ������ :"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "TP_Zay_ZayREAD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� �������
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean






'������� ������ ������
'Parameters:
'[IN][OUT]  Runner , ��� ���������: mtzmanager.main,
'[IN]   TypeName , ��� ���������: String,
'[IN][OUT]   ID , ��� ���������: string,
'[IN][OUT]   Brief , ��� ���������: string,
'[IN][OUT]   Cancel , ��� ���������: boolean  - ...
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.findObject(...���������...)
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

'������� ��������� ������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
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

Private Sub txtNum_Change()
  Changing

End Sub
Private Sub dtpDataPriem_Change()
  Changing

End Sub
Private Sub txtZType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdZType_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdZType_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtFIO_Change()
  Changing

End Sub
Private Sub txtTheOperator_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheOperator_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdTheOperator_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtAdres_Change()
  Changing

End Sub
Private Sub txtRayon_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdRayon_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdRayon_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtMetro_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdMetro_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdMetro_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
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
Private Sub dtpGelData_Change()
  Changing

End Sub
Private Sub txtGelVremja_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdGelVremja_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdGelVremja_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtPortref_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPortref_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdPortref_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtABNumber_Change()
  Changing

End Sub
Private Sub txtSN_STB_Change()
  Changing

End Sub
Private Sub txtMAC_STB_Change()
  Changing

End Sub
Private Sub txtDopInfo_Change()
  Changing

End Sub
Private Sub txtKoordin_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdKoordin_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdKoordin_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtIngener_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdIngener_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdIngener_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtDeviceType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDeviceType_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdDeviceType_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtVidanModemSer_Change()
  Changing

End Sub
Private Sub txtTarif_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTarif_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdTarif_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtFIOdogovor_Change()
  Changing

End Sub
Private Sub dtpDataInstall_Change()
  Changing

End Sub
Private Sub txtSrochDogovor_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSrochDogovor_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdSrochDogovor_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmbDocPolych_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub dtpDataSZT_Change()
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
Private Sub dtpDataOtpravVKEY_Change()
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
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub

'�������� ������������ ���������� ������ �� ������ ��������������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
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

If mIsOK Then mIsOK = IsSet(txtNum.Text)
If mIsOK Then mIsOK = IsSet(dtpDataPriem.Value)
If mIsOK Then mIsOK = txtZType.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtFIO.Text)
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

'������������� ��������� ������
'Parameters:
' ���������� ���
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

txtNum = Item.Num
dtpDataPriem = Date
If Item.DataPriem <> 0 Then
 dtpDataPriem = Item.DataPriem
End If
If Not Item.ZType Is Nothing Then
  txtZType.Tag = Item.ZType.ID
  txtZType = Item.ZType.Brief
Else
  txtZType.Tag = ""
  txtZType = ""
End If
 LoadBtnPictures cmdZType, cmdZType.Tag
  cmdZType.RemoveAllMenu
  cmdZType.AddMenu "��������"
  On Error Resume Next
txtFIO = Item.FIO
If Not Item.TheOperator Is Nothing Then
  txtTheOperator.Tag = Item.TheOperator.ID
  txtTheOperator = Item.TheOperator.Brief
Else
  txtTheOperator.Tag = ""
  txtTheOperator = ""
End If
 LoadBtnPictures cmdTheOperator, cmdTheOperator.Tag
  cmdTheOperator.RemoveAllMenu
  cmdTheOperator.AddMenu "��������"
  On Error Resume Next
txtAdres = Item.Adres
If Not Item.Rayon Is Nothing Then
  txtRayon.Tag = Item.Rayon.ID
  txtRayon = Item.Rayon.Brief
Else
  txtRayon.Tag = ""
  txtRayon = ""
End If
 LoadBtnPictures cmdRayon, cmdRayon.Tag
  cmdRayon.RemoveAllMenu
  cmdRayon.AddMenu "��������"
If Not Item.Metro Is Nothing Then
  txtMetro.Tag = Item.Metro.ID
  txtMetro = Item.Metro.Brief
Else
  txtMetro.Tag = ""
  txtMetro = ""
End If
 LoadBtnPictures cmdMetro, cmdMetro.Tag
  cmdMetro.RemoveAllMenu
  cmdMetro.AddMenu "��������"
  On Error Resume Next
txtKonrLizo = Item.KonrLizo
  On Error Resume Next
txtKontTelefon = Item.KontTelefon
  On Error Resume Next
txtKontEMAIL = Item.KontEMAIL
  On Error Resume Next
txtVremjaDljaSvjazi = Item.VremjaDljaSvjazi
dtpGelData = Date
If Item.GelData <> 0 Then
 dtpGelData = Item.GelData
Else
 dtpGelData.Value = Null
End If
If Not Item.GelVremja Is Nothing Then
  txtGelVremja.Tag = Item.GelVremja.ID
  txtGelVremja = Item.GelVremja.Brief
Else
  txtGelVremja.Tag = ""
  txtGelVremja = ""
End If
 LoadBtnPictures cmdGelVremja, cmdGelVremja.Tag
  cmdGelVremja.RemoveAllMenu
  cmdGelVremja.AddMenu "��������"
If Not Item.Portref Is Nothing Then
  txtPortref.Tag = Item.Portref.ID
  txtPortref = Item.Portref.Brief
Else
  txtPortref.Tag = ""
  txtPortref = ""
End If
 LoadBtnPictures cmdPortref, cmdPortref.Tag
  cmdPortref.RemoveAllMenu
  cmdPortref.AddMenu "��������"
  On Error Resume Next
txtABNumber = Item.ABNumber
  On Error Resume Next
txtSN_STB = Item.SN_STB
  On Error Resume Next
txtMAC_STB = Item.MAC_STB
txtDopInfo = Item.DopInfo
If Not Item.Koordin Is Nothing Then
  txtKoordin.Tag = Item.Koordin.ID
  txtKoordin = Item.Koordin.Brief
Else
  txtKoordin.Tag = ""
  txtKoordin = ""
End If
 LoadBtnPictures cmdKoordin, cmdKoordin.Tag
  cmdKoordin.RemoveAllMenu
  cmdKoordin.AddMenu "��������"
If Not Item.Ingener Is Nothing Then
  txtIngener.Tag = Item.Ingener.ID
  txtIngener = Item.Ingener.Brief
Else
  txtIngener.Tag = ""
  txtIngener = ""
End If
 LoadBtnPictures cmdIngener, cmdIngener.Tag
  cmdIngener.RemoveAllMenu
  cmdIngener.AddMenu "��������"
If Not Item.DeviceType Is Nothing Then
  txtDeviceType.Tag = Item.DeviceType.ID
  txtDeviceType = Item.DeviceType.Brief
Else
  txtDeviceType.Tag = ""
  txtDeviceType = ""
End If
 LoadBtnPictures cmdDeviceType, cmdDeviceType.Tag
  cmdDeviceType.RemoveAllMenu
  cmdDeviceType.AddMenu "��������"
  On Error Resume Next
txtVidanModemSer = Item.VidanModemSer
If Not Item.Tarif Is Nothing Then
  txtTarif.Tag = Item.Tarif.ID
  txtTarif = Item.Tarif.Brief
Else
  txtTarif.Tag = ""
  txtTarif = ""
End If
 LoadBtnPictures cmdTarif, cmdTarif.Tag
  cmdTarif.RemoveAllMenu
  cmdTarif.AddMenu "��������"
  On Error Resume Next
txtFIOdogovor = Item.FIOdogovor
dtpDataInstall = Date
If Item.DataInstall <> 0 Then
 dtpDataInstall = Item.DataInstall
Else
 dtpDataInstall.Value = Null
End If
If Not Item.SrochDogovor Is Nothing Then
  txtSrochDogovor.Tag = Item.SrochDogovor.ID
  txtSrochDogovor = Item.SrochDogovor.Brief
Else
  txtSrochDogovor.Tag = ""
  txtSrochDogovor = ""
End If
 LoadBtnPictures cmdSrochDogovor, cmdSrochDogovor.Tag
  cmdSrochDogovor.RemoveAllMenu
  cmdSrochDogovor.AddMenu "��������"
cmbDocPolych.Clear
cmbDocPolych.AddItem "��"
cmbDocPolych.ItemData(cmbDocPolych.NewIndex) = -1
cmbDocPolych.AddItem "���"
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
cmbVklVReestr.Clear
cmbVklVReestr.AddItem "��"
cmbVklVReestr.ItemData(cmbVklVReestr.NewIndex) = -1
cmbVklVReestr.AddItem "���"
cmbVklVReestr.ItemData(cmbVklVReestr.NewIndex) = 0
 For iii = 0 To cmbVklVReestr.ListCount - 1
  If Item.VklVReestr = cmbVklVReestr.ItemData(iii) Then
   cmbVklVReestr.ListIndex = iii
   Exit For
  End If
 Next
cmbOtkaz.Clear
cmbOtkaz.AddItem "��"
cmbOtkaz.ItemData(cmbOtkaz.NewIndex) = -1
cmbOtkaz.AddItem "���"
cmbOtkaz.ItemData(cmbOtkaz.NewIndex) = 0
 For iii = 0 To cmbOtkaz.ListCount - 1
  If Item.Otkaz = cmbOtkaz.ItemData(iii) Then
   cmbOtkaz.ListIndex = iii
   Exit For
  End If
 Next
txtOpisProblem = Item.OpisProblem
cmbOtprVKEY.Clear
cmbOtprVKEY.AddItem "��"
cmbOtprVKEY.ItemData(cmbOtprVKEY.NewIndex) = -1
cmbOtprVKEY.AddItem "���"
cmbOtprVKEY.ItemData(cmbOtprVKEY.NewIndex) = 0
 For iii = 0 To cmbOtprVKEY.ListCount - 1
  If Item.OtprVKEY = cmbOtprVKEY.ItemData(iii) Then
   cmbOtprVKEY.ListIndex = iii
   Exit For
  End If
 Next
dtpDataOtpravVKEY = Date
If Item.DataOtpravVKEY <> 0 Then
 dtpDataOtpravVKEY = Item.DataOtpravVKEY
Else
 dtpDataOtpravVKEY.Value = Null
End If
cmbDopSogl.Clear
cmbDopSogl.AddItem "��"
cmbDopSogl.ItemData(cmbDopSogl.NewIndex) = -1
cmbDopSogl.AddItem "���"
cmbDopSogl.ItemData(cmbDopSogl.NewIndex) = 0
 For iii = 0 To cmbDopSogl.ListCount - 1
  If Item.DopSogl = cmbDopSogl.ItemData(iii) Then
   cmbDopSogl.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtNumDogovor = Item.NumDogovor
txtKomment = Item.Komment
' ������� �������� ID �� ���� SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Save({���������})
Public Sub Save()
If OnInit Then Exit Sub

 mIsChanged = False
 RaiseEvent Changed
End Sub

'������ ������� ������ �� ������� ���������
'Parameters:
'[IN][OUT]  x , ��� ���������: Single,
'[IN][OUT]   y , ��� ���������: single  - ...
'See Also:
'Example:
'  call me.OptimalSize({���������})
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

'�������� ���� ��������� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
   Panel.Customize
 End Sub

'������ ��������� ��������� �� ������ ��� ���������� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. PanelCustomisationString
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property

'��������������  ������� ��������� �� ������
'Parameters:
'[IN][OUT]  s , ��� ���������: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. PanelCustomisationString = value
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property

'���������� ��������� ���������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Enabled
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property

'������ \ ���������� ��������� ���������
'Parameters:
'[IN]   v , ��� ���������: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. Enabled = value
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



