


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFRtm
    Public Class WFRTM_SUBPROCESS_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFRTM_SUBPROCESS"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("Process_ID" , GetType(System.guid))
            dt.Columns.Add("Process", Gettype(System.string))
            dt.Columns.Add("Name", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFRTM_SUBPROCESS
        End Function
        Public Function GetItem( vIndex as object ) As WFRtm.WFRTM_SUBPROCESS
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFRtm.WFRTM_SUBPROCESS))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFRtm.WFRTM_SUBPROCESS
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



