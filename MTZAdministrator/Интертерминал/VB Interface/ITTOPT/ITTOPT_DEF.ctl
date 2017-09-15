VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl ITTOPT_DEF 
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
      Begin VB.TextBox txtPalType 
         Height          =   300
         Left            =   3450
         MaxLength       =   1
         TabIndex        =   32
         ToolTipText     =   "Тип паллеты"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtIsBrak 
         Height          =   300
         Left            =   3450
         MaxLength       =   20
         TabIndex        =   30
         ToolTipText     =   "Брак"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtVetSved 
         Height          =   300
         Left            =   3450
         MaxLength       =   30
         TabIndex        =   28
         ToolTipText     =   "Сертификат"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtPartia 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   26
         ToolTipText     =   "Партия"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtKILL_NUMBER 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   24
         ToolTipText     =   "№ бойни"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtFactory 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   22
         ToolTipText     =   "Завод"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtmade_country 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   20
         ToolTipText     =   "Страна производитель"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtTheClient 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   18
         ToolTipText     =   "Клиент"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtgood 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   16
         ToolTipText     =   "Товар"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtTheKamera 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   14
         ToolTipText     =   "Камера"
         Top             =   3930
         Width           =   1800
      End
      Begin MSComCtl2.DTPicker dtpDateToOptimize 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Плановая дата оптимизации"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   91488259
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdTheRule 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Правило формирования партий"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheRule 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Правило формирования партий"
         Top             =   2520
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpOPtDate 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Дата создания заявки"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   91488259
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdOptType 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип оптимизации"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOptType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Тип оптимизации"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtFormattedDocNum 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   50
         TabIndex        =   2
         ToolTipText     =   "Номер документа"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblPalType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип паллеты:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblIsBrak 
         BackStyle       =   0  'Transparent
         Caption         =   "Брак:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblVetSved 
         BackStyle       =   0  'Transparent
         Caption         =   "Сертификат:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPartia 
         BackStyle       =   0  'Transparent
         Caption         =   "Партия:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblKILL_NUMBER 
         BackStyle       =   0  'Transparent
         Caption         =   "№ бойни:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFactory 
         BackStyle       =   0  'Transparent
         Caption         =   "Завод:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblmade_country 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна производитель:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblTheClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblgood 
         BackStyle       =   0  'Transparent
         Caption         =   "Товар:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheKamera 
         BackStyle       =   0  'Transparent
         Caption         =   "Камера:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblDateToOptimize 
         BackStyle       =   0  'Transparent
         Caption         =   "Плановая дата оптимизации:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblTheRule 
         BackStyle       =   0  'Transparent
         Caption         =   "Правило формирования партий:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblOPtDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата создания заявки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblOptType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип оптимизации:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblFormattedDocNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер документа:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTOPT_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Описание задания на оптимизацию
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

Private Sub txtFormattedDocNum_Change()
  Changing

End Sub
Private Sub txtOptType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdOptType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_OPTTYPE", ID, brief) Then
          txtOptType.Tag = Left(ID, 38)
          txtOptType = brief
        End If
End Sub
Private Sub cmdOptType_MenuClick(ByVal sCaption As String)
          txtOptType.Tag = ""
          txtOptType = ""
End Sub
Private Sub dtpOPtDate_Change()
  Changing

End Sub
Private Sub txtTheRule_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheRule_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_RULE", ID, brief) Then
          txtTheRule.Tag = Left(ID, 38)
          txtTheRule = brief
        End If
End Sub
Private Sub cmdTheRule_MenuClick(ByVal sCaption As String)
          txtTheRule.Tag = ""
          txtTheRule = ""
End Sub
Private Sub dtpDateToOptimize_Change()
  Changing

End Sub
Private Sub txtTheKamera_Validate(cancel As Boolean)
If txtTheKamera.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtTheKamera.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtTheKamera.SetFocus
  ElseIf Val(txtTheKamera.Text) <> CLng(Val(txtTheKamera.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtTheKamera.SetFocus
  End If
End If
End Sub
Private Sub txtTheKamera_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtTheKamera_Change()
  Changing

End Sub
Private Sub txtgood_Change()
  Changing

End Sub
Private Sub txtTheClient_Change()
  Changing

End Sub
Private Sub txtmade_country_Change()
  Changing

End Sub
Private Sub txtFactory_Change()
  Changing

End Sub
Private Sub txtKILL_NUMBER_Change()
  Changing

End Sub
Private Sub txtPartia_Change()
  Changing

End Sub
Private Sub txtVetSved_Change()
  Changing

End Sub
Private Sub txtIsBrak_Change()
  Changing

End Sub
Private Sub txtPalType_Change()
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
txtFormattedDocNum = Item.FormattedDocNum
If Not Item.OptType Is Nothing Then
  txtOptType.Tag = Item.OptType.ID
  txtOptType = Item.OptType.brief
Else
  txtOptType.Tag = ""
  txtOptType = ""
End If
 LoadBtnPictures cmdOptType, cmdOptType.Tag
  cmdOptType.RemoveAllMenu
  cmdOptType.AddMenu "Очистить"
dtpOPtDate = Date
If Item.OPtDate <> 0 Then
 dtpOPtDate = Item.OPtDate
Else
 dtpOPtDate.Value = Null
End If
If Not Item.TheRule Is Nothing Then
  txtTheRule.Tag = Item.TheRule.ID
  txtTheRule = Item.TheRule.brief
Else
  txtTheRule.Tag = ""
  txtTheRule = ""
End If
 LoadBtnPictures cmdTheRule, cmdTheRule.Tag
  cmdTheRule.RemoveAllMenu
  cmdTheRule.AddMenu "Очистить"
dtpDateToOptimize = Date
If Item.DateToOptimize <> 0 Then
 dtpDateToOptimize = Item.DateToOptimize
Else
 dtpDateToOptimize.Value = Null
End If
txtTheKamera = Item.TheKamera
  On Error Resume Next
txtgood = Item.good
  On Error Resume Next
txtTheClient = Item.TheClient
  On Error Resume Next
txtmade_country = Item.made_country
  On Error Resume Next
txtFactory = Item.Factory
  On Error Resume Next
txtKILL_NUMBER = Item.KILL_NUMBER
  On Error Resume Next
txtPartia = Item.Partia
  On Error Resume Next
txtVetSved = Item.VetSved
  On Error Resume Next
txtIsBrak = Item.IsBrak
  On Error Resume Next
txtPalType = Item.PalType
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

If txtOptType.Tag <> "" Then
  Set Item.OptType = Item.Application.FindRowObject("ITTD_OPTTYPE", txtOptType.Tag)
Else
  Set Item.OptType = Nothing
End If
  If IsNull(dtpOPtDate) Then
    Item.OPtDate = 0
  Else
    Item.OPtDate = dtpOPtDate.Value
  End If
If txtTheRule.Tag <> "" Then
  Set Item.TheRule = Item.Application.FindRowObject("ITTD_RULE", txtTheRule.Tag)
Else
  Set Item.TheRule = Nothing
End If
  If IsNull(dtpDateToOptimize) Then
    Item.DateToOptimize = 0
  Else
    Item.DateToOptimize = dtpDateToOptimize.Value
  End If
Item.TheKamera = CDbl(txtTheKamera)
Item.good = txtgood
Item.TheClient = txtTheClient
Item.made_country = txtmade_country
Item.Factory = txtFactory
Item.KILL_NUMBER = txtKILL_NUMBER
Item.Partia = txtPartia
Item.VetSved = txtVetSved
Item.IsBrak = txtIsBrak
Item.PalType = txtPalType
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



