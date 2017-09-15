VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl MTZ_Inst_Sec_Files 
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
      Begin VB.TextBox txtSEQ 
         Height          =   300
         Left            =   3450
         MaxLength       =   15
         TabIndex        =   38
         ToolTipText     =   "Порядок"
         Top             =   5340
         Width           =   1800
      End
      Begin MTZ_PANEL.DropButton cmdCustomScriptUnInstall 
         Height          =   300
         Left            =   6000
         TabIndex        =   36
         Tag             =   "refopen.ico"
         ToolTipText     =   "Custom Script UnInstall"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustomScriptUnInstall 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   35
         ToolTipText     =   "Custom Script UnInstall"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdCustomScriptInstall 
         Height          =   300
         Left            =   6000
         TabIndex        =   33
         Tag             =   "refopen.ico"
         ToolTipText     =   "Custom Script Install"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustomScriptInstall 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   32
         ToolTipText     =   "Custom Script Install"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.ComboBox cmbIsCustomScript 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   30
         ToolTipText     =   "Пользовательский скрипт (см. поле Файл или каталог)"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtDeinstallComandParam 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   28
         ToolTipText     =   "Ключи деинсталляции"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbHaveToRunDeinst 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   26
         ToolTipText     =   "Запустить при деинсталляции"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtDefaultInterface 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   24
         ToolTipText     =   "Интерфейс по умолчанию"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtShortCutInfo 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   22
         ToolTipText     =   "Комментярий ярлыка"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtShortcutName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   20
         ToolTipText     =   "Имя ярлыка"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsShortcut 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   18
         ToolTipText     =   "Ярлык в меню"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtSubDir 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   16
         ToolTipText     =   "Подкаталог"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheApplication 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "Приложение системы"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheApplication 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "Приложение системы"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdSysstemObject 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Объект системы"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSysstemObject 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Объект системы"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.TextBox txtCommanLineParams 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   8
         ToolTipText     =   "Ключи запуска"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.ComboBox cmbHaveToRun 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "Обязательно запустить"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsCOM 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "Является COM объектом"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtTheSource 
         Height          =   300
         Left            =   300
         MaxLength       =   1024
         TabIndex        =   2
         ToolTipText     =   "Файл или каталог"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblSEQ 
         BackStyle       =   0  'Transparent
         Caption         =   "Порядок:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblCustomScriptUnInstall 
         BackStyle       =   0  'Transparent
         Caption         =   "Custom Script UnInstall:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblCustomScriptInstall 
         BackStyle       =   0  'Transparent
         Caption         =   "Custom Script Install:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblIsCustomScript 
         BackStyle       =   0  'Transparent
         Caption         =   "Пользовательский скрипт (см. поле Файл или каталог):"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblDeinstallComandParam 
         BackStyle       =   0  'Transparent
         Caption         =   "Ключи деинсталляции:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblHaveToRunDeinst 
         BackStyle       =   0  'Transparent
         Caption         =   "Запустить при деинсталляции:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDefaultInterface 
         BackStyle       =   0  'Transparent
         Caption         =   "Интерфейс по умолчанию:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblShortCutInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Комментярий ярлыка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   21
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblShortcutName 
         BackStyle       =   0  'Transparent
         Caption         =   "Имя ярлыка:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblIsShortcut 
         BackStyle       =   0  'Transparent
         Caption         =   "Ярлык в меню:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblSubDir 
         BackStyle       =   0  'Transparent
         Caption         =   "Подкаталог:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheApplication 
         BackStyle       =   0  'Transparent
         Caption         =   "Приложение системы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblSysstemObject 
         BackStyle       =   0  'Transparent
         Caption         =   "Объект системы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblCommanLineParams 
         BackStyle       =   0  'Transparent
         Caption         =   "Ключи запуска:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblHaveToRun 
         BackStyle       =   0  'Transparent
         Caption         =   "Обязательно запустить:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblIsCOM 
         BackStyle       =   0  'Transparent
         Caption         =   "Является COM объектом:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheSource 
         BackStyle       =   0  'Transparent
         Caption         =   "Файл или каталог:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "MTZ_Inst_Sec_Files"
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

Private Sub txtTheSource_Change()
  Changing

End Sub
Private Sub cmbIsCOM_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbHaveToRun_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCommanLineParams_Change()
  Changing

End Sub
Private Sub txtSysstemObject_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSysstemObject_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJECTTYPE", ID, brief) Then
          txtSysstemObject.Tag = Left(ID, 38)
          txtSysstemObject = brief
        End If
End Sub
Private Sub cmdSysstemObject_MenuClick(ByVal sCaption As String)
          txtSysstemObject.Tag = ""
          txtSysstemObject = ""
End Sub
Private Sub txtTheApplication_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheApplication_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MTZAPP", ID, brief) Then
          txtTheApplication.Tag = Left(ID, 38)
          txtTheApplication = brief
        End If
End Sub
Private Sub cmdTheApplication_MenuClick(ByVal sCaption As String)
          txtTheApplication.Tag = ""
          txtTheApplication = ""
End Sub
Private Sub txtSubDir_Change()
  Changing

End Sub
Private Sub cmbIsShortcut_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtShortcutName_Change()
  Changing

End Sub
Private Sub txtShortCutInfo_Change()
  Changing

End Sub
Private Sub txtDefaultInterface_Change()
  Changing

End Sub
Private Sub cmbHaveToRunDeinst_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtDeinstallComandParam_Change()
  Changing

End Sub
Private Sub cmbIsCustomScript_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtCustomScriptInstall_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCustomScriptInstall_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MTZ_Inst_Common", ID, brief) Then
          txtCustomScriptInstall.Tag = Left(ID, 38)
          txtCustomScriptInstall = brief
        End If
End Sub
Private Sub cmdCustomScriptInstall_MenuClick(ByVal sCaption As String)
          txtCustomScriptInstall.Tag = ""
          txtCustomScriptInstall = ""
End Sub
Private Sub txtCustomScriptUnInstall_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdCustomScriptUnInstall_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MTZ_Inst_Common", ID, brief) Then
          txtCustomScriptUnInstall.Tag = Left(ID, 38)
          txtCustomScriptUnInstall = brief
        End If
End Sub
Private Sub cmdCustomScriptUnInstall_MenuClick(ByVal sCaption As String)
          txtCustomScriptUnInstall.Tag = ""
          txtCustomScriptUnInstall = ""
End Sub
Private Sub txtSEQ_Validate(cancel As Boolean)
If txtSEQ.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtSEQ.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtSEQ.SetFocus
  ElseIf Val(txtSEQ.Text) <> CLng(Val(txtSEQ.Text)) Then
     cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
     txtSEQ.SetFocus
  End If
End If
End Sub
Private Sub txtSEQ_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtSEQ_Change()
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

If mIsOK Then mIsOK = (cmbIsCOM.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbHaveToRun.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbHaveToRunDeinst.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbIsCustomScript.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(txtSEQ.Text)
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
txtTheSource = Item.TheSource
cmbIsCOM.Clear
cmbIsCOM.AddItem "Да"
cmbIsCOM.ItemData(cmbIsCOM.NewIndex) = 1
cmbIsCOM.AddItem "Нет"
cmbIsCOM.ItemData(cmbIsCOM.NewIndex) = 0
 For iii = 0 To cmbIsCOM.ListCount - 1
  If Item.IsCOM = cmbIsCOM.ItemData(iii) Then
   cmbIsCOM.ListIndex = iii
   Exit For
  End If
 Next
cmbHaveToRun.Clear
cmbHaveToRun.AddItem "Да"
cmbHaveToRun.ItemData(cmbHaveToRun.NewIndex) = 1
cmbHaveToRun.AddItem "Нет"
cmbHaveToRun.ItemData(cmbHaveToRun.NewIndex) = 0
 For iii = 0 To cmbHaveToRun.ListCount - 1
  If Item.HaveToRun = cmbHaveToRun.ItemData(iii) Then
   cmbHaveToRun.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtCommanLineParams = Item.CommanLineParams
If Not Item.SysstemObject Is Nothing Then
  txtSysstemObject.Tag = Item.SysstemObject.ID
  txtSysstemObject = Item.SysstemObject.brief
Else
  txtSysstemObject.Tag = ""
  txtSysstemObject = ""
End If
 LoadBtnPictures cmdSysstemObject, cmdSysstemObject.Tag
  cmdSysstemObject.RemoveAllMenu
  cmdSysstemObject.AddMenu "Очистить"
If Not Item.TheApplication Is Nothing Then
  txtTheApplication.Tag = Item.TheApplication.ID
  txtTheApplication = Item.TheApplication.brief
Else
  txtTheApplication.Tag = ""
  txtTheApplication = ""
End If
 LoadBtnPictures cmdTheApplication, cmdTheApplication.Tag
  cmdTheApplication.RemoveAllMenu
  cmdTheApplication.AddMenu "Очистить"
  On Error Resume Next
txtSubDir = Item.SubDir
cmbIsShortcut.Clear
cmbIsShortcut.AddItem "Да"
cmbIsShortcut.ItemData(cmbIsShortcut.NewIndex) = 1
cmbIsShortcut.AddItem "Нет"
cmbIsShortcut.ItemData(cmbIsShortcut.NewIndex) = 0
 For iii = 0 To cmbIsShortcut.ListCount - 1
  If Item.IsShortcut = cmbIsShortcut.ItemData(iii) Then
   cmbIsShortcut.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtShortcutName = Item.ShortcutName
  On Error Resume Next
txtShortCutInfo = Item.ShortCutInfo
  On Error Resume Next
txtDefaultInterface = Item.DefaultInterface
cmbHaveToRunDeinst.Clear
cmbHaveToRunDeinst.AddItem "Да"
cmbHaveToRunDeinst.ItemData(cmbHaveToRunDeinst.NewIndex) = 1
cmbHaveToRunDeinst.AddItem "Нет"
cmbHaveToRunDeinst.ItemData(cmbHaveToRunDeinst.NewIndex) = 0
 For iii = 0 To cmbHaveToRunDeinst.ListCount - 1
  If Item.HaveToRunDeinst = cmbHaveToRunDeinst.ItemData(iii) Then
   cmbHaveToRunDeinst.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtDeinstallComandParam = Item.DeinstallComandParam
cmbIsCustomScript.Clear
cmbIsCustomScript.AddItem "Да"
cmbIsCustomScript.ItemData(cmbIsCustomScript.NewIndex) = 1
cmbIsCustomScript.AddItem "Нет"
cmbIsCustomScript.ItemData(cmbIsCustomScript.NewIndex) = 0
 For iii = 0 To cmbIsCustomScript.ListCount - 1
  If Item.IsCustomScript = cmbIsCustomScript.ItemData(iii) Then
   cmbIsCustomScript.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.CustomScriptInstall Is Nothing Then
  txtCustomScriptInstall.Tag = Item.CustomScriptInstall.ID
  txtCustomScriptInstall = Item.CustomScriptInstall.brief
Else
  txtCustomScriptInstall.Tag = ""
  txtCustomScriptInstall = ""
End If
 LoadBtnPictures cmdCustomScriptInstall, cmdCustomScriptInstall.Tag
  cmdCustomScriptInstall.RemoveAllMenu
  cmdCustomScriptInstall.AddMenu "Очистить"
If Not Item.CustomScriptUnInstall Is Nothing Then
  txtCustomScriptUnInstall.Tag = Item.CustomScriptUnInstall.ID
  txtCustomScriptUnInstall = Item.CustomScriptUnInstall.brief
Else
  txtCustomScriptUnInstall.Tag = ""
  txtCustomScriptUnInstall = ""
End If
 LoadBtnPictures cmdCustomScriptUnInstall, cmdCustomScriptUnInstall.Tag
  cmdCustomScriptUnInstall.RemoveAllMenu
  cmdCustomScriptUnInstall.AddMenu "Очистить"
txtSEQ = Item.SEQ
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

Item.TheSource = txtTheSource
 If cmbIsCOM.ListIndex >= 0 Then
   Item.IsCOM = cmbIsCOM.ItemData(cmbIsCOM.ListIndex)
 End If
 If cmbHaveToRun.ListIndex >= 0 Then
   Item.HaveToRun = cmbHaveToRun.ItemData(cmbHaveToRun.ListIndex)
 End If
Item.CommanLineParams = txtCommanLineParams
If txtSysstemObject.Tag <> "" Then
  Set Item.SysstemObject = Item.Application.FindRowObject("OBJECTTYPE", txtSysstemObject.Tag)
Else
  Set Item.SysstemObject = Nothing
End If
If txtTheApplication.Tag <> "" Then
  Set Item.TheApplication = Item.Application.FindRowObject("MTZAPP", txtTheApplication.Tag)
Else
  Set Item.TheApplication = Nothing
End If
Item.SubDir = txtSubDir
 If cmbIsShortcut.ListIndex >= 0 Then
   Item.IsShortcut = cmbIsShortcut.ItemData(cmbIsShortcut.ListIndex)
 End If
Item.ShortcutName = txtShortcutName
Item.ShortCutInfo = txtShortCutInfo
Item.DefaultInterface = txtDefaultInterface
 If cmbHaveToRunDeinst.ListIndex >= 0 Then
   Item.HaveToRunDeinst = cmbHaveToRunDeinst.ItemData(cmbHaveToRunDeinst.ListIndex)
 End If
Item.DeinstallComandParam = txtDeinstallComandParam
 If cmbIsCustomScript.ListIndex >= 0 Then
   Item.IsCustomScript = cmbIsCustomScript.ItemData(cmbIsCustomScript.ListIndex)
 End If
If txtCustomScriptInstall.Tag <> "" Then
  Set Item.CustomScriptInstall = Item.Application.FindRowObject("MTZ_Inst_Common", txtCustomScriptInstall.Tag)
Else
  Set Item.CustomScriptInstall = Nothing
End If
If txtCustomScriptUnInstall.Tag <> "" Then
  Set Item.CustomScriptUnInstall = Item.Application.FindRowObject("MTZ_Inst_Common", txtCustomScriptUnInstall.Tag)
Else
  Set Item.CustomScriptUnInstall = Nothing
End If
Item.SEQ = CDbl(txtSEQ)
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



