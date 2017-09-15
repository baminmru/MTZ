VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl REPD_RequestQuery 
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
      Begin VB.TextBox txtReqTypeName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   20
         ToolTipText     =   "ReqTypeName"
         Top             =   5340
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdProvider 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "Provider"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProvider 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "Provider"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdDestSrv 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "DestSrv"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDestSrv 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "DestSrv"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdSendRecord 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "SendRecord"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSendRecord 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "SendRecord"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdSourceSrv 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "SourceSrv"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSourceSrv 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "SourceSrv"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtObjectID 
         Height          =   300
         Left            =   300
         TabIndex        =   6
         ToolTipText     =   "ObjectID"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtReqPartName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "ReqPartName"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTheRowID 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "TheRowID"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblReqTypeName 
         BackStyle       =   0  'Transparent
         Caption         =   "ReqTypeName:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblProvider 
         BackStyle       =   0  'Transparent
         Caption         =   "Provider:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblDestSrv 
         BackStyle       =   0  'Transparent
         Caption         =   "DestSrv:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblSendRecord 
         BackStyle       =   0  'Transparent
         Caption         =   "SendRecord:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblSourceSrv 
         BackStyle       =   0  'Transparent
         Caption         =   "SourceSrv:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblObjectID 
         BackStyle       =   0  'Transparent
         Caption         =   "ObjectID:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblReqPartName 
         BackStyle       =   0  'Transparent
         Caption         =   "ReqPartName:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheRowID 
         BackStyle       =   0  'Transparent
         Caption         =   "TheRowID:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "REPD_RequestQuery"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Запрос данных на объект\ строку
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

Private Sub txtTheRowID_Change()
  Changing

End Sub
Private Sub txtReqPartName_Change()
  Changing

End Sub
Private Sub txtObjectID_Change()
  Changing

End Sub
Private Sub txtSourceSrv_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSourceSrv_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("REPD_SRV", ID, brief) Then
          txtSourceSrv.Tag = Left(ID, 38)
          txtSourceSrv = brief
        End If
End Sub
Private Sub cmdSourceSrv_MenuClick(ByVal sCaption As String)
          txtSourceSrv.Tag = ""
          txtSourceSrv = ""
End Sub
Private Sub txtSendRecord_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSendRecord_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("REPD_SendQ", ID, brief) Then
          txtSendRecord.Tag = Left(ID, 38)
          txtSendRecord = brief
        End If
End Sub
Private Sub cmdSendRecord_MenuClick(ByVal sCaption As String)
          txtSendRecord.Tag = ""
          txtSendRecord = ""
End Sub
Private Sub txtDestSrv_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDestSrv_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("REPD_SRV", ID, brief) Then
          txtDestSrv.Tag = Left(ID, 38)
          txtDestSrv = brief
        End If
End Sub
Private Sub cmdDestSrv_MenuClick(ByVal sCaption As String)
          txtDestSrv.Tag = ""
          txtDestSrv = ""
End Sub
Private Sub txtProvider_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdProvider_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("REPD_PROV", ID, brief) Then
          txtProvider.Tag = Left(ID, 38)
          txtProvider = brief
        End If
End Sub
Private Sub cmdProvider_MenuClick(ByVal sCaption As String)
          txtProvider.Tag = ""
          txtProvider = ""
End Sub
Private Sub txtReqTypeName_Change()
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

If mIsOK Then mIsOK = txtSourceSrv.Tag <> ""
If mIsOK Then mIsOK = txtProvider.Tag <> ""
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
txtTheRowID = Item.TheRowID
  On Error Resume Next
txtReqPartName = Item.ReqPartName
  On Error Resume Next
txtObjectID = Item.ObjectID
If Not Item.SourceSrv Is Nothing Then
  txtSourceSrv.Tag = Item.SourceSrv.ID
  txtSourceSrv = Item.SourceSrv.brief
Else
  txtSourceSrv.Tag = ""
  txtSourceSrv = ""
End If
 LoadBtnPictures cmdSourceSrv, cmdSourceSrv.Tag
  cmdSourceSrv.RemoveAllMenu
  cmdSourceSrv.AddMenu "Очистить"
If Not Item.SendRecord Is Nothing Then
  txtSendRecord.Tag = Item.SendRecord.ID
  txtSendRecord = Item.SendRecord.brief
Else
  txtSendRecord.Tag = ""
  txtSendRecord = ""
End If
 LoadBtnPictures cmdSendRecord, cmdSendRecord.Tag
  cmdSendRecord.RemoveAllMenu
  cmdSendRecord.AddMenu "Очистить"
If Not Item.DestSrv Is Nothing Then
  txtDestSrv.Tag = Item.DestSrv.ID
  txtDestSrv = Item.DestSrv.brief
Else
  txtDestSrv.Tag = ""
  txtDestSrv = ""
End If
 LoadBtnPictures cmdDestSrv, cmdDestSrv.Tag
  cmdDestSrv.RemoveAllMenu
  cmdDestSrv.AddMenu "Очистить"
If Not Item.Provider Is Nothing Then
  txtProvider.Tag = Item.Provider.ID
  txtProvider = Item.Provider.brief
Else
  txtProvider.Tag = ""
  txtProvider = ""
End If
 LoadBtnPictures cmdProvider, cmdProvider.Tag
  cmdProvider.RemoveAllMenu
  cmdProvider.AddMenu "Очистить"
  On Error Resume Next
txtReqTypeName = Item.ReqTypeName
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

Item.TheRowID = txtTheRowID
Item.ReqPartName = txtReqPartName
Item.ObjectID = txtObjectID
If txtSourceSrv.Tag <> "" Then
  Set Item.SourceSrv = Item.Application.FindRowObject("REPD_SRV", txtSourceSrv.Tag)
Else
  Set Item.SourceSrv = Nothing
End If
If txtSendRecord.Tag <> "" Then
  Set Item.SendRecord = Item.Application.FindRowObject("REPD_SendQ", txtSendRecord.Tag)
Else
  Set Item.SendRecord = Nothing
End If
If txtDestSrv.Tag <> "" Then
  Set Item.DestSrv = Item.Application.FindRowObject("REPD_SRV", txtDestSrv.Tag)
Else
  Set Item.DestSrv = Nothing
End If
If txtProvider.Tag <> "" Then
  Set Item.Provider = Item.Application.FindRowObject("REPD_PROV", txtProvider.Tag)
Else
  Set Item.Provider = Nothing
End If
Item.ReqTypeName = txtReqTypeName
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



