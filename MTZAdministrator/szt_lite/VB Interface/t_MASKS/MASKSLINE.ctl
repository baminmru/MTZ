VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl MASKSLINE 
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
      Begin VB.ComboBox cmbCOLHIDDEN 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "������ �������"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtCOLFORMAT 
         Height          =   300
         Left            =   300
         MaxLength       =   1
         TabIndex        =   10
         ToolTipText     =   "��� ����"
         Top             =   3225
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtCOLWIDTH 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "������ �������"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtSEQUENCE 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "������� �����������"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtCHEADER 
         Height          =   300
         Left            =   300
         MaxLength       =   16
         TabIndex        =   4
         ToolTipText     =   "���������"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtCFLD 
         Height          =   300
         Left            =   300
         MaxLength       =   240
         TabIndex        =   2
         ToolTipText     =   "�������� ����"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblCOLHIDDEN 
         BackStyle       =   0  'Transparent
         Caption         =   "������ �������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblCOLFORMAT 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ����:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCOLWIDTH 
         BackStyle       =   0  'Transparent
         Caption         =   "������ �������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSEQUENCE 
         BackStyle       =   0  'Transparent
         Caption         =   "������� �����������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCHEADER 
         BackStyle       =   0  'Transparent
         Caption         =   "���������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCFLD 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ����:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "MASKSLINE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� MASKSLINE
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean






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

Private Sub txtCFLD_Change()
  Changing

End Sub
Private Sub txtCHEADER_Change()
  Changing

End Sub
Private Sub txtSEQUENCE_Validate(cancel As Boolean)
If txtSEQUENCE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSEQUENCE.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtSEQUENCE.SetFocus
  ElseIf Val(txtSEQUENCE.Text) < -922337203685478# Or Val(txtSEQUENCE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
     txtSEQUENCE.SetFocus
  End If
End If
End Sub
Private Sub txtSEQUENCE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtSEQUENCE_Change()
  Changing

End Sub
Private Sub txtCOLWIDTH_Validate(cancel As Boolean)
If txtCOLWIDTH.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCOLWIDTH.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtCOLWIDTH.SetFocus
  ElseIf Val(txtCOLWIDTH.Text) < -922337203685478# Or Val(txtCOLWIDTH.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
     txtCOLWIDTH.SetFocus
  End If
End If
End Sub
Private Sub txtCOLWIDTH_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCOLWIDTH_Change()
  Changing

End Sub
Private Sub txtCOLFORMAT_Change()
  Changing

End Sub
Private Sub cmbCOLHIDDEN_Click()
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

If mIsOK Then mIsOK = IsSet(txtCFLD.Text)
If mIsOK Then mIsOK = IsSet(txtCHEADER.Text)
If mIsOK Then mIsOK = IsSet(txtSEQUENCE.Text)
If mIsOK Then mIsOK = IsSet(txtCOLWIDTH.Text)
If mIsOK Then mIsOK = IsSet(txtCOLFORMAT.Text)
If mIsOK Then mIsOK = (cmbCOLHIDDEN.ListIndex >= 0)
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
txtCFLD = Item.CFLD
  On Error Resume Next
txtCHEADER = Item.CHEADER
txtSEQUENCE = Item.SEQUENCE
txtCOLWIDTH = Item.COLWIDTH
  On Error Resume Next
txtCOLFORMAT = Item.COLFORMAT
cmbCOLHIDDEN.Clear
cmbCOLHIDDEN.AddItem "��"
cmbCOLHIDDEN.ItemData(cmbCOLHIDDEN.NewIndex) = -1
cmbCOLHIDDEN.AddItem "���"
cmbCOLHIDDEN.ItemData(cmbCOLHIDDEN.NewIndex) = 0
 For iii = 0 To cmbCOLHIDDEN.ListCount - 1
  If Item.COLHIDDEN = cmbCOLHIDDEN.ItemData(iii) Then
   cmbCOLHIDDEN.ListIndex = iii
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

Item.CFLD = txtCFLD
Item.CHEADER = txtCHEADER
Item.SEQUENCE = CDbl(txtSEQUENCE)
Item.COLWIDTH = CDbl(txtCOLWIDTH)
Item.COLFORMAT = txtCOLFORMAT
 If cmbCOLHIDDEN.ListIndex >= 0 Then
   Item.COLHIDDEN = cmbCOLHIDDEN.ItemData(cmbCOLHIDDEN.ListIndex)
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



