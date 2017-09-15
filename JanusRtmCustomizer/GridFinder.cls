VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GridFinder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 125
Option Explicit

Public Enum TFindMode
    fndInColumn = 100
    fndEntrie = 101
End Enum

Public Enum TFindOptions
    fndWholeWords = 1
    fndCaseSensitive = 2
End Enum

Private findCurPosition As Long ' Current Row for Find Next
Private FindText As String
Private findCurColumn As Long
Public FindMode As TFindMode
Attribute FindMode.VB_VarHelpID = 135
Public FindOption As TFindOptions
Attribute FindOption.VB_VarHelpID = 150
Private FindPrevRowStyle As String
Private FindPrevRowStyleSet As Boolean
Private FindPrevRowPos As Long
Private WithEvents frmFind As frmFindForm
Attribute frmFind.VB_VarHelpID = -1
Private Grid As Object 'GridEX20.GridEX
Private fs As String

' показать форму поиска
'Parameters:
' параметров нет
'See Also:
'  FindLeft
'  FindMode
'  FindOnPress
'  FindOption
'  FindPrevios
'  Init
'  SwitchGridView
'Example:
'  call me.ShowForm()
Public Sub ShowForm()
Attribute ShowForm.VB_HelpID = 165
  frmFind.Show vbModal
End Sub

' подключить таблицу
'Parameters:
'[IN][OUT]  g , тип параметра: Object  - таблица
'See Also:
'  FindLeft
'  FindMode
'  FindOnPress
'  FindOption
'  FindPrevios
'  ShowForm
'  SwitchGridView
'Example:
'  call me.Init(...параметры...)
Public Sub Init(g As Object)
Attribute Init.VB_HelpID = 160
    Dim jfs As JSFormatStyle
    Set Grid = g
    Set frmFind = New frmFindForm
    On Error Resume Next
    If Grid.FormatStyles.Item("FoundedRow") Is Nothing Then
      Set jfs = Grid.FormatStyles.Add("FoundedRow")
      jfs.BackColor = vbBlue
      jfs.FontBold = True
      jfs.ForeColor = RGB(0, 0, 0)
    End If
End Sub



' искать назад
'Parameters:
' параметров нет
'See Also:
'  FindLeft
'  FindMode
'  FindOnPress
'  FindOption
'  Init
'  ShowForm
'  SwitchGridView
'Example:
'  call me.FindPrevios()
Public Sub FindPrevios()
Attribute FindPrevios.VB_HelpID = 155
    If Grid Is Nothing Then Exit Sub
    Dim opt As jgexConditionOperatorConstants
    Dim pres As Boolean
    Dim Row As Long
    Dim rd As JSRowData
    
    If Grid Is Nothing Then Exit Sub
    Dim jfs As JSFormatStyle
    On Error Resume Next
    If Grid.FormatStyles.Item("FoundedRow") Is Nothing Then
      Set jfs = Grid.FormatStyles.Add("FoundedRow")
      jfs.BackColor = vbBlue
      jfs.FontBold = True
      jfs.ForeColor = RGB(0, 0, 0)
    End If
        
    
    If FindOption And fndWholeWords Then
        opt = jgexEqual
    Else
        opt = jgexContains
    End If
    If FindMode = fndInColumn Then
        Row = Grid.Row
        findCurColumn = Grid.Columns.ItemByPosition(Grid.Col).Index
        If findCurColumn = 0 Then findCurColumn = 1
        If Grid.Find(findCurColumn, opt, FindText, , findCurPosition, -1) Then
            Set rd = Grid.GetRowData(Grid.Row)
            If FindOption And fndCaseSensitive Then
                If InStr(1, rd.Value(findCurColumn), FindText) > 0 Then
                    pres = True
                    FindPrevRowStyleSet = True
                    FindPrevRowStyle = rd.RowStyle
                    FindPrevRowPos = Grid.Row
                    rd.RowStyle = "FoundedRow"
                    Grid.EnsureVisible Grid.Row
                    Grid.FirstItem = Grid.Row
                    
                Else
                    pres = False
                    Grid.Row = Row
                    If MsgBox("Строка '" & FindText & "' в колонке не найдена." & vbCrLf & "Повторить поиск с последней строки?", vbYesNo, "Поиск") = vbYes Then
                      Grid.Row = Grid.RowCount
                      findCurPosition = Grid.RowCount + 1
                      FindPrevios
                      Exit Sub
                    End If
                    Grid.SetFocus
                    
                End If
            Else
                FindPrevRowStyleSet = True
                FindPrevRowStyle = rd.RowStyle
                FindPrevRowPos = Grid.Row
                rd.RowStyle = "FoundedRow"
                Grid.EnsureVisible Grid.Row
                Grid.FirstItem = Grid.Row
                findCurPosition = Grid.RowCount + 1
                
            End If
            Set rd = Nothing
        Else
            If MsgBox("Строка '" & FindText & "' в колонке не найдена." & vbCrLf & "Повторить поиск с последней строки?", vbYesNo, "Поиск") = vbYes Then
              Grid.Row = Grid.RowCount
              findCurPosition = Grid.RowCount + 1
              FindPrevios
              Exit Sub
            End If
            Grid.SetFocus
       End If
    Else
        Dim tmpCurPosition As Long
        Dim tmpRow As Long
        Dim tmpCol As Long
        Dim i As Long
        
        tmpCurPosition = findCurPosition
        tmpRow = -1
        'Searching in all collumns
        For i = 1 To Grid.Columns.Count
            Row = Grid.Row
            If Grid.Find(i, opt, FindText, , tmpCurPosition, -1) Then
                Set rd = Grid.GetRowData(Grid.Row)
                If FindOption And fndCaseSensitive Then
                    If InStr(1, rd.Value(i), FindText) > 0 Then
                        pres = True
                    Else
                        pres = False
                        Grid.Row = Row
                    End If
                Else
                    pres = True
                End If
                If pres And (Grid.Row >= tmpRow) Then
                    FindPrevRowStyleSet = True
                    FindPrevRowStyle = rd.RowStyle
                    FindPrevRowPos = Grid.Row
                    rd.RowStyle = "FoundedRow"
                    tmpRow = Grid.Row
                    Grid.EnsureVisible Grid.Row
                    Grid.FirstItem = Grid.Row
                    findCurPosition = Grid.Row
                    
                    tmpCol = i
                End If
                Set rd = Nothing
            End If
        Next
        If tmpRow = -1 Then
            'Не нашли
            If MsgBox("Строка '" & FindText & "' не найдена." & vbCrLf & "Повторить поиск с последней строки?", vbYesNo, "Поиск") = vbYes Then
              Grid.Row = Grid.RowCount
              findCurPosition = Grid.RowCount + 1
              FindPrevios
              Exit Sub
            End If
            Grid.SetFocus
        Else
            Grid.Row = tmpRow
            Grid.Col = tmpCol
        End If
    End If
End Sub

Private Sub Class_Terminate()
  On Error Resume Next
  
  Set Grid = Nothing
  If Not frmFind Is Nothing Then
    If frmFind.Visible = True Then Unload frmFind
    Set frmFind = Nothing
  End If
'  Unload frmFindData
End Sub

Private Sub frmFind_OnClose()
' On Close
    Dim rd As JSRowData
    If FindPrevRowStyleSet Then
        Set rd = Grid.GetRowData(FindPrevRowPos)
        rd.RowStyle = FindPrevRowStyle
        Set rd = Nothing
    End If
    FindPrevRowStyleSet = False
    FindPrevRowStyle = ""
    FindPrevRowPos = 0
End Sub

'искать следующий
Public Sub FindNext()
Attribute FindNext.VB_HelpID = 140
    Dim opt As jgexConditionOperatorConstants
    Dim pres As Boolean
    Dim Row As Long
    Dim rd As JSRowData, i As Long, j As Long
    If Grid Is Nothing Then Exit Sub
    Dim jfs As JSFormatStyle
    On Error Resume Next
    If Grid.FormatStyles.Item("FoundedRow") Is Nothing Then
      Set jfs = Grid.FormatStyles.Add("FoundedRow")
      jfs.BackColor = vbBlue
      jfs.FontBold = True
      jfs.ForeColor = RGB(0, 0, 0)
    End If
    
'    If FindOption And fndWholeWords Then
'        opt = jgexEqual
'    Else
        opt = jgexContains
'    End If
    
    If FindMode = fndInColumn Then
              Row = Grid.Row
        findCurColumn = Grid.Columns.ItemByPosition(Grid.Col).Index
        If findCurColumn = 0 Then findCurColumn = 1
        If Grid.Find(findCurColumn, opt, FindText, , findCurPosition, 1) Then
            Set rd = Grid.GetRowData(Grid.Row)
            If FindOption And fndCaseSensitive Then
                If InStr(1, rd.Value(findCurColumn), FindText) > 0 Then
                    pres = True
                    FindPrevRowStyleSet = True
                    FindPrevRowStyle = rd.RowStyle
                    FindPrevRowPos = Grid.Row
                    rd.RowStyle = "FoundedRow"
                    Grid.EnsureVisible Grid.Row
                    Grid.FirstItem = Grid.Row
                    findCurPosition = Grid.Row
                    
                Else
                    pres = False
                    Grid.Row = Row
                    If MsgBox("Строка '" & FindText & "' в колонке не найдена." & vbCrLf & "Повторить поиск с первой строки?", vbYesNo, "Поиск") = vbYes Then
                      Grid.Row = 1
                      findCurPosition = 0
                      FindNext
                      Exit Sub
                    End If
                    Grid.SetFocus
                    
                End If
            Else
                FindPrevRowStyleSet = True
                FindPrevRowStyle = rd.RowStyle
                FindPrevRowPos = Grid.Row
                rd.RowStyle = "FoundedRow"
                Grid.EnsureVisible Grid.Row
                Grid.FirstItem = Grid.Row
                
            End If
            Set rd = Nothing
        Else
            If MsgBox("Строка '" & FindText & "' в колонке не найдена." & vbCrLf & "Повторить поиск с первой строки?", vbYesNo, "Поиск") = vbYes Then
              Grid.Row = 1
              findCurPosition = 0
              FindNext
              Exit Sub
            End If
            Grid.SetFocus
       End If
    Else
        Dim tmpCurPosition As Long
        Dim tmpRow As Long
        Dim tmpCol As Long
       
        
        tmpCurPosition = findCurPosition
        tmpRow = Grid.RowCount + 1
        'Searching in all collumns
        For i = 1 To Grid.Columns.Count
            Row = Grid.Row
            If Grid.Find(i, opt, FindText, "", tmpCurPosition, 1) Then
                Set rd = Grid.GetRowData(Grid.Row)
'                If FindOption And fndCaseSensitive Then
'                    If InStr(1, rd.Value(i), FindText) > 0 Then
'                        pres = True
'                    Else
'                        pres = False
'                        Grid.Row = Row
'                        Grid.SetFocus
'                    End If
'                Else
                    pres = True
'                End If
                If pres And (Grid.Row <= tmpRow) Then
                    FindPrevRowStyleSet = True
                    FindPrevRowStyle = rd.RowStyle
                    FindPrevRowPos = Grid.Row
                    rd.RowStyle = "FoundedRow"
                    Grid.EnsureVisible Grid.Row
                    Grid.FirstItem = Grid.Row
                    findCurPosition = Grid.Row
                    
                    
                    tmpRow = Grid.Row
                    tmpCol = i
                    Grid.Row = rd.RowIndex
'                    frmFindData.Visible = False
                End If
                Set rd = Nothing
            End If
        Next
        If tmpRow = Grid.RowCount + 1 Then
            'Не нашли
            If MsgBox("Строка '" & FindText & "' не найдена." & vbCrLf & "Повторить поиск с первой строки?", vbYesNo, "Поиск") = vbYes Then
              Grid.Row = 1
              findCurPosition = 0
              FindNext
              Exit Sub
'            Else
'              frmFindData.Visible = False
            End If
            Grid.SetFocus
        Else
            Grid.Row = tmpRow
            Grid.Col = tmpCol
            Grid.SetFocus
        End If
    End If
End Sub




Private Sub frmFind_OnFindNext()
    Dim rd As JSRowData
    
    If frmFind.OptColumn.Value = True Then
        FindMode = fndInColumn
    Else
        FindMode = fndEntrie
    End If
'    If frmFind.CaseCheck.Value = vbChecked Then
'        FindOption = fndCaseSensitive
'    Else
        FindOption = 0
'    End If
'    If frmFind.WholeWordsCheck.Value = vbChecked Then
'        FindOption = FindOption + fndWholeWords
'    Else
'        If FindOption And fndWholeWords = 1 Then
'            FindOption = FindOption - fndWholeWords
'        End If
'    End If
'
    If FindPrevRowStyleSet Then
        Set rd = Grid.GetRowData(FindPrevRowPos)
        rd.RowStyle = FindPrevRowStyle
        Set rd = Nothing
    End If
    
    FindText = frmFind.FindText.Text
    findCurPosition = Grid.Row
    FindNext
End Sub

Private Sub frmFind_OnFindPrevios()
    Dim rd As JSRowData
    
    If frmFind.OptColumn.Value = True Then
        FindMode = fndInColumn
    Else
        FindMode = fndEntrie
    End If
'    If frmFind.CaseCheck.Value = vbChecked Then
'        FindOption = fndCaseSensitive
'    Else
        FindOption = 0
    'End If
'    If frmFind.WholeWordsCheck.Value = vbChecked Then
'        FindOption = FindOption + fndWholeWords
'    Else
'        If FindOption And fndWholeWords Then
'            FindOption = FindOption - fndWholeWords
'        End If
'    End If
    
    If FindPrevRowStyleSet Then
        Set rd = Grid.GetRowData(FindPrevRowPos)
        rd.RowStyle = FindPrevRowStyle
        Set rd = Nothing
    End If
    
    FindText = frmFind.FindText.Text
    findCurPosition = Grid.Row
    FindPrevios
End Sub

' поис при нажатии клавиши
'Parameters:
'[IN][OUT]  KeyAscii , тип параметра: Integer  - клавиша
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'  FindLeft
'  FindMode
'  FindOption
'  FindPrevios
'  Init
'  ShowForm
'  SwitchGridView
'Example:
'  call me.FindOnPress(...параметры...)
Sub FindOnPress(KeyAscii As Integer)
Attribute FindOnPress.VB_HelpID = 145

  If KeyAscii >= 32 Then
    Dim rd As JSRowData
    If FindPrevRowStyleSet Then
        Set rd = Grid.GetRowData(FindPrevRowPos)
        rd.RowStyle = FindPrevRowStyle
        Set rd = Nothing
        FindPrevRowStyleSet = False
    End If
'  Else
'   Grid.GroupByBoxInfoText = ""
  End If
  
  If KeyAscii > 32 Then
    'frmFindData.Visible = True
    
'    Dim r As POINTAPI
'    r.x = 100
'    r.y = 100
'    ClientToScreen Grid.hwnd, r
'    frmFindData.p
'    frmFindData.Top = r.x * Screen.TwipsPerPixelX
'    frmFindData.Left = r.y * Screen.TwipsPerPixelY
    
    fs = UCase(fs & Chr(KeyAscii))
    FindText = fs
'    Grid.GroupByBoxInfoText = "Поиск: " & fs
    
    'Grid.ToolTipText = fs
    'Grid.ShowToolTips = True
    'frmFindData.txtFind = fs
    FindMode = fndInColumn
    FindOption = 0
    FindPrevRowPos = 0
    FindLeft
    
  End If
  
  If KeyAscii <= 32 Then
    fs = ""
    FindText = fs
    FindMode = fndInColumn
    FindOption = 0
    FindPrevRowPos = 0
'    Grid.GroupByBoxInfoText = "Поиск сброшен "
'    frmFindData.Visible = False
  End If
  
  
  
End Sub
' поиск подстроки
'Parameters:
' параметров нет
'See Also:
'  FindMode
'  FindOnPress
'  FindOption
'  FindPrevios
'  Init
'  ShowForm
'  SwitchGridView
'Example:
'  call me.FindLeft()
Public Sub FindLeft()
Attribute FindLeft.VB_HelpID = 130
Dim i As Long
    Dim opt As jgexConditionOperatorConstants
    Dim pres As Boolean
    Dim Row As Long
    
    If Grid Is Nothing Then Exit Sub
    Dim jfs As JSFormatStyle
    On Error Resume Next
    If Grid.FormatStyles.Item("FoundedRow") Is Nothing Then
      Set jfs = Grid.FormatStyles.Add("FoundedRow")
      jfs.BackColor = vbBlue
      jfs.FontBold = True
      jfs.ForeColor = RGB(0, 0, 0)
    End If
    
'    If FindOption And fndWholeWords Then
'        opt = jgexEqual
'    Else
        opt = jgexContains
'    End If
    
    If FindMode = fndInColumn Then
        Row = Grid.Row
        findCurColumn = Grid.Columns.ItemByPosition(Grid.Col).Index

        If findCurColumn = 0 Then findCurColumn = 1
        Dim rd As JSRowData
        For i = 1 To Grid.ItemCount
          Set rd = Grid.GetRowData(i)
          If UCase(FindText) = Left(UCase(rd.Value(findCurColumn)), Len(FindText)) Then
                  FindPrevRowStyleSet = True
                  FindPrevRowStyle = rd.RowStyle
                  Grid.Row = i
                  FindPrevRowPos = Grid.Row
                  rd.RowStyle = "FoundedRow"
                  Grid.EnsureVisible i
                  Grid.FirstItem = i
                  'Grid.LeftCol
                  Set rd = Nothing
                  Exit Sub
          End If
        Next
        Grid.Row = Row
        MsgBox "Строка '" & FindText & "' в колонке не найдена.", vbOKOnly, "Поиск"
        Grid.SetFocus
    Else
        Dim tmpCurPosition As Long
        Dim tmpRow As Long
        Dim tmpCol As Long
        
        
        tmpCurPosition = Grid.Row
        tmpRow = Grid.RowCount + 1
        'Searching in all collumns
        For i = 1 To Grid.Columns.Count
            Row = Grid.Row
            If Grid.Find(i, opt, FindText, "", tmpCurPosition, 1) Then
                Set rd = Grid.GetRowData(Grid.Row)
'                If FindOption And fndCaseSensitive Then
'                    If InStr(1, rd.Value(i), FindText) > 0 Then
'                        pres = True
'                    Else
'                        pres = False
'                        Grid.Row = Row
'                        Grid.SetFocus
'                    End If
'                Else
                    pres = True
'                End If
                If pres And (Grid.Row <= tmpRow) Then
                    FindPrevRowStyleSet = True
                    FindPrevRowStyle = rd.RowStyle
                    FindPrevRowPos = Grid.Row
                    rd.RowStyle = "FoundedRow"
                    Grid.EnsureVisible Grid.Row
                    Grid.FirstItem = Grid.Row
                    tmpRow = Grid.Row
                    tmpCol = i
'                    frmFindData.Visible = False
                End If
                Set rd = Nothing
            End If
        Next
        If tmpRow = Grid.RowCount + 1 Then
            'Не нашли
            If MsgBox("Строка '" & FindText & "' не найдена." & vbCrLf & "Повторить поиск с первой строки?", vbYesNo, "Поиск") = vbYes Then
              Grid.Row = 1
              findCurPosition = 1
              FindNext
              Exit Sub
'            Else
'              frmFindData.Visible = False
            End If
            Grid.SetFocus
        Else
            Grid.Row = tmpRow
            Grid.Col = tmpCol
            Grid.SetFocus
        End If
    End If
End Sub
