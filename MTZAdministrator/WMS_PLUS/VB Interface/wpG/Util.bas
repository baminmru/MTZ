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

If Name = "wpg_def" Then
 Set FormByName = New frmwpg_def_main
 Exit Function
End If

If Name = "wpg_S1" Then
 Set FormByName = New frmwpg_S1_main
 Exit Function
End If

If Name = "wpg_S2" Then
 Set FormByName = New frmwpg_S2_main
 Exit Function
End If

If Name = "wpG_S3" Then
 Set FormByName = New frmwpG_S3_main
 Exit Function
End If

If Name = "wpg_s4" Then
 Set FormByName = New frmwpg_s4_main
 Exit Function
End If

If Name = "wpg_s5" Then
 Set FormByName = New frmwpg_s5_main
 Exit Function
End If

If Name = "wpg_D1" Then
 Set FormByName = New frmwpg_D1_main
 Exit Function
End If

If Name = "wpg_d2" Then
 Set FormByName = New frmwpg_d2_main
 Exit Function
End If

If Name = "wpg_d3" Then
 Set FormByName = New frmwpg_d3_main
 Exit Function
End If

If Name = "wpg_d4" Then
 Set FormByName = New frmwpg_d4_main
 Exit Function
End If

If Name = "wpg_d5" Then
 Set FormByName = New frmwpg_d5_main
 Exit Function
End If

End If
If Mode = "admi" Then

If Name = "wpg_def" Then
 Set FormByName = New frmwpg_def_admi
 Exit Function
End If

If Name = "wpg_S1" Then
 Set FormByName = New frmwpg_S1_admi
 Exit Function
End If

If Name = "wpg_S2" Then
 Set FormByName = New frmwpg_S2_admi
 Exit Function
End If

If Name = "wpG_S3" Then
 Set FormByName = New frmwpG_S3_admi
 Exit Function
End If

If Name = "wpg_s4" Then
 Set FormByName = New frmwpg_s4_admi
 Exit Function
End If

If Name = "wpg_s5" Then
 Set FormByName = New frmwpg_s5_admi
 Exit Function
End If

If Name = "wpg_D1" Then
 Set FormByName = New frmwpg_D1_admi
 Exit Function
End If

If Name = "wpg_d2" Then
 Set FormByName = New frmwpg_d2_admi
 Exit Function
End If

If Name = "wpg_d3" Then
 Set FormByName = New frmwpg_d3_admi
 Exit Function
End If

If Name = "wpg_d4" Then
 Set FormByName = New frmwpg_d4_admi
 Exit Function
End If

If Name = "wpg_d5" Then
 Set FormByName = New frmwpg_d5_admi
 Exit Function
End If

End If
If Mode = "" Then

If Name = "wpg_def" Then
 Set FormByName = New frmwpg_def_
 Exit Function
End If

If Name = "wpg_S1" Then
 Set FormByName = New frmwpg_S1_
 Exit Function
End If

If Name = "wpg_S2" Then
 Set FormByName = New frmwpg_S2_
 Exit Function
End If

If Name = "wpG_S3" Then
 Set FormByName = New frmwpG_S3_
 Exit Function
End If

If Name = "wpg_s4" Then
 Set FormByName = New frmwpg_s4_
 Exit Function
End If

If Name = "wpg_s5" Then
 Set FormByName = New frmwpg_s5_
 Exit Function
End If

If Name = "wpg_D1" Then
 Set FormByName = New frmwpg_D1_
 Exit Function
End If

If Name = "wpg_d2" Then
 Set FormByName = New frmwpg_d2_
 Exit Function
End If

If Name = "wpg_d3" Then
 Set FormByName = New frmwpg_d3_
 Exit Function
End If

If Name = "wpg_d4" Then
 Set FormByName = New frmwpg_d4_
 Exit Function
End If

If Name = "wpg_d5" Then
 Set FormByName = New frmwpg_d5_
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



