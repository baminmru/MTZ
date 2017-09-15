VERSION 5.00
Begin VB.Form frmObj 
   ClientHeight    =   5985
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7770
   Icon            =   "frmObj.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5985
   ScaleWidth      =   7770
End
Attribute VB_Name = "frmObj"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public c As Object
Public item As Object
Public Host As GUI
Private mymode As String

Public Sub Init(ObjItem As Object, Optional mode As String = "")
  Set item = ObjItem
  mymode = mode
again:
  On Error Resume Next
  
  Err.Clear
  If Licenses.item(item.TypeName & "GUI.ctl" & mode & "_main") Is Nothing Then
    If Err.Number > 0 Then
      MsgBox Err.Description
    End If
    Err.Clear
    Call Licenses.Add(item.TypeName & "GUI.ctl" & mode & "_main")
  End If
  
  If Err.Number > 0 Then
    MsgBox Err.Description
  End If
  Err.Clear

  Set c = Me.Controls.Add(item.TypeName & "GUI.ctl" & mode & "_main", "ctl")
  
  If Err.Number > 0 Then
    MsgBox Err.Description
  End If
  Err.Clear
  
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
  If Not c Is Nothing Then
    c.Top = 0
    c.Left = 0
    c.Width = Me.ScaleWidth
    c.Height = Me.ScaleHeight
    c.Visible = True
  End If
  frmMain.mnuDocument.Visible = True
  TestLock
End Sub

Public Function TestLock()
  If item.IsLocked = 0 Then
    Me.Caption = item.Name
  ElseIf item.IsLocked < 3 Then
    Me.Caption = item.Name & " (Заблокирован)"
  Else
    Me.Caption = item.Name & " (Заблокирован другим пользователем)"
  End If
End Function

Private Sub Form_Deactivate()
frmMain.mnuDocument.Visible = False
End Sub

Private Sub Form_GotFocus()
'frmMain.mnuDocument.Visible = True
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
  frmMain.mnuDocument.Visible = True
End Sub

Private Sub Form_LostFocus()
'frmMain.mnuDocument.Visible = False
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
If UnloadMode = vbFormControlMenu Or UnloadMode = vbFormMDIForm Or UnloadMode = vbAppWindows Then


  If Not Host Is Nothing Then
    If Not item Is Nothing Then
      If Not c Is Nothing Then
On Error GoTo bye
        c.object.OnSave
On Error Resume Next
      End If
      Host.EraseForm item.ID, mymode, False
    End If
  End If
End If
Exit Sub
bye:
  If MsgBox("Ошибка при закрытии:" & vbCrLf & Err.Description, vbCritical + vbYesNo, "Закрыть окно?") = vbNo Then
    Cancel = -1
  End If

End Sub

Private Sub Form_Resize()
On Error Resume Next
If Not c Is Nothing Then
  c.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight
End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  If Not Host Is Nothing Then
    If Not item Is Nothing Then
      Host.EraseForm item.ID, mymode, False
    End If
  End If

  If Not c Is Nothing Then
   Set c.object.parentform = Nothing
   Set c.object.item = Nothing
   Set c.object.Host = Nothing
  End If
  Set c = Nothing
  Set item = Nothing
  Set Host = Nothing
  Exit Sub
End Sub

