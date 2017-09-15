Attribute VB_Name = "basMCIBase"
Option Explicit

' Media Control Interface (MCI) constant declarations

Public Const MCI_FIRST = &H800
'  Messages &H801 and &H802 are reserved
Public Const MCI_OPEN = &H803
Public Const MCI_CLOSE = &H804
Public Const MCI_ESCAPE = &H805
Public Const MCI_PLAY = &H806
Public Const MCI_SEEK = &H807
Public Const MCI_STOP = &H808
Public Const MCI_PAUSE = &H809
Public Const MCI_INFO = &H80A
Public Const MCI_GETDEVCAPS = &H80B
Public Const MCI_SPIN = &H80C
Public Const MCI_SET = &H80D
Public Const MCI_STEP = &H80E
Public Const MCI_RECORD = &H80F
Public Const MCI_SYSINFO = &H810
Public Const MCI_BREAK = &H811
Public Const MCI_SOUND = &H812
Public Const MCI_SAVE = &H813
Public Const MCI_STATUS = &H814
Public Const MCI_CUE = &H830
Public Const MCI_RESUME = &H855

Public Const MCI_REALIZE = &H840
Public Const MCI_WINDOW = &H841
Public Const MCI_PUT = &H842
Public Const MCI_WHERE = &H843
Public Const MCI_FREEZE = &H844
Public Const MCI_UNFREEZE = &H845

Public Const MCI_LOAD = &H850
Public Const MCI_CUT = &H851
Public Const MCI_COPY = &H852
Public Const MCI_PASTE = &H853
Public Const MCI_UPDATE = &H854
'Public Const MCI_RESUME = &H855
Public Const MCI_DELETE = &H856

Public Const MCI_LAST = &HFFF

Public Const MCI_ALL_DEVICE_ID = -1   '  Matches all MCI devices

' Common flags for lngFlags parameter of MCI command messages
Public Const MCI_NOTIFY = &H1&
Public Const MCI_WAIT = &H2&
Public Const MCI_FROM = &H4&
Public Const MCI_TO = &H8&
Public Const MCI_TRACK = &H10&

' Flags for lngFlags parameter of MCI_OPEN command message
Public Const MCI_OPEN_SHAREABLE = &H100&
Public Const MCI_OPEN_ELEMENT = &H200&
Public Const MCI_OPEN_ALIAS = &H400&
Public Const MCI_OPEN_ELEMENT_ID = &H800&
Public Const MCI_OPEN_TYPE_ID = &H1000&
Public Const MCI_OPEN_TYPE = &H2000&

'  flags for dwFlags parameter of MCI_SAVE command message
Public Const MCI_SAVE_FILE = &H100&


' Flags for dwFlags parameter of MCI_SEEK command message
Public Const MCI_SEEK_TO_START = &H100&
Public Const MCI_SEEK_TO_END = &H200&

' Flags for lngFlags parameter of MCI_INFO command message
Public Const MCI_INFO_PRODUCT = &H100&
Public Const MCI_INFO_FILE = &H200&
Public Const MCI_INFO_MEDIA_UPC = &H400&
Public Const MCI_INFO_MEDIA_IDENTITY = &H800&
Public Const MCI_INFO_NAME = &H1000&
Public Const MCI_INFO_COPYRIGHT = &H2000&

'  flags for lngFlags parameter of MCI_STATUS command message
Public Const MCI_STATUS_ITEM = &H100&
Public Const MCI_STATUS_START = &H200&

'  flags for lngItem field of the MCI_STATUS_PARMS parameter block
Public Const MCI_STATUS_LENGTH = &H1&
Public Const MCI_STATUS_POSITION = &H2&
Public Const MCI_STATUS_NUMBER_OF_TRACKS = &H3&
Public Const MCI_STATUS_MODE = &H4&
Public Const MCI_STATUS_MEDIA_PRESENT = &H5&
Public Const MCI_STATUS_TIME_FORMAT = &H6&
Public Const MCI_STATUS_READY = &H7&
Public Const MCI_STATUS_CURRENT_TRACK = &H8&

' Flags for lngFlags parameter of MCI_SET command message
Public Const MCI_SET_DOOR_OPEN = &H100&
Public Const MCI_SET_DOOR_CLOSED = &H200&
Public Const MCI_SET_TIME_FORMAT = &H400&
Public Const MCI_SET_AUDIO = &H800&
Public Const MCI_SET_VIDEO = &H1000&
Public Const MCI_SET_ON = &H2000&
Public Const MCI_SET_OFF = &H4000&

' Return values for 'status mode' command
Public Const MCI_STRING_OFFSET = 512
Public Const MCI_MODE_NOT_READY = (MCI_STRING_OFFSET + 12)
Public Const MCI_MODE_STOP = (MCI_STRING_OFFSET + 13)
Public Const MCI_MODE_PLAY = (MCI_STRING_OFFSET + 14)
Public Const MCI_MODE_RECORD = (MCI_STRING_OFFSET + 15)
Public Const MCI_MODE_SEEK = (MCI_STRING_OFFSET + 16)
Public Const MCI_MODE_PAUSE = (MCI_STRING_OFFSET + 17)
Public Const MCI_MODE_OPEN = (MCI_STRING_OFFSET + 18)

'  Constants used in 'set time format' and 'status time format' commands
Public Const MCI_FORMAT_MILLISECONDS = 0
Public Const MCI_FORMAT_HMS = 1
Public Const MCI_FORMAT_MSF = 2
Public Const MCI_FORMAT_FRAMES = 3
Public Const MCI_FORMAT_SMPTE_24 = 4
Public Const MCI_FORMAT_SMPTE_25 = 5
Public Const MCI_FORMAT_SMPTE_30 = 6
Public Const MCI_FORMAT_SMPTE_30DROP = 7
Public Const MCI_FORMAT_BYTES = 8
Public Const MCI_FORMAT_SAMPLES = 9
Public Const MCI_FORMAT_TMSF = 10

'  flags for dwFlags parameter of MCI_RECORD command message
Public Const MCI_RECORD_INSERT = &H100&
Public Const MCI_RECORD_OVERWRITE = &H200&

Public Const WAVE_FORMAT_PCM = 1
'  flags for the dwFlags parameter of MCI_OPEN command message
Public Const MCI_WAVE_OPEN_BUFFER = &H10000

'  flags for the dwFlags parameter of MCI_SET command message
Public Const MCI_WAVE_SET_FORMATTAG = &H10000
Public Const MCI_WAVE_SET_CHANNELS = &H20000
Public Const MCI_WAVE_SET_SAMPLESPERSEC = &H40000
Public Const MCI_WAVE_SET_AVGBYTESPERSEC = &H80000
Public Const MCI_WAVE_SET_BLOCKALIGN = &H100000
Public Const MCI_WAVE_SET_BITSPERSAMPLE = &H200000

'  flags for the dwFlags parameter of MCI_STATUS, MCI_SET command messages
Public Const MCI_WAVE_INPUT = &H400000
Public Const MCI_WAVE_OUTPUT = &H800000

'  flags for the dwItem field of MCI_STATUS_PARMS parameter block
Public Const MCI_WAVE_STATUS_FORMATTAG = &H4001&
Public Const MCI_WAVE_STATUS_CHANNELS = &H4002&
Public Const MCI_WAVE_STATUS_SAMPLESPERSEC = &H4003&
Public Const MCI_WAVE_STATUS_AVGBYTESPERSEC = &H4004&
Public Const MCI_WAVE_STATUS_BLOCKALIGN = &H4005&
Public Const MCI_WAVE_STATUS_BITSPERSAMPLE = &H4006&
Public Const MCI_WAVE_STATUS_LEVEL = &H4007&

'  flags for the dwFlags parameter of MCI_SET command message
Public Const MCI_WAVE_SET_ANYINPUT = &H4000000
Public Const MCI_WAVE_SET_ANYOUTPUT = &H8000000

'  flags for the dwFlags parameter of MCI_GETDEVCAPS command message
Public Const MCI_WAVE_GETDEVCAPS_INPUTS = &H4001&
Public Const MCI_WAVE_GETDEVCAPS_OUTPUTS = &H4002&

'  flags for lngFlags parameter of MCI_OPEN command message
Public Const MCI_OVLY_OPEN_WS = &H10000
Public Const MCI_OVLY_OPEN_PARENT = &H20000

'  flags for lngFlags parameter of MCI_STATUS command message
Public Const MCI_OVLY_STATUS_HWND = &H4001&
Public Const MCI_OVLY_STATUS_STRETCH = &H4002&

'  flags for lngFlags parameter of MCI_INFO command message
Public Const MCI_OVLY_INFO_TEXT = &H10000

'  flags for lngItem field of MCI_GETDEVCAPS_PARMS parameter block
Public Const MCI_OVLY_GETDEVCAPS_CAN_STRETCH = &H4001&
Public Const MCI_OVLY_GETDEVCAPS_CAN_FREEZE = &H4002&
Public Const MCI_OVLY_GETDEVCAPS_MAX_WINDOWS = &H4003&

'  flags for lngFlags parameter of MCI_WINDOW command message
Public Const MCI_OVLY_WINDOW_HWND = &H10000
Public Const MCI_OVLY_WINDOW_STATE = &H40000
Public Const MCI_OVLY_WINDOW_TEXT = &H80000
Public Const MCI_OVLY_WINDOW_ENABLE_STRETCH = &H100000
Public Const MCI_OVLY_WINDOW_DISABLE_STRETCH = &H200000

'  flags for hWnd parameter of MCI_OVLY_WINDOW_PARMS parameter block
Public Const MCI_OVLY_WINDOW_DEFAULT = &H0&

'  flags for lngFlags parameter of MCI_PUT command message
Public Const MCI_OVLY_RECT = &H10000
Public Const MCI_OVLY_PUT_SOURCE = &H20000
Public Const MCI_OVLY_PUT_DESTINATION = &H40000
Public Const MCI_OVLY_PUT_FRAME = &H80000
Public Const MCI_OVLY_PUT_VIDEO = &H100000

'  flags for lngFlags parameter of MCI_WHERE command message
Public Const MCI_OVLY_WHERE_SOURCE = &H20000
Public Const MCI_OVLY_WHERE_DESTINATION = &H40000
Public Const MCI_OVLY_WHERE_FRAME = &H80000
Public Const MCI_OVLY_WHERE_VIDEO = &H100000

' Media Control Interface (MCI) data types

Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Type MCI_GENERIC_PARMS
    lngCallback As Long
End Type

Type MCI_OPEN_PARMS
    lngCallback As Long
    lngDeviceID As Long
    strDeviceType As String
    strElementName As String
    strAlias As String
End Type

Public Type MCI_PLAY_PARMS
    lngCallback As Long
    lngFrom As Long
    lngTo As Long
End Type

Type MCI_SEEK_PARMS
    lngCallback As Long
    lngTo As Long
End Type

Type MCI_STATUS_PARMS
    lngCallback As Long
    lngReturn As Long
    lngItem As Long
    lngTrack As Integer
End Type

Type MCI_INFO_PARMS
    lngCallback As Long
    strReturn As String
    lngRetSize As Long
End Type

Type MCI_GETDEVCAPS_PARMS
    lngCallback As Long
    lngReturn As Long
    lngItem As Long
End Type

Type MCI_SYSINFO_PARMS
    lngCallback As Long
    strReturn As String
    lngRetSize As Long
    lngNumber As Long
    lngDeviceType As Long
End Type

Type MCI_SET_PARMS
    lngCallback As Long
    lngTimeFormat As Long
    lngAudio As Long
End Type

Type MCI_BREAK_PARMS
    lngCallback As Long
    lngVirtKey As Long
    hwndBreak As Long
End Type

Type MCI_SOUND_PARMS
    lngCallback As Long
    strSoundName As String
End Type

Type MCI_SAVE_PARMS
    lngCallback As Long
    lpFileName As String
End Type

Type MCI_LOAD_PARMS
    lngCallback As Long
    lpFileName As String
End Type

Type MCI_RECORD_PARMS
    lngCallback As Long
    lngFrom As Long
    lngTo As Long
End Type

Type MCI_OVLY_OPEN_PARMS
    lngCallback As Long
    lngDeviceID As Long
    strDeviceType As String
    strElementName As String
    strAlias As String
    lngStyle As Long
    hWndParent As Long
End Type

Type MCI_OVLY_WINDOW_PARMS
    lngCallback As Long
    hWnd As Long
    lngCmdShow As Long
    strText As String
End Type

Type MCI_OVLY_RECT_PARMS
    lngCallback As Long
    rc As RECT
End Type

Type MCI_WAVE_OPEN_PARMS
    lngCallback As Long
    lngDeviceID As Long
    strDeviceType As String
    strElementName As String
    strAlias As String
    lngBufferSeconds As Long
End Type

Type MCI_WAVE_DELETE_PARMS
    lngCallback As Long
    lngFrom As Long
    lngTo As Long
End Type

Type MCI_WAVE_SET_PARMS
    lngCallback As Long
    lngTimeFormat As Long
    lngAudio As Long
    lngInput As Long
    lngOutput As Long
    intFormatTag As Integer
    intReserved2 As Integer
    intChannels As Integer
    intReserved3 As Integer
    lngSamplesPerSec As Long
    lngAvgBytesPerSec As Long
    intBlockAlign As Integer
    intReserved4 As Integer
    intBitsPerSample As Integer
    intReserved5 As Integer
End Type

' API function declarations

Private Declare Function mciSendCommand Lib "winmm.dll" Alias "mciSendCommandA" (ByVal wDeviceID As Long, ByVal uMessage As Long, ByVal dwParam1 As Long, dwParam2 As Any) As Long
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Private Declare Function mciGetErrorString Lib "winmm.dll" Alias "mciGetErrorStringA" (ByVal dwError As Long, ByVal lpstrBuffer As String, ByVal uLength As Long) As Long
Private Declare Function mciGetDeviceID Lib "winmm.dll" Alias "mciGetDeviceIDA" (ByVal lpstrName As String) As Long
Private Declare Function mciExecute Lib "winmm.dll" Alias "mciExecuteA" (ByVal lpstrCommand As String) As Long

Type dhDoubleWordByByte
    LowWordLowByte As Byte
    LowWordHighByte As Byte
    HighWordLowByte As Byte
    HighWordHighByte As Byte
End Type

Type dhDoubleWordLong
    DoubleWord As Long
End Type

Function dhHackByte(lngIn As Long, bytByte As Byte) As Byte

    ' Extracts a given byte from the supplied long integer.

    ' From "Visual Basic Language Developer's Handbook"
    ' by Ken Getz and Mike Gilbert
    ' Copyright 2000; Sybex, Inc. All rights reserved.

    ' In:
    '   lngIn
    '       Long integer containing value to extract.
    '   bytByte
    '       Number indicating which byte you want to
    '       extract (see Select Case statement below).
    ' Out:
    '   Return Value:
    '       Value of extracted byte.
    ' Example:
    '   dhHackByte

    Dim dwb As dhDoubleWordByByte
    Dim dwl As dhDoubleWordLong

    dwl.DoubleWord = lngIn
    LSet dwb = dwl
    Select Case bytByte
        Case 1
            dhHackByte = dwb.LowWordLowByte
        Case 2
            dhHackByte = dwb.LowWordHighByte
        Case 3
            dhHackByte = dwb.HighWordLowByte
        Case 4
            dhHackByte = dwb.HighWordHighByte
    End Select
End Function

Function dhMCIError(ByVal lngErr As Long, _
 Optional varTag As Variant) As String

    ' Returns MCI error strings given an error code.

    ' From "Visual Basic Language Developer's Handbook"
    ' by Ken Getz and Mike Gilbert
    ' Copyright 2000; Sybex, Inc. All rights reserved.

    ' In:
    '   lngErr
    '       MCI error code returned from mciSendString or
    '       mciSendCommand.
    '   varTag (Optional)
    '       Output variable (see below).
    ' Out:
    '   varTag
    '       If passed, the function puts the MCI error
    '       message tag (e.g. "MMSYSTEM246") in this variable.
    '   Return Value:
    '       MCI error message.
    ' Example:
    '   MsgBox dhMCIError(lngReturn)
 
    Dim strBuffer As String
    Dim lngPos As Long
    Dim lngRet As Long
    
    If lngErr <> 0 Then
        ' Set up a buffer
        strBuffer = Space(1024)
        
        Call mciGetErrorString(lngErr, strBuffer, Len(strBuffer))
        
        ' Trim string
        lngPos = InStr(strBuffer, vbNullChar)
        If lngPos > 0 Then
            strBuffer = Left(strBuffer, lngPos - 1)
            
            ' Get tag?
            lngPos = InStr(strBuffer, " ")
            If Not IsMissing(varTag) And lngPos > 0 Then
                varTag = Left(strBuffer, lngPos - 1)
            End If
            
            ' Return result
            dhMCIError = Mid(strBuffer, lngPos + 1)
        End If
    End If
End Function

Function dhMCIStatus(lngDevID As Long, lngItem As Long, _
 Optional lngAddlFlags As Long = 0, _
 Optional bytTrack As Byte = 0) As Long

    ' Returns the results of the MCI_STATUS command.

    ' From "Visual Basic Language Developer's Handbook"
    ' by Ken Getz and Mike Gilbert
    ' Copyright 2000; Sybex, Inc. All rights reserved.

    ' In:
    '   lngDevID
    '       Valid MCI device ID.
    '   lngItem
    '       MCI_STATUS item (e.g. MCI_STATUS_POSITION).
    '   lngAddlFlags (Optional, default = 0)
    '       Additional flags to pass (e.g. MCI_TRACK).
    '   bytTrack (Optional, default = 0)
    '       If status applies to a track, the track number.
    ' Out:
    '   Return Value:
    '       Status value as a long integer.
    ' Note:
    '       Refer to the list of MCI constants for status items.
    ' Example:
    '   lngPosition = dhMCIStatus(lngDevID, MCI_POSITION)
 
    Dim mst As MCI_STATUS_PARMS
    Dim lngRet As Long
    
    ' Make sure device ID is valid
    If lngDevID Then
    
        ' Set values of MCI_STATUS_ITEM structure
        With mst
            .lngItem = lngItem
            .lngTrack = bytTrack
            
            ' Call mciSendCommand
            lngRet = mciSendCommand(lngDevID, MCI_STATUS, _
             MCI_STATUS_ITEM Or lngAddlFlags, mst)
             
            ' If successful, return lngReturn
            ' member of MCI_STATUS_ITEM structure
            If lngRet = 0 Then
                dhMCIStatus = .lngReturn
            End If
        End With
    End If
End Function

Function dhMCITimeToVBATime(lngTime As Long, _
 lngTimeFormat As Long) As Date

    ' Converts an MCI time value to a VBA time value
    ' given an MCI time format constant.

    ' From "Visual Basic Language Developer's Handbook"
    ' by Ken Getz and Mike Gilbert
    ' Copyright 2000; Sybex, Inc. All rights reserved.

    ' In:
    '   lngTime
    '       MCI time value as a long integer.
    '   lngTimeFormat
    '       MCI time format.
    ' Out:
    '   Return Value:
    '       Equivalent time value as a VBA Date value.
    ' Note:
    '       Refer to list of MCI constants for time formats.
    ' Example:
    '   datTime = dhMCITimeToVBATime(lngTime, MCI_FORMAT_TMSF)

    Dim dwb As dhDoubleWordByByte
    Dim dwl As dhDoubleWordLong
    Dim datResult As Date

    ' Break up long into four bytes using LSet
    dwl.DoubleWord = lngTime
    LSet dwb = dwl
    
    ' Use the busted-up bytes
    With dwb
        ' Which time format?
        Select Case lngTimeFormat
            ' frames (assume 30/sec)
            Case MCI_FORMAT_FRAMES
                datResult = TimeSerial(0, _
                 0, lngTime / 30)
            ' minute/second/frame
            Case MCI_FORMAT_MSF
                datResult = TimeSerial(0, _
                 .LowWordLowByte, _
                 .LowWordHighByte)
            ' track/minute/second/frame
            Case MCI_FORMAT_TMSF
                datResult = TimeSerial(0, _
                 .LowWordHighByte, _
                 .HighWordLowByte)
            ' Society of Motion Picture Engineers
            ' (hour/minute/second/frame)
            Case MCI_FORMAT_SMPTE_24, _
             MCI_FORMAT_SMPTE_25, _
             MCI_FORMAT_SMPTE_30, _
             MCI_FORMAT_SMPTE_30DROP, _
             MCI_FORMAT_HMS
                datResult = TimeSerial( _
                 .LowWordLowByte, _
                 .LowWordHighByte, _
                 .HighWordLowByte)
            ' Milliseconds
            Case MCI_FORMAT_MILLISECONDS
                datResult = lngTime / 86400000
        End Select
    End With
    
    ' Set the return value
    dhMCITimeToVBATime = datResult
End Function

Function dhMCIInfo(lngDevID As Long, lngInfo As Long) As String

    ' Returns results of MCI_INFO command given an
    ' information type.

    ' From "Visual Basic Language Developer's Handbook"
    ' by Ken Getz and Mike Gilbert
    ' Copyright 2000; Sybex, Inc. All rights reserved.

    ' In:
    '   lngDevID
    '       Valid MCI device ID.
    '   lngInfo
    '       Information type (see MCI_INFO constants).
    ' Out:
    '   Return Value:
    '       Information as a string.
    ' Example:
    '   strInfo = dhMCIInfo(lngDevID, MCI_INFO_PRODUCT)

    Dim min As MCI_INFO_PARMS
    Dim lngRet As Long
    
    If lngDevID Then
        With min
            ' Set up buffer
            .strReturn = Space(255)
            .lngRetSize = Len(.strReturn)
            lngRet = mciSendCommand(lngDevID, MCI_INFO, _
             lngInfo, min)
             
            ' If successful, return portion of
            ' strReturn buffer
            If lngRet = 0 Then
                dhMCIInfo = Left(.strReturn, _
                 InStr(.strReturn, vbNullChar) - 1)
            End If
        End With
    End If
End Function


