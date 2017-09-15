


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFDic
    Public Class WFDic_func_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFDic_func"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("StepClass_VAL" , Gettype(System.Int16))
            dt.Columns.Add("StepClass", Gettype(System.string))
            dt.Columns.Add("the_Comment", Gettype(System.string))
            dt.Columns.Add("ProgID", Gettype(System.string))
            dt.Columns.Add("RTMProgID", Gettype(System.string))
            dt.Columns.Add("IsMailStone_VAL" , Gettype(System.Int16))
            dt.Columns.Add("IsMailStone", Gettype(System.string))
            dt.Columns.Add("Name", Gettype(System.string))
            dt.Columns.Add("IntegrationData2", Gettype(System.string))
            dt.Columns.Add("EdtMode", Gettype(System.string))
            dt.Columns.Add("IconName", Gettype(System.string))
            dt.Columns.Add("IntegrationData1", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFDic_func
        End Function
        Public Function GetItem( vIndex as object ) As WFDic.WFDic_func
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFDic.WFDic_func))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFDic.WFDic_func
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



