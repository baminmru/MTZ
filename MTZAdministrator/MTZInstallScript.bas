Attribute VB_Name = "MTZInstallScript"
Option Explicit

Public Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Public Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long

Private sExtraEnd As String

Public Function PrepareInstall(objBuild As MTZ_Inst_Build, strOutFile As String) As Boolean
Dim strInstallCode As String
Dim objSection As MTZ_Inst_Build_Sec
Dim i As Long
Dim strUninstall As String
    strInstallCode = InstHeader(objBuild)
    objBuild.MTZ_Inst_Build_Sec.Sort = "SEQ"
    For i = 1 To objBuild.MTZ_Inst_Build_Sec.Count
        Set objSection = objBuild.MTZ_Inst_Build_Sec.item(i)
        strInstallCode = strInstallCode + vbCrLf + ProcessBuildSection_Install_UnInstall(objSection, i, strUninstall)
    Next
    'body info, the section description
    strInstallCode = strInstallCode + vbCrLf + "; Section descriptions"
    strInstallCode = strInstallCode + vbCrLf + "!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN"
    For i = 1 To objBuild.MTZ_Inst_Build_Sec.Count
        Set objSection = objBuild.MTZ_Inst_Build_Sec.item(i)
        If objSection.IsRewriteSectionDesc = YesNo_Da Then
            strInstallCode = strInstallCode + vbCrLf + "  !insertmacro MUI_DESCRIPTION_TEXT ${SEC0" + CStr(i) + "} """ + objSection.TheDescription + """"
        Else
            strInstallCode = strInstallCode + vbCrLf + "  !insertmacro MUI_DESCRIPTION_TEXT ${SEC0" + CStr(i) + "} """ + objSection.TheSection.TheDescription + """"
        End If
    Next
    strInstallCode = strInstallCode + vbCrLf + "!insertmacro MUI_FUNCTION_DESCRIPTION_END"
    strInstallCode = strInstallCode + vbCrLf
    
    strInstallCode = strInstallCode + vbCrLf + "Section -Post"
    strInstallCode = strInstallCode + vbCrLf + "  WriteUninstaller ""$INSTDIR\uninst.exe"""
    strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr HKLM ""${PRODUCT_DIR_REGKEY}"" """" ""$INSTDIR\" + GetLastFromDelimiters(objBuild.MainFileRef.TheSource) + """"
    strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} ""${PRODUCT_UNINST_KEY}"" ""DisplayName"" ""$(^Name)"""
    strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} ""${PRODUCT_UNINST_KEY}"" ""UninstallString"" ""$INSTDIR\uninst.exe"""
    strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} ""${PRODUCT_UNINST_KEY}"" ""DisplayIcon"" ""$INSTDIR\" + GetLastFromDelimiters(objBuild.MainFileRef.TheSource) + """"
    strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} ""${PRODUCT_UNINST_KEY}"" ""DisplayVersion"" ""${PRODUCT_VERSION}"""
    strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} ""${PRODUCT_UNINST_KEY}"" ""URLInfoAbout"" ""${PRODUCT_WEB_SITE}"""
    strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} ""${PRODUCT_UNINST_KEY}"" ""Publisher"" ""${PRODUCT_PUBLISHER}"""
    'strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr HKLM ""Software\MTZ\CONFIG"" ""XMLPATH"" ""$INSTDIR\MOKASIN.XML"""
    'strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr HKCU ""HKEY_CURRENT_USER\Software\VB and VBA Program Settings\MTZ\CONFIG"" ""IMAGEPATH"" ""$INSTDIR\IMAGES\"""
    'strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr HKCU ""HKEY_CURRENT_USER\Software\VB and VBA Program Settings\MTZ\CONFIG"" ""LAYOUTS"" ""$INSTDIR\LAYOUTS\"""
    'strInstallCode = strInstallCode + vbCrLf + "  WriteRegStr HKCU ""HKEY_CURRENT_USER\Software\VB and VBA Program Settings\MTZ\CONFIG"" ""TEMPPATH"" ""$INSTDIR\TEMP\"""
    strInstallCode = strInstallCode + vbCrLf + ""
    strInstallCode = strInstallCode + vbCrLf + "SectionEnd"
    strInstallCode = strInstallCode + vbCrLf
    
    
    strInstallCode = strInstallCode + vbCrLf + "Section -AdditionalIcons"
    strInstallCode = strInstallCode + vbCrLf + "  SectionIn " + CStr(objBuild.MTZ_Inst_Build_Sec.Count + 1)
    strInstallCode = strInstallCode + vbCrLf + "  SetShellVarContext All ; ( другое значение - current)"
    strInstallCode = strInstallCode + vbCrLf + "  CreateDirectory ""$SMPROGRAMS\" + objBuild.ShortCutDir + """"
    strInstallCode = strInstallCode + vbCrLf + "  CreateShortCut ""$SMPROGRAMS\" + objBuild.ShortCutDir + "\Uninstall.lnk"" ""$INSTDIR\uninst.exe"""
    strInstallCode = strInstallCode + vbCrLf + "  WriteIniStr ""$INSTDIR\${PRODUCT_NAME}.url"" ""InternetShortcut"" ""URL"" ""${PRODUCT_WEB_SITE}"""
    strInstallCode = strInstallCode + vbCrLf + "  CreateShortCut ""$SMPROGRAMS\" + objBuild.ShortCutDir + "\Website.lnk"" ""$INSTDIR\${PRODUCT_NAME}.url"""
    'strInstallCode = strInstallCode + vbCrLf + "  ;CreateShortCut ""$SMPROGRAMS\" + objBuild.ShortCutDir + "\Website.lnk"" ""$INSTDIR\${PRODUCT_NAME}.url"""
    strInstallCode = strInstallCode + vbCrLf + "SectionEnd"
    strInstallCode = strInstallCode + vbCrLf + ""
    
    'Support functions
    strInstallCode = strInstallCode + vbCrLf + "Function un.onUninstSuccess"
    strInstallCode = strInstallCode + vbCrLf + "  HideWindow"
    strInstallCode = strInstallCode + vbCrLf + "  MessageBox MB_ICONINFORMATION|MB_OK ""Удаление программы $(^Name) было успешно завершено."""
    strInstallCode = strInstallCode + vbCrLf + "FunctionEnd"
    strInstallCode = strInstallCode + vbCrLf + ""
    strInstallCode = strInstallCode + vbCrLf + "Function un.onInit"
    strInstallCode = strInstallCode + vbCrLf + "!insertmacro MUI_UNGETLANGUAGE"
    strInstallCode = strInstallCode + vbCrLf + "  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 ""Вы уверены в том, что желаете удалить $(^Name) и все компоненты программы?"" IDYES +2 "
    strInstallCode = strInstallCode + vbCrLf + "  abort"
    strInstallCode = strInstallCode + vbCrLf + "FunctionEnd"
    'preuninstall
    strInstallCode = strInstallCode + vbCrLf
    strInstallCode = strInstallCode + vbCrLf + "Section Uninstall"
    strInstallCode = strInstallCode + vbCrLf + "  SetShellVarContext All"
    'uninstall sections, common for all sections
'    For i = 1 To objBuild.MTZ_Inst_Build_Sec.Count
'        Set objSection = objBuild.MTZ_Inst_Build_Sec.item(i)
'        strInstallCode = ProcessBuildSection_UnInstall(objSection)
'    Next
    strUninstall = strUninstall + vbCrLf + "  Delete ""$SMPROGRAMS\" + objBuild.ShortCutDir + "\Uninstall.lnk"""
    strUninstall = strUninstall + vbCrLf + "  Delete ""$SMPROGRAMS\" + objBuild.ShortCutDir + "\Website.lnk"""
    strInstallCode = strInstallCode + vbCrLf + strUninstall
    'end uninstall
    strInstallCode = strInstallCode + vbCrLf + "  ;common uninst"

    strInstallCode = strInstallCode + vbCrLf + "  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} ""${PRODUCT_UNINST_KEY}"""
    strInstallCode = strInstallCode + vbCrLf + "  DeleteRegKey HKLM ""${PRODUCT_DIR_REGKEY}"""
    strInstallCode = strInstallCode + vbCrLf + "  DeleteRegKey HKLM ""Software\MTZ\CONFIG"""
    strInstallCode = strInstallCode + vbCrLf + "  DeleteRegKey HKCU ""HKEY_CURRENT_USER\Software\VB and VBA Program Settings\MTZ\CONFIG"""
    strInstallCode = strInstallCode + vbCrLf + "  RMDir /r ""$INSTDIR"""
    strInstallCode = strInstallCode + vbCrLf + "  RMDir /r ""$SMPROGRAMS\" + objBuild.ShortCutDir + """"
    strInstallCode = strInstallCode + vbCrLf + "  SetAutoClose True"
    strInstallCode = strInstallCode + vbCrLf + "SectionEnd"
    
    strInstallCode = strInstallCode + vbCrLf + sExtraEnd
    
    Dim ff
    ff = FreeFile
    Open strOutFile For Output As #ff
    Print #ff, strInstallCode
    Close #ff
    
End Function

Public Function ReplaceEnviron(ByVal strIn As String) As String
Dim lVar As Long
Dim lEnd As Long
Dim sVal As String
Dim sNewVal As String
    While InStr(1, strIn, "%") > 0
        lVar = InStr(1, strIn, "%")
        lEnd = InStr(lVar + 1, strIn, "%")
        sVal = Mid(strIn, lVar, lEnd - lVar + 1)
        sNewVal = Environ$(Replace(sVal, "%", ""))
        strIn = Replace(strIn, sVal, sNewVal)
    Wend
    ReplaceEnviron = strIn
End Function

Private Function ProcessBuildSection_Install_UnInstall(objBuildSection As MTZ_Inst_Build_Sec, Index As Long, ByRef strUninstall As String) As String
Dim i As Long
Dim j As Long
Dim objSection As MTZ_Inst_Section
Dim strSectionText As String
Dim objFile As MTZ_Inst_Sec_Files
Dim objMetaModel As MTZMetaModel.Application
Dim objObject As MTZMetaModel.objectType
Dim bFound As Boolean
Dim strWasFileSource As String
    bFound = False
    
    Set objSection = objBuildSection.TheSection
    
    'Пытаемся найти секцию в предустановках...
'    If Left(objSection.TheName, 1) = "-" Then
'        objSection.Application.MTZ_Inst_Common.Filter = "TheName='" + objSection.TheName + "INSTALL" + "'"
'        If objSection.Application.MTZ_Inst_Common.Count > 0 Then
'            ProcessBuildSection_Install_UnInstall = objSection.Application.MTZ_Inst_Common.item(1).TheInstallScript
'            bFound = True
'        End If
'        objSection.Application.MTZ_Inst_Common.Filter = "TheName='" + objSection.TheName + "UNINSTALL" + "'"
'        If objSection.Application.MTZ_Inst_Common.Count > 0 Then
'            sExtraEnd = sExtraEnd + vbCrLf + objSection.Application.MTZ_Inst_Common.item(1).TheInstallScript
'            bFound = True
'        End If
'        If bFound Then Exit Function
'    End If

    If objSection.IsCustomSection = YesNo_Da Then
        If Not objSection.CustomSectionInstall Is Nothing Then
            ProcessBuildSection_Install_UnInstall = objSection.CustomSectionInstall.TheInstallScript
        End If
        
        If Not objSection.CustomSectionUnInstall Is Nothing Then
            sExtraEnd = sExtraEnd + vbCrLf + objSection.CustomSectionUnInstall.TheInstallScript
        End If
        Exit Function
    End If
    
    strSectionText = strSectionText + vbCrLf
    strSectionText = strSectionText + vbCrLf + "Section " + IIf(objSection.IsNotDeletable = YesNo_Da, "", " /o ") + " """ + IIf(objSection.IsVisible = YesNo_Net, "-", "") + objSection.TheName + """ SEC0" + CStr(Index) + ""
    strSectionText = strSectionText + vbCrLf + "SectionIn " + CStr(Index) + IIf(objSection.IsNotDeletable = YesNo_Da, " RO", "")
    strSectionText = strSectionText + vbCrLf + "  SetShellVarContext All ; ( другое значение - current)"
    strSectionText = strSectionText + vbCrLf + "  SetOverwrite on"
    
    objSection.MTZ_Inst_Sec_Files.Sort = "SEQ"
    
    For i = 1 To objSection.MTZ_Inst_Sec_Files.Count
    
        Set objFile = objSection.MTZ_Inst_Sec_Files.item(i)
        If InStr(objFile.TheSource, "%") > 0 Then
            strWasFileSource = objFile.TheSource
            objFile.TheSource = ReplaceEnviron(objFile.TheSource)
        End If
        
        If objFile.IsCustomScript = YesNo_Da Then
            If Not objFile.CustomScriptInstall Is Nothing Then
                strSectionText = strSectionText + vbCrLf + objFile.CustomScriptInstall.TheInstallScript
            End If
            
            If Not objFile.CustomScriptUnInstall Is Nothing Then
                strUninstall = strUninstall + vbCrLf + objFile.CustomScriptUnInstall.TheInstallScript
            End If
'            objSection.Application.MTZ_Inst_Common.Filter = "TheName='" + objFile.TheSource + "'"
'            If objSection.Application.MTZ_Inst_Common.Count > 0 Then
'                ProcessBuildSection_Install_UnInstall = objSection.Application.MTZ_Inst_Common.item(1).TheInstallScript
'                bFound = True
'            End If
        ElseIf Not objFile.TheApplication Is Nothing Then
            'Это целиком приложение, перебираем файлы
            Set objMetaModel = GetDictionary("MTZMetaModel")
            Manager.LockInstanceObject objMetaModel.ID
            objMetaModel.objectType.Filter = "Package='" + objFile.TheApplication.ID + "'"
            For j = 1 To objMetaModel.objectType.Count
                Set objObject = objMetaModel.objectType.item(j)
                strSectionText = strSectionText + GetInstallObjectString(objFile, objObject, strUninstall)
            Next
            objMetaModel.objectType.Filter = ""
        ElseIf Right(objFile.TheSource, 1) = "\" Or Right(Left(objFile.TheSource, InStr(1, objFile.TheSource, "*", vbTextCompare) - IIf(InStr(1, objFile.TheSource, "*", vbTextCompare) > 0, 1, 0)), 1) = "\" Then
            'Это цельный каталог файлов...
            Dim sFile As String
            Dim sMask As String
            Dim sPath As String
            If InStr(1, objFile.TheSource, "*", vbTextCompare) > 0 Then
                sMask = Right(objFile.TheSource, Len(objFile.TheSource) - InStr(1, objFile.TheSource, "*", vbTextCompare) + 1)
                sPath = Left(objFile.TheSource, InStr(1, objFile.TheSource, "*", vbTextCompare) - 1)
            Else
                sMask = "*.*"
                sPath = objFile.TheSource
            End If
            sFile = Dir(sPath + sMask)
            Do While sFile <> ""
                'вот теперь обрабатываем...
                If sFile <> "." And sFile <> ".." Then
                    If objFile.IsCOM Then
                        strSectionText = strSectionText + vbCrLf + "  SetOutPath ""$INSTDIR\" + objFile.SubDir + """"
                        strSectionText = strSectionText + vbCrLf + "  !insertmacro InstallLib REGDLL NOTSHARED NOREBOOT_PROTECTED """ + sPath + sFile + """ ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(sFile) + """ ""$TEMP"""
                        strUninstall = strUninstall + vbCrLf + "  !insertmacro UnInstallLib REGDLL NOTSHARED NOREBOOT_PROTECTED ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + sFile + """"
                    Else
                        strSectionText = strSectionText + vbCrLf + "  SetOutPath ""$INSTDIR\" + objFile.SubDir + """"
                        strSectionText = strSectionText + vbCrLf + "  File """ + sPath + sFile + """"
                        strUninstall = strUninstall + vbCrLf + "  Delete ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + sFile + """"
                    End If
                    If objFile.HaveToRun = YesNo_Da Then
                        strSectionText = strSectionText + vbCrLf + "  ExecWait '""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + sFile + " " + objFile.CommanLineParams + "'"
                    End If
                End If
                sFile = Dir   ' Get next file...
            Loop
        'ElseIf  Then
        '    'Это каталог по маске
            
        ElseIf objFile.TheSource <> "" Then
            'Это просто файл
            If objFile.IsCOM Then
                If objFile.DefaultInterface = "" Then
                    strSectionText = strSectionText + vbCrLf + "  SetOutPath ""$INSTDIR\" + objFile.SubDir + """"
                    strSectionText = strSectionText + vbCrLf + "  !insertmacro InstallLib REGDLL NOTSHARED NOREBOOT_PROTECTED """ + objFile.TheSource + """ ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(objFile.TheSource) + """ ""$TEMP"""
                    strUninstall = strUninstall + vbCrLf + "  !insertmacro UnInstallLib REGDLL NOTSHARED NOREBOOT_PROTECTED ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(objFile.TheSource) + """"
                Else
                    Dim sFilePathIt As String
                    sFilePathIt = GetCOMObjectPath(GetLastFromDelimiters(objFile.TheSource), objFile.DefaultInterface)
                    strSectionText = strSectionText + vbCrLf + "  SetOutPath ""$INSTDIR\" + objFile.SubDir + """"
                    strSectionText = strSectionText + vbCrLf + "  !insertmacro InstallLib REGDLL NOTSHARED NOREBOOT_PROTECTED """ + sFilePathIt + """ ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(objFile.TheSource) + """ ""$TEMP"""
                    strUninstall = strUninstall + vbCrLf + "  !insertmacro UnInstallLib REGDLL NOTSHARED NOREBOOT_PROTECTED ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(objFile.TheSource) + """"
                End If
            Else
                strSectionText = strSectionText + vbCrLf + "  SetOutPath ""$INSTDIR\" + objFile.SubDir + """"
                strSectionText = strSectionText + vbCrLf + "  File """ + objFile.TheSource + """"
                strUninstall = strUninstall + vbCrLf + "  Delete ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(objFile.TheSource) + """"
            End If
            
            If objFile.HaveToRun = YesNo_Da Then
                strSectionText = strSectionText + vbCrLf + "  ExecWait '""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(objFile.TheSource) + """ " + objFile.CommanLineParams + "'"
            End If
            
            If objFile.HaveToRunDeinst = YesNo_Da Then
                strUninstall = strUninstall + vbCrLf + "  ExecWait '""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(objFile.TheSource) + """ " + objFile.DeinstallComandParam + "'"
            End If
            
            If objFile.IsShortcut = YesNo_Da Then
                'strSectionText = strSectionText + vbCrLf + "  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application"
                'strSectionText = strSectionText + vbCrLf + "  CreateDirectory ""$SMPROGRAMS\$ICONS_GROUP"""
                'strSectionText = strSectionText + vbCrLf + "  CreateShortCut ""$SMPROGRAMS\$ICONS_GROUP\" + objFile.ShortcutName + ".lnk"" ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(objFile.TheSource) + """"
                'strSectionText = strSectionText + vbCrLf + "  !insertmacro MUI_STARTMENU_WRITE_END"
                
                strSectionText = strSectionText + vbCrLf + "  CreateDirectory ""$SMPROGRAMS\" + objBuildSection.Parent.Parent.ShortCutDir + GetShortcutDir(objFile.ShortcutName) + """"
                
                strSectionText = strSectionText + vbCrLf + "  CreateShortCut ""$SMPROGRAMS\" + objBuildSection.Parent.Parent.ShortCutDir + "\" + objFile.ShortcutName + ".lnk"" ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(objFile.TheSource) + """"
                
                Debug.Print "  CreateShortCut ""$SMPROGRAMS\" + objBuildSection.Parent.Parent.ShortCutDir + "\" + objFile.ShortcutName + ".lnk"" ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + GetLastFromDelimiters(objFile.TheSource) + """"
                strUninstall = strUninstall + vbCrLf + "  Delete ""$SMPROGRAMS\" + objBuildSection.Parent.Parent.ShortCutDir + "\" + objFile.ShortcutName + ".lnk"""
            End If
            
        ElseIf Not objFile.SysstemObject Is Nothing Then
            ' Это просто один из объектов системы
            strSectionText = strSectionText + GetInstallObjectString(objFile, objFile.SysstemObject, strUninstall)
        ElseIf objFile.SubDir <> "" Then
            ' А это просто каталог
            strSectionText = strSectionText + vbCrLf + "CreateDirectory ""$INSTDIR\" + objFile.SubDir + """"
        End If
        objFile.TheSource = strWasFileSource
    Next
    
    strSectionText = strSectionText + vbCrLf + "SectionEnd"
    
    ProcessBuildSection_Install_UnInstall = strSectionText
End Function


Private Function GetCOMObjectPath(sDLLName As String, sInterface As String) As String
On Error GoTo Error_Detected
Dim tmpObj As Object
Dim sFileName As String
Dim sResultString As String
sFileName = Space(1024)

    GetCOMObjectPath = ""
    Set tmpObj = CreateObject(sInterface)
    Call GetModuleFileName(GetModuleHandle(sDLLName), sFileName, 1000)
    sFileName = Trim(sFileName)
    If Len(sFileName) > 5 Then
        sFileName = Left(sFileName, Len(sFileName) - 1) 'избавляемся от /0
        GetCOMObjectPath = sFileName
    End If
    
    If InStr(1, GetCOMObjectPath, "VB6.EXE", vbTextCompare) Then
        Debug.Assert False
        Debug.Assert True
    End If
    
Error_Detected:
    
End Function

Private Function GetInstallObjectString(objFile As MTZ_Inst_Sec_Files, objObject As MTZMetaModel.objectType, ByRef strUninstall As String) As String
Dim tmpObj As Object
Dim sFileName As String
Dim sResultString As String
Dim lModuleHandle As Long
sFileName = Space(1024)
        
    On Error Resume Next
    lModuleHandle = 0
    sResultString = sResultString + vbCrLf + "  SetOutPath ""$INSTDIR\" + objFile.SubDir + """"
    Set tmpObj = CreateObject(objObject.Name + ".Application")
    Call GetModuleFileName(GetModuleHandle(objObject.Name + ".dll"), sFileName, 1000)
    sFileName = Trim(sFileName)
    If Len(sFileName) > 5 Then
        sFileName = Left(sFileName, Len(sFileName) - 1) 'избавляемся от /0
        sResultString = sResultString + vbCrLf + "  !insertmacro InstallLib REGDLL NOTSHARED NOREBOOT_PROTECTED """ + sFileName + """ ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + objObject.Name + ".dll"" ""$TEMP"""
        
        strUninstall = strUninstall + vbCrLf + "  !insertmacro UnInstallLib REGDLL NOTSHARED NOREBOOT_PROTECTED ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + objObject.Name + ".dll"""
    End If
    Set tmpObj = Nothing
    
    sFileName = Space(1024)
    lModuleHandle = 0
    lModuleHandle = GetModuleHandle(objObject.Name + "GUI.ocx")
    
    If lModuleHandle = 0 Then
        Dim objA As Object
        Set objA = CreateObject(objObject.Name + "GUI.GUI")
        lModuleHandle = GetModuleHandle(objObject.Name + "GUI.ocx")
        Set objA = Nothing
    End If
    
    Call GetModuleFileName(lModuleHandle, sFileName, 1000)
    sFileName = Trim(sFileName)
    If Len(sFileName) > 5 Then
        sFileName = Left(sFileName, Len(sFileName) - 1) 'избавляемся от /0
        sResultString = sResultString + vbCrLf + "  !insertmacro InstallLib REGDLL NOTSHARED NOREBOOT_PROTECTED """ + sFileName + """ ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + objObject.Name + "GUI.ocx"" ""$TEMP"""
        strUninstall = strUninstall + vbCrLf + "  !insertmacro UnInstallLib REGDLL NOTSHARED NOREBOOT_PROTECTED ""$INSTDIR" + IIf(objFile.SubDir = "", "", "\" + objFile.SubDir) + "\" + objObject.Name + "GUI.ocx"""
    End If
    GetInstallObjectString = sResultString
    
    If InStr(1, sResultString, "VB6.EXE", vbTextCompare) Then
        Debug.Assert False
        Debug.Assert True
    End If
    
End Function

Private Function GetLastFromDelimiters(strIn As String) As String
On Error GoTo Error_Detected:
Dim c() As String
    c = Split(strIn, "\")
    GetLastFromDelimiters = c(UBound(c))
    Exit Function
Error_Detected:
    GetLastFromDelimiters = strIn
End Function

Private Function GetShortcutDir(strIn As String) As String
On Error GoTo Error_Detected:
Dim c() As String
Dim sTemp As String
    c = Split(strIn, "\")
    sTemp = c(0)
    If sTemp <> strIn Then
        GetShortcutDir = "\" + sTemp
    Else
        GetShortcutDir = ""
    End If
    Exit Function
Error_Detected:
    GetShortcutDir = ""
End Function

Private Function GetInstDir(sInst As String) As String
    If Len(sInst) > 2 Then
        If Right(Left(sInst, 2), 1) = ":" Then
            GetInstDir = sInst
        Else
            GetInstDir = """$PROGRAMFILES\" + sInst + """"
        End If
    Else
        GetInstDir = """$PROGRAMFILES\" + sInst + """"
    End If
End Function

Private Function InstHeader(objBuild As MTZ_Inst_Build) As String
Dim strText As String
    strText = "!include Library.nsh" + vbCrLf
    strText = strText + vbCrLf + "; Подготовлен Муромец"
    strText = strText + vbCrLf + "!define PRODUCT_NAME """ + objBuild.PRODUCT_NAME + """"
    strText = strText + vbCrLf + "!define PRODUCT_VERSION """ + objBuild.PRODUCT_VERSION + """"
    strText = strText + vbCrLf + "!define PRODUCT_PUBLISHER """ + objBuild.PRODUCT_PUBLISHER + """"
    strText = strText + vbCrLf + "!define PRODUCT_WEB_SITE """ + objBuild.PRODUCT_WEB_SITE + """"
    strText = strText + vbCrLf + "!define PRODUCT_DIR_REGKEY ""Software\Microsoft\Windows\CurrentVersion\App Paths\" + GetLastFromDelimiters(objBuild.MainFileRef.TheSource) + """"
    strText = strText + vbCrLf + "!define PRODUCT_UNINST_KEY ""Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"""
    strText = strText + vbCrLf + "!define PRODUCT_UNINST_ROOT_KEY ""HKLM"""
    strText = strText + vbCrLf + ""
    strText = strText + vbCrLf + "; MUI 1.67 compatible ------"
    strText = strText + vbCrLf + "!include ""MUI.nsh"""
    strText = strText + vbCrLf + ""
    strText = strText + vbCrLf + "; MUI Settings"
    strText = strText + vbCrLf + "!define MUI_ABORTWARNING"
    strText = strText + vbCrLf + "!define MUI_ICON ""${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"""
    strText = strText + vbCrLf + "!define MUI_UNICON ""${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"""
    strText = strText + vbCrLf + ""
    strText = strText + vbCrLf + "; Language Selection Dialog Settings"
    strText = strText + vbCrLf + "!define MUI_LANGDLL_REGISTRY_ROOT ""${PRODUCT_UNINST_ROOT_KEY}"""
    strText = strText + vbCrLf + "!define MUI_LANGDLL_REGISTRY_KEY ""${PRODUCT_UNINST_KEY}"""
    strText = strText + vbCrLf + "!define MUI_LANGDLL_REGISTRY_VALUENAME ""NSIS:Language"""
    strText = strText + vbCrLf + ""
    strText = strText + vbCrLf + "; Welcome page"
    strText = strText + vbCrLf + "!insertmacro MUI_PAGE_WELCOME"
    If objBuild.LicensFilePath <> "" Then
        strText = strText + vbCrLf + "; License page"
        strText = strText + vbCrLf + "!insertmacro MUI_PAGE_LICENSE """ + ReplaceEnviron(objBuild.LicensFilePath) + """"
    End If
    strText = strText + vbCrLf + "; Components page"
    strText = strText + vbCrLf + "!insertmacro MUI_PAGE_COMPONENTS"
    strText = strText + vbCrLf + "; Directory page"
    strText = strText + vbCrLf + "!insertmacro MUI_PAGE_DIRECTORY"
    strText = strText + vbCrLf + "; Instfiles page"
    strText = strText + vbCrLf + "!insertmacro MUI_PAGE_INSTFILES"
    strText = strText + vbCrLf + "; Finish page"
    strText = strText + vbCrLf + "!define MUI_FINISHPAGE_RUN ""$INSTDIR\" + GetLastFromDelimiters(objBuild.MainFileRef.TheSource) + """"
    strText = strText + vbCrLf + "!insertmacro MUI_PAGE_FINISH"
    strText = strText + vbCrLf + ""
    strText = strText + vbCrLf + "; Uninstaller pages"
    strText = strText + vbCrLf + "!insertmacro MUI_UNPAGE_INSTFILES"
    strText = strText + vbCrLf + ""
    strText = strText + vbCrLf + "; Language files"
    strText = strText + vbCrLf + "!insertmacro MUI_LANGUAGE ""English"""
    strText = strText + vbCrLf + "!insertmacro MUI_LANGUAGE ""Russian"""
    strText = strText + vbCrLf + ""
    strText = strText + vbCrLf + "; MUI end ------"
    strText = strText + vbCrLf + ""
    strText = strText + vbCrLf + "Name ""${PRODUCT_NAME} ${PRODUCT_VERSION}"""
    strText = strText + vbCrLf + "OutFile ""Setup.exe"""

    strText = strText + vbCrLf + "InstallDir " + GetInstDir(objBuild.InstallDir)

    
    strText = strText + vbCrLf + "InstallDirRegKey HKLM ""${PRODUCT_DIR_REGKEY}"" """""
    strText = strText + vbCrLf + "ShowInstDetails Show"
    strText = strText + vbCrLf + "ShowUnInstDetails Show"
    strText = strText + vbCrLf + "var ICONS_GROUP"
    'strText = strText + vbCrLf + "$"
    strText = strText + vbCrLf + "Function .onInit"
    strText = strText + vbCrLf + "  !insertmacro MUI_LANGDLL_DISPLAY"
    strText = strText + vbCrLf + "FunctionEnd"
    strText = strText + vbCrLf + ""
    
    
    


    InstHeader = strText
End Function

'' ****************************************************************************************
'Public Function GetDictionary(objectType As String) As Object
'On Error GoTo Error_Detected
'
'    Dim objRecordset As ADODB.Recordset
'
'
'    Set objRecordset = Manager.ListInstances("", objectType)
'
'    If Not (objRecordset.BOF And objRecordset.EOF) Then
'        Set GetDictionary = Manager.GetInstanceObject(CStr(objRecordset("InstanceID")))
'        objRecordset.Close
'        Set objRecordset = Nothing
'    Else
'        Dim newGUID As String
'        newGUID = CreateGUID2
'
'        If Not Manager.NewInstance(newGUID, objectType, GetDefaultObjectName(objectType)) Then
'            Exit Function
'        End If
'
'        Set GetDictionary = Manager.GetInstanceObject(newGUID)
'    End If
'
'    Exit Function
'Error_Detected:
'    Set GetDictionary = Nothing
'End Function
'
'
'Public Function GetDefaultObjectName(ByVal objectType As String) As String
'Dim objRecordset As ADODB.Recordset
'On Error GoTo Error_Detected
'    Set objRecordset = Manager.GetSession.GetData("select the_Comment from objecttype where Name='" + objectType + "'")
'    If Not (objRecordset.BOF And objRecordset.EOF) Then
'       GetDefaultObjectName = objRecordset!the_comment
'    Else
'       GetDefaultObjectName = " "
'    End If
'    Exit Function
'Error_Detected:
'    GetDefaultObjectName = " "
'End Function


