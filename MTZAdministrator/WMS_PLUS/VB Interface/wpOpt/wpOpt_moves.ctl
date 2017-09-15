VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl wpOpt_moves 
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
      Begin VB.ComboBox cmbRecordAccepted 
         Enabled         =   0   'False
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   15
         ToolTipText     =   "Перемещение зафиксировано"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbMoved 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         ToolTipText     =   "Перемещение произведено"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdToCell 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "В ячейку"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtToCell 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "В ячейку"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdFromCell 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Из ячейки"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFromCell 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Из ячейки"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdpallet 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Паллета"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtpallet 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Паллета"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtTheSequence 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер по порядку"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblRecordAccepted 
         BackStyle       =   0  'Transparent
         Caption         =   "Перемещение зафиксировано:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblMoved 
         BackStyle       =   0  'Transparent
         Caption         =   "Перемещение произведено:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblToCell 
         BackStyle       =   0  'Transparent
         Caption         =   "В ячейку:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFromCell 
         BackStyle       =   0  'Transparent
         Caption         =   "Из ячейки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblpallet 
         BackStyle       =   0  'Transparent
         Caption         =   "Паллета:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheSequence 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер по порядку:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "wpOpt_moves"
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

Private Sub txtTheSequence_Validate(cancel As Boolean)
If txtTheSequence.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheSequence.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheSequence.SetFocus
  ElseIf Val(txtTheSequence.Text) <> CLng(Val(txtTheSequence.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtTheSequence.SetFocus
  End If
End If
End Sub
Private Sub txtTheSequence_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheSequence_Change()
  Changing

End Sub
Private Sub txtpallet_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdpallet_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpPal_def", ID, brief) Then
          txtpallet.Tag = Left(ID, 38)
          txtpallet = brief
        End If
End Sub
Private Sub cmdpallet_MenuClick(ByVal sCaption As String)
          txtpallet.Tag = ""
          txtpallet = ""
End Sub
Private Sub txtFromCell_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFromCell_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpcell_cell", ID, brief) Then
          txtFromCell.Tag = Left(ID, 38)
          txtFromCell = brief
        End If
End Sub
Private Sub cmdFromCell_MenuClick(ByVal sCaption As String)
          txtFromCell.Tag = ""
          txtFromCell = ""
End Sub
Private Sub txtToCell_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdToCell_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpcell_cell", ID, brief) Then
          txtToCell.Tag = Left(ID, 38)
          txtToCell = brief
        End If
End Sub
Private Sub cmdToCell_MenuClick(ByVal sCaption As String)
          txtToCell.Tag = ""
          txtToCell = ""
End Sub
Private Sub cmbMoved_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbRecordAccepted_Click()
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

If mIsOK Then mIsOK = IsSet(txtTheSequence.Text)
If mIsOK Then mIsOK = txtpallet.Tag <> ""
If mIsOK Then mIsOK = txtFromCell.Tag <> ""
If mIsOK Then mIsOK = txtToCell.Tag <> ""
If mIsOK Then mIsOK = (cmbMoved.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbRecordAccepted.ListIndex >= 0)
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

txtTheSequence = Item.TheSequence
If Not Item.pallet Is Nothing Then
  txtpallet.Tag = Item.pallet.ID
  txtpallet = Item.pallet.brief
Else
  txtpallet.Tag = ""
  txtpallet = ""
End If
 LoadBtnPictures cmdpallet, cmdpallet.Tag
  cmdpallet.RemoveAllMenu
  cmdpallet.AddMenu "Очистить"
If Not Item.FromCell Is Nothing Then
  txtFromCell.Tag = Item.FromCell.ID
  txtFromCell = Item.FromCell.brief
Else
  txtFromCell.Tag = ""
  txtFromCell = ""
End If
 LoadBtnPictures cmdFromCell, cmdFromCell.Tag
  cmdFromCell.RemoveAllMenu
  cmdFromCell.AddMenu "Очистить"
If Not Item.ToCell Is Nothing Then
  txtToCell.Tag = Item.ToCell.ID
  txtToCell = Item.ToCell.brief
Else
  txtToCell.Tag = ""
  txtToCell = ""
End If
 LoadBtnPictures cmdToCell, cmdToCell.Tag
  cmdToCell.RemoveAllMenu
  cmdToCell.AddMenu "Очистить"
cmbMoved.Clear
cmbMoved.AddItem "Да"
cmbMoved.ItemData(cmbMoved.NewIndex) = -1
cmbMoved.AddItem "Нет"
cmbMoved.ItemData(cmbMoved.NewIndex) = 0
 For iii = 0 To cmbMoved.ListCount - 1
  If Item.Moved = cmbMoved.ItemData(iii) Then
   cmbMoved.ListIndex = iii
   Exit For
  End If
 Next
cmbRecordAccepted.Clear
cmbRecordAccepted.AddItem "Да"
cmbRecordAccepted.ItemData(cmbRecordAccepted.NewIndex) = -1
cmbRecordAccepted.AddItem "Нет"
cmbRecordAccepted.ItemData(cmbRecordAccepted.NewIndex) = 0
 For iii = 0 To cmbRecordAccepted.ListCount - 1
  If Item.RecordAccepted = cmbRecordAccepted.ItemData(iii) Then
   cmbRecordAccepted.ListIndex = iii
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

Item.TheSequence = CDbl(txtTheSequence)
If txtpallet.Tag <> "" Then
  Set Item.pallet = Item.Application.FindRowObject("wpPal_def", txtpallet.Tag)
Else
  Set Item.pallet = Nothing
End If
If txtFromCell.Tag <> "" Then
  Set Item.FromCell = Item.Application.FindRowObject("wpcell_cell", txtFromCell.Tag)
Else
  Set Item.FromCell = Nothing
End If
If txtToCell.Tag <> "" Then
  Set Item.ToCell = Item.Application.FindRowObject("wpcell_cell", txtToCell.Tag)
Else
  Set Item.ToCell = Nothing
End If
 If cmbMoved.ListIndex >= 0 Then
   Item.Moved = cmbMoved.ItemData(cmbMoved.ListIndex)
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



