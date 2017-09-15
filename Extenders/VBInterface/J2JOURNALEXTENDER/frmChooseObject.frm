VERSION 5.00
Begin VB.Form frmChooseObject 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Выберите тип"
   ClientHeight    =   1470
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5835
   Icon            =   "frmChooseObject.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1470
   ScaleWidth      =   5835
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   4560
      TabIndex        =   2
      Top             =   0
      Width           =   1215
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4560
      TabIndex        =   1
      Top             =   480
      Width           =   1215
   End
   Begin VB.ListBox lstObjects 
      Height          =   1425
      Left            =   0
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   4455
   End
End
Attribute VB_Name = "frmChooseObject"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public ObjectList As Variant
Public ChoosenObjectType As Long

Private Sub CancelButton_Click()
    ChoosenObjectType = -1
    Me.Hide
End Sub

Private Sub Form_Load()
Dim i As Long
    
    For i = 1 To UBound(ObjectList)
        lstObjects.AddItem ObjectList(i)
        lstObjects.ItemData(lstObjects.NewIndex) = i
        lstObjects.ListIndex = 0
    Next
    
End Sub

Private Sub OKButton_Click()
    ChoosenObjectType = lstObjects.ItemData(lstObjects.ListIndex)
    Me.Hide
End Sub
