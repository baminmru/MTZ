VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.Form frmObjList2 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Выбор документа"
   ClientHeight    =   4545
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   8760
   Icon            =   "frmObjList2.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   8760
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdRefresh 
      Height          =   330
      Left            =   750
      Style           =   1  'Graphical
      TabIndex        =   5
      Tag             =   "refresh.ico"
      Top             =   4140
      Width           =   330
   End
   Begin VB.CommandButton cmdFind 
      Height          =   330
      Left            =   30
      Style           =   1  'Graphical
      TabIndex        =   3
      Tag             =   "find.ico"
      ToolTipText     =   "Поиск"
      Top             =   4140
      Width           =   330
   End
   Begin VB.CommandButton cmdPrn 
      Height          =   330
      Left            =   390
      Style           =   1  'Graphical
      TabIndex        =   4
      Tag             =   "printpreview.ico"
      ToolTipText     =   "Печать"
      Top             =   4140
      Width           =   330
   End
   Begin GridEX20.GridEX gr 
      Height          =   3375
      Left            =   0
      TabIndex        =   2
      Top             =   660
      Width           =   8655
      _ExtentX        =   15266
      _ExtentY        =   5953
      Version         =   "2.0"
      AutomaticSort   =   -1  'True
      HoldSortSettings=   -1  'True
      BoundColumnIndex=   ""
      ReplaceColumnIndex=   ""
      TabKeyBehavior  =   1
      ColumnAutoResize=   -1  'True
      MethodHoldFields=   -1  'True
      AllowColumnDrag =   0   'False
      AllowEdit       =   0   'False
      GroupByBoxVisible=   0   'False
      DataMode        =   99
      ColumnHeaderHeight=   285
      IntProp1        =   0
      IntProp2        =   0
      IntProp7        =   0
      ColumnsCount    =   2
      Column(1)       =   "frmObjList2.frx":0442
      Column(2)       =   "frmObjList2.frx":059E
      SortKeysCount   =   1
      SortKey(1)      =   "frmObjList2.frx":0696
      FormatStylesCount=   6
      FormatStyle(1)  =   "frmObjList2.frx":06FE
      FormatStyle(2)  =   "frmObjList2.frx":085A
      FormatStyle(3)  =   "frmObjList2.frx":090A
      FormatStyle(4)  =   "frmObjList2.frx":09BE
      FormatStyle(5)  =   "frmObjList2.frx":0A96
      FormatStyle(6)  =   "frmObjList2.frx":0B4E
      ImageCount      =   0
      PrinterProperties=   "frmObjList2.frx":0C0A
   End
   Begin VB.CommandButton cmdOpen 
      Caption         =   "Открыть"
      Height          =   315
      Left            =   2310
      TabIndex        =   7
      ToolTipText     =   "Открыть карточку объекта"
      Top             =   4140
      Width           =   1095
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Создать"
      Height          =   315
      Left            =   1185
      TabIndex        =   6
      Top             =   4140
      Width           =   1095
   End
   Begin VB.ComboBox cmbType 
      Height          =   315
      Left            =   0
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   300
      Width           =   8655
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   6300
      TabIndex        =   8
      Top             =   4140
      Width           =   1175
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   7500
      TabIndex        =   9
      Top             =   4140
      Width           =   1175
   End
   Begin VB.Label Label1 
      Caption         =   "Тип объекта"
      Height          =   255
      Left            =   30
      TabIndex        =   0
      Top             =   30
      Width           =   3495
   End
End
Attribute VB_Name = "frmObjList2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 240
Option Explicit
Public TypeName As String
Attribute TypeName.VB_VarHelpID = 295
Public site As String
Attribute site.VB_VarHelpID = 290
Public Runner As Main
Attribute Runner.VB_VarHelpID = 285
Public ok As Boolean
Attribute ok.VB_VarHelpID = 270
Public ID As String
Attribute ID.VB_VarHelpID = 255
Public Brief As String
Attribute Brief.VB_VarHelpID = 245
Private inst As Collection
Private types As Collection
Private fnd As Object
Public Filter As String
Attribute Filter.VB_VarHelpID = 250
Dim fmTop As Long
Public refreshMe As Boolean
Attribute refreshMe.VB_VarHelpID = 280

'For GetRefEx3
Public IsHide_Add As Boolean
Attribute IsHide_Add.VB_VarHelpID = 260
Public IsHide_Setup As Boolean
Attribute IsHide_Setup.VB_VarHelpID = 265

Private Sub cmbType_Click()
  Dim i As Long
  Dim rs As ADODB.Recordset

  Set inst = New Collection
  Dim tt As tmpInst, o As tmpInst
  Set tt = types.Item(cmbType.ItemData(cmbType.ListIndex))
  Me.Caption = Runner.getReadableTypeName(Runner.Sessions.Item(site), tt.ObjType)
  Set rs = Runner.Sessions.Item(site).GetRows("V_INSTANCE", "", "", " ObjType='" & tt.ObjType & "'")
  i = 0
  gr.ItemCount = 0
  While Not rs.EOF
    i = i + 1
    On Error Resume Next
    Set o = New tmpInst
    o.ID = rs!InstanceiD
    o.Name = rs!Name
    o.ObjType = rs!ObjType
    o.Status = rs!StatusName
    inst.Add o
    rs.MoveNext
  Wend
  Set rs = Nothing
  gr.ItemCount = i
  
  If tt.IsSingle = -1 And i > 0 Then
    cmdCreate.Enabled = False
  Else
    cmdCreate.Enabled = True
  End If
End Sub

Private Sub cmdCancel_Click()
ok = False
'Set Runner = Nothing
'Set inst = Nothing
'Set types = Nothing
Me.Hide
End Sub

'Parameters:
' параметров нет
'See Also:
'  Brief
'  Filter
'  ID
'  IsHide_Add
'  IsHide_Setup
'  ok
'  refreshMe
'  Runner
'  site
'  TypeName
'Example:
'  call me.RefreshData()
Public Sub RefreshData()
Attribute RefreshData.VB_HelpID = 275
  cmbType_Click
  refreshMe = False
End Sub

Private Sub cmdCreate_Click()
'  Dim n As String

'  If n = "" Then Exit Sub
'  n = InputBox("Задайте имя нового документа", "Новый документ",
  ID = CreateGUID2()
  If Runner.NewInstance(ID, types.Item(cmbType.ItemData(cmbType.ListIndex)).ObjType, types.Item(cmbType.ItemData(cmbType.ListIndex)).ObjType & " " & Now, site) Then
    Dim ref As Object, objGUI As Object
    Set ref = Runner.GetInstanceObject(ID)
    If Not ref Is Nothing Then
      Set objGUI = Runner.GetInstanceGUI(ID)
      If objGUI Is Nothing Then Set ref = Nothing: Exit Sub
      
      Dim NValues As NamedValues
      Dim bShowModal As Boolean
      bShowModal = True
      Set NValues = Runner.GetCustomObjects("ManagerSettings")
      If Not NValues Is Nothing Then
        If Not NValues.Item("AddObject_ShowModal") Is Nothing Then
            bShowModal = NValues.Item("AddObject_ShowModal").Value
        End If
      End If
      
      
      objGUI.Show "", ref, bShowModal
      Set objGUI = Nothing
    End If
    
    On Error GoTo bye
    ok = True
    refreshMe = True
    Brief = ref.Name
    
    Set ref = Nothing
    'Set Runner = Nothing
    'Set inst = Nothing
    'Set types = Nothing
    Me.Hide
bye:
  End If
End Sub


Private Sub cmdOK_Click()
  On Error GoTo bye
  If gr.Row <= 0 Then Exit Sub
  If gr.RowIndex(gr.Row) <= 0 Then Exit Sub
  ok = True
  ID = inst.Item(gr.RowIndex(gr.Row)).ID
  Brief = inst.Item(gr.RowIndex(gr.Row)).Name
  'Set Runner = Nothing
  'Set inst = Nothing
  'Set types = Nothing
  Me.Hide
bye:
End Sub

Private Sub cmdOpen_Click()
On Error GoTo bye
If gr.ItemCount >= 0 Then
  Dim obj As Object, objGUI As Object
  
  Set obj = Runner.GetInstanceObject(inst.Item(gr.RowIndex(gr.Row)).ID)
  If obj Is Nothing Then Exit Sub
  Set objGUI = Runner.GetInstanceGUI(obj.ID)
  If objGUI Is Nothing Then Set obj = Nothing: Exit Sub
  objGUI.Show "", obj, True
  Set objGUI = Nothing
  Set obj = Nothing
End If
bye:
End Sub

Private Sub cmdPrn_Click()
On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gr, "Поиск"
Set jset = Nothing

End Sub


Private Sub cmdFind_Click()
  On Error Resume Next
  fnd.ShowForm
End Sub

Private Sub cmdRefresh_Click()
RefreshData
End Sub

Private Sub Form_Activate()

  cmdCreate.Visible = Not Runner.HideAditionalButtons
  cmdFind.Visible = Not Runner.HideAditionalButtons
  cmdPrn.Visible = Not Runner.HideAditionalButtons
  cmdRefresh.Visible = Not Runner.HideAditionalButtons
  cmdOpen.Visible = Not Runner.HideAditionalButtons

  If refreshMe Then
  RefreshData
  End If
End Sub

Private Sub Form_GotFocus()
If refreshMe Then
  RefreshData
  End If
End Sub

Private Sub Form_Load()
  LoadBtnPictures cmdPrn, cmdPrn.Tag
  LoadBtnPictures cmdFind, cmdFind.Tag
  LoadBtnPictures cmdRefresh, cmdRefresh.Tag
  
  'Dim pv As Object
  Dim vc As Object
  Dim rs As ADODB.Recordset
  Dim i As Long
  
  gr.ItemCount = 0

  Dim n As String, tn As String
  If Filter <> "" Then
      If TypeName = "" Then
      Set rs = Runner.Sessions.Item(site).GetRowsEx("OBJECTTYPE", , , Filter & "and AllowRefToObject=-1", "order by Name")
    Else
      Set rs = Runner.Sessions.Item(site).GetRowsEx("OBJECTTYPE", "", "", Filter & " and Name='" & TypeName & "'", "order by Name")
    End If
  Else
    If TypeName = "" Then
      Set rs = Runner.Sessions.Item(site).GetRowsEx("OBJECTTYPE", , , "AllowRefToObject=-1", "order by Name")
    Else
      Set rs = Runner.Sessions.Item(site).GetRowsEx("OBJECTTYPE", "", "", " Name='" & TypeName & "'", "order by name")
    End If
  End If

  Dim o As tmpInst
  Set types = New Collection
  i = 0
  While Not rs.EOF
      i = i + 1
      Set o = New tmpInst
      o.Name = rs!the_comment
      o.ObjType = rs!Name
      o.IsSingle = rs!IsSingleInstance
      types.Add o
      cmbType.AddItem o.Name
      cmbType.ItemData(cmbType.NewIndex) = i
      rs.MoveNext
  Wend
  Set rs = Nothing
  
  Set fnd = Nothing
  Set fnd = CreateObject("MTZ_JSetup.GridFinder")
  fnd.Init gr
  
 
  
  If cmbType.ListCount > 0 Then
    cmbType.ListIndex = 0
  End If
   
  
End Sub


Private Sub Form_Paint()
  If refreshMe Then
    RefreshData
  End If
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  
  If Me.Height < 4950 Then Me.Height = 4950
  If Me.Width < 8880 Then Me.Width = 8880
  
  Label1.top = 30
  cmbType.top = Label1.top + Label1.Height + 30
  cmbType.Left = 30
  cmbType.Width = Me.ScaleWidth - 60
  
  gr.top = cmbType.top + cmbType.Height + 30
  gr.Left = 30
  gr.Height = Me.ScaleHeight - cmbType.top - cmbType.Height - 30 - cmdOK.Height - 120
  gr.Width = Me.ScaleWidth
  
  cmdFind.top = Me.ScaleHeight - cmdFind.Height - 60
  cmdPrn.top = cmdFind.top
  cmdRefresh.top = cmdFind.top
  cmdCreate.top = cmdFind.top
  cmdCreate.top = cmdFind.top
  cmdOpen.top = cmdFind.top
  
  cmdOK.top = cmdFind.top
  cmdCancel.top = cmdFind.top
  
  cmdCancel.Left = Me.ScaleWidth - 60 - cmdCancel.Width
  cmdOK.Left = cmdCancel.Left - 30 - cmdOK.Width
  
  
End Sub

Private Sub Form_Unload(Cancel As Integer)
Set fnd = Nothing
Set inst = Nothing
Set types = Nothing
End Sub

Private Sub gr_DblClick()

If gr.Row < 1 Then Exit Sub
If gr.RowIndex(gr.Row) < 1 Then Exit Sub
ok = True
ID = inst.Item(gr.RowIndex(gr.Row)).ID
Dim ref As Object
Set ref = Runner.GetInstanceObject(ID)
If Not ref Is Nothing Then
  Brief = ref.Brief
End If
Set Runner = Nothing
Me.Hide
End Sub


Private Sub gr_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyF5 Then
        cmdRefresh_Click
    End If
End Sub

Private Sub gr_KeyPress(KeyAscii As Integer)

  If gr.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fnd.FindOnPress KeyAscii
End Sub

Private Sub gr_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
  
  Dim i As Long
  
  Values(1) = inst.Item(RowIndex).Name
  Values(2) = inst.Item(RowIndex).Status
  
  Bookmark = inst.Item(RowIndex).ID
End Sub



'Allow Edit layout on Ctrl+Shift+Alt+F4
Private Function IsEditObject(KeyCode As Integer, Shift As Integer) As Boolean
Dim ShiftDown, AltDown, CtrlDown
ShiftDown = (Shift And vbShiftMask) > 0
AltDown = (Shift And vbAltMask) > 0
CtrlDown = (Shift And vbCtrlMask) > 0
IsEditObject = False
If KeyCode = vbKeyF4 Then
    If ShiftDown And CtrlDown And AltDown Then
        IsEditObject = True
    End If
End If
End Function
