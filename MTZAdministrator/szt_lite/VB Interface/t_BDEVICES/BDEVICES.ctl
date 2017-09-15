VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl BDEVICES 
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
      Begin VB.ComboBox cmbID_MD 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   37
         ToolTipText     =   "Автоматический опрос"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbCONNECTED 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   35
         ToolTipText     =   "1 - подключен 0 - отключен"
         Top             =   2520
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpNPLOCK 
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         ToolTipText     =   "Время до которого устройство считается заблокированным"
         Top             =   1815
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   80150531
         CurrentDate     =   39975
      End
      Begin VB.TextBox txtNPPASSWORD 
         Height          =   300
         Left            =   3450
         MaxLength       =   160
         TabIndex        =   31
         ToolTipText     =   "Пароль к NPORT"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtNPIP 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   29
         ToolTipText     =   "IP адрес NPORT"
         Top             =   405
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdreport_day 
         Height          =   300
         Left            =   2850
         TabIndex        =   27
         Tag             =   "refopen.ico"
         ToolTipText     =   "Отчет по суточным"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtreport_day 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   26
         ToolTipText     =   "Отчет по суточным"
         Top             =   6045
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdreport_hour 
         Height          =   300
         Left            =   2850
         TabIndex        =   24
         Tag             =   "refopen.ico"
         ToolTipText     =   "Отчет по часовым"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtreport_hour 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   23
         ToolTipText     =   "Отчет по часовым"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdSCHEMA_ID 
         Height          =   300
         Left            =   2850
         TabIndex        =   21
         Tag             =   "refopen.ico"
         ToolTipText     =   "Схема подключения"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSCHEMA_ID 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   20
         ToolTipText     =   "Схема подключения"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdID_MASK_SUM 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "Шаблон опроса итоговых "
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_MASK_SUM 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "Шаблон опроса итоговых "
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdID_MASK_24 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "Шаблон опроса суточных"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_MASK_24 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "Шаблон опроса суточных"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdID_MASK_HOUR 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "Шаблон отображения часовых"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_MASK_HOUR 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Шаблон отображения часовых"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdID_MASK_CURR 
         Height          =   300
         Left            =   2850
         TabIndex        =   9
         Tag             =   "refopen.ico"
         ToolTipText     =   "Шаблон отображения текущих"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_MASK_CURR 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   8
         ToolTipText     =   "Шаблон отображения текущих"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdID_DEV 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Устройство"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_DEV 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Устройство"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdID_BU 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Здание"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtID_BU 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Здание"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblID_MD 
         BackStyle       =   0  'Transparent
         Caption         =   "Автоматический опрос:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCONNECTED 
         BackStyle       =   0  'Transparent
         Caption         =   "1 - подключен 0 - отключен:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblNPLOCK 
         BackStyle       =   0  'Transparent
         Caption         =   "Время до которого устройство считается заблокированным:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblNPPASSWORD 
         BackStyle       =   0  'Transparent
         Caption         =   "Пароль к NPORT:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblNPIP 
         BackStyle       =   0  'Transparent
         Caption         =   "IP адрес NPORT:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblreport_day 
         BackStyle       =   0  'Transparent
         Caption         =   "Отчет по суточным:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   25
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblreport_hour 
         BackStyle       =   0  'Transparent
         Caption         =   "Отчет по часовым:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   22
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblSCHEMA_ID 
         BackStyle       =   0  'Transparent
         Caption         =   "Схема подключения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblID_MASK_SUM 
         BackStyle       =   0  'Transparent
         Caption         =   "Шаблон опроса итоговых :"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblID_MASK_24 
         BackStyle       =   0  'Transparent
         Caption         =   "Шаблон опроса суточных:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblID_MASK_HOUR 
         BackStyle       =   0  'Transparent
         Caption         =   "Шаблон отображения часовых:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblID_MASK_CURR 
         BackStyle       =   0  'Transparent
         Caption         =   "Шаблон отображения текущих:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblID_DEV 
         BackStyle       =   0  'Transparent
         Caption         =   "Устройство:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblID_BU 
         BackStyle       =   0  'Transparent
         Caption         =   "Здание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "BDEVICES"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Подключенные к узлу устройства
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

Private Sub txtID_BU_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_BU_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("BBUILDINGS", ID, brief) Then
          txtID_BU.Tag = Left(ID, 38)
          txtID_BU = brief
        End If
End Sub
Private Sub cmdID_BU_MenuClick(ByVal sCaption As String)
          txtID_BU.Tag = ""
          txtID_BU = ""
End Sub
Private Sub txtID_DEV_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_DEV_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("DEVICES", ID, brief) Then
          txtID_DEV.Tag = Left(ID, 38)
          txtID_DEV = brief
        End If
End Sub
Private Sub cmdID_DEV_MenuClick(ByVal sCaption As String)
          txtID_DEV.Tag = ""
          txtID_DEV = ""
End Sub
Private Sub txtID_MASK_CURR_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_MASK_CURR_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MASKS", ID, brief) Then
          txtID_MASK_CURR.Tag = Left(ID, 38)
          txtID_MASK_CURR = brief
        End If
End Sub
Private Sub cmdID_MASK_CURR_MenuClick(ByVal sCaption As String)
          txtID_MASK_CURR.Tag = ""
          txtID_MASK_CURR = ""
End Sub
Private Sub txtID_MASK_HOUR_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_MASK_HOUR_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MASKS", ID, brief) Then
          txtID_MASK_HOUR.Tag = Left(ID, 38)
          txtID_MASK_HOUR = brief
        End If
End Sub
Private Sub cmdID_MASK_HOUR_MenuClick(ByVal sCaption As String)
          txtID_MASK_HOUR.Tag = ""
          txtID_MASK_HOUR = ""
End Sub
Private Sub txtID_MASK_24_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_MASK_24_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MASKS", ID, brief) Then
          txtID_MASK_24.Tag = Left(ID, 38)
          txtID_MASK_24 = brief
        End If
End Sub
Private Sub cmdID_MASK_24_MenuClick(ByVal sCaption As String)
          txtID_MASK_24.Tag = ""
          txtID_MASK_24 = ""
End Sub
Private Sub txtID_MASK_SUM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdID_MASK_SUM_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MASKS", ID, brief) Then
          txtID_MASK_SUM.Tag = Left(ID, 38)
          txtID_MASK_SUM = brief
        End If
End Sub
Private Sub cmdID_MASK_SUM_MenuClick(ByVal sCaption As String)
          txtID_MASK_SUM.Tag = ""
          txtID_MASK_SUM = ""
End Sub
Private Sub txtSCHEMA_ID_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSCHEMA_ID_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("DEVSCHEMA", ID, brief) Then
          txtSCHEMA_ID.Tag = Left(ID, 38)
          txtSCHEMA_ID = brief
        End If
End Sub
Private Sub cmdSCHEMA_ID_MenuClick(ByVal sCaption As String)
          txtSCHEMA_ID.Tag = ""
          txtSCHEMA_ID = ""
End Sub
Private Sub txtreport_hour_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdreport_hour_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("REPORT", ID, brief) Then
          txtreport_hour.Tag = Left(ID, 38)
          txtreport_hour = brief
        End If
End Sub
Private Sub cmdreport_hour_MenuClick(ByVal sCaption As String)
          txtreport_hour.Tag = ""
          txtreport_hour = ""
End Sub
Private Sub txtreport_day_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdreport_day_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("REPORT", ID, brief) Then
          txtreport_day.Tag = Left(ID, 38)
          txtreport_day = brief
        End If
End Sub
Private Sub cmdreport_day_MenuClick(ByVal sCaption As String)
          txtreport_day.Tag = ""
          txtreport_day = ""
End Sub
Private Sub txtNPIP_Change()
  Changing

End Sub
Private Sub txtNPPASSWORD_Change()
  Changing

End Sub
Private Sub dtpNPLOCK_Change()
  Changing

End Sub
Private Sub cmbCONNECTED_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbID_MD_Click()
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

If Not Item.ID_BU Is Nothing Then
  txtID_BU.Tag = Item.ID_BU.ID
  txtID_BU = Item.ID_BU.brief
Else
  txtID_BU.Tag = ""
  txtID_BU = ""
End If
 LoadBtnPictures cmdID_BU, cmdID_BU.Tag
  cmdID_BU.RemoveAllMenu
  cmdID_BU.AddMenu "Очистить"
If Not Item.ID_DEV Is Nothing Then
  txtID_DEV.Tag = Item.ID_DEV.ID
  txtID_DEV = Item.ID_DEV.brief
Else
  txtID_DEV.Tag = ""
  txtID_DEV = ""
End If
 LoadBtnPictures cmdID_DEV, cmdID_DEV.Tag
  cmdID_DEV.RemoveAllMenu
  cmdID_DEV.AddMenu "Очистить"
If Not Item.ID_MASK_CURR Is Nothing Then
  txtID_MASK_CURR.Tag = Item.ID_MASK_CURR.ID
  txtID_MASK_CURR = Item.ID_MASK_CURR.brief
Else
  txtID_MASK_CURR.Tag = ""
  txtID_MASK_CURR = ""
End If
 LoadBtnPictures cmdID_MASK_CURR, cmdID_MASK_CURR.Tag
  cmdID_MASK_CURR.RemoveAllMenu
  cmdID_MASK_CURR.AddMenu "Очистить"
If Not Item.ID_MASK_HOUR Is Nothing Then
  txtID_MASK_HOUR.Tag = Item.ID_MASK_HOUR.ID
  txtID_MASK_HOUR = Item.ID_MASK_HOUR.brief
Else
  txtID_MASK_HOUR.Tag = ""
  txtID_MASK_HOUR = ""
End If
 LoadBtnPictures cmdID_MASK_HOUR, cmdID_MASK_HOUR.Tag
  cmdID_MASK_HOUR.RemoveAllMenu
  cmdID_MASK_HOUR.AddMenu "Очистить"
If Not Item.ID_MASK_24 Is Nothing Then
  txtID_MASK_24.Tag = Item.ID_MASK_24.ID
  txtID_MASK_24 = Item.ID_MASK_24.brief
Else
  txtID_MASK_24.Tag = ""
  txtID_MASK_24 = ""
End If
 LoadBtnPictures cmdID_MASK_24, cmdID_MASK_24.Tag
  cmdID_MASK_24.RemoveAllMenu
  cmdID_MASK_24.AddMenu "Очистить"
If Not Item.ID_MASK_SUM Is Nothing Then
  txtID_MASK_SUM.Tag = Item.ID_MASK_SUM.ID
  txtID_MASK_SUM = Item.ID_MASK_SUM.brief
Else
  txtID_MASK_SUM.Tag = ""
  txtID_MASK_SUM = ""
End If
 LoadBtnPictures cmdID_MASK_SUM, cmdID_MASK_SUM.Tag
  cmdID_MASK_SUM.RemoveAllMenu
  cmdID_MASK_SUM.AddMenu "Очистить"
If Not Item.SCHEMA_ID Is Nothing Then
  txtSCHEMA_ID.Tag = Item.SCHEMA_ID.ID
  txtSCHEMA_ID = Item.SCHEMA_ID.brief
Else
  txtSCHEMA_ID.Tag = ""
  txtSCHEMA_ID = ""
End If
 LoadBtnPictures cmdSCHEMA_ID, cmdSCHEMA_ID.Tag
  cmdSCHEMA_ID.RemoveAllMenu
  cmdSCHEMA_ID.AddMenu "Очистить"
If Not Item.report_hour Is Nothing Then
  txtreport_hour.Tag = Item.report_hour.ID
  txtreport_hour = Item.report_hour.brief
Else
  txtreport_hour.Tag = ""
  txtreport_hour = ""
End If
 LoadBtnPictures cmdreport_hour, cmdreport_hour.Tag
  cmdreport_hour.RemoveAllMenu
  cmdreport_hour.AddMenu "Очистить"
If Not Item.report_day Is Nothing Then
  txtreport_day.Tag = Item.report_day.ID
  txtreport_day = Item.report_day.brief
Else
  txtreport_day.Tag = ""
  txtreport_day = ""
End If
 LoadBtnPictures cmdreport_day, cmdreport_day.Tag
  cmdreport_day.RemoveAllMenu
  cmdreport_day.AddMenu "Очистить"
  On Error Resume Next
txtNPIP = Item.NPIP
  On Error Resume Next
txtNPPASSWORD = Item.NPPASSWORD
dtpNPLOCK = Now
If Item.NPLOCK <> 0 Then
 dtpNPLOCK = Item.NPLOCK
Else
 dtpNPLOCK.Value = Null
End If
cmbCONNECTED.Clear
cmbCONNECTED.AddItem "Да"
cmbCONNECTED.ItemData(cmbCONNECTED.NewIndex) = -1
cmbCONNECTED.AddItem "Нет"
cmbCONNECTED.ItemData(cmbCONNECTED.NewIndex) = 0
 For iii = 0 To cmbCONNECTED.ListCount - 1
  If Item.Connected = cmbCONNECTED.ItemData(iii) Then
   cmbCONNECTED.ListIndex = iii
   Exit For
  End If
 Next
cmbID_MD.Clear
cmbID_MD.AddItem "Да"
cmbID_MD.ItemData(cmbID_MD.NewIndex) = -1
cmbID_MD.AddItem "Нет"
cmbID_MD.ItemData(cmbID_MD.NewIndex) = 0
 For iii = 0 To cmbID_MD.ListCount - 1
  If Item.ID_MD = cmbID_MD.ItemData(iii) Then
   cmbID_MD.ListIndex = iii
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

If txtID_BU.Tag <> "" Then
  Set Item.ID_BU = Item.Application.FindRowObject("BBUILDINGS", txtID_BU.Tag)
Else
  Set Item.ID_BU = Nothing
End If
If txtID_DEV.Tag <> "" Then
  Set Item.ID_DEV = Item.Application.FindRowObject("DEVICES", txtID_DEV.Tag)
Else
  Set Item.ID_DEV = Nothing
End If
If txtID_MASK_CURR.Tag <> "" Then
  Set Item.ID_MASK_CURR = Item.Application.FindRowObject("MASKS", txtID_MASK_CURR.Tag)
Else
  Set Item.ID_MASK_CURR = Nothing
End If
If txtID_MASK_HOUR.Tag <> "" Then
  Set Item.ID_MASK_HOUR = Item.Application.FindRowObject("MASKS", txtID_MASK_HOUR.Tag)
Else
  Set Item.ID_MASK_HOUR = Nothing
End If
If txtID_MASK_24.Tag <> "" Then
  Set Item.ID_MASK_24 = Item.Application.FindRowObject("MASKS", txtID_MASK_24.Tag)
Else
  Set Item.ID_MASK_24 = Nothing
End If
If txtID_MASK_SUM.Tag <> "" Then
  Set Item.ID_MASK_SUM = Item.Application.FindRowObject("MASKS", txtID_MASK_SUM.Tag)
Else
  Set Item.ID_MASK_SUM = Nothing
End If
If txtSCHEMA_ID.Tag <> "" Then
  Set Item.SCHEMA_ID = Item.Application.FindRowObject("DEVSCHEMA", txtSCHEMA_ID.Tag)
Else
  Set Item.SCHEMA_ID = Nothing
End If
If txtreport_hour.Tag <> "" Then
  Set Item.report_hour = Item.Application.FindRowObject("REPORT", txtreport_hour.Tag)
Else
  Set Item.report_hour = Nothing
End If
If txtreport_day.Tag <> "" Then
  Set Item.report_day = Item.Application.FindRowObject("REPORT", txtreport_day.Tag)
Else
  Set Item.report_day = Nothing
End If
Item.NPIP = txtNPIP
Item.NPPASSWORD = txtNPPASSWORD
  If IsNull(dtpNPLOCK) Then
    Item.NPLOCK = 0
  Else
    Item.NPLOCK = dtpNPLOCK.Value
  End If
 If cmbCONNECTED.ListIndex >= 0 Then
   Item.Connected = cmbCONNECTED.ItemData(cmbCONNECTED.ListIndex)
 End If
 If cmbID_MD.ListIndex >= 0 Then
   Item.ID_MD = cmbID_MD.ItemData(cmbID_MD.ListIndex)
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



