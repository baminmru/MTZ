VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WavePlayer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Private mlngDevID As Long
Private filename As String
Const MCI_DEVTYPE_WAVEFORM_AUDIO = 522

Private Declare Function mciSendCommand Lib "winmm.dll" Alias "mciSendCommandA" (ByVal wDeviceID As Long, ByVal uMessage As Long, ByVal dwParam1 As Long, dwParam2 As Any) As Long

Private Sub Class_Initialize()
    'Call OpenDevice
End Sub

Public Sub OpenDevice()
    On Error Resume Next
    Dim lngRet As Long
    Dim mop As MCI_OPEN_PARMS
    Dim msp As MCI_SET_PARMS
    Dim bytTrack As Byte
    
    ' If we're already open then close
    If mlngDevID Then
        Call CloseDevice
    End If
    
    ' Set device type and alias
    mop.strDeviceType = "WaveAudio"
    ' Open the device
    lngRet = mciSendCommand(0&, MCI_OPEN, MCI_OPEN_TYPE, mop)
    
    If lngRet = 0 Then
        mlngDevID = mop.lngDeviceID
    Else
        Err.Raise lngRet, "WavePlayer::OpenDevice", _
         dhMCIError(lngRet)
    End If
End Sub



Public Sub OpenFile(filename As String)
    On Error Resume Next
    Dim lngRet As Long
    Dim mop As MCI_OPEN_PARMS
    Dim msp As MCI_SET_PARMS
    Dim bytTrack As Byte
    
    ' If we're already open then close
    If mlngDevID Then
        Call CloseDevice
    End If
    
    ' Set device type and alias
    mop.strDeviceType = "WaveAudio"
    mop.strElementName = filename & Chr(0)
    'mop.strDeviceType = MCI_DEVTYPE_WAVEFORM_AUDIO
    
    ' Open the device
    'lngRet = mciSendCommand(0&, MCI_OPEN, MCI_OPEN_TYPE, mop)
    lngRet = mciSendCommand(0&, MCI_OPEN, MCI_OPEN_ELEMENT, mop)
    If lngRet = 0 Then
        mlngDevID = mop.lngDeviceID
    Else
        Err.Raise lngRet, "WavePlayer::OpenFile", _
         dhMCIError(lngRet)
    End If
End Sub


Private Sub Class_Terminate()
    Call CloseDevice
End Sub

Private Sub CloseDevice()
    On Error Resume Next
    Dim lngRet As Long
    If mlngDevID Then
        ' Close the device
        lngRet = mciSendCommand(mlngDevID, MCI_CLOSE, 0&, 0&)
        If lngRet = 0 Then
            mlngDevID = 0
        Else
            Err.Raise lngRet, "WavePlayer::CloseDevice", _
             dhMCIError(lngRet)
        End If
    End If
End Sub

Public Sub Play(Optional bWait As Boolean = False)
    On Error Resume Next
    Dim mpp As MCI_PLAY_PARMS
    Dim lngRet As Long
    If mlngDevID Then
        If bWait Then
          lngRet = mciSendCommand(mlngDevID, _
          MCI_PLAY, MCI_WAIT, 0&)
        Else
          lngRet = mciSendCommand(mlngDevID, _
          MCI_PLAY, 0&, 0&)
        End If
        If lngRet <> 0 Then
            Err.Raise lngRet, "WavePlayer::Play", _
             dhMCIError(lngRet)
        End If
    End If
End Sub



Public Sub StopPlaying()
    On Error Resume Next
    Dim lngRet As Long
    If mlngDevID Then
         'Stop playback by issuing the MCI_STOP command
        lngRet = mciSendCommand(mlngDevID, MCI_STOP, 0&, 0&)
        If lngRet <> 0 Then
            Err.Raise lngRet, "WavePlayer::StopPlaying", _
             dhMCIError(lngRet)
        End If
    End If
End Sub




Property Get Minute() As Byte
    Minute = dhHackByte(CurrentTime, 2)
End Property
Property Get Second() As Byte
    Second = dhHackByte(CurrentTime, 3)
End Property
Property Get Frame() As Byte
    Frame = dhHackByte(CurrentTime, 4)
End Property
Property Get Time() As Date
    Time = dhMCITimeToVBATime(CurrentTime(), MCI_FORMAT_TMSF)
End Property

Private Function CurrentTime() As Long
    CurrentTime = dhMCIStatus(mlngDevID, MCI_STATUS_POSITION)
End Function

Property Get Mode() As Long
    Mode = dhMCIStatus(mlngDevID, MCI_STATUS_MODE)
End Property

Property Get IsPlaying() As Boolean
    IsPlaying = (Mode = MCI_MODE_PLAY)
End Property

Public Sub Pause()
    Dim lngRet As Long
    
    If mlngDevID Then
        ' Pause playback by issuing the MCI_PAUSE command
        lngRet = mciSendCommand(mlngDevID, MCI_PAUSE, 0&, 0&)
        If lngRet <> 0 Then
            Err.Raise lngRet, "WavePlayer::Pause", _
             dhMCIError(lngRet)
        End If
    End If
End Sub

Public Sub ResumePlay()
    Dim lngRet As Long
    
    If mlngDevID Then
        ' Pause playback by issuing the MCI_PAUSE command
        lngRet = mciSendCommand(mlngDevID, MCI_RESUME, 0&, 0&)
        If lngRet <> 0 Then
            Err.Raise lngRet, "WavePlayer::Resume", _
             dhMCIError(lngRet)
        End If
    End If
End Sub


Property Get IsReady() As Boolean
    IsReady = CBool(dhMCIStatus(mlngDevID, MCI_STATUS_READY))
End Property




