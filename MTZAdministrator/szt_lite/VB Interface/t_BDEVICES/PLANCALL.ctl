VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PLANCALL 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   1000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin VB.ComboBox cmbMUSTREPEATHOUR 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   52
         ToolTipText     =   "Требование повтора съема часовых"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.ComboBox cmbMUSTREPEATDAY 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   50
         ToolTipText     =   "Требование повтора съема суточных"
         Top             =   4635
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDLASTHOUR 
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         ToolTipText     =   "Дата последнего опроса часовых"
         Top             =   3930
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   79953923
         CurrentDate     =   39975
      End
      Begin MSComCtl2.DTPicker dtpDLASTDAY 
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         ToolTipText     =   "Дата последнего опроса суточных"
         Top             =   3225
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   79953923
         CurrentDate     =   39975
      End
      Begin MSComCtl2.DTPicker dtpDLASTCALL 
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         ToolTipText     =   "Дата последнего опроса счетчика"
         Top             =   2520
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   79953923
         CurrentDate     =   39975
      End
      Begin MSComCtl2.DTPicker dtpDNEXTSUM 
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         ToolTipText     =   "Дата следующего опроса тотальных"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   79953923
         CurrentDate     =   39975
      End
      Begin MSComCtl2.DTPicker dtpDNEXTCURR 
         Height          =   300
         Left            =   6600
         TabIndex        =   40
         ToolTipText     =   "Дата следующего опроса мгновенных"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   79953923
         CurrentDate     =   39975
      End
      Begin MSComCtl2.DTPicker dtpDNEXT24 
         Height          =   300
         Left            =   6600
         TabIndex        =   38
         ToolTipText     =   "Дата следующего опроса суточных"
         Top             =   405
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   79953923
         CurrentDate     =   39975
      End
      Begin MSComCtl2.DTPicker dtpDNEXTHOUR 
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         ToolTipText     =   "Дата следующего опроса часовых"
         Top             =   6045
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   79953923
         CurrentDate     =   39975
      End
      Begin VB.ComboBox cmbC24NRONLY 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   34
         ToolTipText     =   "Только непрочитанные часовые"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.ComboBox cmbCHNRONLY 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   32
         ToolTipText     =   "Только непрочитанные суточные"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtICALLSUM 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   30
         ToolTipText     =   "Интервал опроса (минут) тотальных"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.TextBox txtICALLCURR 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   28
         ToolTipText     =   "Интервал опроса (минут) мгновенных"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.TextBox txtICALL24 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   26
         ToolTipText     =   "Интервал опроса (часов) суточных"
         Top             =   2520
         Width           =   1800
      End
      Begin MSComCtl2.DTPicker dtpDLOCK 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "Когда заблокирован"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   79953923
         CurrentDate     =   39975
      End
      Begin VB.TextBox txtMINREPEAT 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   22
         ToolTipText     =   "При неудачом дозвоне повторить через (минут)"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.TextBox txtNMAXCALL 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   20
         ToolTipText     =   "Max число попыток дозвона"
         Top             =   405
         Width           =   1800
      End
      Begin VB.TextBox txtNUM24 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   18
         ToolTipText     =   "За сколько суток опрашивать суточные"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.TextBox txtNUMHOUR 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   16
         ToolTipText     =   "За сколько часов опрашивать часовые"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.ComboBox cmbCSUM 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   14
         ToolTipText     =   "опрашивать итоговые"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.ComboBox cmbC24 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "опрашивать суточные"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbCHOUR 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "опрашивать часовые"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbCCURR 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "опрашивать текущие"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtNUMCALL 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   6
         ToolTipText     =   "Сколько раз опросить (0 - циклический опрос)"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.TextBox txtICALL 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   4
         ToolTipText     =   "Интервал опроса (минут) часовых"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.TextBox txtCSTATUS 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Блокировка"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblMUSTREPEATHOUR 
         BackStyle       =   0  'Transparent
         Caption         =   "Требование повтора съема часовых:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblMUSTREPEATDAY 
         BackStyle       =   0  'Transparent
         Caption         =   "Требование повтора съема суточных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   49
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblDLASTHOUR 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата последнего опроса часовых:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDLASTDAY 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата последнего опроса суточных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblDLASTCALL 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата последнего опроса счетчика:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblDNEXTSUM 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата следующего опроса тотальных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   41
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDNEXTCURR 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата следующего опроса мгновенных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   39
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDNEXT24 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата следующего опроса суточных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   37
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblDNEXTHOUR 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата следующего опроса часовых:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblC24NRONLY 
         BackStyle       =   0  'Transparent
         Caption         =   "Только непрочитанные часовые:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblCHNRONLY 
         BackStyle       =   0  'Transparent
         Caption         =   "Только непрочитанные суточные:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblICALLSUM 
         BackStyle       =   0  'Transparent
         Caption         =   "Интервал опроса (минут) тотальных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblICALLCURR 
         BackStyle       =   0  'Transparent
         Caption         =   "Интервал опроса (минут) мгновенных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblICALL24 
         BackStyle       =   0  'Transparent
         Caption         =   "Интервал опроса (часов) суточных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblDLOCK 
         BackStyle       =   0  'Transparent
         Caption         =   "Когда заблокирован:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblMINREPEAT 
         BackStyle       =   0  'Transparent
         Caption         =   "При неудачом дозвоне повторить через (минут):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblNMAXCALL 
         BackStyle       =   0  'Transparent
         Caption         =   "Max число попыток дозвона:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblNUM24 
         BackStyle       =   0  'Transparent
         Caption         =   "За сколько суток опрашивать суточные:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblNUMHOUR 
         BackStyle       =   0  'Transparent
         Caption         =   "За сколько часов опрашивать часовые:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblCSUM 
         BackStyle       =   0  'Transparent
         Caption         =   "опрашивать итоговые:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblC24 
         BackStyle       =   0  'Transparent
         Caption         =   "опрашивать суточные:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblCHOUR 
         BackStyle       =   0  'Transparent
         Caption         =   "опрашивать часовые:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCCURR 
         BackStyle       =   0  'Transparent
         Caption         =   "опрашивать текущие:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblNUMCALL 
         BackStyle       =   0  'Transparent
         Caption         =   "Сколько раз опросить (0 - циклический опрос):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblICALL 
         BackStyle       =   0  'Transparent
         Caption         =   "Интервал опроса (минут) часовых:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCSTATUS 
         BackStyle       =   0  'Transparent
         Caption         =   "Блокировка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PLANCALL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела План опроса устройств
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean






'Функция поиска строки
'Parameters:
'[IN][OUT]  Runner , тип параметра: mtzmanager.main,
'[IN]   TypeName , тип параметра: String,
'[IN][OUT]   ID , тип параметра: string,
'[IN][OUT]   Brief , тип параметра: string,
'[IN][OUT]   Cancel , тип параметра: boolean  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.findObject(...параметры...)
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, cancel)
bye:
findObject = result
End Function

'Признак изменения строки
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
'  variable = me.IsChanged()
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtCSTATUS_Validate(cancel As Boolean)
If txtCSTATUS.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCSTATUS.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCSTATUS.SetFocus
  ElseIf Val(txtCSTATUS.Text) <> CLng(Val(txtCSTATUS.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtCSTATUS.SetFocus
  End If
End If
End Sub
Private Sub txtCSTATUS_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCSTATUS_Change()
  Changing

End Sub
Private Sub txtICALL_Validate(cancel As Boolean)
If txtICALL.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtICALL.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtICALL.SetFocus
  ElseIf Val(txtICALL.Text) <> CLng(Val(txtICALL.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtICALL.SetFocus
  End If
End If
End Sub
Private Sub txtICALL_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtICALL_Change()
  Changing

End Sub
Private Sub txtNUMCALL_Validate(cancel As Boolean)
If txtNUMCALL.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNUMCALL.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtNUMCALL.SetFocus
  ElseIf Val(txtNUMCALL.Text) <> CLng(Val(txtNUMCALL.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtNUMCALL.SetFocus
  End If
End If
End Sub
Private Sub txtNUMCALL_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNUMCALL_Change()
  Changing

End Sub
Private Sub cmbCCURR_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbCHOUR_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbC24_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbCSUM_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtNUMHOUR_Validate(cancel As Boolean)
If txtNUMHOUR.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNUMHOUR.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtNUMHOUR.SetFocus
  ElseIf Val(txtNUMHOUR.Text) <> CLng(Val(txtNUMHOUR.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtNUMHOUR.SetFocus
  End If
End If
End Sub
Private Sub txtNUMHOUR_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNUMHOUR_Change()
  Changing

End Sub
Private Sub txtNUM24_Validate(cancel As Boolean)
If txtNUM24.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNUM24.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtNUM24.SetFocus
  ElseIf Val(txtNUM24.Text) <> CLng(Val(txtNUM24.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtNUM24.SetFocus
  End If
End If
End Sub
Private Sub txtNUM24_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNUM24_Change()
  Changing

End Sub
Private Sub txtNMAXCALL_Validate(cancel As Boolean)
If txtNMAXCALL.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNMAXCALL.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtNMAXCALL.SetFocus
  ElseIf Val(txtNMAXCALL.Text) <> CLng(Val(txtNMAXCALL.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtNMAXCALL.SetFocus
  End If
End If
End Sub
Private Sub txtNMAXCALL_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNMAXCALL_Change()
  Changing

End Sub
Private Sub txtMINREPEAT_Validate(cancel As Boolean)
If txtMINREPEAT.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMINREPEAT.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtMINREPEAT.SetFocus
  ElseIf Val(txtMINREPEAT.Text) <> CLng(Val(txtMINREPEAT.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtMINREPEAT.SetFocus
  End If
End If
End Sub
Private Sub txtMINREPEAT_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMINREPEAT_Change()
  Changing

End Sub
Private Sub dtpDLOCK_Change()
  Changing

End Sub
Private Sub txtICALL24_Validate(cancel As Boolean)
If txtICALL24.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtICALL24.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtICALL24.SetFocus
  ElseIf Val(txtICALL24.Text) <> CLng(Val(txtICALL24.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtICALL24.SetFocus
  End If
End If
End Sub
Private Sub txtICALL24_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtICALL24_Change()
  Changing

End Sub
Private Sub txtICALLCURR_Validate(cancel As Boolean)
If txtICALLCURR.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtICALLCURR.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtICALLCURR.SetFocus
  ElseIf Val(txtICALLCURR.Text) <> CLng(Val(txtICALLCURR.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtICALLCURR.SetFocus
  End If
End If
End Sub
Private Sub txtICALLCURR_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtICALLCURR_Change()
  Changing

End Sub
Private Sub txtICALLSUM_Validate(cancel As Boolean)
If txtICALLSUM.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtICALLSUM.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtICALLSUM.SetFocus
  ElseIf Val(txtICALLSUM.Text) <> CLng(Val(txtICALLSUM.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtICALLSUM.SetFocus
  End If
End If
End Sub
Private Sub txtICALLSUM_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtICALLSUM_Change()
  Changing

End Sub
Private Sub cmbCHNRONLY_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbC24NRONLY_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub dtpDNEXTHOUR_Change()
  Changing

End Sub
Private Sub dtpDNEXT24_Change()
  Changing

End Sub
Private Sub dtpDNEXTCURR_Change()
  Changing

End Sub
Private Sub dtpDNEXTSUM_Change()
  Changing

End Sub
Private Sub dtpDLASTCALL_Change()
  Changing

End Sub
Private Sub dtpDLASTDAY_Change()
  Changing

End Sub
Private Sub dtpDLASTHOUR_Change()
  Changing

End Sub
Private Sub cmbMUSTREPEATDAY_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbMUSTREPEATHOUR_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub

'Контроль правильности заполнения данных на панели редактирования
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.IsOK()
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

  IsOK = mIsOK
End Function
Private Function AddSQLRefIds(ByVal strTo As String, ByVal fldName As String, ByVal strFrom As String) As String
  Dim XMLDocFrom As New DOMDocument
  Dim XMLDocTo As New DOMDocument
  AddSQLRefIds = strTo
  On Error GoTo err
  Call XMLDocTo.loadXML(strTo)
  Call XMLDocFrom.loadXML(strFrom)
  Dim Node As MSXML2.IXMLDOMNode
  Dim ID As String
  For Each Node In XMLDocFrom.childNodes.Item(0).childNodes
    If (Node.baseName = "ID") Then
      ID = Node.Text
      Dim NodeTO As MSXML2.IXMLDOMNode
      Dim bAdded As Boolean
      bAdded = False
      For Each NodeTO In XMLDocTo.childNodes.Item(0).childNodes
       If (NodeTO.baseName = fldName & "ID") Then
         NodeTO.Text = ID
         bAdded = True
         Exit For
       End If
      Next
      If (Not bAdded) Then
       Dim newNode As MSXML2.IXMLDOMNode
       Set newNode = XMLDocTo.createNode(MSXML2.NODE_ELEMENT, fldName & "ID", XMLDocTo.namespaceURI)
        newNode.Text = ID
       Call XMLDocTo.childNodes.Item(0).appendChild(newNode)
      End If
      AddSQLRefIds = XMLDocTo.xml
      Exit For
    End If
  Next
err:
End Function

'Инициализация контролов панели
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.InitPanel()
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

txtCSTATUS = Item.CSTATUS
txtICALL = Item.ICALL
txtNUMCALL = Item.NUMCALL
cmbCCURR.Clear
cmbCCURR.AddItem "Да"
cmbCCURR.ItemData(cmbCCURR.NewIndex) = -1
cmbCCURR.AddItem "Нет"
cmbCCURR.ItemData(cmbCCURR.NewIndex) = 0
 For iii = 0 To cmbCCURR.ListCount - 1
  If Item.CCURR = cmbCCURR.ItemData(iii) Then
   cmbCCURR.ListIndex = iii
   Exit For
  End If
 Next
cmbCHOUR.Clear
cmbCHOUR.AddItem "Да"
cmbCHOUR.ItemData(cmbCHOUR.NewIndex) = -1
cmbCHOUR.AddItem "Нет"
cmbCHOUR.ItemData(cmbCHOUR.NewIndex) = 0
 For iii = 0 To cmbCHOUR.ListCount - 1
  If Item.CHOUR = cmbCHOUR.ItemData(iii) Then
   cmbCHOUR.ListIndex = iii
   Exit For
  End If
 Next
cmbC24.Clear
cmbC24.AddItem "Да"
cmbC24.ItemData(cmbC24.NewIndex) = -1
cmbC24.AddItem "Нет"
cmbC24.ItemData(cmbC24.NewIndex) = 0
 For iii = 0 To cmbC24.ListCount - 1
  If Item.C24 = cmbC24.ItemData(iii) Then
   cmbC24.ListIndex = iii
   Exit For
  End If
 Next
cmbCSUM.Clear
cmbCSUM.AddItem "Да"
cmbCSUM.ItemData(cmbCSUM.NewIndex) = -1
cmbCSUM.AddItem "Нет"
cmbCSUM.ItemData(cmbCSUM.NewIndex) = 0
 For iii = 0 To cmbCSUM.ListCount - 1
  If Item.CSUM = cmbCSUM.ItemData(iii) Then
   cmbCSUM.ListIndex = iii
   Exit For
  End If
 Next
txtNUMHOUR = Item.NUMHOUR
txtNUM24 = Item.NUM24
txtNMAXCALL = Item.NMAXCALL
txtMINREPEAT = Item.MINREPEAT
dtpDLOCK = Now
If Item.DLOCK <> 0 Then
 dtpDLOCK = Item.DLOCK
Else
 dtpDLOCK.Value = Null
End If
txtICALL24 = Item.ICALL24
txtICALLCURR = Item.ICALLCURR
txtICALLSUM = Item.ICALLSUM
cmbCHNRONLY.Clear
cmbCHNRONLY.AddItem "Да"
cmbCHNRONLY.ItemData(cmbCHNRONLY.NewIndex) = -1
cmbCHNRONLY.AddItem "Нет"
cmbCHNRONLY.ItemData(cmbCHNRONLY.NewIndex) = 0
 For iii = 0 To cmbCHNRONLY.ListCount - 1
  If Item.CHNRONLY = cmbCHNRONLY.ItemData(iii) Then
   cmbCHNRONLY.ListIndex = iii
   Exit For
  End If
 Next
cmbC24NRONLY.Clear
cmbC24NRONLY.AddItem "Да"
cmbC24NRONLY.ItemData(cmbC24NRONLY.NewIndex) = -1
cmbC24NRONLY.AddItem "Нет"
cmbC24NRONLY.ItemData(cmbC24NRONLY.NewIndex) = 0
 For iii = 0 To cmbC24NRONLY.ListCount - 1
  If Item.C24NRONLY = cmbC24NRONLY.ItemData(iii) Then
   cmbC24NRONLY.ListIndex = iii
   Exit For
  End If
 Next
dtpDNEXTHOUR = Now
If Item.DNEXTHOUR <> 0 Then
 dtpDNEXTHOUR = Item.DNEXTHOUR
Else
 dtpDNEXTHOUR.Value = Null
End If
dtpDNEXT24 = Now
If Item.DNEXT24 <> 0 Then
 dtpDNEXT24 = Item.DNEXT24
Else
 dtpDNEXT24.Value = Null
End If
dtpDNEXTCURR = Now
If Item.DNEXTCURR <> 0 Then
 dtpDNEXTCURR = Item.DNEXTCURR
Else
 dtpDNEXTCURR.Value = Null
End If
dtpDNEXTSUM = Now
If Item.DNEXTSUM <> 0 Then
 dtpDNEXTSUM = Item.DNEXTSUM
Else
 dtpDNEXTSUM.Value = Null
End If
dtpDLASTCALL = Now
If Item.DLASTCALL <> 0 Then
 dtpDLASTCALL = Item.DLASTCALL
Else
 dtpDLASTCALL.Value = Null
End If
dtpDLASTDAY = Now
If Item.DLASTDAY <> 0 Then
 dtpDLASTDAY = Item.DLASTDAY
Else
 dtpDLASTDAY.Value = Null
End If
dtpDLASTHOUR = Now
If Item.DLASTHOUR <> 0 Then
 dtpDLASTHOUR = Item.DLASTHOUR
Else
 dtpDLASTHOUR.Value = Null
End If
cmbMUSTREPEATDAY.Clear
cmbMUSTREPEATDAY.AddItem "Да"
cmbMUSTREPEATDAY.ItemData(cmbMUSTREPEATDAY.NewIndex) = -1
cmbMUSTREPEATDAY.AddItem "Нет"
cmbMUSTREPEATDAY.ItemData(cmbMUSTREPEATDAY.NewIndex) = 0
 For iii = 0 To cmbMUSTREPEATDAY.ListCount - 1
  If Item.MUSTREPEATDAY = cmbMUSTREPEATDAY.ItemData(iii) Then
   cmbMUSTREPEATDAY.ListIndex = iii
   Exit For
  End If
 Next
cmbMUSTREPEATHOUR.Clear
cmbMUSTREPEATHOUR.AddItem "Да"
cmbMUSTREPEATHOUR.ItemData(cmbMUSTREPEATHOUR.NewIndex) = -1
cmbMUSTREPEATHOUR.AddItem "Нет"
cmbMUSTREPEATHOUR.ItemData(cmbMUSTREPEATHOUR.NewIndex) = 0
 For iii = 0 To cmbMUSTREPEATHOUR.ListCount - 1
  If Item.MUSTREPEATHOUR = cmbMUSTREPEATHOUR.ItemData(iii) Then
   cmbMUSTREPEATHOUR.ListIndex = iii
   Exit For
  End If
 Next
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub

'Сохранение
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Save({параметры})
Public Sub Save()
If OnInit Then Exit Sub

Item.CSTATUS = CDbl(txtCSTATUS)
Item.ICALL = CDbl(txtICALL)
Item.NUMCALL = CDbl(txtNUMCALL)
 If cmbCCURR.ListIndex >= 0 Then
   Item.CCURR = cmbCCURR.ItemData(cmbCCURR.ListIndex)
 End If
 If cmbCHOUR.ListIndex >= 0 Then
   Item.CHOUR = cmbCHOUR.ItemData(cmbCHOUR.ListIndex)
 End If
 If cmbC24.ListIndex >= 0 Then
   Item.C24 = cmbC24.ItemData(cmbC24.ListIndex)
 End If
 If cmbCSUM.ListIndex >= 0 Then
   Item.CSUM = cmbCSUM.ItemData(cmbCSUM.ListIndex)
 End If
Item.NUMHOUR = CDbl(txtNUMHOUR)
Item.NUM24 = CDbl(txtNUM24)
Item.NMAXCALL = CDbl(txtNMAXCALL)
Item.MINREPEAT = CDbl(txtMINREPEAT)
  If IsNull(dtpDLOCK) Then
    Item.DLOCK = 0
  Else
    Item.DLOCK = dtpDLOCK.Value
  End If
Item.ICALL24 = CDbl(txtICALL24)
Item.ICALLCURR = CDbl(txtICALLCURR)
Item.ICALLSUM = CDbl(txtICALLSUM)
 If cmbCHNRONLY.ListIndex >= 0 Then
   Item.CHNRONLY = cmbCHNRONLY.ItemData(cmbCHNRONLY.ListIndex)
 End If
 If cmbC24NRONLY.ListIndex >= 0 Then
   Item.C24NRONLY = cmbC24NRONLY.ItemData(cmbC24NRONLY.ListIndex)
 End If
  If IsNull(dtpDNEXTHOUR) Then
    Item.DNEXTHOUR = 0
  Else
    Item.DNEXTHOUR = dtpDNEXTHOUR.Value
  End If
  If IsNull(dtpDNEXT24) Then
    Item.DNEXT24 = 0
  Else
    Item.DNEXT24 = dtpDNEXT24.Value
  End If
  If IsNull(dtpDNEXTCURR) Then
    Item.DNEXTCURR = 0
  Else
    Item.DNEXTCURR = dtpDNEXTCURR.Value
  End If
  If IsNull(dtpDNEXTSUM) Then
    Item.DNEXTSUM = 0
  Else
    Item.DNEXTSUM = dtpDNEXTSUM.Value
  End If
  If IsNull(dtpDLASTCALL) Then
    Item.DLASTCALL = 0
  Else
    Item.DLASTCALL = dtpDLASTCALL.Value
  End If
  If IsNull(dtpDLASTDAY) Then
    Item.DLASTDAY = 0
  Else
    Item.DLASTDAY = dtpDLASTDAY.Value
  End If
  If IsNull(dtpDLASTHOUR) Then
    Item.DLASTHOUR = 0
  Else
    Item.DLASTHOUR = dtpDLASTHOUR.Value
  End If
 If cmbMUSTREPEATDAY.ListIndex >= 0 Then
   Item.MUSTREPEATDAY = cmbMUSTREPEATDAY.ItemData(cmbMUSTREPEATDAY.ListIndex)
 End If
 If cmbMUSTREPEATHOUR.ListIndex >= 0 Then
   Item.MUSTREPEATHOUR = cmbMUSTREPEATHOUR.ItemData(cmbMUSTREPEATHOUR.ListIndex)
 End If
 mIsChanged = False
 RaiseEvent Changed
End Sub

'Подбор размера панели по размеру контролов
'Parameters:
'[IN][OUT]  x , тип параметра: Single,
'[IN][OUT]   y , тип параметра: single  - ...
'See Also:
'Example:
'  call me.OptimalSize({параметры})
 Public Sub OptimalSize(x As Single, y As Single)
   Panel.OptimalSize x, y
   x = x + Panel.Left
   y = y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim x As Single, y As Single
   Panel.OptimalSize x, y
   OptimalY = y
 End Function

'Открытие окна настройки панели
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
   Panel.Customize
 End Sub

'Строка положения контролов на панели для сохранения позиций
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. PanelCustomisationString
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property

'Восстановление  позиций контролов из строки
'Parameters:
'[IN][OUT]  s , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. PanelCustomisationString = value
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property

'Разрешения изменений контролов
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Enabled
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property

'Запрет \ Разрешение изменений контролов
'Parameters:
'[IN]   v , тип параметра: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. Enabled = value
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



