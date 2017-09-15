Attribute VB_Name = "launcher"
Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type

Public Type Point
    x As Long
    y As Long
End Type

Public Const HWND_TOPMOST = -1
Public Const SWP_NOSIZE = &H1
Public Const HWND_TOP = 0
Public Const SWP_NOMOVE = &H2
Public Const SWP_SHOWWINDOW = &H40
Public Const GWL_STYLE = (-16)
Public Const SWP_NOZORDER = &H4
Public Const SWP_FRAMECHANGED = &H20
   
Public Const SW_HIDE = 0
Public Const SW_MAXIMIZE = 3
Public Const SW_MINIMIZE = 6
Public Const SW_RESTORE = 9
Public Const SW_SHOW = 5
Public Const SW_SHOWMAXIMIZED = 3
Public Const SW_SHOWMINIMIZED = 2
Public Const SW_SHOWMINNOACTIVE = 7
Public Const SW_SHOWNA = 8
Public Const SW_SHOWNOACTIVATE = 4
Public Const SW_SHOWNORMAL = 1


' Public Declare Sub OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String)
Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Private Declare Function GetScrollPos Lib "User32.dll" (ByVal hWnd As Long, ByVal nBar As Integer) As Integer
Private Declare Function PostMessageA Lib "User32.dll" (ByVal hWnd As Long, ByVal Msg As Long, ByVal WParm As Long, ByVal lParm As Integer) As Long



Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpbuffer As String, nSize As Long) As Long
Public Declare Function FlashWindow Lib "user32" (ByVal hWnd As Long, ByVal bInvert As Long) As Long

Public Declare Function GetCaretBlinkTime Lib "user32" () As Long
Public Declare Function GetCurrentProcess Lib "kernel32" () As Long
Public Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long



Public Declare Function Shell_NotifyIcon Lib "shell32.dll" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, IpData As NOTIFYICONDATA) As Long

Public Type NOTIFYICONDATA
 cbSize As Long
 hWnd As Long
 uID As Long
 uFlags As Long
 uCallbackMessage As Long
 hIcon As Long
 szTip As String * 64
End Type

Public Const NIM_ADD = &H0
Public Const NIM_MODIFY = &H1
Public Const NIM_DELETE = &H2
Public Const NIF_MESSAGE = &H1
Public Const NIF_ICON = &H2
Public Const NIF_TIP = &H4
Public Const NIF_DOALL = NIF_MESSAGE Or NIF_ICON Or NIF_TIP
Public Const WM_MOUSEMOVE = &H200
Public Const WM_LBUTTONDBLCLK = &H203
Public Const WM_LBUTTONDOWN = &H201
Public Const WM_RBUTTONDOWN = &H204

Public Const HKEY_CLASSES_ROOT = &H80000000
Public Const HKEY_CURRENT_USER = &H80000001
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public Const HKEY_USERS = &H80000003
Public Const HKEY_CURRENT_CONFIG = &H80000005
Public Const HKEY_DYN_DATA = &H80000006

'Registry Specific Access Rights
Public Const KEY_QUERY_VALUE = &H1
Public Const KEY_SET_VALUE = &H2
Public Const KEY_CREATE_SUB_KEY = &H4
Public Const KEY_ENUMERATE_SUB_KEYS = &H8
Public Const KEY_NOTIFY = &H10
Public Const KEY_CREATE_LINK = &H20
Public Const KEY_ALL_ACCESS = &H3F

'Open/Create Options
Public Const REG_OPTION_NON_VOLATILE = 0&
Public Const REG_OPTION_VOLATILE = &H1

'Key creation/open disposition
Public Const REG_CREATED_NEW_KEY = &H1
Public Const REG_OPENED_EXISTING_KEY = &H2

'masks for the predefined standard access types
Public Const STANDARD_RIGHTS_ALL = &H1F0000
Public Const SPECIFIC_RIGHTS_ALL = &HFFFF

'Define severity codes
Public Const ERROR_SUCCESS = 0&
Public Const ERROR_ACCESS_DENIED = 5
Public Const ERROR_NO_MORE_ITEMS = 259

'Predefined Value Types

'No value type
Public Const REG_NONE = (0)
'Unicode nul terminated string
Public Const REG_SZ = (1)
'Unicode nul terminated string w/enviornment var
Public Const REG_EXPAND_SZ = (2)
'Free form binary
Public Const REG_BINARY = (3)
'32-bit number
Public Const REG_DWORD = (4)
'32-bit number (same as REG_DWORD)
Public Const REG_DWORD_LITTLE_ENDIAN = (4)
'32-bit number
Public Const REG_DWORD_BIG_ENDIAN = (5)
'Symbolic Link (unicode)
Public Const REG_LINK = (6)
'Multiple Unicode strings
Public Const REG_MULTI_SZ = (7)
'Resource list in the resource map
Public Const REG_RESOURCE_LIST = (8)
'Resource list in the hardware description
Public Const REG_FULL_RESOURCE_DESCRIPTOR = (9)
Public Const REG_RESOURCE_REQUIREMENTS_LIST = (10)


'Structures Needed For Registry Prototypes
Type SECURITY_ATTRIBUTES
  nLength As Long
  lpSecurityDescriptor As Long
  bInheritHandle As Boolean
End Type

Type FILETIME
  dwLowDateTime As Long
  dwHighDateTime As Long
End Type

'Registry Functions
Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long
Declare Function RegCreateKeyEx Lib "advapi32" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, lpSecurityAttributes As SECURITY_ATTRIBUTES, phkResult As Long, lpdwDisposition As Long) As Long
Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Declare Function RegEnumKeyEx Lib "advapi32.dll" Alias "RegEnumKeyExA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, ByVal lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As FILETIME) As Long
Declare Function RegEnumValue Lib "advapi32.dll" Alias "RegEnumValueA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal szData As String, ByRef lpcbData As Long) As Long
Declare Function RegSetValueEx Lib "advapi32" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal szData As String, ByVal cbData As Long) As Long



Public Function GetUser() As String
  Dim sBuffer As String
  Dim lSize As Long
  Dim mUserName  As String
  sBuffer = Space$(255)
  lSize = Len(sBuffer)
  Call GetUserName(sBuffer, lSize)
  GetUser = Left$(sBuffer, lSize)
End Function
