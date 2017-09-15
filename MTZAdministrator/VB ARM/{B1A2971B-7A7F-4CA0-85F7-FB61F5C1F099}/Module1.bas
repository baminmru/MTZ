Attribute VB_Name = "Module1"
Option Explicit
Public Manager As MTZManager.Main
Public Session As MTZSession.Session
Public UsersID As String
Public UserName As String
Public UserPassword As String
Public PrivateStoreID As String
Public SysStoreID As String
Public Site As String
Public LastChat As Date
Public NextReminder As Date
Public DeltaReminder As String
Public usr As MTZUsers.Application
Public MyUser As MTZUsers.Users











Sub Main()
Dim par() As String
Dim i As Long
Dim tst As Long
Dim UserPassword As String
Set Manager = New MTZManager.Main

tst = 0
  If Command$ <> "" Then
        par() = Split(Command, " ")
        For i = LBound(par) To UBound(par)
          If UCase(Left(par(i), 4)) = "USR:" Then
            UserName = Right(par(i), Len(par(i)) - 4)
            tst = tst + 1
          End If
          
          If UCase(Left(par(i), 4)) = "PWD:" Then
            UserPassword = Right(par(i), Len(par(i)) - 4)
            tst = tst + 1
          End If
          
          If UCase(Left(par(i), 4)) = "APP:" Then
            Site = Right(par(i), Len(par(i)) - 4)
            tst = tst + 1
          End If

        Next
        If tst = 3 Then
          Set Session = Manager.GetSession(Site)
          If Session Is Nothing Then
            GoTo useForm
          End If
          
          If Not Session.Login(UserName, UserPassword) Then
            Set Session = Nothing
            GoTo useForm
          End If
        Else
         GoTo useForm
        End If
  Else
  
useForm:
    Dim f As frmLogin
    Set f = New frmLogin

again:
    Set Session = Nothing
    Set Manager = Nothing
    Set Manager = New MTZManager.Main
    
    f.Show vbModal
    If Not f.OK Then
      Unload f
      Set f = Nothing
      Set Manager = Nothing
      Exit Sub
    End If
    Site = f.txtSite
    
    Set Session = Manager.GetSession(Site)
    If Session Is Nothing Then
      MsgBox "Ќе определен сайт с таким именем", vbCritical, "ќшибка"
      GoTo again
    End If
    
    
    
    If Not Session.Login(f.txtUserName, f.txtPassword) Then
      Set Session = Nothing
      MsgBox "Ќеверные данные регистрации", vbCritical, "ќшибка"
      GoTo again
    End If
    UserName = f.txtUserName
    UserPassword = f.txtPassword
    Unload f
    Set f = Nothing
 
 End If
 
  
  Dim rs As ADODB.Recordset
  Set rs = Manager.ListInstances(Site, "MTZUsers")
  Set usr = Manager.GetInstanceObject(rs!InstanceID)
  Manager.LockInstanceObject usr.ID
  
  
  Set rs = Nothing
  Set MyUser = usr.FindRowObject("Users", Session.GetSessionUserID())
  Set rs = Nothing
  
  Set MyRole = ChooseRole()
  If MyRole Is Nothing Then
      Session.Logout
     Set Manager = Nothing
     Exit Sub
  End If
  
  Manager.LockInstanceObject MyRole.ID
  
  frmSplash.Show
  frmSplash.lblWarning = "«агрузка умолчаний"
  DoEvents
  
   
  
  Dim orgid As String
  
    
   
  frmSplash.lblWarning = "«агрузка лицензий"
  DoEvents
  On Error Resume Next
   Dim intFile As Integer
   intFile = FreeFile
   Open App.Path & "\Licenses.txt" For Input As #intFile
   Dim strKey As String, strprogid As String
   ' On the client machine, read the license key from the file.
   
   
   While Not EOF(intFile)
    strprogid = ""
    strKey = ""
    Input #intFile, strprogid, strKey
    If strprogid <> "" Then
      Licenses.Add strprogid, strKey
    Else
      GoTo closefile
    End If
   Wend

closefile:
   Close #intFile
   
   
  frmSplash.lblWarning = "ѕодключение документов"
  DoEvents
  
  RegisterMDIGUI
  
  frmSplash.lblWarning = "»нициализаци€ меню"
  DoEvents
  Load frmMain
  
  Unload frmSplash
  
  frmMain.Show
  
End Sub


Public Sub PrintGrid(gr As Object)
  
  Dim R As RECT
  Dim ph As Long, pw As Long
  Dim i As Long, j As Long
  Dim ColPerPage() As Long, HorPages As Long, curw As Long
  Dim CurRow As Long, CurCol As Long, FirstRow As Long, CellTop As Long
  Dim dx As Double, dy As Double, pcnt As Long

  ph = Printer.ScaleHeight - 1000
  pw = Printer.ScaleWidth - 200
  dx = 1.1
  dy = 1.1
  pcnt = 0

  ' считаем сколько страниц надо по ширине
  curw = 0
  HorPages = 1
  ReDim ColPerPage(HorPages)
  ColPerPage(HorPages) = 0
  For i = 0 To gr.Cols - 1
    If gr.ColWidth(i) > 0 Then curw = curw + gr.ColWidth(i) * dx

    ' ширина превысила размер страницы
    If curw > pw Then
      HorPages = HorPages + 1
      ReDim Preserve ColPerPage(HorPages)
      ColPerPage(HorPages) = IIf(i - 1 < 1, 1, i - 1)
      curw = gr.ColWidth(i) * dx
    End If

    ' если колонка очень широка€ то запихаем ее в отдельную страницу
    If i > 0 And curw > pw Then
      HorPages = HorPages + 1
      ReDim Preserve ColPerPage(HorPages)
      ColPerPage(HorPages) = i
      curw = 0
    End If
  Next
  ReDim Preserve ColPerPage(HorPages + 1)
  ColPerPage(HorPages + 1) = gr.Cols

  CurCol = 0
  CurRow = 0
  FirstRow = 0
  Printer.Font.Name = gr.Font.Name
  Printer.Font.Bold = gr.Font.Bold
  Printer.Font.Charset = gr.Font.Charset
  Printer.Font.Italic = gr.Font.Italic
  Printer.Font.Strikethrough = gr.Font.Strikethrough
  Printer.Font.Underline = gr.Font.Underline
  Printer.Font.Weight = gr.Font.Weight
  Printer.Font.Size = gr.Font.Size

  ' цикл по вертикальным блокам
  While FirstRow < gr.Rows

    ' √оризонтальный блок страниц
    For i = 1 To HorPages
      curw = 0

      ' колонки дл€ каждой из страниц
      For j = ColPerPage(i) To ColPerPage(i + 1) - 1

        ' только видимые колонки
        If gr.ColWidth(j) > 0 Then
          CellTop = 0
          CurRow = FirstRow

          ' ограничение по высоте листа
          While CellTop <= ph

              ' не проходим по высоте листа
              If CellTop + gr.RowHeight(CurRow) * dy > ph Then
                If gr.RowHeight(CurRow) * dy > ph Then
                  ' если высота колонки очень велика то мен€ем ее на меньшую
                  gr.RowHeight(CurRow) = ph / dy
                  GoTo nxtcol
                Else
                  GoTo nxtcol
                End If
              End If

              ' пересчитываем пр€моугольник дл€ отрисовки текста
              R.Left = curw / Printer.TwipsPerPixelX + 2
              R.Right = IIf((curw + gr.ColWidth(j) * dx) > pw, pw, curw + gr.ColWidth(j) * dx) _
                / Printer.TwipsPerPixelX - 2
              R.Top = CellTop / Printer.TwipsPerPixelY + 2
              R.Bottom = (CellTop + gr.RowHeight(CurRow) * dy) / Printer.TwipsPerPixelY - 2

              ' ѕервую строку отдел€ем жирной линией
              If CurRow = 0 Then
                Printer.Line (curw, (CellTop + gr.RowHeight(CurRow) * dy) - 20)- _
                  (IIf((curw + gr.ColWidth(j) * dx) > pw, pw, curw + gr.ColWidth(j) * dx), _
                  (CellTop + gr.RowHeight(CurRow) * dy)), , BF
              End If


              ' выводим рамочку
              Printer.Line (curw, CellTop)- _
                (IIf((curw + gr.ColWidth(j) * dx) > pw, pw, curw + gr.ColWidth(j) * dx), _
                (CellTop + gr.RowHeight(CurRow) * dy)), , B


              ' выводим текст в пр€моугольную область (с переносом слов)
              DrawText Printer.hdc, gr.TextMatrix(CurRow, j), Len(gr.TextMatrix(CurRow, j)), R, &H10 + &H100

              ' измен€ем позицию дл€ следующей строки
              CellTop = CellTop + gr.RowHeight(CurRow) * dy

              ' готовимс€ к следующей сторке
              CurRow = CurRow + 1
              If CurRow >= gr.Rows Then GoTo nxtcol

          Wend
nxtcol:
          ' учитываем ширину и переходим к следующей колонке
          curw = curw + gr.ColWidth(j) * dx
        End If
      Next ' цикл по колонкам


      ' печатаем номер страницы
      Printer.Line (0, ph - 20)-(Printer.ScaleWidth, ph), , B
      Printer.CurrentX = Printer.ScaleWidth / 3
      Printer.CurrentY = ph + 100
      pcnt = pcnt + 1
      Printer.Print "—траница є" & pcnt
      ' не отбиваем страницу после последнего листа
      If CurRow < gr.Rows Or i < HorPages Then Printer.NewPage
    Next
    ' готовимс€ к новому блоку горизонтальных страниц
    FirstRow = CurRow
  Wend
  Printer.EndDoc
End Sub






Private Sub RegisterMDIGUI()
 Dim g As GUI
Set g = New GUI
g.Init "dict"
Manager.RegisterGUI g, "dict"
Set g = New GUI
g.Init "hw1"
Manager.RegisterGUI g, "hw1"

End Sub



