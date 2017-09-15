


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFDef
    Public Class WFDef_param
        Inherits MKSNManager.Document.DocRow_Base

            private m_SetBeforStart  as enumBoolean
            private m_Name  as String
            private m_the_Value  as String
            private m_NoChange  as enumBoolean

        Public Overrides Sub CleanFields()
            ' m_SetBeforStart=   
            ' m_Name=   
            ' m_the_Value=   
            ' m_NoChange=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             select case SetBeforStart
            case enumBoolean.Boolean_Da
              dr ("SetBeforStart")  = "Да"
              dr ("SetBeforStart_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("SetBeforStart")  = "Нет"
              dr ("SetBeforStart_VAL")  = 0
              end select 'SetBeforStart
             dr("Name") =Name
             dr("the_Value") =the_Value
             select case NoChange
            case enumBoolean.Boolean_Da
              dr ("NoChange")  = "Да"
              dr ("NoChange_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("NoChange")  = "Нет"
              dr ("NoChange_VAL")  = 0
              end select 'NoChange
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          nv.Add("SetBeforStart", SetBeforStart, dbtype.int16)
          nv.Add("Name", Name, dbtype.string)
          nv.Add("the_Value", the_Value, dbtype.string)
          nv.Add("NoChange", NoChange, dbtype.int16)
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
          m_SetBeforStart=reader.item("SetBeforStart")
          m_Name=reader.item("Name")
          m_the_Value=reader.item("the_Value")
          m_NoChange=reader.item("NoChange")
        End Sub
        Public Property SetBeforStart() As enumBoolean
            Get
                LoadFromDatabase()
                SetBeforStart = m_SetBeforStart
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_SetBeforStart = Value
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
        Public Property NoChange() As enumBoolean
            Get
                LoadFromDatabase()
                NoChange = m_NoChange
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_NoChange = Value
                ChangeTime = Now
            End Set
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            SetBeforStart = node.Attributes.GetNamedItem("SetBeforStart").Value
            Name = node.Attributes.GetNamedItem("Name").Value
            the_Value = node.Attributes.GetNamedItem("the_Value").Value
            NoChange = node.Attributes.GetNamedItem("NoChange").Value
             Changed = true
        End sub
        Public Overrides Sub Dispose()
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("SetBeforStart", SetBeforStart)  
          node.SetAttribute("Name", Name)  
          node.SetAttribute("the_Value", the_Value)  
          node.SetAttribute("NoChange", NoChange)  
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



