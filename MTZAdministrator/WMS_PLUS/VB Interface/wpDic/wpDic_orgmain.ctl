VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl wpDic_orgmain 
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
      Begin VB.TextBox txtFIOBuh 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   24
         ToolTipText     =   "��� ��. ����������"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtFIODirector 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   22
         ToolTipText     =   "��� ���������"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtWEBSiteURL 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   20
         ToolTipText     =   "WEB"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtemail 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   18
         ToolTipText     =   "E-MAIL"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTheFax 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   16
         ToolTipText     =   "����"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtPhone 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   14
         ToolTipText     =   "�������"
         Top             =   6435
         Width           =   3000
      End
      Begin VB.TextBox txtpostAddr 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         ToolTipText     =   "�������� �����"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.TextBox txtUrAddr 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   10
         ToolTipText     =   "��. �����"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtKPP 
         Height          =   300
         Left            =   300
         MaxLength       =   12
         TabIndex        =   8
         ToolTipText     =   "���"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtINN 
         Height          =   300
         Left            =   300
         MaxLength       =   11
         TabIndex        =   6
         ToolTipText     =   "���"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFullName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "������ ������������"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtShortName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "������� ������������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblFIOBuh 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ��. ����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFIODirector 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblWEBSiteURL 
         BackStyle       =   0  'Transparent
         Caption         =   "WEB:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblemail 
         BackStyle       =   0  'Transparent
         Caption         =   "E-MAIL:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   17
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheFax 
         BackStyle       =   0  'Transparent
         Caption         =   "����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   15
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblPhone 
         BackStyle       =   0  'Transparent
         Caption         =   "�������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   6105
         Width           =   3000
      End
      Begin VB.Label lblpostAddr 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� �����:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblUrAddr 
         BackStyle       =   0  'Transparent
         Caption         =   "��. �����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblKPP 
         BackStyle       =   0  'Transparent
         Caption         =   "���:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblINN 
         BackStyle       =   0  'Transparent
         Caption         =   "���:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFullName 
         BackStyle       =   0  'Transparent
         Caption         =   "������ ������������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblShortName 
         BackStyle       =   0  'Transparent
         Caption         =   "������� ������������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "wpDic_orgmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� ������� �������� �� �����������
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

Private Sub txtShortName_Change()
  Changing

End Sub
Private Sub txtFullName_Change()
  Changing

End Sub
Private Sub txtINN_Change()
  Changing

End Sub
Private Sub txtKPP_Change()
  Changing

End Sub
Private Sub txtUrAddr_Change()
  Changing

End Sub
Private Sub txtpostAddr_Change()
  Changing

End Sub
Private Sub txtPhone_Change()
  Changing

End Sub
Private Sub txtTheFax_Change()
  Changing

End Sub
Private Sub txtemail_Change()
  Changing

End Sub
Private Sub txtWEBSiteURL_Change()
  Changing

End Sub
Private Sub txtFIODirector_Change()
  Changing

End Sub
Private Sub txtFIOBuh_Change()
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

If mIsOK Then mIsOK = IsSet(txtShortName.Text)
If mIsOK Then mIsOK = IsSet(txtFullName.Text)
If mIsOK Then mIsOK = IsSet(txtpostAddr.Text)
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
txtShortName = Item.ShortName
  On Error Resume Next
txtFullName = Item.FullName
  On Error Resume Next
txtINN = Item.INN
  On Error Resume Next
txtKPP = Item.KPP
txtUrAddr = Item.UrAddr
txtpostAddr = Item.postAddr
  On Error Resume Next
txtPhone = Item.Phone
  On Error Resume Next
txtTheFax = Item.TheFax
  On Error Resume Next
txtemail = Item.email
  On Error Resume Next
txtWEBSiteURL = Item.WEBSiteURL
  On Error Resume Next
txtFIODirector = Item.FIODirector
  On Error Resume Next
txtFIOBuh = Item.FIOBuh
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

Item.ShortName = txtShortName
Item.FullName = txtFullName
Item.INN = txtINN
Item.KPP = txtKPP
Item.UrAddr = txtUrAddr
Item.postAddr = txtpostAddr
Item.Phone = txtPhone
Item.TheFax = txtTheFax
Item.email = txtemail
Item.WEBSiteURL = txtWEBSiteURL
Item.FIODirector = txtFIODirector
Item.FIOBuh = txtFIOBuh
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



