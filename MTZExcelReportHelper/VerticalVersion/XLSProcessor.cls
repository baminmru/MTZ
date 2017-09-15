VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XLSProcesser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private Rep As ReportStructure
Private Vars As ReportVars
Private pos As Integer
Private Conn As adodb.Connection
Private outPos As Long


Dim xls As Excel.Application
Dim ws As Worksheet
Dim wsOut As Worksheet
Dim wb As Workbook

Private Const VAR As String = "##VAR#"
Private Const EXPR As String = "##EXPR#"
Private Const RHB As String = "##ReportHeader#"
Private Const RHE As String = "##ReportHeaderEnd#"
Private Const SHB As String = "##Section_Header#"
Private Const SHE As String = "##Section_HeaderEnd#"
Private Const SBB As String = "##Section_Body#"
Private Const SBE As String = "##Section_BodyEnd#"
Private Const SFB As String = "##Section_Footer#"
Private Const SFE As String = "##Section_FooterEnd#"
Private Const RFB As String = "##ReportFooter#"
Private Const RFE As String = "##ReportFooterEnd#"

Public Event OnProgress(str As String)
Public Event OnStep(val As Integer, max As Integer)
Public Event LoadVar(ByVal Name As String, NewValue As Variant)

Public Sub MakeDocument(ADOConnection As adodb.Connection, template As String, fn As String)
  RaiseEvent OnProgress("Инициализация")
  RaiseEvent OnStep(1, 6)
  
  
  ProcessTemplate template
  RaiseEvent OnProgress("Подготовка структуры отчета")
  RaiseEvent OnStep(2, 6)
  
  Dim v As Variant
  Dim i As Long
  Dim vv As ReportVar
  For Each vv In Vars
    v = vv.Value & ""
    RaiseEvent LoadVar(vv.Name, v)
    Vars.Item(vv.Name).Value = v
  Next
  RaiseEvent OnProgress("Запрос параметров отчета")
  RaiseEvent OnStep(3, 6)
  
  Set Conn = ADOConnection
  
  
  RaiseEvent OnProgress("Соединение с базой данных")
  RaiseEvent OnStep(4, 6)
  RunReport fn
  
  RaiseEvent OnProgress("Формирование отчета")
  RaiseEvent OnStep(5, 6)
  
  Set ws = Nothing
  Set wb = Nothing
  Set xls = Nothing
  Set Rep = Nothing
  Set Vars = Nothing
  Set Conn = Nothing
  RaiseEvent OnProgress("Finish")
  RaiseEvent OnStep(6, 6)
End Sub

Private Sub ProcessTemplate(ByVal template As String)
  
  Dim s As String
  Dim q As String
  Set xls = CreateObject("Excel.Application")
  Set wb = xls.Workbooks.Open(template)
  Set ws = wb.Worksheets.Item(1)
  Set Rep = New ReportStructure
  Set Vars = New ReportVars
  
  
  pos = 1
  While True
    s = ws.Cells(1, pos).Text
    Debug.Print s
    If StrComp(s, VAR, vbTextCompare) = 0 Then
      Vars.Add UCase(ws.Cells(4, pos).Text)
    End If
    
    If StrComp(s, RHB, vbTextCompare) = 0 Then
      ProcessHeader
    End If
    If StrComp(s, SHB, vbTextCompare) = 0 Then
      q = ws.Cells(4, pos).Text
      pos = pos + 1
      ProcessSection Rep.Body, q
    End If
    
    If StrComp(s, RFB, vbTextCompare) = 0 Then
      ProcessFooter
      Exit Sub
    End If
    
    If StrComp(s, RFE, vbTextCompare) = 0 Then
      Exit Sub
    End If
    
    pos = pos + 1
    If pos > 10000 Then Exit Sub
  Wend
End Sub

Private Sub ProcessHeader()
  Dim s As String
  Dim q As String
  
  While True
    s = ws.Cells(1, pos).Text
    Debug.Print s
    If Left(s, 2) <> "##" Then
      With Rep.Header.Add
        .RowNumber = pos
      End With
    End If
    
    
    If StrComp(s, SHB, vbTextCompare) = 0 Then
          With Rep.Header.Add
            .RowNumber = pos
            .HasSubsection = True
            Set .subsection = New Section
            q = ws.Cells(4, pos).Text
            pos = pos + 1
            ProcessSection .subsection, q
          End With
    End If
    
    If StrComp(s, RHE, vbTextCompare) = 0 Then
      Exit Sub
    End If
    
    If StrComp(s, RFE, vbTextCompare) = 0 Then
      Exit Sub
    End If
    
    
    pos = pos + 1
    If pos > 10000 Then Exit Sub
  Wend
End Sub

Private Sub ProcessFooter()
  Dim s As String, q As String
  While True
    s = ws.Cells(1, pos).Text
    Debug.Print s
    If Left(s, 2) <> "##" Then
      With Rep.Footer.Add
        .RowNumber = pos
      End With
    End If
   
    If StrComp(s, SHB, vbTextCompare) = 0 Then
      With Rep.Footer.Add
        .RowNumber = pos
        .HasSubsection = True
        Set .subsection = New Section
        q = ws.Cells(4, pos).Text
        pos = pos + 1
        ProcessSection .subsection, q
      End With
    End If

    
    If StrComp(s, RFE, vbTextCompare) = 0 Then
      Exit Sub
    End If
    pos = pos + 1
    If pos > 10000 Then Exit Sub
  Wend
End Sub


Private Sub ProcessSection(CurSection As Section, ByVal Query As String)
  Dim s As String
  Dim q As String
  Dim sr As SectionRow
  Dim nextSection As Section
  CurSection.Query = Query
  Dim atHeader As Boolean
  Dim atBody As Boolean
  Dim atFooter As Boolean
   atHeader = True
  While True
    s = ws.Cells(1, pos).Text
    Debug.Print s
    
    If Left(s, 2) <> "##" Then
      If atHeader Then
        With CurSection.HeaderRows.Add
          .RowNumber = pos
          .HasSubsection = False
        End With
      End If
      If atBody Then
        With CurSection.BodyRows.Add
          .RowNumber = pos
          .HasSubsection = False
        End With
      End If
      If atFooter Then
        With CurSection.FooterRows.Add
          .RowNumber = pos
          .HasSubsection = False
        End With
      End If
    End If
    
    If StrComp(s, SHB, vbTextCompare) = 0 Then
          If atHeader Then
            Set sr = CurSection.HeaderRows.Add
          End If
          If atBody Then
            Set sr = CurSection.BodyRows.Add
          End If
          If atFooter Then
            Set sr = CurSection.FooterRows.Add
          End If
          sr.RowNumber = pos
          sr.HasSubsection = True
          Set sr.subsection = New Section
          q = ws.Cells(4, pos).Text
          pos = pos + 1
          ProcessSection sr.subsection, q
    End If
           
    If StrComp(s, SHE, vbTextCompare) = 0 Then
      atBody = False
      atHeader = False
      atFooter = False
    End If
           
    If StrComp(s, SBB, vbTextCompare) = 0 Then
      atBody = True
      atHeader = False
      atFooter = False
    End If
    
    If StrComp(s, SBE, vbTextCompare) = 0 Then
      atBody = False
      atHeader = False
      atFooter = False
    End If
    
    If StrComp(s, SFB, vbTextCompare) = 0 Then
      atBody = False
      atHeader = False
      atFooter = True
    End If
           
    If StrComp(s, SFE, vbTextCompare) = 0 Then
      Exit Sub
    End If
        
    If StrComp(s, RHB, vbTextCompare) = 0 Then
      Exit Sub
    End If
    
    If StrComp(s, RHE, vbTextCompare) = 0 Then
      Exit Sub
    End If
    
    If StrComp(s, RFB, vbTextCompare) = 0 Then
      Exit Sub
    End If
    
    If StrComp(s, RFE, vbTextCompare) = 0 Then
      Exit Sub
    End If
   
    
    pos = pos + 1
    If pos > 10000 Then Exit Sub
  Wend
End Sub



Private Sub Class_Initialize()
  Set ws = Nothing
  Set wb = Nothing
  Set xls = Nothing
  Set Rep = Nothing
  Set Vars = Nothing
  Set Conn = Nothing

End Sub

Private Sub Class_Terminate()
  Set ws = Nothing
  Set wb = Nothing
  Set xls = Nothing
  Set Rep = Nothing
  Set Vars = Nothing
  Set Conn = Nothing
End Sub


Private Sub RunReport(ByVal fn As String)
 On Error Resume Next
  wb.SaveAs fn
  'xls.Visible = True
  
  
  
  ws.Visible = xlSheetVisible
  ws.Name = "template"
  
  If wb.Worksheets.Count = 1 Then
    wb.Worksheets.Add
  End If
  
  Set wsOut = wb.Worksheets.Item(2)
  wsOut.Name = "Report"
  Dim i As Long
  
  RaiseEvent OnProgress("Построение заголовка, Колонка:" & outPos)
  RaiseEvent OnStep(4, 6)
  
  outPos = 1
  For i = 1 To Rep.Header.Count
    If Rep.Header.Item(i).HasSubsection Then
      RunSection Rep.Header.Item(i).subsection
    Else
      RunRow Rep.Header.Item(i).RowNumber
    End If
  Next
  
  RunSection Rep.Body
    
  RaiseEvent OnProgress("Построение завершающео блока , Колонка:" & outPos)
  RaiseEvent OnStep(4, 6)
  For i = 1 To Rep.Footer.Count
    If Rep.Footer.Item(i).HasSubsection Then
      RunSection Rep.Footer.Item(i).subsection
    Else
      RunRow Rep.Footer.Item(i).RowNumber
    End If
  Next
  ws.Visible = xlSheetVeryHidden
  wb.Save
  xls.Visible = True
End Sub

Private Sub RunRow(ByVal i As Long)
On Error GoTo bye
  ws.Activate
  DoEvents
  ws.Columns(i).Select
  DoEvents
  xls.Selection.Copy
  
  wsOut.Activate
  DoEvents
  wsOut.Columns(outPos).Select
  DoEvents
  xls.Selection.PasteSpecial Paste:=xlPasteColumnWidths, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=False
  xls.Selection.PasteSpecial Paste:=xlPasteAll, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=False
  
  ' восстанавливем по значению переменных
  For i = 1 To 255
    If Left(wsOut.Cells(i, outPos).Formula, 1) = "=" Then
    
      wsOut.Cells(i, outPos).Formula = PrepareString(wsOut.Cells(i, outPos).Formula)
      Debug.Print wsOut.Cells(i, outPos).Formula
    ElseIf wsOut.Cells(i, outPos).Text <> "" Then
      wsOut.Cells(i, outPos) = PrepareString(wsOut.Cells(i, outPos).Text)
      Debug.Print wsOut.Cells(i, outPos).Text
    End If
  Next
  
bye:
  If Err.Number > 0 Then
    Debug.Print Err.Description
    Resume
  End If
  outPos = outPos + 1
  
End Sub


'Private Function PrepareString(ByVal s As String) As String
'  Dim outs As String, exprs As String
'  Dim spos As Long, epos As Long
'  outs = ""
'  spos = 1
'  On Error GoTo bye
'  spos = InStr(1, s, "#")
'  If spos > 0 Then
'    outs = Left(s, spos - 1)
'    spos = 1
'    epos = 1
'    While epos > 0 And spos > 0 And spos <= Len(s)
'      If spos = 1 Then spos = 0
'      spos = InStr(spos + 1, s, "#")
'      If spos > 0 Then
'        epos = InStr(spos + 1, s, "#")
'        If epos > 0 Then
'          exprs = Mid(s, spos + 1, epos - spos - 1)
'          outs = outs & DoExpr(exprs)
'          spos = epos + 1
'        End If
'      End If
'    Wend
'    On Error Resume Next
'    If epos > 0 Then
'      outs = outs & Mid(s, epos + 1, Len(s) - epos)
'    End If
'  Else
'    outs = s
'  End If
'  PrepareString = outs
'  Exit Function
'bye:
'  PrepareString = s
'  'Resume
'End Function

Private Function PrepareString(ByVal s As String) As String
  Dim outs As String, exprs As String
  Dim spos As Long, epos As Long, curpos As Long
  outs = ""
  spos = 1
  curpos = 1
  On Error GoTo bye
  spos = InStr(1, s, "#")
  If spos > 0 Then
    outs = ""
    spos = 1
    epos = 1
    While epos > 0 And spos > 0 And spos <= Len(s)
      If spos = 1 Then spos = 0
      spos = InStr(spos + 1, s, "#")
      If spos > 0 Then
        epos = InStr(spos + 1, s, "#")
        If epos > 0 Then
          exprs = Mid(s, spos + 1, epos - spos - 1)
          outs = outs & Mid(s, curpos, spos - curpos) & DoExpr(exprs)
          spos = epos + 1
          curpos = epos + 1
        End If
      End If
    Wend
    On Error Resume Next
    If epos > 0 Then
      outs = outs & Mid(s, epos + 1, Len(s) - epos)
    End If
  Else
    outs = s
  End If
  PrepareString = outs
  Exit Function
bye:
  PrepareString = s
  'Resume
End Function


Private Function DoExpr(ByVal s As String) As String
  Dim o As ReportVar
  Set o = Vars.Item(s)
  If Not o Is Nothing Then
    DoExpr = CStr(o.Value)
  Else
    DoExpr = s
  End If
End Function



Private Sub RunSection(sec As Section)
  Dim rs As adodb.Recordset
  Dim i As Long
  Dim rowidx As Long
  On Error Resume Next
  
  RaiseEvent OnProgress("Секция " & PrepareString(sec.Query) & " начальный блок , Колонка:" & outPos)
  RaiseEvent OnStep(4, 6)
  Set rs = Conn.Execute(PrepareString(sec.Query))
  
  rowidx = 1
  SetRSVars rs, rowidx
  
  For i = 1 To sec.HeaderRows.Count
    If sec.HeaderRows.Item(i).HasSubsection Then
      RunSection sec.HeaderRows.Item(i).subsection
    Else
      RunRow sec.HeaderRows.Item(i).RowNumber
    End If
  Next
  
  
  If Not rs Is Nothing Then
    While Not rs.EOF
        For i = 1 To sec.BodyRows.Count
          If sec.BodyRows.Item(i).HasSubsection Then
            RunSection sec.BodyRows.Item(i).subsection
          Else
            RunRow sec.BodyRows.Item(i).RowNumber
          End If
        Next
        
        RaiseEvent OnProgress("Секция " & PrepareString(sec.Query) & " строка запроса " & rowidx & " , Колонка:" & outPos)
        RaiseEvent OnStep(4, 6)
        
        rs.MoveNext
        rowidx = rowidx + 1
        SetRSVars rs, rowidx
    Wend
    rs.Close
  End If
  Set rs = Nothing

  RaiseEvent OnProgress("Секция " & PrepareString(sec.Query) & " завершение  , Колонка:" & outPos)
  RaiseEvent OnStep(4, 6)
  For i = 1 To sec.FooterRows.Count
    If sec.FooterRows.Item(i).HasSubsection Then
      RunSection sec.FooterRows.Item(i).subsection
    Else
      RunRow sec.FooterRows.Item(i).RowNumber
    End If
  Next

End Sub

Private Sub SetRSVars(rs As adodb.Recordset, Optional ByVal cnt As Long = 0)
  Dim i As Long
  On Error Resume Next
  If Not rs Is Nothing Then
    For i = 0 To rs.Fields.Count - 1
      Vars.Add(rs.Fields.Item(i).Name).Value = rs.Fields.Item(i).Value & ""
    Next
  End If
  Vars.Add("~POSITION").Value = outPos
  Vars.Add("~ROWINDEX").Value = cnt
End Sub


'Private Function ConvertLine(ByVal s As String, ByRef Scr As Boolean) As String
'Private mOpenCode As String
'Private mCloseCode As String
'mvarOpenCode = "#"
'mvarCloseCode = "#"
'
'Dim res As String, pos As Long, epos As Long, spos As Long
'If Not Scr Then
''    If InStr(1, s, mOpenCode, vbTextCompare) = 0 Then
''      res = res & mOutNL & " """ & DoubleQuoter(s) & """" & vbCrLf
''    Else
'      spos = 1
'      pos = 1
'      While pos > 0
'        pos = InStr(spos, s, mOpenCode, vbTextCompare)
'        If pos = 0 Then GoTo done1
'        Scr = True
'        epos = InStr(pos + 1, s, mCloseCode, vbTextCompare)
'
'        If epos = 0 Then
'          epos = Len(s) + 1
'        Else
'          Scr = False
'        End If
'
'        If pos - spos > 0 Then
'          res = res & Mid(s, spos, pos - spos)
'        End If
'        If epos - 2 - pos > 0 Then
'          res = res & Mid(s, pos + 2, epos - pos - 2)
'        End If
'        spos = epos + 2
'      Wend
'done1:
'      If Not Scr Then
'        If spos <= Len(s) Then
'          res = res & Mid(s, spos, Len(s) - spos + 1)
'        End If
'      End If
'
'    End If
'  Else
'    If InStr(1, s, mCloseCode, vbTextCompare) = 0 Then
'      res = res & s & vbCrLf
'    Else
'      spos = 1
'      pos = -1
'      While pos <> 0
'        pos = InStr(spos, s, mCloseCode, vbTextCompare)
'        If pos = 0 Then GoTo Done2
'        Scr = False
'        epos = InStr(pos + 2, s, mOpenCode, vbTextCompare)
'        If epos = 0 Then
'          epos = Len(s) + 1
'        Else
'          Scr = True
'        End If
'        If pos - spos - 2 > 0 Then
'          res = res & Mid(s, spos, pos - spos)
'
'
'        End If
'        If Mid(s, pos + 2, epos - pos - 2) <> "" Then
'          res = res & Mid(s, pos + 2, epos - pos - 2)
'        End If
'        spos = epos + 2
'      Wend
'Done2:
'      If Scr Then
'        If spos <= Len(s) Then
'          res = res & Mid(s, spos, Len(s) - spos + 1)
'        End If
'      End If
'    End If
'
'  'End If
'  ConvertLine = res
'End Function

