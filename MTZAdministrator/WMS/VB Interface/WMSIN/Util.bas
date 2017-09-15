Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "" Then

If Name = "WMSIN_DEF" Then
 Set FormByName = New frmWMSIN_DEF_
 Exit Function
End If

If Name = "WMSIN_QLINE" Then
 Set FormByName = New frmWMSIN_QLINE_
 Exit Function
End If

If Name = "WMSIN_PALET" Then
 Set FormByName = New frmWMSIN_PALET_
 Exit Function
End If

If Name = "WMSIN_SRV" Then
 Set FormByName = New frmWMSIN_SRV_
 Exit Function
End If

If Name = "WMSIN_EPL" Then
 Set FormByName = New frmWMSIN_EPL_
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



