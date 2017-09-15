VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKP_DEF 
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
         Height          =   300
         Left            =   3450
         MaxLength       =   40
         TabIndex        =   22
         ToolTipText     =   "Код1С"
         Top             =   405
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheDept 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Подразделение"
         Top             =   6240
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDept 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Подразделение"
         Top             =   6240
         Width           =   2550
      End
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   17
         ToolTipText     =   "Назначение платежа"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheDogovor 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "К договору"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDogovor 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "К договору"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheCurrncy 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "Валюта"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCurrncy 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Валюта"
         Top             =   3225
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtPLPSumm 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Сумма"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSComCtl2.DTPicker dtpPLPDate 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Дата документа"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71892995
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtPLPNUM 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   5
         ToolTipText     =   "№ документа"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdFromClient 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Клиент"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFromClient 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Клиент"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblCode1C 
         BackStyle       =   0  'Transparent
         Caption         =   "Код1С:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblTheDept 
         BackStyle       =   0  'Transparent
         Caption         =   "Подразделение:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Назначение платежа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheDogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "К договору:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheCurrncy 
         BackStyle       =   0  'Transparent
         Caption         =   "Валюта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblPLPSumm 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPLPDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата документа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPLPNUM 
         BackStyle       =   0  'Transparent
         Caption         =   "№ документа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFromClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKP_DEF"
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

Private Sub txtFromClient_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFromClient_CLick()
  On Error Resume Next
     If txtFromClient.Tag = "" Then
       cmdFromClient_MenuClick "Выбрать"
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
  If sCaption = "Очистить" Then
          txtFromClient.Tag = ""
          txtFromClient = ""
  End If
  If sCaption = "Открыть" Then
    If txtFromClient.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtFromClient.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtFromClient.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2", "STATUSNAME <>'В Архиве'  and VRCCommonInfo_MarkToDelete='Нет' ")
        If OK Then
          txtFromClient.Tag = Left(ID, 38)
          txtFromClient = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRC2" & Now
        ook = findObject(Item.Application.Manager, "VRC2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtFromClient.Tag = ID
              txtFromClient = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRC2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtFromClient.Tag = obj.ID
              txtFromClient = obj.brief
          Else
              txtFromClient.Tag = ""
              txtFromClient = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtPLPNUM_Change()
  Changing

End Sub
Private Sub dtpPLPDate_Change()
  Changing

End Sub
Private Sub txtPLPSumm_Validate(Cancel As Boolean)
If txtPLPSumm.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPLPSumm.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPLPSumm.SetFocus
  ElseIf Val(txtPLPSumm.Text) < -922337203685478# Or Val(txtPLPSumm.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPLPSumm.SetFocus
  End If
End If
End Sub
Private Sub txtPLPSumm_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPLPSumm_Change()
  Changing

End Sub
Private Sub txtTheCurrncy_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCurrncy_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_CURRENCY", ID, brief) Then
          txtTheCurrncy.Tag = Left(ID, 38)
          txtTheCurrncy = brief
        End If
End Sub
Private Sub cmdTheCurrncy_MenuClick(ByVal sCaption As String)
          txtTheCurrncy.Tag = ""
          txtTheCurrncy = ""
End Sub
Private Sub txtTheDogovor_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDogovor_CLick()
  On Error Resume Next
     If txtTheDogovor.Tag = "" Then
       cmdTheDogovor_MenuClick "Выбрать"
     Else
       cmdTheDogovor_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheDogovor_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheDogovor.Tag = ""
          txtTheDogovor = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheDogovor.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheDogovor.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheDogovor.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRDG2", IIf(txtFromClient.Tag = "", "VRDGCOMMON_CLIENT_ID is null ", "VRDGCOMMON_CLIENT_ID='" & txtFromClient.Tag & "'  and STATUSNAME in ('Оформлен','Подписан','Исполнен') "))
        If OK Then
          txtTheDogovor.Tag = Left(ID, 38)
          txtTheDogovor = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRDG2" & Now
        ook = findObject(Item.Application.Manager, "VRDG2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtTheDogovor.Tag = ID
              txtTheDogovor = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRDG2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtTheDogovor.Tag = obj.ID
              txtTheDogovor = obj.brief
          Else
              txtTheDogovor.Tag = ""
              txtTheDogovor = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub txtTheDept_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDept_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DEPT", ID, brief) Then
          txtTheDept.Tag = Left(ID, 38)
          txtTheDept = brief
        End If
End Sub
Private Sub cmdTheDept_MenuClick(ByVal sCaption As String)
          txtTheDept.Tag = ""
          txtTheDept = ""
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

If mIsOK Then mIsOK = txtFromClient.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtPLPNUM.Text)
If mIsOK Then mIsOK = IsSet(dtpPLPDate.Value)
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
  cmdFromClient.AddMenu "Создать"
  cmdFromClient.AddMenu "Выбрать"
  cmdFromClient.AddMenu "Открыть"
  On Error Resume Next
txtPLPNUM = Item.PLPNUM
dtpPLPDate = Date
If Item.PLPDate <> 0 Then
 dtpPLPDate = Item.PLPDate
End If
txtPLPSumm = Item.PLPSumm
If Not Item.TheCurrncy Is Nothing Then
  txtTheCurrncy.Tag = Item.TheCurrncy.ID
  txtTheCurrncy = Item.TheCurrncy.brief
Else
  txtTheCurrncy.Tag = ""
  txtTheCurrncy = ""
End If
 LoadBtnPictures cmdTheCurrncy, cmdTheCurrncy.Tag
  cmdTheCurrncy.RemoveAllMenu
  cmdTheCurrncy.AddMenu "Очистить"
If Not Item.TheDogovor Is Nothing Then
  txtTheDogovor.Tag = Item.TheDogovor.ID
  txtTheDogovor = Item.TheDogovor.brief
Else
  txtTheDogovor.Tag = ""
  txtTheDogovor = ""
End If
 LoadBtnPictures cmdTheDogovor, cmdTheDogovor.Tag
  cmdTheDogovor.RemoveAllMenu
  cmdTheDogovor.AddMenu "Очистить"
  cmdTheDogovor.AddMenu "Создать"
  cmdTheDogovor.AddMenu "Выбрать"
  cmdTheDogovor.AddMenu "Открыть"
txtTheComment = Item.TheComment
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

If txtFromClient.Tag <> "" Then
  Set Item.FromClient = Item.Application.Manager.GetInstanceObject(txtFromClient.Tag)
Else
  Set Item.FromClient = Nothing
End If
Item.PLPNUM = txtPLPNUM
  If IsNull(dtpPLPDate) Then
    Item.PLPDate = 0
  Else
    Item.PLPDate = dtpPLPDate.Value
  End If
Item.PLPSumm = CDbl(txtPLPSumm)
If txtTheCurrncy.Tag <> "" Then
  Set Item.TheCurrncy = Item.Application.FindRowObject("ENTDIC_CURRENCY", txtTheCurrncy.Tag)
Else
  Set Item.TheCurrncy = Nothing
End If
If txtTheDogovor.Tag <> "" Then
  Set Item.TheDogovor = Item.Application.Manager.GetInstanceObject(txtTheDogovor.Tag)
Else
  Set Item.TheDogovor = Nothing
End If
Item.TheComment = txtTheComment
If txtTheDept.Tag <> "" Then
  Set Item.TheDept = Item.Application.FindRowObject("PEKD_DEPT", txtTheDept.Tag)
Else
  Set Item.TheDept = Nothing
End If
Item.Code1C = txtCode1C
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



