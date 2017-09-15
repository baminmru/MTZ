VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl HMSF_DEF 
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
      Begin MTZ_PANEL.DropButton cmdThe3dSelected 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "imageopen.ico"
         ToolTipText     =   "3d изображение с выдленным этажом"
         Top             =   3420
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin MSComDlg.CommonDialog Dialog 
         Left            =   300
         Top             =   1665
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MTZ_PANEL.DropButton cmdTheFlatImage 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "imageopen.ico"
         ToolTipText     =   "Изображение помещения"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Название этажа"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheBuilding 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Здание"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheBuilding 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Здание"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Image imgThe3dSelected 
         BorderStyle     =   1  'Fixed Single
         Height          =   1200
         Left            =   300
         Stretch         =   -1  'True
         ToolTipText     =   "3d изображение с выдленным этажом"
         Top             =   3420
         Width           =   2550
      End
      Begin VB.Label lblThe3dSelected 
         BackStyle       =   0  'Transparent
         Caption         =   "3d изображение с выдленным этажом:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Image imgTheFlatImage 
         BorderStyle     =   1  'Fixed Single
         Height          =   1200
         Left            =   300
         Stretch         =   -1  'True
         ToolTipText     =   "Изображение помещения"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.Label lblTheFlatImage 
         BackStyle       =   0  'Transparent
         Caption         =   "Изображение помещения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название этажа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheBuilding 
         BackStyle       =   0  'Transparent
         Caption         =   "Здание:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "HMSF_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean
 Dim m_TheFlatImage
 Dim m_The3dSelected





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

Private Sub txtTheBuilding_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheBuilding_CLick()
  On Error Resume Next
     If txtTheBuilding.Tag = "" Then
       cmdTheBuilding_MenuClick "Выбрать"
     Else
       cmdTheBuilding_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheBuilding_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheBuilding.Tag = ""
          txtTheBuilding = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheBuilding.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheBuilding.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheBuilding.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "HSMB")
        If OK Then
          txtTheBuilding.Tag = Left(ID, 38)
          txtTheBuilding = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "HSMB" & Now
        ook = findObject(Item.Application.Manager, "HSMB", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtTheBuilding.Tag = ID
              txtTheBuilding = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "HSMB", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtTheBuilding.Tag = obj.ID
              txtTheBuilding = obj.brief
          Else
              txtTheBuilding.Tag = ""
              txtTheBuilding = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub CMDTheFlatImage_CLICK()
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
 Set imgTheFlatImage.Picture = LoadPicture(Dialog.FileName)
 Item.TheFlatImage = FileToArray(Dialog.FileName)
 Changing

End Sub
Private Sub cmdTheFlatImage_MenuClick(ByVal sCaption As String)

 Set imgTheFlatImage.Picture = LoadPicture()
 Item.TheFlatImage = Null
 Changing

End Sub
Private Sub CMDThe3dSelected_CLICK()
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
 Set imgThe3dSelected.Picture = LoadPicture(Dialog.FileName)
 Item.The3dSelected = FileToArray(Dialog.FileName)
 Changing

End Sub
Private Sub cmdThe3dSelected_MenuClick(ByVal sCaption As String)

 Set imgThe3dSelected.Picture = LoadPicture()
 Item.The3dSelected = Null
 Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtTheBuilding.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtName.Text)
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

If Not Item.TheBuilding Is Nothing Then
  txtTheBuilding.Tag = Item.TheBuilding.ID
  txtTheBuilding = Item.TheBuilding.brief
Else
  txtTheBuilding.Tag = ""
  txtTheBuilding = ""
End If
 LoadBtnPictures cmdTheBuilding, cmdTheBuilding.Tag
  cmdTheBuilding.RemoveAllMenu
  cmdTheBuilding.AddMenu "Очистить"
  cmdTheBuilding.AddMenu "Создать"
  cmdTheBuilding.AddMenu "Выбрать"
  cmdTheBuilding.AddMenu "Открыть"
  On Error Resume Next
txtName = Item.Name
 LoadImage imgTheFlatImage, Item.TheFlatImage
 LoadBtnPictures cmdTheFlatImage, cmdTheFlatImage.Tag
 cmdTheFlatImage.RemoveAllMenu
 cmdTheFlatImage.AddMenu "Очистить"
 LoadImage imgThe3dSelected, Item.The3dSelected
 LoadBtnPictures cmdThe3dSelected, cmdThe3dSelected.Tag
 cmdThe3dSelected.RemoveAllMenu
 cmdThe3dSelected.AddMenu "Очистить"
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

If txtTheBuilding.Tag <> "" Then
  Set Item.TheBuilding = Item.Application.Manager.GetInstanceObject(txtTheBuilding.Tag)
Else
  Set Item.TheBuilding = Nothing
End If
Item.Name = txtName
 ' SEE cmdTheFlatImage_CLICK
 ' SEE cmdThe3dSelected_CLICK
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



