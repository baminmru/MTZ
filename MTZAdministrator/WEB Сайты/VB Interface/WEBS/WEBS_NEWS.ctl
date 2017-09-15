VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WEBS_NEWS 
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
      Begin VB.TextBox txtNewsDescription 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   20
         ToolTipText     =   "Описание"
         Top             =   1110
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpNewsDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   18
         ToolTipText     =   "Дата"
         Top             =   405
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16449539
         CurrentDate     =   39882
      End
      Begin VB.ComboBox cmbIsShowHisory 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   16
         ToolTipText     =   "Отобразить историю"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.ComboBox cmbthe_IsLocked 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   14
         ToolTipText     =   "Заблокирована"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.TextBox txtPageContent 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         ToolTipText     =   "Cодержимое"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtthe_Mode 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   10
         ToolTipText     =   "Режим работы"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtShortName 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   8
         ToolTipText     =   "Короткое название"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtTitle 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   6
         ToolTipText     =   "Титул"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   4
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtQueueNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер п/п"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblNewsDescription 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblNewsDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   17
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblIsShowHisory 
         BackStyle       =   0  'Transparent
         Caption         =   "Отобразить историю:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblthe_IsLocked 
         BackStyle       =   0  'Transparent
         Caption         =   "Заблокирована:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblPageContent 
         BackStyle       =   0  'Transparent
         Caption         =   "Cодержимое:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblthe_Mode 
         BackStyle       =   0  'Transparent
         Caption         =   "Режим работы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblShortName 
         BackStyle       =   0  'Transparent
         Caption         =   "Короткое название:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTitle 
         BackStyle       =   0  'Transparent
         Caption         =   "Титул:"
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
      Begin VB.Label lblQueueNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер п/п:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WEBS_NEWS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Древовидный список новостей
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

Private Sub txtQueueNumber_Validate(cancel As Boolean)
If txtQueueNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQueueNumber.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQueueNumber.SetFocus
  ElseIf Val(txtQueueNumber.Text) <> CLng(Val(txtQueueNumber.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtQueueNumber.SetFocus
  End If
End If
End Sub
Private Sub txtQueueNumber_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQueueNumber_Change()
  Changing

End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtTitle_Change()
  Changing

End Sub
Private Sub txtShortName_Change()
  Changing

End Sub
Private Sub txtthe_Mode_Change()
  Changing

End Sub
Private Sub txtPageContent_Change()
  Changing

End Sub
Private Sub cmbthe_IsLocked_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsShowHisory_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub dtpNewsDate_Change()
  Changing

End Sub
Private Sub txtNewsDescription_Change()
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

txtQueueNumber = Item.QueueNumber
  On Error Resume Next
txtName = Item.Name
  On Error Resume Next
txtTitle = Item.Title
  On Error Resume Next
txtShortName = Item.ShortName
  On Error Resume Next
txtthe_Mode = Item.the_Mode
txtPageContent = Item.PageContent
cmbthe_IsLocked.Clear
cmbthe_IsLocked.AddItem "Да"
cmbthe_IsLocked.ItemData(cmbthe_IsLocked.NewIndex) = -1
cmbthe_IsLocked.AddItem "Нет"
cmbthe_IsLocked.ItemData(cmbthe_IsLocked.NewIndex) = 0
 For iii = 0 To cmbthe_IsLocked.ListCount - 1
  If Item.the_IsLocked = cmbthe_IsLocked.ItemData(iii) Then
   cmbthe_IsLocked.ListIndex = iii
   Exit For
  End If
 Next
cmbIsShowHisory.Clear
cmbIsShowHisory.AddItem "Да"
cmbIsShowHisory.ItemData(cmbIsShowHisory.NewIndex) = -1
cmbIsShowHisory.AddItem "Нет"
cmbIsShowHisory.ItemData(cmbIsShowHisory.NewIndex) = 0
 For iii = 0 To cmbIsShowHisory.ListCount - 1
  If Item.IsShowHisory = cmbIsShowHisory.ItemData(iii) Then
   cmbIsShowHisory.ListIndex = iii
   Exit For
  End If
 Next
dtpNewsDate = Now
If Item.NewsDate <> 0 Then
 dtpNewsDate = Item.NewsDate
Else
 dtpNewsDate.Value = Null
End If
txtNewsDescription = Item.NewsDescription
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

Item.QueueNumber = CDbl(txtQueueNumber)
Item.Name = txtName
Item.Title = txtTitle
Item.ShortName = txtShortName
Item.the_Mode = txtthe_Mode
Item.PageContent = txtPageContent
 If cmbthe_IsLocked.ListIndex >= 0 Then
   Item.the_IsLocked = cmbthe_IsLocked.ItemData(cmbthe_IsLocked.ListIndex)
 End If
 If cmbIsShowHisory.ListIndex >= 0 Then
   Item.IsShowHisory = cmbIsShowHisory.ItemData(cmbIsShowHisory.ListIndex)
 End If
  If IsNull(dtpNewsDate) Then
    Item.NewsDate = 0
  Else
    Item.NewsDate = dtpNewsDate.Value
  End If
Item.NewsDescription = txtNewsDescription
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



