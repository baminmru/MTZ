VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.7#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.UserControl WFFD_common2 
   ClientHeight    =   6990
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8115
   ScaleHeight     =   6990
   ScaleWidth      =   8115
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   6660
      Left            =   0
      TabIndex        =   0
      Top             =   -15
      Width           =   7740
      _ExtentX        =   13653
      _ExtentY        =   11748
      Begin MSComDlg.CommonDialog Dialog 
         Left            =   3450
         Top             =   3645
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MTZ_PANEL.DropButton cmdAttachment 
         Height          =   300
         Left            =   6000
         TabIndex        =   28
         Tag             =   "fileopen.ico"
         ToolTipText     =   "��������"
         Top             =   3420
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtAttachment 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   27
         Text            =   "Text1"
         ToolTipText     =   "��������"
         Top             =   3420
         Width           =   2550
      End
      Begin VB.TextBox txtTaskDescription 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   25
         ToolTipText     =   "�������� �������"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtMaxPassNumber 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   23
         ToolTipText     =   "������������ ����� �������"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.TextBox txtGrowPriorityInterval 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   21
         ToolTipText     =   "�������� ����� ���������� (���.)"
         Top             =   405
         Width           =   1800
      End
      Begin VB.TextBox txtIncPriority 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   19
         ToolTipText     =   "������� ����������"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.TextBox txtMaxPriority 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   17
         ToolTipText     =   "������������ ���������"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.TextBox txtMinPriority 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   15
         ToolTipText     =   "����������� ���������"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.TextBox txtStateCeckInterval 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   13
         ToolTipText     =   "�������� �������� ��������� (���.)"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.TextBox txtReStartInterval 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   11
         ToolTipText     =   "�������� ����������� (���.)"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.ComboBox cmbAutoCheckState 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "��������� ���������"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbReuseStep 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "������������ ������������� ���"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdStepType 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ����"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtStepType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "��� ����"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "��������"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblAttachment 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblTaskDescription 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� �������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblMaxPassNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "������������ ����� �������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblGrowPriorityInterval 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ����� ���������� (���.):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblIncPriority 
         BackStyle       =   0  'Transparent
         Caption         =   "������� ����������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblMaxPriority 
         BackStyle       =   0  'Transparent
         Caption         =   "������������ ���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblMinPriority 
         BackStyle       =   0  'Transparent
         Caption         =   "����������� ���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblStateCeckInterval 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� �������� ��������� (���.):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblReStartInterval 
         BackStyle       =   0  'Transparent
         Caption         =   "�������� ����������� (���.):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblAutoCheckState 
         BackStyle       =   0  'Transparent
         Caption         =   "��������� ���������:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblReuseStep 
         BackStyle       =   0  'Transparent
         Caption         =   "������������ ������������� ���:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblStepType 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ����:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFFD_common"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()


Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtName_Change()
  Changing
End Sub
Private Sub txtStepType_Change()
  Changing
End Sub
Private Sub cmdStepType_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = Item.Application.Manager.GetReferenceDialogEx("WFDic_func")
        d.Show vbModal, Me
        If d.OK Then
          txtStepType.Tag = Left(d.ID, 38)
          txtStepType = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdStepType_MenuClick(ByVal sCaption As String)
          txtStepType.Tag = ""
          txtStepType = ""
End Sub
Private Sub cmbReuseStep_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbAutoCheckState_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtReStartInterval_Validate(Cancel As Boolean)
If txtReStartInterval.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtReStartInterval.Text) Then
     Cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf Val(txtReStartInterval.Text) <> CLng(Val(txtReStartInterval.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtReStartInterval_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtReStartInterval_Change()
  Changing
End Sub
Private Sub txtStateCeckInterval_Validate(Cancel As Boolean)
If txtStateCeckInterval.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtStateCeckInterval.Text) Then
     Cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf Val(txtStateCeckInterval.Text) <> CLng(Val(txtStateCeckInterval.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtStateCeckInterval_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtStateCeckInterval_Change()
  Changing
End Sub
Private Sub txtMinPriority_Validate(Cancel As Boolean)
If txtMinPriority.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMinPriority.Text) Then
     Cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf Val(txtMinPriority.Text) <> CLng(Val(txtMinPriority.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtMinPriority_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMinPriority_Change()
  Changing
End Sub
Private Sub txtMaxPriority_Validate(Cancel As Boolean)
If txtMaxPriority.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMaxPriority.Text) Then
     Cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf Val(txtMaxPriority.Text) <> CLng(Val(txtMaxPriority.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtMaxPriority_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMaxPriority_Change()
  Changing
End Sub
Private Sub txtIncPriority_Validate(Cancel As Boolean)
If txtIncPriority.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtIncPriority.Text) Then
     Cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf Val(txtIncPriority.Text) <> CLng(Val(txtIncPriority.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtIncPriority_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtIncPriority_Change()
  Changing
End Sub
Private Sub txtGrowPriorityInterval_Validate(Cancel As Boolean)
If txtGrowPriorityInterval.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtGrowPriorityInterval.Text) Then
     Cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf Val(txtGrowPriorityInterval.Text) <> CLng(Val(txtGrowPriorityInterval.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtGrowPriorityInterval_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtGrowPriorityInterval_Change()
  Changing
End Sub
Private Sub txtMaxPassNumber_Validate(Cancel As Boolean)
If txtMaxPassNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtMaxPassNumber.Text) Then
     Cancel = True
     MsgBox "��������� �����", vbOKOnly + vbExclamation, "��������"
  ElseIf Val(txtMaxPassNumber.Text) <> CLng(Val(txtMaxPassNumber.Text)) Then
     Cancel = True
     MsgBox "��������� ����� �����", vbOKOnly + vbExclamation, "��������"
  End If
End If
End Sub
Private Sub txtMaxPassNumber_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtMaxPassNumber_Change()
  Changing
End Sub
Private Sub txtTaskDescription_Change()
  Changing
End Sub
Private Sub cmdAttachment_Click()
  On Error Resume Next
  If Item.Attachment_EXT <> "" And Not IsNull(Item.Attachment) Then
    cmdAttachment_MenuClick "�������"
  Else
    cmdAttachment_MenuClick "�������"
  End If
End Sub

Private Sub cmdAttachment_MenuClick(ByVal sCaption As String)
  If sCaption = "�������" Then
   Dialog.Flags = cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNPathMustExist
   Dialog.Filter = "(*.*)|*.*"
   Dialog.DialogTitle = "����"
   Dialog.CancelError = True
   On Error Resume Next
   Dialog.ShowOpen
   If (Err.Number > 0) Then
    Err.Clear
    Exit Sub
   End If
   txtAttachment = Dialog.FileName
   Item.Attachment = FileToArray(Dialog.FileName)
   Item.Attachment_EXT = GetFileExtension2(Dialog.FileName)
   Changing
  End If
  If sCaption = "�������" Then
    Item.Application.Manager.StoreTempFileData DoOpenFile(Item.Attachment, Item.Attachment_EXT), Item.PartName, Item.ID
  End If
  If sCaption = "��������" Then
   txtAttachment = ""
   Item.Attachment = Null
   Item.Attachment_EXT = ""
   Changing
  End If
  If sCaption = "���������" Then
   Dialog.Flags = cdlOFNHideReadOnly + cdlOFNPathMustExist
   Dialog.Filter = "(*.*)|*.*"
   Dialog.DialogTitle = "����"
   Dialog.CancelError = True
   On Error Resume Next
   Dialog.ShowSave
   If (Err.Number > 0) Then
    Err.Clear
    Exit Sub
   End If
   ArrayToFile Dialog.FileName, Item.Attachment
  End If
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = txtStepType.Tag <> ""
If mIsOK Then mIsOK = (cmbReuseStep.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbAutoCheckState.ListIndex >= 0)
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

txtName = Item.Name
If Not Item.StepType Is Nothing Then
  txtStepType.Tag = Item.StepType.ID
  txtStepType = Item.StepType.Brief
Else
  txtStepType.Tag = ""
  txtStepType = ""
End If
 LoadBtnPictures cmdStepType, cmdStepType.Tag
  cmdStepType.RemoveAllMenu
cmbReuseStep.Clear
cmbReuseStep.AddItem "��"
cmbReuseStep.ItemData(cmbReuseStep.NewIndex) = -1
cmbReuseStep.AddItem "���"
cmbReuseStep.ItemData(cmbReuseStep.NewIndex) = 0
 For iii = 0 To cmbReuseStep.ListCount - 1
  If Item.ReuseStep = cmbReuseStep.ItemData(iii) Then
   cmbReuseStep.ListIndex = iii
   Exit For
  End If
 Next
cmbAutoCheckState.Clear
cmbAutoCheckState.AddItem "��"
cmbAutoCheckState.ItemData(cmbAutoCheckState.NewIndex) = -1
cmbAutoCheckState.AddItem "���"
cmbAutoCheckState.ItemData(cmbAutoCheckState.NewIndex) = 0
 For iii = 0 To cmbAutoCheckState.ListCount - 1
  If Item.AutoCheckState = cmbAutoCheckState.ItemData(iii) Then
   cmbAutoCheckState.ListIndex = iii
   Exit For
  End If
 Next
txtReStartInterval = Item.ReStartInterval
txtStateCeckInterval = Item.StateCeckInterval
txtMinPriority = Item.MinPriority
txtMaxPriority = Item.MaxPriority
txtIncPriority = Item.IncPriority
txtGrowPriorityInterval = Item.GrowPriorityInterval
txtMaxPassNumber = Item.MaxPassNumber
txtTaskDescription = Item.TaskDescription
 If LenB(Item.Attachment) > 0 Then
   txtAttachment = "������ (" & Item.Attachment_EXT & ")"
 Else
   txtAttachment = ""
 End If
 LoadBtnPictures cmdAttachment, cmdAttachment.Tag
 cmdAttachment.RemoveAllMenu
 cmdAttachment.AddMenu "�������"
 cmdAttachment.AddMenu "���������"
 cmdAttachment.AddMenu "�������"
 cmdAttachment.AddMenu "��������"
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

Item.Name = txtName
If txtStepType.Tag <> "" Then
  Set Item.StepType = Item.Application.FindRowObject("WFDic_func", txtStepType.Tag)
Else
  Set Item.StepType = Nothing
End If
Item.ReuseStep = cmbReuseStep.ItemData(cmbReuseStep.ListIndex)
Item.AutoCheckState = cmbAutoCheckState.ItemData(cmbAutoCheckState.ListIndex)
Item.ReStartInterval = CDbl(txtReStartInterval)
Item.StateCeckInterval = CDbl(txtStateCeckInterval)
Item.MinPriority = CDbl(txtMinPriority)
Item.MaxPriority = CDbl(txtMaxPriority)
Item.IncPriority = CDbl(txtIncPriority)
Item.GrowPriorityInterval = CDbl(txtGrowPriorityInterval)
Item.MaxPassNumber = CDbl(txtMaxPassNumber)
Item.TaskDescription = txtTaskDescription
 ' SEE cmdAttachment_CLICK
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(X As Single, Y As Single)
   Panel.OptimalSize X, Y
   X = X + Panel.Left
   Y = Y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim X As Single, Y As Single
   Panel.OptimalSize X, Y
   OptimalY = Y
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

