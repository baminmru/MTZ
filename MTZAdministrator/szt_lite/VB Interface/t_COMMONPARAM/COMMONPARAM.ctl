VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl COMMONPARAM 
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
      Begin MSMask.MaskEdBox txtANAL_DAY_DEPTH 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Глубина анализа суточных архивов, сут"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtANAL_HOUR_DEPTH 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Глубина анализа часовых архивов, час"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtMAXDIFFARC 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Разница между врем. счетчика и сист. временем, при которой выводить сообщение и "
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.ComboBox cmbCSIGN 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "регистрир. и сигнализир. (при превыш. maxdiffsek)"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbCHECKDIFF 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "контроль ухода времени счетчика ('0' - да, '1' - нет)"
         Top             =   1110
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtMAXDIFFSEK 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "Разница между врем. счетчика и сист. временем, при которой выводить сообщение, с"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.Label lblANAL_DAY_DEPTH 
         BackStyle       =   0  'Transparent
         Caption         =   "Глубина анализа суточных архивов, сут:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblANAL_HOUR_DEPTH 
         BackStyle       =   0  'Transparent
         Caption         =   "Глубина анализа часовых архивов, час:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblMAXDIFFARC 
         BackStyle       =   0  'Transparent
         Caption         =   "Разница между врем. счетчика и сист. временем, при которой выводить сообщение и :"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCSIGN 
         BackStyle       =   0  'Transparent
         Caption         =   "регистрир. и сигнализир. (при превыш. maxdiffsek):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCHECKDIFF 
         BackStyle       =   0  'Transparent
         Caption         =   "контроль ухода времени счетчика ('0' - да, '1' - нет):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblMAXDIFFSEK 
         BackStyle       =   0  'Transparent
         Caption         =   "Разница между врем. счетчика и сист. временем, при которой выводить сообщение, с:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "COMMONPARAM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Общие параметры
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

Private Sub txtMAXDIFFSEK_Validate(cancel As Boolean)
If txtMAXDIFFSEK.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMAXDIFFSEK.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtMAXDIFFSEK.SetFocus
  ElseIf Val(txtMAXDIFFSEK.Text) < -922337203685478# Or Val(txtMAXDIFFSEK.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtMAXDIFFSEK.SetFocus
  End If
End If
End Sub
Private Sub txtMAXDIFFSEK_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMAXDIFFSEK_Change()
  Changing

End Sub
Private Sub cmbCHECKDIFF_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbCSIGN_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtMAXDIFFARC_Validate(cancel As Boolean)
If txtMAXDIFFARC.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMAXDIFFARC.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtMAXDIFFARC.SetFocus
  ElseIf Val(txtMAXDIFFARC.Text) < -922337203685478# Or Val(txtMAXDIFFARC.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtMAXDIFFARC.SetFocus
  End If
End If
End Sub
Private Sub txtMAXDIFFARC_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMAXDIFFARC_Change()
  Changing

End Sub
Private Sub txtANAL_HOUR_DEPTH_Validate(cancel As Boolean)
If txtANAL_HOUR_DEPTH.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtANAL_HOUR_DEPTH.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtANAL_HOUR_DEPTH.SetFocus
  ElseIf Val(txtANAL_HOUR_DEPTH.Text) < -922337203685478# Or Val(txtANAL_HOUR_DEPTH.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtANAL_HOUR_DEPTH.SetFocus
  End If
End If
End Sub
Private Sub txtANAL_HOUR_DEPTH_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtANAL_HOUR_DEPTH_Change()
  Changing

End Sub
Private Sub txtANAL_DAY_DEPTH_Validate(cancel As Boolean)
If txtANAL_DAY_DEPTH.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtANAL_DAY_DEPTH.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtANAL_DAY_DEPTH.SetFocus
  ElseIf Val(txtANAL_DAY_DEPTH.Text) < -922337203685478# Or Val(txtANAL_DAY_DEPTH.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtANAL_DAY_DEPTH.SetFocus
  End If
End If
End Sub
Private Sub txtANAL_DAY_DEPTH_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtANAL_DAY_DEPTH_Change()
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

txtMAXDIFFSEK = Item.MAXDIFFSEK
cmbCHECKDIFF.Clear
cmbCHECKDIFF.AddItem "Да"
cmbCHECKDIFF.ItemData(cmbCHECKDIFF.NewIndex) = -1
cmbCHECKDIFF.AddItem "Нет"
cmbCHECKDIFF.ItemData(cmbCHECKDIFF.NewIndex) = 0
 For iii = 0 To cmbCHECKDIFF.ListCount - 1
  If Item.CHECKDIFF = cmbCHECKDIFF.ItemData(iii) Then
   cmbCHECKDIFF.ListIndex = iii
   Exit For
  End If
 Next
cmbCSIGN.Clear
cmbCSIGN.AddItem "Да"
cmbCSIGN.ItemData(cmbCSIGN.NewIndex) = -1
cmbCSIGN.AddItem "Нет"
cmbCSIGN.ItemData(cmbCSIGN.NewIndex) = 0
 For iii = 0 To cmbCSIGN.ListCount - 1
  If Item.CSIGN = cmbCSIGN.ItemData(iii) Then
   cmbCSIGN.ListIndex = iii
   Exit For
  End If
 Next
txtMAXDIFFARC = Item.MAXDIFFARC
txtANAL_HOUR_DEPTH = Item.ANAL_HOUR_DEPTH
txtANAL_DAY_DEPTH = Item.ANAL_DAY_DEPTH
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

Item.MAXDIFFSEK = CDbl(txtMAXDIFFSEK)
 If cmbCHECKDIFF.ListIndex >= 0 Then
   Item.CHECKDIFF = cmbCHECKDIFF.ItemData(cmbCHECKDIFF.ListIndex)
 End If
 If cmbCSIGN.ListIndex >= 0 Then
   Item.CSIGN = cmbCSIGN.ItemData(cmbCSIGN.ListIndex)
 End If
Item.MAXDIFFARC = CDbl(txtMAXDIFFARC)
Item.ANAL_HOUR_DEPTH = CDbl(txtANAL_HOUR_DEPTH)
Item.ANAL_DAY_DEPTH = CDbl(txtANAL_DAY_DEPTH)
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



