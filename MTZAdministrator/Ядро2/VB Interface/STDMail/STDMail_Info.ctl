VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl STDMail_Info 
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
      Begin MSComCtl2.DTPicker dtpSentDT 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Отправлено"
         Top             =   5535
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16449539
         CurrentDate     =   39874
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Создано"
         Top             =   4830
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16449539
         CurrentDate     =   39874
      End
      Begin VB.ComboBox cmbIsDelete 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Удалить после отправки"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.ComboBox cmbSended 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Отослано"
         Top             =   3420
         Width           =   3000
      End
      Begin VB.TextBox txtTheFromName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "От имени"
         Top             =   2715
         Width           =   3000
      End
      Begin VB.TextBox txtTheBody 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   4
         ToolTipText     =   "Сообщение"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtSubject 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Тема"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblSentDT 
         BackStyle       =   0  'Transparent
         Caption         =   "Отправлено:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblCreatedDT 
         BackStyle       =   0  'Transparent
         Caption         =   "Создано:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblIsDelete 
         BackStyle       =   0  'Transparent
         Caption         =   "Удалить после отправки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblSended 
         BackStyle       =   0  'Transparent
         Caption         =   "Отослано:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblTheFromName 
         BackStyle       =   0  'Transparent
         Caption         =   "От имени:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   2385
         Width           =   3000
      End
      Begin VB.Label lblTheBody 
         BackStyle       =   0  'Transparent
         Caption         =   "Сообщение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSubject 
         BackStyle       =   0  'Transparent
         Caption         =   "Тема:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "STDMail_Info"
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

Private Sub txtSubject_Change()
  Changing

End Sub
Private Sub txtTheBody_Change()
  Changing

End Sub
Private Sub txtTheFromName_Change()
  Changing

End Sub
Private Sub cmbSended_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsDelete_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub dtpCreatedDT_Change()
  Changing

End Sub
Private Sub dtpSentDT_Change()
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

If mIsOK Then mIsOK = IsSet(txtSubject.Text)
If mIsOK Then mIsOK = (cmbSended.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbIsDelete.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(dtpCreatedDT.Value)
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
txtSubject = Item.Subject
txtTheBody = Item.TheBody
  On Error Resume Next
txtTheFromName = Item.TheFromName
cmbSended.Clear
cmbSended.AddItem "Да"
cmbSended.ItemData(cmbSended.NewIndex) = -1
cmbSended.AddItem "Нет"
cmbSended.ItemData(cmbSended.NewIndex) = 0
 For iii = 0 To cmbSended.ListCount - 1
  If Item.Sended = cmbSended.ItemData(iii) Then
   cmbSended.ListIndex = iii
   Exit For
  End If
 Next
cmbIsDelete.Clear
cmbIsDelete.AddItem "Да"
cmbIsDelete.ItemData(cmbIsDelete.NewIndex) = -1
cmbIsDelete.AddItem "Нет"
cmbIsDelete.ItemData(cmbIsDelete.NewIndex) = 0
 For iii = 0 To cmbIsDelete.ListCount - 1
  If Item.IsDelete = cmbIsDelete.ItemData(iii) Then
   cmbIsDelete.ListIndex = iii
   Exit For
  End If
 Next
dtpCreatedDT = Now
If Item.CreatedDT <> 0 Then
 dtpCreatedDT = Item.CreatedDT
End If
dtpSentDT = Now
If Item.SentDT <> 0 Then
 dtpSentDT = Item.SentDT
Else
 dtpSentDT.Value = Null
End If
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

Item.Subject = txtSubject
Item.TheBody = txtTheBody
Item.TheFromName = txtTheFromName
 If cmbSended.ListIndex >= 0 Then
   Item.Sended = cmbSended.ItemData(cmbSended.ListIndex)
 End If
 If cmbIsDelete.ListIndex >= 0 Then
   Item.IsDelete = cmbIsDelete.ItemData(cmbIsDelete.ListIndex)
 End If
  If IsNull(dtpCreatedDT) Then
    Item.CreatedDT = 0
  Else
    Item.CreatedDT = dtpCreatedDT.Value
  End If
  If IsNull(dtpSentDT) Then
    Item.SentDT = 0
  Else
    Item.SentDT = dtpSentDT.Value
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



