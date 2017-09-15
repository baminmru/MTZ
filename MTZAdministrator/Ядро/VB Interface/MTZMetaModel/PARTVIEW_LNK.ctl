VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PARTVIEW_LNK 
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
      Begin VB.TextBox txtSEQ 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   15
         ToolTipText     =   "Порядок"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.TextBox txtHandJoin 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   13
         ToolTipText     =   "Ручной join"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheJoinDestination 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Свзяь: Поле для join приемник"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheJoinDestination 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Свзяь: Поле для join приемник"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.ComboBox cmbRefType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Связывать как"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheJoinSource 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Связь: Поле для join источник"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheJoinSource 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Связь: Поле для join источник"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheView 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Представление"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheView 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Представление"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblSEQ 
         BackStyle       =   0  'Transparent
         Caption         =   "Порядок:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblHandJoin 
         BackStyle       =   0  'Transparent
         Caption         =   "Ручной join:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTheJoinDestination 
         BackStyle       =   0  'Transparent
         Caption         =   "Свзяь: Поле для join приемник:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblRefType 
         BackStyle       =   0  'Transparent
         Caption         =   "Связывать как:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheJoinSource 
         BackStyle       =   0  'Transparent
         Caption         =   "Связь: Поле для join источник:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheView 
         BackStyle       =   0  'Transparent
         Caption         =   "Представление:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PARTVIEW_LNK"
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

Private Sub txtTheView_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheView_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PARTVIEW", ID, brief, Item.Application.ID) Then
          txtTheView.Tag = Left(ID, 38)
          txtTheView = brief
        End If
End Sub
Private Sub cmdTheView_MenuClick(ByVal sCaption As String)
          txtTheView.Tag = ""
          txtTheView = ""
End Sub
Private Sub txtTheJoinSource_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheJoinSource_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ViewColumn", ID, brief, Item.Application.ID) Then
          txtTheJoinSource.Tag = Left(ID, 38)
          txtTheJoinSource = brief
        End If
End Sub
Private Sub cmdTheJoinSource_MenuClick(ByVal sCaption As String)
          txtTheJoinSource.Tag = ""
          txtTheJoinSource = ""
End Sub
Private Sub cmbRefType_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtTheJoinDestination_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheJoinDestination_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ViewColumn", ID, brief, Item.Application.ID) Then
          txtTheJoinDestination.Tag = Left(ID, 38)
          txtTheJoinDestination = brief
        End If
End Sub
Private Sub cmdTheJoinDestination_MenuClick(ByVal sCaption As String)
          txtTheJoinDestination.Tag = ""
          txtTheJoinDestination = ""
End Sub
Private Sub txtHandJoin_Change()
  Changing

End Sub
Private Sub txtSEQ_Validate(cancel As Boolean)
If txtSEQ.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSEQ.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtSEQ.SetFocus
  ElseIf Val(txtSEQ.Text) <> CLng(Val(txtSEQ.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtSEQ.SetFocus
  End If
End If
End Sub
Private Sub txtSEQ_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtSEQ_Change()
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

If mIsOK Then mIsOK = txtTheView.Tag <> ""
If mIsOK Then mIsOK = (cmbRefType.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(txtSEQ.Text)
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

If Not Item.TheView Is Nothing Then
  txtTheView.Tag = Item.TheView.ID
  txtTheView = Item.TheView.brief
Else
  txtTheView.Tag = ""
  txtTheView = ""
End If
 LoadBtnPictures cmdTheView, cmdTheView.Tag
  cmdTheView.RemoveAllMenu
  cmdTheView.AddMenu "Очистить"
If Not Item.TheJoinSource Is Nothing Then
  txtTheJoinSource.Tag = Item.TheJoinSource.ID
  txtTheJoinSource = Item.TheJoinSource.brief
Else
  txtTheJoinSource.Tag = ""
  txtTheJoinSource = ""
End If
 LoadBtnPictures cmdTheJoinSource, cmdTheJoinSource.Tag
  cmdTheJoinSource.RemoveAllMenu
  cmdTheJoinSource.AddMenu "Очистить"
cmbRefType.Clear
cmbRefType.AddItem "Ссылка на строку"
cmbRefType.ItemData(cmbRefType.NewIndex) = 2
cmbRefType.AddItem "Ссылка на объект"
cmbRefType.ItemData(cmbRefType.NewIndex) = 1
cmbRefType.AddItem "Связка InstanceID (в передлах объекта)"
cmbRefType.ItemData(cmbRefType.NewIndex) = 3
cmbRefType.AddItem "Связка ParentStructRowID  (в передлах объекта)"
cmbRefType.ItemData(cmbRefType.NewIndex) = 4
cmbRefType.AddItem "Нет"
cmbRefType.ItemData(cmbRefType.NewIndex) = 0
 For iii = 0 To cmbRefType.ListCount - 1
  If Item.RefType = cmbRefType.ItemData(iii) Then
   cmbRefType.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.TheJoinDestination Is Nothing Then
  txtTheJoinDestination.Tag = Item.TheJoinDestination.ID
  txtTheJoinDestination = Item.TheJoinDestination.brief
Else
  txtTheJoinDestination.Tag = ""
  txtTheJoinDestination = ""
End If
 LoadBtnPictures cmdTheJoinDestination, cmdTheJoinDestination.Tag
  cmdTheJoinDestination.RemoveAllMenu
  cmdTheJoinDestination.AddMenu "Очистить"
  On Error Resume Next
txtHandJoin = Item.HandJoin
txtSEQ = Item.SEQ
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

If txtTheView.Tag <> "" Then
  Set Item.TheView = Item.Application.FindRowObject("PARTVIEW", txtTheView.Tag)
Else
  Set Item.TheView = Nothing
End If
If txtTheJoinSource.Tag <> "" Then
  Set Item.TheJoinSource = Item.Application.FindRowObject("ViewColumn", txtTheJoinSource.Tag)
Else
  Set Item.TheJoinSource = Nothing
End If
 If cmbRefType.ListIndex >= 0 Then
   Item.RefType = cmbRefType.ItemData(cmbRefType.ListIndex)
 End If
If txtTheJoinDestination.Tag <> "" Then
  Set Item.TheJoinDestination = Item.Application.FindRowObject("ViewColumn", txtTheJoinDestination.Tag)
Else
  Set Item.TheJoinDestination = Nothing
End If
Item.HandJoin = txtHandJoin
Item.SEQ = CDbl(txtSEQ)
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



