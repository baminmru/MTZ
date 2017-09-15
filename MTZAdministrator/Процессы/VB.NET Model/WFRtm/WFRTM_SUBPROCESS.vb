


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFRtm
    Public Class WFRTM_SUBPROCESS
        Inherits MKSNManager.Document.DocRow_Base

            private m_Process  as System.Guid
            private m_Name  as String

        Public Overrides Sub CleanFields()
            ' m_Process=   
            ' m_Name=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             if Process is nothing then
               dr("Process") =system.dbnull.value
               dr("Process_ID") =System.Guid.Empty
             else
               dr("Process") =Process.BRIEF
               dr("Process_ID") =Process.ID
             end if 
             dr("Name") =Name
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          if m_Process.Equals(System.Guid.Empty) then
            nv.Add("Process", system.dbnull.value, dbtype.guid)
          else
            nv.Add("Process", m_Process, dbtype.guid)
          end if 
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
          if isdbnull(reader.item("Process")) then
            m_Process = System.GUID.Empty
          else
            m_Process=reader.item("Process")
          end if 
          m_Name=reader.item("Name")
        End Sub
        Public Property Process() As MKSNManager.Document.doc_base
            Get
                LoadFromDatabase()
                Process = me.application.manager.GetInstanceObject(m_Process)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.doc_base )
                LoadFromDatabase()
                if not  Value is nothing then
                  m_Process = Value.id
                else
                  m_Process =System.Guid.Empty 
                end if
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
            m_Process = new system.guid(node.Attributes.GetNamedItem("Process").Value)
            Name = node.Attributes.GetNamedItem("Name").Value
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("Process", m_Process.tostring)  
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



