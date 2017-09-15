VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PEKD_DIRECTION 
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
      Begin MTZ_PANEL.DropButton cmdTheAgent 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Агент"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheAgent 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Агент"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheTransport 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Транспорт"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheTransport 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Транспорт"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.TextBox txtPOSTINDEX 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   14
         ToolTipText     =   "Почтовый индекс"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtthe_Rule 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   12
         ToolTipText     =   "Отправка"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtSrok 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   10
         ToolTipText     =   "Срок доставки"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdDept 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Филиал"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDept 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Филиал"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Направление"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTown 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Город"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTown 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Город"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblTheAgent 
         BackStyle       =   0  'Transparent
         Caption         =   "Агент:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblTheTransport 
         BackStyle       =   0  'Transparent
         Caption         =   "Транспорт:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblPOSTINDEX 
         BackStyle       =   0  'Transparent
         Caption         =   "Почтовый индекс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblthe_Rule 
         BackStyle       =   0  'Transparent
         Caption         =   "Отправка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblSrok 
         BackStyle       =   0  'Transparent
         Caption         =   "Срок доставки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblDept 
         BackStyle       =   0  'Transparent
         Caption         =   "Филиал:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Направление:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTown 
         BackStyle       =   0  'Transparent
         Caption         =   "Город:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKD_DIRECTION"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, Cancel)
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

Private Sub txtTown_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTown_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_TOWN", ID, brief) Then
          txtTown.Tag = Left(ID, 38)
          txtTown = brief
        End If
End Sub
Private Sub cmdTown_MenuClick(ByVal sCaption As String)
          txtTown.Tag = ""
          txtTown = ""
End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtDept_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDept_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DEPT", ID, brief) Then
          txtDept.Tag = Left(ID, 38)
          txtDept = brief
        End If
End Sub
Private Sub cmdDept_MenuClick(ByVal sCaption As String)
          txtDept.Tag = ""
          txtDept = ""
End Sub
Private Sub txtSrok_Change()
  Changing

End Sub
Private Sub txtthe_Rule_Change()
  Changing

End Sub
Private Sub txtPOSTINDEX_Change()
  Changing

End Sub
Private Sub txtTheTransport_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheTransport_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_TransportType", ID, brief) Then
          txtTheTransport.Tag = Left(ID, 38)
          txtTheTransport = brief
        End If
End Sub
Private Sub cmdTheTransport_MenuClick(ByVal sCaption As String)
          txtTheTransport.Tag = ""
          txtTheTransport = ""
End Sub
Private Sub txtTheAgent_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheAgent_CLick()
  On Error Resume Next
     If txtTheAgent.Tag = "" Then
       cmdTheAgent_MenuClick "Выбрать"
     Else
       cmdTheAgent_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheAgent_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheAgent.Tag = ""
          txtTheAgent = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheAgent.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheAgent.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheAgent.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2", "VRCCommonInfo_Transporter_Val=-1")
        If OK Then
          txtTheAgent.Tag = Left(ID, 38)
          txtTheAgent = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRC2" & Now
        ook = findObject(Item.Application.Manager, "VRC2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtTheAgent.Tag = ID
              txtTheAgent = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRC2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtTheAgent.Tag = obj.ID
              txtTheAgent = obj.brief
          Else
              txtTheAgent.Tag = ""
              txtTheAgent = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtTown.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = txtTheTransport.Tag <> ""
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

If Not Item.Town Is Nothing Then
  txtTown.Tag = Item.Town.ID
  txtTown = Item.Town.brief
Else
  txtTown.Tag = ""
  txtTown = ""
End If
 LoadBtnPictures cmdTown, cmdTown.Tag
  cmdTown.RemoveAllMenu
  cmdTown.AddMenu "Очистить"
  On Error Resume Next
txtName = Item.Name
If Not Item.Dept Is Nothing Then
  txtDept.Tag = Item.Dept.ID
  txtDept = Item.Dept.brief
Else
  txtDept.Tag = ""
  txtDept = ""
End If
 LoadBtnPictures cmdDept, cmdDept.Tag
  cmdDept.RemoveAllMenu
  cmdDept.AddMenu "Очистить"
  On Error Resume Next
txtSrok = Item.Srok
  On Error Resume Next
txtthe_Rule = Item.the_Rule
  On Error Resume Next
txtPOSTINDEX = Item.POSTINDEX
If Not Item.TheTransport Is Nothing Then
  txtTheTransport.Tag = Item.TheTransport.ID
  txtTheTransport = Item.TheTransport.brief
Else
  txtTheTransport.Tag = ""
  txtTheTransport = ""
End If
 LoadBtnPictures cmdTheTransport, cmdTheTransport.Tag
  cmdTheTransport.RemoveAllMenu
  cmdTheTransport.AddMenu "Очистить"
If Not Item.TheAgent Is Nothing Then
  txtTheAgent.Tag = Item.TheAgent.ID
  txtTheAgent = Item.TheAgent.brief
Else
  txtTheAgent.Tag = ""
  txtTheAgent = ""
End If
 LoadBtnPictures cmdTheAgent, cmdTheAgent.Tag
  cmdTheAgent.RemoveAllMenu
  cmdTheAgent.AddMenu "Очистить"
  cmdTheAgent.AddMenu "Создать"
  cmdTheAgent.AddMenu "Выбрать"
  cmdTheAgent.AddMenu "Открыть"
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

If txtTown.Tag <> "" Then
  Set Item.Town = Item.Application.FindRowObject("ENTDIC_TOWN", txtTown.Tag)
Else
  Set Item.Town = Nothing
End If
Item.Name = txtName
If txtDept.Tag <> "" Then
  Set Item.Dept = Item.Application.FindRowObject("PEKD_DEPT", txtDept.Tag)
Else
  Set Item.Dept = Nothing
End If
Item.Srok = txtSrok
Item.the_Rule = txtthe_Rule
Item.POSTINDEX = txtPOSTINDEX
If txtTheTransport.Tag <> "" Then
  Set Item.TheTransport = Item.Application.FindRowObject("ENTDIC_TransportType", txtTheTransport.Tag)
Else
  Set Item.TheTransport = Nothing
End If
If txtTheAgent.Tag <> "" Then
  Set Item.TheAgent = Item.Application.Manager.GetInstanceObject(txtTheAgent.Tag)
Else
  Set Item.TheAgent = Nothing
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



