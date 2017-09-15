VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl osDic_srvtypeadmi 
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
      Begin MSMask.MaskEdBox txtCost 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Стоимость"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtTotalVisit 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   12
         ToolTipText     =   "Посещений всего"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.TextBox txtVisitPerDay 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   10
         ToolTipText     =   "Посещений в день"
         Top             =   3225
         Width           =   1800
      End
      Begin MSComCtl2.DTPicker dtpTimeTo 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Время действия По"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "HH:mm:ss"
         Format          =   16515075
         UpDown          =   -1  'True
         CurrentDate     =   39937
      End
      Begin MSComCtl2.DTPicker dtpTimeFrom 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "Время действия С"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "HH:mm:ss"
         Format          =   16515075
         UpDown          =   -1  'True
         CurrentDate     =   39937
      End
      Begin VB.TextBox txtTheName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtSrok 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Срок действия"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblCost 
         BackStyle       =   0  'Transparent
         Caption         =   "Стоимость:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTotalVisit 
         BackStyle       =   0  'Transparent
         Caption         =   "Посещений всего:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblVisitPerDay 
         BackStyle       =   0  'Transparent
         Caption         =   "Посещений в день:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTimeTo 
         BackStyle       =   0  'Transparent
         Caption         =   "Время действия По:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTimeFrom 
         BackStyle       =   0  'Transparent
         Caption         =   "Время действия С:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSrok 
         BackStyle       =   0  'Transparent
         Caption         =   "Срок действия:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "osDic_srvtypeadmi"
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

Private Sub txtSrok_Validate(cancel As Boolean)
If txtSrok.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSrok.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtSrok.SetFocus
  ElseIf Val(txtSrok.Text) <> CLng(Val(txtSrok.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtSrok.SetFocus
  End If
End If
End Sub
Private Sub txtSrok_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtSrok_Change()
  Changing

End Sub
Private Sub txtTheName_Change()
  Changing

End Sub
Private Sub dtpTimeFrom_Change()
  Changing

End Sub
Private Sub dtpTimeTo_Change()
  Changing

End Sub
Private Sub txtVisitPerDay_Validate(cancel As Boolean)
If txtVisitPerDay.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtVisitPerDay.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtVisitPerDay.SetFocus
  ElseIf Val(txtVisitPerDay.Text) <> CLng(Val(txtVisitPerDay.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtVisitPerDay.SetFocus
  End If
End If
End Sub
Private Sub txtVisitPerDay_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtVisitPerDay_Change()
  Changing

End Sub
Private Sub txtTotalVisit_Validate(cancel As Boolean)
If txtTotalVisit.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTotalVisit.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTotalVisit.SetFocus
  ElseIf Val(txtTotalVisit.Text) <> CLng(Val(txtTotalVisit.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtTotalVisit.SetFocus
  End If
End If
End Sub
Private Sub txtTotalVisit_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTotalVisit_Change()
  Changing

End Sub
Private Sub txtCost_Validate(cancel As Boolean)
If txtCost.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCost.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCost.SetFocus
  ElseIf Val(txtCost.Text) < -922337203685478# Or Val(txtCost.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCost.SetFocus
  End If
End If
End Sub
Private Sub txtCost_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCost_Change()
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

txtSrok = Item.Srok
  On Error Resume Next
txtTheName = Item.TheName
dtpTimeFrom = Time
If Item.TimeFrom <> 0 Then
 dtpTimeFrom = Item.TimeFrom
Else
 dtpTimeFrom.Value = Null
End If
dtpTimeTo = Time
If Item.TimeTo <> 0 Then
 dtpTimeTo = Item.TimeTo
Else
 dtpTimeTo.Value = Null
End If
txtVisitPerDay = Item.VisitPerDay
txtTotalVisit = Item.TotalVisit
txtCost = Item.Cost
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

Item.Srok = CDbl(txtSrok)
Item.TheName = txtTheName
  If IsNull(dtpTimeFrom) Then
    Item.TimeFrom = 0
  Else
    Item.TimeFrom = dtpTimeFrom.Value
  End If
  If IsNull(dtpTimeTo) Then
    Item.TimeTo = 0
  Else
    Item.TimeTo = dtpTimeTo.Value
  End If
Item.VisitPerDay = CDbl(txtVisitPerDay)
Item.TotalVisit = CDbl(txtTotalVisit)
Item.Cost = CDbl(txtCost)
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



