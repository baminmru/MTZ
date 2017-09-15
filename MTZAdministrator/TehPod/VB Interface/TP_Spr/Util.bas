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

If Name = "TP_Spr_VrVisInst" Then
 Set FormByName = New frmTP_Spr_VrVisInst_
 Exit Function
End If

If Name = "TP_Spr_Oper" Then
 Set FormByName = New frmTP_Spr_Oper_
 Exit Function
End If

If Name = "TP_Spr_Ing" Then
 Set FormByName = New frmTP_Spr_Ing_
 Exit Function
End If

If Name = "TP_Spr_Metro" Then
 Set FormByName = New frmTP_Spr_Metro_
 Exit Function
End If

If Name = "TP_Spr_SrochDog" Then
 Set FormByName = New frmTP_Spr_SrochDog_
 Exit Function
End If

If Name = "TP_Spr_Koor" Then
 Set FormByName = New frmTP_Spr_Koor_
 Exit Function
End If

If Name = "Rayon" Then
 Set FormByName = New frmRayon_
 Exit Function
End If

If Name = "TP_Spr_Tar" Then
 Set FormByName = New frmTP_Spr_Tar_
 Exit Function
End If

If Name = "TP_SPR_Port" Then
 Set FormByName = New frmTP_SPR_Port_
 Exit Function
End If

If Name = "TP_SPR_MT" Then
 Set FormByName = New frmTP_SPR_MT_
 Exit Function
End If

If Name = "TP_SPR_ZTYPE" Then
 Set FormByName = New frmTP_SPR_ZTYPE_
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



