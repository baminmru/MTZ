Attribute VB_Name = "Utils"
Option Explicit

'Utils

Public IsMake_TRASH_Buttons As Boolean
Public IsMake_TRASH_GRID_Menus As Boolean
Public IsMake_HIDDEN_GRID_Cfg As Boolean
Public AllowedGridMenus As Allowed_GridMenuItems
Public SinglePanelSettings As PanelSettings

Public LastTID As String


Public Function LoadTrashSettings()
    If AllowedGridMenus Is Nothing Then
        Set AllowedGridMenus = New Allowed_GridMenuItems
    End If
    
    If SinglePanelSettings Is Nothing Then
        Set SinglePanelSettings = New PanelSettings
    End If
    
    AllowedGridMenus.IsAcc = Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "chkbAcc", "True")
    AllowedGridMenus.IsAdd = Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "chkbAdd", "True")
    AllowedGridMenus.IsBuffer = Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "chkbBuffer", "True")
    AllowedGridMenus.IsCfg = Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "chkbCfg", "True")
    AllowedGridMenus.IsDelete = Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "chkbDelete", "True")
    AllowedGridMenus.IsEdit = Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "chkbEdit", "True")
    AllowedGridMenus.IsFind = Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "chkbFind", "True")
    AllowedGridMenus.IsOpen = Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "chkbOpen", "True")
    AllowedGridMenus.IsPrn = Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "chkbPrn", "True")
    AllowedGridMenus.IsRef = Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "chkbRef", "True")
    
    SinglePanelSettings.AllowSaveButton = Utility.MTZGetSetting("GENERATOR", "VB_OCX_PANEL_BUTTONS", "AllowSave", "True")
    SinglePanelSettings.AllowRefreshButton = Utility.MTZGetSetting("GENERATOR", "VB_OCX_PANEL_BUTTONS", "AllowRefressh", "True")
    SinglePanelSettings.AllowConfigButton = Utility.MTZGetSetting("GENERATOR", "VB_OCX_PANEL_BUTTONS", "AllowConfig", "True")
    SinglePanelSettings.AllowNonModalShow = Utility.MTZGetSetting("GENERATOR", "VB_OCX_PANEL_BUTTONS", "NonModalChild", "True")
        
    IsMake_TRASH_Buttons = CBool(Utility.MTZGetSetting("GENERATOR", "VB_OCX_Buttons", "", "True"))
    IsMake_TRASH_GRID_Menus = CBool(Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "", "True"))
    IsMake_HIDDEN_GRID_Cfg = CBool(Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_HIDDEN_CFG", "", "True"))
    
End Function


Public Function TypeForStruct(ByVal s As PART) As OBJECTTYPE
Dim i As Long
Dim obj As Object
Set obj = s.parent.parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set TypeForStruct = obj


End Function

Public Function GetDynamicFieldFilter(ByRef pDynamicFLTColl As DINAMICFILTERSCRIPT_COL, ByVal tid As String) As String
Dim objItem As DINAMICFILTERSCRIPT
Dim i As Long
    For i = 1 To pDynamicFLTColl.Count
        Set objItem = pDynamicFLTColl.item(i)
        If objItem.Target.ID = tid Then
            GetDynamicFieldFilter = objItem.code
            Exit Function
        End If
    Next
End Function


'Count Stucts for mode
Public Function CountStructs(ByVal s As PART_COL, ByVal mode As String) As Long

Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE
Dim i As Long
Dim obj As Object

Set obj = s.parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set ot = obj


For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.item(i).DefaultMode Then
    Set dom = ot.OBJECTMODE.item(i)
    Exit For
  End If
Next


For i = 1 To ot.OBJECTMODE.Count
If ot.OBJECTMODE.item(i).name = mode Then
  Set om = ot.OBJECTMODE.item(i)
  Exit For
End If
Next

If om Is Nothing Then
  Set om = dom
End If

If om Is Nothing Then
  CountStructs = s.Count
  Exit Function
End If

Dim j As Long, CNT As Long, ok As Boolean
CNT = 0
For j = 1 To s.Count
  ok = True
  For i = 1 To om.STRUCTRESTRICTION.Count
    If om.STRUCTRESTRICTION.item(i).struct.ID = s.item(j).ID Then
      If om.STRUCTRESTRICTION.item(i).AllowRead Then
        ok = True
      Else
        ok = False
      End If
      Exit For
    End If
  Next
  If ok Then CNT = CNT + 1
Next

CountStructs = CNT

End Function


'True if struct exists in this mode
Public Function IsPresent(ByVal st As PART, ByVal mode As String) As Boolean
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE


Dim i As Long
Dim obj As Object

Set obj = st.parent.parent
  
  ' ищем что за тип объекта
  While TypeName(obj) <> "OBJECTTYPE"
    Set obj = obj.parent.parent
  Wend
  
  Set ot = obj
  
  For i = 1 To ot.OBJECTMODE.Count
    If ot.OBJECTMODE.item(i).DefaultMode Then
      Set dom = ot.OBJECTMODE.item(i)
      Exit For
    End If
  Next
  
  
  For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.item(i).name = mode Then
    Set om = ot.OBJECTMODE.item(i)
    Exit For
  End If
  Next
  
  If om Is Nothing Then
    Set om = dom
  End If
  
  If om Is Nothing Then
    IsPresent = True
    Exit Function
  End If
  
  Dim ok As Boolean
  
  ok = True
  For i = 1 To om.STRUCTRESTRICTION.Count
    If om.STRUCTRESTRICTION.item(i).struct.ID = st.ID Then
      If Not om.STRUCTRESTRICTION.item(i).AllowRead Then
        ok = False
      End If
      Exit For
    End If
  Next
  If ok Then IsPresent = True

End Function



'True if part exists and in readonly mode for this mode
Public Function IsPartReadOnly(ByVal st As PART, ByVal mode As String) As Boolean
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE

IsPartReadOnly = False
Dim i As Long
Dim obj As Object

Set obj = st.parent.parent
  
  ' ищем что за тип объекта
  While TypeName(obj) <> "OBJECTTYPE"
    Set obj = obj.parent.parent
  Wend
  
  Set ot = obj
  
  For i = 1 To ot.OBJECTMODE.Count
    If ot.OBJECTMODE.item(i).DefaultMode Then
      Set dom = ot.OBJECTMODE.item(i)
      Exit For
    End If
  Next
  
  
  For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.item(i).name = mode Then
    Set om = ot.OBJECTMODE.item(i)
    Exit For
  End If
  Next
  
  If om Is Nothing Then
    Set om = dom
  End If
  
  If om Is Nothing Then
    IsPartReadOnly = False
    Exit Function
  End If
  
  Dim ok As Boolean
  
  ok = False
  For i = 1 To om.STRUCTRESTRICTION.Count
    If om.STRUCTRESTRICTION.item(i).struct.ID = st.ID Then
      If Not om.STRUCTRESTRICTION.item(i).AllowEdit Then
        ok = True
      End If
      Exit For
    End If
  Next
  IsPartReadOnly = ok

End Function


'True if part exists and allow delete records for this mode
Public Function AllowDeleteFromPart(ByVal st As PART, ByVal mode As String) As Boolean
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE

AllowDeleteFromPart = True
Dim i As Long
Dim obj As Object

Set obj = st.parent.parent
  
  ' ищем что за тип объекта
  While TypeName(obj) <> "OBJECTTYPE"
    Set obj = obj.parent.parent
  Wend
  
  Set ot = obj
  
  For i = 1 To ot.OBJECTMODE.Count
    If ot.OBJECTMODE.item(i).DefaultMode Then
      Set dom = ot.OBJECTMODE.item(i)
      Exit For
    End If
  Next
  
  
  For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.item(i).name = mode Then
    Set om = ot.OBJECTMODE.item(i)
    Exit For
  End If
  Next
  
  If om Is Nothing Then
    Set om = dom
  End If
  
  If om Is Nothing Then
    AllowDeleteFromPart = True
    Exit Function
  End If
  
  Dim ok As Boolean
  
  ok = True
  For i = 1 To om.STRUCTRESTRICTION.Count
    If om.STRUCTRESTRICTION.item(i).struct.ID = st.ID Then
      If Not om.STRUCTRESTRICTION.item(i).AllowDelete Then
        ok = False
      End If
      Exit For
    End If
  Next
  AllowDeleteFromPart = ok

End Function



'True if part exists and allow delete records for this mode
Public Function AllowAddToPart(ByVal st As PART, ByVal mode As String) As Boolean
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE

AllowAddToPart = True
Dim i As Long
Dim obj As Object

Set obj = st.parent.parent
  
  ' ищем что за тип объекта
  While TypeName(obj) <> "OBJECTTYPE"
    Set obj = obj.parent.parent
  Wend
  
  Set ot = obj
  
  For i = 1 To ot.OBJECTMODE.Count
    If ot.OBJECTMODE.item(i).DefaultMode Then
      Set dom = ot.OBJECTMODE.item(i)
      Exit For
    End If
  Next
  
  
  For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.item(i).name = mode Then
    Set om = ot.OBJECTMODE.item(i)
    Exit For
  End If
  Next
  
  If om Is Nothing Then
    Set om = dom
  End If
  
  If om Is Nothing Then
    AllowAddToPart = True
    Exit Function
  End If
  
  Dim ok As Boolean
  
  ok = True
  For i = 1 To om.STRUCTRESTRICTION.Count
    If om.STRUCTRESTRICTION.item(i).struct.ID = st.ID Then
      If Not om.STRUCTRESTRICTION.item(i).AllowAdd Then
        ok = False
      End If
      Exit For
    End If
  Next
  AllowAddToPart = ok

End Function



'True if part exists and allow delete records for this mode
Public Function AllowEditPart(ByVal st As PART, ByVal mode As String) As Boolean
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE

AllowEditPart = True
Dim i As Long
Dim obj As Object

Set obj = st.parent.parent
  
  ' ищем что за тип объекта
  While TypeName(obj) <> "OBJECTTYPE"
    Set obj = obj.parent.parent
  Wend
  
  Set ot = obj
  
  For i = 1 To ot.OBJECTMODE.Count
    If ot.OBJECTMODE.item(i).DefaultMode Then
      Set dom = ot.OBJECTMODE.item(i)
      Exit For
    End If
  Next
  
  
  For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.item(i).name = mode Then
    Set om = ot.OBJECTMODE.item(i)
    Exit For
  End If
  Next
  
  If om Is Nothing Then
    Set om = dom
  End If
  
  If om Is Nothing Then
    AllowEditPart = True
    Exit Function
  End If
  
  Dim ok As Boolean
  
  ok = True
  For i = 1 To om.STRUCTRESTRICTION.Count
    If om.STRUCTRESTRICTION.item(i).struct.ID = st.ID Then
      If Not om.STRUCTRESTRICTION.item(i).AllowEdit Then
        ok = False
      End If
      Exit For
    End If
  Next
  AllowEditPart = ok

End Function






'Count fields for mode
Public Function CountFields(ByVal s As PART, ByVal mode As String) As Long
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE
Dim i As Long
Dim obj As Object
Set obj = s.parent.parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set ot = obj


For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.item(i).DefaultMode Then
    Set dom = ot.OBJECTMODE.item(i)
    Exit For
  End If
Next


For i = 1 To ot.OBJECTMODE.Count
If ot.OBJECTMODE.item(i).name = mode Then
  Set om = ot.OBJECTMODE.item(i)
  Exit For
End If
Next

If om Is Nothing Then
  Set om = dom
End If

If om Is Nothing Then
  CountFields = s.FIELD.Count
  Exit Function
End If

Dim j As Long, CNT As Long, ok As Boolean
CNT = 0
For j = 1 To s.FIELD.Count
  ok = True
  For i = 1 To om.FIELDRESTRICTION.Count
    If om.FIELDRESTRICTION.item(i).ThePart.ID = s.ID Then
      If om.FIELDRESTRICTION.item(i).TheField.ID = s.FIELD.item(j).ID Then
        If om.FIELDRESTRICTION.item(i).AllowRead Then
          ok = True
        Else
          ok = False
        End If
        Exit For
      End If
    End If
  Next
  If ok Then CNT = CNT + 1
Next

CountFields = CNT

End Function



'Yes if field exists for mode
Public Function IsFieldPresent(ByVal s As PART, ByVal FieldID As String, ByVal mode As String) As Boolean
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE
Dim i As Long
Dim obj As Object
Set obj = s.parent.parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set ot = obj


For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.item(i).DefaultMode Then
    Set dom = ot.OBJECTMODE.item(i)
    Exit For
  End If
Next


For i = 1 To ot.OBJECTMODE.Count
If ot.OBJECTMODE.item(i).name = mode Then
  Set om = ot.OBJECTMODE.item(i)
  Exit For
End If
Next

If om Is Nothing Then
  Set om = dom
End If

If om Is Nothing Then
  IsFieldPresent = True
  Exit Function
End If

Dim ok As Boolean

ok = True
For i = 1 To om.FIELDRESTRICTION.Count
  If om.FIELDRESTRICTION.item(i).ThePart Is Nothing Then
  Else
    If om.FIELDRESTRICTION.item(i).ThePart.ID = s.ID Then
      If Not om.FIELDRESTRICTION.item(i).TheField Is Nothing Then
        If om.FIELDRESTRICTION.item(i).TheField.ID = FieldID Then
          If om.FIELDRESTRICTION.item(i).AllowRead Then
            ok = True
          Else
            ok = False
          End If
          Exit For
        End If
      End If
    End If
  End If
 Next
IsFieldPresent = ok

End Function


'Yes if field ReadOnly for mode
Public Function IsFieldReadOnly(ByVal s As PART, ByVal FieldID As String, ByVal mode As String) As Boolean
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE
Dim i As Long
Dim obj As Object
Set obj = s.parent.parent

IsFieldReadOnly = False

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set ot = obj


For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.item(i).DefaultMode Then
    Set dom = ot.OBJECTMODE.item(i)
    Exit For
  End If
Next


For i = 1 To ot.OBJECTMODE.Count
If ot.OBJECTMODE.item(i).name = mode Then
  Set om = ot.OBJECTMODE.item(i)
  Exit For
End If
Next

If om Is Nothing Then
  Set om = dom
End If

If om Is Nothing Then
  IsFieldReadOnly = False
  Exit Function
End If

Dim ok As Boolean

ok = False


For i = 1 To om.FIELDRESTRICTION.Count
  If om.FIELDRESTRICTION.item(i).ThePart Is Nothing Then
  Else
    If om.FIELDRESTRICTION.item(i).ThePart.ID = s.ID Then
      If Not om.FIELDRESTRICTION.item(i).TheField Is Nothing Then
        If om.FIELDRESTRICTION.item(i).TheField.ID = FieldID Then
          If om.FIELDRESTRICTION.item(i).AllowModify Then
            ok = False
          Else
            ok = True
          End If
          Exit For
        End If
      End If
    End If
  End If
 Next

IsFieldReadOnly = ok

End Function






'Yes if field AllowNull for mode
Public Function IsFieldAllowNull(ByVal s As PART, ByVal FieldID As String, ByVal mode As String) As Boolean
Dim ot As OBJECTTYPE
Dim om As OBJECTMODE
Dim dom As OBJECTMODE
Dim i As Long
Dim obj As Object
Set obj = s.parent.parent

IsFieldAllowNull = True

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set ot = obj


For i = 1 To ot.OBJECTMODE.Count
  If ot.OBJECTMODE.item(i).DefaultMode Then
    Set dom = ot.OBJECTMODE.item(i)
    Exit For
  End If
Next


For i = 1 To ot.OBJECTMODE.Count
If ot.OBJECTMODE.item(i).name = mode Then
  Set om = ot.OBJECTMODE.item(i)
  Exit For
End If
Next

If om Is Nothing Then
  Set om = dom
End If

If om Is Nothing Then
  IsFieldAllowNull = (s.FIELD.item(FieldID).AllowNull = Boolean_Da)
  Exit Function
End If

Dim ok As Boolean

ok = True
For i = 1 To om.FIELDRESTRICTION.Count
  If om.FIELDRESTRICTION.item(i).ThePart Is Nothing Then
  Else
    If om.FIELDRESTRICTION.item(i).ThePart.ID = s.ID Then
      If Not om.FIELDRESTRICTION.item(i).TheField Is Nothing Then
        If om.FIELDRESTRICTION.item(i).TheField.ID = FieldID Then
          If om.FIELDRESTRICTION.item(i).MandatoryField = TriState_Net Then
            ok = True
          ElseIf om.FIELDRESTRICTION.item(i).MandatoryField = TriState_Da Then
            ok = False
          Else
            ok = (s.FIELD.item(FieldID).AllowNull = Boolean_Da)
          End If
          Exit For
        End If
      End If
    End If
  End If
 Next
IsFieldAllowNull = ok

End Function


Public Sub AddProp(ctl As ControlData, ByVal name As String, ByVal value As String)
  With ctl.Properties.Add()
    .name = name
    .PropValue = value
  End With
End Sub


Public Sub AddFProp(frm As FormData, ByVal name As String, ByVal value As String)
  With frm.PropertyData.Add()
    .name = name
    .PropValue = value
  End With
End Sub



Public Function AnalizeInterface(s As PART, ByVal mode As String) As String
Dim ot As OBJECTTYPE
Dim obj As Object
Dim nxt As PART
Dim prev As PART
Dim level As String, i As Long
Set obj = s.parent.parent
level = 1

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
  level = level + 1
Wend

Set ot = obj

If level > 2 Then
  AnalizeInterface = "common"
  Exit Function
End If


If level = 2 Then
  Set prev = s.parent.parent
  If CountStructs(prev.PART, mode) > 1 Then
    AnalizeInterface = "common"
    Exit Function
  End If
  
  If CountStructs(s.PART, mode) > 0 Then
    AnalizeInterface = "common"
    Exit Function
  End If
  
  
  If prev.PartType = 0 Or prev.PartType = 2 Then
  
    If s.PartType = 2 Then
      AnalizeInterface = "righttree"
      Exit Function
    End If
    
    If s.PartType = 1 Then
      AnalizeInterface = "rightgrid"
      Exit Function
    End If
    
    If s.PartType = 0 Then
      AnalizeInterface = "rightpanel"
      Exit Function
    End If
  Else
    If s.PartType = 2 Then
      AnalizeInterface = "bottomtree"
      Exit Function
    End If
    
    If s.PartType = 1 Then
      AnalizeInterface = "bottomgrid"
      Exit Function
    End If
    
    If s.PartType = 0 Then
      AnalizeInterface = "bottompanel"
      Exit Function
    End If

  End If
  
End If


If level = 1 Then
    
  If CountStructs(s.PART, mode) > 1 Then
    AnalizeInterface = "common"
    Exit Function
  End If
  
  
  For i = 1 To s.PART.Count
   If IsPresent(s.PART.item(i), mode) Then
      If CountStructs(s.PART.item(1).PART, mode) > 0 Then
        AnalizeInterface = "common"
        Exit Function
      End If
   End If
  Next
    
  If CountStructs(s.PART, mode) = 1 Then
    
    If s.PartType = 2 Then
      AnalizeInterface = "lefttree"
      Exit Function
    End If
    
    If s.PartType = 1 Then
      AnalizeInterface = "topgrid"
      Exit Function
    End If
    
    If s.PartType = 0 Then
      AnalizeInterface = "leftpanel"
      Exit Function
    End If
  Else
    If s.PartType = 3 Or s.PartType = 4 Then 'Расширения
      AnalizeInterface = "extender"
      Exit Function
    End If
  
    If s.PartType = 2 Then
      AnalizeInterface = "tree"
      Exit Function
    End If
    
    If s.PartType = 1 Then
      AnalizeInterface = "grid"
      Exit Function
    End If
    
    If s.PartType = 0 Then
      AnalizeInterface = "panel"
      Exit Function
    End If
  End If
End If
End Function

Public Function GetFirstChild(st As PART, ByVal mode As String) As PART
Dim i As Long
For i = 1 To st.PART.Count
  If IsPresent(st.PART.item(i), mode) Then
    Set GetFirstChild = st.PART.item(i)
    Exit Function
  End If
Next

End Function

Public Function GetParameters(scol As SCRIPT_COL, ByVal tid As String) As PARAMETERS_COL
  Dim i As Long
  
  On Error GoTo bye
  For i = 1 To scol.Count
    If scol.item(i).Target.ID = tid Then
      Set GetParameters = scol.item(i).Parameters
      Exit Function
    End If
  Next
  Exit Function
bye:
End Function



Public Function MakeDefaultCode(P As PART, item As String) As String
  Dim i As Long, j As Long
  Dim out As String
  Dim ss As String
  
  For i = 1 To P.FIELD.Count
    For j = 1 To P.FIELD.item(i).FIELDEXPRESSION.Count
      If P.FIELD.item(i).FIELDEXPRESSION.item(j).Target.ID = LastTID Then
        ss = P.FIELD.item(i).FIELDEXPRESSION.item(j).code
        ss = Replace(ss, ".item", ".i_tem", , , vbTextCompare)
        ss = Replace(ss, "item", item, , , vbTextCompare)
        out = out & Replace(ss, ".i_tem", ".item", , , vbTextCompare) & vbCrLf
      End If
    Next
  Next
  
  For i = 1 To P.FIELD.Count
    ' добавляем получение номера по умолчанию в хвост кода по умолчанию
    If P.FIELD.item(i).IsAutoNumber Then
      If Not P.FIELD.item(i).TheNumerator Is Nothing Then
        If Not P.FIELD.item(i).NumberDateField Is Nothing Then
         ss = "   call GetNumValue(item, """ & P.FIELD.item(i).name & """, """ & P.FIELD.item(i).TheNumerator.ID & """,item." & P.FIELD.item(i).NumberDateField.name & ",""" & P.FIELD.item(i).ZoneTemplate & """, """") "
        Else
         ss = "   call GetNumValue(item, """ & P.FIELD.item(i).name & """, """ & P.FIELD.item(i).TheNumerator.ID & """,Now,""" & P.FIELD.item(i).ZoneTemplate & """, """") "
        End If
        ss = Replace(ss, ".item", ".i_tem", , , vbTextCompare)
        ss = Replace(ss, "item", item, , , vbTextCompare)
        out = out & Replace(ss, ".i_tem", ".item", , , vbTextCompare) & vbCrLf
      End If
    End If
  Next
  
  MakeDefaultCode = out
End Function





Public Function NoLF(ByVal s As String) As String
NoLF = Replace(Replace(Replace(Replace(Replace(s, vbCrLf, " "), vbTab, " "), vbCr, " "), vbLf, " "), "  ", " ")
End Function


Public Function GetScript2(scol As Object, ByVal tid As String) As String
  Dim i As Long
  
  On Error GoTo bye
  For i = 1 To scol.Count
    If scol.item(i).Target.ID = tid Then
      GetScript2 = scol.item(i).code
      Exit Function
    End If
  Next
  Exit Function
bye:

End Function

