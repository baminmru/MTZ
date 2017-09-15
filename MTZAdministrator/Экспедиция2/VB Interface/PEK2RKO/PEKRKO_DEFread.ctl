VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKRKO_DEFread 
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
      Begin VB.TextBox txtCode1C 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   40
         TabIndex        =   24
         ToolTipText     =   "Код1С"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.ComboBox cmbCalcWithNDS 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   22
         ToolTipText     =   "Услуги с НДС"
         Top             =   405
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdEmpPayed 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Кто выдал"
         Top             =   6240
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtEmpPayed 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Кто выдал"
         Top             =   6240
         Width           =   2550
      End
      Begin VB.TextBox txtTheComment 
         Enabled         =   0   'False
         Height          =   1200
         Left            =   300
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   17
         ToolTipText     =   "Назначение платежа"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdFromClient 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "Клиент-получатель"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtFromClient 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "Клиент-получатель"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheDept 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "Из подразделения"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheDept 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Из подразделения"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdThePEKZ 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Заявка"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtThePEKZ 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Заявка"
         Top             =   2520
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtTheSumm 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "Сумма оплаты"
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
      Begin MSComCtl2.DTPicker dtpTheDate 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Дата оплаты"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   105447427
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtTheNumber 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   2
         ToolTipText     =   "Номер"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblCode1C 
         BackStyle       =   0  'Transparent
         Caption         =   "Код1С:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCalcWithNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Услуги с НДС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblEmpPayed 
         BackStyle       =   0  'Transparent
         Caption         =   "Кто выдал:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Назначение платежа:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFromClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент-получатель:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheDept 
         BackStyle       =   0  'Transparent
         Caption         =   "Из подразделения:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblThePEKZ 
         BackStyle       =   0  'Transparent
         Caption         =   "Заявка:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheSumm 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма оплаты:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата оплаты:"
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
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKRKO_DEFread"
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
Private Sub dtpTheDate_Change()
  Changing

End Sub
Private Sub txtTheSumm_Change()
  Changing

End Sub
Private Sub txtThePEKZ_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdThePEKZ_CLick()
  On Error Resume Next
     If txtThePEKZ.Tag = "" Then
     Else
       cmdThePEKZ_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdThePEKZ_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Открыть" Then
    If txtThePEKZ.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtThePEKZ.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtThePEKZ.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
End Sub
Private Sub txtTheDept_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDept_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdTheDept_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtFromClient_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFromClient_CLick()
  On Error Resume Next
     If txtFromClient.Tag = "" Then
     Else
       cmdFromClient_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdFromClient_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Открыть" Then
    If txtFromClient.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtFromClient.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtFromClient.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub txtEmpPayed_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdEmpPayed_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdEmpPayed_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmbCalcWithNDS_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCode1C_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(dtpTheDate.Value)
If mIsOK Then mIsOK = IsSet(txtTheSumm.Text)
If mIsOK Then mIsOK = txtTheDept.Tag <> ""
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
txtTheNumber = Item.TheNumber
dtpTheDate = Date
If Item.TheDate <> 0 Then
 dtpTheDate = Item.TheDate
End If
txtTheSumm = Item.TheSumm
If Not Item.ThePEKZ Is Nothing Then
  txtThePEKZ.Tag = Item.ThePEKZ.ID
  txtThePEKZ = Item.ThePEKZ.brief
Else
  txtThePEKZ.Tag = ""
  txtThePEKZ = ""
End If
 LoadBtnPictures cmdThePEKZ, cmdThePEKZ.Tag
  cmdThePEKZ.RemoveAllMenu
  cmdThePEKZ.AddMenu "Очистить"
  cmdThePEKZ.AddMenu "Открыть"
If Not Item.TheDept Is Nothing Then
  txtTheDept.Tag = Item.TheDept.ID
  txtTheDept = Item.TheDept.brief
Else
  txtTheDept.Tag = ""
  txtTheDept = ""
End If
 LoadBtnPictures cmdTheDept, cmdTheDept.Tag
  cmdTheDept.RemoveAllMenu
  cmdTheDept.AddMenu "Очистить"
If Not Item.FromClient Is Nothing Then
  txtFromClient.Tag = Item.FromClient.ID
  txtFromClient = Item.FromClient.brief
Else
  txtFromClient.Tag = ""
  txtFromClient = ""
End If
 LoadBtnPictures cmdFromClient, cmdFromClient.Tag
  cmdFromClient.RemoveAllMenu
  cmdFromClient.AddMenu "Очистить"
  cmdFromClient.AddMenu "Открыть"
txtTheComment = Item.TheComment
If Not Item.EmpPayed Is Nothing Then
  txtEmpPayed.Tag = Item.EmpPayed.ID
  txtEmpPayed = Item.EmpPayed.brief
Else
  txtEmpPayed.Tag = ""
  txtEmpPayed = ""
End If
 LoadBtnPictures cmdEmpPayed, cmdEmpPayed.Tag
  cmdEmpPayed.RemoveAllMenu
  cmdEmpPayed.AddMenu "Очистить"
cmbCalcWithNDS.Clear
cmbCalcWithNDS.AddItem "Да"
cmbCalcWithNDS.ItemData(cmbCalcWithNDS.NewIndex) = -1
cmbCalcWithNDS.AddItem "Нет"
cmbCalcWithNDS.ItemData(cmbCalcWithNDS.NewIndex) = 0
 For iii = 0 To cmbCalcWithNDS.ListCount - 1
  If Item.CalcWithNDS = cmbCalcWithNDS.ItemData(iii) Then
   cmbCalcWithNDS.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtCode1C = Item.Code1C
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

 If cmbCalcWithNDS.ListIndex >= 0 Then
   Item.CalcWithNDS = cmbCalcWithNDS.ItemData(cmbCalcWithNDS.ListIndex)
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



