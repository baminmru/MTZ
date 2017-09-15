Attribute VB_Name = "PanelAndTree"
Option Explicit

Sub MakePanelAndTree(pctl As ControlData, ot As OBJECTTYPE, p As PART, Child As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(Child, mode)
  AllowEdit = AllowEditPart(Child, mode)
  AllowDel = AllowDeleteFromPart(Child, mode)
  
  Dim lctl As ControlData
  Dim rctl As ControlData
  Set lctl = MakePanelAnd(pctl, ot, p, Child, mode, body, tsClick, tsInit)
  
  
  Set rctl = pctl.ControlData.Add()
  rctl.name = "tree" & Child.name
  rctl.ProgId = "mscomctllib.treeview"
  AddProp rctl, "Name", rctl.name
  AddProp rctl, "LabelEdit", 1
  AddProp rctl, "LineStyle", 1
  AddProp rctl, "Sorted", True
  AddProp rctl, "Indentation", 75
  AddProp rctl, "HideSelection", False
  AddProp rctl, "Left", 15 * Screen.TwipsPerPixelX
  AddProp rctl, "Top", 25 * Screen.TwipsPerPixelY
  
  SlaveTreeButtons pctl, rctl, p, Child, mode, body, tsClick, tsInit
 
  body = body & vbCrLf & "Private Sub " & pctl.name & "_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)"
  body = body & vbCrLf & "   on error resume next"
  body = body & vbCrLf & "  " & rctl.name & ".Left = Left"
  body = body & vbCrLf & "  " & rctl.name & ".Top = Top + 25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "  " & rctl.name & ".Width = Width"
  body = body & vbCrLf & "  " & rctl.name & ".Height = Height-  25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Addroot.Left = Left +5 *Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Add.Left =Left +30* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Edit.Left = Left+55* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Del.Left = Left+80* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Ref.Left = Left+105* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Addroot.top = top +2 *Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Add.top = top +2 *Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Edit.top = top +2 *Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Del.top = top +2 *Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Ref.top = top +2 *Screen.TwipsPerPixelY"
  body = body & vbCrLf & "End Sub"
  
 
  tsClick = tsClick & vbCrLf & "      cmd" & Child.name & "Ref_Click"
  
  body = body & vbCrLf & ""
  body = body & vbCrLf & "Private Sub " & Child.name & "_Reinit"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "   cmd" & Child.name & "Ref_Click"
  body = body & vbCrLf & "End Sub"

  
  
  body = body & vbCrLf & "Private Sub " & rctl.name & "_DblClick()"
  body = body & vbCrLf & "  if " & lctl.name & ".Item is nothing then " & rctl.name & ".nodes.clear : exit sub"
  If AllowEdit Then
    body = body & vbCrLf & "If " & rctl.name & ".SelectedItem Is Nothing Then Exit Sub"
    body = body & vbCrLf & "  Dim f As Object"
    body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & Child.name & """, Left(" & rctl.name & ".SelectedItem.Key, 38))"
    body = body & vbCrLf & "  Set frm" & Child.name & "_" & mode & ".Item = f"
    body = body & vbCrLf & "  again: frm" & Child.name & "_" & mode & ".NotFirstTime = False"
    body = body & vbCrLf & "  frm" & Child.name & "_" & mode & ".OnInit"
    body = body & vbCrLf & "  frm" & Child.name & "_" & mode & ".Show vbModal"
    body = body & vbCrLf & "  If frm" & Child.name & "_" & mode & ".OK Then"
    body = body & vbCrLf & "    on error resume next"
    body = body & vbCrLf & "    err.clear"
    body = body & vbCrLf & "    f.save"
    body = body & vbCrLf & "    if err.number <>0 then "
    body = body & vbCrLf & "      msgbox err.description,vbokonly+vbExclamation,""Изменение"""
    body = body & vbCrLf & "      goto again"
    body = body & vbCrLf & "    end if "
    body = body & vbCrLf & "    " & rctl.name & ".SelectedItem.Text = f.Brief(true)"
    body = body & vbCrLf & "    else"
    body = body & vbCrLf & "     f.refresh"
    body = body & vbCrLf & "  End If"
  End If 'AllowEdit
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & ""
  body = body & vbCrLf & "Private Sub " & rctl.name & "_Expand(ByVal Node As MSComctlLib.Node)"
  body = body & vbCrLf & "  if " & lctl.name & ".Item is nothing then " & rctl.name & ".nodes.clear : exit sub"
  body = body & vbCrLf & "If Node.Child.Tag = ""ToDelete"" Then"
  body = body & vbCrLf & " parentform.mousepointer = vbHourglass"
  body = body & vbCrLf & " " & rctl.name & ".Nodes.Remove Node.Child.Index"
  body = body & vbCrLf & " Dim f As Object"
  body = body & vbCrLf & " Set f = Item.FindRowObject(""" & Child.name & """, Left(Node.Key, 38))"
  body = body & vbCrLf & " f.expandpart " & rctl.name & ", Node.Key"
  body = body & vbCrLf & " parentform.mousepointer = vbNormal"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
  'ADD '''''''''''''''''''''''''
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Add_Click()"
  body = body & vbCrLf & "  on error resume next"
  If AllowAdd Then
      body = body & vbCrLf & "  if " & lctl.name & ".Item is nothing then " & rctl.name & ".nodes.clear : exit sub"
      body = body & vbCrLf & "  " & lctl.name & ".item.save"
      body = body & vbCrLf & "  Dim f As Object, p As Object"
      body = body & vbCrLf & "  If (" & rctl.name & ".SelectedItem is Nothing) Then  exit sub"
      body = body & vbCrLf & "    Set p = Item.FindRowObject(""" & Child.name & """, Left(" & rctl.name & ".SelectedItem.Key, 38))"
      body = body & vbCrLf & "    Set f = p." & Child.name & ".Add()"
      
      'Defaults
      body = body & vbCrLf & MakeDefaultCode(Child, "f")
      
      If p.AddBehaivor = PartAddBehaivor_AddForm Then
    
        body = body & vbCrLf & "      Set frm" & Child.name & "_" & mode & ".Item = f"
        body = body & vbCrLf & "      again: frm" & Child.name & "_" & mode & ".NotFirstTime = False"
        body = body & vbCrLf & "      frm" & Child.name & "_" & mode & ".OnInit"
        body = body & vbCrLf & "      frm" & Child.name & "_" & mode & ".Show vbModal"
        body = body & vbCrLf & "      If frm" & Child.name & "_" & mode & ".OK Then"
        body = body & vbCrLf & "        err.clear"
        body = body & vbCrLf & "        f.save"
        body = body & vbCrLf & "        if err.number <>0 then "
        body = body & vbCrLf & "          msgbox err.description,vbokonly+vbExclamation,""Создание"""
        body = body & vbCrLf & "          goto again"
        body = body & vbCrLf & "        end if "
      
        ' Oncreate
        If Not Child.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "          If " & rctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & rctl.name & ", " & rctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & rctl.name & ".SelectedItem = " & rctl.name & ".nodes.item(  f.ID & """ & Child.name & """)"
        body = body & vbCrLf & "      Else"
        body = body & vbCrLf & "        p." & Child.name & ".Delete f.ID"
        body = body & vbCrLf & "        p." & Child.name & ".Remove f.ID"
        body = body & vbCrLf & "      End If"
      
      End If  'AddForm
      
      If p.AddBehaivor = PartAddBehaivor_RefreshOnly Then
      
        ' Oncreate
        If Not Child.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "          If " & rctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & rctl.name & ", " & rctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & rctl.name & ".SelectedItem = " & rctl.name & ".nodes.item(  f.ID & """ & Child.name & """)"
      End If 'RefreshOnly
      
      
      If p.AddBehaivor = PartAddBehaivor_RunAction Then
      ' Oncreate
        If Not Child.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "          If " & rctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & rctl.name & ", " & rctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & rctl.name & ".SelectedItem = " & rctl.name & ".nodes.item(  f.ID & """ & Child.name & """)"
        body = body & vbCrLf & "        cmd" & Child.name & "Run_click"
      End If 'RunAction
        
      body = body & vbCrLf & "bye:"
      
  
    End If 'AllowAdd
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    ' ADDROOT '''''''''''''''''''''''''''''''''''''
    body = body & vbCrLf & "Private Sub cmd" & Child.name & "AddRoot_Click()"
    body = body & vbCrLf & "  on error resume next"
    If AllowAdd Then
    
      body = body & vbCrLf & "  if " & lctl.name & ".Item is nothing then " & rctl.name & ".nodes.clear : exit sub"
      body = body & vbCrLf & "  " & lctl.name & ".item.save"
      body = body & vbCrLf & "  Dim f As Object, p As Object"
      body = body & vbCrLf & "  Set p = " & lctl.name & ".Item"
      body = body & vbCrLf & "  Set f = " & lctl.name & ".Item." & Child.name & ".Add()"
      
      'Defaults
      body = body & vbCrLf & MakeDefaultCode(Child, "f")
    
      
      If p.AddBehaivor = PartAddBehaivor_AddForm Then
    
        body = body & vbCrLf & "      Set frm" & Child.name & "_" & mode & ".Item = f"
        body = body & vbCrLf & "      again: frm" & Child.name & "_" & mode & ".NotFirstTime = False"
        body = body & vbCrLf & "      frm" & Child.name & "_" & mode & ".OnInit"
        body = body & vbCrLf & "      frm" & Child.name & "_" & mode & ".Show vbModal"
        body = body & vbCrLf & "      If frm" & Child.name & "_" & mode & ".OK Then"
        body = body & vbCrLf & "        err.clear"
        body = body & vbCrLf & "        f.save"
        body = body & vbCrLf & "        if err.number <>0 then "
        body = body & vbCrLf & "          msgbox err.description,vbokonly+vbExclamation,""Создание"""
        body = body & vbCrLf & "          goto again"
        body = body & vbCrLf & "        end if "
      
        ' Oncreate
        If Not Child.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "          If " & rctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & rctl.name & ", " & rctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & rctl.name & ".SelectedItem = " & rctl.name & ".nodes.item(  f.ID & """ & Child.name & """)"
        body = body & vbCrLf & "      Else"
        body = body & vbCrLf & "        p." & Child.name & ".Remove f.ID"
        body = body & vbCrLf & "      End If"
      
      End If  'AddForm
      
      If p.AddBehaivor = PartAddBehaivor_RefreshOnly Then
      
        ' Oncreate
        If Not Child.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "          If " & rctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & rctl.name & ", " & rctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & rctl.name & ".SelectedItem = " & rctl.name & ".nodes.item(  f.ID & """ & Child.name & """)"
      End If 'RefreshOnly
      
      
      If p.AddBehaivor = PartAddBehaivor_RunAction Then
      ' Oncreate
        If Not Child.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "          If " & rctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & rctl.name & ", " & rctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & rctl.name & ".SelectedItem = " & rctl.name & ".nodes.item(  f.ID & """ & Child.name & """)"
        body = body & vbCrLf & "        cmd" & Child.name & "Run_click"
      End If 'RunAction
        
      body = body & vbCrLf & "bye:"
    End If 'AllowADD
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    'EDIT ''''''''''''''''''''''''''''''
    body = body & vbCrLf & "Private Sub cmd" & Child.name & "Edit_Click()"
    body = body & vbCrLf & "  on error resume next"
    If AllowEdit Then
      body = body & vbCrLf & "  if " & lctl.name & ".Item is nothing then " & rctl.name & ".nodes.clear : exit sub"
      body = body & vbCrLf & "  Dim f As Object"
      body = body & vbCrLf & "  If " & rctl.name & ".SelectedItem Is Nothing Then Exit Sub"
      body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & Child.name & """, Left(" & rctl.name & ".SelectedItem.Key, 38))"
      body = body & vbCrLf & "  Set frm" & Child.name & "_" & mode & ".Item = f"
      body = body & vbCrLf & "  again: frm" & Child.name & "_" & mode & ".NotFirstTime = False"
      body = body & vbCrLf & "  frm" & Child.name & "_" & mode & ".OnInit"
      body = body & vbCrLf & "  frm" & Child.name & "_" & mode & ".Show vbModal"
      body = body & vbCrLf & "  If frm" & Child.name & "_" & mode & ".OK Then"
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
    
    body = body & vbCrLf & "Private Sub cmd" & Child.name & "Del_Click()"
    body = body & vbCrLf & "  on error resume next"
    If AllowDel Then
      body = body & vbCrLf & "  if " & lctl.name & ".Item is nothing then " & rctl.name & ".nodes.clear : exit sub"
      body = body & vbCrLf & "  Dim f As Object"
      body = body & vbCrLf & "  If " & rctl.name & ".SelectedItem Is Nothing Then Exit Sub"
      body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & Child.name & """, Left(" & rctl.name & ".SelectedItem.Key, 38))"
      body = body & vbCrLf & "  If MsgBox(""Удалить элемент"" & vbCrLf & f.Brief & vbCrLf & ""?"", vbYesNo + vbQuestion, ""Внимание"") = vbYes Then"
      body = body & vbCrLf & "  on error goto bye"
      body = body & vbCrLf & "     if f.Parent.Delete( f.ID) then"
      body = body & vbCrLf & "       " & rctl.name & ".Nodes.Remove " & rctl.name & ".SelectedItem.Key"
      body = body & vbCrLf & "     End If"
      body = body & vbCrLf & "  End If"
      body = body & vbCrLf & "exit sub"
      body = body & vbCrLf & "bye:"
      body = body & vbCrLf & " MsgBox Err.description,vbokonly+vbExclamation,""Удаление"""
    End If 'AllowEdit
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    
    body = body & vbCrLf & "Private Sub cmd" & Child.name & "Acc_Click()"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  if " & lctl.name & ".Item is nothing then " & rctl.name & ".nodes.clear : exit sub"
    body = body & vbCrLf & "  Dim f As Object"
    body = body & vbCrLf & "  If " & rctl.name & ".SelectedItem Is Nothing Then Exit Sub"
    body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & Child.name & """, Left(" & rctl.name & ".SelectedItem.Key, 38))"
    body = body & vbCrLf & "  item.Application.Manager.ShowSecurityDialog f"
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    
    
    body = body & vbCrLf & "Private Sub cmd" & Child.name & "REf_Click()"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  if " & lctl.name & ".Item is nothing then " & rctl.name & ".nodes.clear : exit sub"
    body = body & vbCrLf & "  " & lctl.name & ".Item." & Child.name & ".refresh"
    body = body & vbCrLf & "  " & rctl.name & ".nodes.clear"
    body = body & vbCrLf & "  " & lctl.name & ".Item." & Child.name & ".filltree " & rctl.name
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""

    
End Sub
  
