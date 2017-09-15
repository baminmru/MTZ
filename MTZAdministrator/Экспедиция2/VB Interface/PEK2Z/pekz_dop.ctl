VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl pekz_dop 
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
      Begin VB.ComboBox cmbCalcWithNDS 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   34
         ToolTipText     =   "Расчет с НДС"
         Top             =   4635
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtSupSummNDS 
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         ToolTipText     =   "Сумма поставщику с НДС"
         Top             =   3930
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
         Left            =   3450
         TabIndex        =   30
         ToolTipText     =   "Сумма поставщику без НДС"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtSupTRF 
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         ToolTipText     =   "Тариф поставщика"
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
      Begin MSMask.MaskEdBox txtSummNDS 
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         ToolTipText     =   "Сумма с НДС"
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
         Left            =   3450
         TabIndex        =   24
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
      Begin MSMask.MaskEdBox txtTRF 
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         ToolTipText     =   "Тариф"
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
      Begin MSComCtl2.DTPicker dtpSupMoneyDate 
         Height          =   300
         Left            =   300
         TabIndex        =   20
         ToolTipText     =   "Cписание денежных средств поставщиком"
         Top             =   6240
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16449539
         CurrentDate     =   39567
      End
      Begin MTZ_PANEL.DropButton cmdDopSupplier 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поставщик"
         Top             =   5535
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDopSupplier 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "Поставщик"
         Top             =   5535
         Width           =   2550
      End
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         ToolTipText     =   "Примечание"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPathFilial 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Филиал"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPathFilial 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Филиал"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdEDIZM 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. измерения"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtEDIZM 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Ед. измерения"
         Top             =   2520
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtQuantity 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Количество"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdSRV 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Услуга"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSRV 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Услуга"
         Top             =   1110
         Width           =   2550
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
      Begin VB.Label lblCalcWithNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Расчет с НДС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblSupSummNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма поставщику с НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblSupSumm 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма поставщику без НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblSupTRF 
         BackStyle       =   0  'Transparent
         Caption         =   "Тариф поставщика:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSummNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма с НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblSumm 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма без НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTRF 
         BackStyle       =   0  'Transparent
         Caption         =   "Тариф:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblSupMoneyDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Cписание денежных средств поставщиком:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblDopSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPathFilial 
         BackStyle       =   0  'Transparent
         Caption         =   "Филиал:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. измерения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblSRV 
         BackStyle       =   0  'Transparent
         Caption         =   "Услуга:"
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
Attribute VB_Name = "pekz_dop"
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
Private Sub txtSRV_Change()
  If Not (OnInit) Then
  Changing
         Dim w As Double, i As Long, srvtmp As Object
         If txtSRV.Tag <> "" Then
           Set srvtmp = Item.Application.FindRowObject("PEKD_SRV", txtSRV.Tag)
           If Not srvtmp Is Nothing Then

             If srvtmp.DependOnWeight = -1 Then
                w = 0
                For i = 1 To Item.Application.pekz_path.Count
                   w = w + Item.Application.pekz_path.Item(i).PPOWeight
                Next
              
               txtQuantity = w
             End If

             If Not srvtmp.EDIZM Is Nothing Then
                txtEDIZM.Text = srvtmp.EDIZM.brief
                txtEDIZM.Tag = srvtmp.EDIZM.ID
             End If
            End If
          End If
  End If
End Sub
Private Sub cmdSRV_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_SRV", ID, brief, , , IIf(txtPathFilial.Tag <> "", " id in (select srvType from PEKTRF_SRV join  PEKTRF_DEF on PEKTRF_SRV.instanceid =PEKTRF_DEF.instanceid where Price >0 and theFilial='" & txtPathFilial.Tag & "')", "id in (select srvType from PEKTRF_SRV)")) Then
          txtSRV.Tag = Left(ID, 38)
          txtSRV = brief
        End If
End Sub
Private Sub cmdSRV_MenuClick(ByVal sCaption As String)
          txtSRV.Tag = ""
          txtSRV = ""
End Sub
Private Sub txtQuantity_Validate(Cancel As Boolean)
If txtQuantity.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQuantity.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQuantity.SetFocus
  ElseIf Val(txtQuantity.Text) < -922337203685478# Or Val(txtQuantity.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQuantity.SetFocus
  End If
End If
End Sub
Private Sub txtQuantity_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQuantity_Change()
  Changing

End Sub
Private Sub txtEDIZM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdEDIZM_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ENTDIC_EDIZM", ID, brief) Then
          txtEDIZM.Tag = Left(ID, 38)
          txtEDIZM = brief
        End If
End Sub
Private Sub cmdEDIZM_MenuClick(ByVal sCaption As String)
          txtEDIZM.Tag = ""
          txtEDIZM = ""
End Sub
Private Sub txtPathFilial_Change()
  If Not (OnInit) Then
  Changing
On Error Resume Next
If txtPathFilial.Tag <> "" Then

  txtDopSupplier.Text = Item.Application.FindRowObject("PEKD_DEPT", txtPathFilial.Tag).supplier.brief
  txtDopSupplier.Tag = Item.Application.FindRowObject("PEKD_DEPT", txtPathFilial.Tag).supplier.ID

End If
  End If
End Sub
Private Sub cmdPathFilial_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DEPT", ID, brief) Then
          txtPathFilial.Tag = Left(ID, 38)
          txtPathFilial = brief
        End If
End Sub
Private Sub cmdPathFilial_MenuClick(ByVal sCaption As String)
          txtPathFilial.Tag = ""
          txtPathFilial = ""
End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub txtDopSupplier_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDopSupplier_CLick()
  On Error Resume Next
     If txtDopSupplier.Tag = "" Then
       cmdDopSupplier_MenuClick "Выбрать"
     Else
       cmdDopSupplier_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdDopSupplier_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtDopSupplier.Tag = ""
          txtDopSupplier = ""
  End If
  If sCaption = "Открыть" Then
    If txtDopSupplier.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtDopSupplier.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtDopSupplier.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2", "VRCCommonInfo_Transporter_Val=-1")
        If OK Then
          txtDopSupplier.Tag = Left(ID, 38)
          txtDopSupplier = brief
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
              txtDopSupplier.Tag = ID
              txtDopSupplier = brief
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
              txtDopSupplier.Tag = obj.ID
              txtDopSupplier = obj.brief
          Else
              txtDopSupplier.Tag = ""
              txtDopSupplier = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub dtpSupMoneyDate_Change()
  Changing

End Sub
Private Sub txtTRF_Change()
  Changing

End Sub
Private Sub txtSumm_Change()
  Changing

End Sub
Private Sub txtSummNDS_Change()
  Changing

End Sub
Private Sub txtSupTRF_Change()
  Changing

End Sub
Private Sub txtSupSumm_Change()
  Changing

End Sub
Private Sub txtSupSummNDS_Change()
  Changing

End Sub
Private Sub cmbCalcWithNDS_Click()
  On Error Resume Next
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
If mIsOK Then mIsOK = txtSRV.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtQuantity.Text)
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
If Not Item.SRV Is Nothing Then
  txtSRV.Tag = Item.SRV.ID
  txtSRV = Item.SRV.brief
Else
  txtSRV.Tag = ""
  txtSRV = ""
End If
 LoadBtnPictures cmdSRV, cmdSRV.Tag
  cmdSRV.RemoveAllMenu
  cmdSRV.AddMenu "Очистить"
txtQuantity = Item.Quantity
If Not Item.EDIZM Is Nothing Then
  txtEDIZM.Tag = Item.EDIZM.ID
  txtEDIZM = Item.EDIZM.brief
Else
  txtEDIZM.Tag = ""
  txtEDIZM = ""
End If
 LoadBtnPictures cmdEDIZM, cmdEDIZM.Tag
  cmdEDIZM.RemoveAllMenu
  cmdEDIZM.AddMenu "Очистить"
If Not Item.PathFilial Is Nothing Then
  txtPathFilial.Tag = Item.PathFilial.ID
  txtPathFilial = Item.PathFilial.brief
Else
  txtPathFilial.Tag = ""
  txtPathFilial = ""
End If
 LoadBtnPictures cmdPathFilial, cmdPathFilial.Tag
  cmdPathFilial.RemoveAllMenu
  cmdPathFilial.AddMenu "Очистить"
txtTheComment = Item.TheComment
If Not Item.DopSupplier Is Nothing Then
  txtDopSupplier.Tag = Item.DopSupplier.ID
  txtDopSupplier = Item.DopSupplier.brief
Else
  txtDopSupplier.Tag = ""
  txtDopSupplier = ""
End If
 LoadBtnPictures cmdDopSupplier, cmdDopSupplier.Tag
  cmdDopSupplier.RemoveAllMenu
  cmdDopSupplier.AddMenu "Очистить"
  cmdDopSupplier.AddMenu "Создать"
  cmdDopSupplier.AddMenu "Выбрать"
  cmdDopSupplier.AddMenu "Открыть"
dtpSupMoneyDate = Date
If Item.SupMoneyDate <> 0 Then
 dtpSupMoneyDate = Item.SupMoneyDate
Else
 dtpSupMoneyDate.Value = Null
End If
txtTRF = Item.TRF
txtSumm = Item.Summ
txtSummNDS = Item.SummNDS
txtSupTRF = Item.SupTRF
txtSupSumm = Item.SupSumm
txtSupSummNDS = Item.SupSummNDS
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
If txtSRV.Tag <> "" Then
  Set Item.SRV = Item.Application.FindRowObject("PEKD_SRV", txtSRV.Tag)
Else
  Set Item.SRV = Nothing
End If
Item.Quantity = CDbl(txtQuantity)
If txtEDIZM.Tag <> "" Then
  Set Item.EDIZM = Item.Application.FindRowObject("ENTDIC_EDIZM", txtEDIZM.Tag)
Else
  Set Item.EDIZM = Nothing
End If
If txtPathFilial.Tag <> "" Then
  Set Item.PathFilial = Item.Application.FindRowObject("PEKD_DEPT", txtPathFilial.Tag)
Else
  Set Item.PathFilial = Nothing
End If
Item.TheComment = txtTheComment
If txtDopSupplier.Tag <> "" Then
  Set Item.DopSupplier = Item.Application.Manager.GetInstanceObject(txtDopSupplier.Tag)
Else
  Set Item.DopSupplier = Nothing
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



