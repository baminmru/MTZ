Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "main" Then

If Name = "HMSR_DEF" Then
 Set FormByName = New frmHMSR_DEF_main
 Exit Function
End If

If Name = "HMSR_PHOTO" Then
 Set FormByName = New frmHMSR_PHOTO_main
 Exit Function
End If

If Name = "HMSR_TOOL" Then
 Set FormByName = New frmHMSR_TOOL_main
 Exit Function
End If

End If
If Mode = "" Then

If Name = "HMSR_DEF" Then
 Set FormByName = New frmHMSR_DEF_
 Exit Function
End If

If Name = "HMSR_PHOTO" Then
 Set FormByName = New frmHMSR_PHOTO_
 Exit Function
End If

If Name = "HMSR_TOOL" Then
 Set FormByName = New frmHMSR_TOOL_
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
        MsgBox "����� ������ ��� ����� ������� ����", vbInformation
      End If
    Exit Function
bye:
    MsgBox err.Description, vbCritical
End Function



