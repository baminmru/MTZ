VERSION 5.00
Begin VB.Form frmShowID 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Идентификатор документа"
   ClientHeight    =   2295
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2295
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   3390
      TabIndex        =   2
      Top             =   1920
      Width           =   1175
   End
   Begin VB.TextBox Text1 
      Height          =   585
      Left            =   30
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   30
      Width           =   4575
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Height          =   1140
      Left            =   60
      TabIndex        =   1
      Top             =   675
      Width           =   4545
   End
End
Attribute VB_Name = "frmShowID"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  Unload Me
End Sub
