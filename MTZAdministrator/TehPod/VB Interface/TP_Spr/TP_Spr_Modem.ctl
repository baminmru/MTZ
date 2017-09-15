VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl TP_Spr_Modem 
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
      Begin VB.TextBox txtZena_s_NDS 
         Height          =   300
         Left            =   300
         MaxLength       =   100
         TabIndex        =   11
         ToolTipText     =   "Цена с НДС"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtNDS 
         Height          =   300
         Left            =   300
         MaxLength       =   100
         TabIndex        =   9
         ToolTipText     =   "НДС"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtZena 
         Height          =   300
         Left            =   300
         MaxLength       =   100
         TabIndex        =   7
         ToolTipText     =   "Цена"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTip 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип модема ADSL"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTip 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Тип модема ADSL"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtSerNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Серийный номер"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblZena_s_NDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Цена с НДС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "НДС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblZena 
         BackStyle       =   0  'Transparent
         Caption         =   "Цена:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTip 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип модема ADSL:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSerNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Серийный номер:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "TP_Spr_Modem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True


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

Private Sub txtSerNumber_Change()
  Changing

End Sub
Private Sub txtTip_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTip_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_TipModADSL", ID, brief) Then
          txtTip.Tag = Left(ID, 38)
          txtTip = brief
        End If
End Sub
Private Sub cmdTip_MenuClick(ByVal sCaption As String)
          txtTip.Tag = ""
          txtTip = ""
End Sub
Private Sub txtZena_Change()
  Changing

End Sub
Private Sub txtNDS_Change()
  Changing

End Sub
Private Sub txtZena_s_NDS_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtSerNumber.Text)
If mIsOK Then mIsOK = txtTip.Tag <> ""
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
txtSerNumber = Item.SerNumber
If Not Item.Tip Is Nothing Then
  txtTip.Tag = Item.Tip.ID
  txtTip = Item.Tip.brief
Else
  txtTip.Tag = ""
  txtTip = ""
End If
 LoadBtnPictures cmdTip, cmdTip.Tag
  cmdTip.RemoveAllMenu
  cmdTip.AddMenu "Очистить"
  On Error Resume Next
txtZena = Item.Zena
  On Error Resume Next
txtNDS = Item.NDS
  On Error Resume Next
txtZena_s_NDS = Item.Zena_s_NDS
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

Item.SerNumber = txtSerNumber
If txtTip.Tag <> "" Then
  Set Item.Tip = Item.Application.FindRowObject("TP_Spr_TipModADSL", txtTip.Tag)
Else
  Set Item.Tip = Nothing
End If
Item.Zena = txtZena
Item.NDS = txtNDS
Item.Zena_s_NDS = txtZena_s_NDS
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



