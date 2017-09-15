VERSION 5.00
Object = "{8408294B-9E97-428D-999B-82C43BF0BFFA}#2.4#0"; "JWRAP.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.5#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmWFFD__main 
   Caption         =   "Описание функции процесса"
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
   Begin VB.Frame pnlWFFD_ATTR1 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   1500
      TabIndex        =   51
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFFD_ATTR1Ref 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   56
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ATTR1Add 
         Enabled         =   0   'False
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   55
         Tag             =   "New.ico"
         ToolTipText     =   "Создать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ATTR1Del 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   54
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ATTR1Save 
         Enabled         =   0   'False
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   53
         Tag             =   "SAVE.ico"
         ToolTipText     =   "Сохранить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin WFFDGUI.WFFD_ATTR1 editWFFD_ATTR1 
         Height          =   480
         Left            =   150
         TabIndex        =   52
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
   End
   Begin VB.Timer menuTimerWFFD_CustomParam 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFFD_CustomParam 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   0
      TabIndex        =   40
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFFD_CustomParamAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   50
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_CustomParamFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   48
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_CustomParamCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   47
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_CustomParamPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   46
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_CustomParamRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   45
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_CustomParamDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   44
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_CustomParamEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   43
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_CustomParamAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   42
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFFD_CustomParam 
         Height          =   480
         Left            =   150
         TabIndex        =   41
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin MTZ_PANEL.DropButton cmdWFFD_CustomParamRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   49
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Timer menuTimerWFFD_Results 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFFD_Results 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   6000
      TabIndex        =   29
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFFD_ResultsAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   39
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ResultsFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   37
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ResultsCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   36
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ResultsPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   35
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ResultsRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   34
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ResultsDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   33
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ResultsEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   32
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ResultsAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   31
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFFD_Results 
         Height          =   480
         Left            =   150
         TabIndex        =   30
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin MTZ_PANEL.DropButton cmdWFFD_ResultsRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   38
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Timer menuTimerWFFD_Doer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFFD_Doer 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   4500
      TabIndex        =   18
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFFD_DoerAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   28
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DoerFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   26
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DoerCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   25
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DoerPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   24
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DoerRef 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   23
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DoerDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   22
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DoerEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   21
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_DoerAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   20
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFFD_Doer 
         Height          =   480
         Left            =   150
         TabIndex        =   19
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin MTZ_PANEL.DropButton cmdWFFD_DoerRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   27
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Timer menuTimerWFFD_ShortCut 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1740
      Top             =   1350
   End
   Begin VB.Frame pnlWFFD_ShortCut 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   3000
      TabIndex        =   7
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFFD_ShortCutAcc 
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
      Begin VB.CommandButton cmdWFFD_ShortCutFnd 
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
      Begin VB.CommandButton cmdWFFD_ShortCutCfg 
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
      Begin VB.CommandButton cmdWFFD_ShortCutPrn 
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
      Begin VB.CommandButton cmdWFFD_ShortCutRef 
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
      Begin VB.CommandButton cmdWFFD_ShortCutDel 
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
      Begin VB.CommandButton cmdWFFD_ShortCutEdit 
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
      Begin VB.CommandButton cmdWFFD_ShortCutAdd 
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
      Begin JWRAP.JanusWRAP gridWFFD_ShortCut 
         Height          =   480
         Left            =   150
         TabIndex        =   8
         Top             =   510
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
      Begin MTZ_PANEL.DropButton cmdWFFD_ShortCutRun 
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
   Begin VB.Frame pnlWFFD_common 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      Begin VB.CommandButton cmdWFFD_commonRef 
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
      Begin VB.CommandButton cmdWFFD_commonAdd 
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
      Begin VB.CommandButton cmdWFFD_commonDel 
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
      Begin VB.CommandButton cmdWFFD_commonSave 
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
      Begin WFFDGUI.WFFD_common editWFFD_common 
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
   Begin VB.Menu mnuPopupWFFD_ShortCut 
      Caption         =   "Меню для Ярлыки"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFD_ShortCutAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFFD_ShortCutEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFFD_ShortCutDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFFD_ShortCutOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFFD_ShortCutRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFFD_ShortCutS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFD_ShortCutBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFFD_ShortCutCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFFD_ShortCutCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFFD_ShortCutPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFFD_ShortCutCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFFD_ShortCutCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFFD_ShortCutPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFFD_ShortCutCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFFD_ShortCutFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFFD_ShortCutAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWFFD_Doer 
      Caption         =   "Меню для Исполнители"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFD_DoerAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFFD_DoerEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFFD_DoerDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFFD_DoerOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFFD_DoerRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFFD_DoerS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFD_DoerBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFFD_DoerCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFFD_DoerCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFFD_DoerPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFFD_DoerCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFFD_DoerCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFFD_DoerPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFFD_DoerCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFFD_DoerFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFFD_DoerAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWFFD_Results 
      Caption         =   "Меню для Возможные результаты"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFD_ResultsAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFFD_ResultsEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFFD_ResultsDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFFD_ResultsOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFFD_ResultsRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFFD_ResultsS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFD_ResultsBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFFD_ResultsCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFFD_ResultsCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFFD_ResultsPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFFD_ResultsCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFFD_ResultsCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFFD_ResultsPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFFD_ResultsCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFFD_ResultsFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFFD_ResultsAcc 
         Caption         =   "Стиль защиты"
      End
   End
   Begin VB.Menu mnuPopupWFFD_CustomParam 
      Caption         =   "Меню для Дополнительные параметры"
      Visible         =   0   'False
      Begin VB.Menu mnuWFFD_CustomParamAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuWFFD_CustomParamEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFFD_CustomParamDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuWFFD_CustomParamOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFFD_CustomParamRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFFD_CustomParamS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFFD_CustomParamBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuWFFD_CustomParamCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuWFFD_CustomParamCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuWFFD_CustomParamPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuWFFD_CustomParamCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuWFFD_CustomParamCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuWFFD_CustomParamPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFFD_CustomParamCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFFD_CustomParamFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFFD_CustomParamAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "frmWFFD__main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Item As Object
Public Host As GUI
Public ModalMode As Boolean
Private fndWFFD_ShortCut As Object
Private menuActionWFFD_ShortCut As String
Private fndWFFD_Doer As Object
Private menuActionWFFD_Doer As String
Private fndWFFD_Results As Object
Private menuActionWFFD_Results As String
Private fndWFFD_CustomParam As Object
Private menuActionWFFD_CustomParam As String


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
Private Sub opWFFD_common_UpdateName_(RowItem As Object)
With RowItem
Run_WFFuncName RowItem:=RowItem
End With
End Sub
Private Sub cmdWFFD_commonRef_Click()
  On Error Resume Next
  Item.WFFD_common.Refresh
  cmdWFFD_commonAdd_Click
End Sub
Private Sub cmdWFFD_commonAdd_Click()
  On Error Resume Next
 Dim u As Object
 If Item.WFFD_common.Count = 0 Then
   Set u = Item.WFFD_common.Add

 End If
 Set editWFFD_common.Item = Item.WFFD_common.Item(1)
 editWFFD_common.InitPanel
 cmdWFFD_commonDel.Enabled = True
 cmdWFFD_commonSave.Enabled = False
 cmdWFFD_commonAdd.Enabled = False
End Sub
Private Sub cmdWFFD_commonDel_Click()
  On Error Resume Next
  If editWFFD_common.Item Is Nothing Then Exit Sub
  If MsgBox("Удалить элемент" & vbCrLf & editWFFD_common.Item.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
    On Error GoTo bye
    editWFFD_common.Item.Parent.Delete editWFFD_common.Item.ID
    cmdWFFD_commonDel.Enabled = False
    cmdWFFD_commonSave.Enabled = False
    editWFFD_common.Enabled = False
    Set editWFFD_common.Item = Nothing
    cmdWFFD_commonAdd.Enabled = True
  End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub editWFFD_common_Changed()
 cmdWFFD_commonSave.Enabled = True
End Sub
Private Sub cmdWFFD_commonSave_Click()
  On Error Resume Next
    If editWFFD_common.IsOK Then
    editWFFD_common.Save
  On Error GoTo bye
    editWFFD_common.Item.Save
        opWFFD_common_UpdateName_ editWFFD_common.Item
    cmdWFFD_commonSave.Enabled = False
    Else
      MsgBox "Не все обязатеьлные поля заполнены", vbOKOnly + vbExclamation
    End If
  On Error Resume Next
  Dim ff As Long
  ff = FreeFile
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFFD_editWFFD_common_" For Output As #ff
  Print #ff, editWFFD_common.PanelCustomisationString
  Close #ff
Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
  editWFFD_common.Item.Refresh
  editWFFD_common.InitPanel
End Sub
Private Sub cmdWFFD_ShortCutCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFFD_ShortCut, "gridWFFD_ShortCut"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_ShortCutPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFFD_ShortCut, "Ярлыки"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_ShortCutRef_Click()
  On Error Resume Next
  Item.WFFD_ShortCut.Refresh
  gridWFFD_ShortCut.ItemCount = Item.WFFD_ShortCut.Count
  gridWFFD_ShortCut.Refetch
  gridWFFD_ShortCut.Refresh
End Sub
Private Sub cmdWFFD_ShortCutAcc_Click()
On Error Resume Next
If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
If gridWFFD_ShortCut.Row > 0 Then
 If gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_ShortCut.RowBookmark(gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFFD_ShortCutEdit_Click()
  On Error Resume Next
If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
If gridWFFD_ShortCut.Row > 0 Then
 If gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_ShortCut.RowBookmark(gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFFD_ShortCut_.Item = u
again:     frmWFFD_ShortCut_.NotFirstTime = False
    frmWFFD_ShortCut_.Show vbModal
    If frmWFFD_ShortCut_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFFD_ShortCut.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFFD_ShortCutDel_Click()
  On Error Resume Next
  gridWFFD_ShortCut.Delete
End Sub
Private Sub cmdWFFD_ShortCutAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFFD_ShortCut.Add()

      Set frmWFFD_ShortCut_.Item = u
again:       frmWFFD_ShortCut_.NotFirstTime = False
      frmWFFD_ShortCut_.Show vbModal
      If frmWFFD_ShortCut_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFFD_ShortCut.ItemCount = Item.WFFD_ShortCut.Count
        gridWFFD_ShortCut.Refresh
        gridWFFD_ShortCut.RefreshGroups
        gridWFFD_ShortCut.RefreshSort
        gridWFFD_ShortCut.MoveToBookmark u.ID & "WFFD_ShortCut"
      Else
        Item.WFFD_ShortCut.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFFD_ShortCutFnd_Click()
  On Error Resume Next
  fndWFFD_ShortCut.ShowForm
End Sub
Private Sub cmdWFFD_ShortCutRun_Click()
  On Error Resume Next
  gridWFFD_ShortCut_JWDblClick
End Sub
Private Sub gridWFFD_ShortCut_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFFD_ShortCut.LoadRow gridWFFD_ShortCut, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFFD_ShortCut_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFFD_ShortCut", Left(Bookmark, 38))
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

Private Sub gridWFFD_ShortCut_JWDblClick()
  cmdWFFD_ShortCutEdit_Click
End Sub
Private Sub gridWFFD_ShortCut_JWKeyPress(KeyAscii As Integer)
  If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFFD_ShortCut.FindOnPress KeyAscii
End Sub

Private Sub gridWFFD_ShortCut_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFFD_ShortCut.Row And LastRow > 0 Then
  gridWFFD_ShortCut.GetRowData(LastRow).RowStyle = "Default"
  gridWFFD_ShortCut.GetRowData(gridWFFD_ShortCut.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFFD_ShortCutPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFFD_ShortCut.Add()
    If GetFromBuffer(u) Then
      gridWFFD_ShortCut.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFFD_ShortCut_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFFD_ShortCut
End If
End Sub
Private Sub mnuWFFD_ShortCutAdd_click()
   menuActionWFFD_ShortCut = "ADD"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutEdit_click()
   menuActionWFFD_ShortCut = "EDIT"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutDelete_click()
   menuActionWFFD_ShortCut = "DEL"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutOpen_click()
   menuActionWFFD_ShortCut = "RUN"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutRef_click()
   menuActionWFFD_ShortCut = "REF"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
  Private Sub mnuWFFD_ShortCutCOPY_Click()
    On Error Resume Next
    If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
    If gridWFFD_ShortCut.Row > 0 Then
     If gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_ShortCut.RowBookmark(gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFFD_ShortCutCUT_Click()
    On Error Resume Next
    If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
    If gridWFFD_ShortCut.Row > 0 Then
     If gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_ShortCut.RowBookmark(gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFFD_ShortCut.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFFD_ShortCutCHANGE_Click()
  On Error Resume Next
  If gridWFFD_ShortCut.ItemCount = 0 Then Exit Sub
  If gridWFFD_ShortCut.Row > 0 Then
   If gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_ShortCut.RowBookmark(gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFFD_ShortCut.ItemCount = u.Parent.Count
      gridWFFD_ShortCut.RefreshRowIndex gridWFFD_ShortCut.RowIndex(gridWFFD_ShortCut.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFFD_ShortCutCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFD_ShortCutPrn_click()
   menuActionWFFD_ShortCut = "PRN"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutCfg_click()
   menuActionWFFD_ShortCut = "CFG"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutFind_click()
   menuActionWFFD_ShortCut = "FND"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub mnuWFFD_ShortCutAcc_click()
   menuActionWFFD_ShortCut = "ACC"
   menuTimerWFFD_ShortCut.Enabled = True
End Sub
Private Sub menuTimerWFFD_ShortCut_timer()
   menuTimerWFFD_ShortCut.Enabled = False
   If menuActionWFFD_ShortCut = "ADD" Then cmdWFFD_ShortCutAdd_Click
   If menuActionWFFD_ShortCut = "EDIT" Then cmdWFFD_ShortCutEdit_Click
   If menuActionWFFD_ShortCut = "DEL" Then cmdWFFD_ShortCutDel_Click
   If menuActionWFFD_ShortCut = "RUN" Then cmdWFFD_ShortCutRun_Click
   If menuActionWFFD_ShortCut = "REF" Then cmdWFFD_ShortCutRef_Click
   If menuActionWFFD_ShortCut = "PRN" Then cmdWFFD_ShortCutPrn_Click
   If menuActionWFFD_ShortCut = "CFG" Then cmdWFFD_ShortCutCfg_Click
   If menuActionWFFD_ShortCut = "FND" Then cmdWFFD_ShortCutFnd_Click
   If menuActionWFFD_ShortCut = "ACC" Then cmdWFFD_ShortCutAcc_Click
   menuActionWFFD_ShortCut = ""
End Sub
Private Sub cmdWFFD_DoerCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFFD_Doer, "gridWFFD_Doer"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_DoerPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFFD_Doer, "Исполнители"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_DoerRef_Click()
  On Error Resume Next
  Item.WFFD_Doer.Refresh
  gridWFFD_Doer.ItemCount = Item.WFFD_Doer.Count
  gridWFFD_Doer.Refetch
  gridWFFD_Doer.Refresh
End Sub
Private Sub cmdWFFD_DoerAcc_Click()
On Error Resume Next
If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
If gridWFFD_Doer.Row > 0 Then
 If gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Doer.RowBookmark(gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFFD_DoerEdit_Click()
  On Error Resume Next
If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
If gridWFFD_Doer.Row > 0 Then
 If gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Doer.RowBookmark(gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFFD_Doer_.Item = u
again:     frmWFFD_Doer_.NotFirstTime = False
    frmWFFD_Doer_.Show vbModal
    If frmWFFD_Doer_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFFD_Doer.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFFD_DoerDel_Click()
  On Error Resume Next
  gridWFFD_Doer.Delete
End Sub
Private Sub cmdWFFD_DoerAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFFD_Doer.Add()

      Set frmWFFD_Doer_.Item = u
again:       frmWFFD_Doer_.NotFirstTime = False
      frmWFFD_Doer_.Show vbModal
      If frmWFFD_Doer_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFFD_Doer.ItemCount = Item.WFFD_Doer.Count
        gridWFFD_Doer.Refresh
        gridWFFD_Doer.RefreshGroups
        gridWFFD_Doer.RefreshSort
        gridWFFD_Doer.MoveToBookmark u.ID & "WFFD_Doer"
      Else
        Item.WFFD_Doer.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFFD_DoerFnd_Click()
  On Error Resume Next
  fndWFFD_Doer.ShowForm
End Sub
Private Sub cmdWFFD_DoerRun_Click()
  On Error Resume Next
  gridWFFD_Doer_JWDblClick
End Sub
Private Sub gridWFFD_Doer_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFFD_Doer.LoadRow gridWFFD_Doer, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFFD_Doer_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFFD_Doer", Left(Bookmark, 38))
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

Private Sub gridWFFD_Doer_JWDblClick()
  cmdWFFD_DoerEdit_Click
End Sub
Private Sub gridWFFD_Doer_JWKeyPress(KeyAscii As Integer)
  If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFFD_Doer.FindOnPress KeyAscii
End Sub

Private Sub gridWFFD_Doer_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFFD_Doer.Row And LastRow > 0 Then
  gridWFFD_Doer.GetRowData(LastRow).RowStyle = "Default"
  gridWFFD_Doer.GetRowData(gridWFFD_Doer.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFFD_DoerPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFFD_Doer.Add()
    If GetFromBuffer(u) Then
      gridWFFD_Doer.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFFD_Doer_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFFD_Doer
End If
End Sub
Private Sub mnuWFFD_DoerAdd_click()
   menuActionWFFD_Doer = "ADD"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerEdit_click()
   menuActionWFFD_Doer = "EDIT"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerDelete_click()
   menuActionWFFD_Doer = "DEL"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerOpen_click()
   menuActionWFFD_Doer = "RUN"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerRef_click()
   menuActionWFFD_Doer = "REF"
   menuTimerWFFD_Doer.Enabled = True
End Sub
  Private Sub mnuWFFD_DoerCOPY_Click()
    On Error Resume Next
    If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
    If gridWFFD_Doer.Row > 0 Then
     If gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_Doer.RowBookmark(gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFFD_DoerCUT_Click()
    On Error Resume Next
    If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
    If gridWFFD_Doer.Row > 0 Then
     If gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_Doer.RowBookmark(gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFFD_Doer.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFFD_DoerCHANGE_Click()
  On Error Resume Next
  If gridWFFD_Doer.ItemCount = 0 Then Exit Sub
  If gridWFFD_Doer.Row > 0 Then
   If gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Doer.RowBookmark(gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFFD_Doer.ItemCount = u.Parent.Count
      gridWFFD_Doer.RefreshRowIndex gridWFFD_Doer.RowIndex(gridWFFD_Doer.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFFD_DoerCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFD_DoerPrn_click()
   menuActionWFFD_Doer = "PRN"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerCfg_click()
   menuActionWFFD_Doer = "CFG"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerFind_click()
   menuActionWFFD_Doer = "FND"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub mnuWFFD_DoerAcc_click()
   menuActionWFFD_Doer = "ACC"
   menuTimerWFFD_Doer.Enabled = True
End Sub
Private Sub menuTimerWFFD_Doer_timer()
   menuTimerWFFD_Doer.Enabled = False
   If menuActionWFFD_Doer = "ADD" Then cmdWFFD_DoerAdd_Click
   If menuActionWFFD_Doer = "EDIT" Then cmdWFFD_DoerEdit_Click
   If menuActionWFFD_Doer = "DEL" Then cmdWFFD_DoerDel_Click
   If menuActionWFFD_Doer = "RUN" Then cmdWFFD_DoerRun_Click
   If menuActionWFFD_Doer = "REF" Then cmdWFFD_DoerRef_Click
   If menuActionWFFD_Doer = "PRN" Then cmdWFFD_DoerPrn_Click
   If menuActionWFFD_Doer = "CFG" Then cmdWFFD_DoerCfg_Click
   If menuActionWFFD_Doer = "FND" Then cmdWFFD_DoerFnd_Click
   If menuActionWFFD_Doer = "ACC" Then cmdWFFD_DoerAcc_Click
   menuActionWFFD_Doer = ""
End Sub
Private Sub cmdWFFD_ResultsCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFFD_Results, "gridWFFD_Results"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_ResultsPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFFD_Results, "Возможные результаты"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_ResultsRef_Click()
  On Error Resume Next
  Item.WFFD_Results.Refresh
  gridWFFD_Results.ItemCount = Item.WFFD_Results.Count
  gridWFFD_Results.Refetch
  gridWFFD_Results.Refresh
End Sub
Private Sub cmdWFFD_ResultsAcc_Click()
On Error Resume Next
If gridWFFD_Results.ItemCount = 0 Then Exit Sub
If gridWFFD_Results.Row > 0 Then
 If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFFD_ResultsEdit_Click()
  On Error Resume Next
If gridWFFD_Results.ItemCount = 0 Then Exit Sub
If gridWFFD_Results.Row > 0 Then
 If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFFD_Results_.Item = u
again:     frmWFFD_Results_.NotFirstTime = False
    frmWFFD_Results_.Show vbModal
    If frmWFFD_Results_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFFD_Results.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFFD_ResultsDel_Click()
  On Error Resume Next
  gridWFFD_Results.Delete
End Sub
Private Sub cmdWFFD_ResultsAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFFD_Results.Add()

      Set frmWFFD_Results_.Item = u
again:       frmWFFD_Results_.NotFirstTime = False
      frmWFFD_Results_.Show vbModal
      If frmWFFD_Results_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFFD_Results.ItemCount = Item.WFFD_Results.Count
        gridWFFD_Results.Refresh
        gridWFFD_Results.RefreshGroups
        gridWFFD_Results.RefreshSort
        gridWFFD_Results.MoveToBookmark u.ID & "WFFD_Results"
      Else
        Item.WFFD_Results.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFFD_ResultsFnd_Click()
  On Error Resume Next
  fndWFFD_Results.ShowForm
End Sub
Private Sub cmdWFFD_ResultsRun_Click()
  On Error Resume Next
  gridWFFD_Results_JWDblClick
End Sub
Private Sub gridWFFD_Results_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFFD_Results.LoadRow gridWFFD_Results, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFFD_Results_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFFD_Results.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFFD_Results", Left(Bookmark, 38))
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

Private Sub gridWFFD_Results_JWDblClick()
  cmdWFFD_ResultsEdit_Click
End Sub
Private Sub gridWFFD_Results_JWKeyPress(KeyAscii As Integer)
  If gridWFFD_Results.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFFD_Results.FindOnPress KeyAscii
End Sub

Private Sub gridWFFD_Results_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFFD_Results.Row And LastRow > 0 Then
  gridWFFD_Results.GetRowData(LastRow).RowStyle = "Default"
  gridWFFD_Results.GetRowData(gridWFFD_Results.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFFD_ResultsPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFFD_Results.Add()
    If GetFromBuffer(u) Then
      gridWFFD_Results.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFFD_Results_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFFD_Results
End If
End Sub
Private Sub mnuWFFD_ResultsAdd_click()
   menuActionWFFD_Results = "ADD"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsEdit_click()
   menuActionWFFD_Results = "EDIT"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsDelete_click()
   menuActionWFFD_Results = "DEL"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsOpen_click()
   menuActionWFFD_Results = "RUN"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsRef_click()
   menuActionWFFD_Results = "REF"
   menuTimerWFFD_Results.Enabled = True
End Sub
  Private Sub mnuWFFD_ResultsCOPY_Click()
    On Error Resume Next
    If gridWFFD_Results.ItemCount = 0 Then Exit Sub
    If gridWFFD_Results.Row > 0 Then
     If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFFD_ResultsCUT_Click()
    On Error Resume Next
    If gridWFFD_Results.ItemCount = 0 Then Exit Sub
    If gridWFFD_Results.Row > 0 Then
     If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFFD_Results.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFFD_ResultsCHANGE_Click()
  On Error Resume Next
  If gridWFFD_Results.ItemCount = 0 Then Exit Sub
  If gridWFFD_Results.Row > 0 Then
   If gridWFFD_Results.RowIndex(gridWFFD_Results.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_Results.RowBookmark(gridWFFD_Results.RowIndex(gridWFFD_Results.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFFD_Results.ItemCount = u.Parent.Count
      gridWFFD_Results.RefreshRowIndex gridWFFD_Results.RowIndex(gridWFFD_Results.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFFD_ResultsCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFD_ResultsPrn_click()
   menuActionWFFD_Results = "PRN"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsCfg_click()
   menuActionWFFD_Results = "CFG"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsFind_click()
   menuActionWFFD_Results = "FND"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub mnuWFFD_ResultsAcc_click()
   menuActionWFFD_Results = "ACC"
   menuTimerWFFD_Results.Enabled = True
End Sub
Private Sub menuTimerWFFD_Results_timer()
   menuTimerWFFD_Results.Enabled = False
   If menuActionWFFD_Results = "ADD" Then cmdWFFD_ResultsAdd_Click
   If menuActionWFFD_Results = "EDIT" Then cmdWFFD_ResultsEdit_Click
   If menuActionWFFD_Results = "DEL" Then cmdWFFD_ResultsDel_Click
   If menuActionWFFD_Results = "RUN" Then cmdWFFD_ResultsRun_Click
   If menuActionWFFD_Results = "REF" Then cmdWFFD_ResultsRef_Click
   If menuActionWFFD_Results = "PRN" Then cmdWFFD_ResultsPrn_Click
   If menuActionWFFD_Results = "CFG" Then cmdWFFD_ResultsCfg_Click
   If menuActionWFFD_Results = "FND" Then cmdWFFD_ResultsFnd_Click
   If menuActionWFFD_Results = "ACC" Then cmdWFFD_ResultsAcc_Click
   menuActionWFFD_Results = ""
End Sub
Private Sub cmdWFFD_CustomParamCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFFD_CustomParam, "gridWFFD_CustomParam"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_CustomParamPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFFD_CustomParam, "Дополнительные параметры"
Set jset = Nothing
End Sub

Private Sub cmdWFFD_CustomParamRef_Click()
  On Error Resume Next
  Item.WFFD_CustomParam.Refresh
  gridWFFD_CustomParam.ItemCount = Item.WFFD_CustomParam.Count
  gridWFFD_CustomParam.Refetch
  gridWFFD_CustomParam.Refresh
End Sub
Private Sub cmdWFFD_CustomParamAcc_Click()
On Error Resume Next
If gridWFFD_CustomParam.ItemCount = 0 Then Exit Sub
If gridWFFD_CustomParam.Row > 0 Then
 If gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_CustomParam.RowBookmark(gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFFD_CustomParamEdit_Click()
  On Error Resume Next
If gridWFFD_CustomParam.ItemCount = 0 Then Exit Sub
If gridWFFD_CustomParam.Row > 0 Then
 If gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_CustomParam.RowBookmark(gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmWFFD_CustomParam_.Item = u
again:     frmWFFD_CustomParam_.NotFirstTime = False
    frmWFFD_CustomParam_.Show vbModal
    If frmWFFD_CustomParam_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFFD_CustomParam.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFFD_CustomParamDel_Click()
  On Error Resume Next
  gridWFFD_CustomParam.Delete
End Sub
Private Sub cmdWFFD_CustomParamAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.WFFD_CustomParam.Add()

      Set frmWFFD_CustomParam_.Item = u
again:       frmWFFD_CustomParam_.NotFirstTime = False
      frmWFFD_CustomParam_.Show vbModal
      If frmWFFD_CustomParam_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFFD_CustomParam.ItemCount = Item.WFFD_CustomParam.Count
        gridWFFD_CustomParam.Refresh
        gridWFFD_CustomParam.RefreshGroups
        gridWFFD_CustomParam.RefreshSort
        gridWFFD_CustomParam.MoveToBookmark u.ID & "WFFD_CustomParam"
      Else
        Item.WFFD_CustomParam.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFFD_CustomParamFnd_Click()
  On Error Resume Next
  fndWFFD_CustomParam.ShowForm
End Sub
Private Sub cmdWFFD_CustomParamRun_Click()
  On Error Resume Next
  gridWFFD_CustomParam_JWDblClick
End Sub
Private Sub gridWFFD_CustomParam_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
Item.WFFD_CustomParam.LoadRow gridWFFD_CustomParam, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFFD_CustomParam_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
  If gridWFFD_CustomParam.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("WFFD_CustomParam", Left(Bookmark, 38))
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

Private Sub gridWFFD_CustomParam_JWDblClick()
  cmdWFFD_CustomParamEdit_Click
End Sub
Private Sub gridWFFD_CustomParam_JWKeyPress(KeyAscii As Integer)
  If gridWFFD_CustomParam.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFFD_CustomParam.FindOnPress KeyAscii
End Sub

Private Sub gridWFFD_CustomParam_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFFD_CustomParam.Row And LastRow > 0 Then
  gridWFFD_CustomParam.GetRowData(LastRow).RowStyle = "Default"
  gridWFFD_CustomParam.GetRowData(gridWFFD_CustomParam.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFFD_CustomParamPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.WFFD_CustomParam.Add()
    If GetFromBuffer(u) Then
      gridWFFD_CustomParam.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFFD_CustomParam_JWMouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFFD_CustomParam
End If
End Sub
Private Sub mnuWFFD_CustomParamAdd_click()
   menuActionWFFD_CustomParam = "ADD"
   menuTimerWFFD_CustomParam.Enabled = True
End Sub
Private Sub mnuWFFD_CustomParamEdit_click()
   menuActionWFFD_CustomParam = "EDIT"
   menuTimerWFFD_CustomParam.Enabled = True
End Sub
Private Sub mnuWFFD_CustomParamDelete_click()
   menuActionWFFD_CustomParam = "DEL"
   menuTimerWFFD_CustomParam.Enabled = True
End Sub
Private Sub mnuWFFD_CustomParamOpen_click()
   menuActionWFFD_CustomParam = "RUN"
   menuTimerWFFD_CustomParam.Enabled = True
End Sub
Private Sub mnuWFFD_CustomParamRef_click()
   menuActionWFFD_CustomParam = "REF"
   menuTimerWFFD_CustomParam.Enabled = True
End Sub
  Private Sub mnuWFFD_CustomParamCOPY_Click()
    On Error Resume Next
    If gridWFFD_CustomParam.ItemCount = 0 Then Exit Sub
    If gridWFFD_CustomParam.Row > 0 Then
     If gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_CustomParam.RowBookmark(gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFFD_CustomParamCUT_Click()
    On Error Resume Next
    If gridWFFD_CustomParam.ItemCount = 0 Then Exit Sub
    If gridWFFD_CustomParam.Row > 0 Then
     If gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridWFFD_CustomParam.RowBookmark(gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridWFFD_CustomParam.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuWFFD_CustomParamCHANGE_Click()
  On Error Resume Next
  If gridWFFD_CustomParam.ItemCount = 0 Then Exit Sub
  If gridWFFD_CustomParam.Row > 0 Then
   If gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridWFFD_CustomParam.RowBookmark(gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridWFFD_CustomParam.ItemCount = u.Parent.Count
      gridWFFD_CustomParam.RefreshRowIndex gridWFFD_CustomParam.RowIndex(gridWFFD_CustomParam.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFFD_CustomParamCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFFD_CustomParamPrn_click()
   menuActionWFFD_CustomParam = "PRN"
   menuTimerWFFD_CustomParam.Enabled = True
End Sub
Private Sub mnuWFFD_CustomParamCfg_click()
   menuActionWFFD_CustomParam = "CFG"
   menuTimerWFFD_CustomParam.Enabled = True
End Sub
Private Sub mnuWFFD_CustomParamFind_click()
   menuActionWFFD_CustomParam = "FND"
   menuTimerWFFD_CustomParam.Enabled = True
End Sub
Private Sub mnuWFFD_CustomParamAcc_click()
   menuActionWFFD_CustomParam = "ACC"
   menuTimerWFFD_CustomParam.Enabled = True
End Sub
Private Sub menuTimerWFFD_CustomParam_timer()
   menuTimerWFFD_CustomParam.Enabled = False
   If menuActionWFFD_CustomParam = "ADD" Then cmdWFFD_CustomParamAdd_Click
   If menuActionWFFD_CustomParam = "EDIT" Then cmdWFFD_CustomParamEdit_Click
   If menuActionWFFD_CustomParam = "DEL" Then cmdWFFD_CustomParamDel_Click
   If menuActionWFFD_CustomParam = "RUN" Then cmdWFFD_CustomParamRun_Click
   If menuActionWFFD_CustomParam = "REF" Then cmdWFFD_CustomParamRef_Click
   If menuActionWFFD_CustomParam = "PRN" Then cmdWFFD_CustomParamPrn_Click
   If menuActionWFFD_CustomParam = "CFG" Then cmdWFFD_CustomParamCfg_Click
   If menuActionWFFD_CustomParam = "FND" Then cmdWFFD_CustomParamFnd_Click
   If menuActionWFFD_CustomParam = "ACC" Then cmdWFFD_CustomParamAcc_Click
   menuActionWFFD_CustomParam = ""
End Sub
Private Sub cmdWFFD_ATTR1Ref_Click()
  On Error Resume Next
  Item.WFFD_ATTR1.Refresh
  cmdWFFD_ATTR1Add_Click
End Sub
Private Sub cmdWFFD_ATTR1Add_Click()
  On Error Resume Next
 Dim u As Object
 If Item.WFFD_ATTR1.Count = 0 Then
   Set u = Item.WFFD_ATTR1.Add

 End If
 Set editWFFD_ATTR1.Item = Item.WFFD_ATTR1.Item(1)
 editWFFD_ATTR1.InitPanel
 cmdWFFD_ATTR1Del.Enabled = True
 cmdWFFD_ATTR1Save.Enabled = False
 cmdWFFD_ATTR1Add.Enabled = False
End Sub
Private Sub cmdWFFD_ATTR1Del_Click()
  On Error Resume Next
  If editWFFD_ATTR1.Item Is Nothing Then Exit Sub
  If MsgBox("Удалить элемент" & vbCrLf & editWFFD_ATTR1.Item.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
    On Error GoTo bye
    editWFFD_ATTR1.Item.Parent.Delete editWFFD_ATTR1.Item.ID
    cmdWFFD_ATTR1Del.Enabled = False
    cmdWFFD_ATTR1Save.Enabled = False
    editWFFD_ATTR1.Enabled = False
    Set editWFFD_ATTR1.Item = Nothing
    cmdWFFD_ATTR1Add.Enabled = True
  End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub editWFFD_ATTR1_Changed()
 cmdWFFD_ATTR1Save.Enabled = True
End Sub
Private Sub cmdWFFD_ATTR1Save_Click()
  On Error Resume Next
    If editWFFD_ATTR1.IsOK Then
    editWFFD_ATTR1.Save
  On Error GoTo bye
    editWFFD_ATTR1.Item.Save
    cmdWFFD_ATTR1Save.Enabled = False
    Else
      MsgBox "Не все обязатеьлные поля заполнены", vbOKOnly + vbExclamation
    End If
  On Error Resume Next
  Dim ff As Long
  ff = FreeFile
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFFD_editWFFD_ATTR1_" For Output As #ff
  Print #ff, editWFFD_ATTR1.PanelCustomisationString
  Close #ff
Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
  editWFFD_ATTR1.Item.Refresh
  editWFFD_ATTR1.InitPanel
End Sub
Private Sub ts_click()
  On Error Resume Next
  pnlWFFD_ATTR1.Visible = False
  pnlWFFD_CustomParam.Visible = False
  pnlWFFD_Results.Visible = False
  pnlWFFD_Doer.Visible = False
  pnlWFFD_ShortCut.Visible = False
  pnlWFFD_common.Visible = False

   Select Case ts.SelectedItem.Key
   Case "WFFD_common"
     With pnlWFFD_common
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      editWFFD_common.Top = 40 * Screen.TwipsPerPixelX
      editWFFD_common.Left = 5 * Screen.TwipsPerPixelX
      editWFFD_common.Width = .Width - 10 * Screen.TwipsPerPixelX
      editWFFD_common.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFFD_ShortCut"
     With pnlWFFD_ShortCut
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      gridWFFD_ShortCut.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Height = .Height - 45 * Screen.TwipsPerPixelY
      gridWFFD_ShortCut.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_ShortCut.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFFD_Doer"
     With pnlWFFD_Doer
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      gridWFFD_Doer.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Height = .Height - 45 * Screen.TwipsPerPixelY
      gridWFFD_Doer.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_Doer.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFFD_Results"
     With pnlWFFD_Results
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      gridWFFD_Results.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_Results.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_Results.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_Results.Height = .Height - 45 * Screen.TwipsPerPixelY
      gridWFFD_Results.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_Results.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_Results.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_Results.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFFD_CustomParam"
     With pnlWFFD_CustomParam
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      gridWFFD_CustomParam.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_CustomParam.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_CustomParam.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_CustomParam.Height = .Height - 45 * Screen.TwipsPerPixelY
      gridWFFD_CustomParam.Top = 40 * Screen.TwipsPerPixelX
      gridWFFD_CustomParam.Left = 5 * Screen.TwipsPerPixelX
      gridWFFD_CustomParam.Width = .Width - 10 * Screen.TwipsPerPixelX
      gridWFFD_CustomParam.Height = .Height - 45 * Screen.TwipsPerPixelY
     End With
   Case "WFFD_ATTR1"
     With pnlWFFD_ATTR1
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
      editWFFD_ATTR1.Top = 40 * Screen.TwipsPerPixelX
      editWFFD_ATTR1.Left = 5 * Screen.TwipsPerPixelX
      editWFFD_ATTR1.Width = .Width - 10 * Screen.TwipsPerPixelX
      editWFFD_ATTR1.Height = .Height - 45 * Screen.TwipsPerPixelY
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

ts.Tabs.Item(1).Caption = "Функция процесса"
ts.Tabs.Item(1).Key = "WFFD_common"
  LoadBtnPictures cmdWFFD_commonSave, cmdWFFD_commonSave.Tag
  LoadBtnPictures cmdWFFD_commonDel, cmdWFFD_commonDel.Tag
  LoadBtnPictures cmdWFFD_commonAdd, cmdWFFD_commonAdd.Tag
  LoadBtnPictures cmdWFFD_commonRef, cmdWFFD_commonRef.Tag
  ff = FreeFile
  On Error Resume Next
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFFD_editWFFD_common_" For Input As #ff
  buf = ""
  buf = Input(LOF(ff), ff)
  Close #ff
  If buf <> "" Then editWFFD_common.PanelCustomisationString = buf
  cmdWFFD_commonAdd_Click
Call ts.Tabs.Add(, "WFFD_ShortCut", "Ярлыки")
  LoadBtnPictures cmdWFFD_ShortCutAdd, cmdWFFD_ShortCutAdd.Tag
  LoadBtnPictures cmdWFFD_ShortCutEdit, cmdWFFD_ShortCutEdit.Tag
  LoadBtnPictures cmdWFFD_ShortCutDel, cmdWFFD_ShortCutDel.Tag
  LoadBtnPictures cmdWFFD_ShortCutRef, cmdWFFD_ShortCutRef.Tag
  LoadBtnPictures cmdWFFD_ShortCutCfg, cmdWFFD_ShortCutCfg.Tag
  LoadBtnPictures cmdWFFD_ShortCutPrn, cmdWFFD_ShortCutPrn.Tag
  LoadBtnPictures cmdWFFD_ShortCutFnd, cmdWFFD_ShortCutFnd.Tag
  LoadBtnPictures cmdWFFD_ShortCutRun, cmdWFFD_ShortCutRun.Tag
  LoadBtnPictures cmdWFFD_ShortCutAcc, cmdWFFD_ShortCutAcc.Tag
  Item.WFFD_ShortCut.PrepareGrid gridWFFD_ShortCut
  LoadGridLayout gridWFFD_ShortCut
  Set fndWFFD_ShortCut = Nothing
  On Error Resume Next
  Set fndWFFD_ShortCut = CreateObject("MTZ_JSetup.GridFinder")
  fndWFFD_ShortCut.Init gridWFFD_ShortCut
Call ts.Tabs.Add(, "WFFD_Doer", "Исполнители")
  LoadBtnPictures cmdWFFD_DoerAdd, cmdWFFD_DoerAdd.Tag
  LoadBtnPictures cmdWFFD_DoerEdit, cmdWFFD_DoerEdit.Tag
  LoadBtnPictures cmdWFFD_DoerDel, cmdWFFD_DoerDel.Tag
  LoadBtnPictures cmdWFFD_DoerRef, cmdWFFD_DoerRef.Tag
  LoadBtnPictures cmdWFFD_DoerCfg, cmdWFFD_DoerCfg.Tag
  LoadBtnPictures cmdWFFD_DoerPrn, cmdWFFD_DoerPrn.Tag
  LoadBtnPictures cmdWFFD_DoerFnd, cmdWFFD_DoerFnd.Tag
  LoadBtnPictures cmdWFFD_DoerRun, cmdWFFD_DoerRun.Tag
  LoadBtnPictures cmdWFFD_DoerAcc, cmdWFFD_DoerAcc.Tag
  Item.WFFD_Doer.PrepareGrid gridWFFD_Doer
  LoadGridLayout gridWFFD_Doer
  Set fndWFFD_Doer = Nothing
  On Error Resume Next
  Set fndWFFD_Doer = CreateObject("MTZ_JSetup.GridFinder")
  fndWFFD_Doer.Init gridWFFD_Doer
Call ts.Tabs.Add(, "WFFD_Results", "Возможные результаты")
  LoadBtnPictures cmdWFFD_ResultsAdd, cmdWFFD_ResultsAdd.Tag
  LoadBtnPictures cmdWFFD_ResultsEdit, cmdWFFD_ResultsEdit.Tag
  LoadBtnPictures cmdWFFD_ResultsDel, cmdWFFD_ResultsDel.Tag
  LoadBtnPictures cmdWFFD_ResultsRef, cmdWFFD_ResultsRef.Tag
  LoadBtnPictures cmdWFFD_ResultsCfg, cmdWFFD_ResultsCfg.Tag
  LoadBtnPictures cmdWFFD_ResultsPrn, cmdWFFD_ResultsPrn.Tag
  LoadBtnPictures cmdWFFD_ResultsFnd, cmdWFFD_ResultsFnd.Tag
  LoadBtnPictures cmdWFFD_ResultsRun, cmdWFFD_ResultsRun.Tag
  LoadBtnPictures cmdWFFD_ResultsAcc, cmdWFFD_ResultsAcc.Tag
  Item.WFFD_Results.PrepareGrid gridWFFD_Results
  LoadGridLayout gridWFFD_Results
  Set fndWFFD_Results = Nothing
  On Error Resume Next
  Set fndWFFD_Results = CreateObject("MTZ_JSetup.GridFinder")
  fndWFFD_Results.Init gridWFFD_Results
Call ts.Tabs.Add(, "WFFD_CustomParam", "Дополнительные параметры")
  LoadBtnPictures cmdWFFD_CustomParamAdd, cmdWFFD_CustomParamAdd.Tag
  LoadBtnPictures cmdWFFD_CustomParamEdit, cmdWFFD_CustomParamEdit.Tag
  LoadBtnPictures cmdWFFD_CustomParamDel, cmdWFFD_CustomParamDel.Tag
  LoadBtnPictures cmdWFFD_CustomParamRef, cmdWFFD_CustomParamRef.Tag
  LoadBtnPictures cmdWFFD_CustomParamCfg, cmdWFFD_CustomParamCfg.Tag
  LoadBtnPictures cmdWFFD_CustomParamPrn, cmdWFFD_CustomParamPrn.Tag
  LoadBtnPictures cmdWFFD_CustomParamFnd, cmdWFFD_CustomParamFnd.Tag
  LoadBtnPictures cmdWFFD_CustomParamRun, cmdWFFD_CustomParamRun.Tag
  LoadBtnPictures cmdWFFD_CustomParamAcc, cmdWFFD_CustomParamAcc.Tag
  Item.WFFD_CustomParam.PrepareGrid gridWFFD_CustomParam
  LoadGridLayout gridWFFD_CustomParam
  Set fndWFFD_CustomParam = Nothing
  On Error Resume Next
  Set fndWFFD_CustomParam = CreateObject("MTZ_JSetup.GridFinder")
  fndWFFD_CustomParam.Init gridWFFD_CustomParam
Call ts.Tabs.Add(, "WFFD_ATTR1", "Дополнительные атрибуты")
  LoadBtnPictures cmdWFFD_ATTR1Save, cmdWFFD_ATTR1Save.Tag
  LoadBtnPictures cmdWFFD_ATTR1Del, cmdWFFD_ATTR1Del.Tag
  LoadBtnPictures cmdWFFD_ATTR1Add, cmdWFFD_ATTR1Add.Tag
  LoadBtnPictures cmdWFFD_ATTR1Ref, cmdWFFD_ATTR1Ref.Tag
  ff = FreeFile
  On Error Resume Next
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFFD_editWFFD_ATTR1_" For Input As #ff
  buf = ""
  buf = Input(LOF(ff), ff)
  Close #ff
  If buf <> "" Then editWFFD_ATTR1.PanelCustomisationString = buf
  cmdWFFD_ATTR1Add_Click
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

If Name = "WFFD_common" Then
 Set FormByName = New frmWFFD_common_
 Exit Function
End If

If Name = "WFFD_ShortCut" Then
 Set FormByName = New frmWFFD_ShortCut_
 Exit Function
End If

If Name = "WFFD_Doer" Then
 Set FormByName = New frmWFFD_Doer_
 Exit Function
End If

If Name = "WFFD_Results" Then
 Set FormByName = New frmWFFD_Results_
 Exit Function
End If

If Name = "WFFD_CustomParam" Then
 Set FormByName = New frmWFFD_CustomParam_
 Exit Function
End If

If Name = "WFFD_ATTR1" Then
 Set FormByName = New frmWFFD_ATTR1_
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



