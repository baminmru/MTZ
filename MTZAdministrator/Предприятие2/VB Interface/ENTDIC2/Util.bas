Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "main" Then

If Name = "ENTDIC_EDIZM" Then
 Set FormByName = New frmENTDIC_EDIZM_main
 Exit Function
End If

If Name = "ENTDIC_BANK" Then
 Set FormByName = New frmENTDIC_BANK_main
 Exit Function
End If

If Name = "ENTDIC_1CLINK" Then
 Set FormByName = New frmENTDIC_1CLINK_main
 Exit Function
End If

If Name = "ENTDIC_CURRENCY" Then
 Set FormByName = New frmENTDIC_CURRENCY_main
 Exit Function
End If

If Name = "ENTDIC_CURCOURCE" Then
 Set FormByName = New frmENTDIC_CURCOURCE_main
 Exit Function
End If

If Name = "ENTDIC_DOST" Then
 Set FormByName = New frmENTDIC_DOST_main
 Exit Function
End If

If Name = "ENTDIC_REGION" Then
 Set FormByName = New frmENTDIC_REGION_main
 Exit Function
End If

If Name = "ENTDIC_TOWN" Then
 Set FormByName = New frmENTDIC_TOWN_main
 Exit Function
End If

If Name = "ENTDIC_COUNTRY" Then
 Set FormByName = New frmENTDIC_COUNTRY_main
 Exit Function
End If

If Name = "ENTDIC_TransportType" Then
 Set FormByName = New frmENTDIC_TransportType_main
 Exit Function
End If

If Name = "ENTDIC_OPF" Then
 Set FormByName = New frmENTDIC_OPF_main
 Exit Function
End If

End If
If Mode = "admi" Then

If Name = "ENTDIC_EDIZM" Then
 Set FormByName = New frmENTDIC_EDIZM_admi
 Exit Function
End If

If Name = "ENTDIC_BANK" Then
 Set FormByName = New frmENTDIC_BANK_admi
 Exit Function
End If

If Name = "ENTDIC_1CLINK" Then
 Set FormByName = New frmENTDIC_1CLINK_admi
 Exit Function
End If

If Name = "ENTDIC_CURRENCY" Then
 Set FormByName = New frmENTDIC_CURRENCY_admi
 Exit Function
End If

If Name = "ENTDIC_CURCOURCE" Then
 Set FormByName = New frmENTDIC_CURCOURCE_admi
 Exit Function
End If

If Name = "ENTDIC_DOST" Then
 Set FormByName = New frmENTDIC_DOST_admi
 Exit Function
End If

If Name = "ENTDIC_REGION" Then
 Set FormByName = New frmENTDIC_REGION_admi
 Exit Function
End If

If Name = "ENTDIC_TOWN" Then
 Set FormByName = New frmENTDIC_TOWN_admi
 Exit Function
End If

If Name = "ENTDIC_COUNTRY" Then
 Set FormByName = New frmENTDIC_COUNTRY_admi
 Exit Function
End If

If Name = "ENTDIC_TransportType" Then
 Set FormByName = New frmENTDIC_TransportType_admi
 Exit Function
End If

If Name = "ENTDIC_OPF" Then
 Set FormByName = New frmENTDIC_OPF_admi
 Exit Function
End If

End If
If Mode = "" Then

If Name = "ENTDIC_EDIZM" Then
 Set FormByName = New frmENTDIC_EDIZM_
 Exit Function
End If

If Name = "ENTDIC_BANK" Then
 Set FormByName = New frmENTDIC_BANK_
 Exit Function
End If

If Name = "ENTDIC_1CLINK" Then
 Set FormByName = New frmENTDIC_1CLINK_
 Exit Function
End If

If Name = "ENTDIC_CURRENCY" Then
 Set FormByName = New frmENTDIC_CURRENCY_
 Exit Function
End If

If Name = "ENTDIC_CURCOURCE" Then
 Set FormByName = New frmENTDIC_CURCOURCE_
 Exit Function
End If

If Name = "ENTDIC_DOST" Then
 Set FormByName = New frmENTDIC_DOST_
 Exit Function
End If

If Name = "ENTDIC_REGION" Then
 Set FormByName = New frmENTDIC_REGION_
 Exit Function
End If

If Name = "ENTDIC_TOWN" Then
 Set FormByName = New frmENTDIC_TOWN_
 Exit Function
End If

If Name = "ENTDIC_COUNTRY" Then
 Set FormByName = New frmENTDIC_COUNTRY_
 Exit Function
End If

If Name = "ENTDIC_TransportType" Then
 Set FormByName = New frmENTDIC_TransportType_
 Exit Function
End If

If Name = "ENTDIC_OPF" Then
 Set FormByName = New frmENTDIC_OPF_
 Exit Function
End If

End If
End Function
Public Sub SaveToBuffer(u As Object)
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      xdom.loadXML "<I></I>"
      u.XMLSave xdom.lastChild, xdom
      u.Application.Manager.SetBuffer u.PartName, xdom.xml
      Set xdom = Nothing
End Sub

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



