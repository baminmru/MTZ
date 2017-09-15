VERSION 5.00
Begin VB.Form frm_main 
   Caption         =   "world"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   750
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
   Begin hw1GUI.ctl_main ctl 
      Height          =   1500
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin VB.Menu mnuFile 
      Caption         =   "Файл"
      Begin VB.Menu mnuSaveAsXML 
         Caption         =   "Сохранить в формате XML"
      End
      Begin VB.Menu mnuLoadFromXML 
         Caption         =   "Загрузить из XML"
      End
      Begin VB.Menu mnuSecure 
         Caption         =   "Стиль защиты"
      End
      Begin VB.Menu mnuLock 
         Caption         =   "Заблокировать"
      End
      Begin VB.Menu mnuUnlock 
         Caption         =   "Разблокировать"
      End
      Begin VB.Menu mnuRename 
         Caption         =   "Переименовать"
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Выход"
      End
   End
   Begin VB.Menu mnuStatus 
      Caption         =   "Состояния"
      Begin VB.Menu mnuState 
         Caption         =   "..."
         Index           =   1
      End
   End
End
Attribute VB_Name = "frm_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


' Главная форма редактирования режим
Public item As Object
Public Host As GUI
Public ModalMode As Boolean





Private Sub mnuSaveAsXML_Click()
  On Error Resume Next
 If item.Application.MTZSession.CheckRight(item.SecureStyleID, "XMLSAVE") Then
   item.LockResource True
   item.LoadAll
   item.WorkOffline = True
   Dim xdom As MSXML2.DOMDocument
   Set xdom = New MSXML2.DOMDocument
   xdom.loadXML "<root></root>"
   item.XMLSave xdom.lastChild, xdom
   xdom.Save App.Path & "\" & item.ID & ".xml"
   item.WorkOffline = False
 End If
End Sub
Private Sub mnuSecure_Click()
  On Error Resume Next
  item.Application.Manager.ShowSecurityDialog item
End Sub
Private Sub mnuUnlock_Click()
  On Error Resume Next
  If item.IsLocked Then
    item.UnLockResource
  Else
  MsgBox "Объект не заблокирован", vbInformation
  End If
End Sub
Private Sub mnuLock_Click()
  On Error Resume Next
    item.LockResource True
End Sub
Private Sub mnuRename_Click()
  On Error Resume Next
  Dim n As String
  n = InputBox("Новое название", "Переименовать", item.Name)
  If n <> "" And n <> item.Name Then
    item.Name = n
    item.Save
    Me.Caption = item.Name
  End If
End Sub
Private Sub mnuExit_Click()
  On Error Resume Next
  Unload Me
End Sub
Private Sub mnuDelete_Click()
  On Error GoTo bye
  If MsgBox("Удалить документ?", vbQuestion + vbYesNo) = vbYes Then
    item.UnLockResource
    item.WorkOffline = False
    item.Manager.DeleteInstance item.ID
    item.Manager.FreeInstanceObject item.ID
    Unload Me
  End If
  Exit Sub
bye:
   MsgBox err.Description, vbCritical, "Ошибка при удалении"
End Sub
Private Sub mnuLoadFromXML_Click()
 On Error Resume Next
 If item.Application.MTZSession.CheckRight(item.SecureStyleID, "XMLLOAD") Then
  Dim xdom As MSXML2.DOMDocument
  Set xdom = New MSXML2.DOMDocument
  xdom.Load App.Path & "\" & item.ID & ".xml"
  item.XMLLoad xdom.lastChild, 1
  item.WorkOffline = False
  item.BatchUpdate
  Set xdom = Nothing
 End If
End Sub
Private Function ParentForm() As Form
  Set ParentForm = Me
End Function

'Инициализация формы
'Parameters:
'[IN][OUT]   ObjItem , тип параметра: object,
'[IN][OUT]   MyHost , тип параметра: GUI,
'[IN][OUT]  aModalMode , тип параметра: boolean  - ...
'See Also:
'Example:
'  call me.Init({параметры})
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean)
 Set item = ObjItem
 Set Host = MyHost
 ModalMode = aModalMode
 ctl.Init ObjItem, MyHost, aModalMode, Me
 CheckStatus
End Sub
Private Sub CheckStatus()
 If ctl.StatusMenuCount > 0 Then
    Dim i As Long
    Dim mm() As Object
    ReDim mm(1 To ctl.StatusMenuCount)
    For i = 1 To ctl.StatusMenuCount
      Set mm(i) = mnuState(i)
    Next
    ctl.CheckStatusMenu mm
  End If
End Sub
Private Sub Form_Activate()
 CheckStatus
End Sub
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  On Error Resume Next
  'SaveToSkin
End Sub
Private Sub Form_Load()
  On Error Resume Next
  Me.Caption = item.brief
  Dim ff As Long, buf As String
  LoadFromSkin
  ctl.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight
  If ctl.StatusMenuCount > 0 Then
    Dim i As Long
    Dim mm() As Object
    ReDim mm(1 To ctl.StatusMenuCount)
    Set mm(1) = mnuState(1)
    For i = 2 To ctl.StatusMenuCount
     Load mnuState(i)
     Set mm(i) = mnuState(i)
    Next
    ctl.SetupStatusMenu mm
    CheckStatus
  Else
    mnuStatus.Visible = False
  End If
End Sub
Private Sub mnuState_Click(Index As Integer)
  On Error Resume Next
  If BeforeChangeStatus(item, mnuState(Index).Tag) Then
    item.Statusid = mnuState(Index).Tag
    CheckStatus
  End If
End Sub

'Отработка логики контроля изменения состояния
'Parameters:
'[IN][OUT]  item , тип параметра: Object,
'[IN][OUT]   NewStatus , тип параметра: String  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.BeforeChangeStatus(...параметры...)
Public Function BeforeChangeStatus(item As Object, NewStatus As String) As Boolean
  Dim logic As Object
  Dim result As Boolean
  result = True
  On Error Resume Next
  Dim MyUser As Object
  Set MyUser = item.FindRowObject("Users", item.MTZSession.GetSessionUserID())
  Set logic = CreateObject(item.TypeName & "BST.BEFORESTATUS")
  If Not logic Is Nothing Then
    result = logic.Check(item, NewStatus, MyUser, item.TypeName)
    Set logic = Nothing
  End If
  BeforeChangeStatus = result
End Function
Private Sub Form_Unload(Cancel As Integer)
  If Not Host Is Nothing Then
    If Not item Is Nothing Then
      If Not ctl Is Nothing Then
On Error GoTo bye
        If ctl.IsChanged Then
            'If MsgBox("Закрыть без сохранения?", vbCritical + vbYesNo, Me.Caption) = vbYes Then
                If Not CheckIsOk(item) Then
                    If MsgBox("Поля не заполнены. Удалить документ?", vbCritical + vbYesNo, Me.Caption) = vbYes Then
                        On Error Resume Next
                        item.Manager.DeleteInstance item.ID
                        Host.EraseForm item.ID, "", ModalMode
                        Set item = Nothing
                        Exit Sub
                    End If
                End If
            'Else
            '    Cancel = -1
            '    Exit Sub
            'End If
        Else
            If CheckIsNew(item) Then
              On Error Resume Next
              item.Manager.DeleteInstance item.ID
              Host.EraseForm item.ID, "", ModalMode
              Set item = Nothing
              Exit Sub
            End If

            If Not CheckIsOk(item) Then
                If MsgBox("Поля не заполнены. Удалить документ?", vbCritical + vbYesNo, Me.Caption) = vbYes Then
                    On Error Resume Next
                    item.Manager.DeleteInstance item.ID
                    Host.EraseForm item.ID, "", ModalMode
                    Set item = Nothing
                    Exit Sub
                End If
            End If
        End If
On Error Resume Next
      End If
      Host.EraseForm item.ID, "", ModalMode
    End If
  End If
  'SaveToSkin
  Exit Sub
bye:
  If MsgBox("Ошибка при закрытии:" & vbCrLf & err.Description, vbCritical + vbYesNo, "Закрыть окно?") = vbNo Then
    Cancel = -1
  End If


End Sub

'Проверка наличия данных в объекте
'Parameters:
'[IN][OUT]  o , тип параметра: Object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
' dim variable as Variant
' variable = me.CheckIsOk(...параметры...)
' Set variable = me.CheckIsOk(...параметры...)
Public Function CheckIsOk(o As Object)
    'get plain part
    Dim res As Boolean
    Dim p_col As Object
    Dim p As Object
    Dim rs As ADODB.Recordset
    Dim rsf As ADODB.Recordset
    Dim val As Object
    Dim strval As String
    Dim numres As Double

    res = False
    Set rs = o.MTZSession.GetData("select part.name as pName,PartType from part, objecttype where part.parentstructrowid=objecttype.objecttypeid and objecttype.Name='" & o.TypeName & "' and part.parentrowid is null") ' and part.Parttype=0")

    While Not rs.EOF
        Dim PartName As String
        Dim FieldName As String
        PartName = rs!pName & ""
        If rs!PartType = 0 Then
          Set p_col = CallByName(o, PartName, VbGet, False)
          Set p = p_col.item(1)
          Set rsf = o.Application.MTZSession.GetData("select field.name as fName from field, part where field.parentstructrowId=part.partid and part.name='" & PartName & "'")
          While Not rsf.EOF
              FieldName = rsf!fname & ""
              On Error Resume Next
              Set val = CallByName(p, FieldName, VbGet)
              If err.Number <> 0 Then
                  err.Clear
                  numres = CallByName(p, FieldName, VbGet)
                  If err.Number <> 0 Then
                      err.Clear
                      strval = CallByName(p, FieldName, VbGet)
                      If Len(strval) > 0 Then
                          CheckIsOk = True
                      End If
                  Else
                      If numres <> 0 Then
                          CheckIsOk = True
                      End If
                  End If
              Else
                  If Not (val Is Nothing) Then
                      CheckIsOk = True
                  End If
              End If
              rsf.MoveNext
          Wend
        ElseIf rs!PartType <> 3 And rs!PartType <> 4 Then
          On Error Resume Next
          Set p_col = CallByName(o, PartName, VbGet, False)
          If (Not p_col Is Nothing) Then
            If p_col.Count > 0 Then
              CheckIsOk = True
            End If
          End If
        End If
        rs.MoveNext
    Wend
End Function



'Проверка на новый документ
'Parameters:
'[IN][OUT]  o , тип параметра: Object  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'Example:
' dim variable as Variant
' variable = me.CheckIsNew(...параметры...)
' Set variable = me.CheckIsNew(...параметры...)
Public Function CheckIsNew(o As Object)
    'get plain part
    Dim res As Boolean
    Dim p_col As Object
    Dim p As Object
    Dim rs As ADODB.Recordset
    Dim rsf As ADODB.Recordset
    Dim rsfcheck As ADODB.Recordset
    Dim val As Object
    Dim strval As String
    Dim numres As Double

    res = False
    CheckIsNew = True
    Set rs = o.MTZSession.GetData("select part.name as pName from part, objecttype where part.parentrowid is null and  part.parentstructrowid=objecttype.objecttypeid and objecttype.Name='" & o.TypeName & "'") ' and part.Parttype=0")

    While Not rs.EOF
        Dim PartName As String
        Dim FieldName As String
        PartName = rs!pName & ""
        On Error Resume Next
        Set rsf = o.Application.MTZSession.GetData("select Count(*) cnt from " & PartName & " where instanceid='" & o.ID & "'")
        On Error GoTo 0
        If Not rsf Is Nothing Then
          If Not rsf.EOF Then
            If rsf!cnt > 0 Then
              Set rsf = o.Application.MTZSession.GetData("select field.name as fName from field, part where field.parentstructrowId=part.partid and part.name='" & PartName & "'  and  IsAutoNumber=0") 'AllowNull=-1 and
              While Not rsf.EOF
                On Error Resume Next
                err.Clear
                Set rsfcheck = o.Application.MTZSession.GetData("select Count(*) cnt from " & PartName & " where instanceid='" & o.ID & "' and " & rsf!fname & " is not null")
                If (err.Number = 0) Then
                  If Not rsfcheck Is Nothing Then
                    If Not rsfcheck.EOF Then
                      If rsfcheck!cnt > 0 Then
                        CheckIsNew = False
                       End If
                    End If
                  End If
                Else
                  err.Clear
                End If
                On Error GoTo 0
                rsf.MoveNext
              Wend
            End If
          End If
        End If
        Set rsf = Nothing
        rs.MoveNext
    Wend
    Set rs = Nothing
End Function
Private Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
 ctl.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight
End Sub
Private Sub LoadFromSkin()
  On Error Resume Next
  Dim s As String, arr() As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", App.Path & "\LAYOUTS\")
  SaveSetting "MTZ", "CONFIG", "LAYOUTS", s
  Dim ff As Long, buf As String
  ff = FreeFile
  Open s & "MainForm" & "hw1" For Input As #ff
  buf = Input(LOF(ff), ff)
  Close #ff
  arr = Split(buf, vbCrLf)
  Dim arr2() As String, i As Long
For i = 0 To UBound(arr)
  arr2 = Split(arr(i), ":")
  Select Case arr2(0)
  Case "FormTag"
    Tag = arr2(1)
  Case "FormTop"
    Top = arr2(1)
  Case "FormLeft"
    Left = arr2(1)
  Case "FormWidth"
    Width = arr2(1)
  Case "FormHeight"
    Height = arr2(1)
  Case Else
    Controls(arr2(0)).Tag = val(arr2(1))
  End Select
Next
  s = ""
  s = GetSetting("MTZ", "CONFIG", "IMAGEPATH", App.Path & "\IMAGES\")
  SaveSetting "MTZ", "CONFIG", "IMAGEPATH", s
  Set Icon = LoadPicture(s & Me.Tag)
End Sub

Private Sub SaveToSkin()
  On Error Resume Next
  Dim s As String, buf As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", App.Path & "\LAYOUTS\")
  SaveSetting "MTZ", "CONFIG", "LAYOUTS", s
  Me.WindowState = 0
  Dim ff As Long
  ff = FreeFile
  Kill s & "MainForm" & "hw1"
  Open s & "MainForm" & "hw1" For Output As #ff
  buf = "FormTag:" & Me.Tag
  buf = buf & vbCrLf & "FormTop:" & Me.Top
  buf = buf & vbCrLf & "FormLeft:" & Me.Left
  buf = buf & vbCrLf & "FormWidth:" & Me.Width
  buf = buf & vbCrLf & "FormHeight:" & Me.Height
  Print #ff, buf
  Close #ff
End Sub




