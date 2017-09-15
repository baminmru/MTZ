VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl BMODEMS 
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
      Begin VB.TextBox txtFlowControl 
         Height          =   300
         Left            =   3450
         MaxLength       =   2
         TabIndex        =   27
         ToolTipText     =   "FlowControl"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbCDSR 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   25
         ToolTipText     =   "Сигнал DSR"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbCDTR 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   23
         ToolTipText     =   " Сигнал DTR"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtCTOWNCODE 
         Height          =   300
         Left            =   3450
         MaxLength       =   32
         TabIndex        =   21
         ToolTipText     =   "Код города"
         Top             =   405
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdID_USR 
         Height          =   300
         Left            =   2850
         TabIndex        =   19
         Tag             =   "refopen.ico"
         ToolTipText     =   "Пользователь"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_USR 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   18
         ToolTipText     =   "Пользователь"
         Top             =   6045
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtPARAMLIMIT 
         Height          =   300
         Left            =   300
         TabIndex        =   16
         ToolTipText     =   "Лимит времени на опрос 1 параметра"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtCONNECTLIMIT 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Лимит времени на установку связи"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtCPREFPHONE 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   12
         ToolTipText     =   "Префикс местной АТС"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbCSTOPBITS 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Стоповые биты"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbCPARITY 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Четность"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtCDATABIT 
         Height          =   300
         Left            =   300
         MaxLength       =   2
         TabIndex        =   6
         ToolTipText     =   "Биты данных"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtCSPEED 
         Height          =   300
         Left            =   300
         MaxLength       =   12
         TabIndex        =   4
         ToolTipText     =   "Скорость бод"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtCPHONE 
         Height          =   300
         Left            =   300
         MaxLength       =   48
         TabIndex        =   2
         ToolTipText     =   "Телефон"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblFlowControl 
         BackStyle       =   0  'Transparent
         Caption         =   "FlowControl:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCDSR 
         BackStyle       =   0  'Transparent
         Caption         =   "Сигнал DSR:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCDTR 
         BackStyle       =   0  'Transparent
         Caption         =   " Сигнал DTR:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCTOWNCODE 
         BackStyle       =   0  'Transparent
         Caption         =   "Код города:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblID_USR 
         BackStyle       =   0  'Transparent
         Caption         =   "Пользователь:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblPARAMLIMIT 
         BackStyle       =   0  'Transparent
         Caption         =   "Лимит времени на опрос 1 параметра:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblCONNECTLIMIT 
         BackStyle       =   0  'Transparent
         Caption         =   "Лимит времени на установку связи:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblCPREFPHONE 
         BackStyle       =   0  'Transparent
         Caption         =   "Префикс местной АТС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblCSTOPBITS 
         BackStyle       =   0  'Transparent
         Caption         =   "Стоповые биты:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCPARITY 
         BackStyle       =   0  'Transparent
         Caption         =   "Четность:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCDATABIT 
         BackStyle       =   0  'Transparent
         Caption         =   "Биты данных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCSPEED 
         BackStyle       =   0  'Transparent
         Caption         =   "Скорость бод:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCPHONE 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "BMODEMS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Модемы в узлах учета
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

Private Sub txtCPHONE_Change()
  Changing

End Sub
Private Sub txtCSPEED_Change()
  Changing

End Sub
Private Sub txtCDATABIT_Change()
  Changing

End Sub
Private Sub cmbCPARITY_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbCSTOPBITS_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCPREFPHONE_Change()
  Changing

End Sub
Private Sub txtCONNECTLIMIT_Validate(cancel As Boolean)
If txtCONNECTLIMIT.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCONNECTLIMIT.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCONNECTLIMIT.SetFocus
  ElseIf Val(txtCONNECTLIMIT.Text) < -922337203685478# Or Val(txtCONNECTLIMIT.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCONNECTLIMIT.SetFocus
  End If
End If
End Sub
Private Sub txtCONNECTLIMIT_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCONNECTLIMIT_Change()
  Changing

End Sub
Private Sub txtPARAMLIMIT_Validate(cancel As Boolean)
If txtPARAMLIMIT.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPARAMLIMIT.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPARAMLIMIT.SetFocus
  ElseIf Val(txtPARAMLIMIT.Text) < -922337203685478# Or Val(txtPARAMLIMIT.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPARAMLIMIT.SetFocus
  End If
End If
End Sub
Private Sub txtPARAMLIMIT_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPARAMLIMIT_Change()
  Changing

End Sub
Private Sub txtID_USR_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_USR_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", ID, brief) Then
          txtID_USR.Tag = Left(ID, 38)
          txtID_USR = brief
        End If
End Sub
Private Sub cmdID_USR_MenuClick(ByVal sCaption As String)
          txtID_USR.Tag = ""
          txtID_USR = ""
End Sub
Private Sub txtCTOWNCODE_Change()
  Changing

End Sub
Private Sub cmbCDTR_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbCDSR_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtFlowControl_Change()
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
txtCPHONE = Item.CPHONE
  On Error Resume Next
txtCSPEED = Item.CSPEED
  On Error Resume Next
txtCDATABIT = Item.CDATABIT
cmbCPARITY.Clear
cmbCPARITY.AddItem "Да"
cmbCPARITY.ItemData(cmbCPARITY.NewIndex) = -1
cmbCPARITY.AddItem "Нет"
cmbCPARITY.ItemData(cmbCPARITY.NewIndex) = 0
 For iii = 0 To cmbCPARITY.ListCount - 1
  If Item.CPARITY = cmbCPARITY.ItemData(iii) Then
   cmbCPARITY.ListIndex = iii
   Exit For
  End If
 Next
cmbCSTOPBITS.Clear
cmbCSTOPBITS.AddItem "Да"
cmbCSTOPBITS.ItemData(cmbCSTOPBITS.NewIndex) = -1
cmbCSTOPBITS.AddItem "Нет"
cmbCSTOPBITS.ItemData(cmbCSTOPBITS.NewIndex) = 0
 For iii = 0 To cmbCSTOPBITS.ListCount - 1
  If Item.CSTOPBITS = cmbCSTOPBITS.ItemData(iii) Then
   cmbCSTOPBITS.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtCPREFPHONE = Item.CPREFPHONE
txtCONNECTLIMIT = Item.CONNECTLIMIT
txtPARAMLIMIT = Item.PARAMLIMIT
If Not Item.ID_USR Is Nothing Then
  txtID_USR.Tag = Item.ID_USR.ID
  txtID_USR = Item.ID_USR.brief
Else
  txtID_USR.Tag = ""
  txtID_USR = ""
End If
 LoadBtnPictures cmdID_USR, cmdID_USR.Tag
  cmdID_USR.RemoveAllMenu
  cmdID_USR.AddMenu "Очистить"
  On Error Resume Next
txtCTOWNCODE = Item.CTOWNCODE
cmbCDTR.Clear
cmbCDTR.AddItem "Да"
cmbCDTR.ItemData(cmbCDTR.NewIndex) = -1
cmbCDTR.AddItem "Нет"
cmbCDTR.ItemData(cmbCDTR.NewIndex) = 0
 For iii = 0 To cmbCDTR.ListCount - 1
  If Item.CDTR = cmbCDTR.ItemData(iii) Then
   cmbCDTR.ListIndex = iii
   Exit For
  End If
 Next
cmbCDSR.Clear
cmbCDSR.AddItem "Да"
cmbCDSR.ItemData(cmbCDSR.NewIndex) = -1
cmbCDSR.AddItem "Нет"
cmbCDSR.ItemData(cmbCDSR.NewIndex) = 0
 For iii = 0 To cmbCDSR.ListCount - 1
  If Item.CDSR = cmbCDSR.ItemData(iii) Then
   cmbCDSR.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtFlowControl = Item.FlowControl
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

Item.CPHONE = txtCPHONE
Item.CSPEED = txtCSPEED
Item.CDATABIT = txtCDATABIT
 If cmbCPARITY.ListIndex >= 0 Then
   Item.CPARITY = cmbCPARITY.ItemData(cmbCPARITY.ListIndex)
 End If
 If cmbCSTOPBITS.ListIndex >= 0 Then
   Item.CSTOPBITS = cmbCSTOPBITS.ItemData(cmbCSTOPBITS.ListIndex)
 End If
Item.CPREFPHONE = txtCPREFPHONE
Item.CONNECTLIMIT = CDbl(txtCONNECTLIMIT)
Item.PARAMLIMIT = CDbl(txtPARAMLIMIT)
If txtID_USR.Tag <> "" Then
  Set Item.ID_USR = Item.Application.FindRowObject("Users", txtID_USR.Tag)
Else
  Set Item.ID_USR = Nothing
End If
Item.CTOWNCODE = txtCTOWNCODE
 If cmbCDTR.ListIndex >= 0 Then
   Item.CDTR = cmbCDTR.ItemData(cmbCDTR.ListIndex)
 End If
 If cmbCDSR.ListIndex >= 0 Then
   Item.CDSR = cmbCDSR.ItemData(cmbCDSR.ListIndex)
 End If
Item.FlowControl = txtFlowControl
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



