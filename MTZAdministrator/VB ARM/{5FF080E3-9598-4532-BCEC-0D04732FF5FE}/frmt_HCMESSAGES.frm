VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmt_HCMESSAGES 
   Caption         =   "������ ��� ��������� � ��������� ���������"
   ClientHeight    =   3390
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3390
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
   Begin MSComctlLib.TabStrip ts 
      Height          =   1500
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   1
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "������"
      Height          =   330
      Left            =   0
      TabIndex        =   1
      ToolTipText     =   "����� �� ������� �������"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   750
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   330
      Left            =   0
      TabIndex        =   0
      ToolTipText     =   "��������� ������"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   750
   End
   Begin MTZ_PANEL.ScrolledWindow PanelfGroup 
      Height          =   1000
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin VB.TextBox txtQDay_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   18
         ToolTipText     =   "���� ������ ������ ��� �����"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblQDay_LE 
         Caption         =   "���� ������ ������ ��� �����:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtQDay_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   16
         ToolTipText     =   "���� ������ ������ ��� �����"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblQDay_GE 
         Caption         =   "���� ������ ������ ��� �����:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtQMonth_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   14
         ToolTipText     =   "����� ������ ������ ��� �����"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblQMonth_LE 
         Caption         =   "����� ������ ������ ��� �����:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtQMonth_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   12
         ToolTipText     =   "����� ������ ������ ��� �����"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblQMonth_GE 
         Caption         =   "����� ������ ������ ��� �����:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtQYear_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   10
         ToolTipText     =   "��� ������ ������ ��� �����"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblQYear_LE 
         Caption         =   "��� ������ ������ ��� �����:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtQYear_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   8
         ToolTipText     =   "��� ������ ������ ��� �����"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblQYear_GE 
         Caption         =   "��� ������ ������ ��� �����:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdID_BD 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "����������"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_BD 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "����������"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblID_BD 
         Caption         =   "����������:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   75
         Width           =   3000
      End
   End
   Begin VB.Menu mnuCtl 
      Caption         =   "mnuCtl"
      Visible         =   0   'False
      Begin VB.Menu mnuSetup 
         Caption         =   "���������"
      End
   End
End
Attribute VB_Name = "frmt_HCMESSAGES"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Public Item As Object
Public OK As Boolean
Private OnInit As Boolean
Public Event Changed()
Private TSCustom As MTZ_CUSTOMTAB.TabStripCustomizer







Private Sub cmdOK_Click()
    On Error Resume Next
    OK = True
    Me.Hide
End Sub
Private Sub cmdCancel_Click()
    On Error Resume Next
    OK = False
    Me.Hide
End Sub
Public Sub Init(ObjItem As Object)
 Set Item = ObjItem
 If Item Is Nothing Then Set Item = MyUser.Application
 TInit
End Sub
Private Sub Form_Load()
  On Error Resume Next
  Dim ff As Long, buf As String
  LoadFromSkin Me
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdok.Height
  cmdok.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdok.Width, cmdok.Height
  cmdcancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdcancel.Width, cmdok.Height
  If Item Is Nothing Then Init MyUser.Application
End Sub
Private Sub Form_Unload(cancel As Integer)
  On Error Resume Next
  Set Item = Nothing
  Set TSCustom = Nothing
  SaveToSkin Me
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
  cancel = -1
End Sub
Private Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdok.Height
  cmdok.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdok.Width, cmdok.Height
  cmdcancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdcancel.Width, cmdok.Height
  ts_click
End Sub
Private Sub mnuSetup_Click()
TSCustom.Setup ts
End Sub
Private Sub ts_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu mnuCtl
  End If
End Sub
Private Sub ts_click()
  On Error Resume Next
  panelfGroup.Visible = False

   Select Case ts.SelectedItem.Key
   Case "fGroup"
     With panelfGroup
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     End With
     End Select
End Sub
Private Sub TInit()
  On Error Resume Next
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "���������"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "t_HCMESSAGES", "fctlt_HCMESSAGES"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtID_BD_Change()
  Changing
End Sub
Private Sub cmdID_BD_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("BDEVICES", id, brief) Then
          txtID_BD.Tag = Left(id, 38)
          txtID_BD = brief
        End If
End Sub
Private Sub cmdID_BD_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtQYear_GE_Validate(cancel As Boolean)
If txtQYear_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQYear_GE.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtQYear_GE.Text) <> CLng(val(txtQYear_GE.Text)) Then
     cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtQYear_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQYear_GE_Change()
  Changing
End Sub
Private Sub txtQYear_LE_Validate(cancel As Boolean)
If txtQYear_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQYear_LE.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtQYear_LE.Text) <> CLng(val(txtQYear_LE.Text)) Then
     cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtQYear_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQYear_LE_Change()
  Changing
End Sub
Private Sub txtQMonth_GE_Validate(cancel As Boolean)
If txtQMonth_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQMonth_GE.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtQMonth_GE.Text) <> CLng(val(txtQMonth_GE.Text)) Then
     cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtQMonth_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQMonth_GE_Change()
  Changing
End Sub
Private Sub txtQMonth_LE_Validate(cancel As Boolean)
If txtQMonth_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQMonth_LE.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtQMonth_LE.Text) <> CLng(val(txtQMonth_LE.Text)) Then
     cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtQMonth_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQMonth_LE_Change()
  Changing
End Sub
Private Sub txtQDay_GE_Validate(cancel As Boolean)
If txtQDay_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQDay_GE.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtQDay_GE.Text) <> CLng(val(txtQDay_GE.Text)) Then
     cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtQDay_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQDay_GE_Change()
  Changing
End Sub
Private Sub txtQDay_LE_Validate(cancel As Boolean)
If txtQDay_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQDay_LE.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf val(txtQDay_LE.Text) <> CLng(val(txtQDay_LE.Text)) Then
     cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtQDay_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQDay_LE_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

  txtID_BD.Tag = ""
  txtID_BD = ""
 LoadBtnPictures cmdID_BD, cmdID_BD.Tag
  cmdID_BD.RemoveAllMenu
OnInit = False
End Sub



