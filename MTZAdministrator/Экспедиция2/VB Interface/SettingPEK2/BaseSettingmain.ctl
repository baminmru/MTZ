VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl BaseSettingmain 
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
      Begin VB.TextBox txtgenDirector 
         Height          =   300
         Left            =   6600
         MaxLength       =   255
         TabIndex        =   47
         ToolTipText     =   "Руководитель организации"
         Top             =   2010
         Width           =   3000
      End
      Begin VB.TextBox txtaddInvoiceInfo 
         Height          =   1200
         Left            =   6600
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   45
         ToolTipText     =   "Доверенность (для счет-фактуры)"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtCashMan 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   43
         ToolTipText     =   "Кассир"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtAccountGeneral 
         Height          =   300
         Left            =   3450
         MaxLength       =   100
         TabIndex        =   41
         ToolTipText     =   "Главный бухгалтер"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.ComboBox cmbRound500 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   39
         ToolTipText     =   "Округление до 500 гр."
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtDateSHCode 
         Height          =   300
         Left            =   3450
         MaxLength       =   10
         TabIndex        =   37
         ToolTipText     =   "Явный код месяца для штрих-кода"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtIDX 
         Height          =   300
         Left            =   3450
         MaxLength       =   10
         TabIndex        =   35
         ToolTipText     =   "Индекс почтового отделения"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbCode 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   33
         ToolTipText     =   "Присваивать номер при взвешивании"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdVED 
         Height          =   300
         Left            =   6000
         TabIndex        =   31
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм. объема по умолчанию"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtVED 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   30
         ToolTipText     =   "Ед. изм. объема по умолчанию"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdWED 
         Height          =   300
         Left            =   6000
         TabIndex        =   28
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм. веса по умолчанию"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtWED 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   27
         ToolTipText     =   "Ед. изм. веса по умолчанию"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdDirection 
         Height          =   300
         Left            =   6000
         TabIndex        =   25
         Tag             =   "refopen.ico"
         ToolTipText     =   "Направление по умолчанию"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDirection 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   24
         ToolTipText     =   "Направление по умолчанию"
         Top             =   405
         Width           =   2550
      End
      Begin VB.TextBox txtCount103 
         Height          =   300
         Left            =   300
         MaxLength       =   5
         TabIndex        =   22
         ToolTipText     =   "Кол-во Ф103"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.ComboBox cmbNDS103 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   20
         ToolTipText     =   "Ф103 с НДС"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtPassport 
         Height          =   300
         Left            =   300
         MaxLength       =   200
         TabIndex        =   18
         ToolTipText     =   "Данные паспорта для Ф116"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdSingleSendCli 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Клиент для всех разовых заявок"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSingleSendCli 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Клиент для всех разовых заявок"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdSingleSendTRF 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тариф для разовой отправки"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSingleSendTRF 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Тариф для разовой отправки"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdNewClientTRF 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тариф для нового клиента"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtNewClientTRF 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Тариф для нового клиента"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtNDS 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   7
         ToolTipText     =   "Ставка НДС"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdFIL 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Филиал"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFIL 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Филиал"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.ComboBox cmbUSEVOL 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         ToolTipText     =   "Исполльзовать объемные тарифы"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblgenDirector 
         BackStyle       =   0  'Transparent
         Caption         =   "Руководитель организации:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         Top             =   1680
         Width           =   3000
      End
      Begin VB.Label lbladdInvoiceInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Доверенность (для счет-фактуры):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblCashMan 
         BackStyle       =   0  'Transparent
         Caption         =   "Кассир:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   42
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblAccountGeneral 
         BackStyle       =   0  'Transparent
         Caption         =   "Главный бухгалтер:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   40
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblRound500 
         BackStyle       =   0  'Transparent
         Caption         =   "Округление до 500 гр.:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblDateSHCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Явный код месяца для штрих-кода:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblIDX 
         BackStyle       =   0  'Transparent
         Caption         =   "Индекс почтового отделения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Присваивать номер при взвешивании:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblVED 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм. объема по умолчанию:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblWED 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм. веса по умолчанию:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDirection 
         BackStyle       =   0  'Transparent
         Caption         =   "Направление по умолчанию:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblCount103 
         BackStyle       =   0  'Transparent
         Caption         =   "Кол-во Ф103:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblNDS103 
         BackStyle       =   0  'Transparent
         Caption         =   "Ф103 с НДС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblPassport 
         BackStyle       =   0  'Transparent
         Caption         =   "Данные паспорта для Ф116:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblSingleSendCli 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент для всех разовых заявок:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblSingleSendTRF 
         BackStyle       =   0  'Transparent
         Caption         =   "Тариф для разовой отправки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblNewClientTRF 
         BackStyle       =   0  'Transparent
         Caption         =   "Тариф для нового клиента:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Ставка НДС:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFIL 
         BackStyle       =   0  'Transparent
         Caption         =   "Филиал:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblUSEVOL 
         BackStyle       =   0  'Transparent
         Caption         =   "Исполльзовать объемные тарифы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "BaseSettingmain"
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

Private Sub cmbUSEVOL_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtFIL_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFIL_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DEPT", ID, brief) Then
          txtFIL.Tag = Left(ID, 38)
          txtFIL = brief
        End If
End Sub
Private Sub cmdFIL_MenuClick(ByVal sCaption As String)
          txtFIL.Tag = ""
          txtFIL = ""
End Sub
Private Sub txtNDS_Change()
  Changing

End Sub
Private Sub txtNewClientTRF_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdNewClientTRF_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_TRFTYPE", ID, brief) Then
          txtNewClientTRF.Tag = Left(ID, 38)
          txtNewClientTRF = brief
        End If
End Sub
Private Sub cmdNewClientTRF_MenuClick(ByVal sCaption As String)
          txtNewClientTRF.Tag = ""
          txtNewClientTRF = ""
End Sub
Private Sub txtSingleSendTRF_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSingleSendTRF_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_TRFTYPE", ID, brief) Then
          txtSingleSendTRF.Tag = Left(ID, 38)
          txtSingleSendTRF = brief
        End If
End Sub
Private Sub cmdSingleSendTRF_MenuClick(ByVal sCaption As String)
          txtSingleSendTRF.Tag = ""
          txtSingleSendTRF = ""
End Sub
Private Sub txtSingleSendCli_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSingleSendCli_CLick()
  On Error Resume Next
     If txtSingleSendCli.Tag = "" Then
       cmdSingleSendCli_MenuClick "Выбрать"
     Else
       cmdSingleSendCli_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdSingleSendCli_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtSingleSendCli.Tag = ""
          txtSingleSendCli = ""
  End If
  If sCaption = "Открыть" Then
    If txtSingleSendCli.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtSingleSendCli.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtSingleSendCli.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2")
        If OK Then
          txtSingleSendCli.Tag = Left(ID, 38)
          txtSingleSendCli = brief
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
              txtSingleSendCli.Tag = ID
              txtSingleSendCli = brief
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
              txtSingleSendCli.Tag = obj.ID
              txtSingleSendCli = obj.brief
          Else
              txtSingleSendCli.Tag = ""
              txtSingleSendCli = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtPassport_Change()
  Changing

End Sub
Private Sub cmbNDS103_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCount103_Change()
  Changing

End Sub
Private Sub txtDirection_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDirection_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DIRECTION", ID, brief) Then
          txtDirection.Tag = Left(ID, 38)
          txtDirection = brief
        End If
End Sub
Private Sub cmdDirection_MenuClick(ByVal sCaption As String)
          txtDirection.Tag = ""
          txtDirection = ""
End Sub
Private Sub txtWED_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdWED_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_EDIZM", ID, brief) Then
          txtWED.Tag = Left(ID, 38)
          txtWED = brief
        End If
End Sub
Private Sub cmdWED_MenuClick(ByVal sCaption As String)
          txtWED.Tag = ""
          txtWED = ""
End Sub
Private Sub txtVED_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdVED_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_EDIZM", ID, brief) Then
          txtVED.Tag = Left(ID, 38)
          txtVED = brief
        End If
End Sub
Private Sub cmdVED_MenuClick(ByVal sCaption As String)
          txtVED.Tag = ""
          txtVED = ""
End Sub
Private Sub cmbCode_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtIDX_Change()
  Changing

End Sub
Private Sub txtDateSHCode_Change()
  Changing

End Sub
Private Sub cmbRound500_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtAccountGeneral_Change()
  Changing

End Sub
Private Sub txtCashMan_Change()
  Changing

End Sub
Private Sub txtaddInvoiceInfo_Change()
  Changing

End Sub
Private Sub txtgenDirector_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtFIL.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtNDS.Text)
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

cmbUSEVOL.Clear
cmbUSEVOL.AddItem "Да"
cmbUSEVOL.ItemData(cmbUSEVOL.NewIndex) = -1
cmbUSEVOL.AddItem "Нет"
cmbUSEVOL.ItemData(cmbUSEVOL.NewIndex) = 0
 For iii = 0 To cmbUSEVOL.ListCount - 1
  If Item.USEVOL = cmbUSEVOL.ItemData(iii) Then
   cmbUSEVOL.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.FIL Is Nothing Then
  txtFIL.Tag = Item.FIL.ID
  txtFIL = Item.FIL.brief
Else
  txtFIL.Tag = ""
  txtFIL = ""
End If
 LoadBtnPictures cmdFIL, cmdFIL.Tag
  cmdFIL.RemoveAllMenu
  cmdFIL.AddMenu "Очистить"
  On Error Resume Next
txtNDS = Item.NDS
If Not Item.NewClientTRF Is Nothing Then
  txtNewClientTRF.Tag = Item.NewClientTRF.ID
  txtNewClientTRF = Item.NewClientTRF.brief
Else
  txtNewClientTRF.Tag = ""
  txtNewClientTRF = ""
End If
 LoadBtnPictures cmdNewClientTRF, cmdNewClientTRF.Tag
  cmdNewClientTRF.RemoveAllMenu
  cmdNewClientTRF.AddMenu "Очистить"
If Not Item.SingleSendTRF Is Nothing Then
  txtSingleSendTRF.Tag = Item.SingleSendTRF.ID
  txtSingleSendTRF = Item.SingleSendTRF.brief
Else
  txtSingleSendTRF.Tag = ""
  txtSingleSendTRF = ""
End If
 LoadBtnPictures cmdSingleSendTRF, cmdSingleSendTRF.Tag
  cmdSingleSendTRF.RemoveAllMenu
  cmdSingleSendTRF.AddMenu "Очистить"
If Not Item.SingleSendCli Is Nothing Then
  txtSingleSendCli.Tag = Item.SingleSendCli.ID
  txtSingleSendCli = Item.SingleSendCli.brief
Else
  txtSingleSendCli.Tag = ""
  txtSingleSendCli = ""
End If
 LoadBtnPictures cmdSingleSendCli, cmdSingleSendCli.Tag
  cmdSingleSendCli.RemoveAllMenu
  cmdSingleSendCli.AddMenu "Очистить"
  cmdSingleSendCli.AddMenu "Создать"
  cmdSingleSendCli.AddMenu "Выбрать"
  cmdSingleSendCli.AddMenu "Открыть"
  On Error Resume Next
txtPassport = Item.Passport
cmbNDS103.Clear
cmbNDS103.AddItem "Да"
cmbNDS103.ItemData(cmbNDS103.NewIndex) = -1
cmbNDS103.AddItem "Нет"
cmbNDS103.ItemData(cmbNDS103.NewIndex) = 0
 For iii = 0 To cmbNDS103.ListCount - 1
  If Item.NDS103 = cmbNDS103.ItemData(iii) Then
   cmbNDS103.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtCount103 = Item.Count103
If Not Item.Direction Is Nothing Then
  txtDirection.Tag = Item.Direction.ID
  txtDirection = Item.Direction.brief
Else
  txtDirection.Tag = ""
  txtDirection = ""
End If
 LoadBtnPictures cmdDirection, cmdDirection.Tag
  cmdDirection.RemoveAllMenu
  cmdDirection.AddMenu "Очистить"
If Not Item.WED Is Nothing Then
  txtWED.Tag = Item.WED.ID
  txtWED = Item.WED.brief
Else
  txtWED.Tag = ""
  txtWED = ""
End If
 LoadBtnPictures cmdWED, cmdWED.Tag
  cmdWED.RemoveAllMenu
  cmdWED.AddMenu "Очистить"
If Not Item.VED Is Nothing Then
  txtVED.Tag = Item.VED.ID
  txtVED = Item.VED.brief
Else
  txtVED.Tag = ""
  txtVED = ""
End If
 LoadBtnPictures cmdVED, cmdVED.Tag
  cmdVED.RemoveAllMenu
  cmdVED.AddMenu "Очистить"
cmbCode.Clear
cmbCode.AddItem "Да"
cmbCode.ItemData(cmbCode.NewIndex) = -1
cmbCode.AddItem "Нет"
cmbCode.ItemData(cmbCode.NewIndex) = 0
 For iii = 0 To cmbCode.ListCount - 1
  If Item.Code = cmbCode.ItemData(iii) Then
   cmbCode.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtIDX = Item.IDX
  On Error Resume Next
txtDateSHCode = Item.DateSHCode
cmbRound500.Clear
cmbRound500.AddItem "Да"
cmbRound500.ItemData(cmbRound500.NewIndex) = -1
cmbRound500.AddItem "Нет"
cmbRound500.ItemData(cmbRound500.NewIndex) = 0
 For iii = 0 To cmbRound500.ListCount - 1
  If Item.Round500 = cmbRound500.ItemData(iii) Then
   cmbRound500.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtAccountGeneral = Item.AccountGeneral
  On Error Resume Next
txtCashMan = Item.CashMan
txtaddInvoiceInfo = Item.addInvoiceInfo
  On Error Resume Next
txtgenDirector = Item.genDirector
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

 If cmbUSEVOL.ListIndex >= 0 Then
   Item.USEVOL = cmbUSEVOL.ItemData(cmbUSEVOL.ListIndex)
 End If
If txtFIL.Tag <> "" Then
  Set Item.FIL = Item.Application.FindRowObject("PEKD_DEPT", txtFIL.Tag)
Else
  Set Item.FIL = Nothing
End If
Item.NDS = txtNDS
If txtNewClientTRF.Tag <> "" Then
  Set Item.NewClientTRF = Item.Application.FindRowObject("PEKD_TRFTYPE", txtNewClientTRF.Tag)
Else
  Set Item.NewClientTRF = Nothing
End If
If txtSingleSendTRF.Tag <> "" Then
  Set Item.SingleSendTRF = Item.Application.FindRowObject("PEKD_TRFTYPE", txtSingleSendTRF.Tag)
Else
  Set Item.SingleSendTRF = Nothing
End If
If txtSingleSendCli.Tag <> "" Then
  Set Item.SingleSendCli = Item.Application.Manager.GetInstanceObject(txtSingleSendCli.Tag)
Else
  Set Item.SingleSendCli = Nothing
End If
Item.Passport = txtPassport
 If cmbNDS103.ListIndex >= 0 Then
   Item.NDS103 = cmbNDS103.ItemData(cmbNDS103.ListIndex)
 End If
Item.Count103 = txtCount103
If txtDirection.Tag <> "" Then
  Set Item.Direction = Item.Application.FindRowObject("PEKD_DIRECTION", txtDirection.Tag)
Else
  Set Item.Direction = Nothing
End If
If txtWED.Tag <> "" Then
  Set Item.WED = Item.Application.FindRowObject("ENTDIC_EDIZM", txtWED.Tag)
Else
  Set Item.WED = Nothing
End If
If txtVED.Tag <> "" Then
  Set Item.VED = Item.Application.FindRowObject("ENTDIC_EDIZM", txtVED.Tag)
Else
  Set Item.VED = Nothing
End If
 If cmbCode.ListIndex >= 0 Then
   Item.Code = cmbCode.ItemData(cmbCode.ListIndex)
 End If
Item.IDX = txtIDX
Item.DateSHCode = txtDateSHCode
 If cmbRound500.ListIndex >= 0 Then
   Item.Round500 = cmbRound500.ItemData(cmbRound500.ListIndex)
 End If
Item.AccountGeneral = txtAccountGeneral
Item.CashMan = txtCashMan
Item.addInvoiceInfo = txtaddInvoiceInfo
Item.genDirector = txtgenDirector
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



