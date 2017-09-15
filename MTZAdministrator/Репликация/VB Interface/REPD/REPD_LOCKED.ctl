VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl REPD_LOCKED 
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
      Begin VB.TextBox txtPartNumber 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   22
         ToolTipText     =   "PartNumber"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.TextBox txtPartCount 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   20
         ToolTipText     =   "PartCount"
         Top             =   405
         Width           =   1800
      End
      Begin VB.TextBox txtReplicaPackID 
         Height          =   300
         Left            =   300
         TabIndex        =   18
         ToolTipText     =   "ReplicaPackID"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtThe_InstanceID 
         Height          =   300
         Left            =   300
         TabIndex        =   16
         ToolTipText     =   "Объект"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtThe_RowID 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Идетнификатор строки"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtObjectType 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   12
         ToolTipText     =   "Тип объекта"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtStructType 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   10
         ToolTipText     =   "Тип строки"
         Top             =   3225
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFirstTry 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Первая обработка"
         Top             =   2520
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   92143619
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtReplicaRowID 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "Идентификатор строки реплики"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtSourceFile 
         Height          =   300
         Left            =   300
         MaxLength       =   2048
         TabIndex        =   4
         ToolTipText     =   "Файл данных"
         Top             =   1110
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpLastTry 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "Последняя разработка"
         Top             =   405
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   92143619
         CurrentDate     =   39874
      End
      Begin VB.Label lblPartNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "PartNumber:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPartCount 
         BackStyle       =   0  'Transparent
         Caption         =   "PartCount:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblReplicaPackID 
         BackStyle       =   0  'Transparent
         Caption         =   "ReplicaPackID:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblThe_InstanceID 
         BackStyle       =   0  'Transparent
         Caption         =   "Объект:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblThe_RowID 
         BackStyle       =   0  'Transparent
         Caption         =   "Идетнификатор строки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblObjectType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип объекта:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblStructType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип строки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFirstTry 
         BackStyle       =   0  'Transparent
         Caption         =   "Первая обработка:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblReplicaRowID 
         BackStyle       =   0  'Transparent
         Caption         =   "Идентификатор строки реплики:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblSourceFile 
         BackStyle       =   0  'Transparent
         Caption         =   "Файл данных:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblLastTry 
         BackStyle       =   0  'Transparent
         Caption         =   "Последняя разработка:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "REPD_LOCKED"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Очередь заблокированных объектов
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

Private Sub dtpLastTry_Change()
  Changing

End Sub
Private Sub txtSourceFile_Change()
  Changing

End Sub
Private Sub txtReplicaRowID_Change()
  Changing

End Sub
Private Sub dtpFirstTry_Change()
  Changing

End Sub
Private Sub txtStructType_Change()
  Changing

End Sub
Private Sub txtObjectType_Change()
  Changing

End Sub
Private Sub txtThe_RowID_Change()
  Changing

End Sub
Private Sub txtThe_InstanceID_Change()
  Changing

End Sub
Private Sub txtReplicaPackID_Change()
  Changing

End Sub
Private Sub txtPartCount_Validate(cancel As Boolean)
If txtPartCount.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPartCount.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPartCount.SetFocus
  ElseIf Val(txtPartCount.Text) <> CLng(Val(txtPartCount.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtPartCount.SetFocus
  End If
End If
End Sub
Private Sub txtPartCount_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPartCount_Change()
  Changing

End Sub
Private Sub txtPartNumber_Validate(cancel As Boolean)
If txtPartNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPartNumber.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPartNumber.SetFocus
  ElseIf Val(txtPartNumber.Text) <> CLng(Val(txtPartNumber.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtPartNumber.SetFocus
  End If
End If
End Sub
Private Sub txtPartNumber_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPartNumber_Change()
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

If mIsOK Then mIsOK = IsSet(dtpLastTry.Value)
If mIsOK Then mIsOK = IsSet(txtSourceFile.Text)
If mIsOK Then mIsOK = IsSet(txtReplicaRowID.Text)
If mIsOK Then mIsOK = IsSet(dtpFirstTry.Value)
If mIsOK Then mIsOK = IsSet(txtObjectType.Text)
If mIsOK Then mIsOK = IsSet(txtThe_InstanceID.Text)
If mIsOK Then mIsOK = IsSet(txtReplicaPackID.Text)
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

dtpLastTry = Now
If Item.LastTry <> 0 Then
 dtpLastTry = Item.LastTry
End If
  On Error Resume Next
txtSourceFile = Item.SourceFile
  On Error Resume Next
txtReplicaRowID = Item.ReplicaRowID
dtpFirstTry = Now
If Item.FirstTry <> 0 Then
 dtpFirstTry = Item.FirstTry
End If
  On Error Resume Next
txtStructType = Item.StructType
  On Error Resume Next
txtObjectType = Item.ObjectType
  On Error Resume Next
txtThe_RowID = Item.The_RowID
  On Error Resume Next
txtThe_InstanceID = Item.The_InstanceID
  On Error Resume Next
txtReplicaPackID = Item.ReplicaPackID
txtPartCount = Item.PartCount
txtPartNumber = Item.PartNumber
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

  If IsNull(dtpLastTry) Then
    Item.LastTry = 0
  Else
    Item.LastTry = dtpLastTry.Value
  End If
Item.SourceFile = txtSourceFile
Item.ReplicaRowID = txtReplicaRowID
  If IsNull(dtpFirstTry) Then
    Item.FirstTry = 0
  Else
    Item.FirstTry = dtpFirstTry.Value
  End If
Item.StructType = txtStructType
Item.ObjectType = txtObjectType
Item.The_RowID = txtThe_RowID
Item.The_InstanceID = txtThe_InstanceID
Item.ReplicaPackID = txtReplicaPackID
Item.PartCount = CDbl(txtPartCount)
Item.PartNumber = CDbl(txtPartNumber)
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



