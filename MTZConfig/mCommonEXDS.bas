Attribute VB_Name = "mCommonEXDS"
Option Explicit
'#define BFFM_SETSELECTIONA      (WM_USER + 102)
'#define BFFM_SETSELECTIONW      (WM_USER + 103)
'#define WM_USER                         0x0400
Const BFFM_SETSELECTIONA = &H400 + 102
Const BFFM_SETSELECTIONW = &H400 + 103

Public Const BIF_RETURNONLYFSDIRS = 1
Public Const BIF_DONTGOBELOWDOMAIN = 2
Public Const BIF_BROWSEFORCOMPUTER = &H1000   '// Browsing for Computers.
Public Const BIF_BROWSEFORPRINTER = &H12000  '// Browsing for Printers
Public Const BIF_BROWSEINCLUDEFILES = &H14000  '// Browsing for Everything

Public Const MAX_PATH = 260
Public Const WM_PAINT = &HF

Public Declare Function SHBrowseForFolder Lib "shell32" (lpbi As BrowseInfo) As Long

Public Declare Function SHGetPathFromIDList Lib "shell32" (ByVal pidList As Long, ByVal lpBuffer As String) As Long

Public Declare Function lstrcat Lib "kernel32" Alias "lstrcatA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long

Public Declare Function SendMessage2 Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Public Type BrowseInfo
   hWndOwner      As Long
   pIDLRoot       As Long
   pszDisplayName As Long
   lpszTitle      As Long
   ulFlags        As Long
   lpfnCallback   As Long
   lParam         As Long
   iImage         As Long
End Type

Global gFolder As String

Public Function BrowseCallbackProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal lParam As Long, ByVal lpData As Long) As Long
  Dim strTemp As String
  If uMsg = 1 Then '1 = BFFM_INITIALIZED
      If gFolder <> "" Then
          SendMessage2 hwnd, BFFM_SETSELECTIONW, 1, StrPtr(gFolder)
      End If
      Debug.Print "Initi..."
  End If
  BrowseCallbackProc = 0
End Function

Function mAddressOf(ByVal addr As Long) As Long
    mAddressOf = addr
End Function

