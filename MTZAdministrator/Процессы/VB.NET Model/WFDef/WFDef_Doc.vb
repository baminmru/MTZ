


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFDef
    Public Class WFDef_Doc
        Inherits MKSNManager.Document.DocRow_Base

            private m_ArchiveMode  as String
            private m_ArchveFolder  as System.Guid
            private m_DocTemplate  as System.Guid
            private m_SetBeforStart  as enumBoolean
            private m_DocType  as System.Guid
            private m_CreateInRuntime  as enumBoolean
            private m_Name  as String

        Public Overrides Sub CleanFields()
            ' m_ArchiveMode=   
            ' m_ArchveFolder=   
            ' m_DocTemplate=   
            ' m_SetBeforStart=   
            ' m_DocType=   
            ' m_CreateInRuntime=   
            ' m_Name=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             dr("ArchiveMode") =ArchiveMode
             if ArchveFolder is nothing then
               dr("ArchveFolder") =system.dbnull.value
               dr("ArchveFolder_ID") =System.Guid.Empty
             else
               dr("ArchveFolder") =ArchveFolder.BRIEF
               dr("ArchveFolder_ID") =ArchveFolder.ID
             end if 
             if DocTemplate is nothing then
               dr("DocTemplate") =system.dbnull.value
               dr("DocTemplate_ID") =System.Guid.Empty
             else
               dr("DocTemplate") =DocTemplate.BRIEF
               dr("DocTemplate_ID") =DocTemplate.ID
             end if 
             select case SetBeforStart
            case enumBoolean.Boolean_Da
              dr ("SetBeforStart")  = "Да"
              dr ("SetBeforStart_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("SetBeforStart")  = "Нет"
              dr ("SetBeforStart_VAL")  = 0
              end select 'SetBeforStart
             if DocType is nothing then
               dr("DocType") =system.dbnull.value
               dr("DocType_ID") =System.Guid.Empty
             else
               dr("DocType") =DocType.BRIEF
               dr("DocType_ID") =DocType.ID
             end if 
             select case CreateInRuntime
            case enumBoolean.Boolean_Da
              dr ("CreateInRuntime")  = "Да"
              dr ("CreateInRuntime_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("CreateInRuntime")  = "Нет"
              dr ("CreateInRuntime_VAL")  = 0
              end select 'CreateInRuntime
             dr("Name") =Name
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          nv.Add("ArchiveMode", ArchiveMode, dbtype.string)
          if m_ArchveFolder.Equals(System.Guid.Empty) then
            nv.Add("ArchveFolder", system.dbnull.value, dbtype.guid)
          else
            nv.Add("ArchveFolder", m_ArchveFolder, dbtype.guid)
          end if 
          if m_DocTemplate.Equals(System.Guid.Empty) then
            nv.Add("DocTemplate", system.dbnull.value, dbtype.guid)
          else
            nv.Add("DocTemplate", m_DocTemplate, dbtype.guid)
          end if 
          nv.Add("SetBeforStart", SetBeforStart, dbtype.int16)
          if m_DocType.Equals(System.Guid.Empty) then
            nv.Add("DocType", system.dbnull.value, dbtype.guid)
          else
            nv.Add("DocType", m_DocType, dbtype.guid)
          end if 
          nv.Add("CreateInRuntime", CreateInRuntime, dbtype.int16)
          nv.Add("Name", Name, dbtype.string)
            nv.Add(PartName() & "id", ID, DbType.Guid)
        End Sub


        Public Overrides Sub Unpack(ByVal reader As System.Data.DataRow)
            on error resume next  
            If IsDBNull(reader.item("SecurityStyleID")) Then
                SecureStyleID = System.guid.Empty
            Else
                SecureStyleID = reader.item("SecurityStyleID")
            End If

            RowRetrived = True
            RetriveTime = Now
          m_ArchiveMode=reader.item("ArchiveMode")
          if isdbnull(reader.item("ArchveFolder")) then
            m_ArchveFolder = System.GUID.Empty
          else
            m_ArchveFolder=reader.item("ArchveFolder")
          end if 
          if isdbnull(reader.item("DocTemplate")) then
            m_DocTemplate = System.GUID.Empty
          else
            m_DocTemplate=reader.item("DocTemplate")
          end if 
          m_SetBeforStart=reader.item("SetBeforStart")
          if isdbnull(reader.item("DocType")) then
            m_DocType = System.GUID.Empty
          else
            m_DocType=reader.item("DocType")
          end if 
          m_CreateInRuntime=reader.item("CreateInRuntime")
          m_Name=reader.item("Name")
        End Sub
        Public Property ArchiveMode() As String
            Get
                LoadFromDatabase()
                ArchiveMode = m_ArchiveMode
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_ArchiveMode = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property ArchveFolder() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                ArchveFolder = me.application.Findrowobject("Folder",m_ArchveFolder)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_ArchveFolder = Value.id
                else
                   m_ArchveFolder=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property DocTemplate() As MKSNManager.Document.doc_base
            Get
                LoadFromDatabase()
                DocTemplate = me.application.manager.GetInstanceObject(m_DocTemplate)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.doc_base )
                LoadFromDatabase()
                if not  Value is nothing then
                  m_DocTemplate = Value.id
                else
                  m_DocTemplate =System.Guid.Empty 
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property SetBeforStart() As enumBoolean
            Get
                LoadFromDatabase()
                SetBeforStart = m_SetBeforStart
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_SetBeforStart = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property DocType() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                DocType = me.application.Findrowobject("OBJECTTYPE",m_DocType)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_DocType = Value.id
                else
                   m_DocType=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property CreateInRuntime() As enumBoolean
            Get
                LoadFromDatabase()
                CreateInRuntime = m_CreateInRuntime
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_CreateInRuntime = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property Name() As String
            Get
                LoadFromDatabase()
                Name = m_Name
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_Name = Value
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            ArchiveMode = node.Attributes.GetNamedItem("ArchiveMode").Value
            m_ArchveFolder = new system.guid(node.Attributes.GetNamedItem("ArchveFolder").Value)
            m_DocTemplate = new system.guid(node.Attributes.GetNamedItem("DocTemplate").Value)
            SetBeforStart = node.Attributes.GetNamedItem("SetBeforStart").Value
            m_DocType = new system.guid(node.Attributes.GetNamedItem("DocType").Value)
            CreateInRuntime = node.Attributes.GetNamedItem("CreateInRuntime").Value
            Name = node.Attributes.GetNamedItem("Name").Value
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("ArchiveMode", ArchiveMode)  
          node.SetAttribute("ArchveFolder", m_ArchveFolder.tostring)  
          node.SetAttribute("DocTemplate", m_DocTemplate.tostring)  
          node.SetAttribute("SetBeforStart", SetBeforStart)  
          node.SetAttribute("DocType", m_DocType.tostring)  
          node.SetAttribute("CreateInRuntime", CreateInRuntime)  
          node.SetAttribute("Name", Name)  
        End sub
Public Overrides Sub BatchUpdate()
If Not Application.WorkOffline Then
  If Deleted Then
    Delete
    Exit Sub
  End If
  If Changed Then Save
End If
End Sub
    End Class
End Namespace



