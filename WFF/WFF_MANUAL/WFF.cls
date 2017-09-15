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

Public Function ActivateFunc(func As wfrtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  ' установить €рлыки
  Dim dprc As wfdef.Application
  Dim prc As wfrtm.Application
  Dim dfnc As WFfd.Application
  Dim fnc As WFFR.Application
  Dim folder As STDInfoStore.folder
  Dim i As Long, j As Long, k As Long
  Dim id As String
  
  Set dfnc = deffunc.func
  If dfnc.WFFD_ShortCut.Count > 0 Then
    Set prc = func.Application
    Set dprc = deffunc.Application
    Set fnc = func.func
    For i = 1 To dfnc.WFFD_ShortCut.Count
      
      For j = 1 To dprc.WFDef_Doc.Count
        ' ищем документ дл€ которого надо создать €рлык
        If UCase(dprc.WFDef_Doc.Item(j).Name) = UCase(dfnc.WFFD_ShortCut.Item(i).DocName) Then
          For k = 1 To prc.WFRtm_Doc.Count
            ' ищем документ. который соответствует ему в процессе
            If prc.WFRtm_Doc.Item(k).BasedOn Is dprc.WFDef_Doc.Item(j) Then
              Set folder = dfnc.WFFD_ShortCut.Item(i).folder
              
              ' создаем документ €рлык в нужной папке
              id = CreateGUID2
              With folder.ShortCut.Add(id)
                Set .DocItem = prc.WFRtm_Doc.Item(k).Document
                .StartMode = dfnc.WFFD_ShortCut.Item(i).StartMode
                .Save
              End With
              
              ' фиксируем, что создан €рлык, чтобы почистить при завершении функции
              With fnc.WFFR_ShortCut.Add
                Set .ShortCut = folder.ShortCut.Item(id)
                Set .BasedOn = dfnc.WFFD_ShortCut.Item(i)
                .Save
              End With
              Exit For
              
            End If
          Next
          Exit For
        End If
      Next
    Next
  
  End If
  
  
  
  
  ActivateFunc = mWFF.ActivateFunc(func, deffunc)
  
  
End Function

Public Function CheckState(func As wfrtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  CheckState = mWFF.CheckState(func, deffunc)
End Function

Public Sub FinalizeFunc(func As wfrtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  ' сн€ть выставленные €рлыки
  Dim fnc As WFFR.Application
  Dim folder As STDInfoStore.folder
  Dim sc As WFfd.WFFD_ShortCut
  Dim i As Long, j As Long, k As Long
  Dim id As Long
  On Error Resume Next
  Set fnc = func.func
  For i = 1 To fnc.WFFR_ShortCut.Count
    Set sc = fnc.WFFR_ShortCut.Item(i).BasedOn
    sc.folder.ShortCut.Delete fnc.WFFR_ShortCut.Item(i).ShortCut.id
  Next
  On Error GoTo bye
  While fnc.WFFR_ShortCut.Count > 0
    fnc.WFFR_ShortCut.Delete 1
  Wend
  
bye:
  mWFF.FinalizeFunc func, deffunc
End Sub


Public Sub MakeChildren(func As wfrtm.WFRtm_func, deffunc As wfdef.WFDef_func)
  mWFF.MakeChildren func, deffunc
End Sub

Public Function RunFunc(func As wfrtm.WFRtm_func, deffunc As wfdef.WFDef_func) As wfdef.enumWFFuncState
  RunFunc = mWFF.RunFunc(func, deffunc)
End Function



