VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl RFIDCELL_INFO 
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
      Begin VB.TextBox txtXLevel 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   15
         ToolTipText     =   "Номер тоннеля"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.TextBox txtZLevel 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   13
         ToolTipText     =   "Ярус"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.TextBox txtCameraNum 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   11
         ToolTipText     =   "Номер камеры"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtStorageNum 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   9
         ToolTipText     =   "Номер склада"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCellType 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип ячейки"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCellType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Тип ячейки"
         Top             =   1815
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtCellSize 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Вместимость ячейки"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtCellCode 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   2
         ToolTipText     =   "Номер ячейки"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblXLevel 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер тоннеля:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblZLevel 
         BackStyle       =   0  'Transparent
         Caption         =   "Ярус:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblCameraNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер камеры:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblStorageNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер склада:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCellType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип ячейки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCellSize 
         BackStyle       =   0  'Transparent
         Caption         =   "Вместимость ячейки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCellCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер ячейки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "RFIDCELL_INFO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 225
Option Explicit


'панель редактирования раздела
   Public item As Object
Attribute item.VB_VarHelpID = 260
   Private OnInit As Boolean
   Public Event Changed()
Attribute Changed.VB_HelpID = 230
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
Attribute IsChanged.VB_HelpID = 250
  IsChanged = mIsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtCellCode_Change()
  Changing

End Sub
Private Sub txtCellSize_Validate(Cancel As Boolean)
If txtCellSize.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCellSize.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCellSize.SetFocus
  ElseIf val(txtCellSize.Text) < -922337203685478# Or val(txtCellSize.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCellSize.SetFocus
  End If
End If
End Sub
Private Sub txtCellSize_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCellSize_Change()
  Changing

End Sub
Private Sub txtCellType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCellType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If item.Application.Manager.GetReferenceDialogEx2("RFIDD_CELLTYPE", ID, brief) Then
          txtCellType.Tag = Left(ID, 38)
          txtCellType = brief
        End If
End Sub
Private Sub cmdCellType_MenuClick(ByVal sCaption As String)
          txtCellType.Tag = ""
          txtCellType = ""
End Sub
Private Sub txtStorageNum_Change()
  Changing

End Sub
Private Sub txtCameraNum_Change()
  Changing

End Sub
Private Sub txtZLevel_Validate(Cancel As Boolean)
If txtZLevel.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtZLevel.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtZLevel.SetFocus
  ElseIf val(txtZLevel.Text) <> CLng(val(txtZLevel.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtZLevel.SetFocus
  End If
End If
End Sub
Private Sub txtZLevel_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtZLevel_Change()
  Changing

End Sub
Private Sub txtXLevel_Validate(Cancel As Boolean)
If txtXLevel.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtXLevel.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtXLevel.SetFocus
  ElseIf val(txtXLevel.Text) <> CLng(val(txtXLevel.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtXLevel.SetFocus
  End If
End If
End Sub
Private Sub txtXLevel_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtXLevel_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set item = Nothing
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
Attribute IsOK.VB_HelpID = 255
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtCellCode.Text)
If mIsOK Then mIsOK = IsSet(txtCellSize.Text)
If mIsOK Then mIsOK = txtCellType.Tag <> ""
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
  For Each Node In XMLDocFrom.childNodes.item(0).childNodes
    If (Node.baseName = "ID") Then
      ID = Node.Text
      Dim NodeTO As MSXML2.IXMLDOMNode
      Dim bAdded As Boolean
      bAdded = False
      For Each NodeTO In XMLDocTo.childNodes.item(0).childNodes
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
       Call XMLDocTo.childNodes.item(0).appendChild(newNode)
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
Attribute InitPanel.VB_HelpID = 245
OnInit = True
Dim iii As Long ' for combo only
If item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

  On Error Resume Next
txtCellCode = item.CellCode
txtCellSize = item.CellSize
If Not item.CellType Is Nothing Then
  txtCellType.Tag = item.CellType.ID
  txtCellType = item.CellType.brief
Else
  txtCellType.Tag = ""
  txtCellType = ""
End If
 LoadBtnPictures cmdCellType, cmdCellType.Tag
  cmdCellType.RemoveAllMenu
  cmdCellType.AddMenu "Очистить"
  On Error Resume Next
txtStorageNum = item.StorageNum
  On Error Resume Next
txtCameraNum = item.CameraNum
txtZLevel = item.ZLevel
txtXLevel = item.XLevel
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
Attribute Save.VB_HelpID = 280
If OnInit Then Exit Sub

item.CellCode = txtCellCode
item.CellSize = CDbl(txtCellSize)
If txtCellType.Tag <> "" Then
  Set item.CellType = item.Application.FindRowObject("RFIDD_CELLTYPE", txtCellType.Tag)
Else
  Set item.CellType = Nothing
End If
item.StorageNum = txtStorageNum
item.CameraNum = txtCameraNum
item.ZLevel = CDbl(txtZLevel)
item.XLevel = CDbl(txtXLevel)
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
 Public Sub OptimalSize(X As Single, Y As Single)
Attribute OptimalSize.VB_HelpID = 265
   Panel.OptimalSize X, Y
   X = X + Panel.Left
   Y = Y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
Attribute OptimalY.VB_HelpID = 270
   Dim X As Single, Y As Single
   Panel.OptimalSize X, Y
   OptimalY = Y
 End Function

'Открытие окна настройки панели
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
Attribute Customize.VB_HelpID = 235
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
Attribute PanelCustomisationString.VB_HelpID = 275
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
Attribute Enabled.VB_HelpID = 240
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



