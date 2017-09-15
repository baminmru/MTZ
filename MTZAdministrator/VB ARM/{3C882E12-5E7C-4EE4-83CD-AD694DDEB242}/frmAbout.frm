VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About MyApp"
   ClientHeight    =   4380
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   5460
   ClipControls    =   0   'False
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3023.153
   ScaleMode       =   0  'User
   ScaleWidth      =   5127.222
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   3600
      TabIndex        =   0
      Top             =   3960
      Width           =   1260
   End
   Begin VB.Label lblVersion 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Version"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   3120
      Width           =   5295
   End
   Begin VB.Label Label2 
      Caption         =   "© 2004-2006"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   3960
      Width           =   3375
   End
   Begin VB.Label lblProductName 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "app_name"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   36
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   1695
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   5055
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
  lblVersion.Caption = "Version " & App.Major & "." & App.Minor & "." & App.Revision
  lblProductName.Caption = App.Title
End Sub



Private Sub Label1_Click()

End Sub
