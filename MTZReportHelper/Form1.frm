VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   4935
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6240
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4935
   ScaleWidth      =   6240
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtData 
      Height          =   375
      Left            =   360
      TabIndex        =   3
      Top             =   3120
      Width           =   3375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   975
      Left            =   360
      TabIndex        =   2
      Top             =   1440
      Width           =   1455
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   840
      Width           =   4095
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   120
      Width           =   4095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    Dim r As MTZReportHelper.TEmplatedDocument
    Set r = New MTZReportHelper.TEmplatedDocument
    r.MakeDocument Me, App.Path & "\template.doc", App.Path & "\test.doc"
    Set r = Nothing
End Sub

