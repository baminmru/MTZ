VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl VALUEBOUNDS 
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
      Begin VB.ComboBox cmbISMAX 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         ToolTipText     =   "Проверять на максимум"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbISMIN 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "Проверять на минимум"
         Top             =   3225
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtPMAX 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Максимальное значение"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtPMIN 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Минимальное значение"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdPTYPE 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип архива"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPTYPE 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Тип архива"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtPNAME 
         Height          =   300
         Left            =   300
         MaxLength       =   128
         TabIndex        =   2
         ToolTipText     =   "Имя параметра"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblISMAX 
         BackStyle       =   0  'Transparent
         Caption         =   "Проверять на максимум:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblISMIN 
         BackStyle       =   0  'Transparent
         Caption         =   "Проверять на минимум:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblPMAX 
         BackStyle       =   0  'Transparent
         Caption         =   "Максимальное значение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPMIN 
         BackStyle       =   0  'Transparent
         Caption         =   "Минимальное значение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPTYPE 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип архива:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPNAME 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя параметра:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "VALUEBOUNDS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Граничные значения проверяемых параметров
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

Private Sub txtPNAME_Change()
  Changing

End Sub
Private Sub txtPTYPE_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPTYPE_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PARAMTYPE", ID, brief) Then
          txtPTYPE.Tag = Left(ID, 38)
          txtPTYPE = brief
        End If
End Sub
Private Sub cmdPTYPE_MenuClick(ByVal sCaption As String)
          txtPTYPE.Tag = ""
          txtPTYPE = ""
End Sub
Private Sub txtPMIN_Validate(cancel As Boolean)
If txtPMIN.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPMIN.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPMIN.SetFocus
  ElseIf Val(txtPMIN.Text) < -922337203685478# Or Val(txtPMIN.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPMIN.SetFocus
  End If
End If
End Sub
Private Sub txtPMIN_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPMIN_Change()
  Changing

End Sub
Private Sub txtPMAX_Validate(cancel As Boolean)
If txtPMAX.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPMAX.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPMAX.SetFocus
  ElseIf Val(txtPMAX.Text) < -922337203685478# Or Val(txtPMAX.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPMAX.SetFocus
  End If
End If
End Sub
Private Sub txtPMAX_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPMAX_Change()
  Changing

End Sub
Private Sub cmbISMIN_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbISMAX_Click()
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
txtPNAME = Item.PNAME
If Not Item.PTYPE Is Nothing Then
  txtPTYPE.Tag = Item.PTYPE.ID
  txtPTYPE = Item.PTYPE.brief
Else
  txtPTYPE.Tag = ""
  txtPTYPE = ""
End If
 LoadBtnPictures cmdPTYPE, cmdPTYPE.Tag
  cmdPTYPE.RemoveAllMenu
  cmdPTYPE.AddMenu "Очистить"
txtPMIN = Item.PMIN
txtPMAX = Item.PMAX
cmbISMIN.Clear
cmbISMIN.AddItem "Да"
cmbISMIN.ItemData(cmbISMIN.NewIndex) = -1
cmbISMIN.AddItem "Нет"
cmbISMIN.ItemData(cmbISMIN.NewIndex) = 0
 For iii = 0 To cmbISMIN.ListCount - 1
  If Item.ISMIN = cmbISMIN.ItemData(iii) Then
   cmbISMIN.ListIndex = iii
   Exit For
  End If
 Next
cmbISMAX.Clear
cmbISMAX.AddItem "Да"
cmbISMAX.ItemData(cmbISMAX.NewIndex) = -1
cmbISMAX.AddItem "Нет"
cmbISMAX.ItemData(cmbISMAX.NewIndex) = 0
 For iii = 0 To cmbISMAX.ListCount - 1
  If Item.ISMAX = cmbISMAX.ItemData(iii) Then
   cmbISMAX.ListIndex = iii
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

Item.PNAME = txtPNAME
If txtPTYPE.Tag <> "" Then
  Set Item.PTYPE = Item.Application.FindRowObject("PARAMTYPE", txtPTYPE.Tag)
Else
  Set Item.PTYPE = Nothing
End If
Item.PMIN = CDbl(txtPMIN)
Item.PMAX = CDbl(txtPMAX)
 If cmbISMIN.ListIndex >= 0 Then
   Item.ISMIN = cmbISMIN.ItemData(cmbISMIN.ListIndex)
 End If
 If cmbISMAX.ListIndex >= 0 Then
   Item.ISMAX = cmbISMAX.ItemData(cmbISMAX.ListIndex)
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



