VERSION 5.00
Object = "{C4847593-972C-11D0-9567-00A0C9273C2A}#8.0#0"; "crviewer.dll"
Begin VB.Form frmReport 
   ClientHeight    =   6285
   ClientLeft      =   1650
   ClientTop       =   1545
   ClientWidth     =   8880
   Icon            =   "frmReport.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6285
   ScaleWidth      =   8880
   ShowInTaskbar   =   0   'False
   Begin CRVIEWERLibCtl.CRViewer CRViewer1 
      Height          =   6015
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   8655
      DisplayGroupTree=   0   'False
      DisplayToolbar  =   -1  'True
      EnableGroupTree =   0   'False
      EnableNavigationControls=   -1  'True
      EnableStopButton=   -1  'True
      EnablePrintButton=   -1  'True
      EnableZoomControl=   -1  'True
      EnableCloseButton=   -1  'True
      EnableProgressControl=   -1  'True
      EnableSearchControl=   -1  'True
      EnableRefreshButton=   -1  'True
      EnableDrillDown =   0   'False
      EnableAnimationControl=   0   'False
      EnableSelectExpertButton=   0   'False
      EnableToolbar   =   -1  'True
      DisplayBorder   =   0   'False
      DisplayTabs     =   0   'False
      DisplayBackgroundEdge=   0   'False
      SelectionFormula=   ""
      EnablePopupMenu =   0   'False
      EnableExportButton=   -1  'True
      EnableSearchExpertButton=   0   'False
      EnableHelpButton=   0   'False
   End
End
Attribute VB_Name = "frmReport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Private Sub Form_QueryUnload(cancel As Integer, UnloadMode As Integer)
  If UnloadMode = vbFormMDIForm Or UnloadMode = vbFormCode Or UnloadMode = vbAppWindows Or UnloadMode = vbAppTaskManager Then
    cancel = False
  Else
    cancel = True
    Me.Hide
  End If

End Sub

Private Sub form_resize()
    On Error Resume Next
    CRViewer1.Top = 0
    CRViewer1.Left = 0
    CRViewer1.Height = Me.ScaleHeight
    CRViewer1.Width = Me.ScaleWidth
End Sub



