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
  Set dfnc = deffunc.func
  Set fnc = func.func
  Dim prevstate
  prevstate = fnc.WFFR_func.Item(1).State
  If dfnc Is Nothing Or fnc Is Nothing Then
    CheckState = prevstate
    Exit Function
  End If
  If dfnc.WFFD_ATTR1.Count = 0 Then
    CheckState = prevstate
    Exit Function
  End If
  
  On Error GoTo bye
  Dim i As Long
  
  If Not dfnc.WFFD_ATTR1.Item(1).ProcessDocument Is Nothing Then
    Dim pd As WFDef_Doc
    Set pd = dfnc.WFFD_ATTR1.Item(1).ProcessDocument
    Dim doc As Object, partcol As Object
    For i = 1 To func.Application.WFRtm_Doc.Count
    If func.Application.WFRtm_Doc.Item(i).BasedOn Is pd Then
     Set doc = func.Application.WFRtm_Doc.Item(i).Document
    End If
    Next
    
    If doc Is Nothing Then
      CheckState = prevstate
      Exit Function
    End If
    If dfnc.WFFD_ATTR1.Item(1).DocumentPart Is Nothing Then
      CheckState = prevstate
      Exit Function
    End If
    
    Dim Rowid As Long
    Dim varid As Long
    
    For i = 1 To func.Application.WFRtm_Param.Count
      If func.Application.WFRtm_Param.Item(i).BasedOn Is dfnc.WFFD_ATTR1.Item(1).ProcessParameter Then
        Rowid = func.Application.WFRtm_Param.Item(i).the_Value
        Exit For
      End If
    Next
    Dim fval As String
    Set partcol = CallByName(doc, dfnc.WFFD_ATTR1.Item(1).DocumentPart.Name, VbGet)
    If Not partcol Is Nothing Then
       partcol.Refresh
       fval = CallByName(partcol.Item(Rowid), dfnc.WFFD_ATTR1.Item(1).the_Value, VbGet)
       If UCase(fval) = UCase(dfnc.WFFD_ATTR1.Item(1).Value2) Then
         CheckState = WFFuncState_Done
         Exit Function
       End If
    End If
    CheckState = prevstate
  End If
  Exit Function
  
bye:
  CheckState = prevstate
End Function

Public Sub FinalizeFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.FinalizeFunc func, deffunc
End Sub


Public Sub MakeChildren(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.MakeChildren func, deffunc
End Sub

Public Function RunFunc(func As WFRtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  On Error Resume Next
  RunFunc = mWFF.RunFunc(func, deffunc)
End Function



