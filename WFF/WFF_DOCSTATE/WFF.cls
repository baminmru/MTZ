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
  Dim st1 As Object
  Dim st2 As Object
  
  
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
  Dim pd As WFDef_Doc
  Dim doc As Object
  prevstate = fnc.WFFR_func.Item(1).State
  
  
  ' ищем сообщение о статусе
  q = " VERB='STATUS'"
  
  If Not dfnc.WFFD_ATTR1.Item(1).ProcessDocument Is Nothing Then
    Set pd = dfnc.WFFD_ATTR1.Item(1).ProcessDocument
    For i = 1 To func.Application.WFRtm_Doc.Count
    If func.Application.WFRtm_Doc.Item(i).BasedOn Is pd Then
     Set doc = func.Application.WFRtm_Doc.Item(i).Document
     Exit For
    End If
    Next
    
    If doc Is Nothing Then
      CheckState = WFFuncState_Done
      Exit Function
    End If
    
    ' для одного из документов прцесса
    q = q & " and Resource='" & Mid(doc.id, 2, Len(doc.id) - 2) & "'"
  End If
  
  If dfnc.WFFD_ATTR1.Item(1).Value2 <> "" Then
    
    q = q & " and ("
    
    Set st1 = dfnc.WFFD_ATTR1.Item(1).DocState1
    If Not st1 Is Nothing Then
      CheckState = WFFuncState_Done
      Exit Function
    End If
    
    ' нас интересуют только определенные статусы!!!
    q = q & "  LogStructID like '" & Mid(st1.id, 2, Len(st1.id) - 2) & "'"
    
    If Not st2 Is Nothing Then
      Set st2 = dfnc.WFFD_ATTR1.Item(1).DocState2
      ' Для льтернативы может быть заданы другой статус (принят / отклонен)!!!
      q = q & " or  LogStructID like '" & Mid(st2.id, 2, Len(st2.id) - 2) & "'"
    End If
    q = q & " ) "
  End If
  
  
  Dim d1 As Date, d2 As Date
  
  d1 = fnc.WFFR_func.Item(1).LastStateScan
  d2 = fnc.Application.MTZSession.GetServerTime()
    
  q = q & "and ( convert(datetime,convert(varchar(25),ChangeStamp,120),120) >=" & MakeMSSQLDate(d1)
  q = q & "and ( convert(datetime,convert(varchar(25),ChangeStamp,120),120) <" & MakeMSSQLDate(d2)
    
  Set rs = func.Application.MTZSession.GetRowsEx("SysLog", , , _
  q, "order by ChangeStamp,SysLogID")
  fnc.WFFR_func.Item(1).LastStateScan = d2
  fnc.WFFR_func.Item(1).Save
  
  Dim id As String
  
  If Not rs Is Nothing Then
  
    ' Если один из статусов пояился, то мы можем закончить работу
    If Not rs.EOF Then
    
      ' сохраняем результат (название состояния)
      If UCase(rs!Resource) = UCase(Mid(st1.id, 2, Len(st1.id) - 2)) Then
        fnc.Application.WFFR_func.Item(1).FuncResult = st1.Name
        fnc.Application.WFFR_func.Item(1).Save
      End If
      
      If Not st2 Is Nothing Then
        If UCase(rs!Resource) = UCase(Mid(st2.id, 2, Len(st2.id) - 2)) Then
          fnc.Application.WFFR_func.Item(1).FuncResult = st2.Name
          fnc.Application.WFFR_func.Item(1).Save
        End If
      End If
      
      ' функция закончилась
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



