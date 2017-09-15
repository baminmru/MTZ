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
  CheckState = mWFF.CheckState(func, deffunc)
End Function

Public Sub FinalizeFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.FinalizeFunc func, deffunc
End Sub


Public Sub MakeChildren(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.MakeChildren func, deffunc
End Sub

Public Function RunFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  Dim s As MTZSession.Session
  Set s = func.Application.MTZSession
  Dim dfnc As WFFD.Application
  Dim nvs As NamedValues
  Dim ID As String
  Set dfnc = deffunc.func
  
  On Error Resume Next
  Dim rs As ADODB.Recordset
  Set rs = func.Application.Manager.ListInstances("", "MTZSystem")
  ID = CreateGUID2
  Set nvs = New NamedValues
  Dim iid As String
  iid = rs!InstanceID
  nvs.Add "InstanceID", iid
  nvs.Add "SysLogID", ID
  nvs.Add "TheSession", s.sessionid
  nvs.Add "Resource", func.Application.ID
  nvs.Add "LogStructID", "WFRtm"
  If dfnc.WFFD_ATTR1.Count > 0 Then
    nvs.Add "VERB", dfnc.WFFD_ATTR1.Item(1).the_Value
  Else
    nvs.Add "VERB", "WF_EVENT"
  End If
  
  s.Exec "SysLog_Save", nvs
  rs.Close
  Set rs = Nothing
  RunFunc = WFFuncState_Done
End Function



