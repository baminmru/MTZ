Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "admi" Then

If Name = "VRDMarket" Then
 Set FormByName = New frmVRDMarket_admi
 Exit Function
End If

If Name = "VRDInterest" Then
 Set FormByName = New frmVRDInterest_admi
 Exit Function
End If

If Name = "VRDStream" Then
 Set FormByName = New frmVRDStream_admi
 Exit Function
End If

If Name = "VRDContractStage" Then
 Set FormByName = New frmVRDContractStage_admi
 Exit Function
End If

If Name = "VRDLoyalty" Then
 Set FormByName = New frmVRDLoyalty_admi
 Exit Function
End If

If Name = "VRDDocType" Then
 Set FormByName = New frmVRDDocType_admi
 Exit Function
End If

If Name = "VRDPrjType" Then
 Set FormByName = New frmVRDPrjType_admi
 Exit Function
End If

If Name = "VRDRreportType" Then
 Set FormByName = New frmVRDRreportType_admi
 Exit Function
End If

If Name = "VRD_CompInfo" Then
 Set FormByName = New frmVRD_CompInfo_admi
 Exit Function
End If

End If
If Mode = "main" Then

If Name = "VRDMarket" Then
 Set FormByName = New frmVRDMarket_main
 Exit Function
End If

If Name = "VRDInterest" Then
 Set FormByName = New frmVRDInterest_main
 Exit Function
End If

If Name = "VRDStream" Then
 Set FormByName = New frmVRDStream_main
 Exit Function
End If

If Name = "VRDContractStage" Then
 Set FormByName = New frmVRDContractStage_main
 Exit Function
End If

If Name = "VRDLoyalty" Then
 Set FormByName = New frmVRDLoyalty_main
 Exit Function
End If

If Name = "VRDDocType" Then
 Set FormByName = New frmVRDDocType_main
 Exit Function
End If

If Name = "VRDPrjType" Then
 Set FormByName = New frmVRDPrjType_main
 Exit Function
End If

If Name = "VRDRreportType" Then
 Set FormByName = New frmVRDRreportType_main
 Exit Function
End If

If Name = "VRD_CompInfo" Then
 Set FormByName = New frmVRD_CompInfo_main
 Exit Function
End If

End If
If Mode = "" Then

If Name = "VRDMarket" Then
 Set FormByName = New frmVRDMarket_
 Exit Function
End If

If Name = "VRDInterest" Then
 Set FormByName = New frmVRDInterest_
 Exit Function
End If

If Name = "VRDStream" Then
 Set FormByName = New frmVRDStream_
 Exit Function
End If

If Name = "VRDContractStage" Then
 Set FormByName = New frmVRDContractStage_
 Exit Function
End If

If Name = "VRDLoyalty" Then
 Set FormByName = New frmVRDLoyalty_
 Exit Function
End If

If Name = "VRDDocType" Then
 Set FormByName = New frmVRDDocType_
 Exit Function
End If

If Name = "VRDPrjType" Then
 Set FormByName = New frmVRDPrjType_
 Exit Function
End If

If Name = "VRDRreportType" Then
 Set FormByName = New frmVRDRreportType_
 Exit Function
End If

If Name = "VRD_CompInfo" Then
 Set FormByName = New frmVRD_CompInfo_
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



