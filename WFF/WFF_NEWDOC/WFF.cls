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
  
  On Error Resume Next
  Dim fnc As WFFR.Application
  Dim dfnc As WFFD.Application
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
  Dim id As String
  On Error GoTo bye
  
  id = CreateGUID2()
  If Not dfnc.WFFD_ATTR1.Item(1).ProcessDocument Is Nothing Then
    Dim pd As WFDef_Doc
    Set pd = dfnc.WFFD_ATTR1.Item(1).ProcessDocument
    dfnc.Application.Manager.NewInstance id, pd.DocType.Name, pd.DocType.comment & " " & Now
    
    
    Dim doc As Object, i As Long
    For i = 1 To func.Application.WFRtm_Doc.Count
    If func.Application.WFRtm_Doc.Item(i).BasedOn Is pd Then
     Set doc = func.Application.WFRtm_Doc.Item(i).Document
     Exit For
    End If
    Next
    
    If doc Is Nothing Then
      With func.Application.WFRtm_Doc.Add
        Set .BasedOn = dfnc.WFFD_ATTR1.Item(1).ProcessDocument
        Set .Document = dfnc.Application.Manager.GetInstanceObject(id)
        .Save
      End With
      RunFunc = WFFuncState_Done
      Exit Function
    End If
    
    
    
    With doc
      Set .Document = dfnc.Application.Manager.GetInstanceObject(id)
      .Save
    End With
    RunFunc = WFFuncState_Done
  End If
  Exit Function
  
bye:
  RunFunc = WFFuncState_Done
End Function



