VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl CHARTSETTINGS 
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
      Begin MSMask.MaskEdBox txtWIDTHMAX 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "Толщина максимума"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtWIDTHMIN 
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         ToolTipText     =   "Толщина минимума"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtCOLORMAX 
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         ToolTipText     =   "Цвет максимума"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtCOLORMIN 
         Height          =   300
         Left            =   300
         TabIndex        =   18
         ToolTipText     =   "Цвет минимума"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.ComboBox cmbPARAM_ENABLE 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   16
         ToolTipText     =   "Разрешена"
         Top             =   5340
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtCOLOR 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Цвет"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtWIDTH 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Толщина"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtVALCOUNT 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Количество значений"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtVARNUM 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Количество значений"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtCHARTNUM 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "Номер графика 0-2"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtPNAME 
         Height          =   300
         Left            =   300
         MaxLength       =   128
         TabIndex        =   4
         ToolTipText     =   "Название параметра"
         Top             =   1110
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtPTYPE 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "Тип архива"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.Label lblWIDTHMAX 
         BackStyle       =   0  'Transparent
         Caption         =   "Толщина максимума:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblWIDTHMIN 
         BackStyle       =   0  'Transparent
         Caption         =   "Толщина минимума:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCOLORMAX 
         BackStyle       =   0  'Transparent
         Caption         =   "Цвет максимума:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblCOLORMIN 
         BackStyle       =   0  'Transparent
         Caption         =   "Цвет минимума:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblPARAM_ENABLE 
         BackStyle       =   0  'Transparent
         Caption         =   "Разрешена:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblCOLOR 
         BackStyle       =   0  'Transparent
         Caption         =   "Цвет:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblWIDTH 
         BackStyle       =   0  'Transparent
         Caption         =   "Толщина:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblVALCOUNT 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество значений:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblVARNUM 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество значений:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCHARTNUM 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер графика 0-2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPNAME 
         BackStyle       =   0  'Transparent
         Caption         =   "Название параметра:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPTYPE 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип архива:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "CHARTSETTINGS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Настройки графиков
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

Private Sub txtPTYPE_Validate(cancel As Boolean)
If txtPTYPE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPTYPE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPTYPE.SetFocus
  ElseIf Val(txtPTYPE.Text) < -922337203685478# Or Val(txtPTYPE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPTYPE.SetFocus
  End If
End If
End Sub
Private Sub txtPTYPE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPTYPE_Change()
  Changing

End Sub
Private Sub txtPNAME_Change()
  Changing

End Sub
Private Sub txtCHARTNUM_Validate(cancel As Boolean)
If txtCHARTNUM.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCHARTNUM.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCHARTNUM.SetFocus
  ElseIf Val(txtCHARTNUM.Text) < -922337203685478# Or Val(txtCHARTNUM.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCHARTNUM.SetFocus
  End If
End If
End Sub
Private Sub txtCHARTNUM_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCHARTNUM_Change()
  Changing

End Sub
Private Sub txtVARNUM_Validate(cancel As Boolean)
If txtVARNUM.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtVARNUM.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtVARNUM.SetFocus
  ElseIf Val(txtVARNUM.Text) < -922337203685478# Or Val(txtVARNUM.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtVARNUM.SetFocus
  End If
End If
End Sub
Private Sub txtVARNUM_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtVARNUM_Change()
  Changing

End Sub
Private Sub txtVALCOUNT_Validate(cancel As Boolean)
If txtVALCOUNT.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtVALCOUNT.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtVALCOUNT.SetFocus
  ElseIf Val(txtVALCOUNT.Text) < -922337203685478# Or Val(txtVALCOUNT.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtVALCOUNT.SetFocus
  End If
End If
End Sub
Private Sub txtVALCOUNT_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtVALCOUNT_Change()
  Changing

End Sub
Private Sub txtWIDTH_Validate(cancel As Boolean)
If txtWIDTH.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWIDTH.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWIDTH.SetFocus
  ElseIf Val(txtWIDTH.Text) < -922337203685478# Or Val(txtWIDTH.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWIDTH.SetFocus
  End If
End If
End Sub
Private Sub txtWIDTH_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWIDTH_Change()
  Changing

End Sub
Private Sub txtCOLOR_Validate(cancel As Boolean)
If txtCOLOR.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCOLOR.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCOLOR.SetFocus
  ElseIf Val(txtCOLOR.Text) < -922337203685478# Or Val(txtCOLOR.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCOLOR.SetFocus
  End If
End If
End Sub
Private Sub txtCOLOR_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCOLOR_Change()
  Changing

End Sub
Private Sub cmbPARAM_ENABLE_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCOLORMIN_Validate(cancel As Boolean)
If txtCOLORMIN.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCOLORMIN.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCOLORMIN.SetFocus
  ElseIf Val(txtCOLORMIN.Text) < -922337203685478# Or Val(txtCOLORMIN.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCOLORMIN.SetFocus
  End If
End If
End Sub
Private Sub txtCOLORMIN_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCOLORMIN_Change()
  Changing

End Sub
Private Sub txtCOLORMAX_Validate(cancel As Boolean)
If txtCOLORMAX.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCOLORMAX.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCOLORMAX.SetFocus
  ElseIf Val(txtCOLORMAX.Text) < -922337203685478# Or Val(txtCOLORMAX.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCOLORMAX.SetFocus
  End If
End If
End Sub
Private Sub txtCOLORMAX_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCOLORMAX_Change()
  Changing

End Sub
Private Sub txtWIDTHMIN_Validate(cancel As Boolean)
If txtWIDTHMIN.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWIDTHMIN.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWIDTHMIN.SetFocus
  ElseIf Val(txtWIDTHMIN.Text) < -922337203685478# Or Val(txtWIDTHMIN.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWIDTHMIN.SetFocus
  End If
End If
End Sub
Private Sub txtWIDTHMIN_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWIDTHMIN_Change()
  Changing

End Sub
Private Sub txtWIDTHMAX_Validate(cancel As Boolean)
If txtWIDTHMAX.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWIDTHMAX.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWIDTHMAX.SetFocus
  ElseIf Val(txtWIDTHMAX.Text) < -922337203685478# Or Val(txtWIDTHMAX.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWIDTHMAX.SetFocus
  End If
End If
End Sub
Private Sub txtWIDTHMAX_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWIDTHMAX_Change()
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

txtPTYPE = Item.PTYPE
  On Error Resume Next
txtPNAME = Item.PNAME
txtCHARTNUM = Item.CHARTNUM
txtVARNUM = Item.VARNUM
txtVALCOUNT = Item.VALCOUNT
txtWIDTH = Item.Width
txtCOLOR = Item.Color
cmbPARAM_ENABLE.Clear
cmbPARAM_ENABLE.AddItem "Да"
cmbPARAM_ENABLE.ItemData(cmbPARAM_ENABLE.NewIndex) = -1
cmbPARAM_ENABLE.AddItem "Нет"
cmbPARAM_ENABLE.ItemData(cmbPARAM_ENABLE.NewIndex) = 0
 For iii = 0 To cmbPARAM_ENABLE.ListCount - 1
  If Item.PARAM_ENABLE = cmbPARAM_ENABLE.ItemData(iii) Then
   cmbPARAM_ENABLE.ListIndex = iii
   Exit For
  End If
 Next
txtCOLORMIN = Item.COLORMIN
txtCOLORMAX = Item.COLORMAX
txtWIDTHMIN = Item.WIDTHMIN
txtWIDTHMAX = Item.WIDTHMAX
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

Item.PTYPE = CDbl(txtPTYPE)
Item.PNAME = txtPNAME
Item.CHARTNUM = CDbl(txtCHARTNUM)
Item.VARNUM = CDbl(txtVARNUM)
Item.VALCOUNT = CDbl(txtVALCOUNT)
Item.Width = CDbl(txtWIDTH)
Item.Color = CDbl(txtCOLOR)
 If cmbPARAM_ENABLE.ListIndex >= 0 Then
   Item.PARAM_ENABLE = cmbPARAM_ENABLE.ItemData(cmbPARAM_ENABLE.ListIndex)
 End If
Item.COLORMIN = CDbl(txtCOLORMIN)
Item.COLORMAX = CDbl(txtCOLORMAX)
Item.WIDTHMIN = CDbl(txtWIDTHMIN)
Item.WIDTHMAX = CDbl(txtWIDTHMAX)
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



