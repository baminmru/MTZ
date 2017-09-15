VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WMSD_PARTadmi 
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
      Begin MTZ_PANEL.DropButton cmdTheCountry 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страна"
         Top             =   6240
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCountry 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Страна"
         Top             =   6240
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdArticle 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Артикул"
         Top             =   5535
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtArticle 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Артикул"
         Top             =   5535
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpexp_date 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Срок годности"
         Top             =   4830
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   85524483
         CurrentDate     =   39482
      End
      Begin MSComCtl2.DTPicker dtpMade_date 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Дата производства"
         Top             =   4125
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   85524483
         CurrentDate     =   39482
      End
      Begin VB.TextBox txtInfo 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   10
         ToolTipText     =   "Параметры"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   8
         ToolTipText     =   "Наименование партии"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheDogovor 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Договор"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDogovor 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Договор"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdSupplier 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поклажедатель"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSupplier 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Поклажедатель"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblTheCountry 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblArticle 
         BackStyle       =   0  'Transparent
         Caption         =   "Артикул:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblexp_date 
         BackStyle       =   0  'Transparent
         Caption         =   "Срок годности:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblMade_date 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата производства:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Параметры:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Наименование партии:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheDogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "Договор:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поклажедатель:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSD_PARTadmi"
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

Private Sub txtSupplier_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSupplier_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSK_DEF", ID, brief) Then
          txtSupplier.Tag = Left(ID, 38)
          txtSupplier = brief
        End If
End Sub
Private Sub cmdSupplier_MenuClick(ByVal sCaption As String)
          txtSupplier.Tag = ""
          txtSupplier = ""
End Sub
Private Sub txtTheDogovor_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDogovor_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSCT_DEF", ID, brief) Then
          txtTheDogovor.Tag = Left(ID, 38)
          txtTheDogovor = brief
        End If
End Sub
Private Sub cmdTheDogovor_MenuClick(ByVal sCaption As String)
          txtTheDogovor.Tag = ""
          txtTheDogovor = ""
End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtInfo_Change()
  Changing

End Sub
Private Sub dtpMade_date_Change()
  Changing

End Sub
Private Sub dtpexp_date_Change()
  Changing

End Sub
Private Sub txtArticle_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdArticle_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSG_ARTICUL", ID, brief) Then
          txtArticle.Tag = Left(ID, 38)
          txtArticle = brief
        End If
End Sub
Private Sub cmdArticle_MenuClick(ByVal sCaption As String)
          txtArticle.Tag = ""
          txtArticle = ""
End Sub
Private Sub txtTheCountry_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCountry_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_COUNTRY", ID, brief) Then
          txtTheCountry.Tag = Left(ID, 38)
          txtTheCountry = brief
        End If
End Sub
Private Sub cmdTheCountry_MenuClick(ByVal sCaption As String)
          txtTheCountry.Tag = ""
          txtTheCountry = ""
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = IsSet(dtpMade_date.Value)
If mIsOK Then mIsOK = IsSet(dtpexp_date.Value)
If mIsOK Then mIsOK = txtArticle.Tag <> ""
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

If Not Item.Supplier Is Nothing Then
  txtSupplier.Tag = Item.Supplier.ID
  txtSupplier = Item.Supplier.brief
Else
  txtSupplier.Tag = ""
  txtSupplier = ""
End If
 LoadBtnPictures cmdSupplier, cmdSupplier.Tag
  cmdSupplier.RemoveAllMenu
  cmdSupplier.AddMenu "Очистить"
If Not Item.TheDogovor Is Nothing Then
  txtTheDogovor.Tag = Item.TheDogovor.ID
  txtTheDogovor = Item.TheDogovor.brief
Else
  txtTheDogovor.Tag = ""
  txtTheDogovor = ""
End If
 LoadBtnPictures cmdTheDogovor, cmdTheDogovor.Tag
  cmdTheDogovor.RemoveAllMenu
  cmdTheDogovor.AddMenu "Очистить"
  On Error Resume Next
txtName = Item.Name
txtInfo = Item.Info
dtpMade_date = Date
If Item.Made_date <> 0 Then
 dtpMade_date = Item.Made_date
End If
dtpexp_date = Date
If Item.exp_date <> 0 Then
 dtpexp_date = Item.exp_date
End If
If Not Item.Article Is Nothing Then
  txtArticle.Tag = Item.Article.ID
  txtArticle = Item.Article.brief
Else
  txtArticle.Tag = ""
  txtArticle = ""
End If
 LoadBtnPictures cmdArticle, cmdArticle.Tag
  cmdArticle.RemoveAllMenu
  cmdArticle.AddMenu "Очистить"
If Not Item.TheCountry Is Nothing Then
  txtTheCountry.Tag = Item.TheCountry.ID
  txtTheCountry = Item.TheCountry.brief
Else
  txtTheCountry.Tag = ""
  txtTheCountry = ""
End If
 LoadBtnPictures cmdTheCountry, cmdTheCountry.Tag
  cmdTheCountry.RemoveAllMenu
  cmdTheCountry.AddMenu "Очистить"
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

If txtSupplier.Tag <> "" Then
  Set Item.Supplier = Item.Application.FindRowObject("WMSK_DEF", txtSupplier.Tag)
Else
  Set Item.Supplier = Nothing
End If
If txtTheDogovor.Tag <> "" Then
  Set Item.TheDogovor = Item.Application.FindRowObject("WMSCT_DEF", txtTheDogovor.Tag)
Else
  Set Item.TheDogovor = Nothing
End If
Item.Name = txtName
Item.Info = txtInfo
  If IsNull(dtpMade_date) Then
    Item.Made_date = 0
  Else
    Item.Made_date = dtpMade_date.Value
  End If
  If IsNull(dtpexp_date) Then
    Item.exp_date = 0
  Else
    Item.exp_date = dtpexp_date.Value
  End If
If txtArticle.Tag <> "" Then
  Set Item.Article = Item.Application.FindRowObject("WMSG_ARTICUL", txtArticle.Tag)
Else
  Set Item.Article = Nothing
End If
If txtTheCountry.Tag <> "" Then
  Set Item.TheCountry = Item.Application.FindRowObject("WMSD_COUNTRY", txtTheCountry.Tag)
Else
  Set Item.TheCountry = Nothing
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



