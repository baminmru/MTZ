VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   2220
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3525
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2220
   ScaleWidth      =   3525
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   1680
      Top             =   360
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   615
      Left            =   240
      TabIndex        =   0
      Top             =   1200
      Width           =   2295
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   300
      Left            =   960
      Top             =   360
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   300
      Left            =   240
      Top             =   360
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim bg As WavePlayer
Dim fg As WavePlayer
Dim mx As Mixer
Dim lvl As Long
Dim AtMessage As Boolean

Private Sub Command1_Click()
If AtMessage Then Exit Sub
AtMessage = True
Timer1.Enabled = True
lvl = 65000
End Sub

Private Sub Form_Load()
Set mx = New Mixer
mx.FadeAll
Set bg = New WavePlayer
bg.OpenFile App.Path & "\bg.mp3"
mx.SetMaxVolume MainVol
mx.SetMaxVolume WaveVol
bg.Play

Set fg = New WavePlayer
Me.WindowState = 1
End Sub

Private Sub Form_Unload(Cancel As Integer)
mx.FadeAll
bg.StopPlaying
fg.StopPlaying
Set fg = Nothing
Set bg = Nothing
Set mx = Nothing
End Sub

Private Sub Timer1_Timer()
  lvl = lvl - 5000
  If lvl <= 0 Then
    lvl = 0
    Timer1.Enabled = False
    bg.Pause
    mx.SetMaxVolume WaveVol
    Dim T As Date
    T = Now
    While T = Now
      DoEvents
    Wend
    fg.OpenFile App.Path & "\test.wav"
    fg.Play True
    fg.OpenFile App.Path & "\test.MP3"
    fg.Play True
    fg.OpenFile App.Path & "\test.wav"
    fg.Play True
    T = Now
    While T = Now
      DoEvents
    Wend
    
    mx.SetVolume WaveVol, 0
    Timer2.Enabled = True
    bg.ResumePlay
    AtMessage = False
  Else
    mx.SetVolume WaveVol, lvl
  End If
End Sub

Private Sub Timer2_Timer()
  lvl = lvl + 5000
  If lvl >= 65000 Then
    lvl = 65000
    Timer2.Enabled = False
  End If
  mx.SetVolume WaveVol, lvl
End Sub


Private Sub Timer3_Timer()

Dim T As Date
T = Now
If Minute(T) Mod 3 = 0 Then
Command1_Click
End If

End Sub
