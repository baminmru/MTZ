VERSION 5.00
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Параметры генерации"
   ClientHeight    =   6315
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   7725
   Icon            =   "frmOprtions.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6315
   ScaleWidth      =   7725
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox chkFullTextClear 
      Caption         =   "Удалить полнотекстовый поиск"
      ForeColor       =   &H000000C0&
      Height          =   300
      Left            =   120
      TabIndex        =   31
      Top             =   900
      Width           =   3660
   End
   Begin VB.CheckBox chkServer2005 
      Caption         =   "Совместимость с MS SQL Server 2005"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF00FF&
      Height          =   540
      Left            =   3960
      TabIndex        =   30
      Top             =   4680
      Width           =   3660
   End
   Begin VB.Frame Frame4 
      Caption         =   "Провека на открытие сессии"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   855
      Left            =   3960
      TabIndex        =   27
      Top             =   3300
      Width           =   3675
      Begin VB.CheckBox chkSessionSave 
         Caption         =   "При сохранении"
         Height          =   300
         Left            =   60
         TabIndex        =   29
         Top             =   480
         Width           =   3420
      End
      Begin VB.CheckBox chkSessionDelete 
         Caption         =   "При удалении"
         Height          =   300
         Left            =   60
         TabIndex        =   28
         Top             =   240
         Width           =   3420
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Провека на заблокированность"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   855
      Left            =   3960
      TabIndex        =   24
      Top             =   2400
      Width           =   3675
      Begin VB.CheckBox chkLockDelete 
         Caption         =   "При удалении"
         Height          =   300
         Left            =   60
         TabIndex        =   26
         Top             =   240
         Width           =   3420
      End
      Begin VB.CheckBox chkLockSave 
         Caption         =   "При сохранении"
         Height          =   300
         Left            =   60
         TabIndex        =   25
         Top             =   480
         Width           =   3420
      End
   End
   Begin VB.CheckBox chkChildDelete 
      Caption         =   "Удалять зависимые документы при удалении"
      Height          =   420
      Left            =   120
      TabIndex        =   23
      Top             =   5160
      Width           =   3660
   End
   Begin VB.CheckBox chkUNIQUE 
      Caption         =   "Генерировать проверку на уникальность"
      Height          =   300
      Left            =   120
      TabIndex        =   22
      Top             =   4800
      Width           =   3660
   End
   Begin VB.Frame Frame2 
      Caption         =   "Использование FK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   855
      Left            =   3960
      TabIndex        =   19
      Top             =   60
      Width           =   3675
      Begin VB.CheckBox chkCreateFK 
         Caption         =   "Создавать FK"
         Height          =   300
         Left            =   60
         TabIndex        =   21
         Top             =   480
         Width           =   3420
      End
      Begin VB.CheckBox chkCheckFK 
         Caption         =   "Отключить FK"
         Height          =   300
         Left            =   60
         TabIndex        =   20
         Top             =   240
         Width           =   3420
      End
   End
   Begin VB.CheckBox chkNoTran 
      Caption         =   "Не использовать транзакции"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   300
      Left            =   120
      TabIndex        =   18
      Top             =   4440
      Width           =   3660
   End
   Begin VB.Frame Frame1 
      Caption         =   "WITH(NOLOCK)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   1395
      Left            =   3960
      TabIndex        =   13
      Top             =   960
      Width           =   3675
      Begin VB.CheckBox chkWN_PROC 
         Caption         =   "Использовать в процедурах"
         Height          =   300
         Left            =   120
         TabIndex        =   17
         Top             =   960
         Width           =   3420
      End
      Begin VB.CheckBox chkWN_FUNC 
         Caption         =   "Использовать в функциях"
         Height          =   300
         Left            =   120
         TabIndex        =   16
         Top             =   720
         Width           =   3420
      End
      Begin VB.CheckBox chkWN_SYSPROC 
         Caption         =   "Использовать в системных процедурах"
         Height          =   300
         Left            =   120
         TabIndex        =   15
         Top             =   480
         Width           =   3420
      End
      Begin VB.CheckBox chkWN_VIEW 
         Caption         =   "Использовать в представлениях"
         Height          =   300
         Left            =   120
         TabIndex        =   14
         Top             =   240
         Width           =   3420
      End
   End
   Begin VB.CheckBox chkBrief 
      Caption         =   "Процедуры для краткого отображения"
      Height          =   300
      Left            =   120
      TabIndex        =   12
      Top             =   2640
      Width           =   3660
   End
   Begin VB.CheckBox chkRights 
      Caption         =   "Права (SQL)"
      ForeColor       =   &H000000C0&
      Height          =   285
      Left            =   120
      TabIndex        =   11
      Top             =   4080
      Width           =   3660
   End
   Begin VB.CheckBox chkMaintein 
      Caption         =   "Задачи обслуживания (SQL-задания)"
      ForeColor       =   &H000000C0&
      Height          =   300
      Left            =   120
      TabIndex        =   10
      Top             =   3720
      Width           =   3660
   End
   Begin VB.CheckBox chkManual 
      Caption         =   "Ручной код"
      Height          =   300
      Left            =   120
      TabIndex        =   9
      Top             =   3360
      Width           =   3660
   End
   Begin VB.CheckBox chkMethods 
      Caption         =   "Методы"
      Height          =   300
      Left            =   120
      TabIndex        =   8
      Top             =   3000
      Width           =   3660
   End
   Begin VB.CheckBox chkProcs 
      Caption         =   "Процедуры"
      Height          =   300
      Left            =   120
      TabIndex        =   7
      Top             =   2280
      Width           =   3660
   End
   Begin VB.CheckBox chkInit 
      Caption         =   "Инициализация базы"
      Height          =   300
      Left            =   120
      TabIndex        =   6
      Top             =   1920
      Width           =   3660
   End
   Begin VB.CheckBox chkView 
      Caption         =   "Запросы (View)"
      Height          =   300
      Left            =   120
      TabIndex        =   5
      Top             =   1560
      Width           =   3660
   End
   Begin VB.CheckBox chkFullText 
      Caption         =   "Создать полнотекстовый поиск"
      ForeColor       =   &H000000C0&
      Height          =   300
      Left            =   120
      TabIndex        =   4
      Top             =   1200
      Width           =   3660
   End
   Begin VB.CheckBox chkKernel 
      Caption         =   "Ядро"
      Height          =   300
      Left            =   120
      TabIndex        =   3
      Top             =   420
      Width           =   3660
   End
   Begin VB.CheckBox chkTables 
      Caption         =   "Структура таблиц"
      Height          =   300
      Left            =   120
      TabIndex        =   2
      Top             =   15
      Width           =   3660
   End
   Begin VB.CommandButton CancelButton 
      BackColor       =   &H00FFFFC0&
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   3900
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   5280
      Width           =   3795
   End
   Begin VB.CommandButton OKButton 
      BackColor       =   &H00C0E0FF&
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   60
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   5760
      Width           =   3795
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub CancelButton_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  chkFullText.Value = GetSetting(App.Title, "SQLGEN", "FULLTEXT", vbChecked)
  chkFullTextClear.Value = GetSetting(App.Title, "SQLGEN", "FULLTEXTCLEAR", vbChecked)
  chkInit.Value = GetSetting(App.Title, "SQLGEN", "INIT", vbChecked)
  chkKernel.Value = GetSetting(App.Title, "SQLGEN", "KERNEL", vbChecked)
  chkMethods.Value = GetSetting(App.Title, "SQLGEN", "METHODS", vbChecked)
  chkProcs.Value = GetSetting(App.Title, "SQLGEN", "PROCS", vbChecked)
  chkBrief.Value = GetSetting(App.Title, "SQLGEN", "BRIEF", vbChecked)
  chkTables.Value = GetSetting(App.Title, "SQLGEN", "TABLES", vbChecked)
  chkView.Value = GetSetting(App.Title, "SQLGEN", "VIEW", vbChecked)
  chkMaintein.Value = GetSetting(App.Title, "SQLGEN", "MAINTEIN", vbChecked)
  chkManual.Value = GetSetting(App.Title, "SQLGEN", "MANUAL", vbChecked)
  chkRights.Value = GetSetting(App.Title, "SQLGEN", "RIGHTS", vbChecked)
  
  chkCheckFK.Value = GetSetting(App.Title, "SQLGEN", "CHECKFK", vbUnchecked)
  chkCreateFK.Value = GetSetting(App.Title, "SQLGEN", "CREATEFK", vbUnchecked)
  
  chkWN_VIEW.Value = GetSetting(App.Title, "SQLGEN", "WN_VIEW", vbUnchecked)
  chkWN_SYSPROC.Value = GetSetting(App.Title, "SQLGEN", "WN_SYSPROC", vbUnchecked)
  chkWN_PROC.Value = GetSetting(App.Title, "SQLGEN", "WN_PROC", vbUnchecked)
  chkWN_FUNC.Value = GetSetting(App.Title, "SQLGEN", "WN_FUNC", vbUnchecked)
  
  chkLockDelete.Value = GetSetting(App.Title, "SQLGEN", "LOCK_D", vbUnchecked)
  chkLockSave.Value = GetSetting(App.Title, "SQLGEN", "LOCK_S", vbUnchecked)
    
  chkSessionDelete.Value = GetSetting(App.Title, "SQLGEN", "SESSION_D", vbUnchecked)
  chkSessionSave.Value = GetSetting(App.Title, "SQLGEN", "SESSION_S", vbUnchecked)
    
  chkNoTran.Value = GetSetting(App.Title, "SQLGEN", "NOTRAN", vbUnchecked)
  chkUNIQUE.Value = GetSetting(App.Title, "SQLGEN", "UNIQUE", vbUnchecked)
  chkChildDelete.Value = GetSetting(App.Title, "SQLGEN", "CHILDDELETE", vbUnchecked)

  chkServer2005.Value = GetSetting(App.Title, "SQLGEN", "SERVER2005", vbUnchecked)
End Sub

Private Sub OKButton_Click()
  SaveSetting App.Title, "SQLGEN", "FULLTEXT", chkFullText.Value
  SaveSetting App.Title, "SQLGEN", "FULLTEXTCLEAR", chkFullTextClear.Value
  SaveSetting App.Title, "SQLGEN", "INIT", chkInit.Value
  SaveSetting App.Title, "SQLGEN", "KERNEL", chkKernel.Value
  SaveSetting App.Title, "SQLGEN", "METHODS", chkMethods.Value
  SaveSetting App.Title, "SQLGEN", "PROCS", chkProcs.Value
  SaveSetting App.Title, "SQLGEN", "BRIEF", chkBrief.Value
  SaveSetting App.Title, "SQLGEN", "TABLES", chkTables.Value
  SaveSetting App.Title, "SQLGEN", "VIEW", chkView.Value
  SaveSetting App.Title, "SQLGEN", "MAINTEIN", chkMaintein.Value
  SaveSetting App.Title, "SQLGEN", "MANUAL", chkManual.Value
  SaveSetting App.Title, "SQLGEN", "RIGHTS", chkRights.Value
  SaveSetting App.Title, "SQLGEN", "CHECKFK", chkCheckFK.Value
  SaveSetting App.Title, "SQLGEN", "CREATEFK", chkCreateFK.Value
  
  SaveSetting App.Title, "SQLGEN", "WN_VIEW", chkWN_VIEW.Value
  SaveSetting App.Title, "SQLGEN", "WN_SYSPROC", chkWN_SYSPROC.Value
  SaveSetting App.Title, "SQLGEN", "WN_PROC", chkWN_PROC.Value
  SaveSetting App.Title, "SQLGEN", "WN_FUNC", chkWN_FUNC.Value
  
  SaveSetting App.Title, "SQLGEN", "LOCK_D", chkLockDelete.Value
  SaveSetting App.Title, "SQLGEN", "LOCK_S", chkLockSave.Value
  
  SaveSetting App.Title, "SQLGEN", "SESSION_D", chkSessionDelete.Value
  SaveSetting App.Title, "SQLGEN", "SESSION_S", chkSessionSave.Value
  
  SaveSetting App.Title, "SQLGEN", "NOTRAN", chkNoTran.Value
  SaveSetting App.Title, "SQLGEN", "UNIQUE", chkUNIQUE.Value
  SaveSetting App.Title, "SQLGEN", "CHILDDELETE", chkChildDelete.Value
  
  SaveSetting App.Title, "SQLGEN", "SERVER2005", chkServer2005.Value
  
  Unload Me
End Sub
