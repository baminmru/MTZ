VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmMSSQL2MTZ 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MS SQL -> Model"
   ClientHeight    =   7320
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8640
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7320
   ScaleWidth      =   8640
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame3 
      Caption         =   "Import CFG"
      Height          =   6855
      Left            =   4440
      TabIndex        =   14
      Top             =   240
      Width           =   3975
      Begin MSComctlLib.ProgressBar pb 
         Height          =   375
         Left            =   120
         TabIndex        =   22
         Top             =   3240
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   661
         _Version        =   393216
         Appearance      =   1
      End
      Begin VB.TextBox txtLog 
         Height          =   2535
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   21
         Top             =   4200
         Width           =   3735
      End
      Begin VB.CommandButton cmdStart 
         Caption         =   "Start"
         Height          =   375
         Left            =   120
         TabIndex        =   19
         Top             =   2640
         Width           =   3615
      End
      Begin VB.TextBox txtIgnore 
         Height          =   1215
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   18
         Top             =   1320
         Width           =   3615
      End
      Begin VB.TextBox txtAppName 
         Height          =   285
         Left            =   1920
         TabIndex        =   16
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label Label7 
         Caption         =   "Result"
         Height          =   375
         Left            =   120
         TabIndex        =   20
         Top             =   3840
         Width           =   1935
      End
      Begin VB.Label Label6 
         Caption         =   "Ignore fields ( coma del. list)"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   960
         Width           =   3615
      End
      Begin VB.Label Label5 
         Caption         =   "Application Name"
         Height          =   375
         Left            =   120
         TabIndex        =   15
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Tables To Import"
      Height          =   4455
      Left            =   120
      TabIndex        =   6
      Top             =   2640
      Width           =   4215
      Begin VB.CommandButton cmdNone 
         Caption         =   "None"
         Height          =   375
         Left            =   2520
         TabIndex        =   13
         Top             =   3960
         Width           =   1335
      End
      Begin VB.CommandButton cmdAll 
         Caption         =   "All"
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   3960
         Width           =   1215
      End
      Begin VB.ListBox lstTables 
         Height          =   3435
         Left            =   120
         Style           =   1  'Checkbox
         TabIndex        =   11
         Top             =   360
         Width           =   3855
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Connect info"
      Height          =   2415
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4215
      Begin VB.TextBox txtPassword 
         Height          =   285
         Left            =   1560
         TabIndex        =   10
         Text            =   "bami"
         Top             =   1320
         Width           =   2535
      End
      Begin VB.TextBox txtUser 
         Height          =   285
         Left            =   1560
         TabIndex        =   9
         Text            =   "sa"
         Top             =   960
         Width           =   2535
      End
      Begin VB.TextBox txtDB 
         Height          =   285
         Left            =   1560
         TabIndex        =   8
         Text            =   "deposys"
         Top             =   600
         Width           =   2535
      End
      Begin VB.TextBox txtSrv 
         Height          =   285
         Left            =   1560
         TabIndex        =   7
         Text            =   "baminote"
         Top             =   240
         Width           =   2535
      End
      Begin VB.CommandButton cmdConnect 
         Caption         =   "Connect"
         Height          =   375
         Left            =   2040
         TabIndex        =   5
         Top             =   1920
         Width           =   2055
      End
      Begin VB.Label Label4 
         Caption         =   "Password"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   1320
         Width           =   1455
      End
      Begin VB.Label Label3 
         Caption         =   "User"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   960
         Width           =   1455
      End
      Begin VB.Label Label2 
         Caption         =   "Database"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   600
         Width           =   1455
      End
      Begin VB.Label Label1 
         Caption         =   "Server"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1455
      End
   End
End
Attribute VB_Name = "frmMSSQL2MTZ"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mADOConnection As ADODB.Connection
Private myapp As mtzApp

Private Function ADOLogin(ByVal Server As String, ByVal DataBase As String, ByVal User As String, ByVal Pass As String, ByVal aLoginTimeOut As Integer, ByVal Integrated As Boolean) As Boolean
  Dim mConnectString As String
  On Error GoTo bye
  ADOLogin = False
  Set mADOConnection = New ADODB.Connection
  
  If Integrated Then
    mConnectString = "Server=" + Server + ";DataBase=" + DataBase + ";Trusted_Connection=yes"
  Else
    mConnectString = "Server=" + Server + ";DataBase=" + DataBase + ";UID=" + User + ";Pwd=" + Pass + ";"
  End If
  
  mADOConnection.Provider = "sqloledb"
  mADOConnection.ConnectionTimeout = aLoginTimeOut
  mADOConnection.CommandTimeout = aLoginTimeOut
  Call mADOConnection.Open(mConnectString)
  ADOLogin = (mADOConnection.State = adStateOpen)
  Exit Function
bye:
   Err.Raise Err.Number, Err.Source, Err.Description
End Function


Private Sub logErr()
    If Err.Number <> 0 Then
    txtLog = Err.Description & vbCrLf & txtLog
    Err.Clear
    End If
End Sub

Private Sub cmdAll_Click()
Dim i As Long
For i = 0 To lstTables.ListCount - 1
lstTables.Selected(i) = True
Next
End Sub

Private Sub cmdConnect_Click()
On Error Resume Next
    ADOLogin txtSrv.Text, txtDB.Text, txtUser.Text, txtPassword.Text, 200, 200
    logErr
    Dim cmd As ADODB.Command
    Dim rs As ADODB.Recordset
    Set cmd = New ADODB.Command
    Set cmd.ActiveConnection = mADOConnection
    cmd.CommandType = adCmdText
    cmd.CommandText = "select * from INFORMATION_SCHEMA.TABLES where table_type='BASE TABLE'"
    Set rs = cmd.Execute()
    logErr
    If Not rs Is Nothing Then
        lstTables.Clear
        While Not rs.EOF
            lstTables.AddItem rs!table_name
            rs.MoveNext
        Wend
        rs.Close
        Set rs = Nothing
    End If
    
End Sub





Private Function MapSQLTyptToMTZ(ByVal SQLType As String) As String
    Select Case LCase(SQLType)
        Case "int"
            MapSQLTyptToMTZ = "Integer"
        Case "smallint"
            MapSQLTyptToMTZ = "Integer"
        Case "bit"
            MapSQLTyptToMTZ = "Boolean"
        Case "datetime"
         MapSQLTyptToMTZ = "DateTime"
         
        Case "numeric"
         MapSQLTyptToMTZ = "Numeric"
         
        Case "float"
         MapSQLTyptToMTZ = "Numeric"
        Case "currency"
         MapSQLTyptToMTZ = "Numeric"
        Case "uniqueidentifier"
         MapSQLTyptToMTZ = "ID"
        Case "image"
        MapSQLTyptToMTZ = "Image"
        
        Case "nvarchar"
            MapSQLTyptToMTZ = "String"
        Case "text"
         MapSQLTyptToMTZ = "Memo"
        Case "timestamp"
         MapSQLTyptToMTZ = "DateTime"
        Case "tinyint"
         MapSQLTyptToMTZ = "Integer"
        Case "varchar"
         MapSQLTyptToMTZ = "String"
         
        Case "char"
         MapSQLTyptToMTZ = "String"
         Case Else
         MsgBox "Unknown SQL Type"
         'Stop
    End Select

End Function

Private Function FldTypeFromName(ByVal Name As String) As MTZMetaModel.FIELDTYPE
    Dim i As Long
    For i = 1 To model.FIELDTYPE.Count
        If model.FIELDTYPE.item(i).Name = Name Then
            Set FldTypeFromName = model.FIELDTYPE.item(i)
            Exit Function
        End If
    Next
    MsgBox "Unknown MTZ Field Type " & Name
    Stop
End Function

Private Function MtzAppFromName(ByVal Name As String) As MTZMetaModel.mtzApp
    Dim i As Long
    For i = 1 To model.mtzApp.Count
        If model.mtzApp.item(i).Name = Name Then
            Set MtzAppFromName = model.mtzApp.item(i)
            Exit Function
        End If
    Next
  
End Function

Private Function MtzTypeFromName(ByVal Name As String) As MTZMetaModel.objectType
    Dim i As Long
    For i = 1 To model.objectType.Count
        If model.objectType.item(i).Name = Name Then
            Set MtzTypeFromName = model.objectType.item(i)
            Exit Function
        End If
    Next
    MsgBox "Unknown MTZ Type " & Name
    Stop
End Function

Private Sub cmdNone_Click()
    Dim i As Long
    For i = 0 To lstTables.ListCount - 1
    lstTables.Selected(i) = True
    Next
End Sub

Private Sub cmdStart_Click()
  
   
    Set myapp = MtzAppFromName(txtAppName)
    If myapp Is Nothing Then
        Set myapp = model.mtzApp.Add
        myapp.Name = txtAppName
        myapp.Save
    End If
    Dim i As Long
    pb.max = lstTables.ListCount * 2
    pb.Value = 0
    For i = 0 To lstTables.ListCount - 1
        pb.Value = pb.Value + 1
        If lstTables.Selected(i) = True Then
            Importtable (lstTables.List(i))
        End If
    Next
    
    For i = 0 To lstTables.ListCount - 1
        pb.Value = pb.Value + 1
        If lstTables.Selected(i) = True Then
            ImportTabFields (lstTables.List(i))
        End If
    Next
    
End Sub


Private Sub ImportTabFields(ByVal tname As String)
    Dim cmd As ADODB.Command
    Dim rs As ADODB.Recordset
   
    Dim p As PART
    Set p = PartByName(tname)
    If p Is Nothing Then Exit Sub
    
    
    Set cmd = New ADODB.Command
    Set cmd.ActiveConnection = mADOConnection
    cmd.CommandType = adCmdText
    
    
    'select * from INFORMATION_SCHEMA.COLUMNS where table_name='ACCNTHIS' and column_name not in ('Ident') order by ordinal_position
    cmd.CommandText = "select * from INFORMATION_SCHEMA.COLUMNS where table_name='" & tname & "' " & _
    " and column_name not in ('Ident') " & _
    " order by ordinal_position"
    Set rs = cmd.Execute()
     logErr
    If Not rs Is Nothing Then
        
        While Not rs.EOF
          
            Call ImportField(p, rs!Column_name, rs!data_type, "0" & rs!character_octet_length, rs!is_nullable)
            rs.MoveNext
        Wend
        rs.Close
        Set rs = Nothing
    End If
End Sub
Private Sub Importtable(ByVal tname As String)

    On Error Resume Next
    Dim cmd As ADODB.Command
    Dim rs As ADODB.Recordset
    Dim t As objectType
    Dim p As PART
    Set t = model.objectType.Add
    With t
        .Name = "t_" & tname
        .the_comment = "t_" & tname
        .TheComment = "t_" & tname
        Set .package = myapp
        .Save
    End With
    
    
    Set p = t.PART.Add
    With p
     .sequence = 1
     .Name = tname
     .the_comment = tname
     .Caption = tname
     .PartType = enumPartType.PartType_Kollekciy
     .Save
    End With
    
    
    
    
End Sub


Private Function PartByName(ByVal pname As String, Optional ByVal postfix As String = "") As MTZMetaModel.PART
    Dim cmd As ADODB.Command
    Dim rs As ADODB.Recordset
    Dim p As PART
    
    Set rs = Session.GetData("select partid from part where name like '" & pname & postfix & "'  select * from part where name like 'part%' order by len(name)")
    logErr
    If Not rs Is Nothing Then
        
        If Not rs.EOF Then
            Set PartByName = model.FindRowObject("PART", rs!partid)
        End If
        rs.Close
        Set rs = Nothing
    End If
End Function

Private Sub ImportField(p As PART, ByVal cname As String, ByVal dt As String, ByVal sleng As String, ByVal isnullable As String)
    Dim fld As MTZMetaModel.Field
    Set fld = p.Field.Add
    
    With fld
        .sequence = p.Field.Count
        .Name = cname
        .TheComment = cname
        .Caption = cname
        
        Set .FIELDTYPE = FldTypeFromName(MapSQLTyptToMTZ(dt))
        .ReferenceType = ReferenceType_Skalyrnoe_pole_OPN_ne_ssilkaCLS
         
         If MapSQLTyptToMTZ(dt) = "Integer" Then
             If LCase(Right(cname, 2)) = "id" Then
                Set .FIELDTYPE = FldTypeFromName("Reference")
                .ReferenceType = ReferenceType_Na_stroku_razdela
                Set .RefToPart = PartByName(left(cname, Len(cname) - 2), "%")
             End If
         End If
         
            
            If isnullable = "Yes" Then
                .AllowNull = Boolean_Da
            Else
                .AllowNull = Boolean_Net
            End If
            If p.Field.Count < 3 Then
                .IsBrief = Boolean_Da
            End If
        .DataSize = Val(sleng)
        
        
        
        .Save
    End With
        
        

End Sub
