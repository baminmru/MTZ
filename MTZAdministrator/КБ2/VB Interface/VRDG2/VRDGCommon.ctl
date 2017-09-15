VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl VRDGCommon 
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
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   40
         TabIndex        =   22
         ToolTipText     =   "���1�"
         Top             =   1110
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEndDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         ToolTipText     =   "��������� �������� ��������"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71696387
         CurrentDate     =   39500
      End
      Begin MSComCtl2.DTPicker dtpStartDate 
         Height          =   300
         Left            =   300
         TabIndex        =   18
         ToolTipText     =   "������ ��������"
         Top             =   6240
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71696387
         CurrentDate     =   39500
      End
      Begin VB.ComboBox cmbPZDog 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   16
         ToolTipText     =   "������� � ������� ������"
         Top             =   5535
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdClient 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "����������"
         Top             =   4830
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtClient 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "����������"
         Top             =   4830
         Width           =   2550
      End
      Begin VB.TextBox txtInfo 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   11
         ToolTipText     =   "����������"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCurator 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "�������������"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCurator 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "�������������"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "��������"
         Top             =   1815
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDogDate 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "���� ��������"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71696387
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtDogNum 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "����� ��������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblCode1C 
         BackStyle       =   0  'Transparent
         Caption         =   "���1�:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblEndDate 
         BackStyle       =   0  'Transparent
         Caption         =   "��������� �������� ��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblStartDate 
         BackStyle       =   0  'Transparent
         Caption         =   "������ ��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblPZDog 
         BackStyle       =   0  'Transparent
         Caption         =   "������� � ������� ������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblClient 
         BackStyle       =   0  'Transparent
         Caption         =   "����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCurator 
         BackStyle       =   0  'Transparent
         Caption         =   "�������������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDogDate 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ��������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDogNum 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ��������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "VRDGCommon"
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

Private Sub txtDogNum_Change()
  Changing

End Sub
Private Sub dtpDogDate_Change()
  Changing

End Sub
Private Sub txtName_Change()
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
Private Sub txtInfo_Change()
  Changing

End Sub
Private Sub txtClient_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdClient_CLick()
  On Error Resume Next
     If txtClient.Tag = "" Then
       cmdClient_MenuClick "�������"
     Else
       cmdClient_MenuClick "�������"
     End If
End Sub
Private Sub cmdClient_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "��������" Then
          txtClient.Tag = ""
          txtClient = ""
  End If
  If sCaption = "�������" Then
    If txtClient.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtClient.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtClient.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "�������" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2")
        If OK Then
          txtClient.Tag = Left(ID, 38)
          txtClient = brief
        End If
  End If
  If sCaption = "�������" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRC2" & Now
        ook = findObject(Item.Application.Manager, "VRC2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtClient.Tag = ID
              txtClient = brief
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
              txtClient.Tag = obj.ID
              txtClient = obj.brief
          Else
              txtClient.Tag = ""
              txtClient = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub cmbPZDog_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub dtpStartDate_Change()
  Changing

End Sub
Private Sub dtpEndDate_Change()
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

If mIsOK Then mIsOK = IsSet(txtDogNum.Text)
If mIsOK Then mIsOK = IsSet(dtpDogDate.Value)
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
txtDogNum = Item.DogNum
dtpDogDate = Date
If Item.DogDate <> 0 Then
 dtpDogDate = Item.DogDate
End If
  On Error Resume Next
txtName = Item.Name
If Not Item.Curator Is Nothing Then
  txtCurator.Tag = Item.Curator.ID
  txtCurator = Item.Curator.brief
Else
  txtCurator.Tag = ""
  txtCurator = ""
End If
 LoadBtnPictures cmdCurator, cmdCurator.Tag
  cmdCurator.RemoveAllMenu
  cmdCurator.AddMenu "��������"
txtInfo = Item.Info
If Not Item.Client Is Nothing Then
  txtClient.Tag = Item.Client.ID
  txtClient = Item.Client.brief
Else
  txtClient.Tag = ""
  txtClient = ""
End If
 LoadBtnPictures cmdClient, cmdClient.Tag
  cmdClient.RemoveAllMenu
  cmdClient.AddMenu "��������"
  cmdClient.AddMenu "�������"
  cmdClient.AddMenu "�������"
  cmdClient.AddMenu "�������"
cmbPZDog.Clear
cmbPZDog.AddItem "��"
cmbPZDog.ItemData(cmbPZDog.NewIndex) = -1
cmbPZDog.AddItem "���"
cmbPZDog.ItemData(cmbPZDog.NewIndex) = 0
 For iii = 0 To cmbPZDog.ListCount - 1
  If Item.PZDog = cmbPZDog.ItemData(iii) Then
   cmbPZDog.ListIndex = iii
   Exit For
  End If
 Next
dtpStartDate = Date
If Item.StartDate <> 0 Then
 dtpStartDate = Item.StartDate
Else
 dtpStartDate.Value = Null
End If
dtpEndDate = Date
If Item.EndDate <> 0 Then
 dtpEndDate = Item.EndDate
Else
 dtpEndDate.Value = Null
End If
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

Item.DogNum = txtDogNum
  If IsNull(dtpDogDate) Then
    Item.DogDate = 0
  Else
    Item.DogDate = dtpDogDate.Value
  End If
Item.Name = txtName
If txtCurator.Tag <> "" Then
  Set Item.Curator = Item.Application.FindRowObject("Users", txtCurator.Tag)
Else
  Set Item.Curator = Nothing
End If
Item.Info = txtInfo
If txtClient.Tag <> "" Then
  Set Item.Client = Item.Application.Manager.GetInstanceObject(txtClient.Tag)
Else
  Set Item.Client = Nothing
End If
 If cmbPZDog.ListIndex >= 0 Then
   Item.PZDog = cmbPZDog.ItemData(cmbPZDog.ListIndex)
 End If
  If IsNull(dtpStartDate) Then
    Item.StartDate = 0
  Else
    Item.StartDate = dtpStartDate.Value
  End If
  If IsNull(dtpEndDate) Then
    Item.EndDate = 0
  Else
    Item.EndDate = dtpEndDate.Value
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



