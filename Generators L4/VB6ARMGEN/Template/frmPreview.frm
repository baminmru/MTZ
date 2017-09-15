VERSION 5.00
Object = "{8767A745-088E-4CA6-8594-073D6D2DE57A}#9.2#0"; "crviewer9.dll"
Begin VB.Form frmReport 
   ClientHeight    =   6285
   ClientLeft      =   1650
   ClientTop       =   1545
   ClientWidth     =   8880
   Icon            =   "frmPreview.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6285
   ScaleWidth      =   8880
   ShowInTaskbar   =   0   'False
   Begin CRVIEWER9LibCtl.CRViewer9 CRViewer1 
      Height          =   6015
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   8295
      lastProp        =   500
      _cx             =   14631
      _cy             =   10610
      DisplayGroupTree=   0   'False
      DisplayToolbar  =   -1  'True
      EnableGroupTree =   -1  'True
      EnableNavigationControls=   -1  'True
      EnableStopButton=   0   'False
      EnablePrintButton=   -1  'True
      EnableZoomControl=   -1  'True
      EnableCloseButton=   0   'False
      EnableProgressControl=   0   'False
      EnableSearchControl=   0   'False
      EnableRefreshButton=   -1  'True
      EnableDrillDown =   0   'False
      EnableAnimationControl=   0   'False
      EnableSelectExpertButton=   0   'False
      EnableToolbar   =   -1  'True
      DisplayBorder   =   -1  'True
      DisplayTabs     =   0   'False
      DisplayBackgroundEdge=   0   'False
      SelectionFormula=   ""
      EnablePopupMenu =   0   'False
      EnableExportButton=   -1  'True
      EnableSearchExpertButton=   0   'False
      EnableHelpButton=   0   'False
      LaunchHTTPHyperlinksInNewBrowser=   -1  'True
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

Private Sub Form_Resize()
    On Error Resume Next
    CRViewer1.Top = 0
    CRViewer1.Left = 0
    CRViewer1.Height = Me.ScaleHeight
    CRViewer1.Width = Me.ScaleWidth
End Sub



