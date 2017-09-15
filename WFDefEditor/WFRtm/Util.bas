Attribute VB_Name = "Util"
Option Explicit




Public Function FormByName(ByVal Name As String, Optional ByVal Mode As String = "") As Form
If Mode = "" Then

If Name = "WFRtm_main" Then
 Set FormByName = New frmWFRtm_main_
 Exit Function
End If

If Name = "WFRtm_func" Then
 Set FormByName = New frmWFRtm_func_
 Exit Function
End If

If Name = "WFRtm_Pcomm" Then
 Set FormByName = New frmWFRtm_Pcomm_
 Exit Function
End If

If Name = "WFRtm_Param" Then
 Set FormByName = New frmWFRtm_Param_
 Exit Function
End If

If Name = "WFRtm_Doc" Then
 Set FormByName = New frmWFRtm_Doc_
 Exit Function
End If

End If
End Function
Public Sub LoadFromSkin(frm As Form)
  On Error Resume Next
  Dim s As String, arr() As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  Dim ff As Long, buf As String
  ff = FreeFile
  Open s & frm.Name For Input As #ff
  buf = Input(LOF(ff), ff)
  Close #ff
  arr = Split(buf, vbCrLf)
  Dim arr2() As String, i As Long
For i = 0 To UBound(arr)
  arr2 = Split(arr(i), ":")
  Select Case arr2(0)
  Case "FormTag"
    frm.Tag = arr2(1)
  Case "FormTop"
    frm.Top = arr2(1)
  Case "FormLeft"
    frm.Left = arr2(1)
  Case "FormWidth"
    frm.Width = arr2(1)
  Case "FormHeight"
    frm.Height = arr2(1)
  Case Else
    frm.Controls(arr2(0)).Tag = Val(arr2(1))
  End Select
Next
  s = ""
  s = GetSetting("MTZ", "CONFIG", "IMAGEPATH", "")
  If s = "" Then Exit Sub
  Set frm.Icon = LoadPicture(s & frm.Tag)
End Sub

Public Sub SaveToSkin(frm As Form)
  On Error Resume Next
  Dim s As String, buf As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  frm.WindowState = 0
  Dim ff As Long
  ff = FreeFile
  Kill s & frm.Name
  Open s & frm.Name For Output As #ff
  buf = "FormTag:" & frm.Tag
  buf = buf & vbCrLf & "FormTop:" & frm.Top
  buf = buf & vbCrLf & "FormLeft:" & frm.Left
  buf = buf & vbCrLf & "FormWidth:" & frm.Width
  buf = buf & vbCrLf & "FormHeight:" & frm.Height
  Print #ff, buf
  Close #ff
End Sub

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
    MsgBox Err.Description, vbCritical
End Function

