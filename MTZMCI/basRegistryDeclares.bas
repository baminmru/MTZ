Attribute VB_Name = "basRegistryDeclares"
Option Explicit

Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long
Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulReserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, lpSecurityAttributes As Any, phkResult As Long, lpdwDisposition As Long) As Long

Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal dwReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
 
' Registry constants
Global Const dhcSuccess = 0
Global Const dhcRegMaxDataSize = 2048
Global Const dhcRegNone = 0
Global Const dhcRegSz = 1
Global Const dhcRegExpandSz = 2
Global Const dhcRegBinary = 3
Global Const dhcRegDWord = 4
Global Const dhcRegDWordLittleEndian = 4
Global Const dhcRegDWordBigEndian = 5
Global Const dhcRegLink = 6
Global Const dhcRegMultiSz = 7
Global Const dhcRegResourceList = 8
Global Const dhcRegFullResourceDescriptor = 9
Global Const dhcRegResourceRequirementsList = 10
Global Const dhcRegOptionReserved = 0
Global Const dhcRegOptionNonVolatile = 0
Global Const dhcRegOptionVolatile = 1
Global Const dhcRegOptionCreateLink = 2
Global Const dhcRegOptionBackupRestore = 4
Global Const dhcReadControl = &H20000
Global Const dhcKeyQueryValue = &H1
Global Const dhcKeySetValue = &H2
Global Const dhcKeyCreateSubKey = &H4
Global Const dhcKeyEnumerateSubKeys = &H8
Global Const dhcKeyNotify = &H10
Global Const dhcKeyCreateLink = &H20
Global Const dhcKeyRead = dhcKeyQueryValue + dhcKeyEnumerateSubKeys + dhcKeyNotify + dhcReadControl
Global Const dhcKeyWrite = dhcKeySetValue + dhcKeyCreateSubKey + dhcReadControl
Global Const dhcKeyExecute = dhcKeyRead
Global Const dhcKeyAllAccess = dhcKeyQueryValue + dhcKeySetValue + dhcKeyCreateSubKey + dhcKeyEnumerateSubKeys + dhcKeyNotify + dhcKeyCreateLink + dhcReadControl
Global Const dhcHKeyClassesRoot = &H80000000
Global Const dhcHKeyCurrentUser = &H80000001
Global Const dhcHKeyLocalMachine = &H80000002
Global Const dhcHKeyUsers = &H80000003
Global Const dhcHKeyPerformanceData = &H80000004



