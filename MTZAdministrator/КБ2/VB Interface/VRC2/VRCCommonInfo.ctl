VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl VRCCommonInfo 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   3285
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4485
      _ExtentX        =   7911
      _ExtentY        =   5794
      Begin VB.TextBox txtCode1C 
         Height          =   300
         Left            =   6600
         MaxLength       =   40
         TabIndex        =   49
         ToolTipText     =   "Код1С"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.ComboBox cmbMarkToDelete 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   47
         ToolTipText     =   "Помечен на удаление"
         Top             =   4125
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCurator 
         Height          =   300
         Left            =   9150
         TabIndex        =   45
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ответственный"
         Top             =   3420
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCurator 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   44
         ToolTipText     =   "Ответственный"
         Top             =   3420
         Width           =   2550
      End
      Begin VB.TextBox txtthe_Comment 
         Height          =   1200
         Left            =   6600
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   42
         ToolTipText     =   "Примечание"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbTransporter 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   40
         ToolTipText     =   "Поставщик тр. услуг"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtAddress 
         Height          =   300
         Left            =   6600
         MaxLength       =   255
         TabIndex        =   38
         ToolTipText     =   "Почтовый адрес"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtfax 
         Height          =   300
         Left            =   3450
         MaxLength       =   20
         TabIndex        =   36
         ToolTipText     =   "Факс"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.TextBox txtPhone 
         Height          =   300
         Left            =   3450
         MaxLength       =   25
         TabIndex        =   34
         ToolTipText     =   "Телефон"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.TextBox txtPassportInfo 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   32
         ToolTipText     =   "Паспортные данные"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtPassPlace 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   30
         ToolTipText     =   "Место выдачи пасспорта"
         Top             =   3225
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPassDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         ToolTipText     =   "Дата выдачи пасспорта"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   47185923
         CurrentDate     =   39497
      End
      Begin VB.TextBox txtPassNum 
         Height          =   300
         Left            =   3450
         MaxLength       =   6
         TabIndex        =   26
         ToolTipText     =   "Номер пасспорта"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtPassSeria 
         Height          =   300
         Left            =   3450
         MaxLength       =   4
         TabIndex        =   24
         ToolTipText     =   "Серия паспорта"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCompInfo 
         Height          =   300
         Left            =   6000
         TabIndex        =   22
         Tag             =   "refopen.ico"
         ToolTipText     =   "Информация о компании"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCompInfo 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   21
         ToolTipText     =   "Информация о компании"
         Top             =   405
         Width           =   2550
      End
      Begin VB.TextBox txtfullname 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   19
         ToolTipText     =   "Полное наименование"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtTheO 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   17
         ToolTipText     =   "Отчество"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtTheI 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   15
         ToolTipText     =   "Имя"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtTheF 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   13
         ToolTipText     =   "Фамилия"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtKPP 
         Height          =   300
         Left            =   300
         MaxLength       =   9
         TabIndex        =   11
         ToolTipText     =   "КПП"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtINN 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   9
         ToolTipText     =   "ИНН"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   7
         ToolTipText     =   "Название"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdOPF 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "ОПФ"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOPF 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "ОПФ"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.ComboBox cmbIsPhizical 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         ToolTipText     =   "Физическое лицо"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblCode1C 
         BackStyle       =   0  'Transparent
         Caption         =   "Код1С:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblMarkToDelete 
         BackStyle       =   0  'Transparent
         Caption         =   "Помечен на удаление:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblCurator 
         BackStyle       =   0  'Transparent
         Caption         =   "Ответственный:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblthe_Comment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   41
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTransporter 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик тр. услуг:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   39
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblAddress 
         BackStyle       =   0  'Transparent
         Caption         =   "Почтовый адрес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   37
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblfax 
         BackStyle       =   0  'Transparent
         Caption         =   "Факс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblPhone 
         BackStyle       =   0  'Transparent
         Caption         =   "Телефон:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblPassportInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Паспортные данные:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPassPlace 
         BackStyle       =   0  'Transparent
         Caption         =   "Место выдачи пасспорта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblPassDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата выдачи пасспорта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPassNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер пасспорта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPassSeria 
         BackStyle       =   0  'Transparent
         Caption         =   "Серия паспорта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCompInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Информация о компании:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblfullname 
         BackStyle       =   0  'Transparent
         Caption         =   "Полное наименование:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblTheO 
         BackStyle       =   0  'Transparent
         Caption         =   "Отчество:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblTheI 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheF 
         BackStyle       =   0  'Transparent
         Caption         =   "Фамилия:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblKPP 
         BackStyle       =   0  'Transparent
         Caption         =   "КПП:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblINN 
         BackStyle       =   0  'Transparent
         Caption         =   "ИНН:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblOPF 
         BackStyle       =   0  'Transparent
         Caption         =   "ОПФ:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblIsPhizical 
         BackStyle       =   0  'Transparent
         Caption         =   "Физическое лицо:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "VRCCommonInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public item As Object
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
Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub cmbIsPhizical_Click()
  On Error Resume Next
  Changing
If cmbIsPhizical.ItemData(cmbIsPhizical.ListIndex) = 0 Then
  txtPassportInfo.Enabled = False
  lblPassportInfo.Enabled = False
Else
  txtPassportInfo.Enabled = True
  lblPassportInfo.Enabled = True

End If
End Sub
Private Sub txtOPF_Change()
  If Not (OnInit) Then
  Changing
If Not OnInit Then
   txtName = Replace(txtName, """", "")

   If txtOPF <> "" Then
     txtfullname = Replace(txtOPF, ";", "") & " " & txtName
   Else
     txtfullname = txtName
    End If
End If
  End If
End Sub
Private Sub cmdOPF_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If item.Application.Manager.GetReferenceDialogEx2("ENTDIC_OPF", ID, brief) Then
          txtOPF.Tag = Left(ID, 38)
          txtOPF = brief
        End If
End Sub
Private Sub cmdOPF_MenuClick(ByVal sCaption As String)
          txtOPF.Tag = ""
          txtOPF = ""
End Sub
Private Sub txtName_Change()
  Changing
If Not OnInit Then
   txtName = Replace(txtName, """", "")

   If txtOPF <> "" Then
     txtfullname = Replace(txtOPF, ";", "") & " " & txtName
   Else
     txtfullname = txtName
    End If
End If
End Sub
Private Sub txtINN_Change()
  Changing

End Sub
Private Sub txtKPP_Change()
  Changing

End Sub
Private Sub txtINN_Validate(Cancel As Boolean)
    If txtINN <> "" Then
        If Not IsNumeric(txtINN) Then
            MsgBox "Недопустимые символы в ИНН"
            Cancel = True
        End If
        If Len(txtINN) < 10 Then
            MsgBox "Неверно задан ИНН"
            Cancel = True
        End If
    End If
End Sub


Private Sub txtKPP_Validate(Cancel As Boolean)
    If txtKPP <> "" Then
        If Not IsNumeric(txtKPP) Then
            MsgBox "Недопустимые символы в КПП"
            Cancel = True
        End If
        If Len(txtKPP) < 9 Then
            MsgBox "Неверно задан KPP"
            Cancel = True
        End If
    End If
End Sub
Private Sub txtTheF_Change()
  Changing
If Not OnInit Then
     txtfullname = txtTheF & " " & txtTheI & " " & txtTheO
     txtName = txtTheF & " " & Left(txtTheI, 1) & ". " & Left(txtTheO, 1) & "."
     item.Name = txtName
     item.FullName = txtfullname
End If
End Sub
Private Sub txtTheI_Change()
  Changing
If Not OnInit Then
     txtfullname = txtTheF & " " & txtTheI & " " & txtTheO
     txtName = txtTheF & " " & Left(txtTheI, 1) & ". " & Left(txtTheO, 1) & "."
     item.Name = txtName
     item.FullName = txtfullname
End If
End Sub
Private Sub txtTheO_Change()
  Changing
If Not OnInit Then
     txtfullname = txtTheF & " " & txtTheI & " " & txtTheO
     txtName = txtTheF & " " & Left(txtTheI, 1) & ". " & Left(txtTheO, 1) & "."
     item.Name = txtName
     item.FullName = txtfullname
End If
End Sub
Private Sub txtfullname_Change()
  Changing

End Sub
Private Sub txtCompInfo_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCompInfo_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If item.Application.Manager.GetReferenceDialogEx2("VRD_CompInfo", ID, brief) Then
          txtCompInfo.Tag = Left(ID, 38)
          txtCompInfo = brief
        End If
End Sub
Private Sub cmdCompInfo_MenuClick(ByVal sCaption As String)
          txtCompInfo.Tag = ""
          txtCompInfo = ""
End Sub
Private Sub txtPassSeria_Change()
  Changing
If Not OnInit Then
   txtPassportInfo = "серия:" & txtPassSeria & " №" & txtPassNum & " выдан:" & txtPassPlace & " дата выдачи:" & Day(dtpPassDate.Value) & "/" & Month(dtpPassDate.Value) & "/" & Year(dtpPassDate.Value)
   item.PassportInfo = txtPassportInfo

End If
End Sub
Private Sub txtPassNum_Change()
  Changing
If Not OnInit Then
   txtPassportInfo = "серия:" & txtPassSeria & " №" & txtPassNum & " выдан:" & txtPassPlace & " дата выдачи:" & Day(dtpPassDate.Value) & "/" & Month(dtpPassDate.Value) & "/" & Year(dtpPassDate.Value)
   item.PassportInfo = txtPassportInfo

End If
End Sub
Private Sub dtpPassDate_Change()
  Changing
If Not OnInit Then
   txtPassportInfo = "серия:" & txtPassSeria & " №" & txtPassNum & " выдан:" & txtPassPlace & " дата выдачи:" & Day(dtpPassDate.Value) & "/" & Month(dtpPassDate.Value) & "/" & Year(dtpPassDate.Value)
   item.PassportInfo = txtPassportInfo

End If
End Sub
Private Sub txtPassPlace_Change()
  Changing
If Not OnInit Then
   txtPassportInfo = "серия:" & txtPassSeria & " №" & txtPassNum & " выдан:" & txtPassPlace & " дата выдачи:" & Day(dtpPassDate.Value) & "/" & Month(dtpPassDate.Value) & "/" & Year(dtpPassDate.Value)
   item.PassportInfo = txtPassportInfo

End If
End Sub
Private Sub txtPassportInfo_Change()
  Changing

End Sub
Private Sub txtPhone_Change()
  Changing

End Sub
Private Sub txtfax_Change()
  Changing

End Sub
Private Sub txtAddress_Change()
  Changing

End Sub
Private Sub cmbTransporter_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtthe_Comment_Change()
  Changing

End Sub
Private Sub txtCurator_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCurator_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If item.Application.Manager.GetReferenceDialogEx2("Users", ID, brief) Then
          txtCurator.Tag = Left(ID, 38)
          txtCurator = brief
        End If
End Sub
Private Sub cmdCurator_MenuClick(ByVal sCaption As String)
          txtCurator.Tag = ""
          txtCurator = ""
End Sub
Private Sub cmbMarkToDelete_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCode1C_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = (cmbIsPhizical.ListIndex >= 0)
If mIsOK Then mIsOK = txtOPF.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = IsSet(txtTheF.Text)
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
  For Each Node In XMLDocFrom.childNodes.item(0).childNodes
    If (Node.baseName = "ID") Then
      ID = Node.Text
      Dim NodeTO As MSXML2.IXMLDOMNode
      Dim bAdded As Boolean
      bAdded = False
      For Each NodeTO In XMLDocTo.childNodes.item(0).childNodes
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
       Call XMLDocTo.childNodes.item(0).appendChild(newNode)
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
If item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

cmbIsPhizical.Clear
cmbIsPhizical.AddItem "Да"
cmbIsPhizical.ItemData(cmbIsPhizical.NewIndex) = -1
cmbIsPhizical.AddItem "Нет"
cmbIsPhizical.ItemData(cmbIsPhizical.NewIndex) = 0
 For iii = 0 To cmbIsPhizical.ListCount - 1
  If item.IsPhizical = cmbIsPhizical.ItemData(iii) Then
   cmbIsPhizical.ListIndex = iii
   Exit For
  End If
 Next
If Not item.opf Is Nothing Then
  txtOPF.Tag = item.opf.ID
  txtOPF = item.opf.brief
Else
  txtOPF.Tag = ""
  txtOPF = ""
End If
 LoadBtnPictures cmdOPF, cmdOPF.Tag
  cmdOPF.RemoveAllMenu
  cmdOPF.AddMenu "Очистить"
  On Error Resume Next
txtName = item.Name
  On Error Resume Next
txtINN = item.INN
  On Error Resume Next
txtKPP = item.KPP
  On Error Resume Next
txtTheF = item.TheF
  On Error Resume Next
txtTheI = item.TheI
  On Error Resume Next
txtTheO = item.TheO
txtfullname = item.FullName
If Not item.CompInfo Is Nothing Then
  txtCompInfo.Tag = item.CompInfo.ID
  txtCompInfo = item.CompInfo.brief
Else
  txtCompInfo.Tag = ""
  txtCompInfo = ""
End If
 LoadBtnPictures cmdCompInfo, cmdCompInfo.Tag
  cmdCompInfo.RemoveAllMenu
  cmdCompInfo.AddMenu "Очистить"
  On Error Resume Next
txtPassSeria = item.PassSeria
  On Error Resume Next
txtPassNum = item.PassNum
dtpPassDate = Date
If item.PassDate <> 0 Then
 dtpPassDate = item.PassDate
Else
 dtpPassDate.Value = Null
End If
  On Error Resume Next
txtPassPlace = item.PassPlace
txtPassportInfo = item.PassportInfo
  On Error Resume Next
txtPhone = item.Phone
  On Error Resume Next
txtfax = item.fax
  On Error Resume Next
txtAddress = item.Address
cmbTransporter.Clear
cmbTransporter.AddItem "Да"
cmbTransporter.ItemData(cmbTransporter.NewIndex) = -1
cmbTransporter.AddItem "Нет"
cmbTransporter.ItemData(cmbTransporter.NewIndex) = 0
 For iii = 0 To cmbTransporter.ListCount - 1
  If item.Transporter = cmbTransporter.ItemData(iii) Then
   cmbTransporter.ListIndex = iii
   Exit For
  End If
 Next
txtthe_Comment = item.the_Comment
If Not item.Curator Is Nothing Then
  txtCurator.Tag = item.Curator.ID
  txtCurator = item.Curator.brief
Else
  txtCurator.Tag = ""
  txtCurator = ""
End If
 LoadBtnPictures cmdCurator, cmdCurator.Tag
  cmdCurator.RemoveAllMenu
  cmdCurator.AddMenu "Очистить"
cmbMarkToDelete.Clear
cmbMarkToDelete.AddItem "Да"
cmbMarkToDelete.ItemData(cmbMarkToDelete.NewIndex) = -1
cmbMarkToDelete.AddItem "Нет"
cmbMarkToDelete.ItemData(cmbMarkToDelete.NewIndex) = 0
 For iii = 0 To cmbMarkToDelete.ListCount - 1
  If item.MarkToDelete = cmbMarkToDelete.ItemData(iii) Then
   cmbMarkToDelete.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtCode1C = item.Code1C
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

 If cmbIsPhizical.ListIndex >= 0 Then
   item.IsPhizical = cmbIsPhizical.ItemData(cmbIsPhizical.ListIndex)
 End If
If txtOPF.Tag <> "" Then
  Set item.opf = item.Application.FindRowObject("ENTDIC_OPF", txtOPF.Tag)
Else
  Set item.opf = Nothing
End If
item.Name = txtName
item.INN = txtINN
item.KPP = txtKPP
item.TheF = txtTheF
item.TheI = txtTheI
item.TheO = txtTheO
item.FullName = txtfullname
If txtCompInfo.Tag <> "" Then
  Set item.CompInfo = item.Application.FindRowObject("VRD_CompInfo", txtCompInfo.Tag)
Else
  Set item.CompInfo = Nothing
End If
item.PassSeria = txtPassSeria
item.PassNum = txtPassNum
  If IsNull(dtpPassDate) Then
    item.PassDate = 0
  Else
    item.PassDate = dtpPassDate.Value
  End If
item.PassPlace = txtPassPlace
item.PassportInfo = txtPassportInfo
item.Phone = txtPhone
item.fax = txtfax
item.Address = txtAddress
 If cmbTransporter.ListIndex >= 0 Then
   item.Transporter = cmbTransporter.ItemData(cmbTransporter.ListIndex)
 End If
item.the_Comment = txtthe_Comment
If txtCurator.Tag <> "" Then
  Set item.Curator = item.Application.FindRowObject("Users", txtCurator.Tag)
Else
  Set item.Curator = Nothing
End If
 If cmbMarkToDelete.ListIndex >= 0 Then
   item.MarkToDelete = cmbMarkToDelete.ItemData(cmbMarkToDelete.ListIndex)
 End If
item.Code1C = txtCode1C
 mIsChanged = False
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(X As Single, Y As Single)
   Panel.OptimalSize X, Y
   X = X + Panel.Left
   Y = Y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim X As Single, Y As Single
   Panel.OptimalSize X, Y
   OptimalY = Y
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



