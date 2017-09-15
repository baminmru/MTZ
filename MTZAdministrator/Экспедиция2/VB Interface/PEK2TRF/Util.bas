Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "main" Then

If Name = "PEKTRF_DEF" Then
 Set FormByName = New frmPEKTRF_DEF_main
 Exit Function
End If

If Name = "PEKTRF_SRV" Then
 Set FormByName = New frmPEKTRF_SRV_main
 Exit Function
End If

If Name = "PEKTRF_TR" Then
 Set FormByName = New frmPEKTRF_TR_main
 Exit Function
End If

If Name = "PEKTRF_REGRTR" Then
 Set FormByName = New frmPEKTRF_REGRTR_main
 Exit Function
End If

If Name = "PEKTRF_ADDS" Then
 Set FormByName = New frmPEKTRF_ADDS_main
 Exit Function
End If

If Name = "PEKTRF_DECR" Then
 Set FormByName = New frmPEKTRF_DECR_main
 Exit Function
End If

If Name = "PEKTRF_REGALL" Then
 Set FormByName = New frmPEKTRF_REGALL_main
 Exit Function
End If

If Name = "PEKTRF_AUTO" Then
 Set FormByName = New frmPEKTRF_AUTO_main
 Exit Function
End If

End If
If Mode = "read" Then

If Name = "PEKTRF_DEF" Then
 Set FormByName = New frmPEKTRF_DEF_read
 Exit Function
End If

If Name = "PEKTRF_SRV" Then
 Set FormByName = New frmPEKTRF_SRV_read
 Exit Function
End If

If Name = "PEKTRF_TR" Then
 Set FormByName = New frmPEKTRF_TR_read
 Exit Function
End If

If Name = "PEKTRF_REGRTR" Then
 Set FormByName = New frmPEKTRF_REGRTR_read
 Exit Function
End If

If Name = "PEKTRF_ADDS" Then
 Set FormByName = New frmPEKTRF_ADDS_read
 Exit Function
End If

If Name = "PEKTRF_DECR" Then
 Set FormByName = New frmPEKTRF_DECR_read
 Exit Function
End If

If Name = "PEKTRF_REGALL" Then
 Set FormByName = New frmPEKTRF_REGALL_read
 Exit Function
End If

If Name = "PEKTRF_AUTO" Then
 Set FormByName = New frmPEKTRF_AUTO_read
 Exit Function
End If

End If
If Mode = "" Then

If Name = "PEKTRF_DEF" Then
 Set FormByName = New frmPEKTRF_DEF_
 Exit Function
End If

If Name = "PEKTRF_SRV" Then
 Set FormByName = New frmPEKTRF_SRV_
 Exit Function
End If

If Name = "PEKTRF_TR" Then
 Set FormByName = New frmPEKTRF_TR_
 Exit Function
End If

If Name = "PEKTRF_REGRTR" Then
 Set FormByName = New frmPEKTRF_REGRTR_
 Exit Function
End If

If Name = "PEKTRF_ADDS" Then
 Set FormByName = New frmPEKTRF_ADDS_
 Exit Function
End If

If Name = "PEKTRF_DECR" Then
 Set FormByName = New frmPEKTRF_DECR_
 Exit Function
End If

If Name = "PEKTRF_REGALL" Then
 Set FormByName = New frmPEKTRF_REGALL_
 Exit Function
End If

If Name = "PEKTRF_AUTO" Then
 Set FormByName = New frmPEKTRF_AUTO_
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



