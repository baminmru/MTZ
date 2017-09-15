VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl ITTPL_DEF 
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
      Begin VB.ComboBox cmbPrivatePalet 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   32
         ToolTipText     =   "����� ������"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtCorePalette_ID 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   30
         ToolTipText     =   "������������� ������ � CoreIMS"
         Top             =   3225
         Width           =   1800
      End
      Begin MSComCtl2.DTPicker dtpQryInDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         ToolTipText     =   "���� �����������"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   91750403
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtQryInNumber 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   26
         ToolTipText     =   "����� ������"
         Top             =   1815
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtPackageWeight 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "��� ��������"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtCurrentPosition 
         Height          =   300
         Left            =   3450
         MaxLength       =   12
         TabIndex        =   22
         ToolTipText     =   "������� ������ ������"
         Top             =   405
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtCurrentWeightBrutto 
         Height          =   300
         Left            =   300
         TabIndex        =   20
         ToolTipText     =   "��� ������� � �������"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdCurrentGood 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "������� �����"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCurrentGood 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "������� �����"
         Top             =   5340
         Width           =   2550
      End
      Begin VB.TextBox txtCaliberQuantity 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   15
         ToolTipText     =   "���������� ������� �� �������"
         Top             =   4635
         Width           =   1800
      End
      Begin MSComCtl2.DTPicker dtpWDate 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "���� �����������"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "HH:mm:ss"
         Format          =   91750403
         UpDown          =   -1  'True
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdPltype 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ������"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPltype 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "��� ������"
         Top             =   3225
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "��� �������"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtPalKode 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   6
         ToolTipText     =   "��������"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   4
         ToolTipText     =   "�����"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.TextBox txtCode 
         Height          =   300
         Left            =   300
         MaxLength       =   14
         TabIndex        =   2
         ToolTipText     =   "��� ������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblPrivatePalet 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblCorePalette_ID 
         BackStyle       =   0  'Transparent
         Caption         =   "������������� ������ � CoreIMS:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblQryInDate 
         BackStyle       =   0  'Transparent
         Caption         =   "���� �����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblQryInNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCurrentPosition 
         BackStyle       =   0  'Transparent
         Caption         =   "������� ������ ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblCurrentWeightBrutto 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ������� � �������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblCurrentGood 
         BackStyle       =   0  'Transparent
         Caption         =   "������� �����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblCaliberQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "���������� ������� �� �������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblWDate 
         BackStyle       =   0  'Transparent
         Caption         =   "���� �����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPltype 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "��� �������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPalKode 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCode 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTPL_DEF"
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
  Private mIDCurrentGood As String






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

Private Sub txtCode_Change()
  Changing

End Sub
Private Sub txtTheNumber_Validate(cancel As Boolean)
If txtTheNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNumber.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtTheNumber.SetFocus
  ElseIf Val(txtTheNumber.Text) <> CLng(Val(txtTheNumber.Text)) Then
     cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
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

End Sub
Private Sub txtPalKode_Change()
  Changing

End Sub
Private Sub txtWeight_Validate(cancel As Boolean)
If txtWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeight.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtWeight.SetFocus
  ElseIf Val(txtWeight.Text) < -922337203685478# Or Val(txtWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
     txtWeight.SetFocus
  End If
End If
End Sub
Private Sub txtWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeight_Change()
  Changing

End Sub
Private Sub txtPltype_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPltype_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_PLTYPE", ID, brief) Then
          txtPltype.Tag = Left(ID, 38)
          txtPltype = brief
        End If
End Sub
Private Sub cmdPltype_MenuClick(ByVal sCaption As String)
          txtPltype.Tag = ""
          txtPltype = ""
End Sub
Private Sub dtpWDate_Change()
  Changing

End Sub
Private Sub txtCaliberQuantity_Validate(cancel As Boolean)
If txtCaliberQuantity.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCaliberQuantity.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtCaliberQuantity.SetFocus
  ElseIf Val(txtCaliberQuantity.Text) <> CLng(Val(txtCaliberQuantity.Text)) Then
     cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
     txtCaliberQuantity.SetFocus
  End If
End If
End Sub
Private Sub txtCaliberQuantity_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCaliberQuantity_Change()
  Changing

End Sub
Private Sub txtCurrentGood_Change()
  If Not (OnInit) Then
If (txtCurrentGood.Text = "") Then
  ' ������ Brief � ID
  If (txtCurrentGood.Tag <> "") Then
    Dim XMLDoc As New DOMDocument
    Call XMLDoc.loadXML(txtCurrentGood.Tag)
    Dim Node As MSXML2.IXMLDOMNode
    For Each Node In XMLDoc.childNodes.Item(0).childNodes
     If (Node.baseName = "ID") Then
       Node.Text = ""
     End If
     If (Node.baseName = "Brief") Then
       Node.Text = ""
     End If
    Next
    txtCurrentGood.Tag = XMLDoc.xml
  End If
End If
  Changing

  End If
End Sub
Private Sub cmdCurrentGood_Click()
  On Error Resume Next
  If (Not OnInit) Then
    Dim iFrom As Long
    Dim iTo As Long
    iFrom = InStr(1, txtCurrentGood.Tag, "<ID>")
    If (iFrom > 0) Then
      iTo = InStr(iFrom, txtCurrentGood.Tag, "</ID>")
      mIDCurrentGood = Mid(txtCurrentGood.Tag, iFrom + 4, iTo - iFrom - 5)
    End If
    Dim MTZShell As Object
    Set MTZShell = Item.Application.Manager.GetCustomObjects("MTZShell")
    If (Not MTZShell Is Nothing) Then
      err.Clear
      Dim Processed As Variant
      Processed = False
      Call MTZShell.FireEvent("CurrentGood;" & mIDCurrentGood, Processed)
      If (err.Number = 0 And Processed <> vbNullString And Processed <> False) Then
        Exit Sub
      End If
    End If
    txtCurrentGood.Tag = Replace(txtCurrentGood.Tag, "<ID>", "<IDOld>")
    txtCurrentGood.Tag = Replace(txtCurrentGood.Tag, "</ID>", "</IDOld>")
  End If
  Dim pars As New NamedValues
  Dim res As NamedValues
  If (txtCurrentGood.Tag = "") Then
    ' call MsgBox("��� ������ ��� �������")
  Else
    txtCurrentGood.Tag = Replace(txtCurrentGood.Tag, "%ID%", " 1=1 ")
    Call pars.Add("xml", txtCurrentGood.Tag)
  End If
  Set res = Item.Application.Manager.GetSQLDataDialog(pars)
  If (Not res Is Nothing) Then
    Dim resStr As String
    resStr = res.Item("RESULT").Value
    If (resStr = "OK") Then
      txtCurrentGood.Tag = res.Item("xml").Value
      If (txtCurrentGood.Text <> res.Item("brief").Value) Then
        txtCurrentGood.Text = res.Item("brief").Value
        mIDCurrentGood = res.Item("ID").Value
        Call txtCurrentGood_Change
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
Private Sub txtCurrentWeightBrutto_Validate(cancel As Boolean)
If txtCurrentWeightBrutto.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCurrentWeightBrutto.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtCurrentWeightBrutto.SetFocus
  ElseIf Val(txtCurrentWeightBrutto.Text) < -922337203685478# Or Val(txtCurrentWeightBrutto.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
     txtCurrentWeightBrutto.SetFocus
  End If
End If
End Sub
Private Sub txtCurrentWeightBrutto_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCurrentWeightBrutto_Change()
  Changing

End Sub
Private Sub txtCurrentPosition_Change()
  Changing

End Sub
Private Sub txtPackageWeight_Validate(cancel As Boolean)
If txtPackageWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPackageWeight.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtPackageWeight.SetFocus
  ElseIf Val(txtPackageWeight.Text) < -922337203685478# Or Val(txtPackageWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
     txtPackageWeight.SetFocus
  End If
End If
End Sub
Private Sub txtPackageWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPackageWeight_Change()
  Changing

End Sub
Private Sub txtQryInNumber_Change()
  Changing

End Sub
Private Sub dtpQryInDate_Change()
  Changing

End Sub
Private Sub txtCorePalette_ID_Validate(cancel As Boolean)
If txtCorePalette_ID.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCorePalette_ID.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtCorePalette_ID.SetFocus
  ElseIf Val(txtCorePalette_ID.Text) <> CLng(Val(txtCorePalette_ID.Text)) Then
     cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
     txtCorePalette_ID.SetFocus
  End If
End If
End Sub
Private Sub txtCorePalette_ID_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCorePalette_ID_Change()
  Changing

End Sub
Private Sub cmbPrivatePalet_Click()
  On Error Resume Next
  Changing

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

If mIsOK Then mIsOK = IsSet(txtCode.Text)
If mIsOK Then mIsOK = IsSet(txtTheNumber.Text)
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

  On Error Resume Next
txtCode = Item.Code
txtTheNumber = Item.TheNumber
  On Error Resume Next
txtPalKode = Item.PalKode
txtWeight = Item.Weight
If Not Item.Pltype Is Nothing Then
  txtPltype.Tag = Item.Pltype.ID
  txtPltype = Item.Pltype.brief
Else
  txtPltype.Tag = ""
  txtPltype = ""
End If
 LoadBtnPictures cmdPltype, cmdPltype.Tag
  cmdPltype.RemoveAllMenu
  cmdPltype.AddMenu "��������"
dtpWDate = Time
If Item.WDate <> 0 Then
 dtpWDate = Item.WDate
Else
 dtpWDate.Value = Null
End If
txtCaliberQuantity = Item.CaliberQuantity
txtCurrentGood.Text = ""
txtCurrentGood.Tag = ""
mIDCurrentGood = ""
' ��������� XML
Dim XMLDocCurrentGood As New DOMDocument
On Error Resume Next
If (Item.CurrentGood <> "") Then
  Call XMLDocCurrentGood.loadXML(Item.CurrentGood)
  If (err.Number = 0 And XMLDocCurrentGood.parseError.errorCode = 0) Then
    Dim nodeCurrentGood As MSXML2.IXMLDOMNode
    txtCurrentGood.Tag = Item.CurrentGood
    For Each nodeCurrentGood In XMLDocCurrentGood.childNodes.Item(0).childNodes
      If (nodeCurrentGood.baseName = "Brief") Then
       txtCurrentGood.Text = nodeCurrentGood.Text
       Exit For
      End If
    Next
  Else
    ' ������� ��������� �� ID
    Dim newIDCurrentGood As String
    newIDCurrentGood = Item.CurrentGood
    Dim XMLCurrentGoodID As String
    XMLCurrentGoodID = "<SQLData>"
    XMLCurrentGoodID = XMLCurrentGoodID & "<connectionstring>ref</connectionstring>"
    XMLCurrentGoodID = XMLCurrentGoodID & "<connectionprovider>ref</connectionprovider>"
    XMLCurrentGoodID = XMLCurrentGoodID & "<query>select A.ID [���], A.DESCRIPTION [��������] from item A</query>"
    XMLCurrentGoodID = XMLCurrentGoodID & "<IDFieldName>���</IDFieldName>"
    XMLCurrentGoodID = XMLCurrentGoodID & "<ID>" & newIDCurrentGood & "</ID>"
    XMLCurrentGoodID = XMLCurrentGoodID & "<BriefFields>��������</BriefFields>"
    XMLCurrentGoodID = XMLCurrentGoodID & "</SQLData>"
    Dim parsCurrentGood As New NamedValues
    Dim resCurrentGood As NamedValues
    Call parsCurrentGood.Add("xml", XMLCurrentGoodID)
    Set resCurrentGood = Item.Application.Manager.GetSQLDataDialog(parsCurrentGood)
    If (Not resCurrentGood Is Nothing) Then
      Dim resStrCurrentGood As String
      resStrCurrentGood = resCurrentGood.Item("RESULT").Value
      If (resStrCurrentGood = "OK") Then
        txtCurrentGood.Tag = Replace(resCurrentGood.Item("xml").Value, "%ID%", " 1=1 ")
        If (txtCurrentGood.Text <> resCurrentGood.Item("brief").Value) Then
          mIDCurrentGood = newIDCurrentGood
          txtCurrentGood.Text = resCurrentGood.Item("brief").Value
        End If
      End If
    Else
      Item.CurrentGood = vbNullString
    End If
  End If
Else
  Dim XMLCurrentGood As String
  XMLCurrentGood = "<SQLData>"
  XMLCurrentGood = XMLCurrentGood & "<connectionstring>ref</connectionstring>"
  XMLCurrentGood = XMLCurrentGood & "<connectionprovider>ref</connectionprovider>"
  XMLCurrentGood = XMLCurrentGood & "<query>select A.ID [���], A.DESCRIPTION [��������] from item A</query>"
  XMLCurrentGood = XMLCurrentGood & "<IDFieldName>���</IDFieldName>"
  XMLCurrentGood = XMLCurrentGood & "<BriefFields>��������</BriefFields>"
  XMLCurrentGood = XMLCurrentGood & "</SQLData>"
  txtCurrentGood.Tag = XMLCurrentGood
End If
On Error GoTo 0
 LoadBtnPictures cmdCurrentGood, cmdCurrentGood.Tag
  cmdCurrentGood.RemoveAllMenu
  cmdCurrentGood.AddMenu "��������"
txtCurrentWeightBrutto = Item.CurrentWeightBrutto
  On Error Resume Next
txtCurrentPosition = Item.CurrentPosition
txtPackageWeight = Item.PackageWeight
  On Error Resume Next
txtQryInNumber = Item.QryInNumber
dtpQryInDate = Date
If Item.QryInDate <> 0 Then
 dtpQryInDate = Item.QryInDate
Else
 dtpQryInDate.Value = Null
End If
txtCorePalette_ID = Item.CorePalette_ID
cmbPrivatePalet.Clear
cmbPrivatePalet.AddItem "��"
cmbPrivatePalet.ItemData(cmbPrivatePalet.NewIndex) = -1
cmbPrivatePalet.AddItem "���"
cmbPrivatePalet.ItemData(cmbPrivatePalet.NewIndex) = 0
 For iii = 0 To cmbPrivatePalet.ListCount - 1
  If Item.PrivatePalet = cmbPrivatePalet.ItemData(iii) Then
   cmbPrivatePalet.ListIndex = iii
   Exit For
  End If
 Next
' ������� �������� ID �� ���� SQLReference
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

Item.Code = txtCode
Item.TheNumber = CDbl(txtTheNumber)
Item.PalKode = txtPalKode
Item.Weight = CDbl(txtWeight)
If txtPltype.Tag <> "" Then
  Set Item.Pltype = Item.Application.FindRowObject("ITTD_PLTYPE", txtPltype.Tag)
Else
  Set Item.Pltype = Nothing
End If
  If IsNull(dtpWDate) Then
    Item.WDate = 0
  Else
    Item.WDate = dtpWDate.Value
  End If
Item.CaliberQuantity = CDbl(txtCaliberQuantity)
Item.CurrentGood = txtCurrentGood.Tag
Item.CurrentWeightBrutto = CDbl(txtCurrentWeightBrutto)
Item.CurrentPosition = txtCurrentPosition
Item.PackageWeight = CDbl(txtPackageWeight)
Item.QryInNumber = txtQryInNumber
  If IsNull(dtpQryInDate) Then
    Item.QryInDate = 0
  Else
    Item.QryInDate = dtpQryInDate.Value
  End If
Item.CorePalette_ID = CDbl(txtCorePalette_ID)
 If cmbPrivatePalet.ListIndex >= 0 Then
   Item.PrivatePalet = cmbPrivatePalet.ItemData(cmbPrivatePalet.ListIndex)
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



