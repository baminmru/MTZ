VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl BBUILDINGS 
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
      Begin MTZ_PANEL.DropButton cmdID_WHO 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Снабжающая организация"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_WHO 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Снабжающая организация"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.TextBox txtCADDRESS 
         Height          =   300
         Left            =   300
         MaxLength       =   400
         TabIndex        =   17
         ToolTipText     =   "Адрес"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtCPHONE2 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   15
         ToolTipText     =   "Тел. 2"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtCFIO2 
         Height          =   300
         Left            =   300
         MaxLength       =   128
         TabIndex        =   13
         ToolTipText     =   "ФИО 2"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtCPHONE1 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   11
         ToolTipText     =   "Тел. 1"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtCFIO1 
         Height          =   300
         Left            =   300
         MaxLength       =   128
         TabIndex        =   9
         ToolTipText     =   "ФИО 1"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtCFULL 
         Height          =   300
         Left            =   300
         MaxLength       =   800
         TabIndex        =   7
         ToolTipText     =   "Полное наименование"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtCSHORT 
         Height          =   300
         Left            =   300
         MaxLength       =   48
         TabIndex        =   5
         ToolTipText     =   "Краткое наименование"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdID_GRP 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Группа"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_GRP 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Группа"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblID_WHO 
         BackStyle       =   0  'Transparent
         Caption         =   "Снабжающая организация:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblCADDRESS 
         BackStyle       =   0  'Transparent
         Caption         =   "Адрес:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblCPHONE2 
         BackStyle       =   0  'Transparent
         Caption         =   "Тел. 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblCFIO2 
         BackStyle       =   0  'Transparent
         Caption         =   "ФИО 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblCPHONE1 
         BackStyle       =   0  'Transparent
         Caption         =   "Тел. 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCFIO1 
         BackStyle       =   0  'Transparent
         Caption         =   "ФИО 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCFULL 
         BackStyle       =   0  'Transparent
         Caption         =   "Полное наименование:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblCSHORT 
         BackStyle       =   0  'Transparent
         Caption         =   "Краткое наименование:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblID_GRP 
         BackStyle       =   0  'Transparent
         Caption         =   "Группа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "BBUILDINGS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Узлы учета
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

Private Sub txtID_GRP_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_GRP_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("BGROUPS", ID, brief) Then
          txtID_GRP.Tag = Left(ID, 38)
          txtID_GRP = brief
        End If
End Sub
Private Sub cmdID_GRP_MenuClick(ByVal sCaption As String)
          txtID_GRP.Tag = ""
          txtID_GRP = ""
End Sub
Private Sub txtCSHORT_Change()
  Changing

End Sub
Private Sub txtCFULL_Change()
  Changing

End Sub
Private Sub txtCFIO1_Change()
  Changing

End Sub
Private Sub txtCPHONE1_Change()
  Changing

End Sub
Private Sub txtCFIO2_Change()
  Changing

End Sub
Private Sub txtCPHONE2_Change()
  Changing

End Sub
Private Sub txtCADDRESS_Change()
  Changing

End Sub
Private Sub txtID_WHO_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_WHO_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WHOGIVE", ID, brief) Then
          txtID_WHO.Tag = Left(ID, 38)
          txtID_WHO = brief
        End If
End Sub
Private Sub cmdID_WHO_MenuClick(ByVal sCaption As String)
          txtID_WHO.Tag = ""
          txtID_WHO = ""
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

If Not Item.ID_GRP Is Nothing Then
  txtID_GRP.Tag = Item.ID_GRP.ID
  txtID_GRP = Item.ID_GRP.brief
Else
  txtID_GRP.Tag = ""
  txtID_GRP = ""
End If
 LoadBtnPictures cmdID_GRP, cmdID_GRP.Tag
  cmdID_GRP.RemoveAllMenu
  cmdID_GRP.AddMenu "Очистить"
  On Error Resume Next
txtCSHORT = Item.CSHORT
  On Error Resume Next
txtCFULL = Item.CFULL
  On Error Resume Next
txtCFIO1 = Item.CFIO1
  On Error Resume Next
txtCPHONE1 = Item.CPHONE1
  On Error Resume Next
txtCFIO2 = Item.CFIO2
  On Error Resume Next
txtCPHONE2 = Item.CPHONE2
  On Error Resume Next
txtCADDRESS = Item.CADDRESS
If Not Item.ID_WHO Is Nothing Then
  txtID_WHO.Tag = Item.ID_WHO.ID
  txtID_WHO = Item.ID_WHO.brief
Else
  txtID_WHO.Tag = ""
  txtID_WHO = ""
End If
 LoadBtnPictures cmdID_WHO, cmdID_WHO.Tag
  cmdID_WHO.RemoveAllMenu
  cmdID_WHO.AddMenu "Очистить"
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

If txtID_GRP.Tag <> "" Then
  Set Item.ID_GRP = Item.Application.FindRowObject("BGROUPS", txtID_GRP.Tag)
Else
  Set Item.ID_GRP = Nothing
End If
Item.CSHORT = txtCSHORT
Item.CFULL = txtCFULL
Item.CFIO1 = txtCFIO1
Item.CPHONE1 = txtCPHONE1
Item.CFIO2 = txtCFIO2
Item.CPHONE2 = txtCPHONE2
Item.CADDRESS = txtCADDRESS
If txtID_WHO.Tag <> "" Then
  Set Item.ID_WHO = Item.Application.FindRowObject("WHOGIVE", txtID_WHO.Tag)
Else
  Set Item.ID_WHO = Nothing
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



