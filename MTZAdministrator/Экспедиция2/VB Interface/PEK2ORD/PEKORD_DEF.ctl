VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PEKORD_DEF 
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
      Begin MSComCtl2.DTPicker dtpTarifStartDate 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Дата начала действия тарифа"
         Top             =   4830
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71368707
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtcomments 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   11
         ToolTipText     =   "Содержание"
         Top             =   3225
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpregdate 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Дата регистрации"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71368707
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtdocname 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   7
         ToolTipText     =   "Название"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdauthor 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Автор"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtauthor 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Автор"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtdocnumber 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер приказа"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblTarifStartDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата начала действия тарифа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblcomments 
         BackStyle       =   0  'Transparent
         Caption         =   "Содержание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblregdate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата регистрации:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lbldocname 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblauthor 
         BackStyle       =   0  'Transparent
         Caption         =   "Автор:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lbldocnumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер приказа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKORD_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





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
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtdocnumber_Validate(cancel As Boolean)
If txtdocnumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtdocnumber.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtdocnumber.SetFocus
  ElseIf Val(txtdocnumber.Text) <> CLng(Val(txtdocnumber.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtdocnumber.SetFocus
  End If
End If
End Sub
Private Sub txtdocnumber_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtdocnumber_Change()
  Changing

End Sub
Private Sub txtauthor_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdauthor_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", ID, brief) Then
          txtauthor.Tag = Left(ID, 38)
          txtauthor = brief
        End If
End Sub
Private Sub cmdauthor_MenuClick(ByVal sCaption As String)
          txtauthor.Tag = ""
          txtauthor = ""
End Sub
Private Sub txtdocname_Change()
  Changing

End Sub
Private Sub dtpregdate_Change()
  Changing

End Sub
Private Sub txtcomments_Change()
  Changing

End Sub
Private Sub dtpTarifStartDate_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtauthor.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtdocname.Text)
If mIsOK Then mIsOK = IsSet(dtpTarifStartDate.Value)
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

txtdocnumber = Item.docnumber
If Not Item.author Is Nothing Then
  txtauthor.Tag = Item.author.ID
  txtauthor = Item.author.brief
Else
  txtauthor.Tag = ""
  txtauthor = ""
End If
 LoadBtnPictures cmdauthor, cmdauthor.Tag
  cmdauthor.RemoveAllMenu
  cmdauthor.AddMenu "Очистить"
  On Error Resume Next
txtdocname = Item.docname
dtpregdate = Date
If Item.regdate <> 0 Then
 dtpregdate = Item.regdate
Else
 dtpregdate.Value = Null
End If
txtcomments = Item.Comments
dtpTarifStartDate = Date
If Item.TarifStartDate <> 0 Then
 dtpTarifStartDate = Item.TarifStartDate
End If
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

Item.docnumber = CDbl(txtdocnumber)
If txtauthor.Tag <> "" Then
  Set Item.author = Item.Application.FindRowObject("Users", txtauthor.Tag)
Else
  Set Item.author = Nothing
End If
Item.docname = txtdocname
  If IsNull(dtpregdate) Then
    Item.regdate = 0
  Else
    Item.regdate = dtpregdate.Value
  End If
Item.Comments = txtcomments
  If IsNull(dtpTarifStartDate) Then
    Item.TarifStartDate = 0
  Else
    Item.TarifStartDate = dtpTarifStartDate.Value
  End If
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



