Attribute VB_Name = "GridAndGrid"
Option Explicit

Public Sub MakeGridAndGrid(pctl As ControlData, p As PART, Child As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(Child, mode)
  AllowEdit = AllowEditPart(Child, mode)
  AllowDel = AllowDeleteFromPart(Child, mode)
  
  
  Dim lctl As ControlData
  Dim rctl As ControlData
  Set lctl = MakeGridAnd(pctl, p, mode, body, tsClick, tsInit)
  
  Set rctl = pctl.ControlData.Add()
  rctl.name = "grid" & Child.name
  rctl.ProgID = "GridEx20.GridEX"   ' .ProgId = "GridEx20.GridEX"
  AddProp rctl, "Name", rctl.name
  AddProp rctl, "DataMode", 99
  AddProp rctl, "AllowEdit", False
  AddProp rctl, "AllowAddNew", False
  AddProp rctl, "AllowDelete", True
  AddProp rctl, "ColumnAutoResize", False
  AddProp rctl, "AutomaticSort", True
  AddProp rctl, "RecordNavigator", False
  AddProp rctl, "SelectionStyle", 1
  AddProp rctl, "HideSelection", 2
  AddProp rctl, "TabKeyBehavior", 1
  AddProp rctl, "RecordNavigatorString", "Запись:|из"
  AddProp rctl, "GroupByBoxInfoText", "Группировка"
  AddProp rctl, "ItemCount", 0
  
  SlaveGridButtons False, pctl, rctl, p, Child, mode, body, tsClick, tsInit
  
  tsClick = tsClick & vbCrLf & "  " & lctl.name & "_RowColChange " & lctl.name & ".Row,-1"
  
  If InStr(1, body, "Public Function IsOK()", vbTextCompare) <= 0 Then
  body = body & vbCrLf & "Public Function IsOK() as BooLEAN"
    body = body & vbCrLf & "        IsOK=TRUE"
    body = body & vbCrLf & "End Function"
End If
  body = body & vbCrLf & "Private Sub " & pctl.name & "_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)"
  body = body & vbCrLf & "   on error resume next"
  body = body & vbCrLf & "  " & rctl.name & ".Left = Left"
  body = body & vbCrLf & "  " & rctl.name & ".Top = Top + 25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "  " & rctl.name & ".Width = Width"
  body = body & vbCrLf & "  " & rctl.name & ".Height = Height-  25 * Screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Add.top=top+ 2 * screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Edit.top=top+ 2 * screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Del.top=top+ 2 * screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Ref.top=top+ 2 * screen.TwipsPerPixelY"
  body = body & vbCrLf & "   cmd" & Child.name & "Prn.top=top+ 2 * screen.TwipsPerPixelY"
  If IsMake_TRASH_Buttons Then
    body = body & vbCrLf & "   cmd" & Child.name & "Cfg.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & Child.name & "Fnd.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & Child.name & "Run.top=top+ 2 * screen.TwipsPerPixelY"
    body = body & vbCrLf & "   cmd" & Child.name & "Acc.top=top+ 2 * screen.TwipsPerPixelY"
  Else
    body = body & vbCrLf & "   cmd" & Child.name & "Fnd.top=top+ 2 * screen.TwipsPerPixelY"
  End If
  
  body = body & vbCrLf & "   cmd" & Child.name & "Add.Left = Left +5 * Screen.TwipsPerPixelX "
  body = body & vbCrLf & "   cmd" & Child.name & "Edit.Left =Left +30* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Del.Left = Left+55* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Ref.Left = Left+80* Screen.TwipsPerPixelX"
  body = body & vbCrLf & "   cmd" & Child.name & "Prn.Left = Left+105* Screen.TwipsPerPixelX"
  If IsMake_TRASH_Buttons Then
    body = body & vbCrLf & "   cmd" & Child.name & "Cfg.Left = Left+130* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & Child.name & "Fnd.Left = Left+155* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & Child.name & "Run.Left = Left+180* Screen.TwipsPerPixelX"
    body = body & vbCrLf & "   cmd" & Child.name & "Acc.Left = Left+205* Screen.TwipsPerPixelX"
  Else
    body = body & vbCrLf & "   cmd" & Child.name & "Fnd.Left = Left+130* Screen.TwipsPerPixelX"
  End If
  
  
  
  body = body & vbCrLf & "End Sub"
  
   
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Ref_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "If " & lctl.name & ".Row > 0 Then"
  body = body & vbCrLf & " If " & lctl.name & ".RowIndex ( " & lctl.name & ".Row) > 0 Then"
  body = body & vbCrLf & "    Dim gu As Object"
  body = body & vbCrLf & "    Dim bm"
  body = body & vbCrLf & "    bm = " & lctl.name & ".RowBookmark(" & lctl.name & ".RowIndex(" & lctl.name & ".Row))"
  body = body & vbCrLf & "    Set gu = Item.FindRowObject(Right(bm, len(bm)-38), Left(bm, 38))"
  body = body & vbCrLf & "    gu." & Child.name & ".refresh"
  body = body & vbCrLf & "   " & rctl.name & ".itemcount=gu." & Child.name & ".count"
  body = body & vbCrLf & "   " & rctl.name & ".refetch"
  body = body & vbCrLf & "   " & rctl.name & ".refresh"
  body = body & vbCrLf & " else"
  body = body & vbCrLf & "  " & rctl.name & ".columns.clear"
  body = body & vbCrLf & "  " & rctl.name & ".itemcount=0"
  body = body & vbCrLf & " End If"
  body = body & vbCrLf & "else"
  body = body & vbCrLf & " " & rctl.name & ".columns.clear"
  body = body & vbCrLf & " " & rctl.name & ".itemcount=0"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Edit_Click()"
  If AllowEdit Then
    body = body & vbCrLf & "    If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
    body = body & vbCrLf & "    Dim u As Object"
    body = body & vbCrLf & "    Dim  bm2"
    body = body & vbCrLf & "    bm2 = " & rctl.name & ".RowBookmark(" & rctl.name & ".RowIndex(" & rctl.name & ".Row))"
    body = body & vbCrLf & "    Set u = Item.FindRowObject(Right(bm2, len(bm2)-38), Left(bm2, 38))"
    body = body & vbCrLf & "    Set frm" & Child.name & "_" & mode & ".Item = u"
    body = body & vbCrLf & "    again: frm" & Child.name & "_" & mode & ".NotFirstTime = False"
    body = body & vbCrLf & "    frm" & Child.name & "_" & mode & ".OnInit"
    body = body & vbCrLf & "    frm" & Child.name & "_" & mode & ".Show vbModal"
    body = body & vbCrLf & "    If frm" & Child.name & "_" & mode & ".OK Then"
    body = body & vbCrLf & "    on error resume next"
    body = body & vbCrLf & "    err.clear"
    body = body & vbCrLf & "    u.save"
    body = body & vbCrLf & "    if err.number <>0 then "
    body = body & vbCrLf & "      msgbox err.description,vbokonly+vbExclamation,""Изменение"""
    body = body & vbCrLf & "      goto again"
    body = body & vbCrLf & "    end if "
    
    ' on save
    If Not Child.OnSave Is Nothing Then
      body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnSave.name & "_" & mode & " u"
    End If
    
    body = body & vbCrLf & "    " & rctl.name & ".RefreshRowBookmark bm2"
    body = body & vbCrLf & "    Else"
    body = body & vbCrLf & "        u.Refresh"
    body = body & vbCrLf & "    End If"
    body = body & vbCrLf & "    Set u = Nothing"
  End If 'AllowEdit
  body = body & vbCrLf & "Exit Sub"
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "MsgBox Err.Description,vbokonly+vbExclamation,""Изменение"""
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Del_Click()"
  body = body & vbCrLf & "  on error resume next"
  If AllowDel Then
    body = body & vbCrLf & "  " & rctl.name & ".Delete"
  End If 'AllowDel
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Add_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "    Dim gu As Object"
  body = body & vbCrLf & "    Dim u As Object"
  If AllowAdd Then
    body = body & vbCrLf & "If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
    body = body & vbCrLf & "    Dim bm"
    body = body & vbCrLf & "    bm = " & lctl.name & ".RowBookmark(" & lctl.name & ".RowIndex(" & lctl.name & ".Row))"
    body = body & vbCrLf & "    Set gu = Item.FindRowObject(Right(bm, len(bm)-38), Left(bm, 38))"
    body = body & vbCrLf & "    Set u = gu." & Child.name & ".Add()"
    
    'Defaults
    body = body & vbCrLf & MakeDefaultCode(Child, "u")
    
    If Child.AddBehaivor = PartAddBehaivor_AddForm Then
    
      body = body & vbCrLf & "      Set frm" & Child.name & "_" & mode & ".Item = u"
      body = body & vbCrLf & "      again: frm" & Child.name & "_" & mode & ".NotFirstTime = False"
      body = body & vbCrLf & "      frm" & Child.name & "_" & mode & ".OnInit"
      body = body & vbCrLf & "      frm" & Child.name & "_" & mode & ".Show vbModal"
      body = body & vbCrLf & "      If frm" & Child.name & "_" & mode & ".OK Then"
      body = body & vbCrLf & "        err.clear"
      body = body & vbCrLf & "        u.save"
      body = body & vbCrLf & "        if err.number <>0 then "
      body = body & vbCrLf & "          msgbox err.description,vbokonly+vbExclamation,""Создание"""
      body = body & vbCrLf & "          goto again"
      body = body & vbCrLf & "        end if "
      
      ' Oncreate
      If Not Child.OnCreate Is Nothing Then
        body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " u"
      End If
      
      body = body & vbCrLf & "        " & rctl.name & ".ItemCount = gu." & Child.name & ".Count"
      body = body & vbCrLf & "        " & rctl.name & ".Refresh"
      body = body & vbCrLf & "        " & rctl.name & ".RefreshGroups"
      body = body & vbCrLf & "        " & rctl.name & ".Refreshsort"
      body = body & vbCrLf & "        " & rctl.name & ".MoveToBookmark u.ID & """ & Child.name & """"
      body = body & vbCrLf & "      Else"
      body = body & vbCrLf & "        gu." & Child.name & ".Delete u.ID"
      body = body & vbCrLf & "        gu." & Child.name & ".Remove u.ID"
      body = body & vbCrLf & "      End If"
      
    End If  'AddForm
    
    If Child.AddBehaivor = PartAddBehaivor_RefreshOnly Then
    
      ' Oncreate
      If Not Child.OnCreate Is Nothing Then
        body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " u"
      End If
      
      body = body & vbCrLf & "        " & rctl.name & ".ItemCount = gu." & Child.name & ".Count"
      body = body & vbCrLf & "        " & rctl.name & ".Refresh"
      body = body & vbCrLf & "        " & rctl.name & ".RefreshGroups"
      body = body & vbCrLf & "        " & rctl.name & ".Refreshsort"
      body = body & vbCrLf & "        " & rctl.name & ".MoveToBookmark u.ID & """ & Child.name & """"
    
    End If 'RefreshOnly
    
    
    If Child.AddBehaivor = PartAddBehaivor_RunAction Then
    ' Oncreate
      If Not Child.OnCreate Is Nothing Then
        body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnCreate.name & "_" & mode & " u"
      End If
      
      body = body & vbCrLf & "        " & rctl.name & ".ItemCount = gu." & Child.name & ".Count"
      body = body & vbCrLf & "        " & rctl.name & ".Refresh"
      body = body & vbCrLf & "        " & rctl.name & ".RefreshGroups"
      body = body & vbCrLf & "        " & rctl.name & ".Refreshsort"
      body = body & vbCrLf & "        " & rctl.name & ".MoveToBookmark u.ID & """ & Child.name & """"
      body = body & vbCrLf & "        cmd" & Child.name & "Run_click"
    End If 'RunAction
    
  End If 'Allow Add
  body = body & vbCrLf & "Exit Sub"
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "MsgBox Err.Description,vbokonly+vbExclamation,""Создание"""
  body = body & vbCrLf & "  Set gu = Nothing"
  body = body & vbCrLf & "End Sub"
  
  
  're initilize child grid on move
  body = body & vbCrLf & "Private Sub " & lctl.name & "_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)"
  body = body & vbCrLf & " ON ERROR RESUME NEXT"
  body = body & vbCrLf & "If " & lctl.name & ".ItemCount = 0 Then "
  body = body & vbCrLf & "  " & rctl.name & ".ItemCount=0"
  body = body & vbCrLf & "  Exit Sub"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "If " & lctl.name & ".Row > 0 Then"
  
  body = body & vbCrLf & "  If LastRow <> " & lctl.name & ".Row And LastRow > 0 Then"
  body = body & vbCrLf & "    " & lctl.name & ".GetRowData(LastRow).RowStyle = ""Default"""
  body = body & vbCrLf & "    " & lctl.name & ".GetRowData(" & lctl.name & ".Row).RowStyle = ""SelectedRow"""
  body = body & vbCrLf & "  End If"
  
  body = body & vbCrLf & " If " & lctl.name & ".RowIndex ( " & lctl.name & ".Row) > 0 Then"
  body = body & vbCrLf & "  If LastRow <> " & lctl.name & ".Row or " & rctl.name & ".columns.count=0 Then"
  body = body & vbCrLf & "    Dim gu As Object"
  body = body & vbCrLf & "    Dim bm"
  body = body & vbCrLf & "    bm = " & lctl.name & ".RowBookmark(" & lctl.name & ".RowIndex(" & lctl.name & ".Row))"
  body = body & vbCrLf & "    Set gu = Item.FindRowObject(Right(bm, len(bm)-38), Left(bm, 38))"
  body = body & vbCrLf & "    gu." & Child.name & ".Preparegrid " & rctl.name & ""
  body = body & vbCrLf & "  " & rctl.name & ".ItemCount=0"
  body = body & vbCrLf & "    LoadGridLayout " & rctl.name & ""
  body = body & vbCrLf & "    Set fnd" & Child.name & " = Nothing"
  body = body & vbCrLf & "    Set fnd" & Child.name & " = CreateObject(""MTZ_JSetup.GridFinder"")"
  body = body & vbCrLf & "    fnd" & Child.name & ".Init " & rctl.name
  body = body & vbCrLf & "  " & rctl.name & ".ItemCount=gu." & Child.name & ".Count"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & " End If"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End Sub"
  
  
  ' Load data to child grid
  body = body & vbCrLf & "Private Sub " & rctl.name & "_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)"
  body = body & vbCrLf & "on error resume next"
  body = body & vbCrLf & "    If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "    If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "    Dim gu As Object"
  body = body & vbCrLf & "    Dim bm"
  body = body & vbCrLf & "    bm = " & lctl.name & ".RowBookmark(" & lctl.name & ".RowIndex(" & lctl.name & ".Row))"
  body = body & vbCrLf & "    Set gu = Item.FindRowObject(Right(bm, len(bm)- 38), Left(bm, 38))"
  body = body & vbCrLf & "    gu." & Child.name & ".LoadRow " & rctl.name & ", RowIndex, Bookmark, Values"
  body = body & vbCrLf & "    Set gu = Nothing"
  body = body & vbCrLf & "End Sub"
  
  
  body = body & vbCrLf & "Private Sub " & rctl.name & "_KeyPress(KeyAscii As Integer)"
  body = body & vbCrLf & "  If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "  On Error Resume Next"
  body = body & vbCrLf & "  fnd" & Child.name & ".FindOnPress KeyAscii"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
  
  ' delete row
  body = body & vbCrLf & "Private Sub " & rctl.name & "_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As  GridEX20.JSRetBoolean)"
  If AllowDel Then
    body = body & vbCrLf & "    If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
    body = body & vbCrLf & "    Dim u As Object"
    body = body & vbCrLf & "    Dim  bm2"
    body = body & vbCrLf & "    bm2 = " & rctl.name & ".RowBookmark(" & rctl.name & ".RowIndex(" & rctl.name & ".Row))"
    body = body & vbCrLf & "    Set u = Item.FindRowObject(Right(bm2,len(bm2)- 38), Left(bm2, 38))"
    body = body & vbCrLf & "    If Not u Is Nothing Then"
    body = body & vbCrLf & "      on error resume next"
    body = body & vbCrLf & "      If MsgBox(""Удалить элемент"" & vbCrLf & u.Brief & vbCrLf & ""?"", vbYesNo + vbQuestion, ""Внимание"") = vbYes Then"
    body = body & vbCrLf & "      on error goto bye"
    ' on delete
    If Not Child.OnDelete Is Nothing Then
      body = body & vbCrLf & "        op" & Child.name & "_" & Child.OnDelete.name & "_" & mode & " u"
    End If
    body = body & vbCrLf & "        u.Parent.Delete u.ID"
    body = body & vbCrLf & "      Else"
    body = body & vbCrLf & "        Cancel = True"
    body = body & vbCrLf & "      End If"
    body = body & vbCrLf & "    End If"
    body = body & vbCrLf & ""
    body = body & vbCrLf & "    Set u = Nothing"
    body = body & vbCrLf & "Exit Sub"
    body = body & vbCrLf & "bye:"
    body = body & vbCrLf & "   Cancel = True"
    body = body & vbCrLf & "   MsgBox Err.Description, vbOKOnly + vbExclamation, ""Удаление"""
  Else
    body = body & vbCrLf & "   Cancel = True"
  End If 'AllowDelete
  body = body & vbCrLf & "End Sub"
  
    
  ' edit row
  body = body & vbCrLf & "Private Sub " & rctl.name & "_DblClick()"
  If Child.OnRun Is Nothing Then
    body = body & vbCrLf & "    cmd" & Child.name & "Edit_click"
  Else
    body = body & vbCrLf & "    If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
    body = body & vbCrLf & "    on error resume next"
    body = body & vbCrLf & "    Dim u As Object"
    body = body & vbCrLf & "    Dim  bm2"
    body = body & vbCrLf & "    bm2 = " & rctl.name & ".RowBookmark(" & rctl.name & ".RowIndex(" & rctl.name & ".Row))"
    body = body & vbCrLf & "    Set u = Item.FindRowObject(Right(bm2, len(bm2)-38), Left(bm2, 38))"
    body = body & vbCrLf & "    op" & Child.name & "_" & Child.OnRun.name & "_" & mode & " u"
    body = body & vbCrLf & "    u.Refresh"
    body = body & vbCrLf & "    Set u = Nothing"
    
  End If
  body = body & vbCrLf & "End Sub"
  
  
  ' paint full row
  body = body & vbCrLf & "Private Sub " & rctl.name & "_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)"
  body = body & vbCrLf & " ON ERROR RESUME NEXT"
  body = body & vbCrLf & " If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & " If " & rctl.name & ".Row > 0 Then"
  body = body & vbCrLf & "   If LastRow <> " & rctl.name & ".Row And LastRow > 0 Then"
  body = body & vbCrLf & "     " & rctl.name & ".GetRowData(LastRow).RowStyle = ""Default"""
  body = body & vbCrLf & "     " & rctl.name & ".GetRowData(" & rctl.name & ".Row).RowStyle = ""SelectedRow"""
  body = body & vbCrLf & "   End If"
  body = body & vbCrLf & " End If"
  body = body & vbCrLf & "End sub"
  
  
  body = body & vbCrLf & "Private Sub mnu" & Child.name & "PASTE_Click()"
  body = body & vbCrLf & "On Error Resume Next"
  If AllowEdit Then
    body = body & vbCrLf & "    If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
    body = body & vbCrLf & "    Dim gu As Object"
    body = body & vbCrLf & "    Dim bm"
    body = body & vbCrLf & "    bm = " & lctl.name & ".RowBookmark(" & lctl.name & ".RowIndex(" & lctl.name & ".Row))"
    body = body & vbCrLf & "    Set gu = Item.FindRowObject(Right(bm, len(bm)- 38), Left(bm, 38))"
    body = body & vbCrLf & "    Dim u As Object"
    body = body & vbCrLf & "    Set u = GU." & Child.name & ".Add()"
    body = body & vbCrLf & "    If GetFromBuffer(u) Then"
    body = body & vbCrLf & "      grid" & Child.name & ".ItemCount = u.parent.Count"
    body = body & vbCrLf & "    ELSE"
    body = body & vbCrLf & "      GU." & Child.name & ".REFRESH"
    body = body & vbCrLf & "    End If"
    body = body & vbCrLf & "    Set gu = Nothing"
  End If 'AllowEdit
  body = body & vbCrLf & "End Sub"
 
End Sub
  

