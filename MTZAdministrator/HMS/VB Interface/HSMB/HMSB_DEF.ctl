VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl HMSB_DEF 
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
      Begin MTZ_PANEL.DropButton cmdCategoryPicture 
         Height          =   300
         Left            =   9150
         TabIndex        =   32
         Tag             =   "imageopen.ico"
         ToolTipText     =   "Картинка категорий помещений"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtWorkPlaceCnt 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   30
         ToolTipText     =   "Кол-во рабочих мест"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.TextBox txtCafePlaceCnt 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   28
         ToolTipText     =   "Кол-во посадочных мест в кафе"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.TextBox txtLibPlaceCnt 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   26
         ToolTipText     =   "Кол-во посадочных мест в библиотеке"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.TextBox txtCompPlaceCnt 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   24
         ToolTipText     =   "Кол-во посадочных мест в компьютерных классах"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.TextBox txtAudPlaceCnt 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   22
         ToolTipText     =   "Кол-во посадочных мест в аудиториях"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.TextBox txtBuildYear 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   20
         ToolTipText     =   "Год постройки"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.TextBox txtTotalS 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   18
         ToolTipText     =   "Общая площадь"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtTheFax 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   16
         ToolTipText     =   "Факс"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtThePhone 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   14
         ToolTipText     =   "Телефон"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtInfo 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         ToolTipText     =   "Описание"
         Top             =   6630
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMapImage 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "imageopen.ico"
         ToolTipText     =   "Картинка с картой прохода"
         Top             =   5025
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin MTZ_PANEL.DropButton cmdtheFlow3d 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "imageopen.ico"
         ToolTipText     =   "3d картинка этажей"
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
      Begin MTZ_PANEL.DropButton cmdThePhoto 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "imageopen.ico"
         ToolTipText     =   "Фотография"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtAddr 
         Height          =   300
         Left            =   300
         MaxLength       =   4000
         TabIndex        =   4
         ToolTipText     =   "Адрес"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Image imgCategoryPicture 
         BorderStyle     =   1  'Fixed Single
         Height          =   1200
         Left            =   6600
         Stretch         =   -1  'True
         ToolTipText     =   "Картинка категорий помещений"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblCategoryPicture 
         BackStyle       =   0  'Transparent
         Caption         =   "Картинка категорий помещений:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   6600
         TabIndex        =   31
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblWorkPlaceCnt 
         BackStyle       =   0  'Transparent
         Caption         =   "Кол-во рабочих мест:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblCafePlaceCnt 
         BackStyle       =   0  'Transparent
         Caption         =   "Кол-во посадочных мест в кафе:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblLibPlaceCnt 
         BackStyle       =   0  'Transparent
         Caption         =   "Кол-во посадочных мест в библиотеке:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblCompPlaceCnt 
         BackStyle       =   0  'Transparent
         Caption         =   "Кол-во посадочных мест в компьютерных классах:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblAudPlaceCnt 
         BackStyle       =   0  'Transparent
         Caption         =   "Кол-во посадочных мест в аудиториях:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblBuildYear 
         BackStyle       =   0  'Transparent
         Caption         =   "Год постройки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTotalS 
         BackStyle       =   0  'Transparent
         Caption         =   "Общая площадь:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   17
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheFax 
         BackStyle       =   0  'Transparent
         Caption         =   "Факс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   15
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblThePhone 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   13
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   6300
         Width           =   3000
      End
      Begin VB.Image imgMapImage 
         BorderStyle     =   1  'Fixed Single
         Height          =   1200
         Left            =   300
         Stretch         =   -1  'True
         ToolTipText     =   "Картинка с картой прохода"
         Top             =   5025
         Width           =   2550
      End
      Begin VB.Label lblMapImage 
         BackStyle       =   0  'Transparent
         Caption         =   "Картинка с картой прохода:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   4695
         Width           =   3000
      End
      Begin VB.Image imgtheFlow3d 
         BorderStyle     =   1  'Fixed Single
         Height          =   1200
         Left            =   300
         Stretch         =   -1  'True
         ToolTipText     =   "3d картинка этажей"
         Top             =   3420
         Width           =   2550
      End
      Begin VB.Label lbltheFlow3d 
         BackStyle       =   0  'Transparent
         Caption         =   "3d картинка этажей:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Image imgThePhoto 
         BorderStyle     =   1  'Fixed Single
         Height          =   1200
         Left            =   300
         Stretch         =   -1  'True
         ToolTipText     =   "Фотография"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.Label lblThePhoto 
         BackStyle       =   0  'Transparent
         Caption         =   "Фотография:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblAddr 
         BackStyle       =   0  'Transparent
         Caption         =   "Адрес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblName 
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
Attribute VB_Name = "HMSB_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean
 Dim m_ThePhoto
 Dim m_theFlow3d
 Dim m_MapImage
 Dim m_CategoryPicture





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, cancel)
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

Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtAddr_Change()
  Changing

End Sub
Private Sub CMDThePhoto_CLICK()
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
 Set imgThePhoto.Picture = LoadPicture(Dialog.FileName)
 Item.ThePhoto = FileToArray(Dialog.FileName)
 Changing

End Sub
Private Sub cmdThePhoto_MenuClick(ByVal sCaption As String)

 Set imgThePhoto.Picture = LoadPicture()
 Item.ThePhoto = Null
 Changing

End Sub
Private Sub CMDtheFlow3d_CLICK()
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
 Set imgtheFlow3d.Picture = LoadPicture(Dialog.FileName)
 Item.theFlow3d = FileToArray(Dialog.FileName)
 Changing

End Sub
Private Sub cmdtheFlow3d_MenuClick(ByVal sCaption As String)

 Set imgtheFlow3d.Picture = LoadPicture()
 Item.theFlow3d = Null
 Changing

End Sub
Private Sub CMDMapImage_CLICK()
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
 Set imgMapImage.Picture = LoadPicture(Dialog.FileName)
 Item.MapImage = FileToArray(Dialog.FileName)
 Changing

End Sub
Private Sub cmdMapImage_MenuClick(ByVal sCaption As String)

 Set imgMapImage.Picture = LoadPicture()
 Item.MapImage = Null
 Changing

End Sub
Private Sub txtInfo_Change()
  Changing

End Sub
Private Sub txtThePhone_Change()
  Changing

End Sub
Private Sub txtTheFax_Change()
  Changing

End Sub
Private Sub txtTotalS_Change()
  Changing

End Sub
Private Sub txtBuildYear_Validate(cancel As Boolean)
If txtBuildYear.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtBuildYear.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtBuildYear.SetFocus
  ElseIf Val(txtBuildYear.Text) <> CLng(Val(txtBuildYear.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtBuildYear.SetFocus
  End If
End If
End Sub
Private Sub txtBuildYear_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtBuildYear_Change()
  Changing

End Sub
Private Sub txtAudPlaceCnt_Validate(cancel As Boolean)
If txtAudPlaceCnt.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtAudPlaceCnt.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtAudPlaceCnt.SetFocus
  ElseIf Val(txtAudPlaceCnt.Text) <> CLng(Val(txtAudPlaceCnt.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtAudPlaceCnt.SetFocus
  End If
End If
End Sub
Private Sub txtAudPlaceCnt_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtAudPlaceCnt_Change()
  Changing

End Sub
Private Sub txtCompPlaceCnt_Validate(cancel As Boolean)
If txtCompPlaceCnt.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCompPlaceCnt.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCompPlaceCnt.SetFocus
  ElseIf Val(txtCompPlaceCnt.Text) <> CLng(Val(txtCompPlaceCnt.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtCompPlaceCnt.SetFocus
  End If
End If
End Sub
Private Sub txtCompPlaceCnt_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCompPlaceCnt_Change()
  Changing

End Sub
Private Sub txtLibPlaceCnt_Validate(cancel As Boolean)
If txtLibPlaceCnt.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtLibPlaceCnt.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtLibPlaceCnt.SetFocus
  ElseIf Val(txtLibPlaceCnt.Text) <> CLng(Val(txtLibPlaceCnt.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtLibPlaceCnt.SetFocus
  End If
End If
End Sub
Private Sub txtLibPlaceCnt_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtLibPlaceCnt_Change()
  Changing

End Sub
Private Sub txtCafePlaceCnt_Validate(cancel As Boolean)
If txtCafePlaceCnt.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCafePlaceCnt.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCafePlaceCnt.SetFocus
  ElseIf Val(txtCafePlaceCnt.Text) <> CLng(Val(txtCafePlaceCnt.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtCafePlaceCnt.SetFocus
  End If
End If
End Sub
Private Sub txtCafePlaceCnt_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCafePlaceCnt_Change()
  Changing

End Sub
Private Sub txtWorkPlaceCnt_Validate(cancel As Boolean)
If txtWorkPlaceCnt.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWorkPlaceCnt.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWorkPlaceCnt.SetFocus
  ElseIf Val(txtWorkPlaceCnt.Text) <> CLng(Val(txtWorkPlaceCnt.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtWorkPlaceCnt.SetFocus
  End If
End If
End Sub
Private Sub txtWorkPlaceCnt_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWorkPlaceCnt_Change()
  Changing

End Sub
Private Sub CMDCategoryPicture_CLICK()
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
 Set imgCategoryPicture.Picture = LoadPicture(Dialog.FileName)
 Item.CategoryPicture = FileToArray(Dialog.FileName)
 Changing

End Sub
Private Sub cmdCategoryPicture_MenuClick(ByVal sCaption As String)

 Set imgCategoryPicture.Picture = LoadPicture()
 Item.CategoryPicture = Null
 Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = (LenB(Item.CategoryPicture) > 0)
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
txtName = Item.Name
  On Error Resume Next
txtAddr = Item.Addr
 LoadImage imgThePhoto, Item.ThePhoto
 LoadBtnPictures cmdThePhoto, cmdThePhoto.Tag
 cmdThePhoto.RemoveAllMenu
 cmdThePhoto.AddMenu "Очистить"
 LoadImage imgtheFlow3d, Item.theFlow3d
 LoadBtnPictures cmdtheFlow3d, cmdtheFlow3d.Tag
 cmdtheFlow3d.RemoveAllMenu
 cmdtheFlow3d.AddMenu "Очистить"
 LoadImage imgMapImage, Item.MapImage
 LoadBtnPictures cmdMapImage, cmdMapImage.Tag
 cmdMapImage.RemoveAllMenu
 cmdMapImage.AddMenu "Очистить"
txtInfo = Item.Info
  On Error Resume Next
txtThePhone = Item.ThePhone
  On Error Resume Next
txtTheFax = Item.TheFax
  On Error Resume Next
txtTotalS = Item.TotalS
txtBuildYear = Item.BuildYear
txtAudPlaceCnt = Item.AudPlaceCnt
txtCompPlaceCnt = Item.CompPlaceCnt
txtLibPlaceCnt = Item.LibPlaceCnt
txtCafePlaceCnt = Item.CafePlaceCnt
txtWorkPlaceCnt = Item.WorkPlaceCnt
 LoadImage imgCategoryPicture, Item.CategoryPicture
 LoadBtnPictures cmdCategoryPicture, cmdCategoryPicture.Tag
 cmdCategoryPicture.RemoveAllMenu
 cmdCategoryPicture.AddMenu "Очистить"
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

Item.Name = txtName
Item.Addr = txtAddr
 ' SEE cmdThePhoto_CLICK
 ' SEE cmdtheFlow3d_CLICK
 ' SEE cmdMapImage_CLICK
Item.Info = txtInfo
Item.ThePhone = txtThePhone
Item.TheFax = txtTheFax
Item.TotalS = txtTotalS
Item.BuildYear = CDbl(txtBuildYear)
Item.AudPlaceCnt = CDbl(txtAudPlaceCnt)
Item.CompPlaceCnt = CDbl(txtCompPlaceCnt)
Item.LibPlaceCnt = CDbl(txtLibPlaceCnt)
Item.CafePlaceCnt = CDbl(txtCafePlaceCnt)
Item.WorkPlaceCnt = CDbl(txtWorkPlaceCnt)
 ' SEE cmdCategoryPicture_CLICK
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



