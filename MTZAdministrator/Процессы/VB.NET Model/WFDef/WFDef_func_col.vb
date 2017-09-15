


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFDef
    Public Class WFDef_func_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFDef_func"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("Func_ID" , GetType(System.guid))
            dt.Columns.Add("Func", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFDef_func
        End Function
        Public Function GetItem( vIndex as object ) As WFDef.WFDef_func
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFDef.WFDef_func))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFDef.WFDef_func
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



