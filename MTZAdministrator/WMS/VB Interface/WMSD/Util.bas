Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "main" Then

If Name = "WMSD_GTYPE" Then
 Set FormByName = New frmWMSD_GTYPE_main
 Exit Function
End If

If Name = "WMSD_ZTYPE" Then
 Set FormByName = New frmWMSD_ZTYPE_main
 Exit Function
End If

If Name = "WMSD_PLTYPE" Then
 Set FormByName = New frmWMSD_PLTYPE_main
 Exit Function
End If

If Name = "WMSD_QTYPE" Then
 Set FormByName = New frmWMSD_QTYPE_main
 Exit Function
End If

If Name = "WMSD_ATYPE" Then
 Set FormByName = New frmWMSD_ATYPE_main
 Exit Function
End If

If Name = "WMSD_SRV" Then
 Set FormByName = New frmWMSD_SRV_main
 Exit Function
End If

If Name = "WMSD_PART" Then
 Set FormByName = New frmWMSD_PART_main
 Exit Function
End If

If Name = "WMSD_FACTORY" Then
 Set FormByName = New frmWMSD_FACTORY_main
 Exit Function
End If

If Name = "WMSD_KILLPLACE" Then
 Set FormByName = New frmWMSD_KILLPLACE_main
 Exit Function
End If

If Name = "WMSD_COUNTRY" Then
 Set FormByName = New frmWMSD_COUNTRY_main
 Exit Function
End If

If Name = "WMSD_CAMERA" Then
 Set FormByName = New frmWMSD_CAMERA_main
 Exit Function
End If

If Name = "WMSD_RULE" Then
 Set FormByName = New frmWMSD_RULE_main
 Exit Function
End If

If Name = "WMSD_OPTTYPE" Then
 Set FormByName = New frmWMSD_OPTTYPE_main
 Exit Function
End If

If Name = "WMSD_MOROZ" Then
 Set FormByName = New frmWMSD_MOROZ_main
 Exit Function
End If

If Name = "WMSD_WH" Then
 Set FormByName = New frmWMSD_WH_main
 Exit Function
End If

If Name = "WMSD_EI" Then
 Set FormByName = New frmWMSD_EI_main
 Exit Function
End If

End If
If Mode = "admi" Then

If Name = "WMSD_GTYPE" Then
 Set FormByName = New frmWMSD_GTYPE_admi
 Exit Function
End If

If Name = "WMSD_ZTYPE" Then
 Set FormByName = New frmWMSD_ZTYPE_admi
 Exit Function
End If

If Name = "WMSD_PLTYPE" Then
 Set FormByName = New frmWMSD_PLTYPE_admi
 Exit Function
End If

If Name = "WMSD_QTYPE" Then
 Set FormByName = New frmWMSD_QTYPE_admi
 Exit Function
End If

If Name = "WMSD_ATYPE" Then
 Set FormByName = New frmWMSD_ATYPE_admi
 Exit Function
End If

If Name = "WMSD_SRV" Then
 Set FormByName = New frmWMSD_SRV_admi
 Exit Function
End If

If Name = "WMSD_PART" Then
 Set FormByName = New frmWMSD_PART_admi
 Exit Function
End If

If Name = "WMSD_FACTORY" Then
 Set FormByName = New frmWMSD_FACTORY_admi
 Exit Function
End If

If Name = "WMSD_KILLPLACE" Then
 Set FormByName = New frmWMSD_KILLPLACE_admi
 Exit Function
End If

If Name = "WMSD_COUNTRY" Then
 Set FormByName = New frmWMSD_COUNTRY_admi
 Exit Function
End If

If Name = "WMSD_CAMERA" Then
 Set FormByName = New frmWMSD_CAMERA_admi
 Exit Function
End If

If Name = "WMSD_RULE" Then
 Set FormByName = New frmWMSD_RULE_admi
 Exit Function
End If

If Name = "WMSD_OPTTYPE" Then
 Set FormByName = New frmWMSD_OPTTYPE_admi
 Exit Function
End If

If Name = "WMSD_MOROZ" Then
 Set FormByName = New frmWMSD_MOROZ_admi
 Exit Function
End If

If Name = "WMSD_WH" Then
 Set FormByName = New frmWMSD_WH_admi
 Exit Function
End If

If Name = "WMSD_EI" Then
 Set FormByName = New frmWMSD_EI_admi
 Exit Function
End If

End If
If Mode = "" Then

If Name = "WMSD_GTYPE" Then
 Set FormByName = New frmWMSD_GTYPE_
 Exit Function
End If

If Name = "WMSD_ZTYPE" Then
 Set FormByName = New frmWMSD_ZTYPE_
 Exit Function
End If

If Name = "WMSD_PLTYPE" Then
 Set FormByName = New frmWMSD_PLTYPE_
 Exit Function
End If

If Name = "WMSD_QTYPE" Then
 Set FormByName = New frmWMSD_QTYPE_
 Exit Function
End If

If Name = "WMSD_ATYPE" Then
 Set FormByName = New frmWMSD_ATYPE_
 Exit Function
End If

If Name = "WMSD_SRV" Then
 Set FormByName = New frmWMSD_SRV_
 Exit Function
End If

If Name = "WMSD_PART" Then
 Set FormByName = New frmWMSD_PART_
 Exit Function
End If

If Name = "WMSD_FACTORY" Then
 Set FormByName = New frmWMSD_FACTORY_
 Exit Function
End If

If Name = "WMSD_KILLPLACE" Then
 Set FormByName = New frmWMSD_KILLPLACE_
 Exit Function
End If

If Name = "WMSD_COUNTRY" Then
 Set FormByName = New frmWMSD_COUNTRY_
 Exit Function
End If

If Name = "WMSD_CAMERA" Then
 Set FormByName = New frmWMSD_CAMERA_
 Exit Function
End If

If Name = "WMSD_RULE" Then
 Set FormByName = New frmWMSD_RULE_
 Exit Function
End If

If Name = "WMSD_OPTTYPE" Then
 Set FormByName = New frmWMSD_OPTTYPE_
 Exit Function
End If

If Name = "WMSD_MOROZ" Then
 Set FormByName = New frmWMSD_MOROZ_
 Exit Function
End If

If Name = "WMSD_WH" Then
 Set FormByName = New frmWMSD_WH_
 Exit Function
End If

If Name = "WMSD_EI" Then
 Set FormByName = New frmWMSD_EI_
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



