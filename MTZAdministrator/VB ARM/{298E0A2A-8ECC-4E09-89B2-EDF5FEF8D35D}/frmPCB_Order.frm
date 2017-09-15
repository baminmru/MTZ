VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmPCB_Order 
   Caption         =   "Фильтр для Заказ"
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
         TabIndex        =   54
         ToolTipText     =   "Примечание"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblTheComment 
         Caption         =   "Примечание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         Top             =   1485
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCustomerURRef 
         Height          =   300
         Left            =   9150
         TabIndex        =   52
         Tag             =   "refopen.ico"
         ToolTipText     =   "Юр. лицо заказчика"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustomerURRef 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   51
         ToolTipText     =   "Юр. лицо заказчика"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.CheckBox lblCustomerURRef 
         Caption         =   "Юр. лицо заказчика:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   50
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtReasonStart 
         Height          =   300
         Left            =   6600
         MaxLength       =   255
         TabIndex        =   49
         ToolTipText     =   "Основание начала работ"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblReasonStart 
         Caption         =   "Основание начала работ:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   75
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdFileRef 
         Height          =   300
         Left            =   6000
         TabIndex        =   47
         Tag             =   "refopen.ico"
         ToolTipText     =   "Документ - основание"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFileRef 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   46
         ToolTipText     =   "Документ - основание"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.CheckBox lblFileRef 
         Caption         =   "Документ - основание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   45
         Top             =   5715
         Width           =   3000
      End
      Begin VB.TextBox txtReason 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   44
         ToolTipText     =   "Основание"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.CheckBox lblReason 
         Caption         =   "Основание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   43
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCuratorRef 
         Height          =   300
         Left            =   6000
         TabIndex        =   42
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ответственный"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCuratorRef 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   41
         ToolTipText     =   "Ответственный"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblCuratorRef 
         Caption         =   "Ответственный:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   40
         Top             =   4305
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCreator 
         Height          =   300
         Left            =   6000
         TabIndex        =   39
         Tag             =   "refopen.ico"
         ToolTipText     =   "Создал"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCreator 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   38
         ToolTipText     =   "Создал"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.CheckBox lblCreator 
         Caption         =   "Создал:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtProfit_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   36
         ToolTipText     =   "Прибыль меньше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblProfit_LE 
         Caption         =   "Прибыль меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtProfit_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   34
         ToolTipText     =   "Прибыль больше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblProfit_GE 
         Caption         =   "Прибыль больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtOrderSumm_LE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   32
         ToolTipText     =   "Сумма заказа меньше или равно"
         Top             =   1815
         Width           =   1800
      End
      Begin VB.CheckBox lblOrderSumm_LE 
         Caption         =   "Сумма заказа меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtOrderSumm_GE 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   30
         ToolTipText     =   "Сумма заказа больше или равно"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.CheckBox lblOrderSumm_GE 
         Caption         =   "Сумма заказа больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdRecipient 
         Height          =   300
         Left            =   6000
         TabIndex        =   28
         Tag             =   "refopen.ico"
         ToolTipText     =   "Получатель"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtRecipient 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   27
         ToolTipText     =   "Получатель"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblRecipient 
         Caption         =   "Получатель:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   75
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPayerRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   25
         Tag             =   "refopen.ico"
         ToolTipText     =   "Плательщик"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPayerRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   24
         ToolTipText     =   "Плательщик"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.CheckBox lblPayerRef 
         Caption         =   "Плательщик:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   23
         Top             =   5715
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   22
         ToolTipText     =   "Дата создания по"
         Top             =   5340
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
         Left            =   300
         TabIndex        =   21
         Top             =   5010
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   20
         ToolTipText     =   "Дата создания C"
         Top             =   4635
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
         Left            =   300
         TabIndex        =   19
         Top             =   4305
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdOrderRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "Повтор заказа"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOrderRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "Повтор заказа"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.CheckBox lblOrderRef 
         Caption         =   "Повтор заказа:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   3600
         Width           =   3000
      End
      Begin VB.TextBox txtRepeatCount_LE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   15
         ToolTipText     =   "Повторный меньше или равно"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.CheckBox lblRepeatCount_LE 
         Caption         =   "Повторный меньше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   2895
         Width           =   3000
      End
      Begin VB.TextBox txtRepeatCount_GE 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   13
         ToolTipText     =   "Повторный больше или равно"
         Top             =   2520
         Width           =   1800
      End
      Begin VB.CheckBox lblRepeatCount_GE 
         Caption         =   "Повторный больше или равно:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2190
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCustomerRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Заказчик"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustomerRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Заказчик"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblCustomerRef 
         Caption         =   "Заказчик:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   1485
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdRequestRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Запрос"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtRequestRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Запрос"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.CheckBox lblRequestRef 
         Caption         =   "Запрос:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtOrderNumber 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "№ Заказа"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblOrderNumber 
         Caption         =   "№ Заказа:"
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
Attribute VB_Name = "frmPCB_Order"
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

ts.Tabs.Item(1).Caption = "Описание заказа"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "PCB_Order", "fctlPCB_Order"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtOrderNumber_Change()
  Changing
End Sub
Private Sub txtRequestRef_Change()
  Changing
End Sub
Private Sub cmdRequestRef_CLick()
  On Error Resume Next
       cmdRequestRef_MenuClick "Выбрать"
End Sub
Private Sub cmdRequestRef_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtRequestRef.Tag = ""
          txtRequestRef = ""
  End If
  If sCaption = "Открыть" Then
    If txtRequestRef.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtRequestRef.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtRequestRef.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialog2(id, brief, "", "PCB_Request")
        If OK Then
          txtRequestRef.Tag = Left(id, 38)
          txtRequestRef = brief
        End If
  End If
End Sub
Private Sub txtCustomerRef_Change()
  Changing
End Sub
Private Sub cmdCustomerRef_CLick()
  On Error Resume Next
       cmdCustomerRef_MenuClick "Выбрать"
End Sub
Private Sub cmdCustomerRef_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtCustomerRef.Tag = ""
          txtCustomerRef = ""
  End If
  If sCaption = "Открыть" Then
    If txtCustomerRef.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtCustomerRef.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtCustomerRef.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialog2(id, brief, "", "PCB_Customer")
        If OK Then
          txtCustomerRef.Tag = Left(id, 38)
          txtCustomerRef = brief
        End If
  End If
End Sub
Private Sub txtRepeatCount_GE_Validate(Cancel As Boolean)
If txtRepeatCount_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtRepeatCount_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtRepeatCount_GE.Text) <> CLng(val(txtRepeatCount_GE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtRepeatCount_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtRepeatCount_GE_Change()
  Changing
End Sub
Private Sub txtRepeatCount_LE_Validate(Cancel As Boolean)
If txtRepeatCount_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtRepeatCount_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtRepeatCount_LE.Text) <> CLng(val(txtRepeatCount_LE.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtRepeatCount_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtRepeatCount_LE_Change()
  Changing
End Sub
Private Sub txtOrderRef_Change()
  Changing
End Sub
Private Sub cmdOrderRef_CLick()
  On Error Resume Next
       cmdOrderRef_MenuClick "Выбрать"
End Sub
Private Sub cmdOrderRef_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtOrderRef.Tag = ""
          txtOrderRef = ""
  End If
  If sCaption = "Открыть" Then
    If txtOrderRef.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtOrderRef.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtOrderRef.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialog2(id, brief, "", "PCB_Order")
        If OK Then
          txtOrderRef.Tag = Left(id, 38)
          txtOrderRef = brief
        End If
  End If
End Sub
Private Sub dtpCreatedDT_GE_Change()
  Changing
End Sub
Private Sub dtpCreatedDT_LE_Change()
  Changing
End Sub
Private Sub txtPayerRef_Change()
  Changing
End Sub
Private Sub cmdPayerRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_Cust_Payer", id, brief) Then
          txtPayerRef.Tag = Left(id, 38)
          txtPayerRef = brief
        End If
End Sub
Private Sub txtRecipient_Change()
  Changing
End Sub
Private Sub cmdRecipient_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_I_Orgs", id, brief) Then
          txtRecipient.Tag = Left(id, 38)
          txtRecipient = brief
        End If
End Sub
Private Sub txtOrderSumm_GE_Validate(Cancel As Boolean)
If txtOrderSumm_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtOrderSumm_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtOrderSumm_GE.Text) < -922337203685478# Or val(txtOrderSumm_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtOrderSumm_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtOrderSumm_GE_Change()
  Changing
End Sub
Private Sub txtOrderSumm_LE_Validate(Cancel As Boolean)
If txtOrderSumm_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtOrderSumm_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtOrderSumm_LE.Text) < -922337203685478# Or val(txtOrderSumm_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtOrderSumm_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtOrderSumm_LE_Change()
  Changing
End Sub
Private Sub txtProfit_GE_Validate(Cancel As Boolean)
If txtProfit_GE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtProfit_GE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtProfit_GE.Text) < -922337203685478# Or val(txtProfit_GE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtProfit_GE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtProfit_GE_Change()
  Changing
End Sub
Private Sub txtProfit_LE_Validate(Cancel As Boolean)
If txtProfit_LE.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtProfit_LE.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf val(txtProfit_LE.Text) < -922337203685478# Or val(txtProfit_LE.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtProfit_LE_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtProfit_LE_Change()
  Changing
End Sub
Private Sub txtCreator_Change()
  Changing
End Sub
Private Sub cmdCreator_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtCreator.Tag = Left(id, 38)
          txtCreator = brief
        End If
End Sub
Private Sub txtCuratorRef_Change()
  Changing
End Sub
Private Sub cmdCuratorRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtCuratorRef.Tag = Left(id, 38)
          txtCuratorRef = brief
        End If
End Sub
Private Sub txtReason_Change()
  Changing
End Sub
Private Sub txtFileRef_Change()
  Changing
End Sub
Private Sub cmdFileRef_CLick()
  On Error Resume Next
       cmdFileRef_MenuClick "Выбрать"
End Sub
Private Sub cmdFileRef_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtFileRef.Tag = ""
          txtFileRef = ""
  End If
  If sCaption = "Открыть" Then
    If txtFileRef.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtFileRef.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtFileRef.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialog2(id, brief, "", "PCB_File")
        If OK Then
          txtFileRef.Tag = Left(id, 38)
          txtFileRef = brief
        End If
  End If
End Sub
Private Sub txtReasonStart_Change()
  Changing
End Sub
Private Sub txtCustomerURRef_Change()
  Changing
End Sub
Private Sub cmdCustomerURRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_Cust_Payer", id, brief) Then
          txtCustomerURRef.Tag = Left(id, 38)
          txtCustomerURRef = brief
        End If
End Sub
Private Sub txtTheComment_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtOrderNumber = ""
  txtRequestRef.Tag = ""
  txtRequestRef = ""
 LoadBtnPictures cmdRequestRef, cmdRequestRef.Tag
  cmdRequestRef.RemoveAllMenu
  cmdRequestRef.AddMenu "Выбрать"
  txtCustomerRef.Tag = ""
  txtCustomerRef = ""
 LoadBtnPictures cmdCustomerRef, cmdCustomerRef.Tag
  cmdCustomerRef.RemoveAllMenu
  cmdCustomerRef.AddMenu "Выбрать"
  txtOrderRef.Tag = ""
  txtOrderRef = ""
 LoadBtnPictures cmdOrderRef, cmdOrderRef.Tag
  cmdOrderRef.RemoveAllMenu
  cmdOrderRef.AddMenu "Выбрать"
dtpCreatedDT_GE = Now
dtpCreatedDT_LE = Now
  txtPayerRef.Tag = ""
  txtPayerRef = ""
 LoadBtnPictures cmdPayerRef, cmdPayerRef.Tag
  cmdPayerRef.RemoveAllMenu
  txtRecipient.Tag = ""
  txtRecipient = ""
 LoadBtnPictures cmdRecipient, cmdRecipient.Tag
  cmdRecipient.RemoveAllMenu
  txtCreator.Tag = ""
  txtCreator = ""
 LoadBtnPictures cmdCreator, cmdCreator.Tag
  cmdCreator.RemoveAllMenu
  txtCuratorRef.Tag = ""
  txtCuratorRef = ""
 LoadBtnPictures cmdCuratorRef, cmdCuratorRef.Tag
  cmdCuratorRef.RemoveAllMenu
txtReason = ""
  txtFileRef.Tag = ""
  txtFileRef = ""
 LoadBtnPictures cmdFileRef, cmdFileRef.Tag
  cmdFileRef.RemoveAllMenu
  cmdFileRef.AddMenu "Выбрать"
txtReasonStart = ""
  txtCustomerURRef.Tag = ""
  txtCustomerURRef = ""
 LoadBtnPictures cmdCustomerURRef, cmdCustomerURRef.Tag
  cmdCustomerURRef.RemoveAllMenu
OnInit = False
End Sub



