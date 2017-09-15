VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKPQ_DEF 
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
         TabIndex        =   21
         ToolTipText     =   "Код1С"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheDogovor 
         Height          =   300
         Left            =   6000
         TabIndex        =   19
         Tag             =   "refopen.ico"
         ToolTipText     =   "Договор"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDogovor 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   18
         ToolTipText     =   "Договор"
         Top             =   405
         Width           =   2550
      End
      Begin VB.TextBox txtTheDescription 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   16
         ToolTipText     =   "Примечание"
         Top             =   5535
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdToSuplier 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "Контрагент"
         Top             =   4830
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtToSuplier 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "Контрагент"
         Top             =   4830
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtTheSumm 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Сума платежа"
         Top             =   4125
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         ToolTipText     =   "Назначение платежа"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheDept 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Подразделение"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDept 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Подразделение"
         Top             =   1815
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpTheDate 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Дата требования"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   181993475
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtsequence 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "№"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblCode1C 
         BackStyle       =   0  'Transparent
         Caption         =   "Код1С:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheDogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "Договор:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   17
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblTheDescription 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblToSuplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Контрагент:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblTheSumm 
         BackStyle       =   0  'Transparent
         Caption         =   "Сума платежа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Назначение платежа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheDept 
         BackStyle       =   0  'Transparent
         Caption         =   "Подразделение:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата требования:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblsequence 
         BackStyle       =   0  'Transparent
         Caption         =   "№:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKPQ_DEF"
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

Private Sub txtsequence_Validate(Cancel As Boolean)
If txtsequence.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtsequence.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtsequence.SetFocus
  ElseIf Val(txtsequence.Text) <> CLng(Val(txtsequence.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtsequence.SetFocus
  End If
End If
End Sub
Private Sub txtsequence_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtsequence_Change()
  Changing

End Sub
Private Sub dtpTheDate_Change()
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
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub txtTheSumm_Validate(Cancel As Boolean)
If txtTheSumm.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheSumm.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheSumm.SetFocus
  ElseIf Val(txtTheSumm.Text) < -922337203685478# Or Val(txtTheSumm.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTheSumm.SetFocus
  End If
End If
End Sub
Private Sub txtTheSumm_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheSumm_Change()
  Changing

End Sub
Private Sub txtToSuplier_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdToSuplier_CLick()
  On Error Resume Next
     If txtToSuplier.Tag = "" Then
       cmdToSuplier_MenuClick "Выбрать"
     Else
       cmdToSuplier_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdToSuplier_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtToSuplier.Tag = ""
          txtToSuplier = ""
  End If
  If sCaption = "Открыть" Then
    If txtToSuplier.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtToSuplier.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtToSuplier.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2", "STATUSNAME <>'В Архиве'  and VRCCommonInfo_MarkToDelete='Нет' ")
        If OK Then
          txtToSuplier.Tag = Left(ID, 38)
          txtToSuplier = brief
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
              txtToSuplier.Tag = ID
              txtToSuplier = brief
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
              txtToSuplier.Tag = obj.ID
              txtToSuplier = obj.brief
          Else
              txtToSuplier.Tag = ""
              txtToSuplier = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtTheDescription_Change()
  Changing

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
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRDG2", IIf(txtToSuplier.Tag = "", "VRDGCOMMON_CLIENT_ID is null", "VRDGCOMMON_CLIENT_ID='" & txtToSuplier.Tag & "'"))
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

If mIsOK Then mIsOK = IsSet(txtsequence.Text)
If mIsOK Then mIsOK = IsSet(dtpTheDate.Value)
If mIsOK Then mIsOK = txtTheDept.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtTheComment.Text)
If mIsOK Then mIsOK = IsSet(txtTheSumm.Text)
If mIsOK Then mIsOK = txtToSuplier.Tag <> ""
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

txtsequence = Item.sequence
dtpTheDate = Date
If Item.TheDate <> 0 Then
 dtpTheDate = Item.TheDate
End If
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
txtTheComment = Item.TheComment
txtTheSumm = Item.TheSumm
If Not Item.ToSuplier Is Nothing Then
  txtToSuplier.Tag = Item.ToSuplier.ID
  txtToSuplier = Item.ToSuplier.brief
Else
  txtToSuplier.Tag = ""
  txtToSuplier = ""
End If
 LoadBtnPictures cmdToSuplier, cmdToSuplier.Tag
  cmdToSuplier.RemoveAllMenu
  cmdToSuplier.AddMenu "Очистить"
  cmdToSuplier.AddMenu "Создать"
  cmdToSuplier.AddMenu "Выбрать"
  cmdToSuplier.AddMenu "Открыть"
txtTheDescription = Item.TheDescription
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

Item.sequence = CDbl(txtsequence)
  If IsNull(dtpTheDate) Then
    Item.TheDate = 0
  Else
    Item.TheDate = dtpTheDate.Value
  End If
If txtTheDept.Tag <> "" Then
  Set Item.TheDept = Item.Application.FindRowObject("PEKD_DEPT", txtTheDept.Tag)
Else
  Set Item.TheDept = Nothing
End If
Item.TheComment = txtTheComment
Item.TheSumm = CDbl(txtTheSumm)
If txtToSuplier.Tag <> "" Then
  Set Item.ToSuplier = Item.Application.Manager.GetInstanceObject(txtToSuplier.Tag)
Else
  Set Item.ToSuplier = Nothing
End If
Item.TheDescription = txtTheDescription
If txtTheDogovor.Tag <> "" Then
  Set Item.TheDogovor = Item.Application.Manager.GetInstanceObject(txtTheDogovor.Tag)
Else
  Set Item.TheDogovor = Nothing
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



