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
If Mode = "main" Then

If Name = "ITTD_GTYPE" Then
 Set FormByName = New frmITTD_GTYPE_main
 Exit Function
End If

If Name = "ITTD_ZTYPE" Then
 Set FormByName = New frmITTD_ZTYPE_main
 Exit Function
End If

If Name = "ITTD_PLTYPE" Then
 Set FormByName = New frmITTD_PLTYPE_main
 Exit Function
End If

If Name = "ITTD_QTYPE" Then
 Set FormByName = New frmITTD_QTYPE_main
 Exit Function
End If

If Name = "ITTD_ATYPE" Then
 Set FormByName = New frmITTD_ATYPE_main
 Exit Function
End If

If Name = "ITTD_SRV" Then
 Set FormByName = New frmITTD_SRV_main
 Exit Function
End If

If Name = "ITTD_PART" Then
 Set FormByName = New frmITTD_PART_main
 Exit Function
End If

If Name = "ITTD_FACTORY" Then
 Set FormByName = New frmITTD_FACTORY_main
 Exit Function
End If

If Name = "ITTD_KILLPLACE" Then
 Set FormByName = New frmITTD_KILLPLACE_main
 Exit Function
End If

If Name = "ITTD_COUNTRY" Then
 Set FormByName = New frmITTD_COUNTRY_main
 Exit Function
End If

If Name = "ITTD_CAMERA" Then
 Set FormByName = New frmITTD_CAMERA_main
 Exit Function
End If

If Name = "ITTD_RULE" Then
 Set FormByName = New frmITTD_RULE_main
 Exit Function
End If

If Name = "ITTD_OPTTYPE" Then
 Set FormByName = New frmITTD_OPTTYPE_main
 Exit Function
End If

If Name = "ITTD_MOROZ" Then
 Set FormByName = New frmITTD_MOROZ_main
 Exit Function
End If

If Name = "ITTD_EMAIL" Then
 Set FormByName = New frmITTD_EMAIL_main
 Exit Function
End If

End If
If Mode = "admi" Then

If Name = "ITTD_GTYPE" Then
 Set FormByName = New frmITTD_GTYPE_admi
 Exit Function
End If

If Name = "ITTD_ZTYPE" Then
 Set FormByName = New frmITTD_ZTYPE_admi
 Exit Function
End If

If Name = "ITTD_PLTYPE" Then
 Set FormByName = New frmITTD_PLTYPE_admi
 Exit Function
End If

If Name = "ITTD_QTYPE" Then
 Set FormByName = New frmITTD_QTYPE_admi
 Exit Function
End If

If Name = "ITTD_ATYPE" Then
 Set FormByName = New frmITTD_ATYPE_admi
 Exit Function
End If

If Name = "ITTD_SRV" Then
 Set FormByName = New frmITTD_SRV_admi
 Exit Function
End If

If Name = "ITTD_PART" Then
 Set FormByName = New frmITTD_PART_admi
 Exit Function
End If

If Name = "ITTD_FACTORY" Then
 Set FormByName = New frmITTD_FACTORY_admi
 Exit Function
End If

If Name = "ITTD_KILLPLACE" Then
 Set FormByName = New frmITTD_KILLPLACE_admi
 Exit Function
End If

If Name = "ITTD_COUNTRY" Then
 Set FormByName = New frmITTD_COUNTRY_admi
 Exit Function
End If

If Name = "ITTD_CAMERA" Then
 Set FormByName = New frmITTD_CAMERA_admi
 Exit Function
End If

If Name = "ITTD_RULE" Then
 Set FormByName = New frmITTD_RULE_admi
 Exit Function
End If

If Name = "ITTD_OPTTYPE" Then
 Set FormByName = New frmITTD_OPTTYPE_admi
 Exit Function
End If

If Name = "ITTD_MOROZ" Then
 Set FormByName = New frmITTD_MOROZ_admi
 Exit Function
End If

If Name = "ITTD_EMAIL" Then
 Set FormByName = New frmITTD_EMAIL_admi
 Exit Function
End If

End If
If Mode = "read" Then

If Name = "ITTD_GTYPE" Then
 Set FormByName = New frmITTD_GTYPE_read
 Exit Function
End If

If Name = "ITTD_ZTYPE" Then
 Set FormByName = New frmITTD_ZTYPE_read
 Exit Function
End If

If Name = "ITTD_PLTYPE" Then
 Set FormByName = New frmITTD_PLTYPE_read
 Exit Function
End If

If Name = "ITTD_QTYPE" Then
 Set FormByName = New frmITTD_QTYPE_read
 Exit Function
End If

If Name = "ITTD_ATYPE" Then
 Set FormByName = New frmITTD_ATYPE_read
 Exit Function
End If

If Name = "ITTD_SRV" Then
 Set FormByName = New frmITTD_SRV_read
 Exit Function
End If

If Name = "ITTD_PART" Then
 Set FormByName = New frmITTD_PART_read
 Exit Function
End If

If Name = "ITTD_FACTORY" Then
 Set FormByName = New frmITTD_FACTORY_read
 Exit Function
End If

If Name = "ITTD_KILLPLACE" Then
 Set FormByName = New frmITTD_KILLPLACE_read
 Exit Function
End If

If Name = "ITTD_COUNTRY" Then
 Set FormByName = New frmITTD_COUNTRY_read
 Exit Function
End If

If Name = "ITTD_CAMERA" Then
 Set FormByName = New frmITTD_CAMERA_read
 Exit Function
End If

If Name = "ITTD_RULE" Then
 Set FormByName = New frmITTD_RULE_read
 Exit Function
End If

If Name = "ITTD_OPTTYPE" Then
 Set FormByName = New frmITTD_OPTTYPE_read
 Exit Function
End If

If Name = "ITTD_MOROZ" Then
 Set FormByName = New frmITTD_MOROZ_read
 Exit Function
End If

If Name = "ITTD_EMAIL" Then
 Set FormByName = New frmITTD_EMAIL_read
 Exit Function
End If

End If
If Mode = "" Then

If Name = "ITTD_GTYPE" Then
 Set FormByName = New frmITTD_GTYPE_
 Exit Function
End If

If Name = "ITTD_ZTYPE" Then
 Set FormByName = New frmITTD_ZTYPE_
 Exit Function
End If

If Name = "ITTD_PLTYPE" Then
 Set FormByName = New frmITTD_PLTYPE_
 Exit Function
End If

If Name = "ITTD_QTYPE" Then
 Set FormByName = New frmITTD_QTYPE_
 Exit Function
End If

If Name = "ITTD_ATYPE" Then
 Set FormByName = New frmITTD_ATYPE_
 Exit Function
End If

If Name = "ITTD_SRV" Then
 Set FormByName = New frmITTD_SRV_
 Exit Function
End If

If Name = "ITTD_PART" Then
 Set FormByName = New frmITTD_PART_
 Exit Function
End If

If Name = "ITTD_FACTORY" Then
 Set FormByName = New frmITTD_FACTORY_
 Exit Function
End If

If Name = "ITTD_KILLPLACE" Then
 Set FormByName = New frmITTD_KILLPLACE_
 Exit Function
End If

If Name = "ITTD_COUNTRY" Then
 Set FormByName = New frmITTD_COUNTRY_
 Exit Function
End If

If Name = "ITTD_CAMERA" Then
 Set FormByName = New frmITTD_CAMERA_
 Exit Function
End If

If Name = "ITTD_RULE" Then
 Set FormByName = New frmITTD_RULE_
 Exit Function
End If

If Name = "ITTD_OPTTYPE" Then
 Set FormByName = New frmITTD_OPTTYPE_
 Exit Function
End If

If Name = "ITTD_MOROZ" Then
 Set FormByName = New frmITTD_MOROZ_
 Exit Function
End If

If Name = "ITTD_EMAIL" Then
 Set FormByName = New frmITTD_EMAIL_
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



