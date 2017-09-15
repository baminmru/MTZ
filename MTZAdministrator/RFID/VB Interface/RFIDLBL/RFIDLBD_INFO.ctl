VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl RFIDLBD_INFO 
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
      Begin VB.TextBox txtGateCameraNum 
         Height          =   300
         Left            =   300
         MaxLength       =   60
         TabIndex        =   13
         ToolTipText     =   "Номер камеры для ворот"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtTheGate 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   11
         ToolTipText     =   "Ворота"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtTheCell 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   9
         ToolTipText     =   "Ячейка"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtPALLET 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   7
         ToolTipText     =   "Код паллеты"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdLBLType 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип метки"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtLBLType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Тип метки"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtTheCode 
         Height          =   300
         Left            =   300
         MaxLength       =   24
         TabIndex        =   2
         ToolTipText     =   "Код метки"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblGateCameraNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер камеры для ворот:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheGate 
         BackStyle       =   0  'Transparent
         Caption         =   "Ворота:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTheCell 
         BackStyle       =   0  'Transparent
         Caption         =   "Ячейка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPALLET 
         BackStyle       =   0  'Transparent
         Caption         =   "Код паллеты:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblLBLType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип метки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Код метки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "RFIDLBD_INFO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 225
Option Explicit



   Public item As Object
Attribute item.VB_VarHelpID = 260
   Private OnInit As Boolean
   Public Event Changed()
Attribute Changed.VB_HelpID = 230
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
Attribute IsChanged.VB_HelpID = 250
  IsChanged = mIsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtTheCode_Change()
  Changing

End Sub
Private Sub txtLBLType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdLBLType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If item.Application.Manager.GetReferenceDialogEx2("RFIDD_LTYPE", ID, brief) Then
          txtLBLType.Tag = Left(ID, 38)
          txtLBLType = brief
        End If
End Sub
Private Sub cmdLBLType_MenuClick(ByVal sCaption As String)
          txtLBLType.Tag = ""
          txtLBLType = ""
End Sub
Private Sub txtPALLET_Change()
  Changing

End Sub
Private Sub txtTheCell_Change()
  Changing

End Sub
Private Sub txtTheGate_Change()
  Changing

End Sub
Private Sub txtGateCameraNum_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set item = Nothing
End Sub
Public Function IsOK() As Boolean
Attribute IsOK.VB_HelpID = 255
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtTheCode.Text)
If mIsOK Then mIsOK = txtLBLType.Tag <> ""
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
Attribute InitPanel.VB_HelpID = 245
OnInit = True
Dim iii As Long ' for combo only
If item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

  On Error Resume Next
txtTheCode = item.TheCode
If Not item.LBLType Is Nothing Then
  txtLBLType.Tag = item.LBLType.ID
  txtLBLType = item.LBLType.brief
Else
  txtLBLType.Tag = ""
  txtLBLType = ""
End If
 LoadBtnPictures cmdLBLType, cmdLBLType.Tag
  cmdLBLType.RemoveAllMenu
  cmdLBLType.AddMenu "Очистить"
  On Error Resume Next
txtPALLET = item.PALLET
  On Error Resume Next
txtTheCell = item.TheCell
  On Error Resume Next
txtTheGate = item.TheGate
  On Error Resume Next
txtGateCameraNum = item.GateCameraNum
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
Attribute Save.VB_HelpID = 280
If OnInit Then Exit Sub

item.TheCode = txtTheCode
If txtLBLType.Tag <> "" Then
  Set item.LBLType = item.Application.FindRowObject("RFIDD_LTYPE", txtLBLType.Tag)
Else
  Set item.LBLType = Nothing
End If
item.PALLET = txtPALLET
item.TheCell = txtTheCell
item.TheGate = txtTheGate
item.GateCameraNum = txtGateCameraNum
 mIsChanged = False
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(X As Single, Y As Single)
Attribute OptimalSize.VB_HelpID = 265
   Panel.OptimalSize X, Y
   X = X + Panel.Left
   Y = Y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
Attribute OptimalY.VB_HelpID = 270
   Dim X As Single, Y As Single
   Panel.OptimalSize X, Y
   OptimalY = Y
 End Function
 Public Sub Customize()
Attribute Customize.VB_HelpID = 235
   Panel.Customize
 End Sub
 Public Property Get PanelCustomisationString() As String
Attribute PanelCustomisationString.VB_HelpID = 275
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property
 Public Property Get Enabled() As Boolean
Attribute Enabled.VB_HelpID = 240
   Enabled = Panel.Enabled
 End Property
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



