Attribute VB_Name = "TreeButtons"
Option Explicit

Public Sub MasterTreeButtons(pctl As ControlData, lctl As ControlData, p As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(p, mode)
  AllowEdit = AllowEditPart(p, mode)
  AllowDel = AllowDeleteFromPart(p, mode)
  
  On Error GoTo bye
  Dim btn As ControlData
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "AddRoot"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "NEWROOT.ico"
  AddProp btn, "ToolTipText", "Добавить ветку"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 5 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowAdd
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Add"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "NEW.ico"
  AddProp btn, "ToolTipText", "Добавить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 30 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowAdd
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Edit"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "PROP.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Свойства"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 55 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowEdit
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Del"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "DELETE.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Удалить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 80 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowDel
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Ref"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "Refresh.ico"
  AddProp btn, "ToolTipText", "Обновить"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 105 * Screen.TwipsPerPixelY
  
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Acc"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "security.ico"
  AddProp btn, "ToolTipText", "Стиль защиты"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 130 * Screen.TwipsPerPixelY
  
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "AddRoot,cmd" & p.name & "AddRoot.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Add,cmd" & p.name & "Add.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Edit,cmd" & p.name & "Edit.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Del,cmd" & p.name & "Del.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Ref,cmd" & p.name & "Ref.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Acc,cmd" & p.name & "Acc.tag"
 
  tsInit = tsInit & vbCrLf & "Item." & p.name & ".filltree " & lctl.name
 
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Add_Click()"
  body = body & vbCrLf & "  on error resume next"
  If AllowAdd Then
      body = body & vbCrLf & "  on error resume next"
      body = body & vbCrLf & "  Dim f As Object, p As Object"
      body = body & vbCrLf & "If (" & lctl.name & ".SelectedItem is Nothing) Then  exit sub"
      body = body & vbCrLf & "  Set p = Item.FindRowObject(""" & p.name & """, Left(" & lctl.name & ".SelectedItem.Key, 38))"
      body = body & vbCrLf & "  Set f = p." & p.name & ".Add()"
      
      'Defaults
      body = body & vbCrLf & MakeDefaultCode(p, "f")
      
      If p.AddBehaivor = PartAddBehaivor_AddForm Then
      
          body = body & vbCrLf & "      Set frm" & p.name & "_" & mode & ".Item = f"
          body = body & vbCrLf & "      again: frm" & p.name & "_" & mode & ".NotFirstTime = False"
          body = body & vbCrLf & "      frm" & p.name & "_" & mode & ".OnInit"
          body = body & vbCrLf & "      frm" & p.name & "_" & mode & ".Show vbModal"
          body = body & vbCrLf & "      If frm" & p.name & "_" & mode & ".OK Then"
          body = body & vbCrLf & "        err.clear"
          body = body & vbCrLf & "        f.save"
          body = body & vbCrLf & "        if err.number <>0 then "
          body = body & vbCrLf & "          msgbox err.description,vbokonly+vbExclamation,""Создание"""
          body = body & vbCrLf & "          goto again"
          body = body & vbCrLf & "        end if "
        
        ' Oncreate
        If Not p.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & p.name & "_" & p.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "          If " & lctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & lctl.name & ", " & lctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & lctl.name & ".SelectedItem = " & lctl.name & ".nodes.item(  f.ID & """ & p.name & """)"
        body = body & vbCrLf & "      Else"
        body = body & vbCrLf & "        Item." & p.name & ".Delete f.ID"
        body = body & vbCrLf & "        Item." & p.name & ".Remove f.ID"
        body = body & vbCrLf & "      End If"
        
      End If  'AddForm
      
      If p.AddBehaivor = PartAddBehaivor_RefreshOnly Then
      
        ' Oncreate
        If Not p.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & p.name & "_" & p.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "          If " & lctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & lctl.name & ", " & lctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & lctl.name & ".SelectedItem = " & lctl.name & ".nodes.item(  f.ID & """ & p.name & """)"
      End If 'RefreshOnly
      
      
      If p.AddBehaivor = PartAddBehaivor_RunAction Then
      ' Oncreate
        If Not p.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & p.name & "_" & p.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "          If " & lctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & lctl.name & ", " & lctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & lctl.name & ".SelectedItem = " & lctl.name & ".nodes.item(  f.ID & """ & p.name & """)"
        body = body & vbCrLf & "        cmd" & p.name & "Run_click"
      End If 'RunAction
    
    End If 'AlloAdd
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    body = body & vbCrLf & "Private Sub cmd" & p.name & "AddRoot_Click()"
    body = body & vbCrLf & "  on error resume next"
    If AllowAdd Then
      
      body = body & vbCrLf & "Dim f As Object, p As Object"
      body = body & vbCrLf & "  Set f = Item." & p.name & ".Add()"
      
      'Defaults
      body = body & vbCrLf & MakeDefaultCode(p, "f")
      
      If p.AddBehaivor = PartAddBehaivor_AddForm Then
      
          body = body & vbCrLf & "      Set frm" & p.name & "_" & mode & ".Item = f"
          body = body & vbCrLf & "      again: frm" & p.name & "_" & mode & ".NotFirstTime = False"
          body = body & vbCrLf & "      frm" & p.name & "_" & mode & ".OnInit"
          body = body & vbCrLf & "      frm" & p.name & "_" & mode & ".Show vbModal"
          body = body & vbCrLf & "      If frm" & p.name & "_" & mode & ".OK Then"
          body = body & vbCrLf & "        err.clear"
          body = body & vbCrLf & "        f.save"
          body = body & vbCrLf & "        if err.number <>0 then "
          body = body & vbCrLf & "          msgbox err.description,vbokonly+vbExclamation,""Создание"""
          body = body & vbCrLf & "          goto again"
          body = body & vbCrLf & "        end if "
        
        ' Oncreate
        If Not p.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & p.name & "_" & p.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "    Item." & p.name & ".refresh"
        body = body & vbCrLf & "    " & lctl.name & ".nodes.clear"
        body = body & vbCrLf & "    Item." & p.name & ".filltree " & lctl.name
        
        body = body & vbCrLf & "          set " & lctl.name & ".SelectedItem = " & lctl.name & ".nodes.item(  f.ID & """ & p.name & """)"
        body = body & vbCrLf & "      Else"
        body = body & vbCrLf & "        Item." & p.name & ".Remove f.ID"
        body = body & vbCrLf & "      End If"
        
      End If  'AddForm
      
      If p.AddBehaivor = PartAddBehaivor_RefreshOnly Then
      
        ' Oncreate
        If Not p.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & p.name & "_" & p.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "  Item." & p.name & ".refresh"
        body = body & vbCrLf & "  " & lctl.name & ".nodes.clear"
        body = body & vbCrLf & "  Item." & p.name & ".filltree " & lctl.name

        body = body & vbCrLf & "          set " & lctl.name & ".SelectedItem = " & lctl.name & ".nodes.item(  f.ID & """ & p.name & """)"
      End If 'RefreshOnly
      
      
      If p.AddBehaivor = PartAddBehaivor_RunAction Then
      ' Oncreate
        If Not p.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & p.name & "_" & p.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "    Item." & p.name & ".refresh"
        body = body & vbCrLf & "    " & lctl.name & ".nodes.clear"
        body = body & vbCrLf & "    Item." & p.name & ".filltree " & lctl.name
        body = body & vbCrLf & "    set " & lctl.name & ".SelectedItem = " & lctl.name & ".nodes.item(  f.ID & """ & p.name & """)"
        body = body & vbCrLf & "    cmd" & p.name & "Run_click"
      End If 'RunAction
    
    End If 'AlloAdd
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    body = body & vbCrLf & "Private Sub cmd" & p.name & "Edit_Click()"
    body = body & vbCrLf & "  on error resume next"
    If AllowEdit Then
      body = body & vbCrLf & "  Dim f As Object"
      body = body & vbCrLf & "  If " & lctl.name & ".SelectedItem Is Nothing Then Exit Sub"
      body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & p.name & """, Left(" & lctl.name & ".SelectedItem.Key, 38))"
      body = body & vbCrLf & "  Set frm" & p.name & "_" & mode & ".Item = f"
      body = body & vbCrLf & "  again: frm" & p.name & "_" & mode & ".NotFirstTime = False"
      body = body & vbCrLf & "  frm" & p.name & "_" & mode & ".OnInit"
      body = body & vbCrLf & "  frm" & p.name & "_" & mode & ".Show vbModal"
      body = body & vbCrLf & "  If frm" & p.name & "_" & mode & ".OK Then"
      body = body & vbCrLf & "    err.clear"
      body = body & vbCrLf & "    f.save"
      body = body & vbCrLf & "    if err.number <>0 then "
      body = body & vbCrLf & "      msgbox err.description,vbokonly+vbExclamation,""Изменение"""
      body = body & vbCrLf & "      goto again"
      body = body & vbCrLf & "    end if "
      body = body & vbCrLf & "  End If"
    End If 'AllowEdit
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    body = body & vbCrLf & "Private Sub cmd" & p.name & "Del_Click()"
    body = body & vbCrLf & "  on error resume next"
    If AllowDel Then
      body = body & vbCrLf & "  Dim f As Object"
      body = body & vbCrLf & "  If " & lctl.name & ".SelectedItem Is Nothing Then Exit Sub"
      body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & p.name & """, Left(" & lctl.name & ".SelectedItem.Key, 38))"
      body = body & vbCrLf & "  If MsgBox(""Удалить элемент"" & vbCrLf & f.Brief & vbCrLf & ""?"", vbYesNo + vbQuestion, ""Внимание"") = vbYes Then"
      body = body & vbCrLf & "  on error goto bye"
      body = body & vbCrLf & "     if f.Parent.Delete( f.ID) then"
      body = body & vbCrLf & "       " & lctl.name & ".Nodes.Remove " & lctl.name & ".SelectedItem.Key"
      body = body & vbCrLf & "     End If"
      body = body & vbCrLf & "  End If"
      body = body & vbCrLf & "Exit Sub"
      body = body & vbCrLf & "bye:"
      body = body & vbCrLf & "msgbox err.description,vbokonly+vbExclamation,""Удаление"""
    End If 'AllowDel
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    
    body = body & vbCrLf & "Private Sub cmd" & p.name & "Acc_Click()"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  Dim f As Object"
    body = body & vbCrLf & "  If " & lctl.name & ".SelectedItem Is Nothing Then Exit Sub"
    body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & p.name & """, Left(" & lctl.name & ".SelectedItem.Key, 38))"
    body = body & vbCrLf & "  item.application.manager.ShowSecurityDialog f"
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    body = body & vbCrLf & "Private Sub cmd" & p.name & "REf_Click()"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  Item." & p.name & ".refresh"
    body = body & vbCrLf & "  " & lctl.name & ".nodes.clear"
    body = body & vbCrLf & "  Item." & p.name & ".filltree " & lctl.name
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    Exit Sub
bye:
    Stop
    Resume
  
End Sub


Public Sub SlaveTreeButtons(pctl As ControlData, rctl As ControlData, p As PART, Child As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(Child, mode)
  AllowEdit = AllowEditPart(Child, mode)
  AllowDel = AllowDeleteFromPart(Child, mode)
  
  
  Dim btn As ControlData
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "AddRoot"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "NEWROOT.ico"
  AddProp btn, "ToolTipText", "Добавить ветку"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 5 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowAdd
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Add"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "NEW.ico"
  AddProp btn, "ToolTipText", "Добавить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 30 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowAdd
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Edit"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "PROP.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Свойства"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 55 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowEdit
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Del"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "DELETE.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Удалить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 80 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowDel
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Ref"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "Refresh.ico"
  AddProp btn, "ToolTipText", "Обновить"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 105 * Screen.TwipsPerPixelY
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Acc"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "security.ico"
  AddProp btn, "ToolTipText", "Стиль защиты"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 130 * Screen.TwipsPerPixelY
  
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "AddRoot,cmd" & Child.name & "AddRoot.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Add,cmd" & Child.name & "Add.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Edit,cmd" & Child.name & "Edit.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Del,cmd" & Child.name & "Del.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Ref,cmd" & Child.name & "Ref.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Acc,cmd" & Child.name & "Acc.tag"
  
End Sub
