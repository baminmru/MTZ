VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3525
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   2775
   LinkTopic       =   "Form1"
   ScaleHeight     =   3525
   ScaleWidth      =   2775
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtSite 
      Height          =   285
      Left            =   240
      TabIndex        =   4
      Top             =   2040
      Width           =   2295
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Modify SQL query"
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   2400
      Width           =   2295
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Design report"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   3000
      Width           =   2295
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Load report"
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   360
      Width           =   2295
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Show report"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   960
      Width           =   2295
   End
   Begin VB.Label Label1 
      Caption         =   "Site"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   1800
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim WithEvents frx As FastReport.TfrxReport
Attribute frx.VB_VarHelpID = -1

' This type requird for FileOpenDialog
Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Type OPENFILENAME
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type

' Show report
Private Sub Command1_Click()
    Rem frx.PreviewOptions.Buttons = pb_Export + pb_Zoom
    frx.ShowReport
End Sub

' Load report dialog
Private Sub Command2_Click()
    Dim OFName As OPENFILENAME
    OFName.lStructSize = Len(OFName)
    OFName.lpstrFilter = "FR3 files (*.fr3)" + Chr$(0) + "*.fr3" + Chr$(0) + "All Files (*.*)" + Chr$(0) + "*.*" + Chr$(0)
    OFName.lpstrFile = Space$(254)
    OFName.nMaxFile = 255
    OFName.lpstrFileTitle = Space$(254)
    OFName.nMaxFileTitle = 255
    'OFName.lpstrInitialDir = "C:\"
    OFName.lpstrTitle = "Open report file"
    OFName.flags = 0
    frx.DisableDialogs = True
    If GetOpenFileName(OFName) Then
        'MsgBox "File to Open: " + Trim$(OFName.lpstrFile)
        frx.LoadReportFromFile (Trim$(OFName.lpstrFile))
    Else
        'MsgBox "Cancel was pressed"
    End If
    
End Sub

' Run report designer
Private Sub Command3_Click()
    frx.DesignReport
End Sub

' Modify SQL query
Private Sub Command4_Click()
    Dim query_obj As TfrxADOQuery
    Dim database_obj As TfrxADODatabase
    Dim frConn As MTZFRConnector.ConnectInfo
    Set frConn = New ConnectInfo
    Dim cn As String, prv As String
    
     
    frConn.GetFRConnectString txtSite.Text, cn, prv
    
    ' Find database object
    If cn <> "" Then
    Set database_obj = frx.FindObject("database")
      If database_obj Is Nothing Then
          MsgBox "ADO connection object 'Database' not found"
      Else
          Debug.Print Trim$(database_obj.ConnectionString)
          database_obj.Connected = False
          database_obj.LoginPrompt = False
          database_obj.ConnectionString = cn
          
          ' Find query object
          'Set query_obj = frx.FindObject("query")
      
             

          database_obj.Connected = True
          Debug.Print Trim$(database_obj.ConnectionString)
          
          
          
      End If
    End If
    

    
    Set query_obj = Nothing
    Set database_obj = Nothing
End Sub

' Startup code - initialize FR server
Private Sub Form_Load()
    Set frx = CreateObject("FastReport.TfrxReport")
    frx.EngineOptions.SilentMode = simMessageBoxes
End Sub

' Clean resources
Private Sub Form_Unload(Cancel As Integer)
    Set frx = Nothing
End Sub
