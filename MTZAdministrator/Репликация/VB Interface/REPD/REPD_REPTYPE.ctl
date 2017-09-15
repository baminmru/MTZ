VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl REPD_REPTYPE 
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
      Begin VB.TextBox txtRepConditonQRY 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         ToolTipText     =   "Условие репликации"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbUseFilter 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "Фильтровать по условию"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheObjectType 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип объекта"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheObjectType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Тип объекта"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.ComboBox cmbReplicaType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         ToolTipText     =   "Тип репликации"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblRepConditonQRY 
         BackStyle       =   0  'Transparent
         Caption         =   "Условие репликации:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblUseFilter 
         BackStyle       =   0  'Transparent
         Caption         =   "Фильтровать по условию:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheObjectType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип объекта:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblReplicaType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип репликации:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "REPD_REPTYPE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Описание типа репликации документов для узла
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

Private Sub cmbReplicaType_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtTheObjectType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheObjectType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJECTTYPE", ID, brief) Then
          txtTheObjectType.Tag = Left(ID, 38)
          txtTheObjectType = brief
        End If
End Sub
Private Sub cmdTheObjectType_MenuClick(ByVal sCaption As String)
          txtTheObjectType.Tag = ""
          txtTheObjectType = ""
End Sub
Private Sub cmbUseFilter_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtRepConditonQRY_Change()
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

If mIsOK Then mIsOK = (cmbReplicaType.ListIndex >= 0)
If mIsOK Then mIsOK = txtTheObjectType.Tag <> ""
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

cmbReplicaType.Clear
cmbReplicaType.AddItem "Весь документ"
cmbReplicaType.ItemData(cmbReplicaType.NewIndex) = 0
cmbReplicaType.AddItem "Локальный"
cmbReplicaType.ItemData(cmbReplicaType.NewIndex) = 2
cmbReplicaType.AddItem "Построчно"
cmbReplicaType.ItemData(cmbReplicaType.NewIndex) = 1
 For iii = 0 To cmbReplicaType.ListCount - 1
  If Item.ReplicaType = cmbReplicaType.ItemData(iii) Then
   cmbReplicaType.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.TheObjectType Is Nothing Then
  txtTheObjectType.Tag = Item.TheObjectType.ID
  txtTheObjectType = Item.TheObjectType.brief
Else
  txtTheObjectType.Tag = ""
  txtTheObjectType = ""
End If
 LoadBtnPictures cmdTheObjectType, cmdTheObjectType.Tag
  cmdTheObjectType.RemoveAllMenu
  cmdTheObjectType.AddMenu "Очистить"
cmbUseFilter.Clear
cmbUseFilter.AddItem "Да"
cmbUseFilter.ItemData(cmbUseFilter.NewIndex) = -1
cmbUseFilter.AddItem "Нет"
cmbUseFilter.ItemData(cmbUseFilter.NewIndex) = 0
 For iii = 0 To cmbUseFilter.ListCount - 1
  If Item.UseFilter = cmbUseFilter.ItemData(iii) Then
   cmbUseFilter.ListIndex = iii
   Exit For
  End If
 Next
txtRepConditonQRY = Item.RepConditonQRY
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

 If cmbReplicaType.ListIndex >= 0 Then
   Item.ReplicaType = cmbReplicaType.ItemData(cmbReplicaType.ListIndex)
 End If
If txtTheObjectType.Tag <> "" Then
  Set Item.TheObjectType = Item.Application.FindRowObject("OBJECTTYPE", txtTheObjectType.Tag)
Else
  Set Item.TheObjectType = Nothing
End If
 If cmbUseFilter.ListIndex >= 0 Then
   Item.UseFilter = cmbUseFilter.ItemData(cmbUseFilter.ListIndex)
 End If
Item.RepConditonQRY = txtRepConditonQRY
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



