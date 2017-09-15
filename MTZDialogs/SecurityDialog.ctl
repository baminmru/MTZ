VERSION 5.00
Begin VB.UserControl SecurityDialog 
   ClientHeight    =   3450
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5415
   ScaleHeight     =   3450
   ScaleWidth      =   5415
   Begin VB.ListBox lstStyle 
      Height          =   2205
      Left            =   120
      Sorted          =   -1  'True
      TabIndex        =   3
      Top             =   960
      Width           =   5175
   End
   Begin VB.CheckBox chkNullSecurity 
      Caption         =   "Все разрешено"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   0
      Width           =   1815
   End
   Begin VB.CheckBox chkPropogate 
      Caption         =   "Распространить на дочерние объекты"
      Height          =   375
      Left            =   2040
      TabIndex        =   1
      Top             =   0
      Width           =   3375
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Создать стиль"
      Height          =   375
      Left            =   3480
      TabIndex        =   0
      Top             =   480
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Стиль защиты"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   600
      Width           =   2775
   End
End
Attribute VB_Name = "SecurityDialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True

Option Explicit
Private manager As MTZManager.Main
Private Item As Object
Private coll As Collection


Private Sub chkNullSecurity_Click()
  If chkNullSecurity.Value = vbChecked Then
    lstStyle.Enabled = False
  Else
    lstStyle.Enabled = True
  End If
End Sub

Public Sub Init(objItem As Object)
  Set Item = objItem
  Dim rs As ADODB.Recordset
  Set manager = Item.Application.manager
  Set rs = manager.ListInstances("", "MTZSecurity")
  Dim ids As IDStore
  Dim pos As Long
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
    lstStyle.ListIndex = pos - 1
  End If
  
End Sub

Public Sub ApplyStyle()
  On Error GoTo bye
  Dim ok As Boolean
  If chkNullSecurity.Value = vbChecked Then
    Item.Secure ""
    ok = True
  Else
    If lstStyle.ListIndex >= 0 Then
      Item.Secure coll.Item(lstStyle.ListIndex + 1).ID ', (chkPropogate.Value = vbChecked)
      ok = True
    End If
  End If
  
  
  If ok Then
    If chkPropogate.Value = vbChecked Then
      Item.Propagate
    End If
  End If
  Exit Sub
bye:
  ok = False
  MsgBox Err.Description, vbOKOnly, "Установка стиля защиты"
End Sub

Private Sub UserControl_Initialize()
  Set coll = New Collection
End Sub

Private Sub UserControl_Terminate()
 Set Item = Nothing
 Set manager = Nothing
 Set coll = Nothing
End Sub
