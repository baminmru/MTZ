VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl ITTOUT_LINESadmi 
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
      Begin VB.ComboBox cmbNavalom 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   49
         ToolTipText     =   "Груз навалом"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdgood_ID 
         Height          =   300
         Left            =   9150
         TabIndex        =   47
         Tag             =   "refopen.ico"
         ToolTipText     =   "Идентификатор товара"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtgood_ID 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   46
         ToolTipText     =   "Идентификатор товара"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtNumInBufZone 
         Height          =   300
         Left            =   6600
         MaxLength       =   20
         TabIndex        =   44
         ToolTipText     =   "Номер в буферной зоне"
         Top             =   405
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtFullPackageWeight 
         Height          =   300
         Left            =   3450
         TabIndex        =   42
         ToolTipText     =   "Суммарный вес упаковки КГ."
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtQuanity 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   40
         ToolTipText     =   "Количество коробов"
         Top             =   5340
         Width           =   1800
      End
      Begin MSComCtl2.DTPicker dtpexp_date 
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         ToolTipText     =   "Срок годности"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   92209155
         CurrentDate     =   39874
      End
      Begin MSMask.MaskEdBox txtPackageWeight 
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         ToolTipText     =   "Вес одной упаковки"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtvetsved 
         Height          =   300
         Left            =   3450
         MaxLength       =   50
         TabIndex        =   34
         ToolTipText     =   "Номер сертификата"
         Top             =   3225
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpmade_date_to 
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         ToolTipText     =   "Дата производства По"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   92209155
         CurrentDate     =   39874
      End
      Begin MSComCtl2.DTPicker dtpMade_date 
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         ToolTipText     =   "Дата производства С"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   92209155
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdPartRef 
         Height          =   300
         Left            =   6000
         TabIndex        =   28
         Tag             =   "refopen.ico"
         ToolTipText     =   "Партия"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPartRef 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   27
         ToolTipText     =   "Партия"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtVidOtruba 
         Height          =   300
         Left            =   3450
         MaxLength       =   64
         TabIndex        =   25
         ToolTipText     =   "Вид отруба"
         Top             =   405
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdKILL_NUMBER 
         Height          =   300
         Left            =   2850
         TabIndex        =   23
         Tag             =   "refopen.ico"
         ToolTipText     =   "№ бойни"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtKILL_NUMBER 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   22
         ToolTipText     =   "№ бойни"
         Top             =   6045
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdFactory 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Завод"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFactory 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Завод"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdmade_country 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страна производитель"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtmade_country 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Страна производитель"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.TextBox txtedizm 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   14
         ToolTipText     =   "Ед. изм"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtarticul 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   12
         ToolTipText     =   "Артикул"
         Top             =   3225
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtCurValue 
         Height          =   300
         Left            =   300
         TabIndex        =   10
         ToolTipText     =   "Факт КГ."
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdQRY_NUM 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "По заказу КГ."
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtQRY_NUM 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "По заказу КГ."
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdLineAtQuery 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Строка в заказе"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtLineAtQuery 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Строка в заказе"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtsequence 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "№"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblNavalom 
         BackStyle       =   0  'Transparent
         Caption         =   "Груз навалом:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblgood_ID 
         BackStyle       =   0  'Transparent
         Caption         =   "Идентификатор товара:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblNumInBufZone 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер в буферной зоне:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblFullPackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Суммарный вес упаковки КГ.:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   41
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblQuanity 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество коробов:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblexp_date 
         BackStyle       =   0  'Transparent
         Caption         =   "Срок годности:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblPackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес одной упаковки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblvetsved 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер сертификата:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblmade_date_to 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата производства По:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblMade_date 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата производства С:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPartRef 
         BackStyle       =   0  'Transparent
         Caption         =   "Партия:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblVidOtruba 
         BackStyle       =   0  'Transparent
         Caption         =   "Вид отруба:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblKILL_NUMBER 
         BackStyle       =   0  'Transparent
         Caption         =   "№ бойни:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblFactory 
         BackStyle       =   0  'Transparent
         Caption         =   "Завод:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblmade_country 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна производитель:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lbledizm 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblarticul 
         BackStyle       =   0  'Transparent
         Caption         =   "Артикул:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCurValue 
         BackStyle       =   0  'Transparent
         Caption         =   "Факт КГ.:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblQRY_NUM 
         BackStyle       =   0  'Transparent
         Caption         =   "По заказу КГ.:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblLineAtQuery 
         BackStyle       =   0  'Transparent
         Caption         =   "Строка в заказе:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblsequence 
         BackStyle       =   0  'Transparent
         Caption         =   "№:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTOUT_LINESadmi"
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
  Private mIDLineAtQuery As String
  Private mIDQRY_NUM As String
  Private mIDgood_ID As String






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

Private Sub txtsequence_Validate(cancel As Boolean)
If txtsequence.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtsequence.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtsequence.SetFocus
  ElseIf Val(txtsequence.Text) <> CLng(Val(txtsequence.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtsequence.SetFocus
  End If
End If
End Sub
Private Sub txtsequence_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtsequence_Change()
  Changing

End Sub
Private Sub txtLineAtQuery_Change()
  If Not (OnInit) Then
If (txtLineAtQuery.Text = "") Then
  ' Убрать Brief и ID
  If (txtLineAtQuery.Tag <> "") Then
    Dim XMLDoc As New DOMDocument
    Call XMLDoc.loadXML(txtLineAtQuery.Tag)
    Dim Node As MSXML2.IXMLDOMNode
    For Each Node In XMLDoc.childNodes.Item(0).childNodes
     If (Node.baseName = "ID") Then
       Node.Text = ""
     End If
     If (Node.baseName = "Brief") Then
       Node.Text = ""
     End If
    Next
    txtLineAtQuery.Tag = XMLDoc.xml
  End If
End If
If (Not OnInit Or True) Then ' Пока не понял - надо ли всегда или нет
    Call cmdQRY_NUM_Click
    End If
If (Not OnInit Or True) Then ' Пока не понял - надо ли всегда или нет
    Call cmdgood_ID_Click
    End If
  Changing

  End If
End Sub
Private Sub cmdLineAtQuery_Click()
  On Error Resume Next
  If (Not OnInit) Then
    Dim iFrom As Long
    Dim iTo As Long
    iFrom = InStr(1, txtLineAtQuery.Tag, "<ID>")
    If (iFrom > 0) Then
      iTo = InStr(iFrom, txtLineAtQuery.Tag, "</ID>")
      mIDLineAtQuery = Mid(txtLineAtQuery.Tag, iFrom + 4, iTo - iFrom - 5)
    End If
    Dim MTZShell As Object
    Set MTZShell = Item.Application.Manager.GetCustomObjects("MTZShell")
    If (Not MTZShell Is Nothing) Then
      err.Clear
      Dim Processed As Variant
      Processed = False
      Call MTZShell.FireEvent("LineAtQuery;" & mIDLineAtQuery, Processed)
      If (err.Number = 0 And Processed <> vbNullString And Processed <> False) Then
        Exit Sub
      End If
    End If
    txtLineAtQuery.Tag = Replace(txtLineAtQuery.Tag, "<ID>", "<IDOld>")
    txtLineAtQuery.Tag = Replace(txtLineAtQuery.Tag, "</ID>", "</IDOld>")
  End If
  Dim pars As New NamedValues
  Dim res As NamedValues
  If (txtLineAtQuery.Tag = "") Then
    ' call MsgBox("Нет данных для запроса")
  Else
    Call pars.Add("filter", ("WHERE A.ORDER_ID=" & Item.Application.Manager.GetIDFromXMLField(Item.Application.ITTOUT_DEF.Item(1).ShipOrder)))
    txtLineAtQuery.Tag = AddSQLRefIds(txtLineAtQuery.Tag, "QRY_NUM", txtQRY_NUM.Tag)
    txtLineAtQuery.Tag = AddSQLRefIds(txtLineAtQuery.Tag, "good_ID", txtgood_ID.Tag)
    txtLineAtQuery.Tag = Replace(txtLineAtQuery.Tag, "%ID%", " 1=1 ")
    Call pars.Add("xml", txtLineAtQuery.Tag)
  End If
  Set res = Item.Application.Manager.GetSQLDataDialog(pars)
  If (Not res Is Nothing) Then
    Dim resStr As String
    resStr = res.Item("RESULT").Value
    If (resStr = "OK") Then
      txtLineAtQuery.Tag = res.Item("xml").Value
      If (txtLineAtQuery.Text <> res.Item("brief").Value) Then
        txtLineAtQuery.Text = res.Item("brief").Value
        mIDLineAtQuery = res.Item("ID").Value
        Call txtLineAtQuery_Change
      End If
    Else
      Dim errStr As String
      errStr = res.Item("ErrorDescription").Value
      If (errStr <> vbNullString) Then
       Call MsgBox("Ошибка исполнения: " & errStr, vbOKOnly + vbCritical)
     End If
    End If
  End If
End Sub
Private Sub txtQRY_NUM_Change()
  If Not (OnInit) Then
If (txtQRY_NUM.Text = "") Then
  ' Убрать Brief и ID
  If (txtQRY_NUM.Tag <> "") Then
    Dim XMLDoc As New DOMDocument
    Call XMLDoc.loadXML(txtQRY_NUM.Tag)
    Dim Node As MSXML2.IXMLDOMNode
    For Each Node In XMLDoc.childNodes.Item(0).childNodes
     If (Node.baseName = "ID") Then
       Node.Text = ""
     End If
     If (Node.baseName = "Brief") Then
       Node.Text = ""
     End If
    Next
    txtQRY_NUM.Tag = XMLDoc.xml
  End If
End If
If (Not OnInit Or True) Then ' Пока не понял - надо ли всегда или нет
    If (InStr(txtLineAtQuery.Tag, "%QRY_NUMID%") > 0) Then
    'Call cmdLineAtQuery_Click()
    End If
    End If
If (Not OnInit Or True) Then ' Пока не понял - надо ли всегда или нет
    Call cmdgood_ID_Click
    End If
  Changing

  End If
End Sub
Private Sub cmdQRY_NUM_Click()
  On Error Resume Next
  If (Not OnInit) Then
    Dim iFrom As Long
    Dim iTo As Long
    iFrom = InStr(1, txtQRY_NUM.Tag, "<ID>")
    If (iFrom > 0) Then
      iTo = InStr(iFrom, txtQRY_NUM.Tag, "</ID>")
      mIDQRY_NUM = Mid(txtQRY_NUM.Tag, iFrom + 4, iTo - iFrom - 5)
    End If
    Dim MTZShell As Object
    Set MTZShell = Item.Application.Manager.GetCustomObjects("MTZShell")
    If (Not MTZShell Is Nothing) Then
      err.Clear
      Dim Processed As Variant
      Processed = False
      Call MTZShell.FireEvent("QRY_NUM;" & mIDQRY_NUM, Processed)
      If (err.Number = 0 And Processed <> vbNullString And Processed <> False) Then
        Exit Sub
      End If
    End If
    txtQRY_NUM.Tag = Replace(txtQRY_NUM.Tag, "<ID>", "<IDOld>")
    txtQRY_NUM.Tag = Replace(txtQRY_NUM.Tag, "</ID>", "</IDOld>")
  End If
  Dim pars As New NamedValues
  Dim res As NamedValues
  If (txtQRY_NUM.Tag = "") Then
    ' call MsgBox("Нет данных для запроса")
  Else
    Call pars.Add("permanent", "true")
    txtQRY_NUM.Tag = AddSQLRefIds(txtQRY_NUM.Tag, "LineAtQuery", txtLineAtQuery.Tag)
    txtQRY_NUM.Tag = AddSQLRefIds(txtQRY_NUM.Tag, "good_ID", txtgood_ID.Tag)
    txtQRY_NUM.Tag = Replace(txtQRY_NUM.Tag, "%ID%", " 1=1 ")
    Call pars.Add("xml", txtQRY_NUM.Tag)
  End If
  Set res = Item.Application.Manager.GetSQLDataDialog(pars)
  If (Not res Is Nothing) Then
    Dim resStr As String
    resStr = res.Item("RESULT").Value
    If (resStr = "OK") Then
      txtQRY_NUM.Tag = res.Item("xml").Value
      If (txtQRY_NUM.Text <> res.Item("brief").Value) Then
        txtQRY_NUM.Text = res.Item("brief").Value
        mIDQRY_NUM = res.Item("ID").Value
        Call txtQRY_NUM_Change
      End If
    Else
      Dim errStr As String
      errStr = res.Item("ErrorDescription").Value
      If (errStr <> vbNullString) Then
       Call MsgBox("Ошибка исполнения: " & errStr, vbOKOnly + vbCritical)
     End If
    End If
  End If
End Sub
Private Sub txtCurValue_Validate(cancel As Boolean)
If txtCurValue.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtCurValue.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtCurValue.SetFocus
  ElseIf Val(txtCurValue.Text) < -922337203685478# Or Val(txtCurValue.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtCurValue.SetFocus
  End If
End If
End Sub
Private Sub txtCurValue_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtCurValue_Change()
  Changing

End Sub
Private Sub txtarticul_Change()
  Changing

End Sub
Private Sub txtedizm_Change()
  Changing

End Sub
Private Sub txtmade_country_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdmade_country_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_COUNTRY", ID, brief, , , "ITTD_COUNTRY_TheSupplier like '%" & Item.Application.ITTOUT_DEF.Item(1).Supplier & "%'") Then
          txtmade_country.Tag = Left(ID, 38)
          txtmade_country = brief
        End If
End Sub
Private Sub cmdmade_country_MenuClick(ByVal sCaption As String)
          txtmade_country.Tag = ""
          txtmade_country = ""
End Sub
Private Sub txtFactory_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFactory_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_FACTORY", ID, brief, , , "ITTD_FACTORY_Country_ID='" & txtmade_country.Tag & "'") Then
          txtFactory.Tag = Left(ID, 38)
          txtFactory = brief
        End If
End Sub
Private Sub cmdFactory_MenuClick(ByVal sCaption As String)
          txtFactory.Tag = ""
          txtFactory = ""
End Sub
Private Sub txtKILL_NUMBER_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdKILL_NUMBER_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_KILLPLACE", ID, brief, , , "ITTD_KILLPLACE_Factory_ID='" & txtFactory.Tag & "'") Then
          txtKILL_NUMBER.Tag = Left(ID, 38)
          txtKILL_NUMBER = brief
        End If
End Sub
Private Sub cmdKILL_NUMBER_MenuClick(ByVal sCaption As String)
          txtKILL_NUMBER.Tag = ""
          txtKILL_NUMBER = ""
End Sub
Private Sub txtVidOtruba_Change()
  Changing

End Sub
Private Sub txtPartRef_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPartRef_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("ITTD_PART", ID, brief) Then
          txtPartRef.Tag = Left(ID, 38)
          txtPartRef = brief
        End If
End Sub
Private Sub cmdPartRef_MenuClick(ByVal sCaption As String)
          txtPartRef.Tag = ""
          txtPartRef = ""
End Sub
Private Sub dtpMade_date_Change()
  Changing

End Sub
Private Sub dtpmade_date_to_Change()
  Changing

End Sub
Private Sub txtvetsved_Change()
  Changing

End Sub
Private Sub txtPackageWeight_Validate(cancel As Boolean)
If txtPackageWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPackageWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPackageWeight.SetFocus
  ElseIf Val(txtPackageWeight.Text) < -922337203685478# Or Val(txtPackageWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPackageWeight.SetFocus
  End If
End If
End Sub
Private Sub txtPackageWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPackageWeight_Change()
  Changing

End Sub
Private Sub dtpexp_date_Change()
  Changing

End Sub
Private Sub txtQuanity_Validate(cancel As Boolean)
If txtQuanity.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQuanity.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQuanity.SetFocus
  ElseIf Val(txtQuanity.Text) <> CLng(Val(txtQuanity.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtQuanity.SetFocus
  End If
End If
End Sub
Private Sub txtQuanity_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQuanity_Change()
  Changing

End Sub
Private Sub txtFullPackageWeight_Validate(cancel As Boolean)
If txtFullPackageWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtFullPackageWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtFullPackageWeight.SetFocus
  ElseIf Val(txtFullPackageWeight.Text) < -922337203685478# Or Val(txtFullPackageWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtFullPackageWeight.SetFocus
  End If
End If
End Sub
Private Sub txtFullPackageWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtFullPackageWeight_Change()
  Changing

End Sub
Private Sub txtNumInBufZone_Change()
  Changing

End Sub
Private Sub txtgood_ID_Change()
  If Not (OnInit) Then
If (txtgood_ID.Text = "") Then
  ' Убрать Brief и ID
  If (txtgood_ID.Tag <> "") Then
    Dim XMLDoc As New DOMDocument
    Call XMLDoc.loadXML(txtgood_ID.Tag)
    Dim Node As MSXML2.IXMLDOMNode
    For Each Node In XMLDoc.childNodes.Item(0).childNodes
     If (Node.baseName = "ID") Then
       Node.Text = ""
     End If
     If (Node.baseName = "Brief") Then
       Node.Text = ""
     End If
    Next
    txtgood_ID.Tag = XMLDoc.xml
  End If
End If
If (Not OnInit Or True) Then ' Пока не понял - надо ли всегда или нет
    If (InStr(txtLineAtQuery.Tag, "%good_IDID%") > 0) Then
    'Call cmdLineAtQuery_Click()
    End If
    End If
If (Not OnInit Or True) Then ' Пока не понял - надо ли всегда или нет
    Call cmdQRY_NUM_Click
    End If
  Changing

  End If
End Sub
Private Sub cmdgood_ID_Click()
  On Error Resume Next
  If (Not OnInit) Then
    Dim iFrom As Long
    Dim iTo As Long
    iFrom = InStr(1, txtgood_ID.Tag, "<ID>")
    If (iFrom > 0) Then
      iTo = InStr(iFrom, txtgood_ID.Tag, "</ID>")
      mIDgood_ID = Mid(txtgood_ID.Tag, iFrom + 4, iTo - iFrom - 5)
    End If
    Dim MTZShell As Object
    Set MTZShell = Item.Application.Manager.GetCustomObjects("MTZShell")
    If (Not MTZShell Is Nothing) Then
      err.Clear
      Dim Processed As Variant
      Processed = False
      Call MTZShell.FireEvent("good_ID;" & mIDgood_ID, Processed)
      If (err.Number = 0 And Processed <> vbNullString And Processed <> False) Then
        Exit Sub
      End If
    End If
    txtgood_ID.Tag = Replace(txtgood_ID.Tag, "<ID>", "<IDOld>")
    txtgood_ID.Tag = Replace(txtgood_ID.Tag, "</ID>", "</IDOld>")
  End If
  Dim pars As New NamedValues
  Dim res As NamedValues
  If (txtgood_ID.Tag = "") Then
    ' call MsgBox("Нет данных для запроса")
  Else
    Call pars.Add("permanent", "true")
    txtgood_ID.Tag = AddSQLRefIds(txtgood_ID.Tag, "LineAtQuery", txtLineAtQuery.Tag)
    txtgood_ID.Tag = AddSQLRefIds(txtgood_ID.Tag, "QRY_NUM", txtQRY_NUM.Tag)
    txtgood_ID.Tag = Replace(txtgood_ID.Tag, "%ID%", " 1=1 ")
    Call pars.Add("xml", txtgood_ID.Tag)
  End If
  Set res = Item.Application.Manager.GetSQLDataDialog(pars)
  If (Not res Is Nothing) Then
    Dim resStr As String
    resStr = res.Item("RESULT").Value
    If (resStr = "OK") Then
      txtgood_ID.Tag = res.Item("xml").Value
      If (txtgood_ID.Text <> res.Item("brief").Value) Then
        txtgood_ID.Text = res.Item("brief").Value
        mIDgood_ID = res.Item("ID").Value
        Call txtgood_ID_Change
      End If
    Else
      Dim errStr As String
      errStr = res.Item("ErrorDescription").Value
      If (errStr <> vbNullString) Then
       Call MsgBox("Ошибка исполнения: " & errStr, vbOKOnly + vbCritical)
     End If
    End If
  End If
End Sub
Private Sub cmbNavalom_Click()
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

txtsequence = Item.sequence
txtLineAtQuery.Text = ""
txtLineAtQuery.Tag = ""
mIDLineAtQuery = ""
' Разобрать XML
Dim XMLDocLineAtQuery As New DOMDocument
On Error Resume Next
If (Item.LineAtQuery <> "") Then
  Call XMLDocLineAtQuery.loadXML(Item.LineAtQuery)
  If (err.Number = 0 And XMLDocLineAtQuery.parseError.errorCode = 0) Then
    Dim nodeLineAtQuery As MSXML2.IXMLDOMNode
    txtLineAtQuery.Tag = Item.LineAtQuery
    For Each nodeLineAtQuery In XMLDocLineAtQuery.childNodes.Item(0).childNodes
      If (nodeLineAtQuery.baseName = "Brief") Then
       txtLineAtQuery.Text = nodeLineAtQuery.Text
       Exit For
      End If
    Next
  Else
    ' Попытка подобрать по ID
    Dim newIDLineAtQuery As String
    newIDLineAtQuery = Item.LineAtQuery
    Dim XMLLineAtQueryID As String
    XMLLineAtQueryID = "<SQLData>"
    XMLLineAtQueryID = XMLLineAtQueryID & "<connectionstring>ref</connectionstring>"
    XMLLineAtQueryID = XMLLineAtQueryID & "<connectionprovider>ref</connectionprovider>"
    XMLLineAtQueryID = XMLLineAtQueryID & "<query>select A.ID [Код], A.ORDER_ID [Код заказа], A.QTY_ORD [Количество] , B.DESCRIPTION [Название] from shipping_line A join item B on A.item_id =B.id </query>"
    XMLLineAtQueryID = XMLLineAtQueryID & "<IDFieldName>Код</IDFieldName>"
    XMLLineAtQueryID = XMLLineAtQueryID & "<ID>" & newIDLineAtQuery & "</ID>"
    XMLLineAtQueryID = XMLLineAtQueryID & "<BriefFields>Название</BriefFields>"
    XMLLineAtQueryID = XMLLineAtQueryID & "<QRY_NUMID>" & mIDQRY_NUM & "</QRY_NUMID>"
    XMLLineAtQueryID = XMLLineAtQueryID & "<good_IDID>" & mIDgood_ID & "</good_IDID>"
    XMLLineAtQueryID = XMLLineAtQueryID & "</SQLData>"
    Dim parsLineAtQuery As New NamedValues
    Dim resLineAtQuery As NamedValues
    Call parsLineAtQuery.Add("xml", XMLLineAtQueryID)
    Set resLineAtQuery = Item.Application.Manager.GetSQLDataDialog(parsLineAtQuery)
    If (Not resLineAtQuery Is Nothing) Then
      Dim resStrLineAtQuery As String
      resStrLineAtQuery = resLineAtQuery.Item("RESULT").Value
      If (resStrLineAtQuery = "OK") Then
        txtLineAtQuery.Tag = Replace(resLineAtQuery.Item("xml").Value, "%ID%", " 1=1 ")
        If (txtLineAtQuery.Text <> resLineAtQuery.Item("brief").Value) Then
          mIDLineAtQuery = newIDLineAtQuery
          txtLineAtQuery.Text = resLineAtQuery.Item("brief").Value
        End If
      End If
    Else
      Item.LineAtQuery = vbNullString
    End If
  End If
Else
  Dim XMLLineAtQuery As String
  XMLLineAtQuery = "<SQLData>"
  XMLLineAtQuery = XMLLineAtQuery & "<connectionstring>ref</connectionstring>"
  XMLLineAtQuery = XMLLineAtQuery & "<connectionprovider>ref</connectionprovider>"
  XMLLineAtQuery = XMLLineAtQuery & "<query>select A.ID [Код], A.ORDER_ID [Код заказа], A.QTY_ORD [Количество] , B.DESCRIPTION [Название] from shipping_line A join item B on A.item_id =B.id </query>"
  XMLLineAtQuery = XMLLineAtQuery & "<IDFieldName>Код</IDFieldName>"
  XMLLineAtQuery = XMLLineAtQuery & "<BriefFields>Название</BriefFields>"
    XMLLineAtQuery = XMLLineAtQuery & "<QRY_NUMID>" & mIDQRY_NUM & "</QRY_NUMID>"
    XMLLineAtQuery = XMLLineAtQuery & "<good_IDID>" & mIDgood_ID & "</good_IDID>"
  XMLLineAtQuery = XMLLineAtQuery & "</SQLData>"
  txtLineAtQuery.Tag = XMLLineAtQuery
End If
On Error GoTo 0
 LoadBtnPictures cmdLineAtQuery, cmdLineAtQuery.Tag
  cmdLineAtQuery.RemoveAllMenu
  cmdLineAtQuery.AddMenu "Очистить"
txtQRY_NUM.Text = ""
txtQRY_NUM.Tag = ""
mIDQRY_NUM = ""
' Разобрать XML
Dim XMLDocQRY_NUM As New DOMDocument
On Error Resume Next
If (Item.QRY_NUM <> "") Then
  Call XMLDocQRY_NUM.loadXML(Item.QRY_NUM)
  If (err.Number = 0 And XMLDocQRY_NUM.parseError.errorCode = 0) Then
    Dim nodeQRY_NUM As MSXML2.IXMLDOMNode
    txtQRY_NUM.Tag = Item.QRY_NUM
    For Each nodeQRY_NUM In XMLDocQRY_NUM.childNodes.Item(0).childNodes
      If (nodeQRY_NUM.baseName = "Brief") Then
       txtQRY_NUM.Text = nodeQRY_NUM.Text
       Exit For
      End If
    Next
  Else
    ' Попытка подобрать по ID
    Dim newIDQRY_NUM As String
    newIDQRY_NUM = Item.QRY_NUM
    Dim XMLQRY_NUMID As String
    XMLQRY_NUMID = "<SQLData>"
    XMLQRY_NUMID = XMLQRY_NUMID & "<connectionstring>ref</connectionstring>"
    XMLQRY_NUMID = XMLQRY_NUMID & "<connectionprovider>ref</connectionprovider>"
    XMLQRY_NUMID = XMLQRY_NUMID & "<query>select  QTY_ORD from shipping_line where ID='%LineAtQueryID%'</query>"
    XMLQRY_NUMID = XMLQRY_NUMID & "<IDFieldName>QTY_ORD</IDFieldName>"
    XMLQRY_NUMID = XMLQRY_NUMID & "<ID>" & newIDQRY_NUM & "</ID>"
    XMLQRY_NUMID = XMLQRY_NUMID & "<BriefFields>QTY_ORD</BriefFields>"
    XMLQRY_NUMID = XMLQRY_NUMID & "<LineAtQueryID>" & mIDLineAtQuery & "</LineAtQueryID>"
    XMLQRY_NUMID = XMLQRY_NUMID & "<good_IDID>" & mIDgood_ID & "</good_IDID>"
    XMLQRY_NUMID = XMLQRY_NUMID & "</SQLData>"
    Dim parsQRY_NUM As New NamedValues
    Dim resQRY_NUM As NamedValues
    Call parsQRY_NUM.Add("xml", XMLQRY_NUMID)
    Set resQRY_NUM = Item.Application.Manager.GetSQLDataDialog(parsQRY_NUM)
    If (Not resQRY_NUM Is Nothing) Then
      Dim resStrQRY_NUM As String
      resStrQRY_NUM = resQRY_NUM.Item("RESULT").Value
      If (resStrQRY_NUM = "OK") Then
        txtQRY_NUM.Tag = Replace(resQRY_NUM.Item("xml").Value, "%ID%", " 1=1 ")
        If (txtQRY_NUM.Text <> resQRY_NUM.Item("brief").Value) Then
          mIDQRY_NUM = newIDQRY_NUM
          txtQRY_NUM.Text = resQRY_NUM.Item("brief").Value
        End If
      End If
    Else
      Item.QRY_NUM = vbNullString
    End If
  End If
Else
  Dim XMLQRY_NUM As String
  XMLQRY_NUM = "<SQLData>"
  XMLQRY_NUM = XMLQRY_NUM & "<connectionstring>ref</connectionstring>"
  XMLQRY_NUM = XMLQRY_NUM & "<connectionprovider>ref</connectionprovider>"
  XMLQRY_NUM = XMLQRY_NUM & "<query>select  QTY_ORD from shipping_line where ID='%LineAtQueryID%'</query>"
  XMLQRY_NUM = XMLQRY_NUM & "<IDFieldName>QTY_ORD</IDFieldName>"
  XMLQRY_NUM = XMLQRY_NUM & "<BriefFields>QTY_ORD</BriefFields>"
    XMLQRY_NUM = XMLQRY_NUM & "<LineAtQueryID>" & mIDLineAtQuery & "</LineAtQueryID>"
    XMLQRY_NUM = XMLQRY_NUM & "<good_IDID>" & mIDgood_ID & "</good_IDID>"
  XMLQRY_NUM = XMLQRY_NUM & "</SQLData>"
  txtQRY_NUM.Tag = XMLQRY_NUM
  Call cmdQRY_NUM_Click
End If
On Error GoTo 0
 LoadBtnPictures cmdQRY_NUM, cmdQRY_NUM.Tag
  cmdQRY_NUM.RemoveAllMenu
  cmdQRY_NUM.Visible = False
txtCurValue = Item.CurValue
  On Error Resume Next
txtarticul = Item.articul
  On Error Resume Next
txtedizm = Item.edizm
If Not Item.made_country Is Nothing Then
  txtmade_country.Tag = Item.made_country.ID
  txtmade_country = Item.made_country.brief
Else
  txtmade_country.Tag = ""
  txtmade_country = ""
End If
 LoadBtnPictures cmdmade_country, cmdmade_country.Tag
  cmdmade_country.RemoveAllMenu
  cmdmade_country.AddMenu "Очистить"
If Not Item.Factory Is Nothing Then
  txtFactory.Tag = Item.Factory.ID
  txtFactory = Item.Factory.brief
Else
  txtFactory.Tag = ""
  txtFactory = ""
End If
 LoadBtnPictures cmdFactory, cmdFactory.Tag
  cmdFactory.RemoveAllMenu
  cmdFactory.AddMenu "Очистить"
If Not Item.KILL_NUMBER Is Nothing Then
  txtKILL_NUMBER.Tag = Item.KILL_NUMBER.ID
  txtKILL_NUMBER = Item.KILL_NUMBER.brief
Else
  txtKILL_NUMBER.Tag = ""
  txtKILL_NUMBER = ""
End If
 LoadBtnPictures cmdKILL_NUMBER, cmdKILL_NUMBER.Tag
  cmdKILL_NUMBER.RemoveAllMenu
  cmdKILL_NUMBER.AddMenu "Очистить"
  On Error Resume Next
txtVidOtruba = Item.VidOtruba
If Not Item.PartRef Is Nothing Then
  txtPartRef.Tag = Item.PartRef.ID
  txtPartRef = Item.PartRef.brief
Else
  txtPartRef.Tag = ""
  txtPartRef = ""
End If
 LoadBtnPictures cmdPartRef, cmdPartRef.Tag
  cmdPartRef.RemoveAllMenu
  cmdPartRef.AddMenu "Очистить"
dtpMade_date = Date
If Item.Made_date <> 0 Then
 dtpMade_date = Item.Made_date
Else
 dtpMade_date.Value = Null
End If
dtpmade_date_to = Date
If Item.made_date_to <> 0 Then
 dtpmade_date_to = Item.made_date_to
Else
 dtpmade_date_to.Value = Null
End If
  On Error Resume Next
txtvetsved = Item.vetsved
txtPackageWeight = Item.PackageWeight
dtpexp_date = Date
If Item.exp_date <> 0 Then
 dtpexp_date = Item.exp_date
Else
 dtpexp_date.Value = Null
End If
txtQuanity = Item.Quanity
txtFullPackageWeight = Item.FullPackageWeight
  On Error Resume Next
txtNumInBufZone = Item.NumInBufZone
txtgood_ID.Text = ""
txtgood_ID.Tag = ""
mIDgood_ID = ""
' Разобрать XML
Dim XMLDocgood_ID As New DOMDocument
On Error Resume Next
If (Item.good_ID <> "") Then
  Call XMLDocgood_ID.loadXML(Item.good_ID)
  If (err.Number = 0 And XMLDocgood_ID.parseError.errorCode = 0) Then
    Dim nodegood_ID As MSXML2.IXMLDOMNode
    txtgood_ID.Tag = Item.good_ID
    For Each nodegood_ID In XMLDocgood_ID.childNodes.Item(0).childNodes
      If (nodegood_ID.baseName = "Brief") Then
       txtgood_ID.Text = nodegood_ID.Text
       Exit For
      End If
    Next
  Else
    ' Попытка подобрать по ID
    Dim newIDgood_ID As String
    newIDgood_ID = Item.good_ID
    Dim XMLgood_IDID As String
    XMLgood_IDID = "<SQLData>"
    XMLgood_IDID = XMLgood_IDID & "<connectionstring>ref</connectionstring>"
    XMLgood_IDID = XMLgood_IDID & "<connectionprovider>ref</connectionprovider>"
    XMLgood_IDID = XMLgood_IDID & "<query>select  item_id from shipping_line where ID='%LineAtQueryID%'</query>"
    XMLgood_IDID = XMLgood_IDID & "<IDFieldName>item_id</IDFieldName>"
    XMLgood_IDID = XMLgood_IDID & "<ID>" & newIDgood_ID & "</ID>"
    XMLgood_IDID = XMLgood_IDID & "<BriefFields>item_id</BriefFields>"
    XMLgood_IDID = XMLgood_IDID & "<LineAtQueryID>" & mIDLineAtQuery & "</LineAtQueryID>"
    XMLgood_IDID = XMLgood_IDID & "<QRY_NUMID>" & mIDQRY_NUM & "</QRY_NUMID>"
    XMLgood_IDID = XMLgood_IDID & "</SQLData>"
    Dim parsgood_ID As New NamedValues
    Dim resgood_ID As NamedValues
    Call parsgood_ID.Add("xml", XMLgood_IDID)
    Set resgood_ID = Item.Application.Manager.GetSQLDataDialog(parsgood_ID)
    If (Not resgood_ID Is Nothing) Then
      Dim resStrgood_ID As String
      resStrgood_ID = resgood_ID.Item("RESULT").Value
      If (resStrgood_ID = "OK") Then
        txtgood_ID.Tag = Replace(resgood_ID.Item("xml").Value, "%ID%", " 1=1 ")
        If (txtgood_ID.Text <> resgood_ID.Item("brief").Value) Then
          mIDgood_ID = newIDgood_ID
          txtgood_ID.Text = resgood_ID.Item("brief").Value
        End If
      End If
    Else
      Item.good_ID = vbNullString
    End If
  End If
Else
  Dim XMLgood_ID As String
  XMLgood_ID = "<SQLData>"
  XMLgood_ID = XMLgood_ID & "<connectionstring>ref</connectionstring>"
  XMLgood_ID = XMLgood_ID & "<connectionprovider>ref</connectionprovider>"
  XMLgood_ID = XMLgood_ID & "<query>select  item_id from shipping_line where ID='%LineAtQueryID%'</query>"
  XMLgood_ID = XMLgood_ID & "<IDFieldName>item_id</IDFieldName>"
  XMLgood_ID = XMLgood_ID & "<BriefFields>item_id</BriefFields>"
    XMLgood_ID = XMLgood_ID & "<LineAtQueryID>" & mIDLineAtQuery & "</LineAtQueryID>"
    XMLgood_ID = XMLgood_ID & "<QRY_NUMID>" & mIDQRY_NUM & "</QRY_NUMID>"
  XMLgood_ID = XMLgood_ID & "</SQLData>"
  txtgood_ID.Tag = XMLgood_ID
  Call cmdgood_ID_Click
End If
On Error GoTo 0
 LoadBtnPictures cmdgood_ID, cmdgood_ID.Tag
  cmdgood_ID.RemoveAllMenu
  cmdgood_ID.Visible = False
cmbNavalom.Clear
cmbNavalom.AddItem "Да"
cmbNavalom.ItemData(cmbNavalom.NewIndex) = -1
cmbNavalom.AddItem "Нет"
cmbNavalom.ItemData(cmbNavalom.NewIndex) = 0
 For iii = 0 To cmbNavalom.ListCount - 1
  If Item.Navalom = cmbNavalom.ItemData(iii) Then
   cmbNavalom.ListIndex = iii
   Exit For
  End If
 Next
' Добавим значения ID ко всем SQLReference
txtQRY_NUM.Tag = AddSQLRefIds(txtQRY_NUM.Tag, "LineAtQuery", txtLineAtQuery.Tag)
txtgood_ID.Tag = AddSQLRefIds(txtgood_ID.Tag, "LineAtQuery", txtLineAtQuery.Tag)
txtLineAtQuery.Tag = AddSQLRefIds(txtLineAtQuery.Tag, "QRY_NUM", txtQRY_NUM.Tag)
txtgood_ID.Tag = AddSQLRefIds(txtgood_ID.Tag, "QRY_NUM", txtQRY_NUM.Tag)
txtLineAtQuery.Tag = AddSQLRefIds(txtLineAtQuery.Tag, "good_ID", txtgood_ID.Tag)
txtQRY_NUM.Tag = AddSQLRefIds(txtQRY_NUM.Tag, "good_ID", txtgood_ID.Tag)
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

Item.sequence = CDbl(txtsequence)
Item.LineAtQuery = txtLineAtQuery.Tag
Item.QRY_NUM = txtQRY_NUM.Tag
Item.CurValue = CDbl(txtCurValue)
Item.articul = txtarticul
Item.edizm = txtedizm
If txtmade_country.Tag <> "" Then
  Set Item.made_country = Item.Application.FindRowObject("ITTD_COUNTRY", txtmade_country.Tag)
Else
  Set Item.made_country = Nothing
End If
If txtFactory.Tag <> "" Then
  Set Item.Factory = Item.Application.FindRowObject("ITTD_FACTORY", txtFactory.Tag)
Else
  Set Item.Factory = Nothing
End If
If txtKILL_NUMBER.Tag <> "" Then
  Set Item.KILL_NUMBER = Item.Application.FindRowObject("ITTD_KILLPLACE", txtKILL_NUMBER.Tag)
Else
  Set Item.KILL_NUMBER = Nothing
End If
Item.VidOtruba = txtVidOtruba
If txtPartRef.Tag <> "" Then
  Set Item.PartRef = Item.Application.FindRowObject("ITTD_PART", txtPartRef.Tag)
Else
  Set Item.PartRef = Nothing
End If
  If IsNull(dtpMade_date) Then
    Item.Made_date = 0
  Else
    Item.Made_date = dtpMade_date.Value
  End If
  If IsNull(dtpmade_date_to) Then
    Item.made_date_to = 0
  Else
    Item.made_date_to = dtpmade_date_to.Value
  End If
Item.vetsved = txtvetsved
Item.PackageWeight = CDbl(txtPackageWeight)
  If IsNull(dtpexp_date) Then
    Item.exp_date = 0
  Else
    Item.exp_date = dtpexp_date.Value
  End If
Item.Quanity = CDbl(txtQuanity)
Item.FullPackageWeight = CDbl(txtFullPackageWeight)
Item.NumInBufZone = txtNumInBufZone
Item.good_ID = txtgood_ID.Tag
 If cmbNavalom.ListIndex >= 0 Then
   Item.Navalom = cmbNavalom.ItemData(cmbNavalom.ListIndex)
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



