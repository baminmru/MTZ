VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl Usersmain 
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
      Begin MSComCtl2.DTPicker dtpBirthDay 
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         ToolTipText     =   "Дата рождения"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   138543107
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtMobilePhone 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   19
         ToolTipText     =   "Мобильный телефон"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtLocalPhone 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   17
         ToolTipText     =   "Местный телефон"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtPhone 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   15
         ToolTipText     =   "Телефон"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdEMail 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "mailopen.ico"
         ToolTipText     =   "e-mail"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtEMail 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "e-mail"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.TextBox txtPassword 
         Height          =   300
         IMEMode         =   3  'DISABLE
         Left            =   300
         PasswordChar    =   "*"
         TabIndex        =   10
         ToolTipText     =   "Пароль"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtLogin 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   8
         ToolTipText     =   "Имя для входа"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtSurName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "Отчество"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   4
         ToolTipText     =   "Имя"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFamily 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Фамилия"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblBirthDay 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата рождения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblMobilePhone 
         BackStyle       =   0  'Transparent
         Caption         =   "Мобильный телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblLocalPhone 
         BackStyle       =   0  'Transparent
         Caption         =   "Местный телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblPhone 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblEMail 
         BackStyle       =   0  'Transparent
         Caption         =   "e-mail:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPassword 
         BackStyle       =   0  'Transparent
         Caption         =   "Пароль:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblLogin 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя для входа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSurName 
         BackStyle       =   0  'Transparent
         Caption         =   "Отчество:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFamily 
         BackStyle       =   0  'Transparent
         Caption         =   "Фамилия:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "Usersmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Пользователи
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

Private Sub txtFamily_Change()
  Changing

End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtSurName_Change()
  Changing

End Sub
Private Sub txtLogin_Change()
  Changing

End Sub
Private Sub txtPassword_Change()
  Changing

End Sub
Private Sub txtEMail_Change()
  Changing

End Sub
Private Sub cmdEMail_Click()
  On Error Resume Next
  Dim s As String
  s = s & "mailto:" & txtEMail.Text
  OpenDocument 0, s
End Sub
Private Sub txtPhone_Change()
  Changing

End Sub
Private Sub txtLocalPhone_Change()
  Changing

End Sub
Private Sub txtMobilePhone_Change()
  Changing

End Sub
Private Sub dtpBirthDay_Change()
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

  On Error Resume Next
txtFamily = Item.Family
  On Error Resume Next
txtName = Item.Name
  On Error Resume Next
txtSurName = Item.SurName
  On Error Resume Next
txtLogin = Item.Login
  On Error Resume Next
txtPassword = Item.Password
  On Error Resume Next
txtEMail = Item.EMail
 LoadBtnPictures cmdEMail, cmdEMail.Tag
  cmdEMail.RemoveAllMenu
  On Error Resume Next
txtPhone = Item.Phone
  On Error Resume Next
txtLocalPhone = Item.LocalPhone
  On Error Resume Next
txtMobilePhone = Item.MobilePhone
dtpBirthDay = Date
If Item.BirthDay <> 0 Then
 dtpBirthDay = Item.BirthDay
Else
 dtpBirthDay.Value = Null
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

Item.Family = txtFamily
Item.Name = txtName
Item.SurName = txtSurName
Item.Login = txtLogin
Item.Password = txtPassword
Item.EMail = txtEMail
Item.Phone = txtPhone
Item.LocalPhone = txtLocalPhone
Item.MobilePhone = txtMobilePhone
  If IsNull(dtpBirthDay) Then
    Item.BirthDay = 0
  Else
    Item.BirthDay = dtpBirthDay.Value
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



