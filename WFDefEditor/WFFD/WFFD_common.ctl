VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.UserControl WFFD_common 
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
      Begin VB.TextBox txtIntegrationData2 
         Height          =   300
         Left            =   3450
         MaxLength       =   120
         TabIndex        =   34
         ToolTipText     =   "Данные для интеграции 2"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.TextBox txtIntegrationData1 
         Height          =   300
         Left            =   3450
         MaxLength       =   120
         TabIndex        =   32
         ToolTipText     =   "Данные для интеграции 1"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.TextBox txtWorkTime 
         Height          =   300
         Left            =   3450
         MaxLength       =   27
         TabIndex        =   30
         ToolTipText     =   "Срок исполнения (ч.)"
         Top             =   4125
         Width           =   1800
      End
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
         ToolTipText     =   "Вложение"
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
         ToolTipText     =   "Вложение"
         Top             =   3420
         Width           =   2550
      End
      Begin VB.TextBox txtTaskDescription 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   25
         ToolTipText     =   "Описание задания"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtMaxPassNumber 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   23
         ToolTipText     =   "Максимальный номер прохода"
         Top             =   1110
         Width           =   1800
      End
      Begin VB.TextBox txtGrowPriorityInterval 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   21
         ToolTipText     =   "Интервал роста приоритета (мин.)"
         Top             =   405
         Width           =   1800
      End
      Begin VB.TextBox txtIncPriority 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   19
         ToolTipText     =   "Прирост приоритета"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.TextBox txtMaxPriority 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   17
         ToolTipText     =   "Максимальный приоритет"
         Top             =   5340
         Width           =   1800
      End
      Begin VB.TextBox txtMinPriority 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   15
         ToolTipText     =   "Минимальный приоритет"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.TextBox txtStateCeckInterval 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   13
         ToolTipText     =   "Инетрвал проверки состояния (мин.)"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.TextBox txtReStartInterval 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   11
         ToolTipText     =   "Интервал перезапуска (мин.)"
         Top             =   3225
         Width           =   1800
      End
      Begin VB.ComboBox cmbAutoCheckState 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "Проверять состояние"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbReuseStep 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "Использовать незавершенный шаг"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdStepType 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип шага"
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
         ToolTipText     =   "Тип шага"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblIntegrationData2 
         BackStyle       =   0  'Transparent
         Caption         =   "Данные для интеграции 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblIntegrationData1 
         BackStyle       =   0  'Transparent
         Caption         =   "Данные для интеграции 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblWorkTime 
         BackStyle       =   0  'Transparent
         Caption         =   "Срок исполнения (ч.):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblAttachment 
         BackStyle       =   0  'Transparent
         Caption         =   "Вложение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblTaskDescription 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание задания:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblMaxPassNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Максимальный номер прохода:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblGrowPriorityInterval 
         BackStyle       =   0  'Transparent
         Caption         =   "Интервал роста приоритета (мин.):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblIncPriority 
         BackStyle       =   0  'Transparent
         Caption         =   "Прирост приоритета:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblMaxPriority 
         BackStyle       =   0  'Transparent
         Caption         =   "Максимальный приоритет:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblMinPriority 
         BackStyle       =   0  'Transparent
         Caption         =   "Минимальный приоритет:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblStateCeckInterval 
         BackStyle       =   0  'Transparent
         Caption         =   "Инетрвал проверки состояния (мин.):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblReStartInterval 
         BackStyle       =   0  'Transparent
         Caption         =   "Интервал перезапуска (мин.):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblAutoCheckState 
         BackStyle       =   0  'Transparent
         Caption         =   "Проверять состояние:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblReuseStep 
         BackStyle       =   0  'Transparent
         Caption         =   "Использовать незавершенный шаг:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblStepType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип шага:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
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



   Public item As WFFD.WFFD_common
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
        Set d = item.Application.Manager.GetReferenceDialogEx("WFDic_func")
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
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtReStartInterval.Text) <> CLng(Val(txtReStartInterval.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
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
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtStateCeckInterval.Text) <> CLng(Val(txtStateCeckInterval.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
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
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtMinPriority.Text) <> CLng(Val(txtMinPriority.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
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
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtMaxPriority.Text) <> CLng(Val(txtMaxPriority.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
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
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtIncPriority.Text) <> CLng(Val(txtIncPriority.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
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
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtGrowPriorityInterval.Text) <> CLng(Val(txtGrowPriorityInterval.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
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
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtMaxPassNumber.Text) <> CLng(Val(txtMaxPassNumber.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
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
  If item.Attachment_EXT <> "" And Not IsNull(item.Attachment) Then
    cmdAttachment_MenuClick "Открыть"
  Else
    cmdAttachment_MenuClick "Выбрать"
  End If
End Sub

Private Sub cmdAttachment_MenuClick(ByVal sCaption As String)
  If sCaption = "Выбрать" Then
   Dialog.Flags = cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNPathMustExist
   Dialog.Filter = "(*.*)|*.*"
   Dialog.DialogTitle = "Файл"
   Dialog.CancelError = True
   On Error Resume Next
   Dialog.ShowOpen
   If (Err.Number > 0) Then
    Err.Clear
    Exit Sub
   End If
   txtAttachment = Dialog.FileName
   item.Attachment = FileToArray(Dialog.FileName)
   item.Attachment_EXT = GetFileExtension2(Dialog.FileName)
   Changing
  End If
  If sCaption = "Очистить" Then
   txtAttachment = ""
   item.Attachment = Null
   item.Attachment_EXT = ""
   Changing
  End If
  If sCaption = "Открыть" Then
    item.Application.Manager.StoreTempFileData DoOpenFile(item.Attachment, item.Attachment_EXT), item.PartName, item.ID
  End If
  If sCaption = "Сохранить" Then
   Dialog.Flags = cdlOFNHideReadOnly + cdlOFNPathMustExist
   Dialog.Filter = "(*.*)|*.*"
   Dialog.DialogTitle = "Файл"
   Dialog.CancelError = True
   On Error Resume Next
   Dialog.ShowSave
   If (Err.Number > 0) Then
    Err.Clear
    Exit Sub
   End If
   ArrayToFile Dialog.FileName, item.Attachment
  End If
End Sub
Private Sub txtWorkTime_Validate(Cancel As Boolean)
If txtWorkTime.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWorkTime.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtWorkTime.Text) < -922337203685478# Or Val(txtWorkTime.Text) > 922337203685478# Then
     Cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub
Private Sub txtWorkTime_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtWorkTime_Change()
  Changing
End Sub
Private Sub txtIntegrationData1_Change()
  Changing
End Sub
Private Sub txtIntegrationData2_Change()
  Changing
End Sub
Private Sub UserControl_Terminate()
  Set item = Nothing
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
If item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

txtName = item.Name
If Not item.StepType Is Nothing Then
  txtStepType.Tag = item.StepType.ID
  txtStepType = item.StepType.Brief
Else
  txtStepType.Tag = ""
  txtStepType = ""
End If
 LoadBtnPictures cmdStepType, cmdStepType.Tag
  cmdStepType.RemoveAllMenu
cmbReuseStep.Clear
cmbReuseStep.AddItem "Да"
cmbReuseStep.ItemData(cmbReuseStep.NewIndex) = -1
cmbReuseStep.AddItem "Нет"
cmbReuseStep.ItemData(cmbReuseStep.NewIndex) = 0
 For iii = 0 To cmbReuseStep.ListCount - 1
  If item.ReuseStep = cmbReuseStep.ItemData(iii) Then
   cmbReuseStep.ListIndex = iii
   Exit For
  End If
 Next
cmbAutoCheckState.Clear
cmbAutoCheckState.AddItem "Да"
cmbAutoCheckState.ItemData(cmbAutoCheckState.NewIndex) = -1
cmbAutoCheckState.AddItem "Нет"
cmbAutoCheckState.ItemData(cmbAutoCheckState.NewIndex) = 0
 For iii = 0 To cmbAutoCheckState.ListCount - 1
  If item.AutoCheckState = cmbAutoCheckState.ItemData(iii) Then
   cmbAutoCheckState.ListIndex = iii
   Exit For
  End If
 Next
txtReStartInterval = item.ReStartInterval
txtStateCeckInterval = item.StateCeckInterval
txtMinPriority = item.MinPriority
txtMaxPriority = item.MaxPriority
txtIncPriority = item.IncPriority
txtGrowPriorityInterval = item.GrowPriorityInterval
txtMaxPassNumber = item.MaxPassNumber
txtTaskDescription = item.TaskDescription
 If LenB(item.Attachment) > 0 Then
   txtAttachment = "Данные (" & item.Attachment_EXT & ")"
 Else
   txtAttachment = ""
 End If
 LoadBtnPictures cmdAttachment, cmdAttachment.Tag
 cmdAttachment.RemoveAllMenu
 cmdAttachment.AddMenu "Выбрать"
 cmdAttachment.AddMenu "Сохранить"
 cmdAttachment.AddMenu "Открыть"
 cmdAttachment.AddMenu "Очистить"
txtWorkTime = item.WorkTime
txtIntegrationData1 = item.IntegrationData1
txtIntegrationData2 = item.IntegrationData2
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

item.Name = txtName
If txtStepType.Tag <> "" Then
  Set item.StepType = item.Application.FindRowObject("WFDic_func", txtStepType.Tag)
Else
  Set item.StepType = Nothing
End If
item.ReuseStep = cmbReuseStep.ItemData(cmbReuseStep.ListIndex)
item.AutoCheckState = cmbAutoCheckState.ItemData(cmbAutoCheckState.ListIndex)
item.ReStartInterval = CDbl(txtReStartInterval)
item.StateCeckInterval = CDbl(txtStateCeckInterval)
item.MinPriority = CDbl(txtMinPriority)
item.MaxPriority = CDbl(txtMaxPriority)
item.IncPriority = CDbl(txtIncPriority)
item.GrowPriorityInterval = CDbl(txtGrowPriorityInterval)
item.MaxPassNumber = CDbl(txtMaxPassNumber)
item.TaskDescription = txtTaskDescription
 ' SEE cmdAttachment_CLICK
item.WorkTime = CDbl(txtWorkTime)
item.IntegrationData1 = txtIntegrationData1
item.IntegrationData2 = txtIntegrationData2
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



