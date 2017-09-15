VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl StateAction 
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
      Begin VB.TextBox txtActionScript 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   14
         ToolTipText     =   "Скрипт для исполнения"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtActionClass 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   12
         ToolTipText     =   "Класс для обработки"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtLibraryFile 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   10
         ToolTipText     =   "Библиотека-обработчик"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbClearSecurity 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Сбросить стиль защиты"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdNewSecurityStyle 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Установить стиль защиты"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtNewSecurityStyle 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Установить стиль защиты"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdOnDocStatus 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "При входе в состояие"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOnDocStatus 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "При входе в состояие"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblActionScript 
         BackStyle       =   0  'Transparent
         Caption         =   "Скрипт для исполнения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblActionClass 
         BackStyle       =   0  'Transparent
         Caption         =   "Класс для обработки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblLibraryFile 
         BackStyle       =   0  'Transparent
         Caption         =   "Библиотека-обработчик:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblClearSecurity 
         BackStyle       =   0  'Transparent
         Caption         =   "Сбросить стиль защиты:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblNewSecurityStyle 
         BackStyle       =   0  'Transparent
         Caption         =   "Установить стиль защиты:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblOnDocStatus 
         BackStyle       =   0  'Transparent
         Caption         =   "При входе в состояие:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "StateAction"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Дейсвие при смене
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

Private Sub txtOnDocStatus_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdOnDocStatus_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJSTATUS", ID, brief) Then
          txtOnDocStatus.Tag = Left(ID, 38)
          txtOnDocStatus = brief
        End If
End Sub
Private Sub cmdOnDocStatus_MenuClick(ByVal sCaption As String)
          txtOnDocStatus.Tag = ""
          txtOnDocStatus = ""
End Sub
Private Sub txtNewSecurityStyle_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdNewSecurityStyle_CLick()
  On Error Resume Next
     If txtNewSecurityStyle.Tag = "" Then
       cmdNewSecurityStyle_MenuClick "Выбрать"
     Else
       cmdNewSecurityStyle_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdNewSecurityStyle_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtNewSecurityStyle.Tag = ""
          txtNewSecurityStyle = ""
  End If
  If sCaption = "Открыть" Then
    If txtNewSecurityStyle.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtNewSecurityStyle.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtNewSecurityStyle.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "MTZSecurity")
        If OK Then
          txtNewSecurityStyle.Tag = Left(ID, 38)
          txtNewSecurityStyle = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "MTZSecurity" & Now
        ook = findObject(Item.Application.Manager, "MTZSecurity", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtNewSecurityStyle.Tag = ID
              txtNewSecurityStyle = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "MTZSecurity", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtNewSecurityStyle.Tag = obj.ID
              txtNewSecurityStyle = obj.brief
          Else
              txtNewSecurityStyle.Tag = ""
              txtNewSecurityStyle = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub cmbClearSecurity_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtLibraryFile_Change()
  Changing

End Sub
Private Sub txtActionClass_Change()
  Changing

End Sub
Private Sub txtActionScript_Change()
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

If mIsOK Then mIsOK = txtOnDocStatus.Tag <> ""
If mIsOK Then mIsOK = (cmbClearSecurity.ListIndex >= 0)
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

If Not Item.OnDocStatus Is Nothing Then
  txtOnDocStatus.Tag = Item.OnDocStatus.ID
  txtOnDocStatus = Item.OnDocStatus.brief
Else
  txtOnDocStatus.Tag = ""
  txtOnDocStatus = ""
End If
 LoadBtnPictures cmdOnDocStatus, cmdOnDocStatus.Tag
  cmdOnDocStatus.RemoveAllMenu
  cmdOnDocStatus.AddMenu "Очистить"
If Not Item.NewSecurityStyle Is Nothing Then
  txtNewSecurityStyle.Tag = Item.NewSecurityStyle.ID
  txtNewSecurityStyle = Item.NewSecurityStyle.brief
Else
  txtNewSecurityStyle.Tag = ""
  txtNewSecurityStyle = ""
End If
 LoadBtnPictures cmdNewSecurityStyle, cmdNewSecurityStyle.Tag
  cmdNewSecurityStyle.RemoveAllMenu
  cmdNewSecurityStyle.AddMenu "Очистить"
  cmdNewSecurityStyle.AddMenu "Создать"
  cmdNewSecurityStyle.AddMenu "Выбрать"
  cmdNewSecurityStyle.AddMenu "Открыть"
cmbClearSecurity.Clear
cmbClearSecurity.AddItem "Да"
cmbClearSecurity.ItemData(cmbClearSecurity.NewIndex) = -1
cmbClearSecurity.AddItem "Нет"
cmbClearSecurity.ItemData(cmbClearSecurity.NewIndex) = 0
 For iii = 0 To cmbClearSecurity.ListCount - 1
  If Item.ClearSecurity = cmbClearSecurity.ItemData(iii) Then
   cmbClearSecurity.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtLibraryFile = Item.LibraryFile
  On Error Resume Next
txtActionClass = Item.ActionClass
txtActionScript = Item.ActionScript
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

If txtOnDocStatus.Tag <> "" Then
  Set Item.OnDocStatus = Item.Application.FindRowObject("OBJSTATUS", txtOnDocStatus.Tag)
Else
  Set Item.OnDocStatus = Nothing
End If
If txtNewSecurityStyle.Tag <> "" Then
  Set Item.NewSecurityStyle = Item.Application.Manager.GetInstanceObject(txtNewSecurityStyle.Tag)
Else
  Set Item.NewSecurityStyle = Nothing
End If
 If cmbClearSecurity.ListIndex >= 0 Then
   Item.ClearSecurity = cmbClearSecurity.ItemData(cmbClearSecurity.ListIndex)
 End If
Item.LibraryFile = txtLibraryFile
Item.ActionClass = txtActionClass
Item.ActionScript = txtActionScript
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



