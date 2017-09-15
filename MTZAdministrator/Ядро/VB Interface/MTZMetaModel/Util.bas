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

If Name = "MTZAPP" Then
 Set FormByName = New frmMTZAPP_
 Exit Function
End If

If Name = "ParentPackage" Then
 Set FormByName = New frmParentPackage_
 Exit Function
End If

If Name = "OBJECTTYPE" Then
 Set FormByName = New frmOBJECTTYPE_
 Exit Function
End If

If Name = "PART" Then
 Set FormByName = New frmPART_
 Exit Function
End If

If Name = "PARTMENU" Then
 Set FormByName = New frmPARTMENU_
 Exit Function
End If

If Name = "PARTPARAMMAP" Then
 Set FormByName = New frmPARTPARAMMAP_
 Exit Function
End If

If Name = "FIELD" Then
 Set FormByName = New frmFIELD_
 Exit Function
End If

If Name = "FIELDVALIDATOR" Then
 Set FormByName = New frmFIELDVALIDATOR_
 Exit Function
End If

If Name = "FIELDMENU" Then
 Set FormByName = New frmFIELDMENU_
 Exit Function
End If

If Name = "FIELDPARAMMAP" Then
 Set FormByName = New frmFIELDPARAMMAP_
 Exit Function
End If

If Name = "FldExtenders" Then
 Set FormByName = New frmFldExtenders_
 Exit Function
End If

If Name = "FIELDEXPRESSION" Then
 Set FormByName = New frmFIELDEXPRESSION_
 Exit Function
End If

If Name = "DINAMICFILTERSCRIPT" Then
 Set FormByName = New frmDINAMICFILTERSCRIPT_
 Exit Function
End If

If Name = "FIELDSRCDEF" Then
 Set FormByName = New frmFIELDSRCDEF_
 Exit Function
End If

If Name = "PARTVIEW" Then
 Set FormByName = New frmPARTVIEW_
 Exit Function
End If

If Name = "ViewColumn" Then
 Set FormByName = New frmViewColumn_
 Exit Function
End If

If Name = "PARTVIEW_LNK" Then
 Set FormByName = New frmPARTVIEW_LNK_
 Exit Function
End If

If Name = "ExtenderInterface" Then
 Set FormByName = New frmExtenderInterface_
 Exit Function
End If

If Name = "VALIDATOR" Then
 Set FormByName = New frmVALIDATOR_
 Exit Function
End If

If Name = "UNIQUECONSTRAINT" Then
 Set FormByName = New frmUNIQUECONSTRAINT_
 Exit Function
End If

If Name = "CONSTRAINTFIELD" Then
 Set FormByName = New frmCONSTRAINTFIELD_
 Exit Function
End If

If Name = "INSTANCEVALIDATOR" Then
 Set FormByName = New frmINSTANCEVALIDATOR_
 Exit Function
End If

If Name = "OBJSTATUS" Then
 Set FormByName = New frmOBJSTATUS_
 Exit Function
End If

If Name = "NEXTSTATE" Then
 Set FormByName = New frmNEXTSTATE_
 Exit Function
End If

If Name = "OBJECTMODE" Then
 Set FormByName = New frmOBJECTMODE_
 Exit Function
End If

If Name = "STRUCTRESTRICTION" Then
 Set FormByName = New frmSTRUCTRESTRICTION_
 Exit Function
End If

If Name = "FIELDRESTRICTION" Then
 Set FormByName = New frmFIELDRESTRICTION_
 Exit Function
End If

If Name = "METHODRESTRICTION" Then
 Set FormByName = New frmMETHODRESTRICTION_
 Exit Function
End If

If Name = "TYPEMENU" Then
 Set FormByName = New frmTYPEMENU_
 Exit Function
End If

If Name = "FIELDTYPE" Then
 Set FormByName = New frmFIELDTYPE_
 Exit Function
End If

If Name = "FIELDTYPEMAP" Then
 Set FormByName = New frmFIELDTYPEMAP_
 Exit Function
End If

If Name = "ENUMITEM" Then
 Set FormByName = New frmENUMITEM_
 Exit Function
End If

If Name = "SHAREDMETHOD" Then
 Set FormByName = New frmSHAREDMETHOD_
 Exit Function
End If

If Name = "SCRIPT" Then
 Set FormByName = New frmSCRIPT_
 Exit Function
End If

If Name = "PARAMETERS" Then
 Set FormByName = New frmPARAMETERS_
 Exit Function
End If

If Name = "GENPACKAGE" Then
 Set FormByName = New frmGENPACKAGE_
 Exit Function
End If

If Name = "GENERATOR_TARGET" Then
 Set FormByName = New frmGENERATOR_TARGET_
 Exit Function
End If

If Name = "GENMANUALCODE" Then
 Set FormByName = New frmGENMANUALCODE_
 Exit Function
End If

If Name = "GENCONTROLS" Then
 Set FormByName = New frmGENCONTROLS_
 Exit Function
End If

If Name = "GENREFERENCE" Then
 Set FormByName = New frmGENREFERENCE_
 Exit Function
End If

If Name = "LocalizeInfo" Then
 Set FormByName = New frmLocalizeInfo_
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



