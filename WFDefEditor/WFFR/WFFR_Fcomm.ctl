VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.9#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.UserControl WFFR_Fcomm 
   ClientHeight    =   5265
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5475
   ScaleHeight     =   5265
   ScaleWidth      =   5475
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   4530
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   3915
      _ExtentX        =   6906
      _ExtentY        =   7990
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
         ToolTipText     =   "��������"
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
         ToolTipText     =   "��������"
         Top             =   3420
         Width           =   2550
      End
      Begin VB.TextBox txtMessage 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         ToolTipText     =   "���������"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtSubject 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "����"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdAuthor 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "�����"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtAuthor 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "�����"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblAttachment 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblMessage 
         BackStyle       =   0  'Transparent
         Caption         =   "���������:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblSubject 
         BackStyle       =   0  'Transparent
         Caption         =   "����:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblAuthor 
         BackStyle       =   0  'Transparent
         Caption         =   "�����:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFFR_Fcomm"
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
  panel.Width = UserControl.Width
  panel.Height = UserControl.Height
End Sub

Private Sub txtAuthor_Change()
  Changing
End Sub
Private Sub cmdAuthor_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = Item.Application.manager.GetReferenceDialogEx("Users")
        d.Show vbModal, Me
        If d.OK Then
          txtAuthor.Tag = Left(d.ID, 38)
          txtAuthor = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdAuthor_MenuClick(ByVal sCaption As String)
          txtAuthor.Tag = ""
          txtAuthor = ""
End Sub
Private Sub txtSubject_Change()
  Changing
End Sub
Private Sub txtMessage_Change()
  Changing
End Sub
Private Sub cmdAttachment_Click()
  On Error Resume Next
  If Item.Attachment_ext <> "" And Not IsNull(Item.Attachment) Then
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
   Item.Attachment_ext = GetFileExtension2(Dialog.FileName)
   Changing
  End If
  If sCaption = "�������" Then
    Item.Application.manager.StoreTempFileData DoOpenFile(Item.Attachment, Item.Attachment_ext), Item.PartName, Item.ID
  End If
  If sCaption = "��������" Then
   txtAttachment = ""
   Item.Attachment = Null
   Item.Attachment_ext = ""
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

If mIsOK Then mIsOK = txtAuthor.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtSubject.Text)
  IsOK = mIsOK
End Function
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  panel.Enabled = True
Else
  panel.Enabled = False
End If

If Not Item.Author Is Nothing Then
  txtAuthor.Tag = Item.Author.ID
  txtAuthor = Item.Author.Brief
Else
  txtAuthor.Tag = ""
  txtAuthor = ""
End If
 LoadBtnPictures cmdAuthor, cmdAuthor.Tag
  cmdAuthor.RemoveAllMenu
txtSubject = Item.Subject
txtMessage = Item.Message
 If LenB(Item.Attachment) > 0 Then
   txtAttachment = "������ (" & Item.Attachment_ext & ")"
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

If txtAuthor.Tag <> "" Then
  Set Item.Author = Item.Application.FindRowObject("Users", txtAuthor.Tag)
Else
  Set Item.Author = Nothing
End If
Item.Subject = txtSubject
Item.Message = txtMessage
 ' SEE cmdAttachment_CLICK
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(X As Single, Y As Single)
   panel.OptimalSize X, Y
   X = X + panel.Left
   Y = Y + panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim X As Single, Y As Single
   panel.OptimalSize X, Y
   OptimalY = Y
 End Function
 Public Sub Customize()
   panel.Customize
 End Sub
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = panel.PanelCustomisationString
 End Property
 Public Property Let PanelCustomisationString(s As String)
   panel.PanelCustomisationString = s
 End Property
 Public Property Get Enabled() As Boolean
   Enabled = panel.Enabled
 End Property
 Public Property Let Enabled(ByVal v As Boolean)
   panel.Enabled = v
 End Property

