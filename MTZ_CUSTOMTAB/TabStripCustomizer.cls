VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TabStripCustomizer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 80
Option Explicit
'управление видимостью табов

Private ts As TabStates
Private AppKey As String
Private Section As String

'инициализация
'параметры
'  TabStrip - табстрип которым мы будем управлять
'  App_Key  - приложение в реестре
'  Section_Key - секция в реестре
'результатов нет
Public Sub Init(TabStrip As Object, App_Key As String, Section_Key As String)
Attribute Init.VB_HelpID = 85
On Error Resume Next
Set ts = New TabStates
Dim tt As Object
Dim i As Long, j As Long
Set tt = TabStrip
For i = 1 To tt.Tabs.Count
  ts.Add True, tt.Tabs.Item(i).Caption, tt.Tabs.Item(i).Key
Next
AppKey = App_Key
Section = Section_Key

End Sub
 
'показать форму настройки табов
'параметры
'  TabStrip - табстрип которым мы будем управлять
'результатов нет
Public Sub Setup(TabStrip As Object)
Attribute Setup.VB_HelpID = 100

'предварительные проверки
If ts Is Nothing Then Exit Sub
On Error Resume Next
If Not CBool(GetSetting("MTZ", "CONFIG", "CFGFRM", False)) Then
    MsgBox "Настройка форм запрещена", vbInformation + vbOKOnly, "Предупреждение"
    Exit Sub
End If

'показали форму
Dim f As frmTSSetup
Dim i As Long
Set f = New frmTSSetup
Set f.ts = ts
f.Init
f.Show vbModal

If f.OK Then
  For i = 1 To ts.Count
    ts.Item(i).Visible = f.LstTab.Selected(i - 1)
  Next
 'сохранили в реестре
  SaveRegistry
 '  установили видимость табов
  RestoreTabs TabStrip
  SetupFromRegistry TabStrip
End If
End Sub

'сохранить данные о видимости в реестре
Public Sub SaveRegistry()
Attribute SaveRegistry.VB_HelpID = 95
If ts Is Nothing Then Exit Sub
  On Error Resume Next
Dim r As String
Dim i As Long, j As Long
For i = 1 To ts.Count
  If r <> "" Then r = r & vbCrLf
  r = r & ts.Item(i).Key & "=" & ts.Item(i).Visible
Next
Call SaveSetting(AppKey, Section, "TABSTRIP", r)
End Sub

'восстановиь видимость из реестра
'параметры
'  TabStrip - табстрип которым мы будем управлять
'результатов нет
Public Sub SetupFromRegistry(TabStrip As Object)
Attribute SetupFromRegistry.VB_HelpID = 105
If ts Is Nothing Then Exit Sub
  On Error Resume Next
Dim r As String
Dim parsed() As String
Dim result() As String

Dim tt As Object
Dim i As Long, j As Long
Set tt = TabStrip

' GetFrom Registry
r = GetSetting(AppKey, Section, "TABSTRIP", "")
If r <> "" Then
  parsed = Split(r, vbCrLf)
  For j = 0 To UBound(parsed)
    result = Split(parsed(j), "=")
    For i = 1 To ts.Count
      If UCase(result(0)) = UCase(ts.Item(i).Key) Then
        ts.Item(i).Visible = CBool(result(1))
        Exit For
      End If
    Next
  Next
  
  ' apply to tabstrip
  For i = 1 To ts.Count
    If Not ts.Item(i).Visible Then
      tt.Tabs.Remove ts.Item(i).Key
    End If
  Next
End If


End Sub

'восстановить состав табов
'параметры
'  TabStrip - табстрип которым мы будем управлять
'результатов нет
Public Sub RestoreTabs(TabStrip As Object)
Attribute RestoreTabs.VB_HelpID = 90
  If ts Is Nothing Then Exit Sub
  On Error Resume Next
  Dim tt As Object
  Dim i As Long, j As Long
  Set tt = TabStrip
  
'  убрать все табы
  While tt.Tabs.Count > 1
    tt.Tabs.Remove 1
  Wend

  ' вернуть согласно списку
  For i = 1 To ts.Count
    If i = 1 Then
      tt.Tabs.Item(i).Key = ts.Item(i).Key
      tt.Tabs.Item(i).Caption = ts.Item(i).Caption
    Else
      Call tt.Tabs.Add(, ts.Item(i).Key, ts.Item(i).Caption)
    End If
  Next
  
End Sub

Private Sub Class_Terminate()
Set ts = Nothing
End Sub
