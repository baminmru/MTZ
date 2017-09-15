Attribute VB_Name = "Module1"
Option Explicit
Public mVBInstance As VBIDE.VBE
Public mConnect As Connect
Dim prj As MTZGenerator.ProjectHolder

Public Sub ConvertIt()
  On Error Resume Next
  Dim i As Long, cnt As Long
  Dim xmlFile As String, prjPath As String, DONE As Boolean
  cnt = GetSetting("MTZ_VBQUEUE", "ToDo", "Count")
  For i = 1 To cnt
    xmlFile = GetSetting("MTZ_VBQUEUE", "ToDo", "XML" & i)
    prjPath = GetSetting("MTZ_VBQUEUE", "ToDo", "PATH" & i)
    DONE = GetSetting("MTZ_VBQUEUE", "ToDo", "DONE" & i, False)
    If Not DONE Then
      MakeProject xmlFile, prjPath
    End If
    SaveSetting "MTZ_VBQUEUE", "ToDo", "DONE" & i, True
  Next
End Sub


Private Sub MakeProject(ByVal xfile As String, path As String)
  On Error Resume Next
  Dim vbp As VBProject
   
  Dim i As Long
  Dim m As MTZGenerator.ModuleHolder
  Dim b As MTZGenerator.BlockHolder
  Dim vbc As VBComponent
  Dim cm As CodeModule
  Dim bt As String, j As Long
  Dim Res As MTZGenerator.Response
  Set Res = New MTZGenerator.Response
  Set prj = Res.Project
  prj.Load xfile
  
  On Error Resume Next
  While mVBInstance.VBProjects.Count > 0
    Dim cnt As Long
    
    While mVBInstance.VBProjects.Count > 0
      cnt = mVBInstance.VBProjects.Count
      mVBInstance.VBProjects.Remove mVBInstance.VBProjects.Item(1)
      If cnt = mVBInstance.VBProjects.Count Then GoTo nxt
    Wend
  Wend
nxt:
  If Not prj.Attributes.Item("Template") Is Nothing Then
      Call mVBInstance.VBProjects.AddFromTemplate(prj.Attributes.Item("Template").Value)
      'Сохранение файлов шаблона
      Set vbp = mVBInstance.VBProjects.Item(1)
      For Each vbc In vbp.VBComponents
        vbc.SaveAs path & "\" & vbc.Name & "." & GetVBCExt(vbc)
      Next
      
      
  Else
      
      Select Case LCase(prj.Attributes.Item("Type").Value)
      Case "dll"
        Set vbp = mVBInstance.VBProjects.Add(vbext_pt_ActiveXDll)
          'vbp.Type = vbext_pt_ActiveXDll
      Case "exe"
        Set vbp = mVBInstance.VBProjects.Add(vbext_pt_StandardExe)
        'vbp.Type = vbext_pt_StandardExe
      Case "ocx"
        Set vbp = mVBInstance.VBProjects.Add(vbext_pt_ActiveXControl)
  
        'vbp.Type = vbext_pt_ActiveXControl
      Case "activexexe"
        Set vbp = mVBInstance.VBProjects.Add(vbext_pt_ActiveXExe)
        'vbp.Type = vbext_pt_ActiveXExe
  
      Case Else
        'vbp.Type = vbext_pt_ActiveXDll
        Set vbp = mVBInstance.VBProjects.Add(vbext_pt_ActiveXDll)
      
        
      End Select
      
      While vbp.VBComponents.Count > 0
        vbp.VBComponents.Remove vbp.VBComponents.Item(1)
      Wend
  End If
  
  
  ' load references for project if they exists
  Dim refs As String, refarray() As String, ref_idx As Long
  refs = LCase(prj.Attributes.Item("References").Value & "")
  If refs <> "" Then
    refarray = Split(refs, ";")
    
    For ref_idx = 0 To UBound(refarray)
      vbp.References.AddFromGuid refarray(ref_idx), 1, 0
      
    Next
  End If
  
  refs = LCase(prj.Attributes.Item("Toolbox").Value & "")
  If refs <> "" Then
    refarray = Split(refs, ";")
    
    For ref_idx = 0 To UBound(refarray)
      vbp.AddToolboxProgID refarray(ref_idx)
    Next
  End If
  
    
  If prj.Attributes.Item("EXEName").Value & "" <> "" Then
    vbp.BuildFileName = prj.Attributes.Item("EXEName").Value & ""
  End If
  
  If prj.Attributes.Item("Name").Value & "" <> "" Then
    vbp.Name = prj.Attributes.Item("Name").Value & ""
  End If
  
  If prj.Attributes.Item("ProjectName").Value & "" <> "" Then
    vbp.Description = prj.Attributes.Item("ProjectName").Value & ""
  End If
  If prj.Attributes.Item("Description").Value & "" <> "" Then
    vbp.Description = prj.Attributes.Item("Description").Value & ""
  End If
  
  
    Select Case LCase(prj.Attributes.Item("Type").Value)
      Case "dll"
        vbp.CompatibleOleServer = path & "\" & vbp.Name & ".dll"
      Case "exe"
      Case "ocx"
        vbp.CompatibleOleServer = path & "\" & vbp.Name & ".OCX"
      Case "activexexe"
        vbp.CompatibleOleServer = path & "\" & vbp.Name & ".exe"
      Case Else
        vbp.CompatibleOleServer = path & "\" & vbp.Name & ".dll"
      End Select
      
  
  For i = 1 To prj.Modules.Count
    Set m = prj.Modules.Item(i)
    
    Set vbc = Nothing
    Set vbc = FindModule(vbp, Replace(Replace(m.ModuleName, ".", "_"), "'", ""))
    If vbc Is Nothing Then
      Select Case LCase(m.Attributes.Item("Type").Value)
      Case "module"
         
        Set vbc = vbp.VBComponents.Add(vbext_ct_StdModule)
      Case "class"
        Set vbc = vbp.VBComponents.Add(vbext_ct_ClassModule)
      Case "form"
        Set vbc = vbp.VBComponents.Add(vbext_ct_VBForm)
      Case "mdi"
        Set vbc = vbp.VBComponents.Add(vbext_ct_VBMDIForm)
      Case "designer"
        Set vbc = vbp.VBComponents.Add(vbext_ct_ActiveXDesigner)
      Case "control"
        Set vbc = vbp.VBComponents.Add(vbext_ct_UserControl)
      Case Else
        Set vbc = vbp.VBComponents.Add(vbext_ct_StdModule)
      End Select
      
      vbc.Name = Replace(Replace(m.ModuleName, ".", "_"), "'", "")
      Debug.Print m.ModuleName
    End If
    
    
    Select Case LCase(m.Attributes.Item("Instancing").Value)
    Case "private"
      vbc.Properties("Instancing") = 1
    Case "multiuse"
      vbc.Properties("Instancing") = 5
    Case "publicnotcreatable"
      vbc.Properties("Instancing") = 2
    Case "global"
      vbc.Properties("Instancing") = 6
    Case Else
      vbc.Properties("Instancing") = 5
    End Select
    
    Set cm = vbc.CodeModule
    
    For j = 1 To m.Blocks.Count
      Set b = m.Blocks.Item(j)
      bt = LCase(b.Attributes.Item("Type").Value)
      If bt = "controlset" Then
        LoadForm vbc, b
      End If
      
      If bt = "form" Then
        LoadForm vbc, b
      End If
      
      If bt = "description" Then
        cm.InsertLines cm.CountOfDeclarationLines + 1, b.BlockCode
      End If
      
      If bt = "code" Then
        cm.InsertLines cm.CountOfLines + 1, b.BlockCode
      End If
    Next
    If m.File <> "" Then
      vbc.SaveAs path & "\" & m.File
    Else
      Dim ext As String
      Select Case LCase(m.Attributes.Item("Type").Value)
      Case "module"
        ext = ".bas"
      Case "class"
        ext = ".cls"
      Case "form"
        ext = ".frm"
      Case "mdi"
        ext = ".frm"
      Case "designer"
        ext = ".dsr"
      Case "control"
        ext = ".ctl"
      Case Else
        ext = ".txt"
      End Select
      
      vbc.SaveAs path & "\" & vbc.Name & ext
      
    End If
    vbc.Reload
  Next
  
  vbp.SaveAs path & "\" & vbp.Name & ".vbp"
  
  Set Res = Nothing
  Set prj = Nothing
End Sub

Private Function FindModule(vbp As VBProject, ByVal s As String) As VBComponent
Dim vbc As VBComponent
  For Each vbc In vbp.VBComponents
    If UCase(s) = UCase(vbc.Name) Then
      Set FindModule = vbc
      Exit For
    End If
  Next
End Function

Private Function GetVBCExt(vbc As VBComponent)
  Dim s As String
  With vbc
    If .Type = vbext_ct_ActiveXDesigner Then s = "dsr"
    If .Type = vbext_ct_ClassModule Then s = "cls"
    If .Type = vbext_ct_DocObject Then s = "dco"
    If .Type = vbext_ct_MSForm Then s = "frm"
    If .Type = vbext_ct_PropPage Then s = "prp"
    If .Type = vbext_ct_RelatedDocument Then s = "txt"
    If .Type = vbext_ct_ResFile Then s = "res"
    If .Type = vbext_ct_StdModule Then s = "bas"
    If .Type = vbext_ct_UserControl Then s = "ctl"
    If .Type = vbext_ct_VBForm Then s = "frm"
    If .Type = vbext_ct_VBMDIForm Then s = "frm"
  End With
  GetVBCExt = s
End Function

Sub LoadForm(vbc As VBComponent, b As BlockHolder)
  Dim fd As MTZGenerator.FormData
  Dim vbf As VBForm, i As Long
  On Error Resume Next
  Set fd = b.FormData
  
  For i = 1 To fd.PropertyData.Count
    vbc.Properties(fd.PropertyData.Item(i).Name) = fd.PropertyData.Item(i).PropValue
  Next
  Set vbf = vbc.Designer
  
    
  Call LoadControls(vbf.ContainedVBControls, fd.ControlData)
  
  Set fd = Nothing
End Sub



Sub LoadControlSet(vbc As VBComponent, b As BlockHolder)
  Dim fd As MTZGenerator.FormData
  Dim vbf As VBForm, i As Long
  On Error Resume Next
  Set fd = b.FormData
  Set vbf = vbc.Designer
  Call LoadControls(vbf.ContainedVBControls, fd.ControlData)
  Set fd = Nothing
End Sub


Sub LoadControls(vbc As ContainedVBControls, cd As ControlData_col)
  Dim ctrl As VBControl
  Dim i As Long, j As Long
  On Error Resume Next
  For i = 1 To cd.Count
    Err.Clear
    Set ctrl = vbc.Add(cd.Item(i).ProgId)
'    If cd.Item(i).ProgId = "VB.Menu" Then
'      Stop
'    End If
    DoEvents
    'If Err > 0 Then
    '  MsgBox cd.Item(i).Name & vbCrLf & " bad PROGID:" & cd.Item(i).ProgId & vbCrLf & Err.Description
    'End If
    Err.Clear
    For j = 1 To cd.Item(i).Properties.Count
        ctrl.Properties(cd.Item(i).Properties.Item(j).Name) = cd.Item(i).Properties.Item(j).PropValue
      DoEvents
      'If Err > 0 Then
      '  MsgBox cd.Item(i).Name & "." & cd.Item(i).Properties.Item(j).Name & vbCrLf & Err.Description, vbOKOnly, ctrl.Name
      'End If
      Err.Clear
    Next
    DoEvents
    If cd.Item(i).ControlData.Count > 0 Then
       Call LoadControls(ctrl.ContainedVBControls, cd.Item(i).ControlData)
    End If
    DoEvents
  Next
End Sub
