VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl ITTD_PARTadmi 
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
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Наименование партии"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheGood 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Товар"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheGood 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Товар"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Наименование партии:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheGood 
         BackStyle       =   0  'Transparent
         Caption         =   "Товар:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTD_PARTadmi"
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
  Private mIDTheGood As String






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
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, Cancel)
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

Private Sub txtTheGood_Change()
  If Not (OnInit) Then
If (txtTheGood.Text = "") Then
  ' Убрать Brief и ID
  If (txtTheGood.Tag <> "") Then
    Dim XMLDoc As New DOMDocument
    Call XMLDoc.loadXML(txtTheGood.Tag)
    Dim Node As MSXML2.IXMLDOMNode
    For Each Node In XMLDoc.childNodes.Item(0).childNodes
     If (Node.baseName = "ID") Then
       Node.Text = ""
     End If
     If (Node.baseName = "Brief") Then
       Node.Text = ""
     End If
    Next
    txtTheGood.Tag = XMLDoc.xml
  End If
End If
  Changing

  End If
End Sub
Private Sub cmdTheGood_Click()
  On Error Resume Next
  If (Not OnInit) Then
    Dim iFrom As Long
    Dim iTo As Long
    iFrom = InStr(1, txtTheGood.Tag, "<ID>")
    If (iFrom > 0) Then
      iTo = InStr(iFrom, txtTheGood.Tag, "</ID>")
      mIDTheGood = Mid(txtTheGood.Tag, iFrom + 4, iTo - iFrom - 5)
    End If
    Dim MTZShell As Object
    Set MTZShell = Item.Application.Manager.GetCustomObjects("MTZShell")
    If (Not MTZShell Is Nothing) Then
      err.Clear
      Dim Processed As Variant
      Processed = False
      Call MTZShell.FireEvent("TheGood;" & mIDTheGood, Processed)
      If (err.Number = 0 And Processed <> vbNullString And Processed <> False) Then
        Exit Sub
      End If
    End If
    txtTheGood.Tag = Replace(txtTheGood.Tag, "<ID>", "<IDOld>")
    txtTheGood.Tag = Replace(txtTheGood.Tag, "</ID>", "</IDOld>")
  End If
  Dim pars As New NamedValues
  Dim res As NamedValues
  If (txtTheGood.Tag = "") Then
    ' call MsgBox("Нет данных для запроса")
  Else
    txtTheGood.Tag = Replace(txtTheGood.Tag, "%ID%", " 1=1 ")
    Call pars.Add("xml", txtTheGood.Tag)
  End If
  Set res = Item.Application.Manager.GetSQLDataDialog(pars)
  If (Not res Is Nothing) Then
    Dim resStr As String
    resStr = res.Item("RESULT").Value
    If (resStr = "OK") Then
      txtTheGood.Tag = res.Item("xml").Value
      If (txtTheGood.Text <> res.Item("brief").Value) Then
        txtTheGood.Text = res.Item("brief").Value
        mIDTheGood = res.Item("ID").Value
        Call txtTheGood_Change
      End If
    Else
      Dim errStr As String
      errStr = res.Item("ErrorDescription").Value
      If (errStr <> vbNullString) Then
       Call MsgBox("Ошибка исполнения: " & errStr, vbOKOnly + vbCritical)
     End If
    End If
  End If
End Sub
Private Sub txtName_Change()
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

txtTheGood.Text = ""
txtTheGood.Tag = ""
mIDTheGood = ""
' Разобрать XML
Dim XMLDocTheGood As New DOMDocument
On Error Resume Next
If (Item.TheGood <> "") Then
  Call XMLDocTheGood.loadXML(Item.TheGood)
  If (err.Number = 0 And XMLDocTheGood.parseError.errorCode = 0) Then
    Dim nodeTheGood As MSXML2.IXMLDOMNode
    txtTheGood.Tag = Item.TheGood
    For Each nodeTheGood In XMLDocTheGood.childNodes.Item(0).childNodes
      If (nodeTheGood.baseName = "Brief") Then
       txtTheGood.Text = nodeTheGood.Text
       Exit For
      End If
    Next
  Else
    ' Попытка подобрать по ID
    Dim newIDTheGood As String
    newIDTheGood = Item.TheGood
    Dim XMLTheGoodID As String
    XMLTheGoodID = "<SQLData>"
    XMLTheGoodID = XMLTheGoodID & "<connectionstring>ref</connectionstring>"
    XMLTheGoodID = XMLTheGoodID & "<connectionprovider>ref</connectionprovider>"
    XMLTheGoodID = XMLTheGoodID & "<query>select CODE [Код], Description [Название] from item</query>"
    XMLTheGoodID = XMLTheGoodID & "<IDFieldName>Код</IDFieldName>"
    XMLTheGoodID = XMLTheGoodID & "<ID>" & newIDTheGood & "</ID>"
    XMLTheGoodID = XMLTheGoodID & "<BriefFields>Название</BriefFields>"
    XMLTheGoodID = XMLTheGoodID & "</SQLData>"
    Dim parsTheGood As New NamedValues
    Dim resTheGood As NamedValues
    Call parsTheGood.Add("xml", XMLTheGoodID)
    Set resTheGood = Item.Application.Manager.GetSQLDataDialog(parsTheGood)
    If (Not resTheGood Is Nothing) Then
      Dim resStrTheGood As String
      resStrTheGood = resTheGood.Item("RESULT").Value
      If (resStrTheGood = "OK") Then
        txtTheGood.Tag = Replace(resTheGood.Item("xml").Value, "%ID%", " 1=1 ")
        If (txtTheGood.Text <> resTheGood.Item("brief").Value) Then
          mIDTheGood = newIDTheGood
          txtTheGood.Text = resTheGood.Item("brief").Value
        End If
      End If
    Else
      Item.TheGood = vbNullString
    End If
  End If
Else
  Dim XMLTheGood As String
  XMLTheGood = "<SQLData>"
  XMLTheGood = XMLTheGood & "<connectionstring>ref</connectionstring>"
  XMLTheGood = XMLTheGood & "<connectionprovider>ref</connectionprovider>"
  XMLTheGood = XMLTheGood & "<query>select CODE [Код], Description [Название] from item</query>"
  XMLTheGood = XMLTheGood & "<IDFieldName>Код</IDFieldName>"
  XMLTheGood = XMLTheGood & "<BriefFields>Название</BriefFields>"
  XMLTheGood = XMLTheGood & "</SQLData>"
  txtTheGood.Tag = XMLTheGood
End If
On Error GoTo 0
 LoadBtnPictures cmdTheGood, cmdTheGood.Tag
  cmdTheGood.RemoveAllMenu
  cmdTheGood.AddMenu "Очистить"
  On Error Resume Next
txtName = Item.Name
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

Item.TheGood = txtTheGood.Tag
Item.Name = txtName
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



