VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.7#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.UserControl WFRtm_main 
   ClientHeight    =   5325
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6540
   ScaleHeight     =   5325
   ScaleWidth      =   6540
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   4845
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6165
      _ExtentX        =   10874
      _ExtentY        =   8546
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
         TabIndex        =   8
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
         TabIndex        =   7
         ToolTipText     =   "Приложение"
         Top             =   3420
         Width           =   2550
      End
      Begin VB.TextBox txtDescription 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   5
         ToolTipText     =   "Сопровоительная информация"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtBasedOn 
         BackColor       =   &H80000004&
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   3
         ToolTipText     =   "Реализует"
         Top             =   1110
         Width           =   2910
      End
      Begin VB.Label cmbProcessState 
         BackColor       =   &H8000000A&
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   360
         Width           =   2910
      End
      Begin VB.Label lblAttachment 
         BackStyle       =   0  'Transparent
         Caption         =   "Приложение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblDescription 
         BackStyle       =   0  'Transparent
         Caption         =   "Сопровоительная информация:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblBasedOn 
         BackStyle       =   0  'Transparent
         Caption         =   "Реализует:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   2
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblProcessState 
         BackStyle       =   0  'Transparent
         Caption         =   "Состояние процесса:"
         ForeColor       =   &H00000000&
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


Private Sub UserControl_Resize()
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
    Dim Obj As Object
    Dim d As Form
    Dim ID As String
  If sCaption = "Очистить" Then
          txtBasedOn.Tag = ""
          txtBasedOn = ""
  End If
  If sCaption = "Открыть" Then
    If txtBasedOn.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtBasedOn.Tag)
    If inst Is Nothing Then Exit Sub
    Set Obj = Item.Application.Manager.GetInstanceGUI(txtBasedOn.Tag)
    Obj.Show "", inst, True
    Set Obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        Set d = Item.Application.Manager.GetObjectListDialog("", "WFDef")
        d.Show vbModal, Me
        If d.OK Then
          txtBasedOn.Tag = Left(d.ID, 38)
          txtBasedOn = d.Brief
        End If
        Set d = Nothing
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        ID = CreateGUID2
        Item.Application.Manager.NewInstance ID, "WFDef", "Определение процесса " & Now
        Set Obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not Obj Is Nothing Then
          txtBasedOn.Tag = Obj.ID
          txtBasedOn = Obj.Brief
          Set Obj = Nothing
        End If
  End If
End Sub
Private Sub txtDescription_Change()
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
  If sCaption = "Открыть" Then
    Item.Application.Manager.StoreTempFileData DoOpenFile(Item.Attachment, Item.Attachment_ext), Item.PartName, Item.ID
  End If
  If sCaption = "Очистить" Then
   txtAttachment = ""
   Item.Attachment = Null
   Item.Attachment_ext = ""
   Changing
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
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True
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

If Item.ProcessState = 0 Then
  cmbProcessState.Caption = "Инициализация"
End If
If Item.ProcessState = 1 Then
  cmbProcessState.Caption = "Готов к запуску"
End If
If Item.ProcessState = 2 Then
  cmbProcessState.Caption = "Активен"
End If
If Item.ProcessState = 3 Then
  cmbProcessState.Caption = "Пауза"
End If
If Item.ProcessState = 4 Then
  cmbProcessState.Caption = "Завершен"
End If
If Item.ProcessState = 5 Then
  cmbProcessState.Caption = "Завершение обработано"
End If


If Not Item.BasedOn Is Nothing Then
  txtBasedOn.Tag = Item.BasedOn.ID
  txtBasedOn = Item.BasedOn.Brief
Else
  txtBasedOn.Tag = ""
  txtBasedOn = ""
End If
txtDescription = Item.Description
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
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub
If txtBasedOn.Tag <> "" Then
  Set Item.BasedOn = Item.Application.Manager.GetInstanceObject(txtBasedOn.Tag)
Else
  Set Item.BasedOn = Nothing
End If
Item.Description = txtDescription
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

