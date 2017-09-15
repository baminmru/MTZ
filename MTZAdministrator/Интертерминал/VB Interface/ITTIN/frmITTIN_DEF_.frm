VERSION 5.00
Begin VB.Form frmITTIN_DEF_ 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Описание"
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
      Top             =   6225
      Width           =   825
   End
   Begin ITTINGUI.ITTIN_DEF Panel 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
   End
End
Attribute VB_Name = "frmITTIN_DEF_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


' Форма редактирования раздела ITTIN_DEF режим
   Public OK As Boolean
   Public item As Object
   Public NotFirstTime As Boolean






Sub cmdCancel_Click()
OK = False
Me.Hide
End Sub

Sub cmdOK_Click()
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
Sub form_Unload(Cancel As Integer)
      'SaveToSkin
End Sub
Sub form_resize()
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
Sub form_load()
 Dim x As Single, y As Single
 LoadFormSkin
 Panel.OptimalSize x, y
 Me.Move Me.Left, Me.Top, x + Me.Panel.Left * 2 + 20 * Screen.TwipsPerPixelX, Me.Panel.Top + y + cmdOK.Height + 40 * Screen.TwipsPerPixelX
 
End Sub
Sub form_DblCLick()
 Panel.Customize
 SaveToSkin
End Sub
Sub panel_Changed()
 cmdOK.Enabled = True
End Sub
Sub form_Activate()
 If NotFirstTime Then Exit Sub
 OnInit
 NotFirstTime = True
End Sub

'Инициализация формы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnInit()
Public Sub OnInit()
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
  Open s & Me.Name & "{7D6C4F1B-02CC-40CA-A3F5-77A32CB0FFD6}" For Input As #ff
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
  Kill s & Me.Name & "{7D6C4F1B-02CC-40CA-A3F5-77A32CB0FFD6}"
  Open s & Me.Name & "{7D6C4F1B-02CC-40CA-A3F5-77A32CB0FFD6}" For Output As #ff
  Print #ff, Panel.PanelCustomisationString
  Close #ff
End Sub




