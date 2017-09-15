VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PEKD_TRAINSmain 
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
      Begin MTZ_PANEL.DropButton cmdTrainType 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип поезда"
         Top             =   5535
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTrainType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Тип поезда"
         Top             =   5535
         Width           =   2550
      End
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   14
         ToolTipText     =   "Примечание"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtTheDesciption 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   12
         ToolTipText     =   "Описание"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtthe_Rule 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   10
         ToolTipText     =   "Отправка"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdToSTATION 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "В"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtToSTATION 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "В"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdFromStation 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Из"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFromStation 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Из"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtTrainNo 
         Height          =   300
         Left            =   300
         MaxLength       =   50
         TabIndex        =   2
         ToolTipText     =   "№ поезда"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblTrainType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип поезда:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheDesciption 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblthe_Rule 
         BackStyle       =   0  'Transparent
         Caption         =   "Отправка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblToSTATION 
         BackStyle       =   0  'Transparent
         Caption         =   "В:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFromStation 
         BackStyle       =   0  'Transparent
         Caption         =   "Из:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTrainNo 
         BackStyle       =   0  'Transparent
         Caption         =   "№ поезда:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKD_TRAINSmain"
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

Private Sub txtTrainNo_Change()
  Changing

End Sub
Private Sub txtFromStation_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFromStation_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DIRSTATION", ID, brief, , , "PEKD_DIRECTIONID='" & Item.Parent.Parent.ID & "'") Then
          txtFromStation.Tag = Left(ID, 38)
          txtFromStation = brief
        End If
End Sub
Private Sub cmdFromStation_MenuClick(ByVal sCaption As String)
          txtFromStation.Tag = ""
          txtFromStation = ""
End Sub
Private Sub txtToSTATION_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdToSTATION_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DIRSTATION", ID, brief, , , "PEKD_DIRECTIONID='" & Item.Parent.Parent.ID & "'") Then
          txtToSTATION.Tag = Left(ID, 38)
          txtToSTATION = brief
        End If
End Sub
Private Sub cmdToSTATION_MenuClick(ByVal sCaption As String)
          txtToSTATION.Tag = ""
          txtToSTATION = ""
End Sub
Private Sub txtthe_Rule_Change()
  Changing

End Sub
Private Sub txtTheDesciption_Change()
  Changing

End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub txtTrainType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTrainType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_TRAINTYPE", ID, brief) Then
          txtTrainType.Tag = Left(ID, 38)
          txtTrainType = brief
        End If
End Sub
Private Sub cmdTrainType_MenuClick(ByVal sCaption As String)
          txtTrainType.Tag = ""
          txtTrainType = ""
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtTrainNo.Text)
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
txtTrainNo = Item.TrainNo
If Not Item.FromStation Is Nothing Then
  txtFromStation.Tag = Item.FromStation.ID
  txtFromStation = Item.FromStation.brief
Else
  txtFromStation.Tag = ""
  txtFromStation = ""
End If
 LoadBtnPictures cmdFromStation, cmdFromStation.Tag
  cmdFromStation.RemoveAllMenu
  cmdFromStation.AddMenu "Очистить"
If Not Item.ToSTATION Is Nothing Then
  txtToSTATION.Tag = Item.ToSTATION.ID
  txtToSTATION = Item.ToSTATION.brief
Else
  txtToSTATION.Tag = ""
  txtToSTATION = ""
End If
 LoadBtnPictures cmdToSTATION, cmdToSTATION.Tag
  cmdToSTATION.RemoveAllMenu
  cmdToSTATION.AddMenu "Очистить"
  On Error Resume Next
txtthe_Rule = Item.the_Rule
  On Error Resume Next
txtTheDesciption = Item.TheDesciption
txtTheComment = Item.TheComment
If Not Item.TrainType Is Nothing Then
  txtTrainType.Tag = Item.TrainType.ID
  txtTrainType = Item.TrainType.brief
Else
  txtTrainType.Tag = ""
  txtTrainType = ""
End If
 LoadBtnPictures cmdTrainType, cmdTrainType.Tag
  cmdTrainType.RemoveAllMenu
  cmdTrainType.AddMenu "Очистить"
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

Item.TrainNo = txtTrainNo
If txtFromStation.Tag <> "" Then
  Set Item.FromStation = Item.Application.FindRowObject("PEKD_DIRSTATION", txtFromStation.Tag)
Else
  Set Item.FromStation = Nothing
End If
If txtToSTATION.Tag <> "" Then
  Set Item.ToSTATION = Item.Application.FindRowObject("PEKD_DIRSTATION", txtToSTATION.Tag)
Else
  Set Item.ToSTATION = Nothing
End If
Item.the_Rule = txtthe_Rule
Item.TheDesciption = txtTheDesciption
Item.TheComment = txtTheComment
If txtTrainType.Tag <> "" Then
  Set Item.TrainType = Item.Application.FindRowObject("PEKD_TRAINTYPE", txtTrainType.Tag)
Else
  Set Item.TrainType = Nothing
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



