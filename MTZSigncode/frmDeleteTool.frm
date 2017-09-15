VERSION 5.00
Begin VB.Form frmDeleteTool 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Удаление документов"
   ClientHeight    =   6210
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6915
   Icon            =   "frmDeleteTool.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6210
   ScaleWidth      =   6915
   Begin VB.CommandButton cmdUnselAll 
      Caption         =   "Отменить все"
      Height          =   375
      Left            =   1680
      TabIndex        =   6
      Top             =   5760
      Width           =   1455
   End
   Begin VB.CommandButton cmdSelAll 
      Caption         =   "Выделить все"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   5760
      Width           =   1455
   End
   Begin VB.CommandButton cmdKill 
      Caption         =   "Удалить"
      Height          =   375
      Left            =   5400
      TabIndex        =   3
      Top             =   5760
      Width           =   1455
   End
   Begin VB.CommandButton cmdUnLock 
      Caption         =   "Разблокировать"
      Height          =   375
      Left            =   3840
      TabIndex        =   2
      Top             =   5760
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.ListBox lstObj 
      Height          =   4785
      Left            =   120
      Style           =   1  'Checkbox
      TabIndex        =   1
      Top             =   840
      Width           =   6735
   End
   Begin VB.ComboBox cmbType 
      Height          =   315
      Left            =   120
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   360
      Width           =   6735
   End
   Begin VB.Label Label1 
      Caption         =   "Тип документа"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   0
      Width           =   3375
   End
End
Attribute VB_Name = "frmDeleteTool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public TypeName As String
Public site As String
Public ok As Boolean
Public ID As String
Public Brief As String
Private inst As Collection
Private types As Collection

Private Sub cmbType_Click()
  Dim i As Long
  Dim rs As ADODB.Recordset
  On Error Resume Next
  Set inst = New Collection
  Dim tt As tmpInst, o As tmpInst
  Set tt = types.item(cmbType.ItemData(cmbType.ListIndex))
  Set rs = Manager.GetSession(site).GetRowsEx("INSTANCE", "", "", " ObjType='" & tt.ObjType & "'", "order by name")
  i = 0
  lstObj.Clear
  While Not rs.EOF
    i = i + 1
    On Error Resume Next
    Set o = New tmpInst
    o.ID = rs!InstanceID
    o.Name = rs!Name
    o.ObjType = rs!ObjType
    
    o.LockUserID = rs!LockUserID & ""
    inst.Add o
    
    If o.LockUserID <> "" Then
      lstObj.AddItem "(заблокирован) " & o.Name
      
    Else
      lstObj.AddItem o.Name
    End If
    
    lstObj.ItemData(lstObj.NewIndex) = i
    rs.MoveNext
  Wend
  Set rs = Nothing
'  If tt.IsSingle = -1 And lstObj.ListCount > 0 Then
'    cmdCreate.Enabled = False
'  Else
'    cmdCreate.Enabled = True
'  End If
End Sub




Private Sub cmdKill_Click()
 On Error Resume Next
 Dim i As Long
  For i = 0 To lstObj.ListCount - 1
  If lstObj.Selected(i) Then
    Manager.DeleteInstance inst.item(lstObj.ItemData(i)).ID, site
  End If
  Next
  cmbType_Click
End Sub

Private Sub cmdSelAll_Click()
  Dim i As Long
  For i = 0 To lstObj.ListCount - 1
  lstObj.Selected(i) = True
  Next
End Sub

Private Sub cmdUnLock_Click()
  Dim nv As NamedValue
  
End Sub

Private Sub cmdUnselAll_Click()
Dim i As Long
  For i = 0 To lstObj.ListCount - 1
  lstObj.Selected(i) = False
  Next
End Sub

Private Sub Form_Load()
  lstObj.Clear
  Dim rs As ADODB.Recordset, i
  Dim n As String, tn As String
  
  Set rs = Manager.GetSession(site).GetRowsEx("OBJECTTYPE", , , , "order by Comment")
  
  Dim o As tmpInst
  Set types = New Collection
  i = 0
  While Not rs.EOF
      i = i + 1
      Set o = New tmpInst
      o.Name = rs!comment
      o.ObjType = rs!Name
      o.IsSingle = rs!IsSingleInstance
      types.Add o
      cmbType.AddItem o.Name
      cmbType.ItemData(cmbType.NewIndex) = i
      rs.MoveNext
  Wend
  Set rs = Nothing
  
  If cmbType.ListCount > 0 Then
    cmbType.ListIndex = 0
    'cmbType_Click
  End If
  
End Sub








