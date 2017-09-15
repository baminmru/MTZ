VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WEBS_PAGEMENU 
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
      Begin VB.TextBox txtUsePartRowsSort 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   15
         ToolTipText     =   "Сортировка строк части"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtUsePartRowsRowIDField 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   13
         ToolTipText     =   "Поле ID"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtUsePartRowsTextField 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   11
         ToolTipText     =   "Поле текста ссылки"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdUsePartRowsEditForm 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страница для редактирования"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtUsePartRowsEditForm 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Страница для редактирования"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.ComboBox cmbUsePartRowsInMenu 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "Развернуть строки в меню"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowInBottomMenu 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "В нижнем меню"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowInMenu 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         ToolTipText     =   "В меню"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblUsePartRowsSort 
         BackStyle       =   0  'Transparent
         Caption         =   "Сортировка строк части:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblUsePartRowsRowIDField 
         BackStyle       =   0  'Transparent
         Caption         =   "Поле ID:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblUsePartRowsTextField 
         BackStyle       =   0  'Transparent
         Caption         =   "Поле текста ссылки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblUsePartRowsEditForm 
         BackStyle       =   0  'Transparent
         Caption         =   "Страница для редактирования:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblUsePartRowsInMenu 
         BackStyle       =   0  'Transparent
         Caption         =   "Развернуть строки в меню:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblAllowInBottomMenu 
         BackStyle       =   0  'Transparent
         Caption         =   "В нижнем меню:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblAllowInMenu 
         BackStyle       =   0  'Transparent
         Caption         =   "В меню:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WEBS_PAGEMENU"
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
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, Cancel)
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

Private Sub cmbAllowInMenu_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbAllowInBottomMenu_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbUsePartRowsInMenu_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtUsePartRowsEditForm_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdUsePartRowsEditForm_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WEBS_PAGEDEF", ID, brief, Item.Application.ID) Then
          txtUsePartRowsEditForm.Tag = Left(ID, 38)
          txtUsePartRowsEditForm = brief
        End If
End Sub
Private Sub cmdUsePartRowsEditForm_MenuClick(ByVal sCaption As String)
          txtUsePartRowsEditForm.Tag = ""
          txtUsePartRowsEditForm = ""
End Sub
Private Sub txtUsePartRowsTextField_Change()
  Changing

End Sub
Private Sub txtUsePartRowsRowIDField_Change()
  Changing

End Sub
Private Sub txtUsePartRowsSort_Change()
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

cmbAllowInMenu.Clear
cmbAllowInMenu.AddItem "Да"
cmbAllowInMenu.ItemData(cmbAllowInMenu.NewIndex) = -1
cmbAllowInMenu.AddItem "Нет"
cmbAllowInMenu.ItemData(cmbAllowInMenu.NewIndex) = 0
 For iii = 0 To cmbAllowInMenu.ListCount - 1
  If Item.AllowInMenu = cmbAllowInMenu.ItemData(iii) Then
   cmbAllowInMenu.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowInBottomMenu.Clear
cmbAllowInBottomMenu.AddItem "Да"
cmbAllowInBottomMenu.ItemData(cmbAllowInBottomMenu.NewIndex) = -1
cmbAllowInBottomMenu.AddItem "Нет"
cmbAllowInBottomMenu.ItemData(cmbAllowInBottomMenu.NewIndex) = 0
 For iii = 0 To cmbAllowInBottomMenu.ListCount - 1
  If Item.AllowInBottomMenu = cmbAllowInBottomMenu.ItemData(iii) Then
   cmbAllowInBottomMenu.ListIndex = iii
   Exit For
  End If
 Next
cmbUsePartRowsInMenu.Clear
cmbUsePartRowsInMenu.AddItem "Да"
cmbUsePartRowsInMenu.ItemData(cmbUsePartRowsInMenu.NewIndex) = -1
cmbUsePartRowsInMenu.AddItem "Нет"
cmbUsePartRowsInMenu.ItemData(cmbUsePartRowsInMenu.NewIndex) = 0
 For iii = 0 To cmbUsePartRowsInMenu.ListCount - 1
  If Item.UsePartRowsInMenu = cmbUsePartRowsInMenu.ItemData(iii) Then
   cmbUsePartRowsInMenu.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.UsePartRowsEditForm Is Nothing Then
  txtUsePartRowsEditForm.Tag = Item.UsePartRowsEditForm.ID
  txtUsePartRowsEditForm = Item.UsePartRowsEditForm.brief
Else
  txtUsePartRowsEditForm.Tag = ""
  txtUsePartRowsEditForm = ""
End If
 LoadBtnPictures cmdUsePartRowsEditForm, cmdUsePartRowsEditForm.Tag
  cmdUsePartRowsEditForm.RemoveAllMenu
  cmdUsePartRowsEditForm.AddMenu "Очистить"
  On Error Resume Next
txtUsePartRowsTextField = Item.UsePartRowsTextField
  On Error Resume Next
txtUsePartRowsRowIDField = Item.UsePartRowsRowIDField
  On Error Resume Next
txtUsePartRowsSort = Item.UsePartRowsSort
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

 If cmbAllowInMenu.ListIndex >= 0 Then
   Item.AllowInMenu = cmbAllowInMenu.ItemData(cmbAllowInMenu.ListIndex)
 End If
 If cmbAllowInBottomMenu.ListIndex >= 0 Then
   Item.AllowInBottomMenu = cmbAllowInBottomMenu.ItemData(cmbAllowInBottomMenu.ListIndex)
 End If
 If cmbUsePartRowsInMenu.ListIndex >= 0 Then
   Item.UsePartRowsInMenu = cmbUsePartRowsInMenu.ItemData(cmbUsePartRowsInMenu.ListIndex)
 End If
If txtUsePartRowsEditForm.Tag <> "" Then
  Set Item.UsePartRowsEditForm = Item.Application.FindRowObject("WEBS_PAGEDEF", txtUsePartRowsEditForm.Tag)
Else
  Set Item.UsePartRowsEditForm = Nothing
End If
Item.UsePartRowsTextField = txtUsePartRowsTextField
Item.UsePartRowsRowIDField = txtUsePartRowsRowIDField
Item.UsePartRowsSort = txtUsePartRowsSort
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



