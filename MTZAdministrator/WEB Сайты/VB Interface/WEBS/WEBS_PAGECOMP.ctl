VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WEBS_PAGECOMP 
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
      Begin VB.ComboBox cmbVisible 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   17
         ToolTipText     =   "Видимость"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtUserIdField 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   15
         ToolTipText     =   "поле UserID"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtIDField 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   13
         ToolTipText     =   "Поле ID"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdthe_PartName 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Раздел"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtthe_PartName 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Раздел"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.ComboBox cmbIsCollection 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Коллекция"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbSelected 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "Активен"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtTitle 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   4
         ToolTipText     =   "Титул"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblVisible 
         BackStyle       =   0  'Transparent
         Caption         =   "Видимость:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblUserIdField 
         BackStyle       =   0  'Transparent
         Caption         =   "поле UserID:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblIDField 
         BackStyle       =   0  'Transparent
         Caption         =   "Поле ID:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblthe_PartName 
         BackStyle       =   0  'Transparent
         Caption         =   "Раздел:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblIsCollection 
         BackStyle       =   0  'Transparent
         Caption         =   "Коллекция:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSelected 
         BackStyle       =   0  'Transparent
         Caption         =   "Активен:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTitle 
         BackStyle       =   0  'Transparent
         Caption         =   "Титул:"
         ForeColor       =   &H00FF0000&
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
Attribute VB_Name = "WEBS_PAGECOMP"
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

Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtTitle_Change()
  Changing

End Sub
Private Sub cmbSelected_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsCollection_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtthe_PartName_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdthe_PartName_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PART", ID, brief) Then
          txtthe_PartName.Tag = Left(ID, 38)
          txtthe_PartName = brief
        End If
End Sub
Private Sub cmdthe_PartName_MenuClick(ByVal sCaption As String)
          txtthe_PartName.Tag = ""
          txtthe_PartName = ""
End Sub
Private Sub txtIDField_Change()
  Changing

End Sub
Private Sub txtUserIdField_Change()
  Changing

End Sub
Private Sub cmbVisible_Click()
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
If mIsOK Then mIsOK = (cmbVisible.ListIndex >= 0)
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
  On Error Resume Next
txtTitle = Item.Title
cmbSelected.Clear
cmbSelected.AddItem "Да"
cmbSelected.ItemData(cmbSelected.NewIndex) = -1
cmbSelected.AddItem "Нет"
cmbSelected.ItemData(cmbSelected.NewIndex) = 0
 For iii = 0 To cmbSelected.ListCount - 1
  If Item.Selected = cmbSelected.ItemData(iii) Then
   cmbSelected.ListIndex = iii
   Exit For
  End If
 Next
cmbIsCollection.Clear
cmbIsCollection.AddItem "Да"
cmbIsCollection.ItemData(cmbIsCollection.NewIndex) = -1
cmbIsCollection.AddItem "Нет"
cmbIsCollection.ItemData(cmbIsCollection.NewIndex) = 0
 For iii = 0 To cmbIsCollection.ListCount - 1
  If Item.IsCollection = cmbIsCollection.ItemData(iii) Then
   cmbIsCollection.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.the_PartName Is Nothing Then
  txtthe_PartName.Tag = Item.the_PartName.ID
  txtthe_PartName = Item.the_PartName.brief
Else
  txtthe_PartName.Tag = ""
  txtthe_PartName = ""
End If
 LoadBtnPictures cmdthe_PartName, cmdthe_PartName.Tag
  cmdthe_PartName.RemoveAllMenu
  cmdthe_PartName.AddMenu "Очистить"
  On Error Resume Next
txtIDField = Item.IDField
  On Error Resume Next
txtUserIdField = Item.UserIdField
cmbVisible.Clear
cmbVisible.AddItem "Да"
cmbVisible.ItemData(cmbVisible.NewIndex) = -1
cmbVisible.AddItem "Нет"
cmbVisible.ItemData(cmbVisible.NewIndex) = 0
 For iii = 0 To cmbVisible.ListCount - 1
  If Item.Visible = cmbVisible.ItemData(iii) Then
   cmbVisible.ListIndex = iii
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
Item.Title = txtTitle
 If cmbSelected.ListIndex >= 0 Then
   Item.Selected = cmbSelected.ItemData(cmbSelected.ListIndex)
 End If
 If cmbIsCollection.ListIndex >= 0 Then
   Item.IsCollection = cmbIsCollection.ItemData(cmbIsCollection.ListIndex)
 End If
If txtthe_PartName.Tag <> "" Then
  Set Item.the_PartName = Item.Application.FindRowObject("PART", txtthe_PartName.Tag)
Else
  Set Item.the_PartName = Nothing
End If
Item.IDField = txtIDField
Item.UserIdField = txtUserIdField
 If cmbVisible.ListIndex >= 0 Then
   Item.Visible = cmbVisible.ItemData(cmbVisible.ListIndex)
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



