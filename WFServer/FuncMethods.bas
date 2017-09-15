Attribute VB_Name = "FuncMethods"
Option Explicit

Public Function ActivateFunc(func As WFRtm.WFRtm_func, deffunc As WFDef.WFDef_func, wffCol As Collection) As enumWFFuncState
  Dim wff_rtm As Object 'WFF_RTMBASE.WFF
  Dim bt As wffd.Application
  Dim id As String
  On Error GoTo bye
  Set bt = deffunc.func
  id = bt.WFFD_common.Item(1).StepType.id
  Set wff_rtm = wffCol.Item(id).wff_rtm
  ActivateFunc = wff_rtm.ActivateFunc(func, deffunc)
  Exit Function
  
bye:
  Dim wffr As wffr.WFFR_func
  Set wffr = func.func.WFFR_func.Item(1)
  ActivateFunc = wffr.State
End Function


Public Sub MakeChildren(func As WFRtm.WFRtm_func, deffunc As WFDef.WFDef_func, wffCol As Collection)
  Dim wff_rtm As Object 'WFF_RTMBASE.WFF
  Dim bt As wffd.Application
  Dim id As String
  On Error GoTo bye
  Set bt = deffunc.func
  id = bt.WFFD_common.Item(1).StepType.id
  Set wff_rtm = wffCol.Item(id).wff_rtm
  wff_rtm.MakeChildren func, deffunc
  Exit Sub
bye:
End Sub


Public Function RunFunc(func As WFRtm.WFRtm_func, deffunc As WFDef.WFDef_func, wffCol As Collection) As enumWFFuncState
  Dim wff_rtm As Object 'WFF_RTMBASE.WFF
  Dim bt As wffd.Application
  Dim id As String
  On Error GoTo bye
  Set bt = deffunc.func
  id = bt.WFFD_common.Item(1).StepType.id
  Set wff_rtm = wffCol.Item(id).wff_rtm
  RunFunc = wff_rtm.RunFunc(func, deffunc)
  Exit Function
bye:
  Dim wffr As wffr.WFFR_func
  Set wffr = func.func.WFFR_func.Item(1)
  RunFunc = wffr.State
 
End Function


Public Function CheckState(func As WFRtm.WFRtm_func, deffunc As WFDef.WFDef_func, wffCol As Collection) As enumWFFuncState
  Dim wff_rtm As Object 'WFF_RTMBASE.WFF
  Dim bt As wffd.Application
  Dim id As String
  On Error GoTo bye
  Set bt = deffunc.func
  id = bt.WFFD_common.Item(1).StepType.id
  Set wff_rtm = wffCol.Item(id).wff_rtm
  CheckState = wff_rtm.CheckState(func, deffunc)
  Exit Function
bye:
  Dim wffr As wffr.WFFR_func
  Set wffr = func.func.WFFR_func.Item(1)
  CheckState = wffr.State
End Function


Public Sub FinalizeFunc(func As WFRtm.WFRtm_func, deffunc As WFDef.WFDef_func, wffCol As Collection)
  Dim wff_rtm As Object 'WFF_RTMBASE.WFF
  Dim bt As wffd.Application
  Dim id As String
  On Error GoTo bye
  Set bt = deffunc.func
  id = bt.WFFD_common.Item(1).StepType.id
  Set wff_rtm = wffCol.Item(id).wff_rtm
  wff_rtm.FinalizeFunc func, deffunc
  Exit Sub
bye:
End Sub
