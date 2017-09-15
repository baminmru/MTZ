VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Демонстрационная программа"
   ClientHeight    =   495
   ClientLeft      =   45
   ClientTop       =   615
   ClientWidth     =   7035
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   495
   ScaleWidth      =   7035
   Begin VB.Timer Timer1 
      Interval        =   60000
      Left            =   4080
      Top             =   120
   End
   Begin VB.Menu mnuFile 
      Caption         =   "Файл"
      Begin VB.Menu mnuSetupJ 
         Caption         =   "Настройка журнала"
      End
      Begin VB.Menu Exit 
         Caption         =   "Выход"
      End
   End
   Begin VB.Menu mnuDictionaries 
      Caption         =   "Справочники"
   End
   Begin VB.Menu mnuJournals 
      Caption         =   "Журналы"
   End
   Begin VB.Menu mnuDocuments 
      Caption         =   "Новый документ"
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Exit_Click()
  Set journal = Nothing
  Set model = Nothing
  session.Logout
  Manager.CloseClass
  Set session = Nothing
  Set Manager = Nothing
  Dim f As Form
  For Each f In Forms
    Unload f
  Next
  'End
End Sub

Private Sub mnuDictionaries_Click()
  Set frmDicList.model = model
  frmDicList.Show vbModal
  If frmDicList.OK Then
    Dim ot As OBJECTTYPE
    Set ot = model.FindRowObject("OBJECTTYPE", frmDicList.Result)
    Dim o1 As Object, o2 As Object, id As String
    Dim rs As adodb.Recordset
    Set rs = Manager.ListInstances(Site, ot.Name)
    If rs.EOF Then
      id = CreateGUID2
      Manager.NewInstance id, ot.Name, ot.Comment, Site
    Else
      id = rs!InstanceID
    End If
    Set o1 = Manager.GetInstanceObject(id, Site)
    Set o2 = Manager.GetInstanceGUI(o1.id)
    o2.Show "", o1, False
  End If
End Sub

Private Sub mnuDocuments_Click()
  Set frmDocList.model = model
  frmDocList.Show vbModal
  If frmDocList.OK Then
    Dim ot As OBJECTTYPE
    Set ot = model.FindRowObject("OBJECTTYPE", frmDocList.Result)
    Dim o1 As Object, o2 As Object, id As String
    Dim rs As adodb.Recordset
    id = CreateGUID2
    Manager.NewInstance id, ot.Name, ot.Comment & " " & Now, Site
    Set o1 = Manager.GetInstanceObject(id, Site)
    Set o2 = Manager.GetInstanceGUI(o1.id)
    o2.Show "", o1, False
  End If
End Sub

Private Sub mnuJournals_Click()
  Set frmJouralList.model = model
  frmJouralList.Show vbModal
  If frmJouralList.OK Then
    Set journal = model.FindObject("Jounal", frmJouralList.Result)
    Dim f As frmJournalShow
    Set f = New frmJournalShow
    Set f.jv.journal = journal
    f.Caption = journal.Name
    f.Show
    f.jv.Refresh
  End If
End Sub

Private Sub mnuSetupJ_Click()
  Set frmJouralList.model = model
  frmJouralList.Show vbModal
  If frmJouralList.OK Then
    Set journal = model.FindObject("Jounal", frmJouralList.Result)
  End If

  Set frmJournalConfig.JournalDef1.model = model
  Set frmJournalConfig.JournalDef1.journal = journal
  frmJournalConfig.Show vbModal
  Unload frmJournalConfig
End Sub

Private Sub Timer1_Timer()
On Error Resume Next: session.Exec "SessionTouch", Nothing
End Sub
