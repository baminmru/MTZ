VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl VRDGContractChanges 
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
      Begin VB.TextBox txtthe_Comment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         ToolTipText     =   "Примечание"
         Top             =   2520
         Width           =   3000
      End
      Begin MSComDlg.CommonDialog Dialog 
         Left            =   300
         Top             =   2040
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MTZ_PANEL.DropButton cmdtheFile 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "fileopen.ico"
         ToolTipText     =   "Файл соглашения"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txttheFile 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         Text            =   "Text1"
         ToolTipText     =   "Файл соглашения"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.Timer theFile 
         Enabled         =   0   'False
         Interval        =   500
         Left            =   100
         Top             =   100
      End
      Begin MSComCtl2.DTPicker dtpDateOf 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Дата соглашения"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   71499779
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtCode 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   2
         ToolTipText     =   "Номер соглашения"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblthe_Comment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lbltheFile 
         BackStyle       =   0  'Transparent
         Caption         =   "Файл соглашения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDateOf 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата соглашения:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblCode 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер соглашения:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "VRDGContractChanges"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean
  Private PaththeFile As String
  Private ModtheFile As Date





Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, Cancel)
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

Private Sub txtCode_Change()
  Changing

End Sub
Private Sub dtpDateOf_Change()
  Changing

End Sub

Private Sub theFile_Timer()
    If PaththeFile <> "" Then
        'Try Lock file
        Dim ff As Integer
        ff = FreeFile
        On Error GoTo EndCheck
        Open PaththeFile For Binary Access Read Lock Read As ff
        Close ff
        'Файл свободен, проверяем блокировку
        Dim fso, f, s
        Set fso = CreateObject("Scripting.FileSystemObject")
        Set f = fso.GetFile(PaththeFile)
        Dim Modifyed As Date
        Modifyed = f.DateLastModified
        theFile.Enabled = False
        If ModtheFile <> Modifyed Then
            'Нада обновлять...
            If MsgBox("Файл изменён, обновить?", vbYesNo, "") = vbYes Then

                Item.theFile = FileToArray(PaththeFile)
                Item.theFile_ext = GetFileExtension2(PaththeFile)
                Call f.Delete(True)
                Changing
            End If
        End If
        Exit Sub
EndCheck:
        'Файл заблокированн! Ждёмс...
    End If
End Sub

Private Sub cmdtheFile_Click()
  On Error Resume Next
  If Item.theFile_ext <> "" And Not IsNull(Item.theFile) Then
    cmdtheFile_MenuClick "Открыть"
  Else
    cmdtheFile_MenuClick "Выбрать"
  End If
End Sub

Private Sub cmdtheFile_MenuClick(ByVal sCaption As String)
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
   txttheFile = Dialog.FileName
   Item.theFile = FileToArray(Dialog.FileName)
   Item.theFile_ext = GetFileExtension2(Dialog.FileName)
   Changing

  End If
  If sCaption = "Очистить" Then
   txttheFile = ""
   Item.theFile = Null
   Item.theFile_ext = ""
   Changing
  End If
  If sCaption = "Открыть" Then
    PaththeFile = DoOpenFile(Item.theFile, Item.theFile_ext)
    'Get LastModify Date
    Dim fso, f, s
    On Error Resume Next
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.GetFile(PaththeFile)
    ModtheFile = f.DateLastModified
    
    Item.Application.Manager.StoreTempFileData PaththeFile, Item.PartName, Item.ID
    theFile.Enabled = True
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
   ArrayToFile Dialog.FileName, Item.theFile
  End If
End Sub
Private Sub txtthe_Comment_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtCode.Text)
If mIsOK Then mIsOK = IsSet(dtpDateOf.Value)
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

  On Error Resume Next
txtCode = Item.Code
dtpDateOf = Date
If Item.DateOf <> 0 Then
 dtpDateOf = Item.DateOf
End If
 If LenB(Item.theFile) > 0 Then
   txttheFile = "Данные (" & Item.theFile_ext & ")"
 Else
   txttheFile = ""
 End If
 LoadBtnPictures cmdtheFile, cmdtheFile.Tag
 cmdtheFile.RemoveAllMenu
 cmdtheFile.AddMenu "Очистить"
 cmdtheFile.AddMenu "Выбрать"
 cmdtheFile.AddMenu "Сохранить"
 cmdtheFile.AddMenu "Открыть"
txtthe_Comment = Item.the_Comment
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

Item.Code = txtCode
  If IsNull(dtpDateOf) Then
    Item.DateOf = 0
  Else
    Item.DateOf = dtpDateOf.Value
  End If
 ' SEE cmdtheFile_CLICK
Item.the_Comment = txtthe_Comment
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



