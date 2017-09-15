VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WordHelper"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public m_wrd As Object 'Word.Application
Public m_wdoc As Object 'Word.Document
Public H As Long
Public WMFID As Long
Public Event MakeContent()

Public Property Get wrd() As Object
  Set wrd = m_wrd
End Property

Public Property Get wdoc() As Object
  Set wdoc = m_wdoc
End Property

Private Property Set wrd(v As Object)
  Set m_wrd = v
End Property

Private Property Set wdoc(v As Object)
  Set m_wdoc = v
End Property



Public Sub MakeDocument(fn As String)
    On Error GoTo err2
    Set wrd = CreateObject("Word.Application")
    
    On Error GoTo err1
    SaveSetting App.TITLE, "Recent", "LastWord", fn
    
    wrd.Visible = True
    
    Set wdoc = wrd.Documents.Add
    wdoc.Activate
    wrd.DisplayAlerts = False
    
    On Error Resume Next
    Kill fn
    On Error GoTo err1
    wdoc.SaveAs fn
    
    H = -1
    RaiseEvent MakeContent
    DoEvents
    wrd.DisplayAlerts = True
    wdoc.Activate
    
    If wdoc.Saved = False Then
      wdoc.Save
    End If

    'wdoc.Close -1
    Set wdoc = Nothing
    wrd.Visible = True
    wrd.Activate
    'wrd.Quit
    Set wrd = Nothing
    
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

' вставка картинки в документ
Public Sub AddPicture(filePath As String)
    On Error Resume Next
  OutStr " "
  wdoc.Paragraphs(wdoc.Paragraphs.Count - 1).Range.InlineShapes.AddPicture FileName:=filePath, LinkToFile:=False, SaveWithDocument:=True, Range:=wdoc.Paragraphs(wdoc.Paragraphs.Count - 1).Range
  OutStr " "
End Sub

'оформить группу параграфов как таблицу (3 колонки)
Public Sub MakeTable(ByVal sp As Long, ByVal ep As Long, ByVal NRow As Long, Optional ByVal NCol As Long = 3)
  Dim Range As Object 'Word.Range
  Set Range = wdoc.Range(wdoc.Paragraphs(sp).Range.Start, wdoc.Paragraphs(ep).Range.End)
'  Range.ConvertToTable Separator:=1, _
'  NumColumns:=NCol, _
'  NumRows:=NRow, _
'  Format:=23, _
'  ApplyBorders:=True, ApplyShading:=True, ApplyFont:=True, _
'  ApplyColor:=True, ApplyHeadingRows:=True, _
'  ApplyLastRow:=False, ApplyFirstColumn:=True, ApplyLastColumn:=False, _
'  AutoFit:=True, AutoFitBehavior:=0 'wdAutoFitFixed
  
  
  Range.ConvertToTable Separator:=1, _
  NumColumns:=NCol, _
  NumRows:=NRow, _
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
        .SectionStart = 2 'wdSectionNewPage
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
        .SectionStart = 2 'wdSectionNewPage
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
        .SectionStart = 2 'wdSectionNewPage
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
        .SectionStart = 2 'wdSectionNewPage
        .OddAndEvenPagesHeaderFooter = False
        .DifferentFirstPageHeaderFooter = False
        .VerticalAlignment = 0 'wdAlignVerticalTop
        .SuppressEndnotes = False
        .MirrorMargins = False
        .TwoPagesOnOne = False
        .GutterPos = 0 'wdGutterPosLeft
    End With
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





Public Sub OpenDocument(fn As String)
    On Error GoTo err2
    Set wrd = CreateObject("Word.Application")
    
    On Error GoTo err1
    SaveSetting App.TITLE, "Recent", "LastWord", fn
    
    wrd.Visible = True
    
    Set wdoc = wrd.Documents.Add
    wdoc.Activate
    wrd.DisplayAlerts = False
    
    On Error Resume Next
    Kill fn
    On Error GoTo err1
    wdoc.SaveAs fn
    
    H = -1
    
    
    On Error Resume Next
    ' Locked By MS Word ....
    
    Exit Sub
err1:
    MsgBox Err.Description
    Resume err2
err2:
    Err.Clear
    On Error Resume Next
    wdoc.Close -1
    Set wrd = Nothing
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

Public Sub MakeHF(ByVal name1 As String, ByVal name2 As String, ByVal name3 As String, ByVal name4 As String, ByVal name5 As String, ByVal name6 As String)
    If wrd.ActiveWindow.View.SplitSpecial <> 0 Then
        wrd.ActiveWindow.Panes(2).Close
    End If
    If wrd.ActiveWindow.ActivePane.View.Type <> 3 Then
        wrd.ActiveWindow.ActivePane.View.Type = 3
    End If
    wrd.ActiveWindow.ActivePane.View.SeekView = 9
    wrd.Selection.TypeText Text:=name1 & vbTab & name2 & vbTab & "Стр."
    wrd.Selection.Fields.Add Range:=wrd.Selection.Range, Type:=33 'wdFieldPage
    wrd.Selection.TypeText Text:=" из "
    wrd.Selection.Fields.Add Range:=wrd.Selection.Range, Type:=26 'wdFieldNumPages
    wrd.Selection.TypeParagraph
    wrd.Selection.TypeText Text:=name3 & vbTab & name4 & vbTab
    wrd.Selection.Fields.Add Range:=wrd.Selection.Range, Type:=31 'wdFieldDate
    wrd.Selection.TypeText Text:="  "
    wrd.Selection.Fields.Add Range:=wrd.Selection.Range, Type:=32 'wdFieldTime
    
    If wrd.Selection.HeaderFooter.IsHeader = True Then
        wrd.ActiveWindow.ActivePane.View.SeekView = 10
    Else
        wrd.ActiveWindow.ActivePane.View.SeekView = 9
    End If
    wrd.Selection.TypeText Text:=vbTab & name5
    wrd.Selection.TypeParagraph
    wrd.Selection.TypeText Text:=vbTab & name6
    wrd.ActiveWindow.ActivePane.View.SeekView = 0
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

Private Sub Class_Initialize()
Debug.Print "test"
End Sub
