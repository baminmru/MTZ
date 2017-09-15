VERSION 5.00
Begin VB.Form frmSecDialog 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Выбор стиля защиты"
   ClientHeight    =   3900
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   7380
   Icon            =   "frmSecDialog.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3900
   ScaleWidth      =   7380
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Создать"
      Height          =   315
      Left            =   3720
      TabIndex        =   4
      Top             =   3480
      Visible         =   0   'False
      Width           =   1175
   End
   Begin VB.CheckBox chkPropogate 
      Caption         =   "Распространить на дочерние объекты"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   3450
      Width           =   3375
   End
   Begin VB.CheckBox chkNullSecurity 
      Caption         =   "Все разрешено"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   7215
   End
   Begin VB.ListBox lstStyle 
      Height          =   2595
      Left            =   90
      Sorted          =   -1  'True
      TabIndex        =   2
      Top             =   750
      Width           =   7245
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   6180
      TabIndex        =   6
      Top             =   3480
      Width           =   1175
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   4980
      TabIndex        =   5
      Top             =   3480
      Width           =   1175
   End
   Begin VB.Label Label1 
      Caption         =   "Стиль защиты"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   7215
   End
End
Attribute VB_Name = "frmSecDialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 380

Option Explicit
Public ok As Boolean
Attribute ok.VB_VarHelpID = 390
Private manager As MTZManager.Main
Public Item As Object
Attribute Item.VB_VarHelpID = 385
Private coll As Collection

Private Sub CancelButton_Click()
 ok = False
 Me.Hide
 Set Item = Nothing
 Set manager = Nothing
 Set coll = Nothing
End Sub

Private Sub chkNullSecurity_Click()
  If chkNullSecurity.Value = vbChecked Then
    lstStyle.Enabled = False
  Else
    lstStyle.Enabled = True
  End If
End Sub

Private Sub Form_Load()
  Dim rs As ADODB.Recordset
  Set manager = Item.Application.manager
  Set rs = manager.ListInstances("", "MTZSecurity")
  Dim ids As IDStore
  Dim pos As Long
  Set coll = New Collection
  While Not rs.EOF
    lstStyle.AddItem rs!Name
    Set ids = New IDStore
    ids.ID = rs!InstanceiD
    coll.Add ids
    If rs!InstanceiD = Item.SecureStyleID Then
      pos = coll.Count
    End If
    
    lstStyle.ItemData(lstStyle.NewIndex) = coll.Count
    rs.MoveNext
  Wend
  rs.Close
  If Item.SecureStyleID = "" Then
    lstStyle.Enabled = False
    chkNullSecurity.Value = vbChecked
    chkPropogate.Value = vbUnchecked
    
  Else
    lstStyle.Enabled = True
    chkNullSecurity.Value = vbUnchecked
    chkPropogate.Value = vbUnchecked
    Dim i As Long
    For i = 0 To lstStyle.ListCount - 1
      If lstStyle.ItemData(i) = pos Then
        lstStyle.ListIndex = i
        Exit For
      End If
    Next
    
  End If
  
End Sub

Private Sub OKButton_Click()
  On Error GoTo bye
  If chkNullSecurity.Value = vbChecked Then
    Item.Secure "" ', ()
    ok = True
  Else
    If lstStyle.ListIndex >= 0 Then
      Item.Secure coll.Item(lstStyle.ItemData(lstStyle.ListIndex)).ID ', (chkPropogate.Value = vbChecked)
      ok = True
    End If
  End If
  
  
  If ok Then
    If chkPropogate.Value = vbChecked Then
      Item.Propagate
    End If
    Me.Hide
  End If
  Set Item = Nothing
  Set manager = Nothing
  Set coll = Nothing
  Exit Sub
bye:
  ok = False
  MsgBox err.Description, vbOKOnly, "Установка стиля защиты"
End Sub
