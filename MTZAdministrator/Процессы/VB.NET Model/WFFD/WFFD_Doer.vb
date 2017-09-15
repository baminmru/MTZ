


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFFD
    Public Class WFFD_Doer
        Inherits MKSNManager.Document.DocRow_Base

            private m_DoerGroup  as System.Guid

        Public Overrides Sub CleanFields()
            ' m_DoerGroup=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             if DoerGroup is nothing then
               dr("DoerGroup") =system.dbnull.value
               dr("DoerGroup_ID") =System.Guid.Empty
             else
               dr("DoerGroup") =DoerGroup.BRIEF
               dr("DoerGroup_ID") =DoerGroup.ID
             end if 
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          if m_DoerGroup.Equals(System.Guid.Empty) then
            nv.Add("DoerGroup", system.dbnull.value, dbtype.guid)
          else
            nv.Add("DoerGroup", m_DoerGroup, dbtype.guid)
          end if 
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
          if isdbnull(reader.item("DoerGroup")) then
            m_DoerGroup = System.GUID.Empty
          else
            m_DoerGroup=reader.item("DoerGroup")
          end if 
        End Sub
        Public Property DoerGroup() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                DoerGroup = me.application.Findrowobject("Groups",m_DoerGroup)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_DoerGroup = Value.id
                else
                   m_DoerGroup=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            m_DoerGroup = new system.guid(node.Attributes.GetNamedItem("DoerGroup").Value)
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("DoerGroup", m_DoerGroup.tostring)  
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



