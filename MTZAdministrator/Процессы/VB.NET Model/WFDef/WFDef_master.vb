


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFDef
    Public Class WFDef_master
        Inherits MKSNManager.Document.DocRow_Base

            private m_AllowCheckState  as enumBoolean
            private m_AllowAnaliz  as enumBoolean
            private m_TheGroup  as System.Guid
            private m_AllowControl  as enumBoolean
            private m_AllowStart  as enumBoolean

        Public Overrides Sub CleanFields()
            ' m_AllowCheckState=   
            ' m_AllowAnaliz=   
            ' m_TheGroup=   
            ' m_AllowControl=   
            ' m_AllowStart=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             select case AllowCheckState
            case enumBoolean.Boolean_Da
              dr ("AllowCheckState")  = "Да"
              dr ("AllowCheckState_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("AllowCheckState")  = "Нет"
              dr ("AllowCheckState_VAL")  = 0
              end select 'AllowCheckState
             select case AllowAnaliz
            case enumBoolean.Boolean_Da
              dr ("AllowAnaliz")  = "Да"
              dr ("AllowAnaliz_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("AllowAnaliz")  = "Нет"
              dr ("AllowAnaliz_VAL")  = 0
              end select 'AllowAnaliz
             if TheGroup is nothing then
               dr("TheGroup") =system.dbnull.value
               dr("TheGroup_ID") =System.Guid.Empty
             else
               dr("TheGroup") =TheGroup.BRIEF
               dr("TheGroup_ID") =TheGroup.ID
             end if 
             select case AllowControl
            case enumBoolean.Boolean_Da
              dr ("AllowControl")  = "Да"
              dr ("AllowControl_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("AllowControl")  = "Нет"
              dr ("AllowControl_VAL")  = 0
              end select 'AllowControl
             select case AllowStart
            case enumBoolean.Boolean_Da
              dr ("AllowStart")  = "Да"
              dr ("AllowStart_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("AllowStart")  = "Нет"
              dr ("AllowStart_VAL")  = 0
              end select 'AllowStart
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          nv.Add("AllowCheckState", AllowCheckState, dbtype.int16)
          nv.Add("AllowAnaliz", AllowAnaliz, dbtype.int16)
          if m_TheGroup.Equals(System.Guid.Empty) then
            nv.Add("TheGroup", system.dbnull.value, dbtype.guid)
          else
            nv.Add("TheGroup", m_TheGroup, dbtype.guid)
          end if 
          nv.Add("AllowControl", AllowControl, dbtype.int16)
          nv.Add("AllowStart", AllowStart, dbtype.int16)
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
          m_AllowCheckState=reader.item("AllowCheckState")
          m_AllowAnaliz=reader.item("AllowAnaliz")
          if isdbnull(reader.item("TheGroup")) then
            m_TheGroup = System.GUID.Empty
          else
            m_TheGroup=reader.item("TheGroup")
          end if 
          m_AllowControl=reader.item("AllowControl")
          m_AllowStart=reader.item("AllowStart")
        End Sub
        Public Property AllowCheckState() As enumBoolean
            Get
                LoadFromDatabase()
                AllowCheckState = m_AllowCheckState
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_AllowCheckState = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property AllowAnaliz() As enumBoolean
            Get
                LoadFromDatabase()
                AllowAnaliz = m_AllowAnaliz
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_AllowAnaliz = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property TheGroup() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                TheGroup = me.application.Findrowobject("Users",m_TheGroup)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_TheGroup = Value.id
                else
                   m_TheGroup=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property AllowControl() As enumBoolean
            Get
                LoadFromDatabase()
                AllowControl = m_AllowControl
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_AllowControl = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property AllowStart() As enumBoolean
            Get
                LoadFromDatabase()
                AllowStart = m_AllowStart
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_AllowStart = Value
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            AllowCheckState = node.Attributes.GetNamedItem("AllowCheckState").Value
            AllowAnaliz = node.Attributes.GetNamedItem("AllowAnaliz").Value
            m_TheGroup = new system.guid(node.Attributes.GetNamedItem("TheGroup").Value)
            AllowControl = node.Attributes.GetNamedItem("AllowControl").Value
            AllowStart = node.Attributes.GetNamedItem("AllowStart").Value
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("AllowCheckState", AllowCheckState)  
          node.SetAttribute("AllowAnaliz", AllowAnaliz)  
          node.SetAttribute("TheGroup", m_TheGroup.tostring)  
          node.SetAttribute("AllowControl", AllowControl)  
          node.SetAttribute("AllowStart", AllowStart)  
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



