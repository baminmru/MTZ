VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl REPD_RecvQ 
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
      Begin VB.ComboBox cmbCompleted 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   27
         ToolTipText     =   "Completed"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtFileName 
         Height          =   300
         Left            =   3450
         MaxLength       =   1024
         TabIndex        =   25
         ToolTipText     =   "FileName"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtPartNumber 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   23
         ToolTipText     =   "Часть"
         Top             =   405
         Width           =   1800
      End
      Begin VB.TextBox txtPartCount 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   21
         ToolTipText     =   "Количество частей"
         Top             =   6045
         Width           =   1800
      End
      Begin VB.TextBox txtReplicaPackID 
         Height          =   300
         Left            =   300
         TabIndex        =   19
         ToolTipText     =   "ReplicaPackID"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.ComboBox cmbAcknowelge 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   17
         ToolTipText     =   "Acknowelge"
         Top             =   4635
         Width           =   3000
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
      Begin MTZ_PANEL.DropButton cmdSourceSrv 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "SourceSrv"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSourceSrv 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "SourceSrv"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.TextBox txtRecvSize 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   9
         ToolTipText     =   "RecvSize"
         Top             =   2520
         Width           =   1800
      End
      Begin MTZ_PANEL.DropButton cmdProvider 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Provider"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProvider 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Provider"
         Top             =   1815
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpReceived 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Received"
         Top             =   1110
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   91357187
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtTheRowID 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "TheRowID"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblCompleted 
         BackStyle       =   0  'Transparent
         Caption         =   "Completed:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFileName 
         BackStyle       =   0  'Transparent
         Caption         =   "FileName:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPartNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Часть:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblPartCount 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество частей:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblReplicaPackID 
         BackStyle       =   0  'Transparent
         Caption         =   "ReplicaPackID:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblAcknowelge 
         BackStyle       =   0  'Transparent
         Caption         =   "Acknowelge:"
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
      Begin VB.Label lblSourceSrv 
         BackStyle       =   0  'Transparent
         Caption         =   "SourceSrv:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblRecvSize 
         BackStyle       =   0  'Transparent
         Caption         =   "RecvSize:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblProvider 
         BackStyle       =   0  'Transparent
         Caption         =   "Provider:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblReceived 
         BackStyle       =   0  'Transparent
         Caption         =   "Received:"
         ForeColor       =   &H000000FF&
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
Attribute VB_Name = "REPD_RecvQ"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Очередь полученых реплик
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

Private Sub txtTheRowID_Change()
  Changing

End Sub
Private Sub dtpReceived_Change()
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
Private Sub txtRecvSize_Validate(cancel As Boolean)
If txtRecvSize.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtRecvSize.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtRecvSize.SetFocus
  ElseIf Val(txtRecvSize.Text) <> CLng(Val(txtRecvSize.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtRecvSize.SetFocus
  End If
End If
End Sub
Private Sub txtRecvSize_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtRecvSize_Change()
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
Private Sub cmbAcknowelge_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtReplicaPackID_Change()
  Changing

End Sub
Private Sub txtPartCount_Validate(cancel As Boolean)
If txtPartCount.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPartCount.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPartCount.SetFocus
  ElseIf Val(txtPartCount.Text) <> CLng(Val(txtPartCount.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtPartCount.SetFocus
  End If
End If
End Sub
Private Sub txtPartCount_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPartCount_Change()
  Changing

End Sub
Private Sub txtPartNumber_Validate(cancel As Boolean)
If txtPartNumber.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPartNumber.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPartNumber.SetFocus
  ElseIf Val(txtPartNumber.Text) <> CLng(Val(txtPartNumber.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtPartNumber.SetFocus
  End If
End If
End Sub
Private Sub txtPartNumber_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPartNumber_Change()
  Changing

End Sub
Private Sub txtFileName_Change()
  Changing

End Sub
Private Sub cmbCompleted_Click()
  On Error Resume Next
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

If mIsOK Then mIsOK = IsSet(dtpReceived.Value)
If mIsOK Then mIsOK = txtProvider.Tag <> ""
If mIsOK Then mIsOK = txtSourceSrv.Tag <> ""
If mIsOK Then mIsOK = (cmbAcknowelge.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(txtFileName.Text)
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
dtpReceived = Now
If Item.Received <> 0 Then
 dtpReceived = Item.Received
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
txtRecvSize = Item.RecvSize
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
cmbAcknowelge.Clear
cmbAcknowelge.AddItem "Да"
cmbAcknowelge.ItemData(cmbAcknowelge.NewIndex) = -1
cmbAcknowelge.AddItem "Нет"
cmbAcknowelge.ItemData(cmbAcknowelge.NewIndex) = 0
 For iii = 0 To cmbAcknowelge.ListCount - 1
  If Item.Acknowelge = cmbAcknowelge.ItemData(iii) Then
   cmbAcknowelge.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtReplicaPackID = Item.ReplicaPackID
txtPartCount = Item.PartCount
txtPartNumber = Item.PartNumber
  On Error Resume Next
txtFileName = Item.FileName
cmbCompleted.Clear
cmbCompleted.AddItem "Да"
cmbCompleted.ItemData(cmbCompleted.NewIndex) = -1
cmbCompleted.AddItem "Нет"
cmbCompleted.ItemData(cmbCompleted.NewIndex) = 0
 For iii = 0 To cmbCompleted.ListCount - 1
  If Item.Completed = cmbCompleted.ItemData(iii) Then
   cmbCompleted.ListIndex = iii
   Exit For
  End If
 Next
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
  If IsNull(dtpReceived) Then
    Item.Received = 0
  Else
    Item.Received = dtpReceived.Value
  End If
If txtProvider.Tag <> "" Then
  Set Item.Provider = Item.Application.FindRowObject("REPD_PROV", txtProvider.Tag)
Else
  Set Item.Provider = Nothing
End If
Item.RecvSize = CDbl(txtRecvSize)
If txtSourceSrv.Tag <> "" Then
  Set Item.SourceSrv = Item.Application.FindRowObject("REPD_SRV", txtSourceSrv.Tag)
Else
  Set Item.SourceSrv = Nothing
End If
If txtDestSrv.Tag <> "" Then
  Set Item.DestSrv = Item.Application.FindRowObject("REPD_SRV", txtDestSrv.Tag)
Else
  Set Item.DestSrv = Nothing
End If
 If cmbAcknowelge.ListIndex >= 0 Then
   Item.Acknowelge = cmbAcknowelge.ItemData(cmbAcknowelge.ListIndex)
 End If
Item.ReplicaPackID = txtReplicaPackID
Item.PartCount = CDbl(txtPartCount)
Item.PartNumber = CDbl(txtPartNumber)
Item.FileName = txtFileName
 If cmbCompleted.ListIndex >= 0 Then
   Item.Completed = cmbCompleted.ItemData(cmbCompleted.ListIndex)
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



