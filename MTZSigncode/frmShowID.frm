VERSION 5.00
Begin VB.Form frmShowID 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Идентификатор документа"
   ClientHeight    =   2655
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2655
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   615
      Left            =   840
      TabIndex        =   1
      Top             =   1920
      Width           =   2895
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4455
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Height          =   1215
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   4455
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
