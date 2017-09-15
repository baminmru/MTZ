VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CDPlayer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

' From "Visual Basic Language Developer's Handbook"
' by Ken Getz and Mike Gilbert
' Copyright 2000; Sybex, Inc. All rights reserved.

' CDPlayer class from Chapter 13

Private mlngDevID As Long
Private mcolTracks As New Collection

Private Declare Function mciSendCommand Lib "winmm.dll" Alias "mciSendCommandA" (ByVal wDeviceID As Long, ByVal uMessage As Long, ByVal dwParam1 As Long, dwParam2 As Any) As Long

Private Sub Class_Initialize()
    Call OpenDevice
End Sub

Private Sub OpenDevice()
    Dim lngRet As Long
    Dim mop As MCI_OPEN_PARMS
    Dim msp As MCI_SET_PARMS
    Dim bytTrack As Byte
    
    ' If we're already open then close
    If mlngDevID Then
        Call CloseDevice
    End If
    
    ' Set device type and alias
    mop.strDeviceType = "cdaudio"
    
    ' Open the device
    lngRet = mciSendCommand(0&, MCI_OPEN, MCI_OPEN_TYPE, mop)
    If lngRet = 0 Then
        
        ' Store the device id
        mlngDevID = mop.lngDeviceID
        
        ' Get number of tracks
        lngRet = dhMCIStatus(mlngDevID, _
         MCI_STATUS_NUMBER_OF_TRACKS)
        If lngRet > 0 Then
            
            ' Get track times (note: these
            ' will be in MSF time format)
            Set mcolTracks = New Collection
            For bytTrack = 1 To lngRet
            
                ' Get time for one track
                lngRet = dhMCIStatus(mlngDevID, _
                 MCI_STATUS_LENGTH, MCI_TRACK, bytTrack)
                 
                ' Add track time to collection
                mcolTracks.Add lngRet, "Track" & bytTrack
            Next
            
            ' Set the time format to
            ' tracks/minutes/seconds/frames
            msp.lngTimeFormat = MCI_FORMAT_TMSF
            lngRet = mciSendCommand(mlngDevID, MCI_SET, _
             MCI_SET_TIME_FORMAT, msp)
            If lngRet Then
                Err.Raise lngRet, "CDPlayer::OpenDevice", _
                 dhMCIError(lngRet)
            End If
        End If
    Else
        Err.Raise lngRet, "CDPlayer::OpenDevice", _
         dhMCIError(lngRet)
    End If
End Sub

Private Sub Class_Terminate()
    Call CloseDevice
End Sub

Private Sub CloseDevice()
    Dim lngRet As Long
    
    If mlngDevID Then
                                      ' If the CD is playing, stop it
                                      'If IsPlaying Then
                                      ' StopPlaying
                                      'End If
        
        ' Close the device
        lngRet = mciSendCommand(mlngDevID, MCI_CLOSE, 0&, 0&)
        If lngRet = 0 Then
            mlngDevID = 0
        Else
            Err.Raise lngRet, "CDPlayer::CloseDevice", _
             dhMCIError(lngRet)
        End If
    End If
End Sub

Public Sub Play(Optional Track As Byte = 0)
    Dim mpp As MCI_PLAY_PARMS
    Dim lngRet As Long
    
    If mlngDevID Then
    
        ' If no track was supplied play from
        ' the current position
        If Track = 0 Then
            lngRet = mciSendCommand(mlngDevID, _
             MCI_PLAY, 0&, 0&)
        
        ' Otherwise, set begin and end tracks
        ' and play just that track
        Else
            mpp.lngFrom = Track
            mpp.lngTo = Track + 1
            lngRet = mciSendCommand(mlngDevID, MCI_PLAY, _
             MCI_FROM Or MCI_TO, mpp)
        End If
        
        If lngRet <> 0 Then
            Err.Raise lngRet, "CDPlayer::Play", _
             dhMCIError(lngRet)
        End If
    End If
End Sub

Public Sub StopPlaying()


    Dim lngRet As Long
    
    If mlngDevID Then
         'Stop playback by issuing the MCI_STOP command
        lngRet = mciSendCommand(mlngDevID, MCI_STOP, 0&, 0&)
        If lngRet <> 0 Then
            Err.Raise lngRet, "CDPlayer::StopPlaying", _
             dhMCIError(lngRet)
        End If
    End If
End Sub

Property Get Tracks() As Byte
    Tracks = mcolTracks.Count
End Property

Property Get Track() As Byte
    Track = CByte(dhMCIStatus(mlngDevID, _
     MCI_STATUS_CURRENT_TRACK))
End Property
Property Let Track(bytTrack As Byte)
    If bytTrack > 0 And bytTrack <= mcolTracks.Count Then
        Play bytTrack
    End If
End Property

Property Get TrackTime(Optional TrackNumber As Byte = 0) As Date
    If TrackNumber <= 0 Or TrackNumber > mcolTracks.Count Then
        TrackNumber = Me.Track
    End If
    
    TrackTime = dhMCITimeToVBATime(mcolTracks(TrackNumber), _
     MCI_FORMAT_MSF)
End Property

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
            Err.Raise lngRet, "CDPlayer::Pause", _
             dhMCIError(lngRet)
        End If
    End If
End Sub

Public Sub Position( _
 Optional Track As Byte = 0, _
 Optional Minute As Byte = 0, _
 Optional Second As Byte = 0)
    
    Dim dwb As dhDoubleWordByByte
    Dim dwl As dhDoubleWordLong
    Dim msk As MCI_SEEK_PARMS
    Dim lngRet As Long
    Dim fWasPlaying As Boolean
    
    If mlngDevID Then
        ' If the disc is playing, pause it
        If IsPlaying Then
            Me.Pause
            fWasPlaying = True
        End If
        
        ' If no track was supplied then assume
        ' the current one
        If Track = 0 Then
            Track = Me.Track
        End If
    
        ' Constuct position in TMSF format
        With dwb
            .LowWordLowByte = Track
            .LowWordHighByte = Minute
            .HighWordLowByte = Second
        End With
        LSet dwl = dwb
        
        ' Set time and call MCI_SEEK
        msk.lngTo = dwl.DoubleWord
        lngRet = mciSendCommand(mlngDevID, _
         MCI_SEEK, MCI_TO, msk)
        
        If lngRet = 0 Then
            ' If cd was playing when this was
            ' called, resume playing
            If fWasPlaying Then
                Me.Play
            End If
        Else
            Err.Raise lngRet, "CDPlayer::Position", _
             dhMCIError(lngRet)
        End If
    End If
End Sub
 
Property Get MediaID() As String
    MediaID = dhMCIInfo(mlngDevID, MCI_INFO_MEDIA_IDENTITY)
End Property

Property Get IsReady() As Boolean
    IsReady = CBool(dhMCIStatus(mlngDevID, MCI_STATUS_READY))
End Property


