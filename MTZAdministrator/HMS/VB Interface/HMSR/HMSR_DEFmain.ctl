VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl HMSR_DEFmain 
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
      Begin VB.ComboBox cmbNoRoomPage 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   20
         ToolTipText     =   "Не создавать страницу помещения"
         Top             =   2010
         Width           =   3000
      End
      Begin MSComDlg.CommonDialog Dialog 
         Left            =   3450
         Top             =   255
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MTZ_PANEL.DropButton cmdArrivalMap 
         Height          =   300
         Left            =   6000
         TabIndex        =   18
         Tag             =   "imageopen.ico"
         ToolTipText     =   "Основная картинка помещения"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtArrivalInstr 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   16
         ToolTipText     =   "Инструкция по проходу в помещение"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.TextBox txtTheInfo 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   14
         ToolTipText     =   "Описание"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdRTYPE 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип помещения"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtRTYPE 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Тип помещения"
         Top             =   3225
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txttheSqare 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Площадь помещения"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtTheName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   7
         ToolTipText     =   "Название"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtTheNum 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   5
         ToolTipText     =   "Номер помещения"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheFlow 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Этаж"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheFlow 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Этаж"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblNoRoomPage 
         BackStyle       =   0  'Transparent
         Caption         =   "Не создавать страницу помещения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   1680
         Width           =   3000
      End
      Begin VB.Image imgArrivalMap 
         BorderStyle     =   1  'Fixed Single
         Height          =   1200
         Left            =   3450
         Stretch         =   -1  'True
         ToolTipText     =   "Основная картинка помещения"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblArrivalMap 
         BackStyle       =   0  'Transparent
         Caption         =   "Основная картинка помещения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   17
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblArrivalInstr 
         BackStyle       =   0  'Transparent
         Caption         =   "Инструкция по проходу в помещение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblTheInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblRTYPE 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип помещения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lbltheSqare 
         BackStyle       =   0  'Transparent
         Caption         =   "Площадь помещения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер помещения:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheFlow 
         BackStyle       =   0  'Transparent
         Caption         =   "Этаж:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "HMSR_DEFmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean
 Dim m_ArrivalMap





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

Private Sub txtTheFlow_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheFlow_CLick()
  On Error Resume Next
     If txtTheFlow.Tag = "" Then
       cmdTheFlow_MenuClick "Выбрать"
     Else
       cmdTheFlow_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheFlow_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheFlow.Tag = ""
          txtTheFlow = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheFlow.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheFlow.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheFlow.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "HMSF")
        If OK Then
          txtTheFlow.Tag = Left(ID, 38)
          txtTheFlow = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim cancel As Boolean
        brief = "HMSF" & Now
        ook = findObject(Item.Application.Manager, "HMSF", ID, brief, cancel)
        If cancel Then
          Exit Sub
        End If
        If ook Then
              txtTheFlow.Tag = ID
              txtTheFlow = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "HMSF", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtTheFlow.Tag = obj.ID
              txtTheFlow = obj.brief
          Else
              txtTheFlow.Tag = ""
              txtTheFlow = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtTheNum_Change()
  Changing

End Sub
Private Sub txtTheName_Change()
  Changing

End Sub
Private Sub txttheSqare_Validate(cancel As Boolean)
If txttheSqare.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txttheSqare.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txttheSqare.SetFocus
  ElseIf Val(txttheSqare.Text) < -922337203685478# Or Val(txttheSqare.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txttheSqare.SetFocus
  End If
End If
End Sub
Private Sub txttheSqare_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txttheSqare_Change()
  Changing

End Sub
Private Sub txtRTYPE_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdRTYPE_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("HMSD_RTYPE", ID, brief) Then
          txtRTYPE.Tag = Left(ID, 38)
          txtRTYPE = brief
        End If
End Sub
Private Sub cmdRTYPE_MenuClick(ByVal sCaption As String)
          txtRTYPE.Tag = ""
          txtRTYPE = ""
End Sub
Private Sub txtTheInfo_Change()
  Changing

End Sub
Private Sub txtArrivalInstr_Change()
  Changing

End Sub
Private Sub CMDArrivalMap_CLICK()
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
 Set imgArrivalMap.Picture = LoadPicture(Dialog.FileName)
 Item.ArrivalMap = FileToArray(Dialog.FileName)
 Changing

End Sub
Private Sub cmdArrivalMap_MenuClick(ByVal sCaption As String)

 Set imgArrivalMap.Picture = LoadPicture()
 Item.ArrivalMap = Null
 Changing

End Sub
Private Sub cmbNoRoomPage_Click()
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

If mIsOK Then mIsOK = txtTheFlow.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtTheNum.Text)
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

If Not Item.TheFlow Is Nothing Then
  txtTheFlow.Tag = Item.TheFlow.ID
  txtTheFlow = Item.TheFlow.brief
Else
  txtTheFlow.Tag = ""
  txtTheFlow = ""
End If
 LoadBtnPictures cmdTheFlow, cmdTheFlow.Tag
  cmdTheFlow.RemoveAllMenu
  cmdTheFlow.AddMenu "Очистить"
  cmdTheFlow.AddMenu "Создать"
  cmdTheFlow.AddMenu "Выбрать"
  cmdTheFlow.AddMenu "Открыть"
  On Error Resume Next
txtTheNum = Item.TheNum
  On Error Resume Next
txtTheName = Item.TheName
txttheSqare = Item.theSqare
If Not Item.RTYPE Is Nothing Then
  txtRTYPE.Tag = Item.RTYPE.ID
  txtRTYPE = Item.RTYPE.brief
Else
  txtRTYPE.Tag = ""
  txtRTYPE = ""
End If
 LoadBtnPictures cmdRTYPE, cmdRTYPE.Tag
  cmdRTYPE.RemoveAllMenu
  cmdRTYPE.AddMenu "Очистить"
txtTheInfo = Item.TheInfo
txtArrivalInstr = Item.ArrivalInstr
 LoadImage imgArrivalMap, Item.ArrivalMap
 LoadBtnPictures cmdArrivalMap, cmdArrivalMap.Tag
 cmdArrivalMap.RemoveAllMenu
 cmdArrivalMap.AddMenu "Очистить"
cmbNoRoomPage.Clear
cmbNoRoomPage.AddItem "Да"
cmbNoRoomPage.ItemData(cmbNoRoomPage.NewIndex) = -1
cmbNoRoomPage.AddItem "Нет"
cmbNoRoomPage.ItemData(cmbNoRoomPage.NewIndex) = 0
 For iii = 0 To cmbNoRoomPage.ListCount - 1
  If Item.NoRoomPage = cmbNoRoomPage.ItemData(iii) Then
   cmbNoRoomPage.ListIndex = iii
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

If txtTheFlow.Tag <> "" Then
  Set Item.TheFlow = Item.Application.Manager.GetInstanceObject(txtTheFlow.Tag)
Else
  Set Item.TheFlow = Nothing
End If
Item.TheNum = txtTheNum
Item.TheName = txtTheName
Item.theSqare = CDbl(txttheSqare)
If txtRTYPE.Tag <> "" Then
  Set Item.RTYPE = Item.Application.FindRowObject("HMSD_RTYPE", txtRTYPE.Tag)
Else
  Set Item.RTYPE = Nothing
End If
Item.TheInfo = txtTheInfo
Item.ArrivalInstr = txtArrivalInstr
 ' SEE cmdArrivalMap_CLICK
 If cmbNoRoomPage.ListIndex >= 0 Then
   Item.NoRoomPage = cmbNoRoomPage.ItemData(cmbNoRoomPage.ListIndex)
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



