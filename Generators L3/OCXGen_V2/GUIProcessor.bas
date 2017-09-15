Attribute VB_Name = "GUIProcessor"
Option Explicit

'Public Sub GUIProcess(ByVal pname As String)
'
'' close all projects
'  On Error Resume Next
'  While VBInstance.VBProjects.Count > 0
'    VBInstance.VBProjects.Remove VBInstance.VBProjects.Item(1)
'  Wend
'
'  ' open template project
'  Set vbp = VBInstance.VBProjects.AddFromTemplate(App.Path & "\template\GUI_Template.vbp", True).Item(1)
'
'  On Error Resume Next
'
'  MkDir App.Path & "\" & pname
'  vbp.StartMode = vbext_psm_StandAlone
'
'  vbp.BuildFileName = App.Path & "\" & pname & "\GUI_" & pname & ".exe"
'  vbp.Name = "GUI_" & pname
'
'  ' phase 1 -  create new from template
'  'pbf.Value = 1
'
'  For Each vbc In vbp.VBComponents
'      If vbc.Type = vbext_ct_VBForm Then
'        vbc.SaveAs App.Path & "\" & pname & "\" & vbc.Name & ".frm"
'      End If
'
'      If vbc.Type = vbext_ct_StdModule Then
'        vbc.SaveAs App.Path & "\" & pname & "\" & vbc.Name & ".bas"
'      End If
'
'      If vbc.Type = vbext_ct_ClassModule Then
'        vbc.SaveAs App.Path & "\" & pname & "\" & vbc.Name & ".cls"
'      End If
'  Next
'
'  CreateViewForm pname
'
'  MakeDialog pname
'
'  'vbp.CompatibleOleServer = App.path & "\" & pname & "\GUI_" & pname & ".exe"
'  vbp.SaveAs App.Path & "\" & pname & "\GUI_" & pname & ".vbp"
'
'
'
'End Sub
'
'
'Public Sub CreateViewForm(ByVal pname As String)
'    Dim vbc As VBComponent, vbf As VBForm, vc As VBControl
'    Dim txt As String, pos As Long, s As String, i, j, k
'    On Error GoTo bye
'
'    ' test existance
'    Dim vbc_i As Long
'    For vbc_i = 1 To vbp.VBComponents.Count
'      Set vbc = vbp.VBComponents.Item(vbc_i)
'      If vbc.Name = "frmMain" Then
'        GoTo found
'      End If
'    Next
'    Exit Sub
'found:
'
'    ' create view form
'    vbc.Properties("Caption") = pname
'    vbc.Properties("BorderStyle") = 2
'    vbc.Properties("Height") = 440 * Screen.TwipsPerPixelY
'    vbc.Properties("Width") = 600 * Screen.TwipsPerPixelX
'    vbc.Properties("Left") = 0
'    vbc.Properties("Top") = 0
'    vbc.Properties("StartupPosition") = 1
'
'    If vbc.Type = vbext_ct_VBForm Then
'       Set vbf = vbc.Designer
'
'
'
''''''''''''''''''''''' GetObjet
'      txt = "private sub GetObject()"
'      txt = txt & vbCrLf & "  set " & pname & "  = createobject( """ & pname & ".Application"" )"
'      txt = txt & vbCrLf & "  if not " & pname & ".login( """ & pname & """,uid,pwd ) then"
'      txt = txt & vbCrLf & "    msgbox ""Login failed"""
'      txt = txt & vbCrLf & "    " & pname & ".closeclass"
'      txt = txt & vbCrLf & "    set " & pname & " = nothing"
'      txt = txt & vbCrLf & "    end"
'      txt = txt & vbCrLf & "  end if"
'      txt = txt & vbCrLf & "end sub"
'      vbc.CodeModule.InsertLines vbc.CodeModule.CountOfLines + 1, txt
'
'
'
''''''''''''''''''''''''''''' NodeClick
'      txt = ChangeCollection(pname)
'      pos = vbc.CodeModule.CreateEventProc("NodeClick", "TREE")
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
'''''''''''''''''''''''''''' UnboundReadData
'      txt = MakeURD
'      pos = vbc.CodeModule.CreateEventProc("UnboundReadData", "List")
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'      txt = ""
'      txt = txt & vbCrLf & "On Error Resume Next"
'      txt = txt & vbCrLf & "Dim s As String"
'      txt = txt & vbCrLf & "s = ActionEdit(List.RowBookmark(List.RowIndex(List.Row)))"
'      txt = txt & vbCrLf & "tree.Nodes.item(List.RowBookmark(List.RowIndex(List.Row))).Text = s"
'      txt = txt & vbCrLf & "List.Refetch"
'      pos = vbc.CodeModule.CreateEventProc("DblClick", "List")
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
'
'
'
'''''''''''''''''''''''''''' Expand
'      txt = Expander(pname, False)
'      pos = vbc.CodeModule.CountOfLines
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
'''''''''''''''''''''''' Tree_Expand
'
'      txt = ""
'      txt = txt & vbCrLf & "if Node.tag = ""ToExpand"" then"
'      txt = txt & vbCrLf & " me.mousepointer = vbhourglass"
'      txt = txt & vbCrLf & " tree.Nodes.Remove Node.Child.Index"
'      txt = txt & vbCrLf & " Expand Node.Key"
'      txt = txt & vbCrLf & " Node.Tag = ""OK"""
'      txt = txt & vbCrLf & " me.mousepointer = vbnormal"
'      txt = txt & vbCrLf & "end if"
'      pos = vbc.CodeModule.CreateEventProc("Expand", "TREE")
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
'      txt = ""
'      txt = txt & vbCrLf & "Private Sub mnuRefresh_Click()"
'      txt = txt & vbCrLf & "If tree.SelectedItem.Tag = ""OK"" Then"
'      txt = txt & vbCrLf & "  While tree.SelectedItem.Children > 0"
'      txt = txt & vbCrLf & "    tree.Nodes.Remove tree.SelectedItem.child.Key"
'      txt = txt & vbCrLf & "  Wend"
'      txt = txt & vbCrLf & "  tree.SelectedItem.Expanded = False"
'      txt = txt & vbCrLf & "  tree.SelectedItem.sorted = true"
'      txt = txt & vbCrLf & "  tree.SelectedItem.sorted=true"
'      txt = txt & vbCrLf & "  tree.Nodes.Add(tree.SelectedItem.Key, tvwChild, CreateGUID2, ""...Expanding..."", 3, 3).Tag = ""ToDelete"""
'      txt = txt & vbCrLf & "  tree.SelectedItem.Tag = ""ToExpand"""
'      txt = txt & vbCrLf & "  list.refetch"
'      txt = txt & vbCrLf & "End If"
'      txt = txt & vbCrLf & "End Sub"
'      pos = vbc.CodeModule.CountOfLines
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
'
''''''''''''''''''''''''''' MouseUp
'      txt = ""
'      txt = txt & vbCrLf & "Dim n As Node"
'      txt = txt & vbCrLf & "If Button <> 2 Then Exit Sub"
'      txt = txt & vbCrLf & "Set n = tree.HitTest(X, Y)"
'      txt = txt & vbCrLf & "If n Is Nothing Then Exit Sub"
'      txt = txt & vbCrLf & "If n.parent Is Nothing Then "
'      txt = txt & vbCrLf & "  PopupMenu mnuRoot, , x + tree.Left, y + tree.Top"
'      txt = txt & vbCrLf & "Else"
'      txt = txt & vbCrLf & "  If n.Tag = """" Then"
'      txt = txt & vbCrLf & "    mnuDelete.Enabled = True"
'      txt = txt & vbCrLf & "    mnuEdit.Enabled = True"
'      txt = txt & vbCrLf & "    mnuNew.Enabled = False"
'      txt = txt & vbCrLf & "    mnuRefresh.Enabled = False"
'      txt = txt & vbCrLf & "  Else"
'      txt = txt & vbCrLf & "    mnuDelete.Enabled = False"
'      txt = txt & vbCrLf & "    mnuEdit.Enabled = False"
'      txt = txt & vbCrLf & "    mnuNew.Enabled = True"
'      txt = txt & vbCrLf & "    mnurefresh.Enabled = True"
'      txt = txt & vbCrLf & "  End If"
'      txt = txt & vbCrLf & "  Set tree.SelectedItem = n"
'      txt = txt & vbCrLf & "  PopupMenu mnuActions, , x + tree.Left, y + tree.Top"
'      txt = txt & vbCrLf & "End if"
'      pos = vbc.CodeModule.CreateEventProc("MouseUp", "TREE")
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
'''''''''''''''''''''''''''''' mnuNew
'      txt = ""
'      txt = txt & vbCrLf & "Dim id As String, struct As String, child As String, nid as string"
'      txt = txt & vbCrLf & "Dim item As Object, i As Long, key As String, pid As String, pstruct As String"
'
'
'      txt = txt & vbCrLf & " If tree.SelectedItem.Parent Is Nothing Then"
'      txt = txt & vbCrLf & "   Set item = " & pname
'      txt = txt & vbCrLf & " else"
'      txt = txt & vbCrLf & "   pid = Mid(tree.SelectedItem.Parent.key, 39, 38)"
'      txt = txt & vbCrLf & "   pstruct = Left(tree.SelectedItem.Parent.key, 38)"
'      txt = txt & vbCrLf & "   Set item = " & pname & ".FindObject(pstruct, pid)"
'      txt = txt & vbCrLf & " end if"
'
'      txt = txt & vbCrLf & "key = tree.SelectedItem.key"
'      txt = txt & vbCrLf & "id = Mid(key, 39, 38)"
'      txt = txt & vbCrLf & "struct = Left(key, 38)"
'      txt = txt & vbCrLf & "child = Right(key, 38)"
'
'
'      txt = txt & vbCrLf & "id = CreateGUID2"
'
'      txt = txt & vbCrLf & " select case child"
'        For i = 1 To SD.Count
'          txt = txt & vbCrLf & " case """ & SD.Item(i).id & """ ' " & SD.Item(i).TheName
'          If Not SD.Item(i).IsCollection Then
'            txt = txt & vbCrLf & " if item." & SD.Item(i).TheName & ".count >0 then exit sub"
'          End If
'          txt = txt & vbCrLf & "    item." & SD.Item(i).TheName & ".Add(id).Update"
'          txt = txt & vbCrLf & "    nid =child & id"
'          txt = txt & vbCrLf & "    If tree.SelectedItem.Tag = ""OK"" Then"
'          txt = txt & vbCrLf & "       tree.nodes.add key,tvwchild,nid,  item." & SD.Item(i).TheName & ".item(id).brief,1,1 "
'
'          For j = 1 To SD.Count
'            If SD.Item(j).ParentID = SD.Item(i).id Then
'              txt = txt & vbCrLf & "    ' " & SD.Item(j).TheName
'              txt = txt & vbCrLf & "    tree.nodes.add( nid,tvwchild,nid & """ & SD.Item(j).id & """ ,""" & SD.Item(j).TheName & """,2,2).tag=""ToExpand"""
'              txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & SD.Item(j).id & """,tvwchild, createguid2(),""Expanding ..."",3,3).tag=""ToDelete"""
'            End If
'          Next
'          If SD.Item(i).IsRepeatable And SD.Item(i).LoopTo <> "" Then
'              txt = txt & vbCrLf & "    ' loop to " & SD.Item(SD.Item(i).LoopTo).TheName
'              txt = txt & vbCrLf & "    tree.nodes.add( nid,tvwchild,nid & """ & SD.Item(SD.Item(i).LoopTo).id & """ ,""" & SD.Item(SD.Item(i).LoopTo).TheName & """,2,2).tag=""ToExpand"""
'              txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & SD.Item(SD.Item(i).LoopTo).id & """,tvwchild, createguid2(),""Expanding ..."",3,3).tag=""ToDelete"""
'          End If
'          txt = txt & vbCrLf & "   End If ' if already expanded!"
'
'
'      Next
'
'      txt = txt & vbCrLf & "end select"
'      txt = txt & vbCrLf & " If not tree.SelectedItem.Parent Is Nothing Then"
'      txt = txt & vbCrLf & "   TREE_NodeClick tree.SelectedItem"
'      txt = txt & vbCrLf & " end if"
'      txt = txt & vbCrLf & "' Edit New Item"
'      txt = txt & vbCrLf & " on error resume next"
'      txt = txt & vbCrLf & "Dim s As String"
'      txt = txt & vbCrLf & "s = ActionEdit(nid)"
'      txt = txt & vbCrLf & "tree.Nodes.item(nid).Text = s"
'      pos = vbc.CodeModule.CreateEventProc("Click", "mnuNew")
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
'
'
'
'
''''''''''''''''''''''''''''''' nmuDelete
'      txt = ""
'      txt = txt & vbCrLf & "Private Function DeleteAction(ByVal key As String) As Boolean"
'      txt = txt & vbCrLf & "  if msgbox(""Delete item ?"",vbyesno, ""Confirm!"") = vbyes then"
'      txt = txt & vbCrLf & "    Dim id As String, struct As String, child As String"
'      txt = txt & vbCrLf & "    Dim item As Object, i As Long"
'      txt = txt & vbCrLf & "    id = Mid(key, 39, 38)"
'      txt = txt & vbCrLf & "    struct = Left(key, 38)"
'      txt = txt & vbCrLf & "    Set item = " & pname & ".FindObject(struct, id)"
'      txt = txt & vbCrLf & "    DeleteAction = item.Parent.Delete(item.id)"
'      txt = txt & vbCrLf & "  end if"
'      txt = txt & vbCrLf & "End Function"
'      pos = vbc.CodeModule.CountOfLines
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
'      txt = ""
'      txt = txt & vbCrLf & "  Dim id As String"
'      txt = txt & vbCrLf & "  If tree.SelectedItem.Tag = """" Then"
'      txt = txt & vbCrLf & "    If DeleteAction( tree.SelectedItem.key) Then"
'      txt = txt & vbCrLf & "       id = tree.SelectedItem.Parent.key"
'      txt = txt & vbCrLf & "       tree.Nodes.Remove tree.SelectedItem.key"
'      txt = txt & vbCrLf & "       Set tree.SelectedItem = tree.Nodes.item(id)"
'      txt = txt & vbCrLf & "       TREE_NodeClick tree.Nodes.item(id)"
'      txt = txt & vbCrLf & "    End If"
'      txt = txt & vbCrLf & "   End If"
'      pos = vbc.CodeModule.CreateEventProc("Click", "mnuDelete")
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
''''''''''''''''''''''''''''''' nmuEdit
'      txt = "PRIVATE function ActionEdit (byval key as string) as string"
'      txt = txt & vbCrLf & "  Dim id As String, struct As String, child As String"
'      txt = txt & vbCrLf & "  Dim item As Object, i As Long"
'      txt = txt & vbCrLf & "    id = Mid(key, 39, 38)"
'      txt = txt & vbCrLf & "    struct = Left(key, 38)"
'      txt = txt & vbCrLf & "    Set item = " & pname & ".FindObject(struct, id)"
'      txt = txt & vbCrLf & "    dim f as form"
'      For i = 1 To SD.Count
'        txt = txt & vbCrLf & "    if struct = """ & SD.Item(i).id & """ then set f = new frm" & SD.Item(i).TheName
'      Next
'      txt = txt & vbCrLf & "    set f.item =item"
'      txt = txt & vbCrLf & "    f.show vbmodal"
'      txt = txt & vbCrLf & "    If f.OK Then"
'      txt = txt & vbCrLf & "     if item.Changed then item.Update"
'      txt = txt & vbCrLf & "    Else"
'      txt = txt & vbCrLf & "      if item.changed then item.refresh"
'      txt = txt & vbCrLf & "    End If"
'      txt = txt & vbCrLf & "    ActionEdit=item.brief"
'      txt = txt & vbCrLf & "    set f.item = nothing"
'      txt = txt & vbCrLf & "    set f = nothing"
'      txt = txt & vbCrLf & "End function"
'      pos = vbc.CodeModule.CountOfLines
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'      txt = ""
'      txt = txt & vbCrLf & "  Dim id As String, struct As String, child As String"
'      txt = txt & vbCrLf & "  Dim item As Object, i As Long"
'      txt = txt & vbCrLf & "  If tree.SelectedItem.Tag = """" Then"
'      txt = txt & vbCrLf & "    tree.SelectedItem.text=actionedit(tree.SelectedItem.key)"
'      txt = txt & vbCrLf & "    list.refetch"
'      txt = txt & vbCrLf & "   End If"
'      pos = vbc.CodeModule.CreateEventProc("Click", "mnuEdit")
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
'
''''''''''''''''''''''''''' Init
'      txt = ""
'      txt = txt & vbCrLf & "private sub Init()"
'      txt = txt & vbCrLf & "  getobject"
'      txt = txt & vbCrLf & "  tree.Nodes.Clear"
'      txt = txt & vbCrLf & "  List.itemCount =0"
'      txt = txt & vbCrLf & "  While List.Columns.count > 0"
'      txt = txt & vbCrLf & "    List.Columns.Remove 0"
'      txt = txt & vbCrLf & "  Wend"
'
'      txt = txt & vbCrLf & "  dim id as string, id2 as string, i as long, idroot as string"
'      txt = txt & vbCrLf & "  IDroot=""" & ApplicationID & ApplicationID & """"
'      txt = txt & vbCrLf & "  tree.nodes.add( , ,idroot,""" & pname & """,2,2).tag=""OK"""
'
'      For i = 1 To SD.Count
'        If SD.Item(i).ParentID = "" Then
'          txt = txt & vbCrLf & "ID=idroot & """ & SD.Item(i).id & """"
'          txt = txt & vbCrLf & "  tree.nodes.add( idroot,tvwchild,id,""" & SD.Item(i).TheName & """,2,2).tag = ""ToExpand"""
'          txt = txt & vbCrLf & "  tree.nodes.add(  id,tvwchild,createguid2(),""Expanding ... "",3,3).tag = ""ToDelete"""
'        End If
'      Next
'      txt = txt & vbCrLf & "end sub"
'      vbc.CodeModule.InsertLines vbc.CodeModule.CountOfLines + 1, txt
'      vbc.SaveAs App.Path & "\" & pname & "\frmMain.frm"
'
'      txt = ""
'      txt = txt & vbCrLf & "Private Sub mnuXMLLoad_Click()"
'      txt = txt & vbCrLf & "  Dim xdom As DOMDocument"
'      txt = txt & vbCrLf & "  Set xdom = New DOMDocument"
'      txt = txt & vbCrLf & "  If Not xdom.Load(App.Path & ""\" & pname & ".xml"") Then Exit Sub"
'      txt = txt & vbCrLf & "  Dim xnode As IXMLDOMNode"
'      txt = txt & vbCrLf & "  Set xnode = xdom.childNodes.item(1)"
'      txt = txt & vbCrLf & "  " & pname & ".XMLLoad xnode"
'      txt = txt & vbCrLf & ""
'      txt = txt & vbCrLf & "End Sub"
'      txt = txt & vbCrLf & ""
'      txt = txt & vbCrLf & "Private Sub mnuXMLSave_Click()"
'      txt = txt & vbCrLf & "  Dim xdom As DOMDocument"
'      txt = txt & vbCrLf & "  Set xdom = New DOMDocument"
'      txt = txt & vbCrLf & "  xdom.loadXML ""<?xml version=""""1.0""""?><root></root>"""
'      txt = txt & vbCrLf & "  Dim xnode As IXMLDOMNode"
'      txt = txt & vbCrLf & "  Set xnode = xdom.childNodes.item(1)"
'      txt = txt & vbCrLf & "  " & pname & ".XMLSave xnode, xdom"
'      txt = txt & vbCrLf & "  xdom.save App.Path & ""\" & pname & ".xml"""
'      txt = txt & vbCrLf & "End Sub"
'      vbc.CodeModule.InsertLines vbc.CodeModule.CountOfLines + 1, txt
'
'
'
'
'      For i = 1 To SD.Count
'        CreateEditForm vbp, SD.Item(i), pname
'      Next
'
'
'    End If
'    Exit Sub
'bye:
'
'    MsgBox pname & vbCrLf & Err.Description, vbOKOnly
'    'Stop
'    'Resume
'End Sub
'
'
'Private Function ChangeCollection(ByVal pname As String) As String
'Dim txt As String
'
'Dim id As String, struct As String, child As String
' Dim Item As Object
'
'
' txt = txt & vbCrLf & " dim id as string , struct as string, child as string"
' txt = txt & vbCrLf & " dim item as object, i as long"
' txt = txt & vbCrLf & " If Node.Tag <> """" Then"
' txt = txt & vbCrLf & "   lbltitle(1) = node.fullpath"
' txt = txt & vbCrLf & "   Dim col As JSColumn"
' txt = txt & vbCrLf & "   List.ItemCount = 0"
' txt = txt & vbCrLf & "   While List.Columns.count > 0"
' txt = txt & vbCrLf & "     List.Columns.Remove 1"
' txt = txt & vbCrLf & "   Wend"
' txt = txt & vbCrLf & "   LastCollection = Node.Text"
'
'
' txt = txt & vbCrLf & "   id = Mid(Node.Key, 39, 38)"
' txt = txt & vbCrLf & "   struct = Left(Node.Key, 38)"
' txt = txt & vbCrLf & "   child = Right(Node.Key, 38)"
' txt = txt & vbCrLf & " if trim(struct)="""" and trim(id)="""" then "
' txt = txt & vbCrLf & "   set item =" & pname
' txt = txt & vbCrLf & " else"
' txt = txt & vbCrLf & "    set item =" & pname & ".FindObject(struct,id)"
' txt = txt & vbCrLf & " end if"
' txt = txt & vbCrLf & "   Set CollectionOwner = item"
' Dim i As Long, j As Long
' For i = 1 To SD.Count
'    txt = txt & vbCrLf & "       If Node.Text = """ & SD.Item(i).TheName & """ Then"
'    For j = 1 To ND.Item(SD.Item(i).NodeID).Properties.Count
'      'If ND.item(SD.item(i).NodeID).Properties.item(j).RefTo = "" Then
'        txt = txt & vbCrLf & "          Set col = List.Columns.Add(""" & ND.Item(SD.Item(i).NodeID).Properties.Item(j).TheName & """, jgexText, jgexEditNone, """ & ND.Item(SD.Item(i).NodeID).Properties.Item(j).TheName & """)"
'      'End If
'    Next
'    txt = txt & vbCrLf & "           List.ItemCount = item." & SD.Item(i).TheName & ".count"
'    txt = txt & vbCrLf & "       End If 'text"
'Next
'
'txt = txt & vbCrLf & "  Else"
'txt = txt & vbCrLf & "    On Error Resume Next"
'txt = txt & vbCrLf & "    List.MoveToBookmark Node.Key"
'txt = txt & vbCrLf & "    "
'txt = txt & vbCrLf & "  End If 'Tag"
'txt = txt & vbCrLf & "  lbltitle(0)=Node.fullpath"
'ChangeCollection = txt
'
'End Function
'
'Private Function MakeURD() As String
'  Dim txt As String
'  Dim pd As PropertyDef
'  Dim arr() As String
'  Dim i As Long, j As Long, k As Long, l As Long
'  For i = 1 To SD.Count
'     txt = txt & vbCrLf & "     If LastCollection =""" & SD.Item(i).TheName & """ Then"
'     txt = txt & vbCrLf & "       Dim " & SD.Item(i).TheName & " As object '" & SD.Item(i).TheName & ""
'     txt = txt & vbCrLf & "       If RowIndex > 0 And RowIndex <= CollectionOwner." & SD.Item(i).TheName & ".count Then"
'     txt = txt & vbCrLf & "         Set " & SD.Item(i).TheName & " = CollectionOwner." & SD.Item(i).TheName & ".item(RowIndex)"
'     k = 1
'     For j = 1 To ND.Item(SD.Item(i).NodeID).Properties.Count
'       Set pd = ND.Item(SD.Item(i).NodeID).Properties.Item(j)
'       If pd.RefTo = "" Then
'         If pd.TheType = "Image" Then
'            txt = txt & vbCrLf & "        if IsNull(" & SD.Item(i).TheName & "." & pd.TheName & ") then"
'            txt = txt & vbCrLf & "          Values.Value(" & k & ") = """""
'            txt = txt & vbCrLf & "        else"
'            txt = txt & vbCrLf & "          Values.Value(" & k & ") = ""Картинка"""
'            txt = txt & vbCrLf & "        end if"
'         Else
'            If pd.TheType = "Enum" Then
'              arr = Split(pd.enumItems, vbCrLf)
'              txt = txt & vbCrLf & "        Values.Value(" & k & ") ="""""
'              txt = txt & vbCrLf & "        on error resume next"
'              For l = 0 To UBound(arr)
'                txt = txt & vbCrLf & "        if " & SD.Item(i).TheName & "." & pd.TheName & "=" & l & " then Values.Value(" & k & ") = """ & arr(l) & """"
'              Next
'            Else
'              txt = txt & vbCrLf & "        Values.Value(" & k & ") = left(replace(" & SD.Item(i).TheName & "." & pd.TheName & ",vbcrlf,"" ""),255)"
'            End If
'         End If
'
'         k = k + 1
'       Else
'         txt = txt & vbCrLf & " if not " & SD.Item(i).TheName & "." & pd.TheName & " is nothing then"
'         txt = txt & vbCrLf & "        Values.Value(" & k & ") = " & SD.Item(i).TheName & "." & pd.TheName & ".brief"
'         txt = txt & vbCrLf & " else"
'         txt = txt & vbCrLf & "        Values.Value(" & k & ") = ""Не задано"""
'         txt = txt & vbCrLf & " end if"
'         k = k + 1
'       End If
'     Next
'    txt = txt & vbCrLf & "          List.RowBookmark(RowIndex) = """ & SD.Item(i).id & """ & " & SD.Item(i).TheName & ".id"
'    txt = txt & vbCrLf & "         End If 'RowIndex "
'    txt = txt & vbCrLf & "      End If 'LastCollection "
'  Next
'  txt = txt & vbCrLf & ""
'  MakeURD = txt
'End Function
'
'
'
'Private Function Expander(ByVal pname As String, ByVal mask As Boolean) As String
'Dim txt As String, i As Long, j As Long, s As String
'txt = ""
'On Error GoTo bye
'      txt = txt & vbCrLf & "private sub Expand(byval key as string)"
'      txt = txt & vbCrLf & " dim id as string , struct as string, child as string"
'      txt = txt & vbCrLf & " dim item as object, i as long, nid as string"
'      txt = txt & vbCrLf & " id = mid(key,39,38)"
'      txt = txt & vbCrLf & " struct = left(key,38)"
'      txt = txt & vbCrLf & " child = right(key,38)"
'      txt = txt & vbCrLf & " if trim(struct)="""" and trim(id)="""" then "
'      txt = txt & vbCrLf & "   set item =" & pname
'      txt = txt & vbCrLf & " else"
'      txt = txt & vbCrLf & "    set item =" & pname & ".FindObject(struct,id)"
'      txt = txt & vbCrLf & " end if"
'      txt = txt & vbCrLf & " tree.nodes.item(key).sorted=true"
'      txt = txt & vbCrLf & " select case child"
'
'      For i = 1 To SD.Count
'          txt = txt & vbCrLf & " case """ & SD.Item(i).id & """ ' " & SD.Item(i).TheName
'          txt = txt & vbCrLf & "    item." & SD.Item(i).TheName & ".refresh"
'          txt = txt & vbCrLf & "    for i=1 to item." & SD.Item(i).TheName & ".count"
'          txt = txt & vbCrLf & "    nid =child & item." & SD.Item(i).TheName & ".item(i).id"
'
'          If mask Then
'            txt = txt & vbCrLf & "    if mask =""" & SD.Item(i).id & """ then"
'            txt = txt & vbCrLf & "       tree.nodes.add key,tvwchild,nid,  item." & SD.Item(i).TheName & ".item(i).brief,4,4 "
'            txt = txt & vbCrLf & "    else"
'            txt = txt & vbCrLf & "       tree.nodes.add key,tvwchild,nid,  item." & SD.Item(i).TheName & ".item(i).brief,1,1 "
'            txt = txt & vbCrLf & "    end if"
'
'          Else
'            txt = txt & vbCrLf & "    tree.nodes.add key,tvwchild,nid,  item." & SD.Item(i).TheName & ".item(i).brief,1,1 "
'          End If
'
'          For j = 1 To SD.Count
'            If SD.Item(j).ParentID = SD.Item(i).id Then
'              ' show only parent in the choose tree
'              If mask Then
'                txt = txt & vbCrLf & " if " & pname & ".StorageManager.IsDescendant(mask,""" & SD.Item(j).id & """) then"
'              End If
'              txt = txt & vbCrLf & "    ' " & SD.Item(j).TheName
'              txt = txt & vbCrLf & "    tree.nodes.add( nid,tvwchild,nid & """ & SD.Item(j).id & """ ,""" & SD.Item(j).TheName & """,2,2).tag=""ToExpand"""
'              txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & SD.Item(j).id & """,tvwchild, createguid2(),""Expanding ..."",3,3).tag=""ToDelete"""
'              If mask Then
'                txt = txt & vbCrLf & " end if "
'              End If
'            End If
'          Next
'          If SD.Item(i).IsRepeatable And SD.Item(i).LoopTo <> "" Then
'              ' show only parent in the choose tree
'              If mask Then
'                txt = txt & vbCrLf & " if " & pname & ".StorageManager.IsDescendant(mask,""" & SD.Item(i).LoopTo & """) then"
'              End If
'              txt = txt & vbCrLf & "    ' loop to " & SD.Item(SD.Item(i).LoopTo).TheName
'              txt = txt & vbCrLf & "    tree.nodes.add( nid,tvwchild,nid & """ & SD.Item(SD.Item(i).LoopTo).id & """ ,""" & SD.Item(SD.Item(i).LoopTo).TheName & """,2,2).tag=""ToExpand"""
'              txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & SD.Item(SD.Item(i).LoopTo).id & """,tvwchild, createguid2(),""Expanding ..."",3,3).tag=""ToDelete"""
'              If mask Then
'                txt = txt & vbCrLf & " end if "
'              End If
'          End If
'          txt = txt & vbCrLf & "    next"
'
'      Next
'
'
'      txt = txt & vbCrLf & "end select"
'      txt = txt & vbCrLf & "end sub"
'      Expander = txt
'      Exit Function
'
'bye:
'      MsgBox pname & vbCrLf & Err.Description, vbOKOnly
'      'Stop
'      'Resume
'End Function
'
'
'Public Sub CreateEditForm(vbp As VBProject, wdp As StructDef, ByVal prjPath As String)
'    Dim vbc As VBComponent, vbf As VBForm, pp As Long
'    Dim SaveFields As String, LoadFields As String
'    Dim mproc As String, CheckFields As String, NullFields As String, txt As String
'    ' check existance
'    Dim vbc_i As Long
'    For vbc_i = 1 To vbp.VBComponents.Count
'      Set vbc = vbp.VBComponents.Item(vbc_i)
'      If vbc.Name = "frm" & wdp.TheName Then
'        Exit Sub
'      End If
'    Next
'
'    ' create edit form
'    Set vbc = vbp.VBComponents.Add(vbext_ct_VBForm)
'    vbc.Name = "frm" & wdp.TheName
'    vbc.Properties("Caption") = wdp.TheName
'    vbc.Properties("BorderStyle") = 3
'    vbc.Properties("Height") = 440 * Screen.TwipsPerPixelY
'    vbc.Properties("Width") = 440 * Screen.TwipsPerPixelX
'    vbc.Properties("Left") = 0
'    vbc.Properties("Top") = 0
'    vbc.Properties("StartupPosition") = 1
'
'    'On Error GoTo eee
'    'Set vbc.Designer.Properties("Icon").Value = LoadPicture()
'    'GoTo fff
'eee:
'    'Err.Clear
'    'Resume fff
'
'ccc:
'    'Set vbc.Properties("Icon").Value = LoadPicture()
'
'fff:
'    Set vbf = vbc.Designer
'
'    Dim pos As Long, fld As String
'    Dim COLUMN As Long, MINPOS As Long
'
'    On Error GoTo bye
'    pos = 5 * Screen.TwipsPerPixelY
'
'    txt = ""
'    txt = txt & vbCrLf & "   public OK as boolean"
'    txt = txt & vbCrLf & "   public item as object"
'    txt = txt & vbCrLf & "   Public NotFirstTime As Boolean"
'    txt = txt & vbCrLf & ""
'    vbc.CodeModule.InsertLines vbc.CodeModule.CountOfDeclarationLines + 1, txt
'
'
'    SaveFields = ""
'    LoadFields = ""
'
'    COLUMN = 0
'    MINPOS = pos
'
'
'
'    ' place controls to edit form
'    Dim i As Long
'    Dim P As PropertyDef
'    For i = 1 To ND.Item(wdp.NodeID).Properties.Count
'      Set P = ND.Item(wdp.NodeID).Properties.Item(i)
'      GenerateControls vbp, vbc, wdp, P, pos, SaveFields, LoadFields, COLUMN, MINPOS, prjPath
'    Next
'
'    'adjust form size
'    If COLUMN = 0 Then
'     vbc.Properties("Height") = pos + 60 * Screen.TwipsPerPixelY
'     vbc.Properties("Width") = 270 * Screen.TwipsPerPixelY
'    Else
'     vbc.Properties("Height") = 480 * Screen.TwipsPerPixelY
'     'If ((40 + 210 * (COLUMN + 1))) < 600 Then
'      vbc.Properties("Width") = (40 + 210 * (COLUMN + 1)) * Screen.TwipsPerPixelX
'     'Else
'     ' vbc.Properties("Width") = 600 * Screen.TwipsPerPixelX
'     'End If
'    End If
'
'
'
'
'    ' OK / cancel buttons
'    With vbf.VBControls.Add("VB.CommandButton")
'     .Properties("NAME") = "cmdOK"
'     .Properties("Caption") = "&OK"
'     .Properties("Default") = False
'     .Properties("Top") = vbc.Properties("Height") - 52 * Screen.TwipsPerPixelY
'     .Properties("Left") = vbc.Properties("Width") - 150 * Screen.TwipsPerPixelX
'     .Properties("Height") = 23 * Screen.TwipsPerPixelY
'     .Properties("Width") = 55 * Screen.TwipsPerPixelY
'     .Properties("ToolTipText") = wdp.Comment & vbCrLf & ND.Item(wdp.NodeID).Comment
'    End With
'
'    With vbf.VBControls.Add("VB.CommandButton")
'     .Properties("NAME") = "cmdCancel"
'     .Properties("Caption") = "Отмена"
'     .Properties("Cancel") = True
'     .Properties("CausesValidation") = False
'     .Properties("Top") = vbc.Properties("Height") - 52 * Screen.TwipsPerPixelY
'     .Properties("Left") = vbc.Properties("Width") - 85 * Screen.TwipsPerPixelX
'     .Properties("Height") = 23 * Screen.TwipsPerPixelY
'     .Properties("Width") = 65 * Screen.TwipsPerPixelY
'    End With
'
'    ' Cancel button proc
'    pp = vbc.CodeModule.CreateEventProc("Click", "cmdCancel")
'    vbc.CodeModule.InsertLines pp + 1, "OK=false" & vbCrLf & "me.hide"
'
'    pos = pos + 25 * Screen.TwipsPerPixelY
'
'
'    pp = vbc.CodeModule.CreateEventProc("Click", "cmdOK")
'    vbc.CodeModule.InsertLines pp + 1, "OK=true" & vbCrLf & "me.hide"
'
'    pp = vbc.CodeModule.CreateEventProc("Activate", "Form")
'    txt = " if NotFirstTime then exit sub"
'    txt = txt & vbCrLf & LoadFields
'    txt = txt & vbCrLf & "notFirsttime = true"
'    vbc.CodeModule.InsertLines pp + 1, txt
'
'
'    pp = vbc.CodeModule.CountOfLines
'    txt = "private sub Changing"
'    txt = txt & vbCrLf & "if not notfirsttime then exit sub"
'    txt = txt & vbCrLf & SaveFields
'    txt = txt & vbCrLf & "end sub"
'    vbc.CodeModule.InsertLines pp + 1, txt
'
'
'
'    ' close editor windows
'    vbc.CodeModule.CodePane.Window.Close
'    If vbc.HasOpenDesigner Then
'      vbc.DesignerWindow.Visible = False
'    End If
'
'
'    vbc.SaveAs App.Path & "\" & prjPath & "\frm" & wdp.TheName & ".frm"
'
'    ' EventWrite VBGetResString(1080) & wdp.TheName & VBGetResString(1075)
'    Exit Sub
'bye:
'
'    MsgBox Err.Description
'
'
'End Sub
'
'
'Private Sub MakeDialog(ByVal pname As String)
'    Dim vbc As VBComponent, vbf As VBForm, vc As VBControl
'    Dim txt As String, pos As Long, s As String, i, j, k
'    On Error GoTo bye
'
'    ' test existance
'    Dim vbc_i As Long
'    For vbc_i = 1 To vbp.VBComponents.Count
'      Set vbc = vbp.VBComponents.Item(vbc_i)
'      If vbc.Name = "Module1" Then
'        GoTo found1
'      End If
'    Next
'    Exit Sub
'
'
'
'found1:
'
'    txt = ""
'    txt = txt & vbCrLf & "public " & pname & "  as  object '" & pname & ".Application"
'    vbc.CodeModule.InsertLines vbc.CodeModule.CountOfDeclarationLines + 1, txt
'    vbc.SaveAs App.Path & "\" & pname & "\Module1.bas"
'
'
'
'    For vbc_i = 1 To vbp.VBComponents.Count
'      Set vbc = vbp.VBComponents.Item(vbc_i)
'      If vbc.Name = "Dialog" Then
'        GoTo found
'      End If
'    Next
'    Exit Sub
'found:
'
'    ' create view form
'    vbc.Properties("Caption") = pname & " item choose"
'    vbc.Properties("StartupPosition") = 1
'
'    If vbc.Type = vbext_ct_VBForm Then
'       Set vbf = vbc.Designer
'
'
'''''''''''''''''''''''''''' Expand
'      txt = Expander(pname, True)
'      pos = vbc.CodeModule.CountOfLines
'      vbc.CodeModule.InsertLines pos + 1, txt
'
'
'
''''''''''''''''''''''''''' Init
'      txt = ""
'      txt = txt & vbCrLf & "private sub Init()"
'      txt = txt & vbCrLf & "  tree.Nodes.Clear"
'      txt = txt & vbCrLf & "  dim id as string, id2 as string, i as long, idroot as string"
'      txt = txt & vbCrLf & "  IDroot=""" & ApplicationID & ApplicationID & """"
'      txt = txt & vbCrLf & "  tree.nodes.add( , ,idroot,""" & pname & """,2,2).tag=""OK"""
'
'      For i = 1 To SD.Count
'        If SD.Item(i).ParentID = "" Then
'
'          txt = txt & vbCrLf & " if " & pname & ".StorageManager.IsDescendant(mask,""" & SD.Item(i).id & """) then"
'          txt = txt & vbCrLf & "   ID=idroot & """ & SD.Item(i).id & """"
'          txt = txt & vbCrLf & "   tree.nodes.add( idroot,tvwchild,id,""" & SD.Item(i).TheName & """,2,2).tag = ""ToExpand"""
'          txt = txt & vbCrLf & "   tree.nodes.add(  id,tvwchild,createguid2(),""Expanding ... "",3,3).tag = ""ToDelete"""
'          txt = txt & vbCrLf & " end if"
'        End If
'      Next
'      txt = txt & vbCrLf & "end sub"
'      vbc.CodeModule.InsertLines vbc.CodeModule.CountOfLines + 1, txt
'      vbc.SaveAs App.Path & "\" & pname & "\Dialog.frm"
'
'    End If
'    Exit Sub
'bye:
'
'    MsgBox pname & vbCrLf & Err.Description, vbOKOnly
'    'Stop
'    'Resume
'
'End Sub
'
