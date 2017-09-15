Attribute VB_Name = "OLEHelpers"
Option Explicit

Private Type GUID
Data1 As Long
Data2 As Integer
Data3 As Integer
Data4(7) As Byte
End Type

Private Type COSERVERINFO
dwReserved1 As Long ' DWORD
pwszName As Long ' LPWSTR
pAuthInfo As Long ' COAUTHINFO*
dwReserved2 As Long ' DWORD
End Type

Private Type MULTI_QI
piid As Long ' const IID*
pItf As Object ' IUnknown*
hr As Long ' HRESULT
End Type

Enum CLSCTX
CLSCTX_INPROC_SERVER = 1
CLSCTX_INPROC_HANDLER = 2
CLSCTX_LOCAL_SERVER = 4
CLSCTX_REMOTE_SERVER = 16
CLSCTX_SERVER = CLSCTX_INPROC_SERVER + CLSCTX_LOCAL_SERVER + CLSCTX_REMOTE_SERVER
CLSCTX_ALL = CLSCTX_INPROC_SERVER + CLSCTX_INPROC_HANDLER + CLSCTX_LOCAL_SERVER + CLSCTX_REMOTE_SERVER
End Enum

Private Const GMEM_FIXED = &H0
Private Const IID_IDispatch As String = "{00020400-0000-0000-C000-000000000046}"
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function IIDFromString Lib "OLE32" (ByVal lpszIID As String, ByVal piid As Long) As Long
Private Declare Function CLSIDFromString Lib "OLE32" (ByVal lpszCLSID As String, pclsid As GUID) As Long
Private Declare Function CLSIDFromProgID Lib "OLE32" (ByVal lpszProgID As String, pclsid As GUID) As Long
Private Declare Function CoCreateInstanceEx Lib "OLE32" (rclsid As GUID, ByVal pUnkOuter As Long, ByVal dwClsContext As Long, pServerInfo As COSERVERINFO, ByVal cmq As Long, rgmqResults As MULTI_QI) As Long
Private Declare Function lstrcpyW Lib "kernel32" (ByVal lpString1 As String, ByVal lpString2 As String) As Long
Private Declare Function StringFromGUID2 Lib "OLE32.DLL" (pGUID As GUID, ByVal s As String, ByVal sz As Long) As Long

Public Function GetCLSID_fromPROGID(ByVal ProgID As String) As String
Dim rclsid As GUID
Dim hr As Long
Dim i As Long
Dim j As Long
Dim out As String
    hr = CLSIDFromProgID(StrConv(ProgID, vbUnicode), rclsid)
    If hr <> 0 Then
        GetCLSID_fromPROGID = ""
    Else
        Dim s As String * 80
        s = Space(80) & Chr(0)
        i = StringFromGUID2(rclsid, s, 80)
 
        For j = 1 To 38
          out = out & Mid(s, j * 2 - 1, 1)
        Next
        
        GetCLSID_fromPROGID = out
    End If

End Function

