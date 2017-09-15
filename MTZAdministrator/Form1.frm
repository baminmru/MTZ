VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "GetData Test"
   ClientHeight    =   3540
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3540
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   975
      Left            =   600
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   2
      Top             =   2280
      Width           =   3615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "GetData"
      Height          =   375
      Left            =   600
      TabIndex        =   1
      Top             =   1440
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      Height          =   735
      Left            =   600
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   600
      Width           =   3615
   End
   Begin VB.Label Label2 
      Caption         =   "Error MSG"
      Height          =   255
      Left            =   600
      TabIndex        =   4
      Top             =   1920
      Width           =   1695
   End
   Begin VB.Label Label1 
      Caption         =   "Data Query"
      Height          =   375
      Left            =   600
      TabIndex        =   3
      Top             =   120
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
Dim nv As NamedValues
Set nv = New NamedValues
On Error Resume Next
'Session.Exec Text1.Text, nv
Session.GetData (Text1.Text)
If Err.Number <> 0 Then
  Text2.Text = Err.Description
End If

End Sub
