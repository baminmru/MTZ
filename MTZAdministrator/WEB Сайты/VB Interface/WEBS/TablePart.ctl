VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl TablePart 
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
      Begin VB.TextBox txtDeleteCaption 
         Height          =   300
         Left            =   3450
         MaxLength       =   256
         TabIndex        =   38
         ToolTipText     =   "DeleteCaption"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtViewCaption 
         Height          =   300
         Left            =   3450
         MaxLength       =   256
         TabIndex        =   36
         ToolTipText     =   "ViewCaption"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtEditCaption 
         Height          =   300
         Left            =   3450
         MaxLength       =   256
         TabIndex        =   34
         ToolTipText     =   "EditCaption"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtPagerSize 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   32
         ToolTipText     =   "PagerSize"
         Top             =   3930
         Width           =   1800
      End
      Begin VB.TextBox txtDataNavigateUrlField 
         Height          =   300
         Left            =   3450
         MaxLength       =   256
         TabIndex        =   30
         ToolTipText     =   "DataNavigateUrlField"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtClientDefField 
         Height          =   300
         Left            =   3450
         MaxLength       =   256
         TabIndex        =   28
         ToolTipText     =   "ClientDefField"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowEditUserClientDef 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   26
         ToolTipText     =   "AllowEditUserClientDef"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFilterUserClientDef 
         Height          =   300
         Left            =   3450
         MaxLength       =   256
         TabIndex        =   24
         ToolTipText     =   "FilterUserClientDef"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdJournalID 
         Height          =   300
         Left            =   6000
         TabIndex        =   22
         Tag             =   "refopen.ico"
         ToolTipText     =   "JournalID"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtJournalID 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   21
         ToolTipText     =   "JournalID"
         Top             =   405
         Width           =   2550
      End
      Begin VB.TextBox txtAllowEditField 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   19
         ToolTipText     =   "AllowEditField"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtAllowEditRowStatusNameValue 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   17
         ToolTipText     =   "Значение Status для редактирования"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.ComboBox cmbAddStatusColumn_ 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   15
         ToolTipText     =   "Есть Status колонка"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowAddNew 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         ToolTipText     =   "Разрешено добавление"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbAllowDelete 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "Разрешено удаление"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdEditForm 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страница для редактирования"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtEditForm 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Страница для редактирования"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtSelectIDParameterName 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   6
         ToolTipText     =   "Параметр для передачи ID"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFilter_ 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   4
         ToolTipText     =   "Фильтр"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFilterUserIDFieldName_ 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   2
         ToolTipText     =   "Имя поля для фильтра UserID"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblDeleteCaption 
         BackStyle       =   0  'Transparent
         Caption         =   "DeleteCaption:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblViewCaption 
         BackStyle       =   0  'Transparent
         Caption         =   "ViewCaption:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblEditCaption 
         BackStyle       =   0  'Transparent
         Caption         =   "EditCaption:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblPagerSize 
         BackStyle       =   0  'Transparent
         Caption         =   "PagerSize:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDataNavigateUrlField 
         BackStyle       =   0  'Transparent
         Caption         =   "DataNavigateUrlField:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblClientDefField 
         BackStyle       =   0  'Transparent
         Caption         =   "ClientDefField:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblAllowEditUserClientDef 
         BackStyle       =   0  'Transparent
         Caption         =   "AllowEditUserClientDef:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFilterUserClientDef 
         BackStyle       =   0  'Transparent
         Caption         =   "FilterUserClientDef:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblJournalID 
         BackStyle       =   0  'Transparent
         Caption         =   "JournalID:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblAllowEditField 
         BackStyle       =   0  'Transparent
         Caption         =   "AllowEditField:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblAllowEditRowStatusNameValue 
         BackStyle       =   0  'Transparent
         Caption         =   "Значение Status для редактирования:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblAddStatusColumn_ 
         BackStyle       =   0  'Transparent
         Caption         =   "Есть Status колонка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblAllowAddNew 
         BackStyle       =   0  'Transparent
         Caption         =   "Разрешено добавление:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblAllowDelete 
         BackStyle       =   0  'Transparent
         Caption         =   "Разрешено удаление:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblEditForm 
         BackStyle       =   0  'Transparent
         Caption         =   "Страница для редактирования:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSelectIDParameterName 
         BackStyle       =   0  'Transparent
         Caption         =   "Параметр для передачи ID:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFilter_ 
         BackStyle       =   0  'Transparent
         Caption         =   "Фильтр:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFilterUserIDFieldName_ 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя поля для фильтра UserID:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "TablePart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела
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

Private Sub txtFilterUserIDFieldName__Change()
  Changing

End Sub
Private Sub txtFilter__Change()
  Changing

End Sub
Private Sub txtSelectIDParameterName_Change()
  Changing

End Sub
Private Sub txtEditForm_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdEditForm_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WEBS_PAGEDEF", ID, brief, Item.Application.ID) Then
          txtEditForm.Tag = Left(ID, 38)
          txtEditForm = brief
        End If
End Sub
Private Sub cmdEditForm_MenuClick(ByVal sCaption As String)
          txtEditForm.Tag = ""
          txtEditForm = ""
End Sub
Private Sub cmbAllowDelete_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbAllowAddNew_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbAddStatusColumn__Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtAllowEditRowStatusNameValue_Change()
  Changing

End Sub
Private Sub txtAllowEditField_Change()
  Changing

End Sub
Private Sub txtJournalID_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdJournalID_CLick()
  On Error Resume Next
     If txtJournalID.Tag = "" Then
       cmdJournalID_MenuClick "Выбрать"
     Else
       cmdJournalID_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdJournalID_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtJournalID.Tag = ""
          txtJournalID = ""
  End If
  If sCaption = "Открыть" Then
    If txtJournalID.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtJournalID.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtJournalID.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "MTZJrnl")
        If OK Then
          txtJournalID.Tag = Left(ID, 38)
          txtJournalID = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim cancel As Boolean
        brief = "MTZJrnl" & Now
        ook = findObject(Item.Application.Manager, "MTZJrnl", ID, brief, cancel)
        If cancel Then
          Exit Sub
        End If
        If ook Then
              txtJournalID.Tag = ID
              txtJournalID = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "MTZJrnl", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtJournalID.Tag = obj.ID
              txtJournalID = obj.brief
          Else
              txtJournalID.Tag = ""
              txtJournalID = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtFilterUserClientDef_Change()
  Changing

End Sub
Private Sub cmbAllowEditUserClientDef_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtClientDefField_Change()
  Changing

End Sub
Private Sub txtDataNavigateUrlField_Change()
  Changing

End Sub
Private Sub txtPagerSize_Validate(cancel As Boolean)
If txtPagerSize.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPagerSize.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPagerSize.SetFocus
  ElseIf Val(txtPagerSize.Text) <> CLng(Val(txtPagerSize.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtPagerSize.SetFocus
  End If
End If
End Sub
Private Sub txtPagerSize_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPagerSize_Change()
  Changing

End Sub
Private Sub txtEditCaption_Change()
  Changing

End Sub
Private Sub txtViewCaption_Change()
  Changing

End Sub
Private Sub txtDeleteCaption_Change()
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

  On Error Resume Next
txtFilterUserIDFieldName_ = Item.FilterUserIDFieldName_
  On Error Resume Next
txtFilter_ = Item.Filter_
  On Error Resume Next
txtSelectIDParameterName = Item.SelectIDParameterName
If Not Item.EditForm Is Nothing Then
  txtEditForm.Tag = Item.EditForm.ID
  txtEditForm = Item.EditForm.brief
Else
  txtEditForm.Tag = ""
  txtEditForm = ""
End If
 LoadBtnPictures cmdEditForm, cmdEditForm.Tag
  cmdEditForm.RemoveAllMenu
  cmdEditForm.AddMenu "Очистить"
cmbAllowDelete.Clear
cmbAllowDelete.AddItem "Да"
cmbAllowDelete.ItemData(cmbAllowDelete.NewIndex) = -1
cmbAllowDelete.AddItem "Нет"
cmbAllowDelete.ItemData(cmbAllowDelete.NewIndex) = 0
 For iii = 0 To cmbAllowDelete.ListCount - 1
  If Item.AllowDelete = cmbAllowDelete.ItemData(iii) Then
   cmbAllowDelete.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowAddNew.Clear
cmbAllowAddNew.AddItem "Да"
cmbAllowAddNew.ItemData(cmbAllowAddNew.NewIndex) = -1
cmbAllowAddNew.AddItem "Нет"
cmbAllowAddNew.ItemData(cmbAllowAddNew.NewIndex) = 0
 For iii = 0 To cmbAllowAddNew.ListCount - 1
  If Item.AllowAddNew = cmbAllowAddNew.ItemData(iii) Then
   cmbAllowAddNew.ListIndex = iii
   Exit For
  End If
 Next
cmbAddStatusColumn_.Clear
cmbAddStatusColumn_.AddItem "Да"
cmbAddStatusColumn_.ItemData(cmbAddStatusColumn_.NewIndex) = -1
cmbAddStatusColumn_.AddItem "Нет"
cmbAddStatusColumn_.ItemData(cmbAddStatusColumn_.NewIndex) = 0
 For iii = 0 To cmbAddStatusColumn_.ListCount - 1
  If Item.AddStatusColumn_ = cmbAddStatusColumn_.ItemData(iii) Then
   cmbAddStatusColumn_.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtAllowEditRowStatusNameValue = Item.AllowEditRowStatusNameValue
  On Error Resume Next
txtAllowEditField = Item.AllowEditField
If Not Item.JournalID Is Nothing Then
  txtJournalID.Tag = Item.JournalID.ID
  txtJournalID = Item.JournalID.brief
Else
  txtJournalID.Tag = ""
  txtJournalID = ""
End If
 LoadBtnPictures cmdJournalID, cmdJournalID.Tag
  cmdJournalID.RemoveAllMenu
  cmdJournalID.AddMenu "Очистить"
  cmdJournalID.AddMenu "Создать"
  cmdJournalID.AddMenu "Выбрать"
  cmdJournalID.AddMenu "Открыть"
  On Error Resume Next
txtFilterUserClientDef = Item.FilterUserClientDef
cmbAllowEditUserClientDef.Clear
cmbAllowEditUserClientDef.AddItem "Да"
cmbAllowEditUserClientDef.ItemData(cmbAllowEditUserClientDef.NewIndex) = -1
cmbAllowEditUserClientDef.AddItem "Нет"
cmbAllowEditUserClientDef.ItemData(cmbAllowEditUserClientDef.NewIndex) = 0
 For iii = 0 To cmbAllowEditUserClientDef.ListCount - 1
  If Item.AllowEditUserClientDef = cmbAllowEditUserClientDef.ItemData(iii) Then
   cmbAllowEditUserClientDef.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtClientDefField = Item.ClientDefField
  On Error Resume Next
txtDataNavigateUrlField = Item.DataNavigateUrlField
txtPagerSize = Item.PagerSize
  On Error Resume Next
txtEditCaption = Item.EditCaption
  On Error Resume Next
txtViewCaption = Item.ViewCaption
  On Error Resume Next
txtDeleteCaption = Item.DeleteCaption
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

Item.FilterUserIDFieldName_ = txtFilterUserIDFieldName_
Item.Filter_ = txtFilter_
Item.SelectIDParameterName = txtSelectIDParameterName
If txtEditForm.Tag <> "" Then
  Set Item.EditForm = Item.Application.FindRowObject("WEBS_PAGEDEF", txtEditForm.Tag)
Else
  Set Item.EditForm = Nothing
End If
 If cmbAllowDelete.ListIndex >= 0 Then
   Item.AllowDelete = cmbAllowDelete.ItemData(cmbAllowDelete.ListIndex)
 End If
 If cmbAllowAddNew.ListIndex >= 0 Then
   Item.AllowAddNew = cmbAllowAddNew.ItemData(cmbAllowAddNew.ListIndex)
 End If
 If cmbAddStatusColumn_.ListIndex >= 0 Then
   Item.AddStatusColumn_ = cmbAddStatusColumn_.ItemData(cmbAddStatusColumn_.ListIndex)
 End If
Item.AllowEditRowStatusNameValue = txtAllowEditRowStatusNameValue
Item.AllowEditField = txtAllowEditField
If txtJournalID.Tag <> "" Then
  Set Item.JournalID = Item.Application.Manager.GetInstanceObject(txtJournalID.Tag)
Else
  Set Item.JournalID = Nothing
End If
Item.FilterUserClientDef = txtFilterUserClientDef
 If cmbAllowEditUserClientDef.ListIndex >= 0 Then
   Item.AllowEditUserClientDef = cmbAllowEditUserClientDef.ItemData(cmbAllowEditUserClientDef.ListIndex)
 End If
Item.ClientDefField = txtClientDefField
Item.DataNavigateUrlField = txtDataNavigateUrlField
Item.PagerSize = CDbl(txtPagerSize)
Item.EditCaption = txtEditCaption
Item.ViewCaption = txtViewCaption
Item.DeleteCaption = txtDeleteCaption
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



