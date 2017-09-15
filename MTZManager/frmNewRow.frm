VERSION 5.00
Begin VB.Form frmNewRow 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Добавить строку"
   ClientHeight    =   5700
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   7425
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5700
   ScaleWidth      =   7425
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   6000
      TabIndex        =   1
      Top             =   5160
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   4680
      TabIndex        =   0
      Top             =   5175
      Width           =   1215
   End
End
Attribute VB_Name = "frmNewRow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public c As Object
Public Item As Object

Private Function MyCtl() As Object
On Error Resume Next
Set MyCtl = c.object
End Function


Public Sub Init(ObjItem As Object, Optional mode As String = "")
  Set Item = ObjItem
  mymode = mode
again:
  On Error Resume Next
  
  Err.Clear
  If Licenses.Item(Item.TypeName & "GUI.ctl" & mode & "_main") Is Nothing Then
    Err.Clear
    Call Licenses.Add(Item.TypeName & "GUI.ctl" & mode & "_main")
  End If
'  If Err.Number > 0 Then
'    MsgBox Err.Description
'  End If
'  Err.Clear
'
  Set c = Me.Controls.Add(Item.TypeName & "GUI.ctl" & mode & "_main", "ctl")
  If c Is Nothing Then
  If mode <> "" Then
    mode = ""
    GoTo again
  End If
  End If
  c.Visible = True
  TestLock
  
  Call c.object.Init(ObjItem, Nothing, False, Me)
End Sub

Private Sub Form_Activate()
On Error Resume Next
  If Me.WindowState = 0 Then
    On Error Resume Next
    Me.Width = GetSetting(App.Title & "." & App.Major & "." & App.Minor, Item.TypeName, "WIDTH", 15000)
    Me.Height = GetSetting(App.Title & "." & App.Major & "." & App.Minor, Item.TypeName, "HEIGHT", 5000)
  End If
  'item.TypeName
  If Not c Is Nothing Then
    c.Top = 0
    c.Left = 0
    c.Width = Me.ScaleWidth
    c.Height = Me.ScaleHeight
    c.Visible = True
  End If
End Sub

Private Sub Form_Load()
On Error Resume Next
  If Not c Is Nothing Then
    c.Top = 0
    c.Left = 0
    c.Width = Me.ScaleWidth
    c.Height = Me.ScaleHeight
    c.Visible = True
  End If
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  If Not c Is Nothing Then
    c.Move 0, CoolBar1.Height, Me.ScaleWidth, Me.ScaleHeight - CoolBar1.Height
  End If
End Sub
