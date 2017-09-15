VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl MSProjectExt 
   ClientHeight    =   5730
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   ScaleHeight     =   5730
   ScaleWidth      =   6750
   Begin MSComctlLib.ProgressBar pbInfo 
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Visible         =   0   'False
      Width           =   30
      _ExtentX        =   53
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.Label Label1 
      Caption         =   "Microsoft Project не установлен"
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   6135
   End
End
Attribute VB_Name = "MSProjectExt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True

Public Item As Object
Public Host As Object
Public ModalMode As Boolean
Public ParentForm As Object
Public TargetPlatformID As String

Private objSTDMSProject As STDMSProject.Application
Private WithEvents objMSProject As MSProject.Project
Attribute objMSProject.VB_VarHelpID = -1
Private WithEvents OleEventer As OLE
Attribute OleEventer.VB_VarHelpID = -1

Private TheControl As Control
Private TheContainer As Frame

Private m_Changed As Boolean
Private b_inLoad As Boolean

Public CurrentTop As Long
Public CurrentLeft As Long
Public CurrentWidth As Long
Public CurrentHeight As Long

Public Sub OnTabClick()

    If TheControl Is Nothing Then
       Command1_Click
       TheControl.Refresh
    Else
        
'        TheControl.SizeMode = 1
'        DoEvents
'        TheControl.SizeMode = 2
        'TheControl.object.Application.ActiveWindow.Height = CLng(TheContainer.Height / Screen.TwipsPerPixelY)
        'TheControl.object.Application.ActiveWindow.Width = CLng(TheContainer.Width / Screen.TwipsPerPixelX)
    End If
    
    If Not TheControl Is Nothing Then
        
        TheControl.Visible = True
        TheContainer.Visible = True
        TheContainer.BorderStyle = 0
        
        TheContainer.Top = CurrentTop
        TheContainer.Left = CurrentLeft
        TheContainer.Width = CurrentWidth '/ 2
        TheContainer.Height = CurrentHeight '/ 2
        
        TheControl.Top = 0
        TheControl.Left = 0
        TheControl.Width = TheContainer.Width
        TheControl.Height = TheContainer.Height
        
        Call TheControl.DoVerb(vbOLEShow)
        TheControl.SizeMode = 1
        DoEvents
        TheControl.SizeMode = 0
        
        'objMSProject.Application.AppSize TheContainer.Width, TheContainer.Height, True
        'objMSProject.Application.AppMaximize
        
        
        On Error Resume Next
        'Call TheControl.DoVerb(vbOLEShow) 'vbOLEUIActivate)
        
        'objMSProject.Application.ActiveWindow.Height = CLng(TheContainer.Height / Screen.TwipsPerPixelY)
        'objMSProject.Application.ActiveWindow.Width = CLng(TheContainer.Width / Screen.TwipsPerPixelX)
        'TheControl.Refresh
    
        TheContainer.ZOrder
        

        
        On Error GoTo 0
    
    End If
End Sub

Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
    Debug.Print "...Dummy OnClick..." + vbCrLf
End Sub

Public Sub OnSave()
    Debug.Print "...Dummy onsave..." + vbCrLf
End Sub


Public Sub Save()
    Debug.Print "...Dummy save..." + vbCrLf
End Sub

Public Function IsChanged() As Boolean
  
  If Label1.Visible Then
    IsChanged = False
    Exit Function
  End If
  
  Dim vbres
  If m_Changed Then
    vbres = MsgBox("Сохранить изменения в MS Project?", vbYesNo, "Проект")
    Select Case vbres
      Case vbYes:
          SaveMSPData
      Case vbNo:
          IsChanged = False
      Case vbCancel:
          IsChanged = False
    End Select
  Else
    IsChanged = False
  End If
End Function

Private Function LoadMSPData()
'b_inLoad = True
Dim objResource As STDMSProject.STDProjResources
Dim objTask As STDMSProject.STDProjTasks
Dim objTaskResource As STDMSProject.STDProjAssign

Dim objMSResource As MSProject.Resource
Dim objMSTask As MSProject.Task
Dim objAssignment As MSProject.Assignment
Dim bNotFound As Boolean

Dim i As Long
Dim l As Long
Dim timer As Date

    timer = Now
    On Error GoTo Error_Detected

    If objSTDMSProject Is Nothing Then
        Exit Function
    End If
    objMSProject.Application.ActiveWindow.Visible = False
    
    'LOAD RESOURCES
    objSTDMSProject.STDProjResources.Sort = "EXTERNAL_ID"
    
    Label1.Caption = "Загрузка ресурсов..."
    Label1.Visible = True
    Label1.ZOrder
    pbInfo.Max = objSTDMSProject.STDProjResources.Count
    pbInfo.Min = 1
    pbInfo.Left = 0
    pbInfo.Width = CurrentWidth
    pbInfo.Visible = True
    pbInfo.ZOrder
    'Command1.Visible = True
    'Command1.SetFocus
    '-'DoEvents
    'MsgBox "Wait!"
    For i = 1 To objSTDMSProject.STDProjResources.Count
        Set objResource = objSTDMSProject.STDProjResources.Item(i)
        Set objMSResource = objMSProject.Resources.Add(objResource.TheResource)
        'objMSResource.ID = objResource.EXTERNAL_ID
        On Error Resume Next
        objMSResource.Cost = objResource.RCCost
        objMSResource.Name = objResource.TheResource
        On Error GoTo Error_Detected
        pbInfo.value = i
        '-'DoEvents
    Next
    
    Label1.Caption = "Загрузка задач..."
    pbInfo.Max = objSTDMSProject.STDProjTasks.Count
    pbInfo.Min = 1
    'INITIAL LOAD TASKS
    '-'DoEvents
    objSTDMSProject.STDProjTasks.Sort = "EXTERNAL_ID"
    For i = 1 To objSTDMSProject.STDProjTasks.Count
        Set objTask = objSTDMSProject.STDProjTasks.Item(i)
        Set objMSTask = objMSProject.Tasks.Add(objTask.TheName)
        'objMSTask.ID = objTask.EXTERNAL_ID
        objMSTask.Name = objTask.TheName
        objMSTask.Duration = objTask.Duration
        objMSTask.Estimated = objTask.Estimated
        objMSTask.PercentComplete = objTask.Completed
        objMSTask.EffortDriven = False
        If objTask.OutlineLevel > 0 Then
            objMSTask.OutlineLevel = objTask.OutlineLevel
        End If
        'LOAD TASK RESOURCES
        objTask.STDProjAssign.Sort = "EXTERNAL_ID"
        For l = 1 To objTask.STDProjAssign.Count
            Set objTaskResource = objTask.STDProjAssign.Item(l)
            Set objAssignment = objMSTask.Assignments.Add(objMSTask.ID, objTaskResource.TheResource.EXTERNAL_ID, objTaskResource.PercentUsage)
            'objAssignment.Units = objTaskResource.PercentUsage
            'objTaskResource.PercentUsage = .Work
            'objMSResource.ID = objTaskResource.TheResource.EXTERNAL_ID
        Next
        pbInfo.value = i
        '-'DoEvents
    Next
    
    Label1.Caption = "Загрузка связей..."
    pbInfo.Max = objSTDMSProject.STDProjTasks.Count
    pbInfo.Min = 1
    '-'DoEvents
    'LOAD TASK PREDCESSORS
    objSTDMSProject.STDProjTasks.Sort = "EXTERNAL_ID"
    For i = 1 To objSTDMSProject.STDProjTasks.Count
        Set objTask = objSTDMSProject.STDProjTasks.Item(i)
        Set objMSTask = objMSProject.Tasks.Item(objTask.EXTERNAL_ID)
        
        Dim objTaskDependency  As MSProject.TaskDependency
        For l = 1 To objTask.STDProjPredcessors.Count
            Dim objPredcessor As STDMSProject.STDProjPredcessors
            Set objPredcessor = objTask.STDProjPredcessors.Item(l)
            Set objTaskDependency = objMSTask.TaskDependencies.Add(objMSProject.Tasks.Item(objPredcessor.TaskPredcessor.EXTERNAL_ID), objPredcessor.TypePredessor, objPredcessor.LagPredessor)
            
        Next
        pbInfo.value = i
        '-'DoEvents
    Next
    Debug.Print (CStr(Now - timer))
    On Error Resume Next
    TheControl.Visible = False
    TheControl.Visible = True
    Label1.Visible = False
    pbInfo.Visible = False
    '-'DoEvents
    'b_inLoad = False
    Exit Function
Error_Detected:
    Debug.Print Err.Description
    Exit Function
    Resume
End Function

Private Function SaveMSPData()
Dim objResource As STDMSProject.STDProjResources
Dim objTask As STDMSProject.STDProjTasks
Dim objTaskResource As STDMSProject.STDProjAssign

Dim objMSResource As MSProject.Resource
Dim objAssignment As MSProject.Assignment
Dim objMSTask As MSProject.Task
Dim bNotFound As Boolean
Dim lCount As Long
Dim UpdateDT As Date

    UpdateDT = Now

    On Error GoTo Error_Detected

    If objSTDMSProject Is Nothing Then
    End If

    Set objMSProject = TheControl.object

    For Each objMSResource In objMSProject.Resources
        bNotFound = True
        'If objMSResource.Text29 <> "" Then
            objSTDMSProject.STDProjResources.Filter = "EXTERNAL_ID=" + CStr(objMSResource.ID) + ""
            If objSTDMSProject.STDProjResources.Count > 0 Then
                Set objResource = objSTDMSProject.STDProjResources.Item(1)
                bNotFound = False
            End If
        'End If
        
        If bNotFound Then
            Set objResource = objSTDMSProject.STDProjResources.Add
        End If
        objResource.RCCost = objMSResource.Cost
        objResource.TheResource = objMSResource.Name
        objResource.LastUpdate = UpdateDT
        objResource.EXTERNAL_ID = objMSResource.ID
        objResource.Save
    Next
    'Delete unused
    objSTDMSProject.STDProjResources.Filter = "LastUpdate<>" + FormatDT(UpdateDT, True) + ""
    For i = objSTDMSProject.STDProjResources.Count To 1 Step -1
        objSTDMSProject.STDProjResources.Item(i).Delete
    Next
    'eof

    For Each objMSTask In objMSProject.Tasks
        bNotFound = True
        'If objMSTask.Text29 <> "" Then
            objSTDMSProject.STDProjTasks.Filter = "EXTERNAL_ID=" + CStr(objMSTask.ID) + ""
            If objSTDMSProject.STDProjTasks.Count > 0 Then
                Set objTask = objSTDMSProject.STDProjTasks.Item(1)
                bNotFound = False
            End If
        'End If
        
        If bNotFound Then
            Set objTask = objSTDMSProject.STDProjTasks.Add
        End If
        objTask.TheName = objMSTask.Name
        objTask.Duration = objMSTask.Duration
        objTask.Estimated = objMSTask.Estimated
        objTask.Completed = objMSTask.PercentComplete
        objTask.LastUpdate = UpdateDT
        objTask.EXTERNAL_ID = objMSTask.ID
        objTask.OutlineLevel = objMSTask.OutlineLevel
        objTask.Save
        
        'Обрабатываем ресурсы...
        For Each objAssignment In objMSTask.Assignments
            bNotFound = True
            objTask.STDProjAssign.Filter = "EXTERNAL_ID=" + CStr(objAssignment.ResourceID) + ""
            If objTask.STDProjAssign.Count > 0 Then
                Set objTaskResource = objTask.STDProjAssign.Item(1)
                bNotFound = False
            End If
            
            If bNotFound Then
                Set objTaskResource = objTask.STDProjAssign.Add
            End If
            
            objTaskResource.PercentUsage = objAssignment.Units
            Set objTaskResource.TheResource = GetResourceFromID(objAssignment.ResourceID)
            objTaskResource.LastUpdate = UpdateDT
            objTaskResource.EXTERNAL_ID = 0
            objTaskResource.Save
        Next
        
        'Delete unused
        objTask.STDProjAssign.Filter = "LastUpdate<>" + FormatDT(UpdateDT, True) + ""
        For i = objTask.STDProjAssign.Count To 1 Step -1
            objTask.STDProjAssign.Item(i).Delete
        Next
        'eof
    Next
    
    'Delete unused
    objSTDMSProject.STDProjTasks.Filter = "LastUpdate<>" + FormatDT(UpdateDT, True) + ""
    For i = objSTDMSProject.STDProjTasks.Count To 1 Step -1
        objSTDMSProject.STDProjTasks.Item(i).Delete
    Next
    'eof
    objSTDMSProject.Save
    'Save tasks links
    For Each objMSTask In objMSProject.Tasks
        Set objTask = Nothing
        objSTDMSProject.STDProjTasks.Filter = "EXTERNAL_ID=" + CStr(objMSTask.ID) + ""
        If objSTDMSProject.STDProjTasks.Count > 0 Then
            Set objTask = objSTDMSProject.STDProjTasks.Item(1)
            bNotFound = False
        End If
        If Not objTask Is Nothing Then
            'Check Predcessors
            If objTask.STDProjPredcessors.Count > 0 Then
                On Error Resume Next
                lCount = 0
                While objTask.STDProjPredcessors.Count > 0
                    objTask.STDProjPredcessors.Item(1).Delete
                    If lCount > 10 Then
                        objTask.STDProjPredcessors.Refresh
                    End If
                    lCount = lCount + 1
                Wend
                On Error GoTo Error_Detected
            End If
            
            Dim objTaskDependency  As MSProject.TaskDependency
            Dim objPredcessor As STDMSProject.STDProjPredcessors
            For Each objTaskDependency In objMSTask.TaskDependencies
                If objMSTask.ID <> objTaskDependency.From.ID And objMSTask.ID = objTaskDependency.To.ID Then
                    Set objPredcessor = objTask.STDProjPredcessors.Add
                    Set objPredcessor.TaskPredcessor = GetTaskFromID(objTaskDependency.From.ID)
                    objPredcessor.LagPredessor = objTaskDependency.Lag
                    objPredcessor.TypePredessor = objTaskDependency.Type
                    objPredcessor.LastUpdate = UpdateDT
                    objPredcessor.Save
                End If
            Next
        End If
    Next
    
    Exit Function
Error_Detected:
    Debug.Print Err.Description
    Exit Function
    Resume
End Function

Private Function GetResourceFromID(lID As Long) As STDMSProject.STDProjResources
Dim objRS As Object
    objSTDMSProject.STDProjResources.Filter = ""
    Set objRS = Manager.GetSession.GetRowsEx("STDProjResources", , , "EXTERNAL_ID=" + CStr(lID))
    If Not objRS Is Nothing Then
        If Not objRS.EOF And Not objRS.bof Then
            Set GetResourceFromID = objSTDMSProject.STDProjResources.Item(objRS.Fields("STDProjResourcesid"))
        Else
            Set GetResourceFromID = Nothing
        End If
    Else
        Set GetResourceFromID = Nothing
    End If

    
'objSTDMSProject.STDProjResources.Filter = "EXTERNAL_ID=" + CStr(lID) + ""
'If objSTDMSProject.STDProjResources.Count > 0 Then
'    Set GetResourceFromID = objSTDMSProject.STDProjResources.Item(1)
'Else
'    Set GetResourceFromID = Nothing
'End If
End Function


Private Function GetTaskFromID(lID As Long) As STDMSProject.STDProjTasks
Dim objRS As Object
    objSTDMSProject.STDProjTasks.Filter = ""
    Set objRS = Manager.GetSession.GetRowsEx("STDProjTasks", , , "EXTERNAL_ID=" + CStr(lID))
    If Not objRS Is Nothing Then
        If Not objRS.EOF And Not objRS.bof Then
            Set GetTaskFromID = objSTDMSProject.STDProjTasks.Item(objRS.Fields("STDProjTasksid"))
        Else
            Set GetTaskFromID = Nothing
        End If
    Else
        Set GetTaskFromID = Nothing
    End If
'objSTDMSProject.STDProjTasks.Filter = "EXTERNAL_ID=" + CStr(lID) + ""
'If objSTDMSProject.STDProjTasks.Count > 0 Then
'    Set GetTaskFromID = objSTDMSProject.STDProjTasks.Item(1)
'Else
'    Set GetTaskFromID = Nothing
'End If
End Function

Public Sub CloseClass()
    Debug.Print "...Dummy CloseClass..." + vbCrLf
End Sub

Public Sub HideControls()
    Call TheControl.DoVerb(vbOLEHide)
    TheControl.Visible = False
    TheContainer.Visible = False
End Sub

Private Sub Command1_Click()
Dim OLE1 As Object
Dim kc As Object
    b_inLoad = True
    pbInfo.Visible = True
    If pbInfo.Visible = False Then Exit Sub
    
    Set kc = ParentForm.ParentForm.Controls.Add("VB.FRAME", "FRAME_MSPRJEXTENDER")
    Set TheContainer = kc
    TheContainer.Top = CurrentTop
    TheContainer.Left = CurrentLeft
    TheContainer.Width = CurrentWidth
    TheContainer.Height = CurrentHeight
    Set OLE1 = ParentForm.ParentForm.Controls.Add("VB.OLE", "MSPRJEXTENDER")
    Set OLE1.Container = kc
    Set OleEventer = OLE1
    On Error Resume Next
    OLE1.CreateEmbed "", "MSProject.Project"
    If Err.Number <> 0 Then
        Label1.Visible = True
        pbInfo.Visible = False
    End If
    On Error GoTo 0
    
    Set objMSProject = OLE1.object
    Set objAPP = objMSProject.Application
    OLE1.Action = 7



    TheContainer.Top = CurrentTop
    TheContainer.Left = CurrentLeft
    TheContainer.Width = 1 'CurrentWidth
    TheContainer.Height = 1 'CurrentHeight

    OLE1.Top = 0
    OLE1.Left = 0
    OLE1.Width = 1 'CurrentWidth
    OLE1.Height = 1 'CurrentHeight
    'AutoActivate
    'DataChanged
    
    'OLE1.Move 0, 0, CurrentWidth, CurrentHeight


    
    'DoEvents
    'TheContainer.Visible = False
    'TheControl.Visible = False
    MousePointer = vbHourglass
    
    OLE1.Visible = True
    TheContainer.Visible = True
'
    Set TheControl = OLE1
    TheControl.Visible = True
    TheContainer.ZOrder
'
'    OLE1.object.Application.ScreenUpdating = False
'    DoEvents
    Call LoadMSPData
'    OLE1.object.Application.ScreenUpdating = True
    MousePointer = 0
    
    'TheControl.SizeMode = 3
    
    TheContainer.Visible = True
    TheControl.Visible = True
    OLE1.Visible = True
    
        If objMSProject.Tasks.Count = 0 Then
            TheControl.Visible = False
            TheControl.Visible = True
        End If
    
    OnTabClick
    DoEvents
    b_inLoad = False
    
    
End Sub

Private Sub OleEventer_Updated(Code As Integer)
    If Not b_inLoad Then
        m_Changed = True
    End If
    
End Sub

Private Sub UserControl_Initialize()
    UserControl_Resize
End Sub

Private Function ParseAndCall(ByRef objObject, ByVal CallString) As Variant
Dim tmpObj As Object
Dim v
Dim i As Long
    If Left(CallString, 1) = "." Then
        CallString = Right(CallString, Len(CallString) - 1)
    End If
    If InStr(CallString, ".") > 0 Then
        v = Split(CallString, ".")
        For i = LBound(v) To i = UBound(v) - 1
            Set tmpObj = CallByName(objObject, CStr(v(i)), VbGet, Nothing)
        Next
        ParseAndCall = CallByName(objObject, CStr(v(UBound(v))), VbGet, Nothing)
    Else
        ParseAndCall = CallByName(objObject, CallString, VbGet)
    End If
End Function

Public Sub OnInit(aItem As Object, ConfigObjectID As String, Optional pForm As Object = Nothing)
Dim i As Long
    Set Manager = aItem.Application.Manager
    Set ParentForm = pForm
    On Error Resume Next
    Dim objRS As Object
    'Set objRS = Manager.ListInstances(Manager.GetSession.Site, "STDMSProject")
    Set objRS = Manager.GetSession.GetData("select * from STDProjectInfo where ParentDocument='" + aItem.Application.ID + "'")
    If Not objRS Is Nothing Then
        If Not objRS.EOF And Not objRS.bof Then
            Set objSTDMSProject = Manager.GetInstanceObject(objRS.Fields("InstanceID"))
        End If
    End If
    
    If objSTDMSProject Is Nothing Then
    
        Dim ID As String
        Dim sName As String
        ID = CreateGUID2
        sName = "MSProject - " + aItem.Application.Name
        If sName = "" Then
            sName = "MSProject"
        End If
        If Manager.NewInstance(ID, "STDMSProject", sName) Then
            Set objSTDMSProject = Manager.GetInstanceObject(ID)
            Dim c As Object
            'Set c = Manager.GetInstanceObject(ID)
            objSTDMSProject.STDProjectInfo.Add
            Set objSTDMSProject.STDProjectInfo.Item(1).ParentDocument = Item.Application
            objSTDMSProject.STDProjectInfo.Item(1).Save
        End If
    End If
    
    'Set objSTDMSProject.STDProjectInfo.Item(1).ParentDocument = aItem.Application
    'objSTDMSProject.STDProjectInfo.Item(1).Save
    
    Set Item = aItem
   
    
   
End Sub

Private Sub UserControl_Resize()
    'test
End Sub

Private Sub UserControl_Terminate()
On Error Resume Next
    TheControl.Action = 9 'Close object
    Set objMSProject = Nothing
    Set objSTDMSProject = Nothing
    
End Sub
