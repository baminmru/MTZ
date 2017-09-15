VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "buttonsGen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Private body As String

Public Sub init(n As String)
  body = body & vbCrLf & "Private Sub " & n & "_KeyUp(KeyCode As Integer, Shift As Integer)"
  body = body & vbCrLf & "  On Error Resume Next"
End Sub

Public Sub addButton(n As String, t As String)
  Select Case t
    Case "AddRoot"
      body = body & vbCrLf & "If Shift = 2 And KeyCode = 45 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
    Case "Add"
      body = body & vbCrLf & "If Shift = 0 And KeyCode = 45 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
    Case "Edit"
      body = body & vbCrLf & "If Shift = 0 And KeyCode = 13 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
    Case "Del"
      body = body & vbCrLf & "If Shift = 0 And KeyCode = 46 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
    Case "Prn"
      body = body & vbCrLf & "If Shift = 2 And KeyCode = 80 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
    Case "Fnd"
      body = body & vbCrLf & "If Shift = 2 And KeyCode = 70 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
    Case "Filter"
      body = body & vbCrLf & "If Shift = 2 And KeyCode = 65 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
    Case "ClearFilter"
      body = body & vbCrLf & "If Shift = 4 And KeyCode = 65 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
    Case "ExportXL"
      body = body & vbCrLf & "If Shift = 2 And KeyCode = 69 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
    Case "Run"
      body = body & vbCrLf & "If Shift = 2 And KeyCode = 13 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
    Case "Save"
      body = body & vbCrLf & "If Shift = 2 And KeyCode = 83 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
'    Case "Ref"
'      body = body & vbCrLf & "If Shift = 0 And KeyCode = 45 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
'    Case "Cnf"
'      body = body & vbCrLf & "If Shift = 0 And KeyCode = 45 And cmd" & n & t & ".Enabled Then cmd" & n & t & "_Click"
  End Select

'  Dim but As buttonsGen
'  Set but = New buttonsGen
'  Call but.init(rctl.name)
'
'  Call but.addButton(btn.name, "AddRoot")
'
'  body = body & vbCrLf & but.retKeyUp
'
'  Set but = Nothing

End Sub

Public Function retKeyUp() As String
  body = body & vbCrLf & "  KeyCode = 0"
  body = body & vbCrLf & "End Sub"
  retKeyUp = body
End Function
