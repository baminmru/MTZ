VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl REPD_SRV 
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
      Begin MTZ_PANEL.DropButton cmdObj1 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Obj1"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtObj1 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Obj1"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdObj2 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Obj2"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtObj2 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Obj2"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.TextBox txtname 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdObj3 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Obj3"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtObj3 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Obj3"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblObj1 
         BackStyle       =   0  'Transparent
         Caption         =   "Obj1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblObj2 
         BackStyle       =   0  'Transparent
         Caption         =   "Obj2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblname 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblObj3 
         BackStyle       =   0  'Transparent
         Caption         =   "Obj3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "REPD_SRV"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Узлы репликации
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

Private Sub txtObj3_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdObj3_CLick()
  On Error Resume Next
     If txtObj3.Tag = "" Then
       cmdObj3_MenuClick "Выбрать"
     Else
       cmdObj3_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdObj3_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtObj3.Tag = ""
          txtObj3 = ""
  End If
  If sCaption = "Открыть" Then
    If txtObj3.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtObj3.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtObj3.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "")
        If OK Then
          txtObj3.Tag = Left(ID, 38)
          txtObj3 = brief
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
              txtObj3.Tag = obj.ID
              txtObj3 = obj.brief
          Else
              txtObj3.Tag = ""
              txtObj3 = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtname_Change()
  Changing

End Sub
Private Sub txtObj2_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdObj2_CLick()
  On Error Resume Next
     If txtObj2.Tag = "" Then
       cmdObj2_MenuClick "Выбрать"
     Else
       cmdObj2_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdObj2_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtObj2.Tag = ""
          txtObj2 = ""
  End If
  If sCaption = "Открыть" Then
    If txtObj2.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtObj2.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtObj2.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "")
        If OK Then
          txtObj2.Tag = Left(ID, 38)
          txtObj2 = brief
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
              txtObj2.Tag = obj.ID
              txtObj2 = obj.brief
          Else
              txtObj2.Tag = ""
              txtObj2 = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtObj1_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdObj1_CLick()
  On Error Resume Next
     If txtObj1.Tag = "" Then
       cmdObj1_MenuClick "Выбрать"
     Else
       cmdObj1_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdObj1_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtObj1.Tag = ""
          txtObj1 = ""
  End If
  If sCaption = "Открыть" Then
    If txtObj1.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtObj1.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtObj1.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "")
        If OK Then
          txtObj1.Tag = Left(ID, 38)
          txtObj1 = brief
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
              txtObj1.Tag = obj.ID
              txtObj1 = obj.brief
          Else
              txtObj1.Tag = ""
              txtObj1 = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
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

If mIsOK Then mIsOK = IsSet(txtname.Text)
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

If Not Item.Obj3 Is Nothing Then
  txtObj3.Tag = Item.Obj3.ID
  txtObj3 = Item.Obj3.brief
Else
  txtObj3.Tag = ""
  txtObj3 = ""
End If
 LoadBtnPictures cmdObj3, cmdObj3.Tag
  cmdObj3.RemoveAllMenu
  cmdObj3.AddMenu "Очистить"
  cmdObj3.AddMenu "Создать"
  cmdObj3.AddMenu "Выбрать"
  cmdObj3.AddMenu "Открыть"
  On Error Resume Next
txtname = Item.Name
If Not Item.Obj2 Is Nothing Then
  txtObj2.Tag = Item.Obj2.ID
  txtObj2 = Item.Obj2.brief
Else
  txtObj2.Tag = ""
  txtObj2 = ""
End If
 LoadBtnPictures cmdObj2, cmdObj2.Tag
  cmdObj2.RemoveAllMenu
  cmdObj2.AddMenu "Очистить"
  cmdObj2.AddMenu "Создать"
  cmdObj2.AddMenu "Выбрать"
  cmdObj2.AddMenu "Открыть"
If Not Item.Obj1 Is Nothing Then
  txtObj1.Tag = Item.Obj1.ID
  txtObj1 = Item.Obj1.brief
Else
  txtObj1.Tag = ""
  txtObj1 = ""
End If
 LoadBtnPictures cmdObj1, cmdObj1.Tag
  cmdObj1.RemoveAllMenu
  cmdObj1.AddMenu "Очистить"
  cmdObj1.AddMenu "Создать"
  cmdObj1.AddMenu "Выбрать"
  cmdObj1.AddMenu "Открыть"
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

If txtObj3.Tag <> "" Then
  Set Item.Obj3 = Item.Application.Manager.GetInstanceObject(txtObj3.Tag)
Else
  Set Item.Obj3 = Nothing
End If
Item.Name = txtname
If txtObj2.Tag <> "" Then
  Set Item.Obj2 = Item.Application.Manager.GetInstanceObject(txtObj2.Tag)
Else
  Set Item.Obj2 = Nothing
End If
If txtObj1.Tag <> "" Then
  Set Item.Obj1 = Item.Application.Manager.GetInstanceObject(txtObj1.Tag)
Else
  Set Item.Obj1 = Nothing
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



