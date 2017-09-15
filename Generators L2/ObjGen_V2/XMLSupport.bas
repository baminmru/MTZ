Attribute VB_Name = "XMLSupport"
Option Explicit





' XML support functions for Application Class
Public Sub MakeXMLApplication(ByRef obj As OBJECTTYPE, ByRef body As String)
  Dim save_str As String, load_str As String
  Dim s1 As PART, i As Long
  
  save_str = vbCrLf & CommentItem("public sub XMLSave(node as IXMLDOMElement, xdom as DomDocument)", "Сохранить данные в XML")
  save_str = save_str & vbCrLf & "  dim anode as IXMLDOMElement"
  save_str = save_str & vbCrLf & "  set anode = xdom.CreateElement(""APPLICATION"")"
  save_str = save_str & vbCrLf & "  anode.setAttribute ""ID"", m_ID"
  save_str = save_str & vbCrLf & "  anode.setAttribute ""TYPENAME"", m_TypeName"
  save_str = save_str & vbCrLf & "  anode.setAttribute ""NAME"", m_Name"
  save_str = save_str & vbCrLf & "  anode.setAttribute ""STATUSID"", m_StatusID"
  save_str = save_str & vbCrLf & "  anode.setAttribute ""SECURITYSTYLEID"", m_SecureStyleID"
  save_str = save_str & vbCrLf & "  anode.setAttribute ""IsLocked"", m_IsLocked"
  save_str = save_str & vbCrLf & "  anode.setAttribute ""WorkOffline"", WorkOffline"
  
  save_str = save_str & vbCrLf & "  node.appendChild anode"
  For i = 1 To obj.PART.Count
    Set s1 = obj.PART.item(i)
    save_str = save_str & vbCrLf & "  " & MakeValidName(s1.name) & ".XMLSave anode,xdom"
  Next
  save_str = save_str & vbCrLf & "end sub"
  
  
  
  load_str = vbCrLf & CommentItem("public sub XMLLoad( node as IXMLDOMNode, optional byval LoadMode as integer=0)", "Загрузить данные из XML")
  load_str = load_str & vbCrLf & " on error resume next"
  load_str = load_str & vbCrLf & "  Dim anode As IXMLDOMElement"
  load_str = load_str & vbCrLf & "  Dim e_list As IXMLDOMNodeList"
  load_str = load_str & vbCrLf & " on error resume next"
  load_str = load_str & vbCrLf & "  set anode = node.firstchild  "
  load_str = load_str & vbCrLf & "  if m_typename <> anode.Attributes.getNamedItem(""TYPENAME"").nodeValue then exit sub"
  load_str = load_str & vbCrLf & "  m_IsLocked=anode.Attributes.getNamedItem(""IsLocked"").nodeValue"
  load_str = load_str & vbCrLf & "  if m_IsLocked >2 then m_IsLocked =0"
  load_str = load_str & vbCrLf & "  if LoadMode <>2 then "
  load_str = load_str & vbCrLf & "    m_ID=anode.Attributes.getNamedItem(""ID"").nodeValue"
  load_str = load_str & vbCrLf & "    SetStatus anode.Attributes.getNamedItem(""STATUSID"").nodeValue"
  load_str = load_str & vbCrLf & "    Secure anode.Attributes.getNamedItem(""SECURITYSTYLEID"").nodeValue"
  load_str = load_str & vbCrLf & "    WorkOffline =anode.Attributes.getNamedItem(""WorkOffline"").nodevalue"
  load_str = load_str & vbCrLf & "    if workoffline and m_IsLocked = LockSession then m_IsLocked = NoLock"
  load_str = load_str & vbCrLf & "  end if "
  load_str = load_str & vbCrLf & "  m_Name=anode.Attributes.getNamedItem(""NAME"").nodeValue"
  
  For i = 1 To obj.PART.Count
    Set s1 = obj.PART.item(i)
    load_str = load_str & vbCrLf & "Set e_list = anode.selectNodes(""" & UCase(MakeValidName(s1.name)) & "_COL"")"
    load_str = load_str & vbCrLf & "  " & MakeValidName(s1.name) & ".XMLLoad e_list, LoadMode"
  Next
  load_str = load_str & vbCrLf & "end sub"
  
  body = body & vbCrLf & load_str & vbCrLf
  body = body & vbCrLf & save_str & vbCrLf
End Sub



' XML support functions for collections
Public Sub MakeXMLCollection(s As PART, ByRef decl As String, ByRef code As String)
Dim tbl As PART
Dim n As String

' create class
On Error GoTo bye

  n = MakeValidName(s.name)

  code = code & vbCrLf & CommentItem("Public Sub XMLSave(byref ParentNode as IXMLDOMElement, Xdom as DomDocument) ", "Сохранить данные в структуре XML")
  code = code & vbCrLf & "  dim o as " & n
  code = code & vbCrLf & "  dim i as long"
  code = code & vbCrLf & "  dim pnode as IXMLDOMElement"
  code = code & vbCrLf & "  set pnode = xdom.CreateElement(""" & UCase(n) & "_COL"")"
  code = code & vbCrLf & "  pnode.setAttribute ""IsLocked"", m_IsLocked"
  code = code & vbCrLf & "  dim node as IXMLDOMElement"
  code = code & vbCrLf & "  ParentNode.appendChild pnode"
  code = code & vbCrLf & "  for i=1 to count"
  code = code & vbCrLf & "    set o = item(i)"
  code = code & vbCrLf & "    set node = xdom.CreateElement(""" & UCase(n) & """)"
  code = code & vbCrLf & "    Pnode.appendChild node"
  code = code & vbCrLf & "    o.XmlSave node, xdom"
  code = code & vbCrLf & "  next"
  code = code & vbCrLf & "End sub"
  code = code & vbCrLf & ""
  code = code & vbCrLf & CommentItem("Public Sub XMLLoad(byref NodeList as IXMLDOMnodeList, optional byval LoadMode as integer=0)", "Загрузить данные из XML")
  code = code & vbCrLf & "  on error resume next"
  code = code & vbCrLf & "  dim o as " & n
  code = code & vbCrLf & "  dim node as IXMLDOMElement"
  code = code & vbCrLf & "  dim pnode as IXMLDOMElement"
  code = code & vbCrLf & "  NodeList.Reset"
  code = code & vbCrLf & "  set pnode = NodeList.NextNode"
  code = code & vbCrLf & "  m_IsLocked=pnode.Attributes.getNamedItem(""IsLocked"").nodeValue"
  code = code & vbCrLf & "  Set NodeList = pnode.selectNodes(""" & UCase(n) & """)"
  code = code & vbCrLf & "  dim bufcol as collection"
  code = code & vbCrLf & "  if loadmode =1  then"
  code = code & vbCrLf & "    set bufcol = new collection"
  code = code & vbCrLf & "  end if"
  code = code & vbCrLf & "  set node = NodeList.NextNode"
  code = code & vbCrLf & "  While not node is nothing"
  code = code & vbCrLf & "    ' append mode"
  code = code & vbCrLf & "    if loadmode =0  then"
  code = code & vbCrLf & "      if item(node.Attributes.getNamedItem(""ID"").nodeValue) is nothing  then"
  code = code & vbCrLf & "        Add(node.Attributes.getNamedItem(""ID"").nodeValue).xmlload node, loadmode"
  code = code & vbCrLf & "      else"
  code = code & vbCrLf & "        Item(node.Attributes.getNamedItem(""ID"").nodeValue).xmlload node, loadmode"
  code = code & vbCrLf & "      end if"
  code = code & vbCrLf & "    end if"
  code = code & vbCrLf & "    ' replace mode"
  code = code & vbCrLf & "    if loadmode =1  then"
  code = code & vbCrLf & "      if item(node.Attributes.getNamedItem(""ID"").nodeValue) is nothing  then"
  code = code & vbCrLf & "        Add(node.Attributes.getNamedItem(""ID"").nodeValue).xmlload node, loadmode"
  code = code & vbCrLf & "      else"
  code = code & vbCrLf & "        Item(node.Attributes.getNamedItem(""ID"").nodeValue).xmlload node, loadmode"
  code = code & vbCrLf & "      end if"
  code = code & vbCrLf & "      bufcol.add Item(node.Attributes.getNamedItem(""ID"").nodeValue),node.Attributes.getNamedItem(""ID"").nodeValue"
  code = code & vbCrLf & "    end if"
  code = code & vbCrLf & "    ' copy with new ID mode"
  code = code & vbCrLf & "    if loadmode =2  then"
  code = code & vbCrLf & "        Add().xmlload node, loadmode"
  code = code & vbCrLf & "    end if"
  code = code & vbCrLf & "    set node = NodeList.NextNode"
  code = code & vbCrLf & "  wend"
  
  
  code = code & vbCrLf & "    ' remove extra items from collection"
  code = code & vbCrLf & "  if loadmode =1  then"
  code = code & vbCrLf & "    dim i as long"
  code = code & vbCrLf & "    ' remove existing"
  code = code & vbCrLf & "    removeAgain:"
  code = code & vbCrLf & "    for i=1 to count"
  code = code & vbCrLf & "      if bufcol.item(item(i).id) is nothing then"
  code = code & vbCrLf & "        Delete item(i).id"
  code = code & vbCrLf & "        goto removeAgain"
  code = code & vbCrLf & "      end if"
  code = code & vbCrLf & "    next"
  code = code & vbCrLf & "    set bufcol = nothing"
  code = code & vbCrLf & "  end if"
  
  code = code & vbCrLf & "End sub"
Exit Sub
bye:
  MsgBox Err.Description
  'Stop
  'Resume
End Sub

' XML support functions for each part
Public Sub MakeXMLRow(s As PART, ByRef decl As String, ByRef code As String, m, tid As String)
Dim P As FIELD
Dim cs As PART
Dim n As String, t As String, i As Long
Dim save_str As String
Dim load_str As String

  
  On Error GoTo bye

  save_str = vbCrLf & CommentItem("public sub XMLSave(node as IXMLDOMElement, xdom as DomDocument)", "Сохранить в формате XML")
  save_str = save_str & vbCrLf & "on error resume next"
  save_str = save_str & vbCrLf & "  Dim e_ As IXMLDOMElement"
  save_str = save_str & vbCrLf & "  LoadFromDatabase"
  save_str = save_str & vbCrLf & "  node.setAttribute ""ID"", m_ID"
  save_str = save_str & vbCrLf & "  node.setAttribute ""Deleted"", m_Deleted"
  save_str = save_str & vbCrLf & "  node.setAttribute ""IsLocked"", m_IsLocked"
  save_str = save_str & vbCrLf & "  node.setAttribute ""RetriveTime"", cdbl(m_RetriveTime)"
  save_str = save_str & vbCrLf & "  node.setAttribute ""ChangeTime"", cdbl(m_ChangeTime)"
  save_str = save_str & vbCrLf & "  node.setAttribute ""SECURITYSTYLEID"", m_SecureStyleID"
  
  
  load_str = vbCrLf & CommentItem("public sub XMLLoad( node as IXMLDOMNode, optional byval LoadMode as integer=0)", "Загрузить из формата XML")
  load_str = load_str & vbCrLf & "  on error resume next"
  load_str = load_str & vbCrLf & "  Dim e_list As IXMLDOMNodeList"
  load_str = load_str & vbCrLf & "  Dim e_ As IXMLDOMNode"
  load_str = load_str & vbCrLf & "  if LoadMode <>2 then m_ID=node.Attributes.getNamedItem(""ID"").nodeValue"
  load_str = load_str & vbCrLf & "  m_Deleted=node.Attributes.getNamedItem(""Deleted"").nodeValue"
  load_str = load_str & vbCrLf & "  m_IsLocked=node.Attributes.getNamedItem(""IsLocked"").nodeValue"
  load_str = load_str & vbCrLf & "  if m_IsLocked >2 then m_IsLocked =0"
  load_str = load_str & vbCrLf & "  m_RetriveTime=node.Attributes.getNamedItem(""RetriveTime"").nodeValue"
  load_str = load_str & vbCrLf & "  m_ChangeTime=node.Attributes.getNamedItem(""ChangeTime"").nodeValue"
  load_str = load_str & vbCrLf & "  m_AccessTime=node.Attributes.getNamedItem(""AccessTime"").nodeValue"
  load_str = load_str & vbCrLf & "  if Application.workoffline and m_IsLocked = LockSession then m_IsLocked = NoLock"
  load_str = load_str & vbCrLf & "  Secure node.Attributes.getNamedItem(""SECURITYSTYLEID"").nodeValue"
  

  ' Load field values
  For i = 1 To s.FIELD.Count
    If (s.FIELD.item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
      Set P = s.FIELD.item(i)
      n = MakeValidName(P.name)
      t = MapFT(m, P.FIELDTYPE.ID, tid)
      
      ' reference load ID only
      If P.FIELDTYPE.TypeStyle = TypeStyle_Ssilka Then
        If P.ReferenceType = ReferenceType_Na_istocnik_dannih Then
        
          save_str = save_str & vbCrLf & "  node.setAttribute """ & UCase(n) & """, m_" & n
          load_str = load_str & vbCrLf & "  " & n & "="""""
          
        Else
        
          save_str = save_str & vbCrLf & "  node.setAttribute """ & UCase(n) & """, m_" & n & "_ID"
          save_str = save_str & vbCrLf & "  if not (" & n & " is nothing) then "
          save_str = save_str & vbCrLf & "    node.setAttribute """ & UCase(n) & "_BRIEF"", " & n & ".BRIEF"
          save_str = save_str & vbCrLf & "  else"
          save_str = save_str & vbCrLf & "    node.setAttribute """ & UCase(n) & "_BRIEF"", m_" & n & "_ID_BRIEF"
          save_str = save_str & vbCrLf & "  end if"
          
          load_str = load_str & vbCrLf & "  set " & n & "=nothing"
          load_str = load_str & vbCrLf & "  m_" & n & "_ID=node.Attributes.getNamedItem(""" & UCase(n) & """).nodeValue"
          load_str = load_str & vbCrLf & "  m_" & n & "_ID_BRIEF=node.Attributes.getNamedItem(""" & UCase(n) & "_BRIEF"").nodeValue"
          
        End If
      Else
        
        If LCase(t) = "date" Then
          
          save_str = save_str & vbCrLf & "  node.setAttribute """ & UCase(n) & """, Cdbl(" & n & ")"
          load_str = load_str & vbCrLf & "  " & n & "=node.Attributes.getNamedItem(""" & UCase(n) & """).nodeValue"
        
        ElseIf UCase(P.FIELDTYPE.name) = "FILE" Then
          ' ext
          save_str = save_str & vbCrLf & "  node.setAttribute """ & UCase(n) & "_EXT"", " & n & "_EXT"
          load_str = load_str & vbCrLf & "  " & n & "_EXT=node.Attributes.getNamedItem(""" & UCase(n) & "_EXT"").nodeValue"
             
          ' file data
          save_str = save_str & vbCrLf & "  node.setAttribute """ & UCase(n) & """, ArrayToHex(" & n & ")"
          load_str = load_str & vbCrLf & "  " & n & "=HexToArray(node.Attributes.getNamedItem(""" & UCase(n) & """).nodeValue)"
          
        ElseIf UCase(P.FIELDTYPE.name) = "IMAGE" Then
         
         save_str = save_str & vbCrLf & "  node.setAttribute """ & UCase(n) & """, ArrayToHex(" & n & ")"
         load_str = load_str & vbCrLf & "  " & n & "=HexToArray(node.Attributes.getNamedItem(""" & UCase(n) & """).nodeValue)"
        
        ElseIf LCase(t) = "string" Then
          
          load_str = load_str & vbCrLf & "  " & n & "=Replace(node.Attributes.getNamedItem(""" & UCase(n) & """).nodeValue,vbLf,vbcrlf)"
          save_str = save_str & vbCrLf & "  node.setAttribute """ & UCase(n) & """, " & n
        
        ElseIf LCase(t) = "double" Then
          load_str = load_str & vbCrLf & "  " & n & "=val(Replace(node.Attributes.getNamedItem(""" & UCase(n) & """).nodeValue,vbLf,vbcrlf))"
          save_str = save_str & vbCrLf & "  node.setAttribute """ & UCase(n) & """, replace(cstr(" & n & "),"","",""."")"
        Else
          
          load_str = load_str & vbCrLf & "  " & n & "=node.Attributes.getNamedItem(""" & UCase(n) & """).nodeValue"
          save_str = save_str & vbCrLf & "  node.setAttribute """ & UCase(n) & """, " & n
        
        End If
      End If
    End If
  Next
  save_str = save_str & vbCrLf & "  node.setAttribute ""AccessTime"", cdbl(m_AccessTime)"
  
  load_str = load_str & vbCrLf & "  on error goto bye"
  load_str = load_str & vbCrLf & "  'if m_ChangeTime >= m_RetriveTime then m_Changed = true"
  load_str = load_str & vbCrLf & "  m_Changed = true"
  load_str = load_str & vbCrLf & "  m_RowRetrived = true"
  load_str = load_str & vbCrLf & "  m_Brief = """""
  
  load_str = load_str & vbCrLf & "  on error resume next"

  
  'tree
  If s.PartType = 2 Then
    load_str = load_str & vbCrLf & "  Set e_list = node.selectNodes(""" & UCase(MakeValidName(s.name)) & "_COL"")"
    load_str = load_str & vbCrLf & "  " & MakeValidName(s.name) & ".XMLLoad e_list, LoadMode"
    save_str = save_str & vbCrLf & "  " & MakeValidName(s.name) & ".XMLSave node,xdom"
  End If

  For i = 1 To s.PART.Count
    Set cs = s.PART.item(i)
    load_str = load_str & vbCrLf & "  Set e_list = node.selectNodes(""" & UCase(MakeValidName(cs.name)) & "_COL"")"
    load_str = load_str & vbCrLf & "  " & MakeValidName(cs.name) & ".XMLLoad e_list, LoadMode"
    save_str = save_str & vbCrLf & "  " & MakeValidName(cs.name) & ".XMLSave node,xdom"
  Next

  save_str = save_str & vbCrLf & "end sub"
  
  load_str = load_str & vbCrLf & "  exit sub"
  load_str = load_str & vbCrLf & "bye:"
  load_str = load_str & vbCrLf & "  debugoutput err.description"
  load_str = load_str & vbCrLf & "end sub"
  code = code + load_str + vbCrLf + save_str
  Exit Sub
bye:
  MsgBox Err.Description
  'Stop
  'Resume
End Sub

