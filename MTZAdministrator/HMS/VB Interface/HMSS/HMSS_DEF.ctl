VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Begin VB.UserControl HMSS_DEF 
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
      Begin VB.TextBox txtTheCopyright 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   9
         ToolTipText     =   "Копирайт"
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
      Begin MTZ_PANEL.DropButton cmdFileContent 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "fileopen.ico"
         ToolTipText     =   "Содержимое файла"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFileContent 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         Text            =   "Text1"
         ToolTipText     =   "Содержимое файла"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.Timer FileContent 
         Enabled         =   0   'False
         Interval        =   500
         Left            =   100
         Top             =   100
      End
      Begin VB.TextBox txtMainDesign 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "Файл с основным дизайном"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название сайта"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblTheCopyright 
         BackStyle       =   0  'Transparent
         Caption         =   "Копирайт:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblFileContent 
         BackStyle       =   0  'Transparent
         Caption         =   "Содержимое файла:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblMainDesign 
         BackStyle       =   0  'Transparent
         Caption         =   "Файл с основным дизайном:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название сайта:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "HMSS_DEF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean
  Private PathFileContent As String
  Private ModFileContent As Date





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

Private Sub txtName_Change()
  Changing

End Sub
Private Sub txtMainDesign_Change()
  Changing

End Sub

Private Sub FileContent_Timer()
    If PathFileContent <> "" Then
        'Try Lock file
        Dim ff As Integer
        ff = FreeFile
        On Error GoTo EndCheck
        Open PathFileContent For Binary Access Read Lock Read As ff
        Close ff
        'Файл свободен, проверяем блокировку
        Dim fso, f, s
        Set fso = CreateObject("Scripting.FileSystemObject")
        Set f = fso.GetFile(PathFileContent)
        Dim Modifyed As Date
        Modifyed = f.DateLastModified
        FileContent.Enabled = False
        If ModFileContent <> Modifyed Then
            'Нада обновлять...
            If MsgBox("Файл изменён, обновить?", vbYesNo, "") = vbYes Then

                Item.FileContent = FileToArray(PathFileContent)
                Item.FileContent_ext = GetFileExtension2(PathFileContent)
                Call f.Delete(True)
                Changing
            End If
        End If
        Exit Sub
EndCheck:
        'Файл заблокированн! Ждёмс...
    End If
End Sub

Private Sub cmdFileContent_Click()
  On Error Resume Next
  If Item.FileContent_ext <> "" And Not IsNull(Item.FileContent) Then
    cmdFileContent_MenuClick "Открыть"
  Else
    cmdFileContent_MenuClick "Выбрать"
  End If
End Sub

Private Sub cmdFileContent_MenuClick(ByVal sCaption As String)
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
   txtFileContent = Dialog.FileName
   Item.FileContent = FileToArray(Dialog.FileName)
   Item.FileContent_ext = GetFileExtension2(Dialog.FileName)
   Changing

  End If
  If sCaption = "Очистить" Then
   txtFileContent = ""
   Item.FileContent = Null
   Item.FileContent_ext = ""
   Changing
  End If
  If sCaption = "Открыть" Then
    PathFileContent = DoOpenFile(Item.FileContent, Item.FileContent_ext)
    'Get LastModify Date
    Dim fso, f, s
    On Error Resume Next
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.GetFile(PathFileContent)
    ModFileContent = f.DateLastModified
    
    Item.Application.Manager.StoreTempFileData PathFileContent, Item.PartName, Item.ID
    FileContent.Enabled = True
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
   ArrayToFile Dialog.FileName, Item.FileContent
  End If
End Sub
Private Sub txtTheCopyright_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = IsSet(txtMainDesign.Text)
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
txtName = Item.Name
  On Error Resume Next
txtMainDesign = Item.MainDesign
 If LenB(Item.FileContent) > 0 Then
   txtFileContent = "Данные (" & Item.FileContent_ext & ")"
 Else
   txtFileContent = ""
 End If
 LoadBtnPictures cmdFileContent, cmdFileContent.Tag
 cmdFileContent.RemoveAllMenu
 cmdFileContent.AddMenu "Очистить"
 cmdFileContent.AddMenu "Выбрать"
 cmdFileContent.AddMenu "Сохранить"
 cmdFileContent.AddMenu "Открыть"
  On Error Resume Next
txtTheCopyright = Item.TheCopyright
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

Item.Name = txtName
Item.MainDesign = txtMainDesign
 ' SEE cmdFileContent_CLICK
Item.TheCopyright = txtTheCopyright
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



