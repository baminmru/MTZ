VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl osCli_def 
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
      Begin VB.TextBox txtChipCard 
         Height          =   300
         Left            =   3450
         MaxLength       =   128
         TabIndex        =   26
         ToolTipText     =   "Номер карты"
         Top             =   3225
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpMedicalCheck 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "Дата медосмотра"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16580611
         CurrentDate     =   39937
      End
      Begin VB.TextBox txtEnsurence 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   22
         ToolTipText     =   "Страховка"
         Top             =   1815
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpbDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         ToolTipText     =   "Дата рождения"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16580611
         CurrentDate     =   39937
      End
      Begin VB.TextBox txtemail 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   18
         ToolTipText     =   "E-MAIL"
         Top             =   405
         Width           =   3000
      End
      Begin MSComDlg.CommonDialog Dialog 
         Left            =   300
         Top             =   6090
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MTZ_PANEL.DropButton cmdTheFax 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "imageopen.ico"
         ToolTipText     =   "Фото"
         Top             =   6240
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPhone 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   14
         ToolTipText     =   "Телефон"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.TextBox txtpostAddr 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         ToolTipText     =   "Адрес"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbSex 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Пол"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtPassport 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   8
         ToolTipText     =   "Паспорт"
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
      Begin VB.TextBox txtFirstName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Имя"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFamilyName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Фамилия"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblChipCard 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер карты:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblMedicalCheck 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата медосмотра:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblEnsurence 
         BackStyle       =   0  'Transparent
         Caption         =   "Страховка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblbDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата рождения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblemail 
         BackStyle       =   0  'Transparent
         Caption         =   "E-MAIL:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   17
         Top             =   75
         Width           =   3000
      End
      Begin VB.Image imgTheFax 
         BorderStyle     =   1  'Fixed Single
         Height          =   1200
         Left            =   300
         Stretch         =   -1  'True
         ToolTipText     =   "Фото"
         Top             =   6240
         Width           =   2550
      End
      Begin VB.Label lblTheFax 
         BackStyle       =   0  'Transparent
         Caption         =   "Фото:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblPhone 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblpostAddr 
         BackStyle       =   0  'Transparent
         Caption         =   "Адрес:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblSex 
         BackStyle       =   0  'Transparent
         Caption         =   "Пол:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblPassport 
         BackStyle       =   0  'Transparent
         Caption         =   "Паспорт:"
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
      Begin VB.Label lblFirstName 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFamilyName 
         BackStyle       =   0  'Transparent
         Caption         =   "Фамилия:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "osCli_def"
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
 Dim m_TheFax






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

Private Sub txtFamilyName_Change()
  Changing

End Sub
Private Sub txtFirstName_Change()
  Changing

End Sub
Private Sub txtSurName_Change()
  Changing

End Sub
Private Sub txtPassport_Change()
  Changing

End Sub
Private Sub cmbSex_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtpostAddr_Change()
  Changing

End Sub
Private Sub txtPhone_Change()
  Changing

End Sub
Private Sub CMDTheFax_CLICK()
  On Error Resume Next

 Dialog.Flags = cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNPathMustExist
 Dialog.Filter = "(*.BMP;*.ICO;*.GIF;*.JPG)|*.BMP;*.ICO;*.GIF;*.JPG"
 Dialog.DialogTitle = "Файл изображения"
 Dialog.CancelError = True
 On Error Resume Next
 Dialog.ShowOpen
 If (err.Number > 0) Then
  err.Clear
  Exit Sub
 End If
 Set imgTheFax.Picture = LoadPicture(Dialog.FileName)
 Item.TheFax = FileToArray(Dialog.FileName)
 Changing

End Sub
Private Sub cmdTheFax_MenuClick(ByVal sCaption As String)

 Set imgTheFax.Picture = LoadPicture()
 Item.TheFax = Null
 Changing

End Sub
Private Sub txtemail_Change()
  Changing

End Sub
Private Sub dtpbDate_Change()
  Changing

End Sub
Private Sub txtEnsurence_Change()
  Changing

End Sub
Private Sub dtpMedicalCheck_Change()
  Changing

End Sub
Private Sub txtChipCard_Change()
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

If mIsOK Then mIsOK = IsSet(txtFamilyName.Text)
If mIsOK Then mIsOK = IsSet(txtFirstName.Text)
If mIsOK Then mIsOK = IsSet(txtpostAddr.Text)
If mIsOK Then mIsOK = IsSet(txtChipCard.Text)
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
txtFamilyName = Item.FamilyName
  On Error Resume Next
txtFirstName = Item.FirstName
  On Error Resume Next
txtSurName = Item.SurName
  On Error Resume Next
txtPassport = Item.Passport
cmbSex.Clear
cmbSex.AddItem "Мужской"
cmbSex.ItemData(cmbSex.NewIndex) = 1
cmbSex.AddItem "Не существенно"
cmbSex.ItemData(cmbSex.NewIndex) = 0
cmbSex.AddItem "Женский"
cmbSex.ItemData(cmbSex.NewIndex) = -1
 For iii = 0 To cmbSex.ListCount - 1
  If Item.Sex = cmbSex.ItemData(iii) Then
   cmbSex.ListIndex = iii
   Exit For
  End If
 Next
txtpostAddr = Item.postAddr
  On Error Resume Next
txtPhone = Item.Phone
 LoadImage imgTheFax, Item.TheFax
 LoadBtnPictures cmdTheFax, cmdTheFax.Tag
 cmdTheFax.RemoveAllMenu
 cmdTheFax.AddMenu "Очистить"
  On Error Resume Next
txtemail = Item.email
dtpbDate = Date
If Item.bDate <> 0 Then
 dtpbDate = Item.bDate
Else
 dtpbDate.Value = Null
End If
  On Error Resume Next
txtEnsurence = Item.Ensurence
dtpMedicalCheck = Date
If Item.MedicalCheck <> 0 Then
 dtpMedicalCheck = Item.MedicalCheck
Else
 dtpMedicalCheck.Value = Null
End If
  On Error Resume Next
txtChipCard = Item.ChipCard
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

Item.FamilyName = txtFamilyName
Item.FirstName = txtFirstName
Item.SurName = txtSurName
Item.Passport = txtPassport
 If cmbSex.ListIndex >= 0 Then
   Item.Sex = cmbSex.ItemData(cmbSex.ListIndex)
 End If
Item.postAddr = txtpostAddr
Item.Phone = txtPhone
 ' SEE cmdTheFax_CLICK
Item.email = txtemail
  If IsNull(dtpbDate) Then
    Item.bDate = 0
  Else
    Item.bDate = dtpbDate.Value
  End If
Item.Ensurence = txtEnsurence
  If IsNull(dtpMedicalCheck) Then
    Item.MedicalCheck = 0
  Else
    Item.MedicalCheck = dtpMedicalCheck.Value
  End If
Item.ChipCard = txtChipCard
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



