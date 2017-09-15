Attribute VB_Name = "FilterControls"
Option Explicit


Public Sub GenerateFilterControls(fd As Object, fld As FileterField, pos As Long, SaveFields As String, LoadFields As String, COLUMN As Long, MINPOS As Long, pname As String, body As String, decl As String, GenStyle As String, IsOK As String)
 On Error GoTo bye
 
  Dim mproc As String, pp As Long, txt As String

  If pos > 420 * Screen.TwipsPerPixelY Then
   COLUMN = COLUMN + 1
   pos = MINPOS
  End If
  
  Dim ctl As ControlData
  Set ctl = fd.ControlData.Add()
  ctl.ProgId = "VB.Label"
 
  Call AddProp(ctl, "BackStyle", 0)
  Call AddProp(ctl, "NAME", "lbl" & fld.name)
  Call AddProp(ctl, "Caption", NoLF(fld.Caption) & ":")
  Call AddProp(ctl, "Top", pos)
  Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
  Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
  Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
  Call AddProp(ctl, "ForeColor", vbBlack)

  pos = pos + 22 * Screen.TwipsPerPixelY
  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  ' control labeled

    If GenStyle = "REFERENCE" Then
       Set ctl = fd.ControlData.Add()
       ctl.ProgId = "VB.textbox"
       Call AddProp(ctl, "NAME", "txt" & fld.name)
       Call AddProp(ctl, "Text", "")
       Call AddProp(ctl, "Locked", True)
       Call AddProp(ctl, "Top", pos)
       Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
       Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
       Call AddProp(ctl, "Width", 170 * Screen.TwipsPerPixelY)
       Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
 
       Set ctl = fd.ControlData.Add()
       ctl.ProgId = "MTZ_PANEL.DropButton"
       Call AddProp(ctl, "NAME", "cmd" & fld.name)
       Call AddProp(ctl, "Caption", "")
       Call AddProp(ctl, "Tag", "refopen.ico")
       Call AddProp(ctl, "Top", pos)
       Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX + 170 * Screen.TwipsPerPixelX)
       Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
       Call AddProp(ctl, "Width", 30 * Screen.TwipsPerPixelY)
       Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))

      pos = pos + 25 * Screen.TwipsPerPixelY

      body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
      body = body & vbCrLf & "  Changing"
      body = body & vbCrLf & "end sub"

      
      LoadFields = LoadFields & vbCrLf & "If Not item." & fld.name & " Is Nothing Then"
      LoadFields = LoadFields & vbCrLf & "  txt" & fld.name & ".Tag = item." & fld.name & ".id"
      LoadFields = LoadFields & vbCrLf & "  txt" & fld.name & " = item." & fld.name & ".brief"
      LoadFields = LoadFields & vbCrLf & "else"
      LoadFields = LoadFields & vbCrLf & "  txt" & fld.name & ".Tag = """" "
      LoadFields = LoadFields & vbCrLf & "  txt" & fld.name & " = """" "
      LoadFields = LoadFields & vbCrLf & "End If"
      LoadFields = LoadFields & vbCrLf & " LoadBtnPictures cmd" & fld.name & ",cmd" & fld.name & ".tag"
      
      LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".RemoveAllMenu"
      LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".AddMenu ""Очистить"" "
      
      
      
      If fld.RefType = ReferenceType_Na_ob_ekt_ Then
        LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".AddMenu ""Открыть"" "
        LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".AddMenu ""Создать"" "
        LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".AddMenu ""Выбрать"" "
        
        SaveFields = SaveFields & vbCrLf & "If txt" & fld.name & ".Tag <> """" Then"
        SaveFields = SaveFields & vbCrLf & "  Set item." & fld.name & " = Item.Application.Manager.GetInstanceObject(txt" & fld.name & ".Tag)"
        SaveFields = SaveFields & vbCrLf & "Else"
        SaveFields = SaveFields & vbCrLf & "  Set item." & fld.name & " = Nothing"
        SaveFields = SaveFields & vbCrLf & "End If"
        
        body = body & vbCrLf & "private sub cmd" & fld.name & "_CLick()"
        body = body & vbCrLf & "  on error resume next"
        body = body & vbCrLf & "     If txt" & fld.name & ".Tag ="""" then"
        body = body & vbCrLf & "       cmd" & fld.name & "_MenuClick ""Выбрать"" "
        body = body & vbCrLf & "     Else"
        body = body & vbCrLf & "       cmd" & fld.name & "_MenuClick ""Открыть"" "
        body = body & vbCrLf & "     End If"
        body = body & vbCrLf & "end sub"
        
        body = body & vbCrLf & "private sub cmd" & fld.name & "_MenuClick(ByVal sCaption As String)"
        body = body & vbCrLf & "  on error resume next"
        body = body & vbCrLf & "    dim inst as object"
        body = body & vbCrLf & "    dim obj as object"
        body = body & vbCrLf & "    Dim d As form"
        body = body & vbCrLf & "    Dim id As string"
        body = body & vbCrLf & "  if sCaption =""Очистить"" then"
        body = body & vbCrLf & "          txt" & fld.name & ".Tag = """""
        body = body & vbCrLf & "          txt" & fld.name & " = """""
        body = body & vbCrLf & "  end if"
        body = body & vbCrLf & "  if sCaption =""Открыть"" then"
        body = body & vbCrLf & "    if txt" & fld.name & ".tag ="""" then exit sub"
        
        body = body & vbCrLf & "    set inst  = item.Application.Manager.GetInstanceObject(txt" & fld.name & ".tag)"
        body = body & vbCrLf & "    if inst is nothing then exit sub"
        body = body & vbCrLf & "    set obj = item.Application.Manager.GetInstanceGUI(txt" & fld.name & ".tag)"
        body = body & vbCrLf & "    obj.show """", inst,true"
        body = body & vbCrLf & "    set obj =nothing"
        body = body & vbCrLf & "    set inst =nothing"
        body = body & vbCrLf & "  end if"
        
        body = body & vbCrLf & "  if sCaption =""Выбрать"" then"
        If fld.RefToType Is Nothing Then
          body = body & vbCrLf & "        Set d = Item.Application.Manager.GetObjectListDialog("""","""")"
        Else
          body = body & vbCrLf & "        Set d = Item.Application.Manager.GetObjectListDialog("""",""" & fld.RefToType.name & """)"
        End If
        body = body & vbCrLf & "        d.Show vbModal, Me"
        body = body & vbCrLf & "        If d.OK Then"
        body = body & vbCrLf & "          txt" & fld.name & ".Tag = left(d.ID,38)"
        body = body & vbCrLf & "          txt" & fld.name & " = d.brief"
        body = body & vbCrLf & "        End If"
        body = body & vbCrLf & "        set d = nothing"
        body = body & vbCrLf & "  end if"
        
        body = body & vbCrLf & "  if sCaption =""Создать"" then"
        body = body & vbCrLf & "     on error resume next"
        If fld.RefToType Is Nothing Then
          body = body & vbCrLf & "        Set obj = Item.Application.Manager.GetNewObject()"
        Else
          body = body & vbCrLf & "        id =Createguid2"
          body = body & vbCrLf & "        Item.Application.Manager.NewInstance id,""" & fld.RefToType.name & """,""" & NoLF(fld.RefToType.Comment) & " "" & Now "
          body = body & vbCrLf & "        Set obj = Item.Application.Manager.GetInstanceObject(id)"
        End If
        
        body = body & vbCrLf & "        If not obj is nothing Then"
        body = body & vbCrLf & "          txt" & fld.name & ".Tag = obj.ID"
        body = body & vbCrLf & "          txt" & fld.name & " = obj.brief"
        body = body & vbCrLf & "          set obj = nothing"
        body = body & vbCrLf & "        End If"
        body = body & vbCrLf & "  end if"
        
        
        body = body & vbCrLf & "End sub"
      End If ' Ref to object

      If fld.RefType = ReferenceType_Na_stroku_razdela Then
        SaveFields = SaveFields & vbCrLf & "If txt" & fld.name & ".Tag <> """" Then"
        SaveFields = SaveFields & vbCrLf & "  Set item." & fld.name & " = Item.Application.FindRowObject(""" & fld.RefToPart.name & """,txt" & fld.name & ".Tag)"
        SaveFields = SaveFields & vbCrLf & "Else"
        SaveFields = SaveFields & vbCrLf & "  Set item." & fld.name & " = Nothing"
        SaveFields = SaveFields & vbCrLf & "End If"
      
        body = body & vbCrLf & "private sub cmd" & fld.name & "_CLick()"
        body = body & vbCrLf & "  on error resume next"
        body = body & vbCrLf & "        Dim d As form"
        body = body & vbCrLf & "        Set d = Item.Application.Manager.GetReferenceDialogEx(""" & fld.RefToPart.name & """)"
        body = body & vbCrLf & "        d.Show vbModal, Me"
        body = body & vbCrLf & "        If d.OK Then"
        body = body & vbCrLf & "          txt" & fld.name & ".Tag = left(d.ID,38)"
        body = body & vbCrLf & "          txt" & fld.name & " = d.brief"
        body = body & vbCrLf & "        End If"
        body = body & vbCrLf & "        set d = nothing"
        body = body & vbCrLf & "end sub"
        
        
        body = body & vbCrLf & "private sub cmd" & fld.name & "_MenuClick(ByVal sCaption As String)"
        body = body & vbCrLf & "          txt" & fld.name & ".Tag = """""
        body = body & vbCrLf & "          txt" & fld.name & " = """""
        body = body & vbCrLf & "End sub"

        
      End If ' ref to row
      
    End If 'REFERENCE

    If GenStyle = "TEXT" Or GenStyle = "GUID" Then
      Set ctl = fd.ControlData.Add()
      ctl.ProgId = "VB.textbox"
      Call AddProp(ctl, "NAME", "txt" & fld.name)
      Call AddProp(ctl, "Text", "")
      Call AddProp(ctl, "Top", pos)
      Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
      Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "MaxLength", fld.FieldSize)
      Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
      pos = pos + 25 * Screen.TwipsPerPixelY
      body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
      body = body & vbCrLf & "  Changing"
      body = body & vbCrLf & "end sub"
      SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name
      LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name
    End If ' TEXT  GUID
    
    ' no PASSWORD in filter

    ' todo
    If GenStyle = "EMAIL" Then
      Set ctl = fd.ControlData.Add()
      ctl.ProgId = "VB.textbox"
      Call AddProp(ctl, "NAME", "txt" & fld.name)
      Call AddProp(ctl, "Text", "")
      Call AddProp(ctl, "Top", pos)
      Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
      Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "Width", 170 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "MaxLength", fld.FieldSize)
      Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
      
      Set ctl = fd.ControlData.Add()
      ctl.ProgId = "MTZ_PANEL.DropButton"
      Call AddProp(ctl, "NAME", "cmd" & fld.name)
      Call AddProp(ctl, "Caption", "")
      Call AddProp(ctl, "Tag", "mailopen.ico")
      Call AddProp(ctl, "Top", pos)
      Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX + 170 * Screen.TwipsPerPixelX)
      Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "Width", 30 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))

      
      pos = pos + 25 * Screen.TwipsPerPixelY

      body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
      body = body & vbCrLf & "  Changing"
      body = body & vbCrLf & "end sub"
      
      body = body & vbCrLf & "private sub cmd" & fld.name & "_CLick()"
      'body = body & vbCrLf & "  on error resume next"
      'body = body & vbCrLf & "        shell ""start mailto:"" &   txt" & fld.name
      
      body = body & vbCrLf & "  on error resume next"
      body = body & vbCrLf & "  Dim s As String"
      body = body & vbCrLf & "  s = s & ""mailto:"" & txt" & fld.name & ".text "
      body = body & vbCrLf & "  OpenDocument 0, s"
      
      body = body & vbCrLf & "end sub"

      SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name
      LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name
      LoadFields = LoadFields & vbCrLf & " LoadBtnPictures cmd" & fld.name & ",cmd" & fld.name & ".tag"
      LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".RemoveAllMenu"
      
      
      
    End If 'EMAIL


    ' todo
    If GenStyle = "URL" Then
      Set ctl = fd.ControlData.Add()
      ctl.ProgId = "VB.textbox"
      Call AddProp(ctl, "NAME", "txt" & fld.name)
      Call AddProp(ctl, "Text", "")
      Call AddProp(ctl, "Top", pos)
      Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
      Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "Width", 170 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "MaxLength", fld.FieldSize)
      Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
      
      
      Set ctl = fd.ControlData.Add()
      ctl.ProgId = "MTZ_PANEL.DropButton"
      Call AddProp(ctl, "NAME", "cmd" & fld.name)
      Call AddProp(ctl, "Caption", "")
      Call AddProp(ctl, "Tag", "urlopen.ico")
      Call AddProp(ctl, "Top", pos)
      Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX + 170 * Screen.TwipsPerPixelX)
      Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "Width", 30 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
      
      
      pos = pos + 25 * Screen.TwipsPerPixelY

      body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
      body = body & vbCrLf & "  Changing"
      body = body & vbCrLf & "end sub"

      body = body & vbCrLf & "private sub cmd" & fld.name & "_CLick()"
      body = body & vbCrLf & "  on error resume next"
      body = body & vbCrLf & "  Dim s As String"
      body = body & vbCrLf & "  s = s & ""http:\\"" & txt" & fld.name & ".text "
      body = body & vbCrLf & "  OpenDocument 0, s"
      body = body & vbCrLf & "end sub"

      SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name
      LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name
      LoadFields = LoadFields & vbCrLf & " LoadBtnPictures cmd" & fld.name & ",cmd" & fld.name & ".tag"
      LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".RemoveAllMenu"
      
      
      
    End If 'URL





    If GenStyle = "HTML" Then
      
      Set ctl = fd.ControlData.Add()
      ctl.ProgId = "VB.textbox"
      Call AddProp(ctl, "NAME", "txt" & fld.name)
      Call AddProp(ctl, "Text", "")
      Call AddProp(ctl, "Top", pos)
      Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
      Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
      Call AddProp(ctl, "Multiline", True)
      Call AddProp(ctl, "Scrollbars", 3)

      Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
      
      pos = pos + 25 * Screen.TwipsPerPixelY
      body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
      body = body & vbCrLf & "  Changing"
      body = body & vbCrLf & "end sub"
      SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name
      LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name
      
      
    End If 'HTML




   If GenStyle = "MEMO" Then
       Set ctl = fd.ControlData.Add()
       ctl.ProgId = "VB.textbox"
       Call AddProp(ctl, "NAME", "txt" & fld.name)
       Call AddProp(ctl, "Text", "")
       Call AddProp(ctl, "Top", pos)
       Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
       Call AddProp(ctl, "Height", 80 * Screen.TwipsPerPixelY)
       Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
       Call AddProp(ctl, "Multiline", True)
       Call AddProp(ctl, "Scrollbars", 3)
       Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
       pos = pos + 85 * Screen.TwipsPerPixelY


       body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
       body = body & vbCrLf & "  Changing"
       body = body & vbCrLf & "end sub"

      SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name
      LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name


    End If ' MEMO


   ' no  Files in filter
   ' no images in filter

    ' numeric type
    'Double
    'Integer
    'Long

    If GenStyle = "NUMERIC" Or GenStyle = "INTEGER" Or GenStyle = "INTERVAL" Then

       Set ctl = fd.ControlData.Add()
       ctl.ProgId = "VB.textbox"
       Call AddProp(ctl, "NAME", "txt" & fld.name)
       Call AddProp(ctl, "Text", "")
       Call AddProp(ctl, "Top", pos)
       Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
       Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
       Call AddProp(ctl, "Width", 120 * Screen.TwipsPerPixelY)
       Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
       Call AddProp(ctl, "CausesValidation", True)
       If GenStyle = "NUMERIC" Then
        Call AddProp(ctl, "MaxLength", 27)
       Else
        Call AddProp(ctl, "MaxLength", 15)
       End If
      
      If GenStyle = "NUMERIC" Then
      body = body & vbCrLf & "private sub txt" & fld.name & "_Validate(cancel as boolean)"
      body = body & vbCrLf & _
        "if txt" & fld.name & ".text<>"""" then " & vbCrLf & _
        " on error resume next " & vbCrLf & _
        "  if not isnumeric(txt" & fld.name & ".text) then " & vbCrLf & _
        "     cancel=true " & vbCrLf & _
        "     msgbox ""Ожидалось число"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
        "  elseif Val(txt" & fld.name & ".text) < -922337203685477.5808 or Val(txt" & fld.name & ".text)>+922337203685477.5807 then " & vbCrLf & _
        "     cancel=true " & vbCrLf & _
        "     msgbox ""Значение вне допустимого диапазона"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
        "  end if" & vbCrLf & _
        "end if"
       body = body & vbCrLf & "end sub"
      ElseIf GenStyle = "INTEGER" Then
        body = body & vbCrLf & "private sub txt" & fld.name & "_Validate(cancel as boolean)"
        body = body & vbCrLf & _
        "if txt" & fld.name & ".text<>"""" then " & vbCrLf & _
        " on error resume next " & vbCrLf & _
        "  if not isnumeric(txt" & fld.name & ".text) then " & vbCrLf & _
        "     cancel=true " & vbCrLf & _
        "     msgbox ""Ожидалось число"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
        "  elseif Val(txt" & fld.name & ".text) <>clng(Val(txt" & fld.name & ".text)) then " & vbCrLf & _
        "     cancel=true " & vbCrLf & _
        "     msgbox ""Ожидалось целое число"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
        "  end if" & vbCrLf & _
        "end if"
        body = body & vbCrLf & "end sub"
        
      Else 'INTERVAL
        body = body & vbCrLf & "private sub txt" & fld.name & "_Validate(cancel as boolean)"
        body = body & vbCrLf & _
        "if txt" & fld.name & ".text<>"""" then " & vbCrLf & _
        " on error resume next " & vbCrLf & _
        "  if not isnumeric(txt" & fld.name & ".text) then " & vbCrLf & _
        "     cancel=true " & vbCrLf & _
        "     msgbox ""Ожидалось число"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
        "  elseif Val(txt" & fld.name & ".text) <>clng(Val(txt" & fld.name & ".text)) then " & vbCrLf & _
        "     cancel=true " & vbCrLf & _
        "     msgbox ""Ожидалось целое число"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
        "  elseif Val(txt" & fld.name & ".text) < " & fld.FIELDTYPE.Minimum & " or  Val(txt" & fld.name & ".text)>" & fld.FIELDTYPE.Maximum & " then " & vbCrLf & _
        "     cancel=true " & vbCrLf & _
        "     msgbox ""Значение вне допустимого диапазона"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
        "  end if" & vbCrLf & _
        "end if"
        body = body & vbCrLf & "end sub"
      
      
      End If

      
      body = body & vbCrLf & "Private Sub txt" & fld.name & "_KeyPess(KeyAscii As Integer)"
      body = body & vbCrLf & "Dim s As String" & vbCrLf & _
      "s = ""0123456789.,-"" & Chr(8)" & vbCrLf & _
      "If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub" & vbCrLf & _
      "KeyAscii = 0" & vbCrLf
      body = body & vbCrLf & "End Sub"

      body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
      body = body & vbCrLf & "  Changing"
      body = body & vbCrLf & "end sub"


      SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = cdbl(txt" & fld.name & ")"
      LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name

      


      pos = pos + 25 * Screen.TwipsPerPixelY
    End If

    ' date type
    If GenStyle = "DATE" Or GenStyle = "DATETIME" Or GenStyle = "TIME" Then

       Set ctl = fd.ControlData.Add()
       ctl.ProgId = "MSComCtl2.DTPicker"
       Call AddProp(ctl, "NAME", "dtp" & fld.name)
       Call AddProp(ctl, "Top", pos)
       Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
       Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
       Call AddProp(ctl, "Format", 3)
       Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
       If GenStyle = "DATETIME" Then
          Call AddProp(ctl, "CustomFormat", "dd/MM/yyyy HH:mm:ss")
          Call AddProp(ctl, "Width", 150 * Screen.TwipsPerPixelY)
          LoadFields = LoadFields & vbCrLf & "dtp" & fld.name & " = now"
       End If
       If GenStyle = "DATE" Then
         Call AddProp(ctl, "CustomFormat", "dd/MM/yyyy")
         Call AddProp(ctl, "Width", 120 * Screen.TwipsPerPixelY)
         LoadFields = LoadFields & vbCrLf & "dtp" & fld.name & " = date"
       End If
       If GenStyle = "TIME" Then
         Call AddProp(ctl, "CustomFormat", "HH:mm:ss")
         Call AddProp(ctl, "Width", 120 * Screen.TwipsPerPixelY)
         Call AddProp(ctl, "UpDown", True)
         LoadFields = LoadFields & vbCrLf & "dtp" & fld.name & " = time"
       End If

       
       Call AddProp(ctl, "CheckBox", True)
       

       body = body & vbCrLf & "private sub dtp" & fld.name & "_Change()"
       body = body & vbCrLf & "  Changing"
       body = body & vbCrLf & "end sub"


       SaveFields = SaveFields & vbCrLf & "  if  isnull(dtp" & fld.name & ") then"
       SaveFields = SaveFields & vbCrLf & "    item." & fld.name & " = 0"
       SaveFields = SaveFields & vbCrLf & "  else"
       SaveFields = SaveFields & vbCrLf & "    item." & fld.name & " = dtp" & fld.name & ".value"
       SaveFields = SaveFields & vbCrLf & "  end if"
       
       LoadFields = LoadFields & vbCrLf & "if item." & fld.name & " <> 0 then"
       LoadFields = LoadFields & vbCrLf & " dtp" & fld.name & " = item." & fld.name
       
       LoadFields = LoadFields & vbCrLf & "else"
       LoadFields = LoadFields & vbCrLf & " dtp" & fld.name & ".value = null"
    
       LoadFields = LoadFields & vbCrLf & "end if"
       pos = pos + 25 * Screen.TwipsPerPixelY
       
       

       
    End If ' DATE TIME DATETIME

    ' Enum !!!
    If GenStyle = "COMBOBOX" Or GenStyle = "CHECKBOX" Then

      Set ctl = fd.ControlData.Add()
      ctl.ProgId = "VB.ComboBox"
      Call AddProp(ctl, "NAME", "cmb" & fld.name)
      Call AddProp(ctl, "Style", 2)
      Call AddProp(ctl, "Sorted", True)
      Call AddProp(ctl, "Top", pos)
      Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
      Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
      Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)

      
      body = body & vbCrLf & "private sub cmb" & fld.name & "_Click()"
      body = body & vbCrLf & "  on error resume next"
      body = body & vbCrLf & "  Changing"
      body = body & vbCrLf & "end sub"

      SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = cmb" & fld.name & ".itemdata(cmb" & fld.name & ".listindex)"

      Dim ii As Long
      LoadFields = LoadFields & vbCrLf & "cmb" & fld.name & ".Clear"
      For ii = 1 To fld.FIELDTYPE.ENUMITEM.Count
        LoadFields = LoadFields & vbCrLf & "cmb" & fld.name & ".additem """ & fld.FIELDTYPE.ENUMITEM.item(ii).name & """"
        LoadFields = LoadFields & vbCrLf & "cmb" & fld.name & ".itemdata(cmb" & fld.name & ".newindex)= " & fld.FIELDTYPE.ENUMITEM.item(ii).NameValue
      Next
      
      LoadFields = LoadFields & vbCrLf & " For iii = 0 To cmb" & fld.name & ".ListCount-1"
      LoadFields = LoadFields & vbCrLf & "  If Item." & fld.name & " = cmb" & fld.name & ".ItemData(iii) Then"
      LoadFields = LoadFields & vbCrLf & "   cmb" & fld.name & ".ListIndex = iii"
      LoadFields = LoadFields & vbCrLf & "   Exit For"
      LoadFields = LoadFields & vbCrLf & "  End If"
      LoadFields = LoadFields & vbCrLf & " Next"

      

      pos = pos + 25 * Screen.TwipsPerPixelY
    End If


    Exit Sub
bye:
    MsgBox Err.Description
    Stop
    Resume
End Sub








