VERSION 5.00
Object = "{BB95CD0C-5138-4A76-AF3C-30EFB10D1594}#8.5#0"; "MTZJournal.ocx"
Begin VB.Form frmJournalConfig 
   Caption         =   "Состав колонок журнала"
   ClientHeight    =   4680
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6465
   Icon            =   "frmJournalConfig.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4680
   ScaleWidth      =   6465
   StartUpPosition =   2  'CenterScreen
   Begin MTZJournal.JournalDef JournalDef1 
      Height          =   4215
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   7435
   End
   Begin VB.Menu mnutest 
      Caption         =   "test"
      Visible         =   0   'False
   End
End
Attribute VB_Name = "frmJournalConfig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit




Private Sub Form_Resize()
  If Me.WindowState <> 1 Then
    JournalDef1.Left = 0
    JournalDef1.Top = 0
    JournalDef1.Width = Me.ScaleWidth
    JournalDef1.Height = Me.ScaleHeight
  End If
End Sub

Private Sub mnutest_Click()
Dim rs As adodb.Recordset
Set rs = session.GetRows("v_test", , , "Part_Name like 'WF%'")
MsgBox rs.RecordCount
Set rs = Nothing
End Sub

'Function test()
'
'  Dim rs As adodb.Recordset, i
'  Dim obj As Object
'
'  Set rs = ListInstances(Site, "MTZMetaModel")
'  If rs Is Nothing Or rs.EOF Then
'    Set GetReferenceDialog = GetReferenceDialog(tablename, Site)
'    Set rs = Nothing
'    Exit Function
'  End If
'
'  Set model = Runner.GetInstanceObject(rs!InstanceID)
'  Set rs = Nothing
'
'  Set rs = session.GetRow("PART", "name='" & tablename & "'")
'  If rs Is Nothing Or rs.EOF Then
'    Set GetReferenceDialog = GetReferenceDialog(tablename, Site)
'    Set rs = Nothing
'    Exit Function
'  End If
'
'  Dim p As PART, pv As PARTVIEW
'  Set p = model.FindObject("PART", rs!PARTID)
'
'  For i = 1 To p.PARTVIEW.Count
'    Set pv = p.PARTVIEW.Item(i)
'    If pv.ForChoose Then GoTo GetFromView
'  Next
'
'  Set GetReferenceDialog = GetReferenceDialog(tablename, Site)
'  Exit Function
'GetFromView:
'
'
'
'End Function
