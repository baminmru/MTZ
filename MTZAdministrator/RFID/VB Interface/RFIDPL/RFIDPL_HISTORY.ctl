VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl RFIDPL_HISTORY 
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
      Begin MTZ_PANEL.DropButton cmdPalletPlaceRef 
         Height          =   300
         Left            =   6000
         TabIndex        =   24
         Tag             =   "refopen.ico"
         ToolTipText     =   "Размещение"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPalletPlaceRef 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   23
         ToolTipText     =   "Размещение"
         Top             =   1110
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpChangeDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         ToolTipText     =   "Дата изменения"
         Top             =   405
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16580611
         CurrentDate     =   39750
      End
      Begin MSMask.MaskEdBox txtOneBoxWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   19
         ToolTipText     =   "Вес тары одной упаковки"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtOnePackageWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   17
         ToolTipText     =   "Вес одной упаковки"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtPackageWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   15
         ToolTipText     =   "Вес упаковки"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtCntOfPackage 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Количество упаковок"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtGoodWeightBrutto 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Вес груза БРУТТО"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtGoodWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Вес груза НЕТТО"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtTheGood 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   7
         ToolTipText     =   "Товар"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCurState 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Текущее состояние"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCurState 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Текущее состояние"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtTheCode 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   2
         ToolTipText     =   "Номер паллеты"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblPalletPlaceRef 
         BackStyle       =   0  'Transparent
         Caption         =   "Размещение:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblChangeDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата изменения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblOneBoxWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес тары одной упаковки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblOnePackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес одной упаковки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblPackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес упаковки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblCntOfPackage 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество упаковок:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblGoodWeightBrutto 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес груза БРУТТО:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblGoodWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес груза НЕТТО:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheGood 
         BackStyle       =   0  'Transparent
         Caption         =   "Товар:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCurState 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущее состояние:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер паллеты:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "RFIDPL_HISTORY"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 415
Option Explicit



   Public item As Object
Attribute item.VB_VarHelpID = 450
   Private OnInit As Boolean
   Public Event Changed()
Attribute Changed.VB_HelpID = 420
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
Attribute IsChanged.VB_HelpID = 440
  IsChanged = mIsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtTheCode_Change()
  Changing

End Sub
Private Sub txtCurState_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCurState_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If item.Application.Manager.GetReferenceDialogEx2("RFIDD_PSTATE", ID, brief) Then
          txtCurState.Tag = Left(ID, 38)
          txtCurState = brief
        End If
End Sub
Private Sub cmdCurState_MenuClick(ByVal sCaption As String)
          txtCurState.Tag = ""
          txtCurState = ""
End Sub
Private Sub txtTheGood_Change()
  Changing

End Sub
Private Sub txtGoodWeight_Validate(Cancel As Boolean)
If txtGoodWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtGoodWeight.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtGoodWeight.SetFocus
  ElseIf val(txtGoodWeight.Text) < -922337203685478# Or val(txtGoodWeight.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtGoodWeight.SetFocus
  End If
End If
End Sub
Private Sub txtGoodWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtGoodWeight_Change()
  Changing

End Sub
Private Sub txtGoodWeightBrutto_Validate(Cancel As Boolean)
If txtGoodWeightBrutto.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtGoodWeightBrutto.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtGoodWeightBrutto.SetFocus
  ElseIf val(txtGoodWeightBrutto.Text) < -922337203685478# Or val(txtGoodWeightBrutto.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtGoodWeightBrutto.SetFocus
  End If
End If
End Sub
Private Sub txtGoodWeightBrutto_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtGoodWeightBrutto_Change()
  Changing

End Sub
Private Sub txtCntOfPackage_Validate(Cancel As Boolean)
If txtCntOfPackage.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCntOfPackage.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCntOfPackage.SetFocus
  ElseIf val(txtCntOfPackage.Text) < -922337203685478# Or val(txtCntOfPackage.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCntOfPackage.SetFocus
  End If
End If
End Sub
Private Sub txtCntOfPackage_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCntOfPackage_Change()
  Changing

End Sub
Private Sub txtPackageWeight_Validate(Cancel As Boolean)
If txtPackageWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPackageWeight.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPackageWeight.SetFocus
  ElseIf val(txtPackageWeight.Text) < -922337203685478# Or val(txtPackageWeight.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPackageWeight.SetFocus
  End If
End If
End Sub
Private Sub txtPackageWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPackageWeight_Change()
  Changing

End Sub
Private Sub txtOnePackageWeight_Validate(Cancel As Boolean)
If txtOnePackageWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtOnePackageWeight.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtOnePackageWeight.SetFocus
  ElseIf val(txtOnePackageWeight.Text) < -922337203685478# Or val(txtOnePackageWeight.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtOnePackageWeight.SetFocus
  End If
End If
End Sub
Private Sub txtOnePackageWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtOnePackageWeight_Change()
  Changing

End Sub
Private Sub txtOneBoxWeight_Validate(Cancel As Boolean)
If txtOneBoxWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtOneBoxWeight.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtOneBoxWeight.SetFocus
  ElseIf val(txtOneBoxWeight.Text) < -922337203685478# Or val(txtOneBoxWeight.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtOneBoxWeight.SetFocus
  End If
End If
End Sub
Private Sub txtOneBoxWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtOneBoxWeight_Change()
  Changing

End Sub
Private Sub dtpChangeDate_Change()
  Changing

End Sub
Private Sub txtPalletPlaceRef_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPalletPlaceRef_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If item.Application.Manager.GetReferenceDialogEx2("RFIDCELL_INFO", ID, brief) Then
          txtPalletPlaceRef.Tag = Left(ID, 38)
          txtPalletPlaceRef = brief
        End If
End Sub
Private Sub cmdPalletPlaceRef_MenuClick(ByVal sCaption As String)
          txtPalletPlaceRef.Tag = ""
          txtPalletPlaceRef = ""
End Sub
Private Sub UserControl_Terminate()
  Set item = Nothing
End Sub
Public Function IsOK() As Boolean
Attribute IsOK.VB_HelpID = 445
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtTheCode.Text)
If mIsOK Then mIsOK = txtCurState.Tag <> ""
If mIsOK Then mIsOK = txtPalletPlaceRef.Tag <> ""
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
Attribute InitPanel.VB_HelpID = 435
OnInit = True
Dim iii As Long ' for combo only
If item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

  On Error Resume Next
txtTheCode = item.TheCode
If Not item.CurState Is Nothing Then
  txtCurState.Tag = item.CurState.ID
  txtCurState = item.CurState.brief
Else
  txtCurState.Tag = ""
  txtCurState = ""
End If
 LoadBtnPictures cmdCurState, cmdCurState.Tag
  cmdCurState.RemoveAllMenu
  cmdCurState.AddMenu "Очистить"
  On Error Resume Next
txtTheGood = item.TheGood
txtGoodWeight = item.GoodWeight
txtGoodWeightBrutto = item.GoodWeightBrutto
txtCntOfPackage = item.CntOfPackage
txtPackageWeight = item.PackageWeight
txtOnePackageWeight = item.OnePackageWeight
txtOneBoxWeight = item.OneBoxWeight
dtpChangeDate = Now
If item.ChangeDate <> 0 Then
 dtpChangeDate = item.ChangeDate
Else
 dtpChangeDate.Value = Null
End If
If Not item.PalletPlaceRef Is Nothing Then
  txtPalletPlaceRef.Tag = item.PalletPlaceRef.ID
  txtPalletPlaceRef = item.PalletPlaceRef.brief
Else
  txtPalletPlaceRef.Tag = ""
  txtPalletPlaceRef = ""
End If
 LoadBtnPictures cmdPalletPlaceRef, cmdPalletPlaceRef.Tag
  cmdPalletPlaceRef.RemoveAllMenu
  cmdPalletPlaceRef.AddMenu "Очистить"
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
Attribute Save.VB_HelpID = 470
If OnInit Then Exit Sub

item.TheCode = txtTheCode
If txtCurState.Tag <> "" Then
  Set item.CurState = item.Application.FindRowObject("RFIDD_PSTATE", txtCurState.Tag)
Else
  Set item.CurState = Nothing
End If
item.TheGood = txtTheGood
item.GoodWeight = CDbl(txtGoodWeight)
item.GoodWeightBrutto = CDbl(txtGoodWeightBrutto)
item.CntOfPackage = CDbl(txtCntOfPackage)
item.PackageWeight = CDbl(txtPackageWeight)
item.OnePackageWeight = CDbl(txtOnePackageWeight)
item.OneBoxWeight = CDbl(txtOneBoxWeight)
  If IsNull(dtpChangeDate) Then
    item.ChangeDate = 0
  Else
    item.ChangeDate = dtpChangeDate.Value
  End If
If txtPalletPlaceRef.Tag <> "" Then
  Set item.PalletPlaceRef = item.Application.FindRowObject("RFIDCELL_INFO", txtPalletPlaceRef.Tag)
Else
  Set item.PalletPlaceRef = Nothing
End If
 mIsChanged = False
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(X As Single, Y As Single)
Attribute OptimalSize.VB_HelpID = 455
   Panel.OptimalSize X, Y
   X = X + Panel.Left
   Y = Y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
Attribute OptimalY.VB_HelpID = 460
   Dim X As Single, Y As Single
   Panel.OptimalSize X, Y
   OptimalY = Y
 End Function
 Public Sub Customize()
Attribute Customize.VB_HelpID = 425
   Panel.Customize
 End Sub
 Public Property Get PanelCustomisationString() As String
Attribute PanelCustomisationString.VB_HelpID = 465
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property
 Public Property Get Enabled() As Boolean
Attribute Enabled.VB_HelpID = 430
   Enabled = Panel.Enabled
 End Property
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



