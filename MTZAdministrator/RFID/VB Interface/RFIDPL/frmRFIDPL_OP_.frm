VERSION 5.00
Begin VB.Form frmRFIDPL_OP_ 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "�������� ��� ��������"
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
      Caption         =   "������"
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
      Top             =   6225
      Width           =   825
   End
   Begin RFIDPLGUI.RFIDPL_OP Panel 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
   End
End
Attribute VB_Name = "frmRFIDPL_OP_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 250
Option Explicit



   Public OK As Boolean
Attribute OK.VB_VarHelpID = 300
   Public item As Object
Attribute item.VB_VarHelpID = 290
   Public NotFirstTime As Boolean
Attribute NotFirstTime.VB_VarHelpID = 295






Sub cmdCancel_Click()
Attribute cmdCancel_Click.VB_HelpID = 255
OK = False
Me.Hide
End Sub

Sub cmdOK_Click()
Attribute cmdOK_Click.VB_HelpID = 260
 On Error GoTo bye
 If Panel.IsOK Then
   Panel.Save
   OK = True
   Me.Hide
 Else
   MsgBox "�� ��� ������������ ���� ���������", vbOKOnly + vbExclamation
 End If
bye:
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  On Error Resume Next
  'SaveToSkin
End Sub
Sub Form_Unload(Cancel As Integer)
Attribute Form_Unload.VB_HelpID = 285
      'SaveToSkin
End Sub
Sub Form_Resize()
Attribute Form_Resize.VB_HelpID = 280
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
Attribute Form_Load.VB_HelpID = 275
 Dim X As Single, Y As Single
 LoadFormSkin
 Panel.OptimalSize X, Y
 Me.Move Me.Left, Me.Top, X + Me.Panel.Left * 2 + 20 * Screen.TwipsPerPixelX, Me.Panel.Top + Y + cmdOK.Height + 40 * Screen.TwipsPerPixelX
 
End Sub
Sub form_DblCLick()
Attribute form_DblCLick.VB_HelpID = 270
 Panel.Customize
 SaveToSkin
End Sub
Sub panel_Changed()
Attribute panel_Changed.VB_HelpID = 310
 cmdOK.Enabled = True
End Sub
Sub Form_Activate()
Attribute Form_Activate.VB_HelpID = 265
 If NotFirstTime Then Exit Sub
 OnInit
 NotFirstTime = True
End Sub
Public Sub OnInit()
Attribute OnInit.VB_HelpID = 305
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
  Open s & Me.Name & "{2A2038B9-18ED-420A-A930-5AD41876D61C}" For Input As #ff
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
  Kill s & Me.Name & "{2A2038B9-18ED-420A-A930-5AD41876D61C}"
  Open s & Me.Name & "{2A2038B9-18ED-420A-A930-5AD41876D61C}" For Output As #ff
  Print #ff, Panel.PanelCustomisationString
  Close #ff
End Sub




