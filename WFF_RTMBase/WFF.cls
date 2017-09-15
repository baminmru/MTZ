VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WFF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 10
Option Explicit
'Интерфейс для шага бизнес процесса в режиме исполнения


' Активация функции
'Parameters:
'[IN][OUT]  func , тип параметра: WFRtm.WFRtm_func - ссылка на функцию времени исполнения,
'[IN][OUT]   deffunc , тип параметра: WFDEF.WFDef_func  - ссылка на определение функции
'Returns:
'  объект класса WFDEF.enumWFFuncState
'  ,или Nothing
'See Also:
'  CheckState
'  FinalizeFunc
'  MakeChildren
'  RunFunc
'Example:
' dim variable as WFDEF.enumWFFuncState
' Set variable = me.ActivateFunc(<параметры>)
Public Function ActivateFunc(func As WFRtm.WFRtm_func, deffunc As WFDEF.WFDef_func) As WFDEF.enumWFFuncState
Attribute ActivateFunc.VB_HelpID = 15
  ActivateFunc = WFFuncState_Active
End Function

'Создать дочерние шаги для данного шага
'Parameters:
'[IN][OUT]  func , тип параметра: WFRtm.WFRtm_func - ссылка на функцию времени исполнения,
'[IN][OUT]   deffunc , тип параметра: WFDEF.WFDef_func  - ссылка на определение функции
'See Also:
'  ActivateFunc
'  CheckState
'  FinalizeFunc
'  RunFunc
'Example:
'  call me.MakeChildren(<параметры>)
Public Sub MakeChildren(func As WFRtm.WFRtm_func, deffunc As WFDEF.WFDef_func)
Attribute MakeChildren.VB_HelpID = 30
  Dim child As WFDef_func
  Dim ch_wffd As wffd.Application
  
  Dim lnk As WFDef_links
  Dim i As Long, j As Long
  Dim cfunc As WFRtm_func
  Dim c_wffr As wffr.Application
  Dim maxPass As Long
  Dim curFunc As wffr.Application
  Dim lastFunc As wffr.WFFR_func
  Dim wffr_fnc As wffr.WFFR_func
  Dim cid As String
  Dim Def As WFDEF.Application
  Dim Rtm As WFRtm.Application
  Dim LinkOK As Boolean
  Dim li As Long
  Dim Reuse As Boolean
  On Error GoTo bye
  
  Set Def = deffunc.Application
  Set Rtm = func.Application
  Set curFunc = func.func
  
  
  For i = 1 To Def.WFDef_links.Count
    Set lnk = Def.WFDef_links.Item(i)
    'On Error GoTo nxtlink
    
    ' ищем связь
    If lnk.FromFunction.ID = deffunc.ID Then
      LinkOK = False
      
      ' проверяем условные переходы
      If lnk.AcceptAnyResults Then
        LinkOK = True
      Else
        
        For li = 1 To lnk.WFDef_linkres.Count
          If UCase(curFunc.WFFR_func.Item(1).FuncResult) = UCase(lnk.WFDef_linkres.Item(li).Name) Then
            LinkOK = True
            Exit For
          End If
        Next
      End If
      
      If LinkOK Then
        
        Set child = lnk.ToFunc
        
        'ищем максимальный номер прохода
        maxPass = 0
        For j = 1 To Rtm.WFRtm_func.Count
          Set wffr_fnc = Rtm.WFRtm_func.Item(j).func.WFFR_func.Item(1)
          'wffr_fnc.Refresh
          If wffr_fnc.BasedOn.ID = lnk.ToFunc.ID Then
            
            If maxPass < wffr_fnc.PassNo Then
                Set lastFunc = wffr_fnc
                maxPass = wffr_fnc.PassNo
            End If
            
          End If
        Next
        Reuse = False
        Set ch_wffd = child.func
        
        If ch_wffd.WFFD_common.Item(1).ReuseStep = Boolean_Da And maxPass > 0 Then
          If lastFunc.State = WFFuncState_Active Or lastFunc.State = WFFuncState_InWork Or _
             lastFunc.State = WFFuncState_Prepare Or lastFunc.State = WFFuncState_Initial Or _
             lastFunc.State = WFFuncState_Pause Or lastFunc.State = WFFuncState_InControl Then
            Reuse = True
          Else
            Reuse = False
          End If
          
        Else
          Reuse = False
        End If
        
        If Not Reuse Then
          Set cfunc = Rtm.WFRtm_func.Add()
          
          cid = CreateGUID2
          Call Rtm.Application.Manager.NewInstance(cid, "WFFR", Def.Name & "\" & ch_wffd.WFFD_common.Item(1).Name & ":" & vbCrLf & ch_wffd.WFFD_common.Item(1).TaskDescription & Now)
          Set c_wffr = Rtm.Application.Manager.GetInstanceObject(cid)
          
          
          Set cfunc.func = c_wffr
          cfunc.Save
          
          ' привязываем активную функцию
          Rtm.Application.MTZSession.SetOwner cid, "WFRtm_func", cfunc.ID
          
          
          c_wffr.LockResource False
          With c_wffr.WFFR_func.Add()
            Set .BasedOn = child
            .PassNo = maxPass + 1
            .Priority = ch_wffd.WFFD_common.Item(1).MinPriority
            .State = WFFuncState_Prepare
            .WorkPercent = 0
            .Info = ch_wffd.WFFD_common.Item(1).Name & ":" & vbCrLf & ch_wffd.WFFD_common.Item(1).TaskDescription
            .Save
            With c_wffr.WFFR_fparents.Add()
              Set .PrevFunc = func
              .Save
            End With
          End With
          c_wffr.UnLockResource
        Else
          lastFunc.LockResource False
          If lastFunc.IsLocked = LockSession Then
            With lastFunc.Application.WFFR_fparents.Add
                Set .PrevFunc = func
                .Save
            End With
            lastFunc.UnLockResource
          Else
            Err.Raise 10000, "WFF_RTMBASE.WFF", "Шаг заблокирован, невозможно зарегистрировать повторное использование"
          End If
        End If
      End If 'LinkOK
    End If
nxtlink:
  Next
  Exit Sub
bye:
  Stop
  Resume
End Sub

'Запуск функции
'Parameters:
'[IN][OUT]  func , тип параметра: WFRtm.WFRtm_func,
'[IN][OUT]   deffunc , тип параметра: WFDEF.WFDef_func  - ...
'Returns:
'  объект класса WFDEF.enumWFFuncState
'  ,или Nothing
'See Also:
'  ActivateFunc
'  CheckState
'  FinalizeFunc
'  MakeChildren
'Example:
' dim variable as WFDEF.enumWFFuncState
' Set variable = me.RunFunc(<параметры>)
Public Function RunFunc(func As WFRtm.WFRtm_func, deffunc As WFDEF.WFDef_func) As WFDEF.enumWFFuncState
Attribute RunFunc.VB_HelpID = 35
  Dim wffd As wffd.Application
  Dim wffr As wffr.WFFR_func
  Dim st As WFDic.WFDic_func
  Set wffd = deffunc.func
  
  Set st = wffd.WFFD_common.Item(1).StepType
  Set wffr = func.func.WFFR_func.Item(1)
  
  If st.StepClass = WFStepClass_StartFunction Or st.StepClass = WFStepClass_StopFunction Then
    RunFunc = WFFuncState_Done
  Else
    RunFunc = wffr.State
  End If
  
End Function

'Проверить состояние
'Parameters:
'[IN][OUT]  func , тип параметра: WFRtm.WFRtm_func - ссылка на функцию времени исполнения,
'[IN][OUT]   deffunc , тип параметра: WFDEF.WFDef_func  - ссылка на определение функции
'Returns:
'  объект класса WFDEF.enumWFFuncState
'  ,или Nothing
'See Also:
'  ActivateFunc
'  FinalizeFunc
'  MakeChildren
'  RunFunc
'Example:
' dim variable as WFDEF.enumWFFuncState
' Set variable = me.CheckState(<параметры>)
Public Function CheckState(func As WFRtm.WFRtm_func, deffunc As WFDEF.WFDef_func) As WFDEF.enumWFFuncState
Attribute CheckState.VB_HelpID = 20
  Dim wffr As wffr.WFFR_func
  Dim wffd As wffd.Application
  Dim st As WFDic.WFDic_func
  Set wffd = deffunc.func
  Set st = wffd.WFFD_common.Item(1).StepType
  Set wffr = func.func.WFFR_func.Item(1)

  CheckState = wffr.State
End Function

'завершение функции
'Parameters:
'[IN][OUT]  func , тип параметра: WFRtm.WFRtm_func - ссылка на функцию времени исполнения,
'[IN][OUT]   deffunc , тип параметра: WFDEF.WFDef_func  - ссылка на определение функции
'See Also:
'  ActivateFunc
'  CheckState
'  MakeChildren
'  RunFunc
'Example:
'  call me.FinalizeFunc(<параметры>)
Public Sub FinalizeFunc(func As WFRtm.WFRtm_func, deffunc As WFDEF.WFDef_func)
Attribute FinalizeFunc.VB_HelpID = 25
' do nothing
End Sub


