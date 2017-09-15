VERSION 5.00
Begin VB.Form frmSettings 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Настройка "
   ClientHeight    =   4305
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6300
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4305
   ScaleWidth      =   6300
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkbNonModalChild 
      Caption         =   "Использовать немодальное открытие дочерних форм"
      Height          =   375
      Left            =   3000
      TabIndex        =   19
      Top             =   1560
      Width           =   2655
   End
   Begin VB.Frame Frame2 
      Caption         =   "Панель"
      Height          =   1395
      Left            =   2880
      TabIndex        =   15
      Top             =   60
      Width           =   2175
      Begin VB.CheckBox chkbAllowCfg 
         Caption         =   "Кнопка ""Настроить"""
         Height          =   375
         Left            =   120
         TabIndex        =   18
         Top             =   900
         Width           =   1935
      End
      Begin VB.CheckBox chkbAllowRefresh 
         Caption         =   "Кнопка ""Обновить"""
         Height          =   375
         Left            =   120
         TabIndex        =   17
         Top             =   600
         Width           =   1935
      End
      Begin VB.CheckBox chkbAllowSave 
         Caption         =   "Кнопка ""Сохранить"""
         Height          =   375
         Left            =   120
         TabIndex        =   16
         Top             =   300
         Width           =   1935
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Frame1"
      Height          =   3855
      Left            =   2820
      TabIndex        =   14
      Top             =   60
      Width           =   15
   End
   Begin VB.CheckBox chkbIncludeHiddenCfg 
      Caption         =   "Включать скрытую настройку грида (Shift+Ctrl+Alt+F4)"
      Height          =   375
      Left            =   120
      TabIndex        =   13
      Top             =   3480
      Width           =   2655
   End
   Begin VB.CheckBox chkbAcc 
      Caption         =   "Стиль защиты"
      Height          =   255
      Left            =   480
      TabIndex        =   12
      Top             =   3120
      Width           =   2055
   End
   Begin VB.CheckBox chkbFind 
      Caption         =   "Поиск"
      Height          =   255
      Left            =   480
      TabIndex        =   11
      Top             =   2880
      Width           =   2055
   End
   Begin VB.CheckBox chkbCfg 
      Caption         =   "Настроить"
      Height          =   255
      Left            =   480
      TabIndex        =   10
      Top             =   2640
      Width           =   2055
   End
   Begin VB.CheckBox chkbPrn 
      Caption         =   "Печать"
      Height          =   255
      Left            =   480
      TabIndex        =   9
      Top             =   2400
      Width           =   2055
   End
   Begin VB.CheckBox chkbRef 
      Caption         =   "Обновить"
      Height          =   255
      Left            =   480
      TabIndex        =   8
      Top             =   1920
      Width           =   2055
   End
   Begin VB.CheckBox chkbOpen 
      Caption         =   "Открыть"
      Height          =   255
      Left            =   480
      TabIndex        =   7
      Top             =   1680
      Width           =   2055
   End
   Begin VB.CheckBox chkbEdit 
      Caption         =   "Свойства"
      Height          =   255
      Left            =   480
      TabIndex        =   6
      Top             =   1200
      Width           =   2055
   End
   Begin VB.CheckBox chkbBuffer 
      Caption         =   "Буфер обмена"
      Height          =   255
      Left            =   480
      TabIndex        =   5
      Top             =   2160
      Width           =   2055
   End
   Begin VB.CheckBox chkbDelete 
      Caption         =   "Удаление"
      Height          =   255
      Left            =   480
      TabIndex        =   4
      Top             =   1440
      Width           =   2055
   End
   Begin VB.CheckBox chkbAdd 
      Caption         =   "Добавление"
      Height          =   255
      Left            =   480
      TabIndex        =   3
      Top             =   960
      Width           =   2055
   End
   Begin VB.CheckBox chkbAllowTrashGridMenu 
      Caption         =   "Включать полное меню в гриде"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   2715
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   4980
      TabIndex        =   1
      Top             =   3960
      Width           =   1185
   End
   Begin VB.CheckBox chkbAllowTrashIcons 
      Caption         =   "Включать служебные кнопки"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2655
   End
End
Attribute VB_Name = "frmSettings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub chkbAllowTrashGridMenu_Click()
    If chkbAllowTrashGridMenu.value = vbUnchecked Then
        chkbAcc.Enabled = False
        chkbAdd.Enabled = False
        chkbBuffer.Enabled = False
        chkbCfg.Enabled = False
        chkbDelete.Enabled = False
        chkbEdit.Enabled = False
        chkbFind.Enabled = False
        chkbOpen.Enabled = False
        chkbPrn.Enabled = False
        chkbRef.Enabled = False
    Else
        chkbAcc.Enabled = True
        chkbAdd.Enabled = True
        chkbBuffer.Enabled = True
        chkbCfg.Enabled = True
        chkbDelete.Enabled = True
        chkbEdit.Enabled = True
        chkbFind.Enabled = True
        chkbOpen.Enabled = True
        chkbPrn.Enabled = True
        chkbRef.Enabled = True
    End If
End Sub

Private Sub cmdOK_Click()
    If chkbAllowTrashIcons.value = vbChecked Then
        Call Utility.MTZSaveSetting("GENERATOR", "VB_OCX_Buttons", "", "True")
    Else
        Call Utility.MTZSaveSetting("GENERATOR", "VB_OCX_Buttons", "", "False")
    End If
    
    If chkbAllowTrashGridMenu.value = vbChecked Then
        Call Utility.MTZSaveSetting("GENERATOR", "VB_OCX_GRID_MENU", "", "True")
    Else
        Call Utility.MTZSaveSetting("GENERATOR", "VB_OCX_GRID_MENU", "", "False")
    End If
    
    If chkbIncludeHiddenCfg.value = vbChecked Then
        Call Utility.MTZSaveSetting("GENERATOR", "VB_OCX_GRID_HIDDEN_CFG", "", "True")
    Else
        Call Utility.MTZSaveSetting("GENERATOR", "VB_OCX_GRID_HIDDEN_CFG", "", "False")
    End If
    
    AllowedGridMenus.IsAcc = SaveCFGBool(chkbAcc, "VB_OCX_GRID_MENU", "chkbAcc")
    AllowedGridMenus.IsAdd = SaveCFGBool(chkbAdd, "VB_OCX_GRID_MENU", "chkbAdd")
    AllowedGridMenus.IsBuffer = SaveCFGBool(chkbBuffer, "VB_OCX_GRID_MENU", "chkbBuffer")
    AllowedGridMenus.IsCfg = SaveCFGBool(chkbCfg, "VB_OCX_GRID_MENU", "chkbCfg")
    AllowedGridMenus.IsDelete = SaveCFGBool(chkbDelete, "VB_OCX_GRID_MENU", "chkbDelete")
    AllowedGridMenus.IsEdit = SaveCFGBool(chkbEdit, "VB_OCX_GRID_MENU", "chkbEdit")
    AllowedGridMenus.IsFind = SaveCFGBool(chkbFind, "VB_OCX_GRID_MENU", "chkbFind")
    AllowedGridMenus.IsOpen = SaveCFGBool(chkbOpen, "VB_OCX_GRID_MENU", "chkbOpen")
    AllowedGridMenus.IsPrn = SaveCFGBool(chkbPrn, "VB_OCX_GRID_MENU", "chkbPrn")
    AllowedGridMenus.IsRef = SaveCFGBool(chkbRef, "VB_OCX_GRID_MENU", "chkbRef")
    
    SinglePanelSettings.AllowSaveButton = SaveCFGBool(chkbAllowSave, "VB_OCX_PANEL_BUTTONS", "AllowSave")
    SinglePanelSettings.AllowRefreshButton = SaveCFGBool(chkbAllowRefresh, "VB_OCX_PANEL_BUTTONS", "AllowRefressh")
    SinglePanelSettings.AllowConfigButton = SaveCFGBool(chkbAllowCfg, "VB_OCX_PANEL_BUTTONS", "AllowConfig")
    SinglePanelSettings.AllowNonModalShow = SaveCFGBool(chkbNonModalChild, "VB_OCX_PANEL_BUTTONS", "NonModalChild")
    
    
    Unload Me
End Sub


Private Function LoadCFGBool(ByRef ChkbMain As CheckBox, sKey As String, sValue As String, Optional bdefault As Boolean = True) As Boolean
    Dim bRes As Boolean
    bRes = CBool(Utility.MTZGetSetting("GENERATOR", sKey, sValue, "True"))
    If bRes Then
        ChkbMain.value = vbChecked
    Else
        ChkbMain.value = vbUnchecked
    End If
    LoadCFGBool = bRes
End Function

Private Function SaveCFGBool(ByRef ChkbMain As CheckBox, sKey As String, sValue As String) As Boolean
    Call Utility.MTZSaveSetting("GENERATOR", sKey, sValue, IIf(ChkbMain.value = vbChecked, "True", "False"))
    SaveCFGBool = IIf(ChkbMain.value = vbChecked, True, False)
End Function

Private Sub Form_Load()

    If AllowedGridMenus Is Nothing Then
        Set AllowedGridMenus = New Allowed_GridMenuItems
        
    End If
    
    If SinglePanelSettings Is Nothing Then
        Set SinglePanelSettings = New PanelSettings
    End If
    
    

    AllowedGridMenus.IsAcc = LoadCFGBool(chkbAcc, "VB_OCX_GRID_MENU", "chkbAcc", "True")
    AllowedGridMenus.IsAdd = LoadCFGBool(chkbAdd, "VB_OCX_GRID_MENU", "chkbAdd", "True")
    AllowedGridMenus.IsBuffer = LoadCFGBool(chkbBuffer, "VB_OCX_GRID_MENU", "chkbBuffer", "True")
    AllowedGridMenus.IsCfg = LoadCFGBool(chkbCfg, "VB_OCX_GRID_MENU", "chkbCfg", "True")
    AllowedGridMenus.IsDelete = LoadCFGBool(chkbDelete, "VB_OCX_GRID_MENU", "chkbDelete", "True")
    AllowedGridMenus.IsEdit = LoadCFGBool(chkbEdit, "VB_OCX_GRID_MENU", "chkbEdit", "True")
    AllowedGridMenus.IsFind = LoadCFGBool(chkbFind, "VB_OCX_GRID_MENU", "chkbFind", "True")
    AllowedGridMenus.IsOpen = LoadCFGBool(chkbOpen, "VB_OCX_GRID_MENU", "chkbOpen", "True")
    AllowedGridMenus.IsPrn = LoadCFGBool(chkbPrn, "VB_OCX_GRID_MENU", "chkbPrn", "True")
    AllowedGridMenus.IsRef = LoadCFGBool(chkbRef, "VB_OCX_GRID_MENU", "chkbRef", "True")

    SinglePanelSettings.AllowSaveButton = LoadCFGBool(chkbAllowSave, "VB_OCX_PANEL_BUTTONS", "AllowSave", "True")
    SinglePanelSettings.AllowRefreshButton = LoadCFGBool(chkbAllowRefresh, "VB_OCX_PANEL_BUTTONS", "AllowRefressh", "True")
    SinglePanelSettings.AllowConfigButton = LoadCFGBool(chkbAllowCfg, "VB_OCX_PANEL_BUTTONS", "AllowConfig", "True")
    SinglePanelSettings.AllowNonModalShow = LoadCFGBool(chkbNonModalChild, "VB_OCX_PANEL_BUTTONS", "NonModalChild", "True")
    
    IsMake_HIDDEN_GRID_Cfg = CBool(Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_HIDDEN_CFG", "", "True"))
    
    If IsMake_HIDDEN_GRID_Cfg Then
        chkbIncludeHiddenCfg.value = vbChecked
    Else
        chkbIncludeHiddenCfg.value = vbUnchecked
    End If


    IsMake_TRASH_Buttons = CBool(Utility.MTZGetSetting("GENERATOR", "VB_OCX_Buttons", "", "True"))
    If IsMake_TRASH_Buttons Then
        chkbAllowTrashIcons.value = vbChecked
    Else
        chkbAllowTrashIcons.value = vbUnchecked
    End If
    
    IsMake_TRASH_GRID_Menus = CBool(Utility.MTZGetSetting("GENERATOR", "VB_OCX_GRID_MENU", "", "True"))
    If IsMake_TRASH_GRID_Menus Then
        chkbAllowTrashGridMenu.value = vbChecked
    Else
        chkbAllowTrashGridMenu.value = vbUnchecked
    End If
    
    If Not IsMake_TRASH_GRID_Menus Then
        chkbAcc.Enabled = False
        chkbAdd.Enabled = False
        chkbBuffer.Enabled = False
        chkbCfg.Enabled = False
        chkbDelete.Enabled = False
        chkbEdit.Enabled = False
        chkbFind.Enabled = False
        chkbOpen.Enabled = False
        chkbPrn.Enabled = False
        chkbRef.Enabled = False
    End If
    
End Sub
