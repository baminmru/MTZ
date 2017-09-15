


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFFR
    Public Class WFFR_ShortCut
        Inherits MKSNManager.Document.DocRow_Base

            private m_BasedOn  as System.Guid
            private m_ShortCut  as System.Guid

        Public Overrides Sub CleanFields()
            ' m_BasedOn=   
            ' m_ShortCut=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             if BasedOn is nothing then
               dr("BasedOn") =system.dbnull.value
               dr("BasedOn_ID") =System.Guid.Empty
             else
               dr("BasedOn") =BasedOn.BRIEF
               dr("BasedOn_ID") =BasedOn.ID
             end if 
             if ShortCut is nothing then
               dr("ShortCut") =system.dbnull.value
               dr("ShortCut_ID") =System.Guid.Empty
             else
               dr("ShortCut") =ShortCut.BRIEF
               dr("ShortCut_ID") =ShortCut.ID
             end if 
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          if m_BasedOn.Equals(System.Guid.Empty) then
            nv.Add("BasedOn", system.dbnull.value, dbtype.guid)
          else
            nv.Add("BasedOn", m_BasedOn, dbtype.guid)
          end if 
          if m_ShortCut.Equals(System.Guid.Empty) then
            nv.Add("ShortCut", system.dbnull.value, dbtype.guid)
          else
            nv.Add("ShortCut", m_ShortCut, dbtype.guid)
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
          if isdbnull(reader.item("BasedOn")) then
            m_BasedOn = System.GUID.Empty
          else
            m_BasedOn=reader.item("BasedOn")
          end if 
          if isdbnull(reader.item("ShortCut")) then
            m_ShortCut = System.GUID.Empty
          else
            m_ShortCut=reader.item("ShortCut")
          end if 
        End Sub
        Public Property BasedOn() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                BasedOn = me.application.Findrowobject("WFFD_ShortCut",m_BasedOn)
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
        Public Property ShortCut() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                ShortCut = me.application.Findrowobject("Shortcut",m_ShortCut)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_ShortCut = Value.id
                else
                   m_ShortCut=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            m_BasedOn = new system.guid(node.Attributes.GetNamedItem("BasedOn").Value)
            m_ShortCut = new system.guid(node.Attributes.GetNamedItem("ShortCut").Value)
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("BasedOn", m_BasedOn.tostring)  
          node.SetAttribute("ShortCut", m_ShortCut.tostring)  
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



