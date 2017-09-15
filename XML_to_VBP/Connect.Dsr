VERSION 5.00
Begin {AC0714F6-3D04-11D1-AE7D-00A0C90F26F4} Connect 
   ClientHeight    =   9495
   ClientLeft      =   1740
   ClientTop       =   1545
   ClientWidth     =   10605
   _ExtentX        =   18706
   _ExtentY        =   16748
   _Version        =   393216
   Description     =   "Metacode convertor"
   DisplayName     =   "Murometz Project package convertor"
   AppName         =   "Visual Basic"
   AppVer          =   "Visual Basic 6.0"
   LoadName        =   "Command Line / Startup"
   LoadBehavior    =   5
   RegLocation     =   "HKEY_CURRENT_USER\Software\Microsoft\Visual Basic\6.0"
   CmdLineSafe     =   -1  'True
   CmdLineSupport  =   -1  'True
End
Attribute VB_Name = "Connect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"AddInDesigner"
Option Explicit

Public FormDisplayed          As Boolean
Public VBInstance             As VBIDE.VBE
Dim mcbMenuCommandBar         As Office.CommandBarControl

Public WithEvents MenuHandler As CommandBarEvents          'command bar event handler
Attribute MenuHandler.VB_VarHelpID = -1

Sub Run()
    On Error Resume Next
    Set mVBInstance = VBInstance
    Set mConnect = Me
    ConvertIt
    'ConvertIt "Quit"
End Sub

Private Sub AddinInstance_Initialize()
  'ConvertIt '!!!
End Sub

Private Sub AddinInstance_OnAddInsUpdate(custom() As Variant)
 'ConvertIt "OnAddInsUpdate"
End Sub

'------------------------------------------------------
'this method adds the Add-In to VB
'------------------------------------------------------
Private Sub AddinInstance_OnConnection(ByVal Application As Object, ByVal ConnectMode As AddInDesignerObjects.ext_ConnectMode, ByVal AddInInst As Object, custom() As Variant)
    On Error GoTo error_handler
    
    'save the vb instance
    Set VBInstance = Application
    
    'this is a good place to set a breakpoint and
    'test various addin objects, properties and methods
    'Debug.Print VBInstance.FullName

    'ConvertIt "OnConnection"

    
    If ConnectMode = ext_cm_External Then
        'Used by the wizard toolbar to start this wizard
        'Me.Run
    Else
        Set mcbMenuCommandBar = AddToAddInCommandBar("Convert MTZ project package to VB Project")
        'sink the event
        Set Me.MenuHandler = VBInstance.Events.CommandBarEvents(mcbMenuCommandBar)
    End If
  
    If ConnectMode = ext_cm_AfterStartup Then
       'Me.Run
    End If
    
    
    If ConnectMode = ext_cm_Startup Then
           'Me.Run -- call on startup !!!
    End If
    
    Exit Sub
    
error_handler:
    
    MsgBox Err.Description
    
End Sub

'------------------------------------------------------
'this method removes the Add-In from VB
'------------------------------------------------------
Private Sub AddinInstance_OnDisconnection(ByVal RemoveMode As AddInDesignerObjects.ext_DisconnectMode, custom() As Variant)
    On Error Resume Next
    mcbMenuCommandBar.Delete
    SaveSetting App.Title, "Settings", "DisplayOnConnect", "1"
End Sub

Private Sub IDTExtensibility_OnStartupComplete(custom() As Variant)
    If GetSetting(App.Title, "Settings", "DisplayOnConnect", "0") = "1" Then
        'set this to display the form on connect
        Me.Run
    End If
End Sub

Private Sub AddinInstance_OnStartupComplete(custom() As Variant)
 
 'ConvertIt
 
End Sub

Private Sub AddinInstance_Terminate()
'ConvertIt
End Sub

'this event fires when the menu is clicked in the IDE
Private Sub MenuHandler_Click(ByVal CommandBarControl As Object, handled As Boolean, CancelDefault As Boolean)
    Me.Run
End Sub

Function AddToAddInCommandBar(sCaption As String) As Office.CommandBarControl
    Dim cbMenuCommandBar As Office.CommandBarControl  'command bar object
    Dim cbMenu As Object
  
    On Error GoTo AddToAddInCommandBarErr
    
    'see if we can find the Add-Ins menu
    Set cbMenu = VBInstance.CommandBars("Add-Ins")
    If cbMenu Is Nothing Then
        'not available so we fail
        Exit Function
    End If
    
    'add it to the command bar
    Set cbMenuCommandBar = cbMenu.Controls.Add(1)
    'set the caption
    cbMenuCommandBar.Caption = sCaption
    
    Set AddToAddInCommandBar = cbMenuCommandBar
    
    Exit Function
    
AddToAddInCommandBarErr:

End Function

