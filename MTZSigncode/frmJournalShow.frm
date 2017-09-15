VERSION 5.00
Object = "{BB95CD0C-5138-4A76-AF3C-30EFB10D1594}#8.4#0"; "MTZJournal.ocx"
Begin VB.Form frmJournalShow 
   ClientHeight    =   4995
   ClientLeft      =   165
   ClientTop       =   165
   ClientWidth     =   7485
   Icon            =   "frmJournalShow.frx":0000
   LinkTopic       =   "Form3"
   MDIChild        =   -1  'True
   ScaleHeight     =   4995
   ScaleWidth      =   7485
   ShowInTaskbar   =   0   'False
   Begin MTZJournal.JournalView jv 
      Height          =   4935
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7455
      _ExtentX        =   13150
      _ExtentY        =   8705
   End
End
Attribute VB_Name = "frmJournalShow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Event OnAdd(usedefaut As Boolean, Refesh As Boolean)
Public Event OnRun(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
Public Event OnEdit(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
Public Event OnFilter(usedefaut As Boolean)
Public Event OnPrint(usedefaut As Boolean)
Public Event OnInit(bAdd As Boolean, bEdit As Boolean, bRun As Boolean, bDel As Boolean, bFilter As Boolean)
Public Event OnDel(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)


Private Sub form_load()
Dim bAdd As Boolean, bEdit As Boolean, bRun As Boolean, bDel As Boolean, bFilter As Boolean
bAdd = True
bEdit = True
bRun = True
bDel = True
bFilter = True
RaiseEvent OnInit(bAdd, bEdit, bRun, bDel, bFilter)
jv.AllowAdd = bAdd
jv.AllowEdit = bEdit
jv.AllowRun = bRun
jv.AllowDel = bDel
jv.AllowFilter = bFilter
End Sub

Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
  If UnloadMode = vbFormMDIForm Or UnloadMode = vbFormCode Or UnloadMode = vbAppWindows Or UnloadMode = vbAppTaskManager Then
    cancel = False
  Else
    cancel = True
    Me.Hide
  End If

End Sub

Private Sub form_resize()
  On Error Resume Next
  jv.Top = 0
  jv.Left = 0
  jv.Width = Me.ScaleWidth
  jv.Height = Me.ScaleHeight
End Sub

Private Sub Form_Unload(cancel As Integer)
  
  jv.Visible = False
  Set jv.journal = Nothing
End Sub

'Private Sub jv_JVDblClick(ByVal RowIndex As Long, UseDefault As Boolean)
'  UseDefault = False
'  Me.MousePointer = vbHourglass
'  Dim Obj As Object
'  Set Obj = jv.journal.Application.Manager.GetInstanceObject(jv.RowInstanceID(RowIndex), "")
'  Dim t As Form
'  For Each t In Forms
'    If t.Caption = Obj.Name Then
'      t.WindowState = vbNormal
'      t.ZOrder 0
'      t.Show
'
'      Me.MousePointer = vbNormal
'      Exit Sub
'    End If
'  Next
'
'  Dim f As frmObj
'  Set f = New frmObj
'  f.Init Obj
'  f.Show
'  Me.MousePointer = vbNormal
'End Sub



Private Sub jv_JVOnAdd(usedefaut As Boolean, Refesh As Boolean)
  RaiseEvent OnAdd(usedefaut, Refesh)
End Sub

Private Sub jv_JVOnDel(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
  RaiseEvent OnDel(RowIndex, usedefaut, Refesh)
End Sub

Private Sub jv_JVOnEdit(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
  RaiseEvent OnEdit(RowIndex, usedefaut, Refesh)
End Sub

Private Sub jv_JVOnFilter(usedefaut As Boolean)
  RaiseEvent OnFilter(usedefaut)
End Sub

Private Sub jv_JVOnPrint(usedefaut As Boolean)
  RaiseEvent OnPrint(usedefaut)
End Sub

Private Sub jv_JVOnRun(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
  RaiseEvent OnRun(RowIndex, usedefaut, Refesh)
End Sub
