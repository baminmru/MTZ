VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmProgress 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Состояние"
   ClientHeight    =   5370
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10470
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5370
   ScaleWidth      =   10470
   Begin VB.CommandButton Command3 
      Caption         =   "Подробнее..."
      Height          =   315
      Left            =   9150
      TabIndex        =   4
      Top             =   840
      Width           =   1175
   End
   Begin VB.CommandButton Command2 
      Caption         =   "ОК"
      Default         =   -1  'True
      Height          =   315
      Left            =   7860
      TabIndex        =   3
      Top             =   840
      Width           =   1175
   End
   Begin VB.CommandButton Command1 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   6600
      TabIndex        =   2
      Top             =   840
      Width           =   1175
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   375
      Left            =   90
      TabIndex        =   1
      Top             =   390
      Width           =   10245
      _ExtentX        =   18071
      _ExtentY        =   661
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.TextBox txtDetails 
      Height          =   5115
      Left            =   60
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Top             =   1230
      Width           =   10335
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Прогресс процесса:"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1545
   End
End
Attribute VB_Name = "frmProgress"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Details As Boolean
Public STOP_PROCESS As Boolean
Public IN_PROCESS As Boolean
Public MAX_VALUE As Long
Public MIN_VALUE As Long


Public Sub Start(min As Long, max As Long, LabelCaption As String, Message As String)
  
  
  txtDetails.Text = txtDetails.Text & vbCrLf & Message
  Label1.Caption = LabelCaption
  
  If (max > min) Then
    ProgressBar1.min = min
    ProgressBar1.max = max
    MAX_VALUE = max
    MIN_VALUE = min
  End If
  Show
  Details = False
  STOP_PROCESS = False
  Call Command3_Click
  
  DoEvents
End Sub

Public Sub Tick(NewValue As Long, Message As String)
  If (NewValue > ProgressBar1.min And NewValue <= ProgressBar1.max) Then
    ProgressBar1.Value = NewValue
    DoEvents
  End If
  txtDetails.Text = txtDetails.Text & vbCrLf & Message
  If (NewValue = MAX_VALUE) Then
    IN_PROCESS = False
  End If
End Sub

Private Sub Command1_Click()
  If (IN_PROCESS) Then
    STOP_PROCESS = True
    DoEvents
  Else
    Me.Hide
  End If
End Sub

Private Sub Command2_Click()
  Me.Hide
End Sub

Private Sub Command3_Click()
  If (Details) Then
    Me.Height = 6795
  Else
    Me.Height = 1605
  End If
  Details = Not Details
End Sub

Private Sub Form_Load()
  Details = False
  STOP_PROCESS = False
  Call Command3_Click
End Sub
