VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl RFIDLOG_DEF 
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
      Begin MSComCtl2.DTPicker dtpLoadDate 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Дата загрузки"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   16515075
         CurrentDate     =   39804
      End
      Begin VB.TextBox txtTheFileName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Имя файла"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheCar 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Штабелер"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCar 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Штабелер"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblLoadDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата загрузки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheFileName 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя файла:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheCar 
         BackStyle       =   0  'Transparent
         Caption         =   "Штабелер:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "RFIDLOG_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 290
Option Explicit


'панель редактирования раздела
   Public item As Object
Attribute item.VB_VarHelpID = 325
   Private OnInit As Boolean
   Public Event Changed()
Attribute Changed.VB_HelpID = 295
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
Attribute IsChanged.VB_HelpID = 315
  IsChanged = mIsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtTheCar_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCar_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If item.Application.Manager.GetReferenceDialogEx2("RFIDD_CAR", ID, brief) Then
          txtTheCar.Tag = Left(ID, 38)
          txtTheCar = brief
        End If
End Sub
Private Sub cmdTheCar_MenuClick(ByVal sCaption As String)
          txtTheCar.Tag = ""
          txtTheCar = ""
End Sub
Private Sub txtTheFileName_Change()
  Changing

End Sub
Private Sub dtpLoadDate_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set item = Nothing
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
Attribute IsOK.VB_HelpID = 320
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtTheCar.Tag <> ""
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
  For Each Node In XMLDocFrom.childNodes.item(0).childNodes
    If (Node.baseName = "ID") Then
      ID = Node.Text
      Dim NodeTO As MSXML2.IXMLDOMNode
      Dim bAdded As Boolean
      bAdded = False
      For Each NodeTO In XMLDocTo.childNodes.item(0).childNodes
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
       Call XMLDocTo.childNodes.item(0).appendChild(newNode)
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
Attribute InitPanel.VB_HelpID = 310
OnInit = True
Dim iii As Long ' for combo only
If item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

If Not item.TheCar Is Nothing Then
  txtTheCar.Tag = item.TheCar.ID
  txtTheCar = item.TheCar.brief
Else
  txtTheCar.Tag = ""
  txtTheCar = ""
End If
 LoadBtnPictures cmdTheCar, cmdTheCar.Tag
  cmdTheCar.RemoveAllMenu
  cmdTheCar.AddMenu "Очистить"
  On Error Resume Next
txtTheFileName = item.TheFileName
dtpLoadDate = Now
If item.Loaddate <> 0 Then
 dtpLoadDate = item.Loaddate
Else
 dtpLoadDate.Value = Null
End If
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
Attribute Save.VB_HelpID = 345
If OnInit Then Exit Sub

If txtTheCar.Tag <> "" Then
  Set item.TheCar = item.Application.FindRowObject("RFIDD_CAR", txtTheCar.Tag)
Else
  Set item.TheCar = Nothing
End If
item.TheFileName = txtTheFileName
  If IsNull(dtpLoadDate) Then
    item.Loaddate = 0
  Else
    item.Loaddate = dtpLoadDate.Value
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
 Public Sub OptimalSize(X As Single, Y As Single)
Attribute OptimalSize.VB_HelpID = 330
   Panel.OptimalSize X, Y
   X = X + Panel.Left
   Y = Y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
Attribute OptimalY.VB_HelpID = 335
   Dim X As Single, Y As Single
   Panel.OptimalSize X, Y
   OptimalY = Y
 End Function

'Открытие окна настройки панели
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
Attribute Customize.VB_HelpID = 300
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
Attribute PanelCustomisationString.VB_HelpID = 340
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
Attribute Enabled.VB_HelpID = 305
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



