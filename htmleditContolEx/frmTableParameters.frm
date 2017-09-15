VERSION 5.00
Begin VB.Form frmTableParameters 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Параметры таблицы"
   ClientHeight    =   1740
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4035
   Icon            =   "frmTableParameters.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1740
   ScaleWidth      =   4035
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Отмена"
      Height          =   345
      Left            =   2670
      TabIndex        =   8
      Top             =   1260
      Width           =   1260
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Enabled         =   0   'False
      Height          =   345
      Left            =   1320
      TabIndex        =   7
      Top             =   1260
      Width           =   1260
   End
   Begin VB.Frame Frame1 
      Caption         =   "Рамка"
      Height          =   1065
      Left            =   1800
      TabIndex        =   4
      Top             =   30
      Width           =   2175
      Begin VB.OptionButton optBorderOne 
         Caption         =   "Одиночная рамка"
         Height          =   285
         Left            =   180
         TabIndex        =   6
         Top             =   540
         Value           =   -1  'True
         Width           =   1755
      End
      Begin VB.OptionButton optBorderNone 
         Caption         =   "Нет рамки"
         Height          =   285
         Left            =   180
         TabIndex        =   5
         Top             =   240
         Width           =   1755
      End
   End
   Begin VB.TextBox txtRowCount 
      Height          =   315
      Left            =   1140
      TabIndex        =   3
      Top             =   570
      Width           =   555
   End
   Begin VB.TextBox txtColCount 
      Height          =   315
      Left            =   1140
      TabIndex        =   1
      Top             =   210
      Width           =   555
   End
   Begin VB.Label Label2 
      Caption         =   "Строк:"
      Height          =   285
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   885
   End
   Begin VB.Label Label1 
      Caption         =   "Колонок:"
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   885
   End
End
Attribute VB_Name = "frmTableParameters"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public Result As Long
Public Col As Long
Public Row As Long
Public NoBorder As Boolean
Public Border As Long



Private Sub cmdCancel_Click()

  
  Hide
  
End Sub

Private Sub cmdOK_Click()
  Result = vbOK
  Col = CLng(txtColCount.Text)
  Row = CLng(txtRowCount.Text)
  If optBorderNone.Value = True Then
    NoBorder = True
  Else
    NoBorder = False
  End If
  If (optBorderOne.Value = True) Then
    Border = 1
  End If
  Hide
End Sub

Private Sub txtRowCount_Validate(Cancel As Boolean)
If txtRowCount.Text <> vbNullString Then
 On Error Resume Next
  If Not IsNumeric(txtRowCount.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtRowCount.Text) <> CLng(Val(txtRowCount.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub

Private Sub txtRowCount_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0
End Sub

Private Sub txtColCount_Validate(Cancel As Boolean)
 If txtColCount.Text <> vbNullString Then
 On Error Resume Next
  If Not IsNumeric(txtColCount.Text) Then
     Cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
  ElseIf Val(txtColCount.Text) <> CLng(Val(txtColCount.Text)) Then
     Cancel = True
     MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
  End If
End If
End Sub

Private Sub txtColCount_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0
End Sub

Private Sub txtColCount_Change()
  CheckChanges
End Sub

Private Sub CheckChanges()
  If Not (txtColCount.Text = vbNullString) And Not (txtRowCount.Text = vbNullString) Then
    cmdOK.Enabled = True
  Else
    cmdOK.Enabled = False
  End If
End Sub

Private Sub txtRowCount_Change()
  CheckChanges
End Sub
