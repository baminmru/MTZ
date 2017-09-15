VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TEmplatedDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public wrd As Object 'Word.Application
Public wdoc As Object 'Word.Document
Public tdoc As Object 'Word.Document
Public H As Long
Public WMFID As Long
Public SrcItem As Object
Public FieldMark As String

Public ForMark As String
Public NextMark As String
Public MarkRef As Collection
Private Indexes As Collection
Private CloseAfter As Boolean
Private session As MTZSession.session
Public res As Variant

Private Sub InitMarker()
    FieldMark = "FIELD:"
    ForMark = "FOR:"
    NextMark = "NEXT:"
End Sub

Public Sub MakeDocument2(the_session As MTZSession.session, template As String, fn As String)
    Dim wApp As Word.Application
    Dim templ As Word.Document
    Dim doc As Word.Document
    Set wApp = New Word.Application
    Dim ScrEnv As New ScriptControl
    ScrEnv.Language = "VBSCRIPT"
    ScrEnv.Reset
    ScrEnv.AddObject "TheParent", Me, True
    
    Set session = the_session
    Set templ = wApp.Documents.Open(template, False, True)
    'Set doc = wApp.Documents.Add
    wApp.Visible = True
    ' processing text
    
    Dim root As WordSection
    Dim allDoc As Word.Range
    Set allDoc = templ.Range
    
    Set root = getSection(allDoc, 1)
    ProcessSection root, ScrEnv
    DeleteComments allDoc
    templ.SaveAs template & "ready.doc", , , , , , False
    templ.Close
    Set wApp = Nothing
End Sub

Private Sub DeleteComments(Range As Object)
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
Public Function getSectionOld(Range As Object, idx As Integer) As Object
    Dim res As WordSection
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
        Set res = New WordSection
        Set res.Range = com.Scope
        slen = Len("section:")
        If Left(com.Range.Text, slen) = "Section:" Then
            res.SQL = Right(com.Range.Text, Len(com.Range.Text) - slen)
            res.SectionType = "Section"
        End If
        slen = Len("repeat:")
        If Left(com.Range.Text, slen) = "Repeat:" Then
            res.SQL = Right(com.Range.Text, Len(com.Range.Text) - slen)
            res.SectionType = "Repeat"
        End If
    End If
    Set getSectionOld = res
End Function

Public Function getSection(Range As Object, idx As Integer) As WordSection
    Dim res As WordSection
    Dim com As oject 'Comment
    Dim com2 As oject 'Comment
    Dim i As Integer
    Dim eor As Long
    Dim goAhead As Boolean
    Dim nextRange As Object 'Range
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
        Set res = New WordSection
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
        
        Set res.Range = Range.Document.Range(rstart, rend)
        slen = Len("section")
        If Left(com.Range.Text, slen) = "Section" Then
            res.SQL = Right(com.Range.Text, Len(com.Range.Text) - slen - 4)
            res.SectionType = "Section"
        End If
        slen = Len("repeat")
        If Left(com.Range.Text, slen) = "Repeat" Then
            res.SQL = Right(com.Range.Text, Len(com.Range.Text) - slen - 4)
            res.SectionType = "Repeat"
        End If
    End If
    Set getSection = res
End Function

Private Function extractTagName(str As String) As String
'
    Dim idx As Integer
    idx = InStr(1, str, "#", vbTextCompare)
    extractTagName = Left(str, idx - 1)
End Function

Private Function getComment(Range As Object, str As String) As Object  'Comment
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
Public Sub MakeDocument(UseSrcItem As Object, template As String, fn As String)
    On Error GoTo err2
    Set wrd = CreateObject("Word.Application")
    InitMarker
    Set SrcItem = UseSrcItem
    On Error GoTo err1
    SaveSetting App.TITLE, "Recent", "LastWord", fn
    If wrd.Visible = False Then
        CloseAfter = True
    End If
    wrd.Visible = True
    
    Set tdoc = wrd.Documents.Open(template, False, True, , , , , , , , , False)
    Set wdoc = wrd.Documents.Add
    wrd.DisplayAlerts = False
    On Error Resume Next
    Kill fn
    On Error GoTo err1
    wdoc.SaveAs fn
    H = -1
    MakeContent
    DoEvents
    wrd.DisplayAlerts = True
    wdoc.Activate
    If wdoc.Saved = False Then
      wdoc.Save
    End If
    tdoc.Close False
    Set tdoc = Nothing
'    wdoc.Close -1
'    Set wdoc = Nothing
'    wrd.Visible = True
'    wrd.Activate
'
'    If CloseAfter Then
'        wrd.Quit
'    End If
'    Set wrd = Nothing
    
    
    On Error Resume Next
    ' Locked By MS Word ....
    
    Exit Sub
err1:
    
    Resume err2
err2:
    Err.Clear
    On Error Resume Next
    wdoc.Close -1
    Set wrd = Nothing
End Sub

Public Sub CloseDocument()
    On Error GoTo err1
    If Not wrd Is Nothing Then
      wrd.DisplayAlerts = True
      If Not wdoc Is Nothing Then
        wdoc.Activate
        If wdoc.Saved = False Then
          wdoc.Save
        End If
        wdoc.Close -1
        Set wdoc = Nothing
      End If
      wrd.Visible = True
      wrd.Activate
      wrd.Quit
      Set wrd = Nothing
    End If
err1:
    Err.Clear
    On Error Resume Next
    wdoc.Close -1
    wrd.Quit
    Set wrd = Nothing

End Sub

' вставка картинки в документ
Public Sub AddPicture(filePath As String)
  OutStr " "
  wdoc.Paragraphs(wdoc.Paragraphs.Count - 1).Range.InlineShapes.AddPicture FileName:=filePath, LinkToFile:=False, SaveWithDocument:=True, Range:=wdoc.Paragraphs(wdoc.Paragraphs.Count - 1).Range
  OutStr " "
End Sub

'оформить группу параграфов как таблицу (3 колонки)
Public Sub MakeTable(ByVal sp As Long, ByVal ep As Long, ByVal NRow As Long, Optional ByVal NCol As Long = 3)
  Dim Range As Object 'Word.Range
  Set Range = wdoc.Range(wdoc.Paragraphs(sp).Range.Start, wdoc.Paragraphs(ep).Range.End)
  Range.ConvertToTable Separator:=1, _
  NumColumns:=NCol, _
  NumRows:=NRow, _
  Format:=23, _
  ApplyBorders:=True, ApplyShading:=True, ApplyFont:=True, _
  ApplyColor:=True, ApplyHeadingRows:=True, _
  ApplyLastRow:=False, ApplyFirstColumn:=True, ApplyLastColumn:=False, _
  AutoFit:=True, AutoFitBehavior:=0 'wdAutoFitFixed
  Range.Tables(1).AllowAutoFit = True
  
  
End Sub


Public Function Plain(ByVal s As String) As String
Plain = Replace(Replace(Replace(Replace(s, vbTab, " "), vbCrLf, "  "), vbCr, " "), vbLf, " ")
End Function

' Добавить параграф
Public Sub OutStr(s As String)
   Dim P As Long
   P = wdoc.Paragraphs.Count()
   wdoc.Paragraphs(P).Range.InsertAfter s
   wdoc.Paragraphs.Add
   Normal
End Sub



' оформить как заголовок уровня H
Public Sub Header()
      If H > -2 Then H = -2
      If H < -10 Then H = -10
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Format.Style = H
End Sub

' Вставить разрыв страницы
Public Sub PageBreak()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P).Range.InsertBreak 7 'wdPageBreak
End Sub

'Выравнивание вправо
Public Sub RightAlign()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs.Item(P - 1).Alignment = 2 'wdAlignParagraphRight
End Sub


' Оформить жирным шрифом
Public Sub Bold()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Range.Font.Bold = True
End Sub
' Оформить как подчеркивание
Public Sub Underline()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Range.Font.Underline = True
End Sub


' Оформить курсивом
Public Sub Italic()
  On Error Resume Next
  Dim P As Long
  P = wdoc.Paragraphs.Count()
  wdoc.Paragraphs(P - 1).Range.Font.Italic = True
End Sub


Public Sub Normal()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Range.Font.Bold = False
      wdoc.Paragraphs(P - 1).Range.Font.Italic = False
End Sub


Public Sub NextHeader()
  If H > -10 Then
    H = H - 1
  End If
End Sub

Public Sub PrevHeader()
  If H < -2 Then
    H = H + 1
  End If
End Sub

Public Sub PrevHeader2()
  PrevHeader
  PrevHeader
End Sub

Private Sub MakeContent()
Dim scr As MSScriptControl.ScriptControl
Set scr = New MSScriptControl.ScriptControl
scr.Language = "VBSCRIPT"
scr.Reset
scr.AddObject "Doc", SrcItem, True
scr.AddObject "Gen", Me, True
Set Indexes = New Collection
Set MarkRef = New Collection

Dim fld As Object 'Word.Field
Dim ft As String
Dim expr As String
Dim idata As IndexData
Dim farr() As String
Dim par As Object 'Paragraph
Dim tbl As Object 'TABLE
Dim looplevel As Long



Dim pidx As Long

On Error Resume Next
' параметры документа

wdoc.PageSetup.Orientation = tdoc.PageSetup.Orientation

looplevel = 0
' нам надо сначала скопировать все параграфы в новый файл
Dim done As Boolean
Dim trow As Object 'Word.ROW
Dim tcell As Object 'Word.CELL
Dim wtbl As Object 'Word.TABLE
Dim wrow As Object 'Word.ROW
Dim wcell As Object 'Word.CELL
Dim firstRow As Boolean

pidx = 1
Set par = tdoc.Paragraphs.Item(1)

While Not par Is Nothing
    'Debug.Print par.Range.Text
    done = False
    If par.Range.Tables.Count = 0 Then
        
        For Each fld In par.Range.Fields
          ft = fld.Result.Text
          If UCase(ForMark) = Left(UCase(ft), Len(ForMark)) Then
            expr = Right(ft, Len(ft) - Len(ForMark))
            farr = Split(expr, ";")
            Set idata = New IndexData
            idata.name = Trim(UCase(farr(0)))
            idata.MinValue = scr.Eval(farr(1))
            idata.MaxValue = scr.Eval(farr(2))
            idata.Value = idata.MinValue
            Set idata.StartFld = fld
            On Error Resume Next
            Indexes.Add idata, idata.name
          End If
    
          If UCase(NextMark) = Left(UCase(ft), Len(NextMark)) Then
             expr = Right(ft, Len(ft) - Len(NextMark))
             On Error Resume Next
             Set idata = Indexes.Item(Trim(UCase(expr)))
             Set idata.StopFld = fld
             ' увеличиваем счетчик
             idata.Value = idata.Value + 1
             If idata.Value <= idata.MaxValue Then
                ' возвращаемся к параграфу, который является началом цикла
                done = True
                Set par = idata.StartFld.Range.Paragraphs(1)
             End If
          End If
       Next
       
       pidx = CopyRange(par.Range)
       SetupIndexes pidx
    Else
      Dim nr As Object 'Range
      Dim cellidx As Long
      Dim collidx As Long
      Dim rowidx As Long
      Dim coll As Object 'Column
      Set nr = wdoc.Paragraphs.Last.Range
      Dim forpar As Object 'Paragraph
      Set forpar = par
      For Each tbl In forpar.Range.Tables
        ProcessTable Nothing, tbl, nr, scr
        Set par = tbl.Range.Paragraphs.Last
        'done = True
      Next
        
      End If
      If Not done Then Set par = par.Next

    Wend

   ' потом посчитать значения полей с учетом раскрытых циклов
   For Each fld In wdoc.Fields
        ft = fld.Result.Text
        ' поля просто заменяем на значение выражения
        If UCase(FieldMark) = Left(UCase(ft), Len(FieldMark)) Then
            expr = Right(ft, Len(ft) - Len(FieldMark))
            ft = scr.Eval(expr)
            fld.Result.Text = ft
        Else
            fld.Result.Text = ""
        End If
        
    Next
    Set scr = Nothing
End Sub

Private Function InsertIndexes(ByVal s As String) As String
Dim i As Long
Dim idt As IndexData
For Each idt In Indexes
    s = Replace(s, "%" & idt.name & "%", idt.Value)
Next
InsertIndexes = s
End Function

Private Function CopyRanges(ByVal idata As IndexData) As Long
    Dim r1 As Object 'Range
    Dim r2 As Object 'Range
    Dim r3 As Object 'Range
    Set r1 = idata.StartFld.Result
    Set r2 = idata.StopFld.Result
    tdoc.Range(r1.Start, r2.End).Select
    tdoc.Range(r1.Start, r2.End).Copy
    Dim P As Long
    P = wdoc.Paragraphs.Count()
    wdoc.Paragraphs(P).Range.Paste
    '.PasteAndFormat (Word.wdoriginalFormatting)
     
    CopyRanges = P
End Function

Private Sub SetupIndexes(p1 As Long)
   Dim fld As Object 'Field
   Dim pr As Object 'Paragraph
   Dim i As Long
   Dim ft As String, expr As String
   For i = p1 To wdoc.Paragraphs.Count
    Set pr = wdoc.Paragraphs.Item(i)
    For Each fld In pr.Range.Fields
         ft = fld.Result.Text
         ' поля просто заменяем на значение выражения
         If UCase(FieldMark) = Left(UCase(ft), Len(FieldMark)) Then
             ft = InsertIndexes(ft)
             fld.Result.Text = ft
         Else
             fld.Result.Text = ""
         End If
     Next
    Next

End Sub


Private Sub SetupIndexes2(r As Object)
   Dim fld As Object 'field
   Dim i As Long
   Dim ft As String, expr As String
    For Each fld In r.Fields
         ft = fld.Result.Text
         ' поля просто заменяем на значение выражения
         If UCase(FieldMark) = Left(UCase(ft), Len(FieldMark)) Then
             ft = InsertIndexes(ft)
             fld.Result.Text = ft
         Else
             fld.Result.Text = ""
         End If
    Next
End Sub


Private Function CopyRange(ByVal r As Object) As Long
    Dim r3 As Object 'Range
    r.Select
    r.Copy
    Dim P As Long
    P = wdoc.Paragraphs.Count()
    wdoc.Paragraphs(P).Range.Paste
    'wdoc.Paragraphs(P).Range.PasteAndFormat wdFormatOriginalFormatting
    CopyRange = P
End Function


Private Sub ProcessTable(root As Object, tbl As Object, rng As Object, scr As Object)
  Dim done As Boolean
  Dim trow As Object 'Word.ROW
  Dim tcell As Object 'Word.CELL
  Dim wtbl As Object 'Word.TABLE
  Dim wrow As Object 'Word.ROW
  Dim wcell As Object 'Word.CELL
  Dim firstRow As Boolean
  Dim fld As Object 'Word.Field
  Dim ft As String
  Dim expr As String
  Dim idata As IndexData
  Dim farr() As String
  Dim nr As Object 'Range
  Dim cellidx As Long
  Dim collidx As Long
  Dim rowidx As Long
  Dim coll As Object 'Column
  On Error Resume Next
  Err.Clear
  
  If Not root Is Nothing Then
    root.Select
    Set wtbl = wdoc.Tables.Add(wrd.Selection.Range, 1, tbl.Columns.Count)
  Else
    Set wtbl = wdoc.Tables.Add(rng, 1, tbl.Columns.Count)
  End If
  
  If Err.Number > 0 Then Stop
  
  For collidx = 1 To tbl.Columns.Count
      wtbl.Columns.Item(collidx).Width = tbl.Columns.Item(collidx).Width
  Next
  For rowidx = 1 To tbl.Rows.Count
    Set trow = tbl.Rows.Item(rowidx)
    If rowidx = 1 Then
      Set wrow = wtbl.Rows.Item(1)
    Else
      Set wrow = wtbl.Rows.Add
    End If
    wrow.AllowBreakAcrossPages = trow.AllowBreakAcrossPages
    wrow.HeadingFormat = trow.HeadingFormat
    
    wrow.Alignment = trow.Alignment
        
    For cellidx = 1 To trow.Cells.Count
      Set tcell = trow.Cells.Item(cellidx)
      Set wcell = wrow.Cells.Item(cellidx)
      If tcell.Tables.Count = 0 Then
        tcell.Range.Copy
        wcell.Range.Paste
        'wcell.Range.PasteAndFormat wdFormatOriginalFormatting
        For Each fld In tcell.Range.Fields
          wcell.Range.Fields.Add wcell.Range, fld.Type, fld.Result.Text
          ft = fld.Result.Text
          On Error Resume Next
          If UCase(ForMark) = Left(UCase(ft), Len(ForMark)) Then
            expr = Right(ft, Len(ft) - Len(ForMark))
            farr = Split(expr, ";")
            Set idata = Nothing
            Set idata = Indexes.Item(Trim(UCase(farr(0))))
            If idata Is Nothing Then
              Set idata = New IndexData
              idata.Value = scr.Eval(farr(1))
            End If
            idata.name = Trim(UCase(farr(0)))
            idata.MinValue = scr.Eval(farr(1))
            idata.MaxValue = scr.Eval(farr(2))
            
            If idata.Value > idata.MaxValue Then
              idata.Value = idata.MinValue
            End If
            If idata.Value < idata.MinValue Then
              idata.Value = idata.MinValue
            End If
            
            Set idata.StartFld = fld
            idata.StartRow = rowidx
            On Error Resume Next
            Indexes.Add idata, idata.name
            fld.Result.Next
          End If
          
          If UCase(NextMark) = Left(UCase(ft), Len(NextMark)) Then
             expr = Right(ft, Len(ft) - Len(NextMark))
             
             Set idata = Nothing
             Set idata = Indexes.Item(Trim(UCase(expr)))
             If Not idata Is Nothing Then
              Set idata.StopFld = fld
              ' увеличиваем счетчик
              idata.Value = idata.Value + 1
              If idata.Value <= idata.MaxValue Then
                 rowidx = idata.StartRow - 1
              End If
             End If
          End If
        Next
      End If
      If tcell.Tables.Count > 0 Then
        Dim ii As Long
        For ii = 1 To tcell.Tables.Count
          If tcell.Tables.Item(ii).NestingLevel > tcell.NestingLevel Then
            Set nr = wdoc.Range(wcell.Range.End)
             
            ProcessTable wcell, tcell.Tables.Item(ii), nr, scr
          End If
        Next
      End If
      SetupIndexes2 wcell.Range
    Next
          
  Next
End Sub

Public Sub Bullet()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Range.ListFormat.ApplyBulletDefault
End Sub

Public Sub BulletIdent()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Range.ListFormat.ListIndent
End Sub

Public Sub BulletOutident()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Range.ListFormat.ListOutdent
End Sub


Public Sub InsertLandscapeSection()
    Dim c2p As Double
    c2p = 28.34646
    'Selection.InsertBreak Type:=7 'wdPageBreak
    
    Dim P As Long
    P = wdoc.Paragraphs.Count()
    wdoc.Paragraphs(P).Range.InsertAfter ""
    wdoc.Paragraphs.Add
    wdoc.Paragraphs(P).Range.Select
    wdoc.ActiveWindow.Selection.InsertBreak Type:=2 'wdSectionBreakNextPage
    With wdoc.ActiveWindow.Selection.PageSetup
        .LineNumbering.Active = False
        .Orientation = 1 'wdOrientLandscape
        .TopMargin = c2p * 3.5
        .BottomMargin = c2p * (3.5)
        .LeftMargin = c2p * (2)
        .RightMargin = c2p * (2)
        .Gutter = c2p * (0)
        .HeaderDistance = c2p * (1)
        .FooterDistance = c2p * (1)
        .PageWidth = c2p * (29.7)
        .PageHeight = c2p * (21)
        .sectionStart = 2 'wdSectionNewPage
        .OddAndEvenPagesHeaderFooter = False
        .DifferentFirstPageHeaderFooter = False
        .VerticalAlignment = 0 'wdAlignVerticalTop
        .SuppressEndnotes = False
        .MirrorMargins = False
        .TwoPagesOnOne = False
        .GutterPos = 0 'wdGutterPosLeft
    End With
End Sub

Public Sub Landscape()
    Dim c2p As Double
    Dim P As Long
    P = wdoc.Paragraphs.Count()
    wdoc.Paragraphs(P - 1).Range.Select
    c2p = 28.34646
    With wdoc.ActiveWindow.Selection.PageSetup
        .LineNumbering.Active = False
        .Orientation = 1 'wdOrientLandscape
        .TopMargin = c2p * 3.5
        .BottomMargin = c2p * (3.5)
        .LeftMargin = c2p * (2)
        .RightMargin = c2p * (2)
        .Gutter = c2p * (0)
        .HeaderDistance = c2p * (1)
        .FooterDistance = c2p * (1)
        .PageWidth = c2p * (29.7)
        .PageHeight = c2p * (21)
        .sectionStart = 2 'wdSectionNewPage
        .OddAndEvenPagesHeaderFooter = False
        .DifferentFirstPageHeaderFooter = False
        .VerticalAlignment = 0 'wdAlignVerticalTop
        .SuppressEndnotes = False
        .MirrorMargins = False
        .TwoPagesOnOne = False
        .GutterPos = 0 'wdGutterPosLeft
    End With
End Sub


Public Sub InsertPortriteSection()
    Dim c2p As Double
    c2p = 28.34646
    Dim P As Long
    P = wdoc.Paragraphs.Count()
    wdoc.Paragraphs(P).Range.InsertAfter ""
    wdoc.Paragraphs.Add
    wdoc.Paragraphs(P).Range.Select
    wdoc.ActiveWindow.Selection.InsertBreak Type:=2 'wdSectionBreakNextPage
    With wdoc.ActiveWindow.Selection.PageSetup
        .LineNumbering.Active = False
        '.Orientation = 1 'wdOrientLandscape
        .Orientation = 0 'wdOrientPortrait
        .TopMargin = c2p * 3.5
        .BottomMargin = c2p * (3.5)
        .LeftMargin = c2p * (2)
        .RightMargin = c2p * (2)
        .Gutter = c2p * (0)
        .HeaderDistance = c2p * (1)
        .FooterDistance = c2p * (1)
        .PageWidth = c2p * (21)
        .PageHeight = c2p * (29.7)
        .sectionStart = 2 'wdSectionNewPage
        .OddAndEvenPagesHeaderFooter = False
        .DifferentFirstPageHeaderFooter = False
        .VerticalAlignment = 0 'wdAlignVerticalTop
        .SuppressEndnotes = False
        .MirrorMargins = False
        .TwoPagesOnOne = False
        .GutterPos = 0 'wdGutterPosLeft
    End With
End Sub

Public Sub Portrite()
    Dim c2p As Double
    c2p = 28.34646
    Dim P As Long
    P = wdoc.Paragraphs.Count()
    wdoc.Paragraphs.Item(P - 1).Range.Select
    
    wdoc.ActiveWindow.Selection.InsertBreak Type:=2 'wdSectionBreakNextPage
    With wdoc.ActiveWindow.Selection.PageSetup
        .LineNumbering.Active = False
        '.Orientation = 1 'wdOrientLandscape
        .Orientation = 0 'wdOrientPortrait
        .TopMargin = c2p * 3.5
        .BottomMargin = c2p * (3.5)
        .LeftMargin = c2p * (2)
        .RightMargin = c2p * (2)
        .Gutter = c2p * (0)
        .HeaderDistance = c2p * (1)
        .FooterDistance = c2p * (1)
        .PageWidth = c2p * (21)
        .PageHeight = c2p * (29.7)
        .sectionStart = 2 'wdSectionNewPage
        .OddAndEvenPagesHeaderFooter = False
        .DifferentFirstPageHeaderFooter = False
        .VerticalAlignment = 0 'wdAlignVerticalTop
        .SuppressEndnotes = False
        .MirrorMargins = False
        .TwoPagesOnOne = False
        .GutterPos = 0 'wdGutterPosLeft
    End With
End Sub



Public Sub AlignCenter()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Alignment = 1
      'd.Paragraphs(1).Alignment = 1 'wdAlignParagraphCenter
      'd.Paragraphs(1).Alignment = 0 'wdAlignParagraphLeft
      'd.Paragraphs(1).Alignment = 2 'wdAlignParagraphRight
End Sub

Public Sub AlignLeft()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Alignment = 0
      'd.Paragraphs(1).Alignment = 1 'wdAlignParagraphCenter
      'd.Paragraphs(1).Alignment = 0 'wdAlignParagraphLeft
      'd.Paragraphs(1).Alignment = 2 'wdAlignParagraphRight
End Sub

Public Sub AlignRight()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Alignment = 2
      'd.Paragraphs(1).Alignment = 1 'wdAlignParagraphCenter
      'd.Paragraphs(1).Alignment = 0 'wdAlignParagraphLeft
      'd.Paragraphs(1).Alignment = 2 'wdAlignParagraphRight
      'Alignment = 3 'wdAlignParagraphJustify
End Sub

Public Sub Justify()
      On Error Resume Next
      Dim P As Long
      P = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(P - 1).Alignment = 3  'wdAlignParagraphJustify
      'd.Paragraphs(1).Alignment = 1 'wdAlignParagraphCenter
      'd.Paragraphs(1).Alignment = 0 'wdAlignParagraphLeft
      'd.Paragraphs(1).Alignment = 2 'wdAlignParagraphRight
      
End Sub
