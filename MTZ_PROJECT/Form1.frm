VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6645
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7650
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6645
   ScaleWidth      =   7650
   Begin VB.OLE OLE1 
      AutoActivate    =   0  'Manual
      BorderStyle     =   0  'None
      Class           =   "MSProject.Project.9"
      Height          =   5895
      Left            =   240
      OLETypeAllowed  =   1  'Embedded
      SizeMode        =   1  'Stretch
      TabIndex        =   0
      Top             =   120
      UpdateOptions   =   2  'Manual
      Width           =   6735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim prj As MSProject.Project
Dim OK As Boolean

Private Sub Form_Activate()
If OK Then Exit Sub
OK = True
OLE1.CreateEmbed "", "MSProject.Project"
Set prj = OLE1.object
OLE1.Action = 7

Dim id

prj.Resources.Add "Michael M. Baranov"
prj.Resources.Add "Denis I. Kolomiitsev"
prj.Resources.Add "Philip Putyatin"
prj.ProjectStart = Date + 20


Dim t As Task
prj.Tasks.Add ("Задача 1")
Set t = prj.Tasks.Add("Задача 1.1")
t.Assignments.Add t.id, prj.Resources.Item(1).id
t.Duration = 5 * 8 * 60
t.OutlineIndent
t.Estimated = False
id = t.id

't.LevelIndividualAssignments

Set t = prj.Tasks.Add("Задача 1.2")
t.Assignments.Add t.id, prj.Resources.Item(2).id
t.Duration = 10 * 8 * 60
t.TaskDependencies.Add prj.Tasks.Item(id)
t.Estimated = False
t.Split t.Start + 5, t.Start + 10
id = t.id


Set t = prj.Tasks.Add("Задача 1.3")
t.TaskDependencies.Add prj.Tasks.Item(id)
t.Assignments.Add , prj.Resources.Item(3).id
t.Duration = 15 * 8 * 60
t.Estimated = False


End Sub

Private Sub Form_Resize()
  On Error Resume Next
  OLE1.Top = 0
  OLE1.Left = 0
  OLE1.Width = Me.ScaleWidth
  OLE1.Height = Me.ScaleHeight
End Sub

Private Sub OLE1_Updated(Code As Integer)
Debug.Print "Updated: " & Code
End Sub
