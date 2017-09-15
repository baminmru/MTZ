VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl FIELD 
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
      Begin VB.TextBox txtTheMask 
         Height          =   300
         Left            =   6600
         MaxLength       =   64
         TabIndex        =   45
         ToolTipText     =   "Маска"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txttheNameClass 
         Height          =   300
         Left            =   6600
         MaxLength       =   100
         TabIndex        =   43
         ToolTipText     =   "Имя класса для мастера строк"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtshablonBrief 
         Height          =   300
         Left            =   6600
         MaxLength       =   100
         TabIndex        =   41
         ToolTipText     =   "Шаблон для краткого отображения"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   39
         ToolTipText     =   "Описание"
         Top             =   5340
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdNumberDateField 
         Height          =   300
         Left            =   6000
         TabIndex        =   37
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поле для расчета даты"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtNumberDateField 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   36
         ToolTipText     =   "Поле для расчета даты"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.TextBox txtZoneTemplate 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   34
         ToolTipText     =   "Шаблон зоны нумерации"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheNumerator 
         Height          =   300
         Left            =   6000
         TabIndex        =   32
         Tag             =   "refopen.ico"
         ToolTipText     =   "Нумератор"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheNumerator 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   31
         ToolTipText     =   "Нумератор"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.ComboBox cmbIsAutoNumber 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   29
         ToolTipText     =   "Автонумерация"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbCreateRefOnly 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   27
         ToolTipText     =   "Только создание объекта"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbInternalReference 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   25
         ToolTipText     =   "Ссылка в пределах объекта"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdRefToPart 
         Height          =   300
         Left            =   6000
         TabIndex        =   23
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ссылка на раздел"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtRefToPart 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   22
         ToolTipText     =   "Ссылка на раздел"
         Top             =   405
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdRefToType 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ссылка на тип"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtRefToType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Ссылка на тип"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.ComboBox cmbReferenceType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   17
         ToolTipText     =   "Тип ссылки"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtDataSize 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   15
         ToolTipText     =   "Размер поля"
         Top             =   4635
         Width           =   1800
      End
      Begin VB.ComboBox cmbAllowNull 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   13
         ToolTipText     =   "Может быть пустым"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsBrief 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "Краткая информация"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdFieldType 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип поля"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFieldType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Тип поля"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   6
         ToolTipText     =   "Имя поля"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtCaption 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   4
         ToolTipText     =   "Надпись"
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
      Begin VB.Label lblTheMask 
         BackStyle       =   0  'Transparent
         Caption         =   "Маска:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lbltheNameClass 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя класса для мастера строк:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblshablonBrief 
         BackStyle       =   0  'Transparent
         Caption         =   "Шаблон для краткого отображения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   40
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblNumberDateField 
         BackStyle       =   0  'Transparent
         Caption         =   "Поле для расчета даты:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblZoneTemplate 
         BackStyle       =   0  'Transparent
         Caption         =   "Шаблон зоны нумерации:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheNumerator 
         BackStyle       =   0  'Transparent
         Caption         =   "Нумератор:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblIsAutoNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Автонумерация:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCreateRefOnly 
         BackStyle       =   0  'Transparent
         Caption         =   "Только создание объекта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblInternalReference 
         BackStyle       =   0  'Transparent
         Caption         =   "Ссылка в пределах объекта:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblRefToPart 
         BackStyle       =   0  'Transparent
         Caption         =   "Ссылка на раздел:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblRefToType 
         BackStyle       =   0  'Transparent
         Caption         =   "Ссылка на тип:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblReferenceType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип ссылки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblDataSize 
         BackStyle       =   0  'Transparent
         Caption         =   "Размер поля:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblAllowNull 
         BackStyle       =   0  'Transparent
         Caption         =   "Может быть пустым:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblIsBrief 
         BackStyle       =   0  'Transparent
         Caption         =   "Краткая информация:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFieldType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип поля:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя поля:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCaption 
         BackStyle       =   0  'Transparent
         Caption         =   "Надпись:"
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
Attribute VB_Name = "FIELD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Поле
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
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, Cancel)
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

Private Sub txtSequence_Validate(Cancel As Boolean)
If txtSequence.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSequence.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtSequence.SetFocus
  ElseIf Val(txtSequence.Text) <> CLng(Val(txtSequence.Text)) Then
     Cancel = True
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
Private Sub txtCaption_Change()
  Changing

End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtFieldType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFieldType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("FIELDTYPE", ID, brief) Then
          txtFieldType.Tag = Left(ID, 38)
          txtFieldType = brief
        End If
End Sub
Private Sub cmdFieldType_MenuClick(ByVal sCaption As String)
          txtFieldType.Tag = ""
          txtFieldType = ""
End Sub
Private Sub cmbIsBrief_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbAllowNull_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtDataSize_Validate(Cancel As Boolean)
If txtDataSize.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtDataSize.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtDataSize.SetFocus
  ElseIf Val(txtDataSize.Text) <> CLng(Val(txtDataSize.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtDataSize.SetFocus
  End If
End If
End Sub
Private Sub txtDataSize_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtDataSize_Change()
  Changing

End Sub
Private Sub cmbReferenceType_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtRefToType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdRefToType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJECTTYPE", ID, brief) Then
          txtRefToType.Tag = Left(ID, 38)
          txtRefToType = brief
        End If
End Sub
Private Sub cmdRefToType_MenuClick(ByVal sCaption As String)
          txtRefToType.Tag = ""
          txtRefToType = ""
End Sub
Private Sub txtRefToPart_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdRefToPart_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PART", ID, brief) Then
          txtRefToPart.Tag = Left(ID, 38)
          txtRefToPart = brief
        End If
End Sub
Private Sub cmdRefToPart_MenuClick(ByVal sCaption As String)
          txtRefToPart.Tag = ""
          txtRefToPart = ""
End Sub
Private Sub cmbInternalReference_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbCreateRefOnly_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsAutoNumber_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtTheNumerator_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheNumerator_CLick()
  On Error Resume Next
     If txtTheNumerator.Tag = "" Then
       cmdTheNumerator_MenuClick "Выбрать"
     Else
       cmdTheNumerator_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheNumerator_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheNumerator.Tag = ""
          txtTheNumerator = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheNumerator.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheNumerator.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheNumerator.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "STDNumerator")
        If OK Then
          txtTheNumerator.Tag = Left(ID, 38)
          txtTheNumerator = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "STDNumerator" & Now
        ook = findObject(Item.Application.Manager, "STDNumerator", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtTheNumerator.Tag = ID
              txtTheNumerator = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "STDNumerator", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtTheNumerator.Tag = obj.ID
              txtTheNumerator = obj.brief
          Else
              txtTheNumerator.Tag = ""
              txtTheNumerator = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtZoneTemplate_Change()
  Changing

End Sub
Private Sub txtNumberDateField_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdNumberDateField_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("FIELD", ID, brief) Then
          txtNumberDateField.Tag = Left(ID, 38)
          txtNumberDateField = brief
        End If
End Sub
Private Sub cmdNumberDateField_MenuClick(ByVal sCaption As String)
          txtNumberDateField.Tag = ""
          txtNumberDateField = ""
End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub txtshablonBrief_Change()
  Changing

End Sub
Private Sub txttheNameClass_Change()
  Changing

End Sub
Private Sub txtTheMask_Change()
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
If mIsOK Then mIsOK = IsSet(txtCaption.Text)
If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = txtFieldType.Tag <> ""
If mIsOK Then mIsOK = (cmbIsBrief.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbAllowNull.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbReferenceType.ListIndex >= 0)
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
  On Error Resume Next
txtCaption = Item.Caption
  On Error Resume Next
txtName = Item.Name
If Not Item.FIELDTYPE Is Nothing Then
  txtFieldType.Tag = Item.FIELDTYPE.ID
  txtFieldType = Item.FIELDTYPE.brief
Else
  txtFieldType.Tag = ""
  txtFieldType = ""
End If
 LoadBtnPictures cmdFieldType, cmdFieldType.Tag
  cmdFieldType.RemoveAllMenu
  cmdFieldType.AddMenu "Очистить"
cmbIsBrief.Clear
cmbIsBrief.AddItem "Да"
cmbIsBrief.ItemData(cmbIsBrief.NewIndex) = -1
cmbIsBrief.AddItem "Нет"
cmbIsBrief.ItemData(cmbIsBrief.NewIndex) = 0
 For iii = 0 To cmbIsBrief.ListCount - 1
  If Item.IsBrief = cmbIsBrief.ItemData(iii) Then
   cmbIsBrief.ListIndex = iii
   Exit For
  End If
 Next
cmbAllowNull.Clear
cmbAllowNull.AddItem "Да"
cmbAllowNull.ItemData(cmbAllowNull.NewIndex) = -1
cmbAllowNull.AddItem "Нет"
cmbAllowNull.ItemData(cmbAllowNull.NewIndex) = 0
 For iii = 0 To cmbAllowNull.ListCount - 1
  If Item.AllowNull = cmbAllowNull.ItemData(iii) Then
   cmbAllowNull.ListIndex = iii
   Exit For
  End If
 Next
txtDataSize = Item.DataSize
cmbReferenceType.Clear
cmbReferenceType.AddItem "На строку раздела"
cmbReferenceType.ItemData(cmbReferenceType.NewIndex) = 2
cmbReferenceType.AddItem "На источник данных"
cmbReferenceType.ItemData(cmbReferenceType.NewIndex) = 3
cmbReferenceType.AddItem "Скалярное поле ( не ссылка)"
cmbReferenceType.ItemData(cmbReferenceType.NewIndex) = 0
cmbReferenceType.AddItem "На объект "
cmbReferenceType.ItemData(cmbReferenceType.NewIndex) = 1
 For iii = 0 To cmbReferenceType.ListCount - 1
  If Item.ReferenceType = cmbReferenceType.ItemData(iii) Then
   cmbReferenceType.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.RefToType Is Nothing Then
  txtRefToType.Tag = Item.RefToType.ID
  txtRefToType = Item.RefToType.brief
Else
  txtRefToType.Tag = ""
  txtRefToType = ""
End If
 LoadBtnPictures cmdRefToType, cmdRefToType.Tag
  cmdRefToType.RemoveAllMenu
  cmdRefToType.AddMenu "Очистить"
If Not Item.RefToPart Is Nothing Then
  txtRefToPart.Tag = Item.RefToPart.ID
  txtRefToPart = Item.RefToPart.brief
Else
  txtRefToPart.Tag = ""
  txtRefToPart = ""
End If
 LoadBtnPictures cmdRefToPart, cmdRefToPart.Tag
  cmdRefToPart.RemoveAllMenu
  cmdRefToPart.AddMenu "Очистить"
cmbInternalReference.Clear
cmbInternalReference.AddItem "Да"
cmbInternalReference.ItemData(cmbInternalReference.NewIndex) = -1
cmbInternalReference.AddItem "Нет"
cmbInternalReference.ItemData(cmbInternalReference.NewIndex) = 0
 For iii = 0 To cmbInternalReference.ListCount - 1
  If Item.InternalReference = cmbInternalReference.ItemData(iii) Then
   cmbInternalReference.ListIndex = iii
   Exit For
  End If
 Next
cmbCreateRefOnly.Clear
cmbCreateRefOnly.AddItem "Да"
cmbCreateRefOnly.ItemData(cmbCreateRefOnly.NewIndex) = -1
cmbCreateRefOnly.AddItem "Нет"
cmbCreateRefOnly.ItemData(cmbCreateRefOnly.NewIndex) = 0
 For iii = 0 To cmbCreateRefOnly.ListCount - 1
  If Item.CreateRefOnly = cmbCreateRefOnly.ItemData(iii) Then
   cmbCreateRefOnly.ListIndex = iii
   Exit For
  End If
 Next
cmbIsAutoNumber.Clear
cmbIsAutoNumber.AddItem "Да"
cmbIsAutoNumber.ItemData(cmbIsAutoNumber.NewIndex) = -1
cmbIsAutoNumber.AddItem "Нет"
cmbIsAutoNumber.ItemData(cmbIsAutoNumber.NewIndex) = 0
 For iii = 0 To cmbIsAutoNumber.ListCount - 1
  If Item.IsAutoNumber = cmbIsAutoNumber.ItemData(iii) Then
   cmbIsAutoNumber.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.TheNumerator Is Nothing Then
  txtTheNumerator.Tag = Item.TheNumerator.ID
  txtTheNumerator = Item.TheNumerator.brief
Else
  txtTheNumerator.Tag = ""
  txtTheNumerator = ""
End If
 LoadBtnPictures cmdTheNumerator, cmdTheNumerator.Tag
  cmdTheNumerator.RemoveAllMenu
  cmdTheNumerator.AddMenu "Очистить"
  cmdTheNumerator.AddMenu "Создать"
  cmdTheNumerator.AddMenu "Выбрать"
  cmdTheNumerator.AddMenu "Открыть"
  On Error Resume Next
txtZoneTemplate = Item.ZoneTemplate
If Not Item.NumberDateField Is Nothing Then
  txtNumberDateField.Tag = Item.NumberDateField.ID
  txtNumberDateField = Item.NumberDateField.brief
Else
  txtNumberDateField.Tag = ""
  txtNumberDateField = ""
End If
 LoadBtnPictures cmdNumberDateField, cmdNumberDateField.Tag
  cmdNumberDateField.RemoveAllMenu
  cmdNumberDateField.AddMenu "Очистить"
txtTheComment = Item.TheComment
  On Error Resume Next
txtshablonBrief = Item.shablonBrief
  On Error Resume Next
txttheNameClass = Item.theNameClass
  On Error Resume Next
txtTheMask = Item.TheMask
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
Item.Caption = txtCaption
Item.Name = txtName
If txtFieldType.Tag <> "" Then
  Set Item.FIELDTYPE = Item.Application.FindRowObject("FIELDTYPE", txtFieldType.Tag)
Else
  Set Item.FIELDTYPE = Nothing
End If
 If cmbIsBrief.ListIndex >= 0 Then
   Item.IsBrief = cmbIsBrief.ItemData(cmbIsBrief.ListIndex)
 End If
 If cmbAllowNull.ListIndex >= 0 Then
   Item.AllowNull = cmbAllowNull.ItemData(cmbAllowNull.ListIndex)
 End If
Item.DataSize = CDbl(txtDataSize)
 If cmbReferenceType.ListIndex >= 0 Then
   Item.ReferenceType = cmbReferenceType.ItemData(cmbReferenceType.ListIndex)
 End If
If txtRefToType.Tag <> "" Then
  Set Item.RefToType = Item.Application.FindRowObject("OBJECTTYPE", txtRefToType.Tag)
Else
  Set Item.RefToType = Nothing
End If
If txtRefToPart.Tag <> "" Then
  Set Item.RefToPart = Item.Application.FindRowObject("PART", txtRefToPart.Tag)
Else
  Set Item.RefToPart = Nothing
End If
 If cmbInternalReference.ListIndex >= 0 Then
   Item.InternalReference = cmbInternalReference.ItemData(cmbInternalReference.ListIndex)
 End If
 If cmbCreateRefOnly.ListIndex >= 0 Then
   Item.CreateRefOnly = cmbCreateRefOnly.ItemData(cmbCreateRefOnly.ListIndex)
 End If
 If cmbIsAutoNumber.ListIndex >= 0 Then
   Item.IsAutoNumber = cmbIsAutoNumber.ItemData(cmbIsAutoNumber.ListIndex)
 End If
If txtTheNumerator.Tag <> "" Then
  Set Item.TheNumerator = Item.Application.Manager.GetInstanceObject(txtTheNumerator.Tag)
Else
  Set Item.TheNumerator = Nothing
End If
Item.ZoneTemplate = txtZoneTemplate
If txtNumberDateField.Tag <> "" Then
  Set Item.NumberDateField = Item.Application.FindRowObject("FIELD", txtNumberDateField.Tag)
Else
  Set Item.NumberDateField = Nothing
End If
Item.TheComment = txtTheComment
Item.shablonBrief = txtshablonBrief
Item.theNameClass = txttheNameClass
Item.TheMask = txtTheMask
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



