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
  On Error Resume Next
  Dim fnc As WFFR.Application
  Dim dfnc As WFFD.Application
  Set dfnc = deffunc.func
  Set fnc = func.func
  Dim rs As ADODB.Recordset
  Dim q As String
  
  CheckState = mWFF.CheckState(func, deffunc)
  On Error Resume Next
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
    If func.Application.WFRtm_Param.Item(i).BasedOn Is dfnc.WFFD_ATTR1.Item(1).ProcessParameter Then
      Set param = func.Application.WFRtm_Param.Item(i)
      ll = Left(param.the_Value, 38)
      rr = Mid(param.the_Value, 39)
      
      If func.Application.MTZSession.IsORACLE Then
        q = q & "( ChangeStamp >" & MakeORACLEDate(rr) & ")"
        q = q & " or ( ChangeStamp =" & MakeORACLEDate(rr) & " and SysLogID>'" & ll & "'))"
      Else
        q = q & "( convert(datetime,convert(varchar(25),ChangeStamp,120),120) >" & MakeMSSQLDate(rr)
        q = q & " or ( convert(datetime,convert(varchar(25),ChangeStamp,120),120) =" & MakeMSSQLDate(rr) & " and SysLogID>'" & ll & "'))"
      End If
      ok = True
      Exit For
    End If
  Next
  
  If Not ok Then
    Set param = func.Application.WFRtm_Param.Add
    Set param.BasedOn = dfnc.WFFD_ATTR1.Item(1).ProcessParameter
    param.the_Value = param.id & fnc.WFFR_func.Item(1).LastStart
    param.Save
    If func.Application.MTZSession.IsORACLE Then
      q = q & " ChangeStamp >=" & MakeORACLEDate(fnc.WFFR_func.Item(1).LastStart)
    Else
      q = q & " convert(datetime,convert(varchar(25),ChangeStamp,120),120) >=" & MakeMSSQLDate(fnc.WFFR_func.Item(1).LastStart)
    End If
  End If
    
  Set rs = func.Application.MTZSession.GetRowsEx("SysLog", , , _
  q, "order by ChangeStamp,SysLogID")
  
  Dim id As String
  
  If Not rs Is Nothing Then
    If Not rs.EOF Then
      ok = False
      For i = 1 To func.Application.WFRtm_Doc.Count
        If func.Application.WFRtm_Doc.Item(i).BasedOn Is dfnc.WFFD_ATTR1.Item(1).ProcessDocument Then
           Set func.Application.WFRtm_Doc.Item(i).Document = func.Application.Manager.GetInstanceObject("{" & rs!Resource & "}")
           func.Application.WFRtm_Doc.Item(i).Save
           ok = True
           Exit For
        End If
      Next
      If Not ok Then
        If Not dfnc.WFFD_ATTR1.Item(1).ProcessDocument Is Nothing Then
          Dim doc As Object
          Set doc = func.Application.WFRtm_Doc.Add
          Set doc.BasedOn = dfnc.WFFD_ATTR1.Item(1).ProcessDocument
          Set doc.Document = func.Application.Manager.GetInstanceObject("{" & rs!Resource & "}")
          doc.Save
          ok = True
        End If
      End If
      
      
      If ok Then
        CheckState = WFFuncState_Done
        param.the_Value = rs!SyslogID & rs!ChangeStamp
        param.Save
      End If
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



