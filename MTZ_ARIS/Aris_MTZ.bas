Attribute VB_Name = "Aris_MTZ"
Option Explicit
Private meta As MTZMetaModel.Application
Private iis As InfoItems
Private org As dir_.Application
Private grf As MTZGraph.GraphPanel
Private wfdic As wfdic.Application
Private wfd As WFDef.Application

Const WF1_MANUAL = "{D6ADF4FF-AA6B-4280-906E-D4A566CCA7DF}" 'Задание
Const WF1_START = "{4EEBD5F6-4C10-4658-83E0-98BB3DF3ABE4}" 'Старт
Const WF1_STOP = "{6099CDC2-9C8B-4FD0-83EC-69D008DD8B0A}" 'Стоп
Const WF2_AND = "{F5418961-1600-4A7A-B965-A38F943B5D63}" 'Объединение
Const WF2_CONNECTOR = "{6DB61C23-4194-4278-AA20-B976537991AC}" 'Пустой шаг
Const WF2_MAILSTONE = "{B7474AD0-98B6-4AE2-8F4B-3B4987E9BB77}" 'Контрольная точка
Const WF2_XOR = "{18BA1480-9CA6-436E-97C4-C86982CB456A}" 'Альтернатива
Const WF3_CONCAT = "{2398F35E-F97C-49A6-BF25-156F85640627}" 'Слияние
Const WF3_DECVAR = "{EE2888EF-D196-4B02-BF2D-33F3B6ED1BB7}" 'Уменьшить
Const WF3_IF = "{16AF6DAE-B703-4875-B3D9-5264A286AE51}" 'Если переменная = ...
Const WF3_IFN = "{7AF59364-D033-4007-889E-539C22895FAE}" 'Если переменная не = ...
Const WF3_INCVAR = "{F98D98F2-58B0-4DDD-A32A-1AC5DBAD104D}" 'Увеличить
Const WF3_SETVAR = "{CC06B0FE-1C83-42BA-87F2-78FF59DB3C3C}" 'Значение переменных
Const WF3_VARTIME = "{4CA5A853-3206-4E2A-AB22-7F486CC3FAFE}" 'Текущее время
Const WF3_WAITVAR = "{D16611A3-6933-4EFC-8427-8DCD61258995}" 'Ждать значения переменной
Const WF4_ADDROW = "{DD806652-4AC3-4BF2-A60B-5102FFF04F41}" 'Новая строка
Const WF4_DELROW = "{F8DF5680-BDB1-40E2-BC16-111EEB261858}" 'Удалить строку раздела
Const WF4_DOC2VAR = "{BDBA7431-B049-4E03-B064-73210C69252B}" 'Идентификатор документа
Const WF4_DOCROBOT = "{D7532D78-F6AD-4852-B54D-E97517980FAC}" 'Робот обработки документа
Const WF4_DOCSC = "{8F021531-65CA-4991-9C2A-F5C04E925114}" 'Создать ярлык
Const WF4_DOCSTATE = "{7774319B-3F3D-4B5B-BA8A-75E4935F6D88}" 'Ожидание состояния документа
Const WF4_FLDVAR = "{075C3E02-8773-4A7C-9E8E-31A6BD12E96A}" 'Поле = переменая
Const WF4_NEWDOC = "{B840D6D8-0DB3-480E-B7D0-9CD673267CA5}" 'Новый документ
Const WF4_SECURE = "{8B2ACCA3-FBD6-4762-A562-289F3C068B49}" 'Задать права на документ
Const WF4_VARDOC = "{05D65F12-3AD7-4ED2-9098-359DE6D939FB}" 'Документ по идентификатору
Const WF4_VARFLD = "{978BC6EB-EF23-4CE6-ABE3-7BF13A04ABD6}" 'Переменная = поле
Const WF4_VARROWS = "{9F6CDE79-7E87-4EB8-A7EE-9E7DEE458A4D}" 'Количество строк раздела
Const WF4_WAITFLD = "{420D4D99-9AF7-4CCD-8B84-9A9499989891}" 'Пока поле не = ...
Const WF5_DOCPRC = "{A32FF243-76D3-42F6-8B0F-3F908C905E02}" 'Передать документ в процесс
Const WF5_PRCDOC = "{C38DDFC0-49A6-4B40-BED7-D79DCACF6116}" 'Получить документ из процесса
Const WF5_PRCVAR = "{6C8620E3-443D-4901-ADC2-4265D7059F1B}" 'Получить переменную из процесса
Const WF5_PROCESS = "{5B6F1913-5A7E-4C98-A98B-2FF809F643DF}" 'Создать процесс
Const WF5_PROCGO = "{93C7F396-CFD3-416D-B331-6DA340BC3EFA}" 'Запустить процесс
Const WF5_STOPPROC = "{C1E03504-6104-45EA-84ED-DEFCAE19F454}" 'Остановить подпроцесс
Const WF5_VARPRC = "{69729EA0-78C9-40C6-9D64-A79538430143}" 'Передать переменную в процесс
Const WF5_WAITPROC = "{A0C83D5D-D910-4D32-B94B-EB3E2BC96139}" 'Ждать завершения процесса
Const WF6_DOCEVENT = "{6886B1A9-F786-463F-8559-C69410F472D2}" 'Ждать события от документа
Const WF6_EVENT = "{BAFC9631-5BD1-4978-AECD-CF3637CCC210}" 'Ждать события
Const WF6_NEWEVENT = "{5D09BFE7-1524-43A9-8033-3425D9B9A03B}" 'Записать событие в журнал
Const WF6_PULSE = "{74F1E49D-B3DD-4B6F-87EB-0FABFD4BE6F0}" 'Импульс
Const WF6_WAIT = "{742E9D33-1C7B-4D9A-8697-06B9DE82E334}" 'Задержка
Const WF6_WAITDAY = "{03CDD02B-1984-48F3-A218-D2020EB6FB96}" 'Ждать день
Const WF6_WAITHOUR = "{A4CC0F71-9BFD-4C8C-9ABF-1CFDC036C9D7}" 'Ждать часа
Const WF6_WAITMINUTE = "{88DCF849-C1E1-412D-812D-A02DBFD8D317}" 'Ждать минуты
Const WF6_WAITMONTH = "{B394C97C-F7C1-45EA-B173-53E027E91614}" 'Ждать месяц
Const WF6_WAITYEAR = "{0DB5B077-93A1-4925-9E9E-F469D27EA1A8}" 'Ждать год



Public Sub SaveAris2Mtz(mdl As model)
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
  
  If mdl.TypeNum = eEPC Then
    GetArisProcess mdl
  End If
    
  

  m.GetSession(site).Logout
  Set m = Nothing
  Exit Sub
bye:
  MsgBox Err.Description
  Set m = Nothing
  
End Sub

Private Sub GetArisProcess(mdl As model)
On Error GoTo bye
  Dim j As Long
  
  Dim wf As wffd.Application
  Dim startfunc As wffd.Application
  Dim stopfunc As wffd.Application
  Dim arisstart As wffd.Application
  Dim startf As WFDef_func
  Dim stopf As WFDef_func
  Dim arisf As WFDef_func
  Dim wff As WFDef_func
  
  Dim ii As InfoItem
  Dim sii As InfoItem
  Dim tii As InfoItem
  
  
  
  Dim cls As ObjDef
  Dim occ As ObjOcc
  Dim occl As ObjOccList
  Dim cn As Cxn
  Dim cno As CxnOcc
  Dim cnol As CxnOccList
  Dim att As Attr
  Dim attl As AttrList
  
  Dim rs As ADODB.Recordset

  Dim id As String
  
  Set rs = m.ListInstances("", "MTZMetaModel")
  Set meta = m.GetInstanceObject(rs!InstanceID)
  Set rs = m.ListInstances("", "WFDic")
  If rs.RecordCount = 0 Then
   MsgBox "Отсутствует словарь  подсистемы управления процессами"
   Exit Sub
  End If
  Set wfdic = m.GetInstanceObject(rs!InstanceID)
  Set rs = Nothing
  Set rs = m.ListInstances("", "dir_")
  Set org = m.GetInstanceObject(rs!InstanceID)
  
  ' создаем процесс
  id = "{" & mdl.Guid & "}"
  If Not IsGUID(id) Then
    id = CreateGUID2
  End If
  Call m.NewInstance(id, "WFDef", mdl.Name(LocaleID))
  Set wfd = m.GetInstanceObject(id)
  wfd.WFDef_INFO.Add
  With wfd.WFDef_INFO.Item(1)
    Set att = mdl.Attribute(AT_NAME, LocaleID)
    .the_Description = att.Value
    .Diagram = "<GRAPH></GRAPH>"
    .Save
  End With
  
  frmGraph.Show
  Set grf = frmGraph.p
  DoEvents
  
  
  
  ' добавляем старт и конец
  id = CreateGUID2
  m.NewInstance id, "wffd", "Начало"
  
  Set startfunc = m.GetInstanceObject(id)
  With startfunc.WFFD_common.Add
    Set .StepType = wfdic.FindRowObject("WFDic_func", WF1_START)
    .Name = startfunc.Name
    .Save
  End With
  
  Set startf = wfd.WFDef_func.Add
  With startf
    Set .func = startfunc
    .Save
    Call s.SetOwner(startfunc.id, "WFDEF_FUNC", .id)
    grf.NewEntity2 "Начало", 0, WF1_START, 1000, 0, .id, False
  End With
   
  
  
  ' добавляем  конец
  id = CreateGUID2
  m.NewInstance id, "wffd", "Завершение"
  Set stopfunc = m.GetInstanceObject(id)
  With stopfunc.WFFD_common.Add
    Set .StepType = wfdic.FindRowObject("WFDic_func", WF1_STOP)
    .Name = stopfunc.Name
    .Save
  End With
   
   
  Set stopf = wfd.WFDef_func.Add
  With stopf
    Set .func = stopfunc
    .Save
    Call s.SetOwner(stopfunc.id, "WFDEF_FUNC", .id)
    grf.NewEntity2 "Завершение", 0, WF1_STOP, 10000, 0, .id, False
  End With
  
  
  ' добавляем старт после создания документов
  id = CreateGUID2
  m.NewInstance id, "wffd", "Старт процесса"
  Set arisstart = m.GetInstanceObject(id)
  With arisstart.WFFD_common.Add
    Set .StepType = wfdic.FindRowObject("WFDic_func", WF2_MAILSTONE)
    .Name = arisstart.Name
    .Save
  End With
  arisstart.Save
  
  Set arisf = wfd.WFDef_func.Add
  With arisf
    Set .func = arisstart
    .Save
    Call s.SetOwner(arisstart.id, "WFDEF_FUNC", .id)
    grf.NewEntity2 "Старт процесса", 0, WF2_MAILSTONE, 2000, 0, .id, False
  End With
  
    
  
  id = CreateGUID2
  Call grf.GraphInfo.Nodes.Item(startf.id).Edges.Add(id, grf.GraphInfo.Nodes.Item(startf.id), grf.GraphInfo.Nodes.Item(arisf.id))
  With wfd.WFDef_links.Add(id)
    Set .FromFunction = startf
    Set .ToFunc = arisf
    .AcceptAnyResults = Boolean_Da
    .Save
  End With

  
  wfd.WFDef_INFO.Item(1).Diagram = grf.SaveProjectToString
  wfd.WFDef_INFO.Item(1).Save
  grf.ReadProjectFromString wfd.WFDef_INFO.Item(1).Diagram
  DoEvents
  
  ' сканируем все документы
  '  добавляем  документы в список документов процесса
  '  добавляем шаги для создания новых документов
  Dim isdoc As Boolean
  Dim doccnt As Long, i As Long
  Dim OrgUnit As dir_departments
  Set occl = mdl.ObjOccList
  For i = 0 To occl.Count - 1
    isdoc = False
    Set occ = occl.Get(i)
    Set cls = occ.ObjDef
    If IsDocument(occ) Then
      doccnt = doccnt + 1
      id = CreateGUID2
      Dim wfdoc As WFDef_Doc
      Set wfdoc = wfd.WFDef_Doc.Add(id)
      wfdoc.Name = cls.Attribute(AT_NAME, LocaleID).Value
      Set wfdoc.doctype = TypeByName2(cls.Attribute(AT_NAME, LocaleID).Value, meta)
      wfdoc.Save
      
      ' добавляем  создание документа
      id = CreateGUID2
      m.NewInstance id, "wffd", "Создать " & wfdoc.Name
      Set wf = m.GetInstanceObject(id)
      With wf.WFFD_common.Add
        Set .StepType = wfdic.FindRowObject("WFDic_func", WF4_NEWDOC)
        .Name = wf.Name
        .Save
      End With
      
      With wf.WFFD_ATTR1.Add
        Set .ProcessDocument = wfdoc
        .Save
      End With
      
      wf.Save
      Set wff = wfd.WFDef_func.Add
      With wff
        Set .func = wf
        .Save
        Call s.SetOwner(wf.id, "WFDic_func", .id)
        grf.NewEntity2 wf.Name, 0, WF4_NEWDOC, occ.x, occ.y, .id, False
      End With
      
      ' соединяем со стартовым узлом
      id = CreateGUID2
      Call grf.GraphInfo.Nodes.Item(startf.id).Edges.Add(id, grf.GraphInfo.Nodes.Item(startf.id), grf.GraphInfo.Nodes.Item(wff.id))
      With wfd.WFDef_links.Add(id)
        Set .FromFunction = startf
        Set .ToFunc = wff
        .AcceptAnyResults = Boolean_Da
        .Save
      End With
      
      wfd.WFDef_INFO.Item(1).Diagram = grf.SaveProjectToString
      wfd.WFDef_INFO.Item(1).Save
      DoEvents
    End If
    
  Next
  
  '  функции трактуем как ручные шаги
  Set iis = New InfoItems
  For i = 0 To occl.Count - 1
    isdoc = False
    Set occ = occl.Get(i)
    Set cls = occ.ObjDef
    If IsFunction(occ) Then
      
      id = CreateGUID2
           
      Set att = cls.Attribute(AT_NAME, LocaleID)
      Set ii = New InfoItem
      
      ii.ARISGUID = cls.Guid
      
      ' добавляем  функцию в процесс
      id = CreateGUID2
      m.NewInstance id, "wffd", att.Value
      Set wf = m.GetInstanceObject(id)
      Set ii.func = wf
      
      With wf.WFFD_common.Add
        Set .StepType = wfdic.FindRowObject("WFDic_func", WF1_MANUAL)
        .Name = wf.Name
        .Save
      End With
      wf.Save
      Set wff = wfd.WFDef_func.Add
      
      
      Set ii.pfunc = wff
      With wff
        Set .func = wf
        .Save
        Call s.SetOwner(wf.id, "WFDEF_FUNC", .id)
        grf.NewEntity2 wf.Name, 0, WF1_MANUAL, occ.x, occ.y, .id, False
      End With
  
      Debug.Print wf.Name
      '  к началу процесса присоединяются все функции укоторых нет родителя
      ' обрабатываем крайние функции
      If HasInputs(occ) = False Then
        ' соединяем со стартовым узлом
        id = CreateGUID2
        Call grf.GraphInfo.Nodes.Item(arisf.id).Edges.Add(id, grf.GraphInfo.Nodes.Item(arisf.id), grf.GraphInfo.Nodes.Item(wff.id))
        With wfd.WFDef_links.Add(id)
          Set .FromFunction = arisf
          Set .ToFunc = wff
          .AcceptAnyResults = Boolean_Da
          .Save
        End With
      End If
      
      ' к концу присоединяются функции у которой нет выхода
      If HasOutputs(occ) = False Then
        ' соединяем с финальным узлом
        id = CreateGUID2
        Call grf.GraphInfo.Nodes.Item(stopf.id).Edges.Add(id, grf.GraphInfo.Nodes.Item(wff.id), grf.GraphInfo.Nodes.Item(stopf.id))
        With wfd.WFDef_links.Add(id)
          Set .FromFunction = wff
          Set .ToFunc = stopf
          .AcceptAnyResults = Boolean_Da
          .Save
        End With
      End If
      
      
      iis.Add ii, cls.Guid
      
      wfd.WFDef_INFO.Item(1).Diagram = grf.SaveProjectToString
      wfd.WFDef_INFO.Item(1).Save
      DoEvents
    End If
  Next ' функции добавлены в процесс
  
  
  ' учтем блоки управления потоком AND и XOR
  For i = 0 To occl.Count - 1
    isdoc = False
    Set occ = occl.Get(i)
    Set cls = occ.ObjDef
    If IsRule(occ) Then
      
      id = CreateGUID2
           
      Set att = cls.Attribute(AT_NAME, LocaleID)
      Set ii = New InfoItem
      
      ii.ARISGUID = cls.Guid
      
      ' добавляем  функцию в процесс
      id = CreateGUID2
      m.NewInstance id, "wffd", att.Value
      Set wf = m.GetInstanceObject(id)
      Set ii.func = wf
      
      With wf.WFFD_common.Add
        If occ.SymbolNum = 44 Then
          Set .StepType = wfdic.FindRowObject("WFDic_func", WF2_XOR)
        ElseIf occ.SymbolNum = 42 Then
          Set .StepType = wfdic.FindRowObject("WFDic_func", WF2_AND)
        Else
          Set .StepType = wfdic.FindRowObject("WFDic_func", WF2_CONNECTOR)
        End If
        .ReuseStep = Boolean_Da
        .StateCeckInterval = 1
        .AutoCheckState = True
        .Name = wf.Name
        .Save
      End With
      
      wf.Save
      Set wff = wfd.WFDef_func.Add
      
      Set ii.pfunc = wff
      With wff
        Set .func = wf
        .Save
        Call s.SetOwner(wf.id, "WFDEF_FUNC", .id)
        If occ.SymbolNum = 44 Then
          grf.NewEntity2 wf.Name, 0, WF2_XOR, occ.x, occ.y, .id, False
        ElseIf occ.SymbolNum = 42 Then
          grf.NewEntity2 wf.Name, 0, WF2_AND, occ.x, occ.y, .id, False
        Else
          grf.NewEntity2 wf.Name, 0, WF2_CONNECTOR, occ.x, occ.y, .id, False
        End If
      End With
      
      '  к началу процесса присоединяются все функции укоторых нет родителя
      ' обрабатываем крайние функции
      If HasInputs(occ) = False Then
        ' соединяем со стартовым узлом
        id = CreateGUID2
        Call grf.GraphInfo.Nodes.Item(arisf.id).Edges.Add(id, grf.GraphInfo.Nodes.Item(arisf.id), grf.GraphInfo.Nodes.Item(wff.id))
        With wfd.WFDef_links.Add(id)
          Set .FromFunction = arisf
          Set .ToFunc = wff
          .AcceptAnyResults = Boolean_Da
          .Save
        End With
      End If
      
      ' к концу присоединяются функции у которой нет выхода
      If HasOutputs(occ) = False Then
        ' соединяем с финальным узлом
        id = CreateGUID2
        Call grf.GraphInfo.Nodes.Item(stopf.id).Edges.Add(id, grf.GraphInfo.Nodes.Item(wff.id), grf.GraphInfo.Nodes.Item(stopf.id))
        With wfd.WFDef_links.Add(id)
          Set .FromFunction = wff
          Set .ToFunc = stopf
          .AcceptAnyResults = Boolean_Da
          .Save
        End With
      End If
      
      
      iis.Add ii, cls.Guid
      
      wfd.WFDef_INFO.Item(1).Diagram = grf.SaveProjectToString
      wfd.WFDef_INFO.Item(1).Save
      DoEvents
    End If
  Next ' управление потоком добавлено в процесс
  
  
  
  ' теперь пробуем обработать связи между функциями
  Set occl = mdl.ObjOccList
  For i = 0 To occl.Count - 1
    Set occ = occl.Get(i)
    Set cls = occ.ObjDef
    Debug.Print "обрабатываем объект:" & cls.Attribute(AT_NAME, LocaleID).Value
    If IsFunction(occ) Or IsRule(occ) Then
    
      Set cnol = occ.OutEdges(EDGES_ALL)
      For j = 0 To cnol.Count - 1
        Set cno = cnol.Get(j)
        Debug.Print "связь к:" & cno.TargetObjOcc.ObjDef.Attribute(AT_NAME, LocaleID).Value
        
        If IsFunction(occ) Then
          ' если это орг. структура надо добавить ее в исполнителей
          If IsOrgUnit(cno.TargetObjOcc) Then
            Debug.Print "Орг структура"
            Set sii = FindFunc(cls)
            Set OrgUnit = FindDep(org, cno.TargetObjOcc.ObjDef)
            Set wf = sii.func
            If Not OrgUnit Is Nothing Then
              With wf.WFFD_Doer.Add
                Set .DoerGroup = OrgUnit.depgroup
                .Save
              End With
            End If
          End If
          
          ' если это документ надо добавить его в список документов
          If IsDocument(cno.TargetObjOcc) Then
            Debug.Print "Документ"
            Dim Doc As WFDef_Doc
            Set sii = FindFunc(cls)
            Set Doc = FindDoc(wfd, cno.TargetObjOcc.ObjDef)
            Set wf = sii.func
            If Not Doc Is Nothing Then
              With wf.WFFD_DOCS.Add
                Set .ProcessDocument = Doc
                .AllowWrite = Boolean_Da
                .AllowCreate = False
                .Save
              End With
            End If
          End If
        
        End If
        ' если это событие надо добавить его в список возможных результатов
        ' и обработать дальнейшее продвижение по стрелке, как условный переход
        If IsEvent(cno.TargetObjOcc) Then
          Debug.Print "Событие"
          Set sii = FindFunc(cls)
          Set wf = sii.func
          With wf.WFFD_Results.Add
            .Name = cno.TargetObjOcc.ObjDef.Attribute(AT_NAME, LocaleID).Value
            .ResultWeight = 1
            .Save
          End With
          Call LinkConditional(sii, cno.TargetObjOcc)
        End If
        
        ' если это функция
        If IsFunction(cno.TargetObjOcc) Or IsRule(cno.TargetObjOcc) Then
            Debug.Print "Функция"
            Set sii = FindFunc(cls)
            Set tii = FindFunc(cno.TargetObjOcc.ObjDef)
            Debug.Print sii.func.Name, tii.func.Name
            id = CreateGUID2
            'Set wf = sii.func
            Call grf.GraphInfo.Nodes.Item(sii.pfunc.id).Edges.Add( _
            id, grf.GraphInfo.Nodes.Item(sii.pfunc.id), grf.GraphInfo.Nodes.Item(tii.pfunc.id))
            
            With wfd.WFDef_links.Add(id)
              Set .FromFunction = sii.pfunc
              Set .ToFunc = tii.pfunc
              .AcceptAnyResults = Boolean_Da
              .Save
            End With
        End If
      Next
      
      wfd.WFDef_INFO.Item(1).Diagram = grf.SaveProjectToString
      wfd.WFDef_INFO.Item(1).Save
      DoEvents
    End If
  
  Next
  
  ' теперь пробуем обработать привязку к подразделениям
  Set occl = mdl.ObjOccList
  For i = 0 To occl.Count - 1
    Set occ = occl.Get(i)
    Set cls = occ.ObjDef
    If IsOrgUnit(occ) Then
      Debug.Print "обрабатываем объект:" & cls.Attribute(AT_NAME, LocaleID).Value
    
      ' отрабатываем входные связи для подразделений
      Set cnol = occ.OutEdges(EDGES_ALL)
      For j = 0 To cnol.Count - 1
            Set cno = cnol.Get(j)
            Debug.Print "связь к:" & cno.TargetObjOcc.ObjDef.Attribute(AT_NAME, LocaleID).Value
            
            ' если это орг. структура надо добавить ее в исполнителей
            If IsFunction(cno.TargetObjOcc) Then
              Debug.Print "Орг структура"
              Set sii = FindFunc(cno.TargetObjOcc.ObjDef)
              Set OrgUnit = FindDep(org, cls)
              Set wf = sii.func
              If Not OrgUnit Is Nothing Then
                With wf.WFFD_Doer.Add
                  Set .DoerGroup = OrgUnit.depgroup
                  .Save
                End With
              End If
            End If
        
      Next ' cdzpm
    End If
  Next ' подразделения
  
  ' переделываем функции без пользователей на MailStone
  For i = 1 To wfd.WFDef_func.Count
    Set wff = wfd.WFDef_func.Item(i)
    Set wf = wff.func
    With wf.WFFD_common.Item(1)
    If .StepType.id = WF1_MANUAL Then
      If wf.WFFD_Doer.Count = 0 Then
        grf.GraphInfo.Nodes(wff.id).ImageKey = WF2_MAILSTONE
        Set .StepType = wfdic.FindRowObject("WFDic_func", WF2_MAILSTONE)
        .Save
      End If
    End If
    End With
  Next
  wfd.WFDef_INFO.Item(1).Diagram = grf.SaveProjectToString
  wfd.WFDef_INFO.Item(1).Save
  
  MsgBox "Преобразование завершено"
  frmGraph.Hide
  Set grf = Nothing
  Unload frmGraph
  Exit Sub
bye:
  MsgBox Err.Description
   'Resume
End Sub

Private Function HasInputs(socc As ObjOcc) As Boolean
  Dim cnt As Long
  Dim i As Long
  Dim occl As ObjOccList
  Dim occ As ObjOcc
  Dim cls As ObjDef
  Dim tii As InfoItem
  Dim id As String
  Dim cn As Cxn
  Dim cno As CxnOcc
  Dim cnol As CxnOccList
  Set cnol = socc.InEdges(EDGES_ALL)
  For i = 0 To cnol.Count - 1
    Set cno = cnol.Get(i)
    If IsFunction(cno.SourceObjOcc) Or IsRule(cno.SourceObjOcc) Or IsEvent(cno.SourceObjOcc) Then
      HasInputs = True
      Exit For
    End If
  Next
End Function

Private Function HasOutputs(socc As ObjOcc) As Boolean
  Dim cnt As Long
  Dim i As Long
  Dim occl As ObjOccList
  Dim occ As ObjOcc
  Dim cls As ObjDef
  Dim tii As InfoItem
  Dim id As String
  Dim cn As Cxn
  Dim cno As CxnOcc
  Dim cnol As CxnOccList
  Set cnol = socc.OutEdges(EDGES_ALL)
  For i = 0 To cnol.Count - 1
    Set cno = cnol.Get(i)
    If IsFunction(cno.TargetObjOcc) Or IsRule(cno.TargetObjOcc) Or IsEvent(cno.TargetObjOcc) Then
      HasOutputs = True
      Exit For
    End If
  Next
End Function

Private Sub LinkConditional(sii As InfoItem, socc As ObjOcc)
  Dim i As Long
  Dim occl As ObjOccList
  Dim occ As ObjOcc
  Dim cls As ObjDef
  Dim tii As InfoItem
  Dim id As String
  Dim cn As Cxn
  Dim cno As CxnOcc
  Dim cnol As CxnOccList
  Dim lnk As WFDef_links
  Set cnol = socc.OutEdges(EDGES_ALL)
  
  ' нам надо связать то что выходит из события и предшествующую событию функцию
  For i = 0 To cnol.Count - 1
    Set cno = cnol.Get(i)
    Set occ = cno.TargetObjOcc
    Set cls = occ.ObjDef
    
    If IsFunction(occ) Or IsRule(occ) Then
      Set tii = FindFunc(cls)
      id = CreateGUID2
      Call grf.GraphInfo.Nodes.Item(sii.pfunc.id).Edges.Add(id, grf.GraphInfo.Nodes.Item(sii.pfunc.id), grf.GraphInfo.Nodes.Item(tii.pfunc.id))
      Set lnk = wfd.WFDef_links.Add(id)
      With lnk
        Set .FromFunction = sii.pfunc
        Set .ToFunc = tii.pfunc
        .AcceptAnyResults = Boolean_Net
        .Save
        With lnk.WFDef_linkres.Add
          .Name = socc.ObjDef.Attribute(AT_NAME, LocaleID).Value
          .Save
        End With
      End With
    End If
  Next
End Sub


Public Function FindFunc(cls As ObjDef) As InfoItem
Dim i As Long
For i = 1 To iis.Count
If iis.Item(i).Item.ARISGUID = cls.Guid Then
  Set FindFunc = iis.Item(i).Item
Exit Function
End If
Next


End Function



Public Function FindDoc(wfd As WFDef.Application, cls As ObjDef) As WFDef_Doc
Dim i As Long
For i = 1 To wfd.WFDef_Doc.Count
If wfd.WFDef_Doc.Item(i).Name = cls.Attribute(AT_NAME, LocaleID).Value Then
  Set FindDoc = wfd.WFDef_Doc.Item(i)
Exit Function
End If
Next


End Function


Public Function FindDep(org As dir_.Application, cls As ObjDef) As dir_departments
Dim i As Long, j As Long

Dim o As dir_org
Dim n As String
n = UCase(cls.Attribute(AT_NAME, LocaleID).Value)
Dim dep As dir_departments
For i = 1 To org.dir_org.Count
  Set o = org.dir_org.Item(i)
  For j = 1 To o.dir_departments.Count
    Set dep = o.dir_departments.Item(j)
    If UCase(dep.depname) = n Then
      Set FindDep = dep
      Exit Function
    End If
    Set FindDep = FindDep2(dep, cls)
    If Not FindDep Is Nothing Then Exit Function
  Next
Next
End Function

Public Function FindDep2(d As dir_departments, cls As ObjDef) As dir_departments
  Dim j As Long
  Dim n As String
  n = UCase(cls.Attribute(AT_NAME, LocaleID).Value)
  Dim dep As dir_departments
  For j = 1 To d.dir_departments.Count
    Set dep = d.dir_departments.Item(j)
    If UCase(dep.depname) = n Then
      Set FindDep2 = dep
      Exit Function
    End If
    Set FindDep2 = FindDep2(dep, cls)
    If Not FindDep2 Is Nothing Then Exit Function
  Next
  
End Function

Public Function IsDocument(occ As ObjOcc) As Boolean
  Dim isdoc As Boolean
  Dim cls As ObjDef
  isdoc = False
  Set cls = occ.ObjDef
  If cls.TypeNum = 27 Then
    isdoc = True
  End If
  If cls.TypeNum = 17 Then
    isdoc = True
  End If
  If cls.TypeNum = 153 Then
    isdoc = True
  End If
  If cls.TypeNum = 187 Then 'package
    isdoc = True
  End If
  If cls.TypeNum = 58 Then 'technical term
    isdoc = True
  End If
  IsDocument = isdoc
End Function

Public Function IsEvent(occ As ObjOcc) As Boolean
  Dim isdoc As Boolean
  Dim cls As ObjDef
  isdoc = False
  Set cls = occ.ObjDef
  If cls.TypeNum = 18 Then
    isdoc = True
  End If
  IsEvent = isdoc
End Function

Public Function IsFunction(occ As ObjOcc) As Boolean
  Dim isdoc As Boolean
  Dim cls As ObjDef
  isdoc = False
  Set cls = occ.ObjDef
  If cls.TypeNum = 22 Then
    isdoc = True
  End If
  IsFunction = isdoc
End Function

Public Function IsRule(occ As ObjOcc) As Boolean
  Dim isdoc As Boolean
  Dim cls As ObjDef
  isdoc = False
  Set cls = occ.ObjDef
  If cls.TypeNum = 50 Then
    isdoc = True
  End If
  IsRule = isdoc
End Function

Public Function IsOrgUnit(occ As ObjOcc) As Boolean
  Dim isdoc As Boolean
  Dim cls As ObjDef
  isdoc = False
  Set cls = occ.ObjDef
  If cls.TypeNum = 43 Then
    isdoc = True
  End If
  If cls.TypeNum = 44 Then
    isdoc = True
  End If
  If cls.TypeNum = 45 Then
    isdoc = True
  End If
  If cls.TypeNum = 78 Then
    isdoc = True
  End If
  If cls.TypeNum = 153 Then
    isdoc = True
  End If
  If cls.TypeNum = 54 Then
    isdoc = True
  End If
  Debug.Print cls.Attribute(AT_NAME, LocaleID).Value, isdoc
  IsOrgUnit = isdoc
  
End Function


