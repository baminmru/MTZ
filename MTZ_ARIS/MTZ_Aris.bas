Attribute VB_Name = "MTZ_Aris"
Option Explicit
Public aris As Object
Public report As ATARep.ReportComponent
Public dnl As DatabaseList
Public database As ATDRepDb.database
Public LocaleID As String

Public optOrg As Boolean
Public optDoc As Boolean
Public optDocSt As Boolean
Public optProc As Boolean
Public optFType As Boolean


Public Sub MTZ2Aris()
 On Error GoTo bye
Dim f As frmLogin
  Set f = New frmLogin
again:
  f.Show vbModal
  If Not f.ok Then Exit Sub
  Set m = New MTZManager.Main
  site = f.txtSite
  Set s = m.GetSession(site)
  If s Is Nothing Then
    MsgBox "Неверное имя сайта", vbCritical
    GoTo again
  End If
  s.Login f.txtUserName, f.txtPassword
  
  If s.sessionid = "" Then
    MsgBox "Неверное имя пользователя, или пароль", vbCritical
    GoTo again
  End If
  Unload f
  Set f = Nothing
  FillMTZModel
  m.GetSession(site).Logout
  Set m = Nothing
  Exit Sub
bye:
  MsgBox Err.Description
End Sub

Sub FillMTZModel()
  On Error GoTo bye
  Dim cat As Group
  Dim root As Group
  Dim gl As GroupList
  Dim tcat As Group
  Dim pcat As Group
  Dim ot As OBJECTTYPE
  Dim meta As MTZMetaModel.Application
  Dim i As Long, j As Long, k As Long
  Dim cls As ObjDef
  Dim att As Attr
    
  Set rs = m.ListInstances("", "MTZMetaModel")
  Set meta = m.GetInstanceObject(rs!InstanceID)
  Set root = database.RootGroup
  If optFType Then
  
  
    Form1.pb.Min = 0
    Form1.pb.Max = meta.FIELDTYPE.Count
    Form1.pb.Value = 0
    Form1.pb.Visible = True
    
    Set pcat = root.CreateChildGroup("Типы полей", LocaleID)
    Set cls = pcat.CreateObjDef(OT_CLS, "Ссылка на объект", LocaleID)
    Set att = cls.Attribute(AT_ID, LocaleID)
    att.Value = "Reference"
    Set att = cls.Attribute(AT_DESC, LocaleID)
    att.Value = "Ссылка на любой документ"
    Set cls = pcat.CreateObjDef(OT_CLS, "Ссылка на строку", LocaleID)
    Set att = cls.Attribute(AT_ID, LocaleID)
    att.Value = "ReferenceToRow"
    Set att = cls.Attribute(AT_DESC, LocaleID)
    att.Value = "Ссылка на строку документа"
    
    
    For i = 1 To meta.FIELDTYPE.Count
      FillMTZType pcat, meta.FIELDTYPE.Item(i)
      Form1.pb.Value = i
    Next
    Form1.pb.Visible = False
    
  End If
  If optDoc Or optDocSt Then
    Set cat = root.CreateChildGroup("Модель", LocaleID)
    For i = 1 To meta.MTZAPP.Count
      Set pcat = cat.CreateChildGroup(meta.MTZAPP.Item(i).Name, LocaleID)
      Set att = pcat.Attribute(AT_ID, LocaleID)
      att.Value = meta.MTZAPP.Item(i).Name
      Set att = pcat.Attribute(AT_DESC, LocaleID)
      att.Value = meta.MTZAPP.Item(i).Name
      Set att = pcat.Attribute(AT_SHORT_DESC, LocaleID)
      att.Value = meta.MTZAPP.Item(i).id
    Next
    
    Dim jj As Long
    Dim mdl As model
  
    Form1.pb.Min = 1
    Form1.pb.Max = meta.OBJECTTYPE.Count
    Form1.pb.Value = 1
    Form1.pb.Visible = True
    For i = 1 To meta.OBJECTTYPE.Count
      Form1.pb.Value = i
      Set ot = meta.OBJECTTYPE.Item(i)
      Set gl = cat.Childs ' .GetAllCategories().GetAt(cat.GetAllCategories().FindFirst(meta.OBJECTTYPE.Item(i).Package.name))
      For jj = 0 To gl.Count - 1
        Set pcat = gl.Get(jj)
        If ot.Package.Name = pcat.Name(LocaleID) Then
            Set tcat = pcat.CreateChildGroup(ot.the_comment, LocaleID)
            
            If optDoc Then
              Set cls = pcat.CreateObjDef(OT_CLS, ot.the_comment, LocaleID)
              
              Set att = cls.Attribute(AT_ID, LocaleID)
              att.Value = ot.Name
              
              Set att = cls.Attribute(AT_SOURCE, LocaleID)
              att.Value = "OBJECTTYPE"
    
              cls.ModifyGUID Mid(ot.id, 2, 36)
              
              Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
              att.Value = ot.id
              
              Set att = cls.Attribute(AT_DESC, LocaleID)
              If ot.IsSingleInstance Then
                att.Value = "единственный объект"
              Else
                att.Value = "допускается множестов объектов"
              End If
              Set mdl = tcat.CreateModel(MT_UML_CLS_DESC_DGM, ot.the_comment, LocaleID)
              mdl.Attribute(AT_SHORT_DESC, LocaleID).Value = ot.id
              mdl.Attribute(AT_ID, LocaleID).Value = ot.Name
              
              For j = 1 To ot.PART.Count
                FillMTZPart tcat, mdl, ot.PART.Item(j), Nothing
              Next
            End If
            If optDocSt Then
              If ot.OBJSTATUS.Count > 0 Then
                Set mdl = tcat.CreateModel(MT_UML_STATE_CHRT_DGM, "Состояния:" & ot.the_comment, LocaleID)
                mdl.Attribute(AT_SHORT_DESC, LocaleID).Value = ot.id
                mdl.Attribute(AT_ID, LocaleID).Value = ot.Name
                
                FillState tcat, mdl, ot
              End If
            End If
            Exit For
        End If
      Next
      DoEvents
      If database Is Nothing Then Exit For
    Next
  
    Form1.pb.Visible = False
  End If
  
  If optOrg Then
    FillMtzOrg
  End If
  
  If optProc Then
    'FillMTZProcess
  End If
  
  Exit Sub
bye:
  MsgBox Err.Description
  'Resume
End Sub


Sub FillMTZType(cat As Group, ft As MTZMetaModel.FIELDTYPE)
  On Error GoTo bye
  Dim j As Long, i As Long
  Dim cls As ObjDef
  Dim att As Attr

  Set cls = cat.CreateObjDef(OT_CLS, ft.Name, LocaleID)
  Set att = cls.Attribute(AT_SOURCE, LocaleID)
  att.Value = "FIELDTYPE"
  Set att = cls.Attribute(AT_NAME, LocaleID)
  att.Value = ft.Name
  cls.ModifyGUID Mid(ft.id, 2, 36)
  Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
  att.Value = ft.id
  Set att = cls.Attribute(AT_ID, LocaleID)
  att.Value = ft.Name
  Set att = cls.Attribute(AT_DESC, LocaleID)
  att.Value = ft.the_comment
   
   
'  If ft.TypeStyle = TypeStyle_Interval Then
'    cls.Stereotype = "Интервал"
'    Call cls.addAttribute("Minimum", "Integer", ft.Minimum)
'    Call cls.addAttribute("Maximum", "Integer", ft.Maximum)
'  End If
'  If ft.TypeStyle = TypeStyle_Perecislenie Then
'    cls.Stereotype = "Перечисление"
'    For i = 1 To ft.ENUMITEM.Count
'      Set att = cls.addAttribute(ft.ENUMITEM.Item(i).name, "integer", ft.ENUMITEM.Item(i).NameValue)
'      att.Documentation = ft.ENUMITEM.Item(i).name
'    Next
'  End If
'
'  If ft.TypeStyle = TypeStyle_Skalyrniy_tip Then
'    cls.Stereotype = "Скалярный тип"
'  End If
  
'  If ft.TypeStyle = TypeStyle_Ssilka Then
'    cls.Stereotype = "Ссылка"
'  End If
'
'  If ft.TypeStyle = TypeStyle_Viragenie Then
'    cls.Stereotype = "Выражение"
'  End If
'
'  cls.Documentation = ft.comment
  Exit Sub
bye:
  MsgBox Err.Description
End Sub

Public Function GetX(mdl As model) As Long
  Dim col As Long, row As Long
  col = mdl.ObjOccList.Count \ 5
  row = mdl.ObjOccList.Count Mod 5
  GetX = row * 300
End Function

Public Function GetY(mdl As model) As Long
  Dim col As Long, row As Long
  col = mdl.ObjOccList.Count \ 5
  row = mdl.ObjOccList.Count Mod 5
  GetY = col * 300
End Function


Sub FillMTZPart(cat As Group, mdl As model, p As MTZMetaModel.PART, parent As ObjOcc)
  Debug.Print cat.Name(LocaleID) & "." & p.Name
  On Error GoTo bye
  Dim j As Long, i As Long, f As MTZMetaModel.FIELD, ft As MTZMetaModel.FIELDTYPE
  Dim cls As ObjDef
  Dim clsp As ObjDef
  Dim srcObj As ObjOcc
  Dim trgObj As ObjOcc
  Dim att As Attr
  DoEvents
  If database Is Nothing Then Exit Sub
  
  Set cls = cat.CreateObjDef(OT_CLS, p.caption, LocaleID)
  Set srcObj = mdl.CreateObjOcc(ST_CLS, cls, GetX(mdl), GetY(mdl), True)
  Set att = cls.Attribute(AT_SOURCE, LocaleID)
  att.Value = "PART"
  Set att = cls.Attribute(AT_ID, LocaleID)
  att.Value = p.Name
  cls.ModifyGUID Mid(p.id, 2, 36)
  Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
  att.Value = p.id
  Set att = cls.Attribute(AT_DESC, LocaleID)
  If p.PartType = PartType_Derevo Then att.Value = "Дерево"
  If p.PartType = PartType_Kollekciy Then att.Value = "Коллекция"
  If p.PartType = PartType_Stroka Then att.Value = "Строка"
  
    
  If parent Is Nothing Then
  'debug.print 'root part'
  Else
    'Надо добавить атрибут Parent
    Set cls = cat.CreateObjDef(OT_ERM_ATTR, "Parent", LocaleID)
    Set trgObj = mdl.CreateObjOcc(155, cls, GetX(mdl), GetY(mdl), True)
    Set att = cls.Attribute(AT_SOURCE, LocaleID)
    att.Value = "PARENT"
    Set att = cls.Attribute(AT_ID, LocaleID)
    att.Value = "Parent"
    Set att = cls.Attribute(AT_DESC, LocaleID)
    att.Value = "ReferenceToRow:" & p.parent.parent.Name
    Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
    att.Value = "обязательный"
    Dim ppoint(0 To 1, 0 To 1) As Long
    Dim pcc As CxnOcc
    ppoint(0, 0) = srcObj.x
    ppoint(0, 1) = srcObj.y
    ppoint(1, 0) = trgObj.x
    ppoint(1, 1) = trgObj.y
    Set pcc = mdl.CreateCxnOcc(srcObj, trgObj, CT_HAS_MEMBER, ppoint)
    
    ppoint(0, 0) = trgObj.x
    ppoint(0, 1) = trgObj.y
    ppoint(1, 0) = parent.x
    ppoint(1, 1) = parent.y
    Set pcc = mdl.CreateCxnOcc(trgObj, parent, 508, ppoint)
    Set trgObj = Nothing
  End If
  
  Set clsp = cls
  For i = 1 To p.FIELD.Count
   Set f = p.FIELD.Item(i)
   Set ft = f.FIELDTYPE
   Set cls = cat.CreateObjDef(OT_ERM_ATTR, f.caption, LocaleID)
   
   cls.ModifyGUID Mid(f.id, 2, 36)
   Set trgObj = mdl.CreateObjOcc(155, cls, GetX(mdl), GetY(mdl), True)
   Set att = cls.Attribute(AT_SOURCE, LocaleID)
   att.Value = "FIELD"
   If ft Is Nothing Then
      If f.AllowNull Then
        Set att = cls.Attribute(AT_ID, LocaleID)
        att.Value = f.Name
        Set att = cls.Attribute(AT_DESC, LocaleID)
        att.Value = "тип не известен"
        Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
        att.Value = "не обязательный"
        Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
        att.Value = f.id
      Else
        Set att = cls.Attribute(AT_ID, LocaleID)
        att.Value = f.Name
        Set att = cls.Attribute(AT_DESC, LocaleID)
        att.Value = "Unknown"
        Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
        att.Value = "обязательный"
        Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
        att.Value = f.id
      End If
   Else ' not nothing
   
     If ft.TypeStyle = TypeStyle_Ssilka Then
       If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
       
         ' объект
         If f.RefToType Is Nothing Then
             If f.AllowNull Then
                Set att = cls.Attribute(AT_ID, LocaleID)
                att.Value = f.Name
                Set att = cls.Attribute(AT_DESC, LocaleID)
                att.Value = "Reference:"
                Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
                att.Value = "не обязательный"
                Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
                att.Value = f.id
             Else
                Set att = cls.Attribute(AT_ID, LocaleID)
                att.Value = f.Name
                Set att = cls.Attribute(AT_DESC, LocaleID)
                att.Value = "Reference:"
                Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
                att.Value = "обязательный"
                Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
                att.Value = f.id
            End If
         Else
            If f.AllowNull Then
              Set att = cls.Attribute(AT_ID, LocaleID)
              att.Value = f.Name
              Set att = cls.Attribute(AT_DESC, LocaleID)
              att.Value = "Reference:" & f.RefToType.Name
              Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
              att.Value = "не обязательный"
              Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
              att.Value = f.id
            Else
              Set att = cls.Attribute(AT_ID, LocaleID)
              att.Value = f.Name
              Set att = cls.Attribute(AT_DESC, LocaleID)
              att.Value = "Reference:" & f.RefToType.Name
              Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
              att.Value = "обязательный"
              Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
              att.Value = f.id
            End If
         End If
       Else  ' раздел
         If f.RefToPart Is Nothing Then
           If f.AllowNull Then
             Set att = cls.Attribute(AT_ID, LocaleID)
             att.Value = f.Name
             Set att = cls.Attribute(AT_DESC, LocaleID)
             att.Value = "RefrenceToRow:"
             Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
             att.Value = "не обязательный"
             Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
             att.Value = f.id
           Else
             Set att = cls.Attribute(AT_ID, LocaleID)
             att.Value = f.Name
             Set att = cls.Attribute(AT_DESC, LocaleID)
             att.Value = "RefrenceToRow:"
             Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
             att.Value = "обязательный"
             Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
             att.Value = f.id
           End If
         Else
          If f.AllowNull Then
             Set att = cls.Attribute(AT_ID, LocaleID)
             att.Value = f.Name
             Set att = cls.Attribute(AT_DESC, LocaleID)
             att.Value = "RefrenceToRow:" & f.RefToPart.Name
             Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
             att.Value = "не обязательный"
             Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
             att.Value = f.id
           Else
             Set att = cls.Attribute(AT_ID, LocaleID)
             att.Value = f.Name
             Set att = cls.Attribute(AT_DESC, LocaleID)
             att.Value = "RefrenceToRow:" & f.RefToPart.Name
             Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
             att.Value = "обязательный"
             Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
             att.Value = f.id
           End If
         End If
       End If
     Else
       ' все остальные не ссылочные типы
       If f.AllowNull Then
             Set att = cls.Attribute(AT_ID, LocaleID)
             att.Value = f.Name
             Set att = cls.Attribute(AT_DESC, LocaleID)
             If ft.AllowSize Then
               att.Value = ft.Name & "(" & f.DataSize & ")"
             Else
               att.Value = ft.Name
             End If
             
             Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
             att.Value = "не обязательный"
             Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
             att.Value = f.id
           Else
             Set att = cls.Attribute(AT_ID, LocaleID)
             att.Value = f.Name
             Set att = cls.Attribute(AT_DESC, LocaleID)
             If ft.AllowSize Then
               att.Value = ft.Name & "(" & f.DataSize & ")"
             Else
               att.Value = ft.Name
             End If
             Set att = cls.Attribute(AT_NAME_FULL, LocaleID)
             att.Value = "обязательный"
             Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
             att.Value = f.id
           End If
       End If
   End If
   
   Dim point(0 To 1, 0 To 1) As Long
   point(0, 1) = srcObj.y
   point(1, 1) = trgObj.y
   point(0, 0) = srcObj.x
   point(1, 0) = trgObj.x
   Dim cc As CxnOcc
   Debug.Print srcObj.ObjDef.Name(LocaleID), trgObj.ObjDef.Name(LocaleID)
   
   Set cc = mdl.CreateCxnOcc(srcObj, trgObj, CT_HAS_MEMBER, point)
   mdl.SaveOpenModel
   
  Next
  Set trgObj = Nothing
  
  For j = 1 To p.PART.Count
    FillMTZPart cat, mdl, p.PART.Item(j), srcObj
  Next
  'mdl.BuildGraph True
  Exit Sub
bye:
  MsgBox Err.Description
  Resume
End Sub


Sub FillState(cat As Group, mdl As model, ot As MTZMetaModel.OBJECTTYPE)
  On Error GoTo bye
  Dim j As Long, i As Long, st As MTZMetaModel.OBJSTATUS
  Dim cls As ObjDef
  Dim clsp As ObjDef
  Dim srcObj As ObjOcc
  Dim trgObj As ObjOcc
  Dim att As Attr
  Dim ol As ObjOccList
  
  'mdl.Attribute
  
  For i = 1 To ot.OBJSTATUS.Count
    DoEvents
    If database Is Nothing Then Exit Sub
      
    Set st = ot.OBJSTATUS.Item(i)
    If st.isStartup Then
      Set srcObj = UML_Statechart_diagram_Initial_state(cat, mdl, st.Name)
    ElseIf st.IsArchive Then
      Set srcObj = UML_Statechart_diagram_Final_state(cat, mdl, st.Name)
    Else
      Set srcObj = UML_Statechart_diagram_State(cat, mdl, st.Name)
    End If
    
    Set cls = srcObj.ObjDef
    Set att = cls.Attribute(AT_SOURCE, LocaleID)
    att.Value = "OBJSTATUS"
    Set att = cls.Attribute(AT_ID, LocaleID)
    att.Value = st.Name
    cls.ModifyGUID Mid(st.id, 2, 36)
    Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
    att.Value = st.id
  Next
  
  Dim nxt As OBJSTATUS, k As Long, l As Long
  Dim odl As ObjOccList
  For i = 1 To ot.OBJSTATUS.Count
    DoEvents
    If database Is Nothing Then Exit Sub
    
    Set st = ot.OBJSTATUS.Item(i)
    For k = 0 To mdl.ObjOccList.Count - 1
        Set ol = mdl.ObjOccList
        Set srcObj = ol.Get(k)
        Set cls = srcObj.ObjDef
        If UCase(cls.Guid) = UCase(Mid(st.id, 2, 36)) Then
          Exit For
        End If
        Set srcObj = Nothing
    Next
      
    For j = 1 To st.NEXTSTATE.Count
      Set trgObj = Nothing
      Set nxt = st.NEXTSTATE.Item(j).TheState
      
      For l = 0 To mdl.ObjOccList.Count - 1
        Set ol = mdl.ObjOccList
        Set trgObj = ol.Get(l)
        Set cls = trgObj.ObjDef
        If UCase(cls.Guid) = UCase(Mid(nxt.id, 2, 36)) Then
          Exit For
        End If
        Set trgObj = Nothing
      Next
      Dim point(0 To 1, 0 To 1) As Long
       point(0, 0) = srcObj.x
       point(0, 1) = srcObj.y
       point(1, 0) = trgObj.x
       point(1, 1) = trgObj.y
       
       
       Dim cc As CxnOcc
       If srcObj Is Nothing Or trgObj Is Nothing Then
       Else
        Debug.Print "statelink", st.Name, nxt.Name, srcObj.ObjDef.Name(LocaleID), trgObj.ObjDef.Name(LocaleID)
        Set cc = mdl.CreateCxnOcc(srcObj, trgObj, UML_Statechart_diagram_L_has_transition_to, point)
       End If
       DoEvents
   Next
  Next
  mdl.SaveOpenModel
  Exit Sub
bye:
  MsgBox Err.Description
  'Resume
End Sub



Private Sub FillMtzOrg()
  On Error GoTo bye
  Dim cat As Group
  Dim root As Group
  Dim gl As GroupList
  Dim tcat As Group
  Dim pcat As Group
  Dim org As dir_org
  Dim orgs As dir_.Application
  
  Dim j As Long, i As Long, st As MTZMetaModel.OBJSTATUS
  Dim cls As ObjDef
  Dim clsp As ObjDef
  Dim srcObj As ObjOcc
  Dim trgObj As ObjOcc
  Dim att As Attr
  Dim ol As ObjOccList
  Dim meta As MTZMetaModel.Application
  Dim mdl As model
    
  Set rs = m.ListInstances("", "MTZMetaModel")
  Set meta = m.GetInstanceObject(rs!InstanceID)
  Set rs = m.ListInstances("", "dir_")
  Set orgs = m.GetInstanceObject(rs!InstanceID)
  Set root = database.RootGroup
  
  Set pcat = root.CreateChildGroup("Орг. Структура", LocaleID)
  
  
  
  For i = 1 To orgs.dir_org.Count
      'Form1.pb.Value = i
      Set org = orgs.dir_org.Item(i)
      Set tcat = pcat.CreateChildGroup(org.Name, LocaleID)
      Set mdl = tcat.CreateModel(Organizational_chart, org.Name, LocaleID)
      For j = 1 To org.dir_departments.Count
        FillDepartment tcat, mdl, org.dir_departments.Item(j), Nothing
      Next
      DoEvents
      If database Is Nothing Then Exit For
    Next
    
  Exit Sub
bye:
  MsgBox Err.Description
  'Resume
End Sub

Private Sub FillDepartment(cat As Group, mdl As model, p As dir_departments, parent As ObjOcc)
  Debug.Print cat.Name(LocaleID) & "." & p.depname
  On Error GoTo bye
  Dim j As Long, i As Long
  Dim cls As ObjDef
  Dim clsp As ObjDef
  Dim srcObj As ObjOcc
  Dim trgObj As ObjOcc
  Dim att As Attr
  DoEvents
  If database Is Nothing Then Exit Sub
  
  Set srcObj = Organizational_chart_Organizational_unit(cat, mdl, p.depname)
  Set cls = srcObj.ObjDef
  cls.ModifyGUID Mid(p.id, 2, 36)
  Set att = cls.Attribute(AT_SHORT_DESC, LocaleID)
  att.Value = p.id
    
  If parent Is Nothing Then
  'debug.print 'root part'
  Else
    
    Dim ppoint(0 To 1, 0 To 1) As Long
    Dim pcc As CxnOcc
    ppoint(0, 0) = srcObj.x
    ppoint(0, 1) = srcObj.y
    ppoint(1, 0) = parent.x
    ppoint(1, 1) = parent.y
    Set pcc = mdl.CreateCxnOcc(parent, srcObj, Organizational_chart_L_is_composed_of, ppoint)
    Set trgObj = Nothing
  End If
  
  For j = 1 To p.dir_departments.Count
    FillDepartment cat, mdl, p.dir_departments.Item(j), srcObj
  Next
  
  'mdl.BuildGraph True
  Exit Sub
bye:
  MsgBox Err.Description
  Resume
End Sub


