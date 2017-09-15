


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFFD
    Public Class WFFD_ShortCut
        Inherits MKSNManager.Document.DocRow_Base

            private m_StartMode  as String
            private m_DocName  as String
            private m_Folder  as System.Guid

        Public Overrides Sub CleanFields()
            ' m_StartMode=   
            ' m_DocName=   
            ' m_Folder=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             dr("StartMode") =StartMode
             dr("DocName") =DocName
             if Folder is nothing then
               dr("Folder") =system.dbnull.value
               dr("Folder_ID") =System.Guid.Empty
             else
               dr("Folder") =Folder.BRIEF
               dr("Folder_ID") =Folder.ID
             end if 
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          nv.Add("StartMode", StartMode, dbtype.string)
          nv.Add("DocName", DocName, dbtype.string)
          if m_Folder.Equals(System.Guid.Empty) then
            nv.Add("Folder", system.dbnull.value, dbtype.guid)
          else
            nv.Add("Folder", m_Folder, dbtype.guid)
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
          m_StartMode=reader.item("StartMode")
          m_DocName=reader.item("DocName")
          if isdbnull(reader.item("Folder")) then
            m_Folder = System.GUID.Empty
          else
            m_Folder=reader.item("Folder")
          end if 
        End Sub
        Public Property StartMode() As String
            Get
                LoadFromDatabase()
                StartMode = m_StartMode
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_StartMode = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property DocName() As String
            Get
                LoadFromDatabase()
                DocName = m_DocName
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_DocName = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property Folder() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                Folder = me.application.Findrowobject("Folder",m_Folder)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_Folder = Value.id
                else
                   m_Folder=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            StartMode = node.Attributes.GetNamedItem("StartMode").Value
            DocName = node.Attributes.GetNamedItem("DocName").Value
            m_Folder = new system.guid(node.Attributes.GetNamedItem("Folder").Value)
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("StartMode", StartMode)  
          node.SetAttribute("DocName", DocName)  
          node.SetAttribute("Folder", m_Folder.tostring)  
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



