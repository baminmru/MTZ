


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFRtm
    Public Class WFRtm_main
        Inherits MKSNManager.Document.DocRow_Base

            private m_Moderator  as System.Guid
            private m_BasedOn  as System.Guid
            private m_ProcessState  as enumWFProcessState
            private m_the_Description  as STRING
            private m_Attachment  as Object

        Public Overrides Sub CleanFields()
            ' m_Moderator=   
            ' m_BasedOn=   
            ' m_ProcessState=   
            ' m_the_Description=   
            ' m_Attachment=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             if Moderator is nothing then
               dr("Moderator") =system.dbnull.value
               dr("Moderator_ID") =System.Guid.Empty
             else
               dr("Moderator") =Moderator.BRIEF
               dr("Moderator_ID") =Moderator.ID
             end if 
             if BasedOn is nothing then
               dr("BasedOn") =system.dbnull.value
               dr("BasedOn_ID") =System.Guid.Empty
             else
               dr("BasedOn") =BasedOn.BRIEF
               dr("BasedOn_ID") =BasedOn.ID
             end if 
             select case ProcessState
            case enumWFProcessState.WFProcessState_Active
              dr ("ProcessState")  = "Active"
              dr ("ProcessState_VAL")  = 2
            case enumWFProcessState.WFProcessState_Pause
              dr ("ProcessState")  = "Pause"
              dr ("ProcessState_VAL")  = 3
            case enumWFProcessState.WFProcessState_Processed
              dr ("ProcessState")  = "Processed"
              dr ("ProcessState_VAL")  = 5
            case enumWFProcessState.WFProcessState_Done
              dr ("ProcessState")  = "Done"
              dr ("ProcessState_VAL")  = 4
            case enumWFProcessState.WFProcessState_Prepare
              dr ("ProcessState")  = "Prepare"
              dr ("ProcessState_VAL")  = 1
            case enumWFProcessState.WFProcessState_Initial
              dr ("ProcessState")  = "Initial"
              dr ("ProcessState_VAL")  = 0
              end select 'ProcessState
             dr("the_Description") =the_Description
             dr("Attachment") =Attachment
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          if m_Moderator.Equals(System.Guid.Empty) then
            nv.Add("Moderator", system.dbnull.value, dbtype.guid)
          else
            nv.Add("Moderator", m_Moderator, dbtype.guid)
          end if 
          if m_BasedOn.Equals(System.Guid.Empty) then
            nv.Add("BasedOn", system.dbnull.value, dbtype.guid)
          else
            nv.Add("BasedOn", m_BasedOn, dbtype.guid)
          end if 
          nv.Add("ProcessState", ProcessState, dbtype.int16)
          nv.Add("the_Description", the_Description, dbtype.string)
          nv.Add("Attachment", Attachment, dbtype.Binary)
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
          if isdbnull(reader.item("Moderator")) then
            m_Moderator = System.GUID.Empty
          else
            m_Moderator=reader.item("Moderator")
          end if 
          if isdbnull(reader.item("BasedOn")) then
            m_BasedOn = System.GUID.Empty
          else
            m_BasedOn=reader.item("BasedOn")
          end if 
          m_ProcessState=reader.item("ProcessState")
          m_the_Description=reader.item("the_Description")
          m_Attachment=reader.item("Attachment")
        End Sub
        Public Property Moderator() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                Moderator = me.application.Findrowobject("Users",m_Moderator)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_Moderator = Value.id
                else
                   m_Moderator=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property BasedOn() As MKSNManager.Document.doc_base
            Get
                LoadFromDatabase()
                BasedOn = me.application.manager.GetInstanceObject(m_BasedOn)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.doc_base )
                LoadFromDatabase()
                if not  Value is nothing then
                  m_BasedOn = Value.id
                else
                  m_BasedOn =System.Guid.Empty 
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property ProcessState() As enumWFProcessState
            Get
                LoadFromDatabase()
                ProcessState = m_ProcessState
                AccessTime = Now
            End Get
            Set(ByVal Value As enumWFProcessState )
                LoadFromDatabase()
                m_ProcessState = Value
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
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            m_Moderator = new system.guid(node.Attributes.GetNamedItem("Moderator").Value)
            m_BasedOn = new system.guid(node.Attributes.GetNamedItem("BasedOn").Value)
            ProcessState = node.Attributes.GetNamedItem("ProcessState").Value
            the_Description = node.Attributes.GetNamedItem("the_Description").Value
            Attachment = node.Attributes.GetNamedItem("Attachment").Value
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("Moderator", m_Moderator.tostring)  
          node.SetAttribute("BasedOn", m_BasedOn.tostring)  
          node.SetAttribute("ProcessState", ProcessState)  
          node.SetAttribute("the_Description", the_Description)  
          node.SetAttribute("Attachment", Attachment)  
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



