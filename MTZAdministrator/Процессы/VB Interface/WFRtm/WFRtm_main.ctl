VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl WFRtm_main 
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
      Begin MTZ_PANEL.DropButton cmdModerator 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Отвественный"
         Top             =   4125
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtModerator 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Отвественный"
         Top             =   4125
         Width           =   2550
      End
      Begin MSComDlg.CommonDialog Dialog 
         Left            =   300
         Top             =   3645
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MTZ_PANEL.DropButton cmdAttachment 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "fileopen.ico"
         ToolTipText     =   "Приложение"
         Top             =   3420
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtAttachment 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         Text            =   "Text1"
         ToolTipText     =   "Приложение"
         Top             =   3420
         Width           =   2550
      End
      Begin VB.TextBox txtthe_Description 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         ToolTipText     =   "Сопровоительная информация"
         Top             =   1815
         Width           =   3000
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
      Begin VB.ComboBox cmbProcessState 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         ToolTipText     =   "Состояние процесса"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblModerator 
         BackStyle       =   0  'Transparent
         Caption         =   "Отвественный:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblAttachment 
         BackStyle       =   0  'Transparent
         Caption         =   "Приложение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblthe_Description 
         BackStyle       =   0  'Transparent
         Caption         =   "Сопровоительная информация:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblBasedOn 
         BackStyle       =   0  'Transparent
         Caption         =   "Реализует:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblProcessState 
         BackStyle       =   0  'Transparent
         Caption         =   "Состояние процесса:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFRtm_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub cmbProcessState_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtBasedOn_Change()
  Changing

End Sub
Private Sub cmdBasedOn_CLick()
  On Error Resume Next
     If txtBasedOn.Tag = "" Then
       cmdBasedOn_MenuClick "Выбрать"
     Else
       cmdBasedOn_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdBasedOn_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtBasedOn.Tag = ""
          txtBasedOn = ""
  End If
  If sCaption = "Открыть" Then
    If txtBasedOn.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtBasedOn.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtBasedOn.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(id, brief, "", "WFDef")
        If OK Then
          txtBasedOn.Tag = Left(id, 38)
          txtBasedOn = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        id = CreateGUID2
        Item.Application.Manager.NewInstance id, "WFDef", "Определение процесса " & Now
        Set obj = Item.Application.Manager.GetInstanceObject(id)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.id)
          Gobj.Show "", obj, True
          Set obj = Item.Application.Manager.GetInstanceObject(obj.id)
          If (Not obj Is Nothing) Then
              txtBasedOn.Tag = obj.id
              txtBasedOn = obj.brief
          Else
              txtBasedOn.Tag = ""
              txtBasedOn = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtthe_Description_Change()
  Changing

End Sub
Private Sub cmdAttachment_Click()
  On Error Resume Next
  If Item.Attachment_ext <> "" And Not IsNull(Item.Attachment) Then
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
   Item.Attachment = FileToArray(Dialog.FileName)
   Item.Attachment_ext = GetFileExtension2(Dialog.FileName)
   Changing

  End If
  If sCaption = "Очистить" Then
   txtAttachment = ""
   Item.Attachment = Null
   Item.Attachment_ext = ""
   Changing
  End If
  If sCaption = "Открыть" Then
    Item.Application.Manager.StoreTempFileData DoOpenFile(Item.Attachment, Item.Attachment_ext), Item.PartName, Item.id
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
   ArrayToFile Dialog.FileName, Item.Attachment
  End If
End Sub
Private Sub txtModerator_Change()
  Changing

End Sub
Private Sub cmdModerator_CLick()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtModerator.Tag = Left(id, 38)
          txtModerator = brief
        End If
End Sub
Private Sub cmdModerator_MenuClick(ByVal sCaption As String)
          txtModerator.Tag = ""
          txtModerator = ""
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = (cmbProcessState.ListIndex >= 0)
If mIsOK Then mIsOK = txtBasedOn.Tag <> ""
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

cmbProcessState.Clear
cmbProcessState.AddItem "Active"
cmbProcessState.ItemData(cmbProcessState.NewIndex) = 2
cmbProcessState.AddItem "Pause"
cmbProcessState.ItemData(cmbProcessState.NewIndex) = 3
cmbProcessState.AddItem "Processed"
cmbProcessState.ItemData(cmbProcessState.NewIndex) = 5
cmbProcessState.AddItem "Done"
cmbProcessState.ItemData(cmbProcessState.NewIndex) = 4
cmbProcessState.AddItem "Prepare"
cmbProcessState.ItemData(cmbProcessState.NewIndex) = 1
cmbProcessState.AddItem "Initial"
cmbProcessState.ItemData(cmbProcessState.NewIndex) = 0
 For iii = 0 To cmbProcessState.ListCount - 1
  If Item.ProcessState = cmbProcessState.ItemData(iii) Then
   cmbProcessState.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.BasedOn Is Nothing Then
  txtBasedOn.Tag = Item.BasedOn.id
  txtBasedOn = Item.BasedOn.brief
Else
  txtBasedOn.Tag = ""
  txtBasedOn = ""
End If
 LoadBtnPictures cmdBasedOn, cmdBasedOn.Tag
  cmdBasedOn.RemoveAllMenu
  cmdBasedOn.AddMenu "Открыть"
  cmdBasedOn.AddMenu "Создать"
  cmdBasedOn.AddMenu "Выбрать"
txtthe_Description = Item.the_Description
 If LenB(Item.Attachment) > 0 Then
   txtAttachment = "Данные (" & Item.Attachment_ext & ")"
 Else
   txtAttachment = ""
 End If
 LoadBtnPictures cmdAttachment, cmdAttachment.Tag
 cmdAttachment.RemoveAllMenu
 cmdAttachment.AddMenu "Выбрать"
 cmdAttachment.AddMenu "Сохранить"
 cmdAttachment.AddMenu "Открыть"
 cmdAttachment.AddMenu "Очистить"
If Not Item.Moderator Is Nothing Then
  txtModerator.Tag = Item.Moderator.id
  txtModerator = Item.Moderator.brief
Else
  txtModerator.Tag = ""
  txtModerator = ""
End If
 LoadBtnPictures cmdModerator, cmdModerator.Tag
  cmdModerator.RemoveAllMenu
  cmdModerator.AddMenu "Очистить"
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

 If cmbProcessState.ListIndex >= 0 Then
   Item.ProcessState = cmbProcessState.ItemData(cmbProcessState.ListIndex)
 End If
If txtBasedOn.Tag <> "" Then
  Set Item.BasedOn = Item.Application.Manager.GetInstanceObject(txtBasedOn.Tag)
Else
  Set Item.BasedOn = Nothing
End If
Item.the_Description = txtthe_Description
 ' SEE cmdAttachment_CLICK
If txtModerator.Tag <> "" Then
  Set Item.Moderator = Item.Application.FindRowObject("Users", txtModerator.Tag)
Else
  Set Item.Moderator = Nothing
End If
 mIsChanged = False
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



