


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFFD
    Public Class WFFD_ATTR1
        Inherits MKSNManager.Document.DocRow_Base

            private m_DocState1  as System.Guid
            private m_Folder  as System.Guid
            private m_ProcessParameter  as System.Guid
            private m_DocState2  as System.Guid
            private m_PartField  as System.Guid
            private m_ProcessParameter3  as System.Guid
            private m_the_Value  as String
            private m_Flag  as enumBoolean
            private m_Path2  as STRING
            private m_Path  as STRING
            private m_Flag2  as enumBoolean
            private m_ProcessDocument  as System.Guid
            private m_SubProcDocument  as String
            private m_SubProcessType  as System.Guid
            private m_ObjectType  as System.Guid
            private m_Value2  as String
            private m_DocumentPart  as System.Guid
            private m_ProcessParameter4  as System.Guid
            private m_ProcessParameter2  as System.Guid

        Public Overrides Sub CleanFields()
            ' m_DocState1=   
            ' m_Folder=   
            ' m_ProcessParameter=   
            ' m_DocState2=   
            ' m_PartField=   
            ' m_ProcessParameter3=   
            ' m_the_Value=   
            ' m_Flag=   
            ' m_Path2=   
            ' m_Path=   
            ' m_Flag2=   
            ' m_ProcessDocument=   
            ' m_SubProcDocument=   
            ' m_SubProcessType=   
            ' m_ObjectType=   
            ' m_Value2=   
            ' m_DocumentPart=   
            ' m_ProcessParameter4=   
            ' m_ProcessParameter2=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             if DocState1 is nothing then
               dr("DocState1") =system.dbnull.value
               dr("DocState1_ID") =System.Guid.Empty
             else
               dr("DocState1") =DocState1.BRIEF
               dr("DocState1_ID") =DocState1.ID
             end if 
             if Folder is nothing then
               dr("Folder") =system.dbnull.value
               dr("Folder_ID") =System.Guid.Empty
             else
               dr("Folder") =Folder.BRIEF
               dr("Folder_ID") =Folder.ID
             end if 
             if ProcessParameter is nothing then
               dr("ProcessParameter") =system.dbnull.value
               dr("ProcessParameter_ID") =System.Guid.Empty
             else
               dr("ProcessParameter") =ProcessParameter.BRIEF
               dr("ProcessParameter_ID") =ProcessParameter.ID
             end if 
             if DocState2 is nothing then
               dr("DocState2") =system.dbnull.value
               dr("DocState2_ID") =System.Guid.Empty
             else
               dr("DocState2") =DocState2.BRIEF
               dr("DocState2_ID") =DocState2.ID
             end if 
             if PartField is nothing then
               dr("PartField") =system.dbnull.value
               dr("PartField_ID") =System.Guid.Empty
             else
               dr("PartField") =PartField.BRIEF
               dr("PartField_ID") =PartField.ID
             end if 
             if ProcessParameter3 is nothing then
               dr("ProcessParameter3") =system.dbnull.value
               dr("ProcessParameter3_ID") =System.Guid.Empty
             else
               dr("ProcessParameter3") =ProcessParameter3.BRIEF
               dr("ProcessParameter3_ID") =ProcessParameter3.ID
             end if 
             dr("the_Value") =the_Value
             select case Flag
            case enumBoolean.Boolean_Da
              dr ("Flag")  = "Да"
              dr ("Flag_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("Flag")  = "Нет"
              dr ("Flag_VAL")  = 0
              end select 'Flag
             dr("Path2") =Path2
             dr("Path") =Path
             select case Flag2
            case enumBoolean.Boolean_Da
              dr ("Flag2")  = "Да"
              dr ("Flag2_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("Flag2")  = "Нет"
              dr ("Flag2_VAL")  = 0
              end select 'Flag2
             if ProcessDocument is nothing then
               dr("ProcessDocument") =system.dbnull.value
               dr("ProcessDocument_ID") =System.Guid.Empty
             else
               dr("ProcessDocument") =ProcessDocument.BRIEF
               dr("ProcessDocument_ID") =ProcessDocument.ID
             end if 
             dr("SubProcDocument") =SubProcDocument
             if SubProcessType is nothing then
               dr("SubProcessType") =system.dbnull.value
               dr("SubProcessType_ID") =System.Guid.Empty
             else
               dr("SubProcessType") =SubProcessType.BRIEF
               dr("SubProcessType_ID") =SubProcessType.ID
             end if 
             if ObjectType is nothing then
               dr("ObjectType") =system.dbnull.value
               dr("ObjectType_ID") =System.Guid.Empty
             else
               dr("ObjectType") =ObjectType.BRIEF
               dr("ObjectType_ID") =ObjectType.ID
             end if 
             dr("Value2") =Value2
             if DocumentPart is nothing then
               dr("DocumentPart") =system.dbnull.value
               dr("DocumentPart_ID") =System.Guid.Empty
             else
               dr("DocumentPart") =DocumentPart.BRIEF
               dr("DocumentPart_ID") =DocumentPart.ID
             end if 
             if ProcessParameter4 is nothing then
               dr("ProcessParameter4") =system.dbnull.value
               dr("ProcessParameter4_ID") =System.Guid.Empty
             else
               dr("ProcessParameter4") =ProcessParameter4.BRIEF
               dr("ProcessParameter4_ID") =ProcessParameter4.ID
             end if 
             if ProcessParameter2 is nothing then
               dr("ProcessParameter2") =system.dbnull.value
               dr("ProcessParameter2_ID") =System.Guid.Empty
             else
               dr("ProcessParameter2") =ProcessParameter2.BRIEF
               dr("ProcessParameter2_ID") =ProcessParameter2.ID
             end if 
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          if m_DocState1.Equals(System.Guid.Empty) then
            nv.Add("DocState1", system.dbnull.value, dbtype.guid)
          else
            nv.Add("DocState1", m_DocState1, dbtype.guid)
          end if 
          if m_Folder.Equals(System.Guid.Empty) then
            nv.Add("Folder", system.dbnull.value, dbtype.guid)
          else
            nv.Add("Folder", m_Folder, dbtype.guid)
          end if 
          if m_ProcessParameter.Equals(System.Guid.Empty) then
            nv.Add("ProcessParameter", system.dbnull.value, dbtype.guid)
          else
            nv.Add("ProcessParameter", m_ProcessParameter, dbtype.guid)
          end if 
          if m_DocState2.Equals(System.Guid.Empty) then
            nv.Add("DocState2", system.dbnull.value, dbtype.guid)
          else
            nv.Add("DocState2", m_DocState2, dbtype.guid)
          end if 
          if m_PartField.Equals(System.Guid.Empty) then
            nv.Add("PartField", system.dbnull.value, dbtype.guid)
          else
            nv.Add("PartField", m_PartField, dbtype.guid)
          end if 
          if m_ProcessParameter3.Equals(System.Guid.Empty) then
            nv.Add("ProcessParameter3", system.dbnull.value, dbtype.guid)
          else
            nv.Add("ProcessParameter3", m_ProcessParameter3, dbtype.guid)
          end if 
          nv.Add("the_Value", the_Value, dbtype.string)
          nv.Add("Flag", Flag, dbtype.int16)
          nv.Add("Path2", Path2, dbtype.string)
          nv.Add("Path", Path, dbtype.string)
          nv.Add("Flag2", Flag2, dbtype.int16)
          if m_ProcessDocument.Equals(System.Guid.Empty) then
            nv.Add("ProcessDocument", system.dbnull.value, dbtype.guid)
          else
            nv.Add("ProcessDocument", m_ProcessDocument, dbtype.guid)
          end if 
          nv.Add("SubProcDocument", SubProcDocument, dbtype.string)
          if m_SubProcessType.Equals(System.Guid.Empty) then
            nv.Add("SubProcessType", system.dbnull.value, dbtype.guid)
          else
            nv.Add("SubProcessType", m_SubProcessType, dbtype.guid)
          end if 
          if m_ObjectType.Equals(System.Guid.Empty) then
            nv.Add("ObjectType", system.dbnull.value, dbtype.guid)
          else
            nv.Add("ObjectType", m_ObjectType, dbtype.guid)
          end if 
          nv.Add("Value2", Value2, dbtype.string)
          if m_DocumentPart.Equals(System.Guid.Empty) then
            nv.Add("DocumentPart", system.dbnull.value, dbtype.guid)
          else
            nv.Add("DocumentPart", m_DocumentPart, dbtype.guid)
          end if 
          if m_ProcessParameter4.Equals(System.Guid.Empty) then
            nv.Add("ProcessParameter4", system.dbnull.value, dbtype.guid)
          else
            nv.Add("ProcessParameter4", m_ProcessParameter4, dbtype.guid)
          end if 
          if m_ProcessParameter2.Equals(System.Guid.Empty) then
            nv.Add("ProcessParameter2", system.dbnull.value, dbtype.guid)
          else
            nv.Add("ProcessParameter2", m_ProcessParameter2, dbtype.guid)
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
          if isdbnull(reader.item("DocState1")) then
            m_DocState1 = System.GUID.Empty
          else
            m_DocState1=reader.item("DocState1")
          end if 
          if isdbnull(reader.item("Folder")) then
            m_Folder = System.GUID.Empty
          else
            m_Folder=reader.item("Folder")
          end if 
          if isdbnull(reader.item("ProcessParameter")) then
            m_ProcessParameter = System.GUID.Empty
          else
            m_ProcessParameter=reader.item("ProcessParameter")
          end if 
          if isdbnull(reader.item("DocState2")) then
            m_DocState2 = System.GUID.Empty
          else
            m_DocState2=reader.item("DocState2")
          end if 
          if isdbnull(reader.item("PartField")) then
            m_PartField = System.GUID.Empty
          else
            m_PartField=reader.item("PartField")
          end if 
          if isdbnull(reader.item("ProcessParameter3")) then
            m_ProcessParameter3 = System.GUID.Empty
          else
            m_ProcessParameter3=reader.item("ProcessParameter3")
          end if 
          m_the_Value=reader.item("the_Value")
          m_Flag=reader.item("Flag")
          m_Path2=reader.item("Path2")
          m_Path=reader.item("Path")
          m_Flag2=reader.item("Flag2")
          if isdbnull(reader.item("ProcessDocument")) then
            m_ProcessDocument = System.GUID.Empty
          else
            m_ProcessDocument=reader.item("ProcessDocument")
          end if 
          m_SubProcDocument=reader.item("SubProcDocument")
          if isdbnull(reader.item("SubProcessType")) then
            m_SubProcessType = System.GUID.Empty
          else
            m_SubProcessType=reader.item("SubProcessType")
          end if 
          if isdbnull(reader.item("ObjectType")) then
            m_ObjectType = System.GUID.Empty
          else
            m_ObjectType=reader.item("ObjectType")
          end if 
          m_Value2=reader.item("Value2")
          if isdbnull(reader.item("DocumentPart")) then
            m_DocumentPart = System.GUID.Empty
          else
            m_DocumentPart=reader.item("DocumentPart")
          end if 
          if isdbnull(reader.item("ProcessParameter4")) then
            m_ProcessParameter4 = System.GUID.Empty
          else
            m_ProcessParameter4=reader.item("ProcessParameter4")
          end if 
          if isdbnull(reader.item("ProcessParameter2")) then
            m_ProcessParameter2 = System.GUID.Empty
          else
            m_ProcessParameter2=reader.item("ProcessParameter2")
          end if 
        End Sub
        Public Property DocState1() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                DocState1 = me.application.Findrowobject("OBJSTATUS",m_DocState1)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_DocState1 = Value.id
                else
                   m_DocState1=System.Guid.Empty
                end if
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
        Public Property ProcessParameter() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                ProcessParameter = me.application.Findrowobject("WFDef_param",m_ProcessParameter)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_ProcessParameter = Value.id
                else
                   m_ProcessParameter=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property DocState2() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                DocState2 = me.application.Findrowobject("OBJSTATUS",m_DocState2)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_DocState2 = Value.id
                else
                   m_DocState2=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property PartField() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                PartField = me.application.Findrowobject("FIELD",m_PartField)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_PartField = Value.id
                else
                   m_PartField=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property ProcessParameter3() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                ProcessParameter3 = me.application.Findrowobject("WFDef_param",m_ProcessParameter3)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_ProcessParameter3 = Value.id
                else
                   m_ProcessParameter3=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
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
        Public Property Flag() As enumBoolean
            Get
                LoadFromDatabase()
                Flag = m_Flag
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_Flag = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property Path2() As STRING
            Get
                LoadFromDatabase()
                Path2 = m_Path2
                AccessTime = Now
            End Get
            Set(ByVal Value As STRING )
                LoadFromDatabase()
                m_Path2 = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property Path() As STRING
            Get
                LoadFromDatabase()
                Path = m_Path
                AccessTime = Now
            End Get
            Set(ByVal Value As STRING )
                LoadFromDatabase()
                m_Path = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property Flag2() As enumBoolean
            Get
                LoadFromDatabase()
                Flag2 = m_Flag2
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_Flag2 = Value
                ChangeTime = Now
            End Set
        End Property
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
        Public Property SubProcDocument() As String
            Get
                LoadFromDatabase()
                SubProcDocument = m_SubProcDocument
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_SubProcDocument = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property SubProcessType() As MKSNManager.Document.doc_base
            Get
                LoadFromDatabase()
                SubProcessType = me.application.manager.GetInstanceObject(m_SubProcessType)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.doc_base )
                LoadFromDatabase()
                if not  Value is nothing then
                  m_SubProcessType = Value.id
                else
                  m_SubProcessType =System.Guid.Empty 
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property ObjectType() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                ObjectType = me.application.Findrowobject("OBJECTTYPE",m_ObjectType)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_ObjectType = Value.id
                else
                   m_ObjectType=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property Value2() As String
            Get
                LoadFromDatabase()
                Value2 = m_Value2
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_Value2 = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property DocumentPart() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                DocumentPart = me.application.Findrowobject("PART",m_DocumentPart)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_DocumentPart = Value.id
                else
                   m_DocumentPart=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property ProcessParameter4() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                ProcessParameter4 = me.application.Findrowobject("WFDef_param",m_ProcessParameter4)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_ProcessParameter4 = Value.id
                else
                   m_ProcessParameter4=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property ProcessParameter2() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                ProcessParameter2 = me.application.Findrowobject("WFDef_param",m_ProcessParameter2)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_ProcessParameter2 = Value.id
                else
                   m_ProcessParameter2=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            m_DocState1 = new system.guid(node.Attributes.GetNamedItem("DocState1").Value)
            m_Folder = new system.guid(node.Attributes.GetNamedItem("Folder").Value)
            m_ProcessParameter = new system.guid(node.Attributes.GetNamedItem("ProcessParameter").Value)
            m_DocState2 = new system.guid(node.Attributes.GetNamedItem("DocState2").Value)
            m_PartField = new system.guid(node.Attributes.GetNamedItem("PartField").Value)
            m_ProcessParameter3 = new system.guid(node.Attributes.GetNamedItem("ProcessParameter3").Value)
            the_Value = node.Attributes.GetNamedItem("the_Value").Value
            Flag = node.Attributes.GetNamedItem("Flag").Value
            Path2 = node.Attributes.GetNamedItem("Path2").Value
            Path = node.Attributes.GetNamedItem("Path").Value
            Flag2 = node.Attributes.GetNamedItem("Flag2").Value
            m_ProcessDocument = new system.guid(node.Attributes.GetNamedItem("ProcessDocument").Value)
            SubProcDocument = node.Attributes.GetNamedItem("SubProcDocument").Value
            m_SubProcessType = new system.guid(node.Attributes.GetNamedItem("SubProcessType").Value)
            m_ObjectType = new system.guid(node.Attributes.GetNamedItem("ObjectType").Value)
            Value2 = node.Attributes.GetNamedItem("Value2").Value
            m_DocumentPart = new system.guid(node.Attributes.GetNamedItem("DocumentPart").Value)
            m_ProcessParameter4 = new system.guid(node.Attributes.GetNamedItem("ProcessParameter4").Value)
            m_ProcessParameter2 = new system.guid(node.Attributes.GetNamedItem("ProcessParameter2").Value)
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("DocState1", m_DocState1.tostring)  
          node.SetAttribute("Folder", m_Folder.tostring)  
          node.SetAttribute("ProcessParameter", m_ProcessParameter.tostring)  
          node.SetAttribute("DocState2", m_DocState2.tostring)  
          node.SetAttribute("PartField", m_PartField.tostring)  
          node.SetAttribute("ProcessParameter3", m_ProcessParameter3.tostring)  
          node.SetAttribute("the_Value", the_Value)  
          node.SetAttribute("Flag", Flag)  
          node.SetAttribute("Path2", Path2)  
          node.SetAttribute("Path", Path)  
          node.SetAttribute("Flag2", Flag2)  
          node.SetAttribute("ProcessDocument", m_ProcessDocument.tostring)  
          node.SetAttribute("SubProcDocument", SubProcDocument)  
          node.SetAttribute("SubProcessType", m_SubProcessType.tostring)  
          node.SetAttribute("ObjectType", m_ObjectType.tostring)  
          node.SetAttribute("Value2", Value2)  
          node.SetAttribute("DocumentPart", m_DocumentPart.tostring)  
          node.SetAttribute("ProcessParameter4", m_ProcessParameter4.tostring)  
          node.SetAttribute("ProcessParameter2", m_ProcessParameter2.tostring)  
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



