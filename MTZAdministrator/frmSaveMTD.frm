VERSION 5.00
Begin VB.Form frmSaveMTD 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Сохранить методы и процедуры"
   ClientHeight    =   885
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6780
   Icon            =   "frmSaveMTD.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   885
   ScaleWidth      =   6780
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdPath 
      Caption         =   "..."
      Height          =   315
      Left            =   6405
      TabIndex        =   2
      Top             =   120
      Width           =   315
   End
   Begin VB.TextBox txtPath 
      Height          =   285
      Left            =   1920
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   120
      Width           =   4470
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "Сохранить"
      Height          =   315
      Left            =   5520
      TabIndex        =   3
      Top             =   510
      Width           =   1175
   End
   Begin VB.Label Label8 
      Caption         =   "Куда сохранить:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1785
   End
End
Attribute VB_Name = "frmSaveMTD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public TypeName As String
Public site As String

Public OK As Boolean
Private ID  As String
Public NewObject  As Object
Private types As Collection



Private Sub CancelButton_Click()
OK = False
Set types = Nothing
Me.Hide
End Sub




Private Sub cmbType_DblClick()
OKButton_Click
End Sub


Private Sub OKButton_Click()
  On Error GoTo bye

    SaveMTDTypeXML
    
MsgBox "Сохранение завершено", , "Сохранение описания типов полей"

bye:
End Sub

Private Sub SaveMTDTypeXML()
On Error Resume Next
 
 If Session.CheckRight(model.SecureStyleID, "XMLSAVE") Then
 
  On Error GoTo bye
  Dim fn As String
 
   fn = txtPath & "SHAREDMETHOD.xml"
   
   Dim xdom As MSXML2.DOMDocument
   Set xdom = New MSXML2.DOMDocument
   xdom.loadXML "<root><APPLICATION></APPLICATION></root>"
   
   model.SHAREDMETHOD.XMLSave xdom.lastChild.firstChild, xdom
   xdom.Save fn
   
 End If
bye:
End Sub


Private Sub cmdPath_Click()
  Dim path As String
  path = GetPath("Каталог для сохранения документов", Me.hwnd)
  
  If (path <> vbNullString) Then
    txtPath.Text = path
  End If
End Sub

