Attribute VB_Name = "SingleTree"
Option Explicit

Sub MakeSingleTree(pctl As ControlData, p As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(p, mode)
  AllowEdit = AllowEditPart(p, mode)
  AllowDel = AllowDeleteFromPart(p, mode)


' tree level 1
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  Dim lctl As ControlData
  Set lctl = pctl.ControlData.Add()
  lctl.name = "tree" & p.name
  lctl.ProgID = "mscomctllib.treeview"
  AddProp lctl, "Name", lctl.name
  AddProp lctl, "LabelEdit", 1
  AddProp lctl, "LineStyle", 1
  AddProp lctl, "Sorted", True
  AddProp lctl, "Indentation", 75
  AddProp lctl, "HideSelection", False
  AddProp lctl, "Left", 15 * Screen.TwipsPerPixelX
  AddProp lctl, "Top", 40 * Screen.TwipsPerPixelX
   
  MasterTreeButtons pctl, lctl, p, mode, body, tsClick, tsInit
  
  tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Top = 40 * Screen.TwipsPerPixelX"
  tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Left = 5 * Screen.TwipsPerPixelX"
  tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Width = usercontrol.Width - 10 * Screen.TwipsPerPixelX"
  tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Height = usercontrol.Height - 45 * Screen.TwipsPerPixelY"
  
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
  
  body = body & vbCrLf & "Private Sub " & lctl.name & "_Expand(ByVal Node As MSComctlLib.Node)"
  body = body & vbCrLf & "If Node.Child.Tag = ""ToDelete"" Then"
  body = body & vbCrLf & " parentform.mousepointer = vbHourglass"
  body = body & vbCrLf & " " & lctl.name & ".Nodes.Remove Node.Child.Index"
  body = body & vbCrLf & " Dim f As Object"
  body = body & vbCrLf & " Set f = Item.FindRowObject(""" & p.name & """, Left(Node.Key, 38))"
  body = body & vbCrLf & " f.expandpart " & lctl.name & ", Node.Key"
  body = body & vbCrLf & " parentform.mousepointer = vbNormal"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
    
        
End Sub
