VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "regUtil"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_HelpID = 360
Option Explicit

'название раздела и переменных для настроек проекта
Private Const strSubKey = ""
'сообщение об ошибках
Private Const strRegistryError = "Ошибка работы с регистрационной базой данных"

'дескриптор раздела Registry для хранения настроек проекта
Private m_hRegistryKey As Long
'код последней ошибки
Private m_lLastError As Long
Private Const REG_DWORD = 4&
   
'для работы с Registry
Public Enum RegestryRoots
    HKEY_CURRENT_USER = &H80000001
    HKEY_LOCAL_MACHINE = &H80000002
    HKEY_CLASSES_ROOT = &H80000000
End Enum

Public Enum TRights
    ReadWrite = 1
    ReadOnly = 2
End Enum

Private Const ERROR_SUCCESS = 0&
Private Const REG_SZ = 1                         ' Unicode nul terminated string
Private Const REG_OPTION_NON_VOLATILE = 0

Private Const SYNCHRONIZE = &H100000
Private Const READ_CONTROL = &H20000

Private Const STANDARD_RIGHTS_READ = (READ_CONTROL)
Private Const STANDARD_RIGHTS_WRITE = (READ_CONTROL)
Private Const STANDARD_RIGHTS_ALL = &H1F0000

Private Const KEY_QUERY_VALUE = &H1
Private Const KEY_SET_VALUE = &H2
Private Const KEY_CREATE_SUB_KEY = &H4
Private Const KEY_ENUMERATE_SUB_KEYS = &H8
Private Const KEY_NOTIFY = &H10
Private Const KEY_CREATE_LINK = &H20

Private Const KEY_ALL_ACCESS = ((STANDARD_RIGHTS_ALL Or KEY_QUERY_VALUE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY Or KEY_CREATE_LINK) And (Not SYNCHRONIZE))
Private Const KEY_READ = ((STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) And (Not SYNCHRONIZE))
Private Const KEY_WRITE = ((STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))
'права доступа при открытии Registry
Public Rights As TRights
Attribute Rights.VB_VarHelpID = 405
Private Const ctAccessRight = KEY_READ Or KEY_WRITE
Private Const ctAccessRightTest = KEY_READ

'максимальная длина (символов) значения строкового параметра,
'который может быть прочитан с помощью GetRegValueStr
Private Const cMaxDataLen = 32000
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long
Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegQueryValueExStr Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Private Declare Function RegSetValueExStr Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
Private Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Private Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long

'---------------------------------------------------------------------------------------------
'Метод:         IsValid()
'Назначение:    Проверка корректности данного объекта
'Параметры:     Нет
'Возвращает:    True - нужный раздел Registry открылся успешно
'---------------------------------------------------------------------------------------------
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  DeleteKey
'  DeleteValue
'  GetDefaultValue
'  GetLastErrorCode
'  GetValue
'  GetValueLng
'  OpenKey
'  Rights
'  SetDefaultValue
'  SetValue
'  SetValueLng
'  TestKey
'Example:
' dim variable as Boolean
'  variable = me.IsValid()
Public Function IsValid() As Boolean
Attribute IsValid.VB_HelpID = 395
    IsValid = CBool(m_hRegistryKey <> 0)
End Function

'---------------------------------------------------------------------------------------------
'Метод:         GetLastErrorCode()
'Назначение:    Запрос кода последней ошибки
'Параметры:     Нет
'Возвращает:    Код последней ошибки (winerror.h) или 0
'---------------------------------------------------------------------------------------------
'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  DeleteKey
'  DeleteValue
'  GetDefaultValue
'  GetValue
'  GetValueLng
'  IsValid
'  OpenKey
'  Rights
'  SetDefaultValue
'  SetValue
'  SetValueLng
'  TestKey
'Example:
' dim variable as Long
'  variable = me.GetLastErrorCode()
Public Function GetLastErrorCode() As Long
Attribute GetLastErrorCode.VB_HelpID = 380
    GetLastErrorCode = m_lLastError
End Function

Private Sub Class_Initialize()
    'создание (открытие существующего) раздела Registry для хранения настроек проекта
    'Dim dwDisposition As Long
    'm_lLastError = RegCreateKeyEx(hKey:=HKEY_CLASSES_ROOT, lpSubKey:=strSubKey, Reserved:=0, lpClass:=vbNullString, _
                    dwOptions:=REG_OPTION_NON_VOLATILE, samDesired:=ctAccessRight, lpSecurityAttributes:=0, _
                    phkResult:=m_hRegistryKey, lpdwDisposition:=dwDisposition)
    ''Debug.Assert (m_lLastError = ERROR_SUCCESS)
    Rights = ReadOnly
End Sub
Private Sub Class_Terminate()
    If m_hRegistryKey Then
        m_lLastError = RegCloseKey(m_hRegistryKey)
        ''Debug.Assert (m_lLastError = ERROR_SUCCESS)
    End If
End Sub
' открыть ключ реестра
'Parameters:
'[IN]   strSubKey , тип параметра: String ключ,
'[IN]   hKeyIn , тип параметра: RegestryRoots = HKEY_CLASSES_ROOT - хранилище,
'[IN][OUT]   Optional CreateKey , тип параметра: Boolean = True  - создавать новый
'Returns:
' Boolean, семантика результата:
'   true  - открыт
'   false - нет
'See Also:
'  DeleteKey
'  DeleteValue
'  GetDefaultValue
'  GetLastErrorCode
'  GetValue
'  GetValueLng
'  IsValid
'  Rights
'  SetDefaultValue
'  SetValue
'  SetValueLng
'  TestKey
'Example:
' dim variable as Boolean
' variable = me.OpenKey(...параметры...)
Public Function OpenKey(ByVal strSubKey As String, Optional ByVal hKeyIn As RegestryRoots = HKEY_CLASSES_ROOT, Optional CreateKey As Boolean = True) As Boolean
Attribute OpenKey.VB_HelpID = 400
    'создание (открытие существующего) раздела Registry для хранения настроек проекта
    Class_Terminate
    OpenKey = False
    Dim dwDisposition As Long
    Dim AccRights
    Select Case Rights
        Case TRights.ReadWrite:
            AccRights = ctAccessRight
        Case TRights.ReadOnly:
            AccRights = ctAccessRightTest
    End Select
    If Not CreateKey Then
        m_lLastError = RegOpenKeyEx(hKeyIn, strSubKey, 0, AccRights, m_hRegistryKey)
    Else
        m_lLastError = RegCreateKeyEx(hKey:=hKeyIn, lpSubKey:=strSubKey, Reserved:=0, lpClass:=vbNullString, _
                        dwOptions:=REG_OPTION_NON_VOLATILE, samDesired:=AccRights, lpSecurityAttributes:=0, _
                        phkResult:=m_hRegistryKey, lpdwDisposition:=dwDisposition)
    End If
    If m_lLastError = ERROR_SUCCESS Then OpenKey = True
    ''Debug.Assert (m_lLastError = ERROR_SUCCESS)
End Function
'получить значение
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  DeleteKey
'  DeleteValue
'  GetLastErrorCode
'  GetValue
'  GetValueLng
'  IsValid
'  OpenKey
'  Rights
'  SetDefaultValue
'  SetValue
'  SetValueLng
'  TestKey
'Example:
' dim variable as String
'  variable = me.GetDefaultValue()
Public Function GetDefaultValue() As String
Attribute GetDefaultValue.VB_HelpID = 375
Dim strValue As String
    Call GetRegValueStr("", strValue)
    GetDefaultValue = strValue
End Function
'удалить значение
'Parameters:
'[IN]   strName , тип параметра: String  - значение
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  DeleteKey
'  GetDefaultValue
'  GetLastErrorCode
'  GetValue
'  GetValueLng
'  IsValid
'  OpenKey
'  Rights
'  SetDefaultValue
'  SetValue
'  SetValueLng
'  TestKey
'Example:
' dim variable as Boolean
' variable = me.DeleteValue(...параметры...)
Public Function DeleteValue(ByVal strName As String) As Boolean
Attribute DeleteValue.VB_HelpID = 370
    m_lLastError = RegDeleteValue(m_hRegistryKey, strName)
    If m_lLastError = ERROR_SUCCESS Then DeleteValue = True
End Function
'удалить ключ
'Parameters:
'[IN][OUT]  strChildKey, тип параметра: Variant  - ключ
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  DeleteValue
'  GetDefaultValue
'  GetLastErrorCode
'  GetValue
'  GetValueLng
'  IsValid
'  OpenKey
'  Rights
'  SetDefaultValue
'  SetValue
'  SetValueLng
'  TestKey
'Example:
' dim variable as Boolean
' variable = me.DeleteKey(...параметры...)
Public Function DeleteKey(strChildKey) As Boolean
Attribute DeleteKey.VB_HelpID = 365
    m_lLastError = RegDeleteKey(m_hRegistryKey, strChildKey)
    If m_lLastError = ERROR_SUCCESS Then DeleteKey = True
End Function
'получить значение
'Parameters:
'[IN]   strName , тип параметра: String  - название
'Returns:
'  значение типа String
'See Also:
'  DeleteKey
'  DeleteValue
'  GetDefaultValue
'  GetLastErrorCode
'  GetValueLng
'  IsValid
'  OpenKey
'  Rights
'  SetDefaultValue
'  SetValue
'  SetValueLng
'  TestKey
'Example:
' dim variable as String
' variable = me.GetValue(...параметры...)
Public Function GetValue(ByVal strName As String) As String
Attribute GetValue.VB_HelpID = 385
Dim strValue As String
    Call GetRegValueStr(strName, strValue)
    GetValue = strValue
End Function
' получить число
'Parameters:
'[IN]   strName , тип параметра: String  - название
'Returns:
'  значение типа Long
'See Also:
'  DeleteKey
'  DeleteValue
'  GetDefaultValue
'  GetLastErrorCode
'  GetValue
'  IsValid
'  OpenKey
'  Rights
'  SetDefaultValue
'  SetValue
'  SetValueLng
'  TestKey
'Example:
' dim variable as Long
' variable = me.GetValueLng(...параметры...)
Public Function GetValueLng(ByVal strName As String) As Long
Attribute GetValueLng.VB_HelpID = 390
Dim lValue As Long
    Call GetRegValueLng(strName, lValue)
    GetValueLng = lValue
End Function
'задать значение
'Parameters:
'[IN]   strName , тип параметра: String - название
'[IN]   Value , тип параметра: String  - значение
'Returns:
' Boolean, семантика результата:
'   true  - задано
'   false -
'See Also:
'  DeleteKey
'  DeleteValue
'  GetDefaultValue
'  GetLastErrorCode
'  GetValue
'  GetValueLng
'  IsValid
'  OpenKey
'  Rights
'  SetDefaultValue
'  SetValueLng
'  TestKey
'Example:
' dim variable as Boolean
' variable = me.SetValue(...параметры...)
Public Function SetValue(ByVal strName As String, ByVal Value As String) As Boolean
Attribute SetValue.VB_HelpID = 415
    SetValue = SetRegValueStr(strName, Value)
End Function
'задать значение по умолчаию
'Parameters:
'[IN]   Value , тип параметра: String  - значение
'Returns:
' Boolean, семантика результата:
'   true  - задано
'   false -
'See Also:
'  DeleteKey
'  DeleteValue
'  GetDefaultValue
'  GetLastErrorCode
'  GetValue
'  GetValueLng
'  IsValid
'  OpenKey
'  Rights
'  SetValue
'  SetValueLng
'  TestKey
'Example:
' dim variable as Boolean
' variable = me.SetDefaultValue(...параметры...)
Public Function SetDefaultValue(ByVal Value As String) As Boolean
Attribute SetDefaultValue.VB_HelpID = 410
    SetDefaultValue = SetRegValueStr("", Value)
End Function
'задать числовое значение
'Parameters:
'[IN]   strName , тип параметра: String- название,
'[IN]   Value , тип параметра: Long  - значение
'Returns:
' Boolean, семантика результата:
'   true  - задано
'   false -
'See Also:
'  DeleteKey
'  DeleteValue
'  GetDefaultValue
'  GetLastErrorCode
'  GetValue
'  GetValueLng
'  IsValid
'  OpenKey
'  Rights
'  SetDefaultValue
'  SetValue
'  TestKey
'Example:
' dim variable as Boolean
' variable = me.SetValueLng(...параметры...)
Public Function SetValueLng(ByVal strName As String, ByVal Value As Long) As Boolean
Attribute SetValueLng.VB_HelpID = 420
    SetValueLng = SetRegValueLng(strName, Value)
End Function
'---------------------------------------------------------------------------------------------
'Метод:         GetRegValueStr()
'Назначение:    Запрос строкового параметра из Registry
'               Читает максимум cMaxPath (260) символов
'Параметры:     strKey    - название параметра
'               strValue  - строка для возврата значения параметра
'Возвращает:    True      - успешное выполнение
'               False     - отсутствие такого параметра
'---------------------------------------------------------------------------------------------
Private Function GetRegValueStr(strKey As String, ByRef strValue As String) As Boolean
    ''Debug.Assert (m_hRegistryKey <> 0)
    strValue = vbNullString
    Dim l As Long, lType As Long, strResult As String
    l = cMaxDataLen + 1
    strResult = String$(cMaxDataLen, 0)
    m_lLastError = RegQueryValueExStr(hKey:=m_hRegistryKey, lpValueName:=strKey, _
                                lpReserved:=0, lpType:=lType, _
                                lpData:=strResult, lpcbData:=l)
'yuiop:
    If m_lLastError = ERROR_SUCCESS And (lType = REG_SZ Or lType = 2) Then
        strValue = Left(strResult, l - 1)  'обрезание лишних символов
        GetRegValueStr = True
    End If
    'GoTo yuiop
End Function

'---------------------------------------------------------------------------------------------
'Метод:         GetRegValueLng()
'Назначение:    Запрос строкового параметра из Registry
'               Читает максимум cMaxPath (260) символов
'Параметры:     strKey      - название параметра
'               lValue      - строка для возврата значения параметра
'Возвращает:    True        - успешное выполнение
'               False       - отсутствие такого параметра
'---------------------------------------------------------------------------------------------
Private Function GetRegValueLng(strKey As String, ByRef lValue As Long) As Boolean
    
    m_lLastError = RegQueryValueEx(m_hRegistryKey, strKey, 0, REG_DWORD, _
        lValue, 4)
    If m_lLastError = ERROR_SUCCESS Then
        GetRegValueLng = True
    End If
    
End Function
'---------------------------------------------------------------------------------------------
'Метод:         SetRegValueStr()
'Назначение:    Сохранение строкового параметра в Registry
'Параметры:     strValue    - название параметра
'               strData     - значение параметра
'Возвращает:    Успешность операции
'---------------------------------------------------------------------------------------------
Private Function SetRegValueStr(strValue As String, strData As String) As Boolean
    ''Debug.Assert (m_hRegistryKey <> 0)
    Dim sData As String
    sData = IIf(Len(strData) > 0, strData, "")
    m_lLastError = RegSetValueExStr(hKey:=m_hRegistryKey, lpValueName:=strValue, _
                        Reserved:=0, dwType:=REG_SZ, _
                        lpData:=sData, cbData:=Len(sData) + 1)
    'Debug.Assert (m_lLastError = ERROR_SUCCESS)
    If m_lLastError = ERROR_SUCCESS Then SetRegValueStr = True
End Function
'---------------------------------------------------------------------------------------------
'Метод:         SetRegValueLng()
'Назначение:    Сохранение Long параметра в Registry
'Параметры:     lpValueName    - название параметра
'               lValue    - значение параметра
'Возвращает:    Успешность операции
'---------------------------------------------------------------------------------------------
Private Function SetRegValueLng(ByVal lpValueName As String, lValue As Long) As Boolean
    
    m_lLastError = RegSetValueEx(m_hRegistryKey, lpValueName, 0, REG_DWORD, _
         lValue, Len(lValue))
    If m_lLastError = ERROR_SUCCESS Then SetRegValueLng = True
End Function

'проверка существования ключа...
'Parameters:
'[IN]   strSubKey , тип параметра: String - ключ,
'[IN]   hKeyIn , тип параметра: RegestryRoots = HKEY_CLASSES_ROOT  - хранилище
'Returns:
' Boolean, семантика результата:
'   true  - есть
'   false -
'See Also:
'  DeleteKey
'  DeleteValue
'  GetDefaultValue
'  GetLastErrorCode
'  GetValue
'  GetValueLng
'  IsValid
'  OpenKey
'  Rights
'  SetDefaultValue
'  SetValue
'  SetValueLng
'Example:
' dim variable as Boolean
' variable = me.TestKey(...параметры...)
Public Function TestKey(ByVal strSubKey As String, Optional ByVal hKeyIn As RegestryRoots = HKEY_CLASSES_ROOT) As Boolean
Attribute TestKey.VB_HelpID = 425
    'проверка раздела Registry
    Dim m_Res As Long
    TestKey = False
    Dim dwDisposition As Long
    Dim AccRights
    Select Case Rights
        Case TRights.ReadWrite:
            AccRights = ctAccessRight
        Case TRights.ReadOnly:
            AccRights = ctAccessRightTest
    End Select
    
    m_lLastError = RegOpenKeyEx(hKey:=hKeyIn, lpSubKey:=strSubKey, ulOptions:=REG_OPTION_NON_VOLATILE, samDesired:=AccRights, phkResult:=m_hRegistryKey)
    If m_Res = ERROR_SUCCESS Then TestKey = True
    ''Debug.Assert (m_lLastError = ERROR_SUCCESS)
End Function



