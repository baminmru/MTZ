VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Server"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 10
Option Explicit


Private dic As WFDic.Application
Private Def As WFDef.Application
Private Rtm As WFRtm.Application
Private Site As String
Private Manager As MTZManager.Main
Private Session As MTZSession.Session
Private funcCol As Collection
Private UserID As String
Private LOG As String
Private wffCol As Collection
Private Attached As Boolean


'Подключить сервер к сесии
'Parameters:
'[IN][OUT]  aManager , тип параметра: MTZManager.Main - менеджер объектов,
'[IN][OUT]   aSession , тип параметра: MTZSession.Session  -открытая сессия
'See Also:
'  ClearLog
'  Detach
'  OneStep
'  ProcessStep
'Example:
'  call me.Attach(<параметры>)
Public Sub Attach(aManager As MTZManager.Main, aSession As MTZSession.Session)
Attribute Attach.VB_HelpID = 15
  Set Manager = aManager
  Set Session = aSession
  Dim rs As ADODB.Recordset
  
  Set rs = Manager.ListInstances(Site, "WFDic")
  If rs.EOF Then
    Err.Raise 10000, "WFServer.Server.Attach", "отсутствует справочник системы управления проессами"
    Exit Sub
  End If
  Set dic = Manager.GetInstanceObject(rs!InstanceID, Site)
  Set wffCol = New Collection
  Dim fcl As FuncHolder, i As Long
  For i = 1 To dic.WFDic_func.Count
    Set fcl = New FuncHolder
    fcl.FuncType = dic.WFDic_func.Item(i).id
    If dic.WFDic_func.Item(i).RTMProgID = "" Then
      Set fcl.wff_rtm = CreateObject("WFF_RTMBASE.WFF")
    Else
      
      On Error Resume Next
      Set fcl.wff_rtm = CreateObject(dic.WFDic_func.Item(i).RTMProgID)
      If Err.Number > 0 Then
        Set fcl.wff_rtm = CreateObject("WFF_RTMBASE.WFF")
      End If
    End If
    wffCol.Add fcl, fcl.FuncType
  Next
  Set rs = Nothing
  Attached = True
End Sub
'Отключиться от сесии
'Parameters:
' параметров нет
'See Also:
'  Attach
'  ClearLog
'  OneStep
'  ProcessStep
'Example:
'  call me.Detach()
Public Sub Detach()
Attribute Detach.VB_HelpID = 25
 ' отпускаем все функции
  Attached = False
  Set wffCol = Nothing
  Set Session = Nothing
  Set dic = Nothing
  Set Rtm = Nothing
  Set Def = Nothing
  Set Manager = Nothing
End Sub

'Сбросить накопленные сообщения от сервера
'Parameters:
' параметров нет
'See Also:
'  Attach
'  Detach
'  OneStep
'  ProcessStep
'Example:
'  call me.ClearLog()
Public Sub ClearLog()
Attribute ClearLog.VB_HelpID = 20
  LOG = ""
End Sub
'Сделать один цикл для конкретного процесса
'Parameters:
'[IN][OUT]  ProcessID , тип параметра: String  - идентификатор процесса
'Returns:
'  значение типа String - лог исполнения
'See Also:
'  Attach
'  ClearLog
'  Detach
'  OneStep
'Example:
' dim variable as String
' variable = me.ProcessStep(<параметры>)
Public Function ProcessStep(ProcessID As String) As String
Attribute ProcessStep.VB_HelpID = 35
    Dim fnc As wffr.Application, i As Long
    
    If Not Attached Then
      LOG = LOG & vbCrLf & "Сервер не инициализирован"
      ProcessStep = LOG
      Exit Function
    End If
    Set Rtm = Manager.GetInstanceObject(ProcessID, Session.Site)
    Rtm.WFRtm_main.Refresh
    If Rtm.WFRtm_main(True).Count = 1 Then
      Set Def = Rtm.WFRtm_main.Item(1).BasedOn
      If Rtm.WFRtm_main.Item(1).ProcessState <> WFProcessState_Initial And Rtm.WFRtm_main.Item(1).ProcessState <> WFProcessState_Processed Then
        Rtm.LockResource True
        
        If Rtm.IsLocked = LockPermanent Then
          If Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Prepare Then
            ' init new process (init start functions)
            ScanA
          End If
          
          
          Dim pull As Collection
          Dim fh As FuncHolder
          Set pull = New Collection
          For i = 1 To Rtm.WFRtm_func.Count
           Set fnc = Rtm.WFRtm_func.Item(i).func
           If fnc.WFFR_func(True).Item(1).State <> WFFuncState_Processed Then
             pull.Add Rtm.WFRtm_func.Item(i)
           End If
          Next
          
          
          If Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Active Then
            ' Step forward
            ScanB
            ' periodic check
            ' status check
            ' increment priority
            'ScanC
            ' check stops
            ScanD
          End If
          
          Dim func As WFRtm.WFRtm_func
          
          ' если функция завершена в этом проходе - надо ее финализировать
          For Each func In pull
           If func.func.WFFR_func(True).Item(1).State = WFFuncState_Processed Then
             FinalizeFunc func, func.func.WFFR_func(True).Item(1).BasedOn, wffCol
           End If
          Next
          Set pull = Nothing
          
          If Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Done Then
            ' finalize
            ScanE
          End If
          
          If Rtm.WFRtm_main.Item(1).ProcessState <> WFProcessState_Processed Then
            LOG = VarDump & vbCrLf & LOG
          End If
          Rtm.UnLockResource
        Else
          LOG = "Данные процесса заблокированы " & Def.Name & vbCrLf & LOG
        End If 'lock
      End If ' live process
    End If ' no main
    ProcessStep = LOG
End Function

Private Function VarDump() As String
  Dim s As String
  Dim i As Long
  Dim vv As WFDef.WFDef_param
  For i = 1 To Rtm.WFRtm_Param.Count
    Set vv = Rtm.WFRtm_Param.Item(i).BasedOn
    s = s & "Параметр:" & vv.Name & "=" & Rtm.WFRtm_Param.Item(i).the_Value & vbCrLf
  Next
  VarDump = s
End Function
'Сделать один цикл всех активных процессов
'Parameters:
' параметров нет
'Returns:
'  значение типа String - лог исполнения
'See Also:
'  Attach
'  ClearLog
'  Detach
'  ProcessStep
'Example:
' dim variable as String
'  variable = me.OneStep()
Public Function OneStep() As String
Attribute OneStep.VB_HelpID = 30
  If Not Attached Then
    LOG = "Сервер не инициализирован"
    OneStep = LOG
    Exit Function
  End If
  
  LOG = "Начало прохода " & Now
  Dim rs As ADODB.Recordset
  Dim i As Long, j As Long, k As Long
  Set rs = Manager.ListInstances(Site, "WFRtm")
  While Not rs.EOF
   
    ProcessStep (rs!InstanceID)
    rs.MoveNext
  Wend
  LOG = "Завершение прохода " & Now & vbCrLf & LOG
  OneStep = LOG
End Function


Private Sub ScanA()
  Dim i As Long, j As Long, k As Long
  Dim fnc As WFRtm.WFRtm_func
  Dim dfnc As WFDef.WFDef_func
  Dim wffd As wffd.Application
  Dim wkr As wffd.WFFD_Doer
  Dim wffr_fnc As wffr.WFFR_func
  Dim st As WFDic.WFDic_func
  Dim id As String
  
    
    For i = 1 To Def.WFDef_func.Count
      Set dfnc = Def.WFDef_func.Item(i)
      Set wffd = dfnc.func
      Set st = wffd.WFFD_common.Item(1).StepType
      If st.StepClass = WFStepClass_StartFunction Then
        Set fnc = Rtm.WFRtm_func.Add()
        id = CreateGUID2
        Manager.NewInstance id, "WFFR", Def.Name & "." & wffd.WFFD_common.Item(1).Name & ":" & Rtm.MTZSession.GetServerTime
        Set fnc.func = Manager.GetInstanceObject(id)
        fnc.Save
        
        
        Set wffr_fnc = fnc.func.WFFR_func.Add

        With wffr_fnc
          Set .BasedOn = dfnc
          .Priority = wffd.WFFD_common.Item(1).MinPriority
          .State = WFFuncState_Prepare
          .PassNo = 1
          .WorkPercent = 0
          .Save
          LOG = "Создано стартовое задание" & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & .PassNo & vbCrLf & LOG
        End With
        Session.SetOwner id, "WFFR_func", wffr_fnc.id
      End If
    Next
    ' save new status
    Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Active
    LOG = "Активирован процесс " & Def.Name & vbCrLf & LOG
    Rtm.WFRtm_main.Item(1).Save
End Sub

'Step forward
Private Sub ScanB()
  Dim i As Long, j As Long, k As Long
  Dim fnc As WFRtm.WFRtm_func
  Dim dfnc As WFDef.WFDef_func
  Dim wffd As wffd.Application
  Dim wkr As wffd.WFFD_Doer
  Dim wffr_fnc As wffr.WFFR_func
  Dim st As WFDic.WFDic_func
  Dim mustsave As Boolean
  
  Rtm.WFRtm_func.Refresh
    For i = 1 To Rtm.WFRtm_func.Count
      Set fnc = Rtm.WFRtm_func.Item(i)
      Set wffr_fnc = fnc.func.WFFR_func.Item(1)
      wffr_fnc.Refresh
      Set dfnc = wffr_fnc.BasedOn
      Set wffd = dfnc.func
      Set st = wffd.WFFD_common.Item(1).StepType
      
      If wffr_fnc.State <> WFFuncState_Processed And wffr_fnc.State <> WFFuncState_Pause And wffr_fnc.State <> WFFuncState_Initial Then
        mustsave = False
        wffr_fnc.LockResource True
        If wffr_fnc.IsLocked = LockPermanent Then
          
          ' Вообще говоря не понятно может ли функция долго оставаться в таком состоянии ...
          If wffr_fnc.State = WFFuncState_Prepare Then
            LOG = "Активация задания " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
            wffr_fnc.State = ActivateFunc(fnc, dfnc, wffCol)
            mustsave = True
          End If
          
          
          ' Запускаем если пора
          If wffr_fnc.State = WFFuncState_Active Then
            If st.StepClass = WFStepClass_PeriodicFunction Then
              If wffr_fnc.LastStart + wffd.WFFD_common.Item(1).ReStartInterval / 1440 < Rtm.MTZSession.GetServerTime Then
                LOG = "Запуск задания " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
                wffr_fnc.State = RunFunc(fnc, dfnc, wffCol)
                wffr_fnc.LastStart = Rtm.MTZSession.GetServerTime
                mustsave = True
              End If
            Else
              If wffr_fnc.LastStart = CDate(0) Then
                LOG = "Запуск задания " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
                wffr_fnc.State = RunFunc(fnc, dfnc, wffCol)
                wffr_fnc.LastStart = Rtm.MTZSession.GetServerTime
                mustsave = True
              End If
            End If
          End If
          
          ' продвигаем процесс вперед
          If wffr_fnc.State = WFFuncState_Done Then
            On Error GoTo unsuccessful_shift
            Call MakeChildren(fnc, dfnc, wffCol)
            On Error Resume Next
            LOG = "Созданы дочерние задания для задания " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
            If st.StepClass <> WFStepClass_StopFunction Then
              wffr_fnc.State = WFFuncState_Processed
              LOG = "Задание окончательно обработано " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & vbCrLf & LOG
            End If
unsuccessful_shift:
          
            mustsave = True
          End If
          
          
          
        ' periodic check
        If st.StepClass = WFStepClass_PeriodicFunction Then
          If wffr_fnc.State = WFFuncState_Active Then
            If wffr_fnc.LastStart + wffd.WFFD_common.Item(1).ReStartInterval / 1440 < Rtm.MTZSession.GetServerTime Then
              LOG = "Запущено периодическое задание " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
              wffr_fnc.State = RunFunc(fnc, dfnc, wffCol)
              wffr_fnc.LastStart = Rtm.MTZSession.GetServerTime
              mustsave = True
            End If
          End If
        End If
          
        
        If _
          wffr_fnc.State = WFFuncState_Active Or _
          wffr_fnc.State = WFFuncState_InWork Or _
          wffr_fnc.State = WFFuncState_Pause Or _
          wffr_fnc.State = WFFuncState_Ready Or _
          wffr_fnc.State = WFFuncState_InControl _
        Then
          If wffd.WFFD_common.Item(1).AutoCheckState = Boolean_Da Then
            If wffr_fnc.LastStateScan + wffd.WFFD_common.Item(1).StateCeckInterval / 1440 < Rtm.MTZSession.GetServerTime Then
              wffr_fnc.State = CheckState(fnc, dfnc, wffCol)
              LOG = "Проверка состояния задания " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
              wffr_fnc.LastStateScan = Rtm.MTZSession.GetServerTime
              mustsave = True
            End If
          End If
          
          If wffd.WFFD_common.Item(1).GrowPriorityInterval <> 0 And wffd.WFFD_common.Item(1).IncPriority <> 0 Then
            If wffr_fnc.ChangePriorityTime + wffd.WFFD_common.Item(1).GrowPriorityInterval / 1440 < Rtm.MTZSession.GetServerTime Then
              wffr_fnc.Priority = wffr_fnc.Priority + wffd.WFFD_common.Item(1).IncPriority
              If wffr_fnc.Priority > wffd.WFFD_common.Item(1).MaxPriority Then
                wffr_fnc.Priority = wffd.WFFD_common.Item(1).MaxPriority
              End If
              wffr_fnc.ChangePriorityTime = Rtm.MTZSession.GetServerTime
              LOG = "Регистрация прироста приоритета задания " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
              mustsave = True
            End If
          End If
        End If
        If mustsave Then
            wffr_fnc.Save
        End If
        wffr_fnc.UnLockResource
        
      Else
        LOG = "Задание заблокировано " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
      End If
     End If
    Next
End Sub


' periodic check
' status check
' increment priority
Private Sub ScanC()
Dim i As Long, j As Long, k As Long
  Dim fnc As WFRtm.WFRtm_func
  Dim dfnc As WFDef.WFDef_func
  Dim wkr As wffd.WFFD_Doer
  Dim st As WFDic.WFDic_func
  Dim wffd As wffd.Application
  Dim wffr_fnc As wffr.WFFR_func
  
  Rtm.WFRtm_func.Refresh
    For i = 1 To Rtm.WFRtm_func.Count
      Set fnc = Rtm.WFRtm_func.Item(i)
      Set wffr_fnc = fnc.func.WFFR_func.Item(1)
      wffr_fnc.Refresh
      Set dfnc = wffr_fnc.BasedOn
      Set wffd = dfnc.func
      Set st = wffd.WFFD_common.Item(1).StepType
      
      wffr_fnc.LockResource True
      If wffr_fnc.IsLocked = LockPermanent Then
        
        ' periodic check
        If st.StepClass = WFStepClass_PeriodicFunction Then
          If wffr_fnc.State = WFFuncState_Active Then
            If wffr_fnc.LastStart + wffd.WFFD_common.Item(1).ReStartInterval / 1440 < Rtm.MTZSession.GetServerTime Then
              LOG = "Запущено периодическое задание " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
              wffr_fnc.State = RunFunc(fnc, dfnc, wffCol)
              wffr_fnc.LastStart = Rtm.MTZSession.GetServerTime
              wffr_fnc.Save
            End If
          End If
        End If
          
        If _
          wffr_fnc.State = WFFuncState_Active Or _
          wffr_fnc.State = WFFuncState_InWork Or _
          wffr_fnc.State = WFFuncState_Pause Or _
          wffr_fnc.State = WFFuncState_Ready Or _
          wffr_fnc.State = WFFuncState_InControl _
        Then
          If wffr_fnc.LastStateScan + wffd.WFFD_common.Item(1).StateCeckInterval / 1440 < Rtm.MTZSession.GetServerTime Then
            wffr_fnc.State = CheckState(fnc, dfnc, wffCol)
            LOG = "Проверка состояния задания " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
            wffr_fnc.LastStateScan = Rtm.MTZSession.GetServerTime
            wffr_fnc.Save
          End If
          
          If wffd.WFFD_common.Item(1).GrowPriorityInterval <> 0 And wffd.WFFD_common.Item(1).IncPriority <> 0 Then
            If wffr_fnc.ChangePriorityTime + wffd.WFFD_common.Item(1).GrowPriorityInterval / 1440 < Rtm.MTZSession.GetServerTime Then
              wffr_fnc.Priority = wffr_fnc.Priority + wffd.WFFD_common.Item(1).IncPriority
              If wffr_fnc.Priority > wffd.WFFD_common.Item(1).MaxPriority Then
                wffr_fnc.Priority = wffd.WFFD_common.Item(1).MaxPriority
              End If
              wffr_fnc.ChangePriorityTime = Rtm.MTZSession.GetServerTime
              LOG = "Регистрация прироста приоритета задания " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
              wffr_fnc.Save
            End If
          End If
        End If
        wffr_fnc.UnLockResource
     Else
        LOG = "Задание заблокировано " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
     End If
    Next
End Sub


Private Sub ScanD()
  Dim i As Long, j As Long, k As Long
  Dim fnc As WFRtm.WFRtm_func
  Dim dfnc As WFDef.WFDef_func
  Dim wkr As wffd.WFFD_Doer
  Dim st As WFDic.WFDic_func
  Dim wffd As wffd.Application
  Dim wffr_fnc As wffr.WFFR_func
  Dim processDone As Boolean
  
    processDone = False
    Rtm.WFRtm_func.Refresh
    For i = 1 To Rtm.WFRtm_func.Count
      Set fnc = Rtm.WFRtm_func.Item(i)
      Set wffr_fnc = fnc.func.WFFR_func.Item(1)
      wffr_fnc.Refresh
      Set dfnc = wffr_fnc.BasedOn
      Set wffd = dfnc.func
      Set st = wffd.WFFD_common.Item(1).StepType
      If wffr_fnc.State = WFFuncState_Done And st.StepClass = WFStepClass_StopFunction Then
        processDone = True
        Exit For
      End If
    Next
    If processDone Then
      LOG = "Процесс закончен " & Def.Name & vbCrLf & LOG
      Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Done
      Rtm.WFRtm_main.Item(1).Save
    End If

End Sub

Private Sub ScanE()
  Dim i As Long, j As Long, k As Long
  Dim fnc As WFRtm.WFRtm_func
  Dim dfnc As WFDef.WFDef_func
  Dim wffd As wffd.Application
  Dim wffr_fnc As wffr.WFFR_func
  Dim isOk As Boolean
    isOk = True
    Rtm.WFRtm_func.Refresh
    For i = 1 To Rtm.WFRtm_func.Count
        Set fnc = Rtm.WFRtm_func.Item(i)
        Set wffr_fnc = fnc.func.WFFR_func.Item(1)
        wffr_fnc.Refresh
        Set dfnc = wffr_fnc.BasedOn
        Set wffd = dfnc.func
        wffr_fnc.LockResource True
        
        If wffr_fnc.IsLocked = LockPermanent Then
          If wffr_fnc.State <> WFFuncState_Processed Then
            LOG = "Обработка окончательного завершения задания " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
            FinalizeFunc fnc, dfnc, wffCol
            wffr_fnc.State = WFFuncState_Processed
            wffr_fnc.Save
          End If
          wffr_fnc.UnLockResource
        Else
            LOG = "Задание заблокировано " & Def.Name & "." & wffd.WFFD_common.Item(1).Name & " проход:" & wffr_fnc.PassNo & vbCrLf & LOG
            isOk = False
        End If
    Next
    If isOk Then
      If Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Done Then
        LOG = "Процесс окончательно обработан " & Def.Name & vbCrLf & LOG
        Rtm.WFRtm_main.Item(1).ProcessState = WFProcessState_Processed
        Rtm.WFRtm_main.Item(1).Save
      End If
    End If
End Sub


Private Sub Class_Terminate()
  Detach
End Sub
