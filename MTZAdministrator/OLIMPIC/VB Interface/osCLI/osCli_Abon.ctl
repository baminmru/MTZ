VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl osCli_Abon 
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
      Begin MSMask.MaskEdBox txtCost 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "����"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSComCtl2.DTPicker dtpDateFinish 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "���� ��������� ��������"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16515075
         CurrentDate     =   39937
      End
      Begin MSComCtl2.DTPicker dtpdateStart 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "���� ������ ��������"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16515075
         CurrentDate     =   39937
      End
      Begin MTZ_PANEL.DropButton cmdabonType 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ����������"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtabonType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "��� ����������"
         Top             =   1815
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpabonByeDate 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "���� ������������ ����������"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16515075
         CurrentDate     =   39937
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "����� ���������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblCost 
         BackStyle       =   0  'Transparent
         Caption         =   "����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDateFinish 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ��������� ��������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lbldateStart 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ������ ��������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblabonType 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ����������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblabonByeDate 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ������������ ����������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ���������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "osCli_Abon"
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

Private Sub txtTheNumber_Change()
  Changing

End Sub
Private Sub dtpabonByeDate_Change()
  Changing

End Sub
Private Sub txtabonType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdabonType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("osDic_srvtype", ID, brief) Then
          txtabonType.Tag = Left(ID, 38)
          txtabonType = brief
        End If
End Sub
Private Sub cmdabonType_MenuClick(ByVal sCaption As String)
          txtabonType.Tag = ""
          txtabonType = ""
End Sub
Private Sub dtpdateStart_Change()
  Changing

End Sub
Private Sub dtpDateFinish_Change()
  Changing

End Sub
Private Sub txtCost_Validate(cancel As Boolean)
If txtCost.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCost.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtCost.SetFocus
  ElseIf Val(txtCost.Text) < -922337203685478# Or Val(txtCost.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
     txtCost.SetFocus
  End If
End If
End Sub
Private Sub txtCost_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCost_Change()
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

If mIsOK Then mIsOK = IsSet(txtTheNumber.Text)
If mIsOK Then mIsOK = IsSet(dtpabonByeDate.Value)
If mIsOK Then mIsOK = txtabonType.Tag <> ""
If mIsOK Then mIsOK = IsSet(dtpdateStart.Value)
If mIsOK Then mIsOK = IsSet(dtpDateFinish.Value)
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
txtTheNumber = Item.TheNumber
dtpabonByeDate = Date
If Item.abonByeDate <> 0 Then
 dtpabonByeDate = Item.abonByeDate
End If
If Not Item.abonType Is Nothing Then
  txtabonType.Tag = Item.abonType.ID
  txtabonType = Item.abonType.brief
Else
  txtabonType.Tag = ""
  txtabonType = ""
End If
 LoadBtnPictures cmdabonType, cmdabonType.Tag
  cmdabonType.RemoveAllMenu
  cmdabonType.AddMenu "��������"
dtpdateStart = Date
If Item.dateStart <> 0 Then
 dtpdateStart = Item.dateStart
End If
dtpDateFinish = Date
If Item.DateFinish <> 0 Then
 dtpDateFinish = Item.DateFinish
End If
txtCost = Item.Cost
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

Item.TheNumber = txtTheNumber
  If IsNull(dtpabonByeDate) Then
    Item.abonByeDate = 0
  Else
    Item.abonByeDate = dtpabonByeDate.Value
  End If
If txtabonType.Tag <> "" Then
  Set Item.abonType = Item.Application.FindRowObject("osDic_srvtype", txtabonType.Tag)
Else
  Set Item.abonType = Nothing
End If
  If IsNull(dtpdateStart) Then
    Item.dateStart = 0
  Else
    Item.dateStart = dtpdateStart.Value
  End If
  If IsNull(dtpDateFinish) Then
    Item.DateFinish = 0
  Else
    Item.DateFinish = dtpDateFinish.Value
  End If
Item.Cost = CDbl(txtCost)
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



