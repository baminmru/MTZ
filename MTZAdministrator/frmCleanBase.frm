VERSION 5.00
Begin VB.Form frmCleanBaseTool 
   Caption         =   "Очистка базы данных"
   ClientHeight    =   7080
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5955
   LinkTopic       =   "Form1"
   ScaleHeight     =   7080
   ScaleWidth      =   5955
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtDB2 
      Height          =   375
      Left            =   120
      TabIndex        =   9
      Text            =   "<источник>"
      Top             =   6360
      Width           =   3135
   End
   Begin VB.CommandButton cmdCopyScript 
      Caption         =   "Копирование данных"
      Height          =   375
      Left            =   3360
      TabIndex        =   7
      Top             =   6360
      Width           =   2535
   End
   Begin VB.CheckBox chkNoExec 
      Caption         =   "Не исполнять скрипт"
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   5520
      Width           =   2055
   End
   Begin VB.TextBox txtLog 
      Height          =   1935
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Top             =   3480
      Width           =   5775
   End
   Begin VB.CommandButton cmdCleanBase 
      Caption         =   "Очистить базу"
      Height          =   375
      Left            =   3360
      TabIndex        =   4
      Top             =   5520
      Width           =   2535
   End
   Begin VB.ListBox lstTypes 
      Height          =   2685
      IntegralHeight  =   0   'False
      Left            =   0
      Sorted          =   -1  'True
      Style           =   1  'Checkbox
      TabIndex        =   2
      Top             =   360
      Width           =   5865
   End
   Begin VB.CommandButton cmdSelAll 
      Caption         =   "Выбрать все"
      Height          =   315
      Left            =   3360
      TabIndex        =   1
      Top             =   3120
      Width           =   1215
   End
   Begin VB.CommandButton cmdClearAll 
      Caption         =   "Отменить"
      Height          =   315
      Left            =   4680
      TabIndex        =   0
      Top             =   3120
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "База источник"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   6000
      Width           =   3015
   End
   Begin VB.Label Label4 
      Caption         =   "Типы документов для очистки"
      Height          =   255
      Left            =   0
      TabIndex        =   3
      Top             =   120
      Width           =   1515
   End
End
Attribute VB_Name = "frmCleanBaseTool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCleanBase_Click()
  Dim i As Long
  If MsgBox("Внимание, все данные по отмеченным типам документов будут удалены!" & vbCrLf & "Удалить?", vbQuestion + vbYesNo, "ВНИМАНИЕ") = vbYes Then
    For i = 0 To lstTypes.ListCount - 1
      If lstTypes.Selected(i) Then
        TruncateType model.objectType.item(lstTypes.ItemData(i))
      End If
    Next
  End If
End Sub

Private Sub cmdCopyScript_Click()
  Dim i As Long
 
  For i = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(i) Then
      CopyType model.objectType.item(lstTypes.ItemData(i))
    End If
  Next
 
End Sub

Private Sub Form_Load()
  loadTypes False
End Sub
Private Sub loadTypes(ObjOnly As Boolean)
  lstTypes.Clear
  If (ObjOnly) Then
    model.objectType.Sort = "Name"
  Else
    model.objectType.Sort = "Comment"
  End If
  Dim i As Long
  For i = 1 To model.objectType.Count
    With model.objectType.item(i)
      If (ObjOnly) Then
        lstTypes.AddItem .Name & " (" & .package.Name & "->" & .the_comment & ")"
      Else
        lstTypes.AddItem .package.Name & "->" & .the_comment
      End If
      lstTypes.ItemData(lstTypes.NewIndex) = i
    End With
  Next
End Sub

Private Sub cmdSelAll_Click()
  Dim i As Long
  For i = 0 To lstTypes.ListCount - 1
      lstTypes.Selected(i) = True
  Next
End Sub

Private Sub cmdClearAll_Click()
  Dim i As Long
  For i = 0 To lstTypes.ListCount - 1
      lstTypes.Selected(i) = False
  Next
End Sub


Private Sub TruncateType(ot As objectType)
  TruncatePart ot.PART
On Error GoTo bye
   txtLog = txtLog & vbCrLf & "delete from instance where objtype='" & ot.Name & "'" & vbCrLf & "go"
   If chkNoExec.Value = vbUnchecked Then
    Session.GetData "delete from instance where objtype='" & ot.Name & "'"
   End If
   Me.Caption = "objtype='" & ot.Name & "'"
   DoEvents
   GoTo nxt
bye:
    txtLog = txtLog & vbCrLf & Err.Description
    Debug.Print Err.Description
    Resume nxt
nxt:
End Sub

Private Sub CopyType(ot As objectType)
  
On Error GoTo bye
   CopyParts ot.PART

   txtLog = "insert into instance  select * from " & txtDB2.Text & ".dbo.instance where objtype='" & ot.Name & "'" & vbCrLf & "go" & vbCrLf & txtLog
   Me.Caption = "objtype='" & ot.Name & "'"
   DoEvents
   GoTo nxt
bye:
    txtLog = txtLog & vbCrLf & Err.Description
    Debug.Print Err.Description
    Resume nxt
nxt:
  
End Sub


Private Sub TruncatePart(pts As PART_COL)
  Dim i As Long
  For i = 1 To pts.Count
    TruncatePart pts.item(i).PART
   
   On Error GoTo bye
    txtLog = txtLog & vbCrLf & "delete from " & pts.item(i).Name & vbCrLf & "go"
    If chkNoExec.Value = vbUnchecked Then
      Session.GetData "delete from " & pts.item(i).Name
    End If
    Me.Caption = "delete from " & pts.item(i).Name
    DoEvents
   GoTo nxt
bye:
    txtLog = txtLog & vbCrLf & Err.Description
    Debug.Print Err.Description
    Resume nxt
nxt:
  Next
End Sub

Private Sub CopyParts(pts As PART_COL)
  Dim i As Long
  Dim j As Long
  Dim s As String
  Dim fl As String
  Dim ft As FIELDTYPE
  
  
  For i = 1 To pts.Count
    
   If pts.item(i).PartType <> PartType_Rassirenie Then
   On Error GoTo bye
   
    
    fl = ""
    If TypeName(pts.Parent) = "PART" Then
      fl = "parentstructrowid," & pts.item(i).Name & "id,changestamp"
    Else
      fl = "instanceid," & pts.item(i).Name & "id,changestamp"
    End If
    
    If pts.item(i).PartType = PartType_Derevo Then
     fl = fl & ",ParentRowID"
    End If
    For j = 1 To pts.item(i).Field.Count
    
      Set ft = pts.item(i).Field.item(j).FIELDTYPE
      If ft.TypeStyle <> TypeStyle_Element_oformleniy Then
        fl = fl & ","
        fl = fl & "[" & pts.item(i).Field.item(j).Name & "]"
      End If
    
    Next
    
    txtLog = txtLog & vbCrLf & "insert into " & pts.item(i).Name & "(" & fl & ") select " & fl & " from " & txtDB2.Text & ".dbo." & pts.item(i).Name & vbCrLf & "go" & vbCrLf
    
    Me.Caption = "copy " & pts.item(i).Name
    DoEvents
   GoTo nxt
bye:
    txtLog = txtLog & vbCrLf & Err.Description
    Debug.Print Err.Description
    Resume nxt
nxt:
    CopyParts pts.item(i).PART
    End If
  Next
End Sub

