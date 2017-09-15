Attribute VB_Name = "FileBrowse"
Option Explicit
Option Base 0

Public Const MAX_PATH = 1024

Const WM_USER = &H400
Const BFFM_INITIALIZED = 1
Const BFFM_SELCHANGED = 2
Const BFFM_SETSTATUSTEXTA = WM_USER + 100
Const BFFM_ENABLEOK = WM_USER + 101
Const BFFM_SETSELECTIONA = WM_USER + 102
Const BFFM_SETSELECTIONW = WM_USER + 103
Const BFFM_SETSTATUSTEXTW = WM_USER + 104


Type shitemid
 cb As Integer
 abID(1) As Byte
End Type

Type itemidlist
 mkid As shitemid
End Type

Type browseinfo
 hwndOwner As Long
 pidlRoot As Long
 pszDisplayName As String
 lpszTitle As String
 ulFlags As Long
 lpfn As Long
 lParam As Long
 iImage As Long
End Type

Declare Function SHBrowseForFolder Lib "Shell32" (bi As browseinfo) As Long
Declare Function SHGetPathFromIDList Lib "Shell32" (ByVal pidl As Long, ByVal pszPath As String) As Long
Declare Function SHGetSpecialFolderLocation Lib "Shell32" (ByVal hwndOwner As Long, ByVal nFolder As Long, lpitemidlist As Long) As Long
Declare Sub CoTaskMemFree Lib "ole32.dll" (ByVal hMem As Long)

