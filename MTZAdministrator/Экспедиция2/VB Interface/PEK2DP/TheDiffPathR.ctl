VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl TheDiffPathR 
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
      Begin MTZ_PANEL.DropButton cmdTransport 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Транспорт"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTransport 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Транспорт"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTransporter 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "Перевозчик"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTransporter 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "Перевозчик"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTempDirStation 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Промежуточный пункт прибытия"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTempDirStation 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Промежуточный пункт прибытия"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdDirection 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Направление"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDirection 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Направление"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTempTownFrom 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Промежуточный пункт отправления"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTempTownFrom 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Промежуточный пункт отправления"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер сегмента в Сложном Маршруте"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblTransport 
         BackStyle       =   0  'Transparent
         Caption         =   "Транспорт:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTransporter 
         BackStyle       =   0  'Transparent
         Caption         =   "Перевозчик:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTempDirStation 
         BackStyle       =   0  'Transparent
         Caption         =   "Промежуточный пункт прибытия:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblDirection 
         BackStyle       =   0  'Transparent
         Caption         =   "Направление:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTempTownFrom 
         BackStyle       =   0  'Transparent
         Caption         =   "Промежуточный пункт отправления:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер сегмента в Сложном Маршруте:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "TheDiffPathR"
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

Private Sub txtTheNumber_Validate(Cancel As Boolean)
If txtTheNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNumber.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheNumber.SetFocus
  ElseIf Val(txtTheNumber.Text) <> CLng(Val(txtTheNumber.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtTheNumber.SetFocus
  End If
End If
End Sub
Private Sub txtTheNumber_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheNumber_Change()
  Changing

End Sub
Private Sub txtTempTownFrom_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTempTownFrom_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_TOWN", ID, brief) Then
          txtTempTownFrom.Tag = Left(ID, 38)
          txtTempTownFrom = brief
        End If
End Sub
Private Sub cmdTempTownFrom_MenuClick(ByVal sCaption As String)
          txtTempTownFrom.Tag = ""
          txtTempTownFrom = ""
End Sub
Private Sub txtDirection_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDirection_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DIRECTION", ID, brief) Then
          txtDirection.Tag = Left(ID, 38)
          txtDirection = brief
        End If
End Sub
Private Sub cmdDirection_MenuClick(ByVal sCaption As String)
          txtDirection.Tag = ""
          txtDirection = ""
End Sub
Private Sub txtTempDirStation_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTempDirStation_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DIRSTATION", ID, brief) Then
          txtTempDirStation.Tag = Left(ID, 38)
          txtTempDirStation = brief
        End If
End Sub
Private Sub cmdTempDirStation_MenuClick(ByVal sCaption As String)
          txtTempDirStation.Tag = ""
          txtTempDirStation = ""
End Sub
Private Sub txtTransporter_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTransporter_CLick()
  On Error Resume Next
     If txtTransporter.Tag = "" Then
       cmdTransporter_MenuClick "Выбрать"
     Else
       cmdTransporter_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTransporter_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTransporter.Tag = ""
          txtTransporter = ""
  End If
  If sCaption = "Открыть" Then
    If txtTransporter.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTransporter.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTransporter.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2")
        If OK Then
          txtTransporter.Tag = Left(ID, 38)
          txtTransporter = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRC2" & Now
        ook = findObject(Item.Application.Manager, "VRC2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtTransporter.Tag = ID
              txtTransporter = brief
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
              txtTransporter.Tag = obj.ID
              txtTransporter = obj.brief
          Else
              txtTransporter.Tag = ""
              txtTransporter = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtTransport_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTransport_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_TransportType", ID, brief) Then
          txtTransport.Tag = Left(ID, 38)
          txtTransport = brief
        End If
End Sub
Private Sub cmdTransport_MenuClick(ByVal sCaption As String)
          txtTransport.Tag = ""
          txtTransport = ""
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtTheNumber.Text)
If mIsOK Then mIsOK = txtTempTownFrom.Tag <> ""
If mIsOK Then mIsOK = txtDirection.Tag <> ""
If mIsOK Then mIsOK = txtTempDirStation.Tag <> ""
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

txtTheNumber = Item.TheNumber
If Not Item.TempTownFrom Is Nothing Then
  txtTempTownFrom.Tag = Item.TempTownFrom.ID
  txtTempTownFrom = Item.TempTownFrom.brief
Else
  txtTempTownFrom.Tag = ""
  txtTempTownFrom = ""
End If
 LoadBtnPictures cmdTempTownFrom, cmdTempTownFrom.Tag
  cmdTempTownFrom.RemoveAllMenu
  cmdTempTownFrom.AddMenu "Очистить"
If Not Item.Direction Is Nothing Then
  txtDirection.Tag = Item.Direction.ID
  txtDirection = Item.Direction.brief
Else
  txtDirection.Tag = ""
  txtDirection = ""
End If
 LoadBtnPictures cmdDirection, cmdDirection.Tag
  cmdDirection.RemoveAllMenu
  cmdDirection.AddMenu "Очистить"
If Not Item.TempDirStation Is Nothing Then
  txtTempDirStation.Tag = Item.TempDirStation.ID
  txtTempDirStation = Item.TempDirStation.brief
Else
  txtTempDirStation.Tag = ""
  txtTempDirStation = ""
End If
 LoadBtnPictures cmdTempDirStation, cmdTempDirStation.Tag
  cmdTempDirStation.RemoveAllMenu
  cmdTempDirStation.AddMenu "Очистить"
If Not Item.Transporter Is Nothing Then
  txtTransporter.Tag = Item.Transporter.ID
  txtTransporter = Item.Transporter.brief
Else
  txtTransporter.Tag = ""
  txtTransporter = ""
End If
 LoadBtnPictures cmdTransporter, cmdTransporter.Tag
  cmdTransporter.RemoveAllMenu
  cmdTransporter.AddMenu "Очистить"
  cmdTransporter.AddMenu "Создать"
  cmdTransporter.AddMenu "Выбрать"
  cmdTransporter.AddMenu "Открыть"
If Not Item.Transport Is Nothing Then
  txtTransport.Tag = Item.Transport.ID
  txtTransport = Item.Transport.brief
Else
  txtTransport.Tag = ""
  txtTransport = ""
End If
 LoadBtnPictures cmdTransport, cmdTransport.Tag
  cmdTransport.RemoveAllMenu
  cmdTransport.AddMenu "Очистить"
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

Item.TheNumber = CDbl(txtTheNumber)
If txtTempTownFrom.Tag <> "" Then
  Set Item.TempTownFrom = Item.Application.FindRowObject("ENTDIC_TOWN", txtTempTownFrom.Tag)
Else
  Set Item.TempTownFrom = Nothing
End If
If txtDirection.Tag <> "" Then
  Set Item.Direction = Item.Application.FindRowObject("PEKD_DIRECTION", txtDirection.Tag)
Else
  Set Item.Direction = Nothing
End If
If txtTempDirStation.Tag <> "" Then
  Set Item.TempDirStation = Item.Application.FindRowObject("PEKD_DIRSTATION", txtTempDirStation.Tag)
Else
  Set Item.TempDirStation = Nothing
End If
If txtTransporter.Tag <> "" Then
  Set Item.Transporter = Item.Application.Manager.GetInstanceObject(txtTransporter.Tag)
Else
  Set Item.Transporter = Nothing
End If
If txtTransport.Tag <> "" Then
  Set Item.Transport = Item.Application.FindRowObject("ENTDIC_TransportType", txtTransport.Tag)
Else
  Set Item.Transport = Nothing
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



