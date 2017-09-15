VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PEK103_DEFmain 
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
      Begin MTZ_PANEL.DropButton cmdThePath 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Строка маршрута"
         Top             =   6435
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtThePath 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Строка маршрута"
         Top             =   6435
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdPEKZ 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Заявка"
         Top             =   5730
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtPEKZ 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Заявка"
         Top             =   5730
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpNodeDate 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Дата приемки "
         Top             =   5025
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   103677955
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtComent 
         Enabled         =   0   'False
         Height          =   1200
         Left            =   300
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   8
         ToolTipText     =   "Примечание"
         Top             =   3420
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpRcvDate 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "Дата подачи заявки"
         Top             =   2715
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   103677955
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtSender 
         Enabled         =   0   'False
         Height          =   1200
         Left            =   300
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   4
         ToolTipText     =   "Отправитель"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Номер"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblThePath 
         BackStyle       =   0  'Transparent
         Caption         =   "Строка маршрута:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   6105
         Width           =   3000
      End
      Begin VB.Label lblPEKZ 
         BackStyle       =   0  'Transparent
         Caption         =   "Заявка:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   5400
         Width           =   3000
      End
      Begin VB.Label lblNodeDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата приемки :"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   4695
         Width           =   3000
      End
      Begin VB.Label lblComent 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblRcvDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата подачи заявки:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   2385
         Width           =   3000
      End
      Begin VB.Label lblSender 
         BackStyle       =   0  'Transparent
         Caption         =   "Отправитель:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEK103_DEFmain"
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

Private Sub txtTheNumber_Change()
  Changing

End Sub
Private Sub txtSender_Change()
  Changing

End Sub
Private Sub dtpRcvDate_Change()
  Changing

End Sub
Private Sub txtComent_Change()
  Changing

End Sub
Private Sub dtpNodeDate_Change()
  Changing

End Sub
Private Sub txtPEKZ_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPEKZ_CLick()
  On Error Resume Next
     If txtPEKZ.Tag = "" Then
     Else
       cmdPEKZ_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdPEKZ_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Открыть" Then
    If txtPEKZ.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtPEKZ.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtPEKZ.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
End Sub
Private Sub txtThePath_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdThePath_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdThePath_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtTheNumber.Text)
If mIsOK Then mIsOK = IsSet(txtSender.Text)
If mIsOK Then mIsOK = IsSet(dtpRcvDate.Value)
If mIsOK Then mIsOK = txtPEKZ.Tag <> ""
If mIsOK Then mIsOK = txtThePath.Tag <> ""
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

txtTheNumber = Item.TheNumber
txtSender = Item.Sender
dtpRcvDate = Date
If Item.RcvDate <> 0 Then
 dtpRcvDate = Item.RcvDate
End If
txtComent = Item.Coment
dtpNodeDate = Date
If Item.NodeDate <> 0 Then
 dtpNodeDate = Item.NodeDate
Else
 dtpNodeDate.Value = Null
End If
If Not Item.PEKZ Is Nothing Then
  txtPEKZ.Tag = Item.PEKZ.ID
  txtPEKZ = Item.PEKZ.brief
Else
  txtPEKZ.Tag = ""
  txtPEKZ = ""
End If
 LoadBtnPictures cmdPEKZ, cmdPEKZ.Tag
  cmdPEKZ.RemoveAllMenu
  cmdPEKZ.AddMenu "Очистить"
  cmdPEKZ.AddMenu "Открыть"
If Not Item.ThePath Is Nothing Then
  txtThePath.Tag = Item.ThePath.ID
  txtThePath = Item.ThePath.brief
Else
  txtThePath.Tag = ""
  txtThePath = ""
End If
 LoadBtnPictures cmdThePath, cmdThePath.Tag
  cmdThePath.RemoveAllMenu
  cmdThePath.AddMenu "Очистить"
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



