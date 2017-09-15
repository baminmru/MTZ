Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "CONT" Then

If Name = "VRRPT_MAIN" Then
 Set FormByName = New frmVRRPT_MAIN_CONT
 Exit Function
End If

If Name = "VRRPT_COSTS" Then
 Set FormByName = New frmVRRPT_COSTS_CONT
 Exit Function
End If

If Name = "VRRPT_MeetingPlan" Then
 Set FormByName = New frmVRRPT_MeetingPlan_CONT
 Exit Function
End If

If Name = "VRRPT_Meeters" Then
 Set FormByName = New frmVRRPT_Meeters_CONT
 Exit Function
End If

End If
If Mode = "dflt" Then

If Name = "VRRPT_MAIN" Then
 Set FormByName = New frmVRRPT_MAIN_dflt
 Exit Function
End If

If Name = "VRRPT_COSTS" Then
 Set FormByName = New frmVRRPT_COSTS_dflt
 Exit Function
End If

If Name = "VRRPT_MeetingPlan" Then
 Set FormByName = New frmVRRPT_MeetingPlan_dflt
 Exit Function
End If

If Name = "VRRPT_Meeters" Then
 Set FormByName = New frmVRRPT_Meeters_dflt
 Exit Function
End If

End If
If Mode = "PRJ" Then

If Name = "VRRPT_MAIN" Then
 Set FormByName = New frmVRRPT_MAIN_PRJ
 Exit Function
End If

If Name = "VRRPT_COSTS" Then
 Set FormByName = New frmVRRPT_COSTS_PRJ
 Exit Function
End If

If Name = "VRRPT_MeetingPlan" Then
 Set FormByName = New frmVRRPT_MeetingPlan_PRJ
 Exit Function
End If

If Name = "VRRPT_Meeters" Then
 Set FormByName = New frmVRRPT_Meeters_PRJ
 Exit Function
End If

End If
If Mode = "PERS" Then

If Name = "VRRPT_MAIN" Then
 Set FormByName = New frmVRRPT_MAIN_PERS
 Exit Function
End If

If Name = "VRRPT_COSTS" Then
 Set FormByName = New frmVRRPT_COSTS_PERS
 Exit Function
End If

If Name = "VRRPT_MeetingPlan" Then
 Set FormByName = New frmVRRPT_MeetingPlan_PERS
 Exit Function
End If

If Name = "VRRPT_Meeters" Then
 Set FormByName = New frmVRRPT_Meeters_PERS
 Exit Function
End If

End If
If Mode = "CLNT" Then

If Name = "VRRPT_MAIN" Then
 Set FormByName = New frmVRRPT_MAIN_CLNT
 Exit Function
End If

If Name = "VRRPT_COSTS" Then
 Set FormByName = New frmVRRPT_COSTS_CLNT
 Exit Function
End If

If Name = "VRRPT_MeetingPlan" Then
 Set FormByName = New frmVRRPT_MeetingPlan_CLNT
 Exit Function
End If

If Name = "VRRPT_Meeters" Then
 Set FormByName = New frmVRRPT_Meeters_CLNT
 Exit Function
End If

End If
If Mode = "" Then

If Name = "VRRPT_MAIN" Then
 Set FormByName = New frmVRRPT_MAIN_
 Exit Function
End If

If Name = "VRRPT_COSTS" Then
 Set FormByName = New frmVRRPT_COSTS_
 Exit Function
End If

If Name = "VRRPT_MeetingPlan" Then
 Set FormByName = New frmVRRPT_MeetingPlan_
 Exit Function
End If

If Name = "VRRPT_Meeters" Then
 Set FormByName = New frmVRRPT_Meeters_
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



