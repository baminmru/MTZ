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

If Name = "WEBS_PAGEDEF" Then
 Set FormByName = New frmWEBS_PAGEDEF_
 Exit Function
End If

If Name = "WEBS_PICS" Then
 Set FormByName = New frmWEBS_PICS_
 Exit Function
End If

If Name = "WEBS_PAGEMENU" Then
 Set FormByName = New frmWEBS_PAGEMENU_
 Exit Function
End If

If Name = "WEBS_PAGECONTENT" Then
 Set FormByName = New frmWEBS_PAGECONTENT_
 Exit Function
End If

If Name = "WEBS_PAGEPARS" Then
 Set FormByName = New frmWEBS_PAGEPARS_
 Exit Function
End If

If Name = "WEBS_PAGECOMP" Then
 Set FormByName = New frmWEBS_PAGECOMP_
 Exit Function
End If

If Name = "TablePart" Then
 Set FormByName = New frmTablePart_
 Exit Function
End If

If Name = "ReplaceValues" Then
 Set FormByName = New frmReplaceValues_
 Exit Function
End If

If Name = "DenyEdit" Then
 Set FormByName = New frmDenyEdit_
 Exit Function
End If

If Name = "DenyVisible" Then
 Set FormByName = New frmDenyVisible_
 Exit Function
End If

If Name = "AllowEditFieldValues" Then
 Set FormByName = New frmAllowEditFieldValues_
 Exit Function
End If

If Name = "ComboFields" Then
 Set FormByName = New frmComboFields_
 Exit Function
End If

If Name = "WEBS_DDOC" Then
 Set FormByName = New frmWEBS_DDOC_
 Exit Function
End If

If Name = "WEBS_ANKETA" Then
 Set FormByName = New frmWEBS_ANKETA_
 Exit Function
End If

If Name = "WEBS_QUESTIONS" Then
 Set FormByName = New frmWEBS_QUESTIONS_
 Exit Function
End If

If Name = "WEBS_ANSWERS" Then
 Set FormByName = New frmWEBS_ANSWERS_
 Exit Function
End If

If Name = "WEBS_MAILLIST" Then
 Set FormByName = New frmWEBS_MAILLIST_
 Exit Function
End If

If Name = "WEBS_NEWS" Then
 Set FormByName = New frmWEBS_NEWS_
 Exit Function
End If

If Name = "NEWS_PICS" Then
 Set FormByName = New frmNEWS_PICS_
 Exit Function
End If

If Name = "WEBS_USERS" Then
 Set FormByName = New frmWEBS_USERS_
 Exit Function
End If

If Name = "WEBS_ROLES" Then
 Set FormByName = New frmWEBS_ROLES_
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



