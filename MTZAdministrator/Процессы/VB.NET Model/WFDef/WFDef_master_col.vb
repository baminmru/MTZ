


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFDef
    Public Class WFDef_master_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFDef_master"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("AllowCheckState_VAL" , Gettype(System.Int16))
            dt.Columns.Add("AllowCheckState", Gettype(System.string))
            dt.Columns.Add("AllowAnaliz_VAL" , Gettype(System.Int16))
            dt.Columns.Add("AllowAnaliz", Gettype(System.string))
            dt.Columns.Add("TheGroup_ID" , GetType(System.guid))
            dt.Columns.Add("TheGroup", Gettype(System.string))
            dt.Columns.Add("AllowControl_VAL" , Gettype(System.Int16))
            dt.Columns.Add("AllowControl", Gettype(System.string))
            dt.Columns.Add("AllowStart_VAL" , Gettype(System.Int16))
            dt.Columns.Add("AllowStart", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFDef_master
        End Function
        Public Function GetItem( vIndex as object ) As WFDef.WFDef_master
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFDef.WFDef_master))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFDef.WFDef_master
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



