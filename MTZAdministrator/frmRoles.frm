VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmRoles1 
   Caption         =   "Роли"
   ClientHeight    =   6285
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8475
   Icon            =   "frmRoles.frx":0000
   LinkTopic       =   "Роли"
   MDIChild        =   -1  'True
   ScaleHeight     =   6285
   ScaleWidth      =   8475
   Begin MTZ_PANEL.VFrames VFrames1 
      Height          =   6015
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   10610
      SpliterPosition =   1500
      Begin GridEX20.GridEX GridEXRole 
         Height          =   5535
         Left            =   0
         TabIndex        =   10
         Top             =   360
         Width           =   2775
         _ExtentX        =   4895
         _ExtentY        =   9763
         Version         =   "2.0"
         AutomaticSort   =   -1  'True
         BoundColumnIndex=   ""
         ReplaceColumnIndex=   ""
         MethodHoldFields=   -1  'True
         Options         =   8
         RecordsetType   =   1
         GroupByBoxVisible=   0   'False
         DataMode        =   99
         ColumnHeaderHeight=   285
         ColumnsCount    =   1
         Column(1)       =   "frmRoles.frx":000C
         FormatStylesCount=   6
         FormatStyle(1)  =   "frmRoles.frx":011C
         FormatStyle(2)  =   "frmRoles.frx":0278
         FormatStyle(3)  =   "frmRoles.frx":0328
         FormatStyle(4)  =   "frmRoles.frx":03DC
         FormatStyle(5)  =   "frmRoles.frx":04B4
         FormatStyle(6)  =   "frmRoles.frx":056C
         ImageCount      =   0
         PrinterProperties=   "frmRoles.frx":064C
      End
      Begin VB.PictureBox vpnROLES_USER_1 
         Height          =   5415
         Left            =   3000
         ScaleHeight     =   5355
         ScaleWidth      =   4875
         TabIndex        =   9
         Top             =   360
         Visible         =   0   'False
         Width           =   4935
      End
      Begin VB.PictureBox vpnROLES_DEF_1 
         Height          =   5415
         Left            =   3000
         ScaleHeight     =   5355
         ScaleWidth      =   4875
         TabIndex        =   8
         Top             =   360
         Visible         =   0   'False
         Width           =   4935
      End
      Begin VB.CommandButton cbAddNew 
         Height          =   330
         Left            =   0
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "NEW.ico"
         Top             =   0
         Width           =   330
      End
      Begin VB.PictureBox vpnROLES_WP_1 
         Height          =   5415
         Left            =   3000
         ScaleHeight     =   5355
         ScaleWidth      =   4875
         TabIndex        =   6
         Top             =   360
         Visible         =   0   'False
         Width           =   4935
      End
      Begin VB.CommandButton cbDelete 
         Height          =   330
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "DELETE.ico"
         Top             =   0
         Width           =   330
      End
      Begin VB.CommandButton cbProp 
         Height          =   330
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   0
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.PictureBox vpnROLES_MAP_1 
         Height          =   5415
         Left            =   3000
         ScaleHeight     =   5355
         ScaleWidth      =   4875
         TabIndex        =   3
         Top             =   360
         Visible         =   0   'False
         Width           =   4935
      End
      Begin VB.PictureBox vpnROLES_DOC_1 
         Height          =   5415
         Left            =   3000
         ScaleHeight     =   5355
         ScaleWidth      =   4875
         TabIndex        =   2
         Top             =   360
         Visible         =   0   'False
         Width           =   4935
      End
      Begin VB.PictureBox vpnROLES_REPORTS_1 
         Height          =   5415
         Left            =   3000
         ScaleHeight     =   5355
         ScaleWidth      =   4875
         TabIndex        =   1
         Top             =   360
         Width           =   4935
      End
      Begin MSComctlLib.TabStrip TabStrip1 
         Height          =   5895
         Left            =   2880
         TabIndex        =   11
         Top             =   0
         Width           =   5175
         _ExtentX        =   9128
         _ExtentY        =   10398
         _Version        =   393216
         BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
            NumTabs         =   5
            BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Группы"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Пользователи"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Приложения"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Документы"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Отчёты"
               ImageVarType    =   2
            EndProperty
         EndProperty
      End
   End
End
Attribute VB_Name = "frmRoles1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public rs As ADODB.Recordset
Public Manager As MTZManager.Main
Public Session As MTZSession.Session

Public IsFirstPaint As Boolean


Private objWPS As Collection

Private ROLES As Collection


Private Sub cbAddNew_Click()
Dim ID As String
Dim objRole As ROLES.Application
    ID = CreateGUID2
    Call Manager.NewInstance(ID, "ROLES", "Описание ролей")
    Set objRole = Manager.GetInstanceObject(ID)
    AddRoleToGrid objRole
    GridEXRole.Row = GridEXRole.ItemCount
End Sub

Private Sub cbDelete_Click()
'Dim objRole As ROLES.Application
'Dim objRolesGUI As ROLESGUI.GUI
'
'
'    If ROLES.Count > 0 Then
'        Set objRole = ROLES.item("Key" + CStr(GridEXRole.Row))
'        If MsgBox("Удалить " + objRole.Name, vbYesNo, "ПЭК Администратор") = vbYes Then
'            objRole.UnLockResource
'            Manager.UnLockInstanceObject (objRole.ID)
'            Manager.DeleteInstance (objRole.ID)
'            RefreshGrifd
'        End If
'    End If
End Sub

Private Sub cbProp_Click()
'Dim objRole As ROLES.Application
'Dim objRolesGUI As ROLESGUI.GUI
'
'
'    If ROLES.Count > 0 Then
'        Set objRole = ROLES.item("Key" + CStr(GridEXRole.Row))
'        Set objRolesGUI = Manager.GetInstanceGUI(objRole.ID, "")
'        Manager.LockInstanceObject (objRole.ID)
'        Call objRolesGUI.Show("", objRole)
'    End If
End Sub

Private Sub Form_Load()
    IsFirstPaint = True
    Set ROLES = New Collection
    
End Sub

Private Sub AddRoleToGrid(objRoles As ROLES.Application)
    ROLES.Add objRoles, "Key" + CStr(GridEXRole.ItemCount + 1)
    GridEXRole.ItemCount = GridEXRole.ItemCount + 1
End Sub

Private Sub RefreshGrifd()
    If rs Is Nothing Or Manager Is Nothing Or Session Is Nothing Then Exit Sub
    Dim i As Long
    Dim ID As String
    i = 0
    GridEXRole.ItemCount = 0
    DoEvents
    On Error Resume Next
    rs.Close
    Set rs = Nothing
    Set rs = Manager.ListInstances("", "ROLES")
    rs.MoveFirst
    Set ROLES = Nothing
    Set ROLES = New Collection
    On Error GoTo 0
    While Not rs.EOF
        i = i + 1
        Dim objRoles As ROLES.Application
        ID = rs!InstanceID
        Set objRoles = Manager.GetInstanceObject(ID)
        'Roles.Add objRoles, "Key" + CStr(i)
        AddRoleToGrid objRoles
        rs.Move 1
        'GridEXRole.ItemCount = i
        
    Wend
    GridEXRole.Rebind
    DoEvents
    GridEXRole_Click
    ChekSelected
End Sub

Private Sub Form_Paint()
    If IsFirstPaint Then
        IsFirstPaint = False
        LoadBtnPictures cbDelete, cbDelete.Tag
        LoadBtnPictures cbAddNew, cbAddNew.Tag
        LoadBtnPictures cbProp, cbProp.Tag
        RefreshGrifd
    End If
End Sub


Private Sub Form_Resize()
    If Width < 0 Or Height < 0 Then Exit Sub
    VFrames1.Width = Me.ScaleWidth
    VFrames1.Height = Me.ScaleHeight
    
End Sub

Private Sub Form_Unload(cancel As Integer)
    Set ROLES = Nothing
End Sub

Private Sub GridEXRole_AfterColEdit(ByVal ColIndex As Integer)
    GridEXRole_EndCustomEdit ColIndex
End Sub

Private Sub GridEXRole_Click()

'Dim objRole As ROLES.Application
'
'    If ROLES.Count > 0 Then
'        Set objRole = ROLES.item("Key" + CStr(GridEXRole.Row))
'        On Error Resume Next
'        On Error GoTo 0
'
'        'objRole.ROLES_WP.item(ID).ROLES_ACT.Filter = "WorkPlaceid='" + WPID + "'"
'        vpnROLES_USER_1.OnInit objRole
'        vpnROLES_USER_1.OnClick objRole, Me
'
'        vpnROLES_MAP_1.OnInit objRole
'        vpnROLES_MAP_1.OnClick objRole, Me
'
'        vpnROLES_DOC_1.OnInit objRole
'        vpnROLES_DOC_1.OnClick objRole, Me
'
'        vpnROLES_DEF_1.OnInit objRole
'        vpnROLES_DEF_1.OnClick objRole, Me
'
'        vpnROLES_WP_1.OnInit objRole
'        vpnROLES_WP_1.OnClick objRole, Me
'
'        vpnROLES_REPORTS_1.OnInit objRole
'        vpnROLES_REPORTS_1.OnClick objRole, Me
'
'        Dim objRWP As ROLES_WP
'        Dim i As Long
'        For i = 1 To objRole.ROLES_WP.Count
'            Set objRWP = objRole.ROLES_WP.item(i)
'            Dim objWP As MTZwp.Application
'            Set objWP = Manager.GetInstanceObject(objRWP.WP.ID)
'            If Not objWP Is Nothing Then
'                If Not objWP.WorkPlace.item(1) Is Nothing Then
'                    'If objWP.WorkPlace.item(1).EntryPoints.Count <> objRWP.ROLES_ACT.Count Then
'                        ' Загружаем меню
'                        LoadMenus objRWP, objWP
'                    'End If
'                End If
'
'            End If
'        Next
'
'    End If
End Sub

'Private Sub LoadLevelEP(objWPEP As MTZwp.EntryPoints_COL, objREP As Roles.ROLES_ACT_COL)
'Dim i As Long
'Dim objEP As Roles.ROLES_ACT
'Dim bChanged As Boolean
'    bChanged = False
'
'    For i = 1 To objWPEP.Count
'        objREP.Filter = "EntryPoints='" + objWPEP.item(i).ID + "'"
'        objREP.Refresh
'
'        If Not objREP.Count > 0 Then
'            Set objEP = objREP.Add(CreateGUID2)
'            Set objEP.EntryPoints = objWPEP.item(i) '.ID
'            objEP.Accesible = YesNo_Da
'            objEP.Save
'            bChanged = True
'        Else
'            Set objEP = objREP.item(1)
'        End If
'
'        If Not objEP Is Nothing Then
'            If objWPEP.item(i).EntryPoints.Count > 0 Then
'                LoadLevelEP objWPEP.item(i).EntryPoints, objEP.ROLES_ACT
'            End If
'        End If
'    Next
'
'    objREP.Filter = ""
'    objREP.Refresh
'    For i = objREP.Count To 1 Step -1
'        If objWPEP.item(objREP.item(i).EntryPoints.ID) Is Nothing Then
'            objREP.item(i).Delete
'            bChanged = True
'        End If
'    Next
'    If bChanged Then
'        objREP.Application.Save
'        objREP.Application.BatchUpdate
'    End If
'
'End Sub
Private Sub LoadLevelEP(objWPEP As MTZwp.EntryPoints_COL, objREP As ROLES.ROLES_ACT_COL)
Dim i As Long
Dim objEP As ROLES.ROLES_ACT
Dim bChanged As Boolean
    bChanged = False
    
    For i = 1 To objWPEP.Count
        objREP.Filter = "EntryPoints='" + objWPEP.item(i).ID + "'"
        objREP.Refresh
    
        If Not objREP.Count > 0 Then
            Set objEP = objREP.Add(CreateGUID2)
            Set objEP.EntryPoints = objWPEP.item(i) '.ID
            objEP.Accesible = YesNo_Da
            objEP.Save
            bChanged = True
        Else
            Set objEP = objREP.item(1)
        End If
        
        If Not objEP Is Nothing Then
            If objWPEP.item(i).EntryPoints.Count > 0 Then
                LoadLevelEP objWPEP.item(i).EntryPoints, objEP.ROLES_ACT
            End If
        End If
    Next
    
    objREP.Filter = ""
    objREP.Refresh
    For i = objREP.Count To 1 Step -1
        If Not objREP.item(i).EntryPoints Is Nothing Then
          If objWPEP.item(objREP.item(i).EntryPoints.ID) Is Nothing Then
              objREP.item(i).Delete
              bChanged = True
          End If
        Else
            objREP.item(i).Delete
            bChanged = True
        End If
    Next
    If bChanged Then
        objREP.Application.Save
        objREP.Application.BatchUpdate
    End If
    
End Sub
Private Sub LoadMenus(objRWP As ROLES.ROLES_WP, objWP As MTZwp.Application)
Dim i As Long
Dim objEP As ROLES.ROLES_ACT
Dim objWP2 As MTZwp.Application
Dim bChanged As Boolean
    bChanged = False
    LoadLevelEP objWP.EntryPoints, objRWP.ROLES_ACT
'    For i = 1 To objWP.WorkPlace.item(1).EntryPoints.Count
'        objRWP.ROLES_ACT.Filter = "EntryPoints='" + objWP.WorkPlace.item(1).EntryPoints.item(i).ID + "'"
'        objRWP.ROLES_ACT.Refresh
'        If Not objRWP.ROLES_ACT.Count > 0 Then
'            Set objEP = objRWP.ROLES_ACT.Add(CreateGUID2)
'            Set objEP.EntryPoints = objWP.WorkPlace.item(1).EntryPoints.item(i) '.ID
'            objEP.Accesible = YesNo_Da
'            objEP.Save
'            bChanged = True
'        Else
'            Set objEP = objRWP.ROLES_ACT.item(1)
'        End If
'        If Not objEP Is Nothing Then
'            If objWP.WorkPlace.item(1).EntryPoints.item(i).EntryPoints.Count > 0 Then
'                LoadLevelEP objWP.WorkPlace.item(1).EntryPoints.item(i).EntryPoints, objEP
'            End If
'        End If
'    Next
'    objRWP.ROLES_ACT.Filter = ""
'    objRWP.ROLES_ACT.Refresh
'    For i = objRWP.ROLES_ACT.Count To 1 Step -1
'        If objWP.WorkPlace.item(1).EntryPoints.item(objRWP.ROLES_ACT.item(i).EntryPoints.ID) Is Nothing Then
'            objRWP.ROLES_ACT.item(i).Delete
'            bChanged = True
'        End If
'    Next
'    If bChanged Then
'        objRWP.Save
'        objRWP.BatchUpdate
'    End If
End Sub

Private Sub GridEXRole_DblClick()
'
'Dim objRole As Roles.Application
'
'    If Roles.Count > 0 Then
'        Set objRole = Roles.item("Key" + CStr(GridEXRole.Row))
'        Dim objRolesGUI As ROLESGUI.GUI
'        Set objRolesGUI = Manager.GetInstanceGUI(objRole.ID, "")
'        On Error Resume Next
'        Call objRolesGUI.Show("", objRole)
'        On Error GoTo 0
'        vpnROLES_USER_1.OnClick objRole, Me
'    End If
End Sub

Private Function GEditItem()
Dim objRole As ROLES.Application
On Error GoTo ErrorExit
    If ROLES.Count > 0 Then
        Set objRole = ROLES.item("Key" + CStr(GridEXRole.Row))
        If objRole.Name <> GridEXRole.Value(GridEXRole.col) Then
            objRole.Name = GridEXRole.Value(GridEXRole.col)
            If objRole.ROLES_DEF.Count = 0 Then
                objRole.ROLES_DEF.Add CreateGUID2
            End If
            objRole.ROLES_DEF.item(1).Name = objRole.Name
            objRole.ROLES_DEF.item(1).Save
            objRole.Save
        End If
    End If
ErrorExit:
End Function

Private Sub GridEXRole_EndCustomEdit(ByVal ColIndex As Integer)
    GEditItem
End Sub

Private Sub GridEXRole_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal objRoles As GridEX20.JSRowData)
Dim objRole As ROLES.Application
    If ROLES.Count > 0 Then
        Set objRole = ROLES.item("Key" + CStr(RowIndex))
        objRole.ROLES_DEF.Refresh
        If objRole.ROLES_DEF.Count > 0 Then
            objRoles.Value(1) = objRole.ROLES_DEF.item(1).Name
        Else
            objRoles.Value(1) = objRole.Brief
        End If
        On Error Resume Next
        
        Debug.Print CStr(objRole.ROLES_DEF.Count)
        On Error GoTo 0
    End If
End Sub

Private Sub ChekSelected()
    Select Case TabStrip1.SelectedItem.Index
        Case 1:
            vpnROLES_MAP_1.Visible = True
            vpnROLES_USER_1.Visible = False
            vpnROLES_DOC_1.Visible = False
            vpnROLES_DEF_1.Visible = False
            vpnROLES_WP_1.Visible = False
            vpnROLES_REPORTS_1.Visible = False
        Case 2:
            vpnROLES_MAP_1.Visible = False
            vpnROLES_USER_1.Visible = True
            vpnROLES_DOC_1.Visible = False
            vpnROLES_DEF_1.Visible = False
            vpnROLES_WP_1.Visible = False
            vpnROLES_REPORTS_1.Visible = False
        Case 3:
            vpnROLES_MAP_1.Visible = False
            vpnROLES_USER_1.Visible = False
            vpnROLES_DOC_1.Visible = False
            vpnROLES_DEF_1.Visible = False
            vpnROLES_WP_1.Visible = True
            vpnROLES_REPORTS_1.Visible = False
        Case 4:
            vpnROLES_MAP_1.Visible = False
            vpnROLES_USER_1.Visible = False
            vpnROLES_DOC_1.Visible = True
            vpnROLES_DEF_1.Visible = False
            vpnROLES_WP_1.Visible = False
            vpnROLES_REPORTS_1.Visible = False
        Case 5:
            vpnROLES_MAP_1.Visible = False
            vpnROLES_USER_1.Visible = False
            vpnROLES_DOC_1.Visible = False
            vpnROLES_DEF_1.Visible = False
            vpnROLES_WP_1.Visible = False
            vpnROLES_REPORTS_1.Visible = True
    End Select
End Sub

Private Sub GridEXRole_Validate(cancel As Boolean)
    GEditItem
End Sub

Private Sub TabStrip1_Click()
    ChekSelected
End Sub

Private Sub VFrames1_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
    If Width < 0 Or Height < 0 Then Exit Sub
    GridEXRole.Width = Width
    GridEXRole.Height = IIf((Height - GridEXRole.Top - 120) > 0, (Height - GridEXRole.Top - 120), 0)
    
End Sub

Private Sub VFrames1_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
    If Width < 0 Or Height < 50 Then Exit Sub
    TabStrip1.Width = Width - 120
    TabStrip1.Height = Height - 120 ' - vpnROLES_MAP_1.Top
    TabStrip1.Left = Left
    
    vpnROLES_MAP_1.Width = Width - 120 - 100
    vpnROLES_MAP_1.Height = Height - vpnROLES_MAP_1.Top - 180
    vpnROLES_MAP_1.Left = Left + 50
    
    vpnROLES_USER_1.Width = Width - 120 - 100
    vpnROLES_USER_1.Height = Height - vpnROLES_MAP_1.Top - 180
    vpnROLES_USER_1.Left = Left + 50
    
    vpnROLES_DEF_1.Width = Width - 120 - 100
    vpnROLES_DEF_1.Height = Height - vpnROLES_MAP_1.Top - 180
    vpnROLES_DEF_1.Left = Left + 50
    
    vpnROLES_DOC_1.Width = Width - 120 - 100
    vpnROLES_DOC_1.Height = Height - vpnROLES_MAP_1.Top - 180
    vpnROLES_DOC_1.Left = Left + 50
    
    vpnROLES_WP_1.Width = Width - 120 - 100
    vpnROLES_WP_1.Height = Height - vpnROLES_MAP_1.Top - 180
    vpnROLES_WP_1.Left = Left + 50
    
    vpnROLES_REPORTS_1.Width = Width - 120 - 100
    vpnROLES_REPORTS_1.Height = Height - vpnROLES_MAP_1.Top - 180
    vpnROLES_REPORTS_1.Left = Left + 50

End Sub
