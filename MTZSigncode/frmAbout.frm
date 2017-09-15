VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "About MyApp"
   ClientHeight    =   4290
   ClientLeft      =   2340
   ClientTop       =   1890
   ClientWidth     =   8760
   ClipControls    =   0   'False
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2961.034
   ScaleMode       =   0  'User
   ScaleWidth      =   8226.093
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   4800
      TabIndex        =   0
      Top             =   3840
      Width           =   3660
   End
   Begin VB.Image Image1 
      Height          =   4095
      Left            =   120
      Picture         =   "frmAbout.frx":000C
      Stretch         =   -1  'True
      Top             =   120
      Width           =   4545
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "© Michael M. Baranov,  www.murometz.spb.ru"
      Height          =   375
      Left            =   4680
      TabIndex        =   3
      Top             =   3240
      Width           =   3975
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Администратор"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   20.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   4680
      TabIndex        =   2
      Top             =   120
      Width           =   3975
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblVersion 
      Alignment       =   2  'Center
      Caption         =   "Version"
      Height          =   225
      Left            =   4680
      TabIndex        =   1
      Top             =   1560
      Width           =   3885
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()
  Unload Me
End Sub

Private Sub Form_Load()
    Me.Caption = "О программе: " & App.Title
    lblVersion.Caption = "Версия " & App.Major & "." & App.Minor & "." & App.Revision
    'lblTitle.Caption = App.Title
End Sub



