VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WMSXYZ_CELL 
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
      Begin VB.ComboBox cmbIsCellLocked 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         ToolTipText     =   "Заблокирована"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsConflict 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "Конфликтная ячейка"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsActive 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "Активная ячейка"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtCellSize 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   7
         ToolTipText     =   "Вместимость ячейки"
         Top             =   1815
         Width           =   1800
      End
      Begin MTZ_PANEL.DropButton cmdCellType 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Зона"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCellType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Зона"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtCELLID 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   2
         ToolTipText     =   "Номер ячейки"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblIsCellLocked 
         BackStyle       =   0  'Transparent
         Caption         =   "Заблокирована:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblIsConflict 
         BackStyle       =   0  'Transparent
         Caption         =   "Конфликтная ячейка:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblIsActive 
         BackStyle       =   0  'Transparent
         Caption         =   "Активная ячейка:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCellSize 
         BackStyle       =   0  'Transparent
         Caption         =   "Вместимость ячейки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCellType 
         BackStyle       =   0  'Transparent
         Caption         =   "Зона:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCELLID 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер ячейки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSXYZ_CELL"
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

Private Sub txtCELLID_Change()
  Changing

End Sub
Private Sub txtCellType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCellType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_ZTYPE", ID, brief) Then
          txtCellType.Tag = Left(ID, 38)
          txtCellType = brief
        End If
End Sub
Private Sub cmdCellType_MenuClick(ByVal sCaption As String)
          txtCellType.Tag = ""
          txtCellType = ""
End Sub
Private Sub txtCellSize_Validate(cancel As Boolean)
If txtCellSize.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCellSize.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCellSize.SetFocus
  ElseIf Val(txtCellSize.Text) <> CLng(Val(txtCellSize.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtCellSize.SetFocus
  End If
End If
End Sub
Private Sub txtCellSize_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCellSize_Change()
  Changing

End Sub
Private Sub cmbIsActive_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsConflict_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsCellLocked_Click()
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

If mIsOK Then mIsOK = IsSet(txtCELLID.Text)
If mIsOK Then mIsOK = txtCellType.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtCellSize.Text)
If mIsOK Then mIsOK = (cmbIsActive.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbIsConflict.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbIsCellLocked.ListIndex >= 0)
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
txtCELLID = Item.CELLID
If Not Item.CellType Is Nothing Then
  txtCellType.Tag = Item.CellType.ID
  txtCellType = Item.CellType.brief
Else
  txtCellType.Tag = ""
  txtCellType = ""
End If
 LoadBtnPictures cmdCellType, cmdCellType.Tag
  cmdCellType.RemoveAllMenu
  cmdCellType.AddMenu "Очистить"
txtCellSize = Item.CellSize
cmbIsActive.Clear
cmbIsActive.AddItem "Да"
cmbIsActive.ItemData(cmbIsActive.NewIndex) = -1
cmbIsActive.AddItem "Нет"
cmbIsActive.ItemData(cmbIsActive.NewIndex) = 0
 For iii = 0 To cmbIsActive.ListCount - 1
  If Item.IsActive = cmbIsActive.ItemData(iii) Then
   cmbIsActive.ListIndex = iii
   Exit For
  End If
 Next
cmbIsConflict.Clear
cmbIsConflict.AddItem "Да"
cmbIsConflict.ItemData(cmbIsConflict.NewIndex) = -1
cmbIsConflict.AddItem "Нет"
cmbIsConflict.ItemData(cmbIsConflict.NewIndex) = 0
 For iii = 0 To cmbIsConflict.ListCount - 1
  If Item.IsConflict = cmbIsConflict.ItemData(iii) Then
   cmbIsConflict.ListIndex = iii
   Exit For
  End If
 Next
cmbIsCellLocked.Clear
cmbIsCellLocked.AddItem "Да"
cmbIsCellLocked.ItemData(cmbIsCellLocked.NewIndex) = -1
cmbIsCellLocked.AddItem "Нет"
cmbIsCellLocked.ItemData(cmbIsCellLocked.NewIndex) = 0
 For iii = 0 To cmbIsCellLocked.ListCount - 1
  If Item.IsCellLocked = cmbIsCellLocked.ItemData(iii) Then
   cmbIsCellLocked.ListIndex = iii
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

Item.CELLID = txtCELLID
If txtCellType.Tag <> "" Then
  Set Item.CellType = Item.Application.FindRowObject("WMSD_ZTYPE", txtCellType.Tag)
Else
  Set Item.CellType = Nothing
End If
Item.CellSize = CDbl(txtCellSize)
 If cmbIsActive.ListIndex >= 0 Then
   Item.IsActive = cmbIsActive.ItemData(cmbIsActive.ListIndex)
 End If
 If cmbIsConflict.ListIndex >= 0 Then
   Item.IsConflict = cmbIsConflict.ItemData(cmbIsConflict.ListIndex)
 End If
 If cmbIsCellLocked.ListIndex >= 0 Then
   Item.IsCellLocked = cmbIsCellLocked.ItemData(cmbIsCellLocked.ListIndex)
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



