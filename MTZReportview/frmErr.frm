VERSION 5.00
Begin VB.Form frmErr 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Описание ошибки"
   ClientHeight    =   5925
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5985
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5925
   ScaleWidth      =   5985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   390
      Left            =   2010
      TabIndex        =   2
      Top             =   5460
      Width           =   2160
   End
   Begin VB.TextBox txtout 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4425
      Left            =   180
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   960
      Width           =   5670
   End
   Begin VB.Label lblErr 
      BorderStyle     =   1  'Fixed Single
      Height          =   810
      Left            =   150
      TabIndex        =   1
      Top             =   30
      Width           =   5670
   End
End
Attribute VB_Name = "frmErr"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit





Public Sub SetErr(error_text As String, script As String)
  Dim i As Long
  Dim s() As String
  Dim out As String
  s = Split(script, vbCrLf)
 
  For i = LBound(s) To UBound(s)
    out = out & vbCrLf & Right("000000" & (i + 1), 6) & " " & s(i)
  Next
  txtout.Text = out
  lblErr = error_text
  Me.Show vbModal
End Sub

Private Sub Command1_Click()
  Unload Me
End Sub


