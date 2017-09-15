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

Public Function ActivateFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  ActivateFunc = mWFF.ActivateFunc(func, deffunc)
End Function

Public Function CheckState(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  'CheckState = mWFF.CheckState(func, deffunc)
  Dim fnc As wffr.Application
  Dim dfnc As WFFD.Application
  Set fnc = func.func
  Set dfnc = deffunc.func
  Dim dt As Double
  If fnc.WFFR_func.Item(1).State = WFFuncState_Active Then
    If Val("0" & dfnc.WFFD_ATTR1.Item(1).the_Value) = Year(fnc.Application.MTZSession.GetServerTime()) Then
      CheckState = WFFuncState_Done
    Else
      CheckState = WFFuncState_Active
    End If
  Else
    CheckState = fnc.WFFR_func.Item(1).State
  End If
End Function

Public Sub FinalizeFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.FinalizeFunc func, deffunc
End Sub


Public Sub MakeChildren(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.MakeChildren func, deffunc
End Sub

Public Function RunFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  RunFunc = WFFuncState_Active
End Function



