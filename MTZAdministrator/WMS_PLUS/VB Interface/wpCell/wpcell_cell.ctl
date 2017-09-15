VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl wpcell_cell 
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
      Begin VB.TextBox txtFullCode 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   80
         TabIndex        =   13
         ToolTipText     =   "Полный код ячейки"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbCellLocked 
         Enabled         =   0   'False
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "Ячейка заблокирована"
         Top             =   3225
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtWorkSize 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Рабочий размер в см."
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtPlanSize 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Плановый размер в см."
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtTheCode 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   5
         ToolTipText     =   "Код ячейки"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheRow 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Стелаж"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheRow 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Стелаж"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblFullCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Полный код ячейки:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblCellLocked 
         BackStyle       =   0  'Transparent
         Caption         =   "Ячейка заблокирована:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblWorkSize 
         BackStyle       =   0  'Transparent
         Caption         =   "Рабочий размер в см.:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPlanSize 
         BackStyle       =   0  'Transparent
         Caption         =   "Плановый размер в см.:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Код ячейки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheRow 
         BackStyle       =   0  'Transparent
         Caption         =   "Стелаж:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "wpcell_cell"
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

Private Sub txtTheRow_Change()
  If Not (OnInit) Then
  Changing
Item.FullCode = Item.TheRow.TheBlock.TheStore.TheCode & "." & Item.TheRow.TheBlock.TheCode & "." & Item.TheRow.TheCode & "." & Item.TheCode
      Item.S_code = Code128(Item.FullCode)
  End If
End Sub
Private Sub cmdTheRow_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpCell_Row", ID, brief) Then
          txtTheRow.Tag = Left(ID, 38)
          txtTheRow = brief
        End If
End Sub
Private Sub cmdTheRow_MenuClick(ByVal sCaption As String)
          txtTheRow.Tag = ""
          txtTheRow = ""
End Sub
Private Sub txtTheCode_Change()
  Changing
Item.FullCode = Item.TheRow.TheBlock.TheStore.TheCode & "." & Item.TheRow.TheBlock.TheCode & "." & Item.TheRow.TheCode & "." & Item.TheCode
      Item.S_code = Code128(Item.FullCode)
End Sub
Private Sub txtPlanSize_Validate(cancel As Boolean)
If txtPlanSize.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPlanSize.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPlanSize.SetFocus
  ElseIf Val(txtPlanSize.Text) < -922337203685478# Or Val(txtPlanSize.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPlanSize.SetFocus
  End If
End If
End Sub
Private Sub txtPlanSize_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPlanSize_Change()
  Changing

End Sub
Private Sub txtWorkSize_Validate(cancel As Boolean)
If txtWorkSize.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWorkSize.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWorkSize.SetFocus
  ElseIf Val(txtWorkSize.Text) < -922337203685478# Or Val(txtWorkSize.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWorkSize.SetFocus
  End If
End If
End Sub
Private Sub txtWorkSize_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWorkSize_Change()
  Changing

End Sub
Private Sub cmbCellLocked_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtFullCode_Change()
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

If mIsOK Then mIsOK = txtTheRow.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtTheCode.Text)
If mIsOK Then mIsOK = IsSet(txtPlanSize.Text)
If mIsOK Then mIsOK = IsSet(txtWorkSize.Text)
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

If Not Item.TheRow Is Nothing Then
  txtTheRow.Tag = Item.TheRow.ID
  txtTheRow = Item.TheRow.brief
Else
  txtTheRow.Tag = ""
  txtTheRow = ""
End If
 LoadBtnPictures cmdTheRow, cmdTheRow.Tag
  cmdTheRow.RemoveAllMenu
  cmdTheRow.AddMenu "Очистить"
  On Error Resume Next
txtTheCode = Item.TheCode
txtPlanSize = Item.PlanSize
txtWorkSize = Item.WorkSize
cmbCellLocked.Clear
cmbCellLocked.AddItem "Да"
cmbCellLocked.ItemData(cmbCellLocked.NewIndex) = -1
cmbCellLocked.AddItem "Нет"
cmbCellLocked.ItemData(cmbCellLocked.NewIndex) = 0
 For iii = 0 To cmbCellLocked.ListCount - 1
  If Item.CellLocked = cmbCellLocked.ItemData(iii) Then
   cmbCellLocked.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtFullCode = Item.FullCode
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

If txtTheRow.Tag <> "" Then
  Set Item.TheRow = Item.Application.FindRowObject("wpCell_Row", txtTheRow.Tag)
Else
  Set Item.TheRow = Nothing
End If
Item.TheCode = txtTheCode
Item.PlanSize = CDbl(txtPlanSize)
Item.WorkSize = CDbl(txtWorkSize)
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



