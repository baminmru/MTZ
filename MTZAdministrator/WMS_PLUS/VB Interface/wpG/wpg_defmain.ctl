VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl wpg_defmain 
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
      Begin VB.TextBox txtd5name 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   30
         ToolTipText     =   "Д-Аналитика 5"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtd4name 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   28
         ToolTipText     =   "Д-Аналитика 4"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtd3name 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   26
         ToolTipText     =   "Д-Аналитика 3"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtd2name 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   24
         ToolTipText     =   "Д-Аналитика 2"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtd1name 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   22
         ToolTipText     =   "Д-Аналитика 1"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txts5name 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   20
         ToolTipText     =   "С-Аналитика 5"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txts4name 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   18
         ToolTipText     =   "С-Аналитика 4"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txts3name 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   16
         ToolTipText     =   "С-Аналитика 3"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txts2name 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   14
         ToolTipText     =   "С-Аналитика 2"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txts1Name 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   12
         ToolTipText     =   "С-Аналитика 1"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdedizm 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Единица изменрения"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtedizm 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Единица изменрения"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtTheName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   7
         ToolTipText     =   "Наименование товара"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtTheCode 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   5
         ToolTipText     =   "Код товара"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheClient 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Клиент"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheClient 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Клиент"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lbld5name 
         BackStyle       =   0  'Transparent
         Caption         =   "Д-Аналитика 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lbld4name 
         BackStyle       =   0  'Transparent
         Caption         =   "Д-Аналитика 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lbld3name 
         BackStyle       =   0  'Transparent
         Caption         =   "Д-Аналитика 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lbld2name 
         BackStyle       =   0  'Transparent
         Caption         =   "Д-Аналитика 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lbld1name 
         BackStyle       =   0  'Transparent
         Caption         =   "Д-Аналитика 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lbls5name 
         BackStyle       =   0  'Transparent
         Caption         =   "С-Аналитика 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lbls4name 
         BackStyle       =   0  'Transparent
         Caption         =   "С-Аналитика 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lbls3name 
         BackStyle       =   0  'Transparent
         Caption         =   "С-Аналитика 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lbls2name 
         BackStyle       =   0  'Transparent
         Caption         =   "С-Аналитика 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lbls1Name 
         BackStyle       =   0  'Transparent
         Caption         =   "С-Аналитика 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lbledizm 
         BackStyle       =   0  'Transparent
         Caption         =   "Единица изменрения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheName 
         BackStyle       =   0  'Transparent
         Caption         =   "Наименование товара:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Код товара:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "wpg_defmain"
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

Private Sub txtTheClient_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheClient_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpCli_def", ID, brief) Then
          txtTheClient.Tag = Left(ID, 38)
          txtTheClient = brief
        End If
End Sub
Private Sub cmdTheClient_MenuClick(ByVal sCaption As String)
          txtTheClient.Tag = ""
          txtTheClient = ""
End Sub
Private Sub txtTheCode_Change()
  Changing
Item.S_code = Code128("Good_" & txtTheCode.Text)
End Sub
Private Sub txtTheName_Change()
  Changing

End Sub
Private Sub txtedizm_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdedizm_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpDic_EDIZM", ID, brief) Then
          txtedizm.Tag = Left(ID, 38)
          txtedizm = brief
        End If
End Sub
Private Sub cmdedizm_MenuClick(ByVal sCaption As String)
          txtedizm.Tag = ""
          txtedizm = ""
End Sub
Private Sub txts1Name_Change()
  Changing

End Sub
Private Sub txts2name_Change()
  Changing

End Sub
Private Sub txts3name_Change()
  Changing

End Sub
Private Sub txts4name_Change()
  Changing

End Sub
Private Sub txts5name_Change()
  Changing

End Sub
Private Sub txtd1name_Change()
  Changing

End Sub
Private Sub txtd2name_Change()
  Changing

End Sub
Private Sub txtd3name_Change()
  Changing

End Sub
Private Sub txtd4name_Change()
  Changing

End Sub
Private Sub txtd5name_Change()
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

If mIsOK Then mIsOK = txtTheClient.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtTheCode.Text)
If mIsOK Then mIsOK = IsSet(txtTheName.Text)
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

If Not Item.TheClient Is Nothing Then
  txtTheClient.Tag = Item.TheClient.ID
  txtTheClient = Item.TheClient.brief
Else
  txtTheClient.Tag = ""
  txtTheClient = ""
End If
 LoadBtnPictures cmdTheClient, cmdTheClient.Tag
  cmdTheClient.RemoveAllMenu
  cmdTheClient.AddMenu "Очистить"
  On Error Resume Next
txtTheCode = Item.TheCode
  On Error Resume Next
txtTheName = Item.TheName
If Not Item.edizm Is Nothing Then
  txtedizm.Tag = Item.edizm.ID
  txtedizm = Item.edizm.brief
Else
  txtedizm.Tag = ""
  txtedizm = ""
End If
 LoadBtnPictures cmdedizm, cmdedizm.Tag
  cmdedizm.RemoveAllMenu
  cmdedizm.AddMenu "Очистить"
  On Error Resume Next
txts1Name = Item.s1Name
  On Error Resume Next
txts2name = Item.s2name
  On Error Resume Next
txts3name = Item.s3name
  On Error Resume Next
txts4name = Item.s4name
  On Error Resume Next
txts5name = Item.s5name
  On Error Resume Next
txtd1name = Item.d1name
  On Error Resume Next
txtd2name = Item.d2name
  On Error Resume Next
txtd3name = Item.d3name
  On Error Resume Next
txtd4name = Item.d4name
  On Error Resume Next
txtd5name = Item.d5name
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

If txtTheClient.Tag <> "" Then
  Set Item.TheClient = Item.Application.FindRowObject("wpCli_def", txtTheClient.Tag)
Else
  Set Item.TheClient = Nothing
End If
Item.TheCode = txtTheCode
Item.TheName = txtTheName
If txtedizm.Tag <> "" Then
  Set Item.edizm = Item.Application.FindRowObject("wpDic_EDIZM", txtedizm.Tag)
Else
  Set Item.edizm = Nothing
End If
Item.s1Name = txts1Name
Item.s2name = txts2name
Item.s3name = txts3name
Item.s4name = txts4name
Item.s5name = txts5name
Item.d1name = txtd1name
Item.d2name = txtd2name
Item.d3name = txtd3name
Item.d4name = txtd4name
Item.d5name = txtd5name
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



