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
If Mode = "admi" Then

If Name = "ITTOUT_DEF" Then
 Set FormByName = New frmITTOUT_DEF_admi
 Exit Function
End If

If Name = "ITTOUT_LINES" Then
 Set FormByName = New frmITTOUT_LINES_admi
 Exit Function
End If

If Name = "ITTOUT_PALET" Then
 Set FormByName = New frmITTOUT_PALET_admi
 Exit Function
End If

If Name = "ITTOUT_EPL" Then
 Set FormByName = New frmITTOUT_EPL_admi
 Exit Function
End If

If Name = "ITTOUT_SRV" Then
 Set FormByName = New frmITTOUT_SRV_admi
 Exit Function
End If

End If
If Mode = "main" Then

If Name = "ITTOUT_DEF" Then
 Set FormByName = New frmITTOUT_DEF_main
 Exit Function
End If

If Name = "ITTOUT_LINES" Then
 Set FormByName = New frmITTOUT_LINES_main
 Exit Function
End If

If Name = "ITTOUT_PALET" Then
 Set FormByName = New frmITTOUT_PALET_main
 Exit Function
End If

If Name = "ITTOUT_EPL" Then
 Set FormByName = New frmITTOUT_EPL_main
 Exit Function
End If

If Name = "ITTOUT_SRV" Then
 Set FormByName = New frmITTOUT_SRV_main
 Exit Function
End If

End If
If Mode = "" Then

If Name = "ITTOUT_DEF" Then
 Set FormByName = New frmITTOUT_DEF_
 Exit Function
End If

If Name = "ITTOUT_LINES" Then
 Set FormByName = New frmITTOUT_LINES_
 Exit Function
End If

If Name = "ITTOUT_PALET" Then
 Set FormByName = New frmITTOUT_PALET_
 Exit Function
End If

If Name = "ITTOUT_EPL" Then
 Set FormByName = New frmITTOUT_EPL_
 Exit Function
End If

If Name = "ITTOUT_SRV" Then
 Set FormByName = New frmITTOUT_SRV_
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



