VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Response"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 680
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
'local variable(s) to hold property value(s)

'local variable(s) to hold property value(s)
Private mvarCurrentBlock As BlockHolder 'local copy
Private mvarPrj As ProjectHolder
'local variable(s) to hold property value(s)
Private mvarCurrentModule As String 'local copy
Private mvarBlock As String 'local copy
Public Event OnExec(s As String)
Attribute OnExec.VB_HelpID = 740
Public Event OnStatus(s As String, progress As Long)

'Parameters:
'[IN]   s , тип параметра: String  - ...
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
'  call me.Exec(<параметры>)
Public Sub Exec(ByVal s As String)
Attribute Exec.VB_HelpID = 710
  RaiseEvent OnExec(s)
End Sub

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
' dim value as Variant
' value = <значение>
' me.Block = value
Public Property Let Block(ByVal vData As String)
Attribute Block.VB_HelpID = 685

    On Error Resume Next
    If mvarBlock <> "" And mvarCurrentModule <> "" Then
      CurrentBlock.Flush
    End If
    
    mvarBlock = vData
    If Module = "" Then
      Module = "Module1"
    End If
    If Project.Modules.Item(Module).Blocks(vData) Is Nothing Then
      Project.Modules.Item(Module).Blocks.Add vData
    End If
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
' dim variable as String
' variable = me.Block
Public Property Get Block() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Block
    Block = mvarBlock
End Property

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
' dim value as Variant
' value = <значение>
' me.Module = value
Public Property Let Module(ByVal vData As String)
Attribute Module.VB_HelpID = 735
    On Error Resume Next
    If mvarBlock <> "" And mvarCurrentModule <> "" Then
      CurrentBlock.Flush
    End If
    mvarCurrentModule = vData
    If Project.Modules.Item(mvarCurrentModule) Is Nothing Then
      Project.Modules.Add mvarCurrentModule
    End If
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
' dim variable as String
' variable = me.Module
Public Property Get Module() As String
    Module = mvarCurrentModule
End Property





Private Property Get mvarCode() As String
  If CurrentBlock Is Nothing Then
    mvarCode = ""
  Else
    mvarCode = CurrentBlock.BlockCode
  End If
End Property

Private Property Let mvarCode(v As String)
  If Not CurrentBlock Is Nothing Then
    CurrentBlock.BlockCode = v
  End If
End Property


Private Property Let AppendCode(v As String)
  If Not CurrentBlock Is Nothing Then
    CurrentBlock.AppendCode v
  End If
End Property

'Parameters:
' параметров нет
'Returns:
'  объект класса BlockHolder
'  ,или Nothing
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
' dim variable as BlockHolder
' Set variable = me.CurrentBlock
Public Property Get CurrentBlock() As BlockHolder
Attribute CurrentBlock.VB_HelpID = 705
    If Block = "" Then
      Block = "Block1"
    End If
    Set CurrentBlock = Project.Modules(Module).Blocks(Block)
End Property

'Parameters:
' параметров нет
'Returns:
'  объект класса ProjectHolder
'  ,или Nothing
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  RemoveLine
'  Save
'Example:
' dim variable as ProjectHolder
' Set variable = me.Project()
Public Function Project() As ProjectHolder
Attribute Project.VB_HelpID = 755
    If mvarPrj Is Nothing Then
      Set mvarPrj = New ProjectHolder
    End If
    Set Project = mvarPrj
End Function

'Parameters:
' параметров нет
'Returns:
'  объект класса String()
'  ,или Nothing
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
' dim variable as String()
' Set variable = me.Lines
Public Property Get Lines() As String()
Attribute Lines.VB_HelpID = 725
  Dim l() As String
  l = Split(mvarCode, vbCrLf)
  Lines = l
End Property

'Parameters:
'[IN]   at , тип параметра: String  - ...
'Returns:
'  значение типа String
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
' dim variable as String
' variable = me.Line(<параметры>)
Public Property Get Line(ByVal at As String) As String
Attribute Line.VB_HelpID = 720
  Dim l() As String
  l = Split(mvarCode, vbCrLf)
  Line = l(at)
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'  Block
'  Clear
'  Code
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
' dim variable as Long
' variable = me.CountOfLines
Public Property Get CountOfLines() As Long
Attribute CountOfLines.VB_HelpID = 700
Dim l() As String

If mvarCode <> "" Then
  l = Split(mvarCode, vbCrLf)
  CountOfLines = UBound(l) + 1
Else
  CountOfLines = 0
End If
End Property

'Parameters:
'[IN]   s , тип параметра: String,
'[IN]   at , тип параметра: Long  - ...
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
'  call me.InsertLines(<параметры>)
Public Sub InsertLines(ByVal s As String, ByVal at As Long)
Attribute InsertLines.VB_HelpID = 715
  Dim l() As String, o As String, i As Long
  l = Split(mvarCode, vbCrLf)
  o = ""
  For i = 0 To at
    If i <= UBound(l) Then
      If o <> "" Then
        o = o & vbCrLf
      End If
      o = o & l(i)
    End If
  Next
  If o <> "" Then
    o = o & vbCrLf
  End If
  o = o & s
  For i = at + 1 To UBound(l)
    If o <> "" Then
      o = o & vbCrLf
    End If
    o = o & l(i)
  Next
  mvarCode = o
End Sub

'Parameters:
'[IN]   at , тип параметра: Long  - ...
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  Save
'Example:
'  call me.RemoveLine(<параметры>)
Public Sub RemoveLine(ByVal at As Long)
Attribute RemoveLine.VB_HelpID = 760
  Dim l() As String, o As String, i As Long
  l = Split(mvarCode, vbCrLf)
  o = ""
  For i = 0 To UBound(l)
    If i <> at Then
      If o <> "" Then
        o = o & vbCrLf
      End If
      o = o & l(i)
    End If
  Next
  mvarCode = o
End Sub

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  Block
'  Clear
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
' dim value as Variant
' value = <значение>
' me.Code = value
Public Property Let Code(ByVal vData As String)
Attribute Code.VB_HelpID = 695
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Code = 5
    mvarCode = vData
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Block
'  Clear
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
' dim variable as String
' variable = me.Code
Public Property Get Code() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Code
    Code = mvarCode
End Property

'Parameters:
' параметров нет
'See Also:
'  Block
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
'  call me.Clear()
Public Sub Clear()
Attribute Clear.VB_HelpID = 690
  mvarCode = ""
End Sub

'Parameters:
'[IN]   Text , тип параметра: String  - ...
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
'  call me.Out(<параметры>)
Public Sub Out(ByVal Text As String)
Attribute Out.VB_HelpID = 745
  AppendCode = Text
End Sub

'Parameters:
'[IN]   Text , тип параметра: String  - ...
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  Project
'  RemoveLine
'  Save
'Example:
'  call me.OutNL(<параметры>)
Public Sub OutNL(ByVal Text As String)
Attribute OutNL.VB_HelpID = 750
  AppendCode = Text & vbCrLf
End Sub

Private Sub Class_Terminate()
  Set mvarCurrentBlock = Nothing
  Set mvarPrj = Nothing
End Sub

'Parameters:
'[IN]   path , тип параметра: String  - ...
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'  Save
'Example:
'  call me.Load(<параметры>)
Public Sub Load(ByVal path As String)
Attribute Load.VB_HelpID = 730
  Project.Load path
End Sub

'Parameters:
'[IN]   path , тип параметра: String  - ...
'See Also:
'  Block
'  Clear
'  Code
'  CountOfLines
'  CurrentBlock
'  Exec
'  InsertLines
'  Line
'  Lines
'  Load
'  Module
'  OnExec
'  Out
'  OutNL
'  Project
'  RemoveLine
'Example:
'  call me.Save(<параметры>)
Public Sub Save(ByVal path As String)
Attribute Save.VB_HelpID = 765
  Project.Save path
End Sub
 Public Sub Status(ByVal msg As String, ByVal pos As Long)
  On Error Resume Next
  RaiseEvent OnStatus(msg, pos)
 End Sub

