// WFServerService.cpp : Implementation of WinMain


// Note: Proxy/Stub Information
//      To build a separate proxy/stub DLL, 
//      run nmake -f WFServerServiceps.mk in the project directory.

#include "stdafx.h"
#include "resource.h"
#include <initguid.h>
#include "WFServerService.h"

#include "WFServerService_i.c"


#include <stdio.h>

CServiceModule _Module;
UINT ThreadNavigate(void * Param);


static HANDLE hThread;
static DWORD ThreadID;
static HANDLE hEventStop;
static HANDLE hEventApproved;
static bool bStopThread;
static bool bLogIt;
static unsigned long lWaitInterval;
static _ServerPtr pWFServer;
static _MainPtr pMTZManager;
static _SessionPtr pMTZSession;


BEGIN_OBJECT_MAP(ObjectMap)
END_OBJECT_MAP()


LPCTSTR FindOneOf(LPCTSTR p1, LPCTSTR p2)
{
    while (p1 != NULL && *p1 != NULL)
    {
        LPCTSTR p = p2;
        while (p != NULL && *p != NULL)
        {
            if (*p1 == *p)
                return CharNext(p1);
            p = CharNext(p);
        }
        p1 = CharNext(p1);
    }
    return NULL;
}

// Although some of these functions are big they are declared inline since they are only used once

inline HRESULT CServiceModule::RegisterServer(BOOL bRegTypeLib, BOOL bService)
{
    HRESULT hr = CoInitialize(NULL);
    if (FAILED(hr))
        return hr;

    // Remove any previous service since it may point to
    // the incorrect file
    Uninstall();

    // Add service entries
    UpdateRegistryFromResource(IDR_WFServerService, TRUE);

    // Adjust the AppID for Local Server or Service
    CRegKey keyAppID;
    LONG lRes = keyAppID.Open(HKEY_CLASSES_ROOT, _T("AppID"), KEY_WRITE);
    if (lRes != ERROR_SUCCESS)
        return lRes;

    CRegKey key;
    lRes = key.Open(keyAppID, _T("{CA11B2C8-F438-4497-94C7-C3D6A7FE93D6}"), KEY_WRITE);
    if (lRes != ERROR_SUCCESS)
        return lRes;
    key.DeleteValue(_T("LocalService"));
    
    if (bService)
    {
        key.SetValue(_T("WFServerService"), _T("LocalService"));
        key.SetValue(_T("-Service"), _T("ServiceParameters"));
        // Create service
        Install();
    }

    // Add object entries
    hr = CComModule::RegisterServer(bRegTypeLib);

    CoUninitialize();
    return hr;
}

inline HRESULT CServiceModule::UnregisterServer()
{
    HRESULT hr = CoInitialize(NULL);
    if (FAILED(hr))
        return hr;

    // Remove service entries
    UpdateRegistryFromResource(IDR_WFServerService, FALSE);
    // Remove service
    Uninstall();
    // Remove object entries
    CComModule::UnregisterServer(TRUE);
    CoUninitialize();
    return S_OK;
}

inline void CServiceModule::Init(_ATL_OBJMAP_ENTRY* p, HINSTANCE h, UINT nServiceNameID, const GUID* plibid)
{
    CComModule::Init(p, h, plibid);

    m_bService = TRUE;

    LoadString(h, nServiceNameID, m_szServiceName, sizeof(m_szServiceName) / sizeof(TCHAR));

    // set up the initial service status 
    m_hServiceStatus = NULL;
    m_status.dwServiceType = SERVICE_WIN32_OWN_PROCESS;
    m_status.dwCurrentState = SERVICE_STOPPED;
    m_status.dwControlsAccepted = SERVICE_ACCEPT_STOP;
    m_status.dwWin32ExitCode = 0;
    m_status.dwServiceSpecificExitCode = 0;
    m_status.dwCheckPoint = 0;
    m_status.dwWaitHint = 0;
}

LONG CServiceModule::Unlock()
{
    LONG l = CComModule::Unlock();
    if (l == 0 && !m_bService)
        PostThreadMessage(dwThreadID, WM_QUIT, 0, 0);
    return l;
}

BOOL CServiceModule::IsInstalled()
{
    BOOL bResult = FALSE;

    SC_HANDLE hSCM = ::OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);

    if (hSCM != NULL)
    {
        SC_HANDLE hService = ::OpenService(hSCM, m_szServiceName, SERVICE_QUERY_CONFIG);
        if (hService != NULL)
        {
            bResult = TRUE;
            ::CloseServiceHandle(hService);
        }
        ::CloseServiceHandle(hSCM);
    }
    return bResult;
}

inline BOOL CServiceModule::Install()
{
    if (IsInstalled())
        return TRUE;

    SC_HANDLE hSCM = ::OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);
    if (hSCM == NULL)
    {
        MessageBox(NULL, _T("Couldn't open service manager"), m_szServiceName, MB_OK);
        return FALSE;
    }

    // Get the executable file path
    TCHAR szFilePath[_MAX_PATH];
    ::GetModuleFileName(NULL, szFilePath, _MAX_PATH);

    SC_HANDLE hService = ::CreateService(
        hSCM, m_szServiceName, m_szServiceName,
        SERVICE_ALL_ACCESS, SERVICE_WIN32_OWN_PROCESS,
        SERVICE_DEMAND_START, SERVICE_ERROR_NORMAL,
        szFilePath, NULL, NULL, _T("RPCSS\0"), NULL, NULL);

    if (hService == NULL)
    {
        ::CloseServiceHandle(hSCM);
        MessageBox(NULL, _T("Couldn't create service"), m_szServiceName, MB_OK);
        return FALSE;
    }

    ::CloseServiceHandle(hService);
    ::CloseServiceHandle(hSCM);
    return TRUE;
}

inline BOOL CServiceModule::Uninstall()
{
    if (!IsInstalled())
        return TRUE;

    SC_HANDLE hSCM = ::OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);

    if (hSCM == NULL)
    {
        MessageBox(NULL, _T("Couldn't open service manager"), m_szServiceName, MB_OK);
        return FALSE;
    }

    SC_HANDLE hService = ::OpenService(hSCM, m_szServiceName, SERVICE_STOP | DELETE);

    if (hService == NULL)
    {
        ::CloseServiceHandle(hSCM);
        MessageBox(NULL, _T("Couldn't open service"), m_szServiceName, MB_OK);
        return FALSE;
    }
    SERVICE_STATUS status;
    ::ControlService(hService, SERVICE_CONTROL_STOP, &status);

    BOOL bDelete = ::DeleteService(hService);
    ::CloseServiceHandle(hService);
    ::CloseServiceHandle(hSCM);

    if (bDelete)
        return TRUE;

    MessageBox(NULL, _T("Service could not be deleted"), m_szServiceName, MB_OK);
    return FALSE;
}

///////////////////////////////////////////////////////////////////////////////////////
// Logging functions
void CServiceModule::LogEventCritical(LPCTSTR pFormat, ... )
{
    TCHAR    chMsg[1024];
    HANDLE  hEventSource;
    LPTSTR  lpszStrings[1];
    va_list pArg;

    va_start(pArg, pFormat);
    _vstprintf(chMsg, pFormat, pArg);
    va_end(pArg);

    lpszStrings[0] = chMsg;

    if (m_bService)
    {
        /* Get a handle to use with ReportEvent(). */
        hEventSource = RegisterEventSource(NULL, m_szServiceName);
        if (hEventSource != NULL)
        {
            /* Write to event log. */
            ReportEvent(hEventSource, EVENTLOG_ERROR_TYPE, 0, 0, NULL, 1, 0, (LPCTSTR*) &lpszStrings[0], NULL);
            DeregisterEventSource(hEventSource);
        }
    }
    else
    {
        // As we are not running as a service, just write the error to the console.
        _putts(chMsg);
    }

}



void CServiceModule::LogEvent(LPCTSTR pFormat, ...)
{
    TCHAR    chMsg[256];
    HANDLE  hEventSource;
    LPTSTR  lpszStrings[1];
    va_list pArg;

    va_start(pArg, pFormat);
    _vstprintf(chMsg, pFormat, pArg);
    va_end(pArg);

    lpszStrings[0] = chMsg;

    if (m_bService)
    {
        /* Get a handle to use with ReportEvent(). */
        hEventSource = RegisterEventSource(NULL, m_szServiceName);
        if (hEventSource != NULL)
        {
            /* Write to event log. */
            ReportEvent(hEventSource, EVENTLOG_INFORMATION_TYPE, 0, 0, NULL, 1, 0, (LPCTSTR*) &lpszStrings[0], NULL);
            DeregisterEventSource(hEventSource);
        }
    }
    else
    {
        // As we are not running as a service, just write the error to the console.
        _putts(chMsg);
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////
// Service startup and registration
inline void CServiceModule::Start()
{
    SERVICE_TABLE_ENTRY st[] =
    {
        { m_szServiceName, _ServiceMain },
        { NULL, NULL }
    };
    if (m_bService && !::StartServiceCtrlDispatcher(st))
    {
        m_bService = FALSE;
    }
    if (m_bService == FALSE)
        Run();
}

inline void CServiceModule::ServiceMain(DWORD /* dwArgc */, LPTSTR* /* lpszArgv */)
{
    // Register the control request handler
    m_status.dwCurrentState = SERVICE_START_PENDING;
    m_hServiceStatus = RegisterServiceCtrlHandler(m_szServiceName, _Handler);
    if (m_hServiceStatus == NULL)
    {
        LogEvent(_T("Handler not installed"));
        return;
    }
    SetServiceStatus(SERVICE_START_PENDING);

    m_status.dwWin32ExitCode = S_OK;
    m_status.dwCheckPoint = 0;
    m_status.dwWaitHint = 0;

    // When the Run function returns, the service has stopped.
    Run();

    SetServiceStatus(SERVICE_STOPPED);
    LogEvent(_T("Service stopped"));
}

inline void CServiceModule::Handler(DWORD dwOpcode)
{
    switch (dwOpcode)
    {
    case SERVICE_CONTROL_STOP:

		OutputDebugString("Trying stop the working thread!");
		SetEvent (hEventStop);

        SetServiceStatus(SERVICE_STOP_PENDING);
        PostThreadMessage(dwThreadID, WM_QUIT, 0, 0);
        break;
    case SERVICE_CONTROL_PAUSE:
        break;
    case SERVICE_CONTROL_CONTINUE:
        break;
    case SERVICE_CONTROL_INTERROGATE:
        break;
    case SERVICE_CONTROL_SHUTDOWN:
        break;
    default:
        LogEvent(_T("Bad service request"));
    }
}

void WINAPI CServiceModule::_ServiceMain(DWORD dwArgc, LPTSTR* lpszArgv)
{
    _Module.ServiceMain(dwArgc, lpszArgv);
}
void WINAPI CServiceModule::_Handler(DWORD dwOpcode)
{
    _Module.Handler(dwOpcode); 
}

void CServiceModule::SetServiceStatus(DWORD dwState)
{
    m_status.dwCurrentState = dwState;
    ::SetServiceStatus(m_hServiceStatus, &m_status);
}

void CServiceModule::Run()
{
    _Module.dwThreadID = GetCurrentThreadId();

    //HRESULT hr = CoInitialize(NULL);
//  If you are running on NT 4.0 or higher you can use the following call
//  instead to make the EXE free threaded.
//  This means that calls come in on a random RPC thread
    HRESULT hr = CoInitializeEx(NULL, COINIT_MULTITHREADED);

    _ASSERTE(SUCCEEDED(hr));

    // This provides a NULL DACL which will allow access to everyone.
    CSecurityDescriptor sd;
    sd.InitializeFromThreadToken();
    hr = CoInitializeSecurity(sd, -1, NULL, NULL,
        RPC_C_AUTHN_LEVEL_PKT, RPC_C_IMP_LEVEL_IMPERSONATE, NULL, EOAC_NONE, NULL);
    _ASSERTE(SUCCEEDED(hr));

    hr = _Module.RegisterClassObjects(CLSCTX_LOCAL_SERVER | CLSCTX_REMOTE_SERVER, REGCLS_MULTIPLEUSE);
    _ASSERTE(SUCCEEDED(hr));


	// Грузим параметры из реестра
	char chUserName [1024]="";
	char chUserPassword [1024]="";
	char chSiteName [1024]="";
	unsigned long keylen=1024;
	unsigned long ulLogit=0;


	CRegKey RKey;
	if (RKey.Open(HKEY_LOCAL_MACHINE,"SOFTWARE\\MTZ\\WFServerService")!=ERROR_SUCCESS)
	{
		LogEventCritical(_T("Failed access to registry!"));
		return;
	}

	RKey.QueryValue(ulLogit,"LogIt");
	if (ulLogit==1) bLogIt = true;
	else bLogIt = false;

	keylen=1024;
	RKey.QueryValue(chUserName,"UserName",&keylen);

	keylen=1024;
	RKey.QueryValue(chUserPassword,"UserPassword",&keylen);

	keylen=1024;
	RKey.QueryValue(chSiteName,"SiteName",&keylen);
	RKey.QueryValue(lWaitInterval,"WaitInterval");

	
	try
	{
		// Создаем WFServer

		//HRESULT hrCreate = pWFServer.CreateInstance(__uuidof(_Server));
		HRESULT hrCreate = pWFServer.CreateInstance("WFServer.Server");
		if (!SUCCEEDED(hrCreate)) {
			char eInfo[256];
			wsprintf(eInfo, "Failed to create WFServer! Code %x", (long)hrCreate);
			LogEventCritical((LPCTSTR)eInfo);
			return;
		}

		// Создаем MTZManager
		//hrCreate = pMTZManager.CreateInstance(__uuidof(_Main));
		hrCreate = pMTZManager.CreateInstance("MTZManager.Main");
		if (!SUCCEEDED(hrCreate)) {
			char eInfo[256];
			wsprintf(eInfo, "Failed to create MTZManager! Code %x", (long)hrCreate);
			LogEventCritical((LPCTSTR)eInfo);
			return;
		}

		// Коннектимся...
		_bstr_t bstrSite(chSiteName);
		BSTR Val = (BSTR)bstrSite;
		_Session *pUnk;
		
		pMTZManager->raw_GetSession(&Val, &pUnk);
		pMTZSession = pUnk;
		
		// Логонимся в сессию...
		VARIANT_BOOL bResult=VARIANT_FALSE;
		USES_CONVERSION;

		_bstr_t bstrtUN(chUserName);
		BSTR bsUserName = bstrtUN;
		_bstr_t bstrtUP(chUserPassword);
		BSTR bsPassword = bstrtUP;

		pMTZSession->raw_Login(&bsUserName,&bsPassword,&bResult);
		
		if (bResult==VARIANT_FALSE)
		{
			// Логин не прошёл, отваливаемся...
			LogEventCritical("Login failed");
			return;
		}
		IUnknown *pUnknown;
		IUnknown *pUnknown2;
		pUnknown = pMTZManager.GetInterfacePtr();
		pUnknown->AddRef();
		pUnknown2 = pMTZSession.GetInterfacePtr();
		pUnknown2->AddRef();
		
		pWFServer->raw_Attach ((_Main**)&pUnknown, (_Session**)&pUnknown2);
		
		// создаем поток, который и будет работать за нас :)

		hEventStop = CreateEvent (NULL,true,false, "TheMTZWFStopEvent");
		ResetEvent (hEventStop);
		hEventApproved  = CreateEvent (NULL,true,false, "TheMTZWFStopEventOK");
		ResetEvent (hEventApproved);
		bStopThread = false;

		//Create working thread
		hThread = CreateThread( NULL, 0,
					  (LPTHREAD_START_ROUTINE) ThreadNavigate,
					  NULL,
					  0,
					  &ThreadID
					);
		
		if (hThread==0)
		{
			LogEventCritical(_T("Failed to create thread!"));
			return;
		}

	}
	catch (_com_error  e)
	{
		LogEventCritical((LPCTSTR)e.Description());
		return;
	}
	catch (...)
	{
		LogEventCritical(_T("pDDSchedule->AddEvent!"));
		return;
	}
	


    LogEvent(_T("Service started"));
    if (m_bService)
        SetServiceStatus(SERVICE_RUNNING);

    MSG msg;
    while (GetMessage(&msg, 0, 0, 0))
        DispatchMessage(&msg);


	//Stopping...
	//Waiting for event
	WaitForSingleObject(hEventStop,INFINITE);
	//Destroying objects
	try{
		bStopThread = false;
		SetEvent (hEventStop);
		WaitForSingleObject(hEventApproved, INFINITE);
		
		pWFServer->raw_Detach();
		pWFServer.Release();
		pWFServer = NULL;

		VARIANT_BOOL bResult;
		pMTZSession->raw_Logout(&bResult);
		pMTZSession->raw_CloseClass();
		pMTZSession.Release();
		pMTZSession = NULL;

		pMTZManager->raw_CloseClass();
		pMTZManager.Release();
		pMTZManager = NULL;
		
	}

	catch (...) {}

    _Module.RevokeClassObjects();

    CoUninitialize();
}

/////////////////////////////////////////////////////////////////////////////
//
extern "C" int WINAPI _tWinMain(HINSTANCE hInstance, 
    HINSTANCE /*hPrevInstance*/, LPTSTR lpCmdLine, int /*nShowCmd*/)
{
    lpCmdLine = GetCommandLine(); //this line necessary for _ATL_MIN_CRT
    _Module.Init(ObjectMap, hInstance, IDS_SERVICENAME, &LIBID_WFSERVERSERVICELib);
    _Module.m_bService = TRUE;

    TCHAR szTokens[] = _T("-/");

    LPCTSTR lpszToken = FindOneOf(lpCmdLine, szTokens);
    while (lpszToken != NULL)
    {
        if (lstrcmpi(lpszToken, _T("UnregServer"))==0)
            return _Module.UnregisterServer();

        // Register as Local Server
        if (lstrcmpi(lpszToken, _T("RegServer"))==0)
            return _Module.RegisterServer(TRUE, FALSE);
        
        // Register as Service
        if (lstrcmpi(lpszToken, _T("Service"))==0)
            return _Module.RegisterServer(TRUE, TRUE);
        
        lpszToken = FindOneOf(lpszToken, szTokens);
    }

    // Are we Service or Local Server
    CRegKey keyAppID;
    LONG lRes = keyAppID.Open(HKEY_CLASSES_ROOT, _T("AppID"), KEY_READ);
    if (lRes != ERROR_SUCCESS)
        return lRes;

    CRegKey key;
    lRes = key.Open(keyAppID, _T("{CA11B2C8-F438-4497-94C7-C3D6A7FE93D6}"), KEY_READ);
    if (lRes != ERROR_SUCCESS)
        return lRes;

    TCHAR szValue[_MAX_PATH];
    DWORD dwLen = _MAX_PATH;
    lRes = key.QueryValue(szValue, _T("LocalService"), &dwLen);

    _Module.m_bService = FALSE;
    if (lRes == ERROR_SUCCESS)
        _Module.m_bService = TRUE;

    _Module.Start();

    // When we get here, the service has been stopped
    return _Module.m_status.dwWin32ExitCode;
}


UINT ThreadNavigate(void * Param)
{	

	_Module.LogEvent("Work thread started...");
	

				
	if (bLogIt)
	{
		// Логируем все параметры... для отладки			
	}

	while (WaitForSingleObject(hEventStop,1)==WAIT_TIMEOUT)	
	{
		BSTR oneStep;
		Sleep(lWaitInterval);
		pWFServer->raw_OneStep(&oneStep);
		_bstr_t TheF_Result(oneStep);
		OutputDebugString((LPCTSTR) TheF_Result); 
		
		SysFreeString(oneStep);
	}

	_Module.LogEvent("Synchro thread ended...");
	SetEvent (hEventApproved);
	return 0;

}

