VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmPCB_Request 
   Caption         =   "Фильтр для Запрос"
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
      Begin MTZ_PANEL.DropButton cmdRepeatedRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   25
         Tag             =   "refopen.ico"
         ToolTipText     =   "Повтор заказа"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtRepeatedRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   24
         ToolTipText     =   "Повтор заказа"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.CheckBox lblRepeatedRef 
         Caption         =   "Повтор заказа:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   23
         Top             =   5715
         Width           =   3000
      End
      Begin VB.ComboBox cmbRepeated 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   22
         ToolTipText     =   "Повторный"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.CheckBox lblRepeated 
         Caption         =   "Повторный:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5010
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCuratorRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
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
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Ответственный"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.CheckBox lblCuratorRef 
         Caption         =   "Ответственный:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   4305
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCreator 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
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
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Создал"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.CheckBox lblCreator 
         Caption         =   "Создал:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   3600
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Дата создания по"
         Top             =   3225
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
         TabIndex        =   13
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpCreatedDT_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Дата создания C"
         Top             =   2520
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
         TabIndex        =   11
         Top             =   2190
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCustomer 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Заказчик"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustomer 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Заказчик"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblCustomer 
         Caption         =   "Заказчик:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtCutomerTaskID 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   7
         ToolTipText     =   "ID Заказа"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblCutomerTaskID 
         Caption         =   "ID Заказа:"
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
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Номер"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblTheNumber 
         Caption         =   "Номер:"
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
Attribute VB_Name = "frmPCB_Request"
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

ts.Tabs.Item(1).Caption = "Описание"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "PCB_Request", "fctlPCB_Request"
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
Private Sub txtCutomerTaskID_Change()
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
Private Sub dtpCreatedDT_GE_Change()
  Changing
End Sub
Private Sub dtpCreatedDT_LE_Change()
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
Private Sub cmbRepeated_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtRepeatedRef_Change()
  Changing
End Sub
Private Sub cmdRepeatedRef_CLick()
  On Error Resume Next
       cmdRepeatedRef_MenuClick "Выбрать"
End Sub
Private Sub cmdRepeatedRef_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtRepeatedRef.Tag = ""
          txtRepeatedRef = ""
  End If
  If sCaption = "Открыть" Then
    If txtRepeatedRef.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtRepeatedRef.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtRepeatedRef.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialog2(id, brief, "", "PCB_Order")
        If OK Then
          txtRepeatedRef.Tag = Left(id, 38)
          txtRepeatedRef = brief
        End If
  End If
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

txtTheNumber = ""
txtCutomerTaskID = ""
  txtCustomer.Tag = ""
  txtCustomer = ""
 LoadBtnPictures cmdCustomer, cmdCustomer.Tag
  cmdCustomer.RemoveAllMenu
  cmdCustomer.AddMenu "Выбрать"
dtpCreatedDT_GE = Now
dtpCreatedDT_LE = Now
  txtCreator.Tag = ""
  txtCreator = ""
 LoadBtnPictures cmdCreator, cmdCreator.Tag
  cmdCreator.RemoveAllMenu
  txtCuratorRef.Tag = ""
  txtCuratorRef = ""
 LoadBtnPictures cmdCuratorRef, cmdCuratorRef.Tag
  cmdCuratorRef.RemoveAllMenu
cmbRepeated.Clear
cmbRepeated.AddItem "Да"
cmbRepeated.ItemData(cmbRepeated.NewIndex) = -1
cmbRepeated.AddItem "Нет"
cmbRepeated.ItemData(cmbRepeated.NewIndex) = 0
  txtRepeatedRef.Tag = ""
  txtRepeatedRef = ""
 LoadBtnPictures cmdRepeatedRef, cmdRepeatedRef.Tag
  cmdRepeatedRef.RemoveAllMenu
  cmdRepeatedRef.AddMenu "Выбрать"
OnInit = False
End Sub



