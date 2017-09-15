Attribute VB_Name = "GridAndTree"
Option Explicit

Public Sub MakeGridAndTree(pctl As ControlData, p As PART, Child As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(Child, mode)
  AllowEdit = AllowEditPart(Child, mode)
  AllowDel = AllowDeleteFromPart(Child, mode)
  
  Dim lctl As ControlData
  Dim rctl As ControlData
  Set lctl = MakeGridAnd(pctl, p, mode, body, tsClick, tsInit)
  
  Set rctl = pctl.ControlData.Add()
  rctl.name = "tree" & Child.name
  rctl.ProgID = "mscomctllib.treeview"
  AddProp rctl, "Name", rctl.name
  AddProp rctl, "LabelEdit", 1
  AddProp rctl, "LineStyle", 1
  AddProp rctl, "Sorted", True
  AddProp rctl, "Indentation", 75
  AddProp rctl, "HideSelection", False
  
  SlaveTreeButtons pctl, rctl, p, Child, mode, body, tsClick, tsInit
  tsInit = tsInit & vbCrLf & " " & Child.name & "_reinit"
  tsClick = tsClick & vbCrLf & " " & Child.name & "_reinit"
  
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
  body = body & vbCrLf & "   cmd" & Child.name & "Acc.Left = Left+130* Screen.TwipsPerPixelX"
  
  body = body & vbCrLf & "   cmd" & Child.name & "Addroot.top = top +2 *Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Add.top = top +2 *Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Edit.top = top +2 *Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Del.top = top +2 *Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Ref.top = top +2 *Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Acc.top = top +2 *Screen.TwipsPerPixelY"
  
  body = body & vbCrLf & "End Sub"
  
'  body = body & vbCrLf & "Public Function IsOK() as BooLEAN"
'    body = body & vbCrLf & "        IsOK=TRUE"
'    body = body & vbCrLf & "End Function"
  body = body & vbCrLf & "Private Sub " & rctl.name & "_DblClick()"
  body = body & vbCrLf & "If " & rctl.name & ".SelectedItem Is Nothing Then Exit Sub"
  If AllowEdit Then
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
  
    
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Add_Click()"
  body = body & vbCrLf & "  on error resume next"
    If AllowAdd Then
      body = body & vbCrLf & "Dim f As Object, p As Object"
      body = body & vbCrLf & "If (" & rctl.name & ".SelectedItem is Nothing) Then  exit sub"
      body = body & vbCrLf & "  Set p = Item.FindRowObject(""" & Child.name & """, Left(" & rctl.name & ".SelectedItem.Key, 38))"
      body = body & vbCrLf & "  Set f = p." & Child.name & ".Add()"
      
      'Defaults
      body = body & vbCrLf & MakeDefaultCode(Child, "f")
      If Child.AddBehaivor = PartAddBehaivor_AddForm Then
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
      
      If Child.AddBehaivor = PartAddBehaivor_RefreshOnly Then
      
        ' Oncreate
        If Not Child.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " f"
        End If
        body = body & vbCrLf & "          If " & rctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & rctl.name & ", " & rctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & rctl.name & ".SelectedItem = " & rctl.name & ".nodes.item(  f.ID & """ & Child.name & """)"
      End If 'RefreshOnly
      
      
      If Child.AddBehaivor = PartAddBehaivor_RunAction Then
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

    End If ' AllowADD
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    
    'ADDROOT '''''''''''''''''''''''''''
    body = body & vbCrLf & "Private Sub cmd" & Child.name & "AddRoot_Click()"
    body = body & vbCrLf & "  on error resume next"
    
    
    If AllowAdd Then
      body = body & vbCrLf & "If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
      body = body & vbCrLf & "  Dim gu As Object"
      body = body & vbCrLf & "  Dim f As Object, p As Object"
      body = body & vbCrLf & "  Dim bm"
    
      body = body & vbCrLf & "  bm = " & lctl.name & ".RowBookmark(" & lctl.name & ".RowIndex(" & lctl.name & ".Row))"
      body = body & vbCrLf & "  Set p = Item.FindRowObject(Right(bm, len(bm)-38), Left(bm, 38))"
      body = body & vbCrLf & "  Set f = p." & Child.name & ".Add()"
      
      'Defaults
      body = body & vbCrLf & MakeDefaultCode(Child, "f")
      
      If Child.AddBehaivor = PartAddBehaivor_AddForm Then
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
        
        body = body & vbCrLf & "          Item." & Child.name & ".refresh"
        body = body & vbCrLf & "          " & rctl.name & ".nodes.clear"
        body = body & vbCrLf & "          Item." & Child.name & ".filltree " & rctl.name
        body = body & vbCrLf & "      Else"
        body = body & vbCrLf & "        Item." & p.name & ".Remove f.ID"
        body = body & vbCrLf & "      End If"
        
      End If  'AddForm
      
      If Child.AddBehaivor = PartAddBehaivor_RefreshOnly Then
      
        ' Oncreate
        If Not Child.OnCreate Is Nothing Then
          body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " f"
        End If
        
        body = body & vbCrLf & "          If " & rctl.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
        body = body & vbCrLf & "            f.LoadToTree " & rctl.name & ", " & rctl.name & ".SelectedItem.Key"
        body = body & vbCrLf & "          end if"
        body = body & vbCrLf & "          set " & rctl.name & ".SelectedItem = " & rctl.name & ".nodes.item(  f.ID & """ & Child.name & """)"
      End If 'RefreshOnly
      
      
      If Child.AddBehaivor = PartAddBehaivor_RunAction Then
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

    End If ' AllowADD

    
    ' on create
    If Not Child.OnCreate Is Nothing Then
      body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " p"
    End If

    body = body & vbCrLf & "    p.LoadToTree " & rctl.name & ", """
    body = body & vbCrLf & "    Set p = Nothing"
    body = body & vbCrLf & "    Set gu = Nothing"
    body = body & vbCrLf & "Exit Sub"
    body = body & vbCrLf & "bye:"
    body = body & vbCrLf & "MsgBox Err.Description,vbokonly+vbExclamation,""Создание"""
    body = body & vbCrLf & "  Set gu = Nothing"
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    
    
    'EDIT ''''''''''''''''''''''''
    body = body & vbCrLf & "Private Sub cmd" & Child.name & "Edit_Click()"
    body = body & vbCrLf & "  on error resume next"
    If AllowEdit Then
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
      ' on save
      If Not Child.OnSave Is Nothing Then
        body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnSave.name & "_" & mode & " f"
      End If
      
      body = body & vbCrLf & "  End If"
    End If 'AllowEdit
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    body = body & vbCrLf & "Private Sub cmd" & Child.name & "Del_Click()"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  Dim f As Object"
    body = body & vbCrLf & "  If " & rctl.name & ".SelectedItem Is Nothing Then Exit Sub"
    body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & Child.name & """, Left(" & rctl.name & ".SelectedItem.Key, 38))"
    body = body & vbCrLf & "  If MsgBox(""Удалить элемент"" & vbCrLf & f.Brief & vbCrLf & ""?"", vbYesNo + vbQuestion, ""Внимание"") = vbYes Then"
    body = body & vbCrLf & "  on error goto bye"
    body = body & vbCrLf & "     if f.Parent.Delete( f.ID) then"
    body = body & vbCrLf & "       " & rctl.name & ".Nodes.Remove " & rctl.name & ".SelectedItem.Key"
    body = body & vbCrLf & "     End If"
    body = body & vbCrLf & "  End If"
    body = body & vbCrLf & " exit sub"
    body = body & vbCrLf & " bye:"
    body = body & vbCrLf & " msgbox err.description,vbokonly+vbExclamation,""Удаление"""
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    body = body & vbCrLf & "Private Sub cmd" & Child.name & "Acc_Click()"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  Dim f As Object"
    body = body & vbCrLf & "  If " & rctl.name & ".SelectedItem Is Nothing Then Exit Sub"
    body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & Child.name & """, Left(" & rctl.name & ".SelectedItem.Key, 38))"
    body = body & vbCrLf & "  item.application.manager.ShowSecurityDialog f"
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
    
    body = body & vbCrLf & "Private Sub cmd" & Child.name & "REf_Click()"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  " & Child.name & "_reinit"
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
  
  're initilize child grid on move
    body = body & vbCrLf & "Private Sub " & lctl.name & "_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)"
    body = body & vbCrLf & " ON ERROR RESUME NEXT"
    body = body & vbCrLf & "If LastRow <> " & lctl.name & ".Row And LastRow > 0 Then"
    body = body & vbCrLf & "  " & lctl.name & ".GetRowData(LastRow).RowStyle = ""Default"""
    body = body & vbCrLf & "  " & lctl.name & ".GetRowData(" & lctl.name & ".Row).RowStyle = ""SelectedRow"""
    body = body & vbCrLf & "End If"
    body = body & vbCrLf & "  " & Child.name & "_reinit"
    body = body & vbCrLf & "End Sub"
  
    body = body & vbCrLf & "Private Sub " & Child.name & "_reinit()"
    body = body & vbCrLf & "  If " & lctl.name & ".ItemCount = 0 Then "
    body = body & vbCrLf & "    " & rctl.name & ".nodes.clear"
    body = body & vbCrLf & "  else"
    body = body & vbCrLf & "    Dim gu As Object"
    body = body & vbCrLf & "    Dim bm"
    body = body & vbCrLf & "    bm = " & lctl.name & ".RowBookmark(" & lctl.name & ".RowIndex(" & lctl.name & ".Row))"
    body = body & vbCrLf & "    Set gu = Item.FindRowObject(Right(bm, len(bm)-38), Left(bm, 38))"
    body = body & vbCrLf & "    if gu is nothing then exit sub"
    body = body & vbCrLf & "    gu." & Child.name & ".refresh"
    body = body & vbCrLf & "    " & rctl.name & ".nodes.clear"
    body = body & vbCrLf & "    gu." & Child.name & ".filltree " & rctl.name
    body = body & vbCrLf & "  end if"
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
End Sub
  
