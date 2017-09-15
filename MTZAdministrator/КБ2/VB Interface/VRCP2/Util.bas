Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "" Then

If Name = "VRCPCommon" Then
 Set FormByName = New frmVRCPCommon_
 Exit Function
End If

If Name = "VRCPNeigborhood" Then
 Set FormByName = New frmVRCPNeigborhood_
 Exit Function
End If

If Name = "VRCPInterest" Then
 Set FormByName = New frmVRCPInterest_
 Exit Function
End If

If Name = "VRCPPresents" Then
 Set FormByName = New frmVRCPPresents_
 Exit Function
End If

If Name = "VRCPSpecial" Then
 Set FormByName = New frmVRCPSpecial_
 Exit Function
End If

If Name = "VRCPDates" Then
 Set FormByName = New frmVRCPDates_
 Exit Function
End If

If Name = "VRCPReports" Then
 Set FormByName = New frmVRCPReports_
 Exit Function
End If

If Name = "VRCPSeeAlso" Then
 Set FormByName = New frmVRCPSeeAlso_
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



