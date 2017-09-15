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
  Dim rs As ADODB.Recordset
  
  Dim fnd As MTZSession.Finder
  Dim idout As String, idout2 As String
  Set fnd = fnc.MTZSession.TheFinder
  idout = CreateGUID2
  idout2 = CreateGUID2
  
  ' получили список детей
  Call fnd.FIND_IDS(idout, "WFFR_fparents", "PrevFunc", OpEQ, func.ID)
  fnd.RowsToInstances "WFFR_fparents", idout, idout2
  Set rs = fnd.GetResults(idout2)
  fnd.DropResults idout
  
  Dim col As Collection
  Set col = New Collection
  
  ' получили всех детей - это WFFR
  While Not rs.EOF
    col.Add fnc.Manager.GetInstanceObject(rs!RESULT), rs!RESULT
    rs.MoveNext
  Wend
  rs.Close
  Set rs = Nothing
  fnd.DropResults idout2
  
  Dim checker As WFFR.Application
  
  idout = ""
  For Each checker In col
   Select Case checker.WFFR_func.Item(1).State
   Case WFFuncState_Done
     idout = checker.ID
     Exit For
   Case WFFuncState_InWork
     idout = checker.ID
     Exit For
   Case WFFuncState_InControl
     idout = checker.ID
     Exit For
   Case WFFuncState_Pause
     idout = checker.ID
     Exit For
   Case WFFuncState_Ready
     idout = checker.ID
     Exit For
   Case WFFuncState_Processed
     idout = checker.ID
     Exit For
   End Select
  Next
  If idout = "" Then
    CheckState = mWFF.CheckState(func, deffunc)
    Exit Function
  End If
  For Each checker In col
    If checker.ID <> idout Then
      checker.WFFR_func.Item(1).State = WFFuncState_Processed
      checker.WFFR_func.Item(1).Save
    End If
  Next
  CheckState = WFFuncState_Processed
  
End Function

Public Sub FinalizeFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.FinalizeFunc func, deffunc
End Sub


Public Sub MakeChildren(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.MakeChildren func, deffunc
End Sub

Public Function RunFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  mWFF.MakeChildren func, deffunc
  RunFunc = WFFuncState_InWork
End Function



