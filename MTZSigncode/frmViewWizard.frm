VERSION 5.00
Begin VB.Form frmWizard 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Строим запросы"
   ClientHeight    =   4890
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6510
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4890
   ScaleWidth      =   6510
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox ppp 
      BorderStyle     =   0  'None
      Height          =   4215
      Left            =   120
      ScaleHeight     =   4215
      ScaleWidth      =   6255
      TabIndex        =   4
      Top             =   120
      Width           =   6255
      Begin MTZSignCode.ctlViewStep3 ctlViewStep31 
         Height          =   2415
         Left            =   1080
         TabIndex        =   7
         Top             =   1080
         Visible         =   0   'False
         Width           =   5055
         _ExtentX        =   4683
         _ExtentY        =   2143
      End
      Begin MTZSignCode.ctlViewStep2 ctlViewStep21 
         Height          =   1575
         Left            =   3600
         TabIndex        =   6
         Top             =   240
         Visible         =   0   'False
         Width           =   2535
         _ExtentX        =   4471
         _ExtentY        =   2778
      End
      Begin MTZSignCode.ctlViewStep1 ctlViewStep11 
         Height          =   1575
         Left            =   480
         TabIndex        =   5
         Top             =   240
         Visible         =   0   'False
         Width           =   2295
         _ExtentX        =   4048
         _ExtentY        =   2778
      End
      Begin VB.Label Label1 
         Caption         =   "Нажмите Finish, чтобы сохранить запрос"
         Height          =   495
         Left            =   1200
         TabIndex        =   8
         Top             =   1920
         Width           =   4335
      End
   End
   Begin VB.CommandButton cmdNav 
      Caption         =   "Cancel"
      Height          =   375
      Index           =   1
      Left            =   120
      TabIndex        =   3
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton cmdNav 
      Caption         =   "< Back"
      Enabled         =   0   'False
      Height          =   375
      Index           =   2
      Left            =   2520
      TabIndex        =   2
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton cmdNav 
      Caption         =   "Next >"
      Height          =   375
      Index           =   3
      Left            =   3840
      TabIndex        =   1
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton cmdNav 
      Caption         =   "Finish"
      Enabled         =   0   'False
      Height          =   375
      Index           =   4
      Left            =   5160
      TabIndex        =   0
      Top             =   4440
      Width           =   1215
   End
End
Attribute VB_Name = "frmWizard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private StepNo As Long
Dim CurCtl As Object



Private Sub ShowStep()
ctlViewStep11.Visible = False
ctlViewStep21.Visible = False
ctlViewStep31.Visible = False

If StepNo = 1 Then
Set CurCtl = ctlViewStep11
  Me.Caption = "Выбор базового раздела"
End If
If StepNo = 2 Then
Set CurCtl = ctlViewStep21
  Me.Caption = "Выбор полей запроса"
  End If
If StepNo = 3 Then
  Set CurCtl = ctlViewStep31
  Me.Caption = "Название запроса"
End If
If StepNo = 4 Then
  Set CurCtl = Nothing
  Me.Caption = "Сохранение запроса"
End If

If Not CurCtl Is Nothing Then
  CurCtl.OnInit
  CurCtl.Visible = True
  CurCtl.Top = 0
  CurCtl.Left = 0
  CurCtl.Width = ppp.Width
  CurCtl.Height = ppp.Height
End If

End Sub


Private Sub cmdNav_Click(Index As Integer)
If Index = 1 Then
  Unload Me
  Exit Sub
End If
If Index = 2 Then
  StepNo = StepNo - 1
  cmdNav(3).Enabled = True
  If StepNo <= 1 Then
    StepNo = 1
    cmdNav(2).Enabled = False
  End If
  ShowStep
  Exit Sub
End If
If Index = 3 Then
  If CurCtl.OnNext Then
    StepNo = StepNo + 1
    cmdNav(2).Enabled = True
    If StepNo >= 4 Then
    StepNo = 4
    cmdNav(3).Enabled = False
    cmdNav(4).Enabled = True
    End If
    ShowStep
  End If
  Exit Sub
End If
If Index = 4 Then
  If StepNo = 4 Then
    Me.Caption = "Сохраняется запрос..."
    DoEvents
    SaveView
    Unload Me
  End If
End If
End Sub

Private Sub Form_Load()
StepNo = 1
ShowStep
End Sub
