Attribute VB_Name = "FormControls"
        Option Explicit
        
        
  Public Sub GenerateControls(ByVal tid As String, fd As Object, fld As mtzmetamodel.FIELD, pos As Long, SaveFields As String, LoadFields As String, COLUMN As Long, MINPOS As Long, pname As String, body As String, decl As String, GenStyle As String, IsOK As String, Optional ReadOnly As Boolean = False, Optional ByVal mode As String = "")
         On Error GoTo bye
         
          Dim mproc As String, pp As Long, txt As String
        
          If pos > 420 * Screen.TwipsPerPixelY Then
           COLUMN = COLUMN + 1
           pos = MINPOS
          End If
          
          Dim ft As FIELDTYPE
          Set ft = fld.FIELDTYPE
          Dim fldAllowNull As Boolean
          
          fldAllowNull = IsFieldAllowNull(fld.parent.parent, fld.ID, mode)
          
          Dim ctl As ControlData
          
           If LCase(fld.FIELDTYPE.name) = "file" Then
        
             'Добавляем таймер и процедуру его обработки
             'VB.Timer
             Set ctl = fd.ControlData.Add()
             ctl.ProgID = "VB.Timer"
             Call AddProp(ctl, "NAME", fld.name)
             Call AddProp(ctl, "Interval", 500)
             Call AddProp(ctl, "Left", 100)
             Call AddProp(ctl, "Top", 100)
             Call AddProp(ctl, "Enabled", 0)
             'Переменные
             decl = decl & vbCrLf & "  private Path" & fld.name & " as string "
             decl = decl & vbCrLf & "  private Mod" & fld.name & " as Date "
             'Обработка таймера
             body = body & vbCrLf
             body = body & vbCrLf & "Private Sub " & fld.name & "_Timer()"
             body = body & vbCrLf & "    If Path" & fld.name & " <> """" Then"
             body = body & vbCrLf & "        'Try Lock file"
             body = body & vbCrLf & "        Dim ff As Integer"
             body = body & vbCrLf & "        ff = FreeFile"
             body = body & vbCrLf & "        On Error GoTo EndCheck"
             body = body & vbCrLf & "        Open Path" & fld.name & " For Binary Access Read Lock Read As ff"
             body = body & vbCrLf & "        Close ff"
             body = body & vbCrLf & "        'Файл свободен, проверяем блокировку"
             body = body & vbCrLf & "        Dim fso, f, s"
             body = body & vbCrLf & "        Set fso = CreateObject(""Scripting.FileSystemObject"")"
             body = body & vbCrLf & "        Set f = fso.GetFile(Path" & fld.name & ")"
             body = body & vbCrLf & "        Dim Modifyed As Date"
             body = body & vbCrLf & "        Modifyed = f.DateLastModified"
             body = body & vbCrLf & "        " & fld.name & ".Enabled = False"
             body = body & vbCrLf & "        If Mod" & fld.name & " <> Modifyed Then"
             body = body & vbCrLf & "            'Нада обновлять..."
             body = body & vbCrLf & "            If MsgBox(""Файл изменён, обновить?"", vbYesNo, """") = vbYes Then"
             body = body & vbCrLf & ""
             body = body & vbCrLf & "                item." & fld.name & " = FileToArray(Path" & fld.name & ")"
             body = body & vbCrLf & "                item." & fld.name & "_ext = GetFileExtension2(Path" & fld.name & ")"
             body = body & vbCrLf & "                Call f.Delete(True)"
             body = body & vbCrLf & "                Changing"
             body = body & vbCrLf & "            End If"
             body = body & vbCrLf & "        End If"
             body = body & vbCrLf & "        Exit Sub"
             body = body & vbCrLf & "EndCheck:"
             body = body & vbCrLf & "        'Файл заблокированн! Ждёмс..."
             body = body & vbCrLf & "    End If"
             body = body & vbCrLf & "End Sub"
             body = body & vbCrLf
           End If
 
            If LCase(fld.FIELDTYPE.name) <> "button" Then
               Set ctl = fd.ControlData.Add()
               ctl.ProgID = "VB.Label"
               Call AddProp(ctl, "BackStyle", 0)
               Call AddProp(ctl, "NAME", "lbl" & fld.name)
               Call AddProp(ctl, "Caption", NoLF(fld.Caption) & ":")
               Call AddProp(ctl, "Top", pos)
               Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
               Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Enabled", Not ReadOnly)
               
               If fldAllowNull Then
                 Call AddProp(ctl, "ForeColor", vbBlue)
               Else
                 Call AddProp(ctl, "ForeColor", vbRed)
               End If
               pos = pos + 22 * Screen.TwipsPerPixelY
            End If

          '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
          ' control labeled
          
          Dim FLDSCR As FIELDSRCDEF
          If (fld.FIELDTYPE.name = "ReferenceSQL") Then
              If (Not fld.FIELDSRCDEF Is Nothing) Then
                 If (Not fld.FIELDSRCDEF.item(1) Is Nothing) Then
                    Set FLDSCR = fld.FIELDSRCDEF.item(1)
                 End If
              End If
          End If
            
          If fld.FIELDTYPE.name = "MasterString" Then
            Set ctl = fd.ControlData.Add()
            
            If Trim(fld.TheMask) <> "" Then
              ctl.ProgID = "MSMask.MaskEdBox"
              Call AddProp(ctl, "Mask", fld.TheMask)
            Else
              ctl.ProgID = "VB.textbox"
            End If

            Call AddProp(ctl, "NAME", "txt" & fld.name)
            Call AddProp(ctl, "Text", "")
            Call AddProp(ctl, "Locked", False)
            Call AddProp(ctl, "Enabled", Not ReadOnly)
            Call AddProp(ctl, "Top", pos)
            Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
            Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
            Call AddProp(ctl, "Width", 170 * Screen.TwipsPerPixelY)
            Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
    
            body = body & vbCrLf & "Private Sub txt" & fld.name & "_Change()"
            body = body & vbCrLf & "  Changing"
            body = body & vbCrLf & "End Sub"
    
            Set ctl = fd.ControlData.Add()
            ctl.ProgID = "MTZ_PANEL.DropButton"
            Call AddProp(ctl, "NAME", "cmd" & fld.name)
            Call AddProp(ctl, "Caption", "")
            Call AddProp(ctl, "Tag", "refopen.ico")
            Call AddProp(ctl, "Top", pos)
            Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX + 170 * Screen.TwipsPerPixelX)
            Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
            Call AddProp(ctl, "Width", 30 * Screen.TwipsPerPixelY)
            Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
    
            If fld.theNameClass <> "" Then
              Dim theNameClass() As String
              theNameClass = Split(fld.theNameClass, "|")
              If UBound(theNameClass) = 1 Then
                body = body & vbCrLf & "private sub cmd" & fld.name & "_Click()"
                body = body & vbCrLf & "  dim name as string, obj as object"
                body = body & vbCrLf & "  set obj = createobject(""" & theNameClass(0) & """)"
                body = body & vbCrLf & "  if obj is nothing then exit sub"
                body = body & vbCrLf & "  txt" & fld.name & ".text = obj." & theNameClass(1) & "(item, txt" & fld.name & ".text)"
                body = body & vbCrLf & "  set obj = nothing"
                body = body & vbCrLf & "end sub"
              End If
            End If
    
            If Not ReadOnly Then
              SaveFields = SaveFields & vbCrLf & "  item." & fld.name & " = txt" & fld.name
            End If
            LoadFields = LoadFields & vbCrLf & "  on error resume next"
            LoadFields = LoadFields & vbCrLf & "  txt" & fld.name & " = item." & fld.name
            LoadFields = LoadFields & vbCrLf & "  LoadBtnPictures cmd" & fld.name & ",cmd" & fld.name & ".tag"
            LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".RemoveAllMenu"
            pos = pos + 25 * Screen.TwipsPerPixelY
          End If
          
          If GenStyle = "REFERENCE" Or fld.FIELDTYPE.name = "ReferenceSQL" Then
              Dim strScript As String
              Set ctl = fd.ControlData.Add()
              ctl.ProgID = "VB.textbox"
              'ctl.ProgID = "MSMask.MaskEdBox"
              'Call AddProp(ctl, "Mask", fld.TheMask)
              Call AddProp(ctl, "NAME", "txt" & fld.name)
              Call AddProp(ctl, "Text", "")
              Call AddProp(ctl, "Locked", True)
              Call AddProp(ctl, "Enabled", Not ReadOnly)
              Call AddProp(ctl, "Top", pos)
              Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
              Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "Width", 170 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
         
                
              Set ctl = fd.ControlData.Add()
              ctl.ProgID = "MTZ_PANEL.DropButton"
              Call AddProp(ctl, "NAME", "cmd" & fld.name)
              Call AddProp(ctl, "Caption", "")
              Call AddProp(ctl, "Tag", "refopen.ico")
              Call AddProp(ctl, "Top", pos)
              Call AddProp(ctl, "Enabled", Not ReadOnly)
              Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX + 170 * Screen.TwipsPerPixelX)
              Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "Width", 30 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
        
              pos = pos + 25 * Screen.TwipsPerPixelY
        
              body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
              body = body & vbCrLf & "  if  not (OnInit) then "
              
          If (fld.FIELDTYPE.name = "ReferenceSQL") Then
              
                decl = decl & vbCrLf & "  private mID" & fld.name & " as string "
              
                body = body & vbCrLf & "If (txt" & fld.name & ".Text = """") Then"
                body = body & vbCrLf & "  ' Убрать Brief и ID"
                body = body & vbCrLf & "  If (txt" & fld.name & ".Tag <> """") Then"
                body = body & vbCrLf & "    Dim XMLDoc As New DOMDocument"
                body = body & vbCrLf & "    Call XMLDoc.loadXML(txt" & fld.name & ".Tag)"
                body = body & vbCrLf & "    Dim Node As MSXML2.IXMLDOMNode"
                body = body & vbCrLf & "    For Each Node In XMLDoc.childNodes.item(0).childNodes"
                body = body & vbCrLf & "     If (Node.baseName = ""ID"") Then"
                body = body & vbCrLf & "       Node.Text = """""
                body = body & vbCrLf & "     End If"
                body = body & vbCrLf & "     If (Node.baseName = ""Brief"") Then"
                body = body & vbCrLf & "       Node.Text = """""
                body = body & vbCrLf & "     End If"
                body = body & vbCrLf & "    Next"
                body = body & vbCrLf & "    txt" & fld.name & ".Tag = XMLDoc.xml"
                body = body & vbCrLf & "  End If"
                body = body & vbCrLf & "End If"
        
                Dim Fields As FIELD_COL
                Dim chfld As FIELD
                Set Fields = fld.parent
                Dim k As Long
                Dim chfldFLDSCR As FIELDSRCDEF
                
              
             
                For k = 1 To Fields.Count
                  Set chfld = Fields.item(k)
                  If (chfld.name <> fld.name) Then
                    If (chfld.FIELDTYPE.name = "ReferenceSQL") Then
                      If (Not chfld.FIELDSRCDEF Is Nothing) Then
                        If (chfld.FIELDSRCDEF.Count > 0) Then
                          Set chfldFLDSCR = chfld.FIELDSRCDEF.item(1)
                        End If
                      End If
                      If (Not chfldFLDSCR Is Nothing) Then
                        If IsFieldPresent(fld.parent.parent, chfld.ID, mode) Then
                          body = body & vbCrLf & "If (Not OnInit OR True) Then ' Пока не понял - надо ли всегда или нет"
                          'body = body & vbCrLf & "    txt" & chfld.name & ".Tag = AddSQLRefIds(txt" & chfld.name & ".Tag, """ & fld.name & """, txt" & fld.name & ".Tag)"
                          If (chfldFLDSCR.DontShowDialog = YesNo_Da) Then
                            body = body & vbCrLf & "    Call cmd" & chfld.name & "_Click()"
                          Else
                            body = body & vbCrLf & "    if (Instr(txt" & chfld.name & ".Tag, ""%" & fld.name & "ID%"") > 0) then"
                            body = body & vbCrLf & "    'Call cmd" & chfld.name & "_Click()"
                            body = body & vbCrLf & "    end if"
                          End If
                          body = body & vbCrLf & "    end if"
                        End If
                      End If
                    End If
                  End If
                Next
                
              End If
        
              body = body & vbCrLf & "  Changing"
              body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
              body = body & vbCrLf & "  end if "
              body = body & vbCrLf & "end sub"
        
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK = txt" & fld.name & ".Tag<>"""""
              End If
              
              
              If (fld.FIELDTYPE.name = "ReferenceSQL") Then
                If (Not FLDSCR Is Nothing) Then
                  LoadFields = LoadFields & vbCrLf & "txt" & fld.name & ".Text ="""""
                  LoadFields = LoadFields & vbCrLf & "txt" & fld.name & ".Tag ="""""
                  LoadFields = LoadFields & vbCrLf & "mID" & fld.name & " ="""""
 
                  LoadFields = LoadFields & vbCrLf & "' Разобрать XML"
                  LoadFields = LoadFields & vbCrLf & "Dim XMLDoc" & fld.name & " As New DOMDocument"
                  LoadFields = LoadFields & vbCrLf & "On Error Resume Next"
                  LoadFields = LoadFields & vbCrLf & "If (item." & fld.name & " <> """") Then"
                  LoadFields = LoadFields & vbCrLf & "  Call XMLDoc" & fld.name & ".loadXML(item." & fld.name & ")"
                  LoadFields = LoadFields & vbCrLf & "  If (Err.Number = 0 And XMLDoc" & fld.name & ".parseError.errorCode = 0) Then"
                  LoadFields = LoadFields & vbCrLf & "    Dim node" & fld.name & " As MSXML2.IXMLDOMNode"
                  LoadFields = LoadFields & vbCrLf & "    txt" & fld.name & ".Tag = item." & fld.name
                  LoadFields = LoadFields & vbCrLf & "    For Each node" & fld.name & " In XMLDoc" & fld.name & ".childNodes.item(0).childNodes"
                  LoadFields = LoadFields & vbCrLf & "      If (node" & fld.name & ".baseName = ""Brief"") Then"
                  LoadFields = LoadFields & vbCrLf & "       txt" & fld.name & ".Text = node" & fld.name & ".Text"
                  LoadFields = LoadFields & vbCrLf & "       Exit For "
                  LoadFields = LoadFields & vbCrLf & "      End If"
                  LoadFields = LoadFields & vbCrLf & "    Next"
                  LoadFields = LoadFields & vbCrLf & "  Else"
                  
                  LoadFields = LoadFields & vbCrLf & "    ' Попытка подобрать по ID"
                  LoadFields = LoadFields & vbCrLf & "    Dim newID" & fld.name & " As String"
                  LoadFields = LoadFields & vbCrLf & "    newID" & fld.name & " = item." & fld.name
                  LoadFields = LoadFields & vbCrLf & "    Dim XML" & fld.name & "ID As String"
                  LoadFields = LoadFields & vbCrLf & "    XML" & fld.name & "ID = ""<SQLData>"""
                  LoadFields = LoadFields & vbCrLf & "    XML" & fld.name & "ID = XML" & fld.name & "ID & ""<connectionstring>" & FLDSCR.ConnectionString & "</connectionstring>"""
                  LoadFields = LoadFields & vbCrLf & "    XML" & fld.name & "ID = XML" & fld.name & "ID & ""<connectionprovider>" & FLDSCR.Provider & "</connectionprovider>"""
                  LoadFields = LoadFields & vbCrLf & "    XML" & fld.name & "ID = XML" & fld.name & "ID & ""<query>" & FLDSCR.DataSource & "</query>"""
                  LoadFields = LoadFields & vbCrLf & "    XML" & fld.name & "ID = XML" & fld.name & "ID & ""<IDFieldName>" & FLDSCR.IDField & "</IDFieldName>"""
                  LoadFields = LoadFields & vbCrLf & "    XML" & fld.name & "ID = XML" & fld.name & "ID & ""<ID>"" & " & " newID" & fld.name & " & ""</ID>"""
                  LoadFields = LoadFields & vbCrLf & "    XML" & fld.name & "ID = XML" & fld.name & "ID & ""<BriefFields>" & FLDSCR.BriefString & "</BriefFields>"""
                  
                  For k = 1 To Fields.Count
                    Set chfld = Fields.item(k)
                    If (chfld.name <> fld.name) Then
                      If (chfld.FIELDTYPE.name = "ReferenceSQL") Then
                        If IsFieldPresent(fld.parent.parent, chfld.ID, mode) Then
                          If (Not chfld.FIELDSRCDEF Is Nothing) Then
                            If (chfld.FIELDSRCDEF.Count > 0) Then
                              Set chfldFLDSCR = chfld.FIELDSRCDEF.item(1)
                            End If
                          End If
                          If (Not chfldFLDSCR Is Nothing) Then
                              LoadFields = LoadFields & vbCrLf & "    XML" & fld.name & "ID = XML" & fld.name & "ID & ""<" & chfld.name & "ID>"" & mID" & chfld.name & " & ""</" & chfld.name & "ID>"""
                          End If
                        End If
                      End If
                    End If
                  Next
                  
                  LoadFields = LoadFields & vbCrLf & "    XML" & fld.name & "ID = XML" & fld.name & "ID & ""</SQLData>"""
                  LoadFields = LoadFields & vbCrLf & "    Dim pars" & fld.name & " As New NamedValues"
                  LoadFields = LoadFields & vbCrLf & "    Dim res" & fld.name & " As NamedValues"
                  LoadFields = LoadFields & vbCrLf & "    Call pars" & fld.name & ".Add(""xml"", XML" & fld.name & "ID)"
                  LoadFields = LoadFields & vbCrLf & "    Set res" & fld.name & " = item.Application.Manager.GetSQLDataDialog(pars" & fld.name & ")"
                  LoadFields = LoadFields & vbCrLf & "    If (Not res" & fld.name & " Is Nothing) Then"
                  LoadFields = LoadFields & vbCrLf & "      Dim resStr" & fld.name & " As String"
                  LoadFields = LoadFields & vbCrLf & "      resStr" & fld.name & " = res" & fld.name & ".item(""RESULT"").value"
                  LoadFields = LoadFields & vbCrLf & "      If (resStr" & fld.name & " = ""OK"") Then"
                  LoadFields = LoadFields & vbCrLf & "        txt" & fld.name & ".Tag = Replace(res" & fld.name & ".item(""xml"").value, ""%ID%"", "" 1=1 "")"
                  LoadFields = LoadFields & vbCrLf & "        If (txt" & fld.name & ".Text <> res" & fld.name & ".item(""brief"").value) Then"
                  LoadFields = LoadFields & vbCrLf & "          mID" & fld.name & " = newID" & fld.name & ""
                  LoadFields = LoadFields & vbCrLf & "          txt" & fld.name & ".Text = res" & fld.name & ".item(""brief"").value"
                  LoadFields = LoadFields & vbCrLf & "        End If"
                  LoadFields = LoadFields & vbCrLf & "      End If"
                  LoadFields = LoadFields & vbCrLf & "    Else"
                  LoadFields = LoadFields & vbCrLf & "      item." & fld.name & " = vbNullString"
                  LoadFields = LoadFields & vbCrLf & "    End If"
                  LoadFields = LoadFields & vbCrLf & "  End If"
                  LoadFields = LoadFields & vbCrLf & "Else"
                  LoadFields = LoadFields & vbCrLf & "  Dim XML" & fld.name & " As String"
                  LoadFields = LoadFields & vbCrLf & "  XML" & fld.name & " = ""<SQLData>"""
                  LoadFields = LoadFields & vbCrLf & "  XML" & fld.name & " = XML" & fld.name & " & ""<connectionstring>" & FLDSCR.ConnectionString & "</connectionstring>"""
                  LoadFields = LoadFields & vbCrLf & "  XML" & fld.name & " = XML" & fld.name & " & ""<connectionprovider>" & FLDSCR.Provider & "</connectionprovider>"""
                  LoadFields = LoadFields & vbCrLf & "  XML" & fld.name & " = XML" & fld.name & " & ""<query>" & FLDSCR.DataSource & "</query>"""
                  LoadFields = LoadFields & vbCrLf & "  XML" & fld.name & " = XML" & fld.name & " & ""<IDFieldName>" & FLDSCR.IDField & "</IDFieldName>"""
                  LoadFields = LoadFields & vbCrLf & "  XML" & fld.name & " = XML" & fld.name & " & ""<BriefFields>" & FLDSCR.BriefString & "</BriefFields>"""
                  For k = 1 To Fields.Count
                    Set chfld = Fields.item(k)
                    If (chfld.name <> fld.name) Then
                      If (chfld.FIELDTYPE.name = "ReferenceSQL") Then
                        If IsFieldPresent(fld.parent.parent, chfld.ID, mode) Then
                          If (Not chfld.FIELDSRCDEF Is Nothing) Then
                            If (chfld.FIELDSRCDEF.Count > 0) Then
                              Set chfldFLDSCR = chfld.FIELDSRCDEF.item(1)
                            End If
                          End If
                          If (Not chfldFLDSCR Is Nothing) Then
                              If (chfld.name <> fld.name) Then
                                LoadFields = LoadFields & vbCrLf & "    XML" & fld.name & " = XML" & fld.name & " & ""<" & chfld.name & "ID>"" & mID" & chfld.name & " & ""</" & chfld.name & "ID>"""
                              End If
                          End If
                        End If
                      End If
                    End If
                  Next
                  LoadFields = LoadFields & vbCrLf & "  XML" & fld.name & " = XML" & fld.name & " & ""</SQLData>"""
                  LoadFields = LoadFields & vbCrLf & "  txt" & fld.name & ".Tag = XML" & fld.name
                  If (FLDSCR.DontShowDialog = YesNo_Da) Then
                    LoadFields = LoadFields & vbCrLf & "  Call cmd" & fld.name & "_Click()"
                  End If
                  LoadFields = LoadFields & vbCrLf & "End if "
                  LoadFields = LoadFields & vbCrLf & "On Error GoTo 0"
                End If
             Else
                LoadFields = LoadFields & vbCrLf & "If Not item." & fld.name & " Is Nothing Then"
                LoadFields = LoadFields & vbCrLf & "  txt" & fld.name & ".Tag = item." & fld.name & ".id"
                LoadFields = LoadFields & vbCrLf & "  txt" & fld.name & " = item." & fld.name & ".brief"
                LoadFields = LoadFields & vbCrLf & "else"
                LoadFields = LoadFields & vbCrLf & "  txt" & fld.name & ".Tag = """" "
                LoadFields = LoadFields & vbCrLf & "  txt" & fld.name & " = """" "
                LoadFields = LoadFields & vbCrLf & "End If"
             End If
              
              LoadFields = LoadFields & vbCrLf & " LoadBtnPictures cmd" & fld.name & ",cmd" & fld.name & ".tag"
              LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".RemoveAllMenu"
              
              Dim bClearMenu As Boolean
              bClearMenu = False
              If (fld.FIELDTYPE.name = "ReferenceSQL") Then
                If (Not FLDSCR Is Nothing) Then
                  If (FLDSCR.DontShowDialog = YesNo_Da) Then
                    bClearMenu = False
                    LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".Visible = false "
                  Else
                    If fldAllowNull Then
                      bClearMenu = True
                    End If
                  End If
                End If
              Else
'                If fldAllowNUll  Then
                  bClearMenu = True
'                End If
             End If
              If (bClearMenu) Then
                LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".AddMenu ""Очистить"" "
              End If
          
                    
              If fld.ReferenceType = ReferenceType_Na_istocnik_dannih Then
                SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name & ".Tag"
                body = body & vbCrLf & "private sub cmd" & fld.name & "_Click()"
                body = body & vbCrLf & "  on error resume next"
                
                ' ++++++++++++++++-_--------------------------+++++++++++++++++++++++++++++++++++++++------------------------
                body = body & vbCrLf & "  If (Not OnInit) Then"
                body = body & vbCrLf & "    Dim iFrom As Long"
                body = body & vbCrLf & "    Dim iTo As Long"
                body = body & vbCrLf & "    iFrom = InStr(1, txt" & fld.name & ".Tag, ""<ID>"")"
                body = body & vbCrLf & "    If (iFrom > 0) Then"
 
                body = body & vbCrLf & "      iTo = InStr(iFrom, txt" & fld.name & ".Tag, ""</ID>"")"
                body = body & vbCrLf & "      mID" & fld.name & " = Mid(txt" & fld.name & ".Tag, iFrom + 4, iTo-iFrom-5)"
                body = body & vbCrLf & "    End If"
                body = body & vbCrLf & "    Dim MTZShell As Object"
                body = body & vbCrLf & "    Set MTZShell = item.Application.Manager.GetCustomObjects(""MTZShell"")"
                body = body & vbCrLf & "    If (Not MTZShell Is Nothing) Then"
                body = body & vbCrLf & "      Err.Clear"
                body = body & vbCrLf & "      Dim Processed As Variant"
                body = body & vbCrLf & "      Processed = False"
                body = body & vbCrLf & "      Call MTZShell.FireEvent(""" & fld.name & ";"" & mID" & fld.name & ", Processed)"
                body = body & vbCrLf & "      If (Err.Number = 0 And Processed <> vbNullString And Processed <> false) Then"
                body = body & vbCrLf & "        Exit Sub"
                body = body & vbCrLf & "      End If"
                body = body & vbCrLf & "    End If"
                body = body & vbCrLf & "    txt" & fld.name & ".Tag = Replace(txt" & fld.name & ".Tag, ""<ID>"",""<IDOld>"") "
                body = body & vbCrLf & "    txt" & fld.name & ".Tag = Replace(txt" & fld.name & ".Tag, ""</ID>"",""</IDOld>"") "
                body = body & vbCrLf & "  End If"
        
                
                body = body & vbCrLf & "  Dim pars As New NamedValues"
                body = body & vbCrLf & "  Dim res As NamedValues"
                body = body & vbCrLf & "  If (txt" & fld.name & ".Tag = """") Then"
                body = body & vbCrLf & "    ' call MsgBox(""Нет данных для запроса"")"
                body = body & vbCrLf & "  Else"
                If (Not FLDSCR Is Nothing) Then
                  If (FLDSCR.DontShowDialog = YesNo_Da) Then
                    body = body & vbCrLf & "    Call pars.Add(""permanent"", ""true"")"
                  End If
                  If GetScript2(fld.DINAMICFILTERSCRIPT, tid) <> "" Then
                    body = body & vbCrLf & "    Call pars.Add(""filter"", (" & GetScript2(fld.DINAMICFILTERSCRIPT, tid) & "))"
                  End If
                End If
                
                
                For k = 1 To Fields.Count
                  Set chfld = Fields.item(k)
                  If (chfld.name <> fld.name) Then
                    If (chfld.FIELDTYPE.name = "ReferenceSQL") Then
                      If IsFieldPresent(fld.parent.parent, chfld.ID, mode) Then
                        If (Not chfld.FIELDSRCDEF Is Nothing) Then
                          If (chfld.FIELDSRCDEF.Count > 0) Then
                            Set chfldFLDSCR = chfld.FIELDSRCDEF.item(1)
                          End If
                        End If
                        If (Not chfldFLDSCR Is Nothing) Then
                            body = body & vbCrLf & "    txt" & fld.name & ".Tag = AddSQLRefIds(txt" & fld.name & ".Tag, """ & chfld.name & """, txt" & chfld.name & ".Tag)"
                        End If
                      End If
                    End If
                  End If
                Next
                
                body = body & vbCrLf & "    txt" & fld.name & ".Tag = Replace(txt" & fld.name & ".Tag, ""%ID%"", "" 1=1 "")"
                body = body & vbCrLf & "    Call pars.Add(""xml"", txt" & fld.name & ".Tag)"
                body = body & vbCrLf & "  End If"
                body = body & vbCrLf & "  Set res = item.Application.Manager.GetSQLDataDialog(pars)"
                body = body & vbCrLf & "  If (Not res Is Nothing) Then"
                body = body & vbCrLf & "    Dim resStr As String"
                body = body & vbCrLf & "    resStr = res.item(""RESULT"").value"
                body = body & vbCrLf & "    If (resStr = ""OK"") Then"
                body = body & vbCrLf & "      txt" & fld.name & ".Tag = res.item(""xml"").value"
                body = body & vbCrLf & "      If (txt" & fld.name & ".Text <> res.item(""brief"").value) Then"
                body = body & vbCrLf & "        txt" & fld.name & ".Text = res.item(""brief"").value"
                body = body & vbCrLf & "        mID" & fld.name & " = res.item(""ID"").value"
                body = body & vbCrLf & "        Call txt" & fld.name & "_Change"
                body = body & vbCrLf & "      End If"
                body = body & vbCrLf & "    Else"
                body = body & vbCrLf & "      Dim errStr As String"
                body = body & vbCrLf & "      errStr = res.item(""ErrorDescription"").value"
                body = body & vbCrLf & "      If (errStr <> vbNullString) Then"
                body = body & vbCrLf & "       Call MsgBox(""Ошибка исполнения: "" & errStr, vbOKOnly + vbCritical)"
                body = body & vbCrLf & "     End If"
                body = body & vbCrLf & "    End If"
                body = body & vbCrLf & "  End If"
                ' ++++++++++++++++-_--------------------------+++++++++++++++++++++++++++++++++++++++------------------------
                body = body & vbCrLf & "end sub"
            End If
              
            If fld.ReferenceType = ReferenceType_Na_ob_ekt_ Then
                If Not ReadOnly Then
                   'LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".AddMenu ""Очистить"" "
                  If Not fld.CreateRefOnly Then
                    LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".AddMenu ""Создать"" "
                    LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".AddMenu ""Выбрать"" "
                  End If
                End If
                LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".AddMenu ""Открыть"" "
                
                If Not ReadOnly Then
                  SaveFields = SaveFields & vbCrLf & "If txt" & fld.name & ".Tag <> """" Then"
                  SaveFields = SaveFields & vbCrLf & "  Set item." & fld.name & " = Item.Application.Manager.GetInstanceObject(txt" & fld.name & ".Tag)"
                  SaveFields = SaveFields & vbCrLf & "Else"
                  SaveFields = SaveFields & vbCrLf & "  Set item." & fld.name & " = Nothing"
                  SaveFields = SaveFields & vbCrLf & "End If"
                End If
                
                body = body & vbCrLf & "private sub cmd" & fld.name & "_CLick()"
                body = body & vbCrLf & "  on error resume next"
                body = body & vbCrLf & "     If txt" & fld.name & ".Tag ="""" then"
                
                If Not ReadOnly Then
                  If Not fld.CreateRefOnly Then
                    body = body & vbCrLf & "       cmd" & fld.name & "_MenuClick ""Выбрать"" "
                  Else
                    body = body & vbCrLf & "       cmd" & fld.name & "_MenuClick ""Создать"" "
                  End If
                End If
                
                body = body & vbCrLf & "     Else"
                body = body & vbCrLf & "       cmd" & fld.name & "_MenuClick ""Открыть"" "
                body = body & vbCrLf & "     End If"
                body = body & vbCrLf & "end sub"
                
                body = body & vbCrLf & "private sub cmd" & fld.name & "_MenuClick(ByVal sCaption As String)"
                body = body & vbCrLf & "  on error resume next"
                body = body & vbCrLf & "    dim inst as object"
                body = body & vbCrLf & "    dim obj as object"
                body = body & vbCrLf & "    dim Gobj as object"
                body = body & vbCrLf & "    Dim OK As boolean"
                body = body & vbCrLf & "    Dim id As string"
                body = body & vbCrLf & "    Dim brief As string"
                
                If Not ReadOnly Then
                  body = body & vbCrLf & "  if sCaption =""Очистить"" then"
                
                  If fld.CreateRefOnly = Boolean_Da Then
                    body = body & vbCrLf & "       if txt" & fld.name & ".Tag <> """" then"
                    body = body & vbCrLf & "         item.Application.MTZSession.SetOwner txt" & fld.name & ".Tag, """", item.ID"
                    body = body & vbCrLf & "         item.Application.Manager.DeleteInstance txt" & fld.name & ".Tag"
                    body = body & vbCrLf & "       end if"
                  End If
                  
                
                  body = body & vbCrLf & "          txt" & fld.name & ".Tag = """""
                  body = body & vbCrLf & "          txt" & fld.name & " = """""
                  body = body & vbCrLf & "  end if"
                End If ' not ReadOnly
                
                body = body & vbCrLf & "  if sCaption =""Открыть"" then"
                body = body & vbCrLf & "    if txt" & fld.name & ".tag ="""" then exit sub"
                body = body & vbCrLf & "    set inst  = item.Application.Manager.GetInstanceObject(txt" & fld.name & ".tag)"
                body = body & vbCrLf & "    if inst is nothing then exit sub"
                body = body & vbCrLf & "    set obj = item.Application.Manager.GetInstanceGUI(txt" & fld.name & ".tag)"
                
               'PMOD'body = body & vbCrLf & "    obj.show """", inst,true"
               If SinglePanelSettings.AllowNonModalShow Then
                   body = body & vbCrLf & "    obj.show """", inst,false"
               Else
                     body = body & vbCrLf & "    obj.show """", inst,true"
               End If
      
                body = body & vbCrLf & "    set obj =nothing"
                body = body & vbCrLf & "    set inst =nothing"
                body = body & vbCrLf & "  end if"
                
                If Not ReadOnly Then
                
                  strScript = GetDynamicFieldFilter(fld.DINAMICFILTERSCRIPT, LastTID)
            
                  body = body & vbCrLf & "  if sCaption =""Выбрать"" then"
                  If fld.RefToType Is Nothing Then
                    If strScript <> "" Then
                      body = body & vbCrLf & "        OK=Item.Application.Manager.GetObjectListDialogEx(id,brief,"""",""""," & strScript & ")"
                    Else
                      body = body & vbCrLf & "        OK=Item.Application.Manager.GetObjectListDialogEx(id,brief,"""","""")"
                    End If
                  Else
                    If strScript <> "" Then
                      body = body & vbCrLf & "        OK=Item.Application.Manager.GetObjectListDialogEx(id,brief,"""",""" & fld.RefToType.name & """," & strScript & ")"
                    Else
                      body = body & vbCrLf & "        OK=Item.Application.Manager.GetObjectListDialogEx(id,brief,"""",""" & fld.RefToType.name & """)"
                    End If
                  End If
                  
                  body = body & vbCrLf & "        If OK Then"
                  body = body & vbCrLf & "          txt" & fld.name & ".Tag = left(ID,38)"
                  body = body & vbCrLf & "          txt" & fld.name & " = brief"
                  body = body & vbCrLf & "        End If"
                  body = body & vbCrLf & "  end if"
               
               
                  body = body & vbCrLf & "  if sCaption =""Создать"" then"
                  body = body & vbCrLf & "     on error resume next"
                  If fld.RefToType Is Nothing Then
                    body = body & vbCrLf & "        Set obj = Item.Application.Manager.GetNewObject()"
                  Else
                  
                        body = body & vbCrLf & "        Dim ook As Boolean"
                        body = body & vbCrLf & "        Dim Cancel As Boolean"
                        
                        body = body & vbCrLf & "        Brief = """ & fld.RefToType.name & """ & Now"
                        body = body & vbCrLf & "        ook = FindObject(Item.Application.Manager, """ & fld.RefToType.name & """, id,brief,cancel)"
                        body = body & vbCrLf & "        If Cancel Then"
                        body = body & vbCrLf & "          Exit sub"
                        body = body & vbCrLf & "        End If"
                        body = body & vbCrLf & "        If  ook Then"
                        body = body & vbCrLf & "              txt" & fld.name & ".Tag = ID"
                        body = body & vbCrLf & "              txt" & fld.name & " = brief"
                        body = body & vbCrLf & "              exit sub"
                        body = body & vbCrLf & "        End If"
                        
                        body = body & vbCrLf & "        If Not ook Then"
                        body = body & vbCrLf & "          ID = CreateGUID2()"
                        body = body & vbCrLf & "          ook = Item.Application.Manager.NewInstance(ID, """ & fld.RefToType.name & """, Brief)"
                        body = body & vbCrLf & "        End If"
                        
                        
                        
                      '  If ook Then
                  
                  
'                    body = body & vbCrLf & "        id =Createguid2"
'                    body = body & vbCrLf & "        Item.Application.Manager.NewInstance id,""" & fld.RefToType.name & """,""" & NoLF(fld.RefToType.the_comment) & " "" & Now "
                    body = body & vbCrLf & "        Set obj = Item.Application.Manager.GetInstanceObject(id)"
                    
                  End If
                  
                  body = body & vbCrLf & "        If not obj is nothing Then"
                  If fld.CreateRefOnly Then
                    body = body & vbCrLf & "          item.Application.MTZSession.SetOwner obj.ID, item.PartName, item.ID"
                  End If
                  body = body & vbCrLf & "          SET GOBJ = Item.Application.Manager.GetInstanceGUI(obj.id)"
                  
            
                  If SinglePanelSettings.AllowNonModalShow Then
                    body = body & vbCrLf & "          GOBJ.Show """",obj,false"
                  Else
                        body = body & vbCrLf & "          GOBJ.Show """",obj,true"
                  End If
                  
                  body = body & vbCrLf & "          Set obj = Item.Application.Manager.GetInstanceObject(obj.id)"
                  body = body & vbCrLf & "          If (Not Obj Is Nothing) Then"
                  body = body & vbCrLf & "              txt" & fld.name & ".Tag = obj.ID"
                  body = body & vbCrLf & "              txt" & fld.name & " = obj.brief"
                  body = body & vbCrLf & "          else"
                  body = body & vbCrLf & "              txt" & fld.name & ".Tag = """""
                  body = body & vbCrLf & "              txt" & fld.name & " = """""
                  body = body & vbCrLf & "          end if"
                  
                  body = body & vbCrLf & "          set obj = nothing"
                  body = body & vbCrLf & "          set Gobj = nothing"
                  body = body & vbCrLf & "        End If"
                  body = body & vbCrLf & "  end if"
                End If ' not readonly
                
                body = body & vbCrLf & "End sub"
              End If ' Ref to object
        
              If fld.ReferenceType = ReferenceType_Na_stroku_razdela Then
              
                If Not ReadOnly Then
                  SaveFields = SaveFields & vbCrLf & "If txt" & fld.name & ".Tag <> """" Then"
                  SaveFields = SaveFields & vbCrLf & "  Set item." & fld.name & " = Item.Application.FindRowObject(""" & fld.RefToPart.name & """,txt" & fld.name & ".Tag)"
                  SaveFields = SaveFields & vbCrLf & "Else"
                  SaveFields = SaveFields & vbCrLf & "  Set item." & fld.name & " = Nothing"
                  SaveFields = SaveFields & vbCrLf & "End If"
                End If ' not readonly
              
                body = body & vbCrLf & "private sub cmd" & fld.name & "_CLick()"
                body = body & vbCrLf & "  on error resume next"
                
                If Not ReadOnly Then
                  body = body & vbCrLf & "        Dim id As String, brief As String"
                  
                  
                  strScript = GetDynamicFieldFilter(fld.DINAMICFILTERSCRIPT, LastTID)
                  If strScript <> "" Then
                    If fld.InternalReference = Boolean_Da Then
                              body = body & vbCrLf & "        If item.Application.Manager.GetReferenceDialogEx2(""" & fld.RefToPart.name & """, id, brief,item.application.ID,, " + strScript + ") Then"
                    Else
                              body = body & vbCrLf & "        If item.Application.Manager.GetReferenceDialogEx2(""" & fld.RefToPart.name & """, id, brief,,," + strScript + ") Then"
                    End If
                  Else
                    If fld.InternalReference = Boolean_Da Then
                              body = body & vbCrLf & "        If item.Application.Manager.GetReferenceDialogEx2(""" & fld.RefToPart.name & """, id, brief,item.application.ID) Then"
                    Else
                              body = body & vbCrLf & "        If item.Application.Manager.GetReferenceDialogEx2(""" & fld.RefToPart.name & """, id, brief) Then"
                    End If
                  End If
                            
                  body = body & vbCrLf & "          txt" & fld.name & ".Tag = Left(id, 38)"
                  body = body & vbCrLf & "          txt" & fld.name & " = brief"
                  body = body & vbCrLf & "        End If"
                  
                Else
                  body = body & vbCrLf & "        MsgBox ""Режим не предусматривает редактирования"",vbInformation"
                End If ' not readonly
                body = body & vbCrLf & "end sub"
                
                
                body = body & vbCrLf & "private sub cmd" & fld.name & "_MenuClick(ByVal sCaption As String)"
                If Not ReadOnly Then
                  body = body & vbCrLf & "          txt" & fld.name & ".Tag = """""
                  body = body & vbCrLf & "          txt" & fld.name & " = """""
                Else
                  body = body & vbCrLf & "        MsgBox ""Режим не предусматривает редактирования"",vbInformation"
                End If ' not readonly
                body = body & vbCrLf & "End sub"
        
                
              End If ' ref to row
              
            End If 'REFERENCE
        
            If ft.TypeStyle = TypeStyle_Element_oformleniy Then
              If LCase(fld.FIELDTYPE.name) = "button" Then
                Set ctl = fd.ControlData.Add()
                ctl.ProgID = "VB.CommandButton"
                Call AddProp(ctl, "NAME", "btn" & fld.name)
                Call AddProp(ctl, "Caption", fld.Caption)
                Call AddProp(ctl, "Top", pos)
                Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
                Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
                Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
                Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
                Call AddProp(ctl, "Locked", ReadOnly)
                Call AddProp(ctl, "Enabled", Not ReadOnly)
                Call AddProp(ctl, "UseMaskColor", -1)
                Call AddProp(ctl, "Style", 1)
                pos = pos + 25 * Screen.TwipsPerPixelY
                body = body & vbCrLf & "private sub btn" & fld.name & "_Click()"
                body = body & vbCrLf & "  ' MsgBox(""btn" & fld.name & " Clicked"")"
                body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
                body = body & vbCrLf & "end sub"
                Call AddProp(ctl, "Tag", fld.name & ".ico")
 
                If ReadOnly Then
                    Call AddProp(ctl, "Tag", fld.name & "Disabled" & ".ico")
                    'Call AddProp(ctl, "Tag", fld.name & "Disabled" & ".bmp")
                Else
                    Call AddProp(ctl, "Tag", fld.name & "Enabled" & ".ico")
                    'Call AddProp(ctl, "Tag", fld.name & "Enabled" & ".bmp")
                End If
                 LoadFields = LoadFields & vbCrLf & "LoadBtnPictures btn" & fld.name & ", btn" & fld.name & ".Tag"
          '      If (LCase(Trim(fld.name)) = "buttonok") Then
          '        LoadFields = LoadFields & vbCrLf & "  MsgBox(" & fld.name & " & "" прячет кнопку Save"")"
          '      End If
          '      If (LCase(Trim(fld.name)) = "buttoncancel") Then
          '        LoadFields = LoadFields & vbCrLf & "  MsgBox(" & fld.name & " & "" прячет кнопку Отмена"")"
          '      End If
          '      If Not fldAllowNUll  Then
          '        IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK =IsSet(txt" & fld.name & ".text)"
          '      End If
                    End If

              If LCase(fld.FIELDTYPE.name) = "frame" Then
                Set ctl = fd.ControlData.Add()
                ctl.ProgID = "VB.Frame"
                Call AddProp(ctl, "NAME", "fr" & fld.name)
    
                LoadFields = LoadFields & vbCrLf & "fr" & fld.name & ".zorder 1"
                pos = pos + 25 * Screen.TwipsPerPixelY
              End If
            End If
            
            If (GenStyle = "TEXT" Or GenStyle = "PASSWORD" Or GenStyle = "GUID") And fld.FIELDTYPE.name <> "ReferenceSQL" Then
              Set ctl = fd.ControlData.Add()
              If Trim(fld.TheMask) <> "" Then
                ctl.ProgID = "MSMask.MaskEdBox"
                Call AddProp(ctl, "Mask", fld.TheMask)
              Else
                ctl.ProgID = "VB.textbox"
              End If
              Call AddProp(ctl, "NAME", "txt" & fld.name)
              Call AddProp(ctl, "Text", "")
              Call AddProp(ctl, "Top", pos)
              Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
              Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "MaxLength", fld.DataSize)
              Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
              Call AddProp(ctl, "Locked", ReadOnly)
              Call AddProp(ctl, "Enabled", Not ReadOnly)
              
              If GenStyle = "PASSWORD" Then
                Call AddProp(ctl, "PasswordChar", "*")
              End If
              pos = pos + 25 * Screen.TwipsPerPixelY
              body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
              body = body & vbCrLf & "  Changing"
              body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
              body = body & vbCrLf & "end sub"
              If Not ReadOnly Then
                SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name
              End If
              
              LoadFields = LoadFields & vbCrLf & "  on error resume next"
              LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name
              
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK =IsSet(txt" & fld.name & ".text)"
              End If
              
              
            End If ' TEXT PASSWORD GUID
        
            ' todo
            If GenStyle = "EMAIL" Then
              Set ctl = fd.ControlData.Add()
              If Trim(fld.TheMask) <> "" Then
                ctl.ProgID = "MSMask.MaskEdBox"
                Call AddProp(ctl, "Mask", fld.TheMask)
              Else
                ctl.ProgID = "VB.textbox"
              End If
              Call AddProp(ctl, "NAME", "txt" & fld.name)
              Call AddProp(ctl, "Text", "")
              Call AddProp(ctl, "Top", pos)
              Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
              Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "Width", 170 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "MaxLength", fld.DataSize)
              Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
              Call AddProp(ctl, "Locked", ReadOnly)
              Call AddProp(ctl, "Enabled", Not ReadOnly)
              
              Set ctl = fd.ControlData.Add()
              ctl.ProgID = "MTZ_PANEL.DropButton"
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
              body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
              body = body & vbCrLf & "end sub"
              
              body = body & vbCrLf & "private sub cmd" & fld.name & "_Click()"
              'body = body & vbCrLf & "  on error resume next"
              'body = body & vbCrLf & "        shell ""start mailto:"" &   txt" & fld.name
              
              body = body & vbCrLf & "  on error resume next"
              body = body & vbCrLf & "  Dim s As String"
              body = body & vbCrLf & "  s = s & ""mailto:"" & txt" & fld.name & ".text "
              body = body & vbCrLf & "  OpenDocument 0, s"
              
              body = body & vbCrLf & "end sub"
              
              If Not ReadOnly Then
                SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name
              End If
              
              LoadFields = LoadFields & vbCrLf & "  on error resume next"
              LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name
              LoadFields = LoadFields & vbCrLf & " LoadBtnPictures cmd" & fld.name & ",cmd" & fld.name & ".tag"
              LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".RemoveAllMenu"
              
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK =IsSet(txt" & fld.name & ".text)"
              End If
              
            End If 'EMAIL
        
        
            ' todo
            If GenStyle = "URL" Then
              Set ctl = fd.ControlData.Add()
              If Trim(fld.TheMask) <> "" Then
                ctl.ProgID = "MSMask.MaskEdBox"
                Call AddProp(ctl, "Mask", fld.TheMask)
              Else
                ctl.ProgID = "VB.textbox"
              End If
              Call AddProp(ctl, "NAME", "txt" & fld.name)
              Call AddProp(ctl, "Text", "")
              Call AddProp(ctl, "Top", pos)
              Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
              Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "Width", 170 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "MaxLength", fld.DataSize)
              Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
              Call AddProp(ctl, "Locked", ReadOnly)
              Call AddProp(ctl, "Enabled", Not ReadOnly)
              
              Set ctl = fd.ControlData.Add()
              ctl.ProgID = "MTZ_PANEL.DropButton"
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
              body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
              body = body & vbCrLf & "end sub"
        
              body = body & vbCrLf & "private sub cmd" & fld.name & "_Click()"
              body = body & vbCrLf & "  on error resume next"
              body = body & vbCrLf & "  Dim s As String"
              body = body & vbCrLf & "  s = s & ""http:\\"" & txt" & fld.name & ".text "
              body = body & vbCrLf & "  OpenDocument 0, s"
              body = body & vbCrLf & "end sub"
        
              If Not ReadOnly Then
                SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name
              End If
              
              LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name
              LoadFields = LoadFields & vbCrLf & " LoadBtnPictures cmd" & fld.name & ",cmd" & fld.name & ".tag"
              LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".RemoveAllMenu"
              
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK =IsSet(txt" & fld.name & ".text)"
              End If
              
            End If 'URL
        
        
        
        
        
            If GenStyle = "HTML" Then
        '       Set ctl = fd.ControlData.Add()
        '       ctl.ProgId = "SHDocVwCtl.WebBrowser"
        '       Call AddProp(ctl, "NAME", "www" & fld.name)
        '       Call AddProp(ctl, "Top", pos)
        '       Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
        '       Call AddProp(ctl, "Height", 80 * Screen.TwipsPerPixelY)
        '       Call AddProp(ctl, "Width", 170 * Screen.TwipsPerPixelY)
        '
        '
        '      Set ctl = fd.ControlData.Add()
        '      ctl.ProgId = "MTZ_PANEL.DropButton"
        '      Call AddProp(ctl, "NAME", "cmd" & fld.name)
        '      Call AddProp(ctl, "Caption", "")
        '      Call AddProp(ctl, "Tag", "htmlopen.ico")
        '      Call AddProp(ctl, "Top", pos)
        '      Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX + 170 * Screen.TwipsPerPixelX)
        '      Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
        '      Call AddProp(ctl, "Width", 30 * Screen.TwipsPerPixelY)
        '      Call AddProp(ctl, "ToolTipText", nolf( fld.Caption))
        '
        '      pos = pos + 85 * Screen.TwipsPerPixelY
        '
        '       ' dilog for file open
        '        If fd.ControlData.Item("Dialog") Is Nothing Then
        '          Set ctl = fd.ControlData.Add("Dialog")
        '          ctl.ProgId = "MSComDlg.CommonDialog"
        '          Call AddProp(ctl, "Name", "Dialog")
        '          Call AddProp(ctl, "Top", pos - 10 * Screen.TwipsPerPixelY)
        '          Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
        '       End If
        '      On Error GoTo bye
        '
        '      ' procedure for load file into field
        '      mproc = ""
        '      mproc = mproc & vbCrLf & " Dialog.flags = cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNPathMustExist"
        '      mproc = mproc & vbCrLf & " Dialog.filter = ""(*.htm;*.html)|*.htm;*.html"""
        '      mproc = mproc & vbCrLf & " Dialog.DialogTitle = ""Гипертекстовый файл"""
        '      mproc = mproc & vbCrLf & " Dialog.CancelError = True"
        '      mproc = mproc & vbCrLf & " On Error Resume Next"
        '      mproc = mproc & vbCrLf & " Dialog.ShowOpen"
        '      mproc = mproc & vbCrLf & " If (Err.Number > 0) Then"
        '      mproc = mproc & vbCrLf & "  Err.Clear"
        '      mproc = mproc & vbCrLf & "  Exit Sub"
        '      mproc = mproc & vbCrLf & " End If"
        '      mproc = mproc & vbCrLf & " www" & fld.name & ".navigate Dialog.filename"
        '      mproc = mproc & vbCrLf & " item." & fld.name & "= FileToArray(Dialog.FileName)"
        '      mproc = mproc & vbCrLf & " Changing"
        '
        '      body = body & vbCrLf & "private sub CMD" & fld.name & "_CLICK()"
        '      body = body & vbCrLf & "  on error resume next"
        '      body = body & vbCrLf & mproc
        '      body = body & vbCrLf & "end sub"
        '
        '      mproc = ""
        '      mproc = mproc & vbCrLf & " sTRINGToFile APP.PATH & ""\EMPTY.HTM"",""<HTML><BODY></BODY></HTML>"""
        '      mproc = mproc & vbCrLf & " www" & fld.name & ".navigate APP.PATH & ""\EMPTY.HTM"""
        '      mproc = mproc & vbCrLf & " item." & fld.name & "= null"
        '      mproc = mproc & vbCrLf & " Changing"
        '
        '      body = body & vbCrLf & "private sub cmd" & fld.name & "_MenuClick(ByVal sCaption As String)"
        '      body = body & vbCrLf & mproc
        '      body = body & vbCrLf & "          txt" & fld.name & " = """""
        '      body = body & vbCrLf & "End sub"
        '
        '
        '
        '      SaveFields = SaveFields & vbCrLf & " ' SEE cmd" & fld.name & "_CLICK"
        '
        '      LoadFields = LoadFields & vbCrLf & " STRINGToFile APP.PATH & ""\EMPTY.HTM"",""<HTML><BODY></BODY></HTML>"""
        '      LoadFields = LoadFields & vbCrLf & " www" & fld.name & ".navigate APP.PATH & ""\EMPTY.HTM"""
        '      LoadFields = LoadFields & vbCrLf & " while www" & fld.name & ".busy"
        '      LoadFields = LoadFields & vbCrLf & " doevents"
        '      LoadFields = LoadFields & vbCrLf & " wend"
        '      LoadFields = LoadFields & vbCrLf & " if  not isnull(item." & fld.name & ") then "
        '      LoadFields = LoadFields & vbCrLf & "   arraytofile APP.PATH & ""\temp.HTM"",item." & fld.name
        '      LoadFields = LoadFields & vbCrLf & "   www" & fld.name & ".navigate APP.PATH & ""\TEMP.HTM"""
        '      LoadFields = LoadFields & vbCrLf & " else "
        '      LoadFields = LoadFields & vbCrLf & "   STRINGToFile APP.PATH & ""\EMPTY.HTM"",""<HTML><BODY></BODY></HTML>"""
        '      LoadFields = LoadFields & vbCrLf & "   www" & fld.name & ".navigate APP.PATH & ""\EMPTY.HTM"""
        '      LoadFields = LoadFields & vbCrLf & " end if "
        '      LoadFields = LoadFields & vbCrLf & " LoadBtnPictures cmd" & fld.name & ",cmd" & fld.name & ".tag"
        '      LoadFields = LoadFields & vbCrLf & "  cmd" & fld.name & ".RemoveAllMenu"
        '      LoadFields = LoadFields & vbCrLf & " cmd" & fld.name & ".AddMenu ""Очистить"""
              
              Set ctl = fd.ControlData.Add()
              ctl.ProgID = "VB.textbox"
              Call AddProp(ctl, "NAME", "txt" & fld.name)
              Call AddProp(ctl, "Text", "")
              Call AddProp(ctl, "Top", pos)
              Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
              Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "Multiline", True)
              Call AddProp(ctl, "Scrollbars", 3)
              Call AddProp(ctl, "Locked", ReadOnly)
              Call AddProp(ctl, "Enabled", Not ReadOnly)
        
              Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
              
              pos = pos + 25 * Screen.TwipsPerPixelY
              body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
              body = body & vbCrLf & "  Changing"
              body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
              body = body & vbCrLf & "end sub"
              If Not ReadOnly Then
                SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name
              End If
              LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name
              
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK =IsSet(item." & fld.name & ")"
              End If
              
            End If 'HTML
        
        
        
        
           If GenStyle = "MEMO" And fld.FIELDTYPE.name <> "ReferenceSQL" Then
               Set ctl = fd.ControlData.Add()
               ctl.ProgID = "VB.textbox"
               Call AddProp(ctl, "NAME", "txt" & fld.name)
               Call AddProp(ctl, "Text", "")
               Call AddProp(ctl, "Top", pos)
               Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
               Call AddProp(ctl, "Height", 80 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Multiline", True)
               Call AddProp(ctl, "Scrollbars", 2)
               Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
               Call AddProp(ctl, "Locked", ReadOnly)
               Call AddProp(ctl, "Enabled", Not ReadOnly)
               pos = pos + 85 * Screen.TwipsPerPixelY
        
        
               body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
               body = body & vbCrLf & "  Changing"
               body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
               body = body & vbCrLf & "end sub"
              If Not ReadOnly Then
                SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name
              End If
              LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name
        
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK =IsSet(txt" & fld.name & ".text)"
              End If
        
            End If ' MEMO
        
        
            If GenStyle = "RTF" Then
               Set ctl = fd.ControlData.Add()
               ctl.ProgID = "MTZ_PANEL.RTFEDITOR"
               Call AddProp(ctl, "NAME", "txt" & fld.name)
               Call AddProp(ctl, "Text", "")
               Call AddProp(ctl, "Top", pos)
               Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
               Call AddProp(ctl, "Height", 80 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
               Call AddProp(ctl, "Enabled", Not ReadOnly)
               
               pos = pos + 85 * Screen.TwipsPerPixelY
        
        
               body = body & vbCrLf & "private sub txt" & fld.name & "_OnChange()"
               body = body & vbCrLf & "  Changing"
               body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
               body = body & vbCrLf & "end sub"
        
              If Not ReadOnly Then
                SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = txt" & fld.name & ".RTF"
              End If
              LoadFields = LoadFields & vbCrLf & "txt" & fld.name & ".RTF = item." & fld.name
        
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK =IsSet(txt" & fld.name & ".RTF)"
              End If
        
            End If ' RTF
        
        
        
           
           
     ''''''''''' File
           
           If GenStyle = "FILE" Then
               Set ctl = fd.ControlData.Add()
               If Trim(fld.TheMask) <> "" Then
                ctl.ProgID = "MSMask.MaskEdBox"
                Call AddProp(ctl, "Mask", fld.TheMask)
              Else
                ctl.ProgID = "VB.textbox"
              End If
               Call AddProp(ctl, "NAME", "txt" & fld.name)
               Call AddProp(ctl, "Top", pos)
               Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
               Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Width", 170 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Locked", True)
               Call AddProp(ctl, "Enabled", Not ReadOnly)
               Call AddProp(ctl, "BorderStyle", 1)
               Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
        
        
              Set ctl = fd.ControlData.Add()
              ctl.ProgID = "MTZ_PANEL.DropButton"
              Call AddProp(ctl, "NAME", "cmd" & fld.name)
              Call AddProp(ctl, "Caption", "")
              Call AddProp(ctl, "Tag", "fileopen.ico")
              Call AddProp(ctl, "Top", pos)
              Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX + 170 * Screen.TwipsPerPixelX)
              Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "Width", 30 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
              
              pos = pos + 25 * Screen.TwipsPerPixelY
        
               ' dilog for file open
                If fd.ControlData.item("Dialog") Is Nothing Then
                  Set ctl = fd.ControlData.Add("Dialog")
                  ctl.ProgID = "MSComDlg.CommonDialog"
                  Call AddProp(ctl, "Name", "Dialog")
                  Call AddProp(ctl, "Top", pos - 10 * Screen.TwipsPerPixelY)
                  Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
               End If
              On Error GoTo bye
              
                
                body = body & vbCrLf & "Private Sub cmd" & fld.name & "_Click()"
                body = body & vbCrLf & "  on error resume next"
                body = body & vbCrLf & "  if item." & fld.name & "_ext <>"""" and not isnull(item." & fld.name & ")  then"
                body = body & vbCrLf & "    cmd" & fld.name & "_MenuClick ""Открыть"""
                If Not ReadOnly Then
                  body = body & vbCrLf & "  else"
                  body = body & vbCrLf & "    cmd" & fld.name & "_MenuClick ""Выбрать"""
                End If
                body = body & vbCrLf & "  End if"
                body = body & vbCrLf & "End Sub"
                body = body & vbCrLf & ""
                body = body & vbCrLf & "Private Sub cmd" & fld.name & "_MenuClick(ByVal sCaption As String)"
                If Not ReadOnly Then
                  body = body & vbCrLf & "  If sCaption = ""Выбрать"" Then"
                  body = body & vbCrLf & "   Dialog.Flags = cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNPathMustExist"
                  body = body & vbCrLf & "   Dialog.Filter = ""(*.*)|*.*"""
                  body = body & vbCrLf & "   Dialog.DialogTitle = ""Файл"""
                  body = body & vbCrLf & "   Dialog.CancelError = True"
                  body = body & vbCrLf & "   On Error Resume Next"
                  body = body & vbCrLf & "   Dialog.ShowOpen"
                  body = body & vbCrLf & "   If (Err.Number > 0) Then"
                  body = body & vbCrLf & "    Err.Clear"
                  body = body & vbCrLf & "    Exit Sub"
                  body = body & vbCrLf & "   End If"
                  body = body & vbCrLf & "   txt" & fld.name & " = Dialog.FileName"
                  body = body & vbCrLf & "   item." & fld.name & " = FileToArray(Dialog.FileName)"
                  body = body & vbCrLf & "   item." & fld.name & "_ext = GetFileExtension2(Dialog.FileName)"
                  body = body & vbCrLf & "   Changing"
                  body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
                  body = body & vbCrLf & "  End If"
                  
                  body = body & vbCrLf & "  If sCaption = ""Очистить"" Then"
                  body = body & vbCrLf & "   txt" & fld.name & " = """" "
                  body = body & vbCrLf & "   item." & fld.name & " = null"
                  body = body & vbCrLf & "   item." & fld.name & "_ext = """""
                  body = body & vbCrLf & "   Changing"
                  body = body & vbCrLf & "  End If"
                  
                End If
                body = body & vbCrLf & "  If sCaption = ""Открыть"" Then"
        
 
              'Управление обновлением файла
                'WAS'body = body & vbCrLf & "    item.Application.manager.StoreTempFileData DoOpenFile( item." & fld.name & ", item." & fld.name & "_ext),item.partname,item.id"
                body = body & vbCrLf & "    Path" & fld.name & " = DoOpenFile(item." & fld.name & ", item." & fld.name & "_ext)"
                body = body & vbCrLf & "    'Get LastModify Date"
                body = body & vbCrLf & "    Dim fso, f, s"
                body = body & vbCrLf & "    On Error Resume Next"
                body = body & vbCrLf & "    Set fso = CreateObject(""Scripting.FileSystemObject"")"
                body = body & vbCrLf & "    Set f = fso.GetFile(Path" & fld.name & ")"
                body = body & vbCrLf & "    Mod" & fld.name & " = f.DateLastModified"
                body = body & vbCrLf & "    "
                body = body & vbCrLf & "    item.Application.Manager.StoreTempFileData Path" & fld.name & ", item.PartName, item.ID"
                
                If Not ReadOnly Then
                    body = body & vbCrLf & "    " & fld.name & ".Enabled = True"
                End If
                
                'EOF Управление обновлением файла
                body = body & vbCrLf & "  End If"
                
                body = body & vbCrLf & "  If sCaption = ""Сохранить"" Then"
                body = body & vbCrLf & "   Dialog.Flags = cdlOFNHideReadOnly + cdlOFNPathMustExist"
                body = body & vbCrLf & "   Dialog.Filter = ""(*.*)|*.*"""
                body = body & vbCrLf & "   Dialog.DialogTitle = ""Файл"""
                body = body & vbCrLf & "   Dialog.CancelError = True"
                body = body & vbCrLf & "   On Error Resume Next"
                body = body & vbCrLf & "   Dialog.ShowSave"
                body = body & vbCrLf & "   If (Err.Number > 0) Then"
                body = body & vbCrLf & "    Err.Clear"
                body = body & vbCrLf & "    Exit Sub"
                body = body & vbCrLf & "   End If"
                body = body & vbCrLf & "   ArrayToFile Dialog.FileName, item." & fld.name
                body = body & vbCrLf & "  End If"
                body = body & vbCrLf & "End Sub"
        
              
              SaveFields = SaveFields & vbCrLf & " ' SEE cmd" & fld.name & "_CLICK"
              
              LoadFields = LoadFields & vbCrLf & " if  lenb(item." & fld.name & ")>0 then "
              LoadFields = LoadFields & vbCrLf & "   txt" & fld.name & "=""Данные ("" & item." & fld.name & "_ext & "")"""
              LoadFields = LoadFields & vbCrLf & " else "
              LoadFields = LoadFields & vbCrLf & "   txt" & fld.name & "="""""
              LoadFields = LoadFields & vbCrLf & " end if "
              
              LoadFields = LoadFields & vbCrLf & " LoadBtnPictures cmd" & fld.name & ",cmd" & fld.name & ".tag"
              LoadFields = LoadFields & vbCrLf & " cmd" & fld.name & ".RemoveAllMenu"
              If fldAllowNull Then
                LoadFields = LoadFields & vbCrLf & " cmd" & fld.name & ".AddMenu ""Очистить"""
              End If
              LoadFields = LoadFields & vbCrLf & " cmd" & fld.name & ".AddMenu ""Выбрать"""
              LoadFields = LoadFields & vbCrLf & " cmd" & fld.name & ".AddMenu ""Сохранить"""
              LoadFields = LoadFields & vbCrLf & " cmd" & fld.name & ".AddMenu ""Открыть"""
              
            
              
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK =(lenb(item." & fld.name & ")>0)"
              End If
              
            End If ' FILE
           
           '''''''''''
           
           If GenStyle = "IMAGE" Then
               Set ctl = fd.ControlData.Add()
               ctl.ProgID = "VB.image"
               Call AddProp(ctl, "NAME", "img" & fld.name)
               Call AddProp(ctl, "Top", pos)
               Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
               Call AddProp(ctl, "Height", 80 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Width", 170 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Stretch", True)
               Call AddProp(ctl, "BorderStyle", 1)
               Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
        
              
        
              decl = decl & vbCrLf & " dim m_" & fld.name
               
              Set ctl = fd.ControlData.Add()
              ctl.ProgID = "MTZ_PANEL.DropButton"
              Call AddProp(ctl, "NAME", "cmd" & fld.name)
              Call AddProp(ctl, "Caption", "")
              Call AddProp(ctl, "Tag", "imageopen.ico")
              Call AddProp(ctl, "Top", pos)
              Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX + 170 * Screen.TwipsPerPixelX)
              Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "Width", 30 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
              Call AddProp(ctl, "Visible", Not ReadOnly)
              
              
               ' dilog for file open
               If fd.ControlData.item("Dialog") Is Nothing Then
                 Set ctl = fd.ControlData.Add("Dialog")
                 ctl.ProgID = "MSComDlg.CommonDialog"
                 Call AddProp(ctl, "Name", "Dialog")
                 Call AddProp(ctl, "Top", pos - 10 * Screen.TwipsPerPixelY)
                 Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
               End If
               
               pos = pos + 85 * Screen.TwipsPerPixelY
        
              On Error GoTo bye
        
              ' procedure for load file into image
              If Not ReadOnly Then
                mproc = ""
                
                mproc = mproc & vbCrLf & " Dialog.flags = cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNPathMustExist"
                mproc = mproc & vbCrLf & " Dialog.filter = ""(*.BMP;*.ICO;*.GIF;*.JPG)|*.BMP;*.ICO;*.GIF;*.JPG"""
                mproc = mproc & vbCrLf & " Dialog.DialogTitle = ""Файл изображения"""
                mproc = mproc & vbCrLf & " Dialog.CancelError = True"
                mproc = mproc & vbCrLf & " On Error Resume Next"
                mproc = mproc & vbCrLf & " Dialog.ShowOpen"
                mproc = mproc & vbCrLf & " If (Err.Number > 0) Then"
                mproc = mproc & vbCrLf & "  Err.Clear"
                mproc = mproc & vbCrLf & "  Exit Sub"
                mproc = mproc & vbCrLf & " End If"
                mproc = mproc & vbCrLf & " set img" & fld.name & ".picture=LoadPicture(Dialog.FileName)"
                mproc = mproc & vbCrLf & " item." & fld.name & "=FileToArray( Dialog.FileName)"
                mproc = mproc & vbCrLf & " Changing"
                mproc = mproc & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
                
                
                body = body & vbCrLf & "private sub CMD" & fld.name & "_CLICK()"
                body = body & vbCrLf & "  on error resume next"
                body = body & vbCrLf & mproc
                body = body & vbCrLf & "end sub"
                
                mproc = ""
                mproc = mproc & vbCrLf & " set img" & fld.name & ".picture=LoadPicture()"
                mproc = mproc & vbCrLf & " item." & fld.name & "= null"
                mproc = mproc & vbCrLf & " Changing"
                mproc = mproc & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
                
                body = body & vbCrLf & "Private Sub cmd" & fld.name & "_MenuClick(ByVal sCaption As String)"
                body = body & vbCrLf & mproc
                body = body & vbCrLf & "end sub"
                
                SaveFields = SaveFields & vbCrLf & " ' SEE cmd" & fld.name & "_CLICK"
              End If
              
              LoadFields = LoadFields & vbCrLf & " LoadImage img" & fld.name & ", item." & fld.name
              LoadFields = LoadFields & vbCrLf & " LoadBtnPictures cmd" & fld.name & ",cmd" & fld.name & ".tag"
              LoadFields = LoadFields & vbCrLf & " cmd" & fld.name & ".RemoveAllMenu"
              LoadFields = LoadFields & vbCrLf & " cmd" & fld.name & ".AddMenu ""Очистить"""
              
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK =(lenb(item." & fld.name & ")>0)"
              End If
              
            End If 'IMAGE
        
        
            ' numeric type
            'Double
            'Integer
            'Long
        
            If GenStyle = "NUMERIC" Or GenStyle = "INTEGER" Or GenStyle = "INTERVAL" Then
        
               Set ctl = fd.ControlData.Add()
               If GenStyle = "NUMERIC" Then
                   ctl.ProgID = "MSMask.MaskEdBox"
               Else
                   ctl.ProgID = "VB.textbox"
               End If
               Call AddProp(ctl, "NAME", "txt" & fld.name)
               Call AddProp(ctl, "Text", "")
               Call AddProp(ctl, "Top", pos)
               Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
               Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Width", 120 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
               Call AddProp(ctl, "CausesValidation", True)
               Call AddProp(ctl, "Locked", ReadOnly)
               Call AddProp(ctl, "Enabled", Not ReadOnly)
               
               If GenStyle = "NUMERIC" Then
                Call AddProp(ctl, "MaxLength", 27)
                Call AddProp(ctl, "Format", "#,##0.00;(#,##0.00)")
               Else
                Call AddProp(ctl, "MaxLength", 15)
               End If
              If Not ReadOnly Then
                If GenStyle = "NUMERIC" Then
                body = body & vbCrLf & "private sub txt" & fld.name & "_Validate(cancel as boolean)"
                body = body & vbCrLf & "if txt" & fld.name & ".text<>"""" then " & vbCrLf & " on error resume next " & vbCrLf & "  if not isnumeric(txt" & fld.name & ".text) then " & vbCrLf & "     cancel=true " & vbCrLf & "     msgbox ""Ожидалось число"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
                "     txt" & fld.name & ".SetFocus " & vbCrLf & "  elseif Val(txt" & fld.name & ".text) < -922337203685477.5808 or Val(txt" & fld.name & ".text)>+922337203685477.5807 then " & vbCrLf & "     cancel=true " & vbCrLf & "     msgbox ""Значение вне допустимого диапазона"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
                "     txt" & fld.name & ".SetFocus " & vbCrLf & "  end if" & vbCrLf & "end if"
                 body = body & vbCrLf & "end sub"
                ElseIf GenStyle = "INTEGER" Then
                  body = body & vbCrLf & "private sub txt" & fld.name & "_Validate(cancel as boolean)"
                  body = body & vbCrLf & "if txt" & fld.name & ".text<>"""" then " & vbCrLf & " on error resume next " & vbCrLf & "  if not isnumeric(txt" & fld.name & ".text) then " & vbCrLf & "     cancel=true " & vbCrLf & "     msgbox ""Ожидалось число"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
                  "     txt" & fld.name & ".SetFocus " & vbCrLf & "  elseif Val(txt" & fld.name & ".text) <>clng(Val(txt" & fld.name & ".text)) then " & vbCrLf & "     cancel=true " & vbCrLf & "     msgbox ""Ожидалось целое число"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
                  "     txt" & fld.name & ".SetFocus " & vbCrLf & "  end if" & vbCrLf & "end if"
                  body = body & vbCrLf & "end sub"
                ElseIf GenStyle = "INTERVAL" Then
                  body = body & vbCrLf & "private sub txt" & fld.name & "_Validate(cancel as boolean)"
                  body = body & vbCrLf & "if txt" & fld.name & ".text<>"""" then " & vbCrLf & " on error resume next " & vbCrLf & "  if not isnumeric(txt" & fld.name & ".text) then " & vbCrLf & "     cancel=true " & vbCrLf & "     msgbox ""Ожидалось число"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
                  "     txt" & fld.name & ".SetFocus " & vbCrLf & "  elseif Val(txt" & fld.name & ".text) <>clng(Val(txt" & fld.name & ".text)) then " & vbCrLf & "     cancel=true " & vbCrLf & "     msgbox ""Ожидалось целое число"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
                  "     txt" & fld.name & ".SetFocus " & vbCrLf & "  elseif Val(txt" & fld.name & ".text) < 0" & ft.Minimum & " or  Val(txt" & fld.name & ".text)> 0" & ft.Maximum & " then " & vbCrLf & "     cancel=true " & vbCrLf & "     msgbox ""Значение вне допустимого диапазона"",vbokonly+vbexclamation,""Внимание"" " & vbCrLf & _
                  "     txt" & fld.name & ".SetFocus " & vbCrLf & "  end if" & vbCrLf & "end if"
                  body = body & vbCrLf & "end sub"
                End If
                
                
                body = body & vbCrLf & "Private Sub txt" & fld.name & "_KeyPess(KeyAscii As Integer)"
                body = body & vbCrLf & "Dim s As String" & vbCrLf & "s = ""0123456789.,-"" & Chr(8)" & vbCrLf & "If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub" & vbCrLf & "KeyAscii = 0" & vbCrLf
                body = body & vbCrLf & "End Sub"
              End If
              
              body = body & vbCrLf & "private sub txt" & fld.name & "_Change()"
              body = body & vbCrLf & "  Changing"
              body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
              body = body & vbCrLf & "end sub"
        
              If Not ReadOnly Then
                SaveFields = SaveFields & vbCrLf & "item." & fld.name & " = cdbl(txt" & fld.name & ")"
              End If
              LoadFields = LoadFields & vbCrLf & "txt" & fld.name & " = item." & fld.name
        
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK = IsSet(txt" & fld.name & ".text)"
              End If
        
        
              pos = pos + 25 * Screen.TwipsPerPixelY
            End If
        
            ' date type
            If GenStyle = "DATE" Or GenStyle = "DATETIME" Or GenStyle = "TIME" Or GenStyle = "MONTHYEAR" Then
        
               Set ctl = fd.ControlData.Add()
               ctl.ProgID = "MSComCtl2.DTPicker"
               Call AddProp(ctl, "NAME", "dtp" & fld.name)
               Call AddProp(ctl, "Top", pos)
               Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
               Call AddProp(ctl, "Height", 20 * Screen.TwipsPerPixelY)
               Call AddProp(ctl, "Format", 3)
               Call AddProp(ctl, "Enabled", Not ReadOnly)
               
               Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
               If GenStyle = "DATETIME" Then
                  Call AddProp(ctl, "CustomFormat", "dd.MM.yyyy HH:mm:ss")
                  Call AddProp(ctl, "Width", 150 * Screen.TwipsPerPixelY)
                  LoadFields = LoadFields & vbCrLf & "dtp" & fld.name & " = now"
               End If
               If GenStyle = "DATE" Then
                 Call AddProp(ctl, "CustomFormat", "dd.MM.yyyy")
                 Call AddProp(ctl, "Width", 120 * Screen.TwipsPerPixelY)
                 LoadFields = LoadFields & vbCrLf & "dtp" & fld.name & " = date"
               End If
               If GenStyle = "TIME" Then
                 Call AddProp(ctl, "CustomFormat", "HH:mm:ss")
                 Call AddProp(ctl, "Width", 120 * Screen.TwipsPerPixelY)
                 Call AddProp(ctl, "UpDown", True)
                 LoadFields = LoadFields & vbCrLf & "dtp" & fld.name & " = time"
               End If
               
              If GenStyle = "MONTHYEAR" Then
                 Call AddProp(ctl, "CustomFormat", "MM.yyyy")
                 Call AddProp(ctl, "Width", 120 * Screen.TwipsPerPixelY)
                 Call AddProp(ctl, "UpDown", True)
                 LoadFields = LoadFields & vbCrLf & "dtp" & fld.name & " = dateserial(year(date),month(date),1)"
               End If
        
               If fldAllowNull Then
                Call AddProp(ctl, "CheckBox", True)
               Else
                Call AddProp(ctl, "CheckBox", False)
               End If
        
               body = body & vbCrLf & "private sub dtp" & fld.name & "_Change()"
               body = body & vbCrLf & "  Changing"
               body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
               body = body & vbCrLf & "end sub"
        
        
               If Not ReadOnly Then
                SaveFields = SaveFields & vbCrLf & "  if  isnull(dtp" & fld.name & ") then"
                SaveFields = SaveFields & vbCrLf & "    item." & fld.name & " = 0"
                SaveFields = SaveFields & vbCrLf & "  else"
                SaveFields = SaveFields & vbCrLf & "    item." & fld.name & " = dtp" & fld.name & ".value"
                SaveFields = SaveFields & vbCrLf & "  end if"
               End If
               
               LoadFields = LoadFields & vbCrLf & "if item." & fld.name & " <> 0 then"
               LoadFields = LoadFields & vbCrLf & " dtp" & fld.name & " = item." & fld.name
               If fldAllowNull Then
                  LoadFields = LoadFields & vbCrLf & "else"
                  LoadFields = LoadFields & vbCrLf & " dtp" & fld.name & ".value = null"
               End If
               LoadFields = LoadFields & vbCrLf & "end if"
               pos = pos + 25 * Screen.TwipsPerPixelY
               
               If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK = IsSet(dtp" & fld.name & ".value)"
              End If
        
               
            End If ' DATE TIME DATETIME
        
            ' Enum !!!
            If GenStyle = "COMBOBOX" Or GenStyle = "CHECKBOX" Then
        
              Set ctl = fd.ControlData.Add()
              ctl.ProgID = "VB.ComboBox"
              Call AddProp(ctl, "NAME", "cmb" & fld.name)
              Call AddProp(ctl, "Style", 2)
              Call AddProp(ctl, "Sorted", True)
              Call AddProp(ctl, "Top", pos)
              Call AddProp(ctl, "Left", (210 * COLUMN + 20) * Screen.TwipsPerPixelX)
              Call AddProp(ctl, "ToolTipText", NoLF(fld.Caption))
              Call AddProp(ctl, "Width", 200 * Screen.TwipsPerPixelY)
              Call AddProp(ctl, "Enabled", Not ReadOnly)
        
              
              body = body & vbCrLf & "private sub cmb" & fld.name & "_Click()"
              body = body & vbCrLf & "  on error resume next"
              body = body & vbCrLf & "  Changing"
              body = body & vbCrLf & GetScript2(fld.FIELDVALIDATOR, LastTID)
              body = body & vbCrLf & "end sub"
        
              If Not ReadOnly Then
                SaveFields = SaveFields & vbCrLf & " if cmb" & fld.name & ".listindex>=0 then"
                SaveFields = SaveFields & vbCrLf & "   item." & fld.name & " = cmb" & fld.name & ".itemdata(cmb" & fld.name & ".listindex)"
                SaveFields = SaveFields & vbCrLf & " end if"
              End If
        
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
        
              If Not fldAllowNull Then
                IsOK = IsOK & vbCrLf & "if mIsOK then mIsOK =(cmb" & fld.name & ".ListIndex >=0)"
              End If
        
              pos = pos + 25 * Screen.TwipsPerPixelY
            End If
            
            Exit Sub
            
bye:
            MsgBox Err.Description
            'Stop
            'Resume
        End Sub
        
        
        
        
        
        
        
        
