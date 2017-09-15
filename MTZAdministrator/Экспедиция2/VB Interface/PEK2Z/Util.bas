Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "prnt" Then

If Name = "pekz_def" Then
 Set FormByName = New frmpekz_def_prnt
 Exit Function
End If

If Name = "pekz_path" Then
 Set FormByName = New frmpekz_path_prnt
 Exit Function
End If

If Name = "PEKZ_WLIST" Then
 Set FormByName = New frmPEKZ_WLIST_prnt
 Exit Function
End If

If Name = "pekz_dop" Then
 Set FormByName = New frmpekz_dop_prnt
 Exit Function
End If

If Name = "PEKZ_ACLCT" Then
 Set FormByName = New frmPEKZ_ACLCT_prnt
 Exit Function
End If

If Name = "PEKZ_ADLVR" Then
 Set FormByName = New frmPEKZ_ADLVR_prnt
 Exit Function
End If

End If
If Mode = "path" Then

If Name = "pekz_def" Then
 Set FormByName = New frmpekz_def_path
 Exit Function
End If

If Name = "pekz_path" Then
 Set FormByName = New frmpekz_path_path
 Exit Function
End If

If Name = "PEKZ_WLIST" Then
 Set FormByName = New frmPEKZ_WLIST_path
 Exit Function
End If

If Name = "pekz_dop" Then
 Set FormByName = New frmpekz_dop_path
 Exit Function
End If

If Name = "PEKZ_ACLCT" Then
 Set FormByName = New frmPEKZ_ACLCT_path
 Exit Function
End If

If Name = "PEKZ_ADLVR" Then
 Set FormByName = New frmPEKZ_ADLVR_path
 Exit Function
End If

End If
If Mode = "read" Then

If Name = "pekz_def" Then
 Set FormByName = New frmpekz_def_read
 Exit Function
End If

If Name = "pekz_path" Then
 Set FormByName = New frmpekz_path_read
 Exit Function
End If

If Name = "PEKZ_WLIST" Then
 Set FormByName = New frmPEKZ_WLIST_read
 Exit Function
End If

If Name = "pekz_dop" Then
 Set FormByName = New frmpekz_dop_read
 Exit Function
End If

If Name = "PEKZ_ACLCT" Then
 Set FormByName = New frmPEKZ_ACLCT_read
 Exit Function
End If

If Name = "PEKZ_ADLVR" Then
 Set FormByName = New frmPEKZ_ADLVR_read
 Exit Function
End If

End If
If Mode = "main" Then

If Name = "pekz_def" Then
 Set FormByName = New frmpekz_def_main
 Exit Function
End If

If Name = "pekz_path" Then
 Set FormByName = New frmpekz_path_main
 Exit Function
End If

If Name = "PEKZ_WLIST" Then
 Set FormByName = New frmPEKZ_WLIST_main
 Exit Function
End If

If Name = "pekz_dop" Then
 Set FormByName = New frmpekz_dop_main
 Exit Function
End If

If Name = "PEKZ_ACLCT" Then
 Set FormByName = New frmPEKZ_ACLCT_main
 Exit Function
End If

If Name = "PEKZ_ADLVR" Then
 Set FormByName = New frmPEKZ_ADLVR_main
 Exit Function
End If

End If
If Mode = "sent" Then

If Name = "pekz_def" Then
 Set FormByName = New frmpekz_def_sent
 Exit Function
End If

If Name = "pekz_path" Then
 Set FormByName = New frmpekz_path_sent
 Exit Function
End If

If Name = "PEKZ_WLIST" Then
 Set FormByName = New frmPEKZ_WLIST_sent
 Exit Function
End If

If Name = "pekz_dop" Then
 Set FormByName = New frmpekz_dop_sent
 Exit Function
End If

If Name = "PEKZ_ACLCT" Then
 Set FormByName = New frmPEKZ_ACLCT_sent
 Exit Function
End If

If Name = "PEKZ_ADLVR" Then
 Set FormByName = New frmPEKZ_ADLVR_sent
 Exit Function
End If

End If
If Mode = "done" Then

If Name = "pekz_def" Then
 Set FormByName = New frmpekz_def_done
 Exit Function
End If

If Name = "pekz_path" Then
 Set FormByName = New frmpekz_path_done
 Exit Function
End If

If Name = "PEKZ_WLIST" Then
 Set FormByName = New frmPEKZ_WLIST_done
 Exit Function
End If

If Name = "pekz_dop" Then
 Set FormByName = New frmpekz_dop_done
 Exit Function
End If

If Name = "PEKZ_ACLCT" Then
 Set FormByName = New frmPEKZ_ACLCT_done
 Exit Function
End If

If Name = "PEKZ_ADLVR" Then
 Set FormByName = New frmPEKZ_ADLVR_done
 Exit Function
End If

End If
If Mode = "" Then

If Name = "pekz_def" Then
 Set FormByName = New frmpekz_def_
 Exit Function
End If

If Name = "pekz_path" Then
 Set FormByName = New frmpekz_path_
 Exit Function
End If

If Name = "PEKZ_WLIST" Then
 Set FormByName = New frmPEKZ_WLIST_
 Exit Function
End If

If Name = "pekz_dop" Then
 Set FormByName = New frmpekz_dop_
 Exit Function
End If

If Name = "PEKZ_ACLCT" Then
 Set FormByName = New frmPEKZ_ACLCT_
 Exit Function
End If

If Name = "PEKZ_ADLVR" Then
 Set FormByName = New frmPEKZ_ADLVR_
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



