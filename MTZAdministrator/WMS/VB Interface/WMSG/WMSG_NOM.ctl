VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WMSG_NOM 
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
      Begin VB.TextBox txtSupCode 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   22
         ToolTipText     =   "Код поклажедателя"
         Top             =   6045
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdSupplier 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поклажедатель"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSupplier 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Поклажедатель"
         Top             =   5340
         Width           =   2550
      End
      Begin VB.TextBox txtTheComment 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   17
         ToolTipText     =   "Комментарии"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtTheDefenition 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   15
         ToolTipText     =   "Описание"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheType 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Тип"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheCategory 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Категория"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCategory 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Категория"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheClass 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Класс"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheClass 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Класс"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.TextBox txtTheNumberDop 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Дополнительный № товара"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "№ товара"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblSupCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Код поклажедателя:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поклажедатель:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Комментарии:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheDefenition 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTheCategory 
         BackStyle       =   0  'Transparent
         Caption         =   "Категория:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheClass 
         BackStyle       =   0  'Transparent
         Caption         =   "Класс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheNumberDop 
         BackStyle       =   0  'Transparent
         Caption         =   "Дополнительный № товара:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "№ товара:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSG_NOM"
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

Private Sub txtTheNumber_Change()
  Changing

End Sub
Private Sub txtTheNumberDop_Change()
  Changing

End Sub
Private Sub txtTheClass_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheClass_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSG_CLASS", ID, brief) Then
          txtTheClass.Tag = Left(ID, 38)
          txtTheClass = brief
        End If
End Sub
Private Sub cmdTheClass_MenuClick(ByVal sCaption As String)
          txtTheClass.Tag = ""
          txtTheClass = ""
End Sub
Private Sub txtTheCategory_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCategory_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSG_CAT", ID, brief) Then
          txtTheCategory.Tag = Left(ID, 38)
          txtTheCategory = brief
        End If
End Sub
Private Sub cmdTheCategory_MenuClick(ByVal sCaption As String)
          txtTheCategory.Tag = ""
          txtTheCategory = ""
End Sub
Private Sub txtTheType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSG_TYPE", ID, brief) Then
          txtTheType.Tag = Left(ID, 38)
          txtTheType = brief
        End If
End Sub
Private Sub cmdTheType_MenuClick(ByVal sCaption As String)
          txtTheType.Tag = ""
          txtTheType = ""
End Sub
Private Sub txtTheDefenition_Change()
  Changing

End Sub
Private Sub txtTheComment_Change()
  Changing

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
Private Sub txtSupCode_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtTheNumber.Text)
If mIsOK Then mIsOK = txtSupplier.Tag <> ""
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
txtTheNumber = Item.TheNumber
  On Error Resume Next
txtTheNumberDop = Item.TheNumberDop
If Not Item.TheClass Is Nothing Then
  txtTheClass.Tag = Item.TheClass.ID
  txtTheClass = Item.TheClass.brief
Else
  txtTheClass.Tag = ""
  txtTheClass = ""
End If
 LoadBtnPictures cmdTheClass, cmdTheClass.Tag
  cmdTheClass.RemoveAllMenu
  cmdTheClass.AddMenu "Очистить"
If Not Item.TheCategory Is Nothing Then
  txtTheCategory.Tag = Item.TheCategory.ID
  txtTheCategory = Item.TheCategory.brief
Else
  txtTheCategory.Tag = ""
  txtTheCategory = ""
End If
 LoadBtnPictures cmdTheCategory, cmdTheCategory.Tag
  cmdTheCategory.RemoveAllMenu
  cmdTheCategory.AddMenu "Очистить"
If Not Item.TheType Is Nothing Then
  txtTheType.Tag = Item.TheType.ID
  txtTheType = Item.TheType.brief
Else
  txtTheType.Tag = ""
  txtTheType = ""
End If
 LoadBtnPictures cmdTheType, cmdTheType.Tag
  cmdTheType.RemoveAllMenu
  cmdTheType.AddMenu "Очистить"
  On Error Resume Next
txtTheDefenition = Item.TheDefenition
  On Error Resume Next
txtTheComment = Item.TheComment
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
  On Error Resume Next
txtSupCode = Item.SupCode
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

Item.TheNumber = txtTheNumber
Item.TheNumberDop = txtTheNumberDop
If txtTheClass.Tag <> "" Then
  Set Item.TheClass = Item.Application.FindRowObject("WMSG_CLASS", txtTheClass.Tag)
Else
  Set Item.TheClass = Nothing
End If
If txtTheCategory.Tag <> "" Then
  Set Item.TheCategory = Item.Application.FindRowObject("WMSG_CAT", txtTheCategory.Tag)
Else
  Set Item.TheCategory = Nothing
End If
If txtTheType.Tag <> "" Then
  Set Item.TheType = Item.Application.FindRowObject("WMSG_TYPE", txtTheType.Tag)
Else
  Set Item.TheType = Nothing
End If
Item.TheDefenition = txtTheDefenition
Item.TheComment = txtTheComment
If txtSupplier.Tag <> "" Then
  Set Item.Supplier = Item.Application.FindRowObject("WMSK_DEF", txtSupplier.Tag)
Else
  Set Item.Supplier = Nothing
End If
Item.SupCode = txtSupCode
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



