VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl PEKZ_ADLVR 
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
      Begin MSMask.MaskEdBox txtSupSummNDS 
         Height          =   300
         Left            =   6600
         TabIndex        =   41
         ToolTipText     =   "Сумма поставщику с НДС"
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
      Begin MSMask.MaskEdBox txtSupSumm 
         Height          =   300
         Left            =   6600
         TabIndex        =   39
         ToolTipText     =   "Сумма поставщику без НДС"
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
      Begin MSMask.MaskEdBox txtSumm 
         Height          =   300
         Left            =   6600
         TabIndex        =   37
         ToolTipText     =   "Сумма без НДС"
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
      Begin MSMask.MaskEdBox txtSummNDS 
         Height          =   300
         Left            =   6600
         TabIndex        =   35
         ToolTipText     =   "Сумма с НДС"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.ComboBox cmbCalcWithNDS 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   33
         ToolTipText     =   "Расчет с НДС"
         Top             =   6435
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpSupMoneyDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         ToolTipText     =   "Cписание денежных средств поставщиком"
         Top             =   5730
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   103612419
         CurrentDate     =   39567
      End
      Begin MTZ_PANEL.DropButton cmdAutoSuplier 
         Height          =   300
         Left            =   6000
         TabIndex        =   29
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поставщик"
         Top             =   5025
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtAutoSuplier 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   28
         ToolTipText     =   "Поставщик"
         Top             =   5025
         Width           =   2550
      End
      Begin VB.TextBox txtInfo 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   26
         ToolTipText     =   "Данные о грузе"
         Top             =   3420
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtTheDuration 
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         ToolTipText     =   "Длительность (час)"
         Top             =   2715
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtTheLength 
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         ToolTipText     =   "Километраж"
         Top             =   2010
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
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   20
         ToolTipText     =   "Примечание"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtPhone 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   18
         ToolTipText     =   "Контактный телефон"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.TextBox txtThePerson 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   16
         ToolTipText     =   "Контактное лицо"
         Top             =   5535
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCollectTimeTo 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "По"
         Top             =   4830
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "HH:mm:ss"
         Format          =   103612419
         UpDown          =   -1  'True
         CurrentDate     =   39567
      End
      Begin MSComCtl2.DTPicker dtpCollectTimeFrom 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Начиная с"
         Top             =   4125
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "HH:mm:ss"
         Format          =   103612419
         UpDown          =   -1  'True
         CurrentDate     =   39567
      End
      Begin MSComCtl2.DTPicker dtpCollectDate 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Дата получения груза"
         Top             =   3420
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   103612419
         CurrentDate     =   39567
      End
      Begin VB.TextBox txtTheAddress 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   8
         ToolTipText     =   "Адрес "
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdAutoType 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип автотранспорта"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtAutoType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Тип автотранспорта"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheFilial 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Филиал"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheFilial 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Филиал"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblSupSummNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма поставщику с НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   40
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSupSumm 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма поставщику без НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   38
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblSumm 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма без НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   36
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSummNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма с НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   34
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblCalcWithNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Расчет с НДС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   6105
         Width           =   3000
      End
      Begin VB.Label lblSupMoneyDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Cписание денежных средств поставщиком:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   5400
         Width           =   3000
      End
      Begin VB.Label lblAutoSuplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   4695
         Width           =   3000
      End
      Begin VB.Label lblInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Данные о грузе:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblTheDuration 
         BackStyle       =   0  'Transparent
         Caption         =   "Длительность (час):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   2385
         Width           =   3000
      End
      Begin VB.Label lblTheLength 
         BackStyle       =   0  'Transparent
         Caption         =   "Километраж:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   1680
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblPhone 
         BackStyle       =   0  'Transparent
         Caption         =   "Контактный телефон:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblThePerson 
         BackStyle       =   0  'Transparent
         Caption         =   "Контактное лицо:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblCollectTimeTo 
         BackStyle       =   0  'Transparent
         Caption         =   "По:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblCollectTimeFrom 
         BackStyle       =   0  'Transparent
         Caption         =   "Начиная с:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblCollectDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата получения груза:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblTheAddress 
         BackStyle       =   0  'Transparent
         Caption         =   "Адрес :"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblAutoType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип автотранспорта:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheFilial 
         BackStyle       =   0  'Transparent
         Caption         =   "Филиал:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PEKZ_ADLVR"
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

Private Sub txtTheFilial_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheFilial_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DEPT", ID, brief) Then
          txtTheFilial.Tag = Left(ID, 38)
          txtTheFilial = brief
        End If
End Sub
Private Sub cmdTheFilial_MenuClick(ByVal sCaption As String)
          txtTheFilial.Tag = ""
          txtTheFilial = ""
End Sub
Private Sub txtAutoType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdAutoType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_AUTO", ID, brief) Then
          txtAutoType.Tag = Left(ID, 38)
          txtAutoType = brief
        End If
End Sub
Private Sub cmdAutoType_MenuClick(ByVal sCaption As String)
          txtAutoType.Tag = ""
          txtAutoType = ""
End Sub
Private Sub txtTheAddress_Change()
  Changing

End Sub
Private Sub dtpCollectDate_Change()
  Changing

End Sub
Private Sub dtpCollectTimeFrom_Change()
  Changing

End Sub
Private Sub dtpCollectTimeTo_Change()
  Changing

End Sub
Private Sub txtThePerson_Change()
  Changing

End Sub
Private Sub txtPhone_Change()
  Changing

End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub txtTheLength_Validate(Cancel As Boolean)
If txtTheLength.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheLength.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheLength.SetFocus
  ElseIf Val(txtTheLength.Text) < -922337203685478# Or Val(txtTheLength.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTheLength.SetFocus
  End If
End If
End Sub
Private Sub txtTheLength_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheLength_Change()
  Changing

End Sub
Private Sub txtTheDuration_Validate(Cancel As Boolean)
If txtTheDuration.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheDuration.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheDuration.SetFocus
  ElseIf Val(txtTheDuration.Text) < -922337203685478# Or Val(txtTheDuration.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtTheDuration.SetFocus
  End If
End If
End Sub
Private Sub txtTheDuration_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheDuration_Change()
  Changing

End Sub
Private Sub txtInfo_Change()
  Changing

End Sub
Private Sub txtAutoSuplier_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdAutoSuplier_CLick()
  On Error Resume Next
     If txtAutoSuplier.Tag = "" Then
       cmdAutoSuplier_MenuClick "Выбрать"
     Else
       cmdAutoSuplier_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdAutoSuplier_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtAutoSuplier.Tag = ""
          txtAutoSuplier = ""
  End If
  If sCaption = "Открыть" Then
    If txtAutoSuplier.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtAutoSuplier.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtAutoSuplier.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2", "VRCCommonInfo_Transporter_Val=-1")
        If OK Then
          txtAutoSuplier.Tag = Left(ID, 38)
          txtAutoSuplier = brief
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
              txtAutoSuplier.Tag = ID
              txtAutoSuplier = brief
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
              txtAutoSuplier.Tag = obj.ID
              txtAutoSuplier = obj.brief
          Else
              txtAutoSuplier.Tag = ""
              txtAutoSuplier = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub dtpSupMoneyDate_Change()
  Changing

End Sub
Private Sub cmbCalcWithNDS_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtSummNDS_Change()
  Changing

End Sub
Private Sub txtSumm_Change()
  Changing

End Sub
Private Sub txtSupSumm_Change()
  Changing

End Sub
Private Sub txtSupSummNDS_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtTheFilial.Tag <> ""
If mIsOK Then mIsOK = txtAutoType.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtTheAddress.Text)
If mIsOK Then mIsOK = IsSet(dtpCollectDate.Value)
If mIsOK Then mIsOK = IsSet(dtpCollectTimeFrom.Value)
If mIsOK Then mIsOK = IsSet(txtThePerson.Text)
If mIsOK Then mIsOK = IsSet(txtPhone.Text)
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

If Not Item.TheFilial Is Nothing Then
  txtTheFilial.Tag = Item.TheFilial.ID
  txtTheFilial = Item.TheFilial.brief
Else
  txtTheFilial.Tag = ""
  txtTheFilial = ""
End If
 LoadBtnPictures cmdTheFilial, cmdTheFilial.Tag
  cmdTheFilial.RemoveAllMenu
  cmdTheFilial.AddMenu "Очистить"
If Not Item.AutoType Is Nothing Then
  txtAutoType.Tag = Item.AutoType.ID
  txtAutoType = Item.AutoType.brief
Else
  txtAutoType.Tag = ""
  txtAutoType = ""
End If
 LoadBtnPictures cmdAutoType, cmdAutoType.Tag
  cmdAutoType.RemoveAllMenu
  cmdAutoType.AddMenu "Очистить"
txtTheAddress = Item.TheAddress
dtpCollectDate = Date
If Item.CollectDate <> 0 Then
 dtpCollectDate = Item.CollectDate
End If
dtpCollectTimeFrom = Time
If Item.CollectTimeFrom <> 0 Then
 dtpCollectTimeFrom = Item.CollectTimeFrom
End If
dtpCollectTimeTo = Time
If Item.CollectTimeTo <> 0 Then
 dtpCollectTimeTo = Item.CollectTimeTo
Else
 dtpCollectTimeTo.Value = Null
End If
  On Error Resume Next
txtThePerson = Item.ThePerson
  On Error Resume Next
txtPhone = Item.Phone
txtTheComment = Item.TheComment
txtTheLength = Item.TheLength
txtTheDuration = Item.TheDuration
txtInfo = Item.Info
If Not Item.AutoSuplier Is Nothing Then
  txtAutoSuplier.Tag = Item.AutoSuplier.ID
  txtAutoSuplier = Item.AutoSuplier.brief
Else
  txtAutoSuplier.Tag = ""
  txtAutoSuplier = ""
End If
 LoadBtnPictures cmdAutoSuplier, cmdAutoSuplier.Tag
  cmdAutoSuplier.RemoveAllMenu
  cmdAutoSuplier.AddMenu "Очистить"
  cmdAutoSuplier.AddMenu "Создать"
  cmdAutoSuplier.AddMenu "Выбрать"
  cmdAutoSuplier.AddMenu "Открыть"
dtpSupMoneyDate = Date
If Item.SupMoneyDate <> 0 Then
 dtpSupMoneyDate = Item.SupMoneyDate
Else
 dtpSupMoneyDate.Value = Null
End If
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
txtSummNDS = Item.SummNDS
txtSumm = Item.Summ
txtSupSumm = Item.SupSumm
txtSupSummNDS = Item.SupSummNDS
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

If txtTheFilial.Tag <> "" Then
  Set Item.TheFilial = Item.Application.FindRowObject("PEKD_DEPT", txtTheFilial.Tag)
Else
  Set Item.TheFilial = Nothing
End If
If txtAutoType.Tag <> "" Then
  Set Item.AutoType = Item.Application.FindRowObject("PEKD_AUTO", txtAutoType.Tag)
Else
  Set Item.AutoType = Nothing
End If
Item.TheAddress = txtTheAddress
  If IsNull(dtpCollectDate) Then
    Item.CollectDate = 0
  Else
    Item.CollectDate = dtpCollectDate.Value
  End If
  If IsNull(dtpCollectTimeFrom) Then
    Item.CollectTimeFrom = 0
  Else
    Item.CollectTimeFrom = dtpCollectTimeFrom.Value
  End If
  If IsNull(dtpCollectTimeTo) Then
    Item.CollectTimeTo = 0
  Else
    Item.CollectTimeTo = dtpCollectTimeTo.Value
  End If
Item.ThePerson = txtThePerson
Item.Phone = txtPhone
Item.TheComment = txtTheComment
Item.TheLength = CDbl(txtTheLength)
Item.TheDuration = CDbl(txtTheDuration)
Item.Info = txtInfo
If txtAutoSuplier.Tag <> "" Then
  Set Item.AutoSuplier = Item.Application.Manager.GetInstanceObject(txtAutoSuplier.Tag)
Else
  Set Item.AutoSuplier = Nothing
End If
  If IsNull(dtpSupMoneyDate) Then
    Item.SupMoneyDate = 0
  Else
    Item.SupMoneyDate = dtpSupMoneyDate.Value
  End If
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



