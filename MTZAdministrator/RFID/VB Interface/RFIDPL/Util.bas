Attribute VB_Name = "Util"
Attribute VB_HelpID = 535
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
Attribute FormByName.VB_HelpID = 540
If Mode = "" Then

If Name = "RFIDPL_DEF" Then
 Set FormByName = New frmRFIDPL_DEF_
 Exit Function
End If

If Name = "RFIDPL_OP" Then
 Set FormByName = New frmRFIDPL_OP_
 Exit Function
End If

If Name = "RFIDPL_HISTORY" Then
 Set FormByName = New frmRFIDPL_HISTORY_
 Exit Function
End If

End If
End Function
Public Sub SaveToBuffer(u As Object)
Attribute SaveToBuffer.VB_HelpID = 550
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      xdom.loadXML "<I></I>"
      u.XMLSave xdom.lastChild, xdom
      u.Application.Manager.SetBuffer u.PartName, xdom.xml
      Set xdom = Nothing
End Sub

Public Function GetFromBuffer(u As Object) As Boolean
Attribute GetFromBuffer.VB_HelpID = 545
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



