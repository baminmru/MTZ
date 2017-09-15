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
If Mode = "NO" Then

If Name = "TP_Zay_Zay" Then
 Set FormByName = New frmTP_Zay_Zay_NO
 Exit Function
End If

If Name = "TP_Zayav_Ist" Then
 Set FormByName = New frmTP_Zayav_Ist_NO
 Exit Function
End If

If Name = "TP_ZAY_MSG" Then
 Set FormByName = New frmTP_ZAY_MSG_NO
 Exit Function
End If

End If
If Mode = "READ" Then

If Name = "TP_Zay_Zay" Then
 Set FormByName = New frmTP_Zay_Zay_READ
 Exit Function
End If

If Name = "TP_Zayav_Ist" Then
 Set FormByName = New frmTP_Zayav_Ist_READ
 Exit Function
End If

If Name = "TP_ZAY_MSG" Then
 Set FormByName = New frmTP_ZAY_MSG_READ
 Exit Function
End If

End If
If Mode = "VIP" Then

If Name = "TP_Zay_Zay" Then
 Set FormByName = New frmTP_Zay_Zay_VIP
 Exit Function
End If

If Name = "TP_Zayav_Ist" Then
 Set FormByName = New frmTP_Zayav_Ist_VIP
 Exit Function
End If

If Name = "TP_ZAY_MSG" Then
 Set FormByName = New frmTP_ZAY_MSG_VIP
 Exit Function
End If

End If
If Mode = "POL" Then

If Name = "TP_Zay_Zay" Then
 Set FormByName = New frmTP_Zay_Zay_POL
 Exit Function
End If

If Name = "TP_Zayav_Ist" Then
 Set FormByName = New frmTP_Zayav_Ist_POL
 Exit Function
End If

If Name = "TP_ZAY_MSG" Then
 Set FormByName = New frmTP_ZAY_MSG_POL
 Exit Function
End If

End If
If Mode = "YING" Then

If Name = "TP_Zay_Zay" Then
 Set FormByName = New frmTP_Zay_Zay_YING
 Exit Function
End If

If Name = "TP_Zayav_Ist" Then
 Set FormByName = New frmTP_Zayav_Ist_YING
 Exit Function
End If

If Name = "TP_ZAY_MSG" Then
 Set FormByName = New frmTP_ZAY_MSG_YING
 Exit Function
End If

End If
If Mode = "NISP" Then

If Name = "TP_Zay_Zay" Then
 Set FormByName = New frmTP_Zay_Zay_NISP
 Exit Function
End If

If Name = "TP_ZAY_MSG" Then
 Set FormByName = New frmTP_ZAY_MSG_NISP
 Exit Function
End If

End If
If Mode = "ALL" Then

If Name = "TP_Zay_Zay" Then
 Set FormByName = New frmTP_Zay_Zay_ALL
 Exit Function
End If

If Name = "TP_Zayav_Ist" Then
 Set FormByName = New frmTP_Zayav_Ist_ALL
 Exit Function
End If

If Name = "TP_ZAY_MSG" Then
 Set FormByName = New frmTP_ZAY_MSG_ALL
 Exit Function
End If

End If
If Mode = "VSZT" Then

If Name = "TP_Zay_Zay" Then
 Set FormByName = New frmTP_Zay_Zay_VSZT
 Exit Function
End If

If Name = "TP_ZAY_MSG" Then
 Set FormByName = New frmTP_ZAY_MSG_VSZT
 Exit Function
End If

End If
If Mode = "PROB" Then

If Name = "TP_Zay_Zay" Then
 Set FormByName = New frmTP_Zay_Zay_PROB
 Exit Function
End If

If Name = "TP_ZAY_MSG" Then
 Set FormByName = New frmTP_ZAY_MSG_PROB
 Exit Function
End If

End If
If Mode = "" Then

If Name = "TP_Zay_Zay" Then
 Set FormByName = New frmTP_Zay_Zay_
 Exit Function
End If

If Name = "TP_Zayav_Ist" Then
 Set FormByName = New frmTP_Zayav_Ist_
 Exit Function
End If

If Name = "TP_ZAY_MSG" Then
 Set FormByName = New frmTP_ZAY_MSG_
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



