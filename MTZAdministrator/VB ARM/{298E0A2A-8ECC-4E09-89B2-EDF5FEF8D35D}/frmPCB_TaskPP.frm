VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmPCB_TaskPP 
   Caption         =   "������ ��� ������ �� ������ ��"
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
      Caption         =   "������"
      Height          =   330
      Left            =   0
      TabIndex        =   1
      ToolTipText     =   "����� �� ������� �������"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   750
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   330
      Left            =   0
      TabIndex        =   0
      ToolTipText     =   "��������� ������"
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
         ToolTipText     =   "����������"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComment 
         Caption         =   "����������:"
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
         ToolTipText     =   "���� ���������"
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
         ToolTipText     =   "���� ���������"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblPriceSetByRef 
         Caption         =   "���� ���������:"
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
         ToolTipText     =   "������"
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
         ToolTipText     =   "������"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblCreatedByRef 
         Caption         =   "������:"
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
         ToolTipText     =   "���� � ����� ������ ��"
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
         Caption         =   "���� � ����� ������ ��:"
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
         ToolTipText     =   "���� � ����� ������ C"
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
         Caption         =   "���� � ����� ������ C:"
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
         ToolTipText     =   "���� � ����� �������� ��"
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
         Caption         =   "���� � ����� �������� ��:"
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
         ToolTipText     =   "���� � ����� �������� C"
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
         Caption         =   "���� � ����� �������� C:"
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
         ToolTipText     =   "�������������� ����������"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblDopRequests 
         Caption         =   "�������������� ����������:"
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
         ToolTipText     =   "����. �����., �����. � ���������"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblExtraControl 
         Caption         =   "����. �����., �����. � ���������:"
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
         ToolTipText     =   "������ ��������� 5"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblAccCustomer 
         Caption         =   "������ ��������� 5:"
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
         ToolTipText     =   "���-�� �����. ����. �� ���������, ��. ������ ��� �����"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblContRentgen_LE 
         Caption         =   "���-�� �����. ����. �� ���������, ��. ������ ��� �����:"
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
         ToolTipText     =   "���-�� �����. ����. �� ���������, ��. ������ ��� �����"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblContRentgen_GE 
         Caption         =   "���-�� �����. ����. �� ���������, ��. ������ ��� �����:"
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
         ToolTipText     =   "���� �����.�����. �� ��, ��� ������ ��� �����"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRentOnce_LE 
         Caption         =   "���� �����.�����. �� ��, ��� ������ ��� �����:"
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
         ToolTipText     =   "���� �����.�����. �� ��, ��� ������ ��� �����"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRentOnce_GE 
         Caption         =   "���� �����.�����. �� ��, ��� ������ ��� �����:"
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
         ToolTipText     =   "��������������� BGA"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.CheckBox lblRentBGA 
         Caption         =   "��������������� BGA:"
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
         ToolTipText     =   "��������� ����. �� ����"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.CheckBox lblUseGlue 
         Caption         =   "��������� ����. �� ����:"
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
         ToolTipText     =   "�������� �����"
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
         ToolTipText     =   "�������� �����"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblLak 
         Caption         =   "�������� �����:"
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
         ToolTipText     =   "������. ��������. ��������"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblAntisitat 
         Caption         =   "������. ��������. ��������:"
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
         ToolTipText     =   "������� ����� �������"
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
         ToolTipText     =   "������� ����� �������"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblClearAfter 
         Caption         =   "������� ����� �������:"
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
         ToolTipText     =   "��� ����� ��� ������"
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
         ToolTipText     =   "��� ����� ��� ������"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblPripoyType 
         Caption         =   "��� ����� ��� ������:"
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
         ToolTipText     =   "������ ���. (��) ������ ��� �����"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblWeidthMM_LE 
         Caption         =   "������ ���. (��) ������ ��� �����:"
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
         ToolTipText     =   "������ ���. (��) ������ ��� �����"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblWeidthMM_GE 
         Caption         =   "������ ���. (��) ������ ��� �����:"
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
         ToolTipText     =   "������ ���. (��) ������ ��� �����"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblLengthMM_LE 
         Caption         =   "������ ���. (��) ������ ��� �����:"
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
         ToolTipText     =   "������ ���. (��) ������ ��� �����"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblLengthMM_GE 
         Caption         =   "������ ���. (��) ������ ��� �����:"
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
         ToolTipText     =   "���-�� ������. ��������� ������ ��� �����"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblMountZagot_LE 
         Caption         =   "���-�� ������. ��������� ������ ��� �����:"
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
         ToolTipText     =   "���-�� ������. ��������� ������ ��� �����"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblMountZagot_GE 
         Caption         =   "���-�� ������. ��������� ������ ��� �����:"
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
         ToolTipText     =   "���-�� ������. ������ ������ ��� �����"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblMountCount_LE 
         Caption         =   "���-�� ������. ������ ������ ��� �����:"
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
         ToolTipText     =   "���-�� ������. ������ ������ ��� �����"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblMountCount_GE 
         Caption         =   "���-�� ������. ������ ������ ��� �����:"
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
         ToolTipText     =   "��� �������"
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
         ToolTipText     =   "��� �������"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblMountingType 
         Caption         =   "��� �������:"
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
         ToolTipText     =   "������ ������ ������� ��"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblFileFormat 
         Caption         =   "������ ������ ������� ��:"
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
         ToolTipText     =   "�������� ����� ������� ��"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblThePName 
         Caption         =   "�������� ����� ������� ��:"
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
         ToolTipText     =   "���� ��������� ���� ��"
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
         Caption         =   "���� ��������� ���� ��:"
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
         ToolTipText     =   "���� ��������� ���� C"
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
         Caption         =   "���� ��������� ���� C:"
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
         ToolTipText     =   "���� ������ ���� ��"
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
         Caption         =   "���� ������ ���� ��:"
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
         ToolTipText     =   "���� ������ ���� C"
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
         Caption         =   "���� ������ ���� C:"
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
         ToolTipText     =   "���� ��������� ���� ��"
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
         Caption         =   "���� ��������� ���� ��:"
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
         ToolTipText     =   "���� ��������� ���� C"
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
         Caption         =   "���� ��������� ���� C:"
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
         ToolTipText     =   "���� ������ ���� ��"
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
         Caption         =   "���� ������ ���� ��:"
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
         ToolTipText     =   "���� ������ ���� C"
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
         Caption         =   "���� ������ ���� C:"
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
         ToolTipText     =   "���� ���������� ������ ��� �����"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblProductPeriod_LE 
         Caption         =   "���� ���������� ������ ��� �����:"
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
         ToolTipText     =   "���� ���������� ������ ��� �����"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblProductPeriod_GE 
         Caption         =   "���� ���������� ������ ��� �����:"
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
         ToolTipText     =   "���� ������� ������ ��� �����"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblMontainPeriod_LE 
         Caption         =   "���� ������� ������ ��� �����:"
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
         ToolTipText     =   "���� ������� ������ ��� �����"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblMontainPeriod_GE 
         Caption         =   "���� ������� ������ ��� �����:"
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
         ToolTipText     =   "���. ���� � ����������� (� ���), ��� ������ ��� �����"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRes_LE 
         Caption         =   "���. ���� � ����������� (� ���), ��� ������ ��� �����:"
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
         ToolTipText     =   "���. ���� � ����������� (� ���), ��� ������ ��� �����"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRes_GE 
         Caption         =   "���. ���� � ����������� (� ���), ��� ������ ��� �����:"
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
         ToolTipText     =   "���. ���� ������� �� ����� (� ���), ��� ������ ��� �����"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceResPrepare_LE 
         Caption         =   "���. ���� ������� �� ����� (� ���), ��� ������ ��� �����:"
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
         ToolTipText     =   "���. ���� ������� �� ����� (� ���), ��� ������ ��� �����"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceResPrepare_GE 
         Caption         =   "���. ���� ������� �� ����� (� ���), ��� ������ ��� �����:"
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
         ToolTipText     =   "���. ���� ������� �� 1 ��.(��� ���), ��� ������ ��� �����"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceItemNNDS_LE 
         Caption         =   "���. ���� ������� �� 1 ��.(��� ���), ��� ������ ��� �����:"
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
         ToolTipText     =   "���. ���� ������� �� 1 ��.(��� ���), ��� ������ ��� �����"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceItemNNDS_GE 
         Caption         =   "���. ���� ������� �� 1 ��.(��� ���), ��� ������ ��� �����:"
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
         ToolTipText     =   "���. ���� ������� �� �����, ��� ������ ��� �����"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecom_LE 
         Caption         =   "���. ���� ������� �� �����, ��� ������ ��� �����:"
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
         ToolTipText     =   "���. ���� ������� �� �����, ��� ������ ��� �����"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecom_GE 
         Caption         =   "���. ���� ������� �� �����, ��� ������ ��� �����:"
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
         ToolTipText     =   "����������� ���� ������� �� �����, ��� ������ ��� �����"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecomMin_LE 
         Caption         =   "����������� ���� ������� �� �����, ��� ������ ��� �����:"
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
         ToolTipText     =   "����������� ���� ������� �� �����, ��� ������ ��� �����"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceRecomMin_GE 
         Caption         =   "����������� ���� ������� �� �����, ��� ������ ��� �����:"
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
         ToolTipText     =   "��������� ������� 1 �� (�����), ��� ������ ��� �����"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePerOne_LE 
         Caption         =   "��������� ������� 1 �� (�����), ��� ������ ��� �����:"
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
         ToolTipText     =   "��������� ������� 1 �� (�����), ��� ������ ��� �����"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePerOne_GE 
         Caption         =   "��������� ������� 1 �� (�����), ��� ������ ��� �����:"
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
         ToolTipText     =   "������� max ������ ��� �����"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMax_LE 
         Caption         =   "������� max ������ ��� �����:"
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
         ToolTipText     =   "������� max ������ ��� �����"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMax_GE 
         Caption         =   "������� max ������ ��� �����:"
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
         ToolTipText     =   "������� min ������ ��� �����"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMin_LE 
         Caption         =   "������� min ������ ��� �����:"
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
         ToolTipText     =   "������� min ������ ��� �����"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblExtraChargeMin_GE 
         Caption         =   "������� min ������ ��� �����:"
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
         ToolTipText     =   "���� ���������(��), ��� ������ ��� �����"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceTrafaretSell_LE 
         Caption         =   "���� ���������(��), ��� ������ ��� �����:"
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
         ToolTipText     =   "���� ���������(��), ��� ������ ��� �����"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceTrafaretSell_GE 
         Caption         =   "���� ���������(��), ��� ������ ��� �����:"
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
         ToolTipText     =   "������������� ���������(��), ��� ������ ��� �����"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceTrafaret_LE 
         Caption         =   "������������� ���������(��), ��� ������ ��� �����:"
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
         ToolTipText     =   "������������� ���������(��), ��� ������ ��� �����"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceTrafaret_GE 
         Caption         =   "������������� ���������(��), ��� ������ ��� �����:"
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
         ToolTipText     =   "����� ����������, ��� ������ ��� �����"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePrepare_LE 
         Caption         =   "����� ����������, ��� ������ ��� �����:"
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
         ToolTipText     =   "����� ����������, ��� ������ ��� �����"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPricePrepare_GE 
         Caption         =   "����� ����������, ��� ������ ��� �����:"
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
         ToolTipText     =   "�������������"
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
         ToolTipText     =   "�������������"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblControlerRef 
         Caption         =   "�������������:"
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
         ToolTipText     =   "��� ������"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblTaskType 
         Caption         =   "��� ������:"
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
         ToolTipText     =   "�����"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblTheName 
         Caption         =   "�����:"
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
         Caption         =   "���������"
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

ts.Tabs.Item(1).Caption = "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPricePrepare_GE.Text) < -922337203685478# Or val(txtPricePrepare_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPricePrepare_LE.Text) < -922337203685478# Or val(txtPricePrepare_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceTrafaret_GE.Text) < -922337203685478# Or val(txtPriceTrafaret_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceTrafaret_LE.Text) < -922337203685478# Or val(txtPriceTrafaret_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceTrafaretSell_GE.Text) < -922337203685478# Or val(txtPriceTrafaretSell_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceTrafaretSell_LE.Text) < -922337203685478# Or val(txtPriceTrafaretSell_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtExtraChargeMin_GE.Text) <> CLng(val(txtExtraChargeMin_GE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtExtraChargeMin_LE.Text) <> CLng(val(txtExtraChargeMin_LE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtExtraChargeMax_GE.Text) <> CLng(val(txtExtraChargeMax_GE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtExtraChargeMax_LE.Text) <> CLng(val(txtExtraChargeMax_LE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPricePerOne_GE.Text) < -922337203685478# Or val(txtPricePerOne_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPricePerOne_LE.Text) < -922337203685478# Or val(txtPricePerOne_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceRecomMin_GE.Text) < -922337203685478# Or val(txtPriceRecomMin_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceRecomMin_LE.Text) < -922337203685478# Or val(txtPriceRecomMin_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceRecom_GE.Text) < -922337203685478# Or val(txtPriceRecom_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceRecom_LE.Text) < -922337203685478# Or val(txtPriceRecom_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceItemNNDS_GE.Text) < -922337203685478# Or val(txtPriceItemNNDS_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceItemNNDS_LE.Text) < -922337203685478# Or val(txtPriceItemNNDS_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceResPrepare_GE.Text) < -922337203685478# Or val(txtPriceResPrepare_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceResPrepare_LE.Text) < -922337203685478# Or val(txtPriceResPrepare_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceRes_GE.Text) < -922337203685478# Or val(txtPriceRes_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceRes_LE.Text) < -922337203685478# Or val(txtPriceRes_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtMontainPeriod_GE.Text) <> CLng(val(txtMontainPeriod_GE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtMontainPeriod_LE.Text) <> CLng(val(txtMontainPeriod_LE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtProductPeriod_GE.Text) <> CLng(val(txtProductPeriod_GE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtProductPeriod_LE.Text) <> CLng(val(txtProductPeriod_LE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtMountCount_GE.Text) <> CLng(val(txtMountCount_GE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtMountCount_LE.Text) <> CLng(val(txtMountCount_LE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtMountZagot_GE.Text) <> CLng(val(txtMountZagot_GE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtMountZagot_LE.Text) <> CLng(val(txtMountZagot_LE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtLengthMM_GE.Text) <> CLng(val(txtLengthMM_GE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtLengthMM_LE.Text) <> CLng(val(txtLengthMM_LE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtWeidthMM_GE.Text) <> CLng(val(txtWeidthMM_GE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtWeidthMM_LE.Text) <> CLng(val(txtWeidthMM_LE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceRentOnce_GE.Text) < -922337203685478# Or val(txtPriceRentOnce_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtPriceRentOnce_LE.Text) < -922337203685478# Or val(txtPriceRentOnce_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtContRentgen_GE.Text) <> CLng(val(txtContRentgen_GE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtContRentgen_LE.Text) <> CLng(val(txtContRentgen_LE.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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
cmbTaskType.AddItem "��������"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 4
cmbTaskType.AddItem "������������ ��"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 1
cmbTaskType.AddItem "�������� �������������"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 2
cmbTaskType.AddItem "������ ��"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 0
cmbTaskType.AddItem "�������������� ��"
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
cmbAntisitat.AddItem "��"
cmbAntisitat.ItemData(cmbAntisitat.NewIndex) = -1
cmbAntisitat.AddItem "���"
cmbAntisitat.ItemData(cmbAntisitat.NewIndex) = 0
  txtLak.Tag = ""
  txtLak = ""
 LoadBtnPictures cmdLak, cmdLak.Tag
  cmdLak.RemoveAllMenu
cmbUseGlue.Clear
cmbUseGlue.AddItem "��"
cmbUseGlue.ItemData(cmbUseGlue.NewIndex) = -1
cmbUseGlue.AddItem "���"
cmbUseGlue.ItemData(cmbUseGlue.NewIndex) = 0
cmbRentBGA.Clear
cmbRentBGA.AddItem "��"
cmbRentBGA.ItemData(cmbRentBGA.NewIndex) = -1
cmbRentBGA.AddItem "���"
cmbRentBGA.ItemData(cmbRentBGA.NewIndex) = 0
cmbAccCustomer.Clear
cmbAccCustomer.AddItem "��"
cmbAccCustomer.ItemData(cmbAccCustomer.NewIndex) = -1
cmbAccCustomer.AddItem "���"
cmbAccCustomer.ItemData(cmbAccCustomer.NewIndex) = 0
cmbExtraControl.Clear
cmbExtraControl.AddItem "��"
cmbExtraControl.ItemData(cmbExtraControl.NewIndex) = -1
cmbExtraControl.AddItem "���"
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



