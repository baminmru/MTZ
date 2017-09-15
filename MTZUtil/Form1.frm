VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5355
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6960
   LinkTopic       =   "Form1"
   ScaleHeight     =   5355
   ScaleWidth      =   6960
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command9 
      Caption         =   "Remove 5"
      Height          =   375
      Left            =   480
      TabIndex        =   10
      Top             =   4440
      Width           =   1935
   End
   Begin VB.CommandButton Command8 
      Caption         =   "LE"
      Height          =   375
      Left            =   3000
      TabIndex        =   9
      Top             =   3600
      Width           =   495
   End
   Begin VB.CommandButton Command7 
      Caption         =   "GE"
      Height          =   375
      Left            =   4200
      TabIndex        =   8
      Top             =   3600
      Width           =   495
   End
   Begin VB.CommandButton Command6 
      Caption         =   "EQ"
      Height          =   375
      Left            =   3600
      TabIndex        =   7
      Top             =   3600
      Width           =   495
   End
   Begin VB.CommandButton Command5 
      Caption         =   "GT"
      Height          =   375
      Left            =   4800
      TabIndex        =   6
      Top             =   3600
      Width           =   495
   End
   Begin VB.CommandButton Command4 
      Caption         =   "LT"
      Height          =   375
      Left            =   2400
      TabIndex        =   5
      Top             =   3600
      Width           =   495
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   3600
      Width           =   1935
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Index"
      Height          =   375
      Left            =   4080
      TabIndex        =   3
      Top             =   120
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Value"
      Height          =   375
      Left            =   1920
      TabIndex        =   2
      Top             =   120
      Width           =   1935
   End
   Begin VB.ListBox List1 
      Height          =   2595
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   6255
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Name"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim i As Long
Dim col As SortableCollection
Attribute col.VB_VarHelpID = -1
Dim item As Test1
Dim S As Double

Private Sub Command1_Click()
  S = Timer
  col.Sort "TheName"
  S = Timer - S
  Me.Caption = S
  List1.Clear
  For i = 1 To col.Count
    Set item = col.item(i)
    List1.AddItem item.TheName
  Next
End Sub

Private Sub Command2_Click()
  S = Timer
  col.Sort "Value"
  S = Timer - S
  Me.Caption = S
  List1.Clear
  For i = 1 To col.Count
    Set item = col.item(i)
    List1.AddItem item.Value
  Next
End Sub

Private Sub Command3_Click()
  S = Timer
  col.Sort "Sequence"
  S = Timer - S
  Me.Caption = S
  List1.Clear
  For i = 1 To col.Count
    Set item = col.item(i)
    List1.AddItem item.Sequence
  Next
End Sub

Private Sub Command4_Click()
If col.SortName <> "Sequence" Then col.Sort "Sequence"
Dim o As Object
Set o = col.GetLT(CDbl(Text1.Text))
If o Is Nothing Then
  MsgBox "NotFound"
Else
  MsgBox o.Sequence
End If

End Sub

Private Sub Command5_Click()
If col.SortName <> "Sequence" Then col.Sort "Sequence"
Dim o As Object
Set o = col.GetGT(CDbl(Text1.Text))
If o Is Nothing Then
  MsgBox "NotFound"
Else
  MsgBox o.Sequence
End If

End Sub

Private Sub Command6_Click()
If col.SortName <> "Sequence" Then col.Sort "Sequence"
Dim o As Object
Set o = col.GetEQ(CDbl(Text1.Text))
If o Is Nothing Then
  MsgBox "NotFound"
Else
  MsgBox o.Sequence
End If

End Sub

Private Sub Command7_Click()
If col.SortName <> "Sequence" Then col.Sort "Sequence"
Dim o As Object
Set o = col.GetGE(CDbl(Text1.Text))
If o Is Nothing Then
  MsgBox "NotFound"
Else
  MsgBox o.Sequence
End If

End Sub

Private Sub Command8_Click()
If col.SortName <> "Sequence" Then col.Sort "Sequence"
Dim o As Object
Set o = col.GetLE(CDbl(Text1.Text))
If o Is Nothing Then
  MsgBox "NotFound"
Else
  MsgBox o.Sequence
End If

End Sub

Private Sub Command9_Click()

col.Remove 5
MsgBox col.Count
List1.Clear
  For i = 1 To col.Count
    Set item = col.item(i)
    List1.AddItem item.Sequence
  Next
End Sub

Private Sub Form_Load()
  Set col = New SortableCollection
  

  
  For i = 1 To 1000
    Set item = col.Add("Project1.Test1")
    item.Sequence = i + 5
    item.Value = Rnd * 32767
    item.TheName = "N" & (Rnd * 32767)
  Next
End Sub
