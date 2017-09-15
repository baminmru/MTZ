VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "msadodc.ocx"
Begin VB.Form frm1Cprogress 
   BorderStyle     =   0  'None
   ClientHeight    =   2925
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7335
   LinkTopic       =   "Form1"
   ScaleHeight     =   2925
   ScaleWidth      =   7335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   330
      Left            =   780
      Top             =   2160
      Width           =   4215
      _ExtentX        =   7435
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   1
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\BAMI\PEKAPPS\HSNPEK\report.mdb;Persist Security Info=False"
      OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\BAMI\PEKAPPS\HSNPEK\report.mdb;Persist Security Info=False"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   ""
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Height          =   1815
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   7095
      Begin MSComctlLib.ProgressBar pb 
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   1200
         Width           =   6855
         _ExtentX        =   12091
         _ExtentY        =   661
         _Version        =   393216
         Appearance      =   1
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "Обмен данными с 1С"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   120
         Width           =   6735
      End
      Begin VB.Label lblProgress 
         BorderStyle     =   1  'Fixed Single
         Height          =   615
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   6855
         WordWrap        =   -1  'True
      End
   End
End
Attribute VB_Name = "frm1Cprogress"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

