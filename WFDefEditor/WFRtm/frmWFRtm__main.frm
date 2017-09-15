VERSION 5.00
Object = "{8408294B-9E97-428D-999B-82C43BF0BFFA}#2.4#0"; "JWRAP.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.5#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmWFRtm__main 
   Caption         =   "Процесс"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
   Begin VB.Timer menuTimerWFRtm_Doc 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFRtm_Doc 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   0
      TabIndex        =   37
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFRtm_DocAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   47
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   45
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   44
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   43
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   42
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   41
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   40
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   39
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFRtm_Doc 
         Height          =   480
         Left            =   150
         TabIndex        =   38
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin MTZ_PANEL.DropButton cmdWFRtm_DocRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   46
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Timer menuTimerWFRtm_Param 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFRtm_Param 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   6000
      TabIndex        =   26
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFRtm_ParamAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   36
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_ParamFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   34
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_ParamCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   33
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_ParamPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   32
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_ParamRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   31
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_ParamDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   30
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_ParamEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   29
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_ParamAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   28
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFRtm_Param 
         Height          =   480
         Left            =   150
         TabIndex        =   27
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin MTZ_PANEL.DropButton cmdWFRtm_ParamRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   35
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Timer menuTimerWFRtm_Pcomm 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFRtm_Pcomm 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   4500
      TabIndex        =   18
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFRtm_PcommAcc 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   25
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_PcommRef 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   24
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_PcommDel 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   23
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_PcommEdit 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   22
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_PcommAdd 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   21
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_PcommAddRoot 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   20
         Tag             =   "NEWROOT.ico"
         ToolTipText     =   "Добавить ветку"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MSComctlLib.TreeView treeWFRtm_Pcomm 
         Height          =   480
         Left            =   225
         TabIndex        =   19
         Top             =   600
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   132
         LabelEdit       =   1
         LineStyle       =   1
         PathSeparator   =   ""
         Style           =   7
         Appearance      =   1
      End
   End
   Begin VB.Timer menuTimerWFRtm_func 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFRtm_func 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   3000
      TabIndex        =   7
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFRtm_funcAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   17
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_funcFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   15
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_funcCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   14
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_funcPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   13
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_funcRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   12
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_funcDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   11
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_funcEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_funcAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   9
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFRtm_func 
         Height          =   480
         Left            =   150
         TabIndex        =   8
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin MTZ_PANEL.DropButton cmdWFRtm_funcRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   16
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Frame pnlWFRtm_main 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFRtm_mainRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_mainAdd 
         Enabled         =   0   'False
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "New.ico"
         ToolTipText     =   "Создать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_mainDel 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_mainSave 
         Enabled         =   0   'False
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "SAVE.ico"
         ToolTipText     =   "Сохранить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin WFRtmGUI.WFRtm_main editWFRtm_main 
         Height          =   480
         Left            =   150
         TabIndex        =   2
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
   End
   Begin MSComctlLib.TabStrip ts 
      Height          =   1500
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   1
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFile 
      Caption         =   "Файл"
      Begin VB.Menu mnuSaveAsXML 
         Caption         =   "Сохранить в формате XML"
      End
      Begin VB.Menu mnuLoadFromXML 
         Caption         =   "Загрузить из XML"
      End
      Begin VB.Menu mnuSecure 
         Caption         =   "Стиль защиты"
      End
      Begin VB.Menu mnuLock 
         Caption         =   "Заблокировать"
      End
      Begin VB.Menu mnuUnlock 
         Caption         =   "Разблокировать"
      End
      Begin VB.Menu mnuRename 
         Caption         =   "Переименовать"
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Выход"
      End
   End
   Begin VB.Menu mnuPopupWFRtm_func 
      Caption         =   "Меню для Функции"
      Visible         =   0   'False
      Begin VB.Menu mnuWFRtm_funcAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFRtm_funcEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFRtm_funcDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFRtm_funcOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFRtm_funcRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFRtm_funcS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFRtm_funcBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFRtm_funcCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFRtm_funcCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFRtm_funcPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFRtm_funcCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFRtm_funcCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFRtm_funcPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFRtm_funcCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFRtm_funcFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFRtm_funcAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWFRtm_Pcomm 
      Caption         =   "Меню для Комментарии"
      Visible         =   0   'False
      Begin VB.Menu mnuWFRtm_PcommAddRoot 
         Caption         =   "Создать ветку"
      End
      Begin VB.Menu mnuWFRtm_PcommAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFRtm_PcommEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFRtm_PcommDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFRtm_PcommS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFRtm_PcommBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFRtm_PcommCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFRtm_PcommCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFRtm_PcommPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFRtm_PcommCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFRtm_PcommCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFRtm_PcommRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFRtm_PcommAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWFRtm_Param 
      Caption         =   "Меню для Параметры"
      Visible         =   0   'False
      Begin VB.Menu mnuWFRtm_ParamAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFRtm_ParamEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFRtm_ParamDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFRtm_ParamOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFRtm_ParamRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFRtm_ParamS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFRtm_ParamBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFRtm_ParamCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFRtm_ParamCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFRtm_ParamPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFRtm_ParamCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFRtm_ParamCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFRtm_ParamPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFRtm_ParamCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFRtm_ParamFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFRtm_ParamAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWFRtm_Doc 
      Caption         =   "Меню для Документы"
      Visible         =   0   'False
      Begin VB.Menu mnuWFRtm_DocAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFRtm_DocEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFRtm_DocDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFRtm_DocOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFRtm_DocRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFRtm_DocS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFRtm_DocBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFRtm_DocCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFRtm_DocCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFRtm_DocPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFRtm_DocCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFRtm_DocCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFRtm_DocPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFRtm_DocCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFRtm_DocFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFRtm_DocAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "frmWFRtm__main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Item As Object
Public Host As GUI
Public ModalMode As Boolean
Private fndWFRtm_func As Object
Private menuActionWFRtm_func As String
Private menuActionWFRtm_Pcomm As String
Private fndWFRtm_Param As Object
Private menuActionWFRtm_Param As String
Private fndWFRtm_Doc As Object
Private menuActionWFRtm_Doc As String


Private Sub SaveToBuffer(u As Object)
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      xdom.loadXML "<I></I>"
      u.XMLSave xdom.lastChild, xdom
      Item.Manager.SetBuffer u.PartName, xdom.xml
      Set xdom = Nothing
End Sub

Private Function GetFromBuffer(u As Object) As Boolean
      On Error GoTo bye
      Dim xdom As MSXML2.DOMDocument
      Set xdom = New MSXML2.DOMDocument
      GetFromBuffer = False
      If Item.Manager.GetBuffer(u.PartName) <> "" Then
        xdom.loadXML Item.Manager.GetBuffer(u.PartName)
        u.XMLLoad xdom.lastChild, 2
        u.BatchUpdate
        GetFromBuffer = True
      Else
        MsgBox "Буфер данных для этого раздела пуст", vbInformation
      End If
    Exit Function
bye:
    MsgBox Err.Description, vbCritical
End Function
Private Sub mnuSaveAsXML_Click()
  On Error Resume Next
 If Item.Application.MTZSession.CheckRight(Item.SecureStyleid, "XMLSAVE") Then
   Item.LockResource True
   Item.LoadAll
   Item.WorkOffline = True
   Dim xdom As MSXML2.DOMDocument
   Set xdom = New MSXML2.DOMDocument
   xdom.loadXML "<root></root>"
   Item.XMLSave xdom.lastChild, xdom
   xdom.Save App.Path & "\" & Item.ID & ".xml"
   Item.WorkOffline = False
 End If
End Sub
Private Sub mnuSecure_Click()
  On Error Resume Next
  Item.Application.Manager.ShowSecurityDialog Item
End Sub
Private Sub mnuUnlock_Click()
  On Error Resume Next
  If Item.IsLocked Then
    Item.UnlockResource
  Else
  MsgBox "Объект не заблокирован", vbInformation
  End If
End Sub
Private Sub mnuLock_Click()
  On Error Resume Next
    Item.LockResource True
End Sub
Private Sub mnuRename_Click()
  On Error Resume Next
  Dim n As String
  n = InputBox("Новое название", "Переименовать", Item.Name)
  If n <> "" And n <> Item.Name Then
    Item.Name = n
    Item.Save
    Me.Caption = Item.Name
  End If
End Sub
Private Sub mnuExit_Click()
  On Error Resume Next
  Unload Me
End Sub
Private Sub mnuDelete_Click()
  On Error GoTo bye
  If MsgBox("Удалить документ?", vbQuestion + vbYesNo) = vbYes Then
    Item.UnlockResource
    Item.WorkOffline = False
    Item.Manager.DeleteInstance Item.ID
    Item.Manager.FreeInstanceObject Item.ID
    Unload Me
  End If
  Exit Sub
bye:
   MsgBox Err.Description, vbCritical, "Ошибка при удалении"
End Sub
Private Sub mnuLoadFromXML_Click()
 On Error Resume Next
 If Item.Application.MTZSession.CheckRight(Item.SecureStyleid, "XMLLOAD") Then
  Dim xdom As MSXML2.DOMDocument
  Set xdom = New MSXML2.DOMDocument
  xdom.Load App.Path & "\" & Item.ID & ".xml"
  Item.XMLLoad xdom.lastChild, 1
  Item.WorkOffline = False
  Item.BatchUpdate
  Set xdom = Nothing
 End If
End Sub
Private Sub cmdWFRtm_mainRef_Click()
  On Error Resume Next
  Item.WFRtm_main.Refresh
  cmdWFRtm_mainAdd_Click
End Sub
Private Sub cmdWFRtm_mainAdd_Click()
  On Error Resume Next
 Dim u As Object
 If Item.WFRtm_main.Count = 0 Then
   Set u = Item.WFRtm_main.Add

 End If
 Set editWFRtm_main.Item = Item.WFRtm_main.Item(1)
 editWFRtm_main.InitPanel
 cmdWFRtm_mainDel.Enabled = True
 cmdWFRtm_mainSave.Enabled = False
 cmdWFRtm_mainAdd.Enabled = False
End Sub
Private Sub cmdWFRtm_mainDel_Click()
  On Error Resume Next
  If editWFRtm_main.Item Is Nothing Then Exit Sub
  If MsgBox("Удалить элемент" & vbCrLf & editWFRtm_main.Item.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
    On Error GoTo bye
    editWFRtm_main.Item.Parent.Delete editWFRtm_main.Item.ID
    cmdWFRtm_mainDel.Enabled = False
    cmdWFRtm_mainSave.Enabled = False
    editWFRtm_main.Enabled = False
    Set editWFRtm_main.Item = Nothing
    cmdWFRtm_mainAdd.Enabled = True
  End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub editWFRtm_main_Changed()
 cmdWFRtm_mainSave.Enabled = True
End Sub
Private Sub cmdWFRtm_mainSave_Click()
  On Error Resume Next
    If editWFRtm_main.IsOK Then
    editWFRtm_main.Save
  On Error GoTo bye
    editWFRtm_main.Item.Save
    cmdWFRtm_mainSave.Enabled = False
    Else
      MsgBox "Не все обязатеьлные поля заполнены", vbOKOnly + vbExclamation
    End If
  On Error Resume Next
  Dim ff As Long
  ff = FreeFile
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFRtm_editWFRtm_main_" For Output As #ff
  Print #ff, editWFRtm_main.PanelCustomisationString
  Close #ff
Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
  editWFRtm_main.Item.Refresh
  editWFRtm_main.InitPanel
End Sub
Private Sub opWFRtm_func_OpenRef_(RowItem As Object)
With RowItem
Run_VBOpenRef ID:=.Func.ID, StartMode:="", RowItem:=RowItem
End With
End Sub
Private Sub cmdWFRtm_funcCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFRtm_func, "gridWFRtm_func"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_funcPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFRtm_func, "Функции"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_funcRef_Click()
  On Error Resume Next
  Item.WFRtm_func.Refresh
  gridWFRtm_func.ItemCount = Item.WFRtm_func.Count
  gridWFRtm_func.Refetch
  gridWFRtm_func.Refresh
End Sub
Private Sub cmdWFRtm_funcAcc_Click()
On Error Resume Next
If gridWFRtm_func.ItemCount = 0 Then Exit Sub
If gridWFRtm_func.Row > 0 Then
 If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFRtm_funcEdit_Click()
  On Error Resume Next
If gridWFRtm_func.ItemCount = 0 Then Exit Sub
If gridWFRtm_func.Row > 0 Then
 If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFRtm_func_.Item = u
again:     frmWFRtm_func_.NotFirstTime = False
    frmWFRtm_func_.Show vbModal
    If frmWFRtm_func_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFRtm_func.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFRtm_funcDel_Click()
  On Error Resume Next
  gridWFRtm_func.Delete
End Sub
Private Sub cmdWFRtm_funcAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFRtm_func.Add()

      Set frmWFRtm_func_.Item = u
again:       frmWFRtm_func_.NotFirstTime = False
      frmWFRtm_func_.Show vbModal
      If frmWFRtm_func_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFRtm_func.ItemCount = Item.WFRtm_func.Count
        gridWFRtm_func.Refresh
        gridWFRtm_func.RefreshGroups
        gridWFRtm_func.RefreshSort
        gridWFRtm_func.MoveToBookmark u.ID & "WFRtm_func"
      Else
        Item.WFRtm_func.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFRtm_funcFnd_Click()
  On Error Resume Next
  fndWFRtm_func.ShowForm
End Sub
Private Sub cmdWFRtm_funcRun_Click()
  On Error Resume Next
  gridWFRtm_func_JWDblClick
End Sub
Private Sub gridWFRtm_func_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFRtm_func.LoadRow gridWFRtm_func, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFRtm_func_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFRtm_func.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFRtm_func", Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridWFRtm_func_JWDblClick()
If gridWFRtm_func.ItemCount = 0 Then Exit Sub
If gridWFRtm_func.Row > 0 Then
  If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    On Error Resume Next
    If Not u Is Nothing Then
      opWFRtm_func_OpenRef_ u
    End If
     u.Refresh
  End If
End If
End Sub
Private Sub gridWFRtm_func_JWKeyPress(KeyAscii As Integer)
  If gridWFRtm_func.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFRtm_func.FindOnPress KeyAscii
End Sub

Private Sub gridWFRtm_func_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFRtm_func.Row And LastRow > 0 Then
  gridWFRtm_func.GetRowData(LastRow).RowStyle = "Default"
  gridWFRtm_func.GetRowData(gridWFRtm_func.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFRtm_funcPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFRtm_func.Add()
    If GetFromBuffer(u) Then
      gridWFRtm_func.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFRtm_func_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFRtm_func
End If
End Sub
Private Sub mnuWFRtm_funcAdd_click()
   menuActionWFRtm_func = "ADD"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcEdit_click()
   menuActionWFRtm_func = "EDIT"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcDelete_click()
   menuActionWFRtm_func = "DEL"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcOpen_click()
   menuActionWFRtm_func = "RUN"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcRef_click()
   menuActionWFRtm_func = "REF"
   menuTimerWFRtm_func.Enabled = True
End Sub
  Private Sub mnuWFRtm_funcCOPY_Click()
    On Error Resume Next
    If gridWFRtm_func.ItemCount = 0 Then Exit Sub
    If gridWFRtm_func.Row > 0 Then
     If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFRtm_funcCUT_Click()
    On Error Resume Next
    If gridWFRtm_func.ItemCount = 0 Then Exit Sub
    If gridWFRtm_func.Row > 0 Then
     If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFRtm_func.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFRtm_funcCHANGE_Click()
  On Error Resume Next
  If gridWFRtm_func.ItemCount = 0 Then Exit Sub
  If gridWFRtm_func.Row > 0 Then
   If gridWFRtm_func.RowIndex(gridWFRtm_func.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_func.RowBookmark(gridWFRtm_func.RowIndex(gridWFRtm_func.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFRtm_func.ItemCount = u.Parent.Count
      gridWFRtm_func.RefreshRowIndex gridWFRtm_func.RowIndex(gridWFRtm_func.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFRtm_funcCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFRtm_funcPrn_click()
   menuActionWFRtm_func = "PRN"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcCfg_click()
   menuActionWFRtm_func = "CFG"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcFind_click()
   menuActionWFRtm_func = "FND"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub mnuWFRtm_funcAcc_click()
   menuActionWFRtm_func = "ACC"
   menuTimerWFRtm_func.Enabled = True
End Sub
Private Sub menuTimerWFRtm_func_timer()
   menuTimerWFRtm_func.Enabled = False
   If menuActionWFRtm_func = "ADD" Then cmdWFRtm_funcAdd_Click
   If menuActionWFRtm_func = "EDIT" Then cmdWFRtm_funcEdit_Click
   If menuActionWFRtm_func = "DEL" Then cmdWFRtm_funcDel_Click
   If menuActionWFRtm_func = "RUN" Then cmdWFRtm_funcRun_Click
   If menuActionWFRtm_func = "REF" Then cmdWFRtm_funcRef_Click
   If menuActionWFRtm_func = "PRN" Then cmdWFRtm_funcPrn_Click
   If menuActionWFRtm_func = "CFG" Then cmdWFRtm_funcCfg_Click
   If menuActionWFRtm_func = "FND" Then cmdWFRtm_funcFnd_Click
   If menuActionWFRtm_func = "ACC" Then cmdWFRtm_funcAcc_Click
   menuActionWFRtm_func = ""
End Sub
Private Sub cmdWFRtm_PcommAdd_Click()
  On Error Resume Next
Dim f As Object, p As Object
If (treeWFRtm_Pcomm.SelectedItem Is Nothing) Then Exit Sub
  Set p = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  Set f = p.WFRtm_Pcomm.Add()

      Set frmWFRtm_Pcomm_.Item = f
again:       frmWFRtm_Pcomm_.NotFirstTime = False
      frmWFRtm_Pcomm_.Show vbModal
      If frmWFRtm_Pcomm_.OK Then
        Err.Clear
        f.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
          If treeWFRtm_Pcomm.SelectedItem.Child.Tag <> "ToDelete" Then
            f.LoadToTree treeWFRtm_Pcomm, treeWFRtm_Pcomm.SelectedItem.Key
          End If
          Set treeWFRtm_Pcomm.SelectedItem = treeWFRtm_Pcomm.Nodes.Item(f.ID & "WFRtm_Pcomm")
      Else
        Item.WFRtm_Pcomm.Remove f.ID
      End If
End Sub

Private Sub cmdWFRtm_PcommAddRoot_Click()
  On Error Resume Next
Dim f As Object, p As Object
  Set f = Item.WFRtm_Pcomm.Add()
  Set frmWFRtm_Pcomm_.Item = f
again:   frmWFRtm_Pcomm_.NotFirstTime = False
  frmWFRtm_Pcomm_.Show vbModal
  If frmWFRtm_Pcomm_.OK Then
    Err.Clear
    f.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
      GoTo again
    End If
    f.LoadToTree treeWFRtm_Pcomm, ""
  Else
    Item.WFRtm_Pcomm.Remove f.ID
  End If
End Sub

Private Sub cmdWFRtm_PcommEdit_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  Set frmWFRtm_Pcomm_.Item = f
again:   frmWFRtm_Pcomm_.NotFirstTime = False
  frmWFRtm_Pcomm_.Show vbModal
  If frmWFRtm_Pcomm_.OK Then
    Err.Clear
    f.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
  End If
End Sub

Private Sub cmdWFRtm_PcommDel_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  If MsgBox("Удалить элемент" & vbCrLf & f.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
  On Error GoTo bye
     If f.Parent.Delete(f.ID) Then
       treeWFRtm_Pcomm.Nodes.Remove treeWFRtm_Pcomm.SelectedItem.Key
     End If
  End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub cmdWFRtm_PcommAcc_Click()
  On Error Resume Next
  Dim f As Object
  If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Set f = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  Item.Application.Manager.ShowSecurityDialog f
End Sub

Private Sub cmdWFRtm_PcommREf_Click()
  On Error Resume Next
  Item.WFRtm_Pcomm.Refresh
  treeWFRtm_Pcomm.Nodes.Clear
  Item.WFRtm_Pcomm.filltree treeWFRtm_Pcomm
End Sub

Private Sub treeWFRtm_Pcomm_JWDblClick()
If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Dim f As Object
  Set f = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  Set frmWFRtm_Pcomm_.Item = f
again:   frmWFRtm_Pcomm_.NotFirstTime = False
  frmWFRtm_Pcomm_.Show vbModal
  If frmWFRtm_Pcomm_.OK Then
    On Error Resume Next
    Err.Clear
    f.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    treeWFRtm_Pcomm.SelectedItem.Text = f.Brief(True)
    Else
     f.Refresh
  End If
End Sub

Private Sub treeWFRtm_Pcomm_Expand(ByVal Node As MSComctlLib.Node)
If Node.Child.Tag = "ToDelete" Then
 Me.MousePointer = vbHourglass
 treeWFRtm_Pcomm.Nodes.Remove Node.Child.Index
 Dim f As Object
 Set f = Item.FindRowObject("WFRtm_Pcomm", Left(Node.Key, 38))
 f.expandpart treeWFRtm_Pcomm, Node.Key
 Me.MousePointer = vbNormal
End If
End Sub

Private Sub treeWFRtm_Pcomm_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFRtm_Pcomm
End If
End Sub
Private Sub mnuWFRtm_PcommAddRoot_click()
   menuActionWFRtm_Pcomm = "ADDROOT"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
Private Sub mnuWFRtm_PcommAdd_click()
   menuActionWFRtm_Pcomm = "ADD"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
Private Sub mnuWFRtm_PcommEdit_click()
   menuActionWFRtm_Pcomm = "EDIT"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
Private Sub mnuWFRtm_PcommDelete_click()
   menuActionWFRtm_Pcomm = "DEL"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
  Private Sub mnuWFRtm_PcommCOPY_Click()
    On Error Resume Next
    If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
        Dim u As Object
        Set u = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
        SaveToBuffer u
  End Sub
  Private Sub mnuWFRtm_PcommCUT_Click()
    On Error Resume Next
    If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
    Dim u As Object, bm
    Set u = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
    SaveToBuffer u
    Set bm = u.Parent
    u.Parent.Delete u.ID
    treeWFRtm_Pcomm.Nodes.Remove treeWFRtm_Pcomm.SelectedItem.Key
  End Sub
Private Sub mnuWFRtm_PcommPASTE_Click()
On Error Resume Next
If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, f As Object
  Set f = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  Set u = f.WFRtm_Pcomm.Add()
  If GetFromBuffer(u) Then
    If treeWFRtm_Pcomm.SelectedItem.Child.Tag <> "ToDelete" Then
      u.LoadToTree treeWFRtm_Pcomm, treeWFRtm_Pcomm.SelectedItem.Key
    End If
  Else
   f.WFRtm_Pcomm.Refresh
  End If
End Sub
Private Sub mnuWFRtm_PcommCHANGE_Click()
  On Error Resume Next
  If treeWFRtm_Pcomm.SelectedItem Is Nothing Then Exit Sub
  Dim u As Object, bm
  Set u = Item.FindRowObject("WFRtm_Pcomm", Left(treeWFRtm_Pcomm.SelectedItem.Key, 38))
  If GetFromBuffer(u) Then
    treeWFRtm_Pcomm.SelectedItem.Text = u.Brief
      treeWFRtm_Pcomm.SelectedItem.Expanded = False
      While treeWFRtm_Pcomm.SelectedItem.children > 0
        treeWFRtm_Pcomm.Nodes.Remove treeWFRtm_Pcomm.SelectedItem.Child.Key
      Wend
      treeWFRtm_Pcomm.Nodes.Add(treeWFRtm_Pcomm.SelectedItem.Key, 4, "Expanding ...").Tag = "ToDelete"
      treeWFRtm_Pcomm_Expand treeWFRtm_Pcomm.SelectedItem
  End If
End Sub
  Private Sub mnuWFRtm_PcommCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFRtm_PcommRef_click()
   menuActionWFRtm_Pcomm = "REF"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
Private Sub mnuWFRtm_PcommAcc_click()
   menuActionWFRtm_Pcomm = "ACC"
   menuTimerWFRtm_Pcomm.Enabled = True
End Sub
Private Sub menuTimerWFRtm_Pcomm_timer()
   menuTimerWFRtm_Pcomm.Enabled = False
   If menuActionWFRtm_Pcomm = "ADDROOT" Then cmdWFRtm_PcommAddRoot_Click
   If menuActionWFRtm_Pcomm = "ADD" Then cmdWFRtm_PcommAdd_Click
   If menuActionWFRtm_Pcomm = "EDIT" Then cmdWFRtm_PcommEdit_Click
   If menuActionWFRtm_Pcomm = "DEL" Then cmdWFRtm_PcommDel_Click
   If menuActionWFRtm_Pcomm = "REF" Then cmdWFRtm_PcommREf_Click
   If menuActionWFRtm_Pcomm = "ACC" Then cmdWFRtm_PcommAcc_Click
   menuActionWFRtm_Pcomm = ""
End Sub
Private Sub cmdWFRtm_ParamCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFRtm_Param, "gridWFRtm_Param"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_ParamPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFRtm_Param, "Параметры"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_ParamRef_Click()
  On Error Resume Next
  Item.WFRtm_Param.Refresh
  gridWFRtm_Param.ItemCount = Item.WFRtm_Param.Count
  gridWFRtm_Param.Refetch
  gridWFRtm_Param.Refresh
End Sub
Private Sub cmdWFRtm_ParamAcc_Click()
On Error Resume Next
If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
If gridWFRtm_Param.Row > 0 Then
 If gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Param.RowBookmark(gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFRtm_ParamEdit_Click()
  On Error Resume Next
If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
If gridWFRtm_Param.Row > 0 Then
 If gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Param.RowBookmark(gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFRtm_Param_.Item = u
again:     frmWFRtm_Param_.NotFirstTime = False
    frmWFRtm_Param_.Show vbModal
    If frmWFRtm_Param_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFRtm_Param.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFRtm_ParamDel_Click()
  On Error Resume Next
  gridWFRtm_Param.Delete
End Sub
Private Sub cmdWFRtm_ParamAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFRtm_Param.Add()

      Set frmWFRtm_Param_.Item = u
again:       frmWFRtm_Param_.NotFirstTime = False
      frmWFRtm_Param_.Show vbModal
      If frmWFRtm_Param_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFRtm_Param.ItemCount = Item.WFRtm_Param.Count
        gridWFRtm_Param.Refresh
        gridWFRtm_Param.RefreshGroups
        gridWFRtm_Param.RefreshSort
        gridWFRtm_Param.MoveToBookmark u.ID & "WFRtm_Param"
      Else
        Item.WFRtm_Param.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFRtm_ParamFnd_Click()
  On Error Resume Next
  fndWFRtm_Param.ShowForm
End Sub
Private Sub cmdWFRtm_ParamRun_Click()
  On Error Resume Next
  gridWFRtm_Param_JWDblClick
End Sub
Private Sub gridWFRtm_Param_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFRtm_Param.LoadRow gridWFRtm_Param, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFRtm_Param_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFRtm_Param", Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridWFRtm_Param_JWDblClick()
  cmdWFRtm_ParamEdit_Click
End Sub
Private Sub gridWFRtm_Param_JWKeyPress(KeyAscii As Integer)
  If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFRtm_Param.FindOnPress KeyAscii
End Sub

Private Sub gridWFRtm_Param_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFRtm_Param.Row And LastRow > 0 Then
  gridWFRtm_Param.GetRowData(LastRow).RowStyle = "Default"
  gridWFRtm_Param.GetRowData(gridWFRtm_Param.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFRtm_ParamPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFRtm_Param.Add()
    If GetFromBuffer(u) Then
      gridWFRtm_Param.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFRtm_Param_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFRtm_Param
End If
End Sub
Private Sub mnuWFRtm_ParamAdd_click()
   menuActionWFRtm_Param = "ADD"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamEdit_click()
   menuActionWFRtm_Param = "EDIT"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamDelete_click()
   menuActionWFRtm_Param = "DEL"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamOpen_click()
   menuActionWFRtm_Param = "RUN"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamRef_click()
   menuActionWFRtm_Param = "REF"
   menuTimerWFRtm_Param.Enabled = True
End Sub
  Private Sub mnuWFRtm_ParamCOPY_Click()
    On Error Resume Next
    If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
    If gridWFRtm_Param.Row > 0 Then
     If gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_Param.RowBookmark(gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFRtm_ParamCUT_Click()
    On Error Resume Next
    If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
    If gridWFRtm_Param.Row > 0 Then
     If gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_Param.RowBookmark(gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFRtm_Param.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFRtm_ParamCHANGE_Click()
  On Error Resume Next
  If gridWFRtm_Param.ItemCount = 0 Then Exit Sub
  If gridWFRtm_Param.Row > 0 Then
   If gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Param.RowBookmark(gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFRtm_Param.ItemCount = u.Parent.Count
      gridWFRtm_Param.RefreshRowIndex gridWFRtm_Param.RowIndex(gridWFRtm_Param.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFRtm_ParamCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFRtm_ParamPrn_click()
   menuActionWFRtm_Param = "PRN"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamCfg_click()
   menuActionWFRtm_Param = "CFG"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamFind_click()
   menuActionWFRtm_Param = "FND"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub mnuWFRtm_ParamAcc_click()
   menuActionWFRtm_Param = "ACC"
   menuTimerWFRtm_Param.Enabled = True
End Sub
Private Sub menuTimerWFRtm_Param_timer()
   menuTimerWFRtm_Param.Enabled = False
   If menuActionWFRtm_Param = "ADD" Then cmdWFRtm_ParamAdd_Click
   If menuActionWFRtm_Param = "EDIT" Then cmdWFRtm_ParamEdit_Click
   If menuActionWFRtm_Param = "DEL" Then cmdWFRtm_ParamDel_Click
   If menuActionWFRtm_Param = "RUN" Then cmdWFRtm_ParamRun_Click
   If menuActionWFRtm_Param = "REF" Then cmdWFRtm_ParamRef_Click
   If menuActionWFRtm_Param = "PRN" Then cmdWFRtm_ParamPrn_Click
   If menuActionWFRtm_Param = "CFG" Then cmdWFRtm_ParamCfg_Click
   If menuActionWFRtm_Param = "FND" Then cmdWFRtm_ParamFnd_Click
   If menuActionWFRtm_Param = "ACC" Then cmdWFRtm_ParamAcc_Click
   menuActionWFRtm_Param = ""
End Sub
Private Sub cmdWFRtm_DocCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFRtm_Doc, "gridWFRtm_Doc"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_DocPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFRtm_Doc, "Документы"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_DocRef_Click()
  On Error Resume Next
  Item.WFRtm_Doc.Refresh
  gridWFRtm_Doc.ItemCount = Item.WFRtm_Doc.Count
  gridWFRtm_Doc.Refetch
  gridWFRtm_Doc.Refresh
End Sub
Private Sub cmdWFRtm_DocAcc_Click()
On Error Resume Next
If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
If gridWFRtm_Doc.Row > 0 Then
 If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFRtm_DocEdit_Click()
  On Error Resume Next
If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
If gridWFRtm_Doc.Row > 0 Then
 If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFRtm_Doc_.Item = u
again:     frmWFRtm_Doc_.NotFirstTime = False
    frmWFRtm_Doc_.Show vbModal
    If frmWFRtm_Doc_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFRtm_Doc.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFRtm_DocDel_Click()
  On Error Resume Next
  gridWFRtm_Doc.Delete
End Sub
Private Sub cmdWFRtm_DocAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFRtm_Doc.Add()

      Set frmWFRtm_Doc_.Item = u
again:       frmWFRtm_Doc_.NotFirstTime = False
      frmWFRtm_Doc_.Show vbModal
      If frmWFRtm_Doc_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFRtm_Doc.ItemCount = Item.WFRtm_Doc.Count
        gridWFRtm_Doc.Refresh
        gridWFRtm_Doc.RefreshGroups
        gridWFRtm_Doc.RefreshSort
        gridWFRtm_Doc.MoveToBookmark u.ID & "WFRtm_Doc"
      Else
        Item.WFRtm_Doc.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFRtm_DocFnd_Click()
  On Error Resume Next
  fndWFRtm_Doc.ShowForm
End Sub
Private Sub cmdWFRtm_DocRun_Click()
  On Error Resume Next
  gridWFRtm_Doc_JWDblClick
End Sub
Private Sub gridWFRtm_Doc_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFRtm_Doc.LoadRow gridWFRtm_Doc, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFRtm_Doc_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFRtm_Doc", Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridWFRtm_Doc_JWDblClick()
  cmdWFRtm_DocEdit_Click
End Sub
Private Sub gridWFRtm_Doc_JWKeyPress(KeyAscii As Integer)
  If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFRtm_Doc.FindOnPress KeyAscii
End Sub

Private Sub gridWFRtm_Doc_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFRtm_Doc.Row And LastRow > 0 Then
  gridWFRtm_Doc.GetRowData(LastRow).RowStyle = "Default"
  gridWFRtm_Doc.GetRowData(gridWFRtm_Doc.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFRtm_DocPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFRtm_Doc.Add()
    If GetFromBuffer(u) Then
      gridWFRtm_Doc.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFRtm_Doc_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFRtm_Doc
End If
End Sub
Private Sub mnuWFRtm_DocAdd_click()
   menuActionWFRtm_Doc = "ADD"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocEdit_click()
   menuActionWFRtm_Doc = "EDIT"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocDelete_click()
   menuActionWFRtm_Doc = "DEL"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocOpen_click()
   menuActionWFRtm_Doc = "RUN"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocRef_click()
   menuActionWFRtm_Doc = "REF"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
  Private Sub mnuWFRtm_DocCOPY_Click()
    On Error Resume Next
    If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
    If gridWFRtm_Doc.Row > 0 Then
     If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFRtm_DocCUT_Click()
    On Error Resume Next
    If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
    If gridWFRtm_Doc.Row > 0 Then
     If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFRtm_Doc.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFRtm_DocCHANGE_Click()
  On Error Resume Next
  If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
  If gridWFRtm_Doc.Row > 0 Then
   If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFRtm_Doc.ItemCount = u.Parent.Count
      gridWFRtm_Doc.RefreshRowIndex gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFRtm_DocCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFRtm_DocPrn_click()
   menuActionWFRtm_Doc = "PRN"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocCfg_click()
   menuActionWFRtm_Doc = "CFG"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocFind_click()
   menuActionWFRtm_Doc = "FND"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocAcc_click()
   menuActionWFRtm_Doc = "ACC"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub menuTimerWFRtm_Doc_timer()
   menuTimerWFRtm_Doc.Enabled = False
   If menuActionWFRtm_Doc = "ADD" Then cmdWFRtm_DocAdd_Click
   If menuActionWFRtm_Doc = "EDIT" Then cmdWFRtm_DocEdit_Click
   If menuActionWFRtm_Doc = "DEL" Then cmdWFRtm_DocDel_Click
   If menuActionWFRtm_Doc = "RUN" Then cmdWFRtm_DocRun_Click
   If menuActionWFRtm_Doc = "REF" Then cmdWFRtm_DocRef_Click
   If menuActionWFRtm_Doc = "PRN" Then cmdWFRtm_DocPrn_Click
   If menuActionWFRtm_Doc = "CFG" Then cmdWFRtm_DocCfg_Click
   If menuActionWFRtm_Doc = "FND" Then cmdWFRtm_DocFnd_Click
   If menuActionWFRtm_Doc = "ACC" Then cmdWFRtm_DocAcc_Click
   menuActionWFRtm_Doc = ""
End Sub
Private Sub ts_click()
  On Error Resume Next
  pnlWFRtm_Doc.Visible = False
  pnlWFRtm_Param.Visible = False
  pnlWFRtm_Pcomm.Visible = False
  pnlWFRtm_func.Visible = False
  pnlWFRtm_main.Visible = False

   Select Case ts.SelectedItem.Key
   Case "WFRtm_main"
     With pnlWFRtm_main
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      editWFRtm_main.Top = 40 * Screen.TwipsPerPixelX
      editWFRtm_main.Left = 5 * Screen.TwipsPerPixelX
      editWFRtm_main.Width = .Width - 10 * Screen.TwipsPerPixelX
      editWFRtm_main.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFRtm_func"
     With pnlWFRtm_func
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      gridWFRtm_func.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_func.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_func.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_func.Height = .Height - 45 * Screen.TwipsPerPixelY
      gridWFRtm_func.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_func.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_func.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_func.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFRtm_Pcomm"
     With pnlWFRtm_Pcomm
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      treeWFRtm_Pcomm.Top = 40 * Screen.TwipsPerPixelX
      treeWFRtm_Pcomm.Left = 5 * Screen.TwipsPerPixelX
      treeWFRtm_Pcomm.Width = .Width - 10 * Screen.TwipsPerPixelX
      treeWFRtm_Pcomm.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFRtm_Param"
     With pnlWFRtm_Param
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      gridWFRtm_Param.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Height = .Height - 45 * Screen.TwipsPerPixelY
      gridWFRtm_Param.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_Param.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFRtm_Doc"
     With pnlWFRtm_Doc
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      gridWFRtm_Doc.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Height = .Height - 45 * Screen.TwipsPerPixelY
      gridWFRtm_Doc.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
     End Select
End Sub
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean)
 Set Item = ObjItem
 Set Host = MyHost
 ModalMode = aModalMode
End Sub
Private Sub Form_Load()
  On Error Resume Next
  Me.Caption = Item.Brief
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "Общие данные"
ts.Tabs.Item(1).Key = "WFRtm_main"
  LoadBtnPictures cmdWFRtm_mainSave, cmdWFRtm_mainSave.Tag
  LoadBtnPictures cmdWFRtm_mainDel, cmdWFRtm_mainDel.Tag
  LoadBtnPictures cmdWFRtm_mainAdd, cmdWFRtm_mainAdd.Tag
  LoadBtnPictures cmdWFRtm_mainRef, cmdWFRtm_mainRef.Tag
  ff = FreeFile
  On Error Resume Next
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFRtm_editWFRtm_main_" For Input As #ff
  buf = ""
  buf = Input(LOF(ff), ff)
  Close #ff
  If buf <> "" Then editWFRtm_main.PanelCustomisationString = buf
  cmdWFRtm_mainAdd_Click
Call ts.Tabs.Add(, "WFRtm_func", "Функции")
  LoadBtnPictures cmdWFRtm_funcAdd, cmdWFRtm_funcAdd.Tag
  LoadBtnPictures cmdWFRtm_funcEdit, cmdWFRtm_funcEdit.Tag
  LoadBtnPictures cmdWFRtm_funcDel, cmdWFRtm_funcDel.Tag
  LoadBtnPictures cmdWFRtm_funcRef, cmdWFRtm_funcRef.Tag
  LoadBtnPictures cmdWFRtm_funcCfg, cmdWFRtm_funcCfg.Tag
  LoadBtnPictures cmdWFRtm_funcPrn, cmdWFRtm_funcPrn.Tag
  LoadBtnPictures cmdWFRtm_funcFnd, cmdWFRtm_funcFnd.Tag
  LoadBtnPictures cmdWFRtm_funcRun, cmdWFRtm_funcRun.Tag
  LoadBtnPictures cmdWFRtm_funcAcc, cmdWFRtm_funcAcc.Tag
  Item.WFRtm_func.PrepareGrid gridWFRtm_func
  LoadGridLayout gridWFRtm_func
  Set fndWFRtm_func = Nothing
  On Error Resume Next
  Set fndWFRtm_func = CreateObject("MTZ_JSetup.GridFinder")
  fndWFRtm_func.Init gridWFRtm_func
Call ts.Tabs.Add(, "WFRtm_Pcomm", "Комментарии")
  LoadBtnPictures cmdWFRtm_PcommAddRoot, cmdWFRtm_PcommAddRoot.Tag
  LoadBtnPictures cmdWFRtm_PcommAdd, cmdWFRtm_PcommAdd.Tag
  LoadBtnPictures cmdWFRtm_PcommEdit, cmdWFRtm_PcommEdit.Tag
  LoadBtnPictures cmdWFRtm_PcommDel, cmdWFRtm_PcommDel.Tag
  LoadBtnPictures cmdWFRtm_PcommRef, cmdWFRtm_PcommRef.Tag
  LoadBtnPictures cmdWFRtm_PcommAcc, cmdWFRtm_PcommAcc.Tag
Item.WFRtm_Pcomm.filltree treeWFRtm_Pcomm
Call ts.Tabs.Add(, "WFRtm_Param", "Параметры")
  LoadBtnPictures cmdWFRtm_ParamAdd, cmdWFRtm_ParamAdd.Tag
  LoadBtnPictures cmdWFRtm_ParamEdit, cmdWFRtm_ParamEdit.Tag
  LoadBtnPictures cmdWFRtm_ParamDel, cmdWFRtm_ParamDel.Tag
  LoadBtnPictures cmdWFRtm_ParamRef, cmdWFRtm_ParamRef.Tag
  LoadBtnPictures cmdWFRtm_ParamCfg, cmdWFRtm_ParamCfg.Tag
  LoadBtnPictures cmdWFRtm_ParamPrn, cmdWFRtm_ParamPrn.Tag
  LoadBtnPictures cmdWFRtm_ParamFnd, cmdWFRtm_ParamFnd.Tag
  LoadBtnPictures cmdWFRtm_ParamRun, cmdWFRtm_ParamRun.Tag
  LoadBtnPictures cmdWFRtm_ParamAcc, cmdWFRtm_ParamAcc.Tag
  Item.WFRtm_Param.PrepareGrid gridWFRtm_Param
  LoadGridLayout gridWFRtm_Param
  Set fndWFRtm_Param = Nothing
  On Error Resume Next
  Set fndWFRtm_Param = CreateObject("MTZ_JSetup.GridFinder")
  fndWFRtm_Param.Init gridWFRtm_Param
Call ts.Tabs.Add(, "WFRtm_Doc", "Документы")
  LoadBtnPictures cmdWFRtm_DocAdd, cmdWFRtm_DocAdd.Tag
  LoadBtnPictures cmdWFRtm_DocEdit, cmdWFRtm_DocEdit.Tag
  LoadBtnPictures cmdWFRtm_DocDel, cmdWFRtm_DocDel.Tag
  LoadBtnPictures cmdWFRtm_DocRef, cmdWFRtm_DocRef.Tag
  LoadBtnPictures cmdWFRtm_DocCfg, cmdWFRtm_DocCfg.Tag
  LoadBtnPictures cmdWFRtm_DocPrn, cmdWFRtm_DocPrn.Tag
  LoadBtnPictures cmdWFRtm_DocFnd, cmdWFRtm_DocFnd.Tag
  LoadBtnPictures cmdWFRtm_DocRun, cmdWFRtm_DocRun.Tag
  LoadBtnPictures cmdWFRtm_DocAcc, cmdWFRtm_DocAcc.Tag
  Item.WFRtm_Doc.PrepareGrid gridWFRtm_Doc
  LoadGridLayout gridWFRtm_Doc
  Set fndWFRtm_Doc = Nothing
  On Error Resume Next
  Set fndWFRtm_Doc = CreateObject("MTZ_JSetup.GridFinder")
  fndWFRtm_Doc.Init gridWFRtm_Doc
  LoadFromSkin Me
End Sub
Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  If Not Item Is Nothing Then
    If Not Item.Manager Is Nothing Then
      Item.BatchUpdate
    End If
  End If
  If Not Host Is Nothing Then
   Host.EraseForm Item.ID, "", ModalMode
  End If
  Set Item = Nothing
  Set Host = Nothing
  SaveToSkin Me
End Sub
Private Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
ts.Top = 0
ts.Left = 0
ts.Width = Me.ScaleWidth
ts.Height = Me.ScaleHeight
ts_click
End Sub
Private Function FormByName(ByVal Name As String) As Form

If Name = "WFRtm_main" Then
 Set FormByName = New frmWFRtm_main_
 Exit Function
End If

If Name = "WFRtm_func" Then
 Set FormByName = New frmWFRtm_func_
 Exit Function
End If

If Name = "WFRtm_Pcomm" Then
 Set FormByName = New frmWFRtm_Pcomm_
 Exit Function
End If

If Name = "WFRtm_Param" Then
 Set FormByName = New frmWFRtm_Param_
 Exit Function
End If

If Name = "WFRtm_Doc" Then
 Set FormByName = New frmWFRtm_Doc_
 Exit Function
End If

End Function
Private Sub LoadFromSkin(frm As Form)
  On Error Resume Next
  Dim s As String, arr() As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  Dim ff As Long, buf As String
  ff = FreeFile
  Open s & frm.Name For Input As #ff
  buf = Input(LOF(ff), ff)
  Close #ff
  arr = Split(buf, vbCrLf)
  Dim arr2() As String, i As Long
For i = 0 To UBound(arr)
  arr2 = Split(arr(i), ":")
  Select Case arr2(0)
  Case "FormTag"
    frm.Tag = arr2(1)
  Case "FormTop"
    frm.Top = arr2(1)
  Case "FormLeft"
    frm.Left = arr2(1)
  Case "FormWidth"
    frm.Width = arr2(1)
  Case "FormHeight"
    frm.Height = arr2(1)
  Case Else
    frm.Controls(arr2(0)).Tag = Val(arr2(1))
  End Select
Next
  s = ""
  s = GetSetting("MTZ", "CONFIG", "IMAGEPATH", "")
  If s = "" Then Exit Sub
  Set frm.Icon = LoadPicture(s & frm.Tag)
End Sub

Private Sub SaveToSkin(frm As Form)
  On Error Resume Next
  Dim s As String, buf As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  frm.WindowState = 0
  Dim ff As Long
  ff = FreeFile
  Kill s & frm.Name
  Open s & frm.Name For Output As #ff
  buf = "FormTag:" & frm.Tag
  buf = buf & vbCrLf & "FormTop:" & frm.Top
  buf = buf & vbCrLf & "FormLeft:" & frm.Left
  buf = buf & vbCrLf & "FormWidth:" & frm.Width
  buf = buf & vbCrLf & "FormHeight:" & frm.Height
  Print #ff, buf
  Close #ff
End Sub


'переместить клиента в каталоге
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
'do nothing
End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для  каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
 'Set RowItem.Report = RowItem.Application.Manager.GetInstanceObject(ID)
 If RowItem.Report.VRRPT_MAIN.Count = 0 Then
  Set Obj = RowItem.Report.VRRPT_MAIN.Add
 Else
  Set Obj = RowItem.Report.VRRPT_MAIN.Item(1)
 End If
 
 Set Obj.Author = RowItem.Application.FindRowObject("Users", Item.Application.MTZSession.GetSessionUserID())
 Obj.TheDate = Date
 
 If ReportType = "CLNT" Then
   Set Obj.Client = RowItem.Application
 End If
 If ReportType = "PRJ" Then
   Set Obj.Project = RowItem.Application
 End If
 If ReportType = "CONT" Then
   Set Obj.Contract = RowItem.Application
 End If
 If ReportType = "PERS" Then
   Set Obj.Person = RowItem.Application
 End If
 
 Obj.Save
 RowItem.Save

End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
On Error Resume Next
If ID <> "" Then
    Dim Obj As Object
    Set Obj = Item.Manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = Item.Manager.GetInstanceGUI(Obj.ID)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If Obj.MTZSession.CheckRight(Obj.SecureStyleid, Obj.TypeName & ":" & "M" & i) Then
            StartMode = "M" & i
            Exit For
          End If
        Next
       End If
      
      objGui.Show StartMode & "", Obj
      Set objGui = Nothing
    End If
  End If
  
End Sub



'
'{069956DC-3305-45EF-9331-91CE323B5942}
Private Sub Run_WFDefName(Optional RowItem As Object)
Item.Name = RowItem.Description
Me.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
Item.Name = RowItem.Name
Me.Caption = Item.Name
Item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
Item.Name = Name
Me.Caption = Item.Name
Item.Save
End Sub



