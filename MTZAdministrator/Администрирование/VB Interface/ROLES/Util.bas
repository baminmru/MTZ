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

If Name = "ROLES_DEF" Then
 Set FormByName = New frmROLES_DEF_
 Exit Function
End If

If Name = "ROLES_WP" Then
 Set FormByName = New frmROLES_WP_
 Exit Function
End If

If Name = "ROLES_ACT" Then
 Set FormByName = New frmROLES_ACT_
 Exit Function
End If

If Name = "ROLES_MAP" Then
 Set FormByName = New frmROLES_MAP_
 Exit Function
End If

If Name = "ROLES_USER" Then
 Set FormByName = New frmROLES_USER_
 Exit Function
End If

If Name = "ROLES_DOC" Then
 Set FormByName = New frmROLES_DOC_
 Exit Function
End If

If Name = "ROLES_DOC_STATE" Then
 Set FormByName = New frmROLES_DOC_STATE_
 Exit Function
End If

If Name = "ROLES_REPORTS" Then
 Set FormByName = New frmROLES_REPORTS_
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



