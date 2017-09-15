VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.UserControl Reports 
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
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   19
         ToolTipText     =   "Описание"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtReportView 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   17
         ToolTipText     =   "Базовый запрос"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheReportExt 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "Расширение для создания отчета"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheReportExt 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "Расширение для создания отчета"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.ComboBox cmbReportType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "Тип отчета"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPrepareMethod 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Метод для формирования"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPrepareMethod 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Метод для формирования"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtCaption 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   7
         ToolTipText     =   "Заголовок"
         Top             =   1815
         Width           =   3000
      End
      Begin MSComDlg.CommonDialog Dialog 
         Left            =   300
         Top             =   1335
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MTZ_PANEL.DropButton cmdReportFile 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "fileopen.ico"
         ToolTipText     =   "Файл отчета"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtReportFile 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         Text            =   "Text1"
         ToolTipText     =   "Файл отчета"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.Timer ReportFile 
         Enabled         =   0   'False
         Interval        =   500
         Left            =   100
         Top             =   100
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Описание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblReportView 
         BackStyle       =   0  'Transparent
         Caption         =   "Базовый запрос:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheReportExt 
         BackStyle       =   0  'Transparent
         Caption         =   "Расширение для создания отчета:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblReportType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип отчета:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblPrepareMethod 
         BackStyle       =   0  'Transparent
         Caption         =   "Метод для формирования:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCaption 
         BackStyle       =   0  'Transparent
         Caption         =   "Заголовок:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblReportFile 
         BackStyle       =   0  'Transparent
         Caption         =   "Файл отчета:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "Reports"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Описание
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean
  Private PathReportFile As String
  Private ModReportFile As Date






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

Private Sub txtName_Change()
  Changing

End Sub

Private Sub ReportFile_Timer()
    If PathReportFile <> "" Then
        'Try Lock file
        Dim ff As Integer
        ff = FreeFile
        On Error GoTo EndCheck
        Open PathReportFile For Binary Access Read Lock Read As ff
        Close ff
        'Файл свободен, проверяем блокировку
        Dim fso, f, s
        Set fso = CreateObject("Scripting.FileSystemObject")
        Set f = fso.GetFile(PathReportFile)
        Dim Modifyed As Date
        Modifyed = f.DateLastModified
        ReportFile.Enabled = False
        If ModReportFile <> Modifyed Then
            'Нада обновлять...
            If MsgBox("Файл изменён, обновить?", vbYesNo, "") = vbYes Then

                Item.ReportFile = FileToArray(PathReportFile)
                Item.ReportFile_ext = GetFileExtension2(PathReportFile)
                Call f.Delete(True)
                Changing
            End If
        End If
        Exit Sub
EndCheck:
        'Файл заблокированн! Ждёмс...
    End If
End Sub

Private Sub cmdReportFile_Click()
  On Error Resume Next
  If Item.ReportFile_ext <> "" And Not IsNull(Item.ReportFile) Then
    cmdReportFile_MenuClick "Открыть"
  Else
    cmdReportFile_MenuClick "Выбрать"
  End If
End Sub

Private Sub cmdReportFile_MenuClick(ByVal sCaption As String)
  If sCaption = "Выбрать" Then
   Dialog.Flags = cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNPathMustExist
   Dialog.Filter = "(*.*)|*.*"
   Dialog.DialogTitle = "Файл"
   Dialog.CancelError = True
   On Error Resume Next
   Dialog.ShowOpen
   If (err.Number > 0) Then
    err.Clear
    Exit Sub
   End If
   txtReportFile = Dialog.FileName
   Item.ReportFile = FileToArray(Dialog.FileName)
   Item.ReportFile_ext = GetFileExtension2(Dialog.FileName)
   Changing

  End If
  If sCaption = "Очистить" Then
   txtReportFile = ""
   Item.ReportFile = Null
   Item.ReportFile_ext = ""
   Changing
  End If
  If sCaption = "Открыть" Then
    PathReportFile = DoOpenFile(Item.ReportFile, Item.ReportFile_ext)
    'Get LastModify Date
    Dim fso, f, s
    On Error Resume Next
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.GetFile(PathReportFile)
    ModReportFile = f.DateLastModified
    
    Item.Application.Manager.StoreTempFileData PathReportFile, Item.PartName, Item.ID
    ReportFile.Enabled = True
  End If
  If sCaption = "Сохранить" Then
   Dialog.Flags = cdlOFNHideReadOnly + cdlOFNPathMustExist
   Dialog.Filter = "(*.*)|*.*"
   Dialog.DialogTitle = "Файл"
   Dialog.CancelError = True
   On Error Resume Next
   Dialog.ShowSave
   If (err.Number > 0) Then
    err.Clear
    Exit Sub
   End If
   ArrayToFile Dialog.FileName, Item.ReportFile
  End If
End Sub
Private Sub txtCaption_Change()
  Changing

End Sub
Private Sub txtPrepareMethod_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPrepareMethod_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("SHAREDMETHOD", ID, brief) Then
          txtPrepareMethod.Tag = Left(ID, 38)
          txtPrepareMethod = brief
        End If
End Sub
Private Sub cmdPrepareMethod_MenuClick(ByVal sCaption As String)
          txtPrepareMethod.Tag = ""
          txtPrepareMethod = ""
End Sub
Private Sub cmbReportType_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtTheReportExt_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheReportExt_CLick()
  On Error Resume Next
     If txtTheReportExt.Tag = "" Then
       cmdTheReportExt_MenuClick "Выбрать"
     Else
       cmdTheReportExt_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheReportExt_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheReportExt.Tag = ""
          txtTheReportExt = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheReportExt.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheReportExt.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheReportExt.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "MTZExt")
        If OK Then
          txtTheReportExt.Tag = Left(ID, 38)
          txtTheReportExt = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "MTZExt" & Now
        ook = findObject(Item.Application.Manager, "MTZExt", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtTheReportExt.Tag = ID
              txtTheReportExt = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "MTZExt", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtTheReportExt.Tag = obj.ID
              txtTheReportExt = obj.brief
          Else
              txtTheReportExt.Tag = ""
              txtTheReportExt = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtReportView_Change()
  Changing

End Sub
Private Sub txtTheComment_Change()
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

If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = (cmbReportType.ListIndex >= 0)
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
txtName = Item.Name
 If LenB(Item.ReportFile) > 0 Then
   txtReportFile = "Данные (" & Item.ReportFile_ext & ")"
 Else
   txtReportFile = ""
 End If
 LoadBtnPictures cmdReportFile, cmdReportFile.Tag
 cmdReportFile.RemoveAllMenu
 cmdReportFile.AddMenu "Очистить"
 cmdReportFile.AddMenu "Выбрать"
 cmdReportFile.AddMenu "Сохранить"
 cmdReportFile.AddMenu "Открыть"
  On Error Resume Next
txtCaption = Item.Caption
If Not Item.PrepareMethod Is Nothing Then
  txtPrepareMethod.Tag = Item.PrepareMethod.ID
  txtPrepareMethod = Item.PrepareMethod.brief
Else
  txtPrepareMethod.Tag = ""
  txtPrepareMethod = ""
End If
 LoadBtnPictures cmdPrepareMethod, cmdPrepareMethod.Tag
  cmdPrepareMethod.RemoveAllMenu
  cmdPrepareMethod.AddMenu "Очистить"
cmbReportType.Clear
cmbReportType.AddItem "Двумерная матрица"
cmbReportType.ItemData(cmbReportType.NewIndex) = 1
cmbReportType.AddItem "Таблица"
cmbReportType.ItemData(cmbReportType.NewIndex) = 0
cmbReportType.AddItem "Экспорт по WORD шаблону"
cmbReportType.ItemData(cmbReportType.NewIndex) = 3
cmbReportType.AddItem "Только расчет"
cmbReportType.ItemData(cmbReportType.NewIndex) = 2
cmbReportType.AddItem "Экспорт по Excel шаблону"
cmbReportType.ItemData(cmbReportType.NewIndex) = 4
 For iii = 0 To cmbReportType.ListCount - 1
  If Item.ReportType = cmbReportType.ItemData(iii) Then
   cmbReportType.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.TheReportExt Is Nothing Then
  txtTheReportExt.Tag = Item.TheReportExt.ID
  txtTheReportExt = Item.TheReportExt.brief
Else
  txtTheReportExt.Tag = ""
  txtTheReportExt = ""
End If
 LoadBtnPictures cmdTheReportExt, cmdTheReportExt.Tag
  cmdTheReportExt.RemoveAllMenu
  cmdTheReportExt.AddMenu "Очистить"
  cmdTheReportExt.AddMenu "Создать"
  cmdTheReportExt.AddMenu "Выбрать"
  cmdTheReportExt.AddMenu "Открыть"
  On Error Resume Next
txtReportView = Item.ReportView
txtTheComment = Item.TheComment
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

Item.Name = txtName
 ' SEE cmdReportFile_CLICK
Item.Caption = txtCaption
If txtPrepareMethod.Tag <> "" Then
  Set Item.PrepareMethod = Item.Application.FindRowObject("SHAREDMETHOD", txtPrepareMethod.Tag)
Else
  Set Item.PrepareMethod = Nothing
End If
 If cmbReportType.ListIndex >= 0 Then
   Item.ReportType = cmbReportType.ItemData(cmbReportType.ListIndex)
 End If
If txtTheReportExt.Tag <> "" Then
  Set Item.TheReportExt = Item.Application.Manager.GetInstanceObject(txtTheReportExt.Tag)
Else
  Set Item.TheReportExt = Nothing
End If
Item.ReportView = txtReportView
Item.TheComment = txtTheComment
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



