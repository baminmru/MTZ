Attribute VB_Name = "SingleExtender"
Option Explicit

Sub MakeSingleExtender(pctl As ControlData, ot As OBJECTTYPE, p As PART, mode As String, body As String, tsClick As String, tsInit As String)
    Dim lctl As ControlData
    Dim AllowEdit As Boolean
    Dim AllowAdd As Boolean
    Dim AllowDel As Boolean
    Dim sctlExtenderName As String
    Dim i As Long
    AllowAdd = AllowAddToPart(p, mode)
    AllowEdit = AllowEditPart(p, mode)
    AllowDel = AllowDeleteFromPart(p, mode)
    
    Set lctl = pctl.ControlData.Add()
    lctl.name = "edit" & p.name
    p.ExtenderInterface.Filter = "TargetPlatform='" + LastTID + "'"
    If p.ExtenderInterface.Count <= 0 Then
        Exit Sub
    Else
        sctlExtenderName = p.ExtenderInterface.item(1).TheObject
    End If
    
    lctl.ProgID = sctlExtenderName 'ot.name & "GUI." & p.name & mode
    AddProp lctl, "Name", lctl.name
    
    tsInit = vbCrLf + "" + lctl.name + ".TargetPlatformID = """ + LastTID + """" + vbCrLf
    
    If Not p.ExtenderObject Is Nothing Then
       tsInit = tsInit + "Call " + lctl.name + ".OnInit(Item,""" + p.ExtenderObject.ID + """, Me)" + vbCrLf
    Else
      tsInit = tsInit + "Call " + lctl.name + ".OnInit(Item,"""", Me)" + vbCrLf
    End If
    
    tsClick = vbCrLf + "edit" + p.name + ".Move 0, 0, UserControl.Width, UserControl.Height" + vbCrLf
    tsClick = tsClick + "edit" + p.name + ".OnTabClick" + vbCrLf
    
'''    Dim btn As ControlData
'''    Set btn = pctl.ControlData.Add()
'''    btn.ProgId = "VB.CommandButton"
'''    btn.name = "cmd" & p.name & "Save"
'''    AddProp btn, "Name", btn.name
'''    AddProp btn, "Caption", ""
'''    AddProp btn, "Tag", "SAVE.ico"
'''    AddProp btn, "ToolTipText", "Сохранить"
'''    AddProp btn, "Style", 1
'''    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
'''    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
'''    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
'''    AddProp btn, "Left", 5 * Screen.TwipsPerPixelY
'''    AddProp btn, "UseMaskColor", True
'''    AddProp btn, "Enabled", False
    
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
    
    
'''    Set btn = pctl.ControlData.Add()
'''    btn.ProgId = "VB.CommandButton"
'''    btn.name = "cmd" & p.name & "Ref"
'''    AddProp btn, "Name", btn.name
'''    AddProp btn, "Tag", "Refresh.ico"
'''    AddProp btn, "Caption", ""
'''    AddProp btn, "ToolTipText", "Обновить"
'''    AddProp btn, "Style", 1
'''    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
'''    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
'''    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
'''    AddProp btn, "Left", 30 * Screen.TwipsPerPixelY
'''    AddProp btn, "UseMaskColor", True
'''    AddProp btn, "Enabled", True
    
'''    Set btn = pctl.ControlData.Add()
'''    btn.ProgId = "VB.CommandButton"
'''    btn.name = "cmd" & p.name & "Cfg"
'''    AddProp btn, "Name", btn.name
'''    AddProp btn, "Caption", ""
'''    AddProp btn, "Tag", "config.ico"
'''    AddProp btn, "ToolTipText", "Настройка внешнего вида"
'''    AddProp btn, "Style", 1
'''    AddProp btn, "UseMaskColor", True
'''    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
'''    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
'''    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
'''    AddProp btn, "Left", 55 * Screen.TwipsPerPixelY
    
    

   

    
'''    body = body & vbCrLf & "Private Sub cmd" & p.name & "Ref_Click()"
'''    body = body & vbCrLf & "  on error resume next"
'''    body = body & vbCrLf & "  Item." & p.name & ".Refresh"
'''    body = body & vbCrLf & "  cmd" & p.name & "Add_Click"
'''    body = body & vbCrLf & "End Sub"
'''
'''    body = body & vbCrLf & "Private Sub cmd" & p.name & "Cfg_Click()"
'''    body = body & vbCrLf & "    on error resume next "
'''    body = body & vbCrLf & "    " & lctl.name & ".Customize"
'''    body = body & vbCrLf & "    dim ff as long "
'''    body = body & vbCrLf & "    ff = FreeFile"
'''    body = body & vbCrLf & "    Open GetSetting(""MTZ"", ""CONFIG"", ""LAYOUTS"", ""c:\"") & """ & ot.name & "_" & lctl.name & "_" & mode & """ For Output As #ff"
'''    body = body & vbCrLf & "    print #ff, " & lctl.name & ".PanelCustomisationString"
'''    body = body & vbCrLf & "    Close #ff"
'''    body = body & vbCrLf & "End Sub"
    
    
'''    body = body & vbCrLf & "Private Sub cmd" & p.name & "Add_Click()"
'''    body = body & vbCrLf & "  on error resume next"
'''    If AllowAdd Then
'''      body = body & vbCrLf & " dim u as object"
'''      body = body & vbCrLf & " If Item." & p.name & ".Count = 0 Then"
'''      body = body & vbCrLf & "   set u=Item." & p.name & ".Add"
'''
'''      'Defaults
'''      body = body & vbCrLf & MakeDefaultCode(p, "u")
'''      body = body & vbCrLf & " End If"
'''    End If
'''
'''    body = body & vbCrLf & " Set " & lctl.name & ".Item = Item." & p.name & ".Item(1)"
'''    body = body & vbCrLf & " " & lctl.name & ".InitPanel"
'''
'''    'body = body & vbCrLf & " cmd" & p.name & "Del.Enabled = " & AllowDel
'''    body = body & vbCrLf & " cmd" & p.name & "Save.Enabled = " & AllowEdit
'''    'body = body & vbCrLf & " cmd" & p.name & "Add.Enabled = " & AllowAdd
'''    body = body & vbCrLf & "End Sub"
    
    
'''    body = body & vbCrLf & "Private Sub cmd" & p.name & "Del_Click()"
'''    body = body & vbCrLf & "  on error resume next"
'''    If AllowDel Then
'''      body = body & vbCrLf & "  if  " & lctl.name & ".item is nothing then exit sub"
'''      body = body & vbCrLf & "  If MsgBox(""Удалить элемент"" & vbCrLf & " & lctl.name & ".item.Brief & vbcrlf & ""?"", vbYesNo + vbQuestion, ""Внимание"") = vbYes Then"
'''      body = body & vbCrLf & "    on error goto bye"
'''
'''      ' on Delete
'''      If Not p.OnDelete Is Nothing Then
'''        body = body & vbCrLf & "        op" & p.name & "_" & p.OnDelete.name & "_" & mode & " " & lctl.name & ".item"
'''      End If
'''
'''      body = body & vbCrLf & "    " & lctl.name & ".item.parent.Delete " & lctl.name & ".item.id"
'''      'body = body & vbCrLf & "    cmd" & p.name & "Del.Enabled = false"
'''      body = body & vbCrLf & "    cmd" & p.name & "Save.Enabled = false"
'''      body = body & vbCrLf & "    " & lctl.name & ".Enabled = false"
'''      body = body & vbCrLf & "    set " & lctl.name & ".item = nothing"
'''      'body = body & vbCrLf & "    cmd" & p.name & "Add.Enabled = true"
'''      body = body & vbCrLf & "  End If"
'''      body = body & vbCrLf & "Exit Sub"
'''      body = body & vbCrLf & "bye:"
'''      body = body & vbCrLf & "msgbox err.description,vbokonly+vbExclamation,""Удаление"""
'''    End If 'AllowDEL
'''    body = body & vbCrLf & "End Sub"

    
    body = body & vbCrLf & "Private Sub " & lctl.name & "_Changed()"
'''    body = body & vbCrLf & " cmd" & p.name & "Save.Enabled = true"
    body = body & vbCrLf & "End Sub"
    
    body = body & vbCrLf & "Public Function IsOK() as BooLEAN"
    body = body & vbCrLf & "        IsOK=TRUE"
    body = body & vbCrLf & "End Function"
    
body = body & vbCrLf & ""
body = body & vbCrLf & "Public Sub SetSize(lTop As Long, lLeft As Long, lWidth As Long, lHeight As Long)"
body = body & vbCrLf & "    On Error Resume Next"
body = body & vbCrLf & "    " + "edit" + p.name + ".CurrentTop = lTop"
body = body & vbCrLf & "    " + "edit" + p.name + ".CurrentLeft = lLeft"
body = body & vbCrLf & "    " + "edit" + p.name + ".CurrentHeight = lHeight"
body = body & vbCrLf & "    " + "edit" + p.name + ".CurrentWidth = lWidth"
body = body & vbCrLf & "End Sub"
body = body & vbCrLf & ""
body = body & vbCrLf & "Public Sub HideControls()"
body = body & vbCrLf & "    On Error Resume Next"
body = body & vbCrLf & "    " + "edit" + p.name + ".HideControls"
body = body & vbCrLf & "End Sub"
body = body & vbCrLf & ""
    
  ''''''''''''''''''' save
'''    body = body & vbCrLf & "Private Sub cmd" & p.name & "Save_Click()"
'''    body = body & vbCrLf & "  on error resume next"
'''    If AllowEdit Then
'''      body = body & vbCrLf & "    if " & lctl.name & ".IsOK then"
'''
'''      body = body & vbCrLf & "    " & lctl.name & ".Save"
'''
'''      body = body & vbCrLf & "  on error goto bye"
'''      body = body & vbCrLf & "    " & lctl.name & ".item.Save"
'''
'''      ' on save
'''      If Not p.OnSave Is Nothing Then
'''        body = body & vbCrLf & "        op" & p.name & "_" & p.OnSave.name & "_" & mode & " " & lctl.name & ".item"
'''      End If
'''      body = body & vbCrLf & "    cmd" & p.name & "Save.Enabled = false"
'''      body = body & vbCrLf & "    else"
'''      body = body & vbCrLf & "      MsgBox ""Не все обязательные поля заполнены"",vbOKOnly+VBExclamation"
'''      body = body & vbCrLf & "    end if"
'''
'''      body = body & vbCrLf & "Exit Sub"
'''      body = body & vbCrLf & "bye:"
'''      body = body & vbCrLf & "   MsgBox Err.Description, vbOKOnly + vbExclamation, ""Изменение"""
'''      body = body & vbCrLf & "  " & lctl.name & ".item.REFRESH"
'''      body = body & vbCrLf & "  " & lctl.name & ".InitPanel"
'''    End If
'''    body = body & vbCrLf & "End Sub"

'''    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Save,cmd" & p.name & "Save.tag"
'''    'tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Del,cmd" & p.name & "Del.tag"
'''    'tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Add,cmd" & p.name & "Add.tag"
'''    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Ref,cmd" & p.name & "Ref.tag"
'''    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Cfg,cmd" & p.name & "Cfg.tag"
    
'''    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Top = 40 * Screen.TwipsPerPixelX"
'''    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Left = 5 * Screen.TwipsPerPixelX"
'''    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Width = usercontrol.Width - 10 * Screen.TwipsPerPixelX"
'''    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Height = usercontrol.Height - 45 * Screen.TwipsPerPixelY"
'''
'''    tsInit = tsInit & vbCrLf & "  dim ff as long, buf as string"
'''    tsInit = tsInit & vbCrLf & "  ff = FreeFile"
'''    tsInit = tsInit & vbCrLf & "  On Error Resume Next"
'''    tsInit = tsInit & vbCrLf & "  Open GetSetting(""MTZ"", ""CONFIG"", ""LAYOUTS"", ""c:\"") & """ & ot.name & "_" & lctl.name & "_" & mode & """ For Input As #ff"
'''    tsInit = tsInit & vbCrLf & "  buf = """""
'''    tsInit = tsInit & vbCrLf & "  buf = Input(LOF(ff), ff)"
'''    tsInit = tsInit & vbCrLf & "  Close #ff"
'''    tsInit = tsInit & vbCrLf & "  if buf <>"""" then " & lctl.name & ".PanelCustomisationString = buf"
'''    tsInit = tsInit & vbCrLf & "  cmd" & p.name & "Add_click"
   
End Sub
