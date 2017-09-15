VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl wpDic_orgAcc 
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
      Begin VB.ComboBox cmbUseThisAccount 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   15
         ToolTipText     =   "Использовать этот счет в документах"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtKorSchet 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   13
         ToolTipText     =   "Кор. счет банка"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtBankINN 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   11
         ToolTipText     =   "ИНН Банка"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtBIC 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   9
         ToolTipText     =   "БИК"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtTheBank 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   7
         ToolTipText     =   "Название Банка"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtAccNum 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   5
         ToolTipText     =   "Номер счета"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheOrg 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Организация"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheOrg 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Организация"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblUseThisAccount 
         BackStyle       =   0  'Transparent
         Caption         =   "Использовать этот счет в документах:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblKorSchet 
         BackStyle       =   0  'Transparent
         Caption         =   "Кор. счет банка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblBankINN 
         BackStyle       =   0  'Transparent
         Caption         =   "ИНН Банка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblBIC 
         BackStyle       =   0  'Transparent
         Caption         =   "БИК:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheBank 
         BackStyle       =   0  'Transparent
         Caption         =   "Название Банка:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblAccNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер счета:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheOrg 
         BackStyle       =   0  'Transparent
         Caption         =   "Организация:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "wpDic_orgAcc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Счета организации
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

Private Sub txtTheOrg_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheOrg_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpDic_org", ID, brief) Then
          txtTheOrg.Tag = Left(ID, 38)
          txtTheOrg = brief
        End If
End Sub
Private Sub cmdTheOrg_MenuClick(ByVal sCaption As String)
          txtTheOrg.Tag = ""
          txtTheOrg = ""
End Sub
Private Sub txtAccNum_Change()
  Changing

End Sub
Private Sub txtTheBank_Change()
  Changing

End Sub
Private Sub txtBIC_Change()
  Changing

End Sub
Private Sub txtBankINN_Change()
  Changing

End Sub
Private Sub txtKorSchet_Change()
  Changing

End Sub
Private Sub cmbUseThisAccount_Click()
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

If mIsOK Then mIsOK = txtTheOrg.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtAccNum.Text)
If mIsOK Then mIsOK = IsSet(txtTheBank.Text)
If mIsOK Then mIsOK = IsSet(txtBIC.Text)
If mIsOK Then mIsOK = (cmbUseThisAccount.ListIndex >= 0)
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

If Not Item.TheOrg Is Nothing Then
  txtTheOrg.Tag = Item.TheOrg.ID
  txtTheOrg = Item.TheOrg.brief
Else
  txtTheOrg.Tag = ""
  txtTheOrg = ""
End If
 LoadBtnPictures cmdTheOrg, cmdTheOrg.Tag
  cmdTheOrg.RemoveAllMenu
  cmdTheOrg.AddMenu "Очистить"
  On Error Resume Next
txtAccNum = Item.AccNum
  On Error Resume Next
txtTheBank = Item.TheBank
  On Error Resume Next
txtBIC = Item.BIC
  On Error Resume Next
txtBankINN = Item.BankINN
  On Error Resume Next
txtKorSchet = Item.KorSchet
cmbUseThisAccount.Clear
cmbUseThisAccount.AddItem "Да"
cmbUseThisAccount.ItemData(cmbUseThisAccount.NewIndex) = -1
cmbUseThisAccount.AddItem "Нет"
cmbUseThisAccount.ItemData(cmbUseThisAccount.NewIndex) = 0
 For iii = 0 To cmbUseThisAccount.ListCount - 1
  If Item.UseThisAccount = cmbUseThisAccount.ItemData(iii) Then
   cmbUseThisAccount.ListIndex = iii
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

If txtTheOrg.Tag <> "" Then
  Set Item.TheOrg = Item.Application.FindRowObject("wpDic_org", txtTheOrg.Tag)
Else
  Set Item.TheOrg = Nothing
End If
Item.AccNum = txtAccNum
Item.TheBank = txtTheBank
Item.BIC = txtBIC
Item.BankINN = txtBankINN
Item.KorSchet = txtKorSchet
 If cmbUseThisAccount.ListIndex >= 0 Then
   Item.UseThisAccount = cmbUseThisAccount.ItemData(cmbUseThisAccount.ListIndex)
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



