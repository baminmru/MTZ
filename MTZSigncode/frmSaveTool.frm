VERSION 5.00
Begin VB.Form frmSaveTool 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Сохранение документов"
   ClientHeight    =   5985
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7125
   Icon            =   "frmSaveTool.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5985
   ScaleWidth      =   7125
   Begin VB.TextBox txtPath 
      Height          =   285
      Left            =   2130
      Locked          =   -1  'True
      TabIndex        =   7
      Top             =   5010
      Width           =   4320
   End
   Begin VB.CommandButton cmdPath 
      Caption         =   "..."
      Height          =   315
      Left            =   6540
      TabIndex        =   6
      Top             =   4965
      Width           =   315
   End
   Begin VB.CommandButton cmdUnselAll 
      Caption         =   "Отменить все"
      Height          =   375
      Left            =   1665
      TabIndex        =   5
      Top             =   5535
      Width           =   1455
   End
   Begin VB.CommandButton cmdSelAll 
      Caption         =   "Выделить все"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   5520
      Width           =   1455
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Сохранить"
      Height          =   375
      Left            =   5415
      TabIndex        =   2
      Top             =   5505
      Width           =   1455
   End
   Begin VB.ListBox lstObj 
      Height          =   3885
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
   Begin VB.Label Label8 
      Caption         =   "Куда сохранить:"
      Height          =   255
      Left            =   135
      TabIndex        =   8
      Top             =   4980
      Width           =   1785
   End
   Begin VB.Label Label1 
      Caption         =   "Тип документа"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   0
      Width           =   3375
   End
End
Attribute VB_Name = "frmSaveTool"
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







Private Sub cmdSave_Click()
 On Error Resume Next
 Dim i As Long
 Dim item As Object
 Dim fn As String
  If txtPath = "" Then
    MsgBox "Задайте каталог для сохранения"
    Exit Sub
  End If
  
  For i = 0 To lstObj.ListCount - 1
    If lstObj.Selected(i) Then
      Set item = Manager.GetInstanceObject(inst.item(lstObj.ItemData(i)).ID, site)
      If Not item Is Nothing Then
        If item.Application.MTZSession.CheckRight(item.SecureStyleID, "XMLSAVE") Then
          If Right(txtPath, 1) = "\" Then
            fn = txtPath.Text & item.ID & ".xml"
          Else
            fn = txtPath.Text & "\" & item.ID & ".xml"
          End If
        
          item.LockResource True
          item.LoadAll
          item.WorkOffline = True
          Dim xdom As MSXML2.DOMDocument
          Set xdom = New MSXML2.DOMDocument
          xdom.loadXML "<root></root>"
          item.XMLSave xdom.lastChild, xdom
          xdom.Save fn
          item.WorkOffline = False
          item.UnLockResource
          Manager.FreeInstanceObject item.ID
        End If
      End If
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


Private Sub cmdPath_Click()
  Dim path As String
  path = GetPath("Каталог для сохранения документов")
  
  If (path <> vbNullString) Then
    txtPath.Text = path
  End If
End Sub

Private Function GetPath(Caption As String) As String
    Dim bi As browseinfo
    Dim lngPath As Long
    Dim lngBrowse As Long
    Dim path As String
    Dim inull As Integer
    
    GetPath = path
    
    Call SHGetSpecialFolderLocation(Me.hwnd, 17, lngPath)

    bi.hwndOwner = Me.hwnd
    bi.lpszTitle = Caption
    bi.pszDisplayName = String(MAX_PATH, 0)
    bi.pidlRoot = lngPath
    bi.lpfn = 0
    bi.ulFlags = 1
    bi.lParam = 0
    
    lngBrowse = SHBrowseForFolder(bi)
    
    path = String(MAX_PATH, 0)
    
    Call SHGetPathFromIDList(lngBrowse, path)
    
    inull = InStr(path, vbNullChar)
    
    If inull Then
      path = Left(path, inull - 1)
    End If
    
    If path <> vbNullString Then
      If Right(path, 1) <> "\" Then
        path = path + "\"
      End If
    End If
    
    GetPath = path
End Function




