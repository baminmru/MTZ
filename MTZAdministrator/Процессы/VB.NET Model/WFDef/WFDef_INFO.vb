


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFDef
    Public Class WFDef_INFO
        Inherits MKSNManager.Document.DocRow_Base

            private m_Diagram  as STRING
            private m_the_Description  as STRING

        Public Overrides Sub CleanFields()
            ' m_Diagram=   
            ' m_the_Description=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             dr("Diagram") =Diagram
             dr("the_Description") =the_Description
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          nv.Add("Diagram", Diagram, dbtype.string)
          nv.Add("the_Description", the_Description, dbtype.string)
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
          m_Diagram=reader.item("Diagram")
          m_the_Description=reader.item("the_Description")
        End Sub
        Public Property Diagram() As STRING
            Get
                LoadFromDatabase()
                Diagram = m_Diagram
                AccessTime = Now
            End Get
            Set(ByVal Value As STRING )
                LoadFromDatabase()
                m_Diagram = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property the_Description() As STRING
            Get
                LoadFromDatabase()
                the_Description = m_the_Description
                AccessTime = Now
            End Get
            Set(ByVal Value As STRING )
                LoadFromDatabase()
                m_the_Description = Value
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            Diagram = node.Attributes.GetNamedItem("Diagram").Value
            the_Description = node.Attributes.GetNamedItem("the_Description").Value
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("Diagram", Diagram)  
          node.SetAttribute("the_Description", the_Description)  
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



