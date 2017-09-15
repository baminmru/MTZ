Attribute VB_Name = "ComplexTree"
Option Explicit

Sub MakeComplexTree(pctl As ControlData, P As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim lctl As ControlData
  Dim rctl As ControlData
  Set lctl = pctl.ControlData.Add()
  lctl.name = "tree" & P.name
  lctl.ProgID = "mscomctllib.treeview"
  AddProp lctl, "Name", lctl.name
  AddProp lctl, "LabelEdit", 1
  AddProp lctl, "LineStyle", 1
  AddProp lctl, "Sorted", True
  AddProp lctl, "Indentation", 75
  AddProp lctl, "HideSelection", False
  
  tsInit = tsInit & vbCrLf & "item.FillTree " & lctl.name & ","""",""" & mode & """,""" & P.name & """"
  
  Set rctl = pctl.ControlData.Add()
  rctl.name = "grid" & P.name
  rctl.ProgID = "GridEx20.GridEX"   ' .ProgId = "GridEx20.GridEX"
  AddProp rctl, "Name", rctl.name
  AddProp rctl, "DataMode", 99
  AddProp rctl, "AllowEdit", False
  AddProp rctl, "AllowAddNew", False
  AddProp rctl, "AllowDelete", True
  AddProp rctl, "ColumnAutoResize", False
  AddProp rctl, "AutomaticSort", True
  AddProp rctl, "RecordNavigator", False
  AddProp rctl, "SelectionStyle", 1
  AddProp rctl, "HideSelection", 2
  AddProp rctl, "TabKeyBehavior", 1
  AddProp rctl, "RecordNavigatorString", "Запись:|из"
  AddProp rctl, "GroupByBoxInfoText", "Группировка"
  AddProp rctl, "ItemCount", 0
  
  ComplexGridButtons True, pctl, rctl, P, mode, body, tsClick, tsInit
  
  
  body = body & vbCrLf & "Private Sub " & pctl.name & "_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  " & lctl.name & ".Left = Left"
  body = body & vbCrLf & "  " & lctl.name & ".Top = Top + 25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "  " & lctl.name & ".Width = Width"
  body = body & vbCrLf & "  " & lctl.name & ".Height = Height-  25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub " & pctl.name & "_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)"
  body = body & vbCrLf & "   on error resume next"
  body = body & vbCrLf & "  " & rctl.name & ".Left = Left"
  body = body & vbCrLf & "  " & rctl.name & ".Top = Top + 25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "  " & rctl.name & ".Width = Width"
  body = body & vbCrLf & "  " & rctl.name & ".Height = Height-  25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & P.name & "Add.Left = Left +5 *Screen.TwipsPerPixelX "
  body = body & vbCrLf & "   cmd" & P.name & "Edit.Left = Left +30* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & P.name & "Del.Left = Left+55* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & P.name & "Ref.Left = Left+80* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & P.name & "Prn.Left = Left+105* Screen.TwipsPerPixelX"
  If IsMake_TRASH_Buttons Then
    body = body & vbCrLf & "   cmd" & P.name & "Cfg.Left = Left+130* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & P.name & "Fnd.Left = Left+155* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & P.name & "Run.Left = Left+180* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & P.name & "Acc.Left = Left+205* Screen.TwipsPerPixelX"
  Else
    body = body & vbCrLf & "   cmd" & P.name & "Fnd.Left = Left+130* Screen.TwipsPerPixelX"
  End If
  body = body & vbCrLf & "End Sub"
  
  
  body = body & vbCrLf & " private sub cmd" & P.name & "Del_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  " & rctl.name & ".Delete"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
    body = body & vbCrLf & CommentItem("Public Function IsOK() as BooLEAN", "Признак правильности заполнения")
    body = body & vbCrLf & "        IsOK=TRUE"
    body = body & vbCrLf & "End Function"
  
  
  body = body & vbCrLf & " private sub cmd" & P.name & "Edit_Click()"
  body = body & vbCrLf & "on error resume next"
  body = body & vbCrLf & "If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "If " & rctl.name & ".Row > 0 Then"
  body = body & vbCrLf & " If " & rctl.name & ".RowIndex ( " & rctl.name & ".Row) > 0 Then"
  body = body & vbCrLf & "    Dim u As Object"
  body = body & vbCrLf & "    Dim bm"
  body = body & vbCrLf & "    bm = " & rctl.name & ".RowBookmark(" & rctl.name & ".RowIndex(" & rctl.name & ".Row))"
  body = body & vbCrLf & "    Set u = Item.FindRowObject(Right(bm, len(bm)-38), Left(bm, 38))"
  body = body & vbCrLf & "    Dim frm As Form"
  body = body & vbCrLf & "    Set frm = FormByName(TypeName(u),""" & mode & """)"
  body = body & vbCrLf & "    Set frm.Item = u"
  body = body & vbCrLf & "    again: frm.NotFirstTime = False"
  body = body & vbCrLf & "    frm.OnInit"
  body = body & vbCrLf & "    frm.Show vbModal"
  body = body & vbCrLf & "    If frm.OK Then"
  body = body & vbCrLf & "    on error goto bye"
  body = body & vbCrLf & "    u.save"
  body = body & vbCrLf & "    u.Brief true"
  body = body & vbCrLf & "    if err.number <>0 then "
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "      msgbox err.description,vbokonly+vbExclamation,""Изменение"""
  body = body & vbCrLf & "on error resume next"
  body = body & vbCrLf & "      goto again"
  body = body & vbCrLf & "    end if "
  body = body & vbCrLf & "on error resume next"
  body = body & vbCrLf & "    " & rctl.name & ".RefreshRowBookmark bm"
  body = body & vbCrLf & "    Else"
  body = body & vbCrLf & "     u.Refresh"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "    Set frm = Nothing"
  body = body & vbCrLf & " End If"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
  body = body & vbCrLf & " private sub cmd" & P.name & "Add_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "Dim p As Object, ID As String, struct As String, u As Object"
  body = body & vbCrLf & "  If " & lctl.name & ".SelectedItem Is Nothing Then Exit Sub"
  body = body & vbCrLf & "    If " & lctl.name & ".SelectedItem.Tag = ""Row"" Then"
  body = body & vbCrLf & "      On Error Resume Next"
  body = body & vbCrLf & "      ID = Mid(" & lctl.name & ".SelectedItem.key, 39, 38)"
  body = body & vbCrLf & "      struct = " & lctl.name & ".SelectedItem.parent.tag"
  body = body & vbCrLf & "      Set p = Item.FindRowObject(struct, ID)"
  body = body & vbCrLf & "      If Item.itemcollection(p, TypeName(p)) Is Nothing Then"
  body = body & vbCrLf & "        Set u = p.Parent.Add"
  body = body & vbCrLf & "      Else"
  body = body & vbCrLf & "        Set u = Item.itemcollection(p, TypeName(p)).Add"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & ""
  body = body & vbCrLf & "      Set p = Nothing"
  body = body & vbCrLf & "    ElseIf " & lctl.name & ".SelectedItem.Tag <> ""object"" Then"
  body = body & vbCrLf & "        If " & lctl.name & ".SelectedItem.Parent.Tag = ""Row"" Then"
  body = body & vbCrLf & "        ID = Mid(" & lctl.name & ".SelectedItem.Parent.key, 39, 38)"
  body = body & vbCrLf & "        struct = " & lctl.name & ".SelectedItem.parent.parent.tag"
  body = body & vbCrLf & "        Set p = Item.FindRowObject(struct, ID)"
  body = body & vbCrLf & "        Set u = Item.itemcollection(p, " & lctl.name & ".SelectedItem.Tag).Add"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "      If " & lctl.name & ".SelectedItem.Parent.Tag = ""object"" Then"
  body = body & vbCrLf & "        ID = Mid(" & lctl.name & ".SelectedItem.Parent.key, 39, 38)"
  body = body & vbCrLf & "        Set p = Item.Manager.GetInstanceObject(ID)"
  body = body & vbCrLf & "        Set u = Item.itemcollection(p, " & lctl.name & ".SelectedItem.Tag).Add"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "    Set p = Nothing"
  body = body & vbCrLf & "    If u Is Nothing Then Exit Sub"
  body = body & vbCrLf & "    Dim frm As Form"
  body = body & vbCrLf & "    Set frm = FormByName(TypeName(u),""" & mode & """)"
  
  'надо пройти все разделы и вписть код инициализации!!!
  body = body & vbCrLf & MakeComplexDefaultCode(P, "u")
  
  body = body & vbCrLf & "    Set frm.Item = u"
  body = body & vbCrLf & "    again: frm.NotFirstTime = False"
  body = body & vbCrLf & "    frm.OnInit"
  body = body & vbCrLf & "    frm.Show vbModal"
  body = body & vbCrLf & "    If frm.OK Then"
  body = body & vbCrLf & "    err.clear"
  body = body & vbCrLf & "    u.save"
  body = body & vbCrLf & "    if err.number <>0 then "
  body = body & vbCrLf & "      msgbox err.description,vbokonly+vbExclamation,""Создание"""
  body = body & vbCrLf & "      goto again"
  body = body & vbCrLf & "    end if "
  body = body & vbCrLf & "      " & rctl.name & ".ItemCount = u.Parent.Count"
  body = body & vbCrLf & "        " & rctl.name & ".Refresh"
  body = body & vbCrLf & "        " & rctl.name & ".RefreshGroups"
  body = body & vbCrLf & "        " & rctl.name & ".RefreshSort"
  body = body & vbCrLf & "      Dim tid As String"
  body = body & vbCrLf & "      Dim key As String"
  body = body & vbCrLf & "      on error resume next"
  body = body & vbCrLf & "      Dim rnode As MSComctlLib.Node"
  body = body & vbCrLf & "      Set rnode = " & lctl.name & ".SelectedItem"
  body = body & vbCrLf & "      If rnode.Tag = ""Row"" Then"
  body = body & vbCrLf & "        Set rnode = rnode.parent"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "      While rnode.Children > 0"
  body = body & vbCrLf & "         " & lctl.name & ".Nodes.Remove rnode.Child.Key"
  body = body & vbCrLf & "      Wend"
  body = body & vbCrLf & "      tid = CreateGUID2()"
  body = body & vbCrLf & "      " & lctl.name & ".Nodes.Add(rnode.Key, 4, tid, ""Expanding..."").Tag = ""ToDelete"""
  body = body & vbCrLf & "      " & lctl.name & "_Expand " & lctl.name & ".Nodes.Item(rnode.Key)"
  body = body & vbCrLf & "    Else"
  body = body & vbCrLf & "     u.Parent.Delete u.ID"
  body = body & vbCrLf & "     u.Parent.Remove u.ID"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "    Set frm = Nothing"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
  
  
  body = body & vbCrLf & "Private Sub cmd" & P.name & "Cfg_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  Dim rnode As MSComctlLib.Node"
  body = body & vbCrLf & "  Set rnode = " & lctl.name & ".SelectedItem"
  body = body & vbCrLf & "  if rnode.tag = ""object"" then exit sub"
  body = body & vbCrLf & "  If rnode.Tag = ""Row"" Then"
  body = body & vbCrLf & "    Set rnode = rnode.parent"
  body = body & vbCrLf & "  End If"
  
  
  body = body & vbCrLf & "Dim jset As object 'MTZ_JSetup.Customizer"
  body = body & vbCrLf & "Set jset = CreateObject(""MTZ_JSetup.Customizer"")"
  
  body = body & vbCrLf & "jset.ShowSumary " & rctl.name & ",""" & rctl.name & """ & rnode.tag "
  body = body & vbCrLf & "Set jset = Nothing"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""

  
  body = body & vbCrLf & ""
  body = body & vbCrLf & "Private Sub " & lctl.name & "_Expand(ByVal Node As MSComctlLib.Node)"
  body = body & vbCrLf & "If Node.Child.Tag = ""ToDelete"" Then"
  body = body & vbCrLf & " parentform.mousepointer = vbHourglass"
  body = body & vbCrLf & " " & lctl.name & ".Nodes.Remove Node.Child.Index"
  body = body & vbCrLf & " item.Expand " & lctl.name & ", Node.Key, """ & mode & """"
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
  
  body = body & vbCrLf & "Private Sub " & lctl.name & "_NodeClick(ByVal Node As MSComctlLib.Node)"
  body = body & vbCrLf & "  Dim p As Object, ID As String, struct As String"
  body = body & vbCrLf & "  If Node.Tag = ""Row"" Then"
  body = body & vbCrLf & "    On Error Resume Next"
  body = body & vbCrLf & "    ID = Mid(Node.Key, 39, 38)"
  body = body & vbCrLf & "    struct = Node.parent.tag"
  body = body & vbCrLf & "    Set p = Item.FindRowObject(struct, ID)"
  body = body & vbCrLf & "    On Error Resume Next"
  'body = body & vbCrLf & "    If Item.itemcollection(p, TypeName(p)) Is Nothing Then"
  'body = body & vbCrLf & "      p.Parent.preparegrid " & rctl.name & ""
  'body = body & vbCrLf & "      LoadGridLayout " & rctl.name & "," & rctl.name & ".name & node.parent.tag"
  'body = body & vbCrLf & "    Else"
  body = body & vbCrLf & "      Item.itemcollection(p.parent.parent, TypeName(p)).preparegrid " & rctl.name & ""
  body = body & vbCrLf & "      LoadGridLayout " & rctl.name & "," & rctl.name & ".name & node.parent.tag"
  
  body = body & vbCrLf & "    Set fnd" & P.name & " = Nothing"
  body = body & vbCrLf & "    Set fnd" & P.name & " = CreateObject(""MTZ_JSetup.GridFinder"")"
  body = body & vbCrLf & "    fnd" & P.name & ".Init " & rctl.name
  
  'body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "  ElseIf Node.Tag <> ""object"" Then"
  body = body & vbCrLf & "    If Node.Parent is nothing Then"
  body = body & vbCrLf & "      Item.itemcollection(item, Node.Tag).preparegrid " & rctl.name & ""
  body = body & vbCrLf & "      LoadGridLayout " & rctl.name & "," & rctl.name & ".name & node.tag"
  body = body & vbCrLf & "    else "
  body = body & vbCrLf & "     If Node.Parent.Tag = ""Row"" Then"
  body = body & vbCrLf & "       ID = Mid(Node.Parent.Key, 39, 38)"
  body = body & vbCrLf & "       struct = Node.Parent.parent.tag"
  body = body & vbCrLf & "       Set p = Item.FindRowObject(struct, ID)"
  body = body & vbCrLf & "       Item.itemcollection(p, Node.Tag).preparegrid " & rctl.name & ""
  body = body & vbCrLf & "       LoadGridLayout " & rctl.name & "," & rctl.name & ".name & node.tag"
  body = body & vbCrLf & "     End If"
  body = body & vbCrLf & "     If Node.Parent.Tag = ""object"" Then"
  body = body & vbCrLf & "       ID = Mid(Node.Parent.Key, 39, 38)"
  body = body & vbCrLf & "       Set p = Item.Manager.GetInstanceObject(ID)"
  body = body & vbCrLf & "       Item.itemcollection(p, Node.Tag).preparegrid " & rctl.name & ""
  body = body & vbCrLf & "       LoadGridLayout " & rctl.name & "," & rctl.name & ".name & Node.Tag"
  body = body & vbCrLf & "     End If"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "End Sub"

  body = body & vbCrLf & "Private Sub cmdT" & P.name & "Ref_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  " & lctl.name & ".Nodes.Clear"
  body = body & vbCrLf & "  Item.FillTree " & lctl.name & ", """", """", """ & P.name & """"
  body = body & vbCrLf & "  " & rctl.name & ".columns.clear"
  body = body & vbCrLf & "  " & rctl.name & ".itemcount=0"
  body = body & vbCrLf & "End Sub"
  
  
  body = body & vbCrLf & "Private Sub cmd" & P.name & "Ref_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  " & lctl.name & "_NodeClick   " & lctl.name & ".SelectedItem "
  body = body & vbCrLf & "End Sub"

  body = body & vbCrLf & "Private Sub cmd" & P.name & "Acc_Click()"
  body = body & vbCrLf & "on error resume next"
  body = body & vbCrLf & "If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "If " & rctl.name & ".Row > 0 Then"
  body = body & vbCrLf & " If " & rctl.name & ".RowIndex ( " & rctl.name & ".Row) > 0 Then"
  body = body & vbCrLf & "    Dim u As Object"
  body = body & vbCrLf & "    Dim bm"
  body = body & vbCrLf & "    bm = " & rctl.name & ".RowBookmark(" & rctl.name & ".RowIndex(" & rctl.name & ".Row))"
  body = body & vbCrLf & "    Set u = Item.FindRowObject(Right(bm, len(bm)-38), Left(bm, 38))"
  body = body & vbCrLf & "    item.application.manager.ShowSecurityDialog u"
  body = body & vbCrLf & " End If"
  body = body & vbCrLf & "End If"
    
  body = body & vbCrLf & "End Sub"



  body = body & vbCrLf & "Private Sub " & rctl.name & "_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As  GridEX20.JSRowData)"
  body = body & vbCrLf & "on error resume next"
  body = body & vbCrLf & "  Dim p As Object, ID As String, struct As String"
  body = body & vbCrLf & "  If " & lctl.name & ".SelectedItem Is Nothing Then Exit Sub"
  body = body & vbCrLf & "  If " & lctl.name & ".SelectedItem.Tag = ""Row"" Then"
  body = body & vbCrLf & "    On Error Resume Next"
  body = body & vbCrLf & "    ID = Mid(" & lctl.name & ".SelectedItem.Key, 39, 38)"
  body = body & vbCrLf & "    struct = " & lctl.name & ".SelectedItem.parent.Tag"
  body = body & vbCrLf & "    Set p = Item.FindRowObject(struct, ID)"
  'body = body & vbCrLf & "    If Item.itemcollection(p, TypeName(p)) Is Nothing Then"
  'body = body & vbCrLf & "      p.Parent.LoadRow " & rctl.name & ", RowIndex, Bookmark, Values"
  'body = body & vbCrLf & "    Else"
  body = body & vbCrLf & "      Item.itemcollection(p.parent.parent, TypeName(p)).LoadRow " & rctl.name & ", RowIndex, Bookmark, Values"
  'body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "    Set p = Nothing"
  body = body & vbCrLf & "  elseIf " & lctl.name & ".SelectedItem.Tag <> ""object"" Then"
  body = body & vbCrLf & "      If " & lctl.name & ".SelectedItem.Parent is nothing Then"
  body = body & vbCrLf & "          Item.itemcollection(item, " & lctl.name & ".SelectedItem.Tag).LoadRow " & rctl.name & ", RowIndex, Bookmark, Values"
  body = body & vbCrLf & "      else"
  body = body & vbCrLf & "        If " & lctl.name & ".SelectedItem.Parent.Tag = ""Row"" Then"
  body = body & vbCrLf & "          ID = Mid(" & lctl.name & ".SelectedItem.Parent.Key, 39, 38)"
  body = body & vbCrLf & "          struct = " & lctl.name & ".SelectedItem.parent.parent.tag"
  body = body & vbCrLf & "          Set p = Item.FindRowObject(struct, ID)"
  body = body & vbCrLf & "          Item.itemcollection(p, " & lctl.name & ".SelectedItem.Tag).LoadRow " & rctl.name & ", RowIndex, Bookmark, Values"
  body = body & vbCrLf & "        End If"
  body = body & vbCrLf & "        If " & lctl.name & ".SelectedItem.Parent.Tag = ""object"" Then"
  body = body & vbCrLf & "          ID = Mid(" & lctl.name & ".SelectedItem.Parent.Key, 39, 38)"
  body = body & vbCrLf & "          Set p = Item.Manager.GetInstanceObject(ID)"
  body = body & vbCrLf & "          Item.itemcollection(p, " & lctl.name & ".SelectedItem.Tag).LoadRow " & rctl.name & ", RowIndex, Bookmark, Values"
  body = body & vbCrLf & "        End If"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "End Sub"


  body = body & vbCrLf & "Private Sub " & rctl.name & "_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)"
  body = body & vbCrLf & "  If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "  Dim u As Object"
  body = body & vbCrLf & "  Set u = Item.FindRowObject(Right(Bookmark,len(Bookmark)- 38), Left(Bookmark, 38))"
  body = body & vbCrLf & "  If Not u Is Nothing Then"
  body = body & vbCrLf & "    on error resume next"
  body = body & vbCrLf & "    If MsgBox(""Удалить элемент"" & vbCrLf & u.Brief & vbCrLf & ""?"", vbYesNo + vbQuestion, ""Внимание"") = vbYes Then"
  body = body & vbCrLf & "      on error goto bye"
  body = body & vbCrLf & "      u.Parent.Delete u.ID"
  body = body & vbCrLf & "    on error resume next"
  body = body & vbCrLf & "      Dim rnode As MSComctlLib.Node, tid as string"
  body = body & vbCrLf & "      Set rnode = " & lctl.name & ".SelectedItem"
  body = body & vbCrLf & "      If rnode.Tag = ""Row"" Then"
  body = body & vbCrLf & "        Set rnode = rnode.parent"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "      While rnode.Children > 0"
  body = body & vbCrLf & "         " & lctl.name & ".Nodes.Remove rnode.Child.Key"
  body = body & vbCrLf & "      Wend"
  body = body & vbCrLf & "      tid = CreateGUID2()"
  body = body & vbCrLf & "      " & lctl.name & ".Nodes.Add(rnode.Key, 4, tid, ""Expanding..."").Tag = ""ToDelete"""
  body = body & vbCrLf & "      " & lctl.name & "_Expand " & lctl.name & ".Nodes.Item(rnode.Key)"
  body = body & vbCrLf & "    Else"
  body = body & vbCrLf & "      Cancel = True"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "Exit Sub"
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "   Cancel = True"
  body = body & vbCrLf & "   MsgBox Err.Description, vbOKOnly + vbExclamation, ""Удаление"""
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
  
  ' подумать!!!
  body = body & vbCrLf & "Private Sub " & rctl.name & "_DblClick()"
  body = body & vbCrLf & "on error resume next"
  body = body & vbCrLf & "If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "If " & rctl.name & ".Row > 0 Then"
  body = body & vbCrLf & " If " & rctl.name & ".RowIndex ( " & rctl.name & ".Row) > 0 Then"
  body = body & vbCrLf & "    Dim u As Object"
  body = body & vbCrLf & "    Dim bm"
  body = body & vbCrLf & "    bm = " & rctl.name & ".RowBookmark(" & rctl.name & ".RowIndex(" & rctl.name & ".Row))"
  body = body & vbCrLf & "    Set u = Item.FindRowObject(Right(bm, len(bm)-38), Left(bm, 38))"
  body = body & vbCrLf & "    Dim frm As Form"
  body = body & vbCrLf & "    Set frm = FormByName(TypeName(u),""" & mode & """)"
  body = body & vbCrLf & "    Set frm.Item = u"
  body = body & vbCrLf & "    again: frm.NotFirstTime = False"
  body = body & vbCrLf & "    frm.OnInit"
  body = body & vbCrLf & "    frm.Show vbModal"
  body = body & vbCrLf & "    If frm.OK Then"
  body = body & vbCrLf & "    on error goto bye"
  body = body & vbCrLf & "    u.save"
  body = body & vbCrLf & "    u.Brief true"
  body = body & vbCrLf & " bye:"
  body = body & vbCrLf & "    if err.number <>0 then "
  body = body & vbCrLf & "      msgbox err.description,vbokonly+vbExclamation,""Изменение"""
  body = body & vbCrLf & "on error resume next"
  body = body & vbCrLf & "      goto again"
  body = body & vbCrLf & "    end if "
  body = body & vbCrLf & "on error resume next"
  body = body & vbCrLf & "    " & rctl.name & ".RefreshRowBookmark bm"
  body = body & vbCrLf & "    Else"
  body = body & vbCrLf & "     u.Refresh"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "    Set frm = Nothing"
  body = body & vbCrLf & " End If"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""

  body = body & vbCrLf & "Private Sub " & rctl.name & "_KeyPress(KeyAscii As Integer)"
  body = body & vbCrLf & "  If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "  On Error Resume Next"
  body = body & vbCrLf & "  fnd" & P.name & ".FindOnPress KeyAscii"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
  
  ' paint full row
  body = body & vbCrLf & "Private Sub " & rctl.name & "_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)"
  body = body & vbCrLf & " ON ERROR RESUME NEXT"
  body = body & vbCrLf & " If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & " If " & rctl.name & ".Row > 0 Then"
  body = body & vbCrLf & "   If LastRow <> " & rctl.name & ".Row And LastRow > 0 Then"
  body = body & vbCrLf & "     " & rctl.name & ".GetRowData(LastRow).RowStyle = ""Default"""
  body = body & vbCrLf & "     " & rctl.name & ".GetRowData(" & rctl.name & ".Row).RowStyle = ""SelectedRow"""
  body = body & vbCrLf & "   End If"
  body = body & vbCrLf & " End If"
  body = body & vbCrLf & "End sub"
    
End Sub


Private Function MakeComplexDefaultCode(P As PART, item As String) As String
  Dim out As String
  Dim i As Integer, s As String
  out = ""
  s = MakeDefaultCode(P, item)
  If s <> "" Then
    out = out & vbCrLf & "if TypeName(" & item & ")=""" & P.name & """ then"
    out = out & vbCrLf & s
    out = out & vbCrLf & "end if"
  End If
  For i = 1 To P.PART.Count
    out = out & vbCrLf & MakeComplexDefaultCode(P.PART.item(i), item)
  Next
  MakeComplexDefaultCode = out
End Function

