VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl PART 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   1000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin VB.ComboBox cmbIsJormalChange 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   37
         ToolTipText     =   "Вести журнал изменений"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtruleBrief 
         Height          =   300
         Left            =   3450
         MaxLength       =   500
         TabIndex        =   35
         ToolTipText     =   "Правило составления BRIEF поля"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtshablonBrief 
         Height          =   300
         Left            =   3450
         MaxLength       =   100
         TabIndex        =   33
         ToolTipText     =   "Шаблон для краткого отображения"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdExtenderObject 
         Height          =   300
         Left            =   6000
         TabIndex        =   31
         Tag             =   "refopen.ico"
         ToolTipText     =   "Объект расширения"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtExtenderObject 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   30
         ToolTipText     =   "Объект расширения"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.ComboBox cmbAddBehaivor 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   28
         ToolTipText     =   "Поведение при добавлении"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdOnDelete 
         Height          =   300
         Left            =   6000
         TabIndex        =   26
         Tag             =   "refopen.ico"
         ToolTipText     =   "При удалении"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOnDelete 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   25
         ToolTipText     =   "При удалении"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdOnRun 
         Height          =   300
         Left            =   6000
         TabIndex        =   23
         Tag             =   "refopen.ico"
         ToolTipText     =   "При открытии"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOnRun 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   22
         ToolTipText     =   "При открытии"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdOnSave 
         Height          =   300
         Left            =   6000
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "При сохранении"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOnSave 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "При сохранении"
         Top             =   405
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdOnCreate 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "При создании"
         Top             =   6240
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOnCreate 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "При создании"
         Top             =   6240
         Width           =   2550
      End
      Begin VB.ComboBox cmbManualRegister 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   14
         ToolTipText     =   "Исключить из индексирования"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.ComboBox cmbNoLog 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "Не записывать в журнал"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.TextBox txtthe_Comment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   10
         ToolTipText     =   "Описание"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   8
         ToolTipText     =   "Название"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtCaption 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "Заголовок"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbPartType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "Тип структры "
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtSequence 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "№ п/п"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblIsJormalChange 
         BackStyle       =   0  'Transparent
         Caption         =   "Вести журнал изменений:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblruleBrief 
         BackStyle       =   0  'Transparent
         Caption         =   "Правило составления BRIEF поля:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblshablonBrief 
         BackStyle       =   0  'Transparent
         Caption         =   "Шаблон для краткого отображения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblExtenderObject 
         BackStyle       =   0  'Transparent
         Caption         =   "Объект расширения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblAddBehaivor 
         BackStyle       =   0  'Transparent
         Caption         =   "Поведение при добавлении:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblOnDelete 
         BackStyle       =   0  'Transparent
         Caption         =   "При удалении:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblOnRun 
         BackStyle       =   0  'Transparent
         Caption         =   "При открытии:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblOnSave 
         BackStyle       =   0  'Transparent
         Caption         =   "При сохранении:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   18
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblOnCreate 
         BackStyle       =   0  'Transparent
         Caption         =   "При создании:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblManualRegister 
         BackStyle       =   0  'Transparent
         Caption         =   "Исключить из индексирования:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblNoLog 
         BackStyle       =   0  'Transparent
         Caption         =   "Не записывать в журнал:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblthe_Comment 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCaption 
         BackStyle       =   0  'Transparent
         Caption         =   "Заголовок:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPartType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип структры :"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSequence 
         BackStyle       =   0  'Transparent
         Caption         =   "№ п/п:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "PART"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Раздел объекта
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean






'Функция поиска строки
'Parameters:
'[IN][OUT]  Runner , тип параметра: mtzmanager.main,
'[IN]   TypeName , тип параметра: String,
'[IN][OUT]   ID , тип параметра: string,
'[IN][OUT]   Brief , тип параметра: string,
'[IN][OUT]   Cancel , тип параметра: boolean  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.findObject(...параметры...)
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, cancel)
bye:
findObject = result
End Function

'Признак изменения строки
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
'  variable = me.IsChanged()
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtSequence_Validate(cancel As Boolean)
If txtSequence.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSequence.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtSequence.SetFocus
  ElseIf Val(txtSequence.Text) <> CLng(Val(txtSequence.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtSequence.SetFocus
  End If
End If
End Sub
Private Sub txtSequence_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtSequence_Change()
  Changing

End Sub
Private Sub cmbPartType_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCaption_Change()
  Changing

End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtthe_Comment_Change()
  Changing

End Sub
Private Sub cmbNoLog_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbManualRegister_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtOnCreate_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdOnCreate_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PARTMENU", ID, brief) Then
          txtOnCreate.Tag = Left(ID, 38)
          txtOnCreate = brief
        End If
End Sub
Private Sub cmdOnCreate_MenuClick(ByVal sCaption As String)
          txtOnCreate.Tag = ""
          txtOnCreate = ""
End Sub
Private Sub txtOnSave_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdOnSave_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PARTMENU", ID, brief) Then
          txtOnSave.Tag = Left(ID, 38)
          txtOnSave = brief
        End If
End Sub
Private Sub cmdOnSave_MenuClick(ByVal sCaption As String)
          txtOnSave.Tag = ""
          txtOnSave = ""
End Sub
Private Sub txtOnRun_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdOnRun_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PARTMENU", ID, brief) Then
          txtOnRun.Tag = Left(ID, 38)
          txtOnRun = brief
        End If
End Sub
Private Sub cmdOnRun_MenuClick(ByVal sCaption As String)
          txtOnRun.Tag = ""
          txtOnRun = ""
End Sub
Private Sub txtOnDelete_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdOnDelete_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PARTMENU", ID, brief) Then
          txtOnDelete.Tag = Left(ID, 38)
          txtOnDelete = brief
        End If
End Sub
Private Sub cmdOnDelete_MenuClick(ByVal sCaption As String)
          txtOnDelete.Tag = ""
          txtOnDelete = ""
End Sub
Private Sub cmbAddBehaivor_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtExtenderObject_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdExtenderObject_CLick()
  On Error Resume Next
     If txtExtenderObject.Tag = "" Then
       cmdExtenderObject_MenuClick "Выбрать"
     Else
       cmdExtenderObject_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdExtenderObject_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtExtenderObject.Tag = ""
          txtExtenderObject = ""
  End If
  If sCaption = "Открыть" Then
    If txtExtenderObject.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtExtenderObject.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtExtenderObject.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "")
        If OK Then
          txtExtenderObject.Tag = Left(ID, 38)
          txtExtenderObject = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Set obj = Item.Application.Manager.GetNewObject()
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtExtenderObject.Tag = obj.ID
              txtExtenderObject = obj.brief
          Else
              txtExtenderObject.Tag = ""
              txtExtenderObject = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtshablonBrief_Change()
  Changing

End Sub
Private Sub txtruleBrief_Change()
  Changing

End Sub
Private Sub cmbIsJormalChange_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub

'Контроль правильности заполнения данных на панели редактирования
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.IsOK()
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtSequence.Text)
If mIsOK Then mIsOK = (cmbPartType.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(txtCaption.Text)
If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = (cmbNoLog.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbManualRegister.ListIndex >= 0)
  IsOK = mIsOK
End Function
Private Function AddSQLRefIds(ByVal strTo As String, ByVal fldName As String, ByVal strFrom As String) As String
  Dim XMLDocFrom As New DOMDocument
  Dim XMLDocTo As New DOMDocument
  AddSQLRefIds = strTo
  On Error GoTo err
  Call XMLDocTo.loadXML(strTo)
  Call XMLDocFrom.loadXML(strFrom)
  Dim Node As MSXML2.IXMLDOMNode
  Dim ID As String
  For Each Node In XMLDocFrom.childNodes.Item(0).childNodes
    If (Node.baseName = "ID") Then
      ID = Node.Text
      Dim NodeTO As MSXML2.IXMLDOMNode
      Dim bAdded As Boolean
      bAdded = False
      For Each NodeTO In XMLDocTo.childNodes.Item(0).childNodes
       If (NodeTO.baseName = fldName & "ID") Then
         NodeTO.Text = ID
         bAdded = True
         Exit For
       End If
      Next
      If (Not bAdded) Then
       Dim newNode As MSXML2.IXMLDOMNode
       Set newNode = XMLDocTo.createNode(MSXML2.NODE_ELEMENT, fldName & "ID", XMLDocTo.namespaceURI)
        newNode.Text = ID
       Call XMLDocTo.childNodes.Item(0).appendChild(newNode)
      End If
      AddSQLRefIds = XMLDocTo.xml
      Exit For
    End If
  Next
err:
End Function

'Инициализация контролов панели
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.InitPanel()
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

txtSequence = Item.Sequence
cmbPartType.Clear
cmbPartType.AddItem "Расширение"
cmbPartType.ItemData(cmbPartType.NewIndex) = 3
cmbPartType.AddItem "Коллекция"
cmbPartType.ItemData(cmbPartType.NewIndex) = 1
cmbPartType.AddItem "Строка"
cmbPartType.ItemData(cmbPartType.NewIndex) = 0
cmbPartType.AddItem "Дерево"
cmbPartType.ItemData(cmbPartType.NewIndex) = 2
cmbPartType.AddItem "Расширение с данными"
cmbPartType.ItemData(cmbPartType.NewIndex) = 4
 For iii = 0 To cmbPartType.ListCount - 1
  If Item.PartType = cmbPartType.ItemData(iii) Then
   cmbPartType.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtCaption = Item.Caption
  On Error Resume Next
txtName = Item.Name
txtthe_Comment = Item.the_Comment
cmbNoLog.Clear
cmbNoLog.AddItem "Да"
cmbNoLog.ItemData(cmbNoLog.NewIndex) = -1
cmbNoLog.AddItem "Нет"
cmbNoLog.ItemData(cmbNoLog.NewIndex) = 0
 For iii = 0 To cmbNoLog.ListCount - 1
  If Item.NoLog = cmbNoLog.ItemData(iii) Then
   cmbNoLog.ListIndex = iii
   Exit For
  End If
 Next
cmbManualRegister.Clear
cmbManualRegister.AddItem "Да"
cmbManualRegister.ItemData(cmbManualRegister.NewIndex) = -1
cmbManualRegister.AddItem "Нет"
cmbManualRegister.ItemData(cmbManualRegister.NewIndex) = 0
 For iii = 0 To cmbManualRegister.ListCount - 1
  If Item.ManualRegister = cmbManualRegister.ItemData(iii) Then
   cmbManualRegister.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.OnCreate Is Nothing Then
  txtOnCreate.Tag = Item.OnCreate.ID
  txtOnCreate = Item.OnCreate.brief
Else
  txtOnCreate.Tag = ""
  txtOnCreate = ""
End If
 LoadBtnPictures cmdOnCreate, cmdOnCreate.Tag
  cmdOnCreate.RemoveAllMenu
  cmdOnCreate.AddMenu "Очистить"
If Not Item.OnSave Is Nothing Then
  txtOnSave.Tag = Item.OnSave.ID
  txtOnSave = Item.OnSave.brief
Else
  txtOnSave.Tag = ""
  txtOnSave = ""
End If
 LoadBtnPictures cmdOnSave, cmdOnSave.Tag
  cmdOnSave.RemoveAllMenu
  cmdOnSave.AddMenu "Очистить"
If Not Item.OnRun Is Nothing Then
  txtOnRun.Tag = Item.OnRun.ID
  txtOnRun = Item.OnRun.brief
Else
  txtOnRun.Tag = ""
  txtOnRun = ""
End If
 LoadBtnPictures cmdOnRun, cmdOnRun.Tag
  cmdOnRun.RemoveAllMenu
  cmdOnRun.AddMenu "Очистить"
If Not Item.OnDelete Is Nothing Then
  txtOnDelete.Tag = Item.OnDelete.ID
  txtOnDelete = Item.OnDelete.brief
Else
  txtOnDelete.Tag = ""
  txtOnDelete = ""
End If
 LoadBtnPictures cmdOnDelete, cmdOnDelete.Tag
  cmdOnDelete.RemoveAllMenu
  cmdOnDelete.AddMenu "Очистить"
cmbAddBehaivor.Clear
cmbAddBehaivor.AddItem "AddForm"
cmbAddBehaivor.ItemData(cmbAddBehaivor.NewIndex) = 0
cmbAddBehaivor.AddItem "RunAction"
cmbAddBehaivor.ItemData(cmbAddBehaivor.NewIndex) = 2
cmbAddBehaivor.AddItem "RefreshOnly"
cmbAddBehaivor.ItemData(cmbAddBehaivor.NewIndex) = 1
 For iii = 0 To cmbAddBehaivor.ListCount - 1
  If Item.AddBehaivor = cmbAddBehaivor.ItemData(iii) Then
   cmbAddBehaivor.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.ExtenderObject Is Nothing Then
  txtExtenderObject.Tag = Item.ExtenderObject.ID
  txtExtenderObject = Item.ExtenderObject.brief
Else
  txtExtenderObject.Tag = ""
  txtExtenderObject = ""
End If
 LoadBtnPictures cmdExtenderObject, cmdExtenderObject.Tag
  cmdExtenderObject.RemoveAllMenu
  cmdExtenderObject.AddMenu "Очистить"
  cmdExtenderObject.AddMenu "Создать"
  cmdExtenderObject.AddMenu "Выбрать"
  cmdExtenderObject.AddMenu "Открыть"
  On Error Resume Next
txtshablonBrief = Item.shablonBrief
  On Error Resume Next
txtruleBrief = Item.ruleBrief
cmbIsJormalChange.Clear
cmbIsJormalChange.AddItem "Да"
cmbIsJormalChange.ItemData(cmbIsJormalChange.NewIndex) = -1
cmbIsJormalChange.AddItem "Нет"
cmbIsJormalChange.ItemData(cmbIsJormalChange.NewIndex) = 0
 For iii = 0 To cmbIsJormalChange.ListCount - 1
  If Item.IsJormalChange = cmbIsJormalChange.ItemData(iii) Then
   cmbIsJormalChange.ListIndex = iii
   Exit For
  End If
 Next
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub

'Сохранение
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Save({параметры})
Public Sub Save()
If OnInit Then Exit Sub

Item.Sequence = CDbl(txtSequence)
 If cmbPartType.ListIndex >= 0 Then
   Item.PartType = cmbPartType.ItemData(cmbPartType.ListIndex)
 End If
Item.Caption = txtCaption
Item.Name = txtName
Item.the_Comment = txtthe_Comment
 If cmbNoLog.ListIndex >= 0 Then
   Item.NoLog = cmbNoLog.ItemData(cmbNoLog.ListIndex)
 End If
 If cmbManualRegister.ListIndex >= 0 Then
   Item.ManualRegister = cmbManualRegister.ItemData(cmbManualRegister.ListIndex)
 End If
If txtOnCreate.Tag <> "" Then
  Set Item.OnCreate = Item.Application.FindRowObject("PARTMENU", txtOnCreate.Tag)
Else
  Set Item.OnCreate = Nothing
End If
If txtOnSave.Tag <> "" Then
  Set Item.OnSave = Item.Application.FindRowObject("PARTMENU", txtOnSave.Tag)
Else
  Set Item.OnSave = Nothing
End If
If txtOnRun.Tag <> "" Then
  Set Item.OnRun = Item.Application.FindRowObject("PARTMENU", txtOnRun.Tag)
Else
  Set Item.OnRun = Nothing
End If
If txtOnDelete.Tag <> "" Then
  Set Item.OnDelete = Item.Application.FindRowObject("PARTMENU", txtOnDelete.Tag)
Else
  Set Item.OnDelete = Nothing
End If
 If cmbAddBehaivor.ListIndex >= 0 Then
   Item.AddBehaivor = cmbAddBehaivor.ItemData(cmbAddBehaivor.ListIndex)
 End If
If txtExtenderObject.Tag <> "" Then
  Set Item.ExtenderObject = Item.Application.Manager.GetInstanceObject(txtExtenderObject.Tag)
Else
  Set Item.ExtenderObject = Nothing
End If
Item.shablonBrief = txtshablonBrief
Item.ruleBrief = txtruleBrief
 If cmbIsJormalChange.ListIndex >= 0 Then
   Item.IsJormalChange = cmbIsJormalChange.ItemData(cmbIsJormalChange.ListIndex)
 End If
 mIsChanged = False
 RaiseEvent Changed
End Sub

'Подбор размера панели по размеру контролов
'Parameters:
'[IN][OUT]  x , тип параметра: Single,
'[IN][OUT]   y , тип параметра: single  - ...
'See Also:
'Example:
'  call me.OptimalSize({параметры})
 Public Sub OptimalSize(x As Single, y As Single)
   Panel.OptimalSize x, y
   x = x + Panel.Left
   y = y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim x As Single, y As Single
   Panel.OptimalSize x, y
   OptimalY = y
 End Function

'Открытие окна настройки панели
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
   Panel.Customize
 End Sub

'Строка положения контролов на панели для сохранения позиций
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. PanelCustomisationString
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property

'Восстановление  позиций контролов из строки
'Parameters:
'[IN][OUT]  s , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. PanelCustomisationString = value
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property

'Разрешения изменений контролов
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Enabled
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property

'Запрет \ Разрешение изменений контролов
'Parameters:
'[IN]   v , тип параметра: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. Enabled = value
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



