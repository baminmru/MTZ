


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFFR
    Public Class WFFR_func
        Inherits MKSNManager.Document.DocRow_Base

            private m_CreateAt  as DATE
            private m_Priority  as long
            private m_WorkPercent  as long
            private m_BasedOn  as System.Guid
            private m_LastStateScan  as DATE
            private m_FuncResult  as String
            private m_PassNo  as long
            private m_ChangePriorityTime  as DATE
            private m_LastStart  as DATE
            private m_Info  as STRING
            private m_State  as enumWFFuncState

        Public Overrides Sub CleanFields()
            ' m_CreateAt=   
            ' m_Priority=   
            ' m_WorkPercent=   
            ' m_BasedOn=   
            ' m_LastStateScan=   
            ' m_FuncResult=   
            ' m_PassNo=   
            ' m_ChangePriorityTime=   
            ' m_LastStart=   
            ' m_Info=   
            ' m_State=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             dr("CreateAt") =CreateAt
             dr("Priority") =Priority
             dr("WorkPercent") =WorkPercent
             if BasedOn is nothing then
               dr("BasedOn") =system.dbnull.value
               dr("BasedOn_ID") =System.Guid.Empty
             else
               dr("BasedOn") =BasedOn.BRIEF
               dr("BasedOn_ID") =BasedOn.ID
             end if 
             dr("LastStateScan") =LastStateScan
             dr("FuncResult") =FuncResult
             dr("PassNo") =PassNo
             dr("ChangePriorityTime") =ChangePriorityTime
             dr("LastStart") =LastStart
             dr("Info") =Info
             select case State
            case enumWFFuncState.WFFuncState_Processed
              dr ("State")  = "Processed"
              dr ("State_VAL")  = 8
            case enumWFFuncState.WFFuncState_InWork
              dr ("State")  = "InWork"
              dr ("State_VAL")  = 3
            case enumWFFuncState.WFFuncState_Pause
              dr ("State")  = "Pause"
              dr ("State_VAL")  = 4
            case enumWFFuncState.WFFuncState_Ready
              dr ("State")  = "Ready"
              dr ("State_VAL")  = 5
            case enumWFFuncState.WFFuncState_InControl
              dr ("State")  = "InControl"
              dr ("State_VAL")  = 6
            case enumWFFuncState.WFFuncState_Prepare
              dr ("State")  = "Prepare"
              dr ("State_VAL")  = 1
            case enumWFFuncState.WFFuncState_Active
              dr ("State")  = "Active"
              dr ("State_VAL")  = 2
            case enumWFFuncState.WFFuncState_Done
              dr ("State")  = "Done"
              dr ("State_VAL")  = 7
            case enumWFFuncState.WFFuncState_Initial
              dr ("State")  = "Initial"
              dr ("State_VAL")  = 0
              end select 'State
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          if CreateAt=System.DateTime.MinValue then
            nv.Add("CreateAt", system.dbnull.value, dbtype.DATETIME)
          else
            nv.Add("CreateAt", CreateAt, dbtype.DATETIME)
          end if 
          nv.Add("Priority", Priority, dbtype.Int32)
          nv.Add("WorkPercent", WorkPercent, dbtype.Int32)
          if m_BasedOn.Equals(System.Guid.Empty) then
            nv.Add("BasedOn", system.dbnull.value, dbtype.guid)
          else
            nv.Add("BasedOn", m_BasedOn, dbtype.guid)
          end if 
          if LastStateScan=System.DateTime.MinValue then
            nv.Add("LastStateScan", system.dbnull.value, dbtype.DATETIME)
          else
            nv.Add("LastStateScan", LastStateScan, dbtype.DATETIME)
          end if 
          nv.Add("FuncResult", FuncResult, dbtype.string)
          nv.Add("PassNo", PassNo, dbtype.Int32)
          if ChangePriorityTime=System.DateTime.MinValue then
            nv.Add("ChangePriorityTime", system.dbnull.value, dbtype.DATETIME)
          else
            nv.Add("ChangePriorityTime", ChangePriorityTime, dbtype.DATETIME)
          end if 
          if LastStart=System.DateTime.MinValue then
            nv.Add("LastStart", system.dbnull.value, dbtype.DATETIME)
          else
            nv.Add("LastStart", LastStart, dbtype.DATETIME)
          end if 
          nv.Add("Info", Info, dbtype.string)
          nv.Add("State", State, dbtype.int16)
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
          if isdbnull(reader.item("CreateAt")) then
            m_CreateAt = System.DateTime.MinValue
          else
            m_CreateAt=reader.item("CreateAt")
          end if 
          m_Priority=reader.item("Priority")
          m_WorkPercent=reader.item("WorkPercent")
          if isdbnull(reader.item("BasedOn")) then
            m_BasedOn = System.GUID.Empty
          else
            m_BasedOn=reader.item("BasedOn")
          end if 
          if isdbnull(reader.item("LastStateScan")) then
            m_LastStateScan = System.DateTime.MinValue
          else
            m_LastStateScan=reader.item("LastStateScan")
          end if 
          m_FuncResult=reader.item("FuncResult")
          m_PassNo=reader.item("PassNo")
          if isdbnull(reader.item("ChangePriorityTime")) then
            m_ChangePriorityTime = System.DateTime.MinValue
          else
            m_ChangePriorityTime=reader.item("ChangePriorityTime")
          end if 
          if isdbnull(reader.item("LastStart")) then
            m_LastStart = System.DateTime.MinValue
          else
            m_LastStart=reader.item("LastStart")
          end if 
          m_Info=reader.item("Info")
          m_State=reader.item("State")
        End Sub
        Public Property CreateAt() As DATE
            Get
                LoadFromDatabase()
                CreateAt = m_CreateAt
                AccessTime = Now
            End Get
            Set(ByVal Value As DATE )
                LoadFromDatabase()
                m_CreateAt = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property Priority() As long
            Get
                LoadFromDatabase()
                Priority = m_Priority
                AccessTime = Now
            End Get
            Set(ByVal Value As long )
                LoadFromDatabase()
                m_Priority = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property WorkPercent() As long
            Get
                LoadFromDatabase()
                WorkPercent = m_WorkPercent
                AccessTime = Now
            End Get
            Set(ByVal Value As long )
                LoadFromDatabase()
                m_WorkPercent = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property BasedOn() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                BasedOn = me.application.Findrowobject("WFDef_func",m_BasedOn)
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
        Public Property LastStateScan() As DATE
            Get
                LoadFromDatabase()
                LastStateScan = m_LastStateScan
                AccessTime = Now
            End Get
            Set(ByVal Value As DATE )
                LoadFromDatabase()
                m_LastStateScan = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property FuncResult() As String
            Get
                LoadFromDatabase()
                FuncResult = m_FuncResult
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_FuncResult = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property PassNo() As long
            Get
                LoadFromDatabase()
                PassNo = m_PassNo
                AccessTime = Now
            End Get
            Set(ByVal Value As long )
                LoadFromDatabase()
                m_PassNo = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property ChangePriorityTime() As DATE
            Get
                LoadFromDatabase()
                ChangePriorityTime = m_ChangePriorityTime
                AccessTime = Now
            End Get
            Set(ByVal Value As DATE )
                LoadFromDatabase()
                m_ChangePriorityTime = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property LastStart() As DATE
            Get
                LoadFromDatabase()
                LastStart = m_LastStart
                AccessTime = Now
            End Get
            Set(ByVal Value As DATE )
                LoadFromDatabase()
                m_LastStart = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property Info() As STRING
            Get
                LoadFromDatabase()
                Info = m_Info
                AccessTime = Now
            End Get
            Set(ByVal Value As STRING )
                LoadFromDatabase()
                m_Info = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property State() As enumWFFuncState
            Get
                LoadFromDatabase()
                State = m_State
                AccessTime = Now
            End Get
            Set(ByVal Value As enumWFFuncState )
                LoadFromDatabase()
                m_State = Value
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            m_CreateAt = System.DateTime.MinValue
            CreateAt = m_CreateAt.AddTicks( node.Attributes.GetNamedItem("CreateAt").Value)
            Priority = node.Attributes.GetNamedItem("Priority").Value
            WorkPercent = node.Attributes.GetNamedItem("WorkPercent").Value
            m_BasedOn = new system.guid(node.Attributes.GetNamedItem("BasedOn").Value)
            m_LastStateScan = System.DateTime.MinValue
            LastStateScan = m_LastStateScan.AddTicks( node.Attributes.GetNamedItem("LastStateScan").Value)
            FuncResult = node.Attributes.GetNamedItem("FuncResult").Value
            PassNo = node.Attributes.GetNamedItem("PassNo").Value
            m_ChangePriorityTime = System.DateTime.MinValue
            ChangePriorityTime = m_ChangePriorityTime.AddTicks( node.Attributes.GetNamedItem("ChangePriorityTime").Value)
            m_LastStart = System.DateTime.MinValue
            LastStart = m_LastStart.AddTicks( node.Attributes.GetNamedItem("LastStart").Value)
            Info = node.Attributes.GetNamedItem("Info").Value
            State = node.Attributes.GetNamedItem("State").Value
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          if CreateAt = System.DateTime.MinValue then CreateAt=System.DateTime.Parse("12/30/1899")
          node.SetAttribute("CreateAt", CreateAt.Ticks)  
          node.SetAttribute("Priority", Priority)  
          node.SetAttribute("WorkPercent", WorkPercent)  
          node.SetAttribute("BasedOn", m_BasedOn.tostring)  
          if LastStateScan = System.DateTime.MinValue then LastStateScan=System.DateTime.Parse("12/30/1899")
          node.SetAttribute("LastStateScan", LastStateScan.Ticks)  
          node.SetAttribute("FuncResult", FuncResult)  
          node.SetAttribute("PassNo", PassNo)  
          if ChangePriorityTime = System.DateTime.MinValue then ChangePriorityTime=System.DateTime.Parse("12/30/1899")
          node.SetAttribute("ChangePriorityTime", ChangePriorityTime.Ticks)  
          if LastStart = System.DateTime.MinValue then LastStart=System.DateTime.Parse("12/30/1899")
          node.SetAttribute("LastStart", LastStart.Ticks)  
          node.SetAttribute("Info", Info)  
          node.SetAttribute("State", State)  
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



