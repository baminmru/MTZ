Option Strict Off
Option Explicit On
Friend Class Form1
	Inherits System.Windows.Forms.Form
#Region "Windows Form Designer generated code "
	Public Sub New()
		MyBase.New()
		
		'This call is required by the Windows Form Designer.
		InitializeComponent()
	End Sub
	'Form overrides dispose to clean up the component list.
	Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
		If Disposing Then
			If Not components Is Nothing Then
				components.Dispose()
			End If
		End If
		MyBase.Dispose(Disposing)
	End Sub
	'Required by the Windows Form Designer
	Private components As System.ComponentModel.IContainer
	Public ToolTip1 As System.Windows.Forms.ToolTip
	Public WithEvents Timer1 As System.Windows.Forms.Timer
	Public WithEvents cmdLoad As System.Windows.Forms.Button
	Public WithEvents Label1 As System.Windows.Forms.Label
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.ToolTip1.Active = True
		Me.Timer1 = New System.Windows.Forms.Timer(components)
		Me.cmdLoad = New System.Windows.Forms.Button
		Me.Label1 = New System.Windows.Forms.Label
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
		Me.Text = "Загрузка начальных данных"
		Me.ClientSize = New System.Drawing.Size(403, 91)
		Me.Location = New System.Drawing.Point(3, 22)
		Me.Icon = CType(resources.GetObject("Form1.Icon"), System.Drawing.Icon)
		Me.MaximizeBox = False
		Me.MinimizeBox = False
		Me.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultLocation
		Me.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.ControlBox = True
		Me.Enabled = True
		Me.KeyPreview = False
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.ShowInTaskbar = True
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "Form1"
		Me.Timer1.Interval = 60000
		Me.Timer1.Enabled = True
		Me.cmdLoad.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.cmdLoad.Text = "Загрузить данные из XML файлов"
		Me.cmdLoad.Size = New System.Drawing.Size(289, 33)
		Me.cmdLoad.Location = New System.Drawing.Point(56, 16)
		Me.cmdLoad.TabIndex = 0
		Me.cmdLoad.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.cmdLoad.BackColor = System.Drawing.SystemColors.Control
		Me.cmdLoad.CausesValidation = True
		Me.cmdLoad.Enabled = True
		Me.cmdLoad.ForeColor = System.Drawing.SystemColors.ControlText
		Me.cmdLoad.Cursor = System.Windows.Forms.Cursors.Default
		Me.cmdLoad.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.cmdLoad.TabStop = True
		Me.cmdLoad.Name = "cmdLoad"
		Me.Label1.Size = New System.Drawing.Size(377, 25)
		Me.Label1.Location = New System.Drawing.Point(16, 56)
		Me.Label1.TabIndex = 1
		Me.Label1.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label1.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label1.BackColor = System.Drawing.SystemColors.Control
		Me.Label1.Enabled = True
		Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label1.UseMnemonic = True
		Me.Label1.Visible = True
		Me.Label1.AutoSize = False
		Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.Label1.Name = "Label1"
		Me.Controls.Add(cmdLoad)
		Me.Controls.Add(Label1)
	End Sub
#End Region 

    Dim guiman As MKSNGuiManager.MKSNGuiManager
    Dim m As MKSNManager.MKSN.Manager
    Dim s As MKSNManager.MKSN.Session
    Dim o As Object 'System.Application
    Dim u As Object 'UserSecurity.Application
    Dim rs As DataTable
    'UPGRADE_NOTE: site was upgraded to site_Renamed. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1061"'
    Dim site_Renamed As String

    Private Sub LoadObjects()
        On Error Resume Next
        Dim xdom As System.Xml.XmlDocument

        Dim path As String

        'UPGRADE_NOTE: name was upgraded to name_Renamed. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1061"'
        'UPGRADE_NOTE: typename was upgraded to typename_Renamed. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1061"'
        Dim drs As MKSNManager.Document.Doc_Base

        Dim typename_Renamed As String, id As System.Guid, name_Renamed As String

        'UPGRADE_WARNING: Dir has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
        path = Dir(VB6.GetPath & "\*.xml")
        While path <> ""
            xdom = New System.XML.XmlDocument
            xdom.Load(path)

            id = New Guid(xdom.LastChild.FirstChild.Attributes.GetNamedItem("ID").Value)

            typename_Renamed = xdom.LastChild.FirstChild.Attributes.GetNamedItem("TYPENAME").Value
            name_Renamed = typename_Renamed

            
            name_Renamed = xdom.LastChild.FirstChild.Attributes.GetNamedItem("NAME").Value

            Label1.Text = "load " & typename_Renamed
            System.Windows.Forms.Application.DoEvents()
            drs = m.GetInstanceObject(id)
            If drs Is Nothing Then
                m.NewInstance(id, typename_Renamed, name_Renamed)
            End If
            drs = m.GetInstanceObject(id)
            If Not drs Is Nothing Then

                drs.LockResource(True)

                drs.AutoLoadPart = True

                drs.WorkOffline = True

                drs.XMLLoad(xdom.lastChild, 0)

                drs.WorkOffline = False

                drs.BatchUpdate()

                drs.UnlockResource()
            End If
            xdom = Nothing
            path = Dir()
        End While
        Label1.Text = "done"
    End Sub

    Private Sub Command17_Click()
        rs = m.Session.GetRowsDT("INSTANCE", "", "", "ObjType='MTZMetaModel'")
        Dim drs As Object
        Dim id As Guid
        If rs.Rows.Count > 0 Then
            id = rs.Rows(0).Item("InstanceID").Value
        Else
            id = New Guid("{88DEEBA4-69B1-454A-992A-FAE3CEBFBCA1}")
            m.NewInstance(id, "MTZMetaModel", "MTZMetaModel")
        End If
        drs = m.GetInstanceObject(id)


        drs.LockResource(True)

        drs.AutoLoadPart = False

        drs.WorkOffline = True

        Dim xdom As System.XML.XmlDocument
        xdom = New System.XML.XmlDocument
        xdom.Load(VB6.GetPath & "\{88DEEBA4-69B1-454A-992A-FAE3CEBFBCA1}.xml")
        drs.XMLLoad(xdom.LastChild, 0)
        drs.WorkOffline = False
        drs.BatchUpdate()
        xdom = Nothing
        MsgBox("Model loaded")

    End Sub

    Private Sub cmdLoad_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdLoad.Click
        LoadObjects()
    End Sub

    Private Sub Form1_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
        guiman = New MKSNGuiManager.MKSNGuiManager


        If Not guiman.Login() Then End

        m = guiman.Manager

        s = m.Session
    End Sub

    'UPGRADE_WARNING: Form event Form1.Unload has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup2065"'
    Private Sub Form1_Closed(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Closed
        Timer1.Enabled = False
        m.Session.Logout()

        m = Nothing
    End Sub

    Private Sub Timer1_Tick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Timer1.Tick
        On Error Resume Next : m.Session.Exec("SessionTouch", Nothing)
    End Sub
End Class