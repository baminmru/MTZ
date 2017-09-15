VERSION 5.00
Begin VB.Form frmObjList 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Выброр объекта"
   ClientHeight    =   4875
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6780
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4875
   ScaleWidth      =   6780
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOpen 
      Caption         =   "Открыть"
      Height          =   375
      Left            =   2520
      TabIndex        =   7
      Top             =   4440
      Width           =   1095
   End
   Begin VB.CommandButton cmdFind 
      Caption         =   "Поиск"
      Height          =   375
      Left            =   1320
      TabIndex        =   6
      Top             =   4440
      Width           =   1095
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Создать"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   4440
      Width           =   1095
   End
   Begin VB.ListBox LstObj 
      Height          =   3375
      Left            =   120
      Sorted          =   -1  'True
      TabIndex        =   4
      Top             =   960
      Width           =   6495
   End
   Begin VB.ComboBox cmbType 
      Height          =   315
      Left            =   120
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   360
      Width           =   6495
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   4320
      TabIndex        =   1
      Top             =   4440
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   5520
      TabIndex        =   0
      Top             =   4440
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Тип объекта"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   3495
   End
End
Attribute VB_Name = "frmObjList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public TypeName As String
Public site As String
Public Runner As Main
Public ok As Boolean
Public ID As String
Public Brief As String
Private inst As Collection
Private types As Collection

Private Sub cmbType_Click()
  Dim i As Long
  Dim rs As ADODB.Recordset

  Set inst = New Collection
  Dim tt As tmpInst, o As tmpInst
  Set tt = types.Item(cmbType.ItemData(cmbType.ListIndex))
  Set rs = Runner.Sessions.Item(site).GetRows("INSTANCE", "", "", " ObjType='" & tt.ObjType & "'")
  i = 0
  LstObj.Clear
  While Not rs.EOF
    i = i + 1
    On Error Resume Next
    Set o = New tmpInst
    o.ID = rs!InstanceiD
    o.Name = rs!Name
    o.ObjType = rs!ObjType
    inst.Add o
    LstObj.AddItem o.Name
    LstObj.ItemData(LstObj.NewIndex) = i
    rs.MoveNext
  Wend
  Set rs = Nothing
  
  If tt.IsSingle = -1 And LstObj.ListCount > 0 Then
    cmdCreate.Enabled = False
  Else
    cmdCreate.Enabled = True
  End If
End Sub

Private Sub cmdCancel_Click()
ok = False
Set Runner = Nothing
Set inst = Nothing
Set types = Nothing
Me.Hide
End Sub

Private Sub cmdCreate_Click()
  Dim n As String
  n = InputBox("Задайте имя нового документа", "Новый документ", types.Item(cmbType.ItemData(cmbType.ListIndex)).ObjType & " " & Now)
  If n = "" Then Exit Sub
  ID = CreateGUID2()
  If Runner.NewInstance(ID, types.Item(cmbType.ItemData(cmbType.ListIndex)).ObjType, n, site) Then
    '  cmbType_Click
    On Error GoTo bye
    ok = True
    Brief = n
    Set Runner = Nothing
    Set inst = Nothing
    Set types = Nothing
    Me.Hide
bye:
  End If
End Sub

Private Sub cmdFind_Click()
On Error GoTo bye
Dim f As Form
Set f = Runner.GetFinderDialog(site, TypeName)
f.Show vbModal

If f.ok Then
  ok = True
  Brief = f.Brief
  ID = f.ID
  Set Runner = Nothing
  Set inst = Nothing
  Set types = Nothing
  Me.Hide
bye:
End If
Set f = Nothing
End Sub

Private Sub cmdOK_Click()
  On Error GoTo bye
  If LstObj.ListIndex = -1 Then Exit Sub
  ok = True
  ID = inst.Item(LstObj.ItemData(LstObj.ListIndex)).ID
  Brief = inst.Item(LstObj.ItemData(LstObj.ListIndex)).Name
  Set Runner = Nothing
  Set inst = Nothing
  Set types = Nothing
  Me.Hide
bye:
End Sub

Private Sub cmdOpen_Click()
On Error GoTo bye
If LstObj.ListIndex >= 0 Then
  Dim obj As Object, objGUI As Object
  
  Set obj = Runner.GetInstanceObject(inst.Item(LstObj.ItemData(LstObj.ListIndex)).ID)
  If obj Is Nothing Then Exit Sub
  Set objGUI = Runner.GetInstanceGUI(obj.ID)
  If objGUI Is Nothing Then Set obj = Nothing: Exit Sub
  objGUI.Show "", obj, True
  Set objGUI = Nothing
  Set obj = Nothing
End If
bye:
End Sub

Private Sub Form_Load()
  LstObj.Clear
  Dim rs As ADODB.Recordset, i
  Dim n As String, tn As String
  If TypeName = "" Then
    Set rs = Runner.Sessions.Item(site).GetRowsEx("OBJECTTYPE", , , "AllowRefToObject=-1", "order by Name")
  Else
    Set rs = Runner.Sessions.Item(site).GetRowsEx("OBJECTTYPE", "", "", " Name='" & TypeName & "'", "order by name")
  End If

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






Private Sub LstObj_DblClick()
cmdOK_Click
End Sub
