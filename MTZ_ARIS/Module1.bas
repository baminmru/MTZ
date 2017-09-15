Attribute VB_Name = "Module1"
Option Explicit



Public Sub MakeFieldType(f As MTZMetaModel.FIELD, obj As ObjDef)
Dim i As Long
Dim ft As FIELDTYPE
Dim ot As OBJECTTYPE
Dim p As PART
Dim att As Attr
Dim tname As String
f.ReferenceType = ReferenceType_Skalyrnoe_pole_OPN_ne_ssilkaCLS
Set att = obj.Attribute(AT_DESC, LocaleID)
tname = att.Value

Set ft = FieldTypeByName(tname, f.Application)
If Not ft Is Nothing Then
  Set f.FIELDTYPE = ft
  Exit Sub
End If
If ft.Name = "Object" Then
  Set ft = FieldTypeByName("Reference", f.Application)
  Set f.FIELDTYPE = ft
  f.ReferenceType = ReferenceType_Na_ob_ekt_
  Exit Sub
End If

If ft.Name = "Row" Then
  Set ft = FieldTypeByName("Reference", f.Application)
  Set f.FIELDTYPE = ft
  f.ReferenceType = ReferenceType_Na_stroku_razdela
  Exit Sub
End If

Set ot = TypeByName(tname, f.Application)
If Not ot Is Nothing Then
  Set ft = FieldTypeByName("Reference", f.Application)
  Set f.FIELDTYPE = ft
  f.ReferenceType = ReferenceType_Na_ob_ekt_
  Set f.RefToType = ot
  Exit Sub
End If
For i = 1 To f.Application.OBJECTTYPE.Count
  Set p = PartByName(tname, f.Application.OBJECTTYPE.Item(i))
  If Not p Is Nothing Then
    Set ft = FieldTypeByName("Reference", f.Application)
    Set f.FIELDTYPE = ft
    f.ReferenceType = ReferenceType_Na_stroku_razdela
    Set f.RefToPart = p
    Exit Sub
  End If
Next

Set ft = FieldTypeByName("Memo", f.Application)
Set f.FIELDTYPE = ft

End Sub

Public Function FieldTypeByName(ByVal Name As String, model As MTZMetaModel.Application) As MTZMetaModel.FIELDTYPE
  Dim i As Long
  For i = 1 To model.FIELDTYPE.Count
    If UCase(model.FIELDTYPE.Item(i).Name) = UCase(Name) Then
      Set FieldTypeByName = model.FIELDTYPE.Item(i)
      Exit Function
    End If
  Next
  Debug.Print "Unknown field type <<" & Name & ">>"
End Function


Public Function TypeByName(ByVal Name As String, model As MTZMetaModel.Application) As MTZMetaModel.OBJECTTYPE
  Dim i As Long
  For i = 1 To model.OBJECTTYPE.Count
    If UCase(model.OBJECTTYPE.Item(i).Name) = UCase(Name) Then
      Set TypeByName = model.OBJECTTYPE.Item(i)
      Exit Function
    End If
  Next
End Function

Public Function TypeByName2(ByVal Name As String, model As MTZMetaModel.Application) As MTZMetaModel.OBJECTTYPE
  Dim i As Long
  For i = 1 To model.OBJECTTYPE.Count
    If UCase(model.OBJECTTYPE.Item(i).Name) = UCase(Name) Then
      Set TypeByName2 = model.OBJECTTYPE.Item(i)
      Exit Function
    End If
    If UCase(model.OBJECTTYPE.Item(i).the_comment) = UCase(Name) Then
      Set TypeByName2 = model.OBJECTTYPE.Item(i)
      Exit Function
    End If
  Next
End Function

Public Function AppByName(ByVal Name As String, model As MTZMetaModel.Application) As MTZMetaModel.MTZAPP
  Dim i As Long
  Dim a As MTZAPP
  For i = 1 To model.MTZAPP.Count
    If UCase(model.MTZAPP.Item(i).Name) = UCase(Name) Then
      Set AppByName = model.MTZAPP.Item(i)
      Exit Function
    End If
  Next
  Set a = model.MTZAPP.Add
  a.Name = Name
  a.Save
  Set AppByName = a
End Function


Public Function FieldByName(ByVal Name As String, opart As MTZMetaModel.PART) As MTZMetaModel.FIELD
  Dim i As Long
  For i = 1 To opart.FIELD.Count
    If UCase(opart.FIELD.Item(i).Name) = UCase(Name) Then
      Set FieldByName = opart.FIELD.Item(i)
      Exit Function
    End If
  Next
End Function


Public Function PartByName(ByVal Name As String, otype As MTZMetaModel.OBJECTTYPE) As MTZMetaModel.PART
  Dim i As Long
  Dim p As PART
  For i = 1 To otype.PART.Count
    If UCase(otype.PART.Item(i).Name) = UCase(Name) Then
      Set PartByName = otype.PART.Item(i)
      Exit For
    End If
    Set p = PartByName2(Name, otype.PART.Item(i))
    If Not p Is Nothing Then
      Set PartByName = p
      Exit Function
    End If
  Next
End Function


Private Function PartByName2(ByVal Name As String, opart As MTZMetaModel.PART) As MTZMetaModel.PART
  Dim i As Long
  Dim p As PART
  For i = 1 To opart.PART.Count
    If UCase(opart.PART.Item(i).Name) = UCase(Name) Then
      Set PartByName2 = opart.PART.Item(i)
      Exit Function
    End If
    Set p = PartByName2(Name, opart.PART.Item(i))
    If Not p Is Nothing Then
      Set PartByName2 = p
      Exit Function
    End If
  Next
End Function


Public Function GetNewSequence(o As Object)
Dim i As Long
Dim ns As Long
ns = 0
For i = 1 To o.Count
  If ns <= o.Item(i).Sequence Then
   ns = o.Item(i).Sequence
  End If
Next
GetNewSequence = ns + 1
End Function

Public Function GetFirstRow(s As String) As String
On Error Resume Next
Dim a() As String
a = Split(s, vbCrLf)
GetFirstRow = a(0)
End Function
