VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl ViewColumn 
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
      Begin VB.ComboBox cmbForCombo 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   18
         ToolTipText     =   "Для комбо"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.TextBox txtExpression 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   16
         ToolTipText     =   "Формула"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.ComboBox cmbAggregation 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   14
         ToolTipText     =   "Агрегация"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdField 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поле"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtField 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Поле"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdFromPart 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Раздел"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFromPart 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Раздел"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtthe_Alias 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   6
         ToolTipText     =   "Псвдоним"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtsequence 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "№ "
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblForCombo 
         BackStyle       =   0  'Transparent
         Caption         =   "Для комбо:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblExpression 
         BackStyle       =   0  'Transparent
         Caption         =   "Формула:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblAggregation 
         BackStyle       =   0  'Transparent
         Caption         =   "Агрегация:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblField 
         BackStyle       =   0  'Transparent
         Caption         =   "Поле:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFromPart 
         BackStyle       =   0  'Transparent
         Caption         =   "Раздел:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblthe_Alias 
         BackStyle       =   0  'Transparent
         Caption         =   "Псвдоним:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblsequence 
         BackStyle       =   0  'Transparent
         Caption         =   "№ :"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ViewColumn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Колонка пердставления
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
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, cancel)
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
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtthe_Alias_Change()
  Changing

End Sub
Private Sub txtFromPart_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFromPart_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PART", ID, brief) Then
          txtFromPart.Tag = Left(ID, 38)
          txtFromPart = brief
        End If
End Sub
Private Sub cmdFromPart_MenuClick(ByVal sCaption As String)
          txtFromPart.Tag = ""
          txtFromPart = ""
End Sub
Private Sub txtField_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdField_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("FIELD", ID, brief, Item.Application.ID) Then
          txtField.Tag = Left(ID, 38)
          txtField = brief
        End If
End Sub
Private Sub cmdField_MenuClick(ByVal sCaption As String)
          txtField.Tag = ""
          txtField = ""
End Sub
Private Sub cmbAggregation_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtExpression_Change()
  Changing

End Sub
Private Sub cmbForCombo_Click()
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

If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = IsSet(txtthe_Alias.Text)
If mIsOK Then mIsOK = txtFromPart.Tag <> ""
If mIsOK Then mIsOK = txtField.Tag <> ""
If mIsOK Then mIsOK = (cmbAggregation.ListIndex >= 0)
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

txtsequence = Item.sequence
  On Error Resume Next
txtName = Item.Name
  On Error Resume Next
txtthe_Alias = Item.the_Alias
If Not Item.FromPart Is Nothing Then
  txtFromPart.Tag = Item.FromPart.ID
  txtFromPart = Item.FromPart.brief
Else
  txtFromPart.Tag = ""
  txtFromPart = ""
End If
 LoadBtnPictures cmdFromPart, cmdFromPart.Tag
  cmdFromPart.RemoveAllMenu
  cmdFromPart.AddMenu "Очистить"
If Not Item.FIELD Is Nothing Then
  txtField.Tag = Item.FIELD.ID
  txtField = Item.FIELD.brief
Else
  txtField.Tag = ""
  txtField = ""
End If
 LoadBtnPictures cmdField, cmdField.Tag
  cmdField.RemoveAllMenu
  cmdField.AddMenu "Очистить"
cmbAggregation.Clear
cmbAggregation.AddItem "MAX"
cmbAggregation.ItemData(cmbAggregation.NewIndex) = 5
cmbAggregation.AddItem "AVG"
cmbAggregation.ItemData(cmbAggregation.NewIndex) = 1
cmbAggregation.AddItem "SUM"
cmbAggregation.ItemData(cmbAggregation.NewIndex) = 3
cmbAggregation.AddItem "COUNT"
cmbAggregation.ItemData(cmbAggregation.NewIndex) = 2
cmbAggregation.AddItem "MIN"
cmbAggregation.ItemData(cmbAggregation.NewIndex) = 4
cmbAggregation.AddItem "CUSTOM"
cmbAggregation.ItemData(cmbAggregation.NewIndex) = 6
cmbAggregation.AddItem "none"
cmbAggregation.ItemData(cmbAggregation.NewIndex) = 0
 For iii = 0 To cmbAggregation.ListCount - 1
  If Item.Aggregation = cmbAggregation.ItemData(iii) Then
   cmbAggregation.ListIndex = iii
   Exit For
  End If
 Next
txtExpression = Item.Expression
cmbForCombo.Clear
cmbForCombo.AddItem "Да"
cmbForCombo.ItemData(cmbForCombo.NewIndex) = -1
cmbForCombo.AddItem "Нет"
cmbForCombo.ItemData(cmbForCombo.NewIndex) = 0
 For iii = 0 To cmbForCombo.ListCount - 1
  If Item.ForCombo = cmbForCombo.ItemData(iii) Then
   cmbForCombo.ListIndex = iii
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

Item.sequence = CDbl(txtsequence)
Item.Name = txtName
Item.the_Alias = txtthe_Alias
If txtFromPart.Tag <> "" Then
  Set Item.FromPart = Item.Application.FindRowObject("PART", txtFromPart.Tag)
Else
  Set Item.FromPart = Nothing
End If
If txtField.Tag <> "" Then
  Set Item.FIELD = Item.Application.FindRowObject("FIELD", txtField.Tag)
Else
  Set Item.FIELD = Nothing
End If
 If cmbAggregation.ListIndex >= 0 Then
   Item.Aggregation = cmbAggregation.ItemData(cmbAggregation.ListIndex)
 End If
Item.Expression = txtExpression
 If cmbForCombo.ListIndex >= 0 Then
   Item.ForCombo = cmbForCombo.ItemData(cmbForCombo.ListIndex)
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



