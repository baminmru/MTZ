VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSaveDesc 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Сохранить описание типа"
   ClientHeight    =   3810
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   6840
   Icon            =   "frmSaveDesc.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3810
   ScaleWidth      =   6840
   ShowInTaskbar   =   0   'False
   Begin MSComctlLib.ProgressBar pb 
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   3480
      Visible         =   0   'False
      Width           =   6735
      _ExtentX        =   11880
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton cmdSelAll 
      Caption         =   "Выделить все"
      Height          =   315
      Left            =   5400
      TabIndex        =   5
      Top             =   840
      Width           =   1320
   End
   Begin VB.CommandButton cmdUnselAll 
      Caption         =   "Отменить все"
      Height          =   315
      Left            =   5400
      TabIndex        =   6
      Top             =   1200
      Width           =   1320
   End
   Begin VB.CommandButton cmdPath 
      Caption         =   "..."
      Height          =   315
      Left            =   6405
      TabIndex        =   2
      Top             =   120
      Width           =   315
   End
   Begin VB.TextBox txtPath 
      Height          =   285
      Left            =   1470
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   120
      Width           =   4920
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "Сохранить"
      Height          =   315
      Left            =   5400
      TabIndex        =   7
      Top             =   3000
      Width           =   1320
   End
   Begin VB.ListBox cmbType 
      Height          =   2535
      Left            =   120
      Style           =   1  'Checkbox
      TabIndex        =   4
      Top             =   840
      Width           =   5175
   End
   Begin VB.Label Label1 
      Caption         =   "Описание типа"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   600
      Width           =   6615
   End
   Begin VB.Label Label8 
      Caption         =   "Куда сохранить:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1305
   End
End
Attribute VB_Name = "frmSaveDesc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public TypeName As String
Public site As String

Public OK As Boolean
Private ID  As String
Public NewObject  As Object
Private types As Collection



Private Sub CancelButton_Click()
OK = False
Set types = Nothing
Me.Hide
End Sub




Private Sub cmbType_DblClick()
OKButton_Click
End Sub

Private Sub cmdSelAll_Click()
  Dim i As Long
  For i = 0 To cmbType.ListCount - 1
  cmbType.Selected(i) = True
  Next
End Sub

Private Sub cmdUnselAll_Click()
  Dim i As Long
  For i = 0 To cmbType.ListCount - 1
  cmbType.Selected(i) = False
  Next
End Sub

Private Sub Form_Load()
  Dim rs As ADODB.Recordset, i
  Dim n As String, tn As String
  Set rs = Session.GetRowsEx("OBJECTTYPE", , , , " order by Name")
  Dim o As tmpInst
  Set types = New Collection
  i = 0
  While Not rs.EOF
      i = i + 1
      Set o = New tmpInst
      o.Name = rs!Name & " (" & rs!the_comment & ")"
      o.ObjType = rs!Name
      o.IsSingle = rs!IsSingleInstance
      o.ID = rs!objecttypeid
      types.Add o
      cmbType.AddItem o.Name
      cmbType.ItemData(cmbType.NewIndex) = i
      rs.MoveNext
  Wend
  Set rs = Nothing
  
  If cmbType.ListCount > 0 Then
    cmbType.ListIndex = 0
  End If
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  If Me.Height < 4170 Then Me.Height = 4170
  If Me.Width < 6975 Then Me.Width = 6975
  
  cmdPath.Left = Me.ScaleWidth - 30 - cmdPath.Width
  txtPath.Width = Me.ScaleWidth - txtPath.Left - cmdPath.Width - 60
  cmbType.Height = Me.ScaleHeight - pb.Height - 60 - cmbType.Top
  cmbType.Width = Me.ScaleWidth - cmbType.Width - cmdSelAll.Width - 60
  
  cmbType.Width = Me.ScaleWidth - cmbType.Left - cmdSelAll.Width - 60
  cmdSelAll.Left = Me.ScaleWidth - cmdSelAll.Width - 30
  cmdUnselAll.Left = cmdSelAll.Left
  OKButton.Left = cmdSelAll.Left
  OKButton.Top = Me.ScaleHeight - OKButton.Height - pb.Height - 60
  
  pb.Left = 30
  pb.Top = Me.ScaleHeight - pb.Height - 30
  pb.Width = Me.ScaleWidth - 60
  
End Sub

Private Sub OKButton_Click()
  On Error GoTo bye
  'If cmbType.ListIndex = -1 Then Exit Sub
  
  
'  TypeName = types.item(cmbType.ItemData(cmbType.ListIndex)).ObjType
'  ID = types.item(cmbType.ItemData(cmbType.ListIndex)).ID
'  OK = True
'  Set types = Nothing
'  Me.Hide
Dim i As Long
pb.max = cmbType.ListCount - 1
pb.min = 0
pb.Value = 0
pb.Visible = True
For i = 0 To cmbType.ListCount - 1
  If cmbType.Selected(i) Then
    SaveTypeXML types.item(cmbType.ItemData(i)).ID
    cmbType.Selected(i) = False
  End If
  pb.Value = i
Next
pb.Visible = False
MsgBox "Сохранение завершено", , "Сохранение описания типов"

bye:
End Sub

Private Sub SaveTypeXML(ByVal ID As String)
On Error Resume Next
 Dim item As ObjectType
 Set item = model.ObjectType.item(ID)
 If item Is Nothing Then Exit Sub
 
 If item.Application.MTZSession.CheckRight(item.SecureStyleID, "XMLSAVE") Then
 
  On Error GoTo bye
  Dim fn As String
 
   fn = txtPath & item.Name & ".xml"
   item.LockResource True
   
   
   Dim xdom As MSXML2.DOMDocument
   Set xdom = New MSXML2.DOMDocument
   xdom.loadXML "<OBJECTTYPE></OBJECTTYPE>"
   item.XMLSave xdom.lastChild, xdom
   xdom.Save fn
   item.UnLockResource
 End If
bye:
End Sub


Private Sub cmdPath_Click()
  Dim path As String
  path = GetPath("Каталог для сохранения документов", Me.hwnd)
  
  If (path <> vbNullString) Then
    txtPath.Text = path
  End If
End Sub

