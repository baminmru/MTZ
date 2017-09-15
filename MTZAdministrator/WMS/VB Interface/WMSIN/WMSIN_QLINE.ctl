VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl WMSIN_QLINE 
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
      Begin VB.ComboBox cmbNavalom 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   47
         ToolTipText     =   "Груз навалом"
         Top             =   1815
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpmade_date_to 
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         ToolTipText     =   "Дата окончания срока годности"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   20316163
         CurrentDate     =   39686
      End
      Begin MSMask.MaskEdBox txtKorobNetto 
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         ToolTipText     =   "Короб НЕТТО"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtKorobBrutto 
         Height          =   300
         Left            =   3450
         TabIndex        =   41
         ToolTipText     =   "Короб брутто"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtFullPackageWeight 
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         ToolTipText     =   "Суммарный вес упаковки КГ."
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
         Left            =   3450
         TabIndex        =   37
         ToolTipText     =   "Вес одной упаковки КГ."
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtCaliberWeight 
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         ToolTipText     =   "Вес калиброванной единицы НЕТТО"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.ComboBox cmbIsCalibrated 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   33
         ToolTipText     =   "Калиброванный груз"
         Top             =   3225
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpexp_date 
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         ToolTipText     =   "Срок годности"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   20316163
         CurrentDate     =   39686
      End
      Begin MSComCtl2.DTPicker dtpMade_date 
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         ToolTipText     =   "Дата производства"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   20316163
         CurrentDate     =   39686
      End
      Begin MTZ_PANEL.DropButton cmdPartRef 
         Height          =   300
         Left            =   6000
         TabIndex        =   27
         Tag             =   "refopen.ico"
         ToolTipText     =   "Партия"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPartRef 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   26
         ToolTipText     =   "Партия"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtVidOtruba 
         Height          =   300
         Left            =   3450
         MaxLength       =   64
         TabIndex        =   24
         ToolTipText     =   "Вид отруба"
         Top             =   405
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdKILL_NUMBER 
         Height          =   300
         Left            =   2850
         TabIndex        =   22
         Tag             =   "refopen.ico"
         ToolTipText     =   "№ бойни"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtKILL_NUMBER 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   21
         ToolTipText     =   "№ бойни"
         Top             =   6045
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdFactory 
         Height          =   300
         Left            =   2850
         TabIndex        =   19
         Tag             =   "refopen.ico"
         ToolTipText     =   "Завод"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFactory 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   18
         ToolTipText     =   "Завод"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdmade_country 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страна производитель"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtmade_country 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Страна производитель"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.TextBox txtarticul 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   13
         ToolTipText     =   "Артикул"
         Top             =   3930
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtCurValue 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Факт КГ."
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtedizm 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   9
         ToolTipText     =   "Ед. изм"
         Top             =   2520
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtQRY_NUM 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "По заказу КГ."
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdgoods 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Товар"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtgoods 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Товар"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtsequence 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "№ П\П"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblNavalom 
         BackStyle       =   0  'Transparent
         Caption         =   "Груз навалом:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblmade_date_to 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата окончания срока годности:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblKorobNetto 
         BackStyle       =   0  'Transparent
         Caption         =   "Короб НЕТТО:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblKorobBrutto 
         BackStyle       =   0  'Transparent
         Caption         =   "Короб брутто:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   40
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFullPackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Суммарный вес упаковки КГ.:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblPackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес одной упаковки КГ.:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblCaliberWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес калиброванной единицы НЕТТО:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblIsCalibrated 
         BackStyle       =   0  'Transparent
         Caption         =   "Калиброванный груз:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblexp_date 
         BackStyle       =   0  'Transparent
         Caption         =   "Срок годности:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblMade_date 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата производства:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPartRef 
         BackStyle       =   0  'Transparent
         Caption         =   "Партия:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblVidOtruba 
         BackStyle       =   0  'Transparent
         Caption         =   "Вид отруба:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblKILL_NUMBER 
         BackStyle       =   0  'Transparent
         Caption         =   "№ бойни:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFactory 
         BackStyle       =   0  'Transparent
         Caption         =   "Завод:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblmade_country 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна производитель:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblarticul 
         BackStyle       =   0  'Transparent
         Caption         =   "Артикул:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblCurValue 
         BackStyle       =   0  'Transparent
         Caption         =   "Факт КГ.:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lbledizm 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblQRY_NUM 
         BackStyle       =   0  'Transparent
         Caption         =   "По заказу КГ.:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblgoods 
         BackStyle       =   0  'Transparent
         Caption         =   "Товар:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblsequence 
         BackStyle       =   0  'Transparent
         Caption         =   "№ П\П:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSIN_QLINE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, cancel)
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

Private Sub txtsequence_Validate(cancel As Boolean)
If txtsequence.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtsequence.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtsequence.SetFocus
  ElseIf Val(txtsequence.Text) <> CLng(Val(txtsequence.Text)) Then
     cancel = True
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
Private Sub txtgoods_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdgoods_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSG_NOM", ID, brief) Then
          txtgoods.Tag = Left(ID, 38)
          txtgoods = brief
        End If
End Sub
Private Sub cmdgoods_MenuClick(ByVal sCaption As String)
          txtgoods.Tag = ""
          txtgoods = ""
End Sub
Private Sub txtQRY_NUM_Validate(cancel As Boolean)
If txtQRY_NUM.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQRY_NUM.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQRY_NUM.SetFocus
  ElseIf Val(txtQRY_NUM.Text) < -922337203685478# Or Val(txtQRY_NUM.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQRY_NUM.SetFocus
  End If
End If
End Sub
Private Sub txtQRY_NUM_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQRY_NUM_Change()
  Changing

End Sub
Private Sub txtedizm_Change()
  Changing

End Sub
Private Sub txtCurValue_Validate(cancel As Boolean)
If txtCurValue.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCurValue.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCurValue.SetFocus
  ElseIf Val(txtCurValue.Text) < -922337203685478# Or Val(txtCurValue.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCurValue.SetFocus
  End If
End If
End Sub
Private Sub txtCurValue_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCurValue_Change()
  Changing

End Sub
Private Sub txtarticul_Change()
  Changing

End Sub
Private Sub txtmade_country_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdmade_country_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_COUNTRY", ID, brief) Then
          txtmade_country.Tag = Left(ID, 38)
          txtmade_country = brief
        End If
End Sub
Private Sub cmdmade_country_MenuClick(ByVal sCaption As String)
          txtmade_country.Tag = ""
          txtmade_country = ""
End Sub
Private Sub txtFactory_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFactory_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_FACTORY", ID, brief, , , "WMSD_FACTORY_Country_ID='" & txtmade_country.Tag & "'") Then
          txtFactory.Tag = Left(ID, 38)
          txtFactory = brief
        End If
End Sub
Private Sub cmdFactory_MenuClick(ByVal sCaption As String)
          txtFactory.Tag = ""
          txtFactory = ""
End Sub
Private Sub txtKILL_NUMBER_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdKILL_NUMBER_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_KILLPLACE", ID, brief, , , "WMSD_KILLPLACE_Factory_ID='" & txtFactory.Tag & "'") Then
          txtKILL_NUMBER.Tag = Left(ID, 38)
          txtKILL_NUMBER = brief
        End If
End Sub
Private Sub cmdKILL_NUMBER_MenuClick(ByVal sCaption As String)
          txtKILL_NUMBER.Tag = ""
          txtKILL_NUMBER = ""
End Sub
Private Sub txtVidOtruba_Change()
  Changing

End Sub
Private Sub txtPartRef_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPartRef_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_PART", ID, brief) Then
          txtPartRef.Tag = Left(ID, 38)
          txtPartRef = brief
        End If
End Sub
Private Sub cmdPartRef_MenuClick(ByVal sCaption As String)
          txtPartRef.Tag = ""
          txtPartRef = ""
End Sub
Private Sub dtpMade_date_Change()
  Changing

End Sub
Private Sub dtpexp_date_Change()
  Changing

End Sub
Private Sub cmbIsCalibrated_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCaliberWeight_Validate(cancel As Boolean)
If txtCaliberWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCaliberWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCaliberWeight.SetFocus
  ElseIf Val(txtCaliberWeight.Text) < -922337203685478# Or Val(txtCaliberWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCaliberWeight.SetFocus
  End If
End If
End Sub
Private Sub txtCaliberWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCaliberWeight_Change()
  Changing

End Sub
Private Sub txtPackageWeight_Validate(cancel As Boolean)
If txtPackageWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPackageWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPackageWeight.SetFocus
  ElseIf Val(txtPackageWeight.Text) < -922337203685478# Or Val(txtPackageWeight.Text) > 922337203685478# Then
     cancel = True
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
Private Sub txtFullPackageWeight_Validate(cancel As Boolean)
If txtFullPackageWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtFullPackageWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtFullPackageWeight.SetFocus
  ElseIf Val(txtFullPackageWeight.Text) < -922337203685478# Or Val(txtFullPackageWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtFullPackageWeight.SetFocus
  End If
End If
End Sub
Private Sub txtFullPackageWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtFullPackageWeight_Change()
  Changing

End Sub
Private Sub txtKorobBrutto_Validate(cancel As Boolean)
If txtKorobBrutto.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtKorobBrutto.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtKorobBrutto.SetFocus
  ElseIf Val(txtKorobBrutto.Text) < -922337203685478# Or Val(txtKorobBrutto.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtKorobBrutto.SetFocus
  End If
End If
End Sub
Private Sub txtKorobBrutto_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtKorobBrutto_Change()
  Changing

End Sub
Private Sub txtKorobNetto_Validate(cancel As Boolean)
If txtKorobNetto.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtKorobNetto.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtKorobNetto.SetFocus
  ElseIf Val(txtKorobNetto.Text) < -922337203685478# Or Val(txtKorobNetto.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtKorobNetto.SetFocus
  End If
End If
End Sub
Private Sub txtKorobNetto_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtKorobNetto_Change()
  Changing

End Sub
Private Sub dtpmade_date_to_Change()
  Changing

End Sub
Private Sub cmbNavalom_Click()
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
If mIsOK Then mIsOK = txtgoods.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtQRY_NUM.Text)
If mIsOK Then mIsOK = IsSet(txtCurValue.Text)
If mIsOK Then mIsOK = IsSet(txtarticul.Text)
If mIsOK Then mIsOK = txtmade_country.Tag <> ""
If mIsOK Then mIsOK = txtFactory.Tag <> ""
If mIsOK Then mIsOK = IsSet(dtpMade_date.Value)
If mIsOK Then mIsOK = IsSet(dtpexp_date.Value)
If mIsOK Then mIsOK = (cmbIsCalibrated.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(txtPackageWeight.Text)
If mIsOK Then mIsOK = IsSet(txtKorobNetto.Text)
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
If Not Item.goods Is Nothing Then
  txtgoods.Tag = Item.goods.ID
  txtgoods = Item.goods.brief
Else
  txtgoods.Tag = ""
  txtgoods = ""
End If
 LoadBtnPictures cmdgoods, cmdgoods.Tag
  cmdgoods.RemoveAllMenu
  cmdgoods.AddMenu "Очистить"
txtQRY_NUM = Item.QRY_NUM
  On Error Resume Next
txtedizm = Item.edizm
txtCurValue = Item.CurValue
  On Error Resume Next
txtarticul = Item.articul
If Not Item.made_country Is Nothing Then
  txtmade_country.Tag = Item.made_country.ID
  txtmade_country = Item.made_country.brief
Else
  txtmade_country.Tag = ""
  txtmade_country = ""
End If
 LoadBtnPictures cmdmade_country, cmdmade_country.Tag
  cmdmade_country.RemoveAllMenu
  cmdmade_country.AddMenu "Очистить"
If Not Item.Factory Is Nothing Then
  txtFactory.Tag = Item.Factory.ID
  txtFactory = Item.Factory.brief
Else
  txtFactory.Tag = ""
  txtFactory = ""
End If
 LoadBtnPictures cmdFactory, cmdFactory.Tag
  cmdFactory.RemoveAllMenu
  cmdFactory.AddMenu "Очистить"
If Not Item.KILL_NUMBER Is Nothing Then
  txtKILL_NUMBER.Tag = Item.KILL_NUMBER.ID
  txtKILL_NUMBER = Item.KILL_NUMBER.brief
Else
  txtKILL_NUMBER.Tag = ""
  txtKILL_NUMBER = ""
End If
 LoadBtnPictures cmdKILL_NUMBER, cmdKILL_NUMBER.Tag
  cmdKILL_NUMBER.RemoveAllMenu
  cmdKILL_NUMBER.AddMenu "Очистить"
  On Error Resume Next
txtVidOtruba = Item.VidOtruba
If Not Item.PartRef Is Nothing Then
  txtPartRef.Tag = Item.PartRef.ID
  txtPartRef = Item.PartRef.brief
Else
  txtPartRef.Tag = ""
  txtPartRef = ""
End If
 LoadBtnPictures cmdPartRef, cmdPartRef.Tag
  cmdPartRef.RemoveAllMenu
  cmdPartRef.AddMenu "Очистить"
dtpMade_date = Date
If Item.Made_date <> 0 Then
 dtpMade_date = Item.Made_date
End If
dtpexp_date = Date
If Item.exp_date <> 0 Then
 dtpexp_date = Item.exp_date
End If
cmbIsCalibrated.Clear
cmbIsCalibrated.AddItem "Да"
cmbIsCalibrated.ItemData(cmbIsCalibrated.NewIndex) = -1
cmbIsCalibrated.AddItem "Нет"
cmbIsCalibrated.ItemData(cmbIsCalibrated.NewIndex) = 0
 For iii = 0 To cmbIsCalibrated.ListCount - 1
  If Item.IsCalibrated = cmbIsCalibrated.ItemData(iii) Then
   cmbIsCalibrated.ListIndex = iii
   Exit For
  End If
 Next
txtCaliberWeight = Item.CaliberWeight
txtPackageWeight = Item.PackageWeight
txtFullPackageWeight = Item.FullPackageWeight
txtKorobBrutto = Item.KorobBrutto
txtKorobNetto = Item.KorobNetto
dtpmade_date_to = Date
If Item.made_date_to <> 0 Then
 dtpmade_date_to = Item.made_date_to
Else
 dtpmade_date_to.Value = Null
End If
cmbNavalom.Clear
cmbNavalom.AddItem "Да"
cmbNavalom.ItemData(cmbNavalom.NewIndex) = -1
cmbNavalom.AddItem "Нет"
cmbNavalom.ItemData(cmbNavalom.NewIndex) = 0
 For iii = 0 To cmbNavalom.ListCount - 1
  If Item.Navalom = cmbNavalom.ItemData(iii) Then
   cmbNavalom.ListIndex = iii
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
If txtgoods.Tag <> "" Then
  Set Item.goods = Item.Application.FindRowObject("WMSG_NOM", txtgoods.Tag)
Else
  Set Item.goods = Nothing
End If
Item.QRY_NUM = CDbl(txtQRY_NUM)
Item.edizm = txtedizm
Item.CurValue = CDbl(txtCurValue)
Item.articul = txtarticul
If txtmade_country.Tag <> "" Then
  Set Item.made_country = Item.Application.FindRowObject("WMSD_COUNTRY", txtmade_country.Tag)
Else
  Set Item.made_country = Nothing
End If
If txtFactory.Tag <> "" Then
  Set Item.Factory = Item.Application.FindRowObject("WMSD_FACTORY", txtFactory.Tag)
Else
  Set Item.Factory = Nothing
End If
If txtKILL_NUMBER.Tag <> "" Then
  Set Item.KILL_NUMBER = Item.Application.FindRowObject("WMSD_KILLPLACE", txtKILL_NUMBER.Tag)
Else
  Set Item.KILL_NUMBER = Nothing
End If
Item.VidOtruba = txtVidOtruba
If txtPartRef.Tag <> "" Then
  Set Item.PartRef = Item.Application.FindRowObject("WMSD_PART", txtPartRef.Tag)
Else
  Set Item.PartRef = Nothing
End If
  If IsNull(dtpMade_date) Then
    Item.Made_date = 0
  Else
    Item.Made_date = dtpMade_date.Value
  End If
  If IsNull(dtpexp_date) Then
    Item.exp_date = 0
  Else
    Item.exp_date = dtpexp_date.Value
  End If
 If cmbIsCalibrated.ListIndex >= 0 Then
   Item.IsCalibrated = cmbIsCalibrated.ItemData(cmbIsCalibrated.ListIndex)
 End If
Item.CaliberWeight = CDbl(txtCaliberWeight)
Item.PackageWeight = CDbl(txtPackageWeight)
Item.FullPackageWeight = CDbl(txtFullPackageWeight)
Item.KorobBrutto = CDbl(txtKorobBrutto)
Item.KorobNetto = CDbl(txtKorobNetto)
  If IsNull(dtpmade_date_to) Then
    Item.made_date_to = 0
  Else
    Item.made_date_to = dtpmade_date_to.Value
  End If
 If cmbNavalom.ListIndex >= 0 Then
   Item.Navalom = cmbNavalom.ItemData(cmbNavalom.ListIndex)
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



