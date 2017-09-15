VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmTP_RaspisPoesd 
   Caption         =   "Фильтр для Расписание поездок инженеров"
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
      Begin VB.TextBox txtKomment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   20
         ToolTipText     =   "Комментарий"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblKomment 
         Caption         =   "Комментарий:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   4305
         Width           =   3000
      End
      Begin VB.ComboBox cmbVipolnenno 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   18
         ToolTipText     =   "Заявка выполненна"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.CheckBox lblVipolnenno 
         Caption         =   "Заявка выполненна:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdVremjaVipoln 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Время выполнения"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtVremjaVipoln 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Время выполнения"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblVremjaVipoln 
         Caption         =   "Время выполнения:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   2895
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpData_LE 
         Height          =   300
         Left            =   300
         TabIndex        =   13
         ToolTipText     =   "Дата выполнения по"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   79822851
         CurrentDate     =   39781
      End
      Begin VB.CheckBox lblData_LE 
         Caption         =   "Дата выполнения по:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2190
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpData_GE 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Дата выполнения C"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   79822851
         CurrentDate     =   39781
      End
      Begin VB.CheckBox lblData_GE 
         Caption         =   "Дата выполнения C:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   1485
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdIng 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Инженер"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtIng 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Инженер"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.CheckBox lblIng 
         Caption         =   "Инженер:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdZayav 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Заявка"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtZayav 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Заявка"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lblZayav 
         Caption         =   "Заявка:"
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
Attribute VB_Name = "frmTP_RaspisPoesd"
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

ts.Tabs.Item(1).Caption = "Расписание"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "TP_RaspisPoesd", "fctlTP_RaspisPoesd"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub txtZayav_Change()
  Changing
End Sub
Private Sub cmdZayav_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Zayv", id, brief) Then
          txtZayav.Tag = Left(id, 38)
          txtZayav = brief
        End If
End Sub
Private Sub cmdZayav_MenuClick(ByVal sCaption As String)
End Sub
Private Sub txtIng_Change()
  Changing
End Sub
Private Sub cmdIng_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_Ing", id, brief) Then
          txtIng.Tag = Left(id, 38)
          txtIng = brief
        End If
End Sub
Private Sub cmdIng_MenuClick(ByVal sCaption As String)
End Sub
Private Sub dtpData_GE_Change()
  Changing
End Sub
Private Sub dtpData_LE_Change()
  Changing
End Sub
Private Sub txtVremjaVipoln_Change()
  Changing
End Sub
Private Sub cmdVremjaVipoln_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("TP_Spr_VrVisInst", id, brief) Then
          txtVremjaVipoln.Tag = Left(id, 38)
          txtVremjaVipoln = brief
        End If
End Sub
Private Sub cmdVremjaVipoln_MenuClick(ByVal sCaption As String)
End Sub
Private Sub cmbVipolnenno_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtKomment_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

  txtZayav.Tag = ""
  txtZayav = ""
 LoadBtnPictures cmdZayav, cmdZayav.Tag
  cmdZayav.RemoveAllMenu
  txtIng.Tag = ""
  txtIng = ""
 LoadBtnPictures cmdIng, cmdIng.Tag
  cmdIng.RemoveAllMenu
dtpData_GE = Date
dtpData_LE = Date
  txtVremjaVipoln.Tag = ""
  txtVremjaVipoln = ""
 LoadBtnPictures cmdVremjaVipoln, cmdVremjaVipoln.Tag
  cmdVremjaVipoln.RemoveAllMenu
cmbVipolnenno.Clear
cmbVipolnenno.AddItem "Да"
cmbVipolnenno.ItemData(cmbVipolnenno.NewIndex) = -1
cmbVipolnenno.AddItem "Нет"
cmbVipolnenno.ItemData(cmbVipolnenno.NewIndex) = 0
OnInit = False
End Sub



