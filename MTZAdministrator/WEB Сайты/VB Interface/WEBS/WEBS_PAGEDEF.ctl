VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WEBS_PAGEDEF 
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
      Begin VB.ComboBox cmbRedirectToFirstChild 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   39
         ToolTipText     =   "Перейти на первую дочернюю страницу"
         Top             =   405
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsShowHisory 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   37
         ToolTipText     =   "Отобразить историю"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsOnMap 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   35
         ToolTipText     =   "Отображать на карте сайта"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.ComboBox cmbthe_IsLocked 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   33
         ToolTipText     =   "Заблокирована"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowAddPage 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   31
         ToolTipText     =   "Разрешено добавлять страницы"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.TextBox txtPageContent 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   29
         ToolTipText     =   "Cодержимое"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtSelectIDParameterName 
         Height          =   300
         Left            =   3450
         MaxLength       =   256
         TabIndex        =   27
         ToolTipText     =   "Имя параметра для передачи в форму редактирования"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtControlPath 
         Height          =   300
         Left            =   3450
         MaxLength       =   256
         TabIndex        =   25
         ToolTipText     =   "Контрол"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPageType 
         Height          =   300
         Left            =   6000
         TabIndex        =   23
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPageType 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   22
         ToolTipText     =   "Тип"
         Top             =   405
         Width           =   2550
      End
      Begin VB.TextBox txtthe_Mode 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   20
         ToolTipText     =   "Режим работы"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowHeader 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   18
         ToolTipText     =   "Выводить заголовок"
         Top             =   5340
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdObjectCode 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Имя раздела"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtObjectCode 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Имя раздела"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdObjectName 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Имя объекта"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtObjectName 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Имя объекта"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.TextBox txtShortName 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   10
         ToolTipText     =   "Короткое название"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtTitle 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   8
         ToolTipText     =   "Титул"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtUrl 
         Height          =   300
         Left            =   300
         MaxLength       =   1024
         TabIndex        =   6
         ToolTipText     =   "Урл"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   4
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtQueueNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер п/п"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblRedirectToFirstChild 
         BackStyle       =   0  'Transparent
         Caption         =   "Перейти на первую дочернюю страницу:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   38
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblIsShowHisory 
         BackStyle       =   0  'Transparent
         Caption         =   "Отобразить историю:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblIsOnMap 
         BackStyle       =   0  'Transparent
         Caption         =   "Отображать на карте сайта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblthe_IsLocked 
         BackStyle       =   0  'Transparent
         Caption         =   "Заблокирована:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblAllowAddPage 
         BackStyle       =   0  'Transparent
         Caption         =   "Разрешено добавлять страницы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblPageContent 
         BackStyle       =   0  'Transparent
         Caption         =   "Cодержимое:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSelectIDParameterName 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя параметра для передачи в форму редактирования:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblControlPath 
         BackStyle       =   0  'Transparent
         Caption         =   "Контрол:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPageType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblthe_Mode 
         BackStyle       =   0  'Transparent
         Caption         =   "Режим работы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblAllowHeader 
         BackStyle       =   0  'Transparent
         Caption         =   "Выводить заголовок:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblObjectCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя раздела:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblObjectName 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя объекта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblShortName 
         BackStyle       =   0  'Transparent
         Caption         =   "Короткое название:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTitle 
         BackStyle       =   0  'Transparent
         Caption         =   "Титул:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblUrl 
         BackStyle       =   0  'Transparent
         Caption         =   "Урл:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblQueueNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер п/п:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WEBS_PAGEDEF"
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

Private Sub txtQueueNumber_Validate(cancel As Boolean)
If txtQueueNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQueueNumber.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQueueNumber.SetFocus
  ElseIf Val(txtQueueNumber.Text) <> CLng(Val(txtQueueNumber.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtQueueNumber.SetFocus
  End If
End If
End Sub
Private Sub txtQueueNumber_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQueueNumber_Change()
  Changing

End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtUrl_Change()
  Changing

End Sub
Private Sub txtTitle_Change()
  Changing

End Sub
Private Sub txtShortName_Change()
  Changing

End Sub
Private Sub txtObjectName_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdObjectName_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJECTTYPE", ID, brief) Then
          txtObjectName.Tag = Left(ID, 38)
          txtObjectName = brief
        End If
End Sub
Private Sub cmdObjectName_MenuClick(ByVal sCaption As String)
          txtObjectName.Tag = ""
          txtObjectName = ""
End Sub
Private Sub txtObjectCode_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdObjectCode_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PART", ID, brief) Then
          txtObjectCode.Tag = Left(ID, 38)
          txtObjectCode = brief
        End If
End Sub
Private Sub cmdObjectCode_MenuClick(ByVal sCaption As String)
          txtObjectCode.Tag = ""
          txtObjectCode = ""
End Sub
Private Sub cmbAllowHeader_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtthe_Mode_Change()
  Changing

End Sub
Private Sub txtPageType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPageType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WEBSDIC_PAGETYPE", ID, brief) Then
          txtPageType.Tag = Left(ID, 38)
          txtPageType = brief
        End If
End Sub
Private Sub cmdPageType_MenuClick(ByVal sCaption As String)
          txtPageType.Tag = ""
          txtPageType = ""
End Sub
Private Sub txtControlPath_Change()
  Changing

End Sub
Private Sub txtSelectIDParameterName_Change()
  Changing

End Sub
Private Sub txtPageContent_Change()
  Changing

End Sub
Private Sub cmbAllowAddPage_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbthe_IsLocked_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsOnMap_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsShowHisory_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbRedirectToFirstChild_Click()
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

If mIsOK Then mIsOK = IsSet(txtName.Text)
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

txtQueueNumber = Item.QueueNumber
  On Error Resume Next
txtName = Item.Name
  On Error Resume Next
txtUrl = Item.url
  On Error Resume Next
txtTitle = Item.Title
  On Error Resume Next
txtShortName = Item.ShortName
If Not Item.ObjectName Is Nothing Then
  txtObjectName.Tag = Item.ObjectName.ID
  txtObjectName = Item.ObjectName.brief
Else
  txtObjectName.Tag = ""
  txtObjectName = ""
End If
 LoadBtnPictures cmdObjectName, cmdObjectName.Tag
  cmdObjectName.RemoveAllMenu
  cmdObjectName.AddMenu "Очистить"
If Not Item.ObjectCode Is Nothing Then
  txtObjectCode.Tag = Item.ObjectCode.ID
  txtObjectCode = Item.ObjectCode.brief
Else
  txtObjectCode.Tag = ""
  txtObjectCode = ""
End If
 LoadBtnPictures cmdObjectCode, cmdObjectCode.Tag
  cmdObjectCode.RemoveAllMenu
  cmdObjectCode.AddMenu "Очистить"
cmbAllowHeader.Clear
cmbAllowHeader.AddItem "Да"
cmbAllowHeader.ItemData(cmbAllowHeader.NewIndex) = -1
cmbAllowHeader.AddItem "Нет"
cmbAllowHeader.ItemData(cmbAllowHeader.NewIndex) = 0
 For iii = 0 To cmbAllowHeader.ListCount - 1
  If Item.AllowHeader = cmbAllowHeader.ItemData(iii) Then
   cmbAllowHeader.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtthe_Mode = Item.the_Mode
If Not Item.PageType Is Nothing Then
  txtPageType.Tag = Item.PageType.ID
  txtPageType = Item.PageType.brief
Else
  txtPageType.Tag = ""
  txtPageType = ""
End If
 LoadBtnPictures cmdPageType, cmdPageType.Tag
  cmdPageType.RemoveAllMenu
  cmdPageType.AddMenu "Очистить"
  On Error Resume Next
txtControlPath = Item.ControlPath
  On Error Resume Next
txtSelectIDParameterName = Item.SelectIDParameterName
txtPageContent = Item.PageContent
cmbAllowAddPage.Clear
cmbAllowAddPage.AddItem "Да"
cmbAllowAddPage.ItemData(cmbAllowAddPage.NewIndex) = -1
cmbAllowAddPage.AddItem "Нет"
cmbAllowAddPage.ItemData(cmbAllowAddPage.NewIndex) = 0
 For iii = 0 To cmbAllowAddPage.ListCount - 1
  If Item.AllowAddPage = cmbAllowAddPage.ItemData(iii) Then
   cmbAllowAddPage.ListIndex = iii
   Exit For
  End If
 Next
cmbthe_IsLocked.Clear
cmbthe_IsLocked.AddItem "Да"
cmbthe_IsLocked.ItemData(cmbthe_IsLocked.NewIndex) = -1
cmbthe_IsLocked.AddItem "Нет"
cmbthe_IsLocked.ItemData(cmbthe_IsLocked.NewIndex) = 0
 For iii = 0 To cmbthe_IsLocked.ListCount - 1
  If Item.the_IsLocked = cmbthe_IsLocked.ItemData(iii) Then
   cmbthe_IsLocked.ListIndex = iii
   Exit For
  End If
 Next
cmbIsOnMap.Clear
cmbIsOnMap.AddItem "Да"
cmbIsOnMap.ItemData(cmbIsOnMap.NewIndex) = -1
cmbIsOnMap.AddItem "Нет"
cmbIsOnMap.ItemData(cmbIsOnMap.NewIndex) = 0
 For iii = 0 To cmbIsOnMap.ListCount - 1
  If Item.IsOnMap = cmbIsOnMap.ItemData(iii) Then
   cmbIsOnMap.ListIndex = iii
   Exit For
  End If
 Next
cmbIsShowHisory.Clear
cmbIsShowHisory.AddItem "Да"
cmbIsShowHisory.ItemData(cmbIsShowHisory.NewIndex) = -1
cmbIsShowHisory.AddItem "Нет"
cmbIsShowHisory.ItemData(cmbIsShowHisory.NewIndex) = 0
 For iii = 0 To cmbIsShowHisory.ListCount - 1
  If Item.IsShowHisory = cmbIsShowHisory.ItemData(iii) Then
   cmbIsShowHisory.ListIndex = iii
   Exit For
  End If
 Next
cmbRedirectToFirstChild.Clear
cmbRedirectToFirstChild.AddItem "Да"
cmbRedirectToFirstChild.ItemData(cmbRedirectToFirstChild.NewIndex) = -1
cmbRedirectToFirstChild.AddItem "Нет"
cmbRedirectToFirstChild.ItemData(cmbRedirectToFirstChild.NewIndex) = 0
 For iii = 0 To cmbRedirectToFirstChild.ListCount - 1
  If Item.RedirectToFirstChild = cmbRedirectToFirstChild.ItemData(iii) Then
   cmbRedirectToFirstChild.ListIndex = iii
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

Item.QueueNumber = CDbl(txtQueueNumber)
Item.Name = txtName
Item.url = txtUrl
Item.Title = txtTitle
Item.ShortName = txtShortName
If txtObjectName.Tag <> "" Then
  Set Item.ObjectName = Item.Application.FindRowObject("OBJECTTYPE", txtObjectName.Tag)
Else
  Set Item.ObjectName = Nothing
End If
If txtObjectCode.Tag <> "" Then
  Set Item.ObjectCode = Item.Application.FindRowObject("PART", txtObjectCode.Tag)
Else
  Set Item.ObjectCode = Nothing
End If
 If cmbAllowHeader.ListIndex >= 0 Then
   Item.AllowHeader = cmbAllowHeader.ItemData(cmbAllowHeader.ListIndex)
 End If
Item.the_Mode = txtthe_Mode
If txtPageType.Tag <> "" Then
  Set Item.PageType = Item.Application.FindRowObject("WEBSDIC_PAGETYPE", txtPageType.Tag)
Else
  Set Item.PageType = Nothing
End If
Item.ControlPath = txtControlPath
Item.SelectIDParameterName = txtSelectIDParameterName
Item.PageContent = txtPageContent
 If cmbAllowAddPage.ListIndex >= 0 Then
   Item.AllowAddPage = cmbAllowAddPage.ItemData(cmbAllowAddPage.ListIndex)
 End If
 If cmbthe_IsLocked.ListIndex >= 0 Then
   Item.the_IsLocked = cmbthe_IsLocked.ItemData(cmbthe_IsLocked.ListIndex)
 End If
 If cmbIsOnMap.ListIndex >= 0 Then
   Item.IsOnMap = cmbIsOnMap.ItemData(cmbIsOnMap.ListIndex)
 End If
 If cmbIsShowHisory.ListIndex >= 0 Then
   Item.IsShowHisory = cmbIsShowHisory.ItemData(cmbIsShowHisory.ListIndex)
 End If
 If cmbRedirectToFirstChild.ListIndex >= 0 Then
   Item.RedirectToFirstChild = cmbRedirectToFirstChild.ItemData(cmbRedirectToFirstChild.ListIndex)
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



