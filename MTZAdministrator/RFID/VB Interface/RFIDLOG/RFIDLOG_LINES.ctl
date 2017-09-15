VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl RFIDLOG_LINES 
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
      Begin VB.TextBox txtTheAntenna 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   10
         ToolTipText     =   "Антенна"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbEventProcessed 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Событие обработано"
         Top             =   2520
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEventDate 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "Дата регистрации события"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   70778883
         CurrentDate     =   39804
      End
      Begin VB.ComboBox cmbLabelIn 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "Начало регистрации метки"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTheLabel 
         Height          =   300
         Left            =   300
         MaxLength       =   24
         TabIndex        =   2
         ToolTipText     =   "Метка"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblTheAntenna 
         BackStyle       =   0  'Transparent
         Caption         =   "Антенна:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblEventProcessed 
         BackStyle       =   0  'Transparent
         Caption         =   "Событие обработано:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblEventDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата регистрации события:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblLabelIn 
         BackStyle       =   0  'Transparent
         Caption         =   "Начало регистрации метки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheLabel 
         BackStyle       =   0  'Transparent
         Caption         =   "Метка:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "RFIDLOG_LINES"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 350
Option Explicit


'панель редактирования раздела
   Public item As Object
Attribute item.VB_VarHelpID = 385
   Private OnInit As Boolean
   Public Event Changed()
Attribute Changed.VB_HelpID = 355
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
Attribute IsChanged.VB_HelpID = 375
  IsChanged = mIsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtTheLabel_Change()
  Changing

End Sub
Private Sub cmbLabelIn_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub dtpEventDate_Change()
  Changing

End Sub
Private Sub cmbEventProcessed_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtTheAntenna_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set item = Nothing
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
Attribute IsOK.VB_HelpID = 380
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtTheLabel.Text)
If mIsOK Then mIsOK = IsSet(dtpEventDate.Value)
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
  For Each Node In XMLDocFrom.childNodes.item(0).childNodes
    If (Node.baseName = "ID") Then
      ID = Node.Text
      Dim NodeTO As MSXML2.IXMLDOMNode
      Dim bAdded As Boolean
      bAdded = False
      For Each NodeTO In XMLDocTo.childNodes.item(0).childNodes
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
       Call XMLDocTo.childNodes.item(0).appendChild(newNode)
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
Attribute InitPanel.VB_HelpID = 370
OnInit = True
Dim iii As Long ' for combo only
If item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

  On Error Resume Next
txtTheLabel = item.TheLabel
cmbLabelIn.Clear
cmbLabelIn.AddItem "Да"
cmbLabelIn.ItemData(cmbLabelIn.NewIndex) = -1
cmbLabelIn.AddItem "Нет"
cmbLabelIn.ItemData(cmbLabelIn.NewIndex) = 0
 For iii = 0 To cmbLabelIn.ListCount - 1
  If item.LabelIn = cmbLabelIn.ItemData(iii) Then
   cmbLabelIn.ListIndex = iii
   Exit For
  End If
 Next
dtpEventDate = Now
If item.EventDate <> 0 Then
 dtpEventDate = item.EventDate
End If
cmbEventProcessed.Clear
cmbEventProcessed.AddItem "Да"
cmbEventProcessed.ItemData(cmbEventProcessed.NewIndex) = -1
cmbEventProcessed.AddItem "Нет"
cmbEventProcessed.ItemData(cmbEventProcessed.NewIndex) = 0
 For iii = 0 To cmbEventProcessed.ListCount - 1
  If item.EventProcessed = cmbEventProcessed.ItemData(iii) Then
   cmbEventProcessed.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtTheAntenna = item.TheAntenna
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
Attribute Save.VB_HelpID = 405
If OnInit Then Exit Sub

item.TheLabel = txtTheLabel
 If cmbLabelIn.ListIndex >= 0 Then
   item.LabelIn = cmbLabelIn.ItemData(cmbLabelIn.ListIndex)
 End If
  If IsNull(dtpEventDate) Then
    item.EventDate = 0
  Else
    item.EventDate = dtpEventDate.Value
  End If
 If cmbEventProcessed.ListIndex >= 0 Then
   item.EventProcessed = cmbEventProcessed.ItemData(cmbEventProcessed.ListIndex)
 End If
item.TheAntenna = txtTheAntenna
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
 Public Sub OptimalSize(X As Single, Y As Single)
Attribute OptimalSize.VB_HelpID = 390
   Panel.OptimalSize X, Y
   X = X + Panel.Left
   Y = Y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
Attribute OptimalY.VB_HelpID = 395
   Dim X As Single, Y As Single
   Panel.OptimalSize X, Y
   OptimalY = Y
 End Function

'Открытие окна настройки панели
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
Attribute Customize.VB_HelpID = 360
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
Attribute PanelCustomisationString.VB_HelpID = 400
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
Attribute Enabled.VB_HelpID = 365
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



