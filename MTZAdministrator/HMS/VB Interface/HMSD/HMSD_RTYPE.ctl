VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl HMSD_RTYPE 
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
      Begin VB.ComboBox cmbUseColor 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Использовать закраску"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.ComboBox cmbUseIcon 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Использовать иконку"
         Top             =   3420
         Width           =   3000
      End
      Begin MSComDlg.CommonDialog Dialog 
         Left            =   300
         Top             =   1665
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MTZ_PANEL.DropButton cmdTheIcon 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "imageopen.ico"
         ToolTipText     =   "Иконка"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheColor 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   4
         ToolTipText     =   "Цвет закраски"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTheName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblUseColor 
         BackStyle       =   0  'Transparent
         Caption         =   "Использовать закраску:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblUseIcon 
         BackStyle       =   0  'Transparent
         Caption         =   "Использовать иконку:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Image imgTheIcon 
         BorderStyle     =   1  'Fixed Single
         Height          =   1200
         Left            =   300
         Stretch         =   -1  'True
         ToolTipText     =   "Иконка"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.Label lblTheIcon 
         BackStyle       =   0  'Transparent
         Caption         =   "Иконка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheColor 
         BackStyle       =   0  'Transparent
         Caption         =   "Цвет закраски:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheName 
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
Attribute VB_Name = "HMSD_RTYPE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean
 Dim m_TheIcon





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, Cancel)
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

Private Sub txtTheName_Change()
  Changing

End Sub
Private Sub txtTheColor_Change()
  Changing

End Sub
Private Sub CMDTheIcon_CLICK()
  On Error Resume Next

 Dialog.Flags = cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNPathMustExist
 Dialog.Filter = "(*.BMP;*.ICO;*.GIF;*.JPG)|*.BMP;*.ICO;*.GIF;*.JPG"
 Dialog.DialogTitle = "Файл изображения"
 Dialog.CancelError = True
 On Error Resume Next
 Dialog.ShowOpen
 If (err.Number > 0) Then
  err.Clear
  Exit Sub
 End If
 Set imgTheIcon.Picture = LoadPicture(Dialog.FileName)
 Item.TheIcon = FileToArray(Dialog.FileName)
 Changing

End Sub
Private Sub cmdTheIcon_MenuClick(ByVal sCaption As String)

 Set imgTheIcon.Picture = LoadPicture()
 Item.TheIcon = Null
 Changing

End Sub
Private Sub cmbUseIcon_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbUseColor_Click()
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

If mIsOK Then mIsOK = IsSet(txtTheName.Text)
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
txtTheName = Item.TheName
  On Error Resume Next
txtTheColor = Item.TheColor
 LoadImage imgTheIcon, Item.TheIcon
 LoadBtnPictures cmdTheIcon, cmdTheIcon.Tag
 cmdTheIcon.RemoveAllMenu
 cmdTheIcon.AddMenu "Очистить"
cmbUseIcon.Clear
cmbUseIcon.AddItem "Да"
cmbUseIcon.ItemData(cmbUseIcon.NewIndex) = -1
cmbUseIcon.AddItem "Нет"
cmbUseIcon.ItemData(cmbUseIcon.NewIndex) = 0
 For iii = 0 To cmbUseIcon.ListCount - 1
  If Item.UseIcon = cmbUseIcon.ItemData(iii) Then
   cmbUseIcon.ListIndex = iii
   Exit For
  End If
 Next
cmbUseColor.Clear
cmbUseColor.AddItem "Да"
cmbUseColor.ItemData(cmbUseColor.NewIndex) = -1
cmbUseColor.AddItem "Нет"
cmbUseColor.ItemData(cmbUseColor.NewIndex) = 0
 For iii = 0 To cmbUseColor.ListCount - 1
  If Item.UseColor = cmbUseColor.ItemData(iii) Then
   cmbUseColor.ListIndex = iii
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

Item.TheName = txtTheName
Item.TheColor = txtTheColor
 ' SEE cmdTheIcon_CLICK
 If cmbUseIcon.ListIndex >= 0 Then
   Item.UseIcon = cmbUseIcon.ItemData(cmbUseIcon.ListIndex)
 End If
 If cmbUseColor.ListIndex >= 0 Then
   Item.UseColor = cmbUseColor.ItemData(cmbUseColor.ListIndex)
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



