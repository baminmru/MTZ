Attribute VB_Name = "GridButtons"
Option Explicit


Public Sub MasterGridButtons(pctl As ControlData, lctl As ControlData, p As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(p, mode)
  AllowEdit = AllowEditPart(p, mode)
  AllowDel = AllowDeleteFromPart(p, mode)
  
  Dim btn As ControlData
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Add"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "NEW.ico"
  AddProp btn, "ToolTipText", "Добавить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 5 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowAdd
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Edit"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "PROP.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Свойства"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 30 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowEdit
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Del"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "DELETE.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Удалить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 55 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowDel
  
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Ref"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "Refresh.ico"
  AddProp btn, "ToolTipText", "Обновить"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 80 * Screen.TwipsPerPixelY
  
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Prn"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "PrintPreview.ico"
  AddProp btn, "ToolTipText", "Печать"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 105 * Screen.TwipsPerPixelY
  
  If (IsMake_TRASH_Buttons) Then '130,155,180,205
    Set btn = pctl.ControlData.Add()
    btn.ProgId = "VB.CommandButton"
    btn.name = "cmd" & p.name & "Cfg"
    AddProp btn, "Name", btn.name
    AddProp btn, "Caption", ""
    AddProp btn, "Tag", "config.ico"
    AddProp btn, "ToolTipText", "Настройка внешнего вида"
    AddProp btn, "Style", 1
    AddProp btn, "UseMaskColor", True
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", 130 * Screen.TwipsPerPixelY
  End If
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Fnd"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "find.ico"
  AddProp btn, "ToolTipText", "Поиск"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  
    If IsMake_TRASH_Buttons Then
        AddProp btn, "Left", 155 * Screen.TwipsPerPixelY
    Else
        AddProp btn, "Left", 130 * Screen.TwipsPerPixelY
    End If
  
  If (IsMake_TRASH_Buttons) Then '130,155,180,205
    Set btn = pctl.ControlData.Add()
    btn.ProgId = "MTZ_PANEL.DropButton"
    btn.name = "cmd" & p.name & "Run"
    AddProp btn, "Name", btn.name
    AddProp btn, "Caption", ""
    AddProp btn, "Tag", "run.ico"
    AddProp btn, "ToolTipText", "Открыть"
    AddProp btn, "Style", 1
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", 180 * Screen.TwipsPerPixelY
  End If
  
  If (IsMake_TRASH_Buttons) Then '130,155,180,205
    Set btn = pctl.ControlData.Add()
    btn.ProgId = "VB.CommandButton"
    btn.name = "cmd" & p.name & "Acc"
    AddProp btn, "Name", btn.name
    AddProp btn, "Caption", ""
    AddProp btn, "Tag", "security.ico"
    AddProp btn, "ToolTipText", "Стиль защиты"
    AddProp btn, "Style", 1
    AddProp btn, "UseMaskColor", True
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", 205 * Screen.TwipsPerPixelY
  End If
  
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Add,cmd" & p.name & "Add.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Edit,cmd" & p.name & "Edit.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Del,cmd" & p.name & "Del.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Ref,cmd" & p.name & "Ref.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Prn,cmd" & p.name & "Prn.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Fnd,cmd" & p.name & "Fnd.tag"
  If IsMake_TRASH_Buttons Then
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Run,cmd" & p.name & "Run.tag"
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Acc,cmd" & p.name & "Acc.tag"
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Cfg,cmd" & p.name & "Cfg.tag"
  End If
          
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Cfg_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "Dim jset As object 'MTZ_JSetup.Customizer"
  body = body & vbCrLf & "Set jset = CreateObject(""MTZ_JSetup.Customizer"")"
  body = body & vbCrLf & "jset.ShowSumary " & lctl.name & ",""" & lctl.name & """"
  body = body & vbCrLf & "Set jset = Nothing"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""


  body = body & vbCrLf & "Private Sub cmd" & p.name & "Prn_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "Dim jset As object 'MTZ_JSetup.Customizer"
  body = body & vbCrLf & "Set jset = CreateObject(""MTZ_JSetup.Customizer"")"
  body = body & vbCrLf & "jset.Preview " & lctl.name & ",""" & NoLF(p.Caption) & """"
  body = body & vbCrLf & "Set jset = Nothing"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
          
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Ref_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  item." & p.name & ".Refresh"
  body = body & vbCrLf & "  " & lctl.name & ".itemCount = item." & p.name & ".count"
  body = body & vbCrLf & "  " & lctl.name & ".Refetch"
  body = body & vbCrLf & "  " & lctl.name & ".Refresh"
  body = body & vbCrLf & "End Sub"
  
  ' кнопка установка стиля защиты
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Acc_Click()"
  body = body & vbCrLf & "On Error Resume Next"
  body = body & vbCrLf & "If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "If " & lctl.name & ".Row > 0 Then"
  body = body & vbCrLf & " If " & lctl.name & ".RowIndex(" & lctl.name & ".Row) > 0 Then"
  body = body & vbCrLf & "    Dim u As Object"
  body = body & vbCrLf & "    Dim bm"
  body = body & vbCrLf & "    bm = " & lctl.name & ".RowBookmark(" & lctl.name & ".RowIndex(" & lctl.name & ".Row))"
  body = body & vbCrLf & "    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))"
  body = body & vbCrLf & "    Item.Application.Manager.ShowSecurityDialog u"
  body = body & vbCrLf & " End If"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End Sub"
  
  ' эта кнопка - всегда редактирует
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Edit_Click()"
  body = body & vbCrLf & "  on error resume next"
  If AllowEdit Then
    body = body & vbCrLf & "If " & lctl.name & ".ItemCount = 0 Then Exit Sub"
    body = body & vbCrLf & "If " & lctl.name & ".Row > 0 then"
    body = body & vbCrLf & " If " & lctl.name & ".RowIndex(" & lctl.name & ".Row ) > 0 Then"
    body = body & vbCrLf & "    Dim u As Object"
    body = body & vbCrLf & "    Dim bm"
    body = body & vbCrLf & "    bm = " & lctl.name & ".RowBookmark(" & lctl.name & ".RowIndex(" & lctl.name & ".Row))"
    body = body & vbCrLf & "    Set u = Item.FindRowObject(Right(bm, len(bm)-38), Left(bm, 38))"
    body = body & vbCrLf & "    Set frm" & p.name & "_" & mode & ".Item = u"
    body = body & vbCrLf & "    again: frm" & p.name & "_" & mode & ".NotFirstTime = False"
    body = body & vbCrLf & "    frm" & p.name & "_" & mode & ".OnInit"
    body = body & vbCrLf & "    frm" & p.name & "_" & mode & ".Show vbModal"
    body = body & vbCrLf & "    If frm" & p.name & "_" & mode & ".OK Then"
    body = body & vbCrLf & "    on error resume next"
    body = body & vbCrLf & "    err.clear"
    body = body & vbCrLf & "    u.save"
    body = body & vbCrLf & "    if err.number <>0 then "
    body = body & vbCrLf & "      msgbox err.description,vbokonly+vbExclamation,""Изменение"""
    body = body & vbCrLf & "      goto again"
    body = body & vbCrLf & "    end if "
    
    ' OnSave
      If Not p.OnSave Is Nothing Then
        body = body & vbCrLf & "        op" & p.name & "_" & p.OnSave.name & "_" & mode & " u"
      End If
    
    body = body & vbCrLf & "    " & lctl.name & ".RefreshRowBookmark bm"
    body = body & vbCrLf & "    else"
    body = body & vbCrLf & "     u.refresh"
    body = body & vbCrLf & "    End If"
    body = body & vbCrLf & " End If"
    body = body & vbCrLf & "End If"
  End If 'Allow Edit
  body = body & vbCrLf & "End Sub"
  
  
  'DEL '''''''''''''''''''''''''''''
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Del_Click()"
  body = body & vbCrLf & "  on error resume next"
  If AllowDel Then
    body = body & vbCrLf & "  " & lctl.name & ".Delete"
  End If
  body = body & vbCrLf & "End Sub"
  
  
  'ADD '''''''''''''''''''''''''''''
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Add_Click()"
  body = body & vbCrLf & "  on error resume next"
  
  If AllowAdd Then
    body = body & vbCrLf & "      Dim u As Object"
    body = body & vbCrLf & "      Set u = Item." & p.name & ".Add()"
    
    'Defaults
    body = body & vbCrLf & MakeDefaultCode(p, "u")
    
    
    
    If p.AddBehaivor = PartAddBehaivor_AddForm Then
    
      body = body & vbCrLf & "      Set frm" & p.name & "_" & mode & ".Item = u"
      body = body & vbCrLf & "      again: frm" & p.name & "_" & mode & ".NotFirstTime = False"
      body = body & vbCrLf & "      frm" & p.name & "_" & mode & ".OnInit"
      body = body & vbCrLf & "      frm" & p.name & "_" & mode & ".Show vbModal"
      body = body & vbCrLf & "      If frm" & p.name & "_" & mode & ".OK Then"
      body = body & vbCrLf & "        err.clear"
      body = body & vbCrLf & "        u.save"
      body = body & vbCrLf & "        if err.number <>0 then "
      body = body & vbCrLf & "          msgbox err.description,vbokonly+vbExclamation,""Создание"""
      body = body & vbCrLf & "          goto again"
      body = body & vbCrLf & "        end if "
      
      ' Oncreate
      If Not p.OnCreate Is Nothing Then
        body = body & vbCrLf & "        op" & p.name & "_" & p.OnCreate.name & "_" & mode & " u"
      End If
      
      body = body & vbCrLf & "        " & lctl.name & ".ItemCount = Item." & p.name & ".Count"
      body = body & vbCrLf & "        " & lctl.name & ".Refresh"
      body = body & vbCrLf & "        " & lctl.name & ".RefreshGroups"
      body = body & vbCrLf & "        " & lctl.name & ".Refreshsort"
      body = body & vbCrLf & "        " & lctl.name & ".MoveToBookmark u.ID & """ & p.name & """"
      body = body & vbCrLf & "      Else"
      body = body & vbCrLf & "        Item." & p.name & ".Delete u.ID"
      body = body & vbCrLf & "        Item." & p.name & ".Remove u.ID"
      body = body & vbCrLf & "      End If"
      
    End If  'AddForm
    
    If p.AddBehaivor = PartAddBehaivor_RefreshOnly Then
    
      ' Oncreate
      If Not p.OnCreate Is Nothing Then
        body = body & vbCrLf & "        op" & p.name & "_" & p.OnCreate.name & "_" & mode & " u"
      End If
      
      body = body & vbCrLf & "        " & lctl.name & ".ItemCount = Item." & p.name & ".Count"
      body = body & vbCrLf & "        " & lctl.name & ".Refresh"
      body = body & vbCrLf & "        " & lctl.name & ".RefreshGroups"
      body = body & vbCrLf & "        " & lctl.name & ".Refreshsort"
      body = body & vbCrLf & "        " & lctl.name & ".MoveToBookmark u.ID & """ & p.name & """"
    
    End If 'RefreshOnly
    
    
    If p.AddBehaivor = PartAddBehaivor_RunAction Then
    ' Oncreate
      If Not p.OnCreate Is Nothing Then
        body = body & vbCrLf & "        op" & p.name & "_" & p.OnCreate.name & "_" & mode & " u"
      End If
      
      body = body & vbCrLf & "        " & lctl.name & ".ItemCount = Item." & p.name & ".Count"
      body = body & vbCrLf & "        " & lctl.name & ".Refresh"
      body = body & vbCrLf & "        " & lctl.name & ".RefreshGroups"
      body = body & vbCrLf & "        " & lctl.name & ".Refreshsort"
      body = body & vbCrLf & "        " & lctl.name & ".MoveToBookmark u.ID & """ & p.name & """"
      body = body & vbCrLf & "        cmd" & p.name & "Run_click"
    End If 'RunAction
    
  End If ' AllowAdd
  body = body & vbCrLf & "      Exit Sub"
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "   MsgBox Err.Description,vbokonly+vbExclamation,""Создание"""
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Fnd_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  fnd" & p.name & ".ShowForm"
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Run_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  " & lctl.name & "_DblClick"
  body = body & vbCrLf & "End Sub"
    
End Sub



Public Sub SlaveGridButtons(ByVal Vertical As Boolean, pctl As ControlData, rctl As ControlData, p As PART, Child As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim AllowEdit As Boolean
  Dim AllowAdd As Boolean
  Dim AllowDel As Boolean
  AllowAdd = AllowAddToPart(Child, mode)
  AllowEdit = AllowEditPart(Child, mode)
  AllowDel = AllowDeleteFromPart(Child, mode)
  
  
  Dim btn As ControlData
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Add"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "NEW.ico"
  AddProp btn, "ToolTipText", "Добавить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 5 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowAdd
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Edit"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "PROP.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Свойства"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 30 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowEdit
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Del"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "DELETE.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Удалить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 55 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Enabled", AllowDel
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Ref"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "Refresh.ico"
  AddProp btn, "ToolTipText", "Обновить"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 80 * Screen.TwipsPerPixelY
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Prn"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "PrintPreview.ico"
  AddProp btn, "ToolTipText", "Печать"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 105 * Screen.TwipsPerPixelY
  
    If (IsMake_TRASH_Buttons) Then '130,155,180,205
    
        Set btn = pctl.ControlData.Add()
        btn.ProgId = "VB.CommandButton"
        btn.name = "cmd" & Child.name & "Cfg"
        AddProp btn, "Name", btn.name
        AddProp btn, "Caption", ""
        AddProp btn, "Tag", "config.ico"
        AddProp btn, "ToolTipText", "Настройка внешнего вида"
        AddProp btn, "Style", 1
        AddProp btn, "UseMaskColor", True
        AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
        AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
        AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
        AddProp btn, "Left", 130 * Screen.TwipsPerPixelY
    End If
    
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & Child.name & "Fnd"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "find.ico"
  AddProp btn, "ToolTipText", "Поиск"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
   If IsMake_TRASH_Buttons Then
        AddProp btn, "Left", 155 * Screen.TwipsPerPixelY
    Else
        AddProp btn, "Left", 130 * Screen.TwipsPerPixelY
    End If
  'AddProp btn, "Left", 155 * Screen.TwipsPerPixelY
  
    If (IsMake_TRASH_Buttons) Then '130,155,180,205

      Set btn = pctl.ControlData.Add()
      btn.ProgId = "MTZ_PANEL.DropButton"
      btn.name = "cmd" & Child.name & "Run"
      AddProp btn, "Name", btn.name
      AddProp btn, "Caption", ""
      AddProp btn, "Tag", "run.ico"
      AddProp btn, "ToolTipText", "Открыть"
      AddProp btn, "Style", 1
      AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
      AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
      AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
      AddProp btn, "Left", 180 * Screen.TwipsPerPixelY
    End If
    
    If (IsMake_TRASH_Buttons) Then '130,155,180,205

        Set btn = pctl.ControlData.Add()
        btn.ProgId = "VB.CommandButton"
        btn.name = "cmd" & Child.name & "Acc"
        AddProp btn, "Name", btn.name
        AddProp btn, "Caption", ""
        AddProp btn, "Tag", "security.ico"
        AddProp btn, "ToolTipText", "Стиль защиты"
        AddProp btn, "Style", 1
        AddProp btn, "UseMaskColor", True
        AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
        AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
        AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
        AddProp btn, "Left", 205 * Screen.TwipsPerPixelY
    End If
  
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Cfg_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "Dim jset As object 'MTZ_JSetup.Customizer"
  body = body & vbCrLf & "Set jset = CreateObject(""MTZ_JSetup.Customizer"")"
  body = body & vbCrLf & "jset.ShowSumary " & rctl.name & ",""" & rctl.name & """"
  body = body & vbCrLf & "Set jset = Nothing"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""

  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Prn_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "Dim jset As object 'MTZ_JSetup.Customizer"
  body = body & vbCrLf & "Set jset = CreateObject(""MTZ_JSetup.Customizer"")"
  body = body & vbCrLf & "jset.Preview " & rctl.name & ",""" & NoLF(Child.Caption) & """"
  body = body & vbCrLf & "Set jset = Nothing"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
  ' кнопка установка стиля защиты
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Acc_Click()"
  body = body & vbCrLf & "On Error Resume Next"
  body = body & vbCrLf & "If " & rctl.name & ".ItemCount = 0 Then Exit Sub"
  body = body & vbCrLf & "If " & rctl.name & ".Row > 0 Then"
  body = body & vbCrLf & " If " & rctl.name & ".RowIndex(" & rctl.name & ".Row) > 0 Then"
  body = body & vbCrLf & "    Dim u As Object"
  body = body & vbCrLf & "    Dim bm"
  body = body & vbCrLf & "    bm = " & rctl.name & ".RowBookmark(" & rctl.name & ".RowIndex(" & rctl.name & ".Row))"
  body = body & vbCrLf & "    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))"
  body = body & vbCrLf & "    Item.Application.Manager.ShowSecurityDialog u"
  body = body & vbCrLf & " End If"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Fnd_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  fnd" & Child.name & ".ShowForm"
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub cmd" & Child.name & "Run_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  " & rctl.name & "_DblClick"
  body = body & vbCrLf & "End Sub"
  
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Add,cmd" & Child.name & "Add.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Edit,cmd" & Child.name & "Edit.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Del,cmd" & Child.name & "Del.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Ref,cmd" & Child.name & "Ref.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Prn,cmd" & Child.name & "Prn.tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Fnd,cmd" & Child.name & "Fnd.Tag"
  If IsMake_TRASH_Buttons Then
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Cfg,cmd" & Child.name & "Cfg.tag"
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Run,cmd" & Child.name & "Run.Tag"
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & Child.name & "Acc,cmd" & Child.name & "Acc.Tag"
  End If
  
  
  tsInit = tsInit & vbCrLf & "  " & rctl.name & ".Columns.Clear"
  tsInit = tsInit & vbCrLf & "  " & rctl.name & ".ItemCount=0"
  tsInit = tsInit & vbCrLf & "  cmd" & Child.name & "Ref_Click"
  
  
End Sub




Public Sub ComplexGridButtons(ByVal Vertical As Boolean, pctl As ControlData, rctl As ControlData, p As PART, mode As String, body As String, tsClick As String, tsInit As String)
  Dim btn As ControlData
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmdT" & p.name & "Ref"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "Refresh.ico"
  AddProp btn, "ToolTipText", "Обновить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 5 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  
  
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Add"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "NEW.ico"
  AddProp btn, "ToolTipText", "Добавить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 5 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Edit"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "PROP.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Свойства"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 30 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Del"
  AddProp btn, "Name", btn.name
  AddProp btn, "Tag", "DELETE.ico"
  AddProp btn, "Caption", ""
  AddProp btn, "ToolTipText", "Удалить"
  AddProp btn, "Style", 1
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 55 * Screen.TwipsPerPixelY
  AddProp btn, "UseMaskColor", True
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Ref"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "refresh.ico"
  AddProp btn, "ToolTipText", "Обновить"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 80 * Screen.TwipsPerPixelY
  
  Set btn = pctl.ControlData.Add()
  btn.ProgId = "VB.CommandButton"
  btn.name = "cmd" & p.name & "Prn"
  AddProp btn, "Name", btn.name
  AddProp btn, "Caption", ""
  AddProp btn, "Tag", "PrintPreview.ico"
  AddProp btn, "ToolTipText", "Печать"
  AddProp btn, "Style", 1
  AddProp btn, "UseMaskColor", True
  AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
  AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
  AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
  AddProp btn, "Left", 105 * Screen.TwipsPerPixelY
  If IsMake_TRASH_Buttons Then
    Set btn = pctl.ControlData.Add()
    btn.ProgId = "VB.CommandButton"
    btn.name = "cmd" & p.name & "Cfg"
    AddProp btn, "Name", btn.name
    AddProp btn, "Caption", ""
    AddProp btn, "Tag", "config.ico"
    AddProp btn, "ToolTipText", "Настройка внешнего вида"
    AddProp btn, "Style", 1
    AddProp btn, "UseMaskColor", True
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", 130 * Screen.TwipsPerPixelY
    
    Set btn = pctl.ControlData.Add()
    btn.ProgId = "VB.CommandButton"
    btn.name = "cmd" & p.name & "Fnd"
    AddProp btn, "Name", btn.name
    AddProp btn, "Caption", ""
    AddProp btn, "Tag", "find.ico"
    AddProp btn, "ToolTipText", "Поиск"
    AddProp btn, "Style", 1
    AddProp btn, "UseMaskColor", True
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", 155 * Screen.TwipsPerPixelY
    
    
    Set btn = pctl.ControlData.Add()
    btn.ProgId = "MTZ_PANEL.DropButton"
    btn.name = "cmd" & p.name & "Run"
    AddProp btn, "Name", btn.name
    AddProp btn, "Caption", ""
    AddProp btn, "Tag", "run.ico"
    AddProp btn, "ToolTipText", "Открыть"
    AddProp btn, "Style", 1
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", 180 * Screen.TwipsPerPixelY
      
    Set btn = pctl.ControlData.Add()
    btn.ProgId = "VB.CommandButton"
    btn.name = "cmd" & p.name & "Acc"
    AddProp btn, "Name", btn.name
    AddProp btn, "Caption", ""
    AddProp btn, "Tag", "security.ico"
    AddProp btn, "ToolTipText", "Стиль защиты"
    AddProp btn, "Style", 1
    AddProp btn, "UseMaskColor", True
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", 205 * Screen.TwipsPerPixelY
  Else
    Set btn = pctl.ControlData.Add()
    btn.ProgId = "VB.CommandButton"
    btn.name = "cmd" & p.name & "Fnd"
    AddProp btn, "Name", btn.name
    AddProp btn, "Caption", ""
    AddProp btn, "Tag", "find.ico"
    AddProp btn, "ToolTipText", "Поиск"
    AddProp btn, "Style", 1
    AddProp btn, "UseMaskColor", True
    AddProp btn, "Height", 22 * Screen.TwipsPerPixelY
    AddProp btn, "Width", 22 * Screen.TwipsPerPixelX
    AddProp btn, "Top", 2 * Screen.TwipsPerPixelY
    AddProp btn, "Left", 130 * Screen.TwipsPerPixelY
  End If
  

  body = body & vbCrLf & "Private Sub cmd" & p.name & "Prn_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "Dim jset As object 'MTZ_JSetup.Customizer"
  body = body & vbCrLf & "Set jset = CreateObject(""MTZ_JSetup.Customizer"")"
  body = body & vbCrLf & "jset.Preview " & rctl.name & ",""" & NoLF(p.Caption) & """"
  body = body & vbCrLf & "Set jset = Nothing"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  
  
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Fnd_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  fnd" & p.name & ".ShowForm"
  body = body & vbCrLf & "End Sub"
  
  
  body = body & vbCrLf & "Private Sub cmd" & p.name & "Run_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  " & rctl.name & "_DblClick"
  body = body & vbCrLf & "End Sub"
  
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmdT" & p.name & "Ref,cmdT" & p.name & "Ref.Tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Ref,cmd" & p.name & "Ref.Tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Add,cmd" & p.name & "Add.Tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Edit,cmd" & p.name & "Edit.Tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Del,cmd" & p.name & "Del.Tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Prn,cmd" & p.name & "Prn.Tag"
  tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Fnd,cmd" & p.name & "Fnd.Tag"
  If IsMake_TRASH_Buttons Then
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Cfg,cmd" & p.name & "Cfg.Tag"
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Run,cmd" & p.name & "Run.Tag"
    tsInit = tsInit & vbCrLf & "  LoadBtnPictures cmd" & p.name & "Acc,cmd" & p.name & "Acc.Tag"
  End If
  
  tsInit = tsInit & vbCrLf & "  " & rctl.name & ".Columns.Clear"
  tsInit = tsInit & vbCrLf & "  " & rctl.name & ".ItemCount=0"
  
End Sub



