VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "About MyApp"
   ClientHeight    =   1665
   ClientLeft      =   2340
   ClientTop       =   1890
   ClientWidth     =   6450
   ClipControls    =   0   'False
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1149.212
   ScaleMode       =   0  'User
   ScaleWidth      =   6056.883
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   300
      Left            =   4230
      TabIndex        =   2
      Top             =   1350
      Width           =   1215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "© RBH,  www.realbh.ru, 2002 - 2005"
      Height          =   225
      Left            =   3270
      TabIndex        =   5
      Top             =   810
      Width           =   3135
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "info@realbh.ru"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   255
      Left            =   750
      TabIndex        =   4
      Top             =   1140
      Width           =   1185
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "(812) 921 - 00 -94"
      Height          =   195
      Left            =   3270
      TabIndex        =   3
      Top             =   1080
      Width           =   3135
      WordWrap        =   -1  'True
   End
   Begin VB.Image Image1 
      Height          =   1050
      Left            =   0
      Picture         =   "frmAbout.frx":000C
      Top             =   0
      Width           =   3225
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
      Height          =   465
      Left            =   3270
      TabIndex        =   1
      Top             =   30
      Width           =   3135
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblVersion 
      Alignment       =   2  'Center
      Caption         =   "Version"
      Height          =   225
      Left            =   3270
      TabIndex        =   0
      Top             =   540
      Width           =   3135
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



