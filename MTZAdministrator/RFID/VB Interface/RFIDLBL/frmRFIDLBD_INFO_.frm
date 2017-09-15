VERSION 5.00
Begin VB.Form frmRFIDLBD_INFO_ 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Метка"
   ClientHeight    =   6810
   ClientLeft      =   60
   ClientTop       =   330
   ClientWidth     =   9480
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6810
   ScaleWidth      =   9480
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      CausesValidation=   0   'False
      Height          =   345
      Left            =   2250
      TabIndex        =   2
      Top             =   6225
      Width           =   975
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Height          =   345
      Left            =   1275
      TabIndex        =   1
      ToolTipText     =   "Опсание метки"
      Top             =   6225
      Width           =   825
   End
   Begin RFIDLBLGUI.RFIDLBD_INFO Panel 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
   End
End
Attribute VB_Name = "frmRFIDLBD_INFO_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 120
Option Explicit



   Public OK As Boolean
Attribute OK.VB_VarHelpID = 170
   Public item As Object
Attribute item.VB_VarHelpID = 160
   Public NotFirstTime As Boolean
Attribute NotFirstTime.VB_VarHelpID = 165






Sub cmdCancel_Click()
Attribute cmdCancel_Click.VB_HelpID = 125
OK = False
Me.Hide
End Sub

Sub cmdOK_Click()
Attribute cmdOK_Click.VB_HelpID = 130
 On Error GoTo bye
 If Panel.IsOK Then
   Panel.Save
   OK = True
   Me.Hide
 Else
   MsgBox "Не все обязательные поля заполнены", vbOKOnly + vbExclamation
 End If
bye:
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  On Error Resume Next
  'SaveToSkin
End Sub
Sub Form_Unload(Cancel As Integer)
Attribute Form_Unload.VB_HelpID = 155
      'SaveToSkin
End Sub
Sub Form_Resize()
Attribute Form_Resize.VB_HelpID = 150
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
 Panel.Top = 0
 Panel.Left = 0
 cmdOK.Left = 0
 cmdCancel.Left = cmdOK.Width + 5 * Screen.TwipsPerPixelY
 cmdOK.Top = Me.ScaleHeight - cmdOK.Height
 cmdCancel.Top = Me.ScaleHeight - cmdCancel.Height
 Panel.Width = Me.ScaleWidth
 If (cmdOK.Visible) Then
    Panel.Height = cmdOK.Top - 3 * Screen.TwipsPerPixelY
 Else
    Panel.Height = Me.ScaleHeight - 3 * Screen.TwipsPerPixelY
 End If
End Sub
Sub Form_Load()
Attribute Form_Load.VB_HelpID = 145
 Dim X As Single, Y As Single
 LoadFormSkin
 Panel.OptimalSize X, Y
 Me.Move Me.Left, Me.Top, X + Me.Panel.Left * 2 + 20 * Screen.TwipsPerPixelX, Me.Panel.Top + Y + cmdOK.Height + 40 * Screen.TwipsPerPixelX
 
End Sub
Sub form_DblCLick()
Attribute form_DblCLick.VB_HelpID = 140
 Panel.Customize
 SaveToSkin
End Sub
Sub panel_Changed()
Attribute panel_Changed.VB_HelpID = 180
 cmdOK.Enabled = True
End Sub
Sub Form_Activate()
Attribute Form_Activate.VB_HelpID = 135
 If NotFirstTime Then Exit Sub
 OnInit
 NotFirstTime = True
End Sub
Public Sub OnInit()
Attribute OnInit.VB_HelpID = 175
 Set Panel.item = item
 Panel.InitPanel
 cmdOK.Enabled = False
End Sub
Private Sub LoadFormSkin()
  On Error Resume Next
  Dim s As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", App.Path & "\LAYOUTS\")
  SaveSetting "MTZ", "CONFIG", "LAYOUTS", s
  Dim ff As Long, buf As String
  ff = FreeFile
  Open s & Me.Name & "{151F7C93-CA24-45F2-9DC8-BE97BDE453BB}" For Input As #ff
  buf = Input(LOF(ff), ff)
  Close #ff
  If buf <> "" Then Panel.PanelCustomisationString = buf
End Sub

Private Sub SaveToSkin()
  On Error Resume Next
  Dim s As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", App.Path & "\LAYOUTS\")
  SaveSetting "MTZ", "CONFIG", "LAYOUTS", s
  Dim ff As Long
  ff = FreeFile
  Kill s & Me.Name & "{151F7C93-CA24-45F2-9DC8-BE97BDE453BB}"
  Open s & Me.Name & "{151F7C93-CA24-45F2-9DC8-BE97BDE453BB}" For Output As #ff
  Print #ff, Panel.PanelCustomisationString
  Close #ff
End Sub




