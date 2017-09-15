Attribute VB_Name = "UserRetrive"
Option Explicit

      ' Constants used within our API calls. Refer to the MSDN for more
      ' information on how/what these constants are used for.

      ' Memory constants used through various memory API calls.
      Public Const GMEM_MOVEABLE = &H2
      Public Const LMEM_FIXED = &H0
      Public Const LMEM_ZEROINIT = &H40
      Public Const LPTR = (LMEM_FIXED + LMEM_ZEROINIT)
      Public Const GENERIC_READ = &H80000000

      ' The file/security API call constants.
      ' Refer to the MSDN for more information on how/what these constants
      ' are used for.
      Public Const DACL_SECURITY_INFORMATION = &H4
      Public Const SECURITY_DESCRIPTOR_REVISION = (1)
      Public Const SECURITY_DESCRIPTOR_MIN_LENGTH = (20)
      Public Const SD_SIZE = (65536 + SECURITY_DESCRIPTOR_MIN_LENGTH)
      Public Const ACL_REVISION2 = (2)
      Public Const ACL_REVISION = (2)
      Public Const MAXDWORD = &HFFFF
      Public Const SidTypeUser = 1
      Public Const AclSizeInformation = 2

      ' Structures used by our API calls.
      ' Refer to the MSDN for more information on how/what these
      ' structures are used for.
      Type ACE_HEADER
         AceType As Byte
         AceFlags As Byte
         AceSize As Integer
      End Type

      Type ACCESS_ALLOWED_ACE
         Header As ACE_HEADER
         Mask As Long
         SidStart As Long
      End Type

      Type ACL
         AclRevision As Byte
         Sbz1 As Byte
         AclSize As Integer
         AceCount As Integer
         Sbz2 As Integer
      End Type

      Type ACL_SIZE_INFORMATION
         AceCount As Long
         AclBytesInUse As Long
         AclBytesFree As Long
      End Type

      Type SECURITY_DESCRIPTOR
         Revision As Byte
         Sbz1 As Byte
         Control As Long
         Owner As Long
         Group As Long
         sACL As ACL
         Dacl As ACL
      End Type

      ' API calls used within this sample. Refer to the MSDN for more
      ' information on how/what these APIs do.

      Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long

      Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long

      Declare Function LookupAccountName Lib "advapi32.dll" Alias "LookupAccountNameA" (lpSystemName As String, ByVal lpAccountName As String, Sid As Any, cbSid As Long, ByVal ReferencedDomainName As String, cbReferencedDomainName As Long, peUse As Long) As Long

      Declare Function InitializeSecurityDescriptor Lib "advapi32.dll" (pSecurityDescriptor As SECURITY_DESCRIPTOR, ByVal dwRevision As Long) As Long

      Declare Function GetSecurityDescriptorDacl Lib "advapi32.dll" (pSecurityDescriptor As Byte, lpbDaclPresent As Long, pDacl As Long, lpbDaclDefaulted As Long) As Long

      Declare Function GetFileSecurityN Lib "advapi32.dll" Alias "GetFileSecurityA" (ByVal lpFileName As String, ByVal RequestedInformation As Long, ByVal pSecurityDescriptor As Long, ByVal nLength As Long, lpnLengthNeeded As Long) As Long

      Declare Function GetFileSecurity Lib "advapi32.dll" Alias "GetFileSecurityA" (ByVal lpFileName As String, ByVal RequestedInformation As Long, pSecurityDescriptor As Byte, ByVal nLength As Long, lpnLengthNeeded As Long) As Long

      Declare Function GetAclInformation Lib "advapi32.dll" (ByVal pAcl As Long, pAclInformation As Any, ByVal nAclInformationLength As Long, ByVal dwAclInformationClass As Long) As Long

      Declare Function GetLengthSid Lib "advapi32.dll" (pSid As Any) As Long

      Declare Function InitializeAcl Lib "advapi32.dll" (pAcl As Byte, ByVal nAclLength As Long, ByVal dwAclRevision As Long) As Long

      Declare Function GetAce Lib "advapi32.dll" (ByVal pAcl As Long, ByVal dwAceIndex As Long, pace As Any) As Long

      Declare Function AddAce Lib "advapi32.dll" (ByVal pAcl As Long, ByVal dwAceRevision As Long, ByVal dwStartingAceIndex As Long, ByVal pAceList As Long, ByVal nAceListLength As Long) As Long

      Declare Function AddAccessAllowedAce Lib "advapi32.dll" (pAcl As Byte, ByVal dwAceRevision As Long, ByVal AccessMask As Long, pSid As Byte) As Long

      Declare Function SetSecurityDescriptorDacl Lib "advapi32.dll" (pSecurityDescriptor As SECURITY_DESCRIPTOR, ByVal bDaclPresent As Long, pDacl As Byte, ByVal bDaclDefaulted As Long) As Long

      Declare Function SetFileSecurity Lib "advapi32.dll" Alias "SetFileSecurityA" (ByVal lpFileName As String, ByVal SecurityInformation As Long, pSecurityDescriptor As SECURITY_DESCRIPTOR) As Long

      Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, ByVal hpvSource As Long, ByVal cbCopy As Long)
      
      Public Declare Sub CopyMemory2 Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)


Public Function GetNTUser() As String
On Error Resume Next

Dim lResult As Long            ' Result of various API calls.
         Dim I As Integer               ' Used in looping.
         Dim bUserSid(255) As Byte      ' This will contain your SID.
         Dim sSystemName As String      ' Name of this computer system.

         Dim lSystemNameLength As Long  ' Length of string that contains
                                        ' the name of this system.

         Dim lLengthUserName As Long    ' Max length of user name.

         Dim sUserName As String * 255  ' String to hold the current user
                                        ' name.

         Dim lUserSID As Long           ' Used to hold the SID of the
                                        ' current user.

         Dim lUserSIDSize As Long          ' Size of the SID.
         Dim sDomainName As String * 255   ' Domain the user belongs to.
         Dim lDomainNameLength As Long     ' Length of domain name needed.

         Dim lSIDType As Long              ' The type of SID info we are
                                           ' getting back.

         Dim sFileSD As SECURITY_DESCRIPTOR   ' SD of the file we want.

         Dim bSDBuf() As Byte           ' Buffer that holds the security
                                        ' descriptor for this file.

         Dim lFileSDSize As Long           ' Size of the File SD.
         Dim lSizeNeeded As Long           ' Size needed for SD for file.
         Dim sFileName As String           ' String to hold the file we
                                           ' are playing with.

         Dim sNewSD As SECURITY_DESCRIPTOR ' New security descriptor.

         Dim sACL As ACL                   ' Used in grabbing the DACL from
                                           ' the File SD.

         Dim lDaclPresent As Long          ' Used in grabbing the DACL from
                                           ' the File SD.

         Dim lDaclDefaulted As Long        ' Used in grabbing the DACL from
                                           ' the File SD.

         Dim sACLInfo As ACL_SIZE_INFORMATION  ' Used in grabbing the ACL
                                               ' from the File SD.

         Dim lACLSize As Long           ' Size of the ACL structure used
                                        ' to get the ACL from the File SD.

         Dim pAcl As Long               ' Current ACL for this file.
         Dim lNewACLSize As Long        ' Size of new ACL to create.
         Dim bNewACL() As Byte          ' Buffer to hold new ACL.

         Dim sCurrentACE As ACCESS_ALLOWED_ACE    ' Current ACE.
         Dim pCurrentAce As Long                  ' Our current ACE.

         ' The first action taken is acquiring the name of the user
         ' who is currently logged onto this system. Take the user's
         ' name and grab its companion SID for future use.
         ' Use the GetUserName API to find out who is currently logged onto
         ' this system. Preset the length of the string to hold the
         ' returned user name from the "GetUserName" API.
         lLengthUserName = 255
         sUserName = Space(lLengthUserName)

         ' Call GetUserName to find out who is logged onto this system.
         lResult = GetUserName(sUserName, lLengthUserName)

         ' Return value of zero means the call failed; test for this before
         ' continuing.
         If (lResult = 0) Then
            GetNTUser = ""
            Exit Function
         End If

         ' You now have the user name of the person who is logged onto this
         ' system. Using that information, get the SID of the user. (Refer
         ' to the MSDN for more information on SIDs and their
         ' function/purpose in the operating system.) Get the SID of this
         ' user by using the LookupAccountName API. In order to use the SID
         ' of the current user account, call the LookupAccountName API
         ' twice. The first time is to get the required sizes of the SID
         ' and the DomainName string. The second call is to actually get
         ' the desired information.

         lResult = LookupAccountName(vbNullString, sUserName, _
            bUserSid(0), 255, sDomainName, lDomainNameLength, _
            lSIDType)

         ' Now set the sDomainName string buffer to its proper size before
         ' calling the API again.
         sDomainName = Space(lDomainNameLength)

         ' Call the LookupAccountName again to get the actual SID for user.
         lResult = LookupAccountName(vbNullString, sUserName, _
            bUserSid(0), 255, sDomainName, lDomainNameLength, _
            lSIDType)

           If (lResult = 0) Then
              GetNTUser = Left(sUserName, lLengthUserName - 1)
              Exit Function
           End If
           
           GetNTUser = Left(sDomainName, lDomainNameLength) & "\" & Left(sUserName, lLengthUserName - 1)
End Function
      
      
