VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKD_DIRSTATIONmain 
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
      Begin MSMask.MaskEdBox txtVolSwitchWeightSup 
         Height          =   300
         Left            =   300
         TabIndex        =   16
         ToolTipText     =   "Минимальная плотность (поставщик)"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtVolSwitchWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Минимальная плотность (клиент)"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdTheNextTown 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "Город"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheNextTown 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Город"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.TextBox txtarea 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   9
         ToolTipText     =   "Район"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdregion 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Регион"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtregion 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Регион"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.TextBox txtPOSTINDEX 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   4
         ToolTipText     =   "Индекс отделения"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtname 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblVolSwitchWeightSup 
         BackStyle       =   0  'Transparent
         Caption         =   "Минимальная плотность (поставщик):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblVolSwitchWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Минимальная плотность (клиент):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheNextTown 
         BackStyle       =   0  'Transparent
         Caption         =   "Город:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblarea 
         BackStyle       =   0  'Transparent
         Caption         =   "Район:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblregion 
         BackStyle       =   0  'Transparent
         Caption         =   "Регион:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPOSTINDEX 
         BackStyle       =   0  'Transparent
         Caption         =   "Индекс отделения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblname 
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
Attribute VB_Name = "PEKD_DIRSTATIONmain"
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

Private Sub txtname_Change()
  Changing

End Sub
Private Sub txtPOSTINDEX_Change()
  Changing

End Sub
Private Sub txtregion_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdregion_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_REGION", ID, brief) Then
          txtregion.Tag = Left(ID, 38)
          txtregion = brief
        End If
End Sub
Private Sub cmdregion_MenuClick(ByVal sCaption As String)
          txtregion.Tag = ""
          txtregion = ""
End Sub
Private Sub txtarea_Change()
  Changing

End Sub
Private Sub txtTheNextTown_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheNextTown_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_TOWN", ID, brief) Then
          txtTheNextTown.Tag = Left(ID, 38)
          txtTheNextTown = brief
        End If
End Sub
Private Sub cmdTheNextTown_MenuClick(ByVal sCaption As String)
          txtTheNextTown.Tag = ""
          txtTheNextTown = ""
End Sub
Private Sub txtVolSwitchWeight_Validate(cancel As Boolean)
If txtVolSwitchWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtVolSwitchWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtVolSwitchWeight.SetFocus
  ElseIf Val(txtVolSwitchWeight.Text) < -922337203685478# Or Val(txtVolSwitchWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtVolSwitchWeight.SetFocus
  End If
End If
End Sub
Private Sub txtVolSwitchWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtVolSwitchWeight_Change()
  Changing

End Sub
Private Sub txtVolSwitchWeightSup_Validate(cancel As Boolean)
If txtVolSwitchWeightSup.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtVolSwitchWeightSup.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtVolSwitchWeightSup.SetFocus
  ElseIf Val(txtVolSwitchWeightSup.Text) < -922337203685478# Or Val(txtVolSwitchWeightSup.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtVolSwitchWeightSup.SetFocus
  End If
End If
End Sub
Private Sub txtVolSwitchWeightSup_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtVolSwitchWeightSup_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtname.Text)
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
txtname = Item.Name
  On Error Resume Next
txtPOSTINDEX = Item.POSTINDEX
If Not Item.region Is Nothing Then
  txtregion.Tag = Item.region.ID
  txtregion = Item.region.brief
Else
  txtregion.Tag = ""
  txtregion = ""
End If
 LoadBtnPictures cmdregion, cmdregion.Tag
  cmdregion.RemoveAllMenu
  cmdregion.AddMenu "Очистить"
  On Error Resume Next
txtarea = Item.area
If Not Item.TheNextTown Is Nothing Then
  txtTheNextTown.Tag = Item.TheNextTown.ID
  txtTheNextTown = Item.TheNextTown.brief
Else
  txtTheNextTown.Tag = ""
  txtTheNextTown = ""
End If
 LoadBtnPictures cmdTheNextTown, cmdTheNextTown.Tag
  cmdTheNextTown.RemoveAllMenu
  cmdTheNextTown.AddMenu "Очистить"
txtVolSwitchWeight = Item.VolSwitchWeight
txtVolSwitchWeightSup = Item.VolSwitchWeightSup
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

Item.Name = txtname
Item.POSTINDEX = txtPOSTINDEX
If txtregion.Tag <> "" Then
  Set Item.region = Item.Application.FindRowObject("ENTDIC_REGION", txtregion.Tag)
Else
  Set Item.region = Nothing
End If
Item.area = txtarea
If txtTheNextTown.Tag <> "" Then
  Set Item.TheNextTown = Item.Application.FindRowObject("ENTDIC_TOWN", txtTheNextTown.Tag)
Else
  Set Item.TheNextTown = Nothing
End If
Item.VolSwitchWeight = CDbl(txtVolSwitchWeight)
Item.VolSwitchWeightSup = CDbl(txtVolSwitchWeightSup)
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



