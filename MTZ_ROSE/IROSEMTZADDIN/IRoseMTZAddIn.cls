VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IRoseMTZAddin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Dim MenuItem1 As RoseContextMenuItem

Public Sub OnActivate(RoseApp As RoseApplication)
    Dim i As Integer
    Dim ThisAddin As RoseAddIn
    Dim v1, v2, v3 As RoseContextMenuItem
    
    On Error GoTo fin
    Set ThisAddin = RoseApp.AddInManager.AddIns.GetFirst("MTZAdd-In")
    'Set v1 = ThisAddin.AddContextMenuItem(rsDiagram, "Separator", "")
    'Set v2 = ThisAddin.AddContextMenuItem(rsDiagram, "Submenu MTZ", "")
    Set MenuItem1 = ThisAddin.AddContextMenuItem(rsDiagram, "Link Classes", "AddChild")
    'Set v3 = ThisAddin.AddContextMenuItem(rsDiagram, "endsubmenu", "")
fin:
End Sub

Public Function OnEnableContextMenuItems(RoseApp As RoseApplication, TipoVoce As Integer) As Boolean
    MenuItem1.MenuState = rsEnabled
    OnEnableContextMenuItems = True
End Function

Public Function OnSelectedContextMenuItem(RoseApp As RoseApplication, NomeVoce As String) As Boolean
    If NomeVoce = "AddChild" Then
        AddChild RoseApp
    End If
    OnSelectedContextMenuItem = True
End Function
Public Sub OnDeactivate(RoseApp As RoseApplication)

End Sub


Public Sub AddChild(aRoseApp As RoseApplication)

    Dim Model As RoseModel
    Dim SelectedClasses As RoseClassCollection
    Dim aClass As RoseClass
    Dim pClass As RoseClass
    Dim ClassView As RoseClassView
    Dim x, y, h, w As Integer
    Dim diagr As RoseClassDiagram
    
    Set Model = aRoseApp.CurrentModel
    Set SelectedClasses = Model.GetSelectedClasses

    Set pClass = SelectedClasses.GetAt(1)
    Set aClass = SelectedClasses.GetAt(2)
    
    Call pClass.AddHas(aClass.Name, aClass.Name)
    Set diagr = Model.GetActiveDiagram
    Set ClassView = diagr.GetClassView(aClass)
    x = ClassView.XPosition
    y = ClassView.YPosition
    h = ClassView.Height
    w = ClassView.Width
    Call diagr.RemoveItemView(ClassView)
    Call diagr.AddClass(aClass)
    Set ClassView = diagr.GetClassView(aClass)
    ClassView.XPosition = x
    ClassView.YPosition = y
    ClassView.Height = h
    ClassView.Width = w
    
    Model.GetActiveDiagram.Invalidate
End Sub

