Attribute VB_Name = "PanelAnd"
Option Explicit

Public Function MakePanelAnd(pctl As ControlData, ot As OBJECTTYPE, p As PART, Child As PART, mode As String, body As String, tsClick As String, tsInit As String) As ControlData
    Dim AllowEdit As Boolean
    Dim AllowAdd As Boolean
    Dim AllowDel As Boolean
    AllowAdd = AllowAddToPart(p, mode)
    AllowEdit = AllowEditPart(p, mode)
    AllowDel = AllowDeleteFromPart(p, mode)

Dim leftSave As Long
Dim leftRefresh As Long
Dim leftConfig As Long
    
    leftSave = 5 * Screen.TwipsPerPixelY
    leftRefresh = 5 * Screen.TwipsPerPixelY
    leftConfig = 5 * Screen.TwipsPerPixelY
    
    If SinglePanelSettings.AllowRefreshButton And _
       SinglePanelSettings.AllowSaveButton Then
        leftRefresh = 30 * Screen.TwipsPerPixelY
    End If
    
    If SinglePanelSettings.AllowSaveButton = False And _
       SinglePanelSettings.AllowRefreshButton And _
       SinglePanelSettings.AllowConfigButton Then
        leftConfig = 30 * Screen.TwipsPerPixelY
    ElseIf SinglePanelSettings.AllowSaveButton And _
       SinglePanelSettings.AllowRefreshButton And _
       SinglePanelSettings.AllowConfigButton Then
        leftConfig = 55 * Screen.TwipsPerPixelY
    End If
    
    Dim lctl As ControlData
    Set lctl = pctl.ControlData.Add()
    lctl.name = "edit" & p.name
    lctl.ProgID = ot.name & "GUI." & p.name & mode
    AddProp lctl, "Name", lctl.name
    
    Dim btn As ControlData
    Set btn = pctl.ControlData.Add()
    btn.ProgID = "VB.CommandButton"
    btn.name = "cmd" & p.name & "Save"
    AddProp btn, "Name", btn.name
    AddProp btn, "Caption", ""
    AddProp btn, "Tag", "SAVE.ico"
    AddProp btn, "ToolTipText", "Сохранить"
    AddProp btn, "Style", 1
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", leftSave '5 * Screen.TwipsPerPixelY
    AddProp btn, "UseMaskColor", True
    AddProp btn, "Enabled", False
    AddProp btn, "Visible", SinglePanelSettings.AllowSaveButton
    
'    Set btn = pctl.ControlData.Add()
'    btn.ProgId = "VB.CommandButton"
'    btn.name = "cmd" & p.name & "Del"
'    AddProp btn, "Name", btn.name
'    AddProp btn, "Tag", "DELETE.ico"
'    AddProp btn, "Caption", ""
'    AddProp btn, "ToolTipText", "Удалить"
'    AddProp btn, "Style", 1
'    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
'    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
'    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
'    AddProp btn, "Left", 30 * Screen.TwipsPerPixelY
'    AddProp btn, "UseMaskColor", True
'    AddProp btn, "Enabled", AllowDel
'
'    Set btn = pctl.ControlData.Add()
'    btn.ProgId = "VB.CommandButton"
'    btn.name = "cmd" & p.name & "Add"
'    AddProp btn, "Name", btn.name
'    AddProp btn, "Tag", "New.ico"
'    AddProp btn, "Caption", ""
'    AddProp btn, "ToolTipText", "Создать"
'    AddProp btn, "Style", 1
'    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
'    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
'    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
'    AddProp btn, "Left", 55 * Screen.TwipsPerPixelY
'    AddProp btn, "UseMaskColor", True
'    AddProp btn, "Enabled", False
        
    Set btn = pctl.ControlData.Add()
    btn.ProgID = "VB.CommandButton"
    btn.name = "cmd" & p.name & "Ref"
    AddProp btn, "Name", btn.name
    AddProp btn, "Tag", "Refresh.ico"
    AddProp btn, "Caption", ""
    AddProp btn, "ToolTipText", "Обновить"
    AddProp btn, "Style", 1
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", leftRefresh '30 * Screen.TwipsPerPixelY
    AddProp btn, "UseMaskColor", True
    AddProp btn, "Enabled", True
    AddProp btn, "Visible", SinglePanelSettings.AllowRefreshButton
    
    Set btn = pctl.ControlData.Add()
    btn.ProgID = "VB.CommandButton"
    btn.name = "cmd" & p.name & "Cfg"
    AddProp btn, "Name", btn.name
    AddProp btn, "Caption", ""
    AddProp btn, "Tag", "config.ico"
    AddProp btn, "ToolTipText", "Настройка внешнего вида"
    AddProp btn, "Style", 1
    AddProp btn, "UseMaskColor", True
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", leftConfig '55 * Screen.TwipsPerPixelY
    AddProp btn, "Visible", SinglePanelSettings.AllowConfigButton
    
    
    body = body & vbCrLf & "Private Sub cmd" & p.name & "Ref_Click()"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  Item." & p.name & ".Refresh"
    body = body & vbCrLf & "  cmd" & p.name & "Add_Click"
    body = body & vbCrLf & "End Sub"
    
    
    body = body & vbCrLf & "Private Sub cmd" & p.name & "Add_Click()"
    body = body & vbCrLf & "  on error resume next"
    If AllowAdd Then
      body = body & vbCrLf & " If Item." & p.name & ".Count = 0 Then"
      body = body & vbCrLf & "   Item." & p.name & ".Add"
      body = body & vbCrLf & " End If"
    End If
    body = body & vbCrLf & " Set " & lctl.name & ".Item = Item." & p.name & ".Item(1)"
    body = body & vbCrLf & " " & lctl.name & ".InitPanel"
    'body = body & vbCrLf & " cmd" & p.name & "Del.Enabled = " & AllowDel
    body = body & vbCrLf & " cmd" & p.name & "Save.Enabled = " & AllowEdit
    'body = body & vbCrLf & " cmd" & p.name & "Add.Enabled = false"
    body = body & vbCrLf & " " & Child.name & "_reinit"
    body = body & vbCrLf & "End Sub"
    
    
    body = body & vbCrLf & "Private Sub cmd" & p.name & "Del_Click()"
    body = body & vbCrLf & "  on error resume next"
    If AllowDel Then
      body = body & vbCrLf & "  if  " & lctl.name & ".item is nothing then exit sub"
      body = body & vbCrLf & "  If MsgBox(""Удалить элемент"" & vbCrLf & " & lctl.name & ".item.Brief & vbcrlf & ""?"", vbYesNo + vbQuestion, ""Внимание"") = vbYes Then"
      body = body & vbCrLf & "    on error goto bye"
      body = body & vbCrLf & "    " & lctl.name & ".item.parent.Delete " & lctl.name & ".item.id"
      'body = body & vbCrLf & "    cmd" & p.name & "Del.Enabled = " & AllowDel
      body = body & vbCrLf & "    cmd" & p.name & "Save.Enabled = " & AllowEdit
      body = body & vbCrLf & "    " & lctl.name & ".Enabled = false"
      body = body & vbCrLf & "    set " & lctl.name & ".item = nothing"
      'body = body & vbCrLf & "    cmd" & p.name & "Add.Enabled = " & AllowAdd
      body = body & vbCrLf & " " & Child.name & "_reinit"
      body = body & vbCrLf & "  End If"
      body = body & vbCrLf & "  Exit Sub"
      body = body & vbCrLf & "bye:"
      body = body & vbCrLf & "  MsgBox err.description,vbokonly+vbExclamation,""Удаление"""
    End If 'AllowDel
    body = body & vbCrLf & "End Sub"
    
    
    body = body & vbCrLf & "Private Sub " & lctl.name & "_Changed()"
    body = body & vbCrLf & " cmd" & p.name & "Save.Enabled = true"
    body = body & vbCrLf & "End Sub"
  
    body = body & vbCrLf & "Private Sub cmd" & p.name & "Cfg_Click()"
    body = body & vbCrLf & "    on error resume next "
    body = body & vbCrLf & "    " & lctl.name & ".Customize"
    body = body & vbCrLf & "    dim ff as long "
    body = body & vbCrLf & "    ff = FreeFile"
    body = body & vbCrLf & "    Open GetSetting(""MTZ"", ""CONFIG"", ""LAYOUTS"", App.Path & ""\LAYOUTS\"") & """ & ot.name & "_" & lctl.name & "_" & mode & """ For Output As #ff"
    body = body & vbCrLf & "    print #ff, " & lctl.name & ".PanelCustomisationString"
    body = body & vbCrLf & "    Close #ff"
    body = body & vbCrLf & "End Sub"
  
  
    body = body & vbCrLf & "Public Function IsOK() as BooLEAN"
    body = body & vbCrLf & "    if " & lctl.name & ".IsOK then"
    body = body & vbCrLf & "        IsOK=TRUE"
    body = body & vbCrLf & "    end if"
    body = body & vbCrLf & "End Function"
  
  '''''''''''''''' save
    body = body & vbCrLf & "Private Sub cmd" & p.name & "Save_Click()"
    body = body & vbCrLf & "  on error resume next"
    If AllowEdit Then
      body = body & vbCrLf & "    if " & lctl.name & ".IsOK then"
      body = body & vbCrLf & "    MousePointer = vbHourglass"
      body = body & vbCrLf & "    " & lctl.name & ".Save"
      body = body & vbCrLf & "  on error goto bye"
      body = body & vbCrLf & "    " & lctl.name & ".item.Save"
      body = body & vbCrLf & "    MousePointer = vbNormal"
      body = body & vbCrLf & "    cmd" & p.name & "Save.Enabled = false"
      
       ' OnSave
      If Not p.OnSave Is Nothing Then
        body = body & vbCrLf & "        op" & p.name & "_" & p.OnSave.name & "_" & mode & " u"
      End If
      
      body = body & vbCrLf & "    else"
      body = body & vbCrLf & "      MsgBox ""Не все обязательные поля заполнены"",vbOKOnly+VBExclamation"
      body = body & vbCrLf & "      Exit Sub"
      body = body & vbCrLf & "    end if"
      
      body = body & vbCrLf & "   Exit Sub"
      body = body & vbCrLf & "bye:"
      body = body & vbCrLf & "  MsgBox err.description,vbokonly+vbExclamation,""Изменение"""
      body = body & vbCrLf & "  " & lctl.name & ".item.REFRESH"
      body = body & vbCrLf & "  " & lctl.name & ".InitPanel"
    End If 'AllowEdit
    body = body & vbCrLf & "End Sub"

    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Save,cmd" & p.name & "Save.tag"
    'tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Del,cmd" & p.name & "Del.tag"
    'tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Add,cmd" & p.name & "Add.tag"
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Ref,cmd" & p.name & "Ref.tag"
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Cfg,cmd" & p.name & "Cfg.tag"
    
    body = body & vbCrLf & "Private Sub " & pctl.name & "_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  " & lctl.name & ".Left = Left"
    body = body & vbCrLf & "  " & lctl.name & ".Top = Top + 25 * Screen.TwipsPerPixelY"
    body = body & vbCrLf & "  " & lctl.name & ".Width = Width"
    body = body & vbCrLf & "  " & lctl.name & ".Height = Height -25 * Screen.TwipsPerPixelY "
    body = body & vbCrLf & "   cmd" & p.name & "Save.top=top+ 2 * screen.TwipsPerPixelY"
    'body = body & vbCrLf & "   cmd" & p.name & "Del.top=top+ 2 * screen.TwipsPerPixelY"
    'body = body & vbCrLf & "   cmd" & p.name & "Add.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Ref.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Cfg.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Save.Left = Left +5 * screen.TwipsPerPixelX "
    'body = body & vbCrLf & "   cmd" & p.name & "Del.Left = Left +30* Screen.TwipsPerPixelX"
    'body = body & vbCrLf & "   cmd" & p.name & "Add.Left = Left+55* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & p.name & "Ref.Left = Left+30* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & p.name & "Cfg.Left = Left+55* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "End Sub"
    
    tsInit = tsInit & vbCrLf & "  dim ff as long, buf as string"
    tsInit = tsInit & vbCrLf & "  ff = FreeFile"
    tsInit = tsInit & vbCrLf & "  On Error Resume Next"
    tsInit = tsInit & vbCrLf & "  Open GetSetting(""MTZ"", ""CONFIG"", ""LAYOUTS"", App.Path & ""c:\LAYOUTS\"") & """ & ot.name & "_" & lctl.name & "_" & mode & """ For Input As #ff"
    tsInit = tsInit & vbCrLf & "  buf = """""
    tsInit = tsInit & vbCrLf & "  buf = Input(LOF(ff), ff)"
    tsInit = tsInit & vbCrLf & "  Close #ff"
    tsInit = tsInit & vbCrLf & "  if buf <>"""" then " & lctl.name & ".PanelCustomisationString = buf"
    tsInit = tsInit & vbCrLf & " cmd" & p.name & "Add_click"
        
    Set MakePanelAnd = lctl
End Function
