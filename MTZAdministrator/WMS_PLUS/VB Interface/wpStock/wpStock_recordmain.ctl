VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl wpStock_recordmain 
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
      Begin VB.ComboBox cmbIsBrak 
         Enabled         =   0   'False
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   70
         ToolTipText     =   "����"
         Top             =   5340
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdD5 
         Height          =   300
         Left            =   9150
         TabIndex        =   68
         Tag             =   "refopen.ico"
         ToolTipText     =   "�-��������� 5"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtD5 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   67
         ToolTipText     =   "�-��������� 5"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdD4 
         Height          =   300
         Left            =   9150
         TabIndex        =   65
         Tag             =   "refopen.ico"
         ToolTipText     =   "�-��������� 4"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtD4 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   64
         ToolTipText     =   "�-��������� 4"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdD3 
         Height          =   300
         Left            =   9150
         TabIndex        =   62
         Tag             =   "refopen.ico"
         ToolTipText     =   "�-��������� 3"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtD3 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   61
         ToolTipText     =   "�-��������� 3"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdD2 
         Height          =   300
         Left            =   9150
         TabIndex        =   59
         Tag             =   "refopen.ico"
         ToolTipText     =   "�-��������� 2"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtD2 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   58
         ToolTipText     =   "�-��������� 2"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdD1 
         Height          =   300
         Left            =   9150
         TabIndex        =   56
         Tag             =   "refopen.ico"
         ToolTipText     =   "�-��������� 1"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtD1 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   55
         ToolTipText     =   "�-��������� 1"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdS5 
         Height          =   300
         Left            =   9150
         TabIndex        =   53
         Tag             =   "refopen.ico"
         ToolTipText     =   "�-��������� 5"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtS5 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   52
         ToolTipText     =   "�-��������� 5"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdS4 
         Height          =   300
         Left            =   9150
         TabIndex        =   50
         Tag             =   "refopen.ico"
         ToolTipText     =   "�-��������� 4"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtS4 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   49
         ToolTipText     =   "�-��������� 4"
         Top             =   405
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdS3 
         Height          =   300
         Left            =   6000
         TabIndex        =   47
         Tag             =   "refopen.ico"
         ToolTipText     =   "�-��������� 3"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtS3 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   46
         ToolTipText     =   "�-��������� 3"
         Top             =   6045
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdS2 
         Height          =   300
         Left            =   6000
         TabIndex        =   44
         Tag             =   "refopen.ico"
         ToolTipText     =   "�-��������� 2"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtS2 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   43
         ToolTipText     =   "�-��������� 2"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdS1 
         Height          =   300
         Left            =   6000
         TabIndex        =   41
         Tag             =   "refopen.ico"
         ToolTipText     =   "�-��������� 1"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtS1 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   40
         ToolTipText     =   "�-��������� 1"
         Top             =   4635
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpstopdate 
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         ToolTipText     =   "���� ��������� ��������"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   78970883
         CurrentDate     =   39923
      End
      Begin MSComCtl2.DTPicker dtpexpdate 
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         ToolTipText     =   "��������� ����� ��������"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   78970883
         CurrentDate     =   39923
      End
      Begin MSComCtl2.DTPicker dtpmadedate_to 
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         ToolTipText     =   "���� ������������ ��"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   78970883
         CurrentDate     =   39923
      End
      Begin MSComCtl2.DTPicker dtpmadeDate_from 
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         ToolTipText     =   "���� ������������ �"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   78970883
         CurrentDate     =   39923
      End
      Begin VB.TextBox txtSertNum 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   80
         TabIndex        =   30
         ToolTipText     =   "����������"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheFactory 
         Height          =   300
         Left            =   6000
         TabIndex        =   28
         Tag             =   "refopen.ico"
         ToolTipText     =   "�����"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheFactory 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   27
         ToolTipText     =   "�����"
         Top             =   405
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheDeveloper 
         Height          =   300
         Left            =   2850
         TabIndex        =   25
         Tag             =   "refopen.ico"
         ToolTipText     =   "�������������"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheDeveloper 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   24
         ToolTipText     =   "�������������"
         Top             =   6045
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheCountry 
         Height          =   300
         Left            =   2850
         TabIndex        =   22
         Tag             =   "refopen.ico"
         ToolTipText     =   "������"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheCountry 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   21
         ToolTipText     =   "������"
         Top             =   5340
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtQ_Quantity 
         Height          =   300
         Left            =   300
         TabIndex        =   19
         ToolTipText     =   "���-�� � ������"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtQ_Weight 
         Height          =   300
         Left            =   300
         TabIndex        =   17
         ToolTipText     =   "���-�� � �����������"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdedizm 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "��. ���."
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtedizm 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "��. ���."
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheCell 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "������"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheCell 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "������"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdtheGood 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "�����"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txttheGood 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "�����"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdpallet 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "�������"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtpallet 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "�������"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdInDocLine 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "������ �� ������"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtInDocLine 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "������ �� ������"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblIsBrak 
         BackStyle       =   0  'Transparent
         Caption         =   "����:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   6600
         TabIndex        =   69
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblD5 
         BackStyle       =   0  'Transparent
         Caption         =   "�-��������� 5:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   66
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblD4 
         BackStyle       =   0  'Transparent
         Caption         =   "�-��������� 4:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   63
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblD3 
         BackStyle       =   0  'Transparent
         Caption         =   "�-��������� 3:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   60
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblD2 
         BackStyle       =   0  'Transparent
         Caption         =   "�-��������� 2:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   57
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblD1 
         BackStyle       =   0  'Transparent
         Caption         =   "�-��������� 1:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   54
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblS5 
         BackStyle       =   0  'Transparent
         Caption         =   "�-��������� 5:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblS4 
         BackStyle       =   0  'Transparent
         Caption         =   "�-��������� 4:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblS3 
         BackStyle       =   0  'Transparent
         Caption         =   "�-��������� 3:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   45
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblS2 
         BackStyle       =   0  'Transparent
         Caption         =   "�-��������� 2:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   42
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblS1 
         BackStyle       =   0  'Transparent
         Caption         =   "�-��������� 1:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblstopdate 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ��������� ��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblexpdate 
         BackStyle       =   0  'Transparent
         Caption         =   "��������� ����� ��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblmadedate_to 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ������������ ��:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblmadeDate_from 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ������������ �:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblSertNum 
         BackStyle       =   0  'Transparent
         Caption         =   "����������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheFactory 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblTheDeveloper 
         BackStyle       =   0  'Transparent
         Caption         =   "�������������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   23
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblTheCountry 
         BackStyle       =   0  'Transparent
         Caption         =   "������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblQ_Quantity 
         BackStyle       =   0  'Transparent
         Caption         =   "���-�� � ������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblQ_Weight 
         BackStyle       =   0  'Transparent
         Caption         =   "���-�� � �����������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lbledizm 
         BackStyle       =   0  'Transparent
         Caption         =   "��. ���.:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTheCell 
         BackStyle       =   0  'Transparent
         Caption         =   "������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lbltheGood 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblpallet 
         BackStyle       =   0  'Transparent
         Caption         =   "�������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblInDocLine 
         BackStyle       =   0  'Transparent
         Caption         =   "������ �� ������:"
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
Attribute VB_Name = "wpStock_recordmain"
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

Private Sub txtInDocLine_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdInDocLine_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdInDocLine_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtpallet_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdpallet_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdpallet_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txttheGood_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdtheGood_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdtheGood_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtTheCell_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCell_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdTheCell_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtedizm_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdedizm_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdedizm_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtQ_Weight_Change()
  Changing

End Sub
Private Sub txtQ_Quantity_Change()
  Changing

End Sub
Private Sub txtTheCountry_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCountry_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdTheCountry_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtTheDeveloper_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDeveloper_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdTheDeveloper_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtTheFactory_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheFactory_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdTheFactory_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtSertNum_Change()
  Changing

End Sub
Private Sub dtpmadeDate_from_Change()
  Changing

End Sub
Private Sub dtpmadedate_to_Change()
  Changing

End Sub
Private Sub dtpexpdate_Change()
  Changing

End Sub
Private Sub dtpstopdate_Change()
  Changing

End Sub
Private Sub txtS1_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdS1_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdS1_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtS2_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdS2_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdS2_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtS3_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdS3_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdS3_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtS4_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdS4_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdS4_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtS5_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdS5_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdS5_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtD1_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdD1_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdD1_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtD2_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdD2_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdD2_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtD3_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdD3_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdD3_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtD4_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdD4_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdD4_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtD5_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdD5_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdD5_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmbIsBrak_Click()
  On Error Resume Next
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

If mIsOK Then mIsOK = txtInDocLine.Tag <> ""
If mIsOK Then mIsOK = txttheGood.Tag <> ""
If mIsOK Then mIsOK = txtedizm.Tag <> ""
If mIsOK Then mIsOK = (cmbIsBrak.ListIndex >= 0)
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

If Not Item.InDocLine Is Nothing Then
  txtInDocLine.Tag = Item.InDocLine.ID
  txtInDocLine = Item.InDocLine.Brief
Else
  txtInDocLine.Tag = ""
  txtInDocLine = ""
End If
 LoadBtnPictures cmdInDocLine, cmdInDocLine.Tag
  cmdInDocLine.RemoveAllMenu
  cmdInDocLine.AddMenu "��������"
If Not Item.pallet Is Nothing Then
  txtpallet.Tag = Item.pallet.ID
  txtpallet = Item.pallet.Brief
Else
  txtpallet.Tag = ""
  txtpallet = ""
End If
 LoadBtnPictures cmdpallet, cmdpallet.Tag
  cmdpallet.RemoveAllMenu
  cmdpallet.AddMenu "��������"
If Not Item.theGood Is Nothing Then
  txttheGood.Tag = Item.theGood.ID
  txttheGood = Item.theGood.Brief
Else
  txttheGood.Tag = ""
  txttheGood = ""
End If
 LoadBtnPictures cmdtheGood, cmdtheGood.Tag
  cmdtheGood.RemoveAllMenu
  cmdtheGood.AddMenu "��������"
If Not Item.TheCell Is Nothing Then
  txtTheCell.Tag = Item.TheCell.ID
  txtTheCell = Item.TheCell.Brief
Else
  txtTheCell.Tag = ""
  txtTheCell = ""
End If
 LoadBtnPictures cmdTheCell, cmdTheCell.Tag
  cmdTheCell.RemoveAllMenu
  cmdTheCell.AddMenu "��������"
If Not Item.edizm Is Nothing Then
  txtedizm.Tag = Item.edizm.ID
  txtedizm = Item.edizm.Brief
Else
  txtedizm.Tag = ""
  txtedizm = ""
End If
 LoadBtnPictures cmdedizm, cmdedizm.Tag
  cmdedizm.RemoveAllMenu
  cmdedizm.AddMenu "��������"
txtQ_Weight = Item.Q_Weight
txtQ_Quantity = Item.Q_Quantity
If Not Item.TheCountry Is Nothing Then
  txtTheCountry.Tag = Item.TheCountry.ID
  txtTheCountry = Item.TheCountry.Brief
Else
  txtTheCountry.Tag = ""
  txtTheCountry = ""
End If
 LoadBtnPictures cmdTheCountry, cmdTheCountry.Tag
  cmdTheCountry.RemoveAllMenu
  cmdTheCountry.AddMenu "��������"
If Not Item.TheDeveloper Is Nothing Then
  txtTheDeveloper.Tag = Item.TheDeveloper.ID
  txtTheDeveloper = Item.TheDeveloper.Brief
Else
  txtTheDeveloper.Tag = ""
  txtTheDeveloper = ""
End If
 LoadBtnPictures cmdTheDeveloper, cmdTheDeveloper.Tag
  cmdTheDeveloper.RemoveAllMenu
  cmdTheDeveloper.AddMenu "��������"
If Not Item.TheFactory Is Nothing Then
  txtTheFactory.Tag = Item.TheFactory.ID
  txtTheFactory = Item.TheFactory.Brief
Else
  txtTheFactory.Tag = ""
  txtTheFactory = ""
End If
 LoadBtnPictures cmdTheFactory, cmdTheFactory.Tag
  cmdTheFactory.RemoveAllMenu
  cmdTheFactory.AddMenu "��������"
  On Error Resume Next
txtSertNum = Item.SertNum
dtpmadeDate_from = Date
If Item.madeDate_from <> 0 Then
 dtpmadeDate_from = Item.madeDate_from
Else
 dtpmadeDate_from.Value = Null
End If
dtpmadedate_to = Date
If Item.madedate_to <> 0 Then
 dtpmadedate_to = Item.madedate_to
Else
 dtpmadedate_to.Value = Null
End If
dtpexpdate = Date
If Item.expdate <> 0 Then
 dtpexpdate = Item.expdate
Else
 dtpexpdate.Value = Null
End If
dtpstopdate = Date
If Item.stopdate <> 0 Then
 dtpstopdate = Item.stopdate
Else
 dtpstopdate.Value = Null
End If
If Not Item.S1 Is Nothing Then
  txtS1.Tag = Item.S1.ID
  txtS1 = Item.S1.Brief
Else
  txtS1.Tag = ""
  txtS1 = ""
End If
 LoadBtnPictures cmdS1, cmdS1.Tag
  cmdS1.RemoveAllMenu
  cmdS1.AddMenu "��������"
If Not Item.S2 Is Nothing Then
  txtS2.Tag = Item.S2.ID
  txtS2 = Item.S2.Brief
Else
  txtS2.Tag = ""
  txtS2 = ""
End If
 LoadBtnPictures cmdS2, cmdS2.Tag
  cmdS2.RemoveAllMenu
  cmdS2.AddMenu "��������"
If Not Item.S3 Is Nothing Then
  txtS3.Tag = Item.S3.ID
  txtS3 = Item.S3.Brief
Else
  txtS3.Tag = ""
  txtS3 = ""
End If
 LoadBtnPictures cmdS3, cmdS3.Tag
  cmdS3.RemoveAllMenu
  cmdS3.AddMenu "��������"
If Not Item.S4 Is Nothing Then
  txtS4.Tag = Item.S4.ID
  txtS4 = Item.S4.Brief
Else
  txtS4.Tag = ""
  txtS4 = ""
End If
 LoadBtnPictures cmdS4, cmdS4.Tag
  cmdS4.RemoveAllMenu
  cmdS4.AddMenu "��������"
If Not Item.S5 Is Nothing Then
  txtS5.Tag = Item.S5.ID
  txtS5 = Item.S5.Brief
Else
  txtS5.Tag = ""
  txtS5 = ""
End If
 LoadBtnPictures cmdS5, cmdS5.Tag
  cmdS5.RemoveAllMenu
  cmdS5.AddMenu "��������"
If Not Item.D1 Is Nothing Then
  txtD1.Tag = Item.D1.ID
  txtD1 = Item.D1.Brief
Else
  txtD1.Tag = ""
  txtD1 = ""
End If
 LoadBtnPictures cmdD1, cmdD1.Tag
  cmdD1.RemoveAllMenu
  cmdD1.AddMenu "��������"
If Not Item.D2 Is Nothing Then
  txtD2.Tag = Item.D2.ID
  txtD2 = Item.D2.Brief
Else
  txtD2.Tag = ""
  txtD2 = ""
End If
 LoadBtnPictures cmdD2, cmdD2.Tag
  cmdD2.RemoveAllMenu
  cmdD2.AddMenu "��������"
If Not Item.D3 Is Nothing Then
  txtD3.Tag = Item.D3.ID
  txtD3 = Item.D3.Brief
Else
  txtD3.Tag = ""
  txtD3 = ""
End If
 LoadBtnPictures cmdD3, cmdD3.Tag
  cmdD3.RemoveAllMenu
  cmdD3.AddMenu "��������"
If Not Item.D4 Is Nothing Then
  txtD4.Tag = Item.D4.ID
  txtD4 = Item.D4.Brief
Else
  txtD4.Tag = ""
  txtD4 = ""
End If
 LoadBtnPictures cmdD4, cmdD4.Tag
  cmdD4.RemoveAllMenu
  cmdD4.AddMenu "��������"
If Not Item.D5 Is Nothing Then
  txtD5.Tag = Item.D5.ID
  txtD5 = Item.D5.Brief
Else
  txtD5.Tag = ""
  txtD5 = ""
End If
 LoadBtnPictures cmdD5, cmdD5.Tag
  cmdD5.RemoveAllMenu
  cmdD5.AddMenu "��������"
cmbIsBrak.Clear
cmbIsBrak.AddItem "��"
cmbIsBrak.ItemData(cmbIsBrak.NewIndex) = -1
cmbIsBrak.AddItem "���"
cmbIsBrak.ItemData(cmbIsBrak.NewIndex) = 0
 For iii = 0 To cmbIsBrak.ListCount - 1
  If Item.IsBrak = cmbIsBrak.ItemData(iii) Then
   cmbIsBrak.ListIndex = iii
   Exit For
  End If
 Next
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



