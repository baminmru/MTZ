VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WMSG_ARTICUL 
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
      Begin MTZ_PANEL.DropButton cmdFactory 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "Завод"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFactory 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "Завод"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdmade_country 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страна производитель"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtmade_country 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Страна производитель"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.TextBox txtProfType 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   8
         ToolTipText     =   "Тип профиля"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtTheSize 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "Размеры"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtArtNum 
         Height          =   300
         Left            =   300
         MaxLength       =   40
         TabIndex        =   2
         ToolTipText     =   "Номер артикула"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblFactory 
         BackStyle       =   0  'Transparent
         Caption         =   "Завод:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblmade_country 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна производитель:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblProfType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип профиля:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheSize 
         BackStyle       =   0  'Transparent
         Caption         =   "Размеры:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblArtNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер артикула:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSG_ARTICUL"
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

Private Sub txtArtNum_Change()
  Changing

End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtTheSize_Change()
  Changing

End Sub
Private Sub txtProfType_Change()
  Changing

End Sub
Private Sub txtmade_country_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdmade_country_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_COUNTRY", ID, brief) Then
          txtmade_country.Tag = Left(ID, 38)
          txtmade_country = brief
        End If
End Sub
Private Sub cmdmade_country_MenuClick(ByVal sCaption As String)
          txtmade_country.Tag = ""
          txtmade_country = ""
End Sub
Private Sub txtFactory_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFactory_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_FACTORY", ID, brief) Then
          txtFactory.Tag = Left(ID, 38)
          txtFactory = brief
        End If
End Sub
Private Sub cmdFactory_MenuClick(ByVal sCaption As String)
          txtFactory.Tag = ""
          txtFactory = ""
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtArtNum.Text)
If mIsOK Then mIsOK = txtmade_country.Tag <> ""
If mIsOK Then mIsOK = txtFactory.Tag <> ""
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
txtArtNum = Item.ArtNum
  On Error Resume Next
txtName = Item.Name
  On Error Resume Next
txtTheSize = Item.TheSize
  On Error Resume Next
txtProfType = Item.ProfType
If Not Item.made_country Is Nothing Then
  txtmade_country.Tag = Item.made_country.ID
  txtmade_country = Item.made_country.brief
Else
  txtmade_country.Tag = ""
  txtmade_country = ""
End If
 LoadBtnPictures cmdmade_country, cmdmade_country.Tag
  cmdmade_country.RemoveAllMenu
  cmdmade_country.AddMenu "Очистить"
If Not Item.Factory Is Nothing Then
  txtFactory.Tag = Item.Factory.ID
  txtFactory = Item.Factory.brief
Else
  txtFactory.Tag = ""
  txtFactory = ""
End If
 LoadBtnPictures cmdFactory, cmdFactory.Tag
  cmdFactory.RemoveAllMenu
  cmdFactory.AddMenu "Очистить"
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

Item.ArtNum = txtArtNum
Item.Name = txtName
Item.TheSize = txtTheSize
Item.ProfType = txtProfType
If txtmade_country.Tag <> "" Then
  Set Item.made_country = Item.Application.FindRowObject("WMSD_COUNTRY", txtmade_country.Tag)
Else
  Set Item.made_country = Nothing
End If
If txtFactory.Tag <> "" Then
  Set Item.Factory = Item.Application.FindRowObject("WMSD_FACTORY", txtFactory.Tag)
Else
  Set Item.Factory = Nothing
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



