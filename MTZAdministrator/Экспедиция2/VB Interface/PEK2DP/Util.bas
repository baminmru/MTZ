Attribute VB_Name = "Util"
Option Explicit








Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "R" Then

If Name = "TheDefenitionDiffP" Then
 Set FormByName = New frmTheDefenitionDiffP_R
 Exit Function
End If

If Name = "TheDiffPath" Then
 Set FormByName = New frmTheDiffPath_R
 Exit Function
End If

If Name = "DopUslTo" Then
 Set FormByName = New frmDopUslTo_R
 Exit Function
End If

If Name = "DopUslFrom" Then
 Set FormByName = New frmDopUslFrom_R
 Exit Function
End If

End If
If Mode = "" Then

If Name = "TheDefenitionDiffP" Then
 Set FormByName = New frmTheDefenitionDiffP_
 Exit Function
End If

If Name = "TheDiffPath" Then
 Set FormByName = New frmTheDiffPath_
 Exit Function
End If

If Name = "DopUslTo" Then
 Set FormByName = New frmDopUslTo_
 Exit Function
End If

If Name = "DopUslFrom" Then
 Set FormByName = New frmDopUslFrom_
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



