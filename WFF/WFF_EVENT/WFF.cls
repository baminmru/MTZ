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
  On Error Resume Next
  Dim fnc As WFFR.Application
  Dim dfnc As WFFD.Application
  Set dfnc = deffunc.func
  Set fnc = func.func
  Dim rs As ADODB.Recordset
  Dim q As String
  
  If dfnc Is Nothing Or fnc Is Nothing Then
    CheckState = WFFuncState_Done
    Exit Function
  End If
  If dfnc.WFFD_ATTR1.Count = 0 Then
    CheckState = WFFuncState_Done
    Exit Function
  End If
  
  
  
  Dim i As Long, ok As Boolean
  Dim prevstate As wfdef.enumWFFuncState
  prevstate = fnc.WFFR_func.Item(1).State
  
  q = ""
  If dfnc.WFFD_ATTR1.Item(1).the_Value <> "" Then
    q = q & " VERB='" & dfnc.WFFD_ATTR1.Item(1).the_Value & "'"
  End If
  
  If dfnc.WFFD_ATTR1.Item(1).Value2 <> "" Then
    If q <> "" Then
      q = q & " and "
    End If
    q = q & " LogStructID like '" & dfnc.WFFD_ATTR1.Item(1).Value2 & "'"
  End If
  
  
  If q <> "" Then
      q = q & " and "
  End If
  
  Dim param As WFRtm_Param, ll As String, rr As String
  
  ok = False
  For i = 1 To func.Application.WFRtm_Param.Count
    If func.Application.WFRtm_Param.Item(i).BasedOn Is dfnc.WFFD_ATTR1.Item(1).ProcessParameter3 Then
      Set param = func.Application.WFRtm_Param.Item(i)
      ll = Left(param.the_Value, 38)
      rr = Mid(param.the_Value, 39)
      q = q & "( convert(datetime,convert(varchar(25),ChangeStamp,120),120) >" & MakeMSSQLDate(rr)
      q = q & " or ( convert(datetime,convert(varchar(25),ChangeStamp,120),120) =" & MakeMSSQLDate(rr) & " and SysLogID>'" & ll & "'))"
      ok = True
      Exit For
    End If
  Next
  
  If Not ok Then
    Set param = func.Application.WFRtm_Param.Add
    Set param.BasedOn = dfnc.WFFD_ATTR1.Item(1).ProcessParameter3
    param.the_Value = param.ID & fnc.WFFR_func.Item(1).LastStart
    param.Save
    q = q & " convert(datetime,convert(varchar(25),ChangeStamp,120),120) >=" & MakeMSSQLDate(fnc.WFFR_func.Item(1).LastStart)
  End If
    
  Set rs = func.Application.MTZSession.GetRowsEx("SysLog", , , _
  q, "order by ChangeStamp,SyslogID")
  
  If Not rs Is Nothing Then
    If Not rs.EOF Then
      ok = False
      For i = 1 To func.Application.WFRtm_Param.Count
        If func.Application.WFRtm_Param.Item(i).BasedOn Is dfnc.WFFD_ATTR1.Item(1).ProcessParameter Then
           func.Application.WFRtm_Param.Item(i).the_Value = "{" & rs!Resource & "}"
           func.Application.WFRtm_Param.Item(i).Save
           ok = True
           Exit For
        End If
      Next
      If Not ok Then
        With func.Application.WFRtm_Param.Add
          Set .BasedOn = dfnc.WFFD_ATTR1.Item(1).ProcessParameter
          .the_Value = "{" & rs!Resource & "}"
          .Save
        End With
      End If
      
      ok = False
      For i = 1 To func.Application.WFRtm_Param.Count
        If func.Application.WFRtm_Param.Item(i).BasedOn Is dfnc.WFFD_ATTR1.Item(1).ProcessParameter2 Then
           func.Application.WFRtm_Param.Item(i).the_Value = rs!LogStructID
           func.Application.WFRtm_Param.Item(i).Save
           ok = True
           Exit For
        End If
      Next
      If Not ok Then
        With func.Application.WFRtm_Param.Add
          Set .BasedOn = dfnc.WFFD_ATTR1.Item(1).ProcessParameter2
          .the_Value = rs!LogStructID
          .Save
        End With
      End If
      
      
      param.the_Value = rs!SyslogID & rs!ChangeStamp
      param.Save
      CheckState = WFFuncState_Done
      
    End If
  End If
  rs.Close
  Set rs = Nothing
End Function

Public Sub FinalizeFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.FinalizeFunc func, deffunc
End Sub


Public Sub MakeChildren(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.MakeChildren func, deffunc
End Sub

Public Function RunFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  RunFunc = mWFF.RunFunc(func, deffunc)
End Function



