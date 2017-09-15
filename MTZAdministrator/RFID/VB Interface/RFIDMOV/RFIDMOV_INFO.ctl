VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl RFIDMOV_INFO 
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
      Begin VB.ComboBox cmbCoreSync 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         ToolTipText     =   "Синхронизировано c CORE IMS"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheCar 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Штабелер"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCar 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Штабелер"
         Top             =   3225
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpMoveDate 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Дата перемещения"
         Top             =   2520
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16449539
         CurrentDate     =   39748
      End
      Begin VB.TextBox txtToCell 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "В ячейку"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFromCell 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Из ячейки"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtThePallet 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Паллета"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblCoreSync 
         BackStyle       =   0  'Transparent
         Caption         =   "Синхронизировано c CORE IMS:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheCar 
         BackStyle       =   0  'Transparent
         Caption         =   "Штабелер:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblMoveDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата перемещения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblToCell 
         BackStyle       =   0  'Transparent
         Caption         =   "В ячейку:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFromCell 
         BackStyle       =   0  'Transparent
         Caption         =   "Из ячейки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblThePallet 
         BackStyle       =   0  'Transparent
         Caption         =   "Паллета:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "RFIDMOV_INFO"
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

Private Sub txtThePallet_Change()
  Changing

End Sub
Private Sub txtFromCell_Change()
  Changing

End Sub
Private Sub txtToCell_Change()
  Changing

End Sub
Private Sub dtpMoveDate_Change()
  Changing

End Sub
Private Sub txtTheCar_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCar_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("RFIDD_CAR", ID, brief) Then
          txtTheCar.Tag = Left(ID, 38)
          txtTheCar = brief
        End If
End Sub
Private Sub cmdTheCar_MenuClick(ByVal sCaption As String)
          txtTheCar.Tag = ""
          txtTheCar = ""
End Sub
Private Sub cmbCoreSync_Click()
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

If mIsOK Then mIsOK = IsSet(txtThePallet.Text)
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
txtThePallet = Item.ThePallet
  On Error Resume Next
txtFromCell = Item.FromCell
  On Error Resume Next
txtToCell = Item.ToCell
dtpMoveDate = Now
If Item.MoveDate <> 0 Then
 dtpMoveDate = Item.MoveDate
Else
 dtpMoveDate.Value = Null
End If
If Not Item.TheCar Is Nothing Then
  txtTheCar.Tag = Item.TheCar.ID
  txtTheCar = Item.TheCar.brief
Else
  txtTheCar.Tag = ""
  txtTheCar = ""
End If
 LoadBtnPictures cmdTheCar, cmdTheCar.Tag
  cmdTheCar.RemoveAllMenu
  cmdTheCar.AddMenu "Очистить"
cmbCoreSync.Clear
cmbCoreSync.AddItem "Да"
cmbCoreSync.ItemData(cmbCoreSync.NewIndex) = -1
cmbCoreSync.AddItem "Нет"
cmbCoreSync.ItemData(cmbCoreSync.NewIndex) = 0
 For iii = 0 To cmbCoreSync.ListCount - 1
  If Item.CoreSync = cmbCoreSync.ItemData(iii) Then
   cmbCoreSync.ListIndex = iii
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

Item.ThePallet = txtThePallet
Item.FromCell = txtFromCell
Item.ToCell = txtToCell
  If IsNull(dtpMoveDate) Then
    Item.MoveDate = 0
  Else
    Item.MoveDate = dtpMoveDate.Value
  End If
If txtTheCar.Tag <> "" Then
  Set Item.TheCar = Item.Application.FindRowObject("RFIDD_CAR", txtTheCar.Tag)
Else
  Set Item.TheCar = Nothing
End If
 If cmbCoreSync.ListIndex >= 0 Then
   Item.CoreSync = cmbCoreSync.ItemData(cmbCoreSync.ListIndex)
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



