


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFFD
    Public Class WFFD_CustomParam_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFFD_CustomParam"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("ParamName", Gettype(System.string))
            dt.Columns.Add("the_Value", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFFD_CustomParam
        End Function
        Public Function GetItem( vIndex as object ) As WFFD.WFFD_CustomParam
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFFD.WFFD_CustomParam))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFFD.WFFD_CustomParam
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



