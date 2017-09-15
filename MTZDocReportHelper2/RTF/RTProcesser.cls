VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RTProcesser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private session As MTZSession.session


Public Sub MakeDocument2(the_session As MTZSession.session, template As String, fn As String)
    Dim ScrEnv As New ScriptControl
    Dim ff As Long
    Dim str As String
    
    ScrEnv.Language = "VBSCRIPT"
    ScrEnv.Reset
    
    Set session = the_session
    ' processing text
    
    ff = FreeFile
    Open template For Input As #ff
    str = Input(LOF(ff), ff)
    Close #ff
    
    str = makeXML(str)
    
'    Dim root As WordSection
'    Dim allDoc As Word.Range
'    Set allDoc = templ.Range
'
'    Set root = getSection(allDoc, 1)
'    ProcessSection root, ScrEnv
'    DeleteComments allDoc
'    templ.SaveAs template & "ready.doc", , , , , , False
'    templ.Close
'    Set wApp = Nothing
'

End Sub

Private Function makeXML(str As String) As String
    Dim sectionStart As Long
    Dim sectionEnd As Long
    Dim sectionNum As Integer
    Dim goAhead As Boolean
    
    goAhead = True
    sectionStart = 1
    If InStr(sectionStart, str, "<", vbTextCompare) > 1 Then
        While goAhead
            sectionEnd = InStr(sectionStart, str, "<", vbTextCompare)
            If sectionEnd < 1 Then
                sectionEnd = Len(str)
                goAhead = False
            End If
            str = Left(str, sectionStart - 1) & "<body>" & Mid(str, sectionStart, sectionEnd - sectionStart) & "</body>" & Mid(str, sectionEnd)
            sectionStart = InStr(sectionEnd + Len("<body></body>"), str, ">") + 1
        Wend
    End If
End Function

Private Sub DeleteComments(Range As Word.Range)
    While Range.Comments.Count > 0
        Range.Comments(1).Scope.Select
        Selection.Delete
    Wend
End Sub

Public Sub ProcessSection(section As WordSection, ByVal ScrEnv As ScriptControl)
    If section.SectionType = "Section" Then
        ProcessPlainSection section, ScrEnv
    End If
    If section.SectionType = "Repeat" Then
        ProcessRepeat section, ScrEnv
    End If
    
End Sub

Public Sub ProcessPlainSection(section As WordSection, ByVal ScrEnv As ScriptControl)
    Dim rs As ADODB.Recordset
    Dim idx As Integer
    Dim nextSection As WordSection
    Dim FieldRange As Word.Range
    Dim val As String
    Dim i As Integer
    
    Set rs = session.GetData(section.SQL)

    If Not rs.EOF Then
        For i = 0 To rs.Fields.Count - 1
            'val = ScrEnv.Eval(rs.Fields(i).name + " = """ + rs.Fields(i).Value + """")
            ScrEnv.ExecuteStatement rs.Fields(i).name + " = """ + rs.Fields(i).Value + """"
        Next
    End If
    
    ' SubSections
    idx = 1
    Set nextSection = getSection(section.Range, idx)
    While Not nextSection Is Nothing
        ProcessSection nextSection, ScrEnv
        idx = idx + 1
        Set nextSection = getSection(section.Range, idx)
    Wend
    
    'Values
    i = 1
    While i <= section.Range.Fields.Count
        Set FieldRange = section.Range.Fields(i).Code
        If Left(Trim(FieldRange.Text), 4) = "mtz:" Then
            val = CStr(ScrEnv.Eval(Right(Trim(FieldRange.Text), Len(Trim(FieldRange.Text)) - 4)))
            section.Range.Document.Range(FieldRange.Start - 1, FieldRange.End).InsertBefore val
            section.Range.Fields(i).Delete
        Else
            i = i + 1
        End If
        
    Wend
    
    'section.Range.Text = section.Range.Text + "LaLaLa"
End Sub

Public Sub ProcessRepeat(section As WordSection, ByVal ScrEnv As ScriptControl)
    Dim rs As ADODB.Recordset
    Dim idx As Integer
    Dim nextSection As WordSection
    Dim FieldRange As Word.Range
    Dim val As String
    Dim i As Integer
    Dim rangeSize As Long
    Dim newRange As Word.Range
    Dim rstart As Long
    Dim rend As Long
    Dim clip As IPictureDisp
    Dim box As New Stream
    
    Set rs = session.GetData(section.SQL)
   
    section.Range.Select
    Selection.Copy '.Duplicate
    Set clip = Clipboard.GetData '.GetText
    
    
    rangeSize = Selection.Range.End - Selection.Range.Start
    rstart = Selection.Range.Start
    rend = Selection.Range.End
    While Not rs.EOF
        For i = 0 To rs.Fields.Count - 1
            'val = ScrEnv.Eval(rs.Fields(i).name + " = """ + rs.Fields(i).Value + """")
            ScrEnv.ExecuteStatement rs.Fields(i).name + " = """ + rs.Fields(i).Value + """"
        Next
        ' SubSections
        idx = 1
        Set nextSection = getSection(section.Range, idx)
        While Not nextSection Is Nothing
            ProcessSection nextSection, ScrEnv
            idx = idx + 1
            Set nextSection = getSection(section.Range, idx)
        Wend
        
        'Values
        i = 1
        While i <= section.Range.Fields.Count
            Set FieldRange = section.Range.Fields(i).Code
            If Left(Trim(FieldRange.Text), 4) = "mtz:" Then
                val = CStr(ScrEnv.Eval(Right(Trim(FieldRange.Text), Len(Trim(FieldRange.Text)) - 4)))
                section.Range.Document.Range(FieldRange.Start - 1, FieldRange.End).InsertBefore val
                section.Range.Fields(i).Delete
            Else
                i = i + 1
            End If
        Wend
        rs.MoveNext
        If Not rs.EOF Then
            section.Range.Select
            Selection.MoveDown
            Selection.MoveLeft 2
            rstart = Selection.Range.Start
            Clipboard.SetText clip
            Selection.Paste
            rend = rstart + rangeSize
            Set section.Range = section.Range.Document.Range(rstart, rend) 'section.Range.End + rangeSize)
        End If
    Wend
End Sub
Public Function getSectionOld(Range As Word.Range, idx As Integer) As WordSection
    Dim Res As WordSection
    Dim com As Word.Comment
    Dim i As Integer
    Dim eor As Long
    Dim goAhead As Boolean
    Dim nextRange As Word.Range
    Dim slen As Integer
    
    If Range.Comments.Count > 0 Then
        If idx = 1 Then
            Set com = Range.Comments(1)
        Else
            eor = Range.Comments(1).Range.End
            goAhead = True
            While goAhead
                Set nextRange = Range.Document.Range(eor + 1, Range.End)
                If nextRange.Comments.Count > 0 Then
                    eor = nextRange.Comments(1).Range.End
                    idx = idx - 1
                    If idx = 0 Or eor >= Range.End Then
                        goAhead = False
                        If idx = 0 Then
                            Set com = nextRange.Comments(1)
                        End If
                    End If
                Else
                    goAhead = False
                    Set com = Nothing
                End If
            Wend
        End If
    End If
    
    If Not com Is Nothing Then
        Set Res = New WordSection
        Set Res.Range = com.Scope
        slen = Len("section:")
        If Left(com.Range.Text, slen) = "Section:" Then
            Res.SQL = Right(com.Range.Text, Len(com.Range.Text) - slen)
            Res.SectionType = "Section"
        End If
        slen = Len("repeat:")
        If Left(com.Range.Text, slen) = "Repeat:" Then
            Res.SQL = Right(com.Range.Text, Len(com.Range.Text) - slen)
            Res.SectionType = "Repeat"
        End If
    End If
    Set getSection = Res
End Function

Public Function getSection(Range As Word.Range, idx As Integer) As WordSection
    Dim Res As WordSection
    Dim com As Word.Comment
    Dim com2 As Word.Comment
    Dim i As Integer
    Dim eor As Long
    Dim goAhead As Boolean
    Dim nextRange As Word.Range
    Dim slen As Integer
    Dim rstart As Long
    Dim rend As Long
    
    
    If Range.Comments.Count > 0 Then
        If idx = 1 Then
            Set com = Range.Comments(1)
            Set com2 = getComment(Range, "EndOf_" & extractTagName(com.Range.Text))
        Else
            Set com = Range.Comments(1)
            Set com2 = getComment(Range, "EndOf_" & extractTagName(com.Range.Text))
            eor = com2.Scope.End
            goAhead = True
            While goAhead
                Set nextRange = Range.Document.Range(eor + 1, Range.End)
                If nextRange.Comments.Count > 0 Then
                    Set com = nextRange.Comments(1)
                    Set com2 = getComment(nextRange, "EndOf_" & extractTagName(com.Range.Text))
                    eor = com2.Scope.End
                    idx = idx - 1
                    If idx = 0 Or eor >= Range.End Then
                        goAhead = False
                        If idx <> 0 Then
                            Set com = Nothing
                        End If
                    End If
                Else
                    goAhead = False
                    Set com = Nothing
                End If
            Wend
        End If
    End If
    
    If Not com Is Nothing And Not com2 Is Nothing Then
        Set Res = New WordSection
        If Range.Document.Range(com.Scope.End + 1, com.Scope.End + 2) = vbCr Then
            rstart = com.Scope.End + 2
        Else
            rstart = com.Scope.End + 1
        End If
        If com2.Scope.Start > 1 Then
            If Left(Range.Document.Range(com2.Scope.Start - 1, com2.Scope.Start), 1) = vbCr Then
                rend = com2.Scope.Start '-1
            Else
                rend = com2.Scope.Start
            End If
        Else
        End If
        
        Set Res.Range = Range.Document.Range(rstart, rend)
        slen = Len("section")
        If Left(com.Range.Text, slen) = "Section" Then
            Res.SQL = Right(com.Range.Text, Len(com.Range.Text) - slen - 4)
            Res.SectionType = "Section"
        End If
        slen = Len("repeat")
        If Left(com.Range.Text, slen) = "Repeat" Then
            Res.SQL = Right(com.Range.Text, Len(com.Range.Text) - slen - 4)
            Res.SectionType = "Repeat"
        End If
    End If
    Set getSection = Res
End Function

Private Function extractTagName(str As String) As String
'
    Dim idx As Integer
    idx = InStr(1, str, "#", vbTextCompare)
    extractTagName = Left(str, idx - 1)
End Function

Private Function getComment(Range As Word.Range, str As String) As Word.Comment
    Dim i As Integer
    Dim goAhead As Boolean
    goAhead = True
    i = 1
    
    While goAhead
        If i > Range.Comments.Count Then
            goAhead = False
        Else
            If Range.Comments(i).Range.Text = str Then
                Set getComment = Range.Comments(i)
                goAhead = False
            End If
        End If
        i = i + 1
    Wend
End Function
