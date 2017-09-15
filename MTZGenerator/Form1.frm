VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6675
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8040
   LinkTopic       =   "Form1"
   ScaleHeight     =   6675
   ScaleWidth      =   8040
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   555
      Left            =   3870
      TabIndex        =   8
      Top             =   2760
      Width           =   1335
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   1425
      TabIndex        =   4
      Text            =   "Text3"
      Top             =   3285
      Width           =   2175
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1410
      TabIndex        =   3
      Text            =   "Text2"
      Top             =   2835
      Width           =   2205
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1410
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   2385
      Width           =   2190
   End
   Begin RichTextLib.RichTextBox text_out 
      Height          =   2295
      Left            =   315
      TabIndex        =   1
      Top             =   4170
      Width           =   7305
      _ExtentX        =   12885
      _ExtentY        =   4048
      _Version        =   393217
      Enabled         =   -1  'True
      TextRTF         =   $"Form1.frx":0000
   End
   Begin RichTextLib.RichTextBox text_in 
      Height          =   1830
      Left            =   270
      TabIndex        =   0
      Top             =   270
      Width           =   7140
      _ExtentX        =   12594
      _ExtentY        =   3228
      _Version        =   393217
      Enabled         =   -1  'True
      TextRTF         =   $"Form1.frx":0084
   End
   Begin VB.Label Label3 
      Caption         =   "Label3"
      Height          =   285
      Left            =   150
      TabIndex        =   7
      Top             =   3300
      Width           =   1080
   End
   Begin VB.Label Label2 
      Caption         =   "Label2"
      Height          =   255
      Left            =   195
      TabIndex        =   6
      Top             =   2820
      Width           =   1155
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   285
      Left            =   240
      TabIndex        =   5
      Top             =   2385
      Width           =   1020
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim pre As Preprocessor

Private Sub Command1_Click()
text_out.Text = pre.Convert(text_in.Text)
End Sub

Private Sub Form_Load()
Set pre = New Preprocessor
pre.OpenCode = "<%"
pre.CloseCode = "%>"
pre.OuputClass = ""
pre.OutFunc = "Data = Data & vbcrlf & "
pre.OutNLFunc = "Data = Data & vbcrlf & "
End Sub
