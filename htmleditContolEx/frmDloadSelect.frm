VERSION 5.00
Begin VB.Form frmDloadSelect 
   Caption         =   "Выберите документ для скачивания"
   ClientHeight    =   7335
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10485
   Icon            =   "frmDloadSelect.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7335
   ScaleWidth      =   10485
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   7710
      TabIndex        =   2
      Top             =   6930
      Width           =   1260
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   345
      Left            =   9060
      TabIndex        =   1
      Top             =   6930
      Width           =   1260
   End
   Begin VB.Frame Frame1 
      Height          =   6465
      Left            =   390
      TabIndex        =   0
      Top             =   60
      Width           =   10395
      Begin VB.ListBox ListView1 
         Height          =   1815
         Left            =   2490
         TabIndex        =   3
         Top             =   3120
         Width           =   5625
      End
   End
End
Attribute VB_Name = "frmDloadSelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public DloadCollection As Dloads
Public Result As Long
Public Href As String

Private Sub cmdCancel_Click()
  Result = vbCancel
  Hide
End Sub

Private Sub cmdOK_Click()
  Result = vbOK
  Href = DloadCollection.Item(ListView1.ListIndex + 1).Href
  Hide
End Sub

Private Sub Form_Load()
  Call ListView1.Clear
  If Not (DloadCollection Is Nothing) Then
    Dim i As Long
    Dim oneDlod As Dload
    For i = 1 To DloadCollection.Count
        Set oneDlod = DloadCollection.Item(i)
        Call ListView1.AddItem(oneDlod.Title & "; " & oneDlod.Name)
    Next
  End If
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  Frame1.Top = 0
  Frame1.Left = 0
  Frame1.Width = Me.ScaleWidth
  Frame1.Height = Me.ScaleHeight - cmdCancel.Height - 40
  
  ListView1.Top = 0
  ListView1.Left = 0
  ListView1.Width = Frame1.Width
  ListView1.Height = Frame1.Height
  
  cmdCancel.Top = Frame1.Height + 20
  cmdCancel.Left = Me.ScaleWidth - cmdCancel.Width - 20
  cmdOK.Top = cmdCancel.Top
  cmdOK.Left = cmdCancel.Left - 20 - cmdOK.Width
End Sub


Private Sub ListView1_DblClick()
  Call cmdOK_Click
End Sub
