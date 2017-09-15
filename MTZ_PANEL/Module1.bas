Attribute VB_Name = "Module1"
Attribute VB_HelpID = 340
Option Explicit

Public Type ctlDef
  Name As String
  HasIndex As Boolean
  Index As Long
  HasTS As Boolean
  ts As Boolean
  HasTI As Boolean
  ti As Long
  HasTag As Boolean
  Tag As String
  HasCaption As Boolean
  Caption As String
  L As Double
  T As Double
  W As Double
  H As Double
  Enabled As Boolean
  Visible As Boolean
End Type


Public Function LoadFromArray(arr() As ctlDef, sw As ScrolledWindow)
Attribute LoadFromArray.VB_HelpID = 355
  Dim ctl As Object, i As Long, j As Long
  On Error Resume Next
  i = 0
  If sw.PanelControls.Count = 0 Then Exit Function
  
  For Each ctl In sw.PanelControls
    For i = LBound(arr) To UBound(arr)
      If UCase(ctl.Name) = UCase(arr(i).Name) Then
        ctl.Left = arr(i).L + 5 * Screen.TwipsPerPixelX
        ctl.Top = arr(i).T + 5 * Screen.TwipsPerPixelY
        ctl.Width = arr(i).W - 10 * Screen.TwipsPerPixelX
        ctl.Height = arr(i).H - 10 * Screen.TwipsPerPixelX
        
        If arr(i).HasTS Then
          ctl.TabStop = arr(i).ts
        End If
        
        If arr(i).HasTI Then
          ctl.TabIndex = arr(i).ti
        End If
        
        If arr(i).HasCaption Then
          ctl.Caption = arr(i).Caption
        End If
        
        If arr(i).HasTag Then
          ctl.Tag = arr(i).Tag
        End If
        
        'ctl.Visible = arr(i).Visible
        'ctl.Enabled = arr(i).Enabled
        Exit For
      End If
    Next
  Next
End Function


Public Function ReadToArray(arr() As ctlDef, sw As ScrolledWindow)
Attribute ReadToArray.VB_HelpID = 360
Dim i As Long, ctl As Object, minx, miny
i = 0
On Error Resume Next
minx = -2 * Screen.TwipsPerPixelX
miny = -2 * Screen.TwipsPerPixelY
For Each ctl In sw.PanelControls
  If TypeOf ctl Is Line Then
    If minx > ctl.X1 Then minx = ctl.X1
    If minx > ctl.X2 Then minx = ctl.X2
    If miny > ctl.Y1 Then miny = ctl.Y1
    If miny > ctl.Y2 Then miny = ctl.Y2
  Else
    If minx > ctl.Left Then minx = ctl.Left
    If miny > ctl.Top Then miny = ctl.Top
  End If
Next

For Each ctl In sw.PanelControls
  i = i + 1
  With arr(i)
  
    .Name = ctl.Name
        
    Err.Clear
    .Tag = ctl.Tag
    If Err.Number = 438 Then
      .HasTag = False
      .Tag = ""
    Else
      .HasTag = True
    End If
    
    Err.Clear
    .Caption = ctl.Caption
    If Err.Number = 438 Then
      .HasCaption = False
      .Caption = ""
    Else
      .HasCaption = True
    End If
    
    
    
    Err.Clear
    .Index = ctl.Index
    If Err.Number = 438 Then
      .HasIndex = False
      .Index = -1
    Else
      .HasIndex = True
    End If
  
    Err.Clear
    .ts = ctl.TabStop
    If Err.Number = 438 Then
      .HasTS = False
      .ts = False
    Else
      .HasTS = True
    End If
    
    Err.Clear
    .ti = ctl.TabIndex
    If Err.Number = 438 Then
      .HasTI = False
      .ti = -1
    Else
      .HasTI = True
    End If
    
      If TypeOf ctl Is Line Then
        .T = -miny + ctl.Y1 - 5 * Screen.TwipsPerPixelY
        .L = -minx + ctl.X1 - 5 * Screen.TwipsPerPixelX
        .W = -minx + ctl.X2 + 10 * Screen.TwipsPerPixelX
        .H = -miny + ctl.Y2 + 10 * Screen.TwipsPerPixelY
      Else
        .T = -miny + ctl.Top - 5 * Screen.TwipsPerPixelY
        .W = ctl.Width + 10 * Screen.TwipsPerPixelX
        .L = -minx + ctl.Left - 5 * Screen.TwipsPerPixelX
        .H = ctl.Height + 10 * Screen.TwipsPerPixelY
      End If
      
'      If ctl.Visible = False Then
'      MsgBox "."
'      End If
    
    .Visible = ctl.Visible
    .Enabled = ctl.Enabled
    
  End With
Next
End Function


Private Function CatCR(ByVal s As String) As String
  CatCR = Replace(Replace(Replace(s, vbCrLf, "###"), vbCr, "###"), vbLf, "###")
End Function


Private Function RestoreCR(ByVal s As String) As String
  RestoreCR = Replace(s, "###", vbCrLf)
End Function


Public Function ArrToString(arr() As ctlDef) As String
Attribute ArrToString.VB_HelpID = 345
  Dim s As String, i As Long
  s = UBound(arr)
  For i = 1 To UBound(arr)
    With arr(i)
      s = s & vbCrLf & CatCR(.Name) 'String
      s = s & vbCrLf & CatCR(.HasIndex) 'Boolean
      s = s & vbCrLf & CatCR(.Index) 'Long
      s = s & vbCrLf & CatCR(.HasTS) 'Boolean
      s = s & vbCrLf & CatCR(.ts) 'Boolean
      s = s & vbCrLf & CatCR(.HasTI) 'Boolean
      s = s & vbCrLf & CatCR(.ti) 'Long
      s = s & vbCrLf & CatCR(.HasTag) 'Boolean
      s = s & vbCrLf & CatCR(.Tag) 'String
      s = s & vbCrLf & CatCR(.HasCaption) 'Boolean
      s = s & vbCrLf & CatCR(.Caption) 'String
      s = s & vbCrLf & CatCR(.L) 'Double
      s = s & vbCrLf & CatCR(.T)      'Double
      s = s & vbCrLf & CatCR(.W) 'Double
      s = s & vbCrLf & CatCR(.H) 'Double
      s = s & vbCrLf & CatCR(.Enabled) ' Boolean
      s = s & vbCrLf & CatCR(.Visible) ' Boolean
     End With
  Next
  s = s & vbCrLf
  s = s & vbCrLf
  s = s & vbCrLf
  ArrToString = s
End Function

Public Sub StringToArr(ByVal s As String, arr() As ctlDef)
Attribute StringToArr.VB_HelpID = 370
  Dim st() As String, i As Long, j As Long
  st = Split(s, vbCrLf)
  Erase arr
  ReDim arr(1 To Val(st(0)))
  j = 1
  For i = 1 To UBound(arr)
    With arr(i)
      .Name = RestoreCR(st(j)): j = j + 1
      .HasIndex = RestoreCR(st(j)): j = j + 1 'Boolean
      .Index = RestoreCR(st(j)): j = j + 1 'Long
      .HasTS = RestoreCR(st(j)): j = j + 1 'Boolean
      .ts = RestoreCR(st(j)): j = j + 1 'Boolean
      .HasTI = RestoreCR(st(j)): j = j + 1 'Boolean
      .ti = RestoreCR(st(j)): j = j + 1 'Long
      .HasTag = RestoreCR(st(j)): j = j + 1 'Boolean
      .Tag = RestoreCR(st(j)): j = j + 1 'String
      .HasCaption = RestoreCR(st(j)): j = j + 1 'Boolean
      .Caption = RestoreCR(st(j)): j = j + 1 'String
      .L = RestoreCR(st(j)): j = j + 1 'Double
      .T = RestoreCR(st(j)): j = j + 1 'Double
      .W = RestoreCR(st(j)): j = j + 1 'Double
      .H = RestoreCR(st(j)): j = j + 1 'Double
      .Enabled = RestoreCR(st(j)): j = j + 1 ' Boolean
      .Visible = RestoreCR(st(j)): j = j + 1 ' Boolean
    End With
  Next
End Sub


Public Function GetPanelStr(sw As ScrolledWindow) As String
Attribute GetPanelStr.VB_HelpID = 350
  Dim arr() As ctlDef
  ReDim arr(1 To sw.PanelControls.Count)
  ReadToArray arr, sw
  GetPanelStr = ArrToString(arr)
End Function


Public Sub SetPanelStr(ByVal s As String, sw As ScrolledWindow)
Attribute SetPanelStr.VB_HelpID = 365
  Dim arr() As ctlDef
  StringToArr s, arr
  LoadFromArray arr, sw
End Sub




