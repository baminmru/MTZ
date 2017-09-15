VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl TheDefenitionDiffP 
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
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         ToolTipText     =   "Примечание"
         Top             =   3225
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtCountParticles 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Количество участков"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdDirStation 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Станция назначения"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDirStation 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Станция назначения"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTownFrom 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Город отправления"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTownFrom 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Город отправления"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtTheNumeric 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер сложного маршрута"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCountParticles 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество участков:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblDirStation 
         BackStyle       =   0  'Transparent
         Caption         =   "Станция назначения:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTownFrom 
         BackStyle       =   0  'Transparent
         Caption         =   "Город отправления:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheNumeric 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер сложного маршрута:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "TheDefenitionDiffP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, cancel)
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

Private Sub txtTheNumeric_Validate(cancel As Boolean)
If txtTheNumeric.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNumeric.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheNumeric.SetFocus
  ElseIf Val(txtTheNumeric.Text) <> CLng(Val(txtTheNumeric.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtTheNumeric.SetFocus
  End If
End If
End Sub
Private Sub txtTheNumeric_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheNumeric_Change()
  Changing

End Sub
Private Sub txtTownFrom_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTownFrom_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_TOWN", ID, brief) Then
          txtTownFrom.Tag = Left(ID, 38)
          txtTownFrom = brief
        End If
End Sub
Private Sub cmdTownFrom_MenuClick(ByVal sCaption As String)
          txtTownFrom.Tag = ""
          txtTownFrom = ""
End Sub
Private Sub txtDirStation_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDirStation_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DIRSTATION", ID, brief) Then
          txtDirStation.Tag = Left(ID, 38)
          txtDirStation = brief
        End If
End Sub
Private Sub cmdDirStation_MenuClick(ByVal sCaption As String)
          txtDirStation.Tag = ""
          txtDirStation = ""
End Sub
Private Sub txtCountParticles_Validate(cancel As Boolean)
If txtCountParticles.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCountParticles.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCountParticles.SetFocus
  ElseIf Val(txtCountParticles.Text) < -922337203685478# Or Val(txtCountParticles.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCountParticles.SetFocus
  End If
End If
End Sub
Private Sub txtCountParticles_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCountParticles_Change()
  Changing

End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtTheNumeric.Text)
If mIsOK Then mIsOK = txtTownFrom.Tag <> ""
If mIsOK Then mIsOK = txtDirStation.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtCountParticles.Text)
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

txtTheNumeric = Item.TheNumeric
If Not Item.TownFrom Is Nothing Then
  txtTownFrom.Tag = Item.TownFrom.ID
  txtTownFrom = Item.TownFrom.brief
Else
  txtTownFrom.Tag = ""
  txtTownFrom = ""
End If
 LoadBtnPictures cmdTownFrom, cmdTownFrom.Tag
  cmdTownFrom.RemoveAllMenu
  cmdTownFrom.AddMenu "Очистить"
If Not Item.DirStation Is Nothing Then
  txtDirStation.Tag = Item.DirStation.ID
  txtDirStation = Item.DirStation.brief
Else
  txtDirStation.Tag = ""
  txtDirStation = ""
End If
 LoadBtnPictures cmdDirStation, cmdDirStation.Tag
  cmdDirStation.RemoveAllMenu
  cmdDirStation.AddMenu "Очистить"
txtCountParticles = Item.CountParticles
txtTheComment = Item.TheComment
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

Item.TheNumeric = CDbl(txtTheNumeric)
If txtTownFrom.Tag <> "" Then
  Set Item.TownFrom = Item.Application.FindRowObject("ENTDIC_TOWN", txtTownFrom.Tag)
Else
  Set Item.TownFrom = Nothing
End If
If txtDirStation.Tag <> "" Then
  Set Item.DirStation = Item.Application.FindRowObject("PEKD_DIRSTATION", txtDirStation.Tag)
Else
  Set Item.DirStation = Nothing
End If
Item.CountParticles = CDbl(txtCountParticles)
Item.TheComment = txtTheComment
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



