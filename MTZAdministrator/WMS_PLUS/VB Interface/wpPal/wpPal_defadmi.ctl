VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl wpPal_defadmi 
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
      Begin MTZ_PANEL.DropButton cmdTheCell 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "������� ������"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCell 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "������� ������"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdLockedForOut 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "������������� ��� ��������"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtLockedForOut 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "������������� ��� ��������"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdLockedForIn 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "������������� ��� �������"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtLockedForIn 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "������������� ��� �������"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdpalType 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� �������"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtpalType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "��� �������"
         Top             =   2520
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpWeightingDate 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "���� �����������"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   83755011
         CurrentDate     =   39925
      End
      Begin MSMask.MaskEdBox txtTheWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "��� �������"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   2
         ToolTipText     =   "����� �������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblTheCell 
         BackStyle       =   0  'Transparent
         Caption         =   "������� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblLockedForOut 
         BackStyle       =   0  'Transparent
         Caption         =   "������������� ��� ��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblLockedForIn 
         BackStyle       =   0  'Transparent
         Caption         =   "������������� ��� �������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblpalType 
         BackStyle       =   0  'Transparent
         Caption         =   "��� �������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblWeightingDate 
         BackStyle       =   0  'Transparent
         Caption         =   "���� �����������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "��� �������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "����� �������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "wpPal_defadmi"
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
Item.S_code = Code128("PAL_" & txtTheNumber.Text)
End Sub
Private Sub txtTheWeight_Validate(cancel As Boolean)
If txtTheWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheWeight.Text) Then
     cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
     txtTheWeight.SetFocus
  ElseIf Val(txtTheWeight.Text) < -922337203685478# Or Val(txtTheWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "�������� ��� ����������� ���������", vbOKOnly + vbExclamation, "��������"
     txtTheWeight.SetFocus
  End If
End If
End Sub
Private Sub txtTheWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheWeight_Change()
  Changing

End Sub
Private Sub dtpWeightingDate_Change()
  Changing

End Sub
Private Sub txtpalType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdpalType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpDic_paltype", ID, brief) Then
          txtpalType.Tag = Left(ID, 38)
          txtpalType = brief
        End If
End Sub
Private Sub cmdpalType_MenuClick(ByVal sCaption As String)
          txtpalType.Tag = ""
          txtpalType = ""
End Sub
Private Sub txtLockedForIn_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdLockedForIn_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpIn_def", ID, brief) Then
          txtLockedForIn.Tag = Left(ID, 38)
          txtLockedForIn = brief
        End If
End Sub
Private Sub cmdLockedForIn_MenuClick(ByVal sCaption As String)
          txtLockedForIn.Tag = ""
          txtLockedForIn = ""
End Sub
Private Sub txtLockedForOut_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdLockedForOut_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpOut_def", ID, brief) Then
          txtLockedForOut.Tag = Left(ID, 38)
          txtLockedForOut = brief
        End If
End Sub
Private Sub cmdLockedForOut_MenuClick(ByVal sCaption As String)
          txtLockedForOut.Tag = ""
          txtLockedForOut = ""
End Sub
Private Sub txtTheCell_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCell_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpcell_cell", ID, brief) Then
          txtTheCell.Tag = Left(ID, 38)
          txtTheCell = brief
        End If
End Sub
Private Sub cmdTheCell_MenuClick(ByVal sCaption As String)
          txtTheCell.Tag = ""
          txtTheCell = ""
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
If mIsOK Then mIsOK = IsSet(txtTheWeight.Text)
If mIsOK Then mIsOK = IsSet(dtpWeightingDate.Value)
If mIsOK Then mIsOK = txtpalType.Tag <> ""
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
txtTheWeight = Item.TheWeight
dtpWeightingDate = Now
If Item.WeightingDate <> 0 Then
 dtpWeightingDate = Item.WeightingDate
End If
If Not Item.palType Is Nothing Then
  txtpalType.Tag = Item.palType.ID
  txtpalType = Item.palType.brief
Else
  txtpalType.Tag = ""
  txtpalType = ""
End If
 LoadBtnPictures cmdpalType, cmdpalType.Tag
  cmdpalType.RemoveAllMenu
  cmdpalType.AddMenu "��������"
If Not Item.LockedForIn Is Nothing Then
  txtLockedForIn.Tag = Item.LockedForIn.ID
  txtLockedForIn = Item.LockedForIn.brief
Else
  txtLockedForIn.Tag = ""
  txtLockedForIn = ""
End If
 LoadBtnPictures cmdLockedForIn, cmdLockedForIn.Tag
  cmdLockedForIn.RemoveAllMenu
  cmdLockedForIn.AddMenu "��������"
If Not Item.LockedForOut Is Nothing Then
  txtLockedForOut.Tag = Item.LockedForOut.ID
  txtLockedForOut = Item.LockedForOut.brief
Else
  txtLockedForOut.Tag = ""
  txtLockedForOut = ""
End If
 LoadBtnPictures cmdLockedForOut, cmdLockedForOut.Tag
  cmdLockedForOut.RemoveAllMenu
  cmdLockedForOut.AddMenu "��������"
If Not Item.TheCell Is Nothing Then
  txtTheCell.Tag = Item.TheCell.ID
  txtTheCell = Item.TheCell.brief
Else
  txtTheCell.Tag = ""
  txtTheCell = ""
End If
 LoadBtnPictures cmdTheCell, cmdTheCell.Tag
  cmdTheCell.RemoveAllMenu
  cmdTheCell.AddMenu "��������"
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
Item.TheWeight = CDbl(txtTheWeight)
  If IsNull(dtpWeightingDate) Then
    Item.WeightingDate = 0
  Else
    Item.WeightingDate = dtpWeightingDate.Value
  End If
If txtpalType.Tag <> "" Then
  Set Item.palType = Item.Application.FindRowObject("wpDic_paltype", txtpalType.Tag)
Else
  Set Item.palType = Nothing
End If
If txtLockedForIn.Tag <> "" Then
  Set Item.LockedForIn = Item.Application.FindRowObject("wpIn_def", txtLockedForIn.Tag)
Else
  Set Item.LockedForIn = Nothing
End If
If txtLockedForOut.Tag <> "" Then
  Set Item.LockedForOut = Item.Application.FindRowObject("wpOut_def", txtLockedForOut.Tag)
Else
  Set Item.LockedForOut = Nothing
End If
If txtTheCell.Tag <> "" Then
  Set Item.TheCell = Item.Application.FindRowObject("wpcell_cell", txtTheCell.Tag)
Else
  Set Item.TheCell = Nothing
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



