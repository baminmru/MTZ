VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKL_WDAY 
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
      Begin VB.TextBox txtthe_Description 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   18
         ToolTipText     =   "Описание"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdWeightEDIZM 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм. веса"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtWeightEDIZM 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Ед. изм. веса"
         Top             =   3930
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtWeightValue 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Вес"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdTheValueEDIZM 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм. Объема"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheValueEDIZM 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Ед. изм. Объема"
         Top             =   2520
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtTheValue 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Объем"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdGOTYPE 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип СГО"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtGOTYPE 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Тип СГО"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTrain 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поезд"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTrain 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Поезд"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblthe_Description 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblWeightEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм. веса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblWeightValue 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTheValueEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм. Объема:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheValue 
         BackStyle       =   0  'Transparent
         Caption         =   "Объем:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblGOTYPE 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип СГО:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTrain 
         BackStyle       =   0  'Transparent
         Caption         =   "Поезд:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKL_WDAY"
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

Private Sub txtTrain_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTrain_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_TRAINS", ID, brief) Then
          txtTrain.Tag = Left(ID, 38)
          txtTrain = brief
        End If
End Sub
Private Sub cmdTrain_MenuClick(ByVal sCaption As String)
          txtTrain.Tag = ""
          txtTrain = ""
End Sub
Private Sub txtGOTYPE_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdGOTYPE_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_GOTYPE", ID, brief) Then
          txtGOTYPE.Tag = Left(ID, 38)
          txtGOTYPE = brief
        End If
End Sub
Private Sub cmdGOTYPE_MenuClick(ByVal sCaption As String)
          txtGOTYPE.Tag = ""
          txtGOTYPE = ""
End Sub
Private Sub txtTheValue_Validate(cancel As Boolean)
If txtTheValue.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheValue.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheValue.SetFocus
  ElseIf Val(txtTheValue.Text) < -922337203685478# Or Val(txtTheValue.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTheValue.SetFocus
  End If
End If
End Sub
Private Sub txtTheValue_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheValue_Change()
  Changing

End Sub
Private Sub txtTheValueEDIZM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheValueEDIZM_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_EDIZM", ID, brief) Then
          txtTheValueEDIZM.Tag = Left(ID, 38)
          txtTheValueEDIZM = brief
        End If
End Sub
Private Sub cmdTheValueEDIZM_MenuClick(ByVal sCaption As String)
          txtTheValueEDIZM.Tag = ""
          txtTheValueEDIZM = ""
End Sub
Private Sub txtWeightValue_Validate(cancel As Boolean)
If txtWeightValue.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeightValue.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtWeightValue.SetFocus
  ElseIf Val(txtWeightValue.Text) < -922337203685478# Or Val(txtWeightValue.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtWeightValue.SetFocus
  End If
End If
End Sub
Private Sub txtWeightValue_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeightValue_Change()
  Changing

End Sub
Private Sub txtWeightEDIZM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdWeightEDIZM_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_EDIZM", ID, brief) Then
          txtWeightEDIZM.Tag = Left(ID, 38)
          txtWeightEDIZM = brief
        End If
End Sub
Private Sub cmdWeightEDIZM_MenuClick(ByVal sCaption As String)
          txtWeightEDIZM.Tag = ""
          txtWeightEDIZM = ""
End Sub
Private Sub txtthe_Description_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtTrain.Tag <> ""
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

If Not Item.Train Is Nothing Then
  txtTrain.Tag = Item.Train.ID
  txtTrain = Item.Train.brief
Else
  txtTrain.Tag = ""
  txtTrain = ""
End If
 LoadBtnPictures cmdTrain, cmdTrain.Tag
  cmdTrain.RemoveAllMenu
  cmdTrain.AddMenu "Очистить"
If Not Item.GOTYPE Is Nothing Then
  txtGOTYPE.Tag = Item.GOTYPE.ID
  txtGOTYPE = Item.GOTYPE.brief
Else
  txtGOTYPE.Tag = ""
  txtGOTYPE = ""
End If
 LoadBtnPictures cmdGOTYPE, cmdGOTYPE.Tag
  cmdGOTYPE.RemoveAllMenu
  cmdGOTYPE.AddMenu "Очистить"
txtTheValue = Item.TheValue
If Not Item.TheValueEDIZM Is Nothing Then
  txtTheValueEDIZM.Tag = Item.TheValueEDIZM.ID
  txtTheValueEDIZM = Item.TheValueEDIZM.brief
Else
  txtTheValueEDIZM.Tag = ""
  txtTheValueEDIZM = ""
End If
 LoadBtnPictures cmdTheValueEDIZM, cmdTheValueEDIZM.Tag
  cmdTheValueEDIZM.RemoveAllMenu
  cmdTheValueEDIZM.AddMenu "Очистить"
txtWeightValue = Item.WeightValue
If Not Item.WeightEDIZM Is Nothing Then
  txtWeightEDIZM.Tag = Item.WeightEDIZM.ID
  txtWeightEDIZM = Item.WeightEDIZM.brief
Else
  txtWeightEDIZM.Tag = ""
  txtWeightEDIZM = ""
End If
 LoadBtnPictures cmdWeightEDIZM, cmdWeightEDIZM.Tag
  cmdWeightEDIZM.RemoveAllMenu
  cmdWeightEDIZM.AddMenu "Очистить"
txtthe_Description = Item.the_Description
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

If txtTrain.Tag <> "" Then
  Set Item.Train = Item.Application.FindRowObject("PEKD_TRAINS", txtTrain.Tag)
Else
  Set Item.Train = Nothing
End If
If txtGOTYPE.Tag <> "" Then
  Set Item.GOTYPE = Item.Application.FindRowObject("PEKD_GOTYPE", txtGOTYPE.Tag)
Else
  Set Item.GOTYPE = Nothing
End If
Item.TheValue = CDbl(txtTheValue)
If txtTheValueEDIZM.Tag <> "" Then
  Set Item.TheValueEDIZM = Item.Application.FindRowObject("ENTDIC_EDIZM", txtTheValueEDIZM.Tag)
Else
  Set Item.TheValueEDIZM = Nothing
End If
Item.WeightValue = CDbl(txtWeightValue)
If txtWeightEDIZM.Tag <> "" Then
  Set Item.WeightEDIZM = Item.Application.FindRowObject("ENTDIC_EDIZM", txtWeightEDIZM.Tag)
Else
  Set Item.WeightEDIZM = Nothing
End If
Item.the_Description = txtthe_Description
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



