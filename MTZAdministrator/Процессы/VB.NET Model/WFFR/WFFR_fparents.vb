


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFFR
    Public Class WFFR_fparents
        Inherits MKSNManager.Document.DocRow_Base

            private m_PrevFunc  as System.Guid

        Public Overrides Sub CleanFields()
            ' m_PrevFunc=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             if PrevFunc is nothing then
               dr("PrevFunc") =system.dbnull.value
               dr("PrevFunc_ID") =System.Guid.Empty
             else
               dr("PrevFunc") =PrevFunc.BRIEF
               dr("PrevFunc_ID") =PrevFunc.ID
             end if 
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          if m_PrevFunc.Equals(System.Guid.Empty) then
            nv.Add("PrevFunc", system.dbnull.value, dbtype.guid)
          else
            nv.Add("PrevFunc", m_PrevFunc, dbtype.guid)
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
          if isdbnull(reader.item("PrevFunc")) then
            m_PrevFunc = System.GUID.Empty
          else
            m_PrevFunc=reader.item("PrevFunc")
          end if 
        End Sub
        Public Property PrevFunc() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                PrevFunc = me.application.Findrowobject("WFRtm_func",m_PrevFunc)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_PrevFunc = Value.id
                else
                   m_PrevFunc=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            m_PrevFunc = new system.guid(node.Attributes.GetNamedItem("PrevFunc").Value)
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("PrevFunc", m_PrevFunc.tostring)  
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



