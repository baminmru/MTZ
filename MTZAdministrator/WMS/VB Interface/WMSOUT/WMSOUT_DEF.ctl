VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl WMSOUT_DEF 
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
      Begin MSMask.MaskEdBox txttemp_in_track 
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         ToolTipText     =   "Температура"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSComCtl2.DTPicker dtptrack_time_out 
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         ToolTipText     =   "Время убытия машины"
         Top             =   3930
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   69730307
         CurrentDate     =   39686
      End
      Begin MSComCtl2.DTPicker dtpTrack_time_in 
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         ToolTipText     =   "Время прибытия машины"
         Top             =   3225
         Width           =   2250
         _ExtentX        =   3969
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy HH:mm:ss"
         Format          =   69730307
         CurrentDate     =   39686
      End
      Begin VB.TextBox txtStampStatus 
         Height          =   300
         Left            =   3450
         MaxLength       =   30
         TabIndex        =   30
         ToolTipText     =   "Состояние пломбы"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtStampNumber 
         Height          =   300
         Left            =   3450
         MaxLength       =   20
         TabIndex        =   28
         ToolTipText     =   "Номер пломбы"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtContainer 
         Height          =   300
         Left            =   3450
         MaxLength       =   10
         TabIndex        =   26
         ToolTipText     =   "№ прицепа \ контейнера"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTranspNumber 
         Height          =   300
         Left            =   3450
         MaxLength       =   10
         TabIndex        =   24
         ToolTipText     =   "№ ТС"
         Top             =   405
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpTTNDate 
         Height          =   300
         Left            =   300
         TabIndex        =   22
         ToolTipText     =   "Дата ТТН"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   69730307
         CurrentDate     =   39686
      End
      Begin VB.TextBox txtTTN 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   20
         ToolTipText     =   "Номер ТТН"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtSupplier 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   18
         ToolTipText     =   "Поставщик"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheDogovor 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Договор"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDogovor 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Договор"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheType 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип заказа"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Тип заказа"
         Top             =   3225
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpProcessDate 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Дата обработки заказа"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   69730307
         CurrentDate     =   39686
      End
      Begin MTZ_PANEL.DropButton cmdTheClient 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Клиент"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheClient 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Клиент"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.TextBox txtTheCode 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   5
         ToolTipText     =   "Код заказа"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdWareHouse 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Склад"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtWareHouse 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Склад"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lbltemp_in_track 
         BackStyle       =   0  'Transparent
         Caption         =   "Температура:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lbltrack_time_out 
         BackStyle       =   0  'Transparent
         Caption         =   "Время убытия машины:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTrack_time_in 
         BackStyle       =   0  'Transparent
         Caption         =   "Время прибытия машины:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblStampStatus 
         BackStyle       =   0  'Transparent
         Caption         =   "Состояние пломбы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblStampNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер пломбы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblContainer 
         BackStyle       =   0  'Transparent
         Caption         =   "№ прицепа \ контейнера:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTranspNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "№ ТС:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblTTNDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата ТТН:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblTTN 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер ТТН:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheDogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "Договор:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип заказа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblProcessDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата обработки заказа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Код заказа:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblWareHouse 
         BackStyle       =   0  'Transparent
         Caption         =   "Склад:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WMSOUT_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





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
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtWareHouse_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdWareHouse_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_WH", ID, brief) Then
          txtWareHouse.Tag = Left(ID, 38)
          txtWareHouse = brief
        End If
End Sub
Private Sub cmdWareHouse_MenuClick(ByVal sCaption As String)
          txtWareHouse.Tag = ""
          txtWareHouse = ""
End Sub
Private Sub txtTheCode_Change()
  Changing

End Sub
Private Sub txtTheClient_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheClient_CLick()
  On Error Resume Next
     If txtTheClient.Tag = "" Then
       cmdTheClient_MenuClick "Выбрать"
     Else
       cmdTheClient_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheClient_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheClient.Tag = ""
          txtTheClient = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheClient.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheClient.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheClient.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "WMSK")
        If OK Then
          txtTheClient.Tag = Left(ID, 38)
          txtTheClient = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim cancel As Boolean
        brief = "WMSK" & Now
        ook = findObject(Item.Application.Manager, "WMSK", ID, brief, cancel)
        If cancel Then
          Exit Sub
        End If
        If ook Then
              txtTheClient.Tag = ID
              txtTheClient = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "WMSK", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtTheClient.Tag = obj.ID
              txtTheClient = obj.brief
          Else
              txtTheClient.Tag = ""
              txtTheClient = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub dtpProcessDate_Change()
  Changing

End Sub
Private Sub txtTheType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WMSD_QTYPE", ID, brief) Then
          txtTheType.Tag = Left(ID, 38)
          txtTheType = brief
        End If
End Sub
Private Sub cmdTheType_MenuClick(ByVal sCaption As String)
          txtTheType.Tag = ""
          txtTheType = ""
End Sub
Private Sub txtTheDogovor_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDogovor_CLick()
  On Error Resume Next
     If txtTheDogovor.Tag = "" Then
       cmdTheDogovor_MenuClick "Выбрать"
     Else
       cmdTheDogovor_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheDogovor_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheDogovor.Tag = ""
          txtTheDogovor = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheDogovor.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheDogovor.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheDogovor.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "WMSCT")
        If OK Then
          txtTheDogovor.Tag = Left(ID, 38)
          txtTheDogovor = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim cancel As Boolean
        brief = "WMSCT" & Now
        ook = findObject(Item.Application.Manager, "WMSCT", ID, brief, cancel)
        If cancel Then
          Exit Sub
        End If
        If ook Then
              txtTheDogovor.Tag = ID
              txtTheDogovor = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "WMSCT", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtTheDogovor.Tag = obj.ID
              txtTheDogovor = obj.brief
          Else
              txtTheDogovor.Tag = ""
              txtTheDogovor = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtSupplier_Change()
  Changing

End Sub
Private Sub txtTTN_Change()
  Changing

End Sub
Private Sub dtpTTNDate_Change()
  Changing

End Sub
Private Sub txtTranspNumber_Change()
  Changing

End Sub
Private Sub txtContainer_Change()
  Changing

End Sub
Private Sub txtStampNumber_Change()
  Changing

End Sub
Private Sub txtStampStatus_Change()
  Changing

End Sub
Private Sub dtpTrack_time_in_Change()
  Changing

End Sub
Private Sub dtptrack_time_out_Change()
  Changing

End Sub
Private Sub txttemp_in_track_Validate(cancel As Boolean)
If txttemp_in_track.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txttemp_in_track.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txttemp_in_track.SetFocus
  ElseIf Val(txttemp_in_track.Text) < -922337203685478# Or Val(txttemp_in_track.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txttemp_in_track.SetFocus
  End If
End If
End Sub
Private Sub txttemp_in_track_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txttemp_in_track_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtWareHouse.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtTheCode.Text)
If mIsOK Then mIsOK = IsSet(dtpProcessDate.Value)
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
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

If Not Item.WareHouse Is Nothing Then
  txtWareHouse.Tag = Item.WareHouse.ID
  txtWareHouse = Item.WareHouse.brief
Else
  txtWareHouse.Tag = ""
  txtWareHouse = ""
End If
 LoadBtnPictures cmdWareHouse, cmdWareHouse.Tag
  cmdWareHouse.RemoveAllMenu
  cmdWareHouse.AddMenu "Очистить"
  On Error Resume Next
txtTheCode = Item.TheCode
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
  cmdTheClient.AddMenu "Создать"
  cmdTheClient.AddMenu "Выбрать"
  cmdTheClient.AddMenu "Открыть"
dtpProcessDate = Date
If Item.ProcessDate <> 0 Then
 dtpProcessDate = Item.ProcessDate
End If
If Not Item.TheType Is Nothing Then
  txtTheType.Tag = Item.TheType.ID
  txtTheType = Item.TheType.brief
Else
  txtTheType.Tag = ""
  txtTheType = ""
End If
 LoadBtnPictures cmdTheType, cmdTheType.Tag
  cmdTheType.RemoveAllMenu
  cmdTheType.AddMenu "Очистить"
If Not Item.TheDogovor Is Nothing Then
  txtTheDogovor.Tag = Item.TheDogovor.ID
  txtTheDogovor = Item.TheDogovor.brief
Else
  txtTheDogovor.Tag = ""
  txtTheDogovor = ""
End If
 LoadBtnPictures cmdTheDogovor, cmdTheDogovor.Tag
  cmdTheDogovor.RemoveAllMenu
  cmdTheDogovor.AddMenu "Очистить"
  cmdTheDogovor.AddMenu "Создать"
  cmdTheDogovor.AddMenu "Выбрать"
  cmdTheDogovor.AddMenu "Открыть"
  On Error Resume Next
txtSupplier = Item.Supplier
  On Error Resume Next
txtTTN = Item.TTN
dtpTTNDate = Date
If Item.TTNDate <> 0 Then
 dtpTTNDate = Item.TTNDate
Else
 dtpTTNDate.Value = Null
End If
  On Error Resume Next
txtTranspNumber = Item.TranspNumber
  On Error Resume Next
txtContainer = Item.Container
  On Error Resume Next
txtStampNumber = Item.StampNumber
  On Error Resume Next
txtStampStatus = Item.StampStatus
dtpTrack_time_in = Now
If Item.Track_time_in <> 0 Then
 dtpTrack_time_in = Item.Track_time_in
Else
 dtpTrack_time_in.Value = Null
End If
dtptrack_time_out = Now
If Item.track_time_out <> 0 Then
 dtptrack_time_out = Item.track_time_out
Else
 dtptrack_time_out.Value = Null
End If
txttemp_in_track = Item.temp_in_track
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

If txtWareHouse.Tag <> "" Then
  Set Item.WareHouse = Item.Application.FindRowObject("WMSD_WH", txtWareHouse.Tag)
Else
  Set Item.WareHouse = Nothing
End If
Item.TheCode = txtTheCode
If txtTheClient.Tag <> "" Then
  Set Item.TheClient = Item.Application.Manager.GetInstanceObject(txtTheClient.Tag)
Else
  Set Item.TheClient = Nothing
End If
  If IsNull(dtpProcessDate) Then
    Item.ProcessDate = 0
  Else
    Item.ProcessDate = dtpProcessDate.Value
  End If
If txtTheType.Tag <> "" Then
  Set Item.TheType = Item.Application.FindRowObject("WMSD_QTYPE", txtTheType.Tag)
Else
  Set Item.TheType = Nothing
End If
If txtTheDogovor.Tag <> "" Then
  Set Item.TheDogovor = Item.Application.Manager.GetInstanceObject(txtTheDogovor.Tag)
Else
  Set Item.TheDogovor = Nothing
End If
Item.Supplier = txtSupplier
Item.TTN = txtTTN
  If IsNull(dtpTTNDate) Then
    Item.TTNDate = 0
  Else
    Item.TTNDate = dtpTTNDate.Value
  End If
Item.TranspNumber = txtTranspNumber
Item.Container = txtContainer
Item.StampNumber = txtStampNumber
Item.StampStatus = txtStampStatus
  If IsNull(dtpTrack_time_in) Then
    Item.Track_time_in = 0
  Else
    Item.Track_time_in = dtpTrack_time_in.Value
  End If
  If IsNull(dtptrack_time_out) Then
    Item.track_time_out = 0
  Else
    Item.track_time_out = dtptrack_time_out.Value
  End If
Item.temp_in_track = CDbl(txttemp_in_track)
 mIsChanged = False
 RaiseEvent Changed
End Sub
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
 Public Sub Customize()
   Panel.Customize
 End Sub
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



