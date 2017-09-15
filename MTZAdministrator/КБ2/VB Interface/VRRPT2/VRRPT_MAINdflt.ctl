VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl VRRPT_MAINdflt 
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
      Begin MTZ_PANEL.DropButton cmdReportType 
         Height          =   300
         Left            =   6000
         TabIndex        =   27
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип отчета"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtReportType 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   26
         ToolTipText     =   "Тип отчета"
         Top             =   1110
         Width           =   2550
      End
      Begin MSComDlg.CommonDialog Dialog 
         Left            =   3450
         Top             =   630
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MTZ_PANEL.DropButton cmdAttrachment 
         Height          =   300
         Left            =   6000
         TabIndex        =   24
         Tag             =   "fileopen.ico"
         ToolTipText     =   "Вложение"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtAttrachment 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   23
         Text            =   "Text1"
         ToolTipText     =   "Вложение"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Timer Attrachment 
         Enabled         =   0   'False
         Interval        =   500
         Left            =   100
         Top             =   100
      End
      Begin VB.TextBox txtInfo 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   21
         ToolTipText     =   "Информация"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   19
         ToolTipText     =   "Название отчета"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdPerson 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Контактное лицо"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPerson 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Контактное лицо"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdContract 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "Договор"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtContract 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "Договор"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdProject 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Проект"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProject 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Проект"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdClient 
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
      Begin VB.TextBox txtClient 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Клиент"
         Top             =   1815
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpTheDate 
         Height          =   300
         Left            =   300
         TabIndex        =   5
         ToolTipText     =   "Дата отчета"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71827459
         CurrentDate     =   39500
      End
      Begin MTZ_PANEL.DropButton cmdAuthor 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Автор"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtAuthor 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Автор"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblReportType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип отчета:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblAttrachment 
         BackStyle       =   0  'Transparent
         Caption         =   "Вложение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Информация:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название отчета:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblPerson 
         BackStyle       =   0  'Transparent
         Caption         =   "Контактное лицо:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblContract 
         BackStyle       =   0  'Transparent
         Caption         =   "Договор:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblProject 
         BackStyle       =   0  'Transparent
         Caption         =   "Проект:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblClient 
         BackStyle       =   0  'Transparent
         Caption         =   "Клиент:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата отчета:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblAuthor 
         BackStyle       =   0  'Transparent
         Caption         =   "Автор:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "VRRPT_MAINdflt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean
  Private PathAttrachment As String
  Private ModAttrachment As Date





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
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtAuthor_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdAuthor_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", ID, brief) Then
          txtAuthor.Tag = Left(ID, 38)
          txtAuthor = brief
        End If
End Sub
Private Sub cmdAuthor_MenuClick(ByVal sCaption As String)
          txtAuthor.Tag = ""
          txtAuthor = ""
End Sub
Private Sub dtpTheDate_Change()
  Changing

End Sub
Private Sub txtClient_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdClient_CLick()
  On Error Resume Next
     If txtClient.Tag = "" Then
       cmdClient_MenuClick "Выбрать"
     Else
       cmdClient_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdClient_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtClient.Tag = ""
          txtClient = ""
  End If
  If sCaption = "Открыть" Then
    If txtClient.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtClient.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtClient.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2")
        If OK Then
          txtClient.Tag = Left(ID, 38)
          txtClient = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRC2" & Now
        ook = findObject(Item.Application.Manager, "VRC2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtClient.Tag = ID
              txtClient = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRC2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtClient.Tag = obj.ID
              txtClient = obj.brief
          Else
              txtClient.Tag = ""
              txtClient = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtProject_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdProject_CLick()
  On Error Resume Next
     If txtProject.Tag = "" Then
       cmdProject_MenuClick "Выбрать"
     Else
       cmdProject_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdProject_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtProject.Tag = ""
          txtProject = ""
  End If
  If sCaption = "Открыть" Then
    If txtProject.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtProject.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtProject.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "")
        If OK Then
          txtProject.Tag = Left(ID, 38)
          txtProject = brief
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
              txtProject.Tag = obj.ID
              txtProject = obj.brief
          Else
              txtProject.Tag = ""
              txtProject = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtContract_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdContract_CLick()
  On Error Resume Next
     If txtContract.Tag = "" Then
       cmdContract_MenuClick "Выбрать"
     Else
       cmdContract_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdContract_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtContract.Tag = ""
          txtContract = ""
  End If
  If sCaption = "Открыть" Then
    If txtContract.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtContract.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtContract.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRDG2")
        If OK Then
          txtContract.Tag = Left(ID, 38)
          txtContract = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRDG2" & Now
        ook = findObject(Item.Application.Manager, "VRDG2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtContract.Tag = ID
              txtContract = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRDG2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtContract.Tag = obj.ID
              txtContract = obj.brief
          Else
              txtContract.Tag = ""
              txtContract = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtPerson_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPerson_CLick()
  On Error Resume Next
     If txtPerson.Tag = "" Then
       cmdPerson_MenuClick "Выбрать"
     Else
       cmdPerson_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdPerson_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtPerson.Tag = ""
          txtPerson = ""
  End If
  If sCaption = "Открыть" Then
    If txtPerson.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtPerson.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtPerson.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRCP2")
        If OK Then
          txtPerson.Tag = Left(ID, 38)
          txtPerson = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRCP2" & Now
        ook = findObject(Item.Application.Manager, "VRCP2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtPerson.Tag = ID
              txtPerson = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRCP2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtPerson.Tag = obj.ID
              txtPerson = obj.brief
          Else
              txtPerson.Tag = ""
              txtPerson = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtInfo_Change()
  Changing

End Sub

Private Sub Attrachment_Timer()
    If PathAttrachment <> "" Then
        'Try Lock file
        Dim ff As Integer
        ff = FreeFile
        On Error GoTo EndCheck
        Open PathAttrachment For Binary Access Read Lock Read As ff
        Close ff
        'Файл свободен, проверяем блокировку
        Dim fso, f, s
        Set fso = CreateObject("Scripting.FileSystemObject")
        Set f = fso.GetFile(PathAttrachment)
        Dim Modifyed As Date
        Modifyed = f.DateLastModified
        Attrachment.Enabled = False
        If ModAttrachment <> Modifyed Then
            'Нада обновлять...
            If MsgBox("Файл изменён, обновить?", vbYesNo, "") = vbYes Then

                Item.Attrachment = FileToArray(PathAttrachment)
                Item.Attrachment_ext = GetFileExtension2(PathAttrachment)
                Call f.Delete(True)
                Changing
            End If
        End If
        Exit Sub
EndCheck:
        'Файл заблокированн! Ждёмс...
    End If
End Sub

Private Sub cmdAttrachment_Click()
  On Error Resume Next
  If Item.Attrachment_ext <> "" And Not IsNull(Item.Attrachment) Then
    cmdAttrachment_MenuClick "Открыть"
  Else
    cmdAttrachment_MenuClick "Выбрать"
  End If
End Sub

Private Sub cmdAttrachment_MenuClick(ByVal sCaption As String)
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
   txtAttrachment = Dialog.FileName
   Item.Attrachment = FileToArray(Dialog.FileName)
   Item.Attrachment_ext = GetFileExtension2(Dialog.FileName)
   Changing

  End If
  If sCaption = "Очистить" Then
   txtAttrachment = ""
   Item.Attrachment = Null
   Item.Attrachment_ext = ""
   Changing
  End If
  If sCaption = "Открыть" Then
    PathAttrachment = DoOpenFile(Item.Attrachment, Item.Attrachment_ext)
    'Get LastModify Date
    Dim fso, f, s
    On Error Resume Next
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.GetFile(PathAttrachment)
    ModAttrachment = f.DateLastModified
    
    Item.Application.Manager.StoreTempFileData PathAttrachment, Item.PartName, Item.ID
    Attrachment.Enabled = True
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
   ArrayToFile Dialog.FileName, Item.Attrachment
  End If
End Sub
Private Sub txtReportType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdReportType_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("VRDRreportType", ID, brief) Then
          txtReportType.Tag = Left(ID, 38)
          txtReportType = brief
        End If
End Sub
Private Sub cmdReportType_MenuClick(ByVal sCaption As String)
          txtReportType.Tag = ""
          txtReportType = ""
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtAuthor.Tag <> ""
If mIsOK Then mIsOK = IsSet(dtpTheDate.Value)
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

If Not Item.Author Is Nothing Then
  txtAuthor.Tag = Item.Author.ID
  txtAuthor = Item.Author.brief
Else
  txtAuthor.Tag = ""
  txtAuthor = ""
End If
 LoadBtnPictures cmdAuthor, cmdAuthor.Tag
  cmdAuthor.RemoveAllMenu
  cmdAuthor.AddMenu "Очистить"
dtpTheDate = Date
If Item.TheDate <> 0 Then
 dtpTheDate = Item.TheDate
End If
If Not Item.Client Is Nothing Then
  txtClient.Tag = Item.Client.ID
  txtClient = Item.Client.brief
Else
  txtClient.Tag = ""
  txtClient = ""
End If
 LoadBtnPictures cmdClient, cmdClient.Tag
  cmdClient.RemoveAllMenu
  cmdClient.AddMenu "Очистить"
  cmdClient.AddMenu "Создать"
  cmdClient.AddMenu "Выбрать"
  cmdClient.AddMenu "Открыть"
If Not Item.Project Is Nothing Then
  txtProject.Tag = Item.Project.ID
  txtProject = Item.Project.brief
Else
  txtProject.Tag = ""
  txtProject = ""
End If
 LoadBtnPictures cmdProject, cmdProject.Tag
  cmdProject.RemoveAllMenu
  cmdProject.AddMenu "Очистить"
  cmdProject.AddMenu "Создать"
  cmdProject.AddMenu "Выбрать"
  cmdProject.AddMenu "Открыть"
If Not Item.Contract Is Nothing Then
  txtContract.Tag = Item.Contract.ID
  txtContract = Item.Contract.brief
Else
  txtContract.Tag = ""
  txtContract = ""
End If
 LoadBtnPictures cmdContract, cmdContract.Tag
  cmdContract.RemoveAllMenu
  cmdContract.AddMenu "Очистить"
  cmdContract.AddMenu "Создать"
  cmdContract.AddMenu "Выбрать"
  cmdContract.AddMenu "Открыть"
If Not Item.Person Is Nothing Then
  txtPerson.Tag = Item.Person.ID
  txtPerson = Item.Person.brief
Else
  txtPerson.Tag = ""
  txtPerson = ""
End If
 LoadBtnPictures cmdPerson, cmdPerson.Tag
  cmdPerson.RemoveAllMenu
  cmdPerson.AddMenu "Очистить"
  cmdPerson.AddMenu "Создать"
  cmdPerson.AddMenu "Выбрать"
  cmdPerson.AddMenu "Открыть"
  On Error Resume Next
txtName = Item.Name
txtInfo = Item.Info
 If LenB(Item.Attrachment) > 0 Then
   txtAttrachment = "Данные (" & Item.Attrachment_ext & ")"
 Else
   txtAttrachment = ""
 End If
 LoadBtnPictures cmdAttrachment, cmdAttrachment.Tag
 cmdAttrachment.RemoveAllMenu
 cmdAttrachment.AddMenu "Очистить"
 cmdAttrachment.AddMenu "Выбрать"
 cmdAttrachment.AddMenu "Сохранить"
 cmdAttrachment.AddMenu "Открыть"
If Not Item.ReportType Is Nothing Then
  txtReportType.Tag = Item.ReportType.ID
  txtReportType = Item.ReportType.brief
Else
  txtReportType.Tag = ""
  txtReportType = ""
End If
 LoadBtnPictures cmdReportType, cmdReportType.Tag
  cmdReportType.RemoveAllMenu
  cmdReportType.AddMenu "Очистить"
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

If txtAuthor.Tag <> "" Then
  Set Item.Author = Item.Application.FindRowObject("Users", txtAuthor.Tag)
Else
  Set Item.Author = Nothing
End If
  If IsNull(dtpTheDate) Then
    Item.TheDate = 0
  Else
    Item.TheDate = dtpTheDate.Value
  End If
If txtClient.Tag <> "" Then
  Set Item.Client = Item.Application.Manager.GetInstanceObject(txtClient.Tag)
Else
  Set Item.Client = Nothing
End If
If txtProject.Tag <> "" Then
  Set Item.Project = Item.Application.Manager.GetInstanceObject(txtProject.Tag)
Else
  Set Item.Project = Nothing
End If
If txtContract.Tag <> "" Then
  Set Item.Contract = Item.Application.Manager.GetInstanceObject(txtContract.Tag)
Else
  Set Item.Contract = Nothing
End If
If txtPerson.Tag <> "" Then
  Set Item.Person = Item.Application.Manager.GetInstanceObject(txtPerson.Tag)
Else
  Set Item.Person = Nothing
End If
Item.Name = txtName
Item.Info = txtInfo
 ' SEE cmdAttrachment_CLICK
If txtReportType.Tag <> "" Then
  Set Item.ReportType = Item.Application.FindRowObject("VRDRreportType", txtReportType.Tag)
Else
  Set Item.ReportType = Nothing
End If
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



