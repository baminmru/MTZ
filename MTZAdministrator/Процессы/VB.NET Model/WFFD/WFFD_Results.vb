


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFFD
    Public Class WFFD_Results
        Inherits MKSNManager.Document.DocRow_Base

            private m_ResultWeight  as double
            private m_Name  as String
        private m_WFFD_DOCSTOPS As WFFD_DOCSTOPS_col

        Public Overrides Sub CleanFields()
            ' m_ResultWeight=   
            ' m_Name=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             dr("ResultWeight") =ResultWeight
             dr("Name") =Name
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            mFindInside = WFFD_DOCSTOPS.FindObject(table,RowID)
            if not mFindInside is nothing then return mFindInside
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          nv.Add("ResultWeight", ResultWeight, dbtype.double)
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
          m_ResultWeight=reader.item("ResultWeight")
          m_Name=reader.item("Name")
        End Sub
        Public Property ResultWeight() As double
            Get
                LoadFromDatabase()
                ResultWeight = m_ResultWeight
                AccessTime = Now
            End Get
            Set(ByVal Value As double )
                LoadFromDatabase()
                m_ResultWeight = Value
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
        Public readonly Property WFFD_DOCSTOPS() As WFFD_DOCSTOPS_col
            Get
                if  m_WFFD_DOCSTOPS is nothing then
                  m_WFFD_DOCSTOPS = new WFFD_DOCSTOPS_col
                  m_WFFD_DOCSTOPS.Parent = me
                  m_WFFD_DOCSTOPS.Application = me.Application
                  m_WFFD_DOCSTOPS.Refresh
                end if
                WFFD_DOCSTOPS = m_WFFD_DOCSTOPS
                AccessTime = Now
            End Get
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            ResultWeight = node.Attributes.GetNamedItem("ResultWeight").Value
            Name = node.Attributes.GetNamedItem("Name").Value
            e_list = node.SelectNodes("WFFD_DOCSTOPS_COL")
            WFFD_DOCSTOPS.XMLLoad(e_list,LoadMode)
             Changed = true
        End sub
        Public Overrides Sub Dispose()
            WFFD_DOCSTOPS.Dispose
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("ResultWeight", ResultWeight)  
          node.SetAttribute("Name", Name)  
            WFFD_DOCSTOPS.XMLSave(node,xdom)
        End sub
Public Overrides Sub BatchUpdate()
If Not Application.WorkOffline Then
  If Deleted Then
    Delete
    Exit Sub
  End If
  If Changed Then Save
            WFFD_DOCSTOPS.BatchUpdate
End If
End Sub
    End Class
End Namespace



