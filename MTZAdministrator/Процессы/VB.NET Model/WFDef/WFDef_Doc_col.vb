


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFDef
    Public Class WFDef_Doc_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFDef_Doc"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("ArchiveMode", Gettype(System.string))
            dt.Columns.Add("ArchveFolder_ID" , GetType(System.guid))
            dt.Columns.Add("ArchveFolder", Gettype(System.string))
            dt.Columns.Add("DocTemplate_ID" , GetType(System.guid))
            dt.Columns.Add("DocTemplate", Gettype(System.string))
            dt.Columns.Add("SetBeforStart_VAL" , Gettype(System.Int16))
            dt.Columns.Add("SetBeforStart", Gettype(System.string))
            dt.Columns.Add("DocType_ID" , GetType(System.guid))
            dt.Columns.Add("DocType", Gettype(System.string))
            dt.Columns.Add("CreateInRuntime_VAL" , Gettype(System.Int16))
            dt.Columns.Add("CreateInRuntime", Gettype(System.string))
            dt.Columns.Add("Name", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFDef_Doc
        End Function
        Public Function GetItem( vIndex as object ) As WFDef.WFDef_Doc
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFDef.WFDef_Doc))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFDef.WFDef_Doc
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



