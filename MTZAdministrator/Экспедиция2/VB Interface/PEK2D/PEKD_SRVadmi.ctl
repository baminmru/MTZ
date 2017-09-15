VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PEKD_SRVadmi 
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
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   40
         TabIndex        =   16
         ToolTipText     =   "Код1С"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.ComboBox cmbCalcWithNDS 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   14
         ToolTipText     =   "Расчет с НДС"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsObligate 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "Является обязательной"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdGRPDpUsl 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Группа Услуг"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtGRPDpUsl 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Группа Услуг"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdEDIZM 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Единица измерения"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtEDIZM 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Единица измерения"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.ComboBox cmbDependOnWeight 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "Зависит от веса"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtname 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblCode1C 
         BackStyle       =   0  'Transparent
         Caption         =   "Код1С:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblCalcWithNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Расчет с НДС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblIsObligate 
         BackStyle       =   0  'Transparent
         Caption         =   "Является обязательной:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblGRPDpUsl 
         BackStyle       =   0  'Transparent
         Caption         =   "Группа Услуг:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Единица измерения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDependOnWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Зависит от веса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblname 
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
Attribute VB_Name = "PEKD_SRVadmi"
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

Private Sub txtname_Change()
  Changing

End Sub
Private Sub cmbDependOnWeight_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtEDIZM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdEDIZM_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_EDIZM", ID, brief) Then
          txtEDIZM.Tag = Left(ID, 38)
          txtEDIZM = brief
        End If
End Sub
Private Sub cmdEDIZM_MenuClick(ByVal sCaption As String)
          txtEDIZM.Tag = ""
          txtEDIZM = ""
End Sub
Private Sub txtGRPDpUsl_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdGRPDpUsl_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_GRPDpUSL", ID, brief) Then
          txtGRPDpUsl.Tag = Left(ID, 38)
          txtGRPDpUsl = brief
        End If
End Sub
Private Sub cmdGRPDpUsl_MenuClick(ByVal sCaption As String)
          txtGRPDpUsl.Tag = ""
          txtGRPDpUsl = ""
End Sub
Private Sub cmbIsObligate_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbCalcWithNDS_Click()
  On Error Resume Next
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

If mIsOK Then mIsOK = IsSet(txtname.Text)
If mIsOK Then mIsOK = (cmbIsObligate.ListIndex >= 0)
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
txtname = Item.Name
cmbDependOnWeight.Clear
cmbDependOnWeight.AddItem "Да"
cmbDependOnWeight.ItemData(cmbDependOnWeight.NewIndex) = -1
cmbDependOnWeight.AddItem "Нет"
cmbDependOnWeight.ItemData(cmbDependOnWeight.NewIndex) = 0
 For iii = 0 To cmbDependOnWeight.ListCount - 1
  If Item.DependOnWeight = cmbDependOnWeight.ItemData(iii) Then
   cmbDependOnWeight.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.EDIZM Is Nothing Then
  txtEDIZM.Tag = Item.EDIZM.ID
  txtEDIZM = Item.EDIZM.brief
Else
  txtEDIZM.Tag = ""
  txtEDIZM = ""
End If
 LoadBtnPictures cmdEDIZM, cmdEDIZM.Tag
  cmdEDIZM.RemoveAllMenu
  cmdEDIZM.AddMenu "Очистить"
If Not Item.GRPDpUsl Is Nothing Then
  txtGRPDpUsl.Tag = Item.GRPDpUsl.ID
  txtGRPDpUsl = Item.GRPDpUsl.brief
Else
  txtGRPDpUsl.Tag = ""
  txtGRPDpUsl = ""
End If
 LoadBtnPictures cmdGRPDpUsl, cmdGRPDpUsl.Tag
  cmdGRPDpUsl.RemoveAllMenu
  cmdGRPDpUsl.AddMenu "Очистить"
cmbIsObligate.Clear
cmbIsObligate.AddItem "Да"
cmbIsObligate.ItemData(cmbIsObligate.NewIndex) = -1
cmbIsObligate.AddItem "Нет"
cmbIsObligate.ItemData(cmbIsObligate.NewIndex) = 0
 For iii = 0 To cmbIsObligate.ListCount - 1
  If Item.IsObligate = cmbIsObligate.ItemData(iii) Then
   cmbIsObligate.ListIndex = iii
   Exit For
  End If
 Next
cmbCalcWithNDS.Clear
cmbCalcWithNDS.AddItem "Да"
cmbCalcWithNDS.ItemData(cmbCalcWithNDS.NewIndex) = -1
cmbCalcWithNDS.AddItem "Нет"
cmbCalcWithNDS.ItemData(cmbCalcWithNDS.NewIndex) = 0
 For iii = 0 To cmbCalcWithNDS.ListCount - 1
  If Item.CalcWithNDS = cmbCalcWithNDS.ItemData(iii) Then
   cmbCalcWithNDS.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtCode1C = Item.Code1C
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

Item.Name = txtname
 If cmbDependOnWeight.ListIndex >= 0 Then
   Item.DependOnWeight = cmbDependOnWeight.ItemData(cmbDependOnWeight.ListIndex)
 End If
If txtEDIZM.Tag <> "" Then
  Set Item.EDIZM = Item.Application.FindRowObject("ENTDIC_EDIZM", txtEDIZM.Tag)
Else
  Set Item.EDIZM = Nothing
End If
If txtGRPDpUsl.Tag <> "" Then
  Set Item.GRPDpUsl = Item.Application.FindRowObject("PEKD_GRPDpUSL", txtGRPDpUsl.Tag)
Else
  Set Item.GRPDpUsl = Nothing
End If
 If cmbIsObligate.ListIndex >= 0 Then
   Item.IsObligate = cmbIsObligate.ItemData(cmbIsObligate.ListIndex)
 End If
 If cmbCalcWithNDS.ListIndex >= 0 Then
   Item.CalcWithNDS = cmbCalcWithNDS.ItemData(cmbCalcWithNDS.ListIndex)
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



