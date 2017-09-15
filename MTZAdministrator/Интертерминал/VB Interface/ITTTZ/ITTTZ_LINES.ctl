VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl ITTTZ_LINES 
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
      Begin VB.TextBox txtPartia 
         Height          =   300
         Left            =   3450
         MaxLength       =   6
         TabIndex        =   20
         ToolTipText     =   "Номер партии"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtSSCC 
         Height          =   300
         Left            =   300
         MaxLength       =   18
         TabIndex        =   18
         ToolTipText     =   "SSCC"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtEDIZM 
         Height          =   300
         Left            =   300
         MaxLength       =   3
         TabIndex        =   16
         ToolTipText     =   "Единица учета"
         Top             =   5340
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtQuantity 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Количество товаров на палете"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtTheArticul 
         Height          =   300
         Left            =   300
         MaxLength       =   8
         TabIndex        =   12
         ToolTipText     =   "Артикул товара"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtsequence 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   10
         ToolTipText     =   "Порядковый номер"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.TextBox txtSupplierCode 
         Height          =   300
         Left            =   300
         MaxLength       =   4
         TabIndex        =   8
         ToolTipText     =   "Код поставщика"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   8
         TabIndex        =   6
         ToolTipText     =   "Номер накладной"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFileLink 
         Height          =   300
         Left            =   300
         MaxLength       =   2
         TabIndex        =   4
         ToolTipText     =   "Признак привязки"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtDirection 
         Height          =   300
         Left            =   300
         MaxLength       =   1
         TabIndex        =   2
         ToolTipText     =   "Направление движения товара"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblPartia 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер партии:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblSSCC 
         BackStyle       =   0  'Transparent
         Caption         =   "SSCC:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Единица учета:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество товаров на палете:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheArticul 
         BackStyle       =   0  'Transparent
         Caption         =   "Артикул товара:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblsequence 
         BackStyle       =   0  'Transparent
         Caption         =   "Порядковый номер:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblSupplierCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Код поставщика:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер накладной:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFileLink 
         BackStyle       =   0  'Transparent
         Caption         =   "Признак привязки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDirection 
         BackStyle       =   0  'Transparent
         Caption         =   "Направление движения товара:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTTZ_LINES"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела
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

Private Sub txtDirection_Change()
  Changing

End Sub
Private Sub txtFileLink_Change()
  Changing

End Sub
Private Sub txtTheNumber_Change()
  Changing

End Sub
Private Sub txtSupplierCode_Change()
  Changing

End Sub
Private Sub txtsequence_Validate(cancel As Boolean)
If txtsequence.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtsequence.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtsequence.SetFocus
  ElseIf Val(txtsequence.Text) <> CLng(Val(txtsequence.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtsequence.SetFocus
  End If
End If
End Sub
Private Sub txtsequence_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtsequence_Change()
  Changing

End Sub
Private Sub txtTheArticul_Change()
  Changing

End Sub
Private Sub txtQuantity_Validate(cancel As Boolean)
If txtQuantity.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQuantity.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQuantity.SetFocus
  ElseIf Val(txtQuantity.Text) < -922337203685478# Or Val(txtQuantity.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQuantity.SetFocus
  End If
End If
End Sub
Private Sub txtQuantity_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQuantity_Change()
  Changing

End Sub
Private Sub txtEDIZM_Change()
  Changing

End Sub
Private Sub txtSSCC_Change()
  Changing

End Sub
Private Sub txtPartia_Change()
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

If mIsOK Then mIsOK = IsSet(txtDirection.Text)
If mIsOK Then mIsOK = IsSet(txtTheNumber.Text)
If mIsOK Then mIsOK = IsSet(txtSupplierCode.Text)
If mIsOK Then mIsOK = IsSet(txtsequence.Text)
If mIsOK Then mIsOK = IsSet(txtTheArticul.Text)
If mIsOK Then mIsOK = IsSet(txtQuantity.Text)
If mIsOK Then mIsOK = IsSet(txtEDIZM.Text)
If mIsOK Then mIsOK = IsSet(txtSSCC.Text)
If mIsOK Then mIsOK = IsSet(txtPartia.Text)
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
txtDirection = Item.Direction
  On Error Resume Next
txtFileLink = Item.FileLink
  On Error Resume Next
txtTheNumber = Item.TheNumber
  On Error Resume Next
txtSupplierCode = Item.SupplierCode
txtsequence = Item.sequence
  On Error Resume Next
txtTheArticul = Item.TheArticul
txtQuantity = Item.Quantity
  On Error Resume Next
txtEDIZM = Item.EDIZM
  On Error Resume Next
txtSSCC = Item.SSCC
  On Error Resume Next
txtPartia = Item.Partia
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

Item.Direction = txtDirection
Item.FileLink = txtFileLink
Item.TheNumber = txtTheNumber
Item.SupplierCode = txtSupplierCode
Item.sequence = CDbl(txtsequence)
Item.TheArticul = txtTheArticul
Item.Quantity = CDbl(txtQuantity)
Item.EDIZM = txtEDIZM
Item.SSCC = txtSSCC
Item.Partia = txtPartia
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



