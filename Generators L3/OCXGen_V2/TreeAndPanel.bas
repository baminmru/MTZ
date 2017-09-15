Attribute VB_Name = "TreeAndPanel"
Option Explicit

Public Sub MakeTreeAndPanel(pctl As ControlData, ot As OBJECTTYPE, p As PART, Child As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(Child, mode)
  AllowEdit = AllowEditPart(Child, mode)
  AllowDel = AllowDeleteFromPart(Child, mode)
  
  
  Dim lctl As ControlData
  Dim rctl As ControlData
  Set lctl = MakeTreeAnd(pctl, p, mode, body, tsClick, tsInit)
    Set rctl = pctl.ControlData.Add()
  rctl.name = "edit" & Child.name
  rctl.ProgID = ot.name & "GUI." & Child.name & mode
  AddProp rctl, "Name", rctl.name
  
  Dim btn As ControlData
  Set btn = pctl.ControlData.Add()
  btn.ProgID = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Save"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "SAVE.ico"
  AddProp btn, "ToolTipText", "Сохранить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 5 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", False
  
  Set btn = pctl.ControlData.Add()
  btn.ProgID = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Del"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "DELETE.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Удалить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 30 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  
  Set btn = pctl.ControlData.Add()
  btn.ProgID = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Add"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "NEW.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Создать"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 55 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowAdd
  
  
  body = body & vbCrLf & "Private Sub " & pctl.name & "_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)"
  body = body & vbCrLf & "   on error resume next"
  body = body & vbCrLf & "  " & rctl.name & ".Left = Left"
  body = body & vbCrLf & "  " & rctl.name & ".Top = Top + 25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "  " & rctl.name & ".Width = Width"
  body = body & vbCrLf & "  " & rctl.name & ".Height = Height-  25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Save.Left = Left +5 *Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Del.Left =Left +30* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Add.Left = Left+55* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Add.top=top+ 2 * screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Save.top=top+ 2 * screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Del.top=top+ 2 * screen.TwipsPerPixelY"
  
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & ""
  body = body & vbCrLf & "Private Sub " & Child.name & "_Reinit"
  body = body & vbCrLf & "  Dim p As Object"
  body = body & vbCrLf & "  Dim u As Object"
  body = body & vbCrLf & "  IF " & lctl.name & ".selecteditem is nothing then"
  body = body & vbCrLf & "    Set " & rctl.name & ".Item = nothing"
  body = body & vbCrLf & "    " & rctl.name & ".Enabled = false"
  body = body & vbCrLf & "    cmd" & Child.name & "Del.Enabled = false"
  body = body & vbCrLf & "    cmd" & Child.name & "Save.Enabled = false"
  body = body & vbCrLf & "    cmd" & Child.name & "Add.Enabled = false"
  body = body & vbCrLf & "  else"
  body = body & vbCrLf & "    Set p = Item.FindRowObject(""" & p.name & """, Left(" & lctl.name & ".SELECTEDITEM.Key, 38))"
  body = body & vbCrLf & "    p." & Child.name & ".REFRESH "
  body = body & vbCrLf & "   If P." & Child.name & ".Count = 0 Then"
  body = body & vbCrLf & "     set u=P." & Child.name & ".Add"
  
  'Defaults
  body = body & vbCrLf & MakeDefaultCode(Child, "u")
  
  body = body & vbCrLf & "   End If"
  body = body & vbCrLf & "   Set " & rctl.name & ".Item = P." & Child.name & ".Item(1)"
  body = body & vbCrLf & "   " & rctl.name & ".InitPanel"
  body = body & vbCrLf & "   cmd" & Child.name & "Del.Enabled = true"
  body = body & vbCrLf & "   cmd" & Child.name & "Save.Enabled = false"
  body = body & vbCrLf & "   cmd" & Child.name & "Add.Enabled = false"
  body = body & vbCrLf & "   " & rctl.name & ".Enabled = true"
  body = body & vbCrLf & " END if"
  body = body & vbCrLf & " END SUB"
  body = body & vbCrLf & ""
  
  
  body = body & vbCrLf & "Private Sub " & lctl.name & "_NodeClick(ByVal Node As MSComctlLib.Node)"
  body = body & vbCrLf & "  " & Child.name & "_Reinit"
  body = body & vbCrLf & "End Sub"
    
  
  body = body & vbCrLf & "Private Sub " & rctl.name & "_Changed()"
  body = body & vbCrLf & " cmd" & Child.name & "Save.Enabled = true"
  body = body & vbCrLf & "End Sub"

    body = body & vbCrLf & "Public Function IsOK() as BooLEAN"
    body = body & vbCrLf & "    if " & rctl.name & ".IsOK then"
    body = body & vbCrLf & "        IsOK=TRUE"
    body = body & vbCrLf & "    end if"
    body = body & vbCrLf & "End Function"

  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Save_Click()"
  body = body & vbCrLf & "  on error goto bye"
  If AllowEdit Then
    body = body & vbCrLf & "    if " & rctl.name & ".IsOK  then"
    body = body & vbCrLf & "    MousePointer = vbHourglass"
    body = body & vbCrLf & "    " & rctl.name & ".Save"
    body = body & vbCrLf & "    " & rctl.name & ".item.Save"
    body = body & vbCrLf & "    MousePointer = vbNormal"
    
     ' on save
    If Not Child.OnSave Is Nothing Then
      body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnSave.name & "_" & mode & " " & rctl.name & ".item"
    End If
    
    body = body & vbCrLf & "    cmd" & Child.name & "Save.Enabled = false"
    body = body & vbCrLf & "    else"
    body = body & vbCrLf & "      MsgBox ""Не все обязательные поля заполнены"",vbOKOnly+VBExclamation"
    body = body & vbCrLf & "    end if"
    body = body & vbCrLf & " bye:"
  End If
  body = body & vbCrLf & "End Sub"
  
  
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Del_Click()"
  body = body & vbCrLf & "  on error resume next"
  If AllowDel Then
    body = body & vbCrLf & "  if  " & rctl.name & ".item is nothing then exit sub"
    body = body & vbCrLf & "  If MsgBox(""Удалить элемент"" & vbCrLf & " & rctl.name & ".item.Brief & vbcrlf & ""?"", vbYesNo + vbQuestion, ""Внимание"") = vbYes Then"
    body = body & vbCrLf & "  on error goto bye"
    body = body & vbCrLf & "    " & rctl.name & ".item.parent.Delete " & rctl.name & ".item.id"
    body = body & vbCrLf & "    cmd" & Child.name & "Del.Enabled = false"
    body = body & vbCrLf & "    cmd" & Child.name & "Save.Enabled = false"
    body = body & vbCrLf & "    cmd" & Child.name & "Add.Enabled = true"
    body = body & vbCrLf & "    " & rctl.name & ".Enabled = false"
    body = body & vbCrLf & "    set " & rctl.name & ".item = nothing"
    body = body & vbCrLf & "  End If"
    body = body & vbCrLf & "Exit Sub"
    body = body & vbCrLf & "bye:"
    body = body & vbCrLf & "msgbox err.description,vbokonly+vbExclamation,""Удаление"""
  End If
  body = body & vbCrLf & "End Sub"


  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Add_Click()"
  body = body & vbCrLf & "  on error resume next"
  If AllowAdd Then
    body = body & vbCrLf & "  " & Child.name & "_Reinit"
  End If
  body = body & vbCrLf & "End Sub"

  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Save,cmd" & Child.name & "Save.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Del,cmd" & Child.name & "Del.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Add,cmd" & Child.name & "Add.tag"
  
  tsInit = tsInit & vbCrLf & "  " & Child.name & "_reinit"
End Sub

