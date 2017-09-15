VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RTFProcesser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private mADOConnection As ADODB.Connection
'Private session As MTZSession.session
Private Stack() As String
Private Head As Integer
Private resultString As String
Private ResRepString As String
Public Event OnProgress(str As String)
Public Event OnStep(val As Integer, max As Integer)

Public Sub MakeDocument(ADOConnection As ADODB.Connection, template As String, fn As String)
    Dim ScrEnv As New ScriptControl
    Dim ff As Long
    Dim str As String
    Dim strlen As Long
    
    Set mADOConnection = ADOConnection
    
    ScrEnv.Language = "VBSCRIPT"
    ScrEnv.Reset
    
    ff = FreeFile
    Open template For Input As #ff
    str = Input(LOF(ff), ff)
    Close #ff
    
    'str = makeXML(str)
    ReDim Stack(1)
    Head = 1
    ResRepString = ""
    resultString = ClearTags(str, "<", ">")
    RaiseEvent OnStep(1, 5)
    resultString = ClearTags(resultString, "#", "#")
    RaiseEvent OnStep(2, 5)
    resultString = PickOutTags(resultString, 1, strlen)
    RaiseEvent OnStep(3, 5)
    resultString = makeXML(resultString)
    RaiseEvent OnStep(4, 5)
'
'    ff = FreeFile
'    Open fn & ".xml" For Output As #ff
'    Print #ff, resultString
'    Close #ff
'
'
    resultString = ProcessXMLReport(resultString, ScrEnv)
    ff = FreeFile
    Open fn For Output As #ff
    Print #ff, ResRepString
    Close #ff
    RaiseEvent OnStep(5, 5)
End Sub

Private Function ProcessXMLReport(ByVal str As String, ByVal ScrEnv As ScriptControl) As String
    Dim doc As New DOMDocument
    Dim n As IXMLDOMElement
    Dim root As IXMLDOMElement
    Dim i As Integer
    
    doc.loadXML str
    Set root = doc.ChildNodes(0)
    For i = 1 To root.ChildNodes.Length
        Set n = root.ChildNodes(i - 1)
        If n.NodeType = NODE_ELEMENT Then
            ProcessXMLSection n, ScrEnv, False
        End If
    Next
    
End Function

Private Function GetXMLAttr(ByVal node As IXMLDOMElement, name As String) As IXMLDOMAttribute
    Dim i As Integer
    Dim goAhead As Boolean
    
    i = 1
    If node.Attributes.Length > 0 Then
        goAhead = True
    Else
        goAhead = False
    End If
    
    While goAhead
        If node.Attributes.Length > i And UCase(node.Attributes(i - 1).BaseName) <> UCase(name) Then
            goAhead = True
            i = i + 1
        Else
            goAhead = False
        End If
    Wend
    If UCase(node.Attributes(i - 1).BaseName) = UCase(name) Then
        Set GetXMLAttr = node.Attributes(i - 1)
    End If
End Function

Private Function PickOutTags(str As String, idx As Long, ByRef NextPosition As Long)
    Dim sectionStart As Long
    Dim sectionEnd As Long
    Dim substr As String
    Dim DelimiterPos As Long
    Dim NextSectPos As Long
    Dim nextpos As Long
    
    sectionStart = InStr(idx + 1, str, "{", vbTextCompare)
    sectionEnd = InStr(idx + 1, str, "}", vbTextCompare)
    If sectionStart < sectionEnd And sectionStart > 0 Then
            ' Есть секции внутри
            While sectionStart < sectionEnd And sectionStart > 0
                Head = Head + 1
                If Head > UBound(Stack) Then
                    ReDim Preserve Stack(Head)
                End If
                DelimiterPos = InStr(sectionStart + 1, str, " ", vbTextCompare)
                NextSectPos = InStr(sectionStart + 1, str, "{", vbTextCompare)
                If DelimiterPos > sectionStart Or NextSectPos > sectionStart Then
                    If DelimiterPos < NextSectPos Or NextSectPos = 0 Then
                        Stack(Head) = Mid(str, sectionStart + 1, DelimiterPos - sectionStart - 1)
                    Else
                        Stack(Head) = Mid(str, sectionStart + 1, NextSectPos - sectionStart - 1)
                    End If
                Else
                    Stack(Head) = ""
                End If
                str = PickOutTags(str, sectionStart, nextpos)
                sectionStart = InStr(nextpos, str, "{", vbTextCompare)
                sectionEnd = InStr(nextpos, str, "}", vbTextCompare)
                Head = Head - 1
            Wend
        substr = "{" + Mid(str, idx + 1, sectionEnd - idx - 1) + "}"
    Else
        ' Нет секции внутри
        If sectionEnd > 0 Then
            substr = Mid(str, idx + 1, sectionEnd - idx - 1)
        Else
            substr = Mid(str, idx)
        End If
        If InStr(1, substr, "<", vbTextCompare) Then
            'есть управляющий тэг
            substr = ExtractTag(substr)
        End If
        substr = "{" + substr + "}"
    End If
    PickOutTags = Left(str, idx - 1) & substr & Mid(str, sectionEnd + 1)
    NextPosition = Len(Left(str, idx - 1) & substr) + 1
End Function

Function ClearTags(str As String, ByVal sectBeg As String, sectEnd As String) As String
    Dim sectionStart As Long
    Dim sectionEnd As Long
    Dim groupStart As Long
    Dim groupEnd As Long
    Dim cmd As String
    Dim idx As Long
    Dim idxDelim As Long
    Dim resstr As String
    Dim nonCmd As String
    
    sectionStart = InStr(1, str, sectBeg, vbTextCompare)
    
    While sectionStart > 0
        sectionEnd = InStr(sectionStart + 1, str, sectEnd, vbTextCompare)
        groupStart = InStr(sectionStart + 1, str, "{", vbTextCompare)
        groupEnd = InStr(sectionStart + 1, str, "}", vbTextCompare)
        
        If (groupStart > sectionStart And groupStart < sectionEnd) Or (groupEnd > sectionStart And groupEnd < sectionEnd) Then
            'clear section:
            'read from < to >
            'and replace them in src for ""
            'place the command to the last position
            cmd = Mid(str, sectionStart, sectionEnd - sectionStart + 1)
            cmd = Replace(cmd, "\'94", """", , , vbTextCompare)
            cmd = Replace(cmd, "\lquote ", "'", , , vbTextCompare)
            cmd = Replace(cmd, "\rquote ", "'", , , vbTextCompare)
            
            'search for {
            idx = 1
            resstr = ""
            While idx <= Len(cmd)
                If Mid(cmd, idx, 1) <> "}" And Mid(cmd, idx, 1) <> "{" And Mid(cmd, idx, 1) <> "\" And Asc(Mid(cmd, idx, 1)) > 31 Then
                    resstr = resstr + Mid(cmd, idx, 1)
                    idx = idx + 1
                Else
                    If Asc(Mid(cmd, idx, 1)) < 31 Then
                        nonCmd = nonCmd + Mid(cmd, idx, 1)
                        idx = idx + 1
                    End If
                    If Mid(cmd, idx, 1) = "}" Then
                        nonCmd = nonCmd + "}"
                        idx = idx + 1
                    End If
                    If Mid(cmd, idx, 1) = "{" Then
                        nonCmd = nonCmd + "{"
                        idx = idx + 1
                    End If
                    If Mid(cmd, idx, 1) = "\" Then
                        If Mid(cmd, idx, 4) = "\'94" Then
                            resstr = resstr + """"
                            idx = idx + 4
                        Else
                            idxDelim = InStr(idx, cmd, " ", vbTextCompare)
                            If idxDelim > 0 Then
                                nonCmd = nonCmd + Mid(cmd, idx, idxDelim - idx + 1)
                                idx = idx + Len(Mid(cmd, idx, idxDelim - idx)) + 1
                            Else
                                nonCmd = nonCmd + Mid(cmd, idx)
                                idx = idx + Len(Mid(cmd, idx))
                            End If
                        End If
                    End If
                End If
            Wend
            Debug.Print resstr & " " & nonCmd
            str = Left(str, sectionStart - 1) & resstr & nonCmd & Mid(str, sectionEnd + 1)
            sectionStart = InStr(sectionStart + Len(resstr + nonCmd), str, sectBeg, vbTextCompare)
        Else
            sectionStart = InStr(sectionEnd + 1, str, sectBeg, vbTextCompare)
        End If
    Wend
    ClearTags = str
End Function

Function ClosePrevSection() As String
    Dim i As Integer
    Dim res As String
    res = ""
    
    For i = 2 To Head
        res = res + "}"
    Next
    ClosePrevSection = res
End Function

Function StartNextSectin() As String
    Dim i As Integer
    Dim res As String
    res = ""
    
    Debug.Print "Head = " & CStr(Head)
    For i = 2 To Head
        res = res + "{" + Stack(i)
    Next
    StartNextSectin = res
End Function

Function ExtractTag(str As String) As String
    Dim sectionStart As Long
    Dim sectionEnd As Long
    Dim substr As String
    
    'заменить \'94 на "
    sectionStart = InStr(1, str, "<", vbTextCompare)
    sectionEnd = InStr(sectionStart, str, ">", vbTextCompare)
    substr = Replace(Mid(str, sectionStart, sectionEnd - sectionStart + 1), "\'94", """", , , vbTextCompare)
    'substr = Replace(substr, "\lquote ", "'", , , vbTextCompare)
    'substr = Replace(substr, "\rquote ", "'", , , vbTextCompare)
    
    ExtractTag = Mid(str, 1, sectionStart - 1) & ClosePrevSection & substr & StartNextSectin & Mid(str, sectionEnd + 1)
End Function

Private Function makeXML(ByVal str As String) As String
    Dim sectionStart As Long
    Dim sectionEnd As Long
    Dim sectionNum As Integer
    Dim goAhead As Boolean
    Dim substr As String
    
    'заменить \'94 на "
    sectionStart = InStr(1, str, "<", vbTextCompare)
    While sectionStart > 0
        sectionEnd = InStr(sectionStart, str, ">", vbTextCompare)
        substr = Mid(str, sectionStart, sectionEnd - sectionStart + 1)
        str = Left(str, sectionStart - 1) & substr & Mid(str, sectionEnd + 1)
        sectionStart = InStr(sectionStart + 1, str, "<")
    Wend
    
    goAhead = True
    sectionStart = 1
    If InStr(sectionStart, str, "<", vbTextCompare) > 1 Then
        While goAhead
            sectionEnd = InStr(sectionStart, str, "<", vbTextCompare)
            If sectionEnd < 1 Then
                goAhead = False
                str = Left(str, sectionStart - 1) & "<body>" & Mid(str, sectionStart) & "</body>"
            Else
                str = Left(str, sectionStart - 1) & "<body>" & Mid(str, sectionStart, sectionEnd - sectionStart) & "</body>" & Mid(str, sectionEnd)
                sectionStart = InStr(sectionEnd + Len("<body></body>"), str, ">") + 1
            End If
        Wend
    End If
    
    makeXML = "<Report>" & str & "</Report>"
End Function

Public Sub ProcessXMLSection(ByVal node As IXMLDOMElement, ByVal ScrEnv As ScriptControl, ByVal AppendTable As Boolean)
    Dim rs As ADODB.Recordset
    Dim i As Integer
    Dim cmd As String
    Dim firstRow As Boolean
    Dim n As IXMLDOMElement
    Dim newnode As IXMLDOMElement
    Dim repeatOnce As Boolean
    Dim goAhead As Boolean
    Dim valstr As String
    Dim xmlattr As IXMLDOMAttribute
    
    goAhead = False
    If UCase(node.BaseName) = "REPEAT" Then
        repeatOnce = False
        goAhead = True
    End If
    If UCase(node.BaseName) = "SECTION" Then
        repeatOnce = True
        goAhead = True
    End If
    
    If goAhead Then
        cmd = GetXMLAttr(node, "cmd").Text
        cmd = ProcessVals(cmd, ScrEnv)
        Set xmlattr = GetXMLAttr(node, "AppendTable")
        If Not xmlattr Is Nothing Then
            AppendTable = CBool(xmlattr.Text)
        Else
            AppendTable = False
        End If
        Set xmlattr = GetXMLAttr(node, "AppendToHeader")
        If Not xmlattr Is Nothing Then
            firstRow = Not CBool(xmlattr.Text)
            If Not firstRow Then
                AppendTable = True
            End If
        Else
            firstRow = True
        End If
        
        Set rs = mADOConnection.Execute(cmd)
        RaiseEvent OnProgress(node.BaseName + " " + cmd)
        DoEvents
        If Not rs.EOF Then
            goAhead = True
        Else
            goAhead = False
        End If
        While goAhead
            For i = 0 To rs.Fields.Count - 1
                If Len(rs.Fields(i).Value) > 0 Then
                    If TypeName(rs.Fields(i).Value) = "String" Then
                        ScrEnv.ExecuteStatement rs.Fields(i).name + " = """ + rs.Fields(i).Value + """"
                    ElseIf TypeName(rs.Fields(i).Value) = "Date" Then
                        ScrEnv.ExecuteStatement rs.Fields(i).name + " = CDate(" + CStr(rs.Fields(i).Value) + ")"
                    Else
                        ScrEnv.ExecuteStatement rs.Fields(i).name + " = " + CStr(rs.Fields(i).Value)
                    End If
                Else
                    ScrEnv.ExecuteStatement rs.Fields(i).name + " = """""
                End If
            Next
            
            ' SubSections
            For i = 1 To node.ChildNodes.Length
                Set n = node.ChildNodes(i - 1)
                If n.NodeType = NODE_ELEMENT Then
                    ProcessXMLSection n, ScrEnv, AppendTable And (Not firstRow)
                End If
            Next
            rs.MoveNext
            If Not rs.EOF And Not repeatOnce Then
                goAhead = True
                firstRow = False
                'Set node = node.ParentNode.ChildNodes.Add("ITEM")
            Else
                goAhead = False
            End If
        Wend
    Else
        'Process values
        valstr = ProcessVals(node.Text, ScrEnv)
        If AppendTable Then
            ResRepString = RemoveEndOfTable(ResRepString) & ExtractTableRows(valstr)
        Else
            ResRepString = ResRepString + valstr
        End If

    End If
End Sub

Function ExtractTableRows(ByVal str As String) As String
    Dim tblStart As Long
    
    tblStart = InStr(1, str, "\trowd", vbTextCompare)
    If tblStart > 0 Then
        ExtractTableRows = Mid(str, tblStart)
    Else
        ExtractTableRows = str
    End If
End Function

Function RemoveEndOfTable(ByVal str As String) As String
    Dim tblEnd As Long
    Dim idx As Long
    Dim goAhead As Boolean
    
    idx = Len(str) - 4
    If idx > 0 Then goAhead = True
    
    RemoveEndOfTable = str
    
    While goAhead
        If Mid(str, idx, 4) = "\row" Then
            tblEnd = InStr(idx, str, "}", vbTextCompare)
            goAhead = False
            If tblEnd > 0 Then
                RemoveEndOfTable = Left(str, tblEnd)
            Else
                RemoveEndOfTable = Left(str, idx)
            End If
        Else
            If Len(str) - idx >= 8 And Mid(str, idx, 8) = "\nestrow" Then 'nested row end
                tblEnd = InStr(idx, str, "}", vbTextCompare)
                goAhead = False
                If tblEnd > 0 Then
                    RemoveEndOfTable = Left(str, tblEnd)
                Else
                    RemoveEndOfTable = Left(str, idx)
                End If
            Else
                idx = idx - 1
                If idx = 0 Then
                    RemoveEndOfTable = str
                    goAhead = False
                End If
            End If
        End If
    Wend
End Function

Function ProcessVals(ByVal str As String, ByVal ScrEnv As ScriptControl) As String
    Dim startPos As Long
    Dim endPos As Long
    Dim val As String
    Dim formula As String
    
    startPos = InStr(1, str, "#", vbTextCompare)
    While startPos > 0
        endPos = InStr(startPos + 1, str, "#")
        formula = Trim(Mid(str, startPos + 1, endPos - startPos - 1))
        If Left(formula, 1) <> "=" Then ' это надо просто выполнить
            val = ""
            ScrEnv.ExecuteStatement formula
        Else
            val = encodeText(CStr(ScrEnv.Eval(Mid(formula, 2)))) ' удаляем знак = в начале
        End If
        str = Left(str, startPos - 1) & val & Mid(str, endPos + 1)
        startPos = InStr(startPos - 1 + Len(val), str, "#", vbTextCompare)
    Wend
    ProcessVals = str
End Function

Function encodeText(ByVal str As String) As String
    Dim i As Integer
    Dim res As String
    
    For i = 1 To Len(str)
        If Asc(Mid(str, i, 1)) > 127 Then
            res = res + "\'" + Hex(Asc(Mid(str, i, 1)))
        Else
            res = res + Mid(str, i, 1)
        End If
    Next
    encodeText = res
End Function
