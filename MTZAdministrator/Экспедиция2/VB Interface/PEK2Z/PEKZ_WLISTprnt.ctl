VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKZ_WLISTprnt 
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
      Begin VB.TextBox txtQDocs 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   40
         ToolTipText     =   "Количество сопроводительных документов"
         Top             =   405
         Width           =   1800
      End
      Begin VB.TextBox txtOrderNum 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   30
         TabIndex        =   38
         ToolTipText     =   "№ счета"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtQSertif 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   36
         ToolTipText     =   "Количество сертификатов"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.TextBox txtQLicense 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   34
         ToolTipText     =   "Количество лицензий"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.TextBox txtItemDescription 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   60
         TabIndex        =   32
         ToolTipText     =   "Описание отправления"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsProchee 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   30
         ToolTipText     =   "Прочее отправление"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsVozvrat 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   28
         ToolTipText     =   "Возврат товара"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsObrazec 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   26
         ToolTipText     =   "Коммерческий образец"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsDocument 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   24
         ToolTipText     =   "Документ"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsPodarok 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   22
         ToolTipText     =   "Подарок"
         Top             =   405
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheCurrency 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Валюта стоимости"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheCurrency 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Валюта стоимости"
         Top             =   6045
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtVozmCost 
         Height          =   300
         Left            =   300
         TabIndex        =   17
         ToolTipText     =   "Стоимость возмщения"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtItemPrice 
         Height          =   300
         Left            =   300
         TabIndex        =   15
         ToolTipText     =   "Стоимость посылки"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdTheCountry 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страна происхождения"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheCountry 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Страна происхождения"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.TextBox txtTNBED 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   40
         TabIndex        =   10
         ToolTipText     =   "Код ТНВЭД"
         Top             =   3225
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtNettoWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   8
         ToolTipText     =   "Вес нетто"
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
      Begin VB.TextBox txtshCode 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   14
         TabIndex        =   6
         ToolTipText     =   "Штрих Код"
         Top             =   1815
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txttheWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Вес"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtsequence 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "№"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblQDocs 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество сопроводительных документов:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   39
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblOrderNum 
         BackStyle       =   0  'Transparent
         Caption         =   "№ счета:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblQSertif 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество сертификатов:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblQLicense 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество лицензий:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblItemDescription 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание отправления:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblIsProchee 
         BackStyle       =   0  'Transparent
         Caption         =   "Прочее отправление:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblIsVozvrat 
         BackStyle       =   0  'Transparent
         Caption         =   "Возврат товара:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblIsObrazec 
         BackStyle       =   0  'Transparent
         Caption         =   "Коммерческий образец:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblIsDocument 
         BackStyle       =   0  'Transparent
         Caption         =   "Документ:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblIsPodarok 
         BackStyle       =   0  'Transparent
         Caption         =   "Подарок:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblTheCurrency 
         BackStyle       =   0  'Transparent
         Caption         =   "Валюта стоимости:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblVozmCost 
         BackStyle       =   0  'Transparent
         Caption         =   "Стоимость возмщения:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblItemPrice 
         BackStyle       =   0  'Transparent
         Caption         =   "Стоимость посылки:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheCountry 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна происхождения:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTNBED 
         BackStyle       =   0  'Transparent
         Caption         =   "Код ТНВЭД:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblNettoWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес нетто:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblshCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Штрих Код:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lbltheWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес:"
         Enabled         =   0   'False
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
Attribute VB_Name = "PEKZ_WLISTprnt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, Cancel)
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

Private Sub txtsequence_Change()
  Changing

End Sub
Private Sub txttheWeight_Change()
  Changing

End Sub
Private Sub txtshCode_Change()
  Changing

End Sub
Private Sub txtNettoWeight_Change()
  Changing

End Sub
Private Sub txtTNBED_Change()
  Changing

End Sub
Private Sub txtTheCountry_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCountry_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdTheCountry_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtItemPrice_Change()
  Changing

End Sub
Private Sub txtVozmCost_Change()
  Changing

End Sub
Private Sub txtTheCurrency_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCurrency_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdTheCurrency_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmbIsPodarok_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsDocument_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsObrazec_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsVozvrat_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsProchee_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtItemDescription_Change()
  Changing

End Sub
Private Sub txtQLicense_Change()
  Changing

End Sub
Private Sub txtQSertif_Change()
  Changing

End Sub
Private Sub txtOrderNum_Change()
  Changing

End Sub
Private Sub txtQDocs_Change()
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
If mIsOK Then mIsOK = IsSet(txttheWeight.Text)
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
txttheWeight = Item.theWeight
  On Error Resume Next
txtshCode = Item.shCode
txtNettoWeight = Item.NettoWeight
  On Error Resume Next
txtTNBED = Item.TNBED
If Not Item.TheCountry Is Nothing Then
  txtTheCountry.Tag = Item.TheCountry.ID
  txtTheCountry = Item.TheCountry.Brief
Else
  txtTheCountry.Tag = ""
  txtTheCountry = ""
End If
 LoadBtnPictures cmdTheCountry, cmdTheCountry.Tag
  cmdTheCountry.RemoveAllMenu
  cmdTheCountry.AddMenu "Очистить"
txtItemPrice = Item.ItemPrice
txtVozmCost = Item.VozmCost
If Not Item.TheCurrency Is Nothing Then
  txtTheCurrency.Tag = Item.TheCurrency.ID
  txtTheCurrency = Item.TheCurrency.Brief
Else
  txtTheCurrency.Tag = ""
  txtTheCurrency = ""
End If
 LoadBtnPictures cmdTheCurrency, cmdTheCurrency.Tag
  cmdTheCurrency.RemoveAllMenu
  cmdTheCurrency.AddMenu "Очистить"
cmbIsPodarok.Clear
cmbIsPodarok.AddItem "Да"
cmbIsPodarok.ItemData(cmbIsPodarok.NewIndex) = -1
cmbIsPodarok.AddItem "Нет"
cmbIsPodarok.ItemData(cmbIsPodarok.NewIndex) = 0
 For iii = 0 To cmbIsPodarok.ListCount - 1
  If Item.IsPodarok = cmbIsPodarok.ItemData(iii) Then
   cmbIsPodarok.ListIndex = iii
   Exit For
  End If
 Next
cmbIsDocument.Clear
cmbIsDocument.AddItem "Да"
cmbIsDocument.ItemData(cmbIsDocument.NewIndex) = -1
cmbIsDocument.AddItem "Нет"
cmbIsDocument.ItemData(cmbIsDocument.NewIndex) = 0
 For iii = 0 To cmbIsDocument.ListCount - 1
  If Item.IsDocument = cmbIsDocument.ItemData(iii) Then
   cmbIsDocument.ListIndex = iii
   Exit For
  End If
 Next
cmbIsObrazec.Clear
cmbIsObrazec.AddItem "Да"
cmbIsObrazec.ItemData(cmbIsObrazec.NewIndex) = -1
cmbIsObrazec.AddItem "Нет"
cmbIsObrazec.ItemData(cmbIsObrazec.NewIndex) = 0
 For iii = 0 To cmbIsObrazec.ListCount - 1
  If Item.IsObrazec = cmbIsObrazec.ItemData(iii) Then
   cmbIsObrazec.ListIndex = iii
   Exit For
  End If
 Next
cmbIsVozvrat.Clear
cmbIsVozvrat.AddItem "Да"
cmbIsVozvrat.ItemData(cmbIsVozvrat.NewIndex) = -1
cmbIsVozvrat.AddItem "Нет"
cmbIsVozvrat.ItemData(cmbIsVozvrat.NewIndex) = 0
 For iii = 0 To cmbIsVozvrat.ListCount - 1
  If Item.IsVozvrat = cmbIsVozvrat.ItemData(iii) Then
   cmbIsVozvrat.ListIndex = iii
   Exit For
  End If
 Next
cmbIsProchee.Clear
cmbIsProchee.AddItem "Да"
cmbIsProchee.ItemData(cmbIsProchee.NewIndex) = -1
cmbIsProchee.AddItem "Нет"
cmbIsProchee.ItemData(cmbIsProchee.NewIndex) = 0
 For iii = 0 To cmbIsProchee.ListCount - 1
  If Item.IsProchee = cmbIsProchee.ItemData(iii) Then
   cmbIsProchee.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtItemDescription = Item.ItemDescription
txtQLicense = Item.QLicense
txtQSertif = Item.QSertif
  On Error Resume Next
txtOrderNum = Item.OrderNum
txtQDocs = Item.QDocs
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



