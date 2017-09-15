


Option Explicit On

Imports System
Imports System.IO
Imports MKSNManager
Imports System.xml
Imports System.Data
Imports System.Convert
Imports System.DateTime

Namespace WFDef
    Public Class WFDef_links
        Inherits MKSNManager.Document.DocRow_Base

            private m_ToFunc  as System.Guid
            private m_AcceptAnyResults  as enumBoolean
            private m_FromFunction  as System.Guid
        private m_WFDef_linkres As WFDef_linkres_col

        Public Overrides Sub CleanFields()
            ' m_ToFunc=   
            ' m_AcceptAnyResults=   
            ' m_FromFunction=   
        End Sub
        Public Overrides Sub FillDataTable(ByRef DestDataTable As System.Data.DataTable)
            Dim dr As  DataRow
            dr = destdatatable.NewRow
            on error resume next
            dr("ID") =ID
            dr("Brief") =Brief
             if ToFunc is nothing then
               dr("ToFunc") =system.dbnull.value
               dr("ToFunc_ID") =System.Guid.Empty
             else
               dr("ToFunc") =ToFunc.BRIEF
               dr("ToFunc_ID") =ToFunc.ID
             end if 
             select case AcceptAnyResults
            case enumBoolean.Boolean_Da
              dr ("AcceptAnyResults")  = "Да"
              dr ("AcceptAnyResults_VAL")  = -1
            case enumBoolean.Boolean_Net
              dr ("AcceptAnyResults")  = "Нет"
              dr ("AcceptAnyResults_VAL")  = 0
              end select 'AcceptAnyResults
             if FromFunction is nothing then
               dr("FromFunction") =system.dbnull.value
               dr("FromFunction_ID") =System.Guid.Empty
             else
               dr("FromFunction") =FromFunction.BRIEF
               dr("FromFunction_ID") =FromFunction.ID
             end if 
            DestDataTable.Rows.Add (dr)
        End Sub

        Public Overrides Function FindInside(ByVal Table As String, ByVal RowID As String) As MKSNManager.Document.DocRow_Base
            dim mFindInside As MKSNManager.Document.DocRow_Base = Nothing
            mFindInside = WFDef_linkres.FindObject(table,RowID)
            if not mFindInside is nothing then return mFindInside
            Return Nothing
        End Function

        Public Overrides Sub Pack(ByVal nv As MKSNManager.MKSN.NamedValues)
          if m_ToFunc.Equals(System.Guid.Empty) then
            nv.Add("ToFunc", system.dbnull.value, dbtype.guid)
          else
            nv.Add("ToFunc", m_ToFunc, dbtype.guid)
          end if 
          nv.Add("AcceptAnyResults", AcceptAnyResults, dbtype.int16)
          if m_FromFunction.Equals(System.Guid.Empty) then
            nv.Add("FromFunction", system.dbnull.value, dbtype.guid)
          else
            nv.Add("FromFunction", m_FromFunction, dbtype.guid)
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
          if isdbnull(reader.item("ToFunc")) then
            m_ToFunc = System.GUID.Empty
          else
            m_ToFunc=reader.item("ToFunc")
          end if 
          m_AcceptAnyResults=reader.item("AcceptAnyResults")
          if isdbnull(reader.item("FromFunction")) then
            m_FromFunction = System.GUID.Empty
          else
            m_FromFunction=reader.item("FromFunction")
          end if 
        End Sub
        Public Property ToFunc() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                ToFunc = me.application.Findrowobject("WFDef_func",m_ToFunc)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_ToFunc = Value.id
                else
                   m_ToFunc=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public Property AcceptAnyResults() As enumBoolean
            Get
                LoadFromDatabase()
                AcceptAnyResults = m_AcceptAnyResults
                AccessTime = Now
            End Get
            Set(ByVal Value As enumBoolean )
                LoadFromDatabase()
                m_AcceptAnyResults = Value
                ChangeTime = Now
            End Set
        End Property
        Public Property FromFunction() As MKSNManager.Document.docrow_base
            Get
                LoadFromDatabase()
                FromFunction = me.application.Findrowobject("WFDef_func",m_FromFunction)
                AccessTime = Now
            End Get
            Set(ByVal Value As MKSNManager.Document.docrow_base )
                LoadFromDatabase()
                if not Value is nothing then
                    m_FromFunction = Value.id
                else
                   m_FromFunction=System.Guid.Empty
                end if
                ChangeTime = Now
            End Set
        End Property
        Public readonly Property WFDef_linkres() As WFDef_linkres_col
            Get
                if  m_WFDef_linkres is nothing then
                  m_WFDef_linkres = new WFDef_linkres_col
                  m_WFDef_linkres.Parent = me
                  m_WFDef_linkres.Application = me.Application
                  m_WFDef_linkres.Refresh
                end if
                WFDef_linkres = m_WFDef_linkres
                AccessTime = Now
            End Get
        End Property
        Protected Overrides sub XMLUnpack(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
          Dim e_list As XmlNodeList
          on error resume next  
            m_ToFunc = new system.guid(node.Attributes.GetNamedItem("ToFunc").Value)
            AcceptAnyResults = node.Attributes.GetNamedItem("AcceptAnyResults").Value
            m_FromFunction = new system.guid(node.Attributes.GetNamedItem("FromFunction").Value)
            e_list = node.SelectNodes("WFDef_linkres_COL")
            WFDef_linkres.XMLLoad(e_list,LoadMode)
             Changed = true
        End sub
        Public Overrides Sub Dispose()
            WFDef_linkres.Dispose
        End Sub
        Protected Overrides sub XLMPack(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
           on error resume next  
          node.SetAttribute("ToFunc", m_ToFunc.tostring)  
          node.SetAttribute("AcceptAnyResults", AcceptAnyResults)  
          node.SetAttribute("FromFunction", m_FromFunction.tostring)  
            WFDef_linkres.XMLSave(node,xdom)
        End sub
Public Overrides Sub BatchUpdate()
If Not Application.WorkOffline Then
  If Deleted Then
    Delete
    Exit Sub
  End If
  If Changed Then Save
            WFDef_linkres.BatchUpdate
End If
End Sub
    End Class
End Namespace



