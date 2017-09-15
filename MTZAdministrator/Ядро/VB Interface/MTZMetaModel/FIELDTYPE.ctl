VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl FIELDTYPE 
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
      Begin VB.ComboBox cmbGridSortType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   16
         ToolTipText     =   "Вариант сортировки в табличном представлении"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowLikeSearch 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   14
         ToolTipText     =   "Поиск текста"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.TextBox txtMaximum 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   12
         ToolTipText     =   "Максимум"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.TextBox txtMinimum 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   10
         ToolTipText     =   "Минимум"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowSize 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Нужен размер"
         Top             =   3420
         Width           =   3000
      End
      Begin VB.TextBox txtthe_Comment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   6
         ToolTipText     =   "Описание"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbTypeStyle 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "Трактовка"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblGridSortType 
         BackStyle       =   0  'Transparent
         Caption         =   "Вариант сортировки в табличном представлении:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblAllowLikeSearch 
         BackStyle       =   0  'Transparent
         Caption         =   "Поиск текста:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblMaximum 
         BackStyle       =   0  'Transparent
         Caption         =   "Максимум:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblMinimum 
         BackStyle       =   0  'Transparent
         Caption         =   "Минимум:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblAllowSize 
         BackStyle       =   0  'Transparent
         Caption         =   "Нужен размер:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblthe_Comment 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTypeStyle 
         BackStyle       =   0  'Transparent
         Caption         =   "Трактовка:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "FIELDTYPE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Типы полей, перечисления, интервалы
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
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, Cancel)
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

Private Sub txtName_Change()
  Changing

End Sub
Private Sub cmbTypeStyle_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtthe_Comment_Change()
  Changing

End Sub
Private Sub cmbAllowSize_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtMinimum_Change()
  Changing

End Sub
Private Sub txtMaximum_Change()
  Changing

End Sub
Private Sub cmbAllowLikeSearch_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbGridSortType_Click()
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
If mIsOK Then mIsOK = (cmbTypeStyle.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbAllowSize.ListIndex >= 0)
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
txtName = Item.Name
cmbTypeStyle.Clear
cmbTypeStyle.AddItem "Интервал"
cmbTypeStyle.ItemData(cmbTypeStyle.NewIndex) = 3
cmbTypeStyle.AddItem "Элемент оформления"
cmbTypeStyle.ItemData(cmbTypeStyle.NewIndex) = 5
cmbTypeStyle.AddItem "Скалярный тип"
cmbTypeStyle.ItemData(cmbTypeStyle.NewIndex) = 0
cmbTypeStyle.AddItem "Ссылка"
cmbTypeStyle.ItemData(cmbTypeStyle.NewIndex) = 4
cmbTypeStyle.AddItem "Перечисление"
cmbTypeStyle.ItemData(cmbTypeStyle.NewIndex) = 2
cmbTypeStyle.AddItem "Выражение"
cmbTypeStyle.ItemData(cmbTypeStyle.NewIndex) = 1
 For iii = 0 To cmbTypeStyle.ListCount - 1
  If Item.TypeStyle = cmbTypeStyle.ItemData(iii) Then
   cmbTypeStyle.ListIndex = iii
   Exit For
  End If
 Next
txtthe_Comment = Item.the_Comment
cmbAllowSize.Clear
cmbAllowSize.AddItem "Да"
cmbAllowSize.ItemData(cmbAllowSize.NewIndex) = -1
cmbAllowSize.AddItem "Нет"
cmbAllowSize.ItemData(cmbAllowSize.NewIndex) = 0
 For iii = 0 To cmbAllowSize.ListCount - 1
  If Item.AllowSize = cmbAllowSize.ItemData(iii) Then
   cmbAllowSize.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtMinimum = Item.Minimum
  On Error Resume Next
txtMaximum = Item.Maximum
cmbAllowLikeSearch.Clear
cmbAllowLikeSearch.AddItem "Да"
cmbAllowLikeSearch.ItemData(cmbAllowLikeSearch.NewIndex) = -1
cmbAllowLikeSearch.AddItem "Нет"
cmbAllowLikeSearch.ItemData(cmbAllowLikeSearch.NewIndex) = 0
 For iii = 0 To cmbAllowLikeSearch.ListCount - 1
  If Item.AllowLikeSearch = cmbAllowLikeSearch.ItemData(iii) Then
   cmbAllowLikeSearch.ListIndex = iii
   Exit For
  End If
 Next
cmbGridSortType.Clear
cmbGridSortType.AddItem "As String"
cmbGridSortType.ItemData(cmbGridSortType.NewIndex) = 0
cmbGridSortType.AddItem "As Numeric"
cmbGridSortType.ItemData(cmbGridSortType.NewIndex) = 1
cmbGridSortType.AddItem "As Date"
cmbGridSortType.ItemData(cmbGridSortType.NewIndex) = 2
 For iii = 0 To cmbGridSortType.ListCount - 1
  If Item.GridSortType = cmbGridSortType.ItemData(iii) Then
   cmbGridSortType.ListIndex = iii
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

Item.Name = txtName
 If cmbTypeStyle.ListIndex >= 0 Then
   Item.TypeStyle = cmbTypeStyle.ItemData(cmbTypeStyle.ListIndex)
 End If
Item.the_Comment = txtthe_Comment
 If cmbAllowSize.ListIndex >= 0 Then
   Item.AllowSize = cmbAllowSize.ItemData(cmbAllowSize.ListIndex)
 End If
Item.Minimum = txtMinimum
Item.Maximum = txtMaximum
 If cmbAllowLikeSearch.ListIndex >= 0 Then
   Item.AllowLikeSearch = cmbAllowLikeSearch.ItemData(cmbAllowLikeSearch.ListIndex)
 End If
 If cmbGridSortType.ListIndex >= 0 Then
   Item.GridSortType = cmbGridSortType.ItemData(cmbGridSortType.ListIndex)
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



