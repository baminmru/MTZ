


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFRtm
    Public Class WFRtm_Pcomm
        Inherits MKSNManager.Document.DocRow_Base

            private m_Subject  as String
            private m_Author  as System.Guid
            private m_Attachment  as Object
            private m_Message  as STRING
        private m_WFRtm_Pcomm As WFRtm_Pcomm_col

        Public Overrides Sub CleanFields()
            ' m_Subject=   
            ' m_Author=   
            ' m_Attachment=   
            ' m_Message=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             dr("Subject") =Subject
             if Author is nothing then
               dr("Author") =system.dbnull.value
               dr("Author_ID") =System.Guid.Empty
             else
               dr("Author") =Author.BRIEF
               dr("Author_ID") =Author.ID
             end if 
             dr("Attachment") =Attachment
             dr("Message") =Message
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            mFindInside = WFRtm_Pcomm.FindObject(table,RowID)
            if not mFindInside is nothing then return mFindInside
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
        If Me.Parent.Parent.GetType.name = Me.GetType.name Then
            nv.Add("ParentRowID", Me.Parent.Parent.ID, dbtype.guid)
        Else
             nv.Add("ParentRowID", system.dbnull.value, dbtype.guid)
        End If
          nv.Add("Subject", Subject, dbtype.string)
          if m_Author.Equals(System.Guid.Empty) then
            nv.Add("Author", system.dbnull.value, dbtype.guid)
          else
            nv.Add("Author", m_Author, dbtype.guid)
          end if 
          nv.Add("Attachment", Attachment, dbtype.Binary)
          nv.Add("Message", Message, dbtype.string)
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
          m_Subject=reader.item("Subject")
          if isdbnull(reader.item("Author")) then
            m_Author = System.GUID.Empty
          else
            m_Author=reader.item("Author")
          end if 
          m_Attachment=reader.item("Attachment")
          m_Message=reader.item("Message")
        End Sub
        Public Property Subject() As String
            Get
                LoadFromDatabase()
                Subject = m_Subject
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_Subject = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property Author() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                Author = me.application.Findrowobject("Users",m_Author)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_Author = Value.id
                else
                   m_Author=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property Attachment() As Object
            Get
                LoadFromDatabase()
                Attachment = m_Attachment
                AccessTime = Now
            End Get
            Set(ByVal Value As Object )
                LoadFromDatabase()
                m_Attachment = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property Message() As STRING
            Get
                LoadFromDatabase()
                Message = m_Message
                AccessTime = Now
            End Get
            Set(ByVal Value As STRING )
                LoadFromDatabase()
                m_Message = Value
                ChangeTime = Now
            End Set
        End Property
        Public readonly Property WFRtm_Pcomm() As WFRtm_Pcomm_col
            Get
                if  m_WFRtm_Pcomm is nothing then
                  m_WFRtm_Pcomm = new WFRtm_Pcomm_col
                  m_WFRtm_Pcomm.Parent = me
                  m_WFRtm_Pcomm.Application = me.Application
                  m_WFRtm_Pcomm.Refresh
                end if
                WFRtm_Pcomm = m_WFRtm_Pcomm
                AccessTime = Now
            End Get
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            Subject = node.Attributes.GetNamedItem("Subject").Value
            m_Author = new system.guid(node.Attributes.GetNamedItem("Author").Value)
            Attachment = node.Attributes.GetNamedItem("Attachment").Value
            Message = node.Attributes.GetNamedItem("Message").Value
            e_list = node.SelectNodes("WFRtm_Pcomm_COL")
            WFRtm_Pcomm.XMLLoad(e_list,LoadMode)
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("Subject", Subject)  
          node.SetAttribute("Author", m_Author.tostring)  
          node.SetAttribute("Attachment", Attachment)  
          node.SetAttribute("Message", Message)  
            WFRtm_Pcomm.XMLSave(node,xdom)
        End sub
Public Overrides Sub BatchUpdate()
If Not Application.WorkOffline Then
  If Deleted Then
    Delete
    Exit Sub
  End If
  If Changed Then Save
            WFRtm_Pcomm.BatchUpdate
End If
End Sub
    End Class
End Namespace



