


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFRtm
    Public Class WFRtm_Doc_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFRtm_Doc"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("Document_ID" , GetType(System.guid))
            dt.Columns.Add("Document", Gettype(System.string))
            dt.Columns.Add("BasedOn_ID" , GetType(System.guid))
            dt.Columns.Add("BasedOn", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFRtm_Doc
        End Function
        Public Function GetItem( vIndex as object ) As WFRtm.WFRtm_Doc
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFRtm.WFRtm_Doc))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFRtm.WFRtm_Doc
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



