VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFDef_DocM0 
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
      Begin MTZ_PANEL.DropButton cmdDocType 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип документа"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDocType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Тип документа"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.TextBox txtArchiveMode 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   14
         ToolTipText     =   "Режим архивного запуска"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdArchveFolder 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "Папка для архивной копии"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtArchveFolder 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Папка для архивной копии"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdDocTemplate 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Шаблон документа"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDocTemplate 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Шаблон документа"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.ComboBox cmbCreateInRuntime 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "Создается в ходе процесса"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbSetBeforStart 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "Задать до начала процесса"
         Top             =   1110
         Width           =   3000
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
      Begin VB.Label lblDocType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип документа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblArchiveMode 
         BackStyle       =   0  'Transparent
         Caption         =   "Режим архивного запуска:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblArchveFolder 
         BackStyle       =   0  'Transparent
         Caption         =   "Папка для архивной копии:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblDocTemplate 
         BackStyle       =   0  'Transparent
         Caption         =   "Шаблон документа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCreateInRuntime 
         BackStyle       =   0  'Transparent
         Caption         =   "Создается в ходе процесса:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblSetBeforStart 
         BackStyle       =   0  'Transparent
         Caption         =   "Задать до начала процесса:"
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
Attribute VB_Name = "WFDef_DocM0"
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

Private Sub txtName_Change()
  Changing
End Sub
Private Sub cmbSetBeforStart_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbCreateInRuntime_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtDocTemplate_Change()
  Changing
End Sub
Private Sub cmdDocTemplate_CLick()
  On Error Resume Next
     If txtDocTemplate.Tag = "" Then
       cmdDocTemplate_MenuClick "Выбрать"
     Else
       cmdDocTemplate_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdDocTemplate_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtDocTemplate.Tag = ""
          txtDocTemplate = ""
  End If
  If sCaption = "Открыть" Then
    If txtDocTemplate.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtDocTemplate.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtDocTemplate.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialog2(id, brief, "", "")
        If OK Then
          txtDocTemplate.Tag = Left(id, 38)
          txtDocTemplate = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Set obj = Item.Application.Manager.GetNewObject()
        If Not obj Is Nothing Then
          txtDocTemplate.Tag = obj.id
          txtDocTemplate = obj.brief
          Set obj = Nothing
        End If
  End If
End Sub
Private Sub txtArchveFolder_Change()
  Changing
End Sub
Private Sub cmdArchveFolder_CLick()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Folder", id, brief) Then
          txtArchveFolder.Tag = Left(id, 38)
          txtArchveFolder = brief
        End If
End Sub
Private Sub cmdArchveFolder_MenuClick(ByVal sCaption As String)
          txtArchveFolder.Tag = ""
          txtArchveFolder = ""
End Sub
Private Sub txtArchiveMode_Change()
  Changing
End Sub
Private Sub txtDocType_Change()
  Changing
End Sub
Private Sub cmdDocType_CLick()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJECTTYPE", id, brief) Then
          txtDocType.Tag = Left(id, 38)
          txtDocType = brief
        End If
End Sub
Private Sub cmdDocType_MenuClick(ByVal sCaption As String)
          txtDocType.Tag = ""
          txtDocType = ""
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = (cmbSetBeforStart.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbCreateInRuntime.ListIndex >= 0)
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
cmbSetBeforStart.Clear
cmbSetBeforStart.AddItem "Да"
cmbSetBeforStart.ItemData(cmbSetBeforStart.NewIndex) = -1
cmbSetBeforStart.AddItem "Нет"
cmbSetBeforStart.ItemData(cmbSetBeforStart.NewIndex) = 0
 For iii = 0 To cmbSetBeforStart.ListCount - 1
  If Item.SetBeforStart = cmbSetBeforStart.ItemData(iii) Then
   cmbSetBeforStart.ListIndex = iii
   Exit For
  End If
 Next
cmbCreateInRuntime.Clear
cmbCreateInRuntime.AddItem "Да"
cmbCreateInRuntime.ItemData(cmbCreateInRuntime.NewIndex) = -1
cmbCreateInRuntime.AddItem "Нет"
cmbCreateInRuntime.ItemData(cmbCreateInRuntime.NewIndex) = 0
 For iii = 0 To cmbCreateInRuntime.ListCount - 1
  If Item.CreateInRuntime = cmbCreateInRuntime.ItemData(iii) Then
   cmbCreateInRuntime.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.DocTemplate Is Nothing Then
  txtDocTemplate.Tag = Item.DocTemplate.id
  txtDocTemplate = Item.DocTemplate.brief
Else
  txtDocTemplate.Tag = ""
  txtDocTemplate = ""
End If
 LoadBtnPictures cmdDocTemplate, cmdDocTemplate.Tag
  cmdDocTemplate.RemoveAllMenu
  cmdDocTemplate.AddMenu "Очистить"
  cmdDocTemplate.AddMenu "Открыть"
  cmdDocTemplate.AddMenu "Создать"
  cmdDocTemplate.AddMenu "Выбрать"
If Not Item.ArchveFolder Is Nothing Then
  txtArchveFolder.Tag = Item.ArchveFolder.id
  txtArchveFolder = Item.ArchveFolder.brief
Else
  txtArchveFolder.Tag = ""
  txtArchveFolder = ""
End If
 LoadBtnPictures cmdArchveFolder, cmdArchveFolder.Tag
  cmdArchveFolder.RemoveAllMenu
  cmdArchveFolder.AddMenu "Очистить"
txtArchiveMode = Item.ArchiveMode
If Not Item.doctype Is Nothing Then
  txtDocType.Tag = Item.doctype.id
  txtDocType = Item.doctype.brief
Else
  txtDocType.Tag = ""
  txtDocType = ""
End If
 LoadBtnPictures cmdDocType, cmdDocType.Tag
  cmdDocType.RemoveAllMenu
  cmdDocType.AddMenu "Очистить"
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

Item.Name = txtName
Item.SetBeforStart = cmbSetBeforStart.ItemData(cmbSetBeforStart.ListIndex)
Item.CreateInRuntime = cmbCreateInRuntime.ItemData(cmbCreateInRuntime.ListIndex)
If txtDocTemplate.Tag <> "" Then
  Set Item.DocTemplate = Item.Application.Manager.GetInstanceObject(txtDocTemplate.Tag)
Else
  Set Item.DocTemplate = Nothing
End If
If txtArchveFolder.Tag <> "" Then
  Set Item.ArchveFolder = Item.Application.FindRowObject("Folder", txtArchveFolder.Tag)
Else
  Set Item.ArchveFolder = Nothing
End If
Item.ArchiveMode = txtArchiveMode
If txtDocType.Tag <> "" Then
  Set Item.doctype = Item.Application.FindRowObject("OBJECTTYPE", txtDocType.Tag)
Else
  Set Item.doctype = Nothing
End If
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



