VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmPCB_Delivery 
   Caption         =   "Фильтр для Задача по доставке"
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
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   6600
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   52
         ToolTipText     =   "Примечание"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComment 
         Caption         =   "Примечание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdContributorRef 
         Height          =   300
         Left            =   9150
         TabIndex        =   50
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ответственный"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtContributorRef 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   49
         ToolTipText     =   "Ответственный"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblContributorRef 
         Caption         =   "Ответственный:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactEndDT_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         ToolTipText     =   "Дата завершения факт по"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblFactEndDT_LE 
         Caption         =   "Дата завершения факт по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactEndDT_GE 
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         ToolTipText     =   "Дата завершения факт C"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblFactEndDT_GE 
         Caption         =   "Дата завершения факт C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         Top             =   780
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactStartDT_LE 
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         ToolTipText     =   "Дата начала факт по"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblFactStartDT_LE 
         Caption         =   "Дата начала факт по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         Top             =   75
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpFactStartDT_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   41
         ToolTipText     =   "Дата начала факт C"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblFactStartDT_GE 
         Caption         =   "Дата начала факт C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   40
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanEndDT_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         ToolTipText     =   "Дата завершения план по"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblPlanEndDT_LE 
         Caption         =   "Дата завершения план по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   5010
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlanEndDT_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         ToolTipText     =   "Дата завершения план C"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblPlanEndDT_GE 
         Caption         =   "Дата завершения план C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   4305
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlannedDT_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         ToolTipText     =   "Дата начала план по"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblPlannedDT_LE 
         Caption         =   "Дата начала план по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPlannedDT_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         ToolTipText     =   "Дата начала план C"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblPlannedDT_GE 
         Caption         =   "Дата начала план C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCreatedByRef 
         Height          =   300
         Left            =   6000
         TabIndex        =   31
         Tag             =   "refopen.ico"
         ToolTipText     =   "Создал"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCreatedByRef 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   30
         ToolTipText     =   "Создал"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblCreatedByRef 
         Caption         =   "Создал:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_LE 
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         ToolTipText     =   "Дата создания по"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblCreatedDT_LE 
         Caption         =   "Дата создания по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   1485
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_GE 
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         ToolTipText     =   "Дата создания C"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   16121859
         CurrentDate     =   39125
      End
      Begin VB.CheckBox lblCreatedDT_GE 
         Caption         =   "Дата создания C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtPhoneLink 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   24
         ToolTipText     =   "Телефон для связи"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblPhoneLink 
         Caption         =   "Телефон для связи:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdContactRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   22
         Tag             =   "refopen.ico"
         ToolTipText     =   "Контактное лицо заказчика"
         Top             =   6240
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtContactRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   21
         ToolTipText     =   "Контактное лицо заказчика"
         Top             =   6240
         Width           =   2550
      End
      Begin VB.CheckBox lblContactRef 
         Caption         =   "Контактное лицо заказчика:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5910
         Width           =   3000
      End
      Begin VB.TextBox txtTheComments 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   19
         ToolTipText     =   "Дополнения"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComments 
         Caption         =   "Дополнения:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   4305
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCustomerRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Адресат"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustomerRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Адресат"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.CheckBox lblCustomerRef 
         Caption         =   "Адресат:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdDeliveryTypeRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "Способ доставки"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDeliveryTypeRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "Способ доставки"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblDeliveryTypeRef 
         Caption         =   "Способ доставки:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtPriceDelivary_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   11
         ToolTipText     =   "Стоимость доставки меньше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceDelivary_LE 
         Caption         =   "Стоимость доставки меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtPriceDelivary_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   27
         TabIndex        =   9
         ToolTipText     =   "Стоимость доставки больше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblPriceDelivary_GE 
         Caption         =   "Стоимость доставки больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin VB.ComboBox cmbTaskType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "Тип задачи"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblTaskType 
         Caption         =   "Тип задачи:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtCountnumber 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Номер задачи"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblCountnumber 
         Caption         =   "Номер задачи:"
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
Attribute VB_Name = "frmPCB_Delivery"
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

ts.Tabs.Item(1).Caption = "Информация о доставке"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "PCB_Delivery", "fctlPCB_Delivery"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtCountnumber_Change()
  Changing
End Sub
Private Sub cmbTaskType_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtPriceDelivary_GE_Validate(Cancel As Boolean)
If txtPriceDelivary_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceDelivary_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceDelivary_GE.Text) < -922337203685478# Or val(txtPriceDelivary_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceDelivary_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceDelivary_GE_Change()
  Changing
End Sub
Private Sub txtPriceDelivary_LE_Validate(Cancel As Boolean)
If txtPriceDelivary_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriceDelivary_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtPriceDelivary_LE.Text) < -922337203685478# Or val(txtPriceDelivary_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriceDelivary_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriceDelivary_LE_Change()
  Changing
End Sub
Private Sub txtDeliveryTypeRef_Change()
  Changing
End Sub
Private Sub cmdDeliveryTypeRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_Delivery", id, brief) Then
          txtDeliveryTypeRef.Tag = Left(id, 38)
          txtDeliveryTypeRef = brief
        End If
End Sub
Private Sub txtCustomerRef_Change()
  Changing
End Sub
Private Sub cmdCustomerRef_CLick()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_Cust_Payer", id, brief) Then
          txtCustomerRef.Tag = Left(id, 38)
          txtCustomerRef = brief
        End If
End Sub
Private Sub txtTheComments_Change()
  Changing
End Sub
Private Sub txtContactRef_Change()
  Changing
End Sub
Private Sub cmdContactRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_Cust_Person", id, brief) Then
          txtContactRef.Tag = Left(id, 38)
          txtContactRef = brief
        End If
End Sub
Private Sub txtPhoneLink_Change()
  Changing
End Sub
Private Sub dtpCreatedDT_GE_Change()
  Changing
End Sub
Private Sub dtpCreatedDT_LE_Change()
  Changing
End Sub
Private Sub txtCreatedByRef_Change()
  Changing
End Sub
Private Sub cmdCreatedByRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtCreatedByRef.Tag = Left(id, 38)
          txtCreatedByRef = brief
        End If
End Sub
Private Sub dtpPlannedDT_GE_Change()
  Changing
End Sub
Private Sub dtpPlannedDT_LE_Change()
  Changing
End Sub
Private Sub dtpPlanEndDT_GE_Change()
  Changing
End Sub
Private Sub dtpPlanEndDT_LE_Change()
  Changing
End Sub
Private Sub dtpFactStartDT_GE_Change()
  Changing
End Sub
Private Sub dtpFactStartDT_LE_Change()
  Changing
End Sub
Private Sub dtpFactEndDT_GE_Change()
  Changing
End Sub
Private Sub dtpFactEndDT_LE_Change()
  Changing
End Sub
Private Sub txtContributorRef_Change()
  Changing
End Sub
Private Sub cmdContributorRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtContributorRef.Tag = Left(id, 38)
          txtContributorRef = brief
        End If
End Sub
Private Sub txtTheComment_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtCountnumber = ""
cmbTaskType.Clear
cmbTaskType.AddItem "Доставка"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 4
cmbTaskType.AddItem "Изготовление ПП"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 1
cmbTaskType.AddItem "Поставка комплектующих"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 2
cmbTaskType.AddItem "Монтаж ПП"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 0
cmbTaskType.AddItem "Проектирование ПП"
cmbTaskType.ItemData(cmbTaskType.NewIndex) = 3
  txtDeliveryTypeRef.Tag = ""
  txtDeliveryTypeRef = ""
 LoadBtnPictures cmdDeliveryTypeRef, cmdDeliveryTypeRef.Tag
  cmdDeliveryTypeRef.RemoveAllMenu
  txtCustomerRef.Tag = ""
  txtCustomerRef = ""
 LoadBtnPictures cmdCustomerRef, cmdCustomerRef.Tag
  cmdCustomerRef.RemoveAllMenu
  txtContactRef.Tag = ""
  txtContactRef = ""
 LoadBtnPictures cmdContactRef, cmdContactRef.Tag
  cmdContactRef.RemoveAllMenu
txtPhoneLink = ""
dtpCreatedDT_GE = Now
dtpCreatedDT_LE = Now
  txtCreatedByRef.Tag = ""
  txtCreatedByRef = ""
 LoadBtnPictures cmdCreatedByRef, cmdCreatedByRef.Tag
  cmdCreatedByRef.RemoveAllMenu
dtpPlannedDT_GE = Date
dtpPlannedDT_LE = Date
dtpPlanEndDT_GE = Date
dtpPlanEndDT_LE = Date
dtpFactStartDT_GE = Date
dtpFactStartDT_LE = Date
dtpFactEndDT_GE = Date
dtpFactEndDT_LE = Date
  txtContributorRef.Tag = ""
  txtContributorRef = ""
 LoadBtnPictures cmdContributorRef, cmdContributorRef.Tag
  cmdContributorRef.RemoveAllMenu
OnInit = False
End Sub



