VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl JournalColumn 
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
      Begin VB.ComboBox cmbGroupAggregation 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Аггрегация при группировке"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbColSort 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Сортировка колонки"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbColumnAlignment 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "Выравнивание"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtname 
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
         ToolTipText     =   "Последовательность"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblGroupAggregation 
         BackStyle       =   0  'Transparent
         Caption         =   "Аггрегация при группировке:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblColSort 
         BackStyle       =   0  'Transparent
         Caption         =   "Сортировка колонки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblColumnAlignment 
         BackStyle       =   0  'Transparent
         Caption         =   "Выравнивание:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblname 
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
         Caption         =   "Последовательность:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "JournalColumn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Колонки журнала
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
Private Sub txtname_Change()
  Changing

End Sub
Private Sub cmbColumnAlignment_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbColSort_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbGroupAggregation_Click()
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

If mIsOK Then mIsOK = IsSet(txtname.Text)
If mIsOK Then mIsOK = (cmbColumnAlignment.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbColSort.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbGroupAggregation.ListIndex >= 0)
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
txtname = Item.Name
cmbColumnAlignment.Clear
cmbColumnAlignment.AddItem "Center Center"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 4
cmbColumnAlignment.AddItem "Center Top"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 3
cmbColumnAlignment.AddItem "Right Top"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 6
cmbColumnAlignment.AddItem "Right Bottom"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 8
cmbColumnAlignment.AddItem "Left Bottom"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 2
cmbColumnAlignment.AddItem "Right Center"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 7
cmbColumnAlignment.AddItem "Center Bottom"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 5
cmbColumnAlignment.AddItem "Left Center"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 1
cmbColumnAlignment.AddItem "Left Top"
cmbColumnAlignment.ItemData(cmbColumnAlignment.NewIndex) = 0
 For iii = 0 To cmbColumnAlignment.ListCount - 1
  If Item.ColumnAlignment = cmbColumnAlignment.ItemData(iii) Then
   cmbColumnAlignment.ListIndex = iii
   Exit For
  End If
 Next
cmbColSort.Clear
cmbColSort.AddItem "As String"
cmbColSort.ItemData(cmbColSort.NewIndex) = 0
cmbColSort.AddItem "As Numeric"
cmbColSort.ItemData(cmbColSort.NewIndex) = 1
cmbColSort.AddItem "As Date"
cmbColSort.ItemData(cmbColSort.NewIndex) = 2
 For iii = 0 To cmbColSort.ListCount - 1
  If Item.ColSort = cmbColSort.ItemData(iii) Then
   cmbColSort.ListIndex = iii
   Exit For
  End If
 Next
cmbGroupAggregation.Clear
cmbGroupAggregation.AddItem "MAX"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 5
cmbGroupAggregation.AddItem "AVG"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 1
cmbGroupAggregation.AddItem "SUM"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 3
cmbGroupAggregation.AddItem "COUNT"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 2
cmbGroupAggregation.AddItem "MIN"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 4
cmbGroupAggregation.AddItem "CUSTOM"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 6
cmbGroupAggregation.AddItem "none"
cmbGroupAggregation.ItemData(cmbGroupAggregation.NewIndex) = 0
 For iii = 0 To cmbGroupAggregation.ListCount - 1
  If Item.GroupAggregation = cmbGroupAggregation.ItemData(iii) Then
   cmbGroupAggregation.ListIndex = iii
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
Item.Name = txtname
 If cmbColumnAlignment.ListIndex >= 0 Then
   Item.ColumnAlignment = cmbColumnAlignment.ItemData(cmbColumnAlignment.ListIndex)
 End If
 If cmbColSort.ListIndex >= 0 Then
   Item.ColSort = cmbColSort.ItemData(cmbColSort.ListIndex)
 End If
 If cmbGroupAggregation.ListIndex >= 0 Then
   Item.GroupAggregation = cmbGroupAggregation.ItemData(cmbGroupAggregation.ListIndex)
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



