


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFDic
    Public Class WFDic_presets_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFDic_presets"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("Name", Gettype(System.string))
            dt.Columns.Add("the_Value", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFDic_presets
        End Function
        Public Function GetItem( vIndex as object ) As WFDic.WFDic_presets
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFDic.WFDic_presets))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFDic.WFDic_presets
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



