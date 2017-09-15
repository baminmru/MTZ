VERSION 5.00
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Параметры генерации"
   ClientHeight    =   4590
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5415
   Icon            =   "frmOprtions.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4590
   ScaleWidth      =   5415
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox chkRights 
      Caption         =   "Права"
      Height          =   300
      Left            =   240
      TabIndex        =   11
      Top             =   4080
      Width           =   3660
   End
   Begin VB.CheckBox chkMaintein 
      Caption         =   "Задачи обслуживания"
      Height          =   300
      Left            =   270
      TabIndex        =   10
      Top             =   3630
      Width           =   3660
   End
   Begin VB.CheckBox chkManual 
      Caption         =   "Ручной код"
      Height          =   300
      Left            =   270
      TabIndex        =   9
      Top             =   3180
      Width           =   3660
   End
   Begin VB.CheckBox chkMethods 
      Caption         =   "Методы"
      Height          =   300
      Left            =   270
      TabIndex        =   8
      Top             =   2745
      Width           =   3660
   End
   Begin VB.CheckBox chkProcs 
      Caption         =   "Процедуры"
      Height          =   300
      Left            =   270
      TabIndex        =   7
      Top             =   2310
      Width           =   3660
   End
   Begin VB.CheckBox chkInit 
      Caption         =   "Инициализация базы"
      Height          =   300
      Left            =   270
      TabIndex        =   6
      Top             =   1875
      Width           =   3660
   End
   Begin VB.CheckBox chkView 
      Caption         =   "Запросы (View)"
      Height          =   300
      Left            =   270
      TabIndex        =   5
      Top             =   1440
      Width           =   3660
   End
   Begin VB.CheckBox chkFullText 
      Caption         =   "Полнотестовый поиск"
      Height          =   300
      Left            =   270
      TabIndex        =   4
      Top             =   1005
      Width           =   3660
   End
   Begin VB.CheckBox chkKernel 
      Caption         =   "Ядро"
      Height          =   300
      Left            =   270
      TabIndex        =   3
      Top             =   570
      Width           =   3660
   End
   Begin VB.CheckBox chkTables 
      Caption         =   "Структура таблиц"
      Height          =   300
      Left            =   270
      TabIndex        =   2
      Top             =   135
      Width           =   3660
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4065
      TabIndex        =   1
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   4065
      TabIndex        =   0
      Top             =   135
      Width           =   1215
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Check1_Click()

End Sub

Private Sub CancelButton_Click()
Unload Me
End Sub

Private Sub Form_Load()
  chkFullText.Value = GetSetting(App.Title, "SQLGEN", "FULLTEXT", vbChecked)
  chkInit.Value = GetSetting(App.Title, "SQLGEN", "INIT", vbChecked)
  chkKernel.Value = GetSetting(App.Title, "SQLGEN", "KERNEL", vbChecked)
  chkMethods.Value = GetSetting(App.Title, "SQLGEN", "METHODS", vbChecked)
  chkProcs.Value = GetSetting(App.Title, "SQLGEN", "PROCS", vbChecked)
  chkTables.Value = GetSetting(App.Title, "SQLGEN", "TABLES", vbChecked)
  chkView.Value = GetSetting(App.Title, "SQLGEN", "VIEW", vbChecked)
  chkMaintein.Value = GetSetting(App.Title, "SQLGEN", "MAINTEIN", vbChecked)
  chkManual.Value = GetSetting(App.Title, "SQLGEN", "MANUAL", vbChecked)
  chkRights.Value = GetSetting(App.Title, "SQLGEN", "RIGHTS", vbChecked)
End Sub

Private Sub OKButton_Click()

  SaveSetting App.Title, "SQLGEN", "FULLTEXT", chkFullText.Value
  SaveSetting App.Title, "SQLGEN", "INIT", chkInit.Value
  SaveSetting App.Title, "SQLGEN", "KERNEL", chkKernel.Value
  SaveSetting App.Title, "SQLGEN", "METHODS", chkMethods.Value
  SaveSetting App.Title, "SQLGEN", "PROCS", chkProcs.Value
  SaveSetting App.Title, "SQLGEN", "TABLES", chkTables.Value
  SaveSetting App.Title, "SQLGEN", "VIEW", chkView.Value
  SaveSetting App.Title, "SQLGEN", "MAINTEIN", chkMaintein.Value
  SaveSetting App.Title, "SQLGEN", "MANUAL", chkManual.Value
  SaveSetting App.Title, "SQLGEN", "RIGHTS", chkRights.Value
Unload Me
End Sub
