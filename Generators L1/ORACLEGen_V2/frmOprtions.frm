VERSION 5.00
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "��������� ���������"
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
      Caption         =   "������"
      Height          =   300
      Left            =   270
      TabIndex        =   7
      Top             =   2350
      Width           =   3660
   End
   Begin VB.CheckBox chkProcs 
      Caption         =   "���������"
      Height          =   300
      Left            =   270
      TabIndex        =   6
      Top             =   1907
      Width           =   3660
   End
   Begin VB.CheckBox chkInit 
      Caption         =   "������������� ����"
      Height          =   300
      Left            =   270
      TabIndex        =   5
      Top             =   1464
      Width           =   3660
   End
   Begin VB.CheckBox chkView 
      Caption         =   "������� (View)"
      Height          =   300
      Left            =   270
      TabIndex        =   4
      Top             =   578
      Width           =   3660
   End
   Begin VB.CheckBox chkKernel 
      Caption         =   "����"
      Height          =   300
      Left            =   270
      TabIndex        =   3
      Top             =   1021
      Width           =   3660
   End
   Begin VB.CheckBox chkTables 
      Caption         =   "��������� ������"
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
  'chkFullText.Value = GetSetting(App.Title, "ORAGEN", "FULLTEXT", vbChecked)
  chkInit.Value = GetSetting(App.Title, "ORAGEN", "INIT", vbChecked)
  chkKernel.Value = GetSetting(App.Title, "ORAGEN", "KERNEL", vbChecked)
  chkMethods.Value = GetSetting(App.Title, "ORAGEN", "METHODS", vbChecked)
  chkProcs.Value = GetSetting(App.Title, "ORAGEN", "PROCS", vbChecked)
  chkTables.Value = GetSetting(App.Title, "ORAGEN", "TABLES", vbChecked)
  chkView.Value = GetSetting(App.Title, "ORAGEN", "VIEW", vbChecked)
  'chkMaintein.Value = GetSetting(App.Title, "ORAGEN", "MAINTEIN", vbChecked)
  'chkManual.Value = GetSetting(App.Title, "ORAGEN", "MANUAL", vbChecked)
End Sub

Private Sub OKButton_Click()

  'SaveSetting App.Title, "ORAGEN", "FULLTEXT", chkFullText.Value
  SaveSetting App.Title, "ORAGEN", "INIT", chkInit.Value
  SaveSetting App.Title, "ORAGEN", "KERNEL", chkKernel.Value
  SaveSetting App.Title, "ORAGEN", "METHODS", chkMethods.Value
  SaveSetting App.Title, "ORAGEN", "PROCS", chkProcs.Value
  SaveSetting App.Title, "ORAGEN", "TABLES", chkTables.Value
  SaveSetting App.Title, "ORAGEN", "VIEW", chkView.Value
  'SaveSetting App.Title, "ORAGEN", "MAINTEIN", chkMaintein.Value
  'SaveSetting App.Title, "ORAGEN", "MANUAL", chkManual.Value
Unload Me
End Sub
