Attribute VB_Name = "GridTreeSupport"
Option Explicit

' if this part is tree so create expand and load function
Public Function PartTreeLocalSupport(st As PART) As String
Dim txt As String, i As Long, j As Long, s As String, mm As Long
If st.PartType <> 2 Then Exit Function
txt = ""
On Error GoTo bye

  txt = txt & vbCrLf & CommentItem("public sub LoadTotree(tree as object,byval key as string)", "Загрузка информации в дерево")
  txt = txt & vbCrLf & "      dim tid as string 'only for tree styled structure"
  txt = txt & vbCrLf & "      tid =id"
  txt = txt & vbCrLf & "      if key ="""" then"
  txt = txt & vbCrLf & "        tree.nodes.add( ,0,tid,  brief(true)).tag=""Row"" "
  txt = txt & vbCrLf & "      else"
  txt = txt & vbCrLf & "        tree.nodes.add( key,4,tid,  brief(true)).tag=""Row"" "
  txt = txt & vbCrLf & "      end if"
  txt = txt & vbCrLf & "      tree.nodes.add( tid ,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
  txt = txt & vbCrLf & "end sub"

  txt = txt & vbCrLf & CommentItem("public sub ExpandPart(tree as object,byval key as string)", "Загрузка в дерево данных раздела")
  txt = txt & vbCrLf & " dim item as object, i as long, nid as string, tmpid as string"
  txt = txt & vbCrLf & " dim tidx as long, tid as string 'only for tree styled structure"
  txt = txt & vbCrLf & " set item = Application.FindrowObject(PartName,key)"
  txt = txt & vbCrLf & " if not item is me then"
  txt = txt & vbCrLf & "   item.ExpandPart tree,key"
  txt = txt & vbCrLf & "   exit sub"
  txt = txt & vbCrLf & " end if"
  txt = txt & vbCrLf & " tree.nodes.item(key).sorted=true"
  txt = txt & vbCrLf & "    for tidx=1 to item." & st.name & ".count"
  txt = txt & vbCrLf & "      ' " & st.name
  txt = txt & vbCrLf & "      tid =item." & st.name & ".item(tidx).id "
  txt = txt & vbCrLf & "      tree.nodes.add( key,4,tid,  item." & st.name & ".item(tidx).brief(true)).tag=""Row"" "
  txt = txt & vbCrLf & "      tree.nodes.add( tid ,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
  txt = txt & vbCrLf & "    next 'tidx"
  txt = txt & vbCrLf & "end sub"
  PartTreeLocalSupport = txt
  Exit Function

bye:
  MsgBox Err.Description, vbOKOnly
  'Stop
  'Resume
End Function


' STRUCT.FillTree
Public Function PartFillTreeLocal(st As PART) As String
Dim txt As String, i As Long, j As Long, s As String, mm As Long
If st.PartType <> 2 Then Exit Function
txt = ""
On Error GoTo bye
  txt = txt & vbCrLf & CommentItem("public sub FillTree(tree as object)", "Загрузка данных раздела в дерево (только сам раздел)")
  txt = txt & vbCrLf & " dim tidx as long, tid as string"
  txt = txt & vbCrLf & "    for tidx=1 to count"
  txt = txt & vbCrLf & "      ' " & st.name
  txt = txt & vbCrLf & "      tid = item(tidx).id"
  txt = txt & vbCrLf & "      tree.nodes.add( ,0,tid,  item(tidx).brief(true)).tag=""Row"" "
  txt = txt & vbCrLf & "      tree.nodes.add( tid ,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
  txt = txt & vbCrLf & "    next 'tidx"
  txt = txt & vbCrLf & "end sub"
  PartFillTreeLocal = txt
  Exit Function

bye:
  MsgBox Err.Description, vbOKOnly
  'Stop
  'Resume
End Function


' Fill object to global tree
Public Sub AppFillTreeGlobal(obj As OBJECTTYPE, ByRef body As String)
  body = body & vbCrLf & CommentItem("public sub FillTree( tree as object, byval pkey as string, byval mode as string, optional Mask as string ="""", optional CollectionName as string="""" )", "Загрузка корня объекта в дерево")
  body = body & vbCrLf & " dim node as object,key as string"
  body = body & vbCrLf & "If CollectionName = """" Then"
  body = body & vbCrLf & " key = createguid2() & ID"
  body = body & vbCrLf & " if pkey ="""" then"
  body = body & vbCrLf & "   set node=tree.nodes.add(,0,key,Brief)"
  body = body & vbCrLf & " else"
  body = body & vbCrLf & "   set node=tree.nodes.add(pkey,4,key,Brief)"
  body = body & vbCrLf & " end if"
  body = body & vbCrLf & " node.tag=""object"""
  body = body & vbCrLf & "else"
  body = body & vbCrLf & " key="""" "
  body = body & vbCrLf & "end if"
  
  Dim mm As Long, ss As Long
  For mm = 1 To obj.OBJECTMODE.Count
    body = body & vbCrLf & "  if mode = """ & obj.OBJECTMODE.item(mm).name & """ then "
    For ss = 1 To obj.PART.Count
      If IsPresent(obj.PART.item(ss), obj.OBJECTMODE.item(mm).name) Then
        body = body & vbCrLf & "If CollectionName = """"  or CollectionName=""" & obj.PART.item(ss).name & """ Then"
        body = body & vbCrLf & "  if Mask<>"""" then"
        body = body & vbCrLf & "    if application.MTZSession.IsDescendant(mask,""" & obj.PART.item(ss).name & """) then"
        body = body & vbCrLf & "       if key="""" then"
        body = body & vbCrLf & "         set node=tree.nodes.add(,0,createguid2() & ID &  """ & obj.PART.item(ss).name & """,""" & NoLF(obj.PART.item(ss).Caption) & """)"
        body = body & vbCrLf & "       else"
        body = body & vbCrLf & "         set node=tree.nodes.add(key,4,createguid2() & ID & """ & obj.PART.item(ss).name & """,""" & NoLF(obj.PART.item(ss).Caption) & """)"
        body = body & vbCrLf & "       end if"
        body = body & vbCrLf & "       node.tag=""" & obj.PART.item(ss).name & """"
        body = body & vbCrLf & "       ' node for <+> item"
        body = body & vbCrLf & "       tree.Nodes.Add(node.key, 4, CreateGUID2(), ""Expanding ..."").Tag = ""ToDelete"""
        body = body & vbCrLf & "    end if"
        body = body & vbCrLf & "  else"
        body = body & vbCrLf & "    if key="""" then"
        body = body & vbCrLf & "      set node=tree.nodes.add(,0,createguid2() & ID &  """ & obj.PART.item(ss).name & """,""" & NoLF(obj.PART.item(ss).Caption) & """)"
        body = body & vbCrLf & "    else"
        body = body & vbCrLf & "      set node=tree.nodes.add(key,4,createguid2() & ID  & """ & obj.PART.item(ss).name & """,""" & NoLF(obj.PART.item(ss).Caption) & """)"
        body = body & vbCrLf & "    end if"
        body = body & vbCrLf & "    node.tag=""" & obj.PART.item(ss).name & """"
        body = body & vbCrLf & "    ' node for <+> item"
        body = body & vbCrLf & "    tree.Nodes.Add(node.key, 4, CreateGUID2(), ""Expanding ..."").Tag = ""ToDelete"""
        body = body & vbCrLf & "  end if"
        body = body & vbCrLf & "end if"
        
      End If
    Next
    body = body & vbCrLf & "  end if"
  Next
  
  ' no mode
  body = body & vbCrLf & "  if mode = """" then "
  For ss = 1 To obj.PART.Count
    If IsPresent(obj.PART.item(ss), """") Then
      body = body & vbCrLf & "If CollectionName = """"  or CollectionName=""" & obj.PART.item(ss).name & """ Then"
      body = body & vbCrLf & "  if Mask<>"""" then"
      body = body & vbCrLf & "    if application.MTZSession.IsDescendant(mask,""" & obj.PART.item(ss).name & """) then"
      body = body & vbCrLf & "    if key="""" then"
      body = body & vbCrLf & "       set node=tree.nodes.add(,0,createguid2() & ID &  """ & obj.PART.item(ss).name & """,""" & NoLF(obj.PART.item(ss).Caption) & """)"
      body = body & vbCrLf & "    else"
      body = body & vbCrLf & "       set node=tree.nodes.add(key,4,createguid2() & ID  & """ & obj.PART.item(ss).name & """,""" & NoLF(obj.PART.item(ss).Caption) & """)"
      body = body & vbCrLf & "    end if"
      body = body & vbCrLf & "       node.tag=""" & obj.PART.item(ss).name & """"
      body = body & vbCrLf & "       ' node for <+> item"
      body = body & vbCrLf & "       tree.Nodes.Add(node.key, 4, CreateGUID2(), ""Expanding ..."").Tag = ""ToDelete"""
      body = body & vbCrLf & "    end if"
      body = body & vbCrLf & "  else"
      body = body & vbCrLf & "    if key="""" then"
      body = body & vbCrLf & "       set node=tree.nodes.add(,0,createguid2() & ID &  """ & obj.PART.item(ss).name & """,""" & NoLF(obj.PART.item(ss).Caption) & """)"
      body = body & vbCrLf & "    else"
      body = body & vbCrLf & "       set node=tree.nodes.add(key,4,createguid2() & ID &  """ & obj.PART.item(ss).name & """,""" & NoLF(obj.PART.item(ss).Caption) & """)"
      body = body & vbCrLf & "    end if"
      body = body & vbCrLf & "    node.tag=""" & obj.PART.item(ss).name & """"
      body = body & vbCrLf & "    ' node for <+> item"
      body = body & vbCrLf & "    tree.Nodes.Add(node.key, 4, CreateGUID2(), ""Expanding ..."").Tag = ""ToDelete"""
      body = body & vbCrLf & "  end if"
      body = body & vbCrLf & "end if"
    End If
  Next
  body = body & vbCrLf & "  end if"
  
  
  body = body & vbCrLf & ""
  body = body & vbCrLf & "end sub"

End Sub





' Expand parts to global tree
Public Function AppExpandTreeGlobal(ot As OBJECTTYPE) As String ', ByVal mask As Boolean
Dim txt As String, i As Long, j As Long, s As String, mm As Long
Dim st As PART
txt = ""
On Error GoTo bye
      txt = txt & vbCrLf & CommentItem("public sub Expand(tree as object,byval key as string, byval mode as string, optional Mask as string ="""")", "Раскрытие объекта при выборе узла в дереве")
      txt = txt & vbCrLf & " dim id as string , struct as string, child as string"
      txt = txt & vbCrLf & " dim item as object, i as long, nid as string, tmpid as string"
      txt = txt & vbCrLf & " dim tidx as long, tid as string 'only for tree styled structure"
      txt = txt & vbCrLf & " id = mid(key,39,38)"
      txt = txt & vbCrLf & " on error resume next"
      txt = txt & vbCrLf & " struct = right(tree.nodes.item(key).parent.parent.key,len(tree.nodes.item(key).parent.parent.key)-76)"
      txt = txt & vbCrLf & " child = right(key,len(key)-76)"
      txt = txt & vbCrLf & " if trim(struct)=""""  then "
      txt = txt & vbCrLf & "   set item =manager.GetInstanceObject(id)"
      txt = txt & vbCrLf & "   if  item is nothing then exit sub"
      txt = txt & vbCrLf & "   If Not item Is Me Then"
      txt = txt & vbCrLf & "     item.Expand tree, Key, mode,mask"
      txt = txt & vbCrLf & "     Exit Sub"
      txt = txt & vbCrLf & "   End If"
      txt = txt & vbCrLf & " else"
      txt = txt & vbCrLf & "    set item =FindRowObject(struct,id)"
      txt = txt & vbCrLf & "    if  item is nothing then exit sub"
      txt = txt & vbCrLf & "    call item.Expand(tree,key,mode,mask)"
      txt = txt & vbCrLf & "    exit sub"
      txt = txt & vbCrLf & " end if"
      txt = txt & vbCrLf & " tree.nodes.item(key).sorted=true"
      
      For mm = 1 To ot.OBJECTMODE.Count
        txt = txt & vbCrLf & "if mode=""" & ot.OBJECTMODE.item(mm).name & """ then"
      
        txt = txt & vbCrLf & " select case child"
  
        For i = 1 To ot.PART.Count
            If IsPresent(ot.PART.item(i), ot.OBJECTMODE.item(mm).name) Then
              
              txt = txt & vbCrLf & " case """ & ot.PART.item(i).name & """ "
              txt = txt & vbCrLf & "    item." & ot.PART.item(i).name & ".refresh"
              txt = txt & vbCrLf & "    for i=1 to item." & ot.PART.item(i).name & ".count"
              txt = txt & vbCrLf & "    nid =createguid2() &  item." & ot.PART.item(i).name & ".item(i).id"
              txt = txt & vbCrLf & "    tree.nodes.add( key,4,nid,  item." & ot.PART.item(i).name & ".item(i).brief(true)).tag=""Row"" "
    
              ' Add nodes for Tree Children
              If ot.PART.item(i).PartType = PartType_Derevo Then
                    txt = txt & vbCrLf & "if Mask<>"""" then"
                    txt = txt & vbCrLf & "  if application.MTZSession.IsDescendant(mask,""" & ot.PART.item(i).name & """) then"
                    txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).name & """ ,""" & NoLF(ot.PART.item(i).Caption) & """).tag=""" & ot.PART.item(i).name & """"
                    txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    txt = txt & vbCrLf & "  end if"
                    txt = txt & vbCrLf & "else"
                    txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).name & """ ,""" & NoLF(ot.PART.item(i).Caption) & """).tag=""" & ot.PART.item(i).name & """"
                    txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    txt = txt & vbCrLf & "end if"
              End If
    
    
              ' Add Slave parts
              For j = 1 To ot.PART.item(i).PART.Count
                If IsPresent(ot.PART.item(i).PART.item(j), ot.OBJECTMODE.item(mm).name) Then
                  txt = txt & vbCrLf & "if Mask<>"""" then"
                  txt = txt & vbCrLf & "  if application.MTZSession.IsDescendant(mask,""" & ot.PART.item(i).PART.item(j).name & """) then"
                  txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).PART.item(j).name & """ ,""" & NoLF(ot.PART.item(i).PART.item(j).Caption) & """).tag=""" & ot.PART.item(i).PART.item(j).name & """"
                  txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).PART.item(j).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                  txt = txt & vbCrLf & "  end if"
                  txt = txt & vbCrLf & "else"
                  txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).PART.item(j).name & """ ,""" & NoLF(ot.PART.item(i).PART.item(j).Caption) & """).tag=""" & ot.PART.item(i).PART.item(j).name & """"
                  txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).PART.item(j).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                  txt = txt & vbCrLf & "end if"
                End If
              Next
              
              txt = txt & vbCrLf & "    next"
            End If ' IsPresent
        Next
  
        txt = txt & vbCrLf & "end select"
        
        txt = txt & vbCrLf & "end if ' mode=""" & ot.OBJECTMODE.item(mm).name & """"
      Next ' mode
      
     ' no mode
      txt = txt & vbCrLf & "if mode="""" then"
      txt = txt & vbCrLf & " select case child"
      For i = 1 To ot.PART.Count
          If IsPresent(ot.PART.item(i), "") Then
            txt = txt & vbCrLf & " case """ & ot.PART.item(i).name & """ "
            txt = txt & vbCrLf & "    item." & ot.PART.item(i).name & ".refresh"
            txt = txt & vbCrLf & "    for i=1 to item." & ot.PART.item(i).name & ".count"
            txt = txt & vbCrLf & "    nid =createguid2() &  item." & ot.PART.item(i).name & ".item(i).id  "
            txt = txt & vbCrLf & "    tree.nodes.add( key,4,nid,  item." & ot.PART.item(i).name & ".item(i).brief(true)).tag=""Row"" "
            
            ' Add Folder for tree children
            If ot.PART.item(i).PartType = 2 Then
              txt = txt & vbCrLf & "if Mask<>"""" then"
              txt = txt & vbCrLf & "  if application.MTZSession.IsDescendant(mask,""" & ot.PART.item(i).name & """) then"
              txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).name & """ ,""" & NoLF(ot.PART.item(i).Caption) & """).tag=""" & ot.PART.item(i).name & """"
              txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
              txt = txt & vbCrLf & "  end if"
              txt = txt & vbCrLf & "else"
              txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).name & """ ,""" & NoLF(ot.PART.item(i).Caption) & """).tag=""" & ot.PART.item(i).name & """"
              txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
              txt = txt & vbCrLf & "end if"
            End If
            
            ' Add Folders for Salve parts
            For j = 1 To ot.PART.item(i).PART.Count
                If IsPresent(ot.PART.item(i).PART.item(j), "") Then
                  txt = txt & vbCrLf & "if Mask<>"""" then"
                  txt = txt & vbCrLf & "  if application.MTZSession.IsDescendant(mask,""" & ot.PART.item(i).PART.item(j).name & """) then"
                  txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).PART.item(j).name & """ ,""" & NoLF(ot.PART.item(i).PART.item(j).Caption) & """).tag=""" & ot.PART.item(i).PART.item(j).name & """"
                  txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).PART.item(j).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                  txt = txt & vbCrLf & "  end if"
                  txt = txt & vbCrLf & "else"
                  txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).PART.item(j).name & """ ,""" & NoLF(ot.PART.item(i).PART.item(j).Caption) & """).tag=""" & ot.PART.item(i).PART.item(j).name & """"
                  txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).PART.item(j).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                  txt = txt & vbCrLf & "end if"
                End If
            Next
            
            txt = txt & vbCrLf & "    next"
          End If ' IsPresent
      Next
      
      txt = txt & vbCrLf & " end select"
      txt = txt & vbCrLf & "end if ' mode="""""
      'No mode
      
      
      txt = txt & vbCrLf & "end sub"
      AppExpandTreeGlobal = txt
      Exit Function

bye:
      MsgBox Err.Description, vbOKOnly
      'Stop
      'Resume
End Function

' Expand non first level part to global tree
Public Function PartExpandTreeGlobal(st As PART) As String ', ByVal mask As Boolean
Dim txt As String, i As Long, j As Long, s As String, mm As Long
Dim ot As OBJECTTYPE
txt = ""
On Error GoTo bye
      txt = txt & vbCrLf & CommentItem("public sub Expand(tree as object,byval key as string, byval mode as string, optional Mask as string = """")", "Раскрытие раздела при выборе узла в глобальном дереве")
      txt = txt & vbCrLf & " dim id as string , struct as string, child as string"
      txt = txt & vbCrLf & " dim item as object, i as long, nid as string, tmpid as string"
      txt = txt & vbCrLf & " dim tidx as long, tid as string 'only for tree styled structure"
      txt = txt & vbCrLf & " on error resume next"
      txt = txt & vbCrLf & " id = mid(key,39,38)"
      txt = txt & vbCrLf & " struct = right(tree.nodes.item(key).parent.parent.key,len(tree.nodes.item(key).parent.parent.key)-76)"
      txt = txt & vbCrLf & " child = right(key,len(key)-76)"
      txt = txt & vbCrLf & " if id<>m_id  then "
      txt = txt & vbCrLf & "   exit sub"
      txt = txt & vbCrLf & " else"
      txt = txt & vbCrLf & "    set item =me"
      txt = txt & vbCrLf & " end if"
      txt = txt & vbCrLf & " tree.nodes.item(key).sorted=true"
      
      Set ot = TypeForStruct(st)
      
      For mm = 1 To ot.OBJECTMODE.Count
        txt = txt & vbCrLf & "if mode=""" & ot.OBJECTMODE.item(mm).name & """ then"
      
        txt = txt & vbCrLf & " select case child"
        
      ' self Expand
      If st.PartType = 2 Then
          txt = txt & vbCrLf & " case """ & st.name & """ "
          txt = txt & vbCrLf & "    item." & st.name & ".refresh"
          txt = txt & vbCrLf & "    for i=1 to item." & st.name & ".count"
          txt = txt & vbCrLf & "    nid =createguid2()  & item." & st.name & ".item(i).id "
          txt = txt & vbCrLf & "    tree.nodes.add( key,4,nid,  item." & st.name & ".item(i).brief(true)).tag=""Row"" "
          
          ' next self level
          txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & st.name & """ ,""" & NoLF(st.Caption) & """).tag=""" & st.name & """"
          txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & st.name & """,4, createguid2(),""Expanding .."").tag=""ToDelete"""
    
          For i = 1 To st.PART.Count
            If IsPresent(st.PART.item(i), ot.OBJECTMODE.item(mm).name) Then
              txt = txt & vbCrLf & "   ' " & st.PART.item(i).name
              txt = txt & vbCrLf & "   if Mask<>"""" then"
              txt = txt & vbCrLf & "     if application.MTZSession.IsDescendant(mask,""" & st.PART.item(i).name & """) then"
              txt = txt & vbCrLf & "      tree.nodes.add( nid,4,nid & """ & st.PART.item(i).name & """ ,""" & NoLF(st.PART.item(i).Caption) & """).tag=""" & st.PART.item(i).name & """"
              txt = txt & vbCrLf & "      tree.nodes.add( nid & """ & st.PART.item(i).name & """,4, createguid2(),""Expanding .."").tag=""ToDelete"""
              txt = txt & vbCrLf & "     end if"
              txt = txt & vbCrLf & "   else"
              txt = txt & vbCrLf & "     tree.nodes.add( nid,4,nid & """ & st.PART.item(i).name & """,""" & NoLF(st.PART.item(i).Caption) & """).tag=""" & st.PART.item(i).name & """"
              txt = txt & vbCrLf & "     tree.nodes.add( nid & """ & st.PART.item(i).name & """,4, createguid2(),""Expanding .."").tag=""ToDelete"""
              txt = txt & vbCrLf & "   end if ' " & st.PART.item(i).name
           End If
         Next
         txt = txt & vbCrLf & "    next 'i"
      End If
      
      
      ' expand child structures
        For i = 1 To st.PART.Count
            If IsPresent(st.PART.item(i), ot.OBJECTMODE.item(mm).name) Then
              txt = txt & vbCrLf & " case """ & st.PART.item(i).name & """ "
              txt = txt & vbCrLf & "    item." & st.PART.item(i).name & ".refresh"
              txt = txt & vbCrLf & "    for i=1 to item." & st.PART.item(i).name & ".count"
              txt = txt & vbCrLf & "      nid =createguid2() &  item." & st.PART.item(i).name & ".item(i).id & child "
              txt = txt & vbCrLf & "      tree.nodes.add( key,4,nid,  item." & st.PART.item(i).name & ".item(i).brief(true)).tag=""Row"" "
              
              ' if tree so add folder for tree children
              If st.PART.item(i).PartType = 2 Then
                txt = txt & vbCrLf & "   ' " & st.PART.item(i).name
                txt = txt & vbCrLf & "   if Mask<>"""" then"
                txt = txt & vbCrLf & "     if application.MTZSession.IsDescendant(mask,""" & st.PART.item(i).name & """) then"
                txt = txt & vbCrLf & "      tree.nodes.add( nid,4,nid & """ & st.PART.item(i).name & """ ,""" & NoLF(st.PART.item(i).Caption) & """).tag=""" & st.PART.item(i).name & """"
                txt = txt & vbCrLf & "      tree.nodes.add( nid & """ & st.PART.item(i).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                txt = txt & vbCrLf & "     end if"
                txt = txt & vbCrLf & "   else"
                txt = txt & vbCrLf & "     tree.nodes.add( nid,4,nid & """ & st.PART.item(i).name & """,""" & NoLF(st.PART.item(i).Caption) & """).tag=""" & st.PART.item(i).name & """"
                txt = txt & vbCrLf & "     tree.nodes.add( nid & """ & st.PART.item(i).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                txt = txt & vbCrLf & "   end if ' " & st.PART.item(i).name
              End If
              
              
              For j = 1 To st.PART.item(i).PART.Count
                If IsPresent(st.PART.item(i).PART.item(j), ot.OBJECTMODE.item(mm).name) Then
                    txt = txt & vbCrLf & "   ' " & st.PART.item(i).PART.item(j).name
                    txt = txt & vbCrLf & "   if Mask<>"""" then"
                    txt = txt & vbCrLf & "     if application.MTZSession.IsDescendant(mask,""" & st.PART.item(i).PART.item(j).name & """) then"
                    txt = txt & vbCrLf & "      tree.nodes.add( nid,4,nid & """ & st.PART.item(i).PART.item(j).name & """ ,""" & NoLF(st.PART.item(i).PART.item(j).Caption) & """).tag=""" & st.PART.item(i).PART.item(j).name & """"
                    txt = txt & vbCrLf & "      tree.nodes.add( nid & """ & st.PART.item(i).PART.item(j).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    txt = txt & vbCrLf & "     end if"
                    txt = txt & vbCrLf & "   else"
                    txt = txt & vbCrLf & "     tree.nodes.add( nid,4,nid & """ & st.PART.item(i).PART.item(j).name & """,""" & NoLF(st.PART.item(i).PART.item(j).Caption) & """).tag=""" & st.PART.item(i).PART.item(j).name & """"
                    txt = txt & vbCrLf & "     tree.nodes.add( nid & """ & st.PART.item(i).PART.item(j).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    txt = txt & vbCrLf & "   end if ' " & st.PART.item(i).PART.item(j).name
                End If
              Next
            
              txt = txt & vbCrLf & "    next"
            End If ' IsPresent
        Next ' st.part
  
        txt = txt & vbCrLf & "end select"
        
        txt = txt & vbCrLf & "end if ' mode=""" & ot.OBJECTMODE.item(mm).name & """"
      Next ' mode
      
     ' no mode
      txt = txt & vbCrLf & "if mode="""" then"
      txt = txt & vbCrLf & " select case child"
      
      
      ' self Expand
      If st.PartType = 2 Then
          txt = txt & vbCrLf & " case """ & st.name & """ "
          txt = txt & vbCrLf & "    item." & st.name & ".refresh"
          txt = txt & vbCrLf & "    for i=1 to item." & st.name & ".count"
          txt = txt & vbCrLf & "    nid =createguid2()  & item." & st.name & ".item(i).id "
          txt = txt & vbCrLf & "    tree.nodes.add( key,4,nid,  item." & st.name & ".item(i).brief(true)).tag=""Row"" "
          
          ' next self level
          txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & st.name & """ ,""" & NoLF(st.Caption) & """).tag=""" & st.name & """"
          txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & st.name & """,4, createguid2(),""Expanding .."").tag=""ToDelete"""
    
          For i = 1 To st.PART.Count
            If IsPresent(st.PART.item(i), "") Then
              txt = txt & vbCrLf & "   ' " & st.PART.item(i).name
              txt = txt & vbCrLf & "   if Mask<>"""" then"
              txt = txt & vbCrLf & "     if application.MTZSession.IsDescendant(mask,""" & st.PART.item(i).name & """) then"
              txt = txt & vbCrLf & "      tree.nodes.add( nid,4,nid & """ & st.PART.item(i).name & """ ,""" & NoLF(st.PART.item(i).Caption) & """).tag=""" & st.PART.item(i).name & """"
              txt = txt & vbCrLf & "      tree.nodes.add( nid & """ & st.PART.item(i).name & """,4, createguid2(),""Expanding .."").tag=""ToDelete"""
              txt = txt & vbCrLf & "     end if"
              txt = txt & vbCrLf & "   else"
              txt = txt & vbCrLf & "     tree.nodes.add( nid,4,nid & """ & st.PART.item(i).name & """,""" & NoLF(st.PART.item(i).Caption) & """).tag=""" & st.PART.item(i).name & """"
              txt = txt & vbCrLf & "     tree.nodes.add( nid & """ & st.PART.item(i).name & """,4, createguid2(),""Expanding .."").tag=""ToDelete"""
              txt = txt & vbCrLf & "   end if ' " & st.PART.item(i).name
           End If
         Next
         txt = txt & vbCrLf & "    next 'i"
      End If
      
      
      ' expand child structures
      For i = 1 To st.PART.Count
          ' present in default mode
          If IsPresent(st.PART.item(i), "") Then
            txt = txt & vbCrLf & " case """ & st.PART.item(i).name & """ "
            txt = txt & vbCrLf & "    item." & st.PART.item(i).name & ".refresh"
            txt = txt & vbCrLf & "    for i=1 to item." & st.PART.item(i).name & ".count"
            txt = txt & vbCrLf & "    nid =createguid2()  & item." & st.PART.item(i).name & ".item(i).id "
            txt = txt & vbCrLf & "    tree.nodes.add( key,4,nid,  item." & st.PART.item(i).name & ".item(i).brief(true)).tag=""Row"" "
            
            ' if tree so add folder for tree children
            If st.PART.item(i).PartType = 2 Then
                txt = txt & vbCrLf & "   ' " & st.PART.item(i).name
                txt = txt & vbCrLf & "   if Mask<>"""" then"
                txt = txt & vbCrLf & "     if application.MTZSession.IsDescendant(mask,""" & st.PART.item(i).name & """) then"
                txt = txt & vbCrLf & "      tree.nodes.add( nid,4,nid & """ & st.PART.item(i).name & """ ,""" & NoLF(st.PART.item(i).Caption) & """).tag=""" & st.PART.item(i).name & """"
                txt = txt & vbCrLf & "      tree.nodes.add( nid & """ & st.PART.item(i).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                txt = txt & vbCrLf & "     end if"
                txt = txt & vbCrLf & "   else"
                txt = txt & vbCrLf & "     tree.nodes.add( nid,4,nid & """ & st.PART.item(i).name & """,""" & NoLF(st.PART.item(i).Caption) & """).tag=""" & st.PART.item(i).name & """"
                txt = txt & vbCrLf & "     tree.nodes.add( nid & """ & st.PART.item(i).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                txt = txt & vbCrLf & "   end if ' " & st.PART.item(i).name
            End If
            
            For j = 1 To st.PART.item(i).PART.Count
                  ' present in default mode
                  If IsPresent(st.PART.item(i).PART.item(j), "") Then
                    txt = txt & vbCrLf & "   ' " & st.PART.item(i).PART.item(j).name
                    txt = txt & vbCrLf & "   if Mask<>"""" then"
                    txt = txt & vbCrLf & "     if application.MTZSession.IsDescendant(mask,""" & st.PART.item(i).PART.item(j).name & """) then"
                    txt = txt & vbCrLf & "      tree.nodes.add( nid,4,nid & """ & st.PART.item(i).PART.item(j).name & """ ,""" & NoLF(st.PART.item(i).PART.item(j).Caption) & """).tag=""" & st.PART.item(i).PART.item(j).name & """"
                    txt = txt & vbCrLf & "      tree.nodes.add( nid & """ & st.PART.item(i).PART.item(j).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    txt = txt & vbCrLf & "     end if"
                    txt = txt & vbCrLf & "   else"
                    txt = txt & vbCrLf & "     tree.nodes.add( nid,4,nid & """ & st.PART.item(i).PART.item(j).name & """,""" & NoLF(st.PART.item(i).PART.item(j).Caption) & """).tag=""" & st.PART.item(i).PART.item(j).name & """"
                    txt = txt & vbCrLf & "     tree.nodes.add( nid & """ & st.PART.item(i).PART.item(j).name & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    txt = txt & vbCrLf & "   end if ' " & st.PART.item(i).PART.item(j).name
                End If
            Next
            txt = txt & vbCrLf & "    next"
          End If ' IsPresent
      Next ' st.part

      txt = txt & vbCrLf & " end select"
      txt = txt & vbCrLf & "end if ' mode="""" (Default)"
      'No mode
      
      
      txt = txt & vbCrLf & "end sub"
      PartExpandTreeGlobal = txt
      Exit Function

bye:
      MsgBox Err.Description, vbOKOnly
      'Stop
      'Resume
End Function





' Load columns data to grid
Public Function PrepareGrid(st As PART) As String
Dim txt As String, i As Long
txt = ""
On Error GoTo bye
  txt = txt & vbCrLf & CommentItem("public sub PrepareGrid(YGrid as object)", "Настройка грида на вывод раздела")
  txt = txt & vbCrLf & "YGrid.ItemCount = 0"
  txt = txt & vbCrLf & "YGrid.Groups.Clear "
  txt = txt & vbCrLf & "YGrid.SortKeys.Clear"
  txt = txt & vbCrLf & "YGrid.Columns.Clear"
  Dim ft As FIELDTYPE
  
  st.FIELD.Sort = "sequence"
  For i = 1 To st.FIELD.Count
    txt = txt & vbCrLf & "  YGrid.Columns.Add(""" & NoLF(st.FIELD.item(i).Caption) & """, 0, 0, """ & st.FIELD.item(i).name & """).SortType ="
    Set ft = st.FIELD.item(i).FIELDTYPE
    If ft.GridSortType = ColumnSortType_As_String Then txt = txt & "1"
    If ft.GridSortType = ColumnSortType_As_Numeric Then txt = txt & "2"
    If ft.GridSortType = ColumnSortType_As_Date Then txt = txt & "4"
  Next
  txt = txt & vbCrLf & "YGrid.ItemCount = count"
  txt = txt & vbCrLf & "end sub"
  PrepareGrid = txt
  Exit Function

bye:
  MsgBox Err.Description, vbOKOnly
  'Stop
  'Resume
End Function

' Unbound grid support function
Public Function MakeGridUnboundRead(st As PART)
Dim txt As String, i As Long, j As Long
Dim f As FIELD
txt = ""
On Error GoTo bye
  txt = txt & vbCrLf & CommentItem("public sub LoadRow(YGrid as object, ByVal RowIndex As Long, ByVal Bookmark As Variant,  Values )", "Чтение данных строки раздела в грид")
  txt = txt & vbCrLf & " dim obj as " & st.name
  txt = txt & vbCrLf & "  If RowIndex > 0 And RowIndex <= Count Then"
  txt = txt & vbCrLf & "    'If not IsEmpty(BookMArk) then"
  txt = txt & vbCrLf & "    '  set obj = item(left(bookmark,38))"
  txt = txt & vbCrLf & "    'else"
  txt = txt & vbCrLf & "      set obj = item(rowindex)"
  txt = txt & vbCrLf & "    'end If"
  txt = txt & vbCrLf & "    if obj is nothing then exit sub"
  txt = txt & vbCrLf & "    on error resume next"
  
  st.FIELD.Sort = "sequence"
  For i = 1 To st.FIELD.Count
    Set f = st.FIELD.item(i)
    If f.FIELDTYPE.TypeStyle = TypeStyle_Ssilka Then
    txt = txt & vbCrLf & "   if obj." & f.name & " is nothing then"
    txt = txt & vbCrLf & "    Values.Value(" & i & ") = ""Не задано"""
    txt = txt & vbCrLf & "   else "
    txt = txt & vbCrLf & "    Values.Value(" & i & ") = Left(Replace(obj." & f.name & ".brief, vbCrLf, "" ""), 255)"
    txt = txt & vbCrLf & "   end if "
    GoTo nxt
    End If
    
    If f.FIELDTYPE.TypeStyle = TypeStyle_Perecislenie Then
      For j = 1 To f.FIELDTYPE.ENUMITEM.Count
        txt = txt & vbCrLf & "   if obj." & f.name & " =" & f.FIELDTYPE.ENUMITEM.item(j).NameValue & " then"
        txt = txt & vbCrLf & "     Values.Value(" & i & ") = """ & f.FIELDTYPE.ENUMITEM.item(j).name & """"
        txt = txt & vbCrLf & "   end if"
      Next
      GoTo nxt
    End If
    
    If UCase(f.FIELDTYPE.name) = "PASSWORD" Then
      txt = txt & vbCrLf & "    Values.Value(" & i & ") = ""**********"""
    ElseIf UCase(f.FIELDTYPE.name) = "FILE" Then
      txt = txt & vbCrLf & "    Values.Value(" & i & ") = ""-файл-"""
    ElseIf UCase(f.FIELDTYPE.name) = "IMAGE" Then
      txt = txt & vbCrLf & "    Values.Value(" & i & ") = ""-картинка-"""
    Else
      txt = txt & vbCrLf & "    Values.Value(" & i & ") = Left(Replace(obj." & f.name & ", vbCrLf, "" ""), 255)"
    End If
    
nxt:
  Next
  
  txt = txt & vbCrLf & "   YGRID.RowBookmark(RowIndex) =  obj.id & """ & st.name & """"
  txt = txt & vbCrLf & "  End If 'RowIndex"
  txt = txt & vbCrLf & "end sub"
  MakeGridUnboundRead = txt
  Exit Function

bye:
  MsgBox Err.Description, vbOKOnly
  'Stop
  'Resume

End Function


