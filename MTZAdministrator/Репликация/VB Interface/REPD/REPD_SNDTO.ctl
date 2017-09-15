VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl REPD_SNDTO 
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
      Begin MSComCtl2.DTPicker dtpLastApproveLog 
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         ToolTipText     =   "Последнее подтверждение (лог)"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   138870787
         CurrentDate     =   39874
      End
      Begin VB.ComboBox cmbIsActive 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   20
         ToolTipText     =   "Активен"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtThe_Interval 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   18
         ToolTipText     =   "Интервал"
         Top             =   6240
         Width           =   1800
      End
      Begin MSComCtl2.DTPicker dtpWork_End 
         Height          =   300
         Left            =   300
         TabIndex        =   16
         ToolTipText     =   "Окончание работы (время)"
         Top             =   5535
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "HH:mm:ss"
         Format          =   138870787
         UpDown          =   -1  'True
         CurrentDate     =   39874
      End
      Begin MSComCtl2.DTPicker dtpWork_Start 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Начало работы (время)"
         Top             =   4830
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "HH:mm:ss"
         Format          =   138870787
         UpDown          =   -1  'True
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdProvider 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "Provider"
         Top             =   4125
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProvider 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Provider"
         Top             =   4125
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpLastReceive 
         Height          =   300
         Left            =   300
         TabIndex        =   9
         ToolTipText     =   "Last Receive"
         Top             =   3420
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   138870787
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtConfig 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         ToolTipText     =   "Config"
         Top             =   1815
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpLastScan 
         Height          =   300
         Left            =   300
         TabIndex        =   5
         ToolTipText     =   "Last scan"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   138870787
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdDestSrv 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "DestSrv"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDestSrv 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "DestSrv"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblLastApproveLog 
         BackStyle       =   0  'Transparent
         Caption         =   "Последнее подтверждение (лог):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblIsActive 
         BackStyle       =   0  'Transparent
         Caption         =   "Активен:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblThe_Interval 
         BackStyle       =   0  'Transparent
         Caption         =   "Интервал:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5910
         Width           =   3000
      End
      Begin VB.Label lblWork_End 
         BackStyle       =   0  'Transparent
         Caption         =   "Окончание работы (время):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblWork_Start 
         BackStyle       =   0  'Transparent
         Caption         =   "Начало работы (время):"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblProvider 
         BackStyle       =   0  'Transparent
         Caption         =   "Provider:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblLastReceive 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Receive:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblConfig 
         BackStyle       =   0  'Transparent
         Caption         =   "Config:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblLastScan 
         BackStyle       =   0  'Transparent
         Caption         =   "Last scan:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblDestSrv 
         BackStyle       =   0  'Transparent
         Caption         =   "DestSrv:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "REPD_SNDTO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Получатели реплик
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
Private Sub dtpLastScan_Change()
  Changing

End Sub
Private Sub txtConfig_Change()
  Changing

End Sub
Private Sub dtpLastReceive_Change()
  Changing

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
Private Sub dtpWork_Start_Change()
  Changing

End Sub
Private Sub dtpWork_End_Change()
  Changing

End Sub
Private Sub txtThe_Interval_Validate(cancel As Boolean)
If txtThe_Interval.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtThe_Interval.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtThe_Interval.SetFocus
  ElseIf Val(txtThe_Interval.Text) <> CLng(Val(txtThe_Interval.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtThe_Interval.SetFocus
  End If
End If
End Sub
Private Sub txtThe_Interval_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtThe_Interval_Change()
  Changing

End Sub
Private Sub cmbIsActive_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub dtpLastApproveLog_Change()
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

If mIsOK Then mIsOK = txtDestSrv.Tag <> ""
If mIsOK Then mIsOK = txtProvider.Tag <> ""
If mIsOK Then mIsOK = (cmbIsActive.ListIndex >= 0)
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
dtpLastScan = Now
If Item.LastScan <> 0 Then
 dtpLastScan = Item.LastScan
Else
 dtpLastScan.Value = Null
End If
txtConfig = Item.Config
dtpLastReceive = Now
If Item.LastReceive <> 0 Then
 dtpLastReceive = Item.LastReceive
Else
 dtpLastReceive.Value = Null
End If
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
dtpWork_Start = Time
If Item.Work_Start <> 0 Then
 dtpWork_Start = Item.Work_Start
Else
 dtpWork_Start.Value = Null
End If
dtpWork_End = Time
If Item.Work_End <> 0 Then
 dtpWork_End = Item.Work_End
Else
 dtpWork_End.Value = Null
End If
txtThe_Interval = Item.The_Interval
cmbIsActive.Clear
cmbIsActive.AddItem "Да"
cmbIsActive.ItemData(cmbIsActive.NewIndex) = -1
cmbIsActive.AddItem "Нет"
cmbIsActive.ItemData(cmbIsActive.NewIndex) = 0
 For iii = 0 To cmbIsActive.ListCount - 1
  If Item.IsActive = cmbIsActive.ItemData(iii) Then
   cmbIsActive.ListIndex = iii
   Exit For
  End If
 Next
dtpLastApproveLog = Now
If Item.LastApproveLog <> 0 Then
 dtpLastApproveLog = Item.LastApproveLog
Else
 dtpLastApproveLog.Value = Null
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
If OnInit Then Exit Sub

If txtDestSrv.Tag <> "" Then
  Set Item.DestSrv = Item.Application.FindRowObject("REPD_SRV", txtDestSrv.Tag)
Else
  Set Item.DestSrv = Nothing
End If
  If IsNull(dtpLastScan) Then
    Item.LastScan = 0
  Else
    Item.LastScan = dtpLastScan.Value
  End If
Item.Config = txtConfig
  If IsNull(dtpLastReceive) Then
    Item.LastReceive = 0
  Else
    Item.LastReceive = dtpLastReceive.Value
  End If
If txtProvider.Tag <> "" Then
  Set Item.Provider = Item.Application.FindRowObject("REPD_PROV", txtProvider.Tag)
Else
  Set Item.Provider = Nothing
End If
  If IsNull(dtpWork_Start) Then
    Item.Work_Start = 0
  Else
    Item.Work_Start = dtpWork_Start.Value
  End If
  If IsNull(dtpWork_End) Then
    Item.Work_End = 0
  Else
    Item.Work_End = dtpWork_End.Value
  End If
Item.The_Interval = CDbl(txtThe_Interval)
 If cmbIsActive.ListIndex >= 0 Then
   Item.IsActive = cmbIsActive.ItemData(cmbIsActive.ListIndex)
 End If
  If IsNull(dtpLastApproveLog) Then
    Item.LastApproveLog = 0
  Else
    Item.LastApproveLog = dtpLastApproveLog.Value
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



