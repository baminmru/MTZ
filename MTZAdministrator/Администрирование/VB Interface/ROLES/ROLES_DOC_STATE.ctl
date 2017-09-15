VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl ROLES_DOC_STATE 
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
      Begin VB.ComboBox cmbStateChangeDisabled 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Запрещена смена состояния"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowDelete 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Можно удалять"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdThe_Mode 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Режим"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtThe_Mode 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Режим"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdThe_State 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Состояние"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtThe_State 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Состояние"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblStateChangeDisabled 
         BackStyle       =   0  'Transparent
         Caption         =   "Запрещена смена состояния:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblAllowDelete 
         BackStyle       =   0  'Transparent
         Caption         =   "Можно удалять:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblThe_Mode 
         BackStyle       =   0  'Transparent
         Caption         =   "Режим:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblThe_State 
         BackStyle       =   0  'Transparent
         Caption         =   "Состояние:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ROLES_DOC_STATE"
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

Private Sub txtThe_State_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdThe_State_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJSTATUS", ID, brief, , , "OBJECTTYPE_Name='" + Item.Parent.Parent.the_document.Name + "'") Then
          txtThe_State.Tag = Left(ID, 38)
          txtThe_State = brief
        End If
End Sub
Private Sub cmdThe_State_MenuClick(ByVal sCaption As String)
          txtThe_State.Tag = ""
          txtThe_State = ""
End Sub
Private Sub txtThe_Mode_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdThe_Mode_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJECTMODE", ID, brief, , , "OBJECTTYPE_Name='" + Item.Parent.Parent.the_document.Name + "'") Then
          txtThe_Mode.Tag = Left(ID, 38)
          txtThe_Mode = brief
        End If
End Sub
Private Sub cmdThe_Mode_MenuClick(ByVal sCaption As String)
          txtThe_Mode.Tag = ""
          txtThe_Mode = ""
End Sub
Private Sub cmbAllowDelete_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbStateChangeDisabled_Click()
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

If Not Item.The_State Is Nothing Then
  txtThe_State.Tag = Item.The_State.ID
  txtThe_State = Item.The_State.brief
Else
  txtThe_State.Tag = ""
  txtThe_State = ""
End If
 LoadBtnPictures cmdThe_State, cmdThe_State.Tag
  cmdThe_State.RemoveAllMenu
  cmdThe_State.AddMenu "Очистить"
If Not Item.The_Mode Is Nothing Then
  txtThe_Mode.Tag = Item.The_Mode.ID
  txtThe_Mode = Item.The_Mode.brief
Else
  txtThe_Mode.Tag = ""
  txtThe_Mode = ""
End If
 LoadBtnPictures cmdThe_Mode, cmdThe_Mode.Tag
  cmdThe_Mode.RemoveAllMenu
  cmdThe_Mode.AddMenu "Очистить"
cmbAllowDelete.Clear
cmbAllowDelete.AddItem "Да"
cmbAllowDelete.ItemData(cmbAllowDelete.NewIndex) = -1
cmbAllowDelete.AddItem "Нет"
cmbAllowDelete.ItemData(cmbAllowDelete.NewIndex) = 0
 For iii = 0 To cmbAllowDelete.ListCount - 1
  If Item.AllowDelete = cmbAllowDelete.ItemData(iii) Then
   cmbAllowDelete.ListIndex = iii
   Exit For
  End If
 Next
cmbStateChangeDisabled.Clear
cmbStateChangeDisabled.AddItem "Да"
cmbStateChangeDisabled.ItemData(cmbStateChangeDisabled.NewIndex) = -1
cmbStateChangeDisabled.AddItem "Нет"
cmbStateChangeDisabled.ItemData(cmbStateChangeDisabled.NewIndex) = 0
 For iii = 0 To cmbStateChangeDisabled.ListCount - 1
  If Item.StateChangeDisabled = cmbStateChangeDisabled.ItemData(iii) Then
   cmbStateChangeDisabled.ListIndex = iii
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

If txtThe_State.Tag <> "" Then
  Set Item.The_State = Item.Application.FindRowObject("OBJSTATUS", txtThe_State.Tag)
Else
  Set Item.The_State = Nothing
End If
If txtThe_Mode.Tag <> "" Then
  Set Item.The_Mode = Item.Application.FindRowObject("OBJECTMODE", txtThe_Mode.Tag)
Else
  Set Item.The_Mode = Nothing
End If
 If cmbAllowDelete.ListIndex >= 0 Then
   Item.AllowDelete = cmbAllowDelete.ItemData(cmbAllowDelete.ListIndex)
 End If
 If cmbStateChangeDisabled.ListIndex >= 0 Then
   Item.StateChangeDisabled = cmbStateChangeDisabled.ItemData(cmbStateChangeDisabled.ListIndex)
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



