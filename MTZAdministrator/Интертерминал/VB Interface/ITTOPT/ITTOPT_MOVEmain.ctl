VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl ITTOPT_MOVEmain 
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
      Begin VB.TextBox txtThePalletPlanned 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   18
         ToolTipText     =   "Плановый номер паллеты"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtStage 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   80
         TabIndex        =   16
         ToolTipText     =   "Стадия"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.TextBox txtPType 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   1
         TabIndex        =   14
         ToolTipText     =   "Тип паллеты"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.TextBox txtGoodInfo 
         Enabled         =   0   'False
         Height          =   1200
         Left            =   300
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         ToolTipText     =   "Параметры товара"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbISMoved 
         Enabled         =   0   'False
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Перемещена"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtThePalletteNum 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   8
         ToolTipText     =   "Номер палеты"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtToLocation 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   12
         TabIndex        =   6
         ToolTipText     =   "В ячейку"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFromLocation 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   12
         TabIndex        =   4
         ToolTipText     =   "Из ячейки"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtsequence 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblThePalletPlanned 
         BackStyle       =   0  'Transparent
         Caption         =   "Плановый номер паллеты:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   17
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblStage 
         BackStyle       =   0  'Transparent
         Caption         =   "Стадия:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblPType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип паллеты:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblGoodInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Параметры товара:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblISMoved 
         BackStyle       =   0  'Transparent
         Caption         =   "Перемещена:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblThePalletteNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер палеты:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblToLocation 
         BackStyle       =   0  'Transparent
         Caption         =   "В ячейку:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFromLocation 
         BackStyle       =   0  'Transparent
         Caption         =   "Из ячейки:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblsequence 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTOPT_MOVEmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Необходимые перемещения
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

Private Sub txtsequence_Change()
  Changing

End Sub
Private Sub txtFromLocation_Change()
  Changing

End Sub
Private Sub txtToLocation_Change()
  Changing

End Sub
Private Sub txtThePalletteNum_Change()
  Changing

End Sub
Private Sub cmbISMoved_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtGoodInfo_Change()
  Changing

End Sub
Private Sub txtPType_Change()
  Changing

End Sub
Private Sub txtStage_Change()
  Changing

End Sub
Private Sub txtThePalletPlanned_Change()
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

txtsequence = Item.sequence
  On Error Resume Next
txtFromLocation = Item.FromLocation
  On Error Resume Next
txtToLocation = Item.ToLocation
  On Error Resume Next
txtThePalletteNum = Item.ThePalletteNum
cmbISMoved.Clear
cmbISMoved.AddItem "Да"
cmbISMoved.ItemData(cmbISMoved.NewIndex) = -1
cmbISMoved.AddItem "Нет"
cmbISMoved.ItemData(cmbISMoved.NewIndex) = 0
 For iii = 0 To cmbISMoved.ListCount - 1
  If Item.ISMoved = cmbISMoved.ItemData(iii) Then
   cmbISMoved.ListIndex = iii
   Exit For
  End If
 Next
txtGoodInfo = Item.GoodInfo
  On Error Resume Next
txtPType = Item.PType
  On Error Resume Next
txtStage = Item.Stage
  On Error Resume Next
txtThePalletPlanned = Item.ThePalletPlanned
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



