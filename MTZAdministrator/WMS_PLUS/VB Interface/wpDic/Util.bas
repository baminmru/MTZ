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

If Name = "wpDic_org" Then
 Set FormByName = New frmwpDic_org_main
 Exit Function
End If

If Name = "wpDic_orgAcc" Then
 Set FormByName = New frmwpDic_orgAcc_main
 Exit Function
End If

If Name = "wpDic_SRV" Then
 Set FormByName = New frmwpDic_SRV_main
 Exit Function
End If

If Name = "wpDic_EDIZM" Then
 Set FormByName = New frmwpDic_EDIZM_main
 Exit Function
End If

If Name = "wpDic_Country" Then
 Set FormByName = New frmwpDic_Country_main
 Exit Function
End If

If Name = "wpDic_firm" Then
 Set FormByName = New frmwpDic_firm_main
 Exit Function
End If

If Name = "wpDic_factory" Then
 Set FormByName = New frmwpDic_factory_main
 Exit Function
End If

If Name = "wpDic_store" Then
 Set FormByName = New frmwpDic_store_main
 Exit Function
End If

If Name = "wpDic_BLOCK" Then
 Set FormByName = New frmwpDic_BLOCK_main
 Exit Function
End If

If Name = "wpDic_zone" Then
 Set FormByName = New frmwpDic_zone_main
 Exit Function
End If

If Name = "wpDic_paltype" Then
 Set FormByName = New frmwpDic_paltype_main
 Exit Function
End If

If Name = "wpdic_op" Then
 Set FormByName = New frmwpdic_op_main
 Exit Function
End If

End If
If Mode = "admi" Then

If Name = "wpDic_org" Then
 Set FormByName = New frmwpDic_org_admi
 Exit Function
End If

If Name = "wpDic_orgAcc" Then
 Set FormByName = New frmwpDic_orgAcc_admi
 Exit Function
End If

If Name = "wpDic_SRV" Then
 Set FormByName = New frmwpDic_SRV_admi
 Exit Function
End If

If Name = "wpDic_EDIZM" Then
 Set FormByName = New frmwpDic_EDIZM_admi
 Exit Function
End If

If Name = "wpDic_Country" Then
 Set FormByName = New frmwpDic_Country_admi
 Exit Function
End If

If Name = "wpDic_firm" Then
 Set FormByName = New frmwpDic_firm_admi
 Exit Function
End If

If Name = "wpDic_factory" Then
 Set FormByName = New frmwpDic_factory_admi
 Exit Function
End If

If Name = "wpDic_store" Then
 Set FormByName = New frmwpDic_store_admi
 Exit Function
End If

If Name = "wpDic_BLOCK" Then
 Set FormByName = New frmwpDic_BLOCK_admi
 Exit Function
End If

If Name = "wpDic_zone" Then
 Set FormByName = New frmwpDic_zone_admi
 Exit Function
End If

If Name = "wpDic_paltype" Then
 Set FormByName = New frmwpDic_paltype_admi
 Exit Function
End If

If Name = "wpdic_op" Then
 Set FormByName = New frmwpdic_op_admi
 Exit Function
End If

End If
If Mode = "" Then

If Name = "wpDic_org" Then
 Set FormByName = New frmwpDic_org_
 Exit Function
End If

If Name = "wpDic_orgAcc" Then
 Set FormByName = New frmwpDic_orgAcc_
 Exit Function
End If

If Name = "wpDic_SRV" Then
 Set FormByName = New frmwpDic_SRV_
 Exit Function
End If

If Name = "wpDic_EDIZM" Then
 Set FormByName = New frmwpDic_EDIZM_
 Exit Function
End If

If Name = "wpDic_Country" Then
 Set FormByName = New frmwpDic_Country_
 Exit Function
End If

If Name = "wpDic_firm" Then
 Set FormByName = New frmwpDic_firm_
 Exit Function
End If

If Name = "wpDic_factory" Then
 Set FormByName = New frmwpDic_factory_
 Exit Function
End If

If Name = "wpDic_store" Then
 Set FormByName = New frmwpDic_store_
 Exit Function
End If

If Name = "wpDic_BLOCK" Then
 Set FormByName = New frmwpDic_BLOCK_
 Exit Function
End If

If Name = "wpDic_zone" Then
 Set FormByName = New frmwpDic_zone_
 Exit Function
End If

If Name = "wpDic_paltype" Then
 Set FormByName = New frmwpDic_paltype_
 Exit Function
End If

If Name = "wpdic_op" Then
 Set FormByName = New frmwpdic_op_
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



