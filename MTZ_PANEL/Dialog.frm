VERSION 5.00
Begin VB.Form Dialog 
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   3090
   ClientLeft      =   2760
   ClientTop       =   3705
   ClientWidth     =   5355
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3090
   ScaleWidth      =   5355
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox chkEnabled 
      Caption         =   "Доступность на форме (Enabled)"
      Height          =   255
      Left            =   90
      TabIndex        =   8
      Top             =   1620
      Width           =   3375
   End
   Begin VB.CheckBox chkVisible 
      Caption         =   "Видимость на форме (Visible)"
      Height          =   255
      Left            =   90
      TabIndex        =   7
      Top             =   1320
      Width           =   3345
   End
   Begin VB.TextBox txtCaption 
      Height          =   285
      Left            =   1020
      TabIndex        =   10
      Top             =   1950
      Width           =   4275
   End
   Begin VB.TextBox txtTabIndex 
      BackColor       =   &H80000004&
      Height          =   285
      Left            =   2880
      Locked          =   -1  'True
      TabIndex        =   5
      Top             =   630
      Width           =   1095
   End
   Begin VB.CheckBox chkTabStop 
      Caption         =   "Остановка курсора (Tab Stop)"
      Height          =   255
      Left            =   90
      TabIndex        =   6
      Top             =   1020
      Width           =   3345
   End
   Begin VB.TextBox txtTag 
      Height          =   285
      Left            =   1020
      TabIndex        =   12
      Top             =   2280
      Width           =   4275
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   4110
      TabIndex        =   14
      Top             =   2730
      Width           =   1175
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   2850
      TabIndex        =   13
      Top             =   2730
      Width           =   1175
   End
   Begin VB.Label Label5 
      Caption         =   "Индекс:"
      Height          =   255
      Left            =   2880
      TabIndex        =   1
      Top             =   30
      Width           =   1335
   End
   Begin VB.Label Label4 
      Caption         =   "Название:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   30
      Width           =   2535
   End
   Begin VB.Label Label3 
      Caption         =   "Надпись:"
      Height          =   255
      Left            =   90
      TabIndex        =   9
      Top             =   1950
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Табуляция (индекс на форме)"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   660
      Width           =   2985
   End
   Begin VB.Label Label1 
      Caption         =   "Контейнер:"
      Height          =   255
      Left            =   90
      TabIndex        =   11
      Top             =   2280
      Width           =   975
   End
   Begin VB.Label lblIndex 
      BackColor       =   &H8000000B&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Index"
      Height          =   255
      Left            =   2880
      TabIndex        =   3
      Top             =   300
      Width           =   1695
   End
   Begin VB.Label lblName 
      BackColor       =   &H8000000B&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Name"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   300
      Width           =   2655
   End
End
Attribute VB_Name = "Dialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 145

Option Explicit
Public OK As Boolean
Attribute OK.VB_VarHelpID = 150
'настройка параметра конкретного контрола на панели


Private Sub CancelButton_Click()
Me.Hide
End Sub

Private Sub OKButton_Click()
OK = True
Me.Hide
End Sub
