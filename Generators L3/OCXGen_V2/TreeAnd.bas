Attribute VB_Name = "TreeAnd"
Option Explicit

Public Function MakeTreeAnd(pctl As ControlData, p As PART, mode As String, body As String, tsClick As String, tsInit As String) As ControlData
  Dim lctl As ControlData
  Set lctl = pctl.ControlData.Add()
  lctl.name = "tree" & p.name
  lctl.ProgID = "mscomctllib.treeview"
  AddProp lctl, "Name", lctl.name
  AddProp lctl, "LabelEdit", 1
  AddProp lctl, "LineStyle", 1
  AddProp lctl, "Indentation", 75
  AddProp lctl, "Sorted", True
  AddProp lctl, "HideSelection", False
  
  MasterTreeButtons pctl, lctl, p, mode, body, tsClick, tsInit
  
  
  body = body & vbCrLf & "Private Sub " & lctl.name & "_DblClick()"
  body = body & vbCrLf & "If " & lctl.name & ".SelectedItem Is Nothing Then Exit Sub"
  If p.OnRun Is Nothing Then
      body = body & vbCrLf & "  cmd" & p.name & "Edit_Click"
  Else
    body = body & vbCrLf & "  Dim f As Object"
    body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & p.name & """, Left(" & lctl.name & ".SelectedItem.Key, 38))"
    body = body & vbCrLf & "  Set frm" & p.name & "_" & mode & ".Item = f"
    body = body & vbCrLf & "  again: frm" & p.name & "_" & mode & ".NotFirstTime = False"
    body = body & vbCrLf & "  frm" & p.name & "_" & mode & ".OnInit"
    body = body & vbCrLf & "  frm" & p.name & "_" & mode & ".Show vbModal"
    body = body & vbCrLf & "  If frm" & p.name & "_" & mode & ".OK Then"
    body = body & vbCrLf & "    on error resume next"
    body = body & vbCrLf & "    err.clear"
    body = body & vbCrLf & "    f.save"
    body = body & vbCrLf & "    if err.number <>0 then "
    body = body & vbCrLf & "      msgbox err.description,vbokonly+vbExclamation,""Изменение"""
    body = body & vbCrLf & "      goto again"
    body = body & vbCrLf & "    end if "
    body = body & vbCrLf & "    " & lctl.name & ".SelectedItem.Text = f.Brief(true)"
    body = body & vbCrLf & "    else"
    body = body & vbCrLf & "     f.refresh"
    body = body & vbCrLf & "  End If"
  End If
  
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Public Function IsOK() as BooLEAN"
    body = body & vbCrLf & "        IsOK=TRUE"
    body = body & vbCrLf & "End Function"
  
  body = body & vbCrLf & ""
  body = body & vbCrLf & "Private Sub " & lctl.name & "_Expand(ByVal Node As MSComctlLib.Node)"
  body = body & vbCrLf & "If Node.Child.Tag = ""ToDelete"" Then"
  body = body & vbCrLf & " parentform.mousepointer = vbHourglass"
  body = body & vbCrLf & " " & lctl.name & ".Nodes.Remove Node.Child.Index"
  body = body & vbCrLf & " Dim f As Object"
  body = body & vbCrLf & " Set f = Item.FindRowObject(""" & p.name & """, Left(Node.Key, 38))"
  body = body & vbCrLf & " f.expandpart " & lctl.name & ", Node.Key"
  body = body & vbCrLf & " parentform.mousepointer = vbNormal"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & " set " & lctl.name & ".SelectedItem = Node"
  body = body & vbCrLf & " " & lctl.name & "_NodeClick Node"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
  body = body & vbCrLf & "Private Sub " & lctl.name & "_Collapse(ByVal Node As MSComctlLib.Node)"
  body = body & vbCrLf & " set " & lctl.name & ".SelectedItem = Node"
  body = body & vbCrLf & " " & lctl.name & "_NodeClick Node"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
      
    
    body = body & vbCrLf & "Private Sub " & pctl.name & "_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  " & lctl.name & ".Left = Left"
    body = body & vbCrLf & "  " & lctl.name & ".Top = Top + 25 * Screen.TwipsPerPixelY"
    body = body & vbCrLf & "  " & lctl.name & ".Width = Width"
    body = body & vbCrLf & "  " & lctl.name & ".Height = Height-  25 * Screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "AddRoot.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Add.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Edit.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Del.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Ref.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Acc.top=top+ 2 * screen.TwipsPerPixelY"
    
    body = body & vbCrLf & "   cmd" & p.name & "AddRoot.Left = Left +5 * Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & p.name & "Add.Left = Left +30* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & p.name & "Edit.Left = Left+55* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & p.name & "Del.Left = Left+80* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & p.name & "Ref.Left = Left+105* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & p.name & "Acc.Left = Left+130* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "End Sub"
    
    
  
   Set MakeTreeAnd = lctl
End Function
