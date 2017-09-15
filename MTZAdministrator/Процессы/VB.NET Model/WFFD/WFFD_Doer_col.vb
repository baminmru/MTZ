


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFFD
    Public Class WFFD_Doer_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFFD_Doer"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("DoerGroup_ID" , GetType(System.guid))
            dt.Columns.Add("DoerGroup", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFFD_Doer
        End Function
        Public Function GetItem( vIndex as object ) As WFFD.WFFD_Doer
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFFD.WFFD_Doer))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFFD.WFFD_Doer
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



