VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Mixer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private hmixer As Long

      Private Const MMSYSERR_NOERROR = 0
      Private Const MAXPNAMELEN = 32
      Private Const MIXER_LONG_NAME_CHARS = 64
      Private Const MIXER_SHORT_NAME_CHARS = 16
      Private Const MIXER_GETLINEINFOF_COMPONENTTYPE = &H3&
      Private Const MIXER_GETCONTROLDETAILSF_VALUE = &H0&
      Private Const MIXER_GETLINECONTROLSF_ONEBYTYPE = &H2&
      Private Const MIXERLINE_COMPONENTTYPE_DST_FIRST = &H0&
      Private Const MIXERLINE_COMPONENTTYPE_SRC_FIRST = &H1000&
      Private Const MIXER_SETCONTROLDETAILSF_VALUE = &H0&


      Private Const MIXERLINE_COMPONENTTYPE_DST_SPEAKERS = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 4)

      'private Const MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 3)
      Private Const MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 3)
      Private Const MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 7)
      Private Const MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 4)
      Private Const MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 6)
      Private Const MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 0)
      Private Const MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 8)
      Private Const MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 5)
      Private Const MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 9)
      Private Const MIXERLINE_COMPONENTTYPE_SRC_ANALOG = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 10)


      Private Const MIXERLINE_COMPONENTTYPE_SRC_LINE = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 2)

      Private Const MIXERCONTROL_CT_CLASS_FADER = &H50000000
      Private Const MIXERCONTROL_CT_UNITS_UNSIGNED = &H30000




      Private Const MIXERCONTROL_CONTROLTYPE_FADER = (MIXERCONTROL_CT_CLASS_FADER Or MIXERCONTROL_CT_UNITS_UNSIGNED)

      Private Const MIXERCONTROL_CONTROLTYPE_VOLUME = (MIXERCONTROL_CONTROLTYPE_FADER + 1)




      Private Type MIXERCAPS
         wMid As Integer                   '  manufacturer id
         wPid As Integer                   '  product id
         vDriverVersion As Long            '  version of the driver
         szPname As String * MAXPNAMELEN   '  product name
         fdwSupport As Long                '  misc. support bits
         cDestinations As Long             '  count of destinations
      End Type

      Private Type MIXERCONTROL
         cbStruct As Long           '  size in Byte of MIXERCONTROL
         dwControlID As Long        '  unique control id for mixer device
         dwControlType As Long      '  MIXERCONTROL_CONTROLTYPE_xxx
         fdwControl As Long         '  MIXERCONTROL_CONTROLF_xxx
         cMultipleItems As Long     '  if MIXERCONTROL_CONTROLF_MULTIPLE
                                    '  set
         szShortName As String * MIXER_SHORT_NAME_CHARS  ' short name of
                                                         ' control
         szName As String * MIXER_LONG_NAME_CHARS        ' long name of
                                                         ' control
         lMinimum As Long           '  Minimum value
         lMaximum As Long           '  Maximum value
         reserved(10) As Long       '  reserved structure space
         End Type

      Private Type MIXERCONTROLDETAILS
         cbStruct As Long       '  size in Byte of MIXERCONTROLDETAILS
         dwControlID As Long    '  control id to get/set details on
         cChannels As Long      '  number of channels in paDetails array
         item As Long           '  hwndOwner or cMultipleItems
         cbDetails As Long      '  size of _one_ details_XX struct
         paDetails As Long      '  pointer to array of details_XX structs
      End Type

      Private Type MIXERCONTROLDETAILS_UNSIGNED
         dwValue As Long        '  value of the control
      End Type

      Private Type MIXERLINE
         cbStruct As Long               '  size of MIXERLINE structure
         dwDestination As Long          '  zero based destination index
         dwSource As Long               '  zero based source index (if
                                        '  source)
         dwLineID As Long               '  unique line id for mixer device
         fdwLine As Long                '  state/information about line
         dwUser As Long                 '  driver specific information
         dwComponentType As Long        '  component type line connects to
         cChannels As Long              '  number of channels line supports
         cConnections As Long           '  number of connections (possible)
         cControls As Long              '  number of controls at this line
         szShortName As String * MIXER_SHORT_NAME_CHARS
         szName As String * MIXER_LONG_NAME_CHARS
         dwType As Long
         dwDeviceID As Long
         wMid  As Integer
         wPid As Integer
         vDriverVersion As Long
         szPname As String * MAXPNAMELEN
      End Type

      Private Type MIXERLINECONTROLS
         cbStruct As Long       '  size in Byte of MIXERLINECONTROLS
         dwLineID As Long       '  line id (from MIXERLINE.dwLineID)
                                '  MIXER_GETLINECONTROLSF_ONEBYID or
         dwControl As Long      '  MIXER_GETLINECONTROLSF_ONEBYTYPE
         cControls As Long      '  count of controls pmxctrl points to
         cbmxctrl As Long       '  size in Byte of _one_ MIXERCONTROL
         pamxctrl As Long       '  pointer to first MIXERCONTROL array
      End Type


Private Declare Function mixerClose Lib "winmm.dll" (ByVal hmx As Long) As Long

Private Declare Function mixerGetControlDetails Lib "winmm.dll" Alias "mixerGetControlDetailsA" (ByVal hmxobj As Long, pmxcd As MIXERCONTROLDETAILS, ByVal fdwDetails As Long) As Long

Private Declare Function mixerGetDevCaps Lib "winmm.dll" Alias "mixerGetDevCapsA" (ByVal uMxId As Long, ByVal pmxcaps As MIXERCAPS, ByVal cbmxcaps As Long) As Long

Private Declare Function mixerGetID Lib "winmm.dll" (ByVal hmxobj As Long, pumxID As Long, ByVal fdwId As Long) As Long

Private Declare Function mixerGetLineControls Lib "winmm.dll" Alias "mixerGetLineControlsA" (ByVal hmxobj As Long, pmxlc As MIXERLINECONTROLS, ByVal fdwControls As Long) As Long

Private Declare Function mixerGetLineInfo Lib "winmm.dll" Alias "mixerGetLineInfoA" (ByVal hmxobj As Long, pmxl As MIXERLINE, ByVal fdwInfo As Long) As Long

Private Declare Function mixerGetNumDevs Lib "winmm.dll" () As Long

Private Declare Function mixerMessage Lib "winmm.dll" (ByVal hmx As Long, ByVal uMsg As Long, ByVal dwParam1 As Long, ByVal dwParam2 As Long) As Long

Private Declare Function mixerOpen Lib "winmm.dll" (phmx As Long, ByVal uMxId As Long, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal fdwOpen As Long) As Long

Private Declare Function mixerSetControlDetails Lib "winmm.dll" (ByVal hmxobj As Long, pmxcd As MIXERCONTROLDETAILS, ByVal fdwDetails As Long) As Long

Private Declare Sub CopyStructFromPtr Lib "kernel32" Alias "RtlMoveMemory" (struct As Any, ByVal ptr As Long, ByVal cb As Long)

Private Declare Sub CopyPtrFromStruct Lib "kernel32" Alias "RtlMoveMemory" (ByVal ptr As Long, struct As Any, ByVal cb As Long)

Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long

Private Declare Function GlobalLock Lib "kernel32" (ByVal hmem As Long) As Long

Private Declare Function GlobalFree Lib "kernel32" (ByVal hmem As Long) As Long

      


Private volCtrl As MIXERCONTROL ' Main volume control
Private waveCtrl As MIXERCONTROL ' wave out volume control
Private lineCtrl As MIXERCONTROL ' line volume control
Private cdCtrl As MIXERCONTROL ' cd volume control
Private midiCtrl As MIXERCONTROL '  volume control
Private micCtrl As MIXERCONTROL '  volume control
Private digCtrl As MIXERCONTROL '  volume control

Public Enum ctrlType
  MainVol = 0
  WaveVol = 1
  CDVol = 2
  LineVol = 3
  MIDIVol = 4
  MIcVol = 5
End Enum


Public Function OpenMixer() As Long
  Dim rc As Long
  Dim ok As Boolean           ' boolean return code
  rc = mixerOpen(hmixer, 0, 0, 0, 0)
  If ((MMSYSERR_NOERROR <> rc)) Then
      Err.Raise 111, , "Couldn't open the mixer."
  End If
  
   ok = GetVolumeControler( _
                        MIXERLINE_COMPONENTTYPE_DST_SPEAKERS, _
                        MIXERCONTROL_CONTROLTYPE_VOLUME, _
                        volCtrl)
                        
'MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY,

   ok = GetVolumeControler( _
                        MIXERLINE_COMPONENTTYPE_SRC_LINE, _
                        MIXERCONTROL_CONTROLTYPE_VOLUME, _
                        lineCtrl)
   
   ok = GetVolumeControler( _
                        MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT, _
                        MIXERCONTROL_CONTROLTYPE_VOLUME, _
                        waveCtrl)
   ok = GetVolumeControler( _
                        MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC, _
                        MIXERCONTROL_CONTROLTYPE_VOLUME, _
                        cdCtrl)
  ok = GetVolumeControler( _
                        MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER, _
                        MIXERCONTROL_CONTROLTYPE_VOLUME, _
        midiCtrl)
        
  ok = GetVolumeControler( _
                        MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE, _
                        MIXERCONTROL_CONTROLTYPE_VOLUME, _
        micCtrl)
End Function





Private Function GetVolumeControler(ByVal componentType As Long, ByVal ctrlType As Long, ByRef mxc As MIXERCONTROL) As Boolean
      ' This function attempts to obtain a mixer control.
      ' Returns True if successful.
         Dim mxlc As MIXERLINECONTROLS
         Dim mxl As MIXERLINE
         Dim hmem As Long
         Dim rc As Long

         mxl.cbStruct = Len(mxl)
         mxl.dwComponentType = componentType

         ' Obtain a line corresponding to the component type
         rc = mixerGetLineInfo(hmixer, mxl, MIXER_GETLINEINFOF_COMPONENTTYPE)

         If (MMSYSERR_NOERROR = rc) Then
             mxlc.cbStruct = Len(mxlc)
             mxlc.dwLineID = mxl.dwLineID
             mxlc.dwControl = ctrlType
             mxlc.cControls = 1
             mxlc.cbmxctrl = Len(mxc)

             ' Allocate a buffer for the control
             hmem = GlobalAlloc(&H40, Len(mxc))
             mxlc.pamxctrl = GlobalLock(hmem)
             mxc.cbStruct = Len(mxc)

             ' Get the control
             rc = mixerGetLineControls(hmixer, mxlc, MIXER_GETLINECONTROLSF_ONEBYTYPE)

             If (MMSYSERR_NOERROR = rc) Then
                 GetVolumeControler = True

                 ' Copy the control into the destination structure
                 CopyStructFromPtr mxc, mxlc.pamxctrl, Len(mxc)
             Else
                 GetVolumeControler = False
             End If
             GlobalFree (hmem)
             Exit Function
         End If

         GetVolumeControler = False
      End Function
      
      Public Function GetVolume(ct As ctrlType, ByRef vol As Long)
        Dim res As Long
        If ct = MainVol Then
          res = GetVolumeControl(volCtrl, vol)
        End If
        If ct = CDVol Then
          res = GetVolumeControl(cdCtrl, vol)
        End If
        If ct = LineVol Then
          res = GetVolumeControl(lineCtrl, vol)
        End If
        If ct = WaveVol Then
          res = GetVolumeControl(waveCtrl, vol)
        End If
        If ct = MIDIVol Then
          res = GetVolumeControl(midiCtrl, vol)
        End If
        If ct = MIcVol Then
          res = GetVolumeControl(micCtrl, vol)
        End If
      End Function
      
      
      
      
      Public Function SetVolume(ct As ctrlType, ByVal vol As Long)
        Dim res As Long
        If ct = MainVol Then
          res = SetVolumeControl(volCtrl, vol)
        End If
        If ct = CDVol Then
          res = SetVolumeControl(cdCtrl, vol)
        End If
        If ct = LineVol Then
          res = SetVolumeControl(lineCtrl, vol)
        End If
        If ct = WaveVol Then
          res = SetVolumeControl(waveCtrl, vol)
        End If
        If ct = MIDIVol Then
          res = SetVolumeControl(midiCtrl, vol)
        End If
        If ct = MIcVol Then
          res = SetVolumeControl(micCtrl, vol)
        End If
      End Function
      

      Public Function SetMaxVolume(ct As ctrlType)
        Dim res As Long
        If ct = MainVol Then
          res = SetVolumeControl(volCtrl, volCtrl.lMaximum)
        End If
        If ct = CDVol Then
          res = SetVolumeControl(cdCtrl, cdCtrl.lMaximum)
        End If
        If ct = LineVol Then
          res = SetVolumeControl(lineCtrl, lineCtrl.lMaximum)
        End If
        If ct = WaveVol Then
          res = SetVolumeControl(waveCtrl, waveCtrl.lMaximum)
        End If
        If ct = MIDIVol Then
          res = SetVolumeControl(midiCtrl, midiCtrl.lMaximum)
        End If
        If ct = MIcVol Then
          res = SetVolumeControl(micCtrl, micCtrl.lMaximum)
        End If
      End Function


      Private Function SetVolumeControl(mxc As MIXERCONTROL, ByVal volume As Long) As Boolean
      ' This function sets the value for a volume control.
      ' Returns True if successful

         Dim mxcd As MIXERCONTROLDETAILS
         Dim vol As MIXERCONTROLDETAILS_UNSIGNED
        Dim hmem As Long

         mxcd.item = 0
         mxcd.dwControlID = mxc.dwControlID
         mxcd.cbStruct = Len(mxcd)
         mxcd.cbDetails = Len(vol)

         ' Allocate a buffer for the control value buffer
         hmem = GlobalAlloc(&H40, Len(vol))
         mxcd.paDetails = GlobalLock(hmem)
         mxcd.cChannels = 1
         vol.dwValue = volume

         ' Copy the data into the control value buffer
         CopyPtrFromStruct mxcd.paDetails, vol, Len(vol)

         ' Set the control value
         Dim rc As Long
         rc = mixerSetControlDetails(hmixer, _
                                    mxcd, _
                                    MIXER_SETCONTROLDETAILSF_VALUE)

         GlobalFree (hmem)
         If (MMSYSERR_NOERROR = rc) Then
             SetVolumeControl = True
         Else
             SetVolumeControl = False
         End If
      End Function


Private Function GetVolumeControl(mxc As MIXERCONTROL, ByVal volume As Long) As Boolean
      
         Dim mxcd As MIXERCONTROLDETAILS
         Dim vol As MIXERCONTROLDETAILS_UNSIGNED
         Dim hmem As Long

         mxcd.item = 0
         mxcd.dwControlID = mxc.dwControlID
         mxcd.cbStruct = Len(mxcd)
         mxcd.cbDetails = Len(vol)

         ' Allocate a buffer for the control value buffer
         hmem = GlobalAlloc(&H40, Len(vol))
         mxcd.paDetails = GlobalLock(hmem)
         mxcd.cChannels = 1
         vol.dwValue = volume

         ' Copy the data into the control value buffer
         CopyPtrFromStruct mxcd.paDetails, vol, Len(vol)

         ' Set the control value
         Dim rc As Long
         rc = mixerGetControlDetails(hmixer, _
                                    mxcd, _
                                    MIXER_GETCONTROLDETAILSF_VALUE)
         volume = vol.dwValue

         GlobalFree (hmem)
         If (MMSYSERR_NOERROR = rc) Then
             GetVolumeControl = True
         Else
             GetVolumeControl = False
         End If
      End Function

Public Sub FadeAll()
    Dim res As Long
    res = SetVolumeControl(volCtrl, volCtrl.lMinimum)
    res = SetVolumeControl(cdCtrl, cdCtrl.lMinimum)
    res = SetVolumeControl(lineCtrl, lineCtrl.lMinimum)
    res = SetVolumeControl(waveCtrl, waveCtrl.lMinimum)
    res = SetVolumeControl(midiCtrl, midiCtrl.lMinimum)
    res = SetVolumeControl(micCtrl, micCtrl.lMinimum)
End Sub



Private Sub Class_Initialize()
  'OpenMixer
End Sub


Private Sub Class_Terminate()
  If hmixer Then
    mixerClose hmixer
  End If
  hmixer = 0
End Sub
