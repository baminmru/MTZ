Attribute VB_Name = "SinglePanel"
Option Explicit

Sub MakeSinglePanel(prj As String, pctl As ControlData, ot As MTZFltr.Application, p As MTZFltr.FilterFieldGroup, body As String, tsClick As String, tsInit As String)
    Dim lctl As ControlData
    
    Set lctl = pctl.ControlData.Add()
    lctl.name = "edit" & p.name
    lctl.ProgId = prj & ".pnl" & ot.Filters.Item(1).name & "_" & p.name
    AddProp lctl, "Name", lctl.name
    
    Dim btn As ControlData
       
    Set btn = pctl.ControlData.Add()
    btn.ProgId = "VB.CommandButton"
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
    AddProp btn, "Left", 5 * Screen.TwipsPerPixelY
       
    
    body = body & vbCrLf & "Private Sub cmd" & p.name & "Cfg_Click()"
    body = body & vbCrLf & "    on error resume next "
    body = body & vbCrLf & "    " & lctl.name & ".Customize"
    body = body & vbCrLf & "    dim ff as long "
    body = body & vbCrLf & "    ff = FreeFile"
    body = body & vbCrLf & "    Open GetSetting(""MTZ"", ""CONFIG"", ""LAYOUTS"", ""c:\"") & """ & ot.name & "_" & lctl.name & """ For Output As #ff"
    body = body & vbCrLf & "    print #ff, " & lctl.name & ".PanelCustomisationString"
    body = body & vbCrLf & "    Close #ff"
    body = body & vbCrLf & "End Sub"
    
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Cfg,cmd" & p.name & "Cfg.tag"
    
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Top = 40 * Screen.TwipsPerPixelX"
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Left = 5 * Screen.TwipsPerPixelX"
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Width = usercontrol.Width - 10 * Screen.TwipsPerPixelX"
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Height = usercontrol.Height - 45 * Screen.TwipsPerPixelY"
    
    tsInit = tsInit & vbCrLf & "  dim ff as long, buf as string"
    tsInit = tsInit & vbCrLf & "  ff = FreeFile"
    tsInit = tsInit & vbCrLf & "  On Error Resume Next"
    tsInit = tsInit & vbCrLf & "  Open GetSetting(""MTZ"", ""CONFIG"", ""LAYOUTS"", ""c:\"") & """ & ot.name & "_" & lctl.name & """ For Input As #ff"
    tsInit = tsInit & vbCrLf & "  buf = """""
    tsInit = tsInit & vbCrLf & "  buf = Input(LOF(ff), ff)"
    tsInit = tsInit & vbCrLf & "  Close #ff"
    tsInit = tsInit & vbCrLf & "  if buf <>"""" then " & lctl.name & ".PanelCustomisationString = buf"
    tsInit = tsInit & vbCrLf & "  set " & lctl.name & ".Item = item"
    tsInit = tsInit & vbCrLf & "  " & lctl.name & ".InitPanel"
   
End Sub
