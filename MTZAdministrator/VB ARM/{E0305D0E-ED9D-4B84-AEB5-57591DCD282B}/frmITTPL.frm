VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmITTPL 
   Caption         =   "Фильтр для Палетта"
   ClientHeight    =   3480
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3480
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
   Begin MSComctlLib.TabStrip ts 
      Height          =   1500
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   1
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Отмена"
      Height          =   330
      Left            =   0
      TabIndex        =   1
      ToolTipText     =   "Отказ от задания фильтра"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   750
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   330
      Left            =   0
      TabIndex        =   0
      ToolTipText     =   "Применить фильтр"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   750
   End
   Begin MTZ_PANEL.ScrolledWindow PanelfGroup 
      Height          =   1000
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin VB.ComboBox cmbPrivatePalet 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   44
         ToolTipText     =   "Чужой поддон"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblPrivatePalet 
         Caption         =   "Чужой поддон:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtCorePalette_ID_LE 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   42
         ToolTipText     =   "Идентификатор палеты в CoreIMS меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblCorePalette_ID_LE 
         Caption         =   "Идентификатор палеты в CoreIMS меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   41
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtCorePalette_ID_GE 
         Height          =   300
         Left            =   6600
         MaxLength       =   15
         TabIndex        =   40
         ToolTipText     =   "Идентификатор палеты в CoreIMS больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblCorePalette_ID_GE 
         Caption         =   "Идентификатор палеты в CoreIMS больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   39
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtPackageWeight_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   38
         ToolTipText     =   "Вес упаковки меньше или равно"
         Top             =   6240
         Width           =   1800
      End
      Begin VB.CheckBox lblPackageWeight_LE 
         Caption         =   "Вес упаковки меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   5910
         Width           =   3000
      End
      Begin VB.TextBox txtPackageWeight_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   36
         ToolTipText     =   "Вес упаковки больше или равно"
         Top             =   5535
         Width           =   1800
      End
      Begin VB.CheckBox lblPackageWeight_GE 
         Caption         =   "Вес упаковки больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   5205
         Width           =   3000
      End
      Begin VB.TextBox txtCurrentPosition 
         Height          =   300
         Left            =   3450
         MaxLength       =   12
         TabIndex        =   34
         ToolTipText     =   "Текущая ячейка склада"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.CheckBox lblCurrentPosition 
         Caption         =   "Текущая ячейка склада:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   4500
         Width           =   3000
      End
      Begin VB.TextBox txtCurrentWeightBrutto_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   32
         ToolTipText     =   "Вес поддона с товаром меньше или равно"
         Top             =   4125
         Width           =   1800
      End
      Begin VB.CheckBox lblCurrentWeightBrutto_LE 
         Caption         =   "Вес поддона с товаром меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   3795
         Width           =   3000
      End
      Begin VB.TextBox txtCurrentWeightBrutto_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   30
         ToolTipText     =   "Вес поддона с товаром больше или равно"
         Top             =   3420
         Width           =   1800
      End
      Begin VB.CheckBox lblCurrentWeightBrutto_GE 
         Caption         =   "Вес поддона с товаром больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   3090
         Width           =   3000
      End
      Begin VB.TextBox txtCurrentGood 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   28
         ToolTipText     =   "Текущий товар"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblCurrentGood 
         Caption         =   "Текущий товар:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtCaliberQuantity_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   26
         ToolTipText     =   "Количество коробов на поддоне меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblCaliberQuantity_LE 
         Caption         =   "Количество коробов на поддоне меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtCaliberQuantity_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   24
         ToolTipText     =   "Количество коробов на поддоне больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblCaliberQuantity_GE 
         Caption         =   "Количество коробов на поддоне больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpWDate_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   22
         ToolTipText     =   "Дата взвешивания по"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "HH:mm:ss"
         Format          =   16056323
         UpDown          =   -1  'True
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblWDate_LE 
         Caption         =   "Дата взвешивания по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpWDate_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   20
         ToolTipText     =   "Дата взвешивания C"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "HH:mm:ss"
         Format          =   16056323
         UpDown          =   -1  'True
         CurrentDate     =   39176
      End
      Begin VB.CheckBox lblWDate_GE 
         Caption         =   "Дата взвешивания C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPltype 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип палеты"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPltype 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "Тип палеты"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblPltype 
         Caption         =   "Тип палеты:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtWeight_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   15
         ToolTipText     =   "Вес паддона меньше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblWeight_LE 
         Caption         =   "Вес паддона меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtWeight_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   13
         ToolTipText     =   "Вес паддона больше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblWeight_GE 
         Caption         =   "Вес паддона больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtPalKode 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   11
         ToolTipText     =   "Штрихкод"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblPalKode 
         Caption         =   "Штрихкод:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   9
         ToolTipText     =   "Номер меньше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblTheNumber_LE 
         Caption         =   "Номер меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   7
         ToolTipText     =   "Номер больше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblTheNumber_GE 
         Caption         =   "Номер больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtCode 
         Height          =   300
         Left            =   300
         MaxLength       =   14
         TabIndex        =   5
         ToolTipText     =   "Код палеты"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblCode 
         Caption         =   "Код палеты:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   75
         Width           =   3000
      End
   End
   Begin VB.Menu mnuCtl 
      Caption         =   "mnuCtl"
      Visible         =   0   'False
      Begin VB.Menu mnuSetup 
         Caption         =   "Настройка"
      End
   End
End
Attribute VB_Name = "frmITTPL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Public Item As Object
Public OK As Boolean
Private OnInit As Boolean
Public Event Changed()
Private TSCustom As MTZ_CUSTOMTAB.TabStripCustomizer







Private Sub cmdOK_Click()
    On Error Resume Next
    OK = True
    Me.Hide
End Sub
Private Sub cmdCancel_Click()
    On Error Resume Next
    OK = False
    Me.Hide
End Sub
Public Sub Init(ObjItem As Object)
 Set Item = ObjItem
 If Item Is Nothing Then Set Item = MyUser.Application
 TInit
End Sub
Private Sub Form_Load()
  On Error Resume Next
  Dim ff As Long, buf As String
  LoadFromSkin Me
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdok.Height
  cmdok.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdok.Width, cmdok.Height
  cmdcancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdcancel.Width, cmdok.Height
  If Item Is Nothing Then Init MyUser.Application
End Sub
Private Sub Form_Unload(cancel As Integer)
  On Error Resume Next
  Set Item = Nothing
  Set TSCustom = Nothing
  SaveToSkin Me
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
  cancel = -1
End Sub
Private Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdok.Height
  cmdok.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdok.Width, cmdok.Height
  cmdcancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdok.Height, cmdcancel.Width, cmdok.Height
  ts_click
End Sub
Private Sub mnuSetup_Click()
TSCustom.Setup ts
End Sub
Private Sub ts_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu mnuCtl
  End If
End Sub
Private Sub ts_click()
  On Error Resume Next
  panelfGroup.Visible = False

   Select Case ts.SelectedItem.Key
   Case "fGroup"
     With panelfGroup
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     End With
     End Select
End Sub
Private Sub TInit()
  On Error Resume Next
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "Описание"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "ITTPL", "fctlITTPL"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtCode_Change()
  Changing
End Sub
Private Sub txtTheNumber_GE_Validate(cancel As Boolean)
If txtTheNumber_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNumber_GE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtTheNumber_GE.Text) <> CLng(val(txtTheNumber_GE.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtTheNumber_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheNumber_GE_Change()
  Changing
End Sub
Private Sub txtTheNumber_LE_Validate(cancel As Boolean)
If txtTheNumber_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheNumber_LE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtTheNumber_LE.Text) <> CLng(val(txtTheNumber_LE.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtTheNumber_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheNumber_LE_Change()
  Changing
End Sub
Private Sub txtPalKode_Change()
  Changing
End Sub
Private Sub txtWeight_GE_Validate(cancel As Boolean)
If txtWeight_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeight_GE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtWeight_GE.Text) < -922337203685478# Or val(txtWeight_GE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtWeight_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeight_GE_Change()
  Changing
End Sub
Private Sub txtWeight_LE_Validate(cancel As Boolean)
If txtWeight_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWeight_LE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtWeight_LE.Text) < -922337203685478# Or val(txtWeight_LE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtWeight_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWeight_LE_Change()
  Changing
End Sub
Private Sub txtPltype_Change()
  Changing
End Sub
Private Sub cmdPltype_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_PLTYPE", id, brief) Then
          txtPltype.Tag = Left(id, 38)
          txtPltype = brief
        End If
End Sub
Private Sub cmdPltype_MenuClick(ByVal sCaption As String)
End Sub
Private Sub dtpWDate_GE_Change()
  Changing
End Sub
Private Sub dtpWDate_LE_Change()
  Changing
End Sub
Private Sub txtCaliberQuantity_GE_Validate(cancel As Boolean)
If txtCaliberQuantity_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCaliberQuantity_GE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtCaliberQuantity_GE.Text) <> CLng(val(txtCaliberQuantity_GE.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtCaliberQuantity_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCaliberQuantity_GE_Change()
  Changing
End Sub
Private Sub txtCaliberQuantity_LE_Validate(cancel As Boolean)
If txtCaliberQuantity_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCaliberQuantity_LE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtCaliberQuantity_LE.Text) <> CLng(val(txtCaliberQuantity_LE.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtCaliberQuantity_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCaliberQuantity_LE_Change()
  Changing
End Sub
Private Sub txtCurrentGood_Change()
  Changing
End Sub
Private Sub txtCurrentWeightBrutto_GE_Validate(cancel As Boolean)
If txtCurrentWeightBrutto_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCurrentWeightBrutto_GE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtCurrentWeightBrutto_GE.Text) < -922337203685478# Or val(txtCurrentWeightBrutto_GE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtCurrentWeightBrutto_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCurrentWeightBrutto_GE_Change()
  Changing
End Sub
Private Sub txtCurrentWeightBrutto_LE_Validate(cancel As Boolean)
If txtCurrentWeightBrutto_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCurrentWeightBrutto_LE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtCurrentWeightBrutto_LE.Text) < -922337203685478# Or val(txtCurrentWeightBrutto_LE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtCurrentWeightBrutto_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCurrentWeightBrutto_LE_Change()
  Changing
End Sub
Private Sub txtCurrentPosition_Change()
  Changing
End Sub
Private Sub txtPackageWeight_GE_Validate(cancel As Boolean)
If txtPackageWeight_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPackageWeight_GE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPackageWeight_GE.Text) < -922337203685478# Or val(txtPackageWeight_GE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPackageWeight_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPackageWeight_GE_Change()
  Changing
End Sub
Private Sub txtPackageWeight_LE_Validate(cancel As Boolean)
If txtPackageWeight_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPackageWeight_LE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPackageWeight_LE.Text) < -922337203685478# Or val(txtPackageWeight_LE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPackageWeight_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPackageWeight_LE_Change()
  Changing
End Sub
Private Sub txtCorePalette_ID_GE_Validate(cancel As Boolean)
If txtCorePalette_ID_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCorePalette_ID_GE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtCorePalette_ID_GE.Text) <> CLng(val(txtCorePalette_ID_GE.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtCorePalette_ID_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCorePalette_ID_GE_Change()
  Changing
End Sub
Private Sub txtCorePalette_ID_LE_Validate(cancel As Boolean)
If txtCorePalette_ID_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCorePalette_ID_LE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtCorePalette_ID_LE.Text) <> CLng(val(txtCorePalette_ID_LE.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtCorePalette_ID_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCorePalette_ID_LE_Change()
  Changing
End Sub
Private Sub cmbPrivatePalet_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtCode = ""
txtPalKode = ""
  txtPltype.Tag = ""
  txtPltype = ""
 LoadBtnPictures cmdPltype, cmdPltype.Tag
  cmdPltype.RemoveAllMenu
dtpWDate_GE = Time
dtpWDate_LE = Time
txtCurrentPosition = ""
cmbPrivatePalet.Clear
cmbPrivatePalet.AddItem "Да"
cmbPrivatePalet.ItemData(cmbPrivatePalet.NewIndex) = -1
cmbPrivatePalet.AddItem "Нет"
cmbPrivatePalet.ItemData(cmbPrivatePalet.NewIndex) = 0
OnInit = False
End Sub



