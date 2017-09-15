VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl wpShift_def 
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
      Begin MTZ_PANEL.DropButton cmdTheCell 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Новая ячейка"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCell 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Новая ячейка"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdpallet 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Паллета"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtpallet 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Паллета"
         Top             =   1815
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtptheDate 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Дата документа"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16515075
         CurrentDate     =   39926
      End
      Begin VB.TextBox txttheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер документа"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblTheCell 
         BackStyle       =   0  'Transparent
         Caption         =   "Новая ячейка:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblpallet 
         BackStyle       =   0  'Transparent
         Caption         =   "Паллета:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lbltheDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата документа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lbltheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер документа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "wpShift_def"
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

Private Sub txttheNumber_Validate(cancel As Boolean)
If txttheNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txttheNumber.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txttheNumber.SetFocus
  ElseIf Val(txttheNumber.Text) <> CLng(Val(txttheNumber.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txttheNumber.SetFocus
  End If
End If
End Sub
Private Sub txttheNumber_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txttheNumber_Change()
  Changing

End Sub
Private Sub dtptheDate_Change()
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
Private Sub txtTheCell_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCell_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpcell_cell", ID, brief) Then
          txtTheCell.Tag = Left(ID, 38)
          txtTheCell = brief
        End If
End Sub
Private Sub cmdTheCell_MenuClick(ByVal sCaption As String)
          txtTheCell.Tag = ""
          txtTheCell = ""
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

If mIsOK Then mIsOK = IsSet(txttheNumber.Text)
If mIsOK Then mIsOK = IsSet(dtptheDate.Value)
If mIsOK Then mIsOK = txtpallet.Tag <> ""
If mIsOK Then mIsOK = txtTheCell.Tag <> ""
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

txttheNumber = Item.theNumber
dtptheDate = Date
If Item.theDate <> 0 Then
 dtptheDate = Item.theDate
End If
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
If Not Item.TheCell Is Nothing Then
  txtTheCell.Tag = Item.TheCell.ID
  txtTheCell = Item.TheCell.brief
Else
  txtTheCell.Tag = ""
  txtTheCell = ""
End If
 LoadBtnPictures cmdTheCell, cmdTheCell.Tag
  cmdTheCell.RemoveAllMenu
  cmdTheCell.AddMenu "Очистить"
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

Item.theNumber = CDbl(txttheNumber)
  If IsNull(dtptheDate) Then
    Item.theDate = 0
  Else
    Item.theDate = dtptheDate.Value
  End If
If txtpallet.Tag <> "" Then
  Set Item.pallet = Item.Application.FindRowObject("wpPal_def", txtpallet.Tag)
Else
  Set Item.pallet = Nothing
End If
If txtTheCell.Tag <> "" Then
  Set Item.TheCell = Item.Application.FindRowObject("wpcell_cell", txtTheCell.Tag)
Else
  Set Item.TheCell = Nothing
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



