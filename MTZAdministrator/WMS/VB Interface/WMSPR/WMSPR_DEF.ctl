VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl WMSPR_DEF 
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
      Begin MSMask.MaskEdBox txtWeightDelta 
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         ToolTipText     =   "Расхождение по весу"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSComCtl2.DTPicker dtpTheDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         ToolTipText     =   "Дата протокола"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   34144259
         CurrentDate     =   39482
      End
      Begin VB.TextBox txtClient 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   27
         ToolTipText     =   "Поклажедатель"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtBrak 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   30
         TabIndex        =   25
         ToolTipText     =   "Брак"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtKillPlace 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   23
         ToolTipText     =   "Бойня"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFactory 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   21
         ToolTipText     =   "Завод"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtCountry 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   19
         ToolTipText     =   "Страна"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txttheDescription 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   17
         ToolTipText     =   "Описание товара"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtGood 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   15
         ToolTipText     =   "Товар"
         Top             =   4635
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtVesi 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Погрешность весов"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtMoroz 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Расчетная выморозка"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtOutWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Вес отгрузок"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtInWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Вес при приемке"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtPoddon 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   5
         ToolTipText     =   "Поддон"
         Top             =   1110
         Width           =   3000
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
      Begin VB.Label lblWeightDelta 
         BackStyle       =   0  'Transparent
         Caption         =   "Расхождение по весу:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата протокола:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Поклажедатель:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblBrak 
         BackStyle       =   0  'Transparent
         Caption         =   "Брак:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblKillPlace 
         BackStyle       =   0  'Transparent
         Caption         =   "Бойня:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFactory 
         BackStyle       =   0  'Transparent
         Caption         =   "Завод:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblCountry 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lbltheDescription 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание товара:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblGood 
         BackStyle       =   0  'Transparent
         Caption         =   "Товар:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblVesi 
         BackStyle       =   0  'Transparent
         Caption         =   "Погрешность весов:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblMoroz 
         BackStyle       =   0  'Transparent
         Caption         =   "Расчетная выморозка:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblOutWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес отгрузок:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblInWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес при приемке:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPoddon 
         BackStyle       =   0  'Transparent
         Caption         =   "Поддон:"
         Enabled         =   0   'False
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
Attribute VB_Name = "WMSPR_DEF"
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
Private Sub txtPoddon_Change()
  Changing

End Sub
Private Sub txtInWeight_Change()
  Changing

End Sub
Private Sub txtOutWeight_Change()
  Changing

End Sub
Private Sub txtMoroz_Change()
  Changing

End Sub
Private Sub txtVesi_Change()
  Changing

End Sub
Private Sub txtGood_Change()
  Changing

End Sub
Private Sub txttheDescription_Change()
  Changing

End Sub
Private Sub txtCountry_Change()
  Changing

End Sub
Private Sub txtFactory_Change()
  Changing

End Sub
Private Sub txtKillPlace_Change()
  Changing

End Sub
Private Sub txtBrak_Change()
  Changing

End Sub
Private Sub txtClient_Change()
  Changing

End Sub
Private Sub dtpTheDate_Change()
  Changing

End Sub
Private Sub txtWeightDelta_Change()
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
If mIsOK Then mIsOK = IsSet(txtPoddon.Text)
If mIsOK Then mIsOK = IsSet(txtInWeight.Text)
If mIsOK Then mIsOK = IsSet(txtOutWeight.Text)
If mIsOK Then mIsOK = IsSet(txtMoroz.Text)
If mIsOK Then mIsOK = IsSet(txtVesi.Text)
If mIsOK Then mIsOK = IsSet(txtGood.Text)
If mIsOK Then mIsOK = IsSet(dtpTheDate.Value)
If mIsOK Then mIsOK = IsSet(txtWeightDelta.Text)
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
  On Error Resume Next
txtPoddon = Item.Poddon
txtInWeight = Item.InWeight
txtOutWeight = Item.OutWeight
txtMoroz = Item.Moroz
txtVesi = Item.Vesi
  On Error Resume Next
txtGood = Item.Good
  On Error Resume Next
txttheDescription = Item.theDescription
  On Error Resume Next
txtCountry = Item.Country
  On Error Resume Next
txtFactory = Item.Factory
  On Error Resume Next
txtKillPlace = Item.KillPlace
  On Error Resume Next
txtBrak = Item.Brak
  On Error Resume Next
txtClient = Item.Client
dtpTheDate = Date
If Item.TheDate <> 0 Then
 dtpTheDate = Item.TheDate
End If
txtWeightDelta = Item.WeightDelta
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



