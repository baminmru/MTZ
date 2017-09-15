VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.6#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFFR_funcMAIN 
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
      Begin VB.TextBox txtFuncResult 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   17
         ToolTipText     =   "Результат"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.TextBox txtInfo 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         ToolTipText     =   "Текущее задание"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtWorkPercent 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   13
         ToolTipText     =   "Готовность"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.TextBox txtPriority 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   11
         ToolTipText     =   "Текущий приоритет"
         Top             =   3225
         Width           =   1800
      End
      Begin MSComCtl2.DTPicker dtpCreateAt 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Момент создания"
         Top             =   2520
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   3932163
         CurrentDate     =   37716
      End
      Begin VB.TextBox txtPassNo 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   7
         ToolTipText     =   "Проход"
         Top             =   1815
         Width           =   1800
      End
      Begin MTZ_PANEL.DropButton cmdBasedOn 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Реализует"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtBasedOn 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Реализует"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.ComboBox cmbState 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         ToolTipText     =   "Состояние"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblFuncResult 
         BackStyle       =   0  'Transparent
         Caption         =   "Результат:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущее задание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblWorkPercent 
         BackStyle       =   0  'Transparent
         Caption         =   "Готовность:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPriority 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущий приоритет:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCreateAt 
         BackStyle       =   0  'Transparent
         Caption         =   "Момент создания:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPassNo 
         BackStyle       =   0  'Transparent
         Caption         =   "Проход:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblBasedOn 
         BackStyle       =   0  'Transparent
         Caption         =   "Реализует:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblState 
         BackStyle       =   0  'Transparent
         Caption         =   "Состояние:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFFR_funcMAIN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()


Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub cmbState_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtBasedOn_Change()
  Changing
End Sub
Private Sub cmdBasedOn_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = Item.Application.Manager.GetReferenceDialogEx("WFDef_func")
        d.Show vbModal, Me
        If d.OK Then
          txtBasedOn.Tag = Left(d.ID, 38)
          txtBasedOn = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdBasedOn_MenuClick(ByVal sCaption As String)
          txtBasedOn.Tag = ""
          txtBasedOn = ""
End Sub
Private Sub txtPassNo_Validate(cancel As Boolean)
If txtPassNo.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPassNo.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtPassNo.Text) <> CLng(Val(txtPassNo.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPassNo_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPassNo_Change()
  Changing
End Sub
Private Sub dtpCreateAt_Change()
  Changing
End Sub
Private Sub txtPriority_Validate(cancel As Boolean)
If txtPriority.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPriority.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtPriority.Text) <> CLng(Val(txtPriority.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtPriority_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPriority_Change()
  Changing
End Sub
Private Sub txtWorkPercent_Validate(cancel As Boolean)
If txtWorkPercent.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWorkPercent.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtWorkPercent.Text) <> CLng(Val(txtWorkPercent.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtWorkPercent_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWorkPercent_Change()
  Changing
End Sub
Private Sub txtInfo_Change()
  Changing
End Sub
Private Sub txtFuncResult_Change()
  Changing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = (cmbState.ListIndex >= 0)
If mIsOK Then mIsOK = txtBasedOn.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtPassNo.Text)
  IsOK = mIsOK
End Function
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

cmbState.Clear
cmbState.AddItem "Processed"
cmbState.ItemData(cmbState.NewIndex) = 8
cmbState.AddItem "InWork"
cmbState.ItemData(cmbState.NewIndex) = 3
cmbState.AddItem "Pause"
cmbState.ItemData(cmbState.NewIndex) = 4
cmbState.AddItem "Ready"
cmbState.ItemData(cmbState.NewIndex) = 5
cmbState.AddItem "InControl"
cmbState.ItemData(cmbState.NewIndex) = 6
cmbState.AddItem "Prepare"
cmbState.ItemData(cmbState.NewIndex) = 1
cmbState.AddItem "Active"
cmbState.ItemData(cmbState.NewIndex) = 2
cmbState.AddItem "Done"
cmbState.ItemData(cmbState.NewIndex) = 7
cmbState.AddItem "Initial"
cmbState.ItemData(cmbState.NewIndex) = 0
 For iii = 0 To cmbState.ListCount - 1
  If Item.State = cmbState.ItemData(iii) Then
   cmbState.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.BasedOn Is Nothing Then
  txtBasedOn.Tag = Item.BasedOn.ID
  txtBasedOn = Item.BasedOn.Brief
Else
  txtBasedOn.Tag = ""
  txtBasedOn = ""
End If
 LoadBtnPictures cmdBasedOn, cmdBasedOn.Tag
  cmdBasedOn.RemoveAllMenu
txtPassNo = Item.PassNo
dtpCreateAt = Now
If Item.CreateAt <> 0 Then
 dtpCreateAt = Item.CreateAt
Else
 dtpCreateAt.Value = Null
End If
txtPriority = Item.Priority
txtWorkPercent = Item.WorkPercent
txtInfo = Item.Info
txtFuncResult = Item.FuncResult
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

Item.State = cmbState.ItemData(cmbState.ListIndex)
If txtBasedOn.Tag <> "" Then
  Set Item.BasedOn = Item.Application.FindRowObject("WFDef_func", txtBasedOn.Tag)
Else
  Set Item.BasedOn = Nothing
End If
Item.PassNo = CDbl(txtPassNo)
  If IsNull(dtpCreateAt) Then
    Item.CreateAt = 0
  Else
    Item.CreateAt = dtpCreateAt.Value
  End If
Item.Priority = CDbl(txtPriority)
Item.WorkPercent = CDbl(txtWorkPercent)
Item.Info = txtInfo
Item.FuncResult = txtFuncResult
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

