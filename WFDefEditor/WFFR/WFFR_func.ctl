VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.9#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.UserControl WFFR_func 
   ClientHeight    =   4440
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6885
   ScaleHeight     =   4440
   ScaleWidth      =   6885
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   4305
      Left            =   45
      TabIndex        =   0
      Top             =   0
      Width           =   6750
      _ExtentX        =   11906
      _ExtentY        =   7594
      Begin VB.ComboBox txtFuncResult 
         Height          =   315
         ItemData        =   "WFFR_func.ctx":0000
         Left            =   240
         List            =   "WFFR_func.ctx":0002
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   2880
         Width           =   3015
      End
      Begin MSComDlg.CommonDialog Dialog 
         Left            =   3720
         Top             =   3360
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.TextBox txtAttachment 
         Height          =   300
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Вложение"
         Top             =   3615
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdAttachment 
         Height          =   300
         Left            =   2790
         TabIndex        =   6
         Tag             =   "fileopen.ico"
         ToolTipText     =   "Вложение"
         Top             =   3615
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtInfo 
         Height          =   1200
         Left            =   210
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   4
         ToolTipText     =   "Текущее задание"
         Top             =   1260
         Width           =   3000
      End
      Begin VB.TextBox txtWorkPercent 
         Height          =   300
         Left            =   195
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Готовность"
         Top             =   570
         Width           =   3000
      End
      Begin VB.Label lblAttachment 
         BackStyle       =   0  'Transparent
         Caption         =   "Вложение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   240
         TabIndex        =   8
         Top             =   3285
         Width           =   3000
      End
      Begin VB.Label lblFuncResult 
         BackStyle       =   0  'Transparent
         Caption         =   "Результат:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   195
         TabIndex        =   5
         Top             =   2550
         Width           =   3000
      End
      Begin VB.Label lblInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Текущее задание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   195
         TabIndex        =   3
         Top             =   945
         Width           =   3000
      End
      Begin VB.Label lblWorkPercent 
         BackStyle       =   0  'Transparent
         Caption         =   "Готовность:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   195
         TabIndex        =   1
         Top             =   240
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFFR_func"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()


Private Sub cmdAttachment_Click()
  On Error Resume Next
  If Item.basedOn.func.wffd_common.Item(1).Attachment_ext <> "" And Not IsNull(Item.basedOn.func.wffd_common.Item(1).Attachment) Then
    cmdAttachment_MenuClick "Открыть"
  End If
End Sub

Private Sub cmdAttachment_MenuClick(ByVal sCaption As String)
  If sCaption = "Открыть" Then
    Item.Application.manager.StoreTempFileData DoOpenFile(Item.basedOn.func.wffd_common.Item(1).Attachment, Item.basedOn.func.wffd_common.Item(1).Attachment_ext), Item.basedOn.func.wffd_common.Item(1).PartName, Item.basedOn.func.wffd_common.Item(1).ID
  End If
  If sCaption = "Сохранить" Then
   If Item.basedOn.func.wffd_common.Item(1).Attachment_ext <> "" And Not IsNull(Item.basedOn.func.wffd_common.Item(1).Attachment) Then
    Dialog.Flags = cdlOFNHideReadOnly + cdlOFNPathMustExist
    Dialog.Filter = "(*." & Item.basedOn.func.wffd_common.Item(1).Attachment_ext & ")|*." & Item.basedOn.func.wffd_common.Item(1).Attachment_ext
    Dialog.DialogTitle = "Файл"
    Dialog.CancelError = True
    On Error Resume Next
    Dialog.ShowSave
    If (Err.Number > 0) Then
      Err.Clear
      Exit Sub
    End If
    ArrayToFile Dialog.FileName, Item.basedOn.func.wffd_common.Item(1).Attachment
   End If
  End If
End Sub


Private Sub txtFuncResult_Click()
  Changing
End Sub

Private Sub UserControl_Resize()
  On Error Resume Next
  panel.Width = UserControl.Width
  panel.Height = UserControl.Height
End Sub

Private Sub cmbState_Click()
  On Error Resume Next
  Changing
End Sub

Private Sub txtWorkPercent_Validate(Cancel As Boolean)
If txtWorkPercent.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtWorkPercent.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtWorkPercent.Text) <> CLng(Val(txtWorkPercent.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtWorkPercent.Text) < 0 Or Val(txtWorkPercent.Text) > 100 Then
     Cancel = True
     MsgBox "Ожидалось значение в диапазоне 0..100 ", vbOKOnly + vbExclamation, "Внимание"
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

txtWorkPercent = Item.WorkPercent
txtInfo = Item.Info

txtFuncResult.Clear
For iii = 1 To Item.basedOn.func.wffd_results.Count
 txtFuncResult.AddItem Item.basedOn.func.wffd_results.Item(iii).Name
Next
On Error Resume Next
txtFuncResult = Item.FuncResult





 If LenB(Item.basedOn.func.wffd_common.Item(1).Attachment) > 0 Then
   txtAttachment = "Данные (" & Item.basedOn.func.wffd_common.Item(1).Attachment_ext & ")"
 Else
   txtAttachment = ""
 End If
 LoadBtnPictures cmdAttachment, cmdAttachment.Tag
 cmdAttachment.RemoveAllMenu
 cmdAttachment.AddMenu "Сохранить"
 cmdAttachment.AddMenu "Открыть"

OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub
 Item.WorkPercent = CDbl(txtWorkPercent)
 Item.FuncResult = txtFuncResult
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

