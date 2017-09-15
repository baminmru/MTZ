


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFFD
    Public Class WFFD_DOCS_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFFD_DOCS"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("ProcessDocument_ID" , GetType(System.guid))
            dt.Columns.Add("ProcessDocument", Gettype(System.string))
            dt.Columns.Add("DocMode", Gettype(System.string))
            dt.Columns.Add("AllowWrite_VAL" , Gettype(System.Int16))
            dt.Columns.Add("AllowWrite", Gettype(System.string))
            dt.Columns.Add("AllowCreate_VAL" , Gettype(System.Int16))
            dt.Columns.Add("AllowCreate", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFFD_DOCS
        End Function
        Public Function GetItem( vIndex as object ) As WFFD.WFFD_DOCS
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFFD.WFFD_DOCS))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFFD.WFFD_DOCS
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



