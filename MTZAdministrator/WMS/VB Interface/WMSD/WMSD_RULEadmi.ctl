VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WMSD_RULEadmi 
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
      Begin VB.ComboBox cmbUseExpDate 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   14
         ToolTipText     =   "Срок годности"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.ComboBox cmbUseBrak 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "Брак"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbKillPlace 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Бойня"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbTheFactory 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Завод"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbTheCountry 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "Страна"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbUseProduct 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "Товар"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblUseExpDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Срок годности:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblUseBrak 
         BackStyle       =   0  'Transparent
         Caption         =   "Брак:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblKillPlace 
         BackStyle       =   0  'Transparent
         Caption         =   "Бойня:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTheFactory 
         BackStyle       =   0  'Transparent
         Caption         =   "Завод:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheCountry 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblUseProduct 
         BackStyle       =   0  'Transparent
         Caption         =   "Товар:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSD_RULEadmi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





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
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtName_Change()
  Changing

End Sub
Private Sub cmbUseProduct_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbTheCountry_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbTheFactory_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbKillPlace_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbUseBrak_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbUseExpDate_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = (cmbUseProduct.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbTheCountry.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbTheFactory.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbKillPlace.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbUseBrak.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbUseExpDate.ListIndex >= 0)
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
txtName = Item.Name
cmbUseProduct.Clear
cmbUseProduct.AddItem "Да"
cmbUseProduct.ItemData(cmbUseProduct.NewIndex) = -1
cmbUseProduct.AddItem "Нет"
cmbUseProduct.ItemData(cmbUseProduct.NewIndex) = 0
 For iii = 0 To cmbUseProduct.ListCount - 1
  If Item.UseProduct = cmbUseProduct.ItemData(iii) Then
   cmbUseProduct.ListIndex = iii
   Exit For
  End If
 Next
cmbTheCountry.Clear
cmbTheCountry.AddItem "Да"
cmbTheCountry.ItemData(cmbTheCountry.NewIndex) = -1
cmbTheCountry.AddItem "Нет"
cmbTheCountry.ItemData(cmbTheCountry.NewIndex) = 0
 For iii = 0 To cmbTheCountry.ListCount - 1
  If Item.TheCountry = cmbTheCountry.ItemData(iii) Then
   cmbTheCountry.ListIndex = iii
   Exit For
  End If
 Next
cmbTheFactory.Clear
cmbTheFactory.AddItem "Да"
cmbTheFactory.ItemData(cmbTheFactory.NewIndex) = -1
cmbTheFactory.AddItem "Нет"
cmbTheFactory.ItemData(cmbTheFactory.NewIndex) = 0
 For iii = 0 To cmbTheFactory.ListCount - 1
  If Item.TheFactory = cmbTheFactory.ItemData(iii) Then
   cmbTheFactory.ListIndex = iii
   Exit For
  End If
 Next
cmbKillPlace.Clear
cmbKillPlace.AddItem "Да"
cmbKillPlace.ItemData(cmbKillPlace.NewIndex) = -1
cmbKillPlace.AddItem "Нет"
cmbKillPlace.ItemData(cmbKillPlace.NewIndex) = 0
 For iii = 0 To cmbKillPlace.ListCount - 1
  If Item.KillPlace = cmbKillPlace.ItemData(iii) Then
   cmbKillPlace.ListIndex = iii
   Exit For
  End If
 Next
cmbUseBrak.Clear
cmbUseBrak.AddItem "Да"
cmbUseBrak.ItemData(cmbUseBrak.NewIndex) = -1
cmbUseBrak.AddItem "Нет"
cmbUseBrak.ItemData(cmbUseBrak.NewIndex) = 0
 For iii = 0 To cmbUseBrak.ListCount - 1
  If Item.UseBrak = cmbUseBrak.ItemData(iii) Then
   cmbUseBrak.ListIndex = iii
   Exit For
  End If
 Next
cmbUseExpDate.Clear
cmbUseExpDate.AddItem "Да"
cmbUseExpDate.ItemData(cmbUseExpDate.NewIndex) = -1
cmbUseExpDate.AddItem "Нет"
cmbUseExpDate.ItemData(cmbUseExpDate.NewIndex) = 0
 For iii = 0 To cmbUseExpDate.ListCount - 1
  If Item.UseExpDate = cmbUseExpDate.ItemData(iii) Then
   cmbUseExpDate.ListIndex = iii
   Exit For
  End If
 Next
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

Item.Name = txtName
 If cmbUseProduct.ListIndex >= 0 Then
   Item.UseProduct = cmbUseProduct.ItemData(cmbUseProduct.ListIndex)
 End If
 If cmbTheCountry.ListIndex >= 0 Then
   Item.TheCountry = cmbTheCountry.ItemData(cmbTheCountry.ListIndex)
 End If
 If cmbTheFactory.ListIndex >= 0 Then
   Item.TheFactory = cmbTheFactory.ItemData(cmbTheFactory.ListIndex)
 End If
 If cmbKillPlace.ListIndex >= 0 Then
   Item.KillPlace = cmbKillPlace.ItemData(cmbKillPlace.ListIndex)
 End If
 If cmbUseBrak.ListIndex >= 0 Then
   Item.UseBrak = cmbUseBrak.ItemData(cmbUseBrak.ListIndex)
 End If
 If cmbUseExpDate.ListIndex >= 0 Then
   Item.UseExpDate = cmbUseExpDate.ItemData(cmbUseExpDate.ListIndex)
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



