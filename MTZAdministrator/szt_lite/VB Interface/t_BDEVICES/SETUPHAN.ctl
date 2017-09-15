VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl SETUPHAN 
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
      Begin MSMask.MaskEdBox txtNUM24 
         Height          =   300
         Left            =   300
         TabIndex        =   16
         ToolTipText     =   "За сколько суток опрашивать суточные"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtNUMHOUR 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "За сколько часов опрашивать часовые"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.ComboBox cmbSAVESUM 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "Сохранять итоговые"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbSAVECURR 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Сохранять мгновенные"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbSAVEHOUR 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Сохранять часовые"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbSAVE24 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "Сохранять суточные"
         Top             =   1815
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtDISTSEC 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Интервал опроса мгновенных"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtMAXREAD1 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "К-во попыток считывания 1 параметра"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.Label lblNUM24 
         BackStyle       =   0  'Transparent
         Caption         =   "За сколько суток опрашивать суточные:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblNUMHOUR 
         BackStyle       =   0  'Transparent
         Caption         =   "За сколько часов опрашивать часовые:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblSAVESUM 
         BackStyle       =   0  'Transparent
         Caption         =   "Сохранять итоговые:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblSAVECURR 
         BackStyle       =   0  'Transparent
         Caption         =   "Сохранять мгновенные:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblSAVEHOUR 
         BackStyle       =   0  'Transparent
         Caption         =   "Сохранять часовые:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSAVE24 
         BackStyle       =   0  'Transparent
         Caption         =   "Сохранять суточные:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDISTSEC 
         BackStyle       =   0  'Transparent
         Caption         =   "Интервал опроса мгновенных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblMAXREAD1 
         BackStyle       =   0  'Transparent
         Caption         =   "К-во попыток считывания 1 параметра:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "SETUPHAN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Настройки ручного опроса
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

Private Sub txtMAXREAD1_Validate(cancel As Boolean)
If txtMAXREAD1.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMAXREAD1.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtMAXREAD1.SetFocus
  ElseIf Val(txtMAXREAD1.Text) < -922337203685478# Or Val(txtMAXREAD1.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtMAXREAD1.SetFocus
  End If
End If
End Sub
Private Sub txtMAXREAD1_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMAXREAD1_Change()
  Changing

End Sub
Private Sub txtDISTSEC_Validate(cancel As Boolean)
If txtDISTSEC.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDISTSEC.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDISTSEC.SetFocus
  ElseIf Val(txtDISTSEC.Text) < -922337203685478# Or Val(txtDISTSEC.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtDISTSEC.SetFocus
  End If
End If
End Sub
Private Sub txtDISTSEC_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDISTSEC_Change()
  Changing

End Sub
Private Sub cmbSAVE24_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbSAVEHOUR_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbSAVECURR_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbSAVESUM_Click()
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
  ElseIf Val(txtNUMHOUR.Text) < -922337203685478# Or Val(txtNUMHOUR.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
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
  ElseIf Val(txtNUM24.Text) < -922337203685478# Or Val(txtNUM24.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
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

txtMAXREAD1 = Item.MAXREAD1
txtDISTSEC = Item.DISTSEC
cmbSAVE24.Clear
cmbSAVE24.AddItem "Да"
cmbSAVE24.ItemData(cmbSAVE24.NewIndex) = -1
cmbSAVE24.AddItem "Нет"
cmbSAVE24.ItemData(cmbSAVE24.NewIndex) = 0
 For iii = 0 To cmbSAVE24.ListCount - 1
  If Item.SAVE24 = cmbSAVE24.ItemData(iii) Then
   cmbSAVE24.ListIndex = iii
   Exit For
  End If
 Next
cmbSAVEHOUR.Clear
cmbSAVEHOUR.AddItem "Да"
cmbSAVEHOUR.ItemData(cmbSAVEHOUR.NewIndex) = -1
cmbSAVEHOUR.AddItem "Нет"
cmbSAVEHOUR.ItemData(cmbSAVEHOUR.NewIndex) = 0
 For iii = 0 To cmbSAVEHOUR.ListCount - 1
  If Item.SAVEHOUR = cmbSAVEHOUR.ItemData(iii) Then
   cmbSAVEHOUR.ListIndex = iii
   Exit For
  End If
 Next
cmbSAVECURR.Clear
cmbSAVECURR.AddItem "Да"
cmbSAVECURR.ItemData(cmbSAVECURR.NewIndex) = -1
cmbSAVECURR.AddItem "Нет"
cmbSAVECURR.ItemData(cmbSAVECURR.NewIndex) = 0
 For iii = 0 To cmbSAVECURR.ListCount - 1
  If Item.SAVECURR = cmbSAVECURR.ItemData(iii) Then
   cmbSAVECURR.ListIndex = iii
   Exit For
  End If
 Next
cmbSAVESUM.Clear
cmbSAVESUM.AddItem "Да"
cmbSAVESUM.ItemData(cmbSAVESUM.NewIndex) = -1
cmbSAVESUM.AddItem "Нет"
cmbSAVESUM.ItemData(cmbSAVESUM.NewIndex) = 0
 For iii = 0 To cmbSAVESUM.ListCount - 1
  If Item.SAVESUM = cmbSAVESUM.ItemData(iii) Then
   cmbSAVESUM.ListIndex = iii
   Exit For
  End If
 Next
txtNUMHOUR = Item.NUMHOUR
txtNUM24 = Item.NUM24
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

Item.MAXREAD1 = CDbl(txtMAXREAD1)
Item.DISTSEC = CDbl(txtDISTSEC)
 If cmbSAVE24.ListIndex >= 0 Then
   Item.SAVE24 = cmbSAVE24.ItemData(cmbSAVE24.ListIndex)
 End If
 If cmbSAVEHOUR.ListIndex >= 0 Then
   Item.SAVEHOUR = cmbSAVEHOUR.ItemData(cmbSAVEHOUR.ListIndex)
 End If
 If cmbSAVECURR.ListIndex >= 0 Then
   Item.SAVECURR = cmbSAVECURR.ItemData(cmbSAVECURR.ListIndex)
 End If
 If cmbSAVESUM.ListIndex >= 0 Then
   Item.SAVESUM = cmbSAVESUM.ItemData(cmbSAVESUM.ListIndex)
 End If
Item.NUMHOUR = CDbl(txtNUMHOUR)
Item.NUM24 = CDbl(txtNUM24)
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



