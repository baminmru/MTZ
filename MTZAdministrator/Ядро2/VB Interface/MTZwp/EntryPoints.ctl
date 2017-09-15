VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl EntryPoints 
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
      Begin VB.TextBox txtJournalFixedQuery 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   40
         ToolTipText     =   "Ограничения к журналу"
         Top             =   5535
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdObjectType 
         Height          =   300
         Left            =   6000
         TabIndex        =   38
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип документа"
         Top             =   4830
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtObjectType 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   37
         ToolTipText     =   "Тип документа"
         Top             =   4830
         Width           =   2550
      End
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   35
         ToolTipText     =   "Примечание"
         Top             =   3225
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdARM 
         Height          =   300
         Left            =   6000
         TabIndex        =   33
         Tag             =   "refopen.ico"
         ToolTipText     =   "АРМ"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtARM 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   32
         ToolTipText     =   "АРМ"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheExtention 
         Height          =   300
         Left            =   6000
         TabIndex        =   30
         Tag             =   "refopen.ico"
         ToolTipText     =   "Расширение"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheExtention 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   29
         ToolTipText     =   "Расширение"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.TextBox txtIconFile 
         Height          =   300
         Left            =   3450
         MaxLength       =   2000
         TabIndex        =   27
         ToolTipText     =   "Файл картинки"
         Top             =   1110
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMethod 
         Height          =   300
         Left            =   6000
         TabIndex        =   25
         Tag             =   "refopen.ico"
         ToolTipText     =   "Метод"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMethod 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   24
         ToolTipText     =   "Метод"
         Top             =   405
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdDocument 
         Height          =   300
         Left            =   2850
         TabIndex        =   22
         Tag             =   "refopen.ico"
         ToolTipText     =   "Документ"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDocument 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   21
         ToolTipText     =   "Документ"
         Top             =   6045
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdReport 
         Height          =   300
         Left            =   2850
         TabIndex        =   19
         Tag             =   "refopen.ico"
         ToolTipText     =   "Отчет"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtReport 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   18
         ToolTipText     =   "Отчет"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdJournal 
         Height          =   300
         Left            =   2850
         TabIndex        =   16
         Tag             =   "refopen.ico"
         ToolTipText     =   "Журнал"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtJournal 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   15
         ToolTipText     =   "Журнал"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheFilter 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "Фильтр"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheFilter 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "Фильтр"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.ComboBox cmbActionType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   10
         ToolTipText     =   "Вариант действия"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbAsToolbarItem 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         ToolTipText     =   "Включить в тулбар"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtCaption 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "Заголовок"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   38
         TabIndex        =   4
         ToolTipText     =   "Название"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtsequence 
         Height          =   300
         Left            =   300
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "Последовательность"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblJournalFixedQuery 
         BackStyle       =   0  'Transparent
         Caption         =   "Ограничения к журналу:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblObjectType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип документа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblARM 
         BackStyle       =   0  'Transparent
         Caption         =   "АРМ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblTheExtention 
         BackStyle       =   0  'Transparent
         Caption         =   "Расширение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblIconFile 
         BackStyle       =   0  'Transparent
         Caption         =   "Файл картинки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblMethod 
         BackStyle       =   0  'Transparent
         Caption         =   "Метод:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblDocument 
         BackStyle       =   0  'Transparent
         Caption         =   "Документ:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblReport 
         BackStyle       =   0  'Transparent
         Caption         =   "Отчет:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblJournal 
         BackStyle       =   0  'Transparent
         Caption         =   "Журнал:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTheFilter 
         BackStyle       =   0  'Transparent
         Caption         =   "Фильтр:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblActionType 
         BackStyle       =   0  'Transparent
         Caption         =   "Вариант действия:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblAsToolbarItem 
         BackStyle       =   0  'Transparent
         Caption         =   "Включить в тулбар:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCaption 
         BackStyle       =   0  'Transparent
         Caption         =   "Заголовок:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblsequence 
         BackStyle       =   0  'Transparent
         Caption         =   "Последовательность:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "EntryPoints"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела Меню
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

Private Sub txtsequence_Validate(Cancel As Boolean)
If txtsequence.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtsequence.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtsequence.SetFocus
  ElseIf Val(txtsequence.Text) <> CLng(Val(txtsequence.Text)) Then
     Cancel = True
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
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtCaption_Change()
  Changing

End Sub
Private Sub cmbAsToolbarItem_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbActionType_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtTheFilter_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheFilter_CLick()
  On Error Resume Next
     If txtTheFilter.Tag = "" Then
       cmdTheFilter_MenuClick "Выбрать"
     Else
       cmdTheFilter_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheFilter_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheFilter.Tag = ""
          txtTheFilter = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheFilter.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheFilter.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheFilter.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "MTZFltr")
        If OK Then
          txtTheFilter.Tag = Left(ID, 38)
          txtTheFilter = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "MTZFltr" & Now
        ook = findObject(Item.Application.Manager, "MTZFltr", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtTheFilter.Tag = ID
              txtTheFilter = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "MTZFltr", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtTheFilter.Tag = obj.ID
              txtTheFilter = obj.brief
          Else
              txtTheFilter.Tag = ""
              txtTheFilter = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtJournal_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdJournal_CLick()
  On Error Resume Next
     If txtJournal.Tag = "" Then
       cmdJournal_MenuClick "Выбрать"
     Else
       cmdJournal_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdJournal_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtJournal.Tag = ""
          txtJournal = ""
  End If
  If sCaption = "Открыть" Then
    If txtJournal.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtJournal.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtJournal.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "MTZJrnl")
        If OK Then
          txtJournal.Tag = Left(ID, 38)
          txtJournal = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "MTZJrnl" & Now
        ook = findObject(Item.Application.Manager, "MTZJrnl", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtJournal.Tag = ID
              txtJournal = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "MTZJrnl", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtJournal.Tag = obj.ID
              txtJournal = obj.brief
          Else
              txtJournal.Tag = ""
              txtJournal = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtReport_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdReport_CLick()
  On Error Resume Next
     If txtReport.Tag = "" Then
       cmdReport_MenuClick "Выбрать"
     Else
       cmdReport_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdReport_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtReport.Tag = ""
          txtReport = ""
  End If
  If sCaption = "Открыть" Then
    If txtReport.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtReport.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtReport.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "MTZRprt")
        If OK Then
          txtReport.Tag = Left(ID, 38)
          txtReport = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "MTZRprt" & Now
        ook = findObject(Item.Application.Manager, "MTZRprt", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtReport.Tag = ID
              txtReport = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "MTZRprt", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtReport.Tag = obj.ID
              txtReport = obj.brief
          Else
              txtReport.Tag = ""
              txtReport = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtDocument_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDocument_CLick()
  On Error Resume Next
     If txtDocument.Tag = "" Then
       cmdDocument_MenuClick "Выбрать"
     Else
       cmdDocument_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdDocument_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtDocument.Tag = ""
          txtDocument = ""
  End If
  If sCaption = "Открыть" Then
    If txtDocument.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtDocument.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtDocument.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "")
        If OK Then
          txtDocument.Tag = Left(ID, 38)
          txtDocument = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Set obj = Item.Application.Manager.GetNewObject()
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtDocument.Tag = obj.ID
              txtDocument = obj.brief
          Else
              txtDocument.Tag = ""
              txtDocument = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtMethod_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdMethod_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("SHAREDMETHOD", ID, brief) Then
          txtMethod.Tag = Left(ID, 38)
          txtMethod = brief
        End If
End Sub
Private Sub cmdMethod_MenuClick(ByVal sCaption As String)
          txtMethod.Tag = ""
          txtMethod = ""
End Sub
Private Sub txtIconFile_Change()
  Changing

End Sub
Private Sub txtTheExtention_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheExtention_CLick()
  On Error Resume Next
     If txtTheExtention.Tag = "" Then
       cmdTheExtention_MenuClick "Выбрать"
     Else
       cmdTheExtention_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheExtention_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheExtention.Tag = ""
          txtTheExtention = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheExtention.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheExtention.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheExtention.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "MTZExt")
        If OK Then
          txtTheExtention.Tag = Left(ID, 38)
          txtTheExtention = brief
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
              txtTheExtention.Tag = ID
              txtTheExtention = brief
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
              txtTheExtention.Tag = obj.ID
              txtTheExtention = obj.brief
          Else
              txtTheExtention.Tag = ""
              txtTheExtention = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtARM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdARM_CLick()
  On Error Resume Next
     If txtARM.Tag = "" Then
       cmdARM_MenuClick "Выбрать"
     Else
       cmdARM_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdARM_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtARM.Tag = ""
          txtARM = ""
  End If
  If sCaption = "Открыть" Then
    If txtARM.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtARM.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtARM.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "MTZwp")
        If OK Then
          txtARM.Tag = Left(ID, 38)
          txtARM = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "MTZwp" & Now
        ook = findObject(Item.Application.Manager, "MTZwp", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtARM.Tag = ID
              txtARM = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "MTZwp", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtARM.Tag = obj.ID
              txtARM = obj.brief
          Else
              txtARM.Tag = ""
              txtARM = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub txtObjectType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdObjectType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJECTTYPE", ID, brief) Then
          txtObjectType.Tag = Left(ID, 38)
          txtObjectType = brief
        End If
End Sub
Private Sub cmdObjectType_MenuClick(ByVal sCaption As String)
          txtObjectType.Tag = ""
          txtObjectType = ""
End Sub
Private Sub txtJournalFixedQuery_Change()
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

If mIsOK Then mIsOK = IsSet(txtsequence.Text)
If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = IsSet(txtCaption.Text)
If mIsOK Then mIsOK = (cmbAsToolbarItem.ListIndex >= 0)
If mIsOK Then mIsOK = (cmbActionType.ListIndex >= 0)
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
  On Error Resume Next
txtName = Item.Name
  On Error Resume Next
txtCaption = Item.Caption
cmbAsToolbarItem.Clear
cmbAsToolbarItem.AddItem "Да"
cmbAsToolbarItem.ItemData(cmbAsToolbarItem.NewIndex) = -1
cmbAsToolbarItem.AddItem "Нет"
cmbAsToolbarItem.ItemData(cmbAsToolbarItem.NewIndex) = 0
 For iii = 0 To cmbAsToolbarItem.ListCount - 1
  If Item.AsToolbarItem = cmbAsToolbarItem.ItemData(iii) Then
   cmbAsToolbarItem.ListIndex = iii
   Exit For
  End If
 Next
cmbActionType.Clear
cmbActionType.AddItem "Открыть отчет"
cmbActionType.ItemData(cmbActionType.NewIndex) = 5
cmbActionType.AddItem "Ничего не делать"
cmbActionType.ItemData(cmbActionType.NewIndex) = 0
cmbActionType.AddItem "Выполнить метод"
cmbActionType.ItemData(cmbActionType.NewIndex) = 2
cmbActionType.AddItem "Открыть документ"
cmbActionType.ItemData(cmbActionType.NewIndex) = 1
cmbActionType.AddItem "Запустить АРМ"
cmbActionType.ItemData(cmbActionType.NewIndex) = 4
cmbActionType.AddItem "Открыть журнал"
cmbActionType.ItemData(cmbActionType.NewIndex) = 3
 For iii = 0 To cmbActionType.ListCount - 1
  If Item.ActionType = cmbActionType.ItemData(iii) Then
   cmbActionType.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.TheFilter Is Nothing Then
  txtTheFilter.Tag = Item.TheFilter.ID
  txtTheFilter = Item.TheFilter.brief
Else
  txtTheFilter.Tag = ""
  txtTheFilter = ""
End If
 LoadBtnPictures cmdTheFilter, cmdTheFilter.Tag
  cmdTheFilter.RemoveAllMenu
  cmdTheFilter.AddMenu "Очистить"
  cmdTheFilter.AddMenu "Создать"
  cmdTheFilter.AddMenu "Выбрать"
  cmdTheFilter.AddMenu "Открыть"
If Not Item.Journal Is Nothing Then
  txtJournal.Tag = Item.Journal.ID
  txtJournal = Item.Journal.brief
Else
  txtJournal.Tag = ""
  txtJournal = ""
End If
 LoadBtnPictures cmdJournal, cmdJournal.Tag
  cmdJournal.RemoveAllMenu
  cmdJournal.AddMenu "Очистить"
  cmdJournal.AddMenu "Создать"
  cmdJournal.AddMenu "Выбрать"
  cmdJournal.AddMenu "Открыть"
If Not Item.Report Is Nothing Then
  txtReport.Tag = Item.Report.ID
  txtReport = Item.Report.brief
Else
  txtReport.Tag = ""
  txtReport = ""
End If
 LoadBtnPictures cmdReport, cmdReport.Tag
  cmdReport.RemoveAllMenu
  cmdReport.AddMenu "Очистить"
  cmdReport.AddMenu "Создать"
  cmdReport.AddMenu "Выбрать"
  cmdReport.AddMenu "Открыть"
If Not Item.Document Is Nothing Then
  txtDocument.Tag = Item.Document.ID
  txtDocument = Item.Document.brief
Else
  txtDocument.Tag = ""
  txtDocument = ""
End If
 LoadBtnPictures cmdDocument, cmdDocument.Tag
  cmdDocument.RemoveAllMenu
  cmdDocument.AddMenu "Очистить"
  cmdDocument.AddMenu "Создать"
  cmdDocument.AddMenu "Выбрать"
  cmdDocument.AddMenu "Открыть"
If Not Item.Method Is Nothing Then
  txtMethod.Tag = Item.Method.ID
  txtMethod = Item.Method.brief
Else
  txtMethod.Tag = ""
  txtMethod = ""
End If
 LoadBtnPictures cmdMethod, cmdMethod.Tag
  cmdMethod.RemoveAllMenu
  cmdMethod.AddMenu "Очистить"
  On Error Resume Next
txtIconFile = Item.IconFile
If Not Item.TheExtention Is Nothing Then
  txtTheExtention.Tag = Item.TheExtention.ID
  txtTheExtention = Item.TheExtention.brief
Else
  txtTheExtention.Tag = ""
  txtTheExtention = ""
End If
 LoadBtnPictures cmdTheExtention, cmdTheExtention.Tag
  cmdTheExtention.RemoveAllMenu
  cmdTheExtention.AddMenu "Очистить"
  cmdTheExtention.AddMenu "Создать"
  cmdTheExtention.AddMenu "Выбрать"
  cmdTheExtention.AddMenu "Открыть"
If Not Item.ARM Is Nothing Then
  txtARM.Tag = Item.ARM.ID
  txtARM = Item.ARM.brief
Else
  txtARM.Tag = ""
  txtARM = ""
End If
 LoadBtnPictures cmdARM, cmdARM.Tag
  cmdARM.RemoveAllMenu
  cmdARM.AddMenu "Очистить"
  cmdARM.AddMenu "Создать"
  cmdARM.AddMenu "Выбрать"
  cmdARM.AddMenu "Открыть"
txtTheComment = Item.TheComment
If Not Item.ObjectType Is Nothing Then
  txtObjectType.Tag = Item.ObjectType.ID
  txtObjectType = Item.ObjectType.brief
Else
  txtObjectType.Tag = ""
  txtObjectType = ""
End If
 LoadBtnPictures cmdObjectType, cmdObjectType.Tag
  cmdObjectType.RemoveAllMenu
  cmdObjectType.AddMenu "Очистить"
txtJournalFixedQuery = Item.JournalFixedQuery
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

Item.sequence = CDbl(txtsequence)
Item.Name = txtName
Item.Caption = txtCaption
 If cmbAsToolbarItem.ListIndex >= 0 Then
   Item.AsToolbarItem = cmbAsToolbarItem.ItemData(cmbAsToolbarItem.ListIndex)
 End If
 If cmbActionType.ListIndex >= 0 Then
   Item.ActionType = cmbActionType.ItemData(cmbActionType.ListIndex)
 End If
If txtTheFilter.Tag <> "" Then
  Set Item.TheFilter = Item.Application.Manager.GetInstanceObject(txtTheFilter.Tag)
Else
  Set Item.TheFilter = Nothing
End If
If txtJournal.Tag <> "" Then
  Set Item.Journal = Item.Application.Manager.GetInstanceObject(txtJournal.Tag)
Else
  Set Item.Journal = Nothing
End If
If txtReport.Tag <> "" Then
  Set Item.Report = Item.Application.Manager.GetInstanceObject(txtReport.Tag)
Else
  Set Item.Report = Nothing
End If
If txtDocument.Tag <> "" Then
  Set Item.Document = Item.Application.Manager.GetInstanceObject(txtDocument.Tag)
Else
  Set Item.Document = Nothing
End If
If txtMethod.Tag <> "" Then
  Set Item.Method = Item.Application.FindRowObject("SHAREDMETHOD", txtMethod.Tag)
Else
  Set Item.Method = Nothing
End If
Item.IconFile = txtIconFile
If txtTheExtention.Tag <> "" Then
  Set Item.TheExtention = Item.Application.Manager.GetInstanceObject(txtTheExtention.Tag)
Else
  Set Item.TheExtention = Nothing
End If
If txtARM.Tag <> "" Then
  Set Item.ARM = Item.Application.Manager.GetInstanceObject(txtARM.Tag)
Else
  Set Item.ARM = Nothing
End If
Item.TheComment = txtTheComment
If txtObjectType.Tag <> "" Then
  Set Item.ObjectType = Item.Application.FindRowObject("OBJECTTYPE", txtObjectType.Tag)
Else
  Set Item.ObjectType = Nothing
End If
Item.JournalFixedQuery = txtJournalFixedQuery
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



