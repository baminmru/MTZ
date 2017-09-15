Attribute VB_Name = "basSimple"
Option Explicit

' From "Visual Basic Language Developer's Handbook"
' by Ken Getz and Mike Gilbert
' Copyright 2000; Sybex, Inc. All rights reserved.

' Examples from Chapter 13

Private Declare Function Beep Lib "kernel32" (ByVal dwFreq As Long, ByVal dwDuration As Long) As Long

Private Declare Function MessageBeep Lib "user32" (ByVal wType As Long) As Long

Public Const MB_ICONHAND = &H10&
Public Const MB_ICONQUESTION = &H20&
Public Const MB_ICONEXCLAMATION = &H30&
Public Const MB_ICONASTERISK = &H40&

Public Const MB_ICONINFORMATION = MB_ICONASTERISK
Public Const MB_ICONSTOP = MB_ICONHAND

Public Declare Function PlaySound Lib "winmm.dll" Alias "PlaySoundA" (ByVal lpszSoundName As String, ByVal hMod As Long, ByVal uFlags As Long) As Long

Public Declare Function PlayResSound Lib "winmm.dll" Alias "PlaySoundA" (ByVal hRes As Long, ByVal hMod As Long, ByVal uFlags As Long) As Long

'  flag values for uFlags parameter
Public Const SND_SYNC = &H0             ' Play synchronously (default)
Public Const SND_ASYNC = &H1            ' Play asynchronously
Public Const SND_NODEFAULT = &H2        ' Don't play default sound if sound not found
Public Const SND_MEMORY = &H4           ' lpszSoundName points to a sound in memory

Public Const SND_LOOP = &H8             ' loop the sound until next sndPlaySound
Public Const SND_NOSTOP = &H10          ' don't stop any currently playing sound
Public Const SND_NOWAIT = &H2000        ' don't wait if the driver is busy

Public Const SND_ALIAS = &H10000        ' name is a WIN.INI [sounds] entry
Public Const SND_FILENAME = &H20000     ' name is a file name
Public Const SND_RESOURCE = &H40004     ' name is a resource name or atom
Public Const SND_ALIAS_ID = &H110000    ' name is a WIN.INI [sounds] entry identifier

Private Declare Function LoadLibraryEx Lib "kernel32" Alias "LoadLibraryExA" (ByVal lpLibFileName As String, ByVal hFile As Long, ByVal dwFlags As Long) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long

Const LOAD_LIBRARY_AS_DATAFILE = &H2

Private Declare Function FindResource Lib "kernel32" Alias "FindResourceA" (ByVal hInstance As Long, ByVal lpName As String, ByVal lpType As String) As Long
Private Declare Function LoadResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function LockResource Lib "kernel32" (ByVal hResData As Long) As Long
Private Declare Function FreeResource Lib "kernel32" (ByVal hResData As Long) As Boolean

Function dhMsgBeep(strMsg As String, Optional lngType As Long = 0, Optional strCaption As String = "") As Long

    ' Combines the Windows API MessageBeep function
    ' with the VBA MsgBox statement.

    ' From "Visual Basic Language Developer's Handbook"
    ' by Ken Getz and Mike Gilbert
    ' Copyright 2000; Sybex, Inc. All rights reserved.

    ' In:
    '   strMsg
    '       Message to display in dialog box.
    '   lngType (Optional, default = 0)
    '       Icon/Button types.
    '   strCaption (Optional, default = "")
    '       Caption for dialog.
    ' Out:
    '   Return Value:
    '       Result of normal MsgBox function.
    ' Example:
    '   lngResult = dhMsgBeep("Continue?", _
    '    vbQuestion Or vbYesNo)
 
    Dim lngSound As Long
    
    ' Get sound type
    lngSound = lngType And &HF0
    
    ' Play sound
    Call MessageBeep(lngSound)
 
    ' Show message box
    If strCaption = "" Then
        dhMsgBeep = MsgBox(strMsg, lngType)
    Else
        dhMsgBeep = MsgBox(strMsg, lngType, strCaption)
    End If
End Function

Function dhGetEventSound( _
 Optional strApp As String = ".Default", _
 Optional strEvent As String = ".Default", _
 Optional strScheme As String = ".Current") As String

    ' Retrieves the .WAV file associated with a
    ' given application event sound as defined in
    ' the Registry.

    ' From "Visual Basic Language Developer's Handbook"
    ' by Ken Getz and Mike Gilbert
    ' Copyright 2000; Sybex, Inc. All rights reserved.

    ' In:
    '   strApp (Optional, default = ".Default")
    '       Application name.
    '   strEvent (Optional, default = ".Default")
    '       Event name.
    '   strScheme (Optional, default = ".Current")
    '       Sound scheme name.
    ' Out:
    '   Return Value:
    '       Full path to the .WAV file.
    ' Example:
    '   strFile = dhGetEventSound("Quicken", "Open Program")
 
    Dim hKeySound As Long
    Dim strKeySound As String
    Dim lngResult As Long
    Dim strBuffer As String
    Dim cb As Long
    
    ' Build the key name
    strKeySound = "AppEvents\Schemes\Apps\" & _
     strApp & "\" & strEvent & "\" & strScheme
    
    ' Open the sound key
    lngResult = RegOpenKeyEx(dhcHKeyCurrentUser, _
     strKeySound, 0&, dhcKeyAllAccess, hKeySound)
    
    ' Make sure the call succeeded
    If lngResult = dhcSuccess Then
        
        ' Create the buffer
        strBuffer = Space(255)
        cb = Len(strBuffer)
        
        ' Read the default value
        lngResult = RegQueryValueEx(hKeySound, "", _
         0&, dhcRegSz, ByVal strBuffer, cb)
        
        ' Check return value
        If lngResult = dhcSuccess Then
            
            ' Return the value
            dhGetEventSound = Left(strBuffer, cb)
        End If
        
        ' Close the sound key
        lngResult = RegCloseKey(hKeySound)
    End If
End Function

Sub dhPlayQuickenSound()

    ' Demonstrates how to call dhGetEventSound.

    ' From "Visual Basic Language Developer's Handbook"
    ' by Ken Getz and Mike Gilbert
    ' Copyright 2000; Sybex, Inc. All rights reserved.

    ' In:
    '   n/a
    ' Out:
    '   n/a

    Dim strFile As String
    
    ' Get the name of the .WAV file
    strFile = dhGetEventSound("Quicken", "Open Program")
    
    ' Play the .WAV file if successful
    If strFile <> "" Then
        Call PlaySound(strFile, 0&, SND_FILENAME Or SND_NODEFAULT)
    End If
End Sub

Function dhPlayResource(strLibrary As String, _
 varResource As Variant, Optional lngFlags As Long = 0) _
 As Boolean

    ' Plays an embedded .WAV file (one that's compiled
    ' into a DLL or EXE file).

    ' From "Visual Basic Language Developer's Handbook"
    ' by Ken Getz and Mike Gilbert
    ' Copyright 2000; Sybex, Inc. All rights reserved.

    ' In:
    '   strLibrary
    '       Path to DLL or EXE file.
    '   varResource
    '       Name or numeric ID of resource.
    '   lngFlags (Optional, default = 0)
    '       Additional flags to PlaySound API function.
    ' Out:
    '   Return Value:
    '       True is sound was played, False if not.
    ' Note:
    '   DO NOT call this with the SND_ASYNC flag! (Unless,
    '   of course, you like getting IPFs.)
    ' Example:
    '   fOk = dhPlayResource( _
    '    "C:\Program Files\Microsoft Office\Office\MSACCESS.EXE", _
    '    800, 0)

    Dim hMod As Long
    Dim hRes As Long
    Dim lngRes As Long
    Dim fOk As Boolean
    
    ' Load the library as a data file
    hMod = LoadLibraryEx(strLibrary, 0&, _
     LOAD_LIBRARY_AS_DATAFILE)
    If hMod <> 0 Then
        
        ' If the resource is a number add the "#",
        ' otherwise just use it
        If IsNumeric(varResource) Then
            varResource = "#" & varResource
        End If
        
        ' Find the WAVE resource in the library
        lngRes = FindResource(hMod, CStr(varResource), "WAVE")
        If lngRes <> 0 Then
            ' Load the resoure
            hRes = LoadResource(hMod, lngRes)
            If hRes <> 0 Then
                ' Lock the resource and play it
                If CBool(LockResource(hRes)) Then
                    dhPlayResource = CBool(PlayResSound( _
                     hRes, 0&, SND_MEMORY Or lngFlags))
                End If
                ' Free the resource
                Call FreeResource(hRes)
            End If
        End If
        
        ' Free the library
        Call FreeLibrary(hMod)
    End If
End Function



