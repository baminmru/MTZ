VERSION 5.00
Begin VB.Form frmWizard 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Создание запроса"
   ClientHeight    =   4890
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6435
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4890
   ScaleWidth      =   6435
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox ppp 
      BorderStyle     =   0  'None
      Height          =   4215
      Left            =   90
      ScaleHeight     =   4215
      ScaleWidth      =   6255
      TabIndex        =   4
      Top             =   30
      Width           =   6255
      Begin MTZAdministrator.ctlViewStep3 ctlViewStep31 
         Height          =   3435
         Left            =   840
         TabIndex        =   7
         Top             =   240
         Visible         =   0   'False
         Width           =   5055
         _extentx        =   4683
         _extenty        =   2143
      End
      Begin MTZAdministrator.ctlViewStep2 ctlViewStep21 
         Height          =   1575
         Left            =   3600
         TabIndex        =   6
         Top             =   240
         Visible         =   0   'False
         Width           =   2535
         _extentx        =   4471
         _extenty        =   2778
      End
      Begin MTZAdministrator.ctlViewStep1 ctlViewStep11 
         Height          =   1575
         Left            =   480
         TabIndex        =   5
         Top             =   240
         Visible         =   0   'False
         Width           =   2295
         _extentx        =   4048
         _extenty        =   2778
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
      Caption         =   "Отмена"
      Height          =   315
      Index           =   1
      Left            =   120
      TabIndex        =   3
      Top             =   4440
      Width           =   1175
   End
   Begin VB.CommandButton cmdNav 
      Caption         =   "< Назад"
      Enabled         =   0   'False
      Height          =   315
      Index           =   2
      Left            =   2520
      TabIndex        =   2
      Top             =   4440
      Width           =   1175
   End
   Begin VB.CommandButton cmdNav 
      Caption         =   "Вперёд >"
      Height          =   315
      Index           =   3
      Left            =   3720
      TabIndex        =   1
      Top             =   4440
      Width           =   1175
   End
   Begin VB.CommandButton cmdNav 
      Caption         =   "Завершить"
      Enabled         =   0   'False
      Height          =   315
      Index           =   4
      Left            =   5160
      TabIndex        =   0
      Top             =   4440
      Width           =   1175
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
Set ViewForChange = Nothing
StepNo = 1
ShowStep
End Sub
