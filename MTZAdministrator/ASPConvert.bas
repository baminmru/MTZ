Attribute VB_Name = "Module2"
Option Explicit

Public Sub ConvertASP()
  Dim i As Long, cnt As Long
  Dim xmlFile As String, prjPath As String, DONE As Boolean
  cnt = GetSetting("MTZ_ASPQUEUE", "ToDo", "Count", 0)
  For i = 1 To cnt
    xmlFile = GetSetting("MTZ_ASPQUEUE", "ToDo", "XML" & i)
    prjPath = GetSetting("MTZ_ASPQUEUE", "ToDo", "PATH" & i)
    DONE = GetSetting("MTZ_ASPQUEUE", "ToDo", "DONE" & i, False)
    If Not DONE Then
      MakeProject xmlFile, prjPath, i
    End If
    SaveSetting "MTZ_ASPQUEUE", "ToDo", "DONE" & i, True
   
  Next
End Sub


Public Sub ConvertNET()
  Dim i As Long, cnt As Long
  Dim xmlFile As String, prjPath As String, DONE As Boolean
  cnt = GetSetting("MTZ_NETQUEUE", "ToDo", "Count", 0)
  For i = 1 To cnt
    xmlFile = GetSetting("MTZ_NETQUEUE", "ToDo", "XML" & i)
    prjPath = GetSetting("MTZ_NETQUEUE", "ToDo", "PATH" & i)
    DONE = GetSetting("MTZ_NETQUEUE", "ToDo", "DONE" & i, False)
    If Not DONE Then
      MakeProject xmlFile, prjPath, i
    End If
    SaveSetting "MTZ_NETQUEUE", "ToDo", "DONE" & i, True
   
  Next
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
  If Right(path, 1) <> "\" Then path = path & "\"
  
  For i = 1 To prj.Modules.Count
    Set m = prj.Modules.item(i)
    ff = FreeFile
    If m.File <> "" Then
      Open path & m.File For Output As ff
    Else
      Open path & m.ModuleName & ".asp" For Output As ff
    End If
    For j = 1 To m.Blocks.Count
      Set b = m.Blocks.item(j)
      Print #ff, vbCrLf & b.BlockCode
    Next
    Close #ff
  Next
  
  
  
  Set Res = Nothing
  Set prj = Nothing
End Sub


