Attribute VB_Name = "Support"
Option Explicit

Public MyRole As Object
Public Manager As MTZManager.Main


Public Sub recordSTRtoFile(Msg As String)
  Dim fName As String
  fName = "c:\filter.txt"
  If fName = "" Or Msg = "" Then Exit Sub
  
  Dim intFile As Integer
  Open fName For Append As #1
  Write #1, Msg
  Close #1
End Sub


Public Function GetDocumentMode(ByVal obj As Object) As String
  Dim sid As String
  Dim tn As String
  
  Dim i As Long, j As Long
  GetDocumentMode = ""
  If MyRole Is Nothing Then Exit Function
  tn = obj.TypeName
  sid = obj.StatusID
  For i = 1 To MyRole.ROLES_DOC.Count
    ' нашли тип
    If UCase(MyRole.ROLES_DOC.Item(i).The_Document.Name) = UCase(tn) Then
        ' тип разрешен к работе
        If MyRole.ROLES_DOC.Item(i).The_Denied = YesNo_Net Then
          For j = 1 To MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Count
            ' у документа не определено сосотояние
            'If sid = "" Then
              ' ищем строку без состояния
              If MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Item(j).The_State Is Nothing Then
                ' забираем ттударежим
                GetDocumentMode = MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Item(j).The_Mode.Name
                Exit Function
              End If
            'Else
              ' есть состояние  -  перебираем строки с установленным состоянием
              If Not MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Item(j).The_State Is Nothing Then
                ' нашли
                If MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Item(j).The_State.ID = sid Then
                  If MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Item(j).The_Mode Is Nothing Then
                     GetDocumentMode = ""
                  Else
                     ' получаем режим открытия
                     GetDocumentMode = MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Item(j).The_Mode.Name
                  End If
                  Exit Function
                End If
              End If

            'End If
          Next
        End If
      Exit For
    End If
  Next
  
End Function


Public Function IsDocDenied(ByVal obj As Object) As Boolean
  Dim sid As String
  Dim tn As String
  Dim mode As String
  Dim i As Long
  IsDocDenied = False
  If MyRole Is Nothing Then Exit Function
  tn = obj.TypeName
  sid = obj.StatusID
  For i = 1 To MyRole.ROLES_DOC.Count
    If UCase(MyRole.ROLES_DOC.Item(i).The_Document.Name) = UCase(tn) Then
      If MyRole.ROLES_DOC.Item(i).The_Denied = YesNo_Da Then
        IsDocDenied = True
        Exit Function
      End If
    End If
  Next
End Function

Public Function RoleDocAllowDelete(ByVal obj As Object) As Boolean
  Dim sid As String
  Dim tn As String
  Dim mode As String
  Dim i As Long, j As Long
  If MyRole Is Nothing Then Exit Function
  tn = obj.TypeName
  sid = obj.StatusID
  RoleDocAllowDelete = True
  For i = 1 To MyRole.ROLES_DOC.Count
    If UCase(MyRole.ROLES_DOC.Item(i).The_Document.Name) = UCase(tn) Then
      If MyRole.ROLES_DOC.Item(i).AllowDeleteDoc = YesNo_Net Then
        RoleDocAllowDelete = False
        For j = 1 To MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Count
          If sid <> "" Then
            If Not MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Item(j).The_State Is Nothing Then
              If MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Item(j).The_State.ID = sid Then
                If MyRole.ROLES_DOC.Item(i).ROLES_DOC_STATE.Item(j).AllowDelete = Boolean_Net Then
                  RoleDocAllowDelete = False
                Else
                  RoleDocAllowDelete = True
                End If
                Exit For
              End If
            End If
          End If
        Next
        Exit Function
      End If
    End If
  Next
End Function
