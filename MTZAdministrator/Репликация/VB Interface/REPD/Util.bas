Attribute VB_Name = "Util"
Option Explicit


' модуль общих функций








'Найти форму по имени
'Parameters:
'[IN]   Name , тип параметра: string,
'[IN]   Mode , тип параметра: string =""   - ...
'Returns:
'  объект класса form
'  ,или Nothing
'See Also:
'Example:
' dim variable as form
' Set variable = me.FormByName(...параметры...)
Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "" Then

If Name = "REPD_SendQ" Then
 Set FormByName = New frmREPD_SendQ_
 Exit Function
End If

If Name = "REPD_SRV" Then
 Set FormByName = New frmREPD_SRV_
 Exit Function
End If

If Name = "REPD_SNDTO" Then
 Set FormByName = New frmREPD_SNDTO_
 Exit Function
End If

If Name = "REPD_CONST" Then
 Set FormByName = New frmREPD_CONST_
 Exit Function
End If

If Name = "REPD_REPTYPE" Then
 Set FormByName = New frmREPD_REPTYPE_
 Exit Function
End If

If Name = "REPD_RecvQ" Then
 Set FormByName = New frmREPD_RecvQ_
 Exit Function
End If

If Name = "REPD_LOCKED" Then
 Set FormByName = New frmREPD_LOCKED_
 Exit Function
End If

If Name = "REPD_PROV" Then
 Set FormByName = New frmREPD_PROV_
 Exit Function
End If

If Name = "REPD_RequestQuery" Then
 Set FormByName = New frmREPD_RequestQuery_
 Exit Function
End If

If Name = "REPD_ResQueryRcv" Then
 Set FormByName = New frmREPD_ResQueryRcv_
 Exit Function
End If

End If
End Function

'Скопировать объект в типизированный XML  буфер
'Parameters:
'[IN][OUT]  u , тип параметра: Object  - ...
'See Also:
'Example:
'  call me.SaveToBuffer({параметры})
Public Sub SaveToBuffer(u As Object)
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      xdom.loadXML "<I></I>"
      u.XMLSave xdom.lastChild, xdom
      u.Application.Manager.SetBuffer u.PartName, xdom.xml
      Set xdom = Nothing
End Sub


'Получить объект из типизированного XML  буфера
'Parameters:
'[IN][OUT]  u , тип параметра: Object  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.GetFromBuffer(...параметры...)
Public Function GetFromBuffer(u As Object) As Boolean
      On Error GoTo bye
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      GetFromBuffer = False
      If u.Application.Manager.GetBuffer(u.PartName) <> "" Then
        xdom.loadXML u.Application.Manager.GetBuffer(u.PartName)
        u.XMLLoad xdom.lastChild, 2
        u.BatchUpdate
        GetFromBuffer = True
      Else
        MsgBox "Буфер данных для этого раздела пуст", vbInformation
      End If
    Exit Function
bye:
    MsgBox err.Description, vbCritical
End Function



