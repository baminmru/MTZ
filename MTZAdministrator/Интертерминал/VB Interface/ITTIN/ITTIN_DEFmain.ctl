VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl ITTIN_DEFmain 
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
         ToolTipText     =   "�������� ������������ ������"
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
         ToolTipText     =   "�������� ������������ ������"
         Top             =   3225
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txttemp_in_track 
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         ToolTipText     =   "�����������"
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
         ToolTipText     =   "����� ������ ������"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16384003
         CurrentDate     =   39874
      End
      Begin MSComCtl2.DTPicker dtpTrack_time_in 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "����� �������� ������"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16384003
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtStampStatus 
         Height          =   300
         Left            =   3450
         MaxLength       =   30
         TabIndex        =   22
         ToolTipText     =   "��������� ������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtStampNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   20
         ToolTipText     =   "����� ������"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtContainer 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   18
         ToolTipText     =   "� ������� \ ����������"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtTranspNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   16
         ToolTipText     =   "� ��"
         Top             =   4635
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTTNDate 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "���� ���"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16384003
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtTTN 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   12
         ToolTipText     =   "����� ���"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtSupplier 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   10
         ToolTipText     =   "���������"
         Top             =   2520
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpProcessDate 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "���� ��������� ������"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16384003
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdTheClient 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "������"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheClient 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "������"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdQryCode 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ������"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtQryCode 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "��� ������"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblThePartyRule 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ������������ ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lbltemp_in_track 
         BackStyle       =   0  'Transparent
         Caption         =   "�����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lbltrack_time_out 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ������ ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTrack_time_in 
         BackStyle       =   0  'Transparent
         Caption         =   "����� �������� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblStampStatus 
         BackStyle       =   0  'Transparent
         Caption         =   "��������� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblStampNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblContainer 
         BackStyle       =   0  'Transparent
         Caption         =   "� ������� \ ����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblTranspNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "� ��:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTTNDate 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ���:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTTN 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ���:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "���������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblProcessDate 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ��������� ������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheClient 
         BackStyle       =   0  'Transparent
         Caption         =   "������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblQryCode 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTIN_DEFmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� �������
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean
  Private mIDQryCode As String
  Private mIDTheClient As String






'������� ������ ������
'Parameters:
'[IN][OUT]  Runner , ��� ���������: mtzmanager.main,
'[IN]   TypeName , ��� ���������: String,
'[IN][OUT]   ID , ��� ���������: string,
'[IN][OUT]   Brief , ��� ���������: string,
'[IN][OUT]   Cancel , ��� ���������: boolean  - ...
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.findObject(...���������...)
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

'������� ��������� ������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
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

Private Sub txtQryCode_Change()
  If Not (OnInit) Then
If (txtQryCode.Text = "") Then
  ' ������ Brief � ID
  If (txtQryCode.Tag <> "") Then
    Dim XMLDoc As New DOMDocument
    Call XMLDoc.loadXML(txtQryCode.Tag)
    Dim Node As MSXML2.IXMLDOMNode
    For Each Node In XMLDoc.childNodes.Item(0).childNodes
     If (Node.baseName = "ID") Then
       Node.Text = ""
     End If
     If (Node.baseName = "Brief") Then
       Node.Text = ""
     End If
    Next
    txtQryCode.Tag = XMLDoc.xml
  End If
End If
If (Not OnInit Or True) Then ' ���� �� ����� - ���� �� ������ ��� ���
    Call cmdTheClient_Click
    End If
  Changing

  End If
End Sub
Private Sub cmdQryCode_Click()
  On Error Resume Next
  If (Not OnInit) Then
    Dim iFrom As Long
    Dim iTo As Long
    iFrom = InStr(1, txtQryCode.Tag, "<ID>")
    If (iFrom > 0) Then
      iTo = InStr(iFrom, txtQryCode.Tag, "</ID>")
      mIDQryCode = Mid(txtQryCode.Tag, iFrom + 4, iTo - iFrom - 5)
    End If
    Dim MTZShell As Object
    Set MTZShell = Item.Application.Manager.GetCustomObjects("MTZShell")
    If (Not MTZShell Is Nothing) Then
      err.Clear
      Dim Processed As Variant
      Processed = False
      Call MTZShell.FireEvent("QryCode;" & mIDQryCode, Processed)
      If (err.Number = 0 And Processed <> vbNullString And Processed <> False) Then
        Exit Sub
      End If
    End If
    txtQryCode.Tag = Replace(txtQryCode.Tag, "<ID>", "<IDOld>")
    txtQryCode.Tag = Replace(txtQryCode.Tag, "</ID>", "</IDOld>")
  End If
  Dim pars As New NamedValues
  Dim res As NamedValues
  If (txtQryCode.Tag = "") Then
    ' call MsgBox("��� ������ ��� �������")
  Else
    Call pars.Add("filter", (Item.Application.Manager.GetCustomObjects("cliFilter").Name))
    txtQryCode.Tag = AddSQLRefIds(txtQryCode.Tag, "TheClient", txtTheClient.Tag)
    txtQryCode.Tag = Replace(txtQryCode.Tag, "%ID%", " 1=1 ")
    Call pars.Add("xml", txtQryCode.Tag)
  End If
  Set res = Item.Application.Manager.GetSQLDataDialog(pars)
  If (Not res Is Nothing) Then
    Dim resStr As String
    resStr = res.Item("RESULT").Value
    If (resStr = "OK") Then
      txtQryCode.Tag = res.Item("xml").Value
      If (txtQryCode.Text <> res.Item("brief").Value) Then
        txtQryCode.Text = res.Item("brief").Value
        mIDQryCode = res.Item("ID").Value
        Call txtQryCode_Change
      End If
    Else
      Dim errStr As String
      errStr = res.Item("ErrorDescription").Value
      If (errStr <> vbNullString) Then
       Call MsgBox("������ ����������: " & errStr, vbOKOnly + vbCritical)
     End If
    End If
  End If
End Sub
Private Sub txtTheClient_Change()
  If Not (OnInit) Then
If (txtTheClient.Text = "") Then
  ' ������ Brief � ID
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
If (Not OnInit Or True) Then ' ���� �� ����� - ���� �� ������ ��� ���
    If (InStr(txtQryCode.Tag, "%TheClientID%") > 0) Then
    'Call cmdQryCode_Click()
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
    ' call MsgBox("��� ������ ��� �������")
  Else
    Call pars.Add("permanent", "true")
    txtTheClient.Tag = AddSQLRefIds(txtTheClient.Tag, "QryCode", txtQryCode.Tag)
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
       Call MsgBox("������ ����������: " & errStr, vbOKOnly + vbCritical)
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
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txttemp_in_track.SetFocus
  ElseIf Val(txttemp_in_track.Text) < -922337203685478# Or Val(txttemp_in_track.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
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

'�������� ������������ ���������� ������ �� ������ ��������������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
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

'������������� ��������� ������
'Parameters:
' ���������� ���
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

txtQryCode.Text = ""
txtQryCode.Tag = ""
mIDQryCode = ""
' ��������� XML
Dim XMLDocQryCode As New DOMDocument
On Error Resume Next
If (Item.QryCode <> "") Then
  Call XMLDocQryCode.loadXML(Item.QryCode)
  If (err.Number = 0 And XMLDocQryCode.parseError.errorCode = 0) Then
    Dim nodeQryCode As MSXML2.IXMLDOMNode
    txtQryCode.Tag = Item.QryCode
    For Each nodeQryCode In XMLDocQryCode.childNodes.Item(0).childNodes
      If (nodeQryCode.baseName = "Brief") Then
       txtQryCode.Text = nodeQryCode.Text
       Exit For
      End If
    Next
  Else
    ' ������� ��������� �� ID
    Dim newIDQryCode As String
    newIDQryCode = Item.QryCode
    Dim XMLQryCodeID As String
    XMLQryCodeID = "<SQLData>"
    XMLQryCodeID = XMLQryCodeID & "<connectionstring>ref</connectionstring>"
    XMLQryCodeID = XMLQryCodeID & "<connectionprovider>ref</connectionprovider>"
    XMLQryCodeID = XMLQryCodeID & "<query>select A.ID [���] , convert(varchar(30),A.NUMBER) +'  �� ' + convert(varchar(30),A.ORD_DATE,111)  [��������], B.Name [������]  from RECEIVING_ORDER A left join PARTNER B on A.PARTNER_ID=B.ID </query>"
    XMLQryCodeID = XMLQryCodeID & "<IDFieldName>���</IDFieldName>"
    XMLQryCodeID = XMLQryCodeID & "<ID>" & newIDQryCode & "</ID>"
    XMLQryCodeID = XMLQryCodeID & "<BriefFields>��������</BriefFields>"
    XMLQryCodeID = XMLQryCodeID & "<TheClientID>" & mIDTheClient & "</TheClientID>"
    XMLQryCodeID = XMLQryCodeID & "</SQLData>"
    Dim parsQryCode As New NamedValues
    Dim resQryCode As NamedValues
    Call parsQryCode.Add("xml", XMLQryCodeID)
    Set resQryCode = Item.Application.Manager.GetSQLDataDialog(parsQryCode)
    If (Not resQryCode Is Nothing) Then
      Dim resStrQryCode As String
      resStrQryCode = resQryCode.Item("RESULT").Value
      If (resStrQryCode = "OK") Then
        txtQryCode.Tag = Replace(resQryCode.Item("xml").Value, "%ID%", " 1=1 ")
        If (txtQryCode.Text <> resQryCode.Item("brief").Value) Then
          mIDQryCode = newIDQryCode
          txtQryCode.Text = resQryCode.Item("brief").Value
        End If
      End If
    Else
      Item.QryCode = vbNullString
    End If
  End If
Else
  Dim XMLQryCode As String
  XMLQryCode = "<SQLData>"
  XMLQryCode = XMLQryCode & "<connectionstring>ref</connectionstring>"
  XMLQryCode = XMLQryCode & "<connectionprovider>ref</connectionprovider>"
  XMLQryCode = XMLQryCode & "<query>select A.ID [���] , convert(varchar(30),A.NUMBER) +'  �� ' + convert(varchar(30),A.ORD_DATE,111)  [��������], B.Name [������]  from RECEIVING_ORDER A left join PARTNER B on A.PARTNER_ID=B.ID </query>"
  XMLQryCode = XMLQryCode & "<IDFieldName>���</IDFieldName>"
  XMLQryCode = XMLQryCode & "<BriefFields>��������</BriefFields>"
    XMLQryCode = XMLQryCode & "<TheClientID>" & mIDTheClient & "</TheClientID>"
  XMLQryCode = XMLQryCode & "</SQLData>"
  txtQryCode.Tag = XMLQryCode
End If
On Error GoTo 0
 LoadBtnPictures cmdQryCode, cmdQryCode.Tag
  cmdQryCode.RemoveAllMenu
  cmdQryCode.AddMenu "��������"
txtTheClient.Text = ""
txtTheClient.Tag = ""
mIDTheClient = ""
' ��������� XML
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
    ' ������� ��������� �� ID
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
    XMLTheClientID = XMLTheClientID & "<QryCodeID>" & mIDQryCode & "</QryCodeID>"
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
    XMLTheClient = XMLTheClient & "<QryCodeID>" & mIDQryCode & "</QryCodeID>"
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
Else
 dtpProcessDate.Value = Null
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
  cmdThePartyRule.AddMenu "��������"
' ������� �������� ID �� ���� SQLReference
txtTheClient.Tag = AddSQLRefIds(txtTheClient.Tag, "QryCode", txtQryCode.Tag)
txtQryCode.Tag = AddSQLRefIds(txtQryCode.Tag, "TheClient", txtTheClient.Tag)
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Save({���������})
Public Sub Save()
If OnInit Then Exit Sub

Item.QryCode = txtQryCode.Tag
Item.TheClient = txtTheClient.Tag
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

'������ ������� ������ �� ������� ���������
'Parameters:
'[IN][OUT]  x , ��� ���������: Single,
'[IN][OUT]   y , ��� ���������: single  - ...
'See Also:
'Example:
'  call me.OptimalSize({���������})
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

'�������� ���� ��������� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
   Panel.Customize
 End Sub

'������ ��������� ��������� �� ������ ��� ���������� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. PanelCustomisationString
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property

'��������������  ������� ��������� �� ������
'Parameters:
'[IN][OUT]  s , ��� ���������: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. PanelCustomisationString = value
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property

'���������� ��������� ���������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Enabled
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property

'������ \ ���������� ��������� ���������
'Parameters:
'[IN]   v , ��� ���������: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. Enabled = value
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



