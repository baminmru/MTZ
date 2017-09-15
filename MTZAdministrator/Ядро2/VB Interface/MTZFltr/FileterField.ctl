VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl FileterField 
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
      Begin VB.ComboBox cmbValueArray 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   21
         ToolTipText     =   "Массив значений"
         Top             =   6045
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdRefToPart 
         Height          =   300
         Left            =   2850
         TabIndex        =   19
         Tag             =   "refopen.ico"
         ToolTipText     =   "Раздел, куда ссылаемся"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtRefToPart 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   18
         ToolTipText     =   "Раздел, куда ссылаемся"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdRefToType 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип, куда ссылаемся"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtRefToType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Тип, куда ссылаемся"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.ComboBox cmbRefType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         ToolTipText     =   "Тип ссылки"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtFieldSize 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   11
         ToolTipText     =   "Размер"
         Top             =   3225
         Width           =   1800
      End
      Begin MTZ_PANEL.DropButton cmdFieldType 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип поля"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFieldType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Тип поля"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtCaption 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "Заголовок"
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
         ToolTipText     =   "Последовательность"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblValueArray 
         BackStyle       =   0  'Transparent
         Caption         =   "Массив значений:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblRefToPart 
         BackStyle       =   0  'Transparent
         Caption         =   "Раздел, куда ссылаемся:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblRefToType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип, куда ссылаемся:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblRefType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип ссылки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblFieldSize 
         BackStyle       =   0  'Transparent
         Caption         =   "Размер:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFieldType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип поля:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCaption 
         BackStyle       =   0  'Transparent
         Caption         =   "Заголовок:"
         ForeColor       =   &H00FF0000&
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
         Caption         =   "Последовательность:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "FileterField"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Поле фильтра
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
Private Sub txtCaption_Change()
  Changing

End Sub
Private Sub txtFieldType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFieldType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("FIELDTYPE", ID, brief) Then
          txtFieldType.Tag = Left(ID, 38)
          txtFieldType = brief
        End If
End Sub
Private Sub cmdFieldType_MenuClick(ByVal sCaption As String)
          txtFieldType.Tag = ""
          txtFieldType = ""
End Sub
Private Sub txtFieldSize_Validate(cancel As Boolean)
If txtFieldSize.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtFieldSize.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtFieldSize.SetFocus
  ElseIf Val(txtFieldSize.Text) <> CLng(Val(txtFieldSize.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtFieldSize.SetFocus
  End If
End If
End Sub
Private Sub txtFieldSize_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtFieldSize_Change()
  Changing

End Sub
Private Sub cmbRefType_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtRefToType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdRefToType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJECTTYPE", ID, brief) Then
          txtRefToType.Tag = Left(ID, 38)
          txtRefToType = brief
        End If
End Sub
Private Sub cmdRefToType_MenuClick(ByVal sCaption As String)
          txtRefToType.Tag = ""
          txtRefToType = ""
End Sub
Private Sub txtRefToPart_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdRefToPart_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PART", ID, brief) Then
          txtRefToPart.Tag = Left(ID, 38)
          txtRefToPart = brief
        End If
End Sub
Private Sub cmdRefToPart_MenuClick(ByVal sCaption As String)
          txtRefToPart.Tag = ""
          txtRefToPart = ""
End Sub
Private Sub cmbValueArray_Click()
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

If mIsOK Then mIsOK = IsSet(txtsequence.Text)
If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = txtFieldType.Tag <> ""
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
txtCaption = Item.Caption
If Not Item.FieldType Is Nothing Then
  txtFieldType.Tag = Item.FieldType.ID
  txtFieldType = Item.FieldType.brief
Else
  txtFieldType.Tag = ""
  txtFieldType = ""
End If
 LoadBtnPictures cmdFieldType, cmdFieldType.Tag
  cmdFieldType.RemoveAllMenu
  cmdFieldType.AddMenu "Очистить"
txtFieldSize = Item.FieldSize
cmbRefType.Clear
cmbRefType.AddItem "На строку раздела"
cmbRefType.ItemData(cmbRefType.NewIndex) = 2
cmbRefType.AddItem "На источник данных"
cmbRefType.ItemData(cmbRefType.NewIndex) = 3
cmbRefType.AddItem "Скалярное поле ( не ссылка)"
cmbRefType.ItemData(cmbRefType.NewIndex) = 0
cmbRefType.AddItem "На объект "
cmbRefType.ItemData(cmbRefType.NewIndex) = 1
 For iii = 0 To cmbRefType.ListCount - 1
  If Item.RefType = cmbRefType.ItemData(iii) Then
   cmbRefType.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.RefToType Is Nothing Then
  txtRefToType.Tag = Item.RefToType.ID
  txtRefToType = Item.RefToType.brief
Else
  txtRefToType.Tag = ""
  txtRefToType = ""
End If
 LoadBtnPictures cmdRefToType, cmdRefToType.Tag
  cmdRefToType.RemoveAllMenu
  cmdRefToType.AddMenu "Очистить"
If Not Item.RefToPart Is Nothing Then
  txtRefToPart.Tag = Item.RefToPart.ID
  txtRefToPart = Item.RefToPart.brief
Else
  txtRefToPart.Tag = ""
  txtRefToPart = ""
End If
 LoadBtnPictures cmdRefToPart, cmdRefToPart.Tag
  cmdRefToPart.RemoveAllMenu
  cmdRefToPart.AddMenu "Очистить"
cmbValueArray.Clear
cmbValueArray.AddItem "Да"
cmbValueArray.ItemData(cmbValueArray.NewIndex) = -1
cmbValueArray.AddItem "Нет"
cmbValueArray.ItemData(cmbValueArray.NewIndex) = 0
 For iii = 0 To cmbValueArray.ListCount - 1
  If Item.ValueArray = cmbValueArray.ItemData(iii) Then
   cmbValueArray.ListIndex = iii
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
Item.Caption = txtCaption
If txtFieldType.Tag <> "" Then
  Set Item.FieldType = Item.Application.FindRowObject("FIELDTYPE", txtFieldType.Tag)
Else
  Set Item.FieldType = Nothing
End If
Item.FieldSize = CDbl(txtFieldSize)
 If cmbRefType.ListIndex >= 0 Then
   Item.RefType = cmbRefType.ItemData(cmbRefType.ListIndex)
 End If
If txtRefToType.Tag <> "" Then
  Set Item.RefToType = Item.Application.FindRowObject("OBJECTTYPE", txtRefToType.Tag)
Else
  Set Item.RefToType = Nothing
End If
If txtRefToPart.Tag <> "" Then
  Set Item.RefToPart = Item.Application.FindRowObject("PART", txtRefToPart.Tag)
Else
  Set Item.RefToPart = Nothing
End If
 If cmbValueArray.ListIndex >= 0 Then
   Item.ValueArray = cmbValueArray.ItemData(cmbValueArray.ListIndex)
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



