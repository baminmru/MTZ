VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFFD_ShortCut 
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
      Begin VB.TextBox txtStartMode 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   7
         ToolTipText     =   "Режим запуска"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtDocName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Название документа"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdFolder 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Папка"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFolder 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Папка"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblStartMode 
         BackStyle       =   0  'Transparent
         Caption         =   "Режим запуска:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDocName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название документа:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFolder 
         BackStyle       =   0  'Transparent
         Caption         =   "Папка:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFFD_ShortCut"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public item As Object
   Private OnInit As Boolean
   Public Event Changed()





Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtFolder_Change()
  Changing
End Sub
Private Sub cmdFolder_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("Folder")
        d.Show vbModal, Me
        If d.OK Then
          txtFolder.Tag = Left(d.ID, 38)
          txtFolder = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdFolder_MenuClick(ByVal sCaption As String)
          txtFolder.Tag = ""
          txtFolder = ""
End Sub
Private Sub txtDocName_Change()
  Changing
End Sub
Private Sub txtStartMode_Change()
  Changing
End Sub
Private Sub UserControl_Terminate()
  Set item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtFolder.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtDocName.Text)
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

If Not item.Folder Is Nothing Then
  txtFolder.Tag = item.Folder.ID
  txtFolder = item.Folder.Brief
Else
  txtFolder.Tag = ""
  txtFolder = ""
End If
 LoadBtnPictures cmdFolder, cmdFolder.Tag
  cmdFolder.RemoveAllMenu
txtDocName = item.DocName
txtStartMode = item.StartMode
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

If txtFolder.Tag <> "" Then
  Set item.Folder = item.Application.FindRowObject("Folder", txtFolder.Tag)
Else
  Set item.Folder = Nothing
End If
item.DocName = txtDocName
item.StartMode = txtStartMode
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



