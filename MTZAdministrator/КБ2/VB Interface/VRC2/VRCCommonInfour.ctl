VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl VRCCommonInfour 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   3285
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4005
      _ExtentX        =   7064
      _ExtentY        =   5794
      Begin VB.TextBox txtCode1C 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   40
         TabIndex        =   31
         ToolTipText     =   "Код1С"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.ComboBox cmbMarkToDelete 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   29
         ToolTipText     =   "Помечен на удаление"
         Top             =   4125
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCurator 
         Height          =   300
         Left            =   6000
         TabIndex        =   27
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ответственный"
         Top             =   3420
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCurator 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   26
         ToolTipText     =   "Ответственный"
         Top             =   3420
         Width           =   2550
      End
      Begin VB.TextBox txtthe_Comment 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   24
         ToolTipText     =   "Примечание"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbTransporter 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   22
         ToolTipText     =   "Поставщик тр. услуг"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtAddress 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   20
         ToolTipText     =   "Почтовый адрес"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtfax 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   18
         ToolTipText     =   "Факс"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.TextBox txtPhone 
         Height          =   300
         Left            =   300
         MaxLength       =   25
         TabIndex        =   16
         ToolTipText     =   "Телефон"
         Top             =   5535
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCompInfo 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "Информация о компании"
         Top             =   4830
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCompInfo 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "Информация о компании"
         Top             =   4830
         Width           =   2550
      End
      Begin VB.TextBox txtfullname 
         Enabled         =   0   'False
         Height          =   1200
         Left            =   300
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   11
         ToolTipText     =   "Полное наименование"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtKPP 
         Height          =   300
         Left            =   300
         MaxLength       =   9
         TabIndex        =   9
         ToolTipText     =   "КПП"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtINN 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   7
         ToolTipText     =   "ИНН"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdOPF 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "ОПФ"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOPF 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "ОПФ"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblCode1C 
         BackStyle       =   0  'Transparent
         Caption         =   "Код1С:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblMarkToDelete 
         BackStyle       =   0  'Transparent
         Caption         =   "Помечен на удаление:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblCurator 
         BackStyle       =   0  'Transparent
         Caption         =   "Ответственный:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblthe_Comment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTransporter 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик тр. услуг:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblAddress 
         BackStyle       =   0  'Transparent
         Caption         =   "Почтовый адрес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblfax 
         BackStyle       =   0  'Transparent
         Caption         =   "Факс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblPhone 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblCompInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Информация о компании:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblfullname 
         BackStyle       =   0  'Transparent
         Caption         =   "Полное наименование:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblKPP 
         BackStyle       =   0  'Transparent
         Caption         =   "КПП:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblINN 
         BackStyle       =   0  'Transparent
         Caption         =   "ИНН:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblOPF 
         BackStyle       =   0  'Transparent
         Caption         =   "ОПФ:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "VRCCommonInfour"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public item As Object
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

Private Sub txtINN_Validate(Cancel As Boolean)
    If txtINN <> "" Then
        If Not IsNumeric(txtINN) Then
            MsgBox "Недопустимые символы в ИНН"
            Cancel = True
        End If
        If Len(txtINN) < 10 Then
            MsgBox "Неверно задан ИНН"
            Cancel = True
        End If
    End If
End Sub


Private Sub txtKPP_Validate(Cancel As Boolean)
    If txtKPP <> "" Then
        If Not IsNumeric(txtKPP) Then
            MsgBox "Недопустимые символы в КПП"
            Cancel = True
        End If
        If Len(txtKPP) < 9 Then
            MsgBox "Неверно задан KPP"
            Cancel = True
        End If
    End If
End Sub
Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtOPF_Change()
  If Not (OnInit) Then
  Changing
If Not OnInit Then
   txtName = Replace(txtName, """", "")

   If txtOPF <> "" Then
     txtfullname = Replace(txtOPF, ";", "") & " " & txtName
   Else
     txtfullname = txtName
    End If
End If
  End If
End Sub
Private Sub cmdOPF_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If item.Application.Manager.GetReferenceDialogEx2("ENTDIC_OPF", ID, brief) Then
          txtOPF.Tag = Left(ID, 38)
          txtOPF = brief
        End If
End Sub
Private Sub cmdOPF_MenuClick(ByVal sCaption As String)
          txtOPF.Tag = ""
          txtOPF = ""
End Sub
Private Sub txtName_Change()
  Changing
If Not OnInit Then
   txtName = Replace(txtName, """", "")

   If txtOPF <> "" Then
     txtfullname = Replace(txtOPF, ";", "") & " " & txtName
   Else
     txtfullname = txtName
    End If
End If
End Sub
Private Sub txtINN_Change()
  Changing

End Sub
Private Sub txtKPP_Change()
  Changing

End Sub
Private Sub txtfullname_Change()
  Changing

End Sub
Private Sub txtCompInfo_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCompInfo_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If item.Application.Manager.GetReferenceDialogEx2("VRD_CompInfo", ID, brief) Then
          txtCompInfo.Tag = Left(ID, 38)
          txtCompInfo = brief
        End If
End Sub
Private Sub cmdCompInfo_MenuClick(ByVal sCaption As String)
          txtCompInfo.Tag = ""
          txtCompInfo = ""
End Sub
Private Sub txtPhone_Change()
  Changing

End Sub
Private Sub txtfax_Change()
  Changing

End Sub
Private Sub txtAddress_Change()
  Changing

End Sub
Private Sub cmbTransporter_Click()
  On Error Resume Next
  Changing

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
        If item.Application.Manager.GetReferenceDialogEx2("Users", ID, brief) Then
          txtCurator.Tag = Left(ID, 38)
          txtCurator = brief
        End If
End Sub
Private Sub cmdCurator_MenuClick(ByVal sCaption As String)
          txtCurator.Tag = ""
          txtCurator = ""
End Sub
Private Sub cmbMarkToDelete_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCode1C_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True
  If txtKPP.Text <> "" And txtINN.Text = "" Then
    MsgBox "КПП может быть задан только вместе с ИНН"
   mIsOK = False
  End If

If mIsOK Then mIsOK = txtOPF.Tag <> ""
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
  For Each Node In XMLDocFrom.childNodes.item(0).childNodes
    If (Node.baseName = "ID") Then
      ID = Node.Text
      Dim NodeTO As MSXML2.IXMLDOMNode
      Dim bAdded As Boolean
      bAdded = False
      For Each NodeTO In XMLDocTo.childNodes.item(0).childNodes
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
       Call XMLDocTo.childNodes.item(0).appendChild(newNode)
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
If item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

If Not item.opf Is Nothing Then
  txtOPF.Tag = item.opf.ID
  txtOPF = item.opf.brief
Else
  txtOPF.Tag = ""
  txtOPF = ""
End If
 LoadBtnPictures cmdOPF, cmdOPF.Tag
  cmdOPF.RemoveAllMenu
  cmdOPF.AddMenu "Очистить"
  On Error Resume Next
txtName = item.Name
  On Error Resume Next
txtINN = item.INN
  On Error Resume Next
txtKPP = item.KPP
txtfullname = item.FullName
If Not item.CompInfo Is Nothing Then
  txtCompInfo.Tag = item.CompInfo.ID
  txtCompInfo = item.CompInfo.brief
Else
  txtCompInfo.Tag = ""
  txtCompInfo = ""
End If
 LoadBtnPictures cmdCompInfo, cmdCompInfo.Tag
  cmdCompInfo.RemoveAllMenu
  cmdCompInfo.AddMenu "Очистить"
  On Error Resume Next
txtPhone = item.Phone
  On Error Resume Next
txtfax = item.fax
  On Error Resume Next
txtAddress = item.Address
cmbTransporter.Clear
cmbTransporter.AddItem "Да"
cmbTransporter.ItemData(cmbTransporter.NewIndex) = -1
cmbTransporter.AddItem "Нет"
cmbTransporter.ItemData(cmbTransporter.NewIndex) = 0
 For iii = 0 To cmbTransporter.ListCount - 1
  If item.Transporter = cmbTransporter.ItemData(iii) Then
   cmbTransporter.ListIndex = iii
   Exit For
  End If
 Next
txtthe_Comment = item.the_Comment
If Not item.Curator Is Nothing Then
  txtCurator.Tag = item.Curator.ID
  txtCurator = item.Curator.brief
Else
  txtCurator.Tag = ""
  txtCurator = ""
End If
 LoadBtnPictures cmdCurator, cmdCurator.Tag
  cmdCurator.RemoveAllMenu
  cmdCurator.AddMenu "Очистить"
cmbMarkToDelete.Clear
cmbMarkToDelete.AddItem "Да"
cmbMarkToDelete.ItemData(cmbMarkToDelete.NewIndex) = -1
cmbMarkToDelete.AddItem "Нет"
cmbMarkToDelete.ItemData(cmbMarkToDelete.NewIndex) = 0
 For iii = 0 To cmbMarkToDelete.ListCount - 1
  If item.MarkToDelete = cmbMarkToDelete.ItemData(iii) Then
   cmbMarkToDelete.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtCode1C = item.Code1C
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

If txtOPF.Tag <> "" Then
  Set item.opf = item.Application.FindRowObject("ENTDIC_OPF", txtOPF.Tag)
Else
  Set item.opf = Nothing
End If
item.Name = txtName
item.INN = txtINN
item.KPP = txtKPP
If txtCompInfo.Tag <> "" Then
  Set item.CompInfo = item.Application.FindRowObject("VRD_CompInfo", txtCompInfo.Tag)
Else
  Set item.CompInfo = Nothing
End If
item.Phone = txtPhone
item.fax = txtfax
item.Address = txtAddress
 If cmbTransporter.ListIndex >= 0 Then
   item.Transporter = cmbTransporter.ItemData(cmbTransporter.ListIndex)
 End If
item.the_Comment = txtthe_Comment
If txtCurator.Tag <> "" Then
  Set item.Curator = item.Application.FindRowObject("Users", txtCurator.Tag)
Else
  Set item.Curator = Nothing
End If
 mIsChanged = False
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(X As Single, Y As Single)
   Panel.OptimalSize X, Y
   X = X + Panel.Left
   Y = Y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim X As Single, Y As Single
   Panel.OptimalSize X, Y
   OptimalY = Y
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



