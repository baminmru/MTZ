VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl VRCAditionalphiz 
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
      Begin VB.ComboBox cmbprnActWork 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   24
         ToolTipText     =   "Печать акта выполненных работ"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtmobTelephone 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   22
         ToolTipText     =   "Мобильный телефон"
         Top             =   6045
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdeMail 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "mailopen.ico"
         ToolTipText     =   "Электронная почта"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txteMail 
         Height          =   300
         Left            =   300
         TabIndex        =   19
         ToolTipText     =   "Электронная почта"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdWEBSite 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "urlopen.ico"
         ToolTipText     =   "WEB узел"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtWEBSite 
         Height          =   300
         Left            =   300
         TabIndex        =   16
         ToolTipText     =   "WEB узел"
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
      Begin VB.TextBox txtphone2 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   12
         ToolTipText     =   "Телефон 2"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txttownphonecode 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   10
         ToolTipText     =   "Телефонный код "
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtdistrict 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   8
         ToolTipText     =   "Район"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdtown 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Город"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txttown 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Город"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdCountry 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страна"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCountry 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Страна"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblprnActWork 
         BackStyle       =   0  'Transparent
         Caption         =   "Печать акта выполненных работ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblmobTelephone 
         BackStyle       =   0  'Transparent
         Caption         =   "Мобильный телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lbleMail 
         BackStyle       =   0  'Transparent
         Caption         =   "Электронная почта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblWEBSite 
         BackStyle       =   0  'Transparent
         Caption         =   "WEB узел:"
         ForeColor       =   &H00FF0000&
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
      Begin VB.Label lblphone2 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефон 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lbltownphonecode 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефонный код :"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lbldistrict 
         BackStyle       =   0  'Transparent
         Caption         =   "Район:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lbltown 
         BackStyle       =   0  'Transparent
         Caption         =   "Город:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCountry 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "VRCAditionalphiz"
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

Private Sub txtCountry_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCountry_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_COUNTRY", ID, brief) Then
          txtCountry.Tag = Left(ID, 38)
          txtCountry = brief
        End If
End Sub
Private Sub cmdCountry_MenuClick(ByVal sCaption As String)
          txtCountry.Tag = ""
          txtCountry = ""
End Sub
Private Sub txttown_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdtown_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_TOWN", ID, brief) Then
          txttown.Tag = Left(ID, 38)
          txttown = brief
        End If
End Sub
Private Sub cmdtown_MenuClick(ByVal sCaption As String)
          txttown.Tag = ""
          txttown = ""
End Sub
Private Sub txtdistrict_Change()
  Changing

End Sub
Private Sub txttownphonecode_Change()
  Changing

End Sub
Private Sub txtphone2_Change()
  Changing

End Sub
Private Sub txtPOSTINDEX_Change()
  Changing

End Sub
Private Sub txtWEBSite_Change()
  Changing

End Sub
Private Sub cmdWEBSite_Click()
  On Error Resume Next
  Dim s As String
  s = s & "http:\\" & txtWEBSite.Text
  OpenDocument 0, s
End Sub
Private Sub txteMail_Change()
  Changing

End Sub
Private Sub cmdeMail_Click()
  On Error Resume Next
  Dim s As String
  s = s & "mailto:" & txteMail.Text
  OpenDocument 0, s
End Sub
Private Sub txtmobTelephone_Change()
  Changing

End Sub
Private Sub cmbprnActWork_Click()
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

If Not Item.Country Is Nothing Then
  txtCountry.Tag = Item.Country.ID
  txtCountry = Item.Country.brief
Else
  txtCountry.Tag = ""
  txtCountry = ""
End If
 LoadBtnPictures cmdCountry, cmdCountry.Tag
  cmdCountry.RemoveAllMenu
  cmdCountry.AddMenu "Очистить"
If Not Item.town Is Nothing Then
  txttown.Tag = Item.town.ID
  txttown = Item.town.brief
Else
  txttown.Tag = ""
  txttown = ""
End If
 LoadBtnPictures cmdtown, cmdtown.Tag
  cmdtown.RemoveAllMenu
  cmdtown.AddMenu "Очистить"
  On Error Resume Next
txtdistrict = Item.district
  On Error Resume Next
txttownphonecode = Item.townphonecode
  On Error Resume Next
txtphone2 = Item.phone2
  On Error Resume Next
txtPOSTINDEX = Item.POSTINDEX
txtWEBSite = Item.WEBSite
 LoadBtnPictures cmdWEBSite, cmdWEBSite.Tag
  cmdWEBSite.RemoveAllMenu
  On Error Resume Next
txteMail = Item.eMail
 LoadBtnPictures cmdeMail, cmdeMail.Tag
  cmdeMail.RemoveAllMenu
  On Error Resume Next
txtmobTelephone = Item.mobTelephone
cmbprnActWork.Clear
cmbprnActWork.AddItem "Да"
cmbprnActWork.ItemData(cmbprnActWork.NewIndex) = -1
cmbprnActWork.AddItem "Нет"
cmbprnActWork.ItemData(cmbprnActWork.NewIndex) = 0
 For iii = 0 To cmbprnActWork.ListCount - 1
  If Item.prnActWork = cmbprnActWork.ItemData(iii) Then
   cmbprnActWork.ListIndex = iii
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

If txtCountry.Tag <> "" Then
  Set Item.Country = Item.Application.FindRowObject("ENTDIC_COUNTRY", txtCountry.Tag)
Else
  Set Item.Country = Nothing
End If
If txttown.Tag <> "" Then
  Set Item.town = Item.Application.FindRowObject("ENTDIC_TOWN", txttown.Tag)
Else
  Set Item.town = Nothing
End If
Item.district = txtdistrict
Item.townphonecode = txttownphonecode
Item.phone2 = txtphone2
Item.POSTINDEX = txtPOSTINDEX
Item.WEBSite = txtWEBSite
Item.eMail = txteMail
Item.mobTelephone = txtmobTelephone
 If cmbprnActWork.ListIndex >= 0 Then
   Item.prnActWork = cmbprnActWork.ItemData(cmbprnActWork.ListIndex)
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



