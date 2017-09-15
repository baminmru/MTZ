VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl VRCPCommon 
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
      Begin VB.TextBox txtAddress 
         Height          =   1200
         Left            =   6600
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   37
         ToolTipText     =   "Адрес"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtPassportInfo 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   35
         ToolTipText     =   "Паспортные данные"
         Top             =   6240
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpActionEnd 
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         ToolTipText     =   "Конец действия доверенности"
         Top             =   5535
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71434243
         CurrentDate     =   39500
      End
      Begin MSComCtl2.DTPicker dtpActionStart 
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         ToolTipText     =   "Начало действия доверености"
         Top             =   4830
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71434243
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtActionReason 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   29
         ToolTipText     =   "Действует на основании"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.ComboBox cmbPersonDeYuro 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   27
         ToolTipText     =   "Официальный представитель"
         Top             =   3420
         Width           =   3000
      End
      Begin VB.TextBox txtmobile 
         Height          =   300
         Left            =   3450
         MaxLength       =   30
         TabIndex        =   25
         ToolTipText     =   "Мобильный телефон"
         Top             =   2715
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCurator 
         Height          =   300
         Left            =   6000
         TabIndex        =   23
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ответственный"
         Top             =   2010
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCurator 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   22
         ToolTipText     =   "Ответственный"
         Top             =   2010
         Width           =   2550
      End
      Begin VB.TextBox txtthe_Comment 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   20
         ToolTipText     =   "Примечания"
         Top             =   405
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdLoyality 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "Лояльность"
         Top             =   6240
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtLoyality 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "Лояльность"
         Top             =   6240
         Width           =   2550
      End
      Begin VB.TextBox txtfax 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   15
         ToolTipText     =   "Факс"
         Top             =   5535
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdemail 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "mailopen.ico"
         ToolTipText     =   "e-mail"
         Top             =   4830
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtemail 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "e-mail"
         Top             =   4830
         Width           =   2550
      End
      Begin VB.TextBox txtphone 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   10
         ToolTipText     =   "Телефон"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.TextBox txtPrivelegie 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   8
         ToolTipText     =   "Звание"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtSurName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "Отчество"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Имя"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFamily 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Фамилия"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblAddress 
         BackStyle       =   0  'Transparent
         Caption         =   "Адрес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   36
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblPassportInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Паспортные данные:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblActionEnd 
         BackStyle       =   0  'Transparent
         Caption         =   "Конец действия доверенности:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblActionStart 
         BackStyle       =   0  'Transparent
         Caption         =   "Начало действия доверености:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblActionReason 
         BackStyle       =   0  'Transparent
         Caption         =   "Действует на основании:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblPersonDeYuro 
         BackStyle       =   0  'Transparent
         Caption         =   "Официальный представитель:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblmobile 
         BackStyle       =   0  'Transparent
         Caption         =   "Мобильный телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   2385
         Width           =   3000
      End
      Begin VB.Label lblCurator 
         BackStyle       =   0  'Transparent
         Caption         =   "Ответственный:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   1680
         Width           =   3000
      End
      Begin VB.Label lblthe_Comment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечания:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblLoyality 
         BackStyle       =   0  'Transparent
         Caption         =   "Лояльность:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblfax 
         BackStyle       =   0  'Transparent
         Caption         =   "Факс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblemail 
         BackStyle       =   0  'Transparent
         Caption         =   "e-mail:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblphone 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblPrivelegie 
         BackStyle       =   0  'Transparent
         Caption         =   "Звание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSurName 
         BackStyle       =   0  'Transparent
         Caption         =   "Отчество:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFamily 
         BackStyle       =   0  'Transparent
         Caption         =   "Фамилия:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "VRCPCommon"
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

Private Sub txtFamily_Change()
  Changing

End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtSurName_Change()
  Changing

End Sub
Private Sub txtPrivelegie_Change()
  Changing

End Sub
Private Sub txtphone_Change()
  Changing

End Sub
Private Sub txtemail_Change()
  Changing

End Sub
Private Sub cmdemail_Click()
  On Error Resume Next
  Dim s As String
  s = s & "mailto:" & txtemail.Text
  OpenDocument 0, s
End Sub
Private Sub txtfax_Change()
  Changing

End Sub
Private Sub txtLoyality_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdLoyality_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("VRDLoyalty", ID, brief) Then
          txtLoyality.Tag = Left(ID, 38)
          txtLoyality = brief
        End If
End Sub
Private Sub cmdLoyality_MenuClick(ByVal sCaption As String)
          txtLoyality.Tag = ""
          txtLoyality = ""
End Sub
Private Sub txtthe_Comment_Change()
  Changing

End Sub
Private Sub txtCurator_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCurator_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", ID, brief) Then
          txtCurator.Tag = Left(ID, 38)
          txtCurator = brief
        End If
End Sub
Private Sub cmdCurator_MenuClick(ByVal sCaption As String)
          txtCurator.Tag = ""
          txtCurator = ""
End Sub
Private Sub txtmobile_Change()
  Changing

End Sub
Private Sub cmbPersonDeYuro_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtActionReason_Change()
  Changing

End Sub
Private Sub dtpActionStart_Change()
  Changing

End Sub
Private Sub dtpActionEnd_Change()
  Changing

End Sub
Private Sub txtPassportInfo_Change()
  Changing

End Sub
Private Sub txtAddress_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtFamily.Text)
If mIsOK Then mIsOK = IsSet(txtName.Text)
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
txtFamily = Item.Family
  On Error Resume Next
txtName = Item.Name
  On Error Resume Next
txtSurName = Item.SurName
txtPrivelegie = Item.Privelegie
  On Error Resume Next
txtphone = Item.phone
  On Error Resume Next
txtemail = Item.email
 LoadBtnPictures cmdemail, cmdemail.Tag
  cmdemail.RemoveAllMenu
  On Error Resume Next
txtfax = Item.fax
If Not Item.Loyality Is Nothing Then
  txtLoyality.Tag = Item.Loyality.ID
  txtLoyality = Item.Loyality.brief
Else
  txtLoyality.Tag = ""
  txtLoyality = ""
End If
 LoadBtnPictures cmdLoyality, cmdLoyality.Tag
  cmdLoyality.RemoveAllMenu
  cmdLoyality.AddMenu "Очистить"
txtthe_Comment = Item.the_Comment
If Not Item.Curator Is Nothing Then
  txtCurator.Tag = Item.Curator.ID
  txtCurator = Item.Curator.brief
Else
  txtCurator.Tag = ""
  txtCurator = ""
End If
 LoadBtnPictures cmdCurator, cmdCurator.Tag
  cmdCurator.RemoveAllMenu
  cmdCurator.AddMenu "Очистить"
  On Error Resume Next
txtmobile = Item.mobile
cmbPersonDeYuro.Clear
cmbPersonDeYuro.AddItem "Да"
cmbPersonDeYuro.ItemData(cmbPersonDeYuro.NewIndex) = -1
cmbPersonDeYuro.AddItem "Нет"
cmbPersonDeYuro.ItemData(cmbPersonDeYuro.NewIndex) = 0
 For iii = 0 To cmbPersonDeYuro.ListCount - 1
  If Item.PersonDeYuro = cmbPersonDeYuro.ItemData(iii) Then
   cmbPersonDeYuro.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtActionReason = Item.ActionReason
dtpActionStart = Date
If Item.ActionStart <> 0 Then
 dtpActionStart = Item.ActionStart
Else
 dtpActionStart.Value = Null
End If
dtpActionEnd = Date
If Item.ActionEnd <> 0 Then
 dtpActionEnd = Item.ActionEnd
Else
 dtpActionEnd.Value = Null
End If
txtPassportInfo = Item.PassportInfo
txtAddress = Item.Address
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

Item.Family = txtFamily
Item.Name = txtName
Item.SurName = txtSurName
Item.Privelegie = txtPrivelegie
Item.phone = txtphone
Item.email = txtemail
Item.fax = txtfax
If txtLoyality.Tag <> "" Then
  Set Item.Loyality = Item.Application.FindRowObject("VRDLoyalty", txtLoyality.Tag)
Else
  Set Item.Loyality = Nothing
End If
Item.the_Comment = txtthe_Comment
If txtCurator.Tag <> "" Then
  Set Item.Curator = Item.Application.FindRowObject("Users", txtCurator.Tag)
Else
  Set Item.Curator = Nothing
End If
Item.mobile = txtmobile
 If cmbPersonDeYuro.ListIndex >= 0 Then
   Item.PersonDeYuro = cmbPersonDeYuro.ItemData(cmbPersonDeYuro.ListIndex)
 End If
Item.ActionReason = txtActionReason
  If IsNull(dtpActionStart) Then
    Item.ActionStart = 0
  Else
    Item.ActionStart = dtpActionStart.Value
  End If
  If IsNull(dtpActionEnd) Then
    Item.ActionEnd = 0
  Else
    Item.ActionEnd = dtpActionEnd.Value
  End If
Item.PassportInfo = txtPassportInfo
Item.Address = txtAddress
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



