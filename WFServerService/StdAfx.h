// stdafx.h : include file for standard system include files,
//      or project specific include files that are used frequently,
//      but are changed infrequently

#if !defined(AFX_STDAFX_H__01E1A0EE_46BE_47C5_8081_2B218F628060__INCLUDED_)
#define AFX_STDAFX_H__01E1A0EE_46BE_47C5_8081_2B218F628060__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define STRICT
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0400
#endif
#define _ATL_APARTMENT_THREADED

#include <atlbase.h>
//You may derive a class from CComModule and use it if you want to override
//something, but do not change the name of _Module

class CServiceModule : public CComModule
{
public:
	HRESULT RegisterServer(BOOL bRegTypeLib, BOOL bService);
	HRESULT UnregisterServer();
	void Init(_ATL_OBJMAP_ENTRY* p, HINSTANCE h, UINT nServiceNameID, const GUID* plibid = NULL);
    void Start();
	void ServiceMain(DWORD dwArgc, LPTSTR* lpszArgv);
    void Handler(DWORD dwOpcode);
    void Run();
    BOOL IsInstalled();
    BOOL Install();
    BOOL Uninstall();
	LONG Unlock();
	void LogEvent(LPCTSTR pszFormat, ...);
	void LogEventCritical(LPCTSTR pFormat, ... );
    void SetServiceStatus(DWORD dwState);
    void SetupAsLocalServer();

//Implementation
private:
	static void WINAPI _ServiceMain(DWORD dwArgc, LPTSTR* lpszArgv);
    static void WINAPI _Handler(DWORD dwOpcode);

// data members
public:
    TCHAR m_szServiceName[256];
    SERVICE_STATUS_HANDLE m_hServiceStatus;
    SERVICE_STATUS m_status;
	DWORD dwThreadID;
	BOOL m_bService;
};

extern CServiceModule _Module;
#include <atlcom.h>
#include <ocidl.h>

class PicturePtr;

//#import "C:\\Program Files\\Common Files\\System\\ado\\msado27.tlb" no_namespace rename("EOF","ADOEOF")
//#import "C:\\MTZ\\MTZ\\MTZUtil\\MTZUtil.dll" no_namespace rename("Picture", "IUnknown")
#import "C:\\MTZ\\MTZ\\MTZSession\\MTZSession.dll" no_namespace rename("_LOGGER", "IUnknown") rename("_Recordset","IUnknown") rename ("template", "teemplate")
#import "C:\\MTZ\\MTZ\\WFServer\\WFServer.dll" no_namespace
#import "C:\\MTZ\\MTZ\\MTZManager\\MTZManager.dll" no_namespace rename("_Recordset","IUnknown") //rename("_Session", "IUnknown") 


//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STDAFX_H__01E1A0EE_46BE_47C5_8081_2B218F628060__INCLUDED)
