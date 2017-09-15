VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl wpDic_EDIZMmain 
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
      Begin VB.ComboBox cmbIsQuantityUnit 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "Количественная единица"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbWeightInDoc 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Вес в заказе"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtUnitToQuantity 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   8
         ToolTipText     =   "Шт. в единице"
         Top             =   2520
         Width           =   1800
      End
      Begin MSMask.MaskEdBox txtUnitToWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "Кг. в единице"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtTheName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTheCode 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   2
         ToolTipText     =   "Код"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblIsQuantityUnit 
         BackStyle       =   0  'Transparent
         Caption         =   "Количественная единица:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblWeightInDoc 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес в заказе:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblUnitToQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Шт. в единице:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblUnitToWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Кг. в единице:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Код:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "wpDic_EDIZMmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Единицы изменрения
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

Private Sub txtTheCode_Change()
  Changing

End Sub
Private Sub txtTheName_Change()
  Changing

End Sub
Private Sub txtUnitToWeight_Validate(cancel As Boolean)
If txtUnitToWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtUnitToWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtUnitToWeight.SetFocus
  ElseIf Val(txtUnitToWeight.Text) < -922337203685478# Or Val(txtUnitToWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtUnitToWeight.SetFocus
  End If
End If
End Sub
Private Sub txtUnitToWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtUnitToWeight_Change()
  Changing

End Sub
Private Sub txtUnitToQuantity_Validate(cancel As Boolean)
If txtUnitToQuantity.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtUnitToQuantity.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtUnitToQuantity.SetFocus
  ElseIf Val(txtUnitToQuantity.Text) <> CLng(Val(txtUnitToQuantity.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtUnitToQuantity.SetFocus
  End If
End If
End Sub
Private Sub txtUnitToQuantity_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtUnitToQuantity_Change()
  Changing

End Sub
Private Sub cmbWeightInDoc_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsQuantityUnit_Click()
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

If mIsOK Then mIsOK = IsSet(txtTheCode.Text)
If mIsOK Then mIsOK = (cmbWeightInDoc.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbIsQuantityUnit.ListIndex >= 0)
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

  On Error Resume Next
txtTheCode = Item.TheCode
  On Error Resume Next
txtTheName = Item.TheName
txtUnitToWeight = Item.UnitToWeight
txtUnitToQuantity = Item.UnitToQuantity
cmbWeightInDoc.Clear
cmbWeightInDoc.AddItem "Да"
cmbWeightInDoc.ItemData(cmbWeightInDoc.NewIndex) = -1
cmbWeightInDoc.AddItem "Нет"
cmbWeightInDoc.ItemData(cmbWeightInDoc.NewIndex) = 0
 For iii = 0 To cmbWeightInDoc.ListCount - 1
  If Item.WeightInDoc = cmbWeightInDoc.ItemData(iii) Then
   cmbWeightInDoc.ListIndex = iii
   Exit For
  End If
 Next
cmbIsQuantityUnit.Clear
cmbIsQuantityUnit.AddItem "Да"
cmbIsQuantityUnit.ItemData(cmbIsQuantityUnit.NewIndex) = -1
cmbIsQuantityUnit.AddItem "Нет"
cmbIsQuantityUnit.ItemData(cmbIsQuantityUnit.NewIndex) = 0
 For iii = 0 To cmbIsQuantityUnit.ListCount - 1
  If Item.IsQuantityUnit = cmbIsQuantityUnit.ItemData(iii) Then
   cmbIsQuantityUnit.ListIndex = iii
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

Item.TheCode = txtTheCode
Item.TheName = txtTheName
Item.UnitToWeight = CDbl(txtUnitToWeight)
Item.UnitToQuantity = CDbl(txtUnitToQuantity)
 If cmbWeightInDoc.ListIndex >= 0 Then
   Item.WeightInDoc = cmbWeightInDoc.ItemData(cmbWeightInDoc.ListIndex)
 End If
 If cmbIsQuantityUnit.ListIndex >= 0 Then
   Item.IsQuantityUnit = cmbIsQuantityUnit.ItemData(cmbIsQuantityUnit.ListIndex)
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



