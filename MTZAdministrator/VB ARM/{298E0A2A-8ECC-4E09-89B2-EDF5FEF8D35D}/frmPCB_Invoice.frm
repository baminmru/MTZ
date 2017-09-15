VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmPCB_Invoice 
   Caption         =   "Фильтр для Счёт"
   ClientHeight    =   3480
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3480
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
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
   Begin MTZ_PANEL.ScrolledWindow PanelfGroup 
      Height          =   1000
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin MTZ_PANEL.DropButton cmdPCBReceiver 
         Height          =   300
         Left            =   6000
         TabIndex        =   44
         Tag             =   "refopen.ico"
         ToolTipText     =   "PCBP Получатель"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPCBReceiver 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   43
         ToolTipText     =   "PCBP Получатель"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.CheckBox lblPCBReceiver 
         Caption         =   "PCBP Получатель:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   42
         Top             =   5715
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdEditedBy 
         Height          =   300
         Left            =   6000
         TabIndex        =   41
         Tag             =   "refopen.ico"
         ToolTipText     =   "Редактировал последним"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtEditedBy 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   40
         ToolTipText     =   "Редактировал последним"
         Top             =   5340
         Width           =   2550
      End
      Begin VB.CheckBox lblEditedBy 
         Caption         =   "Редактировал последним:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         Top             =   5010
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEditedDT_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         ToolTipText     =   "Отредактированно по"
         Top             =   4635
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblEditedDT_LE 
         Caption         =   "Отредактированно по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpEditedDT_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         ToolTipText     =   "Отредактированно C"
         Top             =   3930
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblEditedDT_GE 
         Caption         =   "Отредактированно C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCreatedBy 
         Height          =   300
         Left            =   6000
         TabIndex        =   34
         Tag             =   "refopen.ico"
         ToolTipText     =   "Кем внесено"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCreatedBy 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   33
         ToolTipText     =   "Кем внесено"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblCreatedBy 
         Caption         =   "Кем внесено:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         ToolTipText     =   "Внесено по"
         Top             =   2520
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblCreatedDT_LE 
         Caption         =   "Внесено по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         ToolTipText     =   "Внесено C"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblCreatedDT_GE 
         Caption         =   "Внесено C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtNotClosedPrice_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   27
         ToolTipText     =   "Не закрыто меньше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblNotClosedPrice_LE 
         Caption         =   "Не закрыто меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtNotClosedPrice_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   25
         ToolTipText     =   "Не закрыто больше или равно"
         Top             =   405
         Width           =   1800
      End
      Begin VB.CheckBox lblNotClosedPrice_GE 
         Caption         =   "Не закрыто больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtDebts_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   23
         ToolTipText     =   "Задолженность меньше или равно"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.CheckBox lblDebts_LE 
         Caption         =   "Задолженность меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   22
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtDebts_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   21
         ToolTipText     =   "Задолженность больше или равно"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.CheckBox lblDebts_GE 
         Caption         =   "Задолженность больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5010
         Width           =   3000
      End
      Begin VB.TextBox txtPrice_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   19
         ToolTipText     =   "Сумма меньше или равно"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.CheckBox lblPrice_LE 
         Caption         =   "Сумма меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   4305
         Width           =   3000
      End
      Begin VB.TextBox txtPrice_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   17
         ToolTipText     =   "Сумма больше или равно"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.CheckBox lblPrice_GE 
         Caption         =   "Сумма больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheManager 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "Менеджер"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheManager 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "Менеджер"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblTheManager 
         Caption         =   "Менеджер:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCustomer 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "Покупатель"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustomer 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Покупатель"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblCustomer 
         Caption         =   "Покупатель:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpInvoiceDT_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Дата по"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblInvoiceDT_LE 
         Caption         =   "Дата по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpInvoiceDT_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Дата C"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblInvoiceDT_GE 
         Caption         =   "Дата C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtInvNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Номер счёта"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblInvNumber 
         Caption         =   "Номер счёта:"
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
Attribute VB_Name = "frmPCB_Invoice"
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
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdOK.Height
  cmdOK.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdOK.Width, cmdOK.Height
  cmdCancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdCancel.Width, cmdOK.Height
  If Item Is Nothing Then Init MyUser.Application
End Sub
Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  Set Item = Nothing
  Set TSCustom = Nothing
  SaveToSkin Me
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
  Cancel = -1
End Sub
Private Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdOK.Height
  cmdOK.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdOK.Width, cmdOK.Height
  cmdCancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdCancel.Width, cmdOK.Height
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
  PanelfGroup.Visible = False

   Select Case ts.SelectedItem.Key
   Case "fGroup"
     With PanelfGroup
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

ts.Tabs.Item(1).Caption = "Информация"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "PCB_Invoice", "fctlPCB_Invoice"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtInvNumber_Change()
  Changing
End Sub
Private Sub dtpInvoiceDT_GE_Change()
  Changing
End Sub
Private Sub dtpInvoiceDT_LE_Change()
  Changing
End Sub
Private Sub txtCustomer_Change()
  Changing
End Sub
Private Sub cmdCustomer_CLick()
  On Error Resume Next
       cmdCustomer_MenuClick "Выбрать"
End Sub
Private Sub cmdCustomer_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtCustomer.Tag = ""
          txtCustomer = ""
  End If
  If sCaption = "Открыть" Then
    If txtCustomer.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtCustomer.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtCustomer.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialog2(id, brief, "", "PCB_Customer")
        If OK Then
          txtCustomer.Tag = Left(id, 38)
          txtCustomer = brief
        End If
  End If
End Sub
Private Sub txtTheManager_Change()
  Changing
End Sub
Private Sub cmdTheManager_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtTheManager.Tag = Left(id, 38)
          txtTheManager = brief
        End If
End Sub
Private Sub txtPrice_GE_Validate(Cancel As Boolean)
If txtPrice_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPrice_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPrice_GE.Text) < -922337203685478# Or val(txtPrice_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPrice_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPrice_GE_Change()
  Changing
End Sub
Private Sub txtPrice_LE_Validate(Cancel As Boolean)
If txtPrice_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPrice_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPrice_LE.Text) < -922337203685478# Or val(txtPrice_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPrice_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPrice_LE_Change()
  Changing
End Sub
Private Sub txtDebts_GE_Validate(Cancel As Boolean)
If txtDebts_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDebts_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtDebts_GE.Text) < -922337203685478# Or val(txtDebts_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtDebts_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDebts_GE_Change()
  Changing
End Sub
Private Sub txtDebts_LE_Validate(Cancel As Boolean)
If txtDebts_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDebts_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtDebts_LE.Text) < -922337203685478# Or val(txtDebts_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtDebts_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDebts_LE_Change()
  Changing
End Sub
Private Sub txtNotClosedPrice_GE_Validate(Cancel As Boolean)
If txtNotClosedPrice_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNotClosedPrice_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtNotClosedPrice_GE.Text) < -922337203685478# Or val(txtNotClosedPrice_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtNotClosedPrice_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNotClosedPrice_GE_Change()
  Changing
End Sub
Private Sub txtNotClosedPrice_LE_Validate(Cancel As Boolean)
If txtNotClosedPrice_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtNotClosedPrice_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtNotClosedPrice_LE.Text) < -922337203685478# Or val(txtNotClosedPrice_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtNotClosedPrice_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtNotClosedPrice_LE_Change()
  Changing
End Sub
Private Sub dtpCreatedDT_GE_Change()
  Changing
End Sub
Private Sub dtpCreatedDT_LE_Change()
  Changing
End Sub
Private Sub txtCreatedBy_Change()
  Changing
End Sub
Private Sub cmdCreatedBy_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtCreatedBy.Tag = Left(id, 38)
          txtCreatedBy = brief
        End If
End Sub
Private Sub dtpEditedDT_GE_Change()
  Changing
End Sub
Private Sub dtpEditedDT_LE_Change()
  Changing
End Sub
Private Sub txtEditedBy_Change()
  Changing
End Sub
Private Sub cmdEditedBy_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtEditedBy.Tag = Left(id, 38)
          txtEditedBy = brief
        End If
End Sub
Private Sub txtPCBReceiver_Change()
  Changing
End Sub
Private Sub cmdPCBReceiver_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_I_Orgs", id, brief) Then
          txtPCBReceiver.Tag = Left(id, 38)
          txtPCBReceiver = brief
        End If
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtInvNumber = ""
dtpInvoiceDT_GE = Date
dtpInvoiceDT_LE = Date
  txtCustomer.Tag = ""
  txtCustomer = ""
 LoadBtnPictures cmdCustomer, cmdCustomer.Tag
  cmdCustomer.RemoveAllMenu
  cmdCustomer.AddMenu "Выбрать"
  txtTheManager.Tag = ""
  txtTheManager = ""
 LoadBtnPictures cmdTheManager, cmdTheManager.Tag
  cmdTheManager.RemoveAllMenu
dtpCreatedDT_GE = Now
dtpCreatedDT_LE = Now
  txtCreatedBy.Tag = ""
  txtCreatedBy = ""
 LoadBtnPictures cmdCreatedBy, cmdCreatedBy.Tag
  cmdCreatedBy.RemoveAllMenu
dtpEditedDT_GE = Now
dtpEditedDT_LE = Now
  txtEditedBy.Tag = ""
  txtEditedBy = ""
 LoadBtnPictures cmdEditedBy, cmdEditedBy.Tag
  cmdEditedBy.RemoveAllMenu
  txtPCBReceiver.Tag = ""
  txtPCBReceiver = ""
 LoadBtnPictures cmdPCBReceiver, cmdPCBReceiver.Tag
  cmdPCBReceiver.RemoveAllMenu
OnInit = False
End Sub



