VERSION 5.00
Begin VB.Form frmEditLink 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Свойства перехода"
   ClientHeight    =   4470
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5985
   Icon            =   "frmEditLink.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4470
   ScaleWidth      =   5985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin WFDefGUI.ctlEditLink panel 
      Height          =   3705
      Left            =   105
      TabIndex        =   2
      Top             =   195
      Width           =   5805
      _ExtentX        =   10239
      _ExtentY        =   6535
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Height          =   345
      Left            =   105
      TabIndex        =   1
      ToolTipText     =   "Документы, которые используются в процессе"
      Top             =   4020
      Width           =   825
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      CausesValidation=   0   'False
      Height          =   345
      Left            =   1050
      TabIndex        =   0
      Top             =   4035
      Width           =   975
   End
End
Attribute VB_Name = "frmEditLink"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Public OK As Boolean
Public Item As Object
Public NotFirstTime As Boolean



Sub cmdCancel_Click()
OK = False
Me.Hide
End Sub

Sub cmdOK_Click()
 On Error GoTo bye
 
  Item.Save
  panel.Save
  OK = True
  Me.Hide

bye:
End Sub

Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
 panel.Top = 0
 panel.Left = 0
 cmdOK.Left = 0
 cmdCancel.Left = cmdOK.Width + 5 * Screen.TwipsPerPixelY
 cmdOK.Top = Me.ScaleHeight - cmdOK.Height
 cmdCancel.Top = Me.ScaleHeight - cmdCancel.Height
 panel.Width = Me.ScaleWidth
 panel.Height = cmdOK.Top - 3 * Screen.TwipsPerPixelY
End Sub
Sub Form_Load()
 
End Sub
Sub form_DblCLick()
End Sub
Sub panel_Changed()
 cmdOK.Enabled = True
End Sub
Sub form_Activate()
 If NotFirstTime Then Exit Sub
 OnInit
 NotFirstTime = True
End Sub
Public Sub OnInit()
 panel.OnInit Item
 panel.InitPanel
 'cmdOK.Enabled = False
End Sub



