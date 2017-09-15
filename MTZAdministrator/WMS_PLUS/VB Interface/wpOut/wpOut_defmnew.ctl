VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl wpOut_defmnew 
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
      Begin MSComCtl2.DTPicker dtpCarOutTime 
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         ToolTipText     =   "Время убытия машины"
         Top             =   3930
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   53346307
         CurrentDate     =   39926
      End
      Begin MSComCtl2.DTPicker dtpCarInTime 
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         ToolTipText     =   "Время прибытия машины"
         Top             =   3225
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   53346307
         CurrentDate     =   39926
      End
      Begin VB.TextBox txtPlombNum 
         Height          =   300
         Left            =   3450
         MaxLength       =   50
         TabIndex        =   26
         ToolTipText     =   "Номер пломбы"
         Top             =   2520
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTTNDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "Дата ТТН"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   53346307
         CurrentDate     =   39926
      End
      Begin VB.TextBox txtTTNNum 
         Height          =   300
         Left            =   3450
         MaxLength       =   50
         TabIndex        =   22
         ToolTipText     =   "Номер ТТН"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTheContainer 
         Height          =   300
         Left            =   3450
         MaxLength       =   20
         TabIndex        =   20
         ToolTipText     =   "Номер контейнера"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtCar2Num 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   18
         ToolTipText     =   "Номер прицепа"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.TextBox txtCarNum 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   16
         ToolTipText     =   "Номер ТС"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.TextBox txtSupplier 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   14
         ToolTipText     =   "Поставщик"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         ToolTipText     =   "Примечание"
         Top             =   3225
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTheDate 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Дата заказа"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   53346307
         CurrentDate     =   39926
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   8
         ToolTipText     =   "Номер заказа"
         Top             =   1815
         Width           =   1800
      End
      Begin MTZ_PANEL.DropButton cmdTheDogovor 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Договор"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDogovor 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Договор"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheCLient 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Клиент"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCLient 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Клиент"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblCarOutTime 
         BackStyle       =   0  'Transparent
         Caption         =   "Время убытия машины:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblCarInTime 
         BackStyle       =   0  'Transparent
         Caption         =   "Время прибытия машины:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblPlombNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер пломбы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTTNDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата ТТН:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTTNNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер ТТН:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheContainer 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер контейнера:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblCar2Num 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер прицепа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblCarNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер ТС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTheDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата заказа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер заказа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheDogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "Договор:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheCLient 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "wpOut_defmnew"
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

Private Sub txtTheCLient_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCLient_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpCli_def", ID, brief) Then
          txtTheCLient.Tag = Left(ID, 38)
          txtTheCLient = brief
        End If
End Sub
Private Sub cmdTheCLient_MenuClick(ByVal sCaption As String)
          txtTheCLient.Tag = ""
          txtTheCLient = ""
End Sub
Private Sub txtTheDogovor_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDogovor_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpDog_def", ID, brief, , , "wpDog_def_TheClient_IP='" & txtTheCLient.Tag & "'") Then
          txtTheDogovor.Tag = Left(ID, 38)
          txtTheDogovor = brief
        End If
End Sub
Private Sub cmdTheDogovor_MenuClick(ByVal sCaption As String)
          txtTheDogovor.Tag = ""
          txtTheDogovor = ""
End Sub
Private Sub txtTheNumber_Validate(cancel As Boolean)
If txtTheNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNumber.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheNumber.SetFocus
  ElseIf Val(txtTheNumber.Text) <> CLng(Val(txtTheNumber.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtTheNumber.SetFocus
  End If
End If
End Sub
Private Sub txtTheNumber_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheNumber_Change()
  Changing
Item.S_code = Code128("QOUT_" & txtTheNumber.Text)
End Sub
Private Sub dtpTheDate_Change()
  Changing

End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub txtSupplier_Change()
  Changing

End Sub
Private Sub txtCarNum_Change()
  Changing

End Sub
Private Sub txtCar2Num_Change()
  Changing

End Sub
Private Sub txtTheContainer_Change()
  Changing

End Sub
Private Sub txtTTNNum_Change()
  Changing

End Sub
Private Sub dtpTTNDate_Change()
  Changing

End Sub
Private Sub txtPlombNum_Change()
  Changing

End Sub
Private Sub dtpCarInTime_Change()
  Changing

End Sub
Private Sub dtpCarOutTime_Change()
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

If mIsOK Then mIsOK = txtTheCLient.Tag <> ""
If mIsOK Then mIsOK = txtTheDogovor.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtTheNumber.Text)
If mIsOK Then mIsOK = IsSet(dtpTheDate.Value)
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

If Not Item.TheCLient Is Nothing Then
  txtTheCLient.Tag = Item.TheCLient.ID
  txtTheCLient = Item.TheCLient.brief
Else
  txtTheCLient.Tag = ""
  txtTheCLient = ""
End If
 LoadBtnPictures cmdTheCLient, cmdTheCLient.Tag
  cmdTheCLient.RemoveAllMenu
  cmdTheCLient.AddMenu "Очистить"
If Not Item.TheDogovor Is Nothing Then
  txtTheDogovor.Tag = Item.TheDogovor.ID
  txtTheDogovor = Item.TheDogovor.brief
Else
  txtTheDogovor.Tag = ""
  txtTheDogovor = ""
End If
 LoadBtnPictures cmdTheDogovor, cmdTheDogovor.Tag
  cmdTheDogovor.RemoveAllMenu
  cmdTheDogovor.AddMenu "Очистить"
txtTheNumber = Item.TheNumber
dtpTheDate = Date
If Item.TheDate <> 0 Then
 dtpTheDate = Item.TheDate
End If
txtTheComment = Item.TheComment
  On Error Resume Next
txtSupplier = Item.Supplier
  On Error Resume Next
txtCarNum = Item.CarNum
  On Error Resume Next
txtCar2Num = Item.Car2Num
  On Error Resume Next
txtTheContainer = Item.TheContainer
  On Error Resume Next
txtTTNNum = Item.TTNNum
dtpTTNDate = Date
If Item.TTNDate <> 0 Then
 dtpTTNDate = Item.TTNDate
Else
 dtpTTNDate.Value = Null
End If
  On Error Resume Next
txtPlombNum = Item.PlombNum
dtpCarInTime = Now
If Item.CarInTime <> 0 Then
 dtpCarInTime = Item.CarInTime
Else
 dtpCarInTime.Value = Null
End If
dtpCarOutTime = Now
If Item.CarOutTime <> 0 Then
 dtpCarOutTime = Item.CarOutTime
Else
 dtpCarOutTime.Value = Null
End If
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

If txtTheCLient.Tag <> "" Then
  Set Item.TheCLient = Item.Application.FindRowObject("wpCli_def", txtTheCLient.Tag)
Else
  Set Item.TheCLient = Nothing
End If
If txtTheDogovor.Tag <> "" Then
  Set Item.TheDogovor = Item.Application.FindRowObject("wpDog_def", txtTheDogovor.Tag)
Else
  Set Item.TheDogovor = Nothing
End If
Item.TheNumber = CDbl(txtTheNumber)
  If IsNull(dtpTheDate) Then
    Item.TheDate = 0
  Else
    Item.TheDate = dtpTheDate.Value
  End If
Item.TheComment = txtTheComment
Item.Supplier = txtSupplier
Item.CarNum = txtCarNum
Item.Car2Num = txtCar2Num
Item.TheContainer = txtTheContainer
Item.TTNNum = txtTTNNum
  If IsNull(dtpTTNDate) Then
    Item.TTNDate = 0
  Else
    Item.TTNDate = dtpTTNDate.Value
  End If
Item.PlombNum = txtPlombNum
  If IsNull(dtpCarInTime) Then
    Item.CarInTime = 0
  Else
    Item.CarInTime = dtpCarInTime.Value
  End If
  If IsNull(dtpCarOutTime) Then
    Item.CarOutTime = 0
  Else
    Item.CarOutTime = dtpCarOutTime.Value
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



