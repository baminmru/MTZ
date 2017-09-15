Attribute VB_Name = "Linker"
Option Explicit

Public Function LinkClasses(oDiagram As RoseClassDiagram, Optional ByRef AsCaption As Object)
On Error GoTo Error_Detected
    Dim i As Long
    Dim aclass As RoseClass
    Dim pclass As RoseClass
    Dim oClasses As RoseClassCollection
Set oClasses = oDiagram.GetClasses()
    For i = 1 To oClasses.Count
        Set pclass = oClasses.GetAt(i)
        If Not AsCaption Is Nothing Then
            AsCaption.Caption = pclass.Name
            DoEvents
        End If
        Dim oAttribute As RoseAttribute
        Dim j As Long
        For j = 1 To pclass.Attributes.Count
            Set oAttribute = pclass.Attributes.GetAt(j)
            If Not AsCaption Is Nothing Then
                AsCaption.Caption = pclass.Name + "." + oAttribute.Name
                DoEvents
            End If
            Set aclass = Nothing
            Set aclass = oClasses.GetFirst(oAttribute.Type)
            If Not aclass Is Nothing Then
                
                'Dim lIsndex As Long
                'Dim oAssotiations As RoseAssociationCollection
                Dim Ass As RoseAssociation
                'Set oAssotiations = pclass.GetAssociations()
'                lIsndex = oAssotiations.FindFirst("+ " + aclass.Name)
'                If lIsndex <= 0 Then
                    Set Ass = pclass.AddAssociation(aclass.Name, aclass.Name)
                    Ass.Role1.Name = ""
                    'Ass.Role2 = ""
                    RemoveAndPlaceClass oDiagram, aclass, pclass
'                End If
            End If
        Next
    Next
    Exit Function
Error_Detected:
    MsgBox Err.Description
    Exit Function
    Resume
End Function

Private Function RemoveAndPlaceClass(oDiagram As RoseClassDiagram, aclass, pclass)
On Error GoTo Error_Detected
    Dim ClassView As RoseClassView
    Dim x, y, h, w As Integer
    Dim diagr As RoseClassDiagram
    
    Set diagr = oDiagram
    Set ClassView = oDiagram.GetClassView(aclass) ' As RoseClassDiagram
    x = ClassView.XPosition
    y = ClassView.YPosition
    h = ClassView.Height
    w = ClassView.Width
    Call diagr.RemoveItemView(ClassView)
    Call diagr.AddClass(aclass)
    Set ClassView = diagr.GetClassView(aclass)
    ClassView.XPosition = x
    ClassView.YPosition = y
    ClassView.Height = h
    ClassView.Width = w
    Exit Function
Error_Detected:
    MsgBox Err.Description
    Exit Function
    Resume
End Function

Public Function MakeDocInfo(s1 As String, s2 As String) As String

    If UCase(Trim(s1)) = UCase(Trim(s2)) Then
        MakeDocInfo = s1
    ElseIf Trim(s2) <> "" Then
        MakeDocInfo = s1 + vbCrLf + "--" + s2
    Else
        MakeDocInfo = s1
    End If
End Function

Public Function PrintDocInfo(s1 As String) As String
    If InStr(1, s1, "--") Then
        PrintDocInfo = Replace(s1, "--", vbCrLf)
    Else
        PrintDocInfo = s1
    End If
End Function
