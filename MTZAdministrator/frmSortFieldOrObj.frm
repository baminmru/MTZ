VERSION 5.00
Begin VB.Form frmSortFieldOrObj 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Сортировка полей и разделов (стрелочки вверх и вниз + ALT)"
   ClientHeight    =   8355
   ClientLeft      =   2175
   ClientTop       =   2100
   ClientWidth     =   8895
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8355
   ScaleWidth      =   8895
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chkNCfield 
      Caption         =   "Порядок: Название(eng) {Описание}"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4800
      TabIndex        =   9
      Top             =   7200
      Width           =   3855
   End
   Begin VB.CheckBox chkNCpart 
      Caption         =   "Порядок: Название(eng) {Описание}"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   360
      TabIndex        =   8
      Top             =   7200
      Width           =   3855
   End
   Begin VB.ListBox listPart 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6150
      Left            =   0
      TabIndex        =   0
      Top             =   960
      Width           =   4455
   End
   Begin VB.CommandButton loadPart 
      Caption         =   "Загрузить раздел"
      Height          =   375
      Left            =   0
      TabIndex        =   2
      Top             =   360
      Width           =   8895
   End
   Begin VB.CommandButton btExit 
      Caption         =   "Выход"
      Height          =   375
      Left            =   0
      TabIndex        =   4
      Top             =   7920
      Width           =   8895
   End
   Begin VB.CommandButton loadObj 
      Caption         =   "Загрузить тип объекта"
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   8895
   End
   Begin VB.CommandButton btSortField 
      Caption         =   "Применить сортировку"
      Enabled         =   0   'False
      Height          =   375
      Left            =   4440
      TabIndex        =   6
      Top             =   7560
      Width           =   4455
   End
   Begin VB.CommandButton btSortPart 
      Caption         =   "Применить сортировку"
      Enabled         =   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   3
      Top             =   7560
      Width           =   4455
   End
   Begin VB.ListBox listField 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6150
      Left            =   4440
      TabIndex        =   5
      Top             =   960
      Width           =   4455
   End
   Begin VB.Label cmt 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   0
      TabIndex        =   7
      Top             =   720
      Width           =   8895
   End
End
Attribute VB_Name = "frmSortFieldOrObj"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Compare Text

Private obj As Object

Private p As objectType
Private f As PART

Private Sub btExit_Click()
  Hide
End Sub

Private Function formatSTR1(s As String) ' - X {
  Dim i As Long
  Dim dS, dE As Long
  dS = -1
  dE = -1
  For i = 1 To Len(s)
    If Mid(s, i, 1) = "-" And dS = -1 Then dS = i
    If Mid(s, i, 1) = "+" And dS = -1 Then dS = i
    If Mid(s, i, 1) = "{" And dE = -1 Then dE = i: Exit For
  Next
  formatSTR1 = Mid(s, dS + 2, dE - dS - 3)
End Function

Private Function formatSTR2(s As String) ' - { X }
  Dim i As Long
  Dim dS, dE As Long
  For i = 1 To Len(s)
    If Mid(s, i, 1) = "{" Then dS = i
    If Mid(s, i, 1) = "}" Then dE = i
  Next
  formatSTR2 = Mid(s, dS + 1, dE - dS - 1)
End Function

Private Sub btSortField_Click()
  Dim i, j As Long, s As String
  
  Dim col As Collection
  Set col = New Collection
  
  Dim mx As Long
  
  For i = 1 To obj.Field.Count
    If mx < obj.Field.item(i).sequence Or i = 1 Then
    mx = obj.Field.item(i).sequence
    End If
    
  Next
  mx = mx + 1000
  
  For i = 0 To obj.Field.Count - 1
    If chkNCfield.Value = 0 Then col.Add CStr(i + 1), formatSTR1(listField.List(i))
    If chkNCfield.Value = 1 Then col.Add CStr(i + 1), formatSTR2(listField.List(i))
  Next
  
  For i = 1 To obj.Field.Count
    With obj.Field.item(i)
      .sequence = mx + col.item(obj.Field.item(i).Name)
      .Save
    End With
  Next
  
  obj.Field.Sort = "sequence"
  For i = 1 To obj.Field.Count
    With obj.Field.item(i)
      .sequence = col.item(obj.Field.item(i).Name)
      .Save
    End With
  Next
  obj.Save
  
  Set col = Nothing
  
  sortField
End Sub

Private Sub btSortPart_Click()
  Dim i, j As Long, s As String
  
  Dim col As Collection
  Dim mx As Long
  Set col = New Collection
  
  For i = 1 To obj.PART.Count
    If mx < obj.PART.item(i).sequence Or i = 1 Then
      mx = obj.PART.item(i).sequence
    End If
  Next
  mx = mx + 1000
  
  For i = 0 To obj.PART.Count - 1
    If chkNCpart.Value = 0 Then col.Add CStr(i + 1), formatSTR1(listPart.List(i))
    If chkNCpart.Value = 1 Then col.Add CStr(i + 1), formatSTR2(listPart.List(i))
  Next
  
  For i = 1 To obj.PART.Count
    With obj.PART.item(i)
      .sequence = mx + col.item(.Name)
      .Save
    End With
  Next
  
  obj.PART.Sort = "sequence"
  
  For i = 1 To obj.PART.Count
    With obj.PART.item(i)
      .sequence = col.item(.Name)
      .Save
    End With
  Next
  obj.Save
  
  sortPart
  
  Set col = Nothing
End Sub

Private Sub lstEdit(lst As ListBox, KeyCode As Integer)
  Dim ColIndex As Integer
  Dim ColText As String
  Dim lngListindex As Long
  
  If KeyCode = 38 Then 'UP
    If lst.ListIndex <= 0 Then Exit Sub
    With lst
      lngListindex = .ListIndex
      ColText = .Text
      ColIndex = .ItemData(lngListindex)
      .RemoveItem lngListindex
      If lngListindex > 0 Then lngListindex = lngListindex - 1
      .AddItem ColText, lngListindex
      .ItemData(.NewIndex) = ColIndex
      .ListIndex = .NewIndex
      .SetFocus
    End With
  End If
  
  If KeyCode = 40 Then 'DOWN
    If lst.ListIndex = -1 Or lst.ListIndex = lst.ListCount - 1 Then Exit Sub
    With lst
      lngListindex = .ListIndex
      ColText = .Text
      ColIndex = .ItemData(lngListindex)
      .RemoveItem lngListindex
      lngListindex = lngListindex + 1
      .AddItem ColText, lngListindex
      .ItemData(.NewIndex) = ColIndex
      .ListIndex = .NewIndex
      .SetFocus
    End With
  End If
End Sub

Private Sub chkNCfield_Click()
  sortField
End Sub

Private Sub chkNCpart_Click()
  sortPart
End Sub

Private Sub listField_KeyUp(KeyCode As Integer, Shift As Integer)
  If Shift = 4 Then Call lstEdit(listField, KeyCode)
End Sub

Private Sub listPart_KeyUp(KeyCode As Integer, Shift As Integer)
  If Shift = 4 Then Call lstEdit(listPart, KeyCode)
End Sub

Private Sub sortPart()
  listPart.Clear
  
  On Error Resume Next
  Dim i As Long
  
  Dim sc As SortableCollection
  Set sc = New SortableCollection
  
  For i = 1 To obj.PART.Count
    With obj.PART.item(i)
      Dim o As VK
      Set o = New VK
      If chkNCpart.Value = 0 Then o.v = .Name & " {" & .Caption & "}"
      If chkNCpart.Value = 1 Then o.v = .Caption & " {" & .Name & "}"
      'o.v = .Name & " {" & .Caption & "}"
      o.k = .sequence
      
      sc.AddItem o, CStr(.sequence)
    End With
  Next
  sc.Sort "k"
  
  For i = 1 To sc.Count
    listPart.AddItem sc.item(i).k & " - " & sc.item(i).v
  Next

  Unload sc
End Sub

Private Sub sortField()
  listField.Clear
   
  On Error Resume Next
  Dim i As Long
  
  Dim sc As SortableCollection
  Set sc = New SortableCollection
  
  For i = 1 To obj.Field.Count
    With obj.Field.item(i)
      Dim o As VK
      Set o = New VK
      If chkNCfield.Value = 0 Then o.v = .Name & " {" & .Caption & "}"
      If chkNCfield.Value = 1 Then o.v = .Caption & " {" & .Name & "}"
      o.p = " - "
      If .AllowNull Then o.p = " + "
      o.k = .sequence
      
      sc.AddItem o, CStr(.sequence)
    End With
  Next
  sc.Sort "k"
  For i = 1 To sc.Count
    listField.AddItem sc.item(i).k & sc.item(i).p & sc.item(i).v
  Next

  Unload sc
End Sub

Private Sub loadObj_Click()
  Dim ID As String, Brief As String
  If Manager.GetReferenceDialogEx2("OBJECTTYPE", ID, Brief) Then
    cmt.Caption = Brief
    Set obj = MyUser.Application.FindRowObject("OBJECTTYPE", ID)
    
    If obj.PART.Count > 0 Then
      listPart.Enabled = True
      btSortPart.Enabled = True
      sortPart
    
      listField.Enabled = False
      btSortField.Enabled = False
    Else
      listPart.Enabled = False
      btSortPart.Enabled = False
      listField.Enabled = False
      btSortField.Enabled = False
    End If
  End If
End Sub

Private Sub loadPart_Click()
  Dim ID As String, Brief As String
  If Manager.GetReferenceDialogEx2("PART", ID, Brief) Then
    cmt.Caption = Brief
    Set obj = MyUser.Application.FindRowObject("PART", ID)
    
    If obj.PART.Count > 0 Then
      listPart.Enabled = True
      btSortPart.Enabled = True
      sortPart
    Else
      listPart.Enabled = False
      btSortPart.Enabled = False
    End If
    
    If obj.Field.Count > 0 Then
      listField.Enabled = True
      btSortField.Enabled = True
      sortField
    Else
      listField.Enabled = False
      btSortField.Enabled = False
    End If
  End If
End Sub
