


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFFR
    Public Class WFFR_func_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFFR_func"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("CreateAt", GetType(System.DateTime))
            dt.Columns.Add("Priority", Gettype(System.Int32))
            dt.Columns.Add("WorkPercent", Gettype(System.Int32))
            dt.Columns.Add("BasedOn_ID" , GetType(System.guid))
            dt.Columns.Add("BasedOn", Gettype(System.string))
            dt.Columns.Add("LastStateScan", GetType(System.DateTime))
            dt.Columns.Add("FuncResult", Gettype(System.string))
            dt.Columns.Add("PassNo", Gettype(System.Int32))
            dt.Columns.Add("ChangePriorityTime", GetType(System.DateTime))
            dt.Columns.Add("LastStart", GetType(System.DateTime))
            dt.Columns.Add("Info", Gettype(System.string))
            dt.Columns.Add("State_VAL" , Gettype(System.Int16))
            dt.Columns.Add("State", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFFR_func
        End Function
        Public Function GetItem( vIndex as object ) As WFFR.WFFR_func
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFFR.WFFR_func))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFFR.WFFR_func
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



