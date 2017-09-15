VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl ENTDIC_BANKadmi 
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
      Begin VB.TextBox txtCode1C 
         Height          =   300
         Left            =   300
         MaxLength       =   40
         TabIndex        =   16
         ToolTipText     =   "���1�"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtAddr 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   14
         ToolTipText     =   "�����"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtname 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   12
         ToolTipText     =   "��������"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtSUBKORACC 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   10
         ToolTipText     =   "��� ��� ����"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtKORACC 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   8
         ToolTipText     =   "���. ����"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtACC 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   6
         ToolTipText     =   "����"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtRKC 
         Height          =   300
         Left            =   300
         MaxLength       =   11
         TabIndex        =   4
         ToolTipText     =   "���"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtBIC 
         Height          =   300
         Left            =   300
         MaxLength       =   11
         TabIndex        =   2
         ToolTipText     =   "���"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblCode1C 
         BackStyle       =   0  'Transparent
         Caption         =   "���1�:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblAddr 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblname 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblSUBKORACC 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ��� ����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblKORACC 
         BackStyle       =   0  'Transparent
         Caption         =   "���. ����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblACC 
         BackStyle       =   0  'Transparent
         Caption         =   "����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblRKC 
         BackStyle       =   0  'Transparent
         Caption         =   "���:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblBIC 
         BackStyle       =   0  'Transparent
         Caption         =   "���:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ENTDIC_BANKadmi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief)
bye:
findObject = result
End Function
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtBIC_Change()
  Changing

End Sub
Private Sub txtRKC_Change()
  Changing

End Sub
Private Sub txtACC_Change()
  Changing

End Sub
Private Sub txtKORACC_Change()
  Changing

End Sub
Private Sub txtSUBKORACC_Change()
  Changing

End Sub
Private Sub txtname_Change()
  Changing

End Sub
Private Sub txtAddr_Change()
  Changing

End Sub
Private Sub txtCode1C_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtBIC.Text)
If mIsOK Then mIsOK = IsSet(txtRKC.Text)
If mIsOK Then mIsOK = IsSet(txtname.Text)
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
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

  On Error Resume Next
txtBIC = Item.BIC
  On Error Resume Next
txtRKC = Item.RKC
  On Error Resume Next
txtACC = Item.ACC
  On Error Resume Next
txtKORACC = Item.KORACC
  On Error Resume Next
txtSUBKORACC = Item.SUBKORACC
  On Error Resume Next
txtname = Item.Name
  On Error Resume Next
txtAddr = Item.Addr
  On Error Resume Next
txtCode1C = Item.Code1C
' ������� �������� ID �� ���� SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

Item.BIC = txtBIC
Item.RKC = txtRKC
Item.ACC = txtACC
Item.KORACC = txtKORACC
Item.SUBKORACC = txtSUBKORACC
Item.Name = txtname
Item.Addr = txtAddr
Item.Code1C = txtCode1C
 mIsChanged = False
 RaiseEvent Changed
End Sub
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
 Public Sub Customize()
   Panel.Customize
 End Sub
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



