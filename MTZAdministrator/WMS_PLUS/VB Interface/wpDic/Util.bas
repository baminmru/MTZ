Attribute VB_Name = "Util"
Option Explicit


' ������ ����� �������








'����� ����� �� �����
'Parameters:
'[IN]   Name , ��� ���������: string,
'[IN]   Mode , ��� ���������: string =""   - ...
'Returns:
'  ������ ������ form
'  ,��� Nothing
'See Also:
'Example:
' dim variable as form
' Set variable = me.FormByName(...���������...)
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

'����������� ������ � �������������� XML  �����
'Parameters:
'[IN][OUT]  u , ��� ���������: Object  - ...
'See Also:
'Example:
'  call me.SaveToBuffer({���������})
Public Sub SaveToBuffer(u As Object)
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      xdom.loadXML "<I></I>"
      u.XMLSave xdom.lastChild, xdom
      u.Application.Manager.SetBuffer u.PartName, xdom.xml
      Set xdom = Nothing
End Sub


'�������� ������ �� ��������������� XML  ������
'Parameters:
'[IN][OUT]  u , ��� ���������: Object  - ...
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.GetFromBuffer(...���������...)
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
        MsgBox "����� ������ ��� ����� ������� ����", vbInformation
      End If
    Exit Function
bye:
    MsgBox err.Description, vbCritical
End Function



