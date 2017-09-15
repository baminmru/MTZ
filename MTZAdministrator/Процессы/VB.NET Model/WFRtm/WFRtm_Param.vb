


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFRtm
    Public Class WFRtm_Param
        Inherits MKSNManager.Document.DocRow_Base

            private m_the_Value  as String
            private m_BasedOn  as System.Guid

        Public Overrides Sub CleanFields()
            ' m_the_Value=   
            ' m_BasedOn=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             dr("the_Value") =the_Value
             if BasedOn is nothing then
               dr("BasedOn") =system.dbnull.value
               dr("BasedOn_ID") =System.Guid.Empty
             else
               dr("BasedOn") =BasedOn.BRIEF
               dr("BasedOn_ID") =BasedOn.ID
             end if 
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          nv.Add("the_Value", the_Value, dbtype.string)
          if m_BasedOn.Equals(System.Guid.Empty) then
            nv.Add("BasedOn", system.dbnull.value, dbtype.guid)
          else
            nv.Add("BasedOn", m_BasedOn, dbtype.guid)
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
          m_the_Value=reader.item("the_Value")
          if isdbnull(reader.item("BasedOn")) then
            m_BasedOn = System.GUID.Empty
          else
            m_BasedOn=reader.item("BasedOn")
          end if 
        End Sub
        Public Property the_Value() As String
            Get
                LoadFromDatabase()
                the_Value = m_the_Value
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_the_Value = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property BasedOn() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                BasedOn = me.application.Findrowobject("WFDef_param",m_BasedOn)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_BasedOn = Value.id
                else
                   m_BasedOn=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            the_Value = node.Attributes.GetNamedItem("the_Value").Value
            m_BasedOn = new system.guid(node.Attributes.GetNamedItem("BasedOn").Value)
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("the_Value", the_Value)  
          node.SetAttribute("BasedOn", m_BasedOn.tostring)  
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



