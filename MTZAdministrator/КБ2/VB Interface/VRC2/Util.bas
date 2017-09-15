Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "ur" Then

If Name = "VRCCommonInfo" Then
 Set FormByName = New frmVRCCommonInfo_ur
 Exit Function
End If

If Name = "VRCAditional" Then
 Set FormByName = New frmVRCAditional_ur
 Exit Function
End If

If Name = "VRCAccounts" Then
 Set FormByName = New frmVRCAccounts_ur
 Exit Function
End If

If Name = "VRCTarif" Then
 Set FormByName = New frmVRCTarif_ur
 Exit Function
End If

If Name = "VRC_DOGS" Then
 Set FormByName = New frmVRC_DOGS_ur
 Exit Function
End If

End If
If Mode = "main" Then

If Name = "VRCCommonInfo" Then
 Set FormByName = New frmVRCCommonInfo_main
 Exit Function
End If

If Name = "VRCAditional" Then
 Set FormByName = New frmVRCAditional_main
 Exit Function
End If

If Name = "VRCAccounts" Then
 Set FormByName = New frmVRCAccounts_main
 Exit Function
End If

If Name = "VRCTarif" Then
 Set FormByName = New frmVRCTarif_main
 Exit Function
End If

If Name = "VRC_DOGS" Then
 Set FormByName = New frmVRC_DOGS_main
 Exit Function
End If

End If
If Mode = "phiz" Then

If Name = "VRCCommonInfo" Then
 Set FormByName = New frmVRCCommonInfo_phiz
 Exit Function
End If

If Name = "VRCAditional" Then
 Set FormByName = New frmVRCAditional_phiz
 Exit Function
End If

If Name = "VRCTarif" Then
 Set FormByName = New frmVRCTarif_phiz
 Exit Function
End If

If Name = "VRC_DOGS" Then
 Set FormByName = New frmVRC_DOGS_phiz
 Exit Function
End If

End If
If Mode = "" Then

If Name = "VRCCommonInfo" Then
 Set FormByName = New frmVRCCommonInfo_
 Exit Function
End If

If Name = "VRCAditional" Then
 Set FormByName = New frmVRCAditional_
 Exit Function
End If

If Name = "VRCAccounts" Then
 Set FormByName = New frmVRCAccounts_
 Exit Function
End If

If Name = "VRCTorg" Then
 Set FormByName = New frmVRCTorg_
 Exit Function
End If

If Name = "VRCTarif" Then
 Set FormByName = New frmVRCTarif_
 Exit Function
End If

If Name = "VRC_1CLINK" Then
 Set FormByName = New frmVRC_1CLINK_
 Exit Function
End If

If Name = "VRC_DOGS" Then
 Set FormByName = New frmVRC_DOGS_
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



