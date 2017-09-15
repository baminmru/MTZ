VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   660
      Left            =   3615
      TabIndex        =   2
      Top             =   720
      Width           =   735
   End
   Begin VB.TextBox Text2 
      Height          =   555
      Left            =   60
      TabIndex        =   1
      Top             =   1155
      Width           =   3270
   End
   Begin VB.TextBox Text1 
      Height          =   675
      Left            =   75
      TabIndex        =   0
      Text            =   "Th=%T Year=%Y Quarter=%Q Month=%M Day=%D  Org=%O Parent=%P  App=%A"
      Top             =   210
      Width           =   3285
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub Command1_Click()
Dim id1 As testid
Set id1 = New testid
Dim id2 As testid
Set id2 = New testid
Dim id3 As testid
Set id3 = New testid
id3.Id = "mama"
id2.Id = "papa"
id1.Id = "children"
Set id1.Parent = id2
Set id1.Application = id3

'Text2 = MakeNumString(Now, Text1.Text, "test")
Text2 = MakeItemNumString(id1, Now, Text1.Text, "test")
End Sub

