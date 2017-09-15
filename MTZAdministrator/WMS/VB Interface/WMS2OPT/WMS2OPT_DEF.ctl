VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WMS2OPT_DEF 
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
      Begin MSComCtl2.DTPicker dtpDateToOptimize 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Плановая дата оптимизации"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   85131267
         CurrentDate     =   39482
      End
      Begin MSComCtl2.DTPicker dtpOPtDate 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Дата создания заявки"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   85131267
         CurrentDate     =   39482
      End
      Begin MTZ_PANEL.DropButton cmdTheRule 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Правило формирования партий"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheRule 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Правило формирования партий"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdOptType 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип оптимизации"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOptType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Тип оптимизации"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdwarehouse 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Склад"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtwarehouse 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Склад"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblDateToOptimize 
         BackStyle       =   0  'Transparent
         Caption         =   "Плановая дата оптимизации:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblOPtDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата создания заявки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheRule 
         BackStyle       =   0  'Transparent
         Caption         =   "Правило формирования партий:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblOptType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип оптимизации:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblwarehouse 
         BackStyle       =   0  'Transparent
         Caption         =   "Склад:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMS2OPT_DEF"
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

Private Sub txtwarehouse_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdwarehouse_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_WH", ID, brief) Then
          txtwarehouse.Tag = Left(ID, 38)
          txtwarehouse = brief
        End If
End Sub
Private Sub cmdwarehouse_MenuClick(ByVal sCaption As String)
          txtwarehouse.Tag = ""
          txtwarehouse = ""
End Sub
Private Sub txtOptType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdOptType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_OPTTYPE", ID, brief) Then
          txtOptType.Tag = Left(ID, 38)
          txtOptType = brief
        End If
End Sub
Private Sub cmdOptType_MenuClick(ByVal sCaption As String)
          txtOptType.Tag = ""
          txtOptType = ""
End Sub
Private Sub txtTheRule_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheRule_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_RULE", ID, brief) Then
          txtTheRule.Tag = Left(ID, 38)
          txtTheRule = brief
        End If
End Sub
Private Sub cmdTheRule_MenuClick(ByVal sCaption As String)
          txtTheRule.Tag = ""
          txtTheRule = ""
End Sub
Private Sub dtpOPtDate_Change()
  Changing

End Sub
Private Sub dtpDateToOptimize_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtwarehouse.Tag <> ""
If mIsOK Then mIsOK = txtOptType.Tag <> ""
If mIsOK Then mIsOK = txtTheRule.Tag <> ""
If mIsOK Then mIsOK = IsSet(dtpOPtDate.Value)
If mIsOK Then mIsOK = IsSet(dtpDateToOptimize.Value)
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

If Not Item.warehouse Is Nothing Then
  txtwarehouse.Tag = Item.warehouse.ID
  txtwarehouse = Item.warehouse.brief
Else
  txtwarehouse.Tag = ""
  txtwarehouse = ""
End If
 LoadBtnPictures cmdwarehouse, cmdwarehouse.Tag
  cmdwarehouse.RemoveAllMenu
  cmdwarehouse.AddMenu "Очистить"
If Not Item.OptType Is Nothing Then
  txtOptType.Tag = Item.OptType.ID
  txtOptType = Item.OptType.brief
Else
  txtOptType.Tag = ""
  txtOptType = ""
End If
 LoadBtnPictures cmdOptType, cmdOptType.Tag
  cmdOptType.RemoveAllMenu
  cmdOptType.AddMenu "Очистить"
If Not Item.TheRule Is Nothing Then
  txtTheRule.Tag = Item.TheRule.ID
  txtTheRule = Item.TheRule.brief
Else
  txtTheRule.Tag = ""
  txtTheRule = ""
End If
 LoadBtnPictures cmdTheRule, cmdTheRule.Tag
  cmdTheRule.RemoveAllMenu
  cmdTheRule.AddMenu "Очистить"
dtpOPtDate = Date
If Item.OPtDate <> 0 Then
 dtpOPtDate = Item.OPtDate
End If
dtpDateToOptimize = Date
If Item.DateToOptimize <> 0 Then
 dtpDateToOptimize = Item.DateToOptimize
End If
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

If txtwarehouse.Tag <> "" Then
  Set Item.warehouse = Item.Application.FindRowObject("WMSD_WH", txtwarehouse.Tag)
Else
  Set Item.warehouse = Nothing
End If
If txtOptType.Tag <> "" Then
  Set Item.OptType = Item.Application.FindRowObject("WMSD_OPTTYPE", txtOptType.Tag)
Else
  Set Item.OptType = Nothing
End If
If txtTheRule.Tag <> "" Then
  Set Item.TheRule = Item.Application.FindRowObject("WMSD_RULE", txtTheRule.Tag)
Else
  Set Item.TheRule = Nothing
End If
  If IsNull(dtpOPtDate) Then
    Item.OPtDate = 0
  Else
    Item.OPtDate = dtpOPtDate.Value
  End If
  If IsNull(dtpDateToOptimize) Then
    Item.DateToOptimize = 0
  Else
    Item.DateToOptimize = dtpDateToOptimize.Value
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



