VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKTRF_AUTOmain 
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
      Begin MSMask.MaskEdBox txtHourPrice 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Стоимость часа"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtLengthPrice 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Стоимость за км"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.ComboBox cmbByLength 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "От расстояния"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbForTime 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   5
         ToolTipText     =   "За время"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdAutoType 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип автотранспорта"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtAutoType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Тип автотранспорта"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblHourPrice 
         BackStyle       =   0  'Transparent
         Caption         =   "Стоимость часа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblLengthPrice 
         BackStyle       =   0  'Transparent
         Caption         =   "Стоимость за км:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblByLength 
         BackStyle       =   0  'Transparent
         Caption         =   "От расстояния:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblForTime 
         BackStyle       =   0  'Transparent
         Caption         =   "За время:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblAutoType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип автотранспорта:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKTRF_AUTOmain"
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

Private Sub txtAutoType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdAutoType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_AUTO", ID, brief) Then
          txtAutoType.Tag = Left(ID, 38)
          txtAutoType = brief
        End If
End Sub
Private Sub cmdAutoType_MenuClick(ByVal sCaption As String)
          txtAutoType.Tag = ""
          txtAutoType = ""
End Sub
Private Sub cmbForTime_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbByLength_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtLengthPrice_Validate(cancel As Boolean)
If txtLengthPrice.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtLengthPrice.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtLengthPrice.SetFocus
  ElseIf Val(txtLengthPrice.Text) < -922337203685478# Or Val(txtLengthPrice.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtLengthPrice.SetFocus
  End If
End If
End Sub
Private Sub txtLengthPrice_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtLengthPrice_Change()
  Changing

End Sub
Private Sub txtHourPrice_Validate(cancel As Boolean)
If txtHourPrice.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtHourPrice.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtHourPrice.SetFocus
  ElseIf Val(txtHourPrice.Text) < -922337203685478# Or Val(txtHourPrice.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtHourPrice.SetFocus
  End If
End If
End Sub
Private Sub txtHourPrice_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtHourPrice_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtAutoType.Tag <> ""
If mIsOK Then mIsOK = (cmbForTime.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbByLength.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(txtLengthPrice.Text)
If mIsOK Then mIsOK = IsSet(txtHourPrice.Text)
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

If Not Item.AutoType Is Nothing Then
  txtAutoType.Tag = Item.AutoType.ID
  txtAutoType = Item.AutoType.brief
Else
  txtAutoType.Tag = ""
  txtAutoType = ""
End If
 LoadBtnPictures cmdAutoType, cmdAutoType.Tag
  cmdAutoType.RemoveAllMenu
  cmdAutoType.AddMenu "Очистить"
cmbForTime.Clear
cmbForTime.AddItem "Да"
cmbForTime.ItemData(cmbForTime.NewIndex) = -1
cmbForTime.AddItem "Нет"
cmbForTime.ItemData(cmbForTime.NewIndex) = 0
 For iii = 0 To cmbForTime.ListCount - 1
  If Item.ForTime = cmbForTime.ItemData(iii) Then
   cmbForTime.ListIndex = iii
   Exit For
  End If
 Next
cmbByLength.Clear
cmbByLength.AddItem "Да"
cmbByLength.ItemData(cmbByLength.NewIndex) = -1
cmbByLength.AddItem "Нет"
cmbByLength.ItemData(cmbByLength.NewIndex) = 0
 For iii = 0 To cmbByLength.ListCount - 1
  If Item.ByLength = cmbByLength.ItemData(iii) Then
   cmbByLength.ListIndex = iii
   Exit For
  End If
 Next
txtLengthPrice = Item.LengthPrice
txtHourPrice = Item.HourPrice
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

If txtAutoType.Tag <> "" Then
  Set Item.AutoType = Item.Application.FindRowObject("PEKD_AUTO", txtAutoType.Tag)
Else
  Set Item.AutoType = Nothing
End If
 If cmbForTime.ListIndex >= 0 Then
   Item.ForTime = cmbForTime.ItemData(cmbForTime.ListIndex)
 End If
 If cmbByLength.ListIndex >= 0 Then
   Item.ByLength = cmbByLength.ItemData(cmbByLength.ListIndex)
 End If
Item.LengthPrice = CDbl(txtLengthPrice)
Item.HourPrice = CDbl(txtHourPrice)
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



