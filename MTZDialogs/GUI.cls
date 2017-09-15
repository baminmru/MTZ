VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GUI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
'
' Ѕиблиотека поиска объектов с графичеким интерфейсом.
' ѕереработана из ћишиного EXE модул€ MTZFind
' Ќачало работы 11 сент€бр€ 2002 года.
'  оломийцев ƒенис aka BeerDrinker.
'
' " ак платил Ќезнайка за свою свободу,
'  что скрывал последний свой патрон.....
'  ...Ёто знает мо€ свобода, это знает мо€ свобода,
'  это знает моЄ поражение, это знает моЄ торжество..."
'

Private m_Session As MTZSession.Session
Private m_Site As String
Private m_MTZMetaModel As MTZMetaModel.Application
Private m_Manager As Object

Public Sub Init(oSession As MTZSession.Session, oMTZMetaModel As MTZMetaModel.Application, oManager As Object)
  Set m_Session = oSession
  Set m_MTZMetaModel = oMTZMetaModel
  Set m_Manager = oManager
End Sub

Public Function GetFindForm(Optional ByVal Site As String = "", Optional ByVal TypeName As String = "") As Object
  Dim frm As frmMain
  
  m_Site = Site
  If Not (m_Session Is Nothing) And Not (m_MTZMetaModel Is Nothing) Then
    Set frm = New frmMain
    frm.TypeName = TypeName
    Set frm.Application = Me
    Set frm.Model = m_MTZMetaModel
    Set GetFindForm = frm
  Else
    Set GetFindForm = Nothing
  End If
End Function


Public Function GetFullTextFindForm(Optional ByVal Site As String = "", Optional ByVal Filter As String = "") As Object
  Dim frm As frmFullText
  
  m_Site = Site
  If Not (m_Session Is Nothing) And Not (m_MTZMetaModel Is Nothing) Then
    Set frm = New frmFullText
    Set frm.Application = Me
    frm.txtQuery.Text = Filter
    Set frm.Model = m_MTZMetaModel
    Set GetFullTextFindForm = frm
  Else
    Set GetFullTextFindForm = Nothing
  End If
End Function



Public Function IsUnary(ByVal op As FinderOP) As Boolean
  Select Case op
  Case OpNOT_NULL
    IsUnary = True
  Case OpNULL
    IsUnary = True
  Case OpRIGHT_BRACKET
    IsUnary = True
  Case OpLEFT_BRACKET
    IsUnary = True
  Case Else
    IsUnary = False
  End Select
End Function

Public Function IsArgArray(ByVal op As FinderOP) As Boolean
  Select Case op
  Case OpIN_DATES
    IsArgArray = True
  Case OpIN_NUMBERS
    IsArgArray = True
  Case OpIN_STRINGS
    IsArgArray = True
    Case OpNOT_IN_DATES
    IsArgArray = True
  Case OpNOT_IN_NUMBERS
    IsArgArray = True
  Case OpNOT_IN_STRINGS
    IsArgArray = True
  Case Else
    IsArgArray = False
  End Select
End Function


Public Function Op2Code(ByVal s As String) As FinderOP
  Dim op As FinderOP
    Select Case LCase(s)
    Case "равно"
      op = OpEQ
    Case "не равно"
      op = OpNE
    Case "меньше или равно"
        op = OpLE
    Case "меньше"
    op = OpLT
    Case "больше или равно"
        op = OpGE
    Case "больше"
        op = OpGT
    Case "включает значение"
        op = OpLIKE
    Case "поле содержит пустое значение"
        op = OpNULL
    Case "поле содержит не пустое значение"
        op = OpNOT_NULL
    Case "строка начинаетс€ со значени€"
      op = OpLIKE_LEFT
    Case "строка заканчиваетс€ значением"
    op = OpLIKE_RIGHT
    Case "строка соответствует маске"
    op = OpLIKE_EXACT
    Case "равно строковому значению"
    op = OpSTR_EQ
    Case "не равно строковому значению"
    op = OpSTR_NE
    Case "меньше строкового значени€"
    op = OpSTR_LT
    Case "меньше или равно строкового значени€"
    op = OpSTR_LE
    Case "больше или равно строкового значени€"
      op = OpSTR_GE
    Case "больше или равно строкового значени€"
      op = OpSTR_GT
    Case "значение входит в множество чисел"
      op = OpIN_NUMBERS
    Case "значение входит в множество дат"
      op = OpIN_DATES
    Case "значение входит в множество строк"
      op = OpIN_STRINGS
    Case "значение не входит в множество чисел"
      op = OpNOT_IN_NUMBERS
    Case "значение не входит в множество дат"
      op = OpNOT_IN_DATES
    Case "значение не входит в множество строк"
      op = OpNOT_IN_STRINGS
    Case "("
      op = OpLEFT_BRACKET
    Case ")"
      op = OpRIGHT_BRACKET
  End Select
  Op2Code = op
End Function

Public Sub SyncCombo(C As Object, ByVal s As String)
 On Error GoTo sErr
    Dim i As Long
    For i = 0 To C.ListCount - 1
        If Left(Trim(C.List(i)), Len(Trim(s))) = Trim(s) Then
            C.ListIndex = i
            Exit Sub
        End If
    Next i
    Exit Sub
sErr:
    
End Sub


Public Property Get Site() As String
  Site = m_Site
End Property

Public Property Get Manager() As Object
  Set Manager = m_Manager
End Property

Public Property Get Session() As MTZSession.Session
  Set Session = m_Session
End Property

Public Property Get MetaModel() As MTZMetaModel.Application
  Set MetaModel = m_MTZMetaModel
End Property

Private Sub Class_Terminate()
  Call CloseClass
End Sub

Public Sub CloseClass()
  Set m_Session = Nothing
  Set m_MTZMetaModel = Nothing
End Sub
