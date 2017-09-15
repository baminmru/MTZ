VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl MTZ2JOB_DEF 
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
      Begin VB.ComboBox cmbProcessed 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   15
         ToolTipText     =   "Обработан"
         Top             =   4635
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpProcessDate 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Момент обработки"
         Top             =   3930
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   108920835
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtNextState 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Состояние после обработки"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtThruState 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Состояние - причина"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdThruObject 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Объект - причина события"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtThruObject 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Объект - причина события"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.TextBox txtEvenType 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Тип события"
         Top             =   1110
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEventDate 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "Отложено до"
         Top             =   405
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   108920835
         CurrentDate     =   39874
      End
      Begin VB.Label lblProcessed 
         BackStyle       =   0  'Transparent
         Caption         =   "Обработан:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblProcessDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Момент обработки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblNextState 
         BackStyle       =   0  'Transparent
         Caption         =   "Состояние после обработки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblThruState 
         BackStyle       =   0  'Transparent
         Caption         =   "Состояние - причина:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblThruObject 
         BackStyle       =   0  'Transparent
         Caption         =   "Объект - причина события:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblEvenType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип события:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblEventDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Отложено до:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "MTZ2JOB_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Описание отложенного события
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

Private Sub dtpEventDate_Change()
  Changing

End Sub
Private Sub txtEvenType_Change()
  Changing

End Sub
Private Sub txtThruObject_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdThruObject_CLick()
  On Error Resume Next
     If txtThruObject.Tag = "" Then
       cmdThruObject_MenuClick "Выбрать"
     Else
       cmdThruObject_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdThruObject_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtThruObject.Tag = ""
          txtThruObject = ""
  End If
  If sCaption = "Открыть" Then
    If txtThruObject.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtThruObject.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtThruObject.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "")
        If OK Then
          txtThruObject.Tag = Left(ID, 38)
          txtThruObject = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Set obj = Item.Application.Manager.GetNewObject()
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtThruObject.Tag = obj.ID
              txtThruObject = obj.brief
          Else
              txtThruObject.Tag = ""
              txtThruObject = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtThruState_Change()
  Changing

End Sub
Private Sub txtNextState_Change()
  Changing

End Sub
Private Sub dtpProcessDate_Change()
  Changing

End Sub
Private Sub cmbProcessed_Click()
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

If mIsOK Then mIsOK = IsSet(dtpEventDate.Value)
If mIsOK Then mIsOK = IsSet(txtEvenType.Text)
If mIsOK Then mIsOK = txtThruObject.Tag <> ""
If mIsOK Then mIsOK = (cmbProcessed.ListIndex >= 0)
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

dtpEventDate = Now
If Item.EventDate <> 0 Then
 dtpEventDate = Item.EventDate
End If
  On Error Resume Next
txtEvenType = Item.EvenType
If Not Item.ThruObject Is Nothing Then
  txtThruObject.Tag = Item.ThruObject.ID
  txtThruObject = Item.ThruObject.brief
Else
  txtThruObject.Tag = ""
  txtThruObject = ""
End If
 LoadBtnPictures cmdThruObject, cmdThruObject.Tag
  cmdThruObject.RemoveAllMenu
  cmdThruObject.AddMenu "Очистить"
  cmdThruObject.AddMenu "Создать"
  cmdThruObject.AddMenu "Выбрать"
  cmdThruObject.AddMenu "Открыть"
  On Error Resume Next
txtThruState = Item.ThruState
  On Error Resume Next
txtNextState = Item.NextState
dtpProcessDate = Now
If Item.ProcessDate <> 0 Then
 dtpProcessDate = Item.ProcessDate
Else
 dtpProcessDate.Value = Null
End If
cmbProcessed.Clear
cmbProcessed.AddItem "Да"
cmbProcessed.ItemData(cmbProcessed.NewIndex) = -1
cmbProcessed.AddItem "Нет"
cmbProcessed.ItemData(cmbProcessed.NewIndex) = 0
 For iii = 0 To cmbProcessed.ListCount - 1
  If Item.Processed = cmbProcessed.ItemData(iii) Then
   cmbProcessed.ListIndex = iii
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

  If IsNull(dtpEventDate) Then
    Item.EventDate = 0
  Else
    Item.EventDate = dtpEventDate.Value
  End If
Item.EvenType = txtEvenType
If txtThruObject.Tag <> "" Then
  Set Item.ThruObject = Item.Application.Manager.GetInstanceObject(txtThruObject.Tag)
Else
  Set Item.ThruObject = Nothing
End If
Item.ThruState = txtThruState
Item.NextState = txtNextState
  If IsNull(dtpProcessDate) Then
    Item.ProcessDate = 0
  Else
    Item.ProcessDate = dtpProcessDate.Value
  End If
 If cmbProcessed.ListIndex >= 0 Then
   Item.Processed = cmbProcessed.ItemData(cmbProcessed.ListIndex)
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



