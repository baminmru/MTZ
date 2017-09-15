


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFFD
    Public Class WFFD_DOCSTOPS
        Inherits MKSNManager.Document.DocRow_Base

            private m_ProcessDocument  as System.Guid
            private m_DocStateName  as String

        Public Overrides Sub CleanFields()
            ' m_ProcessDocument=   
            ' m_DocStateName=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             if ProcessDocument is nothing then
               dr("ProcessDocument") =system.dbnull.value
               dr("ProcessDocument_ID") =System.Guid.Empty
             else
               dr("ProcessDocument") =ProcessDocument.BRIEF
               dr("ProcessDocument_ID") =ProcessDocument.ID
             end if 
             dr("DocStateName") =DocStateName
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          if m_ProcessDocument.Equals(System.Guid.Empty) then
            nv.Add("ProcessDocument", system.dbnull.value, dbtype.guid)
          else
            nv.Add("ProcessDocument", m_ProcessDocument, dbtype.guid)
          end if 
          nv.Add("DocStateName", DocStateName, dbtype.string)
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
          if isdbnull(reader.item("ProcessDocument")) then
            m_ProcessDocument = System.GUID.Empty
          else
            m_ProcessDocument=reader.item("ProcessDocument")
          end if 
          m_DocStateName=reader.item("DocStateName")
        End Sub
        Public Property ProcessDocument() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                ProcessDocument = me.application.Findrowobject("WFDef_Doc",m_ProcessDocument)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_ProcessDocument = Value.id
                else
                   m_ProcessDocument=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property DocStateName() As String
            Get
                LoadFromDatabase()
                DocStateName = m_DocStateName
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_DocStateName = Value
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            m_ProcessDocument = new system.guid(node.Attributes.GetNamedItem("ProcessDocument").Value)
            DocStateName = node.Attributes.GetNamedItem("DocStateName").Value
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("ProcessDocument", m_ProcessDocument.tostring)  
          node.SetAttribute("DocStateName", DocStateName)  
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



