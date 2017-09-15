Attribute VB_Name = "SingleGrid"
Option Explicit

Sub MakeSingleGrid(pctl As ControlData, p As PART, mode As String, body As String, tsClick As String, tsInit As String)
    Dim lctl As ControlData
    Dim AllowEdit As Boolean
    Dim AllowAdd As Boolean
    Dim AllowDel As Boolean
    AllowAdd = AllowAddToPart(p, mode)
    AllowEdit = AllowEditPart(p, mode)
    AllowDel = AllowDeleteFromPart(p, mode)
  
    
    Set lctl = pctl.ControlData.Add()
    lctl.name = "grid" & p.name
    lctl.ProgID = "GridEx20.GridEX"   ' .ProgId = "GridEx20.GridEX"
    AddProp lctl, "Name", lctl.name
    AddProp lctl, "DataMode", 99
    AddProp lctl, "AllowEdit", False
    AddProp lctl, "AllowAddNew", False
    AddProp lctl, "AllowDelete", True
    AddProp lctl, "ColumnAutoResize", False
    AddProp lctl, "AutomaticSort", True
    AddProp lctl, "RecordNavigator", False
    AddProp lctl, "SelectionStyle", 1
    AddProp lctl, "HideSelection", 2
    AddProp lctl, "TabKeyBehavior", 1
    AddProp lctl, "RecordNavigatorString", "Запись:|из"
    AddProp lctl, "GroupByBoxInfoText", "Группировка"
    AddProp lctl, "ItemCount", 0
    
    
    MasterGridButtons pctl, lctl, p, mode, body, tsClick, tsInit
    
    
    tsInit = tsInit & vbCrLf & "  item." & p.name & ".PrepareGrid " & lctl.name
    tsInit = tsInit & vbCrLf & "  LoadGridLayout " & lctl.name
    tsInit = tsInit & vbCrLf & "  Set fnd" & p.name & " = Nothing"
    tsInit = tsInit & vbCrLf & "  On Error Resume Next"
    tsInit = tsInit & vbCrLf & "  Set fnd" & p.name & " = CreateObject(""MTZ_JSetup.GridFinder"")"
    tsInit = tsInit & vbCrLf & "  fnd" & p.name & ".Init " & lctl.name
    
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Top = 40 * Screen.TwipsPerPixelX"
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Left = 5 * Screen.TwipsPerPixelX"
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Width = usercontrol.Width - 10 * Screen.TwipsPerPixelX"
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Height = usercontrol.Height - 45 * Screen.TwipsPerPixelY"
    
    body = body & vbCrLf & "Public Function IsOK() as BooLEAN"
    body = body & vbCrLf & "        IsOK=TRUE"
    body = body & vbCrLf & "End Function"
    body = body & vbCrLf & "Private Sub " & lctl.name & "_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)"
    body = body & vbCrLf & "on error resume next"
    body = body & vbCrLf & "Item." & p.name & ".LoadRow " & lctl.name & ", RowIndex, Bookmark, Values"
    body = body & vbCrLf & "End Sub"
    
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Top = 40 * Screen.TwipsPerPixelX"
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Left = 5 * Screen.TwipsPerPixelX"
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Width = usercontrol.Width - 10 * Screen.TwipsPerPixelX"
    tsClick = tsClick & vbCrLf & "      " & lctl.name & ".Height = usercontrol.Height - 45 * Screen.TwipsPerPixelY"
    
    body = body & vbCrLf & "Private Sub " & lctl.name & "_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)"
    If AllowDel Then
      body = body & vbCrLf & "  If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
      body = body & vbCrLf & "  Dim u As Object"
      body = body & vbCrLf & "  Set u = Item.FindRowObject(""" & p.name & """, Left(Bookmark, 38))"
      body = body & vbCrLf & "  If Not u Is Nothing Then"
      body = body & vbCrLf & "    on error resume next"
      body = body & vbCrLf & "    If MsgBox(""Удалить элемент"" & vbCrLf & u.Brief & vbcrlf & ""?"", vbYesNo + vbQuestion, ""Внимание"") = vbYes Then"
      body = body & vbCrLf & "      on error goto bye"
     
      
      ' on Delete
      If Not p.OnDelete Is Nothing Then
        body = body & vbCrLf & "        op" & p.name & "_" & p.OnDelete.name & "_" & mode & " u"
      End If
      
      body = body & vbCrLf & "      u.parent.Delete u.id"
      body = body & vbCrLf & "    Else"
      body = body & vbCrLf & "      Cancel = True"
      body = body & vbCrLf & "    End If"
      body = body & vbCrLf & "  End If"
      body = body & vbCrLf & "Exit Sub"
      body = body & vbCrLf & "bye:"
      body = body & vbCrLf & "   Cancel = True"
      body = body & vbCrLf & "   MsgBox Err.Description, vbOKOnly + vbExclamation, ""Удаление"""
    Else
      body = body & vbCrLf & "   Cancel = True"
    End If 'AllowDel
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""

    
    
    body = body & vbCrLf & "Private Sub " & lctl.name & "_DblClick()"
    If p.OnRun Is Nothing Then
      body = body & vbCrLf & "  cmd" & p.name & "Edit_Click"
    Else
      body = body & vbCrLf & "If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
      body = body & vbCrLf & "If " & lctl.name & ".Row > 0 then"
      body = body & vbCrLf & "  If " & lctl.name & ".RowIndex(" & lctl.name & ".Row ) > 0 Then"
      body = body & vbCrLf & "    Dim u As Object"
      body = body & vbCrLf & "    Dim bm"
      body = body & vbCrLf & "    bm = " & lctl.name & ".RowBookmark(" & lctl.name & ".RowIndex(" & lctl.name & ".Row))"
      body = body & vbCrLf & "    Set u = Item.FindRowObject(Right(bm, len(bm)-38), Left(bm, 38))"
      body = body & vbCrLf & "    on error resume next"
      body = body & vbCrLf & "    if not u is nothing then"
      body = body & vbCrLf & "      op" & p.name & "_" & p.OnRun.name & "_" & mode & " u"
      body = body & vbCrLf & "    end if"
      body = body & vbCrLf & "     u.refresh"
      body = body & vbCrLf & "  End If"
      body = body & vbCrLf & "End If"
    End If
    body = body & vbCrLf & "End Sub"

    body = body & vbCrLf & "Private Sub " & lctl.name & "_KeyPress(KeyAscii As Integer)"
    body = body & vbCrLf & "  If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
    body = body & vbCrLf & "  On Error Resume Next"
    body = body & vbCrLf & "  fnd" & p.name & ".FindOnPress KeyAscii"
    body = body & vbCrLf & "End Sub"
    body = body & vbCrLf & ""
      
    're initilize child grid on move
    body = body & vbCrLf & "Private Sub " & lctl.name & "_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)"
    body = body & vbCrLf & " ON ERROR RESUME NEXT"
    body = body & vbCrLf & "If LastRow <> " & lctl.name & ".Row And LastRow > 0 Then"
    body = body & vbCrLf & "  " & lctl.name & ".GetRowData(LastRow).RowStyle = ""Default"""
    body = body & vbCrLf & "  " & lctl.name & ".GetRowData(" & lctl.name & ".Row).RowStyle = ""SelectedRow"""
    body = body & vbCrLf & "End If"
    body = body & vbCrLf & "End Sub"


    body = body & vbCrLf & "Private Sub mnu" & p.name & "PASTE_Click()"
    body = body & vbCrLf & "On Error Resume Next"
    If AllowEdit Then
      body = body & vbCrLf & "    Dim u As Object"
      body = body & vbCrLf & "    Set u = item." & p.name & ".Add()"
      body = body & vbCrLf & "    If GetFromBuffer(u) Then"
      body = body & vbCrLf & "      grid" & p.name & ".ItemCount = u.parent.Count"
      body = body & vbCrLf & "    End If"
    End If 'AllowEdit
    body = body & vbCrLf & "End Sub"
    
End Sub
