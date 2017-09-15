VERSION 5.00
Begin VB.Form frmWFFD_DOCS_ 
   Caption         =   "Документы для шага"
   ClientHeight    =   6795
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9480
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   ScaleHeight     =   6795
   ScaleWidth      =   9480
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
      ToolTipText     =   "Документы. которые необходимо обработать в рамках шага"
      Top             =   6225
      Width           =   825
   End
   Begin WFFDGUI.WFFD_DOCS Panel 
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      _ExtentX        =   15875
      _ExtentY        =   10583
   End
End
Attribute VB_Name = "frmWFFD_DOCS_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



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
 Panel.Height = cmdOK.Top - 3 * Screen.TwipsPerPixelY
End Sub
Sub form_load()
 Dim x As Single, y As Single
 LoadIcon
 LoadFormSkin Me
 Panel.OptimalSize x, y
 Me.Move Me.Left, Me.Top, x + Me.Panel.Left * 2 + 20 * Screen.TwipsPerPixelX, Me.Panel.Top + y + cmdOK.Height + 40 * Screen.TwipsPerPixelX
 
End Sub
Sub form_DblCLick()
 Panel.Customize
 SaveToSkin Me
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
 Set Panel.item = item
 Panel.InitPanel
 cmdOK.Enabled = False
End Sub
Private Sub LoadFormSkin(frm As Form)
  On Error Resume Next
  Dim s As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  Dim ff As Long, buf As String
  ff = FreeFile
  Open s & frm.Name For Input As #ff
  buf = Input(LOF(ff), ff)
  Close #ff
  frm.Panel.PanelCustomisationString = buf
End Sub

Private Sub SaveToSkin(frm As Form)
  On Error Resume Next
  Dim s As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  Dim ff As Long
  ff = FreeFile
  Kill s & frm.Name
  Open s & frm.Name For Output As #ff
  Print #ff, frm.Panel.PanelCustomisationString
  Close #ff
End Sub

Private Sub LoadIcon()
  On Error Resume Next
  Dim s As String
  s = GetSetting("MTZ", "CONFIG", "IMAGEPATH", "")
  If s = "" Then Exit Sub
  Set Me.Icon = LoadPicture(s & "\card.ico")
End Sub



