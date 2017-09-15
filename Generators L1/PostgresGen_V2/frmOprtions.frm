VERSION 5.00
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Параметры генерации"
   ClientHeight    =   2790
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5415
   Icon            =   "frmOprtions.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2790
   ScaleWidth      =   5415
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox chkMethods 
      Caption         =   "Методы"
      Height          =   300
      Left            =   270
      TabIndex        =   7
      Top             =   2350
      Width           =   3660
   End
   Begin VB.CheckBox chkProcs 
      Caption         =   "Процедуры"
      Height          =   300
      Left            =   270
      TabIndex        =   6
      Top             =   1907
      Width           =   3660
   End
   Begin VB.CheckBox chkInit 
      Caption         =   "Инициализация базы"
      Height          =   300
      Left            =   270
      TabIndex        =   5
      Top             =   1464
      Width           =   3660
   End
   Begin VB.CheckBox chkView 
      Caption         =   "Запросы (View)"
      Height          =   300
      Left            =   270
      TabIndex        =   4
      Top             =   578
      Width           =   3660
   End
   Begin VB.CheckBox chkKernel 
      Caption         =   "Ядро"
      Height          =   300
      Left            =   270
      TabIndex        =   3
      Top             =   1021
      Width           =   3660
   End
   Begin VB.CheckBox chkTables 
      Caption         =   "Структура таблиц"
      Height          =   300
      Left            =   240
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
  'chkFullText.Value = GetSetting(App.Title, "POSTGRESGEN", "FULLTEXT", vbChecked)
  chkInit.Value = GetSetting(App.Title, "POSTGRESGEN", "INIT", vbChecked)
  chkKernel.Value = GetSetting(App.Title, "POSTGRESGEN", "KERNEL", vbChecked)
  chkMethods.Value = GetSetting(App.Title, "POSTGRESGEN", "METHODS", vbChecked)
  chkProcs.Value = GetSetting(App.Title, "POSTGRESGEN", "PROCS", vbChecked)
  chkTables.Value = GetSetting(App.Title, "POSTGRESGEN", "TABLES", vbChecked)
  chkView.Value = GetSetting(App.Title, "POSTGRESGEN", "VIEW", vbChecked)
  'chkMaintein.Value = GetSetting(App.Title, "POSTGRESGEN", "MAINTEIN", vbChecked)
  'chkManual.Value = GetSetting(App.Title, "POSTGRESGEN", "MANUAL", vbChecked)
End Sub

Private Sub OKButton_Click()

  'SaveSetting App.Title, "POSTGRESGEN", "FULLTEXT", chkFullText.Value
  SaveSetting App.Title, "POSTGRESGEN", "INIT", chkInit.Value
  SaveSetting App.Title, "POSTGRESGEN", "KERNEL", chkKernel.Value
  SaveSetting App.Title, "POSTGRESGEN", "METHODS", chkMethods.Value
  SaveSetting App.Title, "POSTGRESGEN", "PROCS", chkProcs.Value
  SaveSetting App.Title, "POSTGRESGEN", "TABLES", chkTables.Value
  SaveSetting App.Title, "POSTGRESGEN", "VIEW", chkView.Value
  'SaveSetting App.Title, "POSTGRESGEN", "MAINTEIN", chkMaintein.Value
  'SaveSetting App.Title, "POSTGRESGEN", "MANUAL", chkManual.Value
Unload Me
End Sub
