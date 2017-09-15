VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl LOG_HEADER 
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
      Begin VB.TextBox txtQDay 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   15
         ToolTipText     =   "День опроса"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.TextBox txtQMonth 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   13
         ToolTipText     =   "Месяц опроса"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.TextBox txtQYear 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   11
         ToolTipText     =   "Год опроса"
         Top             =   2520
         Width           =   1800
      End
      Begin MTZ_PANEL.DropButton cmdID_PTYPE 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип параметра"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_PTYPE 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Тип параметра"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdID_DU 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Подключенное устройство"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_DU 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Подключенное устройство"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdID_BD 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Устройство"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_BD 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Устройство"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblQDay 
         BackStyle       =   0  'Transparent
         Caption         =   "День опроса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblQMonth 
         BackStyle       =   0  'Transparent
         Caption         =   "Месяц опроса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblQYear 
         BackStyle       =   0  'Transparent
         Caption         =   "Год опроса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblID_PTYPE 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип параметра:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblID_DU 
         BackStyle       =   0  'Transparent
         Caption         =   "Подключенное устройство:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblID_BD 
         BackStyle       =   0  'Transparent
         Caption         =   "Устройство:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "LOG_HEADER"
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

Private Sub txtID_BD_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_BD_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("BDEVICES", ID, brief) Then
          txtID_BD.Tag = Left(ID, 38)
          txtID_BD = brief
        End If
End Sub
Private Sub cmdID_BD_MenuClick(ByVal sCaption As String)
          txtID_BD.Tag = ""
          txtID_BD = ""
End Sub
Private Sub txtID_DU_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_DU_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("DEVUNITS", ID, brief) Then
          txtID_DU.Tag = Left(ID, 38)
          txtID_DU = brief
        End If
End Sub
Private Sub cmdID_DU_MenuClick(ByVal sCaption As String)
          txtID_DU.Tag = ""
          txtID_DU = ""
End Sub
Private Sub txtID_PTYPE_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_PTYPE_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PARAMTYPE", ID, brief) Then
          txtID_PTYPE.Tag = Left(ID, 38)
          txtID_PTYPE = brief
        End If
End Sub
Private Sub cmdID_PTYPE_MenuClick(ByVal sCaption As String)
          txtID_PTYPE.Tag = ""
          txtID_PTYPE = ""
End Sub
Private Sub txtQYear_Validate(cancel As Boolean)
If txtQYear.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQYear.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQYear.SetFocus
  ElseIf Val(txtQYear.Text) <> CLng(Val(txtQYear.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtQYear.SetFocus
  End If
End If
End Sub
Private Sub txtQYear_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQYear_Change()
  Changing

End Sub
Private Sub txtQMonth_Validate(cancel As Boolean)
If txtQMonth.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQMonth.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQMonth.SetFocus
  ElseIf Val(txtQMonth.Text) <> CLng(Val(txtQMonth.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtQMonth.SetFocus
  End If
End If
End Sub
Private Sub txtQMonth_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQMonth_Change()
  Changing

End Sub
Private Sub txtQDay_Validate(cancel As Boolean)
If txtQDay.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQDay.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQDay.SetFocus
  ElseIf Val(txtQDay.Text) <> CLng(Val(txtQDay.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtQDay.SetFocus
  End If
End If
End Sub
Private Sub txtQDay_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQDay_Change()
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

If Not Item.ID_BD Is Nothing Then
  txtID_BD.Tag = Item.ID_BD.ID
  txtID_BD = Item.ID_BD.brief
Else
  txtID_BD.Tag = ""
  txtID_BD = ""
End If
 LoadBtnPictures cmdID_BD, cmdID_BD.Tag
  cmdID_BD.RemoveAllMenu
  cmdID_BD.AddMenu "Очистить"
If Not Item.ID_DU Is Nothing Then
  txtID_DU.Tag = Item.ID_DU.ID
  txtID_DU = Item.ID_DU.brief
Else
  txtID_DU.Tag = ""
  txtID_DU = ""
End If
 LoadBtnPictures cmdID_DU, cmdID_DU.Tag
  cmdID_DU.RemoveAllMenu
  cmdID_DU.AddMenu "Очистить"
If Not Item.ID_PTYPE Is Nothing Then
  txtID_PTYPE.Tag = Item.ID_PTYPE.ID
  txtID_PTYPE = Item.ID_PTYPE.brief
Else
  txtID_PTYPE.Tag = ""
  txtID_PTYPE = ""
End If
 LoadBtnPictures cmdID_PTYPE, cmdID_PTYPE.Tag
  cmdID_PTYPE.RemoveAllMenu
  cmdID_PTYPE.AddMenu "Очистить"
txtQYear = Item.QYear
txtQMonth = Item.QMonth
txtQDay = Item.QDay
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

If txtID_BD.Tag <> "" Then
  Set Item.ID_BD = Item.Application.FindRowObject("BDEVICES", txtID_BD.Tag)
Else
  Set Item.ID_BD = Nothing
End If
If txtID_DU.Tag <> "" Then
  Set Item.ID_DU = Item.Application.FindRowObject("DEVUNITS", txtID_DU.Tag)
Else
  Set Item.ID_DU = Nothing
End If
If txtID_PTYPE.Tag <> "" Then
  Set Item.ID_PTYPE = Item.Application.FindRowObject("PARAMTYPE", txtID_PTYPE.Tag)
Else
  Set Item.ID_PTYPE = Nothing
End If
Item.QYear = CDbl(txtQYear)
Item.QMonth = CDbl(txtQMonth)
Item.QDay = CDbl(txtQDay)
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



