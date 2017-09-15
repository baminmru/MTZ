VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MTZFRConnector"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Base 0
Option Explicit

Private path As String
Private GetRowsCnt As Long
Private GetRowCnt As Long
Private mTempPath As String

Private ADOProvider As String


Private mAlias As String
Private mDataBaseName As String
Private mUserName As String
Private mServer As String
Private mPassword As String
Private mLoginTimeOut As Integer
Private msite As String
Private Integrated As Boolean
Public SymbolAt As String
Public FuncPrefix As String
Public ProcPrefix As String
Public KernelPrefix As String






'constructor
Private Sub Class_Initialize()
    On Error Resume Next
    path = MTZGetSetting("MTZ", "CONFIG", "XMLPATH", App.path & "\MTZ.XML")
End Sub

'destructor
Private Sub Class_Terminate()
On Error Resume Next
   
End Sub




Private Function BuildString(ByVal Server As String, ByVal DataBase As String, ByVal User As String, ByVal Pass As String, ByVal aLoginTimeOut As Integer, ByVal Integrated As Boolean) As String
  Dim mConnectString As String
  On Error GoTo bye
 
 
  
  If UCase(ADOProvider) = "SQLOLEDB" Then
    If Integrated Then
      mConnectString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=" + DataBase + ";Data Source=" + Server + ";Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=" + Server + ";Use Encryption for Data=False;Tag with column collation when possible=False"
    Else
      'mConnectString = "Provider=SQLOLEDB.1;User ID=" & User & ";Password=" & Pass & ";Persist Security Info=False;Initial Catalog=" + DataBase + ";Data Source=" + Server + ";Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=" + Server + ";Use Encryption for Data=False;Tag with column collation when possible=False"
      mConnectString = "Provider=SQLOLEDB.1;Password=" & Pass & ";Persist Security Info=True;User ID=" & User & ";Initial Catalog=" + DataBase + ";Data Source=" + Server + ";Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=" + Server + ";Use Encryption for Data=False;Tag with column collation when possible=False"
    End If
  Else
     
     mConnectString = "User ID=" & User & ";Password=" & Pass & ";Data Source=" & Server & ";Persist Security Info=False"
  End If
  
  BuildString = mConnectString
  
  Exit Function
bye:
  
  BuildString = ""
End Function


Public Sub GetFRConnectString(ByVal sSite As String, ByRef ConnectionString As String, ByRef Provider As String)
  site sSite
  ConnectionString = BuildString(mServer, mDataBaseName, mUserName, mPassword, mLoginTimeOut, Integrated)
  Provider = ADOProvider
End Sub

Private Sub site(ByVal s As String)
       
      On Error GoTo login_err
       Dim xdom As MSXML2.DOMDocument
       Dim i As Long
       Set xdom = New MSXML2.DOMDocument
       xdom.async = False
       xdom.Load path
       
       For i = 0 To xdom.lastChild.childNodes.Length - 1
         If UCase(xdom.lastChild.childNodes.item(i).Attributes.getNamedItem("Name").nodeValue) = UCase(s) Then
           With xdom.lastChild.childNodes.item(i).Attributes
              mServer = .getNamedItem("Server").nodeValue
              mDataBaseName = .getNamedItem("DB").nodeValue
              mUserName = .getNamedItem("USER").nodeValue
              mPassword = .getNamedItem("PASSWORD").nodeValue
              mLoginTimeOut = .getNamedItem("TIMEOUT").nodeValue
              ADOProvider = .getNamedItem("PROVIDER").nodeValue
              SymbolAt = .getNamedItem("AT").nodeValue
              Integrated = .getNamedItem("INTEGRATED").nodeValue
              FuncPrefix = .getNamedItem("FUNC").nodeValue
              ProcPrefix = .getNamedItem("PROC").nodeValue
              KernelPrefix = .getNamedItem("KERNEL").nodeValue
           End With
           Exit For
         End If
      Next
      Set xdom = Nothing
      
       
       
       
       Exit Sub
login_err:

End Sub


