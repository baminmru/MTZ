


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFFD
    Public Class WFFD_common
        Inherits MKSNManager.Document.DocRow_Base

            private m_MaxPassNumber  as long
            private m_ReuseStep  as enumBoolean
            private m_TaskDescription  as STRING
            private m_StepType  as System.Guid
            private m_MaxPriority  as long
            private m_AutoCheckState  as enumBoolean
            private m_Name  as String
            private m_WorkTime  as double
            private m_GrowPriorityInterval  as long
            private m_IncPriority  as long
            private m_ReStartInterval  as long
            private m_MinPriority  as long
            private m_IntegrationData1  as String
            private m_StateCeckInterval  as long
            private m_Attachment  as Object
            private m_IntegrationData2  as String

        Public Overrides Sub CleanFields()
            ' m_MaxPassNumber=   
            ' m_ReuseStep=   
            ' m_TaskDescription=   
            ' m_StepType=   
            ' m_MaxPriority=   
            ' m_AutoCheckState=   
            ' m_Name=   
            ' m_WorkTime=   
            ' m_GrowPriorityInterval=   
            ' m_IncPriority=   
            ' m_ReStartInterval=   
            ' m_MinPriority=   
            ' m_IntegrationData1=   
            ' m_StateCeckInterval=   
            ' m_Attachment=   
            ' m_IntegrationData2=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             dr("MaxPassNumber") =MaxPassNumber
             select case ReuseStep
            case enumBoolean.Boolean_Da
              dr ("ReuseStep")  = "Да"
              dr ("ReuseStep_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("ReuseStep")  = "Нет"
              dr ("ReuseStep_VAL")  = 0
              end select 'ReuseStep
             dr("TaskDescription") =TaskDescription
             if StepType is nothing then
               dr("StepType") =system.dbnull.value
               dr("StepType_ID") =System.Guid.Empty
             else
               dr("StepType") =StepType.BRIEF
               dr("StepType_ID") =StepType.ID
             end if 
             dr("MaxPriority") =MaxPriority
             select case AutoCheckState
            case enumBoolean.Boolean_Da
              dr ("AutoCheckState")  = "Да"
              dr ("AutoCheckState_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("AutoCheckState")  = "Нет"
              dr ("AutoCheckState_VAL")  = 0
              end select 'AutoCheckState
             dr("Name") =Name
             dr("WorkTime") =WorkTime
             dr("GrowPriorityInterval") =GrowPriorityInterval
             dr("IncPriority") =IncPriority
             dr("ReStartInterval") =ReStartInterval
             dr("MinPriority") =MinPriority
             dr("IntegrationData1") =IntegrationData1
             dr("StateCeckInterval") =StateCeckInterval
             dr("Attachment") =Attachment
             dr("IntegrationData2") =IntegrationData2
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          nv.Add("MaxPassNumber", MaxPassNumber, dbtype.Int32)
          nv.Add("ReuseStep", ReuseStep, dbtype.int16)
          nv.Add("TaskDescription", TaskDescription, dbtype.string)
          if m_StepType.Equals(System.Guid.Empty) then
            nv.Add("StepType", system.dbnull.value, dbtype.guid)
          else
            nv.Add("StepType", m_StepType, dbtype.guid)
          end if 
          nv.Add("MaxPriority", MaxPriority, dbtype.Int32)
          nv.Add("AutoCheckState", AutoCheckState, dbtype.int16)
          nv.Add("Name", Name, dbtype.string)
          nv.Add("WorkTime", WorkTime, dbtype.double)
          nv.Add("GrowPriorityInterval", GrowPriorityInterval, dbtype.Int32)
          nv.Add("IncPriority", IncPriority, dbtype.Int32)
          nv.Add("ReStartInterval", ReStartInterval, dbtype.Int32)
          nv.Add("MinPriority", MinPriority, dbtype.Int32)
          nv.Add("IntegrationData1", IntegrationData1, dbtype.string)
          nv.Add("StateCeckInterval", StateCeckInterval, dbtype.Int32)
          nv.Add("Attachment", Attachment, dbtype.Binary)
          nv.Add("IntegrationData2", IntegrationData2, dbtype.string)
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
          m_MaxPassNumber=reader.item("MaxPassNumber")
          m_ReuseStep=reader.item("ReuseStep")
          m_TaskDescription=reader.item("TaskDescription")
          if isdbnull(reader.item("StepType")) then
            m_StepType = System.GUID.Empty
          else
            m_StepType=reader.item("StepType")
          end if 
          m_MaxPriority=reader.item("MaxPriority")
          m_AutoCheckState=reader.item("AutoCheckState")
          m_Name=reader.item("Name")
          m_WorkTime=reader.item("WorkTime")
          m_GrowPriorityInterval=reader.item("GrowPriorityInterval")
          m_IncPriority=reader.item("IncPriority")
          m_ReStartInterval=reader.item("ReStartInterval")
          m_MinPriority=reader.item("MinPriority")
          m_IntegrationData1=reader.item("IntegrationData1")
          m_StateCeckInterval=reader.item("StateCeckInterval")
          m_Attachment=reader.item("Attachment")
          m_IntegrationData2=reader.item("IntegrationData2")
        End Sub
        Public Property MaxPassNumber() As long
            Get
                LoadFromDatabase()
                MaxPassNumber = m_MaxPassNumber
                AccessTime = Now
            End Get
            Set(ByVal Value As long )
                LoadFromDatabase()
                m_MaxPassNumber = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property ReuseStep() As enumBoolean
            Get
                LoadFromDatabase()
                ReuseStep = m_ReuseStep
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_ReuseStep = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property TaskDescription() As STRING
            Get
                LoadFromDatabase()
                TaskDescription = m_TaskDescription
                AccessTime = Now
            End Get
            Set(ByVal Value As STRING )
                LoadFromDatabase()
                m_TaskDescription = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property StepType() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                StepType = me.application.Findrowobject("WFDic_func",m_StepType)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_StepType = Value.id
                else
                   m_StepType=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property MaxPriority() As long
            Get
                LoadFromDatabase()
                MaxPriority = m_MaxPriority
                AccessTime = Now
            End Get
            Set(ByVal Value As long )
                LoadFromDatabase()
                m_MaxPriority = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property AutoCheckState() As enumBoolean
            Get
                LoadFromDatabase()
                AutoCheckState = m_AutoCheckState
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_AutoCheckState = Value
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
        Public Property WorkTime() As double
            Get
                LoadFromDatabase()
                WorkTime = m_WorkTime
                AccessTime = Now
            End Get
            Set(ByVal Value As double )
                LoadFromDatabase()
                m_WorkTime = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property GrowPriorityInterval() As long
            Get
                LoadFromDatabase()
                GrowPriorityInterval = m_GrowPriorityInterval
                AccessTime = Now
            End Get
            Set(ByVal Value As long )
                LoadFromDatabase()
                m_GrowPriorityInterval = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property IncPriority() As long
            Get
                LoadFromDatabase()
                IncPriority = m_IncPriority
                AccessTime = Now
            End Get
            Set(ByVal Value As long )
                LoadFromDatabase()
                m_IncPriority = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property ReStartInterval() As long
            Get
                LoadFromDatabase()
                ReStartInterval = m_ReStartInterval
                AccessTime = Now
            End Get
            Set(ByVal Value As long )
                LoadFromDatabase()
                m_ReStartInterval = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property MinPriority() As long
            Get
                LoadFromDatabase()
                MinPriority = m_MinPriority
                AccessTime = Now
            End Get
            Set(ByVal Value As long )
                LoadFromDatabase()
                m_MinPriority = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property IntegrationData1() As String
            Get
                LoadFromDatabase()
                IntegrationData1 = m_IntegrationData1
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_IntegrationData1 = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property StateCeckInterval() As long
            Get
                LoadFromDatabase()
                StateCeckInterval = m_StateCeckInterval
                AccessTime = Now
            End Get
            Set(ByVal Value As long )
                LoadFromDatabase()
                m_StateCeckInterval = Value
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
        Public Property IntegrationData2() As String
            Get
                LoadFromDatabase()
                IntegrationData2 = m_IntegrationData2
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_IntegrationData2 = Value
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            MaxPassNumber = node.Attributes.GetNamedItem("MaxPassNumber").Value
            ReuseStep = node.Attributes.GetNamedItem("ReuseStep").Value
            TaskDescription = node.Attributes.GetNamedItem("TaskDescription").Value
            m_StepType = new system.guid(node.Attributes.GetNamedItem("StepType").Value)
            MaxPriority = node.Attributes.GetNamedItem("MaxPriority").Value
            AutoCheckState = node.Attributes.GetNamedItem("AutoCheckState").Value
            Name = node.Attributes.GetNamedItem("Name").Value
            WorkTime = node.Attributes.GetNamedItem("WorkTime").Value
            GrowPriorityInterval = node.Attributes.GetNamedItem("GrowPriorityInterval").Value
            IncPriority = node.Attributes.GetNamedItem("IncPriority").Value
            ReStartInterval = node.Attributes.GetNamedItem("ReStartInterval").Value
            MinPriority = node.Attributes.GetNamedItem("MinPriority").Value
            IntegrationData1 = node.Attributes.GetNamedItem("IntegrationData1").Value
            StateCeckInterval = node.Attributes.GetNamedItem("StateCeckInterval").Value
            Attachment = node.Attributes.GetNamedItem("Attachment").Value
            IntegrationData2 = node.Attributes.GetNamedItem("IntegrationData2").Value
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("MaxPassNumber", MaxPassNumber)  
          node.SetAttribute("ReuseStep", ReuseStep)  
          node.SetAttribute("TaskDescription", TaskDescription)  
          node.SetAttribute("StepType", m_StepType.tostring)  
          node.SetAttribute("MaxPriority", MaxPriority)  
          node.SetAttribute("AutoCheckState", AutoCheckState)  
          node.SetAttribute("Name", Name)  
          node.SetAttribute("WorkTime", WorkTime)  
          node.SetAttribute("GrowPriorityInterval", GrowPriorityInterval)  
          node.SetAttribute("IncPriority", IncPriority)  
          node.SetAttribute("ReStartInterval", ReStartInterval)  
          node.SetAttribute("MinPriority", MinPriority)  
          node.SetAttribute("IntegrationData1", IntegrationData1)  
          node.SetAttribute("StateCeckInterval", StateCeckInterval)  
          node.SetAttribute("Attachment", Attachment)  
          node.SetAttribute("IntegrationData2", IntegrationData2)  
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



