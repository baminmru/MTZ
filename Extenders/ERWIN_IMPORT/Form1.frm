VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6915
   LinkTopic       =   "Form1"
   ScaleHeight     =   3600
   ScaleWidth      =   6915
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtSite 
      Height          =   315
      Left            =   2520
      TabIndex        =   10
      Text            =   "test"
      Top             =   1920
      Width           =   3735
   End
   Begin VB.TextBox txtPassword 
      Height          =   300
      Left            =   2520
      TabIndex        =   6
      Top             =   1530
      Width           =   3720
   End
   Begin VB.TextBox txtUser 
      Height          =   285
      Left            =   2535
      TabIndex        =   5
      Text            =   "supervisor"
      Top             =   1080
      Width           =   3720
   End
   Begin VB.TextBox txtType 
      Height          =   285
      Left            =   2505
      TabIndex        =   3
      Text            =   "ERWIN"
      Top             =   570
      Width           =   3750
   End
   Begin VB.TextBox txtPath 
      Height          =   300
      Left            =   2520
      TabIndex        =   2
      Top             =   120
      Width           =   3720
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Загрузить"
      Height          =   390
      Left            =   195
      TabIndex        =   0
      Top             =   2535
      Width           =   2130
   End
   Begin VB.Label Label5 
      Caption         =   "Сайт"
      Height          =   255
      Left            =   165
      TabIndex        =   9
      Top             =   1950
      Width           =   2325
   End
   Begin VB.Label Label4 
      Caption         =   "Пароль"
      Height          =   285
      Left            =   195
      TabIndex        =   8
      Top             =   1545
      Width           =   2205
   End
   Begin VB.Label Label3 
      Caption         =   "Пользователь"
      Height          =   225
      Left            =   195
      TabIndex        =   7
      Top             =   1170
      Width           =   1860
   End
   Begin VB.Label Label2 
      Caption         =   "Тип для загрузки"
      Height          =   285
      Left            =   225
      TabIndex        =   4
      Top             =   570
      Width           =   2010
   End
   Begin VB.Label Label1 
      Caption         =   "Путь к файлу"
      Height          =   285
      Left            =   270
      TabIndex        =   1
      Top             =   150
      Width           =   2040
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim doc As MSXML2.DOMDocument
Dim man As MTZManager.Main
Dim sess As MTZSession.Session
Dim mdl As MTZMetaModel.Application

Private Sub Command1_Click()
  Set doc = New DOMDocument
  doc.Load txtPath.Text
  Set man = New MTZManager.Main
  Set sess = man.GetSession(txtSite.Text)
  sess.Login txtUser.Text, txtPassword.Text
  If sess.sessionid = "" Then Exit Sub
  Dim rs As ADODB.Recordset, id As String
  
  Set rs = man.ListInstances("", "MTZMetamodel")
  id = rs!InstanceID
  Set mdl = man.GetInstanceObject(id)
  Dim pkg As MTZAPP, i As Long, ot As OBJECTTYPE
  Set pkg = Nothing
  For i = 1 To mdl.MTZAPP.Count
    If mdl.MTZAPP.Item(i).Name = "ERWIN" Then
      Set pkg = mdl.MTZAPP.Item(i)
      Exit For
    End If
  Next
  If pkg Is Nothing Then
    Set pkg = mdl.MTZAPP.Add
    With pkg
      .Name = "ERWIN"
      .Save
    End With
  End If
  
  For i = 1 To mdl.OBJECTTYPE.Count
    If UCase(mdl.OBJECTTYPE.Item(i).Name) = UCase(txtType.Text) Then
      Set ot = mdl.OBJECTTYPE.Item(i)
      Exit For
    End If
  Next
  If ot Is Nothing Then
    Set ot = mdl.OBJECTTYPE.Add
    With ot
      If txtType.Text <> "" Then
        .Name = txtType.Text
      Else
        .Name = "ERWIN"
      End If
      
      .the_comment = "Экспорт из модели ERWIN"
      Set .Package = pkg
      .Save
    End With
  End If
  
  
  Dim NodeList As IXMLDOMNodeList
  Dim AGNL As IXMLDOMNodeList
  Dim AttrNL As IXMLDOMNodeList
  Dim EPNL As IXMLDOMNodeList
  Dim node As IXMLDOMElement
  Dim pnode As IXMLDOMElement
  Dim epnode As IXMLDOMElement
  Dim agnode As IXMLDOMElement
  Dim anode As IXMLDOMElement
  Dim apnode As IXMLDOMElement
  Dim p As MTZMetaModel.PART
  Dim f As MTZMetaModel.Field
  
  
  Set NodeList = doc.lastChild.firstChild.selectNodes("Entity_Groups")
  On Error Resume Next
 
  
  
  
  
  NodeList.Reset
  
  Set pnode = NodeList.nextNode
  Set NodeList = pnode.selectNodes("Entity")
  Set node = NodeList.nextNode
  
  ' создаем все разделы в документе
  While Not node Is Nothing
  
    Set p = Nothing
    Set p = ot.PART.Item(Left(node.getAttribute("id"), 38))
    If p Is Nothing Then
      Set p = ot.PART.Add(Left(node.getAttribute("id"), 38))
    End If
    
    
    'Set attr = node.getAttribute("Name")
    Debug.Print node.getAttribute("Name")
    Debug.Print node.getAttribute("id")
    
    ' сканируем свойства
    Set epnode = node.firstChild
'    epnode.selectNodes("Name").nextNode.nodeValue
'    epnode.selectNodes("Phisical_Name").nextNode.nodeValue
'    epnode.selectNodes ("Name")
'    epnode.getAttribute ("Phisical_Name")
    If epnode.selectNodes("Physical_Name").length = 0 Then
    
      p.Name = ot.Name & "Part_" & ot.PART.Count
    Else
      p.Name = ot.Name & epnode.selectNodes("Physical_Name").nextNode.nodeTypedValue
    End If
    If epnode.selectNodes("Name").length = 0 Then
      p.Caption = p.Name
    Else
      p.Caption = epnode.selectNodes("Name").nextNode.nodeTypedValue
    End If
    p.the_comment = p.Caption
    p.PartType = PartType_Kollekciy
    p.sequence = ot.PART.Count
    p.Save
    
    Set AGNL = node.selectNodes("Attribute_Groups")
    Set agnode = AGNL.nextNode
    Set AttrNL = agnode.selectNodes("Attribute")
    Set anode = AttrNL.nextNode
    Dim skipit As Boolean
    While Not anode Is Nothing
      Set apnode = anode.firstChild
      skipit = False
      
      ' пропускаем идентификаторы таблиц
      If apnode.selectNodes("Type").length = 0 Then
        skipit = False
      Else
        If apnode.selectNodes("Type").nextNode.nodeTypedValue = 0 Then
          skipit = True
        Else
          skipit = False
        End If
      End If
      If Not skipit Then
        Set f = Nothing
        Set f = p.Field.Item(Left(anode.getAttribute("id"), 38))
        If f Is Nothing Then
          Set f = p.Field.Add(Left(anode.getAttribute("id"), 38))
        End If
        If apnode.selectNodes("Null_Option").length = 0 Then
          f.AllowNull = Boolean_Da
        Else
          If apnode.selectNodes("Null_Option").nextNode.nodeTypedValue = 0 Then
            f.AllowNull = Boolean_Net
          Else
            f.AllowNull = Boolean_Da
          End If
        End If
        
        If apnode.selectNodes("Physical_Name").length = 0 Then
          If apnode.selectNodes("DB_Name").length = 0 Then
            f.Name = "Field_" & p.Field.Count
          Else
            f.Name = apnode.selectNodes("DB_Name").nextNode.nodeTypedValue
          End If
        Else
          f.Name = apnode.selectNodes("Physical_Name").nextNode.nodeTypedValue
        End If
        
        If apnode.selectNodes("Definition").length = 0 Then
          If apnode.selectNodes("Name").length = 0 Then
            f.Caption = f.Name
          Else
            f.Caption = apnode.selectNodes("Name").nextNode.nodeTypedValue
          End If
          
        Else
          f.Caption = apnode.selectNodes("Definition").nextNode.nodeTypedValue
        End If
        If apnode.selectNodes("Datatype").length = 0 Then
          SetFT "ID", f
        Else
         SetFT apnode.selectNodes("Datatype").nextNode.nodeTypedValue, f
         Debug.Print apnode.selectNodes("Datatype").nextNode.nodeTypedValue
        End If
        If f.FIELDTYPE Is Nothing Then
         Stop
        End If
        f.sequence = p.Field.Count
        f.Save
      End If
      Set anode = AttrNL.nextNode
    Wend
    Set node = NodeList.nextNode
  Wend
  
  'пробуем обработать ссылки
   Set NodeList = doc.lastChild.firstChild.selectNodes("Relationship_Groups")
   Set node = NodeList.nextNode
   Set NodeList = node.selectNodes("Relationship")
   Dim pid As String
   Dim cid As String
   Dim fid As String
   Dim cp As PART
   Set node = NodeList.nextNode
   While Not node Is Nothing
     Set anode = node.firstChild
     fid = Left(node.getAttribute("id"), 38)
     pid = Left(anode.selectNodes("Relationship_Parent_Entity").nextNode.nodeTypedValue, 38)
     cid = Left(anode.selectNodes("Relationship_Child_Entity").nextNode.nodeTypedValue, 38)
     Set p = ot.PART.Item(pid)
     Set cp = ot.PART.Item(cid)
     If Not p Is Nothing And Not cp Is Nothing Then
      Set f = cp.Field.Add(fid)
      SetFT "Reference", f
      f.ReferenceType = ReferenceType_Na_stroku_razdela
      Set f.RefToPart = p
      f.Name = "Ref" & p.Name
      f.Caption = p.Caption
      f.AllowNull = Boolean_Da
      f.sequence = cp.Field.Count
      f.Save
     
     End If
    
    
     Set node = NodeList.nextNode
   Wend
   
   
  
End Sub

Private Sub Form_Load()
  txtPath.Text = App.Path & "\model.xml"
  
End Sub


Private Sub SetFT(ByVal s As String, fld As MTZMetaModel.Field)
Dim arr() As String
Dim ft As FIELDTYPE
Dim sz As Long

  arr = Split(s, "(")
  Select Case UCase(arr(0))
  
  Case "DATE"
  Set ft = FindFT("DATE")
  
  Case "DATETIME"
  Set ft = FindFT("DATETIME")
  
  Case "TIME"
  Set ft = FindFT("TIME")
  
  Case "INTEGER"
  Set ft = FindFT("INTEGER")
  
  Case "BIT"
  Set ft = FindFT("BOOLEAN")
  
  Case "SMALLINT"
  Set ft = FindFT("INTEGER")
  
  Case "INT"
  Set ft = FindFT("INTEGER")
  
  Case "VARCHAR2"
  Set ft = FindFT("String")
  
  Case "VARCHAR"
  Set ft = FindFT("String")
  
  Case "NUMERIC"
  Set ft = FindFT("Numeric")
  
  Case "NUMBER"
  Set ft = FindFT("Numeric")
  
  Case "MONEY"
  Set ft = FindFT("Numeric")
  
  Case "UNIQUEID"
  Set ft = FindFT("ID")
  
  Case "UNIQUEIDENTIFIER"
  Set ft = FindFT("ID")
  
  Case Else
  Set ft = FindFT(arr(0))
  If ft Is Nothing Then
    Set ft = FindFT("Memo")
  End If
  End Select
  Set fld.FIELDTYPE = ft
  On Error Resume Next
  sz = Val("0" & Replace(Replace(arr(1), ")", ""), "(", ""))
  If sz <> 0 Then
    fld.DataSize = sz
  End If
  
End Sub

Private Function FindFT(ByVal s As String) As FIELDTYPE
  Dim i As Long
  For i = 1 To mdl.FIELDTYPE.Count
    If UCase(mdl.FIELDTYPE.Item(i).Name) = UCase(s) Then
        Set FindFT = mdl.FIELDTYPE.Item(i)
        Exit Function
    End If
  Next
End Function
