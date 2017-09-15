VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   7725
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7605
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   ScaleHeight     =   7725
   ScaleWidth      =   7605
   Begin VB.OLE OLE1 
      AutoActivate    =   0  'Manual
      AutoVerbMenu    =   0   'False
      BorderStyle     =   0  'None
      Height          =   4455
      Left            =   120
      OLETypeAllowed  =   1  'Embedded
      SizeMode        =   1  'Stretch
      TabIndex        =   0
      Top             =   840
      UpdateOptions   =   2  'Manual
      Width           =   6495
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim doc As Word.Document
Private OK As Boolean
Public Sub OutStr(s As String)
   Dim P As Long
   P = doc.Paragraphs.Count()
   doc.Paragraphs(P).Range.InsertAfter s
   doc.Paragraphs.Add
End Sub

Private Sub Form_Activate()
If OK Then Exit Sub
OK = True
OLE1.CreateEmbed "", "Word.Document.8"
Set doc = OLE1.object
OLE1.Action = 7
DoEvents
Dim i

For i = 1 To 100
OutStr "test string" & i
Next
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  OLE1.Top = 0
  OLE1.Left = 0
  OLE1.Width = Me.ScaleWidth
  OLE1.Height = Me.ScaleHeight - OLE1.Top
End Sub
