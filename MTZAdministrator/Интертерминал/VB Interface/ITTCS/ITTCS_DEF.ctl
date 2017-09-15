VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl ITTCS_DEF 
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
      Begin MTZ_PANEL.DropButton cmdCLIENTCODE 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Код клиента"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCLIENTCODE 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Код клиента"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblCLIENTCODE 
         BackStyle       =   0  'Transparent
         Caption         =   "Код клиента:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTCS_DEF"
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
  Private mIDCLIENTCODE As String






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

Private Sub txtCLIENTCODE_Change()
  If Not (OnInit) Then
If (txtCLIENTCODE.Text = "") Then
  ' Убрать Brief и ID
  If (txtCLIENTCODE.Tag <> "") Then
    Dim XMLDoc As New DOMDocument
    Call XMLDoc.loadXML(txtCLIENTCODE.Tag)
    Dim Node As MSXML2.IXMLDOMNode
    For Each Node In XMLDoc.childNodes.Item(0).childNodes
     If (Node.baseName = "ID") Then
       Node.Text = ""
     End If
     If (Node.baseName = "Brief") Then
       Node.Text = ""
     End If
    Next
    txtCLIENTCODE.Tag = XMLDoc.xml
  End If
End If
  Changing

  End If
End Sub
Private Sub cmdCLIENTCODE_Click()
  On Error Resume Next
  If (Not OnInit) Then
    Dim iFrom As Long
    Dim iTo As Long
    iFrom = InStr(1, txtCLIENTCODE.Tag, "<ID>")
    If (iFrom > 0) Then
      iTo = InStr(iFrom, txtCLIENTCODE.Tag, "</ID>")
      mIDCLIENTCODE = Mid(txtCLIENTCODE.Tag, iFrom + 4, iTo - iFrom - 5)
    End If
    Dim MTZShell As Object
    Set MTZShell = Item.Application.Manager.GetCustomObjects("MTZShell")
    If (Not MTZShell Is Nothing) Then
      err.Clear
      Dim Processed As Variant
      Processed = False
      Call MTZShell.FireEvent("CLIENTCODE;" & mIDCLIENTCODE, Processed)
      If (err.Number = 0 And Processed <> vbNullString And Processed <> False) Then
        Exit Sub
      End If
    End If
    txtCLIENTCODE.Tag = Replace(txtCLIENTCODE.Tag, "<ID>", "<IDOld>")
    txtCLIENTCODE.Tag = Replace(txtCLIENTCODE.Tag, "</ID>", "</IDOld>")
  End If
  Dim pars As New NamedValues
  Dim res As NamedValues
  If (txtCLIENTCODE.Tag = "") Then
    ' call MsgBox("Нет данных для запроса")
  Else
    txtCLIENTCODE.Tag = Replace(txtCLIENTCODE.Tag, "%ID%", " 1=1 ")
    Call pars.Add("xml", txtCLIENTCODE.Tag)
  End If
  Set res = Item.Application.Manager.GetSQLDataDialog(pars)
  If (Not res Is Nothing) Then
    Dim resStr As String
    resStr = res.Item("RESULT").Value
    If (resStr = "OK") Then
      txtCLIENTCODE.Tag = res.Item("xml").Value
      If (txtCLIENTCODE.Text <> res.Item("brief").Value) Then
        txtCLIENTCODE.Text = res.Item("brief").Value
        mIDCLIENTCODE = res.Item("ID").Value
        Call txtCLIENTCODE_Change
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

If mIsOK Then mIsOK = txtCLIENTCODE.Tag <> ""
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

txtCLIENTCODE.Text = ""
txtCLIENTCODE.Tag = ""
mIDCLIENTCODE = ""
' Разобрать XML
Dim XMLDocCLIENTCODE As New DOMDocument
On Error Resume Next
If (Item.CLIENTCODE <> "") Then
  Call XMLDocCLIENTCODE.loadXML(Item.CLIENTCODE)
  If (err.Number = 0 And XMLDocCLIENTCODE.parseError.errorCode = 0) Then
    Dim nodeCLIENTCODE As MSXML2.IXMLDOMNode
    txtCLIENTCODE.Tag = Item.CLIENTCODE
    For Each nodeCLIENTCODE In XMLDocCLIENTCODE.childNodes.Item(0).childNodes
      If (nodeCLIENTCODE.baseName = "Brief") Then
       txtCLIENTCODE.Text = nodeCLIENTCODE.Text
       Exit For
      End If
    Next
  Else
    ' Попытка подобрать по ID
    Dim newIDCLIENTCODE As String
    newIDCLIENTCODE = Item.CLIENTCODE
    Dim XMLCLIENTCODEID As String
    XMLCLIENTCODEID = "<SQLData>"
    XMLCLIENTCODEID = XMLCLIENTCODEID & "<connectionstring>ref</connectionstring>"
    XMLCLIENTCODEID = XMLCLIENTCODEID & "<connectionprovider>ref</connectionprovider>"
    XMLCLIENTCODEID = XMLCLIENTCODEID & "<query>select ID[КОД] ,NAME [Название] from PARTNER</query>"
    XMLCLIENTCODEID = XMLCLIENTCODEID & "<IDFieldName>КОД</IDFieldName>"
    XMLCLIENTCODEID = XMLCLIENTCODEID & "<ID>" & newIDCLIENTCODE & "</ID>"
    XMLCLIENTCODEID = XMLCLIENTCODEID & "<BriefFields>Название</BriefFields>"
    XMLCLIENTCODEID = XMLCLIENTCODEID & "</SQLData>"
    Dim parsCLIENTCODE As New NamedValues
    Dim resCLIENTCODE As NamedValues
    Call parsCLIENTCODE.Add("xml", XMLCLIENTCODEID)
    Set resCLIENTCODE = Item.Application.Manager.GetSQLDataDialog(parsCLIENTCODE)
    If (Not resCLIENTCODE Is Nothing) Then
      Dim resStrCLIENTCODE As String
      resStrCLIENTCODE = resCLIENTCODE.Item("RESULT").Value
      If (resStrCLIENTCODE = "OK") Then
        txtCLIENTCODE.Tag = Replace(resCLIENTCODE.Item("xml").Value, "%ID%", " 1=1 ")
        If (txtCLIENTCODE.Text <> resCLIENTCODE.Item("brief").Value) Then
          mIDCLIENTCODE = newIDCLIENTCODE
          txtCLIENTCODE.Text = resCLIENTCODE.Item("brief").Value
        End If
      End If
    Else
      Item.CLIENTCODE = vbNullString
    End If
  End If
Else
  Dim XMLCLIENTCODE As String
  XMLCLIENTCODE = "<SQLData>"
  XMLCLIENTCODE = XMLCLIENTCODE & "<connectionstring>ref</connectionstring>"
  XMLCLIENTCODE = XMLCLIENTCODE & "<connectionprovider>ref</connectionprovider>"
  XMLCLIENTCODE = XMLCLIENTCODE & "<query>select ID[КОД] ,NAME [Название] from PARTNER</query>"
  XMLCLIENTCODE = XMLCLIENTCODE & "<IDFieldName>КОД</IDFieldName>"
  XMLCLIENTCODE = XMLCLIENTCODE & "<BriefFields>Название</BriefFields>"
  XMLCLIENTCODE = XMLCLIENTCODE & "</SQLData>"
  txtCLIENTCODE.Tag = XMLCLIENTCODE
End If
On Error GoTo 0
 LoadBtnPictures cmdCLIENTCODE, cmdCLIENTCODE.Tag
  cmdCLIENTCODE.RemoveAllMenu
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

Item.CLIENTCODE = txtCLIENTCODE.Tag
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



