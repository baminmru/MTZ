Attribute VB_Name = "PopupSupport"
Option Explicit

Public Function CreateGridPopup(fd As FormData, p As PART, ByRef body As String, ByRef decl As String, ByVal mode As String)
  Dim mctl As ControlData, smctl As ControlData, ssmctl As ControlData, tctl As ControlData
  
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(p, mode)
  AllowEdit = AllowEditPart(p, mode)
  AllowDel = AllowDeleteFromPart(p, mode)
  
  
  'Hidden Grid Setup
  If IsMake_HIDDEN_GRID_Cfg Then
    'KeyDownEvent
    body = body & vbCrLf & "'Hidden GRID Setup..."
    body = body & vbCrLf & "private sub grid" & p.name & "_KeyDown(KeyCode As Integer, Shift As Integer)"
    body = body & vbCrLf & "    Dim ShiftDown, AltDown, CtrlDown"
    body = body & vbCrLf & "    ShiftDown = (Shift And vbShiftMask) > 0"
    body = body & vbCrLf & "    AltDown = (Shift And vbAltMask) > 0"
    body = body & vbCrLf & "    CtrlDown = (Shift And vbCtrlMask) > 0"
    body = body & vbCrLf & "    If KeyCode = vbKeyF4 Then"
    body = body & vbCrLf & "        If ShiftDown And CtrlDown And AltDown Then"
    body = body & vbCrLf & "            cmd" & p.name & "Cfg_Click"
    body = body & vbCrLf & "        End If"
    body = body & vbCrLf & "    End If"
    body = body & vbCrLf & "end sub"
    body = body & vbCrLf & ""
  End If
  'EOF
  
  Set mctl = fd.ControlData.Add()
  mctl.name = "mnuPopup" & p.name
  mctl.ProgId = "VB.Menu"
  AddProp mctl, "Caption", "Меню для " & NoLF(p.Caption)
  AddProp mctl, "Name", mctl.name
  AddProp mctl, "Visible", False
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsAdd Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "Add"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "Создать"
    AddProp smctl, "Name", smctl.name
    AddProp smctl, "Enabled", AllowAdd
    
  End If
  
  decl = decl & vbCrLf & "private menuAction" & p.name & " as string"
  
  body = body & vbCrLf & "private sub grid" & p.name & "_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)"
  body = body & vbCrLf & "  If Button = 2 And Shift = 0 Then"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  PopupMenu " & mctl.name
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "end sub"
  
  
  body = body & vbCrLf & "private sub " & "mnu" & p.name & "Add" & "_click()" 'smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""ADD"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsEdit Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "Edit"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "Свойства"
    AddProp smctl, "Name", smctl.name
    AddProp smctl, "Enabled", AllowEdit
  End If
  
  body = body & vbCrLf & "private sub " & "mnu" & p.name & "Edit" & "_click()" 'smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""EDIT"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsDelete Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "Delete"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "Удалить"
    AddProp smctl, "Name", smctl.name
    AddProp smctl, "Enabled", AllowDel
  End If
  
  body = body & vbCrLf & "private sub " & "mnu" & p.name & "Delete" & "_click()" 'smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""DEL"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsOpen Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "Open"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "Открыть"
    AddProp smctl, "Name", smctl.name
  End If
  
  body = body & vbCrLf & "private sub " & "mnu" & p.name & "Open" & "_click()" 'smctl.name
  body = body & vbCrLf & "   menuAction" & p.name & " =""RUN"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsRef Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "Ref"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "Обновить"
    AddProp smctl, "Name", smctl.name
  End If
  
  body = body & vbCrLf & "private sub " & "mnu" & p.name & "Ref" & "_click()" 'smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""REF"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsBuffer Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "S1"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "-"
    AddProp smctl, "Name", smctl.name
  End If
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsBuffer Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "Buffer"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "Буфер"
    AddProp smctl, "Name", smctl.name
  End If
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsBuffer Then
    Set ssmctl = smctl.ControlData.Add()
    ssmctl.name = "mnu" & p.name & "COPY"
    ssmctl.ProgId = "VB.Menu"
    AddProp ssmctl, "Caption", "Копировать"
    AddProp ssmctl, "Name", ssmctl.name
  End If
  
  body = body & vbCrLf & "  Private Sub mnu" & p.name & "COPY_Click()"
  body = body & vbCrLf & "    On Error Resume Next"
  body = body & vbCrLf & "    If grid" & p.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "    If grid" & p.name & ".Row > 0 Then"
  body = body & vbCrLf & "     If grid" & p.name & ".RowIndex(grid" & p.name & ".Row) > 0 Then"
  body = body & vbCrLf & "        Dim u As Object"
  body = body & vbCrLf & "        Dim bm"
  body = body & vbCrLf & "        bm = grid" & p.name & ".RowBookmark(grid" & p.name & ".RowIndex(grid" & p.name & ".Row))"
  body = body & vbCrLf & "        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))"
  body = body & vbCrLf & "        SaveToBuffer u"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "  End Sub"
  
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsBuffer Then
    Set ssmctl = smctl.ControlData.Add()
    ssmctl.name = "mnu" & p.name & "CUT"
    ssmctl.ProgId = "VB.Menu"
    AddProp ssmctl, "Caption", "Вырезать"
    AddProp ssmctl, "Name", ssmctl.name
    AddProp smctl, "Enabled", AllowDel
  End If
  
  
  body = body & vbCrLf & "  Private Sub mnu" & p.name & "CUT_Click()"
  body = body & vbCrLf & "    On Error Resume Next"
  body = body & vbCrLf & "    If grid" & p.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "    If grid" & p.name & ".Row > 0 Then"
  body = body & vbCrLf & "     If grid" & p.name & ".RowIndex(grid" & p.name & ".Row) > 0 Then"
  body = body & vbCrLf & "        Dim u As Object"
  body = body & vbCrLf & "        Dim bm"
  body = body & vbCrLf & "        bm = grid" & p.name & ".RowBookmark(grid" & p.name & ".RowIndex(grid" & p.name & ".Row))"
  body = body & vbCrLf & "        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))"
  body = body & vbCrLf & "        SaveToBuffer u"
  body = body & vbCrLf & "        SET BM = u.parent"
  body = body & vbCrLf & "        u.parent.Delete u.ID"
  body = body & vbCrLf & "        grid" & p.name & ".ITEMCOUNT = BM.COUNT"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "  End Sub"
  
  
   
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsBuffer Then
    Set ssmctl = smctl.ControlData.Add()
    ssmctl.name = "mnu" & p.name & "PASTE"
    ssmctl.ProgId = "VB.Menu"
    AddProp ssmctl, "Caption", "Вставить"
    AddProp ssmctl, "Name", ssmctl.name
    AddProp smctl, "Enabled", AllowAdd
  End If
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsBuffer Then
    Set ssmctl = smctl.ControlData.Add()
    ssmctl.name = "mnu" & p.name & "CHANGE"
    ssmctl.ProgId = "VB.Menu"
    AddProp ssmctl, "Caption", "Заменить"
    AddProp ssmctl, "Name", ssmctl.name
    AddProp smctl, "Enabled", AllowEdit
  End If
  
  
  body = body & vbCrLf & "Private Sub mnu" & p.name & "CHANGE_Click()"
  body = body & vbCrLf & "  On Error Resume Next"
  body = body & vbCrLf & "  If grid" & p.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "  If grid" & p.name & ".Row > 0 Then"
  body = body & vbCrLf & "   If grid" & p.name & ".RowIndex(grid" & p.name & ".Row) > 0 Then"
  body = body & vbCrLf & "    Dim u As Object"
  body = body & vbCrLf & "    Dim bm"
  body = body & vbCrLf & "    bm = grid" & p.name & ".RowBookmark(grid" & p.name & ".RowIndex(grid" & p.name & ".Row))"
  body = body & vbCrLf & "    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))"
  body = body & vbCrLf & "    If GetFromBuffer(u) Then"
  body = body & vbCrLf & "      grid" & p.name & ".ItemCount = u.parent.Count"
  body = body & vbCrLf & "      grid" & p.name & ".RefreshRowIndex grid" & p.name & ".RowIndex(grid" & p.name & ".Row)"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "   End If"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "End Sub"
  
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsBuffer Then
    Set ssmctl = smctl.ControlData.Add()
    ssmctl.name = "mnu" & p.name & "CLEAN"
    ssmctl.ProgId = "VB.Menu"
    AddProp ssmctl, "Caption", "Очистить"
    AddProp ssmctl, "Name", ssmctl.name
  End If
    
  body = body & vbCrLf & "  Private Sub mnu" & p.name & "CLEAN_Click()"
  body = body & vbCrLf & "    item.Manager.ClearBuffer "" & p.name & """
  body = body & vbCrLf & "  End Sub"
  
'  Set smctl = mctl.ControlData.Add()
'  smctl.name = "mnu" & p.name & "S2"
'  smctl.ProgId = "VB.Menu"
'  AddProp smctl, "Caption", "-"
'  AddProp smctl, "Name", smctl.name
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsPrn Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "Prn"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "Печать"
    AddProp smctl, "Name", smctl.name
  End If

  body = body & vbCrLf & "private sub " & "mnu" & p.name & "Prn" & "_click()" 'smctl.name
  body = body & vbCrLf & "   menuAction" & p.name & " =""PRN"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsCfg Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "Cfg"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "Настроить"
    AddProp smctl, "Name", smctl.name
  End If

  body = body & vbCrLf & "private sub " & "mnu" & p.name & "Cfg" & "_click()" 'smctl.name
  body = body & vbCrLf & "   menuAction" & p.name & " =""CFG"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"


  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsFind Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "Find"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "Поиск"
    AddProp smctl, "Name", smctl.name
  End If
  
  body = body & vbCrLf & "private sub " & "mnu" & p.name & "Find" & "_click()" 'smctl.name
  body = body & vbCrLf & "   menuAction" & p.name & " =""FND"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
'  Set smctl = mctl.ControlData.Add()
'  smctl.name = "mnu" & p.name & "S3"
'  smctl.ProgId = "VB.Menu"
'  AddProp smctl, "Caption", "-"
'  AddProp smctl, "Name", smctl.name
  
  If IsMake_TRASH_GRID_Menus And AllowedGridMenus.IsAcc Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnu" & p.name & "Acc"
    smctl.ProgId = "VB.Menu"
    AddProp smctl, "Caption", "Стиль защиты"
    AddProp smctl, "Name", smctl.name
  End If
  
  body = body & vbCrLf & "private sub " & "mnu" & p.name & "Acc" & "_click()" 'smctl.name
  body = body & vbCrLf & "   menuAction" & p.name & " =""ACC"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  Set tctl = fd.ControlData.Add()
  tctl.name = "menuTimer" & p.name
  tctl.ProgId = "VB.Timer"
  AddProp tctl, "Name", tctl.name
  AddProp tctl, "Enabled", False
  AddProp tctl, "Interval", 1
  
  body = body & vbCrLf & "private sub " & tctl.name & "_timer()"
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = false"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""ADD"" then cmd" & p.name & "ADD_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""EDIT"" then cmd" & p.name & "EDIT_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""DEL"" then cmd" & p.name & "DEL_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""RUN"" then cmd" & p.name & "RUN_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""REF"" then cmd" & p.name & "REF_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""PRN"" then cmd" & p.name & "PRN_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""CFG"" then cmd" & p.name & "CFG_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""FND"" then cmd" & p.name & "FND_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""ACC"" then cmd" & p.name & "ACC_CLick"
  body = body & vbCrLf & "   menuAction" & p.name & " ="""""
  body = body & vbCrLf & "end sub"

End Function

Public Function CreateTreePopup(fd As FormData, p As PART, ByRef body As String, ByRef decl As String, ByVal mode As String)
  Dim mctl As ControlData, smctl As ControlData, ssmctl As ControlData, tctl As ControlData
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(p, mode)
  AllowEdit = AllowEditPart(p, mode)
  AllowDel = AllowDeleteFromPart(p, mode)
  
  
  Set mctl = fd.ControlData.Add()
  mctl.name = "mnuPopup" & p.name
  mctl.ProgId = "VB.Menu"
  AddProp mctl, "Caption", "Меню для " & NoLF(p.Caption)
  AddProp mctl, "Name", mctl.name
  AddProp mctl, "Visible", False
  
  
  
  decl = decl & vbCrLf & "private menuAction" & p.name & " as string"
  
  body = body & vbCrLf & "private sub tree" & p.name & "_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)"
  body = body & vbCrLf & "  If Button = 2 And Shift = 0 Then"
  body = body & vbCrLf & "  PopupMenu " & mctl.name
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "end sub"
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "AddRoot"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Создать ветку"
  AddProp smctl, "Name", smctl.name
  AddProp smctl, "Enabled", AllowAdd
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""ADDROOT"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Add"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Создать"
  AddProp smctl, "Name", smctl.name
  AddProp smctl, "Enabled", AllowAdd
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""ADD"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
    
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Edit"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Свойства"
  AddProp smctl, "Name", smctl.name
  AddProp smctl, "Enabled", AllowEdit
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""EDIT"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Delete"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Удалить"
  AddProp smctl, "Name", smctl.name
  AddProp smctl, "Enabled", AllowDel
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""DEL"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "S1"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "-"
  AddProp smctl, "Name", smctl.name
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Buffer"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Буфер"
  AddProp smctl, "Name", smctl.name
  
  Set ssmctl = smctl.ControlData.Add()
  ssmctl.name = "mnu" & p.name & "COPY"
  ssmctl.ProgId = "VB.Menu"
  AddProp ssmctl, "Caption", "Копировать"
  AddProp ssmctl, "Name", ssmctl.name
  
  body = body & vbCrLf & "  Private Sub mnu" & p.name & "COPY_Click()"
  body = body & vbCrLf & "    On Error Resume Next"
  body = body & vbCrLf & "    If TREE" & p.name & ".SELECTEDItem is nothing Then Exit Sub"
  body = body & vbCrLf & "        Dim u As Object"
  body = body & vbCrLf & "        Set u = Item.FindRowObject(""" & p.name & """, Left(tree" & p.name & ".SelectedItem.Key, 38))"
  body = body & vbCrLf & "        SaveToBuffer u"
  body = body & vbCrLf & "  End Sub"

  
  
  Set ssmctl = smctl.ControlData.Add()
  ssmctl.name = "mnu" & p.name & "CUT"
  ssmctl.ProgId = "VB.Menu"
  AddProp ssmctl, "Caption", "Вырезать"
  AddProp ssmctl, "Name", ssmctl.name
  AddProp smctl, "Enabled", AllowDel
  
  
  body = body & vbCrLf & "  Private Sub mnu" & p.name & "CUT_Click()"
  body = body & vbCrLf & "    On Error Resume Next"
  body = body & vbCrLf & "    If TREE" & p.name & ".SELECTEDItem is nothing Then Exit Sub"
  body = body & vbCrLf & "    Dim u As Object,BM"
  body = body & vbCrLf & "    Set u = Item.FindRowObject(""" & p.name & """, Left(tree" & p.name & ".SelectedItem.Key, 38))"
  body = body & vbCrLf & "    SaveToBuffer u"
  body = body & vbCrLf & "    SET BM = u.parent"
  body = body & vbCrLf & "    u.parent.Delete u.ID"
  body = body & vbCrLf & "    TREE" & p.name & ".nodes.remove TREE" & p.name & ".selecteditem.key"
  body = body & vbCrLf & "  End Sub"
  
  Set ssmctl = smctl.ControlData.Add()
  ssmctl.name = "mnu" & p.name & "PASTE"
  ssmctl.ProgId = "VB.Menu"
  AddProp ssmctl, "Caption", "Вставить"
  AddProp ssmctl, "Name", ssmctl.name
  AddProp smctl, "Enabled", AllowAdd
  
  
  body = body & vbCrLf & "Private Sub mnu" & p.name & "PASTE_Click()"
  body = body & vbCrLf & "On Error Resume Next"
  body = body & vbCrLf & "If tree" & p.name & ".SelectedItem Is Nothing Then Exit Sub"
  body = body & vbCrLf & "  Dim u As Object, f as object"
  body = body & vbCrLf & "  Set f = Item.FindRowObject(""" & p.name & """, Left(tree" & p.name & ".SelectedItem.Key, 38))"
  body = body & vbCrLf & "  Set u = f." & p.name & ".Add()"
  body = body & vbCrLf & "  If GetFromBuffer(u) Then"
  body = body & vbCrLf & "    If tree" & p.name & ".SelectedItem.child.tag <> ""ToDelete"" Then  "
  body = body & vbCrLf & "      u.LoadToTree tree" & p.name & ", tree" & p.name & ".SelectedItem.Key"
  body = body & vbCrLf & "    end if"
  body = body & vbCrLf & "  Else"
  body = body & vbCrLf & "   f." & p.name & ".refresh"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "End Sub"
  
  
  Set ssmctl = smctl.ControlData.Add()
  ssmctl.name = "mnu" & p.name & "CHANGE"
  ssmctl.ProgId = "VB.Menu"
  AddProp ssmctl, "Caption", "Заменить"
  AddProp ssmctl, "Name", ssmctl.name
  AddProp smctl, "Enabled", AllowEdit
  
  body = body & vbCrLf & "Private Sub mnu" & p.name & "CHANGE_Click()"
  body = body & vbCrLf & "  On Error Resume Next"
  body = body & vbCrLf & "  If TREE" & p.name & ".SELECTEDItem is nothing Then Exit Sub"
  body = body & vbCrLf & "  Dim u As Object,BM"
  body = body & vbCrLf & "  Set u = Item.FindRowObject(""" & p.name & """, Left(tree" & p.name & ".SelectedItem.Key, 38))"
  body = body & vbCrLf & "  If GetFromBuffer(u) Then"
  body = body & vbCrLf & "    TREE" & p.name & ".SELECTEDItem.text = u.brief"
  body = body & vbCrLf & "      tree" & p.name & ".SelectedItem.Expanded = False"
  body = body & vbCrLf & "      While tree" & p.name & ".SelectedItem.Children > 0"
  body = body & vbCrLf & "        tree" & p.name & ".Nodes.Remove tree" & p.name & ".SelectedItem.Child.Key"
  body = body & vbCrLf & "      Wend"
  body = body & vbCrLf & "      tree" & p.name & ".Nodes.Add(tree" & p.name & ".SelectedItem.Key, 4, ""Expanding ..."").Tag = ""ToDelete"""
  body = body & vbCrLf & "      tree" & p.name & "_Expand tree" & p.name & ".SelectedItem"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "End Sub"
  
  
  Set ssmctl = smctl.ControlData.Add()
  ssmctl.name = "mnu" & p.name & "CLEAN"
  ssmctl.ProgId = "VB.Menu"
  AddProp ssmctl, "Caption", "Очистить"
  AddProp ssmctl, "Name", ssmctl.name
  
  body = body & vbCrLf & "  Private Sub mnu" & p.name & "CLEAN_Click()"
  body = body & vbCrLf & "    item.Manager.ClearBuffer "" & p.name & """
  body = body & vbCrLf & "  End Sub"
  
  
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Ref"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Обновить"
  AddProp smctl, "Name", smctl.name
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""REF"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Acc"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Стиль защиты"
  AddProp smctl, "Name", smctl.name
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""ACC"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  Set tctl = fd.ControlData.Add()
  tctl.name = "menuTimer" & p.name
  tctl.ProgId = "VB.Timer"
  AddProp tctl, "Name", tctl.name
  AddProp tctl, "Enabled", False
  AddProp tctl, "Interval", 1
  
  body = body & vbCrLf & "private sub " & tctl.name & "_timer()"
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = false"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""ADDROOT"" then cmd" & p.name & "ADDROOT_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""ADD"" then cmd" & p.name & "ADD_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""EDIT"" then cmd" & p.name & "EDIT_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""DEL"" then cmd" & p.name & "DEL_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""REF"" then cmd" & p.name & "REF_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""ACC"" then cmd" & p.name & "ACC_CLick"
  body = body & vbCrLf & "   menuAction" & p.name & " ="""""
  body = body & vbCrLf & "end sub"
End Function


Public Function CreateComplexPopup(fd As FormData, p As PART, ByRef body As String, ByRef decl As String, ByVal mode As String)
  Dim mctl As ControlData, smctl As ControlData, ssmctl As ControlData, tctl As ControlData
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(p, mode)
  AllowEdit = AllowEditPart(p, mode)
  AllowDel = AllowDeleteFromPart(p, mode)
  
  Set mctl = fd.ControlData.Add()
  mctl.name = "mnuPopup" & p.name
  mctl.ProgId = "VB.Menu"
  AddProp mctl, "Caption", "Меню для " & NoLF(p.Caption)
  AddProp mctl, "Name", mctl.name
  AddProp mctl, "Visible", False
  
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Add"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Создать"
  AddProp smctl, "Name", smctl.name
  AddProp smctl, "Enabled", AllowAdd
  
  decl = decl & vbCrLf & "private menuAction" & p.name & " as string"
  
  body = body & vbCrLf & "private sub grid" & p.name & "_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)"
  body = body & vbCrLf & "  If Button = 2 And Shift = 0 Then"
  body = body & vbCrLf & "  PopupMenu " & mctl.name
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "end sub"
  
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""ADD"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Edit"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Свойства"
  AddProp smctl, "Name", smctl.name
  AddProp smctl, "Enabled", AllowEdit
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""EDIT"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Delete"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Удалить"
  AddProp smctl, "Name", smctl.name
  AddProp smctl, "Enabled", AllowDel
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""DEL"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Open"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Открыть"
  AddProp smctl, "Name", smctl.name
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""RUN"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Ref"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Обновить"
  AddProp smctl, "Name", smctl.name
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""REF"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "S1"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "-"
  AddProp smctl, "Name", smctl.name
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Buffer"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Буфер"
  AddProp smctl, "Name", smctl.name
  
  Set ssmctl = smctl.ControlData.Add()
  ssmctl.name = "mnu" & p.name & "COPY"
  ssmctl.ProgId = "VB.Menu"
  AddProp ssmctl, "Caption", "Копировать"
  AddProp ssmctl, "Name", ssmctl.name
  
  body = body & vbCrLf & "  Private Sub mnu" & p.name & "COPY_Click()"
  body = body & vbCrLf & "    On Error Resume Next"
  body = body & vbCrLf & "    If grid" & p.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "    If grid" & p.name & ".Row > 0 Then"
  body = body & vbCrLf & "     If grid" & p.name & ".RowIndex(grid" & p.name & ".Row) > 0 Then"
  body = body & vbCrLf & "        Dim u As Object"
  body = body & vbCrLf & "        Dim bm"
  body = body & vbCrLf & "        bm = grid" & p.name & ".RowBookmark(grid" & p.name & ".RowIndex(grid" & p.name & ".Row))"
  body = body & vbCrLf & "        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))"
  body = body & vbCrLf & "        SaveToBuffer u"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "  End Sub"
  
  
  Set ssmctl = smctl.ControlData.Add()
  ssmctl.name = "mnu" & p.name & "CUT"
  ssmctl.ProgId = "VB.Menu"
  AddProp ssmctl, "Caption", "Вырезать"
  AddProp ssmctl, "Name", ssmctl.name
  AddProp smctl, "Enabled", AllowDel
  
  body = body & vbCrLf & "  Private Sub mnu" & p.name & "CUT_Click()"
  body = body & vbCrLf & "    On Error Resume Next"
  body = body & vbCrLf & "    If grid" & p.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "    If grid" & p.name & ".Row > 0 Then"
  body = body & vbCrLf & "     If grid" & p.name & ".RowIndex(grid" & p.name & ".Row) > 0 Then"
  body = body & vbCrLf & "        Dim u As Object"
  body = body & vbCrLf & "        Dim bm"
  body = body & vbCrLf & "        bm = grid" & p.name & ".RowBookmark(grid" & p.name & ".RowIndex(grid" & p.name & ".Row))"
  body = body & vbCrLf & "        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))"
  body = body & vbCrLf & "        SaveToBuffer u"
  body = body & vbCrLf & "        SET BM = u.parent"
  body = body & vbCrLf & "        u.parent.Delete u.ID"
  body = body & vbCrLf & "        grid" & p.name & ".ITEMCOUNT = BM.COUNT"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "  End Sub"
  
  
   
  
  Set ssmctl = smctl.ControlData.Add()
  ssmctl.name = "mnu" & p.name & "PASTE"
  ssmctl.ProgId = "VB.Menu"
  AddProp ssmctl, "Caption", "Вставить"
  AddProp ssmctl, "Name", ssmctl.name
  AddProp smctl, "Enabled", AllowAdd
  
  body = body & vbCrLf & " private sub " & ssmctl.name & "_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "Dim p As Object, ID As String, struct As String, u As Object"
  body = body & vbCrLf & "  If tree" & p.name & ".SelectedItem Is Nothing Then Exit Sub"
  body = body & vbCrLf & "    If tree" & p.name & ".SelectedItem.Tag = ""Row"" Then"
  body = body & vbCrLf & "      On Error Resume Next"
  body = body & vbCrLf & "      ID = Mid(tree" & p.name & ".SelectedItem.key, 39, 38)"
  body = body & vbCrLf & "      struct = tree" & p.name & ".SelectedItem.parent.tag"
  body = body & vbCrLf & "      Set p = Item.FindRowObject(struct, ID)"
  body = body & vbCrLf & "      If Item.itemcollection(p, TypeName(p)) Is Nothing Then"
  body = body & vbCrLf & "        Set u = p.Parent.Add"
  body = body & vbCrLf & "      Else"
  body = body & vbCrLf & "        Set u = Item.itemcollection(p, TypeName(p)).Add"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & ""
  body = body & vbCrLf & "      Set p = Nothing"
  body = body & vbCrLf & "    ElseIf tree" & p.name & ".SelectedItem.Tag <> ""object"" Then"
  body = body & vbCrLf & "        If tree" & p.name & ".SelectedItem.Parent.Tag = ""Row"" Then"
  body = body & vbCrLf & "        ID = Mid(tree" & p.name & ".SelectedItem.Parent.key, 39, 38)"
  body = body & vbCrLf & "        struct = tree" & p.name & ".SelectedItem.parent.parent.tag"
  body = body & vbCrLf & "        Set p = Item.FindRowObject(struct, ID)"
  body = body & vbCrLf & "        Set u = Item.itemcollection(p, tree" & p.name & ".SelectedItem.Tag).Add"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "      If tree" & p.name & ".SelectedItem.Parent.Tag = ""object"" Then"
  body = body & vbCrLf & "        ID = Mid(tree" & p.name & ".SelectedItem.Parent.key, 39, 38)"
  body = body & vbCrLf & "        Set p = Item.Manager.GetInstanceObject(ID)"
  body = body & vbCrLf & "        Set u = Item.itemcollection(p, tree" & p.name & ".SelectedItem.Tag).Add"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "    Set p = Nothing"
  body = body & vbCrLf & "    If u Is Nothing Then Exit Sub"
  body = body & vbCrLf & "    if getFrombuffer(u) then"
  
  body = body & vbCrLf & "      grid" & p.name & ".ItemCount = u.Parent.Count"
  body = body & vbCrLf & "      grid" & p.name & ".Refresh"
  body = body & vbCrLf & "      grid" & p.name & ".RefreshGroups"
  body = body & vbCrLf & "      grid" & p.name & ".RefreshSort"
  body = body & vbCrLf & "      Dim tid As String"
  body = body & vbCrLf & "      Dim key As String"
  body = body & vbCrLf & "      on error resume next"
  body = body & vbCrLf & "      Dim rnode As MSComctlLib.Node"
  body = body & vbCrLf & "      Set rnode = tree" & p.name & ".SelectedItem"
  body = body & vbCrLf & "      If rnode.Tag = ""Row"" Then"
  body = body & vbCrLf & "        Set rnode = rnode.parent"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "      While rnode.Children > 0"
  body = body & vbCrLf & "         tree" & p.name & ".Nodes.Remove rnode.Child.Key"
  body = body & vbCrLf & "      Wend"
  body = body & vbCrLf & "      tid = CreateGUID2()"
  body = body & vbCrLf & "      tree" & p.name & ".Nodes.Add(rnode.Key, 4, tid, ""Expanding..."").Tag = ""ToDelete"""
  body = body & vbCrLf & "      tree" & p.name & "_Expand tree" & p.name & ".Nodes.Item(rnode.Key)"
  body = body & vbCrLf & "    Else"
  body = body & vbCrLf & "     u.Parent.Remove u.ID"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
  
  
  Set ssmctl = smctl.ControlData.Add()
  ssmctl.name = "mnu" & p.name & "CHANGE"
  ssmctl.ProgId = "VB.Menu"
  AddProp ssmctl, "Caption", "Заменить"
  AddProp ssmctl, "Name", ssmctl.name
  AddProp smctl, "Enabled", AllowEdit
  
  
  body = body & vbCrLf & "Private Sub mnu" & p.name & "CHANGE_Click()"
  body = body & vbCrLf & "  On Error Resume Next"
  body = body & vbCrLf & "  If grid" & p.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "  If grid" & p.name & ".Row > 0 Then"
  body = body & vbCrLf & "   If grid" & p.name & ".RowIndex(grid" & p.name & ".Row) > 0 Then"
  body = body & vbCrLf & "    Dim u As Object"
  body = body & vbCrLf & "    Dim bm"
  body = body & vbCrLf & "    bm = grid" & p.name & ".RowBookmark(grid" & p.name & ".RowIndex(grid" & p.name & ".Row))"
  body = body & vbCrLf & "    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))"
  body = body & vbCrLf & "    If GetFromBuffer(u) Then"
  body = body & vbCrLf & "      grid" & p.name & ".ItemCount = u.parent.Count"
  body = body & vbCrLf & "      grid" & p.name & ".RefreshRowIndex grid" & p.name & ".RowIndex(grid" & p.name & ".Row)"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "   End If"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "End Sub"
  
  
  Set ssmctl = smctl.ControlData.Add()
  ssmctl.name = "mnu" & p.name & "CLEAN"
  ssmctl.ProgId = "VB.Menu"
  AddProp ssmctl, "Caption", "Очистить"
  AddProp ssmctl, "Name", ssmctl.name
    
  body = body & vbCrLf & "  Private Sub mnu" & p.name & "CLEAN_Click()"
  body = body & vbCrLf & "    item.Manager.ClearBuffer "" & p.name & """
  body = body & vbCrLf & "  End Sub"
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Prn"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Печать"
  AddProp smctl, "Name", smctl.name

  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""PRN"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Cfg"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Настроить"
  AddProp smctl, "Name", smctl.name

  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""CFG"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"

  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Find"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Поиск"
  AddProp smctl, "Name", smctl.name
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""FND"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnu" & p.name & "Acc"
  smctl.ProgId = "VB.Menu"
  AddProp smctl, "Caption", "Стиль защиты"
  AddProp smctl, "Name", smctl.name
  
  body = body & vbCrLf & "private sub " & smctl.name & "_click()"
  body = body & vbCrLf & "   menuAction" & p.name & " =""ACC"""
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = true"
  body = body & vbCrLf & "end sub"
  
  Set tctl = fd.ControlData.Add()
  tctl.name = "menuTimer" & p.name
  tctl.ProgId = "VB.Timer"
  AddProp tctl, "Name", tctl.name
  AddProp tctl, "Enabled", False
  AddProp tctl, "Interval", 1
  
  body = body & vbCrLf & "private sub " & tctl.name & "_timer()"
  body = body & vbCrLf & "   menuTimer" & p.name & ".enabled = false"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""ADD"" then cmd" & p.name & "ADD_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""EDIT"" then cmd" & p.name & "EDIT_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""DEL"" then cmd" & p.name & "DEL_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""RUN"" then cmd" & p.name & "RUN_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""REF"" then cmd" & p.name & "REF_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""PRN"" then cmd" & p.name & "PRN_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""CFG"" then cmd" & p.name & "CFG_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""FND"" then cmd" & p.name & "FND_CLick"
  body = body & vbCrLf & "   if menuAction" & p.name & " =""ACC"" then cmd" & p.name & "ACC_CLick"
  body = body & vbCrLf & "   menuAction" & p.name & " ="""""
  body = body & vbCrLf & "end sub"

End Function


