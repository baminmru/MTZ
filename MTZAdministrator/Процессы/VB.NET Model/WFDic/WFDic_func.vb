


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFDic
    Public Class WFDic_func
        Inherits MKSNManager.Document.DocRow_Base

            private m_StepClass  as enumWFStepClass
            private m_the_Comment  as STRING
            private m_ProgID  as String
            private m_RTMProgID  as String
            private m_IsMailStone  as enumBoolean
            private m_Name  as String
            private m_IntegrationData2  as String
            private m_EdtMode  as String
            private m_IconName  as String
            private m_IntegrationData1  as String
        private m_WFDic_presets As WFDic_presets_col

        Public Overrides Sub CleanFields()
            ' m_StepClass=   
            ' m_the_Comment=   
            ' m_ProgID=   
            ' m_RTMProgID=   
            ' m_IsMailStone=   
            ' m_Name=   
            ' m_IntegrationData2=   
            ' m_EdtMode=   
            ' m_IconName=   
            ' m_IntegrationData1=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             select case StepClass
            case enumWFStepClass.WFStepClass_SimpleFunction
              dr ("StepClass")  = "SimpleFunction"
              dr ("StepClass_VAL")  = 0
            case enumWFStepClass.WFStepClass_StartFunction
              dr ("StepClass")  = "StartFunction"
              dr ("StepClass_VAL")  = 1
            case enumWFStepClass.WFStepClass_StopFunction
              dr ("StepClass")  = "StopFunction"
              dr ("StepClass_VAL")  = 2
            case enumWFStepClass.WFStepClass_PeriodicFunction
              dr ("StepClass")  = "PeriodicFunction"
              dr ("StepClass_VAL")  = 3
              end select 'StepClass
             dr("the_Comment") =the_Comment
             dr("ProgID") =ProgID
             dr("RTMProgID") =RTMProgID
             select case IsMailStone
            case enumBoolean.Boolean_Da
              dr ("IsMailStone")  = "Да"
              dr ("IsMailStone_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("IsMailStone")  = "Нет"
              dr ("IsMailStone_VAL")  = 0
              end select 'IsMailStone
             dr("Name") =Name
             dr("IntegrationData2") =IntegrationData2
             dr("EdtMode") =EdtMode
             dr("IconName") =IconName
             dr("IntegrationData1") =IntegrationData1
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            mFindInside = WFDic_presets.FindObject(table,RowID)
            if not mFindInside is nothing then return mFindInside
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          nv.Add("StepClass", StepClass, dbtype.int16)
          nv.Add("the_Comment", the_Comment, dbtype.string)
          nv.Add("ProgID", ProgID, dbtype.string)
          nv.Add("RTMProgID", RTMProgID, dbtype.string)
          nv.Add("IsMailStone", IsMailStone, dbtype.int16)
          nv.Add("Name", Name, dbtype.string)
          nv.Add("IntegrationData2", IntegrationData2, dbtype.string)
          nv.Add("EdtMode", EdtMode, dbtype.string)
          nv.Add("IconName", IconName, dbtype.string)
          nv.Add("IntegrationData1", IntegrationData1, dbtype.string)
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
          m_StepClass=reader.item("StepClass")
          m_the_Comment=reader.item("the_Comment")
          m_ProgID=reader.item("ProgID")
          m_RTMProgID=reader.item("RTMProgID")
          m_IsMailStone=reader.item("IsMailStone")
          m_Name=reader.item("Name")
          m_IntegrationData2=reader.item("IntegrationData2")
          m_EdtMode=reader.item("EdtMode")
          m_IconName=reader.item("IconName")
          m_IntegrationData1=reader.item("IntegrationData1")
        End Sub
        Public Property StepClass() As enumWFStepClass
            Get
                LoadFromDatabase()
                StepClass = m_StepClass
                AccessTime = Now
            End Get
            Set(ByVal Value As enumWFStepClass )
                LoadFromDatabase()
                m_StepClass = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property the_Comment() As STRING
            Get
                LoadFromDatabase()
                the_Comment = m_the_Comment
                AccessTime = Now
            End Get
            Set(ByVal Value As STRING )
                LoadFromDatabase()
                m_the_Comment = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property ProgID() As String
            Get
                LoadFromDatabase()
                ProgID = m_ProgID
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_ProgID = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property RTMProgID() As String
            Get
                LoadFromDatabase()
                RTMProgID = m_RTMProgID
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_RTMProgID = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property IsMailStone() As enumBoolean
            Get
                LoadFromDatabase()
                IsMailStone = m_IsMailStone
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_IsMailStone = Value
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
        Public Property EdtMode() As String
            Get
                LoadFromDatabase()
                EdtMode = m_EdtMode
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_EdtMode = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property IconName() As String
            Get
                LoadFromDatabase()
                IconName = m_IconName
                AccessTime = Now
            End Get
            Set(ByVal Value As String )
                LoadFromDatabase()
                m_IconName = Value
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
        Public readonly Property WFDic_presets() As WFDic_presets_col
            Get
                if  m_WFDic_presets is nothing then
                  m_WFDic_presets = new WFDic_presets_col
                  m_WFDic_presets.Parent = me
                  m_WFDic_presets.Application = me.Application
                  m_WFDic_presets.Refresh
                end if
                WFDic_presets = m_WFDic_presets
                AccessTime = Now
            End Get
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            StepClass = node.Attributes.GetNamedItem("StepClass").Value
            the_Comment = node.Attributes.GetNamedItem("the_Comment").Value
            ProgID = node.Attributes.GetNamedItem("ProgID").Value
            RTMProgID = node.Attributes.GetNamedItem("RTMProgID").Value
            IsMailStone = node.Attributes.GetNamedItem("IsMailStone").Value
            Name = node.Attributes.GetNamedItem("Name").Value
            IntegrationData2 = node.Attributes.GetNamedItem("IntegrationData2").Value
            EdtMode = node.Attributes.GetNamedItem("EdtMode").Value
            IconName = node.Attributes.GetNamedItem("IconName").Value
            IntegrationData1 = node.Attributes.GetNamedItem("IntegrationData1").Value
            e_list = node.SelectNodes("WFDic_presets_COL")
            WFDic_presets.XMLLoad(e_list,LoadMode)
             Changed = true
        End sub
        Public Overrides Sub Dispose()
            WFDic_presets.Dispose
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("StepClass", StepClass)  
          node.SetAttribute("the_Comment", the_Comment)  
          node.SetAttribute("ProgID", ProgID)  
          node.SetAttribute("RTMProgID", RTMProgID)  
          node.SetAttribute("IsMailStone", IsMailStone)  
          node.SetAttribute("Name", Name)  
          node.SetAttribute("IntegrationData2", IntegrationData2)  
          node.SetAttribute("EdtMode", EdtMode)  
          node.SetAttribute("IconName", IconName)  
          node.SetAttribute("IntegrationData1", IntegrationData1)  
            WFDic_presets.XMLSave(node,xdom)
        End sub
Public Overrides Sub BatchUpdate()
If Not Application.WorkOffline Then
  If Deleted Then
    Delete
    Exit Sub
  End If
  If Changed Then Save
            WFDic_presets.BatchUpdate
End If
End Sub
    End Class
End Namespace



