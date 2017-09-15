


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFDef
    Public Class WFDef_param_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFDef_param"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("SetBeforStart_VAL" , Gettype(System.Int16))
            dt.Columns.Add("SetBeforStart", Gettype(System.string))
            dt.Columns.Add("Name", Gettype(System.string))
            dt.Columns.Add("the_Value", Gettype(System.string))
            dt.Columns.Add("NoChange_VAL" , Gettype(System.Int16))
            dt.Columns.Add("NoChange", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFDef_param
        End Function
        Public Function GetItem( vIndex as object ) As WFDef.WFDef_param
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFDef.WFDef_param))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFDef.WFDef_param
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



