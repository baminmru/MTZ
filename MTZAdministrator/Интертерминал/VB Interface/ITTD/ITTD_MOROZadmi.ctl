VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl ITTD_MOROZadmi 
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
      Begin MSMask.MaskEdBox txtMorozConst 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Коэффициент выморозки"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtWeightConst 
         Height          =   300
         Left            =   300
         TabIndex        =   5
         ToolTipText     =   "Точность весов"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdTheClient 
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
      Begin VB.TextBox txtTheClient 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Клиент"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblMorozConst 
         BackStyle       =   0  'Transparent
         Caption         =   "Коэффициент выморозки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblWeightConst 
         BackStyle       =   0  'Transparent
         Caption         =   "Точность весов:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTD_MOROZadmi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Параметры выморозки
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean
  Private mIDTheClient As String






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

Private Sub txtTheClient_Change()
  If Not (OnInit) Then
If (txtTheClient.Text = "") Then
  ' Убрать Brief и ID
  If (txtTheClient.Tag <> "") Then
    Dim XMLDoc As New DOMDocument
    Call XMLDoc.loadXML(txtTheClient.Tag)
    Dim Node As MSXML2.IXMLDOMNode
    For Each Node In XMLDoc.childNodes.Item(0).childNodes
     If (Node.baseName = "ID") Then
       Node.Text = ""
     End If
     If (Node.baseName = "Brief") Then
       Node.Text = ""
     End If
    Next
    txtTheClient.Tag = XMLDoc.xml
  End If
End If
  Changing

  End If
End Sub
Private Sub cmdTheClient_Click()
  On Error Resume Next
  If (Not OnInit) Then
    Dim iFrom As Long
    Dim iTo As Long
    iFrom = InStr(1, txtTheClient.Tag, "<ID>")
    If (iFrom > 0) Then
      iTo = InStr(iFrom, txtTheClient.Tag, "</ID>")
      mIDTheClient = Mid(txtTheClient.Tag, iFrom + 4, iTo - iFrom - 5)
    End If
    Dim MTZShell As Object
    Set MTZShell = Item.Application.Manager.GetCustomObjects("MTZShell")
    If (Not MTZShell Is Nothing) Then
      err.Clear
      Dim Processed As Variant
      Processed = False
      Call MTZShell.FireEvent("TheClient;" & mIDTheClient, Processed)
      If (err.Number = 0 And Processed <> vbNullString And Processed <> False) Then
        Exit Sub
      End If
    End If
    txtTheClient.Tag = Replace(txtTheClient.Tag, "<ID>", "<IDOld>")
    txtTheClient.Tag = Replace(txtTheClient.Tag, "</ID>", "</IDOld>")
  End If
  Dim pars As New NamedValues
  Dim res As NamedValues
  If (txtTheClient.Tag = "") Then
    ' call MsgBox("Нет данных для запроса")
  Else
    txtTheClient.Tag = Replace(txtTheClient.Tag, "%ID%", " 1=1 ")
    Call pars.Add("xml", txtTheClient.Tag)
  End If
  Set res = Item.Application.Manager.GetSQLDataDialog(pars)
  If (Not res Is Nothing) Then
    Dim resStr As String
    resStr = res.Item("RESULT").Value
    If (resStr = "OK") Then
      txtTheClient.Tag = res.Item("xml").Value
      If (txtTheClient.Text <> res.Item("brief").Value) Then
        txtTheClient.Text = res.Item("brief").Value
        mIDTheClient = res.Item("ID").Value
        Call txtTheClient_Change
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
Private Sub txtWeightConst_Validate(cancel As Boolean)
If txtWeightConst.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeightConst.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWeightConst.SetFocus
  ElseIf Val(txtWeightConst.Text) < -922337203685478# Or Val(txtWeightConst.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWeightConst.SetFocus
  End If
End If
End Sub
Private Sub txtWeightConst_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeightConst_Change()
  Changing

End Sub
Private Sub txtMorozConst_Validate(cancel As Boolean)
If txtMorozConst.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMorozConst.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtMorozConst.SetFocus
  ElseIf Val(txtMorozConst.Text) < -922337203685478# Or Val(txtMorozConst.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtMorozConst.SetFocus
  End If
End If
End Sub
Private Sub txtMorozConst_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMorozConst_Change()
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

txtTheClient.Text = ""
txtTheClient.Tag = ""
mIDTheClient = ""
' Разобрать XML
Dim XMLDocTheClient As New DOMDocument
On Error Resume Next
If (Item.TheClient <> "") Then
  Call XMLDocTheClient.loadXML(Item.TheClient)
  If (err.Number = 0 And XMLDocTheClient.parseError.errorCode = 0) Then
    Dim nodeTheClient As MSXML2.IXMLDOMNode
    txtTheClient.Tag = Item.TheClient
    For Each nodeTheClient In XMLDocTheClient.childNodes.Item(0).childNodes
      If (nodeTheClient.baseName = "Brief") Then
       txtTheClient.Text = nodeTheClient.Text
       Exit For
      End If
    Next
  Else
    ' Попытка подобрать по ID
    Dim newIDTheClient As String
    newIDTheClient = Item.TheClient
    Dim XMLTheClientID As String
    XMLTheClientID = "<SQLData>"
    XMLTheClientID = XMLTheClientID & "<connectionstring>ref</connectionstring>"
    XMLTheClientID = XMLTheClientID & "<connectionprovider>ref</connectionprovider>"
    XMLTheClientID = XMLTheClientID & "<query>select partner.ID, partner.Name from RECEIVING_ORDER join partner on RECEIVING_ORDER.partner_id=partner.id where RECEIVING_ORDER.ID='%QryCodeID%'</query>"
    XMLTheClientID = XMLTheClientID & "<IDFieldName>ID</IDFieldName>"
    XMLTheClientID = XMLTheClientID & "<ID>" & newIDTheClient & "</ID>"
    XMLTheClientID = XMLTheClientID & "<BriefFields>Name</BriefFields>"
    XMLTheClientID = XMLTheClientID & "</SQLData>"
    Dim parsTheClient As New NamedValues
    Dim resTheClient As NamedValues
    Call parsTheClient.Add("xml", XMLTheClientID)
    Set resTheClient = Item.Application.Manager.GetSQLDataDialog(parsTheClient)
    If (Not resTheClient Is Nothing) Then
      Dim resStrTheClient As String
      resStrTheClient = resTheClient.Item("RESULT").Value
      If (resStrTheClient = "OK") Then
        txtTheClient.Tag = Replace(resTheClient.Item("xml").Value, "%ID%", " 1=1 ")
        If (txtTheClient.Text <> resTheClient.Item("brief").Value) Then
          mIDTheClient = newIDTheClient
          txtTheClient.Text = resTheClient.Item("brief").Value
        End If
      End If
    Else
      Item.TheClient = vbNullString
    End If
  End If
Else
  Dim XMLTheClient As String
  XMLTheClient = "<SQLData>"
  XMLTheClient = XMLTheClient & "<connectionstring>ref</connectionstring>"
  XMLTheClient = XMLTheClient & "<connectionprovider>ref</connectionprovider>"
  XMLTheClient = XMLTheClient & "<query>select partner.ID, partner.Name from RECEIVING_ORDER join partner on RECEIVING_ORDER.partner_id=partner.id where RECEIVING_ORDER.ID='%QryCodeID%'</query>"
  XMLTheClient = XMLTheClient & "<IDFieldName>ID</IDFieldName>"
  XMLTheClient = XMLTheClient & "<BriefFields>Name</BriefFields>"
  XMLTheClient = XMLTheClient & "</SQLData>"
  txtTheClient.Tag = XMLTheClient
End If
On Error GoTo 0
 LoadBtnPictures cmdTheClient, cmdTheClient.Tag
  cmdTheClient.RemoveAllMenu
  cmdTheClient.AddMenu "Очистить"
txtWeightConst = Item.WeightConst
txtMorozConst = Item.MorozConst
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

Item.TheClient = txtTheClient.Tag
Item.WeightConst = CDbl(txtWeightConst)
Item.MorozConst = CDbl(txtMorozConst)
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



