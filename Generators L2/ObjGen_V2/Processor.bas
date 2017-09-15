Attribute VB_Name = "ModelProcessor"
Option Explicit


Public Function CommentSplit(ByVal Prefix As String, ByVal c As String) As String
  Dim out As String, i As Integer
  Dim ss
  On Error Resume Next
  ss = Split(c, vbCrLf)
  For i = 0 To UBound(ss)
    out = Prefix & ss(i)
  Next
  CommentSplit = out

End Function

Public Function MakeValidName(ByVal name As String) As String
  Dim s As String
  Dim out As String
  Dim changes As String
  Dim arr As Variant
  Dim transfr As String, transto As String
  Dim i As Long, j As Long
  Dim begs As String
  begs = "_1234567890"
  
  transfr = "ÈˆÛÍÂÌ„¯˘Áı˙Ù˚‚‡ÔÓÎ‰Ê˝ˇ˜ÒÏËÚ¸·˛∏…÷” ≈Õ√ÿŸ«’⁄‘€¬¿œ–ŒÀƒ∆›ﬂ◊—Ã»“‹¡ﬁ®"
  transto = "ycukengsszh_fivaproldgeycsmit_buyYCUKENGSSZH_FIVAPROLDGEYCSMIT_BUE"
  
  
  changes = " +-`~'""/\|*:.,<>?][{}!@#$%^&()="
  arr = Array("_", "PLS", "MNS", "LAPS", "WAV", "APS", "DAPS", "SLASH", "BSLASH", _
  "FENCE", "STAR", "DDOT", "DOT", "COMA", "LS", "GT", "QMARK", "BCLS", "BOPN", _
  "WOPN", "WCLS", "IMARK", "AT", "SHARP", "PCNT", "ROOF", "AND", "OPN", "CLS", "EQ", "XX", "XX", "XX", "XX")
  
  
  s = name
  
  
  Dim changeIt As Long
  For i = 1 To Len(transfr)
    s = Replace(s, Mid(transfr, i, 1), Mid(transto, i, 1))
  Next
  
  For i = 1 To Len(s)
    changeIt = -1
    For j = 1 To Len(changes)
      If Mid(s, i, 1) = Mid(changes, j, 1) Then
      changeIt = j
        Exit For
      End If
    Next
    If changeIt = -1 Then
      out = out & Mid(s, i, 1)
    Else
     out = out & arr(changeIt - 1)
    End If
  Next
  s = out
  
  
  
  
  
  If InStr(1, begs, Left(s, 1)) > 0 Then
    s = "cls_" & s
  End If
  'If Not IsValidFieldName2(s) Then
  '  s = "n_" & s
  'End If
  MakeValidName = s
End Function


' if this part is tree so create expand and load function
Public Function ExpandTree(st As PART) As String
Dim txt As String, i As Long, j As Long, s As String, mm As Long
If st.PartType <> 2 Then Exit Function
txt = ""
On Error GoTo bye

  txt = txt & vbCrLf & "public sub LoadTotree(tree as object,byval key as string)"
  txt = txt & vbCrLf & "      dim tid as string 'only for tree styled structure"
  txt = txt & vbCrLf & "      tid =id & PartName"
  txt = txt & vbCrLf & "      if key ="""" then"
  txt = txt & vbCrLf & "        tree.nodes.add( ,0,tid,  brief).tag=""Row"" "
  txt = txt & vbCrLf & "      else"
  txt = txt & vbCrLf & "        tree.nodes.add( key,4,tid,  brief).tag=""Row"" "
  txt = txt & vbCrLf & "      end if"
  txt = txt & vbCrLf & "      tree.nodes.add( tid ,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
  txt = txt & vbCrLf & "end sub"

  txt = txt & vbCrLf & "public sub ExpandTree(tree as object,byval key as string)"
  txt = txt & vbCrLf & " dim item as object, i as long, nid as string, tmpid as string"
  txt = txt & vbCrLf & " dim tidx as long, tid as string 'only for tree styled structure"
  txt = txt & vbCrLf & " set item = Application.FindrowObject(right(key,38),left(key,38))"
  txt = txt & vbCrLf & " if not item is me then"
  txt = txt & vbCrLf & "   item.ExpandTree tree,key"
  txt = txt & vbCrLf & "   exit sub"
  txt = txt & vbCrLf & " end if"
  txt = txt & vbCrLf & " tree.nodes.item(key).sorted=true"
  txt = txt & vbCrLf & "    for tidx=1 to item." & st.name & ".count"
  txt = txt & vbCrLf & "      ' " & st.name
  txt = txt & vbCrLf & "      tid =item." & st.name & ".item(tidx).id & item." & st.name & ".item(tidx).PartName"
  txt = txt & vbCrLf & "      tree.nodes.add( key,4,tid,  item." & st.name & ".item(tidx).brief).tag=""Row"" "
  txt = txt & vbCrLf & "      tree.nodes.add( tid ,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
  txt = txt & vbCrLf & "    next 'tidx"
  txt = txt & vbCrLf & "end sub"
  ExpandTree = txt
  Exit Function

bye:
  MsgBox Err.Description, vbOKOnly
  Stop
  Resume
End Function


' STRUCT.FillTree
Public Function FillTreeRoot(st As PART) As String
Dim txt As String, i As Long, j As Long, s As String, mm As Long
If st.PartType <> 2 Then Exit Function
txt = ""
On Error GoTo bye
  txt = txt & vbCrLf & "public sub FillTree(tree as object)"
  txt = txt & vbCrLf & " dim tidx as long, tid as string 'only for tree styled structure"
  txt = txt & vbCrLf & "    for tidx=1 to count"
  txt = txt & vbCrLf & "      ' " & st.name
  txt = txt & vbCrLf & "      tid = item(tidx).id & item(tidx).PartName"
  txt = txt & vbCrLf & "      tree.nodes.add( ,0,tid,  item(tidx).brief).tag=""Row"" "
  txt = txt & vbCrLf & "      tree.nodes.add( tid ,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
  txt = txt & vbCrLf & "    next 'tidx"
  txt = txt & vbCrLf & "end sub"
  FillTreeRoot = txt
  Exit Function

bye:
  MsgBox Err.Description, vbOKOnly
  Stop
  Resume
End Function




Public Function TypeExpander(ot As OBJECTTYPE) As String ', ByVal mask As Boolean
Dim txt As String, i As Long, j As Long, s As String, mm As Long
Dim st As PART
txt = ""
On Error GoTo bye
      txt = txt & vbCrLf & "public sub Expand(tree as object,byval key as string, byval mode as string, optional Mask as string ="""")"
      txt = txt & vbCrLf & " dim id as string , struct as string, child as string"
      txt = txt & vbCrLf & " dim item as object, i as long, nid as string, tmpid as string"
      txt = txt & vbCrLf & " dim tidx as long, tid as string 'only for tree styled structure"
      txt = txt & vbCrLf & " id = mid(key,39,38)"
      txt = txt & vbCrLf & " struct = mid(key,39+38,38)"
      txt = txt & vbCrLf & " child = mid(key,39+38+38,38)"
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
              
              txt = txt & vbCrLf & " case """ & ot.PART.item(i).ID & """ ' " & ot.PART.item(i).name
              txt = txt & vbCrLf & "    item." & ot.PART.item(i).name & ".refresh"
              txt = txt & vbCrLf & "    for i=1 to item." & ot.PART.item(i).name & ".count"
              txt = txt & vbCrLf & "    nid =createguid2() &  item." & ot.PART.item(i).name & ".item(i).id & child "
              If ot.PART.item(i).PartType = 2 Then
                txt = txt & vbCrLf & "    nid =nid & child 'need for expand tree children"
              End If
              txt = txt & vbCrLf & "    tree.nodes.add( key,4,nid,  item." & ot.PART.item(i).name & ".item(i).brief).tag=""Row"" "
    
              If ot.PART.item(i).PartType <> 2 Then
                For j = 1 To ot.PART.item(i).PART.Count
                  If IsPresent(ot.PART.item(i).PART.item(j), "") Then
                    txt = txt & vbCrLf & "if Mask<>"""" then"
                    txt = txt & vbCrLf & "  if application.MTZSession.IsDescendant(mask,""" & ot.PART.item(i).PART.item(j).ID & """) then"
                    txt = txt & vbCrLf & "    ' " & ot.PART.item(i).PART.item(j).name
                    txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).PART.item(j).ID & """ ,""" & ot.PART.item(i).PART.item(j).Caption & """).tag=""" & ot.PART.item(i).PART.item(j).name & """"
                    txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).PART.item(j).ID & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    txt = txt & vbCrLf & "  end if"
                    txt = txt & vbCrLf & "else"
                    txt = txt & vbCrLf & "    ' " & ot.PART.item(i).PART.item(j).name
                    txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).PART.item(j).ID & """ ,""" & ot.PART.item(i).PART.item(j).Caption & """).tag=""" & ot.PART.item(i).PART.item(j).name & """"
                    txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).PART.item(j).ID & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    txt = txt & vbCrLf & "end if"
                  End If
                Next
              Else
                txt = txt & vbCrLf & "    tree.nodes.add( nid ,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
              End If
              
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
            txt = txt & vbCrLf & " case """ & ot.PART.item(i).ID & """ ' " & ot.PART.item(i).name
            txt = txt & vbCrLf & "    item." & ot.PART.item(i).name & ".refresh"
            txt = txt & vbCrLf & "    for i=1 to item." & ot.PART.item(i).name & ".count"
            txt = txt & vbCrLf & "    nid =createguid2() &  item." & ot.PART.item(i).name & ".item(i).id & child "
            
            If ot.PART.item(i).PartType = 2 Then
              txt = txt & vbCrLf & "    nid =nid & child 'need for expand tree children"
            End If
            
            txt = txt & vbCrLf & "    tree.nodes.add( key,4,nid,  item." & ot.PART.item(i).name & ".item(i).brief).tag=""Row"" "
            If ot.PART.item(i).PartType <> 2 Then
              For j = 1 To ot.PART.item(i).PART.Count
                  If IsPresent(ot.PART.item(i).PART.item(j), "") Then
                    txt = txt & vbCrLf & "if Mask<>"""" then"
                    txt = txt & vbCrLf & "  if application.MTZSession.IsDescendant(mask,""" & ot.PART.item(i).PART.item(j).ID & """) then"
                    txt = txt & vbCrLf & "    ' " & ot.PART.item(i).PART.item(j).name
                    txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).PART.item(j).ID & """ ,""" & ot.PART.item(i).PART.item(j).Caption & """).tag=""" & ot.PART.item(i).PART.item(j).name & """"
                    txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).PART.item(j).ID & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    txt = txt & vbCrLf & "  end if"
                    txt = txt & vbCrLf & "else"
                    txt = txt & vbCrLf & "    ' " & ot.PART.item(i).PART.item(j).name
                    txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & ot.PART.item(i).PART.item(j).ID & """ ,""" & ot.PART.item(i).PART.item(j).Caption & """).tag=""" & ot.PART.item(i).PART.item(j).name & """"
                    txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & ot.PART.item(i).PART.item(j).ID & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    txt = txt & vbCrLf & "end if"
                  End If
              Next
            Else
              txt = txt & vbCrLf & "    tree.nodes.add( nid ,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
            End If
            txt = txt & vbCrLf & "    next"
          End If ' IsPresent
      Next
      
      txt = txt & vbCrLf & " end select"
      txt = txt & vbCrLf & "end if ' mode="""""
      'No mode
      
      
      txt = txt & vbCrLf & "end sub"
      TypeExpander = txt
      Exit Function

bye:
      MsgBox Err.Description, vbOKOnly
      Stop
      Resume
End Function

' Expand to global tree
Public Function Expander(st As PART) As String ', ByVal mask As Boolean
Dim txt As String, i As Long, j As Long, s As String, mm As Long
Dim ot As OBJECTTYPE
txt = ""
On Error GoTo bye
      txt = txt & vbCrLf & "public sub Expand(tree as object,byval key as string, byval mode as string, optional Mask as string = """")"
      txt = txt & vbCrLf & " dim id as string , struct as string, child as string"
      txt = txt & vbCrLf & " dim item as object, i as long, nid as string, tmpid as string"
      txt = txt & vbCrLf & " dim tidx as long, tid as string 'only for tree styled structure"
      txt = txt & vbCrLf & " id = mid(key,39,38)"
      txt = txt & vbCrLf & " struct = mid(key,39+38,38)"
      txt = txt & vbCrLf & " child = mid(key,39+38+38,38)"
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
        If st.PartType <> 2 Then
          For i = 1 To st.PART.Count
              If IsPresent(st.PART.item(i), ot.OBJECTMODE.item(mm).name) Then
                
                txt = txt & vbCrLf & " case """ & st.PART.item(i).ID & """ ' " & st.PART.item(i).name
                txt = txt & vbCrLf & "    item." & st.PART.item(i).name & ".refresh"
                txt = txt & vbCrLf & "    for i=1 to item." & st.PART.item(i).name & ".count"
                If st.PART.item(i).PartType = 2 Then
                  txt = txt & vbCrLf & "    nid =createguid2()  & item." & st.PART.item(i).name & ".item(i).id & child  & child"
                  txt = txt & vbCrLf & "    tree.nodes.add( key,4,nid,  item." & st.PART.item(i).name & ".item(i).brief).tag=""Row"" "
                  txt = txt & vbCrLf & "    item." & st.PART.item(i).name & ".item(i).Expand tree, nid,mode,mask "
                Else
                  
                  txt = txt & vbCrLf & "      nid =createguid2() &  item." & st.PART.item(i).name & ".item(i).id & child "
                  txt = txt & vbCrLf & "      tree.nodes.add( key,4,nid,  item." & st.PART.item(i).name & ".item(i).brief).tag=""Row"" "
        
                  For j = 1 To st.PART.item(i).PART.Count
                    If IsPresent(st.PART.item(i).PART.item(j), "") Then
                        txt = txt & vbCrLf & "   if Mask<>"""" then"
                        txt = txt & vbCrLf & "     if application.MTZSession.IsDescendant(mask,""" & st.PART.item(i).PART.item(j).ID & """) then"
                        txt = txt & vbCrLf & "      ' " & st.PART.item(i).PART.item(j).name
                        txt = txt & vbCrLf & "      tree.nodes.add( nid,4,nid & """ & st.PART.item(i).PART.item(j).ID & """ ,""" & st.PART.item(i).PART.item(j).Caption & """).tag=""" & st.PART.item(i).PART.item(j).name & """"
                        txt = txt & vbCrLf & "      tree.nodes.add( nid & """ & st.PART.item(i).PART.item(j).ID & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                        txt = txt & vbCrLf & "     end if"
                        txt = txt & vbCrLf & "   else"
                        txt = txt & vbCrLf & "     ' " & st.PART.item(i).PART.item(j).name
                        txt = txt & vbCrLf & "     tree.nodes.add( nid,4,nid & """ & st.PART.item(i).PART.item(j).ID & """,""" & st.PART.item(i).PART.item(j).Caption & """).tag=""" & st.PART.item(i).PART.item(j).name & """"
                        txt = txt & vbCrLf & "     tree.nodes.add( nid & """ & st.PART.item(i).PART.item(j).ID & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                        txt = txt & vbCrLf & "   end if"
                    End If
                  Next
                End If
                txt = txt & vbCrLf & "    next"
              End If ' IsPresent
          Next
        End If
        
        If st.PartType = 2 Then 'tree
          txt = txt & vbCrLf & " case """ & st.ID & """ ' " & st.name
          txt = txt & vbCrLf & "    for tidx=1 to item." & st.name & ".count"
          txt = txt & vbCrLf & "      ' " & st.name
          txt = txt & vbCrLf & "      tid =createguid2()  & item." & st.name & ".item(tidx).id & child & child ' need for expand tree chilldren"
          txt = txt & vbCrLf & "      tree.nodes.add( key,4,tid,  item." & st.name & ".item(tidx).brief).tag=""Row"" "
          txt = txt & vbCrLf & "      tree.nodes.add( tid ,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
          txt = txt & vbCrLf & "    next 'tidx"
          For j = 1 To st.PART.Count
            If IsPresent(st.PART.item(j), "") Then
              txt = txt & vbCrLf & "if Mask<>"""" then"
              txt = txt & vbCrLf & "  if application.MTZSession.IsDescendant(mask,""" & st.PART.item(j).ID & """) then"
              txt = txt & vbCrLf & "      ' " & st.PART.item(j).name
              txt = txt & vbCrLf & "      tid =createguid2() & id & struct "
              txt = txt & vbCrLf & "      tree.nodes.add( key,4,tid & """ & st.PART.item(j).ID & """ ,""" & st.PART.item(j).Caption & """).tag=""" & st.PART.item(j).name & """"
              txt = txt & vbCrLf & "      tree.nodes.add( tid & """ & st.PART.item(j).ID & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
              txt = txt & vbCrLf & "  end if"
              txt = txt & vbCrLf & "else"
              txt = txt & vbCrLf & "      ' " & st.PART.item(j).name
              txt = txt & vbCrLf & "      tid =createguid2() & id & struct "
              txt = txt & vbCrLf & "      tree.nodes.add( key,4,tid & """ & st.PART.item(j).ID & """ ,""" & st.PART.item(j).Caption & """).tag=""" & st.PART.item(j).name & """"
              txt = txt & vbCrLf & "      tree.nodes.add( tid & """ & st.PART.item(j).ID & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
              txt = txt & vbCrLf & "end if"
            End If
          Next
        End If
  
  
        txt = txt & vbCrLf & "end select"
        
        txt = txt & vbCrLf & "end if ' mode=""" & ot.OBJECTMODE.item(mm).name & """"
      Next ' mode
      
     ' no mode
      txt = txt & vbCrLf & "if mode="""" then"
      txt = txt & vbCrLf & " select case child"
      If st.PartType <> 2 Then 'tree
        For i = 1 To st.PART.Count
            If IsPresent(st.PART.item(i), "") Then
              txt = txt & vbCrLf & " case """ & st.PART.item(i).ID & """ ' " & st.PART.item(i).name
              txt = txt & vbCrLf & "    item." & st.PART.item(i).name & ".refresh"
              txt = txt & vbCrLf & "    for i=1 to item." & st.PART.item(i).name & ".count"
              
              If st.PART.item(i).PartType = 2 Then
                txt = txt & vbCrLf & "    nid =createguid2()  & item." & st.PART.item(i).name & ".item(i).id & child  & child"
                txt = txt & vbCrLf & "    tree.nodes.add( key,4,nid,  item." & st.PART.item(i).name & ".item(i).brief).tag=""Row"" "
                txt = txt & vbCrLf & "    item." & st.PART.item(i).name & ".item(i).Expand tree, nid,mode,mask "
              Else
                txt = txt & vbCrLf & "    nid =createguid2()  & item." & st.PART.item(i).name & ".item(i).id & child "
                txt = txt & vbCrLf & "    tree.nodes.add( key,4,nid,  item." & st.PART.item(i).name & ".item(i).brief).tag=""Row"" "
                For j = 1 To st.PART.item(i).PART.Count
                    If IsPresent(st.PART.item(i).PART.item(j), "") Then
                      txt = txt & vbCrLf & "    ' " & st.PART.item(i).PART.item(j).name
                      txt = txt & vbCrLf & "    tree.nodes.add( nid,4,nid & """ & st.PART.item(i).PART.item(j).ID & """ ,""" & st.PART.item(i).PART.item(j).Caption & """).tag=""" & st.PART.item(i).PART.item(j).name & """"
                      txt = txt & vbCrLf & "    tree.nodes.add( nid & """ & st.PART.item(i).PART.item(j).ID & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
                    End If
                Next
              End If
              txt = txt & vbCrLf & "    next"
            End If ' IsPresent
        Next
      End If
      If st.PartType = 2 Then 'tree
          txt = txt & vbCrLf & " case """ & st.ID & """ ' " & st.name
          txt = txt & vbCrLf & "    for tidx=1 to item." & st.name & ".count"
          txt = txt & vbCrLf & "      ' " & st.name
          txt = txt & vbCrLf & "      tid =createguid2()  & item." & st.name & ".item(tidx).id & child & child ' need for expand tree chilldren"
          txt = txt & vbCrLf & "      tree.nodes.add( key,4,tid,  item." & st.name & ".item(tidx).brief).tag=""Row"" "
          txt = txt & vbCrLf & "      tree.nodes.add( tid ,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
          txt = txt & vbCrLf & "    next 'tidx"
          For j = 1 To st.PART.Count
            If IsPresent(st.PART.item(j), "") Then
              txt = txt & vbCrLf & "      ' " & st.PART.item(j).name
              txt = txt & vbCrLf & "      tid =createguid2() & id & child "
              txt = txt & vbCrLf & "      tree.nodes.add( key,4,tid & """ & st.PART.item(j).ID & """ ,""" & st.PART.item(j).Caption & """).tag=""" & st.PART.item(j).name & """"
              txt = txt & vbCrLf & "      tree.nodes.add( tid & """ & st.PART.item(j).ID & """,4, createguid2(),""Expanding ..."").tag=""ToDelete"""
            End If
          Next
          
        End If

      txt = txt & vbCrLf & " end select"
      txt = txt & vbCrLf & "end if ' mode="""""
      'No mode
      
      
      txt = txt & vbCrLf & "end sub"
      Expander = txt
      Exit Function

bye:
      MsgBox Err.Description, vbOKOnly
      Stop
      Resume
End Function




Public Function PrepareGrid(st As PART) As String
Dim txt As String, i As Long
txt = ""
On Error GoTo bye
  txt = txt & vbCrLf & "public sub PrepareGrid(YGrid as object)"
  txt = txt & vbCrLf & "YGrid.ItemCount = 0"
  txt = txt & vbCrLf & "While YGrid.Columns.Count > 0"
  txt = txt & vbCrLf & "  YGrid.Columns.Remove 1"
  txt = txt & vbCrLf & "Wend"

  For i = 1 To st.FIELD.Count
    txt = txt & vbCrLf & " call YGrid.Columns.Add(""" & st.FIELD.item(i).Caption & """, 0, 0, """ & st.FIELD.item(i).name & """)"
  Next
  txt = txt & vbCrLf & "YGrid.ItemCount = count"
  txt = txt & vbCrLf & "end sub"
  PrepareGrid = txt
  Exit Function

bye:
  MsgBox Err.Description, vbOKOnly
  Stop
  Resume
End Function


Public Function GridURD(st As PART)
Dim txt As String, i As Long, j As Long
Dim f As FIELD
txt = ""
On Error GoTo bye
  txt = txt & vbCrLf & "public sub LoadRow(YGrid as object, ByVal RowIndex As Long, ByVal Bookmark As Variant,  Values )"
  txt = txt & vbCrLf & " dim obj as " & st.name
  txt = txt & vbCrLf & "  If RowIndex > 0 And RowIndex <= Count Then"
  txt = txt & vbCrLf & "    If not IsEmpty(BookMArk) then"
  txt = txt & vbCrLf & "      'set obj = application.findrowobject(right(bookmark,38), left(bookmark,38))"
  txt = txt & vbCrLf & "      set obj = item( left(bookmark,38))"
  txt = txt & vbCrLf & "    else"
  txt = txt & vbCrLf & "      set obj = item(rowindex)"
  txt = txt & vbCrLf & "    end If"
  txt = txt & vbCrLf & "    if obj is nothing then exit sub"
  txt = txt & vbCrLf & "    on error resume next"
  For i = 1 To st.FIELD.Count
    Set f = st.FIELD.item(i)
    If f.FIELDTYPE.TypeStyle = 4 Then
    txt = txt & vbCrLf & "   if obj." & f.name & " is nothing then"
    txt = txt & vbCrLf & "    Values.Value(" & i & ") = ""ÕÂ Á‡‰‡ÌÓ"""
    txt = txt & vbCrLf & "   else "
    txt = txt & vbCrLf & "    Values.Value(" & i & ") = Left(Replace(obj." & f.name & ".brief, vbCrLf, "" ""), 255)"
    txt = txt & vbCrLf & "   end if "
    GoTo nxt
    End If
    
    If f.FIELDTYPE.TypeStyle = 2 Then
      For j = 1 To f.FIELDTYPE.ENUMITEM.Count
        txt = txt & vbCrLf & "   if obj." & f.name & " =" & f.FIELDTYPE.ENUMITEM.item(j).NameValue & " then"
        txt = txt & vbCrLf & "     Values.Value(" & i & ") = """ & f.FIELDTYPE.ENUMITEM.item(j).name & """"
        txt = txt & vbCrLf & "   end if"
      Next
      GoTo nxt
    End If
    
    
    txt = txt & vbCrLf & "    Values.Value(" & i & ") = Left(Replace(obj." & f.name & ", vbCrLf, "" ""), 255)"
nxt:
  Next
  
  txt = txt & vbCrLf & "   YGRID.RowBookmark(RowIndex) =  obj.id & """ & st.ID & """"
  txt = txt & vbCrLf & "  End If 'RowIndex"
  txt = txt & vbCrLf & "end sub"
  GridURD = txt
  Exit Function

bye:
  MsgBox Err.Description, vbOKOnly
  Stop
  Resume

End Function




