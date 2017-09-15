


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFRtm
    Public Class WFRtm_Pcomm_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFRtm_Pcomm"
        End Function

        Public Overrides Function IsTree() As Boolean
            IsTree=true
        End Function
        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("Subject", Gettype(System.string))
            dt.Columns.Add("Author_ID" , GetType(System.guid))
            dt.Columns.Add("Author", Gettype(System.string))
            dt.Columns.Add("Attachment", GetType(System.object))
            dt.Columns.Add("Message", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFRtm_Pcomm
        End Function
        Public Function GetItem( vIndex as object ) As WFRtm.WFRtm_Pcomm
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFRtm.WFRtm_Pcomm))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFRtm.WFRtm_Pcomm
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



