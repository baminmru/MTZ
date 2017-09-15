VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3525
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3525
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtOutProvider 
      Height          =   315
      Left            =   255
      TabIndex        =   6
      Top             =   2865
      Width           =   4185
   End
   Begin VB.TextBox txtOutCN 
      Height          =   330
      Left            =   255
      TabIndex        =   2
      Top             =   2085
      Width           =   4125
   End
   Begin VB.TextBox txtSite 
      Height          =   345
      Left            =   510
      TabIndex        =   1
      Top             =   675
      Width           =   3270
   End
   Begin VB.CommandButton cmdTest 
      Caption         =   "Test"
      Height          =   600
      Left            =   870
      TabIndex        =   0
      Top             =   1170
      Width           =   2595
   End
   Begin VB.Label Provider 
      Caption         =   "Provider"
      Height          =   285
      Left            =   270
      TabIndex        =   5
      Top             =   2580
      Width           =   2235
   End
   Begin VB.Label Label2 
      Caption         =   "CN"
      Height          =   255
      Left            =   270
      TabIndex        =   4
      Top             =   1860
      Width           =   1710
   End
   Begin VB.Label Label1 
      Caption         =   "Сайт"
      Height          =   285
      Left            =   570
      TabIndex        =   3
      Top             =   390
      Width           =   3180
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdTest_Click()
  Dim obj As Object, sCN As String, sPR As String
  Set obj = CreateObject("MTZRemoteConnector.ConnectInfo")
  Call obj.GetConnectString(txtSite, sCN, sPR)
  txtOutCN = sCN
  txtOutProvider = sPR
End Sub

