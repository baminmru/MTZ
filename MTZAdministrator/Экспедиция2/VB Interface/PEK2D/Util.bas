Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "admi" Then

If Name = "PEKD_SRV" Then
 Set FormByName = New frmPEKD_SRV_admi
 Exit Function
End If

If Name = "PEKD_TRTYPE" Then
 Set FormByName = New frmPEKD_TRTYPE_admi
 Exit Function
End If

If Name = "PEKD_GOTYPE" Then
 Set FormByName = New frmPEKD_GOTYPE_admi
 Exit Function
End If

If Name = "PEKD_TRFGRP" Then
 Set FormByName = New frmPEKD_TRFGRP_admi
 Exit Function
End If

If Name = "PEKD_TRFTYPE" Then
 Set FormByName = New frmPEKD_TRFTYPE_admi
 Exit Function
End If

If Name = "PEKD_DIRECTION" Then
 Set FormByName = New frmPEKD_DIRECTION_admi
 Exit Function
End If

If Name = "PEKD_TRAINS" Then
 Set FormByName = New frmPEKD_TRAINS_admi
 Exit Function
End If

If Name = "PEKD_DIRSTATION" Then
 Set FormByName = New frmPEKD_DIRSTATION_admi
 Exit Function
End If

If Name = "PEKD_DEPT" Then
 Set FormByName = New frmPEKD_DEPT_admi
 Exit Function
End If

If Name = "PEKD_DEPLIMITS" Then
 Set FormByName = New frmPEKD_DEPLIMITS_admi
 Exit Function
End If

If Name = "PEKD_DEPDOG" Then
 Set FormByName = New frmPEKD_DEPDOG_admi
 Exit Function
End If

If Name = "PEKD_TRAINTYPE" Then
 Set FormByName = New frmPEKD_TRAINTYPE_admi
 Exit Function
End If

If Name = "PEKD_ADDS" Then
 Set FormByName = New frmPEKD_ADDS_admi
 Exit Function
End If

If Name = "PEKD_POSTTYPE" Then
 Set FormByName = New frmPEKD_POSTTYPE_admi
 Exit Function
End If

If Name = "PEKD_INFOSENDTYPE" Then
 Set FormByName = New frmPEKD_INFOSENDTYPE_admi
 Exit Function
End If

If Name = "PEKD_AUTO" Then
 Set FormByName = New frmPEKD_AUTO_admi
 Exit Function
End If

If Name = "PEKD_GRPDpUSL" Then
 Set FormByName = New frmPEKD_GRPDpUSL_admi
 Exit Function
End If

If Name = "PEKD_1CTR" Then
 Set FormByName = New frmPEKD_1CTR_admi
 Exit Function
End If

End If
If Mode = "main" Then

If Name = "PEKD_SRV" Then
 Set FormByName = New frmPEKD_SRV_main
 Exit Function
End If

If Name = "PEKD_TRTYPE" Then
 Set FormByName = New frmPEKD_TRTYPE_main
 Exit Function
End If

If Name = "PEKD_GOTYPE" Then
 Set FormByName = New frmPEKD_GOTYPE_main
 Exit Function
End If

If Name = "PEKD_TRFGRP" Then
 Set FormByName = New frmPEKD_TRFGRP_main
 Exit Function
End If

If Name = "PEKD_TRFTYPE" Then
 Set FormByName = New frmPEKD_TRFTYPE_main
 Exit Function
End If

If Name = "PEKD_DIRECTION" Then
 Set FormByName = New frmPEKD_DIRECTION_main
 Exit Function
End If

If Name = "PEKD_TRAINS" Then
 Set FormByName = New frmPEKD_TRAINS_main
 Exit Function
End If

If Name = "PEKD_DIRSTATION" Then
 Set FormByName = New frmPEKD_DIRSTATION_main
 Exit Function
End If

If Name = "PEKD_DEPT" Then
 Set FormByName = New frmPEKD_DEPT_main
 Exit Function
End If

If Name = "PEKD_DEPLIMITS" Then
 Set FormByName = New frmPEKD_DEPLIMITS_main
 Exit Function
End If

If Name = "PEKD_DEPDOG" Then
 Set FormByName = New frmPEKD_DEPDOG_main
 Exit Function
End If

If Name = "PEKD_TRAINTYPE" Then
 Set FormByName = New frmPEKD_TRAINTYPE_main
 Exit Function
End If

If Name = "PEKD_ADDS" Then
 Set FormByName = New frmPEKD_ADDS_main
 Exit Function
End If

If Name = "PEKD_POSTTYPE" Then
 Set FormByName = New frmPEKD_POSTTYPE_main
 Exit Function
End If

If Name = "PEKD_INFOSENDTYPE" Then
 Set FormByName = New frmPEKD_INFOSENDTYPE_main
 Exit Function
End If

If Name = "PEKD_AUTO" Then
 Set FormByName = New frmPEKD_AUTO_main
 Exit Function
End If

If Name = "PEKD_GRPDpUSL" Then
 Set FormByName = New frmPEKD_GRPDpUSL_main
 Exit Function
End If

If Name = "PEKD_1CTR" Then
 Set FormByName = New frmPEKD_1CTR_main
 Exit Function
End If

End If
If Mode = "" Then

If Name = "PEKD_SRV" Then
 Set FormByName = New frmPEKD_SRV_
 Exit Function
End If

If Name = "PEKD_TRTYPE" Then
 Set FormByName = New frmPEKD_TRTYPE_
 Exit Function
End If

If Name = "PEKD_GOTYPE" Then
 Set FormByName = New frmPEKD_GOTYPE_
 Exit Function
End If

If Name = "PEKD_TRFGRP" Then
 Set FormByName = New frmPEKD_TRFGRP_
 Exit Function
End If

If Name = "PEKD_TRFTYPE" Then
 Set FormByName = New frmPEKD_TRFTYPE_
 Exit Function
End If

If Name = "PEKD_DIRECTION" Then
 Set FormByName = New frmPEKD_DIRECTION_
 Exit Function
End If

If Name = "PEKD_TRAINS" Then
 Set FormByName = New frmPEKD_TRAINS_
 Exit Function
End If

If Name = "PEKD_DIRSTATION" Then
 Set FormByName = New frmPEKD_DIRSTATION_
 Exit Function
End If

If Name = "PEKD_DEPT" Then
 Set FormByName = New frmPEKD_DEPT_
 Exit Function
End If

If Name = "PEKD_DEPLIMITS" Then
 Set FormByName = New frmPEKD_DEPLIMITS_
 Exit Function
End If

If Name = "PEKD_DEPDOG" Then
 Set FormByName = New frmPEKD_DEPDOG_
 Exit Function
End If

If Name = "PEKD_TRAINTYPE" Then
 Set FormByName = New frmPEKD_TRAINTYPE_
 Exit Function
End If

If Name = "PEKD_ADDS" Then
 Set FormByName = New frmPEKD_ADDS_
 Exit Function
End If

If Name = "PEKD_POSTTYPE" Then
 Set FormByName = New frmPEKD_POSTTYPE_
 Exit Function
End If

If Name = "PEKD_INFOSENDTYPE" Then
 Set FormByName = New frmPEKD_INFOSENDTYPE_
 Exit Function
End If

If Name = "PEKD_AUTO" Then
 Set FormByName = New frmPEKD_AUTO_
 Exit Function
End If

If Name = "PEKD_GRPDpUSL" Then
 Set FormByName = New frmPEKD_GRPDpUSL_
 Exit Function
End If

If Name = "PEKD_1CTR" Then
 Set FormByName = New frmPEKD_1CTR_
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



