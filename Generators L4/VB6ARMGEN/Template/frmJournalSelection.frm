VERSION 5.00
Object = "{812ADF51-C2C1-43FE-8ED4-94D3B1A2F27D}#1.0#0"; "MTZJournalSelection.ocx"
Begin VB.Form frmJournalSelection 
   Caption         =   "Форма выбора"
   ClientHeight    =   8310
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10230
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8310
   ScaleWidth      =   10230
   Begin MTZJournalSelection.JournalSelection jv 
      Height          =   8175
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   14420
   End
End
Attribute VB_Name = "frmJournalSelection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Event OnAdd(usedefaut As Boolean, Refesh As Boolean)
Public Event OnRun(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
Public Event OnEdit(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
Public Event OnPrint(usedefaut As Boolean)
Public Event OnDel(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
Public Event OnUnload()

Private Sub Form_Load()
  jv.AllowAdd = False
  jv.AllowEdit = True
  jv.AllowRun = True
  jv.AllowDel = True
  jv.AllowFilter = False
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  jv.Visible = False
  Set jv.journal = Nothing
  Me.Hide
  RaiseEvent OnUnload
  Unload Me
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  jv.Top = 0
  jv.Left = 0
  jv.Width = Me.ScaleWidth
  jv.Height = Me.ScaleHeight
End Sub

Private Sub Form_Unload(Cancel As Integer)
  jv.Visible = False
  Set jv.journal = Nothing
End Sub

Private Sub jv_JVGetDocMode(ByVal Doc As Object, mode As String, IsDenied As Boolean)
  IsDenied = False
End Sub
Private Sub jv_JVIsDocDeletable(ByVal Doc As Object, IsDeletable As Boolean)
  IsDeletable = False
End Sub

Private Sub jv_JVOnAdd(usedefaut As Boolean, Refesh As Boolean)
  RaiseEvent OnAdd(usedefaut, Refesh)
End Sub

Private Sub jv_JVOnDel(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
  RaiseEvent OnDel(RowIndex, usedefaut, Refesh)
End Sub

Private Sub jv_JVOnEdit(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
  RaiseEvent OnEdit(RowIndex, usedefaut, Refesh)
End Sub

Private Sub jv_JVOnPrint(usedefaut As Boolean)
  RaiseEvent OnPrint(usedefaut)
End Sub

Private Sub jv_JVOnRun(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
  RaiseEvent OnRun(RowIndex, usedefaut, Refesh)
End Sub
