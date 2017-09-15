VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl HCMESSAGES 
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
      Begin MSMask.MaskEdBox txtAPPL_TYPE 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "��� ��, ��� ������������� �� (0 - �������, 1 - ������)"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtNODE_NAME 
         Height          =   300
         Left            =   300
         MaxLength       =   160
         TabIndex        =   12
         ToolTipText     =   "�������� ���� �����"
         Top             =   3930
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDT_REG 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "���� ����������� ���������"
         Top             =   3225
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   80084995
         CurrentDate     =   39975
      End
      Begin MSComCtl2.DTPicker dtpDT_GOT 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "���� ��������� ���������"
         Top             =   2520
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   80084995
         CurrentDate     =   39975
      End
      Begin MSMask.MaskEdBox txtWAS_REG 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "0 - �����������., 1 - ���������."
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtMSG_TEXT 
         Height          =   300
         Left            =   300
         MaxLength       =   800
         TabIndex        =   4
         ToolTipText     =   "����� ���������"
         Top             =   1110
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtMSG_TYPE 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "��� ���������"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.Label lblAPPL_TYPE 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ��, ��� ������������� �� (0 - �������, 1 - ������):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblNODE_NAME 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ���� �����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDT_REG 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ����������� ���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblDT_GOT 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ��������� ���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblWAS_REG 
         BackStyle       =   0  'Transparent
         Caption         =   "0 - �����������., 1 - ���������.:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblMSG_TEXT 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblMSG_TYPE 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "HCMESSAGES"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� ��������� � ��������� ���������
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

Private Sub txtMSG_TYPE_Validate(cancel As Boolean)
If txtMSG_TYPE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMSG_TYPE.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtMSG_TYPE.SetFocus
  ElseIf Val(txtMSG_TYPE.Text) < -922337203685478# Or Val(txtMSG_TYPE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
     txtMSG_TYPE.SetFocus
  End If
End If
End Sub
Private Sub txtMSG_TYPE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMSG_TYPE_Change()
  Changing

End Sub
Private Sub txtMSG_TEXT_Change()
  Changing

End Sub
Private Sub txtWAS_REG_Validate(cancel As Boolean)
If txtWAS_REG.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWAS_REG.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtWAS_REG.SetFocus
  ElseIf Val(txtWAS_REG.Text) < -922337203685478# Or Val(txtWAS_REG.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
     txtWAS_REG.SetFocus
  End If
End If
End Sub
Private Sub txtWAS_REG_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWAS_REG_Change()
  Changing

End Sub
Private Sub dtpDT_GOT_Change()
  Changing

End Sub
Private Sub dtpDT_REG_Change()
  Changing

End Sub
Private Sub txtNODE_NAME_Change()
  Changing

End Sub
Private Sub txtAPPL_TYPE_Validate(cancel As Boolean)
If txtAPPL_TYPE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtAPPL_TYPE.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtAPPL_TYPE.SetFocus
  ElseIf Val(txtAPPL_TYPE.Text) < -922337203685478# Or Val(txtAPPL_TYPE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
     txtAPPL_TYPE.SetFocus
  End If
End If
End Sub
Private Sub txtAPPL_TYPE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtAPPL_TYPE_Change()
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

txtMSG_TYPE = Item.MSG_TYPE
  On Error Resume Next
txtMSG_TEXT = Item.MSG_TEXT
txtWAS_REG = Item.WAS_REG
dtpDT_GOT = Now
If Item.DT_GOT <> 0 Then
 dtpDT_GOT = Item.DT_GOT
Else
 dtpDT_GOT.Value = Null
End If
dtpDT_REG = Now
If Item.DT_REG <> 0 Then
 dtpDT_REG = Item.DT_REG
Else
 dtpDT_REG.Value = Null
End If
  On Error Resume Next
txtNODE_NAME = Item.NODE_NAME
txtAPPL_TYPE = Item.APPL_TYPE
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

Item.MSG_TYPE = CDbl(txtMSG_TYPE)
Item.MSG_TEXT = txtMSG_TEXT
Item.WAS_REG = CDbl(txtWAS_REG)
  If IsNull(dtpDT_GOT) Then
    Item.DT_GOT = 0
  Else
    Item.DT_GOT = dtpDT_GOT.Value
  End If
  If IsNull(dtpDT_REG) Then
    Item.DT_REG = 0
  Else
    Item.DT_REG = dtpDT_REG.Value
  End If
Item.NODE_NAME = txtNODE_NAME
Item.APPL_TYPE = CDbl(txtAPPL_TYPE)
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



