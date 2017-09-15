Attribute VB_Name = "Module3"
Option Explicit

Public Sub ConvertSQL()
  Dim i As Long, cnt As Long
  Dim xmlFile As String, prjPath As String, DONE As Boolean
  cnt = GetSetting("MTZ_SQLQUEUE", "ToDo", "Count", 0)
  For i = 1 To cnt
    xmlFile = GetSetting("MTZ_SQLQUEUE", "ToDo", "XML" & i)
    prjPath = GetSetting("MTZ_SQLQUEUE", "ToDo", "PATH" & i)
    DONE = GetSetting("MTZ_SQLQUEUE", "ToDo", "DONE" & i, False)
    If Not DONE Then
      MakeProject xmlFile, prjPath, i
    End If
    SaveSetting "MTZ_SQLQUEUE", "ToDo", "DONE" & i, True
  Next
End Sub

Public Sub ConvertORA()
  Dim i As Long, cnt As Long
  Dim xmlFile As String, prjPath As String, DONE As Boolean
  cnt = GetSetting("MTZ_ORAQUEUE", "ToDo", "Count", 0)
  For i = 1 To cnt
    xmlFile = GetSetting("MTZ_ORAQUEUE", "ToDo", "XML" & i)
    prjPath = GetSetting("MTZ_ORAQUEUE", "ToDo", "PATH" & i)
    DONE = GetSetting("MTZ_ORAQUEUE", "ToDo", "DONE" & i, False)
    If Not DONE Then
      MakeProjectBlocks xmlFile, prjPath, i
    End If
    SaveSetting "MTZ_ORAQUEUE", "ToDo", "DONE" & i, True
  Next
End Sub


Private Sub MakeProjectBlocks(ByVal xfile As String, path As String, ByVal idx As Long)
  Dim prj As MTZGenerator.ProjectHolder
  Dim i As Long
  Dim m As MTZGenerator.ModuleHolder
  Dim b As MTZGenerator.BlockHolder
  Dim bt As String, j As Long
  Dim Res As MTZGenerator.Response
  Set Res = New MTZGenerator.Response
  Set prj = Res.Project
  prj.Load xfile
  
  Dim ff As Long
  
  If Right(path, 1) <> "\" Then path = path & "\"
   
  For i = 1 To prj.Modules.Count
    Set m = prj.Modules.item(i)
    For j = 1 To m.Blocks.Count
      Set b = m.Blocks.item(j)
      ff = FreeFile
      Open path & m.ModuleName & b.BlockName & "_" & idx & ".sql" For Output As ff
      Print #ff, vbCrLf & "/* " & b.BlockName & "*/" & vbCrLf & b.BlockCode
      Close #ff
    Next
  Next

  Set Res = Nothing
  Set prj = Nothing
End Sub

Private Sub MakeProject(ByVal xfile As String, path As String, ByVal idx As Long)
  Dim prj As MTZGenerator.ProjectHolder
  Dim i As Long
  Dim m As MTZGenerator.ModuleHolder
  Dim b As MTZGenerator.BlockHolder
  Dim bt As String, j As Long
  Dim Res As MTZGenerator.Response
  Set Res = New MTZGenerator.Response
  Set prj = Res.Project
  prj.Load xfile
  
  Dim ff As Long
  ff = FreeFile
  If Right(path, 1) <> "\" Then path = path & "\"
  Open path & idx & ".sql" For Output As ff
  
  For i = 1 To prj.Modules.Count
    Set m = prj.Modules.item(i)
    For j = 1 To m.Blocks.Count
      Set b = m.Blocks.item(j)
      Print #ff, vbCrLf & "/* " & b.BlockName & "*/" & vbCrLf & b.BlockCode
    Next
  Next
  Close #ff
  Set Res = Nothing
  Set prj = Nothing
End Sub


