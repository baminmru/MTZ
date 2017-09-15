VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl ITTOUT_DEF 
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
      Begin MTZ_PANEL.DropButton cmdThePartyRule 
         Height          =   300
         Left            =   6000
         TabIndex        =   31
         Tag             =   "refopen.ico"
         ToolTipText     =   "Правиило формирования партии"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtThePartyRule 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   30
         ToolTipText     =   "Правиило формирования партии"
         Top             =   3225
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txttemp_in_track 
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         ToolTipText     =   "Температура"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSComCtl2.DTPicker dtptrack_time_out 
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         ToolTipText     =   "Время убытия машины"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   91422723
         CurrentDate     =   39874
      End
      Begin MSComCtl2.DTPicker dtpTrack_time_in 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "Время прибытия машины"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   91422723
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtStampStatus 
         Height          =   300
         Left            =   3450
         MaxLength       =   30
         TabIndex        =   22
         ToolTipText     =   "Состояние пломбы"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtStampNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   20
         ToolTipText     =   "Номер пломбы"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtContainer 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   18
         ToolTipText     =   "№ прицепа \ контейнера"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtTranspNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   16
         ToolTipText     =   "№ ТС"
         Top             =   4635
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTTNDate 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Дата ТТН"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   91422723
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtTTN 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   12
         ToolTipText     =   "Номер ТТН"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtSupplier 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   10
         ToolTipText     =   "Поставщик"
         Top             =   2520
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpProcessDate 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Дата обработки заказа"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   91422723
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdTheClient 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Клиент"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheClient 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Клиент"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdShipOrder 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Заказ на отгрузку"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtShipOrder 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Заказ на отгрузку"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblThePartyRule 
         BackStyle       =   0  'Transparent
         Caption         =   "Правиило формирования партии:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lbltemp_in_track 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lbltrack_time_out 
         BackStyle       =   0  'Transparent
         Caption         =   "Время убытия машины:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTrack_time_in 
         BackStyle       =   0  'Transparent
         Caption         =   "Время прибытия машины:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblStampStatus 
         BackStyle       =   0  'Transparent
         Caption         =   "Состояние пломбы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblStampNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер пломбы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblContainer 
         BackStyle       =   0  'Transparent
         Caption         =   "№ прицепа \ контейнера:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblTranspNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "№ ТС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTTNDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата ТТН:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTTN 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер ТТН:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblProcessDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата обработки заказа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblShipOrder 
         BackStyle       =   0  'Transparent
         Caption         =   "Заказ на отгрузку:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTOUT_DEF"
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
  Private mIDShipOrder As String
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

Private Sub txtShipOrder_Change()
  If Not (OnInit) Then
If (txtShipOrder.Text = "") Then
  ' Убрать Brief и ID
  If (txtShipOrder.Tag <> "") Then
    Dim XMLDoc As New DOMDocument
    Call XMLDoc.loadXML(txtShipOrder.Tag)
    Dim Node As MSXML2.IXMLDOMNode
    For Each Node In XMLDoc.childNodes.Item(0).childNodes
     If (Node.baseName = "ID") Then
       Node.Text = ""
     End If
     If (Node.baseName = "Brief") Then
       Node.Text = ""
     End If
    Next
    txtShipOrder.Tag = XMLDoc.xml
  End If
End If
If (Not OnInit Or True) Then ' Пока не понял - надо ли всегда или нет
    Call cmdTheClient_Click
    End If
  Changing

  End If
End Sub
Private Sub cmdShipOrder_Click()
  On Error Resume Next
  If (Not OnInit) Then
    Dim iFrom As Long
    Dim iTo As Long
    iFrom = InStr(1, txtShipOrder.Tag, "<ID>")
    If (iFrom > 0) Then
      iTo = InStr(iFrom, txtShipOrder.Tag, "</ID>")
      mIDShipOrder = Mid(txtShipOrder.Tag, iFrom + 4, iTo - iFrom - 5)
    End If
    Dim MTZShell As Object
    Set MTZShell = Item.Application.Manager.GetCustomObjects("MTZShell")
    If (Not MTZShell Is Nothing) Then
      err.Clear
      Dim Processed As Variant
      Processed = False
      Call MTZShell.FireEvent("ShipOrder;" & mIDShipOrder, Processed)
      If (err.Number = 0 And Processed <> vbNullString And Processed <> False) Then
        Exit Sub
      End If
    End If
    txtShipOrder.Tag = Replace(txtShipOrder.Tag, "<ID>", "<IDOld>")
    txtShipOrder.Tag = Replace(txtShipOrder.Tag, "</ID>", "</IDOld>")
  End If
  Dim pars As New NamedValues
  Dim res As NamedValues
  If (txtShipOrder.Tag = "") Then
    ' call MsgBox("Нет данных для запроса")
  Else
    Call pars.Add("filter", (Item.Application.Manager.GetCustomObjects("cliFilter").Name))
    txtShipOrder.Tag = AddSQLRefIds(txtShipOrder.Tag, "TheClient", txtTheClient.Tag)
    txtShipOrder.Tag = Replace(txtShipOrder.Tag, "%ID%", " 1=1 ")
    Call pars.Add("xml", txtShipOrder.Tag)
  End If
  Set res = Item.Application.Manager.GetSQLDataDialog(pars)
  If (Not res Is Nothing) Then
    Dim resStr As String
    resStr = res.Item("RESULT").Value
    If (resStr = "OK") Then
      txtShipOrder.Tag = res.Item("xml").Value
      If (txtShipOrder.Text <> res.Item("brief").Value) Then
        txtShipOrder.Text = res.Item("brief").Value
        mIDShipOrder = res.Item("ID").Value
        Call txtShipOrder_Change
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
If (Not OnInit Or True) Then ' Пока не понял - надо ли всегда или нет
    If (InStr(txtShipOrder.Tag, "%TheClientID%") > 0) Then
    'Call cmdShipOrder_Click()
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
    Call pars.Add("permanent", "true")
    txtTheClient.Tag = AddSQLRefIds(txtTheClient.Tag, "ShipOrder", txtShipOrder.Tag)
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
Private Sub dtpProcessDate_Change()
  Changing

End Sub
Private Sub txtSupplier_Change()
  Changing

End Sub
Private Sub txtTTN_Change()
  Changing

End Sub
Private Sub dtpTTNDate_Change()
  Changing

End Sub
Private Sub txtTranspNumber_Change()
  Changing

End Sub
Private Sub txtContainer_Change()
  Changing

End Sub
Private Sub txtStampNumber_Change()
  Changing

End Sub
Private Sub txtStampStatus_Change()
  Changing

End Sub
Private Sub dtpTrack_time_in_Change()
  Changing

End Sub
Private Sub dtptrack_time_out_Change()
  Changing

End Sub
Private Sub txttemp_in_track_Validate(cancel As Boolean)
If txttemp_in_track.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txttemp_in_track.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txttemp_in_track.SetFocus
  ElseIf Val(txttemp_in_track.Text) < -922337203685478# Or Val(txttemp_in_track.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txttemp_in_track.SetFocus
  End If
End If
End Sub
Private Sub txttemp_in_track_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txttemp_in_track_Change()
  Changing

End Sub
Private Sub txtThePartyRule_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdThePartyRule_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_RULE", ID, brief) Then
          txtThePartyRule.Tag = Left(ID, 38)
          txtThePartyRule = brief
        End If
End Sub
Private Sub cmdThePartyRule_MenuClick(ByVal sCaption As String)
          txtThePartyRule.Tag = ""
          txtThePartyRule = ""
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

If mIsOK Then mIsOK = txtShipOrder.Tag <> ""
If mIsOK Then mIsOK = IsSet(dtpProcessDate.Value)
If mIsOK Then mIsOK = txtThePartyRule.Tag <> ""
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

txtShipOrder.Text = ""
txtShipOrder.Tag = ""
mIDShipOrder = ""
' Разобрать XML
Dim XMLDocShipOrder As New DOMDocument
On Error Resume Next
If (Item.ShipOrder <> "") Then
  Call XMLDocShipOrder.loadXML(Item.ShipOrder)
  If (err.Number = 0 And XMLDocShipOrder.parseError.errorCode = 0) Then
    Dim nodeShipOrder As MSXML2.IXMLDOMNode
    txtShipOrder.Tag = Item.ShipOrder
    For Each nodeShipOrder In XMLDocShipOrder.childNodes.Item(0).childNodes
      If (nodeShipOrder.baseName = "Brief") Then
       txtShipOrder.Text = nodeShipOrder.Text
       Exit For
      End If
    Next
  Else
    ' Попытка подобрать по ID
    Dim newIDShipOrder As String
    newIDShipOrder = Item.ShipOrder
    Dim XMLShipOrderID As String
    XMLShipOrderID = "<SQLData>"
    XMLShipOrderID = XMLShipOrderID & "<connectionstring>ref</connectionstring>"
    XMLShipOrderID = XMLShipOrderID & "<connectionprovider>ref</connectionprovider>"
    XMLShipOrderID = XMLShipOrderID & "<query>select A.ID [КОД] , convert(varchar(30),A.NUMBER) +'  от ' + convert(varchar(30),A.ORD_DATE,111)  [Название], B.Name [Клиент]  from shipping_ORDER A left join PARTNER B on A.PARTNER_ID=B.ID </query>"
    XMLShipOrderID = XMLShipOrderID & "<IDFieldName>КОД</IDFieldName>"
    XMLShipOrderID = XMLShipOrderID & "<ID>" & newIDShipOrder & "</ID>"
    XMLShipOrderID = XMLShipOrderID & "<BriefFields>НАЗВАНИЕ</BriefFields>"
    XMLShipOrderID = XMLShipOrderID & "<TheClientID>" & mIDTheClient & "</TheClientID>"
    XMLShipOrderID = XMLShipOrderID & "</SQLData>"
    Dim parsShipOrder As New NamedValues
    Dim resShipOrder As NamedValues
    Call parsShipOrder.Add("xml", XMLShipOrderID)
    Set resShipOrder = Item.Application.Manager.GetSQLDataDialog(parsShipOrder)
    If (Not resShipOrder Is Nothing) Then
      Dim resStrShipOrder As String
      resStrShipOrder = resShipOrder.Item("RESULT").Value
      If (resStrShipOrder = "OK") Then
        txtShipOrder.Tag = Replace(resShipOrder.Item("xml").Value, "%ID%", " 1=1 ")
        If (txtShipOrder.Text <> resShipOrder.Item("brief").Value) Then
          mIDShipOrder = newIDShipOrder
          txtShipOrder.Text = resShipOrder.Item("brief").Value
        End If
      End If
    Else
      Item.ShipOrder = vbNullString
    End If
  End If
Else
  Dim XMLShipOrder As String
  XMLShipOrder = "<SQLData>"
  XMLShipOrder = XMLShipOrder & "<connectionstring>ref</connectionstring>"
  XMLShipOrder = XMLShipOrder & "<connectionprovider>ref</connectionprovider>"
  XMLShipOrder = XMLShipOrder & "<query>select A.ID [КОД] , convert(varchar(30),A.NUMBER) +'  от ' + convert(varchar(30),A.ORD_DATE,111)  [Название], B.Name [Клиент]  from shipping_ORDER A left join PARTNER B on A.PARTNER_ID=B.ID </query>"
  XMLShipOrder = XMLShipOrder & "<IDFieldName>КОД</IDFieldName>"
  XMLShipOrder = XMLShipOrder & "<BriefFields>НАЗВАНИЕ</BriefFields>"
    XMLShipOrder = XMLShipOrder & "<TheClientID>" & mIDTheClient & "</TheClientID>"
  XMLShipOrder = XMLShipOrder & "</SQLData>"
  txtShipOrder.Tag = XMLShipOrder
End If
On Error GoTo 0
 LoadBtnPictures cmdShipOrder, cmdShipOrder.Tag
  cmdShipOrder.RemoveAllMenu
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
    XMLTheClientID = XMLTheClientID & "<query>select partner.ID, partner.Name from SHIPPING_ORDER join partner on SHIPPING_ORDER.partner_id=partner.id where SHIPPING_ORDER.ID='%ShipOrderID%' </query>"
    XMLTheClientID = XMLTheClientID & "<IDFieldName>ID</IDFieldName>"
    XMLTheClientID = XMLTheClientID & "<ID>" & newIDTheClient & "</ID>"
    XMLTheClientID = XMLTheClientID & "<BriefFields>Name</BriefFields>"
    XMLTheClientID = XMLTheClientID & "<ShipOrderID>" & mIDShipOrder & "</ShipOrderID>"
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
  XMLTheClient = XMLTheClient & "<query>select partner.ID, partner.Name from SHIPPING_ORDER join partner on SHIPPING_ORDER.partner_id=partner.id where SHIPPING_ORDER.ID='%ShipOrderID%' </query>"
  XMLTheClient = XMLTheClient & "<IDFieldName>ID</IDFieldName>"
  XMLTheClient = XMLTheClient & "<BriefFields>Name</BriefFields>"
    XMLTheClient = XMLTheClient & "<ShipOrderID>" & mIDShipOrder & "</ShipOrderID>"
  XMLTheClient = XMLTheClient & "</SQLData>"
  txtTheClient.Tag = XMLTheClient
  Call cmdTheClient_Click
End If
On Error GoTo 0
 LoadBtnPictures cmdTheClient, cmdTheClient.Tag
  cmdTheClient.RemoveAllMenu
  cmdTheClient.Visible = False
dtpProcessDate = Date
If Item.ProcessDate <> 0 Then
 dtpProcessDate = Item.ProcessDate
End If
  On Error Resume Next
txtSupplier = Item.Supplier
  On Error Resume Next
txtTTN = Item.TTN
dtpTTNDate = Date
If Item.TTNDate <> 0 Then
 dtpTTNDate = Item.TTNDate
Else
 dtpTTNDate.Value = Null
End If
  On Error Resume Next
txtTranspNumber = Item.TranspNumber
  On Error Resume Next
txtContainer = Item.Container
  On Error Resume Next
txtStampNumber = Item.StampNumber
  On Error Resume Next
txtStampStatus = Item.StampStatus
dtpTrack_time_in = Now
If Item.Track_time_in <> 0 Then
 dtpTrack_time_in = Item.Track_time_in
Else
 dtpTrack_time_in.Value = Null
End If
dtptrack_time_out = Now
If Item.track_time_out <> 0 Then
 dtptrack_time_out = Item.track_time_out
Else
 dtptrack_time_out.Value = Null
End If
txttemp_in_track = Item.temp_in_track
If Not Item.ThePartyRule Is Nothing Then
  txtThePartyRule.Tag = Item.ThePartyRule.ID
  txtThePartyRule = Item.ThePartyRule.brief
Else
  txtThePartyRule.Tag = ""
  txtThePartyRule = ""
End If
 LoadBtnPictures cmdThePartyRule, cmdThePartyRule.Tag
  cmdThePartyRule.RemoveAllMenu
  cmdThePartyRule.AddMenu "Очистить"
' Добавим значения ID ко всем SQLReference
txtTheClient.Tag = AddSQLRefIds(txtTheClient.Tag, "ShipOrder", txtShipOrder.Tag)
txtShipOrder.Tag = AddSQLRefIds(txtShipOrder.Tag, "TheClient", txtTheClient.Tag)
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

Item.ShipOrder = txtShipOrder.Tag
Item.TheClient = txtTheClient.Tag
  If IsNull(dtpProcessDate) Then
    Item.ProcessDate = 0
  Else
    Item.ProcessDate = dtpProcessDate.Value
  End If
Item.Supplier = txtSupplier
Item.TTN = txtTTN
  If IsNull(dtpTTNDate) Then
    Item.TTNDate = 0
  Else
    Item.TTNDate = dtpTTNDate.Value
  End If
Item.TranspNumber = txtTranspNumber
Item.Container = txtContainer
Item.StampNumber = txtStampNumber
Item.StampStatus = txtStampStatus
  If IsNull(dtpTrack_time_in) Then
    Item.Track_time_in = 0
  Else
    Item.Track_time_in = dtpTrack_time_in.Value
  End If
  If IsNull(dtptrack_time_out) Then
    Item.track_time_out = 0
  Else
    Item.track_time_out = dtptrack_time_out.Value
  End If
Item.temp_in_track = CDbl(txttemp_in_track)
If txtThePartyRule.Tag <> "" Then
  Set Item.ThePartyRule = Item.Application.FindRowObject("ITTD_RULE", txtThePartyRule.Tag)
Else
  Set Item.ThePartyRule = Nothing
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



