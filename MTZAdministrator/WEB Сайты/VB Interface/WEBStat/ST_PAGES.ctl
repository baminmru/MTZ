VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl ST_PAGES 
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
      Begin MTZ_PANEL.DropButton cmdWEBS_Page 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "Стартовая страница"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtWEBS_Page 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "Стартовая страница"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.TextBox txtthe_Description 
         Height          =   300
         Left            =   300
         MaxLength       =   1024
         TabIndex        =   12
         ToolTipText     =   "Примечания"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtUserHostName 
         Height          =   300
         Left            =   300
         MaxLength       =   512
         TabIndex        =   10
         ToolTipText     =   "Имя хоста"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtUserHostAddress 
         Height          =   300
         Left            =   300
         MaxLength       =   512
         TabIndex        =   8
         ToolTipText     =   "Адрес хоста"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtUserAgent 
         Height          =   300
         Left            =   300
         MaxLength       =   256
         TabIndex        =   6
         ToolTipText     =   "Интернет агент"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtUrlReferer 
         Height          =   300
         Left            =   300
         MaxLength       =   1024
         TabIndex        =   4
         ToolTipText     =   "Предыдущий адрес"
         Top             =   1110
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpAccessDate 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "Дата"
         Top             =   405
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   71630851
         CurrentDate     =   39882
      End
      Begin VB.Label lblWEBS_Page 
         BackStyle       =   0  'Transparent
         Caption         =   "Стартовая страница:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblthe_Description 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечания:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblUserHostName 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя хоста:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblUserHostAddress 
         BackStyle       =   0  'Transparent
         Caption         =   "Адрес хоста:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblUserAgent 
         BackStyle       =   0  'Transparent
         Caption         =   "Интернет агент:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblUrlReferer 
         BackStyle       =   0  'Transparent
         Caption         =   "Предыдущий адрес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblAccessDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ST_PAGES"
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

Private Sub dtpAccessDate_Change()
  Changing

End Sub
Private Sub txtUrlReferer_Change()
  Changing

End Sub
Private Sub txtUserAgent_Change()
  Changing

End Sub
Private Sub txtUserHostAddress_Change()
  Changing

End Sub
Private Sub txtUserHostName_Change()
  Changing

End Sub
Private Sub txtthe_Description_Change()
  Changing

End Sub
Private Sub txtWEBS_Page_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdWEBS_Page_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WEBS_PAGEDEF", ID, brief) Then
          txtWEBS_Page.Tag = Left(ID, 38)
          txtWEBS_Page = brief
        End If
End Sub
Private Sub cmdWEBS_Page_MenuClick(ByVal sCaption As String)
          txtWEBS_Page.Tag = ""
          txtWEBS_Page = ""
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

If mIsOK Then mIsOK = IsSet(dtpAccessDate.Value)
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

dtpAccessDate = Now
If Item.AccessDate <> 0 Then
 dtpAccessDate = Item.AccessDate
End If
  On Error Resume Next
txtUrlReferer = Item.UrlReferer
  On Error Resume Next
txtUserAgent = Item.UserAgent
  On Error Resume Next
txtUserHostAddress = Item.UserHostAddress
  On Error Resume Next
txtUserHostName = Item.UserHostName
  On Error Resume Next
txtthe_Description = Item.the_Description
If Not Item.WEBS_Page Is Nothing Then
  txtWEBS_Page.Tag = Item.WEBS_Page.ID
  txtWEBS_Page = Item.WEBS_Page.brief
Else
  txtWEBS_Page.Tag = ""
  txtWEBS_Page = ""
End If
 LoadBtnPictures cmdWEBS_Page, cmdWEBS_Page.Tag
  cmdWEBS_Page.RemoveAllMenu
  cmdWEBS_Page.AddMenu "Очистить"
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

  If IsNull(dtpAccessDate) Then
    Item.AccessDate = 0
  Else
    Item.AccessDate = dtpAccessDate.Value
  End If
Item.UrlReferer = txtUrlReferer
Item.UserAgent = txtUserAgent
Item.UserHostAddress = txtUserHostAddress
Item.UserHostName = txtUserHostName
Item.the_Description = txtthe_Description
If txtWEBS_Page.Tag <> "" Then
  Set Item.WEBS_Page = Item.Application.FindRowObject("WEBS_PAGEDEF", txtWEBS_Page.Tag)
Else
  Set Item.WEBS_Page = Nothing
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



