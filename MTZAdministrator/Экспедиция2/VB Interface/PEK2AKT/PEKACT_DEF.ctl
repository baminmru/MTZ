VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PEKACT_DEF 
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
         TabIndex        =   27
         ToolTipText     =   "Код 1С"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbCalcWithNDS 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   25
         ToolTipText     =   "Услуги с НДС"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFIO 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   100
         TabIndex        =   23
         ToolTipText     =   "ФИО получившего акт"
         Top             =   405
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpdateReceive 
         Height          =   300
         Left            =   300
         TabIndex        =   21
         ToolTipText     =   "Дата возврата подписанного акта клиент"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   72220675
         CurrentDate     =   39500
      End
      Begin MSComCtl2.DTPicker dtpdateSend 
         Height          =   300
         Left            =   300
         TabIndex        =   19
         ToolTipText     =   "Дата передачи акта клиенту"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   72220675
         CurrentDate     =   39500
      End
      Begin MSComCtl2.DTPicker dtpdateCreate 
         Height          =   300
         Left            =   300
         TabIndex        =   17
         ToolTipText     =   "Дата оформления акта"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   72220675
         CurrentDate     =   39500
      End
      Begin MTZ_PANEL.DropButton cmdTheDgovor 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "Договор"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheDgovor 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "Договор"
         Top             =   3930
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpDate_TO 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Дата ПО"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   72220675
         CurrentDate     =   39500
      End
      Begin MSComCtl2.DTPicker dtpDate_FROM 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Дата С"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   72220675
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtNumber_of_akt 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   8
         ToolTipText     =   "Номер_акта"
         Top             =   1815
         Width           =   1800
      End
      Begin MTZ_PANEL.DropButton cmdClient 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Клиент"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtClient 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Клиент"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdPodrazdelenie 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Подразделение"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtPodrazdelenie 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Подразделение"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblCode1C 
         BackStyle       =   0  'Transparent
         Caption         =   "Код 1С:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCalcWithNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Услуги с НДС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFIO 
         BackStyle       =   0  'Transparent
         Caption         =   "ФИО получившего акт:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lbldateReceive 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата возврата подписанного акта клиент:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lbldateSend 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата передачи акта клиенту:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lbldateCreate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата оформления акта:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheDgovor 
         BackStyle       =   0  'Transparent
         Caption         =   "Договор:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDate_TO 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата ПО:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblDate_FROM 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата С:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblNumber_of_akt 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер_акта:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPodrazdelenie 
         BackStyle       =   0  'Transparent
         Caption         =   "Подразделение:"
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
Attribute VB_Name = "PEKACT_DEF"
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

Private Sub txtPodrazdelenie_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPodrazdelenie_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdPodrazdelenie_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtClient_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdClient_CLick()
  On Error Resume Next
     If txtClient.Tag = "" Then
     Else
       cmdClient_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdClient_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Открыть" Then
    If txtClient.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtClient.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtClient.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
End Sub
Private Sub txtNumber_of_akt_Change()
  Changing

End Sub
Private Sub dtpDate_FROM_Change()
  Changing

End Sub
Private Sub dtpDate_TO_Change()
  Changing

End Sub
Private Sub txtTheDgovor_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDgovor_CLick()
  On Error Resume Next
     If txtTheDgovor.Tag = "" Then
     Else
       cmdTheDgovor_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheDgovor_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Открыть" Then
    If txtTheDgovor.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheDgovor.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheDgovor.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
End Sub
Private Sub dtpdateCreate_Change()
  Changing

End Sub
Private Sub dtpdateSend_Change()
  Changing

End Sub
Private Sub dtpdateReceive_Change()
  Changing

End Sub
Private Sub txtFIO_Change()
  Changing

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

If mIsOK Then mIsOK = txtClient.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtNumber_of_akt.Text)
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

If Not Item.Podrazdelenie Is Nothing Then
  txtPodrazdelenie.Tag = Item.Podrazdelenie.ID
  txtPodrazdelenie = Item.Podrazdelenie.brief
Else
  txtPodrazdelenie.Tag = ""
  txtPodrazdelenie = ""
End If
 LoadBtnPictures cmdPodrazdelenie, cmdPodrazdelenie.Tag
  cmdPodrazdelenie.RemoveAllMenu
  cmdPodrazdelenie.AddMenu "Очистить"
If Not Item.Client Is Nothing Then
  txtClient.Tag = Item.Client.ID
  txtClient = Item.Client.brief
Else
  txtClient.Tag = ""
  txtClient = ""
End If
 LoadBtnPictures cmdClient, cmdClient.Tag
  cmdClient.RemoveAllMenu
  cmdClient.AddMenu "Очистить"
  cmdClient.AddMenu "Открыть"
txtNumber_of_akt = Item.Number_of_akt
dtpDate_FROM = Date
If Item.Date_FROM <> 0 Then
 dtpDate_FROM = Item.Date_FROM
Else
 dtpDate_FROM.Value = Null
End If
dtpDate_TO = Date
If Item.Date_TO <> 0 Then
 dtpDate_TO = Item.Date_TO
Else
 dtpDate_TO.Value = Null
End If
If Not Item.TheDgovor Is Nothing Then
  txtTheDgovor.Tag = Item.TheDgovor.ID
  txtTheDgovor = Item.TheDgovor.brief
Else
  txtTheDgovor.Tag = ""
  txtTheDgovor = ""
End If
 LoadBtnPictures cmdTheDgovor, cmdTheDgovor.Tag
  cmdTheDgovor.RemoveAllMenu
  cmdTheDgovor.AddMenu "Очистить"
  cmdTheDgovor.AddMenu "Открыть"
dtpdateCreate = Date
If Item.dateCreate <> 0 Then
 dtpdateCreate = Item.dateCreate
Else
 dtpdateCreate.Value = Null
End If
dtpdateSend = Date
If Item.dateSend <> 0 Then
 dtpdateSend = Item.dateSend
Else
 dtpdateSend.Value = Null
End If
dtpdateReceive = Date
If Item.dateReceive <> 0 Then
 dtpdateReceive = Item.dateReceive
Else
 dtpdateReceive.Value = Null
End If
  On Error Resume Next
txtFIO = Item.FIO
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



