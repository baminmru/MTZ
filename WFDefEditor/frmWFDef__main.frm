VERSION 5.00
Object = "{8408294B-9E97-428D-999B-82C43BF0BFFA}#2.4#0"; "JWRAP.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.5#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmWFDef__main 
   Caption         =   "Определение процесса"
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
   Begin VB.Timer menuTimerWFDef_Doc 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFDef_Doc 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   0
      TabIndex        =   39
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFDef_DocAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   49
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_DocFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   47
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_DocCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   46
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_DocPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   45
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_DocRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   44
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_DocDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   43
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_DocEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   42
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_DocAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   41
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFDef_Doc 
         Height          =   480
         Left            =   150
         TabIndex        =   40
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin MTZ_PANEL.DropButton cmdWFDef_DocRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   48
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Timer menuTimerWFDef_param 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFDef_param 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   6000
      TabIndex        =   28
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFDef_paramAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   38
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_paramFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   36
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_paramCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   35
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_paramPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   34
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_paramRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   33
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_paramDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   32
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_paramEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   31
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_paramAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   30
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFDef_param 
         Height          =   480
         Left            =   150
         TabIndex        =   29
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin MTZ_PANEL.DropButton cmdWFDef_paramRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   37
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Timer menuTimerWFDef_linkres 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Timer menuTimerWFDef_links 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFDef_INFO 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFDef_INFORef 
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
      Begin VB.CommandButton cmdWFDef_INFOAdd 
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
      Begin VB.CommandButton cmdWFDef_INFODel 
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
      Begin VB.CommandButton cmdWFDef_INFOSave 
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
      Begin WFDefGUI.WFDef_INFO editWFDef_INFO 
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
   Begin MTZ_PANEL.HFrames pnlWFDef_links 
      Height          =   1500
      Left            =   3000
      TabIndex        =   7
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
      Begin VB.CommandButton cmdWFDef_linkresAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   27
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin MTZ_PANEL.DropButton cmdWFDef_linkresRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   26
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
      Begin VB.CommandButton cmdWFDef_linkresFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   25
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   24
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   23
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   22
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   21
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   20
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFDef_linkresAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   19
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFDef_linkres 
         Height          =   480
         Left            =   150
         TabIndex        =   18
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin VB.CommandButton cmdWFDef_linksAcc 
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
      Begin MTZ_PANEL.DropButton cmdWFDef_linksRun 
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
      Begin VB.CommandButton cmdWFDef_linksFnd 
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
      Begin VB.CommandButton cmdWFDef_linksCfg 
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
      Begin VB.CommandButton cmdWFDef_linksPrn 
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
      Begin VB.CommandButton cmdWFDef_linksRef 
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
      Begin VB.CommandButton cmdWFDef_linksDel 
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
      Begin VB.CommandButton cmdWFDef_linksEdit 
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
      Begin VB.CommandButton cmdWFDef_linksAdd 
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
      Begin JWRAP.JanusWRAP gridWFDef_links 
         Height          =   480
         Left            =   150
         TabIndex        =   8
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
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
   Begin VB.Menu mnuPopupWFDef_links 
      Caption         =   "Меню для Переходы"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDef_linksAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDef_linksEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDef_linksDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDef_linksOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDef_linksRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDef_linksS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDef_linksBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDef_linksCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDef_linksCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDef_linksPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDef_linksCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDef_linksCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDef_linksPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDef_linksCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDef_linksFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFDef_linksAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWFDef_linkres 
      Caption         =   "Меню для Допустимые результаты"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDef_linkresAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDef_linkresEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDef_linkresDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDef_linkresOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDef_linkresRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDef_linkresS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDef_linkresBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDef_linkresCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDef_linkresCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDef_linkresPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDef_linkresCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDef_linkresCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDef_linkresPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDef_linkresCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDef_linkresFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFDef_linkresAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWFDef_param 
      Caption         =   "Меню для Параметры и переменные"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDef_paramAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDef_paramEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDef_paramDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDef_paramOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDef_paramRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDef_paramS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDef_paramBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDef_paramCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDef_paramCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDef_paramPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDef_paramCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDef_paramCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDef_paramPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDef_paramCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDef_paramFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFDef_paramAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWFDef_Doc 
      Caption         =   "Меню для Документы"
      Visible         =   0   'False
      Begin VB.Menu mnuWFDef_DocAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFDef_DocEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFDef_DocDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFDef_DocOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFDef_DocRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFDef_DocS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFDef_DocBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFDef_DocCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFDef_DocCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFDef_DocPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFDef_DocCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFDef_DocCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFDef_DocPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFDef_DocCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFDef_DocFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFDef_DocAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "frmWFDef__main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Item As Object
Public Host As GUI
Public ModalMode As Boolean
Private fndWFDef_links As Object
Private menuActionWFDef_links As String
Private fndWFDef_linkres As Object
Private menuActionWFDef_linkres As String
Private fndWFDef_param As Object
Private menuActionWFDef_param As String
Private fndWFDef_Doc As Object
Private menuActionWFDef_Doc As String


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
Private Sub opWFDef_INFO_UpdateName_(RowItem As Object)
With RowItem
Run_WFDefName RowItem:=RowItem
End With
End Sub
Private Sub cmdWFDef_INFORef_Click()
  On Error Resume Next
  Item.WFDef_INFO.Refresh
  cmdWFDef_INFOAdd_Click
End Sub
Private Sub cmdWFDef_INFOAdd_Click()
  On Error Resume Next
 Dim u As Object
 If Item.WFDef_INFO.Count = 0 Then
   Set u = Item.WFDef_INFO.Add

 End If
 Set editWFDef_INFO.Item = Item.WFDef_INFO.Item(1)
 editWFDef_INFO.InitPanel
 cmdWFDef_INFODel.Enabled = True
 cmdWFDef_INFOSave.Enabled = False
 cmdWFDef_INFOAdd.Enabled = False
End Sub
Private Sub cmdWFDef_INFODel_Click()
  On Error Resume Next
  If editWFDef_INFO.Item Is Nothing Then Exit Sub
  If MsgBox("Удалить элемент" & vbCrLf & editWFDef_INFO.Item.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
    On Error GoTo bye
    editWFDef_INFO.Item.Parent.Delete editWFDef_INFO.Item.ID
    cmdWFDef_INFODel.Enabled = False
    cmdWFDef_INFOSave.Enabled = False
    editWFDef_INFO.Enabled = False
    Set editWFDef_INFO.Item = Nothing
    cmdWFDef_INFOAdd.Enabled = True
  End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub editWFDef_INFO_Changed()
 cmdWFDef_INFOSave.Enabled = True
End Sub
Private Sub cmdWFDef_INFOSave_Click()
  On Error Resume Next
    If editWFDef_INFO.IsOK Then
    editWFDef_INFO.Save
  On Error GoTo bye
    editWFDef_INFO.Item.Save
        opWFDef_INFO_UpdateName_ editWFDef_INFO.Item
    cmdWFDef_INFOSave.Enabled = False
    Else
      MsgBox "Не все обязатеьлные поля заполнены", vbOKOnly + vbExclamation
    End If
  On Error Resume Next
  Dim ff As Long
  ff = FreeFile
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFDef_editWFDef_INFO_" For Output As #ff
  Print #ff, editWFDef_INFO.PanelCustomisationString
  Close #ff
Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
  editWFDef_INFO.Item.Refresh
  editWFDef_INFO.InitPanel
End Sub
Private Sub gridWFDef_links_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFDef_links
End If
End Sub
Private Sub mnuWFDef_linksAdd_click()
   menuActionWFDef_links = "ADD"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksEdit_click()
   menuActionWFDef_links = "EDIT"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksDelete_click()
   menuActionWFDef_links = "DEL"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksOpen_click()
   menuActionWFDef_links = "RUN"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksRef_click()
   menuActionWFDef_links = "REF"
   menuTimerWFDef_links.Enabled = True
End Sub
  Private Sub mnuWFDef_linksCOPY_Click()
    On Error Resume Next
    If gridWFDef_links.ItemCount = 0 Then Exit Sub
    If gridWFDef_links.Row > 0 Then
     If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDef_linksCUT_Click()
    On Error Resume Next
    If gridWFDef_links.ItemCount = 0 Then Exit Sub
    If gridWFDef_links.Row > 0 Then
     If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDef_links.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDef_linksCHANGE_Click()
  On Error Resume Next
  If gridWFDef_links.ItemCount = 0 Then Exit Sub
  If gridWFDef_links.Row > 0 Then
   If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDef_links.ItemCount = u.Parent.Count
      gridWFDef_links.RefreshRowIndex gridWFDef_links.RowIndex(gridWFDef_links.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDef_linksCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDef_linksPrn_click()
   menuActionWFDef_links = "PRN"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksCfg_click()
   menuActionWFDef_links = "CFG"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksFind_click()
   menuActionWFDef_links = "FND"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub mnuWFDef_linksAcc_click()
   menuActionWFDef_links = "ACC"
   menuTimerWFDef_links.Enabled = True
End Sub
Private Sub menuTimerWFDef_links_timer()
   menuTimerWFDef_links.Enabled = False
   If menuActionWFDef_links = "ADD" Then cmdWFDef_linksAdd_Click
   If menuActionWFDef_links = "EDIT" Then cmdWFDef_linksEdit_Click
   If menuActionWFDef_links = "DEL" Then cmdWFDef_linksDel_Click
   If menuActionWFDef_links = "RUN" Then cmdWFDef_linksRun_Click
   If menuActionWFDef_links = "REF" Then cmdWFDef_linksRef_Click
   If menuActionWFDef_links = "PRN" Then cmdWFDef_linksPrn_Click
   If menuActionWFDef_links = "CFG" Then cmdWFDef_linksCfg_Click
   If menuActionWFDef_links = "FND" Then cmdWFDef_linksFnd_Click
   If menuActionWFDef_links = "ACC" Then cmdWFDef_linksAcc_Click
   menuActionWFDef_links = ""
End Sub
Private Sub cmdWFDef_linksCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDef_links, "gridWFDef_links"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_linksPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDef_links, "Переходы"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_linksRef_Click()
  On Error Resume Next
  Item.WFDef_links.Refresh
  gridWFDef_links.ItemCount = Item.WFDef_links.Count
  gridWFDef_links.Refetch
  gridWFDef_links.Refresh
End Sub
Private Sub cmdWFDef_linksAcc_Click()
On Error Resume Next
If gridWFDef_links.ItemCount = 0 Then Exit Sub
If gridWFDef_links.Row > 0 Then
 If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDef_linksEdit_Click()
  On Error Resume Next
If gridWFDef_links.ItemCount = 0 Then Exit Sub
If gridWFDef_links.Row > 0 Then
 If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFDef_links_.Item = u
again:     frmWFDef_links_.NotFirstTime = False
    frmWFDef_links_.Show vbModal
    If frmWFDef_links_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDef_links.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFDef_linksDel_Click()
  On Error Resume Next
  gridWFDef_links.Delete
End Sub
Private Sub cmdWFDef_linksAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFDef_links.Add()

      Set frmWFDef_links_.Item = u
again:       frmWFDef_links_.NotFirstTime = False
      frmWFDef_links_.Show vbModal
      If frmWFDef_links_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFDef_links.ItemCount = Item.WFDef_links.Count
        gridWFDef_links.Refresh
        gridWFDef_links.RefreshGroups
        gridWFDef_links.RefreshSort
        gridWFDef_links.MoveToBookmark u.ID & "WFDef_links"
      Else
        Item.WFDef_links.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFDef_linksFnd_Click()
  On Error Resume Next
  fndWFDef_links.ShowForm
End Sub
Private Sub cmdWFDef_linksRun_Click()
  On Error Resume Next
  gridWFDef_links_JWDblClick
End Sub
Private Sub gridWFDef_links_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFDef_links.LoadRow gridWFDef_links, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFDef_links_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFDef_links.ItemCount = 0 Then Exit Sub
  Dim u As Object
  On Error Resume Next
  Set u = Item.FindRowObject(Right(Bookmark, Len(Bookmark) - 38), Left(Bookmark, 38))
  If Not u Is Nothing Then
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
Private Sub gridWFDef_links_JWDblClick()
  cmdWFDef_linksEdit_Click
End Sub
Private Sub gridWFDef_links_JWKeyPress(KeyAscii As Integer)
  If gridWFDef_links.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDef_links.FindOnPress KeyAscii
End Sub

Private Sub pnlWFDef_links_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  gridWFDef_links.Left = Left
  gridWFDef_links.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWFDef_links.Width = Width
  gridWFDef_links.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWFDef_linksAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linksAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWFDef_linksEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWFDef_linksDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWFDef_linksRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWFDef_linksPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWFDef_linksCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWFDef_linksFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWFDef_linksRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWFDef_linksAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub mnuWFDef_linksPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFDef_links.Add()
    If GetFromBuffer(u) Then
      gridWFDef_links.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub cmdWFDef_linkresCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDef_linkres, "gridWFDef_linkres"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_linkresPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDef_linkres, "Допустимые результаты"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_linkresAcc_Click()
On Error Resume Next
If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
If gridWFDef_linkres.Row > 0 Then
 If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDef_linkresFnd_Click()
  On Error Resume Next
  fndWFDef_linkres.ShowForm
End Sub
Private Sub cmdWFDef_linkresRun_Click()
  On Error Resume Next
  gridWFDef_linkres_JWDblClick
End Sub
Private Sub pnlWFDef_links_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
   On Error Resume Next
  gridWFDef_linkres.Left = Left
  gridWFDef_linkres.Top = Top + 25 * Screen.TwipsPerPixelY
  gridWFDef_linkres.Width = Width
  gridWFDef_linkres.Height = Height - 25 * Screen.TwipsPerPixelY
   cmdWFDef_linkresAdd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresEdit.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresDel.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresRef.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresPrn.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresCfg.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresFnd.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresRun.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresAcc.Top = Top + 2 * Screen.TwipsPerPixelY
   cmdWFDef_linkresAdd.Left = Left + 5 * Screen.TwipsPerPixelX
   cmdWFDef_linkresEdit.Left = Left + 30 * Screen.TwipsPerPixelX
   cmdWFDef_linkresDel.Left = Left + 55 * Screen.TwipsPerPixelX
   cmdWFDef_linkresRef.Left = Left + 80 * Screen.TwipsPerPixelX
   cmdWFDef_linkresPrn.Left = Left + 105 * Screen.TwipsPerPixelX
   cmdWFDef_linkresCfg.Left = Left + 130 * Screen.TwipsPerPixelX
   cmdWFDef_linkresFnd.Left = Left + 155 * Screen.TwipsPerPixelX
   cmdWFDef_linkresRun.Left = Left + 180 * Screen.TwipsPerPixelX
   cmdWFDef_linkresAcc.Left = Left + 205 * Screen.TwipsPerPixelX
End Sub
Private Sub cmdWFDef_linkresRef_Click()
  On Error Resume Next
If gridWFDef_links.ItemCount = 0 Then Exit Sub
If gridWFDef_links.Row > 0 Then
 If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFDef_linkres.Refresh
   gridWFDef_linkres.ItemCount = gu.WFDef_linkres.Count
   gridWFDef_linkres.Refetch
   gridWFDef_linkres.Refresh
 Else
  gridWFDef_linkres.Columns.Clear
  gridWFDef_linkres.ItemCount = 0
 End If
Else
 gridWFDef_linkres.Columns.Clear
 gridWFDef_linkres.ItemCount = 0
End If
End Sub
Private Sub cmdWFDef_linkresEdit_Click()
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    Set frmWFDef_linkres_.Item = u
again:     frmWFDef_linkres_.NotFirstTime = False
    frmWFDef_linkres_.Show vbModal
    If frmWFDef_linkres_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDef_linkres.RefreshRowBookmark bm2
    Else
        u.Refresh
    End If
    Set u = Nothing
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
End Sub
Private Sub cmdWFDef_linkresDel_Click()
  On Error Resume Next
  gridWFDef_linkres.Delete
End Sub
Private Sub cmdWFDef_linkresAdd_Click()
  On Error Resume Next
If gridWFDef_links.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.WFDef_linkres.Add()

    Set frmWFDef_linkres_.Item = u
again:     frmWFDef_linkres_.NotFirstTime = False
    frmWFDef_linkres_.Show vbModal
    If frmWFDef_linkres_.OK Then
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
      GoTo again
    End If

        gridWFDef_linkres.ItemCount = gu.WFDef_linkres.Count
        gridWFDef_linkres.Refresh
        gridWFDef_linkres.RefreshGroups
        gridWFDef_linkres.RefreshSort
    Else
        u.Parent.Remove u.ID
    End If
    Set u = Nothing
    Set gu = Nothing
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
  Set gu = Nothing
End Sub
Private Sub gridWFDef_links_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If gridWFDef_links.ItemCount = 0 Then Exit Sub
If gridWFDef_links.Row > 0 Then
  If LastRow <> gridWFDef_links.Row And LastRow > 0 Then
    gridWFDef_links.GetRowData(LastRow).RowStyle = "Default"
    gridWFDef_links.GetRowData(gridWFDef_links.Row).RowStyle = "SelectedRow"
  End If
 If gridWFDef_links.RowIndex(gridWFDef_links.Row) > 0 Then
  If LastRow <> gridWFDef_links.Row Or gridWFDef_linkres.Columns.Count = 0 Then
    Dim gu As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFDef_linkres.PrepareGrid gridWFDef_linkres
    LoadGridLayout gridWFDef_linkres
    Set fndWFDef_linkres = Nothing
    Set fndWFDef_linkres = CreateObject("MTZ_JSetup.GridFinder")
    fndWFDef_linkres.Init gridWFDef_linkres
  End If
 End If
End If
End Sub
Private Sub gridWFDef_linkres_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
    If gridWFDef_links.ItemCount = 0 Then Exit Sub
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    gu.WFDef_linkres.LoadRow gridWFDef_linkres, RowIndex, Bookmark, Values
    Set gu = Nothing
End Sub
Private Sub gridWFDef_linkres_JWKeyPress(KeyAscii As Integer)
  If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDef_linkres.FindOnPress KeyAscii
End Sub

Private Sub gridWFDef_linkres_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    Dim u As Object
    Dim bm2
    bm2 = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
    Set u = Item.FindRowObject(Right(bm2, Len(bm2) - 38), Left(bm2, 38))
    If Not u Is Nothing Then
      On Error Resume Next
      If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
        u.Parent.Delete u.ID
      Else
        Cancel = True
      End If
    End If

    Set u = Nothing
Exit Sub
bye:
   Cancel = True
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub gridWFDef_linkres_JWDblClick()
    cmdWFDef_linkresEdit_Click
End Sub
Private Sub gridWFDef_linkres_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
 If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
 If gridWFDef_linkres.Row > 0 Then
   If LastRow <> gridWFDef_linkres.Row And LastRow > 0 Then
     gridWFDef_linkres.GetRowData(LastRow).RowStyle = "Default"
     gridWFDef_linkres.GetRowData(gridWFDef_linkres.Row).RowStyle = "SelectedRow"
   End If
 End If
End Sub
Private Sub mnuWFDef_linkresPASTE_Click()
On Error Resume Next
    If gridWFDef_links.ItemCount = 0 Then Exit Sub
    Dim gu As Object
    Dim bm
    bm = gridWFDef_links.RowBookmark(gridWFDef_links.RowIndex(gridWFDef_links.Row))
    Set gu = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Dim u As Object
    Set u = gu.WFDef_linkres.Add()
    If GetFromBuffer(u) Then
      gridWFDef_linkres.ItemCount = u.Parent.Count
    Else
      gu.WFDef_linkres.Refresh
    End If
    Set gu = Nothing
End Sub
Private Sub gridWFDef_linkres_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFDef_linkres
End If
End Sub
Private Sub mnuWFDef_linkresAdd_click()
   menuActionWFDef_linkres = "ADD"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresEdit_click()
   menuActionWFDef_linkres = "EDIT"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresDelete_click()
   menuActionWFDef_linkres = "DEL"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresOpen_click()
   menuActionWFDef_linkres = "RUN"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresRef_click()
   menuActionWFDef_linkres = "REF"
   menuTimerWFDef_linkres.Enabled = True
End Sub
  Private Sub mnuWFDef_linkresCOPY_Click()
    On Error Resume Next
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    If gridWFDef_linkres.Row > 0 Then
     If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDef_linkresCUT_Click()
    On Error Resume Next
    If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
    If gridWFDef_linkres.Row > 0 Then
     If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDef_linkres.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDef_linkresCHANGE_Click()
  On Error Resume Next
  If gridWFDef_linkres.ItemCount = 0 Then Exit Sub
  If gridWFDef_linkres.Row > 0 Then
   If gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_linkres.RowBookmark(gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDef_linkres.ItemCount = u.Parent.Count
      gridWFDef_linkres.RefreshRowIndex gridWFDef_linkres.RowIndex(gridWFDef_linkres.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDef_linkresCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDef_linkresPrn_click()
   menuActionWFDef_linkres = "PRN"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresCfg_click()
   menuActionWFDef_linkres = "CFG"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresFind_click()
   menuActionWFDef_linkres = "FND"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub mnuWFDef_linkresAcc_click()
   menuActionWFDef_linkres = "ACC"
   menuTimerWFDef_linkres.Enabled = True
End Sub
Private Sub menuTimerWFDef_linkres_timer()
   menuTimerWFDef_linkres.Enabled = False
   If menuActionWFDef_linkres = "ADD" Then cmdWFDef_linkresAdd_Click
   If menuActionWFDef_linkres = "EDIT" Then cmdWFDef_linkresEdit_Click
   If menuActionWFDef_linkres = "DEL" Then cmdWFDef_linkresDel_Click
   If menuActionWFDef_linkres = "RUN" Then cmdWFDef_linkresRun_Click
   If menuActionWFDef_linkres = "REF" Then cmdWFDef_linkresRef_Click
   If menuActionWFDef_linkres = "PRN" Then cmdWFDef_linkresPrn_Click
   If menuActionWFDef_linkres = "CFG" Then cmdWFDef_linkresCfg_Click
   If menuActionWFDef_linkres = "FND" Then cmdWFDef_linkresFnd_Click
   If menuActionWFDef_linkres = "ACC" Then cmdWFDef_linkresAcc_Click
   menuActionWFDef_linkres = ""
End Sub
Private Sub cmdWFDef_paramCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDef_param, "gridWFDef_param"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_paramPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDef_param, "Параметры и переменные"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_paramRef_Click()
  On Error Resume Next
  Item.WFDef_param.Refresh
  gridWFDef_param.ItemCount = Item.WFDef_param.Count
  gridWFDef_param.Refetch
  gridWFDef_param.Refresh
End Sub
Private Sub cmdWFDef_paramAcc_Click()
On Error Resume Next
If gridWFDef_param.ItemCount = 0 Then Exit Sub
If gridWFDef_param.Row > 0 Then
 If gridWFDef_param.RowIndex(gridWFDef_param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_param.RowBookmark(gridWFDef_param.RowIndex(gridWFDef_param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDef_paramEdit_Click()
  On Error Resume Next
If gridWFDef_param.ItemCount = 0 Then Exit Sub
If gridWFDef_param.Row > 0 Then
 If gridWFDef_param.RowIndex(gridWFDef_param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_param.RowBookmark(gridWFDef_param.RowIndex(gridWFDef_param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFDef_param_.Item = u
again:     frmWFDef_param_.NotFirstTime = False
    frmWFDef_param_.Show vbModal
    If frmWFDef_param_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDef_param.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFDef_paramDel_Click()
  On Error Resume Next
  gridWFDef_param.Delete
End Sub
Private Sub cmdWFDef_paramAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFDef_param.Add()

      Set frmWFDef_param_.Item = u
again:       frmWFDef_param_.NotFirstTime = False
      frmWFDef_param_.Show vbModal
      If frmWFDef_param_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFDef_param.ItemCount = Item.WFDef_param.Count
        gridWFDef_param.Refresh
        gridWFDef_param.RefreshGroups
        gridWFDef_param.RefreshSort
        gridWFDef_param.MoveToBookmark u.ID & "WFDef_param"
      Else
        Item.WFDef_param.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFDef_paramFnd_Click()
  On Error Resume Next
  fndWFDef_param.ShowForm
End Sub
Private Sub cmdWFDef_paramRun_Click()
  On Error Resume Next
  gridWFDef_param_JWDblClick
End Sub
Private Sub gridWFDef_param_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFDef_param.LoadRow gridWFDef_param, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFDef_param_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFDef_param.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFDef_param", Left(Bookmark, 38))
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

Private Sub gridWFDef_param_JWDblClick()
  cmdWFDef_paramEdit_Click
End Sub
Private Sub gridWFDef_param_JWKeyPress(KeyAscii As Integer)
  If gridWFDef_param.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDef_param.FindOnPress KeyAscii
End Sub

Private Sub gridWFDef_param_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFDef_param.Row And LastRow > 0 Then
  gridWFDef_param.GetRowData(LastRow).RowStyle = "Default"
  gridWFDef_param.GetRowData(gridWFDef_param.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFDef_paramPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFDef_param.Add()
    If GetFromBuffer(u) Then
      gridWFDef_param.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFDef_param_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFDef_param
End If
End Sub
Private Sub mnuWFDef_paramAdd_click()
   menuActionWFDef_param = "ADD"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramEdit_click()
   menuActionWFDef_param = "EDIT"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramDelete_click()
   menuActionWFDef_param = "DEL"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramOpen_click()
   menuActionWFDef_param = "RUN"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramRef_click()
   menuActionWFDef_param = "REF"
   menuTimerWFDef_param.Enabled = True
End Sub
  Private Sub mnuWFDef_paramCOPY_Click()
    On Error Resume Next
    If gridWFDef_param.ItemCount = 0 Then Exit Sub
    If gridWFDef_param.Row > 0 Then
     If gridWFDef_param.RowIndex(gridWFDef_param.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_param.RowBookmark(gridWFDef_param.RowIndex(gridWFDef_param.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDef_paramCUT_Click()
    On Error Resume Next
    If gridWFDef_param.ItemCount = 0 Then Exit Sub
    If gridWFDef_param.Row > 0 Then
     If gridWFDef_param.RowIndex(gridWFDef_param.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_param.RowBookmark(gridWFDef_param.RowIndex(gridWFDef_param.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDef_param.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDef_paramCHANGE_Click()
  On Error Resume Next
  If gridWFDef_param.ItemCount = 0 Then Exit Sub
  If gridWFDef_param.Row > 0 Then
   If gridWFDef_param.RowIndex(gridWFDef_param.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_param.RowBookmark(gridWFDef_param.RowIndex(gridWFDef_param.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDef_param.ItemCount = u.Parent.Count
      gridWFDef_param.RefreshRowIndex gridWFDef_param.RowIndex(gridWFDef_param.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDef_paramCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDef_paramPrn_click()
   menuActionWFDef_param = "PRN"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramCfg_click()
   menuActionWFDef_param = "CFG"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramFind_click()
   menuActionWFDef_param = "FND"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub mnuWFDef_paramAcc_click()
   menuActionWFDef_param = "ACC"
   menuTimerWFDef_param.Enabled = True
End Sub
Private Sub menuTimerWFDef_param_timer()
   menuTimerWFDef_param.Enabled = False
   If menuActionWFDef_param = "ADD" Then cmdWFDef_paramAdd_Click
   If menuActionWFDef_param = "EDIT" Then cmdWFDef_paramEdit_Click
   If menuActionWFDef_param = "DEL" Then cmdWFDef_paramDel_Click
   If menuActionWFDef_param = "RUN" Then cmdWFDef_paramRun_Click
   If menuActionWFDef_param = "REF" Then cmdWFDef_paramRef_Click
   If menuActionWFDef_param = "PRN" Then cmdWFDef_paramPrn_Click
   If menuActionWFDef_param = "CFG" Then cmdWFDef_paramCfg_Click
   If menuActionWFDef_param = "FND" Then cmdWFDef_paramFnd_Click
   If menuActionWFDef_param = "ACC" Then cmdWFDef_paramAcc_Click
   menuActionWFDef_param = ""
End Sub
Private Sub cmdWFDef_DocCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFDef_Doc, "gridWFDef_Doc"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_DocPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFDef_Doc, "Документы"
Set jset = Nothing
End Sub

Private Sub cmdWFDef_DocRef_Click()
  On Error Resume Next
  Item.WFDef_Doc.Refresh
  gridWFDef_Doc.ItemCount = Item.WFDef_Doc.Count
  gridWFDef_Doc.Refetch
  gridWFDef_Doc.Refresh
End Sub
Private Sub cmdWFDef_DocAcc_Click()
On Error Resume Next
If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
If gridWFDef_Doc.Row > 0 Then
 If gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_Doc.RowBookmark(gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFDef_DocEdit_Click()
  On Error Resume Next
If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
If gridWFDef_Doc.Row > 0 Then
 If gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_Doc.RowBookmark(gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFDef_Doc_.Item = u
again:     frmWFDef_Doc_.NotFirstTime = False
    frmWFDef_Doc_.Show vbModal
    If frmWFDef_Doc_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFDef_Doc.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFDef_DocDel_Click()
  On Error Resume Next
  gridWFDef_Doc.Delete
End Sub
Private Sub cmdWFDef_DocAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFDef_Doc.Add()

      Set frmWFDef_Doc_.Item = u
again:       frmWFDef_Doc_.NotFirstTime = False
      frmWFDef_Doc_.Show vbModal
      If frmWFDef_Doc_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFDef_Doc.ItemCount = Item.WFDef_Doc.Count
        gridWFDef_Doc.Refresh
        gridWFDef_Doc.RefreshGroups
        gridWFDef_Doc.RefreshSort
        gridWFDef_Doc.MoveToBookmark u.ID & "WFDef_Doc"
      Else
        Item.WFDef_Doc.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFDef_DocFnd_Click()
  On Error Resume Next
  fndWFDef_Doc.ShowForm
End Sub
Private Sub cmdWFDef_DocRun_Click()
  On Error Resume Next
  gridWFDef_Doc_JWDblClick
End Sub
Private Sub gridWFDef_Doc_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFDef_Doc.LoadRow gridWFDef_Doc, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFDef_Doc_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFDef_Doc", Left(Bookmark, 38))
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

Private Sub gridWFDef_Doc_JWDblClick()
  cmdWFDef_DocEdit_Click
End Sub
Private Sub gridWFDef_Doc_JWKeyPress(KeyAscii As Integer)
  If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFDef_Doc.FindOnPress KeyAscii
End Sub

Private Sub gridWFDef_Doc_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFDef_Doc.Row And LastRow > 0 Then
  gridWFDef_Doc.GetRowData(LastRow).RowStyle = "Default"
  gridWFDef_Doc.GetRowData(gridWFDef_Doc.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFDef_DocPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFDef_Doc.Add()
    If GetFromBuffer(u) Then
      gridWFDef_Doc.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFDef_Doc_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFDef_Doc
End If
End Sub
Private Sub mnuWFDef_DocAdd_click()
   menuActionWFDef_Doc = "ADD"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocEdit_click()
   menuActionWFDef_Doc = "EDIT"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocDelete_click()
   menuActionWFDef_Doc = "DEL"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocOpen_click()
   menuActionWFDef_Doc = "RUN"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocRef_click()
   menuActionWFDef_Doc = "REF"
   menuTimerWFDef_Doc.Enabled = True
End Sub
  Private Sub mnuWFDef_DocCOPY_Click()
    On Error Resume Next
    If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
    If gridWFDef_Doc.Row > 0 Then
     If gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_Doc.RowBookmark(gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFDef_DocCUT_Click()
    On Error Resume Next
    If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
    If gridWFDef_Doc.Row > 0 Then
     If gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFDef_Doc.RowBookmark(gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFDef_Doc.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFDef_DocCHANGE_Click()
  On Error Resume Next
  If gridWFDef_Doc.ItemCount = 0 Then Exit Sub
  If gridWFDef_Doc.Row > 0 Then
   If gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFDef_Doc.RowBookmark(gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFDef_Doc.ItemCount = u.Parent.Count
      gridWFDef_Doc.RefreshRowIndex gridWFDef_Doc.RowIndex(gridWFDef_Doc.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFDef_DocCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFDef_DocPrn_click()
   menuActionWFDef_Doc = "PRN"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocCfg_click()
   menuActionWFDef_Doc = "CFG"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocFind_click()
   menuActionWFDef_Doc = "FND"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub mnuWFDef_DocAcc_click()
   menuActionWFDef_Doc = "ACC"
   menuTimerWFDef_Doc.Enabled = True
End Sub
Private Sub menuTimerWFDef_Doc_timer()
   menuTimerWFDef_Doc.Enabled = False
   If menuActionWFDef_Doc = "ADD" Then cmdWFDef_DocAdd_Click
   If menuActionWFDef_Doc = "EDIT" Then cmdWFDef_DocEdit_Click
   If menuActionWFDef_Doc = "DEL" Then cmdWFDef_DocDel_Click
   If menuActionWFDef_Doc = "RUN" Then cmdWFDef_DocRun_Click
   If menuActionWFDef_Doc = "REF" Then cmdWFDef_DocRef_Click
   If menuActionWFDef_Doc = "PRN" Then cmdWFDef_DocPrn_Click
   If menuActionWFDef_Doc = "CFG" Then cmdWFDef_DocCfg_Click
   If menuActionWFDef_Doc = "FND" Then cmdWFDef_DocFnd_Click
   If menuActionWFDef_Doc = "ACC" Then cmdWFDef_DocAcc_Click
   menuActionWFDef_Doc = ""
End Sub
Private Sub ts_click()
  On Error Resume Next
  pnlWFDef_Doc.Visible = False
  pnlWFDef_param.Visible = False
  pnlWFDef_links.Visible = False
  pnlWFDef_INFO.Visible = False

   Select Case ts.SelectedItem.Key
   Case "WFDef_INFO"
     With pnlWFDef_INFO
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      editWFDef_INFO.Top = 40 * Screen.TwipsPerPixelX
      editWFDef_INFO.Left = 5 * Screen.TwipsPerPixelX
      editWFDef_INFO.Width = .Width - 10 * Screen.TwipsPerPixelX
      editWFDef_INFO.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFDef_links"
     With pnlWFDef_links
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     .SizeControls ts.ClientHeight / 2
     End With
   Case "WFDef_param"
     With pnlWFDef_param
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      gridWFDef_param.Top = 40 * Screen.TwipsPerPixelX
      gridWFDef_param.Left = 5 * Screen.TwipsPerPixelX
      gridWFDef_param.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFDef_param.Height = .Height - 45 * Screen.TwipsPerPixelY
      gridWFDef_param.Top = 40 * Screen.TwipsPerPixelX
      gridWFDef_param.Left = 5 * Screen.TwipsPerPixelX
      gridWFDef_param.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFDef_param.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFDef_Doc"
     With pnlWFDef_Doc
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      gridWFDef_Doc.Top = 40 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Left = 5 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Height = .Height - 45 * Screen.TwipsPerPixelY
      gridWFDef_Doc.Top = 40 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Left = 5 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFDef_Doc.Height = .Height - 45 * Screen.TwipsPerPixelY
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

ts.Tabs.Item(1).Caption = "Описание процесса"
ts.Tabs.Item(1).Key = "WFDef_INFO"
  LoadBtnPictures cmdWFDef_INFOSave, cmdWFDef_INFOSave.Tag
  LoadBtnPictures cmdWFDef_INFODel, cmdWFDef_INFODel.Tag
  LoadBtnPictures cmdWFDef_INFOAdd, cmdWFDef_INFOAdd.Tag
  LoadBtnPictures cmdWFDef_INFORef, cmdWFDef_INFORef.Tag
  ff = FreeFile
  On Error Resume Next
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFDef_editWFDef_INFO_" For Input As #ff
  buf = ""
  buf = Input(LOF(ff), ff)
  Close #ff
  If buf <> "" Then editWFDef_INFO.PanelCustomisationString = buf
  cmdWFDef_INFOAdd_Click
Call ts.Tabs.Add(, "WFDef_links", "Переходы")
  LoadBtnPictures cmdWFDef_linksAdd, cmdWFDef_linksAdd.Tag
  LoadBtnPictures cmdWFDef_linksEdit, cmdWFDef_linksEdit.Tag
  LoadBtnPictures cmdWFDef_linksDel, cmdWFDef_linksDel.Tag
  LoadBtnPictures cmdWFDef_linksRef, cmdWFDef_linksRef.Tag
  LoadBtnPictures cmdWFDef_linksCfg, cmdWFDef_linksCfg.Tag
  LoadBtnPictures cmdWFDef_linksPrn, cmdWFDef_linksPrn.Tag
  LoadBtnPictures cmdWFDef_linksFnd, cmdWFDef_linksFnd.Tag
  LoadBtnPictures cmdWFDef_linksRun, cmdWFDef_linksRun.Tag
  LoadBtnPictures cmdWFDef_linksAcc, cmdWFDef_linksAcc.Tag
  Item.WFDef_links.PrepareGrid gridWFDef_links
  LoadGridLayout gridWFDef_links
  Set fndWFDef_links = Nothing
  On Error Resume Next
  Set fndWFDef_links = CreateObject("MTZ_JSetup.GridFinder")
  fndWFDef_links.Init gridWFDef_links
  LoadBtnPictures cmdWFDef_linkresAdd, cmdWFDef_linkresAdd.Tag
  LoadBtnPictures cmdWFDef_linkresEdit, cmdWFDef_linkresEdit.Tag
  LoadBtnPictures cmdWFDef_linkresDel, cmdWFDef_linkresDel.Tag
  LoadBtnPictures cmdWFDef_linkresRef, cmdWFDef_linkresRef.Tag
  LoadBtnPictures cmdWFDef_linkresPrn, cmdWFDef_linkresPrn.Tag
  LoadBtnPictures cmdWFDef_linkresCfg, cmdWFDef_linkresCfg.Tag
  LoadBtnPictures cmdWFDef_linkresFnd, cmdWFDef_linkresFnd.Tag
  LoadBtnPictures cmdWFDef_linkresRun, cmdWFDef_linkresRun.Tag
  LoadBtnPictures cmdWFDef_linkresAcc, cmdWFDef_linkresAcc.Tag
  gridWFDef_linkres.Columns.Clear
  gridWFDef_linkres.ItemCount = 0
Call ts.Tabs.Add(, "WFDef_param", "Параметры и переменные")
  LoadBtnPictures cmdWFDef_paramAdd, cmdWFDef_paramAdd.Tag
  LoadBtnPictures cmdWFDef_paramEdit, cmdWFDef_paramEdit.Tag
  LoadBtnPictures cmdWFDef_paramDel, cmdWFDef_paramDel.Tag
  LoadBtnPictures cmdWFDef_paramRef, cmdWFDef_paramRef.Tag
  LoadBtnPictures cmdWFDef_paramCfg, cmdWFDef_paramCfg.Tag
  LoadBtnPictures cmdWFDef_paramPrn, cmdWFDef_paramPrn.Tag
  LoadBtnPictures cmdWFDef_paramFnd, cmdWFDef_paramFnd.Tag
  LoadBtnPictures cmdWFDef_paramRun, cmdWFDef_paramRun.Tag
  LoadBtnPictures cmdWFDef_paramAcc, cmdWFDef_paramAcc.Tag
  Item.WFDef_param.PrepareGrid gridWFDef_param
  LoadGridLayout gridWFDef_param
  Set fndWFDef_param = Nothing
  On Error Resume Next
  Set fndWFDef_param = CreateObject("MTZ_JSetup.GridFinder")
  fndWFDef_param.Init gridWFDef_param
Call ts.Tabs.Add(, "WFDef_Doc", "Документы")
  LoadBtnPictures cmdWFDef_DocAdd, cmdWFDef_DocAdd.Tag
  LoadBtnPictures cmdWFDef_DocEdit, cmdWFDef_DocEdit.Tag
  LoadBtnPictures cmdWFDef_DocDel, cmdWFDef_DocDel.Tag
  LoadBtnPictures cmdWFDef_DocRef, cmdWFDef_DocRef.Tag
  LoadBtnPictures cmdWFDef_DocCfg, cmdWFDef_DocCfg.Tag
  LoadBtnPictures cmdWFDef_DocPrn, cmdWFDef_DocPrn.Tag
  LoadBtnPictures cmdWFDef_DocFnd, cmdWFDef_DocFnd.Tag
  LoadBtnPictures cmdWFDef_DocRun, cmdWFDef_DocRun.Tag
  LoadBtnPictures cmdWFDef_DocAcc, cmdWFDef_DocAcc.Tag
  Item.WFDef_Doc.PrepareGrid gridWFDef_Doc
  LoadGridLayout gridWFDef_Doc
  Set fndWFDef_Doc = Nothing
  On Error Resume Next
  Set fndWFDef_Doc = CreateObject("MTZ_JSetup.GridFinder")
  fndWFDef_Doc.Init gridWFDef_Doc
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

If Name = "WFDef_INFO" Then
 Set FormByName = New frmWFDef_INFO_
 Exit Function
End If

If Name = "WFDef_links" Then
 Set FormByName = New frmWFDef_links_
 Exit Function
End If

If Name = "WFDef_linkres" Then
 Set FormByName = New frmWFDef_linkres_
 Exit Function
End If

If Name = "WFDef_param" Then
 Set FormByName = New frmWFDef_param_
 Exit Function
End If

If Name = "WFDef_Doc" Then
 Set FormByName = New frmWFDef_Doc_
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
buf = buf & vbCrLf & "pnlWFDef_links:" & pnlWFDef_links.SpliterPosition
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



