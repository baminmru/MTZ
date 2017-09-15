VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl ITTPR_DEF 
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
      Begin MSMask.MaskEdBox txtOutBoxes 
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         ToolTipText     =   "Отгружено коробов"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtInBoxes 
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         ToolTipText     =   "Принято коробов"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtWeightDelta 
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         ToolTipText     =   "Расхождение по весу"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSComCtl2.DTPicker dtpTheDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         ToolTipText     =   "Дата протокола"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16515075
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtClient 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   24
         ToolTipText     =   "Поклажедатель"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtBrak 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   30
         TabIndex        =   22
         ToolTipText     =   "Брак"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtKillPlace 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   20
         ToolTipText     =   "Бойня"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtFactory 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   18
         ToolTipText     =   "Завод"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtCountry 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   16
         ToolTipText     =   "Страна"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtDescription 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   14
         ToolTipText     =   "Описание товара"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtGood 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   12
         ToolTipText     =   "Товар"
         Top             =   3930
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtVesi 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Погрешность весов"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtMoroz 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Расчетная выморозка"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtOutWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "Вес отгрузок"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtInWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Вес при приемке"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtPoddon 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   2
         ToolTipText     =   "Поддон"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblOutBoxes 
         BackStyle       =   0  'Transparent
         Caption         =   "Отгружено коробов:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblInBoxes 
         BackStyle       =   0  'Transparent
         Caption         =   "Принято коробов:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblWeightDelta 
         BackStyle       =   0  'Transparent
         Caption         =   "Расхождение по весу:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTheDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата протокола:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Поклажедатель:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblBrak 
         BackStyle       =   0  'Transparent
         Caption         =   "Брак:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblKillPlace 
         BackStyle       =   0  'Transparent
         Caption         =   "Бойня:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFactory 
         BackStyle       =   0  'Transparent
         Caption         =   "Завод:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblCountry 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblDescription 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание товара:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblGood 
         BackStyle       =   0  'Transparent
         Caption         =   "Товар:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblVesi 
         BackStyle       =   0  'Transparent
         Caption         =   "Погрешность весов:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblMoroz 
         BackStyle       =   0  'Transparent
         Caption         =   "Расчетная выморозка:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblOutWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес отгрузок:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblInWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес при приемке:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPoddon 
         BackStyle       =   0  'Transparent
         Caption         =   "Поддон:"
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
Attribute VB_Name = "ITTPR_DEF"
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
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, cancel)
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

Private Sub txtPoddon_Change()
  Changing

End Sub
Private Sub txtInWeight_Change()
  Changing

End Sub
Private Sub txtOutWeight_Change()
  Changing

End Sub
Private Sub txtMoroz_Change()
  Changing

End Sub
Private Sub txtVesi_Change()
  Changing

End Sub
Private Sub txtGood_Change()
  Changing

End Sub
Private Sub txtDescription_Change()
  Changing

End Sub
Private Sub txtCountry_Change()
  Changing

End Sub
Private Sub txtFactory_Change()
  Changing

End Sub
Private Sub txtKillPlace_Change()
  Changing

End Sub
Private Sub txtBrak_Change()
  Changing

End Sub
Private Sub txtClient_Change()
  Changing

End Sub
Private Sub dtpTheDate_Change()
  Changing

End Sub
Private Sub txtWeightDelta_Change()
  Changing

End Sub
Private Sub txtInBoxes_Validate(cancel As Boolean)
If txtInBoxes.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtInBoxes.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtInBoxes.SetFocus
  ElseIf Val(txtInBoxes.Text) < -922337203685478# Or Val(txtInBoxes.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtInBoxes.SetFocus
  End If
End If
End Sub
Private Sub txtInBoxes_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtInBoxes_Change()
  Changing

End Sub
Private Sub txtOutBoxes_Validate(cancel As Boolean)
If txtOutBoxes.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtOutBoxes.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtOutBoxes.SetFocus
  ElseIf Val(txtOutBoxes.Text) < -922337203685478# Or Val(txtOutBoxes.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtOutBoxes.SetFocus
  End If
End If
End Sub
Private Sub txtOutBoxes_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtOutBoxes_Change()
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
txtPoddon = Item.Poddon
txtInWeight = Item.InWeight
txtOutWeight = Item.OutWeight
txtMoroz = Item.Moroz
txtVesi = Item.Vesi
  On Error Resume Next
txtGood = Item.Good
  On Error Resume Next
txtDescription = Item.Description
  On Error Resume Next
txtCountry = Item.Country
  On Error Resume Next
txtFactory = Item.Factory
  On Error Resume Next
txtKillPlace = Item.KillPlace
  On Error Resume Next
txtBrak = Item.Brak
  On Error Resume Next
txtClient = Item.Client
dtpTheDate = Date
If Item.TheDate <> 0 Then
 dtpTheDate = Item.TheDate
Else
 dtpTheDate.Value = Null
End If
txtWeightDelta = Item.WeightDelta
txtInBoxes = Item.InBoxes
txtOutBoxes = Item.OutBoxes
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

Item.InBoxes = CDbl(txtInBoxes)
Item.OutBoxes = CDbl(txtOutBoxes)
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



