Attribute VB_Name = "GridAnd"
Option Explicit

Public Function MakeGridAnd(pctl As ControlData, p As PART, mode As String, body As String, tsClick As String, tsInit As String) As ControlData
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(p, mode)
  AllowEdit = AllowEditPart(p, mode)
  AllowDel = AllowDeleteFromPart(p, mode)
  
  
  Dim lctl As ControlData
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

  body = body & vbCrLf & "Private Sub " & lctl.name & "_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)"
  body = body & vbCrLf & "on error resume next"
  body = body & vbCrLf & "Item." & p.name & ".LoadRow " & lctl.name & ", RowIndex, Bookmark, Values"
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub " & lctl.name & "_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)"
  If AllowDel Then
    body = body & vbCrLf & "  If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
    body = body & vbCrLf & "  Dim u As Object"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  Set u = Item.FindRowObject(Right(Bookmark, len(Bookmark)-38), Left(Bookmark, 38))"
    body = body & vbCrLf & "  If Not u Is Nothing Then"
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
    body = body & vbCrLf & "exit sub"
    body = body & vbCrLf & "bye:"
    body = body & vbCrLf & "   Cancel = True"
    body = body & vbCrLf & "   MsgBox Err.Description, vbOKOnly + vbExclamation, ""Удаление"""
  Else
    body = body & vbCrLf & "   Cancel = True"
  End If 'AllowDel
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Public Function IsOK() as BooLEAN"
    body = body & vbCrLf & "        IsOK=TRUE"
    body = body & vbCrLf & "End Function"
  
    
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
  
    
  
  body = body & vbCrLf & "Private Sub " & pctl.name & "_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  " & lctl.name & ".Left = Left"
  body = body & vbCrLf & "  " & lctl.name & ".Top = Top + 25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "  " & lctl.name & ".Width = Width"
  body = body & vbCrLf & "  " & lctl.name & ".Height = Height-  25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & p.name & "Add.top=top+ 2 * screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & p.name & "Edit.top=top+ 2 * screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & p.name & "Del.top=top+ 2 * screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & p.name & "Ref.top=top+ 2 * screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & p.name & "Prn.top=top+ 2 * screen.TwipsPerPixelY"
  If IsMake_TRASH_Buttons Then
    body = body & vbCrLf & "   cmd" & p.name & "Cfg.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Fnd.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Run.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & p.name & "Acc.top=top+ 2 * screen.TwipsPerPixelY"
  Else
    body = body & vbCrLf & "   cmd" & p.name & "Fnd.top=top+ 2 * screen.TwipsPerPixelY"
  End If

 
  body = body & vbCrLf & "   cmd" & p.name & "Add.Left = Left +5 * Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & p.name & "Edit.Left = Left +30* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & p.name & "Del.Left = Left+55* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & p.name & "Ref.Left = Left+80* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & p.name & "Prn.Left = Left+105* Screen.TwipsPerPixelX"
  If IsMake_TRASH_Buttons Then
    body = body & vbCrLf & "   cmd" & p.name & "Cfg.Left = Left+130* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & p.name & "Fnd.Left = Left+155* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & p.name & "Run.Left = Left+180* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & p.name & "Acc.Left = Left+205* Screen.TwipsPerPixelX"
  Else
    body = body & vbCrLf & "   cmd" & p.name & "Fnd.Left = Left+130* Screen.TwipsPerPixelX"
  End If
  body = body & vbCrLf & "End Sub"
  
  
  body = body & vbCrLf & "Private Sub mnu" & p.name & "PASTE_Click()"
  body = body & vbCrLf & "On Error Resume Next"
  If AllowEdit Then
    body = body & vbCrLf & "    Dim u As Object"
    body = body & vbCrLf & "    Set u = item." & p.name & ".Add()"
    body = body & vbCrLf & "    If GetFromBuffer(u) Then"
    body = body & vbCrLf & "      grid" & p.name & ".ItemCount = u.parent.Count"
    body = body & vbCrLf & "    End If"
  End If
  body = body & vbCrLf & "End Sub"


  
  
  Set MakeGridAnd = lctl
          
End Function
