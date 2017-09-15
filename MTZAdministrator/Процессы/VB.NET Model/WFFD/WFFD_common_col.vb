


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFFD
    Public Class WFFD_common_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFFD_common"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("MaxPassNumber", Gettype(System.Int32))
            dt.Columns.Add("ReuseStep_VAL" , Gettype(System.Int16))
            dt.Columns.Add("ReuseStep", Gettype(System.string))
            dt.Columns.Add("TaskDescription", Gettype(System.string))
            dt.Columns.Add("StepType_ID" , GetType(System.guid))
            dt.Columns.Add("StepType", Gettype(System.string))
            dt.Columns.Add("MaxPriority", Gettype(System.Int32))
            dt.Columns.Add("AutoCheckState_VAL" , Gettype(System.Int16))
            dt.Columns.Add("AutoCheckState", Gettype(System.string))
            dt.Columns.Add("Name", Gettype(System.string))
            dt.Columns.Add("WorkTime", GetType(System.double))
            dt.Columns.Add("GrowPriorityInterval", Gettype(System.Int32))
            dt.Columns.Add("IncPriority", Gettype(System.Int32))
            dt.Columns.Add("ReStartInterval", Gettype(System.Int32))
            dt.Columns.Add("MinPriority", Gettype(System.Int32))
            dt.Columns.Add("IntegrationData1", Gettype(System.string))
            dt.Columns.Add("StateCeckInterval", Gettype(System.Int32))
            dt.Columns.Add("Attachment", GetType(System.object))
            dt.Columns.Add("IntegrationData2", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFFD_common
        End Function
        Public Function GetItem( vIndex as object ) As WFFD.WFFD_common
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFFD.WFFD_common))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFFD.WFFD_common
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



