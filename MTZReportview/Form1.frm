VERSION 5.00
Object = "{6F4A3F32-DE09-4640-BFE3-F08B85DDD531}#2.0#0"; "MTZRV.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4530
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6420
   LinkTopic       =   "Form1"
   ScaleHeight     =   4530
   ScaleWidth      =   6420
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   255
      Left            =   1410
      TabIndex        =   2
      Top             =   90
      Width           =   1185
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   240
      Left            =   285
      TabIndex        =   1
      Top             =   75
      Width           =   960
   End
   Begin MTzRepView.ReportView rv 
      Height          =   4245
      Left            =   105
      TabIndex        =   0
      Top             =   420
      Width           =   6105
      _extentx        =   10769
      _extenty        =   7488
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
rv.Reset
rv.ProcessReport App.Path & "\test.asp"
End Sub

Private Sub Command2_Click()
rv.prepare App.Path & "\test.asp"
End Sub
