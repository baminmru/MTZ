VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Customizer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 10
Option Explicit

Public Enum TGridSortOrder
    sortAscending = 100
    sortDescending = 101
    sortNoSort = 102
End Enum

'показать форму настройки
'Parameters:
'[IN][OUT]  Grid , тип параметра: Object  - грид,
'[IN]   name , тип параметра: String  - заголовок
'See Also:
'  Preview
'  SwitchGridView
'Example:
'  call me.ShowSumary(...параметры...)
Public Sub ShowSumary(Grid As Object, ByVal name As String)
Attribute ShowSumary.VB_HelpID = 20
  On Error Resume Next
  If Not CBool(GetSetting("MTZ", "CONFIG", "CFGJRNL", False)) Then
    MsgBox "Настройка таблиц запрещена", vbInformation + vbOKOnly, App.Title
    Exit Sub
  End If
  
  Dim f As frmSummary
  Set f = New frmSummary
  f.ShowSummary Grid, name
  Unload f
  Set f = Nothing
End Sub

' открыть форму предварительного просмотра
'Parameters:
'[IN][OUT]  Grid , тип параметра: Object - грид,
'[IN]   name , тип параметра: String  - заголовок
'See Also:
'  ShowSumary
'  SwitchGridView
'Example:
'  call me.Preview(...параметры...)
Public Sub Preview(Grid As Object, ByVal name As String)
Attribute Preview.VB_HelpID = 15
  On Error Resume Next
  Dim f As frmPrintPreview
  Set f = New frmPrintPreview
  Grid.PrintPreview f.Preview
  f.Caption = name
  f.Show vbModal
  Set f = Nothing
  If Err.Number > 0 Then
    MsgBox Err.Description
  End If
  On Error Resume Next
  Grid.PrintPreview Nothing
End Sub

'Parameters:
'[IN][OUT]  Grid , тип параметра: Object  - грид
'See Also:
'  Preview
'  ShowSumary
'Example:
'  call me.SwitchGridView(...параметры...)
Public Sub SwitchGridView(Grid As Object)
Attribute SwitchGridView.VB_HelpID = 25
  On Error Resume Next
  If Grid.View = jgexCard Then
    Grid.View = jgexTable
  Else
    Grid.View = jgexCard
    Grid.AllowCardSizing = True
    Grid.CardBorders = True
  End If
End Sub



