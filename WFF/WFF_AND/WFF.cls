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
  Dim fnc As WFFR.Application
  Dim dfnc As WFFD.Application
  Set fnc = func.func
  Dim i As Long, j As Long
  Set dfnc = deffunc.func
  Dim cnt As Long
  
  ' считаем сколько у нас входящих связей
  For i = 1 To deffunc.Application.WFDef_links.Count
    If deffunc.Application.WFDef_links.Item(i).ToFunc.ID = deffunc.ID Then
     cnt = cnt + 1
    End If
  Next
  
  ' можно попробывать  сравнить просто с количеством родителей
  If cnt = fnc.WFFR_fparents.Count Then
    CheckState = WFFuncState_Done
    Exit Function
  End If
  CheckState = mWFF.CheckState(func, deffunc)
End Function

Public Sub FinalizeFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.FinalizeFunc func, deffunc
End Sub


Public Sub MakeChildren(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.MakeChildren func, deffunc
End Sub

Public Function RunFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  RunFunc = WFFuncState_InWork
End Function



