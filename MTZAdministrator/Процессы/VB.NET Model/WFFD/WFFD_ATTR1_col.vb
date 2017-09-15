


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFFD
    Public Class WFFD_ATTR1_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFFD_ATTR1"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("DocState1_ID" , GetType(System.guid))
            dt.Columns.Add("DocState1", Gettype(System.string))
            dt.Columns.Add("Folder_ID" , GetType(System.guid))
            dt.Columns.Add("Folder", Gettype(System.string))
            dt.Columns.Add("ProcessParameter_ID" , GetType(System.guid))
            dt.Columns.Add("ProcessParameter", Gettype(System.string))
            dt.Columns.Add("DocState2_ID" , GetType(System.guid))
            dt.Columns.Add("DocState2", Gettype(System.string))
            dt.Columns.Add("PartField_ID" , GetType(System.guid))
            dt.Columns.Add("PartField", Gettype(System.string))
            dt.Columns.Add("ProcessParameter3_ID" , GetType(System.guid))
            dt.Columns.Add("ProcessParameter3", Gettype(System.string))
            dt.Columns.Add("the_Value", Gettype(System.string))
            dt.Columns.Add("Flag_VAL" , Gettype(System.Int16))
            dt.Columns.Add("Flag", Gettype(System.string))
            dt.Columns.Add("Path2", Gettype(System.string))
            dt.Columns.Add("Path", Gettype(System.string))
            dt.Columns.Add("Flag2_VAL" , Gettype(System.Int16))
            dt.Columns.Add("Flag2", Gettype(System.string))
            dt.Columns.Add("ProcessDocument_ID" , GetType(System.guid))
            dt.Columns.Add("ProcessDocument", Gettype(System.string))
            dt.Columns.Add("SubProcDocument", Gettype(System.string))
            dt.Columns.Add("SubProcessType_ID" , GetType(System.guid))
            dt.Columns.Add("SubProcessType", Gettype(System.string))
            dt.Columns.Add("ObjectType_ID" , GetType(System.guid))
            dt.Columns.Add("ObjectType", Gettype(System.string))
            dt.Columns.Add("Value2", Gettype(System.string))
            dt.Columns.Add("DocumentPart_ID" , GetType(System.guid))
            dt.Columns.Add("DocumentPart", Gettype(System.string))
            dt.Columns.Add("ProcessParameter4_ID" , GetType(System.guid))
            dt.Columns.Add("ProcessParameter4", Gettype(System.string))
            dt.Columns.Add("ProcessParameter2_ID" , GetType(System.guid))
            dt.Columns.Add("ProcessParameter2", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFFD_ATTR1
        End Function
        Public Function GetItem( vIndex as object ) As WFFD.WFFD_ATTR1
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFFD.WFFD_ATTR1))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFFD.WFFD_ATTR1
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



