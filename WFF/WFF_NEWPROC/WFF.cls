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

Public Function ActivateFunc(func As WFRtm.WFRtm_func, deffunc As WFdef.WFDef_func) As WFdef.enumWFFuncState
  ActivateFunc = mWFF.ActivateFunc(func, deffunc)
End Function

Public Function CheckState(func As WFRtm.WFRtm_func, deffunc As WFdef.WFDef_func) As WFdef.enumWFFuncState
  CheckState = mWFF.CheckState(func, deffunc)
End Function

Public Sub FinalizeFunc(func As WFRtm.WFRtm_func, deffunc As WFdef.WFDef_func)
  mWFF.FinalizeFunc func, deffunc
End Sub


Public Sub MakeChildren(func As WFRtm.WFRtm_func, deffunc As WFdef.WFDef_func)
  mWFF.MakeChildren func, deffunc
End Sub

Public Function RunFunc(func As WFRtm.WFRtm_func, deffunc As WFdef.WFDef_func) As WFdef.enumWFFuncState
  On Error Resume Next
  Dim fnc As WFFR.Application
  Dim dfnc As WFFD.Application
  Dim dprc As WFdef.Application
  Dim prc As WFRtm.Application
  
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
  
  On Error GoTo bye
  Dim i As Long, id As String, ok As Boolean
  
  If Not dfnc.WFFD_ATTR1.Item(1).SubProcessType Is Nothing Then
    Set dprc = dfnc.WFFD_ATTR1.Item(1).SubProcessType
    
    ' создаем новый процесс
    id = CreateGUID2
    dfnc.Manager.NewInstance id, "WFRtm", "Подпроцесс для:" & func.Application.Name & " Шаг:" & dfnc.WFFD_common.Item(1).Name & " Проход:" & fnc.WFFR_func.Item(1).PassNo & " " & Now
    Set prc = dfnc.Manager.GetInstanceObject(id)
    With prc.WFRtm_main.Add
     Set .BasedOn = dprc
     .the_Description = "Подпроцесс для:" & func.Application.Name & " Шаг:" & dfnc.WFFD_common.Item(1).Name & " Проход:" & fnc.WFFR_func.Item(1).PassNo & " " & Now
     .ProcessState = WFProcessState_Initial
     .Save
    End With
    
    ok = False
    For i = 1 To func.Application.WFRTM_SUBPROCESS.Count
      If UCase(func.Application.WFRTM_SUBPROCESS.Item(i).Name) = UCase(dfnc.WFFD_ATTR1.Item(1).the_Value) Then
        Set func.Application.WFRTM_SUBPROCESS.Item(i).Process = prc
        func.Application.WFRTM_SUBPROCESS.Item(i).Save
        ok = True
        Exit For
      End If
    Next
    
    If ok = False Then
      ' регистрируем подпроцесс для работы с ним
      With func.Application.WFRTM_SUBPROCESS.Add
       Set .Process = prc
       .Name = dfnc.WFFD_ATTR1.Item(1).the_Value
       .Save
      End With
    End If
    
    ' создаем места под переменные
    For i = 1 To dprc.WFDef_param.Count
      With prc.WFRtm_Param.Add
        Set .BasedOn = dprc.WFDef_param.Item(i)
        .the_Value = dprc.WFDef_param.Item(i).the_Value
        .Save
      End With
    Next
    
    
    ' создаем места под документы
    For i = 1 To dprc.WFDef_Doc.Count
      With prc.WFRtm_Doc.Add
        Set .BasedOn = dprc.WFDef_Doc.Item(i)
        ' создаем документ, если так надо
        If dprc.WFDef_Doc.Item(i).CreateInRuntime Then
          id = CreateGUID2
          dprc.Manager.NewInstance id, dprc.WFDef_Doc.Item(i).DocType.Name, dprc.WFDef_Doc.Item(i).Name
          Set .Document = dprc.Manager.GetInstanceObject(id)
          
          ' если у документа был шаблон, то делаем копию
          If Not dprc.WFDef_Doc.Item(i).DocTemplate Is Nothing Then
            Dim xdom As MSXML2.DOMDocument
            Set xdom = New MSXML2.DOMDocument
            xdom.loadXML "<root></root>"
            dprc.WFDef_Doc.Item(i).DocTemplate.XMLSave xdom.lastChild, xdom
            .Document.XMLLoad xdom.lastChild, 2
            .Document.BatchUpdate
          End If
        End If
        .Save
      End With
    Next
        
    RunFunc = WFFuncState_Done
    
  End If
  Exit Function
  
bye:
  RunFunc = WFFuncState_Done
End Function



