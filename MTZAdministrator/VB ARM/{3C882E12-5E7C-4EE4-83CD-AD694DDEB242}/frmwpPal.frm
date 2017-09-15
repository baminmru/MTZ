VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmwpPal 
   Caption         =   "Фильтр для Паллета"
   ClientHeight    =   3390
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3390
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
      Begin VB.TextBox txtS_code 
         Height          =   300
         Left            =   3450
         MaxLength       =   30
         TabIndex        =   27
         ToolTipText     =   "Штрихкод"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblS_code 
         Caption         =   "Штрихкод:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   75
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheCell 
         Height          =   300
         Left            =   2850
         TabIndex        =   25
         Tag             =   "refopen.ico"
         ToolTipText     =   "Текущая ячейка"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCell 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   24
         ToolTipText     =   "Текущая ячейка"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.CheckBox lblTheCell 
         Caption         =   "Текущая ячейка:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   23
         Top             =   5715
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdLockedForOut 
         Height          =   300
         Left            =   2850
         TabIndex        =   22
         Tag             =   "refopen.ico"
         ToolTipText     =   "Заблокирована для отгрузки"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtLockedForOut 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   21
         ToolTipText     =   "Заблокирована для отгрузки"
         Top             =   5340
         Width           =   2550
      End
      Begin VB.CheckBox lblLockedForOut 
         Caption         =   "Заблокирована для отгрузки:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdLockedForIn 
         Height          =   300
         Left            =   2850
         TabIndex        =   19
         Tag             =   "refopen.ico"
         ToolTipText     =   "Заблокирована для приемки"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtLockedForIn 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   18
         ToolTipText     =   "Заблокирована для приемки"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblLockedForIn 
         Caption         =   "Заблокирована для приемки:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   4305
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdpalType 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип паллеты"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtpalType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Тип паллеты"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.CheckBox lblpalType 
         Caption         =   "Тип паллеты:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpWeightingDate_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Дата взвешивания по"
         Top             =   3225
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   77856771
         CurrentDate     =   39926
      End
      Begin VB.CheckBox lblWeightingDate_LE 
         Caption         =   "Дата взвешивания по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpWeightingDate_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Дата взвешивания C"
         Top             =   2520
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   77856771
         CurrentDate     =   39926
      End
      Begin VB.CheckBox lblWeightingDate_GE 
         Caption         =   "Дата взвешивания C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtTheWeight_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   9
         ToolTipText     =   "Вес паллеты меньше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblTheWeight_LE 
         Caption         =   "Вес паллеты меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtTheWeight_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   7
         ToolTipText     =   "Вес паллеты больше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblTheWeight_GE 
         Caption         =   "Вес паллеты больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtTheNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   10
         TabIndex        =   5
         ToolTipText     =   "Номер паллеты"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblTheNumber 
         Caption         =   "Номер паллеты:"
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
Attribute VB_Name = "frmwpPal"
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
  TSCustom.Init ts, "wpPal", "fctlwpPal"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtTheNumber_Change()
  Changing
End Sub
Private Sub txtTheWeight_GE_Validate(cancel As Boolean)
If txtTheWeight_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheWeight_GE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtTheWeight_GE.Text) < -922337203685478# Or val(txtTheWeight_GE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtTheWeight_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheWeight_GE_Change()
  Changing
End Sub
Private Sub txtTheWeight_LE_Validate(cancel As Boolean)
If txtTheWeight_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheWeight_LE.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtTheWeight_LE.Text) < -922337203685478# Or val(txtTheWeight_LE.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtTheWeight_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheWeight_LE_Change()
  Changing
End Sub
Private Sub dtpWeightingDate_GE_Change()
  Changing
End Sub
Private Sub dtpWeightingDate_LE_Change()
  Changing
End Sub
Private Sub txtpalType_Change()
  Changing
End Sub
Private Sub cmdpalType_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpDic_paltype", id, brief) Then
          txtpalType.Tag = Left(id, 38)
          txtpalType = brief
        End If
End Sub
Private Sub cmdpalType_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtLockedForIn_Change()
  Changing
End Sub
Private Sub cmdLockedForIn_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpIn_def", id, brief) Then
          txtLockedForIn.Tag = Left(id, 38)
          txtLockedForIn = brief
        End If
End Sub
Private Sub cmdLockedForIn_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtLockedForOut_Change()
  Changing
End Sub
Private Sub cmdLockedForOut_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpOut_def", id, brief) Then
          txtLockedForOut.Tag = Left(id, 38)
          txtLockedForOut = brief
        End If
End Sub
Private Sub cmdLockedForOut_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtTheCell_Change()
  Changing
End Sub
Private Sub cmdTheCell_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpcell_cell", id, brief) Then
          txtTheCell.Tag = Left(id, 38)
          txtTheCell = brief
        End If
End Sub
Private Sub cmdTheCell_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtS_code_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtTheNumber = ""
dtpWeightingDate_GE = Now
dtpWeightingDate_LE = Now
  txtpalType.Tag = ""
  txtpalType = ""
 LoadBtnPictures cmdpalType, cmdpalType.Tag
  cmdpalType.RemoveAllMenu
  txtLockedForIn.Tag = ""
  txtLockedForIn = ""
 LoadBtnPictures cmdLockedForIn, cmdLockedForIn.Tag
  cmdLockedForIn.RemoveAllMenu
  txtLockedForOut.Tag = ""
  txtLockedForOut = ""
 LoadBtnPictures cmdLockedForOut, cmdLockedForOut.Tag
  cmdLockedForOut.RemoveAllMenu
  txtTheCell.Tag = ""
  txtTheCell = ""
 LoadBtnPictures cmdTheCell, cmdTheCell.Tag
  cmdTheCell.RemoveAllMenu
txtS_code = ""
OnInit = False
End Sub



