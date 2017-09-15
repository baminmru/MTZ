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
Option Explicit

Private mWFF As WFF_RTMBASE.WFF

Private Sub Class_Initialize()
  Set mWFF = New WFF_RTMBASE.WFF
End Sub

Private Sub Class_Terminate()
 Set mWFF = Nothing
End Sub

Public Function ActivateFunc(func As WFRtm.WFRtm_func, deffunc As WFdef.WFDef_func) As WFdef.enumWFFuncState
  ActivateFunc = mWFF.ActivateFunc(func, deffunc)
End Function

Public Function CheckState(func As WFRtm.WFRtm_func, deffunc As WFdef.WFDef_func) As WFdef.enumWFFuncState
  CheckState = mWFF.CheckState(func, deffunc)
End Function

Public Sub FinalizeFunc(func As WFRtm.WFRtm_func, deffunc As WFdef.WFDef_func)
  mWFF.FinalizeFunc func, deffunc
End Sub


Public Sub MakeChildren(func As WFRtm.WFRtm_func, deffunc As WFdef.WFDef_func)
  mWFF.MakeChildren func, deffunc
End Sub

Public Function RunFunc(func As WFRtm.WFRtm_func, deffunc As WFdef.WFDef_func) As WFdef.enumWFFuncState
  On Error Resume Next
  Dim fnc As WFFR.Application
  Dim dfnc As WFFD.Application
  
  Dim prc As WFRtm.Application
  Dim prc2 As WFRtm.Application
  
  Set dfnc = deffunc.func
  Set fnc = func.func
  
  If dfnc Is Nothing Or fnc Is Nothing Then
    RunFunc = WFFuncState_Done
    Exit Function
  End If
  If dfnc.WFFD_ATTR1.Count = 0 Then
    RunFunc = WFFuncState_Done
    Exit Function
  End If
  
  On Error GoTo bye
  Dim i As Long, id As String, j As Long
    
  Set prc = func.Application
  For i = 1 To prc.WFRTM_SUBPROCESS.Count
    If UCase(dfnc.WFFD_ATTR1.Item(1).the_Value) = UCase(prc.WFRTM_SUBPROCESS.Item(i).Name) Then
     Set prc2 = prc.WFRTM_SUBPROCESS.Item(i).Process
     Exit For
    End If
  Next
  
  If prc2 Is Nothing Then
    RunFunc = WFFuncState_Done
    Exit Function
  End If
  
  If dfnc.WFFD_ATTR1.Item(1).ProcessParameter Is Nothing Then
    RunFunc = WFFuncState_Done
    Exit Function
  End If
  
  For i = 1 To prc2.WFRtm_Param.Count
    If UCase(prc2.WFRtm_Param.Item(i).BasedOn.Name) = UCase(dfnc.WFFD_ATTR1.Item(1).Value2) Then
      For j = 1 To prc.WFRtm_Param.Count
        If dfnc.WFFD_ATTR1.Item(1).ProcessParameter Is prc.WFRtm_Param.Item(j).BasedOn Then
          prc.WFRtm_Param.Item(j).the_Value = prc2.WFRtm_Param.Item(i).the_Value
          prc.WFRtm_Param.Item(j).Save
          RunFunc = WFFuncState_Done
          Exit Function
        End If
      Next
    End If
  Next
  RunFunc = WFFuncState_Done
  Exit Function
  
bye:
  RunFunc = WFFuncState_Done
End Function



