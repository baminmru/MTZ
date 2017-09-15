VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmMain 
   Caption         =   "Проект ""Муромец"" поиск документов"
   ClientHeight    =   7815
   ClientLeft      =   1110
   ClientTop       =   1965
   ClientWidth     =   10920
   Icon            =   "frmMainExp.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7815
   ScaleWidth      =   10920
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ImageList TreeIcons 
      Left            =   1560
      Top             =   4920
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":0442
            Key             =   "part"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":0D1C
            Key             =   "ERR"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":15F6
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":1ED0
            Key             =   "field"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":27AA
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":3084
            Key             =   "type"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":395E
            Key             =   "SYS"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Left            =   840
      Top             =   4920
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":4238
            Key             =   "Back"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":434A
            Key             =   "Forward"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":445C
            Key             =   "lbrac"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":4776
            Key             =   "rbrac"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":4A90
            Key             =   "delete"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":4E2A
            Key             =   "open"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":51C4
            Key             =   "play"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMainExp.frx":54DE
            Key             =   "close"
         EndProperty
      EndProperty
   End
   Begin TabDlg.SSTab SSTab 
      Height          =   7125
      Left            =   0
      TabIndex        =   1
      Top             =   360
      Width           =   10905
      _ExtentX        =   19235
      _ExtentY        =   12568
      _Version        =   393216
      Style           =   1
      Tabs            =   2
      TabHeight       =   520
      TabCaption(0)   =   "Параметры запроса"
      TabPicture(0)   =   "frmMainExp.frx":5930
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "frmConditions"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "Результаты выполнения"
      TabPicture(1)   =   "frmMainExp.frx":594C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "frmResult"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).ControlCount=   1
      Begin VB.Frame frmConditions 
         Caption         =   "Frame1"
         Height          =   6135
         Left            =   240
         TabIndex        =   4
         Top             =   360
         Width           =   9435
         Begin VB.PictureBox picSplitter 
            BackColor       =   &H00808080&
            BorderStyle     =   0  'None
            FillColor       =   &H00808080&
            Height          =   3360
            Left            =   2430
            ScaleHeight     =   1463.088
            ScaleMode       =   0  'User
            ScaleWidth      =   780
            TabIndex        =   5
            Top             =   540
            Visible         =   0   'False
            Width           =   72
         End
         Begin MSComctlLib.TreeView struct 
            Height          =   3615
            Left            =   180
            TabIndex        =   6
            Top             =   390
            Width           =   2175
            _ExtentX        =   3836
            _ExtentY        =   6376
            _Version        =   393217
            HideSelection   =   0   'False
            Indentation     =   176
            LabelEdit       =   1
            LineStyle       =   1
            Style           =   7
            ImageList       =   "TreeIcons"
            Appearance      =   1
         End
         Begin MSFlexGridLib.MSFlexGrid Grid 
            Height          =   4695
            Left            =   2700
            TabIndex        =   7
            Top             =   510
            Width           =   6495
            _ExtentX        =   11456
            _ExtentY        =   8281
            _Version        =   393216
            Cols            =   5
            RowHeightMin    =   600
            WordWrap        =   -1  'True
            AllowBigSelection=   0   'False
            ScrollTrack     =   -1  'True
            FocusRect       =   0
            AllowUserResizing=   3
            FormatString    =   $"frmMainExp.frx":5968
         End
         Begin VB.Image imgSplitter 
            Height          =   3225
            Left            =   2385
            MousePointer    =   9  'Size W E
            Top             =   510
            Width           =   150
         End
      End
      Begin VB.Frame frmResult 
         Height          =   4425
         Left            =   -74670
         TabIndex        =   2
         Top             =   480
         Width           =   9405
         Begin VB.CommandButton cmdOpenDoc 
            Caption         =   "Открыть документ"
            Height          =   375
            Left            =   240
            TabIndex        =   10
            Top             =   3840
            Width           =   1935
         End
         Begin VB.CommandButton cmdOK 
            Caption         =   "OK"
            Height          =   375
            Left            =   7860
            TabIndex        =   9
            Top             =   3870
            Width           =   1185
         End
         Begin VB.CommandButton cmdCancel 
            Caption         =   "Отмена"
            Height          =   375
            Left            =   6600
            TabIndex        =   8
            Top             =   3870
            Width           =   1185
         End
         Begin VB.ListBox lstDoc 
            Height          =   3375
            Left            =   180
            TabIndex        =   3
            Top             =   240
            Width           =   8895
         End
      End
   End
   Begin MSComctlLib.Toolbar tbToolBar 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10920
      _ExtentX        =   19262
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      Style           =   1
      ImageList       =   "imlToolbarIcons"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   8
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Back"
            Object.ToolTipText     =   "Удалить условие"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Forward"
            Object.ToolTipText     =   "Добавить условие"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "lbrac"
            Object.ToolTipText     =   "Открыть скобку"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "rbrac"
            Object.ToolTipText     =   "Закрыть скобку"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "play"
            Object.ToolTipText     =   "Выполнить запрос"
            ImageIndex      =   7
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "open"
            Object.ToolTipText     =   "Открыть карточку объекта"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "delete"
            Object.ToolTipText     =   "Удалить запись о найденном объекте"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "exit"
            Object.ToolTipText     =   "Закрыть окно поиска"
            ImageIndex      =   8
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuAction 
      Caption         =   "Запрос"
      Begin VB.Menu mnuRun 
         Caption         =   "Выполнить"
      End
      Begin VB.Menu mnuSave 
         Caption         =   "Сохранить"
      End
      Begin VB.Menu mnuLoad 
         Caption         =   "Загрузить"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "Помощь"
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "О программе"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Public TypeName As String
Public Model As MTZMetaModel.Application
Public Application As GUI

Public id As String
Public Brief As String
Public OK As Boolean

Dim nv  As MTZUtil.NamedValues
Dim pos() As Long
Dim AndOr() As String
  
Dim mbMoving As Boolean

Dim rs As ADODB.Recordset
Dim mCol As Collection

Const sglSplitLimit = 500

Private Sub cmdOpenDoc_Click()
  On Error GoTo ErrOpen
  If lstDoc.ListIndex >= 0 Then
    Dim objGui As Object
    With mCol.Item(lstDoc.ListIndex + 1)
    
        Set objGui = Model.Application.Manager.GetInstanceGUI(mCol.Item(lstDoc.ListIndex + 1).id)
        Call objGui.Show("", mCol.Item(lstDoc.ListIndex + 1), True) ' Показываем карточку МОДАЛЬНО!
        Set objGui = Nothing
    End With
  End If
  Exit Sub
ErrOpen:
  Call MsgBox("Неудача открытия карточки" & vbCrLf & Err.Description, vbOKOnly + vbCritical, App.Title)
End Sub

Private Sub cmdDeleteDoc_Click()
  
  On Error GoTo ErrDelete
  
  If lstDoc.ListIndex >= 0 Then
    Call mCol.Remove(lstDoc.ListIndex + 1)
    lstDoc.RemoveItem (lstDoc.ListIndex)
  End If
  
  Exit Sub
ErrDelete:
  Call MsgBox("Неудача удаления записи о найденном объекте", vbOKOnly + vbCritical, App.Title)
End Sub


Private Sub cmdCancel_Click()
  OK = False
  Hide
End Sub

Private Sub cmdOK_Click()
  id = ""
  Brief = ""
  If lstDoc.ListCount > 0 Then
    If lstDoc.ListIndex > -1 Then
      If (Not mCol.Item(lstDoc.ListIndex + 1) Is Nothing) Then
        id = mCol.Item(lstDoc.ListIndex + 1).id
        Brief = mCol.Item(lstDoc.ListIndex + 1).Brief
        OK = True
      End If
    End If
  End If
  Hide
End Sub

Private Sub Form_Load()
  Dim i As Long, j As Long
  Dim o As OBJECTTYPE
  Dim p As part
  
  frmConditions.BorderStyle = 0
  frmResult.BorderStyle = 0
  
  Screen.MousePointer = vbHourglass
  Application.MetaModel.OBJECTTYPE.Sort = "Comment"
  struct.Nodes.Clear
  
  For i = 1 To Application.MetaModel.OBJECTTYPE.Count
    Set o = Application.MetaModel.OBJECTTYPE.Item(i)

   If TypeName <> "" Then
    If o.name = TypeName Then
      struct.Nodes.Add , , o.id, o.Comment, "type"
      For j = 1 To o.part.Count
        LoadPart o.part.Item(j), o.id
      Next
    End If
   Else
     struct.Nodes.Add , , o.id, o.Comment, "type"
     For j = 1 To o.part.Count
        LoadPart o.part.Item(j), o.id
     Next
   End If
  Next
  Screen.MousePointer = vbDefault
  
  Me.Left = GetSetting(App.Title, "Settings", "MainLeft", 1000)
  Me.Top = GetSetting(App.Title, "Settings", "MainTop", 1000)
  Me.Width = GetSetting(App.Title, "Settings", "MainWidth", 6500)
  Me.Height = GetSetting(App.Title, "Settings", "MainHeight", 6500)
  picSplitter.Left = GetSetting(App.Title, "Settings", "X", 3000)
  SizeControls picSplitter.Left
  Grid.Rows = 1
  Grid.ColWidth(0) = 0
  
  ' DENISK
  SSTab.TabEnabled(1) = False
  SSTab.Tab = 0
  
End Sub


Private Sub Form_Unload(Cancel As Integer)
  Dim i As Integer
  On Error Resume Next
  If Me.WindowState = vbNormal Then
    SaveSetting App.Title, "Settings", "MainLeft", Me.Left
    SaveSetting App.Title, "Settings", "MainTop", Me.Top
    SaveSetting App.Title, "Settings", "MainWidth", Me.Width
    SaveSetting App.Title, "Settings", "MainHeight", Me.Height
    SaveSetting App.Title, "Settings", "X", picSplitter.Left
  End If
  
  TypeName = ""
  Set Model = Nothing
  Set Application = Nothing
  
  id = ""
  Brief = ""

  Set nv = Nothing

  Set rs = Nothing
  
  If Not mCol Is Nothing Then
    While mCol.Count > 0
      Set mCol.Item(1) = Nothing
      Call mCol.Remove(1)
    Wend
    Set mCol = Nothing
  End If
End Sub


Private Sub Form_Resize()
  On Error Resume Next
  If Me.Width < 3000 Then Me.Width = 3000
  SizeControls imgSplitter.Left
End Sub

Private Sub Grid_DblClick()
Dim s As String
If Grid.Row > 0 Then
  If Grid.TextMatrix(Grid.Row, Grid.Col) <> "" Then
    If Grid.Col = 1 Then
      
      If Grid.TextMatrix(Grid.Row, Grid.Col) = "И" Then
         Grid.TextMatrix(Grid.Row, Grid.Col) = "ИЛИ"
      Else
        Grid.TextMatrix(Grid.Row, Grid.Col) = "И"
      End If
    End If
    If Grid.Col = 3 Then
      Dialog.sync = Grid.TextMatrix(Grid.Row, Grid.Col)
      Dialog.Show vbModal
      If Dialog.Result >= 0 Then
        Grid.TextMatrix(Grid.Row, Grid.Col) = Dialog.lstOP
        If Application.IsUnary(Application.Op2Code(Grid.TextMatrix(Grid.Row, 3))) Then
          Grid.TextMatrix(Grid.Row, 4) = ""
        Else
          Grid.TextMatrix(Grid.Row, 4) = "???"
        End If
      End If
      Unload Dialog
    End If
    If Grid.Col = 4 Then
      If Application.IsUnary(Application.Op2Code(Grid.TextMatrix(Grid.Row, 3))) Then
        Grid.TextMatrix(Grid.Row, 4) = ""
      Else
        If Application.IsArgArray(Application.Op2Code(Grid.TextMatrix(Grid.Row, 3))) Then
            Dim f As ArrDialog
            Set f = New ArrDialog
            f.Result = Grid.TextMatrix(Grid.Row, 4)
            f.Show vbModal
            If f.OK Then
              Grid.TextMatrix(Grid.Row, 4) = f.Result
            End If
        Else
          If Grid.TextMatrix(Grid.Row, 4) <> "" Then
            s = InputBox("Задайте значение", "Значение", Grid.TextMatrix(Grid.Row, 4))
            If s = "" Then Exit Sub
            Grid.TextMatrix(Grid.Row, 4) = s
          End If
        End If
      End If
    End If
    
  End If
End If
End Sub

Private Sub imgSplitter_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  With imgSplitter
    picSplitter.Move .Left, .Top, .Width \ 2, .Height - 20
  End With
  picSplitter.Visible = True
  mbMoving = True
End Sub

Private Sub imgSplitter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Dim sglPos As Single
  
  If mbMoving Then
    sglPos = X + imgSplitter.Left
    If sglPos < sglSplitLimit Then
      picSplitter.Left = sglSplitLimit
    ElseIf sglPos > Me.Width - sglSplitLimit Then
      picSplitter.Left = Me.Width - sglSplitLimit
    Else
      picSplitter.Left = sglPos
    End If
  End If
End Sub

Private Sub imgSplitter_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  SizeControls picSplitter.Left
  picSplitter.Visible = False
  mbMoving = False
End Sub


Private Function ProcessQueryRow(ByVal Row As String) As String
  Dim id As String
  Dim id2 As String
  Dim n As Node
  Dim name As String
  Dim part As part
  Dim field As field
  Dim op As FinderOP
  

  Dim l As String
  Dim cnt As Long
  Dim idout As String
  Dim value

  If Row > 0 Then
      If Grid.TextMatrix(Row, 0) <> "(" And Grid.TextMatrix(Row, 0) <> ")" Then
        id = Grid.TextMatrix(Row, 0)
        op = Application.Op2Code(Grid.TextMatrix(Row, 3))
        Set n = struct.Nodes.Item(id)
        If n.Image = "SYS" Then
        
          ' обрабатываем ссылку на объект
          name = n.Tag
          If Application.IsArgArray(op) Then
            value = Split(Grid.TextMatrix(Row, 4), vbCrLf)
          Else
            value = Grid.TextMatrix(Row, 4)
          End If
  
          id2 = CreateGUID2
          cnt = Application.MetaModel.MTZSession.TheFinder.FIND_IDS(id2, "INSTANCE", name, op, value)
          Debug.Print "INSTANCES", cnt
          
          Set n = n.Parent
          ExractLevel n.Key, id, l
          Set field = Application.MetaModel.FindObject("FIELD", id)
          idout = CreateGUID2
          Set part = field.Parent.Parent
          cnt = Application.MetaModel.MTZSession.TheFinder.FIND_IDS(idout, part.name, field.name, OpIN_RESULT, id2)
          Application.MetaModel.MTZSession.TheFinder.DropResults id2
          Debug.Print cnt
        
        Else
          ExractLevel n.Key, id, l
          Set field = Application.MetaModel.FindObject("FIELD", id)
          idout = CreateGUID2
          If Application.IsArgArray(op) Then
            value = Split(Grid.TextMatrix(Row, 4), vbCrLf)
          Else
            value = Grid.TextMatrix(Row, 4)
          End If
          Set part = field.Parent.Parent
          cnt = Application.MetaModel.MTZSession.TheFinder.FIND_IDS(idout, part.name, field.name, op, value)
          Debug.Print cnt
        End If
        
        ' перешли не раздел
        Set n = n.Parent

        While n.Parent.Image <> "type"
        
          If n.Parent.Image = "field" Then
            Set n = n.Parent
            ExractLevel n.Key, id, l
            Set field = Application.MetaModel.FindObject("FIELD", id)
            id2 = idout
            idout = CreateGUID2
            Set part = field.Parent.Parent
            cnt = Application.MetaModel.MTZSession.TheFinder.FIND_IDS(idout, part.name, field.name, OpIN_RESULT, id2)
            Application.MetaModel.MTZSession.TheFinder.DropResults id2
            Debug.Print part.name, field.name, cnt
            
            ' перешли к разделу
            Set n = n.Parent
          End If
  
          If n.Parent.Image = "part" Then
            ExractLevel n.Key, id, l
            Set part = Application.MetaModel.FindObject("PART", id)
            id2 = idout
            idout = CreateGUID2
            'Set part = field.Parent.Parent
            Call Application.MetaModel.MTZSession.TheFinder.RowsToParents(part.name, id2, idout)
            Application.MetaModel.MTZSession.TheFinder.DropResults id2
            Debug.Print part.name, "switch to parents"
            Set n = n.Parent
          End If
          
        Wend
        
        If n.Parent.Image = "type" Then
            ExractLevel n.Key, id, l
            Set part = Application.MetaModel.FindObject("PART", id)
            id2 = idout
            idout = CreateGUID2
            Call Application.MetaModel.MTZSession.TheFinder.RowsToInstances(part.name, id2, idout)
            Application.MetaModel.MTZSession.TheFinder.DropResults id2
            Debug.Print part.name, "switch to instances"
        End If
      End If
  End If
  
  ProcessQueryRow = idout
End Function




Private Sub debugStep()
  Dim i As Long
  Debug.Print "-- start  ----------------------------------"
  For i = 1 To Grid.Rows - 1
    If nv.Item(i).value <> "" Then
      Debug.Print i; ": "; pos(i); " | "; AndOr(i); " | "; 0
    Else
      Debug.Print i; ": "; pos(i); " | "; AndOr(i); " | "; nv.Item(i).value
    End If
  Next
  Debug.Print "-- finished  ----------------------------------"
  Debug.Print
End Sub




Private Sub lstDoc_DblClick()
  cmdOpenDoc_Click
End Sub

Private Sub mnuRun_Click()
  ' запрос по всем строкам
  
  Dim nvi As NamedValue
  Set nv = New NamedValues

  ReDim pos(0 To Grid.Rows - 1)
  ReDim AndOr(0 To Grid.Rows - 1)
  Dim idout As String
  pos(0) = 0
  AndOr(0) = ""


  Dim i As Long, j As Long, k As Long
  For i = 1 To Grid.Rows - 1
    nv.Add "R" & i, ProcessQueryRow(i)
  Next

  For i = 1 To Grid.Rows - 1
      AndOr(i) = Grid.TextMatrix(i, 1)

      If Grid.TextMatrix(i, 0) = "(" And pos(i) = 0 Then
        pos(i) = -1
      ElseIf Grid.TextMatrix(i, 0) = ")" And pos(i) = 0 Then

        ' search for -1
        For j = i - 1 To 1 Step -1
          If pos(j) = -1 Then
            Exit For
          End If
        Next

        ' search for non zero pos
        For k = j + 1 To i
          If pos(k) > 0 Then
            Exit For
          End If
        Next

        pos(j) = 0
        pos(i) = pos(k)
        pos(k) = 0
        nv.Item(i).value = nv.Item(pos(i)).value '    sis(i) = sis(pos(i))
        nv.Item(k).value = ""
        nv.Item(j).value = ""
        'Set sis(k) = Nothing
        'Set sis(j) = Nothing
        AndOr(i) = AndOr(j)
        AndOr(j) = ""
        AndOr(k) = ""
        GoTo try
      Else
try:

        For j = i - 1 To 1 Step -1
          If pos(j) > 0 Or pos(j) = -1 Then Exit For
        Next

        If pos(j) > 0 Then
          pos(j) = 0
          pos(i) = i
          ' Объединяем множества
          If AndOr(i) = "И" Then
            If nv.Item(i).value = "" Or nv.Item(j).value = "" Then

              nv.Item(i).value = ""
              nv.Item(j).value = ""
            Else
              
              idout = CreateGUID2
              Application.MetaModel.MTZSession.TheFinder.QR_AND_QR nv.Item(i).value, nv.Item(j).value, idout
              Application.MetaModel.MTZSession.TheFinder.DropResults nv.Item(i).value
              Application.MetaModel.MTZSession.TheFinder.DropResults nv.Item(j).value
              nv.Item(i).value = idout
              nv.Item(j).value = ""
            End If
          Else
            If nv.Item(i).value = "" Or nv.Item(j).value = "" Then

              If nv.Item(i).value <> "" Then
                nv.Item(i).value = nv.Item(j).value
              End If
              nv.Item(j).value = ""

            Else
              idout = CreateGUID2
              Application.MetaModel.MTZSession.TheFinder.QR_OR_QR nv.Item(i).value, nv.Item(j).value, idout
              Application.MetaModel.MTZSession.TheFinder.DropResults nv.Item(i).value
              Application.MetaModel.MTZSession.TheFinder.DropResults nv.Item(j).value
              nv.Item(i).value = idout
              nv.Item(j).value = ""
            End If
          End If
        Else
          pos(i) = i
        End If

      End If

      debugStep
    Next


    'Set rs = Model.MTZSession.TheFinder.GetResults(nv.Item(Grid.Rows - 1).value)
    'If Not rs Is Nothing Then
    '  If rs.RecordCount > 0 Then
     '   Dim frm As frmResults
     '   Set frmResults = New frmResults
     '   Set frmResults.Application = Application
     '   Set frmResults.rs = rs
    '
     '   frmResults.Show vbModal, Me
    '    Exit Sub
    '  End If
    '  Set rs = Nothing
    'End If
    'MsgBox "No items"
    'Model.MTZSession.TheFinder.DropResults nv.Item(Grid.Rows - 1).value
    
    
    Dim bFinded As Boolean
    bFinded = False
    If (Grid.Rows > 0) And (nv.Count > (Grid.Rows - 2)) Then
      Set rs = Model.MTZSession.TheFinder.GetResults(nv.Item(Grid.Rows - 1).value)
      If Not rs Is Nothing Then
        If rs.RecordCount > 0 Then
          bFinded = True
          Set rs = rs
          Call LoadResults
          SSTab.Tab = 1
          SSTab.TabEnabled(1) = True
        End If
      End If
      If Not bFinded Then
        Call MsgBox("Документы не обнаружены", vbOKOnly + vbInformation, App.Title)
        Set rs = Nothing
        Model.MTZSession.TheFinder.DropResults nv.Item(Grid.Rows - 1).value
      End If
    End If
End Sub

Private Sub SSTab_Click(PreviousTab As Integer)
  Call Form_Resize
End Sub


Private Sub struct_DblClick()
  AddRow
End Sub

Private Sub struct_DragDrop(Source As Control, X As Single, Y As Single)
  If Source = imgSplitter Then
    SizeControls X
  End If
End Sub

Sub SizeControls(X As Single)
  On Error Resume Next
  
  Call EnableButtons
  'set the width
  If X < 1500 Then X = 1500
  If X > (Me.Width - 1500) Then X = Me.Width - 1500
  
  SSTab.Top = tbToolBar.Height
  SSTab.Left = 0
  SSTab.Width = Me.ScaleWidth
  SSTab.Height = Me.ScaleHeight - tbToolBar.Height
  
  frmConditions.Visible = (SSTab.Tab = 0)
  
   frmConditions.Left = 60
  frmConditions.Top = tbToolBar.Height
  frmConditions.Width = SSTab.Width - 100
  frmConditions.Height = Me.ScaleHeight - tbToolBar.Height - 450
 
  struct.Width = X        ' DENISK
  struct.Left = 5         ' DENISK
  imgSplitter.Left = X
  Grid.Left = X + 40

  Grid.Width = Me.ScaleWidth - (struct.Width + 150)
  struct.Top = 70
  Grid.Top = struct.Top - 5

  struct.Height = Me.ScaleHeight - struct.Top - 450 - tbToolBar.Height
  Grid.Height = struct.Height + 10
  imgSplitter.Top = struct.Top
  imgSplitter.Height = struct.Height

  frmResult.Visible = (SSTab.Tab = 1)
  
  frmResult.Left = frmConditions.Left
  frmResult.Top = frmConditions.Top
  frmResult.Width = frmConditions.Width
  frmResult.Height = frmConditions.Height
  
  lstDoc.Visible = True
  cmdOK.Visible = True
  'cmdCancel.Visible = True
  lstDoc.Top = 10
  lstDoc.Left = 10
  lstDoc.Width = Me.ScaleWidth - 150
  lstDoc.Height = Grid.Height - cmdOK.Height - 20

  cmdCancel.Top = lstDoc.Height + 80
  cmdOK.Top = cmdCancel.Top
  cmdOK.Left = lstDoc.Width - cmdCancel.Width - 20
  cmdCancel.Left = cmdOK.Left - cmdCancel.Width - 20

End Sub

Private Sub tbToolBar_ButtonClick(ByVal Button As MSComctlLib.Button)
  On Error Resume Next
  Select Case Button.Key
    Case "Back"
       If Grid.Row > 0 Then
          If Grid.Rows = 2 Then
            Grid.Rows = 1
          Else
            Grid.RemoveItem Grid.Row
          End If
          checkQuery
       End If
    Case "Forward"
      AddRow
      If Not struct.SelectedItem Is Nothing Then
        If struct.SelectedItem.Image = "field" Or struct.SelectedItem.Image = "SYS" Then
          If Grid.Rows = 1 Then
            Grid.AddItem struct.SelectedItem.Key & vbTab & vbTab & struct.SelectedItem.FullPath & vbTab & "равно" & vbTab & "???", Grid.Row + 1
          Else
            If Grid.TextMatrix(Grid.Row, 0) <> "(" Then
              Grid.AddItem struct.SelectedItem.Key & vbTab & "И" & vbTab & struct.SelectedItem.FullPath & vbTab & "равно" & vbTab & "???", Grid.Row + 1
            Else
              Grid.AddItem struct.SelectedItem.Key & vbTab & vbTab & struct.SelectedItem.FullPath & vbTab & "равно" & vbTab & "???", Grid.Row + 1
            End If
          End If

        End If
      End If
      Grid.Row = Grid.Row + 1
    Case "lbrac"
         If Grid.Rows = 1 Then
          Grid.AddItem "(" & vbTab & vbTab & "(" & vbTab & vbTab, Grid.Row + 1
         Else
          If Grid.TextMatrix(Grid.Row, 0) = ")" Then
            Grid.AddItem "(" & vbTab & "И" & vbTab & "(" & vbTab & vbTab, Grid.Row + 1
          Else
            Grid.AddItem "(" & vbTab & vbTab & "(" & vbTab & vbTab, Grid.Row + 1
          End If
         End If
         Grid.Row = Grid.Row + 1
         checkQuery
    Case "rbrac"
         Grid.AddItem ")" & vbTab & vbTab & ")" & vbTab & vbTab, Grid.Row + 1
         Grid.Row = Grid.Row + 1
         checkQuery
    Case "play"
      Call mnuRun_Click
    Case "open"
      Call cmdOpenDoc_Click
    Case "delete"
      Call cmdDeleteDoc_Click
    Case "exit"
      OK = False
      Hide
  End Select
  Call EnableButtons
End Sub


Private Sub AddRow()
  If Not struct.SelectedItem Is Nothing Then
    If struct.SelectedItem.Image = "field" Or struct.SelectedItem.Image = "SYS" Then
      If Grid.Rows = 1 Then
        Grid.AddItem struct.SelectedItem.Key & vbTab & vbTab & struct.SelectedItem.FullPath & vbTab & "равно" & vbTab & "???", Grid.Row + 1
      Else
        If Grid.TextMatrix(Grid.Row, 0) <> "(" Then
          Grid.AddItem struct.SelectedItem.Key & vbTab & "И" & vbTab & struct.SelectedItem.FullPath & vbTab & "равно" & vbTab & "???", Grid.Row + 1
        Else
          Grid.AddItem struct.SelectedItem.Key & vbTab & vbTab & struct.SelectedItem.FullPath & vbTab & "равно" & vbTab & "???", Grid.Row + 1
        End If
      End If
      On Error Resume Next
      Grid.Row = Grid.Row + 1
    End If
  End If
  Call EnableButtons
End Sub

Private Sub mnuHelpAbout_Click()
  Call MsgBox("Версия " & App.Major & "." & App.Minor & "." & App.Revision, vbOKOnly, Me.Caption)
End Sub

Private Sub LoadPart(ByVal p As part, ByVal parentID As String)
  Dim id As String
  Dim id2 As String
  Screen.MousePointer = vbHourglass
  id = p.id & CreateGUID2()
  
  If CountOfID(p.id, struct.Nodes.Item(parentID)) > 2 Then
    struct.Nodes.Add(parentID, tvwChild, , "<<< ЦИКЛИЧЕСКАЯ ССЫЛКА >>> (" & p.Caption & ")", "ERR").ForeColor = RGB(255, 0, 0)
  Else
    With struct.Nodes.Add(parentID, tvwChild, id, p.Caption, "part")
      .Bold = True
      .Tag = "part"
    End With
    With struct.Nodes.Add(id, tvwChild, , "To expand")
         .Tag = "ToExpand"
    End With
    
    
  End If
  Screen.MousePointer = vbDefault
End Sub




Private Sub struct_Expand(ByVal Node As MSComctlLib.Node)
  Dim n As Node
  If Node.children = 1 Then
    If Node.Child.Tag = "ToExpand" Then
      Screen.MousePointer = vbHourglass
      struct.Nodes.Remove Node.Child.Index
      Dim id As String
      Dim l As String
      
      
      ExractLevel Node.Key, id, l
      Dim f As field, p As part, p2 As part, ft As FIELDTYPE, id2 As String
      
      If Node.Tag = "field" Then
        Set f = Model.FindRowObject("FIELD", id)
        If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
            Set n = struct.Nodes.Add(Node.Key, tvwChild, CreateGUID2, "ИМЯ", "SYS")
            n.ForeColor = RGB(0, 0, 192)
            n.Tag = "NAME"
            Set n = struct.Nodes.Add(Node.Key, tvwChild, CreateGUID2, "ТИП ОБЪЕКТА", "SYS")
            n.ForeColor = RGB(0, 0, 192)
            n.Tag = "OBJTYPE"
            Screen.MousePointer = vbDefault
            Exit Sub
        End If
        If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
            Set p = f.RefToPart
            If Not p Is Nothing Then
                LoadPart p, Node.Key
            End If
        End If
    End If
    If Node.Tag = "part" Then
      Dim i As Long, j As Long
      Set p = Model.FindObject("PART", id)
      For i = 1 To p.field.Count
         Set f = p.field.Item(i)
         id2 = f.id & CreateGUID2()
         Set ft = f.FIELDTYPE
         If ft.TypeStyle = TypeStyle_Ssilka Then
          struct.Nodes.Add(Node.Key, tvwChild, id2, f.Caption, "field").Tag = "field"
          With struct.Nodes.Add(id2, tvwChild, , "To expand")
           .Tag = "ToExpand"
          End With
         Else
          Call struct.Nodes.Add(Node.Key, tvwChild, id2, f.Caption, "field")
         End If
      Next
      
      For j = 1 To p.part.Count
        Set p2 = p.part.Item(j)
        LoadPart p2, Node.Key
      Next
    End If
    Screen.MousePointer = vbDefault
    End If
  End If
End Sub


Private Function CountOfID(ByVal id As String, ByVal n As Node) As Long
  Dim nn As Node, cnt As Long
  cnt = 0
  Set nn = n
  While Not n Is Nothing
    If Left(n.Key, 38) = id Then
      cnt = cnt + 1
    End If
    Set n = n.Parent
  Wend
  CountOfID = cnt
End Function


Private Sub ExractLevel(ByVal Key As String, ByRef id As String, ByRef level As String)
  id = Left(Key, 38)
  level = Right(Key, 38)
End Sub



Private Sub checkQuery()
  Dim i As Long
  For i = 1 To Grid.Rows - 1
    If Grid.TextMatrix(i, 1) <> "" Then
      If i = 1 Then
        Grid.TextMatrix(i, 1) = ""
      Else
        If Grid.TextMatrix(i - 1, 2) = "(" Then
          Grid.TextMatrix(i, 1) = ""
        End If
      End If
    End If
  Next
End Sub


Private Sub LoadResults()
  Screen.MousePointer = vbHourglass
  Set mCol = New Collection
 
  Dim OBJ As Object
  While Not rs.EOF
    Set OBJ = Application.Manager.GetInstanceObject(rs!Result, Application.Site)
    mCol.Add OBJ, rs!Result
    lstDoc.AddItem OBJ.Brief
    rs.MoveNext
  Wend
  rs.Close
  Set rs = Nothing
  
  lstDoc.ListIndex = 0
  
  Screen.MousePointer = vbDefault
End Sub

Private Sub EnableButtons()
  If (SSTab.Tab = 0) Then
    tbToolBar.Buttons.Item("Back").Visible = True
    tbToolBar.Buttons.Item("Forward").Visible = True
    tbToolBar.Buttons.Item("lbrac").Visible = True
    tbToolBar.Buttons.Item("rbrac").Visible = True
    tbToolBar.Buttons.Item("open").Visible = False
    tbToolBar.Buttons.Item("delete").Visible = False
    tbToolBar.Buttons.Item("play").Visible = True
    If Grid.Rows > 1 Then
    
      tbToolBar.Buttons.Item("play").Enabled = True
    Else
      tbToolBar.Buttons.Item("play").Enabled = False
    End If
  ElseIf (SSTab.Tab = 1) Then
    tbToolBar.Buttons.Item("Back").Visible = False
    tbToolBar.Buttons.Item("Forward").Visible = False
    tbToolBar.Buttons.Item("lbrac").Visible = False
    tbToolBar.Buttons.Item("rbrac").Visible = False
    tbToolBar.Buttons.Item("play").Visible = False
    tbToolBar.Buttons.Item("open").Visible = True
    tbToolBar.Buttons.Item("delete").Visible = True
  End If
End Sub
