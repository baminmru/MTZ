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



